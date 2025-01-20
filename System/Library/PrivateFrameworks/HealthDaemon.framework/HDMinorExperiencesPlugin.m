@interface HDMinorExperiencesPlugin
- (NSString)pluginIdentifier;
- (id)extensionForHealthDaemon:(id)a3;
- (id)extensionForProfile:(id)a3;
@end

@implementation HDMinorExperiencesPlugin

- (NSString)pluginIdentifier
{
  return (NSString *)@"com.apple.health.MinorExperiencesPlugin";
}

- (id)extensionForHealthDaemon:(id)a3
{
  return 0;
}

- (id)extensionForProfile:(id)a3
{
  id v3 = a3;
  if ([v3 profileType] == 1) {
    v4 = [[HDMinorExperiencesProfileExtension alloc] initWithProfile:v3];
  }
  else {
    v4 = 0;
  }

  return v4;
}

@end