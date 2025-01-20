@interface FBSceneUpdateContext
+ (id)contextWithSceneID:(id)a3 transactionID:(unint64_t)a4 settings:(id)a5 settingsDiff:(id)a6 transitionContext:(id)a7;
- (BOOL)isClientLifecycleExternallyManaged;
- (FBSSceneSettings)settings;
- (FBSSceneSettingsDiff)settingsDiff;
- (FBSSceneTransitionContext)transitionContext;
- (NSObject)clientContext;
- (NSString)debugDescription;
- (NSString)sceneID;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)transactionID;
- (void)setClientContext:(id)a3;
@end

@implementation FBSceneUpdateContext

- (FBSSceneSettingsDiff)settingsDiff
{
  return self->_settingsDiff;
}

- (unint64_t)transactionID
{
  return self->_transactionID;
}

- (FBSSceneSettings)settings
{
  return self->_settings;
}

- (FBSSceneTransitionContext)transitionContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionContext);

  return (FBSSceneTransitionContext *)WeakRetained;
}

+ (id)contextWithSceneID:(id)a3 transactionID:(unint64_t)a4 settings:(id)a5 settingsDiff:(id)a6 transitionContext:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = objc_alloc_init((Class)a1);
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    v18 = (void *)*((void *)v16 + 2);
    *((void *)v16 + 2) = v17;

    *((void *)v16 + 3) = a4;
    objc_storeStrong((id *)v16 + 4, a5);
    objc_storeStrong((id *)v16 + 5, a6);
    objc_storeWeak((id *)v16 + 6, v15);
    *((unsigned char *)v16 + 8) = [v15 isRunningBoardAssertionDisabled];
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneID, 0);
}

- (BOOL)isClientLifecycleExternallyManaged
{
  return self->_lifecycleExternallyManaged;
}

- (NSString)debugDescription
{
  return (NSString *)[(FBSceneUpdateContext *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(FBSceneUpdateContext *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F62810] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_sceneID withName:@"scene"];
  id v5 = (id)[v3 appendUnsignedInteger:self->_transactionID withName:@"tID"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(FBSceneUpdateContext *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSceneUpdateContext *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__FBSceneUpdateContext_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E5C497A0;
  id v6 = v5;
  id v10 = v6;
  v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __62__FBSceneUpdateContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x1E4F62810] succinctDescriptionForObject:*(void *)(*(void *)(a1 + 40) + 32)];
  id v4 = (id)[v2 appendObject:v3 withName:@"settings" skipIfNil:1];

  id v5 = *(void **)(a1 + 32);
  id v6 = [MEMORY[0x1E4F62810] succinctDescriptionForObject:*(void *)(*(void *)(a1 + 40) + 40)];
  id v7 = (id)[v5 appendObject:v6 withName:@"settingsDiff" skipIfNil:1];

  v8 = (void *)MEMORY[0x1E4F62810];
  v9 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 48));
  v11 = [v8 succinctDescriptionForObject:WeakRetained];
  id v12 = (id)[v9 appendObject:v11 withName:@"transitionContext" skipIfNil:1];

  id v13 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 8) withName:@"lifecycleExternallyManaged" ifEqualTo:1];
  id v14 = *(void **)(a1 + 32);
  if (*(void *)(*(void *)(a1 + 40) + 56))
  {
    objc_msgSend(MEMORY[0x1E4F62810], "descriptionForObject:");
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    id v15 = (id)[v14 appendObject:v17 withName:@"clientContext"];
  }
  else
  {
    id v16 = (id)[*(id *)(a1 + 32) appendObject:0 withName:@"clientContext"];
  }
}

- (NSString)sceneID
{
  return self->_sceneID;
}

- (NSObject)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

@end