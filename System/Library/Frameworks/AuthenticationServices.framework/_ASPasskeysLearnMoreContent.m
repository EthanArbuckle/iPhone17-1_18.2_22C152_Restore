@interface _ASPasskeysLearnMoreContent
+ (NSString)bodyString;
+ (NSString)footerLearnMoreLinkBindingString;
+ (NSString)footerLearnMoreLinkString;
+ (NSString)footerString;
+ (NSString)subtitleString;
+ (NSString)systemImageName;
+ (NSString)titleString;
@end

@implementation _ASPasskeysLearnMoreContent

+ (NSString)systemImageName
{
  return (NSString *)@"person.badge.key.fill";
}

+ (NSString)titleString
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)subtitleString
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)bodyString
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)footerString
{
  uint64_t v2 = [MEMORY[0x263F29440] biometryType];
  if (v2 == 1 || v2 == 2) {
    [MEMORY[0x263F29440] deviceClass];
  }
  v3 = _WBSLocalizedString();

  return (NSString *)v3;
}

+ (NSString)footerLearnMoreLinkBindingString
{
  return (NSString *)@"@about-passkeys-link@";
}

+ (NSString)footerLearnMoreLinkString
{
  return (NSString *)_WBSLocalizedString();
}

@end