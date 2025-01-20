@interface ASDTIOPAudioVTProperty
+ (id)ioServiceDependenciesForConfig:(id)a3;
- (ASDTIOPAudioVTDevice)vtDevice;
- (ASDTIOPAudioVTProperty)initWithConfig:(id)a3 propertyDataType:(unsigned int)a4 qualifierDataType:(unsigned int)a5;
- (void)dealloc;
- (void)setVtDevice:(id)a3;
@end

@implementation ASDTIOPAudioVTProperty

+ (id)ioServiceDependenciesForConfig:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 asdtServiceID];
  v5 = +[ASDTIOServiceManager dependencyForID:v4 andConfiguration:v3];

  if (v5)
  {
    v8[0] = v5;
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ASDTIOPAudioVTProperty)initWithConfig:(id)a3 propertyDataType:(unsigned int)a4 qualifierDataType:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ASDTIOPAudioVTProperty;
  v9 = [(ASDTCustomProperty *)&v19 initWithConfig:v8 propertyDataType:v6 qualifierDataType:v5];
  if (!v9) {
    goto LABEL_5;
  }
  v10 = [v8 asdtServiceID];
  v11 = +[ASDTIOServiceManager matchedIOServiceForID:v10];
  [(ASDTIOPAudioVTProperty *)v9 setVtDevice:v11];

  v12 = [(ASDTIOPAudioVTProperty *)v9 vtDevice];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v17 = ASDTIOPLogType();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[ASDTIOPAudioVTProperty initWithConfig:propertyDataType:qualifierDataType:](v9);
    }
    goto LABEL_10;
  }
  v14 = [(ASDTIOPAudioVTProperty *)v9 vtDevice];
  char v15 = [v14 open];

  if ((v15 & 1) == 0)
  {
    v17 = ASDTIOPLogType();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[ASDTIOPAudioVTProperty initWithConfig:propertyDataType:qualifierDataType:](v9);
    }
LABEL_10:

    v16 = 0;
    goto LABEL_11;
  }

LABEL_5:
  v16 = v9;
LABEL_11:

  return v16;
}

- (void)dealloc
{
  id v3 = [(ASDTIOPAudioVTProperty *)self vtDevice];
  [v3 close];

  v4.receiver = self;
  v4.super_class = (Class)ASDTIOPAudioVTProperty;
  [(ASDTIOPAudioVTProperty *)&v4 dealloc];
}

- (ASDTIOPAudioVTDevice)vtDevice
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_vtDevice);
  return (ASDTIOPAudioVTDevice *)WeakRetained;
}

- (void)setVtDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithConfig:(void *)a1 propertyDataType:qualifierDataType:.cold.1(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_248A68000, v2, v3, "%@: Failed to open legacy voice trigger device '%@'", v4, v5, v6, v7, v8);
}

- (void)initWithConfig:(void *)a1 propertyDataType:qualifierDataType:.cold.2(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_248A68000, v2, v3, "%@: Failed to retrieve legacy voice trigger device for identifier: %@", v4, v5, v6, v7, v8);
}

@end