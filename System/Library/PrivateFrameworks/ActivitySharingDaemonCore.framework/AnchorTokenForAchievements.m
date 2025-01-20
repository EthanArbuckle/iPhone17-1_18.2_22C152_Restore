@interface AnchorTokenForAchievements
@end

@implementation AnchorTokenForAchievements

uint64_t ___AnchorTokenForAchievements_block_invoke(uint64_t a1, void *a2)
{
  return [a2 templateUniqueName];
}

uint64_t ___AnchorTokenForAchievements_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

@end