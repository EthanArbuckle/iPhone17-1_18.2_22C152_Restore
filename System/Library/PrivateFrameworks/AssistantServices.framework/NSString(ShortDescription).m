@interface NSString(ShortDescription)
- (id)ad_shortDescription;
@end

@implementation NSString(ShortDescription)

- (id)ad_shortDescription
{
  if ((unint64_t)[a1 length] < 9)
  {
    id v2 = a1;
  }
  else
  {
    id v2 = [a1 substringToIndex:8];
  }
  return v2;
}

@end