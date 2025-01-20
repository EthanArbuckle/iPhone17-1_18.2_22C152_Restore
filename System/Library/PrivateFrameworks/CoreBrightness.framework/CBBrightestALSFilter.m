@interface CBBrightestALSFilter
- (BOOL)displayBrightnessFactorPropertyHandler:(id)a3;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (CBBrightestALSFilter)init;
- (id)filterEvent:(id)a3;
- (void)dealloc;
- (void)forgetDataForService:(__IOHIDServiceClient *)a3;
@end

@implementation CBBrightestALSFilter

- (id)filterEvent:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v22 = self;
  SEL v21 = a2;
  id v20 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return v20;
  }
  id v19 = v20;
  context = (void *)MEMORY[0x1BA9ECAE0](-[NSMutableDictionary setObject:forKey:](v22->_alsEvents, "setObject:forKey:", v20, [v20 serviceRegistryID]));
  id v18 = 0;
  id v18 = (id)[(NSMutableDictionary *)v22->_alsEvents keysSortedByValueUsingComparator:&__block_literal_global_5];
  os_log_t v17 = 0;
  if (v22->super._logHandle)
  {
    logHandle = v22->super._logHandle;
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
  os_log_t v17 = logHandle;
  os_log_type_t v16 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v24, (uint64_t)v22->_alsEvents);
    _os_log_debug_impl(&dword_1BA438000, v17, v16, "ALS events %@", v24, 0xCu);
  }
  id v15 = 0;
  id v15 = (id)-[NSMutableDictionary objectForKey:](v22->_alsEvents, "objectForKey:", [v18 objectAtIndexedSubscript:0]);
  if (v15 && (([v15 obstructed] & 1) == 0 || (objc_msgSend(v20, "firstALSSample") & 1) != 0))
  {
    id v23 = v15;
    int v14 = 1;
  }
  else
  {
    v13 = 0;
    if (v22->super._logHandle)
    {
      v7 = v22->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v6 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v6 = init_default_corebrightness_log();
      }
      v7 = v6;
    }
    v13 = v7;
    char v12 = 2;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v4 = v13;
      os_log_type_t v5 = v12;
      __os_log_helper_16_0_0(v11);
      _os_log_debug_impl(&dword_1BA438000, v4, v5, "Brightest ALS event was not found", v11, 2u);
    }
    id v23 = 0;
    int v14 = 1;
  }
  return v23;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  BOOL v5 = 0;
  if (([a4 isEqual:@"DisplayBrightnessFactor"] & 1) != 0
    || ([a4 isEqual:@"DisplayBrightnessFactorWithFade"] & 1) != 0)
  {
    return [(CBBrightestALSFilter *)self displayBrightnessFactorPropertyHandler:a3];
  }
  return v5;
}

- (CBBrightestALSFilter)init
{
  v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)CBBrightestALSFilter;
  v7 = [(CBFilter *)&v5 init];
  if (v7)
  {
    os_log_t v2 = os_log_create("com.apple.CoreBrightness.CBBrightestALSFilter", "default");
    v7->super._logHandle = (OS_os_log *)v2;
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v7->_alsEvents = v3;
  }
  return v7;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  if (self->super._logHandle)
  {

    v4->super._logHandle = 0;
  }

  v2.receiver = v4;
  v2.super_class = (Class)CBBrightestALSFilter;
  [(CBFilter *)&v2 dealloc];
}

uint64_t __36__CBBrightestALSFilter_filterEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "compare:", a3, a1, a3, a2, a1);
}

- (void)forgetDataForService:(__IOHIDServiceClient *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  CFTypeRef RegistryID = IOHIDServiceClientGetRegistryID(a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [(NSMutableDictionary *)self->_alsEvents objectForKey:RegistryID])
  {
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
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v7, (uint64_t)RegistryID);
      _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "forgetting data for service with ID = %@", v7, 0xCu);
    }
    [(NSMutableDictionary *)self->_alsEvents removeObjectForKey:RegistryID];
  }
}

- (BOOL)displayBrightnessFactorPropertyHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v8 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = (id)[a3 objectForKey:@"DisplayBrightnessFactor"];
  }
  else {
    id v7 = a3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 floatValue];
    if (v3 <= 0.0)
    {
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
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v11, [(NSMutableDictionary *)self->_alsEvents count]);
        _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "Display off -> stored ALS events (%lu) removed", v11, 0xCu);
      }
      [(NSMutableDictionary *)self->_alsEvents removeAllObjects];
    }
    char v8 = 1;
  }
  return v8 & 1;
}

@end