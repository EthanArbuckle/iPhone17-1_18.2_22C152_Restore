@interface CNContactShareContactAction
- (BOOL)_customizationAvailableForActivityViewController:(id)a3;
- (BOOL)canPerformAction;
- (CNContact)filteredContact;
- (CNContactCardFieldPicker)fieldPicker;
- (UIActivityViewController)activityViewController;
- (UIView)sourceView;
- (id)_customizationGroupsForActivityViewController:(id)a3;
- (id)activityItemForContact:(id)a3;
- (id)customLocalizedActionTitleForActivityViewController:(id)a3;
- (void)contactCardFieldPicker:(id)a3 didFinishWithContacts:(id)a4;
- (void)performActionWithSender:(id)a3;
- (void)presentFilterFieldPicker;
- (void)presentShareSheet;
- (void)setActivityViewController:(id)a3;
- (void)setFieldPicker:(id)a3;
- (void)setFilteredContact:(id)a3;
- (void)setSourceView:(id)a3;
- (void)setupForContactFieldPicker;
@end

@implementation CNContactShareContactAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_fieldPicker, 0);
  objc_storeStrong((id *)&self->_filteredContact, 0);

  objc_storeStrong((id *)&self->_activityViewController, 0);
}

- (void)setSourceView:(id)a3
{
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setFieldPicker:(id)a3
{
}

- (CNContactCardFieldPicker)fieldPicker
{
  return self->_fieldPicker;
}

- (void)setFilteredContact:(id)a3
{
}

- (CNContact)filteredContact
{
  return self->_filteredContact;
}

- (void)setActivityViewController:(id)a3
{
}

- (UIActivityViewController)activityViewController
{
  return self->_activityViewController;
}

- (void)contactCardFieldPicker:(id)a3 didFinishWithContacts:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0)
  {
    v6 = [v5 firstObject];
    [(CNContactShareContactAction *)self setFilteredContact:v6];

    v7 = [(CNContactShareContactAction *)self activityViewController];

    if (v7)
    {
      v8 = [(CNContactShareContactAction *)self filteredContact];
      v9 = [(CNContactShareContactAction *)self activityItemForContact:v8];

      v10 = [(CNContactShareContactAction *)self activityViewController];
      v13[0] = v9;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      [v10 _updateActivityItems:v11];

      v12 = [(CNContactShareContactAction *)self activityViewController];
      [v12 setObjectManipulationDelegate:self];
    }
    else
    {
      [(CNContactShareContactAction *)self presentShareSheet];
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
  v4 = [(CNContactShareContactAction *)self fieldPicker];

  if (!v4) {
    return 0;
  }
  id v5 = [(CNContactShareContactAction *)self fieldPicker];
  v6 = [v5 fieldPickerDataSource];
  v7 = [v6 sections];
  BOOL v8 = [v7 count] != 0;

  return v8;
}

- (id)_customizationGroupsForActivityViewController:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)activityItemForContact:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [[CNShareContactActivityItem alloc] initWithContact:v4];

  v6 = [(CNContactAction *)self contact];
  v15[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  if (+[CNContactCardFieldPickerDataSource canSharePronounsForContacts:v7])
  {
    BOOL v8 = [(CNContactAction *)self contact];
    v14 = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    [(CNShareContactActivityItem *)v5 setCanSharePronouns:+[CNContactShareActionHelper contactsHaveShareableAddressingGrammarValue:v9]];
  }
  else
  {
    [(CNShareContactActivityItem *)v5 setCanSharePronouns:0];
  }

  v10 = [(CNContactAction *)self contact];
  v13 = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  [(CNShareContactActivityItem *)v5 setCanShareMeCardOnlySharingProperties:+[CNContactCardFieldPickerDataSource isSharingMeContactForContacts:v11]];

  return v5;
}

- (void)presentShareSheet
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v3 = [(CNContactShareContactAction *)self filteredContact];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(CNContactAction *)self contact];
  }
  v6 = v5;

  v7 = [(CNContactShareContactAction *)self activityItemForContact:v6];
  id v8 = objc_alloc(MEMORY[0x1E4F42718]);
  v19[0] = v7;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  v10 = (void *)[v8 initWithActivityItems:v9 applicationActivities:0];

  v11 = [(CNContactAction *)self delegate];
  objc_initWeak(&location, v10);
  objc_initWeak(&from, v11);
  [v10 setObjectManipulationDelegate:self];
  [v10 setShowKeyboardAutomatically:1];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__CNContactShareContactAction_presentShareSheet__block_invoke;
  v14[3] = &unk_1E54976C8;
  objc_copyWeak(&v15, &from);
  objc_copyWeak(&v16, &location);
  v14[4] = self;
  [v10 setPreCompletionHandler:v14];
  v12 = [(CNContactAction *)self delegate];
  v13 = [(CNContactShareContactAction *)self sourceView];
  [v12 action:self presentViewController:v10 sender:v13];

  [(CNContactShareContactAction *)self setActivityViewController:v10];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __48__CNContactShareContactAction_presentShareSheet__block_invoke(uint64_t a1, void *a2, int a3)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = objc_loadWeakRetained((id *)(a1 + 48));
  if (a3)
  {
    id v8 = +[CNUIDataCollector sharedCollector];
    uint64_t v9 = CNUIContactActionTypeShare;
    uint64_t v13 = CNUIContactActionShareActivityType;
    v14[0] = v5;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    [v8 logContactActionType:v9 attributes:v10];

    [WeakRetained actionDidFinish:*(void *)(a1 + 32)];
  }
  else
  {
    [WeakRetained actionWasCanceled:*(void *)(a1 + 32)];
  }
  v11 = *(void **)(a1 + 32);
  v12 = [v11 sourceView];
  [WeakRetained action:v11 dismissViewController:v7 sender:v12];
}

- (void)presentFilterFieldPicker
{
  id v3 = objc_alloc(MEMORY[0x1E4FB19E8]);
  id v4 = [(CNContactShareContactAction *)self fieldPicker];
  id v7 = (id)[v3 initWithRootViewController:v4];

  id v5 = [(CNContactAction *)self delegate];
  v6 = [(CNContactShareContactAction *)self sourceView];
  [v5 action:self presentViewController:v7 sender:v6];
}

- (void)setupForContactFieldPicker
{
  [(CNContactShareContactAction *)self setFilteredContact:0];
  id v3 = [CNContactCardFieldPicker alloc];
  id v4 = [(CNContactAction *)self contact];
  id v5 = [(CNContactCardFieldPicker *)v3 initWithContact:v4];
  [(CNContactShareContactAction *)self setFieldPicker:v5];

  id v6 = [(CNContactShareContactAction *)self fieldPicker];
  [v6 setDelegate:self];
}

- (void)performActionWithSender:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  [(CNContactShareContactAction *)self setSourceView:a3];
  [(CNContactShareContactAction *)self setupForContactFieldPicker];
  activityViewController = self->_activityViewController;
  self->_activityViewController = 0;

  id v5 = [(CNContactAction *)self contact];
  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  BOOL v7 = +[CNContactShareActionHelper contactsHavePrivateProperties:v6];

  if (v7) {
    [(CNContactShareContactAction *)self presentFilterFieldPicker];
  }
  else {
    [(CNContactShareContactAction *)self presentShareSheet];
  }
}

- (BOOL)canPerformAction
{
  return 1;
}

@end