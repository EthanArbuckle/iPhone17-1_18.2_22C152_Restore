@interface AAOBCustodiansListViewModel
- (AAOBCustodiansListViewModel)init;
- (AAOBCustodiansListViewModel)initWithContacts:(id)a3;
- (NSString)detailText;
- (NSString)helpLinkTitle;
- (NSString)helpLinkURL;
- (NSString)imageName;
- (NSString)primaryButton;
- (NSString)recipientHandle;
- (NSString)secondaryButton;
- (NSString)title;
- (id)contacts;
- (void)_updatePrimaryButtonTitle;
- (void)setDetailText:(id)a3;
- (void)setHelpLinkTitle:(id)a3;
- (void)setHelpLinkURL:(id)a3;
- (void)setImageName:(id)a3;
- (void)setPrimaryButton:(id)a3;
- (void)setRecipientHandle:(id)a3;
- (void)setSecondaryButton:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation AAOBCustodiansListViewModel

- (AAOBCustodiansListViewModel)init
{
  v18.receiver = self;
  v18.super_class = (Class)AAOBCustodiansListViewModel;
  v2 = [(AAOBCustodiansListViewModel *)&v18 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v4 = [v3 localizedStringForKey:@"CUSTODIAN_LIST_VIEW_TITLE" value:0 table:@"Localizable"];
    title = v2->_title;
    v2->_title = (NSString *)v4;

    v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v7 = [v6 localizedStringForKey:@"CUSTODIAN_LIST_VIEW_DETAIL_TEXT" value:0 table:@"Localizable"];
    detailText = v2->_detailText;
    v2->_detailText = (NSString *)v7;

    v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v10 = [v9 localizedStringForKey:@"CUSTODIAN_LIST_VIEW_PRIMARY_BUTTON" value:0 table:@"Localizable"];
    primaryButton = v2->_primaryButton;
    v2->_primaryButton = (NSString *)v10;

    v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v13 = [v12 localizedStringForKey:@"CUSTODIAN_LIST_VIEW_SECONDARY_BUTTON" value:0 table:@"Localizable"];
    secondaryButton = v2->_secondaryButton;
    v2->_secondaryButton = (NSString *)v13;

    uint64_t v15 = objc_opt_new();
    contactsManager = v2->_contactsManager;
    v2->_contactsManager = (AAContactsManager *)v15;
  }
  return v2;
}

- (AAOBCustodiansListViewModel)initWithContacts:(id)a3
{
  id v5 = a3;
  v6 = [(AAOBCustodiansListViewModel *)self init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contacts, a3);
    [(AAOBCustodiansListViewModel *)v7 _updatePrimaryButtonTitle];
  }

  return v7;
}

- (id)contacts
{
  v2 = (void *)[(NSArray *)self->_contacts copy];

  return v2;
}

- (void)_updatePrimaryButtonTitle
{
  if ([(NSArray *)self->_contacts count] == 1)
  {
    v3 = [(NSArray *)self->_contacts firstObject];
    contactsManager = self->_contactsManager;
    id v12 = v3;
    id v5 = [v3 handle];
    v6 = [(AAContactsManager *)contactsManager contactForHandle:v5];

    if (v6)
    {
      uint64_t v7 = [v6 phoneNumbers];
      uint64_t v8 = [v7 count];

      if (v8 == 1)
      {
        v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v10 = [v9 localizedStringForKey:@"CUSTODIAN_LIST_VIEW_PRIMARY_BUTTON_CONTINUE" value:0 table:@"Localizable"];
        primaryButton = self->_primaryButton;
        self->_primaryButton = v10;
      }
    }
  }
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
  objc_storeStrong((id *)&self->_contactsManager, 0);

  objc_storeStrong((id *)&self->_contacts, 0);
}

@end