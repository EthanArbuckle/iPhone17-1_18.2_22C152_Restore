@interface HUEventTypePickerViewController
- (BOOL)shouldHideFooterBelowSection:(int64_t)a3;
- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUEventTypePickerViewController)initWithFlow:(id)a3 stepIdentifier:(id)a4;
- (HUEventUIFlow)flow;
- (NSString)stepIdentifier;
- (void)_cancel:(id)a3;
- (void)setFlow:(id)a3;
- (void)setStepIdentifier:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
@end

@implementation HUEventTypePickerViewController

- (HUEventTypePickerViewController)initWithFlow:(id)a3 stepIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [HUEventTypePickerItemManager alloc];
  v9 = [v6 triggerBuilder];
  v10 = [(HUEventTypePickerItemManager *)v8 initWithTriggerBuilder:v9 delegate:self];

  v19.receiver = self;
  v19.super_class = (Class)HUEventTypePickerViewController;
  v11 = [(HUItemTableViewController *)&v19 initWithItemManager:v10 tableViewStyle:1];
  v12 = v11;
  if (v11)
  {
    [(HUEventTypePickerViewController *)v11 setFlow:v6];
    [(HUEventTypePickerViewController *)v12 setStepIdentifier:v7];
    v13 = _HULocalizedStringWithDefaultValue(@"HUEventTypePickerTitle", @"HUEventTypePickerTitle", 1);
    [(HUEventTypePickerViewController *)v12 setTitle:v13];

    v14 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:v12 action:sel__cancel_];
    v15 = [(HUEventTypePickerViewController *)v12 navigationItem];
    [v15 setLeftBarButtonItem:v14];

    v16 = _HULocalizedStringWithDefaultValue(@"HUBackButtonTitle", @"HUBackButtonTitle", 1);
    v17 = [(HUEventTypePickerViewController *)v12 navigationItem];
    [v17 setBackButtonTitle:v16];
  }
  return v12;
}

- (void)_cancel:(id)a3
{
  id v5 = [(HUEventTypePickerViewController *)self flow];
  v4 = [(HUEventTypePickerViewController *)self stepIdentifier];
  [v5 viewController:self didCancelStepWithIdentifier:v4];
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  objc_opt_isKindOfClass();

  id v5 = objc_opt_class();

  return (Class)v5;
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = [v11 latestResults];
    v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];
    uint64_t v15 = [v14 BOOLValue];

    id v16 = v10;
    [v16 setDisabled:v15];
    [v16 setAccessoryType:v15 ^ 1];
    if (v15) {
      double v17 = 0.200000003;
    }
    else {
      double v17 = 1.0;
    }
    [v16 setIconAlpha:v17];
    [v16 setTextAlpha:v17];
    [v16 setIconDisplayStyle:1];
  }
  v18.receiver = self;
  v18.super_class = (Class)HUEventTypePickerViewController;
  [(HUItemTableViewController *)&v18 updateCell:v10 forItem:v11 indexPath:v12 animated:v6];
}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  id v4 = [(HUItemTableViewController *)self itemManager];
  id v5 = [v4 displayedSectionIdentifierForSectionIndex:a3];
  char v6 = [v5 isEqualToString:@"HUEventTypePickerSectionIdentifierInstructions"];

  return v6;
}

- (BOOL)shouldHideFooterBelowSection:(int64_t)a3
{
  id v4 = [(HUItemTableViewController *)self itemManager];
  id v5 = [v4 displayedSectionIdentifierForSectionIndex:a3];
  char v6 = [v5 isEqualToString:@"HUEventTypePickerSectionIdentifierInstructions"];

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)HUEventTypePickerViewController;
  [(HUItemTableViewController *)&v27 tableView:v6 didSelectRowAtIndexPath:v7];
  v8 = [(HUItemTableViewController *)self itemManager];
  v9 = [v8 displayedItemAtIndexPath:v7];

  id v10 = [v9 latestResults];
  id v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];
  int v12 = [v11 BOOLValue];

  if (v12
    || ([(HUItemTableViewController *)self itemManager],
        v13 = objc_claimAutoreleasedReturnValue(),
        [v13 instructionsItem],
        v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        v9 == v14))
  {
    [v6 deselectRowAtIndexPath:v7 animated:0];
  }
  else
  {
    [v6 deselectRowAtIndexPath:v7 animated:1];
    uint64_t v15 = [(HUItemTableViewController *)self itemManager];
    id v16 = [v15 timerEventItem];

    if (v9 == v16)
    {
      uint64_t v25 = 3;
      goto LABEL_14;
    }
    double v17 = [(HUItemTableViewController *)self itemManager];
    objc_super v18 = [v17 leavingLocationEventItem];

    if (v9 == v18)
    {
      uint64_t v25 = 2;
      goto LABEL_14;
    }
    objc_super v19 = [(HUItemTableViewController *)self itemManager];
    v20 = [v19 arrivingAtLocationEventItem];

    if (v9 == v20)
    {
      uint64_t v25 = 1;
      goto LABEL_14;
    }
    v21 = [(HUItemTableViewController *)self itemManager];
    v22 = [v21 characteristicEventItem];

    if (v9 == v22)
    {
      uint64_t v25 = 4;
      goto LABEL_14;
    }
    v23 = [(HUItemTableViewController *)self itemManager];
    v24 = [v23 alarmEventItem];

    if (v9 == v24)
    {
      uint64_t v25 = 5;
LABEL_14:
      v26 = [(HUEventTypePickerViewController *)self flow];
      [v26 viewController:self didSelectEventType:v25];
    }
  }
}

- (HUEventUIFlow)flow
{
  return self->_flow;
}

- (void)setFlow:(id)a3
{
}

- (NSString)stepIdentifier
{
  return self->_stepIdentifier;
}

- (void)setStepIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepIdentifier, 0);

  objc_storeStrong((id *)&self->_flow, 0);
}

@end