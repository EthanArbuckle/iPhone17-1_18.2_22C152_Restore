@interface CBKeyboardPreferencesManager
+ (BOOL)getBoolPreference:(BOOL *)a3 forKey:(id)a4;
+ (BOOL)getFloatPreference:(float *)a3 forKey:(id)a4;
+ (BOOL)getIntPreference:(int *)a3 forKey:(id)a4;
+ (BOOL)setBoolPreference:(BOOL)a3 forKey:(id)a4;
+ (BOOL)setFloatPreference:(float)a3 forKey:(id)a4;
+ (BOOL)setIntPreference:(int)a3 forKey:(id)a4;
+ (BOOL)setPreference:(id)a3 forKey:(id)a4;
+ (id)copyAllPreferences;
+ (id)copyPreferenceForKey:(id)a3;
+ (id)copyPreferenceForKey:(id)a3 keyboardID:(unint64_t)a4;
+ (id)sharedInstance;
- (BOOL)setPreference:(id)a3 forKey:(id)a4;
- (CBKeyboardPreferencesManager)init;
- (id)copyAllPrefereneces;
- (id)copyPreferenceForKey:(id)a3;
- (void)dealloc;
@end

@implementation CBKeyboardPreferencesManager

+ (id)sharedInstance
{
  id v11 = a1;
  SEL v10 = a2;
  objc_sync_enter(a1);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  v7 = __46__CBKeyboardPreferencesManager_sharedInstance__block_invoke;
  v8 = &unk_1E6218FE0;
  id v9 = v11;
  v13 = &sharedInstance_onceToken_1;
  v12 = &v4;
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(v13, v12);
  }
  objc_sync_exit(a1);
  return (id)sharedInstance__sharedObject_1;
}

uint64_t __46__CBKeyboardPreferencesManager_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v4 = a1;
  uint64_t v3 = a1;
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)&OBJC_METACLASS___CBKeyboardPreferencesManager;
  uint64_t result = objc_msgSend(objc_msgSendSuper2(&v2, sel_alloc), "init");
  sharedInstance__sharedObject_1 = result;
  return result;
}

- (CBKeyboardPreferencesManager)init
{
  v23 = self;
  SEL v22 = a2;
  v21.receiver = self;
  v21.super_class = (Class)CBKeyboardPreferencesManager;
  v23 = [(CBKeyboardPreferencesManager *)&v21 init];
  if (!v23) {
    return v23;
  }
  os_log_t v2 = os_log_create("com.apple.CoreBrightness.KeyboardPreferencesManager", "default");
  v23->_logHandle = (OS_os_log *)v2;
  if (!v23->_logHandle)
  {
    v20 = 0;
    v13 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    v20 = v13;
    char v19 = 16;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      log = v20;
      os_log_type_t type = v19;
      __os_log_helper_16_0_0(v18);
      _os_log_error_impl(&dword_1BA438000, log, type, "Failed to create log handle", v18, 2u);
    }
  }
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.CoreBrightness.KeyboardPreferencesManager", 0);
  v23->_queue = (OS_dispatch_queue *)v3;
  if (v23->_queue)
  {
    id v14 = +[CBPreferencesHandler copyPreferenceForAllUsersForKey:@"KeyboardBacklight"];
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v14];
      v23->_preferences = (NSMutableDictionary *)v4;
    }
    else
    {
      int v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v23->_preferences = v5;
    }

    return v23;
  }
  v17 = 0;
  if (v23->_logHandle)
  {
    logHandle = v23->_logHandle;
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
  v17 = logHandle;
  char v16 = 16;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
  {
    v7 = v17;
    os_log_type_t v8 = v16;
    __os_log_helper_16_0_0(v15);
    _os_log_error_impl(&dword_1BA438000, v7, v8, "failed to create dispatch queue", v15, 2u);
  }

  v23 = 0;
  return 0;
}

- (void)dealloc
{
  uint64_t v4 = self;
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

  v2.receiver = v4;
  v2.super_class = (Class)CBKeyboardPreferencesManager;
  [(CBKeyboardPreferencesManager *)&v2 dealloc];
}

- (BOOL)setPreference:(id)a3 forKey:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v28 = self;
  SEL v27 = a2;
  id v26 = a3;
  id v25 = a4;
  uint64_t v20 = 0;
  objc_super v21 = &v20;
  int v22 = 0x20000000;
  int v23 = 32;
  char v24 = 0;
  os_log_t v19 = 0;
  if (self->_logHandle)
  {
    logHandle = v28->_logHandle;
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
  os_log_t v19 = logHandle;
  os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v29, (uint64_t)v25, (uint64_t)v26);
    _os_log_impl(&dword_1BA438000, v19, v18, "Set preference %@ = %@", v29, 0x16u);
  }
  queue = v28->_queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v10 = -1073741824;
  int v11 = 0;
  v12 = __53__CBKeyboardPreferencesManager_setPreference_forKey___block_invoke;
  v13 = &unk_1E6219008;
  id v14 = v28;
  id v15 = v26;
  id v16 = v25;
  v17 = &v20;
  dispatch_sync(queue, &block);
  char v6 = *((unsigned char *)v21 + 24);
  _Block_object_dispose(&v20, 8);
  return v6 & 1;
}

BOOL __53__CBKeyboardPreferencesManager_setPreference_forKey___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 24) setObject:a1[5] forKey:a1[6]];
  BOOL result = +[CBPreferencesHandler storePreferenceForAllUsersForKey:@"KeyboardBacklight" andValue:*(void *)(a1[4] + 24)];
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = result;
  return result;
}

- (id)copyPreferenceForKey:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v25 = self;
  SEL v24 = a2;
  id v23 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  int v18 = 1375731712;
  int v19 = 48;
  uint64_t v20 = __Block_byref_object_copy__8;
  objc_super v21 = __Block_byref_object_dispose__8;
  uint64_t v22 = 0;
  queue = self->_queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v9 = -1073741824;
  int v10 = 0;
  int v11 = __53__CBKeyboardPreferencesManager_copyPreferenceForKey___block_invoke;
  v12 = &unk_1E6219830;
  v13 = v25;
  id v15 = &v16;
  id v14 = a3;
  dispatch_sync(queue, &block);
  if (v25->_logHandle)
  {
    logHandle = v25->_logHandle;
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
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v26, (uint64_t)v23, v17[5]);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Copy preference %@ = %@", v26, 0x16u);
  }
  int v5 = (void *)v17[5];
  _Block_object_dispose(&v16, 8);
  return v5;
}

id __53__CBKeyboardPreferencesManager_copyPreferenceForKey___block_invoke(void *a1)
{
  if (!*(void *)(a1[4] + 24)) {
    *(void *)(a1[4] + 24) = +[CBPreferencesHandler copyPreferenceForAllUsersForKey:@"KeyboardBacklight"];
  }
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 24) objectForKey:a1[5]];
  return *(id *)(*(void *)(a1[6] + 8) + 40);
}

- (id)copyAllPrefereneces
{
  uint64_t v20 = self;
  SEL v19 = a2;
  uint64_t v12 = 0;
  v13 = &v12;
  int v14 = 1375731712;
  int v15 = 48;
  uint64_t v16 = __Block_byref_object_copy__8;
  v17 = __Block_byref_object_dispose__8;
  uint64_t v18 = 0;
  queue = self->_queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v6 = -1073741824;
  int v7 = 0;
  os_log_type_t v8 = __51__CBKeyboardPreferencesManager_copyAllPrefereneces__block_invoke;
  int v9 = &unk_1E6219350;
  int v11 = &v12;
  int v10 = v20;
  dispatch_sync(queue, &block);
  uint64_t v4 = (void *)v13[5];
  _Block_object_dispose(&v12, 8);
  return v4;
}

uint64_t __51__CBKeyboardPreferencesManager_copyAllPrefereneces__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

+ (BOOL)setIntPreference:(int)a3 forKey:(id)a4
{
  id v5 = (id)[objc_alloc(NSNumber) initWithInt:a3];
  char v6 = +[CBKeyboardPreferencesManager setPreference:v5 forKey:a4];

  return v6 & 1;
}

+ (BOOL)setFloatPreference:(float)a3 forKey:(id)a4
{
  id v4 = objc_alloc(NSNumber);
  *(float *)&double v5 = a3;
  id v7 = (id)[v4 initWithFloat:v5];
  char v8 = +[CBKeyboardPreferencesManager setPreference:v7 forKey:a4];

  return v8 & 1;
}

+ (BOOL)setBoolPreference:(BOOL)a3 forKey:(id)a4
{
  id v5 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  char v6 = +[CBKeyboardPreferencesManager setPreference:v5 forKey:a4];

  return v6 & 1;
}

+ (BOOL)setPreference:(id)a3 forKey:(id)a4
{
  return [+[CBKeyboardPreferencesManager sharedInstance] setPreference:a3 forKey:a4];
}

+ (BOOL)getIntPreference:(int *)a3 forKey:(id)a4
{
  char v6 = 0;
  id v5 = +[CBKeyboardPreferencesManager copyPreferenceForKey:a4];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *a3 = [v5 intValue];
      char v6 = 1;
    }
  }

  return v6 & 1;
}

+ (BOOL)getFloatPreference:(float *)a3 forKey:(id)a4
{
  char v7 = 0;
  id v6 = +[CBKeyboardPreferencesManager copyPreferenceForKey:a4];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      *(_DWORD *)a3 = v4;
      char v7 = 1;
    }
  }

  return v7 & 1;
}

+ (BOOL)getBoolPreference:(BOOL *)a3 forKey:(id)a4
{
  char v6 = 0;
  id v5 = +[CBKeyboardPreferencesManager copyPreferenceForKey:a4];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *a3 = [v5 BOOLValue] & 1;
      char v6 = 1;
    }
  }

  return v6 & 1;
}

+ (id)copyPreferenceForKey:(id)a3
{
  return [+[CBKeyboardPreferencesManager sharedInstance] copyPreferenceForKey:a3];
}

+ (id)copyPreferenceForKey:(id)a3 keyboardID:(unint64_t)a4
{
  id v7 = 0;
  id v6 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"%lu", a4);
  id v5 = [+[CBKeyboardPreferencesManager sharedInstance] copyPreferenceForKey:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = (id)[v5 objectForKey:a3];
  }

  return v7;
}

+ (id)copyAllPreferences
{
  return [+[CBKeyboardPreferencesManager sharedInstance] copyAllPrefereneces];
}

@end