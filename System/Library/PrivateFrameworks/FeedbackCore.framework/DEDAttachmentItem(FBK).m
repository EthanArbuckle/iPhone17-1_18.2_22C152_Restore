@interface DEDAttachmentItem(FBK)
- (uint64_t)pointsToReachableDir;
@end

@implementation DEDAttachmentItem(FBK)

- (uint64_t)pointsToReachableDir
{
  v2 = [a1 attachedPath];
  id v7 = 0;
  int v3 = [v2 getResourceValue:&v7 forKey:*MEMORY[0x263EFF6A8] error:0];
  id v4 = v7;

  if (v3 && [v4 BOOLValue]) {
    uint64_t v5 = [a1 isLocal];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

@end