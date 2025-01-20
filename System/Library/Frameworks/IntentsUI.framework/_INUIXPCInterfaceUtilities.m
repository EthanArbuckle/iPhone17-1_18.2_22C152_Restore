@interface _INUIXPCInterfaceUtilities
+ (id)extensionContextHostingInterface;
+ (id)extensionContextVendingInterface;
@end

@implementation _INUIXPCInterfaceUtilities

+ (id)extensionContextVendingInterface
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26BE62D00];
  v3 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v2 setClasses:v3 forSelector:sel_setExtensionContextState_completion_ argumentIndex:0 ofReply:0];

  v4 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  [v2 setClasses:v7 forSelector:sel_configureForParameters_ofInteraction_interactiveBehavior_context_completion_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v4 forSelector:sel_configureForParameters_ofInteraction_interactiveBehavior_context_completion_ argumentIndex:1 ofReply:0];
  [v2 setClasses:v7 forSelector:sel_configureForParameters_ofInteraction_interactiveBehavior_context_completion_ argumentIndex:1 ofReply:1];

  return v2;
}

+ (id)extensionContextHostingInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26BE62948];
}

@end