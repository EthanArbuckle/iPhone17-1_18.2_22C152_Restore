@interface ASDTIOPAudioLPMicUInt32Property
- (ASDTIOPAudioLPMicDevice)lpMicDevice;
- (ASDTIOPAudioLPMicUInt32Property)initWithConfig:(id)a3;
- (BOOL)checkPropertyValue:(id)a3;
- (BOOL)storePropertyValue:(id)a3;
- (id)retrievePropertyValue;
@end

@implementation ASDTIOPAudioLPMicUInt32Property

- (ASDTIOPAudioLPMicUInt32Property)initWithConfig:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ASDTIOPAudioLPMicUInt32Property;
  v3 = [(ASDTCustomProperty *)&v6 initWithConfig:a3 propertyDataType:1918990199 qualifierDataType:0];
  v4 = v3;
  if (v3)
  {
    [(ASDTCustomProperty *)v3 setCacheMode:0];
    [(ASDTCustomProperty *)v4 setPropertyValueSize:4];
  }
  return v4;
}

- (ASDTIOPAudioLPMicDevice)lpMicDevice
{
  v3 = [(ASDCustomProperty *)self owner];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(ASDCustomProperty *)self owner];
  }
  else
  {
    v5 = 0;
  }
  return (ASDTIOPAudioLPMicDevice *)v5;
}

- (BOOL)checkPropertyValue:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASDTIOPAudioLPMicUInt32Property;
  if ([(ASDTCustomProperty *)&v10 checkPropertyValue:v4])
  {
    id v5 = v4;
    uint64_t v6 = [v5 length];
    BOOL v7 = v6 == [(ASDTCustomProperty *)self propertyValueSize];
    if (!v7)
    {
      v8 = ASDTIOPLogType();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        [(ASDTIOPAudioLPMicUInt32Property *)self checkPropertyValue:v8];
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)storePropertyValue:(id)a3
{
  id v4 = a3;
  unsigned int v10 = 0;
  [v4 getBytes:&v10 length:4];
  BOOL v5 = 0;
  if ([(ASDCustomProperty *)self selector] == 1634690413)
  {
    uint64_t v6 = [(ASDTIOPAudioLPMicUInt32Property *)self lpMicDevice];
    int v7 = [v6 setEnabledChannelMask:v10];

    if (v7)
    {
      v9.receiver = self;
      v9.super_class = (Class)ASDTIOPAudioLPMicUInt32Property;
      BOOL v5 = [(ASDTCustomProperty *)&v9 storePropertyValue:v4];
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (id)retrievePropertyValue
{
  int v8 = 0;
  v3 = [(ASDTIOPAudioLPMicUInt32Property *)self lpMicDevice];
  if (!v3) {
    goto LABEL_7;
  }
  unsigned int v4 = [(ASDCustomProperty *)self selector];
  if (v4 != 1634690413)
  {
    if (v4 == 1684893796)
    {
      int v5 = [v3 maximumPastDataFrames];
      goto LABEL_9;
    }
    if (v4 == 1684107364)
    {
      int v5 = [v3 availablePastDataFrames];
LABEL_9:
      int v8 = v5;
      goto LABEL_10;
    }
LABEL_7:
    uint64_t v6 = 0;
    goto LABEL_11;
  }
  if (![v3 getEnabledChannelMask:&v8]) {
    goto LABEL_7;
  }
LABEL_10:
  uint64_t v6 = [MEMORY[0x263EFF8F8] dataWithBytes:&v8 length:4];
LABEL_11:

  return v6;
}

- (void)checkPropertyValue:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v5 = [a1 name];
  int v6 = 138412546;
  int v7 = v5;
  __int16 v8 = 2048;
  uint64_t v9 = [a2 length];
  _os_log_error_impl(&dword_248A68000, a3, OS_LOG_TYPE_ERROR, "%@: set: Bad property data length: %lu", (uint8_t *)&v6, 0x16u);
}

@end