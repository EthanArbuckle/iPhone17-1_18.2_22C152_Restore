@interface BELayerHierarchyHandle
+ (BELayerHierarchyHandle)handleWithXPCRepresentation:(id)a3 error:(id *)a4;
+ (BOOL)supportsSecureCoding;
- (BELayerHierarchyHandle)init;
- (BELayerHierarchyHandle)initWithCoder:(id)a3;
- _initWithPID:(int)a3 contextID:;
- (id)createXPCRepresentation;
- (uint64_t)_contextID;
- (uint64_t)_pid;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BELayerHierarchyHandle

- (BELayerHierarchyHandle)init
{
  v4 = [NSString stringWithFormat:@"init is not allowed on BELayerHierarchyHandle"];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    v16 = @"BELayerHierarchyHandle.m";
    __int16 v17 = 1024;
    int v18 = 25;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_243238000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BELayerHierarchyHandle *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- _initWithPID:(int)a3 contextID:
{
  if (result)
  {
    if (a2 <= 0)
    {
      v5 = [NSString stringWithFormat:@"invalid pid"];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[BELayerHierarchyHandle _initWithPID:contextID:](sel__initWithPID_contextID_);
      }
      [v5 UTF8String];
      result = (_DWORD *)_bs_set_crash_log_message();
      __break(0);
    }
    else
    {
      v6.receiver = result;
      v6.super_class = (Class)BELayerHierarchyHandle;
      result = objc_msgSendSuper2(&v6, sel_init);
      if (result)
      {
        result[2] = a2;
        result[3] = a3;
      }
    }
  }
  return result;
}

+ (BELayerHierarchyHandle)handleWithXPCRepresentation:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_super v6 = v5;
  if (v5 && MEMORY[0x2456774E0](v5) == MEMORY[0x263EF8708] && xpc_dictionary_get_count(v6) == 2)
  {
    v7 = xpc_dictionary_get_value(v6, "pid");
    uint64_t v8 = xpc_dictionary_get_value(v6, "cid");
    int v9 = (void *)v8;
    if (v7
      && v8
      && (v10 = MEMORY[0x2456774E0](v7), uint64_t v11 = MEMORY[0x263EF87A0], v10 == MEMORY[0x263EF87A0])
      && MEMORY[0x2456774E0](v9) == v11
      && (value = xpc_uint64_get_value(v7), uint64_t v15 = xpc_uint64_get_value(v9), value - 0x80000000 >= 0xFFFFFFFF80000001)
      && v15
      && !HIDWORD(v15))
    {
      v12 = -[BELayerHierarchyHandle _initWithPID:contextID:]([BELayerHierarchyHandle alloc], value, v15);
    }
    else if (a4)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:4866 userInfo:0];
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }
  else if (a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:4866 userInfo:0];
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return (BELayerHierarchyHandle *)v12;
}

- (id)createXPCRepresentation
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "pid", self->_pid);
  xpc_dictionary_set_uint64(empty, "cid", self->_contextID);

  return empty;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BELayerHierarchyHandle)initWithCoder:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v6 = [v5 decodeInt32ForKey:@"pid"];
    int v7 = [v5 decodeInt32ForKey:@"cid"];
    uint64_t v8 = 0;
    if (v6)
    {
      if (v7)
      {
        self = -[BELayerHierarchyHandle _initWithPID:contextID:](self, v6, v7);
        uint64_t v8 = self;
      }
    }

    return v8;
  }
  else
  {
    uint64_t v10 = [NSString stringWithFormat:@"BELayerHierarchyHandle only supports NSXPCCoder"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BELayerHierarchyHandle initWithCoder:](a2);
    }
    [v10 UTF8String];
    result = (BELayerHierarchyHandle *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v6 encodeInt32:self->_pid forKey:@"pid"];
    [v6 encodeInt32:self->_contextID forKey:@"cid"];
  }
  else
  {
    id v5 = [NSString stringWithFormat:@"BELayerHierarchyHandle only supports NSXPCCoder"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BELayerHierarchyHandle encodeWithCoder:](a2);
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (uint64_t)_pid
{
  if (result) {
    return *(unsigned int *)(result + 8);
  }
  return result;
}

- (uint64_t)_contextID
{
  if (result) {
    return *(unsigned int *)(result + 12);
  }
  return result;
}

- (void)_initWithPID:(const char *)a1 contextID:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_243238000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithCoder:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_243238000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)encodeWithCoder:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_243238000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end