@interface BLSHDiagnosticsHostPeer
- (BLSHDiagnosticsHostPeer)initWithFlipbookDiagnosticsProvider:(id)a3 peer:(id)a4;
- (BOOL)isValid;
- (NSString)description;
- (id)_lock_validateHostFrame:(id)a3 source:(id)a4;
- (id)allFlipbookFrames;
- (id)frameOnGlassNow;
- (id)frameOnGlassWhenFlipbookLastCancelled;
- (id)hostFrameForUUID:(id)a3;
- (void)allFlipbookFrames;
- (void)dealloc;
- (void)genericSurfaceForFrameUUID:(id)a3 reply:(id)a4 name:(id)a5 surfaceFromFrame:(id)a6;
- (void)invalidate;
- (void)rawSurfaceForFrameUUID:(id)a3 reply:(id)a4;
- (void)surfaceForFrameUUID:(id)a3 reply:(id)a4;
@end

@implementation BLSHDiagnosticsHostPeer

- (BLSHDiagnosticsHostPeer)initWithFlipbookDiagnosticsProvider:(id)a3 peer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BLSHDiagnosticsHostPeer;
  v9 = [(BLSHDiagnosticsHostPeer *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    v9->_entitlements = 0;
    v11 = [v8 remoteProcess];
    if ([v11 hasEntitlement:@"com.apple.backlight.captureFrameOnGlass"]) {
      v10->_entitlements |= 1uLL;
    }
    objc_storeStrong((id *)&v10->_flipbookDiagnosticsProvider, a3);
    v10->_valid = 1;
    v12 = [v8 remoteProcess];
    v10->_clientPid = [v12 pid];
  }
  return v10;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v2 = *(_DWORD *)(a1 + 48);
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = v2;
  _os_log_fault_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_FAULT, "%p must invalidate before deallocating service for pid:%d", (uint8_t *)&v3, 0x12u);
}

- (NSString)description
{
  int v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendInt:self->_clientPid withName:@"clientPID"];
  __int16 v5 = [v3 build];

  return (NSString *)v5;
}

- (BOOL)isValid
{
  int v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_valid;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)invalidate
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134218242;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_21FCFC000, v1, OS_LOG_TYPE_DEBUG, "%p invalidate %{public}@", (uint8_t *)&v2, 0x16u);
}

- (id)allFlipbookFrames
{
  if ([(BLSHDiagnosticsHostPeer *)self isValid])
  {
    uint64_t v3 = [(BLSFlipbookDiagnosticsProviding *)self->_flipbookDiagnosticsProvider allFlipbookFrames];
    uint64_t v4 = bls_diagnostics_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      [(BLSHDiagnosticsHostPeer *)(uint64_t)self allFlipbookFrames];
    }
  }
  else
  {
    uint64_t v4 = bls_diagnostics_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(BLSHDiagnosticsHostPeer *)(uint64_t)self allFlipbookFrames];
    }
    uint64_t v3 = 0;
  }

  __int16 v5 = objc_msgSend(v3, "bs_mapNoNulls:", &__block_literal_global_10);

  return v5;
}

uint64_t __44__BLSHDiagnosticsHostPeer_allFlipbookFrames__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bls_shortLoggingString");
}

uint64_t __44__BLSHDiagnosticsHostPeer_allFlipbookFrames__block_invoke_7(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F299E0] createWithFrame:a2];
}

- (id)frameOnGlassNow
{
  uint64_t v3 = [(BLSFlipbookDiagnosticsProviding *)self->_flipbookDiagnosticsProvider frameOnGlassNow];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  __int16 v5 = [(BLSHDiagnosticsHostPeer *)self _lock_validateHostFrame:v3 source:@"frameOnGlassNow"];

  lock_cachedFrameOnGlassNow = self->_lock_cachedFrameOnGlassNow;
  self->_lock_cachedFrameOnGlassNow = v5;
  uint64_t v7 = v5;

  os_unfair_lock_unlock(p_lock);
  id v8 = [MEMORY[0x263F299E0] createWithFrame:v7];

  return v8;
}

- (id)frameOnGlassWhenFlipbookLastCancelled
{
  uint64_t v3 = [(BLSFlipbookDiagnosticsProviding *)self->_flipbookDiagnosticsProvider frameOnGlassWhenFlipbookLastCancelled];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  __int16 v5 = [(BLSHDiagnosticsHostPeer *)self _lock_validateHostFrame:v3 source:@"frameOnGlassWhenFlipbookLastCancelled"];

  lock_cachedLastCancelledFrame = self->_lock_cachedLastCancelledFrame;
  self->_lock_cachedLastCancelledFrame = v5;
  uint64_t v7 = v5;

  os_unfair_lock_unlock(p_lock);
  id v8 = [MEMORY[0x263F299E0] createWithFrame:v7];

  return v8;
}

- (id)_lock_validateHostFrame:(id)a3 source:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!self->_valid)
  {
    v12 = bls_diagnostics_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[BLSHDiagnosticsHostPeer _lock_validateHostFrame:source:]((uint64_t)self, (uint64_t)v8, v12);
    }
    goto LABEL_11;
  }
  id v9 = v7;
  if (!v9)
  {
    v12 = bls_diagnostics_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      v19 = self;
      __int16 v20 = 2114;
      id v21 = v8;
      _os_log_impl(&dword_21FCFC000, v12, OS_LOG_TYPE_INFO, "%p %{public}@ — no host frame", buf, 0x16u);
    }
LABEL_11:
    v10 = 0;
    goto LABEL_12;
  }
  v10 = v9;
  uint64_t v11 = [v9 uuid];
  if (!v11)
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"uuid != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHDiagnosticsHostPeer _lock_validateHostFrame:source:](a2, (uint64_t)self, (uint64_t)v17);
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD10908);
  }
  v12 = v11;
  v13 = bls_diagnostics_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v15 = [v12 UUIDString];
    v16 = objc_msgSend(v10, "bls_shortLoggingString");
    *(_DWORD *)buf = 134218754;
    v19 = self;
    __int16 v20 = 2114;
    id v21 = v8;
    __int16 v22 = 2114;
    v23 = v15;
    __int16 v24 = 2114;
    v25 = v16;
    _os_log_debug_impl(&dword_21FCFC000, v13, OS_LOG_TYPE_DEBUG, "%p %{public}@ uuid:%{public}@ frame:%{public}@", buf, 0x2Au);
  }
LABEL_12:

  return v10;
}

- (void)surfaceForFrameUUID:(id)a3 reply:(id)a4
{
}

uint64_t __53__BLSHDiagnosticsHostPeer_surfaceForFrameUUID_reply___block_invoke(uint64_t a1, void *a2)
{
  return [a2 surface];
}

- (void)rawSurfaceForFrameUUID:(id)a3 reply:(id)a4
{
}

uint64_t __56__BLSHDiagnosticsHostPeer_rawSurfaceForFrameUUID_reply___block_invoke(uint64_t a1, void *a2)
{
  return [a2 rawSurface];
}

- (void)genericSurfaceForFrameUUID:(id)a3 reply:(id)a4 name:(id)a5 surfaceFromFrame:(id)a6
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  v12 = (uint64_t (**)(id, void *))a6;
  v13 = (void (**)(id, xpc_object_t, void *))a4;
  if (![(BLSHDiagnosticsHostPeer *)self isValid])
  {
    __int16 v20 = bls_diagnostics_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v41 = [v10 UUIDString];
      *(_DWORD *)buf = 134218498;
      v57 = self;
      __int16 v58 = 2114;
      id v59 = v11;
      __int16 v60 = 2114;
      v61 = v41;
      _os_log_error_impl(&dword_21FCFC000, v20, OS_LOG_TYPE_ERROR, "%p %{public}@, use after invalidation uuid:%{public}@", buf, 0x20u);
    }
    id v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = *MEMORY[0x263F29920];
    uint64_t v48 = *MEMORY[0x263F08320];
    v23 = NSString;
    objc_super v14 = [v10 UUIDString];
    __int16 v24 = [v23 stringWithFormat:@"%@: use after invalidation uuid:%@", v11, v14];
    v49 = v24;
    v25 = [NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    v19 = [v21 errorWithDomain:v22 code:5 userInfo:v25];
    goto LABEL_20;
  }
  objc_super v14 = [(BLSHDiagnosticsHostPeer *)self hostFrameForUUID:v10];
  if (!v14)
  {
    uint64_t v26 = bls_diagnostics_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v43 = [v10 UUIDString];
      *(_DWORD *)buf = 134218498;
      v57 = self;
      __int16 v58 = 2114;
      id v59 = v11;
      __int16 v60 = 2114;
      v61 = v43;
      _os_log_error_impl(&dword_21FCFC000, v26, OS_LOG_TYPE_ERROR, "%p %{public}@ invalid (not found) frame uuid, not match any known frame(s) uuid:%{public}@", buf, 0x20u);
    }
    v27 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = *MEMORY[0x263F29920];
    uint64_t v50 = *MEMORY[0x263F08320];
    v29 = NSString;
    __int16 v24 = [v10 UUIDString];
    v25 = [v29 stringWithFormat:@"%@: unknown UUID, does not match any known frame(s) uuid:%@", v11, v24];
    v51 = v25;
    v30 = [NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    v19 = [v27 errorWithDomain:v28 code:31 userInfo:v30];
    goto LABEL_19;
  }
  v15 = (__IOSurface *)v12[2](v12, v14);
  if (!v15)
  {
    v31 = bls_diagnostics_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = [v10 UUIDString];
      v33 = objc_msgSend(v14, "bls_loggingString");
      *(_DWORD *)buf = 134218754;
      v57 = self;
      __int16 v58 = 2114;
      id v59 = v11;
      __int16 v60 = 2114;
      v61 = v32;
      __int16 v62 = 2114;
      xpc_object_t v63 = v33;
      _os_log_impl(&dword_21FCFC000, v31, OS_LOG_TYPE_INFO, "%p %{public}@ nil surface for frame with uuid:%{public}@ frame:%{public}@", buf, 0x2Au);
    }
    v45 = (void *)MEMORY[0x263F087E8];
    uint64_t v34 = *MEMORY[0x263F29920];
    uint64_t v52 = *MEMORY[0x263F08320];
    v35 = NSString;
    __int16 v24 = [v10 UUIDString];
    v25 = objc_msgSend(v14, "bls_loggingString");
    v30 = [v35 stringWithFormat:@"%@: no saved surface (either never exited flipbook or has already been purged) uuid:%@ frame:%@", v11, v24, v25];
    v53 = v30;
    v36 = [NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    v37 = v45;
    uint64_t v38 = v34;
    uint64_t v39 = 30;
    goto LABEL_18;
  }
  v16 = v15;
  xpc_object_t XPCObject = IOSurfaceCreateXPCObject(v15);
  v18 = bls_diagnostics_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v47 = [v10 UUIDString];
    v42 = objc_msgSend(v14, "bls_loggingString");
    *(_DWORD *)buf = 134219266;
    v57 = self;
    __int16 v58 = 2114;
    id v59 = v11;
    __int16 v60 = 2114;
    v61 = v16;
    __int16 v62 = 2114;
    xpc_object_t v63 = XPCObject;
    __int16 v64 = 2114;
    v65 = v47;
    __int16 v66 = 2114;
    v67 = v42;
    _os_log_debug_impl(&dword_21FCFC000, v18, OS_LOG_TYPE_DEBUG, "%p %{public}@ surface:%{public}@ surfaceXPC:%{public}@ uuid:%{public}@ frame:%{public}@", buf, 0x3Eu);
  }
  if (!XPCObject)
  {
    v46 = (void *)MEMORY[0x263F087E8];
    uint64_t v44 = *MEMORY[0x263F29920];
    uint64_t v54 = *MEMORY[0x263F08320];
    v40 = NSString;
    __int16 v24 = [v10 UUIDString];
    v25 = objc_msgSend(v14, "bls_loggingString");
    v30 = [v40 stringWithFormat:@"%@: failed to create xpc object for uuid:%@ surface:%@ frame:%@", v11, v24, v16, v25];
    v55 = v30;
    v36 = [NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
    uint64_t v38 = v44;
    v37 = v46;
    uint64_t v39 = 1;
LABEL_18:
    v19 = [v37 errorWithDomain:v38 code:v39 userInfo:v36];

LABEL_19:
LABEL_20:

    xpc_object_t XPCObject = 0;
    goto LABEL_21;
  }
  v19 = 0;
LABEL_21:

  v13[2](v13, XPCObject, v19);
}

- (id)hostFrameForUUID:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  p_lock_cachedFrameOnGlassNow = &self->_lock_cachedFrameOnGlassNow;
  int v6 = [(BLSDiagnosticFlipbookFrame *)self->_lock_cachedFrameOnGlassNow uuid];
  char v7 = [v4 isEqual:v6];

  if ((v7 & 1) != 0
    || (p_lock_cachedFrameOnGlassNow = &self->_lock_cachedLastCancelledFrame,
        [(BLSDiagnosticFlipbookFrame *)self->_lock_cachedLastCancelledFrame uuid],
        id v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v4 isEqual:v8],
        v8,
        (v9 & 1) != 0))
  {
    id v10 = *p_lock_cachedFrameOnGlassNow;
    os_unfair_lock_unlock(&self->_lock);
    if (v10) {
      goto LABEL_7;
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  id v10 = [(BLSFlipbookDiagnosticsProviding *)self->_flipbookDiagnosticsProvider frameWithUUID:v4];
LABEL_7:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_cachedLastCancelledFrame, 0);
  objc_storeStrong((id *)&self->_lock_cachedFrameOnGlassNow, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);

  objc_storeStrong((id *)&self->_flipbookDiagnosticsProvider, 0);
}

- (void)allFlipbookFrames
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_ERROR, "%p allFlipbookFrames, use after invalidation", (uint8_t *)&v2, 0xCu);
}

- (void)_lock_validateHostFrame:(os_log_t)log source:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_21FCFC000, log, OS_LOG_TYPE_ERROR, "%p %{public}@, use after invalidation", (uint8_t *)&v3, 0x16u);
}

- (void)_lock_validateHostFrame:(uint64_t)a3 source:.cold.2(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  __int16 v5 = NSStringFromSelector(a1);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v9 = 138544642;
  id v10 = v5;
  OUTLINED_FUNCTION_0_1();
  __int16 v11 = 2048;
  uint64_t v12 = a2;
  __int16 v13 = v8;
  objc_super v14 = @"BLSHDiagnosticsHostPeer.m";
  __int16 v15 = 1024;
  int v16 = 133;
  __int16 v17 = v8;
  uint64_t v18 = a3;
  _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
}

@end