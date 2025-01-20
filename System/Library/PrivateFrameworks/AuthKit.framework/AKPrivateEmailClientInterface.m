@interface AKPrivateEmailClientInterface
+ (id)XPCInterface;
@end

@implementation AKPrivateEmailClientInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken_13 != -1) {
    dispatch_once(&XPCInterface_onceToken_13, &__block_literal_global_51);
  }
  v2 = (void *)XPCInterface_interface_12;

  return v2;
}

void __45__AKPrivateEmailClientInterface_XPCInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE458520];
  v1 = (void *)XPCInterface_interface_12;
  XPCInterface_interface_12 = v0;

  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [(id)XPCInterface_interface_12 setClasses:v12 forSelector:sel_presentPrivateEmailUIForContext_completion_ argumentIndex:0 ofReply:0];
  v10 = (void *)XPCInterface_interface_12;
  v11 = [v12 setByAddingObject:objc_opt_class()];
  [v10 setClasses:v11 forSelector:sel_presentPrivateEmailUIForContext_completion_ argumentIndex:0 ofReply:1];
}

@end