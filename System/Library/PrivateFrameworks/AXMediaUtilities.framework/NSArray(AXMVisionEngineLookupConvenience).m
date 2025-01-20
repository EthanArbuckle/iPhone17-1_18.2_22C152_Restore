@interface NSArray(AXMVisionEngineLookupConvenience)
- (id)axm_featureWithHighestConfidence;
- (uint64_t)axm_featuresSortedByConfidence;
@end

@implementation NSArray(AXMVisionEngineLookupConvenience)

- (uint64_t)axm_featuresSortedByConfidence
{
  return [a1 sortedArrayUsingComparator:&__block_literal_global_386];
}

- (id)axm_featureWithHighestConfidence
{
  v1 = objc_msgSend(a1, "axm_featuresSortedByConfidence");
  v2 = [v1 lastObject];

  return v2;
}

@end