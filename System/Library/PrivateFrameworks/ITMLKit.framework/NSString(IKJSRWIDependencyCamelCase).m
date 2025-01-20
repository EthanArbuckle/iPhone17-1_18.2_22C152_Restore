@interface NSString(IKJSRWIDependencyCamelCase)
- (id)ikrwi_camelCase;
@end

@implementation NSString(IKJSRWIDependencyCamelCase)

- (id)ikrwi_camelCase
{
  v2 = NSString;
  v3 = [a1 substringToIndex:1];
  v4 = [v3 uppercaseString];
  v5 = [a1 substringFromIndex:1];
  v6 = [v2 stringWithFormat:@"%@%@", v4, v5];

  return v6;
}

@end