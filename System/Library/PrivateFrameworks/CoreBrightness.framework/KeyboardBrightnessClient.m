@interface KeyboardBrightnessClient
- (BOOL)enableAutoBrightness:(BOOL)a3 forKeyboard:(unint64_t)a4;
- (BOOL)isAmbientFeatureAvailableOnKeyboard:(unint64_t)a3;
- (BOOL)isAutoBrightnessEnabledForKeyboard:(unint64_t)a3;
- (BOOL)isBacklightDimmedOnKeyboard:(unint64_t)a3;
- (BOOL)isBacklightSaturatedOnKeyboard:(unint64_t)a3;
- (BOOL)isBacklightSuppressedOnKeyboard:(unint64_t)a3;
- (BOOL)isIdleDimmingSuspendedOnKeyboard:(unint64_t)a3;
- (BOOL)isKeyboardBuiltIn:(unint64_t)a3;
- (BOOL)setBrightness:(float)a3 fadeSpeed:(int)a4 commit:(BOOL)a5 forKeyboard:(unint64_t)a6;
- (BOOL)setBrightness:(float)a3 forKeyboard:(unint64_t)a4;
- (BOOL)setIdleDimTime:(double)a3 forKeyboard:(unint64_t)a4;
- (BOOL)suspendIdleDimming:(BOOL)a3 forKeyboard:(unint64_t)a4;
- (KeyboardBrightnessClient)init;
- (double)idleDimTimeForKeyboard:(unint64_t)a3;
- (float)backlightLevelForKeyboard:(unint64_t)a3;
- (float)brightnessForKeyboard:(unint64_t)a3;
- (id)copyKeyboardBacklightIDs;
- (void)dealloc;
- (void)registerNotificationForKeys:(id)a3 keyboardID:(unint64_t)a4 block:(id)a5;
- (void)unregisterKeyboardNotificationBlock;
@end

@implementation KeyboardBrightnessClient

- (KeyboardBrightnessClient)init
{
  v14 = self;
  SEL v13 = a2;
  v12.receiver = self;
  v12.super_class = (Class)KeyboardBrightnessClient;
  v14 = [(KeyboardBrightnessClient *)&v12 init];
  if (!v14) {
    return v14;
  }
  os_log_t v2 = os_log_create("com.apple.CoreBrightness.KeyboardBrightnessClient", "Default");
  v14->_logHandle = (OS_os_log *)v2;
  v3 = objc_alloc_init(BrightnessSystemClient);
  v14->bsc = v3;
  if (v14->bsc) {
    return v14;
  }
  v11 = 0;
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
  v11 = logHandle;
  char v10 = 16;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
  {
    log = v11;
    os_log_type_t type = v10;
    __os_log_helper_16_0_0(v9);
    _os_log_error_impl(&dword_1BA438000, log, type, "failed to create XPC client", v9, 2u);
  }

  return 0;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  if (self->_logHandle)
  {

    v4->_logHandle = 0;
  }

  v2.receiver = v4;
  v2.super_class = (Class)KeyboardBrightnessClient;
  [(KeyboardBrightnessClient *)&v2 dealloc];
}

- (id)copyKeyboardBacklightIDs
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v5 = [(BrightnessSystemClient *)self->bsc copyPropertyForKey:@"KeyboardBacklightIDs"];
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
    __os_log_helper_16_2_1_8_64((uint64_t)v7, (uint64_t)v5);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "keyboardIDs=%@", v7, 0xCu);
  }
  return v5;
}

- (BOOL)isBacklightSuppressedOnKeyboard:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v7 = 0;
  id v6 = [(BrightnessSystemClient *)self->bsc copyPropertyForKey:@"KeyboardBacklightSuppressed" keyboardID:a3];
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
    __os_log_helper_16_2_1_8_64((uint64_t)v9, (uint64_t)v6);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "suppressed=%@", v9, 0xCu);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v7 = [v6 BOOLValue] & 1;
  }

  return v7 & 1;
}

- (BOOL)isBacklightSaturatedOnKeyboard:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v7 = 0;
  id v6 = [(BrightnessSystemClient *)self->bsc copyPropertyForKey:@"KeyboardBacklightSaturated" keyboardID:a3];
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
    __os_log_helper_16_2_1_8_64((uint64_t)v9, (uint64_t)v6);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "saturated=%@", v9, 0xCu);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v7 = [v6 BOOLValue] & 1;
  }

  return v7 & 1;
}

- (BOOL)isBacklightDimmedOnKeyboard:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v7 = 0;
  id v6 = [(BrightnessSystemClient *)self->bsc copyPropertyForKey:@"KeyboardBacklightIdleDimActive" keyboardID:a3];
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
    __os_log_helper_16_2_1_8_64((uint64_t)v9, (uint64_t)v6);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "dimmed=%@", v9, 0xCu);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v7 = [v6 BOOLValue] & 1;
  }

  return v7 & 1;
}

- (float)brightnessForKeyboard:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  float v8 = -1.0;
  id v7 = [(BrightnessSystemClient *)self->bsc copyPropertyForKey:@"KeyboardBacklightBrightness" keyboardID:a3];
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
    __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)v7);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "brightness=%@", v10, 0xCu);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 floatValue];
    float v8 = v3;
  }

  return v8;
}

- (float)backlightLevelForKeyboard:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  float v8 = -1.0;
  id v7 = [(BrightnessSystemClient *)self->bsc copyPropertyForKey:@"KeyboardBacklightLevel" keyboardID:a3];
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
    __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)v7);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "backlight level=%@", v10, 0xCu);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 floatValue];
    float v8 = v3;
  }

  return v8;
}

- (BOOL)setBrightness:(float)a3 forKeyboard:(unint64_t)a4
{
  if (a3 <= 0.0) {
    unsigned int v4 = 350;
  }
  else {
    unsigned int v4 = 500;
  }
  return [(KeyboardBrightnessClient *)self setBrightness:v4 fadeSpeed:1 commit:a4 forKeyboard:*(double *)&a3];
}

- (BOOL)setBrightness:(float)a3 fadeSpeed:(int)a4 commit:(BOOL)a5 forKeyboard:(unint64_t)a6
{
  v21[3] = *MEMORY[0x1E4F143B8];
  BOOL v15 = a5;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  v20[0] = @"Brightness";
  *(float *)&double v6 = a3;
  v21[0] = [NSNumber numberWithFloat:v6];
  v20[1] = @"FadeSpeed";
  v21[1] = [NSNumber numberWithInteger:a4];
  v20[2] = @"Commit";
  v21[2] = [NSNumber numberWithBool:v15];
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];
  char v12 = [(BrightnessSystemClient *)self->bsc setProperty:v13 withKey:@"KeyboardBacklightBrightness" keyboardID:a6];
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
    if (v12) {
      id v7 = "success";
    }
    else {
      id v7 = "failed";
    }
    __os_log_helper_16_2_6_8_64_8_64_8_0_4_0_4_0_8_32((uint64_t)v19, @"KeyboardBacklightBrightness", v13, a6, a4, v15, (uint64_t)v7);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@ property=%@ forID = %lu fadeSpeed = %d commit = %d (%s)", v19, 0x36u);
  }
  return v12 & 1;
}

- (BOOL)enableAutoBrightness:(BOOL)a3 forKeyboard:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v9 = (void *)[objc_alloc(NSNumber) initWithBool:a3];
  char v8 = [(BrightnessSystemClient *)self->bsc setProperty:v9 withKey:@"KeyboardBacklightABEnabled" keyboardID:a4];
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
    if (v8) {
      unsigned int v4 = "success";
    }
    else {
      unsigned int v4 = "failed";
    }
    __os_log_helper_16_2_3_8_64_8_64_8_32((uint64_t)v12, @"KeyboardBacklightABEnabled", (uint64_t)v9, (uint64_t)v4);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@ property=%@ (%s)", v12, 0x20u);
  }

  return v8 & 1;
}

- (BOOL)isAmbientFeatureAvailableOnKeyboard:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17 = self;
  SEL v16 = a2;
  unint64_t v15 = a3;
  char v14 = 0;
  id v13 = [(KeyboardBrightnessClient *)self copyKeyboardBacklightIDs];
  memset(__b, 0, sizeof(__b));
  id obj = v13;
  uint64_t v10 = [v13 countByEnumeratingWithState:__b objects:v18 count:16];
  if (v10)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0;
    unint64_t v8 = v10;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      id v12 = 0;
      id v12 = *(id *)(__b[1] + 8 * v7);
      if (v15 == 1)
      {
        char v14 = 1;
        goto LABEL_11;
      }
      uint64_t v3 = [v12 unsignedIntegerValue];
      if (v3 == v15) {
        break;
      }
      ++v7;
      if (v5 + 1 >= v8)
      {
        uint64_t v7 = 0;
        unint64_t v8 = [obj countByEnumeratingWithState:__b objects:v18 count:16];
        if (!v8) {
          goto LABEL_11;
        }
      }
    }
    char v14 = 1;
  }
LABEL_11:

  return v14 & 1;
}

- (BOOL)isKeyboardBuiltIn:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v7 = 0;
  id v6 = [(BrightnessSystemClient *)self->bsc copyPropertyForKey:@"KeyboardBacklightBuiltIn" keyboardID:a3];
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
    __os_log_helper_16_2_1_8_64((uint64_t)v9, (uint64_t)v6);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "builtIn=%@", v9, 0xCu);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v7 = [v6 BOOLValue] & 1;
  }

  return v7 & 1;
}

- (double)idleDimTimeForKeyboard:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  double v8 = -1.0;
  id v7 = [(BrightnessSystemClient *)self->bsc copyPropertyForKey:@"KeyboardBacklightIdleDimTime" keyboardID:a3];
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
    __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)v7);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "dim time=%@", v10, 0xCu);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 floatValue];
    double v8 = v3;
  }

  return v8;
}

- (BOOL)setIdleDimTime:(double)a3 forKeyboard:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v9 = (void *)[objc_alloc(NSNumber) initWithDouble:a3];
  char v8 = [(BrightnessSystemClient *)self->bsc setProperty:v9 withKey:@"KeyboardBacklightIdleDimTime" keyboardID:a4];
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
    if (v8) {
      unsigned int v4 = "success";
    }
    else {
      unsigned int v4 = "failed";
    }
    __os_log_helper_16_2_3_8_64_8_64_8_32((uint64_t)v12, @"KeyboardBacklightIdleDimTime", (uint64_t)v9, (uint64_t)v4);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@ property=%@ (%s)", v12, 0x20u);
  }

  return v8 & 1;
}

- (BOOL)suspendIdleDimming:(BOOL)a3 forKeyboard:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v9 = (void *)[objc_alloc(NSNumber) initWithBool:a3];
  char v8 = [(BrightnessSystemClient *)self->bsc setProperty:v9 withKey:@"KeyboardBacklightSuspendDimming" keyboardID:a4];
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
    if (v8) {
      unsigned int v4 = "success";
    }
    else {
      unsigned int v4 = "failed";
    }
    __os_log_helper_16_2_3_8_64_8_64_8_32((uint64_t)v12, @"KeyboardBacklightSuspendDimming", (uint64_t)v9, (uint64_t)v4);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@ property=%@ (%s)", v12, 0x20u);
  }

  return v8 & 1;
}

- (BOOL)isIdleDimmingSuspendedOnKeyboard:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v7 = 0;
  id v6 = [(BrightnessSystemClient *)self->bsc copyPropertyForKey:@"KeyboardBacklightSuspendDimming" keyboardID:a3];
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
    __os_log_helper_16_2_1_8_64((uint64_t)v9, (uint64_t)v6);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "dimming suspended=%@", v9, 0xCu);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v7 = [v6 BOOLValue] & 1;
  }

  return v7 & 1;
}

- (BOOL)isAutoBrightnessEnabledForKeyboard:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v7 = 0;
  id v6 = [(BrightnessSystemClient *)self->bsc copyPropertyForKey:@"KeyboardBacklightABEnabled" keyboardID:a3];
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
    __os_log_helper_16_2_1_8_64((uint64_t)v9, (uint64_t)v6);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "AB enabled=%@", v9, 0xCu);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v7 = [v6 BOOLValue] & 1;
  }

  return v7 & 1;
}

- (void)unregisterKeyboardNotificationBlock
{
}

- (void)registerNotificationForKeys:(id)a3 keyboardID:(unint64_t)a4 block:(id)a5
{
}

@end