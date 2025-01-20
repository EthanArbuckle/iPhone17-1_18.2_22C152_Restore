@interface _ANEVirtualClient
+ (BOOL)setCodeSigningIdentity:(__CFDictionary *)a3;
+ (__CFDictionary)getCFDictionaryFromIOSurface:(__IOSurface *)a3 dataLength:(unint64_t)a4;
+ (char)dictionaryGetInt8ForKey:(__CFDictionary *)a3 key:(__CFString *)a4;
+ (id)dictionaryGetNSStringForKey:(__CFDictionary *)a3 key:(__CFString *)a4;
+ (id)new;
+ (id)sharedConnection;
+ (int64_t)dictionaryGetInt64ForKey:(__CFDictionary *)a3 key:(__CFString *)a4;
+ (unint64_t)dictionaryGetUInt64ForKey:(__CFDictionary *)a3 key:(__CFString *)a4;
+ (unsigned)dictionaryGetUInt32ForKey:(__CFDictionary *)a3 key:(__CFString *)a4;
+ (void)copyDictionaryDataToStruct:(VirtANEModel *)a3 dictionary:(__CFDictionary *)a4;
+ (void)freeModelFileIOSurfaces:(__CFArray *)a3;
+ (void)printIOSurfaceDataInBytes:(__IOSurface *)a3;
+ (void)printStruct:(VirtANEModel *)a3;
- (BOOL)beginRealTimeTask;
- (BOOL)callIOUserClient:(unsigned int)a3 inParams:(VirtANEModel *)a4 outParams:(VirtANEModel *)a5;
- (BOOL)compileModel:(id)a3 options:(id)a4 qos:(unsigned int)a5 error:(id *)a6;
- (BOOL)compiledModelExistsFor:(id)a3;
- (BOOL)compiledModelExistsMatchingHash:(id)a3;
- (BOOL)copyAllModelFiles:(id)a3 dictionary:(__CFDictionary *)a4 ioSurfaceRefs:(__CFArray *)a5;
- (BOOL)copyFilesInDirectoryToIOSurfaces:(id)a3 ioSurfaceRefs:(__CFArray *)a4 ioSurfaceSizes:(id)a5 fileNames:(id)a6;
- (BOOL)doEvaluateWithModel:(id)a3 options:(id)a4 request:(id)a5 qos:(unsigned int)a6 completionEvent:(id)a7 error:(id *)a8;
- (BOOL)doMapIOSurfacesWithModel:(id)a3 request:(id)a4 cacheInference:(BOOL)a5 error:(id *)a6;
- (BOOL)echo:(id)a3;
- (BOOL)endRealTimeTask;
- (BOOL)evaluateWithModel:(id)a3 options:(id)a4 request:(id)a5 qos:(unsigned int)a6 error:(id *)a7;
- (BOOL)hasANE;
- (BOOL)isInternalBuild;
- (BOOL)loadModel:(id)a3 options:(id)a4 qos:(unsigned int)a5 error:(id *)a6;
- (BOOL)loadModelNewInstance:(id)a3 options:(id)a4 modelInstParams:(id)a5 qos:(unsigned int)a6 error:(id *)a7;
- (BOOL)mapIOSurfacesWithModel:(id)a3 request:(id)a4 cacheInference:(BOOL)a5 error:(id *)a6;
- (BOOL)unloadModel:(id)a3 options:(id)a4 qos:(unsigned int)a5 error:(id *)a6;
- (BOOL)updateError:(VMData *)a3 error:(id *)a4;
- (BuildVersionInfo)exchangeBuildVersionInfo;
- (DeviceExtendedInfo)getDeviceInfo;
- (OS_dispatch_queue)queue;
- (_ANEVirtualClient)init;
- (_ANEVirtualClient)initWithSingletonAccess;
- (__CFDictionary)callIOUserClientWithDictionary:(unsigned int)a3 inDictionary:(__CFDictionary *)a4 error:(id *)a5;
- (__CFDictionary)validateNetworkCreate:(unint64_t)a3 uuid:(id)a4 function:(id)a5 directoryPath:(id)a6 scratchPadPath:(id)a7;
- (__IOSurface)copyToIOSurface:(char *)a3 size:(unint64_t)a4 ioSID:(unsigned int *)a5;
- (__IOSurface)copyToIOSurface:(id)a3 length:(unint64_t)a4 ioSID:(unsigned int *)a5;
- (id)aneArchitectureTypeStr;
- (id)doJsonParsingMatchWeightName:(id)a3;
- (id)getModelAttribute:(VMData *)a3;
- (id)getObjectFromIOSurface:(__IOSurface *)a3 classType:(Class)a4 length:(unint64_t)a5;
- (id)hostBuildVersionStr;
- (id)parallelDecompressedData:(id)a3;
- (id)readWeightFilename:(id)a3;
- (id)updatePerformanceStats:(VMData *)a3;
- (int64_t)aneBoardtype;
- (unint64_t)getValidateNetworkVersion;
- (unint64_t)negotiatedCapabilityMask;
- (unint64_t)outputDictIOSurfaceSize;
- (unsigned)connect;
- (unsigned)negotiatedDataInterfaceVersion;
- (unsigned)numANECores;
- (unsigned)numANEs;
- (void)checkKernReturnValue:(int)a3 selector:(unsigned int)a4 outParams:(VirtANEModel *)a5;
- (void)copyErrorValue:(VMData *)a3;
- (void)copyErrorValue:(__CFDictionary *)a3 vmData:(VMData *)a4;
- (void)copyModel:(id)a3 options:(id)a4 vmData:(VMData *)a5;
- (void)copyModelMetaData:(id)a3 options:(id)a4 dictionary:(__CFDictionary *)a5 vmData:(VMData *)a6;
- (void)copyModelOptionFiles:(id)a3 options:(id)a4 dictionary:(__CFDictionary *)a5 vmData:(VMData *)a6;
- (void)copyModelOptionFiles:(id)a3 options:(id)a4 vmData:(VMData *)a5;
- (void)copyOptions:(id)a3 dictionary:(__CFDictionary *)a4 vmData:(VMData *)a5;
- (void)copyOptions:(id)a3 vmData:(VMData *)a4;
- (void)dealloc;
- (void)exchangeBuildVersionInfo;
- (void)getDeviceInfo;
- (void)initWithSingletonAccess;
- (void)purgeCompiledModel:(id)a3;
- (void)purgeCompiledModelMatchingHash:(id)a3;
- (void)releaseIOSurfaces:(VMData *)a3;
- (void)sendGuestBuildVersion;
@end

@implementation _ANEVirtualClient

+ (id)sharedConnection
{
  if (+[_ANEVirtualClient sharedConnection]::onceToken != -1) {
    dispatch_once(&+[_ANEVirtualClient sharedConnection]::onceToken, &__block_literal_global_4);
  }
  v2 = (void *)+[_ANEVirtualClient sharedConnection]::client;
  return v2;
}

- (void).cxx_destruct
{
}

- (_ANEVirtualClient)initWithSingletonAccess
{
  kern_return_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint32_t outputCnt;
  uint64_t output;
  uint8_t buf;
  unsigned char v29[11];
  io_iterator_t existing;
  objc_super v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)_ANEVirtualClient;
  v3 = [(_ANEVirtualClient *)&v31 init];
  if (!v3) {
    goto LABEL_32;
  }
  uint64_t v4 = +[_ANELog framework];
  v5 = (void *)gLogger;
  gLogger = v4;

  if (!+[_ANEDeviceInfo isVirtualMachine])
  {
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
      -[_ANEVirtualClient initWithSingletonAccess].cold.9();
    }
    goto LABEL_8;
  }
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.ane.avc", 0);
  queue = v3->_queue;
  v3->_queue = (OS_dispatch_queue *)v6;

  v3->_connect = 0;
  existing = 0;
  CFDictionaryRef v8 = IOServiceMatching("AppleVirtIONeuralEngineDevice");
  if (!IOServiceGetMatchingServices(*MEMORY[0x1E4F2EEF0], v8, &existing))
  {
    if (!existing)
    {
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
        -[_ANEVirtualClient initWithSingletonAccess]();
      }
      goto LABEL_8;
    }
    char v10 = 0;
    v11 = (task_port_t *)MEMORY[0x1E4F14960];
    while (1)
    {
      io_service_t v12 = IOIteratorNext(existing);
      if (!v12) {
        break;
      }
      v13 = gLogger;
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
        [(_ANEVirtualClient *)&buf initWithSingletonAccess];
      }
      if (IOServiceOpen(v12, *v11, 0, &v3->_connect))
      {
        if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
          -[_ANEVirtualClient initWithSingletonAccess].cold.6();
        }
        char v10 = 1;
        break;
      }
      char v10 = 1;
      IOObjectRelease(v12);
    }
    IOObjectRelease(existing);
    BOOL v14 = os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG);
    if ((v10 & 1) == 0)
    {
      if (v14) {
        -[_ANEVirtualClient initWithSingletonAccess].cold.5();
      }
      goto LABEL_8;
    }
    if (v14) {
      -[_ANEVirtualClient initWithSingletonAccess].cold.4();
    }
    output = 0;
    outputCnt = 1;
    v15 = IOConnectCallScalarMethod(v3->_connect, 0, 0, 0, &output, &outputCnt);
    v16 = gLogger;
    if (v15)
    {
      v17 = (id)gLogger;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient initWithSingletonAccess]();
      }

      goto LABEL_8;
    }
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
      [(_ANEVirtualClient *)v16 initWithSingletonAccess];
    }
LABEL_32:
    [(_ANEVirtualClient *)v3 exchangeBuildVersionInfo];
    v9 = v3;
    goto LABEL_33;
  }
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
    -[_ANEVirtualClient initWithSingletonAccess].cold.8();
  }
LABEL_8:
  v9 = 0;
LABEL_33:

  return v9;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)_ANEVirtualClient;
  [(_ANEVirtualClient *)&v2 dealloc];
}

- (void)initWithSingletonAccess
{
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_4(&dword_1DB8AB000, v0, v1, "ANEVirtualClient IOServiceGetMatchingServices returned 0x%08x\n\n", v2, v3, v4, v5, v6);
}

+ (id)new
{
  return 0;
}

- (_ANEVirtualClient)init
{
  return 0;
}

- (BOOL)compileModel:(id)a3 options:(id)a4 qos:(unsigned int)a5 error:(id *)a6
{
  v53[9] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v41 = a4;
  v11 = (id)gLogger;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualClient compileModel:options:qos:error:].cold.6();
  }

  bzero(v43, 0x1728uLL);
  if (([(_ANEVirtualClient *)self negotiatedCapabilityMask] & 4) == 0)
  {
    [(_ANEVirtualClient *)self copyModel:v10 options:v41 vmData:v43];
    [(_ANEVirtualClient *)self copyOptions:v41 vmData:v43];
    [(_ANEVirtualClient *)self copyModelOptionFiles:v10 options:v41 vmData:v43];
    [(_ANEVirtualClient *)self copyErrorValue:v43];
    v46[0] = a5;
    [(_ANEVirtualClient *)self callIOUserClient:1 inParams:&v45 outParams:&v47];
    io_service_t v12 = 0;
LABEL_11:
    if (v48)
    {
      v18 = +[_ANEVirtualClient dictionaryGetNSStringForKey:v12 key:@"modelCacheURLIdentifier"];
      if (v18) {
        [v10 setCacheURLIdentifier:v18];
      }
      v19 = [(_ANEVirtualClient *)self getModelAttribute:v43];
      [v10 updateModelAttributes:v19 state:2];
      v20 = (id)gLogger;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient compileModel:options:qos:error:]();
      }
    }
    if (a6 && v50)
    {
      IOSurfaceLock(buffer, 0, 0);
      BaseAddress = IOSurfaceGetBaseAddress(buffer);
      id v22 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v39 = (void *)[v22 initWithBytes:BaseAddress length:v50];
      v23 = (void *)MEMORY[0x1E4F1CAD0];
      v53[0] = objc_opt_class();
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
      uint64_t v37 = [v23 setWithArray:v24];

      id v42 = 0;
      v25 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v39 error:&v42];
      id v26 = v42;
      if (v26)
      {
        v27 = (id)gLogger;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[_ANEVirtualClient compileModel:options:qos:error:]();
        }
      }
      v28 = objc_msgSend(v25, "decodeObjectOfClasses:forKey:", v37, *MEMORY[0x1E4F284E8], v37);
      IOSurfaceUnlock(buffer, 0, 0);
      v29 = (void *)MEMORY[0x1E4F28C58];
      v30 = +[_ANEStrings errorDomainVirtIO];
      uint64_t v31 = v49;
      uint64_t v51 = *MEMORY[0x1E4F28568];
      v52 = v28;
      v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
      v33 = [v29 errorWithDomain:v30 code:v31 userInfo:v32];

      id v34 = v33;
      *a6 = v34;
    }
    [(_ANEVirtualClient *)self updateError:v43 error:a6];
    [(_ANEVirtualClient *)self releaseIOSurfaces:v43];
    if (v12) {
      CFRelease(v12);
    }
    BOOL v35 = v48 != 0;
    goto LABEL_27;
  }
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
    -[_ANEVirtualClient compileModel:options:qos:error:].cold.5();
  }
  uint64_t v48 = 0;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFMutableArrayRef v15 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  [(_ANEVirtualClient *)self copyAllModelFiles:v10 dictionary:Mutable ioSurfaceRefs:v15];
  [(_ANEVirtualClient *)self copyModelMetaData:v10 options:v41 dictionary:Mutable vmData:v43];
  [(_ANEVirtualClient *)self copyOptions:v41 dictionary:Mutable vmData:v43];
  [(_ANEVirtualClient *)self copyModelOptionFiles:v10 options:v41 dictionary:Mutable vmData:v43];
  [(_ANEVirtualClient *)self copyErrorValue:Mutable vmData:v43];
  v46[0] = a5;
  CFNumberRef v16 = CFNumberCreate(v14, kCFNumberSInt32Type, v46);
  CFDictionarySetValue(Mutable, @"qos", v16);
  CFRelease(v16);
  +[_ANEVirtualClient setCodeSigningIdentity:Mutable];
  [(_ANEVirtualClient *)self printDictionary:Mutable];
  io_service_t v12 = [(_ANEVirtualClient *)self callIOUserClientWithDictionary:1 inDictionary:Mutable error:a6];
  CFRelease(Mutable);
  [(_ANEVirtualClient *)self printDictionary:v12];
  +[_ANEVirtualClient freeModelFileIOSurfaces:v15];
  CFRelease(v15);
  if (v12)
  {
    v17 = (id)gLogger;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient compileModel:options:qos:error:].cold.4();
    }

    +[_ANEVirtualClient copyDictionaryDataToStruct:&v47 dictionary:v12];
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
    -[_ANEVirtualClient compileModel:options:qos:error:]();
  }
  [(_ANEVirtualClient *)self releaseIOSurfaces:v43];
  BOOL v35 = 0;
LABEL_27:

  return v35;
}

+ (void)printStruct:(VirtANEModel *)a3
{
  if (a3)
  {
    uint64_t v4 = gLogger;
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
      +[_ANEVirtualClient printStruct:]((uint64_t)a3, v4);
    }
  }
}

- (BOOL)loadModel:(id)a3 options:(id)a4 qos:(unsigned int)a5 error:(id *)a6
{
  uint64_t v6 = ((uint64_t (*)(_ANEVirtualClient *, SEL, id, id, void, id *))MEMORY[0x1F4188790])(self, a2, a3, a4, *(void *)&a5, a6);
  aSelector = v7;
  uint64_t v46 = v8;
  int v10 = v9;
  io_service_t v12 = v11;
  v13 = (void *)v6;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v15 = v14;
  id v16 = v12;
  v17 = (id)gLogger;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v43 = NSStringFromSelector(aSelector);
    *(_DWORD *)buf = 138412802;
    uint64_t v48 = v43;
    __int16 v49 = 2112;
    id v50 = v15;
    __int16 v51 = 2112;
    id v52 = v16;
    _os_log_debug_impl(&dword_1DB8AB000, v17, OS_LOG_TYPE_DEBUG, "%@:ANEVirtualClient start Model=%@ options=%@\n", buf, 0x20u);
  }
  bzero(buf, 0x1728uLL);
  if (([v13 negotiatedCapabilityMask] & 4) != 0)
  {
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
      -[_ANEVirtualClient loadModel:options:qos:error:].cold.9();
    }
    uint64_t v56 = 0;
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFAllocatorRef v21 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFMutableArrayRef v22 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
    v23 = [v15 modelURL];
    BOOL v24 = v23 == 0;

    if (v24 || ([v13 copyAllModelFiles:v15 dictionary:Mutable ioSurfaceRefs:v22] & 1) != 0)
    {
      v25 = objc_msgSend(v15, "getCacheURLIdentifier", aSelector);
      BOOL v26 = v25 == 0;

      if (!v26)
      {
        v27 = [v15 cacheURLIdentifier];

        v28 = (id)gLogger;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(aSelectora);
          objc_claimAutoreleasedReturnValue();
          -[_ANEVirtualClient loadModel:options:qos:error:].cold.8();
        }

        CFDictionarySetValue(Mutable, @"modelCacheURLIdentifier", v27);
      }
      [v13 copyModelMetaData:v15 options:v16 dictionary:Mutable vmData:buf];
      [v13 copyOptions:v16 dictionary:Mutable vmData:buf];
      [v13 copyModelOptionFiles:v15 options:v16 dictionary:Mutable vmData:buf];
      [v13 copyErrorValue:Mutable vmData:buf];
      v54[0] = v10;
      CFNumberRef v29 = CFNumberCreate(v21, kCFNumberSInt32Type, v54);
      CFDictionarySetValue(Mutable, @"qos", v29);
      CFRelease(v29);
      v30 = [v15 getCacheURLIdentifier];
      LODWORD(v29) = v30 == 0;

      if (v29) {
        operator new();
      }
      +[_ANEVirtualClient setCodeSigningIdentity:Mutable];
      [v13 printDictionary:Mutable];
      v19 = (const void *)[v13 callIOUserClientWithDictionary:2 inDictionary:Mutable error:v46];
      CFRelease(Mutable);
      [v13 printDictionary:v19];
      uint64_t v31 = [v15 modelURL];
      BOOL v32 = v31 == 0;

      if (!v32)
      {
        +[_ANEVirtualClient freeModelFileIOSurfaces:v22];
        CFRelease(v22);
      }
      if (v19)
      {
        v33 = (id)gLogger;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(aSelectora);
          objc_claimAutoreleasedReturnValue();
          -[_ANEVirtualClient loadModel:options:qos:error:].cold.6();
        }

        +[_ANEVirtualClient copyDictionaryDataToStruct:&v55 dictionary:v19];
        goto LABEL_25;
      }
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
        -[_ANEVirtualClient loadModel:options:qos:error:].cold.5();
      }
      [v13 releaseIOSurfaces:buf];
    }
    else
    {
      CFRelease(Mutable);
      CFRelease(v22);
    }
    BOOL v40 = 0;
    goto LABEL_42;
  }
  [v13 copyModel:v15 options:v16 vmData:buf];
  [v13 copyOptions:v16 vmData:buf];
  [v13 copyModelOptionFiles:v15 options:v16 vmData:buf];
  [v13 copyErrorValue:buf];
  v54[0] = v10;
  v18 = gLogger;
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
    -[_ANEVirtualClient loadModel:options:qos:error:].cold.4((uint64_t)buf, v54, v18);
  }
  objc_msgSend(v13, "callIOUserClient:inParams:outParams:", 2, &v53, &v55, aSelector);
  v19 = 0;
LABEL_25:
  id v34 = [v13 getModelAttribute:buf];
  if (v56)
  {
    BOOL v35 = +[_ANEVirtualClient dictionaryGetNSStringForKey:v19 key:@"modelCacheURLIdentifier"];
    if (v35) {
      [v15 setCacheURLIdentifier:v35];
    }
    [v15 updateModelAttributes:v34 state:v60 programHandle:v57 intermediateBufferHandle:v58 queueDepth:v59];
    v36 = +[_ANEProgramForEvaluation programWithHandle:v57 intermediateBufferHandle:v58 queueDepth:v59];
    [v15 setProgram:v36];

    uint64_t v37 = +[_ANEDeviceController controllerWithProgramHandle:v57];
    id v38 = +[_ANEProgramIOSurfacesMapper mapperWithController:v37];
    [v15 setMapper:v38];

    id v41 = (id)gLogger;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(aSelectora);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient loadModel:options:qos:error:]();
    }
  }
  else
  {
    v39 = (id)gLogger;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(aSelectora);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient loadModel:options:qos:error:]();
    }

    [v15 updateModelAttributes:v34 state:5];
  }
  [v13 updateError:buf error:v46];
  [v13 releaseIOSurfaces:buf];
  if (v19) {
    CFRelease(v19);
  }
  BOOL v40 = v56 != 0;

LABEL_42:
  return v40;
}

- (BOOL)loadModelNewInstance:(id)a3 options:(id)a4 modelInstParams:(id)a5 qos:(unsigned int)a6 error:(id *)a7
{
  uint64_t v7 = ((uint64_t (*)(_ANEVirtualClient *, SEL, id, id, id, void, id *))MEMORY[0x1F4188790])(self, a2, a3, a4, a5, *(void *)&a6, a7);
  uint64_t v38 = v9;
  aSelector = v8;
  int v11 = v10;
  v13 = v12;
  id v15 = v14;
  id v16 = (void *)v7;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v43 = v17;
  id v41 = v15;
  id v42 = v13;
  LODWORD(v15) = [v16 negotiatedDataInterfaceVersion];
  v18 = (id)gLogger;
  v19 = v18;
  if (v15 >> 10 <= 0x80)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(aSelector);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient loadModelNewInstance:options:modelInstParams:qos:error:]();
    }

LABEL_5:
    BOOL v20 = 0;
    goto LABEL_26;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v36 = NSStringFromSelector(aSelector);
    *(_DWORD *)v44 = 138412802;
    uint64_t v45 = v36;
    __int16 v46 = 2112;
    id v47 = v43;
    __int16 v48 = 2112;
    id v49 = v41;
    _os_log_debug_impl(&dword_1DB8AB000, v19, OS_LOG_TYPE_DEBUG, "%@:ANEVirtualClient loadModelNewInstance Model=%@ options=%@\n", v44, 0x20u);
  }
  bzero(v44, 0x1728uLL);
  if (([v16 negotiatedCapabilityMask] & 4) != 0)
  {
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
      -[_ANEVirtualClient loadModelNewInstance:options:modelInstParams:qos:error:].cold.7();
    }
    uint64_t v51 = 0;
    theDict = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFAllocatorRef v26 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFMutableArrayRef cf = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
    v27 = [v43 modelURL];
    BOOL v28 = v27 == 0;

    if (v28 || ([v16 copyAllModelFiles:v43 dictionary:theDict ioSurfaceRefs:cf] & 1) != 0)
    {
      CFNumberRef v29 = [v43 getCacheURLIdentifier];
      BOOL v30 = v29 == 0;

      if (!v30)
      {
        uint64_t v31 = [v43 cacheURLIdentifier];

        BOOL v32 = (id)gLogger;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(aSelector);
          objc_claimAutoreleasedReturnValue();
          -[_ANEVirtualClient loadModel:options:qos:error:].cold.8();
        }

        CFDictionarySetValue(theDict, @"modelCacheURLIdentifier", v31);
      }
      [v16 copyModelMetaData:v43 options:v41 dictionary:theDict vmData:v44];
      [v16 copyOptions:v41 dictionary:theDict vmData:v44];
      [v16 copyModelOptionFiles:v43 options:v41 dictionary:theDict vmData:v44];
      [v16 copyErrorValue:theDict vmData:v44];
      v50[0] = v11;
      CFNumberRef v33 = CFNumberCreate(v26, kCFNumberSInt32Type, v50);
      CFDictionarySetValue(theDict, @"qos", v33);
      CFRelease(v33);
      operator new();
    }
    CFRelease(theDict);
    CFRelease(cf);
    goto LABEL_5;
  }
  CFAllocatorRef v21 = [v16 getModelAttribute:v44];
  if (v51)
  {
    [v43 updateModelAttributes:v21 state:v55 programHandle:v52 intermediateBufferHandle:v53 queueDepth:v54];
    CFMutableArrayRef v22 = +[_ANEProgramForEvaluation programWithHandle:v52 intermediateBufferHandle:v53 queueDepth:v54];
    [v43 setProgram:v22];

    v23 = +[_ANEDeviceController controllerWithProgramHandle:v52];
    BOOL v24 = +[_ANEProgramIOSurfacesMapper mapperWithController:v23];
    [v43 setMapper:v24];

    v25 = (id)gLogger;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(aSelector);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient loadModel:options:qos:error:]();
    }
  }
  else
  {
    id v34 = (id)gLogger;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(aSelector);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient loadModel:options:qos:error:]();
    }

    [v43 updateModelAttributes:v21 state:5];
  }
  [v16 updateError:v44 error:v38];
  [v16 releaseIOSurfaces:v44];
  BOOL v20 = v51 != 0;

LABEL_26:
  return v20;
}

- (BOOL)unloadModel:(id)a3 options:(id)a4 qos:(unsigned int)a5 error:(id *)a6
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v57 = a4;
  int v10 = (id)gLogger;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v53 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    v85 = v53;
    __int16 v86 = 2112;
    id v87 = v9;
    __int16 v88 = 2112;
    id v89 = v57;
    LOWORD(v90) = 1024;
    *(_DWORD *)((char *)&v90 + 2) = a5;
    _os_log_debug_impl(&dword_1DB8AB000, v10, OS_LOG_TYPE_DEBUG, "%@: Model=%@ options=%@ qos=%d\n", buf, 0x26u);
  }
  bzero(buf, 0x1728uLL);
  if (([(_ANEVirtualClient *)self negotiatedCapabilityMask] & 4) == 0)
  {
    [(_ANEVirtualClient *)self copyErrorValue:buf];
    int v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v57 requiringSecureCoding:1 error:0];
    io_service_t v12 = (void *)MEMORY[0x1E4F28DB0];
    v13 = [v9 key];
    uint64_t v14 = [v13 length];
    if (v14)
    {
      id v15 = [v9 key];
      id v16 = v15;
    }
    else
    {
      id v16 = [v9 modelURL];
      id v15 = [v16 path];
    }
    BOOL v30 = [v12 archivedDataWithRootObject:v15 requiringSecureCoding:1 error:0];
    if (!v14) {

    }
    v90 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v11, [v11 length], v104);
    v91 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v30, [v30 length], v95);
    uint64_t v93 = 0;
    int v94 = 0;
    uint64_t v97 = objc_msgSend(v9, "string_id");
    uint64_t v98 = [v9 programHandle];
    uint64_t v99 = [v9 intermediateBufferHandle];
    v100[0] = [v9 queueDepth];
    int v101 = 0;
    int v102 = [v9 perfStatsMask];
    unsigned int v103 = a5;
    uint64_t v31 = gLogger;
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uint64_t v58 = 67112192;
      int v59 = v93;
      __int16 v60 = 1024;
      int v61 = HIDWORD(v93);
      __int16 v62 = 1024;
      int v63 = v94;
      __int16 v64 = 1024;
      int v65 = v95[0];
      __int16 v66 = 2048;
      uint64_t v67 = v97;
      __int16 v68 = 2048;
      uint64_t v69 = v98;
      __int16 v70 = 2048;
      uint64_t v71 = v99;
      __int16 v72 = 1024;
      int v73 = v100[0];
      __int16 v74 = 1024;
      int v75 = v101;
      __int16 v76 = 1024;
      int v77 = v102;
      __int16 v78 = 1024;
      unsigned int v79 = v103;
      __int16 v80 = 1024;
      int v81 = v104[0];
      __int16 v82 = 1024;
      int v83 = v104[413];
      _os_log_debug_impl(&dword_1DB8AB000, v31, OS_LOG_TYPE_DEBUG, "ANEVirtualClient virtualANEModel.ioSIDModelNet=%u virtualANEModel.ioSIDModelShape=%u virtualANEModel.ioSIDModelWeight=%u virtualANEModel.ioSIDKey=%u virtualANEModel.string_id=%lld virtualANEModel.programHandle=%lld virtualANEModel.intermediateBufferHandle=%lld virtualANEModel.queueDepth=%d virtualANEModel.ioSIDModelAttributes=%u virtualANEModel.perfStatsMask=%u virtualANEModel.qos=%u virtualANEModel.ioSIDOptions=%u virtualANEModel.ioSIDErrorValue=%u", v58, 0x5Cu);
    }
    BOOL v32 = [(_ANEVirtualClient *)self callIOUserClient:3 inParams:&v92 outParams:&v105];
    CFNumberRef v33 = gLogger;
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
      -[_ANEVirtualClient unloadModel:options:qos:error:](v32, v33, v34, v35, v36, v37, v38, v39);
    }

LABEL_35:
    [(_ANEVirtualClient *)self updateError:buf error:a6];
    [(_ANEVirtualClient *)self releaseIOSurfaces:buf];
    goto LABEL_36;
  }
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
    -[_ANEVirtualClient unloadModel:options:qos:error:].cold.6();
  }
  uint64_t v106 = 0;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFAllocatorRef v18 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFMutableArrayRef cf = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  [(_ANEVirtualClient *)self copyModelMetaData:v9 options:MEMORY[0x1E4F1CC08] dictionary:Mutable vmData:buf];
  v19 = [v9 modelURL];
  BOOL v20 = v19 == 0;

  if (!v20) {
    [(_ANEVirtualClient *)self copyAllModelFiles:v9 dictionary:Mutable ioSurfaceRefs:cf];
  }
  CFAllocatorRef v21 = [v9 getCacheURLIdentifier];
  BOOL v22 = v21 == 0;

  if (!v22)
  {
    v23 = [v9 cacheURLIdentifier];

    BOOL v24 = (id)gLogger;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient loadModel:options:qos:error:].cold.8();
    }

    CFDictionarySetValue(Mutable, @"modelCacheURLIdentifier", v23);
  }
  [(_ANEVirtualClient *)self copyErrorValue:Mutable vmData:buf];
  [(_ANEVirtualClient *)self copyOptions:v57 dictionary:Mutable vmData:buf];
  v25 = (void *)MEMORY[0x1E4F28DB0];
  CFAllocatorRef v26 = [v9 key];
  uint64_t v27 = [v26 length];
  if (v27)
  {
    BOOL v28 = [v9 key];
    CFNumberRef v29 = v28;
  }
  else
  {
    CFNumberRef v29 = [v9 modelURL];
    BOOL v28 = [v29 path];
  }
  int v11 = [v25 archivedDataWithRootObject:v28 requiringSecureCoding:1 error:0];
  if (!v27) {

  }
  v91 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v11, [v11 length], v95);
  CFNumberRef v40 = CFNumberCreate(v18, kCFNumberSInt32Type, v95);
  CFDictionarySetValue(Mutable, @"ioSIDKey", v40);
  CFRelease(v40);
  v96[0] = [v11 length];
  CFNumberRef v41 = CFNumberCreate(v18, kCFNumberSInt64Type, v96);
  CFDictionarySetValue(Mutable, @"keyLength", v41);
  CFRelease(v41);
  uint64_t v97 = objc_msgSend(v9, "string_id");
  CFNumberRef v42 = CFNumberCreate(v18, kCFNumberSInt64Type, &v97);
  CFDictionarySetValue(Mutable, @"string_id", v42);
  CFRelease(v42);
  uint64_t v98 = [v9 programHandle];
  CFNumberRef v43 = CFNumberCreate(v18, kCFNumberSInt64Type, &v98);
  CFDictionarySetValue(Mutable, @"programHandle", v43);
  CFRelease(v43);
  uint64_t v99 = [v9 intermediateBufferHandle];
  CFNumberRef v44 = CFNumberCreate(v18, kCFNumberSInt64Type, &v99);
  CFDictionarySetValue(Mutable, @"intermediateBufferHandle", v44);
  CFRelease(v44);
  v100[0] = [v9 queueDepth];
  CFNumberRef v45 = CFNumberCreate(v18, kCFNumberSInt8Type, v100);
  CFDictionarySetValue(Mutable, @"queueDepth", v45);
  CFRelease(v45);
  int v102 = [v9 perfStatsMask];
  CFNumberRef v46 = CFNumberCreate(v18, kCFNumberSInt32Type, &v102);
  CFDictionarySetValue(Mutable, @"perfStatsMask", v46);
  CFRelease(v46);
  unsigned int v103 = a5;
  CFNumberRef v47 = CFNumberCreate(v18, kCFNumberSInt32Type, &v103);
  CFDictionarySetValue(Mutable, @"qos", v47);
  CFRelease(v47);
  [(_ANEVirtualClient *)self printDictionary:Mutable];
  __int16 v48 = [(_ANEVirtualClient *)self callIOUserClientWithDictionary:3 inDictionary:Mutable error:a6];
  CFRelease(Mutable);
  [(_ANEVirtualClient *)self printDictionary:v48];
  id v49 = [v9 modelURL];
  LOBYTE(v47) = v49 == 0;

  if ((v47 & 1) == 0)
  {
    +[_ANEVirtualClient freeModelFileIOSurfaces:cf];
    CFRelease(cf);
  }
  if (v48)
  {
    id v50 = (id)gLogger;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient unloadModel:options:qos:error:].cold.4();
    }

    +[_ANEVirtualClient copyDictionaryDataToStruct:&v105 dictionary:v48];
    LOBYTE(v32) = v106 == 1;
    uint64_t v51 = (id)gLogger;
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient unloadModel:options:qos:error:]();
    }

    CFRelease(v48);
    goto LABEL_35;
  }
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
    -[_ANEVirtualClient unloadModel:options:qos:error:]();
  }
  [(_ANEVirtualClient *)self releaseIOSurfaces:buf];

  LOBYTE(v32) = 0;
LABEL_36:

  return v32;
}

- (BOOL)evaluateWithModel:(id)a3 options:(id)a4 request:(id)a5 qos:(unsigned int)a6 error:(id *)a7
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = v15;
  uint64_t v58 = 0;
  int v59 = &v58;
  uint64_t v60 = 0x2020000000;
  char v61 = 0;
  if (!v13) {
    goto LABEL_15;
  }
  id v17 = [v15 completionHandler];
  BOOL v18 = v17 == 0;

  if (!v18)
  {
    dispatch_queue_t v36 = dispatch_queue_create("com.apple.ane.vmclient-async", 0);
    if (v36)
    {
      uint64_t v37 = (void *)[objc_alloc(MEMORY[0x1E4F2EF98]) initWithDispatchQueue:v36];
      if (!v37 && os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
        -[_ANEVirtualClient evaluateWithModel:options:request:qos:error:]();
      }
      v19 = objc_opt_new();
      uint64_t v34 = +[_ANESharedSignalEvent signalEventWithValue:symbolIndex:eventType:sharedEvent:](_ANESharedSignalEvent, "signalEventWithValue:symbolIndex:eventType:sharedEvent:", 4097, 0, 0, v19, v19);
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __65___ANEVirtualClient_evaluateWithModel_options_request_qos_error___block_invoke;
      v55[3] = &unk_1E6C1C3E8;
      id v56 = v19;
      id v20 = v16;
      id v57 = v20;
      id v33 = v56;
      [v56 notifyListener:v37 atValue:4097 block:v55];
      CFAllocatorRef v21 = objc_opt_new();
      uint64_t v35 = +[_ANESharedSignalEvent signalEventWithValue:1 symbolIndex:0 eventType:0 sharedEvent:v21];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __65___ANEVirtualClient_evaluateWithModel_options_request_qos_error___block_invoke_61;
      v52[3] = &unk_1E6C1C3E8;
      id v22 = v21;
      id v53 = v22;
      id v23 = v20;
      id v54 = v23;
      [v22 notifyListener:v37 atValue:1 block:v52];
      BOOL v24 = gLogger;
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        __int16 v64 = v34;
        __int16 v65 = 2048;
        __int16 v66 = v35;
        __int16 v67 = 2112;
        id v68 = v13;
        _os_log_debug_impl(&dword_1DB8AB000, v24, OS_LOG_TYPE_DEBUG, "[_ANEVirtualClient] completionEvent success event %p error event %p for model %@\n", buf, 0x20u);
      }
      v62[0] = v34;
      v62[1] = v35;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
      CFAllocatorRef v26 = +[_ANESharedEvents sharedEventsWithSignalEvents:v25 waitEvents:MEMORY[0x1E4F1CBF0]];

      uint64_t v27 = [(_ANEVirtualClient *)self queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __65___ANEVirtualClient_evaluateWithModel_options_request_qos_error___block_invoke_70;
      block[3] = &unk_1E6C1C410;
      id v50 = &v58;
      block[4] = self;
      id v46 = v13;
      id v47 = v14;
      unsigned int v51 = a6;
      id v48 = v23;
      id v49 = v26;
      id v28 = v26;
      dispatch_sync(v27, block);

      *((unsigned char *)v59 + 24) = 1;
      goto LABEL_11;
    }
    uint64_t v31 = (id)gLogger;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient evaluateWithModel:options:request:qos:error:]();
    }

LABEL_15:
    BOOL v30 = 0;
    goto LABEL_16;
  }
  CFNumberRef v29 = [(_ANEVirtualClient *)self queue];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __65___ANEVirtualClient_evaluateWithModel_options_request_qos_error___block_invoke_2;
  v38[3] = &unk_1E6C1C438;
  CFNumberRef v42 = &v58;
  v38[4] = self;
  id v39 = v13;
  id v40 = v14;
  unsigned int v44 = a6;
  id v41 = v16;
  CFNumberRef v43 = a7;
  dispatch_sync(v29, v38);

LABEL_11:
  BOOL v30 = *((unsigned char *)v59 + 24) != 0;
LABEL_16:
  _Block_object_dispose(&v58, 8);

  return v30;
}

- (BOOL)doEvaluateWithModel:(id)a3 options:(id)a4 request:(id)a5 qos:(unsigned int)a6 completionEvent:(id)a7 error:(id *)a8
{
  uint64_t v427 = *MEMORY[0x1E4F143B8];
  id v293 = a3;
  id v292 = a4;
  id v297 = a5;
  id v298 = a7;
  io_service_t v12 = (id)gLogger;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:]1();
  }

  id v13 = (id)gLogger;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:]0();
  }

  id v14 = (id)gLogger;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:]9();
  }

  id v15 = (id)gLogger;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:]8();
  }

  bzero(v358, 0x1728uLL);
  if (([(_ANEVirtualClient *)self negotiatedCapabilityMask] & 4) == 0)
  {
    [(_ANEVirtualClient *)self copyModel:v293 options:v292 vmData:v358];
    [(_ANEVirtualClient *)self copyErrorValue:v358];
    v303 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v292 requiringSecureCoding:1 error:0];
    v359 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v303, [v303 length], v369);
    uint64_t v362 = objc_msgSend(v293, "string_id");
    uint64_t v363 = [v293 programHandle];
    uint64_t v364 = [v293 intermediateBufferHandle];
    char v365 = [v293 queueDepth];
    int v367 = [v293 perfStatsMask];
    unsigned int v368 = a6;
    id v16 = gLogger;
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v398 = 67112192;
      *(_DWORD *)&v398[4] = v361[4];
      *(_WORD *)&v398[8] = 1024;
      *(_DWORD *)&v398[10] = v361[5];
      *(_WORD *)&v398[14] = 1024;
      *(_DWORD *)&v398[16] = v361[6];
      *(_WORD *)&v398[20] = 1024;
      *(_DWORD *)v399 = v361[7];
      *(_WORD *)&v399[4] = 2048;
      *(void *)&v399[6] = v362;
      *(_WORD *)&v399[14] = 2048;
      *(void *)&v399[16] = v363;
      __int16 v400 = 2048;
      uint64_t v401 = v364;
      __int16 v402 = 1024;
      int v403 = v365;
      __int16 v404 = 1024;
      int v405 = v366;
      __int16 v406 = 1024;
      int v407 = v367;
      __int16 v408 = 1024;
      unsigned int v409 = v368;
      __int16 v410 = 1024;
      int v411 = v369[0];
      __int16 v412 = 1024;
      int v413 = v378;
      _os_log_debug_impl(&dword_1DB8AB000, v16, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate: virtualANEModel.ioSIDModelNet=%u virtualANEModel.ioSIDModelShape=%u virtualANEModel.ioSIDModelWeight=%u virtualANEModel.ioSIDKey=%u virtualANEModel.string_id=%lld virtualANEModel.programHandle=%lld virtualANEModel.intermediateBufferHandle=%lld virtualANEModel.queueDepth=%d virtualANEModel.ioSIDModelAttributes=%u virtualANEModel.perfStatsMask=%u virtualANEModel.qos=%u virtualANEModel.ioSIDOptions=%u virtualANEModel.ioSIDErrorValue=%u", v398, 0x5Cu);
    }
    long long v327 = 0u;
    long long v328 = 0u;
    long long v325 = 0u;
    long long v326 = 0u;
    id v17 = [v297 inputArray];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v325 objects:v388 count:16];
    if (v18)
    {
      int v19 = 0;
      uint64_t v20 = *(void *)v326;
      do
      {
        uint64_t v21 = 0;
        int v22 = v19;
        do
        {
          if (*(void *)v326 != v20) {
            objc_enumerationMutation(v17);
          }
          IOSurfaceID ID = IOSurfaceGetID((IOSurfaceRef)[*(id *)(*((void *)&v325 + 1) + 8 * v21) ioSurface]);
          v369[(v22 + v21) + 12] = ID;
          BOOL v24 = gLogger;
          if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v398 = 67109120;
            *(_DWORD *)&v398[4] = ID;
            _os_log_debug_impl(&dword_1DB8AB000, v24, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request1 ioSID: %u", v398, 8u);
          }
          ++v21;
        }
        while (v18 != v21);
        uint64_t v18 = [v17 countByEnumeratingWithState:&v325 objects:v388 count:16];
        int v19 = v22 + v21;
      }
      while (v18);
      LODWORD(v18) = v22 + v21;
    }

    int v374 = v18;
    long long v321 = 0u;
    long long v322 = 0u;
    long long v323 = 0u;
    long long v324 = 0u;
    v25 = [v297 inputIndexArray];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v321 objects:v387 count:16];
    if (v26)
    {
      int v27 = 0;
      uint64_t v28 = *(void *)v322;
      do
      {
        uint64_t v29 = 0;
        int v30 = v27;
        do
        {
          if (*(void *)v322 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v31 = *(void **)(*((void *)&v321 + 1) + 8 * v29);
          v369[(v30 + v29) + 76] = [v31 unsignedIntValue];
          BOOL v32 = (id)gLogger;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v33 = [v31 unsignedLongLongValue];
            *(_DWORD *)v398 = 134217984;
            *(void *)&v398[4] = v33;
            _os_log_debug_impl(&dword_1DB8AB000, v32, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request2 ioSID: %llu", v398, 0xCu);
          }

          ++v29;
        }
        while (v26 != v29);
        uint64_t v26 = [v25 countByEnumeratingWithState:&v321 objects:v387 count:16];
        int v27 = v30 + v29;
      }
      while (v26);
      LODWORD(v26) = v30 + v29;
    }

    int v375 = v26;
    long long v317 = 0u;
    long long v318 = 0u;
    long long v319 = 0u;
    long long v320 = 0u;
    uint64_t v34 = [v297 outputArray];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v317 objects:v386 count:16];
    if (v35)
    {
      int v36 = 0;
      uint64_t v37 = *(void *)v318;
      do
      {
        uint64_t v38 = 0;
        int v39 = v36;
        do
        {
          if (*(void *)v318 != v37) {
            objc_enumerationMutation(v34);
          }
          IOSurfaceID v40 = IOSurfaceGetID((IOSurfaceRef)[*(id *)(*((void *)&v317 + 1) + 8 * v38) ioSurface]);
          v369[(v39 + v38) + 140] = v40;
          id v41 = gLogger;
          if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v398 = 67109120;
            *(_DWORD *)&v398[4] = v40;
            _os_log_debug_impl(&dword_1DB8AB000, v41, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request3 ioSID: %u", v398, 8u);
          }
          ++v38;
        }
        while (v35 != v38);
        uint64_t v35 = [v34 countByEnumeratingWithState:&v317 objects:v386 count:16];
        int v36 = v39 + v38;
      }
      while (v35);
      LODWORD(v35) = v39 + v38;
    }

    int v376 = v35;
    long long v313 = 0u;
    long long v314 = 0u;
    long long v315 = 0u;
    long long v316 = 0u;
    CFNumberRef v42 = [v297 outputIndexArray];
    uint64_t v43 = [v42 countByEnumeratingWithState:&v313 objects:v385 count:16];
    if (v43)
    {
      int v44 = 0;
      uint64_t v45 = *(void *)v314;
      do
      {
        uint64_t v46 = 0;
        int v47 = v44;
        do
        {
          if (*(void *)v314 != v45) {
            objc_enumerationMutation(v42);
          }
          id v48 = *(void **)(*((void *)&v313 + 1) + 8 * v46);
          v369[(v47 + v46) + 204] = [v48 unsignedIntValue];
          id v49 = (id)gLogger;
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v50 = [v48 unsignedLongLongValue];
            *(_DWORD *)v398 = 134217984;
            *(void *)&v398[4] = v50;
            _os_log_debug_impl(&dword_1DB8AB000, v49, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request4 ioSID: %llu", v398, 0xCu);
          }

          ++v46;
        }
        while (v43 != v46);
        uint64_t v43 = [v42 countByEnumeratingWithState:&v313 objects:v385 count:16];
        int v44 = v47 + v46;
      }
      while (v43);
      LODWORD(v43) = v47 + v46;
    }

    int v377 = v43;
    unsigned int v51 = (id)gLogger;
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      v274 = [v297 inputArray];
      uint64_t v275 = [v274 count];
      v276 = [v297 inputIndexArray];
      uint64_t v277 = [v276 count];
      v278 = [v297 outputArray];
      uint64_t v279 = [v278 count];
      v280 = [v297 outputIndexArray];
      uint64_t v281 = [v280 count];
      *(_DWORD *)v398 = 134218752;
      *(void *)&v398[4] = v275;
      *(_WORD *)&v398[12] = 2048;
      *(void *)&v398[14] = v277;
      *(_WORD *)v399 = 2048;
      *(void *)&v399[2] = v279;
      *(_WORD *)&v399[10] = 2048;
      *(void *)&v399[12] = v281;
      _os_log_debug_impl(&dword_1DB8AB000, v51, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate: request.inputArray %lu request.inputIndexArray %lu request.outputArray %lu request.outputIndexArray %lu", v398, 0x2Au);
    }
    uint64_t v52 = [v297 weightsBuffer];
    BOOL v53 = [v52 ioSurface] == 0;

    if (v53)
    {
      IOSurfaceID v370 = 0;
    }
    else
    {
      id v54 = [v297 weightsBuffer];
      IOSurfaceID v55 = IOSurfaceGetID((IOSurfaceRef)[v54 ioSurface]);

      IOSurfaceID v370 = v55;
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
        -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:].cold.4();
      }
    }
    v118 = [v297 procedureIndex];
    uint64_t v371 = [v118 unsignedLongLongValue];

    v119 = [v297 transactionHandle];
    v372[0] = [v119 unsignedLongLongValue];

    long long v311 = 0u;
    long long v312 = 0u;
    long long v309 = 0u;
    long long v310 = 0u;
    v120 = [v297 perfStatsArray];
    uint64_t v121 = [v120 countByEnumeratingWithState:&v309 objects:v384 count:16];
    if (v121)
    {
      int v122 = 0;
      uint64_t v123 = *(void *)v310;
      do
      {
        uint64_t v124 = 0;
        int v125 = v122;
        do
        {
          if (*(void *)v310 != v123) {
            objc_enumerationMutation(v120);
          }
          v126 = *(void **)(*((void *)&v309 + 1) + 8 * v124);
          v127 = [v126 stats];
          IOSurfaceID v128 = IOSurfaceGetID((IOSurfaceRef)[v127 ioSurface]);

          *((_DWORD *)&v372[1] + (v125 + v124)) = v128;
          *((_DWORD *)&v372[33] + (v125 + v124)) = [v126 statType];
          int v373 = v125 + v124 + 1;
          v129 = gLogger;
          if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v398 = 67109120;
            *(_DWORD *)&v398[4] = v128;
            _os_log_debug_impl(&dword_1DB8AB000, v129, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request6 ioSID: %u", v398, 8u);
          }
          v130 = (id)gLogger;
          if (os_log_type_enabled(v130, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v131 = [v126 statType];
            *(_DWORD *)v398 = 134217984;
            *(void *)&v398[4] = v131;
            _os_log_debug_impl(&dword_1DB8AB000, v130, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request7 ioSID: %ld", v398, 0xCu);
          }

          ++v124;
        }
        while (v121 != v124);
        uint64_t v121 = [v120 countByEnumeratingWithState:&v309 objects:v384 count:16];
        int v122 = v125 + v124;
      }
      while (v121);

      if (v125 + v124) {
        goto LABEL_119;
      }
    }
    else
    {
    }
    int v373 = 0;
LABEL_119:
    uint64_t v379 = 0;
    IOSurfaceID v380 = 0;
    uint64_t v381 = 0;
    v132 = (void *)MEMORY[0x1E4F1C9E8];
    v133 = [NSNumber numberWithUnsignedLong:4096];
    objc_msgSend(v132, "dictionaryWithObjectsAndKeys:", v133, *MEMORY[0x1E4F2EFB8], 0);
    CFDictionaryRef v134 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v135 = IOSurfaceCreate(v134);
    IOSurfaceRef buffer = v135;
    if (v135)
    {
      IOSurfaceLock(v135, 0, 0);
      IOSurfaceID v380 = IOSurfaceGetID(buffer);
      v136 = (id)gLogger;
      if (os_log_type_enabled(v136, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:]();
      }

      IOSurfaceUnlock(buffer, 0, 0);
      [v297 sharedEvents];

      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
        -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:]();
      }
      BOOL v137 = [(_ANEVirtualClient *)self callIOUserClient:4 inParams:v361 outParams:&v382];

LABEL_204:
      [(_ANEVirtualClient *)self updateError:v358 error:a8];
      v271 = [(_ANEVirtualClient *)self updatePerformanceStats:v358];
      [v297 setPerfStats:v271];

      [(_ANEVirtualClient *)self releaseIOSurfaces:v358];
      goto LABEL_205;
    }
    v138 = (id)gLogger;
    if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:]();
    }

    goto LABEL_174;
  }
  id v56 = (id)gLogger;
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
    -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:]7();
  }

  uint64_t v383 = 0;
  theDict = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFAllocatorRef v57 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFMutableArrayRef cf = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  uint64_t v58 = [v293 modelURL];
  BOOL v59 = v58 == 0;

  if (!v59) {
    [(_ANEVirtualClient *)self copyAllModelFiles:v293 dictionary:theDict ioSurfaceRefs:cf];
  }
  [(_ANEVirtualClient *)self copyModelMetaData:v293 options:v292 dictionary:theDict vmData:v358];
  [(_ANEVirtualClient *)self copyOptions:v292 dictionary:theDict vmData:v358];
  [(_ANEVirtualClient *)self copyErrorValue:theDict vmData:v358];
  unsigned int valuePtr = 0;
  long long v353 = 0u;
  long long v354 = 0u;
  long long v355 = 0u;
  long long v356 = 0u;
  uint64_t v60 = [v297 inputArray];
  uint64_t v61 = [v60 countByEnumeratingWithState:&v353 objects:v426 count:16];
  if (v61)
  {
    uint64_t v62 = *(void *)v354;
    do
    {
      for (uint64_t i = 0; i != v61; ++i)
      {
        if (*(void *)v354 != v62) {
          objc_enumerationMutation(v60);
        }
        IOSurfaceID v64 = IOSurfaceGetID((IOSurfaceRef)[*(id *)(*((void *)&v353 + 1) + 8 * i) ioSurface]);
        uint64_t v65 = valuePtr;
        v369[valuePtr + 12] = v64;
        CFStringRef v66 = CFStringCreateWithFormat(0, 0, @"inputArray%d", v65);
        CFNumberRef v67 = CFNumberCreate(v57, kCFNumberSInt32Type, &v369[valuePtr + 12]);
        CFDictionarySetValue(theDict, v66, v67);
        CFRelease(v67);
        CFRelease(v66);
        id v68 = (id)gLogger;
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
        {
          int v69 = v369[valuePtr + 12];
          *(_DWORD *)v398 = 67109120;
          *(_DWORD *)&v398[4] = v69;
          _os_log_debug_impl(&dword_1DB8AB000, v68, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request1 ioSID: %u", v398, 8u);
        }

        ++valuePtr;
      }
      uint64_t v61 = [v60 countByEnumeratingWithState:&v353 objects:v426 count:16];
    }
    while (v61);
  }

  CFNumberRef v70 = CFNumberCreate(v57, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(theDict, @"inputArrayCount", v70);
  CFRelease(v70);
  unsigned int valuePtr = 0;
  long long v349 = 0u;
  long long v350 = 0u;
  long long v351 = 0u;
  long long v352 = 0u;
  uint64_t v71 = [v297 inputIndexArray];
  uint64_t v72 = [v71 countByEnumeratingWithState:&v349 objects:v425 count:16];
  if (v72)
  {
    uint64_t v73 = *(void *)v350;
    do
    {
      for (uint64_t j = 0; j != v72; ++j)
      {
        if (*(void *)v350 != v73) {
          objc_enumerationMutation(v71);
        }
        int v75 = *(void **)(*((void *)&v349 + 1) + 8 * j);
        int v76 = [v75 unsignedIntValue];
        uint64_t v77 = valuePtr;
        v369[valuePtr + 76] = v76;
        CFStringRef v78 = CFStringCreateWithFormat(0, 0, @"inputIndexArray%d", v77);
        CFNumberRef v79 = CFNumberCreate(v57, kCFNumberSInt32Type, &v369[valuePtr + 76]);
        CFDictionarySetValue(theDict, v78, v79);
        CFRelease(v79);
        CFRelease(v78);
        __int16 v80 = (id)gLogger;
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v81 = [v75 unsignedLongLongValue];
          *(_DWORD *)v398 = 134217984;
          *(void *)&v398[4] = v81;
          _os_log_debug_impl(&dword_1DB8AB000, v80, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request2 ioSID: %llu", v398, 0xCu);
        }

        ++valuePtr;
      }
      uint64_t v72 = [v71 countByEnumeratingWithState:&v349 objects:v425 count:16];
    }
    while (v72);
  }

  CFNumberRef v82 = CFNumberCreate(v57, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(theDict, @"inputIndexArrayCount", v82);
  CFRelease(v82);
  unsigned int valuePtr = 0;
  long long v345 = 0u;
  long long v346 = 0u;
  long long v347 = 0u;
  long long v348 = 0u;
  int v83 = [v297 outputArray];
  uint64_t v84 = [v83 countByEnumeratingWithState:&v345 objects:v424 count:16];
  if (v84)
  {
    uint64_t v85 = *(void *)v346;
    do
    {
      for (uint64_t k = 0; k != v84; ++k)
      {
        if (*(void *)v346 != v85) {
          objc_enumerationMutation(v83);
        }
        IOSurfaceID v87 = IOSurfaceGetID((IOSurfaceRef)[*(id *)(*((void *)&v345 + 1) + 8 * k) ioSurface]);
        uint64_t v88 = valuePtr;
        v369[valuePtr + 140] = v87;
        CFStringRef v89 = CFStringCreateWithFormat(0, 0, @"outputArray%d", v88);
        CFNumberRef v90 = CFNumberCreate(v57, kCFNumberSInt32Type, &v369[valuePtr + 140]);
        CFDictionarySetValue(theDict, v89, v90);
        CFRelease(v90);
        CFRelease(v89);
        v91 = (id)gLogger;
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
        {
          int v92 = v369[valuePtr + 140];
          *(_DWORD *)v398 = 67109120;
          *(_DWORD *)&v398[4] = v92;
          _os_log_debug_impl(&dword_1DB8AB000, v91, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request3 ioSID: %u", v398, 8u);
        }

        ++valuePtr;
      }
      uint64_t v84 = [v83 countByEnumeratingWithState:&v345 objects:v424 count:16];
    }
    while (v84);
  }

  CFNumberRef v93 = CFNumberCreate(v57, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(theDict, @"outputArrayCount", v93);
  CFRelease(v93);
  unsigned int valuePtr = 0;
  long long v341 = 0u;
  long long v342 = 0u;
  long long v343 = 0u;
  long long v344 = 0u;
  int v94 = [v297 outputIndexArray];
  uint64_t v95 = [v94 countByEnumeratingWithState:&v341 objects:v423 count:16];
  if (v95)
  {
    uint64_t v96 = *(void *)v342;
    do
    {
      for (uint64_t m = 0; m != v95; ++m)
      {
        if (*(void *)v342 != v96) {
          objc_enumerationMutation(v94);
        }
        uint64_t v98 = *(void **)(*((void *)&v341 + 1) + 8 * m);
        int v99 = [v98 unsignedIntValue];
        uint64_t v100 = valuePtr;
        v369[valuePtr + 204] = v99;
        CFStringRef v101 = CFStringCreateWithFormat(0, 0, @"outputIndexArray%d", v100);
        CFNumberRef v102 = CFNumberCreate(v57, kCFNumberSInt32Type, &v369[valuePtr + 204]);
        CFDictionarySetValue(theDict, v101, v102);
        CFRelease(v102);
        CFRelease(v101);
        unsigned int v103 = (id)gLogger;
        if (os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v104 = [v98 unsignedLongLongValue];
          *(_DWORD *)v398 = 134217984;
          *(void *)&v398[4] = v104;
          _os_log_debug_impl(&dword_1DB8AB000, v103, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request4 ioSID: %llu", v398, 0xCu);
        }

        ++valuePtr;
      }
      uint64_t v95 = [v94 countByEnumeratingWithState:&v341 objects:v423 count:16];
    }
    while (v95);
  }

  CFNumberRef v105 = CFNumberCreate(v57, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(theDict, @"outputIndexArrayCount", v105);
  CFRelease(v105);
  uint64_t v106 = (id)gLogger;
  if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
  {
    v282 = [v297 inputArray];
    uint64_t v283 = [v282 count];
    v284 = [v297 inputIndexArray];
    uint64_t v285 = [v284 count];
    v286 = [v297 outputArray];
    uint64_t v287 = [v286 count];
    v288 = [v297 outputIndexArray];
    uint64_t v289 = [v288 count];
    *(_DWORD *)v398 = 134218752;
    *(void *)&v398[4] = v283;
    *(_WORD *)&v398[12] = 2048;
    *(void *)&v398[14] = v285;
    *(_WORD *)v399 = 2048;
    *(void *)&v399[2] = v287;
    *(_WORD *)&v399[10] = 2048;
    *(void *)&v399[12] = v289;
    _os_log_debug_impl(&dword_1DB8AB000, v106, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate: request.inputArray %lu request.inputIndexArray %lu request.outputArray %lu request.outputIndexArray %lu", v398, 0x2Au);
  }
  uint64_t v107 = [v297 weightsBuffer];
  BOOL v108 = [v107 ioSurface] == 0;

  if (v108)
  {
    IOSurfaceID v370 = 0;
  }
  else
  {
    v109 = [v297 weightsBuffer];
    IOSurfaceID v370 = IOSurfaceGetID((IOSurfaceRef)[v109 ioSurface]);

    CFNumberRef v110 = CFNumberCreate(v57, kCFNumberSInt32Type, &v370);
    CFDictionarySetValue(theDict, @"ioSIDWeightsBufferIndex", v110);
    CFRelease(v110);
    v111 = (id)gLogger;
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEBUG)) {
      [(_ANEVirtualClient *)(uint64_t)&v370 doEvaluateWithModel:v112 options:v113 request:v114 qos:v115 completionEvent:v116 error:v117];
    }
  }
  v139 = [v297 procedureIndex];
  uint64_t v371 = [v139 unsignedLongLongValue];

  CFNumberRef v140 = CFNumberCreate(v57, kCFNumberSInt64Type, &v371);
  CFDictionarySetValue(theDict, @"procedureIndex", v140);
  CFRelease(v140);
  v141 = [v297 transactionHandle];
  v372[0] = [v141 unsignedLongLongValue];

  CFNumberRef v142 = CFNumberCreate(v57, kCFNumberSInt64Type, v372);
  CFDictionarySetValue(theDict, @"transactionHandle", v142);
  CFRelease(v142);
  unsigned int valuePtr = 0;
  long long v337 = 0u;
  long long v338 = 0u;
  long long v339 = 0u;
  long long v340 = 0u;
  v143 = [v297 perfStatsArray];
  uint64_t v144 = [v143 countByEnumeratingWithState:&v337 objects:v422 count:16];
  if (v144)
  {
    uint64_t v145 = *(void *)v338;
    do
    {
      for (uint64_t n = 0; n != v144; ++n)
      {
        if (*(void *)v338 != v145) {
          objc_enumerationMutation(v143);
        }
        v147 = *(void **)(*((void *)&v337 + 1) + 8 * n);
        v148 = [v147 stats];
        IOSurfaceID v149 = IOSurfaceGetID((IOSurfaceRef)[v148 ioSurface]);
        *((_DWORD *)&v372[1] + valuePtr) = v149;

        CFStringRef v150 = CFStringCreateWithFormat(0, 0, @"ioSIDPerfStats%d", valuePtr);
        CFNumberRef v151 = CFNumberCreate(v57, kCFNumberSInt32Type, (char *)&v372[1] + 4 * valuePtr);
        CFDictionarySetValue(theDict, v150, v151);
        CFRelease(v151);
        CFRelease(v150);
        int v152 = [v147 statType];
        uint64_t v153 = valuePtr;
        *((_DWORD *)&v372[33] + valuePtr) = v152;
        CFStringRef v154 = CFStringCreateWithFormat(0, 0, @"perfStatsType%d", v153);
        CFNumberRef v155 = CFNumberCreate(v57, kCFNumberSInt32Type, (char *)&v372[33] + 4 * valuePtr);
        CFDictionarySetValue(theDict, v154, v155);
        CFRelease(v155);
        CFRelease(v154);
        v156 = (id)gLogger;
        if (os_log_type_enabled(v156, OS_LOG_TYPE_DEBUG))
        {
          int v158 = *((_DWORD *)&v372[1] + valuePtr);
          *(_DWORD *)v398 = 67109120;
          *(_DWORD *)&v398[4] = v158;
          _os_log_debug_impl(&dword_1DB8AB000, v156, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request6 ioSID: %u", v398, 8u);
        }

        v157 = (id)gLogger;
        if (os_log_type_enabled(v157, OS_LOG_TYPE_DEBUG))
        {
          int v159 = *((_DWORD *)&v372[33] + valuePtr);
          *(_DWORD *)v398 = 67109120;
          *(_DWORD *)&v398[4] = v159;
          _os_log_debug_impl(&dword_1DB8AB000, v157, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request7 ioSID: %u", v398, 8u);
        }

        ++valuePtr;
      }
      uint64_t v144 = [v143 countByEnumeratingWithState:&v337 objects:v422 count:16];
    }
    while (v144);
  }

  CFNumberRef v160 = CFNumberCreate(v57, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(theDict, @"perfStatsCount", v160);
  CFRelease(v160);
  uint64_t v379 = 0;
  IOSurfaceID v380 = 0;
  uint64_t v381 = 0;
  v161 = (void *)MEMORY[0x1E4F1C9E8];
  v162 = [NSNumber numberWithUnsignedLong:4096];
  objc_msgSend(v161, "dictionaryWithObjectsAndKeys:", v162, *MEMORY[0x1E4F2EFB8], 0);
  CFDictionaryRef v163 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v164 = IOSurfaceCreate(v163);
  IOSurfaceRef buffer = v164;
  if (v164)
  {
    IOSurfaceID v380 = IOSurfaceGetID(v164);
    CFNumberRef v165 = CFNumberCreate(v57, kCFNumberSInt32Type, &v380);
    CFDictionarySetValue(theDict, @"ioSIDPerformanceStatsIndex", v165);
    CFRelease(v165);
    v166 = (id)gLogger;
    if (os_log_type_enabled(v166, OS_LOG_TYPE_DEBUG))
    {
      v167 = NSStringFromSelector(a2);
      -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:]5(v167);
    }

    v168 = [v297 sharedEvents];
    BOOL v169 = v168 == 0;

    if (v169)
    {
      BOOL v294 = 0;
    }
    else
    {
      bzero(v398, 0x1460uLL);
      v170 = [v297 sharedEvents];
      v171 = [v170 signalEvents];
      *(void *)&v398[8] = [v171 count];

      if (*(void *)&v398[8])
      {
        CFStringRef v172 = CFStringCreateWithFormat(0, 0, @"signalEventsCount");
        CFNumberRef v173 = CFNumberCreate(v57, kCFNumberSInt64Type, &v398[8]);
        CFDictionarySetValue(theDict, v172, v173);
        CFRelease(v173);
        CFRelease(v172);
      }
      v174 = (id)gLogger;
      if (os_log_type_enabled(v174, OS_LOG_TYPE_DEBUG))
      {
        v175 = NSStringFromSelector(a2);
        -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:]4(v175);
      }

      long long v335 = 0u;
      long long v336 = 0u;
      long long v333 = 0u;
      long long v334 = 0u;
      v176 = [v297 sharedEvents];
      obuint64_t j = [v176 signalEvents];

      uint64_t v177 = [obj countByEnumeratingWithState:&v333 objects:v397 count:16];
      if (v177)
      {
        uint64_t v306 = 0;
        uint64_t v301 = *(void *)v334;
        do
        {
          uint64_t v304 = v177;
          for (iuint64_t i = 0; ii != v304; ++ii)
          {
            if (*(void *)v334 != v301) {
              objc_enumerationMutation(obj);
            }
            v179 = *(void **)(*((void *)&v333 + 1) + 8 * ii);
            v180 = [v179 sharedEvent];
            uint64_t v181 = v306 + ii;
            v182 = &v398[40 * (v306 + ii)];
            *((_DWORD *)v182 + 644) = [v180 eventPort];

            v183 = v182;
            *((_DWORD *)v182 + 645) = [v179 eventType];
            *((void *)v182 + 323) = [v179 value];
            v184 = v182;
            *((_DWORD *)v182 + 648) = [v179 symbolIndex];
            uint64_t v185 = [v179 agentMask];
            v186 = (int *)(v182 + 2576);
            v187 = (uint64_t *)(v182 + 2584);
            v188 = v182;
            *((void *)v182 + 325) = v185;
            v182[2608] = 0;
            v189 = (id)gLogger;
            if (os_log_type_enabled(v189, OS_LOG_TYPE_DEBUG))
            {
              NSStringFromSelector(a2);
              id v200 = (id)objc_claimAutoreleasedReturnValue();
              int v201 = *v186;
              uint64_t v202 = *v187;
              int v391 = 138412802;
              id v392 = v200;
              __int16 v393 = 1024;
              int v394 = v201;
              __int16 v395 = 2048;
              uint64_t v396 = v202;
              _os_log_debug_impl(&dword_1DB8AB000, v189, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualClient signal events port is %#x and value is %llu\n", (uint8_t *)&v391, 0x1Cu);
            }
            CFStringRef v190 = CFStringCreateWithFormat(0, 0, @"signalEvents%dport", v181);
            CFNumberRef v191 = CFNumberCreate(v57, kCFNumberSInt32Type, v186);
            CFDictionarySetValue(theDict, v190, v191);
            CFRelease(v191);
            CFRelease(v190);
            CFStringRef v192 = CFStringCreateWithFormat(0, 0, @"signalEvents%dtype", v181);
            CFNumberRef v193 = CFNumberCreate(v57, kCFNumberSInt32Type, v183 + 2580);
            CFDictionarySetValue(theDict, v192, v193);
            CFRelease(v193);
            CFRelease(v192);
            CFStringRef v194 = CFStringCreateWithFormat(0, 0, @"signalEvents%dValue", v181);
            CFNumberRef v195 = CFNumberCreate(v57, kCFNumberSInt64Type, v187);
            CFDictionarySetValue(theDict, v194, v195);
            CFRelease(v195);
            CFRelease(v194);
            CFStringRef v196 = CFStringCreateWithFormat(0, 0, @"signalEvents%dSymbolIndex", v181);
            CFNumberRef v197 = CFNumberCreate(v57, kCFNumberSInt32Type, v184 + 2592);
            CFDictionarySetValue(theDict, v196, v197);
            CFRelease(v197);
            CFRelease(v196);
            CFStringRef v198 = CFStringCreateWithFormat(0, 0, @"signalEvents%dAgentMask", v181);
            CFNumberRef v199 = CFNumberCreate(v57, kCFNumberSInt64Type, v188 + 2600);
            CFDictionarySetValue(theDict, v198, v199);
            CFRelease(v199);
            CFRelease(v198);
          }
          uint64_t v177 = [obj countByEnumeratingWithState:&v333 objects:v397 count:16];
          uint64_t v306 = (v306 + ii);
        }
        while (v177);
      }

      if (v298)
      {
        v203 = [v298 signalEvents];
        BOOL v204 = [v203 count] == 2;

        if (!v204)
        {
          v205 = (id)gLogger;
          if (os_log_type_enabled(v205, OS_LOG_TYPE_ERROR)) {
            -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:]3();
          }
        }
        uint64_t v206 = 0;
        char v207 = 1;
        do
        {
          char v208 = v207;
          v209 = [v298 signalEvents];
          v210 = [v209 objectAtIndexedSubscript:v206];
          BOOL v211 = [v210 value] == 4097;

          if (v211)
          {
            v212 = [v298 signalEvents];
            v213 = [v212 objectAtIndexedSubscript:v206];
            v214 = [v213 sharedEvent];
            v414[0] = [v214 eventPort];

            v215 = [v298 signalEvents];
            v216 = [v215 objectAtIndexedSubscript:v206];
            v414[1] = [v216 eventType];

            v217 = [v298 signalEvents];
            v218 = [v217 objectAtIndexedSubscript:v206];
            uint64_t v415 = [v218 value];

            v219 = [v298 signalEvents];
            v220 = [v219 objectAtIndexedSubscript:v206];
            int v416 = [v220 symbolIndex];

            char v417 = 0;
            v221 = (id)gLogger;
            if (os_log_type_enabled(v221, OS_LOG_TYPE_DEBUG))
            {
              NSStringFromSelector(a2);
              id v222 = (id)objc_claimAutoreleasedReturnValue();
              int v391 = 138412802;
              id v392 = v222;
              __int16 v393 = 1024;
              int v394 = v414[0];
              __int16 v395 = 2048;
              uint64_t v396 = v415;
              _os_log_debug_impl(&dword_1DB8AB000, v221, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualClient success completionEvent signal events port is %#x and value is %llu\n", (uint8_t *)&v391, 0x1Cu);
            }
          }
          else
          {
            v223 = [v298 signalEvents];
            v224 = [v223 objectAtIndexedSubscript:v206];
            v225 = [v224 sharedEvent];
            v418[0] = [v225 eventPort];

            v226 = [v298 signalEvents];
            v227 = [v226 objectAtIndexedSubscript:v206];
            v418[1] = [v227 eventType];

            v228 = [v298 signalEvents];
            v229 = [v228 objectAtIndexedSubscript:v206];
            uint64_t v419 = [v229 value];

            v230 = [v298 signalEvents];
            v231 = [v230 objectAtIndexedSubscript:v206];
            int v420 = [v231 symbolIndex];

            char v421 = 0;
            v221 = (id)gLogger;
            if (os_log_type_enabled(v221, OS_LOG_TYPE_DEBUG))
            {
              NSStringFromSelector(a2);
              id v232 = (id)objc_claimAutoreleasedReturnValue();
              int v391 = 138412802;
              id v392 = v232;
              __int16 v393 = 1024;
              int v394 = v418[0];
              __int16 v395 = 2048;
              uint64_t v396 = v419;
              _os_log_debug_impl(&dword_1DB8AB000, v221, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualClient error completionEvent signal events port is %#x and value is %llu\n", (uint8_t *)&v391, 0x1Cu);
            }
          }

          char v207 = 0;
          uint64_t v206 = 1;
        }
        while ((v208 & 1) != 0);
        CFStringRef v234 = CFStringCreateWithFormat(0, 0, @"successEventport");
        CFNumberRef v235 = CFNumberCreate(v57, kCFNumberSInt32Type, v414);
        CFDictionarySetValue(theDict, v234, v235);
        CFRelease(v235);
        CFRelease(v234);
        CFStringRef v236 = CFStringCreateWithFormat(0, 0, @"errorEventport");
        CFNumberRef v237 = CFNumberCreate(v57, kCFNumberSInt32Type, v418);
        CFDictionarySetValue(theDict, v236, v237);
        CFRelease(v237);
        CFRelease(v236);
      }
      v238 = [v297 sharedEvents];
      v239 = [v238 waitEvents];
      *(void *)v398 = [v239 count];

      BOOL v294 = *(void *)v398 != 0;
      if (*(void *)v398)
      {
        CFStringRef v240 = CFStringCreateWithFormat(0, 0, @"waitEventsCount");
        CFNumberRef v241 = CFNumberCreate(v57, kCFNumberSInt64Type, v398);
        CFDictionarySetValue(theDict, v240, v241);
        CFRelease(v241);
        CFRelease(v240);
        v242 = (id)gLogger;
        if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG))
        {
          v243 = NSStringFromSelector(a2);
          -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:]2(v243);
        }
      }
      v244 = (id)gLogger;
      if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG))
      {
        v245 = NSStringFromSelector(a2);
        -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:]1(v245);
      }

      long long v331 = 0u;
      long long v332 = 0u;
      long long v329 = 0u;
      long long v330 = 0u;
      v246 = [v297 sharedEvents];
      id obja = [v246 waitEvents];

      uint64_t v247 = [obja countByEnumeratingWithState:&v329 objects:v390 count:16];
      if (v247)
      {
        uint64_t v307 = 0;
        uint64_t v302 = *(void *)v330;
        do
        {
          uint64_t v305 = v247;
          for (juint64_t j = 0; jj != v305; ++jj)
          {
            if (*(void *)v330 != v302) {
              objc_enumerationMutation(obja);
            }
            v249 = *(void **)(*((void *)&v329 + 1) + 8 * jj);
            v250 = [v249 sharedEvent];
            v251 = &v398[40 * (v307 + jj)];
            *((_DWORD *)v251 + 4) = [v250 eventPort];

            v252 = v251;
            *((_DWORD *)v251 + 5) = [v249 eventType];
            *((void *)v251 + 3) = [v249 value];
            v253 = v251 + 24;
            *((_DWORD *)v251 + 8) = 0;
            *((void *)v251 + 5) = 0;
            v251[48] = 0;
            CFStringRef v254 = CFStringCreateWithFormat(0, 0, @"waitEvents%dport", v307 + jj);
            CFNumberRef v255 = CFNumberCreate(v57, kCFNumberSInt32Type, v251 + 16);
            CFDictionarySetValue(theDict, v254, v255);
            CFRelease(v255);
            CFRelease(v254);
            CFStringRef v256 = CFStringCreateWithFormat(0, 0, @"waitEvents%dtype", v307 + jj);
            CFNumberRef v257 = CFNumberCreate(v57, kCFNumberSInt32Type, v252 + 20);
            CFDictionarySetValue(theDict, v256, v257);
            CFRelease(v257);
            CFRelease(v256);
            CFStringRef v258 = CFStringCreateWithFormat(0, 0, @"waitEvents%dValue", v307 + jj);
            CFNumberRef v259 = CFNumberCreate(v57, kCFNumberSInt64Type, v253);
            CFDictionarySetValue(theDict, v258, v259);
            CFRelease(v259);
            CFRelease(v258);
          }
          uint64_t v247 = [obja countByEnumeratingWithState:&v329 objects:v390 count:16];
          uint64_t v307 = (v307 + jj);
        }
        while (v247);
      }
    }
    [(_ANEVirtualClient *)self printDictionary:theDict];
    v260 = [(_ANEVirtualClient *)self callIOUserClientWithDictionary:4 inDictionary:theDict error:a8];
    CFRelease(theDict);
    [(_ANEVirtualClient *)self printDictionary:v260];
    v261 = [v293 modelURL];
    BOOL v262 = v261 == 0;

    if (!v262)
    {
      +[_ANEVirtualClient freeModelFileIOSurfaces:cf];
      CFRelease(cf);
    }
    v263 = (id)gLogger;
    BOOL v264 = os_log_type_enabled(v263, OS_LOG_TYPE_DEBUG);
    if (v260)
    {
      if (v264)
      {
        v265 = NSStringFromSelector(a2);
        -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:]0(v265, (uint64_t)&v389, v263);
      }

      +[_ANEVirtualClient copyDictionaryDataToStruct:&v382 dictionary:v260];
      BOOL v137 = v383 == 1;
      v266 = (id)gLogger;
      if (os_log_type_enabled(v266, OS_LOG_TYPE_DEBUG))
      {
        v267 = NSStringFromSelector(a2);
        -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:].cold.9(v267);
      }

      CFRelease(v260);
      goto LABEL_204;
    }
    if (v264)
    {
      v268 = NSStringFromSelector(a2);
      -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:].cold.8(v268, v294);
    }

    if (v294)
    {
      v269 = (id)gLogger;
      if (os_log_type_enabled(v269, OS_LOG_TYPE_DEBUG))
      {
        v270 = NSStringFromSelector(a2);
        -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:].cold.6(v270);
      }

      BOOL v137 = 1;
      goto LABEL_204;
    }
    [(_ANEVirtualClient *)self releaseIOSurfaces:v358];
    CFDictionaryRef v163 = (const __CFDictionary *)(id)gLogger;
    if (os_log_type_enabled((os_log_t)v163, OS_LOG_TYPE_ERROR)) {
      -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:].cold.7((uint64_t *)a8, v163, v273);
    }
  }
  else
  {
    v233 = (id)gLogger;
    if (os_log_type_enabled(v233, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:]();
    }
  }
LABEL_174:
  BOOL v137 = 0;
LABEL_205:

  return v137;
}

- (BOOL)compiledModelExistsFor:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (id)gLogger;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualClient compileModel:options:qos:error:].cold.6();
  }

  bzero(v23, 0x1728uLL);
  if (([(_ANEVirtualClient *)self negotiatedCapabilityMask] & 4) != 0)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFMutableArrayRef v9 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
    int v10 = [v5 modelURL];
    BOOL v11 = v10 == 0;

    if (!v11)
    {
      [(_ANEVirtualClient *)self copyAllModelFiles:v5 dictionary:Mutable ioSurfaceRefs:v9];
      [(_ANEVirtualClient *)self copyModelMetaData:v5 options:MEMORY[0x1E4F1CC08] dictionary:Mutable vmData:v23];
    }
    io_service_t v12 = [v5 getCacheURLIdentifier];
    BOOL v13 = v12 == 0;

    if (!v13)
    {
      id v14 = [v5 cacheURLIdentifier];

      id v15 = (id)gLogger;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient loadModel:options:qos:error:].cold.8();
      }

      CFDictionarySetValue(Mutable, @"modelCacheURLIdentifier", v14);
    }
    +[_ANEVirtualClient setCodeSigningIdentity:Mutable];
    [(_ANEVirtualClient *)self printDictionary:Mutable];
    id v16 = [(_ANEVirtualClient *)self callIOUserClientWithDictionary:5 inDictionary:Mutable error:0];
    CFRelease(Mutable);
    [(_ANEVirtualClient *)self printDictionary:v16];
    id v17 = [v5 modelURL];
    BOOL v18 = v17 == 0;

    if (!v18)
    {
      +[_ANEVirtualClient freeModelFileIOSurfaces:v9];
      CFRelease(v9);
    }
    if (v16)
    {
      int v19 = (id)gLogger;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient compiledModelExistsFor:]();
      }

      +[_ANEVirtualClient copyDictionaryDataToStruct:&v25 dictionary:v16];
      BOOL v7 = v26 == 1;
      if (v26 == 1)
      {
        uint64_t v20 = +[_ANEVirtualClient dictionaryGetNSStringForKey:v16 key:@"modelCacheURLIdentifier"];
        if (v20) {
          [v5 setCacheURLIdentifier:v20];
        }
      }
      uint64_t v21 = (id)gLogger;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient compiledModelExistsFor:]();
      }

      CFRelease(v16);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
        -[_ANEVirtualClient compiledModelExistsFor:]();
      }
      BOOL v7 = 0;
    }
  }
  else
  {
    [(_ANEVirtualClient *)self copyModel:v5 options:MEMORY[0x1E4F1CC08] vmData:v23];
    BOOL v7 = [(_ANEVirtualClient *)self callIOUserClient:5 inParams:&v24 outParams:0];
  }
  [(_ANEVirtualClient *)self releaseIOSurfaces:v23];

  return v7;
}

- (void)purgeCompiledModel:(id)a3
{
  v20[671] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (id)gLogger;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualClient compileModel:options:qos:error:].cold.6();
  }

  bzero(v19, 0x1728uLL);
  if (([(_ANEVirtualClient *)self negotiatedCapabilityMask] & 4) != 0)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFMutableArrayRef v8 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
    CFMutableArrayRef v9 = [v5 modelURL];
    BOOL v10 = v9 == 0;

    if (!v10) {
      [(_ANEVirtualClient *)self copyAllModelFiles:v5 dictionary:Mutable ioSurfaceRefs:v8];
    }
    [(_ANEVirtualClient *)self copyModelMetaData:v5 options:MEMORY[0x1E4F1CC08] dictionary:Mutable vmData:v19];
    BOOL v11 = [v5 getCacheURLIdentifier];
    BOOL v12 = v11 == 0;

    if (!v12)
    {
      BOOL v13 = [v5 cacheURLIdentifier];

      id v14 = (id)gLogger;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient loadModel:options:qos:error:].cold.8();
      }

      CFDictionarySetValue(Mutable, @"modelCacheURLIdentifier", v13);
    }
    +[_ANEVirtualClient setCodeSigningIdentity:Mutable];
    [(_ANEVirtualClient *)self printDictionary:Mutable];
    id v15 = [(_ANEVirtualClient *)self callIOUserClientWithDictionary:6 inDictionary:Mutable error:0];
    CFRelease(Mutable);
    [(_ANEVirtualClient *)self printDictionary:v15];
    id v16 = [v5 modelURL];
    BOOL v17 = v16 == 0;

    if (!v17)
    {
      +[_ANEVirtualClient freeModelFileIOSurfaces:v8];
      CFRelease(v8);
    }
    if (v15)
    {
      BOOL v18 = (id)gLogger;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient purgeCompiledModel:]();
      }

      CFRelease(v15);
    }
    else if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
    {
      -[_ANEVirtualClient purgeCompiledModel:]();
    }
  }
  else
  {
    [(_ANEVirtualClient *)self copyModel:v5 options:MEMORY[0x1E4F1CC08] vmData:v19];
    [(_ANEVirtualClient *)self callIOUserClient:6 inParams:v20 outParams:0];
  }
  [(_ANEVirtualClient *)self releaseIOSurfaces:v19];
}

- (BOOL)compiledModelExistsMatchingHash:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (id)gLogger;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualClient compiledModelExistsMatchingHash:]();
  }

  bzero(v22, 0x1728uLL);
  BOOL v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
  if (([(_ANEVirtualClient *)self negotiatedCapabilityMask] & 4) != 0)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    v22[0] = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v7, [v7 length], v24);
    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFNumberRef v12 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, v24);
    CFDictionarySetValue(Mutable, @"ioSIDHashString", v12);
    CFRelease(v12);
    v25[0] = [v7 length];
    CFNumberRef v13 = CFNumberCreate(v11, kCFNumberSInt64Type, v25);
    CFDictionarySetValue(Mutable, @"hashStringLength", v13);
    CFRelease(v13);
    id v14 = (id)gLogger;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = NSStringFromSelector(a2);
      uint64_t v21 = [v7 length];
      *(_DWORD *)buf = 138412802;
      uint64_t v28 = v20;
      __int16 v29 = 2048;
      uint64_t v30 = v21;
      __int16 v31 = 2112;
      id v32 = v5;
      _os_log_debug_impl(&dword_1DB8AB000, v14, OS_LOG_TYPE_DEBUG, "%@:ANEVirtualClient length=%lu hashString=%@ \n", buf, 0x20u);
    }
    id v15 = [(_ANEVirtualClient *)self callIOUserClientWithDictionary:7 inDictionary:Mutable error:0];
    CFRelease(Mutable);
    if (v15)
    {
      +[_ANEVirtualClient copyDictionaryDataToStruct:v26 dictionary:v15];
      BOOL v9 = v26[1] == 1;
      id v16 = (id)gLogger;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient compiledModelExistsMatchingHash:]();
      }

      CFRelease(v15);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
        -[_ANEVirtualClient compiledModelExistsMatchingHash:]();
      }
      BOOL v9 = 0;
    }
  }
  else
  {
    v22[0] = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v7, [v7 length], v24);
    v25[0] = [v7 length];
    CFMutableArrayRef v8 = (id)gLogger;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      BOOL v18 = NSStringFromSelector(a2);
      uint64_t v19 = [v7 length];
      *(_DWORD *)buf = 138412802;
      uint64_t v28 = v18;
      __int16 v29 = 2048;
      uint64_t v30 = v19;
      __int16 v31 = 2112;
      id v32 = v5;
      _os_log_debug_impl(&dword_1DB8AB000, v8, OS_LOG_TYPE_DEBUG, "%@:ANEVirtualClient length=%lu hashString=%@ \n", buf, 0x20u);
    }
    BOOL v9 = [(_ANEVirtualClient *)self callIOUserClient:7 inParams:&v23 outParams:0];
  }
  [(_ANEVirtualClient *)self releaseIOSurfaces:v22];

  return v9;
}

- (void)purgeCompiledModelMatchingHash:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (id)gLogger;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualClient compileModel:options:qos:error:].cold.6();
  }

  bzero(v16, 0x1728uLL);
  BOOL v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
  if (([(_ANEVirtualClient *)self negotiatedCapabilityMask] & 4) != 0)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    v16[0] = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v7, [v7 length], v18);
    CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFNumberRef v11 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, v18);
    CFDictionarySetValue(Mutable, @"ioSIDHashString", v11);
    CFRelease(v11);
    v19[0] = [v7 length];
    CFNumberRef v12 = CFNumberCreate(v10, kCFNumberSInt64Type, v19);
    CFDictionarySetValue(Mutable, @"hashStringLength", v12);
    CFRelease(v12);
    CFNumberRef v13 = [(_ANEVirtualClient *)self callIOUserClientWithDictionary:8 inDictionary:Mutable error:0];
    CFRelease(Mutable);
    if (v13)
    {
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
        -[_ANEVirtualClient purgeCompiledModelMatchingHash:]();
      }
      CFRelease(v13);
    }
    else if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
    {
      -[_ANEVirtualClient purgeCompiledModelMatchingHash:]();
    }
  }
  else
  {
    v16[0] = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v7, [v7 length], v18);
    v19[0] = [v7 length];
    CFMutableArrayRef v8 = (id)gLogger;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v14 = NSStringFromSelector(a2);
      uint64_t v15 = [v7 length];
      *(_DWORD *)buf = 138412802;
      uint64_t v21 = v14;
      __int16 v22 = 2048;
      uint64_t v23 = v15;
      __int16 v24 = 2112;
      id v25 = v5;
      _os_log_debug_impl(&dword_1DB8AB000, v8, OS_LOG_TYPE_DEBUG, "%@:ANEVirtualClient length=%lu hashString=%@ \n", buf, 0x20u);
    }
    [(_ANEVirtualClient *)self callIOUserClient:8 inParams:&v17 outParams:0];
  }
  [(_ANEVirtualClient *)self releaseIOSurfaces:v16];
}

- (BOOL)beginRealTimeTask
{
  uint64_t v4 = (id)gLogger;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualClient compileModel:options:qos:error:].cold.6();
  }

  return [(_ANEVirtualClient *)self callIOUserClient:9 inParams:0 outParams:0];
}

- (BOOL)endRealTimeTask
{
  uint64_t v4 = (id)gLogger;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualClient compileModel:options:qos:error:].cold.6();
  }

  return [(_ANEVirtualClient *)self callIOUserClient:10 inParams:0 outParams:0];
}

- (BOOL)echo:(id)a3
{
  v20[339] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (id)gLogger;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualClient compileModel:options:qos:error:].cold.6();
  }

  BOOL v7 = [v5 dataUsingEncoding:4];
  bzero(v16, 0x1728uLL);
  if (([(_ANEVirtualClient *)self negotiatedCapabilityMask] & 4) != 0)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    v16[0] = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v7, [v7 length], v18);
    CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFNumberRef v11 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, v18);
    CFDictionarySetValue(Mutable, @"ioSIDHashString", v11);
    CFRelease(v11);
    v19[0] = [v7 length];
    CFNumberRef v12 = CFNumberCreate(v10, kCFNumberSInt64Type, v19);
    CFDictionarySetValue(Mutable, @"hashStringLength", v12);
    CFRelease(v12);
    CFNumberRef v13 = [(_ANEVirtualClient *)self callIOUserClientWithDictionary:11 inDictionary:Mutable error:0];
    CFRelease(Mutable);
    if (v13)
    {
      +[_ANEVirtualClient copyDictionaryDataToStruct:v20 dictionary:v13];
      BOOL v8 = v20[1] == 1;
      id v14 = (id)gLogger;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient echo:]();
      }

      CFRelease(v13);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
        -[_ANEVirtualClient echo:]();
      }
      BOOL v8 = 0;
    }
  }
  else
  {
    v16[0] = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v7, [v7 length], v18);
    v19[0] = [v7 length];
    BOOL v8 = [(_ANEVirtualClient *)self callIOUserClient:11 inParams:&v17 outParams:0];
  }
  [(_ANEVirtualClient *)self releaseIOSurfaces:v16];

  return v8;
}

- (DeviceExtendedInfo)getDeviceInfo
{
  kern_return_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  BOOL var3;
  int64_t var2;
  DeviceExtendedInfo *result;
  size_t v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  BOOL v18;
  __int16 v19;
  int64_t v20;
  uint64_t v21;

  uint64_t v21 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)&retstr->var4[4] = 0u;
  *(_OWORD *)&retstr->var4[20] = 0u;
  *(_OWORD *)&retstr->var0.var2 = 0u;
  *(_OWORD *)&retstr->var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  CFNumberRef v12 = 80;
  id v5 = IOConnectCallMethod([(_ANEVirtualClient *)self connect], 0x12u, 0, 0, 0, 0, 0, 0, retstr, &v12);
  uint64_t v6 = (id)gLogger;
  BOOL v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a3);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient getDeviceInfo]();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL v8 = NSStringFromSelector(a3);
    var3 = retstr->var0.var3;
    var2 = retstr->var0.var2;
    *(_DWORD *)buf = 138413058;
    id v14 = v8;
    uint64_t v15 = 1024;
    id v16 = 18;
    uint64_t v17 = 1024;
    BOOL v18 = var3;
    uint64_t v19 = 2048;
    uint64_t v20 = var2;
    _os_log_impl(&dword_1DB8AB000, v7, OS_LOG_TYPE_INFO, "%@: ANEVirtualClient Successfully called method %d with result=%d %llx.\n", buf, 0x22u);
  }
  return result;
}

- (BOOL)hasANE
{
  [(_ANEVirtualClient *)self getDeviceInfo];
  return v3;
}

- (int64_t)aneBoardtype
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(_ANEVirtualClient *)self getDeviceInfo];
  return v3;
}

- (BOOL)isInternalBuild
{
  [(_ANEVirtualClient *)self getDeviceInfo];
  return v3;
}

- (id)aneArchitectureTypeStr
{
  *(void *)&v5[36] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = NSString;
  [(_ANEVirtualClient *)self getDeviceInfo];
  BOOL v3 = [v2 stringWithUTF8String:v5];
  return v3;
}

- (unsigned)numANEs
{
  [(_ANEVirtualClient *)self getDeviceInfo];
  return v3;
}

- (unsigned)numANECores
{
  [(_ANEVirtualClient *)self getDeviceInfo];
  return v3;
}

- (unint64_t)getValidateNetworkVersion
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(_ANEVirtualClient *)self exchangeBuildVersionInfo];
  return v3;
}

- (__CFDictionary)validateNetworkCreate:(unint64_t)a3 uuid:(id)a4 function:(id)a5 directoryPath:(id)a6 scratchPadPath:(id)a7
{
  kern_return_t v36;
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  __CFDictionary *v41;
  NSObject *v42;
  id v44;
  id v45;
  const char *aSelector;
  id v47;
  id v48;
  uint32_t outputCnt;
  uint64_t output;
  unint64_t inputStruct;
  unsigned char v52[40];
  uint64_t v53;
  _DWORD v54[98];
  uint64_t v55;
  void v56[192];
  unsigned int v57;
  uint64_t v58;

  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  id v48 = a6;
  int v44 = v14;
  uint64_t v45 = a7;
  CFArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  id v16 = [MEMORY[0x1E4F1CA48] array];
  aSelector = a2;
  uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
  bzero(v52, 0x7E8uLL);
  inputStruct = a3;
  int v47 = v13;
  BOOL v18 = (const char *)[v47 cStringUsingEncoding:4];
  size_t v19 = strlen(v18);
  memcpy(v52, v18, v19);
  id v20 = v14;
  uint64_t v21 = (const char *)[v20 cStringUsingEncoding:4];
  size_t v22 = strlen(v21);
  memcpy(&v53, v21, v22);
  id v23 = v45;
  __int16 v24 = (const char *)[v23 cStringUsingEncoding:4];
  size_t v25 = strlen(v24);
  memcpy(v54, v24, v25);
  if ([(_ANEVirtualClient *)self copyFilesInDirectoryToIOSurfaces:v48 ioSurfaceRefs:Mutable ioSurfaceSizes:v16 fileNames:v17])
  {
    CFAllocatorRef v57 = [v16 count];
    if (v57)
    {
      unint64_t v26 = 0;
      uint64_t v27 = 744;
      do
      {
        uint64_t v28 = [v16 objectAtIndexedSubscript:v26];
        v56[v26] = [v28 unsignedLongLongValue];

        ValueAtIndex = (__IOSurface *)CFArrayGetValueAtIndex(Mutable, v26);
        v54[v26 + 65] = IOSurfaceGetID(ValueAtIndex);
        id v30 = [v17 objectAtIndexedSubscript:v26];
        strlcpy(&v52[v27 - 8], (const char *)[v30 UTF8String], 0x28uLL);

        ++v26;
        v27 += 40;
      }
      while (v26 < v57);
    }
    __int16 v31 = (void *)MEMORY[0x1E4F1C9E8];
    id v32 = [NSNumber numberWithUnsignedLong:10485760];
    objc_msgSend(v31, "dictionaryWithObjectsAndKeys:", v32, *MEMORY[0x1E4F2EFB8], 0, v13, v44, v45);
    CFDictionaryRef v33 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    uint64_t v34 = IOSurfaceCreate(v33);
    uint64_t v35 = v34;
    if (v34)
    {
      v54[64] = IOSurfaceGetID(v34);
      IOSurfaceID v55 = 10485760;
      output = 0;
      outputCnt = 1;
      int v36 = IOConnectCallMethod([(_ANEVirtualClient *)self connect], 0x11u, 0, 0, &inputStruct, 0x7F0uLL, &output, &outputCnt, 0, 0);
      +[_ANEVirtualClient freeModelFileIOSurfaces:Mutable];
      if (!v36)
      {
        id v41 = +[_ANEVirtualClient getCFDictionaryFromIOSurface:v35 dataLength:output];
        CFRelease(v35);
        goto LABEL_18;
      }
      uint64_t v37 = (id)gLogger;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(aSelector);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient validateNetworkCreate:uuid:function:directoryPath:scratchPadPath:]();
      }
    }
    else
    {
      CFNumberRef v42 = (id)gLogger;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(aSelector);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient validateNetworkCreate:uuid:function:directoryPath:scratchPadPath:]();
      }
    }
    id v41 = 0;
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v38 = gLogger;
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
    -[_ANEVirtualClient validateNetworkCreate:uuid:function:directoryPath:scratchPadPath:](v38, v39, v40);
  }
  id v41 = 0;
LABEL_19:

  return v41;
}

- (void)sendGuestBuildVersion
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_8(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_1DB8AB000, "%@: ANEVirtualClient buildVersion: %@\n", v4, v5);
}

- (BuildVersionInfo)exchangeBuildVersionInfo
{
  kern_return_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  BuildVersionInfo *result;
  size_t v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  unint64_t v26 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)&retstr->var7[11] = 0u;
  *(_OWORD *)&retstr->var7[13] = 0u;
  *(_OWORD *)&retstr->var7[7] = 0u;
  *(_OWORD *)&retstr->var7[9] = 0u;
  *(_OWORD *)&retstr->var7[3] = 0u;
  *(_OWORD *)&retstr->var7[5] = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var7[1] = 0u;
  *(_OWORD *)&retstr->var3[16] = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)retstr->var3 = 0u;
  uint64_t v6 = +[_ANEDeviceInfo productName];
  BOOL v7 = v6;
  if (!v6 || [v6 isEqualToString:&stru_1F35E5710])
  {
    BOOL v8 = (id)gLogger;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a3);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient exchangeBuildVersionInfo]();
    }

    BOOL v7 = 0;
  }
  BOOL v9 = +[_ANEDeviceInfo buildVersion];
  CFAllocatorRef v10 = v9;
  if (!v9 || [v9 isEqualToString:&stru_1F35E5710])
  {
    CFNumberRef v11 = (id)gLogger;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a3);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient exchangeBuildVersionInfo]();
    }

    CFAllocatorRef v10 = 0;
    goto LABEL_11;
  }
  if (!v7)
  {
LABEL_11:
    CFNumberRef v12 = @"UnknownBuild";
    goto LABEL_12;
  }
  CFNumberRef v12 = [NSString stringWithFormat:@"%@%@", v7, v10];
LABEL_12:
  id v13 = v12;
  id v14 = (const char *)[(__CFString *)v13 UTF8String];
  size_t v15 = strlen(v14);
  uint64_t v21 = 192;
  id v16 = IOConnectCallMethod([(_ANEVirtualClient *)self connect], 0xFu, 0, 0, v14, v15 + 1, 0, 0, retstr, &v21);
  uint64_t v17 = (id)gLogger;
  BOOL v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a3);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient exchangeBuildVersionInfo]();
    }
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    size_t v19 = NSStringFromSelector(a3);
    *(_DWORD *)buf = 138412546;
    id v23 = v19;
    __int16 v24 = 1024;
    size_t v25 = 15;
    _os_log_impl(&dword_1DB8AB000, v18, OS_LOG_TYPE_INFO, "%@: ANEVirtualClient Successfully called method %d", buf, 0x12u);
  }
  return result;
}

- (unsigned)negotiatedDataInterfaceVersion
{
  [(_ANEVirtualClient *)self exchangeBuildVersionInfo];
  return v3;
}

- (unint64_t)negotiatedCapabilityMask
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(_ANEVirtualClient *)self exchangeBuildVersionInfo];
  return v3;
}

- (id)hostBuildVersionStr
{
  v5[22] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = NSString;
  [(_ANEVirtualClient *)self exchangeBuildVersionInfo];
  unint64_t v3 = [v2 stringWithUTF8String:v5];
  return v3;
}

- (unint64_t)outputDictIOSurfaceSize
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(_ANEVirtualClient *)self exchangeBuildVersionInfo];
  return v3;
}

- (BOOL)mapIOSurfacesWithModel:(id)a3 request:(id)a4 cacheInference:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v28 = 0;
  __int16 v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
      -[_ANEVirtualClient mapIOSurfacesWithModel:request:cacheInference:error:]();
    }
    CFNumberRef v12 = [v11 completionHandler];

    [(_ANEVirtualClient *)self queue];
    if (v12) {
      id v13 = {;
    }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __73___ANEVirtualClient_mapIOSurfacesWithModel_request_cacheInference_error___block_invoke;
      block[3] = &unk_1E6C1C460;
      v26[1] = &v28;
      block[4] = self;
      id v14 = &v25;
      id v25 = v10;
      size_t v15 = (id *)v26;
      v26[0] = v11;
      BOOL v27 = a5;
      dispatch_sync(v13, block);

      *((unsigned char *)v29 + 24) = 1;
    }
    else {
      uint64_t v17 = {;
    }
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __73___ANEVirtualClient_mapIOSurfacesWithModel_request_cacheInference_error___block_invoke_2;
      v20[3] = &unk_1E6C1C488;
      v22[1] = &v28;
      v20[4] = self;
      id v14 = &v21;
      id v21 = v10;
      size_t v15 = (id *)v22;
      id v18 = v11;
      BOOL v23 = a5;
      v22[0] = v18;
      v22[2] = a6;
      dispatch_sync(v17, v20);
    }
    BOOL v16 = *((unsigned char *)v29 + 24) != 0;
  }
  else
  {
    BOOL v16 = 0;
  }
  _Block_object_dispose(&v28, 8);

  return v16;
}

- (BOOL)doMapIOSurfacesWithModel:(id)a3 request:(id)a4 cacheInference:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  uint64_t v165 = *MEMORY[0x1E4F143B8];
  id v93 = a3;
  id v94 = a4;
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
    -[_ANEVirtualClient doMapIOSurfacesWithModel:request:cacheInference:error:].cold.6();
  }
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
    -[_ANEVirtualClient doMapIOSurfacesWithModel:request:cacheInference:error:].cold.6();
  }
  BOOL v8 = gLogger;
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
    -[_ANEVirtualClient doMapIOSurfacesWithModel:request:cacheInference:error:].cold.5(v6, v8, v9, v10, v11, v12, v13, v14);
  }
  bzero(v115, 0x1728uLL);
  [(_ANEVirtualClient *)self copyModel:v93 options:MEMORY[0x1E4F1CC08] vmData:v115];
  [(_ANEVirtualClient *)self copyErrorValue:v115];
  uint64_t v118 = objc_msgSend(v93, "string_id");
  uint64_t v119 = [v93 programHandle];
  uint64_t v120 = [v93 intermediateBufferHandle];
  char v121 = [v93 queueDepth];
  int v124 = [v93 perfStatsMask];
  BOOL v122 = v6;
  size_t v15 = gLogger;
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67112192;
    *(_DWORD *)v148 = v117[4];
    *(_WORD *)&v148[4] = 1024;
    *(_DWORD *)&v148[6] = v117[5];
    LOWORD(v149) = 1024;
    *(_DWORD *)((char *)&v149 + 2) = v117[6];
    HIWORD(v149) = 1024;
    *(_DWORD *)CFStringRef v150 = v117[7];
    *(_WORD *)&v150[4] = 2048;
    *(void *)&v150[6] = v118;
    *(_WORD *)&v150[14] = 2048;
    *(void *)&v150[16] = v119;
    __int16 v151 = 2048;
    uint64_t v152 = v120;
    __int16 v153 = 1024;
    int v154 = v121;
    __int16 v155 = 1024;
    int v156 = v123;
    __int16 v157 = 1024;
    int v158 = v124;
    __int16 v159 = 1024;
    int v160 = v125;
    __int16 v161 = 1024;
    int v162 = v126;
    __int16 v163 = 1024;
    int v164 = v137;
    _os_log_debug_impl(&dword_1DB8AB000, v15, OS_LOG_TYPE_DEBUG, "ANEVirtualClient mapIOSurfacesWithModel: virtualANEModel.ioSIDModelNet=%u virtualANEModel.ioSIDModelShape=%u virtualANEModel.ioSIDModelWeight=%u virtualANEModel.ioSIDKey=%u virtualANEModel.string_id=%lld virtualANEModel.programHandle=%lld virtualANEModel.intermediateBufferHandle=%lld virtualANEModel.queueDepth=%d virtualANEModel.ioSIDModelAttributes=%u virtualANEModel.perfStatsMask=%u virtualANEModel.qos=%u virtualANEModel.ioSIDOptions=%u virtualANEModel.ioSIDErrorValue=%u", buf, 0x5Cu);
  }
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  BOOL v16 = [v94 inputArray];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v111 objects:v146 count:16];
  if (v17)
  {
    int v18 = 0;
    uint64_t v19 = *(void *)v112;
    do
    {
      uint64_t v20 = 0;
      int v21 = v18;
      do
      {
        if (*(void *)v112 != v19) {
          objc_enumerationMutation(v16);
        }
        IOSurfaceID ID = IOSurfaceGetID((IOSurfaceRef)[*(id *)(*((void *)&v111 + 1) + 8 * v20) ioSurface]);
        v127[(v21 + v20)] = ID;
        BOOL v23 = gLogger;
        if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v148 = ID;
          _os_log_debug_impl(&dword_1DB8AB000, v23, OS_LOG_TYPE_DEBUG, "ANEVirtualClient mapIOSurfacesWithModel request1 ioSID: %u", buf, 8u);
        }
        ++v20;
      }
      while (v17 != v20);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v111 objects:v146 count:16];
      int v18 = v21 + v20;
    }
    while (v17);
    int v24 = v21 + v20;
  }
  else
  {
    int v24 = 0;
  }

  int v133 = v24;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v25 = [v94 inputIndexArray];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v107 objects:v145 count:16];
  if (v26)
  {
    int v27 = 0;
    uint64_t v28 = *(void *)v108;
    do
    {
      uint64_t v29 = 0;
      int v30 = v27;
      do
      {
        if (*(void *)v108 != v28) {
          objc_enumerationMutation(v25);
        }
        char v31 = *(void **)(*((void *)&v107 + 1) + 8 * v29);
        v127[(v30 + v29) + 64] = [v31 unsignedIntValue];
        id v32 = (id)gLogger;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v33 = [v31 unsignedLongLongValue];
          *(_DWORD *)buf = 134217984;
          *(void *)v148 = v33;
          _os_log_debug_impl(&dword_1DB8AB000, v32, OS_LOG_TYPE_DEBUG, "ANEVirtualClient mapIOSurfacesWithModel request2 ioSID: %llu", buf, 0xCu);
        }

        ++v29;
      }
      while (v26 != v29);
      uint64_t v26 = [v25 countByEnumeratingWithState:&v107 objects:v145 count:16];
      int v27 = v30 + v29;
    }
    while (v26);
    int v34 = v30 + v29;
  }
  else
  {
    int v34 = 0;
  }

  int v134 = v34;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  uint64_t v35 = [v94 outputArray];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v103 objects:v144 count:16];
  if (v36)
  {
    int v37 = 0;
    uint64_t v38 = *(void *)v104;
    do
    {
      uint64_t v39 = 0;
      int v40 = v37;
      do
      {
        if (*(void *)v104 != v38) {
          objc_enumerationMutation(v35);
        }
        IOSurfaceID v41 = IOSurfaceGetID((IOSurfaceRef)[*(id *)(*((void *)&v103 + 1) + 8 * v39) ioSurface]);
        v127[(v40 + v39) + 128] = v41;
        CFNumberRef v42 = gLogger;
        if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v148 = v41;
          _os_log_debug_impl(&dword_1DB8AB000, v42, OS_LOG_TYPE_DEBUG, "ANEVirtualClient mapIOSurfacesWithModel request3 ioSID: %u", buf, 8u);
        }
        ++v39;
      }
      while (v36 != v39);
      uint64_t v36 = [v35 countByEnumeratingWithState:&v103 objects:v144 count:16];
      int v37 = v40 + v39;
    }
    while (v36);
    int v43 = v40 + v39;
  }
  else
  {
    int v43 = 0;
  }

  int v135 = v43;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  int v44 = [v94 outputIndexArray];
  uint64_t v45 = [v44 countByEnumeratingWithState:&v99 objects:v143 count:16];
  if (v45)
  {
    int v46 = 0;
    uint64_t v47 = *(void *)v100;
    do
    {
      uint64_t v48 = 0;
      int v49 = v46;
      do
      {
        if (*(void *)v100 != v47) {
          objc_enumerationMutation(v44);
        }
        uint64_t v50 = *(void **)(*((void *)&v99 + 1) + 8 * v48);
        v127[(v49 + v48) + 192] = [v50 unsignedIntValue];
        unsigned int v51 = (id)gLogger;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v52 = [v50 unsignedLongLongValue];
          *(_DWORD *)buf = 134217984;
          *(void *)v148 = v52;
          _os_log_debug_impl(&dword_1DB8AB000, v51, OS_LOG_TYPE_DEBUG, "ANEVirtualClient mapIOSurfacesWithModel request4 ioSID: %llu", buf, 0xCu);
        }

        ++v48;
      }
      while (v45 != v48);
      uint64_t v45 = [v44 countByEnumeratingWithState:&v99 objects:v143 count:16];
      int v46 = v49 + v48;
    }
    while (v45);
    int v53 = v49 + v48;
  }
  else
  {
    int v53 = 0;
  }

  int v136 = v53;
  id v54 = (id)gLogger;
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
  {
    CFNumberRef v82 = [v94 inputArray];
    uint64_t v83 = [v82 count];
    uint64_t v84 = [v94 inputIndexArray];
    uint64_t v85 = [v84 count];
    __int16 v86 = [v94 outputArray];
    uint64_t v87 = [v86 count];
    uint64_t v88 = [v94 outputIndexArray];
    uint64_t v89 = [v88 count];
    *(_DWORD *)buf = 134218752;
    *(void *)v148 = v83;
    *(_WORD *)&v148[8] = 2048;
    uint64_t v149 = v85;
    *(_WORD *)CFStringRef v150 = 2048;
    *(void *)&v150[2] = v87;
    *(_WORD *)&v150[10] = 2048;
    *(void *)&v150[12] = v89;
    _os_log_debug_impl(&dword_1DB8AB000, v54, OS_LOG_TYPE_DEBUG, "ANEVirtualClient mapIOSurfacesWithModel: request.inputArray %lu request.inputIndexArray %lu request.outputArray %lu request.outputIndexArray %lu", buf, 0x2Au);
  }
  IOSurfaceID v55 = [v94 weightsBuffer];
  BOOL v56 = [v55 ioSurface] == 0;

  if (v56)
  {
    IOSurfaceID v128 = 0;
  }
  else
  {
    CFAllocatorRef v57 = [v94 weightsBuffer];
    IOSurfaceID v58 = IOSurfaceGetID((IOSurfaceRef)[v57 ioSurface]);

    IOSurfaceID v128 = v58;
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
      -[_ANEVirtualClient doMapIOSurfacesWithModel:request:cacheInference:error:].cold.4();
    }
  }
  BOOL v59 = [v94 procedureIndex];
  uint64_t v129 = [v59 unsignedLongLongValue];

  uint64_t v60 = [v94 transactionHandle];
  uint64_t v130 = [v60 unsignedLongLongValue];

  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  uint64_t v61 = [v94 perfStatsArray];
  uint64_t v62 = [v61 countByEnumeratingWithState:&v95 objects:v142 count:16];
  if (!v62)
  {

LABEL_73:
    int v132 = 0;
    goto LABEL_74;
  }
  int v63 = 0;
  uint64_t v64 = *(void *)v96;
  do
  {
    uint64_t v65 = 0;
    int v66 = v63;
    do
    {
      if (*(void *)v96 != v64) {
        objc_enumerationMutation(v61);
      }
      CFNumberRef v67 = *(void **)(*((void *)&v95 + 1) + 8 * v65);
      id v68 = [v67 stats];
      IOSurfaceID v69 = IOSurfaceGetID((IOSurfaceRef)[v68 ioSurface]);

      v131[(v66 + v65)] = v69;
      v131[(v66 + v65) + 64] = [v67 statType];
      int v132 = v66 + v65 + 1;
      CFNumberRef v70 = gLogger;
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v148 = v69;
        _os_log_debug_impl(&dword_1DB8AB000, v70, OS_LOG_TYPE_DEBUG, "ANEVirtualClient mapIOSurfacesWithModel request6 ioSID: %u", buf, 8u);
      }
      uint64_t v71 = (id)gLogger;
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v72 = [v67 statType];
        *(_DWORD *)buf = 134217984;
        *(void *)v148 = v72;
        _os_log_debug_impl(&dword_1DB8AB000, v71, OS_LOG_TYPE_DEBUG, "ANEVirtualClient mapIOSurfacesWithModel request7 ioSID: %ld", buf, 0xCu);
      }

      ++v65;
    }
    while (v62 != v65);
    uint64_t v62 = [v61 countByEnumeratingWithState:&v95 objects:v142 count:16];
    int v63 = v66 + v65;
  }
  while (v62);

  if (!(v66 + v65)) {
    goto LABEL_73;
  }
LABEL_74:
  uint64_t v138 = 0;
  IOSurfaceID v139 = 0;
  uint64_t v140 = 0;
  uint64_t v73 = (void *)MEMORY[0x1E4F1C9E8];
  __int16 v74 = [NSNumber numberWithUnsignedLong:4096];
  objc_msgSend(v73, "dictionaryWithObjectsAndKeys:", v74, *MEMORY[0x1E4F2EFB8], 0);
  CFDictionaryRef v75 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  int v76 = IOSurfaceCreate(v75);
  IOSurfaceRef buffer = v76;
  if (v76)
  {
    IOSurfaceLock(v76, 0, 0);
    IOSurfaceID v139 = IOSurfaceGetID(buffer);
    uint64_t v77 = (id)gLogger;
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient doMapIOSurfacesWithModel:request:cacheInference:error:]();
    }

    IOSurfaceUnlock(buffer, 0, 0);
    [v94 sharedEvents];

    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
      -[_ANEVirtualClient doMapIOSurfacesWithModel:request:cacheInference:error:]();
    }
    BOOL v78 = [(_ANEVirtualClient *)self callIOUserClient:13 inParams:v117 outParams:&v141];
    [(_ANEVirtualClient *)self updateError:v115 error:a6];
    CFNumberRef v79 = [(_ANEVirtualClient *)self updatePerformanceStats:v115];
    [v94 setPerfStats:v79];

    [(_ANEVirtualClient *)self releaseIOSurfaces:v115];
  }
  else
  {
    __int16 v80 = (id)gLogger;
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient doMapIOSurfacesWithModel:request:cacheInference:error:]();
    }

    BOOL v78 = 0;
  }

  return v78;
}

- (void)copyModel:(id)a3 options:(id)a4 vmData:(VMData *)a5
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v90 = a4;
  long long v101 = a5;
  long long v102 = v7;
  if (a5)
  {
    BOOL v8 = [v7 modelURL];
    uint64_t v9 = [v8 path];
    uint64_t v10 = [v9 lastPathComponent];

    __int16 v86 = v10;
    long long v104 = [v10 componentsSeparatedByString:@"."];
    uint64_t v88 = [v104 lastObject];
    uint64_t v11 = [v102 modelURL];
    long long v99 = [v11 path];

    if ([v88 isEqual:@"hwx"])
    {
      uint64_t v12 = (id)gLogger;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient copyModel:options:vmData:].cold.6();
      }

      uint64_t v13 = [v99 lastPathComponent];
      uint64_t v14 = [v99 stringByReplacingOccurrencesOfString:v13 withString:&stru_1F35E5710];

      size_t v15 = (id)gLogger;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient copyModel:options:vmData:].cold.5();
      }

      long long v99 = (void *)v14;
    }
    BOOL v16 = (id)gLogger;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient copyModel:options:vmData:].cold.4();
    }

    uint64_t v17 = v99;
    if ([v88 isEqual:@"net"])
    {
      int v18 = objc_opt_new();
      for (unint64_t i = 0; i < [v104 count] - 1; ++i)
      {
        uint64_t v20 = [v104 objectAtIndexedSubscript:i];
        [v18 appendString:v20];

        [v18 appendString:@"."];
      }
      if ([v18 length])
      {
        uint64_t v23 = [[NSString alloc] initWithFormat:@"%@net", v18];
        uint64_t v24 = [[NSString alloc] initWithFormat:@"%@shape", v18];
        uint64_t v89 = [(_ANEVirtualClient *)self readWeightFilename:v99];
        uint64_t v81 = (__CFString *)v23;
        uint64_t v83 = (__CFString *)v24;
        id v25 = [v99 lastPathComponent];
        uint64_t v26 = [v99 stringByReplacingOccurrencesOfString:v25 withString:&stru_1F35E5710];

        if (v89)
        {
          int v27 = (id)gLogger;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            NSStringFromSelector(a2);
            objc_claimAutoreleasedReturnValue();
            -[_ANEVirtualClient copyModel:options:vmData:]();
          }

          uint64_t v28 = (void *)[[NSString alloc] initWithFormat:@"%@/%@", v26, v89];
          uint64_t v29 = [MEMORY[0x1E4F28CB8] defaultManager];
          int v30 = [v29 attributesOfItemAtPath:v28 error:0];

          char v31 = [v30 fileType];
          LODWORD(v29) = v31 == (void *)*MEMORY[0x1E4F283D0];

          if (v29)
          {
            id v32 = (id)gLogger;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            {
              NSStringFromSelector(a2);
              objc_claimAutoreleasedReturnValue();
              -[_ANEVirtualClient copyModel:options:vmData:]();
            }

            uint64_t v33 = [MEMORY[0x1E4F28CB8] defaultManager];
            int v34 = [v33 destinationOfSymbolicLinkAtPath:v28 error:0];

            uint64_t v35 = [v34 lastPathComponent];

            uint64_t v89 = (__CFString *)v35;
          }
        }
        else
        {
          uint64_t v89 = @"model.espresso.weights";
        }
        uint64_t v36 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v81 requiringSecureCoding:1 error:0];
        int v37 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v83 requiringSecureCoding:1 error:0];
        uint64_t v38 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v89 requiringSecureCoding:1 error:0];
        v101->var12 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v36, [v36 length], &v101->var17.var54);
        v101->var13 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v37, [v37 length], &v101->var17.var56);
        v101->var14 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v38, [v38 length], &v101->var17.var58);
        v101->var17.var55 = [v36 length];
        v101->var17.var57 = [v37 length];
        v101->var17.var59 = [v38 length];
        uint64_t v39 = [v99 lastPathComponent];
        uint64_t v40 = [v99 stringByReplacingOccurrencesOfString:v39 withString:&stru_1F35E5710];

        IOSurfaceID v41 = (id)gLogger;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          int v76 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138413314;
          *(void *)long long v106 = v76;
          *(_WORD *)&v106[8] = 2112;
          *(void *)long long v107 = v40;
          *(_WORD *)&v107[8] = 2112;
          long long v108 = v81;
          __int16 v109 = 2112;
          long long v110 = v83;
          __int16 v111 = 2112;
          long long v112 = v89;
          _os_log_debug_impl(&dword_1DB8AB000, v41, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualClient: .net filepath=%@ : netname=%@ : shapename=%@ : weightname=%@ ", buf, 0x34u);
        }
        long long v99 = (void *)v40;
      }
      else
      {
        uint64_t v81 = @"model.espresso.net";
        uint64_t v83 = @"model.espresso.shape";
        uint64_t v89 = @"model.espresso.weights";
      }

      uint64_t v17 = v99;
      int v21 = v81;
      size_t v22 = v83;
    }
    else
    {
      int v21 = @"model.espresso.net";
      size_t v22 = @"model.espresso.shape";
      uint64_t v89 = @"model.espresso.weights";
    }
    long long v100 = v17;
    CFNumberRef v82 = v21;
    uint64_t v84 = v22;
    __int16 v80 = (void *)[[NSString alloc] initWithFormat:@"%@/%@", v17, v21];
    CFNumberRef v79 = (void *)[[NSString alloc] initWithFormat:@"%@/%@", v17, v22];
    BOOL v78 = (void *)[[NSString alloc] initWithFormat:@"%@/%@", v17, v89];
    uint64_t v77 = (void *)[[NSString alloc] initWithFormat:@"%@/net.plist", v17];
    long long v98 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v80];
    long long v96 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v79];
    long long v95 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v78];
    id v93 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v77];
    CFNumberRef v42 = (void *)MEMORY[0x1E4F28DB0];
    int v43 = [v102 key];
    uint64_t v44 = [v43 length];
    if (v44)
    {
      uint64_t v45 = [v102 key];
    }
    else
    {
      uint64_t v45 = v100;
    }
    id v94 = [v42 archivedDataWithRootObject:v45 requiringSecureCoding:1 error:0];
    if (v44) {

    }
    int v46 = (void *)MEMORY[0x1E4F28DB0];
    uint64_t v47 = [v102 modelAttributes];
    uint64_t v87 = [v46 archivedDataWithRootObject:v47 requiringSecureCoding:1 error:0];

    uint64_t v48 = (void *)MEMORY[0x1E4F28DB0];
    int v49 = [v102 modelURL];
    uint64_t v50 = [v49 path];
    long long v97 = [v48 archivedDataWithRootObject:v50 requiringSecureCoding:1 error:0];

    v101->var19 = 0;
    v101->var0 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v98, [v98 length], &v101->var17.var2);
    v101->var1 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v96, [v96 length], &v101->var17.var3);
    v101->var2 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v95, [v95 length], &v101->var17.var4);
    v101->var8 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v93, [v93 length], &v101->var17.var28);
    v101->var6 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v94, [v94 length], &v101->var17.var5);
    v101->var7 = [(_ANEVirtualClient *)self copyToIOSurface:v87 length:0x100000 ioSID:&v101->var17.var19];
    v101->var11 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v97, [v97 length], &v101->var17.var52);
    v101->var17.var61 = 0;
    v101->var17.var6 = [v98 length];
    v101->var17.var7 = [v96 length];
    v101->var17.var8 = [v95 length];
    v101->var17.var9 = [v94 length];
    v101->var17.var20 = [v87 length];
    v101->var17.var14 = objc_msgSend(v102, "string_id");
    v101->var17.var15 = [v102 programHandle];
    v101->var17.var16 = [v102 intermediateBufferHandle];
    v101->var17.var17 = [v102 queueDepth];
    v101->var17.var21 = [v102 perfStatsMask];
    v101->var17.var29 = [v93 length];
    v101->var17.var53 = [v97 length];
    unsigned int v51 = [v90 objectForKey:kANEFEspressoFileResourcesKey[0]];
    uint64_t v85 = v51;
    if ([v51 count])
    {
      uint64_t v52 = 0;
      int v53 = 0;
      for (unint64_t j = 0; j < [v51 count]; ++j)
      {
        IOSurfaceID v55 = [v51 objectAtIndexedSubscript:j];

        BOOL v56 = (id)gLogger;
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
        {
          IOSurfaceID v69 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          *(void *)long long v106 = v69;
          *(_WORD *)&v106[8] = 2112;
          *(void *)long long v107 = v55;
          _os_log_debug_impl(&dword_1DB8AB000, v56, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualClient: %@ \n", buf, 0x16u);
        }
        CFAllocatorRef v57 = [v55 componentsSeparatedByString:@"."];
        IOSurfaceID v58 = [v57 lastObject];
        if (([v58 isEqual:@"net"] & 1) == 0
          && ([v58 isEqual:@"shape"] & 1) == 0
          && ([v58 isEqual:@"weights"] & 1) == 0)
        {
          if (v53 >= 32)
          {
            BOOL v59 = (id)gLogger;
            if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(a2);
              id v74 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v75 = [v51 count];
              *(_DWORD *)buf = 138412802;
              *(void *)long long v106 = v74;
              *(_WORD *)&v106[8] = 2048;
              *(void *)long long v107 = v75;
              *(_WORD *)&v107[8] = 1024;
              LODWORD(v108) = 32;
              _os_log_error_impl(&dword_1DB8AB000, v59, OS_LOG_TYPE_ERROR, "%@: ANEVirtualClient: %lu execeed max number of reference expresso files %d \n", buf, 0x1Cu);
            }
          }
          int v92 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v55 requiringSecureCoding:1 error:0];
          uint64_t v60 = &v101->var0 + v53;
          v60[47] = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v92, [v92 length], &v101->var17.var12[v53]);
          v60[151] = (__IOSurface *)[v92 length];
          uint64_t v61 = gLogger;
          if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
          {
            unsigned int v70 = v101->var17.var12[v53];
            uint64_t v71 = v60[151];
            *(_DWORD *)buf = 67109632;
            *(_DWORD *)long long v106 = v53;
            *(_WORD *)&v106[4] = 1024;
            *(_DWORD *)&v106[6] = v70;
            *(_WORD *)long long v107 = 2048;
            *(void *)&v107[2] = v71;
            _os_log_debug_impl(&dword_1DB8AB000, v61, OS_LOG_TYPE_DEBUG, "ioSModelEspressoRefFileName[%d] surface ID: %d length: %llu\n", buf, 0x18u);
          }
          uint64_t v62 = (void *)[[NSString alloc] initWithFormat:@"%@/%@", v100, v55];
          int v63 = gLogger;
          if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)long long v106 = v62;
            _os_log_debug_impl(&dword_1DB8AB000, v63, OS_LOG_TYPE_DEBUG, " fileEspresso %@\n", buf, 0xCu);
          }
          int v64 = v53;
          uint64_t v65 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v62];
          int v66 = &v101->var17.var10[v53];
          CFNumberRef v67 = &v101->var0 + v53;
          v67[15] = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v65, [v65 length], v66);
          v67[103] = (__IOSurface *)[v65 length];
          id v68 = gLogger;
          if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
          {
            unsigned int v72 = *v66;
            uint64_t v73 = v67[103];
            *(_DWORD *)buf = 67109632;
            *(_DWORD *)long long v106 = v64;
            *(_WORD *)&v106[4] = 1024;
            *(_DWORD *)&v106[6] = v72;
            *(_WORD *)long long v107 = 2048;
            *(void *)&v107[2] = v73;
            _os_log_debug_impl(&dword_1DB8AB000, v68, OS_LOG_TYPE_DEBUG, "ioSIDModelEspressoRefFile[%d] surface ID: %d length: %llu\n", buf, 0x18u);
          }

          unsigned int v51 = v85;
          int v53 = v64 + 1;
        }

        uint64_t v52 = v55;
      }
    }
  }
  else
  {
    __int16 v86 = (id)gLogger;
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient copyModel:options:vmData:]();
    }
  }
}

- (BOOL)copyFilesInDirectoryToIOSurfaces:(id)a3 ioSurfaceRefs:(__CFArray *)a4 ioSurfaceSizes:(id)a5 fileNames:(id)a6
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v48 = a5;
  id v49 = a6;
  IOSurfaceID v55 = v8;
  if ([v8 hasSuffix:@"/"])
  {
    uint64_t v9 = objc_msgSend(v8, "substringToIndex:", objc_msgSend(v8, "length") - 1);

    IOSurfaceID v55 = (void *)v9;
  }
  [MEMORY[0x1E4F28CB8] defaultManager];
  id v54 = v64 = 0;
  [v54 fileExistsAtPath:v55 isDirectory:&v64];
  if (!v64)
  {
    uint64_t v40 = gLogger;
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
      -[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:](v40, v41, v42);
    }
    BOOL v43 = 0;
    goto LABEL_61;
  }
  uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v63 = 0;
  uint64_t v47 = [v10 contentsOfDirectoryAtPath:v55 error:&v63];
  id v51 = v63;

  if (v51 || !v47)
  {
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
      -[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:]();
    }
LABEL_55:
    BOOL v43 = 0;
    goto LABEL_60;
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  obunint64_t j = v47;
  uint64_t v11 = [obj countByEnumeratingWithState:&v59 objects:v71 count:16];
  if (!v11)
  {

    id v51 = 0;
    goto LABEL_57;
  }
  unsigned int v12 = 0;
  id v51 = 0;
  char v53 = 1;
  uint64_t v13 = *(void *)v60;
  do
  {
    uint64_t v14 = 0;
    do
    {
      if (*(void *)v60 != v13) {
        objc_enumerationMutation(obj);
      }
      size_t v15 = *(void **)(*((void *)&v59 + 1) + 8 * v14);
      BOOL v16 = (void *)MEMORY[0x1E0193890]();
      if (v12 < 0x20)
      {
        uint64_t v19 = [v55 stringByAppendingPathComponent:v15];
        char v58 = 0;
        if ([v54 fileExistsAtPath:v19 isDirectory:&v58])
        {
          uint64_t v20 = gLogger;
          if (v58)
          {
            if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              int v66 = "-[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:]";
              __int16 v67 = 2112;
              id v68 = v19;
              int v21 = v20;
              size_t v22 = "%s: Sub-directory found at location=%@ cannot be traversed (unsupported), SKIPPING";
              uint32_t v23 = 22;
              goto LABEL_37;
            }
            goto LABEL_20;
          }
          if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            int v66 = "-[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:]";
            __int16 v67 = 2112;
            id v68 = v19;
            _os_log_debug_impl(&dword_1DB8AB000, v20, OS_LOG_TYPE_DEBUG, "%s: Copying %@", buf, 0x16u);
          }

          id v25 = objc_alloc(MEMORY[0x1E4F1C9B8]);
          id v57 = 0;
          uint64_t v26 = (void *)[v25 initWithContentsOfFile:v19 options:0 error:&v57];
          id v51 = v57;
          if (v26)
          {
            int v56 = 0;
            uint64_t v27 = [v26 length];
            uint64_t v28 = [(_ANEVirtualClient *)self copyToIOSurface:v26 length:v27 ioSID:&v56];
            if (v28)
            {
              if (v56)
              {
                CFArrayAppendValue(a4, v28);
                uint64_t v29 = [NSNumber numberWithUnsignedInteger:v27];
                [v48 addObject:v29];

                [v49 addObject:v15];
                CFRelease(v28);
                int v18 = 0;
                ++v12;
                goto LABEL_43;
              }
              uint64_t v35 = gLogger;
              if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                int v66 = "-[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:]";
                __int16 v67 = 2112;
                id v68 = v19;
                char v31 = v35;
                id v32 = "%s: FAILED to get IOSID for %@";
LABEL_40:
                uint32_t v33 = 22;
LABEL_41:
                _os_log_error_impl(&dword_1DB8AB000, v31, OS_LOG_TYPE_ERROR, v32, buf, v33);
              }
            }
            else
            {
              uint64_t v34 = gLogger;
              if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                int v66 = "-[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:]";
                __int16 v67 = 2112;
                id v68 = v19;
                char v31 = v34;
                id v32 = "%s: FAILED to write data to IOSurface for %@";
                goto LABEL_40;
              }
            }
          }
          else
          {
            uint64_t v30 = gLogger;
            if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              int v66 = "-[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:]";
              __int16 v67 = 2112;
              id v68 = v19;
              __int16 v69 = 2112;
              id v70 = v51;
              char v31 = v30;
              id v32 = "%s: Could not extract data from %@ with error %@, copy FAILED";
              uint32_t v33 = 32;
              goto LABEL_41;
            }
          }
          char v53 = 0;
          int v18 = 2;
LABEL_43:
        }
        else
        {
          uint64_t v24 = gLogger;
          if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            int v66 = "-[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:]";
            __int16 v67 = 2112;
            id v68 = v15;
            __int16 v69 = 2112;
            id v70 = v19;
            int v21 = v24;
            size_t v22 = "%s: file=%@ does not exists at location=%@, SKIPPING";
            uint32_t v23 = 32;
LABEL_37:
            _os_log_error_impl(&dword_1DB8AB000, v21, OS_LOG_TYPE_ERROR, v22, buf, v23);
          }
LABEL_20:
          int v18 = 3;
        }

        goto LABEL_22;
      }
      uint64_t v17 = gLogger;
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        int v66 = "-[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:]";
        __int16 v67 = 1024;
        LODWORD(v68) = 32;
        _os_log_error_impl(&dword_1DB8AB000, v17, OS_LOG_TYPE_ERROR, "%s: max file count reached %d, copy FAILED", buf, 0x12u);
      }
      char v53 = 0;
      int v18 = 2;
LABEL_22:
      if (v18 != 3 && v18) {
        goto LABEL_45;
      }
      ++v14;
    }
    while (v11 != v14);
    uint64_t v36 = [obj countByEnumeratingWithState:&v59 objects:v71 count:16];
    uint64_t v11 = v36;
  }
  while (v36);
LABEL_45:

  if ((v53 & 1) == 0)
  {
    CFIndex Count = CFArrayGetCount(a4);
    if (Count >= 1)
    {
      for (CFIndex i = 0; i != Count; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(a4, i);
        CFRelease(ValueAtIndex);
      }
    }
    goto LABEL_55;
  }
LABEL_57:
  uint64_t v44 = (id)gLogger;
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
    -[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:]((uint64_t)buf, [v49 count], v44);
  }

  BOOL v43 = 1;
LABEL_60:

LABEL_61:
  return v43;
}

- (BOOL)copyAllModelFiles:(id)a3 dictionary:(__CFDictionary *)a4 ioSurfaceRefs:(__CFArray *)a5
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v71 = a3;
  if (!v71 || !a4 || !a5)
  {
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
      -[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:]();
    }
    char v70 = 0;
    goto LABEL_99;
  }
  id v5 = [v71 modelURL];
  id v74 = [v5 path];

  uint64_t v72 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
    -[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:]1();
  }
  char v88 = 0;
  BOOL v6 = &stru_1F35E5710;
  [v72 fileExistsAtPath:v74 isDirectory:&v88];
  if (v88)
  {
    int v75 = 0;
    goto LABEL_8;
  }
  int v46 = [v74 componentsSeparatedByString:@"/"];
  uint64_t v47 = [v46 lastObject];
  id v48 = [v47 componentsSeparatedByString:@"."];
  id v49 = [v48 lastObject];
  int v50 = [v49 isEqual:@"hwx"];
  char v51 = v50;
  if (v50)
  {
    uint64_t v52 = gLogger;
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
      -[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:].cold.7(v52);
    }
    int v53 = 0;
    uint64_t v73 = &stru_1F35E5710;
  }
  else
  {
    int v53 = [v74 containsString:@"/System"];
    if (v53)
    {
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
        -[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:]0();
      }
      id v54 = [v46 lastObject];
      IOSurfaceID v55 = [v54 componentsSeparatedByString:@"."];
      int v56 = (void *)[v55 mutableCopy];
      [v56 removeLastObject];
      uint64_t v73 = [v56 componentsJoinedByString:@"."];
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
        -[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:].cold.9();
      }
    }
    else
    {
      uint64_t v73 = &stru_1F35E5710;
    }
    char v58 = (void *)[v46 mutableCopy];
    [v58 removeLastObject];
    uint64_t v59 = [v58 componentsJoinedByString:@"/"];

    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
      -[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:].cold.8();
    }

    id v74 = (void *)v59;
  }

  if (v51)
  {
LABEL_96:
    char v70 = 0;
    goto LABEL_97;
  }
  if (v53)
  {
    BOOL v6 = v73;
    if (![(__CFString *)v73 length])
    {
      if (!os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
      {
        char v70 = 0;
        goto LABEL_98;
      }
      -[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:]();
      goto LABEL_96;
    }
    int v75 = 1;
  }
  else
  {
    int v75 = 0;
    BOOL v6 = v73;
  }
LABEL_8:
  uint64_t v73 = v6;
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v87 = 0;
  __int16 v67 = [v7 contentsOfDirectoryAtPath:v74 error:&v87];
  id v66 = v87;

  if (v66 || !v67)
  {
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
      -[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:].cold.6();
    }
LABEL_76:
    char v70 = 0;
    goto LABEL_90;
  }
  unsigned int v86 = 0;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  obunint64_t j = v67;
  uint64_t v8 = [obj countByEnumeratingWithState:&v82 objects:v94 count:16];
  if (!v8)
  {
    char v70 = 1;
    goto LABEL_84;
  }
  uint64_t v9 = *(void *)v83;
  CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  char v70 = 1;
  while (2)
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v83 != v9) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void **)(*((void *)&v82 + 1) + 8 * v10);
      unsigned int v12 = (void *)MEMORY[0x1E0193890]();
      if (v86 < 0x20)
      {
        if (v75 && ![v11 containsString:v73])
        {
          int v14 = 3;
          goto LABEL_35;
        }
        size_t v15 = [v11 componentsSeparatedByString:@"."];
        BOOL v16 = [v15 lastObject];
        if ([v16 isEqual:@"hwx"])
        {
          uint64_t v17 = gLogger;
          if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
            -[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:].cold.5(&v80, v81, v17);
          }
          int v14 = 3;
          goto LABEL_34;
        }
        int v18 = (void *)[[NSString alloc] initWithFormat:@"%@/%@", v74, v11];
        unsigned __int8 v79 = 0;
        if (([v72 fileExistsAtPath:v18 isDirectory:&v79] & 1) == 0)
        {
          size_t v22 = gLogger;
          if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v11;
            __int16 v90 = 2112;
            *(void *)v91 = v18;
            _os_log_error_impl(&dword_1DB8AB000, v22, OS_LOG_TYPE_ERROR, "copyAllModelFiles file=%@ does not exist at location=%@, SKIPPING\n", buf, 0x16u);
          }
          goto LABEL_32;
        }
        int v19 = v79;
        uint64_t v20 = gLogger;
        BOOL v21 = os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG);
        if (v19)
        {
          if (v21)
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v18;
            _os_log_debug_impl(&dword_1DB8AB000, v20, OS_LOG_TYPE_DEBUG, "copyAllModelFiles Sub-directory traversal unsupported, SKIPPING %@", buf, 0xCu);
          }
LABEL_32:
          int v14 = 3;
LABEL_33:

LABEL_34:
          goto LABEL_35;
        }
        if (v21)
        {
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v11;
          __int16 v90 = 2112;
          *(void *)v91 = v74;
          *(_WORD *)&v91[8] = 2112;
          *(void *)&v91[10] = v18;
          _os_log_debug_impl(&dword_1DB8AB000, v20, OS_LOG_TYPE_DEBUG, "copyAllModelFiles file=%@ directoryPath=%@ fullFilePath=%@", buf, 0x20u);
        }
        uint32_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v18];
        char v64 = v23;
        if (!v23)
        {
          uint64_t v27 = gLogger;
          if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v11;
            _os_log_debug_impl(&dword_1DB8AB000, v27, OS_LOG_TYPE_DEBUG, "copyAllModelFiles could not get data for file=%@, SKIPPING", buf, 0xCu);
          }
          int v14 = 3;
          goto LABEL_61;
        }
        int valuePtr = 0;
        uint64_t v24 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v23, [v23 length], &valuePtr);
        if (v24)
        {
          if (valuePtr)
          {
            CFArrayAppendValue(a5, v24);
            if ([v16 isEqual:@"hwx"])
            {
              CFNumberRef v25 = CFNumberCreate(allocator, kCFNumberSInt32Type, &valuePtr);
              CFDictionarySetValue(a4, @"ioSIDModelHWX", v25);
              CFRelease(v25);
              CFDictionarySetValue(a4, @"hwxFileName", v11);
              *(void *)buf = 0;
              *(void *)buf = [v64 length];
              CFNumberRef v26 = CFNumberCreate(allocator, kCFNumberSInt64Type, buf);
              CFDictionarySetValue(a4, @"modelHWXLength", v26);
              CFRelease(v26);
            }
            else
            {
              uint64_t v62 = v86;
              CFStringRef v32 = CFStringCreateWithFormat(0, 0, @"fileIOSID%u", v86);
              CFNumberRef v33 = CFNumberCreate(allocator, kCFNumberSInt32Type, &valuePtr);
              CFDictionarySetValue(a4, v32, v33);
              CFRelease(v33);
              CFRelease(v32);
              CFStringRef v34 = CFStringCreateWithFormat(0, 0, @"fileName%u", v62);
              CFDictionarySetValue(a4, v34, v11);
              CFRelease(v34);
              CFStringRef v35 = CFStringCreateWithFormat(0, 0, @"fileLength%u", v62);
              uint64_t v77 = 0;
              uint64_t v77 = [v64 length];
              CFNumberRef v36 = CFNumberCreate(allocator, kCFNumberSInt64Type, &v77);
              CFDictionarySetValue(a4, v35, v36);
              CFRelease(v36);
              CFRelease(v35);
              int v37 = [MEMORY[0x1E4F28CB8] defaultManager];
              uint64_t v38 = [v37 attributesOfItemAtPath:v18 error:0];
              uint64_t v39 = [v38 fileModificationDate];

              if (v39)
              {
                uint64_t v40 = NSNumber;
                [v39 timeIntervalSince1970];
                long long v61 = objc_msgSend(v40, "numberWithDouble:");
                uint64_t v41 = (const void *)[v61 stringValue];
                CFStringRef v42 = CFStringCreateWithFormat(0, 0, @"FileLastModificationTimeStamp%u", v62);
                CFDictionarySetValue(a4, v42, v41);
                CFRelease(v42);
                BOOL v43 = gLogger;
                if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315650;
                  *(void *)&uint8_t buf[4] = "-[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:]";
                  __int16 v90 = 1024;
                  *(_DWORD *)v91 = v62;
                  *(_WORD *)&v91[4] = 2112;
                  *(void *)&v91[6] = v41;
                  _os_log_debug_impl(&dword_1DB8AB000, v43, OS_LOG_TYPE_DEBUG, "%s fileCounter:%u lastModificationTimeStampString:%@", buf, 0x1Cu);
                }
              }
              else
              {
                uint64_t v44 = gLogger;
                if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  *(void *)&uint8_t buf[4] = "-[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:]";
                  __int16 v90 = 2112;
                  *(void *)v91 = v18;
                  _os_log_error_impl(&dword_1DB8AB000, v44, OS_LOG_TYPE_ERROR, "%s lastModificationDate not available for %@", buf, 0x16u);
                }
              }
              unsigned int v86 = v62 + 1;
            }
            int v14 = 0;
            goto LABEL_61;
          }
          uint64_t v31 = gLogger;
          if (!os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
          {
LABEL_52:
            char v70 = 0;
            int v14 = 2;
LABEL_61:

            goto LABEL_33;
          }
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v11;
          uint64_t v29 = v31;
          uint64_t v30 = "copyAllModelFiles failed to IOSurfaceID for file=%@\n";
        }
        else
        {
          uint64_t v28 = gLogger;
          if (!os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
            goto LABEL_52;
          }
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v11;
          uint64_t v29 = v28;
          uint64_t v30 = "copyAllModelFiles failed to write file data to IOSurface for file=%@\n";
        }
        _os_log_error_impl(&dword_1DB8AB000, v29, OS_LOG_TYPE_ERROR, v30, buf, 0xCu);
        goto LABEL_52;
      }
      uint64_t v13 = gLogger;
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
        -[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:].cold.4(v92, &v93, v13);
      }
      int v14 = 1;
LABEL_35:
      if (v14 != 3 && v14)
      {

        if (v14 == 2) {
          goto LABEL_85;
        }
        goto LABEL_76;
      }
      ++v10;
    }
    while (v8 != v10);
    uint64_t v45 = [obj countByEnumeratingWithState:&v82 objects:v94 count:16];
    uint64_t v8 = v45;
    if (v45) {
      continue;
    }
    break;
  }
LABEL_84:

LABEL_85:
  if ((v70 & 1) != 0 && v86)
  {
    CFNumberRef v57 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &v86);
    CFDictionarySetValue(a4, @"numModelFiles", v57);
    CFRelease(v57);
    char v70 = 1;
  }
  else if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
  {
    -[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:]();
  }
LABEL_90:

LABEL_97:
  BOOL v6 = v73;
LABEL_98:

LABEL_99:
  return v70 & 1;
}

+ (void)freeModelFileIOSurfaces:(__CFArray *)a3
{
  CFIndex Count = CFArrayGetCount(a3);
  if (Count >= 1)
  {
    CFIndex v5 = Count;
    for (CFIndex i = 0; i != v5; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a3, i);
      CFRelease(ValueAtIndex);
    }
  }
}

- (void)copyModelMetaData:(id)a3 options:(id)a4 dictionary:(__CFDictionary *)a5 vmData:(VMData *)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v51 = a4;
  if (a6)
  {
    unsigned int v12 = [v11 key];
    aSelector = a2;
    uint64_t v13 = [v12 length];

    int v14 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
    if (v13)
    {
      size_t v15 = (void *)MEMORY[0x1E4F28DB0];
      BOOL v16 = [v11 key];
      uint64_t v17 = [v15 archivedDataWithRootObject:v16 requiringSecureCoding:1 error:0];

      a6->var6 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v17, [v17 length], &a6->var17.var5);
      CFAllocatorRef v18 = *v14;
      CFNumberRef v19 = CFNumberCreate(*v14, kCFNumberSInt32Type, &a6->var17.var5);
      CFDictionarySetValue(a5, @"ioSIDKey", v19);
      CFRelease(v19);
      a6->var17.var9 = [v17 length];
      CFNumberRef v20 = CFNumberCreate(v18, kCFNumberSInt64Type, &a6->var17.var9);
      CFDictionarySetValue(a5, @"keyLength", v20);
      CFRelease(v20);
    }
    BOOL v21 = (void *)MEMORY[0x1E4F28DB0];
    size_t v22 = [v11 modelAttributes];
    uint32_t v23 = [v21 archivedDataWithRootObject:v22 requiringSecureCoding:1 error:0];

    a6->var7 = [(_ANEVirtualClient *)self copyToIOSurface:v23 length:0x100000 ioSID:&a6->var17.var19];
    CFAllocatorRef v24 = *v14;
    CFNumberRef v25 = CFNumberCreate(v24, kCFNumberSInt32Type, &a6->var17.var19);
    CFDictionarySetValue(a5, @"ioSIDModelAttributes", v25);
    CFRelease(v25);
    a6->var17.var20 = [v23 length];
    CFNumberRef v26 = CFNumberCreate(v24, kCFNumberSInt64Type, &a6->var17.var20);
    CFDictionarySetValue(a5, @"modelAttributeLength", v26);
    CFRelease(v26);
    uint64_t v27 = (void *)MEMORY[0x1E4F28DB0];
    uint64_t v28 = [v11 modelURL];
    uint64_t v29 = [v28 path];
    uint64_t v30 = [v27 archivedDataWithRootObject:v29 requiringSecureCoding:1 error:0];

    a6->var11 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v30, [v30 length], &a6->var17.var52);
    CFNumberRef v31 = CFNumberCreate(v24, kCFNumberSInt32Type, &a6->var17.var52);
    CFDictionarySetValue(a5, @"ioSIDModelInputPath", v31);
    CFRelease(v31);
    a6->var17.var53 = [v30 length];
    CFNumberRef v32 = CFNumberCreate(v24, kCFNumberSInt64Type, &a6->var17.var53);
    CFDictionarySetValue(a5, @"modelInputPathLength", v32);
    CFRelease(v32);
    CFNumberRef v33 = [v11 sourceURL];

    if (v33)
    {
      CFStringRef v34 = (id)gLogger;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        CFStringRef v35 = NSStringFromSelector(aSelector);
        CFNumberRef v36 = [v11 sourceURL];
        -[_ANEVirtualClient copyModelMetaData:options:dictionary:vmData:](v35, v36, (uint64_t)v54);
      }

      int v37 = (void *)MEMORY[0x1E4F28DB0];
      uint64_t v38 = [v11 sourceURL];
      uint64_t v39 = [v38 path];
      uint64_t v40 = [v37 archivedDataWithRootObject:v39 requiringSecureCoding:1 error:0];

      int valuePtr = 0;
      a6->var20 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v40, [v40 length], &valuePtr);
      CFNumberRef v41 = CFNumberCreate(v24, kCFNumberSInt32Type, &valuePtr);
      CFDictionarySetValue(a5, @"ioSIDModelSourceURLPath", v41);
      CFRelease(v41);
      uint64_t v52 = [v40 length];
      CFStringRef v42 = (id)gLogger;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(aSelector);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient copyModelMetaData:options:dictionary:vmData:]();
      }

      CFNumberRef v43 = CFNumberCreate(v24, kCFNumberSInt64Type, &v52);
      CFDictionarySetValue(a5, @"sourceURLPathLength", v43);
      CFRelease(v43);
    }
    uint64_t v52 = 0;
    uint64_t v52 = [v11 identifierSource];
    CFNumberRef v44 = CFNumberCreate(v24, kCFNumberSInt64Type, &v52);
    CFDictionarySetValue(a5, @"modelCacheURLIdentifierSource", v44);
    CFRelease(v44);
    a6->var17.var14 = objc_msgSend(v11, "string_id");
    CFNumberRef v45 = CFNumberCreate(v24, kCFNumberSInt64Type, &a6->var17.var14);
    CFDictionarySetValue(a5, @"string_id", v45);
    CFRelease(v45);
    a6->var17.var15 = [v11 programHandle];
    CFNumberRef v46 = CFNumberCreate(v24, kCFNumberSInt64Type, &a6->var17.var15);
    CFDictionarySetValue(a5, @"programHandle", v46);
    CFRelease(v46);
    a6->var17.var16 = [v11 intermediateBufferHandle];
    CFNumberRef v47 = CFNumberCreate(v24, kCFNumberSInt64Type, &a6->var17.var16);
    CFDictionarySetValue(a5, @"intermediateBufferHandle", v47);
    CFRelease(v47);
    a6->var17.var17 = [v11 queueDepth];
    CFNumberRef v48 = CFNumberCreate(v24, kCFNumberSInt8Type, &a6->var17.var17);
    CFDictionarySetValue(a5, @"queueDepth", v48);
    CFRelease(v48);
    a6->var17.var21 = [v11 perfStatsMask];
    CFNumberRef v49 = CFNumberCreate(v24, kCFNumberSInt32Type, &a6->var17.var21);
    CFDictionarySetValue(a5, @"perfStatsMask", v49);
    CFRelease(v49);
  }
  else
  {
    uint32_t v23 = (id)gLogger;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient copyModel:options:vmData:]();
    }
  }
}

- (id)readWeightFilename:(id)a3
{
  id v5 = a3;
  BOOL v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v5];
  if (v6)
  {
    id v7 = [(_ANEVirtualClient *)self doJsonParsingMatchWeightName:v6];
    if (v7)
    {
      uint64_t v8 = (id)gLogger;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient readWeightFilename:]();
      }
    }
    else
    {
      uint64_t v10 = [(_ANEVirtualClient *)self parallelDecompressedData:v6];
      uint64_t v11 = [(_ANEVirtualClient *)self doJsonParsingMatchWeightName:v10];

      id v7 = (__CFString *)v11;
    }
  }
  else
  {
    uint64_t v9 = (id)gLogger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient readWeightFilename:]();
    }

    id v7 = @"model.espresso.weights";
  }

  return v7;
}

- (id)doJsonParsingMatchWeightName:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v4 options:0 error:0];
  if (!v5)
  {
    id v7 = (id)gLogger;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient doJsonParsingMatchWeightName:]();
    }
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = (id)gLogger;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient doJsonParsingMatchWeightName:].cold.4();
    }
    goto LABEL_12;
  }
  BOOL v6 = [v5 objectForKeyedSubscript:@"storage"];
  id v7 = (id)gLogger;
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (!v6)
  {
    if (v8)
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient doJsonParsingMatchWeightName:]();
    }
LABEL_12:
    BOOL v6 = 0;
    goto LABEL_13;
  }
  if (v8)
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualClient doJsonParsingMatchWeightName:]();
  }
LABEL_13:

  return v6;
}

- (id)parallelDecompressedData:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (!v4
    || (unint64_t)[v4 length] < 0x1D
    || (id v6 = v5, v7 = (unsigned char *)[v6 bytes], v8 = v7, *v7 != 112)
    || v7[1] != 98
    || v7[2] != 122)
  {
    id v10 = 0;
    goto LABEL_11;
  }
  int v9 = (char)v7[3];
  if (v9 > 119)
  {
    if (v9 == 122)
    {
      compression_algorithm v12 = COMPRESSION_ZLIB;
    }
    else
    {
      if (v9 != 120) {
        goto LABEL_19;
      }
      compression_algorithm v12 = COMPRESSION_LZMA;
    }
  }
  else
  {
    if (v9 != 52)
    {
      if (v9 == 101)
      {
LABEL_22:
        compression_algorithm v12 = COMPRESSION_LZFSE;
        goto LABEL_23;
      }
LABEL_19:
      uint64_t v13 = (id)gLogger;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient parallelDecompressedData:]();
      }

      goto LABEL_22;
    }
    compression_algorithm v12 = COMPRESSION_LZ4;
  }
LABEL_23:
  unint64_t v14 = bswap64(*(void *)(v8 + 12));
  if (v14 >= 0x80000001)
  {
    size_t v15 = (id)gLogger;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient parallelDecompressedData:]();
    }
  }
  id v10 = [MEMORY[0x1E4F1CA58] dataWithLength:v14];
  BOOL v16 = (uint8_t *)[v10 mutableBytes];
  size_t v17 = [v10 length];
  id v18 = v6;
  size_t v19 = compression_decode_buffer(v16, v17, (const uint8_t *)([v18 bytes] + 28), objc_msgSend(v18, "length") - 28, 0, v12);
  if (v19 != [v10 length])
  {
    CFNumberRef v20 = (id)gLogger;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      BOOL v21 = NSStringFromSelector(a2);
      int v22 = 138412802;
      uint32_t v23 = v21;
      __int16 v24 = 2048;
      size_t v25 = v19;
      __int16 v26 = 2048;
      uint64_t v27 = [v10 length];
      _os_log_error_impl(&dword_1DB8AB000, v20, OS_LOG_TYPE_ERROR, "%@: Mismatching decompression size %zu %zu ", (uint8_t *)&v22, 0x20u);
    }
  }
LABEL_11:

  return v10;
}

- (void)copyOptions:(id)a3 vmData:(VMData *)a4
{
  id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  if (v6)
  {
    id v7 = v6;
    a4->var17.var24 = [v6 length];
    a4->var4 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v7, [v7 length], &a4->var17.var23);
    id v6 = v7;
  }
  else
  {
    a4->var17.var23 = 0;
    a4->var17.var24 = 0;
  }
}

- (void)copyOptions:(id)a3 dictionary:(__CFDictionary *)a4 vmData:(VMData *)a5
{
  id v13 = a3;
  BOOL v8 = objc_msgSend(MEMORY[0x1E4F28DB0], "archivedDataWithRootObject:requiringSecureCoding:error:");
  int v9 = v8;
  if (v8)
  {
    a5->var17.var24 = [v8 length];
    a5->var4 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v9, [v9 length], &a5->var17.var23);
    CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFNumberRef v11 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &a5->var17.var23);
    CFDictionarySetValue(a4, @"ioSIDOptions", v11);
    CFRelease(v11);
  }
  else
  {
    a5->var17.var23 = 0;
    a5->var17.var24 = 0;
    CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  }
  CFNumberRef v12 = CFNumberCreate(v10, kCFNumberSInt64Type, &a5->var17.var24);
  CFDictionarySetValue(a4, @"optionsLength", v12);
  CFRelease(v12);
}

- (void)copyModelOptionFiles:(id)a3 options:(id)a4 vmData:(VMData *)a5
{
  id v9 = a3;
  id v10 = a4;
  CFNumberRef v11 = v10;
  if (v10)
  {
    CFNumberRef v12 = [v10 objectForKeyedSubscript:kANEFCompilerOptionsFilenameKey[0]];
    if (v12)
    {
      id v13 = [NSString alloc];
      unint64_t v14 = [v9 modelURL];
      size_t v15 = [v14 path];
      BOOL v16 = (void *)[v13 initWithFormat:@"%@/%@", v15, v12];

      size_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v16];
      id v18 = (id)gLogger;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        [v17 length];
        -[_ANEVirtualClient copyModelOptionFiles:options:vmData:]();
      }

      a5->var17.var27 = [v17 length];
      a5->var3 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v17, [v17 length], &a5->var17.var26);
    }
    else
    {
      a5->var17.var26 = 0;
      a5->var17.var27 = 0;
    }
  }
  else
  {
    size_t v19 = (id)gLogger;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient copyModelOptionFiles:options:vmData:]();
    }

    a5->var17.var26 = 0;
  }
}

- (void)copyModelOptionFiles:(id)a3 options:(id)a4 dictionary:(__CFDictionary *)a5 vmData:(VMData *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = v12;
  if (v12)
  {
    unint64_t v14 = [v12 objectForKeyedSubscript:kANEFCompilerOptionsFilenameKey[0]];
    if (v14)
    {
      id v15 = [NSString alloc];
      BOOL v16 = [v11 modelURL];
      size_t v17 = [v16 path];
      id v18 = (void *)[v15 initWithFormat:@"%@/%@", v17, v14];

      size_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v18];
      CFNumberRef v20 = (id)gLogger;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        [v19 length];
        -[_ANEVirtualClient copyModelOptionFiles:options:vmData:]();
      }

      a6->var17.var27 = [v19 length];
      a6->var3 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v19, [v19 length], &a6->var17.var26);
      CFNumberRef v21 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &a6->var17.var26);
      CFDictionarySetValue(a5, @"ioSIDCompilerOptionFile", v21);
      CFRelease(v21);
    }
    else
    {
      a6->var17.var26 = 0;
      a6->var17.var27 = 0;
    }
  }
  else
  {
    int v22 = (id)gLogger;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient copyModelOptionFiles:options:vmData:]();
    }

    a6->var17.var26 = 0;
    a6->var17.var27 = 0;
  }
  CFNumberRef v23 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt64Type, &a6->var17.var27);
  CFDictionarySetValue(a5, @"compilerOptionFileLength", v23);
  CFRelease(v23);
}

- (void)copyErrorValue:(VMData *)a3
{
  *(_OWORD *)&a3->var17.var46 = 0u;
  id v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = [NSNumber numberWithUnsignedLong:256];
  objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, *MEMORY[0x1E4F2EFB8], 0);
  CFDictionaryRef v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  BOOL v8 = IOSurfaceCreate(v7);
  a3->var9 = v8;
  if (v8)
  {
    IOSurfaceLock(v8, 0, 0);
    a3->var17.var48 = IOSurfaceGetID(a3->var9);
    id v9 = (id)gLogger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:]();
    }

    IOSurfaceUnlock(a3->var9, 0, 0);
  }
  else
  {
    id v10 = (id)gLogger;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient copyErrorValue:]();
    }
  }
}

- (void)copyErrorValue:(__CFDictionary *)a3 vmData:(VMData *)a4
{
  *(_OWORD *)&a4->var17.var46 = 0u;
  CFDictionaryRef v7 = (void *)MEMORY[0x1E4F1C9E8];
  BOOL v8 = [NSNumber numberWithUnsignedLong:256];
  objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, *MEMORY[0x1E4F2EFB8], 0);
  CFDictionaryRef v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  id v10 = IOSurfaceCreate(v9);
  a4->var9 = v10;
  if (v10)
  {
    IOSurfaceLock(v10, 0, 0);
    a4->var17.var48 = IOSurfaceGetID(a4->var9);
    CFNumberRef v11 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &a4->var17.var48);
    CFDictionarySetValue(a3, @"ioSIDErrorValue", v11);
    CFRelease(v11);
    id v12 = (id)gLogger;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:]();
    }

    IOSurfaceUnlock(a4->var9, 0, 0);
  }
  else
  {
    id v13 = (id)gLogger;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient copyErrorValue:]();
    }
  }
}

- (__IOSurface)copyToIOSurface:(id)a3 length:(unint64_t)a4 ioSID:(unsigned int *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!a5)
  {
    CFNumberRef v11 = (id)gLogger;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient copyToIOSurface:length:ioSID:]();
    }
    goto LABEL_11;
  }
  if (!a4)
  {
    CFNumberRef v11 = (id)gLogger;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient copyToIOSurface:length:ioSID:]();
    }
LABEL_11:
    id v13 = 0;
    goto LABEL_12;
  }
  CFDictionaryRef v9 = (void *)MEMORY[0x1E4F1C9E8];
  id v10 = [NSNumber numberWithUnsignedLong:a4];
  CFNumberRef v11 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, *MEMORY[0x1E4F2EFB8], 0);

  id v12 = IOSurfaceCreate((CFDictionaryRef)v11);
  id v13 = v12;
  if (v12)
  {
    IOSurfaceLock(v12, 0, 0);
    BaseAddress = IOSurfaceGetBaseAddress(v13);
    id v15 = v8;
    memcpy(BaseAddress, (const void *)[v15 bytes], objc_msgSend(v15, "length"));
    *a5 = IOSurfaceGetID(v13);
    BOOL v16 = (id)gLogger;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      size_t v19 = NSStringFromSelector(a2);
      uint64_t v20 = [v15 length];
      unsigned int v21 = *a5;
      *(_DWORD *)buf = 138413058;
      CFNumberRef v23 = v19;
      __int16 v24 = 2048;
      uint64_t v25 = v20;
      __int16 v26 = 2048;
      unint64_t v27 = a4;
      __int16 v28 = 1024;
      unsigned int v29 = v21;
      _os_log_debug_impl(&dword_1DB8AB000, v16, OS_LOG_TYPE_DEBUG, "%@ ANEVirtualClient data in bytes %lu IOSurfaceLength %lu IOSID: %u\n", buf, 0x26u);
    }
    IOSurfaceUnlock(v13, 0, 0);
  }
  else
  {
    id v18 = (id)gLogger;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient copyToIOSurface:length:ioSID:]();
    }
  }
LABEL_12:

  return v13;
}

- (__IOSurface)copyToIOSurface:(char *)a3 size:(unint64_t)a4 ioSID:(unsigned int *)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!a5)
  {
    CFNumberRef v11 = (id)gLogger;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient copyToIOSurface:size:ioSID:]();
    }
    goto LABEL_11;
  }
  if (!a4)
  {
    CFNumberRef v11 = (id)gLogger;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient copyToIOSurface:size:ioSID:]();
    }
LABEL_11:
    id v13 = 0;
    goto LABEL_12;
  }
  CFDictionaryRef v9 = (void *)MEMORY[0x1E4F1C9E8];
  id v10 = [NSNumber numberWithUnsignedLong:a4];
  CFNumberRef v11 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, *MEMORY[0x1E4F2EFB8], 0);

  id v12 = IOSurfaceCreate((CFDictionaryRef)v11);
  id v13 = v12;
  if (v12)
  {
    IOSurfaceLock(v12, 0, 0);
    BaseAddress = IOSurfaceGetBaseAddress(v13);
    memcpy(BaseAddress, a3, a4);
    *a5 = IOSurfaceGetID(v13);
    id v15 = (id)gLogger;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      id v18 = NSStringFromSelector(a2);
      unsigned int v19 = *a5;
      *(_DWORD *)buf = 138412802;
      unsigned int v21 = v18;
      __int16 v22 = 2048;
      unint64_t v23 = a4;
      __int16 v24 = 1024;
      unsigned int v25 = v19;
      _os_log_debug_impl(&dword_1DB8AB000, v15, OS_LOG_TYPE_DEBUG, "%@ ANEVirtualClient data in bytes length %lu IOSID: %u\n", buf, 0x1Cu);
    }
    IOSurfaceUnlock(v13, 0, 0);
  }
  else
  {
    size_t v17 = (id)gLogger;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient copyErrorValue:]();
    }
  }
LABEL_12:

  return v13;
}

+ (void)printIOSurfaceDataInBytes:(__IOSurface *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    IOSurfaceLock(a3, 0, 0);
    size_t AllocSize = IOSurfaceGetAllocSize(a3);
    BaseAddress = (unsigned __int8 *)IOSurfaceGetBaseAddress(a3);
    if (AllocSize)
    {
      CFDictionaryRef v7 = BaseAddress;
      for (uint64_t i = 0; i != AllocSize; ++i)
      {
        CFDictionaryRef v9 = (id)gLogger;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          id v10 = NSStringFromSelector(a2);
          int v11 = v7[i];
          *(_DWORD *)buf = 138412802;
          BOOL v16 = v10;
          __int16 v17 = 2048;
          uint64_t v18 = i;
          __int16 v19 = 1024;
          int v20 = v11;
          _os_log_debug_impl(&dword_1DB8AB000, v9, OS_LOG_TYPE_DEBUG, "%@ ANEVirtualClient byte[%llu]=0x%x\n", buf, 0x1Cu);
        }
      }
    }
    IOSurfaceUnlock(a3, 0, 0);
  }
  else
  {
    id v12 = gLogger;
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
      +[_ANEVirtualClient printIOSurfaceDataInBytes:v14];
    }
  }
}

- (id)getModelAttribute:(VMData *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  IOSurfaceLock(a3->var7, 0, 0);
  BaseAddress = IOSurfaceGetBaseAddress(a3->var7);
  if (BaseAddress)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:BaseAddress length:a3->var18.var20];
    id v13 = 0;
    CFDictionaryRef v7 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:1 error:&v13];
    id v8 = v13;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
      -[_ANEVirtualClient getModelAttribute:]();
    }
    if (!a3->var7 && os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
      -[_ANEVirtualClient getModelAttribute:]();
    }
    id v8 = 0;
    CFDictionaryRef v7 = (void *)MEMORY[0x1E4F1CC08];
  }
  CFDictionaryRef v9 = (id)gLogger;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v11 = NSStringFromSelector(a2);
    unint64_t var20 = a3->var18.var20;
    *(_DWORD *)buf = 138412802;
    id v15 = v11;
    __int16 v16 = 2048;
    unint64_t v17 = var20;
    __int16 v18 = 2112;
    __int16 v19 = v7;
    _os_log_debug_impl(&dword_1DB8AB000, v9, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualClient Model Attribute Length %llu Model Attribute value %@\n", buf, 0x20u);
  }
  IOSurfaceUnlock(a3->var7, 0, 0);

  return v7;
}

- (BOOL)callIOUserClient:(unsigned int)a3 inParams:(VirtANEModel *)a4 outParams:(VirtANEModel *)a5
{
  uint64_t v6 = *(void *)&a3;
  if (a5) {
    outputStruct = a5;
  }
  else {
    outputStruct = (VirtANEModel *)&v13;
  }
  size_t v12 = 2640;
  mach_port_t v9 = [(_ANEVirtualClient *)self connect];
  if (a4) {
    size_t v10 = 2640;
  }
  else {
    size_t v10 = 0;
  }
  [(_ANEVirtualClient *)self checkKernReturnValue:IOConnectCallMethod(v9, v6, 0, 0, a4, v10, 0, 0, outputStruct, &v12) selector:v6 outParams:outputStruct];
  return outputStruct->var1 != 0;
}

- (id)getObjectFromIOSurface:(__IOSurface *)a3 classType:(Class)a4 length:(unint64_t)a5
{
  v24[5] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    IOSurfaceLock(a3, 0, 0);
    if (!a5) {
      LODWORD(a5) = IOSurfaceGetAllocSize(a3);
    }
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:IOSurfaceGetBaseAddress(a3) length:a5];
    IOSurfaceUnlock(a3, 0, 0);
    if (v8)
    {
      mach_port_t v9 = (void *)MEMORY[0x1E4F1CAD0];
      v24[0] = objc_opt_class();
      v24[1] = objc_opt_class();
      v24[2] = objc_opt_class();
      v24[3] = objc_opt_class();
      unsigned char v24[4] = objc_opt_class();
      size_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:5];
      int v11 = [v9 setWithArray:v10];

      id v23 = 0;
      size_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v8 error:&v23];
      id v13 = v23;
      if (v13)
      {
        uint64_t v14 = (id)gLogger;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[_ANEVirtualClient compileModel:options:qos:error:]();
        }
      }
      id v15 = [v12 decodeObjectOfClasses:v11 forKey:*MEMORY[0x1E4F284E8]];
    }
    else
    {
      __int16 v19 = gLogger;
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
        -[_ANEVirtualClient getObjectFromIOSurface:classType:length:](v19, v20, v21);
      }
      CFRelease(a3);
      id v15 = 0;
    }
  }
  else
  {
    __int16 v16 = gLogger;
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
      -[_ANEVirtualClient getObjectFromIOSurface:classType:length:](v16, v17, v18);
    }
    id v15 = 0;
  }
  return v15;
}

+ (unsigned)dictionaryGetUInt32ForKey:(__CFDictionary *)a3 key:(__CFString *)a4
{
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a3, a4);
  int valuePtr = 0;
  if (Value)
  {
    CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
    LODWORD(Value) = valuePtr;
  }
  return Value;
}

+ (unint64_t)dictionaryGetUInt64ForKey:(__CFDictionary *)a3 key:(__CFString *)a4
{
  unint64_t result = (unint64_t)CFDictionaryGetValue(a3, a4);
  unint64_t valuePtr = 0;
  if (result)
  {
    CFNumberGetValue((CFNumberRef)result, kCFNumberSInt64Type, &valuePtr);
    return valuePtr;
  }
  return result;
}

+ (int64_t)dictionaryGetInt64ForKey:(__CFDictionary *)a3 key:(__CFString *)a4
{
  int64_t result = (int64_t)CFDictionaryGetValue(a3, a4);
  int64_t valuePtr = 0;
  if (result)
  {
    CFNumberGetValue((CFNumberRef)result, kCFNumberSInt64Type, &valuePtr);
    return valuePtr;
  }
  return result;
}

+ (char)dictionaryGetInt8ForKey:(__CFDictionary *)a3 key:(__CFString *)a4
{
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a3, a4);
  char valuePtr = 0;
  if (!Value) {
    return 0;
  }
  CFNumberGetValue(Value, kCFNumberSInt8Type, &valuePtr);
  return valuePtr;
}

+ (id)dictionaryGetNSStringForKey:(__CFDictionary *)a3 key:(__CFString *)a4
{
  CFNumberRef Value = (void *)CFDictionaryGetValue(a3, a4);
  id v5 = Value;
  if (Value) {
    id v6 = Value;
  }
  return v5;
}

+ (__CFDictionary)getCFDictionaryFromIOSurface:(__IOSurface *)a3 dataLength:(unint64_t)a4
{
  if (!a3)
  {
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
      +[_ANEVirtualClient getCFDictionaryFromIOSurface:dataLength:]();
    }
    return 0;
  }
  IOSurfaceLock(a3, 0, 0);
  id v6 = operator new[](a4, MEMORY[0x1E4FBA2D0]);
  CFDictionaryRef v7 = v6;
  if (!a4 || v6)
  {
    BaseAddress = IOSurfaceGetBaseAddress(a3);
    if (BaseAddress)
    {
      memcpy(v7, BaseAddress, a4);
      IOSurfaceUnlock(a3, 0, 0);
      CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFDataRef v13 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const UInt8 *)v7, a4);
      if (!v13)
      {
        if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
          +[_ANEVirtualClient getCFDictionaryFromIOSurface:dataLength:].cold.4();
        }
LABEL_22:
        size_t v10 = 0;
        if (!v7) {
          return v10;
        }
        goto LABEL_18;
      }
      size_t v10 = (__CFDictionary *)CFPropertyListCreateWithData(v12, v13, 0, 0, 0);
      CFRelease(v13);
      if (!v10)
      {
        if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
          +[_ANEVirtualClient getCFDictionaryFromIOSurface:dataLength:].cold.5();
        }
        goto LABEL_22;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
        +[_ANEVirtualClient getCFDictionaryFromIOSurface:dataLength:]();
      }
      IOSurfaceUnlock(a3, 0, 0);
      size_t v10 = 0;
    }
    if (!v7) {
      return v10;
    }
LABEL_18:
    MEMORY[0x1E01935F0](v7, 0x1000C4077774924);
    return v10;
  }
  id v8 = gLogger;
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
    +[_ANEVirtualClient getCFDictionaryFromIOSurface:dataLength:](a4, v8, v9);
  }
  return 0;
}

+ (void)copyDictionaryDataToStruct:(VirtANEModel *)a3 dictionary:(__CFDictionary *)a4
{
  if (a3 && a4)
  {
    bzero(a3, 0xA50uLL);
    a3->var1 = +[_ANEVirtualClient dictionaryGetInt64ForKey:a4 key:@"success"];
    a3->unint64_t var20 = +[_ANEVirtualClient dictionaryGetUInt64ForKey:a4 key:@"modelAttributeLength"];
    a3->var47 = +[_ANEVirtualClient dictionaryGetUInt64ForKey:a4 key:@"errorLength"];
    a3->var46 = +[_ANEVirtualClient dictionaryGetInt64ForKey:a4 key:@"errorCode"];
    a3->var25 = +[_ANEVirtualClient dictionaryGetUInt64ForKey:a4 key:@"state"];
    a3->var15 = +[_ANEVirtualClient dictionaryGetUInt64ForKey:a4 key:@"programHandle"];
    a3->var16 = +[_ANEVirtualClient dictionaryGetUInt64ForKey:a4 key:@"intermediateBufferHandle"];
    a3->var17 = +[_ANEVirtualClient dictionaryGetInt8ForKey:a4 key:@"queueDepth"];
    a3->var49 = +[_ANEVirtualClient dictionaryGetUInt64ForKey:a4 key:@"hwExecutionTime"];
    a3->var51 = +[_ANEVirtualClient dictionaryGetUInt64ForKey:a4 key:@"performanceStatsLength"];
  }
  else
  {
    CFDictionaryRef v7 = (id)gLogger;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      +[_ANEVirtualClient copyDictionaryDataToStruct:dictionary:]();
    }
  }
}

+ (BOOL)setCodeSigningIdentity:(__CFDictionary *)a3
{
  mach_msg_type_number_t task_info_outCnt = 8;
  if (task_info(*MEMORY[0x1E4F14960], 0xFu, task_info_out, &task_info_outCnt)) {
    return 0;
  }
  v10[0] = *(_OWORD *)task_info_out;
  v10[1] = v13;
  id v5 = +[_ANEModelToken codeSigningIDFor:v10 processIdentifier:getpid()];
  BOOL v4 = v5 != 0;
  id v6 = gLogger;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
      +[_ANEVirtualClient setCodeSigningIdentity:]();
    }
    CFDictionarySetValue(a3, @"csIdentity", v5);
  }
  else if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
  {
    +[_ANEVirtualClient setCodeSigningIdentity:v8];
  }

  return v4;
}

- (__CFDictionary)callIOUserClientWithDictionary:(unsigned int)a3 inDictionary:(__CFDictionary *)a4 error:(id *)a5
{
  kern_return_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  size_t v21;
  CFStringRef v22;
  NSObject *v23;
  CFStringRef errorString;
  size_t v26;
  unsigned int valuePtr;
  uint64_t v28;

  __int16 v28 = *MEMORY[0x1E4F143B8];
  char valuePtr = a3;
  if (!a4) {
    return 0;
  }
  CFNumberRef v9 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(a4, @"command", v9);
  CFRelease(v9);
  CFDataRef v10 = IOCFSerialize(a4, 0);
  if (!v10)
  {
    uint64_t v17 = (id)gLogger;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient callIOUserClientWithDictionary:inDictionary:error:]();
    }

    return 0;
  }
  uint64_t v26 = 4096;
  int v11 = (char *)operator new[](0x1000uLL, MEMORY[0x1E4FBA2D0]);
  if (!v11)
  {
    uint64_t v18 = gLogger;
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
      -[_ANEVirtualClient callIOUserClientWithDictionary:inDictionary:error:](v18, v19, v20);
    }
    return 0;
  }
  outputStruct = v11;
  BytePtr = CFDataGetBytePtr(v10);
  size_t Length = CFDataGetLength(v10);
  id v15 = IOConnectCallMethod([(_ANEVirtualClient *)self connect], 0x10u, 0, 0, BytePtr, Length, 0, 0, outputStruct, &v26);
  CFRelease(v10);
  if (v15)
  {
    if (a5)
    {
      if (v15 == -536870160 || v15 == -536870911)
      {
        __int16 v16 = NSStringFromSelector(a2);
        *a5 = +[_ANEErrors fileNotFoundErrorForMethod:v16];
      }
      a5 = 0;
    }
  }
  else
  {
    uint64_t v21 = *(void *)outputStruct;
    errorString = 0;
    a5 = (id *)IOCFUnserializeBinary(outputStruct + 8, v21, 0, 0, &errorString);
    __int16 v22 = errorString;
    if (a5 && errorString)
    {
      id v23 = (id)gLogger;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient callIOUserClientWithDictionary:inDictionary:error:]();
      }

      __int16 v22 = errorString;
    }
    if (v22) {
      CFRelease(v22);
    }
  }
  MEMORY[0x1E01935F0](outputStruct, 0x1000C4077774924);
  return (__CFDictionary *)a5;
}

- (void)checkKernReturnValue:(int)a3 selector:(unsigned int)a4 outParams:(VirtANEModel *)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a5) {
      a5->var1 = 0;
    }
    uint64_t v8 = (id)gLogger;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      CFNumberRef v9 = NSStringFromSelector(a2);
      int v10 = 138412802;
      int v11 = v9;
      __int16 v12 = 1024;
      unsigned int v13 = a4;
      __int16 v14 = 1024;
      int v15 = a3;
      _os_log_error_impl(&dword_1DB8AB000, v8, OS_LOG_TYPE_ERROR, "%@: Failed to call method %d with error %d", (uint8_t *)&v10, 0x18u);
    }
  }
  else
  {
    uint64_t v8 = (id)gLogger;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient checkKernReturnValue:selector:outParams:]();
    }
  }
}

- (BOOL)updateError:(VMData *)a3 error:(id *)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  if (a4) {
    BOOL v4 = a3->var18.var47 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  BOOL v5 = v4;
  if (!v4)
  {
    IOSurfaceLock(a3->var9, 0, 0);
    BaseAddress = IOSurfaceGetBaseAddress(a3->var9);
    if (BaseAddress)
    {
      uint64_t v25 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:BaseAddress length:a3->var18.var47];
      int v10 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v30 = objc_opt_class();
      int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
      __int16 v12 = [v10 setWithArray:v11];

      id v27 = 0;
      unsigned int v13 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v25 error:&v27];
      id v14 = v27;
      if (v14)
      {
        int v15 = (id)gLogger;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[_ANEVirtualClient compileModel:options:qos:error:]();
        }
      }
      uint64_t v16 = objc_msgSend(v13, "decodeObjectOfClasses:forKey:", v12, *MEMORY[0x1E4F284E8], v25);
      IOSurfaceUnlock(a3->var9, 0, 0);
      uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = +[_ANEStrings errorDomainVirtIO];
      int64_t var46 = a3->var18.var46;
      uint64_t v28 = *MEMORY[0x1E4F28568];
      unsigned int v29 = v16;
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      *a4 = [v17 errorWithDomain:v18 code:var46 userInfo:v20];
    }
    else
    {
      uint64_t v21 = (id)gLogger;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient updateError:error:]();
      }

      __int16 v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = +[_ANEStrings errorDomainVirtIO];
      int64_t v23 = a3->var18.var46;
      uint64_t v31 = *MEMORY[0x1E4F28568];
      v32[0] = @"Failed with NULL databaseAddress";
      __int16 v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
      *a4 = [v22 errorWithDomain:v26 code:v23 userInfo:v12];
    }
  }
  return v5;
}

- (id)updatePerformanceStats:(VMData *)a3
{
  if (a3->var18.var51 || a3->var18.var49)
  {
    IOSurfaceLock(a3->var10, 0, 0);
    BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:IOSurfaceGetBaseAddress(a3->var10) length:a3->var18.var51];
    IOSurfaceUnlock(a3->var10, 0, 0);
    if (v5)
    {
      id v6 = +[_ANEPerformanceStats statsWithReconstructed:v5 hardwareExecutionNS:a3->var18.var49];
    }
    else
    {
      uint64_t v7 = (id)gLogger;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient updatePerformanceStats:]();
      }

      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)releaseIOSurfaces:(VMData *)a3
{
  if (a3->var0)
  {
    CFRelease(a3->var0);
    a3->var0 = 0;
  }
  var1 = a3->var1;
  if (var1)
  {
    CFRelease(var1);
    a3->var1 = 0;
  }
  var2 = a3->var2;
  if (var2)
  {
    CFRelease(var2);
    a3->var2 = 0;
  }
  var3 = a3->var3;
  if (var3)
  {
    CFRelease(var3);
    a3->var3 = 0;
  }
  var4 = a3->var4;
  if (var4)
  {
    CFRelease(var4);
    a3->var4 = 0;
  }
  var5 = a3->var5;
  if (var5)
  {
    CFRelease(var5);
    a3->var5 = 0;
  }
  var6 = a3->var6;
  if (var6)
  {
    CFRelease(var6);
    a3->var6 = 0;
  }
  var7 = a3->var7;
  if (var7)
  {
    CFRelease(var7);
    a3->var7 = 0;
  }
  var8 = a3->var8;
  if (var8)
  {
    CFRelease(var8);
    a3->var8 = 0;
  }
  var9 = a3->var9;
  if (var9)
  {
    CFRelease(var9);
    a3->var9 = 0;
  }
  var10 = a3->var10;
  if (var10)
  {
    CFRelease(var10);
    a3->var10 = 0;
  }
  var11 = a3->var11;
  if (var11)
  {
    CFRelease(var11);
    a3->var11 = 0;
  }
  var12 = a3->var12;
  if (var12)
  {
    CFRelease(var12);
    a3->var12 = 0;
  }
  var13 = a3->var13;
  if (var13)
  {
    CFRelease(var13);
    a3->var13 = 0;
  }
  var14 = a3->var14;
  if (var14)
  {
    CFRelease(var14);
    a3->var14 = 0;
  }
  unint64_t var20 = a3->var20;
  if (var20)
  {
    CFRelease(var20);
    a3->unint64_t var20 = 0;
  }
}

- (unsigned)connect
{
  return self->_connect;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)compileModel:options:qos:error:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_8(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_1DB8AB000, "%@: ANEVirtualClient unarchive error %@ \n", v4, v5);
}

- (void)compileModel:options:qos:error:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_8(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_1DB8AB000, "%@: ANEVirtualClient CompileModel succeeded for MODEL: %@ \n", v4, v5);
}

- (void)compileModel:options:qos:error:.cold.3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_1(&dword_1DB8AB000, v0, v1, "ANEVirtualClient failed to call compileModel dictionary method", v2, v3, v4, v5, v6);
}

- (void)compileModel:options:qos:error:.cold.4()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_3_0(&dword_1DB8AB000, v3, v4, "%@: ANEVirtualClient compileModel dictionary call succeeded", v5);
}

- (void)compileModel:options:qos:error:.cold.5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_12(&dword_1DB8AB000, v0, v1, "_ANEVirtualClient calling dictionary compileModel method", v2, v3, v4, v5, v6);
}

- (void)compileModel:options:qos:error:.cold.6()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_3_0(&dword_1DB8AB000, v3, v4, "%@:ANEVirtualClient start\n", v5);
}

+ (void)printStruct:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 8);
  v5[1] = *(_DWORD *)a1;
  uint64_t v7 = v2;
  LODWORD(v2) = *(_DWORD *)(a1 + 20);
  int v9 = *(_DWORD *)(a1 + 16);
  int v11 = v2;
  int v3 = *(_DWORD *)(a1 + 28);
  int v13 = *(_DWORD *)(a1 + 24);
  int v39 = *(_DWORD *)(a1 + 876);
  uint64_t v43 = *(void *)(a1 + 888);
  int v47 = *(_DWORD *)(a1 + 900);
  uint64_t v49 = *(void *)(a1 + 904);
  int v51 = *(_DWORD *)(a1 + 912);
  uint64_t v53 = *(void *)(a1 + 920);
  int v55 = *(_DWORD *)(a1 + 1952);
  uint64_t v57 = *(void *)(a1 + 1960);
  uint64_t v59 = *(void *)(a1 + 1968);
  int v63 = *(_DWORD *)(a1 + 2492);
  int v67 = *(_DWORD *)(a1 + 2500);
  int v71 = *(_DWORD *)(a1 + 2508);
  int v15 = v3;
  uint64_t v73 = *(void *)(a1 + 2512);
  uint64_t v75 = *(void *)(a1 + 2520);
  int v79 = *(_DWORD *)(a1 + 2532);
  uint64_t v81 = *(void *)(a1 + 2536);
  int v83 = *(_DWORD *)(a1 + 2544);
  uint64_t v85 = *(void *)(a1 + 2552);
  int v87 = *(_DWORD *)(a1 + 2560);
  uint64_t v89 = *(void *)(a1 + 2568);
  int v91 = *(_DWORD *)(a1 + 2576);
  uint64_t v93 = *(void *)(a1 + 2584);
  int v95 = *(_DWORD *)(a1 + 2592);
  uint64_t v97 = *(void *)(a1 + 2600);
  int v99 = *(_DWORD *)(a1 + 2608);
  uint64_t v101 = *(void *)(a1 + 2616);
  int v103 = *(_DWORD *)(a1 + 2624);
  uint64_t v105 = *(void *)(a1 + 2632);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v17 = *(void *)(a1 + 32);
  uint64_t v19 = v4;
  uint64_t v21 = *(void *)(a1 + 48);
  uint64_t v23 = *(void *)(a1 + 832);
  uint64_t v25 = *(void *)(a1 + 840);
  uint64_t v27 = *(void *)(a1 + 848);
  int v29 = *(char *)(a1 + 856);
  int v31 = *(unsigned __int8 *)(a1 + 857);
  int v33 = *(_DWORD *)(a1 + 860);
  uint64_t v35 = *(void *)(a1 + 864);
  int v37 = *(_DWORD *)(a1 + 872);
  int v41 = *(_DWORD *)(a1 + 880);
  int v45 = *(_DWORD *)(a1 + 896);
  int v61 = *(_DWORD *)(a1 + 2488);
  int v65 = *(_DWORD *)(a1 + 2496);
  int v69 = *(_DWORD *)(a1 + 2504);
  int v77 = *(_DWORD *)(a1 + 2528);
  __int16 v8 = 1024;
  __int16 v10 = 1024;
  __int16 v12 = 1024;
  __int16 v14 = 1024;
  __int16 v28 = 1024;
  __int16 v30 = 1024;
  __int16 v32 = 1024;
  __int16 v36 = 1024;
  __int16 v38 = 1024;
  __int16 v40 = 1024;
  __int16 v44 = 1024;
  __int16 v46 = 1024;
  __int16 v50 = 1024;
  __int16 v54 = 1024;
  __int16 v60 = 1024;
  __int16 v62 = 1024;
  __int16 v64 = 1024;
  __int16 v66 = 1024;
  __int16 v68 = 1024;
  __int16 v70 = 1024;
  __int16 v76 = 1024;
  __int16 v78 = 1024;
  __int16 v82 = 1024;
  __int16 v86 = 1024;
  __int16 v90 = 1024;
  __int16 v94 = 1024;
  __int16 v98 = 1024;
  __int16 v102 = 1024;
  __int16 v6 = 2048;
  __int16 v16 = 2048;
  __int16 v18 = 2048;
  __int16 v20 = 2048;
  __int16 v22 = 2048;
  __int16 v24 = 2048;
  __int16 v26 = 2048;
  __int16 v34 = 2048;
  __int16 v42 = 2048;
  __int16 v48 = 2048;
  __int16 v52 = 2048;
  __int16 v56 = 2048;
  __int16 v58 = 2048;
  __int16 v72 = 2048;
  __int16 v74 = 2048;
  __int16 v80 = 2048;
  __int16 v84 = 2048;
  __int16 v88 = 2048;
  __int16 v92 = 2048;
  __int16 v96 = 2048;
  __int16 v100 = 2048;
  __int16 v104 = 2048;
  v5[0] = 67121920;
  _os_log_debug_impl(&dword_1DB8AB000, a2, OS_LOG_TYPE_DEBUG, "ANEVirtualClient : virtANEModel->command=%u, virtANEModel->success=%lld, virtANEModel->ioSIDModelNet=%u, virtANEModel->ioSIDModelShape=%u, virtANEModel->ioSIDModelWeight=%u, virtANEModel->ioSIDKey=%u, virtANEModel->modelNetLength=%llu, virtANEModel->modelShapeLength=%llu, virtANEModel->modelWeightLength=%llu, virtANEModel->string_id=%llu, virtANEModel->programHandle=%llu, virtANEModel->intermediateBufferHandle=%llu, virtANEModel->queueDepth=%d, virtANEModel->flags=%d, virtANEModel->ioSIDModelAttributes=%u, virtANEModel->ModelAttributeLength=%llu, virtANEModel->perfStatsMask=%u, virtANEModel->qos=%u, virtANEModel->ioSIDOptions=%u, virtANEModel->optionsLength=%llu, virtANEModel->state=%u, virtANEModel->ioSIDCompilerOptionFile=%u, virtANEModel->compilerOptionFileLength=%llu, virtANEModel->ioSIDANECIRNetPlist=%u, virtANEModel->_ANECIRNetPlistLength=%llu, virtANEModel->ioSIDWeightsBuffer=%u, virtANEModel->procedureIndex=%llu, virtANEModel->transactionHandle=%llu, virtANEModel->perfStatsCount=%u, virtANEModel->inputArrayCount=%u, virtANEModel->inputIndexArrayCount=%u, virtANEModel->outputArrayCount=%u, virtANEModel->outputIndexArrayCount=%u, virtANEModel->ioSIDHashString=%u, virtANEModel->hashStringLength=%llu, virtANEModel->errorCode=%ld, virtANEModel->errorLength=%u, virtANEModel->ioSIDErrorValue=%u, virtANEModel->hwExecutionTime=%llu, virtANEModel->ioSIDPerformanceStats=%u, virtANEModel->performanceStatsLength=%llu, virtANEModel->ioSIDModelInputPath=%u, virtANEModel->modelInputPathLength=%llu, virtANEModel->ioSIDModelNetName=%u, virtANEModel->modelNetNameLength=%llu, virtANEModel->ioSIDModelShapeName=%u, virtANEModel->modelShapeNameLength=%llu, virtANEModel->ioSIDModelWeightName=%u, virtANEModel->modelWeightNameLength=%llu, virtANEModel->ioSIDModelHWX=%u, virtANEModel->modelHWXLength=%llu",
    (uint8_t *)v5,
    0x18Cu);
}

- (void)loadModel:options:qos:error:.cold.1()
{
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_11(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_1_6(&dword_1DB8AB000, "%@: ANEVirtualClient LoadModel no success %lld.\n", v4, v5);
}

- (void)loadModel:options:qos:error:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_8(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_1DB8AB000, "%@: ANEVirtualClient LoadModel success MODEL: %@ \n", v4, v5);
}

- (void)loadModel:options:qos:error:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_8(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_1DB8AB000, "%@: ANEVirtualClient loadModel dictionary Model Cache URL from Host %@", v4, v5);
}

- (void)loadModel:(os_log_t)log options:qos:error:.cold.4(uint64_t a1, int *a2, os_log_t log)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  int v3 = *(_DWORD *)(a1 + 648);
  int v4 = *(_DWORD *)(a1 + 652);
  int v5 = *(_DWORD *)(a1 + 656);
  int v6 = *(_DWORD *)(a1 + 660);
  uint64_t v7 = *(void *)(a1 + 1464);
  uint64_t v8 = *(void *)(a1 + 1472);
  uint64_t v9 = *(void *)(a1 + 1480);
  int v10 = *(char *)(a1 + 1488);
  int v11 = *(_DWORD *)(a1 + 1492);
  uint64_t v12 = *(void *)(a1 + 1496);
  int v13 = *(_DWORD *)(a1 + 1504);
  int v14 = *a2;
  int v15 = *(_DWORD *)(a1 + 1512);
  int v16 = *(_DWORD *)(a1 + 3164);
  v17[0] = 67112448;
  v17[1] = v3;
  __int16 v18 = 1024;
  int v19 = v4;
  __int16 v20 = 1024;
  int v21 = v5;
  __int16 v22 = 1024;
  int v23 = v6;
  __int16 v24 = 2048;
  uint64_t v25 = v7;
  __int16 v26 = 2048;
  uint64_t v27 = v8;
  __int16 v28 = 2048;
  uint64_t v29 = v9;
  __int16 v30 = 1024;
  int v31 = v10;
  __int16 v32 = 1024;
  int v33 = v11;
  __int16 v34 = 2048;
  uint64_t v35 = v12;
  __int16 v36 = 1024;
  int v37 = v13;
  __int16 v38 = 1024;
  int v39 = v14;
  __int16 v40 = 1024;
  int v41 = v15;
  __int16 v42 = 1024;
  int v43 = v16;
  _os_log_debug_impl(&dword_1DB8AB000, log, OS_LOG_TYPE_DEBUG, "ANEVirtualClient virtualANEModel.ioSIDModelNet=%u virtualANEModel.ioSIDModelShape=%u virtualANEModel.ioSIDModelWeight=%u virtualANEModel.ioSIDKey=%u virtualANEModel.string_id=%lld virtualANEModel.programHandle=%lld virtualANEModel.intermediateBufferHandle=%lld virtualANEModel.queueDepth=%d virtualANEModel.ioSIDModelAttributes=%u virtualANEModel.ModelAttributeLength=%llu virtualANEModel.perfStatsMask=%u virtualANEModel.qos=%u virtualANEModel.ioSIDOptions=%u virtualANEModel.ioSIDErrorValue=%u", (uint8_t *)v17, 0x66u);
}

- (void)loadModel:options:qos:error:.cold.5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_1(&dword_1DB8AB000, v0, v1, "ANEVirtualClient failed to call loadModel dictionary method", v2, v3, v4, v5, v6);
}

- (void)loadModel:options:qos:error:.cold.6()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_3_0(&dword_1DB8AB000, v3, v4, "%@: ANEVirtualClient loadModel dictionary call succeeded", v5);
}

- (void)loadModel:options:qos:error:.cold.7()
{
  OUTLINED_FUNCTION_1_1();
  int v2 = *v1;
  int v3 = v1[1];
  *(_DWORD *)uint64_t v4 = 138412802;
  *(void *)(v4 + 4) = v5;
  *(_WORD *)(v4 + 12) = 1024;
  *(_DWORD *)(v4 + 14) = v2;
  *(_WORD *)(v4 + 18) = 1024;
  *(_DWORD *)(v4 + 20) = v3;
  _os_log_debug_impl(&dword_1DB8AB000, v7, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualClient loadModel dictionary Allocating IOSurface for Model Cache URL %u %u", v6, 0x18u);
}

- (void)loadModel:options:qos:error:.cold.8()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_8(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_1DB8AB000, "%@: modelCacheURLIdentifierCFStringRef : %@", v4, v5);
}

- (void)loadModel:options:qos:error:.cold.9()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_12(&dword_1DB8AB000, v0, v1, "_ANEVirtualClient calling dictionary loadModel method", v2, v3, v4, v5, v6);
}

- (void)loadModelNewInstance:options:modelInstParams:qos:error:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2_0(&dword_1DB8AB000, v3, v4, "%@:ANEVirtualClient loadModelNewInstance API Not supported!!\n", v5);
}

- (void)loadModelNewInstance:options:modelInstParams:qos:error:.cold.7()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_12(&dword_1DB8AB000, v0, v1, "_ANEVirtualClient calling dictionary loadModelNewInstance method", v2, v3, v4, v5, v6);
}

- (void)unloadModel:(uint64_t)a3 options:(uint64_t)a4 qos:(uint64_t)a5 error:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DB8AB000, a2, a3, "ANEVirtualClient unloadModel res=%u", a5, a6, a7, a8, 0);
}

- (void)unloadModel:options:qos:error:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_1(&dword_1DB8AB000, v0, v1, "ANEVirtualClient failed to call unloadModel dictionary method", v2, v3, v4, v5, v6);
}

- (void)unloadModel:options:qos:error:.cold.3()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_11(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_1_6(&dword_1DB8AB000, "%@: ANEVirtualClient unloadModel success=%lld", v4, v5);
}

- (void)unloadModel:options:qos:error:.cold.4()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_3_0(&dword_1DB8AB000, v3, v4, "%@: ANEVirtualClient unloadModel dictionary call succeeded", v5);
}

- (void)unloadModel:options:qos:error:.cold.6()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_12(&dword_1DB8AB000, v0, v1, "_ANEVirtualClient calling dictionary unloadModel method", v2, v3, v4, v5, v6);
}

- (void)evaluateWithModel:options:request:qos:error:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2_0(&dword_1DB8AB000, v3, v4, "%@: Empty dispatch queue\n", v5);
}

- (void)evaluateWithModel:options:request:qos:error:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_1(&dword_1DB8AB000, v0, v1, "Failed to initialize output event listner", v2, v3, v4, v5, v6);
}

- (void)doEvaluateWithModel:options:request:qos:completionEvent:error:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2_0(&dword_1DB8AB000, v3, v4, "%@: ANEVirtualClient _ioSPerformanceStats pointer null\n", v5);
}

- (void)doEvaluateWithModel:options:request:qos:completionEvent:error:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_12(&dword_1DB8AB000, v0, v1, "ANEVirtualClient Connect to driver for kAppleVirtIONeuralEngineDeviceUserClientEvaluateWithModel.", v2, v3, v4, v5, v6);
}

- (void)doEvaluateWithModel:options:request:qos:completionEvent:error:.cold.3()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_14(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_21(&dword_1DB8AB000, "%@: ANEVirtualClient ioSurfaceRef ID=%u\n", v4, v5);
}

- (void)doEvaluateWithModel:options:request:qos:completionEvent:error:.cold.4()
{
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_4(&dword_1DB8AB000, v0, v1, "ANEVirtualClient Evaluate request5 ioSID: %u", v2, v3, v4, v5, v6);
}

- (void)doEvaluateWithModel:(void *)a1 options:request:qos:completionEvent:error:.cold.6(void *a1)
{
  id v1 = a1;
  OUTLINED_FUNCTION_27((uint64_t)v1, 5.778e-34);
  OUTLINED_FUNCTION_19(&dword_1DB8AB000, v2, v3, "%@: ANEVirtualClient queued the evaluate request. res=%d");
}

- (void)doEvaluateWithModel:(uint64_t)a3 options:request:qos:completionEvent:error:.cold.7(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_13(&dword_1DB8AB000, a2, a3, "ANEVirtualClient failed to call evaluateWithModel dictionary method with error:%@", (uint8_t *)&v4);
}

- (void)doEvaluateWithModel:(void *)a1 options:(char)a2 request:qos:completionEvent:error:.cold.8(void *a1, char a2)
{
  id v3 = a1;
  OUTLINED_FUNCTION_30((uint64_t)v3, a2 & 1, 5.778e-34);
  OUTLINED_FUNCTION_19(&dword_1DB8AB000, v4, v5, "%@: ANEVirtualClient 2 reqQueued=%d\n");
}

- (void)doEvaluateWithModel:(void *)a1 options:request:qos:completionEvent:error:.cold.9(void *a1)
{
  id v2 = OUTLINED_FUNCTION_23(a1);
  OUTLINED_FUNCTION_22((uint64_t)v2, *v1, 5.778e-34);
  OUTLINED_FUNCTION_24(&dword_1DB8AB000, v3, v4, "%@: ANEVirtualClient evaluateWithModel success=%lld");
}

- (void)doEvaluateWithModel:(NSObject *)a3 options:request:qos:completionEvent:error:.cold.10(void *a1, uint64_t a2, NSObject *a3)
{
  id v5 = a1;
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = v5;
  _os_log_debug_impl(&dword_1DB8AB000, a3, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualClient evaluateWithModel dictionary call succeeded", (uint8_t *)a2, 0xCu);
}

- (void)doEvaluateWithModel:(void *)a1 options:request:qos:completionEvent:error:.cold.11(void *a1)
{
  id v2 = OUTLINED_FUNCTION_23(a1);
  OUTLINED_FUNCTION_22((uint64_t)v2, *v1, 5.778e-34);
  OUTLINED_FUNCTION_24(&dword_1DB8AB000, v3, v4, "%@: ANEVirtualClient number of wait events=%llu\n");
}

- (void)doEvaluateWithModel:(void *)a1 options:request:qos:completionEvent:error:.cold.12(void *a1)
{
  id v1 = a1;
  OUTLINED_FUNCTION_27((uint64_t)v1, 5.778e-34);
  OUTLINED_FUNCTION_19(&dword_1DB8AB000, v2, v3, "%@: ANEVirtualClient reqQueued=%d\n");
}

- (void)doEvaluateWithModel:options:request:qos:completionEvent:error:.cold.13()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_1(&dword_1DB8AB000, v0, v1, "Invalid number of completion events", v2, v3, v4, v5, v6);
}

- (void)doEvaluateWithModel:(void *)a1 options:request:qos:completionEvent:error:.cold.14(void *a1)
{
  id v2 = OUTLINED_FUNCTION_23(a1);
  OUTLINED_FUNCTION_22((uint64_t)v2, *v1, 5.778e-34);
  OUTLINED_FUNCTION_24(&dword_1DB8AB000, v3, v4, "%@: ANEVirtualClient number of signal shared events=%llu\n");
}

- (void)doEvaluateWithModel:(void *)a1 options:request:qos:completionEvent:error:.cold.15(void *a1)
{
  id v2 = OUTLINED_FUNCTION_23(a1);
  OUTLINED_FUNCTION_30((uint64_t)v2, *v1, 5.778e-34);
  OUTLINED_FUNCTION_19(&dword_1DB8AB000, v3, v4, "%@: ANEVirtualClient ioSurfaceRef ID=%u\n");
}

- (void)doEvaluateWithModel:(uint64_t)a3 options:(uint64_t)a4 request:(uint64_t)a5 qos:(uint64_t)a6 completionEvent:(uint64_t)a7 error:(uint64_t)a8 .cold.16(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)doEvaluateWithModel:options:request:qos:completionEvent:error:.cold.17()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_12(&dword_1DB8AB000, v0, v1, "_ANEVirtualClient calling dictionary doEvaluateWithModel method", v2, v3, v4, v5, v6);
}

- (void)doEvaluateWithModel:options:request:qos:completionEvent:error:.cold.18()
{
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_4(&dword_1DB8AB000, v0, v1, "ANEVirtualClient evaluateWithModel qos: %d\n", v2, v3, v4, v5, v6);
}

- (void)doEvaluateWithModel:options:request:qos:completionEvent:error:.cold.19()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_10(&dword_1DB8AB000, v0, v1, "ANEVirtualClient evaluateWithModel request: %@\n", v2);
}

- (void)doEvaluateWithModel:options:request:qos:completionEvent:error:.cold.20()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_10(&dword_1DB8AB000, v0, v1, "ANEVirtualClient evaluateWithmodel options: %@\n", v2);
}

- (void)doEvaluateWithModel:options:request:qos:completionEvent:error:.cold.21()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_10(&dword_1DB8AB000, v0, v1, "ANEVirtualClient evaluateWithModel model: %@\n", v2);
}

- (void)compiledModelExistsFor:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_1(&dword_1DB8AB000, v0, v1, "ANEVirtualClient failed to call compiledModelExistsFor dictionary method", v2, v3, v4, v5, v6);
}

- (void)compiledModelExistsFor:.cold.2()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_11(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_1_6(&dword_1DB8AB000, "%@: ANEVirtualClient compiledModelExistsFor success=%lld", v4, v5);
}

- (void)compiledModelExistsFor:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_3_0(&dword_1DB8AB000, v3, v4, "%@: ANEVirtualClient compiledModelExistsFor dictionary call succeeded", v5);
}

- (void)purgeCompiledModel:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_1(&dword_1DB8AB000, v0, v1, "ANEVirtualClient failed to call purgeCompiledModel dictionary method", v2, v3, v4, v5, v6);
}

- (void)purgeCompiledModel:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_3_0(&dword_1DB8AB000, v3, v4, "%@: ANEVirtualClient purgeCompiledModel dictionary call succeeded", v5);
}

- (void)compiledModelExistsMatchingHash:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_1(&dword_1DB8AB000, v0, v1, "ANEVirtualClient failed to call compiledModelExistsMatchingHash dictionary method", v2, v3, v4, v5, v6);
}

- (void)compiledModelExistsMatchingHash:.cold.2()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_11(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_1_6(&dword_1DB8AB000, "%@: ANEVirtualClient compiledModelExistsMatchingHash dictionary success=%lld", v4, v5);
}

- (void)compiledModelExistsMatchingHash:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_3_0(&dword_1DB8AB000, v3, v4, "%@:ANEVirtualClient compiledModelExistsMatchingHash start\n", v5);
}

- (void)purgeCompiledModelMatchingHash:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_1(&dword_1DB8AB000, v0, v1, "ANEVirtualClient failed to call purgeCompiledModelMatchingHash dictionary method", v2, v3, v4, v5, v6);
}

- (void)purgeCompiledModelMatchingHash:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_12(&dword_1DB8AB000, v0, v1, "ANEVirtualClient successfully called purgeCompiledModelMatchingHash dictionary method", v2, v3, v4, v5, v6);
}

- (void)echo:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_1(&dword_1DB8AB000, v0, v1, "ANEVirtualClient failed to call echo dictionary method", v2, v3, v4, v5, v6);
}

- (void)echo:.cold.2()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_11(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_1_6(&dword_1DB8AB000, "%@: ANEVirtualClient echo dictionary success=%lld", v4, v5);
}

- (void)getDeviceInfo
{
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = OUTLINED_FUNCTION_26(v1, v2, 5.7781e-34);
  OUTLINED_FUNCTION_32(v3, v4, v5);
  OUTLINED_FUNCTION_28(&dword_1DB8AB000, "%@: Failed to call method %d with error %d", v6, v7);
}

- (void)validateNetworkCreate:uuid:function:directoryPath:scratchPadPath:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2_0(&dword_1DB8AB000, v3, v4, "%@: ANEVirtualClient validateNetworkCreate failed to create outValidationDictIOSurfaceRef", v5);
}

- (void)validateNetworkCreate:uuid:function:directoryPath:scratchPadPath:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_31(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_29(&dword_1DB8AB000, "%@: ANEVirtualClient validateNetworkCreate failed to call IOConnectCallMethod with kernResult : 0x%x", v4, v5);
}

- (void)validateNetworkCreate:(uint64_t)a3 uuid:function:directoryPath:scratchPadPath:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 136315138;
  os_log_t v4 = "-[_ANEVirtualClient validateNetworkCreate:uuid:function:directoryPath:scratchPadPath:]";
  OUTLINED_FUNCTION_13(&dword_1DB8AB000, a1, a3, "%s: FAILED copying files", (uint8_t *)&v3);
}

- (void)exchangeBuildVersionInfo
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2_0(&dword_1DB8AB000, v3, v4, "%@: ERROR productName is emptyString or nil", v5);
}

- (void)mapIOSurfacesWithModel:request:cacheInference:error:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_10(&dword_1DB8AB000, v0, v1, "ANEVirtualClient mapIOSurfacesWithModel: %@\n", v2);
}

- (void)doMapIOSurfacesWithModel:request:cacheInference:error:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2_0(&dword_1DB8AB000, v3, v4, "%@: ANEVirtualClient mapIOSurfacesWithModel _ioSPerformanceStats pointer null\n", v5);
}

- (void)doMapIOSurfacesWithModel:request:cacheInference:error:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_12(&dword_1DB8AB000, v0, v1, "ANEVirtualClient Connect to driver for kAppleVirtIONeuralEngineDeviceUserClientMapIOSurfacesWithModel.", v2, v3, v4, v5, v6);
}

- (void)doMapIOSurfacesWithModel:request:cacheInference:error:.cold.3()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_14(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_21(&dword_1DB8AB000, "%@: ANEVirtualClient mapIOSurfacesWithModel ioSurfaceRef ID=%u\n", v4, v5);
}

- (void)doMapIOSurfacesWithModel:request:cacheInference:error:.cold.4()
{
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_4(&dword_1DB8AB000, v0, v1, "ANEVirtualClient mapIOSurfacesWithModel request5 ioSID: %u", v2, v3, v4, v5, v6);
}

- (void)doMapIOSurfacesWithModel:(uint64_t)a3 request:(uint64_t)a4 cacheInference:(uint64_t)a5 error:(uint64_t)a6 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)doMapIOSurfacesWithModel:request:cacheInference:error:.cold.6()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_10(&dword_1DB8AB000, v0, v1, "ANEVirtualClient doMapIOSurfacesWithModel: %@\n", v2);
}

- (void)copyModel:options:vmData:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2_0(&dword_1DB8AB000, v3, v4, "%@: VirtualANEModel struct empty.", v5);
}

- (void)copyModel:options:vmData:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_3_0(&dword_1DB8AB000, v3, v4, "%@: ANEVirtualClient: weightname contained symlink", v5);
}

- (void)copyModel:options:vmData:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_8(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_1DB8AB000, "%@: ANEVirtualClient: weightname=%@", v4, v5);
}

- (void)copyModel:options:vmData:.cold.4()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_36(v1, v2, 5.778e-34);
  *(void *)(v3 + 14) = &stru_1F35E5710;
  OUTLINED_FUNCTION_9(&dword_1DB8AB000, v4, (uint64_t)v4, "%@: ANEVirtualClient: fileHWX=%@", v5);
}

- (void)copyModel:options:vmData:.cold.5()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_36(v1, v2, 5.778e-34);
  *(void *)(v3 + 14) = &stru_1F35E5710;
  OUTLINED_FUNCTION_9(&dword_1DB8AB000, v4, (uint64_t)v4, "%@: ANEVirtualClient: var fileHWX=%@", v5);
}

- (void)copyModel:options:vmData:.cold.6()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_8(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_1DB8AB000, "%@: ANEVirtualClient: hwx new filePath=%@", v4, v5);
}

- (void)copyFilesInDirectoryToIOSurfaces:(uint64_t)a3 ioSurfaceRefs:ioSurfaceSizes:fileNames:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 136315138;
  os_log_t v4 = "-[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:]";
  OUTLINED_FUNCTION_13(&dword_1DB8AB000, a1, a3, "%s: passed in directory path is not a directory, copy FAILED", (uint8_t *)&v3);
}

- (void)copyFilesInDirectoryToIOSurfaces:(NSObject *)a3 ioSurfaceRefs:ioSurfaceSizes:fileNames:.cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315394;
  *(void *)(a1 + 4) = "-[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:]";
  *(_WORD *)(a1 + 12) = 2048;
  *(void *)(a1 + 14) = a2;
  OUTLINED_FUNCTION_9(&dword_1DB8AB000, a3, (uint64_t)a3, "%s: Extracted %lu files to IOSurfaces", (uint8_t *)a1);
}

- (void)copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:.cold.3()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_25(&dword_1DB8AB000, v0, v1, "%s: could not read directory, copy FAILED with error : %@", (uint8_t *)v2);
}

- (void)copyAllModelFiles:dictionary:ioSurfaceRefs:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_1(&dword_1DB8AB000, v0, v1, "copyAllModelFiles invalid input arguments (one or more are nil)\n", v2, v3, v4, v5, v6);
}

- (void)copyAllModelFiles:dictionary:ioSurfaceRefs:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_1(&dword_1DB8AB000, v0, v1, "copyAllModelFiles could not get fileNamePrefix\n", v2, v3, v4, v5, v6);
}

- (void)copyAllModelFiles:dictionary:ioSurfaceRefs:.cold.3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_1(&dword_1DB8AB000, v0, v1, "copyAllModelFiles ERROR: No model files to copy\n", v2, v3, v4, v5, v6);
}

- (void)copyAllModelFiles:(uint8_t *)buf dictionary:(_DWORD *)a2 ioSurfaceRefs:(os_log_t)log .cold.4(uint8_t *buf, _DWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *a2 = 32;
  _os_log_error_impl(&dword_1DB8AB000, log, OS_LOG_TYPE_ERROR, "copyAllModelFiles ERROR : Max file count reached %d", buf, 8u);
}

- (void)copyAllModelFiles:(uint8_t *)buf dictionary:(unsigned char *)a2 ioSurfaceRefs:(os_log_t)log .cold.5(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1DB8AB000, log, OS_LOG_TYPE_DEBUG, "copyAllModelFiles No precompiled binary support, skipping HWX file", buf, 2u);
}

- (void)copyAllModelFiles:dictionary:ioSurfaceRefs:.cold.6()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_13(&dword_1DB8AB000, v0, v1, "copyAllModelFiles ERROR : could not read directory, %@", v2);
}

- (void)copyAllModelFiles:(os_log_t)log dictionary:ioSurfaceRefs:.cold.7(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = 0;
  _os_log_error_impl(&dword_1DB8AB000, log, OS_LOG_TYPE_ERROR, "copyAllModelFiles ERROR : hwxTransferSupported=%d and only HWX file passed\n", (uint8_t *)v1, 8u);
}

- (void)copyAllModelFiles:dictionary:ioSurfaceRefs:.cold.8()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_10(&dword_1DB8AB000, v0, v1, "copyAllModelFiles new directoryPath=%@\n", v2);
}

- (void)copyAllModelFiles:dictionary:ioSurfaceRefs:.cold.9()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_10(&dword_1DB8AB000, v0, v1, "copyAllModelFiles fileNamePrefix=%@\n", v2);
}

- (void)copyAllModelFiles:dictionary:ioSurfaceRefs:.cold.10()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_12(&dword_1DB8AB000, v0, v1, "copyAllModelFiles dealing with /System path\n", v2, v3, v4, v5, v6);
}

- (void)copyAllModelFiles:dictionary:ioSurfaceRefs:.cold.11()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_10(&dword_1DB8AB000, v0, v1, "copyAllModelFiles directoryPath=%@\n", v2);
}

- (void)copyModelMetaData:options:dictionary:vmData:.cold.2()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_11(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_1_6(&dword_1DB8AB000, "%@: sourceURLLength=%lld\n", v4, v5);
}

- (void)copyModelMetaData:(uint64_t)a3 options:dictionary:vmData:.cold.3(void *a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_8((uint64_t)a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_1DB8AB000, "%@: model.sourceURL=%@\n", v5, v6);
}

- (void)readWeightFilename:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_8(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_1DB8AB000, "%@: ANEVirtualClient Cannot read netfilename=%@\n", v4, v5);
}

- (void)readWeightFilename:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_3_0(&dword_1DB8AB000, v3, v4, "%@: ANEVirtualClient weightfilename is Not empty\n", v5);
}

- (void)doJsonParsingMatchWeightName:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_3_0(&dword_1DB8AB000, v3, v4, "%@: ANEVirtualClient could not parse Json.\n", v5);
}

- (void)doJsonParsingMatchWeightName:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_3_0(&dword_1DB8AB000, v3, v4, "%@: ANEVirtualClient weightfilename does not exists.\n", v5);
}

- (void)doJsonParsingMatchWeightName:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_8(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_1DB8AB000, "%@: ANEVirtualClient weightfilename=%@\n", v4, v5);
}

- (void)doJsonParsingMatchWeightName:.cold.4()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_3_0(&dword_1DB8AB000, v3, v4, "%@: ANEVirtualClient no match for weightfilename.\n", v5);
}

- (void)parallelDecompressedData:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_18(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_25(&dword_1DB8AB000, v6, v4, "%@: Block size too big %lld ", v5);
}

- (void)parallelDecompressedData:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_14(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_29(&dword_1DB8AB000, "%@: Invalid decompression algorithm %c ", v4, v5);
}

- (void)copyModelOptionFiles:options:vmData:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_3_0(&dword_1DB8AB000, v3, v4, "%@: ANEVirtualClient options empty\n", v5);
}

- (void)copyModelOptionFiles:options:vmData:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_18(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_1DB8AB000, "%@: FILEData wrote %lu\n", v4, v5);
}

- (void)copyErrorValue:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2_0(&dword_1DB8AB000, v3, v4, "%@: ANEVirtualClient ioSurfaceRef pointer null\n", v5);
}

- (void)copyToIOSurface:length:ioSID:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2_0(&dword_1DB8AB000, v3, v4, "%@: ERROR passed in ioSID pointer is NULL", v5);
}

- (void)copyToIOSurface:length:ioSID:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2_0(&dword_1DB8AB000, v3, v4, "%@: ERROR passed in length=0", v5);
}

- (void)copyToIOSurface:length:ioSID:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_18(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_25(&dword_1DB8AB000, v6, v4, "%@: FAILED to create IOSurface with length=%lu", v5);
}

- (void)copyToIOSurface:size:ioSID:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2_0(&dword_1DB8AB000, v3, v4, "%@: ANEVirtualClient ioSID pointer null\n", v5);
}

- (void)copyToIOSurface:size:ioSID:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_3_0(&dword_1DB8AB000, v3, v4, "%@: ANEVirtualClient length==0\n", v5);
}

+ (void)printIOSurfaceDataInBytes:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 136315138;
  os_log_t v4 = "+[_ANEVirtualClient printIOSurfaceDataInBytes:]";
  OUTLINED_FUNCTION_13(&dword_1DB8AB000, a1, a3, "%s:ANEVirtualClient cannot getIOSurfaceObject", (uint8_t *)&v3);
}

- (void)getModelAttribute:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_1(&dword_1DB8AB000, v0, v1, "getModelAttribute: IOSATTribute null", v2, v3, v4, v5, v6);
}

- (void)getModelAttribute:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_1(&dword_1DB8AB000, v0, v1, "getModelAttribute: DataBaseAddress null", v2, v3, v4, v5, v6);
}

- (void)getObjectFromIOSurface:(NSObject *)a1 classType:(uint64_t)a2 length:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 136315138;
  uint64_t v4 = "-[_ANEVirtualClient getObjectFromIOSurface:classType:length:]";
  OUTLINED_FUNCTION_13(&dword_1DB8AB000, a1, a3, "%s:ANEVirtualClient cannot getIOSurfaceObject", (uint8_t *)&v3);
}

- (void)getObjectFromIOSurface:(NSObject *)a1 classType:(uint64_t)a2 length:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 136315138;
  uint64_t v4 = "-[_ANEVirtualClient getObjectFromIOSurface:classType:length:]";
  OUTLINED_FUNCTION_13(&dword_1DB8AB000, a1, a3, "%s:ANEVirtualClient cannot have nil data.", (uint8_t *)&v3);
}

+ (void)getCFDictionaryFromIOSurface:dataLength:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_1(&dword_1DB8AB000, v0, v1, "_ANEVirtualClient getCFDictionaryFromIOSurface : ioSurfaceRef null", v2, v3, v4, v5, v6);
}

+ (void)getCFDictionaryFromIOSurface:(uint64_t)a3 dataLength:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 136315394;
  uint64_t v4 = "+[_ANEVirtualClient getCFDictionaryFromIOSurface:dataLength:]";
  __int16 v5 = 2048;
  uint64_t v6 = a1;
  OUTLINED_FUNCTION_25(&dword_1DB8AB000, a2, a3, "%s : memory allocation failed, size requested:%llu", (uint8_t *)&v3);
}

+ (void)getCFDictionaryFromIOSurface:dataLength:.cold.3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_1(&dword_1DB8AB000, v0, v1, "_ANEVirtualClient getCFDictionaryFromIOSurface : DataBaseAddress null", v2, v3, v4, v5, v6);
}

+ (void)getCFDictionaryFromIOSurface:dataLength:.cold.4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_1(&dword_1DB8AB000, v0, v1, "_ANEVirtualClient getCFDictionaryFromIOSurface : couldn't create CFDataRef object", v2, v3, v4, v5, v6);
}

+ (void)getCFDictionaryFromIOSurface:dataLength:.cold.5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_1(&dword_1DB8AB000, v0, v1, "_ANEVirtualClient getCFDictionaryFromIOSurface : Couldn't create CFDictionaryRef object", v2, v3, v4, v5, v6);
}

+ (void)copyDictionaryDataToStruct:dictionary:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2_0(&dword_1DB8AB000, v3, v4, "%@: copyDictionaryDataToStruct input data NULL", v5);
}

+ (void)setCodeSigningIdentity:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_9(&dword_1DB8AB000, v0, v1, "%s: csIdentity:%@", (uint8_t *)v2);
}

+ (void)setCodeSigningIdentity:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 136315138;
  os_log_t v4 = "+[_ANEVirtualClient setCodeSigningIdentity:]";
  OUTLINED_FUNCTION_13(&dword_1DB8AB000, a1, a3, "%s: nil csIdentity", (uint8_t *)&v3);
}

- (void)callIOUserClientWithDictionary:inDictionary:error:.cold.1()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_14(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_29(&dword_1DB8AB000, "%@:ANEVirtualClient FAILED to serialize input dictionary for command=%d", v4, v5);
}

- (void)callIOUserClientWithDictionary:(NSObject *)a1 inDictionary:(uint64_t)a2 error:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 136315394;
  os_log_t v4 = "-[_ANEVirtualClient callIOUserClientWithDictionary:inDictionary:error:]";
  __int16 v5 = 2048;
  uint64_t v6 = 4096;
  OUTLINED_FUNCTION_25(&dword_1DB8AB000, a1, a3, "%s : memory allocation failed, size requested:%zu", (uint8_t *)&v3);
}

- (void)callIOUserClientWithDictionary:inDictionary:error:.cold.3()
{
  OUTLINED_FUNCTION_15();
  *(_DWORD *)uint64_t v1 = 138412546;
  *(void *)(v1 + 4) = v2;
  *(_WORD *)(v1 + 12) = 2112;
  *(void *)(v1 + 14) = v3;
  OUTLINED_FUNCTION_25(&dword_1DB8AB000, v5, v1, "%@:ANEVirtualClient FAILED to unserialize dictionary=%@", v4);
}

- (void)checkKernReturnValue:selector:outParams:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_31(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_21(&dword_1DB8AB000, "%@: ANEVirtualClient Successfully called method %d.\n", v4, v5);
}

- (void)updateError:error:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2_0(&dword_1DB8AB000, v3, v4, "%@: Failed with NULL databaseAddress", v5);
}

- (void)updatePerformanceStats:.cold.1()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_11(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_25(&dword_1DB8AB000, v6, v4, "%@: No Data in performanceStats with length=%llu", v5);
}

@end