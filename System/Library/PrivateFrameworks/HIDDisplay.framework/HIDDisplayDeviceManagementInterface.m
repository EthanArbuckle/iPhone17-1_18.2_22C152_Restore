@interface HIDDisplayDeviceManagementInterface
- (BOOL)factoryReset:(unsigned __int8)a3 securityToken:(unint64_t)a4 error:(id *)a5;
- (BOOL)getSecurityToken:(unint64_t *)a3 error:(id *)a4;
- (BOOL)setupInterface;
- (HIDDisplayDeviceManagementInterface)initWithContainerID:(id)a3;
- (HIDDisplayDeviceManagementInterface)initWithService:(unsigned int)a3;
- (id)getHIDDevices;
@end

@implementation HIDDisplayDeviceManagementInterface

- (HIDDisplayDeviceManagementInterface)initWithContainerID:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HIDDisplayDeviceManagementInterface;
  v5 = [(HIDDisplayInterface *)&v22 initWithContainerID:v4];
  v6 = v5;
  if (!v5)
  {
    v9 = HIDDisplayLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[HIDDisplayDeviceManagementInterface initWithContainerID:]((uint64_t)v4, v9, v10, v11, v12, v13, v14, v15);
    }
    goto LABEL_9;
  }
  if (![(HIDDisplayDeviceManagementInterface *)v5 setupInterface])
  {
    v9 = HIDDisplayLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[HIDDisplayDeviceManagementInterface initWithContainerID:]((uint64_t)v4, v9, v16, v17, v18, v19, v20, v21);
    }
LABEL_9:

    v7 = 0;
    goto LABEL_4;
  }
  v7 = v6;
LABEL_4:

  return v7;
}

- (HIDDisplayDeviceManagementInterface)initWithService:(unsigned int)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HIDDisplayDeviceManagementInterface;
  id v4 = -[HIDDisplayInterface initWithService:](&v9, sel_initWithService_);
  v5 = v4;
  if (!v4)
  {
    v8 = HIDDisplayLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[HIDDisplayDeviceManagementInterface initWithService:](a3, v8);
    }
    goto LABEL_9;
  }
  if (![(HIDDisplayDeviceManagementInterface *)v4 setupInterface])
  {
    v8 = HIDDisplayLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[HIDDisplayDeviceManagementInterface initWithService:](a3, v8);
    }
LABEL_9:

    v6 = 0;
    goto LABEL_4;
  }
  v6 = v5;
LABEL_4:

  return v6;
}

- (id)getHIDDevices
{
  return [(HIDDisplayInterface *)self getHIDDevicesForMatching:&unk_26D40FEA8];
}

- (BOOL)factoryReset:(unsigned __int8)a3 securityToken:(unint64_t)a4 error:(id *)a5
{
  unsigned int v7 = a3;
  v24[2] = *MEMORY[0x263EF8340];
  objc_super v9 = HIDDisplayLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412546;
    uint64_t v19 = self;
    __int16 v20 = 1024;
    LODWORD(v21) = v7;
    _os_log_impl(&dword_221B0C000, v9, OS_LOG_TYPE_DEFAULT, "%@ factoryReset type %d", (uint8_t *)&v18, 0x12u);
  }

  usageElementMap = self->_usageElementMap;
  if (usageElementMap)
  {
    uint64_t v11 = [(NSDictionary *)usageElementMap objectForKey:&unk_26D40FCD0];
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v12 = self->_usageElementMap;
  if (v12)
  {
    uint64_t v13 = [(NSDictionary *)v12 objectForKey:&unk_26D40FCE8];
    uint64_t v14 = (void *)v13;
    if (v11 && v13)
    {
      [v11 setIntegerValue:v7];
      [v14 setIntegerValue:a4];
      v24[0] = v11;
      v24[1] = v14;
      uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
      BOOL v16 = [(HIDDisplayInterface *)self commit:v15 error:a5];
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  uint64_t v15 = HIDDisplayLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    int v18 = 138412802;
    uint64_t v19 = self;
    __int16 v20 = 2112;
    uint64_t v21 = v11;
    __int16 v22 = 2112;
    v23 = v14;
    _os_log_error_impl(&dword_221B0C000, v15, OS_LOG_TYPE_ERROR, "%@ factoryResetElement no associated element factoryReset : %@ securityToken : %@", (uint8_t *)&v18, 0x20u);
  }
  BOOL v16 = 0;
LABEL_14:

  return v16;
}

- (BOOL)setupInterface
{
  v3 = [(HIDDisplayInterface *)self getDeviceElements:&unk_26D40FED0];
  id v4 = v3;
  if (v3 && [v3 count])
  {
    objc_storeStrong((id *)&self->_usageElementMap, v4);
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)getSecurityToken:(unint64_t *)a3 error:(id *)a4
{
  v21[1] = *MEMORY[0x263EF8340];
  usageElementMap = self->_usageElementMap;
  if (!usageElementMap)
  {
    if (a3 || !a4) {
      goto LABEL_11;
    }
    objc_super v9 = 0;
LABEL_10:
    [MEMORY[0x263F087E8] errorWithDomain:@"Invalid Argument" code:-536870206 userInfo:0];
    BOOL v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  uint64_t v8 = [(NSDictionary *)usageElementMap objectForKey:&unk_26D40FCE8];
  objc_super v9 = (void *)v8;
  if (!a3 && a4) {
    goto LABEL_10;
  }
  if (!v8)
  {
LABEL_11:
    uint64_t v13 = HIDDisplayLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[HIDDisplayDeviceManagementInterface getSecurityToken:error:]((uint64_t)self, v13, v14, v15, v16, v17, v18, v19);
    }

    objc_super v9 = 0;
    goto LABEL_14;
  }
  v21[0] = v8;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  BOOL v11 = [(HIDDisplayInterface *)self extract:v10 error:a4];

  if (!v11)
  {
LABEL_14:
    BOOL v12 = 0;
    goto LABEL_15;
  }
  *a3 = [v9 integerValue];
  BOOL v12 = 1;
LABEL_15:

  return v12;
}

- (void).cxx_destruct
{
}

- (void)initWithContainerID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithContainerID:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithService:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_221B0C000, a2, OS_LOG_TYPE_ERROR, "Failed to create HIDDisplayDeviceManagementInterface for %d", (uint8_t *)v2, 8u);
}

- (void)initWithService:(int)a1 .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_221B0C000, a2, OS_LOG_TYPE_ERROR, "Failed to setup HIDDisplayDeviceManagementInterface for %d", (uint8_t *)v2, 8u);
}

- (void)getSecurityToken:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end