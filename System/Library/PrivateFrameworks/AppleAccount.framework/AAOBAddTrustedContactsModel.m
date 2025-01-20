@interface AAOBAddTrustedContactsModel
- (AAOBAddTrustedContactsModel)init;
- (NSString)detailText;
- (NSString)helpLinkTitle;
- (NSString)helpLinkURL;
- (NSString)imageName;
- (NSString)primaryButton;
- (NSString)secondaryButton;
- (NSString)title;
- (void)setDetailText:(id)a3;
- (void)setHelpLinkTitle:(id)a3;
- (void)setHelpLinkURL:(id)a3;
- (void)setImageName:(id)a3;
- (void)setPrimaryButton:(id)a3;
- (void)setSecondaryButton:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation AAOBAddTrustedContactsModel

- (AAOBAddTrustedContactsModel)init
{
  v11.receiver = self;
  v11.super_class = (Class)AAOBAddTrustedContactsModel;
  v2 = [(AAOBAddTrustedContactsModel *)&v11 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v4 = [v3 localizedStringForKey:@"ADD_ACCOUNT_CONTACTS" value:0 table:@"Localizable"];
    title = v2->_title;
    v2->_title = (NSString *)v4;

    v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v7 = [v6 localizedStringForKey:@"ADD_ACCOUNT_CONTACTS_LEARN_MORE" value:0 table:@"Localizable"];
    helpLinkTitle = v2->_helpLinkTitle;
    v2->_helpLinkTitle = (NSString *)v7;

    helpLinkURL = v2->_helpLinkURL;
    v2->_helpLinkURL = (NSString *)@"www.apple.com";
  }
  return v2;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
}

- (NSString)primaryButton
{
  return self->_primaryButton;
}

- (void)setPrimaryButton:(id)a3
{
}

- (NSString)secondaryButton
{
  return self->_secondaryButton;
}

- (void)setSecondaryButton:(id)a3
{
}

- (NSString)helpLinkTitle
{
  return self->_helpLinkTitle;
}

- (void)setHelpLinkTitle:(id)a3
{
}

- (NSString)helpLinkURL
{
  return self->_helpLinkURL;
}

- (void)setHelpLinkURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helpLinkURL, 0);
  objc_storeStrong((id *)&self->_helpLinkTitle, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_imageName, 0);
}

@end