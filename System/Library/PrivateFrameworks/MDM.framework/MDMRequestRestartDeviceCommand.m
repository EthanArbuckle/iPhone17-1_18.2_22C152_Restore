@interface MDMRequestRestartDeviceCommand
+ (id)requestType;
+ (id)requestWithRebuildKernelCache:(id)a3 kextPaths:(id)a4 notifyUser:(id)a5;
+ (unint64_t)requiredAccessRights;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)commandKextPaths;
- (NSNumber)commandNotifyUser;
- (NSNumber)commandRebuildKernelCache;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)processRequest:(id)a3 completionHandler:(id)a4;
- (void)setCommandKextPaths:(id)a3;
- (void)setCommandNotifyUser:(id)a3;
- (void)setCommandRebuildKernelCache:(id)a3;
@end

@implementation MDMRequestRestartDeviceCommand

+ (id)requestType
{
  return @"RestartDevice";
}

+ (unint64_t)requiredAccessRights
{
  return 4;
}

+ (id)requestWithRebuildKernelCache:(id)a3 kextPaths:(id)a4 notifyUser:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  v11 = v10;
  v12 = (void *)MEMORY[0x263EFFA80];
  if (v9) {
    id v13 = v9;
  }
  else {
    id v13 = (id)MEMORY[0x263EFFA80];
  }
  [v10 setCommandRebuildKernelCache:v13];

  [v11 setCommandKextPaths:v8];
  if (v7) {
    id v14 = v7;
  }
  else {
    id v14 = v12;
  }
  [v11 setCommandNotifyUser:v14];

  return v11;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  BOOL v8 = 0;
  if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"RebuildKernelCache" forKeyPath:@"commandRebuildKernelCache" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
  {
    BOOL v8 = 0;
    if ([(RMModelPayloadBase *)self loadArrayFromDictionary:v7 usingKey:@"KextPaths" forKeyPath:@"commandKextPaths" validator:&__block_literal_global_5 isRequired:0 defaultValue:0 error:a5])
    {
      BOOL v8 = [(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"NotifyUser" forKeyPath:@"commandNotifyUser" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5];
    }
  }

  return v8;
}

uint64_t __77__MDMRequestRestartDeviceCommand_loadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializeWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  v5 = [(MDMRequestRestartDeviceCommand *)self commandRebuildKernelCache];
  uint64_t v6 = MEMORY[0x263EFFA80];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"RebuildKernelCache" value:v5 isRequired:0 defaultValue:MEMORY[0x263EFFA80]];

  id v7 = [(MDMRequestRestartDeviceCommand *)self commandKextPaths];
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v4 usingKey:@"KextPaths" value:v7 itemSerializer:&__block_literal_global_24 isRequired:0 defaultValue:0];

  BOOL v8 = [(MDMRequestRestartDeviceCommand *)self commandNotifyUser];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"NotifyUser" value:v8 isRequired:0 defaultValue:v6];

  id v9 = (void *)[v4 copy];
  return v9;
}

id __52__MDMRequestRestartDeviceCommand_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MDMRequestRestartDeviceCommand;
  v4 = [(RMModelPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_commandRebuildKernelCache copy];
  uint64_t v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(NSArray *)self->_commandKextPaths copy];
  BOOL v8 = (void *)v4[7];
  v4[7] = v7;

  uint64_t v9 = [(NSNumber *)self->_commandNotifyUser copy];
  v10 = (void *)v4[8];
  v4[8] = v9;

  return v4;
}

- (NSNumber)commandRebuildKernelCache
{
  return self->_commandRebuildKernelCache;
}

- (void)setCommandRebuildKernelCache:(id)a3
{
}

- (NSArray)commandKextPaths
{
  return self->_commandKextPaths;
}

- (void)setCommandKextPaths:(id)a3
{
}

- (NSNumber)commandNotifyUser
{
  return self->_commandNotifyUser;
}

- (void)setCommandNotifyUser:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandNotifyUser, 0);
  objc_storeStrong((id *)&self->_commandKextPaths, 0);
  objc_storeStrong((id *)&self->_commandRebuildKernelCache, 0);
}

- (void)processRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(MDMRequestBase *)self delegate];
  uint64_t v9 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
  [v8 willTerminateProcess:v9];

  id v10 = objc_alloc_init(MEMORY[0x263F088C0]);
  v11 = [MEMORY[0x263EFF910] date];
  objc_super v12 = [v10 stringFromDate:v11];

  id v13 = MDMSystemRestartLogPath();
  [v12 writeToFile:v13 atomically:1 encoding:4 error:0];

  id v14 = MDMSystemRestartLogPath();
  DMCSetSkipBackupAttributeToItemAtPath();

  v15 = (void *)[objc_alloc(MEMORY[0x263F3F800]) initWithReason:@"mdmd restart device"];
  [v15 setRebootType:1];
  v16 = [MEMORY[0x263F3F808] sharedService];
  [v16 shutdownWithOptions:v15];

  while (1)
    sleep(0xE10u);
}

@end