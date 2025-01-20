@interface HKSample(HKDataMetadataViewController)
- (uint64_t)dataForSharingWithHealthStore:()HKDataMetadataViewController;
- (uint64_t)fetchSubSampleTypesWithHealthStore:()HKDataMetadataViewController completion:;
@end

@implementation HKSample(HKDataMetadataViewController)

- (uint64_t)fetchSubSampleTypesWithHealthStore:()HKDataMetadataViewController completion:
{
  return (*(uint64_t (**)(uint64_t, void, void))(a4 + 16))(a4, 0, 0);
}

- (uint64_t)dataForSharingWithHealthStore:()HKDataMetadataViewController
{
  return 0;
}

@end