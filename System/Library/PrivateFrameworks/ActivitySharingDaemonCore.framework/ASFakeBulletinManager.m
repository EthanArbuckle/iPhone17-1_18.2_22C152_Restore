@interface ASFakeBulletinManager
- (id)_fakeContact;
- (void)_showFakeAchievementNotification;
- (void)_showFakeBatchNotification;
- (void)_showFakeCompetitionAcceptedNotification;
- (void)_showFakeCompetitionEndedLoserNotification;
- (void)_showFakeCompetitionEndedTieNotification;
- (void)_showFakeCompetitionEndedWinnerNotification;
- (void)_showFakeCompetitionRequestNotification;
- (void)_showFakeCompetitionScoreCapCelebrationNotification;
- (void)_showFakeGoalCompletionDuringCompetitionNotification;
- (void)_showFakeGoalCompletionNotification;
- (void)_showFakeGuidedRunWorkoutNotification;
- (void)_showFakeGuidedWalkWorkoutNotification;
- (void)_showFakeInvitationRequest;
- (void)_showFakeInvitationResponse;
- (void)_showFakeInviteAttemptNeedsSetup;
- (void)_showFakeNeedToSignIn;
- (void)_showFakeNeedToUpgrade;
- (void)_showFakeVideoWorkoutNotification;
- (void)_showFakeWorkoutNotification;
- (void)_showFakeWorkoutNotificationWithWorkout:(id)a3;
- (void)activitySharingManagerReady:(id)a3;
- (void)dealloc;
- (void)deregisterBulletins;
- (void)registerBulletins;
@end

@implementation ASFakeBulletinManager

- (void)activitySharingManagerReady:(id)a3
{
  id v4 = a3;
  v5 = [v4 activityDataBulletinManager];
  objc_storeWeak((id *)&self->_activityDataBulletinManager, v5);

  v6 = [v4 competitionBulletinManager];
  objc_storeWeak((id *)&self->_competitionBulletinManager, v6);

  v7 = [v4 fakingManager];
  objc_storeWeak((id *)&self->_fakingManager, v7);

  v8 = [v4 friendInviteBulletinManager];
  objc_storeWeak((id *)&self->_friendInviteBulletinManager, v8);

  v9 = [v4 bulletinPostingManager];

  bulletinPostingManager = self->_bulletinPostingManager;
  self->_bulletinPostingManager = v9;
}

- (void)dealloc
{
  [(ASFakeBulletinManager *)self deregisterBulletins];
  v3.receiver = self;
  v3.super_class = (Class)ASFakeBulletinManager;
  [(ASFakeBulletinManager *)&v3 dealloc];
}

- (void)registerBulletins
{
  objc_initWeak(location, self);
  objc_super v3 = MEMORY[0x263EF83A0];
  id v4 = MEMORY[0x263EF83A0];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __42__ASFakeBulletinManager_registerBulletins__block_invoke;
  handler[3] = &unk_265216948;
  objc_copyWeak(&v52, location);
  notify_register_dispatch("fakeFriendWorkout", &self->notifyWorkoutToken, v3, handler);
  v5 = MEMORY[0x263EF83A0];

  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __42__ASFakeBulletinManager_registerBulletins__block_invoke_2;
  v49[3] = &unk_265216948;
  objc_copyWeak(&v50, location);
  notify_register_dispatch("fakeFriendVideoWorkout", &self->notifyVideoWorkoutToken, v5, v49);

  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __42__ASFakeBulletinManager_registerBulletins__block_invoke_3;
  v47[3] = &unk_265216948;
  objc_copyWeak(&v48, location);
  notify_register_dispatch("fakeFriendGuidedRunWorkout", &self->notifyGuidedRunWorkoutToken, v5, v47);

  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __42__ASFakeBulletinManager_registerBulletins__block_invoke_4;
  v45[3] = &unk_265216948;
  objc_copyWeak(&v46, location);
  notify_register_dispatch("fakeFriendGuidedWalkWorkout", &self->notifyGuidedWalkWorkoutToken, v5, v45);

  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __42__ASFakeBulletinManager_registerBulletins__block_invoke_5;
  v43[3] = &unk_265216948;
  objc_copyWeak(&v44, location);
  notify_register_dispatch("fakeFriendAchievement", &self->notifyAchievementToken, v5, v43);

  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __42__ASFakeBulletinManager_registerBulletins__block_invoke_6;
  v41[3] = &unk_265216948;
  objc_copyWeak(&v42, location);
  notify_register_dispatch("fakeFriendGoalCompletion", &self->notifyGoalCompletionToken, v5, v41);

  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __42__ASFakeBulletinManager_registerBulletins__block_invoke_7;
  v39[3] = &unk_265216948;
  objc_copyWeak(&v40, location);
  notify_register_dispatch("fakeFriendBatch", &self->notifyBatchToken, v5, v39);

  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __42__ASFakeBulletinManager_registerBulletins__block_invoke_8;
  v37[3] = &unk_265216948;
  objc_copyWeak(&v38, location);
  notify_register_dispatch("fakeFriendGoalCompletionDuringCompetition", &self->notifyGoalCompletionDuringCompetitionToken, v5, v37);

  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __42__ASFakeBulletinManager_registerBulletins__block_invoke_9;
  v35[3] = &unk_265216948;
  objc_copyWeak(&v36, location);
  notify_register_dispatch("fakeFriendCompetitionRequest", &self->notifyCompetitionRequestToken, v5, v35);
  v6 = MEMORY[0x263EF83A0];

  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __42__ASFakeBulletinManager_registerBulletins__block_invoke_10;
  v33[3] = &unk_265216948;
  objc_copyWeak(&v34, location);
  notify_register_dispatch("fakeFriendCompetitionAccepted", &self->notifyCompetitionAcceptToken, v6, v33);
  v7 = MEMORY[0x263EF83A0];

  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __42__ASFakeBulletinManager_registerBulletins__block_invoke_11;
  v31[3] = &unk_265216948;
  objc_copyWeak(&v32, location);
  notify_register_dispatch("fakeFriendCompetitionEndedWinner", &self->notifyCompetitionEndWinnerToken, v7, v31);
  v8 = MEMORY[0x263EF83A0];

  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __42__ASFakeBulletinManager_registerBulletins__block_invoke_12;
  v29[3] = &unk_265216948;
  objc_copyWeak(&v30, location);
  notify_register_dispatch("fakeFriendCompetitionEndedLoser", &self->notifyCompetitionEndLoserToken, v8, v29);
  v9 = MEMORY[0x263EF83A0];

  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __42__ASFakeBulletinManager_registerBulletins__block_invoke_13;
  v27[3] = &unk_265216948;
  objc_copyWeak(&v28, location);
  notify_register_dispatch("fakeFriendCompetitionEndedTie", &self->notifyCompetitionEndTieToken, v9, v27);
  v10 = MEMORY[0x263EF83A0];

  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __42__ASFakeBulletinManager_registerBulletins__block_invoke_14;
  v25[3] = &unk_265216948;
  objc_copyWeak(&v26, location);
  notify_register_dispatch("fakeCompetitionScoreCapCelebration", &self->notifyCompetitionScoreCapCelebrationToken, v10, v25);
  v11 = MEMORY[0x263EF83A0];

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __42__ASFakeBulletinManager_registerBulletins__block_invoke_15;
  v23[3] = &unk_265216948;
  objc_copyWeak(&v24, location);
  notify_register_dispatch("fakeShowInviteRequest", &self->notifyInviteRequestToken, v11, v23);
  v12 = MEMORY[0x263EF83A0];

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __42__ASFakeBulletinManager_registerBulletins__block_invoke_16;
  v21[3] = &unk_265216948;
  objc_copyWeak(&v22, location);
  notify_register_dispatch("fakeShowInviteResponse", &self->notifyInviteResponseToken, v12, v21);
  v13 = MEMORY[0x263EF83A0];

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __42__ASFakeBulletinManager_registerBulletins__block_invoke_17;
  v19[3] = &unk_265216948;
  objc_copyWeak(&v20, location);
  notify_register_dispatch("fakeShowInviteNeedsSetup", &self->notifyOfFakeInviteNeedsSetupToken, v13, v19);
  v14 = MEMORY[0x263EF83A0];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __42__ASFakeBulletinManager_registerBulletins__block_invoke_18;
  v17[3] = &unk_265216948;
  objc_copyWeak(&v18, location);
  notify_register_dispatch("fakeShowNeedToSignIn", &self->notifyOfFakeSignInToken, v14, v17);

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __42__ASFakeBulletinManager_registerBulletins__block_invoke_19;
  v15[3] = &unk_265216948;
  objc_copyWeak(&v16, location);
  notify_register_dispatch("fakeShowNeedToUpgrade", &self->notifyOfFakeUpgradeToken, v14, v15);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&v40);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&v44);
  objc_destroyWeak(&v46);
  objc_destroyWeak(&v48);
  objc_destroyWeak(&v50);
  objc_destroyWeak(&v52);
  objc_destroyWeak(location);
}

void __42__ASFakeBulletinManager_registerBulletins__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showFakeWorkoutNotification];
}

void __42__ASFakeBulletinManager_registerBulletins__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showFakeVideoWorkoutNotification];
}

void __42__ASFakeBulletinManager_registerBulletins__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showFakeGuidedRunWorkoutNotification];
}

void __42__ASFakeBulletinManager_registerBulletins__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showFakeGuidedWalkWorkoutNotification];
}

void __42__ASFakeBulletinManager_registerBulletins__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showFakeAchievementNotification];
}

void __42__ASFakeBulletinManager_registerBulletins__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showFakeGoalCompletionNotification];
}

void __42__ASFakeBulletinManager_registerBulletins__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showFakeBatchNotification];
}

void __42__ASFakeBulletinManager_registerBulletins__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showFakeGoalCompletionDuringCompetitionNotification];
}

void __42__ASFakeBulletinManager_registerBulletins__block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showFakeCompetitionRequestNotification];
}

void __42__ASFakeBulletinManager_registerBulletins__block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showFakeCompetitionAcceptedNotification];
}

void __42__ASFakeBulletinManager_registerBulletins__block_invoke_11(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showFakeCompetitionEndedWinnerNotification];
}

void __42__ASFakeBulletinManager_registerBulletins__block_invoke_12(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showFakeCompetitionEndedLoserNotification];
}

void __42__ASFakeBulletinManager_registerBulletins__block_invoke_13(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showFakeCompetitionEndedTieNotification];
}

void __42__ASFakeBulletinManager_registerBulletins__block_invoke_14(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showFakeCompetitionScoreCapCelebrationNotification];
}

void __42__ASFakeBulletinManager_registerBulletins__block_invoke_15(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showFakeInvitationRequest];
}

void __42__ASFakeBulletinManager_registerBulletins__block_invoke_16(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showFakeInvitationResponse];
}

void __42__ASFakeBulletinManager_registerBulletins__block_invoke_17(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showFakeInviteAttemptNeedsSetup];
}

void __42__ASFakeBulletinManager_registerBulletins__block_invoke_18(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showFakeNeedToSignIn];
}

void __42__ASFakeBulletinManager_registerBulletins__block_invoke_19(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showFakeNeedToUpgrade];
}

- (void)deregisterBulletins
{
  if (notify_is_valid_token(self->notifyGoalCompletionToken)) {
    notify_cancel(self->notifyGoalCompletionToken);
  }
  if (notify_is_valid_token(self->notifyAchievementToken)) {
    notify_cancel(self->notifyAchievementToken);
  }
  if (notify_is_valid_token(self->notifyWorkoutToken)) {
    notify_cancel(self->notifyWorkoutToken);
  }
  if (notify_is_valid_token(self->notifyVideoWorkoutToken)) {
    notify_cancel(self->notifyVideoWorkoutToken);
  }
  if (notify_is_valid_token(self->notifyGuidedWalkWorkoutToken)) {
    notify_cancel(self->notifyGuidedWalkWorkoutToken);
  }
  if (notify_is_valid_token(self->notifyBatchToken)) {
    notify_cancel(self->notifyBatchToken);
  }
  if (notify_is_valid_token(self->notifyCompetitionRequestToken)) {
    notify_cancel(self->notifyCompetitionRequestToken);
  }
  if (notify_is_valid_token(self->notifyCompetitionAcceptToken)) {
    notify_cancel(self->notifyCompetitionAcceptToken);
  }
  if (notify_is_valid_token(self->notifyCompetitionEndWinnerToken)) {
    notify_cancel(self->notifyCompetitionEndWinnerToken);
  }
  if (notify_is_valid_token(self->notifyCompetitionEndLoserToken)) {
    notify_cancel(self->notifyCompetitionEndLoserToken);
  }
  if (notify_is_valid_token(self->notifyCompetitionEndTieToken)) {
    notify_cancel(self->notifyCompetitionEndTieToken);
  }
  if (notify_is_valid_token(self->notifyCompetitionScoreCapCelebrationToken)) {
    notify_cancel(self->notifyCompetitionScoreCapCelebrationToken);
  }
  if (notify_is_valid_token(self->notifyInviteRequestToken)) {
    notify_cancel(self->notifyInviteRequestToken);
  }
  if (notify_is_valid_token(self->notifyInviteResponseToken)) {
    notify_cancel(self->notifyInviteResponseToken);
  }
  if (notify_is_valid_token(self->notifyOfFakeInviteNeedsSetupToken)) {
    notify_cancel(self->notifyOfFakeInviteNeedsSetupToken);
  }
  if (notify_is_valid_token(self->notifyOfFakeSignInToken)) {
    notify_cancel(self->notifyOfFakeSignInToken);
  }
  if (notify_is_valid_token(self->notifyOfFakeUpgradeToken))
  {
    int notifyOfFakeUpgradeToken = self->notifyOfFakeUpgradeToken;
    notify_cancel(notifyOfFakeUpgradeToken);
  }
}

- (void)_showFakeWorkoutNotification
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fakingManager);
  id v4 = [WeakRetained fakeWorkout];

  [(ASFakeBulletinManager *)self _showFakeWorkoutNotificationWithWorkout:v4];
}

- (void)_showFakeVideoWorkoutNotification
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fakingManager);
  id v4 = [WeakRetained fakeVideoWorkout];

  [(ASFakeBulletinManager *)self _showFakeWorkoutNotificationWithWorkout:v4];
}

- (void)_showFakeGuidedRunWorkoutNotification
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fakingManager);
  id v4 = [WeakRetained fakeGuidedRunWorkout];

  [(ASFakeBulletinManager *)self _showFakeWorkoutNotificationWithWorkout:v4];
}

- (void)_showFakeGuidedWalkWorkoutNotification
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fakingManager);
  id v4 = [WeakRetained fakeGuidedWalkWorkout];

  [(ASFakeBulletinManager *)self _showFakeWorkoutNotificationWithWorkout:v4];
}

- (void)_showFakeWorkoutNotificationWithWorkout:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F23AF0];
  id v5 = a3;
  id v12 = objc_alloc_init(v4);
  v6 = [MEMORY[0x263EFFA08] set];
  v7 = objc_opt_new();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fakingManager);
  v9 = [WeakRetained fakeFriend];
  [v7 setFriend:v9];

  [v7 setSample:v5];
  v10 = [v6 setByAddingObject:v7];

  [v12 setWorkoutNotifications:v10];
  id v11 = objc_loadWeakRetained((id *)&self->_activityDataBulletinManager);
  [v11 showActivityNotifications:v12 withPostingStyle:1];
}

- (void)_showFakeAchievementNotification
{
  id v11 = objc_alloc_init(MEMORY[0x263F23AF0]);
  objc_super v3 = [MEMORY[0x263EFFA08] set];
  id v4 = objc_opt_new();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fakingManager);
  v6 = [WeakRetained fakeFriend];
  [v4 setFriend:v6];

  id v7 = objc_loadWeakRetained((id *)&self->_fakingManager);
  v8 = [v7 fakeAchievement];
  [v4 setSample:v8];

  v9 = [v3 setByAddingObject:v4];

  [v11 setAchievementNotifications:v9];
  id v10 = objc_loadWeakRetained((id *)&self->_activityDataBulletinManager);
  [v10 showActivityNotifications:v11 withPostingStyle:1];
}

- (void)_showFakeGoalCompletionNotification
{
  id v11 = objc_alloc_init(MEMORY[0x263F23AF0]);
  objc_super v3 = [MEMORY[0x263EFFA08] set];
  id v4 = objc_opt_new();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fakingManager);
  v6 = [WeakRetained fakeFriend];
  [v4 setFriend:v6];

  id v7 = objc_loadWeakRetained((id *)&self->_fakingManager);
  v8 = [v7 fakeCompleteSnapshot];
  [v4 setSample:v8];

  v9 = [v3 setByAddingObject:v4];

  [v11 setGoalCompletionNotifications:v9];
  id v10 = objc_loadWeakRetained((id *)&self->_activityDataBulletinManager);
  [v10 showActivityNotifications:v11 withPostingStyle:1];
}

- (void)_showFakeBatchNotification
{
  id v23 = objc_alloc_init(MEMORY[0x263F23AF0]);
  objc_super v3 = [MEMORY[0x263EFFA08] set];
  id v4 = [MEMORY[0x263EFFA08] set];
  id v5 = [MEMORY[0x263EFFA08] set];
  p_fakingManager = &self->_fakingManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fakingManager);
  v8 = [WeakRetained fakeFriend];

  v9 = objc_opt_new();
  [v9 setFriend:v8];
  id v10 = objc_loadWeakRetained((id *)p_fakingManager);
  id v11 = [v10 fakeWorkout];
  [v9 setSample:v11];

  id v12 = [v3 setByAddingObject:v9];

  [v23 setWorkoutNotifications:v12];
  v13 = objc_opt_new();
  [v13 setFriend:v8];
  id v14 = objc_loadWeakRetained((id *)p_fakingManager);
  v15 = [v14 fakeAchievement];
  [v13 setSample:v15];

  id v16 = [v4 setByAddingObject:v13];

  [v23 setAchievementNotifications:v16];
  v17 = objc_opt_new();
  [v17 setFriend:v8];
  id v18 = objc_loadWeakRetained((id *)p_fakingManager);
  v19 = [v18 fakeCompleteSnapshot];
  [v17 setSample:v19];

  id v20 = [v5 setByAddingObject:v17];

  [v23 setGoalCompletionNotifications:v20];
  id v21 = objc_loadWeakRetained((id *)&self->_activityDataBulletinManager);
  [v21 showActivityNotifications:v23 withPostingStyle:1];
}

- (void)_showFakeGoalCompletionDuringCompetitionNotification
{
  id v16 = objc_alloc_init(MEMORY[0x263F23AF0]);
  objc_super v3 = [MEMORY[0x263EFFA08] set];
  id v4 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v5 = [MEMORY[0x263EFF910] date];
  v6 = [v4 dateByAddingUnit:16 value:-2 toDate:v5 options:0];

  id v7 = objc_opt_new();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fakingManager);
  v9 = [WeakRetained fakeCompetitionWithStartDate:v6 winningParticipant:0];

  id v10 = objc_loadWeakRetained((id *)&self->_fakingManager);
  id v11 = [v10 fakeFriendWithCompetitionStatus:2 competition:v9];
  [v7 setFriend:v11];

  id v12 = objc_loadWeakRetained((id *)&self->_fakingManager);
  v13 = [v12 fakeCompleteSnapshot];
  [v7 setSample:v13];

  id v14 = [v3 setByAddingObject:v7];

  [v16 setGoalCompletionNotifications:v14];
  id v15 = objc_loadWeakRetained((id *)&self->_activityDataBulletinManager);
  [v15 showActivityNotifications:v16 withPostingStyle:1];
}

- (void)_showFakeCompetitionRequestNotification
{
  objc_super v3 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v4 = [MEMORY[0x263EFF910] date];
  id v10 = [v3 dateByAddingUnit:16 value:1 toDate:v4 options:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_fakingManager);
  v6 = [WeakRetained fakeCompetitionWithStartDate:v10 winningParticipant:0];

  id v7 = objc_loadWeakRetained((id *)&self->_fakingManager);
  v8 = [v7 fakeFriendWithCompetitionStatus:1 competition:v6];

  id v9 = objc_loadWeakRetained((id *)&self->_competitionBulletinManager);
  [v9 showCompetitionRequestNotificationForFriend:v8 competition:v6 withPostingStyle:1];
}

- (void)_showFakeCompetitionAcceptedNotification
{
  objc_super v3 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v4 = [MEMORY[0x263EFF910] date];
  id v10 = [v3 dateByAddingUnit:16 value:1 toDate:v4 options:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_fakingManager);
  v6 = [WeakRetained fakeCompetitionWithStartDate:v10 winningParticipant:0];

  id v7 = objc_loadWeakRetained((id *)&self->_fakingManager);
  v8 = [v7 fakeFriendWithCompetitionStatus:1 competition:v6];

  id v9 = objc_loadWeakRetained((id *)&self->_competitionBulletinManager);
  [v9 showCompetitionAcceptedNotificationForFriend:v8 competition:v6 withPostingStyle:1];
}

- (void)_showFakeCompetitionEndedWinnerNotification
{
  objc_super v3 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v4 = [MEMORY[0x263EFF910] date];
  id v10 = [v3 dateByAddingUnit:16 value:-7 toDate:v4 options:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_fakingManager);
  v6 = [WeakRetained fakeCompetitionWithStartDate:v10 winningParticipant:0];

  id v7 = objc_loadWeakRetained((id *)&self->_fakingManager);
  v8 = [v7 fakeFriendWithCompetitionStatus:3 competition:v6];

  id v9 = objc_loadWeakRetained((id *)&self->_competitionBulletinManager);
  [v9 showCompetitionEndedNotificationForFriend:v8 competition:v6 withPostingStyle:1];
}

- (void)_showFakeCompetitionEndedLoserNotification
{
  objc_super v3 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v4 = [MEMORY[0x263EFF910] date];
  id v10 = [v3 dateByAddingUnit:16 value:-7 toDate:v4 options:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_fakingManager);
  v6 = [WeakRetained fakeCompetitionWithStartDate:v10 winningParticipant:1];

  id v7 = objc_loadWeakRetained((id *)&self->_fakingManager);
  v8 = [v7 fakeFriendWithCompetitionStatus:3 competition:v6];

  id v9 = objc_loadWeakRetained((id *)&self->_competitionBulletinManager);
  [v9 showCompetitionEndedNotificationForFriend:v8 competition:v6 withPostingStyle:1];
}

- (void)_showFakeCompetitionEndedTieNotification
{
  objc_super v3 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v4 = [MEMORY[0x263EFF910] date];
  id v10 = [v3 dateByAddingUnit:16 value:-7 toDate:v4 options:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_fakingManager);
  v6 = [WeakRetained fakeTiedCompetitionWithStartDate:v10];

  id v7 = objc_loadWeakRetained((id *)&self->_fakingManager);
  v8 = [v7 fakeFriendWithCompetitionStatus:3 competition:v6];

  id v9 = objc_loadWeakRetained((id *)&self->_competitionBulletinManager);
  [v9 showCompetitionEndedNotificationForFriend:v8 competition:v6 withPostingStyle:1];
}

- (void)_showFakeCompetitionScoreCapCelebrationNotification
{
  id v4 = [MEMORY[0x263F23BC8] fakeFirstGlanceFriendListForMarketing];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_competitionBulletinManager);
  [WeakRetained showCompetitionScoreCapCelebrationForFriends:v4 withPostingStyle:1];
}

- (void)_showFakeInvitationRequest
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_friendInviteBulletinManager);
  objc_super v3 = [(ASFakeBulletinManager *)self _fakeContact];
  [WeakRetained showInviteRequestFromContact:v3 withPostingStyle:1];
}

- (void)_showFakeInvitationResponse
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_friendInviteBulletinManager);
  objc_super v3 = [(ASFakeBulletinManager *)self _fakeContact];
  [WeakRetained showInviteAcceptResponseFrom:v3];
}

- (void)_showFakeInviteAttemptNeedsSetup
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_friendInviteBulletinManager);
  objc_super v3 = [(ASFakeBulletinManager *)self _fakeContact];
  [WeakRetained showInviteAttemptNeedsSetupFromContact:v3];
}

- (void)_showFakeNeedToSignIn
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_friendInviteBulletinManager);
  objc_super v3 = [(ASFakeBulletinManager *)self _fakeContact];
  [WeakRetained showInviteAttemptNeedToSignInFrom:v3];
}

- (void)_showFakeNeedToUpgrade
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_friendInviteBulletinManager);
  objc_super v3 = [(ASFakeBulletinManager *)self _fakeContact];
  [WeakRetained showInviteAttemptNeedToUpgradeFrom:v3];
}

- (id)_fakeContact
{
  id v2 = objc_alloc_init(MEMORY[0x263F23BC0]);
  objc_super v3 = [MEMORY[0x263EFFA08] setWithObject:@"johndoe@icloud.com"];
  [v2 setDestinations:v3];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bulletinPostingManager, 0);
  objc_destroyWeak((id *)&self->_friendInviteBulletinManager);
  objc_destroyWeak((id *)&self->_fakingManager);
  objc_destroyWeak((id *)&self->_competitionBulletinManager);
  objc_destroyWeak((id *)&self->_activityDataBulletinManager);
}

@end