@interface VSPrivacyFacade
- (BOOL)isAccessGrantedForAuditToken:(id *)a3;
- (BOOL)isAccessGrantedForBundle:(__CFBundle *)a3;
- (BOOL)isAccessGrantedForBundleID:(id)a3;
- (BOOL)reset;
- (BOOL)setAccessGranted:(BOOL)a3 forAuditToken:(id *)a4;
- (BOOL)setAccessGranted:(BOOL)a3 forBundle:(__CFBundle *)a4;
- (BOOL)setAccessGranted:(BOOL)a3 forBundleID:(id)a4;
- (NSArray)knownAppBundles;
- (NSOperationQueue)privateQueue;
- (NSString)service;
- (VSPrivacyFacade)init;
- (VSPrivacyFacade)initWithService:(id)a3 voucherLockbox:(id)a4;
- (VSPrivacyFacade)initWithVoucherLockbox:(id)a3;
- (VSPrivacyVoucherLockbox)voucherLockbox;
- (id)_voucherForProcess:(int)a3 providerID:(id)a4;
- (void)_promptForAccessUsingAuditToken:(id *)a3 processIdentifier:(int)a4 identityProviderDisplayName:(id)a5 providerIsSupported:(BOOL)a6 completionHandler:(id)a7;
- (void)preflightCheckForProcessIdentifier:(int)a3 withCompletionHandler:(id)a4;
- (void)requestAccessForAuditToken:(id *)a3 processIdentifier:(int)a4 identityProviderDisplayName:(id)a5 providerIsSupported:(BOOL)a6 identityProviderID:(id)a7 allowUI:(BOOL)a8 completionHandler:(id)a9;
- (void)setPrivateQueue:(id)a3;
- (void)setService:(id)a3;
- (void)setVoucherLockbox:(id)a3;
@end

@implementation VSPrivacyFacade

- (VSPrivacyFacade)initWithService:(id)a3 voucherLockbox:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VSPrivacyFacade;
  v8 = [(VSPrivacyFacade *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    service = v8->_service;
    v8->_service = (NSString *)v9;

    objc_storeStrong((id *)&v8->_voucherLockbox, a4);
    v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    privateQueue = v8->_privateQueue;
    v8->_privateQueue = v11;

    [(NSOperationQueue *)v8->_privateQueue setName:@"VSPrivacyFacade"];
    [(NSOperationQueue *)v8->_privateQueue setMaxConcurrentOperationCount:1];
  }

  return v8;
}

- (VSPrivacyFacade)initWithVoucherLockbox:(id)a3
{
  return [(VSPrivacyFacade *)self initWithService:*MEMORY[0x1E4FA9A98] voucherLockbox:a3];
}

- (VSPrivacyFacade)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (void)preflightCheckForProcessIdentifier:(int)a3 withCompletionHandler:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, uint64_t))a4;
  id v7 = VSDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v34) = 0;
    _os_log_impl(&dword_1DA674000, v7, OS_LOG_TYPE_DEFAULT, "Will preflight for pid.", (uint8_t *)&v34, 2u);
  }

  v8 = VSBundleURLForProcessIdentifier(a3);
  if (!v8)
  {
    v18 = VSErrorLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[VSPrivacyFacade preflightCheckForProcessIdentifier:withCompletionHandler:](a3, v18);
    }

    goto LABEL_17;
  }
  uint64_t Unique = _CFBundleCreateUnique();
  if (!Unique)
  {
    v19 = VSErrorLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[VSPrivacyFacade preflightCheckForProcessIdentifier:withCompletionHandler:]((uint64_t)v8, v19);
    }

LABEL_17:
    uint64_t v17 = 0;
    goto LABEL_35;
  }
  v10 = (const void *)Unique;
  CFArrayRef v11 = (const __CFArray *)TCCAccessCopyInformationForBundle();
  if (v11)
  {
    CFArrayRef v12 = v11;
    if (CFArrayGetCount(v11) < 1)
    {
LABEL_10:
      uint64_t v17 = 0;
    }
    else
    {
      CFIndex v13 = 0;
      objc_super v14 = (const void **)MEMORY[0x1E4FA9A00];
      while (1)
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v12, v13);
        CFStringRef Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, *v14);
        if (CFEqual(Value, (CFStringRef)[(VSPrivacyFacade *)self service])) {
          break;
        }
        if (++v13 >= CFArrayGetCount(v12)) {
          goto LABEL_10;
        }
      }
      CFBooleanRef v21 = (const __CFBoolean *)CFDictionaryGetValue(ValueAtIndex, (const void *)*MEMORY[0x1E4FA99E8]);
      if (v21)
      {
        int v22 = CFBooleanGetValue(v21);
        v23 = VSDefaultLogObject();
        BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
        if (v22)
        {
          if (v24)
          {
            LOWORD(v34) = 0;
            _os_log_impl(&dword_1DA674000, v23, OS_LOG_TYPE_DEFAULT, "TCC status is granted.", (uint8_t *)&v34, 2u);
          }
          uint64_t v17 = 1;
        }
        else if (v24)
        {
          LOWORD(v34) = 0;
          uint64_t v17 = 2;
          _os_log_impl(&dword_1DA674000, v23, OS_LOG_TYPE_DEFAULT, "TCC status is denied.", (uint8_t *)&v34, 2u);
        }
        else
        {
          uint64_t v17 = 2;
        }
      }
      else
      {
        v23 = VSErrorLogObject();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[VSPrivacyFacade preflightCheckForProcessIdentifier:withCompletionHandler:].cold.4(v23, v25, v26, v27, v28, v29, v30, v31);
        }
        uint64_t v17 = 0;
      }
    }
    CFRelease(v12);
  }
  else
  {
    v20 = VSErrorLogObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[VSPrivacyFacade preflightCheckForProcessIdentifier:withCompletionHandler:]((uint64_t)v10, v20);
    }

    uint64_t v17 = 0;
  }
  CFRelease(v10);
LABEL_35:
  v32 = VSDefaultLogObject();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = [NSNumber numberWithUnsignedInteger:v17];
    int v34 = 138412290;
    v35 = v33;
    _os_log_impl(&dword_1DA674000, v32, OS_LOG_TYPE_DEFAULT, "Will call preflight completion handler with result %@", (uint8_t *)&v34, 0xCu);
  }
  v6[2](v6, v17);
}

- (BOOL)isAccessGrantedForAuditToken:(id *)a3
{
  return TCCAccessCheckAuditToken() != 0;
}

- (BOOL)setAccessGranted:(BOOL)a3 forAuditToken:(id *)a4
{
  return TCCAccessSetForAuditToken() != 0;
}

- (id)_voucherForProcess:(int)a3 providerID:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = VSBundleURLForProcessIdentifier(a3);
  if (v7)
  {
    v8 = objc_msgSend(MEMORY[0x1E4F223C8], "vs_applicationRecordWithBundleURL:", v7);
    uint64_t v9 = NSNumber;
    v10 = [v8 iTunesMetadata];
    CFArrayRef v11 = objc_msgSend(v9, "numberWithUnsignedLongLong:", objc_msgSend(v10, "storeItemIdentifier"));

    CFArrayRef v12 = [v11 stringValue];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    CFIndex v13 = [(VSPrivacyFacade *)self voucherLockbox];
    objc_super v14 = [v13 unredeemedVouchers];

    id v15 = (id)[v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v15)
    {
      v23 = v11;
      BOOL v24 = v8;
      uint64_t v25 = v7;
      uint64_t v16 = *(void *)v27;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v14);
          }
          v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          v19 = [v18 appAdamID];
          if ([v19 isEqual:v12])
          {
            v20 = [v18 providerID];
            int v21 = [v20 isEqual:v6];

            if (v21)
            {
              id v15 = v18;
              goto LABEL_15;
            }
          }
          else
          {
          }
        }
        id v15 = (id)[v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v15);
LABEL_15:
      v8 = v24;
      id v7 = v25;
      CFArrayRef v11 = v23;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (void)requestAccessForAuditToken:(id *)a3 processIdentifier:(int)a4 identityProviderDisplayName:(id)a5 providerIsSupported:(BOOL)a6 identityProviderID:(id)a7 allowUI:(BOOL)a8 completionHandler:(id)a9
{
  BOOL v9 = a8;
  BOOL v11 = a6;
  uint64_t v12 = *(void *)&a4;
  id v15 = a5;
  id v16 = a7;
  uint64_t v17 = (void (**)(id, uint64_t, VSOptional *))a9;
  if (!v17) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The completionHandler parameter must not be nil."];
  }
  v18 = [(VSPrivacyFacade *)self _voucherForProcess:v12 providerID:v16];
  v19 = VSDefaultLogObject();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    if (v20)
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_1DA674000, v19, OS_LOG_TYPE_DEFAULT, "Found a voucher for process.", (uint8_t *)&v26, 2u);
    }

    int v21 = [(VSPrivacyFacade *)self voucherLockbox];
    [v21 redeemVoucher:v18];

    long long v22 = *(_OWORD *)&a3->var0[4];
    long long v26 = *(_OWORD *)a3->var0;
    long long v27 = v22;
    [(VSPrivacyFacade *)self setAccessGranted:1 forAuditToken:&v26];
    v23 = objc_alloc_init(VSOptional);
    v17[2](v17, 1, v23);
    goto LABEL_12;
  }
  if (v20)
  {
    LOWORD(v26) = 0;
    _os_log_impl(&dword_1DA674000, v19, OS_LOG_TYPE_DEFAULT, "No voucher found for process.", (uint8_t *)&v26, 2u);
  }

  if (!v9)
  {
    VSPrivateError(-12, 0);
    v23 = (VSOptional *)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = +[VSOptional optionalWithObject:v23];
    v17[2](v17, 0, v25);

LABEL_12:
    goto LABEL_13;
  }
  long long v24 = *(_OWORD *)&a3->var0[4];
  long long v26 = *(_OWORD *)a3->var0;
  long long v27 = v24;
  [(VSPrivacyFacade *)self _promptForAccessUsingAuditToken:&v26 processIdentifier:v12 identityProviderDisplayName:v15 providerIsSupported:v11 completionHandler:v17];
LABEL_13:
}

- (void)_promptForAccessUsingAuditToken:(id *)a3 processIdentifier:(int)a4 identityProviderDisplayName:(id)a5 providerIsSupported:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a5;
  id v47 = a7;
  BOOL v11 = objc_alloc_init(VSUserNotificationOperation);
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28B50], "vs_bundleForProcessIdentifier:", v8);
  CFIndex v13 = [v12 bundleIdentifier];
  objc_super v14 = +[VSOptional optionalWithObject:v13];

  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__5;
  v64 = __Block_byref_object_dispose__5;
  id v65 = 0;
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __135__VSPrivacyFacade__promptForAccessUsingAuditToken_processIdentifier_identityProviderDisplayName_providerIsSupported_completionHandler___block_invoke;
  v59[3] = &unk_1E6BD36F8;
  v59[4] = &v60;
  [v14 conditionallyUnwrapObject:v59];
  id v15 = objc_msgSend(MEMORY[0x1E4F28B50], "vs_frameworkBundle");
  if (v10)
  {
    id v16 = [v15 localizedStringForKey:@"PRIVACY_TITLE_FORMAT" value:0 table:0];

    objc_msgSend(NSString, "stringWithFormat:", v16, v61[5], v10);
  }
  else
  {
    id v16 = [v15 localizedStringForKey:@"PRIVACY_TITLE_FORMAT_GENERIC" value:0 table:0];

    objc_msgSend(NSString, "stringWithFormat:", v16, v61[5]);
  uint64_t v17 = };

  [(VSUserNotificationOperation *)v11 setTitle:v17];
  v18 = [v12 objectForInfoDictionaryKey:@"NSVideoSubscriberAccountUsageDescription"];
  v19 = v18;
  v45 = (void *)v17;
  v46 = v14;
  if (v18)
  {
    v42 = self;
    id v20 = v18;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v21 = (void *)MEMORY[0x1E4F1CA00];
        long long v22 = (objc_class *)objc_opt_class();
        v23 = NSStringFromClass(v22);
        [v21 raise:*MEMORY[0x1E4F1C3C8], @"Unexpectedly, usageValue was %@, instead of NSString.", v23 format];
      }
      id v24 = v20;
      if (!a6)
      {
        uint64_t v25 = objc_msgSend(MEMORY[0x1E4F28B50], "vs_frameworkBundle");
        long long v26 = [v25 localizedStringForKey:@"UNSUPPORTED_PROVIDER_MESSAGE_FORMAT" value:0 table:0];

        uint64_t v27 = objc_msgSend(NSString, "stringWithFormat:", v26, v61[5]);

        id v24 = (id)v27;
      }
      [(VSUserNotificationOperation *)v11 setMessage:v24];
      long long v28 = objc_msgSend(MEMORY[0x1E4F28B50], "vs_frameworkBundle");
      long long v29 = [v28 localizedStringForKey:@"PRIVACY_ALLOW_ACCESS_BUTTON_TITLE" value:0 table:0];
      [(VSUserNotificationOperation *)v11 setDefaultButtonTitle:v29];

      uint64_t v30 = objc_msgSend(MEMORY[0x1E4F28B50], "vs_frameworkBundle");
      uint64_t v31 = [v30 localizedStringForKey:@"PRIVACY_DENY_ACCESS_BUTTON_TITLE" value:0 table:0];
      [(VSUserNotificationOperation *)v11 setAlternateButtonTitle:v31];
      id v32 = v10;

      v33 = (void *)MEMORY[0x1E4F28B48];
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __135__VSPrivacyFacade__promptForAccessUsingAuditToken_processIdentifier_identityProviderDisplayName_providerIsSupported_completionHandler___block_invoke_2;
      v54[3] = &unk_1E6BD3748;
      int v34 = v11;
      v55[0] = v34;
      v55[1] = v42;
      long long v35 = *(_OWORD *)&a3->var0[4];
      long long v57 = *(_OWORD *)a3->var0;
      long long v58 = v35;
      id v56 = v47;
      uint64_t v36 = [v33 blockOperationWithBlock:v54];
      [v36 addDependency:v34];
      v37 = [(VSPrivacyFacade *)v42 privateQueue];
      [v37 addOperation:v34];
      [v37 addOperation:v36];
      v38 = (id *)v55;

      v39 = v47;
    }
    else
    {
      id v32 = v10;
      VSPrivateAccessUsageDescriptionMissing();
      v41 = v39 = v47;
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __135__VSPrivacyFacade__promptForAccessUsingAuditToken_processIdentifier_identityProviderDisplayName_providerIsSupported_completionHandler___block_invoke_2_48;
      v51[3] = &unk_1E6BD2C88;
      id v53 = v47;
      id v24 = v41;
      id v52 = v24;
      VSPerformCompletionHandler(v51);
      v38 = &v53;
    }
    id v10 = v32;
  }
  else
  {
    VSPrivateAccessUsageDescriptionMissing();
    v40 = v39 = v47;
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __135__VSPrivacyFacade__promptForAccessUsingAuditToken_processIdentifier_identityProviderDisplayName_providerIsSupported_completionHandler___block_invoke_3;
    v48[3] = &unk_1E6BD2C88;
    id v50 = v47;
    id v20 = v40;
    id v49 = v20;
    VSPerformCompletionHandler(v48);

    id v24 = v50;
  }

  _Block_object_dispose(&v60, 8);
}

uint64_t __135__VSPrivacyFacade__promptForAccessUsingAuditToken_processIdentifier_identityProviderDisplayName_providerIsSupported_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = VSDisplayNameForBundleWithIdentifier(a2);

  return MEMORY[0x1F41817F8]();
}

void __135__VSPrivacyFacade__promptForAccessUsingAuditToken_processIdentifier_identityProviderDisplayName_providerIsSupported_completionHandler___block_invoke_2(uint64_t a1)
{
  switch([*(id *)(a1 + 32) response])
  {
    case 0:
    case 3:
      v2 = VSPublicError(0, 2, 0);
      goto LABEL_4;
    case 1:
      uint64_t v4 = VSDefaultLogObject();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA674000, v4, OS_LOG_TYPE_DEFAULT, "Will grant access.", buf, 2u);
      }

      v5 = *(void **)(a1 + 40);
      long long v6 = *(_OWORD *)(a1 + 72);
      *(_OWORD *)buf = *(_OWORD *)(a1 + 56);
      long long v32 = v6;
      if ([v5 setAccessGranted:1 forAuditToken:buf])
      {
        id v7 = VSDefaultLogObject();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DA674000, v7, OS_LOG_TYPE_DEFAULT, "Did grant access.", buf, 2u);
        }
      }
      else
      {
        id v7 = VSErrorLogObject();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          __135__VSPrivacyFacade__promptForAccessUsingAuditToken_processIdentifier_identityProviderDisplayName_providerIsSupported_completionHandler___block_invoke_2_cold_1(v7, v12, v13, v14, v15, v16, v17, v18);
        }
      }

      v2 = 0;
      uint64_t v3 = 1;
      break;
    case 2:
      v2 = VSPrivateError(-11, 0);
      uint64_t v8 = VSDefaultLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA674000, v8, OS_LOG_TYPE_DEFAULT, "Will deny access.", buf, 2u);
      }

      BOOL v9 = *(void **)(a1 + 40);
      long long v10 = *(_OWORD *)(a1 + 72);
      *(_OWORD *)buf = *(_OWORD *)(a1 + 56);
      long long v32 = v10;
      if ([v9 setAccessGranted:0 forAuditToken:buf])
      {
        BOOL v11 = VSDefaultLogObject();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DA674000, v11, OS_LOG_TYPE_DEFAULT, "Did deny access.", buf, 2u);
        }
      }
      else
      {
        BOOL v11 = VSErrorLogObject();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          __135__VSPrivacyFacade__promptForAccessUsingAuditToken_processIdentifier_identityProviderDisplayName_providerIsSupported_completionHandler___block_invoke_2_cold_2(v11, v19, v20, v21, v22, v23, v24, v25);
        }
      }

      uint64_t v3 = 2;
      break;
    default:
      v2 = 0;
LABEL_4:
      uint64_t v3 = 0;
      break;
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __135__VSPrivacyFacade__promptForAccessUsingAuditToken_processIdentifier_identityProviderDisplayName_providerIsSupported_completionHandler___block_invoke_46;
  v27[3] = &unk_1E6BD3720;
  id v29 = *(id *)(a1 + 48);
  uint64_t v30 = v3;
  id v28 = v2;
  id v26 = v2;
  VSPerformCompletionHandler(v27);
}

void __135__VSPrivacyFacade__promptForAccessUsingAuditToken_processIdentifier_identityProviderDisplayName_providerIsSupported_completionHandler___block_invoke_46(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v1 = a1[6];
  id v3 = +[VSOptional optionalWithObject:a1[4]];
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v1, v3);
}

void __135__VSPrivacyFacade__promptForAccessUsingAuditToken_processIdentifier_identityProviderDisplayName_providerIsSupported_completionHandler___block_invoke_2_48(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = +[VSOptional optionalWithObject:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __135__VSPrivacyFacade__promptForAccessUsingAuditToken_processIdentifier_identityProviderDisplayName_providerIsSupported_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = +[VSOptional optionalWithObject:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (BOOL)isAccessGrantedForBundle:(__CFBundle *)a3
{
  CFStringRef Identifier = CFBundleGetIdentifier(a3);

  return [(VSPrivacyFacade *)self isAccessGrantedForBundleID:Identifier];
}

- (BOOL)isAccessGrantedForBundleID:(id)a3
{
  CFArrayRef v4 = (const __CFArray *)TCCAccessCopyInformationForBundleId();
  if (!v4) {
    return 0;
  }
  CFArrayRef v5 = v4;
  CFIndex Count = CFArrayGetCount(v4);
  if (Count < 1)
  {
LABEL_6:
    BOOL v12 = 0;
  }
  else
  {
    CFIndex v7 = Count;
    CFIndex v8 = 0;
    BOOL v9 = (const void **)MEMORY[0x1E4FA9A00];
    while (1)
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v8);
      CFStringRef Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, *v9);
      if (CFEqual(Value, (CFStringRef)[(VSPrivacyFacade *)self service])) {
        break;
      }
      if (v7 == ++v8) {
        goto LABEL_6;
      }
    }
    CFBooleanRef v13 = (const __CFBoolean *)CFDictionaryGetValue(ValueAtIndex, (const void *)*MEMORY[0x1E4FA99E8]);
    BOOL v12 = CFBooleanGetValue(v13) != 0;
  }
  CFRelease(v5);
  return v12;
}

- (BOOL)setAccessGranted:(BOOL)a3 forBundle:(__CFBundle *)a4
{
  BOOL v4 = a3;
  CFStringRef Identifier = CFBundleGetIdentifier(a4);

  return [(VSPrivacyFacade *)self setAccessGranted:v4 forBundleID:Identifier];
}

- (BOOL)setAccessGranted:(BOOL)a3 forBundleID:(id)a4
{
  id v5 = a4;
  [(VSPrivacyFacade *)self service];
  int v6 = TCCAccessSetForBundleId();

  return v6 != 0;
}

- (NSArray)knownAppBundles
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(VSPrivacyFacade *)self service];
  CFArrayRef v5 = (const __CFArray *)TCCAccessCopyInformation();
  if (v5)
  {
    CFArrayRef v6 = v5;
    CFIndex Count = CFArrayGetCount(v5);
    if (Count >= 1)
    {
      CFIndex v8 = Count;
      CFIndex v9 = 0;
      long long v10 = (const void **)MEMORY[0x1E4FA99D8];
      do
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v6, v9);
        *(void *)value = 0;
        if (CFDictionaryGetValueIfPresent(ValueAtIndex, *v10, (const void **)value))
        {
          BOOL v12 = CFBundleGetIdentifier(*(CFBundleRef *)value);
          [v4 addObject:v12];
        }
        ++v9;
      }
      while (v8 != v9);
    }
    CFRelease(v6);
  }
  CFBooleanRef v13 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v14 = v4;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v38 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v20 = VSDisplayNameForBundleWithIdentifier(v19);
        if (v20) {
          [v13 setObject:v20 forKeyedSubscript:v19];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v16);
  }

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __34__VSPrivacyFacade_knownAppBundles__block_invoke;
  v35[3] = &unk_1E6BD3770;
  id v30 = v13;
  id v36 = v30;
  [v14 sortUsingComparator:v35];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v21 = v14;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v42 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v31 + 1) + 8 * j);
        uint64_t v27 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:v26];
        if (v27)
        {
          [v3 addObject:v27];
        }
        else
        {
          id v28 = VSErrorLogObject();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)value = 138412290;
            *(void *)&value[4] = v26;
            _os_log_fault_impl(&dword_1DA674000, v28, OS_LOG_TYPE_FAULT, "No bundle for %@", value, 0xCu);
          }
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v31 objects:v42 count:16];
    }
    while (v23);
  }

  return (NSArray *)v3;
}

uint64_t __34__VSPrivacyFacade_knownAppBundles__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  CFArrayRef v5 = *(void **)(a1 + 32);
  id v6 = a3;
  CFIndex v7 = [v5 objectForKeyedSubscript:a2];
  CFIndex v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  if (v8) {
    uint64_t v9 = [v7 localizedCompare:v8];
  }
  else {
    uint64_t v9 = 1;
  }

  return v9;
}

- (BOOL)reset
{
  id v3 = [(VSPrivacyFacade *)self voucherLockbox];
  [v3 removeAllVouchers];

  [(VSPrivacyFacade *)self service];
  return TCCAccessReset() != 0;
}

- (VSPrivacyVoucherLockbox)voucherLockbox
{
  return self->_voucherLockbox;
}

- (void)setVoucherLockbox:(id)a3
{
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_voucherLockbox, 0);
}

- (void)preflightCheckForProcessIdentifier:(int)a1 withCompletionHandler:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "No known bundle url for PID %d", (uint8_t *)v2, 8u);
}

- (void)preflightCheckForProcessIdentifier:(uint64_t)a1 withCompletionHandler:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Unable to get bundle for URL %@", (uint8_t *)&v2, 0xCu);
}

- (void)preflightCheckForProcessIdentifier:(uint64_t)a1 withCompletionHandler:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "No known TCC info for bundle %@", (uint8_t *)&v2, 0xCu);
}

- (void)preflightCheckForProcessIdentifier:(uint64_t)a3 withCompletionHandler:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __135__VSPrivacyFacade__promptForAccessUsingAuditToken_processIdentifier_identityProviderDisplayName_providerIsSupported_completionHandler___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __135__VSPrivacyFacade__promptForAccessUsingAuditToken_processIdentifier_identityProviderDisplayName_providerIsSupported_completionHandler___block_invoke_2_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end