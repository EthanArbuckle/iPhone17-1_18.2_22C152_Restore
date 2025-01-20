@interface NSString(CSCoderAdditions)
- (uint64_t)encodeWithCSCoder:()CSCoderAdditions;
@end

@implementation NSString(CSCoderAdditions)

- (uint64_t)encodeWithCSCoder:()CSCoderAdditions
{
  [a3 container];

  return _MDPlistContainerAddObject();
}

@end