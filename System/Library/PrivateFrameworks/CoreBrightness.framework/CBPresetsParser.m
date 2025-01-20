@interface CBPresetsParser
+ (id)sharedInstance;
- (BOOL)autoBrightnessDisabledForDisplay:(unint64_t)a3;
- (BOOL)brightnessDisabledForDisplay:(unint64_t)a3;
- (BOOL)nightShiftDisabled;
- (BOOL)referenceMode:(unint64_t)a3;
- (BOOL)trueToneDisabled;
- (CBPresetsParser)init;
- (float)maxSDRLuminanceForDisplay:(unint64_t)a3;
- (void)dealloc;
- (void)refreshPresetState;
- (void)setDisplayList:(id)a3;
@end

@implementation CBPresetsParser

+ (id)sharedInstance
{
  objc_sync_enter(a1);
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_2);
  }
  v3 = (void *)sharedInstance__sharedObject_0;
  objc_sync_exit(a1);
  return v3;
}

CBPresetsParser *__33__CBPresetsParser_sharedInstance__block_invoke()
{
  result = objc_alloc_init(CBPresetsParser);
  sharedInstance__sharedObject_0 = (uint64_t)result;
  return result;
}

- (CBPresetsParser)init
{
  v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)CBPresetsParser;
  v7 = [(CBPresetsParser *)&v5 init];
  if (v7)
  {
    v2 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v7->_displayPresets = v2;
    os_log_t v3 = os_log_create("com.apple.CoreBrightness.CBPresetsParser", "default");
    v7->_logHandle = (OS_os_log *)v3;
  }
  return v7;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;

  if (v4->_logHandle)
  {

    v4->_logHandle = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBPresetsParser;
  [(CBPresetsParser *)&v2 dealloc];
}

- (void)setDisplayList:(id)a3
{
  self->_displayList = (NSArray *)[a3 copy];
  [(CBPresetsParser *)self refreshPresetState];
  objc_sync_exit(self);
}

- (void)refreshPresetState
{
  v13 = self;
  SEL v12 = a2;
  uint64_t v2 = objc_sync_enter(self);
  context = (void *)MEMORY[0x1BA9ECAE0](v2);
  [(NSMutableDictionary *)v13->_displayPresets removeAllObjects];
  displayList = v13->_displayList;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  int v7 = -1073741824;
  int v8 = 0;
  v9 = __37__CBPresetsParser_refreshPresetState__block_invoke;
  v10 = &unk_1E62195B8;
  v11 = v13;
  -[NSArray enumerateObjectsUsingBlock:](displayList, "enumerateObjectsUsingBlock:");
  objc_sync_exit(self);
}

void __37__CBPresetsParser_refreshPresetState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v5 = +[CBPreset newActive:](CBPreset, "newActive:", [a2 unsignedIntValue]);
  if (v5)
  {
    [*(id *)(*(void *)(a1 + 32) + 16) setObject:v5 forKey:a2];
    if (*(void *)(*(void *)(a1 + 32) + 24))
    {
      SEL v3 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      SEL v3 = inited;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v7, (uint64_t)a2, (uint64_t)v5);
      _os_log_impl(&dword_1BA438000, v3, OS_LOG_TYPE_INFO, "Presets: display %@ updated info: %@", v7, 0x16u);
    }
  }
}

- (BOOL)trueToneDisabled
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14 = self;
  SEL v13 = a2;
  objc_sync_enter(self);
  uint64_t v8 = 0;
  v9 = &v8;
  int v10 = 0x20000000;
  int v11 = 32;
  char v12 = 0;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v14->_displayPresets, "enumerateKeysAndObjectsUsingBlock:");
  if (v14->_logHandle)
  {
    logHandle = v14->_logHandle;
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
    if (v9[3]) {
      uint64_t v2 = "disable";
    }
    else {
      uint64_t v2 = "enable";
    }
    __os_log_helper_16_2_1_8_32((uint64_t)v15, (uint64_t)v2);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "Presets: %s true tone", v15, 0xCu);
  }
  char v4 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  objc_sync_exit(self);
  return v4 & 1;
}

uint64_t __35__CBPresetsParser_trueToneDisabled__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  char v3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t result = 1;
  char v6 = 1;
  if ((v3 & 1) == 0)
  {
    uint64_t result = [a3 trueToneDisabled];
    char v6 = result;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6 & 1;
  return result;
}

- (BOOL)nightShiftDisabled
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14 = self;
  SEL v13 = a2;
  objc_sync_enter(self);
  uint64_t v8 = 0;
  v9 = &v8;
  int v10 = 0x20000000;
  int v11 = 32;
  char v12 = 0;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v14->_displayPresets, "enumerateKeysAndObjectsUsingBlock:");
  if (v14->_logHandle)
  {
    logHandle = v14->_logHandle;
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
    if (v9[3]) {
      uint64_t v2 = "disable";
    }
    else {
      uint64_t v2 = "enable";
    }
    __os_log_helper_16_2_1_8_32((uint64_t)v15, (uint64_t)v2);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "Presets: %s night-shift", v15, 0xCu);
  }
  char v4 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  objc_sync_exit(self);
  return v4 & 1;
}

uint64_t __37__CBPresetsParser_nightShiftDisabled__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  char v3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t result = 1;
  char v6 = 1;
  if ((v3 & 1) == 0)
  {
    uint64_t result = [a3 nightShiftDisabled];
    char v6 = result;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6 & 1;
  return result;
}

- (BOOL)autoBrightnessDisabledForDisplay:(unint64_t)a3
{
  v19 = self;
  SEL v18 = a2;
  unint64_t v17 = a3;
  uint64_t v3 = objc_sync_enter(self);
  char v16 = 0;
  context = (void *)MEMORY[0x1BA9ECAE0](v3);
  id v15 = 0;
  id v15 = (id)-[NSMutableDictionary objectForKey:](v19->_displayPresets, "objectForKey:", [NSNumber numberWithUnsignedInteger:v17]);
  if (v15)
  {
    v14 = 0;
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
    v14 = logHandle;
    char v13 = 2;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      log = v14;
      os_log_type_t type = v13;
      __os_log_helper_16_0_0(v12);
      _os_log_debug_impl(&dword_1BA438000, log, type, "Presets: disable auto-brightness updates", v12, 2u);
    }
    char v16 = [v15 autoBrighnessDisabled] & 1;
  }
  char v5 = v16;
  objc_sync_exit(self);
  return v5 & 1;
}

- (float)maxSDRLuminanceForDisplay:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_sync_enter(self);
  float v11 = 0.0;
  context = (void *)MEMORY[0x1BA9ECAE0](v3);
  int v10 = (void *)-[NSMutableDictionary objectForKey:](self->_displayPresets, "objectForKey:", [NSNumber numberWithUnsignedInteger:a3]);
  if (v10)
  {
    [v10 maxSDRLuminance];
    float v11 = v4;
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
      __os_log_helper_16_0_2_8_0_8_0((uint64_t)v14, a3, COERCE__INT64(v11));
      _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "Presets(%lu): Aurora in maxSDRLuminance: %f", v14, 0x16u);
    }
  }
  objc_sync_exit(self);
  return v11;
}

- (BOOL)brightnessDisabledForDisplay:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_sync_enter(self);
  char v10 = 0;
  context = (void *)MEMORY[0x1BA9ECAE0](v3);
  v9 = (void *)-[NSMutableDictionary objectForKey:](self->_displayPresets, "objectForKey:", [NSNumber numberWithUnsignedInteger:a3]);
  if (v9)
  {
    char v10 = [v9 brightnessDisabled] & 1;
    if (v10)
    {
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
        __os_log_helper_16_0_1_8_0((uint64_t)v13, a3);
        _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "Presets(%lu): lock brightness updates", v13, 0xCu);
      }
    }
  }
  objc_sync_exit(self);
  return v10 & 1;
}

- (BOOL)referenceMode:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_sync_enter(self);
  context = (void *)MEMORY[0x1BA9ECAE0](v3);
  char v10 = 0;
  v9 = (void *)-[NSMutableDictionary objectForKey:](self->_displayPresets, "objectForKey:", [NSNumber numberWithUnsignedInteger:a3]);
  if (v9)
  {
    char v10 = [v9 referenceMode] & 1;
    if (v10)
    {
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
        __os_log_helper_16_0_2_8_0_4_0((uint64_t)v13, a3, v10 & 1);
        _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "Presets(%lu): reference mode = %d", v13, 0x12u);
      }
    }
  }
  objc_sync_exit(self);
  return v10 & 1;
}

@end