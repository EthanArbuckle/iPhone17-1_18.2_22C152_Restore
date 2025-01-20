@interface HUUtilityOnboardingOTPSelectionTableViewController
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUUtilityOnboardingOTPSelectionTableViewController)initWithItemManager:(id)a3;
- (OTPSelectionTableDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation HUUtilityOnboardingOTPSelectionTableViewController

- (HUUtilityOnboardingOTPSelectionTableViewController)initWithItemManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUUtilityOnboardingOTPSelectionTableViewController;
  return [(HUItemTableViewController *)&v4 initWithItemManager:a3 tableViewStyle:1];
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 latestResults];
    int v12 = 138413058;
    v13 = self;
    __int16 v14 = 2080;
    v15 = "-[HUUtilityOnboardingOTPSelectionTableViewController cellClassForItem:indexPath:]";
    __int16 v16 = 2112;
    v17 = v9;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@:%s cell class for item %@ with index %@", (uint8_t *)&v12, 0x2Au);
  }
  v10 = objc_opt_class();

  return (Class)v10;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v18 = a3;
  id v7 = a4;
  v8 = [v7 latestResults];
  v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F68B40]];

  if (v9)
  {
    [v18 setAccessoryType:3];
    v10 = [(HUUtilityOnboardingOTPSelectionTableViewController *)self delegate];
    [v10 tableView:self didSelectOTPMethod:v7];
  }
  [v18 setHideIcon:1];
  v11 = [v7 latestResults];
  int v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];
  [v18 setValueText:v12];

  v13 = NSString;
  __int16 v14 = [v7 latestResults];
  v15 = [v14 objectForKeyedSubscript:@"factor-type"];
  __int16 v16 = [v13 stringWithFormat:@"Home.OnboardingView.Utility.OTP.%@", v15];
  [v18 setAccessibilityIdentifier:v16];

  v17 = [MEMORY[0x1E4F428B8] tertiarySystemFillColor];
  [v18 setBackgroundColor:v17];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v8 = [(HUUtilityOnboardingOTPSelectionTableViewController *)self tableView];
  v9 = [v8 indexPathsForVisibleRows];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v29;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v28 + 1) + 8 * v13);
        objc_opt_class();
        v15 = [v6 cellForRowAtIndexPath:v14];
        if (objc_opt_isKindOfClass()) {
          __int16 v16 = v15;
        }
        else {
          __int16 v16 = 0;
        }
        id v17 = v16;

        [v17 setAccessoryType:0];
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v11);
  }

  v27.receiver = self;
  v27.super_class = (Class)HUUtilityOnboardingOTPSelectionTableViewController;
  [(HUItemTableViewController *)&v27 tableView:v6 didSelectRowAtIndexPath:v7];
  [v6 deselectRowAtIndexPath:v7 animated:1];
  objc_opt_class();
  id v18 = [v6 cellForRowAtIndexPath:v7];
  if (objc_opt_isKindOfClass()) {
    id v19 = v18;
  }
  else {
    id v19 = 0;
  }
  id v20 = v19;

  [v20 setAccessoryType:3];
  v21 = [(HUItemTableViewController *)self itemManager];
  v22 = [v21 displayedItemAtIndexPath:v7];

  v23 = HFLogForCategory();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = [v22 latestResults];
    v25 = [v24 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    *(_DWORD *)buf = 138412546;
    v33 = self;
    __int16 v34 = 2112;
    v35 = v25;
    _os_log_impl(&dword_1BE345000, v23, OS_LOG_TYPE_DEFAULT, "%@: ROW OPTION User tapped item: %@", buf, 0x16u);
  }
  v26 = [(HUUtilityOnboardingOTPSelectionTableViewController *)self delegate];
  [v26 tableView:self didSelectOTPMethod:v22];
}

- (OTPSelectionTableDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (OTPSelectionTableDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end