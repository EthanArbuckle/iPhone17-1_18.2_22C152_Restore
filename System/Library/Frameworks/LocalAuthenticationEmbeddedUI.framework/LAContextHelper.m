@interface LAContextHelper
+ (id)createContext;
@end

@implementation LAContextHelper

+ (id)createContext
{
  id v2 = objc_alloc_init(MEMORY[0x263F10468]);

  return v2;
}

@end