@interface CNContactListShareContactsAction
+ (id)descriptorForRequiredKeys;
- (BOOL)_customizationAvailableForActivityViewController:(id)a3;
- (BOOL)editRequiresAuthorization;
- (BOOL)shouldReloadListOnCompletion;
- (CNContactCardFieldPicker)fieldPicker;
- (CNContactListActionDelegate)delegate;
- (CNContactListShareContactsAction)initWithContacts:(id)a3 sourceView:(id)a4;
- (CNContactListShareContactsAction)initWithContacts:(id)a3 sourceView:(id)a4 context:(id)a5;
- (CNContactListShareContactsActionContext)context;
- (NSArray)contacts;
- (NSArray)filteredContacts;
- (UIActivityViewController)activityViewController;
- (UIView)sourceView;
- (id)_customizationGroupsForActivityViewController:(id)a3;
- (id)activityItemForContacts:(id)a3;
- (id)customLocalizedActionTitleForActivityViewController:(id)a3;
- (void)contactCardFieldPicker:(id)a3 didFinishWithContacts:(id)a4;
- (void)performAction;
- (void)presentFilterFieldPicker;
- (void)presentShareSheet;
- (void)setActivityViewController:(id)a3;
- (void)setContacts:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFieldPicker:(id)a3;
- (void)setFilteredContacts:(id)a3;
- (void)setSourceView:(id)a3;
- (void)setupForContactFieldPicker;
@end

@implementation CNContactListShareContactsAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_activityViewController, 0);
  objc_storeStrong((id *)&self->_fieldPicker, 0);
  objc_storeStrong((id *)&self->_filteredContacts, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setSourceView:(id)a3
{
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setActivityViewController:(id)a3
{
}

- (UIActivityViewController)activityViewController
{
  return self->_activityViewController;
}

- (void)setFieldPicker:(id)a3
{
}

- (CNContactCardFieldPicker)fieldPicker
{
  return self->_fieldPicker;
}

- (void)setFilteredContacts:(id)a3
{
}

- (NSArray)filteredContacts
{
  return self->_filteredContacts;
}

- (void)setContacts:(id)a3
{
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (CNContactListShareContactsActionContext)context
{
  return self->_context;
}

- (void)setDelegate:(id)a3
{
}

- (CNContactListActionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNContactListActionDelegate *)WeakRetained;
}

- (void)contactCardFieldPicker:(id)a3 didFinishWithContacts:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0)
  {
    [(CNContactListShareContactsAction *)self setFilteredContacts:v5];
    v6 = [(CNContactListShareContactsAction *)self activityViewController];

    if (v6)
    {
      v7 = [(CNContactListShareContactsAction *)self activityItemForContacts:v5];
      v8 = [(CNContactListShareContactsAction *)self activityViewController];
      v11[0] = v7;
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
      [v8 _updateActivityItems:v9];

      v10 = [(CNContactListShareContactsAction *)self activityViewController];
      [v10 setObjectManipulationDelegate:self];
    }
    else
    {
      [(CNContactListShareContactsAction *)self presentShareSheet];
    }
  }
}

- (id)customLocalizedActionTitleForActivityViewController:(id)a3
{
  v3 = CNContactsUIBundle();
  v4 = [v3 localizedStringForKey:@"SHARE_SELECTED_FIELDS_OPTION_BUTTON_TITLE" value:&stru_1ED8AC728 table:@"Localized"];

  return v4;
}

- (BOOL)_customizationAvailableForActivityViewController:(id)a3
{
  v4 = [(CNContactListShareContactsAction *)self fieldPicker];

  if (!v4) {
    return 0;
  }
  id v5 = [(CNContactListShareContactsAction *)self fieldPicker];
  v6 = [v5 fieldPickerDataSource];
  v7 = [v6 sections];
  BOOL v8 = [v7 count] != 0;

  return v8;
}

- (id)_customizationGroupsForActivityViewController:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)activityItemForContacts:(id)a3
{
  id v4 = a3;
  id v5 = [CNShareContactActivityItem alloc];
  v6 = [(CNContactListShareContactsAction *)self context];
  v7 = [v6 groupName];
  BOOL v8 = [(CNShareContactActivityItem *)v5 initWithContacts:v4 inGroupNamed:v7];

  v9 = [(CNContactListShareContactsAction *)self contacts];
  if (+[CNContactCardFieldPickerDataSource canSharePronounsForContacts:v9])
  {
    BOOL v10 = +[CNContactShareActionHelper contactsHaveShareableAddressingGrammarValue:v4];
  }
  else
  {
    BOOL v10 = 0;
  }
  [(CNShareContactActivityItem *)v8 setCanSharePronouns:v10];

  v11 = [(CNContactListShareContactsAction *)self contacts];
  [(CNShareContactActivityItem *)v8 setCanShareMeCardOnlySharingProperties:+[CNContactCardFieldPickerDataSource isSharingMeContactForContacts:v11]];

  return v8;
}

- (void)presentShareSheet
{
  v32[1] = *MEMORY[0x1E4F143B8];
  v3 = [(CNContactListShareContactsAction *)self filteredContacts];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(CNContactListShareContactsAction *)self contacts];
  }
  v6 = v5;

  v7 = [(CNContactListShareContactsAction *)self activityItemForContacts:v6];
  id v8 = objc_alloc(MEMORY[0x1E4F42718]);
  v32[0] = v7;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  BOOL v10 = (void *)[v8 initWithActivityItems:v9 applicationActivities:0];

  v11 = [(CNContactListShareContactsAction *)self delegate];
  objc_initWeak(&location, v11);
  [v10 setObjectManipulationDelegate:self];
  [v10 setShowKeyboardAutomatically:1];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __53__CNContactListShareContactsAction_presentShareSheet__block_invoke;
  v29[3] = &unk_1E549B070;
  objc_copyWeak(&v30, &location);
  v29[4] = self;
  [v10 setPreCompletionHandler:v29];
  v12 = [(CNContactListShareContactsAction *)self sourceView];
  BOOL v13 = v12 == 0;

  if (!v13)
  {
    v14 = [(CNContactListShareContactsAction *)self sourceView];
    v15 = [v10 popoverPresentationController];
    [v15 setSourceView:v14];

    v16 = [(CNContactListShareContactsAction *)self sourceView];
    [v16 bounds];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    v25 = [v10 popoverPresentationController];
    objc_msgSend(v25, "setSourceRect:", v18, v20, v22, v24);

    v26 = [(CNContactListShareContactsAction *)self contacts];
    LODWORD(v25) = (unint64_t)[v26 count] > 1;

    if (v25)
    {
      v27 = [v10 popoverPresentationController];
      [v27 setPermittedArrowDirections:12];
    }
  }
  v28 = [(CNContactListShareContactsAction *)self delegate];
  [v28 action:self presentViewController:v10];

  [(CNContactListShareContactsAction *)self setActivityViewController:v10];
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

void __53__CNContactListShareContactsAction_presentShareSheet__block_invoke(uint64_t a1, void *a2, int a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a3)
  {
    v7 = +[CNUIDataCollector sharedCollector];
    uint64_t v8 = CNUIContactActionTypeShare;
    uint64_t v10 = CNUIContactActionShareActivityType;
    v11[0] = v5;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [v7 logContactActionType:v8 attributes:v9];

    [WeakRetained actionDidFinish:*(void *)(a1 + 32)];
  }
}

- (void)presentFilterFieldPicker
{
  id v3 = objc_alloc(MEMORY[0x1E4FB19E8]);
  id v4 = [(CNContactListShareContactsAction *)self fieldPicker];
  id v6 = (id)[v3 initWithRootViewController:v4];

  id v5 = [(CNContactListShareContactsAction *)self delegate];
  [v5 action:self presentViewController:v6];
}

- (void)setupForContactFieldPicker
{
  [(CNContactListShareContactsAction *)self setFilteredContacts:0];
  id v3 = [CNContactCardFieldPicker alloc];
  id v4 = [(CNContactListShareContactsAction *)self contacts];
  id v5 = [(CNContactCardFieldPicker *)v3 initWithContacts:v4];
  [(CNContactListShareContactsAction *)self setFieldPicker:v5];

  id v6 = [(CNContactListShareContactsAction *)self fieldPicker];
  [v6 setDelegate:self];
}

- (BOOL)editRequiresAuthorization
{
  return 0;
}

- (void)performAction
{
  [(CNContactListShareContactsAction *)self setupForContactFieldPicker];
  activityViewController = self->_activityViewController;
  self->_activityViewController = 0;

  id v4 = [(CNContactListShareContactsAction *)self contacts];
  BOOL v5 = +[CNContactShareActionHelper contactsHavePrivateProperties:v4];

  if (v5)
  {
    [(CNContactListShareContactsAction *)self presentFilterFieldPicker];
  }
  else
  {
    [(CNContactListShareContactsAction *)self presentShareSheet];
  }
}

- (BOOL)shouldReloadListOnCompletion
{
  return 0;
}

- (CNContactListShareContactsAction)initWithContacts:(id)a3 sourceView:(id)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNContactListShareContactsAction;
  v12 = [(CNContactListShareContactsAction *)&v16 init];
  BOOL v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contacts, a3);
    objc_storeStrong((id *)&v13->_sourceView, a4);
    objc_storeStrong((id *)&v13->_context, a5);
    v14 = v13;
  }

  return v13;
}

- (CNContactListShareContactsAction)initWithContacts:(id)a3 sourceView:(id)a4
{
  return [(CNContactListShareContactsAction *)self initWithContacts:a3 sourceView:a4 context:0];
}

+ (id)descriptorForRequiredKeys
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1B8F8];
  id v3 = +[CNContactContentViewController descriptorForRequiredKeys];
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  BOOL v5 = [NSString stringWithUTF8String:"+[CNContactListShareContactsAction descriptorForRequiredKeys]"];
  id v6 = [v2 descriptorWithKeyDescriptors:v4 description:v5];

  return v6;
}

@end