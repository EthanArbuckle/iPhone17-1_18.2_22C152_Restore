@interface CBBOLTSProvider
- (CBBOLTSProvider)initWithQueue:(id)a3;
- (void)dealloc;
- (void)getBOLTSModule;
- (void)loadBOLTSModule;
- (void)newBOLTSModule;
@end

@implementation CBBOLTSProvider

- (CBBOLTSProvider)initWithQueue:(id)a3
{
  v15 = self;
  SEL v14 = a2;
  id v13 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CBBOLTSProvider;
  v15 = [(CBModule *)&v12 initWithQueue:a3];
  if (!v15) {
    return v15;
  }
  os_log_t v3 = os_log_create("com.apple.CoreBrightness.CBBOLTSProvider", "default");
  v15->super._logHandle = (OS_os_log *)v3;
  if (v15->super._logHandle)
  {
    v4 = +[CBAgregateSettingsProvider sharedInstance];
    v15->_settingsProvider = (CBAdaptiveAutoBrightnessSettingsProvider *)v4;
    return v15;
  }
  os_log_t oslog = 0;
  if (_COREBRIGHTNESS_LOG_DEFAULT) {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
  }
  else {
    inited = init_default_corebrightness_log();
  }
  os_log_t oslog = inited;
  os_log_type_t type = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
  {
    log = oslog;
    os_log_type_t v7 = type;
    __os_log_helper_16_0_0(v9);
    _os_log_error_impl(&dword_1BA438000, log, v7, "failed to create log handle", v9, 2u);
  }

  return 0;
}

- (void)dealloc
{
  v5 = self;
  SEL v4 = a2;
  if (self->_boltsModule)
  {
    boltsModule = v5->_boltsModule;
    if (boltsModule) {
      (*(void (**)(void *))(*(void *)boltsModule + 8))(boltsModule);
    }
    v5->_boltsModule = 0;
  }
  v3.receiver = v5;
  v3.super_class = (Class)CBBOLTSProvider;
  [(CBModule *)&v3 dealloc];
}

- (void)newBOLTSModule
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9 = self;
  SEL v8 = a2;
  uint64_t v7 = 0;
  if (objc_opt_respondsToSelector())
  {
    if ([(CBAdaptiveAutoBrightnessSettingsProvider *)v9->_settingsProvider getMLABModelPath])
    {
      v2 = (CBBOLTS *)[(CBAdaptiveAutoBrightnessSettingsProvider *)v9->_settingsProvider getMLABModelPath];
      CBBOLTS::createFromUncompiledModelPath(v2, v3);
    }
  }
  SEL v4 = +[MLAB URLOfModelInThisBundle];
  CBBOLTS::createUsingModelURL(v4, v5);
}

- (void)loadBOLTSModule
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v18 = self;
  SEL v17 = a2;
  if (self->_boltsModule)
  {
    v16 = +[MLAB URLOfModelInThisBundle];
    if (objc_opt_respondsToSelector())
    {
      v15 = 0;
      v15 = (CBBOLTS *)[(CBAdaptiveAutoBrightnessSettingsProvider *)v18->_settingsProvider getMLABModelPath];
      if (v15)
      {
        SEL v14 = (NSURL *)CBBOLTS::compileModel(v15, v2);
        if (v14)
        {
          v16 = v14;
        }
        else
        {
          id v13 = 0;
          if (v18->super._logHandle)
          {
            logHandle = v18->super._logHandle;
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
          id v13 = logHandle;
          char v12 = 16;
          if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
          {
            log = v13;
            os_log_type_t type = v12;
            __os_log_helper_16_0_0(v11);
            _os_log_error_impl(&dword_1BA438000, log, type, "Failed to compile supplied model, falling back to using bundled model", v11, 2u);
          }
        }
      }
    }
    if (CBBOLTS::switchModel((NSObject **)v18->_boltsModule, v16))
    {
      if (v18->super._logHandle)
      {
        SEL v4 = v18->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v3 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v3 = init_default_corebrightness_log();
        }
        SEL v4 = v3;
      }
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v19, (uint64_t)v16);
        _os_log_impl(&dword_1BA438000, v4, OS_LOG_TYPE_DEFAULT, "BOLTS switched to a new model: %@", v19, 0xCu);
      }
    }
    else
    {
      if (v18->super._logHandle)
      {
        v6 = v18->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v5 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v5 = init_default_corebrightness_log();
        }
        v6 = v5;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v20, (uint64_t)v16);
        _os_log_error_impl(&dword_1BA438000, v6, OS_LOG_TYPE_ERROR, "Failed to switch to a new model: %@", v20, 0xCu);
      }
    }
  }
  else
  {
    v18->_boltsModule = [(CBBOLTSProvider *)v18 newBOLTSModule];
  }
}

- (void)getBOLTSModule
{
  return self->_boltsModule;
}

@end