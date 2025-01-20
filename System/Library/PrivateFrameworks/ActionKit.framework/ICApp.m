@interface ICApp
@end

@implementation ICApp

uint64_t __50__ICApp_LaunchServices__initWithApplicationProxy___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 objectForKeyedSubscript:@"CFBundleURLIsPrivate"];
  uint64_t v3 = [v2 BOOLValue] ^ 1;

  return v3;
}

@end