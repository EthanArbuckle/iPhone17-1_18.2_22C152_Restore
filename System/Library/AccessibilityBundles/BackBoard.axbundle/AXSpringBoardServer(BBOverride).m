@interface AXSpringBoardServer(BBOverride)
- (uint64_t)_shouldValidateEntitlements;
@end

@implementation AXSpringBoardServer(BBOverride)

- (uint64_t)_shouldValidateEntitlements
{
  return 1;
}

@end