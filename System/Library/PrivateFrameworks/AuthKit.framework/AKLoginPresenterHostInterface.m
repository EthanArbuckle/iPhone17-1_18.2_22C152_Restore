@interface AKLoginPresenterHostInterface
+ (id)XPCInterface;
@end

@implementation AKLoginPresenterHostInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken_6 != -1) {
    dispatch_once(&XPCInterface_onceToken_6, &__block_literal_global_24);
  }
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  [(id)XPCInterface_interface_5 setClasses:v9 forSelector:sel_authenticationRequestFinishedWithResults_password_additionalData_error_ argumentIndex:0 ofReply:0];
  id v10 = (id)XPCInterface_interface_5;

  return v10;
}

uint64_t __45__AKLoginPresenterHostInterface_XPCInterface__block_invoke()
{
  XPCInterface_interface_5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE44FCD0];

  return MEMORY[0x1F41817F8]();
}

@end