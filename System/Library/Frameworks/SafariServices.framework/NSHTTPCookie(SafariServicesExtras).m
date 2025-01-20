@interface NSHTTPCookie(SafariServicesExtras)
- (uint64_t)sf_matchesTopLevelDomain:()SafariServicesExtras;
@end

@implementation NSHTTPCookie(SafariServicesExtras)

- (uint64_t)sf_matchesTopLevelDomain:()SafariServicesExtras
{
  id v4 = a3;
  v5 = [a1 domain];
  char v6 = [v5 isEqualToString:v4];

  if (v6)
  {
    uint64_t v7 = 1;
  }
  else
  {
    v8 = [@"." stringByAppendingString:v4];
    if ([v4 characterAtIndex:0] == 46)
    {
      uint64_t v7 = 0;
    }
    else
    {
      v9 = [a1 domain];
      uint64_t v7 = [v9 hasSuffix:v8];
    }
  }

  return v7;
}

@end