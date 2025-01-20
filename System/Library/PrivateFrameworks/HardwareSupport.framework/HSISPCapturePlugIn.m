@interface HSISPCapturePlugIn
+ (id)defaultPlugIn;
+ (id)new;
- (HSISPCapturePlugIn)init;
- (HSISPCapturePlugIn)initWithFactoryFunctionSymbol:(id)a3 atPath:(id)a4;
- (id)device:(id *)a3;
- (void)init;
@end

@implementation HSISPCapturePlugIn

+ (id)defaultPlugIn
{
  v2 = objc_opt_new();

  return v2;
}

+ (id)new
{
  return (id)MEMORY[0x270F9A540](a1, a2);
}

- (HSISPCapturePlugIn)init
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  mach_port_t v3 = *MEMORY[0x263F0EC90];
  CFDictionaryRef v4 = IOServiceNameMatching("isp");
  uint64_t MatchingService = IOServiceGetMatchingService(v3, v4);
  if (!MatchingService)
  {
    v9 = HSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[HSISPCapturePlugIn init](v9);
    }
    goto LABEL_7;
  }
  io_object_t v6 = MatchingService;
  io_iterator_t iterator = 0;
  mach_error_t v7 = MEMORY[0x22A6A2D10](MatchingService, "IOService", &iterator);
  if (v7)
  {
    mach_error_t v8 = v7;
    v9 = HSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(HSISPCapturePlugIn *)v8 init];
    }
LABEL_7:

    v10 = 0;
    goto LABEL_32;
  }
  io_object_t v11 = IOIteratorNext(iterator);
  if (!v11) {
    goto LABEL_29;
  }
  while (1)
  {
    v12 = (__CFString *)IOObjectCopyClass(v11);
    v13 = HSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v12;
      _os_log_impl(&dword_2289F2000, v13, OS_LOG_TYPE_DEFAULT, "Found isp child named %@", buf, 0xCu);
    }

    if (!v12)
    {
      v14 = HSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        [(HSISPCapturePlugIn *)&v24 init];
      }
      goto LABEL_28;
    }
    v14 = v12;
    if (HSCapturePlugInVersion_onceToken != -1) {
      dispatch_once(&HSCapturePlugInVersion_onceToken, &__block_literal_global);
    }
    v15 = objc_msgSend((id)HSCapturePlugInVersion_regex, "firstMatchInString:options:range:", v14, 0, 0, -[NSObject length](v14, "length"));
    if ([v15 numberOfRanges] == 2)
    {
      uint64_t v16 = [v15 rangeAtIndex:1];
      v18 = -[NSObject substringWithRange:](v14, "substringWithRange:", v16, v17);
    }
    else
    {
      v19 = HSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v14;
        _os_log_error_impl(&dword_2289F2000, v19, OS_LOG_TYPE_ERROR, "Expected to find 2 matched regex groups {AppleH\\d+CamIn, \\d+} in %@.", buf, 0xCu);
      }

      v18 = 0;
    }

    if (!v18)
    {
      v22 = HSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v14;
        _os_log_error_impl(&dword_2289F2000, v22, OS_LOG_TYPE_ERROR, "Cannot determine PlugIn version from %@.", buf, 0xCu);
      }

      goto LABEL_27;
    }
    v20 = [@"HxISPCaptureDeviceCreate" stringByReplacingOccurrencesOfString:@"Hx" withString:v18];
    v21 = [@"/System/Library/MediaCapture/HxISP.mediacapture" stringByReplacingOccurrencesOfString:@"Hx" withString:v18];
    self = [(HSISPCapturePlugIn *)self initWithFactoryFunctionSymbol:v20 atPath:v21];

    if (self) {
      break;
    }
LABEL_27:

LABEL_28:
    io_object_t v11 = IOIteratorNext(iterator);
    if (!v11) {
      goto LABEL_29;
    }
  }

LABEL_29:
  if (iterator) {
    IOObjectRelease(iterator);
  }
  IOObjectRelease(v6);
  self = self;
  v10 = self;
LABEL_32:

  return v10;
}

- (HSISPCapturePlugIn)initWithFactoryFunctionSymbol:(id)a3 atPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  mach_error_t v8 = HSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[HSISPCapturePlugIn initWithFactoryFunctionSymbol:atPath:].cold.4((uint64_t)v7, v8);
  }

  v9 = [MEMORY[0x263F08850] defaultManager];
  char v10 = [v9 fileExistsAtPath:v7];

  if ((v10 & 1) == 0)
  {
    io_object_t v11 = HSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[HSISPCapturePlugIn initWithFactoryFunctionSymbol:atPath:]((uint64_t)v7, v11);
    }
  }
  id v12 = v7;
  v13 = dlopen((const char *)[v12 cStringUsingEncoding:4], 4);
  if (!v13)
  {
    v18 = HSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[HSISPCapturePlugIn initWithFactoryFunctionSymbol:atPath:]();
    }

    goto LABEL_16;
  }
  v14 = dlsym(v13, (const char *)[v6 UTF8String]);
  if (!v14)
  {
    v19 = HSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[HSISPCapturePlugIn initWithFactoryFunctionSymbol:atPath:]();
    }

LABEL_16:
    uint64_t v17 = 0;
    goto LABEL_17;
  }
  v15 = v14;
  v21.receiver = self;
  v21.super_class = (Class)HSISPCapturePlugIn;
  uint64_t v16 = [(HSISPCapturePlugIn *)&v21 init];
  v16->_createFunction = v15;
  self = v16;
  uint64_t v17 = self;
LABEL_17:

  return v17;
}

- (id)device:(id *)a3
{
  v27[1] = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  int v4 = ((uint64_t (*)(void, void, CFTypeRef *))self->_createFunction)(*MEMORY[0x263EFFB08], 0, &cf);
  if (v4)
  {
    int v5 = v4;
    id v6 = __HSDescribeFigDeviceStatus(v4);
    if (v6)
    {
      if (a3)
      {
        id v7 = [NSString stringWithFormat:@"Failed to create FigCaptureDeviceRef! %@!", v6];
        mach_error_t v8 = (void *)MEMORY[0x263F087E8];
        uint64_t v9 = *MEMORY[0x263F08410];
        uint64_t v10 = v5;
        uint64_t v26 = *MEMORY[0x263F08320];
        v27[0] = v7;
        io_object_t v11 = NSDictionary;
        id v12 = v27;
        v13 = &v26;
LABEL_12:
        v19 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:1];
        v20 = [v8 errorWithDomain:v9 code:v10 userInfo:v19];

        id v21 = v20;
        *a3 = v21;
      }
    }
    else if (a3)
    {
      uint64_t v17 = [NSString stringWithFormat:@"Failed to create FigCaptureDeviceRef!"];
      id v7 = (void *)v17;
      mach_error_t v8 = (void *)MEMORY[0x263F087E8];
      v18 = (uint64_t *)MEMORY[0x263F08350];
      if (v5 >> 26 != 56) {
        v18 = (uint64_t *)MEMORY[0x263F08410];
      }
      uint64_t v9 = *v18;
      uint64_t v10 = v5;
      uint64_t v24 = *MEMORY[0x263F08320];
      uint64_t v25 = v17;
      io_object_t v11 = NSDictionary;
      id v12 = &v25;
      v13 = &v24;
      goto LABEL_12;
    }

    uint64_t v16 = 0;
    goto LABEL_14;
  }
  if (!cf) {
    -[HSISPCapturePlugIn device:]();
  }
  uint64_t TypeID = FigCaptureDeviceGetTypeID();
  if (TypeID != CFGetTypeID(cf)) {
    -[HSISPCapturePlugIn device:]();
  }
  v15 = [HSFigCaptureDevice alloc];
  uint64_t v16 = [(HSFigCaptureDevice *)v15 initWithCaptureDevice:cf];
LABEL_14:

  return v16;
}

- (void)init
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  int v4 = mach_error_string(a1);
  _os_log_error_impl(&dword_2289F2000, a2, OS_LOG_TYPE_ERROR, "IORegistryEntryGetChildIterator failed %s.", (uint8_t *)&v3, 0xCu);
}

- (void)initWithFactoryFunctionSymbol:atPath:.cold.1()
{
  dlerror();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_2289F2000, v0, v1, "Failed to dlopen the plugin %@. (dlerror: %s)", v2, v3, v4, v5, v6);
}

- (void)initWithFactoryFunctionSymbol:atPath:.cold.2()
{
  dlerror();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_2289F2000, v0, v1, "Failed to find symbol %s in dylib. (dlerror: %s)", v2, v3, v4, v5, v6);
}

- (void)initWithFactoryFunctionSymbol:(uint64_t)a1 atPath:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2289F2000, a2, OS_LOG_TYPE_DEBUG, "No mediacapture plugin found at path %@. (May still exist in shared cache.)", (uint8_t *)&v2, 0xCu);
}

- (void)initWithFactoryFunctionSymbol:(uint64_t)a1 atPath:(NSObject *)a2 .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2289F2000, a2, OS_LOG_TYPE_DEBUG, "Will attempt to create plugin at path %@.", (uint8_t *)&v2, 0xCu);
}

- (void)device:.cold.1()
{
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Failed to provide a FigCaptureDeviceRef but returned noErr!"];
  abort();
}

- (void)device:.cold.2()
{
}

@end