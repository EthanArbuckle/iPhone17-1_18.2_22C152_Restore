@interface GKDashboardExtensionHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (void)getMethodsImplementedByChallengeEventHandlerDelegate:(id)a3;
- (void)requestDashboardLogoImageWithHandler:(id)a3;
- (void)requestImagesForLeaderboardSetsWithHandler:(id)a3;
- (void)requestImagesForLeaderboardsInSet:(id)a3 handler:(id)a4;
@end

@implementation GKDashboardExtensionHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[GKViewServiceInterface gameCenterServiceViewControllerInterface];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[GKViewServiceInterface gameCenterHostViewControllerInterface];
}

- (void)requestDashboardLogoImageWithHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (void)requestImagesForLeaderboardSetsWithHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (void)requestImagesForLeaderboardsInSet:(id)a3 handler:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (void)getMethodsImplementedByChallengeEventHandlerDelegate:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__GKDashboardExtensionHostContext_getMethodsImplementedByChallengeEventHandlerDelegate___block_invoke;
    block[3] = &unk_1E5F639B0;
    id v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __88__GKDashboardExtensionHostContext_getMethodsImplementedByChallengeEventHandlerDelegate___block_invoke(uint64_t a1)
{
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v2 = [MEMORY[0x1E4F636B0] challengeEventHandler];
  id v3 = [v2 delegate];

  if (objc_opt_respondsToSelector())
  {
    v4 = NSStringFromSelector(sel_localPlayerDidSelectChallenge_);
    [v10 addObject:v4];
  }
  v5 = [MEMORY[0x1E4F63760] localPlayer];
  id v6 = [v5 eventEmitter];

  if ([v6 listenerRegisteredForSelector:sel_player_wantsToPlayChallenge_])
  {
    v7 = NSStringFromSelector(sel_player_wantsToPlayChallenge_);
    [v10 addObject:v7];
  }
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = [v10 allObjects];
  (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, 0);
}

@end