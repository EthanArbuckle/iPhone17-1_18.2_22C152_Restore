@interface HKSample(HKDataMetadataSubsampleSection)
- (__CFString)subSampleSectionTitle;
- (id)fixedAggregateValuesWithDisplayTypeController:()HKDataMetadataSubsampleSection unitController:;
- (uint64_t)subExertionSamplePredicate;
- (uint64_t)subSamplePredicate;
@end

@implementation HKSample(HKDataMetadataSubsampleSection)

- (id)fixedAggregateValuesWithDisplayTypeController:()HKDataMetadataSubsampleSection unitController:
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  return v0;
}

- (uint64_t)subSamplePredicate
{
  return 0;
}

- (uint64_t)subExertionSamplePredicate
{
  return 0;
}

- (__CFString)subSampleSectionTitle
{
  return &stru_1F3B9CF20;
}

@end