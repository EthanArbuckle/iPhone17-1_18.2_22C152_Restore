@interface CBExtendedDisplayMitigation
+ (BOOL)isSupported;
- (BOOL)isActive;
- (BOOL)setActive:(BOOL)a3;
- (CBExtendedDisplayMitigation)init;
- (float)getCap;
- (void)dealloc;
@end

@implementation CBExtendedDisplayMitigation

+ (BOOL)isSupported
{
  char v3 = 0;
  if (CBU_IsPad()) {
    char v3 = MGGetBoolAnswer() & 1;
  }
  return v3 & 1;
}

- (CBExtendedDisplayMitigation)init
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v9 = self;
  SEL v8 = a2;
  v7.receiver = self;
  v7.super_class = (Class)CBExtendedDisplayMitigation;
  v9 = [(CBExtendedDisplayMitigation *)&v7 init];
  if (v9)
  {
    v9->_isActive = 0;
    os_log_t v2 = os_log_create("com.apple.CoreBrightness.AABC.EDM", "default");
    v9->_logHandle = (OS_os_log *)v2;
    if (v9->_logHandle)
    {
      logHandle = v9->_logHandle;
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
      [(CBExtendedDisplayMitigation *)v9 getCap];
      __os_log_helper_16_0_1_8_0((uint64_t)v10, COERCE__INT64(v3));
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "EDM cap created, will limit to %f when active", v10, 0xCu);
    }
  }
  return v9;
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
  v2.super_class = (Class)CBExtendedDisplayMitigation;
  [(CBExtendedDisplayMitigation *)&v2 dealloc];
}

- (BOOL)setActive:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v8 = a3;
  if (self->_isActive == a3)
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
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v11, v8);
      _os_log_error_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_ERROR, "State of extended display mitigation already set to to %d", v11, 8u);
    }
    char v9 = 0;
  }
  else
  {
    self->_isActive = a3;
    if (self->_logHandle)
    {
      v5 = self->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v4 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v4 = init_default_corebrightness_log();
      }
      v5 = v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v10, v8);
      _os_log_impl(&dword_1BA438000, v5, OS_LOG_TYPE_DEFAULT, "Setting state of extended display mitigation to %d", v10, 8u);
    }
    char v9 = 1;
  }
  return v9 & 1;
}

- (float)getCap
{
  return 335.0;
}

- (BOOL)isActive
{
  return self->_isActive;
}

@end