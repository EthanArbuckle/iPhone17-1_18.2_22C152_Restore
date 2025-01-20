@interface NSMutableString(DDCategories)
- (uint64_t)dd_appendSpaces:()DDCategories;
@end

@implementation NSMutableString(DDCategories)

- (uint64_t)dd_appendSpaces:()DDCategories
{
  if (a3)
  {
    int v3 = a3;
    v4 = (void *)result;
    do
    {
      result = [v4 appendString:@" "];
      --v3;
    }
    while (v3);
  }
  return result;
}

@end