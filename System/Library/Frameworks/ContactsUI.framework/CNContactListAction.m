@interface CNContactListAction
- (BOOL)editRequiresAuthorization;
- (BOOL)editRequiresAuthorizationCheckForContact:(id)a3 containerIdentifier:(id)a4;
- (BOOL)shouldReloadListOnCompletion;
- (CNContactListAction)initWithContacts:(id)a3 configuration:(id)a4;
- (CNContactListActionConfiguration)configuration;
- (CNContactListActionDelegate)delegate;
- (NSArray)contacts;
- (void)setConfiguration:(id)a3;
- (void)setContacts:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CNContactListAction

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contacts, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)setDelegate:(id)a3
{
}

- (CNContactListActionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNContactListActionDelegate *)WeakRetained;
}

- (void)setContacts:(id)a3
{
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setConfiguration:(id)a3
{
}

- (CNContactListActionConfiguration)configuration
{
  return self->_configuration;
}

- (BOOL)editRequiresAuthorizationCheckForContact:(id)a3 containerIdentifier:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F5A650];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  v10 = [(CNContactListAction *)self configuration];
  v11 = [v10 containerForContainerIdentifier:v7];

  v12 = (void *)[v9 initWithContact:v8 parentContainer:v11 ignoresParentalRestrictions:0];
  LOBYTE(v8) = [v12 shouldPromptForPasscodeAuthorization];

  return (char)v8;
}

- (BOOL)editRequiresAuthorization
{
  v2 = self;
  v3 = [(CNContactListAction *)self contacts];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__CNContactListAction_editRequiresAuthorization__block_invoke;
  v5[3] = &unk_1E549C040;
  v5[4] = v2;
  LOBYTE(v2) = objc_msgSend(v3, "_cn_any:", v5);

  return (char)v2;
}

uint64_t __48__CNContactListAction_editRequiresAuthorization__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 configuration];
  v6 = [v5 contactViewCache];
  id v7 = [v6 containerForContact:v4];
  id v8 = [v7 identifier];

  uint64_t v9 = [*(id *)(a1 + 32) editRequiresAuthorizationCheckForContact:v4 containerIdentifier:v8];
  return v9;
}

- (BOOL)shouldReloadListOnCompletion
{
  return 0;
}

- (CNContactListAction)initWithContacts:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNContactListAction;
  uint64_t v9 = [(CNContactListAction *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a4);
    objc_storeStrong((id *)&v10->_contacts, a3);
    v11 = v10;
  }

  return v10;
}

@end