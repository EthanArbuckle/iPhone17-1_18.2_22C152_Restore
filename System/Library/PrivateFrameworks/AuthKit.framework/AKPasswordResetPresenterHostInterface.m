@interface AKPasswordResetPresenterHostInterface
+ (id)XPCInterface;
@end

@implementation AKPasswordResetPresenterHostInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken_0 != -1) {
    dispatch_once(&XPCInterface_onceToken_0, &__block_literal_global_2);
  }
  v2 = (void *)XPCInterface_interface_0;
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  [v2 setClasses:v10 forSelector:sel_passwordResetFinishedWithResult_error_completion_ argumentIndex:0 ofReply:0];

  v11 = (void *)XPCInterface_interface_0;

  return v11;
}

uint64_t __53__AKPasswordResetPresenterHostInterface_XPCInterface__block_invoke()
{
  XPCInterface_interface_0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE461F90];

  return MEMORY[0x1F41817F8]();
}

@end