@interface TUCall
- (BOOL)disconnectedReasonRequiresCallBackUI;
- (BOOL)disconnectedReasonRequiresCallFailureUI;
- (BOOL)hasSendCustomMessageCapability;
- (BOOL)hasSendMessageCapability;
- (BOOL)shouldPlayInCallSounds;
- (BOOL)shouldShowAutomaticTelephonyCallFallback;
- (BOOL)shouldShowFailureAlert;
- (BOOL)supportsSendMessageIntent;
- (id)sendMessageIntentExtension;
@end

@implementation TUCall

- (BOOL)disconnectedReasonRequiresCallBackUI
{
  unsigned int v3 = [(TUCall *)self disconnectedReason];
  LOBYTE(v4) = 0;
  if (v3 > 0x18 || ((1 << v3) & 0x1C2C020) == 0) {
    return v4;
  }
  v5 = +[TUCallCenter sharedInstance];
  v6 = [v5 activeConversationForCall:self];

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
  v10 = PHDefaultLog();
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
    v6 = [(TUCall *)self remoteParticipantHandles];
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
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = PHDefaultLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          unsigned int v20 = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "application %@", buf, 0xCu);
        }

        v12 = [v10 bundleIdentifier];
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
  if (sendMessageIntentExtension_onceToken != -1) {
    dispatch_once(&sendMessageIntentExtension_onceToken, &__block_literal_global);
  }
  if (([(id)sendMessageIntentExtension_hasQueriedSendMessageIntentExtensionsCache containsObject:self] & 1) == 0)
  {
    [(id)sendMessageIntentExtension_hasQueriedSendMessageIntentExtensionsCache addObject:self];
    CFStringRef v35 = @"INSendMessageIntent";
    id v6 = +[NSArray arrayWithObjects:&v35 count:1];
    id v7 = +[NSExtension _intents_extensionMatchingAttributesForIntents:v6];
    id v8 = [v7 mutableCopy];

    unsigned int v9 = [(TUCall *)self provider];
    v10 = [v9 bundleURL];
    v11 = [v10 path];
    [v8 setObject:v11 forKeyedSubscript:NSExtensionContainingAppName];

    uint64_t v25 = 0;
    BOOL v26 = &v25;
    uint64_t v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__0;
    v29 = __Block_byref_object_dispose__0;
    id v30 = 0;
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    unsigned __int8 v13 = PHDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Looking up send message intent extension using attributes: %@", buf, 0xCu);
    }

    __int16 v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    __int16 v21 = __51__TUCall_PHUIUtilities__sendMessageIntentExtension__block_invoke_69;
    unsigned int v22 = &unk_10027C7B0;
    unsigned int v24 = &v25;
    unsigned int v14 = v12;
    __int16 v23 = v14;
    +[NSExtension extensionsWithMatchingAttributes:v8 completion:&v19];
    dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    long long v15 = PHDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      long long v16 = (void *)v26[5];
      *(_DWORD *)buf = 138412546;
      id v32 = v16;
      __int16 v33 = 2112;
      v34 = self;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Found send message intent extension %@ for call %@", buf, 0x16u);
    }

    [sendMessageIntentExtension_sendMessageIntentExtensionsCache setObject:v26[5] forKey:self v19, v20, v21, v22];
    _Block_object_dispose(&v25, 8);
  }
  long long v17 = [(id)sendMessageIntentExtension_sendMessageIntentExtensionsCache objectForKey:self];
LABEL_14:

  return v17;
}

void __51__TUCall_PHUIUtilities__sendMessageIntentExtension__block_invoke(id a1)
{
  uint64_t v1 = +[NSHashTable weakObjectsHashTable];
  unsigned int v2 = (void *)sendMessageIntentExtension_hasQueriedSendMessageIntentExtensionsCache;
  sendMessageIntentExtension_hasQueriedSendMessageIntentExtensionsCache = v1;

  uint64_t v3 = +[NSMapTable weakToStrongObjectsMapTable];
  uint64_t v4 = sendMessageIntentExtension_sendMessageIntentExtensionsCache;
  sendMessageIntentExtension_sendMessageIntentExtensionsCache = v3;

  _objc_release_x1(v3, v4);
}

void __51__TUCall_PHUIUtilities__sendMessageIntentExtension__block_invoke_69(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (!a2 || v5)
  {
    v10 = PHDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __51__TUCall_PHUIUtilities__sendMessageIntentExtension__block_invoke_69_cold_1();
    }
  }
  else
  {
    uint64_t v7 = [a2 firstObject];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    unsigned int v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __51__TUCall_PHUIUtilities__sendMessageIntentExtension__block_invoke_69_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Error retrieving extensions: %@", v2, v3, v4, v5, v6);
}

@end