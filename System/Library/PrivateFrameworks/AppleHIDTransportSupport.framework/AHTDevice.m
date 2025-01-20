@interface AHTDevice
+ (AHTDevice)deviceWithParentRegistryId:(unint64_t)a3;
+ (id)allDevices;
+ (id)withName:(id)a3;
+ (id)withService:(unsigned int)a3;
- (AHTDevice)initWithService:(unsigned int)a3;
- (BOOL)getPower:(int64_t *)a3;
- (BOOL)reset;
- (BOOL)setPower:(int64_t)a3;
- (id)description;
- (id)getBootLoader;
- (id)getInterface:(unsigned __int8)a3;
- (id)getInterfaceWithName:(id)a3;
- (id)getInterfaces;
- (id)reporterResults;
@end

@implementation AHTDevice

+ (id)allDevices
{
  io_iterator_t existing = 0;
  v2 = objc_opt_new();
  CFDictionaryRef v3 = IOServiceMatching("AppleHIDTransportDevice");
  if (v3 && !IOServiceGetMatchingServices(0, v3, &existing))
  {
    uint64_t v4 = IOIteratorNext(existing);
    if (v4)
    {
      uint64_t v5 = v4;
      do
      {
        v6 = +[AHTDevice withService:v5];
        IOObjectRelease(v5);
        if (v6) {
          [v2 addObject:v6];
        }

        uint64_t v5 = IOIteratorNext(existing);
      }
      while (v5);
    }
    IOObjectRelease(existing);
  }

  return v2;
}

+ (id)withName:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  +[AHTDevice allDevices];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "name", (void)v12);
        char v10 = [v9 isEqualToString:v3];

        if (v10)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (id)withService:(unsigned int)a3
{
  id v3 = [[AHTDevice alloc] initWithService:*(void *)&a3];

  return v3;
}

- (AHTDevice)initWithService:(unsigned int)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a3
    && (uint64_t v4 = *(void *)&a3, IOObjectConformsTo(a3, "AppleHIDTransportDevice"))
    && (v10.receiver = self,
        v10.super_class = (Class)AHTDevice,
        (self = [(AHTCommon *)&v10 initWithService:v4]) != 0))
  {
    io_registry_entry_t parent = 0;
    memset(v11, 0, sizeof(v11));
    if (IORegistryEntryGetParentEntry(v4, "IOService", &parent)
      || MEMORY[0x223CA2FF0](parent, v11)
      || ([NSString stringWithUTF8String:v11],
          v7 = objc_claimAutoreleasedReturnValue(),
          [(AHTCommon *)self setName:v7],
          v7,
          [(AHTCommon *)self name],
          v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          !v8))
    {

      self = 0;
    }
    if (parent) {
      IOObjectRelease(parent);
    }
    self = self;
    id v5 = self;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (AHTDevice)deviceWithParentRegistryId:(unint64_t)a3
{
  uint64_t v4 = IOServiceMatching("AppleHIDTransportDevice");
  CFMutableDictionaryRef v5 = IORegistryEntryIDMatching(a3);
  [v4 setObject:v5 forKeyedSubscript:@"IOParentMatch"];

  uint64_t MatchingService = IOServiceGetMatchingService(0, (CFDictionaryRef)v4);
  if (MatchingService)
  {
    uint64_t v7 = MatchingService;
    if (IOObjectConformsTo(MatchingService, "AppleHIDTransportDevice"))
    {
      v8 = +[AHTDevice withService:v7];
    }
    else
    {
      v8 = 0;
    }
    IOObjectRelease(v7);
  }
  else
  {
    v8 = 0;
  }

  return (AHTDevice *)v8;
}

- (id)getInterfaces
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  io_iterator_t iterator = 0;
  if (!MEMORY[0x223CA2FE0]([(AHTCommon *)self service], "IOService", 1, &iterator))
  {
    uint64_t v4 = IOIteratorNext(iterator);
    if (v4)
    {
      uint64_t v5 = v4;
      do
      {
        if (IOObjectConformsTo(v5, "AppleHIDTransportInterface"))
        {
          uint64_t v6 = +[AHTInterface withService:v5];
          [v3 addObject:v6];
        }
        IOObjectRelease(v5);
        uint64_t v5 = IOIteratorNext(iterator);
      }
      while (v5);
    }
    IOObjectRelease(iterator);
  }

  return v3;
}

- (id)getInterface:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  [(AHTDevice *)self getInterfaces];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "interfaceID", (void)v12) == v3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (id)getInterfaceWithName:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(AHTDevice *)self getInterfaces];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "name", (void)v13);
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)getBootLoader
{
  io_iterator_t iterator = 0;
  if (MEMORY[0x223CA2FE0]([(AHTCommon *)self service], "IOService", 1, &iterator))
  {
    int v3 = 0;
  }
  else
  {
    while (1)
    {
      uint64_t v4 = IOIteratorNext(iterator);
      if (!v4) {
        break;
      }
      uint64_t v5 = v4;
      if (IOObjectConformsTo(v4, "AppleHIDTransportBootloader"))
      {
        int v3 = +[AHTBootLoader withParent:self service:v5];
        goto LABEL_7;
      }
    }
    int v3 = 0;
LABEL_7:
    IOObjectRelease(iterator);
  }

  return v3;
}

- (BOOL)setPower:(int64_t)a3
{
  uint64_t v11 = v3;
  uint64_t v12 = v4;
  uint64_t v13 = v5;
  switch(a3)
  {
    case 0:
      uint64_t input = 0;
      goto LABEL_10;
    case 1:
      uint64_t v8 = 1;
      goto LABEL_9;
    case 2:
      uint64_t v8 = 2;
      goto LABEL_9;
    case 3:
      uint64_t v8 = 3;
      goto LABEL_9;
    case 4:
      uint64_t v8 = 4;
      goto LABEL_9;
    case 5:
      uint64_t v8 = 5;
LABEL_9:
      uint64_t input = v8;
LABEL_10:
      unsigned int v7 = [(AHTCommon *)self connect];
      if (v7) {
        LOBYTE(v7) = IOConnectCallScalarMethod([(AHTCommon *)self connect], 0, &input, 1u, 0, 0) == 0;
      }
      break;
    default:
      LOBYTE(v7) = 0;
      break;
  }
  return v7;
}

- (BOOL)getPower:(int64_t *)a3
{
  kern_return_t v6;
  uint32_t outputCnt;
  uint64_t output;

  if (a3)
  {
    unsigned int v5 = [(AHTCommon *)self connect];
    if (v5)
    {
      output = 0;
      outputCnt = 1;
      id v6 = IOConnectCallScalarMethod([(AHTCommon *)self connect], 2u, 0, 0, &output, &outputCnt);
      LOBYTE(v5) = 0;
      if (!v6 && outputCnt == 1)
      {
        if (output > 5)
        {
          LOBYTE(v5) = 0;
        }
        else
        {
          *a3 = output;
          LOBYTE(v5) = 1;
        }
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)reset
{
  unsigned int v3 = [(AHTCommon *)self connect];
  if (v3) {
    LOBYTE(v3) = IOConnectCallScalarMethod([(AHTCommon *)self connect], 1u, 0, 0, 0, 0) == 0;
  }
  return v3;
}

- (id)reporterResults
{
  v18[3] = 0;
  CFTypeRef v19 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy_;
  v16[4] = __Block_byref_object_dispose_;
  id v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy_;
  v14[4] = __Block_byref_object_dispose_;
  id v15 = 0;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy_;
  uint64_t v12 = __Block_byref_object_dispose_;
  id v13 = (id)objc_opt_new();
  if ([(AHTCommon *)self service])
  {
    [(AHTCommon *)self service];
    unsigned int v3 = (const void *)IOReportCopyChannelsForDriver();
    if (v3)
    {
      if ((int)IOReportGetChannelCount() < 1)
      {
        Samples = 0;
        Subscription = 0;
      }
      else
      {
        Subscription = (const void *)IOReportCreateSubscription();
        Samples = 0;
        if (Subscription)
        {
          if (v19)
          {
            Samples = (const void *)IOReportCreateSamples();
            if (Samples) {
              IOReportIterate();
            }
          }
        }
      }
      CFRelease(v3);
      if (Samples) {
        CFRelease(Samples);
      }
      if (Subscription) {
        CFRelease(Subscription);
      }
    }
  }
  if (v19) {
    CFRelease(v19);
  }
  id v6 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);

  _Block_object_dispose(v18, 8);

  return v6;
}

uint64_t __28__AHTDevice_reporterResults__block_invoke(void *a1)
{
  uint64_t v2 = IOReportChannelGetGroup();
  uint64_t v3 = *(void *)(a1[4] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (![*(id *)(*(void *)(a1[4] + 8) + 40) isEqualToString:@"AppleHIDTransport"])return 16; {
  if (IOReportChannelGetFormat() != 1)
  }
    return 16;
  *(void *)(*(void *)(a1[5] + 8) + 24) = IOReportSimpleGetIntegerValue();
  if (*(void *)(*(void *)(a1[5] + 8) + 24) == 0x8000000000000000) {
    return 16;
  }
  uint64_t v6 = IOReportChannelGetChannelName();
  uint64_t v7 = *(void *)(a1[6] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  v9 = [NSNumber numberWithLongLong:*(void *)(*(void *)(a1[5] + 8) + 24)];
  [*(id *)(*(void *)(a1[7] + 8) + 40) setObject:v9 forKeyedSubscript:*(void *)(*(void *)(a1[6] + 8) + 40)];

  return 0;
}

- (id)description
{
  uint64_t v3 = [(AHTDevice *)self getBootLoader];
  uint64_t v4 = NSString;
  uint64_t v5 = [(AHTCommon *)self name];
  uint64_t v6 = (void *)v5;
  uint64_t v7 = @"no bootloader";
  if (v3) {
    uint64_t v7 = v3;
  }
  uint64_t v8 = [v4 stringWithFormat:@"%@ (%@)", v5, v7];

  return v8;
}

@end