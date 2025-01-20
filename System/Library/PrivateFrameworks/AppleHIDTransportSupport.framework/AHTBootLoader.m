@interface AHTBootLoader
+ (id)withDevice:(id)a3 service:(unsigned int)a4;
+ (id)withParent:(id)a3 service:(unsigned int)a4;
+ (id)withService:(unsigned int)a3;
+ (unint64_t)frameworkToDriverOptions:(unint64_t)a3;
- (AHTBootLoader)initWithParent:(id)a3 service:(unsigned int)a4;
- (AHTBootLoader)initWithService:(unsigned int)a3;
- (AHTDevice)device;
- (AHTInterface)interface;
- (BOOL)clearMemoryDumps:(id *)a3;
- (BOOL)createMachPort:(id *)a3;
- (BOOL)getMemoryDumpLevel:(unsigned int *)a3 error:(id *)a4;
- (BOOL)getMemoryDumps:(id *)a3 error:(id *)a4;
- (BOOL)getProperty:(id)a3 property:(id *)a4 options:(unint64_t)a5 error:(id *)a6;
- (BOOL)isOpen;
- (BOOL)needsRestoreUpdate;
- (BOOL)open:(id *)a3;
- (BOOL)overridePersonality:(id)a3 error:(id *)a4;
- (BOOL)overrideProperties:(id)a3 error:(id *)a4;
- (BOOL)reloadProperties:(unint64_t)a3 error:(id *)a4;
- (BOOL)setMemoryDumpLevel:(unsigned int)a3 error:(id *)a4;
- (BOOL)supportsMemoryDump;
- (BOOL)updateProperty:(id)a3 property:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (NSString)personality;
- (NSString)type;
- (id)description;
- (id)dispatchSourceForNotification:(id)a3 action:(id)a4 error:(id *)a5;
- (id)getRegistryProperties;
- (unsigned)connect;
- (unsigned)imageTag;
- (unsigned)machPort;
- (unsigned)service;
- (void)close;
- (void)dealloc;
- (void)destroyMachPort;
- (void)setConnect:(unsigned int)a3;
- (void)setMachPort:(unsigned int)a3;
- (void)setService:(unsigned int)a3;
@end

@implementation AHTBootLoader

- (AHTBootLoader)initWithParent:(id)a3 service:(unsigned int)a4
{
  id v7 = a3;
  v24.receiver = self;
  v24.super_class = (Class)AHTBootLoader;
  v8 = [(AHTBootLoader *)&v24 init];
  if (!v8) {
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = 48;
      goto LABEL_6;
    }
LABEL_13:
    v22 = 0;
    goto LABEL_14;
  }
  uint64_t v9 = 40;
LABEL_6:
  objc_storeStrong((id *)((char *)&v8->super.isa + v9), a3);
  v8->_service = a4;
  v8->_machPort = 0;
  IOObjectRetain(a4);
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFProperty = (NSString *)IORegistryEntryCreateCFProperty(a4, @"hid-merge-personality", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  personality = v8->_personality;
  v8->_personality = CFProperty;

  CFNumberRef v13 = (const __CFNumber *)IORegistryEntryCreateCFProperty(a4, @"image-tag", v10, 0);
  if (v13)
  {
    CFNumberRef v14 = v13;
    CFNumberGetValue(v13, kCFNumberSInt32Type, &v8->_imageTag);
    CFRelease(v14);
  }
  CFTypeRef v15 = IORegistryEntryCreateCFProperty(a4, @"Needs Restore Update", v10, 0);
  v16 = (CFTypeRef *)MEMORY[0x263EFFB40];
  if (v15)
  {
    v8->_needsRestoreUpdate = v15 == (CFTypeRef)*MEMORY[0x263EFFB40];
    CFRelease(v15);
  }
  CFTypeRef v17 = IORegistryEntryCreateCFProperty(a4, @"Supports Memory Dump", v10, 0);
  if (v17)
  {
    v8->_supportsMemoryDump = v17 == *v16;
    CFRelease(v17);
  }
  CFStringRef v18 = IOObjectCopyClass(a4);
  CFRange v19 = CFStringFind(v18, @"AppleHIDTransportBootloader", 0);
  v25.length = CFStringGetLength(v18) - (v19.location + v19.length);
  v25.location = v19.location + v19.length;
  CFStringRef v20 = CFStringCreateWithSubstring(v10, v18, v25);
  type = v8->_type;
  v8->_type = &v20->isa;

  CFRelease(v18);
  v22 = v8;
LABEL_14:

  return v22;
}

- (AHTBootLoader)initWithService:(unsigned int)a3
{
  if (!a3) {
    goto LABEL_4;
  }
  uint64_t v4 = *(void *)&a3;
  if (!IOObjectConformsTo(a3, "AppleHIDTransportBootloader")) {
    goto LABEL_4;
  }
  io_registry_entry_t parent = 0;
  if (IORegistryEntryGetParentEntry(v4, "IOService", &parent)) {
    goto LABEL_4;
  }
  uint64_t v7 = +[AHTDevice withService:parent];
  if (v7)
  {
    v8 = (void *)v7;
    IOObjectRelease(parent);
LABEL_9:
    self = [(AHTBootLoader *)self initWithParent:v8 service:v4];

    v5 = self;
    goto LABEL_5;
  }
  v8 = +[AHTInterface withService:parent];
  IOObjectRelease(parent);
  if (v8) {
    goto LABEL_9;
  }
LABEL_4:
  v5 = 0;
LABEL_5:

  return v5;
}

+ (id)withDevice:(id)a3 service:(unsigned int)a4
{
  return +[AHTBootLoader withParent:a3 service:*(void *)&a4];
}

+ (id)withParent:(id)a3 service:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  v6 = [[AHTBootLoader alloc] initWithParent:v5 service:v4];

  return v6;
}

+ (id)withService:(unsigned int)a3
{
  v3 = [[AHTBootLoader alloc] initWithService:*(void *)&a3];

  return v3;
}

- (void)dealloc
{
  [(AHTBootLoader *)self close];
  IOObjectRelease(self->_service);
  v3.receiver = self;
  v3.super_class = (Class)AHTBootLoader;
  [(AHTBootLoader *)&v3 dealloc];
}

- (BOOL)open:(id *)a3
{
  if ([(AHTBootLoader *)self isOpen]) {
    return 1;
  }
  uint64_t v6 = IOServiceOpen(self->_service, *MEMORY[0x263EF8960], 0, &self->_connect);

  return +[AHTLoader errorFromKernel:v6 error:a3];
}

- (BOOL)isOpen
{
  return self->_connect != 0;
}

- (BOOL)createMachPort:(id *)a3
{
  uint64_t v5 = mach_port_allocate(*MEMORY[0x263EF8960], 1u, &self->_machPort);
  if (!v5)
  {
    uint64_t v5 = MEMORY[0x223CA2F60](self->_connect, 48, self->_machPort, 0);
    if (!v5) {
      return 1;
    }
  }
  +[AHTLoader errorFromKernel:v5 error:a3];
  return 0;
}

- (void)destroyMachPort
{
  mach_port_name_t machPort = self->_machPort;
  if (machPort)
  {
    uint64_t v4 = (ipc_space_t *)MEMORY[0x263EF8960];
    mach_port_mod_refs(*MEMORY[0x263EF8960], machPort, 1u, -1);
    mach_port_deallocate(*v4, self->_machPort);
    self->_mach_port_name_t machPort = 0;
  }
}

- (id)dispatchSourceForNotification:(id)a3 action:(id)a4 error:(id *)a5
{
  v8 = a3;
  id v9 = a4;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __60__AHTBootLoader_dispatchSourceForNotification_action_error___block_invoke;
  v15[3] = &unk_26463BA58;
  v15[4] = self;
  CFTypeRef v17 = a5;
  id v10 = v9;
  id v16 = v10;
  v11 = (void *)MEMORY[0x223CA3340](v15);
  if ([(AHTBootLoader *)self open:a5] && [(AHTBootLoader *)self createMachPort:a5])
  {
    v12 = dispatch_source_create(MEMORY[0x263EF83C8], self->_machPort, 0, v8);
    if (v12)
    {
      CFNumberRef v13 = v12;
      dispatch_source_set_event_handler(v12, v11);
      goto LABEL_5;
    }
    +[AHTLoader errorFromKernel:3758097085 error:a5];
  }
  [(AHTBootLoader *)self destroyMachPort];
  [(AHTBootLoader *)self close];
  CFNumberRef v13 = 0;
LABEL_5:

  return v13;
}

void __60__AHTBootLoader_dispatchSourceForNotification_action_error___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  memset(msg, 0, sizeof(msg));
  uint64_t v2 = mach_msg(msg, 2, 0, 0x30u, *(_DWORD *)(*(void *)(a1 + 32) + 24), 0, 0);
  if (v2)
  {
    int v3 = v2;
    uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"Fail to read mach message (err=0x%X)", v2);
    uint64_t v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F08320];
    v9[0] = v4;
    uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    **(void **)(a1 + 48) = [v5 errorWithDomain:@"AppleHIDTransportSupport" code:v3 userInfo:v6];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)close
{
  io_connect_t connect = self->_connect;
  if (connect)
  {
    IOServiceClose(connect);
    self->_io_connect_t connect = 0;
  }
}

+ (unint64_t)frameworkToDriverOptions:(unint64_t)a3
{
  return a3 & 0xB9;
}

- (BOOL)updateProperty:(id)a3 property:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if ([(AHTBootLoader *)self open:a6])
  {
    v12 = objc_msgSend(MEMORY[0x263EFF990], "dataWithCapacity:", objc_msgSend(v10, "length") + objc_msgSend(v11, "length") + 1);
    id v13 = v10;
    objc_msgSend(v12, "appendBytes:length:", objc_msgSend(v13, "UTF8String"), objc_msgSend(v13, "length") + 1);
    [v12 appendData:v11];
    uint64_t input = +[AHTBootLoader frameworkToDriverOptions:a5];
    mach_port_t connect = self->_connect;
    id v15 = v12;
    BOOL v16 = +[AHTLoader errorFromKernel:error:](AHTLoader, "errorFromKernel:error:", IOConnectCallMethod(connect, 6u, &input, 1u, (const void *)[v15 bytes], objc_msgSend(v15, "length"), 0, 0, 0, 0), a6);
    [(AHTBootLoader *)self close];
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)getProperty:(id)a3 property:(id *)a4 options:(unint64_t)a5 error:(id *)a6
{
  v28[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  if (v9 && a4)
  {
    uint64_t v10 = [MEMORY[0x263EFF990] dataWithLength:0x10000];
    if (v10)
    {
      id v11 = (id)v10;
      if ([(AHTBootLoader *)self open:a6])
      {
        id v11 = v11;
        input[0] = [v11 mutableBytes];
        input[1] = 0x10000;
        uint64_t output = 0;
        uint32_t outputCnt = 1;
        mach_port_t connect = self->_connect;
        id v13 = v9;
        uint64_t v14 = IOConnectCallMethod(connect, 0x11u, input, 2u, (const void *)[v13 UTF8String], objc_msgSend(v13, "length") + 1, &output, &outputCnt, 0, 0);
        [(AHTBootLoader *)self close];
        if (v14 == -536870206)
        {

          id v11 = 0;
          uint64_t v14 = 0;
        }
        if (+[AHTLoader errorFromKernel:v14 error:a6])
        {
          if (outputCnt && output <= 0x10000)
          {
            if (v11)
            {
              id v15 = (void *)MEMORY[0x263EFF8F8];
              uint64_t v16 = [v11 mutableBytes];
              id v17 = [v15 dataWithBytes:v16 length:output];
            }
            else
            {
              id v17 = 0;
            }
            *a4 = v17;
            BOOL v18 = 1;
          }
          else
          {
            BOOL v18 = +[AHTLoader errorFromKernel:3758097097 error:a6];
          }
          goto LABEL_19;
        }
      }
    }
    else
    {
      uint64_t v19 = [NSString stringWithFormat:@"Failed to allocate NSData for the property"];
      CFStringRef v20 = (void *)v19;
      if (a6)
      {
        v21 = (void *)MEMORY[0x263F087E8];
        uint64_t v27 = *MEMORY[0x263F08320];
        v28[0] = v19;
        v22 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
        *a6 = [v21 errorWithDomain:@"AppleHIDTransportSupport" code:-536870211 userInfo:v22];
      }
      id v11 = 0;
    }
    BOOL v18 = 0;
LABEL_19:

    goto LABEL_20;
  }
  if (a6)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"AppleHIDTransportSupport" code:-536870206 userInfo:0];
    BOOL v18 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_20:

  return v18;
}

- (BOOL)reloadProperties:(unint64_t)a3 error:(id *)a4
{
  if (![(AHTBootLoader *)self open:a4]) {
    return 0;
  }
  uint64_t input = +[AHTBootLoader frameworkToDriverOptions:a3];
  BOOL v7 = +[AHTLoader errorFromKernel:IOConnectCallMethod(self->_connect, 6u, &input, 1u, 0, 0, 0, 0, 0, 0) error:a4];
  [(AHTBootLoader *)self close];
  return v7;
}

- (BOOL)overridePersonality:(id)a3 error:(id *)a4
{
  uint64_t v6 = IORegistryEntrySetCFProperty(self->_service, @"hid-merge-personality", a3);
  if (v6)
  {
    +[AHTLoader errorFromKernel:v6 error:a4];
  }
  else
  {
    CFProperty = (NSString *)IORegistryEntryCreateCFProperty(self->_service, @"hid-merge-personality", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    personality = self->_personality;
    self->_personality = CFProperty;
  }
  return v6 == 0;
}

- (BOOL)setMemoryDumpLevel:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  BOOL v7 = [(AHTBootLoader *)self open:a4];
  if (v7)
  {
    uint64_t v8 = IORegistryEntrySetCFProperty(self->_service, @"Memory Dumps Level", (CFTypeRef)[NSNumber numberWithUnsignedInt:v5]);
    LOBYTE(v7) = +[AHTLoader errorFromKernel:v8 error:a4];
  }
  return v7;
}

- (BOOL)getMemoryDumpLevel:(unsigned int *)a3 error:(id *)a4
{
  if (a3)
  {
    BOOL v7 = [(AHTBootLoader *)self open:a4];
    if (!v7) {
      return v7;
    }
    CFProperty = (void *)IORegistryEntryCreateCFProperty(self->_service, @"Memory Dumps Level", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *a3 = [CFProperty unsignedIntValue];

      LOBYTE(v7) = 1;
      return v7;
    }
    +[AHTLoader errorFromKernel:3758097085 error:a4];
  }
  else
  {
    +[AHTLoader errorFromKernel:3758097090 error:a4];
  }
  LOBYTE(v7) = 0;
  return v7;
}

- (BOOL)clearMemoryDumps:(id *)a3
{
  BOOL v5 = -[AHTBootLoader open:](self, "open:");
  if (v5)
  {
    uint64_t v6 = IOConnectCallMethod(self->_connect, 8u, 0, 0, 0, 0, 0, 0, 0, 0);
    LOBYTE(v5) = +[AHTLoader errorFromKernel:v6 error:a3];
  }
  return v5;
}

- (BOOL)getMemoryDumps:(id *)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t input[2] = *MEMORY[0x263EF8340];
  CFStringRef errorString = 0;
  if (!a3)
  {
    +[AHTLoader errorFromKernel:3758097090 error:a4];
    id v8 = 0;
    goto LABEL_11;
  }
  if (![(AHTBootLoader *)self open:a4]) {
    goto LABEL_14;
  }
  BOOL v7 = [MEMORY[0x263EFF990] dataWithLength:0x200000];
  if (!v7)
  {
    +[AHTLoader errorFromKernel:3758097085 error:a4];
LABEL_14:
    id v8 = 0;
    goto LABEL_15;
  }
  id v8 = v7;
  input[0] = [v8 mutableBytes];
  input[1] = 0x200000;
  uint64_t v9 = IOConnectCallMethod(self->_connect, 7u, input, 2u, 0, 0, 0, 0, 0, 0);
  if (v9 == -536870210)
  {
    id *v5 = 0;
LABEL_10:
    LOBYTE(v5) = 1;
    goto LABEL_11;
  }
  if (!+[AHTLoader errorFromKernel:v9 error:a4])
  {
LABEL_15:
    LOBYTE(v5) = 0;
    goto LABEL_11;
  }
  id v8 = v8;
  uint64_t v10 = (const char *)[v8 mutableBytes];
  id *v5 = (id)(id)IOCFUnserialize(v10, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0, &errorString);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_10;
  }
  id *v5 = 0;
  if (!a4) {
    goto LABEL_10;
  }
  id v11 = (void *)MEMORY[0x263F087E8];
  uint64_t v15 = *MEMORY[0x263F08320];
  uint64_t v16 = @"Memory dump is not an array";
  LOBYTE(v5) = 1;
  v12 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  *a4 = [v11 errorWithDomain:@"AppleHIDTransportSupport" code:0 userInfo:v12];

LABEL_11:
  return (char)v5;
}

- (BOOL)overrideProperties:(id)a3 error:(id *)a4
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  CFDataRef v6 = IOCFSerialize(a3, 0);
  id v7 = (id) [[NSString alloc] initWithData:v6 encoding:4];
  input[0] = [v7 cStringUsingEncoding:4];
  input[1] = [v7 length] + 1;
  if ([(AHTBootLoader *)self open:a4])
  {
    uint64_t v8 = IOConnectCallMethod(self->_connect, 0x12u, input, 2u, 0, 0, 0, 0, 0, 0);
    [(AHTBootLoader *)self close];
    BOOL v9 = +[AHTLoader errorFromKernel:v8 error:a4];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)getRegistryProperties
{
  CFMutableDictionaryRef properties = 0;
  io_registry_entry_t v2 = [(AHTBootLoader *)self service];
  if (IORegistryEntryCreateCFProperties(v2, &properties, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0)) {
    CFMutableDictionaryRef v3 = 0;
  }
  else {
    CFMutableDictionaryRef v3 = properties;
  }

  return v3;
}

- (id)description
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unsigned int v3 = [(AHTBootLoader *)self imageTag];
  v10[0] = HIBYTE(v3);
  v10[1] = BYTE2(v3);
  v10[2] = BYTE1(v3);
  v10[3] = v3;
  v10[4] = 0;
  uint64_t entryID = 0;
  MEMORY[0x223CA2FF0]([(AHTBootLoader *)self service], v11);
  IORegistryEntryGetRegistryEntryID([(AHTBootLoader *)self service], &entryID);
  v11[255] = 0;
  uint64_t v4 = NSString;
  uint64_t v5 = entryID;
  CFDataRef v6 = [(AHTBootLoader *)self personality];
  id v7 = [v4 stringWithFormat:@"registryEntryID: '0x%016llx', bootloader: '%s', imageTag: '%s', personality: '%@'", v5, v11, v10, v6];

  return v7;
}

- (NSString)personality
{
  return self->_personality;
}

- (AHTDevice)device
{
  return self->_device;
}

- (AHTInterface)interface
{
  return self->_interface;
}

- (NSString)type
{
  return self->_type;
}

- (unsigned)imageTag
{
  return self->_imageTag;
}

- (BOOL)needsRestoreUpdate
{
  return self->_needsRestoreUpdate;
}

- (BOOL)supportsMemoryDump
{
  return self->_supportsMemoryDump;
}

- (unsigned)service
{
  return self->_service;
}

- (void)setService:(unsigned int)a3
{
  self->_service = a3;
}

- (unsigned)connect
{
  return self->_connect;
}

- (void)setConnect:(unsigned int)a3
{
  self->_mach_port_t connect = a3;
}

- (unsigned)machPort
{
  return self->_machPort;
}

- (void)setMachPort:(unsigned int)a3
{
  self->_mach_port_name_t machPort = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_personality, 0);
}

@end