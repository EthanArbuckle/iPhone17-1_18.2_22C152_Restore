@interface FBProcessWatchdogEventContext
+ (id)contextForEvent:(int64_t)a3 settings:(id)a4 transitionContext:(id)a5;
- (FBSSceneSettings)sceneSettings;
- (FBSSceneTransitionContext)sceneTransitionContext;
- (FBSceneUpdateContext)sceneUpdateContext;
- (NSString)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)event;
@end

@implementation FBProcessWatchdogEventContext

+ (id)contextForEvent:(int64_t)a3 settings:(id)a4 transitionContext:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init((Class)a1);
  v11 = (void *)*((void *)v10 + 2);
  *((void *)v10 + 1) = a3;
  *((void *)v10 + 2) = v8;
  id v12 = v8;

  objc_storeWeak((id *)v10 + 3, v9);
  uint64_t v13 = [v9 updateContext];

  v14 = (void *)*((void *)v10 + 4);
  *((void *)v10 + 4) = v13;

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneSettings, 0);
}

- (FBSSceneTransitionContext)sceneTransitionContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneTransitionContext);

  return (FBSSceneTransitionContext *)WeakRetained;
}

- (int64_t)event
{
  return self->_event;
}

- (NSString)description
{
  return (NSString *)[(FBProcessWatchdogEventContext *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(FBProcessWatchdogEventContext *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F62810] builderWithObject:self];
  v4 = NSStringFromProcessWatchdogEvent(self->_event);
  id v5 = (id)[v3 appendObject:v4 withName:@"event"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(FBProcessWatchdogEventContext *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(FBProcessWatchdogEventContext *)self succinctDescriptionBuilder];
  v6 = v5;
  if (self->_sceneUpdateContext)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __71__FBProcessWatchdogEventContext_descriptionBuilderWithMultilinePrefix___block_invoke;
    v8[3] = &unk_1E5C497A0;
    id v9 = v5;
    id v10 = self;
    [v9 appendBodySectionWithName:0 multilinePrefix:v4 block:v8];
  }

  return v6;
}

id __71__FBProcessWatchdogEventContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"updateContext"];
}

- (FBSSceneSettings)sceneSettings
{
  return self->_sceneSettings;
}

- (FBSceneUpdateContext)sceneUpdateContext
{
  return self->_sceneUpdateContext;
}

@end