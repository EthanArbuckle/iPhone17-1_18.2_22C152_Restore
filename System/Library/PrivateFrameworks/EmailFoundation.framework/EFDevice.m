@interface EFDevice
+ (EFDevice)currentDevice;
+ (OS_os_log)log;
+ (id)testingDeviceWithInternal:(BOOL)a3;
+ (void)executeWithDeviceIsExternal:(id)a3;
+ (void)executeWithDeviceIsInternal:(id)a3;
+ (void)setCurrentDevice:(id)a3;
- (BOOL)isAppleSilicon;
- (BOOL)isInternal;
- (BOOL)isPhone;
- (BOOL)isPlatform:(int64_t)a3;
- (BOOL)isRunningNative;
- (BOOL)isVirtualMachine;
- (BOOL)supportsGenerativeModelSystems;
- (NSString)platformName;
- (NSUUID)identifier;
- (id)_init;
- (void)setIdentifier:(id)a3;
- (void)setIsInternal:(BOOL)a3;
@end

@implementation EFDevice

+ (EFDevice)currentDevice
{
  if (currentDeviceOnceToken != -1) {
    dispatch_once(&currentDeviceOnceToken, &__block_literal_global_4);
  }
  v2 = (void *)sCurrentDevice;
  return (EFDevice *)v2;
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (NSUUID)identifier
{
  identifier = self->_identifier;
  if (!identifier)
  {
    v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    v5 = [v4 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.mail"];

    if (v5)
    {
      v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"group.com.apple.mail"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    }
    v7 = v6;
    v8 = [v6 stringForKey:@"DeviceIdentifier"];
    if (v8)
    {
      v9 = (NSUUID *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v8];
      v10 = self->_identifier;
      self->_identifier = v9;
    }
    if (!self->_identifier)
    {
      v11 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
      v12 = self->_identifier;
      self->_identifier = v11;

      v13 = [(NSUUID *)self->_identifier UUIDString];
      [v7 setObject:v13 forKey:@"DeviceIdentifier"];
    }
    identifier = self->_identifier;
  }
  return identifier;
}

- (BOOL)isPhone
{
  if (isPhone_onceToken != -1) {
    dispatch_once(&isPhone_onceToken, &__block_literal_global_25);
  }
  return isPhone_isPhone;
}

void __25__EFDevice_currentDevice__block_invoke()
{
  id v0 = [[EFDevice alloc] _init];
  v1 = (void *)sCurrentDevice;
  sCurrentDevice = (uint64_t)v0;
}

- (id)_init
{
  v4.receiver = self;
  v4.super_class = (Class)EFDevice;
  v2 = [(EFDevice *)&v4 init];
  if (v2) {
    [(EFDevice *)v2 setIsInternal:os_variant_has_internal_diagnostics()];
  }
  return v2;
}

- (void)setIsInternal:(BOOL)a3
{
  self->_isInternal = a3;
}

uint64_t __42__EFDevice_supportsGenerativeModelSystems__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  supportsGenerativeModelSystems_supportsGenerativeModelSystems = result;
  return result;
}

- (BOOL)supportsGenerativeModelSystems
{
  if (supportsGenerativeModelSystems_onceToken != -1) {
    dispatch_once(&supportsGenerativeModelSystems_onceToken, &__block_literal_global_20);
  }
  return supportsGenerativeModelSystems_supportsGenerativeModelSystems;
}

void __19__EFDevice_isPhone__block_invoke()
{
  id v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    if (CFEqual(v0, @"iPhone")) {
      isPhone_isPhone = 1;
    }
    CFRelease(v1);
  }
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __15__EFDevice_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_1 != -1) {
    dispatch_once(&log_onceToken_1, block);
  }
  v2 = (void *)log_log_1;
  return (OS_os_log *)v2;
}

void __15__EFDevice_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_1;
  log_log_1 = (uint64_t)v1;
}

+ (void)setCurrentDevice:(id)a3
{
  id v4 = a3;
  if (currentDeviceOnceToken == -1)
  {
    if (v4)
    {
LABEL_3:
      id v5 = v4;
      objc_storeStrong((id *)&sCurrentDevice, a3);
      id v4 = v5;
      goto LABEL_6;
    }
  }
  else
  {
    id v6 = v4;
    dispatch_once(&currentDeviceOnceToken, &__block_literal_global_5);
    id v4 = v6;
    if (v6) {
      goto LABEL_3;
    }
  }
  currentDeviceOnceToken = 0;
LABEL_6:
}

+ (id)testingDeviceWithInternal:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [[EFDevice alloc] _init];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
  [v4 setIdentifier:v5];

  [v4 setIsInternal:v3];
  return v4;
}

- (NSString)platformName
{
  return (NSString *)@"iOS";
}

- (BOOL)isPlatform:(int64_t)a3
{
  return a3 & 1;
}

- (BOOL)isAppleSilicon
{
  return 0;
}

- (BOOL)isRunningNative
{
  int v5 = 0;
  size_t v4 = 4;
  if (sysctlbyname("sysctl.proc_native", &v5, &v4, 0, 0) == -1) {
    return *__error() == 2;
  }
  else {
    return v5 == 1;
  }
}

- (BOOL)isVirtualMachine
{
  if (isVirtualMachine_onceToken != -1) {
    dispatch_once(&isVirtualMachine_onceToken, &__block_literal_global_33);
  }
  return isVirtualMachine_result;
}

uint64_t __28__EFDevice_isVirtualMachine__block_invoke()
{
  int v2 = 0;
  size_t v1 = 4;
  uint64_t result = sysctlbyname("kern.hv_vmm_present", &v2, &v1, 0, 0);
  if (!result) {
    isVirtualMachine_uint64_t result = v2 != 0;
  }
  return result;
}

+ (void)executeWithDeviceIsInternal:(id)a3
{
}

+ (void)executeWithDeviceIsExternal:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end