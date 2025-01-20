@interface NSUserDefaults
+ (id)mad_daemonUserDefaults;
@end

@implementation NSUserDefaults

+ (id)mad_daemonUserDefaults
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 bundleIdentifier];
  unsigned int v4 = [v3 isEqualToString:@"com.apple.mediaanalysisd"];

  if (v4)
  {
    id v5 = +[NSUserDefaults standardUserDefaults];
  }
  else
  {
    id v5 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.mediaanalysisd"];
  }
  return v5;
}

@end