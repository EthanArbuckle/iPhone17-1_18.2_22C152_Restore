@interface CNFRegLocaleController
- (CNFRegLocaleController)initWithRegController:(id)a3;
- (NSArray)regionData;
- (NSString)currentPhoneValue;
- (NSString)currentRegionID;
- (id)_currentRegion;
- (id)_phoneTextField;
- (id)_rightButtonItem;
- (id)_unformattedPhoneNumber:(id)a3;
- (id)completionBlock;
- (id)controllerForSpecifier:(id)a3;
- (id)currentCountryValueForSpecifier:(id)a3;
- (id)currentPhoneCompatibleCountryCode;
- (id)currentPhoneNumberForSpecifier:(id)a3;
- (id)logName;
- (id)specifierList;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)titleString;
- (id)validationString;
- (void)_buildCountryFieldSpecifierCache:(id)a3;
- (void)_buildPhoneNumberSpecifierCache:(id)a3;
- (void)_buildSpecifierCache:(id)a3;
- (void)_failValidationWithError:(id)a3;
- (void)_finishValidation;
- (void)_handleRegionListLoad;
- (void)_handleTimeout;
- (void)_hideCountryPickerAnimated:(BOOL)a3;
- (void)_loadInitialValues;
- (void)_loadRegionsIfNecessary;
- (void)_refreshCountryFieldAnimated:(BOOL)a3;
- (void)_refreshPhoneFieldAnimated:(BOOL)a3;
- (void)_rightButtonTapped;
- (void)_setFieldsEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)_setupEventHandlers;
- (void)_showCountryPickerAnimated:(BOOL)a3;
- (void)_showPhoneField:(BOOL)a3 animated:(BOOL)a4;
- (void)_startListeningForRegionListChanges;
- (void)_startTimeout;
- (void)_stopListeningForRegionListChanges;
- (void)_updateControllerState;
- (void)_updateUI;
- (void)dismiss;
- (void)hideCountryPicker;
- (void)regionChooser:(id)a3 selectedRegionID:(id)a4;
- (void)setCompletionBlock:(id)a3;
- (void)setCurrentPhoneNumber:(id)a3 forSpecifier:(id)a4;
- (void)setCurrentPhoneValue:(id)a3;
- (void)setCurrentRegionID:(id)a3;
- (void)setRegionData:(id)a3;
- (void)showCountryPicker;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CNFRegLocaleController

- (CNFRegLocaleController)initWithRegController:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CNFRegLocaleController;
  v5 = [(CNFRegFirstRunController *)&v19 initWithRegController:v4];
  if (v5)
  {
    v6 = [MEMORY[0x263F3BB50] sharedInstance];
    if ([v6 isLoaded])
    {
      v7 = [v6 regions];
      [(CNFRegLocaleController *)v5 setRegionData:v7];
    }
    else
    {
      [(CNFRegLocaleController *)v5 _loadRegionsIfNecessary];
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v8 = objc_msgSend(v4, "appleIDAccounts", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v13 profileValidationStatus] != 3)
          {
            [(CNFRegFirstRunController *)v5 setAccount:v13];
            goto LABEL_15;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
  return v5;
}

- (void)dismiss
{
  [(CNFRegLocaleController *)self dismissModalViewControllerWithTransition:7];
  v3 = [(CNFRegLocaleController *)self completionBlock];

  if (v3)
  {
    id v4 = [(CNFRegLocaleController *)self completionBlock];
    v4[2](v4, 0);
  }
}

- (id)specifierList
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = CNFRegLoadSpecifiersFromPlist(self, @"CNFRegLocale", self);
    v6 = [v5 specifierForID:@"FACETIME_LOCALE_DESCRIPTION_GROUP_ID"];
    v7 = [v6 name];
    if ([v7 _isNaturallyRTL]) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v9 = [NSNumber numberWithInteger:v8];
    [v6 setProperty:v9 forKey:*MEMORY[0x263F5FEF0]];

    uint64_t v10 = [v6 propertyForKey:*MEMORY[0x263F600F8]];
    if ([v10 _isNaturallyRTL]) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 0;
    }
    v12 = [NSNumber numberWithInteger:v11];
    [v6 setProperty:v12 forKey:*MEMORY[0x263F600B8]];

    [(CNFRegLocaleController *)self _buildSpecifierCache:v5];
    [v5 removeObjectsInArray:self->_phoneNumberSpecifiers];
    v13 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = (Class)v5;

    id v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)controllerForSpecifier:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4
    || ([v4 identifier],
        v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isEqualToString:@"FACETIME_LOCALE_COUNTRY_SELECT_ID"],
        v6,
        !v7)
    || ([MEMORY[0x263EFF9D0] null],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [(CNFRegLocaleController *)self showCountryPicker],
        !v8))
  {
    v10.receiver = self;
    v10.super_class = (Class)CNFRegLocaleController;
    uint64_t v8 = [(CNFRegLocaleController *)&v10 controllerForSpecifier:v5];
  }

  return v8;
}

- (id)logName
{
  return @"Locale";
}

- (id)validationString
{
  if (self->_isLoading)
  {
    v2 = CommunicationsSetupUIBundle();
    uint64_t v3 = CNFRegStringTableName();
    id v4 = [v2 localizedStringForKey:@"LOADING" value:&stru_26D05D4F8 table:v3];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CNFRegLocaleController;
    id v4 = [(CNFRegFirstRunController *)&v6 validationString];
  }
  return v4;
}

- (void)_loadRegionsIfNecessary
{
  id v4 = [MEMORY[0x263F3BB50] sharedInstance];
  char v3 = [v4 isLoaded];
  self->_isLoading = v3 ^ 1;
  if ((v3 & 1) == 0)
  {
    [(CNFRegLocaleController *)self _startListeningForRegionListChanges];
    [v4 startLoading];
  }
}

- (void)_loadInitialValues
{
  char v3 = [(CNFRegListController *)self regController];
  id v4 = [v3 appleIDAccounts];

  if (v4 && [v4 count])
  {
    id v16 = [v4 objectAtIndex:0];
  }
  else
  {
    id v16 = 0;
  }
  uint64_t v5 = [(CNFRegLocaleController *)self currentRegionID];
  if (!v5
    || (objc_super v6 = (void *)v5,
        [(CNFRegLocaleController *)self currentRegionID],
        int v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 length],
        v7,
        v6,
        !v8))
  {
    uint64_t v9 = [v16 profileStringForKey:*MEMORY[0x263F4A400]];
    [(CNFRegLocaleController *)self setCurrentRegionID:v9];
  }
  uint64_t v10 = [(CNFRegLocaleController *)self currentPhoneValue];
  if (!v10
    || (uint64_t v11 = (void *)v10,
        [(CNFRegLocaleController *)self currentPhoneValue],
        v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = [v12 length],
        v12,
        v11,
        !v13))
  {
    v14 = [v16 profileStringForKey:*MEMORY[0x263F4A3F0]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v15 = [(CNFRegLocaleController *)self _unformattedPhoneNumber:v14];
      [(CNFRegLocaleController *)self setCurrentPhoneValue:v15];
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNFRegLocaleController;
  [(CNFRegFirstRunController *)&v5 viewWillAppear:a3];
  [(CNFRegLocaleController *)self _loadInitialValues];
  [(CNFRegLocaleController *)self _loadRegionsIfNecessary];
  if ([(CNFRegLocaleController *)self containsSpecifier:self->_phoneNumberGroupSpecifier])
  {
    id v4 = [(CNFRegLocaleController *)self _phoneTextField];
    [v4 becomeFirstResponder];
  }
  [(CNFRegLocaleController *)self _updateUI];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNFRegLocaleController;
  [(CNFRegFirstRunController *)&v4 viewDidAppear:a3];
  if (self->_isLoading) {
    [(CNFRegFirstRunController *)self _startValidationModeAnimated:0];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNFRegLocaleController;
  [(CNFRegFirstRunController *)&v5 viewWillDisappear:a3];
  objc_super v4 = [(CNFRegLocaleController *)self _phoneTextField];
  [v4 resignFirstResponder];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNFRegLocaleController;
  [(CNFRegFirstRunController *)&v4 viewDidDisappear:a3];
  [(CNFRegLocaleController *)self _stopListeningForRegionListChanges];
  [(CNFRegFirstRunController *)self _stopValidationModeAnimated:0];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CNFRegLocaleController;
  objc_super v4 = [(CNFRegLocaleController *)&v9 tableView:a3 cellForRowAtIndexPath:a4];
  objc_super v5 = +[CNFRegAppearanceController globalAppearanceController];
  if ([v5 styleUsesCustomAccessoryView])
  {
    if ([v4 accessoryType] == 1)
    {
      uint64_t v6 = [v5 tableCellCustomAccessoryViewDisclosureIndicator];
      if (v6)
      {
        int v7 = (void *)v6;
        [v4 setAccessoryView:v6];
      }
    }
  }

  return v4;
}

- (id)titleString
{
  return &stru_26D05D4F8;
}

- (void)_startListeningForRegionListChanges
{
  if (!self->_regionListChangeObserver)
  {
    char v3 = [MEMORY[0x263F08A00] defaultCenter];
    objc_super v4 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED18000, v4, OS_LOG_TYPE_DEFAULT, "Started listening for region list loading notifications", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (IMShouldLog()) {
        IMLogString();
      }
    }
    uint64_t v5 = *MEMORY[0x263F3BAF8];
    uint64_t v6 = [MEMORY[0x263F3BB50] sharedInstance];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __61__CNFRegLocaleController__startListeningForRegionListChanges__block_invoke;
    v10[3] = &unk_2644F0EA8;
    v10[4] = self;
    int v7 = (void *)MEMORY[0x223C3AA40](v10);
    uint64_t v8 = [v3 addObserverForName:v5 object:v6 queue:0 usingBlock:v7];
    id regionListChangeObserver = self->_regionListChangeObserver;
    self->_id regionListChangeObserver = v8;
  }
}

void __61__CNFRegLocaleController__startListeningForRegionListChanges__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_21ED18000, v4, OS_LOG_TYPE_DEFAULT, "Region list finished loading", v5, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  [*(id *)(a1 + 32) _handleRegionListLoad];
}

- (void)_stopListeningForRegionListChanges
{
  if (self->_regionListChangeObserver)
  {
    id v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Stopped listening for region list loading notifications", v6, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (IMShouldLog()) {
        IMLogString();
      }
    }
    objc_super v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 removeObserver:self->_regionListChangeObserver];
    id regionListChangeObserver = self->_regionListChangeObserver;
    self->_id regionListChangeObserver = 0;
  }
}

- (void)_handleRegionListLoad
{
  [(CNFRegLocaleController *)self _stopListeningForRegionListChanges];
  id v4 = [MEMORY[0x263F3BB50] sharedInstance];
  id v3 = [v4 regions];
  [(CNFRegLocaleController *)self setRegionData:v3];

  self->_isLoading = 0;
  if ([(CNFRegLocaleController *)self isViewLoaded])
  {
    [(CNFRegLocaleController *)self _updateUI];
    [(CNFRegFirstRunController *)self _stopValidationModeAnimated:1];
  }
}

- (void)_updateUI
{
  v21.receiver = self;
  v21.super_class = (Class)CNFRegLocaleController;
  [(CNFRegFirstRunController *)&v21 _updateUI];
  BOOL isLoading = self->_isLoading;
  int v4 = !self->_isLoading;
  uint64_t v5 = *MEMORY[0x263F600A8];
  uint64_t v6 = [(PSSpecifier *)self->_countryFieldSpecifier propertyForKey:*MEMORY[0x263F600A8]];
  int v7 = [v6 BOOLValue];

  if (v4 != v7)
  {
    uint64_t v8 = [NSNumber numberWithBool:!isLoading];
    [(PSSpecifier *)self->_countryFieldSpecifier setProperty:v8 forKey:v5];
  }
  [(CNFRegLocaleController *)self _refreshCountryFieldAnimated:0];
  [(CNFRegLocaleController *)self _refreshPhoneFieldAnimated:0];
  objc_super v9 = [(CNFRegLocaleController *)self _currentRegion];
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 basePhoneNumber];
    v12 = v11;
    if (v11) {
      BOOL v13 = [v11 length] == 0;
    }
    else {
      BOOL v13 = 1;
    }
  }
  else
  {
    BOOL v13 = 0;
  }
  [(CNFRegLocaleController *)self _showPhoneField:v13 animated:0];
  v14 = [(CNFRegFirstRunController *)self account];
  long long v15 = [v14 profileValueForKey:*MEMORY[0x263F4A400]];
  id v16 = [(CNFRegLocaleController *)self currentRegionID];
  int v17 = [v15 isEqualToString:v16];

  long long v18 = [v14 profileValueForKey:*MEMORY[0x263F4A3F0]];
  objc_super v19 = [(CNFRegLocaleController *)self currentPhoneValue];
  int v20 = [v18 isEqualToString:v19];

  if (!self->_isLoading)
  {
    if ((v17 & v20) != 1 || [v14 profileValidationStatus] != 2)
    {
      [(CNFRegFirstRunController *)self _stopValidationModeAnimated:0];
      goto LABEL_15;
    }
    [(CNFRegLocaleController *)self _startTimeout];
  }
  [(CNFRegFirstRunController *)self _startValidationModeAnimated:0];
LABEL_15:
}

- (void)_updateControllerState
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)CNFRegLocaleController;
  [(CNFRegFirstRunController *)&v12 _updateControllerState];
  [(CNFRegLocaleController *)self _updateUI];
  id v3 = [(CNFRegListController *)self regController];
  int v4 = [(CNFRegFirstRunController *)self account];
  unint64_t v5 = [v3 accountStateForAccount:v4];

  uint64_t v6 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = @"NO";
    if ((v5 & 2) != 0) {
      int v7 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v14 = v7;
    _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Popping controller. Has local dialing support? %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    uint64_t v8 = @"NO";
    if ((v5 & 2) != 0) {
      uint64_t v8 = @"YES";
    }
    uint64_t v11 = v8;
    IMLogString();
  }
  -[CNFRegLocaleController dismissModalViewControllerWithTransition:](self, "dismissModalViewControllerWithTransition:", 7, v11);
  objc_super v9 = [(CNFRegLocaleController *)self completionBlock];

  if (v9)
  {
    uint64_t v10 = [(CNFRegLocaleController *)self completionBlock];
    v10[2](v10, (v5 >> 1) & 1);
  }
}

- (void)_setFieldsEnabled:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(CNFRegListController *)self _setSpecifierEnabled:self->_phoneNumberFieldSpecifier enabled:a3 animated:a4];
  countryFieldSpecifier = self->_countryFieldSpecifier;
  [(CNFRegListController *)self _setSpecifierEnabled:countryFieldSpecifier enabled:v5 animated:v4];
}

- (id)_currentRegion
{
  id v3 = [MEMORY[0x263F3BB50] sharedInstance];
  BOOL v4 = [(CNFRegLocaleController *)self currentRegionID];
  BOOL v5 = [v3 regionForID:v4];

  return v5;
}

- (id)currentCountryValueForSpecifier:(id)a3
{
  id v4 = a3;
  if (self->_isLoading)
  {
    BOOL v5 = CommunicationsSetupUIBundle();
    uint64_t v6 = CNFRegStringTableName();
    int v7 = @"LOADING";
LABEL_5:
    uint64_t v8 = [v5 localizedStringForKey:v7 value:&stru_26D05D4F8 table:v6];

    goto LABEL_6;
  }
  if (self->_isError)
  {
    BOOL v5 = CommunicationsSetupUIBundle();
    uint64_t v6 = CNFRegStringTableName();
    int v7 = @"ERROR";
    goto LABEL_5;
  }
  uint64_t v10 = [(CNFRegLocaleController *)self _currentRegion];
  BOOL v5 = v10;
  if (v10)
  {
    uint64_t v8 = [v10 label];
  }
  else
  {
    uint64_t v8 = &stru_26D05D4F8;
  }
LABEL_6:

  return v8;
}

- (void)_refreshCountryFieldAnimated:(BOOL)a3
{
}

- (void)_showPhoneField:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  int v7 = [(CNFRegLocaleController *)self containsSpecifier:self->_phoneNumberGroupSpecifier];
  if (!v5 || (v7 & 1) != 0)
  {
    if (!v5 && ((v7 ^ 1) & 1) == 0)
    {
      uint64_t v10 = [(CNFRegLocaleController *)self _phoneTextField];
      [v10 resignFirstResponder];

      phoneNumberSpecifiers = self->_phoneNumberSpecifiers;
      [(CNFRegLocaleController *)self removeContiguousSpecifiers:phoneNumberSpecifiers animated:v4];
    }
  }
  else
  {
    uint64_t v8 = self->_phoneNumberSpecifiers;
    uint64_t v9 = [*(id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) count];
    [(CNFRegLocaleController *)self insertContiguousSpecifiers:v8 atIndex:v9 animated:v4];
  }
}

- (id)_phoneTextField
{
  v2 = [(CNFRegLocaleController *)self cachedCellForSpecifier:self->_phoneNumberFieldSpecifier];
  id v3 = [v2 editableTextField];

  return v3;
}

- (id)currentPhoneCompatibleCountryCode
{
  v2 = [(CNFRegLocaleController *)self _currentRegion];
  id v3 = v2;
  if (v2)
  {
    BOOL v4 = [v2 isoCode];
  }
  else
  {
    BOOL v4 = 0;
  }
  BOOL v5 = [v4 lowercaseString];

  return v5;
}

- (id)_unformattedPhoneNumber:(id)a3
{
  if (a3)
  {
    BOOL v4 = (void *)_PNCreateStringByStrippingFormattingAndNotVisiblyAllowable();
  }
  else
  {
    BOOL v4 = 0;
  }
  return v4;
}

- (id)currentPhoneNumberForSpecifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(CNFRegLocaleController *)self currentPhoneValue];
  uint64_t v6 = [(CNFRegLocaleController *)self currentPhoneCompatibleCountryCode];
  if (v6)
  {
    int v7 = [(CNFRegLocaleController *)self currentPhoneValue];
    uint64_t v8 = (void *)PNCopyFormattedStringWithCountry();

    id v9 = v8;
    uint64_t v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v6;
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_impl(&dword_21ED18000, v10, OS_LOG_TYPE_DEFAULT, "Getting formatted phone number {%@}: %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
  }
  else
  {
    uint64_t v11 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl(&dword_21ED18000, v11, OS_LOG_TYPE_DEFAULT, "Getting unformatted phone number: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    id v9 = v5;
  }

  return v9;
}

- (void)setCurrentPhoneNumber:(id)a3 forSpecifier:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CNFRegLocaleController *)self _unformattedPhoneNumber:v6];
  id v9 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    objc_super v12 = v8;
    _os_log_impl(&dword_21ED18000, v9, OS_LOG_TYPE_DEFAULT, "Setting unformatted phone number: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    uint64_t v10 = v8;
    IMLogString();
  }
  -[CNFRegLocaleController setCurrentPhoneValue:](self, "setCurrentPhoneValue:", v8, v10);
}

- (void)_refreshPhoneFieldAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CNFRegLocaleController *)self containsSpecifier:self->_phoneNumberGroupSpecifier])
  {
    phoneNumberFieldSpecifier = self->_phoneNumberFieldSpecifier;
    [(CNFRegLocaleController *)self reloadSpecifier:phoneNumberFieldSpecifier animated:v3];
  }
}

- (void)_failValidationWithError:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "_failValidationWithError: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    id v17 = v4;
    IMLogString();
  }
  -[CNFRegFirstRunController _stopValidationModeAnimated:](self, "_stopValidationModeAnimated:", 1, v17);
  id v6 = CommunicationsSetupUIBundle();
  id v7 = CNFRegStringTableName();
  uint64_t v8 = [v6 localizedStringForKey:@"FACETIME_ACTIVATION_ERROR_TITLE" value:&stru_26D05D4F8 table:v7];

  id v9 = [v4 localizedDescription];
  if (!v9)
  {
    uint64_t v10 = CommunicationsSetupUIBundle();
    uint64_t v11 = CNFRegStringTableName();
    id v9 = [v10 localizedStringForKey:@"FACETIME_ACTIVATION_ERROR_GENERIC" value:&stru_26D05D4F8 table:v11];
  }
  objc_super v12 = CommunicationsSetupUIBundle();
  uint64_t v13 = CNFRegStringTableName();
  v14 = [v12 localizedStringForKey:@"FACETIME_ALERT_OK" value:&stru_26D05D4F8 table:v13];

  __int16 v15 = [MEMORY[0x263F82418] alertControllerWithTitle:v8 message:v9 preferredStyle:1];
  id v16 = [MEMORY[0x263F82400] actionWithTitle:v14 style:0 handler:0];
  [v15 addAction:v16];

  [(CNFRegLocaleController *)self presentViewController:v15 animated:1 completion:0];
}

- (void)_finishValidation
{
  [(CNFRegFirstRunController *)self _stopValidationModeAnimated:1];
  BOOL v3 = [(CNFRegLocaleController *)self navigationItem];
  [v3 setRightBarButtonItem:0];

  id v4 = [(CNFRegLocaleController *)self navigationItem];
  [v4 setLeftBarButtonItem:0];

  BOOL v5 = [(CNFRegLocaleController *)self navigationItem];
  [v5 setHidesBackButton:1];

  [(CNFRegLocaleController *)self _updateControllerState];
}

- (id)_rightButtonItem
{
  id v3 = objc_alloc(MEMORY[0x263F824A8]);
  id v4 = CommunicationsSetupUIBundle();
  BOOL v5 = CNFRegStringTableName();
  id v6 = [v4 localizedStringForKey:@"SAVE" value:&stru_26D05D4F8 table:v5];
  id v7 = (void *)[v3 initWithTitle:v6 style:2 target:self action:sel__rightButtonTapped];

  return v7;
}

- (void)_rightButtonTapped
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (![(CNFRegListController *)self _showWiFiAlertIfNecessary])
  {
    id v3 = [(CNFRegLocaleController *)self _currentRegion];
    id v4 = v3;
    if (!v3)
    {
      uint64_t v20 = CommunicationsSetupUIBundle();
      objc_super v21 = CNFRegStringTableName();
      v22 = [v20 localizedStringForKey:@"FACETIME_ACTIVATION_ERROR_TITLE" value:&stru_26D05D4F8 table:v21];

      v23 = CommunicationsSetupUIBundle();
      v24 = CNFRegStringTableName();
      v25 = [v23 localizedStringForKey:@"FACETIME_LOCALE_MISSING_REGION_ALERT_MESSAGE" value:&stru_26D05D4F8 table:v24];

      v26 = CommunicationsSetupUIBundle();
      v27 = CNFRegStringTableName();
      v28 = [v26 localizedStringForKey:@"FACETIME_ALERT_OK" value:&stru_26D05D4F8 table:v27];

      v29 = [MEMORY[0x263F82418] alertControllerWithTitle:v22 message:v25 preferredStyle:1];
      v30 = [MEMORY[0x263F82400] actionWithTitle:v28 style:0 handler:0];
      [v29 addAction:v30];

      [(CNFRegLocaleController *)self presentViewController:v29 animated:1 completion:0];
LABEL_37:

      return;
    }
    BOOL v5 = [v3 regionID];
    id v6 = [v4 basePhoneNumber];
    id v7 = v6;
    if (!v6 || ![(__CFString *)v6 length])
    {
      uint64_t v8 = [(CNFRegLocaleController *)self _phoneTextField];
      id v9 = [v8 text];

      uint64_t v10 = [(CNFRegLocaleController *)self _unformattedPhoneNumber:v9];

      [(CNFRegLocaleController *)self setCurrentPhoneValue:v10];
      id v7 = (__CFString *)v10;
    }
    uint64_t v11 = [(CNFRegFirstRunController *)self account];
    objc_super v12 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v11;
      _os_log_impl(&dword_21ED18000, v12, OS_LOG_TYPE_DEFAULT, "Setting profile for account: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v31 = v11;
      IMLogString();
    }
    uint64_t v13 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v5;
      _os_log_impl(&dword_21ED18000, v13, OS_LOG_TYPE_DEFAULT, "  => Region ID: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v31 = v5;
      IMLogString();
    }
    v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v7;
      _os_log_impl(&dword_21ED18000, v14, OS_LOG_TYPE_DEFAULT, "  => Phone: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v31 = v7;
      IMLogString();
    }
    int v15 = -[__CFString setProfileString:forKey:](v11, "setProfileString:forKey:", v5, *MEMORY[0x263F4A400], v31);
    int v16 = v15 | [(__CFString *)v11 setProfileString:v7 forKey:*MEMORY[0x263F4A3F0]];
    id v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      long long v18 = @"NO";
      if (v16) {
        long long v18 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      v34 = v18;
      _os_log_impl(&dword_21ED18000, v17, OS_LOG_TYPE_DEFAULT, "  => Changed: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      id v19 = @"NO";
      if (v16) {
        id v19 = @"YES";
      }
      v32 = v19;
      IMLogString();
    }
    if (v16)
    {
      [(__CFString *)v11 writeSettings];
    }
    else if ([(__CFString *)v11 profileValidationStatus] == 3)
    {
      [(CNFRegLocaleController *)self _finishValidation];
LABEL_36:

      goto LABEL_37;
    }
    -[CNFRegFirstRunController _startValidationModeAnimated:](self, "_startValidationModeAnimated:", 0, v32);
    [(CNFRegLocaleController *)self _startTimeout];
    [(__CFString *)v11 validateProfile];
    goto LABEL_36;
  }
}

- (void)_startTimeout
{
}

- (void)_handleTimeout
{
  id v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "_handleTimeout", v9, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  id v4 = CommunicationsSetupUIBundle();
  BOOL v5 = CNFRegStringTableName();
  id v6 = [v4 localizedStringForKey:@"FACETIME_ACTIVATION_ERROR_GENERIC" value:&stru_26D05D4F8 table:v5];

  id v7 = [NSDictionary dictionaryWithObject:v6 forKey:*MEMORY[0x263F08320]];
  uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.conference.registration" code:0 userInfo:v7];
  [(CNFRegLocaleController *)self _failValidationWithError:v8];
}

- (void)_showCountryPickerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CNFRegLocaleController *)self navigationController];
  id v6 = [v5 visibleViewController];

  if (v6 == self)
  {
    [(CNFRegListController *)self setShowingChildController:1];
    id v7 = [(CNFRegLocaleController *)self _phoneTextField];
    [v7 resignFirstResponder];

    id v21 = objc_alloc_init(MEMORY[0x263F5FC30]);
    [v21 setParentController:self];
    uint64_t v8 = [(CNFRegLocaleController *)self rootController];
    [v21 setRootController:v8];

    id v9 = [CNFRegRegionChooserController alloc];
    uint64_t v10 = [(CNFRegLocaleController *)self regionData];
    uint64_t v11 = [(CNFRegLocaleController *)self currentRegionID];
    objc_super v12 = [(CNFRegRegionChooserController *)v9 initWithRegionList:v10 selectedRegionID:v11];

    [(CNFRegRegionChooserController *)v12 setDelegate:self];
    [(CNFRegRegionChooserController *)v12 setRootController:v21];
    [(CNFRegRegionChooserController *)v12 setParentController:v21];
    [(CNFRegRegionChooserController *)v12 setSpecifier:self->_countryFieldSpecifier];
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_hideCountryPicker];
    v14 = [(CNFRegRegionChooserController *)v12 navigationItem];
    [v14 setLeftBarButtonItem:v13];

    int v15 = [(CNFRegRegionChooserController *)v12 drillDownControllerList];
    [v21 setViewControllers:v15];

    int v16 = +[CNFRegAppearanceController globalAppearanceController];
    objc_msgSend(v21, "setModalPresentationStyle:", objc_msgSend(v16, "modalPresentationStyle"));
    uint64_t v17 = [v16 navigationBarStyle];
    long long v18 = [v21 navigationBar];
    [v18 setBarStyle:v17];

    uint64_t v19 = [v16 navigationBarIsTranslucent];
    uint64_t v20 = [v21 navigationBar];
    [v20 setTranslucent:v19];

    [(CNFRegLocaleController *)self showController:v21 animate:v3];
  }
}

- (void)_hideCountryPickerAnimated:(BOOL)a3
{
  id v4 = [(CNFRegLocaleController *)self navigationController];
  BOOL v5 = [v4 visibleViewController];

  if (v5 != self)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __53__CNFRegLocaleController__hideCountryPickerAnimated___block_invoke;
    v6[3] = &unk_2644F04A0;
    v6[4] = self;
    [(CNFRegFirstRunController *)self _executeDismissBlock:v6];
  }
}

void __53__CNFRegLocaleController__hideCountryPickerAnimated___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) presentedViewController];
  [v1 dismiss];
}

- (void)showCountryPicker
{
}

- (void)hideCountryPicker
{
}

- (void)regionChooser:(id)a3 selectedRegionID:(id)a4
{
  [(CNFRegLocaleController *)self setCurrentRegionID:a4];
  [(CNFRegLocaleController *)self _updateUI];
  [(CNFRegLocaleController *)self hideCountryPicker];
}

- (void)_buildCountryFieldSpecifierCache:(id)a3
{
  self->_countryFieldSpecifier = [a3 specifierForID:@"FACETIME_LOCALE_COUNTRY_SELECT_ID"];
  MEMORY[0x270F9A758]();
}

- (void)_buildPhoneNumberSpecifierCache:(id)a3
{
  id v5 = a3;
  id v6 = [v5 specifierForID:@"FACETIME_LOCALE_PHONE_GROUP_ID"];
  id v7 = [v5 specifierForID:@"FACETIME_LOCALE_PHONE_FIELD_ID"];

  if (!v6 || !v7)
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"CNFRegLocaleController.m" lineNumber:675 description:@"Specifier list did not contain phone fields"];
  }
  phoneNumberGroupSpecifier = self->_phoneNumberGroupSpecifier;
  self->_phoneNumberGroupSpecifier = v6;
  v14 = v6;

  phoneNumberFieldSpecifier = self->_phoneNumberFieldSpecifier;
  self->_phoneNumberFieldSpecifier = v7;
  uint64_t v10 = v7;

  uint64_t v11 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v14, v10, 0);
  phoneNumberSpecifiers = self->_phoneNumberSpecifiers;
  self->_phoneNumberSpecifiers = v11;
}

- (void)_buildSpecifierCache:(id)a3
{
  id v4 = a3;
  [(CNFRegLocaleController *)self _buildCountryFieldSpecifierCache:v4];
  [(CNFRegLocaleController *)self _buildPhoneNumberSpecifierCache:v4];
}

- (void)_setupEventHandlers
{
  v6.receiver = self;
  v6.super_class = (Class)CNFRegLocaleController;
  [(CNFRegFirstRunController *)&v6 _setupEventHandlers];
  BOOL v3 = [(CNFRegListController *)self regController];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__CNFRegLocaleController__setupEventHandlers__block_invoke;
  v5[3] = &unk_2644F0B98;
  v5[4] = self;
  [v3 setProfileStatusChangedBlock:v5];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__CNFRegLocaleController__setupEventHandlers__block_invoke_188;
  v4[3] = &unk_2644F0B98;
  v4[4] = self;
  [v3 setAccountRegistrationBlock:v4];
}

void __45__CNFRegLocaleController__setupEventHandlers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = CNFRegStringForAccount(v5);
    *(_DWORD *)buf = 138412290;
    v22 = v8;
    _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Profile status changed for account: %@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    int v16 = CNFRegStringForAccount(v5);
    IMLogString();
  }
  objc_msgSend(*(id *)(a1 + 32), "account", v16);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v10 = v9 == v5;

  if (v10)
  {
    uint64_t v15 = [v5 profileValidationStatus];
    if (v15 == 3)
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __45__CNFRegLocaleController__setupEventHandlers__block_invoke_2;
      v18[3] = &unk_2644F04A0;
      v18[4] = *(void *)(a1 + 32);
      v14 = (void (**)(void))MEMORY[0x223C3AA40](v18);
      if (!v14) {
        goto LABEL_20;
      }
    }
    else
    {
      if (v15 != -1)
      {
        v14 = 0;
        goto LABEL_20;
      }
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __45__CNFRegLocaleController__setupEventHandlers__block_invoke_183;
      v19[3] = &unk_2644F0868;
      v19[4] = *(void *)(a1 + 32);
      id v20 = v6;
      v14 = (void (**)(void))MEMORY[0x223C3AA40](v19);

      if (!v14) {
        goto LABEL_20;
      }
    }
    if (([*(id *)(a1 + 32) timedOut] & 1) == 0)
    {
      [*(id *)(a1 + 32) _stopTimeout];
      v14[2](v14);
    }
    goto LABEL_20;
  }
  uint64_t v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v12 = [*(id *)(a1 + 32) account];
    uint64_t v13 = CNFRegStringForAccount(v12);
    *(_DWORD *)buf = 138412290;
    v22 = v13;
    _os_log_impl(&dword_21ED18000, v11, OS_LOG_TYPE_DEFAULT, "  => Ignoring because the account does not match our account: %@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v14 = [*(id *)(a1 + 32) account];
    uint64_t v17 = CNFRegStringForAccount(v14);
    IMLogString();

LABEL_20:
  }
}

uint64_t __45__CNFRegLocaleController__setupEventHandlers__block_invoke_183(uint64_t a1)
{
  return [*(id *)(a1 + 32) _failValidationWithError:*(void *)(a1 + 40)];
}

uint64_t __45__CNFRegLocaleController__setupEventHandlers__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishValidation];
}

void __45__CNFRegLocaleController__setupEventHandlers__block_invoke_188(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [v5 isActive];
    uint64_t v9 = CNFRegStringForAccount(v5);
    BOOL v10 = (void *)v9;
    uint64_t v11 = @"NO";
    if (v8) {
      uint64_t v11 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    int v16 = v11;
    __int16 v17 = 2112;
    uint64_t v18 = v9;
    _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Account status changed (isActive=%@): %@", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    if ([v5 isActive]) {
      objc_super v12 = @"YES";
    }
    else {
      objc_super v12 = @"NO";
    }
    CNFRegStringForAccount(v5);
    v14 = uint64_t v13 = v12;
    IMLogString();
  }
  objc_msgSend(*(id *)(a1 + 32), "_updateControllerState", v13, v14);
}

- (NSString)currentRegionID
{
  return self->_currentRegionID;
}

- (void)setCurrentRegionID:(id)a3
{
}

- (NSString)currentPhoneValue
{
  return self->_currentPhoneValue;
}

- (void)setCurrentPhoneValue:(id)a3
{
}

- (NSArray)regionData
{
  return self->_regionData;
}

- (void)setRegionData:(id)a3
{
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 1560, 1);
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_regionListChangeObserver, 0);
  objc_storeStrong((id *)&self->_regionData, 0);
  objc_storeStrong((id *)&self->_phoneNumberFieldSpecifier, 0);
  objc_storeStrong((id *)&self->_phoneNumberGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_phoneNumberSpecifiers, 0);
  objc_storeStrong((id *)&self->_countryFieldSpecifier, 0);
  objc_storeStrong((id *)&self->_currentPhoneValue, 0);
  objc_storeStrong((id *)&self->_currentRegionID, 0);
}

@end