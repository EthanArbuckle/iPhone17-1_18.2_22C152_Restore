@interface IDSService
@end

@implementation IDSService

BOOL __40__IDSService_HMUAdditions__hmu_homePods__block_invoke(uint64_t a1, void *a2)
{
  return [a2 deviceType] == 7;
}

BOOL __40__IDSService_HMUAdditions__hmu_appleTVs__block_invoke(uint64_t a1, void *a2)
{
  return [a2 deviceType] == 5;
}

BOOL __43__IDSService_HMUAdditions__hmu_accessories__block_invoke(uint64_t a1, void *a2)
{
  return (([a2 deviceType] - 5) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

@end