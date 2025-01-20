@interface CBALSEvent
+ (void)replaceLuxWithFilteredLux:(__IOHIDEvent *)a3;
- ($8956C32E087F2BD45D39FFE01FE495BE)colorSample;
- ($924AC8E0FA23A5AC9EC0E1AB0C26E9F0)copyVendorDataFromEvent:(SEL)a3;
- ($924AC8E0FA23A5AC9EC0E1AB0C26E9F0)vendorData;
- (BOOL)colorMitigationTriggered;
- (BOOL)firstALSSample;
- (BOOL)obstructed;
- (BOOL)supportColor;
- (CBALSEvent)initWithHIDEvent:(__IOHIDEvent *)a3 andNode:(id)a4;
- (CBALSEvent)initWithHIDEvent:(__IOHIDEvent *)a3 andService:(__IOHIDServiceClient *)a4;
- (double)illuminance;
- (float)confidence;
- (float)integrationTime;
- (float)strength;
- (id)description;
- (int)getServiceOrientation:(__IOHIDServiceClient *)a3;
- (int)orientation;
- (int64_t)compare:(id)a3;
- (void)dealloc;
- (void)setColorMitigationTriggered:(BOOL)a3;
- (void)setColorSample:(id *)a3;
- (void)setConfidence:(float)a3;
- (void)setFirstALSSample:(BOOL)a3;
- (void)setIlluminance:(double)a3;
- (void)setIntegrationTime:(float)a3;
- (void)setObstructed:(BOOL)a3;
- (void)setOrientation:(int)a3;
- (void)setStrength:(float)a3;
- (void)setSupportColor:(BOOL)a3;
- (void)setVendorData:(id *)a3;
@end

@implementation CBALSEvent

- (int)orientation
{
  return self->_orientation;
}

- (BOOL)firstALSSample
{
  return self->_firstALSSample;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  if (self->_logHandle)
  {

    v4->_logHandle = 0;
  }
  if (v4->_event) {
    CFRelease(v4->_event);
  }

  v2.receiver = v4;
  v2.super_class = (Class)CBALSEvent;
  [(CBHIDEvent *)&v2 dealloc];
}

- (BOOL)obstructed
{
  return self->_obstructed;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"ALS event = [Orientation = %d; Illuminance = %f; xy = (%f,%f); XYZ = (%f,%f,%f); CCT1 = %f; Integration time = %f; Gain = %d; Obstructed = %d; First = %d, mitigation = %d, timestamp = %u]",
               self->_orientation,
               *(void *)&self->_illuminance,
               self->_colorSample.xy.x,
               self->_colorSample.xy.y,
               self->_colorSample.XYZ[0],
               self->_colorSample.XYZ[1],
               self->_colorSample.XYZ[2],
               self->_colorSample.CCT1,
               self->_integrationTime,
               self->_vendorData.gain,
               self->_obstructed,
               self->_firstALSSample,
               self->_colorMitigationTriggered,
               self->_vendorData.sensorTimestamp,
               a2,
               self);
}

- (BOOL)colorMitigationTriggered
{
  return self->_colorMitigationTriggered;
}

- ($8956C32E087F2BD45D39FFE01FE495BE)colorSample
{
  objc_copyStruct(retstr, &self->_colorSample, 60, 1, 0);
  return result;
}

- (CBALSEvent)initWithHIDEvent:(__IOHIDEvent *)a3 andNode:(id)a4
{
  self->_node = (CBALSNode *)a4;
  return -[CBALSEvent initWithHIDEvent:andService:](self, "initWithHIDEvent:andService:", a3, [a4 alsService]);
}

- (CBALSEvent)initWithHIDEvent:(__IOHIDEvent *)a3 andService:(__IOHIDServiceClient *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v44 = self;
  SEL v43 = a2;
  v42 = a3;
  v41 = a4;
  v40.receiver = self;
  v40.super_class = (Class)CBALSEvent;
  v44 = [(CBHIDEvent *)&v40 initWithHIDEvent:a3 andService:a4];
  if (!v44) {
    return v44;
  }
  os_log_t v4 = os_log_create("com.apple.CoreBrightness.CBALSEvent", "default");
  v44->_logHandle = (OS_os_log *)v4;
  if (v42 && IOHIDEventGetType() == 12)
  {
    CFRetain(v42);
    v44->_event = v42;
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    mach_timebase_info v7 = info;
    LODWORD(v6) = v7.denom;
    LODWORD(v5) = v7.numer;
    v44->super._sMachTimebaseFactor = (double)v5 / (double)v6 * 0.000000001;
    if (v44->_node && [(CBALSNode *)v44->_node supportsFloatLux])
    {
      IOHIDEventGetDoubleValue();
      double IntegerValue = v8;
    }
    else
    {
      double IntegerValue = (double)IOHIDEventGetIntegerValue();
    }
    v44->_float illuminance = IntegerValue;
    int v9 = [(CBALSEvent *)v44 getServiceOrientation:v41];
    v44->_int orientation = v9;
    if (IOHIDEventGetIntegerValue() == 1)
    {
      IOHIDEventGetDoubleValue();
      *(float *)&double v10 = v10 / 3.14159265;
      v44->_colorSample.XYZ[0] = *(float *)&v10;
      IOHIDEventGetDoubleValue();
      *(float *)&double v11 = v11 / 3.14159265;
      v44->_colorSample.XYZ[1] = *(float *)&v11;
      IOHIDEventGetDoubleValue();
      *(float *)&double v12 = v12 / 3.14159265;
      v44->_colorSample.XYZ[2] = *(float *)&v12;
      IOHIDEventGetFloatValue();
      *(float *)&double v13 = v13;
      v44->_colorSample.CCT1 = *(float *)&v13;
      if (v44->_colorSample.XYZ[0] == 0.0 || v44->_colorSample.XYZ[1] == 0.0)
      {
        double v14 = 0.0;
        v44->_colorSample.xy.y = 0.0;
        v44->_colorSample.xy.x = 0.0;
      }
      else
      {
        *(float *)&double v14 = CFXTristimulus2Chromaticity(v44->_colorSample.XYZ, (float *)&v44->_colorSample.xy);
      }
      __dst = &v44->_vendorData;
      if (v44) {
        -[CBALSEvent copyVendorDataFromEvent:](v44, "copyVendorDataFromEvent:", v42, v14);
      }
      else {
        memset(__b, 0, sizeof(__b));
      }
      memcpy(__dst, __b, 0x89uLL);
      v44->_integrationTime = (float)v44->_vendorData.integrationTime / 1000000.0;
      float illuminance = v44->_illuminance;
      v44->_colorSample.extra.brightness = illuminance;
      if (v41) {
        int orientation = v44->_orientation;
      }
      else {
        int orientation = v44->_vendorData.orientation;
      }
      v44->_colorSample.extra.int orientation = orientation;
      v44->_colorSample.extra.nChannels = v44->_vendorData.nChannels;
      __memcpy_chk();
      v44->_supportColor = 1;
      os_log_t oslog = 0;
      if (v44->_logHandle)
      {
        logHandle = v44->_logHandle;
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
      os_log_t oslog = logHandle;
      os_log_type_t type = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v46, COERCE__INT64(v44->_colorSample.XYZ[0]), COERCE__INT64(v44->_colorSample.XYZ[1]), COERCE__INT64(v44->_colorSample.XYZ[2]), COERCE__INT64(v44->_colorSample.CCT1));
        _os_log_debug_impl(&dword_1BA438000, oslog, type, "Tristimulus values: XYZ[0]=%f, XYZ[1]=%f, XYZ[2]=%f | CCT1=%f", v46, 0x2Au);
      }
    }
    else
    {
      v44->_supportColor = 0;
      os_log_t v35 = 0;
      if (v44->_logHandle)
      {
        v24 = v44->_logHandle;
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
      os_log_t v35 = v24;
      os_log_type_t v34 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v21 = v35;
        os_log_type_t v22 = v34;
        __os_log_helper_16_0_0(v33);
        _os_log_debug_impl(&dword_1BA438000, v21, v22, "error: invalid Color space, can't load harmony data", v33, 2u);
      }
    }
    v44->_obstructed = 0;
    v44->_firstALSSample = 0;
    v44->_colorMitigationTriggered = 0;
    return v44;
  }
  os_log_t v32 = 0;
  if (v44->_logHandle)
  {
    v20 = v44->_logHandle;
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
  os_log_t v32 = v20;
  os_log_type_t v31 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v17 = v32;
    os_log_type_t v18 = v31;
    __os_log_helper_16_0_0(v30);
    _os_log_error_impl(&dword_1BA438000, v17, v18, "HID Event type is not ALS", v30, 2u);
  }

  v44 = 0;
  return 0;
}

- (int)getServiceOrientation:(__IOHIDServiceClient *)a3
{
  int v5 = 0;
  if (self->_node) {
    return [(CBALSNode *)self->_node orientation];
  }
  if (a3)
  {
    cf = (void *)IOHIDServiceClientCopyProperty(a3, @"Orientation");
    if (cf)
    {
      int v5 = [cf intValue];
      CFRelease(cf);
    }
  }
  return v5;
}

- ($924AC8E0FA23A5AC9EC0E1AB0C26E9F0)copyVendorDataFromEvent:(SEL)a3
{
  memset(retstr, 0, 0x89uLL);
  result = ($924AC8E0FA23A5AC9EC0E1AB0C26E9F0 *)IOHIDEventGetChildren();
  if (result)
  {
    result = ($924AC8E0FA23A5AC9EC0E1AB0C26E9F0 *)CFArrayGetValueAtIndex((CFArrayRef)result, 0);
    if (result)
    {
      result = ($924AC8E0FA23A5AC9EC0E1AB0C26E9F0 *)IOHIDEventGetDataValue();
      if (result)
      {
        IOHIDEventGetIntegerValue();
        return ($924AC8E0FA23A5AC9EC0E1AB0C26E9F0 *)__memcpy_chk();
      }
    }
  }
  return result;
}

- (float)strength
{
  return self->_strength;
}

- (void)setStrength:(float)a3
{
  self->_strength = a3;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (float)confidence
{
  return self->_confidence;
}

- ($924AC8E0FA23A5AC9EC0E1AB0C26E9F0)vendorData
{
  objc_copyStruct(retstr, &self->_vendorData, 137, 1, 0);
  return result;
}

- (double)illuminance
{
  return self->_illuminance;
}

- (void)setColorMitigationTriggered:(BOOL)a3
{
  self->_colorMitigationTriggered = a3;
}

- (int64_t)compare:(id)a3
{
  double illuminance = self->_illuminance;
  [a3 illuminance];
  if (illuminance > v3 && !self->_obstructed) {
    return -1;
  }
  double v6 = self->_illuminance;
  [a3 illuminance];
  return v6 < v4 || self->_obstructed;
}

+ (void)replaceLuxWithFilteredLux:(__IOHIDEvent *)a3
{
  CFArrayRef theArray = (const __CFArray *)IOHIDEventGetChildren();
  if (theArray)
  {
    if (CFArrayGetValueAtIndex(theArray, 0))
    {
      if (IOHIDEventGetIntegerValue() == 137)
      {
        uint64_t DataValue = IOHIDEventGetDataValue();
        if (DataValue)
        {
          if (*(unsigned char *)(DataValue + 136))
          {
            IOHIDEventSetDoubleValue();
            IOHIDEventSetIntegerValue();
            IOHIDEventGetDoubleValue();
            IOHIDEventGetDoubleValue();
            double v6 = v3;
            IOHIDEventGetDoubleValue();
            if (v6 > 0.0)
            {
              IOHIDEventSetDoubleValue();
              IOHIDEventSetDoubleValue();
              IOHIDEventSetDoubleValue();
            }
          }
        }
      }
    }
  }
}

- (void)setIlluminance:(double)a3
{
  self->_double illuminance = a3;
}

- (void)setColorSample:(id *)a3
{
}

- (BOOL)supportColor
{
  return self->_supportColor;
}

- (void)setSupportColor:(BOOL)a3
{
  self->_supportColor = a3;
}

- (void)setObstructed:(BOOL)a3
{
  self->_obstructed = a3;
}

- (void)setOrientation:(int)a3
{
  self->_int orientation = a3;
}

- (void)setVendorData:(id *)a3
{
}

- (float)integrationTime
{
  return self->_integrationTime;
}

- (void)setIntegrationTime:(float)a3
{
  self->_integrationTime = a3;
}

- (void)setFirstALSSample:(BOOL)a3
{
  self->_firstALSSample = a3;
}

@end