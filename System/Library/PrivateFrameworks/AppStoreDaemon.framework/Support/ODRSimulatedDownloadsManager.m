@interface ODRSimulatedDownloadsManager
+ (void)initialize;
@end

@implementation ODRSimulatedDownloadsManager

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = +[NSUserDefaults standardUserDefaults];
    [v2 registerDefaults:&off_10054E270];
  }
}

@end