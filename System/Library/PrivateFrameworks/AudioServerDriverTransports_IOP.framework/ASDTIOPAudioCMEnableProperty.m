@interface ASDTIOPAudioCMEnableProperty
+ (id)ioServiceDependenciesForConfig:(id)a3;
- (ASDTIOPAudioCMDevice)clientManager;
- (ASDTIOPAudioCMEnableProperty)initWithConfig:(id)a3;
- (BOOL)checkPropertyValue:(id)a3;
- (BOOL)storePropertyValue:(id)a3;
- (id)retrievePropertyValue;
- (unsigned)enableDirection;
- (void)dealloc;
- (void)setClientManager:(id)a3;
- (void)setEnableDirection:(unsigned int)a3;
@end

@implementation ASDTIOPAudioCMEnableProperty

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

- (ASDTIOPAudioCMEnableProperty)initWithConfig:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ASDTIOPAudioCMEnableProperty;
  v5 = [(ASDTCustomProperty *)&v16 initWithConfig:v4 propertyDataType:1918990199 qualifierDataType:0];
  v6 = v5;
  if (!v5) {
    goto LABEL_5;
  }
  [(ASDTCustomProperty *)v5 setPropertyValueSize:4];
  [(ASDTCustomProperty *)v6 setCacheMode:0];
  v7 = [v4 asdtServiceID];
  v8 = +[ASDTIOServiceManager matchedIOServiceForID:v7];
  [(ASDTIOPAudioCMEnableProperty *)v6 setClientManager:v8];

  v9 = [(ASDTIOPAudioCMEnableProperty *)v6 clientManager];
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
  v11 = [(ASDTIOPAudioCMEnableProperty *)v6 clientManager];
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
  -[ASDTIOPAudioCMEnableProperty setEnableDirection:](v6, "setEnableDirection:", [v4 asdtIOPAudioCMEnablePropertyDirection]);

LABEL_5:
  v13 = v6;
LABEL_11:

  return v13;
}

- (void)dealloc
{
  id v3 = [(ASDTIOPAudioCMEnableProperty *)self clientManager];
  [v3 close];

  v4.receiver = self;
  v4.super_class = (Class)ASDTIOPAudioCMEnableProperty;
  [(ASDTIOPAudioCMEnableProperty *)&v4 dealloc];
}

- (BOOL)checkPropertyValue:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASDTIOPAudioCMEnableProperty;
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
  unsigned __int8 v6 = 0;
  v2 = [(ASDTIOPAudioCMEnableProperty *)self clientManager];
  [v2 getEnableState:&v6];

  int v5 = v6;
  id v3 = [MEMORY[0x263EFF8F8] dataWithBytes:&v5 length:4];
  return v3;
}

- (BOOL)storePropertyValue:(id)a3
{
  id v4 = a3;
  int v13 = 0;
  [v4 getBytes:&v13 length:4];
  int v5 = v13;
  unsigned __int8 v6 = [(ASDTIOPAudioCMEnableProperty *)self clientManager];
  uint64_t v7 = [(ASDTIOPAudioCMEnableProperty *)self enableDirection];
  if (!v5)
  {
    int v10 = [v6 disableInDirection:v7];

    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    BOOL v9 = 0;
    goto LABEL_6;
  }
  char v8 = [v6 enableInDirection:v7];

  if ((v8 & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  v12.receiver = self;
  v12.super_class = (Class)ASDTIOPAudioCMEnableProperty;
  BOOL v9 = [(ASDTCustomProperty *)&v12 storePropertyValue:v4];
LABEL_6:

  return v9;
}

- (ASDTIOPAudioCMDevice)clientManager
{
  return self->_clientManager;
}

- (void)setClientManager:(id)a3
{
}

- (unsigned)enableDirection
{
  return self->_enableDirection;
}

- (void)setEnableDirection:(unsigned int)a3
{
  self->_enableDirection = a3;
}

- (void).cxx_destruct
{
}

@end