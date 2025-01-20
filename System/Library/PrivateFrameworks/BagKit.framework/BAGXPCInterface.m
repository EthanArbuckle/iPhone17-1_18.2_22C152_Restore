@interface BAGXPCInterface
+ (id)interface;
@end

@implementation BAGXPCInterface

+ (id)interface
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D636178];
  v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D6349C0];
  [v2 setInterface:v3 forSelector:sel_setupBagKitClient_withUUID_forOptions_ argumentIndex:0 ofReply:0];
  v4 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v4 forSelector:sel_setupBagKitClient_withUUID_forOptions_ argumentIndex:1 ofReply:0];

  v5 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_setupBagKitClient_withUUID_forOptions_ argumentIndex:2 ofReply:0];

  v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v6 forSelector:sel_cancelBagKitClientWithUUID_forOptions_ argumentIndex:0 ofReply:0];

  v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v7 forSelector:sel_cancelBagKitClientWithUUID_forOptions_ argumentIndex:1 ofReply:0];

  v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  [v3 setClasses:v10 forSelector:sel_resourceUpdated_forOptions_withContext_ argumentIndex:0 ofReply:0];

  v11 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v3 setClasses:v11 forSelector:sel_resourceUpdated_forOptions_withContext_ argumentIndex:1 ofReply:0];

  v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v3 setClasses:v12 forSelector:sel_resourceUpdated_forOptions_withContext_ argumentIndex:2 ofReply:0];

  return v2;
}

@end