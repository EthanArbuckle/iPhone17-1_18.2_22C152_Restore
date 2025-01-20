@interface CBRampManager
+ (id)className;
- (BOOL)enableFrameSynchronisation;
- (BOOL)hasAnyActiveRamp;
- (BOOL)hasRampRunningForIdentifier:(id)a3;
- (BOOL)liveUpdates;
- (CBRampManager)init;
- (CBRampManager)initWithDisplayId:(unint64_t)a3;
- (float)remainingLength;
- (id)clockHandler;
- (id)copyStatusInfo;
- (id)insertNewLinearRampOrigin:(float)a3 target:(float)a4 length:(float)a5 frequency:(float)a6 identifier:(id)a7;
- (id)insertNewLinearRampOrigin:(float)a3 target:(float)a4 length:(float)a5 frequency:(float)a6 startRamp:(BOOL)a7 identifier:(id)a8;
- (id)insertNewRampOrigin:(float)a3 target:(float)a4 length:(float)a5 frequency:(float)a6 identifier:(id)a7 progressCallback:(id)a8;
- (id)insertNewRampOrigin:(float)a3 target:(float)a4 length:(float)a5 frequency:(float)a6 startRamp:(BOOL)a7 identifier:(id)a8 progressCallback:(id)a9;
- (id)rampDoneCallback;
- (id)rampForIdentifier:(id)a3;
- (void)activate;
- (void)cancel;
- (void)dealloc;
- (void)disableClocking;
- (void)enableClocking;
- (void)generateRamp;
- (void)insertRamp:(id)a3 identifier:(id)a4;
- (void)insertRamp:(id)a3 identifier:(id)a4 reevaluate:(BOOL)a5;
- (void)reevaluateClocking;
- (void)removeAllRamps;
- (void)removeRampWithIdentifier:(id)a3;
- (void)scheduleWithDispatchQueue:(id)a3;
- (void)setClockHandler:(id)a3;
- (void)setLiveUpdates:(BOOL)a3;
- (void)setRampDoneCallback:(id)a3;
- (void)setTimer;
- (void)startRamps;
- (void)stopTimer;
- (void)timerClockHandler;
- (void)updateRampsForTimestamp:(double)a3;
@end

@implementation CBRampManager

- (CBRampManager)init
{
  v12 = self;
  SEL v11 = a2;
  v10.receiver = self;
  v10.super_class = (Class)CBRampManager;
  v12 = [(CBRampManager *)&v10 init];
  if (v12)
  {
    id v9 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"%s.%s", "com.apple.CoreBrightness", objc_msgSend(+[CBRampManager className](CBRampManager, "className"), "cStringUsingEncoding:"));
    os_log_t v2 = os_log_create((const char *)[v9 cStringUsingEncoding:1], "default");
    v12->_logHandle = (OS_os_log *)v2;

    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v12->_ramps = v3;
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    LODWORD(v5) = info.denom;
    LODWORD(v4) = info.numer;
    v12->_sMachTimebaseFactor = (double)v4 / (double)v5 * 0.000000001;
    v6 = objc_alloc_init(CBFrameLink);
    v12->_frameLink = v6;
    if (v12->_frameLink) {
      v12->_enableFrameSynchronisation = 1;
    }
    v12->_liveUpdates = 1;
  }
  return v12;
}

- (CBRampManager)initWithDisplayId:(unint64_t)a3
{
  v15 = self;
  SEL v14 = a2;
  unint64_t v13 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CBRampManager;
  v15 = [(CBRampManager *)&v12 init];
  if (v15)
  {
    v15->_displayId = v13;
    id v11 = 0;
    id v9 = [NSString alloc];
    uint64_t v3 = objc_msgSend(+[CBRampManager className](CBRampManager, "className"), "cStringUsingEncoding:");
    id v11 = (id)objc_msgSend(v9, "initWithFormat:", @"%s.%s.%lu", "com.apple.CoreBrightness", v3, v15->_displayId);
    os_log_t v4 = os_log_create((const char *)[v11 cStringUsingEncoding:1], "default");
    v15->_logHandle = (OS_os_log *)v4;

    unint64_t v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v15->_ramps = v5;
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    LODWORD(v7) = info.denom;
    LODWORD(v6) = info.numer;
    v15->_sMachTimebaseFactor = (double)v6 / (double)v7 * 0.000000001;
    v15->_enableFrameSynchronisation = 1;
  }
  return v15;
}

- (void)dealloc
{
  os_log_t v4 = self;
  SEL v3 = a2;
  if (self->_logHandle) {

  }
  if (v4->_clockHandler) {
    _Block_release(v4->_clockHandler);
  }
  if (v4->_rampDoneCallback) {
    _Block_release(v4->_rampDoneCallback);
  }
  if (v4->_frameLink) {

  }
  if (v4->_queue)
  {
    dispatch_release((dispatch_object_t)v4->_queue);
    v4->_queue = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBRampManager;
  [(CBRampManager *)&v2 dealloc];
}

- (void)activate
{
  if (self->_enableFrameSynchronisation && self->_frameLink)
  {
    -[CBFrameLink setFrameNotificationBlock:](self->_frameLink, "setFrameNotificationBlock:");
    [(CBFrameLink *)self->_frameLink scheduleWithDispatchQueue:self->_queue];
  }
  self->_activated = 1;
  [(CBRampManager *)self reevaluateClocking];
}

uint64_t __25__CBRampManager_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateRampsForTimestamp:(double)mach_absolute_time() * *(double *)(*(void *)(a1 + 32) + 48)];
}

- (void)cancel
{
  if (self->_enableFrameSynchronisation) {
    [(CBFrameLink *)self->_frameLink invalidate];
  }
  self->_activated = 0;
}

- (void)scheduleWithDispatchQueue:(id)a3
{
  if (self->_queue)
  {
    dispatch_release((dispatch_object_t)self->_queue);
    self->_queue = 0;
  }
  if (a3)
  {
    self->_queue = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)self->_queue);
    [(CBFrameLink *)self->_frameLink scheduleWithDispatchQueue:a3];
  }
}

- (void)reevaluateClocking
{
  v8 = self;
  SEL v7 = a2;
  uint64_t v2 = 0;
  SEL v3 = (float *)&v2;
  int v4 = 0x20000000;
  int v5 = 32;
  int v6 = 0;
  if (self->_activated)
  {
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v8->_ramps, "enumerateKeysAndObjectsUsingBlock:");
    if (v3[6] != v8->_requiredFrequency)
    {
      v8->_requiredFrequency = v3[6];
      [(CBRampManager *)v8 enableClocking];
    }
  }
  _Block_object_dispose(&v2, 8);
}

uint64_t __35__CBRampManager_reevaluateClocking__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 frequency];
  uint64_t result = a1;
  if (v4 > *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t result = [a3 frequency];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
  }
  return result;
}

- (void)insertRamp:(id)a3 identifier:(id)a4
{
}

- (void)insertRamp:(id)a3 identifier:(id)a4 reevaluate:(BOOL)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v7 = a5;
  if (self->_logHandle)
  {
    logHandle = self->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v11, (uint64_t)a4, (uint64_t)a3);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Insert ramp: %@ | %@", v11, 0x16u);
  }
  [(NSMutableDictionary *)self->_ramps setObject:a3 forKeyedSubscript:a4];
  if (v7) {
    [(CBRampManager *)self reevaluateClocking];
  }
}

- (void)startRamps
{
}

- (id)insertNewRampOrigin:(float)a3 target:(float)a4 length:(float)a5 frequency:(float)a6 identifier:(id)a7 progressCallback:(id)a8
{
  return -[CBRampManager insertNewRampOrigin:target:length:frequency:startRamp:identifier:progressCallback:](self, "insertNewRampOrigin:target:length:frequency:startRamp:identifier:progressCallback:", 1, a7, a8, *(double *)&a3, *(double *)&a4, *(double *)&a5, *(double *)&a6, a8, a7, __PAIR64__(LODWORD(a5), LODWORD(a6)), __PAIR64__(LODWORD(a3), LODWORD(a4)), a2, self);
}

- (id)insertNewRampOrigin:(float)a3 target:(float)a4 length:(float)a5 frequency:(float)a6 startRamp:(BOOL)a7 identifier:(id)a8 progressCallback:(id)a9
{
  BOOL v18 = a7;
  id v9 = [CBRamp alloc];
  *(float *)&double v10 = a3;
  *(float *)&double v11 = a4;
  *(float *)&double v12 = a5;
  *(float *)&double v13 = a6;
  v15 = [(CBRamp *)v9 initWithOrigin:a8 target:v10 length:v11 frequency:v12 identifier:v13];
  [(CBRamp *)v15 setRampProgressCallback:a9];
  [(CBRampManager *)self insertRamp:v15 identifier:a8 reevaluate:v18];

  return v15;
}

- (id)insertNewLinearRampOrigin:(float)a3 target:(float)a4 length:(float)a5 frequency:(float)a6 identifier:(id)a7
{
  return [(CBRampManager *)self insertNewLinearRampOrigin:1 target:a7 length:*(double *)&a3 frequency:*(double *)&a4 startRamp:*(double *)&a5 identifier:*(double *)&a6];
}

- (id)insertNewLinearRampOrigin:(float)a3 target:(float)a4 length:(float)a5 frequency:(float)a6 startRamp:(BOOL)a7 identifier:(id)a8
{
  BOOL v11 = a7;
  id v9 = +[CBRamp newLinearRampWithWithOrigin:a8 target:*(double *)&a3 length:*(double *)&a4 frequency:*(double *)&a5 identifier:*(double *)&a6];
  [(CBRampManager *)self insertRamp:v9 identifier:a8 reevaluate:v11];

  return v9;
}

- (void)removeRampWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16 = self;
  SEL v15 = a2;
  id v14 = a3;
  os_log_t v13 = 0;
  if (self->_logHandle)
  {
    logHandle = v16->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  os_log_t v13 = logHandle;
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v17, [(NSMutableDictionary *)v16->_ramps objectForKey:v14], (uint64_t)v14);
    _os_log_impl(&dword_1BA438000, v13, v12, "Remove ramp: %@ | %@", v17, 0x16u);
  }
  [(NSMutableDictionary *)v16->_ramps removeObjectForKey:v14];
  if ([(NSMutableDictionary *)v16->_ramps count])
  {
    queue = v16->_queue;
    uint64_t block = MEMORY[0x1E4F143A8];
    int v7 = -1073741824;
    int v8 = 0;
    id v9 = __42__CBRampManager_removeRampWithIdentifier___block_invoke;
    double v10 = &unk_1E6218FE0;
    BOOL v11 = v16;
    dispatch_async(queue, &block);
  }
  else
  {
    v16->_requiredFrequency = 0.0;
    [(CBRampManager *)v16 disableClocking];
  }
}

uint64_t __42__CBRampManager_removeRampWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reevaluateClocking", a1, a1);
}

- (void)removeAllRamps
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (self->_logHandle)
  {
    logHandle = self->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v5, [(NSMutableDictionary *)self->_ramps count]);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Stop all ramps (%lu ongoing)", v5, 0xCu);
  }
  [(NSMutableDictionary *)self->_ramps removeAllObjects];
  self->_requiredFrequency = 0.0;
  [(CBRampManager *)self disableClocking];
}

- (BOOL)hasRampRunningForIdentifier:(id)a3
{
  return [(NSMutableDictionary *)self->_ramps objectForKey:a3] != 0;
}

- (BOOL)hasAnyActiveRamp
{
  return [(NSMutableDictionary *)self->_ramps count] != 0;
}

- (void)enableClocking
{
  if (self->_liveUpdates)
  {
    if (self->_enableFrameSynchronisation)
    {
      *(float *)&double v2 = self->_requiredFrequency;
      [(CBFrameLink *)self->_frameLink setPreferredFramesPerSecond:v2];
      [(CBFrameLink *)self->_frameLink resume];
    }
    else
    {
      [(CBRampManager *)self setTimer];
    }
  }
  else
  {
    [(CBRampManager *)self generateRamp];
  }
}

- (void)disableClocking
{
  if (self->_enableFrameSynchronisation) {
    [(CBFrameLink *)self->_frameLink pause];
  }
  else {
    [(CBRampManager *)self stopTimer];
  }
}

- (void)setTimer
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v24 = self;
  SEL v23 = a2;
  if (!self->_queue) {
    __assert_rtn("-[CBRampManager setTimer]", "CBRampManager.m", 288, "_queue");
  }
  float v22 = 0.0;
  float v2 = 1.0 / v24->_requiredFrequency;
  float v22 = v2;
  if (v24->_clockTimer)
  {
    dispatch_source_set_timer((dispatch_source_t)v24->_clockTimer, 0, (unint64_t)(float)(v22 * 1000000000.0), 0);
  }
  else
  {
    v24->_clockTimer = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v24->_queue);
    if (!v24->_clockTimer) {
      __assert_rtn("-[CBRampManager setTimer]", "CBRampManager.m", 296, "_clockTimer");
    }
    clockTimer = 0;
    clockTimer = v24->_clockTimer;
    os_log_t v20 = 0;
    if (v24->_logHandle)
    {
      logHandle = v24->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle = inited;
    }
    os_log_t v20 = logHandle;
    os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_2_8_0_8_0((uint64_t)v25, COERCE__INT64(v22), COERCE__INT64(v24->_requiredFrequency));
      _os_log_impl(&dword_1BA438000, v20, v19, "Setting timer with %f interval (%f Hz)", v25, 0x16u);
    }
    dispatch_source_set_timer((dispatch_source_t)v24->_clockTimer, 0, (unint64_t)(float)(v22 * 1000000000.0), 0);
    SEL v3 = v24->_clockTimer;
    uint64_t handler = MEMORY[0x1E4F143A8];
    int v14 = -1073741824;
    int v15 = 0;
    v16 = __25__CBRampManager_setTimer__block_invoke;
    v17 = &unk_1E6218FE0;
    uint64_t v18 = clockTimer;
    dispatch_source_set_cancel_handler(v3, &handler);
    dispatch_block_t aBlock = 0;
    uint64_t block = MEMORY[0x1E4F143A8];
    int v7 = -1073741824;
    int v8 = 0;
    id v9 = __25__CBRampManager_setTimer__block_invoke_2;
    double v10 = &unk_1E6218FE0;
    BOOL v11 = v24;
    dispatch_block_t aBlock = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_USER_INITIATED, 0, &block);
    if (!aBlock) {
      __assert_rtn("-[CBRampManager setTimer]", "CBRampManager.m", 312, "timerBlock");
    }
    dispatch_source_set_event_handler((dispatch_source_t)v24->_clockTimer, aBlock);
    _Block_release(aBlock);
    dispatch_resume((dispatch_object_t)v24->_clockTimer);
  }
}

void __25__CBRampManager_setTimer__block_invoke(uint64_t a1)
{
}

uint64_t __25__CBRampManager_setTimer__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "timerClockHandler", a1, a1);
}

- (void)stopTimer
{
  if (self->_clockTimer)
  {
    dispatch_source_cancel((dispatch_source_t)self->_clockTimer);
    self->_clockTimer = 0;
  }
}

- (void)timerClockHandler
{
}

- (void)generateRamp
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  os_log_type_t v19 = self;
  SEL v18 = a2;
  uint64_t v13 = 0;
  int v14 = (float *)&v13;
  int v15 = 0x20000000;
  int v16 = 32;
  int v17 = 0;
  uint64_t v8 = 0;
  id v9 = (float *)&v8;
  int v10 = 0x20000000;
  int v11 = 32;
  int v12 = 0;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_ramps, "enumerateKeysAndObjectsUsingBlock:");
  int v7 = (int)(ceil((float)(v14[6] * v9[6])) + 1.0);
  float v6 = 1.0 / v9[6];
  if (v19->_logHandle)
  {
    logHandle = v19->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_4_8_0_8_0_4_0_8_0((uint64_t)v20, COERCE__INT64(v9[6]), COERCE__INT64(v14[6]), v7, COERCE__INT64(v6));
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Frequency: %f, transition time: %f, N updates: %d, Portion: %f", v20, 0x26u);
  }
  double v5 = (double)mach_absolute_time() * v19->_sMachTimebaseFactor;
  for (int i = 0; i < v7; ++i)
    [(CBRampManager *)v19 updateRampsForTimestamp:v5 + (float)(v6 * (float)i)];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v13, 8);
}

uint64_t __29__CBRampManager_generateRamp__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  float v12 = *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  [a3 length];
  float v3 = *(float *)&v4;
  *(float *)&double v4 = v12;
  if (v12 < v3)
  {
    objc_msgSend(a3, "length", v4);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
  }
  float v10 = *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t result = [a3 frequency];
  float v7 = *(float *)&v8;
  *(float *)&double v8 = v10;
  if (v10 < v7)
  {
    uint64_t result = objc_msgSend(a3, "frequency", v8);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
  }
  return result;
}

- (void)updateRampsForTimestamp:(double)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableDictionary *)self->_ramps count])
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_ramps, "enumerateKeysAndObjectsUsingBlock:");
    if (self->_logHandle)
    {
      logHandle = self->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v11, (uint64_t)self->_ramps);
      _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "ramps clocked: %@", v11, 0xCu);
    }
    (*((void (**)(void))self->_clockHandler + 2))();
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_ramps, "enumerateKeysAndObjectsUsingBlock:");
    if ([v8 count])
    {
      if (self->_logHandle)
      {
        int v5 = self->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v4 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v4 = init_default_corebrightness_log();
        }
        int v5 = v4;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        os_log_t v3 = v5;
        __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)v8);
        _os_log_impl(&dword_1BA438000, v5, OS_LOG_TYPE_DEFAULT, "Finished ramps %@", v10, 0xCu);
      }
    }
    [v8 enumerateObjectsUsingBlock:v3];

    if (![(NSMutableDictionary *)self->_ramps count])
    {
      if (self->_rampDoneCallback) {
        (*((void (**)(void))self->_rampDoneCallback + 2))();
      }
    }
  }
}

uint64_t __41__CBRampManager_updateRampsForTimestamp___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 clockRamp:*(double *)(a1 + 32)];
}

uint64_t __41__CBRampManager_updateRampsForTimestamp___block_invoke_20(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 isFinished];
  if (result) {
    return [*(id *)(a1 + 32) addObject:a2];
  }
  return result;
}

uint64_t __41__CBRampManager_updateRampsForTimestamp___block_invoke_21(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeRampWithIdentifier:a2];
}

- (float)remainingLength
{
  float v10 = self;
  SEL v9 = a2;
  uint64_t v4 = 0;
  int v5 = (float *)&v4;
  int v6 = 0x20000000;
  int v7 = 32;
  int v8 = 0;
  if ([(CBRampManager *)self hasAnyActiveRamp]) {
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v10->_ramps, "enumerateKeysAndObjectsUsingBlock:");
  }
  float v3 = v5[6];
  _Block_object_dispose(&v4, 8);
  return v3;
}

float __32__CBRampManager_remainingLength__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (([a3 isFinished] & 1) == 0)
  {
    [a3 length];
    double v8 = v4;
    [a3 currentTimestamp];
    double v7 = v5;
    [a3 startTime];
    float result = v8 - (v7 - v6);
    if (result > *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    }
  }
  return result;
}

- (id)rampForIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_ramps objectForKeyedSubscript:a3];
}

- (id)copyStatusInfo
{
  v9[2] = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1BA9ECAE0]();
  id v6 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v8[0] = @"Ramps";
  v9[0] = [(NSMutableDictionary *)self->_ramps description];
  v8[1] = @"Frequency";
  *(float *)&double v2 = self->_requiredFrequency;
  v9[1] = [NSNumber numberWithFloat:v2];
  float v4 = objc_msgSend(v6, "initWithDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v9, v8, 2));
  return v4;
}

+ (id)className
{
  double v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)clockHandler
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setClockHandler:(id)a3
{
}

- (id)rampDoneCallback
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setRampDoneCallback:(id)a3
{
}

- (BOOL)enableFrameSynchronisation
{
  return self->_enableFrameSynchronisation;
}

- (BOOL)liveUpdates
{
  return self->_liveUpdates;
}

- (void)setLiveUpdates:(BOOL)a3
{
  self->_liveUpdates = a3;
}

@end