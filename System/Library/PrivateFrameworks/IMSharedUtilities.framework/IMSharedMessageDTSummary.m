@interface IMSharedMessageDTSummary
+ (id)pluginPath;
+ (id)previewSummary;
@end

@implementation IMSharedMessageDTSummary

+ (id)pluginPath
{
  return @"/System/Library/Messages/iMessageBalloons/DigitalTouchBalloonProvider.bundle";
}

+ (id)previewSummary
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___IMSharedMessageDTSummary;
  id v2 = objc_msgSendSuper2(&v4, sel_previewSummary);
  if (![v2 length]) {
    return (id)[(id)IMSharedUtilitiesFrameworkBundle() localizedStringForKey:@"Digital Touch Message" value:&stru_1EF2CAD28 table:@"IMSharedUtilities"];
  }
  return v2;
}

@end