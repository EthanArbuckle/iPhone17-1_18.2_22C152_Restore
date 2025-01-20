@interface NSMutableSet(NSMutableSet)
- (uint64_t)classForCoder;
@end

@implementation NSMutableSet(NSMutableSet)

- (uint64_t)classForCoder
{
  return self;
}

@end