@interface CBALSService
- (BOOL)colorSupport;
- (BOOL)updateEventData;
- (BOOL)validData;
- (CBALSService)initWithHIDALSServiceClient:(__IOHIDServiceClient *)a3;
- (double)CCT;
- (double)lux;
- (double)x;
- (double)y;
- (id)copyDataInDictionary;
- (id)description;
- (unint64_t)location;
- (void)dealloc;
- (void)resetEventData;
- (void)setEvent:(__IOHIDEvent *)a3;
@end

@implementation CBALSService

- (CBALSService)initWithHIDALSServiceClient:(__IOHIDServiceClient *)a3
{
  v14 = self;
  SEL v13 = a2;
  v12 = a3;
  id v11 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"com.apple.CBALSService.%lu", objc_msgSend((id)IOHIDServiceClientGetRegistryID(a3), "unsignedIntegerValue"));
  v10.receiver = v14;
  v10.super_class = (Class)CBALSService;
  v14 = [(CBHIDService *)&v10 initWithHIDServiceClient:v12 andIdentifier:v11];
  if (v14)
  {
    v9 = (void *)IOHIDServiceClientCopyProperty(v14->super._service, @"SensorLocation");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v3 = [v9 unsignedIntegerValue];
      v14->_desc = (NSString *)v3;
    }

    id v8 = (id)IOHIDServiceClientCopyProperty(v14->super._service, @"Built-In");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v4 = [v8 BOOLValue];
      v14->super._builtIn = v4 & 1;
    }

    id v7 = (id)IOHIDServiceClientCopyProperty(v14->super._service, @"ColorSupport");
    if (!v7) {
      id v7 = (id)IOHIDServiceClientCopyProperty(v14->super._service, @"crgb");
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v5 = [v7 BOOLValue];
      LOBYTE(v14->_lux) = v5 & 1;
    }

    [(CBALSService *)v14 updateEventData];
  }

  return v14;
}

- (void)dealloc
{
  char v4 = self;
  SEL v3 = a2;

  v2.receiver = v4;
  v2.super_class = (Class)CBALSService;
  [(CBHIDService *)&v2 dealloc];
}

- (void)resetEventData
{
  if (self->super._event)
  {
    CFRelease(self->super._event);
    self->super._event = 0;
  }
  *(&self->super._builtIn + 1) = 0;
  *(void *)&self->_colorSupport = 0;
  self->_x = 0.0;
  self->_y = 0.0;
  *(void *)&self->_validData = 0;
}

- (void)setEvent:(__IOHIDEvent *)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v48 = self;
  SEL v47 = a2;
  v46 = a3;
  [(CBALSService *)self resetEventData];
  if (v46)
  {
    v48->super._event = v46;
    CFRetain(v48->super._event);
    IOHIDEventGetDoubleValue();
    *(void *)&v48->_validData = v3;
    if (*(double *)&v48->_validData < 0.0) {
      *(void *)&v48->_validData = 0;
    }
    if (LOBYTE(v48->_lux))
    {
      if (*(double *)&v48->_validData == 0.0)
      {
        os_log_t v31 = 0;
        if (v48->super._logHandle)
        {
          logHandle = v48->super._logHandle;
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
        os_log_t v31 = logHandle;
        os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
        {
          SEL v13 = v31;
          os_log_type_t v14 = v30;
          __os_log_helper_16_0_0(v29);
          _os_log_impl(&dword_1BA438000, v13, v14, "lux is 0, leave the values zeroed out", v29, 2u);
        }
      }
      else if (IOHIDEventGetIntegerValue() == 1)
      {
        IOHIDEventGetDoubleValue();
        *(void *)&v48->_validData = v4;
        IOHIDEventGetDoubleValue();
        v48->_y = v5;
        IOHIDEventGetDoubleValue();
        uint64_t v42 = v6;
        IOHIDEventGetDoubleValue();
        uint64_t v41 = v7;
        IOHIDEventGetDoubleValue();
        uint64_t v40 = *(void *)&v8;
        double v39 = *(double *)&v42 + *(double *)&v41 + v8;
        os_log_t oslog = 0;
        if (v48->super._logHandle)
        {
          v24 = v48->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v23 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v23 = init_default_corebrightness_log();
          }
          v24 = v23;
        }
        os_log_t oslog = v24;
        os_log_type_t v37 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v52, *(uint64_t *)&v39, v42, v41, v40);
          _os_log_debug_impl(&dword_1BA438000, oslog, v37, "sum:%f tempX=%f tempY=%f tempZ:%f", v52, 0x2Au);
        }
        if (v39 == 0.0)
        {
          os_log_t v36 = 0;
          if (v48->super._logHandle)
          {
            v22 = v48->super._logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT) {
              uint64_t v21 = _COREBRIGHTNESS_LOG_DEFAULT;
            }
            else {
              uint64_t v21 = init_default_corebrightness_log();
            }
            v22 = v21;
          }
          os_log_t v36 = v22;
          os_log_type_t v35 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v51, v42, v41, v40);
            _os_log_error_impl(&dword_1BA438000, v36, v35, "invalid data - tristimulus values add up to zero. tempX=%f tempY=%f tempZ:%f", v51, 0x20u);
          }
        }
        else
        {
          *(double *)&v48->_colorSupport = *(double *)&v42 / v39;
          v48->_x = *(double *)&v41 / v39;
        }
      }
      else
      {
        os_log_t v34 = 0;
        if (v48->super._logHandle)
        {
          v20 = v48->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v19 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v19 = init_default_corebrightness_log();
          }
          v20 = v19;
        }
        os_log_t v34 = v20;
        os_log_type_t v33 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v17 = v34;
          os_log_type_t v18 = v33;
          __os_log_helper_16_0_0(v32);
          _os_log_error_impl(&dword_1BA438000, v17, v18, "unknown color space", v32, 2u);
        }
      }
      if (v48->super._logHandle)
      {
        v12 = v48->super._logHandle;
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
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v50, *(void *)&v48->_validData, *(void *)&v48->_colorSupport, *(void *)&v48->_x, *(void *)&v48->_y);
        _os_log_debug_impl(&dword_1BA438000, v12, OS_LOG_TYPE_DEBUG, "update: lux=%f x=%f y=%f CCT=%f", v50, 0x2Au);
      }
    }
    else
    {
      if (v48->super._logHandle)
      {
        objc_super v10 = v48->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v9 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v9 = init_default_corebrightness_log();
        }
        objc_super v10 = v9;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v49, *(void *)&v48->_validData);
        _os_log_debug_impl(&dword_1BA438000, v10, OS_LOG_TYPE_DEBUG, "update: lux=%f", v49, 0xCu);
      }
    }
    *(&v48->super._builtIn + 1) = 1;
  }
  else
  {
    v45 = 0;
    if (v48->super._logHandle)
    {
      v28 = v48->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v27 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v27 = init_default_corebrightness_log();
      }
      v28 = v27;
    }
    v45 = v28;
    os_log_type_t v44 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      log = v45;
      os_log_type_t type = v44;
      __os_log_helper_16_0_0(v43);
      _os_log_impl(&dword_1BA438000, log, type, "nulling event", v43, 2u);
    }
  }
}

- (id)description
{
  v15 = self;
  SEL v14 = a2;
  if (*(void *)&self->_CCT) {

  }
  id v13 = 0;
  id v12 = 0;
  id v12 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"id=0x%lX location=%lu internal=%d", v15->super._registryID, v15->_desc, v15->super._builtIn);
  if (*(&v15->super._builtIn + 1))
  {
    if (LOBYTE(v15->_lux))
    {
      id v2 = [NSString alloc];
      double y = v15->_y;
      uint64_t v4 = *(void *)&v15->_colorSupport;
      double x = v15->_x;
      uint64_t v10 = *(void *)&v15->_validData;
      id v13 = (id)objc_msgSend(v2, "initWithFormat:", @"lux=%f CCT=%f xy= %f | %f", v10, *(void *)&y, v4, *(void *)&x);
    }
    else
    {
      id v6 = [NSString alloc];
      uint64_t v10 = *(void *)&v15->_validData;
      id v13 = (id)objc_msgSend(v6, "initWithFormat:", @"lux=%f", v10);
    }
  }
  id v7 = [NSString alloc];
  uint64_t v8 = [v7 initWithFormat:@"service %@ | data %@", v12, v13];
  uint64_t v11 = &OBJC_IVAR___CBDisplayModuleiOS__maxNitsPanel;
  *(void *)&v15->_CCT = v8;

  return *(Class *)((char *)&v15->super.super.isa + v11[934]);
}

- (id)copyDataInDictionary
{
  id v13 = self;
  SEL v12 = a2;
  uint64_t v11 = 0;
  id v10 = 0;
  v3[16] = 0x1E4F28000uLL;
  id v10 = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:self->_desc];
  id v9 = 0;
  id v9 = (id)[objc_alloc(NSNumber) initWithBool:v13->super._builtIn];
  id v8 = 0;
  id v8 = (id)[objc_alloc(NSNumber) initWithBool:*(&v13->super._builtIn + 1)];
  id v7 = 0;
  id v7 = (id)[objc_alloc(NSNumber) initWithDouble:*(double *)&v13->_validData];
  id v6 = 0;
  id v6 = (id)[objc_alloc(NSNumber) initWithDouble:v13->_y];
  id v5 = 0;
  id v5 = (id)[objc_alloc(NSNumber) initWithDouble:*(double *)&v13->_colorSupport];
  id v4 = 0;
  id v4 = (id)[objc_alloc(NSNumber) initWithDouble:v13->_x];
  if (v10 && v9 && v8 && v7 && v6 && v5 && v4)
  {
    v3[15] = v3;
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v10, @"location", v9, @"internal", v8, @"valid", v7, @"lux", v6, @"CCT", v5, @"x", v4, @"y", 0);
  }

  return v11;
}

- (BOOL)updateEventData
{
  char v6 = 0;
  CFTypeRef cf = (CFTypeRef)IOHIDServiceClientCopyEvent();
  if (cf)
  {
    [(CBALSService *)self setEvent:cf];
    CFRelease(cf);
    char v6 = 1;
  }
  else
  {
    [(CBALSService *)self resetEventData];
    id v4 = [(CBHIDService *)self copyPropertyForKey:@"CurrentLuxValue"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v4 doubleValue];
      *(void *)&self->_validData = v2;
      *(&self->super._builtIn + 1) = 1;
      char v6 = 1;
    }
  }
  return v6 & 1;
}

- (BOOL)validData
{
  return *(&self->super._builtIn + 1);
}

- (double)lux
{
  return *(double *)&self->_validData;
}

- (BOOL)colorSupport
{
  return LOBYTE(self->_lux) & 1;
}

- (double)x
{
  return *(double *)&self->_colorSupport;
}

- (double)y
{
  return self->_x;
}

- (double)CCT
{
  return self->_y;
}

- (unint64_t)location
{
  return (unint64_t)self->_desc;
}

@end