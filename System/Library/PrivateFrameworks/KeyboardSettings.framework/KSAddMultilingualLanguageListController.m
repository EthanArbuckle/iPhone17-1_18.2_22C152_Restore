@interface KSAddMultilingualLanguageListController
- (NSArray)multilingualSet;
- (id)newSpecifiers;
- (id)specifiers;
- (void)addLanguage:(id)a3;
- (void)reloadKeyboardSpecifiers;
- (void)setMultilingualSet:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation KSAddMultilingualLanguageListController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)KSAddMultilingualLanguageListController;
  [(KSAddMultilingualLanguageListController *)&v4 viewDidLoad];
  uint64_t v3 = (int)*MEMORY[0x263F5FDD0];
  [*(id *)((char *)&self->super.super.super.super.super.isa + v3) setEstimatedSectionHeaderHeight:0.0];
  [*(id *)((char *)&self->super.super.super.super.super.isa + v3) setEstimatedSectionFooterHeight:0.0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)KSAddMultilingualLanguageListController;
  [(KSAddMultilingualLanguageListController *)&v7 viewWillAppear:a3];
  objc_super v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"MULTILINGUAL_DETAIL_ADD_LANGUAGE_TITLE" value:&stru_2703C6C20 table:@"Keyboard"];
  v6 = [(KSAddMultilingualLanguageListController *)self navigationItem];
  [v6 setTitle:v5];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [(KSAddMultilingualLanguageListController *)self newSpecifiers];
    v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v5;

    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)newSpecifiers
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  objc_super v4 = [MEMORY[0x263F1C748] sharedInputModeController];
  v17 = [v4 enabledInputModeIdentifiers];

  v5 = [(KSAddMultilingualLanguageListController *)self multilingualSet];
  v6 = TIUIGetAddableInputModesForMultilingualSet(v5);

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    uint64_t v10 = *MEMORY[0x263F60138];
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * v11);
        v13 = TIInputModeGetLanguageWithRegion();
        v14 = +[KSKeyboardListController keyboardDisplayNameForIdentifier:v13];

        v15 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v14 target:self set:0 get:0 detail:0 cell:3 edit:0];
        [v15 setProperty:v12 forKey:v10];
        [v15 setButtonAction:sel_addLanguage_];
        [v3 addObject:v15];

        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  [v3 sortUsingComparator:&__block_literal_global_3];
  return v3;
}

uint64_t __56__KSAddMultilingualLanguageListController_newSpecifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 name];
  v6 = [v4 name];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

- (NSArray)multilingualSet
{
  multilingualSet = self->_multilingualSet;
  if (!multilingualSet)
  {
    id v4 = [(KSAddMultilingualLanguageListController *)self parentController];
    v5 = [v4 multilingualSet];
    v6 = self->_multilingualSet;
    self->_multilingualSet = v5;

    multilingualSet = self->_multilingualSet;
  }
  return multilingualSet;
}

- (void)addLanguage:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = [a3 propertyForKey:*MEMORY[0x263F60138]];
  v5 = [(KSAddMultilingualLanguageListController *)self multilingualSet];
  BOOL v6 = TIUICanAddInputModeToMultilingualSet(v4, v5);

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263F1C748] sharedInputModeController];
    uint64_t v8 = [v7 enabledInputModeIdentifiers];

    TIUIGetProposedMultilingualSetsForAddingInputMode(v4, v8);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      uint64_t v12 = v10;
      uint64_t v13 = *(void *)v25;
      v23 = v8;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v9);
          }
          v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v16 = TIUIProposedInputModeGetCurrent(v15, v11);
          v17 = [(KSAddMultilingualLanguageListController *)self multilingualSet];
          int v18 = [v16 isEqualToArray:v17];

          if (v18)
          {
            uint64_t v8 = v23;
            long long v19 = TIUIGetInputModesByAddingProposedInputMode(v15, v23);
            +[KSKeyboardListController setInputModes:v19];
            long long v20 = TIUIProposedInputModeGetMultilingualSet(v15);
            [(KSAddMultilingualLanguageListController *)self setMultilingualSet:v20];

            goto LABEL_12;
          }
        }
        uint64_t v12 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
        uint64_t v8 = v23;
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  [(KSAddMultilingualLanguageListController *)self reloadKeyboardSpecifiers];
  long long v21 = [(KSAddMultilingualLanguageListController *)self navigationController];
  id v22 = (id)[v21 popViewControllerAnimated:1];
}

- (void)reloadKeyboardSpecifiers
{
  id v4 = [(KSAddMultilingualLanguageListController *)self parentController];
  uint64_t v3 = [(KSAddMultilingualLanguageListController *)self multilingualSet];
  [v4 reloadSoftwareLayoutSpecifiersWithMultilingualSet:v3];
}

- (void)setMultilingualSet:(id)a3
{
}

- (void).cxx_destruct
{
}

@end