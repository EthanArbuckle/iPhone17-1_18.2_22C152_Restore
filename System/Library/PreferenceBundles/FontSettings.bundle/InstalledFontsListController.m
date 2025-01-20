@interface InstalledFontsListController
+ (BOOL)showInstalledFonts;
- (BOOL)shouldShowNoFontsMessage;
- (InstalledFontsListController)initWithNibName:(id)a3 bundle:(id)a4;
- (NSArray)fontFamilySpecifiers;
- (NSArray)fontFamilySpecifiersForEditing;
- (UISearchBar)searchBar;
- (UISearchController)searchController;
- (id)facesInfoForSpecifier:(id)a3;
- (id)fontFamilySpecifiersFromFamilies:(id)a3 deletableSpecifiers:(id *)a4;
- (id)specifiers;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_fontListChanged:(id)a3;
- (void)_updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)dealloc;
- (void)deleteSelected:(id)a3;
- (void)doCancel;
- (void)doSelectAll;
- (void)filterContentsWithSearchText:(id)a3;
- (void)preserveFontFamilySelections;
- (void)reloadSpecifiers;
- (void)restoreFontFamilySelections;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setFontFamilySpecifiers:(id)a3;
- (void)setFontFamilySpecifiersForEditing:(id)a3;
- (void)setSearchBar:(id)a3;
- (void)setSearchController:(id)a3;
- (void)showNoFontsMessageIfNeeded;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4;
- (void)updateButtons:(BOOL)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation InstalledFontsListController

+ (BOOL)showInstalledFonts
{
  return 1;
}

- (InstalledFontsListController)initWithNibName:(id)a3 bundle:(id)a4
{
  v30.receiver = self;
  v30.super_class = (Class)InstalledFontsListController;
  v4 = [(InstalledFontsListController *)&v30 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"_fontListChanged:" name:@"FontSettingsFontListChanged" object:0];

    v6 = [(InstalledFontsListController *)v4 editButtonItem];
    v7 = [(InstalledFontsListController *)v4 navigationItem];
    [v7 setRightBarButtonItem:v6];

    v8 = [(InstalledFontsListController *)v4 navigationItem];
    v9 = [v8 rightBarButtonItem];
    [v9 setEnabled:0];

    v10 = [(InstalledFontsListController *)v4 navigationItem];
    v11 = [v10 rightBarButtonItem];
    [v11 setAccessibilityIdentifier:@"EDIT_INSTALLED_FONTS"];

    v12 = [(InstalledFontsListController *)v4 navigationItem];
    [v12 setHidesSearchBarWhenScrolling:0];

    id v13 = [objc_alloc((Class)UISearchController) initWithSearchResultsController:0];
    [(InstalledFontsListController *)v4 setSearchController:v13];

    v14 = [(InstalledFontsListController *)v4 searchController];
    v15 = [v14 searchBar];
    [(InstalledFontsListController *)v4 setSearchBar:v15];

    v16 = [(InstalledFontsListController *)v4 searchController];
    [v16 setHidesNavigationBarDuringPresentation:1];

    v17 = [(InstalledFontsListController *)v4 searchController];
    [v17 setObscuresBackgroundDuringPresentation:0];

    v18 = [(InstalledFontsListController *)v4 searchController];
    [v18 setAutomaticallyShowsCancelButton:1];

    v19 = [(InstalledFontsListController *)v4 searchBar];
    [v19 setDelegate:v4];

    v20 = [(InstalledFontsListController *)v4 searchController];
    [v20 setSearchResultsUpdater:v4];

    [(InstalledFontsListController *)v4 setDefinesPresentationContext:1];
    id v21 = objc_alloc((Class)UIBarButtonItem);
    v22 = +[NSBundle bundleForClass:objc_opt_class()];
    v23 = [v22 localizedStringForKey:@"REMOVE_SELECTED" value:&stru_1CDF0 table:@"FontSettings"];
    v24 = (UIBarButtonItem *)[v21 initWithTitle:v23 style:0 target:v4 action:"deleteSelected:"];
    removeButton = v4->removeButton;
    v4->removeButton = v24;

    [(UIBarButtonItem *)v4->removeButton setAccessibilityIdentifier:@"REMOVE_SELECTED_FONTS"];
    [(UIBarButtonItem *)v4->removeButton setEnabled:0];
    v26 = +[UIColor _systemDestructiveTintColor];
    [(UIBarButtonItem *)v4->removeButton setTintColor:v26];

    id v27 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
    v31[0] = v27;
    v31[1] = v4->removeButton;
    v31[2] = v27;
    v28 = +[NSArray arrayWithObjects:v31 count:3];
    [(InstalledFontsListController *)v4 setToolbarItems:v28];
  }
  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(InstalledFontsListController *)self showNoFontsMessageIfNeeded];
  [(InstalledFontsListController *)self setEditing:0 animated:v3];
  v5.receiver = self;
  v5.super_class = (Class)InstalledFontsListController;
  [(InstalledFontsListController *)&v5 viewWillAppear:v3];
}

- (void)dealloc
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)InstalledFontsListController;
  [(InstalledFontsListController *)&v4 dealloc];
}

- (void)_fontListChanged:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_76E4;
  block[3] = &unk_1C8E0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)shouldShowNoFontsMessage
{
  if ([*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] count]) {
    return 0;
  }
  BOOL v3 = objc_opt_class();

  return [v3 showInstalledFonts];
}

- (id)facesInfoForSpecifier:(id)a3
{
  BOOL v3 = [a3 userInfo];
  objc_super v4 = [v3 objectForKey:@"faces"];

  id v5 = [v4 count];
  if ((unint64_t)v5 < 2)
  {
    v7 = 0;
  }
  else
  {
    v6 = +[NSNumber numberWithUnsignedInteger:v5];
    v7 = +[NSNumberFormatter localizedStringFromNumber:v6 numberStyle:0];
  }

  return v7;
}

- (id)fontFamilySpecifiersFromFamilies:(id)a3 deletableSpecifiers:(id *)a4
{
  id v5 = a3;
  v33 = (NSArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:0];
  v31 = (NSArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:0];
  v6 = +[FontFamiliesSearchCell currentSearchStringMatcher];
  v34 = self;
  self->hasUserInstalledFonts = 0;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v36;
    uint64_t v10 = PSCellClassKey;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if (!v6 || [*(id *)(*((void *)&v35 + 1) + 8 * i) matches:v6])
        {
          id v13 = [v12 localizedFamilyName];
          if ([v12 installKind] == (char *)&dword_0 + 3 || objc_msgSend(v12, "installKind") == &dword_4) {
            uint64_t v14 = 3;
          }
          else {
            uint64_t v14 = 2;
          }
          v15 = +[PSSpecifier preferenceSpecifierNamed:v13 target:v34 set:0 get:0 detail:0 cell:v14 edit:0];

          v16 = [v15 userInfo];
          v17 = v16;
          if (v16)
          {
            id v18 = v16;
          }
          else
          {
            id v18 = +[NSMutableDictionary dictionary];
          }
          v19 = v18;

          v20 = [v12 postScriptFontNames];
          [v19 setObject:v20 forKey:@"faces"];
          [v19 setObject:v12 forKey:@"family"];
          [v15 setUserInfo:v19];
          uint64_t v21 = objc_opt_class();
          if (([v12 isDownloadable] & 1) == 0) {
            *(void *)&v15[OBJC_IVAR___PSSpecifier_detailControllerClass] = v21;
          }
          [v15 setProperty:objc_opt_class() forKey:v10];
          [(NSArray *)v33 addObject:v15];
          if ([v12 isDeletable])
          {
            v34->hasUserInstalledFonts = 1;
            v22 = [v15 name];
            v23 = +[PSSpecifier preferenceSpecifierNamed:v22 target:0 set:0 get:0 detail:0 cell:3 edit:0];

            [v23 setUserInfo:v19];
            [v23 setProperty:objc_opt_class() forKey:v10];
            [(NSArray *)v31 addObject:v23];
          }
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v8);
  }

  fontFamilySpecifiers = v34->_fontFamilySpecifiers;
  v34->_fontFamilySpecifiers = v33;
  v25 = v33;

  fontFamilySpecifiersForEditing = v34->_fontFamilySpecifiersForEditing;
  v34->_fontFamilySpecifiersForEditing = v31;
  id v27 = v31;

  *a4 = v34->_fontFamilySpecifiersForEditing;
  v28 = v34->_fontFamilySpecifiers;

  return v28;
}

- (void)showNoFontsMessageIfNeeded
{
  [(InstalledFontsListController *)self _setNeedsUpdateContentUnavailableConfiguration];
  if ([(InstalledFontsListController *)self shouldShowNoFontsMessage])
  {
    BOOL v3 = [(InstalledFontsListController *)self navigationItem];
    [v3 setSearchController:0];

    uint64_t v4 = [(InstalledFontsListController *)self shouldShowNoFontsMessage] ^ 1;
    id v5 = [(InstalledFontsListController *)self navigationItem];
    v6 = [v5 rightBarButtonItem];
    [v6 setEnabled:v4];
  }
  else
  {
    id v5 = [(InstalledFontsListController *)self searchController];
    v6 = [(InstalledFontsListController *)self navigationItem];
    [v6 setSearchController:v5];
  }

  id v7 = [(InstalledFontsListController *)self navigationItem];
  [v7 setPreferredSearchBarPlacement:2];
}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  id v16 = a3;
  if ([(InstalledFontsListController *)self shouldShowNoFontsMessage])
  {
    uint64_t v4 = +[UIContentUnavailableConfiguration emptyProminentConfiguration];
    id v5 = [v4 updatedConfigurationForState:v16];

    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"NO_FONTS_INSTALLED" value:&stru_1CDF0 table:@"FontSettings"];
    [v5 setText:v7];

    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"NO_FONTS_INSTALLED_DETAIL" value:&stru_1CDF0 table:@"FontSettings"];
    [v5 setSecondaryText:v9];

    uint64_t v10 = +[NSBundle bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"NO_FONTS_INSTALLED_APP_STORE_BUTTON" value:&stru_1CDF0 table:@"FontSettings"];
    v12 = [v5 buttonProperties];
    id v13 = [v12 configuration];
    [v13 setTitle:v11];

    uint64_t v14 = +[UIAction actionWithHandler:&stru_1C920];
    v15 = [v5 buttonProperties];
    [v15 setPrimaryAction:v14];

    [v5 setAccessibilityIdentifier:@"NO_FONTS_INSTALLED"];
  }
  else
  {
    id v5 = 0;
  }
  [(InstalledFontsListController *)self _setContentUnavailableConfiguration:v5];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  uint64_t v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:0];
    unsigned int v6 = [(id)objc_opt_class() showInstalledFonts];
    id v7 = +[FontSettingsManager sharedManager];
    id v8 = v7;
    if (v6) {
      [v7 installedFontFamilies];
    }
    else {
    uint64_t v9 = [v7 systemFontFamilies];
    }

    id v10 = [v9 count];
    if (v10)
    {
      v11 = +[NSBundle bundleForClass:objc_opt_class()];
      v12 = [v11 localizedStringForKey:@"INSTALLED FONTS" value:&stru_1CDF0 table:@"FontSettings"];
      id v13 = +[PSSpecifier groupSpecifierWithName:v12];
      [v5 addObject:v13];

      id v26 = 0;
      uint64_t v14 = [(InstalledFontsListController *)self fontFamilySpecifiersFromFamilies:v9 deletableSpecifiers:&v26];
      id v15 = v26;
      unsigned int v16 = [(InstalledFontsListController *)self isEditing];
      id v17 = v14;
      if (v16)
      {
        if (self->deletingRow) {
          id v17 = v14;
        }
        else {
          id v17 = v15;
        }
      }
      [v5 addObjectsFromArray:v17];
    }
    BOOL hasUserInstalledFonts = self->hasUserInstalledFonts;
    v19 = [(InstalledFontsListController *)self navigationItem];
    v20 = [v19 rightBarButtonItem];
    [v20 setEnabled:hasUserInstalledFonts];

    uint64_t v21 = [(InstalledFontsListController *)self navigationController];
    unsigned int v22 = [(InstalledFontsListController *)self isEditing] ^ 1;
    if (v10) {
      uint64_t v23 = v22;
    }
    else {
      uint64_t v23 = 1;
    }
    [v21 setToolbarHidden:v23 animated:0];

    v24 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    [(InstalledFontsListController *)self showNoFontsMessageIfNeeded];
    uint64_t v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)doSelectAll
{
  uint64_t v3 = (char *)[*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] count];
  uint64_t v4 = v3 - 1;
  if (v3 != (unsigned char *)&dword_0 + 1)
  {
    id v5 = 0;
    do
    {
      unsigned int v6 = +[NSIndexPath indexPathForRow:v5 inSection:0];
      [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__table] selectRowAtIndexPath:v6 animated:1 scrollPosition:0];

      ++v5;
    }
    while (v4 != v5);
  }
  removeButton = self->removeButton;

  [(UIBarButtonItem *)removeButton setEnabled:1];
}

- (void)doCancel
{
}

- (void)updateButtons:(BOOL)a3
{
  if (a3)
  {
    [(UIBarButtonItem *)self->removeButton setEnabled:0];
    id v10 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"doCancel"];
    [v10 setStyle:2];
    id v4 = objc_alloc((Class)UIBarButtonItem);
    id v5 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned int v6 = [v5 localizedStringForKey:@"SELECT ALL" value:&stru_1CDF0 table:@"FontSettings"];
    id v7 = [v4 initWithTitle:v6 style:0 target:self action:"doSelectAll"];
  }
  else
  {
    id v10 = [(InstalledFontsListController *)self editButtonItem];
    [v10 setAccessibilityIdentifier:@"EDIT_INSTALLED_FONTS"];
    [v10 setEnabled:self->hasUserInstalledFonts];
    id v5 = [(InstalledFontsListController *)self navigationItem];
    id v7 = [v5 backBarButtonItem];
  }

  id v8 = [(InstalledFontsListController *)self navigationItem];
  [v8 setRightBarButtonItem:v10];

  uint64_t v9 = [(InstalledFontsListController *)self navigationItem];
  [v9 setLeftBarButtonItem:v7];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (!self->deletingRow)
  {
    [(InstalledFontsListController *)self updateButtons:a3];
    id v7 = [(InstalledFontsListController *)self navigationController];
    [v7 setToolbarHidden:v5 ^ 1 animated:v4];
  }
  v14.receiver = self;
  v14.super_class = (Class)InstalledFontsListController;
  [(InstalledFontsListController *)&v14 setEditing:v5 animated:v4];
  if (!self->deletingRow)
  {
    id v8 = &OBJC_IVAR___InstalledFontsListController__fontFamilySpecifiersForEditing;
    if (v5) {
      uint64_t v9 = &OBJC_IVAR___InstalledFontsListController__fontFamilySpecifiers;
    }
    else {
      uint64_t v9 = &OBJC_IVAR___InstalledFontsListController__fontFamilySpecifiersForEditing;
    }
    if (!v5) {
      id v8 = &OBJC_IVAR___InstalledFontsListController__fontFamilySpecifiers;
    }
    [(InstalledFontsListController *)self replaceContiguousSpecifiers:*(void *)&self->PSListController_opaque[*v9] withSpecifiers:*(void *)&self->PSListController_opaque[*v8] animated:1];
    uint64_t v10 = OBJC_IVAR___PSListController__table;
    [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__table] setAllowsSelectionDuringEditing:1];
    [*(id *)&self->PSListController_opaque[v10] setAllowsMultipleSelectionDuringEditing:1];
  }
  v11 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__table];
  if (v5)
  {
    [v11 setEditing:1 animated:v4];
    v12 = (NSMutableDictionary *)objc_opt_new();
    fontFamiliesCheckmarkState = self->fontFamiliesCheckmarkState;
    self->fontFamiliesCheckmarkState = v12;
  }
  else
  {
    [v11 setEditing:0 animated:v4];
  }
}

- (void)preserveFontFamilySelections
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  BOOL v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_87A4;
  v18[3] = &unk_1C948;
  v18[4] = self;
  [v4 enumerateObjectsUsingBlock:v18];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v5 = [(InstalledFontsListController *)self table];
  unsigned int v6 = [v5 indexPathsForSelectedRows];

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)&self->PSListController_opaque[v3], "objectAtIndex:", (char *)objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v10), "row") + 1);
        v12 = [v11 userInfo];
        id v13 = [v12 objectForKey:@"family"];

        if (v13) {
          [(NSMutableDictionary *)self->fontFamiliesCheckmarkState setObject:&__kCFBooleanTrue forKey:v13];
        }

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v8);
  }
}

- (void)restoreFontFamilySelections
{
  v2 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_88B8;
  v3[3] = &unk_1C948;
  v3[4] = self;
  [v2 enumerateObjectsUsingBlock:v3];
}

- (void)reloadSpecifiers
{
  v9.receiver = self;
  v9.super_class = (Class)InstalledFontsListController;
  [(InstalledFontsListController *)&v9 reloadSpecifiers];
  [(InstalledFontsListController *)self restoreFontFamilySelections];
  if ([(InstalledFontsListController *)self isEditing])
  {
    uint64_t v5 = 0;
    unsigned int v6 = &v5;
    uint64_t v7 = 0x2020000000;
    char v8 = 0;
    fontFamiliesCheckmarkState = self->fontFamiliesCheckmarkState;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_8AD4;
    v4[3] = &unk_1C970;
    v4[4] = &v5;
    [(NSMutableDictionary *)fontFamiliesCheckmarkState enumerateKeysAndObjectsUsingBlock:v4];
    [(UIBarButtonItem *)self->removeButton setEnabled:*((unsigned __int8 *)v6 + 24)];
    _Block_object_dispose(&v5, 8);
  }
}

- (void)filterContentsWithSearchText:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    BOOL v4 = [[FontSettingsStringMatcher alloc] initWithPatternString:v5];
    +[FontFamiliesSearchCell setSearchStringMatcher:v4];
  }
  else
  {
    +[FontFamiliesSearchCell setSearchStringMatcher:0];
  }
  [(InstalledFontsListController *)self preserveFontFamilySelections];
  [(InstalledFontsListController *)self reloadSpecifiers];
}

- (void)deleteSelected:(id)a3
{
  BOOL v4 = objc_opt_new();
  id v5 = +[NSMutableArray arrayWithCapacity:0];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  unsigned int v6 = [(InstalledFontsListController *)self table];
  uint64_t v7 = [v6 indexPathsForSelectedRows];

  id obj = v7;
  id v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = (char *)[*(id *)(*((void *)&v26 + 1) + 8 * (void)v11) row] + 1;
        id v13 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v12];
        long long v14 = [v13 userInfo];
        long long v15 = [v14 objectForKey:@"family"];

        [v4 addObject:v15];
        long long v16 = +[NSNumber numberWithInteger:v12];
        [v5 addObject:v16];

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v9);
  }

  long long v17 = +[NSMutableArray arrayWithCapacity:0];
  id v18 = v5;
  v19 = [v5 sortedArrayUsingSelector:"compare:"];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_8E6C;
  v23[3] = &unk_1C998;
  id v24 = v17;
  v25 = self;
  id v20 = v17;
  [v19 enumerateObjectsUsingBlock:v23];

  [(InstalledFontsListController *)self removeContiguousSpecifiers:v20 animated:1];
  [(InstalledFontsListController *)self setEditing:0 animated:1];
  uint64_t v21 = +[FontSettingsManager sharedManager];
  [v21 removeFontFamilies:v4];
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v6 = a3;
  if ([v6 isActive])
  {
    BOOL v4 = [v6 searchBar];
    id v5 = [v4 text];
    [(InstalledFontsListController *)self filterContentsWithSearchText:v5];
  }
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  +[FontFamiliesSearchCell setSearchStringMatcher:0];

  [(InstalledFontsListController *)self reloadSpecifiers];
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section])
  {
    int64_t v6 = 0;
  }
  else
  {
    uint64_t v7 = objc_msgSend(*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers], "objectAtIndex:", (char *)objc_msgSend(v5, "row") + 1);
    id v8 = [v7 userInfo];
    id v9 = [v8 objectForKey:@"family"];

    int64_t v6 = [v9 isDeletable];
  }

  return v6;
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  BOOL v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"REMOVE_FROM_ACTIVE_FONTS" value:&stru_1CDF0 table:@"FontSettings"];

  return v5;
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  self->deletingRow = 1;
  [(InstalledFontsListController *)self setEditing:1 animated:1];
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  if ([(InstalledFontsListController *)self isEditing] && self->deletingRow) {
    [(InstalledFontsListController *)self setEditing:0 animated:1];
  }
  self->deletingRow = 0;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = v9;
  if (a4 == 1)
  {
    v11 = (char *)[v9 row] + 1;
    v12 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v11];
    id v13 = [v12 userInfo];
    long long v14 = [v13 objectForKey:@"family"];

    if ([(id)objc_opt_class() showInstalledFonts])
    {
      [(InstalledFontsListController *)self removeSpecifierAtIndex:v11 animated:1];
    }
    else
    {
      long long v15 = [v8 cellForRowAtIndexPath:v10];
      [v15 setActivityAccessoryView];
      [v15 setType:3];
    }
    long long v16 = +[FontSettingsManager sharedManager];
    id v18 = v14;
    long long v17 = +[NSArray arrayWithObjects:&v18 count:1];
    [v16 removeFontFamilies:v17];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(InstalledFontsListController *)self isEditing])
  {
    id v8 = [v6 indexPathsForSelectedRows];
    -[UIBarButtonItem setEnabled:](self->removeButton, "setEnabled:", [v8 count] != 0);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)InstalledFontsListController;
    if ([(InstalledFontsListController *)&v10 respondsToSelector:"tableView:didSelectRowAtIndexPath:"])
    {
      v9.receiver = self;
      v9.super_class = (Class)InstalledFontsListController;
      [(InstalledFontsListController *)&v9 tableView:v6 didSelectRowAtIndexPath:v7];
    }
  }
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(InstalledFontsListController *)self isEditing])
  {
    id v8 = [v6 indexPathsForSelectedRows];
    -[UIBarButtonItem setEnabled:](self->removeButton, "setEnabled:", [v8 count] != 0);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)InstalledFontsListController;
    if ([(InstalledFontsListController *)&v10 respondsToSelector:"tableView:didDeselectRowAtIndexPath:"])
    {
      v9.receiver = self;
      v9.super_class = (Class)InstalledFontsListController;
      [(InstalledFontsListController *)&v9 tableView:v6 didDeselectRowAtIndexPath:v7];
    }
  }
}

- (NSArray)fontFamilySpecifiers
{
  return (NSArray *)objc_getProperty(self, a2, 208, 1);
}

- (void)setFontFamilySpecifiers:(id)a3
{
}

- (NSArray)fontFamilySpecifiersForEditing
{
  return (NSArray *)objc_getProperty(self, a2, 216, 1);
}

- (void)setFontFamilySpecifiersForEditing:(id)a3
{
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
}

- (UISearchBar)searchBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);

  return (UISearchBar *)WeakRetained;
}

- (void)setSearchBar:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_searchBar);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_fontFamilySpecifiersForEditing, 0);
  objc_storeStrong((id *)&self->_fontFamilySpecifiers, 0);
  objc_storeStrong((id *)&self->fontFamiliesCheckmarkState, 0);

  objc_storeStrong((id *)&self->removeButton, 0);
}

@end