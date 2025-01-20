@interface AKPrivateEmailDaemonInterface
+ (id)XPCInterface;
@end

@implementation AKPrivateEmailDaemonInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken_8 != -1) {
    dispatch_once(&XPCInterface_onceToken_8, &__block_literal_global_27);
  }
  v2 = (void *)XPCInterface_interface_7;

  return v2;
}

void __45__AKPrivateEmailDaemonInterface_XPCInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE44A9A0];
  v1 = (void *)XPCInterface_interface_7;
  XPCInterface_interface_7 = v0;

  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(id)XPCInterface_interface_7 setClasses:v4 forSelector:sel_registerPrivateEmailWithContext_completion_ argumentIndex:0 ofReply:0];
  [(id)XPCInterface_interface_7 setClasses:v4 forSelector:sel_fetchSignInWithApplePrivateEmailWithContext_completion_ argumentIndex:0 ofReply:0];
}

@end