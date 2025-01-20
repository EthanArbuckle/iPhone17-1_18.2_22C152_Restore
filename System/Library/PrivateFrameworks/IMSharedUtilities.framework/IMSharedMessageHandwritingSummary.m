@interface IMSharedMessageHandwritingSummary
+ (id)pluginPath;
+ (id)previewSummary;
@end

@implementation IMSharedMessageHandwritingSummary

+ (id)pluginPath
{
  return @"/System/Library/Messages/iMessageBalloons/HandwritingProvider.bundle";
}

+ (id)previewSummary
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___IMSharedMessageHandwritingSummary;
  id v2 = objc_msgSendSuper2(&v4, sel_previewSummary);
  if (![v2 length]) {
    return (id)[(id)IMSharedUtilitiesFrameworkBundle() localizedStringForKey:@"Handwritten Message" value:&stru_1EF2CAD28 table:@"IMSharedUtilities"];
  }
  return v2;
}

@end