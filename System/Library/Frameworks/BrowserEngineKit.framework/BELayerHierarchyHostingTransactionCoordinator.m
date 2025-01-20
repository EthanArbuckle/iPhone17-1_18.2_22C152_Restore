@interface BELayerHierarchyHostingTransactionCoordinator
+ (BOOL)supportsSecureCoding;
+ (id)coordinatorWithError:(id *)a3;
+ (id)coordinatorWithXPCRepresentation:(id)a3 error:(id *)a4;
- (BELayerHierarchyHostingTransactionCoordinator)init;
- (BELayerHierarchyHostingTransactionCoordinator)initWithCoder:(id)a3;
- (id)_initWithFence:(id)a3;
- (id)createXPCRepresentation;
- (void)_addContext:(uint64_t)a1;
- (void)_addContextForHostingView:(uint64_t)a1;
- (void)addLayerHierarchy:(id)a3;
- (void)addLayerHierarchyHostingView:(id)a3;
- (void)commit;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BELayerHierarchyHostingTransactionCoordinator

- (BELayerHierarchyHostingTransactionCoordinator)init
{
  v4 = [NSString stringWithFormat:@"init is not allowed on BELayerHierarchyHostingTransactionCoordinator"];
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
    v16 = @"BELayerHierarchyHostingTransactionCoordinator.m";
    __int16 v17 = 1024;
    int v18 = 38;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_243238000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BELayerHierarchyHostingTransactionCoordinator *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithFence:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BELayerHierarchyHostingTransactionCoordinator;
  v6 = [(BELayerHierarchyHostingTransactionCoordinator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_fence, a3);
  }

  return v7;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_243238000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_addContext:(uint64_t)a1
{
  id v3 = a2;
  if (!a1)
  {
LABEL_7:

    return;
  }
  id v8 = v3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 32));
  if (!*(unsigned char *)(a1 + 36))
  {
    uint64_t v4 = *(void **)(a1 + 16);
    if (v4)
    {
      [v4 addObject:v8];
    }
    else
    {
      uint64_t v5 = [MEMORY[0x263EFF9C0] setWithObject:v8];
      uint64_t v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;
    }
    [v8 addFence:*(void *)(a1 + 8)];
    id v3 = v8;
    goto LABEL_7;
  }
  uint64_t v7 = [NSString stringWithFormat:@"%@ cannot add to coordinator after commit", a1];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[BELayerHierarchyHostingTransactionCoordinator _addContext:](sel__addContext_);
  }
  [v7 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (void)_addContextForHostingView:(uint64_t)a1
{
  id v9 = a2;
  if (!a1)
  {
LABEL_9:

    return;
  }
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 32));
  if (!*(unsigned char *)(a1 + 36))
  {
    id v3 = (void *)MEMORY[0x245676D40]();
    uint64_t v4 = [v9 window];
    uint64_t v5 = [v4 _boundContext];

    if (v5)
    {
      -[BELayerHierarchyHostingTransactionCoordinator _addContext:](a1, v5);
    }
    else
    {
      uint64_t v6 = [v9 layer];
      uint64_t v7 = [v6 context];

      if (v7) {
        -[BELayerHierarchyHostingTransactionCoordinator _addContext:](a1, v7);
      }
    }
    goto LABEL_9;
  }
  id v8 = [NSString stringWithFormat:@"%@ cannot add hostingView after commit", a1];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[BELayerHierarchyHostingTransactionCoordinator _addContextForHostingView:]();
  }
  [v8 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

+ (id)coordinatorWithError:(id *)a3
{
  uint64_t v4 = (void *)[MEMORY[0x263F157C0] newFenceFromDefaultServer];
  if (v4)
  {
    id v5 = [[BELayerHierarchyHostingTransactionCoordinator alloc] _initWithFence:v4];
  }
  else if (a3)
  {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:1 userInfo:0];
    id v5 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)coordinatorWithXPCRepresentation:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263F157C0] handleFromXPCRepresentation:v5];
    uint64_t v7 = v6;
    if (v6 && [v6 isUsable])
    {
      id v8 = [[BELayerHierarchyHostingTransactionCoordinator alloc] _initWithFence:v7];
    }
    else
    {
      if (a4)
      {
        *a4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:60 userInfo:0];
      }
      [v7 invalidate];
      id v8 = 0;
    }
  }
  else if (a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:4866 userInfo:0];
    id v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)createXPCRepresentation
{
  v2 = (void *)[(CAFenceHandle *)self->_fence createXPCRepresentation];

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BELayerHierarchyHostingTransactionCoordinator)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fence"];
    uint64_t v6 = v5;
    if (v5 && [v5 isUsable])
    {
      uint64_t v7 = (BELayerHierarchyHostingTransactionCoordinator *)[(BELayerHierarchyHostingTransactionCoordinator *)self _initWithFence:v6];
      id v8 = v7;
    }
    else
    {
      uint64_t v7 = [(BELayerHierarchyHostingTransactionCoordinator *)self _initWithFence:v6];
      [(BELayerHierarchyHostingTransactionCoordinator *)v7 commit];
      id v8 = 0;
    }

    return v8;
  }
  else
  {
    v10 = [NSString stringWithFormat:@"BELayerHierarchyHandle only supports NSXPCCoder"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BELayerHierarchyHostingTransactionCoordinator initWithCoder:]();
    }
    [v10 UTF8String];
    result = (BELayerHierarchyHostingTransactionCoordinator *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 encodeObject:self->_fence forKey:@"fence"];
  }
  else
  {
    id v4 = [NSString stringWithFormat:@"BELayerHierarchyHandle only supports NSXPCCoder"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BELayerHierarchyHostingTransactionCoordinator encodeWithCoder:]();
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)addLayerHierarchy:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  os_unfair_lock_lock(&self->_commitLock);
  id v5 = -[BELayerHierarchy _context]((uint64_t)v4);

  -[BELayerHierarchyHostingTransactionCoordinator _addContext:]((uint64_t)self, v5);

  os_unfair_lock_unlock(&self->_commitLock);
}

- (void)addLayerHierarchyHostingView:(id)a3
{
  id v4 = (NSMutableSet *)a3;
  BSDispatchQueueAssertMain();
  os_unfair_lock_lock(&self->_commitLock);
  -[BELayerHierarchyHostingTransactionCoordinator _addContextForHostingView:]((uint64_t)self, v4);
  commitLock_hostingViews = self->_commitLock_hostingViews;
  if (commitLock_hostingViews)
  {
    [(NSMutableSet *)commitLock_hostingViews addObject:v4];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263EFF9C0] setWithObject:v4];

    id v4 = self->_commitLock_hostingViews;
    self->_commitLock_hostingViews = v6;
  }

  os_unfair_lock_unlock(&self->_commitLock);
}

- (void)commit
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_243238000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commitLock_hostingViews, 0);
  objc_storeStrong((id *)&self->_commitLock_contexts, 0);

  objc_storeStrong((id *)&self->_fence, 0);
}

- (void)_addContext:(const char *)a1 .cold.1(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_243238000, &_os_log_internal, v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);
}

- (void)_addContextForHostingView:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_243238000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_243238000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)encodeWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_243238000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end