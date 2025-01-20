@interface HUIsRunningInSpringBoard
@end

@implementation HUIsRunningInSpringBoard

void ___HUIsRunningInSpringBoard_block_invoke()
{
  id v0 = [MEMORY[0x1E4F69138] sharedInstance];
  _MergedGlobals_621 = [v0 hostProcess] == 100;
}

@end