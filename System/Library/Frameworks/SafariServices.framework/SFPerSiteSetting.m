@interface SFPerSiteSetting
- (BOOL)BOOLValue;
- (NSArray)actions;
- (NSString)displayName;
- (NSString)identifier;
- (SFBrowsingAssistantPerSiteSettingObserving)observer;
- (SFPerSiteSetting)initWithPreference:(id)a3 manager:(id)a4 domain:(id)a5;
- (id)_displayInformation;
- (id)confirmationAlertForSwitchCell:(id)a3;
- (unint64_t)displayOption;
- (void)_setPreferenceValue:(id)a3;
- (void)setBoolValue:(BOOL)a3;
- (void)setObserver:(id)a3;
@end

@implementation SFPerSiteSetting

- (SFPerSiteSetting)initWithPreference:(id)a3 manager:(id)a4 domain:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(SFPerSiteSetting *)self init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_domain, a5);
    objc_storeStrong((id *)&v13->_manager, a4);
    objc_storeStrong((id *)&v13->_preference, a3);
    objc_initWeak(&location, v13);
    preference = v13->_preference;
    domain = v13->_domain;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __54__SFPerSiteSetting_initWithPreference_manager_domain___block_invoke;
    v18[3] = &unk_1E5C77EB0;
    objc_copyWeak(&v19, &location);
    [v10 getValueOfPreference:preference forDomain:domain withTimeout:0 usingBlock:v18];
    v16 = v13;
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __54__SFPerSiteSetting_initWithPreference_manager_domain___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__SFPerSiteSetting_initWithPreference_manager_domain___block_invoke_2;
  v5[3] = &unk_1E5C72DE0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

uint64_t __54__SFPerSiteSetting_initWithPreference_manager_domain___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    ++WeakRetained;
    if (!v3[1])
    {
      id v6 = v3;
      objc_storeStrong(WeakRetained, *(id *)(a1 + 32));
      id v4 = objc_loadWeakRetained(v6 + 5);
      [v4 perSiteSettingDidUpdate:v6];
    }
  }

  return MEMORY[0x1F4181820](WeakRetained);
}

- (void)setObserver:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_observer, obj);
    [obj perSiteSettingDidUpdate:self];
  }
}

- (id)_displayInformation
{
  return +[_SFPerSitePreferencePopoverDisplayInformation popoverDisplayInformationForPerSitePreference:self->_preference];
}

- (NSString)displayName
{
  v2 = [(SFPerSiteSetting *)self _displayInformation];
  id v3 = [v2 localizedDisplayName];

  return (NSString *)v3;
}

- (NSString)identifier
{
  return (NSString *)[(WBSPerSitePreference *)self->_preference identifier];
}

- (unint64_t)displayOption
{
  v2 = [(SFPerSiteSetting *)self _displayInformation];
  uint64_t v3 = [v2 displayOption];

  return v3 != 1;
}

- (NSArray)actions
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(WBSPerSitePreferenceManager *)self->_manager valuesForPreference:self->_preference];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __27__SFPerSiteSetting_actions__block_invoke;
  v6[3] = &unk_1E5C77ED8;
  v6[4] = self;
  objc_copyWeak(&v7, &location);
  id v4 = objc_msgSend(v3, "safari_mapObjectsUsingBlock:", v6);
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);

  return (NSArray *)v4;
}

id __27__SFPerSiteSetting_actions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 24) localizedStringForValue:v3 inPreference:*(void *)(*(void *)(a1 + 32) + 32)];
  v5 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __27__SFPerSiteSetting_actions__block_invoke_2;
  v12 = &unk_1E5C721C0;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  id v6 = v3;
  id v13 = v6;
  id v7 = [v5 actionWithTitle:v4 image:0 identifier:0 handler:&v9];
  if (objc_msgSend(v6, "isEqual:", *(void *)(*(void *)(a1 + 32) + 8), v9, v10, v11, v12)) {
    [v7 setState:1];
  }

  objc_destroyWeak(&v14);

  return v7;
}

void __27__SFPerSiteSetting_actions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _setPreferenceValue:*(void *)(a1 + 32)];
}

- (void)_setPreferenceValue:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F98948] sharedLogger];
  id v6 = [(WBSPerSitePreference *)self->_preference identifier];
  [v5 didModifyPerSitePreferencesWithPreferenceIdentifier:v6 modificationLevel:1 type:0 method:1];

  id cachedValue = self->_cachedValue;
  self->_id cachedValue = v4;
  id v8 = v4;

  objc_opt_class();
  BOOL v9 = (objc_opt_isKindOfClass() & 1) == 0;
  manager = self->_manager;
  preference = self->_preference;
  domain = self->_domain;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __40__SFPerSiteSetting__setPreferenceValue___block_invoke;
  v13[3] = &__block_descriptor_33_e8_v12__0B8l;
  BOOL v14 = v9;
  [(WBSPerSitePreferenceManager *)manager setValue:v8 ofPreference:preference forDomain:domain completionHandler:v13];
}

void __40__SFPerSiteSetting__setPreferenceValue___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    if (*(unsigned char *)(a1 + 32)) {
      dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_57);
    }
  }
}

uint64_t __40__SFPerSiteSetting__setPreferenceValue___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E4F28C40], "_sf_postPerSitePreferencesDidChangeDistributedNotification");
}

- (id)confirmationAlertForSwitchCell:(id)a3
{
  id v4 = a3;
  v5 = [(WBSPerSitePreference *)self->_preference identifier];
  if (WBSIsEqual())
  {
    char v6 = [v4 isOn];

    if ((v6 & 1) == 0)
    {
      id v7 = (void *)MEMORY[0x1E4FB1418];
      id v8 = NSString;
      BOOL v9 = _WBSLocalizedString();
      uint64_t v10 = objc_msgSend(v8, "localizedStringWithFormat:", v9, self->_domain);
      id v11 = _WBSLocalizedString();
      v12 = [v7 alertControllerWithTitle:v10 message:v11 preferredStyle:1];

      id v13 = (void *)MEMORY[0x1E4FB1410];
      BOOL v14 = _WBSLocalizedString();
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __51__SFPerSiteSetting_confirmationAlertForSwitchCell___block_invoke;
      v23[3] = &unk_1E5C72898;
      id v24 = v4;
      v15 = [v13 actionWithTitle:v14 style:1 handler:v23];
      [v12 addAction:v15];

      objc_initWeak(&location, self);
      v16 = (void *)MEMORY[0x1E4FB1410];
      v17 = _WBSLocalizedString();
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __51__SFPerSiteSetting_confirmationAlertForSwitchCell___block_invoke_2;
      v20[3] = &unk_1E5C72B18;
      objc_copyWeak(&v21, &location);
      v18 = [v16 actionWithTitle:v17 style:2 handler:v20];
      [v12 addAction:v18];

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);

      goto LABEL_6;
    }
  }
  else
  {
  }
  v12 = 0;
LABEL_6:

  return v12;
}

uint64_t __51__SFPerSiteSetting_confirmationAlertForSwitchCell___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setOn:1];
}

void __51__SFPerSiteSetting_confirmationAlertForSwitchCell___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setBoolValue:0];
}

- (BOOL)BOOLValue
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id cachedValue = self->_cachedValue;

  return [cachedValue BOOLValue];
}

- (void)setBoolValue:(BOOL)a3
{
  id v4 = +[_SFPerSitePreferencesUtilities preferenceValueForBoolValue:a3 preference:self->_preference preferenceManager:self->_manager];
  [(SFPerSiteSetting *)self _setPreferenceValue:v4];
}

- (SFBrowsingAssistantPerSiteSettingObserving)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (SFBrowsingAssistantPerSiteSettingObserving *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_preference, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_domain, 0);

  objc_storeStrong(&self->_cachedValue, 0);
}

@end