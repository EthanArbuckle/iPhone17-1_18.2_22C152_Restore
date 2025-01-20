@interface HUHomePersonalIdentityDeviceConfigurationViewController
- (Class)onboardingFlowClass;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUHomePersonalIdentityDeviceConfigurationViewController)initWithMediaProfileAndLanguageInfo:(id)a3;
- (NSArray)mediaProfilesAndLanguageInfoList;
- (NSLayoutConstraint)heightAnchor;
- (OBLinkTrayButton)cancelButton;
- (OBTrayButton)changeLanguageButton;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)_configureTitleDescriptionContentViewForCell:(id)a3;
- (id)hu_preloadContent;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)selectedLanguageIndex;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_cancelLanguageChange;
- (void)_changeLanguage;
- (void)loadView;
- (void)setCancelButton:(id)a3;
- (void)setChangeLanguageButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeightAnchor:(id)a3;
- (void)setMediaProfilesAndLanguageInfoList:(id)a3;
- (void)setSelectedLanguageIndex:(int64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUHomePersonalIdentityDeviceConfigurationViewController

- (HUHomePersonalIdentityDeviceConfigurationViewController)initWithMediaProfileAndLanguageInfo:(id)a3
{
  id v4 = a3;
  v5 = HULocalizedModelString(@"HULanguagePersonalIdentityDevice_LanguageMismatch_Title");
  v6 = HULocalizedModelString(@"HULanguagePersonalIdentityDevice_LanguageMultipleMismatch_Detail");
  v7 = _HULocalizedStringWithDefaultValue(@"HULanguagePersonalIdentityDevice_LanguageMismatch_Title", @"HULanguagePersonalIdentityDevice_LanguageMismatch_Title", 1);

  v8 = HUSensitiveLocalizedModelString(@"HULanguagePersonalIdentityDevice_LanguageMultipleMismatch_Detail");

  v14.receiver = self;
  v14.super_class = (Class)HUHomePersonalIdentityDeviceConfigurationViewController;
  v9 = [(OBTableWelcomeController *)&v14 initWithTitle:v7 detailText:v8 icon:0];
  v10 = v9;
  if (v9)
  {
    v9->_selectedLanguageIndex = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v11 = +[HUHomeFeatureOnboardingUtilities processLanguageAndMediaProfileInfo:v4];
    mediaProfilesAndLanguageInfoList = v10->_mediaProfilesAndLanguageInfoList;
    v10->_mediaProfilesAndLanguageInfoList = (NSArray *)v11;
  }
  return v10;
}

- (void)_changeLanguage
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v19 = self;
    __int16 v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  if ([(HUHomePersonalIdentityDeviceConfigurationViewController *)self selectedLanguageIndex] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v7 = (HUHomePersonalIdentityDeviceConfigurationViewController *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v7;
      _os_log_error_impl(&dword_1BE345000, v6, OS_LOG_TYPE_ERROR, "%@ Language selection unavailable", buf, 0xCu);
    }
  }
  else
  {
    v8 = [(HUHomePersonalIdentityDeviceConfigurationViewController *)self mediaProfilesAndLanguageInfoList];
    v6 = objc_msgSend(v8, "objectAtIndexedSubscript:", -[HUHomePersonalIdentityDeviceConfigurationViewController selectedLanguageIndex](self, "selectedLanguageIndex"));

    v9 = [v6 objectForKey:@"languageCodeKey"];
    v10 = HFLogForCategory();
    uint64_t v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        v19 = self;
        __int16 v20 = 2112;
        v21 = v12;
        __int16 v22 = 2112;
        v23 = v9;
        _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@: Changing Personal Identity Device Language To %@", buf, 0x20u);
      }
      uint64_t v11 = objc_alloc_init(MEMORY[0x1E4F4E570]);
      [v11 setLanguage:v9];
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v15 = (HUHomePersonalIdentityDeviceConfigurationViewController *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v15;
      _os_log_error_impl(&dword_1BE345000, v11, OS_LOG_TYPE_ERROR, "%@ Language code unavailable", buf, 0xCu);
    }
  }

  v13 = [(HUHomePersonalIdentityDeviceConfigurationViewController *)self delegate];
  v16 = @"HULanguageOnboardingKey_SetupLanguage_PersonalDevice_UserInput";
  v17 = &unk_1F19B4250;
  objc_super v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  [v13 viewController:self didFinishWithConfigurationResults:v14];
}

- (void)_cancelLanguageChange
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v11 = self;
    __int16 v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  v6 = [(HUHomePersonalIdentityDeviceConfigurationViewController *)self delegate];
  v8 = @"HULanguageOnboardingKey_SetupLanguage_PersonalDevice_UserInput";
  v9 = &unk_1F19B4268;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  [v6 viewController:self didFinishWithConfigurationResults:v7];
}

- (id)hu_preloadContent
{
  return (id)[MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (void)loadView
{
  v27.receiver = self;
  v27.super_class = (Class)HUHomePersonalIdentityDeviceConfigurationViewController;
  [(OBTableWelcomeController *)&v27 loadView];
  id v3 = objc_alloc(MEMORY[0x1E4F42E98]);
  id v4 = objc_msgSend(v3, "initWithFrame:style:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(OBTableWelcomeController *)self setTableView:v4];

  v5 = [(OBTableWelcomeController *)self tableView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(OBTableWelcomeController *)self tableView];
  [v6 setDelegate:self];

  v7 = [(OBTableWelcomeController *)self tableView];
  [v7 setDataSource:self];

  v8 = [(OBTableWelcomeController *)self tableView];
  [v8 setAllowsSelectionDuringEditing:1];

  v9 = [(OBTableWelcomeController *)self tableView];
  [v9 setAllowsMultipleSelection:0];

  double v10 = *MEMORY[0x1E4F43D18];
  uint64_t v11 = [(OBTableWelcomeController *)self tableView];
  [v11 setRowHeight:v10];

  __int16 v12 = [(OBTableWelcomeController *)self tableView];
  [v12 setAlwaysBounceVertical:0];

  v13 = [(OBTableWelcomeController *)self tableView];
  uint64_t v14 = [v13 heightAnchor];
  v15 = [(OBTableWelcomeController *)self tableView];
  [v15 contentSize];
  v17 = [v14 constraintEqualToConstant:v16];
  [(HUHomePersonalIdentityDeviceConfigurationViewController *)self setHeightAnchor:v17];

  v18 = [(HUHomePersonalIdentityDeviceConfigurationViewController *)self heightAnchor];
  [v18 setActive:1];

  v19 = [(OBTableWelcomeController *)self tableView];
  [v19 separatorInset];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  v26 = [(OBTableWelcomeController *)self tableView];
  objc_msgSend(v26, "setSeparatorInset:", v21, v23, v25, 28.0);
}

- (void)viewDidLayoutSubviews
{
  id v3 = [(HUHomePersonalIdentityDeviceConfigurationViewController *)self view];
  [v3 layoutIfNeeded];

  id v4 = [(OBTableWelcomeController *)self tableView];
  [v4 contentSize];
  double v6 = v5;
  v7 = [(HUHomePersonalIdentityDeviceConfigurationViewController *)self heightAnchor];
  [v7 setConstant:v6];

  v8 = [MEMORY[0x1E4F428B8] clearColor];
  v9 = [(OBTableWelcomeController *)self tableView];
  [v9 setBackgroundColor:v8];

  v10.receiver = self;
  v10.super_class = (Class)HUHomePersonalIdentityDeviceConfigurationViewController;
  [(OBTableWelcomeController *)&v10 viewDidLayoutSubviews];
}

- (id)_configureTitleDescriptionContentViewForCell:(id)a3
{
  id v4 = a3;
  double v5 = [v4 contentView];
  double v6 = [v5 subviews];
  if ([v6 count])
  {
    v7 = [v4 contentView];
    v8 = [v7 subviews];
    v9 = [v8 objectAtIndexedSubscript:0];
  }
  else
  {
    v9 = 0;
  }

  objc_opt_class();
  objc_super v10 = v9;
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  __int16 v12 = v11;

  v13 = v10;
  if (!v12)
  {
    uint64_t v14 = [HUTitleDescriptionContentView alloc];
    v13 = -[HUTitleDescriptionContentView initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(HUTitleDescriptionContentView *)v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = [v4 contentView];
    [v15 addSubview:v13];

    double v16 = [(HUTitleDescriptionContentView *)v13 leadingAnchor];
    v17 = [v4 contentView];
    v18 = [v17 leadingAnchor];
    v19 = [(OBTableWelcomeController *)self tableView];
    [v19 separatorInset];
    double v21 = [v16 constraintEqualToAnchor:v18 constant:v20];
    [v21 setActive:1];

    double v22 = [(HUTitleDescriptionContentView *)v13 topAnchor];
    double v23 = [v4 contentView];
    double v24 = [v23 topAnchor];
    double v25 = [v22 constraintEqualToAnchor:v24 constant:5.0];
    [v25 setActive:1];

    v26 = [(HUTitleDescriptionContentView *)v13 bottomAnchor];
    objc_super v27 = [v4 contentView];
    v28 = [v27 bottomAnchor];
    v29 = [v26 constraintEqualToAnchor:v28 constant:-5.0];
    [v29 setActive:1];

    v30 = [(HUTitleDescriptionContentView *)v13 trailingAnchor];
    v31 = [v4 contentView];
    v32 = [v31 trailingAnchor];
    v33 = [v30 constraintEqualToAnchor:v32];
    [v33 setActive:1];
  }

  return v13;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E4F43D18];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(HUHomePersonalIdentityDeviceConfigurationViewController *)self mediaProfilesAndLanguageInfoList];
  int64_t v5 = [v4 count] + 1;

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = NSString;
  v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  objc_super v10 = [v9 languageCode];
  uint64_t v11 = [MEMORY[0x1E4F1CA20] currentLocale];
  __int16 v12 = [v11 countryCode];
  v13 = [v8 stringWithFormat:@"%@-%@", v10, v12];

  uint64_t v14 = [v6 dequeueReusableCellWithIdentifier:@"language_code_cell_identifier"];
  if (!v14) {
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F42EA0]) initWithStyle:0 reuseIdentifier:@"language_code_cell_identifier"];
  }
  [v14 setSelectionStyle:0];
  uint64_t v15 = [v7 row];
  double v16 = [(HUHomePersonalIdentityDeviceConfigurationViewController *)self _configureTitleDescriptionContentViewForCell:v14];
  if (v15)
  {
    id v54 = v6;
    v52 = self;
    v17 = [(HUHomePersonalIdentityDeviceConfigurationViewController *)self mediaProfilesAndLanguageInfoList];
    v53 = v7;
    v18 = objc_msgSend(v17, "objectAtIndex:", objc_msgSend(v7, "row") - 1);

    v19 = [v18 objectForKey:@"mediaProfilesKey"];
    double v20 = [v18 objectForKey:@"localizedLanguageNameKey"];
    [v16 setTitleText:v20];

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v21 = v19;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v55 objects:v59 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      v49 = v18;
      v50 = v16;
      v51 = v13;
      char v24 = 0;
      uint64_t v25 = *(void *)v56;
      v26 = &stru_1F18F92B8;
      while (2)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v56 != v25) {
            objc_enumerationMutation(v21);
          }
          v28 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          if ([(__CFString *)v26 length])
          {
            uint64_t v29 = [(__CFString *)v26 stringByAppendingString:@", "];

            v26 = (__CFString *)v29;
          }
          v30 = v26;
          v31 = objc_msgSend(v28, "hf_displayName");
          v26 = [(__CFString *)v26 stringByAppendingString:v31];

          if (v24)
          {
            double v16 = v50;
            v13 = v51;
            v18 = v49;
            unint64_t v32 = 2;
            goto LABEL_18;
          }
          char v24 = 1;
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v55 objects:v59 count:16];
        char v24 = 1;
        if (v23) {
          continue;
        }
        break;
      }
      unint64_t v32 = 1;
      double v16 = v50;
      v13 = v51;
      v18 = v49;
    }
    else
    {
      unint64_t v32 = 0;
      v26 = &stru_1F18F92B8;
    }
LABEL_18:

    id v7 = v53;
    if (v32 < [v21 count])
    {
      uint64_t v36 = [v21 count];
      v43 = HULocalizedStringWithFormat(@"HULanguageCount_Detail", @"%lu", v37, v38, v39, v40, v41, v42, v36 - v32);
      uint64_t v44 = [(__CFString *)v26 stringByAppendingString:v43];

      v26 = (__CFString *)v44;
    }
    [v16 setDescriptionText:v26];
    v45 = [MEMORY[0x1E4F428B8] lightGrayColor];
    [v16 setDescriptionTextColor:v45];

    v46 = [v18 objectForKey:@"languageCodeKey"];
    if ([v46 isEqualToString:v13])
    {
      -[HUHomePersonalIdentityDeviceConfigurationViewController setSelectedLanguageIndex:](v52, "setSelectedLanguageIndex:", [v53 row] - 1);
      uint64_t v47 = 3;
    }
    else
    {
      uint64_t v47 = 0;
    }
    [v14 setAccessoryType:v47];

    id v6 = v54;
  }
  else
  {
    v33 = _HULocalizedStringWithDefaultValue(@"HULanguageSupportedLangugages_TableHeader_Title", @"HULanguageSupportedLangugages_TableHeader_Title", 1);
    [v16 setTitleText:v33];

    v34 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438C8]];
    [v16 setTitleFont:v34];

    v35 = [MEMORY[0x1E4F428B8] systemGrayColor];
    [v16 setTitleTextColor:v35];
  }

  return v14;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if ([v6 row] >= 1)
  {
    int64_t v7 = [(HUHomePersonalIdentityDeviceConfigurationViewController *)self selectedLanguageIndex]
       + 1;
    v8 = [v11 cellForRowAtIndexPath:v6];
    [v8 setAccessoryType:3];
    -[HUHomePersonalIdentityDeviceConfigurationViewController setSelectedLanguageIndex:](self, "setSelectedLanguageIndex:", [v6 row] - 1);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL && v7 != [v6 row])
    {
      v9 = [MEMORY[0x1E4F28D58] indexPathForRow:v7 inSection:0];
      objc_super v10 = [v11 cellForRowAtIndexPath:v9];

      [v10 setAccessoryType:0];
    }
  }
}

- (void)viewDidLoad
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)HUHomePersonalIdentityDeviceConfigurationViewController;
  [(OBTableWelcomeController *)&v27 viewDidLoad];
  id v4 = [(HUHomePersonalIdentityDeviceConfigurationViewController *)self headerView];
  int64_t v5 = [v4 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v5 withIDDictionary:&unk_1F19B5C28];

  [(HUHomePersonalIdentityDeviceConfigurationViewController *)self setModalInPresentation:1];
  id v6 = [MEMORY[0x1E4F83A80] boldButton];
  [(HUHomePersonalIdentityDeviceConfigurationViewController *)self setChangeLanguageButton:v6];

  int64_t v7 = [(HUHomePersonalIdentityDeviceConfigurationViewController *)self changeLanguageButton];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  v8 = [(HUHomePersonalIdentityDeviceConfigurationViewController *)self changeLanguageButton];
  v9 = _HULocalizedStringWithDefaultValue(@"HUContinueTitle", @"HUContinueTitle", 1);
  [v8 setTitle:v9 forState:0];

  objc_super v10 = [(HUHomePersonalIdentityDeviceConfigurationViewController *)self changeLanguageButton];
  [v10 setAccessibilityIdentifier:@"Home.OnboardingView.LanguageSetUp.PersonalIdentity.ContinueButton"];

  id v11 = [(HUHomePersonalIdentityDeviceConfigurationViewController *)self changeLanguageButton];
  [v11 addTarget:self action:sel__changeLanguage forControlEvents:64];

  __int16 v12 = [(HUHomePersonalIdentityDeviceConfigurationViewController *)self buttonTray];
  v13 = [(HUHomePersonalIdentityDeviceConfigurationViewController *)self changeLanguageButton];
  [v12 addButton:v13];

  uint64_t v14 = [MEMORY[0x1E4F83AB8] linkButton];
  [(HUHomePersonalIdentityDeviceConfigurationViewController *)self setCancelButton:v14];

  uint64_t v15 = [(HUHomePersonalIdentityDeviceConfigurationViewController *)self cancelButton];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v16 = [(HUHomePersonalIdentityDeviceConfigurationViewController *)self cancelButton];
  v17 = _HULocalizedStringWithDefaultValue(@"HULanguageDontRecognizeVoiceButton_Title", @"HULanguageDontRecognizeVoiceButton_Title", 1);
  [v16 setTitle:v17 forState:0];

  v18 = [(HUHomePersonalIdentityDeviceConfigurationViewController *)self changeLanguageButton];
  [v18 setAccessibilityIdentifier:@"Home.OnboardingView.LanguageSetUp.PersonalIdentity.DontRecognizeVoiceButton"];

  v19 = [(HUHomePersonalIdentityDeviceConfigurationViewController *)self cancelButton];
  [v19 addTarget:self action:sel__cancelLanguageChange forControlEvents:64];

  double v20 = [(HUHomePersonalIdentityDeviceConfigurationViewController *)self buttonTray];
  id v21 = [(HUHomePersonalIdentityDeviceConfigurationViewController *)self cancelButton];
  [v20 addButton:v21];

  uint64_t v22 = _HULocalizedStringWithDefaultValue(@"HULanguagePersonalIdentityDevice_LanguageMismatch_FinePrint", @"HULanguagePersonalIdentityDevice_LanguageMismatch_FinePrint", 1);
  uint64_t v23 = _HULocalizedStringWithDefaultValue(@"HULanguagePersonalIdentityDevice_SiriEnabledAccessories_LanguageMismatch_FinePrint", @"HULanguagePersonalIdentityDevice_SiriEnabledAccessories_LanguageMismatch_FinePrint", 1);

  char v24 = [(HUHomePersonalIdentityDeviceConfigurationViewController *)self buttonTray];
  [v24 setCaptionText:v23];

  uint64_t v25 = HFLogForCategory();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v29 = self;
    __int16 v30 = 2112;
    v31 = v26;
    _os_log_impl(&dword_1BE345000, v25, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: HPIDCVC", buf, 0x16u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)HUHomePersonalIdentityDeviceConfigurationViewController;
  [(HUHomePersonalIdentityDeviceConfigurationViewController *)&v8 viewWillDisappear:a3];
  if ([(HUHomePersonalIdentityDeviceConfigurationViewController *)self isMovingFromParentViewController])
  {
    int64_t v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      objc_super v10 = self;
      __int16 v11 = 2112;
      __int16 v12 = v6;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped BACK button", buf, 0x16u);
    }
    int64_t v7 = [(HUHomePersonalIdentityDeviceConfigurationViewController *)self delegate];
    [v7 viewControllerDidGoBack:self];
  }
}

- (Class)onboardingFlowClass
{
  return (Class)objc_opt_class();
}

- (HUConfigurationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUConfigurationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OBTrayButton)changeLanguageButton
{
  return self->_changeLanguageButton;
}

- (void)setChangeLanguageButton:(id)a3
{
}

- (OBLinkTrayButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (NSArray)mediaProfilesAndLanguageInfoList
{
  return self->_mediaProfilesAndLanguageInfoList;
}

- (void)setMediaProfilesAndLanguageInfoList:(id)a3
{
}

- (int64_t)selectedLanguageIndex
{
  return self->_selectedLanguageIndex;
}

- (void)setSelectedLanguageIndex:(int64_t)a3
{
  self->_selectedLanguageIndex = a3;
}

- (NSLayoutConstraint)heightAnchor
{
  return self->_heightAnchor;
}

- (void)setHeightAnchor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightAnchor, 0);
  objc_storeStrong((id *)&self->_mediaProfilesAndLanguageInfoList, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_changeLanguageButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end