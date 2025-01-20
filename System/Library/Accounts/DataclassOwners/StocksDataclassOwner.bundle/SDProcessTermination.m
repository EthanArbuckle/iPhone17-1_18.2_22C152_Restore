@interface SDProcessTermination
+ (void)_killProcessNamed:(id)a3 bundleID:(id)a4;
+ (void)killProcess:(int64_t)a3;
@end

@implementation SDProcessTermination

+ (void)killProcess:(int64_t)a3
{
  if (a3 == 1)
  {
    [a1 _killProcessNamed:@"StocksToday" bundleID:@"com.apple.stocks.widget"];
    CFStringRef v4 = @"StocksWidget";
    CFStringRef v5 = @"com.apple.stocks.widget2";
  }
  else
  {
    if (a3) {
      return;
    }
    CFStringRef v4 = @"Stocks";
    CFStringRef v5 = @"com.apple.stocks";
  }
  [a1 _killProcessNamed:v4 bundleID:v5];
}

+ (void)_killProcessNamed:(id)a3 bundleID:(id)a4
{
}

@end