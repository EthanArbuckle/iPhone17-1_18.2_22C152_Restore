@interface NEProvider_Subsystem
+ (id)initForPlugInKit;
@end

@implementation NEProvider_Subsystem

+ (id)initForPlugInKit
{
  [MEMORY[0x1E4F292B0] _startListening];
  v2 = objc_alloc_init(NEProvider_Subsystem);

  return v2;
}

@end