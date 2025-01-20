@interface NSURLRequest(AuthKit)
- (BOOL)ak_usesHTTPSScheme;
@end

@implementation NSURLRequest(AuthKit)

- (BOOL)ak_usesHTTPSScheme
{
  v2 = [a1 URL];
  v3 = [v2 scheme];
  if (v3)
  {
    v4 = [a1 URL];
    v5 = [v4 scheme];
    BOOL v6 = [v5 caseInsensitiveCompare:@"https"] == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

@end