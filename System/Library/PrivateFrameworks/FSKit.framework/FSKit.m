void sub_24DDB4D7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24DDB7220(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24DDB8884(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24DDB9338(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24DDB968C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
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

void sub_24DDB9CF8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_24DDBA09C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24DDBA4D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24DDBA824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_24DDBAE78(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_24DDBB21C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24DDBB900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_24DDBBED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24DDBC3C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24DDBC8B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_24DDBD1F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_7(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_12(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_13(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

void OUTLINED_FUNCTION_14(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_15(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_24DDBEC58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  objc_sync_exit(v17);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_24DDBEDE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24DDC0858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_24DDC326C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24DDC33B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

id fskit_std_log()
{
  if (fskit_std_log_once != -1) {
    dispatch_once(&fskit_std_log_once, &__block_literal_global_5);
  }
  v0 = (void *)fskit_std_log_logger;
  return v0;
}

uint64_t __fskit_std_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.FSKit", "default");
  uint64_t v1 = fskit_std_log_logger;
  fskit_std_log_logger = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t fs_errorForPOSIXError(int a1)
{
  return [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:a1 userInfo:0];
}

uint64_t fs_errorForCocoaError(int a1)
{
  return [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:a1 userInfo:0];
}

uint64_t fs_errorForMachError(int a1)
{
  return [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08350] code:a1 userInfo:0];
}

id FSKitLocalizedStringWithKeyAndVariant(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = v11;
  id v15 = v12;
  id v16 = v13;
  v17 = [0 stringByAppendingString:v14];
  if (!v17
    || ([v15 stringByAppendingString:@".f"],
        v18 = objc_claimAutoreleasedReturnValue(),
        _FSKitLocalizedStringNoFallbackWithKeyAndVariant(v17, v18, v16),
        v19 = objc_claimAutoreleasedReturnValue(),
        v18,
        !v19)
    && (_FSKitLocalizedStringNoFallbackWithKeyAndVariant(v17, v15, v16),
        (v19 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v20 = [v15 stringByAppendingString:@".f"];
    v19 = _FSKitLocalizedStringWithKeyAndVariant(v14, v20, v16);

    if (!v19)
    {
      v19 = _FSKitLocalizedStringWithKeyAndVariant(v14, v15, v16);
      if (!v19)
      {
        v19 = FSKitLocalizedErrorStringForKey(v14);
      }
    }
  }
  v21 = [NSString stringWithFormat:@"%@", v19, &a9];
  v22 = objc_msgSend(NSString, "stringWithFormat:", v21, &stru_26FFF08C0);

  return v22;
}

id _FSKitLocalizedStringNoFallbackWithKeyAndVariant(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (!v7
    || ([NSString stringWithFormat:@"%@%@(%@)", v5, v6, v7],
        v8 = objc_claimAutoreleasedReturnValue(),
        FSKitLocalizedErrorStringForKey(v8),
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    uint64_t v10 = [NSString stringWithFormat:@"%@%@(*)", v5, v6];
    uint64_t v9 = FSKitLocalizedErrorStringForKey(v10);
  }
  return v9;
}

id _FSKitLocalizedStringWithKeyAndVariant(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = _FSKitLocalizedStringNoFallbackWithKeyAndVariant(v5, v6, v7);
  uint64_t v9 = (void *)v8;
  if (v7 && !v8)
  {
    uint64_t v10 = [NSString stringWithFormat:@"%@(%@)", v6, v7];
    uint64_t v9 = FSKitLocalizedErrorStringForKey(v10);
  }
  if (v6 && !v9)
  {
    if ([v6 isEqualToString:&stru_26FFF08C0])
    {
      uint64_t v9 = 0;
    }
    else
    {
      id v11 = [NSString stringWithFormat:@"%@%@", v5, v6];
      uint64_t v9 = FSKitLocalizedErrorStringForKey(v11);
    }
  }

  return v9;
}

id fskitLocalizationBundle()
{
  if (fskitLocalizationBundle_onceToken != -1) {
    dispatch_once(&fskitLocalizationBundle_onceToken, &__block_literal_global_8);
  }
  os_log_t v0 = (void *)fskitLocalizationBundle_bundle;
  return v0;
}

uint64_t __fskitLocalizationBundle_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v1 = fskitLocalizationBundle_bundle;
  fskitLocalizationBundle_bundle = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id FSKitLoc(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = FSKitLocvImpl(a1, @"FSKit", 0, (uint64_t)&a9);
  return v9;
}

id FSKitLocv(void *a1, uint64_t a2)
{
  return FSKitLocvImpl(a1, @"FSKit", 0, a2);
}

id FSKitLocvImpl(void *a1, void *a2, int a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  uint64_t v9 = fskitLocalizationBundle();
  uint64_t v10 = [v9 localizedStringForKey:v7 value:@"X" table:v8];

  if ([v10 isEqualToString:@"X"])
  {
    if (a3 {
      && (([v7 hasSuffix:@"-C"] & 1) != 0
    }
       || ([v7 hasSuffix:@"-R"] & 1) != 0
       || ([v7 hasSuffix:@".f"] & 1) != 0
       || ([v7 hasSuffix:@"(*)"] & 1) != 0
       || ([v7 containsString:@"("] != 0))
    {
      id v11 = 0;
    }
    else
    {
      id v14 = fskit_std_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        FSKitLocvImpl_cold_1((uint64_t)v7, (uint64_t)v8, v14);
      }

      id v11 = [NSString stringWithFormat:@"KEY_MISSING(%@)", v7];
    }
  }
  else
  {
    id v12 = [NSString alloc];
    id v13 = [MEMORY[0x263EFF960] currentLocale];
    id v11 = (void *)[v12 initWithFormat:v10 locale:v13 arguments:a4];
  }
  return v11;
}

id FSKitLocalizedErrorStringForKeyLiteral(void *a1, uint64_t a2)
{
  return FSKitLocvImpl(a1, @"Errors", 1, a2);
}

id FSKitLocalizedErrorStringForKey(void *a1)
{
  id v1 = a1;
  v2 = fskitLocalizationBundle();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:@"X" table:@"Errors"];

  if ([v3 isEqualToString:@"X"])
  {
    if (([v1 hasSuffix:@"-C"] & 1) != 0 {
      || ([v1 hasSuffix:@"-R"] & 1) != 0
    }
      || ([v1 hasSuffix:@".f"] & 1) != 0
      || ([v1 hasSuffix:@"(*)"] & 1) != 0
      || ([v1 containsString:@"("] != 0)
    {
      uint64_t v4 = 0;
      goto LABEL_10;
    }
    id v7 = fskit_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      FSKitLocalizedErrorStringForKey_cold_1((uint64_t)v1, v7);
    }

    id v5 = [NSString stringWithFormat:@"KEY_MISSING(%@)", v1];
  }
  else
  {
    id v5 = v3;
  }
  uint64_t v4 = v5;
LABEL_10:

  return v4;
}

void sub_24DDC6494(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_24DDC8F94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_24DDC91F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  objc_sync_exit(v19);
  _Unwind_Resume(a1);
}

void sub_24DDC946C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_24DDC9680(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24DDC9818(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_24DDC9A2C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24DDCB288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void deviceNotificationCallback(void *a1, io_registry_entry_t a2, int a3)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  if (a1 && a3 == -536870896)
  {
    id v5 = fskit_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      deviceNotificationCallback_cold_6(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    id v13 = [a1 resource];
    id v14 = fskit_std_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      deviceNotificationCallback_cold_5(v13);
    }

    CFMutableDictionaryRef properties = 0;
    if (IORegistryEntryCreateCFProperties(a2, &properties, 0, 0))
    {
      id v15 = fskit_std_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        deviceNotificationCallback_cold_4(v15, v16, v17, v18, v19, v20, v21, v22);
      }
    }
    else
    {
      Value = CFDictionaryGetValue(properties, @"BSD Name");
      if (Value)
      {
        id v15 = [NSString stringWithString:Value];
        v32 = fskit_std_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          deviceNotificationCallback_cold_3();
        }

        v33 = [v13 BSDName];
        int v34 = [v15 isEqualToString:v33];

        if (v34)
        {
          uint64_t v35 = [v13 stopUsingResource:@"serviceTerminated"];
          if (!v35)
          {
            v36 = fskit_std_log();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              v37 = [v13 getResourceID];
              *(_DWORD *)buf = 136315394;
              v47 = "deviceNotificationCallback";
              __int16 v48 = 2112;
              v49 = v37;
              _os_log_impl(&dword_24DDB2000, v36, OS_LOG_TYPE_INFO, "%s: resource (%@) closed for kernel", buf, 0x16u);
            }
          }
          [v13 terminate];
        }
      }
      else
      {
        id v15 = fskit_std_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          deviceNotificationCallback_cold_2(v15, v38, v39, v40, v41, v42, v43, v44);
        }
      }
    }

    v23 = fskit_std_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      deviceNotificationCallback_cold_1(v23, v24, v25, v26, v27, v28, v29, v30);
    }
  }
}

void sub_24DDCC5BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_24DDCDB84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24DDCE614(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24DDCF0B0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_24DDCF2D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24DDCF5BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_24DDCF828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_24DDD1190(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24DDD1A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

void sub_24DDD400C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_24DDD4A80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_24DDD5B98(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24DDD5C44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_24DDD6B64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_24DDD7368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24DDDA09C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_24DDDA474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 184), 8);
  _Block_object_dispose((const void *)(v32 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_24DDDCB48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_24DDDCC80(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_24DDDCF70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_24DDDD070(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_24DDDD570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_10_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_12_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_13_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_15_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_24DDE2558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __60__stolenUSBLocalStorageClient_loadVolumes_ofType_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __60__stolenUSBLocalStorageClient_loadVolumes_ofType_withError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_24DDE2960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Block_object_dispose((const void *)(v33 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_24DDE2CC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

void sub_24DDE35C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose((const void *)(v49 - 192), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_4_1(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&location, 8) = a1;
}

uint64_t sub_24DDE45C4(uint64_t __src, uint64_t a2)
{
  if (__src)
  {
    if (a2)
    {
      if (a2 <= 14)
      {
        return sub_24DDE4764((unsigned char *)__src, (unsigned char *)(__src + a2));
      }
      else
      {
        sub_24DDED970();
        swift_allocObject();
        sub_24DDED960();
        if ((unint64_t)a2 >= 0x7FFFFFFF)
        {
          sub_24DDED980();
          __src = swift_allocObject();
          *(void *)(__src + 16) = 0;
          *(void *)(__src + 24) = a2;
        }
        else
        {
          return a2 << 32;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return __src;
}

uint64_t sub_24DDE4684(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

id _sSo10FSFileNameC5FSKitE7cStringABSRys4Int8VG_tcfC_0(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v5 = sub_24DDE45C4(a1, a2);
  unint64_t v7 = v6;
  uint64_t v8 = (void *)sub_24DDED990();
  sub_24DDE4684(v5, v7);
  id v9 = objc_msgSend(v4, sel_initWithData_, v8);

  return v9;
}

uint64_t sub_24DDE4764(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

FSKitUtils __swiftcall FSKitUtils.init()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (FSKitUtils)objc_msgSend(v0, sel_init);
}

id FSKitUtils.init()()
{
  v1.super_class = (Class)FSKitUtils;
  return objc_msgSendSuper2(&v1, sel_init);
}

void *sub_24DDE4A44(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269892900);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[5 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269892908);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t _sSo10FSKitUtilsC0A0E6string16withFormatString6locale9argumentsS2S_10Foundation6LocaleVSaySo8NSObjectCGtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698928F0);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!(a4 >> 62))
  {
    uint64_t v10 = *(void *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v10) {
      goto LABEL_3;
    }
LABEL_20:
    swift_bridgeObjectRelease();
LABEL_21:
    uint64_t v22 = sub_24DDED9E0();
    uint64_t v23 = *(void *)(v22 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v9, a3, v22);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v9, 0, 1, v22);
    uint64_t v24 = sub_24DDEDA10();
    swift_bridgeObjectRelease();
    sub_24DDE5020((uint64_t)v9);
    return v24;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_24DDEDA40();
  uint64_t v10 = result;
  if (!result) {
    goto LABEL_20;
  }
LABEL_3:
  if (v10 >= 1)
  {
    uint64_t v26 = a3;
    uint64_t v27 = v9;
    uint64_t v28 = a1;
    uint64_t v29 = a2;
    if ((a4 & 0xC000000000000001) != 0)
    {
      uint64_t v12 = 0;
      uint64_t v13 = (void *)MEMORY[0x263F8EE78];
      do
      {
        id v14 = (id)MEMORY[0x25332B450](v12, a4);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v13 = sub_24DDE4A44(0, v13[2] + 1, 1, v13);
        }
        unint64_t v16 = v13[2];
        unint64_t v15 = v13[3];
        if (v16 >= v15 >> 1) {
          uint64_t v13 = sub_24DDE4A44((void *)(v15 > 1), v16 + 1, 1, v13);
        }
        ++v12;
        uint64_t v31 = sub_24DDE4F20(0, &qword_2698928E8);
        unint64_t v32 = sub_24DDE4FA0();
        *(void *)&long long v30 = v14;
        v13[2] = v16 + 1;
        sub_24DDE5008(&v30, (uint64_t)&v13[5 * v16 + 4]);
        swift_unknownObjectRelease();
      }
      while (v10 != v12);
    }
    else
    {
      uint64_t v17 = 0;
      uint64_t v18 = (void *)MEMORY[0x263F8EE78];
      do
      {
        id v19 = *(id *)(a4 + 8 * v17 + 32);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v18 = sub_24DDE4A44(0, v18[2] + 1, 1, v18);
        }
        unint64_t v21 = v18[2];
        unint64_t v20 = v18[3];
        if (v21 >= v20 >> 1) {
          uint64_t v18 = sub_24DDE4A44((void *)(v20 > 1), v21 + 1, 1, v18);
        }
        ++v17;
        uint64_t v31 = sub_24DDE4F20(0, &qword_2698928E8);
        unint64_t v32 = sub_24DDE4FA0();
        *(void *)&long long v30 = v19;
        v18[2] = v21 + 1;
        sub_24DDE5008(&v30, (uint64_t)&v18[5 * v21 + 4]);
      }
      while (v10 != v17);
    }
    swift_bridgeObjectRelease();
    a3 = v26;
    uint64_t v9 = v27;
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for FSKitUtils(uint64_t a1)
{
  return sub_24DDE4F20(a1, qword_269892A80);
}

uint64_t sub_24DDE4F20(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_24DDE4FA0()
{
  unint64_t result = qword_2698928F8;
  if (!qword_2698928F8)
  {
    sub_24DDE4F20(255, &qword_2698928E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698928F8);
  }
  return result;
}

uint64_t sub_24DDE5008(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_24DDE5020(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698928F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t FSModuleIdentity.id.getter()
{
  id v1 = objc_msgSend(v0, sel_bundleIdentifier);
  uint64_t v2 = sub_24DDEDA00();

  return v2;
}

uint64_t sub_24DDE50DC()
{
  return MEMORY[0x263F8D320];
}

void sub_24DDE50E8(uint64_t *a1@<X8>)
{
  id v3 = objc_msgSend(*v1, sel_bundleIdentifier);
  uint64_t v4 = sub_24DDEDA00();
  uint64_t v6 = v5;

  *a1 = v4;
  a1[1] = v6;
}

void FileSystemExtension.configuration.getter(uint64_t a1@<X1>, void *a2@<X8>)
{
  id v3 = (void *)(*(uint64_t (**)(void))(a1 + 24))();
  uint64_t v4 = (objc_class *)type metadata accessor for _FSKitFileSystemExtensionConfiguration();
  id v5 = objc_allocWithZone(v4);
  uint64_t v6 = self;
  int64_t v7 = (char *)v5;
  id v8 = objc_msgSend(v6, sel_moduleExtensionForAppex_, v3);
  *(void *)&v7[OBJC_IVAR____TtC5FSKit38_FSKitFileSystemExtensionConfiguration_ourExtension] = v8;
  id v9 = v8;
  objc_msgSend(v9, sel_didFinishLaunching);

  v11.receiver = v7;
  v11.super_class = v4;
  id v10 = objc_msgSendSuper2(&v11, sel_init);

  *a2 = v10;
}

id sub_24DDE521C(void *a1)
{
  return sub_24DDE5334(a1, &OBJC_IVAR____TtC5FSKit38_FSKitFileSystemExtensionConfiguration_ourExtension);
}

uint64_t type metadata accessor for _FSKitFileSystemExtensionConfiguration()
{
  return self;
}

void UnaryFileSystemExtension.configuration.getter(uint64_t a1@<X1>, void *a2@<X8>)
{
  id v3 = (void *)(*(uint64_t (**)(void))(a1 + 24))();
  uint64_t v4 = (objc_class *)type metadata accessor for _FSKitUnaryFileSystemExtensionConfiguration();
  id v5 = objc_allocWithZone(v4);
  uint64_t v6 = self;
  int64_t v7 = (char *)v5;
  id v8 = objc_msgSend(v6, sel_moduleExtensionForAppex_, v3);
  *(void *)&v7[OBJC_IVAR____TtC5FSKit43_FSKitUnaryFileSystemExtensionConfiguration_ourExtension] = v8;
  id v9 = v8;
  objc_msgSend(v9, sel_didFinishLaunching);

  v11.receiver = v7;
  v11.super_class = v4;
  id v10 = objc_msgSendSuper2(&v11, sel_init);

  *a2 = v10;
}

id sub_24DDE5328(void *a1)
{
  return sub_24DDE5334(a1, &OBJC_IVAR____TtC5FSKit43_FSKitUnaryFileSystemExtensionConfiguration_ourExtension);
}

id sub_24DDE5334(void *a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  uint64_t v6 = self;
  int64_t v7 = (char *)v5;
  id v8 = objc_msgSend(v6, sel_moduleExtensionForAppex_, a1);
  *(void *)&v7[*a2] = v8;
  id v9 = v8;
  objc_msgSend(v9, sel_didFinishLaunching);

  v12.receiver = v7;
  v12.super_class = v2;
  id v10 = objc_msgSendSuper2(&v12, sel_init);

  return v10;
}

uint64_t type metadata accessor for _FSKitUnaryFileSystemExtensionConfiguration()
{
  return self;
}

id sub_24DDE5418(uint64_t a1)
{
  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC5FSKit38_FSKitFileSystemExtensionConfiguration_ourExtension), sel_shouldAcceptConnection_, a1);
}

id sub_24DDE5478()
{
  return sub_24DDE5570(type metadata accessor for _FSKitFileSystemExtensionConfiguration);
}

uint64_t sub_24DDE54A0()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x78))() & 1;
}

id sub_24DDE54F8(uint64_t a1)
{
  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC5FSKit43_FSKitUnaryFileSystemExtensionConfiguration_ourExtension), sel_shouldAcceptConnection_, a1);
}

id sub_24DDE5558()
{
  return sub_24DDE5570(type metadata accessor for _FSKitUnaryFileSystemExtensionConfiguration);
}

id sub_24DDE5570(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_24DDE55B8()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x78))() & 1;
}

uint64_t dispatch thunk of FileSystemExtension.fileSystem.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of UnaryFileSystemExtension.fileSystem.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_24DDE5638()
{
  return sub_24DDE56C8(&qword_269892980, (void (*)(void))type metadata accessor for _FSKitFileSystemExtensionConfiguration);
}

uint64_t sub_24DDE5680()
{
  return sub_24DDE56C8(&qword_269892988, (void (*)(void))type metadata accessor for _FSKitUnaryFileSystemExtensionConfiguration);
}

uint64_t sub_24DDE56C8(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t FSVolume.id.getter()
{
  id v1 = objc_msgSend(v0, sel_volumeID);
  uint64_t v2 = FSEntityIdentifier.id.getter();

  return v2;
}

void sub_24DDE5764(uint64_t *a1@<X8>)
{
  id v3 = objc_msgSend(*v1, sel_volumeID);
  uint64_t v4 = FSEntityIdentifier.id.getter();
  uint64_t v6 = v5;

  *a1 = v4;
  a1[1] = v6;
}

uint64_t FSEntityIdentifier.id.getter()
{
  uint64_t v1 = sub_24DDED9C0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = objc_msgSend(v0, sel_uuid);
  sub_24DDED9B0();

  uint64_t v6 = sub_24DDED9A0();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v6;
}

uint64_t sub_24DDE58BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = sub_24DDED9C0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(*v1, sel_uuid);
  sub_24DDED9B0();

  uint64_t v8 = sub_24DDED9A0();
  uint64_t v10 = v9;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  *a1 = v8;
  a1[1] = v10;
  return result;
}

void FSBlockDeviceResource.read(into:startingAt:length:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void, id), uint64_t a6)
{
}

void sub_24DDE59D0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

id FSBlockDeviceResource.read(into:startingAt:length:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24DDE5C50(a1, a2, a3, a4, (SEL *)&selRef_readInto_startingAt_length_error_);
}

void FSBlockDeviceResource.write(from:startingAt:length:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void, id), uint64_t a6)
{
}

void sub_24DDE5AC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void, id), uint64_t a6, uint64_t a7, SEL *a8)
{
  if (a1)
  {
    aBlock[4] = a5;
    aBlock[5] = a6;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24DDE59D0;
    aBlock[3] = a7;
    id v14 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v8, *a8, a1, a3, a4, v14);
    _Block_release(v14);
  }
  else
  {
    id v15 = (id)fs_errorForPOSIXError(22);
    a5(0, v15);
  }
}

id FSBlockDeviceResource.write(from:startingAt:length:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24DDE5C50(a1, a2, a3, a4, (SEL *)&selRef_writeFrom_startingAt_length_error_);
}

id sub_24DDE5C50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  v7[1] = *(id *)MEMORY[0x263EF8340];
  if (a1)
  {
    v7[0] = 0;
    id result = objc_msgSend(v5, *a5, a1, a3, a4, v7);
    if (!v7[0]) {
      return result;
    }
    v7[0];
  }
  else
  {
    (id)fs_errorForPOSIXError(22);
  }
  return (id)swift_willThrow();
}

id FSBlockDeviceResource.metadataRead(into:startingAt:length:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24DDE5D84(a1, a2, a3, a4, (SEL *)&selRef_metadataReadInto_startingAt_length_);
}

id FSBlockDeviceResource.metadataRead(into:startingAt:length:readAheadExtents:readAheadCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1 && a5) {
    id v6 = objc_msgSend(v5, sel_metadataReadInto_startingAt_length_readAheadExtents_readAheadCount_, a1, a3, a4, a5);
  }
  else {
    id v6 = (id)fs_errorForPOSIXError(22);
  }
  return v6;
}

id FSBlockDeviceResource.metadataWrite(from:startingAt:length:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24DDE5D84(a1, a2, a3, a4, (SEL *)&selRef_metadataWriteFrom_startingAt_length_);
}

id FSBlockDeviceResource.delayedMetadataWrite(from:startingAt:length:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24DDE5D84(a1, a2, a3, a4, (SEL *)&selRef_delayedMetadataWriteFrom_startingAt_length_);
}

id sub_24DDE5D84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  if (a1) {
    id v6 = objc_msgSend(v5, *a5, a1, a3, a4);
  }
  else {
    id v6 = (id)fs_errorForPOSIXError(22);
  }
  return v6;
}

void FSKitLocvImpl_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = fskitLocalizationBundle();
  id v7 = [v6 bundlePath];
  int v8 = 138412802;
  uint64_t v9 = a1;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  __int16 v12 = 2112;
  uint64_t v13 = v7;
  _os_log_error_impl(&dword_24DDB2000, a3, OS_LOG_TYPE_ERROR, "Localized key '%@' missing from table '%@' (bundlePath:%@)", (uint8_t *)&v8, 0x20u);
}

void FSKitLocalizedErrorStringForKey_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = fskitLocalizationBundle();
  uint64_t v5 = [v4 bundlePath];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_24DDB2000, a2, OS_LOG_TYPE_ERROR, "Localized key '%@' missing from table 'Errors' (bundlePath:%@)", (uint8_t *)&v6, 0x16u);
}

void deviceNotificationCallback_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void deviceNotificationCallback_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void deviceNotificationCallback_cold_3()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_24DDB2000, v0, v1, "%s:service:bsdName:%@", (uint8_t *)v2);
}

void deviceNotificationCallback_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void deviceNotificationCallback_cold_5(void *a1)
{
  uint64_t v1 = [a1 BSDName];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_24DDB2000, v2, v3, "%s:kIOMessageServiceIsTerminated:%@", v4, v5, v6, v7, 2u);
}

void deviceNotificationCallback_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t sub_24DDED960()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_24DDED970()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_24DDED980()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_24DDED990()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_24DDED9A0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_24DDED9B0()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_24DDED9C0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24DDED9D0()
{
  return MEMORY[0x270EF0F40]();
}

uint64_t sub_24DDED9E0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_24DDED9F0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24DDEDA00()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24DDEDA10()
{
  return MEMORY[0x270EF1A28]();
}

uint64_t sub_24DDEDA20()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24DDEDA30()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24DDEDA40()
{
  return MEMORY[0x270F9F080]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF3EE8](*(void *)&mainPort, *(void *)&options, bsdName);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x270EF49D0](*(void *)&entry, properties, allocator, *(void *)&options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x270EF4A80](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x270EFDCE0](allocator, token);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFURLCopySecurityScopeFromFileURL()
{
  return MEMORY[0x270EE5750]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

gid_t audit_token_to_egid(audit_token_t *atoken)
{
  return MEMORY[0x270F98168](atoken);
}

uid_t audit_token_to_euid(audit_token_t *atoken)
{
  return MEMORY[0x270F98170](atoken);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x270F98178](atoken);
}

int audit_token_to_pidversion(audit_token_t *atoken)
{
  return MEMORY[0x270F98180](atoken);
}

gid_t audit_token_to_rgid(audit_token_t *atoken)
{
  return MEMORY[0x270F98188](atoken);
}

uid_t audit_token_to_ruid(audit_token_t *atoken)
{
  return MEMORY[0x270F98190](atoken);
}

void clearerr(FILE *a1)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int feof(FILE *a1)
{
  return MEMORY[0x270ED9910](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x270ED9968](a1, *(void *)&a2, a3);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return MEMORY[0x270ED9CB8](*(void *)&a1, a2, a3);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x270ED9ED8](*(void *)&a1, a2);
}

long double log2(long double __x)
{
  MEMORY[0x270EDA0D8](__x);
  return result;
}

kern_return_t mach_make_memory_entry_64(vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  return MEMORY[0x270EDA180](*(void *)&target_task, size, offset, *(void *)&permission, object_handle, *(void *)&parent_entry);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_vm_map(vm_map_t target_task, mach_vm_address_t *address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, mem_entry_name_port_t object, memory_object_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x270EDA2A8](*(void *)&target_task, address, size, mask, *(void *)&flags, *(void *)&object, offset, *(void *)&copy);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
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

void objc_exception_throw(id exception)
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDAD10](*(void *)&__fd, __buf, __nbyte, a4);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDB0A0](*(void *)&__fd, __buf, __nbyte, a4);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDB658](__s1, __n);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x270EDB868](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x270EDBA80](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x270EDBA90](*(void *)&target_task, address, size);
}

xpc_object_t xpc_fd_create(int fd)
{
  return (xpc_object_t)MEMORY[0x270EDC1C8](*(void *)&fd);
}

int xpc_fd_dup(xpc_object_t xfd)
{
  return MEMORY[0x270EDC1D0](xfd);
}

uint64_t xpc_mach_send_copy_right()
{
  return MEMORY[0x270EDC260]();
}

uint64_t xpc_mach_send_create()
{
  return MEMORY[0x270EDC268]();
}