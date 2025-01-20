@interface CVCApplicationIsAppleApp
@end

@implementation CVCApplicationIsAppleApp

void ___CVCApplicationIsAppleApp_block_invoke()
{
  id v1 = [MEMORY[0x263F086E0] mainBundle];
  v0 = [v1 bundleIdentifier];
  _MergedGlobals_1 = [v0 hasPrefix:@"com.apple."];
}

@end