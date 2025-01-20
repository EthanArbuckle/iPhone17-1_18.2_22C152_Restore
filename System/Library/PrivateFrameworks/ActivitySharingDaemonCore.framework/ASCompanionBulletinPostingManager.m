@interface ASCompanionBulletinPostingManager
- (ASBulletinPostingManagerDelegate)delegate;
- (ASCompanionBulletinPostingManager)init;
- (BOOL)_isPostingAllowed;
- (BOOL)shouldUseSpecializedStringForWorkout:(id)a3;
- (id)_achievementForAchievementData:(id)a3;
- (id)_activityDataNotificationCategories;
- (id)_activitySharingAchievementForAchievementData:(id)a3;
- (id)_activitySharingWorkoutForWorkoutData:(id)a3;
- (id)_activitySnapshotForSnapshotData:(id)a3;
- (id)_notificationRequestForCodableBulletin:(id)a3;
- (id)_subtitleBodyPairForAchievementCodableBulletin:(id)a3;
- (id)_subtitleBodyPairForCodableBulletin:(id)a3;
- (id)_subtitleBodyPairForWorkoutCodableBulletin:(id)a3;
- (id)topicIdentifiers;
- (void)_handleActivityDataNotificationResponse:(id)a3;
- (void)_withdrawNotificationRequestsWithIdentifiers:(id)a3;
- (void)activitySharingManagerReady:(id)a3;
- (void)enqueueBulletins:(id)a3 withPostingSyle:(int64_t)a4;
- (void)handleNotificationResponse:(id)a3 completion:(id)a4;
- (void)postNotificationRequest:(id)a3;
- (void)registerNotificationCategories:(id)a3;
- (void)removeNotificationWithIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation ASCompanionBulletinPostingManager

- (ASCompanionBulletinPostingManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)ASCompanionBulletinPostingManager;
  v2 = [(ASCompanionBulletinPostingManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F1DFB0]) initWithBundleIdentifier:@"com.apple.Fitness"];
    userNotificationCenter = v2->_userNotificationCenter;
    v2->_userNotificationCenter = (UNUserNotificationCenter *)v3;
  }
  return v2;
}

- (void)activitySharingManagerReady:(id)a3
{
  [(UNUserNotificationCenter *)self->_userNotificationCenter setDelegate:self];
  userNotificationCenter = self->_userNotificationCenter;
  [(UNUserNotificationCenter *)userNotificationCenter setWantsNotificationResponsesDelivered];
}

- (void)registerNotificationCategories:(id)a3
{
  id v4 = a3;
  v5 = [(ASCompanionBulletinPostingManager *)self _activityDataNotificationCategories];
  objc_super v6 = [v4 setByAddingObjectsFromSet:v5];

  userNotificationCenter = self->_userNotificationCenter;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __68__ASCompanionBulletinPostingManager_registerNotificationCategories___block_invoke;
  v9[3] = &unk_2652169B0;
  id v10 = v6;
  v11 = self;
  id v8 = v6;
  [(UNUserNotificationCenter *)userNotificationCenter getNotificationCategoriesWithCompletionHandler:v9];
}

void __68__ASCompanionBulletinPostingManager_registerNotificationCategories___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 setByAddingObjectsFromSet:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 40) + 8) setNotificationCategories:v3];
}

- (BOOL)_isPostingAllowed
{
  v2 = [MEMORY[0x263F0A980] sharedBehavior];
  uint64_t v3 = [v2 fitnessMode];

  if (v3 == 1)
  {
    id v4 = objc_alloc(MEMORY[0x263F57520]);
    v5 = (void *)[v4 initWithDomain:*MEMORY[0x263F23CC8]];
    id v6 = (id)[v5 synchronize];
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x263EFFA40]);
    v5 = (void *)[v7 initWithSuiteName:*MEMORY[0x263F23CC8]];
  }
  id v8 = [v5 objectForKey:*MEMORY[0x263F23D58]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v9 = [v8 BOOLValue];
  }
  else {
    char v9 = 1;
  }

  return v9;
}

- (id)_activityDataNotificationCategories
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F1DF98] actionWithIdentifier:@"Reply" title:&stru_26FB96980 options:1];
  uint64_t v3 = (void *)MEMORY[0x263F1DF28];
  uint64_t v4 = *MEMORY[0x263F23C68];
  v9[0] = v2;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  id v6 = [v3 categoryWithIdentifier:v4 actions:v5 intentIdentifiers:MEMORY[0x263EFFA68] options:0];

  id v7 = [MEMORY[0x263EFFA08] setWithObject:v6];

  return v7;
}

- (void)postNotificationRequest:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  ASLoggingInitialize();
  v5 = (os_log_t *)MEMORY[0x263F23AD0];
  id v6 = (void *)*MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = [v4 identifier];
    *(_DWORD *)buf = 138412290;
    v14 = v8;
    _os_log_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEFAULT, "Adding notification request with identifier %@", buf, 0xCu);
  }
  if ([(ASCompanionBulletinPostingManager *)self _isPostingAllowed])
  {
    objc_initWeak((id *)buf, self);
    userNotificationCenter = self->_userNotificationCenter;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __61__ASCompanionBulletinPostingManager_postNotificationRequest___block_invoke;
    v11[3] = &unk_2652169D8;
    objc_copyWeak(&v12, (id *)buf);
    [(UNUserNotificationCenter *)userNotificationCenter addNotificationRequest:v4 withCompletionHandler:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    ASLoggingInitialize();
    id v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v10, OS_LOG_TYPE_DEFAULT, "Activity sharing notifications disabled in settings", buf, 2u);
    }
  }
}

void __61__ASCompanionBulletinPostingManager_postNotificationRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    ASLoggingInitialize();
    id v4 = (void *)*MEMORY[0x263F23AD0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_ERROR)) {
      __61__ASCompanionBulletinPostingManager_postNotificationRequest___block_invoke_cold_1(a1, v4, (uint64_t)v3);
    }
  }
}

- (void)enqueueBulletins:(id)a3 withPostingSyle:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [MEMORY[0x263F0A980] sharedBehavior];
  uint64_t v7 = [v6 fitnessMode];

  if (v7 != 1)
  {
    ASLoggingInitialize();
    id v8 = *MEMORY[0x263F23AD0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v5;
      _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, "CompanionBulletinPostingManager enqueuing bulletins %@", buf, 0xCu);
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    char v9 = objc_msgSend(v5, "allObjects", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [(ASCompanionBulletinPostingManager *)self _notificationRequestForCodableBulletin:*(void *)(*((void *)&v15 + 1) + 8 * v13)];
          [(ASCompanionBulletinPostingManager *)self postNotificationRequest:v14];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
}

- (void)removeNotificationWithIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  ASLoggingInitialize();
  id v5 = *MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "Withdrawing bulletin with identifier %@", buf, 0xCu);
  }
  id v7 = v4;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v7 count:1];
  [(ASCompanionBulletinPostingManager *)self _withdrawNotificationRequestsWithIdentifiers:v6];
}

- (id)topicIdentifiers
{
  v2 = [(UNUserNotificationCenter *)self->_userNotificationCenter notificationTopics];
  id v3 = objc_msgSend(v2, "hk_map:", &__block_literal_global_8);
  id v4 = [v3 allObjects];

  return v4;
}

uint64_t __53__ASCompanionBulletinPostingManager_topicIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void)_withdrawNotificationRequestsWithIdentifiers:(id)a3
{
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [v8 actionIdentifier];
  uint64_t v10 = [v8 notification];

  uint64_t v11 = [v10 request];
  uint64_t v12 = [v11 content];
  uint64_t v13 = [v12 userInfo];

  v14 = (void *)[objc_alloc(MEMORY[0x263F23C10]) initWithActionIdentifier:v9 userInfo:v13];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __113__ASCompanionBulletinPostingManager_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke;
  v16[3] = &unk_265216718;
  id v17 = v7;
  id v15 = v7;
  [(ASCompanionBulletinPostingManager *)self handleNotificationResponse:v14 completion:v16];
}

uint64_t __113__ASCompanionBulletinPostingManager_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleNotificationResponse:(id)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  ASLoggingInitialize();
  id v8 = *MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = v6;
    _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, "CompanionBulletinPostingManager received notification response: %{public}@", (uint8_t *)&v12, 0xCu);
  }
  id v9 = [v6 actionIdentifier];
  int v10 = [v9 isEqualToString:@"Reply"];

  if (v10)
  {
    [(ASCompanionBulletinPostingManager *)self _handleActivityDataNotificationResponse:v6];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained bulletinPostingManager:self didReceiveNotificationResponse:v6];
  }
  v7[2](v7, 1, 0);
}

- (void)_handleActivityDataNotificationResponse:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F23D48]];

  uint64_t v7 = [v6 integerValue];
  id v8 = [v4 userInfo];
  id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F23D40]];

  if (v9)
  {
    int v10 = [v4 userInfo];
    uint64_t v11 = [v10 objectForKeyedSubscript:*MEMORY[0x263F23D28]];

    if (v11)
    {
      int v12 = (void *)[objc_alloc(MEMORY[0x263F23B78]) initWithData:v11];
      id v13 = ASFriendsFromCodableFriendList();
      uint64_t v14 = [v13 anyObject];

      if (v14)
      {
        switch(v7)
        {
          case 0:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
            ASLoggingInitialize();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_ERROR)) {
              -[ASCompanionBulletinPostingManager _handleActivityDataNotificationResponse:].cold.5();
            }
            break;
          case 1:
            id v15 = [v4 userInfo];
            uint64_t v16 = [v15 objectForKeyedSubscript:*MEMORY[0x263F23D18]];

            v31 = (void *)v16;
            uint64_t v17 = [(ASCompanionBulletinPostingManager *)self _activitySnapshotForSnapshotData:v16];
            long long v18 = [v14 UUID];
            v19 = [v14 contact];
            v20 = [v19 primaryDestinationForMessaging];
            v30 = (void *)v17;
            uint64_t v21 = ASRichMessagePayloadForGoalCompletion();
            goto LABEL_16;
          case 2:
            uint64_t v22 = [v4 userInfo];
            uint64_t v23 = [v22 objectForKeyedSubscript:*MEMORY[0x263F23D50]];

            v31 = (void *)v23;
            uint64_t v24 = [(ASCompanionBulletinPostingManager *)self _activitySharingWorkoutForWorkoutData:v23];
            long long v18 = [v14 UUID];
            v19 = [v14 contact];
            v20 = [v19 primaryDestinationForMessaging];
            v30 = (void *)v24;
            uint64_t v21 = ASRichMessagePayloadForWorkout();
            goto LABEL_16;
          case 3:
            v25 = [v4 userInfo];
            uint64_t v26 = [v25 objectForKeyedSubscript:*MEMORY[0x263F23D10]];

            v31 = (void *)v26;
            uint64_t v27 = [(ASCompanionBulletinPostingManager *)self _activitySharingAchievementForAchievementData:v26];
            long long v18 = [v14 UUID];
            v19 = [v14 contact];
            v20 = [v19 primaryDestinationForMessaging];
            v30 = (void *)v27;
            uint64_t v21 = ASRichMessagePayloadForAchievement();
LABEL_16:
            v28 = (void *)v21;

            if (!v28) {
              goto LABEL_18;
            }
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __77__ASCompanionBulletinPostingManager__handleActivityDataNotificationResponse___block_invoke;
            block[3] = &unk_265216138;
            id v33 = v28;
            id v34 = v14;
            id v35 = v4;
            id v29 = v28;
            dispatch_async(MEMORY[0x263EF83A0], block);

            break;
          default:
LABEL_18:
            ASLoggingInitialize();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_ERROR)) {
              -[ASCompanionBulletinPostingManager _handleActivityDataNotificationResponse:].cold.4();
            }
            break;
        }
      }
      else
      {
        ASLoggingInitialize();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_ERROR)) {
          -[ASCompanionBulletinPostingManager _handleActivityDataNotificationResponse:]();
        }
      }
    }
    else
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_ERROR)) {
        -[ASCompanionBulletinPostingManager _handleActivityDataNotificationResponse:]();
      }
    }
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_ERROR)) {
      -[ASCompanionBulletinPostingManager _handleActivityDataNotificationResponse:]();
    }
  }
}

void __77__ASCompanionBulletinPostingManager__handleActivityDataNotificationResponse___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 40) contact];
  id v3 = [v2 primaryDestinationForMessaging];
  ASSendRichMessagePayloadToDestination();

  ASLoggingInitialize();
  id v4 = *MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    int v6 = 138543362;
    uint64_t v7 = v5;
    _os_log_impl(&dword_2474C9000, v4, OS_LOG_TYPE_DEFAULT, "CompanionBulletinPostingManager sent message payload for notification response: %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (id)_notificationRequestForCodableBulletin:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F1DEF0]);
  int IsInstalled = ASMessagesIsInstalled();
  uint64_t v7 = (void *)MEMORY[0x263F23C68];
  if (!IsInstalled) {
    uint64_t v7 = (void *)MEMORY[0x263F23C70];
  }
  [v5 setCategoryIdentifier:*v7];
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  unint64_t v9 = [v4 type];
  int v10 = [NSNumber numberWithInteger:v9];
  [v8 setObject:v10 forKeyedSubscript:*MEMORY[0x263F23D48]];

  uint64_t v11 = [v4 friendListData];
  [v8 setObject:v11 forKeyedSubscript:*MEMORY[0x263F23D28]];

  int v12 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "competitionStage"));
  [v8 setObject:v12 forKeyedSubscript:*MEMORY[0x263F23D20]];

  id v13 = [v4 achievementData];
  [v8 setObject:v13 forKeyedSubscript:*MEMORY[0x263F23D10]];

  uint64_t v14 = [v4 workoutData];
  [v8 setObject:v14 forKeyedSubscript:*MEMORY[0x263F23D50]];

  id v15 = [v4 snapshotData];
  [v8 setObject:v15 forKeyedSubscript:*MEMORY[0x263F23D18]];

  uint64_t v16 = [MEMORY[0x263EFF910] date];
  uint64_t v17 = ExpirationDateForBulletinTypeAndPublishDate(v9, v16);

  if (v17) {
    [v5 setExpirationDate:v17];
  }
  long long v18 = [MEMORY[0x263F1DF00] soundWithAlertType:19];
  [v18 setAlertTopic:*MEMORY[0x263F7FCB0]];
  v19 = ActivitySharingBundle();
  v20 = [v19 localizedStringForKey:@"FITNESS_APP_NAME" value:&stru_26FB96980 table:@"Localizable"];

  uint64_t v21 = [(ASCompanionBulletinPostingManager *)self _subtitleBodyPairForCodableBulletin:v4];
  [v5 setSound:v18];
  [v5 setTitle:v20];
  uint64_t v22 = [v21 subtitle];
  [v5 setSubtitle:v22];

  uint64_t v23 = [v21 body];
  [v5 setBody:v23];

  uint64_t v24 = ThreadIdentifierForBulletinType(v9);
  [v5 setThreadIdentifier:v24];

  [v5 setUserInfo:v8];
  v25 = (void *)MEMORY[0x263F1DF48];
  uint64_t v26 = [MEMORY[0x263F08C38] UUID];
  uint64_t v27 = [v26 UUIDString];
  v28 = [v25 requestWithIdentifier:v27 content:v5 trigger:0];

  return v28;
}

- (id)_subtitleBodyPairForCodableBulletin:(id)a3
{
  id v4 = a3;
  id v5 = [v4 achievementData];

  if (v5)
  {
    uint64_t v6 = [(ASCompanionBulletinPostingManager *)self _subtitleBodyPairForAchievementCodableBulletin:v4];
LABEL_5:
    id v8 = (ASCompanionBulletinPostingManagerSubtitleBodyPair *)v6;
    goto LABEL_6;
  }
  uint64_t v7 = [v4 workoutData];

  if (v7)
  {
    uint64_t v6 = [(ASCompanionBulletinPostingManager *)self _subtitleBodyPairForWorkoutCodableBulletin:v4];
    goto LABEL_5;
  }
  int v10 = [ASCompanionBulletinPostingManagerSubtitleBodyPair alloc];
  uint64_t v11 = [v4 title];
  id v8 = [(ASCompanionBulletinPostingManagerSubtitleBodyPair *)v10 initWithSubtitle:v11 body:0];

LABEL_6:
  return v8;
}

- (id)_subtitleBodyPairForWorkoutCodableBulletin:(id)a3
{
  id v4 = a3;
  id v5 = [v4 workoutData];
  uint64_t v6 = [(ASCompanionBulletinPostingManager *)self _activitySharingWorkoutForWorkoutData:v5];

  uint64_t v7 = [v6 hkWorkoutFromFriendWorkout];
  if (-[ASCompanionBulletinPostingManager shouldUseSpecializedStringForWorkout:](self, "shouldUseSpecializedStringForWorkout:", v7)&& (objc_msgSend(v7, "fi_activityType"), id v8 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v8, "localizationKey"), v9 = objc_claimAutoreleasedReturnValue(), v8, v9))
  {
    int v10 = [@"NOTIFICATION_TITLE_FORMAT_WORKOUT_" stringByAppendingString:v9];
    id v11 = objc_alloc(MEMORY[0x263F23B78]);
    int v12 = [v4 friendListData];
    v25 = (void *)[v11 initWithData:v12];

    id v13 = ASFriendsFromCodableFriendList();
    uint64_t v14 = [v13 allObjects];
    uint64_t v24 = [v14 firstObject];

    id v15 = NSString;
    uint64_t v16 = ActivitySharingBundle();
    uint64_t v17 = [v16 localizedStringForKey:v10 value:&stru_26FB96980 table:@"Localizable"];
    long long v18 = [v24 displayName];
    v19 = objc_msgSend(v15, "localizedStringWithFormat:", v17, v18);

    v20 = [[ASCompanionBulletinPostingManagerSubtitleBodyPair alloc] initWithSubtitle:0 body:v19];
  }
  else
  {
    uint64_t v21 = objc_msgSend(v7, "fi_activityType");
    unint64_t v9 = [v21 localizedName];

    uint64_t v22 = [ASCompanionBulletinPostingManagerSubtitleBodyPair alloc];
    int v10 = [v4 title];
    v20 = [(ASCompanionBulletinPostingManagerSubtitleBodyPair *)v22 initWithSubtitle:v10 body:v9];
  }

  return v20;
}

- (id)_subtitleBodyPairForAchievementCodableBulletin:(id)a3
{
  id v4 = a3;
  id v5 = [v4 achievementData];
  uint64_t v6 = [(ASCompanionBulletinPostingManager *)self _achievementForAchievementData:v5];

  if (v6)
  {
    uint64_t v7 = [v6 template];
    id v8 = [v7 uniqueName];
    int v9 = ASIsCompetitionVictoryTemplate();

    id v10 = objc_alloc_init(MEMORY[0x263F23638]);
    id v11 = v10;
    if (v9)
    {
      id v12 = objc_alloc(MEMORY[0x263F23B78]);
      id v13 = [v4 friendListData];
      uint64_t v14 = (void *)[v12 initWithData:v13];

      id v15 = ASFriendsFromCodableFriendList();
      uint64_t v16 = [v15 allObjects];
      uint64_t v17 = [v16 firstObject];

      long long v18 = [v17 displayName];
      [v11 setName:v18];

      v19 = [v11 friendAchievedDescriptionForAchievement:v6];
    }
    else
    {
      v19 = [v10 friendAchievedTitleForAchievement:v6];
    }
    uint64_t v24 = [ASCompanionBulletinPostingManagerSubtitleBodyPair alloc];
    v25 = [v4 title];
    uint64_t v23 = [(ASCompanionBulletinPostingManagerSubtitleBodyPair *)v24 initWithSubtitle:v25 body:v19];
  }
  else
  {
    ASLoggingInitialize();
    v20 = (void *)*MEMORY[0x263F23AD0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_ERROR)) {
      -[ASCompanionBulletinPostingManager _subtitleBodyPairForAchievementCodableBulletin:](v20, v4);
    }
    uint64_t v21 = [ASCompanionBulletinPostingManagerSubtitleBodyPair alloc];
    uint64_t v22 = [v4 title];
    uint64_t v23 = [(ASCompanionBulletinPostingManagerSubtitleBodyPair *)v21 initWithSubtitle:v22 body:0];
  }
  return v23;
}

- (id)_achievementForAchievementData:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F23660];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithData:v4];

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F23630]) initWithCodable:v5];
  return v6;
}

- (id)_activitySharingAchievementForAchievementData:(id)a3
{
  id v3 = [(ASCompanionBulletinPostingManager *)self _achievementForAchievementData:a3];
  if (ACHShouldUseNewAwardsSystem())
  {
    id v4 = [v3 relevantEarnedInstance];
  }
  else
  {
    id v5 = [v3 earnedInstances];
    id v4 = [v5 lastObject];
  }
  uint64_t v6 = [v3 template];
  uint64_t v7 = ASFriendAchievementFromTemplateAndEarnedInstance();

  return v7;
}

- (id)_activitySharingWorkoutForWorkoutData:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F23B38];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithData:v4];

  uint64_t v6 = [MEMORY[0x263F0A9D8] fitnessFriendWorkoutWithCodableWorkout:v5];

  return v6;
}

- (id)_activitySnapshotForSnapshotData:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = (objc_class *)MEMORY[0x263F08928];
  id v4 = a3;
  id v10 = 0;
  id v5 = (void *)[[v3 alloc] initForReadingFromData:v4 error:&v10];

  id v6 = v10;
  if (v6)
  {
    _HKInitializeLogging();
    uint64_t v7 = *MEMORY[0x263F098D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEFAULT, "Error creating archiver for summary data: %@", buf, 0xCu);
    }
  }
  id v8 = [v5 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F081D0]];
  [v5 finishDecoding];

  return v8;
}

- (BOOL)shouldUseSpecializedStringForWorkout:(id)a3
{
  uint64_t v3 = [a3 workoutActivityType];
  int v4 = FIIsCategorizedOtherActivityType() ^ 1;
  if (v3 == 84) {
    return 1;
  }
  else {
    return v4;
  }
}

- (ASBulletinPostingManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ASBulletinPostingManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
}

void __61__ASCompanionBulletinPostingManager_postNotificationRequest___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  objc_opt_class();
  OUTLINED_FUNCTION_1_0();
  __int16 v10 = 2114;
  uint64_t v11 = a3;
  id v8 = v7;
  _os_log_error_impl(&dword_2474C9000, v5, OS_LOG_TYPE_ERROR, "%{public}@ error requesting notification request %{public}@", v9, 0x16u);
}

- (void)_handleActivityDataNotificationResponse:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "CompanionBulletinPostingManager failed to decode reply for notification response: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_handleActivityDataNotificationResponse:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "CompanionBulletinPostingManager failed to decode friend list data for notification response: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_handleActivityDataNotificationResponse:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "CompanionBulletinPostingManager failed to decode friend for notification response: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_handleActivityDataNotificationResponse:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "CompanionBulletinPostingManager failed to create message payload for notification response: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_handleActivityDataNotificationResponse:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "CompanionBulletinPostingManager found unexpected ASBulletinType for notification response: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_subtitleBodyPairForAchievementCodableBulletin:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 achievementData];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_2474C9000, v3, OS_LOG_TYPE_ERROR, "CompanionBulletinPostingManager unable to decode achievement data %@", v5, 0xCu);
}

@end