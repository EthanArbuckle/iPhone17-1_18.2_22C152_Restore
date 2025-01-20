@interface FMNSXPCConnectionConfiguration
+ (FMNSXPCConnectionConfiguration)btDiscoveryConfiguration;
+ (FMNSXPCConnectionConfiguration)emergencyCallInfoPublisherConfiguration;
+ (FMNSXPCConnectionConfiguration)eraseDeviceServiceConfiguration;
+ (FMNSXPCConnectionConfiguration)fmipConfiguration;
+ (FMNSXPCConnectionConfiguration)helperConfiguration;
+ (FMNSXPCConnectionConfiguration)identityConfiguration;
+ (FMNSXPCConnectionConfiguration)userNotificationConfiguration;
- (BOOL)machService;
- (NSString)serviceName;
- (NSXPCInterface)exportedInterface;
- (NSXPCInterface)remoteInterface;
- (unint64_t)options;
- (void)setExportedInterface:(id)a3;
- (void)setMachService:(BOOL)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setRemoteInterface:(id)a3;
- (void)setServiceName:(id)a3;
@end

@implementation FMNSXPCConnectionConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_storeStrong((id *)&self->_remoteInterface, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

+ (FMNSXPCConnectionConfiguration)fmipConfiguration
{
  v2 = objc_alloc_init(FMNSXPCConnectionConfiguration);
  [(FMNSXPCConnectionConfiguration *)v2 setServiceName:@"com.apple.icloud.findmydeviced"];
  [(FMNSXPCConnectionConfiguration *)v2 setOptions:4096];
  [(FMNSXPCConnectionConfiguration *)v2 setMachService:1];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, objc_opt_class(), 0);
  v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F270A7D0];
  [v10 setClasses:v9 forSelector:sel_getAccessoriesWithCompletion_ argumentIndex:1 ofReply:1];
  v11 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v10 setClasses:v11 forSelector:sel_registerDeviceForPairingLock_completion_ argumentIndex:0 ofReply:0];

  v12 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v10 setClasses:v12 forSelector:sel_registerDeviceForPairingLock_completion_ argumentIndex:1 ofReply:1];

  v13 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v10 setClasses:v13 forSelector:sel_updatePairingLockInfo_completion_ argumentIndex:0 ofReply:0];

  [(FMNSXPCConnectionConfiguration *)v2 setRemoteInterface:v10];

  return v2;
}

- (void)setServiceName:(id)a3
{
}

- (void)setRemoteInterface:(id)a3
{
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void)setMachService:(BOOL)a3
{
  self->_machService = a3;
}

- (NSXPCInterface)remoteInterface
{
  return self->_remoteInterface;
}

- (unint64_t)options
{
  return self->_options;
}

- (BOOL)machService
{
  return self->_machService;
}

- (NSXPCInterface)exportedInterface
{
  return self->_exportedInterface;
}

+ (FMNSXPCConnectionConfiguration)identityConfiguration
{
  v2 = objc_alloc_init(FMNSXPCConnectionConfiguration);
  [(FMNSXPCConnectionConfiguration *)v2 setServiceName:@"com.apple.icloud.FindMyDevice.FindMyDeviceIdentityXPCService"];
  [(FMNSXPCConnectionConfiguration *)v2 setOptions:0];
  [(FMNSXPCConnectionConfiguration *)v2 setMachService:0];
  v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F270A5F0];
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  [v3 setClasses:v11 forSelector:sel_baaIdentityAttestationForSigningRequest_completion_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v11 forSelector:sel_baaIdentityAttestationForSigningRequest_completion_ argumentIndex:1 ofReply:1];
  [v3 setClasses:v11 forSelector:sel_identityForPasscodeActivationUnlockWithContext_completion_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v11 forSelector:sel_identityForPasscodeActivationUnlockWithContext_completion_ argumentIndex:1 ofReply:1];
  [(FMNSXPCConnectionConfiguration *)v2 setRemoteInterface:v3];

  return v2;
}

+ (FMNSXPCConnectionConfiguration)emergencyCallInfoPublisherConfiguration
{
  v2 = objc_alloc_init(FMNSXPCConnectionConfiguration);
  [(FMNSXPCConnectionConfiguration *)v2 setServiceName:@"com.apple.icloud.FindMyDevice.FindMyDeviceEmergencyCallInfoPublisherXPCService"];
  [(FMNSXPCConnectionConfiguration *)v2 setOptions:0];
  [(FMNSXPCConnectionConfiguration *)v2 setMachService:0];
  v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F270A650];
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, objc_opt_class(), 0);
  [v3 setClasses:v9 forSelector:sel_publishInfo_completion_ argumentIndex:0 ofReply:0];
  [(FMNSXPCConnectionConfiguration *)v2 setRemoteInterface:v3];

  return v2;
}

+ (FMNSXPCConnectionConfiguration)userNotificationConfiguration
{
  v2 = objc_alloc_init(FMNSXPCConnectionConfiguration);
  [(FMNSXPCConnectionConfiguration *)v2 setServiceName:@"com.apple.icloud.FindMyDevice.FindMyDeviceUserNotificationsXPCService"];
  [(FMNSXPCConnectionConfiguration *)v2 setOptions:0];
  [(FMNSXPCConnectionConfiguration *)v2 setMachService:0];
  v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F270A6B0];
  [(FMNSXPCConnectionConfiguration *)v2 setRemoteInterface:v3];

  return v2;
}

+ (FMNSXPCConnectionConfiguration)btDiscoveryConfiguration
{
  v2 = objc_alloc_init(FMNSXPCConnectionConfiguration);
  [(FMNSXPCConnectionConfiguration *)v2 setServiceName:@"com.apple.icloud.FindMyDevice.FindMyDeviceBTDiscoveryXPCService"];
  [(FMNSXPCConnectionConfiguration *)v2 setOptions:0];
  [(FMNSXPCConnectionConfiguration *)v2 setMachService:0];
  v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F270A710];
  [(FMNSXPCConnectionConfiguration *)v2 setRemoteInterface:v3];
  uint64_t v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F270A770];
  [(FMNSXPCConnectionConfiguration *)v2 setExportedInterface:v4];

  return v2;
}

+ (FMNSXPCConnectionConfiguration)helperConfiguration
{
  v2 = objc_alloc_init(FMNSXPCConnectionConfiguration);
  [(FMNSXPCConnectionConfiguration *)v2 setOptions:0];
  [(FMNSXPCConnectionConfiguration *)v2 setMachService:0];
  [(FMNSXPCConnectionConfiguration *)v2 setServiceName:@"com.apple.icloud.FindMyDevice.FindMyDeviceHelperXPCService"];
  v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F270A830];
  [(FMNSXPCConnectionConfiguration *)v2 setRemoteInterface:v3];

  return v2;
}

+ (FMNSXPCConnectionConfiguration)eraseDeviceServiceConfiguration
{
  v2 = objc_alloc_init(FMNSXPCConnectionConfiguration);
  [(FMNSXPCConnectionConfiguration *)v2 setServiceName:@"com.apple.icloud.FindMyDevice.FindMyDeviceEraseXPCService"];
  [(FMNSXPCConnectionConfiguration *)v2 setOptions:0];
  [(FMNSXPCConnectionConfiguration *)v2 setMachService:0];
  v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F270A890];
  [(FMNSXPCConnectionConfiguration *)v2 setRemoteInterface:v3];

  return v2;
}

- (void)setExportedInterface:(id)a3
{
}

@end