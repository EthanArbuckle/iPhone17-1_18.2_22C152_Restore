@interface HUMediaAccessControlEditorModuleController
- (BOOL)textFieldShouldReturn:(id)a3;
- (Class)cellClassForItem:(id)a3;
- (HUMediaAccessControlEditorModuleController)initWithModule:(id)a3;
- (HUMediaAccessControlEditorModuleControllerDelegate)delegate;
- (id)updateAccessControlDescriptor:(id)a3;
- (unint64_t)didSelectItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUMediaAccessControlEditorModuleController

- (HUMediaAccessControlEditorModuleController)initWithModule:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUMediaAccessControlEditorModuleController;
  return [(HUItemModuleController *)&v4 initWithModule:a3];
}

- (id)updateAccessControlDescriptor:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(HUItemModuleController *)self module];
  v6 = [v5 updateAccessControlDescriptor:v4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__HUMediaAccessControlEditorModuleController_updateAccessControlDescriptor___block_invoke;
  v10[3] = &unk_1E6389AC0;
  objc_copyWeak(&v12, &location);
  id v7 = v4;
  id v11 = v7;
  v8 = [v6 addCompletionBlock:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
}

void __76__HUMediaAccessControlEditorModuleController_updateAccessControlDescriptor___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [WeakRetained delegate];
    [v4 accessControlEditorModuleController:WeakRetained didUpdateAccessControl:*(void *)(a1 + 32)];
  }
}

- (Class)cellClassForItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUItemModuleController *)self module];
  v6 = [v5 accessControlEditorItemProvider];
  id v7 = [v6 passwordEnableItem];

  if (v7 != v4)
  {
    v8 = [(HUItemModuleController *)self module];
    v9 = [v8 accessControlEditorItemProvider];
    [v9 passwordItem];
  }
  v10 = objc_opt_class();

  return (Class)v10;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  id v7 = [(HUItemModuleController *)self module];
  v8 = [v7 accessControlEditorItemProvider];
  id v9 = [v8 passwordItem];

  if (v9 == v6)
  {
    objc_opt_class();
    id v10 = v17;
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
    id v12 = v11;

    v13 = [v12 valueTextField];
    [v13 setDelegate:self];

    v14 = _HULocalizedStringWithDefaultValue(@"HUMediaAccessControlPasswordPlaceholder", @"HUMediaAccessControlPasswordPlaceholder", 1);
    v15 = [v12 valueTextField];
    [v15 setPlaceholder:v14];

    v16 = [v12 valueTextField];
    [v16 setAutocorrectionType:1];
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  id v32 = a3;
  id v7 = a4;
  v8 = [(HUItemModuleController *)self module];
  id v9 = [v8 accessControlEditorItemProvider];
  id v10 = [v9 passwordItem];

  if (v10 == v7)
  {
    objc_opt_class();
    id v21 = v32;
    if (objc_opt_isKindOfClass()) {
      v22 = v21;
    }
    else {
      v22 = 0;
    }
    id v19 = v22;

    v23 = [v7 latestResults];
    v24 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F67FA0]];
    v25 = [v19 valueTextField];
    [v25 setText:v24];

    v26 = [MEMORY[0x1E4F428B8] systemGrayColor];
    v27 = [v19 valueTextField];
    [v27 setTextColor:v26];

    goto LABEL_13;
  }
  id v11 = [(HUItemModuleController *)self module];
  id v12 = [v11 accessControlEditorItemProvider];
  id v13 = [v12 passwordEnableItem];

  if (v13 == v7)
  {
    objc_opt_class();
    id v28 = v32;
    if (objc_opt_isKindOfClass()) {
      v29 = v28;
    }
    else {
      v29 = 0;
    }
    id v19 = v29;

    v30 = [v7 latestResults];
    v31 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4F67FA0]];
    objc_msgSend(v19, "setOn:", objc_msgSend(v31, "BOOLValue"));

    [v19 setDelegate:self];
LABEL_13:
    [v19 setSelectionStyle:0];
    goto LABEL_15;
  }
  v14 = [v7 latestResults];
  v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v16 = [v32 textLabel];
  [v16 setText:v15];

  id v17 = [v7 latestResults];
  v18 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F68B40]];
  LODWORD(v16) = [v18 BOOLValue];

  if (v16)
  {
    [v32 setAccessoryType:3];
    objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    v20 = [v32 textLabel];
    [v20 setTextColor:v19];
  }
  else
  {
    [v32 setAccessoryType:0];
    id v19 = [v32 textLabel];
    [v19 setTextColor:0];
  }
LABEL_15:
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUItemModuleController *)self module];
  id v6 = [v5 accessControlEditorItemProvider];
  uint64_t v7 = [v6 passwordItem];
  if ((id)v7 == v4)
  {

    goto LABEL_6;
  }
  v8 = (void *)v7;
  id v9 = [(HUItemModuleController *)self module];
  id v10 = [v9 accessControlEditorItemProvider];
  id v11 = [v10 passwordEnableItem];

  if (v11 != v4)
  {
    id v12 = [(HUItemModuleController *)self module];
    id v13 = [v12 accessControlEditorItemProvider];
    v14 = [v13 accessControlItems];
    int v15 = [v14 containsObject:v4];

    if (v15)
    {
      v16 = [(HUItemModuleController *)self module];
      id v17 = [v16 accessControlEditorItemProvider];
      v18 = [v17 accessControlItems];
      uint64_t v19 = [v18 indexOfObject:v4];

      v20 = [(HUItemModuleController *)self module];
      id v21 = [v20 home];
      v5 = objc_msgSend(v21, "hf_accessControlDescriptor");

      v22 = (void *)MEMORY[0x1E4F69270];
      uint64_t v23 = [v5 accessRequiresPassword];
      v24 = [v5 accessPassword];
      id v6 = [v22 descriptorWithAccess:v19 requiresPassword:v23 password:v24];

      id v25 = [(HUMediaAccessControlEditorModuleController *)self updateAccessControlDescriptor:v6];
LABEL_6:
    }
  }

  return 0;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  v5 = [v4 text];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F2E7F8];
    v8 = [v4 text];
    id v24 = 0;
    [v7 isValidMediaPassword:v8 error:&v24];
    id v9 = v24;

    BOOL v10 = v9 == 0;
    if (v9)
    {
      id v11 = [MEMORY[0x1E4F69110] sharedHandler];
      [v11 handleError:v9 operationType:*MEMORY[0x1E4F68798] options:0 retryBlock:0 cancelBlock:0];
    }
    else
    {
      int v15 = [(HUItemModuleController *)self module];
      v16 = [v15 home];
      id v11 = objc_msgSend(v16, "hf_accessControlDescriptor");

      id v17 = (void *)MEMORY[0x1E4F69270];
      uint64_t v18 = [v11 access];
      uint64_t v19 = [v11 accessRequiresPassword];
      v20 = [v4 text];
      id v21 = [v17 descriptorWithAccess:v18 requiresPassword:v19 password:v20];

      id v22 = [(HUMediaAccessControlEditorModuleController *)self updateAccessControlDescriptor:v21];
      [v4 endEditing:1];
    }
  }
  else
  {
    id v12 = [(HUItemModuleController *)self module];
    id v13 = [v12 home];
    objc_msgSend(v13, "hf_accessControlDescriptor");
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    v14 = [v9 accessPassword];
    [v4 setText:v14];

    BOOL v10 = 1;
    [v4 endEditing:1];
  }

  return v10;
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(HUItemModuleController *)self module];
  v8 = [v7 home];
  id v9 = objc_msgSend(v8, "hf_accessControlDescriptor");

  BOOL v10 = [v9 accessPassword];
  if (!v10)
  {
    id v25 = 0;
    BOOL v10 = [MEMORY[0x1E4F2E7F8] generateMediaPasswordWithError:&v25];
    id v11 = v25;
    if (v11)
    {
      id v12 = [MEMORY[0x1E4F69110] sharedHandler];
      [v12 logError:v11 operationDescription:@"API failed to generate a random 6 digit password"];

      BOOL v10 = @"000000";
    }
  }
  id v13 = objc_msgSend(MEMORY[0x1E4F69270], "descriptorWithAccess:requiresPassword:password:", objc_msgSend(v9, "access"), v4, v10);
  id v14 = [(HUMediaAccessControlEditorModuleController *)self updateAccessControlDescriptor:v13];
  objc_opt_class();
  int v15 = [(HUMediaAccessControlEditorModuleController *)self delegate];
  if (objc_opt_isKindOfClass()) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  if (v17)
  {
    objc_opt_class();
    uint64_t v18 = [v6 item];
    uint64_t v19 = [v18 latestResults];
    v20 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F68AC0]];
    if (objc_opt_isKindOfClass()) {
      id v21 = v20;
    }
    else {
      id v21 = 0;
    }
    id v22 = v21;

    uint64_t v23 = (void *)MEMORY[0x1E4F68EE0];
    id v24 = [v6 item];
    [v23 sendSwitchCellToggleEventForItem:v24 isOn:v4 title:v22 fromSourceViewController:v17];
  }
}

- (HUMediaAccessControlEditorModuleControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUMediaAccessControlEditorModuleControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end