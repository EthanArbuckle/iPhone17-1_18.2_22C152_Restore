@interface NSNumber
- (int64_t)rc_persistentIDValue;
@end

@implementation NSNumber

- (int64_t)rc_persistentIDValue
{
  return [(NSNumber *)self longLongValue];
}

@end