@interface FBSSceneMessage
+ (id)message;
- (BSMutableKeyedSettings)payload;
- (Class)fallbackXPCEncodableClass;
- (FBSSceneMessage)init;
- (FBSSceneMessage)initWithXPCDictionary:(id)a3;
- (NSString)description;
- (id)_initWithPayload:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation FBSSceneMessage

- (void).cxx_destruct
{
}

- (FBSSceneMessage)init
{
  return (FBSSceneMessage *)[(FBSSceneMessage *)self _initWithPayload:0];
}

- (id)_initWithPayload:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    NSClassFromString(&cfstr_Bskeyedsetting.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSKeyedSettingsClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        [(FBSSceneMessage *)a2 _initWithPayload:(uint64_t)v10];
      }
      [v10 UTF8String];
      _bs_set_crash_log_message();
    }
  }

  v11.receiver = self;
  v11.super_class = (Class)FBSSceneMessage;
  v6 = [(FBSSceneMessage *)&v11 init];
  if (v6)
  {
    if (v5) {
      v7 = (BSMutableKeyedSettings *)[v5 mutableCopy];
    }
    else {
      v7 = (BSMutableKeyedSettings *)objc_alloc_init((Class)off_1E58F4528);
    }
    payload = v6->_payload;
    v6->_payload = v7;
  }
  return v6;
}

+ (id)message
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (NSString)description
{
  return (NSString *)[(FBSSceneMessage *)self descriptionWithMultilinePrefix:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(FBSSceneMessage *)self payload];
  v6 = (void *)[v4 _initWithPayload:v5];

  return v6;
}

- (FBSSceneMessage)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)FBSSceneMessage;
  if ([(FBSSceneMessage *)&v6 init]) {
    BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey();
  }

  return 0;
}

- (void)encodeWithXPCDictionary:(id)a3
{
}

- (Class)fallbackXPCEncodableClass
{
  return (Class)objc_opt_class();
}

- (id)succinctDescription
{
  id v2 = [(FBSSceneMessage *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[off_1E58F44F0 builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(FBSSceneMessage *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSceneMessage *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__FBSSceneMessage_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E58F4AB0;
  id v6 = v5;
  id v10 = v6;
  objc_super v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __57__FBSSceneMessage_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) payload];
  id v2 = (id)[v1 appendObject:v3 withName:@"payload" skipIfNil:0];
}

- (BSMutableKeyedSettings)payload
{
  return self->_payload;
}

- (void)_initWithPayload:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  v9 = v5;
  __int16 v10 = 2114;
  objc_super v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"FBSSceneMessage.m";
  __int16 v16 = 1024;
  int v17 = 26;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end