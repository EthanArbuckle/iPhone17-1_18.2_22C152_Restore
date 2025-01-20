@interface AXCLFCommunicationLimitController
- (BOOL)_isAllowedFavoritesEntry:(id)a3;
- (BOOL)shouldAvoidReloadForNextFavoritesUpdate;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (CLFBaseCommunicationLimitSettings)settings;
- (CNUIFavoritesEntryPicker)favoritesEntryPicker;
- (NSArray)actionTypes;
- (NSArray)bundleIdentifiers;
- (NSArray)communicationLimitSpecifiers;
- (NSString)contactPickerPrompt;
- (NSString)favoritesFooterText;
- (NSString)incomingHeaderText;
- (NSString)outgoingHeaderText;
- (TPFavoritesController)favoritesController;
- (_SingleCommunicationLimitSpecifiers)incomingSpecifiers;
- (_SingleCommunicationLimitSpecifiers)outgoingSpecifiers;
- (id)_favoritesEntryPickerContactForContact:(id)a3 contactStore:(id)a4;
- (id)_favoritesSpecifiers;
- (id)_singleCommunicationLimitSpecifiersForSpecifier:(id)a3;
- (id)_specifierForFavoritesEntry:(id)a3;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableViewStyle;
- (void)_addFavorite:(id)a3;
- (void)_favoritesDidChange:(id)a3;
- (void)_updateEditButton;
- (void)_updateForOutgoingCommunicationLimit;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)favoritesEntryPicker:(id)a3 didPickEntry:(id)a4;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setFavoritesController:(id)a3;
- (void)setFavoritesEntryPicker:(id)a3;
- (void)setIncomingSpecifiers:(id)a3;
- (void)setOutgoingSpecifiers:(id)a3;
- (void)setShouldAvoidReloadForNextFavoritesUpdate:(BOOL)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation AXCLFCommunicationLimitController

- (NSArray)communicationLimitSpecifiers
{
  v4 = [MEMORY[0x1E4F1CA48] array];
  v5 = [_SingleCommunicationLimitSpecifiers alloc];
  v6 = [(AXCLFCommunicationLimitController *)self incomingHeaderText];
  v7 = [(AXCLFCommunicationLimitController *)self settings];
  v8 = [v7 incomingCommunicationLimit];
  v9 = (void *)*MEMORY[0x1E4F59030];
  v10 = [(_SingleCommunicationLimitSpecifiers *)v5 initWithHeaderText:v6 communicationLimit:v8 maximumCommunicationLimit:*MEMORY[0x1E4F59030]];
  [(AXCLFCommunicationLimitController *)self setIncomingSpecifiers:v10];

  v11 = [(AXCLFCommunicationLimitController *)self incomingSpecifiers];
  v12 = [v11 allSpecifiers];
  [v4 addObjectsFromArray:v12];

  v13 = [_SingleCommunicationLimitSpecifiers alloc];
  v14 = [(AXCLFCommunicationLimitController *)self outgoingHeaderText];
  v15 = [(AXCLFCommunicationLimitController *)self settings];
  v16 = [v15 outgoingCommunicationLimit];
  v17 = [(AXCLFCommunicationLimitController *)self settings];
  int v18 = [v17 requiresMoreRestrictiveOutgoingCommunicationLimit];
  if (v18)
  {
    v2 = [(AXCLFCommunicationLimitController *)self settings];
    v9 = [v2 incomingCommunicationLimit];
  }
  v19 = [(_SingleCommunicationLimitSpecifiers *)v13 initWithHeaderText:v14 communicationLimit:v16 maximumCommunicationLimit:v9];
  [(AXCLFCommunicationLimitController *)self setOutgoingSpecifiers:v19];

  if (v18)
  {
  }
  v20 = [(AXCLFCommunicationLimitController *)self outgoingSpecifiers];
  v21 = [v20 allSpecifiers];
  [v4 addObjectsFromArray:v21];

  v22 = (void *)MEMORY[0x1E4F92E70];
  v23 = AXUILocalizedStringForKey(@"FAVORITES");
  v24 = [v22 groupSpecifierWithName:v23];

  v25 = [(AXCLFCommunicationLimitController *)self favoritesFooterText];
  [v24 setProperty:v25 forKey:*MEMORY[0x1E4F93170]];

  [v4 addObject:v24];
  v26 = [(AXCLFCommunicationLimitController *)self _favoritesSpecifiers];
  [v4 addObjectsFromArray:v26];

  return (NSArray *)v4;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AXCLFCommunicationLimitController;
  [(AXCLFCommunicationLimitController *)&v3 viewDidLoad];
  [(AXCLFCommunicationLimitController *)self _updateEditButton];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AXCLFCommunicationLimitController;
  -[AXCLFCommunicationLimitController setEditing:animated:](&v7, sel_setEditing_animated_);
  [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F10]) setEditing:v5 animated:v4];
}

- (int64_t)tableViewStyle
{
  return 2;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)AXCLFCommunicationLimitController;
  id v6 = a4;
  [(AXCLFCommunicationLimitController *)&v18 tableView:a3 didSelectRowAtIndexPath:v6];
  objc_super v7 = -[AXCLFCommunicationLimitController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v18.receiver, v18.super_class);

  v8 = [(AXCLFCommunicationLimitController *)self _singleCommunicationLimitSpecifiersForSpecifier:v7];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 groupSpecifier];
    v11 = [v10 propertyForKey:*MEMORY[0x1E4F931D8]];

    if (v11 != v7)
    {
      v12 = [MEMORY[0x1E4F59050] commonLog];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[AXCLFCommunicationLimitController tableView:didSelectRowAtIndexPath:]();
      }
    }
    v13 = [v9 communicationLimitForSpecifier:v11];
    v14 = [(AXCLFCommunicationLimitController *)self incomingSpecifiers];

    if (v9 == v14)
    {
      v17 = [(AXCLFCommunicationLimitController *)self settings];
      [v17 setIncomingCommunicationLimit:v13];

      [(AXCLFCommunicationLimitController *)self _updateForOutgoingCommunicationLimit];
    }
    else
    {
      v15 = [(AXCLFCommunicationLimitController *)self outgoingSpecifiers];

      if (v9 == v15)
      {
        v16 = [(AXCLFCommunicationLimitController *)self settings];
        [v16 setOutgoingCommunicationLimit:v13];
      }
    }
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  BOOL v4 = [(AXCLFCommunicationLimitController *)self specifierAtIndexPath:a4];
  BOOL v5 = [v4 propertyForKey:@"favoritesEntry"];
  BOOL v6 = v5 != 0;

  return v6;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  BOOL v4 = [(AXCLFCommunicationLimitController *)self specifierAtIndexPath:a4];
  BOOL v5 = [v4 propertyForKey:@"favoritesEntry"];
  int64_t v6 = v5 != 0;

  return v6;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    int64_t v6 = [(AXCLFCommunicationLimitController *)self specifierAtIndexPath:a5];
    objc_super v7 = [v6 propertyForKey:@"favoritesEntry"];
    if (v7)
    {
      v8 = [(AXCLFCommunicationLimitController *)self favoritesController];
      v9 = [v8 favoritesEntries];
      uint64_t v10 = [v9 indexOfObject:v7];

      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        [(AXCLFCommunicationLimitController *)self setShouldAvoidReloadForNextFavoritesUpdate:1];
        v12 = [(AXCLFCommunicationLimitController *)self favoritesController];
        v13 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v10];
        [v12 removeEntriesAtIndexes:v13];

        [(AXCLFCommunicationLimitController *)self removeSpecifier:v6 animated:1];
        goto LABEL_10;
      }
      v11 = CLFLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[AXCLFCommunicationLimitController tableView:commitEditingStyle:forRowAtIndexPath:]();
      }
    }
    else
    {
      v11 = CLFLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[AXCLFCommunicationLimitController tableView:commitEditingStyle:forRowAtIndexPath:]();
      }
    }

LABEL_10:
  }
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  BOOL v4 = [(AXCLFCommunicationLimitController *)self specifierAtIndexPath:a4];
  BOOL v5 = [v4 propertyForKey:@"favoritesEntry"];
  BOOL v6 = v5 != 0;

  return v6;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [(AXCLFCommunicationLimitController *)self specifierAtIndexPath:v8];
  uint64_t v10 = [v9 propertyForKey:@"favoritesEntry"];

  if (v10) {
    v11 = v8;
  }
  else {
    v11 = v7;
  }
  id v12 = v11;

  return v12;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  if (a4 && a5)
  {
    id v7 = a5;
    id v8 = [(AXCLFCommunicationLimitController *)self specifierAtIndexPath:a4];
    v9 = [v8 propertyForKey:@"favoritesEntry"];
    uint64_t v10 = [(AXCLFCommunicationLimitController *)self specifierAtIndexPath:v7];

    uint64_t v11 = [v10 propertyForKey:@"favoritesEntry"];
    id v12 = (void *)v11;
    if (v9) {
      BOOL v13 = v11 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13)
    {
      v14 = CLFLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[AXCLFCommunicationLimitController tableView:moveRowAtIndexPath:toIndexPath:]();
      }
    }
    else
    {
      v15 = [(AXCLFCommunicationLimitController *)self favoritesController];
      v16 = [v15 favoritesEntries];
      uint64_t v17 = [v16 indexOfObject:v9];

      objc_super v18 = [(AXCLFCommunicationLimitController *)self favoritesController];
      v19 = [v18 favoritesEntries];
      uint64_t v20 = [v19 indexOfObject:v12];

      if (v17 == 0x7FFFFFFFFFFFFFFFLL || v20 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v14 = CLFLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[AXCLFCommunicationLimitController tableView:moveRowAtIndexPath:toIndexPath:]();
        }
      }
      else
      {
        [(AXCLFCommunicationLimitController *)self setShouldAvoidReloadForNextFavoritesUpdate:1];
        v14 = [(AXCLFCommunicationLimitController *)self favoritesController];
        [v14 moveEntryAtIndex:v17 toIndex:v20];
      }
    }
  }
}

- (void)contactPickerDidCancel:(id)a3
{
  id v4 = a3;
  id v5 = [(AXCLFCommunicationLimitController *)self presentedViewController];

  if (v5 == v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__AXCLFCommunicationLimitController_contactPickerDidCancel___block_invoke;
    v6[3] = &unk_1E649BED8;
    v6[4] = self;
    [(AXCLFCommunicationLimitController *)self dismissViewControllerAnimated:1 completion:v6];
  }
  else
  {
    [(AXCLFCommunicationLimitController *)self setFavoritesEntryPicker:0];
  }
}

uint64_t __60__AXCLFCommunicationLimitController_contactPickerDidCancel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFavoritesEntryPicker:0];
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  [v14 invalidateSelectionAnimated:1];
  id v7 = [(AXCLFCommunicationLimitController *)self favoritesController];
  id v8 = [v7 contactStore];
  v9 = [(AXCLFCommunicationLimitController *)self _favoritesEntryPickerContactForContact:v6 contactStore:v8];

  if (v9)
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1BC08]) initWithContact:v6];
    [(AXCLFCommunicationLimitController *)self setFavoritesEntryPicker:v10];

    uint64_t v11 = [(AXCLFCommunicationLimitController *)self favoritesEntryPicker];
    [v11 setDelegate:self];

    id v12 = [(AXCLFCommunicationLimitController *)self favoritesEntryPicker];
    BOOL v13 = [v12 viewController];
    [v14 presentViewController:v13 animated:1 completion:0];
  }
}

- (void)favoritesEntryPicker:(id)a3 didPickEntry:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(AXCLFCommunicationLimitController *)self favoritesController];
  id v7 = [v6 favoritesEntries];
  char v8 = [v7 containsObject:v5];

  if (v8)
  {
    v9 = CLFLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AXCLFCommunicationLimitController favoritesEntryPicker:didPickEntry:]();
    }
  }
  else if ([(AXCLFCommunicationLimitController *)self _isAllowedFavoritesEntry:v5])
  {
    uint64_t v10 = [(AXCLFCommunicationLimitController *)self favoritesController];
    int v11 = [v10 canAddEntry];

    if (v11)
    {
      v9 = [(AXCLFCommunicationLimitController *)self favoritesController];
      [v9 addEntry:v5];
    }
    else
    {
      v9 = CLFLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[AXCLFCommunicationLimitController favoritesEntryPicker:didPickEntry:]();
      }
    }
  }
  else
  {
    v9 = CLFLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v5;
      _os_log_impl(&dword_1C39D1000, v9, OS_LOG_TYPE_DEFAULT, "Not adding favorites entry as it is for an unrelated app: %@", buf, 0xCu);
    }
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__AXCLFCommunicationLimitController_favoritesEntryPicker_didPickEntry___block_invoke;
  v12[3] = &unk_1E649BED8;
  v12[4] = self;
  [(AXCLFCommunicationLimitController *)self dismissViewControllerAnimated:1 completion:v12];
}

uint64_t __71__AXCLFCommunicationLimitController_favoritesEntryPicker_didPickEntry___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFavoritesEntryPicker:0];
}

- (void)_updateForOutgoingCommunicationLimit
{
  objc_super v3 = [(AXCLFCommunicationLimitController *)self outgoingSpecifiers];
  id v4 = [(AXCLFCommunicationLimitController *)self settings];
  id v5 = [v4 outgoingCommunicationLimit];
  id v6 = [(AXCLFCommunicationLimitController *)self settings];
  if ([v6 requiresMoreRestrictiveOutgoingCommunicationLimit])
  {
    id v7 = [(AXCLFCommunicationLimitController *)self settings];
    char v8 = [v7 incomingCommunicationLimit];
    [v3 updateForCommunicationLimit:v5 maximumCommunicationLimit:v8];
  }
  else
  {
    [v3 updateForCommunicationLimit:v5 maximumCommunicationLimit:*MEMORY[0x1E4F59030]];
  }

  v9 = [(AXCLFCommunicationLimitController *)self settings];
  int v10 = [v9 requiresMoreRestrictiveOutgoingCommunicationLimit];

  if (v10)
  {
    id v12 = [(AXCLFCommunicationLimitController *)self outgoingSpecifiers];
    int v11 = [v12 groupSpecifier];
    [(AXCLFCommunicationLimitController *)self reloadSpecifier:v11 animated:1];
  }
}

- (id)_singleCommunicationLimitSpecifiersForSpecifier:(id)a3
{
  id v4 = [(AXCLFCommunicationLimitController *)self getGroupSpecifierForSpecifier:a3];
  id v5 = [(AXCLFCommunicationLimitController *)self incomingSpecifiers];
  id v6 = [v5 groupSpecifier];

  if (v4 == v6)
  {
    uint64_t v10 = [(AXCLFCommunicationLimitController *)self incomingSpecifiers];
  }
  else
  {
    id v7 = [(AXCLFCommunicationLimitController *)self outgoingSpecifiers];
    char v8 = [v7 groupSpecifier];

    if (v4 != v8)
    {
      v9 = 0;
      goto LABEL_7;
    }
    uint64_t v10 = [(AXCLFCommunicationLimitController *)self outgoingSpecifiers];
  }
  v9 = (void *)v10;
LABEL_7:

  return v9;
}

- (id)_specifierForFavoritesEntry:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F92E70];
  id v5 = a3;
  id v6 = [v5 name];
  id v7 = [v4 preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:4 edit:0];

  [v7 setProperty:objc_opt_class() forKey:*MEMORY[0x1E4F930A8]];
  [v7 setProperty:v5 forKey:@"favoritesEntry"];

  char v8 = [(AXCLFCommunicationLimitController *)self favoritesController];
  [v7 setProperty:v8 forKey:@"favoritesController"];

  return v7;
}

- (id)_favoritesSpecifiers
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(AXCLFCommunicationLimitController *)self favoritesController];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FADA20]);
    id v5 = objc_opt_new();
    id v6 = (void *)[v4 initWithContactStore:v5 prefetchCount:0];
    [(AXCLFCommunicationLimitController *)self setFavoritesController:v6];

    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v8 = *MEMORY[0x1E4FADA60];
    v9 = [(AXCLFCommunicationLimitController *)self favoritesController];
    [v7 addObserver:self selector:sel__favoritesDidChange_ name:v8 object:v9];
  }
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  int v11 = [(AXCLFCommunicationLimitController *)self favoritesController];
  id v12 = [v11 favoritesEntries];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        if ([(AXCLFCommunicationLimitController *)self _isAllowedFavoritesEntry:v17])
        {
          objc_super v18 = [(AXCLFCommunicationLimitController *)self _specifierForFavoritesEntry:v17];
          [v10 addObject:v18];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }

  v19 = (void *)MEMORY[0x1E4F92E70];
  uint64_t v20 = AXUILocalizedStringForKey(@"ADD_FAVORITE");
  v21 = [v19 preferenceSpecifierNamed:v20 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v21 setButtonAction:sel__addFavorite_];
  [v10 addObject:v21];

  return v10;
}

- (BOOL)_isAllowedFavoritesEntry:(id)a3
{
  id v4 = a3;
  id v5 = [(AXCLFCommunicationLimitController *)self bundleIdentifiers];
  id v6 = [v4 bundleIdentifier];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

- (void)_addFavorite:(id)a3
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F1BB88]);
  [v6 setAllowsEditing:0];
  [v6 setAutocloses:0];
  [v6 setDelegate:self];
  [v6 setHidesSearchableSources:1];
  [v6 setMode:2];
  [v6 setOnlyRealContacts:1];
  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"emailAddresses.@count > 0 OR phoneNumbers.@count > 0"];
  [v6 setPredicateForEnablingContact:v4];

  id v5 = [(AXCLFCommunicationLimitController *)self contactPickerPrompt];
  [v6 setPrompt:v5];

  [(AXCLFCommunicationLimitController *)self presentViewController:v6 animated:1 completion:0];
}

- (id)_favoritesEntryPickerContactForContact:(id)a3 contactStore:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1BC08] descriptorForRequiredKeys];
  v23[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];

  if ([v5 areKeysAvailable:v8])
  {
    id v9 = v5;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA48] arrayWithArray:v8];
    int v11 = [v5 availableKeyDescriptor];
    if (v11) {
      [v10 addObject:v11];
    }
    id v12 = [v5 identifier];
    id v16 = 0;
    id v9 = [v6 unifiedContactWithIdentifier:v12 keysToFetch:v10 error:&v16];
    id v13 = v16;

    if (!v9)
    {
      uint64_t v14 = CLFLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v18 = v5;
        __int16 v19 = 2112;
        id v20 = v6;
        __int16 v21 = 2112;
        id v22 = v13;
        _os_log_error_impl(&dword_1C39D1000, v14, OS_LOG_TYPE_ERROR, "Could not retrieve a compatible contact using contact (%@) and contact store (%@) due to an error (%@).", buf, 0x20u);
      }
    }
  }

  return v9;
}

- (void)_favoritesDidChange:(id)a3
{
  if ([(AXCLFCommunicationLimitController *)self shouldAvoidReloadForNextFavoritesUpdate])
  {
    [(AXCLFCommunicationLimitController *)self setShouldAvoidReloadForNextFavoritesUpdate:0];
  }
  else
  {
    [(AXCLFCommunicationLimitController *)self reloadSpecifiers];
  }
  [(AXCLFCommunicationLimitController *)self _updateEditButton];
}

- (void)_updateEditButton
{
  objc_super v3 = [(AXCLFCommunicationLimitController *)self favoritesController];
  id v4 = [v3 favoritesEntries];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v8 = [(AXCLFCommunicationLimitController *)self editButtonItem];
    id v6 = [(AXCLFCommunicationLimitController *)self navigationItem];
    [v6 setRightBarButtonItem:v8];
  }
  else
  {
    id v7 = [(AXCLFCommunicationLimitController *)self navigationItem];
    [v7 setRightBarButtonItem:0];

    [(AXCLFCommunicationLimitController *)self setEditing:0 animated:1];
  }
}

- (_SingleCommunicationLimitSpecifiers)incomingSpecifiers
{
  return self->_incomingSpecifiers;
}

- (void)setIncomingSpecifiers:(id)a3
{
}

- (_SingleCommunicationLimitSpecifiers)outgoingSpecifiers
{
  return self->_outgoingSpecifiers;
}

- (void)setOutgoingSpecifiers:(id)a3
{
}

- (TPFavoritesController)favoritesController
{
  return self->_favoritesController;
}

- (void)setFavoritesController:(id)a3
{
}

- (CNUIFavoritesEntryPicker)favoritesEntryPicker
{
  return self->_favoritesEntryPicker;
}

- (void)setFavoritesEntryPicker:(id)a3
{
}

- (BOOL)shouldAvoidReloadForNextFavoritesUpdate
{
  return self->_shouldAvoidReloadForNextFavoritesUpdate;
}

- (void)setShouldAvoidReloadForNextFavoritesUpdate:(BOOL)a3
{
  self->_shouldAvoidReloadForNextFavoritesUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favoritesEntryPicker, 0);
  objc_storeStrong((id *)&self->_favoritesController, 0);
  objc_storeStrong((id *)&self->_outgoingSpecifiers, 0);
  objc_storeStrong((id *)&self->_incomingSpecifiers, 0);
}

- (NSString)outgoingHeaderText
{
  return (NSString *)&stru_1F1F0EB90;
}

- (NSString)incomingHeaderText
{
  return (NSString *)&stru_1F1F0EB90;
}

- (NSString)favoritesFooterText
{
  return (NSString *)&stru_1F1F0EB90;
}

- (NSString)contactPickerPrompt
{
  return (NSString *)&stru_1F1F0EB90;
}

- (NSArray)actionTypes
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSArray)bundleIdentifiers
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (CLFBaseCommunicationLimitSettings)settings
{
  OUTLINED_FUNCTION_1();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  v2 = (void *)MEMORY[0x1E4F59068];
  return (CLFBaseCommunicationLimitSettings *)[v2 sharedInstance];
}

- (void)tableView:didSelectRowAtIndexPath:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4_0();
  _os_log_fault_impl(&dword_1C39D1000, v0, OS_LOG_TYPE_FAULT, "Radio group checked specifier was unexpectedly out of sync with the selected specifier. Checked: %@, selected: %@", v1, 0x16u);
}

- (void)tableView:commitEditingStyle:forRowAtIndexPath:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1C39D1000, v0, v1, "Unexpectedly tried to delete a specifier with no Favorites entry associated: %@", v2, v3, v4, v5, v6);
}

- (void)tableView:commitEditingStyle:forRowAtIndexPath:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1C39D1000, v0, v1, "Unable to find Favorites entry in list: %@", v2, v3, v4, v5, v6);
}

- (void)tableView:moveRowAtIndexPath:toIndexPath:.cold.1()
{
  OUTLINED_FUNCTION_8();
  WORD2(v3) = 2048;
  HIWORD(v3) = v0;
  OUTLINED_FUNCTION_5_0(&dword_1C39D1000, v0, v1, "Unable to find source or destination favorites in the list. Source index: %lu, destination index: %lu", v2, v3);
}

- (void)tableView:moveRowAtIndexPath:toIndexPath:.cold.2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0(&dword_1C39D1000, v0, v1, "Missing source or destination favorites entry. Source specifier: %@, destination specifier: %@");
}

- (void)favoritesEntryPicker:didPickEntry:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1C39D1000, v0, v1, "Not adding favorites entry as it exists already: %@", v2, v3, v4, v5, v6);
}

- (void)favoritesEntryPicker:didPickEntry:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1C39D1000, v0, v1, "Not adding favorites entry, as adding was not allowed: %@", v2, v3, v4, v5, v6);
}

@end