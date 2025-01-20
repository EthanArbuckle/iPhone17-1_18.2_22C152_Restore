@interface DEDHomeKitManager
+ (id)sharedInstance;
- (BOOL)isHomeKitResident;
- (HMHomeManager)homeKitManager;
- (NSString)homeKitIdentifier;
- (NSString)homeTheaterSystemIdentifier;
- (NSString)homeTheaterSystemName;
- (id)stringForAirPlayPreference:(id)a3;
- (void)setHomeKitManager:(id)a3;
- (void)start;
@end

@implementation DEDHomeKitManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__DEDHomeKitManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __35__DEDHomeKitManager_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (void)start
{
  v3 = [(DEDHomeKitManager *)self homeKitManager];

  if (!v3)
  {
    self->_homeKitManager = (HMHomeManager *)[objc_alloc(MEMORY[0x263F0E3C0]) initWithOptions:16];
    MEMORY[0x270F9A758]();
  }
}

- (NSString)homeKitIdentifier
{
  v2 = [(DEDHomeKitManager *)self homeKitManager];
  v3 = [v2 currentAccessory];
  v4 = [v3 uniqueIdentifier];
  v5 = [v4 UUIDString];

  return (NSString *)v5;
}

- (BOOL)isHomeKitResident
{
  v2 = [(DEDHomeKitManager *)self homeKitManager];
  char v3 = [v2 isResidentEnabledForThisDevice];

  return v3;
}

- (NSString)homeTheaterSystemName
{
  return (NSString *)[(DEDHomeKitManager *)self stringForAirPlayPreference:@"groupName"];
}

- (NSString)homeTheaterSystemIdentifier
{
  return (NSString *)[(DEDHomeKitManager *)self stringForAirPlayPreference:@"persistentGroupUUID"];
}

- (id)stringForAirPlayPreference:(id)a3
{
  char v3 = (objc_class *)MEMORY[0x263EFFA40];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithSuiteName:@"com.apple.airplay"];
  v6 = [v5 stringForKey:v4];

  return v6;
}

- (HMHomeManager)homeKitManager
{
  return (HMHomeManager *)objc_getProperty(self, a2, 8, 1);
}

- (void)setHomeKitManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end