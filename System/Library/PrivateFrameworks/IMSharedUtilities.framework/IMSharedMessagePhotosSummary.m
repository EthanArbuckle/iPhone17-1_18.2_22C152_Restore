@interface IMSharedMessagePhotosSummary
+ (id)pluginPath;
+ (id)previewSummary;
@end

@implementation IMSharedMessagePhotosSummary

+ (id)pluginPath
{
  return @"/System/Library/Messages/iMessageBalloons/HandwritingProvider.bundle";
}

+ (id)previewSummary
{
  v2 = (void *)IMSharedUtilitiesFrameworkBundle();

  return (id)[v2 localizedStringForKey:@"Photo Message" value:&stru_1EF2CAD28 table:@"IMSharedUtilities"];
}

@end