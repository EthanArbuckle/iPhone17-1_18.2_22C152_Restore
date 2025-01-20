@interface CKSceneController
- (BOOL)shouldSuppressNotificationForMessageWithRelevantContext:(id)a3 withAlertSupressionContextForScenes:(id)a4;
- (id)_suppressionContextsForChatIdentifier:(id)a3 personCentricID:(id)a4;
- (id)alertSuppressionContextsFromForegroundActiveScenes;
- (id)messagesSceneDelegate;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation CKSceneController

- (id)messagesSceneDelegate
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F42738] sharedApplication];
  v3 = [v2 connectedScenes];
  v4 = [v3 allObjects];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
  v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "delegate", (void)v13);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v6 = [v9 delegate];
          goto LABEL_11;
        }
      }
      v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)alertSuppressionContextsFromForegroundActiveScenes
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v2 = [MEMORY[0x1E4F42738] sharedApplication];
  v3 = [v2 connectedScenes];
  v4 = [v3 allObjects];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v10 = [v9 delegate];
        if (![v10 conformsToProtocol:&unk_1EDF6E618])
        {
          if (!IMOSLoggingEnabled()) {
            goto LABEL_26;
          }
          long long v13 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v25 = v9;
            __int16 v26 = 2112;
            v27 = v10;
            _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Not collecting alert suppression context from non-messages scene: %@ delegate: %@", buf, 0x16u);
          }
          goto LABEL_25;
        }
        BOOL v11 = [v9 activationState] == 0;
        int v12 = IMOSLoggingEnabled();
        if (!v11)
        {
          if (!v12) {
            goto LABEL_26;
          }
          long long v13 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v25 = v9;
            _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Not collecting alert suppression context from non-foreground scene: %@ ", buf, 0xCu);
          }
          goto LABEL_25;
        }
        if (v12)
        {
          long long v14 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v25 = v9;
            _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Scene is foregrounded: %@", buf, 0xCu);
          }
        }
        if (+[CKApplicationState isApplicationActive])
        {
          long long v15 = [v10 alertSuppressionContexts];
          [v19 unionSet:v15];

          goto LABEL_26;
        }
        if (IMOSLoggingEnabled())
        {
          long long v13 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Not collecting alert suppression context from scene while mac app state is inactive", buf, 2u);
          }
LABEL_25:
        }
LABEL_26:
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v6);
  }

  if (IMOSLoggingEnabled())
  {
    long long v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v19;
      _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Active alert suppression contexts: %@", buf, 0xCu);
    }
  }
  v17 = (void *)[v19 copy];

  return v17;
}

- (BOOL)shouldSuppressNotificationForMessageWithRelevantContext:(id)a3 withAlertSupressionContextForScenes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 intersectsSet:v5])
  {
    BOOL v7 = +[CKStarkManager isCarPlayConnected];
    int v8 = IMOSLoggingEnabled();
    if (v7)
    {
      if (v8)
      {
        v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          __int16 v17 = 0;
          v10 = "There is an active alert suppression context matching this alert (the relvant chat or conversation list "
                "is being shown on a screen), but the user is connected to CarPlay, so the notifications should never be suppressed";
          BOOL v11 = (uint8_t *)&v17;
LABEL_14:
          _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, v10, v11, 2u);
          goto LABEL_15;
        }
        goto LABEL_15;
      }
    }
    else if (v8)
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v10 = "There is an alert suppression context matching this alert (the relvant chat or conversation list is being "
              "shown on screen). System notification should be suppressed, in favor of in-app alert sounds.";
        BOOL v11 = buf;
        goto LABEL_14;
      }
LABEL_15:
    }
    BOOL v13 = !v7;
    goto LABEL_17;
  }
  if (IMOSLoggingEnabled())
  {
    int v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long v15 = 0;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "There is no alert suppression context matching this alert (the relvant chat or conversation list is not being shown on screen). System notification should be allowed.", v15, 2u);
    }
  }
  BOOL v13 = 0;
LABEL_17:

  return v13;
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  BOOL v11 = [v9 request];
  int v12 = [v11 content];
  BOOL v13 = [v12 threadIdentifier];

  long long v14 = [v9 request];
  long long v15 = [v14 content];
  long long v16 = [v15 userInfo];
  __int16 v17 = [v16 objectForKeyedSubscript:@"CKBBContextKeySenderPersonCentricID"];

  if (IMOSLoggingEnabled())
  {
    uint64_t v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v26 = 138412546;
      v27 = v13;
      __int16 v28 = 2112;
      uint64_t v29 = v17;
      _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "willPresentNotification called with notification thread identifier %@, personCentricID %@", (uint8_t *)&v26, 0x16u);
    }
  }
  id v19 = [(CKSceneController *)self _suppressionContextsForChatIdentifier:v13 personCentricID:v17];
  long long v20 = [(CKSceneController *)self alertSuppressionContextsFromForegroundActiveScenes];
  BOOL v21 = [(CKSceneController *)self shouldSuppressNotificationForMessageWithRelevantContext:v19 withAlertSupressionContextForScenes:v20];
  int v22 = IMOSLoggingEnabled();
  if (v21)
  {
    if (v22)
    {
      long long v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_18EF18000, v23, OS_LOG_TYPE_INFO, "Supressing system notification and sound. A foreground active scene is displaying the relevant conversation, or the conversation list.", (uint8_t *)&v26, 2u);
      }
    }
    if (v10)
    {
      uint64_t v24 = 0;
LABEL_18:
      v10[2](v10, v24);
    }
  }
  else
  {
    if (v22)
    {
      id v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "Displaying system notification and sound, neither the relevant conversation nor the conversation list, is being displayed in a foreground active scene", (uint8_t *)&v26, 2u);
      }
    }
    if (v10)
    {
      uint64_t v24 = 6;
      goto LABEL_18;
    }
  }
}

- (id)_suppressionContextsForChatIdentifier:(id)a3 personCentricID:(id)a4
{
  return CKSuppressionContextsForIdentifiers(a3, a4);
}

@end