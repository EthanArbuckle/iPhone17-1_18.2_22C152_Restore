@interface CBAnalyticsManager
+ (BOOL)handleColorSample:(id)a3;
+ (id)sharedInstance;
+ (void)sendEventOnceADayLazy:(id)a3 andDict:(id)a4;
+ (void)stopReporting:(unint64_t)a3;
- (BOOL)handleColorSampleInternal:(id)a3;
- (BOOL)isFirstEventToday:(id)a3;
- (BOOL)isSameDay:(id)a3 asDay:(id)a4;
- (CBAnalyticsManager)init;
- (id)stringForType:(unint64_t)a3;
- (void)dealloc;
- (void)logAllColorSamples;
- (void)logColorSample:(id)a3 withType:(id)a4;
- (void)sendEventLazy:(id)a3 andDict:(id)a4;
- (void)sendEventOnceADayLazyInternal:(id)a3 andDict:(id)a4;
- (void)setUserActive:(BOOL)a3;
- (void)startReporting;
- (void)stopReportingInternal:(unint64_t)a3;
- (void)storeTimestamp:(id)a3 forEventName:(id)a4;
@end

@implementation CBAnalyticsManager

+ (id)sharedInstance
{
  id v11 = a1;
  SEL v10 = a2;
  objc_sync_enter(a1);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  v7 = __36__CBAnalyticsManager_sharedInstance__block_invoke;
  v8 = &unk_1E6218FE0;
  id v9 = v11;
  v13 = &sharedInstance_onceToken_2;
  v12 = &v4;
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(v13, v12);
  }
  objc_sync_exit(a1);
  return (id)sharedInstance__sharedObject_2;
}

uint64_t __36__CBAnalyticsManager_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v4 = a1;
  uint64_t v3 = a1;
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)&OBJC_METACLASS___CBAnalyticsManager;
  uint64_t result = objc_msgSend(objc_msgSendSuper2(&v2, sel_alloc), "init");
  sharedInstance__sharedObject_2 = result;
  return result;
}

- (CBAnalyticsManager)init
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v25 = self;
  SEL v24 = a2;
  v23.receiver = self;
  v23.super_class = (Class)CBAnalyticsManager;
  id v25 = [(CBAnalyticsManager *)&v23 init];
  if (!v25) {
    return (CBAnalyticsManager *)v25;
  }
  os_log_t v2 = os_log_create("com.apple.CoreBrightness.CBAnalyticsManager", "default");
  *((void *)v25 + 1) = v2;
  if (!*((void *)v25 + 1))
  {
    v22 = 0;
    v15 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    v22 = v15;
    char v21 = 16;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      log = v22;
      os_log_type_t type = v21;
      __os_log_helper_16_0_0(v20);
      _os_log_error_impl(&dword_1BA438000, log, type, "Failed to create log handle", v20, 2u);
    }
  }
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.CoreBrightness.CBAnalyticsManager", 0);
  *((void *)v25 + 2) = v3;
  if (*((void *)v25 + 2))
  {
    id v16 = +[CBPreferencesHandler copyPreferenceForAllUsersForKey:@"CoreAnalyticsTimestamps"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v16];
    }
    else {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    *((void *)v25 + 4) = v4;

    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *((void *)v25 + 5) = v5;
    *((unsigned char *)v25 + 48) = 1;
    if (*((void *)v25 + 1))
    {
      v8 = *((void *)v25 + 1);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      v8 = inited;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v27, *((void *)v25 + 4));
      _os_log_debug_impl(&dword_1BA438000, v8, OS_LOG_TYPE_DEBUG, "Init with timestamps {{%@}}", v27, 0xCu);
    }
    return (CBAnalyticsManager *)v25;
  }
  v19 = 0;
  if (*((void *)v25 + 1))
  {
    v12 = *((void *)v25 + 1);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v11 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v11 = init_default_corebrightness_log();
    }
    v12 = v11;
  }
  v19 = v12;
  char v18 = 16;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    id v9 = v19;
    os_log_type_t v10 = v18;
    __os_log_helper_16_0_0(v17);
    _os_log_error_impl(&dword_1BA438000, v9, v10, "failed to create dispatch queue", v17, 2u);
  }

  id v25 = 0;
  return 0;
}

- (void)dealloc
{
  id v4 = self;
  SEL v3 = a2;
  if (self->_logHandle)
  {

    v4->_logHandle = 0;
  }
  if (v4->_queue)
  {
    dispatch_release((dispatch_object_t)v4->_queue);
    v4->_queue = 0;
  }
  if (v4->_reportTimer)
  {
    dispatch_source_cancel((dispatch_source_t)v4->_reportTimer);
    dispatch_release((dispatch_object_t)v4->_reportTimer);
    v4->_reportTimer = 0;
  }

  v2.receiver = v4;
  v2.super_class = (Class)CBAnalyticsManager;
  [(CBAnalyticsManager *)&v2 dealloc];
}

- (void)storeTimestamp:(id)a3 forEventName:(id)a4
{
}

+ (BOOL)handleColorSample:(id)a3
{
  return [+[CBAnalyticsManager sharedInstance] handleColorSampleInternal:a3];
}

- (BOOL)handleColorSampleInternal:(id)a3
{
  char v21 = self;
  SEL v20 = a2;
  id v19 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  int v16 = 0x20000000;
  int v17 = 32;
  char v18 = 0;
  queue = self->_queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __48__CBAnalyticsManager_handleColorSampleInternal___block_invoke;
  os_log_type_t v10 = &unk_1E6219300;
  id v11 = a3;
  v12 = v21;
  v13 = &v14;
  dispatch_sync(queue, &block);
  char v5 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v5 & 1;
}

uint64_t __48__CBAnalyticsManager_handleColorSampleInternal___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(void *)(result + 32))
  {
    uint64_t result = objc_msgSend(*(id *)(*(void *)(result + 40) + 40), "setObject:forKey:", *(void *)(result + 32), objc_msgSend(*(id *)(result + 40), "stringForType:", objc_msgSend(*(id *)(result + 32), "type")));
    if (!*(void *)(*(void *)(v1 + 40) + 24)) {
      uint64_t result = [*(id *)(v1 + 40) startReporting];
    }
    *(unsigned char *)(*(void *)(*(void *)(v1 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (void)logAllColorSamples
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v17 = self;
  SEL v16 = a2;
  os_log_t v15 = 0;
  if (self->_logHandle)
  {
    logHandle = v17->_logHandle;
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
  os_log_t v15 = logHandle;
  os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v19, (uint64_t)v17->samples);
    _os_log_debug_impl(&dword_1BA438000, v15, v14, "Send ALS color samples %@", v19, 0xCu);
  }
  memset(__b, 0, sizeof(__b));
  id obj = (id)[(NSMutableDictionary *)v17->samples allKeys];
  uint64_t v9 = [obj countByEnumeratingWithState:__b objects:v18 count:16];
  if (v9)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0;
    unint64_t v7 = v9;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = 0;
      uint64_t v13 = *(void *)(__b[1] + 8 * v6);
      SEL v3 = v17;
      uint64_t v2 = [(NSMutableDictionary *)v17->samples objectForKey:v13];
      [(CBAnalyticsManager *)v3 logColorSample:v2 withType:v13];
      ++v6;
      if (v4 + 1 >= v7)
      {
        uint64_t v6 = 0;
        unint64_t v7 = [obj countByEnumeratingWithState:__b objects:v18 count:16];
        if (!v7) {
          break;
        }
      }
    }
  }
}

- (void)logColorSample:(id)a3 withType:(id)a4
{
  v19[10] = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1BA9ECAE0]();
  uint64_t v14 = 0;
  if ([a4 isEqualToString:@"Front"])
  {
    uint64_t v14 = [(NSMutableDictionary *)self->samples objectForKey:@"Rear"];
  }
  else if (([a4 isEqualToString:@"Rear"] & 1) != 0 {
         || ([a4 isEqualToString:@"Merged"] & 1) != 0)
  }
  {
    uint64_t v14 = [(NSMutableDictionary *)self->samples objectForKey:@"Front"];
  }
  v18[0] = @"Location";
  v19[0] = a4;
  v18[1] = @"Lux";
  uint64_t v6 = NSNumber;
  [a3 lux];
  v19[1] = objc_msgSend(v6, "numberWithDouble:");
  v18[2] = @"CCT";
  unint64_t v7 = NSNumber;
  [a3 CCT];
  v19[2] = objc_msgSend(v7, "numberWithDouble:");
  v18[3] = @"x";
  int v8 = NSNumber;
  [a3 xy];
  v19[3] = [v8 numberWithDouble:v4];
  v18[4] = @"y";
  uint64_t v9 = NSNumber;
  [a3 xy];
  v19[4] = [v9 numberWithDouble:v5];
  v18[5] = @"ColorBin";
  v19[5] = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "colorBin"));
  v18[6] = @"ColorDeltaE";
  os_log_type_t v10 = NSNumber;
  [a3 colorDeltaEWith:v14];
  v19[6] = objc_msgSend(v10, "numberWithDouble:");
  v18[7] = @"CCTDifference";
  id v11 = NSNumber;
  [a3 CCTDifferenceWith:v14];
  v19[7] = objc_msgSend(v11, "numberWithDouble:");
  v18[8] = @"LuxDifference";
  v12 = NSNumber;
  [a3 LuxDifferenceWith:v14];
  v19[8] = objc_msgSend(v12, "numberWithDouble:");
  v18[9] = @"Mode";
  v19[9] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "mode"));
  -[CBAnalyticsManager sendEventLazy:andDict:](self, "sendEventLazy:andDict:", @"com.apple.corebrightness.extdisplay.als.colorsample", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:10]);
}

+ (void)sendEventOnceADayLazy:(id)a3 andDict:(id)a4
{
}

- (void)sendEventOnceADayLazyInternal:(id)a3 andDict:(id)a4
{
  SEL v16 = self;
  SEL v15 = a2;
  id v14 = a3;
  id v13 = a4;
  queue = self->_queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = __60__CBAnalyticsManager_sendEventOnceADayLazyInternal_andDict___block_invoke;
  uint64_t v9 = &unk_1E62192B0;
  os_log_type_t v10 = v16;
  id v11 = a3;
  id v12 = a4;
  dispatch_sync(queue, &block);
}

void __60__CBAnalyticsManager_sendEventOnceADayLazyInternal_andDict___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isFirstEventToday:*(void *)(a1 + 40)])
  {
    if (*(void *)(*(void *)(a1 + 32) + 8))
    {
      double v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      double v4 = inited;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v7, *(void *)(a1 + 40), *(void *)(a1 + 48));
      _os_log_impl(&dword_1BA438000, v4, OS_LOG_TYPE_DEFAULT, "Event {%@} has been already sent today {{%@}}", v7, 0x16u);
    }
  }
  else
  {
    if (*(void *)(*(void *)(a1 + 32) + 8))
    {
      uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v1 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v1 = init_default_corebrightness_log();
      }
      uint64_t v2 = v1;
    }
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v6, *(void *)(a1 + 40), *(void *)(a1 + 48));
      _os_log_impl(&dword_1BA438000, v2, OS_LOG_TYPE_DEFAULT, "First event today {%@} -> send event {{%@}}", v6, 0x16u);
    }
    [*(id *)(a1 + 32) sendEventLazy:*(void *)(a1 + 40) andDict:*(void *)(a1 + 48)];
  }
}

- (void)sendEventLazy:(id)a3 andDict:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
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
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v8, (uint64_t)a3, (uint64_t)a4);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Send event %@ {{%@}}", v8, 0x16u);
  }
  AnalyticsSendEventLazy();
}

uint64_t __44__CBAnalyticsManager_sendEventLazy_andDict___block_invoke(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

- (void)startReporting
{
  id v19 = self;
  SEL v18 = a2;
  if (self->_userActive)
  {
    int v17 = 0;
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
    int v17 = logHandle;
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      log = v17;
      os_log_type_t type = v16;
      __os_log_helper_16_0_0(v15);
      _os_log_impl(&dword_1BA438000, log, type, "Start CoreAnalytics reporting", v15, 2u);
    }
    uint64_t v14 = 1000000000;
    if (!v19->_reportTimer)
    {
      dispatch_source_t v2 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v19->_queue);
      v19->_reportTimer = (OS_dispatch_source *)v2;
    }
    if (v19->_reportTimer)
    {
      reportTimer = v19->_reportTimer;
      uint64_t handler = MEMORY[0x1E4F143A8];
      int v9 = -1073741824;
      int v10 = 0;
      id v11 = __36__CBAnalyticsManager_startReporting__block_invoke;
      id v12 = &unk_1E6218FE0;
      id v13 = v19;
      dispatch_source_set_event_handler(reportTimer, &handler);
      dispatch_source_set_timer((dispatch_source_t)v19->_reportTimer, v14, v14, 0xC8uLL);
      dispatch_resume((dispatch_object_t)v19->_reportTimer);
    }
  }
}

uint64_t __36__CBAnalyticsManager_startReporting__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "logAllColorSamples", a1, a1);
}

+ (void)stopReporting:(unint64_t)a3
{
}

- (void)setUserActive:(BOOL)a3
{
  id v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  queue = self->_queue;
  uint64_t v4 = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __36__CBAnalyticsManager_setUserActive___block_invoke;
  uint64_t v8 = &unk_1E62193A0;
  int v9 = v13;
  BOOL v10 = a3;
  dispatch_sync(queue, &v4);
}

void __36__CBAnalyticsManager_setUserActive___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  os_log_t v12 = 0;
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    int v6 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    int v6 = inited;
  }
  os_log_t v12 = v6;
  os_log_type_t v11 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_0_2_4_0_4_0((uint64_t)v15, *(unsigned char *)(a1 + 40) & 1, *(unsigned char *)(*(void *)(a1 + 32) + 48) & 1);
    _os_log_impl(&dword_1BA438000, v12, v11, "CBAnalyticsManager setUserActive=%d _userActive=%d", v15, 0xEu);
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 48) & 1) != (*(unsigned char *)(a1 + 40) & 1))
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 48) = *(unsigned char *)(a1 + 40) & 1;
    if (*(unsigned char *)(a1 + 40))
    {
      if ([*(id *)(*(void *)(a1 + 32) + 40) count])
      {
        if (!*(void *)(*(void *)(a1 + 32) + 24)) {
          [*(id *)(a1 + 32) startReporting];
        }
      }
    }
    else if (*(void *)(*(void *)(a1 + 32) + 24))
    {
      BOOL v10 = 0;
      if (*(void *)(*(void *)(a1 + 32) + 8))
      {
        uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v3 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v3 = init_default_corebrightness_log();
        }
        uint64_t v4 = v3;
      }
      BOOL v10 = v4;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v1 = v10;
        os_log_type_t v2 = v9;
        __os_log_helper_16_0_0(v8);
        _os_log_impl(&dword_1BA438000, v1, v2, "User is inactive -> Stop CoreAnalytics reporting", v8, 2u);
      }
      dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 24));
      dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 24));
      *(void *)(*(void *)(a1 + 32) + 24) = 0;
    }
  }
}

- (void)stopReportingInternal:(unint64_t)a3
{
  uint64_t v13 = self;
  SEL v12 = a2;
  unint64_t v11 = a3;
  queue = self->_queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __44__CBAnalyticsManager_stopReportingInternal___block_invoke;
  uint64_t v8 = &unk_1E6219538;
  os_log_type_t v9 = v13;
  unint64_t v10 = a3;
  dispatch_sync(queue, &block);
}

void __44__CBAnalyticsManager_stopReportingInternal___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 32), "stringForType:", *(void *)(a1 + 40)));
  os_log_t v12 = 0;
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    int v6 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    int v6 = inited;
  }
  os_log_t v12 = v6;
  os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v15, [*(id *)(a1 + 32) stringForType:*(void *)(a1 + 40)]);
    _os_log_debug_impl(&dword_1BA438000, v12, v11, "%@ sensor removed from reported samples.", v15, 0xCu);
  }
  if (![*(id *)(*(void *)(a1 + 32) + 40) count] && *(void *)(*(void *)(a1 + 32) + 24))
  {
    unint64_t v10 = 0;
    if (*(void *)(*(void *)(a1 + 32) + 8))
    {
      uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v3 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v3 = init_default_corebrightness_log();
      }
      uint64_t v4 = v3;
    }
    unint64_t v10 = v4;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v1 = v10;
      os_log_type_t v2 = v9;
      __os_log_helper_16_0_0(v8);
      _os_log_impl(&dword_1BA438000, v1, v2, "No ALS sample -> Stop CoreAnalytics reporting", v8, 2u);
    }
    dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 24));
    dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 24));
    *(void *)(*(void *)(a1 + 32) + 24) = 0;
  }
}

- (BOOL)isFirstEventToday:(id)a3
{
  char v6 = 0;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  uint64_t v4 = [(NSMutableDictionary *)self->_timestamps objectForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([(CBAnalyticsManager *)self isSameDay:v5 asDay:v4])
    {
      char v6 = 1;
    }
    else
    {
      char v6 = 0;
      [(CBAnalyticsManager *)self storeTimestamp:v5 forEventName:a3];
    }
  }
  else
  {
    [(CBAnalyticsManager *)self storeTimestamp:v5 forEventName:a3];
  }

  return v6 & 1;
}

- (BOOL)isSameDay:(id)a3 asDay:(id)a4
{
  os_log_type_t v11 = (void *)[MEMORY[0x1E4F1C9A8] currentCalendar];
  unint64_t v10 = (void *)[v11 components:28 fromDate:a3];
  os_log_type_t v9 = (void *)[v11 components:28 fromDate:a4];
  uint64_t v7 = [v10 day];
  BOOL v8 = 0;
  if (v7 == [v9 day])
  {
    uint64_t v6 = [v10 month];
    BOOL v8 = 0;
    if (v6 == [v9 month])
    {
      uint64_t v5 = [v10 year];
      return v5 == [v9 year];
    }
  }
  return v8;
}

- (id)stringForType:(unint64_t)a3
{
  uint64_t v4 = @"Unknown";
  switch(a3)
  {
    case 1uLL:
      return @"Front";
    case 2uLL:
      return @"Rear";
    case 3uLL:
      return @"Merged";
  }
  return v4;
}

@end