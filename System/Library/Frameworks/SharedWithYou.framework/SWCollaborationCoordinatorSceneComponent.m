@interface SWCollaborationCoordinatorSceneComponent
+ (void)_registerWithUIKit;
+ (void)load;
- (SWCollaborationCoordinatorSceneComponent)initWithScene:(id)a3;
- (UIScene)_scene;
- (id)_actionRespondersForScene:(id)a3;
- (void)_setScene:(id)a3;
@end

@implementation SWCollaborationCoordinatorSceneComponent

+ (void)load
{
}

- (void)_setScene:(id)a3
{
}

- (SWCollaborationCoordinatorSceneComponent)initWithScene:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SWCollaborationCoordinatorSceneComponent;
  v5 = [(SWCollaborationCoordinatorSceneComponent *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_scene, v4);
  }

  return v6;
}

+ (void)_registerWithUIKit
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SWCollaborationCoordinatorSceneComponent__registerWithUIKit__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_registerWithUIKit_onceToken != -1) {
    dispatch_once(&_registerWithUIKit_onceToken, block);
  }
}

void __62__SWCollaborationCoordinatorSceneComponent__registerWithUIKit__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 == objc_opt_class())
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__SWCollaborationCoordinatorSceneComponent__registerWithUIKit__block_invoke_2;
    aBlock[3] = &__block_descriptor_40_e5_v8__0l;
    aBlock[4] = *(void *)(a1 + 32);
    v3 = (void (**)(void))_Block_copy(aBlock);
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      v3[2](v3);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], v3);
    }
  }
}

void __62__SWCollaborationCoordinatorSceneComponent__registerWithUIKit__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4FB1B70];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  [v1 _registerSceneComponentClass:v2 withKey:@"SWCollaborationCoordinatorSceneComponent" predicate:v3];
}

- (id)_actionRespondersForScene:(id)a3
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id v3 = +[SWCollaborationCoordinatorBSActionResponder sharedActionResponder];
  v7[0] = v3;
  id v4 = +[SWShareableContentBSActionResponder sharedActionResponder];
  v7[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (UIScene *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end