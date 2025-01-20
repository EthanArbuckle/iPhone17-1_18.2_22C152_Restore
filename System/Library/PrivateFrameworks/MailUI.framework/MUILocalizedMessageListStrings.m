@interface MUILocalizedMessageListStrings
+ (NSString)attachmentItemsFormat;
+ (NSString)lotsOfAttachments;
+ (NSString)noContentPlaceholder;
+ (NSString)noRecipientsPlaceholder;
+ (NSString)noSenderPlaceholder;
+ (NSString)noSubjectPlaceholder;
@end

@implementation MUILocalizedMessageListStrings

+ (NSString)attachmentItemsFormat
{
  return (NSString *)_EFLocalizedStringFromTable();
}

+ (NSString)lotsOfAttachments
{
  return (NSString *)_EFLocalizedString();
}

+ (NSString)noContentPlaceholder
{
  return (NSString *)_EFLocalizedString();
}

+ (NSString)noRecipientsPlaceholder
{
  return (NSString *)_EFLocalizedString();
}

+ (NSString)noSenderPlaceholder
{
  return (NSString *)_EFLocalizedString();
}

+ (NSString)noSubjectPlaceholder
{
  return (NSString *)_EFLocalizedString();
}

@end