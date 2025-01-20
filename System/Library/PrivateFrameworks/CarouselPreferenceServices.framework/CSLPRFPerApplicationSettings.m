@interface CSLPRFPerApplicationSettings
+ (id)fakeApplicationWithIdentifier:(id)a3;
+ (id)globalDefaultIdentifer;
@end

@implementation CSLPRFPerApplicationSettings

+ (id)fakeApplicationWithIdentifier:(id)a3
{
  return +[CSLPRFApp appWithBundleID:a3 name:a3 sdkVersion:@"16.0" supportsAlwaysOnDisplay:1 defaultsToPrivateAlwaysOnDisplayTreatment:0];
}

+ (id)globalDefaultIdentifer
{
  return @"globalForAllApps";
}

@end