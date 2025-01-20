@interface NSManagedObject(TrackingAPI)
+ (uint64_t)isTracked;
@end

@implementation NSManagedObject(TrackingAPI)

+ (uint64_t)isTracked
{
  return [a1 instancesRespondToSelector:sel_dateOfLastChange];
}

@end