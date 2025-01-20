@interface ANUserNotificationController
+ (id)sharedController;
- (ANUserNotificationController)init;
- (ANUserNotificationControllerDelegate)delegate;
- (BOOL)_canUpdateUserNotificationForHome:(id)a3;
- (BOOL)canPostUserNotificationForAnnouncement:(id)a3 home:(id)a4;
- (BOOL)hasDeliveredNotificationsWithGroupID:(id)a3;
- (BOOL)suspendNotificationExpiration;
- (UNUserNotificationCenter)notificationCenter;
- (id)_contentForSendFailureForAnnouncement:(id)a3 homeName:(id)a4;
- (id)_userInfoForFailedDeliveryForAnnouncement:(id)a3;
- (id)contentBodyForAnnouncers:(id)a3 inHome:(id)a4;
- (void)_postNotificationWithContent:(id)a3 requestID:(id)a4;
- (void)_replaceContentForRequestWithRequestID:(id)a3 replacementContent:(id)a4 completionHandler:(id)a5;
- (void)_replaceContentForRequestsWithThreadID:(id)a3 replacementContent:(id)a4;
- (void)_setContentExpirationDate:(id)a3 forNotificationsWithThreadIDs:(id)a4;
- (void)cleanForExit;
- (void)contentWithAnnouncement:(ANAnnouncement *)a3 groupAnnouncements:(NSArray *)a4 home:(HMHome *)a5 threadIdentifier:(NSString *)a6 isReplacement:(BOOL)a7 suspendExpiration:(BOOL)a8 completionHandler:(id)a9;
- (void)pauseExpirationForNotificationsWithGroupIDs:(id)a3;
- (void)postNotificationForAnnouncement:(id)a3 groupAnnouncements:(id)a4 home:(id)a5 groupID:(id)a6;
- (void)postSendFailureNotificationForAnnouncement:(id)a3;
- (void)removeNotificationWithGroupID:(id)a3;
- (void)resumeExpirationForNotificationsWithGroupIDs:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSuspendNotificationExpiration:(BOOL)a3;
- (void)updateNotificationForAnnouncements:(id)a3 home:(id)a4 groupID:(id)a5;
@end

@implementation ANUserNotificationController

- (ANUserNotificationController)init
{
  v6.receiver = self;
  v6.super_class = (Class)ANUserNotificationController;
  v2 = [(ANUserNotificationController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F44680]) initWithBundleIdentifier:@"com.apple.Home"];
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = (UNUserNotificationCenter *)v3;
  }
  return v2;
}

+ (id)sharedController
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__ANUserNotificationController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, block);
  }
  v2 = (void *)sharedController_sharedController;
  return v2;
}

uint64_t __48__ANUserNotificationController_sharedController__block_invoke()
{
  sharedController_sharedController = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (BOOL)canPostUserNotificationForAnnouncement:(id)a3 home:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F4A940];
  id v5 = a4;
  int v6 = [v4 isHomeAppInstalled];
  int v7 = objc_msgSend(v5, "an_announceNotificationsEnabledForCurrentUserWithOverrideHomeLocationStatus:", 0);

  v8 = ANLogHandleUserNotificationsController();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138413058;
    v11 = &stru_1F34A0E10;
    __int16 v12 = 1024;
    int v13 = v7 & v6;
    __int16 v14 = 1024;
    int v15 = v6;
    __int16 v16 = 1024;
    int v17 = v7;
    _os_log_impl(&dword_1DA5ED000, v8, OS_LOG_TYPE_DEFAULT, "%@Can Post User Notification: %d (Home App Installed: %d, Enabled for Home: %d)", (uint8_t *)&v10, 0x1Eu);
  }

  return v7 & v6;
}

- (void)postNotificationForAnnouncement:(id)a3 groupAnnouncements:(id)a4 home:(id)a5 groupID:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v25 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([(ANUserNotificationController *)self canPostUserNotificationForAnnouncement:v10 home:v11])
  {
    int v13 = [MEMORY[0x1E4F4A8E0] sharedInstance];
    int v14 = [v13 BOOLForDefault:*MEMORY[0x1E4F4A700]];

    if (v14)
    {
      id v15 = v12;
    }
    else
    {
      id v15 = [v10 identifier];
    }
    int v17 = v15;
    uint64_t v18 = [(ANUserNotificationController *)self notificationCenter];
    v19 = [v18 deliveredNotifications];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __96__ANUserNotificationController_postNotificationForAnnouncement_groupAnnouncements_home_groupID___block_invoke;
    v30[3] = &unk_1E6BCDD40;
    id v20 = v17;
    id v31 = v20;
    v21 = objc_msgSend(v19, "na_firstObjectPassingTest:", v30);

    BOOL v22 = [(ANUserNotificationController *)self suspendNotificationExpiration];
    objc_initWeak((id *)buf, self);
    BOOL v23 = [(ANUserNotificationController *)self suspendNotificationExpiration];
    if (v21) {
      BOOL v24 = v22;
    }
    else {
      BOOL v24 = 0;
    }
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __96__ANUserNotificationController_postNotificationForAnnouncement_groupAnnouncements_home_groupID___block_invoke_2;
    v26[3] = &unk_1E6BCDD68;
    objc_copyWeak(&v28, (id *)buf);
    BOOL v29 = v24;
    __int16 v16 = v20;
    v27 = v16;
    [(ANUserNotificationController *)self contentWithAnnouncement:v10 groupAnnouncements:v25 home:v11 threadIdentifier:v12 isReplacement:v24 suspendExpiration:v23 completionHandler:v26];

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    __int16 v16 = ANLogHandleUserNotificationsController();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v16, OS_LOG_TYPE_DEFAULT, "%@Skip posting user notification", buf, 0xCu);
    }
  }
}

uint64_t __96__ANUserNotificationController_postNotificationForAnnouncement_groupAnnouncements_home_groupID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 request];
  v4 = [v3 identifier];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

void __96__ANUserNotificationController_postNotificationForAnnouncement_groupAnnouncements_home_groupID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = WeakRetained;
  if (*(unsigned char *)(a1 + 48)) {
    [WeakRetained _replaceContentForRequestWithRequestID:v6 replacementContent:v4 completionHandler:0];
  }
  else {
    [WeakRetained _postNotificationWithContent:v4 requestID:v6];
  }
}

- (void)updateNotificationForAnnouncements:(id)a3 home:(id)a4 groupID:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(ANUserNotificationController *)self _canUpdateUserNotificationForHome:v9])
  {
    int v14 = ANLogHandleUserNotificationsController();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      BOOL v22 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v14, OS_LOG_TYPE_DEFAULT, "%@Skip updating user notification", buf, 0xCu);
    }
    goto LABEL_9;
  }
  if ([v8 count])
  {
    id v11 = [MEMORY[0x1E4F4A8E0] sharedInstance];
    char v12 = [v11 BOOLForDefault:*MEMORY[0x1E4F4A700]];

    if (v12)
    {
      int v13 = [v8 firstObject];
      id v20 = v13;
      int v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    }
    else
    {
      int v14 = v8;
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __80__ANUserNotificationController_updateNotificationForAnnouncements_home_groupID___block_invoke;
    v15[3] = &unk_1E6BCDDB8;
    v15[4] = self;
    id v16 = v8;
    id v17 = v9;
    id v18 = v10;
    char v19 = v12;
    [v14 enumerateObjectsUsingBlock:v15];

LABEL_9:
  }
}

void __80__ANUserNotificationController_updateNotificationForAnnouncements_home_groupID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = [v5 suspendNotificationExpiration];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__ANUserNotificationController_updateNotificationForAnnouncements_home_groupID___block_invoke_2;
  v10[3] = &unk_1E6BCDD90;
  objc_copyWeak(&v13, &location);
  char v14 = *(unsigned char *)(a1 + 64);
  id v11 = *(id *)(a1 + 56);
  id v9 = v3;
  id v12 = v9;
  [v5 contentWithAnnouncement:v9 groupAnnouncements:v4 home:v6 threadIdentifier:v7 isReplacement:1 suspendExpiration:v8 completionHandler:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __80__ANUserNotificationController_updateNotificationForAnnouncements_home_groupID___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(unsigned char *)(a1 + 56))
  {
    id v4 = *(id *)(a1 + 32);
  }
  else
  {
    id v4 = [*(id *)(a1 + 40) identifier];
  }
  uint64_t v5 = v4;
  [WeakRetained _replaceContentForRequestWithRequestID:v4 replacementContent:v6 completionHandler:0];
}

- (void)removeNotificationWithGroupID:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  notificationCenter = self->_notificationCenter;
  id v7 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v7 count:1];
  -[UNUserNotificationCenter removePendingNotificationRequestsWithIdentifiers:](notificationCenter, "removePendingNotificationRequestsWithIdentifiers:", v6, v7, v8);
}

- (void)cleanForExit
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  char v4 = [v3 BOOLForDefault:*MEMORY[0x1E4F4A628]];

  if ((v4 & 1) == 0)
  {
    id v5 = objc_opt_new();
    v33 = self;
    uint64_t v34 = objc_opt_new();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v6 = [(ANUserNotificationController *)self notificationCenter];
    id v7 = [v6 pendingNotificationRequests];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v40 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          id v13 = [v12 content];
          char v14 = [v13 categoryIdentifier];
          int v15 = [v14 isEqualToString:@"ANAnnouncement"];

          if (v15)
          {
            id v16 = [v12 identifier];
            [v5 addObject:v16];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v9);
    }
    v32 = v5;

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v17 = [(ANUserNotificationController *)v33 notificationCenter];
    id v18 = [v17 deliveredNotifications];

    uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v36 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void **)(*((void *)&v35 + 1) + 8 * j);
          BOOL v24 = [v23 request];
          id v25 = [v24 content];
          v26 = [v25 categoryIdentifier];
          int v27 = [v26 isEqualToString:@"ANAnnouncement"];

          if (v27)
          {
            id v28 = [v23 request];
            BOOL v29 = [v28 identifier];
            [v34 addObject:v29];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v20);
    }

    v30 = [(ANUserNotificationController *)v33 notificationCenter];
    [v30 removePendingNotificationRequestsWithIdentifiers:v32];

    id v31 = [(ANUserNotificationController *)v33 notificationCenter];
    [v31 removeDeliveredNotificationsWithIdentifiers:v34];
  }
}

- (void)pauseExpirationForNotificationsWithGroupIDs:(id)a3
{
  id v4 = a3;
  [(ANUserNotificationController *)self setSuspendNotificationExpiration:1];
  [(ANUserNotificationController *)self _setContentExpirationDate:0 forNotificationsWithThreadIDs:v4];
}

- (void)resumeExpirationForNotificationsWithGroupIDs:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F4A8E0];
  id v5 = a3;
  id v6 = [v4 sharedInstance];
  id v8 = [v6 numberForDefault:*MEMORY[0x1E4F4A5E8]];

  id v7 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:", (double)objc_msgSend(v8, "integerValue"));
  [(ANUserNotificationController *)self _setContentExpirationDate:v7 forNotificationsWithThreadIDs:v5];

  [(ANUserNotificationController *)self setSuspendNotificationExpiration:0];
}

- (void)postSendFailureNotificationForAnnouncement:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F4A8B8];
  id v5 = a3;
  id v6 = [v5 remoteSessionDictionary];
  id v10 = [v4 contextFromDictionary:v6];

  id v7 = [v10 homeName];
  id v8 = [(ANUserNotificationController *)self _contentForSendFailureForAnnouncement:v5 homeName:v7];

  uint64_t v9 = [v5 identifier];

  [(ANUserNotificationController *)self _postNotificationWithContent:v8 requestID:v9];
}

- (BOOL)hasDeliveredNotificationsWithGroupID:(id)a3
{
  id v4 = a3;
  id v5 = [(ANUserNotificationController *)self notificationCenter];
  id v6 = [v5 deliveredNotifications];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__ANUserNotificationController_hasDeliveredNotificationsWithGroupID___block_invoke;
  v11[3] = &unk_1E6BCDD40;
  id v12 = v4;
  id v7 = v4;
  id v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v11);
  BOOL v9 = v8 != 0;

  return v9;
}

uint64_t __69__ANUserNotificationController_hasDeliveredNotificationsWithGroupID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 request];
  id v5 = [v4 content];
  id v6 = [v5 categoryIdentifier];
  if ([v6 isEqualToString:@"ANAnnouncement"])
  {
    id v7 = [v3 request];
    id v8 = [v7 content];
    BOOL v9 = [v8 threadIdentifier];
    uint64_t v10 = [v9 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)contentBodyForAnnouncers:(id)a3 inHome:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 count];
  switch(v7)
  {
    case 2:
      id v8 = [v5 objectAtIndexedSubscript:0];
      int v11 = [v8 isUser];
      id v12 = [v8 nameInHome:v6];
      id v13 = [v5 objectAtIndexedSubscript:1];
      char v14 = [v13 nameInHome:v6];
      int v27 = v13;
      int v15 = [v13 isUser];
      id v16 = ANLocalizedString();
      id v17 = v12;
      int v18 = [v12 isEqualToString:v16];

      uint64_t v19 = ANLocalizedString();
      int v20 = [v14 isEqualToString:v19];

      if (v11 && v15)
      {
        uint64_t v21 = v17;
      }
      else if ((v11 | v15))
      {
        if ((v18 | v20) != 1)
        {
          uint64_t v21 = v17;
          id v25 = v27;
          BOOL v9 = ANLocalizedStringWithFormat();
          goto LABEL_18;
        }
        uint64_t v21 = v17;
      }
      else
      {
        uint64_t v21 = v17;
      }
      BOOL v9 = ANLocalizedStringWithFormat();
      id v25 = v27;
LABEL_18:

      goto LABEL_19;
    case 1:
      id v8 = [v5 objectAtIndexedSubscript:0];
      [v8 isUser];
      uint64_t v10 = [v8 nameInHome:v6];
      BOOL v9 = ANLocalizedStringWithFormat();
      break;
    case 0:
      id v8 = ANLocalizedString();
      BOOL v9 = ANLocalizedStringWithFormat();
      goto LABEL_19;
    default:
      id v8 = [v5 objectAtIndexedSubscript:0];
      int v22 = [v8 isUser];
      uint64_t v10 = [v8 nameInHome:v6];
      uint64_t v23 = @"USER_NOTIFICATION_THREE_OR_MORE_SENDER_BODY_LOCATION_%@_%lu";
      if (v22) {
        uint64_t v23 = @"USER_NOTIFICATION_THREE_OR_MORE_SENDER_BODY_PERSON_%@_%lu";
      }
      BOOL v24 = v23;
      [v5 count];
      BOOL v9 = ANLocalizedStringWithFormat();

      break;
  }

LABEL_19:
  return v9;
}

- (BOOL)_canUpdateUserNotificationForHome:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v3 = objc_msgSend(MEMORY[0x1E4F4A940], "isHomeAppInstalled", a3);
  id v4 = ANLogHandleUserNotificationsController();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412802;
    uint64_t v7 = &stru_1F34A0E10;
    __int16 v8 = 1024;
    int v9 = v3;
    __int16 v10 = 1024;
    int v11 = v3;
    _os_log_impl(&dword_1DA5ED000, v4, OS_LOG_TYPE_DEFAULT, "%@Can Update User Notification: %d (Home App Installed: %d)", (uint8_t *)&v6, 0x18u);
  }

  return v3;
}

- (id)_contentForSendFailureForAnnouncement:(id)a3 homeName:(id)a4
{
  id v5 = a3;
  int v6 = objc_opt_new();
  uint64_t v7 = ANLocalizedString();
  [v6 setTitle:v7];

  __int16 v8 = ANLocalizedString();
  [v6 setBody:v8];

  [v6 setCategoryIdentifier:@"ANAnnouncement"];
  int v9 = [MEMORY[0x1E4F44640] defaultSound];
  [v6 setSound:v9];

  __int16 v10 = [(ANUserNotificationController *)self _userInfoForFailedDeliveryForAnnouncement:v5];
  [v6 setUserInfo:v10];

  int v11 = [v5 defaultActionURL];

  [v6 setDefaultActionURL:v11];
  [v6 setShouldBackgroundDefaultAction:1];
  [v6 setShouldSuppressDefaultAction:1];
  [v6 setShouldPreventNotificationDismissalAfterDefaultAction:1];
  uint64_t v12 = (void *)[v6 copy];

  return v12;
}

- (id)_userInfoForFailedDeliveryForAnnouncement:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  [v4 setObject:&unk_1F34A9C48 forKeyedSubscript:*MEMORY[0x1E4F4A850]];
  id v5 = [v3 sendFailureDictionary];

  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F4A830]];
  int v6 = NSNumber;
  uint64_t v7 = +[ANHomeManager shared];
  __int16 v8 = [v7 allHomes];
  int v9 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  [v4 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F4A838]];

  __int16 v10 = (void *)[v4 copy];
  return v10;
}

- (void)_postNotificationWithContent:(id)a3 requestID:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F44628] requestWithIdentifier:a4 content:v6 trigger:0];
  notificationCenter = self->_notificationCenter;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__ANUserNotificationController__postNotificationWithContent_requestID___block_invoke;
  v11[3] = &unk_1E6BCDDE0;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [(UNUserNotificationCenter *)notificationCenter addNotificationRequest:v10 withCompletionHandler:v11];
}

void __71__ANUserNotificationController__postNotificationWithContent_requestID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ANLogHandleUserNotificationsController();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      id v9 = &stru_1F34A0E10;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_ERROR, "%@Failed to add notification: %@", (uint8_t *)&v8, 0x16u);
    }

    id v5 = +[ANAnalytics shared];
    [v5 error:5012];
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(a1 + 32) identifier];
    uint64_t v7 = [*(id *)(a1 + 40) expirationDate];
    int v8 = 138412802;
    id v9 = &stru_1F34A0E10;
    __int16 v10 = 2112;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "%@Added notification. ID = %@, Expiration = %@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)_setContentExpirationDate:(id)a3 forNotificationsWithThreadIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(ANUserNotificationController *)self notificationCenter];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__ANUserNotificationController__setContentExpirationDate_forNotificationsWithThreadIDs___block_invoke;
  v11[3] = &unk_1E6BCDE08;
  id v12 = v7;
  id v13 = v6;
  uint64_t v14 = self;
  id v9 = v6;
  id v10 = v7;
  [v8 getDeliveredNotificationsWithCompletionHandler:v11];
}

void __88__ANUserNotificationController__setContentExpirationDate_forNotificationsWithThreadIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = a2;
  uint64_t v21 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v21)
  {
    uint64_t v2 = *(void *)v27;
    int v18 = v23;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v27 != v2) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v5 = objc_msgSend(v4, "request", v18);
        id v6 = [v5 content];
        id v7 = [v6 categoryIdentifier];
        if ([v7 isEqualToString:@"ANAnnouncement"])
        {
          int v8 = *(void **)(a1 + 32);
          id v9 = [v4 request];
          id v10 = [v9 content];
          id v11 = [v10 threadIdentifier];
          LODWORD(v8) = [v8 containsObject:v11];

          if (!v8) {
            continue;
          }
          id v12 = [v4 request];
          id v13 = [v12 content];
          id v5 = (void *)[v13 mutableCopy];

          [v5 setExpirationDate:*(void *)(a1 + 40)];
          uint64_t v14 = *(void **)(a1 + 48);
          int v15 = [v4 request];
          id v16 = [v15 identifier];
          id v17 = (void *)[v5 copy];
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v23[0] = __88__ANUserNotificationController__setContentExpirationDate_forNotificationsWithThreadIDs___block_invoke_2;
          v23[1] = &unk_1E6BCDDE0;
          id v24 = *(id *)(a1 + 40);
          id v25 = v4;
          [v14 _replaceContentForRequestWithRequestID:v16 replacementContent:v17 completionHandler:v22];

          id v6 = v24;
        }
        else
        {
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v21);
  }
}

void __88__ANUserNotificationController__setContentExpirationDate_forNotificationsWithThreadIDs___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!a2)
  {
    id v3 = ANLogHandleUserNotificationsController();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      id v5 = [*(id *)(a1 + 40) request];
      id v6 = [v5 identifier];
      int v7 = 138412802;
      int v8 = &stru_1F34A0E10;
      __int16 v9 = 2112;
      uint64_t v10 = v4;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_1DA5ED000, v3, OS_LOG_TYPE_DEFAULT, "%@Set Expiration to (%@) For Notification with Request Identifier: %@", (uint8_t *)&v7, 0x20u);
    }
  }
}

- (void)_replaceContentForRequestWithRequestID:(id)a3 replacementContent:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  __int16 v11 = [(ANUserNotificationController *)self notificationCenter];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __108__ANUserNotificationController__replaceContentForRequestWithRequestID_replacementContent_completionHandler___block_invoke;
  v14[3] = &unk_1E6BCDE30;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  [v11 replaceContentForRequestWithIdentifier:v13 replacementContent:v10 completionHandler:v14];
}

void __108__ANUserNotificationController__replaceContentForRequestWithRequestID_replacementContent_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = ANLogHandleUserNotificationsController();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v9 = 138412802;
      id v10 = &stru_1F34A0E10;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_ERROR, "%@Failed to replace Notification Content For Request Identifier (%@). Error = %@", (uint8_t *)&v9, 0x20u);
    }

    id v5 = +[ANAnalytics shared];
    [v5 error:5013];
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v9 = 138412546;
    id v10 = &stru_1F34A0E10;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "%@Replaced Content for Notification with Request Identifier: %@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
}

- (void)_replaceContentForRequestsWithThreadID:(id)a3 replacementContent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ANUserNotificationController *)self notificationCenter];
  int v9 = [v8 deliveredNotifications];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__ANUserNotificationController__replaceContentForRequestsWithThreadID_replacementContent___block_invoke;
  v15[3] = &unk_1E6BCDD40;
  id v16 = v6;
  id v10 = v6;
  __int16 v11 = objc_msgSend(v9, "na_filter:", v15);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__ANUserNotificationController__replaceContentForRequestsWithThreadID_replacementContent___block_invoke_2;
  v13[3] = &unk_1E6BCDE58;
  v13[4] = self;
  id v14 = v7;
  id v12 = v7;
  [v11 enumerateObjectsUsingBlock:v13];
}

uint64_t __90__ANUserNotificationController__replaceContentForRequestsWithThreadID_replacementContent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 request];
  uint64_t v4 = [v3 content];
  id v5 = [v4 threadIdentifier];
  uint64_t v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  return v6;
}

void __90__ANUserNotificationController__replaceContentForRequestsWithThreadID_replacementContent___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = [a2 request];
  uint64_t v4 = [v5 identifier];
  [v3 _replaceContentForRequestWithRequestID:v4 replacementContent:*(void *)(a1 + 40) completionHandler:0];
}

- (ANUserNotificationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ANUserNotificationControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (BOOL)suspendNotificationExpiration
{
  return self->_suspendNotificationExpiration;
}

- (void)setSuspendNotificationExpiration:(BOOL)a3
{
  self->_suspendNotificationExpiration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)contentWithAnnouncement:(ANAnnouncement *)a3 groupAnnouncements:(NSArray *)a4 home:(HMHome *)a5 threadIdentifier:(NSString *)a6 isReplacement:(BOOL)a7 suspendExpiration:(BOOL)a8 completionHandler:(id)a9
{
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DDF10);
  MEMORY[0x1F4188790](v16 - 8);
  int v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = _Block_copy(a9);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a3;
  *(void *)(v20 + 24) = a4;
  *(void *)(v20 + 32) = a5;
  *(void *)(v20 + 40) = a6;
  *(unsigned char *)(v20 + 48) = a7;
  *(unsigned char *)(v20 + 49) = a8;
  *(void *)(v20 + 56) = v19;
  *(void *)(v20 + 64) = self;
  uint64_t v21 = sub_1DA64AE00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v18, 1, 1, v21);
  int v22 = (void *)swift_allocObject();
  void v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_1EA8DDF20;
  v22[5] = v20;
  uint64_t v23 = (void *)swift_allocObject();
  void v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_1EA8DDF30;
  v23[5] = v22;
  id v24 = a3;
  id v25 = a4;
  long long v26 = a5;
  long long v27 = a6;
  long long v28 = self;
  sub_1DA63A5D4((uint64_t)v18, (uint64_t)&unk_1EA8DDF40, (uint64_t)v23);
  swift_release();
}

@end