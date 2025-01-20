@interface NSValue(CGSize)
- (double)CGSizeValue;
@end

@implementation NSValue(CGSize)

- (double)CGSizeValue
{
  v3[0] = 0;
  v3[1] = 0;
  NSUInteger sizep = 0;
  id v1 = a1;
  NSGetSizeAndAlignment((const char *)[v1 objCType], &sizep, 0);
  [v1 getValue:v3 size:16];

  return *(double *)v3;
}

@end