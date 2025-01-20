@interface AUAudioUnitServiceUI_Subsystem
+ (id)initForPlugInKit;
@end

@implementation AUAudioUnitServiceUI_Subsystem

+ (id)initForPlugInKit
{
  [MEMORY[0x1E4F292B0] _startListening];
  v2 = objc_opt_new();
  return v2;
}

@end