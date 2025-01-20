@interface ASDTIOPAudioCMPowerStateProperty
+ (id)ioServiceDependenciesForConfig:(id)a3;
- (ASDTIOPAudioCMDevice)clientManager;
- (ASDTIOPAudioCMPowerStateProperty)initWithConfig:(id)a3;
- (BOOL)checkPropertyValue:(id)a3;
- (BOOL)storePropertyValue:(id)a3;
- (id)retrievePropertyValue;
- (unsigned)powerStateDirection;
- (unsigned)powerStateDisabled;
- (unsigned)powerStateEnabled;
- (void)dealloc;
- (void)setClientManager:(id)a3;
- (void)setPowerStateDirection:(unsigned int)a3;
- (void)setPowerStateDisabled:(unsigned int)a3;
- (void)setPowerStateEnabled:(unsigned int)a3;
@end

@implementation ASDTIOPAudioCMPowerStateProperty

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

- (ASDTIOPAudioCMPowerStateProperty)initWithConfig:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ASDTIOPAudioCMPowerStateProperty;
  v5 = [(ASDTCustomProperty *)&v16 initWithConfig:v4 propertyDataType:1918990199 qualifierDataType:0];
  v6 = v5;
  if (!v5) {
    goto LABEL_5;
  }
  [(ASDTCustomProperty *)v5 setPropertyValueSize:4];
  [(ASDTCustomProperty *)v6 setCacheMode:0];
  v7 = [v4 asdtServiceID];
  v8 = +[ASDTIOServiceManager matchedIOServiceForID:v7];
  [(ASDTIOPAudioCMPowerStateProperty *)v6 setClientManager:v8];

  v9 = [(ASDTIOPAudioCMPowerStateProperty *)v6 clientManager];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v14 = ASDTIOPLogType();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ASDTIOPAudioCMPowerStateProperty initWithConfig:](v6);
    }
    goto LABEL_10;
  }
  v11 = [(ASDTIOPAudioCMPowerStateProperty *)v6 clientManager];
  char v12 = [v11 open];

  if ((v12 & 1) == 0)
  {
    v14 = ASDTIOPLogType();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ASDTIOPAudioCMPowerStateProperty initWithConfig:](v6);
    }
LABEL_10:

    v13 = 0;
    goto LABEL_11;
  }
  -[ASDTIOPAudioCMPowerStateProperty setPowerStateEnabled:](v6, "setPowerStateEnabled:", [v4 asdtIOPAudioCMPowerStatePropertyEnabled]);
  -[ASDTIOPAudioCMPowerStateProperty setPowerStateDisabled:](v6, "setPowerStateDisabled:", [v4 asdtIOPAudioCMPowerStatePropertyDisabled]);
  -[ASDTIOPAudioCMPowerStateProperty setPowerStateDirection:](v6, "setPowerStateDirection:", [v4 asdtIOPAudioCMPowerStatePropertyDirection]);

LABEL_5:
  v13 = v6;
LABEL_11:

  return v13;
}

- (void)dealloc
{
  id v3 = [(ASDTIOPAudioCMPowerStateProperty *)self clientManager];
  [v3 close];

  v4.receiver = self;
  v4.super_class = (Class)ASDTIOPAudioCMPowerStateProperty;
  [(ASDTIOPAudioCMPowerStateProperty *)&v4 dealloc];
}

- (BOOL)checkPropertyValue:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASDTIOPAudioCMPowerStateProperty;
  if ([(ASDTCustomProperty *)&v10 checkPropertyValue:v4])
  {
    id v5 = v4;
    uint64_t v6 = [v5 length];
    BOOL v7 = v6 == [(ASDTCustomProperty *)self propertyValueSize];
    if (!v7)
    {
      v8 = ASDTIOPLogType();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[ASDTIOPAudioCMPowerStateProperty checkPropertyValue:](self, v5);
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)retrievePropertyValue
{
  BOOL v8 = 0;
  id v3 = [(ASDTIOPAudioCMPowerStateProperty *)self clientManager];
  char v4 = [v3 getCurrentPowerState:&v8];

  BOOL v8 = (v4 & 1) != 0
    && (int v5 = v8, v5 == [(ASDTIOPAudioCMPowerStateProperty *)self powerStateEnabled]);
  uint64_t v6 = [MEMORY[0x263EFF8F8] dataWithBytes:&v8 length:4];
  return v6;
}

- (BOOL)storePropertyValue:(id)a3
{
  id v4 = a3;
  int v11 = 0;
  [v4 getBytes:&v11 length:4];
  if (v11) {
    uint64_t v5 = [(ASDTIOPAudioCMPowerStateProperty *)self powerStateEnabled];
  }
  else {
    uint64_t v5 = [(ASDTIOPAudioCMPowerStateProperty *)self powerStateDisabled];
  }
  uint64_t v6 = v5;
  BOOL v7 = [(ASDTIOPAudioCMPowerStateProperty *)self clientManager];
  LODWORD(v6) = objc_msgSend(v7, "makePowerRequestForState:andDirection:", v6, -[ASDTIOPAudioCMPowerStateProperty powerStateDirection](self, "powerStateDirection"));

  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)ASDTIOPAudioCMPowerStateProperty;
    BOOL v8 = [(ASDTCustomProperty *)&v10 storePropertyValue:v4];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (ASDTIOPAudioCMDevice)clientManager
{
  return self->_clientManager;
}

- (void)setClientManager:(id)a3
{
}

- (unsigned)powerStateEnabled
{
  return self->_powerStateEnabled;
}

- (void)setPowerStateEnabled:(unsigned int)a3
{
  self->_powerStateEnabled = a3;
}

- (unsigned)powerStateDisabled
{
  return self->_powerStateDisabled;
}

- (void)setPowerStateDisabled:(unsigned int)a3
{
  self->_powerStateDisabled = a3;
}

- (unsigned)powerStateDirection
{
  return self->_powerStateDirection;
}

- (void)setPowerStateDirection:(unsigned int)a3
{
  self->_powerStateDirection = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithConfig:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_248A68000, v2, v3, "%@: Failed to open client manager service with identifier: %@", v4, v5, v6, v7, v8);
}

- (void)initWithConfig:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_248A68000, v2, v3, "%@: Failed to retrieve client manager service with identifier: %@", v4, v5, v6, v7, v8);
}

- (void)checkPropertyValue:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v3 = [a1 name];
  [a2 length];
  OUTLINED_FUNCTION_1_0(&dword_248A68000, v4, v5, "%@: set: Bad property data length: %lu", v6, v7, v8, v9, 2u);
}

@end