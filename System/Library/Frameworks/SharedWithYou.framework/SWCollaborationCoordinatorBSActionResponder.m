@interface SWCollaborationCoordinatorBSActionResponder
+ (SWCollaborationCoordinatorBSActionResponder)sharedActionResponder;
- (SWCollaborationCoordinatorBSActionResponder)init;
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
- (void)_appDidFinishLaunching:(id)a3;
@end

@implementation SWCollaborationCoordinatorBSActionResponder

- (void)_appDidFinishLaunching:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F3BDD8], "sharedManager", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 applicationHasFinishedLaunching];
}

uint64_t __68__SWCollaborationCoordinatorBSActionResponder_sharedActionResponder__block_invoke(uint64_t a1)
{
  sharedActionResponder_shared = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (SWCollaborationCoordinatorBSActionResponder)init
{
  v7.receiver = self;
  v7.super_class = (Class)SWCollaborationCoordinatorBSActionResponder;
  v2 = [(SWCollaborationCoordinatorBSActionResponder *)&v7 init];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4FB1438] sharedApplication];
    int v4 = [v3 _hasApplicationCalledLaunchDelegate];

    if (v4)
    {
      v5 = [MEMORY[0x1E4F3BDD8] sharedManager];
      [v5 applicationHasFinishedLaunching];
    }
    else
    {
      v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 addObserver:v2 selector:sel__appDidFinishLaunching_ name:*MEMORY[0x1E4FB2648] object:0];
    }
  }
  return v2;
}

+ (SWCollaborationCoordinatorBSActionResponder)sharedActionResponder
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__SWCollaborationCoordinatorBSActionResponder_sharedActionResponder__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedActionResponder_onceToken != -1) {
    dispatch_once(&sharedActionResponder_onceToken, block);
  }
  v2 = (void *)sharedActionResponder_shared;

  return (SWCollaborationCoordinatorBSActionResponder *)v2;
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_super v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v6, "count"));
  v8 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v6, "count"));
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __109__SWCollaborationCoordinatorBSActionResponder__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke;
  v19 = &unk_1E5665CD8;
  id v9 = v7;
  id v20 = v9;
  id v10 = v8;
  id v21 = v10;
  [v6 enumerateObjectsUsingBlock:&v16];
  if (objc_msgSend(v9, "count", v16, v17, v18, v19))
  {
    v11 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[SWCollaborationCoordinatorBSActionResponder _respondToActions:forFBSScene:inUIScene:fromTransitionContext:]";
      _os_log_impl(&dword_18FB18000, v11, OS_LOG_TYPE_DEFAULT, "%s we have incoming actions to deliver to the collaboration coordinator.", buf, 0xCu);
    }

    v12 = [MEMORY[0x1E4F3BDD8] sharedManager];
    v13 = [v9 allObjects];
    [v12 processIncomingActions:v13];
  }
  v14 = (void *)[v6 mutableCopy];
  [v14 minusSet:v10];

  return v14;
}

void __109__SWCollaborationCoordinatorBSActionResponder__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(MEMORY[0x1E4F3BDA0], "actionWithDestinationAction:");
  if (v3)
  {
    [*(id *)(a1 + 32) addObject:v3];
    [*(id *)(a1 + 40) addObject:v4];
  }
}

@end