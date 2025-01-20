HIDDisplayDeviceManagementInterface *HIDDisplayCreateDeviceManagementInterfaceWithContainerID(uint64_t a1)
{
  HIDDisplayDeviceManagementInterface *v1;
  HIDDisplayDeviceManagementInterface *v2;
  HIDDisplayDeviceManagementInterface *v3;

  v1 = [[HIDDisplayDeviceManagementInterface alloc] initWithContainerID:a1];
  v2 = v1;
  if (v1) {
    v3 = v1;
  }

  return v2;
}

HIDDisplayDeviceManagementInterface *HIDDisplayCreateDeviceManagementInterfaceWithService(uint64_t a1)
{
  v1 = [[HIDDisplayDeviceManagementInterface alloc] initWithService:a1];
  v2 = v1;
  if (v1) {
    v3 = v1;
  }

  return v2;
}

uint64_t HIDDisplayDeviceManagementFactoryReset(void *a1, unsigned __int8 a2, uint64_t a3, void *a4)
{
  id v9 = 0;
  uint64_t v5 = [a1 factoryReset:a2 securityToken:a3 error:&v9];
  id v6 = v9;
  v7 = v6;
  if (a4 && (v5 & 1) == 0) {
    *a4 = v6;
  }

  return v5;
}

uint64_t HIDDisplayDeviceManagementSetFactoryResetData(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v9 = 0;
  uint64_t v5 = [a1 factoryReset:a2 securityToken:a3 error:&v9];
  id v6 = v9;
  v7 = v6;
  if (a4 && (v5 & 1) == 0) {
    *a4 = v6;
  }

  return v5;
}

uint64_t HIDDisplayDeviceManagementGetSecurityToken(void *a1, uint64_t a2, void *a3)
{
  id v8 = 0;
  uint64_t v4 = [a1 getSecurityToken:a2 error:&v8];
  id v5 = v8;
  id v6 = v5;
  if (a3 && (v4 & 1) == 0) {
    *a3 = v5;
  }

  return v4;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_221B0FA88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_221B10A30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_221B11AD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

id HIDDisplayLog()
{
  if (HIDDisplayLog_onceToken != -1) {
    dispatch_once(&HIDDisplayLog_onceToken, &__block_literal_global);
  }
  v0 = (void *)HIDDisplayLog_log;
  return v0;
}

uint64_t __HIDDisplayLog_block_invoke()
{
  HIDDisplayLog_log = (uint64_t)os_log_create(" com.apple.iohid ", "HIDDisplay");
  return MEMORY[0x270F9A758]();
}

id getUnicharStringFromData(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (!v1) {
    goto LABEL_8;
  }
  id v3 = v1;
  uint64_t v4 = [v3 bytes];
  unint64_t v5 = [v3 length];
  if (!v5) {
    goto LABEL_8;
  }
  unint64_t v6 = 0;
  uint64_t v7 = 0;
  do
  {
    if (!*(_WORD *)(v4 + v6)) {
      break;
    }
    ++v7;
    v6 += 2;
  }
  while (v6 < v5);
  if (v7) {
    id v8 = objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", objc_msgSend(v3, "bytes"), 2 * v7, 2483028224);
  }
  else {
LABEL_8:
  }
    id v8 = 0;

  return v8;
}

HIDDisplayIOReportingInterface *HIDDisplayCreateIOReportingInterfaceWithContainerID(uint64_t a1)
{
  id v1 = [[HIDDisplayIOReportingInterface alloc] initWithContainerID:a1];
  v2 = v1;
  if (v1) {
    id v3 = v1;
  }

  return v2;
}

uint64_t HIDDisplayIOReportingSetDispatchQueue(void *a1, const char *a2)
{
  return [a1 setDispatchQueue:a2];
}

uint64_t HIDDisplayIOReportingSetInputDataHandler(void *a1, const char *a2)
{
  return [a1 setInputDataHandler:a2];
}

uint64_t HIDDisplayIOReportingSetOutputData(void *a1, uint64_t a2, void *a3)
{
  id v8 = 0;
  uint64_t v4 = [a1 setOutputData:a2 error:&v8];
  id v5 = v8;
  unint64_t v6 = v5;
  if (a3 && (v4 & 1) == 0) {
    *a3 = v5;
  }

  return v4;
}

uint64_t HIDDisplayIOReportingSetCancelHandler(void *a1, const char *a2)
{
  return [a1 setCancelHandler:a2];
}

HIDDisplayUserAdjustmentInterface *HIDDisplayCreateUserAdjustmentInterfaceWithContainerID(uint64_t a1)
{
  id v1 = [[HIDDisplayUserAdjustmentInterface alloc] initWithContainerID:a1];
  v2 = v1;
  if (v1) {
    id v3 = v1;
  }

  return v2;
}

HIDDisplayUserAdjustmentInterface *HIDDisplayCreateUserAdjustmentInterfaceWithService(uint64_t a1)
{
  id v1 = [[HIDDisplayUserAdjustmentInterface alloc] initWithService:a1];
  v2 = v1;
  if (v1) {
    id v3 = v1;
  }

  return v2;
}

uint64_t HIDDisplayUserAdjustmentSetData(void *a1, uint64_t a2, void *a3)
{
  id v8 = 0;
  uint64_t v4 = [a1 set:a2 error:&v8];
  id v5 = v8;
  unint64_t v6 = v5;
  if (a3 && (v4 & 1) == 0) {
    *a3 = v5;
  }

  return v4;
}

uint64_t HIDDisplayUserAdjustmentCopyData(void *a1, void *a2)
{
  id v7 = 0;
  uint64_t v3 = [a1 get:&v7];
  id v4 = v7;
  id v5 = v4;
  if (a2 && !v3) {
    *a2 = v4;
  }

  return v3;
}

uint64_t HIDDisplayUserAdjustmentInvalidate(void *a1, void *a2)
{
  id v7 = 0;
  uint64_t v3 = [a1 invalidate:&v7];
  id v4 = v7;
  id v5 = v4;
  if (a2 && (v3 & 1) == 0) {
    *a2 = v4;
  }

  return v3;
}

HIDDisplayPresetInterface *HIDDisplayCreatePresetInterfaceWithContainerID(uint64_t a1)
{
  id v1 = [[HIDDisplayPresetInterface alloc] initWithContainerID:a1];
  v2 = v1;
  if (v1) {
    uint64_t v3 = v1;
  }

  return v2;
}

uint64_t HIDDisplayGetPresetCount(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = v1;
    uint64_t v3 = [v2 presets];
    uint64_t v4 = [v3 count];
  }
  else
  {
    v2 = HIDDisplayLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      HIDDisplayGetPresetCount_cold_1();
    }
    uint64_t v4 = -1;
  }

  return v4;
}

uint64_t HIDDisplayGetFactoryDefaultPresetIndex(void *a1, void *a2)
{
  id v3 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = v3;
    id v9 = 0;
    uint64_t v5 = [v4 getFactoryDefaultPresetIndex:&v9];
    id v6 = v9;
    if (v5 == -1)
    {
      id v7 = HIDDisplayLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        HIDDisplayGetFactoryDefaultPresetIndex_cold_1();
      }

      if (a2) {
        *a2 = v6;
      }
    }
  }
  else
  {
    uint64_t v4 = HIDDisplayLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      HIDDisplayGetPresetCount_cold_1();
    }
    uint64_t v5 = -1;
  }

  return v5;
}

uint64_t HIDDisplayGetActivePresetIndex(void *a1, void *a2)
{
  id v3 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = v3;
    id v9 = 0;
    uint64_t v5 = [v4 getActivePresetIndex:&v9];
    id v6 = v9;
    if (v5 == -1)
    {
      id v7 = HIDDisplayLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        HIDDisplayGetActivePresetIndex_cold_1();
      }

      if (a2) {
        *a2 = v6;
      }
    }
  }
  else
  {
    uint64_t v4 = HIDDisplayLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      HIDDisplayGetPresetCount_cold_1();
    }
    uint64_t v5 = -1;
  }

  return v5;
}

uint64_t HIDDisplaySetActivePresetIndex(void *a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    id v13 = 0;
    uint64_t v7 = [v6 setActivePresetIndex:a2 error:&v13];
    id v8 = v13;
    if ((v7 & 1) == 0)
    {
      id v9 = HIDDisplayLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v15 = v6;
        __int16 v16 = 2112;
        id v17 = v8;
        __int16 v18 = 2048;
        uint64_t v19 = a2;
        _os_log_error_impl(&dword_221B0C000, v9, OS_LOG_TYPE_ERROR, "%@ HIDDisplaySetActivePresetIndex error %@ for  preset index %ld ", buf, 0x20u);
      }

      if (a3) {
        *a3 = v8;
      }
    }
  }
  else
  {
    uint64_t v10 = HIDDisplayLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      HIDDisplayGetPresetCount_cold_1();
    }

    if (a3)
    {
      id v11 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v7 = 0;
      *a3 = [v11 initWithDomain:*MEMORY[0x263F08410] code:-536870911 userInfo:0];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }

  return v7;
}

id HIDDisplayCopyPreset(void *a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v15 = HIDDisplayLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      HIDDisplayGetPresetCount_cold_1();
    }

    if (!a3)
    {
      id v14 = 0;
      uint64_t v7 = 0;
      goto LABEL_23;
    }
    uint64_t v16 = [objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"Invalid object" code:-536870206 userInfo:0];
    id v14 = 0;
    uint64_t v7 = 0;
    goto LABEL_15;
  }
  id v6 = v5;
  uint64_t v7 = v6;
  if ((a2 & 0x8000000000000000) != 0
    || ([v6 presets],
        id v8 = objc_claimAutoreleasedReturnValue(),
        unint64_t v9 = [v8 count],
        v8,
        v9 <= a2))
  {
    id v17 = HIDDisplayLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      HIDDisplayCopyPreset_cold_1(a2, v17);
    }

    if (!a3)
    {
      id v14 = 0;
      goto LABEL_23;
    }
    uint64_t v16 = [objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"Invalid index" code:-536870206 userInfo:0];
    id v14 = 0;
LABEL_15:
    *a3 = v16;
    goto LABEL_23;
  }
  uint64_t v10 = [v7 presets];
  id v11 = [v10 objectAtIndex:a2];

  id v20 = 0;
  uint64_t v12 = [v11 get:&v20];
  id v13 = v20;
  if (v12 && [v12 count])
  {
    id v14 = v12;
  }
  else
  {
    __int16 v18 = HIDDisplayLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v22 = v7;
      __int16 v23 = 2112;
      id v24 = v13;
      __int16 v25 = 2048;
      unint64_t v26 = a2;
      _os_log_error_impl(&dword_221B0C000, v18, OS_LOG_TYPE_ERROR, "%@ HIDDisplayCopyPreset error %@ for  preset index %ld ", buf, 0x20u);
    }

    id v14 = 0;
    if (a3) {
      *a3 = (uint64_t)v13;
    }
  }

LABEL_23:
  return v14;
}

uint64_t HIDDisplaySetPreset(void *a1, unint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v17 = HIDDisplayLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      HIDDisplayGetPresetCount_cold_1();
    }

    if (!a4)
    {
      uint64_t v14 = 0;
      id v15 = 0;
      unint64_t v9 = 0;
      goto LABEL_21;
    }
    id v18 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"Invalid object" code:-536870206 userInfo:0];
    id v15 = v18;
    uint64_t v14 = 0;
    unint64_t v9 = 0;
    goto LABEL_18;
  }
  id v8 = v7;
  unint64_t v9 = v8;
  if ((a2 & 0x8000000000000000) != 0
    || ([v8 presets],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        unint64_t v11 = [v10 count],
        v10,
        v11 <= a2))
  {
    uint64_t v19 = HIDDisplayLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      HIDDisplaySetPreset_cold_1();
    }

    if (!a4)
    {
      uint64_t v14 = 0;
      id v15 = 0;
      goto LABEL_21;
    }
    id v18 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"Invalid index" code:-536870206 userInfo:0];
    id v15 = v18;
    uint64_t v14 = 0;
LABEL_18:
    *a4 = v18;
    goto LABEL_21;
  }
  uint64_t v12 = [v9 presets];
  id v13 = [v12 objectAtIndex:a2];

  id v21 = 0;
  uint64_t v14 = [v13 set:a3 error:&v21];
  id v15 = v21;
  if ((v14 & 1) == 0)
  {
    uint64_t v16 = HIDDisplayLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v23 = v9;
      __int16 v24 = 2112;
      id v25 = v15;
      __int16 v26 = 2048;
      unint64_t v27 = a2;
      _os_log_error_impl(&dword_221B0C000, v16, OS_LOG_TYPE_ERROR, "%@ HIDDisplaySetPreset error %@ for  preset index %ld ", buf, 0x20u);
    }

    if (a4) {
      *a4 = v15;
    }
  }

LABEL_21:
  return v14;
}

uint64_t HIDDisplayIsPresetValid(void *a1, unint64_t a2)
{
  id v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = HIDDisplayLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      HIDDisplayGetPresetCount_cold_1();
    }
    goto LABEL_10;
  }
  uint64_t v4 = v3;
  id v5 = v4;
  if ((a2 & 0x8000000000000000) != 0
    || ([v4 presets],
        id v6 = objc_claimAutoreleasedReturnValue(),
        unint64_t v7 = [v6 count],
        v6,
        v7 <= a2))
  {
    unint64_t v11 = HIDDisplayLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      HIDDisplaySetPreset_cold_1();
    }

LABEL_10:
    uint64_t v10 = 0;
    goto LABEL_11;
  }
  id v8 = [v5 presets];
  unint64_t v9 = [v8 objectAtIndex:a2];

  uint64_t v10 = [v9 valid];
LABEL_11:

  return v10;
}

uint64_t HIDDisplayIsPresetWritable(void *a1, unint64_t a2)
{
  id v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = HIDDisplayLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      HIDDisplayGetPresetCount_cold_1();
    }
    goto LABEL_10;
  }
  uint64_t v4 = v3;
  id v5 = v4;
  if ((a2 & 0x8000000000000000) != 0
    || ([v4 presets],
        id v6 = objc_claimAutoreleasedReturnValue(),
        unint64_t v7 = [v6 count],
        v6,
        v7 <= a2))
  {
    unint64_t v11 = HIDDisplayLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      HIDDisplaySetPreset_cold_1();
    }

LABEL_10:
    uint64_t v10 = 0;
    goto LABEL_11;
  }
  id v8 = [v5 presets];
  unint64_t v9 = [v8 objectAtIndex:a2];

  uint64_t v10 = [v9 writable];
LABEL_11:

  return v10;
}

void *HIDDisplayGetPresetCapabilities(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = v1;
    id v3 = [v2 capabilities];
  }
  else
  {
    v2 = HIDDisplayLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      HIDDisplayGetPresetCount_cold_1();
    }
    id v3 = 0;
  }

  return v3;
}

void *HIDDisplayCopyPresetUniqueID(void *a1, unint64_t a2)
{
  id v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = HIDDisplayLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      HIDDisplayGetPresetCount_cold_1();
    }
    goto LABEL_12;
  }
  uint64_t v4 = v3;
  id v5 = v4;
  if ((a2 & 0x8000000000000000) != 0
    || ([v4 presets],
        id v6 = objc_claimAutoreleasedReturnValue(),
        unint64_t v7 = [v6 count],
        v6,
        v7 <= a2))
  {
    id v13 = HIDDisplayLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      HIDDisplaySetPreset_cold_1();
    }

LABEL_12:
    unint64_t v11 = 0;
    goto LABEL_13;
  }
  id v8 = [v5 presets];
  unint64_t v9 = [v8 objectAtIndex:a2];

  uint64_t v10 = [v9 uniqueID];
  unint64_t v11 = v10;
  if (v10) {
    id v12 = v10;
  }

LABEL_13:
  return v11;
}

HIDDisplayPresetInterface *HIDDisplayCreatePresetInterfaceWithService(uint64_t a1)
{
  id v1 = [[HIDDisplayPresetInterface alloc] initWithService:a1];
  v2 = v1;
  if (v1) {
    id v3 = v1;
  }

  return v2;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void *HIDDisplayGetContainerID(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = v1;
    id v3 = [v2 containerID];
  }
  else
  {
    v2 = HIDDisplayLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      HIDDisplayGetContainerID_cold_1(v2);
    }
    id v3 = 0;
  }

  return v3;
}

void HIDDisplayGetPresetCount_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_221B0C000, v0, v1, "Invalid HIDDisplayPresetInterfaceRef", v2, v3, v4, v5, v6);
}

void HIDDisplayGetFactoryDefaultPresetIndex_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_221B0C000, v0, v1, "%@ HIDDisplayGetFactoryDefaultPresetIndex error %@ ");
}

void HIDDisplayGetActivePresetIndex_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_221B0C000, v0, v1, "%@ HIDDisplayGetActivePresetIndex error %@ ");
}

void HIDDisplayCopyPreset_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_221B0C000, a2, OS_LOG_TYPE_ERROR, "Invalid preset index %ld ", (uint8_t *)&v2, 0xCu);
}

void HIDDisplaySetPreset_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_221B0C000, v0, v1, "%@ Invalid preset index %ld ");
}

void HIDDisplayGetContainerID_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_221B0C000, log, OS_LOG_TYPE_ERROR, "Invalid HIDDisplayInterfaceRef", v1, 2u);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x270EF4A38](*(void *)&entry, entryID);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF4A50](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}