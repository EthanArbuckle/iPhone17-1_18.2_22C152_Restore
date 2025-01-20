@interface ASCViewServiceInterface
+ (id)xpcInterface;
@end

@implementation ASCViewServiceInterface

+ (id)xpcInterface
{
  if (xpcInterface_onceToken_1 != -1) {
    dispatch_once(&xpcInterface_onceToken_1, &__block_literal_global_10);
  }
  v2 = (void *)xpcInterface_interface_1;

  return v2;
}

void __39__ASCViewServiceInterface_xpcInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CAD14E8];
  v1 = (void *)xpcInterface_interface_1;
  xpcInterface_interface_1 = v0;

  v2 = ASAllLoginChoiceClasses();
  id v3 = [v2 setByAddingObject:objc_opt_class()];

  [(id)xpcInterface_interface_1 setClasses:v3 forSelector:sel_updateInterfaceWithLoginChoices_ argumentIndex:0 ofReply:0];
}

@end