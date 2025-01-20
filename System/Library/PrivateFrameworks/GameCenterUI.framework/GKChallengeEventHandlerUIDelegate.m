@interface GKChallengeEventHandlerUIDelegate
- (void)showLocallyCompletedBannerForIssuingPlayer:(id)a3 challenge:(id)a4 handler:(id)a5;
- (void)showReceivedBannerForIssuingPlayer:(id)a3 challenge:(id)a4 handler:(id)a5;
- (void)showRemotelyCompletedBannerForReceivingPlayer:(id)a3 challenge:(id)a4 handler:(id)a5;
@end

@implementation GKChallengeEventHandlerUIDelegate

- (void)showReceivedBannerForIssuingPlayer:(id)a3 challenge:(id)a4 handler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v14 = [a4 alertGoalText];
  v9 = [v8 displayNameWithOptions:0];
  v10 = NSString;
  v11 = GKGameCenterUIFrameworkBundle();
  v12 = GKGetLocalizedStringFromTableInBundle();
  v13 = objc_msgSend(v10, "stringWithFormat:", v12, v14);

  if (GKApplicationLinkedOnOrAfter()) {
    +[GKNotificationBanner showBannerWithTitle:v9 player:v8 message:v13 touchHandler:v7];
  }
  else {
    +[GKNotificationBanner showBannerWithTitle:v9 player:v8 message:v13 completionHandler:v7];
  }
}

- (void)showRemotelyCompletedBannerForReceivingPlayer:(id)a3 challenge:(id)a4 handler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v14 = [a4 alertGoalText];
  v9 = [v8 displayNameWithOptions:0];
  v10 = NSString;
  v11 = GKGameCenterUIFrameworkBundle();
  v12 = GKGetLocalizedStringFromTableInBundle();
  v13 = objc_msgSend(v10, "stringWithFormat:", v12, v14);

  if (GKApplicationLinkedOnOrAfter()) {
    +[GKNotificationBanner showBannerWithTitle:v9 player:v8 message:v13 touchHandler:v7];
  }
  else {
    +[GKNotificationBanner showBannerWithTitle:v9 player:v8 message:v13 completionHandler:v7];
  }
}

- (void)showLocallyCompletedBannerForIssuingPlayer:(id)a3 challenge:(id)a4 handler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __98__GKChallengeEventHandlerUIDelegate_showLocallyCompletedBannerForIssuingPlayer_challenge_handler___block_invoke;
  v13[3] = &unk_1E5F65350;
  id v14 = v8;
  id v15 = v7;
  id v16 = v9;
  id v10 = v9;
  id v11 = v7;
  id v12 = v8;
  [v12 loadBannerImageWithHandler:v13];
}

void __98__GKChallengeEventHandlerUIDelegate_showLocallyCompletedBannerForIssuingPlayer_challenge_handler___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v14 = [v3 alertGoalText];
  v5 = NSString;
  v6 = GKGameCenterUIFrameworkBundle();
  id v7 = GKGetLocalizedStringFromTableInBundle();
  id v8 = [*(id *)(a1 + 40) displayNameWithOptions:0];
  id v9 = objc_msgSend(v5, "stringWithFormat:", v7, v8, v14);

  int v10 = GKApplicationLinkedOnOrAfter();
  id v11 = GKGameCenterUIFrameworkBundle();
  id v12 = GKGetLocalizedStringFromTableInBundle();
  uint64_t v13 = *(void *)(a1 + 48);
  if (v10) {
    +[GKNotificationBanner showBannerWithTitle:v12 image:v4 message:v9 touchHandler:v13];
  }
  else {
    +[GKNotificationBanner showBannerWithTitle:v12 image:v4 message:v9 completionHandler:v13];
  }
}

@end