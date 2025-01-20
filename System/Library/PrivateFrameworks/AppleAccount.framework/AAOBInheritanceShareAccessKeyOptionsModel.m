@interface AAOBInheritanceShareAccessKeyOptionsModel
- (AAOBInheritanceShareAccessKeyOptionsModel)initWithBeneficiaryName:(id)a3;
- (AAOBInheritanceShareAccessKeyOptionsModel)initWithBeneficiaryName:(id)a3 handle:(id)a4;
- (NSString)detailText;
- (NSString)helpLinkTitle;
- (NSString)helpLinkURL;
- (NSString)imageName;
- (NSString)primaryButton;
- (NSString)recipientHandle;
- (NSString)secondaryButton;
- (NSString)title;
- (id)availableSharingOptions;
- (id)defaultSharingOptions;
- (id)detailTextForShareAccessKeyType:(unint64_t)a3;
- (id)titleForShareAccessKeyType:(unint64_t)a3;
- (void)availableSharingOptionsWithCompletion:(id)a3;
- (void)setDetailText:(id)a3;
- (void)setHelpLinkTitle:(id)a3;
- (void)setHelpLinkURL:(id)a3;
- (void)setImageName:(id)a3;
- (void)setPrimaryButton:(id)a3;
- (void)setRecipientHandle:(id)a3;
- (void)setSecondaryButton:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation AAOBInheritanceShareAccessKeyOptionsModel

- (AAOBInheritanceShareAccessKeyOptionsModel)initWithBeneficiaryName:(id)a3
{
  return [(AAOBInheritanceShareAccessKeyOptionsModel *)self initWithBeneficiaryName:a3 handle:&stru_1EF456870];
}

- (AAOBInheritanceShareAccessKeyOptionsModel)initWithBeneficiaryName:(id)a3 handle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_beneficiaryName, a3);
  v25.receiver = self;
  v25.super_class = (Class)AAOBInheritanceShareAccessKeyOptionsModel;
  v9 = [(AAOBInheritanceShareAccessKeyOptionsModel *)&v25 init];
  v10 = v9;
  if (v9)
  {
    imageName = v9->_imageName;
    v9->_imageName = 0;

    objc_storeStrong((id *)&v10->_recipientHandle, a4);
    v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v13 = [v12 localizedStringForKey:@"INHERITANCE_SHARE_KEY_OPTIONS_TITLE" value:0 table:@"Localizable"];
    title = v10->_title;
    v10->_title = (NSString *)v13;

    v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v16 = [v15 localizedStringForKey:@"INHERITANCE_SHARE_KEY_OPTIONS_MESSAGE" value:0 table:@"Localizable"];
    detailText = v10->_detailText;
    v10->_detailText = (NSString *)v16;

    v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v19 = [v18 localizedStringForKey:@"INHERITANCE_SHARE_KEY_OPTIONS_LEARNMORE_TITLE" value:0 table:@"Localizable"];
    helpLinkTitle = v10->_helpLinkTitle;
    v10->_helpLinkTitle = (NSString *)v19;

    helpLinkURL = v10->_helpLinkURL;
    v10->_helpLinkURL = (NSString *)@"https://support.apple.com/kb/HT212360";

    primaryButton = v10->_primaryButton;
    v10->_primaryButton = 0;

    secondaryButton = v10->_secondaryButton;
    v10->_secondaryButton = 0;
  }
  return v10;
}

- (id)defaultSharingOptions
{
  return &unk_1EF483D98;
}

- (id)availableSharingOptions
{
  return &unk_1EF483DB0;
}

- (void)availableSharingOptionsWithCompletion:(id)a3
{
  id v4 = a3;
  recipientHandle = self->_recipientHandle;
  if (recipientHandle && [(NSString *)recipientHandle length])
  {
    v6 = [[AAMessagingDestination alloc] initWithHandle:self->_recipientHandle];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __83__AAOBInheritanceShareAccessKeyOptionsModel_availableSharingOptionsWithCompletion___block_invoke;
    v9[3] = &unk_1E5A48C60;
    id v10 = v4;
    [(AAMessagingDestination *)v6 isRegisteredToiMessageWithCompletion:v9];
  }
  else
  {
    id v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1A11D8000, v7, OS_LOG_TYPE_DEFAULT, "Handle is either nil or empty.", v8, 2u);
    }

    v6 = [(AAOBInheritanceShareAccessKeyOptionsModel *)self defaultSharingOptions];
    (*((void (**)(id, AAMessagingDestination *))v4 + 2))(v4, v6);
  }
}

uint64_t __83__AAOBInheritanceShareAccessKeyOptionsModel_availableSharingOptionsWithCompletion___block_invoke(uint64_t a1, int a2)
{
  id v4 = _AALogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v4, OS_LOG_TYPE_DEFAULT, "The contact with is iMessage-able.", buf, 2u);
    }

    v6 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1A11D8000, v4, OS_LOG_TYPE_DEFAULT, "The contact with is not iMessage-able.", v8, 2u);
    }

    v6 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  }
  return v6();
}

- (id)titleForShareAccessKeyType:(unint64_t)a3
{
  if (a3 == 1)
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    BOOL v5 = v4;
    v6 = @"INHERITANCE_SHARE_KEY_OPTION_PRINT_TITLE";
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    BOOL v5 = v4;
    v6 = @"INHERITANCE_SHARE_KEY_OPTION_MESSAGE_TITLE";
  }
  v3 = [v4 localizedStringForKey:v6 value:0 table:@"Localizable"];

LABEL_6:

  return v3;
}

- (id)detailTextForShareAccessKeyType:(unint64_t)a3
{
  if (a3 == 1)
  {
    v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    v3 = [v6 localizedStringForKey:@"INHERITANCE_SHARE_KEY_OPTION_PRINT_DETAILTEXT" value:0 table:@"Localizable"];
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    BOOL v5 = NSString;
    v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    id v7 = [v6 localizedStringForKey:@"INHERITANCE_SHARE_KEY_OPTION_MESSAGE_DETAILTEXT" value:0 table:@"Localizable"];
    v3 = objc_msgSend(v5, "stringWithFormat:", v7, self->_beneficiaryName);
  }
LABEL_6:

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

- (NSString)recipientHandle
{
  return self->_recipientHandle;
}

- (void)setRecipientHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientHandle, 0);
  objc_storeStrong((id *)&self->_helpLinkURL, 0);
  objc_storeStrong((id *)&self->_helpLinkTitle, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_imageName, 0);

  objc_storeStrong((id *)&self->_beneficiaryName, 0);
}

@end