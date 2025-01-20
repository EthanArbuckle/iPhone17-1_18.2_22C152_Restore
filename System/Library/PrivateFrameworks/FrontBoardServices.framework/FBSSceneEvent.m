@interface FBSSceneEvent
- (FBSSceneClientSettingsDiff)clientSettingsDiff;
- (FBSSceneEvent)init;
- (FBSSceneSettingsDiff)settingsDiff;
- (FBSSceneTransitionContext)transitionContext;
- (NSSet)actions;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)source;
- (void)setClientSettingsDiff:(id)a3;
- (void)setSettingsDiff:(id)a3;
- (void)setSource:(int64_t)a3;
- (void)setTransitionContext:(id)a3;
@end

@implementation FBSSceneEvent

- (void)setClientSettingsDiff:(id)a3
{
}

- (FBSSceneSettingsDiff)settingsDiff
{
  return self->_settingsDiff;
}

- (void)setTransitionContext:(id)a3
{
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (FBSSceneEvent)init
{
  v3.receiver = self;
  v3.super_class = (Class)FBSSceneEvent;
  return [(FBSSceneMessage *)&v3 init];
}

- (void)setSettingsDiff:(id)a3
{
}

- (FBSSceneTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_clientSettingsDiff, 0);

  objc_storeStrong((id *)&self->_settingsDiff, 0);
}

- (NSSet)actions
{
  return (NSSet *)[(FBSSceneTransitionContext *)self->_transitionContext actions];
}

- (id)description
{
  return [(FBSSceneEvent *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(FBSSceneEvent *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[off_1E58F44F0 builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(FBSSceneEvent *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = [(FBSSceneEvent *)self succinctDescriptionBuilder];
  v6 = v5;
  unint64_t source = self->_source;
  if (source > 2) {
    v8 = 0;
  }
  else {
    v8 = off_1E58F6948[source];
  }
  id v9 = (id)[v5 appendObject:v8 withName:@"source"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__FBSSceneEvent_descriptionBuilderWithMultilinePrefix___block_invoke;
  v13[3] = &unk_1E58F4AB0;
  id v10 = v6;
  id v14 = v10;
  v15 = self;
  [v10 appendBodySectionWithName:0 multilinePrefix:v4 block:v13];

  id v11 = v10;
  return v11;
}

void __55__FBSSceneEvent_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  objc_super v3 = [*(id *)(a1 + 40) settingsDiff];
  id v4 = (id)[v2 appendObject:v3 withName:@"settingsDiff" skipIfNil:1];

  v5 = *(void **)(a1 + 32);
  v6 = [*(id *)(a1 + 40) clientSettingsDiff];
  id v7 = (id)[v5 appendObject:v6 withName:@"clientSettingsDiff" skipIfNil:1];

  v8 = *(void **)(a1 + 32);
  uint64_t v9 = [*(id *)(a1 + 40) transitionContext];
  id v10 = (id)[v8 appendObject:v9 withName:@"transitionContext" skipIfNil:1];

  id v11 = [*(id *)(a1 + 40) payload];
  LOBYTE(v9) = [v11 isEmpty];

  if ((v9 & 1) == 0)
  {
    v12 = *(void **)(a1 + 32);
    id v14 = [*(id *)(a1 + 40) payload];
    id v13 = (id)[v12 appendObject:v14 withName:@"payload"];
  }
}

- (int64_t)source
{
  return self->_source;
}

- (FBSSceneClientSettingsDiff)clientSettingsDiff
{
  return self->_clientSettingsDiff;
}

@end