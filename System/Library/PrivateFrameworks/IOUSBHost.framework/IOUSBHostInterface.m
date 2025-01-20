@interface IOUSBHostInterface
+ (CFMutableDictionaryRef)createMatchingDictionaryWithVendorID:(NSNumber *)vendorID productID:(NSNumber *)productID bcdDevice:(NSNumber *)bcdDevice interfaceNumber:(NSNumber *)interfaceNumber configurationValue:(NSNumber *)configurationValue interfaceClass:(NSNumber *)interfaceClass interfaceSubclass:(NSNumber *)interfaceSubclass interfaceProtocol:(NSNumber *)interfaceProtocol speed:(NSNumber *)speed productIDArray:(NSArray *)productIDArray;
- (BOOL)selectAlternateSetting:(NSUInteger)alternateSetting error:(NSError *)error;
- (BOOL)setIdleTimeout:(NSTimeInterval)idleTimeout error:(NSError *)error;
- (IOUSBHostInterface)initWithIOService:(io_service_t)ioService options:(IOUSBHostObjectInitOptions)options queue:(dispatch_queue_t)queue error:(NSError *)error interestHandler:(IOUSBHostInterestHandler)interestHandler;
- (IOUSBHostPipe)copyPipeWithAddress:(NSUInteger)address error:(NSError *)error;
- (NSTimeInterval)idleTimeout;
- (const)configurationDescriptor;
- (const)interfaceDescriptor;
- (unint64_t)interfaceNumber;
- (unint64_t)lastKnownAlternateSetting;
- (void)setConfigurationDescriptor:(const IOUSBConfigurationDescriptor *)a3;
- (void)setInterfaceNumber:(unint64_t)a3;
- (void)setLastKnownAlternateSetting:(unint64_t)a3;
@end

@implementation IOUSBHostInterface

+ (CFMutableDictionaryRef)createMatchingDictionaryWithVendorID:(NSNumber *)vendorID productID:(NSNumber *)productID bcdDevice:(NSNumber *)bcdDevice interfaceNumber:(NSNumber *)interfaceNumber configurationValue:(NSNumber *)configurationValue interfaceClass:(NSNumber *)interfaceClass interfaceSubclass:(NSNumber *)interfaceSubclass interfaceProtocol:(NSNumber *)interfaceProtocol speed:(NSNumber *)speed productIDArray:(NSArray *)productIDArray
{
  v31 = productIDArray;
  v30 = speed;
  v18 = interfaceProtocol;
  v19 = interfaceSubclass;
  v20 = interfaceClass;
  v21 = configurationValue;
  v22 = interfaceNumber;
  v23 = bcdDevice;
  v24 = productID;
  v25 = vendorID;
  v26 = (objc_class *)objc_opt_class();
  NSStringFromClass(v26);
  id v27 = objc_claimAutoreleasedReturnValue();
  v28 = IOServiceMatching((const char *)[v27 UTF8String]);

  [v28 setValue:v25 forKey:IOUSBHostMatchingPropertyKeyVendorID];
  [v28 setValue:v24 forKey:IOUSBHostMatchingPropertyKeyProductID];

  [v28 setValue:v23 forKey:IOUSBHostMatchingPropertyKeyDeviceReleaseNumber];
  [v28 setValue:v22 forKey:IOUSBHostMatchingPropertyKeyInterfaceNumber];

  [v28 setValue:v21 forKey:IOUSBHostMatchingPropertyKeyConfigurationValue];
  [v28 setValue:v20 forKey:IOUSBHostMatchingPropertyKeyInterfaceClass];

  [v28 setValue:v19 forKey:IOUSBHostMatchingPropertyKeyInterfaceSubClass];
  [v28 setValue:v18 forKey:IOUSBHostMatchingPropertyKeyInterfaceProtocol];

  [v28 setValue:v30 forKey:IOUSBHostMatchingPropertyKeySpeed];
  [v28 setValue:v31 forKey:IOUSBHostMatchingPropertyKeyProductIDArray];

  return (CFMutableDictionaryRef)v28;
}

- (IOUSBHostInterface)initWithIOService:(io_service_t)ioService options:(IOUSBHostObjectInitOptions)options queue:(dispatch_queue_t)queue error:(NSError *)error interestHandler:(IOUSBHostInterestHandler)interestHandler
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  v40.receiver = self;
  v40.super_class = (Class)IOUSBHostInterface;
  v8 = [(IOUSBHostObject *)&v40 initWithIOService:*(void *)&ioService options:options queue:queue error:error interestHandler:interestHandler];
  v9 = v8;
  if (!v8)
  {
    if (error)
    {
      uint64_t v41 = *MEMORY[0x263F08320];
      v18 = [MEMORY[0x263F086E0] mainBundle];
      v19 = [v18 localizedStringForKey:@"Failed to create IOUSBHostInterface." value:&stru_26DBD82D0 table:0];
      valuePtr = v19;
      uint64_t v42 = *MEMORY[0x263F08338];
      v20 = [MEMORY[0x263F086E0] mainBundle];
      v21 = [v20 localizedStringForKey:@"Failed [super init]" value:&stru_26DBD82D0 table:0];
      v45 = v21;
      uint64_t v43 = *MEMORY[0x263F08348];
      v22 = [MEMORY[0x263F086E0] mainBundle];
      v23 = [v22 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v46 = v23;
      v24 = [NSDictionary dictionaryWithObjects:&valuePtr forKeys:&v41 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870199 userInfo:v24];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostInterface initWithIOService:options:queue:error:interestHandler:]();
      }
    }
    goto LABEL_15;
  }
  io_registry_entry_t v10 = [(IOUSBHostObject *)v8 ioService];
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v10, @"bConfigurationValue", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFNumberRef v13 = CFProperty;
    CFTypeID v14 = CFGetTypeID(CFProperty);
    if (v14 == CFNumberGetTypeID())
    {
      LOBYTE(valuePtr) = 0;
      CFNumberGetValue(v13, kCFNumberSInt8Type, &valuePtr);
      [(IOUSBHostInterface *)v9 setConfigurationDescriptor:[(IOUSBHostObject *)v9 configurationDescriptorWithConfigurationValue:valuePtr error:error]];
    }
    CFRelease(v13);
  }
  if (![(IOUSBHostInterface *)v9 configurationDescriptor])
  {
    if (error)
    {
      uint64_t v41 = *MEMORY[0x263F08320];
      v26 = [MEMORY[0x263F086E0] mainBundle];
      id v27 = [v26 localizedStringForKey:@"Failed to create IOUSBHostInterface." value:&stru_26DBD82D0 table:0];
      valuePtr = v27;
      uint64_t v42 = *MEMORY[0x263F08338];
      v28 = [MEMORY[0x263F086E0] mainBundle];
      v29 = [v28 localizedStringForKey:@"Unable to obtain configuration descriptor." value:&stru_26DBD82D0 table:0];
      v45 = v29;
      uint64_t v43 = *MEMORY[0x263F08348];
      v30 = [MEMORY[0x263F086E0] mainBundle];
      v31 = [v30 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v46 = v31;
      v32 = [NSDictionary dictionaryWithObjects:&valuePtr forKeys:&v41 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870212 userInfo:v32];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostInterface initWithIOService:options:queue:error:interestHandler:]();
      }
      goto LABEL_22;
    }
LABEL_23:
    v25 = 0;
    goto LABEL_24;
  }
  CFNumberRef v15 = (const __CFNumber *)IORegistryEntryCreateCFProperty([(IOUSBHostObject *)v9 ioService], @"bInterfaceNumber", v11, 0);
  if (!v15)
  {
    if (error)
    {
      uint64_t v41 = *MEMORY[0x263F08320];
      v33 = [MEMORY[0x263F086E0] mainBundle];
      v34 = [v33 localizedStringForKey:@"Failed to create IOUSBHostInterface." value:&stru_26DBD82D0 table:0];
      valuePtr = v34;
      uint64_t v42 = *MEMORY[0x263F08338];
      v35 = [MEMORY[0x263F086E0] mainBundle];
      v36 = [v35 localizedStringForKey:@"Unable to obtain interface number." value:&stru_26DBD82D0 table:0];
      v45 = v36;
      uint64_t v43 = *MEMORY[0x263F08348];
      v37 = [MEMORY[0x263F086E0] mainBundle];
      v38 = [v37 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v46 = v38;
      v32 = [NSDictionary dictionaryWithObjects:&valuePtr forKeys:&v41 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870212 userInfo:v32];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostInterface initWithIOService:options:queue:error:interestHandler:]();
      }
LABEL_22:

      goto LABEL_23;
    }
    goto LABEL_23;
  }
  CFNumberRef v16 = v15;
  CFTypeID v17 = CFGetTypeID(v15);
  if (v17 == CFNumberGetTypeID())
  {
    LOBYTE(valuePtr) = 0;
    CFNumberGetValue(v16, kCFNumberSInt8Type, &valuePtr);
    [(IOUSBHostInterface *)v9 setInterfaceNumber:valuePtr];
  }
  CFRelease(v16);
LABEL_15:
  v25 = v9;
LABEL_24:

  return v25;
}

- (NSTimeInterval)idleTimeout
{
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  uint64_t v3 = IOConnectCallScalarMethod([(IOUSBHostObject *)self ioConnection], 0xBu, 0, 0, &output, &outputCnt);
  if (v3)
  {
    uint64_t v4 = v3;
    double v5 = 0.0;
    if ([(IOUSBHostObject *)self debugLoggingMask]) {
      NSLog(&cfstr_LineDOfSSconne.isa, 142, "/Library/Caches/com.apple.xbs/Sources/IOUSBHostFamily/IOUSBHostFramework/IOUSBHostInterface.m", "-[IOUSBHostInterface idleTimeout]", v4);
    }
  }
  else
  {
    double v5 = (double)output;
  }
  return v5 / 1000.0;
}

- (BOOL)setIdleTimeout:(NSTimeInterval)idleTimeout error:(NSError *)error
{
  kern_return_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void v16[3];
  void v17[4];

  v17[3] = *MEMORY[0x263EF8340];
  double v5 = &off_2279B3000;
  LODWORD(v5) = vcvtad_u64_f64(idleTimeout * 1000.0);
  v6 = IOConnectCallScalarMethod([(IOUSBHostObject *)self ioConnection], 0xAu, &v15, 1u, 0, 0);
  if (v6 && error)
  {
    v16[0] = *MEMORY[0x263F08320];
    v7 = [MEMORY[0x263F086E0] mainBundle];
    v8 = [v7 localizedStringForKey:@"Unable to set idle timeout." value:&stru_26DBD82D0 table:0];
    v17[0] = v8;
    v16[1] = *MEMORY[0x263F08338];
    v9 = [MEMORY[0x263F086E0] mainBundle];
    io_registry_entry_t v10 = [v9 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v17[1] = v10;
    v16[2] = *MEMORY[0x263F08348];
    CFAllocatorRef v11 = [MEMORY[0x263F086E0] mainBundle];
    v12 = [v11 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v17[2] = v12;
    CFNumberRef v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];

    *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:v6 userInfo:v13];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[IOUSBHostInterface setIdleTimeout:error:]();
    }
  }
  return v6 == 0;
}

- (const)interfaceDescriptor
{
  io_registry_entry_t v3 = [(IOUSBHostObject *)self ioService];
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v3, @"bAlternateSetting", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFNumberRef v5 = CFProperty;
    unsigned __int8 valuePtr = 0;
    CFTypeID v6 = CFGetTypeID(CFProperty);
    if (v6 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v5, kCFNumberSInt8Type, &valuePtr);
      [(IOUSBHostInterface *)self setLastKnownAlternateSetting:valuePtr];
    }
    CFRelease(v5);
  }
  v7 = [(IOUSBHostInterface *)self configurationDescriptor];
  v8 = v7;
  for (i = 0; ; i = (const IOUSBDescriptorHeader *)v11)
  {
    InterfaceDescriptor = IOUSBGetNextInterfaceDescriptor(v7, i);
    CFAllocatorRef v11 = InterfaceDescriptor;
    if (!InterfaceDescriptor) {
      break;
    }
    uint64_t bInterfaceNumber = InterfaceDescriptor->bInterfaceNumber;
    if ([(IOUSBHostInterface *)self interfaceNumber] == bInterfaceNumber)
    {
      uint64_t bAlternateSetting = v11->bAlternateSetting;
      if ([(IOUSBHostInterface *)self lastKnownAlternateSetting] == bAlternateSetting) {
        break;
      }
    }
    v7 = v8;
  }
  return v11;
}

- (BOOL)selectAlternateSetting:(NSUInteger)alternateSetting error:(NSError *)error
{
  kern_return_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  void v17[3];
  void v18[4];

  v18[3] = *MEMORY[0x263EF8340];
  v7 = IOConnectCallScalarMethod([(IOUSBHostObject *)self ioConnection], 0xCu, &v16, 1u, 0, 0);
  if (v7)
  {
    if (error)
    {
      v17[0] = *MEMORY[0x263F08320];
      v8 = [MEMORY[0x263F086E0] mainBundle];
      v9 = [v8 localizedStringForKey:@"Unable to select alternate setting." value:&stru_26DBD82D0 table:0];
      v18[0] = v9;
      v17[1] = *MEMORY[0x263F08338];
      io_registry_entry_t v10 = [MEMORY[0x263F086E0] mainBundle];
      CFAllocatorRef v11 = [v10 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v18[1] = v11;
      v17[2] = *MEMORY[0x263F08348];
      v12 = [MEMORY[0x263F086E0] mainBundle];
      CFNumberRef v13 = [v12 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v18[2] = v13;
      CFTypeID v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:v7 userInfo:v14];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostInterface selectAlternateSetting:error:]();
      }
    }
  }
  else
  {
    [(IOUSBHostInterface *)self setLastKnownAlternateSetting:alternateSetting];
  }
  return v7 == 0;
}

- (IOUSBHostPipe)copyPipeWithAddress:(NSUInteger)address error:(NSError *)error
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  __int16 valuePtr = 0;
  io_registry_entry_t v7 = [(IOUSBHostObject *)self ioService];
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v7, @"bAlternateSetting", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFNumberRef v10 = CFProperty;
    CFTypeID v11 = CFGetTypeID(CFProperty);
    if (v11 == CFNumberGetTypeID()) {
      CFNumberGetValue(v10, kCFNumberSInt8Type, &valuePtr);
    }
    CFRelease(v10);
  }
  CFNumberRef v12 = (const __CFNumber *)IORegistryEntryCreateCFProperty([(IOUSBHostObject *)self ioService], @"bInterfaceNumber", v8, 0);
  if (v12)
  {
    CFNumberRef v13 = v12;
    CFTypeID v14 = CFGetTypeID(v12);
    if (v14 == CFNumberGetTypeID()) {
      CFNumberGetValue(v13, kCFNumberSInt8Type, (char *)&valuePtr + 1);
    }
    CFRelease(v13);
  }
  CFNumberRef v15 = [(IOUSBHostInterface *)self configurationDescriptor];
  CFNumberRef v16 = v15;
  for (i = 0; ; i = (const IOUSBDescriptorHeader *)v19)
  {
    InterfaceDescriptor = IOUSBGetNextInterfaceDescriptor(v15, i);
    v19 = InterfaceDescriptor;
    if (!InterfaceDescriptor
      || __PAIR64__(InterfaceDescriptor->bAlternateSetting, InterfaceDescriptor->bInterfaceNumber) == __PAIR64__(valuePtr, HIBYTE(valuePtr)))
    {
      break;
    }
    CFNumberRef v15 = v16;
  }
  v20 = 0;
  do
  {
    EndpointDescriptor = IOUSBGetNextEndpointDescriptor(v16, v19, v20);
    if (!EndpointDescriptor)
    {
      if (!error) {
        return 0;
      }
      uint64_t v37 = *MEMORY[0x263F08320];
      v30 = [MEMORY[0x263F086E0] mainBundle];
      v31 = [v30 localizedStringForKey:@"Unable to copy pipe." value:&stru_26DBD82D0 table:0];
      objc_super v40 = v31;
      uint64_t v38 = *MEMORY[0x263F08338];
      v32 = [MEMORY[0x263F086E0] mainBundle];
      v33 = [v32 localizedStringForKey:@"Endpoint address not found." value:&stru_26DBD82D0 table:0];
      uint64_t v41 = v33;
      uint64_t v39 = *MEMORY[0x263F08348];
      v34 = [MEMORY[0x263F086E0] mainBundle];
      v35 = [v34 localizedStringForKey:@"Select a valid endpoint address" value:&stru_26DBD82D0 table:0];
      uint64_t v42 = v35;
      v29 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v37 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870160 userInfo:v29];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostInterface copyPipeWithAddress:error:]();
      }
      goto LABEL_23;
    }
    v20 = (const IOUSBDescriptorHeader *)EndpointDescriptor;
  }
  while (IOUSBGetEndpointAddress(EndpointDescriptor) != address);
  result = [[IOUSBHostPipe alloc] initWithHostInterface:self endpointAddress:address ioConnection:[(IOUSBHostObject *)self ioConnection] ioNotificationPortRef:[(IOUSBHostObject *)self ioNotificationPortRef] deviceAddress:[(IOUSBHostObject *)self deviceAddress]];
  if (result) {
    return result;
  }
  if (error)
  {
    uint64_t v37 = *MEMORY[0x263F08320];
    v23 = [MEMORY[0x263F086E0] mainBundle];
    v24 = [v23 localizedStringForKey:@"Unable to copy pipe." value:&stru_26DBD82D0 table:0];
    objc_super v40 = v24;
    uint64_t v38 = *MEMORY[0x263F08338];
    v25 = [MEMORY[0x263F086E0] mainBundle];
    v26 = [v25 localizedStringForKey:@"IOUSBHostPipe init failed." value:&stru_26DBD82D0 table:0];
    uint64_t v41 = v26;
    uint64_t v39 = *MEMORY[0x263F08348];
    id v27 = [MEMORY[0x263F086E0] mainBundle];
    v28 = [v27 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    uint64_t v42 = v28;
    v29 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v37 count:3];

    *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870211 userInfo:v29];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[IOUSBHostInterface copyPipeWithAddress:error:]();
    }
LABEL_23:
  }
  return 0;
}

- (const)configurationDescriptor
{
  return self->_configurationDescriptor;
}

- (void)setConfigurationDescriptor:(const IOUSBConfigurationDescriptor *)a3
{
  self->_configurationDescriptor = a3;
}

- (unint64_t)interfaceNumber
{
  return self->_interfaceNumber;
}

- (void)setInterfaceNumber:(unint64_t)a3
{
  self->_interfaceNumber = a3;
}

- (unint64_t)lastKnownAlternateSetting
{
  return self->_lastKnownAlternateSetting;
}

- (void)setLastKnownAlternateSetting:(unint64_t)a3
{
  self->_lastKnownAlternateSetting = a3;
}

- (void)initWithIOService:options:queue:error:interestHandler:.cold.1()
{
  [@"Failed to create IOUSBHostInterface." cStringUsingEncoding:4];
  [@"Failed [super init]" cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)initWithIOService:options:queue:error:interestHandler:.cold.2()
{
  [@"Failed to create IOUSBHostInterface." cStringUsingEncoding:4];
  [@"Unable to obtain configuration descriptor." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)initWithIOService:options:queue:error:interestHandler:.cold.3()
{
  [@"Failed to create IOUSBHostInterface." cStringUsingEncoding:4];
  [@"Unable to obtain interface number." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)setIdleTimeout:error:.cold.1()
{
  [@"Unable to set idle timeout." cStringUsingEncoding:4];
  [0 cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)selectAlternateSetting:error:.cold.1()
{
  [@"Unable to select alternate setting." cStringUsingEncoding:4];
  [0 cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)copyPipeWithAddress:error:.cold.1()
{
  [@"Unable to copy pipe." cStringUsingEncoding:4];
  [@"Endpoint address not found." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)copyPipeWithAddress:error:.cold.2()
{
  [@"Unable to copy pipe." cStringUsingEncoding:4];
  [@"IOUSBHostPipe init failed." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

@end