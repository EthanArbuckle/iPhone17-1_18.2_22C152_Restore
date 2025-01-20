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
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v16 = self;
  SEL v15 = a2;
  id v14 = a3;
  id v13 = a4;
  if (([a3 isEqualToString:&stru_1F13F35B0] & 1) == 0)
  {
    v12.receiver = v16;
    v12.super_class = (Class)CBAPEndpoint;
    v16 = [(CBAPEndpoint *)&v12 init];
    if (v16)
    {
      unsigned int v4 = [(CBAPEndpoint *)v16 findDCPServiceWithName:v14 role:v13];
      v16->_service = v4;
      if (v16->_service)
      {
        IOObjectRetain(v16->_service);
        os_log_t v5 = os_log_create("com.apple.CoreBrightness.CBAPEndpoint", "BuiltIn");
        v16->_logHandle = (OS_os_log *)v5;
        id v6 = objc_alloc(MEMORY[0x1E4F47298]);
        uint64_t v7 = [v6 initWithService:v16->_service];
        v16->_endpoint = (AFKEndpointInterface *)v7;
        dispatch_queue_t v8 = dispatch_queue_create("CBAFKEndpointQueue", 0);
        v16->_epQueue = (OS_dispatch_queue *)v8;
        if (v16->_endpoint && v16->_epQueue)
        {
          [(AFKEndpointInterface *)v16->_endpoint setDispatchQueue:v16->_epQueue];
          [(AFKEndpointInterface *)v16->_endpoint activate:0];
          return v16;
        }
        if (v16->_logHandle)
        {
          logHandle = v16->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t inited = init_default_corebrightness_log();
          }
          logHandle = inited;
        }
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_32((uint64_t)v18, [v14 UTF8String]);
          _os_log_error_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_ERROR, "ERROR initializing CBAPEndpoint for service: %s", v18, 0xCu);
        }
      }
    }

    v16 = 0;
    return 0;
  }
  return 0;
}

- (void)dealloc
{
  unsigned int v4 = self;
  SEL v3 = a2;
  [(AFKEndpointInterface *)self->_endpoint cancel];
  if (v4->_epQueue)
  {
    dispatch_release((dispatch_object_t)v4->_epQueue);
    v4->_epQueue = 0;
  }
  if (v4->_logHandle)
  {

    v4->_logHandle = 0;
  }
  if (v4->_service)
  {
    IOObjectRelease(v4->_service);
    v4->_service = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBAPEndpoint;
  [(CBAPEndpoint *)&v2 dealloc];
}

- (BOOL)setProperty:(id)a3 property:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (self->_logHandle)
  {
    logHandle = self->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
    __os_log_helper_16_2_4_8_32_8_32_8_32_8_64((uint64_t)v27, v11, (uint64_t)"-[CBAPEndpoint setProperty:property:]", [a3 UTF8String], (uint64_t)a4);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "%s:%s called for key: %s, property: %@", v27, 0x2Au);
  }
  if (a3 && a4)
  {
    unint64_t v18 = [a3 lengthOfBytesUsingEncoding:4];
    if (v18 >= 0x40)
    {
      [a3 UTF8String];
      __strlcpy_chk();
      if (self->_logHandle)
      {
        v10 = self->_logHandle;
      }
      else
      {
        uint64_t v9 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        v10 = v9;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_2_8_32_8_32((uint64_t)v25, [a3 UTF8String], (uint64_t)v26);
        _os_log_debug_impl(&dword_1BA438000, v10, OS_LOG_TYPE_DEBUG, "WARNING: Property name is too long it will be truncated, %s -> %s\n", v25, 0x16u);
      }
    }
    CFDataRef v17 = IOCFSerialize(a4, 1uLL);
    if (v17)
    {
      if ([(__CFData *)v17 length] < 486 - v18)
      {
        uint64_t v16 = v18 + 1 + [(__CFData *)v17 length];
        SEL v15 = malloc_type_malloc(v16 + 4, 0xC3166B83uLL);
        *SEL v15 = v18 + 1;
        [a3 UTF8String];
        __strlcpy_chk();
        [(__CFData *)v17 bytes];
        [(__CFData *)v17 length];
        __memcpy_chk();
        char v14 = [(CBAPEndpoint *)self enqueueCommandSync:67 inputBuffer:v15 inputBufferSize:v16 + 4 responseObj:0 options:0];
        if (v15) {
          free(v15);
        }

        char v22 = v14 & 1;
      }
      else
      {
        if (self->_logHandle)
        {
          id v6 = self->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v5 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v5 = init_default_corebrightness_log();
          }
          id v6 = v5;
        }
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_3_8_32_8_0_8_0((uint64_t)v23, [a3 UTF8String], 486 - v18, -[__CFData length](v17, "length"));
          _os_log_error_impl(&dword_1BA438000, v6, OS_LOG_TYPE_ERROR, "Data for setting property %s is too long, max payload %lu, needed size %lu\n", v23, 0x20u);
        }

        char v22 = 0;
      }
    }
    else
    {
      if (self->_logHandle)
      {
        dispatch_queue_t v8 = self->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v7 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v7 = init_default_corebrightness_log();
        }
        dispatch_queue_t v8 = v7;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v24, [a3 UTF8String], (uint64_t)a4);
        _os_log_error_impl(&dword_1BA438000, v8, OS_LOG_TYPE_ERROR, "Could not encode value for setting property %s, value: %@\n", v24, 0x16u);
      }
      char v22 = 0;
    }
  }
  else
  {
    char v22 = 0;
  }
  return v22 & 1;
}

- (id)copyProperty:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  CFDataRef v17 = self;
  SEL v16 = a2;
  id v15 = a3;
  os_log_t oslog = 0;
  if (self->_logHandle)
  {
    logHandle = v17->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  os_log_t oslog = logHandle;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
    __os_log_helper_16_2_3_8_32_8_32_8_32((uint64_t)v21, v6, (uint64_t)"-[CBAPEndpoint copyProperty:]", [v15 UTF8String]);
    _os_log_impl(&dword_1BA438000, oslog, type, "%s:%s called for key: %s", v21, 0x20u);
  }
  if ((unint64_t)[v15 lengthOfBytesUsingEncoding:4] < 0x40)
  {
    memset(__b, 0, sizeof(__b));
    [v15 UTF8String];
    __strlcpy_chk();
    int v10 = 66;
    uint64_t v9 = 0;
    if ([(CBAPEndpoint *)v17 enqueueCommandSync:66 inputBuffer:__b inputBufferSize:64 responseObj:&v9 options:0])
    {
      return v9;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    os_log_t v12 = 0;
    if (v17->_logHandle)
    {
      uint64_t v5 = v17->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v4 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v4 = init_default_corebrightness_log();
      }
      uint64_t v5 = v4;
    }
    os_log_t v12 = v5;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v20, [v15 UTF8String]);
      _os_log_error_impl(&dword_1BA438000, v12, v11, "Property name is too long, %s\n", v20, 0xCu);
    }
    return 0;
  }
}

- (BOOL)sendCommand:(int)a3 inputBuffer:(const void *)a4 inputBufferSize:(unint64_t)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a4 && a5)
  {
    if (self->_logHandle)
    {
      logHandle = self->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v13, a3);
      _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "Send command = 0x%x", v13, 8u);
    }
    char v12 = [(CBAPEndpoint *)self enqueueCommandSync:a3 inputBuffer:a4 inputBufferSize:a5 responseObj:0 options:0];
  }
  else
  {
    char v12 = 0;
  }
  return v12 & 1;
}

- (BOOL)sendOOBCommand:(int)a3 inputBuffer:(const void *)a4 inputBufferSize:(unint64_t)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a4 && a5)
  {
    if (self->_logHandle)
    {
      logHandle = self->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v13, a3);
      _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "Send OOB command = 0x%x", v13, 8u);
    }
    char v12 = -[CBAPEndpoint enqueueCommandSync:inputBuffer:inputBufferSize:responseObj:options:](self, "enqueueCommandSync:inputBuffer:inputBufferSize:responseObj:options:", a3, a4, a5, 0);
  }
  else
  {
    char v12 = 0;
  }
  return v12 & 1;
}

- (BOOL)enqueueCommandSync:(int)a3 inputBuffer:(const void *)a4 inputBufferSize:(unint64_t)a5 responseObj:(id *)a6 options:(unsigned int)a7
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v38 = self;
  SEL v37 = a2;
  unsigned int v36 = a3;
  v35 = a4;
  unint64_t v34 = a5;
  v33 = (uint64_t *)a6;
  unsigned int v32 = a7;
  os_log_t v31 = 0;
  if (self->_logHandle)
  {
    logHandle = v38->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  os_log_t v31 = logHandle;
  os_signpost_type_t v30 = OS_SIGNPOST_INTERVAL_BEGIN;
  os_signpost_id_t v29 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(logHandle))
  {
    __os_log_helper_16_0_1_4_0((uint64_t)v43, v36);
    _os_signpost_emit_with_name_impl(&dword_1BA438000, v31, v30, v29, "enqueueCommandSync", "0x%x", v43, 8u);
  }
  size_t v28 = 486;
  id v27 = (id)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:486];
  uint64_t v26 = 0;
  int v25 = 0;
  char v24 = 0;
  if (v33) {
    uint64_t *v33 = 0;
  }
  LODWORD(v10) = v32;
  int v25 = -[AFKEndpointInterface enqueueCommandSync:timestamp:inputBuffer:inputBufferSize:responseTimestamp:outputBuffer:inOutBufferSize:options:](v38->_endpoint, "enqueueCommandSync:timestamp:inputBuffer:inputBufferSize:responseTimestamp:outputBuffer:inOutBufferSize:options:", v36, mach_continuous_time(), v35, v34, &v26, [v27 mutableBytes], &v28, v10);
  if (v25)
  {
    os_log_t v23 = 0;
    if (v38->_logHandle)
    {
      unint64_t v18 = v38->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v17 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v17 = init_default_corebrightness_log();
      }
      unint64_t v18 = v17;
    }
    os_log_t v23 = v18;
    os_log_type_t v22 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v42, v25);
      _os_log_error_impl(&dword_1BA438000, v23, v22, "ERROR! enqueueCommandSync failed result:0x%x", v42, 8u);
    }
    char v24 = 0;
  }
  else if ([v27 mutableBytes] && v33)
  {
    uint64_t v21 = 0;
    uint64_t v7 = (const char *)[v27 mutableBytes];
    CFTypeRef v8 = IOCFUnserializeBinary(v7, v28, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, (CFStringRef *)&v21);
    uint64_t *v33 = (uint64_t)v8;
    if (v21)
    {
      if (v38->_logHandle)
      {
        SEL v16 = v38->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v15 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v15 = init_default_corebrightness_log();
        }
        SEL v16 = v15;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v41, v21);
        _os_log_error_impl(&dword_1BA438000, v16, OS_LOG_TYPE_ERROR, "ERROR: unable to serialize outputBuffer: %@", v41, 0xCu);
      }
      char v24 = 0;
    }
    else
    {
      if (v38->_logHandle)
      {
        uint64_t v14 = v38->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v13 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v13 = init_default_corebrightness_log();
        }
        uint64_t v14 = v13;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v40, *v33);
        _os_log_debug_impl(&dword_1BA438000, v14, OS_LOG_TYPE_DEBUG, "Response received from DCP: %@", v40, 0xCu);
      }
      char v24 = 1;
    }
  }
  else
  {
    char v24 = 1;
  }

  if (v38->_logHandle)
  {
    char v12 = v38->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v11 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v11 = init_default_corebrightness_log();
    }
    char v12 = v11;
  }
  if (os_signpost_enabled(v12))
  {
    __os_log_helper_16_0_2_4_0_4_0((uint64_t)v39, v36, v24 & 1);
    _os_signpost_emit_with_name_impl(&dword_1BA438000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "enqueueCommandSync", "0x%x, status: %d", v39, 0xEu);
  }
  return v24 & 1;
}

- (unsigned)findDCPServiceWithName:(id)a3 role:(id)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = self;
  SEL v12 = a2;
  id v11 = a3;
  id v10 = a4;
  io_object_t v9 = 0;
  CFDictionaryRef matching = IOServiceMatching("AFKEndpointInterface");
  v17[0] = @"IOPropertyMatch";
  uint64_t v15 = @"role";
  id v16 = v10;
  v18[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v17[1] = @"IONameMatch";
  v18[1] = v11;
  -[__CFDictionary addEntriesFromDictionary:](matching, "addEntriesFromDictionary:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2]);
  io_iterator_t existing = 0;
  if (!IOServiceGetMatchingServices(*MEMORY[0x1E4F2EEF0], matching, &existing))
  {
    if (existing)
    {
      io_object_t v9 = IOIteratorNext(existing);
      IOObjectRelease(existing);
      if (!v9)
      {
        if (v13->_logHandle)
        {
          logHandle = v13->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t inited = init_default_corebrightness_log();
          }
          logHandle = inited;
        }
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_32((uint64_t)v14, [v11 UTF8String]);
          _os_log_error_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_ERROR, "ERROR: %s sevice not found", v14, 0xCu);
        }
      }
    }
  }
  return v9;
}

@end