@interface NSURL(FBKLaunchAction)
- (BOOL)handlesLogin;
@end

@implementation NSURL(FBKLaunchAction)

- (BOOL)handlesLogin
{
  BOOL v2 = 1;
  v3 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:a1 resolvingAgainstBaseURL:1];
  v4 = [v3 queryItemsAsDictionary];
  v5 = [a1 host];
  int v6 = [v5 isEqualToString:@"login"];

  v7 = [v4 objectForKeyedSubscript:@"config"];

  if (!v6 || !v7)
  {
    if (FBKIsInternalInstall(v8, v9))
    {
      v10 = [v4 objectForKeyedSubscript:@"login_token"];
      BOOL v2 = v10 != 0;
    }
    else
    {
      BOOL v2 = 0;
    }
  }

  return v2;
}

@end