@interface TUCall
+ (BOOL)shouldMakeFakeSOSCall;
- (BOOL)canDisplayAlertUI:(BOOL)a3;
- (BOOL)carrierAllowsReportVoiceCall;
- (BOOL)disconnectedReasonRequiresCallBackUI;
- (BOOL)disconnectedReasonRequiresCallFailureUI;
- (BOOL)hasSendCustomMessageCapability;
- (BOOL)hasSendMessageCapability;
- (BOOL)isBranded;
- (BOOL)isCallbackAllowed;
- (BOOL)isMessagingAllowed;
- (BOOL)isReminderAllowed;
- (BOOL)isSOSOrFakeSOS;
- (BOOL)shouldPlayInCallSounds;
- (BOOL)shouldShowAutomaticTelephonyCallFallback;
- (BOOL)shouldShowFailureAlert;
- (BOOL)supportsSendMessageIntent;
- (id)sendMessageIntentExtension;
@end

@implementation TUCall

- (BOOL)isCallbackAllowed
{
  v2 = [(TUCall *)self handle];
  v3 = [v2 value];
  id v4 = [v3 length];

  if (v4) {
    return !+[PHInCallUIUtilities isSpringBoardPasscodeLocked];
  }
  else {
    return 0;
  }
}

- (BOOL)isMessagingAllowed
{
  if (+[PHSOSViewController isSOSDismissalAssertionActive])
  {
    v3 = sub_1000D5130();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      id v4 = "isMessagingAllowed returning false due sos being enabled.";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, v21, 2u);
    }
  }
  else
  {
    v5 = [(TUCall *)self handle];
    v6 = [v5 value];
    id v7 = [v6 length];

    if (v7)
    {
      if ([(TUCall *)self hasSendMessageCapability])
      {
        if ([(TUCall *)self isBlocked])
        {
          v3 = sub_1000D5130();
          if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v21 = 0;
            id v4 = "isMessagingAllowed returning false due to the caller being blocked.";
            goto LABEL_13;
          }
        }
        else
        {
          if ([(TUCall *)self isConferenced])
          {
            v3 = sub_1000D5130();
            if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_14;
            }
            *(_WORD *)v21 = 0;
            id v4 = "isMessagingAllowed returning false due to the caller being a connference call.";
            goto LABEL_13;
          }
          v9 = +[TUCallCenter sharedInstance];
          unsigned int v10 = [v9 isAmbiguous];

          if (v10)
          {
            v3 = sub_1000D5130();
            if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_14;
            }
            *(_WORD *)v21 = 0;
            id v4 = "isMessagingAllowed returning false due to the caller being ambiguous";
            goto LABEL_13;
          }
          v11 = +[PHInCallUtilities sharedInstance];
          unsigned int v12 = [v11 isSetupAssistantRunning];

          if (v12)
          {
            v3 = sub_1000D5130();
            if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_14;
            }
            *(_WORD *)v21 = 0;
            id v4 = "isMessagingAllowed returning false due to setup assitant running";
            goto LABEL_13;
          }
          v13 = +[PHInCallUtilities sharedInstance];
          unsigned int v14 = [v13 isInLostMode];

          if (v14)
          {
            v3 = sub_1000D5130();
            if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_14;
            }
            *(_WORD *)v21 = 0;
            id v4 = "isMessagingAllowed returning false due the device being in lost mode";
            goto LABEL_13;
          }
          v15 = +[PHInCallUtilities sharedInstance];
          int v16 = [v15 canSendText];

          if ((v16 & 1) == 0)
          {
            v3 = sub_1000D5130();
            if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_14;
            }
            *(_WORD *)v21 = 0;
            id v4 = "isMessagingAllowed returning false due being unable to send texts.";
            goto LABEL_13;
          }
          v17 = +[PHInCallUtilities sharedInstance];
          unsigned int v18 = [v17 isSMSRestricted];

          if (v18)
          {
            v3 = sub_1000D5130();
            if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_14;
            }
            *(_WORD *)v21 = 0;
            id v4 = "isMessagingAllowed returning false due to being sms restricted.";
            goto LABEL_13;
          }
          if (!+[PHInCallUIUtilities isSpringBoardPasscodeLocked])return 1; {
          v19 = +[PHInCallUtilities sharedInstance];
          }
          unsigned __int8 v20 = [v19 isLockScreenMessagingAllowed];

          if (v20) {
            return 1;
          }
          v3 = sub_1000D5130();
          if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v21 = 0;
            id v4 = "isMessagingAllowed returning false due to springboard being password locked.";
            goto LABEL_13;
          }
        }
      }
      else
      {
        v3 = sub_1000D5130();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v21 = 0;
          id v4 = "isMessagingAllowed returning false due to the caller not having capability to recieve a messages.";
          goto LABEL_13;
        }
      }
    }
    else
    {
      v3 = sub_1000D5130();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        id v4 = "isMessagingAllowed returning false due to invalid handle length of 0";
        goto LABEL_13;
      }
    }
  }
LABEL_14:

  return 0;
}

- (BOOL)isReminderAllowed
{
  if (+[PHSOSViewController isSOSDismissalAssertionActive])
  {
    v3 = sub_1000D5130();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      id v4 = "isReminderAllowed returning false due sos being enabled.";
LABEL_25:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, v17, 2u);
    }
  }
  else
  {
    v5 = [(TUCall *)self handle];
    v6 = [v5 value];
    id v7 = [v6 length];

    if (v7)
    {
      if ([(TUCall *)self isBlocked])
      {
        v3 = sub_1000D5130();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v17 = 0;
          id v4 = "isReminderAllowed returning false due to the caller being blocked.";
          goto LABEL_25;
        }
      }
      else if ([(TUCall *)self isConferenced])
      {
        v3 = sub_1000D5130();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v17 = 0;
          id v4 = "isReminderAllowed returning false due to the caller being a connference call.";
          goto LABEL_25;
        }
      }
      else
      {
        v8 = +[TUCallCenter sharedInstance];
        unsigned int v9 = [v8 isAmbiguous];

        if (v9)
        {
          v3 = sub_1000D5130();
          if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v17 = 0;
            id v4 = "isReminderAllowed returning false due to the caller being ambiguous";
            goto LABEL_25;
          }
        }
        else
        {
          unsigned int v10 = +[PHInCallUtilities sharedInstance];
          unsigned int v11 = [v10 isSetupAssistantRunning];

          if (v11)
          {
            v3 = sub_1000D5130();
            if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v17 = 0;
              id v4 = "isReminderAllowed returning false due to setup assitant running";
              goto LABEL_25;
            }
          }
          else
          {
            unsigned int v12 = +[PHInCallUtilities sharedInstance];
            unsigned int v13 = [v12 isInLostMode];

            if (v13)
            {
              v3 = sub_1000D5130();
              if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v17 = 0;
                id v4 = "isReminderAllowed returning false due the device being in lost mode";
                goto LABEL_25;
              }
            }
            else
            {
              unsigned int v14 = +[LSApplicationProxy applicationProxyForIdentifier:@"com.apple.reminders"];
              unsigned int v15 = [v14 isRemovedSystemApp];

              if (!v15) {
                return 1;
              }
              v3 = sub_1000D5130();
              if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v17 = 0;
                id v4 = "isReminderAllowed returning false due reminders not being installed.";
                goto LABEL_25;
              }
            }
          }
        }
      }
    }
    else
    {
      v3 = sub_1000D5130();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        id v4 = "isReminderAllowed returning false due to invalid handle length of 0";
        goto LABEL_25;
      }
    }
  }

  return 0;
}

- (BOOL)isBranded
{
  v3 = [(TUCall *)self imageURL];
  if (v3)
  {
    id v4 = [(TUCall *)self localizedLabel];
    if (v4)
    {
      v5 = [(TUCall *)self callDirectoryName];
      BOOL v6 = v5 == 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)disconnectedReasonRequiresCallBackUI
{
  unsigned int v3 = [(TUCall *)self disconnectedReason];
  LOBYTE(v4) = 0;
  if (v3 > 0x18 || ((1 << v3) & 0x1C2C020) == 0) {
    return v4;
  }
  v5 = +[TUCallCenter sharedInstance];
  BOOL v6 = [v5 activeConversationForCall:self];

  if (v6)
  {
    unsigned int v7 = [v6 isOneToOneModeEnabled];
  }
  else
  {
    v8 = [(TUCall *)self remoteParticipantHandles];
    unsigned int v7 = [v8 count] == (id)1;
  }
  unsigned int v9 = +[PHInCallUIUtilities isSpringBoardPasscodeLocked];
  if (![(TUCall *)self isIncoming])
  {
    if (v9) {
      goto LABEL_8;
    }
LABEL_10:
    unsigned int v4 = [(TUCall *)self isConversation] ^ 1 | v7;
    goto LABEL_11;
  }
  if ((([(TUCall *)self isConnecting] ^ 1 | v9) & 1) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  unsigned int v4 = 0;
LABEL_11:
  unsigned int v10 = sub_1000D5130();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67110912;
    v12[1] = v4;
    __int16 v13 = 1024;
    unsigned int v14 = [(TUCall *)self disconnectedReason];
    __int16 v15 = 1024;
    unsigned int v16 = [(TUCall *)self isIncoming];
    __int16 v17 = 1024;
    unsigned int v18 = [(TUCall *)self isConnecting];
    __int16 v19 = 1024;
    unsigned int v20 = v9;
    __int16 v21 = 1024;
    unsigned int v22 = [(TUCall *)self isConversation];
    __int16 v23 = 1024;
    unsigned int v24 = v7;
    __int16 v25 = 1024;
    BOOL v26 = v6 == 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "disconnectedReasonRequiresCallBackUI = %d (disconnectedReason: %d, isIncoming: %d, isConnecting: %d, isSpringBoardPasscodeLocked: %d, isConversation: %d, isOneToOneModeEnabled: %d, conversationIsNil: %d)", (uint8_t *)v12, 0x32u);
  }

  return v4;
}

- (BOOL)disconnectedReasonRequiresCallFailureUI
{
  unsigned int v2 = [(TUCall *)self disconnectedReason];
  return (v2 < 0x19) & (0x1C24000u >> v2);
}

- (BOOL)shouldShowFailureAlert
{
  if ([(TUCall *)self status] == 6)
  {
    unsigned int v3 = [(TUCall *)self errorAlertTitle];
    if (v3)
    {
      unsigned int v4 = ![(TUCall *)self shouldShowAutomaticTelephonyCallFallback];
    }
    else
    {
      v5 = [(TUCall *)self errorAlertMessage];
      if (v5) {
        unsigned int v4 = ![(TUCall *)self shouldShowAutomaticTelephonyCallFallback];
      }
      else {
        LOBYTE(v4) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)shouldShowAutomaticTelephonyCallFallback
{
  unsigned int v3 = [(TUCall *)self disconnectedReason];
  unsigned int v4 = [(TUCall *)self provider];
  if ([v4 isFaceTimeProvider]
    && ([(TUCall *)self isVideo] & 1) == 0)
  {
    BOOL v6 = [(TUCall *)self remoteParticipantHandles];
    if ([v6 count] == (id)1 && (v3 == 49 || v3 == 30)) {
      char v5 = TUDefaultAppsEnabled();
    }
    else {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)shouldPlayInCallSounds
{
  unsigned int v3 = [(TUCall *)self needsManualInCallSounds];
  if (v3)
  {
    LOBYTE(v3) = [(TUCall *)self isEndpointOnCurrentDevice];
  }
  return v3;
}

- (BOOL)hasSendMessageCapability
{
  unsigned int v3 = [(TUCall *)self provider];
  if ([v3 isSystemProvider])
  {
    BOOL v4 = 1;
  }
  else
  {
    char v5 = [(TUCall *)self sendMessageIntentExtension];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (BOOL)supportsSendMessageIntent
{
  unsigned int v2 = [(TUCall *)self provider];
  unsigned int v3 = [v2 bundleIdentifier];

  BOOL v4 = +[LSApplicationWorkspace defaultWorkspace];
  char v5 = [v4 applicationsForUserActivityType:@"INSendMessageIntent"];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        unsigned int v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unsigned int v11 = sub_1000D5130();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          unsigned int v20 = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "application %@", buf, 0xCu);
        }

        unsigned int v12 = [v10 bundleIdentifier];
        unsigned __int8 v13 = [v12 isEqualToString:v3];

        if (v13)
        {
          LOBYTE(v7) = 1;
          goto LABEL_13;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return (char)v7;
}

- (BOOL)hasSendCustomMessageCapability
{
  unsigned int v3 = [(TUCall *)self provider];
  if ([v3 isSystemProvider]) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [(TUCall *)self supportsSendMessageIntent];
  }

  return v4;
}

- (id)sendMessageIntentExtension
{
  unsigned int v3 = [(TUCall *)self provider];
  if ([v3 isSystemProvider])
  {

LABEL_13:
    long long v17 = 0;
    goto LABEL_14;
  }
  BOOL v4 = [(TUCall *)self provider];
  char v5 = [v4 bundleURL];

  if (!v5) {
    goto LABEL_13;
  }
  if (qword_100326128 != -1) {
    dispatch_once(&qword_100326128, &stru_1002CF3C8);
  }
  if (([(id)qword_100326118 containsObject:self] & 1) == 0)
  {
    [(id)qword_100326118 addObject:self];
    CFStringRef v35 = @"INSendMessageIntent";
    id v6 = +[NSArray arrayWithObjects:&v35 count:1];
    id v7 = +[NSExtension _intents_extensionMatchingAttributesForIntents:v6];
    id v8 = [v7 mutableCopy];

    unsigned int v9 = [(TUCall *)self provider];
    unsigned int v10 = [v9 bundleURL];
    unsigned int v11 = [v10 path];
    [v8 setObject:v11 forKeyedSubscript:NSExtensionContainingAppName];

    uint64_t v25 = 0;
    BOOL v26 = &v25;
    uint64_t v27 = 0x3032000000;
    v28 = sub_1000845F0;
    v29 = sub_100084600;
    id v30 = 0;
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    unsigned __int8 v13 = sub_1000D5130();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Looking up send message intent extension using attributes: %@", buf, 0xCu);
    }

    __int16 v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    __int16 v21 = sub_100084608;
    unsigned int v22 = &unk_1002CF3F0;
    unsigned int v24 = &v25;
    unsigned int v14 = v12;
    __int16 v23 = v14;
    +[NSExtension extensionsWithMatchingAttributes:v8 completion:&v19];
    dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    long long v15 = sub_1000D5130();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      long long v16 = (void *)v26[5];
      *(_DWORD *)buf = 138412546;
      id v32 = v16;
      __int16 v33 = 2112;
      v34 = self;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Found send message intent extension %@ for call %@", buf, 0x16u);
    }

    [qword_100326120 setObject:v26[5] forKey:self v19, v20, v21, v22];
    _Block_object_dispose(&v25, 8);
  }
  long long v17 = [(id)qword_100326120 objectForKey:self];
LABEL_14:

  return v17;
}

+ (BOOL)shouldMakeFakeSOSCall
{
  return sub_1001239D0() & 1;
}

- (BOOL)isSOSOrFakeSOS
{
  unsigned int v2 = self;
  char v3 = sub_100123A44();

  return v3 & 1;
}

- (BOOL)carrierAllowsReportVoiceCall
{
  unsigned int v2 = self;
  char v3 = sub_1001373D0();

  return v3 & 1;
}

- (BOOL)canDisplayAlertUI:(BOOL)a3
{
  int v3 = a3;
  BOOL v4 = self;
  LOBYTE(v3) = sub_1001B4230(v3);

  return v3 & 1;
}

@end