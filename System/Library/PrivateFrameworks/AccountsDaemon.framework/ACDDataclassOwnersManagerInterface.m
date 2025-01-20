@interface ACDDataclassOwnersManagerInterface
+ (NSXPCInterface)XPCInterface;
@end

@implementation ACDDataclassOwnersManagerInterface

+ (NSXPCInterface)XPCInterface
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C9A8F20];
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_actionsForAddingAccount_affectingDataclass_completion_ argumentIndex:0 ofReply:1];

  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_actionsForDeletingAccount_affectingDataclass_completion_ argumentIndex:0 ofReply:1];

  v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  [v2 setClasses:v11 forSelector:sel_actionsForEnablingDataclass_onAccount_completion_ argumentIndex:0 ofReply:1];

  v12 = (void *)MEMORY[0x263EFFA08];
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  [v2 setClasses:v14 forSelector:sel_actionsForDisablingDataclass_onAccount_completion_ argumentIndex:0 ofReply:1];

  v15 = (void *)MEMORY[0x263EFFA08];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
  [v2 setClasses:v18 forSelector:sel_performDataclassActions_forAccount_withChildren_completion_ argumentIndex:0 ofReply:0];

  v19 = (void *)MEMORY[0x263EFFA08];
  uint64_t v20 = objc_opt_class();
  v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  [v2 setClasses:v21 forSelector:sel_performDataclassActions_forAccount_withChildren_completion_ argumentIndex:2 ofReply:0];

  return (NSXPCInterface *)v2;
}

@end