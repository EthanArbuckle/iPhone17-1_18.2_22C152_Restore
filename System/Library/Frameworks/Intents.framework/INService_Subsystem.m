@interface INService_Subsystem
+ (id)initForPlugInKit;
@end

@implementation INService_Subsystem

+ (id)initForPlugInKit
{
  [MEMORY[0x1E4F292B0] _startListening];
  id v3 = objc_alloc_init((Class)a1);

  return v3;
}

@end