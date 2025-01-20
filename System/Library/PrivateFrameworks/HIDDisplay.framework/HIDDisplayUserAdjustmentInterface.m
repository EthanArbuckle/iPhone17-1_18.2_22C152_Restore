@interface HIDDisplayUserAdjustmentInterface
- (BOOL)invalidate:(id *)a3;
- (BOOL)set:(id)a3 error:(id *)a4;
- (BOOL)setupInterface;
- (BOOL)valid;
- (HIDDisplayUserAdjustmentInterface)initWithContainerID:(id)a3;
- (HIDDisplayUserAdjustmentInterface)initWithService:(unsigned int)a3;
- (id)get:(id *)a3;
- (id)getHIDDevices;
- (void)valid;
@end

@implementation HIDDisplayUserAdjustmentInterface

- (HIDDisplayUserAdjustmentInterface)initWithContainerID:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HIDDisplayUserAdjustmentInterface;
  v5 = [(HIDDisplayInterface *)&v10 initWithContainerID:v4];
  v6 = v5;
  if (!v5)
  {
    v9 = HIDDisplayLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[HIDDisplayUserAdjustmentInterface initWithContainerID:]();
    }
    goto LABEL_9;
  }
  if (![(HIDDisplayUserAdjustmentInterface *)v5 setupInterface])
  {
    v9 = HIDDisplayLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[HIDDisplayUserAdjustmentInterface initWithContainerID:]();
    }
LABEL_9:

    v7 = 0;
    goto LABEL_4;
  }
  v7 = v6;
LABEL_4:

  return v7;
}

- (HIDDisplayUserAdjustmentInterface)initWithService:(unsigned int)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HIDDisplayUserAdjustmentInterface;
  id v4 = -[HIDDisplayInterface initWithService:](&v9, sel_initWithService_);
  v5 = v4;
  if (!v4)
  {
    v8 = HIDDisplayLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[HIDDisplayUserAdjustmentInterface initWithService:](a3, v8);
    }
    goto LABEL_9;
  }
  if (![(HIDDisplayUserAdjustmentInterface *)v4 setupInterface])
  {
    v8 = HIDDisplayLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[HIDDisplayUserAdjustmentInterface initWithService:](a3, v8);
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
  return [(HIDDisplayInterface *)self getHIDDevicesForMatching:&unk_26D410038];
}

- (BOOL)setupInterface
{
  v3 = [(HIDDisplayInterface *)self getDeviceElements:&unk_26D410060];
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

- (BOOL)valid
{
  v13[1] = *MEMORY[0x263EF8340];
  usageElementMap = self->_usageElementMap;
  if (!usageElementMap
    || ([(NSDictionary *)usageElementMap objectForKey:&unk_26D40FE38],
        (uint64_t v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v8 = HIDDisplayLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[HIDDisplayUserAdjustmentInterface valid]();
    }
    goto LABEL_10;
  }
  BOOL v5 = (void *)v4;
  v13[0] = v4;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v12 = 0;
  BOOL v7 = [(HIDDisplayInterface *)self extract:v6 error:&v12];
  v8 = v12;

  if (!v7)
  {
    objc_super v10 = HIDDisplayLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[HIDDisplayUserAdjustmentInterface valid]();
    }

LABEL_10:
    BOOL v9 = 0;
    goto LABEL_11;
  }
  BOOL v9 = [v5 integerValue] != 0;

LABEL_11:
  return v9;
}

- (BOOL)invalidate:(id *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  usageElementMap = self->_usageElementMap;
  if (usageElementMap)
  {
    v6 = [(NSDictionary *)usageElementMap objectForKey:&unk_26D40FE38];
  }
  else
  {
    v6 = 0;
  }
  BOOL v7 = HIDDisplayLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = self;
    _os_log_impl(&dword_221B0C000, v7, OS_LOG_TYPE_DEFAULT, "%@ invalidate user adjustement", buf, 0xCu);
  }

  if (v6)
  {
    [v6 setIntegerValue:0];
    v11 = v6;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
    BOOL v9 = [(HIDDisplayInterface *)self commit:v8 error:a3];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)set:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  id v22 = (id)0xAAAAAAAAAAAAAAAALL;
  id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
  BOOL v7 = HIDDisplayLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_221B0C000, v7, OS_LOG_TYPE_INFO, "%@ set adjustment %@", buf, 0x16u);
  }

  v8 = [(HIDDisplayUserAdjustmentInterface *)self get:a4];
  BOOL v9 = v8 == 0;

  if (v9)
  {
    v13 = HIDDisplayLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[HIDDisplayUserAdjustmentInterface set:error:]();
    }
  }
  else
  {
    if (v6)
    {
      objc_super v10 = [(NSDictionary *)self->_usageElementMap objectForKey:&unk_26D40FE38];
      v11 = v10;
      if (v10)
      {
        [v10 setIntegerValue:1];
        [(id)v18[5] addObject:v11];
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v24 = __Block_byref_object_copy__0;
      v25 = __Block_byref_object_dispose__0;
      id v26 = 0;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __47__HIDDisplayUserAdjustmentInterface_set_error___block_invoke;
      v16[3] = &unk_2645DFD58;
      v16[4] = self;
      v16[5] = &v17;
      v16[6] = buf;
      [v6 enumerateKeysAndObjectsUsingBlock:v16];
      if ([(id)v18[5] count])
      {
        BOOL v12 = [(HIDDisplayInterface *)self commit:v18[5] error:a4];
        if (!a4) {
          goto LABEL_21;
        }
      }
      else
      {
        uint64_t v14 = HIDDisplayLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[HIDDisplayUserAdjustmentInterface set:error:]();
        }

        if (!a4)
        {
          BOOL v12 = 0;
          goto LABEL_21;
        }
        BOOL v12 = 0;
        *a4 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"Invalid argument" code:-536870206 userInfo:0];
      }
      *a4 = *(id *)(*(void *)&buf[8] + 40);
LABEL_21:
      _Block_object_dispose(buf, 8);

      goto LABEL_22;
    }
    if (a4)
    {
      BOOL v12 = 0;
      *a4 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"Invalid argument" code:-536870206 userInfo:0];
      goto LABEL_22;
    }
  }
  BOOL v12 = 0;
LABEL_22:
  _Block_object_dispose(&v17, 8);

  return v12;
}

void __47__HIDDisplayUserAdjustmentInterface_set_error___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v5 isEqualToString:kHIDDisplayUserAdjustmentDescriptionKey])
  {
    BOOL v7 = *(void **)(a1[4] + 40);
    if (v7)
    {
      v8 = [v7 objectForKey:&unk_26D40FE50];
      if (v8)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          BOOL v9 = [v6 dataUsingEncoding:2483028224];
          id v10 = v9;
          if (!v9 || ![v9 length])
          {
            __int16 v18 = 0;
            uint64_t v11 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&v18 length:2];

            BOOL v12 = HIDDisplayLog();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v20 = v6;
              _os_log_impl(&dword_221B0C000, v12, OS_LOG_TYPE_DEFAULT, "Invalid Description %@ , Converting it to 2 byte null value", buf, 0xCu);
            }

            id v10 = (id)v11;
          }
          goto LABEL_15;
        }
      }
      goto LABEL_18;
    }
LABEL_17:
    v8 = 0;
    goto LABEL_18;
  }
  if (![v5 isEqualToString:kHIDDisplayUserAdjustmentInformationKey]) {
    goto LABEL_17;
  }
  v13 = *(void **)(a1[4] + 40);
  if (!v13) {
    goto LABEL_17;
  }
  v8 = [v13 objectForKey:&unk_26D40FE68];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v6;
      if (![v10 length])
      {
        uint64_t v14 = HIDDisplayLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          __47__HIDDisplayUserAdjustmentInterface_set_error___block_invoke_cold_1();
        }

        uint64_t v15 = [objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"Invalid User Adjsutment Information" code:-536870206 userInfo:0];
        uint64_t v16 = *(void *)(a1[6] + 8);
        uint64_t v17 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = v15;

        goto LABEL_16;
      }
LABEL_15:
      [v8 setDataValue:v10];
      [*(id *)(*(void *)(a1[5] + 8) + 40) addObject:v8];
LABEL_16:
    }
  }
LABEL_18:
}

- (id)get:(id *)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v34 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v6 = 0;
  char v7 = 1;
  do
  {
    char v8 = v7;
    usageElementMap = self->_usageElementMap;
    if (usageElementMap)
    {
      id v10 = [NSNumber numberWithInteger:qword_221B14C00[v6]];
      uint64_t v11 = [(NSDictionary *)usageElementMap objectForKey:v10];

      if (v11)
      {
        [v5 addObject:v11];
      }
    }
    char v7 = 0;
    uint64_t v6 = 1;
  }
  while ((v8 & 1) != 0);
  if (![(HIDDisplayInterface *)self extract:v5 error:a3])
  {
    id v28 = 0;
    v29 = v34;
    goto LABEL_29;
  }
  uint64_t v13 = 0;
  char v14 = 1;
  *(void *)&long long v12 = 138412290;
  long long v33 = v12;
  do
  {
    char v15 = v14;
    uint64_t v16 = self->_usageElementMap;
    if (v16)
    {
      uint64_t v17 = qword_221B14C00[v13];
      __int16 v18 = [NSNumber numberWithInteger:v17];
      uint64_t v16 = [v16 objectForKey:v18];

      if (v16)
      {
        if (v17 == 3)
        {
          id v26 = [v16 dataValue];

          if (!v26)
          {
            id v20 = HIDDisplayLog();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v27 = [v16 dataValue];
              *(_DWORD *)buf = v33;
              v36 = v27;
              _os_log_impl(&dword_221B0C000, v20, OS_LOG_TYPE_DEFAULT, "Invalid user adjustment information %@", buf, 0xCu);
            }
            goto LABEL_20;
          }
          id v20 = [v16 dataValue];
          v24 = kHIDDisplayUserAdjustmentInformationKey;
          v25 = v34;
          uint64_t v21 = (__CFString *)v20;
        }
        else
        {
          if (v17 != 2) {
            goto LABEL_21;
          }
          uint64_t v19 = [v16 dataValue];
          id v20 = getUnicharStringFromData(v19);

          uint64_t v21 = (__CFString *)v20;
          if (!v20)
          {
            id v22 = HIDDisplayLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              v23 = [v16 dataValue];
              *(_DWORD *)buf = v33;
              v36 = v23;
              _os_log_impl(&dword_221B0C000, v22, OS_LOG_TYPE_DEFAULT, "Invalid / Empty user adjustment description %@", buf, 0xCu);
            }
            uint64_t v21 = &stru_26D40F450;
          }
          v24 = kHIDDisplayUserAdjustmentDescriptionKey;
          v25 = v34;
        }
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v21, v24, v33);
LABEL_20:
      }
    }
LABEL_21:

    char v14 = 0;
    uint64_t v13 = 1;
  }
  while ((v15 & 1) != 0);
  v30 = HIDDisplayLog();
  BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
  v29 = v34;
  if (v31)
  {
    *(_DWORD *)buf = 138412546;
    v36 = self;
    __int16 v37 = 2114;
    id v38 = v34;
    _os_log_impl(&dword_221B0C000, v30, OS_LOG_TYPE_DEFAULT, "%@ get user adjustment returned data %{public}@", buf, 0x16u);
  }

  id v28 = v34;
LABEL_29:

  return v28;
}

- (void).cxx_destruct
{
}

- (void)initWithContainerID:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_221B0C000, v0, v1, "Failed to create HIDDisplayUserAdjustmentInterface for %@", v2, v3, v4, v5, v6);
}

- (void)initWithContainerID:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_221B0C000, v0, v1, "Failed to setup HIDDisplayUserAdjustmentInterface for %@", v2, v3, v4, v5, v6);
}

- (void)initWithService:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_221B0C000, a2, OS_LOG_TYPE_ERROR, "Failed to create HIDDisplayUserAdjustmentInterface for %d", (uint8_t *)v2, 8u);
}

- (void)initWithService:(int)a1 .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_221B0C000, a2, OS_LOG_TYPE_ERROR, "Failed to setup HIDDisplayUserAdjustmentInterface for %d", (uint8_t *)v2, 8u);
}

- (void)valid
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_221B0C000, v1, OS_LOG_TYPE_ERROR, "%@ failed to extract valid element value with error %@", v2, 0x16u);
}

- (void)set:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_221B0C000, v0, v1, "%@ Failed to update elements", v2, v3, v4, v5, v6);
}

- (void)set:error:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_221B0C000, v0, v1, "%@ no matching element to set ", v2, v3, v4, v5, v6);
}

void __47__HIDDisplayUserAdjustmentInterface_set_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_221B0C000, v0, v1, "Invalid User Adjsutment Information %@ Cancel Device Transaction", v2, v3, v4, v5, v6);
}

@end