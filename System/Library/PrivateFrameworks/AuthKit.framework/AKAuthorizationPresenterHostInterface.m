@interface AKAuthorizationPresenterHostInterface
+ (id)XPCInterface;
@end

@implementation AKAuthorizationPresenterHostInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken_2 != -1) {
    dispatch_once(&XPCInterface_onceToken_2, &__block_literal_global_10);
  }
  v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v18 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
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
  v12 = objc_msgSend(v19, "setWithObjects:", v18, v17, v16, v15, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  [(id)XPCInterface_interface_2 setClasses:v12 forSelector:sel_authorizationRequestInitiatedWithUserProvidedInformation_completion_ argumentIndex:0 ofReply:0];
  id v13 = (id)XPCInterface_interface_2;

  return v13;
}

uint64_t __53__AKAuthorizationPresenterHostInterface_XPCInterface__block_invoke()
{
  XPCInterface_interface_2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE4620B0];

  return MEMORY[0x1F41817F8]();
}

@end