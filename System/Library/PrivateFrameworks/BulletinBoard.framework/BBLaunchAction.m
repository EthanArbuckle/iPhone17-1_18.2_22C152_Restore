@interface BBLaunchAction
+ (id)launchActionWithBundleID:(id)a3 callblock:(id)a4;
+ (id)launchActionWithURL:(id)a3 callblock:(id)a4;
@end

@implementation BBLaunchAction

+ (id)launchActionWithURL:(id)a3 callblock:(id)a4
{
  return +[BBAction actionWithLaunchURL:a3 callblock:a4];
}

+ (id)launchActionWithBundleID:(id)a3 callblock:(id)a4
{
  return +[BBAction actionWithLaunchBundleID:a3 callblock:a4];
}

@end