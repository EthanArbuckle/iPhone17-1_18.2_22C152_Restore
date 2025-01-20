@interface AKAppleIDAuthenticationClientInterface
+ (id)XPCInterface;
@end

@implementation AKAppleIDAuthenticationClientInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken_3 != -1) {
    dispatch_once(&XPCInterface_onceToken_3, &__block_literal_global_14);
  }
  v2 = (void *)XPCInterface_interface_3;

  return v2;
}

void __54__AKAppleIDAuthenticationClientInterface_XPCInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE443568];
  v1 = (void *)XPCInterface_interface_3;
  XPCInterface_interface_3 = v0;

  v13 = (void *)XPCInterface_interface_3;
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v13 setClasses:v12 forSelector:sel_presentServerProvidedUIForContext_withConfiguration_completion_ argumentIndex:1 ofReply:1];
}

@end