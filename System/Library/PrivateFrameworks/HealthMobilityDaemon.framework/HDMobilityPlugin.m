@interface HDMobilityPlugin
+ (BOOL)shouldLoadPluginForDaemon:(id)a3;
- (NSString)pluginIdentifier;
- (id)extensionForHealthDaemon:(id)a3;
- (id)extensionForProfile:(id)a3;
- (id)taskServerClasses;
@end

@implementation HDMobilityPlugin

- (NSString)pluginIdentifier
{
  return (NSString *)(id)*MEMORY[0x263F45290];
}

+ (BOOL)shouldLoadPluginForDaemon:(id)a3
{
  v3 = [a3 behavior];
  char v4 = [v3 isRealityDevice];

  return v4 ^ 1;
}

- (id)extensionForHealthDaemon:(id)a3
{
  return 0;
}

- (id)extensionForProfile:(id)a3
{
  id v3 = a3;
  if ([v3 profileType] == 1) {
    char v4 = [[HDMobilityProfileExtension alloc] initWithProfile:v3];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)taskServerClasses
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

@end