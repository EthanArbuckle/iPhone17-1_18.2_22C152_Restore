@interface HUUtilityOnboardingTAFTableViewController
- (BOOL)shouldManageTextFieldForItem:(id)a3;
- (CNContact)meContact;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUUtilityOnboardingTAFTableViewController)initWithContext:(id)a3 itemManager:(id)a4 tableViewStyle:(int64_t)a5;
- (TAFTableDelegate)delegate;
- (_TtC6HomeUI24UtilityOnboardingContext)context;
- (id)tafFieldForItem:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMeContact:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)textDidChange:(id)a3 forTextField:(id)a4 item:(id)a5;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
@end

@implementation HUUtilityOnboardingTAFTableViewController

- (HUUtilityOnboardingTAFTableViewController)initWithContext:(id)a3 itemManager:(id)a4 tableViewStyle:(int64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HUUtilityOnboardingTAFTableViewController;
  v10 = [(HUItemTableViewController *)&v13 initWithItemManager:a4 tableViewStyle:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_context, a3);
  }

  return v11;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 latestResults];
    int v12 = 138413058;
    objc_super v13 = self;
    __int16 v14 = 2080;
    v15 = "-[HUUtilityOnboardingTAFTableViewController cellClassForItem:indexPath:]";
    __int16 v16 = 2112;
    v17 = v9;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@:%s cell class for item %@ with index %@ ", (uint8_t *)&v12, 0x2Au);
  }
  v10 = objc_opt_class();

  return (Class)v10;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v8 latestResults];
    *(_DWORD *)buf = 138412802;
    v37 = self;
    __int16 v38 = 2080;
    v39 = "-[HUUtilityOnboardingTAFTableViewController setupCell:forItem:indexPath:]";
    __int16 v40 = 2112;
    v41 = v10;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@:%s Set up cell %@ ", buf, 0x20u);
  }
  id v11 = v7;
  int v12 = [v8 latestResults];
  objc_super v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  __int16 v14 = [v11 textField];
  [v14 setPlaceholder:v13];

  v15 = NSString;
  __int16 v16 = [v8 latestResults];
  uint64_t v17 = *MEMORY[0x1E4F68990];
  __int16 v18 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F68990]];
  id v19 = [v15 stringWithFormat:@"Home.OnboardingView.Utility.TAF.TextField.%@", v18];
  uint64_t v20 = [v11 textField];
  [v20 setAccessibilityIdentifier:v19];

  v21 = [MEMORY[0x1E4F428B8] tertiarySystemFillColor];
  [v11 setBackgroundColor:v21];

  v22 = [v8 latestResults];
  v23 = [v22 objectForKeyedSubscript:v17];

  v24 = +[TAFFieldName phone];
  LODWORD(v16) = [v23 isEqualToString:v24];

  if (v16) {
    goto LABEL_7;
  }
  v25 = +[TAFFieldName email];
  int v26 = [v23 isEqualToString:v25];

  if (v26)
  {
    v27 = [v11 textField];
    v28 = v27;
    uint64_t v29 = 7;
LABEL_8:
    [v27 setKeyboardType:v29];

    goto LABEL_9;
  }
  v30 = +[TAFFieldName postalCode];
  int v31 = [v23 isEqualToString:v30];

  if (v31)
  {
LABEL_7:
    v27 = [v11 textField];
    v28 = v27;
    uint64_t v29 = 2;
    goto LABEL_8;
  }
LABEL_9:
  v32 = [(HUUtilityOnboardingTAFTableViewController *)self context];
  v33 = [v32 tafResponses];
  v34 = [v33 objectForKeyedSubscript:v23];
  v35 = [v11 textField];
  [v35 setText:v34];
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v25.receiver = self;
  v25.super_class = (Class)HUUtilityOnboardingTAFTableViewController;
  [(HUItemTableViewController *)&v25 updateCell:v10 forItem:v11 indexPath:a5 animated:v6];
  int v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v13 = [v11 latestResults];
    *(_DWORD *)buf = 138412802;
    v27 = self;
    __int16 v28 = 2080;
    uint64_t v29 = "-[HUUtilityOnboardingTAFTableViewController updateCell:forItem:indexPath:animated:]";
    __int16 v30 = 2112;
    int v31 = v13;
    _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "%@:%s item with results%@ ", buf, 0x20u);
  }
  id v14 = v10;
  v15 = [v11 latestResults];
  __int16 v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  uint64_t v17 = [v14 textField];
  [v17 setPlaceholder:v16];

  __int16 v18 = [MEMORY[0x1E4F428B8] tertiarySystemFillColor];
  [v14 setBackgroundColor:v18];

  id v19 = [v11 latestResults];
  uint64_t v20 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F68990]];

  v21 = [(HUUtilityOnboardingTAFTableViewController *)self context];
  v22 = [v21 tafResponses];
  v23 = [v22 objectForKeyedSubscript:v20];
  v24 = [v14 textField];

  [v24 setText:v23];
}

- (BOOL)shouldManageTextFieldForItem:(id)a3
{
  return 1;
}

- (void)textDidChange:(id)a3 forTextField:(id)a4 item:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [a5 latestResults];
  id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F68990]];
  id v10 = [(HUUtilityOnboardingTAFTableViewController *)self tafFieldForItem:v9];

  if (v10)
  {
    id v11 = [(HUUtilityOnboardingTAFTableViewController *)self context];
    [v11 setResponseFor:v10 value:v7];

    BOOL v12 = [(UtilityOnboardingContext *)self->_context allRequiredFieldsComplete];
    objc_super v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 138412802;
      __int16 v16 = self;
      __int16 v17 = 2080;
      __int16 v18 = "-[HUUtilityOnboardingTAFTableViewController textDidChange:forTextField:item:]";
      __int16 v19 = 1024;
      BOOL v20 = v12;
      _os_log_debug_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEBUG, "%@:%s ENABLING BUTTON --> %{BOOL}d", (uint8_t *)&v15, 0x1Cu);
    }

    id v14 = [(HUUtilityOnboardingTAFTableViewController *)self delegate];
    [v14 didCompleteAllFields:v12];
  }
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4 = a3;
  id v5 = [(HUUtilityOnboardingTAFTableViewController *)self delegate];
  [v5 selectedTextField:v4];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HUUtilityOnboardingTAFTableViewController;
  id v5 = a4;
  id v6 = a3;
  [(HUItemTableViewController *)&v7 tableView:v6 didSelectRowAtIndexPath:v5];
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v5, 1, v7.receiver, v7.super_class);
}

- (id)tafFieldForItem:(id)a3
{
  id v4 = a3;
  id v5 = [(UtilityOnboardingContext *)self->_context config];
  id v6 = [v5 fields];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__HUUtilityOnboardingTAFTableViewController_tafFieldForItem___block_invoke;
  v10[3] = &unk_1E638D3C0;
  id v11 = v4;
  id v7 = v4;
  id v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  return v8;
}

uint64_t __61__HUUtilityOnboardingTAFTableViewController_tafFieldForItem___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 formKey];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (TAFTableDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TAFTableDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC6HomeUI24UtilityOnboardingContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (CNContact)meContact
{
  return self->_meContact;
}

- (void)setMeContact:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meContact, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end