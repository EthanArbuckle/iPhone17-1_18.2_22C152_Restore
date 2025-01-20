@interface AHTInterface
+ (id)allInterfaces;
+ (id)withName:(id)a3;
+ (id)withService:(unsigned int)a3;
- (AHTInterface)initWithService:(unsigned int)a3;
- (BOOL)captureMemoryDump;
- (BOOL)getPower:(int64_t *)a3;
- (BOOL)getReport:(unsigned __int8)a3 withData:(id)a4;
- (BOOL)reset;
- (BOOL)setEnable:(BOOL)a3;
- (BOOL)setPower:(int64_t)a3;
- (BOOL)setReport:(unsigned __int8)a3 withData:(id)a4;
- (id)description;
- (unsigned)interfaceID;
@end

@implementation AHTInterface

+ (id)allInterfaces
{
  io_iterator_t existing = 0;
  v2 = objc_opt_new();
  CFDictionaryRef v3 = IOServiceMatching("AppleHIDTransportInterface");
  if (v3 && !IOServiceGetMatchingServices(0, v3, &existing))
  {
    uint64_t v4 = IOIteratorNext(existing);
    if (v4)
    {
      uint64_t v5 = v4;
      do
      {
        v6 = +[AHTInterface withService:v5];
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
  +[AHTInterface allInterfaces];
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
  id v3 = [[AHTInterface alloc] initWithService:*(void *)&a3];

  return v3;
}

- (AHTInterface)initWithService:(unsigned int)a3
{
  if (!a3) {
    goto LABEL_9;
  }
  uint64_t v4 = *(void *)&a3;
  if (!IOObjectConformsTo(a3, "AppleHIDTransportInterface")) {
    goto LABEL_9;
  }
  v14.receiver = self;
  v14.super_class = (Class)AHTInterface;
  self = [(AHTCommon *)&v14 initWithService:v4];
  if (!self) {
    goto LABEL_9;
  }
  unsigned __int8 valuePtr = 0;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v4, @"bInterfaceNumber", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty
    && (CFNumberRef v7 = CFProperty, Value = CFNumberGetValue(CFProperty, kCFNumberSInt8Type, &valuePtr), CFRelease(v7), Value))
  {
    self->_interfaceID = valuePtr;
    CFTypeRef v9 = IORegistryEntryCreateCFProperty(v4, @"InterfaceName", v5, 0);
    if (v9)
    {
      char v10 = (void *)v9;
      [(AHTCommon *)self setName:v9];
    }
    v11 = self;
  }
  else
  {
LABEL_9:
    v11 = 0;
  }

  return v11;
}

- (BOOL)setEnable:(BOOL)a3
{
  BOOL v3 = a3;
  io_registry_entry_t v4 = [(AHTCommon *)self service];
  CFAllocatorRef v5 = (CFTypeRef *)MEMORY[0x263EFFB38];
  if (!v3) {
    CFAllocatorRef v5 = (CFTypeRef *)MEMORY[0x263EFFB40];
  }
  return IORegistryEntrySetCFProperty(v4, @"InterfaceDisabled", *v5) == 0;
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
      uint64_t v6 = IOConnectCallScalarMethod([(AHTCommon *)self connect], 4u, 0, 0, &output, &outputCnt);
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

- (BOOL)captureMemoryDump
{
  LODWORD(CFProperty) = [(AHTCommon *)self connect];
  if (CFProperty)
  {
    char valuePtr = 0;
    io_registry_entry_t v4 = [(AHTCommon *)self service];
    CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v4, @"PowerMethod", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (CFProperty)
    {
      CFNumberRef v5 = CFProperty;
      int Value = CFNumberGetValue(CFProperty, kCFNumberSInt8Type, &valuePtr);
      CFRelease(v5);
      if (Value) {
        BOOL v7 = valuePtr == 2;
      }
      else {
        BOOL v7 = 0;
      }
      LOBYTE(CFProperty) = v7
                        && IOConnectCallScalarMethod([(AHTCommon *)self connect], 5u, 0, 0, 0, 0) == 0;
    }
  }
  return (char)CFProperty;
}

- (BOOL)setReport:(unsigned __int8)a3 withData:(id)a4
{
  unsigned int v4 = a3;
  id v6 = a4;
  if ([(AHTCommon *)self connect])
  {
    id v7 = v6;
    uint64_t input = v4;
    BOOL v8 = IOConnectCallMethod(-[AHTCommon connect](self, "connect"), 3u, &input, 1u, (const void *)[v7 bytes], objc_msgSend(v7, "length"), 0, 0, 0, 0) == 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)getReport:(unsigned __int8)a3 withData:(id)a4
{
  kern_return_t v7;
  BOOL v8;
  size_t v10;
  uint64_t input;
  unsigned char outputStruct[4096];
  uint64_t v13;

  unsigned int v4 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if ([(AHTCommon *)self connect])
  {
    char v10 = 4096;
    uint64_t input = v4;
    id v7 = IOConnectCallMethod([(AHTCommon *)self connect], 2u, &input, 1u, 0, 0, 0, 0, outputStruct, &v10);
    BOOL v8 = v7 == 0;
    if (!v7) {
      [v6 appendBytes:outputStruct length:v10];
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  unsigned int v3 = [(AHTCommon *)self getBootLoader];
  unsigned int v4 = NSString;
  CFNumberRef v5 = [(AHTCommon *)self name];
  uint64_t v6 = [(AHTInterface *)self interfaceID];
  if (v3) {
    [v4 stringWithFormat:@"%@ (ifaceId:%d) (%@)", v5, v6, v3];
  }
  else {
  id v7 = [v4 stringWithFormat:@"%@ (ifaceId:%d) (no bootloader)", v5, v6, v9];
  }

  return v7;
}

- (unsigned)interfaceID
{
  return self->_interfaceID;
}

@end