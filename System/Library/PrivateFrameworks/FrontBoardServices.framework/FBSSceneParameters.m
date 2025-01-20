@interface FBSSceneParameters
+ (id)parametersForSpecification:(id)a3;
- (BOOL)isEqual:(id)a3;
- (FBSSceneClientSettings)clientSettings;
- (FBSSceneParameters)init;
- (FBSSceneParameters)initWithParameters:(id)a3;
- (FBSSceneParameters)initWithSpecification:(id)a3;
- (FBSSceneParameters)initWithXPCDictionary:(id)a3;
- (FBSSceneSettings)settings;
- (FBSSceneSpecification)specification;
- (NSString)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setClientSettings:(id)a3;
- (void)setSettings:(id)a3;
- (void)updateSettingsWithBlock:(id)a3;
@end

@implementation FBSSceneParameters

- (FBSSceneParameters)initWithXPCDictionary:(id)a3
{
  id v3 = a3;
  BSDeserializeStringFromXPCDictionaryWithKey();
}

- (void)setClientSettings:(id)a3
{
  v4 = (FBSSceneClientSettings *)a3;
  if (self->_clientSettings != v4)
  {
    v7 = v4;
    if (v4) {
      v5 = (FBSSceneClientSettings *)[(FBSSceneClientSettings *)v4 copy];
    }
    else {
      v5 = (FBSSceneClientSettings *)objc_alloc_init([(FBSSceneSpecification *)self->_specification clientSettingsClass]);
    }
    clientSettings = self->_clientSettings;
    self->_clientSettings = v5;

    v4 = v7;
  }
}

+ (id)parametersForSpecification:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithSpecification:v4];

  return v5;
}

- (FBSSceneSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  id v4 = (FBSSceneSettings *)a3;
  if (self->_settings != v4)
  {
    v7 = v4;
    if (v4) {
      v5 = (FBSSceneSettings *)[(FBSSceneSettings *)v4 copy];
    }
    else {
      v5 = (FBSSceneSettings *)objc_alloc_init([(FBSSceneSpecification *)self->_specification settingsClass]);
    }
    settings = self->_settings;
    self->_settings = v5;

    id v4 = v7;
  }
}

- (FBSSceneParameters)initWithParameters:(id)a3
{
  id v4 = a3;
  v5 = [v4 specification];
  id v6 = v5;
  NSClassFromString(&cfstr_Fbsscenespecif.isa);
  if (!v6)
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSceneParameters initWithParameters:]();
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneSpecificationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSceneParameters initWithParameters:]();
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
  }

  v18.receiver = self;
  v18.super_class = (Class)FBSSceneParameters;
  v7 = [(FBSSceneParameters *)&v18 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_specification, v5);
    v9 = [v4 settings];
    uint64_t v10 = [v9 copy];
    settings = v8->_settings;
    v8->_settings = (FBSSceneSettings *)v10;

    v12 = [v4 clientSettings];
    uint64_t v13 = [v12 copy];
    clientSettings = v8->_clientSettings;
    v8->_clientSettings = (FBSSceneClientSettings *)v13;
  }
  return v8;
}

- (FBSSceneParameters)initWithSpecification:(id)a3
{
  id v5 = a3;
  NSClassFromString(&cfstr_Fbsscenespecif.isa);
  if (!v5)
  {
    uint64_t v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSceneParameters initWithSpecification:]();
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneSpecificationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSceneParameters initWithSpecification:]();
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
  }

  v15.receiver = self;
  v15.super_class = (Class)FBSSceneParameters;
  id v6 = [(FBSSceneParameters *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_specification, a3);
    v8 = (FBSSceneSettings *)objc_alloc_init((Class)[v5 settingsClass]);
    settings = v7->_settings;
    v7->_settings = v8;

    uint64_t v10 = (FBSSceneClientSettings *)objc_alloc_init((Class)[v5 clientSettingsClass]);
    clientSettings = v7->_clientSettings;
    v7->_clientSettings = v10;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specification, 0);
  objc_storeStrong((id *)&self->_clientSettings, 0);

  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v3 = a3;
  id v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  BSSerializeStringToXPCDictionaryWithKey();
}

- (FBSSceneSpecification)specification
{
  return self->_specification;
}

- (FBSSceneClientSettings)clientSettings
{
  return self->_clientSettings;
}

- (FBSSceneParameters)init
{
  id v3 = +[FBSSceneSpecification specification];
  id v4 = [(FBSSceneParameters *)self initWithSpecification:v3];

  return v4;
}

- (void)updateSettingsWithBlock:(id)a3
{
  if (a3)
  {
    id v4 = (void (**)(id, id))a3;
    id v5 = [(FBSSceneParameters *)self settings];
    id v6 = (id)[v5 mutableCopy];

    v4[2](v4, v6);
    [(FBSSceneParameters *)self setSettings:v6];
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[FBSMutableSceneParameters allocWithZone:a3];

  return [(FBSSceneParameters *)v4 initWithParameters:self];
}

- (NSString)description
{
  return (NSString *)[(FBSSceneParameters *)self descriptionWithMultilinePrefix:0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FBSSceneParameters *)a3;
  if (self == v4)
  {
    char v14 = 1;
  }
  else
  {
    id v5 = [off_1E58F4500 builderWithObject:v4 ofExpectedClass:objc_opt_class()];
    id v6 = [(FBSSceneParameters *)self specification];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __30__FBSSceneParameters_isEqual___block_invoke;
    v20[3] = &unk_1E58F5760;
    v7 = v4;
    v21 = v7;
    id v8 = (id)[v5 appendObject:v6 counterpart:v20];

    v9 = [(FBSSceneParameters *)self settings];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __30__FBSSceneParameters_isEqual___block_invoke_2;
    v18[3] = &unk_1E58F5760;
    uint64_t v10 = v7;
    v19 = v10;
    id v11 = (id)[v5 appendObject:v9 counterpart:v18];

    v12 = [(FBSSceneParameters *)self clientSettings];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __30__FBSSceneParameters_isEqual___block_invoke_3;
    v16[3] = &unk_1E58F5760;
    v17 = v10;
    id v13 = (id)[v5 appendObject:v12 counterpart:v16];

    char v14 = [v5 isEqual];
  }

  return v14;
}

uint64_t __30__FBSSceneParameters_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) specification];
}

uint64_t __30__FBSSceneParameters_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) settings];
}

uint64_t __30__FBSSceneParameters_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) clientSettings];
}

- (unint64_t)hash
{
  id v3 = [off_1E58F4508 builder];
  id v4 = [(FBSSceneParameters *)self specification];
  id v5 = (id)[v3 appendObject:v4];

  unint64_t v6 = [v3 hash];
  return v6;
}

- (id)succinctDescription
{
  v2 = [(FBSSceneParameters *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[off_1E58F44F0 builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(FBSSceneParameters *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSceneParameters *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__FBSSceneParameters_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E58F4AB0;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __60__FBSSceneParameters_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"settings" skipIfNil:1];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"clientSettings" skipIfNil:1];
}

- (void)initWithSpecification:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithParameters:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithXPCDictionary:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithXPCDictionary:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithXPCDictionary:.cold.3()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithXPCDictionary:.cold.4()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end