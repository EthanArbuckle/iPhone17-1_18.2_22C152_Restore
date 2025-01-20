@interface NSString(_HKObjectComparisonFilter)
- (uint64_t)hk_hasDevicePropertyKeyPathPrefix;
- (uint64_t)hk_hasMetadataKeyPathPrefix;
@end

@implementation NSString(_HKObjectComparisonFilter)

- (uint64_t)hk_hasDevicePropertyKeyPathPrefix
{
  return [a1 hasPrefix:@"device."];
}

- (uint64_t)hk_hasMetadataKeyPathPrefix
{
  return [a1 hasPrefix:@"metadata."];
}

@end