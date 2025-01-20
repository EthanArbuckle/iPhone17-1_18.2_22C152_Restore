@interface BSMachPortTaskNameRight
+ (BOOL)supportsSecureCoding;
+ (id)taskNameForPID:(int)a3;
- (BSAuditToken)auditToken;
- (BSMachPortTaskNameRight)init;
- (BSMachPortTaskNameRight)initWithCoder:(id)a3;
- (BSMachPortTaskNameRight)initWithPID:(int)a3;
- (BSMachPortTaskNameRight)initWithXPCDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)pid;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation BSMachPortTaskNameRight

- (BSMachPortTaskNameRight)initWithXPCDictionary:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BSMachPortTaskNameRight;
  v4 = -[BSMachPortRight initWithXPCDictionary:](&v8, sel_initWithXPCDictionary_);
  if (v4)
  {
    v4->_pid = xpc_dictionary_get_int64(a3, "pid");
    v5 = BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey(a3, "auditToken");
    lock_auditToken = v4->_lock_auditToken;
    v4->_lock_auditToken = (BSAuditToken *)v5;
  }
  return v4;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BSMachPortTaskNameRight;
  -[BSMachPortRight encodeWithXPCDictionary:](&v5, sel_encodeWithXPCDictionary_);
  xpc_dictionary_set_int64(a3, "pid", self->_pid);
  os_unfair_lock_lock(&self->_lock);
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey(self->_lock_auditToken, a3, "auditToken");
  os_unfair_lock_unlock(&self->_lock);
}

- (BSMachPortTaskNameRight)initWithPID:(int)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3 >= 1 && (uint64_t v4 = *(void *)&a3, BSSandboxCanGetMachTaskName(a3)))
  {
    mach_port_name_t tn = 0;
    mach_error_t v5 = task_name_for_pid(*MEMORY[0x1E4F14960], v4, &tn);
    if (v5)
    {
      v6 = BSLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v13 = mach_error_string(v5);
        *(_DWORD *)buf = 67109634;
        int v16 = v4;
        __int16 v17 = 2082;
        v18 = v13;
        __int16 v19 = 1024;
        mach_error_t v20 = v5;
        _os_log_error_impl(&dword_18AAA8000, v6, OS_LOG_TYPE_ERROR, "Unable to obtain a task name port right for pid %i: %{public}s (0x%x)", buf, 0x18u);
      }
      v7 = 0;
    }
    else
    {
      objc_super v8 = NSString;
      v9 = BSProcessDescriptionForPID(v4);
      v10 = [v8 stringWithFormat:@"task_name_for_pid:%@", v9];
      v6 = _BSMachPortRightDescription(3u, 0, (uint64_t)v10, tn, 0);

      v11 = -[BSMachPortRight _initWithPort:type:owner:trace:](self, tn, 3, 0, v6);
      if (v11)
      {
        v11[12] = 0;
        v11[13] = v4;
      }
      self = v11;
      v7 = self;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)taskNameForPID:(int)a3
{
  if (a3 < 1)
  {
    v6 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&a3;
    if (BSSandboxCanGetMachTaskName(a3)) {
      v6 = (void *)[objc_alloc((Class)a1) initWithPID:v4];
    }
    else {
      v6 = 0;
    }
  }
  return v6;
}

- (BSAuditToken)auditToken
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_auditToken = self->_lock_auditToken;
  if (!lock_auditToken)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37__BSMachPortTaskNameRight_auditToken__block_invoke;
    v7[3] = &unk_1E5446130;
    v7[4] = self;
    [(BSMachPortRight *)self accessPort:v7];
    lock_auditToken = self->_lock_auditToken;
  }
  mach_error_t v5 = lock_auditToken;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

void __37__BSMachPortTaskNameRight_auditToken__block_invoke(uint64_t a1, task_name_t a2)
{
  if (a2 - 1 <= 0xFFFFFFFD)
  {
    uint64_t v12 = v2;
    uint64_t v13 = v3;
    *(void *)&long long v5 = -1;
    *((void *)&v5 + 1) = -1;
    long long v10 = v5;
    long long v11 = v5;
    if (BSAuditTokenForTask(a2, &v10))
    {
      v9[0] = v10;
      v9[1] = v11;
      uint64_t v6 = +[BSAuditToken tokenFromAuditToken:v9];
      uint64_t v7 = *(void *)(a1 + 32);
      objc_super v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
  }
}

- (void).cxx_destruct
{
}

- (BSMachPortTaskNameRight)init
{
  return [(BSMachPortTaskNameRight *)self initWithPID:getpid()];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BSMachPortTaskNameRight;
  uint64_t v4 = [(BSMachPortSendRight *)&v7 copyWithZone:a3];
  long long v5 = (id *)v4;
  if (v4)
  {
    v4[13] = self->_pid;
    os_unfair_lock_lock(&self->_lock);
    objc_storeStrong(v5 + 5, self->_lock_auditToken);
    os_unfair_lock_unlock(&self->_lock);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BSMachPortTaskNameRight)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BSMachPortTaskNameRight;
  uint64_t v4 = -[BSMachPortRight initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    v4->_pid = [a3 decodeIntForKey:@"pid"];
    uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"auditToken"];
    lock_auditToken = v4->_lock_auditToken;
    v4->_lock_auditToken = (BSAuditToken *)v5;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BSMachPortTaskNameRight;
  -[BSMachPortRight encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeInt:self->_pid forKey:@"pid"];
  os_unfair_lock_lock(&self->_lock);
  [a3 encodeObject:self->_lock_auditToken forKey:@"auditToken"];
  os_unfair_lock_unlock(&self->_lock);
}

- (int)pid
{
  return self->_pid;
}

@end