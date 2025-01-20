@interface BuddySMC
+ (unsigned)_connectToService;
- (BOOL)hasKey:(id)a3;
- (BOOL)writeNumber:(unsigned __int8)a3 forKey:(id)a4;
- (BuddySMC)init;
- (id)numberForKey:(id)a3;
- (int)_valueForKey:(id)a3 outputData:(void *)a4 outputSize:(unsigned int *)a5;
- (int)_writeData:(void *)a3 writeDataSize:(unint64_t)a4 forKey:(id)a5;
- (unsigned)_stringToKey:(const char *)a3;
- (unsigned)port;
- (void)dealloc;
- (void)setPort:(unsigned int)a3;
@end

@implementation BuddySMC

- (BuddySMC)init
{
  SEL v6 = a2;
  id location = 0;
  v5.receiver = self;
  v5.super_class = (Class)BuddySMC;
  id location = [(BuddySMC *)&v5 init];
  objc_storeStrong(&location, location);
  if (location)
  {
    uint64_t v2 = +[BuddySMC _connectToService];
    [location setPort:v2];
  }
  v3 = (BuddySMC *)location;
  objc_storeStrong(&location, 0);
  return v3;
}

- (void)dealloc
{
  kern_return_t v7;
  int v8;
  io_connect_t connect;
  SEL v10;
  BuddySMC *v11;
  uint8_t v12[16];
  uint8_t buf[8];

  v11 = self;
  v10 = a2;
  connect = [(BuddySMC *)self port];
  if (connect)
  {
    v7 = IOConnectCallScalarMethod([(BuddySMC *)v11 port], 1u, 0, 0, 0, 0);
    if (v7)
    {
      os_log_t v4 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v3 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        sub_10005A060(v12, v7);
        _os_log_error_impl((void *)&_mh_execute_header, v4, v3, "Failed to close client service: %d", v12, 8u);
      }
      objc_storeStrong((id *)&v4, 0);
    }
    else
    {
      v7 = IOServiceClose(connect);
      if (v7)
      {
        os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v5 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          sub_10005A060(buf, v7);
          _os_log_error_impl((void *)&_mh_execute_header, oslog, v5, "Failed to close service: %d", buf, 8u);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
      else
      {
        [(BuddySMC *)v11 setPort:0];
      }
    }
    v8 = 0;
  }
  else
  {
    v8 = 1;
  }
  v2.receiver = v11;
  v2.super_class = (Class)BuddySMC;
  [(BuddySMC *)&v2 dealloc];
}

- (BOOL)hasKey:(id)a3
{
  SEL v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int v4 = 0;
  BOOL v7 = [(BuddySMC *)v6 _valueForKey:location[0] outputData:v8 outputSize:&v4] == 0;
  objc_storeStrong(location, 0);
  return v7;
}

- (id)numberForKey:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int v10 = 0;
  int v9 = [(BuddySMC *)v12 _valueForKey:location[0] outputData:v16 outputSize:&v10];
  if (v9)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_1000BB014((uint64_t)buf, (uint64_t)location[0], v9);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, v7, "Failed to read key \"%@\": %d", buf, 0x12u);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v13 = 0;
    int v6 = 1;
  }
  else
  {
    switch(v10)
    {
      case 1:
        id v13 = +[NSNumber numberWithChar:SLOBYTE(v16[0])];
        int v6 = 1;
        break;
      case 2:
        id v13 = +[NSNumber numberWithInt:LOWORD(v16[0])];
        int v6 = 1;
        break;
      case 4:
        id v13 = +[NSNumber numberWithInt:v16[0]];
        int v6 = 1;
        break;
      default:
        os_log_t v5 = (os_log_t)(id)_BYLoggingFacility();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          sub_1000BB014((uint64_t)v14, (uint64_t)location[0], v10);
          _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Unsupported value for key \"%@\"; size is %d",
            v14,
            0x12u);
        }
        objc_storeStrong((id *)&v5, 0);
        id v13 = 0;
        int v6 = 1;
        break;
    }
  }
  objc_storeStrong(location, 0);
  id v3 = v13;

  return v3;
}

- (BOOL)writeNumber:(unsigned __int8)a3 forKey:(id)a4
{
  v11 = self;
  SEL v10 = a2;
  unsigned __int8 v9 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  int v7 = [(BuddySMC *)v11 _writeData:&v9 writeDataSize:1 forKey:location];
  if (v7)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_1001C48C4((uint64_t)buf, v9, (uint64_t)location, v7);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Failed to write value %u to key \"%@\": %d", buf, 0x18u);
    }
    objc_storeStrong((id *)&oslog, 0);
    char v12 = 0;
    int v6 = 1;
  }
  else
  {
    char v12 = 1;
    int v6 = 1;
  }
  objc_storeStrong(&location, 0);
  return v12 & 1;
}

+ (unsigned)_connectToService
{
  kern_return_t v9;
  uint8_t buf[7];
  char v11;
  os_log_t oslog;
  io_connect_t connect;
  io_service_t service;
  SEL v15;
  id v16;
  uint8_t v18[16];
  uint8_t v19[8];

  v16 = a1;
  v15 = a2;
  CFDictionaryRef v2 = IOServiceMatching("AppleSMC");
  service = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  connect = 0;
  if (service)
  {
    unsigned __int8 v9 = IOServiceOpen(service, mach_task_self_, 0, &connect);
    IOObjectRelease(service);
    if (!v9 && connect)
    {
      unsigned __int8 v9 = IOConnectCallScalarMethod(connect, 0, 0, 0, 0, 0);
      if (v9)
      {
        os_log_t v6 = (os_log_t)(id)_BYLoggingFacility();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          sub_10005A060(v18, v9);
          _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to open client service: %d", v18, 8u);
        }
        objc_storeStrong((id *)&v6, 0);
        return 0;
      }
      else
      {
        return connect;
      }
    }
    else
    {
      os_log_t v8 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v7 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        sub_10005A060(v19, v9);
        _os_log_error_impl((void *)&_mh_execute_header, v8, v7, "Failed to open service: %d", v19, 8u);
      }
      objc_storeStrong((id *)&v8, 0);
      return 0;
    }
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    v11 = 16;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      id v3 = oslog;
      os_log_type_t v4 = v11;
      sub_10004B24C(buf);
      _os_log_error_impl((void *)&_mh_execute_header, v3, v4, "Failed to get matching service", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    return 0;
  }
}

- (int)_valueForKey:(id)a3 outputData:(void *)a4 outputSize:(unsigned int *)a5
{
  kern_return_t v16;
  unint64_t v17;
  size_t outputStructCnt;
  int v19;
  unsigned int v20;
  unsigned int *v21;
  void *v22;
  id location[2];
  BuddySMC *v24;
  int v25;
  uint8_t v26[32];
  uint8_t v27[32];
  uint8_t v28[32];
  uint8_t buf[24];
  int outputStruct[42];
  _DWORD __b[42];

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = a4;
  v21 = a5;
  v20 = -[BuddySMC _stringToKey:](v24, "_stringToKey:", [location[0] UTF8String]);
  v19 = 0;
  outputStructCnt = 168;
  v17 = 120;
  memset(__b, 0, sizeof(__b));
  memset(outputStruct, 0, sizeof(outputStruct));
  __b[0] = v20;
  BYTE2(__b[10]) = 9;
  v16 = IOConnectCallStructMethod([(BuddySMC *)v24 port], 2u, __b, 0xA8uLL, outputStruct, &outputStructCnt);
  if (v16 || LOBYTE(outputStruct[10]))
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v14 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_1000BB014((uint64_t)buf, (uint64_t)location[0], v16);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, v14, "Failed to fetch info for key \"%@\": %d", buf, 0x12u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v25 = -536870212;
    int v13 = 1;
  }
  else
  {
    v19 = outputStruct[7];
    if (v17 >= outputStruct[7])
    {
      if (v21) {
        *v21 = v19;
      }
      memset(__b, 0, sizeof(__b));
      memset(outputStruct, 0, sizeof(outputStruct));
      __b[0] = v20;
      __b[7] = v19;
      BYTE2(__b[10]) = 5;
      v16 = IOConnectCallStructMethod([(BuddySMC *)v24 port], 2u, __b, 0xA8uLL, outputStruct, &outputStructCnt);
      if (v16 || LOBYTE(outputStruct[10]))
      {
        os_log_t v10 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v9 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          sub_1000BB014((uint64_t)v27, (uint64_t)location[0], v16);
          _os_log_error_impl((void *)&_mh_execute_header, v10, v9, "Failed to read info for key \"%@\": %d", v27, 0x12u);
        }
        objc_storeStrong((id *)&v10, 0);
        if (v16) {
          v25 = v16;
        }
        else {
          v25 = -536870212;
        }
        int v13 = 1;
      }
      else if (v17 >= outputStruct[7])
      {
        __memcpy_chk();
        v25 = v16;
        int v13 = 1;
      }
      else
      {
        os_log_t v8 = (os_log_t)(id)_BYLoggingFacility();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          sub_1001C4FFC((uint64_t)v26, (uint64_t)location[0], outputStruct[7], v17);
          _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Unexpected size found for key \"%@\" when reading; %u vs %lu",
            v26,
            0x1Cu);
        }
        objc_storeStrong((id *)&v8, 0);
        v25 = -536870206;
        int v13 = 1;
      }
    }
    else
    {
      os_log_t v12 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        sub_1001C4FFC((uint64_t)v28, (uint64_t)location[0], outputStruct[7], v17);
        _os_log_error_impl((void *)&_mh_execute_header, v12, v11, "Unexpected size found for key \"%@\" when fetching information; %u vs %lu",
          v28,
          0x1Cu);
      }
      objc_storeStrong((id *)&v12, 0);
      v25 = -536870206;
      int v13 = 1;
    }
  }
  objc_storeStrong(location, 0);
  return v25;
}

- (int)_writeData:(void *)a3 writeDataSize:(unint64_t)a4 forKey:(id)a5
{
  v15 = self;
  SEL v14 = a2;
  int v13 = a3;
  unint64_t v12 = a4;
  id location = 0;
  objc_storeStrong(&location, a5);
  unsigned int v10 = -[BuddySMC _stringToKey:](v15, "_stringToKey:", [location UTF8String]);
  size_t outputStructCnt = 80;
  memset(__b, 0, sizeof(__b));
  memset(outputStruct, 0, sizeof(outputStruct));
  __b[0] = v10;
  BYTE2(__b[10]) = 6;
  __b[7] = v12;
  for (int i = 0; ; ++i)
  {
    BOOL v5 = 0;
    if (i < 32) {
      BOOL v5 = i < v12;
    }
    if (!v5) {
      break;
    }
    *((unsigned char *)&__b[12] + i) = v13[i];
  }
  unsigned int v7 = IOConnectCallStructMethod([(BuddySMC *)v15 port], 2u, __b, 0x50uLL, outputStruct, &outputStructCnt);
  if (v7 || outputStruct[40])
  {
    NSLog(@"Write failed for key '%@' (0x%X, 0x%X)\n", location, v7, outputStruct[40]);
    int v16 = -536870212;
  }
  else
  {
    NSLog(@"Write succeed for key '%@', value returned = 0x%X", location, 0);
    int v16 = 0;
  }
  objc_storeStrong(&location, 0);
  return v16;
}

- (unsigned)_stringToKey:(const char *)a3
{
  unsigned int v5 = 0;
  for (int i = 0; i < 4; ++i)
    unsigned int v5 = (v5 << 8) | a3[i];
  return v5;
}

- (unsigned)port
{
  return self->_port;
}

- (void)setPort:(unsigned int)a3
{
  self->_port = a3;
}

@end