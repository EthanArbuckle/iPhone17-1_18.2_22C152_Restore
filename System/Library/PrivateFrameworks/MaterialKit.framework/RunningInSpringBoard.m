@interface RunningInSpringBoard
@end

@implementation RunningInSpringBoard

void ___RunningInSpringBoard_block_invoke()
{
  id v1 = [MEMORY[0x263F086E0] mainBundle];
  v0 = [v1 bundleIdentifier];
  _RunningInSpringBoard___result = [v0 isEqualToString:@"com.apple.springboard"];
}

@end