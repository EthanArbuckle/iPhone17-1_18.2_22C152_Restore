@interface AssistantMultilingualDetailController
+ (id)bundle;
- (id)_languageSpecificLocalizedStringForKey:(id)a3;
- (id)specifiers;
- (void)_addLinkAttributesToHeaderSpecifier;
- (void)_learnMoreTapped;
- (void)_refreshFooterForSpecifier:(id)a3;
- (void)_syncSelectionToPrefs;
- (void)listItemSelected:(id)a3;
- (void)setParentController:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AssistantMultilingualDetailController

+ (id)bundle
{
  v2 = (void *)bundle_sAssistantMultilingualBundle;
  if (!bundle_sAssistantMultilingualBundle)
  {
    uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = (void *)bundle_sAssistantMultilingualBundle;
    bundle_sAssistantMultilingualBundle = v3;

    v2 = (void *)bundle_sAssistantMultilingualBundle;
  }

  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AssistantMultilingualDetailController;
  [(AssistantDetailListController *)&v4 viewWillAppear:a3];
  if (*(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8])) {
    [(AssistantMultilingualDetailController *)self _syncSelectionToPrefs];
  }
}

- (void)setParentController:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_languageController, a3);
  }
  v6.receiver = self;
  v6.super_class = (Class)AssistantMultilingualDetailController;
  [(AssistantMultilingualDetailController *)&v6 setParentController:v5];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = [(AssistantMultilingualDetailController *)self loadSpecifiersFromPlistName:@"AssistantMultilingualDetail" target:self];
    objc_super v6 = [v5 specifierForID:@"MULTILINGUAL_DETAIL_HEADER_GROUP_ID"];
    headerSpecifier = self->_headerSpecifier;
    self->_headerSpecifier = v6;

    [(AssistantMultilingualDetailController *)self _addLinkAttributesToHeaderSpecifier];
    v8 = [v5 specifierForID:@"MULTILINGUAL_DETAIL_GROUP_ID"];
    groupSpecifier = self->super._groupSpecifier;
    self->super._groupSpecifier = v8;

    v10 = [v5 specifierForID:@"MULTILINGUAL_DETAIL_OPTION_ENGLISH_ONLY_ID"];
    preferEnglishOnlySpecifier = self->_preferEnglishOnlySpecifier;
    self->_preferEnglishOnlySpecifier = v10;

    v12 = [v5 specifierForID:@"MULTILINGUAL_DETAIL_OPTION_MIXED_ID"];
    preferMultilingualSpecifier = self->_preferMultilingualSpecifier;
    self->_preferMultilingualSpecifier = v12;

    v14 = self->_preferEnglishOnlySpecifier;
    v15 = [(AssistantMultilingualDetailController *)self _languageSpecificLocalizedStringForKey:@"MULTILINGUAL_DETAIL_OPTION_ENGLISH_ONLY"];
    [(PSSpecifier *)v14 setName:v15];

    v16 = self->_preferEnglishOnlySpecifier;
    v17 = [(AssistantMultilingualDetailController *)self _languageSpecificLocalizedStringForKey:@"MULTILINGUAL_DETAIL_FOOTER_ENGLISH_ONLY"];
    uint64_t v18 = *MEMORY[0x263F600F8];
    [(PSSpecifier *)v16 setProperty:v17 forKey:*MEMORY[0x263F600F8]];

    [(AssistantMultilingualDetailController *)self reloadSpecifier:self->_preferEnglishOnlySpecifier];
    v19 = self->_preferMultilingualSpecifier;
    v20 = [(AssistantMultilingualDetailController *)self _languageSpecificLocalizedStringForKey:@"MULTILINGUAL_DETAIL_OPTION_MIXED"];
    [(PSSpecifier *)v19 setName:v20];

    v21 = self->_preferMultilingualSpecifier;
    v22 = [(AssistantMultilingualDetailController *)self _languageSpecificLocalizedStringForKey:@"MULTILINGUAL_DETAIL_FOOTER_MIXED"];
    [(PSSpecifier *)v21 setProperty:v22 forKey:v18];

    [(AssistantMultilingualDetailController *)self reloadSpecifier:self->_preferMultilingualSpecifier];
    v23 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;
    id v24 = v5;

    [(AssistantDetailListController *)self setChecked:0 forSpecifier:self->_preferMultilingualSpecifier];
    [(AssistantDetailListController *)self setChecked:0 forSpecifier:self->_preferEnglishOnlySpecifier];
    [(AssistantMultilingualDetailController *)self _syncSelectionToPrefs];
    v25 = [(AssistantMultilingualDetailController *)self specifier];
    v26 = [v25 name];
    [(AssistantMultilingualDetailController *)self setTitle:v26];

    v27 = [(AssistantMultilingualDetailController *)self specifier];
    v28 = [v27 values];
    v29 = [v28 firstObject];
    setterValue = self->_setterValue;
    self->_setterValue = v29;

    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (void)listItemSelected:(id)a3
{
  uint64_t v4 = [(AssistantMultilingualDetailController *)self indexForIndexPath:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndex:v4];
    objc_super v6 = self->super._previousSelectedSpecifier;
    if (v6) {
      [(AssistantDetailListController *)self setChecked:0 forSpecifier:v6];
    }
    [(AssistantDetailListController *)self setChecked:1 forSpecifier:v5];
    [(AssistantMultilingualDetailController *)self _refreshFooterForSpecifier:v5];
    previousSelectedSpecifier = self->super._previousSelectedSpecifier;
    self->super._previousSelectedSpecifier = v5;
    v8 = v5;

    [(AssistantLanguageController *)self->_languageController setMultilingualEnabled:v8 == self->_preferMultilingualSpecifier forLanguageCode:self->_setterValue];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(AssistantMultilingualDetailController *)self listItemSelected:v6];
  [v7 deselectRowAtIndexPath:v6 animated:1];
}

- (void)_syncSelectionToPrefs
{
  uint64_t v3 = [(AssistantMultilingualDetailController *)self specifier];
  uint64_t v4 = [v3 values];
  id v10 = [v4 objectAtIndexedSubscript:0];

  BOOL v5 = [(AssistantLanguageController *)self->_languageController multilingualEnabledForLanguageCode:v10];
  id v6 = &OBJC_IVAR___AssistantMultilingualDetailController__preferEnglishOnlySpecifier;
  if (v5) {
    id v6 = &OBJC_IVAR___AssistantMultilingualDetailController__preferMultilingualSpecifier;
  }
  id v7 = (PSSpecifier *)*(id *)((char *)&self->super.super.super.super.super.super.isa + *v6);
  previousSelectedSpecifier = self->super._previousSelectedSpecifier;
  self->super._previousSelectedSpecifier = v7;
  v9 = v7;

  [(AssistantDetailListController *)self setChecked:1 forSpecifier:v9];
  [(AssistantMultilingualDetailController *)self reloadSpecifier:v9];
  [(AssistantMultilingualDetailController *)self _refreshFooterForSpecifier:v9];
}

- (void)_refreshFooterForSpecifier:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F600F8];
  id v5 = [a3 propertyForKey:*MEMORY[0x263F600F8]];
  [(PSSpecifier *)self->super._groupSpecifier setProperty:v5 forKey:v4];
  [(AssistantMultilingualDetailController *)self reloadSpecifier:self->super._groupSpecifier];
}

- (void)_addLinkAttributesToHeaderSpecifier
{
  id v11 = [(AssistantMultilingualDetailController *)self _languageSpecificLocalizedStringForKey:@"MULTILINGUAL_DETAIL_HEADER"];
  uint64_t v3 = [(AssistantMultilingualDetailController *)self _languageSpecificLocalizedStringForKey:@"MULTILINGUAL_DETAIL_HEADER_LINK_TEXT"];
  headerSpecifier = self->_headerSpecifier;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [(PSSpecifier *)headerSpecifier setProperty:v6 forKey:*MEMORY[0x263F600C0]];

  [(PSSpecifier *)self->_headerSpecifier setProperty:v11 forKey:*MEMORY[0x263F600F8]];
  id v7 = self->_headerSpecifier;
  v13.location = [v11 rangeOfString:v3];
  v8 = NSStringFromRange(v13);
  [(PSSpecifier *)v7 setProperty:v8 forKey:*MEMORY[0x263F600D0]];

  v9 = self->_headerSpecifier;
  id v10 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
  [(PSSpecifier *)v9 setProperty:v10 forKey:*MEMORY[0x263F600E0]];

  [(PSSpecifier *)self->_headerSpecifier setProperty:@"_learnMoreTapped" forKey:*MEMORY[0x263F600C8]];
  [(AssistantMultilingualDetailController *)self reloadSpecifier:self->_headerSpecifier];
}

- (void)_learnMoreTapped
{
  v2 = [(AssistantMultilingualDetailController *)self _languageSpecificLocalizedStringForKey:@"MULTILINGUAL_DETAIL_HEADER_LINK_URL"];
  if (v2)
  {
    uint64_t v3 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__AssistantMultilingualDetailController__learnMoreTapped__block_invoke;
    block[3] = &unk_26457CF88;
    id v5 = v2;
    dispatch_async(v3, block);
  }
}

void __57__AssistantMultilingualDetailController__learnMoreTapped__block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x263F01880] defaultWorkspace];
  v2 = [NSURL URLWithString:*(void *)(a1 + 32)];
  [v3 openSensitiveURL:v2 withOptions:0];
}

- (id)_languageSpecificLocalizedStringForKey:(id)a3
{
  id v4 = a3;
  id v5 = NSString;
  id v6 = [(AssistantMultilingualDetailController *)self specifier];
  id v7 = [v6 values];
  v8 = [v7 firstObject];
  v9 = [v5 stringWithFormat:@"%@_%@", v4, v8, 0];

  id v10 = +[AssistantMultilingualDetailController bundle];
  id v11 = [v10 localizedStringForKey:v9 value:&stru_26D2AB140 table:@"AssistantMultilingualDetail"];

  if ([v11 isEqualToString:v9])
  {
    v12 = +[AssistantMultilingualDetailController bundle];
    uint64_t v13 = [v12 localizedStringForKey:v4 value:&stru_26D2AB140 table:@"AssistantMultilingualDetail"];

    id v11 = (void *)v13;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageController, 0);
  objc_storeStrong((id *)&self->_setterValue, 0);
  objc_storeStrong((id *)&self->_headerSpecifier, 0);
  objc_storeStrong((id *)&self->_preferMultilingualSpecifier, 0);

  objc_storeStrong((id *)&self->_preferEnglishOnlySpecifier, 0);
}

@end