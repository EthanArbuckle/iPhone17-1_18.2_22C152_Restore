@interface HUPresenceUserPickerItemModuleController
- (BOOL)canSelectDisabledItem:(id)a3;
- (BOOL)canSelectItem:(id)a3;
- (Class)cellClassForItem:(id)a3;
- (HUPresenceUserPickerItemModuleControllerDelegate)delegate;
- (id)_showAlertForConfirmationPrompt:(id)a3;
- (unint64_t)didSelectItem:(id)a3;
- (void)accessoryButtonTappedForItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUPresenceUserPickerItemModuleController

- (Class)cellClassForItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUItemModuleController *)self module];
  unint64_t v6 = [v5 itemTypeForItem:v4];

  if (v6 > 2)
  {
    v7 = 0;
  }
  else
  {
    v7 = objc_opt_class();
  }

  return (Class)v7;
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  id v26 = a3;
  id v7 = a4;
  v8 = [(HUItemModuleController *)self module];
  uint64_t v9 = [v8 itemTypeForItem:v7];

  switch(v9)
  {
    case 2:
      v10 = [(HUItemModuleController *)self module];
      id v11 = [v10 stateForUserItem:v7];

      id v12 = v26;
      v13 = [v7 latestResults];
      v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
      [v12 setUserName:v14];

      v15 = [v7 latestResults];
      v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];
      [v12 setDeviceName:v16];

      v17 = [v7 latestResults];
      v18 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F68C78]];
      [v12 setUserHandle:v18];

      v19 = [v7 latestResults];
      v20 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F68B40]];
      objc_msgSend(v12, "setChecked:", objc_msgSend(v20, "BOOLValue"));

      objc_msgSend(v12, "setLocationUnavailable:", objc_msgSend(v11, "isLocationAvailable") ^ 1);
LABEL_10:

      break;
    case 1:
      id v11 = v26;
      v21 = [v7 latestResults];
      v22 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
      [v11 setTitleText:v22];

      v23 = [v7 latestResults];
      v24 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F68B40]];
      objc_msgSend(v11, "setChecked:", objc_msgSend(v24, "BOOLValue"));

      if ([v11 checked]) {
        uint64_t v25 = 4;
      }
      else {
        uint64_t v25 = 0;
      }
      [v11 setAccessoryType:v25];
      goto LABEL_10;
    case 0:
      [v26 setHideIcon:1];
      break;
  }
}

- (BOOL)canSelectItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUItemModuleController *)self module];
  unint64_t v6 = [v5 itemTypeForItem:v4];

  return (v6 < 3) & (6u >> (v6 & 7));
}

- (BOOL)canSelectDisabledItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUItemModuleController *)self module];
  uint64_t v6 = [v5 itemTypeForItem:v4];

  return v6 == 2;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  uint64_t v6 = [(HUItemModuleController *)self module];
  id v7 = [v6 confirmationPromptForOptionItem:v4];

  if (v7)
  {
    uint64_t v8 = [(HUPresenceUserPickerItemModuleController *)self _showAlertForConfirmationPrompt:v7];

    v5 = (void *)v8;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__HUPresenceUserPickerItemModuleController_didSelectItem___block_invoke;
  v13[3] = &unk_1E638AA78;
  id v14 = v7;
  v15 = self;
  id v16 = v4;
  id v9 = v4;
  id v10 = v7;
  id v11 = (id)[v5 addSuccessBlock:v13];

  return 0;
}

void __58__HUPresenceUserPickerItemModuleController_didSelectItem___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  v3 = *(void **)(a1 + 32);
  if (v3 && [v3 resetLocationToHomeOnConfirmation])
  {
    id v4 = [*(id *)(a1 + 40) delegate];
    [v4 resetSelectedLocationToHomeForPresenceUserPickerItemModuleController:*(void *)(a1 + 40)];
  }
  v5 = [*(id *)(a1 + 40) module];
  uint64_t v6 = [v5 itemTypeForItem:*(void *)(a1 + 48)];

  if (v6 == 1)
  {
    uint64_t v8 = [*(id *)(a1 + 40) module];
    [v8 selectActivationOptionItem:*(void *)(a1 + 48)];
  }
  else
  {
    if (v6 != 2) {
      goto LABEL_12;
    }
    id v7 = [*(id *)(a1 + 40) module];
    uint64_t v8 = [v7 stateForUserItem:*(void *)(a1 + 48)];

    char v9 = [v8 isSelected];
    id v10 = [*(id *)(a1 + 40) module];
    id v11 = v10;
    uint64_t v12 = *(void *)(a1 + 48);
    if (v9) {
      [v10 deselectUserItem:v12];
    }
    else {
      [v10 selectUserItem:v12];
    }
  }
LABEL_12:
}

- (void)accessoryButtonTappedForItem:(id)a3
{
  id v7 = a3;
  id v4 = [(HUItemModuleController *)self module];
  uint64_t v5 = [v4 itemTypeForItem:v7];

  if (v5 == 1)
  {
    uint64_t v6 = [(HUItemModuleController *)self module];
    [v6 toggleExpandedForActivationOptionItem:v7];
  }
}

- (id)_showAlertForConfirmationPrompt:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F7A0D8];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = (void *)MEMORY[0x1E4F42728];
  uint64_t v8 = [v5 alertTitle];
  char v9 = [v5 alertBody];

  id v10 = [v7 alertControllerWithTitle:v8 message:v9 preferredStyle:1];

  id v11 = (void *)MEMORY[0x1E4F42720];
  uint64_t v12 = _HULocalizedStringWithDefaultValue(@"HUPresenceEventUnsupportedCustomLocationAlertActionContinue", @"HUPresenceEventUnsupportedCustomLocationAlertActionContinue", 1);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __76__HUPresenceUserPickerItemModuleController__showAlertForConfirmationPrompt___block_invoke;
  v29[3] = &unk_1E6385188;
  id v13 = v6;
  id v30 = v13;
  id v14 = [v11 actionWithTitle:v12 style:0 handler:v29];
  [v10 addAction:v14];

  v15 = (void *)MEMORY[0x1E4F42720];
  uint64_t v16 = _HULocalizedStringWithDefaultValue(@"HUPresenceEventUnsupportedCustomLocationAlertActionCancel", @"HUPresenceEventUnsupportedCustomLocationAlertActionCancel", 1);
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  id v26 = __76__HUPresenceUserPickerItemModuleController__showAlertForConfirmationPrompt___block_invoke_2;
  v27 = &unk_1E6385188;
  id v17 = v13;
  id v28 = v17;
  v18 = [v15 actionWithTitle:v16 style:1 handler:&v24];
  objc_msgSend(v10, "addAction:", v18, v24, v25, v26, v27);

  v19 = [(HUPresenceUserPickerItemModuleController *)self delegate];
  LOBYTE(v16) = objc_opt_respondsToSelector();

  if (v16)
  {
    v20 = [(HUPresenceUserPickerItemModuleController *)self delegate];
    [v20 presenceUserPickerItemModuleController:self presentViewController:v10];
  }
  v21 = v28;
  id v22 = v17;

  return v22;
}

uint64_t __76__HUPresenceUserPickerItemModuleController__showAlertForConfirmationPrompt___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithNoResult];
}

uint64_t __76__HUPresenceUserPickerItemModuleController__showAlertForConfirmationPrompt___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (HUPresenceUserPickerItemModuleControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUPresenceUserPickerItemModuleControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end