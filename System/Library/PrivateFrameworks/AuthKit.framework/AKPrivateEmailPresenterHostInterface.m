@interface AKPrivateEmailPresenterHostInterface
+ (id)XPCInterface;
@end

@implementation AKPrivateEmailPresenterHostInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken_7 != -1) {
    dispatch_once(&XPCInterface_onceToken_7, &__block_literal_global_26);
  }
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  [(id)XPCInterface_interface_6 setClasses:v10 forSelector:sel_privateEmailFetchCompletedWith_error_completion_ argumentIndex:0 ofReply:0];
  id v11 = (id)XPCInterface_interface_6;

  return v11;
}

uint64_t __52__AKPrivateEmailPresenterHostInterface_XPCInterface__block_invoke()
{
  XPCInterface_interface_6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE4621D0];

  return MEMORY[0x1F41817F8]();
}

@end