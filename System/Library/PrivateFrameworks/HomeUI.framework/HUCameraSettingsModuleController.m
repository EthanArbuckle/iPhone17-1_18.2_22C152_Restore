@interface HUCameraSettingsModuleController
- (BOOL)canSelectDisabledItem:(id)a3;
- (BOOL)canSelectItem:(id)a3;
- (BOOL)useProxSetupPresentationStyle;
- (Class)cellClassForItem:(id)a3;
- (HUCameraSettingsModuleController)initWithModule:(id)a3;
- (unint64_t)didSelectItem:(id)a3;
- (void)setHost:(id)a3;
- (void)setUseProxSetupPresentationStyle:(BOOL)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
- (void)viewSizeDidChanged;
@end

@implementation HUCameraSettingsModuleController

- (HUCameraSettingsModuleController)initWithModule:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (!v6) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  v8 = v6;
  if (!v7)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v9 handleFailureInFunction:v10, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v5, objc_opt_class() file lineNumber description];

LABEL_7:
    v8 = 0;
  }

  v11 = &unk_1F19F7700;
  id v12 = v6;
  v13 = v12;
  if (v6)
  {
    if ([v12 conformsToProtocol:v11]) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    id v6 = v13;
    if (!v14)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      v18 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
      v19 = NSStringFromProtocol((Protocol *)v11);
      [v17 handleFailureInFunction:v18, @"NSObject+NAAdditions.h", 71, @"Expected protocol %@", v19 file lineNumber description];

      id v6 = 0;
    }
  }

  v20.receiver = self;
  v20.super_class = (Class)HUCameraSettingsModuleController;
  v15 = [(HUItemModuleController *)&v20 initWithModule:v13];

  return v15;
}

- (void)setHost:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)HUCameraSettingsModuleController;
  [(HUItemModuleController *)&v22 setHost:a3];
  objc_opt_class();
  id v4 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v17 = v6;
  v7 = [v6 presenceModules];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector())
        {
          v13 = [(HUItemModuleController *)self host];
          char v14 = objc_opt_respondsToSelector();

          if (v14)
          {
            v15 = [(HUItemModuleController *)self host];
            v16 = [v15 presentingViewControllerForModuleController:self];
            [v12 setPresentingViewController:v16];
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v9);
  }
}

- (Class)cellClassForItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HUItemModuleController *)self module];
  char v6 = [v5 isItemHeader:v4];

  if ((v6 & 1) == 0)
  {
    v7 = [(HUItemModuleController *)self module];
    char v8 = [v7 isOptionItem:v4];

    if ((v8 & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v9 = [v4 latestResults];
        uint64_t v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F68A10]];
        [v10 BOOLValue];
      }
    }
  }
  uint64_t v11 = objc_opt_class();

  return (Class)v11;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)HUCameraSettingsModuleController;
  [(HUItemModuleController *)&v29 setupCell:v6 forItem:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v6 setValueColorFollowsTintColor:1];
    if ([(HUCameraSettingsModuleController *)self useProxSetupPresentationStyle]) {
      [v6 setUseVerticalLayoutOnly:1];
    }
  }
  char v8 = [(HUItemModuleController *)self module];
  int v9 = [v8 isItemHeader:v7];

  if (v9)
  {
    objc_opt_class();
    id v10 = v6;
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = v11;

    if (v12)
    {
      v13 = [v12 messageTextView];
      [v13 setDelegate:self];
    }
  }
  id v14 = [(HUItemModuleController *)self module];
  if (([v14 isItemHeader:v7] & 1) == 0)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      goto LABEL_18;
    }
    objc_opt_class();
    id v16 = v6;
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
    id v14 = v17;

    [v14 setHideIcon:1];
  }

LABEL_18:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    long long v18 = [(HUItemModuleController *)self module];
    if (objc_opt_isKindOfClass()) {
      long long v19 = v18;
    }
    else {
      long long v19 = 0;
    }
    id v20 = v19;

    long long v21 = [HUDynamicAlignmentTitleValueCellLayoutOptions alloc];
    objc_super v22 = [v20 longestCameraUsageOptionItemTitle];
    v23 = [v20 longestCameraPresenceItemTitle];
    uint64_t v24 = [(HUDynamicAlignmentTitleValueCellLayoutOptions *)v21 initWithCellSizeSubclass:1 longestPossibleValueText:v22 longestPossibleTitleText:v23];

    [v6 setLayoutOptions:v24];
  }
  if ([(HUCameraSettingsModuleController *)self useProxSetupPresentationStyle])
  {
    v25 = [(HUItemModuleController *)self module];
    char v26 = [v25 isItemHeader:v7];

    if ((v26 & 1) == 0)
    {
      v27 = [MEMORY[0x1E4F428B8] secondarySystemBackgroundColor];
      v28 = [v6 contentView];
      [v28 setBackgroundColor:v27];
    }
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v54.receiver = self;
  v54.super_class = (Class)HUCameraSettingsModuleController;
  [(HUItemModuleController *)&v54 updateCell:v8 forItem:v9 animated:v5];
  objc_opt_class();
  id v10 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  int v13 = [v12 isOptionItem:v9];
  id v14 = (void *)MEMORY[0x1E4F68AB8];
  if (!v13) {
    goto LABEL_19;
  }
  uint64_t v15 = objc_opt_class();
  id v16 = v8;
  if (v16)
  {
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
    long long v18 = v16;
    if (v17) {
      goto LABEL_12;
    }
    long long v19 = [MEMORY[0x1E4F28B00] currentHandler];
    id v20 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v19 handleFailureInFunction:v20, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v15, objc_opt_class() file lineNumber description];
  }
  long long v18 = 0;
LABEL_12:

  long long v21 = [v9 latestResults];
  objc_super v22 = [v21 objectForKeyedSubscript:*v14];
  [v18 setTitleText:v22];

  v23 = [v9 latestResults];
  uint64_t v24 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];
  [v18 setDescriptionText:v24];

  objc_opt_class();
  id v25 = v9;
  if (objc_opt_isKindOfClass()) {
    char v26 = v25;
  }
  else {
    char v26 = 0;
  }
  id v27 = v26;

  if ([v27 updateInProgress])
  {
    [v18 setAnimating:1];
  }
  else
  {
    v28 = [v25 latestResults];
    objc_super v29 = [v28 objectForKeyedSubscript:*MEMORY[0x1E4F68B40]];
    uint64_t v30 = [v29 BOOLValue];

    [v18 setAnimating:0];
    [v18 setChecked:v30];
  }

LABEL_19:
  objc_opt_class();
  id v31 = v9;
  if (objc_opt_isKindOfClass()) {
    v32 = v31;
  }
  else {
    v32 = 0;
  }
  id v33 = v32;

  if (v33)
  {
    uint64_t v34 = objc_opt_class();
    id v35 = v8;
    if (v35)
    {
      if (objc_opt_isKindOfClass()) {
        v36 = v35;
      }
      else {
        v36 = 0;
      }
      v37 = v35;
      if (v36) {
        goto LABEL_30;
      }
      v38 = [MEMORY[0x1E4F28B00] currentHandler];
      v39 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v38 handleFailureInFunction:v39, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v34, objc_opt_class() file lineNumber description];
    }
    v37 = 0;
LABEL_30:

    v40 = [v33 home];
    v41 = [v33 user];
    v42 = objc_msgSend(v40, "hf_handleForUser:", v41);
    [v37 setUserHandle:v42];

    v43 = [MEMORY[0x1E4F42B58] valueCellConfiguration];
    v44 = [v33 latestResults];
    v45 = [v44 objectForKeyedSubscript:*v14];
    [v43 setText:v45];

    v46 = [v31 latestResults];
    v47 = [v46 objectForKeyedSubscript:*MEMORY[0x1E4F68C70]];
    [v43 setSecondaryText:v47];

    v48 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
    v49 = [v43 secondaryTextProperties];
    [v49 setColor:v48];

    [v37 setContentConfiguration:v43];
  }
  objc_opt_class();
  v50 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    v51 = v50;
  }
  else {
    v51 = 0;
  }
  id v52 = v51;

  id v53 = [v52 recordingOptionsItem];

  [v8 setAccessoryType:v53 == v31];
}

- (void)viewSizeDidChanged
{
  objc_opt_class();
  v3 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v7 = [(HUItemModuleController *)self host];
  id v6 = [v5 cameraPresenceItems];

  [v7 updateCellForItems:v6];
}

- (BOOL)canSelectItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUItemModuleController *)self module];
  char v6 = [v5 isItemHeader:v4];

  return v6 ^ 1;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    char v6 = v5;
  }
  else {
    char v6 = 0;
  }
  id v7 = v6;

  if ([v7 isShowOptionsItem:v4]) {
    objc_msgSend(v7, "setModuleExpanded:forItem:", objc_msgSend(v7, "shouldExpandModuleForShowOptionsItem:", v4) ^ 1, v4);
  }
  objc_opt_class();
  id v8 = v4;
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    uint64_t v11 = [v10 cameraProfiles];
    id v12 = [v11 anyObject];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__HUCameraSettingsModuleController_didSelectItem___block_invoke;
    aBlock[3] = &unk_1E6387A08;
    id v29 = v12;
    id v13 = v12;
    id v14 = _Block_copy(aBlock);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __50__HUCameraSettingsModuleController_didSelectItem___block_invoke_2;
    v27[3] = &unk_1E638D410;
    v27[4] = self;
    uint64_t v15 = _Block_copy(v27);
    id v16 = [(HUSimpleItemModuleTableViewController *)[HUCameraSmartOptionsTableViewController alloc] initWithTableViewStyle:1 moduleCreator:v14 moduleControllerBuilder:v15];
    v17 = [v8 latestResults];
    long long v18 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    [(HUCameraSmartOptionsTableViewController *)v16 setTitle:v18];

    long long v19 = +[HUViewControllerPresentationRequest requestWithViewController:v16];
    [v19 setPreferredPresentationType:1];
    id v20 = [(HUItemModuleController *)self host];
    id v21 = (id)[v20 moduleController:self presentViewControllerForRequest:v19];
  }
  objc_super v22 = [(HUItemModuleController *)self module];
  char v23 = objc_opt_respondsToSelector();

  if (v23)
  {
    uint64_t v24 = [(HUItemModuleController *)self module];
    id v25 = (id)[v24 didSelectItem:v8];
  }
  return 0;
}

id __50__HUCameraSettingsModuleController_didSelectItem___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [HUCameraRecordingOptionsModule alloc];
  char v6 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 32)];
  id v7 = [(HUCameraRecordingOptionsModule *)v5 initWithItemUpdater:v4 cameraProfiles:v6];

  v10[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  return v8;
}

HUCameraRecordingOptionsModuleController *__50__HUCameraSettingsModuleController_didSelectItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[HUCameraRecordingOptionsModuleController alloc] initWithModule:v3];

  id v5 = [*(id *)(a1 + 32) host];
  [(HUItemModuleController *)v4 setHost:v5];

  return v4;
}

- (BOOL)canSelectDisabledItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  return v6 == 0;
}

- (BOOL)useProxSetupPresentationStyle
{
  return self->_useProxSetupPresentationStyle;
}

- (void)setUseProxSetupPresentationStyle:(BOOL)a3
{
  self->_useProxSetupPresentationStyle = a3;
}

@end