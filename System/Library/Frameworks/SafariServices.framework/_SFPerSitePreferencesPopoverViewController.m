@interface _SFPerSitePreferencesPopoverViewController
- (BOOL)safari_prefersHalfHeightSheetPresentationWithLoweredBar;
- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4;
- (SFBrowsingAssistantMenuSection)pageMenuSection;
- (_SFBrowserDocument)browserDocument;
- (_SFPerSitePreferencesPopoverViewController)initWithBrowserDocument:(id)a3 perSitePreferencesVendor:(id)a4;
- (id)_generalPageSection;
- (id)_indexPathForView:(id)a3;
- (id)_preferenceAtIndexPath:(id)a3;
- (id)_preferenceRowIndexPathForCellAtIndexPath:(id)a3;
- (id)_securePageSection;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_didRetrieveValue:(id)a3 forPreference:(id)a4;
- (void)_done:(id)a3;
- (void)_initializePreferences;
- (void)_presentPrivacyToggledInGuestUserAlert;
- (void)_setPreferenceValue:(id)a3 forPreference:(id)a4;
- (void)reloadPreferences;
- (void)switchTableViewCell:(id)a3 didChangeSwitchState:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
@end

@implementation _SFPerSitePreferencesPopoverViewController

- (_SFPerSitePreferencesPopoverViewController)initWithBrowserDocument:(id)a3 perSitePreferencesVendor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_SFPerSitePreferencesPopoverViewController;
  v8 = [(_SFPerSitePreferencesPopoverViewController *)&v20 initWithStyle:2];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_browserDocument, v6);
    v10 = [v6 URLForPerSitePreferences];
    uint64_t v11 = objc_msgSend(v10, "safari_userVisibleHostWithoutWWWSubdomain");
    domain = v9->_domain;
    v9->_domain = (NSString *)v11;

    v9->_shouldShowSecurePagePreferences = [v6 isSecure];
    v9->_shouldShowLockdownPreference = [MEMORY[0x1E4F98F60] isLockdownModeEnabledForSafari];
    objc_storeStrong((id *)&v9->_perSitePreferencesVendor, a4);
    [(_SFPerSitePreferencesPopoverViewController *)v9 _initializePreferences];
    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    preferenceToValueCache = v9->_preferenceToValueCache;
    v9->_preferenceToValueCache = (NSMutableDictionary *)v13;

    v15 = NSString;
    v16 = _WBSLocalizedString();
    v17 = objc_msgSend(v15, "stringWithFormat:", v16, v9->_domain);
    [(_SFPerSitePreferencesPopoverViewController *)v9 setTitle:v17];

    v18 = v9;
  }

  return v9;
}

- (SFBrowsingAssistantMenuSection)pageMenuSection
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!self->_preferencesBySections) {
    [(_SFPerSitePreferencesPopoverViewController *)self _initializePreferences];
  }
  v3 = [MEMORY[0x1E4F78210] websiteSettingsSectionForDomain:self->_domain];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obj = self->_preferencesBySections;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = [*(id *)(*((void *)&v15 + 1) + 8 * i) preferences];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __61___SFPerSitePreferencesPopoverViewController_pageMenuSection__block_invoke;
        v14[3] = &unk_1E5C76030;
        v14[4] = self;
        v9 = objc_msgSend(v8, "safari_mapObjectsUsingBlock:", v14);

        v10 = [v3 settings];
        uint64_t v11 = [v10 arrayByAddingObjectsFromArray:v9];
        [v3 setSettings:v11];
      }
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  return (SFBrowsingAssistantMenuSection *)v3;
}

- (void)_initializePreferences
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(_SFPerSitePreferencesPopoverViewController *)self _generalPageSection];
  uint64_t v4 = (void *)v3;
  if (self->_shouldShowSecurePagePreferences)
  {
    uint64_t v5 = [(_SFPerSitePreferencesPopoverViewController *)self _securePageSection];
    v9[1] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    preferencesBySections = self->_preferencesBySections;
    self->_preferencesBySections = v6;
  }
  else
  {
    v10[0] = v3;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    uint64_t v5 = self->_preferencesBySections;
    self->_preferencesBySections = v8;
  }
}

- (id)_securePageSection
{
  v15[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(_SFPerSitePreferencesVendor *)self->_perSitePreferencesVendor sharedUserMediaPermissionController];
  uint64_t v5 = [v4 cameraMediaCapturePreference];
  v15[0] = v5;
  uint64_t v6 = [v4 microphoneMediaCapturePreference];
  v15[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  [v3 addObjectsFromArray:v7];

  v8 = [(_SFPerSitePreferencesVendor *)self->_perSitePreferencesVendor sharedGeolocationPermissionManager];
  v9 = [v8 geolocationPreference];
  [v3 addObject:v9];

  v10 = NSString;
  uint64_t v11 = _WBSLocalizedString();
  v12 = objc_msgSend(v10, "stringWithFormat:", v11, self->_domain);

  uint64_t v13 = [[_SFPerSitePreferencesSection alloc] initWithTitle:v12 preferences:v3];

  return v13;
}

- (id)_generalPageSection
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(_SFPerSitePreferencesVendor *)self->_perSitePreferencesVendor requestDesktopSitePreferenceManager];
  uint64_t v5 = [v4 requestDesktopSitePreference];
  [v3 addObject:v5];

  uint64_t v6 = [(_SFPerSitePreferencesVendor *)self->_perSitePreferencesVendor automaticReaderActivationManager];
  id v7 = [v6 readerPreference];
  [v3 addObject:v7];

  v8 = [(_SFPerSitePreferencesVendor *)self->_perSitePreferencesVendor contentBlockersPreferenceManager];
  if ([v8 hasEnabledContentBlockers])
  {
    v9 = [v8 contentBlockersPreference];
    [v3 addObject:v9];
  }
  if (self->_shouldShowLockdownPreference)
  {
    v10 = [(_SFPerSitePreferencesVendor *)self->_perSitePreferencesVendor lockdownModePreferenceManager];
    uint64_t v11 = [v10 lockdownPreference];
    [v3 addObject:v11];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserDocument);
  int v13 = [WeakRetained browserHasMultipleProfiles];

  if (v13)
  {
    v14 = [(_SFPerSitePreferencesVendor *)self->_perSitePreferencesVendor profilePreferenceManager];
    long long v15 = [v14 profilePreference];
    [v3 addObject:v15];
  }
  long long v16 = NSString;
  long long v17 = _WBSLocalizedString();
  long long v18 = objc_msgSend(v16, "stringWithFormat:", v17, self->_domain);

  v19 = [[_SFPerSitePreferencesSection alloc] initWithTitle:v18 preferences:v3];

  return v19;
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)_SFPerSitePreferencesPopoverViewController;
  [(_SFPerSitePreferencesPopoverViewController *)&v10 viewDidLayoutSubviews];
  if ([(_SFPerSitePreferencesPopoverViewController *)self _isInPopoverPresentation])
  {
    uint64_t v3 = [(_SFPerSitePreferencesPopoverViewController *)self navigationItem];
    uint64_t v4 = v3;
    uint64_t v5 = 0;
  }
  else
  {
    doneButton = self->_doneButton;
    if (!doneButton)
    {
      id v7 = objc_alloc(MEMORY[0x1E4FB14A8]);
      v8 = (UIBarButtonItem *)objc_msgSend(v7, "initWithBarButtonSystemItem:target:action:", objc_msgSend(MEMORY[0x1E4FB14A8], "_sf_popoverDoneButtonItem"), self, sel__done_);
      v9 = self->_doneButton;
      self->_doneButton = v8;

      doneButton = self->_doneButton;
    }
    uint64_t v3 = [(_SFPerSitePreferencesPopoverViewController *)self navigationItem];
    uint64_t v4 = v3;
    uint64_t v5 = doneButton;
  }
  objc_msgSend(v3, "sf_setPreferredDismissOrDoneButtonItem:", v5);
}

- (void)reloadPreferences
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  preferenceToValueCache = self->_preferenceToValueCache;
  self->_preferenceToValueCache = v3;

  [(_SFPerSitePreferencesPopoverViewController *)self _initializePreferences];
  id v5 = [(_SFPerSitePreferencesPopoverViewController *)self tableView];
  [v5 reloadData];
}

- (void)_done:(id)a3
{
}

- (id)_indexPathForView:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v6 = [v5 superview];

      id v5 = (void *)v6;
      if (!v6) {
        goto LABEL_5;
      }
    }
    v8 = [(_SFPerSitePreferencesPopoverViewController *)self tableView];
    id v7 = [v8 indexPathForCell:v5];
  }
  else
  {
LABEL_5:
    id v7 = 0;
  }

  return v7;
}

- (void)_presentPrivacyToggledInGuestUserAlert
{
  uint64_t v3 = (void *)MEMORY[0x1E4FB1418];
  id v4 = _WBSLocalizedString();
  id v5 = _WBSLocalizedString();
  id v9 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  uint64_t v6 = (void *)MEMORY[0x1E4FB1410];
  id v7 = _WBSLocalizedString();
  v8 = [v6 actionWithTitle:v7 style:0 handler:0];
  [v9 addAction:v8];

  [(_SFPerSitePreferencesPopoverViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)_setPreferenceValue:(id)a3 forPreference:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = [(_SFPerSitePreferencesVendor *)self->_perSitePreferencesVendor managerForPreference:v7];
  id v9 = [MEMORY[0x1E4F98948] sharedLogger];
  objc_super v10 = [v7 identifier];
  [v9 didModifyPerSitePreferencesWithPreferenceIdentifier:v10 modificationLevel:1 type:0 method:1];

  [(NSMutableDictionary *)self->_preferenceToValueCache setObject:v6 forKeyedSubscript:v7];
  objc_initWeak(&from, v8);
  domain = self->_domain;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80___SFPerSitePreferencesPopoverViewController__setPreferenceValue_forPreference___block_invoke;
  v12[3] = &unk_1E5C76058;
  objc_copyWeak(&v13, &location);
  objc_copyWeak(&v14, &from);
  [v8 setValue:v6 ofPreference:v7 forDomain:domain completionHandler:v12];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&from);

  objc_destroyWeak(&location);
}

- (void)_didRetrieveValue:(id)a3 forPreference:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(NSMutableDictionary *)self->_preferenceToValueCache objectForKeyedSubscript:v6];

  if (!v7)
  {
    [(NSMutableDictionary *)self->_preferenceToValueCache setObject:v9 forKeyedSubscript:v6];
    v8 = [(_SFPerSitePreferencesPopoverViewController *)self tableView];
    [v8 reloadData];
  }
}

- (id)_preferenceRowIndexPathForCellAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_expandedRowIndexPath
    && (uint64_t v6 = [v4 section], v6 == -[NSIndexPath section](self->_expandedRowIndexPath, "section"))
    && (uint64_t v7 = [v5 row], v8 = -[NSIndexPath row](self->_expandedRowIndexPath, "row"), v7 > v8))
  {
    int64_t numberOfValuesInExpandedPreference = self->_numberOfValuesInExpandedPreference;
    if (v7 >= numberOfValuesInExpandedPreference + v8)
    {
      objc_super v10 = [MEMORY[0x1E4F28D58] indexPathForRow:v7 - numberOfValuesInExpandedPreference inSection:v6];
    }
    else
    {
      objc_super v10 = self->_expandedRowIndexPath;
    }
  }
  else
  {
    objc_super v10 = v5;
  }
  uint64_t v11 = v10;

  return v11;
}

- (id)_preferenceAtIndexPath:(id)a3
{
  preferencesBySections = self->_preferencesBySections;
  id v4 = a3;
  id v5 = -[NSArray objectAtIndexedSubscript:](preferencesBySections, "objectAtIndexedSubscript:", [v4 section]);
  uint64_t v6 = [v5 preferences];
  uint64_t v7 = [v4 row];

  NSInteger v8 = [v6 objectAtIndexedSubscript:v7];

  return v8;
}

- (BOOL)safari_prefersHalfHeightSheetPresentationWithLoweredBar
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_preferencesBySections count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v6 = [(NSArray *)self->_preferencesBySections objectAtIndexedSubscript:a4];
  uint64_t v7 = [v6 preferences];
  int64_t v8 = [v7 count];

  expandedRowIndexPath = self->_expandedRowIndexPath;
  if (expandedRowIndexPath && [(NSIndexPath *)expandedRowIndexPath section] == a4) {
    v8 += self->_numberOfValuesInExpandedPreference;
  }
  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v4 = [(NSArray *)self->_preferencesBySections objectAtIndexedSubscript:a4];
  id v5 = [v4 title];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(_SFPerSitePreferencesPopoverViewController *)self _preferenceRowIndexPathForCellAtIndexPath:v7];
  id v9 = [(_SFPerSitePreferencesPopoverViewController *)self _preferenceAtIndexPath:v8];
  objc_super v10 = +[_SFPerSitePreferencePopoverDisplayInformation popoverDisplayInformationForPerSitePreference:v9];
  uint64_t v11 = [v10 displayOption];
  v12 = [(_SFPerSitePreferencesVendor *)self->_perSitePreferencesVendor managerForPreference:v9];
  id v13 = [(NSMutableDictionary *)self->_preferenceToValueCache objectForKeyedSubscript:v9];
  if (!v13)
  {
    uint64_t v43 = 0;
    objc_initWeak(&location, self);
    domain = self->_domain;
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __78___SFPerSitePreferencesPopoverViewController_tableView_cellForRowAtIndexPath___block_invoke;
    v47[3] = &unk_1E5C76080;
    objc_copyWeak(&v49, &location);
    id v48 = v9;
    [v12 getValueOfPreference:v48 forDomain:domain withTimeout:0 usingBlock:v47];

    objc_destroyWeak(&v49);
    objc_destroyWeak(&location);
    id v13 = 0;
  }
  if (v11 == 1)
  {
    v44 = v12;
    id v45 = v6;
    expandedRowIndexPath = self->_expandedRowIndexPath;
    if (expandedRowIndexPath
      && (uint64_t v20 = -[NSIndexPath section](expandedRowIndexPath, "section"), v20 == [v7 section])
      && (uint64_t v21 = [v7 row], v21 > -[NSIndexPath row](self->_expandedRowIndexPath, "row"))
      && (int64_t v22 = [v7 row],
          v22 <= self->_numberOfValuesInExpandedPreference + [(NSIndexPath *)self->_expandedRowIndexPath row]))
    {
      long long v15 = [v6 dequeueReusableCellWithIdentifier:@"expandedMultipleChoiceOptionTableViewCell"];
      if (!v15)
      {
        long long v15 = (SFSwitchTableViewCell *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:@"expandedMultipleChoiceOptionTableViewCell"];
        v31 = [(SFSwitchTableViewCell *)v15 textLabel];
        [v31 setNumberOfLines:0];

        v32 = [(SFSwitchTableViewCell *)v15 imageView];
        v33 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark"];
        [v32 setImage:v33];

        v34 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8] scale:1];
        [v32 setPreferredSymbolConfiguration:v34];

        id v6 = v45;
        [v32 setHidden:1];
      }
      uint64_t v35 = objc_msgSend(v7, "row", v43);
      uint64_t v36 = v35 + ~[v8 row];
      double v37 = 15.0;
      if (v36 != self->_numberOfValuesInExpandedPreference - 1) {
        double v37 = 44.0;
      }
      -[SFSwitchTableViewCell setSeparatorInset:](v15, "setSeparatorInset:", 0.0, v37, 0.0, 0.0);
      v46 = [v12 valuesForPreference:v9];
      v38 = [v46 objectAtIndexedSubscript:v36];
      v39 = [v12 localizedStringForValue:v38 inPreference:v9];
      v40 = [(SFSwitchTableViewCell *)v15 textLabel];
      [v40 setText:v39];

      uint64_t v41 = [v13 isEqual:v38] ^ 1;
      v42 = [(SFSwitchTableViewCell *)v15 imageView];
      [v42 setHidden:v41];

      v12 = v44;
    }
    else
    {
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", @"multipleChoiceTableViewCell", v43);
      long long v15 = (SFSwitchTableViewCell *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        long long v15 = (SFSwitchTableViewCell *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:@"multipleChoiceTableViewCell"];
        [(SFSwitchTableViewCell *)v15 setSelectionStyle:0];
        v23 = [(SFSwitchTableViewCell *)v15 textLabel];
        [v23 setNumberOfLines:0];
      }
      v24 = [v10 localizedDisplayName];
      v25 = [(SFSwitchTableViewCell *)v15 textLabel];
      [v25 setText:v24];

      if (v13)
      {
        v26 = [v44 localizedStringForValue:v13 inPreference:v9];
      }
      else
      {
        v26 = &stru_1EFB97EB8;
      }
      v27 = [(SFSwitchTableViewCell *)v15 detailTextLabel];
      [v27 setText:v26];

      if (v13) {
      if ([v7 isEqual:self->_expandedRowIndexPath])
      }
        [v6 tintColor];
      else {
      v28 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      }
      v12 = v44;
      v29 = [(SFSwitchTableViewCell *)v15 detailTextLabel];
      [v29 setTextColor:v28];
    }
  }
  else if (v11)
  {
    long long v15 = 0;
  }
  else
  {
    long long v15 = [v6 dequeueReusableCellWithIdentifier:@"toggleOptionTableViewCell"];
    if (!v15)
    {
      long long v15 = [[SFSwitchTableViewCell alloc] initWithReuseIdentifier:@"toggleOptionTableViewCell"];
      [(SFSwitchTableViewCell *)v15 setDelegate:self];
      [(SFSwitchTableViewCell *)v15 setSelectionStyle:0];
      long long v16 = [(SFSwitchTableViewCell *)v15 textLabel];
      [v16 setNumberOfLines:0];
    }
    long long v17 = objc_msgSend(v10, "localizedDisplayName", v43);
    long long v18 = [(SFSwitchTableViewCell *)v15 textLabel];
    [v18 setText:v17];

    if (v13) {
      [(SFSwitchTableViewCell *)v15 setSwitchOn:+[_SFPerSitePreferencesUtilities isBinaryPreferenceValueOn:v13 preference:v9 preferenceManager:v12]];
    }
  }

  return v15;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(_SFPerSitePreferencesPopoverViewController *)self _preferenceRowIndexPathForCellAtIndexPath:v7];
  id v9 = [(_SFPerSitePreferencesPopoverViewController *)self _preferenceAtIndexPath:v8];
  objc_super v10 = +[_SFPerSitePreferencePopoverDisplayInformation popoverDisplayInformationForPerSitePreference:v9];
  uint64_t v11 = [v10 displayOption];

  if (v11 == 1)
  {
    p_expandedRowIndexPath = &self->_expandedRowIndexPath;
    v54 = v9;
    if ([v8 isEqual:self->_expandedRowIndexPath]
      && ([v7 isEqual:*p_expandedRowIndexPath] & 1) == 0)
    {
      uint64_t v40 = [v7 row];
      uint64_t v48 = v40 + ~[(NSIndexPath *)*p_expandedRowIndexPath row];
      uint64_t v41 = [(_SFPerSitePreferencesVendor *)self->_perSitePreferencesVendor managerForPreference:v9];
      v51 = [v41 valuesForPreference:v9];

      v42 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:self->_numberOfValuesInExpandedPreference + 1];
      if ((self->_numberOfValuesInExpandedPreference & 0x8000000000000000) == 0)
      {
        int64_t v43 = -1;
        do
        {
          v44 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", ++v43 + objc_msgSend(v8, "row"), objc_msgSend(v8, "section"));
          [v42 addObject:v44];
        }
        while (v43 < self->_numberOfValuesInExpandedPreference);
      }
      id v45 = [v51 objectAtIndexedSubscript:v48];
      [(_SFPerSitePreferencesPopoverViewController *)self _setPreferenceValue:v45 forPreference:v9];

      v46 = (void *)MEMORY[0x1E4FB1EB0];
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __80___SFPerSitePreferencesPopoverViewController_tableView_didSelectRowAtIndexPath___block_invoke;
      v55[3] = &unk_1E5C72238;
      id v56 = v6;
      id v57 = v42;
      id v47 = v42;
      [v46 performWithoutAnimation:v55];
    }
    else
    {
      [v6 beginUpdates];
      char v13 = [(NSIndexPath *)*p_expandedRowIndexPath isEqual:v7];
      char v14 = v13;
      long long v15 = &OBJC_IVAR____SFSafariViewControllerPrewarmingSession__remoteViewController;
      unint64_t v16 = 0x1E4F1C000uLL;
      id v52 = v7;
      v53 = v6;
      if (*p_expandedRowIndexPath)
      {
        char v49 = v13;
        long long v17 = objc_msgSend(v6, "cellForRowAtIndexPath:");
        long long v18 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        v19 = [v17 detailTextLabel];
        [v19 setTextColor:v18];

        uint64_t v20 = [(NSIndexPath *)*p_expandedRowIndexPath section];
        uint64_t v21 = [(NSIndexPath *)*p_expandedRowIndexPath row];
        int64_t v22 = [MEMORY[0x1E4F1CA48] array];
        if (self->_numberOfValuesInExpandedPreference >= 1)
        {
          int64_t v23 = 0;
          uint64_t v24 = v21 + 1;
          do
          {
            v25 = [MEMORY[0x1E4F28D58] indexPathForRow:v24 + v23 inSection:v20];
            [v22 addObject:v25];

            ++v23;
          }
          while (v23 < self->_numberOfValuesInExpandedPreference);
        }
        id v6 = v53;
        [v53 deleteRowsAtIndexPaths:v22 withRowAnimation:0];

        v26 = *p_expandedRowIndexPath;
        id v7 = v52;
        id v9 = v54;
        unint64_t v16 = 0x1E4F1C000;
        char v14 = v49;
        long long v15 = &OBJC_IVAR____SFSafariViewControllerPrewarmingSession__remoteViewController;
      }
      else
      {
        v26 = 0;
      }
      *p_expandedRowIndexPath = 0;

      uint64_t v27 = v15[210];
      *(Class *)((char *)&self->super.super.super.super.isa + v27) = 0;
      if ((v14 & 1) == 0)
      {
        v28 = [v6 cellForRowAtIndexPath:v7];
        [v6 tintColor];
        v30 = unint64_t v29 = v16;
        v50 = v28;
        v31 = [v28 detailTextLabel];
        [v31 setTextColor:v30];

        objc_storeStrong((id *)&self->_expandedRowIndexPath, v8);
        v32 = [(_SFPerSitePreferencesVendor *)self->_perSitePreferencesVendor managerForPreference:v9];
        v33 = [v32 valuesForPreference:v9];
        *(Class *)((char *)&self->super.super.super.super.isa + v27) = (Class)[v33 count];

        uint64_t v34 = [(NSIndexPath *)*p_expandedRowIndexPath section];
        uint64_t v35 = [(NSIndexPath *)*p_expandedRowIndexPath row];
        uint64_t v36 = [*(id *)(v29 + 2632) array];
        if (*(uint64_t *)((char *)&self->super.super.super.super.isa + v27) >= 1)
        {
          uint64_t v37 = 0;
          uint64_t v38 = v35 + 1;
          do
          {
            v39 = [MEMORY[0x1E4F28D58] indexPathForRow:v38 + v37 inSection:v34];
            [v36 addObject:v39];

            ++v37;
          }
          while (v37 < *(uint64_t *)((char *)&self->super.super.super.super.isa + v27));
        }
        id v6 = v53;
        [v53 insertRowsAtIndexPaths:v36 withRowAnimation:0];

        id v7 = v52;
        id v9 = v54;
      }
      [v6 endUpdates];
    }
  }
}

- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  id v5 = [(_SFPerSitePreferencesPopoverViewController *)self _preferenceRowIndexPathForCellAtIndexPath:a4];
  id v6 = [(_SFPerSitePreferencesPopoverViewController *)self _preferenceAtIndexPath:v5];
  id v7 = +[_SFPerSitePreferencePopoverDisplayInformation popoverDisplayInformationForPerSitePreference:v6];
  uint64_t v8 = [v7 displayOption];

  return v8 != 0;
}

- (void)switchTableViewCell:(id)a3 didChangeSwitchState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(_SFPerSitePreferencesPopoverViewController *)self tableView];
  uint64_t v8 = [v7 indexPathForCell:v6];

  if (v8)
  {
    id v9 = [(_SFPerSitePreferencesPopoverViewController *)self _preferenceRowIndexPathForCellAtIndexPath:v8];
    objc_super v10 = [(_SFPerSitePreferencesPopoverViewController *)self _preferenceAtIndexPath:v9];

    uint64_t v11 = [v10 identifier];
    int v12 = WBSIsEqual();

    if (v12) {
      BOOL v13 = !v4;
    }
    else {
      BOOL v13 = 0;
    }
    if (v13)
    {
      unint64_t v16 = (void *)MEMORY[0x1E4FB1418];
      long long v17 = NSString;
      long long v18 = _WBSLocalizedString();
      v19 = objc_msgSend(v17, "localizedStringWithFormat:", v18, self->_domain);
      uint64_t v20 = _WBSLocalizedString();
      uint64_t v21 = [v16 alertControllerWithTitle:v19 message:v20 preferredStyle:1];

      int64_t v22 = (void *)MEMORY[0x1E4FB1410];
      int64_t v23 = _WBSLocalizedString();
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __87___SFPerSitePreferencesPopoverViewController_switchTableViewCell_didChangeSwitchState___block_invoke;
      v31[3] = &unk_1E5C72898;
      id v32 = v6;
      uint64_t v24 = [v22 actionWithTitle:v23 style:1 handler:v31];
      [v21 addAction:v24];

      v25 = (void *)MEMORY[0x1E4FB1410];
      v26 = _WBSLocalizedString();
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __87___SFPerSitePreferencesPopoverViewController_switchTableViewCell_didChangeSwitchState___block_invoke_2;
      v28[3] = &unk_1E5C760A8;
      v28[4] = self;
      BOOL v30 = v4;
      id v29 = v10;
      uint64_t v27 = [v25 actionWithTitle:v26 style:2 handler:v28];
      [v21 addAction:v27];

      [(_SFPerSitePreferencesPopoverViewController *)self presentViewController:v21 animated:1 completion:0];
    }
    else
    {
      char v14 = [(_SFPerSitePreferencesVendor *)self->_perSitePreferencesVendor managerForPreference:v10];
      long long v15 = +[_SFPerSitePreferencesUtilities preferenceValueForBoolValue:v4 preference:v10 preferenceManager:v14];
      [(_SFPerSitePreferencesPopoverViewController *)self _setPreferenceValue:v15 forPreference:v10];
    }
  }
}

- (_SFBrowserDocument)browserDocument
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserDocument);

  return (_SFBrowserDocument *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_browserDocument);
  objc_storeStrong((id *)&self->_expandedRowIndexPath, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_preferencesBySections, 0);
  objc_storeStrong((id *)&self->_preferenceToValueCache, 0);
  objc_storeStrong((id *)&self->_perSitePreferencesVendor, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

@end