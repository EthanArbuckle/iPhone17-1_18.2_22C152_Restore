@interface NSXPCInterface(MTSXPC)
+ (id)mts_serverInterface;
+ (uint64_t)mts_clientInterface;
@end

@implementation NSXPCInterface(MTSXPC)

+ (id)mts_serverInterface
{
  v9[2] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F9D87B8];
  v1 = (void *)MEMORY[0x263EFFA08];
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  v3 = [v1 setWithArray:v2];
  [v0 setClasses:v3 forSelector:sel_fetchSystemCommissionerPairingsWithCompletionHandler_ argumentIndex:0 ofReply:1];

  v4 = (void *)MEMORY[0x263EFFA08];
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  v6 = [v4 setWithArray:v5];
  [v0 setClasses:v6 forSelector:sel_fetchDevicePairingsForSystemCommissionerPairingUUID_completionHandler_ argumentIndex:0 ofReply:1];

  return v0;
}

+ (uint64_t)mts_clientInterface
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F9DC128];
}

@end