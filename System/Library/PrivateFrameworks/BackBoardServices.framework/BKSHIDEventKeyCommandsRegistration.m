@interface BKSHIDEventKeyCommandsRegistration
+ (BOOL)supportsSecureCoding;
- (BKSHIDEventDeferringEnvironment)deferringEnvironment;
- (BKSHIDEventDeferringToken)deferringToken;
- (BKSHIDEventKeyCommandsRegistration)init;
- (BKSHIDEventKeyCommandsRegistration)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSSet)keyCommands;
- (NSString)debugDescription;
- (id)_initWithEnvironment:(id)a3 token:(id)a4 keyCommands:(id)a5;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSHIDEventKeyCommandsRegistration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyCommands, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

- (NSSet)keyCommands
{
  return self->_keyCommands;
}

- (BKSHIDEventDeferringToken)deferringToken
{
  return self->_token;
}

- (BKSHIDEventDeferringEnvironment)deferringEnvironment
{
  return self->_environment;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = [(BKSHIDEventKeyCommandsRegistration *)self succinctDescriptionBuilder];
  v6 = [(NSSet *)self->_keyCommands allObjects];
  [v5 appendArraySection:v6 withName:@"keyCommands" multilinePrefix:v4 skipIfEmpty:0];

  return v5;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(BKSHIDEventKeyCommandsRegistration *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_environment withName:@"environment"];
  id v5 = (id)[v3 appendObject:self->_token withName:@"token" skipIfNil:1];
  return v3;
}

- (id)succinctDescription
{
  v2 = [(BKSHIDEventKeyCommandsRegistration *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (NSString)debugDescription
{
  return (NSString *)[(BKSHIDEventKeyCommandsRegistration *)self descriptionWithMultilinePrefix:0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BKSHIDEventKeyCommandsRegistration *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if ((v5 == objc_opt_class() || (uint64_t v6 = objc_opt_class(), v6 == objc_opt_class()))
      && BSEqualObjects()
      && BSEqualObjects())
    {
      char v7 = BSEqualObjects();
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  unint64_t v3 = [(BKSHIDEventDeferringEnvironment *)self->_environment hash];
  uint64_t v4 = [(BKSHIDEventDeferringToken *)self->_token hash];
  return v3 ^ v4 ^ [(NSSet *)self->_keyCommands hash] ^ 0x1E5B1;
}

- (BKSHIDEventKeyCommandsRegistration)initWithCoder:(id)a3
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class() || (uint64_t v6 = objc_opt_class(), v6 == objc_opt_class()))
  {
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"environment"];
    if (v12)
    {
      v9 = (void *)v12;
      v13 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v14 = objc_opt_class();
      v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
      v10 = [v4 decodeObjectOfClasses:v15 forKey:@"keyCommands"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (!objc_msgSend(v10, "bs_containsObjectPassingTest:", &__block_literal_global_6015))
        {
          v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"token"];
          self = (BKSHIDEventKeyCommandsRegistration *)[(BKSHIDEventKeyCommandsRegistration *)self _initWithEnvironment:v9 token:v30 keyCommands:v10];

          v28 = self;
          goto LABEL_12;
        }
        v16 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v17 = *MEMORY[0x1E4F281F8];
        uint64_t v37 = *MEMORY[0x1E4F28588];
        v18 = [NSString stringWithFormat:@"Failed to decode BKSHIDEventKeyCommandsRegistration: keyCommands contains non-BKSHIDEventKeyCommand elements : %@", v10];
        v38[0] = v18;
        v19 = (void *)MEMORY[0x1E4F1C9E8];
        v20 = (void **)v38;
        v21 = &v37;
      }
      else
      {
        v16 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v17 = *MEMORY[0x1E4F281F8];
        uint64_t v35 = *MEMORY[0x1E4F28588];
        v18 = [NSString stringWithFormat:@"Failed to decode BKSHIDEventKeyCommandsRegistration: keyCommands not of class NSSet : %@", v10];
        v36 = v18;
        v19 = (void *)MEMORY[0x1E4F1C9E8];
        v20 = &v36;
        v21 = &v35;
      }
      v26 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:1];
      v27 = [v16 errorWithDomain:v17 code:4866 userInfo:v26];
      [v4 failWithError:v27];
    }
    else
    {
      v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F281F8];
      uint64_t v33 = *MEMORY[0x1E4F28588];
      v10 = [NSString stringWithFormat:@"Failed to decode BKSHIDEventKeyCommandsRegistration: invalid environment : environment=%@", 0];
      v34 = v10;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      v25 = [v22 errorWithDomain:v23 code:4866 userInfo:v24];
      [v4 failWithError:v25];

      v9 = 0;
    }
  }
  else
  {
    char v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F281F8];
    uint64_t v31 = *MEMORY[0x1E4F28588];
    v9 = [NSString stringWithFormat:@"Failed to decode BKSHIDEventKeyCommandsRegistration: subclasses are not allowed : %@", objc_opt_class()];
    v32 = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    v11 = [v7 errorWithDomain:v8 code:4866 userInfo:v10];
    [v4 failWithError:v11];
  }
  v28 = 0;
LABEL_12:

  return v28;
}

BOOL __52__BKSHIDEventKeyCommandsRegistration_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (void)encodeWithCoder:(id)a3
{
  environment = self->_environment;
  id v5 = a3;
  [v5 encodeObject:environment forKey:@"environment"];
  [v5 encodeObject:self->_token forKey:@"token"];
  [v5 encodeObject:self->_keyCommands forKey:@"keyCommands"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[BKSMutableHIDEventKeyCommandsRegistration allocWithZone:a3];
  environment = self->_environment;
  token = self->_token;
  keyCommands = self->_keyCommands;
  return [(BKSHIDEventKeyCommandsRegistration *)v4 _initWithEnvironment:environment token:token keyCommands:keyCommands];
}

- (id)_initWithEnvironment:(id)a3 token:(id)a4 keyCommands:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = objc_opt_class();
  if (v12 != objc_opt_class())
  {
    uint64_t v13 = objc_opt_class();
    if (v13 != objc_opt_class())
    {
      v22 = [NSString stringWithFormat:@"BKSHIDEventKeyCommandsRegistration cannot be subclassed"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = NSStringFromSelector(a2);
        v24 = (objc_class *)objc_opt_class();
        v25 = NSStringFromClass(v24);
        *(_DWORD *)buf = 138544642;
        v28 = v23;
        __int16 v29 = 2114;
        v30 = v25;
        __int16 v31 = 2048;
        v32 = self;
        __int16 v33 = 2114;
        v34 = @"BKSHIDEventKeyCommandsRegistration.m";
        __int16 v35 = 1024;
        int v36 = 35;
        __int16 v37 = 2114;
        v38 = v22;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v22 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA4DA94);
    }
  }
  v26.receiver = self;
  v26.super_class = (Class)BKSHIDEventKeyCommandsRegistration;
  uint64_t v14 = [(BKSHIDEventKeyCommandsRegistration *)&v26 init];
  if (v14)
  {
    uint64_t v15 = [v9 copy];
    environment = v14->_environment;
    v14->_environment = (BKSHIDEventDeferringEnvironment *)v15;

    uint64_t v17 = [v10 copy];
    token = v14->_token;
    v14->_token = (BKSHIDEventDeferringToken *)v17;

    uint64_t v19 = [v11 copy];
    keyCommands = v14->_keyCommands;
    v14->_keyCommands = (NSSet *)v19;
  }
  return v14;
}

- (BKSHIDEventKeyCommandsRegistration)init
{
  id v4 = [NSString stringWithFormat:@"-init is not allowed on BKSHIDEventKeyCommandsRegistration"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    uint64_t v6 = (objc_class *)objc_opt_class();
    char v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2048;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    v16 = @"BKSHIDEventKeyCommandsRegistration.m";
    __int16 v17 = 1024;
    int v18 = 30;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKSHIDEventKeyCommandsRegistration *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

@end