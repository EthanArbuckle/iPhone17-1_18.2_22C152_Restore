@interface EDLocalizableStrings
+ (NSString)noSenderTitle;
@end

@implementation EDLocalizableStrings

+ (NSString)noSenderTitle
{
  return (NSString *)_EFLocalizedString();
}

@end