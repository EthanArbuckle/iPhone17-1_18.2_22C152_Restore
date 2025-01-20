@interface BCBrtControl
+ (id)copyAllAvailableControls;
+ (id)copyAvailableControls;
+ (id)newMonitorForAllControlsWithHandler:(id)a3 error:(id *)a4;
+ (id)newMonitorWithHandler:(id)a3 error:(id *)a4;
- (BCBrtControl)init;
- (BOOL)_checkIsValid:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)multipleControlEnabled;
- (BOOL)setNits:(double)a3 error:(id *)a4;
- (BOOL)setProperty:(id)a3 value:(id)a4 error:(id *)a5;
- (NSDictionary)capabilities;
- (NSUUID)containerID;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)queue;
- (OS_os_log)logHandle;
- (__CFUUID)cfContainerID;
- (double)getNitsWithError:(id *)a3;
- (double)maxNits;
- (double)minNits;
- (id)ID;
- (id)copyModuleIdentifier;
- (id)copyProperty:(id)a3 error:(id *)a4;
- (id)displayInvalidHandler;
- (unint64_t)hash;
- (void)_runOnCallbackQueue:(id)a3;
- (void)dealloc;
- (void)logHandle;
- (void)queue;
- (void)setCallbackQueue:(id)a3;
- (void)setDisplayInvalidHandler:(id)a3;
- (void)setDisplayService:(unsigned int)a3;
- (void)setMultipleControlEnabled:(BOOL)a3;
- (void)setNitsAsync:(double)a3 completionHandler:(id)a4;
- (void)setPropertyAync:(id)a3 value:(id)a4 completionHandler:(id)a5;
@end

@implementation BCBrtControl

+ (id)newMonitorWithHandler:(id)a3 error:(id *)a4
{
  return 0;
}

+ (id)copyAvailableControls
{
  return 0;
}

- (BCBrtControl)init
{
  v6.receiver = self;
  v6.super_class = (Class)BCBrtControl;
  v2 = [(BCBrtControl *)&v6 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x23EC8DDF0]();
    id v4 = [(BCBrtControl *)v2 copyModuleIdentifier];
    v2->_logHandle = 0;
    v2->_capabilities = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v2->_callbackQueue = 0;
    v2->_queue = 0;
    v2->_id = 0;
    v2->_isValid = 0;
    v2->_containerID = 0;
    v2->_cfContainerID = 0;
  }
  return v2;
}

- (void)dealloc
{
  queue = self->_queue;
  if (queue) {
    dispatch_release(queue);
  }

  id displayInvalidHandler = self->_displayInvalidHandler;
  if (displayInvalidHandler) {
    _Block_release(displayInvalidHandler);
  }

  cfContainerID = self->_cfContainerID;
  if (cfContainerID) {
    CFRelease(cfContainerID);
  }

  v6.receiver = self;
  v6.super_class = (Class)BCBrtControl;
  [(BCBrtControl *)&v6 dealloc];
}

- (id)copyModuleIdentifier
{
  id v2 = [NSString alloc];
  return (id)[v2 initWithString:@"com.apple.BCBrtControl"];
}

- (BOOL)_checkIsValid:(id *)a3
{
  BOOL v4 = [(BCBrtControl *)self isValid];
  BOOL v5 = v4;
  if (a3 && !v4) {
    *a3 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithBCError:18];
  }
  return v5;
}

- (OS_os_log)logHandle
{
  logHandle = self->_logHandle;
  if (!logHandle)
  {
    id v4 = [(BCBrtControl *)self copyModuleIdentifier];
    BOOL v5 = (OS_os_log *)os_log_create((const char *)[v4 UTF8String], "default");
    self->_logHandle = v5;
    if (!v5)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
      if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR)) {
        -[BCBrtControl logHandle](inited);
      }
    }

    logHandle = self->_logHandle;
  }
  if (logHandle) {
    return logHandle;
  }
  else {
    return (OS_os_log *)&_os_log_internal;
  }
}

- (OS_dispatch_queue)queue
{
  result = self->_queue;
  if (!result)
  {
    result = (OS_dispatch_queue *)dispatch_queue_create("com.apple.BrightnessControl", 0);
    self->_queue = result;
    if (!result) {
      -[BCBrtControl queue]();
    }
  }
  return result;
}

- (__CFUUID)cfContainerID
{
  if (!self->_containerID) {
    return 0;
  }
  result = self->_cfContainerID;
  if (!result)
  {
    id v4 = (void *)MEMORY[0x23EC8DDF0](0, a2);
    self->_cfContainerID = CFUUIDCreateFromString((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFStringRef)[(NSUUID *)self->_containerID UUIDString]);
    return self->_cfContainerID;
  }
  return result;
}

- (id)ID
{
  id result = self->_id;
  if (!result)
  {
    id v4 = (void *)MEMORY[0x23EC8DDF0](0, a2);
    id v5 = [NSString alloc];
    objc_super v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    if ([(BCBrtControl *)self containerID]) {
      v8 = (__CFString *)[(NSUUID *)[(BCBrtControl *)self containerID] description];
    }
    else {
      v8 = @"main";
    }
    self->_id = (NSString *)[v5 initWithFormat:@"%@-%@", v7, v8];
    return self->_id;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    return 0;
  }
  v7 = [(BCBrtControl *)self containerID];
  return v7 == (NSUUID *)[a3 containerID];
}

- (unint64_t)hash
{
  v3 = (void *)MEMORY[0x23EC8DDF0](self, a2);
  unint64_t v4 = objc_msgSend(-[BCBrtControl ID](self, "ID"), "hash");
  return v4;
}

- (BOOL)setNits:(double)a3 error:(id *)a4
{
  return 0;
}

- (void)_runOnCallbackQueue:(id)a3
{
  if ([(BCBrtControl *)self callbackQueue])
  {
    callbackQueue = self->_callbackQueue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __36__BCBrtControl__runOnCallbackQueue___block_invoke;
    v8[3] = &unk_264D10258;
    v8[4] = self;
    v8[5] = a3;
    dispatch_async(callbackQueue, v8);
  }
  else
  {
    objc_super v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF498];
    [v6 raise:v7 format:@"callbackQueue is nil. Cannot call user supplied callback."];
  }
}

void __36__BCBrtControl__runOnCallbackQueue___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) queue];
  v3 = *(void **)(a1 + 40);
  dispatch_sync(v2, v3);
}

- (void)setNitsAsync:(double)a3 completionHandler:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__BCBrtControl_setNitsAsync_completionHandler___block_invoke;
  v4[3] = &unk_264D10280;
  *(double *)&v4[6] = a3;
  v4[4] = self;
  v4[5] = a4;
  [(BCBrtControl *)self _runOnCallbackQueue:v4];
}

uint64_t __47__BCBrtControl_setNitsAsync_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v3 = 0;
  [*(id *)(a1 + 32) setNits:&v3 error:*(double *)(a1 + 48)];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

- (double)getNitsWithError:(id *)a3
{
  return -1.0;
}

- (BOOL)setProperty:(id)a3 value:(id)a4 error:(id *)a5
{
  if (a5) {
    *a5 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithBCError:16];
  }
  return 0;
}

- (void)setPropertyAync:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__BCBrtControl_setPropertyAync_value_completionHandler___block_invoke;
  v5[3] = &unk_264D102A8;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  v5[7] = a5;
  [(BCBrtControl *)self _runOnCallbackQueue:v5];
}

void __56__BCBrtControl_setPropertyAync_value_completionHandler___block_invoke(uint64_t a1)
{
  id v3 = 0;
  [*(id *)(a1 + 32) setProperty:*(void *)(a1 + 40) value:*(void *)(a1 + 48) error:&v3];
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2) {
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (id)copyProperty:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithBCError:16];
  }
  return 0;
}

- (void)setDisplayService:(unsigned int)a3
{
}

- (NSUUID)containerID
{
  return self->_containerID;
}

- (double)maxNits
{
  return self->_maxNits;
}

- (double)minNits
{
  return self->_minNits;
}

- (NSDictionary)capabilities
{
  return &self->_capabilities->super;
}

- (BOOL)multipleControlEnabled
{
  return self->_multipleControlEnabled;
}

- (void)setMultipleControlEnabled:(BOOL)a3
{
  self->_multipleControlEnabled = a3;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (id)displayInvalidHandler
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setDisplayInvalidHandler:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCallbackQueue:(id)a3
{
}

+ (id)newMonitorForAllControlsWithHandler:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_msgSend(v6, "addObject:", +[BCAppleBacklightBrtControl newMonitorWithHandler:error:](BCAppleBacklightBrtControl, "newMonitorWithHandler:error:", a3, a4));
  objc_msgSend(v6, "addObject:", +[BCHIDBrtControl newMonitorWithHandler:error:](BCHIDBrtControl, "newMonitorWithHandler:error:", a3, a4));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  v11 = objc_alloc_init(BCBrtMonitor);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __73__BCBrtControl_BCDisplayList__newMonitorForAllControlsWithHandler_error___block_invoke;
  v13[3] = &unk_264D10198;
  v13[4] = v6;
  [(BCBrtMonitor *)v11 setCancelHandler:v13];
  return v11;
}

void __73__BCBrtControl_BCDisplayList__newMonitorForAllControlsWithHandler_error___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * i) cancel];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

+ (id)copyAllAvailableControls
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v3 = (void *)MEMORY[0x23EC8DDF0]();
  objc_msgSend(v2, "addObjectsFromArray:", +[BCAppleBacklightBrtControl copyAvailableControls](BCAppleBacklightBrtControl, "copyAvailableControls"));
  objc_msgSend(v2, "addObjectsFromArray:", +[BCHIDBrtControl copyAvailableControls](BCHIDBrtControl, "copyAvailableControls"));
  return v2;
}

- (void)logHandle
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_238363000, log, OS_LOG_TYPE_ERROR, "Unable to create log handle", v1, 2u);
}

- (void)queue
{
}

@end