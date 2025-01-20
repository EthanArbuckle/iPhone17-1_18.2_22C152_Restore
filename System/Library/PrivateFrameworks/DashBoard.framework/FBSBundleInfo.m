@interface FBSBundleInfo
@end

@implementation FBSBundleInfo

void __44__FBSBundleInfo_CarPlayApp__iconWithFormat___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF8E0]);
  v1 = (void *)iconWithFormat__iconCache;
  iconWithFormat__iconCache = (uint64_t)v0;

  [(id)iconWithFormat__iconCache setName:@"FBBundleInfo+CarPlayApp"];
  id v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 scale];
}

@end