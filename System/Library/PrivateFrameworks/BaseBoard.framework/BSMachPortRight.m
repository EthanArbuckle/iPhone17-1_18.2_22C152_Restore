@interface BSMachPortRight
+ (BOOL)supportsSecureCoding;
+ (char)_type;
- (BOOL)_lock_isUsable;
- (BOOL)isUsable;
- (BOOL)isValid;
- (BOOL)matchesPortOfRight:(id)a3;
- (BSMachPortRight)init;
- (BSMachPortRight)initWithCoder:(id)a3;
- (BSMachPortRight)initWithXPCDictionary:(id)a3;
- (NSString)description;
- (NSString)trace;
- (const)_port;
- (unsigned)extractPortAndIKnowWhatImDoingISwear;
- (unsigned)rawPort;
- (void)_initWithPort:(char)a3 type:(int)a4 owner:(void *)a5 trace:;
- (void)_lock_invalidateForOwner:(uint64_t)a1;
- (void)accessPort:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)invalidate;
@end

@implementation BSMachPortRight

- (NSString)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[BSMachPortRight isUsable](self, "isUsable"), @"usable");
  trace = self->_trace;
  if (trace) {
    id v6 = (id)[v3 appendObject:trace withName:0];
  }
  v7 = [v3 build];

  return (NSString *)v7;
}

- (BSMachPortRight)initWithXPCDictionary:(id)a3
{
  unsigned int v5 = [(id)objc_opt_class() _type];
  id v6 = xpc_dictionary_get_value(a3, "bsmpr_p");
  uint64_t v7 = _BSMachPortTypeDecode(v5, v6);

  v8 = (char *)BSCreateDeserializedStringFromXPCDictionaryWithKey(a3, "bsmpr_t");
  v9 = _BSMachPortRightDescription(v5, 0, @"xpcCode", v7, v8);
  v10 = (BSMachPortRight *)-[BSMachPortRight _initWithPort:type:owner:trace:](self, v7, v5, 0, v9);

  return v10;
}

- (void)_initWithPort:(char)a3 type:(int)a4 owner:(void *)a5 trace:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v18.receiver = a1;
  v18.super_class = (Class)BSMachPortRight;
  v9 = objc_msgSendSuper2(&v18, sel_init);
  if (v9)
  {
    uint64_t v10 = [a5 copy];
    v11 = (void *)v9[1];
    v9[1] = v10;

    v9[2] = 0;
    *((_DWORD *)v9 + 6) = a2;
    *((_DWORD *)v9 + 7) = a2;
    *((unsigned char *)v9 + 32) = a3;
    *((unsigned char *)v9 + 33) = a4;
    v12 = BSLogMachPort();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = [MEMORY[0x1E4F29060] currentThread];
      v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      *(_DWORD *)buf = 138543874;
      v20 = v9;
      __int16 v21 = 2114;
      v22 = v13;
      __int16 v23 = 2114;
      v24 = v14;
      _os_log_debug_impl(&dword_18AAA8000, v12, OS_LOG_TYPE_DEBUG, " *|machport|* %{public}@ -> (%{public}@) %{public}@", buf, 0x20u);
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = v15;
    v16 = @"external ";
    if (!a4) {
      v16 = &stru_1ED76E928;
    }
    [v15 handleFailureInMethod:sel__initWithPort_type_owner_trace_, 0, @"BSMachPortRight.m", 159, @"failed to create wrapping object for %@port=%x with trace=%@", v16, a2, a5 object file lineNumber description];
  }

  return v9;
}

- (void).cxx_destruct
{
}

- (unsigned)rawPort
{
  return self->_rawPort;
}

uint64_t __38__BSMachPortRight_matchesPortOfRight___block_invoke(uint64_t result, int a2)
{
  if ((a2 - 1) <= 0xFFFFFFFD)
  {
    uint64_t v7 = v2;
    uint64_t v8 = v3;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __38__BSMachPortRight_matchesPortOfRight___block_invoke_2;
    v5[3] = &unk_1E54460B8;
    id v4 = *(void **)(result + 32);
    v5[4] = *(void *)(result + 40);
    int v6 = a2;
    return [v4 accessPort:v5];
  }
  return result;
}

- (void)accessPort:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int lock_accessCount = self->_lock_accessCount;
  if (lock_accessCount == 255)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"BSMachPortRight.m" lineNumber:191 description:@"_lock_accessCount overflow"];

    int lock_accessCount = self->_lock_accessCount;
  }
  self->_int lock_accessCount = lock_accessCount + 1;
  if (!lock_accessCount)
  {
    os_unfair_lock_unlock(p_lock);
    os_unfair_lock_lock(&self->_invalidationLock);
    os_unfair_lock_lock(p_lock);
  }
  os_unfair_lock_assert_owner(p_lock);
  unsigned int lock_port = self->_lock_port;
  if (lock_port + 1 >= 2) {
    uint64_t v9 = lock_port;
  }
  else {
    uint64_t v9 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v9);
  os_unfair_lock_lock(p_lock);
  int v10 = self->_lock_accessCount;
  if (!self->_lock_accessCount)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"BSMachPortRight.m" lineNumber:201 description:@"_lock_accessCount underflow"];

    int v10 = self->_lock_accessCount;
  }
  self->_int lock_accessCount = v10 - 1;
  os_unfair_lock_unlock(p_lock);
  if (v10 == 1)
  {
    os_unfair_lock_unlock(&self->_invalidationLock);
  }
}

- (BOOL)matchesPortOfRight:(id)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  if (a3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __38__BSMachPortRight_matchesPortOfRight___block_invoke;
    v5[3] = &unk_1E54460E0;
    v5[4] = self;
    void v5[5] = &v6;
    [a3 accessPort:v5];
    BOOL v3 = *((unsigned char *)v7 + 24) != 0;
  }
  else
  {
    BOOL v3 = 0;
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__BSMachPortRight_matchesPortOfRight___block_invoke_2(uint64_t result, int a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_DWORD *)(result + 40) == a2;
  return result;
}

- (NSString)trace
{
  return self->_trace;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  if (a3)
  {
    p_invalidationLock = &self->_invalidationLock;
    os_unfair_lock_lock(&self->_invalidationLock);
    os_unfair_lock_lock(&self->_lock);
    if (-[BSMachPortRight _lock_isUsable]((uint64_t)self))
    {
      char v8 = 0;
      uint64_t v6 = (void *)_BSMachPortTypeEncode(self->_type, self->_lock_port, &v8);
      if (v8) {
        -[BSMachPortRight _lock_invalidateForOwner:]((uint64_t)self, 1);
      }
      if (v6) {
        xpc_dictionary_set_value(a3, "bsmpr_p", v6);
      }
    }
    os_unfair_lock_unlock(&self->_lock);
    os_unfair_lock_unlock(p_invalidationLock);
    trace = self->_trace;
    BSSerializeStringToXPCDictionaryWithKey(trace, a3, "bsmpr_t");
  }
}

- (BOOL)isUsable
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[BSMachPortRight _lock_isUsable]((uint64_t)v2);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_lock_isUsable
{
  if (!a1) {
    return 0;
  }
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 20));
  uint64_t v2 = *(char *)(a1 + 32) - 1;
  if (v2 > 2) {
    return 0;
  }
  mach_port_name_t v3 = *(_DWORD *)(a1 + 24);
  int v4 = dword_18AB4C2C8[v2];
  return BSMachPortIsType(v3, v4);
}

- (void)dealloc
{
  [(BSMachPortRight *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BSMachPortRight;
  [(BSMachPortRight *)&v3 dealloc];
}

- (void)invalidate
{
  p_invalidationLock = &self->_invalidationLock;
  os_unfair_lock_lock(&self->_invalidationLock);
  os_unfair_lock_lock(&self->_lock);
  -[BSMachPortRight _lock_invalidateForOwner:]((uint64_t)self, self->_owner);
  os_unfair_lock_unlock(&self->_lock);
  os_unfair_lock_unlock(p_invalidationLock);
}

- (void)_lock_invalidateForOwner:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 20));
    if (*(_DWORD *)(a1 + 24))
    {
      int v4 = BSLogMachPort();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        id v7 = (id)objc_opt_class();
        if (-[BSMachPortRight _lock_isUsable](a1)) {
          char v8 = @"YES";
        }
        else {
          char v8 = @"NO";
        }
        uint64_t v9 = *(void *)(a1 + 8);
        int v10 = [MEMORY[0x1E4F29060] currentThread];
        v11 = [MEMORY[0x1E4F29060] callStackSymbols];
        int v12 = 138544642;
        id v13 = v7;
        __int16 v14 = 2048;
        uint64_t v15 = a1;
        __int16 v16 = 2112;
        v17 = v8;
        __int16 v18 = 2114;
        uint64_t v19 = v9;
        __int16 v20 = 2114;
        __int16 v21 = v10;
        __int16 v22 = 2114;
        __int16 v23 = v11;
        _os_log_debug_impl(&dword_18AAA8000, v4, OS_LOG_TYPE_DEBUG, " *|machport|* invalidate <%{public}@:%p usable=%@ %{public}@> -> (%{public}@) %{public}@", (uint8_t *)&v12, 0x3Eu);
      }
      if (!a2)
      {
        int v5 = *(char *)(a1 + 32);
        mach_port_name_t v6 = *(_DWORD *)(a1 + 24);
        if ((v5 - 2) >= 2)
        {
          if (v5 == 1) {
            BSMachReceiveRightRelease(v6);
          }
        }
        else
        {
          BSMachSendRightRelease(v6);
        }
      }
      *(_DWORD *)(a1 + 24) = 0;
    }
  }
}

- (unsigned)extractPortAndIKnowWhatImDoingISwear
{
  p_invalidationLock = &self->_invalidationLock;
  os_unfair_lock_lock(&self->_invalidationLock);
  os_unfair_lock_lock(&self->_lock);
  if (self->_owner || (unsigned int lock_port = self->_lock_port, lock_port + 1 < 2)) {
    unsigned int lock_port = 0;
  }
  else {
    -[BSMachPortRight _lock_invalidateForOwner:]((uint64_t)self, 1);
  }
  os_unfair_lock_unlock(&self->_lock);
  os_unfair_lock_unlock(p_invalidationLock);
  return lock_port;
}

- (const)_port
{
  v1 = a1;
  if (a1)
  {
    uint64_t v2 = a1 + 5;
    os_unfair_lock_lock(a1 + 5);
    os_unfair_lock_assert_owner(v1 + 5);
    uint32_t os_unfair_lock_opaque = v1[6]._os_unfair_lock_opaque;
    if (os_unfair_lock_opaque + 1 >= 2) {
      v1 = (const os_unfair_lock *)os_unfair_lock_opaque;
    }
    else {
      v1 = 0;
    }
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (BSMachPortRight)init
{
  int v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"BSMachPortRight.m" lineNumber:165 description:@"you cannot alloc a BSMachPortRight directly - use one of the exposed initializers instead"];

  return (BSMachPortRight *)-[BSMachPortRight _initWithPort:type:owner:trace:](self, 0, 0, 0, 0);
}

- (BOOL)isValid
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_port - 1 < 0xFFFFFFFE;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

+ (char)_type
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BSMachPortRight)initWithCoder:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  signed int v5 = [(id)objc_opt_class() _type];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = v5 - 1;
    if (v6 > 2) {
      uint64_t v7 = MEMORY[0x1E4F145D8];
    }
    else {
      uint64_t v7 = qword_1E5446170[v6];
    }
    int v10 = [a3 decodeXPCObjectOfType:v7 forKey:@"bsmpr_p"];
    uint64_t v9 = _BSMachPortTypeDecode(v5, v10);
  }
  else
  {
    char v8 = BSLogMachPort();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      __int16 v18 = NSStringFromClass(v17);
      int v19 = 138412546;
      id v20 = v16;
      __int16 v21 = 2112;
      __int16 v22 = v18;
      _os_log_error_impl(&dword_18AAA8000, v8, OS_LOG_TYPE_ERROR, "An %@ can not be coded by an instance of %@", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v9 = 0;
  }
  v11 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"bsmpr_t"];
  int v12 = _BSMachPortRightDescription(v5, 0, @"secCode", v9, v11);
  id v13 = (BSMachPortRight *)-[BSMachPortRight _initWithPort:type:owner:trace:](self, v9, v5, 0, v12);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    os_unfair_lock_lock(&self->_invalidationLock);
    os_unfair_lock_lock(&self->_lock);
    if (-[BSMachPortRight _lock_isUsable]((uint64_t)self))
    {
      char v12 = 0;
      signed int v5 = (void *)_BSMachPortTypeEncode(self->_type, self->_lock_port, &v12);
      if (v12) {
        -[BSMachPortRight _lock_invalidateForOwner:]((uint64_t)self, 1);
      }
      if (v5) {
        [a3 encodeXPCObject:v5 forKey:@"bsmpr_p"];
      }
    }
    os_unfair_lock_unlock(&self->_lock);
    os_unfair_lock_unlock(&self->_invalidationLock);
    trace = self->_trace;
    [a3 encodeObject:trace forKey:@"bsmpr_t"];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    char v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = (objc_class *)objc_opt_class();
    int v10 = NSStringFromClass(v9);
    objc_msgSend(v7, "raise:format:", *MEMORY[0x1E4F1C3C8], @"An %@ can only be encoded with an instance of XPCEncoder; attempting to encode with a %@",
      v11,
      v10);
  }
}

@end