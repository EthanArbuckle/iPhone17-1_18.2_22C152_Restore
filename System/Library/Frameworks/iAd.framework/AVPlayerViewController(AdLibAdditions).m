@interface AVPlayerViewController(AdLibAdditions)
- (uint64_t)playPrerollAdWithCompletionHandler:()AdLibAdditions;
@end

@implementation AVPlayerViewController(AdLibAdditions)

- (uint64_t)playPrerollAdWithCompletionHandler:()AdLibAdditions
{
  if (a3) {
    return (*(uint64_t (**)(uint64_t, void))(a3 + 16))(a3, 0);
  }
  return result;
}

@end