@interface ASFriendInviteBulletinManager
- (ASFriendInviteBulletinManager)init;
- (ASFriendInviteBulletinManagerDelegate)delegate;
- (BOOL)_isSharingSetup;
- (id)_inviteNotificationCategories;
- (id)_newPrepolulatedUserInfoForInvitationFromContactUUID:(id)a3 categoryIdentifier:(id)a4 notificationContent:(id)a5 title:(id)a6 message:(id)a7;
- (id)_notificationRequestForInvitationFromContact:(id)a3 categoryIdentifier:(id)a4 requestIdentifier:(id)a5 title:(id)a6 formatString:(id)a7;
- (id)_notificationRequestForInvitationFromContact:(id)a3 requestIdentifier:(id)a4;
- (id)_notificationRequestForInvitationFromContactUUID:(id)a3 categoryIdentifier:(id)a4 requestIdentifier:(id)a5 title:(id)a6 message:(id)a7;
- (id)_userInfoForInvitationResponseFromContact:(id)a3 notificationContent:(id)a4 message:(id)a5;
- (void)_newPrepopulatedNotificationContentForNotificationContent:(id)a3 title:(id)a4 message:(id)a5;
- (void)_showIncompatibleVersionForContact:(id)a3 title:(id)a4 formatString:(id)a5;
- (void)_submitNotificationRequest:(id)a3 forContact:(id)a4;
- (void)activitySharingManagerReady:(id)a3;
- (void)bulletinPostingManager:(id)a3 didReceiveNotificationResponse:(id)a4;
- (void)processPendingResponses;
- (void)processResponse:(id)a3;
- (void)secureCloudReady;
- (void)setDelegate:(id)a3;
- (void)showErrorAcceptingInviteFrom:(id)a3;
- (void)showInviteAcceptResponseFrom:(id)a3;
- (void)showInviteAttemptNeedToSignInFrom:(id)a3;
- (void)showInviteAttemptNeedToUpgradeFrom:(id)a3;
- (void)showInviteAttemptNeedsSetupFromContact:(id)a3;
- (void)showInviteRequestFromContact:(id)a3 withPostingStyle:(int64_t)a4;
- (void)showMaxNumberOfFriendsError;
- (void)showVersionTooHighForOutgoingInviteTo:(id)a3;
- (void)showVersionTooLowForIncomingInviteFrom:(id)a3;
- (void)showVersionTooLowForOutgoingInviteTo:(id)a3;
- (void)withdrawInviteNotificationsForContact:(id)a3;
@end

@implementation ASFriendInviteBulletinManager

- (ASFriendInviteBulletinManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)ASFriendInviteBulletinManager;
  v2 = [(ASFriendInviteBulletinManager *)&v10 init];
  if (v2)
  {
    uint64_t v3 = HKCreateSerialDispatchQueue();
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    postedFriendInviteIdentifiersForContactUUID = v2->_postedFriendInviteIdentifiersForContactUUID;
    v2->_postedFriendInviteIdentifiersForContactUUID = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pendingResponses = v2->_pendingResponses;
    v2->_pendingResponses = v7;
  }
  return v2;
}

- (void)activitySharingManagerReady:(id)a3
{
  v4 = [a3 bulletinPostingManager];
  bulletinPostingManager = self->_bulletinPostingManager;
  self->_bulletinPostingManager = v4;

  [(ASBulletinPostingManager *)self->_bulletinPostingManager setDelegate:self];
  v6 = self->_bulletinPostingManager;
  id v7 = [(ASFriendInviteBulletinManager *)self _inviteNotificationCategories];
  [(ASBulletinPostingManager *)v6 registerNotificationCategories:v7];
}

- (id)_inviteNotificationCategories
{
  v17[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F1DF10];
  uint64_t v3 = HKHealthKitFrameworkBundle();
  uint64_t v4 = *MEMORY[0x263F09888];
  v5 = [v3 localizedStringForKey:@"ACCEPT" value:&stru_26FB96980 table:*MEMORY[0x263F09888]];
  v6 = [v2 actionWithIdentifier:@"Accept" title:v5 options:1];

  id v7 = (void *)MEMORY[0x263F1DF10];
  v8 = HKHealthKitFrameworkBundle();
  v9 = [v8 localizedStringForKey:@"IGNORE" value:&stru_26FB96980 table:v4];
  objc_super v10 = [v7 actionWithIdentifier:@"Ignore" title:v9 options:1];

  v11 = (void *)MEMORY[0x263F1DF28];
  uint64_t v12 = *MEMORY[0x263F23C78];
  v17[0] = v6;
  v17[1] = v10;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  v14 = [v11 categoryWithIdentifier:v12 actions:v13 intentIdentifiers:MEMORY[0x263EFFA68] options:0];

  v15 = [MEMORY[0x263EFFA08] setWithObject:v14];

  return v15;
}

- (void)secureCloudReady
{
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__ASFriendInviteBulletinManager_secureCloudReady__block_invoke;
  block[3] = &unk_2652157F0;
  block[4] = self;
  dispatch_async(notificationQueue, block);
}

uint64_t __49__ASFriendInviteBulletinManager_secureCloudReady__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
  return [*(id *)(a1 + 32) processPendingResponses];
}

- (void)showInviteRequestFromContact:(id)a3 withPostingStyle:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = [(ASFriendInviteBulletinManager *)self _isSharingSetup];
  ASLoggingInitialize();
  v8 = (os_log_t *)MEMORY[0x263F23AD0];
  v9 = *MEMORY[0x263F23AD0];
  BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT);
  if (a4 == 1 || v7)
  {
    if (v10)
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "Sharing is setup. Showing invite request with actions.", (uint8_t *)&v15, 2u);
    }
    ASLoggingInitialize();
    os_log_t v11 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = v11;
      v13 = [v6 UUID];
      int v15 = 138543618;
      v16 = v13;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_2474C9000, v12, OS_LOG_TYPE_DEFAULT, "Showing invitation request bulletin from %{public}@ - %@", (uint8_t *)&v15, 0x16u);
    }
    v14 = [(ASFriendInviteBulletinManager *)self _notificationRequestForInvitationFromContact:v6 requestIdentifier:@"InviteRequest"];
    [(ASFriendInviteBulletinManager *)self _submitNotificationRequest:v14 forContact:v6];
  }
  else
  {
    if (v10)
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "Sharing is not set up. Showing invite request without actions.", (uint8_t *)&v15, 2u);
    }
    [(ASFriendInviteBulletinManager *)self showInviteAttemptNeedsSetupFromContact:v6];
  }
}

- (BOOL)_isSharingSetup
{
  return CFPreferencesGetAppBooleanValue((CFStringRef)*MEMORY[0x263F23C38], (CFStringRef)*MEMORY[0x263F0AC40], 0) != 0;
}

- (void)showInviteAttemptNeedsSetupFromContact:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  ASLoggingInitialize();
  v5 = (void *)*MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    BOOL v7 = [v4 UUID];
    int v15 = 138543618;
    v16 = v7;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "Notifying about invitation request from %{public}@ - %@", (uint8_t *)&v15, 0x16u);
  }
  uint64_t v8 = *MEMORY[0x263F23C70];
  v9 = HKHealthKitFrameworkBundle();
  uint64_t v10 = *MEMORY[0x263F09888];
  os_log_t v11 = [v9 localizedStringForKey:@"ACTIVITY_SHARING_INVITATION_REQUEST_SETUP_TITLE" value:&stru_26FB96980 table:*MEMORY[0x263F09888]];
  uint64_t v12 = HKHealthKitFrameworkBundle();
  v13 = [v12 localizedStringForKey:@"ACTIVITY_SHARING_INVITATION_REQUEST_SETUP_BODY" value:&stru_26FB96980 table:v10];
  v14 = [(ASFriendInviteBulletinManager *)self _notificationRequestForInvitationFromContact:v4 categoryIdentifier:v8 requestIdentifier:@"InviteAttemptNeedsSetup" title:v11 formatString:v13];

  [(ASFriendInviteBulletinManager *)self _submitNotificationRequest:v14 forContact:v4];
}

- (void)showInviteAttemptNeedToSignInFrom:(id)a3
{
  id v4 = a3;
  ASLoggingInitialize();
  v5 = *MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "iCloud is not signed in. Showing invite request with prompts to sign in.", v13, 2u);
  }
  uint64_t v6 = *MEMORY[0x263F23C70];
  BOOL v7 = HKHealthKitFrameworkBundle();
  uint64_t v8 = *MEMORY[0x263F09888];
  v9 = [v7 localizedStringForKey:@"ACTIVITY_SHARING_INVITATION_REQUEST_SIGNIN_TITLE" value:&stru_26FB96980 table:*MEMORY[0x263F09888]];
  uint64_t v10 = HKHealthKitFrameworkBundle();
  os_log_t v11 = [v10 localizedStringForKey:@"ACTIVITY_SHARING_INVITATION_REQUEST_SIGNIN_BODY" value:&stru_26FB96980 table:v8];
  uint64_t v12 = [(ASFriendInviteBulletinManager *)self _notificationRequestForInvitationFromContact:v4 categoryIdentifier:v6 requestIdentifier:@"InviteAttemptNeedToSignIn" title:v9 formatString:v11];

  [(ASFriendInviteBulletinManager *)self _submitNotificationRequest:v12 forContact:v4];
}

- (void)showInviteAttemptNeedToUpgradeFrom:(id)a3
{
  id v4 = a3;
  ASLoggingInitialize();
  v5 = *MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "Watch(es) not all on latest watchOS. Showing invite request with prompts to upgrade.", v13, 2u);
  }
  uint64_t v6 = *MEMORY[0x263F23C70];
  BOOL v7 = HKHealthKitFrameworkBundle();
  uint64_t v8 = *MEMORY[0x263F09888];
  v9 = [v7 localizedStringForKey:@"ACTIVITY_SHARING_INVITATION_REQUEST_UPGRADE_TITLE" value:&stru_26FB96980 table:*MEMORY[0x263F09888]];
  uint64_t v10 = HKHealthKitFrameworkBundle();
  os_log_t v11 = [v10 localizedStringForKey:@"ACTIVITY_SHARING_INVITATION_REQUEST_UPGRADE_BODY" value:&stru_26FB96980 table:v8];
  uint64_t v12 = [(ASFriendInviteBulletinManager *)self _notificationRequestForInvitationFromContact:v4 categoryIdentifier:v6 requestIdentifier:@"InviteAttemptedNeedToUpgrade" title:v9 formatString:v11];

  [(ASFriendInviteBulletinManager *)self _submitNotificationRequest:v12 forContact:v4];
}

- (void)_submitNotificationRequest:(id)a3 forContact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__ASFriendInviteBulletinManager__submitNotificationRequest_forContact___block_invoke;
  block[3] = &unk_265216138;
  id v12 = v7;
  v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(notificationQueue, block);
}

uint64_t __71__ASFriendInviteBulletinManager__submitNotificationRequest_forContact___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = [*(id *)(a1 + 48) identifier];
    uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 24);
    id v4 = [*(id *)(a1 + 32) UUID];
    [v3 setObject:v2 forKeyedSubscript:v4];
  }
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(void **)(*(void *)(a1 + 40) + 8);
  return [v6 postNotificationRequest:v5];
}

- (void)withdrawInviteNotificationsForContact:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__ASFriendInviteBulletinManager_withdrawInviteNotificationsForContact___block_invoke;
  v7[3] = &unk_2652157C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(notificationQueue, v7);
}

void __71__ASFriendInviteBulletinManager_withdrawInviteNotificationsForContact___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  v2 = (void *)*MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = v2;
    uint64_t v5 = [v3 UUID];
    uint64_t v6 = *(void *)(a1 + 32);
    int v13 = 138543618;
    id v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl(&dword_2474C9000, v4, OS_LOG_TYPE_DEFAULT, "Withdrawing invite notification from %{public}@ - %@", (uint8_t *)&v13, 0x16u);
  }
  id v7 = *(void **)(*(void *)(a1 + 40) + 24);
  id v8 = [*(id *)(a1 + 32) UUID];
  id v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    [*(id *)(*(void *)(a1 + 40) + 8) removeNotificationWithIdentifier:v9];
    id v10 = *(void **)(a1 + 32);
    os_log_t v11 = *(void **)(*(void *)(a1 + 40) + 24);
    id v12 = [v10 UUID];
    [v11 removeObjectForKey:v12];
  }
}

- (void)showVersionTooLowForIncomingInviteFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = HKHealthKitFrameworkBundle();
  uint64_t v6 = *MEMORY[0x263F09888];
  id v9 = [v5 localizedStringForKey:@"ACTIVITY_SHARING_VERSION_TOO_LOW_TITLE" value:&stru_26FB96980 table:*MEMORY[0x263F09888]];

  id v7 = HKHealthKitFrameworkBundle();
  id v8 = [v7 localizedStringForKey:@"ACTIVITY_SHARING_INCOMING_REQUEST_VERSION_TOO_LOW_BODY" value:&stru_26FB96980 table:v6];

  [(ASFriendInviteBulletinManager *)self _showIncompatibleVersionForContact:v4 title:v9 formatString:v8];
}

- (void)showVersionTooLowForOutgoingInviteTo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = HKHealthKitFrameworkBundle();
  uint64_t v6 = *MEMORY[0x263F09888];
  id v9 = [v5 localizedStringForKey:@"ACTIVITY_SHARING_VERSION_TOO_LOW_TITLE" value:&stru_26FB96980 table:*MEMORY[0x263F09888]];

  id v7 = HKHealthKitFrameworkBundle();
  id v8 = [v7 localizedStringForKey:@"ACTIVITY_SHARING_OUTGOING_REQUEST_VERSION_TOO_LOW_BODY" value:&stru_26FB96980 table:v6];

  [(ASFriendInviteBulletinManager *)self _showIncompatibleVersionForContact:v4 title:v9 formatString:v8];
}

- (void)showVersionTooHighForOutgoingInviteTo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = HKHealthKitFrameworkBundle();
  uint64_t v6 = *MEMORY[0x263F09888];
  id v9 = [v5 localizedStringForKey:@"ACTIVITY_SHARING_VERSION_TOO_HIGH_TITLE" value:&stru_26FB96980 table:*MEMORY[0x263F09888]];

  id v7 = HKHealthKitFrameworkBundle();
  id v8 = [v7 localizedStringForKey:@"ACTIVITY_SHARING_OUTGOING_REQUEST_VERSION_TOO_HIGH_TITLE" value:&stru_26FB96980 table:v6];

  [(ASFriendInviteBulletinManager *)self _showIncompatibleVersionForContact:v4 title:v9 formatString:v8];
}

- (void)_showIncompatibleVersionForContact:(id)a3 title:(id)a4 formatString:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  ASLoggingInitialize();
  os_log_t v11 = (void *)*MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    int v13 = [v8 UUID];
    int v15 = 138543618;
    uint64_t v16 = v13;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl(&dword_2474C9000, v12, OS_LOG_TYPE_DEFAULT, "Showing version incompatible notification for %{public}@ - %@", (uint8_t *)&v15, 0x16u);
  }
  id v14 = [(ASFriendInviteBulletinManager *)self _notificationRequestForInvitationFromContact:v8 categoryIdentifier:*MEMORY[0x263F23C70] requestIdentifier:@"InviteIncompatibleVersion" title:v10 formatString:v9];

  [(ASFriendInviteBulletinManager *)self _submitNotificationRequest:v14 forContact:v8];
}

- (void)showInviteAcceptResponseFrom:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  ASLoggingInitialize();
  uint64_t v5 = (void *)*MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    id v7 = [v4 UUID];
    *(_DWORD *)buf = 138543618;
    v34 = v7;
    __int16 v35 = 2112;
    id v36 = v4;
    _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "Showing invitation response bulletin from %{public}@ - %@", buf, 0x16u);
  }
  id v8 = [v4 primaryRelationship];
  id v9 = [v8 cloudKitAddress];

  id v10 = [v4 displayName];
  os_log_t v11 = NSString;
  id v12 = HKHealthKitFrameworkBundle();
  uint64_t v13 = *MEMORY[0x263F09888];
  id v14 = [v12 localizedStringForKey:@"ACTIVITY_SHARING_INVITATION_RESPONSE_BODY" value:&stru_26FB96980 table:*MEMORY[0x263F09888]];
  int v15 = objc_msgSend(v11, "stringWithFormat:", v14, v10);

  if (v9 && ([v9 isEqualToString:v10] & 1) == 0)
  {
    uint64_t v16 = NSString;
    __int16 v17 = HKHealthKitFrameworkBundle();
    id v18 = [v17 localizedStringForKey:@"ACTIVITY_SHARING_INVITATION_RESPONSE_BODY_WITH_CLOUDKIT_ADDRESS" value:&stru_26FB96980 table:v13];
    uint64_t v19 = objc_msgSend(v16, "stringWithFormat:", v18, v10, v9);

    int v15 = (void *)v19;
  }
  id v20 = objc_alloc_init(MEMORY[0x263F1DEF0]);
  v21 = [(ASFriendInviteBulletinManager *)self _userInfoForInvitationResponseFromContact:v4 notificationContent:v20 message:v15];
  [v20 setUserInfo:v21];

  [v20 setCategoryIdentifier:*MEMORY[0x263F23C70]];
  v22 = [(ASBulletinPostingManager *)self->_bulletinPostingManager topicIdentifiers];
  uint64_t v23 = *MEMORY[0x263F23D30];
  int v24 = [v22 containsObject:*MEMORY[0x263F23D30]];

  if (v24)
  {
    id v25 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v32 = v23;
    v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
    v27 = (void *)[v25 initWithArray:v26];

    [v20 setTopicIdentifiers:v27];
  }
  v28 = (void *)MEMORY[0x263F1DF48];
  v29 = [v4 UUID];
  v30 = [v29 UUIDString];
  v31 = [v28 requestWithIdentifier:v30 content:v20 trigger:0];

  [(ASFriendInviteBulletinManager *)self _submitNotificationRequest:v31 forContact:v4];
}

- (void)showErrorAcceptingInviteFrom:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  ASLoggingInitialize();
  id v4 = (void *)*MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = v4;
    uint64_t v6 = [v3 UUID];
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = v6;
    __int16 v20 = 2112;
    id v21 = v3;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "Showing invite response error for %{public}@ - %@", buf, 0x16u);
  }
  id v7 = [v3 UUID];
  uint64_t v8 = *MEMORY[0x263F23C70];
  id v9 = [MEMORY[0x263F08C38] UUID];
  id v10 = [v9 UUIDString];
  os_log_t v11 = HKHealthKitFrameworkBundle();
  uint64_t v12 = *MEMORY[0x263F09888];
  uint64_t v13 = [v11 localizedStringForKey:@"ACCEPT" value:&stru_26FB96980 table:*MEMORY[0x263F09888]];
  id v14 = HKHealthKitFrameworkBundle();
  int v15 = [v14 localizedStringForKey:@"ACTIVITY_SHARING_INVITE_ACCEPT_ERROR" value:&stru_26FB96980 table:v12];
  uint64_t v16 = [(ASFriendInviteBulletinManager *)self _notificationRequestForInvitationFromContactUUID:v7 categoryIdentifier:v8 requestIdentifier:v10 title:v13 message:v15];

  [(ASFriendInviteBulletinManager *)self _submitNotificationRequest:v16 forContact:v3];
}

- (void)showMaxNumberOfFriendsError
{
  ASLoggingInitialize();
  id v3 = *MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "Showing max number of friends limit", buf, 2u);
  }
  id v4 = HKHealthKitFrameworkBundle();
  uint64_t v5 = *MEMORY[0x263F09888];
  uint64_t v6 = [v4 localizedStringForKey:@"ACTIVITY_SHARING_FRIEND_LIMIT_MESSAGE_TITLE" value:&stru_26FB96980 table:*MEMORY[0x263F09888]];

  id v7 = NSString;
  uint64_t v8 = HKHealthKitFrameworkBundle();
  id v9 = [v8 localizedStringForKey:@"ACTIVITY_SHARING_FRIEND_LIMIT_MESSAGE_BODY" value:&stru_26FB96980 table:v5];
  id v10 = objc_msgSend(v7, "stringWithFormat:", v9, *MEMORY[0x263F23D08]);

  id v11 = objc_alloc_init(MEMORY[0x263F1DEF0]);
  [(ASFriendInviteBulletinManager *)self _newPrepopulatedNotificationContentForNotificationContent:v11 title:v6 message:v10];
  [v11 setCategoryIdentifier:*MEMORY[0x263F23C70]];
  uint64_t v12 = (void *)MEMORY[0x263F1DF48];
  uint64_t v13 = [MEMORY[0x263F08C38] UUID];
  id v14 = [v13 UUIDString];
  int v15 = [v12 requestWithIdentifier:v14 content:v11 trigger:0];

  [(ASFriendInviteBulletinManager *)self _submitNotificationRequest:v15 forContact:0];
}

- (id)_notificationRequestForInvitationFromContact:(id)a3 requestIdentifier:(id)a4
{
  uint64_t v6 = *MEMORY[0x263F23C78];
  id v7 = a4;
  id v8 = a3;
  id v9 = HKHealthKitFrameworkBundle();
  uint64_t v10 = *MEMORY[0x263F09888];
  id v11 = [v9 localizedStringForKey:@"ACTIVITY_SHARING_INVITATION_REQUEST_TITLE" value:&stru_26FB96980 table:*MEMORY[0x263F09888]];
  uint64_t v12 = HKHealthKitFrameworkBundle();
  uint64_t v13 = [v12 localizedStringForKey:@"ACTIVITY_SHARING_INVITATION_REQUEST_BODY" value:&stru_26FB96980 table:v10];
  id v14 = [(ASFriendInviteBulletinManager *)self _notificationRequestForInvitationFromContact:v8 categoryIdentifier:v6 requestIdentifier:v7 title:v11 formatString:v13];

  return v14;
}

- (id)_notificationRequestForInvitationFromContact:(id)a3 categoryIdentifier:(id)a4 requestIdentifier:(id)a5 title:(id)a6 formatString:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  __int16 v17 = [v16 UUID];
  id v18 = NSString;
  uint64_t v19 = [v16 displayName];

  __int16 v20 = objc_msgSend(v18, "stringWithFormat:", v12, v19);

  id v21 = [(ASFriendInviteBulletinManager *)self _notificationRequestForInvitationFromContactUUID:v17 categoryIdentifier:v15 requestIdentifier:v14 title:v13 message:v20];

  return v21;
}

- (id)_notificationRequestForInvitationFromContactUUID:(id)a3 categoryIdentifier:(id)a4 requestIdentifier:(id)a5 title:(id)a6 message:(id)a7
{
  id v12 = (objc_class *)MEMORY[0x263F1DEF0];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = objc_alloc_init(v12);
  id v19 = [(ASFriendInviteBulletinManager *)self _newPrepolulatedUserInfoForInvitationFromContactUUID:v17 categoryIdentifier:v16 notificationContent:v18 title:v14 message:v13];

  [v18 setUserInfo:v19];
  __int16 v20 = NSString;
  id v21 = [v17 UUIDString];

  uint64_t v22 = [v20 stringWithFormat:@"%@-%@", v21, v15];

  uint64_t v23 = [MEMORY[0x263F1DF48] requestWithIdentifier:v22 content:v18 trigger:0];

  return v23;
}

- (id)_newPrepolulatedUserInfoForInvitationFromContactUUID:(id)a3 categoryIdentifier:(id)a4 notificationContent:(id)a5 title:(id)a6 message:(id)a7
{
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  [(ASFriendInviteBulletinManager *)self _newPrepopulatedNotificationContentForNotificationContent:v12 title:a6 message:a7];
  [v12 setCategoryIdentifier:v13];

  id v15 = [MEMORY[0x263EFF9A0] dictionary];
  id v16 = [v14 UUIDString];

  [v15 setObject:v16 forKey:@"ASUserInfoIDContactUUID"];
  [v15 setObject:@"ASUserInfoNotificationTypeInviteRequest" forKey:@"ASUserInfoNotificationTypeKey"];
  return v15;
}

- (id)_userInfoForInvitationResponseFromContact:(id)a3 notificationContent:(id)a4 message:(id)a5
{
  id v8 = a3;
  [(ASFriendInviteBulletinManager *)self _newPrepopulatedNotificationContentForNotificationContent:a4 title:0 message:a5];
  id v9 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v10 = [v8 UUID];

  id v11 = [v10 UUIDString];
  [v9 setObject:v11 forKey:@"ASUserInfoIDContactUUID"];

  [v9 setObject:@"ASUserInfoNotificationTypeInviteRequest" forKey:@"ASUserInfoNotificationTypeKey"];
  return v9;
}

- (void)_newPrepopulatedNotificationContentForNotificationContent:(id)a3 title:(id)a4 message:(id)a5
{
  id v7 = (void *)MEMORY[0x263F1DF00];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [v7 soundWithAlertType:19];
  [v12 setAlertTopic:*MEMORY[0x263F7FCB0]];
  [v10 setSound:v12];
  id v11 = [MEMORY[0x263EFF910] date];
  [v10 setDate:v11];

  [v10 setTitle:v9];
  [v10 setBody:v8];
}

- (void)bulletinPostingManager:(id)a3 didReceiveNotificationResponse:(id)a4
{
  id v5 = a4;
  notificationQueue = self->_notificationQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __87__ASFriendInviteBulletinManager_bulletinPostingManager_didReceiveNotificationResponse___block_invoke;
  v8[3] = &unk_2652157C8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(notificationQueue, v8);
}

uint64_t __87__ASFriendInviteBulletinManager_bulletinPostingManager_didReceiveNotificationResponse___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[32])
  {
    uint64_t v3 = *(void *)(a1 + 40);
    return [v2 processResponse:v3];
  }
  else
  {
    ASLoggingInitialize();
    id v5 = *MEMORY[0x263F23AD0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "Adding response to pending list %@", (uint8_t *)&v7, 0xCu);
    }
    return [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
  }
}

- (void)processResponse:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  ASLoggingInitialize();
  id v5 = (void *)*MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    int v7 = [v4 actionIdentifier];
    int v16 = 138543618;
    id v17 = v7;
    __int16 v18 = 2114;
    id v19 = v4;
    _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "Handling notification action response: %{public}@ RESPONSE: %{public}@", (uint8_t *)&v16, 0x16u);
  }
  uint64_t v8 = [v4 userInfo];
  id v9 = objc_alloc(MEMORY[0x263F08C38]);
  id v10 = [v8 objectForKeyedSubscript:@"ASUserInfoIDContactUUID"];
  id v11 = (void *)[v9 initWithUUIDString:v10];

  id v12 = [v4 actionIdentifier];
  if ([v12 isEqualToString:@"Accept"])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v14 = WeakRetained;
    uint64_t v15 = 1;
LABEL_7:
    [WeakRetained friendInviteBulletinManagerDidReceiveActionResponse:v15 fromContactWithUUID:v11];

    goto LABEL_8;
  }
  if ([v12 isEqualToString:@"Ignore"])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v14 = WeakRetained;
    uint64_t v15 = 0;
    goto LABEL_7;
  }
LABEL_8:
}

- (void)processPendingResponses
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  uint64_t v3 = *MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    pendingResponses = self->_pendingResponses;
    *(_DWORD *)buf = 138412290;
    int v16 = pendingResponses;
    _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "Processing pending responses %@", buf, 0xCu);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_pendingResponses;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[ASFriendInviteBulletinManager processResponse:](self, "processResponse:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (ASFriendInviteBulletinManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ASFriendInviteBulletinManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pendingResponses, 0);
  objc_storeStrong((id *)&self->_postedFriendInviteIdentifiersForContactUUID, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_bulletinPostingManager, 0);
}

@end