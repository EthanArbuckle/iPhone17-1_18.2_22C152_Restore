@interface ASCompetitionBulletinManager
- (void)activitySharingManagerReady:(id)a3;
- (void)showCompetitionAcceptedNotificationForFriend:(id)a3 competition:(id)a4 withPostingStyle:(int64_t)a5;
- (void)showCompetitionEndedNotificationForFriend:(id)a3 competition:(id)a4 withPostingStyle:(int64_t)a5;
- (void)showCompetitionRequestNotificationForFriend:(id)a3 competition:(id)a4 withPostingStyle:(int64_t)a5;
- (void)showCompetitionScoreCapCelebrationForFriends:(id)a3 withPostingStyle:(int64_t)a4;
- (void)showGizmoVersionTooLowForCompetitionRequestFrom:(id)a3;
- (void)withdrawCompetitionRequestNotificationForFriendWithUUID:(id)a3;
@end

@implementation ASCompetitionBulletinManager

- (void)activitySharingManagerReady:(id)a3
{
  self->_bulletinPostingManager = [a3 bulletinPostingManager];
  MEMORY[0x270F9A758]();
}

- (void)showCompetitionRequestNotificationForFriend:(id)a3 competition:(id)a4 withPostingStyle:(int64_t)a5
{
  CodableCompetitionRequestBulletinForFriend(a3, a4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  bulletinPostingManager = self->_bulletinPostingManager;
  v8 = [MEMORY[0x263EFFA08] setWithObject:v9];
  [(ASBulletinPostingManager *)bulletinPostingManager enqueueBulletins:v8 withPostingSyle:a5];
}

- (void)showCompetitionAcceptedNotificationForFriend:(id)a3 competition:(id)a4 withPostingStyle:(int64_t)a5
{
  CodableCompetitionAcceptedBulletinForFriend(a3, a4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  bulletinPostingManager = self->_bulletinPostingManager;
  v8 = [MEMORY[0x263EFFA08] setWithObject:v9];
  [(ASBulletinPostingManager *)bulletinPostingManager enqueueBulletins:v8 withPostingSyle:a5];
}

- (void)showCompetitionEndedNotificationForFriend:(id)a3 competition:(id)a4 withPostingStyle:(int64_t)a5
{
  CodableCompetitionEndedBulletinForFriend(a3, a4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  bulletinPostingManager = self->_bulletinPostingManager;
  v8 = [MEMORY[0x263EFFA08] setWithObject:v9];
  [(ASBulletinPostingManager *)bulletinPostingManager enqueueBulletins:v8 withPostingSyle:a5];
}

- (void)showCompetitionScoreCapCelebrationForFriends:(id)a3 withPostingStyle:(int64_t)a4
{
  CodableCompetitionScoreCapCelebrationBulletinForFriends(a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  bulletinPostingManager = self->_bulletinPostingManager;
  v7 = [MEMORY[0x263EFFA08] setWithObject:v8];
  [(ASBulletinPostingManager *)bulletinPostingManager enqueueBulletins:v7 withPostingSyle:a4];
}

- (void)showGizmoVersionTooLowForCompetitionRequestFrom:(id)a3
{
  id v4 = a3;
  ASLoggingInitialize();
  v5 = *MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "Showing gizmo OS too low notification", buf, 2u);
  }
  v6 = ActivitySharingBundle();
  v7 = [v6 localizedStringForKey:@"COMPETITION_UPDATE_WATCHOS_TITLE" value:&stru_26FB96980 table:@"Localizable"];

  id v8 = NSString;
  id v9 = ActivitySharingBundle();
  v10 = [v9 localizedStringForKey:@"COMPETITION_UPDATE_WATCHOS_MESSAGE" value:&stru_26FB96980 table:@"Localizable"];
  v11 = [v4 displayName];
  v12 = objc_msgSend(v8, "stringWithFormat:", v10, v11);

  id v13 = objc_alloc_init(MEMORY[0x263F1DEF0]);
  v14 = [MEMORY[0x263F1DF00] soundWithAlertType:19];
  [v14 setAlertTopic:*MEMORY[0x263F7FCB0]];
  [v13 setSound:v14];
  v15 = [MEMORY[0x263EFF910] date];
  [v13 setDate:v15];

  [v13 setTitle:v7];
  [v13 setBody:v12];
  v16 = (void *)MEMORY[0x263F1DF48];
  v17 = [v4 UUID];

  v18 = [v17 UUIDString];
  v19 = [v16 requestWithIdentifier:v18 content:v13 trigger:0];

  [(ASBulletinPostingManager *)self->_bulletinPostingManager postNotificationRequest:v19];
}

- (void)withdrawCompetitionRequestNotificationForFriendWithUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end