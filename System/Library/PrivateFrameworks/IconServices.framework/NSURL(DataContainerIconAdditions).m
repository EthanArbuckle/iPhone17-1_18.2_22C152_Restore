@interface NSURL(DataContainerIconAdditions)
- (uint64_t)_IS_dataContainerIconDecoration;
- (uint64_t)_IS_dataContainerIconResource;
- (uint64_t)_IS_isDataContainer;
@end

@implementation NSURL(DataContainerIconAdditions)

- (uint64_t)_IS_dataContainerIconDecoration
{
  return 0;
}

- (uint64_t)_IS_isDataContainer
{
  return 0;
}

- (uint64_t)_IS_dataContainerIconResource
{
  return 0;
}

@end