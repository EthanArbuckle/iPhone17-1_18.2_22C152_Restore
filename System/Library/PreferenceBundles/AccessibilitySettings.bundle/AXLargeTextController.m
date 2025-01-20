@interface AXLargeTextController
+ (void)initialize;
- (BOOL)ax_handlesOwnScrollingInSetup;
- (BOOL)readUsesExtendedRange;
- (NSString)appID;
- (NSString)descriptionText;
- (id)_customViewForSpecifier:(id)a3 class:(Class)a4 isHeader:(BOOL)a5;
- (id)getSizeCategoryBlock;
- (id)getValueSelectedBlock;
- (id)readPreferredContentSizeCategoryName;
- (id)readPreferredContentSizeCategoryNameForAppID:(id)a3;
- (id)setSizeCategoryBlock;
- (id)setValueSelectedBlock;
- (id)specifiers;
- (void)loadView;
- (void)resetContentSizeCategoryName;
- (void)savePreferredContentSizeCategoryName:(id)a3;
- (void)savePreferredContentSizeCategoryName:(id)a3 forAppID:(id)a4;
- (void)setAppID:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation AXLargeTextController

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_4);
  }
}

void __35__AXLargeTextController_initialize__block_invoke(id a1)
{
  if (AXProcessIsSetup())
  {
    id v1 = +[AXValidationManager sharedInstance];
    [v1 performValidations:&__block_literal_global_285 withPreValidationHandler:&__block_literal_global_287 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_296];
  }
}

BOOL __35__AXLargeTextController_initialize__block_invoke_2(id a1, AXValidationManager *a2)
{
  return 1;
}

BOOL __35__AXLargeTextController_initialize__block_invoke_3(id a1, AXValidationManager *a2)
{
  v2 = a2;
  [(AXValidationManager *)v2 setValidationTargetName:@"AXLargeTextController"];
  [(AXValidationManager *)v2 setOverrideProcessName:@"AXLargeTextController (Setup)"];
  [(AXValidationManager *)v2 setDebugBuild:0];

  return _AXPerformValidationChecks();
}

void __35__AXLargeTextController_initialize__block_invoke_4(id a1, AXValidationManager *a2)
{
  v2 = a2;
  [(AXValidationManager *)v2 installSafeCategory:@"AXSettings_DBSLargeTextSliderListControllerOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"AXSettings_DBSLargeTextExplanationViewOverride" canInteractWithTargetClass:1];
}

- (void)loadView
{
  [(AXLargeTextController *)self setShowsExtendedRangeSwitch:1];
  if (self->_appID) {
    [(AXLargeTextController *)self setSavesCategoryNameOnlyOnSliderEvent:1];
  }
  v9.receiver = self;
  v9.super_class = (Class)AXLargeTextController;
  [(AXLargeTextController *)&v9 loadView];
  if (AXProcessIsSetup())
  {
    v3 = sharedBFFStyle();
    v4 = [v3 backgroundColor];
    v5 = [(AXLargeTextController *)self view];
    [v5 setBackgroundColor:v4];

    v6 = sharedBFFStyle();
    v7 = [v6 backgroundColor];
    v8 = [(AXLargeTextController *)self table];
    [v8 setBackgroundColor:v7];
  }
}

- (BOOL)ax_handlesOwnScrollingInSetup
{
  return 1;
}

- (void)viewDidLayoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)AXLargeTextController;
  [(AXLargeTextController *)&v34 viewDidLayoutSubviews];
  if (AXProcessIsSetup())
  {
    v3 = [(AXLargeTextController *)self view];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    objc_msgSend(*(id *)&self->DBSLargeTextController_opaque[OBJC_IVAR___PSListController__table], "setFrame:", v5, v7, v9, v11);
    v29 = _NSConcreteStackBlock;
    uint64_t v30 = 3221225472;
    v31 = __46__AXLargeTextController_viewDidLayoutSubviews__block_invoke;
    v32 = &unk_2087C0;
    v33 = self;
    AXPerformSafeBlock();
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v12 = [(AXLargeTextController *)self childViewControllers];
    id v13 = [v12 countByEnumeratingWithState:&v25 objects:v35 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v26;
      do
      {
        v16 = 0;
        do
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v16);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v18 = v17;
            v19 = [v18 view];
            [v19 frame];
            double v21 = v20;
            double v23 = v22;

            v24 = [v18 view];

            objc_msgSend(v24, "setFrame:", v5, v21, v9, v23);
          }
          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v25 objects:v35 count:16];
      }
      while (v14);
    }
  }
}

id __46__AXLargeTextController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSectionContentInsetWithAnimation:0];
}

- (id)specifiers
{
  if (self->_appID)
  {
    uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
    double v4 = *(void **)&self->DBSLargeTextController_opaque[OBJC_IVAR___PSListController__specifiers];
    if (!v4)
    {
      id v5 = objc_alloc_init((Class)NSMutableArray);
      double v6 = +[PSSpecifier emptyGroupSpecifier];
      double v7 = (objc_class *)objc_opt_class();
      double v8 = NSStringFromClass(v7);
      [v6 setProperty:v8 forKey:PSFooterCellClassGroupKey];

      [v6 setProperty:self->_appID forKey:@"BundleIdentifier"];
      switchGroupSpecifier = self->_switchGroupSpecifier;
      self->_switchGroupSpecifier = (PSSpecifier *)v6;
      id v10 = v6;

      [v5 addObject:v10];
      double v11 = *(void **)&self->DBSLargeTextController_opaque[v3];
      *(void *)&self->DBSLargeTextController_opaque[v3] = v5;

      double v4 = *(void **)&self->DBSLargeTextController_opaque[v3];
    }
    id v12 = v4;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)AXLargeTextController;
    id v12 = [(AXLargeTextController *)&v14 specifiers];
  }

  return v12;
}

- (void)setSpecifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AXLargeTextController;
  id v4 = a3;
  [(AXLargeTextController *)&v6 setSpecifier:v4];
  id v5 = objc_msgSend(v4, "propertyForKey:", @"BundleIdentifier", v6.receiver, v6.super_class);

  [(AXLargeTextController *)self setAppID:v5];
}

- (id)_customViewForSpecifier:(id)a3 class:(Class)a4 isHeader:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AXLargeTextController;
  double v9 = [(AXLargeTextController *)&v16 _customViewForSpecifier:v8 class:a4 isHeader:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v10 = __UIAccessibilityCastAsClass();
    double v11 = [(AXLargeTextController *)self readPreferredContentSizeCategoryName];
    [v10 setCategoryName:v11];

    id v12 = [(AXLargeTextController *)self specifier];
    id v13 = [v12 propertyForKey:@"exampleText"];

    if (v13)
    {
      objc_super v14 = [v10 bodyExampleLabel];
      [v14 setText:v13];
    }
  }

  return v9;
}

- (void)setAppID:(id)a3
{
  objc_storeStrong((id *)&self->_appID, a3);
  if (a3)
  {
    [(AXLargeTextController *)self setShowsResetSliderButton:1];
    [(AXLargeTextController *)self setSavesCategoryNameOnlyOnSliderEvent:1];
    [(AXLargeTextController *)self reloadSpecifiers];
    [(AXLargeTextController *)self updateSlider];
  }
}

- (id)readPreferredContentSizeCategoryName
{
  uint64_t v3 = [(AXLargeTextController *)self getSizeCategoryBlock];

  if (v3)
  {
    id v4 = [(AXLargeTextController *)self getSizeCategoryBlock];
    BOOL v5 = v4[2]();
  }
  else
  {
    BOOL v5 = [(AXLargeTextController *)self readPreferredContentSizeCategoryNameForAppID:self->_appID];
    if (![v5 length])
    {
      uint64_t v6 = _AXSCopyPreferredContentSizeCategoryNameGlobal();

      BOOL v5 = (void *)v6;
    }
    if (![v5 length] && self->_appID)
    {
      double v7 = UIContentSizeCategoryLarge;

      id v8 = AXSupportLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Return Default CategoryName", v10, 2u);
      }

      BOOL v5 = v7;
    }
  }

  return v5;
}

- (void)savePreferredContentSizeCategoryName:(id)a3
{
  id v10 = a3;
  id v4 = [(AXLargeTextController *)self setSizeCategoryBlock];

  if (v4)
  {
    BOOL v5 = [(AXLargeTextController *)self setSizeCategoryBlock];
    ((void (**)(void, id))v5)[2](v5, v10);
LABEL_9:

    goto LABEL_10;
  }
  [(AXLargeTextController *)self savePreferredContentSizeCategoryName:v10 forAppID:self->_appID];
  if (!self->_appID) {
    goto LABEL_11;
  }
  uint64_t v6 = +[AXSettings sharedInstance];
  [v6 aggregatePerAppSettingsStatistics];

  double v7 = [(AXLargeTextController *)self setValueSelectedBlock];

  if (v7)
  {
    BOOL v5 = [(AXLargeTextController *)self setValueSelectedBlock];
    if (v10) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 0xFFFFFFFFLL;
    }
    double v9 = +[NSNumber numberWithInt:v8];
    ((void (**)(void, void *))v5)[2](v5, v9);

    goto LABEL_9;
  }
LABEL_10:
  [(AXLargeTextController *)self reloadSpecifier:self->_switchGroupSpecifier];
LABEL_11:
}

- (void)resetContentSizeCategoryName
{
  uint64_t v3 = AXSupportLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Reset Per-App CategoryName", v8, 2u);
  }

  [(AXLargeTextController *)self savePreferredContentSizeCategoryName:0];
  id v4 = [(AXLargeTextController *)self setSizeCategoryBlock];

  if (v4)
  {
    BOOL v5 = [(AXLargeTextController *)self setSizeCategoryBlock];
    uint64_t v6 = (void (*)(void))v5[2];
LABEL_7:
    v6();

    goto LABEL_8;
  }
  double v7 = [(AXLargeTextController *)self setValueSelectedBlock];

  if (v7)
  {
    BOOL v5 = [(AXLargeTextController *)self setValueSelectedBlock];
    uint64_t v6 = (void (*)(void))v5[2];
    goto LABEL_7;
  }
LABEL_8:
  [(AXLargeTextController *)self updateSlider];
}

- (BOOL)readUsesExtendedRange
{
  return self->_appID || _AXSLargeTextUsesExtendedRange() != 0;
}

- (id)readPreferredContentSizeCategoryNameForAppID:(id)a3
{
  uint64_t v3 = (void *)_AXSCopyPreferredContentSizeCategoryNameApp();

  return v3;
}

- (void)savePreferredContentSizeCategoryName:(id)a3 forAppID:(id)a4
{
}

- (id)getValueSelectedBlock
{
  v2 = [(AXLargeTextController *)self specifier];
  uint64_t v3 = [v2 propertyForKey:@"getValueSelectedBlock"];

  return v3;
}

- (id)setValueSelectedBlock
{
  v2 = [(AXLargeTextController *)self specifier];
  uint64_t v3 = [v2 propertyForKey:@"setValueSelectedBlock"];

  return v3;
}

- (id)setSizeCategoryBlock
{
  v2 = [(AXLargeTextController *)self specifier];
  uint64_t v3 = [v2 propertyForKey:@"setSizeCategory"];

  return v3;
}

- (id)getSizeCategoryBlock
{
  v2 = [(AXLargeTextController *)self specifier];
  uint64_t v3 = [v2 propertyForKey:@"getSizeCategory"];

  return v3;
}

- (NSString)appID
{
  return self->_appID;
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (void)setDescriptionText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_appID, 0);

  objc_storeStrong((id *)&self->_switchGroupSpecifier, 0);
}

@end