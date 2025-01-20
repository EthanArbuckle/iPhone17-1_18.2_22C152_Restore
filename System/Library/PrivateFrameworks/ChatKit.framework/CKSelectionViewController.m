@interface CKSelectionViewController
- (CKSelectionViewControllerDelegate)delegate;
- (id)_defaultConfigurationWithSelectionCount:(int64_t)a3;
- (id)_deleteAction;
- (id)_deleteAllAction;
- (id)_junkFilteringConfigurationWithSelectionCount:(int64_t)a3 secondaryText:(id)a4;
- (id)_recentlyDeletedConfigurationWithSelectionCount:(int64_t)a3 secondaryText:(id)a4;
- (id)_recoverAction;
- (void)_updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)_updatePropertiesAsDeleteAllButton:(id)a3;
- (void)_updatePropertiesAsDeleteButton:(id)a3;
- (void)_updatePropertiesAsDestructiveButton:(id)a3 buttonText:(id)a4;
- (void)_updatePropertiesAsRecoverButton:(id)a3;
- (void)handleNewComposeSelection;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation CKSelectionViewController

- (void)setDelegate:(id)a3
{
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)CKSelectionViewController;
  [(CKSelectionViewController *)&v7 viewDidLoad];
  v3 = [(CKSelectionViewController *)self view];
  v4 = +[CKUIBehavior sharedBehaviors];
  v5 = [v4 theme];
  v6 = [v5 transcriptBackgroundColor];
  [v3 setBackgroundColor:v6];
}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  v4 = [(CKSelectionViewController *)self delegate];
  uint64_t v5 = [v4 selectedCountForSelectionViewController:self];

  v6 = [(CKSelectionViewController *)self delegate];
  int v7 = [v6 shouldUseRecentlyDeletedConfigurationForSelectionViewController:self];

  v8 = [(CKSelectionViewController *)self delegate];
  v9 = v8;
  if (v7)
  {
    v10 = [v8 secondaryTextForSelectionViewController:self];

    uint64_t v11 = [(CKSelectionViewController *)self _recentlyDeletedConfigurationWithSelectionCount:v5 secondaryText:v10];
LABEL_5:
    id v24 = (id)v11;

    goto LABEL_7;
  }
  int v12 = [v8 shouldUseJunkFilteringConfigurationForSelectionViewController:self];

  if (v12)
  {
    v13 = [(CKSelectionViewController *)self delegate];
    v10 = [v13 secondaryTextForSelectionViewController:self];

    uint64_t v11 = [(CKSelectionViewController *)self _junkFilteringConfigurationWithSelectionCount:v5 secondaryText:v10];
    goto LABEL_5;
  }
  id v24 = [(CKSelectionViewController *)self _defaultConfigurationWithSelectionCount:v5];
LABEL_7:
  v14 = [(CKSelectionViewController *)self delegate];
  int v15 = [v14 areSelectedConversationsBlocked];

  if (v15)
  {
    v16 = NSString;
    v17 = CKFrameworkBundle();
    v18 = [v17 localizedStringForKey:@"BLOCKED_CONVERSATIONS_SELECTED" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v19 = objc_msgSend(v16, "localizedStringWithFormat:", v18, v5);

    v20 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v21 = [v20 userInterfaceLayoutDirection];

    if (v21 == 1) {
      v22 = @"\u200F";
    }
    else {
      v22 = @"\u200E";
    }
    v23 = [(__CFString *)v22 stringByAppendingString:v19];

    [v24 setText:v23];
  }
  [(CKSelectionViewController *)self _setContentUnavailableConfiguration:v24];
}

- (id)_defaultConfigurationWithSelectionCount:(int64_t)a3
{
  v4 = [MEMORY[0x1E4F428E8] emptyExtraProminentConfiguration];
  uint64_t v5 = NSString;
  v6 = CKFrameworkBundle();
  int v7 = [v6 localizedStringForKey:@"CONVERSATIONS_SELECTED" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v8 = objc_msgSend(v5, "localizedStringWithFormat:", v7, a3);

  v9 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v10 = [v9 userInterfaceLayoutDirection];

  if (v10 == 1) {
    uint64_t v11 = @"\u200F";
  }
  else {
    uint64_t v11 = @"\u200E";
  }
  int v12 = [(__CFString *)v11 stringByAppendingString:v8];

  [v4 setText:v12];

  return v4;
}

- (id)_recentlyDeletedConfigurationWithSelectionCount:(int64_t)a3 secondaryText:(id)a4
{
  id v6 = a4;
  int v7 = [(CKSelectionViewController *)self _defaultConfigurationWithSelectionCount:a3];
  [v7 setSecondaryText:v6];

  if (CKIsRunningInMacCatalyst())
  {
    v8 = [v7 buttonProperties];
    [(CKSelectionViewController *)self _updatePropertiesAsRecoverButton:v8];

    v9 = [v7 secondaryButtonProperties];
    [(CKSelectionViewController *)self _updatePropertiesAsDeleteButton:v9];

    BOOL v10 = a3 > 0;
    uint64_t v11 = [v7 buttonProperties];
    [v11 setEnabled:v10];

    int v12 = [v7 secondaryButtonProperties];
    [v12 setEnabled:v10];
  }

  return v7;
}

- (id)_junkFilteringConfigurationWithSelectionCount:(int64_t)a3 secondaryText:(id)a4
{
  id v6 = a4;
  int v7 = [(CKSelectionViewController *)self _defaultConfigurationWithSelectionCount:a3];
  [v7 setSecondaryText:v6];

  if (CKIsRunningInMacCatalyst())
  {
    v8 = [v7 buttonProperties];
    if (a3 < 1) {
      [(CKSelectionViewController *)self _updatePropertiesAsDeleteAllButton:v8];
    }
    else {
      [(CKSelectionViewController *)self _updatePropertiesAsDeleteButton:v8];
    }

    v9 = [v7 buttonProperties];
    [v9 setEnabled:1];
  }

  return v7;
}

- (void)_updatePropertiesAsDeleteButton:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKFrameworkBundle();
  id v6 = [v5 localizedStringForKey:@"DELETE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [(CKSelectionViewController *)self _updatePropertiesAsDestructiveButton:v4 buttonText:v6];

  id v7 = [(CKSelectionViewController *)self _deleteAction];
  [v4 setPrimaryAction:v7];
}

- (void)_updatePropertiesAsDeleteAllButton:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKFrameworkBundle();
  id v6 = [v5 localizedStringForKey:@"DELETE_ALL" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [(CKSelectionViewController *)self _updatePropertiesAsDestructiveButton:v4 buttonText:v6];

  id v7 = [(CKSelectionViewController *)self _deleteAllAction];
  [v4 setPrimaryAction:v7];
}

- (void)_updatePropertiesAsDestructiveButton:(id)a3 buttonText:(id)a4
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F28E48];
  id v6 = a4;
  id v7 = a3;
  id v11 = (id)[[v5 alloc] initWithString:v6];

  uint64_t v8 = *MEMORY[0x1E4FB0700];
  v9 = [MEMORY[0x1E4F428B8] systemRedColor];
  objc_msgSend(v11, "addAttribute:value:range:", v8, v9, 0, objc_msgSend(v11, "length"));

  BOOL v10 = [v7 configuration];

  [v10 setAttributedTitle:v11];
}

- (id)_deleteAction
{
  id location = 0;
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4F426E8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__CKSelectionViewController__deleteAction__block_invoke;
  v5[3] = &unk_1E5620ED8;
  objc_copyWeak(&v6, &location);
  v3 = [v2 actionWithHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v3;
}

void __42__CKSelectionViewController__deleteAction__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained delegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 deleteButtonPressedOnSelectionViewController:v3];
}

- (id)_deleteAllAction
{
  id location = 0;
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4F426E8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__CKSelectionViewController__deleteAllAction__block_invoke;
  v5[3] = &unk_1E5620ED8;
  objc_copyWeak(&v6, &location);
  id v3 = [v2 actionWithHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v3;
}

void __45__CKSelectionViewController__deleteAllAction__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained delegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 deleteAllButtonPressedOnSelectionViewController:v3];
}

- (void)_updatePropertiesAsRecoverButton:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F28B18];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = CKFrameworkBundle();
  uint64_t v8 = [v7 localizedStringForKey:@"RECOVER" value:&stru_1EDE4CA38 table:@"ChatKit"];
  id v11 = (id)[v6 initWithString:v8];

  v9 = [v5 configuration];
  [v9 setAttributedTitle:v11];

  BOOL v10 = [(CKSelectionViewController *)self _recoverAction];
  [v5 setPrimaryAction:v10];
}

- (id)_recoverAction
{
  id location = 0;
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4F426E8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__CKSelectionViewController__recoverAction__block_invoke;
  v5[3] = &unk_1E5620ED8;
  objc_copyWeak(&v6, &location);
  id v3 = [v2 actionWithHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v3;
}

void __43__CKSelectionViewController__recoverAction__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained delegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 recoverButtonPressedOnSelectionViewController:v3];
}

- (void)handleNewComposeSelection
{
  id v2 = [(CKSelectionViewController *)self delegate];
  [v2 selectionViewControllerSelectedCompose];
}

- (CKSelectionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKSelectionViewControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end