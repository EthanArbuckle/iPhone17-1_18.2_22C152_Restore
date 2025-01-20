@interface BrightnessSystemClient
- (BOOL)isAlsSupported;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (BOOL)setProperty:(id)a3 withKey:(id)a4 andDisplay:(unint64_t)a5;
- (BOOL)setProperty:(id)a3 withKey:(id)a4 keyboardID:(unint64_t)a5;
- (BrightnessSystemClient)init;
- (id)copyPropertyForKey:(id)a3;
- (id)copyPropertyForKey:(id)a3 andDisplay:(unint64_t)a4;
- (id)copyPropertyForKey:(id)a3 keyboardID:(unint64_t)a4;
- (void)dealloc;
- (void)registerDisplayNotificationCallbackBlock:(id)a3;
- (void)registerKeyboardNotificationCallbackBlock:(id)a3;
- (void)registerNotificationBlock:(id)a3;
- (void)registerNotificationBlock:(id)a3 forProperties:(id)a4;
- (void)registerNotificationForKey:(id)a3;
- (void)registerNotificationForKey:(id)a3 andDisplay:(unint64_t)a4;
- (void)registerNotificationForKeys:(id)a3;
- (void)registerNotificationForKeys:(id)a3 andDisplay:(unint64_t)a4;
- (void)registerNotificationForKeys:(id)a3 keyboardID:(unint64_t)a4;
- (void)unregisterDisplayNotificationBlock;
- (void)unregisterKeyboardNotificationBlock;
- (void)unregisterNotificationForKey:(id)a3;
- (void)unregisterNotificationForKey:(id)a3 andDisplay:(unint64_t)a4;
- (void)unregisterNotificationForKeys:(id)a3;
- (void)unregisterNotificationForKeys:(id)a3 andDisplay:(unint64_t)a4;
- (void)unregisterNotificationForKeys:(id)a3 keyboardID:(unint64_t)a4;
- (void)unregisterPropertyNotificationBlock;
@end

@implementation BrightnessSystemClient

- (BOOL)isAlsSupported
{
  BOOL v3 = 0;
  CFTypeRef cf1 = [(BrightnessSystemClientInternal *)self->bsci copyPropertyForKey:@"BLControlAlsSupported"];
  if (cf1)
  {
    BOOL v3 = CFEqual(cf1, (CFTypeRef)*MEMORY[0x1E4F1CFD0]) != 0;
    CFRelease(cf1);
  }
  return v3;
}

- (id)copyPropertyForKey:(id)a3
{
  return [(BrightnessSystemClientInternal *)self->bsci copyPropertyForKey:a3];
}

- (void)dealloc
{
  v11 = self;
  SEL v10 = a2;
  v9 = 0;
  if (self->_logHandle)
  {
    logHandle = v11->_logHandle;
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
  v9 = logHandle;
  char v8 = 2;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    log = v9;
    os_log_type_t type = v8;
    __os_log_helper_16_0_0(v7);
    _os_log_debug_impl(&dword_1BA438000, log, type, "BSC dealloc", v7, 2u);
  }
  [(BrightnessSystemClient *)v11 unregisterDisplayNotificationBlock];
  [(BrightnessSystemClient *)v11 unregisterKeyboardNotificationBlock];
  [(BrightnessSystemClient *)v11 unregisterPropertyNotificationBlock];
  [(BrightnessSystemClientInternal *)v11->bsci registerNotificationBlock:0];
  if (v11->_logHandle)
  {

    v11->_logHandle = 0;
  }
  [(BrightnessSystemClientInternal *)v11->bsci stopXpcService];

  v6.receiver = v11;
  v6.super_class = (Class)BrightnessSystemClient;
  [(BrightnessSystemClient *)&v6 dealloc];
}

- (void)unregisterPropertyNotificationBlock
{
  v11 = self;
  SEL v10 = a2;
  objc_sync_enter(self);
  if (v11->_propertyNotificationBlock)
  {
    v9 = 0;
    if (v11->_logHandle)
    {
      logHandle = v11->_logHandle;
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
    v9 = logHandle;
    char v8 = 2;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      log = v9;
      os_log_type_t type = v8;
      __os_log_helper_16_0_0(v7);
      _os_log_debug_impl(&dword_1BA438000, log, type, (const char *)&unk_1BA61B929, v7, 2u);
    }
    _Block_release(v11->_propertyNotificationBlock);
    v11->_propertyNotificationBlock = 0;
  }
  objc_sync_exit(self);
}

- (void)unregisterKeyboardNotificationBlock
{
  if (self->_keyboardNotificationBlock)
  {
    _Block_release(self->_keyboardNotificationBlock);
    self->_keyboardNotificationBlock = 0;
  }
  objc_sync_exit(self);
}

- (void)unregisterDisplayNotificationBlock
{
  v11 = self;
  SEL v10 = a2;
  objc_sync_enter(self);
  if (v11->_displayNotificationBlock)
  {
    v9 = 0;
    if (v11->_logHandle)
    {
      logHandle = v11->_logHandle;
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
    v9 = logHandle;
    char v8 = 2;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      log = v9;
      os_log_type_t type = v8;
      __os_log_helper_16_0_0(v7);
      _os_log_debug_impl(&dword_1BA438000, log, type, (const char *)&unk_1BA61B929, v7, 2u);
    }
    _Block_release(v11->_displayNotificationBlock);
    v11->_displayNotificationBlock = 0;
  }
  objc_sync_exit(self);
}

- (BrightnessSystemClient)init
{
  v24 = self;
  SEL v23 = a2;
  v22.receiver = self;
  v22.super_class = (Class)BrightnessSystemClient;
  v24 = [(BrightnessSystemClient *)&v22 init];
  if (!v24) {
    return v24;
  }
  v24->_logHandle = (OS_os_log *)os_log_create("com.apple.CoreBrightness.Client", "Default");
  if (!v24->_logHandle)
  {
    v21 = 0;
    v9 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    v21 = v9;
    char v20 = 16;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      log = v21;
      os_log_type_t type = v20;
      __os_log_helper_16_0_0(v19);
      _os_log_error_impl(&dword_1BA438000, log, type, "failed to create log handle", v19, 2u);
    }
  }
  v24->bsci = objc_alloc_init(BrightnessSystemClientInternal);
  if (v24->bsci)
  {
    v10[0] = 0;
    v10[1] = v10;
    int v11 = 1375731712;
    int v12 = 48;
    v13 = __Block_byref_object_copy__5;
    v14 = __Block_byref_object_dispose__5;
    v15 = v24;
    -[BrightnessSystemClientInternal registerNotificationBlock:](v24->bsci, "registerNotificationBlock:");
    _Block_object_dispose(v10, 8);
    return v24;
  }
  v18 = 0;
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
  v18 = logHandle;
  char v17 = 16;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
  {
    BOOL v3 = v18;
    os_log_type_t v4 = v17;
    __os_log_helper_16_0_0(v16);
    _os_log_error_impl(&dword_1BA438000, v3, v4, "failed to create XPC client", v16, 2u);
  }

  return 0;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v8 = [(BrightnessSystemClientInternal *)self->bsci setProperty:a3 forKey:a4];
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
      os_log_type_t v4 = "success";
    }
    else {
      os_log_type_t v4 = "failed";
    }
    __os_log_helper_16_2_3_8_64_8_64_8_34((uint64_t)v12, (uint64_t)a4, (uint64_t)a3, (uint64_t)v4);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@ property=%@ (%{public}s)", v12, 0x20u);
  }
  return v8 & 1;
}

- (void)registerNotificationBlock:(id)a3 forProperties:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
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
    __os_log_helper_16_2_1_8_64((uint64_t)v9, (uint64_t)a4);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "keys=%@", v9, 0xCu);
  }
  [(BrightnessSystemClientInternal *)self->bsci registerNotificationBlock:a3 forProperties:a4];
}

void __30__BrightnessSystemClient_init__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))
  {
    char v8 = *(NSObject **)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    char v8 = inited;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v16, (uint64_t)a2, a3);
    _os_log_impl(&dword_1BA438000, v8, OS_LOG_TYPE_INFO, "key=%@ value=%@", v16, 0x16u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = [a2 getKeyString];
    uint64_t v11 = [a2 getKeyDisplayID];
    uint64_t v10 = [a2 getKeyKeyboardID];
    if (v12)
    {
      id obj = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      objc_sync_enter(obj);
      if (v11)
      {
        if (*(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 24)) {
          (*(void (**)(void))(*(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 24) + 16))();
        }
      }
      else if (v10 && *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 32))
      {
        (*(void (**)(void))(*(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 32) + 16))();
      }
      objc_sync_exit(obj);
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      objc_sync_enter(v5);
      if (*(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 40)) {
        (*(void (**)(void))(*(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 40) + 16))();
      }
      objc_sync_exit(v5);
    }
    else
    {
      if (*(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))
      {
        os_log_type_t v4 = *(NSObject **)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v3 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v3 = init_default_corebrightness_log();
        }
        os_log_type_t v4 = v3;
      }
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v15, (uint64_t)a2);
        _os_log_debug_impl(&dword_1BA438000, v4, OS_LOG_TYPE_DEBUG, "unknown or invaid key (%@)", v15, 0xCu);
      }
    }
  }
}

- (BOOL)setProperty:(id)a3 withKey:(id)a4 andDisplay:(unint64_t)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  char v10 = 0;
  id v9 = (id)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithPropertyKey:a4 andDisplay:a5];
  if (v9)
  {
    char v10 = [(BrightnessSystemClientInternal *)self->bsci setProperty:a3 forKey:v9];
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
      if (v10) {
        id v5 = "success";
      }
      else {
        id v5 = "failed";
      }
      __os_log_helper_16_2_3_8_64_8_64_8_34((uint64_t)v13, (uint64_t)v9, (uint64_t)a3, (uint64_t)v5);
      _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@ property=%@ (%{public}s)", v13, 0x20u);
    }
  }

  return v10 & 1;
}

- (id)copyPropertyForKey:(id)a3 andDisplay:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  id v7 = (id)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithPropertyKey:a3 andDisplay:a4];
  if (v7)
  {
    id v8 = [(BrightnessSystemClientInternal *)self->bsci copyPropertyForKey:v7];
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
      __os_log_helper_16_2_3_8_64_8_0_8_64((uint64_t)v12, (uint64_t)a3, a4, (uint64_t)v8);
      _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@ display=%lu property=%@", v12, 0x20u);
    }
  }

  return v8;
}

- (void)registerDisplayNotificationCallbackBlock:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
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
    __os_log_helper_16_0_1_8_0((uint64_t)v7, (uint64_t)a3);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "block=%p", v7, 0xCu);
  }
  [(BrightnessSystemClient *)self unregisterDisplayNotificationBlock];
  objc_sync_enter(self);
  if (a3) {
    self->_displayNotificationBlock = _Block_copy(a3);
  }
  objc_sync_exit(self);
}

- (void)registerNotificationBlock:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
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
    __os_log_helper_16_0_1_8_0((uint64_t)v7, (uint64_t)a3);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "block=%p", v7, 0xCu);
  }
  [(BrightnessSystemClient *)self unregisterPropertyNotificationBlock];
  objc_sync_enter(self);
  if (a3) {
    self->_propertyNotificationBlock = _Block_copy(a3);
  }
  objc_sync_exit(self);
}

- (void)registerNotificationForKey:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
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
    __os_log_helper_16_2_1_8_64((uint64_t)v7, (uint64_t)a3);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@", v7, 0xCu);
  }
  if (a3) {
    [(BrightnessSystemClientInternal *)self->bsci addPropertyForNotification:a3];
  }
}

- (void)unregisterNotificationForKey:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
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
    __os_log_helper_16_2_1_8_64((uint64_t)v7, (uint64_t)a3);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@", v7, 0xCu);
  }
  if (a3) {
    [(BrightnessSystemClientInternal *)self->bsci removePropertyFromNotification:a3];
  }
}

- (void)registerNotificationForKeys:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
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
    __os_log_helper_16_2_1_8_64((uint64_t)v7, (uint64_t)a3);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "keys=%@", v7, 0xCu);
  }
  if (a3) {
    [(BrightnessSystemClientInternal *)self->bsci addPropertiesForNotification:a3];
  }
}

- (void)unregisterNotificationForKeys:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
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
    __os_log_helper_16_2_1_8_64((uint64_t)v7, (uint64_t)a3);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "keys=%@", v7, 0xCu);
  }
  if (a3) {
    [(BrightnessSystemClientInternal *)self->bsci removePropertiesFromNotification:a3];
  }
}

- (void)registerNotificationForKeys:(id)a3 andDisplay:(unint64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
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
    __os_log_helper_16_2_2_8_0_8_64((uint64_t)v10, a4, (uint64_t)a3);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "displayID=%lu keys=%@", v10, 0x16u);
  }
  objc_super v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a3, "count"));
  if (v6)
  {
    objc_msgSend(a3, "enumerateObjectsUsingBlock:");
    [(BrightnessSystemClientInternal *)self->bsci addPropertiesForNotification:v6];
  }
}

void __65__BrightnessSystemClient_registerNotificationForKeys_andDisplay___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = (id)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithPropertyKey:a2 andDisplay:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (void)unregisterNotificationForKeys:(id)a3 andDisplay:(unint64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
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
    __os_log_helper_16_2_2_8_0_8_64((uint64_t)v10, a4, (uint64_t)a3);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "displayID=%lu keys=%@", v10, 0x16u);
  }
  objc_super v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a3, "count"));
  if (v6)
  {
    objc_msgSend(a3, "enumerateObjectsUsingBlock:");
    [(BrightnessSystemClientInternal *)self->bsci removePropertiesFromNotification:v6];
  }
}

void __67__BrightnessSystemClient_unregisterNotificationForKeys_andDisplay___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = (id)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithPropertyKey:a2 andDisplay:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (void)registerNotificationForKey:(id)a3 andDisplay:(unint64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
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
    __os_log_helper_16_2_2_8_0_8_64((uint64_t)v10, a4, (uint64_t)a3);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "displayID=%lu key=%@", v10, 0x16u);
  }
  id v6 = (id)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithPropertyKey:a3 andDisplay:a4];
  if (v6) {
    [(BrightnessSystemClientInternal *)self->bsci addPropertyForNotification:v6];
  }
}

- (void)unregisterNotificationForKey:(id)a3 andDisplay:(unint64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
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
    __os_log_helper_16_2_2_8_0_8_64((uint64_t)v10, a4, (uint64_t)a3);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "displayID=%lu keys=%@", v10, 0x16u);
  }
  id v6 = (id)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithPropertyKey:a3 andDisplay:a4];
  if (v6) {
    [(BrightnessSystemClientInternal *)self->bsci removePropertyFromNotification:v6];
  }
}

- (BOOL)setProperty:(id)a3 withKey:(id)a4 keyboardID:(unint64_t)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  char v10 = 0;
  id v9 = (id)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithPropertyKey:a4 keyboardID:a5];
  if (v9)
  {
    char v10 = [(BrightnessSystemClientInternal *)self->bsci setProperty:a3 forKey:v9];
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
      if (v10) {
        id v5 = "success";
      }
      else {
        id v5 = "failed";
      }
      __os_log_helper_16_2_3_8_64_8_64_8_32((uint64_t)v13, (uint64_t)v9, (uint64_t)a3, (uint64_t)v5);
      _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@ property=%@ (%s)", v13, 0x20u);
    }
  }

  return v10 & 1;
}

- (id)copyPropertyForKey:(id)a3 keyboardID:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  id v7 = (id)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithPropertyKey:a3 keyboardID:a4];
  if (v7)
  {
    id v8 = [(BrightnessSystemClientInternal *)self->bsci copyPropertyForKey:v7];
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
      __os_log_helper_16_2_3_8_64_8_0_8_64((uint64_t)v12, (uint64_t)a3, a4, (uint64_t)v8);
      _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@ keyboardID=%lu property=%@", v12, 0x20u);
    }
  }

  return v8;
}

- (void)registerKeyboardNotificationCallbackBlock:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
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
    __os_log_helper_16_0_1_8_0((uint64_t)v7, (uint64_t)a3);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "block=%p", v7, 0xCu);
  }
  [(BrightnessSystemClient *)self unregisterKeyboardNotificationBlock];
  objc_sync_enter(self);
  if (a3) {
    self->_keyboardNotificationBlock = _Block_copy(a3);
  }
  objc_sync_exit(self);
}

- (void)registerNotificationForKeys:(id)a3 keyboardID:(unint64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
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
    __os_log_helper_16_2_2_8_0_8_64((uint64_t)v10, a4, (uint64_t)a3);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "keyboardID=%lu keys=%@", v10, 0x16u);
  }
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a3, "count"));
  if (v6)
  {
    objc_msgSend(a3, "enumerateObjectsUsingBlock:");
    [(BrightnessSystemClientInternal *)self->bsci addPropertiesForNotification:v6];
  }
}

void __65__BrightnessSystemClient_registerNotificationForKeys_keyboardID___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = (id)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithPropertyKey:a2 keyboardID:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (void)unregisterNotificationForKeys:(id)a3 keyboardID:(unint64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
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
    __os_log_helper_16_2_2_8_0_8_64((uint64_t)v10, a4, (uint64_t)a3);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "keyboardID=%lu keys=%@", v10, 0x16u);
  }
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a3, "count"));
  if (v6)
  {
    objc_msgSend(a3, "enumerateObjectsUsingBlock:");
    [(BrightnessSystemClientInternal *)self->bsci removePropertiesFromNotification:v6];
  }
}

void __67__BrightnessSystemClient_unregisterNotificationForKeys_keyboardID___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = (id)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithPropertyKey:a2 keyboardID:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) addObject:v3];
  }
}

@end