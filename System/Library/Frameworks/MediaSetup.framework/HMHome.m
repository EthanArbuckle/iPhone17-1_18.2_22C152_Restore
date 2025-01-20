@interface HMHome
@end

@implementation HMHome

uint64_t __45__HMHome_MediaSetup__hasAccessoryTypeHomePod__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isHomePod];
  if (result)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

@end