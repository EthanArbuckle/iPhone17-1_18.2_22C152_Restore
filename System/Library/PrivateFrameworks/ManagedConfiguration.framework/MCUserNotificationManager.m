@interface MCUserNotificationManager
+ (id)sharedManager;
- (BOOL)hasOutstandingNotifications;
- (MCUserNotificationManager)init;
- (id)_invalidTargetMessageForDevice:(unint64_t)a3;
- (id)_purgatoryMessageForDevice:(unint64_t)a3;
- (id)displayQueueProfileError:(id)a3 targetDevice:(unint64_t)a4;
- (void)_updateTitle:(id *)a3 andMessage:(id *)a4 withTargetFailureInfoForDevice:(unint64_t)a5 fromError:(id)a6;
- (void)_updateTitle:(id *)a3 andMessage:(id *)a4 withUnavailableTargetInfoForDevice:(unint64_t)a5;
- (void)cancelAllNotificationsCompletionBlock:(id)a3;
- (void)cancelNotificationEntriesMatchingPredicate:(id)a3 completionBlock:(id)a4;
- (void)cancelNotificationsWithIdentifier:(id)a3 completionBlock:(id)a4;
- (void)dealloc;
- (void)displayUserNotificationWithIdentifier:(id)a3 title:(id)a4 message:(id)a5 defaultButtonText:(id)a6 alternateButtonText:(id)a7 otherButtonText:(id)a8 textfieldPlaceholder:(id)a9 displayOnLockScreen:(BOOL)a10 dismissOnLock:(BOOL)a11 displayInAppWhitelistModes:(BOOL)a12 dismissAfterTimeInterval:(double)a13 assertion:(id)a14 completionBlock:(id)a15;
- (void)inviteUserToVPPWithTitle:(id)a3 message:(id)a4 assertion:(id)a5 completionBlock:(id)a6;
- (void)mainQueueDidReceiveAppWhitelistChangedNotification;
- (void)promptUserToLogIntoiTunesWithTitle:(id)a3 message:(id)a4 assertion:(id)a5 completionBlock:(id)a6;
@end

@implementation MCUserNotificationManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1) {
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_39);
  }
  v2 = (void *)sharedManager_manager_0;
  return v2;
}

uint64_t __42__MCUserNotificationManager_sharedManager__block_invoke()
{
  sharedManager_manager_0 = objc_alloc_init(MCUserNotificationManager);
  return MEMORY[0x1F41817F8]();
}

- (MCUserNotificationManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)MCUserNotificationManager;
  v2 = [(MCUserNotificationManager *)&v9 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v4 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __33__MCUserNotificationManager_init__block_invoke;
    v7[3] = &unk_1E5A68780;
    v8 = v2;
    id v5 = (id)[v3 addObserverForName:@"com.apple.managedconfiguration.appwhitelistdidchange" object:0 queue:v4 usingBlock:v7];
  }
  return v2;
}

void __33__MCUserNotificationManager_init__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__MCUserNotificationManager_init__block_invoke_2;
  block[3] = &unk_1E5A65CB0;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __33__MCUserNotificationManager_init__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) mainQueueDidReceiveAppWhitelistChangedNotification];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(MCUserNotificationManager *)self cancelAllNotificationsCompletionBlock:0];
  v4.receiver = self;
  v4.super_class = (Class)MCUserNotificationManager;
  [(MCUserNotificationManager *)&v4 dealloc];
}

- (BOOL)hasOutstandingNotifications
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  id v2 = syncQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__MCUserNotificationManager_hasOutstandingNotifications__block_invoke;
  block[3] = &unk_1E5A67EE8;
  void block[4] = &v5;
  dispatch_sync(v2, block);

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __56__MCUserNotificationManager_hasOutstandingNotifications__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = syncQueueCurrentlyVisibleNotificationEntry != 0;
  return result;
}

- (void)promptUserToLogIntoiTunesWithTitle:(id)a3 message:(id)a4 assertion:(id)a5 completionBlock:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(id, uint64_t, void))a6;
  if (MCIsEffectivelyInAppWhitelistMode())
  {
    v13 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A13F0000, v13, OS_LOG_TYPE_ERROR, "Device is in an explicit whitelist mode", buf, 2u);
    }
    if (v12) {
      v12[2](v12, 3, 0);
    }
  }
  else
  {
    v14 = syncQueue();
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __98__MCUserNotificationManager_promptUserToLogIntoiTunesWithTitle_message_assertion_completionBlock___block_invoke;
    v15[3] = &unk_1E5A68820;
    v19 = v12;
    id v16 = v9;
    id v17 = v10;
    id v18 = v11;
    dispatch_async(v14, v15);
  }
}

void __98__MCUserNotificationManager_promptUserToLogIntoiTunesWithTitle_message_assertion_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = syncQueueiTunesLoginCompletionBlocks();
  if (![v2 count])
  {
    objc_super v4 = MCLocalizedString(@"MDM_APP_INSTALL_BUTTON_LOGIN");
    uint64_t v5 = MCLocalizedString(@"MDM_APP_INSTALL_BUTTON_CANCEL");
    if (*(void *)(a1 + 56))
    {
      v6 = (void *)MEMORY[0x1A6232FE0]();
      [v2 addObject:v6];
    }
    uint64_t v7 = objc_alloc_init(MCUserNotificationQueueEntry);
    [(MCUserNotificationQueueEntry *)v7 setTitle:*(void *)(a1 + 32)];
    [(MCUserNotificationQueueEntry *)v7 setMessage:*(void *)(a1 + 40)];
    [(MCUserNotificationQueueEntry *)v7 setDefaultButtonText:v4];
    [(MCUserNotificationQueueEntry *)v7 setAlternateButtonText:v5];
    [(MCUserNotificationQueueEntry *)v7 setDisplayOnLockScreen:0];
    [(MCUserNotificationQueueEntry *)v7 setDisplayInAppWhitelistModes:0];
    [(MCUserNotificationQueueEntry *)v7 setDismissAfterTimeInterval:900.0];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __98__MCUserNotificationManager_promptUserToLogIntoiTunesWithTitle_message_assertion_completionBlock___block_invoke_91;
    v9[3] = &unk_1E5A687F8;
    id v10 = *(id *)(a1 + 48);
    [(MCUserNotificationQueueEntry *)v7 setCompletionBlock:v9];
    [*(id *)(a1 + 48) park];
    char v8 = syncQueueNotificationQueue();
    [v8 addObject:v7];

    syncQueueCheckToShowNextNotification();
    goto LABEL_9;
  }
  v3 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A13F0000, v3, OS_LOG_TYPE_DEFAULT, "An iTunes login prompt is already shown. Not showing another prompt.", buf, 2u);
  }
  if (*(void *)(a1 + 56))
  {
    objc_super v4 = (void *)MEMORY[0x1A6232FE0]();
    [v2 addObject:v4];
LABEL_9:
  }
}

void __98__MCUserNotificationManager_promptUserToLogIntoiTunesWithTitle_message_assertion_completionBlock___block_invoke_91(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) unpark];
  v6 = syncQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__MCUserNotificationManager_promptUserToLogIntoiTunesWithTitle_message_assertion_completionBlock___block_invoke_2;
  block[3] = &unk_1E5A687D0;
  int v11 = a2;
  id v9 = v5;
  id v10 = *(id *)(a1 + 32);
  id v7 = v5;
  dispatch_async(v6, block);
}

void __98__MCUserNotificationManager_promptUserToLogIntoiTunesWithTitle_message_assertion_completionBlock___block_invoke_2(uint64_t a1)
{
  id v2 = syncQueueiTunesLoginCompletionBlocks();
  if ([v2 count])
  {
    v3 = (void *)[v2 copy];
    [v2 removeAllObjects];
    objc_super v4 = dispatch_get_global_queue(0, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __98__MCUserNotificationManager_promptUserToLogIntoiTunesWithTitle_message_assertion_completionBlock___block_invoke_3;
    v6[3] = &unk_1E5A687A8;
    id v7 = v3;
    int v10 = *(_DWORD *)(a1 + 48);
    id v8 = *(id *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    id v5 = v3;
    dispatch_async(v4, v6);
  }
}

void __98__MCUserNotificationManager_promptUserToLogIntoiTunesWithTitle_message_assertion_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    objc_super v4 = v2;
    *(_DWORD *)buf = 67109120;
    int v18 = [v3 count];
    _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_DEFAULT, "Calling completions for %d iTunes login events.", buf, 8u);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        int v11 = (void *)MEMORY[0x1A6232D90](v6);
        (*(void (**)(uint64_t, void, void))(v10 + 16))(v10, *(unsigned int *)(a1 + 56), *(void *)(a1 + 40));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v7 = v6;
    }
    while (v6);
  }
}

- (void)inviteUserToVPPWithTitle:(id)a3 message:(id)a4 assertion:(id)a5 completionBlock:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  long long v13 = syncQueue();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __88__MCUserNotificationManager_inviteUserToVPPWithTitle_message_assertion_completionBlock___block_invoke;
  v18[3] = &unk_1E5A68820;
  id v19 = v9;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  id v17 = v12;
  dispatch_async(v13, v18);
}

void __88__MCUserNotificationManager_inviteUserToVPPWithTitle_message_assertion_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = syncQueueVPPInvitationCompletionBlocks();
  if (![v2 count])
  {
    id v11 = MCLocalizedFormat(@"MDM_CAD_CONTINUE_BUTTON", v3, v4, v5, v6, v7, v8, v9, v23);
    id v19 = MCLocalizedFormat(@"MDM_CAD_CANCEL_BUTTON", v12, v13, v14, v15, v16, v17, v18, v24);
    if (*(void *)(a1 + 56))
    {
      id v20 = (void *)MEMORY[0x1A6232FE0]();
      [v2 addObject:v20];
    }
    id v21 = objc_alloc_init(MCUserNotificationQueueEntry);
    [(MCUserNotificationQueueEntry *)v21 setTitle:*(void *)(a1 + 32)];
    [(MCUserNotificationQueueEntry *)v21 setMessage:*(void *)(a1 + 40)];
    [(MCUserNotificationQueueEntry *)v21 setDefaultButtonText:v11];
    [(MCUserNotificationQueueEntry *)v21 setAlternateButtonText:v19];
    [(MCUserNotificationQueueEntry *)v21 setDisplayOnLockScreen:0];
    [(MCUserNotificationQueueEntry *)v21 setDisplayInAppWhitelistModes:0];
    [(MCUserNotificationQueueEntry *)v21 setDismissAfterTimeInterval:0.0];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __88__MCUserNotificationManager_inviteUserToVPPWithTitle_message_assertion_completionBlock___block_invoke_99;
    v25[3] = &unk_1E5A687F8;
    id v26 = *(id *)(a1 + 48);
    [(MCUserNotificationQueueEntry *)v21 setCompletionBlock:v25];
    [*(id *)(a1 + 48) park];
    id v22 = syncQueueNotificationQueue();
    [v22 addObject:v21];

    syncQueueCheckToShowNextNotification();
    goto LABEL_9;
  }
  id v10 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A13F0000, v10, OS_LOG_TYPE_DEFAULT, "An invitation prompt is already shown. Not showing another one.", buf, 2u);
  }
  if (*(void *)(a1 + 56))
  {
    id v11 = (void *)MEMORY[0x1A6232FE0]();
    [v2 addObject:v11];
LABEL_9:
  }
}

void __88__MCUserNotificationManager_inviteUserToVPPWithTitle_message_assertion_completionBlock___block_invoke_99(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) unpark];
  uint64_t v6 = syncQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__MCUserNotificationManager_inviteUserToVPPWithTitle_message_assertion_completionBlock___block_invoke_2;
  block[3] = &unk_1E5A687D0;
  int v11 = a2;
  id v9 = v5;
  id v10 = *(id *)(a1 + 32);
  id v7 = v5;
  dispatch_sync(v6, block);
}

void __88__MCUserNotificationManager_inviteUserToVPPWithTitle_message_assertion_completionBlock___block_invoke_2(uint64_t a1)
{
  id v2 = syncQueueVPPInvitationCompletionBlocks();
  if ([v2 count])
  {
    uint64_t v3 = [v2 objectAtIndexedSubscript:0];
    uint64_t v4 = 0;
    if ((unint64_t)[v2 count] >= 2)
    {
      uint64_t v4 = objc_msgSend(v2, "subarrayWithRange:", 1, objc_msgSend(v2, "count") - 1);
    }
    [v2 removeAllObjects];
    id v5 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__MCUserNotificationManager_inviteUserToVPPWithTitle_message_assertion_completionBlock___block_invoke_3;
    block[3] = &unk_1E5A68848;
    id v9 = v4;
    id v12 = v3;
    int v13 = *(_DWORD *)(a1 + 48);
    id v10 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    id v6 = v3;
    id v7 = v4;
    dispatch_sync(v5, block);
  }
}

void __88__MCUserNotificationManager_inviteUserToVPPWithTitle_message_assertion_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    *(_DWORD *)buf = 67109120;
    int v18 = [v3 count] + 1;
    _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_DEFAULT, "Calling completions for %d invitation prompts", buf, 8u);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        id v11 = (void *)MEMORY[0x1A6232D90](v6);
        (*(void (**)(uint64_t, uint64_t, void))(v10 + 16))(v10, 3, *(void *)(a1 + 40));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v7 = v6;
    }
    while (v6);
  }
}

- (id)displayQueueProfileError:(id)a3 targetDevice:(unint64_t)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 userInfo];
  uint64_t v8 = *MEMORY[0x1E4F28A50];
  uint64_t v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  uint64_t v10 = 0;
  id v11 = v6;
  while (v9)
  {
    long long v12 = v11;
    id v11 = v9;

    long long v13 = [v11 localizedDescription];

    if (v13)
    {
      uint64_t v14 = [v11 localizedDescription];

      uint64_t v10 = (void *)v14;
    }

    long long v15 = [v11 userInfo];
    uint64_t v9 = [v15 objectForKeyedSubscript:v8];
  }
  if ([v6 MCContainsErrorDomain:@"MCProfileErrorDomain" code:1016])
  {
    MCLocalizedString(@"INSTALL_PROFILE_ERROR_INCOMPATIBLE_TITLE");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = @"INSTALL_PROFILE_ERROR_INCOMPATIBLE_MESSAGE";
LABEL_9:
    MCLocalizedString(v17);
    id v18 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
    uint64_t v19 = 0;
LABEL_11:
    uint64_t v10 = v18;
    goto LABEL_12;
  }
  if ([v6 MCContainsErrorDomain:@"MCProfileErrorDomain" code:1017])
  {
    MCLocalizedString(@"INSTALL_PROFILE_ERROR_UNSUPPORTED_TITLE");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = @"INSTALL_PROFILE_ERROR_UNSUPPORTED_MESSAGE";
    goto LABEL_9;
  }
  v25 = [v6 domain];
  int v26 = [v25 isEqualToString:@"MCInstallationErrorDomain"];

  if (!v26)
  {
    uint64_t v19 = 0;
    id v16 = 0;
    goto LABEL_12;
  }
  uint64_t v27 = [v6 code];
  uint64_t v19 = 0;
  if (v27 > 4036)
  {
    if (v27 != 4037)
    {
      if (v27 == 4054)
      {
        MCLocalizedString(@"INSTALL_PROFILE_DISABLED_TITLE");
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        v29 = @"ERROR_PROFILE_DRIVEN_ENROLLMENT_BLOCKED";
      }
      else
      {
        if (v27 != 4055)
        {
LABEL_46:
          id v16 = 0;
          goto LABEL_12;
        }
        MCLocalizedString(@"INSTALL_PROFILE_DISABLED_TITLE");
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        v29 = @"ERROR_PROFILE_DRIVEN_USER_ENROLLMENT_NOT_SUPPORTED";
      }
      uint64_t v28 = MCLocalizedErrorStringByDevice(v29);
      goto LABEL_45;
    }
    v33 = [v6 userInfo];
    v34 = [v33 objectForKeyedSubscript:@"RestrictionCause"];

    if ([v34 isEqualToString:@"Profile"])
    {
      v35 = @"INSTALL_PROFILE_DISABLED_MESSAGE_PROFILE";
    }
    else
    {
      if ([v34 isEqualToString:@"LockdownMode"])
      {
        uint64_t v36 = MCLocalizedStringByDevice(@"INSTALL_PROFILE_DISABLED_MESSAGE_LOCKDOWN_MODE");
LABEL_53:
        v38 = (void *)v36;

        MCLocalizedString(@"INSTALL_PROFILE_DISABLED_TITLE");
        id v16 = (id)objc_claimAutoreleasedReturnValue();

        uint64_t v19 = 0;
        uint64_t v10 = v38;
LABEL_12:
        if (!v10)
        {
          id v20 = _MCLogObjects;
          if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v43 = v6;
            _os_log_impl(&dword_1A13F0000, v20, OS_LOG_TYPE_FAULT, "Please file a radar to 'Remote Management - MDMv1 | All' to add a user notification for error: %{public}@", buf, 0xCu);
          }
          uint64_t v10 = MCLocalizedString(@"INSTALL_PROFILE_ERROR_GENERAL_MESSAGE");
        }
        id v21 = v16;
        if (v16)
        {
          if (v19) {
            goto LABEL_18;
          }
        }
        else
        {
          id v21 = MCLocalizedString(@"INSTALL_PROFILE_ERROR_GENERAL_TITLE");
          if (v19)
          {
LABEL_18:
            BYTE2(v39) = 1;
            LOWORD(v39) = 0;
            -[MCUserNotificationManager displayUserNotificationWithIdentifier:title:message:defaultButtonText:alternateButtonText:otherButtonText:textfieldPlaceholder:displayOnLockScreen:dismissOnLock:displayInAppWhitelistModes:dismissAfterTimeInterval:assertion:completionBlock:](self, "displayUserNotificationWithIdentifier:title:message:defaultButtonText:alternateButtonText:otherButtonText:textfieldPlaceholder:displayOnLockScreen:dismissOnLock:displayInAppWhitelistModes:dismissAfterTimeInterval:assertion:completionBlock:", 0, v21, v10, v19, 0, 0, 0.0, 0, v39, 0, 0);
            if (v16)
            {
LABEL_20:
              id v22 = v11;

              goto LABEL_21;
            }
LABEL_19:

            goto LABEL_20;
          }
        }
        uint64_t v24 = MCLocalizedString(@"INSTALL_PROFILE_ERROR_OK");
        BYTE2(v39) = 1;
        LOWORD(v39) = 0;
        -[MCUserNotificationManager displayUserNotificationWithIdentifier:title:message:defaultButtonText:alternateButtonText:otherButtonText:textfieldPlaceholder:displayOnLockScreen:dismissOnLock:displayInAppWhitelistModes:dismissAfterTimeInterval:assertion:completionBlock:](self, "displayUserNotificationWithIdentifier:title:message:defaultButtonText:alternateButtonText:otherButtonText:textfieldPlaceholder:displayOnLockScreen:dismissOnLock:displayInAppWhitelistModes:dismissAfterTimeInterval:assertion:completionBlock:", 0, v21, v10, v24, 0, 0, 0.0, 0, v39, 0, 0);

        if (v16) {
          goto LABEL_20;
        }
        goto LABEL_19;
      }
      if ([v34 isEqualToString:@"StolenDeviceProtection"])
      {
        id v37 = v11;

        goto LABEL_39;
      }
      v35 = @"INSTALL_PROFILE_DISABLED_MESSAGE";
    }
    uint64_t v36 = MCLocalizedString(v35);
    goto LABEL_53;
  }
  if (v27 != 4009)
  {
    if (v27 == 4035)
    {
      v31 = [v6 userInfo];
      v32 = [v31 objectForKeyedSubscript:v8];

      id v40 = v10;
      id v41 = 0;
      [(MCUserNotificationManager *)self _updateTitle:&v41 andMessage:&v40 withTargetFailureInfoForDevice:a4 fromError:v32];
      id v16 = v41;
      id v18 = v40;

      goto LABEL_10;
    }
    if (v27 == 4036)
    {
      MCLocalizedString(@"INSTALL_PROFILE_TITLE");
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v28 = [(MCUserNotificationManager *)self _purgatoryMessageForDevice:a4];
LABEL_45:
      id v18 = (id)v28;

      uint64_t v19 = MCLocalizedString(@"INSTALL_PROFILE_OK");
      goto LABEL_11;
    }
    goto LABEL_46;
  }
  id v30 = v11;
LABEL_39:
  id v16 = 0;
LABEL_21:

  return v11;
}

- (void)displayUserNotificationWithIdentifier:(id)a3 title:(id)a4 message:(id)a5 defaultButtonText:(id)a6 alternateButtonText:(id)a7 otherButtonText:(id)a8 textfieldPlaceholder:(id)a9 displayOnLockScreen:(BOOL)a10 dismissOnLock:(BOOL)a11 displayInAppWhitelistModes:(BOOL)a12 dismissAfterTimeInterval:(double)a13 assertion:(id)a14 completionBlock:(id)a15
{
  id v41 = a3;
  id v21 = a4;
  id v22 = a5;
  id v23 = a6;
  id v24 = a7;
  id v40 = a8;
  id v25 = a9;
  id v39 = a14;
  id v38 = a15;
  if (a12 || !MCIsEffectivelyInAppWhitelistMode())
  {
    id v42 = v23;
    id v32 = v24;
    id v33 = v21;
    int v26 = v22;
    v34 = objc_alloc_init(MCUserNotificationQueueEntry);
    [(MCUserNotificationQueueEntry *)v34 setTitle:v21];
    [(MCUserNotificationQueueEntry *)v34 setMessage:v22];
    [(MCUserNotificationQueueEntry *)v34 setDefaultButtonText:v42];
    [(MCUserNotificationQueueEntry *)v34 setAlternateButtonText:v32];
    v29 = v40;
    [(MCUserNotificationQueueEntry *)v34 setOtherButtonText:v40];
    [(MCUserNotificationQueueEntry *)v34 setTextfieldPlaceholder:v25];
    [(MCUserNotificationQueueEntry *)v34 setDisplayOnLockScreen:a10];
    [(MCUserNotificationQueueEntry *)v34 setDismissOnLock:a11];
    [(MCUserNotificationQueueEntry *)v34 setDisplayInAppWhitelistModes:a12];
    [(MCUserNotificationQueueEntry *)v34 setDismissAfterTimeInterval:a13];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __268__MCUserNotificationManager_displayUserNotificationWithIdentifier_title_message_defaultButtonText_alternateButtonText_otherButtonText_textfieldPlaceholder_displayOnLockScreen_dismissOnLock_displayInAppWhitelistModes_dismissAfterTimeInterval_assertion_completionBlock___block_invoke;
    v45[3] = &unk_1E5A68870;
    v31 = v39;
    id v35 = v39;
    id v46 = v35;
    id v30 = v38;
    id v47 = v38;
    [(MCUserNotificationQueueEntry *)v34 setCompletionBlock:v45];
    uint64_t v28 = v41;
    [(MCUserNotificationQueueEntry *)v34 setIdentifier:v41];
    [v35 park];
    uint64_t v36 = syncQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __268__MCUserNotificationManager_displayUserNotificationWithIdentifier_title_message_defaultButtonText_alternateButtonText_otherButtonText_textfieldPlaceholder_displayOnLockScreen_dismissOnLock_displayInAppWhitelistModes_dismissAfterTimeInterval_assertion_completionBlock___block_invoke_2;
    block[3] = &unk_1E5A65CB0;
    uint64_t v44 = v34;
    id v37 = v34;
    dispatch_barrier_async(v36, block);

    id v21 = v33;
    id v24 = v32;
    id v23 = v42;
  }
  else
  {
    int v26 = v22;
    uint64_t v27 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A13F0000, v27, OS_LOG_TYPE_DEFAULT, "Not displaying notification in limited apps mode.", buf, 2u);
    }
    v29 = v40;
    uint64_t v28 = v41;
    id v30 = v38;
    v31 = v39;
    if (v38) {
      (*((void (**)(id, uint64_t, void))v38 + 2))(v38, 3, 0);
    }
  }
}

void __268__MCUserNotificationManager_displayUserNotificationWithIdentifier_title_message_defaultButtonText_alternateButtonText_otherButtonText_textfieldPlaceholder_displayOnLockScreen_dismissOnLock_displayInAppWhitelistModes_dismissAfterTimeInterval_assertion_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  [*(id *)(a1 + 32) unpark];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
  }
}

void __268__MCUserNotificationManager_displayUserNotificationWithIdentifier_title_message_defaultButtonText_alternateButtonText_otherButtonText_textfieldPlaceholder_displayOnLockScreen_dismissOnLock_displayInAppWhitelistModes_dismissAfterTimeInterval_assertion_completionBlock___block_invoke_2(uint64_t a1)
{
  id v2 = syncQueueNotificationQueue();
  [v2 addObject:*(void *)(a1 + 32)];

  syncQueueCheckToShowNextNotification();
}

- (void)cancelAllNotificationsCompletionBlock:(id)a3
{
}

uint64_t __67__MCUserNotificationManager_cancelAllNotificationsCompletionBlock___block_invoke()
{
  return 1;
}

- (void)mainQueueDidReceiveAppWhitelistChangedNotification
{
  id v2 = syncQueue();
  dispatch_barrier_sync(v2, &__block_literal_global_149);
}

void __79__MCUserNotificationManager_mainQueueDidReceiveAppWhitelistChangedNotification__block_invoke()
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (MCIsEffectivelyInAppWhitelistMode())
  {
    if (syncQueueCurrentlyVisibleNotificationEntry
      && ([(id)syncQueueCurrentlyVisibleNotificationEntry displayInAppWhitelistModes] & 1) == 0)
    {
      v0 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_INFO, "Dismissing notification because we entered limited apps mode.", buf, 2u);
      }
      v1 = [(id)syncQueueCurrentlyVisibleNotificationEntry notification];
      CFUserNotificationCancel(v1);

      id v2 = (void *)syncQueueCurrentlyVisibleNotificationEntry;
      syncQueueCurrentlyVisibleNotificationEntry = 0;
    }
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v5 = syncQueueNotificationQueue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if ([v10 displayInAppWhitelistModes]) {
            id v11 = v4;
          }
          else {
            id v11 = v3;
          }
          [v11 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v7);
    }

    long long v12 = syncQueueNotificationQueue();
    [v12 removeAllObjects];

    long long v13 = syncQueueNotificationQueue();
    [v13 addObjectsFromArray:v4];

    if ([v3 count])
    {
      uint64_t v14 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        long long v15 = v14;
        int v16 = [v3 count];
        *(_DWORD *)buf = 67109120;
        int v25 = v16;
        _os_log_impl(&dword_1A13F0000, v15, OS_LOG_TYPE_INFO, "Canceling %d pending notifications because we entered limited apps mode.", buf, 8u);
      }
      uint64_t v17 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __79__MCUserNotificationManager_mainQueueDidReceiveAppWhitelistChangedNotification__block_invoke_151;
      block[3] = &unk_1E5A65CB0;
      id v19 = v3;
      dispatch_async(v17, block);
    }
  }
}

void __79__MCUserNotificationManager_mainQueueDidReceiveAppWhitelistChangedNotification__block_invoke_151(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        uint64_t v7 = objc_msgSend(v6, "completionBlock", (void)v9);

        if (v7)
        {
          uint64_t v8 = [v6 completionBlock];
          v8[2](v8, 3, 0);
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }
}

- (void)cancelNotificationsWithIdentifier:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__MCUserNotificationManager_cancelNotificationsWithIdentifier_completionBlock___block_invoke;
  v8[3] = &unk_1E5A688B8;
  id v9 = v6;
  id v7 = v6;
  [(MCUserNotificationManager *)self cancelNotificationEntriesMatchingPredicate:v8 completionBlock:a4];
}

uint64_t __79__MCUserNotificationManager_cancelNotificationsWithIdentifier_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 identifier];
  if (v4 || *(void *)(a1 + 32))
  {
    uint64_t v5 = [v3 identifier];
    uint64_t v6 = [v5 isEqual:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

- (void)cancelNotificationEntriesMatchingPredicate:(id)a3 completionBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __88__MCUserNotificationManager_cancelNotificationEntriesMatchingPredicate_completionBlock___block_invoke;
    v7[3] = &unk_1E5A68930;
    id v8 = v5;
    id v9 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

void __88__MCUserNotificationManager_cancelNotificationEntriesMatchingPredicate_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = syncQueue();
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __88__MCUserNotificationManager_cancelNotificationEntriesMatchingPredicate_completionBlock___block_invoke_2;
  v3[3] = &unk_1E5A68930;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  dispatch_barrier_sync(v2, v3);
}

void __88__MCUserNotificationManager_cancelNotificationEntriesMatchingPredicate_completionBlock___block_invoke_2(uint64_t a1)
{
  if (syncQueueCurrentlyVisibleNotificationEntry && (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v2 = [(id)syncQueueCurrentlyVisibleNotificationEntry notification];
    CFUserNotificationCancel(v2);
  }
  id v3 = syncQueueNotificationQueue();
  id v4 = (void *)MEMORY[0x1E4F28F60];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__MCUserNotificationManager_cancelNotificationEntriesMatchingPredicate_completionBlock___block_invoke_3;
  v13[3] = &unk_1E5A688E0;
  id v14 = *(id *)(a1 + 32);
  id v5 = [v4 predicateWithBlock:v13];
  id v6 = [v3 filteredArrayUsingPredicate:v5];

  id v7 = syncQueueNotificationQueue();
  [v7 removeObjectsInArray:v6];

  id v8 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__MCUserNotificationManager_cancelNotificationEntriesMatchingPredicate_completionBlock___block_invoke_4;
  block[3] = &unk_1E5A68908;
  id v11 = v6;
  id v12 = *(id *)(a1 + 40);
  id v9 = v6;
  dispatch_async(v8, block);
}

uint64_t __88__MCUserNotificationManager_cancelNotificationEntriesMatchingPredicate_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __88__MCUserNotificationManager_cancelNotificationEntriesMatchingPredicate_completionBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "completionBlock", (void)v11);

        if (v8)
        {
          id v9 = [v7 completionBlock];
          v9[2](v9, 3, 0);
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_updateTitle:(id *)a3 andMessage:(id *)a4 withTargetFailureInfoForDevice:(unint64_t)a5 fromError:(id)a6
{
  switch([a6 code])
  {
    case 1011:
      MCLocalizedString(@"INSTALL_WARNING_TARGET_GENERAL_TITLE");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      long long v10 = [(MCUserNotificationManager *)self _invalidTargetMessageForDevice:a5];
      goto LABEL_8;
    case 1012:
      [(MCUserNotificationManager *)self _updateTitle:a3 andMessage:a4 withUnavailableTargetInfoForDevice:a5];
      return;
    case 1014:
      MCLocalizedString(@"INSTALL_WARNING_TARGET_UNAVAILABLE_WATCH_TITLE");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      long long v10 = MCLocalizedFormat(@"INSTALL_WARNING_TARGET_UNAVAILABLE_WATCH_ARCHIVED_MESSAGE", v11, v12, v13, v14, v15, v16, v17, v18);
      goto LABEL_8;
    case 1015:
      MCLocalizedString(@"INSTALL_WARNING_TARGET_GENERAL_TITLE");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      long long v10 = MCLocalizedStringByDevice(@"INSTALL_WARNING_TARGET_MISMATCH_MESSAGE");
LABEL_8:
      *a4 = v10;
      break;
    default:
      return;
  }
}

- (void)_updateTitle:(id *)a3 andMessage:(id *)a4 withUnavailableTargetInfoForDevice:(unint64_t)a5
{
  if (a5 == 3)
  {
    MCLocalizedString(@"INSTALL_WARNING_TARGET_UNAVAILABLE_HOMEPOD_TITLE");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = @"INSTALL_WARNING_TARGET_UNAVAILABLE_HOMEPOD_MESSAGE";
  }
  else if (a5 == 2)
  {
    MCLocalizedString(@"INSTALL_WARNING_TARGET_UNAVAILABLE_WATCH_TITLE");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    if (!MCGestaltIsPhone())
    {
      id v8 = MCLocalizedStringByDevice(@"INSTALL_WARNING_TARGET_MISMATCH_MESSAGE");
      goto LABEL_8;
    }
    id v7 = @"INSTALL_WARNING_TARGET_UNAVAILABLE_WATCH_MESSAGE";
  }
  else
  {
    MCLocalizedString(@"INSTALL_WARNING_TARGET_UNAVAILABLE_TITLE");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = @"INSTALL_WARNING_TARGET_UNAVAILABLE_MESSAGE";
  }
  id v8 = MCLocalizedString(v7);
LABEL_8:
  *a4 = v8;
}

- (id)_purgatoryMessageForDevice:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a3 - 1;
  if (a3 - 1 < 6 && ((0x27u >> v4) & 1) != 0)
  {
    uint64_t v5 = off_1E5A689C0[v4];
  }
  else
  {
    id v6 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      id v7 = v6;
      id v8 = +[MCProfile stringForDeviceType:a3];
      int v11 = 138543362;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_ERROR, "MCUserNotificationManager: No purgatory message for device of type %{public}@", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v5 = @"INSTALL_PROFILE_MESSAGE_SETTINGS_APP";
  }
  id v9 = MCLocalizedString(v5);
  return v9;
}

- (id)_invalidTargetMessageForDevice:(unint64_t)a3
{
  if (a3 - 1 > 5) {
    uint64_t v3 = @"INSTALL_WARNING_TARGET_INVALID_MESSAGE";
  }
  else {
    uint64_t v3 = off_1E5A68970[a3 - 1];
  }
  unint64_t v4 = MCLocalizedString(v3);
  return v4;
}

@end