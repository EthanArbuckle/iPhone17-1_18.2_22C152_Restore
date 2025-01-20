@interface CBEDRModulator
- (BOOL)enabled;
- (BOOL)isConfigured;
- (BOOL)modulatedHeadroom:(float *)a3 forHeadroom:(float)a4 forSDRNits:(float)a5;
- (CBEDRModulator)init;
- (NSArray)headroomDataPointsConfig;
- (NSArray)nitsDataPointsConfig;
- (id)description;
- (void)dealloc;
- (void)setEnabled:(BOOL)a3;
- (void)setHeadroomDataPointsConfig:(id)a3;
- (void)setNitsDataPointsConfig:(id)a3;
@end

@implementation CBEDRModulator

- (CBEDRModulator)init
{
  v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)CBEDRModulator;
  v6 = [(CBEDRModulator *)&v4 init];
  if (v6)
  {
    os_log_t v2 = os_log_create("com.apple.CoreBrightness.EDR", "modulator");
    v6->_logHandle = (OS_os_log *)v2;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v4 = self;
  SEL v3 = a2;
  if (self->_logHandle)
  {

    v4->_logHandle = 0;
  }

  v2.receiver = v4;
  v2.super_class = (Class)CBEDRModulator;
  [(CBEDRModulator *)&v2 dealloc];
}

- (BOOL)isConfigured
{
  BOOL v5 = 0;
  if (self->_enabled)
  {
    if (self->_headroomDataPointsConfig)
    {
      if (self->_nitsDataPointsConfig)
      {
        NSUInteger v3 = [(NSArray *)self->_headroomDataPointsConfig count];
        if (v3 == [(NSArray *)self->_nitsDataPointsConfig count]) {
          return 1;
        }
      }
    }
  }
  return v5;
}

- (BOOL)modulatedHeadroom:(float *)a3 forHeadroom:(float)a4 forSDRNits:(float)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  *a3 = a4;
  if ([(CBEDRModulator *)self isConfigured])
  {
    objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_nitsDataPointsConfig, "objectAtIndexedSubscript:", 0), "floatValue");
    float v5 = *(float *)&v6;
    *(float *)&double v6 = a5;
    if (a5 > v5)
    {
      objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_nitsDataPointsConfig, "objectAtIndexedSubscript:", -[NSArray count](self->_nitsDataPointsConfig, "count") - 1), "floatValue");
      float v8 = *(float *)&v9;
      *(float *)&double v9 = a5;
      if (a5 < v8)
      {
        uint64_t v24 = 0;
        NSUInteger v23 = [(NSArray *)self->_nitsDataPointsConfig count] - 1;
        while (v23 - v24 > 1)
        {
          objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_nitsDataPointsConfig, "objectAtIndexedSubscript:", (v23 - v24) / 2 + v24), "floatValue");
          if (a5 > v11) {
            v24 += (v23 - v24) / 2;
          }
          else {
            NSUInteger v23 = (v23 - v24) / 2 + v24;
          }
        }
        objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_nitsDataPointsConfig, "objectAtIndexedSubscript:", v24), "floatValue");
        float v20 = v12;
        objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_headroomDataPointsConfig, "objectAtIndexedSubscript:", v24), "floatValue");
        float v21 = v13;
        objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_nitsDataPointsConfig, "objectAtIndexedSubscript:", v23), "floatValue");
        float v22 = v14;
        objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_headroomDataPointsConfig, "objectAtIndexedSubscript:", v23), "floatValue");
        float v25 = linear_interpolation(a5, v20, v21, v22, v15);
      }
      else
      {
        objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_headroomDataPointsConfig, "objectAtIndexedSubscript:", -[NSArray count](self->_nitsDataPointsConfig, "count", v9) - 1), "floatValue");
        float v25 = v10;
      }
    }
    else
    {
      objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_headroomDataPointsConfig, "objectAtIndexedSubscript:", 0, v6), "floatValue");
      float v25 = v7;
    }
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
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v31, COERCE__INT64(a4), COERCE__INT64(a5), COERCE__INT64(v25));
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "headroom = %f | SDR = %f | modulated cap = %f", v31, 0x20u);
    }
    if (a4 >= v25) {
      float v17 = v25;
    }
    else {
      float v17 = a4;
    }
    *a3 = v17;
    char v30 = 1;
  }
  else
  {
    char v30 = 0;
  }
  return v30 & 1;
}

- (id)description
{
  if (self->_enabled) {
    objc_super v2 = "enabled";
  }
  else {
    objc_super v2 = "disabled";
  }
  return (id)[NSString stringWithFormat:@"CBEDRModulator: state = %s\n nits datapoints:    %@\n headroom datapoints:%@", v2, self->_nitsDataPointsConfig, self->_headroomDataPointsConfig];
}

- (NSArray)headroomDataPointsConfig
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHeadroomDataPointsConfig:(id)a3
{
}

- (NSArray)nitsDataPointsConfig
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNitsDataPointsConfig:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

@end