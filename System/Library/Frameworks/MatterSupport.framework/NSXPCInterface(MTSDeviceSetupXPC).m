@interface NSXPCInterface(MTSDeviceSetupXPC)
+ (id)mts_deviceSetupExtensionInterface;
@end

@implementation NSXPCInterface(MTSDeviceSetupXPC)

+ (id)mts_deviceSetupExtensionInterface
{
  v13[2] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F9D76D8];
  v1 = (void *)MEMORY[0x263EFFA08];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  v3 = [v1 setWithArray:v2];
  [v0 setClasses:v3 forSelector:sel_fetchRoomsInHome_completionHandler_ argumentIndex:0 ofReply:1];

  v4 = (void *)MEMORY[0x263EFFA08];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  v6 = [v4 setWithArray:v5];
  [v0 setClasses:v6 forSelector:sel_selectWiFiNetworkFromScanResults_completionHandler_ argumentIndex:0 ofReply:0];

  v7 = (void *)MEMORY[0x263EFFA08];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  v9 = [v7 setWithArray:v8];
  [v0 setClasses:v9 forSelector:sel_selectThreadNetworkFromScanResults_completionHandler_ argumentIndex:0 ofReply:0];

  return v0;
}

@end