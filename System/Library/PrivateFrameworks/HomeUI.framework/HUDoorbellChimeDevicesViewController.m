@interface HUDoorbellChimeDevicesViewController
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUDoorbellChimeDevicesItemManager)doorbellChimeDevicesItemManager;
- (HUDoorbellChimeDevicesViewController)init;
- (HUDoorbellChimeDevicesViewController)initWithAccessorySettingItem:(id)a3;
- (void)setDoorbellChimeDevicesItemManager:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
@end

@implementation HUDoorbellChimeDevicesViewController

- (HUDoorbellChimeDevicesViewController)init
{
  v3 = [(HFItemManager *)[HUDoorbellChimeDevicesItemManager alloc] initWithDelegate:self];
  v7.receiver = self;
  v7.super_class = (Class)HUDoorbellChimeDevicesViewController;
  v4 = [(HUItemTableViewController *)&v7 initWithItemManager:v3 tableViewStyle:1];
  if (v4)
  {
    v5 = _HULocalizedStringWithDefaultValue(@"HUDoorbellChimeDevices_Title", @"HUDoorbellChimeDevices_Title", 1);
    [(HUDoorbellChimeDevicesViewController *)v4 setTitle:v5];

    objc_storeStrong((id *)&v4->_doorbellChimeDevicesItemManager, v3);
  }

  return v4;
}

- (HUDoorbellChimeDevicesViewController)initWithAccessorySettingItem:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithAccessorySettingItem_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUDoorbellChimeDevicesViewController.m", 46, @"%s is unavailable; use %@ instead",
    "-[HUDoorbellChimeDevicesViewController initWithAccessorySettingItem:]",
    v6);

  return 0;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v6 = a3;
  objc_opt_class();
  id v9 = v6;
  if (objc_opt_isKindOfClass()) {
    objc_super v7 = v9;
  }
  else {
    objc_super v7 = 0;
  }
  id v8 = v7;

  [v8 setDelegate:self];
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_opt_class();
  objc_super v7 = [v6 item];
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  v10 = [v9 sourceItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

LABEL_7:
    v13 = [(HUDoorbellChimeDevicesViewController *)self doorbellChimeDevicesItemManager];
    v14 = [v6 item];
    v15 = [v13 enableDoorbellChime:v4 forItem:v14];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __61__HUDoorbellChimeDevicesViewController_switchCell_didTurnOn___block_invoke;
    v17[3] = &unk_1E63899B8;
    id v18 = v6;
    BOOL v19 = v4;
    id v16 = (id)[v15 addFailureBlock:v17];

    goto LABEL_8;
  }
  v11 = [v9 sourceItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    goto LABEL_7;
  }
LABEL_8:
}

uint64_t __61__HUDoorbellChimeDevicesViewController_switchCell_didTurnOn___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) setOn:*(unsigned char *)(result + 40) == 0 animated:1];
  }
  return result;
}

- (HUDoorbellChimeDevicesItemManager)doorbellChimeDevicesItemManager
{
  return self->_doorbellChimeDevicesItemManager;
}

- (void)setDoorbellChimeDevicesItemManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end