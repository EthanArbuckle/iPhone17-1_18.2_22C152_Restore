@interface AUHostingServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation AUHostingServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDFBB5D0];
  v6 = [v5 classesForSelector:sel_loadAudioUnitInRemoteHost_config_reply_ argumentIndex:1 ofReply:0];
  v7 = (void *)[v6 mutableCopy];

  [v7 addObject:objc_opt_class()];
  [v5 setClasses:v7 forSelector:sel_loadAudioUnitInRemoteHost_config_reply_ argumentIndex:1 ofReply:0];
  id v8 = ConfigureAUAudioUnitXPCInterface(v5);

  [v4 setExportedInterface:v5];
  v9 = [[AUHostingService alloc] initWithConnection:v4];
  [v4 setExportedObject:v9];

  v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDFB6DE0];
  SetAllowedClassesForAUAudioUnitHostXPCInterface(v10);
  [v4 setRemoteObjectInterface:v10];

  [v4 resume];
  return 1;
}

@end