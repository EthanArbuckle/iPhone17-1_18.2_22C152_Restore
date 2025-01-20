@interface AACustodianChooseContactViewModel
- (NSString)selectButtonText;
- (NSString)title;
@end

@implementation AACustodianChooseContactViewModel

- (NSString)title
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v3 = [v2 localizedStringForKey:@"CUSTODIAN_CHOOSE_CONTACT_TITLE" value:0 table:@"Localizable"];

  return (NSString *)v3;
}

- (NSString)selectButtonText
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v3 = [v2 localizedStringForKey:@"CUSTODIAN_CHOOSE_CONTACT_SELECT_BUTTON" value:0 table:@"Localizable"];

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->title, 0);

  objc_storeStrong((id *)&self->selectButtonText, 0);
}

@end