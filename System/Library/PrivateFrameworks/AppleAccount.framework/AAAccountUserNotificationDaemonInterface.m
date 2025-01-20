@interface AAAccountUserNotificationDaemonInterface
+ (id)XPCInterface;
@end

@implementation AAAccountUserNotificationDaemonInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken_0 != -1) {
    dispatch_once(&XPCInterface_onceToken_0, &__block_literal_global_3);
  }
  v2 = (void *)XPCInterface_interface_0;

  return v2;
}

void __56__AAAccountUserNotificationDaemonInterface_XPCInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF4A1240];
  v1 = (void *)XPCInterface_interface_0;
  XPCInterface_interface_0 = v0;

  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)XPCInterface_interface_0;
  v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v4 setClasses:v5 forSelector:sel_postAccountUserNotificationWith_completion_ argumentIndex:0 ofReply:0];

  [(id)XPCInterface_interface_0 setClasses:v6 forSelector:sel_postAccountUserNotificationWith_completion_ argumentIndex:0 ofReply:1];
}

@end