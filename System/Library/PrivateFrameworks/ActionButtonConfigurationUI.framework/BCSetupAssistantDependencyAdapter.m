@interface BCSetupAssistantDependencyAdapter
+ (id)viewControllerWithDismissHandler:(id)a3;
+ (void)preloadResourcesWithCompletion:(id)a3;
@end

@implementation BCSetupAssistantDependencyAdapter

+ (void)preloadResourcesWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[BCPreloader shared];
  [v4 preloadResourcesWithCompletion:v3];
}

+ (id)viewControllerWithDismissHandler:(id)a3
{
  id v3 = a3;
  id v4 = [[BCConfigurationViewController alloc] initWithMode:0 dismissHandler:v3];

  return v4;
}

@end