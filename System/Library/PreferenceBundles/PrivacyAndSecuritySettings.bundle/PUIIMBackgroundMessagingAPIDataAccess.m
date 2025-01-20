@interface PUIIMBackgroundMessagingAPIDataAccess
+ (id)numberOfAppsUsingBackgroundMessaging;
@end

@implementation PUIIMBackgroundMessagingAPIDataAccess

+ (id)numberOfAppsUsingBackgroundMessaging
{
  Class v2 = NSClassFromString(@"IMBackgroundMessagingAPIDataAccess");
  SEL v3 = NSSelectorFromString(@"numberOfAppsUsingBackgroundMessaging");
  if (objc_opt_respondsToSelector())
  {
    v4 = +[NSNumber numberWithUnsignedInteger:[(objc_class *)v2 performSelector:v3]];
  }
  else
  {
    v4 = &off_60070;
  }

  return v4;
}

@end