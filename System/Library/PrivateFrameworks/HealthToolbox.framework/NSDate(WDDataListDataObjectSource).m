@interface NSDate(WDDataListDataObjectSource)
- (uint64_t)device;
- (uint64_t)sourceRevision;
@end

@implementation NSDate(WDDataListDataObjectSource)

- (uint64_t)sourceRevision
{
  return 0;
}

- (uint64_t)device
{
  return 0;
}

@end