@interface SFAddSavedAccountViewController
- (BOOL)shouldPopulatePasswordFieldWithNewGeneratedStrongPassword;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (BOOL)textFieldShouldReturn:(id)a3;
- (NSString)bundleIDForFallbackIcon;
- (SFAddSavedAccountViewController)initWithGroupID:(id)a3;
- (SFAddSavedAccountViewController)initWithSuggestedDomain:(id)a3;
- (SFAddSavedAccountViewController)initWithSuggestedDomain:(id)a3 password:(id)a4;
- (SFAddSavedAccountViewControllerDelegate)delegate;
- (id)_websiteAndCustomTitleFromTextFields;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_attemptToSavePassword;
- (void)_cancelBarButtonItemTapped:(id)a3;
- (void)_doneBarButtonItemTapped:(id)a3;
- (void)_preFillStrongPasswordIfRequested;
- (void)_savePasswordAndDismiss;
- (void)_textFieldChanged:(id)a3;
- (void)_updateDoneButtonEnabledState;
- (void)_updateHeaderViewCell;
- (void)_updateIcon;
- (void)_updateIconForCell:(id)a3;
- (void)_updateTextInputSuggestionsForPasswordField;
- (void)_updateTextInputSuggestionsForUserNameField;
- (void)_updateTextSuggestionsForTextField:(id)a3;
- (void)accountDetailHeaderViewCell:(id)a3 titleTextFieldDidChange:(id)a4;
- (void)returnKeyActivatedInAccountDetailHeaderViewCell:(id)a3;
- (void)setBundleIDForFallbackIcon:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setShouldPopulatePasswordFieldWithNewGeneratedStrongPassword:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SFAddSavedAccountViewController

- (SFAddSavedAccountViewController)initWithGroupID:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFAddSavedAccountViewController;
  v5 = [(SFAddSavedAccountViewController *)&v10 initWithStyle:2];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (SFAddSavedAccountViewController)initWithSuggestedDomain:(id)a3
{
  return [(SFAddSavedAccountViewController *)self initWithSuggestedDomain:a3 password:0];
}

- (SFAddSavedAccountViewController)initWithSuggestedDomain:(id)a3 password:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFAddSavedAccountViewController;
  v8 = [(SFAddSavedAccountViewController *)&v15 initWithStyle:2];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    suggestedDomain = v8->_suggestedDomain;
    v8->_suggestedDomain = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    password = v8->_password;
    v8->_password = (NSString *)v11;

    v8->_shouldPopulatePasswordFieldWithNewGeneratedStrongPassword = [v7 length] == 0;
    v13 = v8;
  }

  return v8;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)SFAddSavedAccountViewController;
  [(SFAddSavedAccountViewController *)&v10 viewDidLoad];
  v3 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelBarButtonItemTapped_];
  cancelBarButtonItem = self->_cancelBarButtonItem;
  self->_cancelBarButtonItem = v3;

  [(UIBarButtonItem *)self->_cancelBarButtonItem setAccessibilityIdentifier:@"Add Password Navigation Bar Cancel Button"];
  v5 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__doneBarButtonItemTapped_];
  doneBarButtonItem = self->_doneBarButtonItem;
  self->_doneBarButtonItem = v5;

  [(UIBarButtonItem *)self->_doneBarButtonItem setAccessibilityIdentifier:@"Add Password Navigation Bar Done Button"];
  [(UIBarButtonItem *)self->_doneBarButtonItem setEnabled:0];
  id v7 = [(SFAddSavedAccountViewController *)self navigationItem];
  v8 = _WBSLocalizedString();
  [v7 setTitle:v8];

  [v7 setLeftBarButtonItem:self->_cancelBarButtonItem];
  [v7 setRightBarButtonItem:self->_doneBarButtonItem];
  uint64_t v9 = [(SFAddSavedAccountViewController *)self view];
  [v9 setAccessibilityIdentifier:@"Add Password View"];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFAddSavedAccountViewController;
  [(SFAddSavedAccountViewController *)&v4 viewWillAppear:a3];
  [(SFAddSavedAccountViewController *)self _updateHeaderViewCell];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SFAddSavedAccountViewController;
  [(SFAddSavedAccountViewController *)&v6 viewDidAppear:a3];
  [(SFAddSavedAccountViewController *)self setEditing:1];
  if (!self->_didPreFillAndFocusFields)
  {
    [(SFAddSavedAccountViewController *)self _preFillStrongPasswordIfRequested];
    objc_super v4 = [(SFAccountHeaderViewCell *)self->_titleCell titleTextField];
    if ([(NSString *)self->_suggestedDomain length])
    {
      uint64_t v5 = [(SFEditableTableViewCell *)self->_userCell editableTextField];

      objc_super v4 = (void *)v5;
    }
    [v4 becomeFirstResponder];
    self->_didPreFillAndFocusFields = 1;
  }
}

- (BOOL)shouldPopulatePasswordFieldWithNewGeneratedStrongPassword
{
  return self->_shouldPopulatePasswordFieldWithNewGeneratedStrongPassword
      && [(NSString *)self->_password length] == 0;
}

- (void)_preFillStrongPasswordIfRequested
{
  if ([(SFAddSavedAccountViewController *)self shouldPopulatePasswordFieldWithNewGeneratedStrongPassword])
  {
    v3 = [(SFAccountHeaderViewCell *)self->_titleCell titleTextField];
    objc_super v4 = [v3 text];
    uint64_t v5 = objc_msgSend(v4, "safari_stringByTrimmingWhitespace");

    if ([MEMORY[0x1E4F98DF8] userTypedTitleShouldBeTreatedAsAWebsiteWhenAddingNewAccount:v5])
    {
      uint64_t v6 = objc_msgSend(v5, "safari_bestURLForUserTypedString");
    }
    else
    {
      uint64_t v6 = 0;
    }
    id v10 = (id)v6;
    id v7 = +[_SFFormDataController sharedController];
    v8 = [v7 autoGeneratedPasswordForURL:v10 respectingPasswordRequirements:0 maxLength:-1];

    uint64_t v9 = [(SFEditableTableViewCell *)self->_passwordCell editableTextField];
    [v9 setText:v8];
  }
}

- (void)_cancelBarButtonItemTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained addSavedAccountViewControllerDidFinish:self withSavedAccount:0];
  }
}

- (void)_doneBarButtonItemTapped:(id)a3
{
  [a3 setEnabled:0];

  [(SFAddSavedAccountViewController *)self _attemptToSavePassword];
}

- (void)_textFieldChanged:(id)a3
{
  id v4 = a3;
  [(SFAddSavedAccountViewController *)self _updateDoneButtonEnabledState];
  [(SFAddSavedAccountViewController *)self _updateTextSuggestionsForTextField:v4];
}

- (void)_updateDoneButtonEnabledState
{
  v3 = [(SFEditableTableViewCell *)self->_passwordCell editableTextField];
  id v4 = [v3 text];

  -[UIBarButtonItem setEnabled:](self->_doneBarButtonItem, "setEnabled:", [v4 length] != 0);
}

- (void)_updateTextSuggestionsForTextField:(id)a3
{
  id v8 = a3;
  id v4 = [(SFEditableTableViewCell *)self->_userCell editableTextField];
  int v5 = [v8 isEqual:v4];

  if (v5)
  {
    [(SFAddSavedAccountViewController *)self _updateTextInputSuggestionsForUserNameField];
  }
  else
  {
    uint64_t v6 = [(SFEditableTableViewCell *)self->_passwordCell editableTextField];
    int v7 = [v8 isEqual:v6];

    if (v7) {
      [(SFAddSavedAccountViewController *)self _updateTextInputSuggestionsForPasswordField];
    }
  }
}

- (void)_updateTextInputSuggestionsForUserNameField
{
  v3 = [(SFEditableTableViewCell *)self->_userCell editableTextField];
  id v4 = [v3 text];

  int v5 = [MEMORY[0x1E4F98260] sharedProvider];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__SFAddSavedAccountViewController__updateTextInputSuggestionsForUserNameField__block_invoke;
  v7[3] = &unk_1E5C72B40;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [v5 suggestedUsersOfType:0 matchingText:v6 completionHandler:v7];
}

void __78__SFAddSavedAccountViewController__updateTextInputSuggestionsForUserNameField__block_invoke(uint64_t a1, void *a2)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__SFAddSavedAccountViewController__updateTextInputSuggestionsForUserNameField__block_invoke_2;
  v8[3] = &unk_1E5C777C0;
  id v9 = *(id *)(a1 + 32);
  id v4 = objc_msgSend(a2, "safari_mapAndFilterObjectsUsingBlock:", v8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__SFAddSavedAccountViewController__updateTextInputSuggestionsForUserNameField__block_invoke_3;
  block[3] = &unk_1E5C72238;
  block[4] = *(void *)(a1 + 40);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

id __78__SFAddSavedAccountViewController__updateTextInputSuggestionsForUserNameField__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 value];
  char v5 = objc_msgSend(v4, "safari_isCaseInsensitiveEqualToString:", *(void *)(a1 + 32));

  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4FB1DC8];
    id v8 = [v3 value];
    id v6 = [v7 textSuggestionWithInputText:v8 searchText:*(void *)(a1 + 32)];
  }

  return v6;
}

void __78__SFAddSavedAccountViewController__updateTextInputSuggestionsForUserNameField__block_invoke_3(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 1048) editableTextField];
  v2 = [v3 textInputSuggestionDelegate];
  [v2 setSuggestions:*(void *)(a1 + 40)];
}

- (void)_updateTextInputSuggestionsForPasswordField
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(SFEditableTableViewCell *)self->_passwordCell editableTextField];
  id v4 = [v3 text];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v7 = [(SFAccountHeaderViewCell *)self->_titleCell titleTextField];
    id v8 = [v7 text];
    id v9 = objc_msgSend(v8, "safari_stringByTrimmingWhitespace");

    if ([MEMORY[0x1E4F98DF8] userTypedTitleShouldBeTreatedAsAWebsiteWhenAddingNewAccount:v9])
    {
      id v10 = objc_msgSend(v9, "safari_bestURLForUserTypedString");
    }
    else
    {
      id v10 = 0;
    }
    uint64_t v11 = +[_SFFormDataController sharedController];
    v12 = [v11 autoGeneratedPasswordForURL:v10 respectingPasswordRequirements:0 maxLength:-1];

    if (v12)
    {
      v13 = [MEMORY[0x1E4FB1DC8] textSuggestionWithInputText:v12];
      v14 = _WBSLocalizedString();
      [v13 setHeaderText:v14];

      [v13 setDisplayText:v12];
      v18[0] = v13;
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    }
    else
    {
      id v6 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78__SFAddSavedAccountViewController__updateTextInputSuggestionsForPasswordField__block_invoke;
  v16[3] = &unk_1E5C72238;
  v16[4] = self;
  id v17 = v6;
  id v15 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v16);
}

void __78__SFAddSavedAccountViewController__updateTextInputSuggestionsForPasswordField__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 1056) editableTextField];
  v2 = [v3 textInputSuggestionDelegate];
  [v2 setSuggestions:*(void *)(a1 + 40)];
}

- (id)_websiteAndCustomTitleFromTextFields
{
  v2 = [(SFAccountHeaderViewCell *)self->_titleCell titleTextField];
  id v3 = [v2 text];
  id v4 = objc_msgSend(v3, "safari_stringByTrimmingWhitespace");

  int v5 = [MEMORY[0x1E4F98DF8] userTypedTitleShouldBeTreatedAsAWebsiteWhenAddingNewAccount:v4];
  if (v5) {
    id v6 = 0;
  }
  else {
    id v6 = v4;
  }
  if (v5) {
    id v7 = v4;
  }
  else {
    id v7 = 0;
  }
  id v8 = (objc_class *)MEMORY[0x1E4F98C70];
  id v9 = v4;
  id v10 = (void *)[[v8 alloc] initWithFirst:v7 second:v6];

  return v10;
}

- (void)_attemptToSavePassword
{
  id v3 = [(SFAddSavedAccountViewController *)self _websiteAndCustomTitleFromTextFields];
  id v4 = [v3 first];
  int v5 = [v3 second];
  id v6 = [(SFEditableTableViewCell *)self->_userCell editableTextField];
  id v7 = [v6 text];

  id v8 = [(SFEditableTableViewCell *)self->_passwordCell editableTextField];
  id v9 = [v8 text];

  id v10 = [MEMORY[0x1E4F98DF8] sharedStore];
  notesForEditing = self->_notesForEditing;
  groupID = self->_groupID;
  id v26 = 0;
  int v13 = [v10 canSaveUser:v7 password:v9 forUserTypedSite:v4 notes:notesForEditing customTitle:v5 groupID:groupID error:&v26];
  id v14 = v26;

  if (v13)
  {
    [(SFAddSavedAccountViewController *)self _savePasswordAndDismiss];
  }
  else
  {
    v24 = (void *)MEMORY[0x1E4FB1418];
    id v15 = objc_msgSend(MEMORY[0x1E4F98938], "alertTitleForFailedAccountCreationWithErrorCode:", objc_msgSend(v14, "code"));
    v16 = (void *)MEMORY[0x1E4F98938];
    v25 = v5;
    uint64_t v17 = [v14 code];
    v18 = objc_msgSend(v4, "safari_highLevelDomainFromHost");
    v19 = [v16 alertSubtitleForFailedAccountCreationWithErrorCode:v17 forUserTypedSite:v4 userTypedUsername:v7 highLevelDomain:v18];
    v20 = [v24 alertControllerWithTitle:v15 message:v19 preferredStyle:1];

    v21 = (void *)MEMORY[0x1E4FB1410];
    v22 = [MEMORY[0x1E4F98938] alertDismissActionTitleForFailedAccountCreation];
    v23 = [v21 actionWithTitle:v22 style:0 handler:0];
    [v20 addAction:v23];

    int v5 = v25;
    [(SFAddSavedAccountViewController *)self presentViewController:v20 animated:1 completion:0];
  }
}

- (void)_savePasswordAndDismiss
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(SFAddSavedAccountViewController *)self _websiteAndCustomTitleFromTextFields];
    id v4 = [v3 first];
    int v5 = [v3 second];
    id v6 = [MEMORY[0x1E4F98DF8] sharedStore];
    id v7 = [(SFEditableTableViewCell *)self->_userCell editableTextField];
    id v8 = [v7 text];
    id v9 = [(SFEditableTableViewCell *)self->_passwordCell editableTextField];
    id v10 = [v9 text];
    uint64_t v11 = [v6 saveUser:v8 password:v10 forUserTypedSite:v4 customTitle:v5 notesEntry:self->_notesForEditing groupID:self->_groupID];

    [WeakRetained addSavedAccountViewControllerDidFinish:self withSavedAccount:v11];
  }
}

- (void)_updateHeaderViewCell
{
  titleCell = self->_titleCell;
  id v4 = [(SFAccountHeaderViewCell *)titleCell titleTextField];
  int v5 = [v4 text];
  id v6 = objc_msgSend(v5, "safari_highLevelDomainForPasswordManager");
  id v7 = objc_msgSend(v6, "_lp_userVisibleHost");
  [(SFAccountHeaderViewCell *)titleCell setHeaderTitleForHighLevelDomain:v7 customTitle:self->_titleForEditing];

  [(SFAddSavedAccountViewController *)self _updateIcon];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  id v5 = [(SFEditableTableViewCell *)self->_userCell editableTextField];

  id v6 = [(SFEditableTableViewCell *)self->_passwordCell editableTextField];
  id v7 = v6;
  if (v5 == v4)
  {
    [v6 becomeFirstResponder];
    goto LABEL_6;
  }
  if (v6 != v4)
  {
LABEL_6:

    goto LABEL_7;
  }
  int v8 = [(UIBarButtonItem *)self->_doneBarButtonItem isEnabled];

  if (v8) {
    [(SFAddSavedAccountViewController *)self _attemptToSavePassword];
  }
LABEL_7:

  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return a4 == 1;
  }
  else {
    return 3;
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4 == 1)
  {
    id v5 = _WBSLocalizedString();
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)_updateIcon
{
}

- (void)_updateIconForCell:(id)a3
{
  id v20 = a3;
  uint64_t v4 = [(SFAccountHeaderViewCell *)self->_titleCell titleTextField];
  id v5 = [v4 text];
  id v6 = objc_msgSend(v5, "safari_stringByTrimmingWhitespace");

  if ([MEMORY[0x1E4F98DF8] userTypedTitleShouldBeTreatedAsAWebsiteWhenAddingNewAccount:v6])
  {
    id v7 = objc_msgSend(v6, "safari_bestURLForUserTypedString");
  }
  else
  {
    id v7 = 0;
  }
  int v8 = [v7 host];
  id v9 = objc_msgSend(v8, "safari_highLevelDomainForPasswordManager");

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = [WeakRetained iconControllerForAddSavedAccountDetailViewController:self];
    v12 = [v11 iconForDomain:v9];
    int v13 = v12;
    if (!v12 || (([v12 size], v15 == 56.0) ? (BOOL v16 = v14 == 56.0) : (BOOL v16 = 0), v16))
    {
      if (!self->_bundleIDForFallbackIcon
        || ![v6 isEqualToString:self->_suggestedDomain])
      {
LABEL_16:
        if (v13)
        {
          [v20 setIcon:v13];
        }
        else
        {
          v19 = [v11 backgroundColorForDomain:v9];
          [v20 setMonogramBackgroundColor:v19];
        }
        goto LABEL_20;
      }
      uint64_t v17 = [v11 appIconForBundleID:self->_bundleIDForFallbackIcon];
    }
    else
    {
      uint64_t v17 = objc_msgSend(MEMORY[0x1E4F98BC8], "resizedImage:withSize:", v13);
    }
    v18 = (void *)v17;

    int v13 = v18;
    goto LABEL_16;
  }
  uint64_t v11 = +[_SFAccountManagerAppearanceValues defaultMonogramBackgroundColor];
  [v20 setMonogramBackgroundColor:v11];
LABEL_20:
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 dequeueReusableCellWithIdentifier:@"editableTableViewCell"];
  id v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = [[SFEditableTableViewCell alloc] initWithEnabledState:1];
  }
  uint64_t v11 = v10;

  v12 = v11;
  int v13 = [(SFEditableTableViewCell *)v12 editableTextField];
  [v13 setDelegate:self];
  [v13 addTarget:self action:sel__textFieldChanged_ forControlEvents:0x20000];
  uint64_t v14 = [v7 section];
  if (v14 == 1)
  {
    v25 = [[SFAccountNoteTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"NotesCell"];
    notesCell = self->_notesCell;
    self->_notesCell = v25;

    [(SFAccountNoteTableViewCell *)self->_notesCell setDelegate:self];
    notesForEditing = self->_notesForEditing;
    v28 = [(SFAccountNoteTableViewCell *)self->_notesCell textView];
    [v28 setText:notesForEditing];

    objc_initWeak(&location, self);
    uint64_t v43 = MEMORY[0x1E4F143A8];
    uint64_t v44 = 3221225472;
    v45 = __67__SFAddSavedAccountViewController_tableView_cellForRowAtIndexPath___block_invoke;
    v46 = &unk_1E5C725B8;
    objc_copyWeak(&v47, &location);
    [(SFAccountNoteTableViewCell *)self->_notesCell setTextDidChange:&v43];
    [(SFAccountNoteTableViewCell *)self->_notesCell setAccessibilityIdentifier:@"Add Password Notes Cell", v43, v44, v45, v46];
    v29 = self->_notesCell;
    objc_destroyWeak(&v47);
    objc_destroyWeak(&location);
    goto LABEL_22;
  }
  if (!v14)
  {
    uint64_t v15 = [v7 item];
    switch(v15)
    {
      case 2:
        v30 = objc_msgSend(MEMORY[0x1E4F1CB18], "pm_defaults");
        uint64_t v31 = objc_msgSend(v30, "pm_passwordManagerIsInDemoMode") ^ 1;

        v32 = _WBSLocalizedString();
        [v13 setPlaceholder:v32];

        [v13 setSecureTextEntry:v31];
        [v13 setDisplaySecureTextUsingPlainText:v31];
        v33 = _WBSLocalizedString();
        v34 = [(SFEditableTableViewCell *)v12 textLabel];
        [v34 setText:v33];

        p_passwordCell = &self->_passwordCell;
        objc_storeStrong((id *)&self->_passwordCell, v11);
        [(SFEditableTableViewCell *)self->_passwordCell setAccessibilityIdentifier:@"Add Password Password Cell"];
        if ([(NSString *)self->_password length])
        {
          password = self->_password;
          v37 = [(SFEditableTableViewCell *)*p_passwordCell editableTextField];
          [v37 setText:password];
        }
        break;
      case 1:
        v38 = _WBSLocalizedString();
        [v13 setPlaceholder:v38];

        v39 = _WBSLocalizedString();
        v40 = [(SFEditableTableViewCell *)v12 textLabel];
        [v40 setText:v39];

        p_userCell = &self->_userCell;
        objc_storeStrong((id *)p_userCell, v11);
        [(SFEditableTableViewCell *)*p_userCell setAccessibilityIdentifier:@"Add Password User Name Cell"];
        break;
      case 0:
        BOOL v16 = [(SFAddSavedAccountViewController *)self tableView];
        uint64_t v17 = [v16 dequeueReusableCellWithIdentifier:@"AddPasswordTitleCell"];
        v18 = v17;
        if (!v17) {
          v18 = [[SFAccountHeaderViewCell alloc] initWithStyle:0 reuseIdentifier:@"AddPasswordTitleCell"];
        }
        p_titleCell = &self->_titleCell;
        objc_storeStrong((id *)&self->_titleCell, v18);
        if (!v17) {

        }
        if ([(NSString *)self->_suggestedDomain length])
        {
          suggestedDomain = self->_suggestedDomain;
          v21 = [(SFAccountHeaderViewCell *)*p_titleCell titleTextField];
          [v21 setText:suggestedDomain];

          objc_storeStrong((id *)&self->_titleForEditing, self->_suggestedDomain);
        }
        v22 = [(SFAccountHeaderViewCell *)*p_titleCell titleTextField];
        [v22 setKeyboardType:3];

        v23 = [(SFAccountHeaderViewCell *)*p_titleCell titleTextField];
        [v23 setAutocapitalizationType:0];

        [(SFAddSavedAccountViewController *)self _updateHeaderViewCell];
        [(SFAccountHeaderViewCell *)*p_titleCell setDelegate:self];
        [(SFAccountHeaderViewCell *)*p_titleCell setAccessibilityIdentifier:@"Add Password Website Cell"];
        v24 = *p_titleCell;
        goto LABEL_21;
    }
  }
  v24 = v12;
LABEL_21:
  v29 = (SFAccountNoteTableViewCell *)v24;
LABEL_22:

  return v29;
}

void __67__SFAddSavedAccountViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__SFAddSavedAccountViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
  block[3] = &unk_1E5C725B8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __67__SFAddSavedAccountViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v2 = [WeakRetained tableView];
    [v2 beginUpdates];
    [v2 endUpdates];
    id v3 = [v6[133] textView];
    uint64_t v4 = [v3 text];
    id v5 = v6[135];
    v6[135] = (id)v4;

    [v6 _updateDoneButtonEnabledState];
    id WeakRetained = v6;
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)accountDetailHeaderViewCell:(id)a3 titleTextFieldDidChange:(id)a4
{
  objc_msgSend(a4, "text", a3);
  id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  titleForEditing = self->_titleForEditing;
  self->_titleForEditing = v5;

  [(SFAddSavedAccountViewController *)self _updateHeaderViewCell];
}

- (void)returnKeyActivatedInAccountDetailHeaderViewCell:(id)a3
{
  id v3 = [(SFEditableTableViewCell *)self->_userCell editableTextField];
  [v3 becomeFirstResponder];
}

- (void)setShouldPopulatePasswordFieldWithNewGeneratedStrongPassword:(BOOL)a3
{
  self->_shouldPopulatePasswordFieldWithNewGeneratedStrongPassword = a3;
}

- (NSString)bundleIDForFallbackIcon
{
  return self->_bundleIDForFallbackIcon;
}

- (void)setBundleIDForFallbackIcon:(id)a3
{
}

- (SFAddSavedAccountViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFAddSavedAccountViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bundleIDForFallbackIcon, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_suggestedDomain, 0);
  objc_storeStrong((id *)&self->_notesForEditing, 0);
  objc_storeStrong((id *)&self->_titleForEditing, 0);
  objc_storeStrong((id *)&self->_notesCell, 0);
  objc_storeStrong((id *)&self->_passwordCell, 0);
  objc_storeStrong((id *)&self->_userCell, 0);
  objc_storeStrong((id *)&self->_titleCell, 0);
  objc_storeStrong((id *)&self->_doneBarButtonItem, 0);

  objc_storeStrong((id *)&self->_cancelBarButtonItem, 0);
}

@end