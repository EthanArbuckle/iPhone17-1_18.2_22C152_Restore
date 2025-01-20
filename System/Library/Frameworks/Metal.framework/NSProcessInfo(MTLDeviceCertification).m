@interface NSProcessInfo(MTLDeviceCertification)
- (BOOL)hasPerformanceProfile:()MTLDeviceCertification;
- (uint64_t)isDeviceCertifiedFor:()MTLDeviceCertification;
@end

@implementation NSProcessInfo(MTLDeviceCertification)

- (uint64_t)isDeviceCertifiedFor:()MTLDeviceCertification
{
  if (a3 == 1) {
    return MEMORY[0x1F417CE00](@"iphone-performance-gaming-tier");
  }
  else {
    return 0;
  }
}

- (BOOL)hasPerformanceProfile:()MTLDeviceCertification
{
  if (hasPerformanceProfile__onceToken != -1) {
    dispatch_once(&hasPerformanceProfile__onceToken, &__block_literal_global_2);
  }
  notify_get_state(_semNotifyToken, (uint64_t *)&_semState);
  return _semState == a3;
}

@end