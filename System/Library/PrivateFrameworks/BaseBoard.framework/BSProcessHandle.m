@interface BSProcessHandle
+ (BOOL)supportsSecureCoding;
+ (id)processHandle;
+ (id)processHandleForAuditToken:(id)a3;
+ (id)processHandleForAuditToken:(id)a3 bundleID:(id)a4;
+ (id)processHandleForNSXPCConnection:(id)a3;
+ (id)processHandleForPID:(int)a3;
+ (id)processHandleForPID:(int)a3 bundleID:(id)a4;
+ (id)processHandleForTaskNameRight:(id)a3;
+ (id)processHandleForTaskNameRight:(id)a3 bundleID:(id)a4;
+ (id)processHandleForXPCConnection:(id)a3;
- (BOOL)hasEntitlement:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BSAuditToken)auditToken;
- (BSMachPortTaskNameRight)taskNameRight;
- (BSProcessHandle)init;
- (BSProcessHandle)initWithCoder:(id)a3;
- (BSProcessHandle)initWithXPCDictionary:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)bundlePath;
- (NSString)description;
- (NSString)jobLabel;
- (NSString)name;
- _initWithPID:(void *)a1;
- _initWithPID:(void *)a3 bundleID:;
- _initWithTaskNameRight:(void *)a3 bundleID:;
- (id)_bundleIDGeneratingIfNeeded:(void *)a1;
- (id)_initWithAuditToken:(void *)a3 bundleID:;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)valueForEntitlement:(id)a3;
- (int)pid;
- (uint64_t)_isRunningWithCertainty:(uint64_t)result;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation BSProcessHandle

- (BSAuditToken)auditToken
{
  return self->_auditToken;
}

- (BSProcessHandle)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BSProcessHandle;
  v5 = [(BSProcessHandle *)&v15 init];
  if (v5)
  {
    v5->_pid = xpc_dictionary_get_int64(v4, "pid");
    v6 = BSCreateDeserializedStringFromXPCDictionaryWithKey(v4, "name");
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = BSCreateDeserializedStringFromXPCDictionaryWithKey(v4, "bundleID");
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

    v10 = BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey(v4, "auditToken");
    auditToken = v5->_auditToken;
    v5->_auditToken = (BSAuditToken *)v10;

    v12 = BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey(v4, "taskNameRight");
    taskNameRight = v5->_taskNameRight;
    v5->_taskNameRight = (BSMachPortTaskNameRight *)v12;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  LODWORD(self) = [(BSProcessHandle *)self pid];
  LOBYTE(self) = self == [v4 pid];

  return (char)self;
}

- (int)pid
{
  return self->_pid;
}

- (BOOL)hasEntitlement:(id)a3
{
  return [(BSAuditToken *)self->_auditToken hasEntitlement:a3];
}

- (NSString)name
{
  return self->_name;
}

+ (id)processHandleForXPCConnection:(id)a3
{
  id v4 = a3;
  int v5 = BSPIDForXPCConnection(v4);
  if (v5 == getpid())
  {
    uint64_t v6 = [a1 processHandle];
  }
  else
  {
    id v7 = objc_alloc((Class)a1);
    v8 = _BSBundleIDForXPCConnectionAndIKnowWhatImDoingISwear(v4);
    id v9 = v4;
    id v10 = v8;
    if (v7)
    {
      uint64_t v11 = BSPIDForXPCConnection(v9);
      uint64_t v6 = (uint64_t)-[BSProcessHandle _initWithPID:](v7, v11);
      if (v6)
      {
        uint64_t v12 = +[BSMachPortTaskNameRight taskNameForPID:*(unsigned int *)(v6 + 12)];
        v13 = *(void **)(v6 + 40);
        *(void *)(v6 + 40) = v12;

        uint64_t v14 = +[BSAuditToken tokenFromXPCConnection:v9];
        objc_super v15 = *(void **)(v6 + 24);
        *(void *)(v6 + 24) = v14;

        v16 = v10;
        if (!v10)
        {
          v16 = -[BSAuditToken _bundleIDGeneratingIfNeeded:](*(void **)(v6 + 24), 0);
        }
        uint64_t v17 = [v16 copy];
        v18 = *(void **)(v6 + 16);
        *(void *)(v6 + 16) = v17;

        if (!v10) {
      }
        }
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  return (id)v6;
}

- _initWithPID:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v9.receiver = a1;
  v9.super_class = (Class)BSProcessHandle;
  v3 = objc_msgSendSuper2(&v9, sel_init);
  id v4 = v3;
  if (v3)
  {
    v3[3] = a2;
    int v5 = BSProcessNameForPID(a2);
    uint64_t v6 = [v5 copy];
    id v7 = (void *)*((void *)v4 + 4);
    *((void *)v4 + 4) = v6;
  }
  return v4;
}

- (NSString)description
{
  return (NSString *)[(BSProcessHandle *)self descriptionWithMultilinePrefix:0];
}

+ (id)processHandleForNSXPCConnection:(id)a3
{
  id v4 = a3;
  int v5 = [v4 processIdentifier];
  if (v5 == getpid())
  {
    uint64_t v6 = [a1 processHandle];
  }
  else
  {
    id v7 = objc_alloc((Class)a1);
    v8 = +[BSAuditToken tokenFromNSXPCConnection:v4];
    uint64_t v6 = -[BSProcessHandle _initWithAuditToken:bundleID:](v7, v8, 0);
  }
  return v6;
}

+ (id)processHandleForAuditToken:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[BSProcessHandle _initWithAuditToken:bundleID:](objc_alloc((Class)a1), v6, v7);

  return v8;
}

- (id)_initWithAuditToken:(void *)a3 bundleID:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    id v8 = v6;
    if (v8)
    {
      NSClassFromString(&cfstr_Bsaudittoken.isa);
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSAuditTokenClass]"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__initWithAuditToken_bundleID_);
          id v18 = (id)objc_claimAutoreleasedReturnValue();
          v19 = (objc_class *)objc_opt_class();
          v20 = NSStringFromClass(v19);
          *(_DWORD *)buf = 138544642;
          id v22 = v18;
          __int16 v23 = 2114;
          v24 = v20;
          __int16 v25 = 2048;
          v26 = a1;
          __int16 v27 = 2114;
          v28 = @"BSProcessHandle.m";
          __int16 v29 = 1024;
          int v30 = 99;
          __int16 v31 = 2114;
          v32 = v17;
          _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        qword_1E911F420 = [v17 UTF8String];
        __break(0);
        JUMPOUT(0x18AACD6B8);
      }
    }

    objc_super v9 = (id *)-[BSProcessHandle _initWithPID:](a1, [v8 pid]);
    id v10 = v9;
    if (v9)
    {
      objc_storeStrong(v9 + 3, a2);
      uint64_t v11 = +[BSMachPortTaskNameRight taskNameForPID:*((unsigned int *)v10 + 3)];
      id v12 = v10[5];
      v10[5] = (id)v11;

      v13 = v7;
      if (!v7)
      {
        v13 = -[BSAuditToken _bundleIDGeneratingIfNeeded:](v10[3], 0);
      }
      uint64_t v14 = [v13 copy];
      id v15 = v10[2];
      v10[2] = (id)v14;

      if (!v7) {
    }
      }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __32__BSProcessHandle_processHandle__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_24;
  _MergedGlobals_24 = (uint64_t)v1;
}

- (BSProcessHandle)init
{
  uint64_t v3 = getpid();
  id v4 = (BSProcessHandle *)-[BSProcessHandle _initWithPID:](self, v3);
  if (v4)
  {
    uint64_t v5 = +[BSMachPortTaskNameRight taskNameForPID:v4->_pid];
    taskNameRight = v4->_taskNameRight;
    v4->_taskNameRight = (BSMachPortTaskNameRight *)v5;

    uint64_t v7 = [(BSMachPortTaskNameRight *)v4->_taskNameRight auditToken];
    auditToken = v4->_auditToken;
    v4->_auditToken = (BSAuditToken *)v7;

    objc_super v9 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v10 = [v9 bundleIdentifier];
    bundleID = v4->_bundleID;
    v4->_bundleID = (NSString *)v10;
  }
  return v4;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v5 = a3;
  xpc_dictionary_set_int64(v5, "pid", self->_pid);
  BSSerializeStringToXPCDictionaryWithKey(self->_name, v5, "name");
  id v4 = [(BSProcessHandle *)self bundleIdentifier];
  BSSerializeStringToXPCDictionaryWithKey(v4, v5, "bundleID");

  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey(self->_auditToken, v5, "auditToken");
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey(self->_taskNameRight, v5, "taskNameRight");
}

- (NSString)bundleIdentifier
{
  return (NSString *)-[BSProcessHandle _bundleIDGeneratingIfNeeded:](self, 1);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(BSProcessHandle *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(BSProcessHandle *)self succinctDescriptionBuilder];
  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v3 = +[BSDescriptionBuilder builderWithObject:self];
  uint64_t v4 = -[BSProcessHandle _bundleIDGeneratingIfNeeded:](self, 0);
  unint64_t name = (unint64_t)self->_name;
  if (v4 | name)
  {
    if (!name) {
      unint64_t name = v4;
    }
    uint64_t v7 = [NSString stringWithFormat:@"%@:%d", name, self->_pid];
    id v8 = (id)[v3 appendObject:v7 withName:0];
  }
  else
  {
    id v6 = (id)[v3 appendInt:self->_pid withName:@"pid"];
  }
  char v13 = 0;
  uint64_t v9 = -[BSProcessHandle _isRunningWithCertainty:]((uint64_t)self, &v13);
  if (v13) {
    id v10 = (id)[v3 appendBool:v9 withName:@"valid"];
  }
  else {
    id v11 = (id)[v3 appendObject:@"(unknown)" withName:@"valid"];
  }

  return v3;
}

- (id)_bundleIDGeneratingIfNeeded:(void *)a1
{
  if (a1)
  {
    uint64_t v3 = a1;
    objc_sync_enter(v3);
    if (a2 && !v3[2] && !*((unsigned char *)v3 + 8))
    {
      *((unsigned char *)v3 + 8) = 1;
      id v4 = v3[3];
      if (v4) {
        -[BSAuditToken _bundleIDGeneratingIfNeeded:](v4, 1);
      }
      else {
      uint64_t v5 = BSBundleIDForPID(*((unsigned int *)v3 + 3));
      }
      id v6 = v3[2];
      v3[2] = (id)v5;
    }
    id v7 = v3[2];
    objc_sync_exit(v3);
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (uint64_t)_isRunningWithCertainty:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    int v4 = *(_DWORD *)(result + 12);
    if (v4 < 1)
    {
      result = 0;
    }
    else if (v4 == getpid())
    {
      result = 1;
    }
    else
    {
      uint64_t v5 = *(void **)(v3 + 40);
      if (v5)
      {
        result = [v5 isUsable];
      }
      else
      {
        if (!BSSandboxCanGetProcessInfo(*(_DWORD *)(v3 + 12)))
        {
          char v6 = 0;
          result = 1;
          if (!a2) {
            return result;
          }
LABEL_11:
          *a2 = v6;
          return result;
        }
        result = BSPIDExists(*(_DWORD *)(v3 + 12));
      }
    }
    char v6 = 1;
    if (!a2) {
      return result;
    }
    goto LABEL_11;
  }
  return result;
}

- (BOOL)isValid
{
  return -[BSProcessHandle _isRunningWithCertainty:]((uint64_t)self, 0);
}

- (id)valueForEntitlement:(id)a3
{
  uint64_t v3 = [(BSAuditToken *)self->_auditToken valueForEntitlement:a3];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskNameRight, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (void)dealloc
{
  [(BSMachPortRight *)self->_taskNameRight invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BSProcessHandle;
  [(BSProcessHandle *)&v3 dealloc];
}

+ (id)processHandle
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__BSProcessHandle_processHandle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB21B250 != -1) {
    dispatch_once(&qword_1EB21B250, block);
  }
  v2 = (void *)_MergedGlobals_24;
  return v2;
}

+ (id)processHandleForAuditToken:(id)a3
{
  id v4 = a3;
  int v5 = [v4 pid];
  if (v5 == getpid())
  {
    uint64_t v6 = [a1 processHandle];
LABEL_5:
    id v7 = (void *)v6;
    goto LABEL_6;
  }
  if (v4)
  {
    uint64_t v6 = (uint64_t)-[BSProcessHandle _initWithAuditToken:bundleID:](objc_alloc((Class)a1), v4, 0);
    goto LABEL_5;
  }
  id v7 = 0;
LABEL_6:

  return v7;
}

+ (id)processHandleForPID:(int)a3
{
  objc_super v3 = -[BSProcessHandle _initWithPID:bundleID:](objc_alloc((Class)a1), *(uint64_t *)&a3, 0);
  return v3;
}

- _initWithPID:(void *)a3 bundleID:
{
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = -[BSProcessHandle _initWithPID:](a1, a2);
    if (v6)
    {
      uint64_t v7 = +[BSMachPortTaskNameRight taskNameForPID:v6[3]];
      id v8 = (void *)*((void *)v6 + 5);
      *((void *)v6 + 5) = v7;

      uint64_t v9 = [*((id *)v6 + 5) auditToken];
      id v10 = (void *)*((void *)v6 + 3);
      *((void *)v6 + 3) = v9;

      id v11 = v5;
      if (!v5)
      {
        id v11 = -[BSAuditToken _bundleIDGeneratingIfNeeded:](*((void **)v6 + 3), 0);
      }
      uint64_t v12 = [v11 copy];
      char v13 = (void *)*((void *)v6 + 2);
      *((void *)v6 + 2) = v12;

      if (!v5) {
    }
      }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)processHandleForTaskNameRight:(id)a3
{
  id v4 = a3;
  id v5 = -[BSProcessHandle _initWithTaskNameRight:bundleID:](objc_alloc((Class)a1), v4, 0);

  return v5;
}

- _initWithTaskNameRight:(void *)a3 bundleID:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = v5;
    if (v7)
    {
      NSClassFromString(&cfstr_Bsmachporttask.isa);
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSMachPortTaskNameRightClass]"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__initWithTaskNameRight_bundleID_);
          id v18 = (id)objc_claimAutoreleasedReturnValue();
          v19 = (objc_class *)objc_opt_class();
          v20 = NSStringFromClass(v19);
          *(_DWORD *)buf = 138544642;
          id v22 = v18;
          __int16 v23 = 2114;
          v24 = v20;
          __int16 v25 = 2048;
          v26 = a1;
          __int16 v27 = 2114;
          v28 = @"BSProcessHandle.m";
          __int16 v29 = 1024;
          int v30 = 111;
          __int16 v31 = 2114;
          v32 = v17;
          _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        qword_1E911F420 = [v17 UTF8String];
        __break(0);
        JUMPOUT(0x18AB29500);
      }
    }

    id v8 = -[BSProcessHandle _initWithPID:](a1, [v7 pid]);
    if (v8)
    {
      uint64_t v9 = [v7 copy];
      id v10 = (void *)*((void *)v8 + 5);
      *((void *)v8 + 5) = v9;

      uint64_t v11 = [*((id *)v8 + 5) auditToken];
      uint64_t v12 = (void *)*((void *)v8 + 3);
      *((void *)v8 + 3) = v11;

      char v13 = v6;
      if (!v6)
      {
        char v13 = -[BSAuditToken _bundleIDGeneratingIfNeeded:](*((void **)v8 + 3), 0);
      }
      uint64_t v14 = [v13 copy];
      id v15 = (void *)*((void *)v8 + 2);
      *((void *)v8 + 2) = v14;

      if (!v6) {
    }
      }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)processHandleForPID:(int)a3 bundleID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = -[BSProcessHandle _initWithPID:bundleID:](objc_alloc((Class)a1), v4, v6);

  return v7;
}

+ (id)processHandleForTaskNameRight:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[BSProcessHandle _initWithTaskNameRight:bundleID:](objc_alloc((Class)a1), v6, v7);

  return v8;
}

- (NSString)bundlePath
{
  return 0;
}

- (NSString)jobLabel
{
  return 0;
}

- (unint64_t)hash
{
  return [(BSProcessHandle *)self pid];
}

- (id)succinctDescription
{
  v2 = [(BSProcessHandle *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BSProcessHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v21.receiver = self;
    v21.super_class = (Class)BSProcessHandle;
    id v5 = [(BSProcessHandle *)&v21 init];
    if (v5)
    {
      v5->_pid = [v4 decodeIntForKey:@"pid"];
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
      unint64_t name = v5->_name;
      v5->_unint64_t name = (NSString *)v6;

      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
      bundleID = v5->_bundleID;
      v5->_bundleID = (NSString *)v8;

      uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"auditToken"];
      auditToken = v5->_auditToken;
      v5->_auditToken = (BSAuditToken *)v10;

      uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"taskNameRight"];
      taskNameRight = v5->_taskNameRight;
      v5->_taskNameRight = (BSMachPortTaskNameRight *)v12;
    }
    self = v5;
    uint64_t v14 = self;
  }
  else
  {
    id v15 = (void *)MEMORY[0x1E4F1CA00];
    v16 = (objc_class *)objc_opt_class();
    uint64_t v17 = NSStringFromClass(v16);
    id v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    objc_msgSend(v15, "raise:format:", *MEMORY[0x1E4F1C3C8], @"An %@ can only be decoded with an instance of NSXPCCoder; attempting to decode with %@",
      v17,
      v19);

    uint64_t v14 = 0;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v10 encodeInt:self->_pid forKey:@"pid"];
    [v10 encodeObject:self->_name forKey:@"name"];
    id v4 = [(BSProcessHandle *)self bundleIdentifier];
    [v10 encodeObject:v4 forKey:@"bundleID"];

    [v10 encodeObject:self->_auditToken forKey:@"auditToken"];
    [v10 encodeObject:self->_taskNameRight forKey:@"taskNameRight"];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    objc_msgSend(v5, "raise:format:", *MEMORY[0x1E4F1C3C8], @"An %@ can only be encoded with an instance of NSXPCCoder; attempting to encode with %@",
      v7,
      v9);
  }
}

- (BSMachPortTaskNameRight)taskNameRight
{
  return self->_taskNameRight;
}

@end