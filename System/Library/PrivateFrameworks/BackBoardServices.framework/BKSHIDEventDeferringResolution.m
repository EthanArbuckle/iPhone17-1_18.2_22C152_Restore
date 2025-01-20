@interface BKSHIDEventDeferringResolution
+ (BOOL)supportsSecureCoding;
+ (id)build:(id)a3;
- (BKSHIDEventDeferringEnvironment)environment;
- (BKSHIDEventDeferringResolution)init;
- (BKSHIDEventDeferringResolution)initWithCoder:(id)a3;
- (BKSHIDEventDeferringToken)token;
- (BKSHIDEventDispatchingTarget)dispatchingTarget;
- (BKSHIDEventDisplay)display;
- (BOOL)isBuffer;
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)processDescription;
- (id)_initWithCopyOf:(id *)a1;
- (id)_initWithDisplay:(void *)a1 environment:(void *)a2 versionedPID:(void *)a3 pid:(uint64_t)a4 token:(int)a5 dispatchingTarget:(void *)a6;
- (id)modifiedResolution:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int)pid;
- (int64_t)versionedPID;
- (unint64_t)hash;
- (void)appendDescriptionToStream:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSHIDEventDeferringResolution

- (unint64_t)hash
{
  unint64_t v3 = [(BKSHIDEventDisplay *)self->_display hash];
  unint64_t v4 = [(BKSHIDEventDeferringEnvironment *)self->_environment hash];
  uint64_t pid = self->_pid;
  unint64_t v6 = v3 ^ v4 ^ pid ^ [(BKSHIDEventDeferringToken *)self->_token hash] ^ 0x19397;
  dispatchingTarget = self->_dispatchingTarget;
  if (dispatchingTarget) {
    v6 ^= [(BKSHIDEventDispatchingTarget *)dispatchingTarget hash];
  }
  return v6;
}

+ (id)build:(id)a3
{
  unint64_t v3 = (void (**)(id, BKSMutableHIDEventDeferringResolution *))a3;
  unint64_t v4 = +[BKSMutableHIDEventDeferringResolution new];
  v3[2](v3, v4);

  return v4;
}

- (id)_initWithDisplay:(void *)a1 environment:(void *)a2 versionedPID:(void *)a3 pid:(uint64_t)a4 token:(int)a5 dispatchingTarget:(void *)a6
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a6;
  if (!v11)
  {
    v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"display != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v25 = NSStringFromSelector(sel__initWithDisplay_environment_versionedPID_pid_token_dispatchingTarget_);
      v26 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v26);
      *(_DWORD *)buf = 138544642;
      v54 = v25;
      __int16 v55 = 2114;
      v56 = v27;
      __int16 v57 = 2048;
      v58 = a1;
      __int16 v59 = 2114;
      v60 = @"BKSHIDEventDeferringResolution.m";
      __int16 v61 = 1024;
      int v62 = 74;
      __int16 v63 = 2114;
      v64 = v24;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v24 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA1163CLL);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[display isKindOfClass:[BKSHIDEventDisplay class]]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v29 = NSStringFromSelector(sel__initWithDisplay_environment_versionedPID_pid_token_dispatchingTarget_);
      v30 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v30);
      *(_DWORD *)buf = 138544642;
      v54 = v29;
      __int16 v55 = 2114;
      v56 = v31;
      __int16 v57 = 2048;
      v58 = a1;
      __int16 v59 = 2114;
      v60 = @"BKSHIDEventDeferringResolution.m";
      __int16 v61 = 1024;
      int v62 = 75;
      __int16 v63 = 2114;
      v64 = v28;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v28 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA11734);
  }
  if (!v12)
  {
    v32 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"environment != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v33 = NSStringFromSelector(sel__initWithDisplay_environment_versionedPID_pid_token_dispatchingTarget_);
      v34 = (objc_class *)objc_opt_class();
      v35 = NSStringFromClass(v34);
      *(_DWORD *)buf = 138544642;
      v54 = v33;
      __int16 v55 = 2114;
      v56 = v35;
      __int16 v57 = 2048;
      v58 = a1;
      __int16 v59 = 2114;
      v60 = @"BKSHIDEventDeferringResolution.m";
      __int16 v61 = 1024;
      int v62 = 76;
      __int16 v63 = 2114;
      v64 = v32;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v32 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA1182CLL);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v36 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[environment isKindOfClass:[BKSHIDEventDeferringEnvironment class]]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v37 = NSStringFromSelector(sel__initWithDisplay_environment_versionedPID_pid_token_dispatchingTarget_);
      v38 = (objc_class *)objc_opt_class();
      v39 = NSStringFromClass(v38);
      *(_DWORD *)buf = 138544642;
      v54 = v37;
      __int16 v55 = 2114;
      v56 = v39;
      __int16 v57 = 2048;
      v58 = a1;
      __int16 v59 = 2114;
      v60 = @"BKSHIDEventDeferringResolution.m";
      __int16 v61 = 1024;
      int v62 = 77;
      __int16 v63 = 2114;
      v64 = v36;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v36 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA11924);
  }
  if (a4 == -1)
  {
    if (a5 <= 0)
    {
      v48 = [NSString stringWithFormat:@"invalid pid"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v49 = NSStringFromSelector(sel__initWithDisplay_environment_versionedPID_pid_token_dispatchingTarget_);
        v50 = (objc_class *)objc_opt_class();
        v51 = NSStringFromClass(v50);
        *(_DWORD *)buf = 138544642;
        v54 = v49;
        __int16 v55 = 2114;
        v56 = v51;
        __int16 v57 = 2048;
        v58 = a1;
        __int16 v59 = 2114;
        v60 = @"BKSHIDEventDeferringResolution.m";
        __int16 v61 = 1024;
        int v62 = 82;
        __int16 v63 = 2114;
        v64 = v48;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v48 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA11BF4);
    }
  }
  else
  {
    a5 = a4;
  }
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v40 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[token isKindOfClass:[BKSHIDEventDeferringToken class]]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v41 = NSStringFromSelector(sel__initWithDisplay_environment_versionedPID_pid_token_dispatchingTarget_);
        v42 = (objc_class *)objc_opt_class();
        v43 = NSStringFromClass(v42);
        *(_DWORD *)buf = 138544642;
        v54 = v41;
        __int16 v55 = 2114;
        v56 = v43;
        __int16 v57 = 2048;
        v58 = a1;
        __int16 v59 = 2114;
        v60 = @"BKSHIDEventDeferringResolution.m";
        __int16 v61 = 1024;
        int v62 = 86;
        __int16 v63 = 2114;
        v64 = v40;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v40 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA11A1CLL);
    }
  }
  uint64_t v14 = objc_opt_class();
  if (v14 != objc_opt_class())
  {
    uint64_t v15 = objc_opt_class();
    if (v15 != objc_opt_class())
    {
      v44 = [NSString stringWithFormat:@"BKSHIDEventDeferringResolution cannot be subclassed"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v45 = NSStringFromSelector(sel__initWithDisplay_environment_versionedPID_pid_token_dispatchingTarget_);
        v46 = (objc_class *)objc_opt_class();
        v47 = NSStringFromClass(v46);
        *(_DWORD *)buf = 138544642;
        v54 = v45;
        __int16 v55 = 2114;
        v56 = v47;
        __int16 v57 = 2048;
        v58 = a1;
        __int16 v59 = 2114;
        v60 = @"BKSHIDEventDeferringResolution.m";
        __int16 v61 = 1024;
        int v62 = 93;
        __int16 v63 = 2114;
        v64 = v44;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v44 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA11B08);
    }
  }
  v52.receiver = a1;
  v52.super_class = (Class)BKSHIDEventDeferringResolution;
  id v16 = objc_msgSendSuper2(&v52, sel_init);
  if (v16)
  {
    uint64_t v17 = [v11 copy];
    v18 = (void *)*((void *)v16 + 1);
    *((void *)v16 + 1) = v17;

    uint64_t v19 = [v12 copy];
    v20 = (void *)*((void *)v16 + 2);
    *((void *)v16 + 2) = v19;

    *((void *)v16 + 3) = a4;
    *((_DWORD *)v16 + 8) = a5;
    uint64_t v21 = [v13 copy];
    v22 = (void *)*((void *)v16 + 5);
    *((void *)v16 + 5) = v21;

    objc_storeStrong((id *)v16 + 7, 0);
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchingTarget, 0);
  objc_storeStrong((id *)&self->_processDescription, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_display, 0);
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__BKSHIDEventDeferringResolution_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E5441BB0;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [v5 appendProem:0 block:v6];
}

id __60__BKSHIDEventDeferringResolution_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:0];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(v3 + 8);
  if (v4)
  {
    char v5 = [v4 _isNullDisplay];
    uint64_t v3 = *(void *)(a1 + 40);
    if ((v5 & 1) == 0)
    {
      id v6 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(v3 + 8) withName:@"display"];
      uint64_t v3 = *(void *)(a1 + 40);
    }
  }
  if ([*(id *)(v3 + 48) length])
  {
    [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 48) withName:0];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if ((unint64_t)(*(void *)(v7 + 24) + 1) >= 2) {
      id v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendVersionedPID:withName:");
    }
    else {
      id v8 = (id)[*(id *)(a1 + 32) appendInteger:*(int *)(v7 + 32) withName:@"pid"];
    }
  }
  id v10 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 40) withName:@"token" skipIfNil:1];
  id result = (id)[*(id *)(a1 + 32) hasDebugStyle];
  if (result) {
    return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 56) withName:@"dispatchingTarget" skipIfNil:1];
  }
  return result;
}

- (BKSHIDEventDeferringToken)token
{
  return self->_token;
}

- (BKSHIDEventDeferringEnvironment)environment
{
  return self->_environment;
}

- (BKSHIDEventDisplay)display
{
  return self->_display;
}

- (int)pid
{
  return self->_pid;
}

- (int64_t)versionedPID
{
  return self->_versionedPID;
}

- (NSString)processDescription
{
  return self->_processDescription;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BKSHIDEventDeferringResolution *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if ((v5 == objc_opt_class() || (uint64_t v6 = objc_opt_class(), v6 == objc_opt_class()))
      && BSEqualObjects()
      && BSEqualObjects()
      && self->_pid == v4->_pid
      && BSEqualObjects()
      && self->_versionedPID == v4->_versionedPID)
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

- (id)_initWithCopyOf:(id *)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)BKSHIDEventDeferringResolution;
    a1 = (id *)objc_msgSendSuper2(&v19, sel_init);
    if (a1)
    {
      uint64_t v4 = objc_opt_class();
      if (v4 != objc_opt_class())
      {
        uint64_t v5 = objc_opt_class();
        if (v5 != objc_opt_class())
        {
          uint64_t v15 = [NSString stringWithFormat:@"BKSHIDEventDeferringResolution cannot be subclassed"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            id v16 = NSStringFromSelector(sel__initWithCopyOf_);
            uint64_t v17 = (objc_class *)objc_opt_class();
            v18 = NSStringFromClass(v17);
            *(_DWORD *)buf = 138544642;
            uint64_t v21 = v16;
            __int16 v22 = 2114;
            v23 = v18;
            __int16 v24 = 2048;
            v25 = a1;
            __int16 v26 = 2114;
            v27 = @"BKSHIDEventDeferringResolution.m";
            __int16 v28 = 1024;
            int v29 = 57;
            __int16 v30 = 2114;
            v31 = v15;
            _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          [v15 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x18AA487CCLL);
        }
      }
      uint64_t v6 = [v3[1] copy];
      id v7 = a1[1];
      a1[1] = (id)v6;

      uint64_t v8 = [v3[2] copy];
      id v9 = a1[2];
      a1[2] = (id)v8;

      a1[3] = v3[3];
      *((_DWORD *)a1 + 8) = *((_DWORD *)v3 + 8);
      uint64_t v10 = [v3[5] copy];
      id v11 = a1[5];
      a1[5] = (id)v10;

      objc_storeStrong(a1 + 7, v3[7]);
      uint64_t v12 = [v3[6] copy];
      id v13 = a1[6];
      a1[6] = (id)v12;
    }
  }

  return a1;
}

- (BOOL)isBuffer
{
  return self->_isBuffer;
}

- (BKSHIDEventDispatchingTarget)dispatchingTarget
{
  return self->_dispatchingTarget;
}

- (NSString)debugDescription
{
  uint64_t v3 = (void *)MEMORY[0x1E4F4F720];
  uint64_t v4 = [MEMORY[0x1E4F4F728] debugStyle];
  uint64_t v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return (NSString *)v5;
}

- (BKSHIDEventDeferringResolution)initWithCoder:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
    uint64_t v6 = objc_opt_class();
    if (v6 != objc_opt_class())
    {
      id v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = *MEMORY[0x1E4F281F8];
      uint64_t v25 = *MEMORY[0x1E4F28588];
      id v9 = [NSString stringWithFormat:@"Failed to decode BKSHIDEventDeferringResolution: subclasses are not allowed : %@", objc_opt_class()];
      __int16 v26 = v9;
      uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      id v11 = [v7 errorWithDomain:v8 code:4866 userInfo:v10];
      [v4 failWithError:v11];
LABEL_9:

      uint64_t v21 = 0;
      goto LABEL_10;
    }
  }
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"display"];
  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"environment"];
  uint64_t v12 = [v4 decodeInt64ForKey:@"versionedPID"];
  uint64_t v13 = [v4 decodeInt32ForKey:@"pid"];
  uint64_t v14 = v13;
  if (!v9 || !v10 || (int)v13 <= 0 && v12 == -1)
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F281F8];
    uint64_t v27 = *MEMORY[0x1E4F28588];
    uint64_t v17 = NSString;
    id v11 = NSStringFromBSVersionedPID();
    v18 = [v17 stringWithFormat:@"Failed to decode BKSHIDEventDeferringResolution: invalid display, environment or process : display=%@ environment=%@ vpid=%@ pid=%i", v9, v10, v11, v14];
    v28[0] = v18;
    objc_super v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    v20 = [v15 errorWithDomain:v16 code:4866 userInfo:v19];
    [v4 failWithError:v20];

    goto LABEL_9;
  }
  v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"token"];
  if (self) {
    id v24 = -[BKSHIDEventDeferringResolution _initWithDisplay:environment:versionedPID:pid:token:dispatchingTarget:](self, v9, v10, v12, v14, v23);
  }
  else {
    id v24 = 0;
  }
  self = (BKSHIDEventDeferringResolution *)v24;

  uint64_t v21 = self;
LABEL_10:

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  display = self->_display;
  id v5 = a3;
  [v5 encodeObject:display forKey:@"display"];
  [v5 encodeObject:self->_environment forKey:@"environment"];
  [v5 encodeInt32:self->_pid forKey:@"pid"];
  [v5 encodeInt64:self->_versionedPID forKey:@"versionedPID"];
  [v5 encodeObject:self->_token forKey:@"token"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[BKSMutableHIDEventDeferringResolution allocWithZone:a3];
  return -[BKSHIDEventDeferringResolution _initWithCopyOf:]((id *)&v4->super.super.isa, self);
}

- (BKSHIDEventDeferringResolution)init
{
  id v4 = [NSString stringWithFormat:@"-init is not allowed on BKSHIDEventDeferringResolution"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    uint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2048;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    uint64_t v16 = @"BKSHIDEventDeferringResolution.m";
    __int16 v17 = 1024;
    int v18 = 51;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  id result = (BKSHIDEventDeferringResolution *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)modifiedResolution:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = (void *)[(BKSHIDEventDeferringResolution *)self mutableCopy];
  v4[2](v4, v5);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end