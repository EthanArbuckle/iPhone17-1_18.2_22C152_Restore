@interface IOUSBHostDevice
+ (CFMutableDictionaryRef)createMatchingDictionaryWithVendorID:(NSNumber *)vendorID productID:(NSNumber *)productID bcdDevice:(NSNumber *)bcdDevice deviceClass:(NSNumber *)deviceClass deviceSubclass:(NSNumber *)deviceSubclass deviceProtocol:(NSNumber *)deviceProtocol speed:(NSNumber *)speed productIDArray:(NSArray *)productIDArray;
- (BOOL)allocateDownstreamBusCurrentWithWakeUnits:(unint64_t *)a3 sleepUnits:(unint64_t *)a4 error:(id *)a5;
- (BOOL)configureWithValue:(NSUInteger)value error:(NSError *)error;
- (BOOL)configureWithValue:(NSUInteger)value matchInterfaces:(BOOL)matchInterfaces error:(NSError *)error;
- (BOOL)resetWithError:(NSError *)error;
- (const)configurationDescriptor;
- (unint64_t)lastKnownConfiguration;
- (void)setLastKnownConfiguration:(unint64_t)a3;
@end

@implementation IOUSBHostDevice

+ (CFMutableDictionaryRef)createMatchingDictionaryWithVendorID:(NSNumber *)vendorID productID:(NSNumber *)productID bcdDevice:(NSNumber *)bcdDevice deviceClass:(NSNumber *)deviceClass deviceSubclass:(NSNumber *)deviceSubclass deviceProtocol:(NSNumber *)deviceProtocol speed:(NSNumber *)speed productIDArray:(NSArray *)productIDArray
{
  v16 = productIDArray;
  v17 = speed;
  v18 = deviceProtocol;
  v19 = deviceSubclass;
  v20 = deviceClass;
  v21 = bcdDevice;
  v22 = productID;
  v23 = vendorID;
  v24 = (objc_class *)objc_opt_class();
  NSStringFromClass(v24);
  id v25 = objc_claimAutoreleasedReturnValue();
  v26 = IOServiceMatching((const char *)[v25 UTF8String]);

  [v26 setValue:v23 forKey:IOUSBHostMatchingPropertyKeyVendorID];
  [v26 setValue:v22 forKey:IOUSBHostMatchingPropertyKeyProductID];

  [v26 setValue:v21 forKey:IOUSBHostMatchingPropertyKeyDeviceReleaseNumber];
  [v26 setValue:v20 forKey:IOUSBHostMatchingPropertyKeyDeviceClass];

  [v26 setValue:v19 forKey:IOUSBHostMatchingPropertyKeyDeviceSubClass];
  [v26 setValue:v18 forKey:IOUSBHostMatchingPropertyKeyDeviceProtocol];

  [v26 setValue:v17 forKey:IOUSBHostMatchingPropertyKeySpeed];
  [v26 setValue:v16 forKey:IOUSBHostMatchingPropertyKeyProductIDArray];

  return (CFMutableDictionaryRef)v26;
}

- (BOOL)configureWithValue:(NSUInteger)value error:(NSError *)error
{
  return [(IOUSBHostDevice *)self configureWithValue:value matchInterfaces:1 error:error];
}

- (BOOL)configureWithValue:(NSUInteger)value matchInterfaces:(BOOL)matchInterfaces error:(NSError *)error
{
  kern_return_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t input[2];
  void v18[3];
  void v19[4];

  v19[3] = *MEMORY[0x263EF8340];
  input[0] = value;
  input[1] = matchInterfaces;
  v8 = IOConnectCallScalarMethod([(IOUSBHostObject *)self ioConnection], 0xAu, input, 2u, 0, 0);
  if (v8)
  {
    if (error)
    {
      v18[0] = *MEMORY[0x263F08320];
      v9 = [MEMORY[0x263F086E0] mainBundle];
      v10 = [v9 localizedStringForKey:@"Unable to set configuration." value:&stru_26DBD82D0 table:0];
      v19[0] = v10;
      v18[1] = *MEMORY[0x263F08338];
      v11 = [MEMORY[0x263F086E0] mainBundle];
      v12 = [v11 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v19[1] = v12;
      v18[2] = *MEMORY[0x263F08348];
      v13 = [MEMORY[0x263F086E0] mainBundle];
      v14 = [v13 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v19[2] = v14;
      v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:v8 userInfo:v15];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostDevice configureWithValue:matchInterfaces:error:]();
      }
    }
  }
  else
  {
    [(IOUSBHostDevice *)self setLastKnownConfiguration:value];
  }
  return v8 == 0;
}

- (const)configurationDescriptor
{
  io_registry_entry_t v3 = [(IOUSBHostObject *)self ioService];
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v3, (CFStringRef)IOUSBHostDevicePropertyKeyCurrentConfiguration, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFNumberRef v5 = CFProperty;
    CFTypeID v6 = CFGetTypeID(CFProperty);
    if (v6 == CFNumberGetTypeID())
    {
      unsigned __int8 valuePtr = 0;
      CFNumberGetValue(v5, kCFNumberSInt8Type, &valuePtr);
      [(IOUSBHostDevice *)self setLastKnownConfiguration:valuePtr];
    }
    CFRelease(v5);
  }
  result = [(IOUSBHostDevice *)self lastKnownConfiguration];
  if (result) {
    return [(IOUSBHostObject *)self configurationDescriptorWithConfigurationValue:[(IOUSBHostDevice *)self lastKnownConfiguration] error:0];
  }
  return result;
}

- (BOOL)resetWithError:(NSError *)error
{
  kern_return_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void v13[3];
  void v14[4];

  v14[3] = *MEMORY[0x263EF8340];
  v4 = IOConnectCallScalarMethod([(IOUSBHostObject *)self ioConnection], 0xCu, 0, 0, 0, 0);
  if (v4 && error)
  {
    v13[0] = *MEMORY[0x263F08320];
    CFNumberRef v5 = [MEMORY[0x263F086E0] mainBundle];
    CFTypeID v6 = [v5 localizedStringForKey:@"Unable to reset device" value:&stru_26DBD82D0 table:0];
    v14[0] = v6;
    v13[1] = *MEMORY[0x263F08338];
    v7 = [MEMORY[0x263F086E0] mainBundle];
    v8 = [v7 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v14[1] = v8;
    v13[2] = *MEMORY[0x263F08348];
    v9 = [MEMORY[0x263F086E0] mainBundle];
    v10 = [v9 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v14[2] = v10;
    v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];

    *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:v4 userInfo:v11];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[IOUSBHostDevice resetWithError:]();
    }
  }
  return v4 == 0;
}

- (BOOL)allocateDownstreamBusCurrentWithWakeUnits:(unint64_t *)a3 sleepUnits:(unint64_t *)a4 error:(id *)a5
{
  kern_return_t v10;
  unint64_t v11;
  kern_return_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint32_t outputCnt;
  uint64_t output;
  unint64_t v23;
  void v24[3];
  void v25[4];

  BOOL v5 = 0;
  v25[3] = *MEMORY[0x263EF8340];
  if (a3)
  {
    if (a4)
    {
      outputCnt = 2;
      unint64_t v9 = *a4;
      output = *a3;
      v23 = v9;
      v10 = IOConnectCallScalarMethod([(IOUSBHostObject *)self ioConnection], 0xBu, 0, 0, &output, &outputCnt);
      v11 = v23;
      *a3 = output;
      *a4 = v11;
      BOOL v5 = v10 == 0;
      if (v10)
      {
        if (a5)
        {
          v12 = v10;
          v24[0] = *MEMORY[0x263F08320];
          v13 = [MEMORY[0x263F086E0] mainBundle];
          v14 = [v13 localizedStringForKey:@"Unable to allocate bus current" value:&stru_26DBD82D0 table:0];
          v25[0] = v14;
          v24[1] = *MEMORY[0x263F08338];
          v15 = [MEMORY[0x263F086E0] mainBundle];
          v16 = [v15 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
          v25[1] = v16;
          v24[2] = *MEMORY[0x263F08348];
          v17 = [MEMORY[0x263F086E0] mainBundle];
          v18 = [v17 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
          v25[2] = v18;
          v19 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];

          *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:v12 userInfo:v19];
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[IOUSBHostDevice allocateDownstreamBusCurrentWithWakeUnits:sleepUnits:error:]();
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)lastKnownConfiguration
{
  return self->_lastKnownConfiguration;
}

- (void)setLastKnownConfiguration:(unint64_t)a3
{
  self->_lastKnownConfiguration = a3;
}

- (void)configureWithValue:matchInterfaces:error:.cold.1()
{
  [@"Unable to set configuration." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)resetWithError:.cold.1()
{
  [@"Unable to reset device" cStringUsingEncoding:4];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)allocateDownstreamBusCurrentWithWakeUnits:sleepUnits:error:.cold.1()
{
  [@"Unable to allocate bus current" cStringUsingEncoding:4];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

@end