@interface FBSSceneSpecification
+ (id)specification;
- (BOOL)_isSignificantTransitionContext:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (Class)clientAgentClass;
- (Class)clientSettingsClass;
- (Class)hostAgentClass;
- (Class)settingsClass;
- (Class)transitionContextClass;
- (FBSSceneSpecification)init;
- (NSArray)defaultExtensions;
- (NSString)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
@end

@implementation FBSSceneSpecification

- (BOOL)_isSignificantTransitionContext:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    BOOL v6 = 1;
    if ([v4 _isEmptyForCoding:1])
    {
      v7 = (objc_class *)objc_opt_class();
      BOOL v6 = v7 != [(FBSSceneSpecification *)self transitionContextClass];
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (id)specification
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (FBSSceneSpecification)init
{
  v6.receiver = self;
  v6.super_class = (Class)FBSSceneSpecification;
  id v2 = [(FBSSceneSpecification *)&v6 init];
  v3 = v2;
  if (v2) {
    id v4 = FBSGetDefaultExtensions(v2);
  }
  return v3;
}

- (BOOL)isValid
{
  v3 = [(FBSSceneSpecification *)self settingsClass];
  if (v3)
  {
    v3 = [(FBSSceneSpecification *)self clientSettingsClass];
    if (v3) {
      LOBYTE(v3) = [(FBSSceneSpecification *)self transitionContextClass] != 0;
    }
  }
  return (char)v3;
}

- (NSArray)defaultExtensions
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (Class)hostAgentClass
{
  return 0;
}

- (Class)clientAgentClass
{
  return 0;
}

- (Class)settingsClass
{
  return (Class)objc_opt_class();
}

- (Class)clientSettingsClass
{
  return (Class)objc_opt_class();
}

- (Class)transitionContextClass
{
  return (Class)objc_opt_class();
}

- (NSString)description
{
  return (NSString *)[(FBSSceneSpecification *)self descriptionWithMultilinePrefix:0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FBSSceneSpecification *)a3;
  if (self == v4)
  {
    char v23 = 1;
  }
  else
  {
    v5 = [off_1E58F4500 builderWithObject:v4 ofExpectedClass:objc_opt_class()];
    objc_super v6 = [(FBSSceneSpecification *)self hostAgentClass];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __33__FBSSceneSpecification_isEqual___block_invoke;
    v38[3] = &unk_1E58F69E0;
    v7 = v4;
    v39 = v7;
    id v8 = (id)[v5 appendClass:v6 counterpart:v38];
    v9 = [(FBSSceneSpecification *)self clientAgentClass];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __33__FBSSceneSpecification_isEqual___block_invoke_2;
    v36[3] = &unk_1E58F69E0;
    v10 = v7;
    v37 = v10;
    id v11 = (id)[v5 appendClass:v9 counterpart:v36];
    v12 = [(FBSSceneSpecification *)self settingsClass];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __33__FBSSceneSpecification_isEqual___block_invoke_3;
    v34[3] = &unk_1E58F69E0;
    v13 = v10;
    v35 = v13;
    id v14 = (id)[v5 appendClass:v12 counterpart:v34];
    v15 = [(FBSSceneSpecification *)self clientSettingsClass];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __33__FBSSceneSpecification_isEqual___block_invoke_4;
    v32[3] = &unk_1E58F69E0;
    v16 = v13;
    v33 = v16;
    id v17 = (id)[v5 appendClass:v15 counterpart:v32];
    v18 = [(FBSSceneSpecification *)self transitionContextClass];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __33__FBSSceneSpecification_isEqual___block_invoke_5;
    v30[3] = &unk_1E58F69E0;
    v19 = v16;
    v31 = v19;
    id v20 = (id)[v5 appendClass:v18 counterpart:v30];
    v21 = [(FBSSceneSpecification *)self defaultExtensions];
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    v27 = __33__FBSSceneSpecification_isEqual___block_invoke_6;
    v28 = &unk_1E58F5E10;
    v29 = v19;
    id v22 = (id)[v5 appendObject:v21 counterpart:&v25];

    char v23 = [v5 isEqual:v25 v26:v27 v28:v28];
  }

  return v23;
}

uint64_t __33__FBSSceneSpecification_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) hostAgentClass];
}

uint64_t __33__FBSSceneSpecification_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) clientAgentClass];
}

uint64_t __33__FBSSceneSpecification_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) settingsClass];
}

uint64_t __33__FBSSceneSpecification_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) clientSettingsClass];
}

uint64_t __33__FBSSceneSpecification_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) transitionContextClass];
}

uint64_t __33__FBSSceneSpecification_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) defaultExtensions];
}

- (unint64_t)hash
{
  v3 = [off_1E58F4508 builder];
  id v4 = [v3 appendClass:-[FBSSceneSpecification settingsClass](self, "settingsClass")];
  unint64_t v5 = [v3 hash];

  return v5;
}

- (id)succinctDescription
{
  id v2 = [(FBSSceneSpecification *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[off_1E58F44F0 builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(FBSSceneSpecification *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(FBSSceneSpecification *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__FBSSceneSpecification_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E58F4AB0;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __63__FBSSceneSpecification_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) appendClass:[*(id *)(a1 + 40) hostAgentClass] withName:@"hostAgentClass"];
  id v3 = [*(id *)(a1 + 32) appendClass:[*(id *)(a1 + 40) clientAgentClass] withName:@"clientAgentClass"];
  id v4 = [(id)[*(id *)(a1 + 32) appendClass:[*(id *)(a1 + 40) settingsClass] withName:@"settingsClass"]
  id v5 = [(id)[*(id *)(a1 + 32) appendClass:[*(id *)(a1 + 40) clientSettingsClass] withName:@"clientSettingsClass"]
  id v6 = [*(id *)(a1 + 32) appendClass:[*(id *)(a1 + 40) transitionContextClass] withName:@"transitionContextClass"];
  id v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) defaultExtensions];
  [v7 appendArraySection:v8 withName:@"defaultExtensions" skipIfEmpty:1];
}

@end