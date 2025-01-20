@interface HUNameItemModuleController
- (BOOL)nameFieldHasClearButton;
- (BOOL)shouldManageTextFieldForItem:(id)a3;
- (BOOL)shouldUseAccessoryName;
- (BOOL)showIcon;
- (BOOL)supportsCustomIconEditing;
- (Class)cellClassForItem:(id)a3;
- (Class)collectionCellClassForItem:(id)a3;
- (HFNamingComponents)namingComponent;
- (HUNameItemModule)nameModule;
- (HUNameItemModuleController)initWithModule:(id)a3 host:(id)a4;
- (id)_builderName;
- (id)currentTextForTextField:(id)a3 item:(id)a4;
- (id)placeholderTextForTextField:(id)a3 item:(id)a4;
- (id)prepareForCommit;
- (void)_cleanupTextFieldSetBuilderName;
- (void)_setBuilderName:(id)a3;
- (void)cancelNameEdit;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)iconPicker:(id)a3 didPickIconDescriptor:(id)a4;
- (void)iconPickerDidCancel:(id)a3;
- (void)nameAndIconEditorCellDidTapIcon:(id)a3;
- (void)setNameFieldHasClearButton:(BOOL)a3;
- (void)setNameModule:(id)a3;
- (void)setNamingComponent:(id)a3;
- (void)setShouldUseAccessoryName:(BOOL)a3;
- (void)setShowIcon:(BOOL)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)textFieldDidEndEditing:(id)a3 item:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUNameItemModuleController

- (HUNameItemModuleController)initWithModule:(id)a3 host:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HUNameItemModuleController;
  v8 = [(HUItemModuleController *)&v13 initWithModule:v6];
  v9 = v8;
  if (v8)
  {
    [(HUNameItemModuleController *)v8 setNameModule:v6];
    v10 = [v6 sourceItem];
    v11 = [v10 namingComponentForHomeKitObject];
    [(HUNameItemModuleController *)v9 setNamingComponent:v11];

    [(HUItemModuleController *)v9 setHost:v7];
    [(HUNameItemModuleController *)v9 setNameFieldHasClearButton:0];
    [(HUNameItemModuleController *)v9 setShowIcon:1];
    [(HUNameItemModuleController *)v9 setShouldUseAccessoryName:0];
  }

  return v9;
}

- (void)setShouldUseAccessoryName:(BOOL)a3
{
  if (a3)
  {
    v5 = [(HUNameItemModuleController *)self nameModule];
    id v6 = [v5 sourceItem];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v8 = [(HUNameItemModuleController *)self nameModule];
      v9 = [v8 sourceItem];
      v10 = [v9 service];
      v11 = [v10 accessory];

      v12 = [MEMORY[0x1E4F69300] namingComponentFromAccessory:v11];
      [(HUNameItemModuleController *)self setNamingComponent:v12];
    }
  }
  self->_shouldUseAccessoryName = a3;
}

- (Class)cellClassForItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUNameItemModuleController *)self nameModule];
  id v6 = [v5 nameAndIconItem];

  if (v6 == v4) {
    [(HUNameItemModuleController *)self showIcon];
  }
  id v7 = objc_opt_class();

  return (Class)v7;
}

- (Class)collectionCellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)HUNameItemModuleController;
  id v5 = a4;
  id v6 = a3;
  [(HUItemModuleController *)&v10 configureCell:v6 forItem:v5];
  id v7 = objc_msgSend(MEMORY[0x1E4F42B58], "cellConfiguration", v10.receiver, v10.super_class);
  v8 = [v5 latestResults];

  v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  [v7 setText:v9];

  [v6 setContentConfiguration:v7];
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v17 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = objc_opt_class();
    id v6 = v17;
    if (v6)
    {
      if (objc_opt_isKindOfClass()) {
        id v7 = v6;
      }
      else {
        id v7 = 0;
      }
      v8 = v6;
      if (v7) {
        goto LABEL_9;
      }
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_super v10 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v9 handleFailureInFunction:v10, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v5, objc_opt_class() file lineNumber description];
    }
    v8 = 0;
LABEL_9:

    [v8 setDelegate:self];
    v11 = +[HUGridSceneCellLayoutOptions defaultOptionsForCellSizeSubclass:1];
    v12 = [v11 font];
    [v8 setTextFieldFont:v12];

    BOOL v13 = [(HUNameItemModuleController *)self supportsCustomIconEditing];
    v14 = [v8 iconButton];
    [v14 setSelected:v13];

    BOOL v15 = [(HUNameItemModuleController *)self supportsCustomIconEditing];
    v16 = [v8 iconButton];
    [v16 setUserInteractionEnabled:v15];
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  id v15 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v15;
    BOOL v7 = [(HUNameItemModuleController *)self supportsCustomIconEditing];
    v8 = [v6 iconButton];
    [v8 setSelected:v7];

    BOOL v9 = [(HUNameItemModuleController *)self supportsCustomIconEditing];
    objc_super v10 = [v6 iconButton];
    [v10 setUserInteractionEnabled:v9];

LABEL_8:
    if ([(HUNameItemModuleController *)self nameFieldHasClearButton]) {
      uint64_t v13 = 3;
    }
    else {
      uint64_t v13 = 0;
    }
    v14 = [v6 textField];

    [v14 setClearButtonMode:v13];
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v11 = v15;
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
    id v6 = v12;

    goto LABEL_8;
  }
LABEL_12:
}

- (BOOL)supportsCustomIconEditing
{
  v2 = [(HUNameItemModuleController *)self nameModule];
  v3 = [v2 sourceItemBuilder];
  if ([v3 conformsToProtocol:&unk_1F1AD8F70]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5
    && (objc_opt_respondsToSelector() & 1) != 0
    && ([v5 home],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = objc_msgSend(v6, "hf_currentUserIsRestrictedGuest"),
        v6,
        (v7 & 1) == 0))
  {
    objc_super v10 = [v5 availableIconDescriptors];
    BOOL v8 = (unint64_t)[v10 count] > 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)shouldManageTextFieldForItem:(id)a3
{
  return 1;
}

- (id)placeholderTextForTextField:(id)a3 item:(id)a4
{
  id v4 = [(HUNameItemModuleController *)self namingComponent];
  id v5 = [v4 placeholderText];

  return v5;
}

- (id)currentTextForTextField:(id)a3 item:(id)a4
{
  id v4 = [(HUNameItemModuleController *)self namingComponent];
  id v5 = [v4 textFieldDisplayText];

  return v5;
}

- (void)textFieldDidEndEditing:(id)a3 item:(id)a4
{
  id v5 = a3;
  id v6 = [(HUNameItemModuleController *)self prepareForCommit];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__HUNameItemModuleController_textFieldDidEndEditing_item___block_invoke;
  v9[3] = &unk_1E6384CE0;
  id v10 = v5;
  id v11 = self;
  id v7 = v5;
  id v8 = (id)[v6 addCompletionBlock:v9];
}

void __58__HUNameItemModuleController_textFieldDidEndEditing_item___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) _builderName];
  [*(id *)(a1 + 32) setText:v2];
}

- (void)cancelNameEdit
{
  v3 = [(HUNameItemModuleController *)self nameModule];
  id v4 = [v3 nameAndIconItem];
  id v5 = [(HUItemModuleController *)self textFieldForVisibleItem:v4];

  [v5 resignFirstResponder];
}

- (id)prepareForCommit
{
  [(HUNameItemModuleController *)self _cleanupTextFieldSetBuilderName];
  v3 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  id v4 = [v3 homeManager];

  id v5 = objc_opt_new();
  id v6 = [(HUNameItemModuleController *)self nameModule];
  id v7 = [v6 sourceItemBuilder];
  if ([v7 conformsToProtocol:&unk_1F1AD8F70]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  id v10 = [(HUNameItemModuleController *)self _builderName];
  id v11 = [(HUNameItemModuleController *)self nameModule];
  v12 = [v11 nameAndIconItem];
  uint64_t v13 = [(HUItemModuleController *)self textFieldForVisibleItem:v12];

  if (v9)
  {
    if (v10)
    {
      v14 = [v13 text];
      id v15 = [(HUNameItemModuleController *)self namingComponent];
      v16 = [v15 name];
      int v17 = [v14 isEqualToString:v16];

      if (!v17)
      {
        v18 = [v9 home];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __46__HUNameItemModuleController_prepareForCommit__block_invoke;
        v22[3] = &unk_1E6384D30;
        id v23 = v5;
        id v24 = v10;
        [v4 checkName:v24 inHome:v18 withValidationOptions:5 completionHandler:v22];

        goto LABEL_10;
      }
    }
  }
  else
  {
    v19 = [(HUNameItemModuleController *)self nameModule];
    v20 = [v19 sourceItem];
    NSLog(&cfstr_BuilderForItem.isa, v20);
  }
  [v5 finishWithNoResult];
LABEL_10:

  return v5;
}

void __46__HUNameItemModuleController_prepareForCommit__block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__HUNameItemModuleController_prepareForCommit__block_invoke_2;
  v8[3] = &unk_1E6384D08;
  char v12 = a2;
  id v9 = *(id *)(a1 + 32);
  id v10 = v6;
  id v11 = *(id *)(a1 + 40);
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __46__HUNameItemModuleController_prepareForCommit__block_invoke_2(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56))
  {
    id v2 = *(void **)(a1 + 32);
    return [v2 finishWithNoResult];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F69110] sharedHandler];
    uint64_t v5 = *MEMORY[0x1E4F687F0];
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v9 = *MEMORY[0x1E4F68420];
    v10[0] = v6;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    [v4 handleError:v7 operationType:v5 options:v8 retryBlock:0 cancelBlock:0];

    return [*(id *)(a1 + 32) finishWithError:*(void *)(a1 + 40)];
  }
}

- (void)_cleanupTextFieldSetBuilderName
{
  v3 = [(HUNameItemModuleController *)self nameModule];
  id v4 = [v3 nameAndIconItem];
  id v8 = [(HUItemModuleController *)self textFieldForVisibleItem:v4];

  uint64_t v5 = [(HUNameItemModuleController *)self namingComponent];
  uint64_t v6 = [v8 text];
  uint64_t v7 = [v5 homeKitSafeStringForString:v6];

  [v8 setText:v7];
  [(HUNameItemModuleController *)self _setBuilderName:v7];
}

- (void)_setBuilderName:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = [(HUNameItemModuleController *)self nameModule];
  uint64_t v6 = [v5 sourceItemBuilder];
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v12 = v7;

  if ([(HUNameItemModuleController *)self shouldUseAccessoryName] && v12)
  {
    [v12 setAccessoryName:v4];
    [v12 setName:v4];
  }
  else
  {
    id v8 = [(HUNameItemModuleController *)self nameModule];
    uint64_t v9 = [v8 sourceItemBuilder];
    if ([v9 conformsToProtocol:&unk_1F1AD8F70]) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    [v11 setName:v4];
  }
}

- (id)_builderName
{
  objc_opt_class();
  v3 = [(HUNameItemModuleController *)self nameModule];
  id v4 = [v3 sourceItemBuilder];
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  if ([(HUNameItemModuleController *)self shouldUseAccessoryName] && v6)
  {
    uint64_t v7 = [v6 accessoryName];
  }
  else
  {
    id v8 = [(HUNameItemModuleController *)self nameModule];
    uint64_t v9 = [v8 sourceItemBuilder];
    if ([v9 conformsToProtocol:&unk_1F1AD8F70]) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    uint64_t v7 = [v11 name];
  }

  return v7;
}

- (void)nameAndIconEditorCellDidTapIcon:(id)a3
{
  if ([(HUNameItemModuleController *)self supportsCustomIconEditing])
  {
    id v4 = [(HUNameItemModuleController *)self nameModule];
    uint64_t v5 = [v4 sourceItemBuilder];
    char v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = [(HUNameItemModuleController *)self nameModule];
      id v8 = [v7 sourceItemBuilder];
      NSLog(&cfstr_ServiceLikeBui.isa, v8);
    }
    uint64_t v9 = [(HUNameItemModuleController *)self nameModule];
    id v10 = [v9 sourceItemBuilder];
    if ([v10 conformsToProtocol:&unk_1F1AD8F70]) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
    id v12 = v11;

    id v19 = [v12 availableIconDescriptors];
    uint64_t v13 = [v12 iconDescriptor];

    v14 = [[HUIconPickerViewController alloc] initWithIconDescriptors:v19 selectedIconDescriptor:v13 delegate:self];
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v14];
    [v15 setModalPresentationStyle:2];
    v16 = +[HUViewControllerPresentationRequest requestWithViewController:v15];
    int v17 = [(HUItemModuleController *)self host];
    id v18 = (id)[v17 moduleController:self presentViewControllerForRequest:v16];
  }
}

- (void)iconPickerDidCancel:(id)a3
{
  id v6 = +[HUViewControllerDismissalRequest requestWithViewController:a3];
  id v4 = [(HUItemModuleController *)self host];
  id v5 = (id)[v4 moduleController:self dismissViewControllerForRequest:v6];
}

- (void)iconPicker:(id)a3 didPickIconDescriptor:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  if (![(HUNameItemModuleController *)self supportsCustomIconEditing]) {
    NSLog(&cfstr_UpdatingIconsI.isa);
  }
  uint64_t v9 = [(HUNameItemModuleController *)self nameModule];
  id v10 = [v9 sourceItemBuilder];
  if ([v10 conformsToProtocol:&unk_1F1AD8F70]) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  [v12 setIconDescriptor:v7];
  uint64_t v13 = [v12 commitItem];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __63__HUNameItemModuleController_iconPicker_didPickIconDescriptor___block_invoke;
  v18[3] = &unk_1E6384D58;
  v18[4] = self;
  v18[5] = a2;
  id v14 = (id)[v13 addSuccessBlock:v18];

  id v15 = +[HUViewControllerDismissalRequest requestWithViewController:v8];

  v16 = [(HUItemModuleController *)self host];
  id v17 = (id)[v16 moduleController:self dismissViewControllerForRequest:v15];
}

void __63__HUNameItemModuleController_iconPicker_didPickIconDescriptor___block_invoke(uint64_t a1)
{
  objc_opt_class();
  id v2 = [*(id *)(a1 + 32) nameModule];
  v3 = [v2 itemUpdater];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v10 = v4;

  if (v10)
  {
    id v5 = (void *)MEMORY[0x1E4F1CAD0];
    id v6 = [*(id *)(a1 + 32) nameModule];
    id v7 = [v6 nameAndIconItem];
    id v8 = [v5 setWithObject:v7];
    id v9 = (id)[v10 updateResultsForItems:v8 senderSelector:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) nameModule];
    id v7 = [v6 itemUpdater];
    NSLog(&cfstr_SomehowWeDonTH.isa, v7);
  }
}

- (BOOL)nameFieldHasClearButton
{
  return self->_nameFieldHasClearButton;
}

- (void)setNameFieldHasClearButton:(BOOL)a3
{
  self->_nameFieldHasClearButton = a3;
}

- (BOOL)showIcon
{
  return self->_showIcon;
}

- (void)setShowIcon:(BOOL)a3
{
  self->_showIcon = a3;
}

- (BOOL)shouldUseAccessoryName
{
  return self->_shouldUseAccessoryName;
}

- (HUNameItemModule)nameModule
{
  return self->_nameModule;
}

- (void)setNameModule:(id)a3
{
}

- (HFNamingComponents)namingComponent
{
  return self->_namingComponent;
}

- (void)setNamingComponent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namingComponent, 0);

  objc_storeStrong((id *)&self->_nameModule, 0);
}

@end