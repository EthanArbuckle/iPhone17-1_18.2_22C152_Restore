@interface AAOBInheritanceSetupCompleteModel
- (AAOBInheritanceSetupCompleteModel)initWithBeneficiaryName:(id)a3 accessKeyShareType:(unint64_t)a4;
- (AAOBInheritanceSetupCompleteModel)initWithBeneficiaryName:(id)a3 accessKeyShareType:(unint64_t)a4 inviteType:(unint64_t)a5;
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

@implementation AAOBInheritanceSetupCompleteModel

- (AAOBInheritanceSetupCompleteModel)initWithBeneficiaryName:(id)a3 accessKeyShareType:(unint64_t)a4
{
  return [(AAOBInheritanceSetupCompleteModel *)self initWithBeneficiaryName:a3 accessKeyShareType:a4 inviteType:2];
}

- (AAOBInheritanceSetupCompleteModel)initWithBeneficiaryName:(id)a3 accessKeyShareType:(unint64_t)a4 inviteType:(unint64_t)a5
{
  id v8 = a3;
  v40.receiver = self;
  v40.super_class = (Class)AAOBInheritanceSetupCompleteModel;
  v9 = [(AAOBInheritanceSetupCompleteModel *)&v40 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_imageName, @"legacy_contact_header");
    if (a4 == 1)
    {
      v19 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
      uint64_t v20 = [v19 localizedStringForKey:@"INHERITANCE_SETUP_COMPLETE_TITLE" value:0 table:@"Localizable"];
      title = v10->_title;
      v10->_title = (NSString *)v20;

      v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
      v17 = [v22 localizedStringForKey:@"SETTINGS" value:0 table:@"Localizable"];

      v23 = NSString;
      v24 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
      v25 = [v24 localizedStringForKey:@"INHERITANCE_SETUP_COMPLETE_MESSAGE_AFTER_PRINTING" value:0 table:@"Localizable"];
      uint64_t v26 = objc_msgSend(v23, "stringWithFormat:", v25, v8, v17);
      detailText = v10->_detailText;
      v10->_detailText = (NSString *)v26;
    }
    else
    {
      if (a4)
      {
LABEL_10:
        v31 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v32 = [v31 localizedStringForKey:@"INHERITANCE_SETUP_COMPLETE_DONE_TITLE" value:0 table:@"Localizable"];
        primaryButton = v10->_primaryButton;
        v10->_primaryButton = (NSString *)v32;

        v34 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v35 = [v34 localizedStringForKey:@"INHERITANCE_SETUP_COMPLETE_UPDATE_BIRTHDAY_TITLE" value:0 table:@"Localizable"];
        secondaryButton = v10->_secondaryButton;
        v10->_secondaryButton = (NSString *)v35;

        helpLinkTitle = v10->_helpLinkTitle;
        v10->_helpLinkTitle = 0;

        helpLinkURL = v10->_helpLinkURL;
        v10->_helpLinkURL = 0;

        goto LABEL_11;
      }
      v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
      v12 = v11;
      if (a5 == 1)
      {
        uint64_t v13 = [v11 localizedStringForKey:@"INHERITANCE_INVITE_COMPLETE_TITLE" value:0 table:@"Localizable"];
        v14 = v10->_title;
        v10->_title = (NSString *)v13;

        v15 = NSString;
        v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        v17 = v16;
        v18 = @"INHERITANCE_INVITE_COMPLETE_MESSAGE_AFTER_MESSAGING";
      }
      else
      {
        uint64_t v28 = [v11 localizedStringForKey:@"INHERITANCE_SETUP_COMPLETE_TITLE" value:0 table:@"Localizable"];
        v29 = v10->_title;
        v10->_title = (NSString *)v28;

        v15 = NSString;
        v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        v17 = v16;
        v18 = @"INHERITANCE_SETUP_COMPLETE_MESSAGE_AFTER_MESSAGING";
      }
      v24 = [v16 localizedStringForKey:v18 value:0 table:@"Localizable"];
      uint64_t v30 = objc_msgSend(v15, "stringWithFormat:", v24, v8);
      v25 = v10->_detailText;
      v10->_detailText = (NSString *)v30;
    }

    goto LABEL_10;
  }
LABEL_11:

  return v10;
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