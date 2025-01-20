@interface AKAuthorizationClientInterface
+ (id)XPCInterface;
@end

@implementation AKAuthorizationClientInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken_14 != -1) {
    dispatch_once(&XPCInterface_onceToken_14, &__block_literal_global_53);
  }
  v2 = (void *)XPCInterface_interface_13;

  return v2;
}

void __46__AKAuthorizationClientInterface_XPCInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE451278];
  v1 = (void *)XPCInterface_interface_13;
  XPCInterface_interface_13 = v0;

  v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v17 = objc_msgSend(v16, "setWithObjects:", v15, v14, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  [(id)XPCInterface_interface_13 setClasses:v17 forSelector:sel_presentAuthorizationUIForContext_completion_ argumentIndex:0 ofReply:0];
  v12 = (void *)XPCInterface_interface_13;
  v13 = [v17 setByAddingObject:objc_opt_class()];
  [v12 setClasses:v13 forSelector:sel_presentAuthorizationUIForContext_completion_ argumentIndex:0 ofReply:1];
}

@end