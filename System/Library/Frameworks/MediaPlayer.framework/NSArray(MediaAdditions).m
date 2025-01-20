@interface NSArray(MediaAdditions)
- (uint64_t)isQueryResultSetInvalidated;
@end

@implementation NSArray(MediaAdditions)

- (uint64_t)isQueryResultSetInvalidated
{
  return 1;
}

@end