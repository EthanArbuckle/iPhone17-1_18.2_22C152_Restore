@interface MDMRequestShutDownDeviceCommand
+ (id)request;
+ (id)requestType;
+ (unint64_t)requiredAccessRights;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)processRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation MDMRequestShutDownDeviceCommand

+ (id)requestType
{
  return @"ShutDownDevice";
}

+ (unint64_t)requiredAccessRights
{
  return 4;
}

+ (id)request
{
  v2 = objc_opt_new();
  return v2;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  return 1;
}

- (id)serializeWithType:(signed __int16)a3
{
  v3 = objc_opt_new();
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MDMRequestShutDownDeviceCommand;
  return [(RMModelPayloadBase *)&v4 copyWithZone:a3];
}

- (void)processRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MDMRequestBase *)self delegate];
  v9 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
  [v8 willTerminateProcess:v9];

  id v10 = objc_alloc_init(MEMORY[0x263F088C0]);
  v11 = [MEMORY[0x263EFF910] date];
  v12 = [v10 stringFromDate:v11];

  v13 = MDMSystemShutDownLogPath();
  [v12 writeToFile:v13 atomically:1 encoding:4 error:0];

  v14 = MDMSystemShutDownLogPath();
  DMCSetSkipBackupAttributeToItemAtPath();

  v15 = (void *)[objc_alloc(MEMORY[0x263F3F800]) initWithReason:@"mdmd shut down device"];
  [v15 setRebootType:0];
  v16 = [MEMORY[0x263F3F808] sharedService];
  [v16 shutdownWithOptions:v15];

  while (1)
    sleep(0xE10u);
}

@end