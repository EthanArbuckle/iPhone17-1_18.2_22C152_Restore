@interface HUAccessorySettingsItemModuleController
- (BOOL)canSelectItem:(id)a3;
- (Class)cellClassForItem:(id)a3;
- (HUAccessorySettingsItemModuleController)initWithModule:(id)a3;
- (HUAccessorySettingsItemModuleController)initWithModule:(id)a3 delegate:(id)a4;
- (HUAccessorySettingsItemModuleControllerDelegate)delegate;
- (NSMapTable)cellToItemMap;
- (NSMutableSet)registeredButtonFutures;
- (unint64_t)didSelectItem:(id)a3;
- (void)_handleButtonPress:(id)a3;
- (void)_registerButtonActionHandler:(id)a3 item:(id)a4;
- (void)_selectOptionItem:(id)a3;
- (void)_setupCellAccessoryType:(id)a3 forItem:(id)a4 withKey:(id)a5;
- (void)_setupSliderCell:(id)a3 forMinKey:(id)a4 maxKey:(id)a5;
- (void)_updateSwitchSettingItem:(id)a3 withValue:(id)a4;
- (void)setCellToItemMap:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRegisteredButtonFutures:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)sliderValueTableViewCell:(id)a3 didChangeValue:(double)a4;
- (void)stepperCell:(id)a3 steppedToValue:(id)a4;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUAccessorySettingsItemModuleController

- (HUAccessorySettingsItemModuleController)initWithModule:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUAccessorySettingsItemModuleController;
  v7 = [(HUItemModuleController *)&v12 initWithModule:a3];
  v8 = v7;
  if (v7)
  {
    [(HUAccessorySettingsItemModuleController *)v7 setDelegate:v6];
    v9 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    [(HUAccessorySettingsItemModuleController *)v8 setCellToItemMap:v9];

    v10 = objc_opt_new();
    [(HUAccessorySettingsItemModuleController *)v8 setRegisteredButtonFutures:v10];
  }
  return v8;
}

- (HUAccessorySettingsItemModuleController)initWithModule:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v6 = NSStringFromSelector(sel_initWithModule_delegate_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUAccessorySettingsItemModuleController.m", 55, @"%s is unavailable; use %@ instead",
    "-[HUAccessorySettingsItemModuleController initWithModule:]",
    v6);

  return 0;
}

- (Class)cellClassForItem:(id)a3
{
  id v3 = a3;
  v4 = [v3 latestResults];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F67FD0]];
  [v5 unsignedIntegerValue];

  objc_opt_class();
  objc_opt_isKindOfClass();

  id v6 = objc_opt_class();

  return (Class)v6;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HUAccessorySettingsItemModuleController *)self cellToItemMap];
  [v8 setObject:v7 forKey:v6];

  [v6 setAccessoryType:0];
  objc_opt_class();
  id v32 = v6;
  if (objc_opt_isKindOfClass()) {
    v9 = v32;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  [v10 setHideIcon:1];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [v7 latestResults];
    objc_super v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F67FD0]];
    uint64_t v13 = [v12 unsignedIntegerValue];

    switch(v13)
    {
      case -1:
        break;
      case 0:
        v17 = (void *)MEMORY[0x1E4F68518];
        goto LABEL_12;
      case 2:
        objc_opt_class();
        id v18 = v32;
        if (objc_opt_isKindOfClass()) {
          v19 = v18;
        }
        else {
          v19 = 0;
        }
        id v16 = v19;

        [v16 setContinuous:0];
        goto LABEL_21;
      case 3:
      case 4:
        id v14 = v32;
        if ([v14 conformsToProtocol:&unk_1F1A2AE98]) {
          v15 = v14;
        }
        else {
          v15 = 0;
        }
        id v16 = v15;

        [v16 setStepperCellDelegate:self];
        goto LABEL_22;
      case 5:
        objc_opt_class();
        id v20 = v32;
        if (objc_opt_isKindOfClass()) {
          v21 = v20;
        }
        else {
          v21 = 0;
        }
        id v16 = v21;

LABEL_21:
        [v16 setDelegate:self];
LABEL_22:

        break;
      case 6:
        objc_opt_class();
        id v22 = v32;
        if (objc_opt_isKindOfClass()) {
          v23 = v22;
        }
        else {
          v23 = 0;
        }
        id v24 = v23;

        v25 = [v24 textField];
        v26 = v25;
        uint64_t v27 = 0;
        goto LABEL_31;
      case 7:
        objc_opt_class();
        id v28 = v32;
        if (objc_opt_isKindOfClass()) {
          v29 = v28;
        }
        else {
          v29 = 0;
        }
        id v24 = v29;

        v25 = [v24 textField];
        v26 = v25;
        uint64_t v27 = 1;
LABEL_31:
        [v25 setSecureTextEntry:v27];

        goto LABEL_36;
      case 9:
        objc_opt_class();
        id v30 = v32;
        if (objc_opt_isKindOfClass()) {
          v31 = v30;
        }
        else {
          v31 = 0;
        }
        id v24 = v31;

        [v24 setTextAlignment:4];
LABEL_36:

        break;
      default:
        v17 = (void *)MEMORY[0x1E4F68590];
LABEL_12:
        [(HUAccessorySettingsItemModuleController *)self _setupCellAccessoryType:v32 forItem:v7 withKey:*v17];
        break;
    }
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v8 latestResults];
  id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F67FD0]];
  uint64_t v11 = [v10 unsignedIntegerValue];

  objc_super v12 = [v8 latestResults];
  uint64_t v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
  [v7 setAccessibilityIdentifier:v13];

  objc_opt_class();
  id v14 = v8;
  if (objc_opt_isKindOfClass()) {
    v15 = v14;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  if (v16)
  {
    v17 = [v16 latestResults];
    id v18 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F68008]];

    objc_opt_class();
    id v19 = v18;
    if (objc_opt_isKindOfClass()) {
      id v20 = v19;
    }
    else {
      id v20 = 0;
    }
    id v21 = v20;

    objc_opt_class();
    id v22 = v19;
    if (objc_opt_isKindOfClass()) {
      v23 = v22;
    }
    else {
      v23 = 0;
    }
    id v76 = v23;

    switch(v11)
    {
      case 2:
        objc_opt_class();
        id v44 = v7;
        if (objc_opt_isKindOfClass()) {
          v45 = v44;
        }
        else {
          v45 = 0;
        }
        id v27 = v45;

        v46 = [v16 latestResults];
        v47 = [v46 objectForKeyedSubscript:*MEMORY[0x1E4F67FE8]];
        [v47 floatValue];
        [v27 setMinimumValue:v48];

        v49 = [v16 latestResults];
        v50 = [v49 objectForKeyedSubscript:*MEMORY[0x1E4F67FE0]];
        [v50 floatValue];
        [v27 setMaximumValue:v51];

        [v21 floatValue];
        [v27 setValue:v52];
        [v27 setShowValue:0];
        v53 = [v14 latestResults];
        v54 = [v53 objectForKeyedSubscript:*MEMORY[0x1E4F68000]];

        v55 = [v54 objectForKeyedSubscript:@"MaximumValueTrackingImage"];
        v56 = [v54 objectForKeyedSubscript:@"MinimumValueTrackingImage"];
        [(HUAccessorySettingsItemModuleController *)self _setupSliderCell:v27 forMinKey:v56 maxKey:v55];

        goto LABEL_37;
      case 3:
      case 4:
        id v24 = v7;
        v25 = &unk_1F1A2AE98;
        if ([v24 conformsToProtocol:v25]) {
          v26 = v24;
        }
        else {
          v26 = 0;
        }
        id v27 = v26;

        id v28 = [v16 latestResults];
        v29 = [v28 objectForKeyedSubscript:*MEMORY[0x1E4F67FE8]];
        [v27 setMinimumValue:v29];

        id v30 = [v16 latestResults];
        v31 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4F67FE0]];
        [v27 setMaximumValue:v31];

        id v32 = [v16 latestResults];
        v33 = [v32 objectForKeyedSubscript:*MEMORY[0x1E4F67FF0]];
        [v27 setStepValue:v33];

        if (v21) {
          v34 = v21;
        }
        else {
          v34 = &unk_1F19B4898;
        }
        objc_msgSend(v27, "setStepperValue:", v34, v76);
        goto LABEL_37;
      case 6:
      case 7:
        objc_opt_class();
        id v41 = v7;
        if (objc_opt_isKindOfClass()) {
          v42 = v41;
        }
        else {
          v42 = 0;
        }
        id v27 = v42;

        v43 = [v27 textField];
        [v43 setText:v76];

        goto LABEL_37;
      case 8:
        id v57 = v7;
        id v27 = [v14 latestResults];
        v58 = [v27 objectForKey:*MEMORY[0x1E4F68B40]];
        if ([v58 BOOLValue]) {
          uint64_t v59 = 3;
        }
        else {
          uint64_t v59 = 0;
        }
        objc_msgSend(v57, "setAccessoryType:", v59, v76);

LABEL_37:
        break;
      default:
        break;
    }
    v60 = [(HUAccessorySettingsItemModuleController *)self delegate];
    char v61 = objc_opt_respondsToSelector();

    if (v61)
    {
      objc_opt_class();
      id v62 = v14;
      if (objc_opt_isKindOfClass()) {
        v63 = v62;
      }
      else {
        v63 = 0;
      }
      id v64 = v63;

      v65 = [(HUAccessorySettingsItemModuleController *)self delegate];
      int v66 = [v65 moduleController:self shouldDisableItem:v64];

      id v67 = v7;
      v68 = &unk_1F19E3620;
      if ([v67 conformsToProtocol:v68]) {
        v69 = v67;
      }
      else {
        v69 = 0;
      }
      id v70 = v69;

      if (v66) {
        [v70 setDisabled:1];
      }
    }
  }
  else if (v11 == 9)
  {
    objc_opt_class();
    id v35 = v7;
    if (objc_opt_isKindOfClass()) {
      v36 = v35;
    }
    else {
      v36 = 0;
    }
    id v37 = v36;

    v38 = [v14 latestResults];
    v39 = [v38 objectForKeyedSubscript:*MEMORY[0x1E4F68898]];

    if (v39) {
      int v40 = [v39 isFinished] ^ 1;
    }
    else {
      int v40 = 0;
    }
    objc_opt_class();
    v71 = [v37 accessoryView];
    if (objc_opt_isKindOfClass()) {
      v72 = v71;
    }
    else {
      v72 = 0;
    }
    id v73 = v72;

    if (v40)
    {
      if (v73)
      {
        id v74 = v71;

        [v37 setDisabled:1];
        [v74 startAnimating];
        [(HUAccessorySettingsItemModuleController *)self _registerButtonActionHandler:v39 item:v14];
        id v73 = v74;
      }
      else
      {
        v78[0] = MEMORY[0x1E4F143A8];
        v78[1] = 3221225472;
        v78[2] = __71__HUAccessorySettingsItemModuleController_updateCell_forItem_animated___block_invoke;
        v78[3] = &unk_1E638C830;
        id v75 = v37;
        id v79 = v75;
        __71__HUAccessorySettingsItemModuleController_updateCell_forItem_animated___block_invoke((uint64_t)v78);
        id v73 = (id)objc_claimAutoreleasedReturnValue();
        [v75 setDisabled:1];
        [v73 startAnimating];
        [(HUAccessorySettingsItemModuleController *)self _registerButtonActionHandler:v39 item:v14];
      }
    }
    else
    {
      [v37 setDisabled:0];
      [v73 stopAnimating];
    }
  }
}

id __71__HUAccessorySettingsItemModuleController_updateCell_forItem_animated___block_invoke(uint64_t a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
  [*(id *)(a1 + 32) setAccessoryView:v2];

  return v2;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 latestResults];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F67FD0]];
  uint64_t v7 = [v6 unsignedIntegerValue];

  objc_opt_class();
  id v8 = v4;
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if (v10) {
    BOOL v11 = v7 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    objc_super v12 = [(HUAccessorySettingsItemModuleController *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      id v14 = [(HUAccessorySettingsItemModuleController *)self delegate];
      [v14 moduleController:self presentGroup:v10];
    }
    unint64_t v15 = 1;
  }
  else
  {
    if (v7 == 9)
    {
      [(HUAccessorySettingsItemModuleController *)self _handleButtonPress:v8];
    }
    else
    {
      objc_opt_class();
      id v16 = v8;
      if (objc_opt_isKindOfClass()) {
        v17 = v16;
      }
      else {
        v17 = 0;
      }
      id v18 = v17;

      if (v18) {
        [(HUAccessorySettingsItemModuleController *)self _selectOptionItem:v16];
      }
    }
    unint64_t v15 = 0;
  }

  return v15;
}

- (BOOL)canSelectItem:(id)a3
{
  id v3 = [a3 latestResults];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];
  char v5 = [v4 BOOLValue] ^ 1;

  return v5;
}

- (void)_selectOptionItem:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    BOOL v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HUAccessorySettingsItemModuleController.m", 261, @"Invalid parameter not satisfying: %@", @"optionItem" object file lineNumber description];
  }
  id v6 = [(HUItemModuleController *)self module];
  uint64_t v7 = [v5 value];
  id v8 = [v6 updateItem:v5 withValue:v7];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__HUAccessorySettingsItemModuleController__selectOptionItem___block_invoke;
  v12[3] = &unk_1E63850B8;
  id v13 = v5;
  id v9 = v5;
  id v10 = (id)[v8 addCompletionBlock:v12];
}

void __61__HUAccessorySettingsItemModuleController__selectOptionItem___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = HFLogForCategory();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void **)(a1 + 32);
      id v8 = [v7 value];
      int v10 = 138412802;
      BOOL v11 = v7;
      __int16 v12 = 2112;
      id v13 = v8;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_error_impl(&dword_1BE345000, v6, OS_LOG_TYPE_ERROR, "(Option Item) Failed to update %@ to '%@' with error: %@", (uint8_t *)&v10, 0x20u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = *(void **)(a1 + 32);
    id v8 = [v9 value];
    int v10 = 138412546;
    BOOL v11 = v9;
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "(Option Item) Updated %@ to '%@'", (uint8_t *)&v10, 0x16u);
    goto LABEL_6;
  }
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  uint64_t v7 = [(HUAccessorySettingsItemModuleController *)self cellToItemMap];
  id v8 = [v7 objectForKey:v6];
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  BOOL v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v12 = @"OFF";
    *(_DWORD *)buf = 138412802;
    id v26 = v6;
    __int16 v27 = 2112;
    if (v4) {
      __int16 v12 = @"ON";
    }
    id v28 = v10;
    __int16 v29 = 2112;
    id v30 = v12;
    _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "(Switch) '%@/%@' value changing to '%@'", buf, 0x20u);
  }

  id v13 = [(HUAccessorySettingsItemModuleController *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    id v15 = [(HUAccessorySettingsItemModuleController *)self delegate];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    id v19 = __64__HUAccessorySettingsItemModuleController_switchCell_didTurnOn___block_invoke;
    id v20 = &unk_1E638B740;
    id v21 = v6;
    BOOL v24 = v4;
    id v22 = v10;
    v23 = self;
    [v15 moduleController:self preflightCheckToAllowSwitchingForSettingItem:v22 changingToOn:v4 withCompletion:&v17];
  }
  uint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", v4, v17, v18, v19, v20);
  [(HUAccessorySettingsItemModuleController *)self _updateSwitchSettingItem:v10 withValue:v16];
}

void __64__HUAccessorySettingsItemModuleController_switchCell_didTurnOn___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = v5;
      __int16 v21 = 2112;
      uint64_t v22 = v6;
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(Switch) '%@/%@' running preflight check before changing...", buf, 0x16u);
    }

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __64__HUAccessorySettingsItemModuleController_switchCell_didTurnOn___block_invoke_387;
    v15[3] = &unk_1E638D9F8;
    id v7 = *(id *)(a1 + 40);
    char v18 = *(unsigned char *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 48);
    id v16 = v7;
    uint64_t v17 = v8;
    id v9 = (id)[v3 addSuccessBlock:v15];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__HUAccessorySettingsItemModuleController_switchCell_didTurnOn___block_invoke_401;
    v11[3] = &unk_1E6389DD8;
    id v12 = *(id *)(a1 + 40);
    id v13 = *(id *)(a1 + 32);
    char v14 = *(unsigned char *)(a1 + 56);
    id v10 = (id)[v3 addFailureBlock:v11];
  }
}

void __64__HUAccessorySettingsItemModuleController_switchCell_didTurnOn___block_invoke_387(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if ([v3 BOOLValue]) {
      uint64_t v6 = @"passed";
    }
    else {
      uint64_t v6 = @"failed";
    }
    int v7 = [v3 BOOLValue];
    uint64_t v8 = @"NOT CHANGING";
    int v9 = *(unsigned __int8 *)(a1 + 48);
    if (v7) {
      uint64_t v8 = @"CHANGING";
    }
    id v10 = @"ON";
    int v15 = 138413058;
    uint64_t v16 = v5;
    __int16 v17 = 2112;
    char v18 = v6;
    __int16 v19 = 2112;
    if (!v9) {
      id v10 = @"OFF";
    }
    uint64_t v20 = v8;
    __int16 v21 = 2112;
    uint64_t v22 = v10;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(Switch) preflight returned check %@, %@ %@ to '%@'", (uint8_t *)&v15, 0x2Au);
  }

  if ([v3 BOOLValue])
  {
    BOOL v11 = [*(id *)(a1 + 40) module];
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
    id v14 = (id)[v11 updateItem:v12 withValue:v13];
  }
}

uint64_t __64__HUAccessorySettingsItemModuleController_switchCell_didTurnOn___block_invoke_401(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "(Switch) preflight failed, NOT changing %@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) setOn:*(unsigned char *)(a1 + 48) == 0 animated:1];
}

- (void)_updateSwitchSettingItem:(id)a3 withValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [(HUItemModuleController *)self module];
  int v9 = [v8 updateItem:v6 withValue:v7];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__HUAccessorySettingsItemModuleController__updateSwitchSettingItem_withValue___block_invoke;
  v13[3] = &unk_1E638DA20;
  objc_copyWeak(&v16, &location);
  id v10 = v6;
  id v14 = v10;
  id v11 = v7;
  id v15 = v11;
  id v12 = (id)[v9 addCompletionBlock:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __78__HUAccessorySettingsItemModuleController__updateSwitchSettingItem_withValue___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = HFLogForCategory();
  id v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = [*(id *)(a1 + 40) BOOLValue];
      id v10 = @"OFF";
      int v16 = 138412802;
      uint64_t v17 = v8;
      __int16 v18 = 2112;
      if (v9) {
        id v10 = @"ON";
      }
      __int16 v19 = v10;
      __int16 v20 = 2112;
      id v21 = v4;
      _os_log_error_impl(&dword_1BE345000, v7, OS_LOG_TYPE_ERROR, "(Switch) Failed to update %@ to '%@' with error: %@", (uint8_t *)&v16, 0x20u);
    }
    goto LABEL_12;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = [*(id *)(a1 + 40) BOOLValue];
    id v13 = @"OFF";
    if (v12) {
      id v13 = @"ON";
    }
    int v16 = 138412546;
    uint64_t v17 = v11;
    __int16 v18 = 2112;
    __int16 v19 = v13;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "(Switch) Updated %@ to '%@'", (uint8_t *)&v16, 0x16u);
  }

  id v14 = [WeakRetained delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    id v7 = [WeakRetained delegate];
    [v7 moduleController:WeakRetained settingUpdatedForItem:*(void *)(a1 + 32)];
LABEL_12:
  }
}

- (void)sliderValueTableViewCell:(id)a3 didChangeValue:(double)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  id v7 = [(HUAccessorySettingsItemModuleController *)self cellToItemMap];
  uint64_t v8 = [v7 objectForKey:v6];

  if (objc_opt_isKindOfClass()) {
    int v9 = v8;
  }
  else {
    int v9 = 0;
  }
  id v10 = v9;

  objc_opt_class();
  uint64_t v11 = [v10 setting];
  if (objc_opt_isKindOfClass()) {
    int v12 = v11;
  }
  else {
    int v12 = 0;
  }
  id v13 = v12;

  id v14 = [NSNumber numberWithDouble:a4];
  uint64_t v15 = [v13 minimumValue];
  if (!v15) {
    goto LABEL_14;
  }
  int v16 = (void *)v15;
  uint64_t v17 = [v13 maximumValue];
  if (!v17)
  {

    goto LABEL_14;
  }
  __int16 v18 = (void *)v17;
  __int16 v19 = [v13 stepValue];

  if (!v19)
  {
LABEL_14:
    __int16 v29 = v14;
    goto LABEL_15;
  }
  __int16 v20 = NSNumber;
  id v21 = [v13 minimumValue];
  [v21 doubleValue];
  double v23 = v22;
  BOOL v24 = [v13 maximumValue];
  [v24 doubleValue];
  double v26 = v25;
  __int16 v27 = [v13 stepValue];
  [v27 doubleValue];
  __int16 v29 = objc_msgSend(v20, "numberWithDouble:", HUClampWithStep(v23, v26, v28, a4));

  id v30 = HFLogForCategory();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    double v38 = a4;
    __int16 v39 = 2112;
    int v40 = v29;
    _os_log_impl(&dword_1BE345000, v30, OS_LOG_TYPE_DEFAULT, "(Slider) Clamping value '%f' to '%@'", buf, 0x16u);
  }

LABEL_15:
  uint64_t v31 = [(HUItemModuleController *)self module];
  id v32 = [v31 updateItem:v10 withValue:v29];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __83__HUAccessorySettingsItemModuleController_sliderValueTableViewCell_didChangeValue___block_invoke;
  v35[3] = &unk_1E63850B8;
  id v36 = v10;
  id v33 = v10;
  id v34 = (id)[v32 addCompletionBlock:v35];
}

void __83__HUAccessorySettingsItemModuleController_sliderValueTableViewCell_didChangeValue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = HFLogForCategory();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v11 = 138412802;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      id v14 = v5;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_error_impl(&dword_1BE345000, v8, OS_LOG_TYPE_ERROR, "(Slider) Failed to update %@ to '%@' with error: %@", (uint8_t *)&v11, 0x20u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = 138412546;
    uint64_t v12 = v10;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "(Slider) Updated %@ to '%@'", (uint8_t *)&v11, 0x16u);
  }
}

- (void)stepperCell:(id)a3 steppedToValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_opt_class();
  uint64_t v8 = [(HUAccessorySettingsItemModuleController *)self cellToItemMap];
  uint64_t v9 = [v8 objectForKey:v7];

  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v10;

  uint64_t v12 = [(HUItemModuleController *)self module];
  __int16 v13 = [v12 updateItem:v11 withValue:v6];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__HUAccessorySettingsItemModuleController_stepperCell_steppedToValue___block_invoke;
  v17[3] = &unk_1E6384CE0;
  id v18 = v11;
  id v19 = v6;
  id v14 = v6;
  id v15 = v11;
  id v16 = (id)[v13 addCompletionBlock:v17];
}

void __70__HUAccessorySettingsItemModuleController_stepperCell_steppedToValue___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = HFLogForCategory();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      int v11 = 138412802;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_error_impl(&dword_1BE345000, v6, OS_LOG_TYPE_ERROR, "(Stepper) Failed to update  %@ to '%@' with error: %@", (uint8_t *)&v11, 0x20u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    int v11 = 138412546;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "(Stepper) Updated %@ to '%@'", (uint8_t *)&v11, 0x16u);
  }
}

- (void)_setupSliderCell:(id)a3 forMinKey:(id)a4 maxKey:(id)a5
{
  id v18 = a3;
  unint64_t v7 = (unint64_t)a4;
  unint64_t v8 = (unint64_t)a5;
  if (v18 && v7 | v8)
  {
    if (v8)
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F42A80];
      uint64_t v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      int v11 = [v9 imageNamed:v8 inBundle:v10];

      if (v7)
      {
LABEL_5:
        uint64_t v12 = (void *)MEMORY[0x1E4F42A80];
        __int16 v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v14 = [v12 imageNamed:v7 inBundle:v13];

LABEL_8:
        __int16 v15 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
        id v16 = [v14 _flatImageWithColor:v15];
        [v18 setMinimumValueImage:v16];

        uint64_t v17 = [v11 _flatImageWithColor:v15];
        [v18 setMaximumValueImage:v17];

        goto LABEL_9;
      }
    }
    else
    {
      int v11 = 0;
      if (v7) {
        goto LABEL_5;
      }
    }
    uint64_t v14 = 0;
    goto LABEL_8;
  }
LABEL_9:
}

- (void)_handleButtonPress:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 latestResults];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68010]];

  unint64_t v7 = [v6 keyPath];
  int v8 = [v7 isEqualToString:*MEMORY[0x1E4F68520]];

  if (v8)
  {
    uint64_t v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v36 = "-[HUAccessorySettingsItemModuleController _handleButtonPress:]";
      __int16 v37 = 2112;
      double v38 = self;
      _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%s(%@)initiating 'Export Analytics'", buf, 0x16u);
    }

    uint64_t v10 = [(HUItemModuleController *)self module];
    int v11 = [v10 homeKitSettingsVendor];
    uint64_t v12 = objc_msgSend(v11, "hf_settingsAdapterManager");
    __int16 v13 = [v6 adapterIdentifier];
    uint64_t v14 = [v12 adapterForIdentifier:v13];
    __int16 v15 = &unk_1F1AD9270;
    if ([v14 conformsToProtocol:v15]) {
      id v16 = v14;
    }
    else {
      id v16 = 0;
    }
    id v17 = v16;

    if (!v17) {
      NSLog(&cfstr_AdapterDoesnTE_0.isa);
    }
    id v18 = [v17 handleButtonPressForEntity:v6];
    objc_initWeak((id *)buf, self);
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    uint64_t v31 = __62__HUAccessorySettingsItemModuleController__handleButtonPress___block_invoke;
    id v32 = &unk_1E638B0E0;
    objc_copyWeak(&v34, (id *)buf);
    id v19 = v17;
    id v33 = v19;
    id v20 = (id)[v18 flatMap:&v29];
    -[HUAccessorySettingsItemModuleController _registerButtonActionHandler:item:](self, "_registerButtonActionHandler:item:", v18, v4, v29, v30, v31, v32);

    objc_destroyWeak(&v34);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v21 = [(HUItemModuleController *)self module];
    double v22 = [v21 homeKitSettingsVendor];
    double v23 = objc_msgSend(v22, "hf_settingsAdapterManager");
    BOOL v24 = [v6 adapterIdentifier];
    double v25 = [v23 adapterForIdentifier:v24];
    if ([v25 conformsToProtocol:&unk_1F1AD9270]) {
      double v26 = v25;
    }
    else {
      double v26 = 0;
    }
    id v27 = v26;

    if (!v27) {
      NSLog(&cfstr_AdapterDoesnTE_0.isa);
    }
    long double v28 = [v27 handleButtonPressForEntity:v6];
    [(HUAccessorySettingsItemModuleController *)self _registerButtonActionHandler:v28 item:v4];
  }
}

id __62__HUAccessorySettingsItemModuleController__handleButtonPress___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_opt_class();
  id v5 = v3;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  int v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "Sysdiagnose request completed with results: %@", buf, 0xCu);
  }

  id v9 = objc_alloc(MEMORY[0x1E4F42718]);
  uint64_t v10 = HFLocalizedString();
  double v23 = v10;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  uint64_t v12 = (void *)[v9 initWithActivityItems:v11 applicationActivities:0];

  __int16 v13 = [WeakRetained delegate];
  uint64_t v14 = [v13 moduleController:WeakRetained requestPresentViewController:v12 animated:0];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __62__HUAccessorySettingsItemModuleController__handleButtonPress___block_invoke_428;
  v19[3] = &unk_1E638DA48;
  id v20 = v12;
  id v21 = *(id *)(a1 + 32);
  id v22 = v7;
  id v15 = v7;
  id v16 = v12;
  id v17 = [v14 addCompletionBlock:v19];

  return v17;
}

void __62__HUAccessorySettingsItemModuleController__handleButtonPress___block_invoke_428(id *a1)
{
  v2 = [a1[4] presentingViewController];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__HUAccessorySettingsItemModuleController__handleButtonPress___block_invoke_2;
  v3[3] = &unk_1E63850E0;
  id v4 = a1[5];
  id v5 = a1[6];
  [v2 dismissViewControllerAnimated:0 completion:v3];
}

void __62__HUAccessorySettingsItemModuleController__handleButtonPress___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F69758] deviceAirDropIdentifier];
  if (v2)
  {
    id v3 = HFLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v2;
      _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "Share Sheet has generated AirPlayId (%@) making 'airdrop sysdiagnose' request...", (uint8_t *)&v8, 0xCu);
    }

    objc_opt_class();
    id v4 = *(id *)(a1 + 32);
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;

    id v7 = (id)[v6 airDropSysdiagnose:*(void *)(a1 + 40)];
  }
  else
  {
    NSLog(&cfstr_AirdropIdentif.isa);
    id v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_error_impl(&dword_1BE345000, v6, OS_LOG_TYPE_ERROR, "Share Sheet failed to generate AirPlayID", (uint8_t *)&v8, 2u);
    }
  }
}

- (void)_registerButtonActionHandler:(id)a3 item:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HUAccessorySettingsItemModuleController *)self registeredButtonFutures];
  char v10 = [v9 containsObject:v7];

  if ((v10 & 1) == 0)
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __77__HUAccessorySettingsItemModuleController__registerButtonActionHandler_item___block_invoke;
    aBlock[3] = &unk_1E638C858;
    objc_copyWeak(v25, &location);
    id v24 = v8;
    v25[1] = (id)a2;
    int v11 = _Block_copy(aBlock);
    objc_initWeak(&from, v7);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __77__HUAccessorySettingsItemModuleController__registerButtonActionHandler_item___block_invoke_2;
    id v18 = &unk_1E638C880;
    objc_copyWeak(&v20, &location);
    uint64_t v12 = v11;
    id v19 = v12;
    objc_copyWeak(&v21, &from);
    id v13 = (id)[v7 addCompletionBlock:&v15];
    uint64_t v14 = [(HUAccessorySettingsItemModuleController *)self registeredButtonFutures];
    objc_msgSend(v14, "na_safeAddObject:", v7);

    v12[2](v12);
    objc_destroyWeak(&v21);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&from);

    objc_destroyWeak(v25);
    objc_destroyWeak(&location);
  }
}

void __77__HUAccessorySettingsItemModuleController__registerButtonActionHandler_item___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained module];
  id v3 = [v2 itemUpdater];
  id v4 = (void *)MEMORY[0x1E4F69230];
  id v5 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 32)];
  id v6 = [v4 requestToUpdateItems:v5 senderSelector:*(void *)(a1 + 48)];
  id v7 = (id)[v3 performItemUpdateRequest:v6];
}

void __77__HUAccessorySettingsItemModuleController__registerButtonActionHandler_item___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v8)
  {
    id v5 = [MEMORY[0x1E4F69110] sharedHandler];
    [v5 handleError:v8];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v6 = [WeakRetained registeredButtonFutures];
  id v7 = objc_loadWeakRetained((id *)(a1 + 48));
  [v6 removeObject:v7];
}

- (void)_setupCellAccessoryType:(id)a3 forItem:(id)a4 withKey:(id)a5
{
  id v13 = a3;
  id v7 = a4;
  id v8 = a5;
  BOOL v12 = 1;
  if ([MEMORY[0x1E4F69758] isAMac])
  {
    id v9 = [v7 latestResults];
    char v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F67FC8]];
    char v11 = [v10 isEqual:v8];

    if (v11) {
      BOOL v12 = 0;
    }
  }
  [v13 setAccessoryType:v12];
}

- (HUAccessorySettingsItemModuleControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUAccessorySettingsItemModuleControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMapTable)cellToItemMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCellToItemMap:(id)a3
{
}

- (NSMutableSet)registeredButtonFutures
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRegisteredButtonFutures:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredButtonFutures, 0);
  objc_storeStrong((id *)&self->_cellToItemMap, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end