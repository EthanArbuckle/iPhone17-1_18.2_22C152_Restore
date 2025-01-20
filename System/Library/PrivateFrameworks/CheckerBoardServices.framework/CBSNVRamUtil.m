@interface CBSNVRamUtil
+ (BOOL)readNVRamVariable:(id)a3 value:(id *)a4;
+ (void)clearNVRamVariable:(id)a3;
+ (void)writeNVRamVariable:(id)a3 value:(id)a4;
@end

@implementation CBSNVRamUtil

+ (BOOL)readNVRamVariable:(id)a3 value:(id *)a4
{
  kern_return_t v8;
  NSObject *v9;
  BOOL v10;
  kern_return_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  id v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  CFMutableDictionaryRef properties;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  io_registry_entry_t v6 = IORegistryEntryFromPath(*MEMORY[0x263F0EC88], "IODeviceTree:/options");
  if (v6)
  {
    io_object_t v7 = v6;
    properties = 0;
    v8 = IORegistryEntryCreateCFProperties(v6, &properties, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    v9 = properties;
    if (v8) {
      v10 = 1;
    }
    else {
      v10 = properties == 0;
    }
    if (v10)
    {
      v11 = v8;
      v9 = CheckerBoardLogHandleForCategory(4);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v24) = v11;
        _os_log_impl(&dword_23EA9B000, v9, OS_LOG_TYPE_DEFAULT, "Unable to create dictionary from NVRAM. IOReg result: %d", buf, 8u);
      }
      v15 = 0;
      goto LABEL_20;
    }
    v13 = [(__CFDictionary *)properties objectForKeyedSubscript:v5];
    v14 = v13;
    v15 = v13 != 0;
    if (v13)
    {
      *a4 = v13;
      v16 = CheckerBoardLogHandleForCategory(4);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = *a4;
        *(_DWORD *)buf = 138412546;
        v24 = v17;
        v25 = 2112;
        v26 = v5;
        v18 = "Found value %@ for NVRAM key %@";
        v19 = v16;
        v20 = 22;
LABEL_18:
        _os_log_impl(&dword_23EA9B000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
      }
    }
    else
    {
      v16 = CheckerBoardLogHandleForCategory(4);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v5;
        v18 = "No NVRAM value found for key %@";
        v19 = v16;
        v20 = 12;
        goto LABEL_18;
      }
    }

LABEL_20:
    IOObjectRelease(v7);
    goto LABEL_21;
  }
  v12 = CheckerBoardLogHandleForCategory(4);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23EA9B000, v12, OS_LOG_TYPE_DEFAULT, "Unable to open IORegistry entry for NVRAM", buf, 2u);
  }

  v15 = 0;
LABEL_21:

  return v15;
}

+ (void)writeNVRamVariable:(id)a3 value:(id)a4
{
  kern_return_t v9;
  NSObject *v10;
  const char *v11;
  int v12;
  __CFString *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  kern_return_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x263EF8340];
  id v5 = (__CFString *)a3;
  id v6 = a4;
  io_registry_entry_t v7 = IORegistryEntryFromPath(*MEMORY[0x263F0EC88], "IODeviceTree:/options");
  if (v7)
  {
    io_object_t v8 = v7;
    v9 = IORegistryEntrySetCFProperty(v7, v5, v6);
    v10 = CheckerBoardLogHandleForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = "failed";
      v12 = 138412802;
      v13 = v5;
      if (!v9) {
        v11 = "succeeded.";
      }
      v14 = 2080;
      v15 = v11;
      v16 = 1024;
      v17 = v9;
      _os_log_impl(&dword_23EA9B000, v10, OS_LOG_TYPE_DEFAULT, "CBSNVRamUtil: Writing %@ to nvram %s with result %x", (uint8_t *)&v12, 0x1Cu);
    }

    IOObjectRelease(v8);
  }
}

+ (void)clearNVRamVariable:(id)a3
{
  kern_return_t v6;
  NSObject *v7;
  const char *v8;
  int v9;
  id v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  kern_return_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  io_registry_entry_t v4 = IORegistryEntryFromPath(*MEMORY[0x263F0EC88], "IODeviceTree:/options");
  if (v4)
  {
    io_object_t v5 = v4;
    id v6 = IORegistryEntrySetCFProperty(v4, @"IONVRAM-DELETE-PROPERTY", v3);
    io_registry_entry_t v7 = CheckerBoardLogHandleForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      io_object_t v8 = "failed";
      v9 = 138412802;
      v10 = v3;
      if (!v6) {
        io_object_t v8 = "succeeded.";
      }
      v11 = 2080;
      v12 = v8;
      v13 = 1024;
      v14 = v6;
      _os_log_impl(&dword_23EA9B000, v7, OS_LOG_TYPE_DEFAULT, "CBSNVRamUtil: Deleting %@ from nvram %s with result %x", (uint8_t *)&v9, 0x1Cu);
    }

    IOObjectRelease(v5);
  }
}

@end