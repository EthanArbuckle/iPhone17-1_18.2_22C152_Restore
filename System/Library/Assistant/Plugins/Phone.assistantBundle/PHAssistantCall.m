@interface PHAssistantCall
+ (BOOL)isEmergencyNumberOrIsWhiteListed:(id)a3 forProvider:(id)a4;
- (BOOL)hasComputedBackingContact;
- (BOOL)hasComputedDestinationHandle;
- (BOOL)isCarPlayActive;
- (BOOL)shouldApplyInternationalAssist;
- (CNContact)backingContact;
- (CoreTelephonyClient)telephonyClient;
- (NSBundle)voiceDialBundle;
- (OS_dispatch_queue)serialQueue;
- (PHAssistantCall)initWithDictionary:(id)a3;
- (TUHandle)destinationHandle;
- (id)ISOCountryCode;
- (id)_copyExceptionsForCountryCode:(id)a3;
- (id)_validate;
- (id)_voiceDialBundle;
- (id)appPunchOutDialRequestWithEndpointIDSDestinationURI:(id)a3;
- (id)destinationID;
- (void)_addFaceTimeAvailabilityListener;
- (void)_performAppPunchOutWithDialRequest:(id)a3 withServiceHelper:(id)a4 completion:(id)a5;
- (void)_removeFaceTimeAvailabilityListener;
- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4;
@end

@implementation PHAssistantCall

- (PHAssistantCall)initWithDictionary:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)PHAssistantCall;
  v3 = [(PHAssistantCall *)&v16 initWithDictionary:a3];
  if (v3)
  {
    v4 = NSString;
    v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v6 = [v5 bundleIdentifier];
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    id v9 = [v4 stringWithFormat:@"%@.%@", v6, v8];
    dispatch_queue_t v10 = dispatch_queue_create((const char *)[v9 UTF8String], 0);
    serialQueue = v3->_serialQueue;
    v3->_serialQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x263F02D30]) initWithQueue:v3->_serialQueue];
    telephonyClient = v3->_telephonyClient;
    v3->_telephonyClient = (CoreTelephonyClient *)v12;

    voiceDialBundle = v3->_voiceDialBundle;
    v3->_voiceDialBundle = 0;

    [(PHAssistantCall *)v3 _addFaceTimeAvailabilityListener];
  }
  return v3;
}

- (CNContact)backingContact
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (!self->_hasComputedBackingContact)
  {
    self->_hasComputedBackingContact = 1;
    v3 = [(SAPhoneCall *)self callRecipient];
    v4 = [v3 object];
    v5 = [v4 identifier];

    v6 = PHDefaultLog();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        *(_DWORD *)buf = 138412290;
        v21 = v5;
        _os_log_impl(&dword_2352C7000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to find contact with Siri URL: %@", buf, 0xCu);
      }

      v8 = [MEMORY[0x263F333F8] contactIDFromAssistantID:v5];
      uint64_t v9 = *MEMORY[0x263EFDF80];
      v19[0] = *MEMORY[0x263EFDFE0];
      v19[1] = v9;
      v19[2] = *MEMORY[0x263EFE070];
      dispatch_queue_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:3];
      v11 = +[PHAssistantServices sharedContactStore];
      id v18 = 0;
      uint64_t v12 = [v11 unifiedContactWithIdentifier:v8 keysToFetch:v10 error:&v18];
      v6 = v18;

      if (v12)
      {
        v13 = PHDefaultLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v12;
          _os_log_impl(&dword_2352C7000, v13, OS_LOG_TYPE_DEFAULT, "Found contact: %@", buf, 0xCu);
        }

        v14 = v12;
        p_super = &self->_backingContact->super;
        self->_backingContact = v14;
      }
      else if (v6 && [v6 code] == 200)
      {
        p_super = PHDefaultLog();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v8;
          _os_log_impl(&dword_2352C7000, p_super, OS_LOG_TYPE_DEFAULT, "[WARN] No contact found with identifier: %@", buf, 0xCu);
        }
      }
      else
      {
        p_super = PHDefaultLog();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
          sub_2352CD3E8();
        }
      }
    }
    else
    {
      if (!v7)
      {
LABEL_19:

        goto LABEL_20;
      }
      v8 = [(SAPhoneCall *)self callRecipient];
      dispatch_queue_t v10 = [v8 object];
      *(_DWORD *)buf = 138412290;
      v21 = v10;
      _os_log_impl(&dword_2352C7000, v6, OS_LOG_TYPE_DEFAULT, "[WARN] No URL found for SAPerson: %@", buf, 0xCu);
    }

    goto LABEL_19;
  }
LABEL_20:
  backingContact = self->_backingContact;

  return backingContact;
}

- (TUHandle)destinationHandle
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  unint64_t v3 = 0x2687F5000;
  if (!self->_hasComputedDestinationHandle)
  {
    self->_hasComputedDestinationHandle = 1;
    v4 = [(SAPhoneCall *)self callRecipient];
    v5 = [v4 typedData];

    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    BOOL v7 = [v5 label];
    v8 = [(PHAssistantCall *)self backingContact];
    uint64_t v9 = v8;
    if (isKindOfClass)
    {
      long long v60 = 0uLL;
      long long v61 = 0uLL;
      long long v58 = 0uLL;
      long long v59 = 0uLL;
      dispatch_queue_t v10 = [v8 emailAddresses];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v58 objects:v67 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        char v52 = isKindOfClass;
        v53 = v9;
        uint64_t v13 = *(void *)v59;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v59 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v58 + 1) + 8 * i);
            objc_super v16 = [v15 label];
            int v17 = [v16 isEqualToString:v7];

            if (v17)
            {
              v26 = PHDefaultLog();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                v27 = [v15 value];
                *(_DWORD *)buf = 138412546;
                v64 = v7;
                __int16 v65 = 2112;
                v66 = v27;
                _os_log_impl(&dword_2352C7000, v26, OS_LOG_TYPE_DEFAULT, "Found email address with matching label %@: %@", buf, 0x16u);
              }
              v25 = [v15 value];
              goto LABEL_28;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v58 objects:v67 count:16];
          if (v12) {
            continue;
          }
          break;
        }
LABEL_20:
        v25 = 0;
        unint64_t v3 = 0x2687F5000;
        uint64_t v9 = v53;
LABEL_29:
        char isKindOfClass = v52;
LABEL_30:

        if (v25) {
          goto LABEL_50;
        }
        v32 = PHDefaultLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v64 = v5;
          _os_log_impl(&dword_2352C7000, v32, OS_LOG_TYPE_DEFAULT, "Could not determine a destination ID from the backing contact. Checking if a destination ID was explicitly encoded in typed data: %@", buf, 0xCu);
        }

        id v33 = v5;
        v34 = v33;
        if (isKindOfClass)
        {
          v35 = [v33 emailAddress];

          v36 = PHDefaultLog();
          BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
          if (v35)
          {
            if (v37)
            {
              v38 = [v34 emailAddress];
              *(_DWORD *)buf = 138412290;
              v64 = v38;
              _os_log_impl(&dword_2352C7000, v36, OS_LOG_TYPE_DEFAULT, "Explicit destinationID was encoded in the SAEmail: %@", buf, 0xCu);
            }
            uint64_t v39 = [v34 emailAddress];
LABEL_42:
            v25 = v39;
            goto LABEL_49;
          }
          if (v37)
          {
            *(_WORD *)buf = 0;
            v43 = "No destinationID was explicitly encoded in the SAEmail";
LABEL_47:
            _os_log_impl(&dword_2352C7000, v36, OS_LOG_TYPE_DEFAULT, v43, buf, 2u);
          }
        }
        else
        {
          v40 = [v33 number];

          v36 = PHDefaultLog();
          BOOL v41 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
          if (v40)
          {
            if (v41)
            {
              v42 = [v34 number];
              *(_DWORD *)buf = 138412290;
              v64 = v42;
              _os_log_impl(&dword_2352C7000, v36, OS_LOG_TYPE_DEFAULT, "Explicit destinationID was encoded in the SAPhone: %@", buf, 0xCu);
            }
            uint64_t v39 = [v34 number];
            goto LABEL_42;
          }
          if (v41)
          {
            *(_WORD *)buf = 0;
            v43 = "No destinationID was explicitly encoded in the SAPhone";
            goto LABEL_47;
          }
        }

        v25 = 0;
LABEL_49:

        if (!v25)
        {
          v25 = PHDefaultLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v50 = [(SAPhoneCall *)self callRecipient];
            v51 = [v50 typedData];
            *(_DWORD *)buf = 138412290;
            v64 = v51;
            _os_log_impl(&dword_2352C7000, v25, OS_LOG_TYPE_DEFAULT, "[WARN] No destination found for %@", buf, 0xCu);
          }
          goto LABEL_54;
        }
LABEL_50:
        if (isKindOfClass) {
          uint64_t v44 = 3;
        }
        else {
          uint64_t v44 = 2;
        }
        v45 = (objc_class *)[objc_alloc(MEMORY[0x263F7E248]) initWithType:v44 value:v25];
        uint64_t v46 = *(int *)(v3 + 2304);
        v47 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v46);
        *(Class *)((char *)&self->super.super.super.super.super.super.isa + v46) = v45;

LABEL_54:
        goto LABEL_55;
      }
    }
    else
    {
      long long v56 = 0uLL;
      long long v57 = 0uLL;
      long long v54 = 0uLL;
      long long v55 = 0uLL;
      dispatch_queue_t v10 = [v8 phoneNumbers];
      uint64_t v18 = [v10 countByEnumeratingWithState:&v54 objects:v62 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        char v52 = isKindOfClass;
        v53 = v9;
        uint64_t v20 = *(void *)v55;
        while (2)
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v55 != v20) {
              objc_enumerationMutation(v10);
            }
            uint64_t v22 = *(void **)(*((void *)&v54 + 1) + 8 * j);
            v23 = [v22 label];
            int v24 = [v23 isEqualToString:v7];

            if (v24)
            {
              v28 = PHDefaultLog();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                v29 = [v22 value];
                v30 = [v29 stringValue];
                *(_DWORD *)buf = 138412546;
                v64 = v7;
                __int16 v65 = 2112;
                v66 = v30;
                _os_log_impl(&dword_2352C7000, v28, OS_LOG_TYPE_DEFAULT, "Found phone number with matching label %@: %@", buf, 0x16u);
              }
              v31 = [v22 value];
              v25 = [v31 stringValue];

LABEL_28:
              unint64_t v3 = 0x2687F5000uLL;
              uint64_t v9 = v53;
              goto LABEL_29;
            }
          }
          uint64_t v19 = [v10 countByEnumeratingWithState:&v54 objects:v62 count:16];
          if (v19) {
            continue;
          }
          goto LABEL_20;
        }
      }
    }
    v25 = 0;
    goto LABEL_30;
  }
LABEL_55:
  v48 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + *(int *)(v3 + 2304));

  return (TUHandle *)v48;
}

- (id)destinationID
{
  v2 = [(PHAssistantCall *)self destinationHandle];
  unint64_t v3 = [v2 value];

  return v3;
}

- (void)_addFaceTimeAvailabilityListener
{
  v2 = [MEMORY[0x263F3BAD8] sharedInstance];
  [v2 addListenerID:@"com.apple.assistant" forService:2];

  id v3 = [MEMORY[0x263F3BAD8] sharedInstance];
  [v3 addListenerID:@"com.apple.assistant" forService:0];
}

- (void)_removeFaceTimeAvailabilityListener
{
  v2 = [MEMORY[0x263F3BAD8] sharedInstance];
  [v2 removeListenerID:@"com.apple.assistant" forService:2];

  id v3 = [MEMORY[0x263F3BAD8] sharedInstance];
  [v3 removeListenerID:@"com.apple.assistant" forService:0];
}

- (BOOL)shouldApplyInternationalAssist
{
  v2 = [(SAPhoneCall *)self callRecipient];
  id v3 = [v2 object];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isCarPlayActive
{
  v2 = [MEMORY[0x263F1C920] _carScreen];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_voiceDialBundle
{
  voiceDialBundle = self->_voiceDialBundle;
  if (!voiceDialBundle)
  {
    BOOL v4 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/VoiceServices/PlugIns/VoiceDial.vsplugin"];
    v5 = self->_voiceDialBundle;
    self->_voiceDialBundle = v4;

    voiceDialBundle = self->_voiceDialBundle;
  }

  return voiceDialBundle;
}

- (id)ISOCountryCode
{
  if ([(PHAssistantCall *)self shouldApplyInternationalAssist]
    || (v2 = (void *)CPPhoneNumberCopyNetworkCountryCode()) == 0)
  {
    v2 = (void *)CPPhoneNumberCopyHomeCountryCode();
  }

  return v2;
}

- (id)_copyExceptionsForCountryCode:(id)a3
{
  if (!a3) {
    return 0;
  }
  BOOL v4 = [NSString stringWithFormat:@"Exceptions-%@", a3];
  v5 = [(PHAssistantCall *)self _voiceDialBundle];
  v6 = [v5 URLForResource:v4 withExtension:@"plist" subdirectory:@"DigitDialExceptions"];

  if (v6)
  {
    id v11 = 0;
    BOOL v7 = [MEMORY[0x263EFF8C0] arrayWithContentsOfURL:v6 error:&v11];
    id v8 = v11;
    if (!v7)
    {
      uint64_t v9 = PHDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_2352CD450();
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (BOOL)isEmergencyNumberOrIsWhiteListed:(id)a3 forProvider:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263F7E290]);
  id v8 = [v6 prioritizedSenderIdentities];
  uint64_t v9 = [v8 count];
  dispatch_queue_t v10 = PHDefaultLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v5;
      _os_log_impl(&dword_2352C7000, v10, OS_LOG_TYPE_DEFAULT, "Checking whether the digits %@ are an emergency or whitelisted telephone number.", buf, 0xCu);
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v13)
    {
      id v20 = v6;
      uint64_t v14 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v13; uint64_t i = ((char *)i + 1))
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v12);
          }
          objc_super v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          int v17 = [v16 UUID];
          int v18 = [v7 isWhitelistedEmergencyNumberForDigits:v5 senderIdentityUUID:v17];

          if (v18)
          {
            uint64_t v13 = PHDefaultLog();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v26 = v5;
              __int16 v27 = 2112;
              v28 = v16;
              _os_log_impl(&dword_2352C7000, v13, OS_LOG_TYPE_DEFAULT, "Digits %@ are an emergency or whitelisted telephone number for sender identity %@.", buf, 0x16u);
            }

            LOBYTE(v13) = 1;
            goto LABEL_16;
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v13) {
          continue;
        }
        break;
      }
LABEL_16:
      id v6 = v20;
    }
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v5;
      _os_log_impl(&dword_2352C7000, v10, OS_LOG_TYPE_DEFAULT, "Checking whether the digits %@ is an emergency or whitelisted telephone number for nil sender identity.", buf, 0xCu);
    }

    LOBYTE(v13) = [v7 isWhitelistedEmergencyNumberForDigits:v5 senderIdentityUUID:0];
  }

  return (char)v13;
}

- (id)_validate
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  BOOL v3 = [(SAPhoneCall *)self emergencyCall];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    id v5 = PHDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2352C7000, v5, OS_LOG_TYPE_DEFAULT, "-[PHAssistantCall _validate]: Call is an emergency call, passing validation", buf, 2u);
    }

    goto LABEL_5;
  }
  id v7 = [(SAPhoneCall *)self callRecipient];

  if (!v7)
  {
    id v12 = PHDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_2352CD4B8();
    }

    id v10 = objc_alloc(MEMORY[0x263F64820]);
    BOOL v11 = @"No recipient was specified";
    goto LABEL_21;
  }
  id v8 = [(PHAssistantCall *)self destinationID];

  if (!v8)
  {
    uint64_t v13 = PHDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_2352CD4EC();
    }

    id v10 = objc_alloc(MEMORY[0x263F64820]);
    BOOL v11 = @"No destination ID was specified";
    goto LABEL_21;
  }
  if ([(SAPhoneCall *)self faceTime])
  {
    if ([MEMORY[0x263F7E198] supportsDisplayingFaceTimeVideoCalls])
    {
      if ([MEMORY[0x263F7E198] supportsFaceTimeVideoCalls])
      {
        if ([(PHAssistantCall *)self isCarPlayActive])
        {
          uint64_t v9 = PHDefaultLog();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            sub_2352CD520();
          }

          id v10 = objc_alloc(MEMORY[0x263F64820]);
          BOOL v11 = @"FaceTime video not supported in CarPlay";
LABEL_21:
          uint64_t v14 = [v10 initWithReason:v11];
LABEL_45:
          id v6 = (void *)v14;
          goto LABEL_46;
        }
        goto LABEL_72;
      }
      v15 = PHDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_2352CD5F0();
      }
      goto LABEL_37;
    }
    objc_super v16 = PHDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_2352CD624();
    }
LABEL_40:

    id v20 = objc_alloc(MEMORY[0x263F64820]);
    long long v21 = (void *)MEMORY[0x263F65160];
    goto LABEL_44;
  }
  if (![(SAPhoneCall *)self faceTimeAudio])
  {
    if (([MEMORY[0x263F7E198] supportsTelephonyCalls] & 1) == 0)
    {
      long long v22 = PHDefaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_2352CD7A0();
      }

      id v20 = objc_alloc(MEMORY[0x263F64820]);
      long long v21 = (void *)MEMORY[0x263F65A80];
      goto LABEL_44;
    }
    if ([MEMORY[0x263F7E198] canAttemptTelephonyCallsWithoutCellularConnection]) {
      goto LABEL_72;
    }
    id v17 = objc_alloc_init(MEMORY[0x263F255D8]);
    if ([v17 airplaneMode])
    {
      int v18 = PHDefaultLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_2352CD6C0();
      }
      uint64_t v19 = (void *)MEMORY[0x263F65A68];
LABEL_98:

      id v6 = (void *)[objc_alloc(MEMORY[0x263F64820]) initWithErrorCode:*v19];
      goto LABEL_99;
    }
    if (![MEMORY[0x263F7E198] supportsPrimaryCalling])
    {
LABEL_71:

      goto LABEL_72;
    }
    long long v24 = [(PHAssistantCall *)self telephonyClient];
    char v25 = objc_opt_respondsToSelector();

    if ((v25 & 1) == 0)
    {
LABEL_95:
      int v18 = PHDefaultLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_2352CD6F4();
      }
      uint64_t v19 = (void *)MEMORY[0x263F65A98];
      goto LABEL_98;
    }
    id v26 = [(PHAssistantCall *)self telephonyClient];
    id v59 = 0;
    __int16 v27 = [v26 getSubscriptionInfoWithError:&v59];
    id v28 = v59;

    if (v27)
    {
      v50 = v27;
      [v27 subscriptionsInUse];
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v29 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
      if (v29)
      {
        uint64_t v31 = v29;
        uint64_t v32 = *(void *)v56;
        uint64_t v52 = *MEMORY[0x263F03008];
        uint64_t v51 = *MEMORY[0x263F03010];
        *(void *)&long long v30 = 138412546;
        long long v49 = v30;
        while (2)
        {
          uint64_t v33 = 0;
          v34 = v28;
          do
          {
            if (*(void *)v56 != v32) {
              objc_enumerationMutation(obj);
            }
            v35 = *(void **)(*((void *)&v55 + 1) + 8 * v33);
            if (objc_msgSend(v35, "isSimHidden", v49))
            {
              id v28 = v34;
            }
            else
            {
              v36 = [(PHAssistantCall *)self telephonyClient];
              id v54 = v34;
              BOOL v37 = (void *)[v36 copyRegistrationStatus:v35 error:&v54];
              id v28 = v54;

              if (([v37 isEqualToString:v52] & 1) != 0
                || ([v37 isEqualToString:v51] & 1) != 0)
              {

                goto LABEL_71;
              }
              if (!v37 && v28)
              {
                v38 = PHDefaultLog();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v49;
                  id v61 = v28;
                  __int16 v62 = 2112;
                  id v63 = v35;
                  _os_log_error_impl(&dword_2352C7000, v38, OS_LOG_TYPE_ERROR, "Retrieving registration status failed with error %@ for subscription context %@.", buf, 0x16u);
                }
              }
              v34 = v28;
            }
            ++v33;
          }
          while (v31 != v33);
          uint64_t v31 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
          if (v31) {
            continue;
          }
          break;
        }
      }

      uint64_t v39 = v50;
    }
    else
    {
      if (!v28)
      {
LABEL_94:

        goto LABEL_95;
      }
      uint64_t v39 = PHDefaultLog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        sub_2352CD728((uint64_t)v28, v39);
      }
    }

    goto LABEL_94;
  }
  if (([MEMORY[0x263F7E198] supportsDisplayingFaceTimeAudioCalls] & 1) == 0)
  {
    objc_super v16 = PHDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_2352CD68C();
    }
    goto LABEL_40;
  }
  if (([MEMORY[0x263F7E198] supportsFaceTimeAudioCalls] & 1) == 0)
  {
    v15 = PHDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_2352CD658();
    }
LABEL_37:

    id v20 = objc_alloc(MEMORY[0x263F64820]);
    long long v21 = (void *)MEMORY[0x263F65A90];
LABEL_44:
    uint64_t v14 = [v20 initWithErrorCode:*v21];
    goto LABEL_45;
  }
LABEL_72:
  id v17 = [(SAPhoneCall *)self callRecipient];
  if (!v17 || [(SAPhoneCall *)self faceTime]) {
    goto LABEL_74;
  }
  BOOL v40 = [(SAPhoneCall *)self faceTimeAudio];

  if (v40) {
    goto LABEL_5;
  }
  uint64_t v41 = [(PHAssistantCall *)self ISOCountryCode];
  if (!v41)
  {
    uint64_t v46 = PHDefaultLog();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      sub_2352CD554();
    }

    id v10 = objc_alloc(MEMORY[0x263F64820]);
    BOOL v11 = @"Device has no country code";
    goto LABEL_21;
  }
  id v17 = (id)v41;
  v42 = [(PHAssistantCall *)self destinationID];
  if (PNIsValidPhoneNumberForCountry())
  {
LABEL_83:

LABEL_74:
LABEL_5:
    id v6 = 0;
    goto LABEL_46;
  }
  id v43 = [(PHAssistantCall *)self _copyExceptionsForCountryCode:v17];
  uint64_t v44 = v43;
  if (v43 && [v43 containsObject:v42])
  {
    v45 = PHDefaultLog();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v61 = v42;
      __int16 v62 = 2112;
      id v63 = v17;
      _os_log_impl(&dword_2352C7000, v45, OS_LOG_TYPE_DEFAULT, "-[PHAssistantCall _validate]: Destination ID %@ is an exception for country %@, passing validation", buf, 0x16u);
    }

    goto LABEL_83;
  }
  v47 = PHDefaultLog();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
    sub_2352CD588();
  }

  id v48 = objc_alloc(MEMORY[0x263F64820]);
  id v6 = (void *)[v48 initWithErrorCode:*MEMORY[0x263F65A88]];

LABEL_99:
LABEL_46:

  return v6;
}

- (id)appPunchOutDialRequestWithEndpointIDSDestinationURI:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F7E1B0]);
  id v6 = [(PHAssistantCall *)self destinationID];
  id v7 = [(SAPhoneCall *)self emergencyCall];
  int v8 = [v7 BOOLValue];

  if (!v8)
  {
    if ([(SAPhoneCall *)self faceTime] || [(SAPhoneCall *)self faceTimeAudio])
    {
      uint64_t v18 = [v5 faceTimeProvider];
    }
    else
    {
      uint64_t v18 = [v5 telephonyProvider];
    }
    id v17 = (void *)v18;
    id v12 = (void *)[objc_alloc(MEMORY[0x263F7E230]) initWithProvider:v18];
    objc_msgSend(v12, "setVideo:", -[SAPhoneCall faceTime](self, "faceTime"));
    [v12 setDestinationID:v6];
    uint64_t v19 = [(PHAssistantCall *)self backingContact];
    id v20 = [v19 identifier];
    [v12 setContactIdentifier:v20];

    objc_msgSend(v12, "setPerformDialAssist:", -[PHAssistantCall shouldApplyInternationalAssist](self, "shouldApplyInternationalAssist"));
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v9 = PHDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    long long v24 = v6;
    _os_log_impl(&dword_2352C7000, v9, OS_LOG_TYPE_DEFAULT, "Siri punch out URL is handling an emergency call request, with destination ID %@", (uint8_t *)&v23, 0xCu);
  }

  id v10 = objc_alloc(MEMORY[0x263F7E230]);
  BOOL v11 = [v5 emergencyProvider];
  id v12 = (void *)[v10 initWithProvider:v11];

  [v12 setPerformDialAssist:0];
  uint64_t v13 = [v5 emergencyProvider];
  BOOL v14 = +[PHAssistantCall isEmergencyNumberOrIsWhiteListed:v6 forProvider:v13];

  v15 = PHDefaultLog();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v6 && v14)
  {
    if (v16)
    {
      int v23 = 138412290;
      long long v24 = v6;
      _os_log_impl(&dword_2352C7000, v15, OS_LOG_TYPE_DEFAULT, "The destinationID is whitelisted as an emergency number, so the punch out URL will contain the destinationID: %@", (uint8_t *)&v23, 0xCu);
    }

    id v17 = [(PHAssistantCall *)self destinationHandle];
    [v12 setHandle:v17];
    goto LABEL_17;
  }
  if (v16)
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_2352C7000, v15, OS_LOG_TYPE_DEFAULT, "The destinationID is NOT whitelisted, so we will not include the destinationID in the URL but dial a generic emergency number", (uint8_t *)&v23, 2u);
  }

  [v12 setDialType:1];
LABEL_18:
  if ([(SAPhoneCall *)self speakerphoneCall]) {
    [v12 setAudioSourceIdentifier:*MEMORY[0x263F7E370]];
  }
  [v12 setEndpointIDSDestinationURI:v4];
  [v12 setOriginatingUIType:11];
  long long v21 = PHDefaultLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    long long v24 = v12;
    _os_log_impl(&dword_2352C7000, v21, OS_LOG_TYPE_DEFAULT, "Siri punch out URL created dial request %@", (uint8_t *)&v23, 0xCu);
  }

  return v12;
}

- (void)_performAppPunchOutWithDialRequest:(id)a3 withServiceHelper:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = PHDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v8;
    _os_log_impl(&dword_2352C7000, v11, OS_LOG_TYPE_DEFAULT, "dialRequest: %@", buf, 0xCu);
  }

  id v12 = [v8 URL];
  if (v12)
  {
    id v13 = objc_alloc_init(MEMORY[0x263F64EE0]);
    BOOL v14 = [(PHAssistantCall *)self refId];
    [v13 setRefId:v14];

    [v13 setPunchOutUri:v12];
    v15 = PHDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v13;
      _os_log_impl(&dword_2352C7000, v15, OS_LOG_TYPE_DEFAULT, "appPunchOut: %@", buf, 0xCu);
    }

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = sub_2352CA984;
    v16[3] = &unk_264C4CEF8;
    id v17 = v12;
    id v18 = v8;
    id v19 = v10;
    [v9 handleCommand:v13 completion:v16];
  }
  else
  {
    id v13 = (id)[objc_alloc(MEMORY[0x263F64820]) initWithReason:@"Unable to call recipient"];
    (*((void (**)(id, id))v10 + 2))(v10, v13);
  }
}

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  int v23 = sub_2352CAC58;
  long long v24 = sub_2352CAC68;
  id v25 = [(PHAssistantCall *)self _validate];
  id v8 = (void *)v21[5];
  if (!v8)
  {
    id v10 = (void *)MEMORY[0x263F7E1A0];
    BOOL v11 = [(PHAssistantCall *)self serialQueue];
    id v12 = [v10 callCenterWithQueue:v11];

    id v13 = [(PHAssistantCall *)self serialQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2352CAC70;
    block[3] = &unk_264C4CF48;
    id v15 = v12;
    id v19 = &v20;
    id v18 = v6;
    id v16 = v7;
    id v17 = self;
    id v9 = v12;
    dispatch_sync(v13, block);

    goto LABEL_5;
  }
  if (v6)
  {
    id v9 = [v8 dictionary];
    (*((void (**)(id, id))v6 + 2))(v6, v9);
LABEL_5:
  }
  _Block_object_dispose(&v20, 8);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (CoreTelephonyClient)telephonyClient
{
  return self->_telephonyClient;
}

- (NSBundle)voiceDialBundle
{
  return self->_voiceDialBundle;
}

- (BOOL)hasComputedDestinationHandle
{
  return self->_hasComputedDestinationHandle;
}

- (BOOL)hasComputedBackingContact
{
  return self->_hasComputedBackingContact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceDialBundle, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_destinationHandle, 0);

  objc_storeStrong((id *)&self->_backingContact, 0);
}

@end