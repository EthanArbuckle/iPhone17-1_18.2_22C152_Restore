@interface CACCommandGroupsController
- (BOOL)isCurrentlyAppearing;
- (CACCommandGroupsController)init;
- (CACSpokenCommandPresentation)commandPresentation;
- (UISearchController)searchController;
- (id)filteredCommandList:(id)a3;
- (id)specifiers;
- (void)_commandSettingsDidChange;
- (void)_handleDeleteAllButton;
- (void)_handleExportButton;
- (void)_handleImportButton;
- (void)_setupSearch;
- (void)dealloc;
- (void)didUpdatePropertiesForEditor:(id)a3;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)presentCustomAction:(id)a3;
- (void)searchResultSpecifierSelected:(id)a3;
- (void)setCommandPresentation:(id)a3;
- (void)setIsCurrentlyAppearing:(BOOL)a3;
- (void)setSearchController:(id)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CACCommandGroupsController

- (CACCommandGroupsController)init
{
  v5.receiver = self;
  v5.super_class = (Class)CACCommandGroupsController;
  v2 = [(CACCommandGroupsController *)&v5 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_85FC, @"CACNotificationCommandsSettingsChanged", 0, (CFNotificationSuspensionBehavior)1028);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"CACNotificationCommandsSettingsChanged", 0);
  v4.receiver = self;
  v4.super_class = (Class)CACCommandGroupsController;
  [(CACCommandGroupsController *)&v4 dealloc];
}

- (id)specifiers
{
  v2 = self;
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v4) {
    goto LABEL_25;
  }
  uint64_t v5 = +[NSMutableArray array];
  v6 = [(CACCommandGroupsController *)v2 commandPresentation];

  if (!v6)
  {
    id v7 = objc_alloc_init((Class)CACSpokenCommandPresentation);
    [(CACCommandGroupsController *)v2 setCommandPresentation:v7];

    v8 = [(CACCommandGroupsController *)v2 commandPresentation];
    [v8 setUsedByPreferences:1];
  }
  v56 = (void *)v5;
  v9 = [(CACCommandGroupsController *)v2 commandPresentation];
  v10 = [v9 nestedCommandGroupsAndItems];

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v57 objects:v61 count:16];
  v13 = (void **)AFDictationConnection_ptr;
  v14 = AFDictationConnection_ptr;
  id obj = v11;
  if (v12)
  {
    id v15 = v12;
    uint64_t v53 = v3;
    v55 = v2;
    char v16 = 0;
    uint64_t v17 = *(void *)v58;
    uint64_t v18 = PSIDKey;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v58 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = v18;
        v21 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        if (([v21 isGroup] & 1) == 0)
        {
          v52 = v21;
          _AXAssert();
        }
        v22 = v13[43];
        objc_msgSend(v21, "displayString", v52);
        v24 = v23 = v13;
        v52 = 0;
        v25 = objc_msgSend(v22, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v24, v55, 0, 0, objc_opt_class(), 2);

        [v25 setProperty:v21 forKey:@"CACCommandGroup"];
        v26 = [v21 identifier];
        [v25 setProperty:v26 forKey:v20];

        if ([v21 isCustom])
        {
          v27 = [v23[43] groupSpecifierWithID:@"CACUserCommandGroup"];
          [v56 insertObject:v27 atIndex:0];
          [v56 insertObject:v25 atIndex:0];

          char v16 = 1;
        }
        else
        {
          [v56 addObject:v25];
        }
        v13 = v23;

        uint64_t v18 = v20;
      }
      id v15 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
    }
    while (v15);

    v2 = v55;
    uint64_t v3 = v53;
    v14 = AFDictationConnection_ptr;
    if (v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  if (AXProcessIsSetup())
  {
    uint64_t v18 = PSIDKey;
  }
  else
  {
    v28 = v13[43];
    v29 = settingsLocString(@"CREATE_NEW_CUSTOM_COMMAND", @"CommandAndControlSettings");
    v30 = [v28 preferenceSpecifierNamed:v29 target:v2 set:0 get:0 detail:0 cell:2 edit:0];

    [v30 setControllerLoadAction:"presentCustomAction:"];
    v31 = [v14[17] sharedPreferences];
    v32 = [v31 bestLocaleIdentifier];
    id v33 = +[CACSpokenCommandItem newCommandItemWithLocale:v32 scope:@"com.apple.speech.SystemWideScope"];
    [v30 setProperty:v33 forKey:@"CACCommandItem"];

    uint64_t v18 = PSIDKey;
    [v30 setProperty:@"CreateNewCommand" forKey:PSIDKey];
    v34 = [v13[43] emptyGroupSpecifier];
    [v56 insertObject:v34 atIndex:0];

    [v56 insertObject:v30 atIndex:0];
  }
LABEL_22:
  v35 = [v13[43] groupSpecifierWithID:@"CACImportExportGroup"];
  [v56 addObject:v35];
  v36 = v13[43];
  v37 = settingsLocString(@"IMPORT_CUSTOM_COMMANDS", @"CommandAndControlSettings");
  v38 = [v36 preferenceSpecifierNamed:v37 target:v2 set:0 get:0 detail:0 cell:13 edit:0];

  [v38 setButtonAction:"_handleImportButton"];
  uint64_t v39 = PSAllowMultilineTitleKey;
  [v38 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  [v38 setProperty:@"ImportCustomCommands" forKey:v18];
  [v56 addObject:v38];
  v40 = [v14[17] sharedPreferences];
  v41 = [v40 allCustomCommandProperties];
  v42 = v13;
  id v43 = [v41 count];

  if (v43)
  {
    v44 = v42[43];
    v45 = settingsLocString(@"EXPORT_CUSTOM_COMMANDS", @"CommandAndControlSettings");
    v46 = [v44 preferenceSpecifierNamed:v45 target:v2 set:0 get:0 detail:0 cell:13 edit:0];

    [v46 setButtonAction:"_handleExportButton"];
    [v46 setProperty:&__kCFBooleanTrue forKey:v39];
    [v56 addObject:v46];
    v47 = v42[43];
    v48 = settingsLocString(@"DELETE_ALL_CUSTOM_COMMANDS", @"CommandAndControlSettings");
    v49 = [v47 preferenceSpecifierNamed:v48 target:v2 set:0 get:0 detail:0 cell:13 edit:0];

    [v49 setButtonAction:"_handleDeleteAllButton"];
    [v49 setProperty:&__kCFBooleanTrue forKey:v39];
    [v56 addObject:v49];
  }
  [(CACCommandGroupsController *)v2 setAllSpecifiersUnsearchable:v56];
  v50 = *(void **)&v2->AXUISettingsBaseListController_opaque[v3];
  *(void *)&v2->AXUISettingsBaseListController_opaque[v3] = v56;

  objc_super v4 = *(void **)&v2->AXUISettingsBaseListController_opaque[v3];
LABEL_25:

  return v4;
}

- (void)presentCustomAction:(id)a3
{
  id v4 = a3;
  id v7 = objc_alloc_init((Class)CACCustomCommandEditorViewController);
  uint64_t v5 = [v4 propertyForKey:@"CACCommandItem"];

  [v7 setCommandItem:v5];
  [v7 setDelegate:self];
  id v6 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v7];
  [(CACCommandGroupsController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)CACCommandGroupsController;
  [(CACCommandGroupsController *)&v4 viewDidLoad];
  uint64_t v3 = settingsLocString(@"CUSTOMIZE_COMMANDS_TITLE", @"CommandAndControlSettings");
  [(CACCommandGroupsController *)self setTitle:v3];

  [(CACCommandGroupsController *)self _setupSearch];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CACCommandGroupsController;
  [(CACCommandGroupsController *)&v5 viewWillAppear:a3];
  [(CACCommandGroupsController *)self setIsCurrentlyAppearing:1];
  [(CACCommandGroupsController *)self _commandSettingsDidChange];
  objc_super v4 = [(CACCommandGroupsController *)self table];
  [v4 selectRowAtIndexPath:0 animated:1 scrollPosition:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CACCommandGroupsController;
  [(CACCommandGroupsController *)&v4 viewWillDisappear:a3];
  [(CACCommandGroupsController *)self setIsCurrentlyAppearing:0];
}

- (void)_commandSettingsDidChange
{
  if ([(CACCommandGroupsController *)self isCurrentlyAppearing])
  {
    [(CACCommandGroupsController *)self setCommandPresentation:0];
    [(CACCommandGroupsController *)self reloadSpecifiers];
  }
}

- (void)_setupSearch
{
  if (!self->_searchController)
  {
    uint64_t v17 = objc_alloc_init(CACCommandSearchResultsViewController);
    [(CACCommandSearchResultsViewController *)v17 setDelegate:self];
    uint64_t v3 = (UISearchController *)[objc_alloc((Class)UISearchController) initWithSearchResultsController:v17];
    searchController = self->_searchController;
    self->_searchController = v3;

    objc_super v5 = [(CACCommandGroupsController *)self searchController];
    [v5 setDelegate:v17];

    id v6 = [(CACCommandGroupsController *)self searchController];
    [v6 setSearchResultsUpdater:self];

    id v7 = [(CACCommandGroupsController *)self searchController];
    [v7 setObscuresBackgroundDuringPresentation:1];

    v8 = [(CACCommandGroupsController *)self searchController];
    v9 = [v8 searchBar];
    [v9 setAutocapitalizationType:0];

    v10 = [(CACCommandGroupsController *)self searchController];
    id v11 = [v10 searchBar];
    [v11 setKeyboardType:0];

    id v12 = [(CACCommandGroupsController *)self searchController];
    v13 = [v12 searchBar];
    [v13 setAutocorrectionType:1];

    v14 = [(CACCommandGroupsController *)self searchController];
    id v15 = [(CACCommandGroupsController *)self navigationItem];
    [v15 setSearchController:v14];

    char v16 = [(CACCommandGroupsController *)self navigationItem];
    [v16 setHidesSearchBarWhenScrolling:0];

    [(CACCommandGroupsController *)self setDefinesPresentationContext:1];
  }
}

- (void)searchResultSpecifierSelected:(id)a3
{
  id v6 = a3;
  objc_super v4 = [v6 propertyForKey:@"CACCommandItem"];
  if ([v4 isCustom])
  {
    [(CACCommandGroupsController *)self presentCustomAction:v6];
  }
  else
  {
    [v6 detailControllerClass];
    objc_super v5 = CreateDetailControllerInstanceWithClass();
    [(CACCommandGroupsController *)self showController:v5 withSpecifier:v6];
  }
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  objc_super v4 = [a3 searchBar];
  id v8 = [v4 text];

  objc_super v5 = [(CACCommandGroupsController *)self searchController];
  id v6 = [v5 searchResultsController];

  id v7 = [(CACCommandGroupsController *)self filteredCommandList:v8];
  [v6 setSearchResults:v7];
}

- (id)filteredCommandList:(id)a3
{
  id v4 = a3;
  id v45 = objc_alloc_init((Class)NSNumberFormatter);
  [v45 setNumberStyle:5];
  id v48 = objc_alloc_init((Class)NSNumberFormatter);
  objc_super v5 = [v4 componentsSeparatedByString:@" "];
  id v6 = +[NSArray arrayWithArray:v5];

  id v7 = +[NSMutableArray array];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
  v44 = v7;
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v58;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v58 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        if ([v12 length])
        {
          id v13 = v12;
          v14 = [v48 numberFromString:v13];
          if (v14)
          {
            uint64_t v15 = [v45 stringFromNumber:v14];

            id v13 = (id)v15;
            id v7 = v44;
          }
          [v7 addObject:v13];
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
    }
    while (v9);
  }

  if ([v7 count])
  {
    uint64_t v16 = [v7 componentsJoinedByString:@" "];

    id v4 = (id)v16;
  }
  uint64_t v17 = [(CACCommandGroupsController *)self commandPresentation];
  uint64_t v18 = [v17 nestedCommandGroupsAndItems];

  v19 = +[NSPredicate predicateWithFormat:@"displayString = '%@'", v4];
  id v20 = [@"*" mutableCopy];
  id v21 = [v4 length];
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_9818;
  v55[3] = &unk_4DAE8;
  id v22 = v20;
  id v56 = v22;
  id v43 = v4;
  objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v21, 3, v55);
  uint64_t v23 = +[NSPredicate predicateWithFormat:@"displayString LIKE[cd] %@", v22];
  v42 = v22;
  +[NSPredicate predicateWithFormat:@"SELF LIKE[cd] %@", v22];
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_9860;
  v53[3] = &unk_4DB10;
  id v40 = (id)objc_claimAutoreleasedReturnValue();
  id v54 = v40;
  uint64_t v24 = +[NSPredicate predicateWithBlock:v53];
  v62[0] = v19;
  v62[1] = v23;
  v41 = (void *)v23;
  uint64_t v39 = (void *)v24;
  v62[2] = v24;
  v25 = +[NSArray arrayWithObjects:v62 count:3];
  v26 = +[NSCompoundPredicate orPredicateWithSubpredicates:v25];

  id v47 = +[NSMutableArray array];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v27 = v18;
  id v28 = [v27 countByEnumeratingWithState:&v49 objects:v61 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v50;
    do
    {
      for (j = 0; j != v29; j = (char *)j + 1)
      {
        if (*(void *)v50 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = *(void **)(*((void *)&v49 + 1) + 8 * (void)j);
        id v33 = +[CACCommandSearchResult searchResultWithGroup:v32];
        v34 = [v32 commandsArray];
        v35 = [v34 filteredArrayUsingPredicate:v26];
        [v33 setCommandItems:v35];

        v36 = [v33 commandItems];
        id v37 = [v36 count];

        if (v37) {
          [v47 addObject:v33];
        }
      }
      id v29 = [v27 countByEnumeratingWithState:&v49 objects:v61 count:16];
    }
    while (v29);
  }

  return v47;
}

- (void)didUpdatePropertiesForEditor:(id)a3
{
  [(CACCommandGroupsController *)self reloadSpecifiers];
  id v6 = [(CACCommandGroupsController *)self searchController];
  id v4 = [v6 searchResultsUpdater];
  objc_super v5 = [(CACCommandGroupsController *)self searchController];
  [v4 updateSearchResultsForSearchController:v5];
}

- (void)_handleImportButton
{
  uint64_t v3 = +[UTType typeWithFilenameExtension:kCACCommandsFileExtensionVCCommands];
  id v4 = objc_alloc((Class)UIDocumentPickerViewController);
  id v7 = v3;
  objc_super v5 = +[NSArray arrayWithObjects:&v7 count:1];
  id v6 = [v4 initForOpeningContentTypes:v5];

  [v6 setModalPresentationStyle:2];
  [v6 setDelegate:self];
  [(CACCommandGroupsController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)_handleExportButton
{
  uint64_t v3 = +[CACCommandImportExportUtilities defaultExportURL];
  [v3 startAccessingSecurityScopedResource];
  id v4 = +[CACCommandImportExportUtilities exportToURL:v3];
  objc_super v5 = v4;
  if (v4)
  {
    [v4 displayAlertForViewController:self];
  }
  else
  {
    id v6 = objc_alloc((Class)UIDocumentPickerViewController);
    id v9 = v3;
    id v7 = +[NSArray arrayWithObjects:&v9 count:1];
    id v8 = [v6 initForExportingURLs:v7];

    [v8 setModalPresentationStyle:2];
    [(CACCommandGroupsController *)self presentViewController:v8 animated:1 completion:0];
  }
  [v3 stopAccessingSecurityScopedResource];
}

- (void)_handleDeleteAllButton
{
  uint64_t v3 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:0];
  id v4 = settingsLocString(@"DELETE_ALL_CUSTOM_COMMANDS", @"CommandAndControlSettings");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_9D98;
  v8[3] = &unk_4DA80;
  v8[4] = self;
  objc_super v5 = +[UIAlertAction actionWithTitle:v4 style:2 handler:v8];
  [v3 addAction:v5];

  id v6 = settingsLocString(@"CANCEL", @"CommandAndControlSettings");
  id v7 = +[UIAlertAction actionWithTitle:v6 style:1 handler:&stru_4DB70];
  [v3 addAction:v7];

  [(CACCommandGroupsController *)self presentViewController:v3 animated:1 completion:0];
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  objc_msgSend(a4, "firstObject", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v5 = +[CACCommandImportExportUtilities importFromURL:v6];
  [v5 displayAlertForViewController:self];
}

- (CACSpokenCommandPresentation)commandPresentation
{
  return self->_commandPresentation;
}

- (void)setCommandPresentation:(id)a3
{
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
}

- (BOOL)isCurrentlyAppearing
{
  return self->_isCurrentlyAppearing;
}

- (void)setIsCurrentlyAppearing:(BOOL)a3
{
  self->_isCurrentlyAppearing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchController, 0);

  objc_storeStrong((id *)&self->_commandPresentation, 0);
}

@end