@interface ASTLockScreenSuggestionsDetailListController
- (ASTLockScreenSuggestionsDetailListController)init;
- (id)specifiers;
- (void)_handleGlobalToggleChangeWithEnabled:(BOOL)a3;
@end

@implementation ASTLockScreenSuggestionsDetailListController

- (ASTLockScreenSuggestionsDetailListController)init
{
  v23.receiver = self;
  v23.super_class = (Class)ASTLockScreenSuggestionsDetailListController;
  v2 = [(ASTLockScreenSuggestionsDetailListController *)&v23 init];
  if (v2)
  {
    v3 = +[AssistantController bundle];
    v4 = [v3 localizedStringForKey:@"ASSISTANT_SUGGESTIONS" value:&stru_26D2AB140 table:@"AssistantSettings"];
    [(ASTLockScreenSuggestionsDetailListController *)v2 setTitle:v4];

    objc_initWeak(&location, v2);
    v5 = [ASTLockScreenSuggestionsGlobalController alloc];
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    v19 = __52__ASTLockScreenSuggestionsDetailListController_init__block_invoke;
    v20 = &unk_26457D490;
    objc_copyWeak(&v21, &location);
    uint64_t v6 = [(ASTLockScreenSuggestionsGlobalController *)v5 initWithOnChangeCallback:&v17];
    globalController = v2->_globalController;
    v2->_globalController = (ASTLockScreenSuggestionsGlobalController *)v6;

    uint64_t v8 = [(ASTLockScreenSuggestionsGlobalController *)v2->_globalController specifier];
    globalSpecifier = v2->_globalSpecifier;
    v2->_globalSpecifier = (PSSpecifier *)v8;

    uint64_t v10 = objc_opt_new();
    lockScreenSpecifier = v2->_lockScreenSpecifier;
    v2->_lockScreenSpecifier = (ASTLockScreenSuggestionSpecifier *)v10;

    uint64_t v12 = [MEMORY[0x263F5FC40] groupSpecifierWithName:0];
    perAppGroup = v2->_perAppGroup;
    v2->_perAppGroup = (PSSpecifier *)v12;

    uint64_t v14 = [(ASTLockScreenSuggestionSpecifier *)v2->_lockScreenSpecifier specifiers];
    perAppSpecifiers = v2->_perAppSpecifiers;
    v2->_perAppSpecifiers = (NSArray *)v14;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __52__ASTLockScreenSuggestionsDetailListController_init__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleGlobalToggleChangeWithEnabled:a2];
}

- (id)specifiers
{
  v3 = objc_opt_new();
  v4 = [MEMORY[0x263F5FC40] groupSpecifierWithName:0];
  [v3 addObject:v4];

  [v3 addObject:self->_globalSpecifier];
  v5 = [(ASTLockScreenSuggestionsGlobalController *)self->_globalController isLockScreenSuggestionEnabled:self->_globalSpecifier];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    [v3 addObject:self->_perAppGroup];
    [v3 addObjectsFromArray:self->_perAppSpecifiers];
  }
  uint64_t v7 = (int)*MEMORY[0x263F5FDB8];
  uint64_t v8 = *(Class *)((char *)&self->super.super.super.super.super.isa + v7);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)v3;
  id v9 = v3;

  id v10 = *(id *)((char *)&self->super.super.super.super.super.isa + v7);
  return v10;
}

- (void)_handleGlobalToggleChangeWithEnabled:(BOOL)a3
{
  if (a3)
  {
    [(ASTLockScreenSuggestionsDetailListController *)self insertSpecifier:self->_perAppGroup afterSpecifier:self->_globalSpecifier animated:1];
    perAppSpecifiers = self->_perAppSpecifiers;
    perAppGroup = self->_perAppGroup;
    [(ASTLockScreenSuggestionsDetailListController *)self insertContiguousSpecifiers:perAppSpecifiers afterSpecifier:perAppGroup animated:1];
  }
  else
  {
    [(ASTLockScreenSuggestionsDetailListController *)self removeContiguousSpecifiers:self->_perAppSpecifiers animated:1];
    int v6 = self->_perAppGroup;
    [(ASTLockScreenSuggestionsDetailListController *)self removeSpecifier:v6 animated:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalSpecifier, 0);
  objc_storeStrong((id *)&self->_globalController, 0);
  objc_storeStrong((id *)&self->_perAppSpecifiers, 0);
  objc_storeStrong((id *)&self->_perAppGroup, 0);

  objc_storeStrong((id *)&self->_lockScreenSpecifier, 0);
}

@end