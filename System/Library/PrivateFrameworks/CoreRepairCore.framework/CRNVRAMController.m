@interface CRNVRAMController
+ (BOOL)deleteNVRAMValueForKey:(id)a3 error:(id *)a4;
+ (BOOL)setNVRAMValueForKey:(id)a3 value:(id)a4 error:(id *)a5;
+ (id)readNVRAMValueForKey:(id)a3 error:(id *)a4;
@end

@implementation CRNVRAMController

+ (id)readNVRAMValueForKey:(id)a3 error:(id *)a4
{
  v31[1] = *MEMORY[0x263EF8340];
  v5 = (__CFString *)a3;
  mach_port_t mainPort = 0;
  if (MEMORY[0x223C5BAF0](*MEMORY[0x263EF87F0], &mainPort))
  {
    v6 = handleForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_21FC681D0();
    }

    if (!a4) {
      goto LABEL_7;
    }
    v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F08320];
    v31[0] = @"Could not get main port";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v7, (uint64_t)v31, (uint64_t)&v30, 1);
    v9 = LABEL_6:;
    objc_msgSend_errorWithDomain_code_userInfo_(v8, v10, @"com.apple.corerepair", -74, v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
    CFProperty = 0;
    goto LABEL_15;
  }
  io_registry_entry_t v12 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
  if (!v12)
  {
    v23 = handleForCategory(0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_21FC68168();
    }

    if (!a4) {
      goto LABEL_7;
    }
    v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = *MEMORY[0x263F08320];
    v29 = @"Could not get options entry from the device tree";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v24, (uint64_t)&v29, (uint64_t)&v28, 1);
    goto LABEL_6;
  }
  io_object_t v13 = v12;
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v12, v5, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (!CFProperty)
  {
    v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC6819C();
    }

    if (a4)
    {
      v17 = (void *)MEMORY[0x263F087E8];
      uint64_t v26 = *MEMORY[0x263F08320];
      v18 = objc_msgSend_stringWithFormat_(NSString, v15, @"Could not read value", v16);
      v27 = v18;
      v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v19, (uint64_t)&v27, (uint64_t)&v26, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v17, v21, @"com.apple.corerepair", -74, v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  IOObjectRelease(v13);
LABEL_15:

  return CFProperty;
}

+ (BOOL)setNVRAMValueForKey:(id)a3 value:(id)a4 error:(id *)a5
{
  v36[1] = *MEMORY[0x263EF8340];
  v7 = (__CFString *)a3;
  id v8 = a4;
  mach_port_t mainPort = 0;
  if (MEMORY[0x223C5BAF0](*MEMORY[0x263EF87F0], &mainPort))
  {
    v9 = handleForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_21FC681D0();
    }

    if (!a5) {
      goto LABEL_7;
    }
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v35 = *MEMORY[0x263F08320];
    v36[0] = @"Could not get main port";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v10, (uint64_t)v36, (uint64_t)&v35, 1);
    io_registry_entry_t v12 = LABEL_6:;
    objc_msgSend_errorWithDomain_code_userInfo_(v11, v13, @"com.apple.corerepair", -47, v12);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
    BOOL v14 = 0;
    goto LABEL_15;
  }
  io_registry_entry_t v15 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
  if (!v15)
  {
    uint64_t v28 = handleForCategory(0);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_21FC68168();
    }

    if (!a5) {
      goto LABEL_7;
    }
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v33 = *MEMORY[0x263F08320];
    v34 = @"Could not get options entry from the device tree";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v29, (uint64_t)&v34, (uint64_t)&v33, 1);
    goto LABEL_6;
  }
  io_object_t v16 = v15;
  uint64_t v17 = IORegistryEntrySetCFProperty(v15, v7, v8);
  BOOL v14 = v17 == 0;
  if (v17)
  {
    uint64_t v18 = v17;
    v19 = handleForCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_21FC68204(v18, v19);
    }

    if (a5)
    {
      v22 = (void *)MEMORY[0x263F087E8];
      uint64_t v31 = *MEMORY[0x263F08320];
      v23 = objc_msgSend_stringWithFormat_(NSString, v20, @"Could not set value. Error: 0x%08x", v21, v18);
      v32 = v23;
      v25 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v24, (uint64_t)&v32, (uint64_t)&v31, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v22, v26, @"com.apple.corerepair", -47, v25);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  IOObjectRelease(v16);
LABEL_15:

  return v14;
}

+ (BOOL)deleteNVRAMValueForKey:(id)a3 error:(id *)a4
{
  v33[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  mach_port_t mainPort = 0;
  if (MEMORY[0x223C5BAF0](*MEMORY[0x263EF87F0], &mainPort))
  {
    v6 = handleForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_21FC681D0();
    }

    if (!a4) {
      goto LABEL_7;
    }
    id v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v32 = *MEMORY[0x263F08320];
    v33[0] = @"Could not get main port";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v7, (uint64_t)v33, (uint64_t)&v32, 1);
    v9 = LABEL_6:;
    objc_msgSend_errorWithDomain_code_userInfo_(v8, v10, @"com.apple.corerepair", -48, v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
    BOOL v11 = 0;
    goto LABEL_15;
  }
  io_registry_entry_t v12 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
  if (!v12)
  {
    v25 = handleForCategory(0);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_21FC68168();
    }

    if (!a4) {
      goto LABEL_7;
    }
    id v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F08320];
    uint64_t v31 = @"Could not get options entry from the device tree";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v26, (uint64_t)&v31, (uint64_t)&v30, 1);
    goto LABEL_6;
  }
  io_object_t v13 = v12;
  uint64_t v14 = IORegistryEntrySetCFProperty(v12, @"IONVRAM-DELETE-PROPERTY", v5);
  BOOL v11 = v14 == 0;
  if (v14)
  {
    uint64_t v15 = v14;
    io_object_t v16 = handleForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_21FC6827C(v15, v16);
    }

    if (a4)
    {
      v19 = (void *)MEMORY[0x263F087E8];
      uint64_t v28 = *MEMORY[0x263F08320];
      v20 = objc_msgSend_stringWithFormat_(NSString, v17, @"Could not delete value. Error: 0x%08x", v18, v15);
      v29 = v20;
      v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v21, (uint64_t)&v29, (uint64_t)&v28, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v19, v23, @"com.apple.corerepair", -48, v22);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  IOObjectRelease(v13);
LABEL_15:

  return v11;
}

@end