@interface AFUIPasscodeViewFactory
+ (id)lockView;
@end

@implementation AFUIPasscodeViewFactory

+ (id)lockView
{
  return (id)[MEMORY[0x263F79748] passcodeLockViewForUsersCurrentStyle];
}

@end