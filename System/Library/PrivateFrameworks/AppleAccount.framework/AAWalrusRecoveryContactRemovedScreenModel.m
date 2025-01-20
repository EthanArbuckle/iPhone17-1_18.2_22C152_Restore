@interface AAWalrusRecoveryContactRemovedScreenModel
- (AAWalrusRecoveryContactRemovedScreenModel)initWithHasRecoveryContact:(BOOL)a3 hasRecoveryKey:(BOOL)a4;
- (NSString)detailText;
- (NSString)helpLinkTitle;
- (NSString)helpLinkURL;
- (NSString)imageName;
- (NSString)leftBarButton;
- (NSString)primaryButton;
- (NSString)secondaryButton;
- (NSString)title;
- (void)_setupModelWithHasRecoveryContact:(BOOL)a3 hasRecoveryKey:(BOOL)a4;
- (void)setDetailText:(id)a3;
- (void)setHelpLinkTitle:(id)a3;
- (void)setHelpLinkURL:(id)a3;
- (void)setImageName:(id)a3;
- (void)setLeftBarButton:(id)a3;
- (void)setPrimaryButton:(id)a3;
- (void)setSecondaryButton:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation AAWalrusRecoveryContactRemovedScreenModel

- (AAWalrusRecoveryContactRemovedScreenModel)initWithHasRecoveryContact:(BOOL)a3 hasRecoveryKey:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAWalrusRecoveryContactRemovedScreenModel;
  v6 = [(AAWalrusRecoveryContactRemovedScreenModel *)&v9 init];
  v7 = v6;
  if (v6) {
    [(AAWalrusRecoveryContactRemovedScreenModel *)v6 _setupModelWithHasRecoveryContact:v5 hasRecoveryKey:v4];
  }
  return v7;
}

- (void)_setupModelWithHasRecoveryContact:(BOOL)a3 hasRecoveryKey:(BOOL)a4
{
  v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v8 = [v7 localizedStringForKey:@"RECOVERY_CONTACT_REMOVED_TITLE_IOS" value:0 table:@"Localizable-Walrus"];
  [(AAWalrusRecoveryContactRemovedScreenModel *)self setTitle:v8];

  objc_super v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v10 = v9;
  if (a3)
  {
    v11 = @"REMOVE_RECOVERY_CONTACT_DETAIL_HAS_ANOTHER_RC";
LABEL_5:
    v12 = [v9 localizedStringForKey:v11 value:0 table:@"Localizable-Walrus"];
    [(AAWalrusRecoveryContactRemovedScreenModel *)self setDetailText:v12];

    id v19 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    v13 = [v19 localizedStringForKey:@"REMOVE_RECOVERY_CONTACT_DONE_BUTTON" value:0 table:@"Localizable-Walrus"];
    [(AAWalrusRecoveryContactRemovedScreenModel *)self setPrimaryButton:v13];
    goto LABEL_7;
  }
  if (a4)
  {
    v11 = @"REMOVE_RECOVERY_CONTACT_DETAIL_HAS_RK";
    goto LABEL_5;
  }
  v14 = [v9 localizedStringForKey:@"REMOVE_RECOVERY_CONTACT_DETAIL_DEFAULT" value:0 table:@"Localizable-Walrus"];
  [(AAWalrusRecoveryContactRemovedScreenModel *)self setDetailText:v14];

  v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v16 = [v15 localizedStringForKey:@"REMOVE_RECOVERY_CONTACT_PRIMARY_BUTTON" value:0 table:@"Localizable-Walrus"];
  [(AAWalrusRecoveryContactRemovedScreenModel *)self setPrimaryButton:v16];

  v17 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v18 = [v17 localizedStringForKey:@"REMOVE_RECOVERY_CONTACT_SECOND_BUTTON" value:0 table:@"Localizable-Walrus"];
  [(AAWalrusRecoveryContactRemovedScreenModel *)self setSecondaryButton:v18];

  id v19 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v13 = [v19 localizedStringForKey:@"REMOVE_RECOVERY_CONTACT_NOT_NOW_BUTTON" value:0 table:@"Localizable-Walrus"];
  [(AAWalrusRecoveryContactRemovedScreenModel *)self setLeftBarButton:v13];
LABEL_7:
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

- (NSString)leftBarButton
{
  return self->_leftBarButton;
}

- (void)setLeftBarButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leftBarButton, 0);
  objc_storeStrong((id *)&self->_helpLinkURL, 0);
  objc_storeStrong((id *)&self->_helpLinkTitle, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_imageName, 0);
}

@end