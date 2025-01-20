@interface EXSceneSessionManager
@end

@implementation EXSceneSessionManager

uint64_t __40___EXSceneSessionManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_0 = [[_EXSceneSessionManager alloc] _init];

  return MEMORY[0x1F41817F8]();
}

@end