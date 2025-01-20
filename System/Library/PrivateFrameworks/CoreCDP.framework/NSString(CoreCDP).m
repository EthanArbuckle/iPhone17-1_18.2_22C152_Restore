@interface NSString(CoreCDP)
- (id)replaceToken:()CoreCDP withConfigToken:fallbackToken:;
@end

@implementation NSString(CoreCDP)

- (id)replaceToken:()CoreCDP withConfigToken:fallbackToken:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([a1 containsString:v8])
  {
    id v11 = v10;
    if ([v9 length])
    {
      id v12 = v9;

      id v11 = v12;
    }
    id v13 = [a1 stringByReplacingOccurrencesOfString:v8 withString:v11];
  }
  else
  {
    id v13 = a1;
  }

  return v13;
}

@end