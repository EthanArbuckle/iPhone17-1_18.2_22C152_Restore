@interface GKViewServiceInterface
+ (id)challengeIssueHostViewControllerInterface;
+ (id)challengeIssueServiceViewControllerInterface;
+ (id)extensionHostInterface;
+ (id)extensionInterface;
+ (id)gameCenterHostViewControllerInterface;
+ (id)gameCenterServiceViewControllerInterface;
+ (id)matchmakerHostViewControllerInterface;
+ (id)matchmakerServiceViewControllerInterface;
+ (id)remoteFriendRequestViewControllerInterface;
+ (id)remoteSignInViewControllerInterface;
+ (id)serviceFriendRequestViewControllerInterface;
+ (id)signInServiceViewControllerInterface;
+ (id)turnBasedHostViewControllerInterface;
+ (id)turnBasedServiceViewControllerInterface;
+ (void)_configureKVOTypes:(id)a3;
+ (void)setClassesForExtensionInterface:(id)a3;
+ (void)setClassesForHostInterface:(id)a3;
@end

@implementation GKViewServiceInterface

+ (void)setClassesForHostInterface:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F63808];
  id v4 = a3;
  id v5 = [v3 plistClasses];
  [v4 setClasses:v5 forSelector:sel_messageFromExtension_ argumentIndex:0 ofReply:0];
}

+ (void)setClassesForExtensionInterface:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F63808];
  id v5 = a3;
  id v6 = [v4 plistClasses];
  [v5 setClasses:v6 forSelector:sel_messageFromClient_ argumentIndex:0 ofReply:0];
  [a1 _configureKVOTypes:v5];
}

+ (id)extensionHostInterface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__GKViewServiceInterface_extensionHostInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (extensionHostInterface_onceToken != -1) {
    dispatch_once(&extensionHostInterface_onceToken, block);
  }
  v2 = (void *)extensionHostInterface_sHostInterface;

  return v2;
}

uint64_t __48__GKViewServiceInterface_extensionHostInterface__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) interfaceWithProtocol:&unk_1F085BEB8];
  v3 = (void *)extensionHostInterface_sHostInterface;
  extensionHostInterface_sHostInterface = v2;

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = extensionHostInterface_sHostInterface;

  return [v4 setClassesForHostInterface:v5];
}

+ (id)extensionInterface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__GKViewServiceInterface_extensionInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (extensionInterface_onceToken != -1) {
    dispatch_once(&extensionInterface_onceToken, block);
  }
  uint64_t v2 = (void *)extensionInterface_sExtensionInterface;

  return v2;
}

uint64_t __44__GKViewServiceInterface_extensionInterface__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) interfaceWithProtocol:&unk_1F0860FA8];
  v3 = (void *)extensionInterface_sExtensionInterface;
  extensionInterface_sExtensionInterface = v2;

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = extensionInterface_sExtensionInterface;

  return [v4 setClassesForExtensionInterface:v5];
}

+ (id)gameCenterHostViewControllerInterface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__GKViewServiceInterface_gameCenterHostViewControllerInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (gameCenterHostViewControllerInterface_onceToken != -1) {
    dispatch_once(&gameCenterHostViewControllerInterface_onceToken, block);
  }
  uint64_t v2 = (void *)gameCenterHostViewControllerInterface_sServiceInterface;

  return v2;
}

uint64_t __63__GKViewServiceInterface_gameCenterHostViewControllerInterface__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) interfaceWithProtocol:&unk_1F087E5C0];
  v3 = (void *)gameCenterHostViewControllerInterface_sServiceInterface;
  gameCenterHostViewControllerInterface_sServiceInterface = v2;

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = gameCenterHostViewControllerInterface_sServiceInterface;

  return [v4 setClassesForHostInterface:v5];
}

+ (id)gameCenterServiceViewControllerInterface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__GKViewServiceInterface_gameCenterServiceViewControllerInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (gameCenterServiceViewControllerInterface_onceToken != -1) {
    dispatch_once(&gameCenterServiceViewControllerInterface_onceToken, block);
  }
  uint64_t v2 = (void *)gameCenterServiceViewControllerInterface_sRemoteInterface;

  return v2;
}

uint64_t __66__GKViewServiceInterface_gameCenterServiceViewControllerInterface__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) interfaceWithProtocol:&unk_1F087E3B8];
  v3 = (void *)gameCenterServiceViewControllerInterface_sRemoteInterface;
  gameCenterServiceViewControllerInterface_sRemoteInterface = v2;

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = gameCenterServiceViewControllerInterface_sRemoteInterface;

  return [v4 setClassesForExtensionInterface:v5];
}

+ (id)remoteSignInViewControllerInterface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__GKViewServiceInterface_remoteSignInViewControllerInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (remoteSignInViewControllerInterface_onceToken != -1) {
    dispatch_once(&remoteSignInViewControllerInterface_onceToken, block);
  }
  uint64_t v2 = (void *)remoteSignInViewControllerInterface_sServiceInterface;

  return v2;
}

uint64_t __61__GKViewServiceInterface_remoteSignInViewControllerInterface__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) interfaceWithProtocol:&unk_1F0880130];
  v3 = (void *)remoteSignInViewControllerInterface_sServiceInterface;
  remoteSignInViewControllerInterface_sServiceInterface = v2;

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = remoteSignInViewControllerInterface_sServiceInterface;

  return [v4 setClassesForHostInterface:v5];
}

+ (id)signInServiceViewControllerInterface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__GKViewServiceInterface_signInServiceViewControllerInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signInServiceViewControllerInterface_onceToken != -1) {
    dispatch_once(&signInServiceViewControllerInterface_onceToken, block);
  }
  uint64_t v2 = (void *)signInServiceViewControllerInterface_sRemoteInterface;

  return v2;
}

uint64_t __62__GKViewServiceInterface_signInServiceViewControllerInterface__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) interfaceWithProtocol:&unk_1F08B1E80];
  v3 = (void *)signInServiceViewControllerInterface_sRemoteInterface;
  signInServiceViewControllerInterface_sRemoteInterface = v2;

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = signInServiceViewControllerInterface_sRemoteInterface;

  return [v4 setClassesForExtensionInterface:v5];
}

+ (id)remoteFriendRequestViewControllerInterface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__GKViewServiceInterface_remoteFriendRequestViewControllerInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (remoteFriendRequestViewControllerInterface_onceToken != -1) {
    dispatch_once(&remoteFriendRequestViewControllerInterface_onceToken, block);
  }
  uint64_t v2 = (void *)remoteFriendRequestViewControllerInterface_sServiceInterface;

  return v2;
}

void __68__GKViewServiceInterface_remoteFriendRequestViewControllerInterface__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) interfaceWithProtocol:&unk_1F08B1EE0];
  v3 = (void *)remoteFriendRequestViewControllerInterface_sServiceInterface;
  remoteFriendRequestViewControllerInterface_sServiceInterface = v2;

  id v6 = [MEMORY[0x1E4F63808] plistClasses];
  id v4 = (void *)remoteFriendRequestViewControllerInterface_sServiceInterface;
  uint64_t v5 = [v6 setByAddingObject:objc_opt_class()];
  [v4 setClasses:v5 forSelector:sel_didRequestFriends_ argumentIndex:0 ofReply:0];

  [*(id *)(a1 + 32) setClassesForHostInterface:remoteFriendRequestViewControllerInterface_sServiceInterface];
}

+ (id)serviceFriendRequestViewControllerInterface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__GKViewServiceInterface_serviceFriendRequestViewControllerInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (serviceFriendRequestViewControllerInterface_onceToken != -1) {
    dispatch_once(&serviceFriendRequestViewControllerInterface_onceToken, block);
  }
  uint64_t v2 = (void *)serviceFriendRequestViewControllerInterface_sRemoteInterface;

  return v2;
}

void __69__GKViewServiceInterface_serviceFriendRequestViewControllerInterface__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) interfaceWithProtocol:&unk_1F08B1F40];
  v3 = (void *)serviceFriendRequestViewControllerInterface_sRemoteInterface;
  serviceFriendRequestViewControllerInterface_sRemoteInterface = v2;

  id v6 = [MEMORY[0x1E4F63808] plistClasses];
  id v4 = (void *)serviceFriendRequestViewControllerInterface_sRemoteInterface;
  uint64_t v5 = [v6 setByAddingObject:objc_opt_class()];
  [v4 setClasses:v5 forSelector:sel_addRecipientPlayerInternals_ argumentIndex:0 ofReply:0];

  [*(id *)(a1 + 32) setClassesForExtensionInterface:serviceFriendRequestViewControllerInterface_sRemoteInterface];
}

+ (id)challengeIssueHostViewControllerInterface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__GKViewServiceInterface_challengeIssueHostViewControllerInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (challengeIssueHostViewControllerInterface_onceToken != -1) {
    dispatch_once(&challengeIssueHostViewControllerInterface_onceToken, block);
  }
  uint64_t v2 = (void *)challengeIssueHostViewControllerInterface_sServiceInterface;

  return v2;
}

void __67__GKViewServiceInterface_challengeIssueHostViewControllerInterface__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) interfaceWithProtocol:&unk_1F0874528];
  v3 = (void *)challengeIssueHostViewControllerInterface_sServiceInterface;
  challengeIssueHostViewControllerInterface_sServiceInterface = v2;

  id v4 = [MEMORY[0x1E4F63808] plistClasses];
  [(id)challengeIssueHostViewControllerInterface_sServiceInterface setClasses:v4 forSelector:sel_didFinishWithPlayerIDs_message_ argumentIndex:0 ofReply:0];
  [*(id *)(a1 + 32) setClassesForHostInterface:challengeIssueHostViewControllerInterface_sServiceInterface];
}

+ (id)challengeIssueServiceViewControllerInterface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__GKViewServiceInterface_challengeIssueServiceViewControllerInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (challengeIssueServiceViewControllerInterface_onceToken != -1) {
    dispatch_once(&challengeIssueServiceViewControllerInterface_onceToken, block);
  }
  uint64_t v2 = (void *)challengeIssueServiceViewControllerInterface_sRemoteInterface;

  return v2;
}

void __70__GKViewServiceInterface_challengeIssueServiceViewControllerInterface__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) interfaceWithProtocol:&unk_1F08B1FA0];
  v3 = (void *)challengeIssueServiceViewControllerInterface_sRemoteInterface;
  challengeIssueServiceViewControllerInterface_sRemoteInterface = v2;

  id v4 = [MEMORY[0x1E4F63808] plistClasses];
  uint64_t v5 = (void *)challengeIssueServiceViewControllerInterface_sRemoteInterface;
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:3];
  v7 = objc_msgSend(v4, "setByAddingObjectsFromArray:", v6, v8, v9);
  [v5 setClasses:v7 forSelector:sel_setValue_forKeyPath_withReply_ argumentIndex:0 ofReply:0];

  [*(id *)(a1 + 32) setClassesForExtensionInterface:challengeIssueServiceViewControllerInterface_sRemoteInterface];
}

+ (id)matchmakerHostViewControllerInterface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__GKViewServiceInterface_matchmakerHostViewControllerInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (matchmakerHostViewControllerInterface_onceToken != -1) {
    dispatch_once(&matchmakerHostViewControllerInterface_onceToken, block);
  }
  uint64_t v2 = (void *)matchmakerHostViewControllerInterface_sServiceInterface;

  return v2;
}

void __63__GKViewServiceInterface_matchmakerHostViewControllerInterface__block_invoke(uint64_t a1)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) interfaceWithProtocol:&unk_1F0883110];
  v3 = (void *)matchmakerHostViewControllerInterface_sServiceInterface;
  matchmakerHostViewControllerInterface_sServiceInterface = v2;

  id v4 = [MEMORY[0x1E4F63808] plistClasses];
  uint64_t v5 = (void *)matchmakerHostViewControllerInterface_sServiceInterface;
  id v6 = [v4 setByAddingObject:objc_opt_class()];
  [v5 setClasses:v6 forSelector:sel_startMatchingWithRequest_ argumentIndex:0 ofReply:0];

  v7 = (void *)matchmakerHostViewControllerInterface_sServiceInterface;
  uint64_t v8 = [v4 setByAddingObject:objc_opt_class()];
  [v7 setClasses:v8 forSelector:sel_cancelPendingInviteToPlayer_ argumentIndex:0 ofReply:0];

  uint64_t v9 = (void *)matchmakerHostViewControllerInterface_sServiceInterface;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  uint64_t v11 = [v4 setByAddingObjectsFromArray:v10];
  [v9 setClasses:v11 forSelector:sel_setShareInvitees_ argumentIndex:0 ofReply:0];

  [*(id *)(a1 + 32) setClassesForHostInterface:matchmakerHostViewControllerInterface_sServiceInterface];
}

+ (id)matchmakerServiceViewControllerInterface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__GKViewServiceInterface_matchmakerServiceViewControllerInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (matchmakerServiceViewControllerInterface_onceToken != -1) {
    dispatch_once(&matchmakerServiceViewControllerInterface_onceToken, block);
  }
  uint64_t v2 = (void *)matchmakerServiceViewControllerInterface_sRemoteInterface;

  return v2;
}

void __66__GKViewServiceInterface_matchmakerServiceViewControllerInterface__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) interfaceWithProtocol:&unk_1F0883200];
  v3 = (void *)matchmakerServiceViewControllerInterface_sRemoteInterface;
  matchmakerServiceViewControllerInterface_sRemoteInterface = v2;

  [*(id *)(a1 + 32) setClassesForExtensionInterface:matchmakerServiceViewControllerInterface_sRemoteInterface];
  id v4 = [MEMORY[0x1E4F63808] plistClasses];
  uint64_t v5 = (void *)matchmakerServiceViewControllerInterface_sRemoteInterface;
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:3];
  v7 = objc_msgSend(v4, "setByAddingObjectsFromArray:", v6, v8, v9);
  [v5 setClasses:v7 forSelector:sel_setValue_forKeyPath_withReply_ argumentIndex:0 ofReply:0];
}

+ (id)turnBasedHostViewControllerInterface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__GKViewServiceInterface_turnBasedHostViewControllerInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (turnBasedHostViewControllerInterface_onceToken != -1) {
    dispatch_once(&turnBasedHostViewControllerInterface_onceToken, block);
  }
  uint64_t v2 = (void *)turnBasedHostViewControllerInterface_sServiceInterface;

  return v2;
}

void __62__GKViewServiceInterface_turnBasedHostViewControllerInterface__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) interfaceWithProtocol:&unk_1F087E7B8];
  v3 = (void *)turnBasedHostViewControllerInterface_sServiceInterface;
  turnBasedHostViewControllerInterface_sServiceInterface = v2;

  id v8 = [MEMORY[0x1E4F63808] plistClasses];
  id v4 = (void *)turnBasedHostViewControllerInterface_sServiceInterface;
  uint64_t v5 = [v8 setByAddingObject:objc_opt_class()];
  [v4 setClasses:v5 forSelector:sel_finishWithMatch_ argumentIndex:0 ofReply:0];

  id v6 = (void *)turnBasedHostViewControllerInterface_sServiceInterface;
  v7 = [v8 setByAddingObject:objc_opt_class()];
  [v6 setClasses:v7 forSelector:sel_playerQuitMatch_ argumentIndex:0 ofReply:0];

  [*(id *)(a1 + 32) setClassesForHostInterface:turnBasedHostViewControllerInterface_sServiceInterface];
}

+ (id)turnBasedServiceViewControllerInterface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__GKViewServiceInterface_turnBasedServiceViewControllerInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (turnBasedServiceViewControllerInterface_onceToken != -1) {
    dispatch_once(&turnBasedServiceViewControllerInterface_onceToken, block);
  }
  uint64_t v2 = (void *)turnBasedServiceViewControllerInterface_sRemoteInterface;

  return v2;
}

void __65__GKViewServiceInterface_turnBasedServiceViewControllerInterface__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) interfaceWithProtocol:&unk_1F087E868];
  v3 = (void *)turnBasedServiceViewControllerInterface_sRemoteInterface;
  turnBasedServiceViewControllerInterface_sRemoteInterface = v2;

  [*(id *)(a1 + 32) setClassesForExtensionInterface:turnBasedServiceViewControllerInterface_sRemoteInterface];
  id v6 = [MEMORY[0x1E4F63808] plistClasses];
  id v4 = (void *)turnBasedServiceViewControllerInterface_sRemoteInterface;
  uint64_t v5 = [v6 setByAddingObject:objc_opt_class()];
  [v4 setClasses:v5 forSelector:sel_setValue_forKeyPath_withReply_ argumentIndex:0 ofReply:0];
}

+ (void)_configureKVOTypes:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F63808];
  id v4 = a3;
  uint64_t v5 = [v3 plistClasses];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:7];
  v7 = objc_msgSend(v5, "setByAddingObjectsFromArray:", v6, v8, v9, v10, v11, v12, v13);

  [v4 setClasses:v7 forSelector:sel_setValue_forKeyPath_withReply_ argumentIndex:0 ofReply:0];
  [v4 setClasses:v7 forSelector:sel_setInitialState_withReply_ argumentIndex:0 ofReply:0];
}

@end