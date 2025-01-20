@interface _UIKeyboardArbiterSceneFocusChange
+ (id)focusNothingChange;
+ (id)new;
- (BOOL)_isFocusNothing;
- (BOOL)isEqual:(id)a3;
- (FBSSceneIdentityToken)sceneIdentity;
- (NSString)description;
- (_UIKeyboardArbiterSceneFocusChange)init;
- (_UIKeyboardArbiterSceneFocusChange)initWithSceneIdentity:(id)a3 pid:(int)a4;
- (id)_init;
- (int)pid;
- (unint64_t)hash;
- (void)appendDescriptionToStream:(id)a3;
@end

@implementation _UIKeyboardArbiterSceneFocusChange

- (int)pid
{
  return self->_pid;
}

- (void).cxx_destruct
{
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x263F3F660] descriptionForRootObject:self];
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64___UIKeyboardArbiterSceneFocusChange_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_2647211A0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [v5 appendProem:0 block:v6];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  v8 = v7;

  if (v8 == self)
  {
    char v9 = 1;
  }
  else if (v8->_pid == self->_pid)
  {
    char v9 = [(FBSSceneIdentityToken *)v8->_sceneIdentity isEqual:self->_sceneIdentity];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (FBSSceneIdentityToken)sceneIdentity
{
  return self->_sceneIdentity;
}

- (BOOL)_isFocusNothing
{
  return self->_isFocusNothing;
}

+ (id)focusNothingChange
{
  if (_MergedGlobals_1 != -1) {
    dispatch_once(&_MergedGlobals_1, &__block_literal_global);
  }
  v2 = (void *)qword_26AC12AB0;
  return v2;
}

- (_UIKeyboardArbiterSceneFocusChange)initWithSceneIdentity:(id)a3 pid:(int)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIKeyboardArbiterSceneFocusChange;
  v8 = [(_UIKeyboardArbiterSceneFocusChange *)&v11 init];
  char v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sceneIdentity, a3);
    v9->_pid = a4;
  }

  return v9;
}

- (_UIKeyboardArbiterSceneFocusChange)init
{
  id v4 = [NSString stringWithFormat:@"cannot -init _UIKeyboardArbiterSceneFocusChange"];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    v16 = @"_UIKeyboardArbiterSceneFocusChangeRequest.m";
    __int16 v17 = 1024;
    int v18 = 89;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_225660000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (_UIKeyboardArbiterSceneFocusChange *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)new
{
  id v4 = [NSString stringWithFormat:@"cannot +new _UIKeyboardArbiterSceneFocusChange"];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    id v14 = a1;
    __int16 v15 = 2114;
    v16 = @"_UIKeyboardArbiterSceneFocusChangeRequest.m";
    __int16 v17 = 1024;
    int v18 = 93;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_225660000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  id result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIKeyboardArbiterSceneFocusChange;
  return [(_UIKeyboardArbiterSceneFocusChange *)&v3 init];
}

- (unint64_t)hash
{
  return [(FBSSceneIdentityToken *)self->_sceneIdentity hash];
}

@end