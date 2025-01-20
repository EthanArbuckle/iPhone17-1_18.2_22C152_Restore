@interface HUChildServiceItemModuleController
- (BOOL)allConfigurationDisabled;
- (BOOL)canSelectDisabledItem:(id)a3;
- (BOOL)canSelectItem:(id)a3;
- (BOOL)shouldManageTextFieldForItem:(id)a3;
- (Class)cellClassForItem:(id)a3;
- (HFServiceLikeBuilder)activelyEditingNameServiceBuilder;
- (HUChildServiceEditorItemModule)childServiceItemModule;
- (HUChildServiceItemModuleController)initWithModule:(id)a3;
- (HUChildServiceItemModuleController)initWithModule:(id)a3 delegate:(id)a4;
- (HUChildServiceModuleControllerDelegate)delegate;
- (NSMapTable)identifyButtonMap;
- (id)defaultTextForTextField:(id)a3 item:(id)a4;
- (id)placeholderTextForTextField:(id)a3 item:(id)a4;
- (unint64_t)didSelectItem:(id)a3;
- (void)_identifyButtonPressed:(id)a3 forEvent:(id)a4;
- (void)checkmarkTappedInCell:(id)a3 forItem:(id)a4;
- (void)setActivelyEditingNameServiceBuilder:(id)a3;
- (void)setChildServiceItemModule:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIdentifyButtonMap:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)textDidChange:(id)a3 forTextField:(id)a4 item:(id)a5;
- (void)textFieldDidBeginEditing:(id)a3 item:(id)a4;
- (void)textFieldDidEndEditing:(id)a3 item:(id)a4;
- (void)updateAllConfigurationDisabled;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUChildServiceItemModuleController

- (HUChildServiceItemModuleController)initWithModule:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUChildServiceItemModuleController;
  v9 = [(HUItemModuleController *)&v14 initWithModule:v7];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_childServiceItemModule, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    uint64_t v11 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    identifyButtonMap = v10->_identifyButtonMap;
    v10->_identifyButtonMap = (NSMapTable *)v11;
  }
  return v10;
}

- (HUChildServiceItemModuleController)initWithModule:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithModule_delegate_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUChildServiceItemModuleController.m", 41, @"%s is unavailable; use %@ instead",
    "-[HUChildServiceItemModuleController initWithModule:]",
    v6);

  return 0;
}

- (void)updateAllConfigurationDisabled
{
  v3 = [(HUChildServiceItemModuleController *)self childServiceItemModule];
  v4 = [v3 allItems];
  v5 = objc_msgSend(v4, "na_filter:", &__block_literal_global_278);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__HUChildServiceItemModuleController_updateAllConfigurationDisabled__block_invoke_2;
  v11[3] = &unk_1E6386108;
  v11[4] = self;
  int v6 = objc_msgSend(v5, "na_all:", v11);

  if (v6 != [(HUChildServiceItemModuleController *)self allConfigurationDisabled])
  {
    self->_allConfigurationDisabled = v6;
    id v7 = [(HUChildServiceItemModuleController *)self delegate];
    id v8 = [(HUChildServiceItemModuleController *)self childServiceItemModule];
    v9 = [v8 allItems];
    v10 = [v9 allObjects];
    [v7 updateCellForItems:v10];
  }
}

uint64_t __68__HUChildServiceItemModuleController_updateAllConfigurationDisabled__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 latestResults];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
  uint64_t v4 = [v3 BOOLValue] ^ 1;

  return v4;
}

uint64_t __68__HUChildServiceItemModuleController_updateAllConfigurationDisabled__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 childServiceItemModule];
  int v5 = [v4 canToggleConfigurationStateForItem:v3];

  return v5 ^ 1u;
}

- (Class)cellClassForItem:(id)a3
{
  id v3 = [(HUChildServiceItemModuleController *)self childServiceItemModule];
  [v3 editingMode];

  uint64_t v4 = objc_opt_class();

  return (Class)v4;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v38 = a3;
  id v6 = a4;
  id v7 = [(HUChildServiceItemModuleController *)self childServiceItemModule];
  uint64_t v8 = [v7 editingMode];

  if (v8 == 1)
  {
    objc_opt_class();
    id v9 = v38;
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    id v11 = v10;

    [v11 setHideIcon:1];
    [v11 setAccessoryType:1];
    goto LABEL_26;
  }
  objc_opt_class();
  id v12 = v38;
  if (objc_opt_isKindOfClass()) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v11 = v13;

  [v11 setDelegate:self];
  objc_opt_class();
  id v37 = v6;
  id v14 = v6;
  if (objc_opt_isKindOfClass()) {
    v15 = v14;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;
  id v36 = v14;

  v17 = [v16 accessories];
  v18 = [v17 anyObject];
  v19 = objc_msgSend(v18, "hf_owningBridgeAccessory");
  v20 = v16;
  v21 = [v16 service];
  v22 = objc_msgSend(v21, "hf_parentService");
  v23 = [v22 accessory];
  id v24 = v19;
  id v25 = v23;
  if (v24 == v25)
  {

    id v6 = v37;
LABEL_17:
    objc_opt_class();
    v17 = [v11 accessoryView];
    if (objc_opt_isKindOfClass()) {
      v28 = v17;
    }
    else {
      v28 = 0;
    }
    id v29 = v28;

    if (!v29)
    {
      v17 = [MEMORY[0x1E4F427E0] buttonWithType:1];
      v30 = _HULocalizedStringWithDefaultValue(@"HUChildServiceModuleIdentifyAccessoryViewTitle", @"HUChildServiceModuleIdentifyAccessoryViewTitle", 1);
      [v17 setTitle:v30 forState:0];

      v31 = _HULocalizedStringWithDefaultValue(@"HUChildServiceModuleRunningAccessoryViewTitle", @"HUChildServiceModuleRunningAccessoryViewTitle", 1);
      [v17 setTitle:v31 forState:2];

      v32 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
      [v17 setTintColor:v32];

      v33 = [MEMORY[0x1E4F428B8] systemGrayColor];
      [v17 setTitleColor:v33 forState:2];

      v34 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
      [v17 setTitleColor:v34 forState:0];

      v35 = [MEMORY[0x1E4F428B8] clearColor];
      [v17 setBackgroundColor:v35];

      [v17 sizeToFit];
      [v17 addTarget:self action:sel__identifyButtonPressed_forEvent_ forControlEvents:64];
      [v11 setAccessoryView:v17];
    }
    v18 = [(HUChildServiceItemModuleController *)self identifyButtonMap];
    [v18 setObject:v36 forKey:v17];
    goto LABEL_24;
  }
  v26 = v25;
  if (v24)
  {
    char v27 = [v24 isEqual:v25];

    id v6 = v37;
    if ((v27 & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_17;
  }

  id v6 = v37;
LABEL_24:

LABEL_25:
LABEL_26:
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  id v23 = a3;
  id v7 = a4;
  uint64_t v8 = [(HUChildServiceItemModuleController *)self childServiceItemModule];
  uint64_t v9 = [v8 editingMode];

  if (v9 == 1)
  {
    objc_opt_class();
    id v10 = v23;
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
    id v12 = v11;

    v13 = [v7 latestResults];
    id v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];
    objc_msgSend(v12, "setHideValue:", objc_msgSend(v14, "BOOLValue") ^ 1);

LABEL_6:
    goto LABEL_8;
  }
  v15 = [(HUChildServiceItemModuleController *)self childServiceItemModule];
  uint64_t v16 = [v15 editingMode];

  if (!v16)
  {
    objc_opt_class();
    id v17 = v23;
    if (objc_opt_isKindOfClass()) {
      v18 = v17;
    }
    else {
      v18 = 0;
    }
    id v12 = v18;

    if ([(HUChildServiceItemModuleController *)self allConfigurationDisabled])
    {
      [v12 setRemoveCheckmark:1];
    }
    else
    {
      v19 = [(HUChildServiceItemModuleController *)self childServiceItemModule];
      uint64_t v20 = [v19 configurationStateForItem:v7];

      v21 = [(HUChildServiceItemModuleController *)self childServiceItemModule];
      uint64_t v22 = [v21 canToggleConfigurationStateForItem:v7];

      [v12 setRemoveCheckmark:0];
      [v12 setAllowCheckmarkSelectionWhileDisabled:v22];
      [v12 setDisableCheckmark:v22 ^ 1];
      [v12 setChecked:v20 != 2];
    }
    goto LABEL_6;
  }
LABEL_8:
}

- (BOOL)canSelectItem:(id)a3
{
  id v3 = [(HUChildServiceItemModuleController *)self childServiceItemModule];
  BOOL v4 = [v3 editingMode] == 1;

  return v4;
}

- (BOOL)canSelectDisabledItem:(id)a3
{
  return 1;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  int v5 = [(HUChildServiceItemModuleController *)self childServiceItemModule];
  if ([v5 editingMode] == 1)
  {
    id v6 = [(HUChildServiceItemModuleController *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      uint64_t v8 = [(HUChildServiceItemModuleController *)self delegate];
      id v9 = (id)[v8 childServiceEditorModuleController:self didSelectItem:v4];

      goto LABEL_6;
    }
  }
  else
  {
  }
  id v10 = [(HUChildServiceItemModuleController *)self childServiceItemModule];
  uint64_t v11 = [v10 editingMode];

  if (!v11)
  {
    unint64_t v12 = 1;
    goto LABEL_8;
  }
LABEL_6:
  v14.receiver = self;
  v14.super_class = (Class)HUChildServiceItemModuleController;
  unint64_t v12 = [(HUItemModuleController *)&v14 didSelectItem:v4];
LABEL_8:

  return v12;
}

- (BOOL)shouldManageTextFieldForItem:(id)a3
{
  id v3 = [(HUChildServiceItemModuleController *)self childServiceItemModule];
  BOOL v4 = [v3 editingMode] == 0;

  return v4;
}

- (void)textFieldDidBeginEditing:(id)a3 item:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  id v11 = v5;
  if (objc_opt_isKindOfClass()) {
    id v6 = v11;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  uint64_t v8 = [(HUChildServiceItemModuleController *)self childServiceItemModule];
  id v9 = [v8 home];
  id v10 = [v7 serviceLikeBuilderInHome:v9];
  [(HUChildServiceItemModuleController *)self setActivelyEditingNameServiceBuilder:v10];
}

- (void)textDidChange:(id)a3 forTextField:(id)a4 item:(id)a5
{
  id v6 = a3;
  id v7 = [(HUChildServiceItemModuleController *)self activelyEditingNameServiceBuilder];
  [v7 setName:v6];
}

- (void)textFieldDidEndEditing:(id)a3 item:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HUChildServiceItemModuleController *)self activelyEditingNameServiceBuilder];

  if (!v8)
  {
    id v9 = [(HUChildServiceItemModuleController *)self activelyEditingNameServiceBuilder];
    NSLog(&cfstr_ServiceBuilder.isa, v9);
  }
  id v10 = v7;
  if ([v10 conformsToProtocol:&unk_1F1A3D558]) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  v13 = [v12 namingComponentForHomeKitObject];
  objc_super v14 = [(HUChildServiceItemModuleController *)self defaultTextForTextField:v6 item:v10];

  v15 = [v6 text];
  uint64_t v16 = [v13 homeKitSafeStringForString:v15];

  id v17 = [v6 text];
  char v18 = [v17 isEqualToString:v16];

  if ((v18 & 1) == 0) {
    [v6 setText:v16];
  }
  if (([v16 isEqualToString:v14] & 1) == 0)
  {
    v19 = [(HUChildServiceItemModuleController *)self activelyEditingNameServiceBuilder];
    [v19 setName:v16];

    uint64_t v20 = [(HUChildServiceItemModuleController *)self activelyEditingNameServiceBuilder];
    v21 = [v20 commitItem];

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __66__HUChildServiceItemModuleController_textFieldDidEndEditing_item___block_invoke;
    v23[3] = &unk_1E63850B8;
    v23[4] = self;
    id v22 = (id)[v21 addCompletionBlock:v23];
  }
}

uint64_t __66__HUChildServiceItemModuleController_textFieldDidEndEditing_item___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v4 = (void *)MEMORY[0x1E4F69110];
    id v5 = a3;
    id v6 = [v4 sharedHandler];
    uint64_t v7 = *MEMORY[0x1E4F68780];
    uint64_t v14 = *MEMORY[0x1E4F68420];
    uint64_t v8 = [*(id *)(a1 + 32) activelyEditingNameServiceBuilder];
    uint64_t v9 = [v8 name];
    id v10 = (void *)v9;
    id v11 = @"nil name";
    if (v9) {
      id v11 = (__CFString *)v9;
    }
    v15[0] = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    [v6 handleError:v5 operationType:v7 options:v12 retryBlock:0 cancelBlock:0];
  }
  return [*(id *)(a1 + 32) setActivelyEditingNameServiceBuilder:0];
}

- (id)defaultTextForTextField:(id)a3 item:(id)a4
{
  id v4 = a4;
  if ([v4 conformsToProtocol:&unk_1F1A3D558]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  uint64_t v7 = [v6 namingComponentForHomeKitObject];

  uint64_t v8 = [v7 textFieldDisplayText];

  return v8;
}

- (id)placeholderTextForTextField:(id)a3 item:(id)a4
{
  id v4 = a4;
  if ([v4 conformsToProtocol:&unk_1F1A3D558]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  uint64_t v7 = [v6 namingComponentForHomeKitObject];

  uint64_t v8 = [v7 placeholderText];

  return v8;
}

- (void)_identifyButtonPressed:(id)a3 forEvent:(id)a4
{
  id v5 = a3;
  id v6 = [(HUChildServiceItemModuleController *)self identifyButtonMap];
  uint64_t v7 = [v6 objectForKey:v5];

  objc_opt_class();
  id v8 = v7;
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  id v11 = [v10 accessories];
  id v12 = [v11 anyObject];

  [v5 setEnabled:0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__HUChildServiceItemModuleController__identifyButtonPressed_forEvent___block_invoke;
  v14[3] = &unk_1E6386708;
  id v15 = v5;
  id v13 = v5;
  [v12 identifyWithCompletionHandler:v14];
}

void __70__HUChildServiceItemModuleController__identifyButtonPressed_forEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F42FF0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__HUChildServiceItemModuleController__identifyButtonPressed_forEvent___block_invoke_2;
  v6[3] = &unk_1E6386018;
  id v7 = *(id *)(a1 + 32);
  [v4 animateWithDuration:v6 animations:0.3];
  if (v3)
  {
    id v5 = [MEMORY[0x1E4F69110] sharedHandler];
    [v5 handleError:v3];
  }
}

uint64_t __70__HUChildServiceItemModuleController__identifyButtonPressed_forEvent___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setEnabled:1];
}

- (void)checkmarkTappedInCell:(id)a3 forItem:(id)a4
{
  id v7 = a4;
  id v5 = [(HUChildServiceItemModuleController *)self childServiceItemModule];
  id v6 = (id)[v5 toggleConfigurationStateForItem:v7];
}

- (BOOL)allConfigurationDisabled
{
  return self->_allConfigurationDisabled;
}

- (HUChildServiceModuleControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUChildServiceModuleControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HUChildServiceEditorItemModule)childServiceItemModule
{
  return self->_childServiceItemModule;
}

- (void)setChildServiceItemModule:(id)a3
{
}

- (HFServiceLikeBuilder)activelyEditingNameServiceBuilder
{
  return self->_activelyEditingNameServiceBuilder;
}

- (void)setActivelyEditingNameServiceBuilder:(id)a3
{
}

- (NSMapTable)identifyButtonMap
{
  return self->_identifyButtonMap;
}

- (void)setIdentifyButtonMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifyButtonMap, 0);
  objc_storeStrong((id *)&self->_activelyEditingNameServiceBuilder, 0);
  objc_storeStrong((id *)&self->_childServiceItemModule, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end