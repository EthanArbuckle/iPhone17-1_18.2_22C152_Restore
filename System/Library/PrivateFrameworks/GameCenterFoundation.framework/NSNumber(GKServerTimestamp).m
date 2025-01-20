@interface NSNumber(GKServerTimestamp)
+ (uint64_t)_gkServerTimeInterval:()GKServerTimestamp;
@end

@implementation NSNumber(GKServerTimestamp)

+ (uint64_t)_gkServerTimeInterval:()GKServerTimestamp
{
  return [NSNumber numberWithLongLong:(uint64_t)(a1 * 1000.0)];
}

@end