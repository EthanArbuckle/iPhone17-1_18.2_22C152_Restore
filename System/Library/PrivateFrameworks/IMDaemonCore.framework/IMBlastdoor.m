@interface IMBlastdoor
+ (BOOL)_commandReadyForBlastdoor:(int64_t)a3;
+ (BOOL)_messageBlastdoorMetricsEnabled;
+ (BOOL)supportsFeature:(id)a3;
+ (id)blastdoorInterfaceForSenderContext:(id)a3;
+ (id)logger;
+ (id)sendLiteData:(id)a3 senderContext:(id)a4 error:(id *)a5;
+ (id)sendRelayGroupMutationData:(id)a3 error:(id *)a4;
+ (id)sendRelayReachabilityRequest:(id)a3 error:(id *)a4;
+ (id)sendRelayReachabilityResponse:(id)a3 error:(id *)a4;
+ (id)sendSatelliteSMSDictionary:(id)a3 senderContext:(id)a4 error:(id *)a5;
+ (int64_t)_convertErrorToBlastdoorError:(id)a3;
+ (void)_askToTapToRadarForGUID:(id)a3 messageTypeString:(id)a4 sender:(id)a5 errorString:(id)a6 payloadAttachmentURL:(id)a7;
+ (void)sendBlastDoorError:(id)a3 guid:(id)a4 messageTypeString:(id)a5 senderURI:(id)a6 senderToken:(id)a7 messageContext:(id)a8 payloadAttachmentURL:(id)a9;
+ (void)sendClearNoticeData:(id)a3 senderContext:(id)a4 withCompletionBlock:(id)a5;
+ (void)sendCollaborationNoticeActionDictionary:(id)a3 senderContext:(id)a4 withCompletionBlock:(id)a5;
+ (void)sendCollaborationNoticeData:(id)a3 senderContext:(id)a4 withCompletionBlock:(id)a5;
+ (void)sendDictionary:(id)a3 senderContext:(id)a4 withCompletionBlock:(id)a5;
+ (void)sendSMSDictionary:(id)a3 withCompletionBlock:(id)a4;
@end

@implementation IMBlastdoor

+ (id)logger
{
  if (qword_1EBE2BB68 != -1) {
    dispatch_once(&qword_1EBE2BB68, &unk_1F3390F80);
  }
  v2 = (void *)qword_1EBE2BB58;

  return v2;
}

+ (BOOL)supportsFeature:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = [MEMORY[0x1E4F77E60] supportsFeature:v3];
  v5 = +[IMBlastdoor logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = @"NO";
    if (v4) {
      v6 = @"YES";
    }
    int v8 = 138412546;
    id v9 = v3;
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_DEFAULT, "Installed BlastDoor supports feature %@ (%@)", (uint8_t *)&v8, 0x16u);
  }

  return v4;
}

+ (BOOL)_commandReadyForBlastdoor:(int64_t)a3
{
  BOOL result = 0;
  if (a3 > 133)
  {
    BOOL v4 = a3 == 139 || a3 == 170;
    BOOL v5 = a3 == 134 || a3 == 135;
    if (a3 <= 138) {
      return v5;
    }
    else {
      return v4;
    }
  }
  else
  {
    switch(a3)
    {
      case 'd':
      case 'e':
      case 'f':
      case 'i':
      case 'o':
      case 'p':
      case 'q':
      case 't':
      case 'v':
      case 'w':
      case 'z':
        BOOL result = 1;
        break;
      default:
        return result;
    }
  }
  return result;
}

+ (id)blastdoorInterfaceForSenderContext:(id)a3
{
  id v3 = a3;
  BOOL v4 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v5 = [v4 isUnknownSenderBlastDoorEnabled];

  if (v5)
  {
    if (qword_1EBE2BE18 != -1) {
      dispatch_once(&qword_1EBE2BE18, &unk_1F3390FA0);
    }
    if (qword_1EBE2BE30 != -1) {
      dispatch_once(&qword_1EBE2BE30, &unk_1F3390FC0);
    }
    int v6 = [v3 isTrustedSender];
    v7 = &qword_1EBE2BE20;
    if (!v6) {
      v7 = &qword_1EBE2BE28;
    }
    int v8 = (void *)*v7;
  }
  else
  {
    if (qword_1EA8CA4C8 != -1) {
      dispatch_once(&qword_1EA8CA4C8, &unk_1F3390FE0);
    }
    int v8 = (void *)qword_1EA8CA4D0;
  }
  id v9 = v8;

  return v9;
}

+ (BOOL)_messageBlastdoorMetricsEnabled
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"disable-bd-metrics"];
  LOBYTE(v4) = [v3 BOOLValue];

  int v5 = IMGetCachedDomainValueForKey();
  int v6 = v5;
  if (v5)
  {
    int v4 = [v5 BOOLValue];
    v7 = +[IMBlastdoor logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = @"NO";
      if (v4) {
        int v8 = @"YES";
      }
      int v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_DEFAULT, "Metrics manually enabled (%@)", (uint8_t *)&v10, 0xCu);
    }
  }
  return v4 ^ 1;
}

+ (int64_t)_convertErrorToBlastdoorError:(id)a3
{
  id v3 = a3;
  int v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F281F8]];

  if (v5)
  {
    BOOL v6 = [v3 code] == 4864;
    uint64_t v7 = 13001;
    uint64_t v8 = 13003;
LABEL_3:
    if (v6) {
      int64_t v9 = v8;
    }
    else {
      int64_t v9 = v7;
    }
    goto LABEL_6;
  }
  v11 = [v3 domain];
  int v12 = [v11 isEqualToString:*MEMORY[0x1E4F6BE88]];

  if (!v12)
  {
    v14 = [v3 domain];
    int v15 = [v14 isEqualToString:*MEMORY[0x1E4F6D1D8]];

    if (v15)
    {
      int64_t v9 = 13300;
      goto LABEL_6;
    }
    v16 = [v3 domain];
    if ([v16 isEqualToString:@"BlastDoor.Explosion"])
    {
    }
    else
    {
      v17 = [v3 domain];
      char v18 = [v17 isEqualToString:@"com.apple.BlastDoor"];

      if ((v18 & 1) == 0)
      {
        v19 = [v3 domain];
        char v20 = [v19 isEqualToString:*MEMORY[0x1E4F6BE80]];

        if (v20)
        {
          int64_t v9 = 13600;
          goto LABEL_6;
        }
        v21 = [v3 userInfo];
        v22 = [v21 objectForKeyedSubscript:@"errorMetric"];

        BOOL v6 = v22 == 0;
        uint64_t v7 = 13250;
        uint64_t v8 = 13000;
        goto LABEL_3;
      }
    }
    int64_t v9 = 13500;
    goto LABEL_6;
  }
  uint64_t v13 = [v3 code];
  if ((unint64_t)(v13 - 1) >= 0x17) {
    int64_t v9 = 13250;
  }
  else {
    int64_t v9 = qword_1D991CE80[v13 - 1];
  }
LABEL_6:

  return v9;
}

+ (void)_askToTapToRadarForGUID:(id)a3 messageTypeString:(id)a4 sender:(id)a5 errorString:(id)a6 payloadAttachmentURL:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = [MEMORY[0x1E4F6C360] sharedInstance];
  if (![v16 isInternalInstall])
  {
LABEL_16:

    goto LABEL_17;
  }
  char v17 = IMGetCachedDomainBoolForKeyWithDefaultValue();

  if (v17)
  {
    v16 = IMGetCachedDomainValueForKey();
    if (v16
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && ([MEMORY[0x1E4F1C9C8] date],
          char v18 = objc_claimAutoreleasedReturnValue(),
          [v18 timeIntervalSinceDate:v16],
          double v20 = v19,
          v18,
          v20 < 3600.0))
    {
      v23 = +[IMBlastdoor logger];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v36 = v20;
        _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_DEFAULT, "Skipping blastdoor validation prompt because last fire date was %f seconds ago", buf, 0xCu);
      }
    }
    else
    {
      if (qword_1EA8CA4E0 != -1) {
        dispatch_once(&qword_1EA8CA4E0, &unk_1F3391000);
      }
      v21 = (void *)MEMORY[0x1E4F6C410];
      v22 = [NSString stringWithFormat:@"An incoming iMessage from %@ failed validation.\n\nA copy of the message will be attached.", v13];
      v23 = [v21 userNotificationWithIdentifier:@"com.apple.Messages.BlastdoorValidationFailureInternalPrompt" title:@"iMessage Validation Failure" message:v22 defaultButton:@"File a Radar" alternateButton:@"Dismiss" otherButton:0];

      if (v23)
      {
        v24 = [MEMORY[0x1E4F6C418] sharedInstance];
        uint64_t v25 = [v24 countForIdentifier:@"com.apple.Messages.BlastdoorValidationFailureInternalPrompt"];

        if (!v25)
        {
          v26 = +[IMBlastdoor logger];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_DEFAULT, "Presenting BD TTR UI", buf, 2u);
          }

          v27 = [MEMORY[0x1E4F1C9C8] date];
          IMSetDomainValueForKey();

          v28 = [MEMORY[0x1E4F6E890] sharedInstance];
          [v28 trackEvent:*MEMORY[0x1E4F6DA58]];

          [v23 setUsesNotificationCenter:0];
          [v23 setRepresentedApplicationBundle:*MEMORY[0x1E4F6C440]];
          v29 = [MEMORY[0x1E4F6C418] sharedInstance];
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = sub_1D97339B0;
          v30[3] = &unk_1E6B753E8;
          id v31 = v14;
          id v32 = v12;
          id v33 = v11;
          id v34 = v15;
          [v29 addUserNotification:v23 listener:0 completionHandler:v30];
        }
      }
    }

    goto LABEL_16;
  }
LABEL_17:
}

+ (void)sendBlastDoorError:(id)a3 guid:(id)a4 messageTypeString:(id)a5 senderURI:(id)a6 senderToken:(id)a7 messageContext:(id)a8 payloadAttachmentURL:(id)a9
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if (([(id)objc_opt_class() _messageBlastdoorMetricsEnabled] & 1) == 0)
  {
    v21 = +[IMBlastdoor logger];
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v22 = "Wanted to send BlastDoor metric, but disabled via server bag.";
LABEL_12:
    v23 = v21;
    uint32_t v24 = 2;
    goto LABEL_13;
  }
  if (![v15 length])
  {
    v21 = +[IMBlastdoor logger];
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v22 = "Wanted to send BlastDoor metric, guid was nil";
    goto LABEL_12;
  }
  if (qword_1EA8CA4F0 != -1) {
    dispatch_once(&qword_1EA8CA4F0, &unk_1F3391020);
  }
  if ([(id)qword_1EA8CA4E8 containsObject:v15])
  {
    v21 = +[IMBlastdoor logger];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v61 = v15;
      v22 = "Already submitted metric for GUID, ignoring (%@)";
      v23 = v21;
      uint32_t v24 = 12;
LABEL_13:
      _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
    }
LABEL_14:

    goto LABEL_15;
  }
  [(id)qword_1EA8CA4E8 addObject:v15];
  uint64_t v25 = im_checkpointIDSService();

  if (v25)
  {
    uint64_t v26 = [(id)objc_opt_class() _convertErrorToBlastdoorError:v14];
    if (v26 != -1)
    {
      uint64_t v27 = v26;
      v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v46 = v27;
      v28 = [NSNumber numberWithInteger:v27];
      [v21 setObject:v28 forKey:@"fR"];

      uint64_t v29 = IDSGetUUIDData();
      if (v29) {
        [v21 setObject:v29 forKey:@"fU"];
      }
      v50 = (void *)v29;
      if (v18) {
        [v21 setObject:v18 forKey:@"t"];
      }
      v30 = [v14 userInfo];
      id v31 = [v30 objectForKeyedSubscript:@"errorMetric"];

      int v32 = [MEMORY[0x1E4F6E730] deviceIsLockedDown];
      id v33 = &stru_1F3398578;
      if (v32) {
        id v33 = @"-Lockdown";
      }
      v51 = v31;
      v52 = v33;
      uint64_t v34 = [v31 length];
      v47 = NSString;
      v49 = [v14 domain];
      uint64_t v35 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "code"));
      v48 = (void *)v35;
      if (v34) {
        [v47 stringWithFormat:@"type-%@-%@-%@-%@%@", v16, v49, v35, v51, v52];
      }
      else {
      uint64_t v36 = [v47 stringWithFormat:@"type-%@-%@-%@%@", v16, v49, v35, v52, v45];
      }

      v53 = v36;
      [v21 setObject:v36 forKey:@"fRM"];
      uint64_t v37 = +[IMBlastdoor logger];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v61 = v15;
        __int16 v62 = 2112;
        v63 = v21;
        _os_log_impl(&dword_1D967A000, v37, OS_LOG_TYPE_DEFAULT, "Sending BlastDoor metric (guid: %@): %@", buf, 0x16u);
      }

      v38 = im_checkpointIDSService();
      [v38 sendServerMessage:v21 command:&unk_1F33C5928 fromAccount:0];

      if (v15 && v19)
      {
        v39 = im_checkpointIDSService();
        v40 = [NSNumber numberWithInteger:v46];
        im_sendCertifiedDeliveryReceiptIfPossible();
      }
      v41 = [MEMORY[0x1E4F6C360] sharedInstance];
      int v42 = [v41 isInternalInstall];

      if (v42)
      {
        if (([v51 containsString:@"AVFoundationErrorDomain--11869"] & 1) != 0
          || [v16 containsString:@"131"])
        {
          v43 = +[IMBlastdoor logger];
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v61 = v53;
            __int16 v62 = 2112;
            v63 = v15;
            _os_log_impl(&dword_1D967A000, v43, OS_LOG_TYPE_DEFAULT, "Don't show BlastDoor TTR for error metric: %@ (guid: %@)", buf, 0x16u);
          }

          goto LABEL_40;
        }
        dispatch_time_t v44 = dispatch_time(0, 5000000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_1D973434C;
        block[3] = &unk_1E6B75410;
        v55 = v15;
        id v56 = v16;
        id v57 = v17;
        v58 = v53;
        id v59 = v20;
        dispatch_after(v44, MEMORY[0x1E4F14428], block);
      }
LABEL_40:

      goto LABEL_14;
    }
  }
LABEL_15:
}

+ (void)sendDictionary:(id)a3 senderContext:(id)a4 withCompletionBlock:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v30 = a4;
  id v9 = a5;
  if (!v9) {
    goto LABEL_28;
  }
  if (!v8)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v19 = (void *)[v18 initWithDomain:*MEMORY[0x1E4F6BE80] code:1 userInfo:0];
    (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v19);

    goto LABEL_28;
  }
  int v10 = [v8 objectForKey:*MEMORY[0x1E4F6B040]];
  id v11 = [v10 objectForKey:*MEMORY[0x1E4F6B1A8]];
  if (!v11)
  {
    id v11 = [v10 objectForKey:*MEMORY[0x1E4F6ACD0]];
  }
  uint64_t v29 = objc_msgSend(v11, "integerValue", v11);
  id v12 = +[IMBlastdoor logger];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v36 = v29;
    _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_DEFAULT, "Piping command through BlastDoor: %ld", buf, 0xCu);
  }

  id v13 = [v10 objectForKey:@"U"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    id v15 = (void *)MEMORY[0x1E4F1C9B8];
    id v16 = [v10 objectForKey:@"U"];
    uint64_t v17 = [v15 _IDSDataFromBase64String:v16];
  }
  else
  {
    id v16 = [v10 objectForKey:@"U"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v21 = 0;
      id v20 = 0;
      goto LABEL_14;
    }
    uint64_t v17 = [v10 objectForKey:@"U"];
  }
  id v20 = (void *)v17;
  char v21 = isKindOfClass ^ 1;
LABEL_14:
  v22 = JWUUIDPushObjectToString();
  if (v21) {

  }
  if (isKindOfClass) {
  v23 = [a1 blastdoorInterfaceForSenderContext:v30];
  }
  if (objc_opt_respondsToSelector())
  {
    id v34 = 0;
    uint32_t v24 = [v23 defuseTopLevelDictionary:v8 error:&v34];
    id v25 = v34;
    uint64_t v26 = (void (*)(id, uint64_t, void *, id))*((void *)v9 + 2);
    if (v24) {
      v26(v9, v29, v24, 0);
    }
    else {
      v26(v9, v29, 0, v25);
    }
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1D97347F4;
    aBlock[3] = &unk_1E6B75460;
    id v32 = v22;
    id v33 = v9;
    uint64_t v27 = _Block_copy(aBlock);
    if ([MEMORY[0x1E4F6E730] deviceIsLockedDown]) {
      [v23 decontaminateTopLevelDictionary:v8 resultHandler:v27];
    }
    else {
      [v23 defuseTopLevelDictionary:v8 resultHandler:v27];
    }

    id v25 = v32;
  }

LABEL_28:
}

+ (void)sendSMSDictionary:(id)a3 withCompletionBlock:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = a4;
  if (v7)
  {
    if (v6)
    {
      id v8 = [v6 objectForKey:@"g"];
      id v9 = +[IMBlastdoor logger];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v8;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_DEFAULT, "Piping SMS/MMS dictionary for GUID (%@) through BlastDoor", buf, 0xCu);
      }

      int v10 = [MEMORY[0x1E4F6E950] contextWithKnownSender:0 serviceName:*MEMORY[0x1E4F6E1A0]];
      id v11 = [a1 blastdoorInterfaceForSenderContext:v10];
      if (objc_opt_respondsToSelector())
      {
        id v23 = 0;
        id v12 = [v11 defuseSMSDictionary:v6 error:&v23];
        id v13 = v23;
        id v14 = (void (*)(void *, void *, id))v7[2];
        if (v12) {
          v14(v7, v12, 0);
        }
        else {
          v14(v7, 0, v13);
        }
      }
      else
      {
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = sub_1D9734DEC;
        v20[3] = &unk_1E6B75488;
        id v21 = v8;
        v22 = v7;
        [v11 defuseSMSDictionary:v6 resultHandler:v20];

        id v13 = v21;
      }
    }
    else
    {
      id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v16 = (void *)[v15 initWithDomain:*MEMORY[0x1E4F6BE80] code:2 userInfo:0];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1D9734F88;
      block[3] = &unk_1E6B73A10;
      id v18 = v16;
      id v19 = v7;
      id v8 = v16;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

+ (void)sendClearNoticeData:(id)a3 senderContext:(id)a4 withCompletionBlock:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (!v8)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v12 = (void *)[v11 initWithDomain:*MEMORY[0x1E4F6BE80] code:8 userInfo:0];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1D9735328;
      block[3] = &unk_1E6B73A10;
      id v19 = v12;
      id v20 = v10;
      id v13 = v12;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    id v14 = +[IMBlastdoor logger];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_DEFAULT, "Piping Clear Notices through Blastdoor", buf, 2u);
    }

    id v15 = [a1 blastdoorInterfaceForSenderContext:v9];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1D9735340;
    v16[3] = &unk_1E6B754B0;
    id v17 = v10;
    [v15 defuseCollaborationClearNoticePayload:v8 resultHandler:v16];
  }
}

+ (void)sendCollaborationNoticeData:(id)a3 senderContext:(id)a4 withCompletionBlock:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (!v8)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v12 = (void *)[v11 initWithDomain:*MEMORY[0x1E4F6BE80] code:4 userInfo:0];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1D9735854;
      block[3] = &unk_1E6B73A10;
      id v19 = v12;
      id v20 = v10;
      id v13 = v12;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    id v14 = +[IMBlastdoor logger];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_DEFAULT, "Piping Collaboration Notices through Blastdoor", buf, 2u);
    }

    id v15 = [a1 blastdoorInterfaceForSenderContext:v9];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1D973586C;
    v16[3] = &unk_1E6B754D8;
    id v17 = v10;
    [v15 defuseCollaborationNoticePayload:v8 resultHandler:v16];
  }
}

+ (void)sendCollaborationNoticeActionDictionary:(id)a3 senderContext:(id)a4 withCompletionBlock:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (!v8)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v12 = (void *)[v11 initWithDomain:*MEMORY[0x1E4F6BE80] code:6 userInfo:0];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1D9735D80;
      block[3] = &unk_1E6B73A10;
      id v19 = v12;
      id v20 = v10;
      id v13 = v12;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    id v14 = +[IMBlastdoor logger];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_DEFAULT, "Piping Collaboration Notice Action through Blastdoor", buf, 2u);
    }

    id v15 = [a1 blastdoorInterfaceForSenderContext:v9];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1D9735D9C;
    v16[3] = &unk_1E6B75528;
    id v17 = v10;
    [v15 defuseCollaborationNoticeActionDictionary:v8 resultHandler:v16];
  }
}

+ (id)sendLiteData:(id)a3 senderContext:(id)a4 error:(id *)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = +[IMBlastdoor logger];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_DEFAULT, "Piping lite message through Blastdoor", (uint8_t *)&v15, 2u);
  }

  id v11 = [a1 blastdoorInterfaceForSenderContext:v9];
  id v12 = [v11 defuseLiteTextMessage:v8 error:a5];

  id v13 = +[IMBlastdoor logger];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134217984;
    id v16 = v12;
    _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_DEFAULT, "Blastdoor lite message response %p received", (uint8_t *)&v15, 0xCu);
  }

  return v12;
}

+ (id)sendSatelliteSMSDictionary:(id)a3 senderContext:(id)a4 error:(id *)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = +[IMBlastdoor logger];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_DEFAULT, "Piping lite message through Blastdoor", (uint8_t *)&v15, 2u);
  }

  id v11 = [a1 blastdoorInterfaceForSenderContext:v9];
  id v12 = [v11 defuseSatelliteSMSTextMessageDictionary:v8 error:a5];

  id v13 = +[IMBlastdoor logger];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134217984;
    id v16 = v12;
    _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_DEFAULT, "Blastdoor satellite SMS message response %p received", (uint8_t *)&v15, 0xCu);
  }

  return v12;
}

+ (id)sendRelayGroupMutationData:(id)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = +[IMBlastdoor logger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_DEFAULT, "Piping group relay message through Blastdoor", (uint8_t *)&v13, 2u);
  }

  id v8 = [MEMORY[0x1E4F6E950] contextWithKnownSender:0 serviceName:*MEMORY[0x1E4F6E198]];
  id v9 = [a1 blastdoorInterfaceForSenderContext:v8];
  id v10 = [v9 defuseRelayGroupMutationPayload:v6 error:a4];

  id v11 = +[IMBlastdoor logger];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134217984;
    id v14 = v10;
    _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_DEFAULT, "Blastdoor group relay message response %p received", (uint8_t *)&v13, 0xCu);
  }

  return v10;
}

+ (id)sendRelayReachabilityRequest:(id)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = +[IMBlastdoor logger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_DEFAULT, "Piping relay reachability request through Blastdoor", (uint8_t *)&v13, 2u);
  }

  id v8 = [MEMORY[0x1E4F6E950] contextWithKnownSender:1 serviceName:*MEMORY[0x1E4F6E198]];
  id v9 = [a1 blastdoorInterfaceForSenderContext:v8];
  id v10 = [v9 defuseRelayReachabilityRequestPayload:v6 error:a4];

  id v11 = +[IMBlastdoor logger];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134217984;
    id v14 = v10;
    _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_DEFAULT, "Blastdoor relay reachability request response %p received", (uint8_t *)&v13, 0xCu);
  }

  return v10;
}

+ (id)sendRelayReachabilityResponse:(id)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = +[IMBlastdoor logger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_DEFAULT, "Piping relay reachability response through Blastdoor", (uint8_t *)&v13, 2u);
  }

  id v8 = [MEMORY[0x1E4F6E950] contextWithKnownSender:1 serviceName:*MEMORY[0x1E4F6E198]];
  id v9 = [a1 blastdoorInterfaceForSenderContext:v8];
  id v10 = [v9 defuseRelayReachabilityResponsePayload:v6 error:a4];

  id v11 = +[IMBlastdoor logger];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134217984;
    id v14 = v10;
    _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_DEFAULT, "Blastdoor relay reachability response response %p received", (uint8_t *)&v13, 0xCu);
  }

  return v10;
}

@end