@interface LiveSpeechFavoritePhrasesController
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (LiveSpeechFavoritePhrasesController)init;
- (NSArray)phrases;
- (id)_valueForPhraseSpecifier:(id)a3;
- (id)favoritePhraseObserverToken;
- (id)specifiers;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_addButtonTapped:(id)a3;
- (void)_deletePhraseWithText:(id)a3;
- (void)_handleDoneButtonTapped:(id)a3;
- (void)_handleEditButtonTapped:(id)a3;
- (void)_loadPhrasesIfNeeded;
- (void)_updateEditButton;
- (void)dealloc;
- (void)reloadSpecifiers;
- (void)setFavoritePhraseObserverToken:(id)a3;
- (void)setPhrases:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation LiveSpeechFavoritePhrasesController

- (LiveSpeechFavoritePhrasesController)init
{
  v5.receiver = self;
  v5.super_class = (Class)LiveSpeechFavoritePhrasesController;
  v2 = [(AXUISettingsSetupCapableListController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(LiveSpeechFavoritePhrasesController *)v2 setEdgeToEdgeCells:1];
  }
  return v3;
}

- (void)dealloc
{
  [(LiveSpeechFavoritePhrasesController *)self setFavoritePhraseObserverToken:0];
  v3.receiver = self;
  v3.super_class = (Class)LiveSpeechFavoritePhrasesController;
  [(AXUISettingsSetupCapableListController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)LiveSpeechFavoritePhrasesController;
  [(AXUISettingsSetupCapableListController *)&v13 viewDidLoad];
  [(LiveSpeechFavoritePhrasesController *)self _updateEditButton];
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:4 target:self action:sel__addButtonTapped_];
  v4 = [(LiveSpeechFavoritePhrasesController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];

  objc_initWeak(&location, self);
  objc_super v5 = (void *)MEMORY[0x263F522E0];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = __50__LiveSpeechFavoritePhrasesController_viewDidLoad__block_invoke;
  v10 = &unk_2651F2418;
  objc_copyWeak(&v11, &location);
  v6 = [v5 observeFavoritePhrasesChanges:&v7];
  -[LiveSpeechFavoritePhrasesController setFavoritePhraseObserverToken:](self, "setFavoritePhraseObserverToken:", v6, v7, v8, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __50__LiveSpeechFavoritePhrasesController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setPhrases:0];
  [WeakRetained reloadSpecifiers];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LiveSpeechFavoritePhrasesController;
  [(LiveSpeechFavoritePhrasesController *)&v5 viewWillAppear:a3];
  [(LiveSpeechFavoritePhrasesController *)self _loadPhrasesIfNeeded];
  v4 = [(LiveSpeechFavoritePhrasesController *)self navigationController];
  [v4 setToolbarHidden:0 animated:1];

  [(LiveSpeechFavoritePhrasesController *)self _updateEditButton];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LiveSpeechFavoritePhrasesController;
  [(LiveSpeechFavoritePhrasesController *)&v5 viewWillDisappear:a3];
  v4 = [(LiveSpeechFavoritePhrasesController *)self navigationController];
  [v4 setToolbarHidden:1 animated:1];

  [(LiveSpeechFavoritePhrasesController *)self setToolbarItems:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)LiveSpeechFavoritePhrasesController;
  [(LiveSpeechFavoritePhrasesController *)&v4 viewDidDisappear:a3];
  [(AXUISettingsBaseListController *)self setEditing:0 animated:0];
  [(LiveSpeechFavoritePhrasesController *)self _updateEditButton];
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v15 = a3;
  id v8 = a5;
  if (a4 == 1)
  {
    v9 = [(LiveSpeechFavoritePhrasesController *)self specifierAtIndexPath:v8];
    v10 = [v9 propertyForKey:@"FavoritePhrase"];
    id v11 = [MEMORY[0x263F522E0] phraseTextKey];
    v12 = [v10 objectForKeyedSubscript:v11];

    [(LiveSpeechFavoritePhrasesController *)self _deletePhraseWithText:v12];
    [(LiveSpeechFavoritePhrasesController *)self removeSpecifier:v9 animated:1];
  }
  objc_super v13 = [(LiveSpeechFavoritePhrasesController *)self phrases];
  uint64_t v14 = [v13 count];

  if (!v14) {
    [(LiveSpeechFavoritePhrasesController *)self _handleDoneButtonTapped:0];
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 1;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 1;
}

- (id)specifiers
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v16 = (int)*MEMORY[0x263F5FDB8];
    [(LiveSpeechFavoritePhrasesController *)self _loadPhrasesIfNeeded];
    objc_super v4 = [MEMORY[0x263EFF980] array];
    objc_super v5 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"FavoritesGroup"];
    [v4 addObject:v5];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id obj = [(LiveSpeechFavoritePhrasesController *)self phrases];
    uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        uint64_t v9 = 0;
        v10 = v5;
        do
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
          v12 = [MEMORY[0x263F522E0] phraseTextKey];
          objc_super v13 = [v11 objectForKeyedSubscript:v12];

          objc_super v5 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v13 target:self set:0 get:sel__valueForPhraseSpecifier_ detail:0 cell:3 edit:0];

          [v5 setProperty:v11 forKey:@"FavoritePhrase"];
          [v4 addObject:v5];

          ++v9;
          v10 = v5;
        }
        while (v7 != v9);
        uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }

    uint64_t v14 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v16);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v16) = (Class)v4;

    objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v16);
  }

  return v3;
}

- (void)reloadSpecifiers
{
  v3.receiver = self;
  v3.super_class = (Class)LiveSpeechFavoritePhrasesController;
  [(LiveSpeechFavoritePhrasesController *)&v3 reloadSpecifiers];
  [(LiveSpeechFavoritePhrasesController *)self _updateEditButton];
}

- (void)_updateEditButton
{
  v10[1] = *MEMORY[0x263EF8340];
  if ([(LiveSpeechFavoritePhrasesController *)self isEditing])
  {
    objc_super v3 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel__handleDoneButtonTapped_];
    v10[0] = v3;
    objc_super v4 = (void *)MEMORY[0x263EFF8C0];
    objc_super v5 = (void **)v10;
LABEL_5:
    uint64_t v8 = [v4 arrayWithObjects:v5 count:1];
    [(LiveSpeechFavoritePhrasesController *)self setToolbarItems:v8];

    return;
  }
  uint64_t v6 = [(LiveSpeechFavoritePhrasesController *)self phrases];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    objc_super v3 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:2 target:self action:sel__handleEditButtonTapped_];
    uint64_t v9 = v3;
    objc_super v4 = (void *)MEMORY[0x263EFF8C0];
    objc_super v5 = &v9;
    goto LABEL_5;
  }

  [(LiveSpeechFavoritePhrasesController *)self setToolbarItems:0];
}

- (id)_valueForPhraseSpecifier:(id)a3
{
  objc_super v3 = [a3 propertyForKey:@"FavoritePhrase"];
  objc_super v4 = [MEMORY[0x263F522E0] phraseShortcutKey];
  objc_super v5 = [v3 objectForKeyedSubscript:v4];

  return v5;
}

- (void)_loadPhrasesIfNeeded
{
  objc_super v3 = [(LiveSpeechFavoritePhrasesController *)self phrases];

  if (!v3)
  {
    id v4 = [MEMORY[0x263F522E0] favoritePhrases];
    [(LiveSpeechFavoritePhrasesController *)self setPhrases:v4];
  }
}

- (void)_deletePhraseWithText:(id)a3
{
}

- (void)_addButtonTapped:(id)a3
{
  id v4 = objc_alloc_init(LiveSpeechAddFavoritePhraseController);
  [(LiveSpeechFavoritePhrasesController *)self showController:v4];
}

- (void)_handleDoneButtonTapped:(id)a3
{
  [(AXUISettingsBaseListController *)self setEditing:0 animated:1];

  [(LiveSpeechFavoritePhrasesController *)self _updateEditButton];
}

- (void)_handleEditButtonTapped:(id)a3
{
  [(AXUISettingsBaseListController *)self setEditing:1 animated:1];

  [(LiveSpeechFavoritePhrasesController *)self _updateEditButton];
}

- (NSArray)phrases
{
  return self->_phrases;
}

- (void)setPhrases:(id)a3
{
}

- (id)favoritePhraseObserverToken
{
  return self->_favoritePhraseObserverToken;
}

- (void)setFavoritePhraseObserverToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_favoritePhraseObserverToken, 0);

  objc_storeStrong((id *)&self->_phrases, 0);
}

@end