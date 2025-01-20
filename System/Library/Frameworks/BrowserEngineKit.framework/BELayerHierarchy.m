@interface BELayerHierarchy
+ (id)layerHierarchyWithError:(id *)a3;
+ (id)layerHierarchyWithOptions:(id)a3 error:(id *)a4;
- (BELayerHierarchy)init;
- (BELayerHierarchy)initWithContext:(id)a3;
- (BELayerHierarchyHandle)handle;
- (CALayer)layer;
- (uint64_t)_context;
- (void)dealloc;
- (void)invalidate;
- (void)setLayer:(id)a3;
@end

@implementation BELayerHierarchy

- (BELayerHierarchy)init
{
  v4 = [NSString stringWithFormat:@"init is not allowed on BELayerHierarchy"];
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
    v16 = @"BELayerHierarchy.m";
    __int16 v17 = 1024;
    int v18 = 29;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_243238000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BELayerHierarchy *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)dealloc
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v5 = NSStringFromSelector(a1);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  int v9 = v5;
  __int16 v10 = 2114;
  __int16 v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  __int16 v15 = @"BELayerHierarchy.m";
  __int16 v16 = 1024;
  int v17 = 35;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_243238000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

- (BELayerHierarchy)initWithContext:(id)a3
{
  id v5 = a3;
  BSDispatchQueueAssertMain();
  v15.receiver = self;
  v15.super_class = (Class)BELayerHierarchy;
  v6 = [(BELayerHierarchy *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    uint64_t v8 = objc_opt_new();
    invalidationSignal = v7->_invalidationSignal;
    v7->_invalidationSignal = (BSAtomicSignal *)v8;

    __int16 v10 = [BELayerHierarchyHandle alloc];
    pid_t v11 = getpid();
    __int16 v12 = (BELayerHierarchyHandle *)-[BELayerHierarchyHandle _initWithPID:contextID:](v10, v11, [(CAContext *)v7->_context contextId]);
    handle = v7->_handle;
    v7->_handle = v12;
  }
  return v7;
}

+ (id)layerHierarchyWithOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  BSDispatchQueueAssertMain();
  v6 = [MEMORY[0x263F15770] remoteContextWithOptions:v5];

  if (v6)
  {
    v7 = [[BELayerHierarchy alloc] initWithContext:v6];
  }
  else if (a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:1 userInfo:0];
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)layerHierarchyWithError:(id *)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = *MEMORY[0x263F15A00];
  v8[0] = MEMORY[0x263EFFA88];
  v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v5 = +[BELayerHierarchy layerHierarchyWithOptions:v4 error:a3];

  return v5;
}

- (CALayer)layer
{
  BSDispatchQueueAssertMain();
  context = self->_context;

  return (CALayer *)[(CAContext *)context layer];
}

- (void)setLayer:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  [(CAContext *)self->_context setLayer:v4];
}

- (void)invalidate
{
  BSDispatchQueueAssertMain();
  if ([(BSAtomicSignal *)self->_invalidationSignal signal])
  {
    context = self->_context;
    [(CAContext *)context invalidate];
  }
}

- (uint64_t)_context
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (BELayerHierarchyHandle)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_invalidationSignal, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end