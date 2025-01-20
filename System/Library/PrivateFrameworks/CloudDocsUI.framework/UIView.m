@interface UIView
@end

@implementation UIView

uint64_t __37__UIView_BRGeometry__br_behaviourMap__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = br_behaviourMap_behaviourMap;
  br_behaviourMap_behaviourMap = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

@end