@interface JFXThermalMonitor
+ (id)sharedInstance;
+ (id)stringFromThermalPressureLevel:(int)a3;
+ (void)enumerateThermalPressureLevel:(id)a3;
- (BOOL)_disabledThermalTracking;
- (BOOL)_updateThermalLevelsWithToken:(int)a3;
- (BOOL)hasGoneAboveNominal;
- (BOOL)thermalLevelExceededNominal;
- (JFXThermalMonitor)init;
- (OS_dispatch_queue)queue;
- (id)_analyticValueForThermalLevelBefore:(int)a3 after:(int)a4;
- (id)thermalLevelLabel;
- (int)currentThermalLevel;
- (int)highestThermalLevel;
- (int)highestThermalLevelReached;
- (int)thermalLevel;
- (void)_postNotification:(id)a3;
- (void)setCurrentThermalLevel:(int)a3;
- (void)setHasGoneAboveNominal:(BOOL)a3;
- (void)setHighestThermalLevel:(int)a3;
- (void)setQueue:(id)a3;
@end

@implementation JFXThermalMonitor

- (JFXThermalMonitor)init
{
  v21.receiver = self;
  v21.super_class = (Class)JFXThermalMonitor;
  v2 = [(JFXThermalMonitor *)&v21 init];
  v3 = [MEMORY[0x263F086E0] mainBundle];
  v4 = [v3 bundleIdentifier];

  v5 = [NSString stringWithFormat:@"%@.JFXThermalMonitor", v4];
  [(JFXThermalMonitor *)v2 setHighestThermalLevel:0];
  [(JFXThermalMonitor *)v2 setCurrentThermalLevel:0];
  id v6 = v5;
  dispatch_queue_t v7 = dispatch_queue_create((const char *)[v6 UTF8String], 0);
  [(JFXThermalMonitor *)v2 setQueue:v7];

  v8 = [(JFXThermalMonitor *)v2 queue];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __25__JFXThermalMonitor_init__block_invoke;
  handler[3] = &unk_264C0A9C8;
  v9 = v2;
  v20 = v9;
  uint32_t v10 = notify_register_dispatch("com.apple.system.thermalpressurelevel", &init_s_token, v8, handler);

  if (v10)
  {
    v11 = JFXLog_core();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_234C41000, v11, OS_LOG_TYPE_DEFAULT, "unable to notify_register_dispatch", buf, 2u);
    }
    v12 = 0;
  }
  else
  {
    v13 = [(JFXThermalMonitor *)v9 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __25__JFXThermalMonitor_init__block_invoke_14;
    block[3] = &unk_264C09FA8;
    v14 = v9;
    p_super = &v14->super;
    dispatch_async(v13, block);

    v12 = v14;
    v11 = p_super;
  }

  return v12;
}

void __25__JFXThermalMonitor_init__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v4 = [*(id *)(a1 + 32) currentThermalLevel];
  if ([*(id *)(a1 + 32) _updateThermalLevelsWithToken:a2])
  {
    uint64_t v5 = [*(id *)(a1 + 32) currentThermalLevel];
    id v6 = [*(id *)(a1 + 32) _analyticValueForThermalLevelBefore:v4 after:v5];
    if (v6)
    {
      dispatch_queue_t v7 = +[JFXAnalyticsManager sharedInstance];
      [v7 trackEventWithName:v6];
    }
    [*(id *)(a1 + 32) _postNotification:v6];
    v8 = JFXLog_core();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [NSString stringFromOSThermalPressureLevel:v4];
      uint64_t v10 = [v9 UTF8String];
      id v11 = [NSString stringFromOSThermalPressureLevel:v5];
      uint64_t v12 = [v11 UTF8String];
      objc_msgSend(NSString, "stringFromOSThermalPressureLevel:", objc_msgSend(*(id *)(a1 + 32), "highestThermalLevel"));
      id v13 = objc_claimAutoreleasedReturnValue();
      int v14 = 136315650;
      uint64_t v15 = v10;
      __int16 v16 = 2080;
      uint64_t v17 = v12;
      __int16 v18 = 2080;
      uint64_t v19 = [v13 UTF8String];
      _os_log_impl(&dword_234C41000, v8, OS_LOG_TYPE_DEFAULT, "thermal change: %s => %s (highest: %s)", (uint8_t *)&v14, 0x20u);
    }
  }
}

uint64_t __25__JFXThermalMonitor_init__block_invoke_14(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateThermalLevelsWithToken:init_s_token];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1) {
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_38);
  }
  v2 = (void *)sharedInstance_s_sharedInstance_1;
  return v2;
}

uint64_t __35__JFXThermalMonitor_sharedInstance__block_invoke()
{
  sharedInstance_s_sharedInstance_1 = objc_alloc_init(JFXThermalMonitor);
  return MEMORY[0x270F9A758]();
}

+ (void)enumerateThermalPressureLevel:(id)a3
{
  uint64_t v4 = 0;
  do
  {
    char v6 = 0;
    (*((void (**)(id, void, char *))a3 + 2))(a3, dword_234D61440[v4], &v6);
    if (v6) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = v4 == 5;
    }
    ++v4;
  }
  while (!v5);
}

+ (id)stringFromThermalPressureLevel:(int)a3
{
  v3 = @"Nominal";
  uint64_t v4 = @"Heavy";
  BOOL v5 = @"Trapping";
  char v6 = @"Sleeping";
  if (a3 != 50) {
    char v6 = @"Nominal";
  }
  if (a3 != 40) {
    BOOL v5 = v6;
  }
  if (a3 != 30) {
    uint64_t v4 = v5;
  }
  if (a3 == 20) {
    v3 = @"Moderate";
  }
  if (a3 == 10) {
    v3 = @"Light";
  }
  if (a3 <= 29) {
    return v3;
  }
  else {
    return v4;
  }
}

- (BOOL)thermalLevelExceededNominal
{
  if ([(JFXThermalMonitor *)self _disabledThermalTracking]) {
    return 0;
  }
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  uint64_t v4 = [(JFXThermalMonitor *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__JFXThermalMonitor_thermalLevelExceededNominal__block_invoke;
  v6[3] = &unk_264C09EE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  BOOL v3 = *((unsigned char *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __48__JFXThermalMonitor_thermalLevelExceededNominal__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) highestThermalLevel];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (int)thermalLevel
{
  if ([(JFXThermalMonitor *)self _disabledThermalTracking]) {
    return 0;
  }
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  uint64_t v4 = [(JFXThermalMonitor *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__JFXThermalMonitor_thermalLevel__block_invoke;
  v6[3] = &unk_264C09EE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  int v3 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __33__JFXThermalMonitor_thermalLevel__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) currentThermalLevel];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)highestThermalLevelReached
{
  if ([(JFXThermalMonitor *)self _disabledThermalTracking]) {
    return 0;
  }
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  uint64_t v4 = [(JFXThermalMonitor *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__JFXThermalMonitor_highestThermalLevelReached__block_invoke;
  v6[3] = &unk_264C09EE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  int v3 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __47__JFXThermalMonitor_highestThermalLevelReached__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) highestThermalLevel];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)thermalLevelLabel
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  int v10 = __Block_byref_object_copy__14;
  id v11 = __Block_byref_object_dispose__14;
  id v12 = 0;
  int v3 = [(JFXThermalMonitor *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__JFXThermalMonitor_thermalLevelLabel__block_invoke;
  v6[3] = &unk_264C09EE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __38__JFXThermalMonitor_thermalLevelLabel__block_invoke(uint64_t a1)
{
  v2 = NSString;
  uint64_t v3 = [*(id *)(a1 + 32) currentThermalLevel];
  int v4 = [*(id *)(a1 + 32) _disabledThermalTracking];
  BOOL v5 = &stru_26E7CDB50;
  if (v4) {
    BOOL v5 = @"*";
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [v2 stringWithFormat:@"T %d%@", v3, v5];
  return MEMORY[0x270F9A758]();
}

- (BOOL)_updateThermalLevelsWithToken:(int)a3
{
  uint64_t state64 = 0;
  uint32_t state = notify_get_state(a3, &state64);
  if (!state)
  {
    [(JFXThermalMonitor *)self setCurrentThermalLevel:state64];
    unsigned int v5 = [(JFXThermalMonitor *)self currentThermalLevel];
    if (v5 > [(JFXThermalMonitor *)self highestThermalLevel]) {
      [(JFXThermalMonitor *)self setHighestThermalLevel:[(JFXThermalMonitor *)self currentThermalLevel]];
    }
  }
  return state == 0;
}

- (void)_postNotification:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__JFXThermalMonitor__postNotification___block_invoke;
  block[3] = &unk_264C09FA8;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __39__JFXThermalMonitor__postNotification___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v4 = @"JFXThermalMonitorLevelChangedKey";
    v5[0] = v1;
    v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  }
  else
  {
    v2 = 0;
  }
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"JFXThermalMonitorLevelChangedNotification" object:0 userInfo:v2];
}

- (BOOL)_disabledThermalTracking
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v3 = [v2 valueForKey:@"JFXDisableThermalTrackingKey"];
  id v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)_analyticValueForThermalLevelBefore:(int)a3 after:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  if (_analyticValueForThermalLevelBefore_after__onceToken != -1) {
    dispatch_once(&_analyticValueForThermalLevelBefore_after__onceToken, &__block_literal_global_48);
  }
  id v6 = NSString;
  uint64_t v7 = [NSString stringFromOSThermalPressureLevel:v5];
  v8 = [NSString stringFromOSThermalPressureLevel:v4];
  uint64_t v9 = [v6 stringWithFormat:@"%@ %@", v7, v8];

  int v10 = [(id)_analyticValueForThermalLevelBefore_after__s_thermalAnalyticValueLookup objectForKeyedSubscript:v9];

  return v10;
}

void __63__JFXThermalMonitor__analyticValueForThermalLevelBefore_after___block_invoke()
{
  v11[10] = *MEMORY[0x263EF8340];
  v11[0] = @"thermalnominaltolight";
  v11[1] = @"thermallighttomoderate";
  v11[2] = @"thermalmoderatetoheavy";
  v11[3] = @"thermalheavytotrapping";
  v11[4] = @"thermaltrappingtosleeping";
  v11[5] = @"thermalsleepingtotrapping";
  v11[6] = @"thermaltrappingtoheavy";
  v11[7] = @"thermalheavytomoderate";
  v11[8] = @"thermalmoderatetolight";
  v11[9] = @"thermallighttonominal";
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:10];
  uint64_t v1 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:10];
  v2 = (void *)_analyticValueForThermalLevelBefore_after__s_thermalAnalyticValueLookup;
  _analyticValueForThermalLevelBefore_after__s_thermalAnalyticValueLookup = v1;

  if ([v0 count])
  {
    unint64_t v3 = 0;
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    do
    {
      id v6 = v5;
      uint64_t v7 = v4;
      v8 = NSString;
      uint64_t v9 = [NSString stringFromOSThermalPressureLevel:dword_234D61458[v3]];
      int v10 = [NSString stringFromOSThermalPressureLevel:dword_234D61480[v3]];
      uint64_t v5 = [v8 stringWithFormat:@"%@ %@", v9, v10];

      uint64_t v4 = [v0 objectAtIndexedSubscript:v3];

      [(id)_analyticValueForThermalLevelBefore_after__s_thermalAnalyticValueLookup setObject:v4 forKeyedSubscript:v5];
      ++v3;
    }
    while (v3 < [v0 count]);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)hasGoneAboveNominal
{
  return self->_hasGoneAboveNominal;
}

- (void)setHasGoneAboveNominal:(BOOL)a3
{
  self->_hasGoneAboveNominal = a3;
}

- (int)currentThermalLevel
{
  return self->_currentThermalLevel;
}

- (void)setCurrentThermalLevel:(int)a3
{
  self->_currentThermalLevel = a3;
}

- (int)highestThermalLevel
{
  return self->_highestThermalLevel;
}

- (void)setHighestThermalLevel:(int)a3
{
  self->_highestThermalLevel = a3;
}

- (void).cxx_destruct
{
}

@end