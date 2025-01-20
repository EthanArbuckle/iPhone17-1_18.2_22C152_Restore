@interface HUEnergySettingsItemModuleController
- (BOOL)canSelectItem:(id)a3;
- (Class)cellClassForItem:(id)a3;
- (unint64_t)didSelectItem:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUEnergySettingsItemModuleController

- (Class)cellClassForItem:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  v6 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  v9 = [v8 gridForecastItem];
  int v10 = [v5 isEqual:v9];

  if (v10) {
    goto LABEL_8;
  }
  v11 = [v8 connectUtilityItem];
  if ([v5 isEqual:v11])
  {

LABEL_8:
    v14 = objc_opt_class();
    goto LABEL_9;
  }
  v12 = [v8 utilityDetailsItem];
  int v13 = [v5 isEqual:v12];

  if (v13) {
    goto LABEL_8;
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"HUEnergySettingsItemModuleController.m", 37, @"Couldn't find a cell class for item: %@", v5 object file lineNumber description];

  v14 = 0;
LABEL_9:

  return (Class)v14;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)HUEnergySettingsItemModuleController;
  [(HUItemModuleController *)&v29 setupCell:v6 forItem:v7];
  objc_opt_class();
  id v8 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  v11 = [v10 connectUtilityItem];

  LODWORD(v10) = [v7 isEqual:v11];
  if (v10)
  {
    id v12 = [v6 defaultContentConfiguration];
    int v13 = [v7 latestResults];
    v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    [v12 setText:v14];

    v15 = (void *)MEMORY[0x1E4F42A80];
    v16 = [v7 latestResults];
    v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F68A00]];
    v18 = [v15 systemImageNamed:v17];
    [v12 setImage:v18];

    v19 = [v7 latestResults];
    v20 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];
    LODWORD(v17) = [v20 BOOLValue];

    if (v17)
    {
      v21 = [MEMORY[0x1E4F428B8] systemGrayColor];
      v22 = [v12 textProperties];
      [v22 setColor:v21];

      v23 = [MEMORY[0x1E4F428B8] systemGrayColor];
      v24 = [v12 imageProperties];
      [v24 setTintColor:v23];
    }
    else
    {
      v23 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
      v24 = [v12 textProperties];
      [v24 setColor:v23];
    }

    double v27 = *MEMORY[0x1E4F43BA0];
    v28 = [v12 imageProperties];
    objc_msgSend(v28, "setReservedLayoutSize:", 37.0, v27);

    [v6 setContentConfiguration:v12];
    [v6 setAccessibilityIdentifier:@"Home.HomeSettings.ConnectUtility"];
  }
  else
  {
    objc_opt_class();
    id v12 = v6;
    if (objc_opt_isKindOfClass()) {
      v25 = v12;
    }
    else {
      v25 = 0;
    }
    id v26 = v25;

    if (v26) {
      [v26 setDelegate:self];
    }
    else {
      id v12 = 0;
    }
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v43.receiver = self;
  v43.super_class = (Class)HUEnergySettingsItemModuleController;
  [(HUItemModuleController *)&v43 updateCell:v9 forItem:v10 animated:v5];
  objc_opt_class();
  v11 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  v14 = [v13 utilityDetailsItem];

  LODWORD(v13) = [v10 isEqual:v14];
  if (v13)
  {
    id v15 = [v9 defaultContentConfiguration];
    v16 = [v10 latestResults];
    v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    [v15 setText:v17];

    v18 = [v10 latestResults];
    v19 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F68990]];
    [v15 setSecondaryText:v19];

    v20 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    v21 = [v15 secondaryTextProperties];
    [v21 setColor:v20];

    v22 = [v10 latestResults];
    v23 = [v22 objectForKeyedSubscript:*MEMORY[0x1E4F689F8]];
    [v15 setImage:v23];

    v24 = [v15 imageProperties];
    objc_msgSend(v24, "setMaximumSize:", 37.0, 37.0);

    v25 = [v15 imageProperties];
    [v25 setCornerRadius:8.325];

    double v26 = *MEMORY[0x1E4F43BA0];
    double v27 = [v15 imageProperties];
    objc_msgSend(v27, "setReservedLayoutSize:", 37.0, v26);

    v28 = [v10 latestResults];
    objc_super v29 = [v28 objectForKeyedSubscript:@"show-connect-utility-item"];
    int v30 = [v29 BOOLValue];

    if (v30)
    {
      v31 = [MEMORY[0x1E4F6A420] preferredFontForTextStyle:*MEMORY[0x1E4F438C8] traits:2];
      v32 = [v15 textProperties];
      [v32 setFont:v31];

      uint64_t v33 = 0;
      uint64_t v34 = 0;
    }
    else
    {
      uint64_t v34 = 3;
      uint64_t v33 = 1;
    }
    [v9 setAccessoryType:v33];
    [v9 setSelectionStyle:v34];
    [v9 setContentConfiguration:v15];
    [v9 setAccessibilityIdentifier:@"Home.HomeSettings.UtilityDetails"];
  }
  else
  {
    objc_opt_class();
    id v15 = v9;
    if (objc_opt_isKindOfClass()) {
      v35 = v15;
    }
    else {
      v35 = 0;
    }
    id v36 = v35;

    if (v36)
    {
      v37 = [(HUItemModuleController *)self module];
      v38 = [v37 home];
      uint64_t v39 = objc_msgSend(v38, "hf_isGridForecastEnabled");

      v40 = HFLogForCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        v45 = self;
        __int16 v46 = 2112;
        v47 = v41;
        __int16 v48 = 1024;
        int v49 = v39;
        _os_log_impl(&dword_1BE345000, v40, OS_LOG_TYPE_DEFAULT, "%@:%@ Update switch cell (Show Grid Forecast? --> %{BOOL}d)", buf, 0x1Cu);
      }
      [v36 setOn:v39];
      [v36 setAccessibilityIdentifier:@"Home.HomeSettings.ShowGridForecast"];
      v42 = [v36 accessoryView];
      [v42 setAccessibilityIdentifier:@"Home.HomeSettings.ShowGridForecastSwitch"];
    }
    else
    {
      id v15 = 0;
    }
  }
}

- (BOOL)canSelectItem:(id)a3
{
  v3 = [a3 latestResults];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];
  char v5 = [v4 BOOLValue] ^ 1;

  return v5;
}

- (unint64_t)didSelectItem:(id)a3
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  char v5 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 connectUtilityItem];
  int v9 = [v4 isEqual:v8];

  if (v9)
  {
    id v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "didSelectItem: connectUtilityItem", v32, 2u);
    }

    v11 = [(HUItemModuleController *)self module];
    id v12 = [v11 home];
    v35[0] = *MEMORY[0x1E4F684E8];
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
    v14 = [(HUItemModuleController *)self host];
    uint64_t v33 = @"OnboardingDisplayOption_OnboardingFromUserInput";
    uint64_t v34 = MEMORY[0x1E4F1CC38];
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    id v16 = +[HUHomeFeatureOnboardingUtilities home:v12 onboardFeaturesForKeyPaths:v13 presentingViewController:v14 usageOptions:v15];

    +[HUHomeEnergyAnalyticsHelper sendUtilityOnboardingEntryPointInSettingsTappedEvent];
  }
  v17 = [v7 utilityDetailsItem];
  int v18 = [v4 isEqual:v17];

  if (v18
    && ([v4 latestResults],
        v19 = objc_claimAutoreleasedReturnValue(),
        [v19 objectForKeyedSubscript:@"show-connect-utility-item"],
        v20 = objc_claimAutoreleasedReturnValue(),
        char v21 = [v20 BOOLValue],
        v20,
        v19,
        (v21 & 1) == 0))
  {
    v23 = HFLogForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_1BE345000, v23, OS_LOG_TYPE_DEFAULT, "didSelectItem: utilityDetailsItem", v32, 2u);
    }

    v24 = [_TtC6HomeUI28UtilityDetailsViewController alloc];
    v25 = [v7 home];
    double v26 = [v7 detailsDict];
    double v27 = [(UtilityDetailsViewController *)v24 initWithHome:v25 details:v26];

    v28 = +[HUViewControllerPresentationRequest requestWithViewController:v27];
    unint64_t v22 = 1;
    [v28 setAnimated:1];
    [v28 setPreferredPresentationType:1];
    objc_super v29 = [(HUItemModuleController *)self host];
    id v30 = (id)[v29 moduleController:self presentViewControllerForRequest:v28];
  }
  else
  {
    unint64_t v22 = 0;
  }

  return v22;
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    int v16 = 138412802;
    v17 = self;
    __int16 v18 = 2112;
    v19 = v8;
    __int16 v20 = 1024;
    BOOL v21 = v4;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ User toggled switch. Show Grid Forecast? --> %{BOOL}d", (uint8_t *)&v16, 0x1Cu);
  }
  int v9 = [(HUItemModuleController *)self module];
  id v10 = [v9 home];
  objc_msgSend(v10, "hf_setIsGridForecastEnabled:", v4);

  v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = NSStringFromSelector(a2);
    id v13 = [(HUItemModuleController *)self module];
    v14 = [v13 home];
    int v15 = objc_msgSend(v14, "hf_isGridForecastEnabled");
    int v16 = 138412802;
    v17 = self;
    __int16 v18 = 2112;
    v19 = v12;
    __int16 v20 = 1024;
    BOOL v21 = v15;
    _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@ Updated user defaults %{BOOL}d ", (uint8_t *)&v16, 0x1Cu);
  }
}

@end