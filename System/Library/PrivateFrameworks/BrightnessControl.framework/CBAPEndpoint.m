@interface CBAPEndpoint
- (BOOL)enqueueCommandSync:(int)a3 inputBuffer:(const void *)a4 inputBufferSize:(unint64_t)a5 responseObj:(id *)a6 options:(unsigned int)a7;
- (BOOL)sendCommand:(int)a3 inputBuffer:(const void *)a4 inputBufferSize:(unint64_t)a5;
- (BOOL)sendOOBCommand:(int)a3 inputBuffer:(const void *)a4 inputBufferSize:(unint64_t)a5;
- (BOOL)setProperty:(id)a3 property:(id)a4;
- (CBAPEndpoint)initWithServiceName:(id)a3 role:(id)a4;
- (id)copyProperty:(id)a3;
- (unsigned)findDCPServiceWithName:(id)a3 role:(id)a4;
- (void)dealloc;
@end

@implementation CBAPEndpoint

- (CBAPEndpoint)initWithServiceName:(id)a3 role:(id)a4
{
  if ([a3 isEqualToString:&stru_26EB2FDC8]) {
    return 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)CBAPEndpoint;
  v7 = [(CBAPEndpoint *)&v15 init];
  v8 = v7;
  if (!v7
    || (io_object_t v9 = [(CBAPEndpoint *)v7 findDCPServiceWithName:a3 role:a4],
        (v8->_service = v9) == 0))
  {
LABEL_14:

    return 0;
  }
  IOObjectRetain(v9);
  v8->_logHandle = (OS_os_log *)os_log_create("com.apple.CoreBrightness.CBAPEndpoint", "BuiltIn");
  v8->_endpoint = (AFKEndpointInterface *)[objc_alloc(MEMORY[0x263F20840]) initWithService:v8->_service];
  dispatch_queue_t v10 = dispatch_queue_create("CBAFKEndpointQueue", 0);
  v8->_epQueue = (OS_dispatch_queue *)v10;
  endpoint = v8->_endpoint;
  if (endpoint) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    logHandle = v8->_logHandle;
    if (!logHandle)
    {
      logHandle = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        logHandle = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR)) {
      -[CBAPEndpoint initWithServiceName:role:](a3);
    }
    goto LABEL_14;
  }
  -[AFKEndpointInterface setDispatchQueue:](endpoint, "setDispatchQueue:");
  [(AFKEndpointInterface *)v8->_endpoint activate:0];
  return v8;
}

- (void)dealloc
{
  [(AFKEndpointInterface *)self->_endpoint cancel];
  epQueue = self->_epQueue;
  if (epQueue)
  {
    dispatch_release(epQueue);
    self->_epQueue = 0;
  }
  logHandle = self->_logHandle;
  if (logHandle)
  {

    self->_logHandle = 0;
  }
  io_object_t service = self->_service;
  if (service)
  {
    IOObjectRelease(service);
    self->_io_object_t service = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)CBAPEndpoint;
  [(CBAPEndpoint *)&v6 dealloc];
}

- (BOOL)setProperty:(id)a3 property:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  logHandle = self->_logHandle;
  if (!logHandle)
  {
    logHandle = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      logHandle = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315906;
    uint64_t v21 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
    __int16 v22 = 2080;
    v23 = "-[CBAPEndpoint setProperty:property:]";
    __int16 v24 = 2080;
    uint64_t v25 = [a3 UTF8String];
    __int16 v26 = 2112;
    id v27 = a4;
    _os_log_impl(&dword_238363000, logHandle, OS_LOG_TYPE_DEFAULT, "%s:%s called for key: %s, property: %@", (uint8_t *)&v20, 0x2Au);
  }
  BOOL v8 = 0;
  if (a3 && a4)
  {
    unint64_t v9 = [a3 lengthOfBytesUsingEncoding:4];
    if (v9 >= 0x40)
    {
      [a3 UTF8String];
      __strlcpy_chk();
      inited = self->_logHandle;
      if (!inited)
      {
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          inited = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG)) {
        -[CBAPEndpoint setProperty:property:](a3, (uint64_t)&v20, inited);
      }
    }
    CFDataRef v11 = IOCFSerialize(a4, 1uLL);
    if (v11)
    {
      CFDataRef v12 = v11;
      if ([(__CFData *)v11 length] < 486 - v9)
      {
        size_t v13 = v9 + [(__CFData *)v12 length] + 5;
        v14 = (char *)malloc_type_malloc(v13, 0xC3166B83uLL);
        *(_DWORD *)v14 = v9 + 1;
        strlcpy(v14 + 4, (const char *)[a3 UTF8String], 0x40uLL);
        memcpy(&v14[*(unsigned int *)v14 + 4], (const void *)[(__CFData *)v12 bytes], [(__CFData *)v12 length]);
        BOOL v8 = [(CBAPEndpoint *)self enqueueCommandSync:67 inputBuffer:v14 inputBufferSize:v13 responseObj:0 options:0];
        free(v14);

        return v8;
      }
      v16 = self->_logHandle;
      if (!v16)
      {
        v16 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          v16 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = [a3 UTF8String];
        uint64_t v19 = [(__CFData *)v12 length];
        int v20 = 136315650;
        uint64_t v21 = v18;
        __int16 v22 = 2048;
        v23 = (const char *)(486 - v9);
        __int16 v24 = 2048;
        uint64_t v25 = v19;
        _os_log_error_impl(&dword_238363000, v16, OS_LOG_TYPE_ERROR, "Data for setting property %s is too long, max payload %lu, needed size %lu\n", (uint8_t *)&v20, 0x20u);
      }
    }
    else
    {
      objc_super v15 = self->_logHandle;
      if (!v15)
      {
        objc_super v15 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          objc_super v15 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[CBAPEndpoint setProperty:property:](a3, (uint64_t)a4, v15);
      }
    }
    return 0;
  }
  return v8;
}

- (id)copyProperty:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  logHandle = self->_logHandle;
  if (!logHandle)
  {
    logHandle = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      logHandle = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[CBAPEndpoint copyProperty:]";
    *(_WORD *)&buf[22] = 2080;
    *(void *)&buf[24] = [a3 UTF8String];
    _os_log_impl(&dword_238363000, logHandle, OS_LOG_TYPE_DEFAULT, "%s:%s called for key: %s", buf, 0x20u);
  }
  if ((unint64_t)[a3 lengthOfBytesUsingEncoding:4] < 0x40)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    memset(buf, 0, sizeof(buf));
    [a3 UTF8String];
    __strlcpy_chk();
    BOOL v8 = 0;
    if ([(CBAPEndpoint *)self enqueueCommandSync:66 inputBuffer:buf inputBufferSize:64 responseObj:&v8 options:0])
    {
      return v8;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    inited = self->_logHandle;
    if (!inited)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR)) {
      -[CBAPEndpoint copyProperty:](a3);
    }
    return 0;
  }
}

- (BOOL)sendCommand:(int)a3 inputBuffer:(const void *)a4 inputBufferSize:(unint64_t)a5
{
  BOOL result = 0;
  if (a4 && a5)
  {
    uint64_t v9 = *(void *)&a3;
    logHandle = self->_logHandle;
    if (!logHandle)
    {
      logHandle = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        logHandle = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG)) {
      -[CBAPEndpoint sendCommand:inputBuffer:inputBufferSize:](v9, logHandle);
    }
    return [(CBAPEndpoint *)self enqueueCommandSync:v9 inputBuffer:a4 inputBufferSize:a5 responseObj:0 options:0];
  }
  return result;
}

- (BOOL)sendOOBCommand:(int)a3 inputBuffer:(const void *)a4 inputBufferSize:(unint64_t)a5
{
  BOOL result = 0;
  if (a4 && a5)
  {
    uint64_t v9 = *(void *)&a3;
    logHandle = self->_logHandle;
    if (!logHandle)
    {
      logHandle = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        logHandle = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG)) {
      -[CBAPEndpoint sendOOBCommand:inputBuffer:inputBufferSize:](v9, logHandle);
    }
    return [(CBAPEndpoint *)self enqueueCommandSync:v9 inputBuffer:a4 inputBufferSize:a5 responseObj:0 options:1];
  }
  return result;
}

- (BOOL)enqueueCommandSync:(int)a3 inputBuffer:(const void *)a4 inputBufferSize:(unint64_t)a5 responseObj:(id *)a6 options:(unsigned int)a7
{
  uint64_t v11 = *(void *)&a3;
  uint64_t v30 = *MEMORY[0x263EF8340];
  logHandle = self->_logHandle;
  if (!logHandle)
  {
    logHandle = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      logHandle = init_default_corebrightness_log();
    }
  }
  if (os_signpost_enabled(logHandle))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v11;
    _os_signpost_emit_with_name_impl(&dword_238363000, logHandle, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "enqueueCommandSync", "0x%x", buf, 8u);
  }
  size_t bufferSize = 486;
  v14 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:486];
  uint64_t v25 = 0;
  if (a6) {
    *a6 = 0;
  }
  LODWORD(v24) = a7;
  int v15 = -[AFKEndpointInterface enqueueCommandSync:timestamp:inputBuffer:inputBufferSize:responseTimestamp:outputBuffer:inOutBufferSize:options:](self->_endpoint, "enqueueCommandSync:timestamp:inputBuffer:inputBufferSize:responseTimestamp:outputBuffer:inOutBufferSize:options:", v11, mach_continuous_time(), a4, a5, &v25, [v14 mutableBytes], &bufferSize, v24);
  if (v15)
  {
    int v16 = v15;
    inited = self->_logHandle;
    if (!inited)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR)) {
      -[CBAPEndpoint enqueueCommandSync:inputBuffer:inputBufferSize:responseObj:options:](v16, inited);
    }
    BOOL v18 = 0;
  }
  else
  {
    uint64_t v21 = [v14 mutableBytes];
    BOOL v18 = 1;
    if (a6 && v21)
    {
      *(void *)buf = 0;
      __int16 v22 = (const char *)[v14 mutableBytes];
      *a6 = (id)IOCFUnserializeBinary(v22, bufferSize, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0, (CFStringRef *)buf);
      BOOL v18 = *(void *)buf == 0;
      v23 = self->_logHandle;
      if (*(void *)buf)
      {
        if (!v23)
        {
          v23 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            v23 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[CBAPEndpoint enqueueCommandSync:inputBuffer:inputBufferSize:responseObj:options:]((uint64_t *)buf, v23);
        }
      }
      else
      {
        if (!v23)
        {
          v23 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            v23 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          -[CBAPEndpoint enqueueCommandSync:inputBuffer:inputBufferSize:responseObj:options:]((uint64_t *)a6, v23);
        }
      }
    }
  }

  uint64_t v19 = self->_logHandle;
  if (!v19)
  {
    uint64_t v19 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v19 = init_default_corebrightness_log();
    }
  }
  if (os_signpost_enabled(v19))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v11;
    __int16 v28 = 1024;
    BOOL v29 = v18;
    _os_signpost_emit_with_name_impl(&dword_238363000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "enqueueCommandSync", "0x%x, status: %d", buf, 0xEu);
  }
  return v18;
}

- (unsigned)findDCPServiceWithName:(id)a3 role:(id)a4
{
  v17[2] = *MEMORY[0x263EF8340];
  CFMutableDictionaryRef v7 = IOServiceMatching("AFKEndpointInterface");
  id v15 = a4;
  v16[0] = @"IOPropertyMatch";
  v14 = @"role";
  uint64_t v8 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v16[1] = @"IONameMatch";
  v17[0] = v8;
  v17[1] = a3;
  -[__CFDictionary addEntriesFromDictionary:](v7, "addEntriesFromDictionary:", [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2]);
  io_iterator_t existing = 0;
  io_object_t v9 = 0;
  if (IOServiceGetMatchingServices(*MEMORY[0x263F0EC88], v7, &existing)) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = existing == 0;
  }
  if (!v10)
  {
    io_object_t v9 = IOIteratorNext(existing);
    IOObjectRelease(existing);
    if (!v9)
    {
      logHandle = self->_logHandle;
      if (!logHandle)
      {
        logHandle = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          logHandle = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR)) {
        -[CBAPEndpoint findDCPServiceWithName:role:](a3);
      }
      return 0;
    }
  }
  return v9;
}

- (void)initWithServiceName:(void *)a1 role:.cold.1(void *a1)
{
  [a1 UTF8String];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_238363000, v1, v2, "ERROR initializing CBAPEndpoint for service: %s", v3, v4, v5, v6, v7);
}

- (void)setProperty:(NSObject *)a3 property:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [a1 UTF8String];
  OUTLINED_FUNCTION_1_1();
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_238363000, a3, OS_LOG_TYPE_ERROR, "Could not encode value for setting property %s, value: %@\n", v5, 0x16u);
}

- (void)setProperty:(NSObject *)a3 property:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [a1 UTF8String];
  OUTLINED_FUNCTION_1_1();
  __int16 v6 = 2080;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_238363000, a3, OS_LOG_TYPE_DEBUG, "WARNING: Property name is too long it will be truncated, %s -> %s\n", v5, 0x16u);
}

- (void)copyProperty:(void *)a1 .cold.1(void *a1)
{
  [a1 UTF8String];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_238363000, v1, v2, "Property name is too long, %s\n", v3, v4, v5, v6, v7);
}

- (void)sendCommand:(int)a1 inputBuffer:(NSObject *)a2 inputBufferSize:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_238363000, a2, OS_LOG_TYPE_DEBUG, "Send command = 0x%x", (uint8_t *)v2, 8u);
}

- (void)sendOOBCommand:(int)a1 inputBuffer:(NSObject *)a2 inputBufferSize:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_238363000, a2, OS_LOG_TYPE_DEBUG, "Send OOB command = 0x%x", (uint8_t *)v2, 8u);
}

- (void)enqueueCommandSync:(uint64_t *)a1 inputBuffer:(NSObject *)a2 inputBufferSize:responseObj:options:.cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_238363000, a2, OS_LOG_TYPE_DEBUG, "Response received from DCP: %@", (uint8_t *)&v3, 0xCu);
}

- (void)enqueueCommandSync:(uint64_t *)a1 inputBuffer:(NSObject *)a2 inputBufferSize:responseObj:options:.cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_238363000, a2, OS_LOG_TYPE_ERROR, "ERROR: unable to serialize outputBuffer: %@", (uint8_t *)&v3, 0xCu);
}

- (void)enqueueCommandSync:(int)a1 inputBuffer:(NSObject *)a2 inputBufferSize:responseObj:options:.cold.3(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_238363000, a2, OS_LOG_TYPE_ERROR, "ERROR! enqueueCommandSync failed result:0x%x", (uint8_t *)v2, 8u);
}

- (void)findDCPServiceWithName:(void *)a1 role:.cold.1(void *a1)
{
  [a1 UTF8String];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_238363000, v1, v2, "ERROR: %s sevice not found", v3, v4, v5, v6, v7);
}

@end