@interface OSDCaptureDevice
+ (id)ispBinary;
+ (id)ispVersion;
- (BOOL)getDeviceAndStreams:(id *)a3;
- (BOOL)setupCaptureDevice:(id *)a3;
- (BOOL)setupCaptureStreams:(id *)a3;
- (NSDictionary)portToStreamMap;
- (NSNumber)ispVersion;
- (OSDCaptureDevice)init;
- (OpaqueFigCaptureDevice)deviceRef;
- (id)captureStreamForPortType:(__CFString *)a3 error:(id *)a4;
- (int)backingCopyProperty:(__CFString *)a3 dest:(const void *)a4;
- (int)backingSetProperty:(__CFString *)a3 value:(void *)a4;
- (unint64_t)owners;
- (void)backingRef;
- (void)dealloc;
- (void)doneWithDeviceAndStreams;
- (void)setOwners:(unint64_t *)a3;
- (void)setPortToStreamMap:(id)a3;
- (void)teardown;
@end

@implementation OSDCaptureDevice

+ (id)ispBinary
{
  v2 = sub_1000050EC()[4];

  return +[NSString stringWithUTF8String:v2];
}

+ (id)ispVersion
{
  uint64_t v2 = *((unsigned int *)sub_1000050EC() + 6);

  return +[NSNumber numberWithInt:v2];
}

- (OSDCaptureDevice)init
{
  v3.receiver = self;
  v3.super_class = (Class)OSDCaptureDevice;
  result = [(OSDCaptureDevice *)&v3 init];
  if (result)
  {
    result->_deviceRef = 0;
    result->_owners = 0;
  }
  return result;
}

- (BOOL)getDeviceAndStreams:(id *)a3
{
  v4 = self;
  objc_sync_enter(v4);
  if ([(OSDCaptureDevice *)v4 owners]
    || [(OSDCaptureDevice *)v4 setupCaptureDevice:a3]
    && [(OSDCaptureDevice *)v4 setupCaptureStreams:a3])
  {
    [(OSDCaptureDevice *)v4 setOwners:(char *)[(OSDCaptureDevice *)v4 owners] + 8];
    BOOL v5 = 1;
  }
  else
  {
    [(OSDCaptureDevice *)v4 teardown];
    BOOL v5 = 0;
  }
  objc_sync_exit(v4);

  return v5;
}

- (void)doneWithDeviceAndStreams
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if ([(OSDCaptureDevice *)v2 owners])
  {
    [(OSDCaptureDevice *)v2 setOwners:(char *)[(OSDCaptureDevice *)v2 owners] - 8];
    if (![(OSDCaptureDevice *)v2 owners]) {
      [(OSDCaptureDevice *)v2 teardown];
    }
  }
  else
  {
    objc_super v3 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      BOOL v5 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ >> Attempted to deactivate a camera with no matching activiation!", (uint8_t *)&v4, 0xCu);
    }
  }
  objc_sync_exit(v2);
}

- (BOOL)setupCaptureDevice:(id *)a3
{
  BOOL v5 = sub_1000050EC();
  v6 = dlopen(v5[1], 4);
  if (!v6)
  {
    v16 = dlerror();
    CFStringRef v14 = @"%@ >> Unable to open the isp plugin: %s";
    v22 = self;
    uint64_t v23 = (uint64_t)v16;
LABEL_15:
    v15 = a3;
    goto LABEL_16;
  }
  v7 = (uint64_t (*)(const CFAllocatorRef, void, OpaqueFigCaptureDevice **))dlsym(v6, v5[2]);
  if (!v7)
  {
    CFStringRef v14 = @"%@ >> Unable to load the isp symbols.";
    v22 = self;
    goto LABEL_15;
  }
  v8 = v7;
  v24 = v5;
  p_deviceRef = &self->_deviceRef;
  uint64_t v10 = v7(kCFAllocatorDefault, 0, &self->_deviceRef);
  if (v10 == -536870187)
  {
    int v11 = 2;
    do
    {
      v12 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        LODWORD(v26[0]) = 2;
        WORD2(v26[0]) = 1024;
        *(_DWORD *)((char *)v26 + 6) = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Camera creation returned kIOReturnBusy. Delaying %d seconds to retry. (%d retries left)", buf, 0xEu);
      }

      CFRunLoopRunInMode(kCFRunLoopDefaultMode, 2.0, 0);
      uint64_t v10 = v8(kCFAllocatorDefault, 0, p_deviceRef);
      if (v10 != -536870187) {
        break;
      }
    }
    while (v11-- > 0);
  }
  if (v10)
  {
    *p_deviceRef = 0;
    CFStringRef v14 = @"%@ >> Unable to create the FigCaptureDevice with status: (0x%08x)";
    v22 = self;
    uint64_t v23 = v10;
LABEL_12:
    v15 = a3;
LABEL_16:
    +[OSDError setError:v15, @"com.apple.osdiags.OSDCaptureDevice", 1, v14, v22, v23 withDomain withCode format];
    return 0;
  }
  if (!*p_deviceRef)
  {
    CFStringRef v14 = @"%@ >> CRITICAL CreateCaptureDevice returned success but the device was NULL";
    v22 = self;
    goto LABEL_12;
  }
  v18 = +[NSNumber numberWithInt:*((unsigned int *)v24 + 6)];
  ispVersion = self->_ispVersion;
  self->_ispVersion = v18;

  v20 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = self->_ispVersion;
    *(_DWORD *)buf = 138412290;
    v26[0] = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "OSD using isp version %@", buf, 0xCu);
  }

  return 1;
}

- (BOOL)setupCaptureStreams:(id *)a3
{
  id v5 = [(OSDPropertyBasedDevice *)self copyProperty:kFigCaptureDeviceProperty_StreamArray error:a3];
  if (a3 && *a3)
  {
    BOOL v6 = 0;
  }
  else
  {
    v7 = [(OSDCaptureDevice *)self deviceRef];
    v8 = *(void **)(CMBaseObjectGetVTable() + 16);
    if (v8) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    if (*v9 < 2uLL
      || (uint64_t v10 = (uint64_t (*)(OpaqueFigCaptureDevice *, id, void))v9[2]) == 0
      || ((int v11 = v10(v7, v5, 0), v11 != -12782) ? (v12 = v11 == 0) : (v12 = 1), v12))
    {
      BOOL v6 = 1;
    }
    else
    {
      int v27 = v11;
      v28 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v38 = self;
        __int16 v39 = 1024;
        int v40 = v27;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%@: Failed to request control of the streams! %d", buf, 0x12u);
      }

      BOOL v6 = 0;
    }
    id v13 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:[v5 count]];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v14 = v5;
    id v15 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v15)
    {
      id v16 = v15;
      BOOL v30 = v6;
      id v31 = v5;
      uint64_t v17 = *(void *)v33;
      while (2)
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [[OSDCaptureStream alloc] initWithStream:*(void *)(*((void *)&v32 + 1) + 8 * i)];
          uint64_t v20 = [(OSDCaptureStream *)v19 name:a3];
          if (!v20)
          {

            BOOL v6 = 0;
            id v5 = v31;
            goto LABEL_25;
          }
          v21 = (void *)v20;
          [v13 setObject:v19 forKeyedSubscript:v20];
        }
        id v16 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v16) {
          continue;
        }
        break;
      }
      id v5 = v31;
      BOOL v6 = v30;
    }
LABEL_25:

    v22 = (NSDictionary *)[v13 copy];
    portToStreamMap = self->_portToStreamMap;
    self->_portToStreamMap = v22;

    v24 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      NSUInteger v25 = [(NSDictionary *)self->_portToStreamMap count];
      *(_DWORD *)buf = 134217984;
      v38 = (OSDCaptureDevice *)v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "OSDCaptureDevice has %lu streams", buf, 0xCu);
    }
  }
  return v6;
}

- (void)dealloc
{
  [(OSDCaptureDevice *)self teardown];
  v3.receiver = self;
  v3.super_class = (Class)OSDCaptureDevice;
  [(OSDCaptureDevice *)&v3 dealloc];
}

- (void)teardown
{
  [(NSDictionary *)self->_portToStreamMap enumerateKeysAndObjectsUsingBlock:&stru_100010518];
  portToStreamMap = self->_portToStreamMap;
  self->_portToStreamMap = 0;

  deviceRef = self->_deviceRef;
  if (deviceRef)
  {
    CFRelease(deviceRef);
    self->_deviceRef = 0;
  }
}

- (id)captureStreamForPortType:(__CFString *)a3 error:(id *)a4
{
  id v5 = [(OSDCaptureDevice *)self portToStreamMap];
  BOOL v6 = [v5 objectForKeyedSubscript:a3];

  return v6;
}

- (void)backingRef
{
  return self->_deviceRef;
}

- (int)backingSetProperty:(__CFString *)a3 value:(void *)a4
{
  uint64_t FigBaseObject = FigCaptureDeviceGetFigBaseObject();
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  v9 = *(uint64_t (**)(uint64_t, __CFString *, void *))(v8 + 56);
  if (!v9) {
    return -12782;
  }

  return v9(FigBaseObject, a3, a4);
}

- (int)backingCopyProperty:(__CFString *)a3 dest:(const void *)a4
{
  uint64_t FigBaseObject = FigCaptureDeviceGetFigBaseObject();
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  v9 = *(uint64_t (**)(uint64_t, __CFString *, const CFAllocatorRef, const void **))(v8 + 48);
  if (!v9) {
    return -12782;
  }

  return v9(FigBaseObject, a3, kCFAllocatorDefault, a4);
}

- (OpaqueFigCaptureDevice)deviceRef
{
  return self->_deviceRef;
}

- (NSNumber)ispVersion
{
  return self->_ispVersion;
}

- (unint64_t)owners
{
  return self->_owners;
}

- (void)setOwners:(unint64_t *)a3
{
  self->_owners = a3;
}

- (NSDictionary)portToStreamMap
{
  return self->_portToStreamMap;
}

- (void)setPortToStreamMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portToStreamMap, 0);

  objc_storeStrong((id *)&self->_ispVersion, 0);
}

@end