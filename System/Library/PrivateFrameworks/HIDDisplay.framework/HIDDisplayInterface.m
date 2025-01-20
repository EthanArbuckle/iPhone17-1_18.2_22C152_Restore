@interface HIDDisplayInterface
- (BOOL)commit:(id)a3 error:(id *)a4;
- (BOOL)extract:(id)a3 error:(id *)a4;
- (BOOL)hasMatchingContainerID:(id)a3 containerID:(id)a4;
- (HIDDisplayInterface)initWithContainerID:(id)a3;
- (HIDDisplayInterface)initWithMatching:(id)a3;
- (HIDDisplayInterface)initWithService:(unsigned int)a3;
- (NSArray)capabilities;
- (NSString)containerID;
- (id)description;
- (id)device;
- (id)extractContainerIDFromService:(unsigned int)a3;
- (id)getDeviceElements:(id)a3;
- (id)getHIDDevices;
- (id)getHIDDevicesForMatching:(id)a3;
- (unint64_t)registryID;
- (void)dealloc;
- (void)setDevice:(id)a3;
@end

@implementation HIDDisplayInterface

- (id)description
{
  return (id)[NSString stringWithFormat:@"[regID:0x%llx][containerID:%@][instance:%p]", self->_registryID, self->_containerID, self];
}

- (HIDDisplayInterface)initWithContainerID:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HIDDisplayInterface;
  v6 = [(HIDDisplayInterface *)&v20 init];
  v7 = v6;
  if (!v6)
  {
    v14 = 0;
    goto LABEL_15;
  }
  v8 = [(HIDDisplayInterface *)v6 getHIDDevices];
  v9 = v8;
  if (v8 && [v8 count])
  {
    if ([v9 count])
    {
      uint64_t v10 = 0;
      while (1)
      {
        v11 = [v9 objectAtIndex:v10];
        BOOL v12 = [(HIDDisplayInterface *)v7 hasMatchingContainerID:v11 containerID:v5];

        if (v12) {
          break;
        }
        if (++v10 >= (unint64_t)[v9 count]) {
          goto LABEL_12;
        }
      }
      v16 = [v9 objectAtIndex:v10];
      [(HIDDisplayInterface *)v7 setDevice:v16];

      v17 = [(HIDDisplayInterface *)v7 device];
      [v17 open];

      objc_storeStrong((id *)&v7->_containerID, a3);
      v18 = [(HIDDisplayInterface *)v7 device];
      IORegistryEntryGetRegistryEntryID([v18 service], &v7->_registryID);

      v19 = HIDDisplayLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v7;
        _os_log_impl(&dword_221B0C000, v19, OS_LOG_TYPE_DEFAULT, "%@ Init", buf, 0xCu);
      }

      v14 = v7;
      goto LABEL_13;
    }
  }
  else
  {
    v13 = HIDDisplayLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[HIDDisplayInterface initWithContainerID:]((uint64_t)v5, v13);
    }
  }
LABEL_12:
  v14 = 0;
LABEL_13:

LABEL_15:
  return v14;
}

- (HIDDisplayInterface)initWithService:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)HIDDisplayInterface;
  v4 = [(HIDDisplayInterface *)&v12 init];
  if (v4)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x263F0EC38]) initWithService:v3];
    if (v5)
    {
      [(HIDDisplayInterface *)v4 setDevice:v5];
      v6 = [(HIDDisplayInterface *)v4 device];
      [v6 open];

      IORegistryEntryGetRegistryEntryID(v3, &v4->_registryID);
      uint64_t v7 = [(HIDDisplayInterface *)v4 extractContainerIDFromService:v3];
      containerID = v4->_containerID;
      v4->_containerID = (NSString *)v7;

      v9 = HIDDisplayLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v4;
        _os_log_impl(&dword_221B0C000, v9, OS_LOG_TYPE_DEFAULT, "%@ Init", buf, 0xCu);
      }

      uint64_t v10 = v4;
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (HIDDisplayInterface)initWithMatching:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HIDDisplayLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[HIDDisplayInterface initWithMatching:]";
    _os_log_impl(&dword_221B0C000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  v19.receiver = self;
  v19.super_class = (Class)HIDDisplayInterface;
  v6 = [(HIDDisplayInterface *)&v19 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v8 = [(HIDDisplayInterface *)v6 getHIDDevicesForMatching:v4];
    v9 = v8;
    if (v8 && [v8 count])
    {
      uint64_t v10 = [v9 objectAtIndex:0];
      [(HIDDisplayInterface *)v7 setDevice:v10];

      v11 = [(HIDDisplayInterface *)v7 device];
      [v11 open];

      objc_super v12 = [(HIDDisplayInterface *)v7 device];
      IORegistryEntryGetRegistryEntryID([v12 service], &v7->_registryID);

      v13 = [(HIDDisplayInterface *)v7 device];
      uint64_t v14 = -[HIDDisplayInterface extractContainerIDFromService:](v7, "extractContainerIDFromService:", [v13 service]);
      containerID = v7->_containerID;
      v7->_containerID = (NSString *)v14;

      v16 = HIDDisplayLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v21 = (const char *)v7;
        _os_log_impl(&dword_221B0C000, v16, OS_LOG_TYPE_DEFAULT, "%@ Init", buf, 0xCu);
      }

      v17 = v7;
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = HIDDisplayLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = self;
    _os_log_impl(&dword_221B0C000, v3, OS_LOG_TYPE_DEFAULT, "%@ Dealloc", buf, 0xCu);
  }

  id v4 = [(HIDDisplayInterface *)self device];

  if (v4)
  {
    id v5 = [(HIDDisplayInterface *)self device];
    [v5 close];
  }
  v6.receiver = self;
  v6.super_class = (Class)HIDDisplayInterface;
  [(HIDDisplayInterface *)&v6 dealloc];
}

- (id)extractContainerIDFromService:(unsigned int)a3
{
  if (a3)
  {
    uint64_t v3 = (void *)IORegistryEntrySearchCFProperty(a3, "IOService", @"kUSBContainerID", (CFAllocatorRef)*MEMORY[0x263EFFB08], 3u);
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v4 = v3;
      uint64_t v3 = v4;
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
    uint64_t v3 = 0;
  }

  return v4;
}

- (BOOL)hasMatchingContainerID:(id)a3 containerID:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [a3 service];
  uint64_t entryID = 0;
  IORegistryEntryGetRegistryEntryID(v7, &entryID);
  v8 = [(HIDDisplayInterface *)self extractContainerIDFromService:v7];
  if (v8)
  {
    uint64_t v9 = [v6 lowercaseString];
    uint64_t v10 = [v8 lowercaseString];
    BOOL v11 = ([v9 containsString:v10] & 1) != 0 || objc_msgSend(v10, "containsString:", v9);
    objc_super v12 = HIDDisplayLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = "Failure";
      *(_DWORD *)buf = 138412802;
      v17 = self;
      if (v11) {
        v13 = "Success";
      }
      __int16 v18 = 2112;
      objc_super v19 = v8;
      __int16 v20 = 2080;
      v21 = v13;
      _os_log_impl(&dword_221B0C000, v12, OS_LOG_TYPE_DEFAULT, "%@ Container ID Match for %@ returned %s", buf, 0x20u);
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (id)getDeviceElements:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v22 = self;
  id v6 = [(HIDDisplayInterface *)self device];
  uint64_t v7 = [v6 elementsMatching:v4];

  if (v7)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = v7;
    uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      __int16 v20 = v7;
      id v21 = v4;
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(obj);
          }
          objc_super v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(v12, "usage", v20, v21);
          uint64_t v14 = [v12 usagePage];
          uint64_t v15 = HIDDisplayLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            v29 = v22;
            __int16 v30 = 2048;
            uint64_t v31 = v14;
            __int16 v32 = 2048;
            uint64_t v33 = v13;
            _os_log_impl(&dword_221B0C000, v15, OS_LOG_TYPE_INFO, "%@ Display Device Element UP: 0x%lx , U: 0x%lx ", buf, 0x20u);
          }

          v16 = [NSNumber numberWithInteger:v13];
          [v5 setObject:v12 forKeyedSubscript:v16];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
      }
      while (v9);
      v17 = v5;
      uint64_t v7 = v20;
      id v4 = v21;
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
  }
  id v18 = v17;

  return v18;
}

- (id)getHIDDevicesForMatching:(id)a3
{
  id v4 = a3;
  manager = self->_manager;
  if (manager
    || (id v6 = (HIDManager *)objc_alloc_init(MEMORY[0x263F41DE0]),
        uint64_t v7 = self->_manager,
        self->_manager = v6,
        v7,
        (manager = self->_manager) != 0))
  {
    [(HIDManager *)manager setDeviceMatching:v4];
    uint64_t v8 = [(HIDManager *)self->_manager devices];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)getHIDDevices
{
  return 0;
}

- (id)device
{
  return self->_deviceRef;
}

- (void)setDevice:(id)a3
{
}

- (BOOL)commit:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(HIDDisplayInterface *)self device];
  char v8 = [v7 commitElements:v6 direction:1 error:a4];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = HIDDisplayLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[HIDDisplayInterface commit:error:]();
    }
  }
  return v8;
}

- (BOOL)extract:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(HIDDisplayInterface *)self device];
  char v8 = [v7 commitElements:v6 direction:0 error:a4];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = HIDDisplayLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[HIDDisplayInterface extract:error:]();
    }
  }
  return v8;
}

- (NSArray)capabilities
{
  return 0;
}

- (NSString)containerID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)registryID
{
  return self->_registryID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_deviceRef, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

- (void)initWithContainerID:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_221B0C000, a2, OS_LOG_TYPE_ERROR, "Failed to get valid hid device for %@", (uint8_t *)&v2, 0xCu);
}

- (void)commit:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_221B0C000, v0, v1, "%@ Failed Set HID Elements values with error %@");
}

- (void)extract:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_221B0C000, v0, v1, "%@ Failed Get HID Elements values with error %@");
}

@end