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
- (void)purgeCompiledModel:(id)a3;
- (void)purgeCompiledModelMatchingHash:(id)a3;
- (void)releaseIOSurfaces:(VMData *)a3;
- (void)sendGuestBuildVersion;
@end

@implementation _ANEVirtualClient

+ (id)new
{
  return 0;
}

- (_ANEVirtualClient)init
{
  return 0;
}

+ (id)sharedConnection
{
  if (qword_100057DD8 != -1) {
    dispatch_once(&qword_100057DD8, &stru_10004CA78);
  }
  v2 = (void *)qword_100057DE0;
  return v2;
}

- (_ANEVirtualClient)initWithSingletonAccess
{
  kern_return_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint32_t outputCnt;
  uint64_t output;
  uint8_t buf;
  unsigned char v28[11];
  io_iterator_t existing;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)_ANEVirtualClient;
  v3 = [(_ANEVirtualClient *)&v30 init];
  if (!v3) {
    goto LABEL_32;
  }
  uint64_t v4 = +[_ANELog framework];
  v5 = (void *)qword_100057DD0;
  qword_100057DD0 = v4;

  if (!+[_ANEDeviceInfo isVirtualMachine])
  {
    if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG)) {
      sub_10002EAA0();
    }
    goto LABEL_8;
  }
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.ane.avc", 0);
  queue = v3->_queue;
  v3->_queue = (OS_dispatch_queue *)v6;

  v3->_connect = 0;
  existing = 0;
  CFDictionaryRef v8 = IOServiceMatching("AppleVirtIONeuralEngineDevice");
  if (!IOServiceGetMatchingServices(kIOMainPortDefault, v8, &existing))
  {
    if (!existing)
    {
      if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG)) {
        sub_10002E874();
      }
      goto LABEL_8;
    }
    for (char i = 0; ; char i = 1)
    {
      io_service_t v11 = IOIteratorNext(existing);
      if (!v11) {
        break;
      }
      v12 = qword_100057DD0;
      if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG)) {
        sub_10002E9F8(&buf, v28, v12);
      }
      if (IOServiceOpen(v11, mach_task_self_, 0, &v3->_connect))
      {
        if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG)) {
          sub_10002E9C4();
        }
        char i = 1;
        break;
      }
      IOObjectRelease(v11);
    }
    IOObjectRelease(existing);
    BOOL v13 = os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG);
    if ((i & 1) == 0)
    {
      if (v13) {
        sub_10002E990();
      }
      goto LABEL_8;
    }
    if (v13) {
      sub_10002E95C();
    }
    output = 0;
    outputCnt = 1;
    v14 = IOConnectCallScalarMethod(v3->_connect, 0, 0, 0, &output, &outputCnt);
    v15 = qword_100057DD0;
    if (v14)
    {
      v16 = (id)qword_100057DD0;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_10002E918();
      }

      goto LABEL_8;
    }
    if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG)) {
      sub_10002E8A8(v15, v17, v18, v19, v20, v21, v22, v23);
    }
LABEL_32:
    [(_ANEVirtualClient *)v3 exchangeBuildVersionInfo];
    v9 = v3;
    goto LABEL_33;
  }
  if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG)) {
    sub_10002EA38();
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

- (BOOL)compileModel:(id)a3 options:(id)a4 qos:(unsigned int)a5 error:(id *)a6
{
  id v10 = a3;
  id v38 = a4;
  io_service_t v11 = (id)qword_100057DD0;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    sub_10002EC08();
  }

  bzero(v40, 0x1728uLL);
  if (([(_ANEVirtualClient *)self negotiatedCapabilityMask] & 4) == 0)
  {
    [(_ANEVirtualClient *)self copyModel:v10 options:v38 vmData:v40];
    [(_ANEVirtualClient *)self copyOptions:v38 vmData:v40];
    [(_ANEVirtualClient *)self copyModelOptionFiles:v10 options:v38 vmData:v40];
    [(_ANEVirtualClient *)self copyErrorValue:v40];
    v43[0] = a5;
    [(_ANEVirtualClient *)self callIOUserClient:1 inParams:&v42 outParams:&v44];
    v12 = 0;
LABEL_11:
    if (v45)
    {
      v17 = +[_ANEVirtualClient dictionaryGetNSStringForKey:v12 key:@"modelCacheURLIdentifier"];
      if (v17) {
        [v10 setCacheURLIdentifier:v17];
      }
      v18 = [(_ANEVirtualClient *)self getModelAttribute:v40];
      [v10 updateModelAttributes:v18 state:2];
      v19 = (id)qword_100057DD0;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_10002EB18();
      }
    }
    if (a6 && v47)
    {
      IOSurfaceLock(buffer, 0, 0);
      BaseAddress = IOSurfaceGetBaseAddress(buffer);
      id v21 = objc_alloc((Class)NSData);
      id v36 = [v21 initWithBytes:BaseAddress length:v47];
      uint64_t v50 = objc_opt_class();
      v22 = +[NSArray arrayWithObjects:&v50 count:1];
      uint64_t v34 = +[NSSet setWithArray:v22];

      id v39 = 0;
      id v23 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v36 error:&v39];
      id v24 = v39;
      if (v24)
      {
        v25 = (id)qword_100057DD0;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          sub_10002EAD4();
        }
      }
      v26 = objc_msgSend(v23, "decodeObjectOfClasses:forKey:", v34, NSKeyedArchiveRootObjectKey, v34);
      IOSurfaceUnlock(buffer, 0, 0);
      v27 = +[_ANEStrings errorDomainVirtIO];
      uint64_t v28 = v46;
      NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
      v49 = v26;
      v29 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
      v30 = +[NSError errorWithDomain:v27 code:v28 userInfo:v29];

      id v31 = v30;
      *a6 = v31;
    }
    [(_ANEVirtualClient *)self updateError:v40 error:a6];
    [(_ANEVirtualClient *)self releaseIOSurfaces:v40];
    if (v12) {
      CFRelease(v12);
    }
    BOOL v32 = v45 != 0;
    goto LABEL_27;
  }
  if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG)) {
    sub_10002EBD4();
  }
  uint64_t v45 = 0;
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFMutableArrayRef v14 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  [(_ANEVirtualClient *)self copyAllModelFiles:v10 dictionary:Mutable ioSurfaceRefs:v14];
  [(_ANEVirtualClient *)self copyModelMetaData:v10 options:v38 dictionary:Mutable vmData:v40];
  [(_ANEVirtualClient *)self copyOptions:v38 dictionary:Mutable vmData:v40];
  [(_ANEVirtualClient *)self copyModelOptionFiles:v10 options:v38 dictionary:Mutable vmData:v40];
  [(_ANEVirtualClient *)self copyErrorValue:Mutable vmData:v40];
  v43[0] = a5;
  CFNumberRef v15 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, v43);
  CFDictionarySetValue(Mutable, @"qos", v15);
  CFRelease(v15);
  +[_ANEVirtualClient setCodeSigningIdentity:Mutable];
  [(_ANEVirtualClient *)self printDictionary:Mutable];
  v12 = [(_ANEVirtualClient *)self callIOUserClientWithDictionary:1 inDictionary:Mutable error:a6];
  CFRelease(Mutable);
  [(_ANEVirtualClient *)self printDictionary:v12];
  +[_ANEVirtualClient freeModelFileIOSurfaces:v14];
  CFRelease(v14);
  if (v12)
  {
    v16 = (id)qword_100057DD0;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_10002EB90();
    }

    +[_ANEVirtualClient copyDictionaryDataToStruct:&v44 dictionary:v12];
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR)) {
    sub_10002EB5C();
  }
  [(_ANEVirtualClient *)self releaseIOSurfaces:v40];
  BOOL v32 = 0;
LABEL_27:

  return v32;
}

+ (void)printStruct:(VirtANEModel *)a3
{
  if (a3)
  {
    uint64_t v4 = qword_100057DD0;
    if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG)) {
      sub_10002EC4C((uint64_t)a3, v4);
    }
  }
}

- (BOOL)loadModel:(id)a3 options:(id)a4 qos:(unsigned int)a5 error:(id *)a6
{
  uint64_t v6 = __chkstk_darwin(self, a2, a3, a4, *(void *)&a5, a6);
  aSelector = v7;
  uint64_t v45 = v8;
  int v10 = v9;
  v12 = v11;
  BOOL v13 = (void *)v6;
  id v15 = v14;
  id v16 = v12;
  v17 = (id)qword_100057DD0;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v42 = NSStringFromSelector(aSelector);
    *(_DWORD *)buf = 138412802;
    unsigned int v47 = v42;
    __int16 v48 = 2112;
    id v49 = v15;
    __int16 v50 = 2112;
    id v51 = v16;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%@:ANEVirtualClient start Model=%@ options=%@\n", buf, 0x20u);
  }
  bzero(buf, 0x1728uLL);
  if (([v13 negotiatedCapabilityMask] & 4) != 0)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG)) {
      sub_10002F244();
    }
    uint64_t v55 = 0;
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFMutableArrayRef v21 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    v22 = [v15 modelURL];
    BOOL v23 = v22 == 0;

    if (v23
      || ([v13 copyAllModelFiles:v15 dictionary:Mutable ioSurfaceRefs:v21] & 1) != 0)
    {
      id v24 = objc_msgSend(v15, "getCacheURLIdentifier", aSelector);
      BOOL v25 = v24 == 0;

      if (!v25)
      {
        v26 = [v15 cacheURLIdentifier];

        v27 = (id)qword_100057DD0;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(aSelectora);
          objc_claimAutoreleasedReturnValue();
          sub_10002F200();
        }

        CFDictionarySetValue(Mutable, @"modelCacheURLIdentifier", v26);
      }
      [v13 copyModelMetaData:v15 options:v16 dictionary:Mutable vmData:buf];
      [v13 copyOptions:v16 dictionary:Mutable vmData:buf];
      [v13 copyModelOptionFiles:v15 options:v16 dictionary:Mutable vmData:buf];
      [v13 copyErrorValue:Mutable vmData:buf];
      v53[0] = v10;
      CFNumberRef v28 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, v53);
      CFDictionarySetValue(Mutable, @"qos", v28);
      CFRelease(v28);
      v29 = [v15 getCacheURLIdentifier];
      LODWORD(v28) = v29 == 0;

      if (v28) {
        operator new();
      }
      +[_ANEVirtualClient setCodeSigningIdentity:Mutable];
      [v13 printDictionary:Mutable];
      id v19 = [v13 callIOUserClientWithDictionary:2 inDictionary:Mutable error:v45];
      CFRelease(Mutable);
      [v13 printDictionary:v19];
      v30 = [v15 modelURL];
      BOOL v31 = v30 == 0;

      if (!v31)
      {
        +[_ANEVirtualClient freeModelFileIOSurfaces:v21];
        CFRelease(v21);
      }
      if (v19)
      {
        BOOL v32 = (id)qword_100057DD0;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(aSelectora);
          objc_claimAutoreleasedReturnValue();
          sub_10002F150();
        }

        +[_ANEVirtualClient copyDictionaryDataToStruct:&v54 dictionary:v19];
        goto LABEL_25;
      }
      if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR)) {
        sub_10002F11C();
      }
      [v13 releaseIOSurfaces:buf];
    }
    else
    {
      CFRelease(Mutable);
      CFRelease(v21);
    }
    BOOL v39 = 0;
    goto LABEL_42;
  }
  [v13 copyModel:v15 options:v16 vmData:buf];
  [v13 copyOptions:v16 vmData:buf];
  [v13 copyModelOptionFiles:v15 options:v16 vmData:buf];
  [v13 copyErrorValue:buf];
  v53[0] = v10;
  v18 = qword_100057DD0;
  if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG)) {
    sub_10002EFF8((uint64_t)buf, v53, v18);
  }
  objc_msgSend(v13, "callIOUserClient:inParams:outParams:", 2, &v52, &v54, aSelector);
  id v19 = 0;
LABEL_25:
  v33 = [v13 getModelAttribute:buf];
  if (v55)
  {
    uint64_t v34 = +[_ANEVirtualClient dictionaryGetNSStringForKey:v19 key:@"modelCacheURLIdentifier"];
    if (v34) {
      [v15 setCacheURLIdentifier:v34];
    }
    [v15 updateModelAttributes:v33 state:v59 programHandle:v56 intermediateBufferHandle:v57 queueDepth:v58];
    id v35 = +[_ANEProgramForEvaluation programWithHandle:v56 intermediateBufferHandle:v57 queueDepth:v58];
    [v15 setProgram:v35];

    id v36 = +[_ANEDeviceController controllerWithProgramHandle:v56];
    v37 = +[_ANEProgramIOSurfacesMapper mapperWithController:v36];
    [v15 setMapper:v37];

    v40 = (id)qword_100057DD0;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(aSelectora);
      objc_claimAutoreleasedReturnValue();
      sub_10002EF70();
    }
  }
  else
  {
    id v38 = (id)qword_100057DD0;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(aSelectora);
      objc_claimAutoreleasedReturnValue();
      sub_10002EF2C();
    }

    [v15 updateModelAttributes:v33 state:5];
  }
  [v13 updateError:buf error:v45];
  [v13 releaseIOSurfaces:buf];
  if (v19) {
    CFRelease(v19);
  }
  BOOL v39 = v55 != 0;

LABEL_42:
  return v39;
}

- (BOOL)loadModelNewInstance:(id)a3 options:(id)a4 modelInstParams:(id)a5 qos:(unsigned int)a6 error:(id *)a7
{
  uint64_t v7 = __chkstk_darwin(self, a2, a3, a4, a5, *(void *)&a6);
  uint64_t v37 = v9;
  aSelector = v8;
  int v11 = v10;
  BOOL v13 = v12;
  id v15 = v14;
  id v16 = (void *)v7;
  id v42 = v17;
  id v40 = v15;
  id v41 = v13;
  LODWORD(v15) = [v16 negotiatedDataInterfaceVersion];
  v18 = (id)qword_100057DD0;
  id v19 = v18;
  if (v15 >> 10 <= 0x80)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(aSelector);
      objc_claimAutoreleasedReturnValue();
      sub_10002F278();
    }

LABEL_5:
    BOOL v20 = 0;
    goto LABEL_26;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    id v35 = NSStringFromSelector(aSelector);
    *(_DWORD *)v43 = 138412802;
    uint64_t v44 = v35;
    __int16 v45 = 2112;
    id v46 = v42;
    __int16 v47 = 2112;
    id v48 = v40;
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%@:ANEVirtualClient loadModelNewInstance Model=%@ options=%@\n", v43, 0x20u);
  }
  bzero(v43, 0x1728uLL);
  if (([v16 negotiatedCapabilityMask] & 4) != 0)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG)) {
      sub_10002F2BC();
    }
    uint64_t v50 = 0;
    theDict = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFMutableArrayRef cf = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    v26 = [v42 modelURL];
    BOOL v27 = v26 == 0;

    if (v27
      || ([v16 copyAllModelFiles:v42 dictionary:theDict ioSurfaceRefs:cf] & 1) != 0)
    {
      CFNumberRef v28 = [v42 getCacheURLIdentifier];
      BOOL v29 = v28 == 0;

      if (!v29)
      {
        v30 = [v42 cacheURLIdentifier];

        BOOL v31 = (id)qword_100057DD0;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(aSelector);
          objc_claimAutoreleasedReturnValue();
          sub_10002F200();
        }

        CFDictionarySetValue(theDict, @"modelCacheURLIdentifier", v30);
      }
      [v16 copyModelMetaData:v42 options:v40 dictionary:theDict vmData:v43];
      [v16 copyOptions:v40 dictionary:theDict vmData:v43];
      [v16 copyModelOptionFiles:v42 options:v40 dictionary:theDict vmData:v43];
      [v16 copyErrorValue:theDict vmData:v43];
      v49[0] = v11;
      CFNumberRef v32 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, v49);
      CFDictionarySetValue(theDict, @"qos", v32);
      CFRelease(v32);
      operator new();
    }
    CFRelease(theDict);
    CFRelease(cf);
    goto LABEL_5;
  }
  CFMutableArrayRef v21 = [v16 getModelAttribute:v43];
  if (v50)
  {
    [v42 updateModelAttributes:v21 state:v54 programHandle:v51 intermediateBufferHandle:v52 queueDepth:v53];
    v22 = +[_ANEProgramForEvaluation programWithHandle:v51 intermediateBufferHandle:v52 queueDepth:v53];
    [v42 setProgram:v22];

    BOOL v23 = +[_ANEDeviceController controllerWithProgramHandle:v51];
    id v24 = +[_ANEProgramIOSurfacesMapper mapperWithController:v23];
    [v42 setMapper:v24];

    BOOL v25 = (id)qword_100057DD0;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(aSelector);
      objc_claimAutoreleasedReturnValue();
      sub_10002EF70();
    }
  }
  else
  {
    v33 = (id)qword_100057DD0;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(aSelector);
      objc_claimAutoreleasedReturnValue();
      sub_10002EF2C();
    }

    [v42 updateModelAttributes:v21 state:5];
  }
  [v16 updateError:v43 error:v37];
  [v16 releaseIOSurfaces:v43];
  BOOL v20 = v50 != 0;

LABEL_26:
  return v20;
}

- (BOOL)unloadModel:(id)a3 options:(id)a4 qos:(unsigned int)a5 error:(id *)a6
{
  id v9 = a3;
  id v54 = a4;
  int v10 = (id)qword_100057DD0;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v50 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    v82 = v50;
    __int16 v83 = 2112;
    id v84 = v9;
    __int16 v85 = 2112;
    id v86 = v54;
    LOWORD(v87) = 1024;
    *(_DWORD *)((char *)&v87 + 2) = a5;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%@: Model=%@ options=%@ qos=%d\n", buf, 0x26u);
  }
  bzero(buf, 0x1728uLL);
  if (([(_ANEVirtualClient *)self negotiatedCapabilityMask] & 4) == 0)
  {
    [(_ANEVirtualClient *)self copyErrorValue:buf];
    int v11 = +[NSKeyedArchiver archivedDataWithRootObject:v54 requiringSecureCoding:1 error:0];
    v12 = [v9 key];
    id v13 = [v12 length];
    if (v13)
    {
      id v14 = [v9 key];
      id v15 = v14;
    }
    else
    {
      id v15 = [v9 modelURL];
      id v14 = [v15 path];
    }
    BOOL v27 = +[NSKeyedArchiver archivedDataWithRootObject:v14 requiringSecureCoding:1 error:0];
    if (!v13) {

    }
    v87 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v11, [v11 length], v101);
    v88 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v27, [v27 length], v92);
    uint64_t v90 = 0;
    int v91 = 0;
    id v94 = objc_msgSend(v9, "string_id");
    id v95 = [v9 programHandle];
    id v96 = [v9 intermediateBufferHandle];
    v97[0] = [v9 queueDepth];
    int v98 = 0;
    unsigned int v99 = [v9 perfStatsMask];
    unsigned int v100 = a5;
    CFNumberRef v28 = qword_100057DD0;
    if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uint64_t v55 = 67112192;
      int v56 = v90;
      __int16 v57 = 1024;
      int v58 = HIDWORD(v90);
      __int16 v59 = 1024;
      int v60 = v91;
      __int16 v61 = 1024;
      int v62 = v92[0];
      __int16 v63 = 2048;
      id v64 = v94;
      __int16 v65 = 2048;
      id v66 = v95;
      __int16 v67 = 2048;
      id v68 = v96;
      __int16 v69 = 1024;
      int v70 = v97[0];
      __int16 v71 = 1024;
      int v72 = v98;
      __int16 v73 = 1024;
      unsigned int v74 = v99;
      __int16 v75 = 1024;
      unsigned int v76 = v100;
      __int16 v77 = 1024;
      int v78 = v101[0];
      __int16 v79 = 1024;
      int v80 = v101[413];
      _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "ANEVirtualClient virtualANEModel.ioSIDModelNet=%u virtualANEModel.ioSIDModelShape=%u virtualANEModel.ioSIDModelWeight=%u virtualANEModel.ioSIDKey=%u virtualANEModel.string_id=%lld virtualANEModel.programHandle=%lld virtualANEModel.intermediateBufferHandle=%lld virtualANEModel.queueDepth=%d virtualANEModel.ioSIDModelAttributes=%u virtualANEModel.perfStatsMask=%u virtualANEModel.qos=%u virtualANEModel.ioSIDOptions=%u virtualANEModel.ioSIDErrorValue=%u", v55, 0x5Cu);
    }
    BOOL v29 = [(_ANEVirtualClient *)self callIOUserClient:3 inParams:&v89 outParams:&v102];
    v30 = qword_100057DD0;
    if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG)) {
      sub_10002F2F0(v29, v30, v31, v32, v33, v34, v35, v36);
    }

LABEL_35:
    [(_ANEVirtualClient *)self updateError:buf error:a6];
    [(_ANEVirtualClient *)self releaseIOSurfaces:buf];
    goto LABEL_36;
  }
  if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG)) {
    sub_10002F41C();
  }
  uint64_t v103 = 0;
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFMutableArrayRef cf = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  [(_ANEVirtualClient *)self copyModelMetaData:v9 options:&__NSDictionary0__struct dictionary:Mutable vmData:buf];
  id v17 = [v9 modelURL];
  BOOL v18 = v17 == 0;

  if (!v18) {
    [(_ANEVirtualClient *)self copyAllModelFiles:v9 dictionary:Mutable ioSurfaceRefs:cf];
  }
  id v19 = [v9 getCacheURLIdentifier];
  BOOL v20 = v19 == 0;

  if (!v20)
  {
    CFMutableArrayRef v21 = [v9 cacheURLIdentifier];

    v22 = (id)qword_100057DD0;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_10002F200();
    }

    CFDictionarySetValue(Mutable, @"modelCacheURLIdentifier", v21);
  }
  [(_ANEVirtualClient *)self copyErrorValue:Mutable vmData:buf];
  [(_ANEVirtualClient *)self copyOptions:v54 dictionary:Mutable vmData:buf];
  BOOL v23 = [v9 key];
  id v24 = [v23 length];
  if (v24)
  {
    BOOL v25 = [v9 key];
    v26 = v25;
  }
  else
  {
    v26 = [v9 modelURL];
    BOOL v25 = [v26 path];
  }
  int v11 = +[NSKeyedArchiver archivedDataWithRootObject:v25 requiringSecureCoding:1 error:0];
  if (!v24) {

  }
  v88 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v11, [v11 length], v92);
  CFNumberRef v37 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, v92);
  CFDictionarySetValue(Mutable, @"ioSIDKey", v37);
  CFRelease(v37);
  v93[0] = [v11 length];
  CFNumberRef v38 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, v93);
  CFDictionarySetValue(Mutable, @"keyLength", v38);
  CFRelease(v38);
  id v94 = objc_msgSend(v9, "string_id");
  CFNumberRef v39 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &v94);
  CFDictionarySetValue(Mutable, @"string_id", v39);
  CFRelease(v39);
  id v95 = [v9 programHandle];
  CFNumberRef v40 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &v95);
  CFDictionarySetValue(Mutable, @"programHandle", v40);
  CFRelease(v40);
  id v96 = [v9 intermediateBufferHandle];
  CFNumberRef v41 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &v96);
  CFDictionarySetValue(Mutable, @"intermediateBufferHandle", v41);
  CFRelease(v41);
  v97[0] = [v9 queueDepth];
  CFNumberRef v42 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, v97);
  CFDictionarySetValue(Mutable, @"queueDepth", v42);
  CFRelease(v42);
  unsigned int v99 = [v9 perfStatsMask];
  CFNumberRef v43 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v99);
  CFDictionarySetValue(Mutable, @"perfStatsMask", v43);
  CFRelease(v43);
  unsigned int v100 = a5;
  CFNumberRef v44 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v100);
  CFDictionarySetValue(Mutable, @"qos", v44);
  CFRelease(v44);
  [(_ANEVirtualClient *)self printDictionary:Mutable];
  __int16 v45 = [(_ANEVirtualClient *)self callIOUserClientWithDictionary:3 inDictionary:Mutable error:a6];
  CFRelease(Mutable);
  [(_ANEVirtualClient *)self printDictionary:v45];
  id v46 = [v9 modelURL];
  LOBYTE(v44) = v46 == 0;

  if ((v44 & 1) == 0)
  {
    +[_ANEVirtualClient freeModelFileIOSurfaces:cf];
    CFRelease(cf);
  }
  if (v45)
  {
    __int16 v47 = (id)qword_100057DD0;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_10002F3D8();
    }

    +[_ANEVirtualClient copyDictionaryDataToStruct:&v102 dictionary:v45];
    LOBYTE(v29) = v103 == 1;
    id v48 = (id)qword_100057DD0;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_10002F394();
    }

    CFRelease(v45);
    goto LABEL_35;
  }
  if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR)) {
    sub_10002F360();
  }
  [(_ANEVirtualClient *)self releaseIOSurfaces:buf];

  LOBYTE(v29) = 0;
LABEL_36:

  return v29;
}

- (BOOL)evaluateWithModel:(id)a3 options:(id)a4 request:(id)a5 qos:(unsigned int)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = v15;
  uint64_t v58 = 0;
  __int16 v59 = &v58;
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
      id v37 = [objc_alloc((Class)IOSurfaceSharedEventListener) initWithDispatchQueue:v36];
      if (!v37 && os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR)) {
        sub_10002F494();
      }
      id v19 = objc_opt_new();
      uint64_t v34 = +[_ANESharedSignalEvent signalEventWithValue:symbolIndex:eventType:sharedEvent:](_ANESharedSignalEvent, "signalEventWithValue:symbolIndex:eventType:sharedEvent:", 4097, 0, 0, v19, v19);
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_10000D4B0;
      v55[3] = &unk_10004CAA0;
      id v56 = v19;
      id v20 = v16;
      id v57 = v20;
      id v33 = v56;
      [v56 notifyListener:v37 atValue:4097 block:v55];
      CFMutableArrayRef v21 = objc_opt_new();
      uint64_t v35 = +[_ANESharedSignalEvent signalEventWithValue:1 symbolIndex:0 eventType:0 sharedEvent:v21];
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_10000D6A4;
      v52[3] = &unk_10004CAA0;
      id v22 = v21;
      id v53 = v22;
      id v23 = v20;
      id v54 = v23;
      [v22 notifyListener:v37 atValue:1 block:v52];
      id v24 = qword_100057DD0;
      if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        id v64 = v34;
        __int16 v65 = 2048;
        id v66 = v35;
        __int16 v67 = 2112;
        id v68 = v13;
        _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "[_ANEVirtualClient] completionEvent success event %p error event %p for model %@\n", buf, 0x20u);
      }
      v62[0] = v34;
      v62[1] = v35;
      BOOL v25 = +[NSArray arrayWithObjects:v62 count:2];
      v26 = +[_ANESharedEvents sharedEventsWithSignalEvents:v25 waitEvents:&__NSArray0__struct];

      BOOL v27 = [(_ANEVirtualClient *)self queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000D928;
      block[3] = &unk_10004CAC8;
      uint64_t v50 = &v58;
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
    uint64_t v31 = (id)qword_100057DD0;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_10002F450();
    }

LABEL_15:
    BOOL v30 = 0;
    goto LABEL_16;
  }
  BOOL v29 = [(_ANEVirtualClient *)self queue];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10000D988;
  v38[3] = &unk_10004CAF0;
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
  id v290 = a3;
  id v289 = a4;
  id v294 = a5;
  id v295 = a7;
  v12 = (id)qword_100057DD0;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_10002FC44();
  }

  id v13 = (id)qword_100057DD0;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_10002FBD8();
  }

  id v14 = (id)qword_100057DD0;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_10002FB6C();
  }

  id v15 = (id)qword_100057DD0;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_10002FB04();
  }

  bzero(v355, 0x1728uLL);
  if (([(_ANEVirtualClient *)self negotiatedCapabilityMask] & 4) == 0)
  {
    [(_ANEVirtualClient *)self copyModel:v290 options:v289 vmData:v355];
    [(_ANEVirtualClient *)self copyErrorValue:v355];
    v300 = +[NSKeyedArchiver archivedDataWithRootObject:v289 requiringSecureCoding:1 error:0];
    v356 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v300, [v300 length], v366);
    id v359 = objc_msgSend(v290, "string_id");
    id v360 = [v290 programHandle];
    id v361 = [v290 intermediateBufferHandle];
    signed __int8 v362 = [v290 queueDepth];
    unsigned int v364 = [v290 perfStatsMask];
    unsigned int v365 = a6;
    id v16 = qword_100057DD0;
    if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v395 = 67112192;
      *(_DWORD *)&v395[4] = v358[4];
      *(_WORD *)&v395[8] = 1024;
      *(_DWORD *)&v395[10] = v358[5];
      *(_WORD *)&v395[14] = 1024;
      *(_DWORD *)&v395[16] = v358[6];
      *(_WORD *)&v395[20] = 1024;
      *(_DWORD *)v396 = v358[7];
      *(_WORD *)&v396[4] = 2048;
      *(void *)&v396[6] = v359;
      *(_WORD *)&v396[14] = 2048;
      *(void *)&v396[16] = v360;
      __int16 v397 = 2048;
      id v398 = v361;
      __int16 v399 = 1024;
      int v400 = v362;
      __int16 v401 = 1024;
      int v402 = v363;
      __int16 v403 = 1024;
      unsigned int v404 = v364;
      __int16 v405 = 1024;
      unsigned int v406 = v365;
      __int16 v407 = 1024;
      int v408 = v366[0];
      __int16 v409 = 1024;
      int v410 = v375;
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate: virtualANEModel.ioSIDModelNet=%u virtualANEModel.ioSIDModelShape=%u virtualANEModel.ioSIDModelWeight=%u virtualANEModel.ioSIDKey=%u virtualANEModel.string_id=%lld virtualANEModel.programHandle=%lld virtualANEModel.intermediateBufferHandle=%lld virtualANEModel.queueDepth=%d virtualANEModel.ioSIDModelAttributes=%u virtualANEModel.perfStatsMask=%u virtualANEModel.qos=%u virtualANEModel.ioSIDOptions=%u virtualANEModel.ioSIDErrorValue=%u", v395, 0x5Cu);
    }
    long long v324 = 0u;
    long long v325 = 0u;
    long long v322 = 0u;
    long long v323 = 0u;
    id v17 = [v294 inputArray];
    id v18 = [v17 countByEnumeratingWithState:&v322 objects:v385 count:16];
    if (v18)
    {
      int v19 = 0;
      uint64_t v20 = *(void *)v323;
      do
      {
        CFMutableArrayRef v21 = 0;
        int v22 = v19;
        do
        {
          if (*(void *)v323 != v20) {
            objc_enumerationMutation(v17);
          }
          IOSurfaceID ID = IOSurfaceGetID((IOSurfaceRef)[*(id *)(*((void *)&v322 + 1) + 8 * (void)v21) ioSurface]);
          v366[v22 + v21 + 12] = ID;
          id v24 = qword_100057DD0;
          if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v395 = 67109120;
            *(_DWORD *)&v395[4] = ID;
            _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request1 ioSID: %u", v395, 8u);
          }
          CFMutableArrayRef v21 = (char *)v21 + 1;
        }
        while (v18 != v21);
        id v18 = [v17 countByEnumeratingWithState:&v322 objects:v385 count:16];
        int v19 = v22 + v21;
      }
      while (v18);
      LODWORD(v18) = v22 + v21;
    }

    int v371 = (int)v18;
    long long v318 = 0u;
    long long v319 = 0u;
    long long v320 = 0u;
    long long v321 = 0u;
    BOOL v25 = [v294 inputIndexArray];
    id v26 = [v25 countByEnumeratingWithState:&v318 objects:v384 count:16];
    if (v26)
    {
      int v27 = 0;
      uint64_t v28 = *(void *)v319;
      do
      {
        BOOL v29 = 0;
        int v30 = v27;
        do
        {
          if (*(void *)v319 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v31 = *(void **)(*((void *)&v318 + 1) + 8 * (void)v29);
          v366[v30 + v29 + 76] = [v31 unsignedIntValue];
          uint64_t v32 = (id)qword_100057DD0;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            id v33 = [v31 unsignedLongLongValue];
            *(_DWORD *)v395 = 134217984;
            *(void *)&v395[4] = v33;
            _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request2 ioSID: %llu", v395, 0xCu);
          }

          BOOL v29 = (char *)v29 + 1;
        }
        while (v26 != v29);
        id v26 = [v25 countByEnumeratingWithState:&v318 objects:v384 count:16];
        int v27 = v30 + v29;
      }
      while (v26);
      LODWORD(v26) = v30 + v29;
    }

    int v372 = (int)v26;
    long long v314 = 0u;
    long long v315 = 0u;
    long long v316 = 0u;
    long long v317 = 0u;
    uint64_t v34 = [v294 outputArray];
    id v35 = [v34 countByEnumeratingWithState:&v314 objects:v383 count:16];
    if (v35)
    {
      int v36 = 0;
      uint64_t v37 = *(void *)v315;
      do
      {
        CFNumberRef v38 = 0;
        int v39 = v36;
        do
        {
          if (*(void *)v315 != v37) {
            objc_enumerationMutation(v34);
          }
          IOSurfaceID v40 = IOSurfaceGetID((IOSurfaceRef)[*(id *)(*((void *)&v314 + 1) + 8 * (void)v38) ioSurface]);
          v366[v39 + v38 + 140] = v40;
          id v41 = qword_100057DD0;
          if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v395 = 67109120;
            *(_DWORD *)&v395[4] = v40;
            _os_log_debug_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request3 ioSID: %u", v395, 8u);
          }
          CFNumberRef v38 = (char *)v38 + 1;
        }
        while (v35 != v38);
        id v35 = [v34 countByEnumeratingWithState:&v314 objects:v383 count:16];
        int v36 = v39 + v38;
      }
      while (v35);
      LODWORD(v35) = v39 + v38;
    }

    int v373 = (int)v35;
    long long v310 = 0u;
    long long v311 = 0u;
    long long v312 = 0u;
    long long v313 = 0u;
    CFNumberRef v42 = [v294 outputIndexArray];
    id v43 = [v42 countByEnumeratingWithState:&v310 objects:v382 count:16];
    if (v43)
    {
      int v44 = 0;
      uint64_t v45 = *(void *)v311;
      do
      {
        id v46 = 0;
        int v47 = v44;
        do
        {
          if (*(void *)v311 != v45) {
            objc_enumerationMutation(v42);
          }
          id v48 = *(void **)(*((void *)&v310 + 1) + 8 * (void)v46);
          v366[v47 + v46 + 204] = [v48 unsignedIntValue];
          id v49 = (id)qword_100057DD0;
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          {
            id v50 = [v48 unsignedLongLongValue];
            *(_DWORD *)v395 = 134217984;
            *(void *)&v395[4] = v50;
            _os_log_debug_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request4 ioSID: %llu", v395, 0xCu);
          }

          id v46 = (char *)v46 + 1;
        }
        while (v43 != v46);
        id v43 = [v42 countByEnumeratingWithState:&v310 objects:v382 count:16];
        int v44 = v47 + v46;
      }
      while (v43);
      LODWORD(v43) = v47 + v46;
    }

    int v374 = (int)v43;
    unsigned int v51 = (id)qword_100057DD0;
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      v271 = [v294 inputArray];
      id v272 = [v271 count];
      v273 = [v294 inputIndexArray];
      id v274 = [v273 count];
      v275 = [v294 outputArray];
      id v276 = [v275 count];
      v277 = [v294 outputIndexArray];
      id v278 = [v277 count];
      *(_DWORD *)v395 = 134218752;
      *(void *)&v395[4] = v272;
      *(_WORD *)&v395[12] = 2048;
      *(void *)&v395[14] = v274;
      *(_WORD *)v396 = 2048;
      *(void *)&v396[2] = v276;
      *(_WORD *)&v396[10] = 2048;
      *(void *)&v396[12] = v278;
      _os_log_debug_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate: request.inputArray %lu request.inputIndexArray %lu request.outputArray %lu request.outputIndexArray %lu", v395, 0x2Au);
    }
    uint64_t v52 = [v294 weightsBuffer];
    BOOL v53 = [v52 ioSurface] == 0;

    if (v53)
    {
      IOSurfaceID v367 = 0;
    }
    else
    {
      id v54 = [v294 weightsBuffer];
      IOSurfaceID v55 = IOSurfaceGetID((IOSurfaceRef)[v54 ioSurface]);

      IOSurfaceID v367 = v55;
      if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG)) {
        sub_10002F664();
      }
    }
    v117 = [v294 procedureIndex];
    id v368 = [v117 unsignedLongLongValue];

    v118 = [v294 transactionHandle];
    v369[0] = [v118 unsignedLongLongValue];

    long long v308 = 0u;
    long long v309 = 0u;
    long long v306 = 0u;
    long long v307 = 0u;
    v119 = [v294 perfStatsArray];
    id v120 = [v119 countByEnumeratingWithState:&v306 objects:v381 count:16];
    if (v120)
    {
      int v121 = 0;
      uint64_t v122 = *(void *)v307;
      do
      {
        v123 = 0;
        int v124 = v121;
        do
        {
          if (*(void *)v307 != v122) {
            objc_enumerationMutation(v119);
          }
          v125 = *(void **)(*((void *)&v306 + 1) + 8 * (void)v123);
          v126 = [v125 stats];
          IOSurfaceID v127 = IOSurfaceGetID((IOSurfaceRef)[v126 ioSurface]);

          *((_DWORD *)&v369[1] + (v124 + v123)) = v127;
          *((_DWORD *)&v369[33] + (v124 + v123)) = [v125 statType];
          int v370 = v124 + v123 + 1;
          v128 = qword_100057DD0;
          if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v395 = 67109120;
            *(_DWORD *)&v395[4] = v127;
            _os_log_debug_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request6 ioSID: %u", v395, 8u);
          }
          v129 = (id)qword_100057DD0;
          if (os_log_type_enabled(v129, OS_LOG_TYPE_DEBUG))
          {
            id v130 = [v125 statType];
            *(_DWORD *)v395 = 134217984;
            *(void *)&v395[4] = v130;
            _os_log_debug_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request7 ioSID: %ld", v395, 0xCu);
          }

          v123 = (char *)v123 + 1;
        }
        while (v120 != v123);
        id v120 = [v119 countByEnumeratingWithState:&v306 objects:v381 count:16];
        int v121 = v124 + v123;
      }
      while (v120);

      if (v124 + v123) {
        goto LABEL_119;
      }
    }
    else
    {
    }
    int v370 = 0;
LABEL_119:
    uint64_t v376 = 0;
    IOSurfaceID v377 = 0;
    uint64_t v378 = 0;
    v131 = +[NSNumber numberWithUnsignedLong:4096];
    +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v131, kIOSurfaceAllocSize, 0);
    CFDictionaryRef v132 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v133 = IOSurfaceCreate(v132);
    IOSurfaceRef buffer = v133;
    if (v133)
    {
      IOSurfaceLock(v133, 0, 0);
      IOSurfaceID v377 = IOSurfaceGetID(buffer);
      v134 = (id)qword_100057DD0;
      if (os_log_type_enabled(v134, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_10002F620();
      }

      IOSurfaceUnlock(buffer, 0, 0);
      [v294 sharedEvents];

      if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG)) {
        sub_10002F5EC();
      }
      unsigned __int8 v135 = [(_ANEVirtualClient *)self callIOUserClient:4 inParams:v358 outParams:&v379];

LABEL_204:
      [(_ANEVirtualClient *)self updateError:v355 error:a8];
      v268 = [(_ANEVirtualClient *)self updatePerformanceStats:v355];
      [v294 setPerfStats:v268];

      [(_ANEVirtualClient *)self releaseIOSurfaces:v355];
      goto LABEL_205;
    }
    v136 = (id)qword_100057DD0;
    if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_10002F5A8();
    }

    goto LABEL_174;
  }
  id v56 = (id)qword_100057DD0;
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
    sub_10002FAD0();
  }

  uint64_t v380 = 0;
  theDict = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFMutableArrayRef cf = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  id v57 = [v290 modelURL];
  BOOL v58 = v57 == 0;

  if (!v58) {
    [(_ANEVirtualClient *)self copyAllModelFiles:v290 dictionary:theDict ioSurfaceRefs:cf];
  }
  [(_ANEVirtualClient *)self copyModelMetaData:v290 options:v289 dictionary:theDict vmData:v355];
  [(_ANEVirtualClient *)self copyOptions:v289 dictionary:theDict vmData:v355];
  [(_ANEVirtualClient *)self copyErrorValue:theDict vmData:v355];
  unsigned int valuePtr = 0;
  long long v350 = 0u;
  long long v351 = 0u;
  long long v352 = 0u;
  long long v353 = 0u;
  __int16 v59 = [v294 inputArray];
  id v60 = [v59 countByEnumeratingWithState:&v350 objects:v423 count:16];
  if (v60)
  {
    uint64_t v61 = *(void *)v351;
    do
    {
      for (char i = 0; i != v60; char i = (char *)i + 1)
      {
        if (*(void *)v351 != v61) {
          objc_enumerationMutation(v59);
        }
        IOSurfaceID v63 = IOSurfaceGetID((IOSurfaceRef)[*(id *)(*((void *)&v350 + 1) + 8 * i) ioSurface]);
        uint64_t v64 = valuePtr;
        v366[valuePtr + 12] = v63;
        CFStringRef v65 = CFStringCreateWithFormat(0, 0, @"inputArray%d", v64);
        CFNumberRef v66 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v366[valuePtr + 12]);
        CFDictionarySetValue(theDict, v65, v66);
        CFRelease(v66);
        CFRelease(v65);
        __int16 v67 = (id)qword_100057DD0;
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
        {
          int v68 = v366[valuePtr + 12];
          *(_DWORD *)v395 = 67109120;
          *(_DWORD *)&v395[4] = v68;
          _os_log_debug_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request1 ioSID: %u", v395, 8u);
        }

        ++valuePtr;
      }
      id v60 = [v59 countByEnumeratingWithState:&v350 objects:v423 count:16];
    }
    while (v60);
  }

  CFNumberRef v69 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(theDict, @"inputArrayCount", v69);
  CFRelease(v69);
  unsigned int valuePtr = 0;
  long long v346 = 0u;
  long long v347 = 0u;
  long long v348 = 0u;
  long long v349 = 0u;
  int v70 = [v294 inputIndexArray];
  id v71 = [v70 countByEnumeratingWithState:&v346 objects:v422 count:16];
  if (v71)
  {
    uint64_t v72 = *(void *)v347;
    do
    {
      for (j = 0; j != v71; j = (char *)j + 1)
      {
        if (*(void *)v347 != v72) {
          objc_enumerationMutation(v70);
        }
        unsigned int v74 = *(void **)(*((void *)&v346 + 1) + 8 * (void)j);
        unsigned int v75 = [v74 unsignedIntValue];
        uint64_t v76 = valuePtr;
        v366[valuePtr + 76] = v75;
        CFStringRef v77 = CFStringCreateWithFormat(0, 0, @"inputIndexArray%d", v76);
        CFNumberRef v78 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v366[valuePtr + 76]);
        CFDictionarySetValue(theDict, v77, v78);
        CFRelease(v78);
        CFRelease(v77);
        __int16 v79 = (id)qword_100057DD0;
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
        {
          id v80 = [v74 unsignedLongLongValue];
          *(_DWORD *)v395 = 134217984;
          *(void *)&v395[4] = v80;
          _os_log_debug_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request2 ioSID: %llu", v395, 0xCu);
        }

        ++valuePtr;
      }
      id v71 = [v70 countByEnumeratingWithState:&v346 objects:v422 count:16];
    }
    while (v71);
  }

  CFNumberRef v81 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(theDict, @"inputIndexArrayCount", v81);
  CFRelease(v81);
  unsigned int valuePtr = 0;
  long long v342 = 0u;
  long long v343 = 0u;
  long long v344 = 0u;
  long long v345 = 0u;
  v82 = [v294 outputArray];
  id v83 = [v82 countByEnumeratingWithState:&v342 objects:v421 count:16];
  if (v83)
  {
    uint64_t v84 = *(void *)v343;
    do
    {
      for (k = 0; k != v83; k = (char *)k + 1)
      {
        if (*(void *)v343 != v84) {
          objc_enumerationMutation(v82);
        }
        IOSurfaceID v86 = IOSurfaceGetID((IOSurfaceRef)[*(id *)(*((void *)&v342 + 1) + 8 * (void)k) ioSurface]);
        uint64_t v87 = valuePtr;
        v366[valuePtr + 140] = v86;
        CFStringRef v88 = CFStringCreateWithFormat(0, 0, @"outputArray%d", v87);
        CFNumberRef v89 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v366[valuePtr + 140]);
        CFDictionarySetValue(theDict, v88, v89);
        CFRelease(v89);
        CFRelease(v88);
        uint64_t v90 = (id)qword_100057DD0;
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
        {
          int v91 = v366[valuePtr + 140];
          *(_DWORD *)v395 = 67109120;
          *(_DWORD *)&v395[4] = v91;
          _os_log_debug_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request3 ioSID: %u", v395, 8u);
        }

        ++valuePtr;
      }
      id v83 = [v82 countByEnumeratingWithState:&v342 objects:v421 count:16];
    }
    while (v83);
  }

  CFNumberRef v92 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(theDict, @"outputArrayCount", v92);
  CFRelease(v92);
  unsigned int valuePtr = 0;
  long long v338 = 0u;
  long long v339 = 0u;
  long long v340 = 0u;
  long long v341 = 0u;
  v93 = [v294 outputIndexArray];
  id v94 = [v93 countByEnumeratingWithState:&v338 objects:v420 count:16];
  if (v94)
  {
    uint64_t v95 = *(void *)v339;
    do
    {
      for (m = 0; m != v94; m = (char *)m + 1)
      {
        if (*(void *)v339 != v95) {
          objc_enumerationMutation(v93);
        }
        v97 = *(void **)(*((void *)&v338 + 1) + 8 * (void)m);
        unsigned int v98 = [v97 unsignedIntValue];
        uint64_t v99 = valuePtr;
        v366[valuePtr + 204] = v98;
        CFStringRef v100 = CFStringCreateWithFormat(0, 0, @"outputIndexArray%d", v99);
        CFNumberRef v101 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v366[valuePtr + 204]);
        CFDictionarySetValue(theDict, v100, v101);
        CFRelease(v101);
        CFRelease(v100);
        uint64_t v102 = (id)qword_100057DD0;
        if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
        {
          id v103 = [v97 unsignedLongLongValue];
          *(_DWORD *)v395 = 134217984;
          *(void *)&v395[4] = v103;
          _os_log_debug_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request4 ioSID: %llu", v395, 0xCu);
        }

        ++valuePtr;
      }
      id v94 = [v93 countByEnumeratingWithState:&v338 objects:v420 count:16];
    }
    while (v94);
  }

  CFNumberRef v104 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(theDict, @"outputIndexArrayCount", v104);
  CFRelease(v104);
  v105 = (id)qword_100057DD0;
  if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
  {
    v279 = [v294 inputArray];
    id v280 = [v279 count];
    v281 = [v294 inputIndexArray];
    id v282 = [v281 count];
    v283 = [v294 outputArray];
    id v284 = [v283 count];
    v285 = [v294 outputIndexArray];
    id v286 = [v285 count];
    *(_DWORD *)v395 = 134218752;
    *(void *)&v395[4] = v280;
    *(_WORD *)&v395[12] = 2048;
    *(void *)&v395[14] = v282;
    *(_WORD *)v396 = 2048;
    *(void *)&v396[2] = v284;
    *(_WORD *)&v396[10] = 2048;
    *(void *)&v396[12] = v286;
    _os_log_debug_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate: request.inputArray %lu request.inputIndexArray %lu request.outputArray %lu request.outputIndexArray %lu", v395, 0x2Au);
  }
  v106 = [v294 weightsBuffer];
  BOOL v107 = [v106 ioSurface] == 0;

  if (v107)
  {
    IOSurfaceID v367 = 0;
  }
  else
  {
    v108 = [v294 weightsBuffer];
    IOSurfaceID v367 = IOSurfaceGetID((IOSurfaceRef)[v108 ioSurface]);

    CFNumberRef v109 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v367);
    CFDictionarySetValue(theDict, @"ioSIDWeightsBufferIndex", v109);
    CFRelease(v109);
    v110 = (id)qword_100057DD0;
    if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG)) {
      sub_10002FA60((uint64_t)&v367, v110, v111, v112, v113, v114, v115, v116);
    }
  }
  v137 = [v294 procedureIndex];
  id v368 = [v137 unsignedLongLongValue];

  CFNumberRef v138 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &v368);
  CFDictionarySetValue(theDict, @"procedureIndex", v138);
  CFRelease(v138);
  v139 = [v294 transactionHandle];
  v369[0] = [v139 unsignedLongLongValue];

  CFNumberRef v140 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, v369);
  CFDictionarySetValue(theDict, @"transactionHandle", v140);
  CFRelease(v140);
  unsigned int valuePtr = 0;
  long long v334 = 0u;
  long long v335 = 0u;
  long long v336 = 0u;
  long long v337 = 0u;
  v141 = [v294 perfStatsArray];
  id v142 = [v141 countByEnumeratingWithState:&v334 objects:v419 count:16];
  if (v142)
  {
    uint64_t v143 = *(void *)v335;
    do
    {
      for (n = 0; n != v142; n = (char *)n + 1)
      {
        if (*(void *)v335 != v143) {
          objc_enumerationMutation(v141);
        }
        v145 = *(void **)(*((void *)&v334 + 1) + 8 * (void)n);
        v146 = [v145 stats];
        IOSurfaceID v147 = IOSurfaceGetID((IOSurfaceRef)[v146 ioSurface]);
        *((_DWORD *)&v369[1] + valuePtr) = v147;

        CFStringRef v148 = CFStringCreateWithFormat(0, 0, @"ioSIDPerfStats%d", valuePtr);
        CFNumberRef v149 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, (char *)&v369[1] + 4 * valuePtr);
        CFDictionarySetValue(theDict, v148, v149);
        CFRelease(v149);
        CFRelease(v148);
        unsigned int v150 = [v145 statType];
        uint64_t v151 = valuePtr;
        *((_DWORD *)&v369[33] + valuePtr) = v150;
        CFStringRef v152 = CFStringCreateWithFormat(0, 0, @"perfStatsType%d", v151);
        CFNumberRef v153 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, (char *)&v369[33] + 4 * valuePtr);
        CFDictionarySetValue(theDict, v152, v153);
        CFRelease(v153);
        CFRelease(v152);
        v154 = (id)qword_100057DD0;
        if (os_log_type_enabled(v154, OS_LOG_TYPE_DEBUG))
        {
          int v156 = *((_DWORD *)&v369[1] + valuePtr);
          *(_DWORD *)v395 = 67109120;
          *(_DWORD *)&v395[4] = v156;
          _os_log_debug_impl((void *)&_mh_execute_header, v154, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request6 ioSID: %u", v395, 8u);
        }

        v155 = (id)qword_100057DD0;
        if (os_log_type_enabled(v155, OS_LOG_TYPE_DEBUG))
        {
          int v157 = *((_DWORD *)&v369[33] + valuePtr);
          *(_DWORD *)v395 = 67109120;
          *(_DWORD *)&v395[4] = v157;
          _os_log_debug_impl((void *)&_mh_execute_header, v155, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request7 ioSID: %u", v395, 8u);
        }

        ++valuePtr;
      }
      id v142 = [v141 countByEnumeratingWithState:&v334 objects:v419 count:16];
    }
    while (v142);
  }

  CFNumberRef v158 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(theDict, @"perfStatsCount", v158);
  CFRelease(v158);
  uint64_t v376 = 0;
  IOSurfaceID v377 = 0;
  uint64_t v378 = 0;
  v159 = +[NSNumber numberWithUnsignedLong:4096];
  +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v159, kIOSurfaceAllocSize, 0);
  CFDictionaryRef v160 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v161 = IOSurfaceCreate(v160);
  IOSurfaceRef buffer = v161;
  if (v161)
  {
    IOSurfaceID v377 = IOSurfaceGetID(v161);
    CFNumberRef v162 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v377);
    CFDictionarySetValue(theDict, @"ioSIDPerformanceStatsIndex", v162);
    CFRelease(v162);
    v163 = (id)qword_100057DD0;
    if (os_log_type_enabled(v163, OS_LOG_TYPE_DEBUG))
    {
      v164 = NSStringFromSelector(a2);
      sub_10002FA08(v164);
    }

    v165 = [v294 sharedEvents];
    BOOL v166 = v165 == 0;

    if (v166)
    {
      BOOL v291 = 0;
    }
    else
    {
      bzero(v395, 0x1460uLL);
      v167 = [v294 sharedEvents];
      v168 = [v167 signalEvents];
      *(void *)&v395[8] = [v168 count];

      if (*(void *)&v395[8])
      {
        CFStringRef v169 = CFStringCreateWithFormat(0, 0, @"signalEventsCount");
        CFNumberRef v170 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &v395[8]);
        CFDictionarySetValue(theDict, v169, v170);
        CFRelease(v170);
        CFRelease(v169);
      }
      v171 = (id)qword_100057DD0;
      if (os_log_type_enabled(v171, OS_LOG_TYPE_DEBUG))
      {
        v172 = NSStringFromSelector(a2);
        sub_10002F9B0(v172);
      }

      long long v332 = 0u;
      long long v333 = 0u;
      long long v330 = 0u;
      long long v331 = 0u;
      v173 = [v294 sharedEvents];
      id obj = [v173 signalEvents];

      id v174 = [obj countByEnumeratingWithState:&v330 objects:v394 count:16];
      if (v174)
      {
        uint64_t v303 = 0;
        uint64_t v298 = *(void *)v331;
        do
        {
          id v301 = v174;
          for (ichar i = 0; ii != v301; ichar i = (char *)ii + 1)
          {
            if (*(void *)v331 != v298) {
              objc_enumerationMutation(obj);
            }
            v176 = *(void **)(*((void *)&v330 + 1) + 8 * (void)ii);
            v177 = [v176 sharedEvent];
            uint64_t v178 = (uint64_t)ii + v303;
            v179 = &v395[40 * (v303 + ii)];
            *((_DWORD *)v179 + 644) = [v177 eventPort];

            v180 = v179;
            *((_DWORD *)v179 + 645) = [v176 eventType];
            *((void *)v179 + 323) = [v176 value];
            v181 = v179;
            *((_DWORD *)v179 + 648) = [v176 symbolIndex];
            id v182 = [v176 agentMask];
            v183 = (int *)(v179 + 2576);
            v184 = (void **)(v179 + 2584);
            v185 = v179;
            *((void *)v179 + 325) = v182;
            v179[2608] = 0;
            v186 = (id)qword_100057DD0;
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG))
            {
              NSStringFromSelector(a2);
              id v197 = (id)objc_claimAutoreleasedReturnValue();
              int v198 = *v183;
              v199 = *v184;
              int v388 = 138412802;
              id v389 = v197;
              __int16 v390 = 1024;
              int v391 = v198;
              __int16 v392 = 2048;
              id v393 = v199;
              _os_log_debug_impl((void *)&_mh_execute_header, v186, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualClient signal events port is %#x and value is %llu\n", (uint8_t *)&v388, 0x1Cu);
            }
            CFStringRef v187 = CFStringCreateWithFormat(0, 0, @"signalEvents%dport", v178);
            CFNumberRef v188 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, v183);
            CFDictionarySetValue(theDict, v187, v188);
            CFRelease(v188);
            CFRelease(v187);
            CFStringRef v189 = CFStringCreateWithFormat(0, 0, @"signalEvents%dtype", v178);
            CFNumberRef v190 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, v180 + 2580);
            CFDictionarySetValue(theDict, v189, v190);
            CFRelease(v190);
            CFRelease(v189);
            CFStringRef v191 = CFStringCreateWithFormat(0, 0, @"signalEvents%dValue", v178);
            CFNumberRef v192 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, v184);
            CFDictionarySetValue(theDict, v191, v192);
            CFRelease(v192);
            CFRelease(v191);
            CFStringRef v193 = CFStringCreateWithFormat(0, 0, @"signalEvents%dSymbolIndex", v178);
            CFNumberRef v194 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, v181 + 2592);
            CFDictionarySetValue(theDict, v193, v194);
            CFRelease(v194);
            CFRelease(v193);
            CFStringRef v195 = CFStringCreateWithFormat(0, 0, @"signalEvents%dAgentMask", v178);
            CFNumberRef v196 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, v185 + 2600);
            CFDictionarySetValue(theDict, v195, v196);
            CFRelease(v196);
            CFRelease(v195);
          }
          id v174 = [obj countByEnumeratingWithState:&v330 objects:v394 count:16];
          uint64_t v303 = (v303 + ii);
        }
        while (v174);
      }

      if (v295)
      {
        v200 = [v295 signalEvents];
        BOOL v201 = [v200 count] == (id)2;

        if (!v201)
        {
          v202 = (id)qword_100057DD0;
          if (os_log_type_enabled(v202, OS_LOG_TYPE_ERROR)) {
            sub_10002F97C();
          }
        }
        uint64_t v203 = 0;
        char v204 = 1;
        do
        {
          char v205 = v204;
          v206 = [v295 signalEvents];
          v207 = [v206 objectAtIndexedSubscript:v203];
          BOOL v208 = [v207 value] == (id)4097;

          if (v208)
          {
            v209 = [v295 signalEvents];
            v210 = [v209 objectAtIndexedSubscript:v203];
            v211 = [v210 sharedEvent];
            v411[0] = [v211 eventPort];

            v212 = [v295 signalEvents];
            v213 = [v212 objectAtIndexedSubscript:v203];
            v411[1] = [v213 eventType];

            v214 = [v295 signalEvents];
            v215 = [v214 objectAtIndexedSubscript:v203];
            id v412 = [v215 value];

            v216 = [v295 signalEvents];
            v217 = [v216 objectAtIndexedSubscript:v203];
            unsigned int v413 = [v217 symbolIndex];

            char v414 = 0;
            v218 = (id)qword_100057DD0;
            if (os_log_type_enabled(v218, OS_LOG_TYPE_DEBUG))
            {
              NSStringFromSelector(a2);
              id v219 = (id)objc_claimAutoreleasedReturnValue();
              int v388 = 138412802;
              id v389 = v219;
              __int16 v390 = 1024;
              int v391 = v411[0];
              __int16 v392 = 2048;
              id v393 = v412;
              _os_log_debug_impl((void *)&_mh_execute_header, v218, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualClient success completionEvent signal events port is %#x and value is %llu\n", (uint8_t *)&v388, 0x1Cu);
            }
          }
          else
          {
            v220 = [v295 signalEvents];
            v221 = [v220 objectAtIndexedSubscript:v203];
            v222 = [v221 sharedEvent];
            v415[0] = [v222 eventPort];

            v223 = [v295 signalEvents];
            v224 = [v223 objectAtIndexedSubscript:v203];
            v415[1] = [v224 eventType];

            v225 = [v295 signalEvents];
            v226 = [v225 objectAtIndexedSubscript:v203];
            id v416 = [v226 value];

            v227 = [v295 signalEvents];
            v228 = [v227 objectAtIndexedSubscript:v203];
            unsigned int v417 = [v228 symbolIndex];

            char v418 = 0;
            v218 = (id)qword_100057DD0;
            if (os_log_type_enabled(v218, OS_LOG_TYPE_DEBUG))
            {
              NSStringFromSelector(a2);
              id v229 = (id)objc_claimAutoreleasedReturnValue();
              int v388 = 138412802;
              id v389 = v229;
              __int16 v390 = 1024;
              int v391 = v415[0];
              __int16 v392 = 2048;
              id v393 = v416;
              _os_log_debug_impl((void *)&_mh_execute_header, v218, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualClient error completionEvent signal events port is %#x and value is %llu\n", (uint8_t *)&v388, 0x1Cu);
            }
          }

          char v204 = 0;
          uint64_t v203 = 1;
        }
        while ((v205 & 1) != 0);
        CFStringRef v231 = CFStringCreateWithFormat(0, 0, @"successEventport");
        CFNumberRef v232 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, v411);
        CFDictionarySetValue(theDict, v231, v232);
        CFRelease(v232);
        CFRelease(v231);
        CFStringRef v233 = CFStringCreateWithFormat(0, 0, @"errorEventport");
        CFNumberRef v234 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, v415);
        CFDictionarySetValue(theDict, v233, v234);
        CFRelease(v234);
        CFRelease(v233);
      }
      v235 = [v294 sharedEvents];
      v236 = [v235 waitEvents];
      *(void *)v395 = [v236 count];

      BOOL v291 = *(void *)v395 != 0;
      if (*(void *)v395)
      {
        CFStringRef v237 = CFStringCreateWithFormat(0, 0, @"waitEventsCount");
        CFNumberRef v238 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, v395);
        CFDictionarySetValue(theDict, v237, v238);
        CFRelease(v238);
        CFRelease(v237);
        v239 = (id)qword_100057DD0;
        if (os_log_type_enabled(v239, OS_LOG_TYPE_DEBUG))
        {
          v240 = NSStringFromSelector(a2);
          sub_10002F920(v240);
        }
      }
      v241 = (id)qword_100057DD0;
      if (os_log_type_enabled(v241, OS_LOG_TYPE_DEBUG))
      {
        v242 = NSStringFromSelector(a2);
        sub_10002F8C8(v242);
      }

      long long v328 = 0u;
      long long v329 = 0u;
      long long v326 = 0u;
      long long v327 = 0u;
      v243 = [v294 sharedEvents];
      id obja = [v243 waitEvents];

      id v244 = [obja countByEnumeratingWithState:&v326 objects:v387 count:16];
      if (v244)
      {
        uint64_t v304 = 0;
        uint64_t v299 = *(void *)v327;
        do
        {
          id v302 = v244;
          for (jj = 0; jj != v302; jj = (char *)jj + 1)
          {
            if (*(void *)v327 != v299) {
              objc_enumerationMutation(obja);
            }
            v246 = *(void **)(*((void *)&v326 + 1) + 8 * (void)jj);
            v247 = [v246 sharedEvent];
            v248 = &v395[40 * (v304 + jj)];
            *((_DWORD *)v248 + 4) = [v247 eventPort];

            v249 = v248;
            *((_DWORD *)v248 + 5) = [v246 eventType];
            *((void *)v248 + 3) = [v246 value];
            v250 = v248 + 24;
            *((_DWORD *)v248 + 8) = 0;
            *((void *)v248 + 5) = 0;
            v248[48] = 0;
            CFStringRef v251 = CFStringCreateWithFormat(0, 0, @"waitEvents%dport", (char *)jj + v304);
            CFNumberRef v252 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, v248 + 16);
            CFDictionarySetValue(theDict, v251, v252);
            CFRelease(v252);
            CFRelease(v251);
            CFStringRef v253 = CFStringCreateWithFormat(0, 0, @"waitEvents%dtype", (char *)jj + v304);
            CFNumberRef v254 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, v249 + 20);
            CFDictionarySetValue(theDict, v253, v254);
            CFRelease(v254);
            CFRelease(v253);
            CFStringRef v255 = CFStringCreateWithFormat(0, 0, @"waitEvents%dValue", (char *)jj + v304);
            CFNumberRef v256 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, v250);
            CFDictionarySetValue(theDict, v255, v256);
            CFRelease(v256);
            CFRelease(v255);
          }
          id v244 = [obja countByEnumeratingWithState:&v326 objects:v387 count:16];
          uint64_t v304 = (v304 + jj);
        }
        while (v244);
      }
    }
    [(_ANEVirtualClient *)self printDictionary:theDict];
    v257 = [(_ANEVirtualClient *)self callIOUserClientWithDictionary:4 inDictionary:theDict error:a8];
    CFRelease(theDict);
    [(_ANEVirtualClient *)self printDictionary:v257];
    v258 = [v290 modelURL];
    BOOL v259 = v258 == 0;

    if (!v259)
    {
      +[_ANEVirtualClient freeModelFileIOSurfaces:cf];
      CFRelease(cf);
    }
    v260 = (id)qword_100057DD0;
    BOOL v261 = os_log_type_enabled(v260, OS_LOG_TYPE_DEBUG);
    if (v257)
    {
      if (v261)
      {
        v262 = NSStringFromSelector(a2);
        sub_10002F858(v262, (uint64_t)&v386, v260);
      }

      +[_ANEVirtualClient copyDictionaryDataToStruct:&v379 dictionary:v257];
      unsigned __int8 v135 = v380 == 1;
      v263 = (id)qword_100057DD0;
      if (os_log_type_enabled(v263, OS_LOG_TYPE_DEBUG))
      {
        v264 = NSStringFromSelector(a2);
        sub_10002F800(v264);
      }

      CFRelease(v257);
      goto LABEL_204;
    }
    if (v261)
    {
      v265 = NSStringFromSelector(a2);
      sub_10002F79C(v265, v291);
    }

    if (v291)
    {
      v266 = (id)qword_100057DD0;
      if (os_log_type_enabled(v266, OS_LOG_TYPE_DEBUG))
      {
        v267 = NSStringFromSelector(a2);
        sub_10002F6CC(v267);
      }

      unsigned __int8 v135 = 1;
      goto LABEL_204;
    }
    [(_ANEVirtualClient *)self releaseIOSurfaces:v355];
    CFDictionaryRef v160 = (const __CFDictionary *)(id)qword_100057DD0;
    if (os_log_type_enabled((os_log_t)v160, OS_LOG_TYPE_ERROR)) {
      sub_10002F728((uint64_t *)a8, v160, v270);
    }
  }
  else
  {
    v230 = (id)qword_100057DD0;
    if (os_log_type_enabled(v230, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_10002F5A8();
    }
  }
LABEL_174:
  unsigned __int8 v135 = 0;
LABEL_205:

  return v135;
}

- (BOOL)compiledModelExistsFor:(id)a3
{
  id v5 = a3;
  uint64_t v6 = (id)qword_100057DD0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    sub_10002EC08();
  }

  bzero(v23, 0x1728uLL);
  if (([(_ANEVirtualClient *)self negotiatedCapabilityMask] & 4) != 0)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFMutableArrayRef v9 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    int v10 = [v5 modelURL];
    BOOL v11 = v10 == 0;

    if (!v11)
    {
      [(_ANEVirtualClient *)self copyAllModelFiles:v5 dictionary:Mutable ioSurfaceRefs:v9];
      [(_ANEVirtualClient *)self copyModelMetaData:v5 options:&__NSDictionary0__struct dictionary:Mutable vmData:v23];
    }
    v12 = [v5 getCacheURLIdentifier];
    BOOL v13 = v12 == 0;

    if (!v13)
    {
      id v14 = [v5 cacheURLIdentifier];

      id v15 = (id)qword_100057DD0;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_10002F200();
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
      int v19 = (id)qword_100057DD0;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_10002FD28();
      }

      +[_ANEVirtualClient copyDictionaryDataToStruct:&v25 dictionary:v16];
      unsigned __int8 v7 = v26 == 1;
      if (v26 == 1)
      {
        uint64_t v20 = +[_ANEVirtualClient dictionaryGetNSStringForKey:v16 key:@"modelCacheURLIdentifier"];
        if (v20) {
          [v5 setCacheURLIdentifier:v20];
        }
      }
      CFMutableArrayRef v21 = (id)qword_100057DD0;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_10002FCE4();
      }

      CFRelease(v16);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR)) {
        sub_10002FCB0();
      }
      unsigned __int8 v7 = 0;
    }
  }
  else
  {
    [(_ANEVirtualClient *)self copyModel:v5 options:&__NSDictionary0__struct vmData:v23];
    unsigned __int8 v7 = [(_ANEVirtualClient *)self callIOUserClient:5 inParams:&v24 outParams:0];
  }
  [(_ANEVirtualClient *)self releaseIOSurfaces:v23];

  return v7;
}

- (void)purgeCompiledModel:(id)a3
{
  id v5 = a3;
  uint64_t v6 = (id)qword_100057DD0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    sub_10002EC08();
  }

  bzero(v19, 0x1728uLL);
  if (([(_ANEVirtualClient *)self negotiatedCapabilityMask] & 4) != 0)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFMutableArrayRef v8 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    CFMutableArrayRef v9 = [v5 modelURL];
    BOOL v10 = v9 == 0;

    if (!v10) {
      [(_ANEVirtualClient *)self copyAllModelFiles:v5 dictionary:Mutable ioSurfaceRefs:v8];
    }
    [(_ANEVirtualClient *)self copyModelMetaData:v5 options:&__NSDictionary0__struct dictionary:Mutable vmData:v19];
    BOOL v11 = [v5 getCacheURLIdentifier];
    BOOL v12 = v11 == 0;

    if (!v12)
    {
      BOOL v13 = [v5 cacheURLIdentifier];

      id v14 = (id)qword_100057DD0;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_10002F200();
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
      BOOL v18 = (id)qword_100057DD0;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_10002FDA0();
      }

      CFRelease(v15);
    }
    else if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR))
    {
      sub_10002FD6C();
    }
  }
  else
  {
    [(_ANEVirtualClient *)self copyModel:v5 options:&__NSDictionary0__struct vmData:v19];
    [(_ANEVirtualClient *)self callIOUserClient:6 inParams:&v20 outParams:0];
  }
  [(_ANEVirtualClient *)self releaseIOSurfaces:v19];
}

- (BOOL)compiledModelExistsMatchingHash:(id)a3
{
  id v5 = a3;
  uint64_t v6 = (id)qword_100057DD0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    sub_10002FE5C();
  }

  bzero(v21, 0x1728uLL);
  unsigned __int8 v7 = +[NSKeyedArchiver archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
  if (([(_ANEVirtualClient *)self negotiatedCapabilityMask] & 4) != 0)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v21[0] = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v7, [v7 length], v23);
    CFNumberRef v11 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, v23);
    CFDictionarySetValue(Mutable, @"ioSIDHashString", v11);
    CFRelease(v11);
    v24[0] = [v7 length];
    CFNumberRef v12 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, v24);
    CFDictionarySetValue(Mutable, @"hashStringLength", v12);
    CFRelease(v12);
    BOOL v13 = (id)qword_100057DD0;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v19 = NSStringFromSelector(a2);
      id v20 = [v7 length];
      *(_DWORD *)buf = 138412802;
      int v27 = v19;
      __int16 v28 = 2048;
      id v29 = v20;
      __int16 v30 = 2112;
      id v31 = v5;
      _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%@:ANEVirtualClient length=%lu hashString=%@ \n", buf, 0x20u);
    }
    id v14 = [(_ANEVirtualClient *)self callIOUserClientWithDictionary:7 inDictionary:Mutable error:0];
    CFRelease(Mutable);
    if (v14)
    {
      +[_ANEVirtualClient copyDictionaryDataToStruct:v25 dictionary:v14];
      unsigned __int8 v9 = v25[1] == 1;
      id v15 = (id)qword_100057DD0;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_10002FE18();
      }

      CFRelease(v14);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR)) {
        sub_10002FDE4();
      }
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    v21[0] = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v7, [v7 length], v23);
    v24[0] = [v7 length];
    CFMutableArrayRef v8 = (id)qword_100057DD0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      BOOL v17 = NSStringFromSelector(a2);
      id v18 = [v7 length];
      *(_DWORD *)buf = 138412802;
      int v27 = v17;
      __int16 v28 = 2048;
      id v29 = v18;
      __int16 v30 = 2112;
      id v31 = v5;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@:ANEVirtualClient length=%lu hashString=%@ \n", buf, 0x20u);
    }
    unsigned __int8 v9 = [(_ANEVirtualClient *)self callIOUserClient:7 inParams:&v22 outParams:0];
  }
  [(_ANEVirtualClient *)self releaseIOSurfaces:v21];

  return v9;
}

- (void)purgeCompiledModelMatchingHash:(id)a3
{
  id v5 = a3;
  uint64_t v6 = (id)qword_100057DD0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    sub_10002EC08();
  }

  bzero(v15, 0x1728uLL);
  unsigned __int8 v7 = +[NSKeyedArchiver archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
  if (([(_ANEVirtualClient *)self negotiatedCapabilityMask] & 4) != 0)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v15[0] = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v7, [v7 length], v17);
    CFNumberRef v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, v17);
    CFDictionarySetValue(Mutable, @"ioSIDHashString", v10);
    CFRelease(v10);
    v18[0] = [v7 length];
    CFNumberRef v11 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, v18);
    CFDictionarySetValue(Mutable, @"hashStringLength", v11);
    CFRelease(v11);
    CFNumberRef v12 = [(_ANEVirtualClient *)self callIOUserClientWithDictionary:8 inDictionary:Mutable error:0];
    CFRelease(Mutable);
    if (v12)
    {
      if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG)) {
        sub_10002FED4();
      }
      CFRelease(v12);
    }
    else if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR))
    {
      sub_10002FEA0();
    }
  }
  else
  {
    v15[0] = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v7, [v7 length], v17);
    v18[0] = [v7 length];
    CFMutableArrayRef v8 = (id)qword_100057DD0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      BOOL v13 = NSStringFromSelector(a2);
      id v14 = [v7 length];
      *(_DWORD *)buf = 138412802;
      id v20 = v13;
      __int16 v21 = 2048;
      id v22 = v14;
      __int16 v23 = 2112;
      id v24 = v5;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@:ANEVirtualClient length=%lu hashString=%@ \n", buf, 0x20u);
    }
    [(_ANEVirtualClient *)self callIOUserClient:8 inParams:&v16 outParams:0];
  }
  [(_ANEVirtualClient *)self releaseIOSurfaces:v15];
}

- (BOOL)beginRealTimeTask
{
  uint64_t v4 = (id)qword_100057DD0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    sub_10002EC08();
  }

  return [(_ANEVirtualClient *)self callIOUserClient:9 inParams:0 outParams:0];
}

- (BOOL)endRealTimeTask
{
  uint64_t v4 = (id)qword_100057DD0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    sub_10002EC08();
  }

  return [(_ANEVirtualClient *)self callIOUserClient:10 inParams:0 outParams:0];
}

- (BOOL)echo:(id)a3
{
  id v5 = a3;
  uint64_t v6 = (id)qword_100057DD0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    sub_10002EC08();
  }

  unsigned __int8 v7 = [v5 dataUsingEncoding:4];
  bzero(v15, 0x1728uLL);
  if (([(_ANEVirtualClient *)self negotiatedCapabilityMask] & 4) != 0)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v15[0] = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v7, [v7 length], v17);
    CFNumberRef v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, v17);
    CFDictionarySetValue(Mutable, @"ioSIDHashString", v10);
    CFRelease(v10);
    v18[0] = [v7 length];
    CFNumberRef v11 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, v18);
    CFDictionarySetValue(Mutable, @"hashStringLength", v11);
    CFRelease(v11);
    CFNumberRef v12 = [(_ANEVirtualClient *)self callIOUserClientWithDictionary:11 inDictionary:Mutable error:0];
    CFRelease(Mutable);
    if (v12)
    {
      +[_ANEVirtualClient copyDictionaryDataToStruct:v19 dictionary:v12];
      unsigned __int8 v8 = v19[1] == 1;
      BOOL v13 = (id)qword_100057DD0;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_10002FF3C();
      }

      CFRelease(v12);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR)) {
        sub_10002FF08();
      }
      unsigned __int8 v8 = 0;
    }
  }
  else
  {
    v15[0] = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v7, [v7 length], v17);
    v18[0] = [v7 length];
    unsigned __int8 v8 = [(_ANEVirtualClient *)self callIOUserClient:11 inParams:&v16 outParams:0];
  }
  [(_ANEVirtualClient *)self releaseIOSurfaces:v15];

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

  *(_OWORD *)&retstr->var4[4] = 0u;
  *(_OWORD *)&retstr->var4[20] = 0u;
  *(_OWORD *)&retstr->var0.var2 = 0u;
  *(_OWORD *)&retstr->var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  CFNumberRef v12 = 80;
  id v5 = IOConnectCallMethod([(_ANEVirtualClient *)self connect], 0x12u, 0, 0, 0, 0, 0, 0, retstr, &v12);
  uint64_t v6 = (id)qword_100057DD0;
  unsigned __int8 v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a3);
      objc_claimAutoreleasedReturnValue();
      sub_10002FF80();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v8 = NSStringFromSelector(a3);
    var3 = retstr->var0.var3;
    var2 = retstr->var0.var2;
    *(_DWORD *)buf = 138413058;
    id v14 = v8;
    id v15 = 1024;
    uint64_t v16 = 18;
    BOOL v17 = 1024;
    id v18 = var3;
    int v19 = 2048;
    id v20 = var2;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@: ANEVirtualClient Successfully called method %d with result=%d %llx.\n", buf, 0x22u);
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
  [(_ANEVirtualClient *)self getDeviceInfo];
  objc_super v2 = +[NSString stringWithUTF8String:&v4];
  return v2;
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
  [(_ANEVirtualClient *)self exchangeBuildVersionInfo];
  return v3;
}

- (__CFDictionary)validateNetworkCreate:(unint64_t)a3 uuid:(id)a4 function:(id)a5 directoryPath:(id)a6 scratchPadPath:(id)a7
{
  kern_return_t v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  __CFDictionary *v40;
  NSObject *v41;
  id v43;
  id v44;
  const char *aSelector;
  id v46;
  id v47;
  uint32_t outputCnt;
  uint64_t output;
  unint64_t inputStruct;
  unsigned char v51[40];
  uint64_t v52;
  _DWORD v53[98];
  uint64_t v54;
  void v55[192];
  unsigned int v56;

  id v13 = a4;
  id v14 = a5;
  int v47 = a6;
  id v43 = v14;
  int v44 = a7;
  CFArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  uint64_t v16 = +[NSMutableArray array];
  aSelector = a2;
  BOOL v17 = +[NSMutableArray array];
  bzero(v51, 0x7E8uLL);
  inputStruct = a3;
  id v46 = v13;
  id v18 = (const char *)[v46 cStringUsingEncoding:4];
  size_t v19 = strlen(v18);
  memcpy(v51, v18, v19);
  id v20 = v14;
  __int16 v21 = (const char *)[v20 cStringUsingEncoding:4];
  size_t v22 = strlen(v21);
  memcpy(&v52, v21, v22);
  id v23 = v44;
  id v24 = (const char *)[v23 cStringUsingEncoding:4];
  size_t v25 = strlen(v24);
  memcpy(v53, v24, v25);
  if ([(_ANEVirtualClient *)self copyFilesInDirectoryToIOSurfaces:v47 ioSurfaceRefs:Mutable ioSurfaceSizes:v16 fileNames:v17])
  {
    id v56 = [v16 count];
    if (v56)
    {
      unint64_t v26 = 0;
      uint64_t v27 = 744;
      do
      {
        __int16 v28 = [v16 objectAtIndexedSubscript:v26];
        v55[v26] = [v28 unsignedLongLongValue];

        ValueAtIndex = (__IOSurface *)CFArrayGetValueAtIndex(Mutable, v26);
        v53[v26 + 65] = IOSurfaceGetID(ValueAtIndex);
        id v30 = [v17 objectAtIndexedSubscript:v26];
        strlcpy(&v51[v27 - 8], (const char *)[v30 UTF8String], 0x28uLL);

        ++v26;
        v27 += 40;
      }
      while (v26 < v56);
    }
    id v31 = +[NSNumber numberWithUnsignedLong:10485760];
    +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v31, kIOSurfaceAllocSize, 0, v13, v43, v44);
    CFDictionaryRef v32 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    id v33 = IOSurfaceCreate(v32);
    uint64_t v34 = v33;
    if (v33)
    {
      v53[64] = IOSurfaceGetID(v33);
      id v54 = 10485760;
      output = 0;
      outputCnt = 1;
      id v35 = IOConnectCallMethod([(_ANEVirtualClient *)self connect], 0x11u, 0, 0, &inputStruct, 0x7F0uLL, &output, &outputCnt, 0, 0);
      +[_ANEVirtualClient freeModelFileIOSurfaces:Mutable];
      if (!v35)
      {
        IOSurfaceID v40 = +[_ANEVirtualClient getCFDictionaryFromIOSurface:v34 dataLength:output];
        CFRelease(v34);
        goto LABEL_18;
      }
      int v36 = (id)qword_100057DD0;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(aSelector);
        objc_claimAutoreleasedReturnValue();
        sub_100030014();
      }
    }
    else
    {
      id v41 = (id)qword_100057DD0;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(aSelector);
        objc_claimAutoreleasedReturnValue();
        sub_10002FFD0();
      }
    }
    IOSurfaceID v40 = 0;
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v37 = qword_100057DD0;
  if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR)) {
    sub_10003005C(v37, v38, v39);
  }
  IOSurfaceID v40 = 0;
LABEL_19:

  return v40;
}

- (void)sendGuestBuildVersion
{
  kern_return_t v10;
  NSObject *v11;
  NSObject *v12;
  unsigned char inputStruct[4];
  unsigned char v14[36];

  int v4 = +[_ANEDeviceInfo productName];
  id v5 = +[_ANEDeviceInfo buildVersion];
  uint64_t v6 = +[NSString stringWithFormat:@"%@%@", v4, v5];

  id v7 = v6;
  id v8 = [v7 UTF8String];
  unsigned __int8 v9 = (id)qword_100057DD0;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    sub_100030188();
  }

  memcpy(v14, v8, (size_t)[v7 length]);
  v14[32] = [v7 length];
  CFNumberRef v10 = IOConnectCallMethod([(_ANEVirtualClient *)self connect], 0xEu, 0, 0, inputStruct, 0x28uLL, 0, 0, 0, 0);
  CFNumberRef v11 = (id)qword_100057DD0;
  CFNumberRef v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_100030138();
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    sub_1000300D8();
  }
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
  id v7 = v6;
  if (!v6 || [v6 isEqualToString:&stru_10004D218])
  {
    id v8 = (id)qword_100057DD0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a3);
      objc_claimAutoreleasedReturnValue();
      sub_100030260();
    }

    id v7 = 0;
  }
  unsigned __int8 v9 = +[_ANEDeviceInfo buildVersion];
  CFNumberRef v10 = v9;
  if (!v9 || [v9 isEqualToString:&stru_10004D218])
  {
    CFNumberRef v11 = (id)qword_100057DD0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a3);
      objc_claimAutoreleasedReturnValue();
      sub_10003021C();
    }

    CFNumberRef v10 = 0;
    goto LABEL_11;
  }
  if (!v7)
  {
LABEL_11:
    CFNumberRef v12 = @"UnknownBuild";
    goto LABEL_12;
  }
  CFNumberRef v12 = +[NSString stringWithFormat:@"%@%@", v7, v10];
LABEL_12:
  id v13 = v12;
  id v14 = (const char *)[(__CFString *)v13 UTF8String];
  size_t v15 = strlen(v14);
  __int16 v21 = 192;
  uint64_t v16 = IOConnectCallMethod([(_ANEVirtualClient *)self connect], 0xFu, 0, 0, v14, v15 + 1, 0, 0, retstr, &v21);
  BOOL v17 = (id)qword_100057DD0;
  id v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a3);
      objc_claimAutoreleasedReturnValue();
      sub_1000301CC();
    }
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    size_t v19 = NSStringFromSelector(a3);
    *(_DWORD *)buf = 138412546;
    id v23 = v19;
    id v24 = 1024;
    size_t v25 = 15;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%@: ANEVirtualClient Successfully called method %d", buf, 0x12u);
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
  [(_ANEVirtualClient *)self exchangeBuildVersionInfo];
  return v3;
}

- (id)hostBuildVersionStr
{
  [(_ANEVirtualClient *)self exchangeBuildVersionInfo];
  objc_super v2 = +[NSString stringWithUTF8String:&v4];
  return v2;
}

- (unint64_t)outputDictIOSurfaceSize
{
  [(_ANEVirtualClient *)self exchangeBuildVersionInfo];
  return v3;
}

- (BOOL)mapIOSurfacesWithModel:(id)a3 request:(id)a4 cacheInference:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG)) {
      sub_1000302A4();
    }
    CFNumberRef v12 = [v11 completionHandler];

    [(_ANEVirtualClient *)self queue];
    if (v12) {
      id v13 = {;
    }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100012DE4;
      block[3] = &unk_10004CB18;
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
      BOOL v17 = {;
    }
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100012E9C;
      v20[3] = &unk_10004CB40;
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
  id v92 = a3;
  id v93 = a4;
  if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG)) {
    sub_1000304A4();
  }
  if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG)) {
    sub_1000304A4();
  }
  id v8 = qword_100057DD0;
  if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG)) {
    sub_100030434(v6, v8, v9, v10, v11, v12, v13, v14);
  }
  bzero(v114, 0x1728uLL);
  [(_ANEVirtualClient *)self copyModel:v92 options:&__NSDictionary0__struct vmData:v114];
  [(_ANEVirtualClient *)self copyErrorValue:v114];
  id v117 = objc_msgSend(v92, "string_id");
  id v118 = [v92 programHandle];
  id v119 = [v92 intermediateBufferHandle];
  signed __int8 v120 = [v92 queueDepth];
  unsigned int v123 = [v92 perfStatsMask];
  BOOL v121 = v6;
  size_t v15 = qword_100057DD0;
  if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67112192;
    *(_DWORD *)IOSurfaceID v147 = v116[4];
    *(_WORD *)&v147[4] = 1024;
    *(_DWORD *)&v147[6] = v116[5];
    LOWORD(v148) = 1024;
    *(_DWORD *)((char *)&v148 + 2) = v116[6];
    HIWORD(v148) = 1024;
    *(_DWORD *)CFNumberRef v149 = v116[7];
    *(_WORD *)&v149[4] = 2048;
    *(void *)&v149[6] = v117;
    *(_WORD *)&v149[14] = 2048;
    *(void *)&v149[16] = v118;
    __int16 v150 = 2048;
    id v151 = v119;
    __int16 v152 = 1024;
    int v153 = v120;
    __int16 v154 = 1024;
    int v155 = v122;
    __int16 v156 = 1024;
    unsigned int v157 = v123;
    __int16 v158 = 1024;
    int v159 = v124;
    __int16 v160 = 1024;
    int v161 = v125;
    __int16 v162 = 1024;
    int v163 = v136;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "ANEVirtualClient mapIOSurfacesWithModel: virtualANEModel.ioSIDModelNet=%u virtualANEModel.ioSIDModelShape=%u virtualANEModel.ioSIDModelWeight=%u virtualANEModel.ioSIDKey=%u virtualANEModel.string_id=%lld virtualANEModel.programHandle=%lld virtualANEModel.intermediateBufferHandle=%lld virtualANEModel.queueDepth=%d virtualANEModel.ioSIDModelAttributes=%u virtualANEModel.perfStatsMask=%u virtualANEModel.qos=%u virtualANEModel.ioSIDOptions=%u virtualANEModel.ioSIDErrorValue=%u", buf, 0x5Cu);
  }
  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  BOOL v16 = [v93 inputArray];
  id v17 = [v16 countByEnumeratingWithState:&v110 objects:v145 count:16];
  if (v17)
  {
    int v18 = 0;
    uint64_t v19 = *(void *)v111;
    do
    {
      id v20 = 0;
      int v21 = v18;
      do
      {
        if (*(void *)v111 != v19) {
          objc_enumerationMutation(v16);
        }
        IOSurfaceID ID = IOSurfaceGetID((IOSurfaceRef)[*(id *)(*((void *)&v110 + 1) + 8 * (void)v20) ioSurface]);
        v126[v21 + v20] = ID;
        BOOL v23 = qword_100057DD0;
        if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)IOSurfaceID v147 = ID;
          _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "ANEVirtualClient mapIOSurfacesWithModel request1 ioSID: %u", buf, 8u);
        }
        id v20 = (char *)v20 + 1;
      }
      while (v17 != v20);
      id v17 = [v16 countByEnumeratingWithState:&v110 objects:v145 count:16];
      int v18 = v21 + v20;
    }
    while (v17);
    int v24 = v21 + v20;
  }
  else
  {
    int v24 = 0;
  }

  int v132 = v24;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id v25 = [v93 inputIndexArray];
  id v26 = [v25 countByEnumeratingWithState:&v106 objects:v144 count:16];
  if (v26)
  {
    int v27 = 0;
    uint64_t v28 = *(void *)v107;
    do
    {
      id v29 = 0;
      int v30 = v27;
      do
      {
        if (*(void *)v107 != v28) {
          objc_enumerationMutation(v25);
        }
        char v31 = *(void **)(*((void *)&v106 + 1) + 8 * (void)v29);
        v126[v30 + v29 + 64] = [v31 unsignedIntValue];
        CFDictionaryRef v32 = (id)qword_100057DD0;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          id v33 = [v31 unsignedLongLongValue];
          *(_DWORD *)buf = 134217984;
          *(void *)IOSurfaceID v147 = v33;
          _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "ANEVirtualClient mapIOSurfacesWithModel request2 ioSID: %llu", buf, 0xCu);
        }

        id v29 = (char *)v29 + 1;
      }
      while (v26 != v29);
      id v26 = [v25 countByEnumeratingWithState:&v106 objects:v144 count:16];
      int v27 = v30 + v29;
    }
    while (v26);
    int v34 = v30 + v29;
  }
  else
  {
    int v34 = 0;
  }

  int v133 = v34;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id v35 = [v93 outputArray];
  id v36 = [v35 countByEnumeratingWithState:&v102 objects:v143 count:16];
  if (v36)
  {
    int v37 = 0;
    uint64_t v38 = *(void *)v103;
    do
    {
      int v39 = 0;
      int v40 = v37;
      do
      {
        if (*(void *)v103 != v38) {
          objc_enumerationMutation(v35);
        }
        IOSurfaceID v41 = IOSurfaceGetID((IOSurfaceRef)[*(id *)(*((void *)&v102 + 1) + 8 * (void)v39) ioSurface]);
        v126[v40 + v39 + 128] = v41;
        CFNumberRef v42 = qword_100057DD0;
        if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)IOSurfaceID v147 = v41;
          _os_log_debug_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "ANEVirtualClient mapIOSurfacesWithModel request3 ioSID: %u", buf, 8u);
        }
        int v39 = (char *)v39 + 1;
      }
      while (v36 != v39);
      id v36 = [v35 countByEnumeratingWithState:&v102 objects:v143 count:16];
      int v37 = v40 + v39;
    }
    while (v36);
    int v43 = v40 + v39;
  }
  else
  {
    int v43 = 0;
  }

  int v134 = v43;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  int v44 = [v93 outputIndexArray];
  id v45 = [v44 countByEnumeratingWithState:&v98 objects:v142 count:16];
  if (v45)
  {
    int v46 = 0;
    uint64_t v47 = *(void *)v99;
    do
    {
      id v48 = 0;
      int v49 = v46;
      do
      {
        if (*(void *)v99 != v47) {
          objc_enumerationMutation(v44);
        }
        id v50 = *(void **)(*((void *)&v98 + 1) + 8 * (void)v48);
        v126[v49 + v48 + 192] = [v50 unsignedIntValue];
        unsigned int v51 = (id)qword_100057DD0;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          id v52 = [v50 unsignedLongLongValue];
          *(_DWORD *)buf = 134217984;
          *(void *)IOSurfaceID v147 = v52;
          _os_log_debug_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEBUG, "ANEVirtualClient mapIOSurfacesWithModel request4 ioSID: %llu", buf, 0xCu);
        }

        id v48 = (char *)v48 + 1;
      }
      while (v45 != v48);
      id v45 = [v44 countByEnumeratingWithState:&v98 objects:v142 count:16];
      int v46 = v49 + v48;
    }
    while (v45);
    int v53 = v49 + v48;
  }
  else
  {
    int v53 = 0;
  }

  int v135 = v53;
  id v54 = (id)qword_100057DD0;
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
  {
    CFNumberRef v81 = [v93 inputArray];
    id v82 = [v81 count];
    id v83 = [v93 inputIndexArray];
    id v84 = [v83 count];
    __int16 v85 = [v93 outputArray];
    id v86 = [v85 count];
    uint64_t v87 = [v93 outputIndexArray];
    id v88 = [v87 count];
    *(_DWORD *)buf = 134218752;
    *(void *)IOSurfaceID v147 = v82;
    *(_WORD *)&v147[8] = 2048;
    id v148 = v84;
    *(_WORD *)CFNumberRef v149 = 2048;
    *(void *)&v149[2] = v86;
    *(_WORD *)&v149[10] = 2048;
    *(void *)&v149[12] = v88;
    _os_log_debug_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEBUG, "ANEVirtualClient mapIOSurfacesWithModel: request.inputArray %lu request.inputIndexArray %lu request.outputArray %lu request.outputIndexArray %lu", buf, 0x2Au);
  }
  IOSurfaceID v55 = [v93 weightsBuffer];
  BOOL v56 = [v55 ioSurface] == 0;

  if (v56)
  {
    IOSurfaceID v127 = 0;
  }
  else
  {
    id v57 = [v93 weightsBuffer];
    IOSurfaceID v58 = IOSurfaceGetID((IOSurfaceRef)[v57 ioSurface]);

    IOSurfaceID v127 = v58;
    if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG)) {
      sub_1000303CC();
    }
  }
  __int16 v59 = [v93 procedureIndex];
  id v128 = [v59 unsignedLongLongValue];

  id v60 = [v93 transactionHandle];
  id v129 = [v60 unsignedLongLongValue];

  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  uint64_t v61 = [v93 perfStatsArray];
  id v62 = [v61 countByEnumeratingWithState:&v94 objects:v141 count:16];
  if (!v62)
  {

LABEL_73:
    int v131 = 0;
    goto LABEL_74;
  }
  int v63 = 0;
  uint64_t v64 = *(void *)v95;
  do
  {
    CFStringRef v65 = 0;
    int v66 = v63;
    do
    {
      if (*(void *)v95 != v64) {
        objc_enumerationMutation(v61);
      }
      __int16 v67 = *(void **)(*((void *)&v94 + 1) + 8 * (void)v65);
      int v68 = [v67 stats];
      IOSurfaceID v69 = IOSurfaceGetID((IOSurfaceRef)[v68 ioSurface]);

      v130[v66 + v65] = v69;
      v130[v66 + v65 + 64] = [v67 statType];
      int v131 = v66 + v65 + 1;
      int v70 = qword_100057DD0;
      if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)IOSurfaceID v147 = v69;
        _os_log_debug_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEBUG, "ANEVirtualClient mapIOSurfacesWithModel request6 ioSID: %u", buf, 8u);
      }
      id v71 = (id)qword_100057DD0;
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
      {
        id v72 = [v67 statType];
        *(_DWORD *)buf = 134217984;
        *(void *)IOSurfaceID v147 = v72;
        _os_log_debug_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEBUG, "ANEVirtualClient mapIOSurfacesWithModel request7 ioSID: %ld", buf, 0xCu);
      }

      CFStringRef v65 = (char *)v65 + 1;
    }
    while (v62 != v65);
    id v62 = [v61 countByEnumeratingWithState:&v94 objects:v141 count:16];
    int v63 = v66 + v65;
  }
  while (v62);

  if (!(v66 + v65)) {
    goto LABEL_73;
  }
LABEL_74:
  uint64_t v137 = 0;
  IOSurfaceID v138 = 0;
  uint64_t v139 = 0;
  __int16 v73 = +[NSNumber numberWithUnsignedLong:4096];
  +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v73, kIOSurfaceAllocSize, 0);
  CFDictionaryRef v74 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  unsigned int v75 = IOSurfaceCreate(v74);
  IOSurfaceRef buffer = v75;
  if (v75)
  {
    IOSurfaceLock(v75, 0, 0);
    IOSurfaceID v138 = IOSurfaceGetID(buffer);
    uint64_t v76 = (id)qword_100057DD0;
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_100030388();
    }

    IOSurfaceUnlock(buffer, 0, 0);
    [v93 sharedEvents];

    if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG)) {
      sub_100030354();
    }
    BOOL v77 = [(_ANEVirtualClient *)self callIOUserClient:13 inParams:v116 outParams:&v140];
    [(_ANEVirtualClient *)self updateError:v114 error:a6];
    CFNumberRef v78 = [(_ANEVirtualClient *)self updatePerformanceStats:v114];
    [v93 setPerfStats:v78];

    [(_ANEVirtualClient *)self releaseIOSurfaces:v114];
  }
  else
  {
    __int16 v79 = (id)qword_100057DD0;
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_100030310();
    }

    BOOL v77 = 0;
  }

  return v77;
}

- (void)copyModel:(id)a3 options:(id)a4 vmData:(VMData *)a5
{
  id v7 = a3;
  id v87 = a4;
  long long v98 = a5;
  long long v99 = v7;
  if (a5)
  {
    id v8 = [v7 modelURL];
    uint64_t v9 = [v8 path];
    uint64_t v10 = [v9 lastPathComponent];

    id v83 = v10;
    long long v101 = [v10 componentsSeparatedByString:@"."];
    __int16 v85 = [v101 lastObject];
    uint64_t v11 = [v99 modelURL];
    long long v96 = [v11 path];

    if ([v85 isEqual:@"hwx"])
    {
      uint64_t v12 = (id)qword_100057DD0;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_100030684();
      }

      uint64_t v13 = [v96 lastPathComponent];
      uint64_t v14 = [v96 stringByReplacingOccurrencesOfString:v13 withString:&stru_10004D218];

      size_t v15 = (id)qword_100057DD0;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_100030630();
      }

      long long v96 = (void *)v14;
    }
    BOOL v16 = (id)qword_100057DD0;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_1000305DC();
    }

    id v17 = v96;
    if ([v85 isEqual:@"net"])
    {
      int v18 = objc_opt_new();
      for (char i = 0; i < (char *)[v101 count] - 1; ++i)
      {
        id v20 = [v101 objectAtIndexedSubscript:i];
        [v18 appendString:v20];

        [v18 appendString:@"."];
      }
      if ([v18 length])
      {
        CFStringRef v23 = (const __CFString *)[objc_alloc((Class)NSString) initWithFormat:@"%@net", v18];
        CFStringRef v24 = (const __CFString *)[objc_alloc((Class)NSString) initWithFormat:@"%@shape", v18];
        id v86 = [(_ANEVirtualClient *)self readWeightFilename:v96];
        CFStringRef v78 = v23;
        CFStringRef v80 = v24;
        id v25 = [v96 lastPathComponent];
        id v26 = [v96 stringByReplacingOccurrencesOfString:v25 withString:&stru_10004D218];

        if (v86)
        {
          int v27 = (id)qword_100057DD0;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            NSStringFromSelector(a2);
            objc_claimAutoreleasedReturnValue();
            sub_100030598();
          }

          id v28 = [objc_alloc((Class)NSString) initWithFormat:@"%@/%@", v26, v86];
          id v29 = +[NSFileManager defaultManager];
          int v30 = [v29 attributesOfItemAtPath:v28 error:0];

          NSFileAttributeType v31 = [v30 fileType];
          LODWORD(v29) = v31 == NSFileTypeSymbolicLink;

          if (v29)
          {
            CFDictionaryRef v32 = (id)qword_100057DD0;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            {
              NSStringFromSelector(a2);
              objc_claimAutoreleasedReturnValue();
              sub_100030554();
            }

            id v33 = +[NSFileManager defaultManager];
            int v34 = [v33 destinationOfSymbolicLinkAtPath:v28 error:0];

            uint64_t v35 = [v34 lastPathComponent];

            id v86 = (__CFString *)v35;
          }
        }
        else
        {
          id v86 = @"model.espresso.weights";
        }
        id v36 = +[NSKeyedArchiver archivedDataWithRootObject:v78 requiringSecureCoding:1 error:0];
        int v37 = +[NSKeyedArchiver archivedDataWithRootObject:v80 requiringSecureCoding:1 error:0];
        uint64_t v38 = +[NSKeyedArchiver archivedDataWithRootObject:v86 requiringSecureCoding:1 error:0];
        v98->var12 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v36, [v36 length], &v98->var17.var54);
        v98->var13 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v37, [v37 length], &v98->var17.var56);
        v98->var14 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v38, [v38 length], &v98->var17.var58);
        v98->var17.var55 = (unint64_t)[v36 length];
        v98->var17.var57 = (unint64_t)[v37 length];
        v98->var17.var59 = (unint64_t)[v38 length];
        int v39 = [v96 lastPathComponent];
        uint64_t v40 = [v96 stringByReplacingOccurrencesOfString:v39 withString:&stru_10004D218];

        IOSurfaceID v41 = (id)qword_100057DD0;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          __int16 v73 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138413314;
          *(void *)long long v103 = v73;
          *(_WORD *)&v103[8] = 2112;
          *(void *)long long v104 = v40;
          *(_WORD *)&v104[8] = 2112;
          CFStringRef v105 = v78;
          __int16 v106 = 2112;
          CFStringRef v107 = v80;
          __int16 v108 = 2112;
          long long v109 = v86;
          _os_log_debug_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualClient: .net filepath=%@ : netname=%@ : shapename=%@ : weightname=%@ ", buf, 0x34u);
        }
        long long v96 = (void *)v40;
      }
      else
      {
        CFStringRef v78 = @"model.espresso.net";
        CFStringRef v80 = @"model.espresso.shape";
        id v86 = @"model.espresso.weights";
      }

      id v17 = v96;
      CFStringRef v21 = v78;
      CFStringRef v22 = v80;
    }
    else
    {
      CFStringRef v21 = @"model.espresso.net";
      CFStringRef v22 = @"model.espresso.shape";
      id v86 = @"model.espresso.weights";
    }
    long long v97 = v17;
    __int16 v79 = (__CFString *)v21;
    CFNumberRef v81 = (__CFString *)v22;
    id v77 = [objc_alloc((Class)NSString) initWithFormat:@"%@/%@", v17, v21];
    id v76 = [objc_alloc((Class)NSString) initWithFormat:@"%@/%@", v17, v22];
    id v75 = [objc_alloc((Class)NSString) initWithFormat:@"%@/%@", v17, v86];
    id v74 = [objc_alloc((Class)NSString) initWithFormat:@"%@/net.plist", v17];
    id v95 = [objc_alloc((Class)NSData) initWithContentsOfFile:v77];
    id v93 = [objc_alloc((Class)NSData) initWithContentsOfFile:v76];
    id v92 = [objc_alloc((Class)NSData) initWithContentsOfFile:v75];
    id v90 = [objc_alloc((Class)NSData) initWithContentsOfFile:v74];
    CFNumberRef v42 = [v99 key];
    id v43 = [v42 length];
    if (v43)
    {
      int v44 = [v99 key];
    }
    else
    {
      int v44 = v97;
    }
    int v91 = +[NSKeyedArchiver archivedDataWithRootObject:v44 requiringSecureCoding:1 error:0];
    if (v43) {

    }
    id v45 = [v99 modelAttributes];
    id v84 = +[NSKeyedArchiver archivedDataWithRootObject:v45 requiringSecureCoding:1 error:0];

    int v46 = [v99 modelURL];
    uint64_t v47 = [v46 path];
    long long v94 = +[NSKeyedArchiver archivedDataWithRootObject:v47 requiringSecureCoding:1 error:0];

    v98->var19 = 0;
    v98->var0 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v95, [v95 length], &v98->var17.var2);
    v98->var1 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v93, [v93 length], &v98->var17.var3);
    v98->var2 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v92, [v92 length], &v98->var17.var4);
    v98->var8 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v90, [v90 length], &v98->var17.var28);
    v98->var6 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v91, [v91 length], &v98->var17.var5);
    v98->var7 = [(_ANEVirtualClient *)self copyToIOSurface:v84 length:0x100000 ioSID:&v98->var17.var19];
    v98->var11 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v94, [v94 length], &v98->var17.var52);
    v98->var17.var61 = 0;
    v98->var17.var6 = (unint64_t)[v95 length];
    v98->var17.var7 = (unint64_t)[v93 length];
    v98->var17.var8 = (unint64_t)[v92 length];
    v98->var17.var9 = (unint64_t)[v91 length];
    v98->var17.var20 = (unint64_t)[v84 length];
    v98->var17.var14 = (unint64_t)objc_msgSend(v99, "string_id");
    v98->var17.var15 = (unint64_t)[v99 programHandle];
    v98->var17.var16 = (unint64_t)[v99 intermediateBufferHandle];
    v98->var17.var17 = [v99 queueDepth];
    v98->var17.var21 = [v99 perfStatsMask];
    v98->var17.var29 = (unint64_t)[v90 length];
    v98->var17.var53 = (unint64_t)[v94 length];
    id v48 = [v87 objectForKey:kANEFEspressoFileResourcesKey[0]];
    id v82 = v48;
    if ([v48 count])
    {
      int v49 = 0;
      int v50 = 0;
      for (unint64_t j = 0; j < (unint64_t)[v48 count]; ++j)
      {
        id v52 = [v48 objectAtIndexedSubscript:j];

        int v53 = (id)qword_100057DD0;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
        {
          int v66 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          *(void *)long long v103 = v66;
          *(_WORD *)&v103[8] = 2112;
          *(void *)long long v104 = v52;
          _os_log_debug_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualClient: %@ \n", buf, 0x16u);
        }
        id v54 = [v52 componentsSeparatedByString:@"."];
        IOSurfaceID v55 = [v54 lastObject];
        if (([v55 isEqual:@"net"] & 1) == 0
          && ([v55 isEqual:@"shape"] & 1) == 0
          && ([v55 isEqual:@"weights"] & 1) == 0)
        {
          if (v50 >= 32)
          {
            BOOL v56 = (id)qword_100057DD0;
            if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(a2);
              id v71 = (id)objc_claimAutoreleasedReturnValue();
              id v72 = [v48 count];
              *(_DWORD *)buf = 138412802;
              *(void *)long long v103 = v71;
              *(_WORD *)&v103[8] = 2048;
              *(void *)long long v104 = v72;
              *(_WORD *)&v104[8] = 1024;
              LODWORD(v105) = 32;
              _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%@: ANEVirtualClient: %lu execeed max number of reference expresso files %d \n", buf, 0x1Cu);
            }
          }
          CFNumberRef v89 = +[NSKeyedArchiver archivedDataWithRootObject:v52 requiringSecureCoding:1 error:0];
          id v57 = &v98->var0 + v50;
          v57[47] = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v89, [v89 length], &v98->var17.var12[v50]);
          v57[151] = (__IOSurface *)[v89 length];
          IOSurfaceID v58 = qword_100057DD0;
          if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG))
          {
            unsigned int v67 = v98->var17.var12[v50];
            int v68 = v57[151];
            *(_DWORD *)buf = 67109632;
            *(_DWORD *)long long v103 = v50;
            *(_WORD *)&v103[4] = 1024;
            *(_DWORD *)&v103[6] = v67;
            *(_WORD *)long long v104 = 2048;
            *(void *)&v104[2] = v68;
            _os_log_debug_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "ioSModelEspressoRefFileName[%d] surface ID: %d length: %llu\n", buf, 0x18u);
          }
          id v59 = [objc_alloc((Class)NSString) initWithFormat:@"%@/%@", v97, v52];
          id v60 = qword_100057DD0;
          if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)long long v103 = v59;
            _os_log_debug_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEBUG, " fileEspresso %@\n", buf, 0xCu);
          }
          int v61 = v50;
          id v62 = [objc_alloc((Class)NSData) initWithContentsOfFile:v59];
          int v63 = &v98->var17.var10[v50];
          uint64_t v64 = &v98->var0 + v50;
          v64[15] = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v62, [v62 length], v63);
          v64[103] = (__IOSurface *)[v62 length];
          CFStringRef v65 = qword_100057DD0;
          if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG))
          {
            unsigned int v69 = *v63;
            int v70 = v64[103];
            *(_DWORD *)buf = 67109632;
            *(_DWORD *)long long v103 = v61;
            *(_WORD *)&v103[4] = 1024;
            *(_DWORD *)&v103[6] = v69;
            *(_WORD *)long long v104 = 2048;
            *(void *)&v104[2] = v70;
            _os_log_debug_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEBUG, "ioSIDModelEspressoRefFile[%d] surface ID: %d length: %llu\n", buf, 0x18u);
          }

          id v48 = v82;
          int v50 = v61 + 1;
        }

        int v49 = v52;
      }
    }
  }
  else
  {
    id v83 = (id)qword_100057DD0;
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_100030510();
    }
  }
}

- (BOOL)copyFilesInDirectoryToIOSurfaces:(id)a3 ioSurfaceRefs:(__CFArray *)a4 ioSurfaceSizes:(id)a5 fileNames:(id)a6
{
  id v8 = a3;
  id v48 = a5;
  id v49 = a6;
  IOSurfaceID v55 = v8;
  if ([v8 hasSuffix:@"/"])
  {
    uint64_t v9 = objc_msgSend(v8, "substringToIndex:", (char *)objc_msgSend(v8, "length") - 1);

    IOSurfaceID v55 = (void *)v9;
  }
  +[NSFileManager defaultManager];
  id v54 = v64 = 0;
  [v54 fileExistsAtPath:v55 isDirectory:&v64];
  if (!v64)
  {
    uint64_t v40 = qword_100057DD0;
    if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR)) {
      sub_1000306C8(v40, v41, v42);
    }
    BOOL v43 = 0;
    goto LABEL_61;
  }
  uint64_t v10 = +[NSFileManager defaultManager];
  id v63 = 0;
  uint64_t v47 = [v10 contentsOfDirectoryAtPath:v55 error:&v63];
  id v51 = v63;

  if (v51 || !v47)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR)) {
      sub_100030798();
    }
LABEL_55:
    BOOL v43 = 0;
    goto LABEL_60;
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = v47;
  id v11 = [obj countByEnumeratingWithState:&v59 objects:v71 count:16];
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
      size_t v15 = *(void **)(*((void *)&v59 + 1) + 8 * (void)v14);
      if (v12 < 0x20)
      {
        uint64_t v19 = [v55 stringByAppendingPathComponent:v15];
        char v58 = 0;
        if ([v54 fileExistsAtPath:v19 isDirectory:&v58])
        {
          id v20 = qword_100057DD0;
          if (v58)
          {
            if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              int v66 = "-[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:]";
              __int16 v67 = 2112;
              int v68 = v19;
              CFStringRef v21 = v20;
              CFStringRef v22 = "%s: Sub-directory found at location=%@ cannot be traversed (unsupported), SKIPPING";
              uint32_t v23 = 22;
              goto LABEL_37;
            }
            goto LABEL_20;
          }
          if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            int v66 = "-[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:]";
            __int16 v67 = 2112;
            int v68 = v19;
            _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%s: Copying %@", buf, 0x16u);
          }

          id v25 = objc_alloc((Class)NSData);
          id v57 = 0;
          id v26 = [v25 initWithContentsOfFile:v19 options:0 error:&v57];
          id v51 = v57;
          if (v26)
          {
            int v56 = 0;
            id v27 = [v26 length];
            id v28 = [(_ANEVirtualClient *)self copyToIOSurface:v26 length:v27 ioSID:&v56];
            if (v28)
            {
              if (v56)
              {
                CFArrayAppendValue(a4, v28);
                id v29 = +[NSNumber numberWithUnsignedInteger:v27];
                [v48 addObject:v29];

                [v49 addObject:v15];
                CFRelease(v28);
                int v18 = 0;
                ++v12;
                goto LABEL_43;
              }
              uint64_t v35 = qword_100057DD0;
              if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                int v66 = "-[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:]";
                __int16 v67 = 2112;
                int v68 = v19;
                NSFileAttributeType v31 = v35;
                CFDictionaryRef v32 = "%s: FAILED to get IOSID for %@";
LABEL_40:
                uint32_t v33 = 22;
LABEL_41:
                _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, v32, buf, v33);
              }
            }
            else
            {
              uint64_t v34 = qword_100057DD0;
              if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                int v66 = "-[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:]";
                __int16 v67 = 2112;
                int v68 = v19;
                NSFileAttributeType v31 = v34;
                CFDictionaryRef v32 = "%s: FAILED to write data to IOSurface for %@";
                goto LABEL_40;
              }
            }
          }
          else
          {
            uint64_t v30 = qword_100057DD0;
            if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              int v66 = "-[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:]";
              __int16 v67 = 2112;
              int v68 = v19;
              __int16 v69 = 2112;
              id v70 = v51;
              NSFileAttributeType v31 = v30;
              CFDictionaryRef v32 = "%s: Could not extract data from %@ with error %@, copy FAILED";
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
          uint64_t v24 = qword_100057DD0;
          if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            int v66 = "-[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:]";
            __int16 v67 = 2112;
            int v68 = v15;
            __int16 v69 = 2112;
            id v70 = v19;
            CFStringRef v21 = v24;
            CFStringRef v22 = "%s: file=%@ does not exists at location=%@, SKIPPING";
            uint32_t v23 = 32;
LABEL_37:
            _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, v22, buf, v23);
          }
LABEL_20:
          int v18 = 3;
        }

        goto LABEL_22;
      }
      id v17 = qword_100057DD0;
      if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        int v66 = "-[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:]";
        __int16 v67 = 1024;
        LODWORD(v68) = 32;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s: max file count reached %d, copy FAILED", buf, 0x12u);
      }
      char v53 = 0;
      int v18 = 2;
LABEL_22:
      if (v18 != 3 && v18) {
        goto LABEL_45;
      }
      uint64_t v14 = (char *)v14 + 1;
    }
    while (v11 != v14);
    id v36 = [obj countByEnumeratingWithState:&v59 objects:v71 count:16];
    id v11 = v36;
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
  int v44 = (id)qword_100057DD0;
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
    sub_100030744((uint64_t)buf, (uint64_t)[v49 count], v44);
  }

  BOOL v43 = 1;
LABEL_60:

LABEL_61:
  return v43;
}

- (BOOL)copyAllModelFiles:(id)a3 dictionary:(__CFDictionary *)a4 ioSurfaceRefs:(__CFArray *)a5
{
  id v69 = a3;
  if (!v69 || !a4 || !a5)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR)) {
      sub_100030810();
    }
    char v68 = 0;
    goto LABEL_99;
  }
  id v5 = [v69 modelURL];
  id v72 = [v5 path];

  id v70 = +[NSFileManager defaultManager];
  if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG)) {
    sub_100030B2C();
  }
  char v86 = 0;
  BOOL v6 = &stru_10004D218;
  [v70 fileExistsAtPath:v72 isDirectory:&v86];
  if (v86)
  {
    int v73 = 0;
    goto LABEL_8;
  }
  id v45 = [v72 componentsSeparatedByString:@"/"];
  int v46 = [v45 lastObject];
  uint64_t v47 = [v46 componentsSeparatedByString:@"."];
  id v48 = [v47 lastObject];
  unsigned int v49 = [v48 isEqual:@"hwx"];
  char v50 = v49;
  if (v49)
  {
    id v51 = qword_100057DD0;
    if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR)) {
      sub_1000309A4(v51);
    }
    unsigned int v52 = 0;
    id v71 = &stru_10004D218;
  }
  else
  {
    unsigned int v52 = [v72 containsString:@"/System"];
    if (v52)
    {
      if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG)) {
        sub_100030AF8();
      }
      char v53 = [v45 lastObject];
      id v54 = [v53 componentsSeparatedByString:@"."];
      id v55 = [v54 mutableCopy];
      [v55 removeLastObject];
      id v71 = [v55 componentsJoinedByString:@"."];
      if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG)) {
        sub_100030A8C();
      }
    }
    else
    {
      id v71 = &stru_10004D218;
    }
    id v57 = [v45 mutableCopy];
    [v57 removeLastObject];
    uint64_t v58 = [v57 componentsJoinedByString:@"/"];

    if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG)) {
      sub_100030A20();
    }

    id v72 = (void *)v58;
  }

  if (v50)
  {
LABEL_96:
    char v68 = 0;
    goto LABEL_97;
  }
  if (v52)
  {
    BOOL v6 = v71;
    if (![(__CFString *)v71 length])
    {
      if (!os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR))
      {
        char v68 = 0;
        goto LABEL_98;
      }
      sub_100030844();
      goto LABEL_96;
    }
    int v73 = 1;
  }
  else
  {
    int v73 = 0;
    BOOL v6 = v71;
  }
LABEL_8:
  id v71 = v6;
  id v7 = +[NSFileManager defaultManager];
  id v85 = 0;
  CFStringRef v65 = [v7 contentsOfDirectoryAtPath:v72 error:&v85];
  id v64 = v85;

  if (v64 || !v65)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR)) {
      sub_100030938();
    }
LABEL_76:
    char v68 = 0;
    goto LABEL_90;
  }
  unsigned int v84 = 0;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id obj = v65;
  id v8 = [obj countByEnumeratingWithState:&v80 objects:v92 count:16];
  if (!v8)
  {
    char v68 = 1;
    goto LABEL_84;
  }
  uint64_t v9 = *(void *)v81;
  char v68 = 1;
  while (2)
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v81 != v9) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v80 + 1) + 8 * (void)v10);
      if (v84 < 0x20)
      {
        if (v73 && ![v11 containsString:v71])
        {
          int v14 = 3;
          goto LABEL_35;
        }
        size_t v15 = [v11 componentsSeparatedByString:@"."];
        BOOL v16 = [v15 lastObject];
        if ([v16 isEqual:@"hwx"])
        {
          id v17 = qword_100057DD0;
          if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG)) {
            sub_1000308F8(&v78, v79, v17);
          }
          int v14 = 3;
          goto LABEL_34;
        }
        id v18 = [objc_alloc((Class)NSString) initWithFormat:@"%@/%@", v72, v11];
        unsigned __int8 v77 = 0;
        if (([v70 fileExistsAtPath:v18 isDirectory:&v77] & 1) == 0)
        {
          CFStringRef v22 = qword_100057DD0;
          if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v11;
            __int16 v88 = 2112;
            *(void *)CFNumberRef v89 = v18;
            _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "copyAllModelFiles file=%@ does not exist at location=%@, SKIPPING\n", buf, 0x16u);
          }
          goto LABEL_32;
        }
        int v19 = v77;
        id v20 = qword_100057DD0;
        BOOL v21 = os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG);
        if (v19)
        {
          if (v21)
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v18;
            _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "copyAllModelFiles Sub-directory traversal unsupported, SKIPPING %@", buf, 0xCu);
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
          __int16 v88 = 2112;
          *(void *)CFNumberRef v89 = v72;
          *(_WORD *)&v89[8] = 2112;
          *(void *)&v89[10] = v18;
          _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "copyAllModelFiles file=%@ directoryPath=%@ fullFilePath=%@", buf, 0x20u);
        }
        id v23 = [objc_alloc((Class)NSData) initWithContentsOfFile:v18];
        long long v62 = v23;
        if (!v23)
        {
          id v27 = qword_100057DD0;
          if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v11;
            _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "copyAllModelFiles could not get data for file=%@, SKIPPING", buf, 0xCu);
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
              CFNumberRef v25 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
              CFDictionarySetValue(a4, @"ioSIDModelHWX", v25);
              CFRelease(v25);
              CFDictionarySetValue(a4, @"hwxFileName", v11);
              *(void *)buf = 0;
              *(void *)buf = [v62 length];
              CFNumberRef v26 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, buf);
              CFDictionarySetValue(a4, @"modelHWXLength", v26);
              CFRelease(v26);
            }
            else
            {
              uint64_t v61 = v84;
              CFStringRef v32 = CFStringCreateWithFormat(0, 0, @"fileIOSID%u", v84);
              CFNumberRef v33 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
              CFDictionarySetValue(a4, v32, v33);
              CFRelease(v33);
              CFRelease(v32);
              CFStringRef v34 = CFStringCreateWithFormat(0, 0, @"fileName%u", v61);
              CFDictionarySetValue(a4, v34, v11);
              CFRelease(v34);
              CFStringRef v35 = CFStringCreateWithFormat(0, 0, @"fileLength%u", v61);
              id v75 = 0;
              id v75 = [v62 length];
              CFNumberRef v36 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &v75);
              CFDictionarySetValue(a4, v35, v36);
              CFRelease(v36);
              CFRelease(v35);
              int v37 = +[NSFileManager defaultManager];
              uint64_t v38 = [v37 attributesOfItemAtPath:v18 error:0];
              int v39 = [v38 fileModificationDate];

              if (v39)
              {
                [v39 timeIntervalSince1970];
                long long v60 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
                id v40 = [v60 stringValue];
                CFStringRef v41 = CFStringCreateWithFormat(0, 0, @"FileLastModificationTimeStamp%u", v61);
                CFDictionarySetValue(a4, v41, v40);
                CFRelease(v41);
                uint64_t v42 = qword_100057DD0;
                if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315650;
                  *(void *)&uint8_t buf[4] = "-[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:]";
                  __int16 v88 = 1024;
                  *(_DWORD *)CFNumberRef v89 = v61;
                  *(_WORD *)&v89[4] = 2112;
                  *(void *)&v89[6] = v40;
                  _os_log_debug_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "%s fileCounter:%u lastModificationTimeStampString:%@", buf, 0x1Cu);
                }
              }
              else
              {
                BOOL v43 = qword_100057DD0;
                if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  *(void *)&uint8_t buf[4] = "-[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:]";
                  __int16 v88 = 2112;
                  *(void *)CFNumberRef v89 = v18;
                  _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%s lastModificationDate not available for %@", buf, 0x16u);
                }
              }
              unsigned int v84 = v61 + 1;
            }
            int v14 = 0;
            goto LABEL_61;
          }
          uint64_t v31 = qword_100057DD0;
          if (!os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR))
          {
LABEL_52:
            char v68 = 0;
            int v14 = 2;
LABEL_61:

            goto LABEL_33;
          }
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v11;
          id v29 = v31;
          uint64_t v30 = "copyAllModelFiles failed to IOSurfaceID for file=%@\n";
        }
        else
        {
          uint64_t v28 = qword_100057DD0;
          if (!os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR)) {
            goto LABEL_52;
          }
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v11;
          id v29 = v28;
          uint64_t v30 = "copyAllModelFiles failed to write file data to IOSurface for file=%@\n";
        }
        _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, v30, buf, 0xCu);
        goto LABEL_52;
      }
      uint64_t v13 = qword_100057DD0;
      if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR)) {
        sub_1000308AC(v90, &v91, v13);
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
      uint64_t v10 = (char *)v10 + 1;
    }
    while (v8 != v10);
    id v44 = [obj countByEnumeratingWithState:&v80 objects:v92 count:16];
    id v8 = v44;
    if (v44) {
      continue;
    }
    break;
  }
LABEL_84:

LABEL_85:
  if ((v68 & 1) != 0 && v84)
  {
    CFNumberRef v56 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v84);
    CFDictionarySetValue(a4, @"numModelFiles", v56);
    CFRelease(v56);
    char v68 = 1;
  }
  else if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR))
  {
    sub_100030878();
  }
LABEL_90:

LABEL_97:
  BOOL v6 = v71;
LABEL_98:

LABEL_99:
  return v68 & 1;
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
  id v11 = a3;
  id v44 = a4;
  if (a6)
  {
    unsigned int v12 = [v11 key];
    aSelector = a2;
    id v13 = [v12 length];

    if (v13)
    {
      int v14 = [v11 key];
      size_t v15 = +[NSKeyedArchiver archivedDataWithRootObject:v14 requiringSecureCoding:1 error:0];

      a6->var6 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v15, [v15 length], &a6->var17.var5);
      CFNumberRef v16 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &a6->var17.var5);
      CFDictionarySetValue(a5, @"ioSIDKey", v16);
      CFRelease(v16);
      a6->var17.var9 = (unint64_t)[v15 length];
      CFNumberRef v17 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &a6->var17.var9);
      CFDictionarySetValue(a5, @"keyLength", v17);
      CFRelease(v17);
    }
    id v18 = [v11 modelAttributes];
    int v19 = +[NSKeyedArchiver archivedDataWithRootObject:v18 requiringSecureCoding:1 error:0];

    a6->var7 = [(_ANEVirtualClient *)self copyToIOSurface:v19 length:0x100000 ioSID:&a6->var17.var19];
    CFNumberRef v20 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &a6->var17.var19);
    CFDictionarySetValue(a5, @"ioSIDModelAttributes", v20);
    CFRelease(v20);
    a6->var17.var20 = (unint64_t)[v19 length];
    CFNumberRef v21 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &a6->var17.var20);
    CFDictionarySetValue(a5, @"modelAttributeLength", v21);
    CFRelease(v21);
    CFStringRef v22 = [v11 modelURL];
    id v23 = [v22 path];
    uint64_t v24 = +[NSKeyedArchiver archivedDataWithRootObject:v23 requiringSecureCoding:1 error:0];

    a6->var11 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v24, [v24 length], &a6->var17.var52);
    CFNumberRef v25 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &a6->var17.var52);
    CFDictionarySetValue(a5, @"ioSIDModelInputPath", v25);
    CFRelease(v25);
    a6->var17.var53 = (unint64_t)[v24 length];
    CFNumberRef v26 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &a6->var17.var53);
    CFDictionarySetValue(a5, @"modelInputPathLength", v26);
    CFRelease(v26);
    id v27 = [v11 sourceURL];

    if (v27)
    {
      uint64_t v28 = (id)qword_100057DD0;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        id v29 = NSStringFromSelector(aSelector);
        uint64_t v30 = [v11 sourceURL];
        sub_100030BDC(v29, v30, (uint64_t)v47);
      }

      uint64_t v31 = [v11 sourceURL];
      CFStringRef v32 = [v31 path];
      CFNumberRef v33 = +[NSKeyedArchiver archivedDataWithRootObject:v32 requiringSecureCoding:1 error:0];

      int valuePtr = 0;
      a6->var20 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v33, [v33 length], &valuePtr);
      CFNumberRef v34 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
      CFDictionarySetValue(a5, @"ioSIDModelSourceURLPath", v34);
      CFRelease(v34);
      id v45 = [v33 length];
      CFStringRef v35 = (id)qword_100057DD0;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(aSelector);
        objc_claimAutoreleasedReturnValue();
        sub_100030B98();
      }

      CFNumberRef v36 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &v45);
      CFDictionarySetValue(a5, @"sourceURLPathLength", v36);
      CFRelease(v36);
    }
    id v45 = 0;
    id v45 = [v11 identifierSource];
    CFNumberRef v37 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &v45);
    CFDictionarySetValue(a5, @"modelCacheURLIdentifierSource", v37);
    CFRelease(v37);
    a6->var17.var14 = (unint64_t)objc_msgSend(v11, "string_id");
    CFNumberRef v38 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &a6->var17.var14);
    CFDictionarySetValue(a5, @"string_id", v38);
    CFRelease(v38);
    a6->var17.var15 = (unint64_t)[v11 programHandle];
    CFNumberRef v39 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &a6->var17.var15);
    CFDictionarySetValue(a5, @"programHandle", v39);
    CFRelease(v39);
    a6->var17.var16 = (unint64_t)[v11 intermediateBufferHandle];
    CFNumberRef v40 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &a6->var17.var16);
    CFDictionarySetValue(a5, @"intermediateBufferHandle", v40);
    CFRelease(v40);
    a6->var17.var17 = [v11 queueDepth];
    CFNumberRef v41 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &a6->var17.var17);
    CFDictionarySetValue(a5, @"queueDepth", v41);
    CFRelease(v41);
    a6->var17.var21 = [v11 perfStatsMask];
    CFNumberRef v42 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &a6->var17.var21);
    CFDictionarySetValue(a5, @"perfStatsMask", v42);
    CFRelease(v42);
  }
  else
  {
    int v19 = (id)qword_100057DD0;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_100030510();
    }
  }
}

- (id)readWeightFilename:(id)a3
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)NSData) initWithContentsOfFile:v5];
  if (v6)
  {
    id v7 = [(_ANEVirtualClient *)self doJsonParsingMatchWeightName:v6];
    if (v7)
    {
      id v8 = (id)qword_100057DD0;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_100030C74();
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
    uint64_t v9 = (id)qword_100057DD0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_100030C30();
    }

    id v7 = @"model.espresso.weights";
  }

  return v7;
}

- (id)doJsonParsingMatchWeightName:(id)a3
{
  id v4 = a3;
  id v5 = +[NSJSONSerialization JSONObjectWithData:v4 options:0 error:0];
  if (!v5)
  {
    id v7 = (id)qword_100057DD0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_100030CB8();
    }
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = (id)qword_100057DD0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_100030D84();
    }
    goto LABEL_12;
  }
  id v6 = [v5 objectForKeyedSubscript:@"storage"];
  id v7 = (id)qword_100057DD0;
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (!v6)
  {
    if (v8)
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_100030CFC();
    }
LABEL_12:
    id v6 = 0;
    goto LABEL_13;
  }
  if (v8)
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    sub_100030D40();
  }
LABEL_13:

  return v6;
}

- (id)parallelDecompressedData:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4
    || (unint64_t)[v4 length] < 0x1D
    || (id v6 = v5, v7 = [v6 bytes], v8 = v7, *v7 != 112)
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
      id v13 = (id)qword_100057DD0;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_100030E14();
      }

      goto LABEL_22;
    }
    compression_algorithm v12 = COMPRESSION_LZ4;
  }
LABEL_23:
  unint64_t v14 = bswap64(*(void *)(v8 + 12));
  if (v14 >= 0x80000001)
  {
    size_t v15 = (id)qword_100057DD0;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_100030DC8();
    }
  }
  id v10 = +[NSMutableData dataWithLength:v14];
  CFNumberRef v16 = (uint8_t *)[v10 mutableBytes];
  id v17 = [v10 length];
  id v18 = v6;
  id v19 = (id)compression_decode_buffer(v16, (size_t)v17, (const uint8_t *)[v18 bytes] + 28, (size_t)objc_msgSend(v18, "length") - 28, 0, v12);
  if (v19 != [v10 length])
  {
    CFNumberRef v20 = (id)qword_100057DD0;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      CFNumberRef v21 = NSStringFromSelector(a2);
      int v22 = 138412802;
      id v23 = v21;
      __int16 v24 = 2048;
      CFNumberRef v25 = v19;
      __int16 v26 = 2048;
      id v27 = [v10 length];
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@: Mismatching decompression size %zu %zu ", (uint8_t *)&v22, 0x20u);
    }
  }
LABEL_11:

  return v10;
}

- (void)copyOptions:(id)a3 vmData:(VMData *)a4
{
  id v6 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  if (v6)
  {
    id v7 = v6;
    a4->var17.var24 = (unint64_t)[v6 length];
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
  BOOL v8 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:");
  int v9 = v8;
  if (v8)
  {
    a5->var17.var24 = (unint64_t)[v8 length];
    a5->var4 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v9, [v9 length], &a5->var17.var23);
    CFAllocatorRef v10 = kCFAllocatorDefault;
    CFNumberRef v11 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &a5->var17.var23);
    CFDictionarySetValue(a4, @"ioSIDOptions", v11);
    CFRelease(v11);
  }
  else
  {
    a5->var17.var23 = 0;
    a5->var17.var24 = 0;
    CFAllocatorRef v10 = kCFAllocatorDefault;
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
      id v13 = objc_alloc((Class)NSString);
      unint64_t v14 = [v9 modelURL];
      size_t v15 = [v14 path];
      id v16 = [v13 initWithFormat:@"%@/%@", v15, v12];

      id v17 = [objc_alloc((Class)NSData) initWithContentsOfFile:v16];
      id v18 = (id)qword_100057DD0;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        [v17 length];
        sub_100030EA0();
      }

      a5->var17.var27 = (unint64_t)[v17 length];
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
    id v19 = (id)qword_100057DD0;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_100030E5C();
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
      id v15 = objc_alloc((Class)NSString);
      id v16 = [v11 modelURL];
      id v17 = [v16 path];
      id v18 = [v15 initWithFormat:@"%@/%@", v17, v14];

      id v19 = [objc_alloc((Class)NSData) initWithContentsOfFile:v18];
      CFNumberRef v20 = (id)qword_100057DD0;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        [v19 length];
        sub_100030EA0();
      }

      a6->var17.var27 = (unint64_t)[v19 length];
      a6->var3 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v19, [v19 length], &a6->var17.var26);
      CFNumberRef v21 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &a6->var17.var26);
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
    int v22 = (id)qword_100057DD0;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_100030E5C();
    }

    a6->var17.var26 = 0;
    a6->var17.var27 = 0;
  }
  CFNumberRef v23 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &a6->var17.var27);
  CFDictionarySetValue(a5, @"compilerOptionFileLength", v23);
  CFRelease(v23);
}

- (void)copyErrorValue:(VMData *)a3
{
  *(_OWORD *)&a3->var17.var46 = 0u;
  id v5 = +[NSNumber numberWithUnsignedLong:256];
  +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v5, kIOSurfaceAllocSize, 0);
  CFDictionaryRef v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  id v7 = IOSurfaceCreate(v6);
  a3->var9 = v7;
  if (v7)
  {
    IOSurfaceLock(v7, 0, 0);
    a3->var17.var48 = IOSurfaceGetID(a3->var9);
    BOOL v8 = (id)qword_100057DD0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_10002F620();
    }

    IOSurfaceUnlock(a3->var9, 0, 0);
  }
  else
  {
    id v9 = (id)qword_100057DD0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_100030EE8();
    }
  }
}

- (void)copyErrorValue:(__CFDictionary *)a3 vmData:(VMData *)a4
{
  *(_OWORD *)&a4->var17.var46 = 0u;
  id v7 = +[NSNumber numberWithUnsignedLong:256];
  +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v7, kIOSurfaceAllocSize, 0);
  CFDictionaryRef v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  id v9 = IOSurfaceCreate(v8);
  a4->var9 = v9;
  if (v9)
  {
    IOSurfaceLock(v9, 0, 0);
    a4->var17.var48 = IOSurfaceGetID(a4->var9);
    CFNumberRef v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &a4->var17.var48);
    CFDictionarySetValue(a3, @"ioSIDErrorValue", v10);
    CFRelease(v10);
    id v11 = (id)qword_100057DD0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_10002F620();
    }

    IOSurfaceUnlock(a4->var9, 0, 0);
  }
  else
  {
    id v12 = (id)qword_100057DD0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_100030EE8();
    }
  }
}

- (__IOSurface)copyToIOSurface:(id)a3 length:(unint64_t)a4 ioSID:(unsigned int *)a5
{
  id v8 = a3;
  if (!a5)
  {
    CFNumberRef v10 = (id)qword_100057DD0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_100030F2C();
    }
    goto LABEL_11;
  }
  if (!a4)
  {
    CFNumberRef v10 = (id)qword_100057DD0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_100030F70();
    }
LABEL_11:
    id v12 = 0;
    goto LABEL_12;
  }
  id v9 = +[NSNumber numberWithUnsignedLong:a4];
  CFNumberRef v10 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v9, kIOSurfaceAllocSize, 0);

  id v11 = IOSurfaceCreate((CFDictionaryRef)v10);
  id v12 = v11;
  if (v11)
  {
    IOSurfaceLock(v11, 0, 0);
    BaseAddress = IOSurfaceGetBaseAddress(v12);
    id v14 = v8;
    memcpy(BaseAddress, [v14 bytes], (size_t)objc_msgSend(v14, "length"));
    *a5 = IOSurfaceGetID(v12);
    id v15 = (id)qword_100057DD0;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      id v18 = NSStringFromSelector(a2);
      id v19 = [v14 length];
      unsigned int v20 = *a5;
      *(_DWORD *)buf = 138413058;
      int v22 = v18;
      __int16 v23 = 2048;
      id v24 = v19;
      __int16 v25 = 2048;
      unint64_t v26 = a4;
      __int16 v27 = 1024;
      unsigned int v28 = v20;
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%@ ANEVirtualClient data in bytes %lu IOSurfaceLength %lu IOSID: %u\n", buf, 0x26u);
    }
    IOSurfaceUnlock(v12, 0, 0);
  }
  else
  {
    id v17 = (id)qword_100057DD0;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_100030FB4();
    }
  }
LABEL_12:

  return v12;
}

- (__IOSurface)copyToIOSurface:(char *)a3 size:(unint64_t)a4 ioSID:(unsigned int *)a5
{
  if (!a5)
  {
    CFNumberRef v10 = (id)qword_100057DD0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_100031000();
    }
    goto LABEL_11;
  }
  if (!a4)
  {
    CFNumberRef v10 = (id)qword_100057DD0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_100031044();
    }
LABEL_11:
    id v12 = 0;
    goto LABEL_12;
  }
  id v9 = +[NSNumber numberWithUnsignedLong:a4];
  CFNumberRef v10 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v9, kIOSurfaceAllocSize, 0);

  id v11 = IOSurfaceCreate((CFDictionaryRef)v10);
  id v12 = v11;
  if (v11)
  {
    IOSurfaceLock(v11, 0, 0);
    BaseAddress = IOSurfaceGetBaseAddress(v12);
    memcpy(BaseAddress, a3, a4);
    *a5 = IOSurfaceGetID(v12);
    id v14 = (id)qword_100057DD0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v17 = NSStringFromSelector(a2);
      unsigned int v18 = *a5;
      *(_DWORD *)buf = 138412802;
      unsigned int v20 = v17;
      __int16 v21 = 2048;
      unint64_t v22 = a4;
      __int16 v23 = 1024;
      unsigned int v24 = v18;
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%@ ANEVirtualClient data in bytes length %lu IOSID: %u\n", buf, 0x1Cu);
    }
    IOSurfaceUnlock(v12, 0, 0);
  }
  else
  {
    id v16 = (id)qword_100057DD0;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_100030EE8();
    }
  }
LABEL_12:

  return v12;
}

+ (void)printIOSurfaceDataInBytes:(__IOSurface *)a3
{
  if (a3)
  {
    IOSurfaceLock(a3, 0, 0);
    size_t AllocSize = IOSurfaceGetAllocSize(a3);
    BaseAddress = (unsigned __int8 *)IOSurfaceGetBaseAddress(a3);
    if (AllocSize)
    {
      id v7 = BaseAddress;
      for (uint64_t i = 0; i != AllocSize; ++i)
      {
        id v9 = (id)qword_100057DD0;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          CFNumberRef v10 = NSStringFromSelector(a2);
          int v11 = v7[i];
          *(_DWORD *)buf = 138412802;
          id v16 = v10;
          __int16 v17 = 2048;
          uint64_t v18 = i;
          __int16 v19 = 1024;
          int v20 = v11;
          _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@ ANEVirtualClient byte[%llu]=0x%x\n", buf, 0x1Cu);
        }
      }
    }
    IOSurfaceUnlock(a3, 0, 0);
  }
  else
  {
    id v12 = qword_100057DD0;
    if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR)) {
      sub_100031088(v12, v13, v14);
    }
  }
}

- (id)getModelAttribute:(VMData *)a3
{
  IOSurfaceLock(a3->var7, 0, 0);
  BaseAddress = IOSurfaceGetBaseAddress(a3->var7);
  if (BaseAddress)
  {
    id v6 = [objc_alloc((Class)NSData) initWithBytes:BaseAddress length:a3->var18.var20];
    id v13 = 0;
    id v7 = +[NSJSONSerialization JSONObjectWithData:v6 options:1 error:&v13];
    id v8 = v13;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR)) {
      sub_100031138();
    }
    if (!a3->var7 && os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR)) {
      sub_100031104();
    }
    id v8 = 0;
    id v7 = &__NSDictionary0__struct;
  }
  id v9 = (id)qword_100057DD0;
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
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualClient Model Attribute Length %llu Model Attribute value %@\n", buf, 0x20u);
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
  if (a3)
  {
    IOSurfaceLock(a3, 0, 0);
    if (!a5) {
      LODWORD(a5) = IOSurfaceGetAllocSize(a3);
    }
    id v8 = [objc_alloc((Class)NSData) initWithBytes:IOSurfaceGetBaseAddress(a3) length:a5];
    IOSurfaceUnlock(a3, 0, 0);
    if (v8)
    {
      v23[0] = objc_opt_class();
      v23[1] = objc_opt_class();
      v23[2] = objc_opt_class();
      v23[3] = objc_opt_class();
      unsigned char v23[4] = objc_opt_class();
      mach_port_t v9 = +[NSArray arrayWithObjects:v23 count:5];
      size_t v10 = +[NSSet setWithArray:v9];

      id v22 = 0;
      id v11 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v8 error:&v22];
      id v12 = v22;
      if (v12)
      {
        char v13 = (id)qword_100057DD0;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          sub_10002EAD4();
        }
      }
      uint64_t v14 = [v11 decodeObjectOfClasses:v10 forKey:NSKeyedArchiveRootObjectKey];
    }
    else
    {
      __int16 v18 = qword_100057DD0;
      if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR)) {
        sub_1000311E8(v18, v19, v20);
      }
      CFRelease(a3);
      uint64_t v14 = 0;
    }
  }
  else
  {
    id v15 = qword_100057DD0;
    if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR)) {
      sub_10003116C(v15, v16, v17);
    }
    uint64_t v14 = 0;
  }
  return v14;
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
    if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR)) {
      sub_100031264();
    }
    return 0;
  }
  IOSurfaceLock(a3, 0, 0);
  id v6 = operator new[](a4, &std::nothrow);
  id v7 = v6;
  if (!a4 || v6)
  {
    BaseAddress = IOSurfaceGetBaseAddress(a3);
    if (BaseAddress)
    {
      memcpy(v7, BaseAddress, a4);
      IOSurfaceUnlock(a3, 0, 0);
      CFDataRef v12 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)v7, a4);
      if (!v12)
      {
        if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR)) {
          sub_100031350();
        }
LABEL_22:
        size_t v10 = 0;
        if (!v7) {
          return v10;
        }
        goto LABEL_18;
      }
      size_t v10 = (__CFDictionary *)CFPropertyListCreateWithData(kCFAllocatorDefault, v12, 0, 0, 0);
      CFRelease(v12);
      if (!v10)
      {
        if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR)) {
          sub_100031384();
        }
        goto LABEL_22;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR)) {
        sub_10003131C();
      }
      IOSurfaceUnlock(a3, 0, 0);
      size_t v10 = 0;
    }
    if (!v7) {
      return v10;
    }
LABEL_18:
    operator delete();
  }
  id v8 = qword_100057DD0;
  if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR)) {
    sub_100031298(a4, v8, v9);
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
    id v7 = (id)qword_100057DD0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_1000313B8();
    }
  }
}

+ (BOOL)setCodeSigningIdentity:(__CFDictionary *)a3
{
  mach_msg_type_number_t task_info_outCnt = 8;
  if (task_info(mach_task_self_, 0xFu, task_info_out, &task_info_outCnt)) {
    return 0;
  }
  v10[0] = *(_OWORD *)task_info_out;
  v10[1] = v13;
  id v5 = +[_ANEModelToken codeSigningIDFor:v10 processIdentifier:getpid()];
  BOOL v4 = v5 != 0;
  id v6 = qword_100057DD0;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG)) {
      sub_1000313FC();
    }
    CFDictionarySetValue(a3, @"csIdentity", v5);
  }
  else if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR))
  {
    sub_100031474(v6, v7, v8);
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
  CFTypeRef v22;
  CFStringRef v23;
  NSObject *v24;
  CFStringRef errorString;
  size_t v27;
  unsigned int valuePtr;

  char valuePtr = a3;
  if (a4)
  {
    CFNumberRef v9 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
    CFDictionarySetValue(a4, @"command", v9);
    CFRelease(v9);
    CFDataRef v10 = IOCFSerialize(a4, 0);
    if (v10)
    {
      __int16 v27 = 4096;
      id v11 = (char *)operator new[](0x1000uLL, &std::nothrow);
      if (v11)
      {
        outputStruct = v11;
        BytePtr = CFDataGetBytePtr(v10);
        size_t Length = CFDataGetLength(v10);
        id v15 = IOConnectCallMethod([(_ANEVirtualClient *)self connect], 0x10u, 0, 0, BytePtr, Length, 0, 0, outputStruct, &v27);
        CFRelease(v10);
        if (v15)
        {
          if (a5 && (v15 == -536870160 || v15 == -536870911))
          {
            uint64_t v16 = NSStringFromSelector(a2);
            *a5 = +[_ANEErrors fileNotFoundErrorForMethod:v16];
          }
        }
        else
        {
          __int16 v21 = *(void *)outputStruct;
          errorString = 0;
          id v22 = IOCFUnserializeBinary(outputStruct + 8, v21, 0, 0, &errorString);
          __int16 v23 = errorString;
          if (v22 && errorString)
          {
            unsigned int v24 = (id)qword_100057DD0;
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(a2);
              objc_claimAutoreleasedReturnValue();
              sub_1000315C0();
            }

            __int16 v23 = errorString;
          }
          if (v23) {
            CFRelease(v23);
          }
        }
        operator delete();
      }
      __int16 v18 = qword_100057DD0;
      if (os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_ERROR)) {
        sub_100031534(v18, v19, v20);
      }
    }
    else
    {
      uint64_t v17 = (id)qword_100057DD0;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_1000314F0();
      }
    }
  }
  return 0;
}

- (void)checkKernReturnValue:(int)a3 selector:(unsigned int)a4 outParams:(VirtANEModel *)a5
{
  if (a3)
  {
    if (a5) {
      a5->var1 = 0;
    }
    uint64_t v8 = (id)qword_100057DD0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      CFNumberRef v9 = NSStringFromSelector(a2);
      int v10 = 138412802;
      id v11 = v9;
      __int16 v12 = 1024;
      unsigned int v13 = a4;
      __int16 v14 = 1024;
      int v15 = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@: Failed to call method %d with error %d", (uint8_t *)&v10, 0x18u);
    }
  }
  else
  {
    uint64_t v8 = (id)qword_100057DD0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_100031618();
    }
  }
}

- (BOOL)updateError:(VMData *)a3 error:(id *)a4
{
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
      id v22 = [objc_alloc((Class)NSData) initWithBytes:BaseAddress length:a3->var18.var47];
      uint64_t v27 = objc_opt_class();
      int v10 = +[NSArray arrayWithObjects:&v27 count:1];
      id v11 = +[NSSet setWithArray:v10];

      id v24 = 0;
      id v12 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v22 error:&v24];
      id v13 = v24;
      if (v13)
      {
        __int16 v14 = (id)qword_100057DD0;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          sub_10002EAD4();
        }
      }
      int v15 = objc_msgSend(v12, "decodeObjectOfClasses:forKey:", v11, NSKeyedArchiveRootObjectKey, v22);
      IOSurfaceUnlock(a3->var9, 0, 0);
      uint64_t v16 = +[_ANEStrings errorDomainVirtIO];
      int64_t var46 = a3->var18.var46;
      NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
      unint64_t v26 = v15;
      __int16 v18 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      *a4 = +[NSError errorWithDomain:v16 code:var46 userInfo:v18];
    }
    else
    {
      uint64_t v19 = (id)qword_100057DD0;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_100031660();
      }

      __int16 v23 = +[_ANEStrings errorDomainVirtIO];
      int64_t v20 = a3->var18.var46;
      NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
      CFStringRef v29 = @"Failed with NULL databaseAddress";
      id v11 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      *a4 = +[NSError errorWithDomain:v23 code:v20 userInfo:v11];
    }
  }
  return v5;
}

- (id)updatePerformanceStats:(VMData *)a3
{
  if (a3->var18.var51 || a3->var18.var49)
  {
    IOSurfaceLock(a3->var10, 0, 0);
    id v5 = [objc_alloc((Class)NSData) initWithBytes:IOSurfaceGetBaseAddress(a3->var10) length:a3->var18.var51];
    IOSurfaceUnlock(a3->var10, 0, 0);
    if (v5)
    {
      id v6 = +[_ANEPerformanceStats statsWithReconstructed:v5 hardwareExecutionNS:a3->var18.var49];
    }
    else
    {
      uint64_t v7 = (id)qword_100057DD0;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_1000316A4();
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

- (void).cxx_destruct
{
}

@end