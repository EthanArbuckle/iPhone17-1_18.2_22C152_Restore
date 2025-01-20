@interface _FBSystemAppSceneInfo
- (BOOL)hasHandledSceneCreate;
- (BOOL)hasSentFBSWorkspaceDelegateSceneCreate;
- (FBSScene)FBSScene;
- (FBSSceneTransitionContext)pendingTransitionContext;
- (void)setFBSScene:(id)a3;
- (void)setHasHandledSceneCreate:(BOOL)a3;
- (void)setHasSentFBSWorkspaceDelegateSceneCreate:(BOOL)a3;
- (void)setPendingTransitionContext:(id)a3;
@end

@implementation _FBSystemAppSceneInfo

- (BOOL)hasHandledSceneCreate
{
  return self->hasHandledSceneCreate;
}

- (FBSScene)FBSScene
{
  return self->FBSScene;
}

- (void)setFBSScene:(id)a3
{
}

- (void)setHasHandledSceneCreate:(BOOL)a3
{
  self->hasHandledSceneCreate = a3;
}

- (BOOL)hasSentFBSWorkspaceDelegateSceneCreate
{
  return self->hasSentFBSWorkspaceDelegateSceneCreate;
}

- (void)setHasSentFBSWorkspaceDelegateSceneCreate:(BOOL)a3
{
  self->hasSentFBSWorkspaceDelegateSceneCreate = a3;
}

- (FBSSceneTransitionContext)pendingTransitionContext
{
  return self->pendingTransitionContext;
}

- (void)setPendingTransitionContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->FBSScene, 0);
}

@end