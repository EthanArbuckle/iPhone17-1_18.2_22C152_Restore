@interface BLSDiagnostics
+ (id)defaultEndpoint;
- (BLSDiagnostics)init;
- (__IOSurface)rawSurfaceForFrame:(id)a3;
- (__IOSurface)surfaceForFrame:(id)a3;
- (id)allFlipbookFrames;
- (id)frameOnGlassNow;
- (id)frameOnGlassWhenFlipbookLastCancelled;
- (id)frameWithUUID:(id)a3;
- (id)initWithEndpoint:(void *)a1;
- (void)invalidate;
@end

@implementation BLSDiagnostics

+ (id)defaultEndpoint
{
  self;
  v0 = (void *)MEMORY[0x1E4F50BB8];
  v1 = [MEMORY[0x1E4F50BB8] defaultShellMachName];
  v2 = +[BLSDiagnosticsXPCServiceSpecification identifier];
  v3 = [v0 endpointForMachName:v1 service:v2 instance:0];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F50BB8];
    v7 = +[BLSDiagnosticsXPCServiceSpecification identifier];
    id v5 = [v6 nullEndpointForService:v7 instance:0];
  }

  return v5;
}

- (BLSDiagnostics)init
{
  v3 = +[BLSDiagnostics defaultEndpoint]();
  v4 = (BLSDiagnostics *)-[BLSDiagnostics initWithEndpoint:](self, v3);

  return v4;
}

- (id)initWithEndpoint:(void *)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    id v5 = v3;
    NSClassFromString(&cfstr_Bsserviceconne.isa);
    if (!v5)
    {
      v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[BLSDiagnostics initWithEndpoint:](sel_initWithEndpoint_);
      }
      [v20 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1B55E9F40);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSServiceConnectionEndpointClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[BLSDiagnostics initWithEndpoint:](sel_initWithEndpoint_);
      }
      [v21 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1B55E9FA4);
    }

    v25.receiver = a1;
    v25.super_class = (Class)BLSDiagnostics;
    id v6 = objc_msgSendSuper2(&v25, sel_init);
    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v5];
      v8 = (void *)*((void *)v6 + 2);
      *((void *)v6 + 2) = v7;

      v9 = +[BLSDiagnosticsXPCServiceSpecification serviceQuality];
      v10 = [MEMORY[0x1E4F4F730] serial];
      v11 = objc_msgSend(v10, "serviceClass:relativePriority:", objc_msgSend(v9, "serviceClass"), objc_msgSend(v9, "relativePriority"));
      uint64_t v12 = BSDispatchQueueCreate();
      v13 = (void *)*((void *)v6 + 1);
      *((void *)v6 + 1) = v12;

      v14 = (void *)*((void *)v6 + 2);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __35__BLSDiagnostics_initWithEndpoint___block_invoke;
      v22[3] = &unk_1E61072F0;
      id v15 = v9;
      id v23 = v15;
      id v16 = v6;
      id v24 = v16;
      [v14 configureConnection:v22];
      [*((id *)v6 + 2) activate];
      v17 = bls_diagnostics_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v19 = *((void *)v6 + 2);
        *(_DWORD *)buf = 134218498;
        id v27 = v16;
        __int16 v28 = 2114;
        uint64_t v29 = v19;
        __int16 v30 = 2114;
        id v31 = v5;
        _os_log_debug_impl(&dword_1B55DE000, v17, OS_LOG_TYPE_DEBUG, "%p did activate connection:%{public}@ for endpoint:%{public}@", buf, 0x20u);
      }
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

void __35__BLSDiagnostics_initWithEndpoint___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 setServiceQuality:v3];
  [v5 setTargetQueue:*(void *)(*(void *)(a1 + 40) + 8)];
  v4 = +[BLSDiagnosticsXPCServiceSpecification interface];
  [v5 setInterface:v4];

  [v5 setInterruptionHandler:&__block_literal_global_2];
  [v5 setInvalidationHandler:&__block_literal_global_25];
}

uint64_t __35__BLSDiagnostics_initWithEndpoint___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 activate];
}

- (void)invalidate
{
}

- (id)allFlipbookFrames
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BSServiceConnection *)self->_connection remoteTarget];
  v4 = [v3 allFlipbookFrames];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "setSurfaceProvider:", self, (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v5;
}

- (id)frameWithUUID:(id)a3
{
  return 0;
}

- (id)frameOnGlassNow
{
  uint64_t v3 = [(BSServiceConnection *)self->_connection remoteTarget];
  v4 = [v3 frameOnGlassNow];

  [v4 setSurfaceProvider:self];

  return v4;
}

- (id)frameOnGlassWhenFlipbookLastCancelled
{
  uint64_t v3 = [(BSServiceConnection *)self->_connection remoteTarget];
  v4 = [v3 frameOnGlassWhenFlipbookLastCancelled];

  [v4 setSurfaceProvider:self];

  return v4;
}

- (__IOSurface)surfaceForFrame:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  id v5 = [(BSServiceConnection *)self->_connection remoteTarget];
  uint64_t v6 = [v4 uuid];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __34__BLSDiagnostics_surfaceForFrame___block_invoke;
  v13[3] = &unk_1E6107318;
  v13[4] = &v14;
  [v5 surfaceForFrameUUID:v6 reply:v13];

  uint64_t v7 = (void *)v15[5];
  if (v7) {
    uint64_t v8 = IOSurfaceLookupFromXPCObject(v7);
  }
  else {
    uint64_t v8 = 0;
  }
  v9 = bls_diagnostics_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    long long v11 = objc_msgSend(v4, "bls_shortLoggingString");
    uint64_t v12 = v15[5];
    *(_DWORD *)buf = 134218754;
    v21 = self;
    __int16 v22 = 2114;
    id v23 = v11;
    __int16 v24 = 2114;
    objc_super v25 = v8;
    __int16 v26 = 2114;
    uint64_t v27 = v12;
    _os_log_debug_impl(&dword_1B55DE000, v9, OS_LOG_TYPE_DEBUG, "%p surfaceForFrame:%{public}@ surface:%{public}@ surfaceXPC:%{public}@", buf, 0x2Au);
  }
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __34__BLSDiagnostics_surfaceForFrame___block_invoke(uint64_t a1, void *a2)
{
}

- (__IOSurface)rawSurfaceForFrame:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  id v5 = [(BSServiceConnection *)self->_connection remoteTarget];
  uint64_t v6 = [v4 uuid];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __37__BLSDiagnostics_rawSurfaceForFrame___block_invoke;
  v13[3] = &unk_1E6107318;
  v13[4] = &v14;
  [v5 rawSurfaceForFrameUUID:v6 reply:v13];

  uint64_t v7 = (void *)v15[5];
  if (v7) {
    uint64_t v8 = IOSurfaceLookupFromXPCObject(v7);
  }
  else {
    uint64_t v8 = 0;
  }
  v9 = bls_diagnostics_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    long long v11 = objc_msgSend(v4, "bls_shortLoggingString");
    uint64_t v12 = v15[5];
    *(_DWORD *)buf = 134218754;
    v21 = self;
    __int16 v22 = 2114;
    id v23 = v11;
    __int16 v24 = 2114;
    objc_super v25 = v8;
    __int16 v26 = 2114;
    uint64_t v27 = v12;
    _os_log_debug_impl(&dword_1B55DE000, v9, OS_LOG_TYPE_DEBUG, "%p rawSurfaceForFrame:%{public}@ surface:%{public}@ surfaceXPC:%{public}@", buf, 0x2Au);
  }
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __37__BLSDiagnostics_rawSurfaceForFrame___block_invoke(uint64_t a1, void *a2)
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

- (void)initWithEndpoint:(const char *)a1 .cold.1(const char *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1B55DE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, 0x3Au);
}

@end