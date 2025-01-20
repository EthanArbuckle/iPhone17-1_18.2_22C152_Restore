@interface CNFRegEmailController
- (BOOL)_phoneNumberInAliases:(id)a3;
- (BOOL)emailFieldIsEmpty;
- (BOOL)onlyLocalPhoneNumberSentinelAliasIsSelected;
- (BOOL)shouldShowAllVettedAliases;
- (BOOL)showActionSpecifier:(id)a3 animated:(BOOL)a4;
- (NSString)pendingAlias;
- (double)timeoutDuration;
- (id)_createSpecifierForAlias:(id)a3;
- (id)_rightButtonItem;
- (id)aliasSpecifiers;
- (id)emailTextField;
- (id)logName;
- (id)selectedAliases;
- (id)specifierList;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)titleString;
- (void)_buildActionGroupSpecifierCache:(id)a3;
- (void)_buildCheckMailSpecifierCache:(id)a3;
- (void)_buildEmailSpecifierCache:(id)a3;
- (void)_buildSpecifierCache:(id)a3;
- (void)_failValidationWithError:(id)a3;
- (void)_finishValidation;
- (void)_handleValidationModeCancelled;
- (void)_refreshEnabledStateOfAliasSpecifiers;
- (void)_returnKeyPressed;
- (void)_setFieldsEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)_setupEventHandlers;
- (void)_showCheckMailButton:(BOOL)a3 animated:(BOOL)a4;
- (void)_stopValidationModeAnimated:(BOOL)a3;
- (void)_updateControllerState;
- (void)_updateUI;
- (void)checkMailTapped:(id)a3;
- (void)dealloc;
- (void)emailFieldEmptyStateChanged:(id)a3 forSpecifier:(id)a4;
- (void)nextTapped;
- (void)setAliasSelected:(id)a3;
- (void)setPendingAlias:(id)a3;
- (void)startValidationTimeoutTimer;
- (void)stopValidationTimeoutTimer;
- (void)systemApplicationDidEnterBackground;
- (void)systemApplicationWillEnterForeground;
- (void)validationTimeout:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CNFRegEmailController

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(CNFRegEmailController *)self stopValidationTimeoutTimer];
  [(NSTimer *)self->_validationTimeoutTimer invalidate];
  v4.receiver = self;
  v4.super_class = (Class)CNFRegEmailController;
  [(CNFRegFirstRunController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)CNFRegEmailController;
  [(CNFRegEmailController *)&v8 viewDidLoad];
  if (CNFRegGlobalAppearanceStyle() == 6)
  {
    v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]);
    objc_super v4 = [MEMORY[0x263F825C8] clearColor];
    [v3 setBackgroundColor:v4];
  }
  else if (CNFRegGlobalAppearanceStyle() == 5)
  {
    uint64_t v5 = (int)*MEMORY[0x263F5FDD0];
    v6 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v5);
    v7 = [MEMORY[0x263F825C8] clearColor];
    [v6 setBackgroundColor:v7];

    [*(id *)((char *)&self->super.super.super.super.super.super.super.isa + v5) _setSeparatorsDrawAsOverlay:1];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNFRegEmailController;
  [(CNFRegFirstRunController *)&v4 viewWillAppear:a3];
  [(CNFRegEmailController *)self _updateUI];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CNFRegEmailController;
  [(CNFRegFirstRunController *)&v3 viewDidAppear:a3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CNFRegEmailController;
  [(CNFRegFirstRunController *)&v3 viewWillDisappear:a3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(CNFRegEmailController *)self stopValidationTimeoutTimer];
  [(CNFRegEmailController *)self _stopValidationModeAnimated:v3];
  v5.receiver = self;
  v5.super_class = (Class)CNFRegEmailController;
  [(CNFRegFirstRunController *)&v5 viewDidDisappear:v3];
}

- (id)specifierList
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  if (v4) {
    goto LABEL_29;
  }
  objc_super v5 = CNFRegLoadSpecifiersFromPlist(self, @"CNFRegEmail", self);
  BOOL v6 = [(CNFRegEmailController *)self shouldShowAllVettedAliases];
  v7 = [(CNFRegListController *)self regController];
  objc_super v8 = (void *)MEMORY[0x263EFF8C0];
  v9 = [(CNFRegFirstRunController *)self account];
  v10 = [v8 arrayWithObject:v9];
  v11 = [v7 vettedAliasesForAccounts:v10];

  v12 = [v5 specifierForID:@"FACETIME_EMAIL_DESCRIPTION_GROUP_ID"];
  if (!v6 || (unint64_t)[v11 count] <= 1)
  {
    uint64_t v14 = CNFRegGlobalAppearanceStyle();
LABEL_9:
    if (v14 == 4)
    {
      v16 = CommunicationsSetupUIBundle();
      CNFStringKeyForIdiom(@"FACETIME_EMAIL_DESCRIPTION_MODERN");
    }
    else
    {
      v16 = CommunicationsSetupUIBundle();
      CNFStringKeyForIdiom(@"FACETIME_EMAIL_DESCRIPTION");
    }
    goto LABEL_7;
  }
  BOOL v13 = [(CNFRegEmailController *)self _phoneNumberInAliases:v11];
  uint64_t v14 = CNFRegGlobalAppearanceStyle();
  if (!v13) {
    goto LABEL_9;
  }
  BOOL v15 = v14 == 4;
  v16 = CommunicationsSetupUIBundle();
  if (v15) {
    CNFStringKeyForIdiom(@"FACETIME_EMAIL_AND_PHONE_DESCRIPTION_MODERN");
  }
  else {
    CNFStringKeyForIdiom(@"FACETIME_EMAIL_AND_PHONE_DESCRIPTION");
  }
  v17 = LABEL_7:;
  v18 = CNFRegStringTableName();
  uint64_t v19 = [v16 localizedStringForKey:v17 value:&stru_26D05D4F8 table:v18];
  v20 = (void *)v19;

  if ([v20 _isNaturallyRTL]) {
    uint64_t v21 = 2;
  }
  else {
    uint64_t v21 = 0;
  }
  v22 = [NSNumber numberWithInteger:v21];
  [v12 setProperty:v22 forKey:*MEMORY[0x263F5FEF0]];

  v23 = [NSNumber numberWithInteger:v21];
  [v12 setProperty:v23 forKey:*MEMORY[0x263F600B8]];

  [v12 setProperty:v20 forKey:*MEMORY[0x263F600F8]];
  v24 = [v5 specifierForID:@"FACETIME_EMAIL_GROUP_ID"];
  uint64_t v25 = [v5 indexOfObject:v24];
  if (v25 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v26 = v25;
    v27 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v50 = v11;
      _os_log_impl(&dword_21ED18000, v27, OS_LOG_TYPE_DEFAULT, "Updating specifier list with vetted aliases: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v41 = v11;
      IMLogString();
    }
    uint64_t v28 = v26 + 1;
    if (v6 && [v11 count])
    {
      v29 = [v5 specifierForID:@"FACETIME_EMAIL_ID"];
      [v5 removeObject:v29];
      uint64_t v42 = MEMORY[0x263EF8330];
      uint64_t v43 = 3221225472;
      v44 = __38__CNFRegEmailController_specifierList__block_invoke;
      v45 = &unk_2644F0A10;
      id v46 = v5;
      v47 = self;
      uint64_t v48 = v28;
      [v11 enumerateObjectsWithOptions:2 usingBlock:&v42];
    }
    if (CNFRegSupportsLocalPhoneNumberSentinelAlias())
    {
      v30 = [(CNFRegListController *)self regController];
      v31 = [v30 localPhoneNumberSentinelAlias];

      if (v31)
      {
        v32 = [(CNFRegEmailController *)self _createSpecifierForAlias:v31];
        [v5 insertObject:v32 atIndex:v28];
      }
    }
  }
  -[CNFRegEmailController _buildSpecifierCache:](self, "_buildSpecifierCache:", v5, v41, v42, v43, v44, v45);
  v33 = [v5 specifierForID:@"FACETIME_EMAIL_CHECK_MAIL_GROUP_ID"];
  [v5 removeObject:v33];
  v34 = [v5 specifierForID:@"FACETIME_EMAIL_CHECK_MAIL_ID"];
  [v5 removeObject:v34];
  uint64_t v35 = [v5 copy];
  v36 = (void **)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  v37 = *v36;
  *v36 = (void *)v35;

  [*(id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]) reloadData];
  v38 = [(CNFRegEmailController *)self navigationItem];
  v39 = [v38 rightBarButtonItem];
  [v39 setEnabled:0];

  objc_super v4 = *v36;
LABEL_29:
  return v4;
}

void __38__CNFRegEmailController_specifierList__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) _createSpecifierForAlias:a2];
  [v3 insertObject:v4 atIndex:*(void *)(a1 + 48)];
}

- (id)logName
{
  return @"Email";
}

- (id)_rightButtonItem
{
  id v3 = objc_alloc(MEMORY[0x263F824A8]);
  id v4 = CommunicationsSetupUIBundle();
  objc_super v5 = CNFRegStringTableName();
  BOOL v6 = [v4 localizedStringForKey:@"NEXT" value:&stru_26D05D4F8 table:v5];
  v7 = (void *)[v3 initWithTitle:v6 style:2 target:self action:sel_nextTapped];

  return v7;
}

- (BOOL)showActionSpecifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  char v7 = [(CNFRegEmailController *)self containsSpecifier:v6];
  if ((v7 & 1) == 0)
  {
    if (self->_currentActionSpecifier)
    {
      v16 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:");
      uint64_t v8 = *MEMORY[0x263F600F8];
      uint64_t v9 = [(PSSpecifier *)self->_currentActionSpecifier propertyForKey:*MEMORY[0x263F600F8]];
    }
    else
    {
      uint64_t v9 = 0;
      v16 = 0;
      uint64_t v8 = *MEMORY[0x263F600F8];
    }
    uint64_t v10 = [v6 propertyForKey:v8];
    v11 = [MEMORY[0x263EFF8C0] arrayWithObject:v6];
    [(CNFRegEmailController *)self replaceContiguousSpecifiers:v16 withSpecifiers:v11 animated:v4];
    if (v10 | v9 && ([(id)v10 isEqualToString:v9] & 1) == 0)
    {
      v12 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = v10;
        _os_log_impl(&dword_21ED18000, v12, OS_LOG_TYPE_DEFAULT, "Setting footer text to : %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        uint64_t v15 = v10;
        IMLogString();
      }
      -[PSSpecifier setProperty:forKey:](self->_actionGroupSpecifier, "setProperty:forKey:", v10, v8, v15);
      [(CNFRegEmailController *)self reloadSpecifier:self->_actionGroupSpecifier animated:v4];
    }
    [*(id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]) reloadData];
  }
  currentActionSpecifier = self->_currentActionSpecifier;
  self->_currentActionSpecifier = (PSSpecifier *)v6;

  return v7 ^ 1;
}

- (void)_showCheckMailButton:(BOOL)a3 animated:(BOOL)a4
{
  checkMailSpecifiers = self->_checkMailSpecifiers;
  if (checkMailSpecifiers)
  {
    BOOL v6 = a4;
    BOOL v7 = a3;
    if ([(NSArray *)checkMailSpecifiers count])
    {
      uint64_t v8 = [(NSArray *)self->_checkMailSpecifiers objectAtIndex:0];
      int v9 = [(CNFRegEmailController *)self containsSpecifier:v8];

      if (!v7 || (v9 & 1) != 0)
      {
        if (!v7 && ((v9 ^ 1) & 1) == 0)
        {
          v12 = self->_checkMailSpecifiers;
          [(CNFRegEmailController *)self removeContiguousSpecifiers:v12 animated:v6];
        }
      }
      else
      {
        uint64_t v10 = self->_checkMailSpecifiers;
        uint64_t v11 = [*(id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) count];
        [(CNFRegEmailController *)self insertContiguousSpecifiers:v10 atIndex:v11 animated:v6];
      }
    }
  }
}

- (id)titleString
{
  return &stru_26D05D4F8;
}

- (BOOL)shouldShowAllVettedAliases
{
  id v3 = [(CNFRegListController *)self regController];
  BOOL v4 = (void *)MEMORY[0x263EFF8C0];
  objc_super v5 = [(CNFRegFirstRunController *)self account];
  BOOL v6 = [v4 arrayWithObject:v5];
  BOOL v7 = [v3 vettedAliasesForAccounts:v6];
  BOOL v8 = [v7 count] != 0;

  return v8;
}

- (BOOL)_phoneNumberInAliases:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "type", (void)v8) == 2)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)aliasSpecifiers
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v4 = (int)*MEMORY[0x263F5FDB8];
  uint64_t v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + v4), "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = *(id *)((char *)&self->super.super.super.super.super.super.super.isa + v4);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "propertyForKey:", @"cnfreg-alias", (void)v14);
        if (v12) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_createSpecifierForAlias:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 displayName];
  id v6 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v6 setButtonAction:sel_setAliasSelected_];
  uint64_t v7 = NSStringFromSelector(sel_setAliasSelected_);
  [v6 setProperty:v7 forKey:*MEMORY[0x263F5FF70]];

  int v8 = [v4 isLocalPhoneNumberAlias];
  uint64_t v9 = [NSNumber numberWithBool:v8 ^ 1u];
  [v6 setProperty:v9 forKey:*MEMORY[0x263F600A8]];

  [v6 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  long long v10 = [v4 identifier];
  [v6 setProperty:v10 forKey:*MEMORY[0x263F60138]];

  [v6 setProperty:v5 forKey:*MEMORY[0x263F602D0]];
  long long v11 = [NSNumber numberWithInt:0];
  [v6 setProperty:v11 forKey:*MEMORY[0x263F5FEF0]];

  [v6 setProperty:v4 forKey:@"cnfreg-alias"];
  v12 = [NSNumber numberWithBool:1];
  [v6 setProperty:v12 forKey:@"cnfreg-alias-checked"];

  return v6;
}

- (void)setAliasSelected:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 propertyForKey:@"cnfreg-alias-checked"];
  uint64_t v6 = [v5 BOOLValue] ^ 1;

  uint64_t v7 = [NSNumber numberWithBool:v6];
  [v4 setProperty:v7 forKey:@"cnfreg-alias-checked"];

  int v8 = [(CNFRegEmailController *)self cachedCellForSpecifier:v4];

  [v8 setChecked:v6];
  [(CNFRegEmailController *)self _updateUI];
}

- (id)selectedAliases
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = [(CNFRegEmailController *)self aliasSpecifiers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        int v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = [v8 propertyForKey:@"cnfreg-alias"];
        if (v9)
        {
          long long v10 = [v8 propertyForKey:@"cnfreg-alias-checked"];
          int v11 = [v10 BOOLValue];

          if (v11)
          {
            if (!v5)
            {
              uint64_t v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]), "count"));
            }
            [v5 addObject:v9];
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)onlyLocalPhoneNumberSentinelAliasIsSelected
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(CNFRegEmailController *)self selectedAliases];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v7 + 1) + 8 * i) isLocalPhoneNumberAlias])
        {
          LOBYTE(v3) = 0;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
    LOBYTE(v3) = 1;
  }
LABEL_11:

  return v3;
}

- (void)_finishValidation
{
  [(CNFRegEmailController *)self _stopValidationModeAnimated:0];
  [(CNFRegEmailController *)self stopValidationTimeoutTimer];
  if ([(CNFRegEmailController *)self shouldShowAllVettedAliases])
  {
    [(CNFRegEmailController *)self _updateControllerState];
  }
  else
  {
    [(CNFRegFirstRunController *)self setCellsChecked:1];
    [(CNFRegEmailController *)self performSelector:sel__updateControllerState withObject:0 afterDelay:1.0];
  }
  uint64_t v3 = [(CNFRegEmailController *)self navigationItem];
  [v3 setRightBarButtonItem:0];

  id v4 = [(CNFRegEmailController *)self navigationItem];
  [v4 setHidesBackButton:1];
}

- (void)_stopValidationModeAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNFRegEmailController;
  [(CNFRegFirstRunController *)&v4 _stopValidationModeAnimated:a3];
  self->_validating = 0;
}

- (void)_failValidationWithError:(id)a3
{
  id v4 = a3;
  [(CNFRegEmailController *)self _stopValidationModeAnimated:1];
  [(CNFRegEmailController *)self stopValidationTimeoutTimer];
  uint64_t v5 = [(CNFRegEmailController *)self navigationItem];
  uint64_t v6 = [v5 rightBarButtonItem];
  [v6 setEnabled:1];

  long long v7 = [v4 userInfo];
  long long v8 = [v7 objectForKey:@"cnf-customTitle"];
  long long v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    int v11 = CommunicationsSetupUIBundle();
    uint64_t v12 = CNFRegStringTableName();
    id v10 = [v11 localizedStringForKey:@"FACETIME_ACTIVATION_ERROR_TITLE" value:&stru_26D05D4F8 table:v12];
  }
  uint64_t v13 = [v4 localizedDescription];
  long long v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    long long v16 = CommunicationsSetupUIBundle();
    long long v17 = CNFRegStringTableName();
    id v15 = [v16 localizedStringForKey:@"FACETIME_SIGNIN_ERROR_GENERIC" value:&stru_26D05D4F8 table:v17];
  }
  uint64_t v18 = [v4 userInfo];
  uint64_t v19 = [v18 objectForKey:@"cnf-customButton"];
  v20 = v19;
  if (v19)
  {
    id v21 = v19;
  }
  else
  {
    v22 = CommunicationsSetupUIBundle();
    v23 = CNFRegStringTableName();
    id v21 = [v22 localizedStringForKey:@"FACETIME_ALERT_OK" value:&stru_26D05D4F8 table:v23];
  }
  v24 = [MEMORY[0x263F82418] alertControllerWithTitle:v10 message:v15 preferredStyle:1];
  uint64_t v25 = [MEMORY[0x263F82400] actionWithTitle:v21 style:0 handler:0];
  [v24 addAction:v25];

  uint64_t v26 = [v4 userInfo];
  v27 = [v26 objectForKey:@"cnf-customActionTitle"];

  if (v27)
  {
    uint64_t v28 = (void *)MEMORY[0x263F82400];
    v29 = [v4 userInfo];
    v30 = [v29 objectForKey:@"cnf-customActionTitle"];
    uint64_t v32 = MEMORY[0x263EF8330];
    uint64_t v33 = 3221225472;
    v34 = __50__CNFRegEmailController__failValidationWithError___block_invoke;
    uint64_t v35 = &unk_2644F0A80;
    id v36 = v4;
    v37 = self;
    v31 = [v28 actionWithTitle:v30 style:0 handler:&v32];
    objc_msgSend(v24, "addAction:", v31, v32, v33, v34, v35);
  }
  [(CNFRegEmailController *)self presentViewController:v24 animated:1 completion:0];
}

void __50__CNFRegEmailController__failValidationWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) userInfo];
  uint64_t v5 = [v4 objectForKey:@"cnf-customActionURLString"];

  if (v5)
  {
    uint64_t v6 = [NSURL URLWithString:v5];
    if (v6)
    {
      long long v7 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        int v11 = v6;
        _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Launching URL : %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        long long v9 = v6;
        IMLogString();
      }
      long long v8 = objc_msgSend(*(id *)(a1 + 40), "regController", v9);
      [v8 openURL:v6];
    }
  }
}

- (void)nextTapped
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ED18000, v2, OS_LOG_TYPE_DEFAULT, "Next tapped", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  self->_validating = 1;
  id v3 = [(CNFRegListController *)self regController];
  if (![(CNFRegEmailController *)self shouldShowAllVettedAliases])
  {
    uint64_t v18 = [(CNFRegEmailController *)self emailTextField];
    id v4 = [v18 text];

    uint64_t v19 = [v3 aliases];
    v20 = (void *)[v19 copy];

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v5 = v20;
    uint64_t v21 = [v5 countByEnumeratingWithState:&v56 objects:v60 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v57;
      char v23 = 1;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v57 != v22) {
            objc_enumerationMutation(v5);
          }
          uint64_t v25 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          if ([v25 type] != 2)
          {
            uint64_t v26 = [v25 alias];
            char v27 = [v26 isEqualToString:v4];

            if ((v27 & 1) == 0)
            {
              uint64_t v28 = [v25 alias];
              v29 = [v25 account];
              char v30 = [v3 removeAlias:v28 fromAccount:v29];

              v23 &= v30;
            }
          }
        }
        uint64_t v21 = [v5 countByEnumeratingWithState:&v56 objects:v60 count:16];
      }
      while (v21);

      if ((v23 & 1) == 0) {
        goto LABEL_50;
      }
    }
    else
    {
    }
    v31 = [v3 aliasNamed:v4];
    uint64_t v32 = v31;
    if (v31)
    {
      if ([v31 validationStatus] == 3)
      {
        uint64_t v33 = [v32 account];
        char v34 = [v33 CNFRegSignInComplete];

        if (v34)
        {
          [(CNFRegEmailController *)self _finishValidation];

          goto LABEL_61;
        }
        v49 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED18000, v49, OS_LOG_TYPE_DEFAULT, "**** ERROR: We have a validated alias, but are not registered. Please file a radar.", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
          IMLogString();
        }
        v50 = [v32 account];
        [v50 registerAccount];

        goto LABEL_57;
      }
      char v35 = [v32 validate];

      if ((v35 & 1) == 0)
      {
LABEL_50:
        id v36 = CommunicationsSetupUIBundle();
        v37 = CNFRegStringTableName();
        v38 = [v36 localizedStringForKey:@"FACETIME_ACTIVATION_ERROR_TITLE" value:&stru_26D05D4F8 table:v37];

        v39 = NSString;
        v40 = CommunicationsSetupUIBundle();
        v41 = CNFRegStringTableName();
        uint64_t v42 = [v40 localizedStringForKey:@"FACETIME_EMAIL_UNABLE_TO_ADD_ALIAS_%@" value:&stru_26D05D4F8 table:v41];
        uint64_t v43 = objc_msgSend(v39, "stringWithFormat:", v42, v4);

        v44 = CommunicationsSetupUIBundle();
        v45 = CNFRegStringTableName();
        id v46 = [v44 localizedStringForKey:@"FACETIME_ALERT_OK" value:&stru_26D05D4F8 table:v45];

        v47 = [MEMORY[0x263F82418] alertControllerWithTitle:v38 message:v43 preferredStyle:1];
        uint64_t v48 = [MEMORY[0x263F82400] actionWithTitle:v46 style:0 handler:0];
        [v47 addAction:v48];

        [(CNFRegEmailController *)self presentViewController:v47 animated:1 completion:0];
LABEL_60:

        goto LABEL_61;
      }
    }
    else if (![v3 addAlias:v4])
    {
      goto LABEL_50;
    }
LABEL_57:
    [(CNFRegEmailController *)self setPendingAlias:v4];
    uint64_t v51 = [(CNFRegEmailController *)self cachedCellForSpecifier:self->_emailSpecifier];
    v38 = [v51 editableTextField];

    if (objc_opt_respondsToSelector()) {
      [v38 resignFirstResponder];
    }
    [(CNFRegFirstRunController *)self _startValidationModeAnimated:0 allowCancel:1];
    [(CNFRegEmailController *)self _showCheckMailButton:0 animated:1];
    [(CNFRegEmailController *)self startValidationTimeoutTimer];
    goto LABEL_60;
  }
  id v4 = [(CNFRegEmailController *)self selectedAliases];
  id v5 = [v4 arrayByApplyingSelector:sel_alias];
  uint64_t v6 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v62 = v4;
    _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "  => Selected aliases: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    id v52 = v4;
    IMLogString();
  }
  long long v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v62 = v5;
    _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "  => Alias strings: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    id v52 = v5;
    IMLogString();
  }
  long long v8 = [(CNFRegFirstRunController *)self account];
  [v3 setAliases:v5 onAccount:v8];

  long long v9 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(CNFRegFirstRunController *)self account];
    id v11 = [v10 aliases];
    uint64_t v12 = [(CNFRegFirstRunController *)self account];
    *(_DWORD *)buf = 138412546;
    id v62 = v11;
    __int16 v63 = 2112;
    v64 = v12;
    _os_log_impl(&dword_21ED18000, v9, OS_LOG_TYPE_DEFAULT, "Set aliases %@ on account %@", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    uint64_t v13 = [(CNFRegFirstRunController *)self account];
    long long v14 = [v13 aliases];
    [(CNFRegFirstRunController *)self account];
    v54 = v53 = v14;
    IMLogString();
  }
  id v15 = [(CNFRegFirstRunController *)self account];
  int v16 = [v15 CNFRegSignInComplete];

  if (v16)
  {
    long long v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED18000, v17, OS_LOG_TYPE_DEFAULT, "Skipping validation because sign in is complete", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    [(CNFRegEmailController *)self _finishValidation];
  }
  else
  {
    [(CNFRegFirstRunController *)self _startValidationModeAnimated:0 allowCancel:1];
    [(CNFRegEmailController *)self _showCheckMailButton:0 animated:1];
    [(CNFRegEmailController *)self startValidationTimeoutTimer];
  }
LABEL_61:
}

- (void)_returnKeyPressed
{
  if ([(CNFRegEmailController *)self shouldShowAllVettedAliases])
  {
    id v3 = [(CNFRegEmailController *)self selectedAliases];
    BOOL v4 = [v3 count] != 0;
  }
  else
  {
    BOOL v4 = 0;
  }
  if ([(CNFRegEmailController *)self shouldShowAllVettedAliases]) {
    int v5 = 0;
  }
  else {
    int v5 = ![(CNFRegEmailController *)self emailFieldIsEmpty];
  }
  if ((v4 | v5) == 1)
  {
    [(CNFRegEmailController *)self nextTapped];
  }
}

- (void)checkMailTapped:(id)a3
{
  if (SBSLaunchApplicationWithIdentifier())
  {
    BOOL v4 = CommunicationsSetupUIBundle();
    int v5 = CNFRegStringTableName();
    id v14 = [v4 localizedStringForKey:@"FACETIME_ACTIVATION_ERROR_TITLE" value:&stru_26D05D4F8 table:v5];

    uint64_t v6 = CommunicationsSetupUIBundle();
    long long v7 = CNFRegStringTableName();
    long long v8 = [v6 localizedStringForKey:@"FACETIME_SIGNIN_ERROR_COULDNT_LAUNCH_MAIL" value:&stru_26D05D4F8 table:v7];

    long long v9 = CommunicationsSetupUIBundle();
    id v10 = CNFRegStringTableName();
    id v11 = [v9 localizedStringForKey:@"FACETIME_ALERT_OK" value:&stru_26D05D4F8 table:v10];

    uint64_t v12 = [MEMORY[0x263F82418] alertControllerWithTitle:v14 message:v8 preferredStyle:1];
    uint64_t v13 = [MEMORY[0x263F82400] actionWithTitle:v11 style:0 handler:0];
    [v12 addAction:v13];

    [(CNFRegEmailController *)self presentViewController:v12 animated:1 completion:0];
  }
}

- (void)_handleValidationModeCancelled
{
  v10.receiver = self;
  v10.super_class = (Class)CNFRegEmailController;
  [(CNFRegFirstRunController *)&v10 _handleValidationModeCancelled];
  id v3 = [(CNFRegEmailController *)self pendingAlias];
  BOOL v4 = v3;
  if (v3 && [v3 length])
  {
    int v5 = [(CNFRegListController *)self regController];
    uint64_t v6 = [v5 aliasNamed:v4];

    long long v7 = [(CNFRegListController *)self regController];
    long long v8 = [v6 alias];
    long long v9 = [v6 account];
    [v7 removeAlias:v8 fromAccount:v9];
  }
  [(CNFRegEmailController *)self _stopValidationModeAnimated:0];
}

- (void)systemApplicationDidEnterBackground
{
  v3.receiver = self;
  v3.super_class = (Class)CNFRegEmailController;
  [(CNFRegFirstRunController *)&v3 systemApplicationDidEnterBackground];
  [(CNFRegEmailController *)self stopValidationTimeoutTimer];
  [(CNFRegEmailController *)self _stopValidationModeAnimated:1];
}

- (void)systemApplicationWillEnterForeground
{
  v4.receiver = self;
  v4.super_class = (Class)CNFRegEmailController;
  [(CNFRegFirstRunController *)&v4 systemApplicationWillEnterForeground];
  v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v3 = 0;
    _os_log_impl(&dword_21ED18000, v2, OS_LOG_TYPE_DEFAULT, "Will become active", v3, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (IMShouldLog()) {
      IMLogString();
    }
  }
}

- (void)_refreshEnabledStateOfAliasSpecifiers
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  objc_super v3 = [(CNFRegEmailController *)self selectedAliases];
  uint64_t v16 = [v3 count];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_super v4 = self;
  id obj = [(CNFRegEmailController *)self aliasSpecifiers];
  uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    uint64_t v8 = *MEMORY[0x263F600A8];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        objc_super v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v11 = [v10 propertyForKey:@"cnfreg-alias"];
        if (v11)
        {
          if (v16 == 1)
          {
            uint64_t v12 = [v10 propertyForKey:@"cnfreg-alias-checked"];
            int v13 = [v12 BOOLValue];
          }
          else
          {
            int v13 = 0;
          }
          if (CNFRegSupportsLocalPhoneNumberSentinelAlias()) {
            v13 |= [v11 isLocalPhoneNumberAlias];
          }
          id v14 = [NSNumber numberWithBool:v13 ^ 1u];
          [v10 setProperty:v14 forKey:v8];

          [(CNFRegEmailController *)v4 reloadSpecifier:v10];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
}

- (void)_updateUI
{
  objc_super v3 = [(CNFRegListController *)self regController];
  objc_super v4 = [(CNFRegEmailController *)self pendingAlias];
  uint64_t v5 = [v3 aliasNamed:v4];

  if (v5 && [v5 validationStatus] == 2)
  {
    [(CNFRegFirstRunController *)self _startValidationModeAnimated:1 allowCancel:1];
    if (!self->_validationTimeoutTimer) {
      [(CNFRegEmailController *)self startValidationTimeoutTimer];
    }
  }
  else
  {
    uint64_t v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Handling initial state", v16, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    [(CNFRegEmailController *)self _stopValidationModeAnimated:1];
    if ([(CNFRegEmailController *)self shouldShowAllVettedAliases])
    {
      uint64_t v7 = [(CNFRegEmailController *)self selectedAliases];
      uint64_t v8 = [v7 count] != 0;

      [(CNFRegEmailController *)self _refreshEnabledStateOfAliasSpecifiers];
    }
    else
    {
      long long v9 = [(CNFRegEmailController *)self pendingAlias];

      if (!v9)
      {
        objc_super v10 = [v3 guessedAlias];
        [(CNFRegEmailController *)self setPendingAlias:v10];
      }
      uint64_t v8 = [(CNFRegEmailController *)self emailFieldIsEmpty] ^ 1;
      id v11 = [(CNFRegEmailController *)self pendingAlias];
      if (v11)
      {
        uint64_t v12 = [(CNFRegEmailController *)self pendingAlias];
        uint64_t v13 = [v12 length];

        if (v13) {
          uint64_t v8 = 1;
        }
        else {
          uint64_t v8 = v8;
        }
      }

      [(CNFRegEmailController *)self reloadSpecifier:self->_emailSpecifier animated:1];
    }
    id v14 = [(CNFRegEmailController *)self navigationItem];
    id v15 = [v14 rightBarButtonItem];
    [v15 setEnabled:v8];
  }
}

- (void)_updateControllerState
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)CNFRegEmailController;
  [(CNFRegFirstRunController *)&v16 _updateControllerState];
  [(CNFRegEmailController *)self _updateUI];
  objc_super v3 = [(CNFRegListController *)self regController];
  objc_super v4 = [(CNFRegFirstRunController *)self account];
  uint64_t v5 = [v3 accountStateForAccount:v4];

  uint64_t v6 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"YES";
    if (v5) {
      uint64_t v8 = @"YES";
    }
    else {
      uint64_t v8 = @"NO";
    }
    if ((v5 & 4) == 0) {
      uint64_t v7 = @"NO";
    }
    *(_DWORD *)buf = 138412546;
    long long v18 = v8;
    __int16 v19 = 2112;
    long long v20 = v7;
    _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Updating email controller state, authenticated:%@   signInComplete:%@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    long long v9 = @"YES";
    if (v5) {
      objc_super v10 = @"YES";
    }
    else {
      objc_super v10 = @"NO";
    }
    if ((v5 & 4) == 0) {
      long long v9 = @"NO";
    }
    id v14 = v10;
    id v15 = v9;
    IMLogString();
  }
  if (v5)
  {
    if ((v5 & 4) != 0)
    {
      uint64_t v12 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED18000, v12, OS_LOG_TYPE_DEFAULT, "Handling finished state", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }
      if ([(CNFRegFirstRunController *)self pushCompletionControllerIfPossible])
      {
        char v13 = 1;
      }
      else
      {
        char v13 = [(CNFRegFirstRunController *)self dismissWithState:v5];
      }
      CNFAssert(v13, 7, @"Finished email verification but no action was taken");
    }
    else
    {
      [(CNFRegFirstRunController *)self _refreshNavBarAnimated:0];
    }
  }
  else
  {
    id v11 = [(CNFRegEmailController *)self navigationController];
    [v11 popToSigninControllerAnimated:1];
  }
}

- (void)_setFieldsEnabled:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)CNFRegEmailController;
  -[CNFRegListController _setFieldsEnabled:animated:](&v18, sel__setFieldsEnabled_animated_);
  [(CNFRegListController *)self _setSpecifierEnabled:self->_emailSpecifier enabled:v5 animated:v4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [(CNFRegEmailController *)self aliasSpecifiers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        char v13 = [v12 propertyForKey:@"cnfreg-alias"];
        if (([v13 isLocalPhoneNumberAlias] & 1) == 0) {
          [(CNFRegListController *)self _setSpecifierEnabled:v12 enabled:v5 animated:v4];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v9);
  }
}

- (id)emailTextField
{
  v2 = [(CNFRegEmailController *)self cachedCellForSpecifier:self->_emailSpecifier];
  objc_super v3 = [v2 editableTextField];
  BOOL v4 = CNFRegGlobalAppearanceController();
  objc_msgSend(v3, "setKeyboardAppearance:", objc_msgSend(v4, "keyboardAppearance"));

  return v3;
}

- (BOOL)emailFieldIsEmpty
{
  v2 = [(CNFRegEmailController *)self emailTextField];
  objc_super v3 = [v2 text];

  if (v3) {
    BOOL v4 = [v3 length] == 0;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (void)emailFieldEmptyStateChanged:(id)a3 forSpecifier:(id)a4
{
  int v5 = [a3 BOOLValue];
  id v7 = [(CNFRegEmailController *)self navigationItem];
  uint64_t v6 = [v7 rightBarButtonItem];
  [v6 setEnabled:v5 ^ 1u];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v21.receiver = self;
  v21.super_class = (Class)CNFRegEmailController;
  id v6 = a4;
  id v7 = [(CNFRegEmailController *)&v21 tableView:a3 cellForRowAtIndexPath:v6];
  uint64_t v8 = -[CNFRegEmailController indexForIndexPath:](self, "indexForIndexPath:", v6, v21.receiver, v21.super_class);

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = [*(id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndex:v8];
    uint64_t v10 = [v9 propertyForKey:@"cnfreg-alias-checked"];

    if (v10) {
      objc_msgSend(v7, "setChecked:", objc_msgSend(v10, "BOOLValue"));
    }
  }
  if (CNFRegGlobalAppearanceStyle() == 6 || CNFRegGlobalAppearanceStyle() == 5)
  {
    id v11 = [MEMORY[0x263F825C8] clearColor];
    [v7 setBackgroundColor:v11];
  }
  uint64_t v12 = [(CNFRegEmailController *)self cachedCellForSpecifierID:@"FACETIME_EMAIL_ID"];

  if (v7 == v12)
  {
    char v13 = +[CNFRegAppearanceController globalAppearanceController];
    if ([v13 styleUsesCustomTableStyle])
    {
      long long v14 = [v13 tableCellTextLabelColor];

      if (v14)
      {
        long long v15 = [v13 tableCellTextLabelColor];
        long long v16 = [v7 editableTextField];
        long long v17 = [v16 _placeholderLabel];
        [v17 setTextColor:v15];

        objc_super v18 = [v13 tableCellTextLabelColor];
        __int16 v19 = [v7 editableTextField];
        [v19 setTextColor:v18];
      }
    }
  }
  return v7;
}

- (double)timeoutDuration
{
  objc_super v3 = (void *)CUTWeakLinkClass();
  if (v3 && ([v3 hasActiveAccounts] & 1) != 0
    || (double v4 = 18.0, [(CNFRegEmailController *)self shouldShowAllVettedAliases]))
  {
    double v4 = 75.0;
  }
  unint64_t v5 = [MEMORY[0x263EFFA40] CNFRegEmailValidationTimeout];
  double result = (double)v5;
  if (!v5) {
    return v4;
  }
  return result;
}

- (void)stopValidationTimeoutTimer
{
  if (self->_validationTimeoutTimer)
  {
    objc_super v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v5 = 0;
      _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Stopping validation timer", v5, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (IMShouldLog()) {
        IMLogString();
      }
    }
    [(NSTimer *)self->_validationTimeoutTimer invalidate];
    validationTimeoutTimer = self->_validationTimeoutTimer;
    self->_validationTimeoutTimer = 0;
  }
}

- (void)startValidationTimeoutTimer
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (self->_validationTimeoutTimer) {
    [(CNFRegEmailController *)self stopValidationTimeoutTimer];
  }
  [(CNFRegEmailController *)self timeoutDuration];
  double v4 = v3;
  unint64_t v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v10 = v4;
    _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "Starting validation timer with duration %0.3f", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    double v8 = v4;
    IMLogString();
  }
  objc_msgSend(MEMORY[0x263EFFA20], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_validationTimeout_, 0, 0, v4, *(void *)&v8);
  id v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  validationTimeoutTimer = self->_validationTimeoutTimer;
  self->_validationTimeoutTimer = v6;
}

- (void)validationTimeout:(id)a3
{
  id v4 = a3;
  unint64_t v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v19 = 0;
    _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "Validation timeout occurred", v19, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  [(CNFRegEmailController *)self _stopValidationModeAnimated:1];
  [(CNFRegEmailController *)self stopValidationTimeoutTimer];
  id v6 = [(CNFRegEmailController *)self navigationItem];
  id v7 = [v6 rightBarButtonItem];
  [v7 setEnabled:1];

  if ([(CNFRegEmailController *)self shouldShowAllVettedAliases])
  {
    double v8 = CommunicationsSetupUIBundle();
    uint64_t v9 = CNFRegStringTableName();
    double v10 = [v8 localizedStringForKey:@"FACETIME_ACTIVATION_ERROR_TITLE" value:&stru_26D05D4F8 table:v9];

    uint64_t v11 = CommunicationsSetupUIBundle();
    uint64_t v12 = CNFRegStringTableName();
    char v13 = [v11 localizedStringForKey:@"FACETIME_ACTIVATION_ERROR_GENERIC" value:&stru_26D05D4F8 table:v12];

    long long v14 = CommunicationsSetupUIBundle();
    long long v15 = CNFRegStringTableName();
    long long v16 = [v14 localizedStringForKey:@"FACETIME_ALERT_OK" value:&stru_26D05D4F8 table:v15];

    long long v17 = [MEMORY[0x263F82418] alertControllerWithTitle:v10 message:v13 preferredStyle:1];
    objc_super v18 = [MEMORY[0x263F82400] actionWithTitle:v16 style:0 handler:0];
    [v17 addAction:v18];

    [(CNFRegEmailController *)self presentViewController:v17 animated:1 completion:0];
  }
  else
  {
    [(CNFRegEmailController *)self _showCheckMailButton:1 animated:1];
  }
}

- (void)_buildEmailSpecifierCache:(id)a3
{
  self->_emailSpecifier = [a3 specifierForID:@"FACETIME_EMAIL_ID"];
  MEMORY[0x270F9A758]();
}

- (void)_buildActionGroupSpecifierCache:(id)a3
{
  self->_actionGroupSpecifier = [a3 specifierForID:@"FACETIME_EMAIL_BUTTON_GROUP_ID"];
  MEMORY[0x270F9A758]();
}

- (void)_buildCheckMailSpecifierCache:(id)a3
{
  id v5 = a3;
  id v10 = [v5 specifierForID:@"FACETIME_EMAIL_CHECK_MAIL_GROUP_ID"];
  id v6 = [v5 specifierForID:@"FACETIME_EMAIL_CHECK_MAIL_ID"];

  if (!v10 || !v6)
  {
    uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"CNFRegEmailController.m" lineNumber:866 description:@"Could not retrieve check mail button from plist"];
  }
  id v7 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v10, v6, 0);
  checkMailSpecifiers = self->_checkMailSpecifiers;
  self->_checkMailSpecifiers = v7;
}

- (void)_buildSpecifierCache:(id)a3
{
  id v4 = a3;
  [(CNFRegEmailController *)self _buildEmailSpecifierCache:v4];
  [(CNFRegEmailController *)self _buildCheckMailSpecifierCache:v4];
  [(CNFRegEmailController *)self _buildActionGroupSpecifierCache:v4];
}

- (void)_setupEventHandlers
{
  v8.receiver = self;
  v8.super_class = (Class)CNFRegEmailController;
  [(CNFRegFirstRunController *)&v8 _setupEventHandlers];
  double v3 = [(CNFRegListController *)self regController];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__CNFRegEmailController__setupEventHandlers__block_invoke;
  v7[3] = &unk_2644F0B98;
  v7[4] = self;
  [v3 setAccountRegistrationBlock:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__CNFRegEmailController__setupEventHandlers__block_invoke_2;
  v6[3] = &unk_2644F0BC0;
  v6[4] = self;
  [v3 setAliasAddedBlock:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__CNFRegEmailController__setupEventHandlers__block_invoke_237;
  v5[3] = &unk_2644F0BE8;
  v5[4] = self;
  [v3 setAliasStatusChangedBlock:v5];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__CNFRegEmailController__setupEventHandlers__block_invoke_242;
  v4[3] = &unk_2644F0B70;
  v4[4] = self;
  [v3 setVettedAliasesChangedBlock:v4];
}

void __44__CNFRegEmailController__setupEventHandlers__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 CNFRegSignInComplete])
  {
    [*(id *)(a1 + 32) _finishValidation];
  }
  else if ([v4 CNFRegSignInFailed])
  {
    [*(id *)(a1 + 32) stopValidationTimeoutTimer];
    [*(id *)(a1 + 32) _stopValidationModeAnimated:0];
    double v3 = [*(id *)(a1 + 32) navigationController];
    [v3 popToSigninControllerAnimated:1];
  }
}

void __44__CNFRegEmailController__setupEventHandlers__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_21ED18000, v4, OS_LOG_TYPE_DEFAULT, "Alias added: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    id v7 = v3;
    IMLogString();
  }
  id v5 = objc_msgSend(v3, "account", v7);
  int v6 = [v5 CNFRegSignInComplete];

  if (v6) {
    [*(id *)(a1 + 32) _finishValidation];
  }
}

void __44__CNFRegEmailController__setupEventHandlers__block_invoke_237(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v5;
    _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Got alias status change: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    id v11 = v5;
    IMLogString();
  }
  objc_super v8 = objc_msgSend(v5, "account", v11);
  id v9 = [*(id *)(a1 + 32) account];
  BOOL v10 = v8 == v9;

  if (v10 && [v5 validationStatus] == -1) {
    [*(id *)(a1 + 32) _failValidationWithError:v6];
  }
}

void __44__CNFRegEmailController__setupEventHandlers__block_invoke_242(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_21ED18000, v4, OS_LOG_TYPE_DEFAULT, "Got vetted aliases change: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  id v5 = *(unsigned char **)(a1 + 32);
  if (!v5[1536])
  {
    id v6 = [v5 account];
    BOOL v7 = v6 == v3;

    if (v7) {
      [*(id *)(a1 + 32) reloadSpecifiers];
    }
  }
}

- (NSString)pendingAlias
{
  return self->_pendingAlias;
}

- (void)setPendingAlias:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingAlias, 0);
  objc_storeStrong((id *)&self->_validationTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_checkMailSpecifiers, 0);
  objc_storeStrong((id *)&self->_currentActionSpecifier, 0);
  objc_storeStrong((id *)&self->_actionGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_emailSpecifier, 0);
}

@end