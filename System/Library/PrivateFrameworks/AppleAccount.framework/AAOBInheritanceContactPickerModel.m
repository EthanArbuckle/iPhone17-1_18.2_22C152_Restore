@interface AAOBInheritanceContactPickerModel
- (AAOBInheritanceContactPickerModel)init;
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

@implementation AAOBInheritanceContactPickerModel

- (AAOBInheritanceContactPickerModel)init
{
  v14.receiver = self;
  v14.super_class = (Class)AAOBInheritanceContactPickerModel;
  v2 = [(AAOBInheritanceContactPickerModel *)&v14 init];
  v3 = v2;
  if (v2)
  {
    imageName = v2->_imageName;
    v2->_imageName = 0;

    v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v6 = [v5 localizedStringForKey:@"INHERITANCE_CONTACT_PICKER_TITLE" value:0 table:@"Localizable"];
    title = v3->_title;
    v3->_title = (NSString *)v6;

    v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v9 = [v8 localizedStringForKey:@"INHERITANCE_CONTACT_PICKER_MESSAGE" value:0 table:@"Localizable"];
    detailText = v3->_detailText;
    v3->_detailText = (NSString *)v9;

    primaryButton = v3->_primaryButton;
    v3->_primaryButton = 0;

    secondaryButton = v3->_secondaryButton;
    v3->_secondaryButton = 0;
  }
  return v3;
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