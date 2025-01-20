@interface HUAudioAnalysisSettingsItemModuleController
- (Class)cellClassForItem:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUAudioAnalysisSettingsItemModuleController

- (Class)cellClassForItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  objc_opt_isKindOfClass();

  v4 = objc_opt_class();

  return (Class)v4;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HUAudioAnalysisSettingsItemModuleController;
  [(HUItemModuleController *)&v13 setupCell:v6 forItem:a4];
  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  if (v9) {
    [v9 setDelegate:self];
  }
  objc_opt_class();
  id v10 = v7;
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  if (v12) {
    [v12 setDelegate:self];
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v38.receiver = self;
  v38.super_class = (Class)HUAudioAnalysisSettingsItemModuleController;
  [(HUItemModuleController *)&v38 updateCell:v8 forItem:v9 animated:v5];
  objc_opt_class();
  id v10 = v8;
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    objc_opt_class();
    id v13 = v9;
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    id v15 = v14;

    objc_opt_class();
    v16 = [v15 sourceItem];
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
    id v18 = v17;

    id v19 = v18;
    if ([v19 conformsToProtocol:&unk_1F1A3D558]) {
      v20 = v19;
    }
    else {
      v20 = 0;
    }
    id v21 = v20;

    v22 = [v21 accessories];

    v23 = [v22 anyObject];
    v24 = [v23 home];
    int v25 = objc_msgSend(v24, "hf_currentUserIsAdministrator");

    v26 = [v15 sourceItem];
    if ([v26 conformsToProtocol:&unk_1F1A3D2C0]) {
      v27 = v26;
    }
    else {
      v27 = 0;
    }
    id v28 = v27;

    if (v28)
    {
      objc_msgSend(v12, "setOn:", objc_msgSend(v28, "isAudioAnalysisEnabled"));
      [v12 setDisabled:v25 ^ 1u];
      [v12 setIconDisplayStyle:1];
      v29 = +[HUIconCellContentMetrics compactMetrics];
      [v12 setContentMetrics:v29];
    }
  }
  objc_opt_class();
  id v30 = v10;
  if (objc_opt_isKindOfClass()) {
    v31 = v30;
  }
  else {
    v31 = 0;
  }
  id v32 = v31;

  if (v32)
  {
    id v33 = v9;
    v34 = [v33 home];
    uint64_t v35 = [v34 audioAnalysisClassifierOptions];
    uint64_t v36 = [v33 audioDetectionType] & v35;
    uint64_t v37 = [v33 audioDetectionType];

    [v32 setOn:v36 == v37];
  }
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 item];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_opt_class();
    id v9 = [(HUItemModuleController *)self module];
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    id v12 = [v6 item];
    id v13 = [v11 updateAudioAnalysisDetectionSettings:v4 forItem:v12];

    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __68__HUAudioAnalysisSettingsItemModuleController_switchCell_didTurnOn___block_invoke;
    v33[3] = &unk_1E6385A48;
    id v34 = v6;
    BOOL v35 = v4;
    id v14 = (id)[v13 addCompletionBlock:v33];
    id v15 = v34;
  }
  else
  {
    objc_opt_class();
    id v16 = v6;
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
    id v13 = v17;

    objc_opt_class();
    id v18 = [(HUItemModuleController *)self module];
    if (objc_opt_isKindOfClass()) {
      id v19 = v18;
    }
    else {
      id v19 = 0;
    }
    id v15 = v19;

    objc_opt_class();
    v20 = [v13 item];
    if (objc_opt_isKindOfClass()) {
      id v21 = v20;
    }
    else {
      id v21 = 0;
    }
    id v22 = v21;

    objc_opt_class();
    v23 = [v22 sourceItem];
    if (objc_opt_isKindOfClass()) {
      unint64_t v24 = (unint64_t)v23;
    }
    else {
      unint64_t v24 = 0;
    }

    objc_opt_class();
    int v25 = [v22 sourceItem];

    if (objc_opt_isKindOfClass()) {
      unint64_t v26 = (unint64_t)v25;
    }
    else {
      unint64_t v26 = 0;
    }

    if (v24 | v26)
    {
      v27 = [v13 item];
      id v28 = [v15 enableAudioAnalysisSetting:v4 forItem:v27];

      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __68__HUAudioAnalysisSettingsItemModuleController_switchCell_didTurnOn___block_invoke_2;
      v30[3] = &unk_1E6385A48;
      id v31 = v16;
      BOOL v32 = v4;
      id v29 = (id)[v28 addCompletionBlock:v30];
    }
  }
}

uint64_t __68__HUAudioAnalysisSettingsItemModuleController_switchCell_didTurnOn___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return [*(id *)(result + 32) setOn:*(unsigned char *)(result + 40) == 0 animated:1];
  }
  return result;
}

uint64_t __68__HUAudioAnalysisSettingsItemModuleController_switchCell_didTurnOn___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return [*(id *)(result + 32) setOn:*(unsigned char *)(result + 40) == 0 animated:1];
  }
  return result;
}

@end