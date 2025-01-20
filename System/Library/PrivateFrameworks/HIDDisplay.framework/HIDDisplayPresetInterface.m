@interface HIDDisplayPresetInterface
- (BOOL)setActivePresetIndex:(int64_t)a3 error:(id *)a4;
- (BOOL)setCurrentPresetIndex:(int64_t)a3 error:(id *)a4;
- (BOOL)setupPresets;
- (HIDDisplayPresetInterface)initWithContainerID:(id)a3;
- (HIDDisplayPresetInterface)initWithMatching:(id)a3;
- (HIDDisplayPresetInterface)initWithService:(unsigned int)a3;
- (NSArray)presets;
- (id)capabilities;
- (id)getHIDDevices;
- (id)getHIDElementForUsage:(int64_t)a3;
- (int64_t)getActivePresetIndex:(id *)a3;
- (int64_t)getCurrentPresetIndex:(id *)a3;
- (int64_t)getFactoryDefaultPresetIndex:(id *)a3;
- (void)createPresets;
@end

@implementation HIDDisplayPresetInterface

- (HIDDisplayPresetInterface)initWithMatching:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HIDDisplayPresetInterface;
  v3 = [(HIDDisplayInterface *)&v7 initWithMatching:a3];
  v4 = v3;
  if (v3 && [(HIDDisplayPresetInterface *)v3 setupPresets]) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (HIDDisplayPresetInterface)initWithContainerID:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HIDDisplayPresetInterface;
  v3 = [(HIDDisplayInterface *)&v7 initWithContainerID:a3];
  v4 = v3;
  if (v3 && [(HIDDisplayPresetInterface *)v3 setupPresets]) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (HIDDisplayPresetInterface)initWithService:(unsigned int)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HIDDisplayPresetInterface;
  v3 = [(HIDDisplayInterface *)&v7 initWithService:*(void *)&a3];
  v4 = v3;
  if (v3 && [(HIDDisplayPresetInterface *)v3 setupPresets]) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (BOOL)setupPresets
{
  v3 = [(HIDDisplayInterface *)self getDeviceElements:&unk_26D40FEF8];
  v4 = v3;
  if (v3 && [v3 count])
  {
    objc_storeStrong((id *)&self->_usageElementMap, v4);
    [(HIDDisplayPresetInterface *)self createPresets];
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)getHIDDevices
{
  return [(HIDDisplayInterface *)self getHIDDevicesForMatching:&unk_26D40FF48];
}

- (id)getHIDElementForUsage:(int64_t)a3
{
  usageElementMap = self->_usageElementMap;
  if (usageElementMap)
  {
    v4 = [NSNumber numberWithInteger:a3];
    usageElementMap = [usageElementMap objectForKey:v4];
  }
  return usageElementMap;
}

- (void)createPresets
{
  id obj = objc_alloc_init(MEMORY[0x263EFF980]);
  v3 = [(NSDictionary *)self->_usageElementMap objectForKey:&unk_26D40FD60];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 logicalMax];
    uint64_t v6 = v5 - [v4 logicalMin];
    if (v6 >= 0)
    {
      uint64_t v7 = 0;
      uint64_t v8 = v6 + 1;
      do
      {
        v9 = [[HIDDisplayPresetData alloc] initWithDisplayDevice:self index:v7];
        if (v9) {
          [obj addObject:v9];
        }

        ++v7;
      }
      while (v8 != v7);
      objc_storeStrong((id *)&self->_presets, obj);
    }
  }
}

- (int64_t)getFactoryDefaultPresetIndex:(id *)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  usageElementMap = self->_usageElementMap;
  if (!usageElementMap
    || ([(NSDictionary *)usageElementMap objectForKey:&unk_26D40FD48],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v11 = HIDDisplayLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[HIDDisplayPresetInterface getFactoryDefaultPresetIndex:]();
    }

    uint64_t v7 = 0;
    goto LABEL_8;
  }
  uint64_t v7 = (void *)v6;
  v13[0] = v6;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  BOOL v9 = [(HIDDisplayInterface *)self extract:v8 error:a3];

  if (!v9)
  {
LABEL_8:
    int64_t v10 = -1;
    goto LABEL_9;
  }
  int64_t v10 = [v7 integerValue];
LABEL_9:

  return v10;
}

- (int64_t)getActivePresetIndex:(id *)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  usageElementMap = self->_usageElementMap;
  if (!usageElementMap
    || ([(NSDictionary *)usageElementMap objectForKey:&unk_26D40FD78],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v11 = HIDDisplayLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[HIDDisplayPresetInterface getActivePresetIndex:]();
    }

    uint64_t v7 = 0;
    goto LABEL_8;
  }
  uint64_t v7 = (void *)v6;
  v13[0] = v6;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  BOOL v9 = [(HIDDisplayInterface *)self extract:v8 error:a3];

  if (!v9)
  {
LABEL_8:
    int64_t v10 = -1;
    goto LABEL_9;
  }
  int64_t v10 = [v7 integerValue];
LABEL_9:

  return v10;
}

- (BOOL)setActivePresetIndex:(int64_t)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v7 = HIDDisplayLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v28 = self;
    __int16 v29 = 2048;
    int64_t v30 = a3;
    _os_log_impl(&dword_221B0C000, v7, OS_LOG_TYPE_DEFAULT, "%@ setActivePresetIndex on preset index : %ld", buf, 0x16u);
  }

  if ((a3 & 0x8000000000000000) == 0 && [(NSArray *)self->_presets count] > a3)
  {
    uint64_t v8 = [(NSArray *)self->_presets objectAtIndexedSubscript:a3];
    if ([v8 valid])
    {
      usageElementMap = self->_usageElementMap;
      if (usageElementMap
        && ([(NSDictionary *)usageElementMap objectForKey:&unk_26D40FD78],
            (int64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v11 = v10;
        [v10 setIntegerValue:a3];
        v22 = v11;
        v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
        LOBYTE(a4) = [(HIDDisplayInterface *)self commit:v12 error:a4];
      }
      else
      {
        v11 = HIDDisplayLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[HIDDisplayPresetInterface setActivePresetIndex:error:]();
        }
        LOBYTE(a4) = 1;
      }
      goto LABEL_16;
    }
    if (a4)
    {
      id v16 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v17 = *MEMORY[0x263F08410];
      uint64_t v23 = *MEMORY[0x263F08320];
      v18 = [MEMORY[0x263F086E0] mainBundle];
      v19 = [v18 localizedStringForKey:@"Preset is not valid." value:&stru_26D40F450 table:0];
      v24 = v19;
      v20 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      *a4 = (id)[v16 initWithDomain:v17 code:-536870212 userInfo:v20];
    }
    v11 = HIDDisplayLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[HIDDisplayPresetInterface setActivePresetIndex:error:]();
    }
LABEL_15:
    LOBYTE(a4) = 0;
LABEL_16:

    return (char)a4;
  }
  if (a4)
  {
    id v13 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v14 = *MEMORY[0x263F08410];
    uint64_t v25 = *MEMORY[0x263F08320];
    uint64_t v8 = [MEMORY[0x263F086E0] mainBundle];
    v11 = [v8 localizedStringForKey:@"Preset index out of range." value:&stru_26D40F450 table:0];
    v26 = v11;
    v15 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    *a4 = (id)[v13 initWithDomain:v14 code:-536870206 userInfo:v15];

    goto LABEL_15;
  }
  return (char)a4;
}

- (BOOL)setCurrentPresetIndex:(int64_t)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  usageElementMap = self->_usageElementMap;
  if (usageElementMap
    && ([(NSDictionary *)usageElementMap objectForKey:&unk_26D40FD60],
        (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    BOOL v9 = v8;
    [v8 setIntegerValue:a3];
    v13[0] = v9;
    int64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    BOOL v11 = [(HIDDisplayInterface *)self commit:v10 error:a4];
  }
  else
  {
    BOOL v9 = HIDDisplayLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[HIDDisplayPresetInterface setCurrentPresetIndex:error:]();
    }
    BOOL v11 = 1;
  }

  return v11;
}

- (int64_t)getCurrentPresetIndex:(id *)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  usageElementMap = self->_usageElementMap;
  if (!usageElementMap
    || ([(NSDictionary *)usageElementMap objectForKey:&unk_26D40FD60],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    BOOL v11 = HIDDisplayLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[HIDDisplayPresetInterface getCurrentPresetIndex:]();
    }

    uint64_t v7 = 0;
    goto LABEL_8;
  }
  uint64_t v7 = (void *)v6;
  v13[0] = v6;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  BOOL v9 = [(HIDDisplayInterface *)self extract:v8 error:a3];

  if (!v9)
  {
LABEL_8:
    int64_t v10 = -1;
    goto LABEL_9;
  }
  int64_t v10 = [v7 integerValue];
LABEL_9:

  return v10;
}

- (id)capabilities
{
  v4[9] = *MEMORY[0x263EF8340];
  v4[0] = kHIDDisplayPresetFieldWritableKey;
  v4[1] = kHIDDisplayPresetFieldValidKey;
  v4[2] = kHIDDisplayPresetFieldNameKey;
  v4[3] = kHIDDisplayPresetFieldDescriptionKey;
  v4[4] = kHIDDisplayPresetFieldDataBlockOneLengthKey;
  v4[5] = kHIDDisplayPresetFieldDataBlockOneKey;
  v4[6] = kHIDDisplayPresetFieldDataBlockTwoLengthKey;
  v4[7] = kHIDDisplayPresetFieldDataBlockTwoKey;
  v4[8] = kHIDDisplayPresetUniqueIDKey;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:9];
  return v2;
}

- (NSArray)presets
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presets, 0);
  objc_storeStrong((id *)&self->_usageElementMap, 0);
}

- (void)getFactoryDefaultPresetIndex:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_221B0C000, v0, v1, "%@ getFactoryDefaultPresetIndex no associated element", v2, v3, v4, v5, v6);
}

- (void)getActivePresetIndex:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_221B0C000, v0, v1, "%@ getActivePresetIndex no associated element", v2, v3, v4, v5, v6);
}

- (void)setActivePresetIndex:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_221B0C000, v0, v1, "%@ setActivePresetIndex no associated element", v2, v3, v4, v5, v6);
}

- (void)setActivePresetIndex:error:.cold.2()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_221B0C000, v1, OS_LOG_TYPE_ERROR, "%@ setActivePresetIndex on invalid  preset index : %ld", v2, 0x16u);
}

- (void)setCurrentPresetIndex:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_221B0C000, v0, v1, "%@ setCurrentPresetIndex no associated element", v2, v3, v4, v5, v6);
}

- (void)getCurrentPresetIndex:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_221B0C000, v0, v1, "%@ getCurrentPresetIndex no associated element", v2, v3, v4, v5, v6);
}

@end