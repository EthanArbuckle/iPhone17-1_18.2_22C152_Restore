@interface CHCompanionHealthPlugin
- (NSString)pluginIdentifier;
- (id)diagnosticDescription;
- (id)extensionForHealthDaemon:(id)a3;
- (id)extensionForProfile:(id)a3;
- (id)taskServerClasses;
@end

@implementation CHCompanionHealthPlugin

- (id)extensionForHealthDaemon:(id)a3
{
  return 0;
}

- (id)extensionForProfile:(id)a3
{
  id v3 = a3;
  if ([v3 profileType] == 1) {
    v4 = [[CHCompanionHealthProfileExtension alloc] initWithProfile:v3];
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (NSString)pluginIdentifier
{
  return (NSString *)@"com.apple.CompanionHealth.Plugin";
}

- (id)taskServerClasses
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)diagnosticDescription
{
  return @"Companion Health Plugin, for all your Fitness iPhone needs.";
}

@end