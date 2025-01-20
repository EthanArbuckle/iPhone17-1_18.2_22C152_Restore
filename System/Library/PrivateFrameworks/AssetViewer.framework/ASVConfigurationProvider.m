@interface ASVConfigurationProvider
+ (id)configuration;
+ (id)defaultConfiguration;
@end

@implementation ASVConfigurationProvider

+ (id)defaultConfiguration
{
  v2 = objc_opt_new();
  [v2 setPlaneDetection:1];
  [v2 setEnvironmentTexturing:1];
  return v2;
}

+ (id)configuration
{
  return +[ASVConfigurationProvider defaultConfiguration];
}

@end