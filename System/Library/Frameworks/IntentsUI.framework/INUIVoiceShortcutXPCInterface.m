@interface INUIVoiceShortcutXPCInterface
+ (id)remoteViewControllerHostingInterface;
+ (id)remoteViewControllerServingInterface;
@end

@implementation INUIVoiceShortcutXPCInterface

+ (id)remoteViewControllerServingInterface
{
  v11[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26BE77838];
  v3 = (void *)MEMORY[0x263EFFA08];
  v11[0] = objc_opt_class();
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_buildForAddingShortcut_ argumentIndex:0 ofReply:0];

  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];
  v8 = [v6 setWithArray:v7];
  [v2 setClasses:v8 forSelector:sel_buildForEditingVoiceShortcut_ argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)remoteViewControllerHostingInterface
{
  v11[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26BE5D280];
  v3 = (void *)MEMORY[0x263EFFA08];
  v11[0] = objc_opt_class();
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_remoteViewControllerDidCreateVoiceShortcut_error_ argumentIndex:0 ofReply:0];

  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];
  v8 = [v6 setWithArray:v7];
  [v2 setClasses:v8 forSelector:sel_remoteViewControllerDidUpdateVoiceShortcut_error_ argumentIndex:0 ofReply:0];

  return v2;
}

@end