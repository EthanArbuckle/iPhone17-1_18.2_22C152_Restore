@interface NSArray(MPMediaQueryAdditions)
- (BOOL)MPIsEmpty;
@end

@implementation NSArray(MPMediaQueryAdditions)

- (BOOL)MPIsEmpty
{
  return [a1 count] == 0;
}

@end