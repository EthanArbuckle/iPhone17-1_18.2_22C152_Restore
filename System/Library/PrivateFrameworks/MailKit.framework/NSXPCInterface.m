@interface NSXPCInterface
@end

@implementation NSXPCInterface

void __56__NSXPCInterface_Extension__MERemoteExtensiontInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C726EE0];
  v1 = (void *)MERemoteExtensiontInterface_remoteInterface;
  MERemoteExtensiontInterface_remoteInterface = v0;

  v2 = (void *)MERemoteExtensiontInterface_remoteInterface;
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:");
}

void __59__NSXPCInterface_Extension__MEExtensionRemoteHostInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C71C110];
  v1 = (void *)MEExtensionRemoteHostInterface_interface;
  MEExtensionRemoteHostInterface_interface = v0;
}

@end