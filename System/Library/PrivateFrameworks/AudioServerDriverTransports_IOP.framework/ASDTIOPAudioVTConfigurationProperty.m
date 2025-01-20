@interface ASDTIOPAudioVTConfigurationProperty
+ (id)configDictForService:(id)a3;
- (ASDTIOPAudioVTConfigurationProperty)initWithConfig:(id)a3;
- (BOOL)checkPropertyValue:(id)a3;
- (BOOL)storePropertyValue:(id)a3;
- (id)retrievePropertyValue;
@end

@implementation ASDTIOPAudioVTConfigurationProperty

+ (id)configDictForService:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F28D20];
  v8[0] = *MEMORY[0x263F28D40];
  v8[1] = v3;
  v9[0] = @"ASDTIOPAudioVTConfigurationProperty";
  v9[1] = a3;
  v4 = NSDictionary;
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

- (ASDTIOPAudioVTConfigurationProperty)initWithConfig:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  v4 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:a3];
  uint64_t v5 = *MEMORY[0x263F28CF8];
  v12[0] = *MEMORY[0x263F28D10];
  v12[1] = v5;
  uint64_t v6 = *MEMORY[0x263F28D50];
  v13[0] = &unk_26FCB4338;
  v13[1] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  [v4 asdtAddMissingEntriesFromDictionary:v7];

  v11.receiver = self;
  v11.super_class = (Class)ASDTIOPAudioVTConfigurationProperty;
  v8 = [(ASDTIOPAudioVTProperty *)&v11 initWithConfig:v4 propertyDataType:1886155636 qualifierDataType:0];
  v9 = v8;
  if (v8) {
    [(ASDTIOPAudioVTConfigurationProperty *)v8 storePropertyValue:MEMORY[0x263EFFA78]];
  }

  return v9;
}

- (BOOL)checkPropertyValue:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDTIOPAudioVTConfigurationProperty;
  if ([(ASDTCustomProperty *)&v9 checkPropertyValue:v4])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [v4 objectForKey:@"CorealisRTModel"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) == 0)
      {
        v7 = ASDTIOPLogType();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[ASDTIOPAudioVTConfigurationProperty checkPropertyValue:](self);
        }
      }
    }
    else
    {
      uint64_t v5 = ASDTIOPLogType();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[ASDTIOPAudioVTConfigurationProperty checkPropertyValue:](self);
      }
      char isKindOfClass = 0;
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)storePropertyValue:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unsigned int v22 = 0;
  uint64_t v5 = [(ASDTIOPAudioVTProperty *)self vtDevice];
  char v6 = [v5 getIsEnabled:&v22];

  if (v6)
  {
    if (!v22
      || ([(ASDTIOPAudioVTProperty *)self vtDevice],
          v7 = objc_claimAutoreleasedReturnValue(),
          char v8 = [v7 setEnabled:0],
          v7,
          (v8 & 1) != 0))
    {
      objc_super v9 = v4;
      v10 = [v9 objectForKey:@"CorealisRTModelVersion"];
      objc_super v11 = ASDTIOPLogType();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [(ASDTCustomProperty *)self name];
        v13 = (void *)v12;
        v14 = @"<unknown>";
        if (v10) {
          v14 = v10;
        }
        *(_DWORD *)buf = 138412546;
        uint64_t v24 = v12;
        __int16 v25 = 2112;
        v26 = v14;
        _os_log_impl(&dword_248A68000, v11, OS_LOG_TYPE_DEFAULT, "%@: Updating VT configuration to '%@'\n", buf, 0x16u);
      }
      v15 = [(ASDTIOPAudioVTProperty *)self vtDevice];
      char v16 = [v15 setConfigurationInfo:v9];

      if (v16)
      {
        if (!v22
          || ([(ASDTIOPAudioVTProperty *)self vtDevice],
              v17 = objc_claimAutoreleasedReturnValue(),
              char v18 = [v17 setEnabled:v22],
              v17,
              (v18 & 1) != 0))
        {
          BOOL v19 = 1;
LABEL_22:

          goto LABEL_23;
        }
        v20 = ASDTIOPLogType();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[ASDTIOPAudioVTConfigurationProperty storePropertyValue:](self);
        }
      }
      else
      {
        v20 = ASDTIOPLogType();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[ASDTIOPAudioVTConfigurationProperty storePropertyValue:](self);
        }
      }

      BOOL v19 = 0;
      goto LABEL_22;
    }
    objc_super v9 = ASDTIOPLogType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ASDTIOPAudioVTConfigurationProperty storePropertyValue:](self);
    }
  }
  else
  {
    objc_super v9 = ASDTIOPLogType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ASDTIOPAudioVTConfigurationProperty storePropertyValue:].cold.4(self);
    }
  }
  BOOL v19 = 0;
LABEL_23:

  return v19;
}

- (id)retrievePropertyValue
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ASDTIOPAudioVTProperty *)self vtDevice];
  char v4 = [v3 isConfigured];

  if (v4)
  {
    uint64_t v5 = [(ASDTIOPAudioVTProperty *)self vtDevice];
    char v6 = [v5 getConfigurationInfo];
  }
  else
  {
    char v8 = @"CorealisRTModelVersion";
    v9[0] = @"<na>";
    char v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  return v6;
}

- (void)checkPropertyValue:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_248A68000, v2, v3, "%@: VT configuration data invalid.", v4, v5, v6, v7, v8);
}

- (void)checkPropertyValue:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_248A68000, v2, v3, "%@: VT configuration is not a dictionary.", v4, v5, v6, v7, v8);
}

- (void)storePropertyValue:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_248A68000, v2, v3, "%@: Could not enable the VT device.", v4, v5, v6, v7, v8);
}

- (void)storePropertyValue:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_248A68000, v2, v3, "%@: Failed to set the VT configuration.", v4, v5, v6, v7, v8);
}

- (void)storePropertyValue:(void *)a1 .cold.3(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_248A68000, v2, v3, "%@: Could not disable the VT device.", v4, v5, v6, v7, v8);
}

- (void)storePropertyValue:(void *)a1 .cold.4(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_248A68000, v2, v3, "%@: Could not determine if the VT device was enabled.", v4, v5, v6, v7, v8);
}

@end