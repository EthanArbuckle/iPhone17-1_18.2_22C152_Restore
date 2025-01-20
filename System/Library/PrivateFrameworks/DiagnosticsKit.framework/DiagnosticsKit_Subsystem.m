@interface DiagnosticsKit_Subsystem
+ (id)initForPlugInKit;
@end

@implementation DiagnosticsKit_Subsystem

+ (id)initForPlugInKit
{
  [MEMORY[0x263F08DA8] _startListening];
  v2 = objc_opt_new();
  return v2;
}

@end