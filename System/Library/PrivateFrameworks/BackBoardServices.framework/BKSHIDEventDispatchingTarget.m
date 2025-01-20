@interface BKSHIDEventDispatchingTarget
+ (BOOL)supportsSecureCoding;
+ (id)focusTargetForPID:(int)a3;
+ (id)keyboardFocusTarget;
+ (id)keyboardFocusTargetWithDeferringToken:(id)a3;
+ (id)systemTarget;
+ (id)systemTargetWithDeferringToken:(id)a3;
+ (id)targetForDeferringEnvironment:(id)a3;
+ (id)targetForDeferringEnvironment:(id)a3 deferringToken:(id)a4;
+ (id)targetForPID:(int)a3 environment:(id)a4;
- (BKSHIDEventDeferringEnvironment)deferringEnvironment;
- (BKSHIDEventDeferringToken)deferringToken;
- (BKSHIDEventDispatchingTarget)init;
- (BKSHIDEventDispatchingTarget)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)_initWithEnvironment:(id)a3 token:(id)a4 pid:(int)a5;
- (int)pid;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSHIDEventDispatchingTarget

- (unint64_t)hash
{
  unint64_t v3 = [(BKSHIDEventDeferringEnvironment *)self->_environment hash] ^ (105491 * self->_pid);
  deferringToken = self->_deferringToken;
  if (deferringToken) {
    v3 ^= [(BKSHIDEventDeferringToken *)deferringToken hash];
  }
  return v3;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__BKSHIDEventDispatchingTarget_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E5441BB0;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [v5 appendProem:0 block:v6];
}

id __61__BKSHIDEventDispatchingTarget_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  unint64_t v3 = [*(id *)(a1 + 40) deferringEnvironment];
  id v4 = (id)[v2 appendObject:v3 withName:0 skipIfNil:1];

  id v5 = *(void **)(a1 + 32);
  v6 = [*(id *)(a1 + 40) deferringToken];
  id v7 = (id)[v5 appendObject:v6 withName:@"token" skipIfNil:1];

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", (int)objc_msgSend(*(id *)(a1 + 40), "pid"), @"pid");
}

- (int)pid
{
  return self->_pid;
}

- (BKSHIDEventDeferringEnvironment)deferringEnvironment
{
  return self->_environment;
}

- (BKSHIDEventDeferringToken)deferringToken
{
  return self->_deferringToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferringToken, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BKSHIDEventDispatchingTarget *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class() && self->_pid == v4->_pid && BSEqualObjects()) {
      char v6 = BSEqualObjects();
    }
    else {
      char v6 = 0;
    }
  }

  return v6;
}

- (BKSHIDEventDispatchingTarget)initWithCoder:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
    char v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F281F8];
    uint64_t v19 = *MEMORY[0x1E4F28588];
    v8 = [NSString stringWithFormat:@"Failed to decode BKSHIDEventDispatchingTarget: subclasses are not allowed : %@", objc_opt_class()];
    v20 = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v10 = [v6 errorWithDomain:v7 code:4866 userInfo:v9];
    [v4 failWithError:v10];
LABEL_9:

    v18 = 0;
    goto LABEL_10;
  }
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"environment"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deferringToken"];
  uint64_t v11 = [v4 decodeInt32ForKey:@"pid"];
  if (v8) {
    BOOL v12 = (int)v11 < 1;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F281F8];
    uint64_t v21 = *MEMORY[0x1E4F28588];
    v10 = [NSString stringWithFormat:@"Failed to decode BKSHIDEventDispatchingTarget: invalid pid or environment : pid=%i environment=%@", v11, v8];
    v22[0] = v10;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    v16 = [v13 errorWithDomain:v14 code:4866 userInfo:v15];
    [v4 failWithError:v16];

    goto LABEL_9;
  }
  v18 = [[BKSHIDEventDispatchingTarget alloc] _initWithEnvironment:v8 token:v9 pid:v11];
LABEL_10:

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  environment = self->_environment;
  id v5 = a3;
  [v5 encodeObject:environment forKey:@"environment"];
  [v5 encodeObject:self->_deferringToken forKey:@"deferringToken"];
  [v5 encodeInt32:self->_pid forKey:@"pid"];
}

- (id)_initWithEnvironment:(id)a3 token:(id)a4 pid:(int)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = objc_opt_class();
  if (v11 != objc_opt_class())
  {
    v16 = [NSString stringWithFormat:@"BKSHIDEventDispatchingTarget is not subclassable"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v17 = NSStringFromSelector(a2);
      v18 = (objc_class *)objc_opt_class();
      uint64_t v19 = NSStringFromClass(v18);
      *(_DWORD *)buf = 138544642;
      v22 = v17;
      __int16 v23 = 2114;
      v24 = v19;
      __int16 v25 = 2048;
      v26 = self;
      __int16 v27 = 2114;
      v28 = @"BKSHIDEventDispatchingTarget.m";
      __int16 v29 = 1024;
      int v30 = 31;
      __int16 v31 = 2114;
      v32 = v16;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA3616CLL);
  }
  v20.receiver = self;
  v20.super_class = (Class)BKSHIDEventDispatchingTarget;
  BOOL v12 = [(BKSHIDEventDispatchingTarget *)&v20 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    environment = v12->_environment;
    v12->_environment = (BKSHIDEventDeferringEnvironment *)v13;

    v12->_pid = a5;
    objc_storeStrong((id *)&v12->_deferringToken, a4);
  }

  return v12;
}

- (BKSHIDEventDispatchingTarget)init
{
  id v4 = [NSString stringWithFormat:@"-init is not allowed on BKSHIDEventDispatchingTarget"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    char v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    BOOL v12 = v7;
    __int16 v13 = 2048;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    v16 = @"BKSHIDEventDispatchingTarget.m";
    __int16 v17 = 1024;
    int v18 = 26;
    __int16 v19 = 2114;
    objc_super v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKSHIDEventDispatchingTarget *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)focusTargetForPID:(int)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a3 <= 0)
  {
    id v10 = [NSString stringWithFormat:@"invalid pid"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v11 = NSStringFromSelector(a2);
      BOOL v12 = (objc_class *)objc_opt_class();
      __int16 v13 = NSStringFromClass(v12);
      int v14 = 138544642;
      __int16 v15 = v11;
      __int16 v16 = 2114;
      __int16 v17 = v13;
      __int16 v18 = 2048;
      id v19 = a1;
      __int16 v20 = 2114;
      uint64_t v21 = @"BKSHIDEventDispatchingTarget.m";
      __int16 v22 = 1024;
      int v23 = 96;
      __int16 v24 = 2114;
      __int16 v25 = v10;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v14, 0x3Au);
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA3644CLL);
  }
  uint64_t v3 = *(void *)&a3;
  if (getpid() == a3)
  {
    id v4 = +[BKSHIDEventDispatchingTarget keyboardFocusTarget];
  }
  else
  {
    id v5 = [BKSHIDEventDispatchingTarget alloc];
    char v6 = +[BKSHIDEventDeferringEnvironment keyboardFocusEnvironment];
    id v4 = [(BKSHIDEventDispatchingTarget *)v5 _initWithEnvironment:v6 token:0 pid:v3];
  }
  return v4;
}

+ (id)targetForPID:(int)a3 environment:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if ((int)v4 <= 0)
  {
    __int16 v16 = [NSString stringWithFormat:@"invalid pid"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = NSStringFromSelector(a2);
      __int16 v18 = (objc_class *)objc_opt_class();
      id v19 = NSStringFromClass(v18);
      int v20 = 138544642;
      uint64_t v21 = v17;
      __int16 v22 = 2114;
      int v23 = v19;
      __int16 v24 = 2048;
      id v25 = a1;
      __int16 v26 = 2114;
      __int16 v27 = @"BKSHIDEventDispatchingTarget.m";
      __int16 v28 = 1024;
      int v29 = 82;
      __int16 v30 = 2114;
      __int16 v31 = v16;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v20, 0x3Au);
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA36674);
  }
  v8 = v7;
  if (getpid() != v4) {
    goto LABEL_7;
  }
  int v9 = +[BKSHIDEventDeferringEnvironment keyboardFocusEnvironment];
  int v10 = [v8 isEqual:v9];

  if (v10)
  {
    id v11 = +[BKSHIDEventDispatchingTarget keyboardFocusTarget];
    goto LABEL_8;
  }
  BOOL v12 = +[BKSHIDEventDeferringEnvironment systemEnvironment];
  int v13 = [v8 isEqual:v12];

  if (v13)
  {
    id v11 = +[BKSHIDEventDispatchingTarget systemTarget];
  }
  else
  {
LABEL_7:
    id v11 = [[BKSHIDEventDispatchingTarget alloc] _initWithEnvironment:v8 token:0 pid:v4];
  }
LABEL_8:
  int v14 = v11;

  return v14;
}

+ (id)targetForDeferringEnvironment:(id)a3 deferringToken:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[BKSHIDEventDispatchingTarget alloc] _initWithEnvironment:v6 token:v5 pid:getpid()];

  return v7;
}

+ (id)targetForDeferringEnvironment:(id)a3
{
  id v3 = a3;
  id v4 = [[BKSHIDEventDispatchingTarget alloc] _initWithEnvironment:v3 token:0 pid:getpid()];

  return v4;
}

+ (id)keyboardFocusTargetWithDeferringToken:(id)a3
{
  id v3 = a3;
  id v4 = [BKSHIDEventDispatchingTarget alloc];
  id v5 = +[BKSHIDEventDeferringEnvironment keyboardFocusEnvironment];
  id v6 = [(BKSHIDEventDispatchingTarget *)v4 _initWithEnvironment:v5 token:v3 pid:getpid()];

  return v6;
}

+ (id)systemTargetWithDeferringToken:(id)a3
{
  id v3 = a3;
  id v4 = [BKSHIDEventDispatchingTarget alloc];
  id v5 = +[BKSHIDEventDeferringEnvironment systemEnvironment];
  id v6 = [(BKSHIDEventDispatchingTarget *)v4 _initWithEnvironment:v5 token:v3 pid:getpid()];

  return v6;
}

+ (id)keyboardFocusTarget
{
  if (keyboardFocusTarget_onceToken != -1) {
    dispatch_once(&keyboardFocusTarget_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)keyboardFocusTarget___focusTarget;
  return v2;
}

void __51__BKSHIDEventDispatchingTarget_keyboardFocusTarget__block_invoke()
{
  v0 = [BKSHIDEventDispatchingTarget alloc];
  id v3 = +[BKSHIDEventDeferringEnvironment keyboardFocusEnvironment];
  uint64_t v1 = [(BKSHIDEventDispatchingTarget *)v0 _initWithEnvironment:v3 token:0 pid:getpid()];
  v2 = (void *)keyboardFocusTarget___focusTarget;
  keyboardFocusTarget___focusTarget = v1;
}

+ (id)systemTarget
{
  if (systemTarget_onceToken != -1) {
    dispatch_once(&systemTarget_onceToken, &__block_literal_global_2096);
  }
  v2 = (void *)systemTarget___systemTarget;
  return v2;
}

void __44__BKSHIDEventDispatchingTarget_systemTarget__block_invoke()
{
  v0 = [BKSHIDEventDispatchingTarget alloc];
  id v3 = +[BKSHIDEventDeferringEnvironment systemEnvironment];
  uint64_t v1 = [(BKSHIDEventDispatchingTarget *)v0 _initWithEnvironment:v3 token:0 pid:getpid()];
  v2 = (void *)systemTarget___systemTarget;
  systemTarget___systemTarget = v1;
}

@end