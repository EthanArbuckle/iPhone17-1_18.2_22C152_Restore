@interface CBSensorOverrideFilter
- (CBSensorOverrideFilter)initWithData:(id)a3;
- (id)filterEvent:(id)a3;
- (int)orientation;
- (void)dealloc;
- (void)setOrientation:(int)a3;
@end

@implementation CBSensorOverrideFilter

- (CBSensorOverrideFilter)initWithData:(id)a3
{
  v18 = self;
  SEL v17 = a2;
  id v16 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CBSensorOverrideFilter;
  v18 = [(CBFilter *)&v15 init];
  if (v18)
  {
    os_log_t v3 = os_log_create("com.apple.CoreBrightness.CBSensorOverrideFilter", "default");
    v18->super._logHandle = (OS_os_log *)v3;
    v18->_chromaticity.x = -1.0;
    v18->_chromaticity.y = -1.0;
    v18->_illuminance = -1.0;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v16 floatValue];
      v18->_illuminance = v4;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = (void *)[v16 objectForKey:@"AABSensorOverrideValue"];
        v13 = (void *)[v16 objectForKey:@"AABSensorOverrideOrientation"];
        if (v14)
        {
          [v14 floatValue];
          v18->_illuminance = v5;
        }
        if (v13)
        {
          int v6 = [v13 intValue];
          v18->_orientation = v6;
        }
        v12 = (void *)[v16 objectForKey:@"AABSensorOverrideColor"];
        if (v12)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)[v12 count] >= 2)
          {
            v11 = (void *)[v12 objectAtIndex:0];
            v10 = (void *)[v12 objectAtIndex:1];
            if (v11)
            {
              [v11 floatValue];
              v18->_chromaticity.x = v7;
            }
            if (v10)
            {
              [v10 floatValue];
              v18->_chromaticity.y = v8;
            }
          }
        }
      }
    }
  }
  return v18;
}

- (void)dealloc
{
  float v4 = self;
  SEL v3 = a2;
  if (self->super._logHandle)
  {

    v4->super._logHandle = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBSensorOverrideFilter;
  [(CBFilter *)&v2 dealloc];
}

- (id)filterEvent:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_super v15 = self;
  SEL v14 = a2;
  id v13 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (!v15->_orientation || [v13 orientation] == v15->_orientation))
  {
    if (v15->_illuminance >= 0.0) {
      [v13 setIlluminance:v15->_illuminance];
    }
    if (v15->_chromaticity.x >= 0.0 && v15->_chromaticity.y >= 0.0)
    {
      memset(__b, 0, 0x3CuLL);
      if (v13) {
        [v13 colorSample];
      }
      else {
        memset(__b, 0, 0x3CuLL);
      }
      *($38C3DEC81229B66F67FB6D350D75FF5A *)((char *)&__b[1] + 4) = v15->_chromaticity;
      HIDWORD(__b[2]) = CFXChromaticity2CCT((float *)&v15->_chromaticity);
      os_log_t v11 = 0;
      if (v15->super._logHandle)
      {
        logHandle = v15->super._logHandle;
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
      os_log_t v11 = logHandle;
      os_log_type_t v10 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v17, COERCE__INT64(*((float *)&__b[2] + 1)));
        _os_log_debug_impl(&dword_1BA438000, v11, v10, "CCT1 (overridden) = %f\n", v17, 0xCu);
      }
      if (v15->_chromaticity.y == 0.0)
      {
        __b[0] = 0;
        LODWORD(__b[1]) = 0;
      }
      else
      {
        float v3 = v15->_illuminance / 3.14159265;
        CFXChromaticity2Tristimulus((float *)&__b[1] + 1, (float *)__b, v3);
      }
      HIDWORD(__b[6]) = 0;
      *(void *)((char *)&__b[3] + 4) = 0;
      *(void *)((char *)&__b[4] + 4) = 0;
      *(void *)((char *)&__b[5] + 4) = 0;
      LODWORD(__b[3]) = v15->_orientation;
      memcpy(__dst, __b, 0x3CuLL);
      [v13 setColorSample:__dst];
    }
    if (v15->super._logHandle)
    {
      int v6 = v15->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v5 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v5 = init_default_corebrightness_log();
      }
      int v6 = v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v16, (uint64_t)v13);
      _os_log_debug_impl(&dword_1BA438000, v6, OS_LOG_TYPE_DEBUG, "%@", v16, 0xCu);
    }
  }
  return v13;
}

- (int)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int)a3
{
  self->_orientation = a3;
}

@end