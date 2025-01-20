@interface RunningInXCTest
@end

@implementation RunningInXCTest

void ___RunningInXCTest_block_invoke()
{
  id v1 = [MEMORY[0x263F08AB0] processInfo];
  v0 = [v1 processName];
  _RunningInXCTest___value = [v0 isEqualToString:@"xctest"];
}

@end