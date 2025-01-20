@interface ASCAgentInterface
+ (id)xpcInterface;
@end

@implementation ASCAgentInterface

+ (id)xpcInterface
{
  if (xpcInterface_onceToken != -1) {
    dispatch_once(&xpcInterface_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)xpcInterface_interface;

  return v2;
}

void __33__ASCAgentInterface_xpcInterface__block_invoke()
{
  v18[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CAC4D58];
  v1 = (void *)xpcInterface_interface;
  xpcInterface_interface = v0;

  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, objc_opt_class(), 0);
  [(id)xpcInterface_interface setClasses:v8 forSelector:sel_performAuthorizationRequestsForContext_withCompletionHandler_ argumentIndex:0 ofReply:1];
  v9 = (void *)xpcInterface_interface;
  v10 = (void *)MEMORY[0x263EFFA08];
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  v12 = [v10 setWithArray:v11];
  [v9 setClasses:v12 forSelector:sel_browserPasskeysForRelyingParty_completionHandler_ argumentIndex:0 ofReply:1];

  v13 = (void *)xpcInterface_interface;
  v14 = (void *)MEMORY[0x263EFFA08];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  v16 = [v14 setWithArray:v15];
  [v13 setClasses:v16 forSelector:sel_performSilentAuthorizationRequestsForContext_withCompletionHandler_ argumentIndex:0 ofReply:1];
}

@end