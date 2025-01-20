@interface NSString(GCOAuthAdditions)
- (__CFString)pcen;
@end

@implementation NSString(GCOAuthAdditions)

- (__CFString)pcen
{
  v1 = (__CFString *)CFURLCreateStringByAddingPercentEscapes(0, originalString, 0, @"!*'();:@&=+$,/?%#[]",
                       0x8000100u);
  return v1;
}

@end