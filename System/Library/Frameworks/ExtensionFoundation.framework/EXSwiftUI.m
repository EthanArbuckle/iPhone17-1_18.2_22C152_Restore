@interface EXSwiftUI
@end

@implementation EXSwiftUI

uint64_t __37__EXSwiftUI_Subsystem_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  v2 = (void *)__instance;
  __instance = (uint64_t)v1;

  __instance = [(id)__instance init];

  return MEMORY[0x1F41817F8]();
}

@end