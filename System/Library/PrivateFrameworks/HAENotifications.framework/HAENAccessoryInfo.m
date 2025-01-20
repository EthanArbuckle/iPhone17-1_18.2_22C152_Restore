@interface HAENAccessoryInfo
+ (id)getAccessoryInfo:(id *)a3;
+ (id)getAccessoryInfoFromIOAccesoryManager:(id *)a3;
+ (id)getAccessoryInfoFromIOKitDirectly:(id *)a3;
- (NSNumber)interfaceDeviceSerialNumber;
- (NSString)interfaceModuleSerialNumber;
- (NSString)manufacturer;
- (NSString)modelNumber;
- (NSString)name;
- (NSString)serialNumber;
- (id)description;
@end

@implementation HAENAccessoryInfo

+ (id)getAccessoryInfoFromIOAccesoryManager:(id *)a3
{
  kern_return_t v10;
  NSObject *v11;
  id v12;
  HAENAccessoryInfo *v13;
  unsigned int v15;
  char *v16;
  NSObject *v17;
  unsigned int v18;
  uint64_t v19;
  NSObject *v20;
  unsigned int v21;
  uint64_t v22;
  NSObject *v23;
  unsigned int v24;
  uint64_t v25;
  NSObject *v26;
  unsigned int v27;
  char *v28;
  NSObject *v29;
  unsigned int v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  NSString *serialNumber;
  void *v35;
  void *v36;
  NSObject *v37;
  __CFString *v38;
  uint64_t v39;
  io_connect_t connect;
  uint64_t v41;
  void *v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  HAENAccessoryInfo *v46;
  uint64_t v47;
  uint64_t vars8;

  v47 = *MEMORY[0x263EF8340];
  if (!+[HAENDefaults isRunningCITests])
  {
    connect = 0;
    io_service_t ServiceWithPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort();
    if (ServiceWithPrimaryPort)
    {
      v10 = IOServiceOpen(ServiceWithPrimaryPort, *MEMORY[0x263EF8960], 0, &connect);
      if (!v10)
      {
        v13 = objc_alloc_init(HAENAccessoryInfo);
        v15 = IOAccessoryManagerCopyDeviceInfo();
        if (v15)
        {
          errorForIOKitFailure(v15);
          v16 = (char *)objc_claimAutoreleasedReturnValue();
          v17 = HAENotificationsLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v44 = v16;
            _os_log_impl(&dword_21FABA000, v17, OS_LOG_TYPE_DEFAULT, "failed to get serial number %@", buf, 0xCu);
          }

          v18 = IOAccessoryManagerCopyDeviceInfo();
          if (v18)
          {
            v19 = errorForIOKitFailure(v18);

            v20 = HAENotificationsLog();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v44 = (const char *)v19;
              _os_log_impl(&dword_21FABA000, v20, OS_LOG_TYPE_DEFAULT, "failed to get manufacturer %@", buf, 0xCu);
            }
            v16 = (char *)v19;

            v21 = IOAccessoryManagerCopyDeviceInfo();
            if (v21)
            {
              v22 = errorForIOKitFailure(v21);

              v23 = HAENotificationsLog();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v44 = (const char *)v22;
                _os_log_impl(&dword_21FABA000, v23, OS_LOG_TYPE_DEFAULT, "failed to get model number %@", buf, 0xCu);
              }
              v16 = (char *)v22;

              v24 = IOAccessoryManagerCopyDeviceInfo();
              if (v24)
              {
                v25 = errorForIOKitFailure(v24);

                v26 = HAENotificationsLog();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v44 = (const char *)v25;
                  _os_log_impl(&dword_21FABA000, v26, OS_LOG_TYPE_DEFAULT, "failed to get name %@", buf, 0xCu);
                }
                v16 = (char *)v25;

                v27 = IOAccessoryManagerCopyDeviceInfo();
                if (v27)
                {
                  errorForIOKitFailure(v27);
                  v28 = (char *)objc_claimAutoreleasedReturnValue();

                  v29 = HAENotificationsLog();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v44 = v28;
                    _os_log_impl(&dword_21FABA000, v29, OS_LOG_TYPE_DEFAULT, "failed to get interface serial number %@", buf, 0xCu);
                  }
                  v16 = v28;

                  v30 = IOAccessoryManagerCopyDeviceInfo();
                  if (v30)
                  {
                    v31 = errorForIOKitFailure(v30);

                    v32 = HAENotificationsLog();
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
                      +[HAENAccessoryInfo getAccessoryInfoFromIOAccesoryManager:]();
                    }
                    id name = (id)v31;

                    v33 = HAENotificationsLog();
                    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315394;
                      v44 = "+[HAENAccessoryInfo getAccessoryInfoFromIOAccesoryManager:]";
                      v45 = 2112;
                      v46 = v13;
                      _os_log_impl(&dword_21FABA000, v33, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
                    }

                    IOServiceClose(connect);
                    serialNumber = v13->_serialNumber;
                    if (!v13->_manufacturer || !serialNumber)
                    {
                      v35 = [NSString stringWithFormat:@"IOAccessoryManager: required fields are missing, manufacturer %@, serialNumber %@", v13->_manufacturer, serialNumber, 0];
                      v41 = *MEMORY[0x263F08320];
                      v42 = v35;
                      v36 = [NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
                      makeError(v36, 4u);
                      *a3 = (id)objc_claimAutoreleasedReturnValue();

                      v37 = HAENotificationsLog();
                      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
                        +[HAENAccessoryInfo getAccessoryInfoFromIOAccesoryManager:]();
                      }

                      v13 = 0;
                    }
                    v13 = v13;
                    v5 = v13;
                    goto LABEL_17;
                  }
                  v38 = @"kIOAccDigitalIDDeviceInfoTypeInterfaceModuleSerialNumber";
                }
                else
                {
                  v38 = @"kIOAccDigitalIDDeviceInfoTypeInterfaceDeviceSerialNumber";
                }
              }
              else
              {
                v38 = @"kIOAccDigitalIDDeviceInfoTypeAccessoryName";
              }
            }
            else
            {
              v38 = @"kIOAccDigitalIDDeviceInfoTypeAccessoryModelNumber";
            }
          }
          else
          {
            v38 = @"kIOAccDigitalIDDeviceInfoTypeAccessoryManufacturer";
          }
          v39 = errorForBadDeviceInfo((uint64_t)v38);

          id name = (id)v39;
        }
        else
        {
          errorForBadDeviceInfo(@"kIOAccDigitalIDDeviceInfoTypeAccessorySerialNumber");
          id name = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_12:
        if (connect) {
          IOServiceClose(connect);
        }
        v5 = 0;
        if (a3 && name)
        {
          id name = name;
          v5 = 0;
          *a3 = name;
        }
LABEL_17:

        goto LABEL_18;
      }
      errorForIOKitFailure(v10);
      id name = (id)objc_claimAutoreleasedReturnValue();
      v11 = HAENotificationsLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[HAENAccessoryInfo getAccessoryInfoFromIOAccesoryManager:].cold.4();
      }
    }
    else
    {
      v12 = objc_alloc(MEMORY[0x263F087E8]);
      id name = (id)[v12 initWithDomain:HAENAccessoryInfoErrorDomain code:2 userInfo:MEMORY[0x263EFFA78]];
      v11 = HAENotificationsLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[HAENAccessoryInfo getAccessoryInfoFromIOAccesoryManager:]();
      }
    }

    v13 = 0;
    goto LABEL_12;
  }
  v4 = HAENotificationsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FABA000, v4, OS_LOG_TYPE_DEFAULT, "running citest mode with fake accessory info", buf, 2u);
  }

  v5 = objc_alloc_init(HAENAccessoryInfo);
  manufacturer = v5->_manufacturer;
  v5->_manufacturer = (NSString *)@"CITEST.INC";

  v7 = v5->_serialNumber;
  v5->_serialNumber = (NSString *)@"0123456789";

  id name = v5->_name;
  v5->_id name = (NSString *)@"FAKE";
LABEL_18:

  return v5;
}

+ (id)getAccessoryInfoFromIOKitDirectly:(id *)a3
{
  kern_return_t v11;
  CFMutableDictionaryRef v12;
  NSObject *v13;
  NSObject *v14;
  NSString *serialNumber;
  BOOL v16;
  void *v17;
  void *v18;
  NSObject *v19;
  HAENAccessoryInfo *v20;
  CFMutableDictionaryRef properties;
  io_iterator_t existing;
  uint64_t v24;
  void *v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  CFMutableDictionaryRef v29;
  uint64_t v30;

  v30 = *MEMORY[0x263EF8340];
  v4 = objc_alloc_init(HAENAccessoryInfo);
  CFDictionaryRef v5 = IOServiceMatching("IOMikeyBusDevice");
  if (!v5
    || ((existing = 0, !IOServiceGetMatchingServices(*MEMORY[0x263F0EC90], v5, &existing))
      ? (BOOL v6 = existing == 0)
      : (BOOL v6 = 1),
        v6))
  {
    v7 = 0;
    v8 = 0;
  }
  else
  {
    io_object_t v9 = IOIteratorNext(existing);
    if (v9)
    {
      io_registry_entry_t v10 = v9;
      v8 = 0;
      v7 = 0;
      while (1)
      {
        if (v8 && v7) {
          goto LABEL_28;
        }
        properties = 0;
        v11 = IORegistryEntryCreateCFProperties(v10, &properties, 0, 0);
        v12 = properties;
        if (!v11)
        {
          if (properties) {
            break;
          }
        }
LABEL_21:
        if (v12) {
          CFRelease(v12);
        }
        IOObjectRelease(v10);
        io_registry_entry_t v10 = IOIteratorNext(existing);
        if (!v10) {
          goto LABEL_28;
        }
      }
      v13 = HAENotificationsLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v27 = "+[HAENAccessoryInfo getAccessoryInfoFromIOKitDirectly:]";
        v28 = 2112;
        v29 = properties;
        _os_log_impl(&dword_21FABA000, v13, OS_LOG_TYPE_DEFAULT, "%s IOMikeyBusDevice properties: %@\n", buf, 0x16u);
      }

      if (v8)
      {
        if (v7)
        {
LABEL_18:
          v14 = HAENotificationsLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v27 = v8;
            v28 = 2112;
            v29 = v7;
            _os_log_impl(&dword_21FABA000, v14, OS_LOG_TYPE_DEFAULT, "IOMikeyBus sn: %@ mft: %@", buf, 0x16u);
          }

          v12 = properties;
          goto LABEL_21;
        }
      }
      else
      {
        v8 = [(__CFDictionary *)properties objectForKey:@"SerialNumber"];
        if (v7) {
          goto LABEL_18;
        }
      }
      v7 = [(__CFDictionary *)properties objectForKey:@"VendorName"];
      goto LABEL_18;
    }
    v7 = 0;
    v8 = 0;
LABEL_28:
    IOObjectRelease(existing);
  }
  objc_storeStrong((id *)&v4->_manufacturer, v7);
  objc_storeStrong((id *)&v4->_serialNumber, v8);
  serialNumber = v4->_serialNumber;
  if (v4->_manufacturer) {
    v16 = serialNumber == 0;
  }
  else {
    v16 = 1;
  }
  if (v16)
  {
    v17 = [NSString stringWithFormat:@"IOMikeyBus: required fields are missing, manufacturer %@, serialNumber %@", v4->_manufacturer, serialNumber];
    v24 = *MEMORY[0x263F08320];
    v25 = v17;
    v18 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    makeError(v18, 4u);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    v19 = HAENotificationsLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      +[HAENAccessoryInfo getAccessoryInfoFromIOAccesoryManager:]();
    }

    v4 = 0;
  }
  v20 = v4;

  return v20;
}

+ (id)getAccessoryInfo:(id *)a3
{
  uint64_t v4 = +[HAENAccessoryInfo getAccessoryInfoFromIOAccesoryManager:](HAENAccessoryInfo, "getAccessoryInfoFromIOAccesoryManager:");
  CFDictionaryRef v5 = (void *)v4;
  if (v4 && !*a3)
  {
    v13 = (void *)v4;
  }
  else
  {
    BOOL v6 = HAENotificationsLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[HAENAccessoryInfo getAccessoryInfo:]((uint64_t)a3, v6, v7, v8, v9, v10, v11, v12);
    }

    *a3 = 0;
    v13 = +[HAENAccessoryInfo getAccessoryInfoFromIOKitDirectly:a3];

    if (*a3)
    {
      v14 = HAENotificationsLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[HAENAccessoryInfo getAccessoryInfo:]((uint64_t)a3, v14, v15, v16, v17, v18, v19, v20);
      }
    }
  }
  id v21 = v13;

  return v21;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  CFDictionaryRef v5 = NSStringFromClass(v4);
  BOOL v6 = [v3 stringWithFormat:@"[%@]: serial# '%@', manufacturer '%@', name '%@', model# '%@', InterfaceDeviceSerial# '%@', interfaceModuleSerial# '%@'", v5, self->_serialNumber, self->_manufacturer, self->_name, self->_modelNumber, self->_interfaceDeviceSerialNumber, self->_interfaceModuleSerialNumber];

  return v6;
}

- (NSString)manufacturer
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)modelNumber
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)interfaceDeviceSerialNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)interfaceModuleSerialNumber
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceModuleSerialNumber, 0);
  objc_storeStrong((id *)&self->_interfaceDeviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_modelNumber, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
}

+ (void)getAccessoryInfoFromIOAccesoryManager:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FABA000, v0, v1, "failed to get service port %@", v2, v3, v4, v5, v6);
}

+ (void)getAccessoryInfoFromIOAccesoryManager:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FABA000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

+ (void)getAccessoryInfoFromIOAccesoryManager:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FABA000, v0, v1, "failed to get device module serial number %@", v2, v3, v4, v5, v6);
}

+ (void)getAccessoryInfoFromIOAccesoryManager:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FABA000, v0, v1, "failed IOServiceOpen %@", v2, v3, v4, v5, v6);
}

+ (void)getAccessoryInfo:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)getAccessoryInfo:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end