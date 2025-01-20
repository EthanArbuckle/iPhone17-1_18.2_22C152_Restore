@interface CBProxFilter
- (BOOL)isActive;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (CBProxFilter)init;
- (id)filterEvent:(id)a3;
- (id)handleALSEvent:(id)a3;
- (id)handleProximityEvent:(id)a3;
- (void)dealloc;
- (void)setIsActive:(BOOL)a3;
- (void)setTriggered:(BOOL)a3;
@end

@implementation CBProxFilter

- (id)filterEvent:(id)a3
{
  int v4 = [a3 eventType];
  if (v4 == 12) {
    return [(CBProxFilter *)self handleALSEvent:a3];
  }
  if (v4 == 14) {
    return [(CBProxFilter *)self handleProximityEvent:a3];
  }
  return a3;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  BOOL v5 = 0;
  if ([a4 isEqual:@"AutoBrightnessProxEnabled"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      -[CBProxFilter setIsActive:](self, "setIsActive:", [a3 BOOLValue] & 1);
      return 1;
    }
  }
  return v5;
}

- (id)handleALSEvent:(id)a3
{
  if (self->_proxHasJustBeenRemoved)
  {
    [a3 timestamp];
    if ((float)(v3 - self->_proxReleaseTime) > self->_proxTriggerDelay)
    {
      self->_proxHasJustBeenRemoved = 0;
      [(CBProxFilter *)self setTriggered:0];
      self->_proxReleaseTime = 0.0;
    }
  }
  if ([(CBProxFilter *)self isActive] && self->_triggered)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ([a3 firstALSSample] & 1) == 0) {
      [a3 setObstructed:1];
    }
  }
  return a3;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (id)handleProximityEvent:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v20 = self;
  SEL v19 = a2;
  id v18 = a3;
  uint64_t v17 = [a3 event];
  int IntegerValue = IOHIDEventGetIntegerValue();
  if ((IntegerValue & 0x200) != 0 || (IntegerValue & 0x40) != 0 || (IntegerValue & 0x100) != 0)
  {
    os_log_t v15 = 0;
    if (v20->super._logHandle)
    {
      logHandle = v20->super._logHandle;
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
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v21, IntegerValue);
      _os_log_impl(&dword_1BA438000, v15, v14, "setting _proxTriggered = YES (proxMask=%x)", v21, 8u);
    }
    [(CBProxFilter *)v20 setTriggered:1];
    v20->_proxHasJustBeenRemoved = 0;
  }
  else
  {
    v13 = 0;
    if (v20->super._logHandle)
    {
      v8 = v20->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v7 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v7 = init_default_corebrightness_log();
      }
      v8 = v7;
    }
    v13 = v8;
    char v12 = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      BOOL v5 = v13;
      os_log_type_t v6 = v12;
      __os_log_helper_16_0_0(v11);
      _os_log_impl(&dword_1BA438000, v5, v6, "Prox has been removed", v11, 2u);
    }
    v20->_proxHasJustBeenRemoved = 1;
    [v18 timestamp];
    v20->_proxReleaseTime = v3;
  }
  return v18;
}

- (CBProxFilter)init
{
  os_log_type_t v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)CBProxFilter;
  os_log_type_t v6 = [(CBFilter *)&v4 init];
  if (v6)
  {
    os_log_t v2 = os_log_create("com.apple.CoreBrightness.CBProxFilter", "default");
    v6->super._logHandle = (OS_os_log *)v2;
    v6->_proxReleaseTime = 0.0;
    v6->_proxHasJustBeenRemoved = 0;
    v6->_proxTriggerDelay = 3.0;
    v6->_isActive = 1;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v4 = self;
  SEL v3 = a2;
  if (self->super._logHandle)
  {

    v4->super._logHandle = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBProxFilter;
  [(CBFilter *)&v2 dealloc];
}

- (void)setIsActive:(BOOL)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v5 = a3;
  if (self->super._logHandle)
  {
    logHandle = self->super._logHandle;
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
    __os_log_helper_16_0_2_4_0_4_0((uint64_t)v7, self->_isActive, v5);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Changing active=%d to %d", v7, 0xEu);
  }
  self->_isActive = v5;
}

- (void)setTriggered:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v6 = a3;
  if (self->_triggered != a3)
  {
    self->_triggered = a3;
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
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
      __os_log_helper_16_0_2_4_0_4_0((uint64_t)v8, v6, self->_isActive);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Setting triggered = %d active = %d", v8, 0xEu);
    }
    if ([(CBProxFilter *)self isActive])
    {
      context = (void *)MEMORY[0x1BA9ECAE0]();
      -[CBFilter sendNotificationForKey:andValue:](self, "sendNotificationForKey:andValue:", @"ProxStateChanged", [NSNumber numberWithBool:self->_triggered]);
    }
  }
}

@end