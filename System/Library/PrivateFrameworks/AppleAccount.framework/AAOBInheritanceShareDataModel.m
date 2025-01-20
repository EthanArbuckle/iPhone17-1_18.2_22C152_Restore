@interface AAOBInheritanceShareDataModel
- (AAOBInheritanceShareDataModel)initWithBeneficiaryName:(id)a3;
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

@implementation AAOBInheritanceShareDataModel

- (AAOBInheritanceShareDataModel)initWithBeneficiaryName:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)AAOBInheritanceShareDataModel;
  v5 = [(AAOBInheritanceShareDataModel *)&v24 init];
  v6 = v5;
  if (v5)
  {
    imageName = v5->_imageName;
    v5->_imageName = 0;

    v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v9 = [v8 localizedStringForKey:@"INHERITANCE_SHARE_DATA_TITLE" value:0 table:@"Localizable"];
    title = v6->_title;
    v6->_title = (NSString *)v9;

    v11 = NSString;
    v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    v13 = [v12 localizedStringForKey:@"INHERITANCE_SHARE_DATA_MESSAGE" value:0 table:@"Localizable"];
    uint64_t v14 = objc_msgSend(v11, "stringWithFormat:", v13, v4);
    detailText = v6->_detailText;
    v6->_detailText = (NSString *)v14;

    v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v17 = [v16 localizedStringForKey:@"INHERITANCE_SHARE_DATA_LEARNMORE_TITLE" value:0 table:@"Localizable"];
    helpLinkTitle = v6->_helpLinkTitle;
    v6->_helpLinkTitle = (NSString *)v17;

    objc_storeStrong((id *)&v6->_helpLinkURL, @"https://support.apple.com/kb/HT212360");
    v19 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v20 = [v19 localizedStringForKey:@"INHERITANCE_SHARE_DATA_CONTINUE_TITLE" value:0 table:@"Localizable"];
    primaryButton = v6->_primaryButton;
    v6->_primaryButton = (NSString *)v20;

    secondaryButton = v6->_secondaryButton;
    v6->_secondaryButton = 0;
  }
  return v6;
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