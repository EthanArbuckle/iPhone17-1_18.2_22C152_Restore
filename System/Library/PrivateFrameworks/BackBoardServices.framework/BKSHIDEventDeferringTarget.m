@interface BKSHIDEventDeferringTarget
+ (BOOL)supportsSecureCoding;
+ (id)protobufSchema;
- (BKSHIDEventDeferringTarget)init;
- (BKSHIDEventDeferringTarget)initWithCoder:(id)a3;
- (BKSHIDEventDeferringToken)token;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)_initWithPID:(int)a3 token:(id)a4;
- (id)initForProtobufDecoding;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int)pid;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSHIDEventDeferringTarget

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

- (BKSHIDEventDeferringTarget)initWithCoder:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
    uint64_t v6 = objc_opt_class();
    if (v6 != objc_opt_class())
    {
      v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = *MEMORY[0x1E4F281F8];
      uint64_t v21 = *MEMORY[0x1E4F28588];
      v9 = [NSString stringWithFormat:@"Failed to decode BKSHIDEventDeferringTarget: subclasses are not allowed : %@", objc_opt_class(), v21];
      v22 = v9;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      v11 = [v7 errorWithDomain:v8 code:4866 userInfo:v10];
      [v4 failWithError:v11];

LABEL_7:
      v14 = 0;
      goto LABEL_8;
    }
  }
  uint64_t v12 = [v4 decodeInt32ForKey:@"pid"];
  if ((int)v12 < 1)
  {
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F281F8];
    uint64_t v23 = *MEMORY[0x1E4F28588];
    v17 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to decode BKSHIDEventDeferringTarget: invalid pid : %i", v12);
    v24[0] = v17;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    v19 = [v15 errorWithDomain:v16 code:4866 userInfo:v18];
    [v4 failWithError:v19];

    goto LABEL_7;
  }
  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"token"];
  self = (BKSHIDEventDeferringTarget *)[(BKSHIDEventDeferringTarget *)self _initWithPID:v12 token:v13];

  v14 = self;
LABEL_8:

  return v14;
}

- (id)_initWithPID:(int)a3 token:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (a3 <= 0)
  {
    uint64_t v16 = [NSString stringWithFormat:@"invalid pid"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v17 = NSStringFromSelector(a2);
      v18 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v18);
      *(_DWORD *)buf = 138544642;
      v35 = v17;
      __int16 v36 = 2114;
      v37 = v19;
      __int16 v38 = 2048;
      v39 = self;
      __int16 v40 = 2114;
      v41 = @"BKSHIDEventDeferringTarget.m";
      __int16 v42 = 1024;
      int v43 = 31;
      __int16 v44 = 2114;
      v45 = v16;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA0E3C4);
  }
  id v8 = v7;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v20 = NSString;
      uint64_t v21 = (objc_class *)[v8 classForCoder];
      if (!v21) {
        uint64_t v21 = (objc_class *)objc_opt_class();
      }
      v22 = NSStringFromClass(v21);
      uint64_t v23 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v23);
      v25 = [v20 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"token", v22, v24];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v26 = NSStringFromSelector(a2);
        v27 = (objc_class *)objc_opt_class();
        v28 = NSStringFromClass(v27);
        *(_DWORD *)buf = 138544642;
        v35 = v26;
        __int16 v36 = 2114;
        v37 = v28;
        __int16 v38 = 2048;
        v39 = self;
        __int16 v40 = 2114;
        v41 = @"BKSHIDEventDeferringTarget.m";
        __int16 v42 = 1024;
        int v43 = 32;
        __int16 v44 = 2114;
        v45 = v25;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v25 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA0E500);
    }
  }

  uint64_t v9 = objc_opt_class();
  if (v9 != objc_opt_class())
  {
    uint64_t v10 = objc_opt_class();
    if (v10 != objc_opt_class())
    {
      v29 = [NSString stringWithFormat:@"BKSHIDEventDeferringTarget cannot be subclassed"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v30 = NSStringFromSelector(a2);
        v31 = (objc_class *)objc_opt_class();
        v32 = NSStringFromClass(v31);
        *(_DWORD *)buf = 138544642;
        v35 = v30;
        __int16 v36 = 2114;
        v37 = v32;
        __int16 v38 = 2048;
        v39 = self;
        __int16 v40 = 2114;
        v41 = @"BKSHIDEventDeferringTarget.m";
        __int16 v42 = 1024;
        int v43 = 33;
        __int16 v44 = 2114;
        v45 = v29;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v29 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA0E5ECLL);
    }
  }
  v33.receiver = self;
  v33.super_class = (Class)BKSHIDEventDeferringTarget;
  v11 = [(BKSHIDEventDeferringTarget *)&v33 init];
  uint64_t v12 = v11;
  if (v11)
  {
    v11->_pid = a3;
    uint64_t v13 = [v8 copy];
    token = v12->_token;
    v12->_token = (BKSHIDEventDeferringToken *)v13;
  }
  return v12;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__BKSHIDEventDeferringTarget_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E5441BB0;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [v5 appendProem:0 block:v6];
}

id __59__BKSHIDEventDeferringTarget_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) token];
  id v4 = (id)[v2 appendObject:v3 withName:@"token" skipIfNil:1];

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", (int)objc_msgSend(*(id *)(a1 + 40), "pid"), @"pid");
}

- (int)pid
{
  return self->_pid;
}

- (BKSHIDEventDeferringToken)token
{
  return self->_token;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t pid = self->_pid;
  id v5 = a3;
  [v5 encodeInt32:pid forKey:@"pid"];
  [v5 encodeObject:self->_token forKey:@"token"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BKSHIDEventDeferringTarget *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if ((v5 == objc_opt_class() || (uint64_t v6 = objc_opt_class(), v6 == objc_opt_class())) && self->_pid == v4->_pid) {
      char v7 = BSEqualObjects();
    }
    else {
      char v7 = 0;
    }
  }

  return v7;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

+ (id)protobufSchema
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__BKSHIDEventDeferringTarget_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_1246 != -1) {
    dispatch_once(&protobufSchema_onceToken_1246, block);
  }
  v2 = (void *)protobufSchema_schema_1247;
  return v2;
}

uint64_t __44__BKSHIDEventDeferringTarget_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F4F808] buildSchemaForClass:*(void *)(a1 + 32) builder:&__block_literal_global_1249];
  uint64_t v2 = protobufSchema_schema_1247;
  protobufSchema_schema_1247 = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

void __44__BKSHIDEventDeferringTarget_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 addField:"_pid"];
  [v2 addField:"_token"];
}

- (unint64_t)hash
{
  uint64_t pid = self->_pid;
  return pid ^ 0x1ABE5 ^ [(BKSHIDEventDeferringToken *)self->_token hash];
}

- (id)initForProtobufDecoding
{
  v3.receiver = self;
  v3.super_class = (Class)BKSHIDEventDeferringTarget;
  return [(BKSHIDEventDeferringTarget *)&v3 init];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[BKSMutableHIDEventDeferringTarget allocWithZone:a3];
  uint64_t pid = self->_pid;
  token = self->_token;
  return [(BKSHIDEventDeferringTarget *)v4 _initWithPID:pid token:token];
}

- (BKSHIDEventDeferringTarget)init
{
  id v4 = [NSString stringWithFormat:@"-init is not allowed on BKSHIDEventDeferringTarget"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    uint64_t v6 = (objc_class *)objc_opt_class();
    char v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    uint64_t v16 = @"BKSHIDEventDeferringTarget.m";
    __int16 v17 = 1024;
    int v18 = 26;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKSHIDEventDeferringTarget *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

@end