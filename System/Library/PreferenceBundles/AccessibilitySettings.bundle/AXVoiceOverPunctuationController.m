@interface AXVoiceOverPunctuationController
- (AXSSPunctuationGroup)testingInitialPunctuationGroup;
- (BOOL)ignoreGroupsChangedNotification;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (id)_numberEntriesInGroup:(id)a3;
- (id)_selectedPunctuation:(id)a3;
- (id)specifiers;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_addDoneButton;
- (void)_configureEditButton:(BOOL)a3;
- (void)_donePressed;
- (void)_editPressed;
- (void)_loadPunctationGroups;
- (void)_punctuationGroupsChanged:(id)a3;
- (void)_updateEditingStatusForSpecifiers:(BOOL)a3;
- (void)dealloc;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)reloadSpecifiers;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setIgnoreGroupsChangedNotification:(BOOL)a3;
- (void)setTestingInitialPunctuationGroup:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willResignActive;
@end

@implementation AXVoiceOverPunctuationController

- (void)reloadSpecifiers
{
  v3.receiver = self;
  v3.super_class = (Class)AXVoiceOverPunctuationController;
  [(AXVoiceOverPunctuationController *)&v3 reloadSpecifiers];
  [(AXVoiceOverPunctuationController *)self _loadPunctationGroups];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->super.AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = +[NSMutableArray array];
    v6 = *(void **)&self->super.AXUISettingsBaseListController_opaque[v3];
    uint64_t v34 = v3;
    *(void *)&self->super.AXUISettingsBaseListController_opaque[v3] = v5;

    v7 = +[NSMutableArray array];
    systemPunctuationSpecs = self->_systemPunctuationSpecs;
    self->_systemPunctuationSpecs = v7;

    v9 = +[NSMutableArray array];
    v10 = settingsLocString(@"ACTIVE_PUNCTUATION", @"VoiceOverSettings");
    v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:"_selectedPunctuation:" detail:objc_opt_class() cell:2 edit:0];

    uint64_t v33 = PSIDKey;
    objc_msgSend(v11, "setProperty:forKey:", @"voiceOverActivePunctuationGroup");
    [v9 addObject:v11];
    v12 = settingsLocString(@"PUNCTUATION_GROUPS", @"VoiceOverSettings");
    v13 = +[PSSpecifier groupSpecifierWithName:v12];

    v14 = v9;
    [v9 addObject:v13];
    [(AXVoiceOverPunctuationBaseController *)self systemPunctuationGroups];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v15 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v37;
      do
      {
        v18 = 0;
        v19 = v13;
        do
        {
          if (*(void *)v37 != v17) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v18);
          v21 = [v20 uuid];
          v22 = AXSettingsNameForPunctuationGroupUUID(v21);
          v13 = +[PSSpecifier preferenceSpecifierNamed:v22 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

          [v13 setProperty:v20 forKey:@"PunctuationGroup"];
          v23 = [v20 uuid];
          [v13 setProperty:v23 forKey:@"punctuationGroupUUID"];

          [v14 addObject:v13];
          [(NSMutableArray *)self->_systemPunctuationSpecs addObject:v13];
          v18 = (char *)v18 + 1;
          v19 = v13;
        }
        while (v16 != v18);
        id v16 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v16);
    }
    v24 = +[PSSpecifier emptyGroupSpecifier];

    [v24 setProperty:@"NewPunctuationGroup" forKey:v33];
    [v14 addObject:v24];
    v25 = settingsLocString(@"CUSTOM_PUNCTUATION_ADD_GROUP", @"VoiceOverSettings");
    v26 = +[PSSpecifier preferenceSpecifierNamed:v25 target:self set:0 get:0 detail:objc_opt_class() cell:13 edit:0];

    [v26 setProperty:@"NewPunctuation" forKey:v33];
    [v14 addObject:v26];
    v27 = +[PSSpecifier emptyGroupSpecifier];

    [v14 addObject:v27];
    v28 = settingsLocString(@"IMPORT_PUNCTUATION", @"VoiceOverSettings");
    v29 = +[PSSpecifier preferenceSpecifierNamed:v28 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v29 setProperty:@"ImportPunctuation" forKey:v33];
    [v14 addObject:v29];
    [(AXVoiceOverPunctuationController *)self setAllSpecifiersUnsearchable:v14];
    id v30 = [v14 copy];
    v31 = *(void **)&self->super.AXUISettingsBaseListController_opaque[v34];
    *(void *)&self->super.AXUISettingsBaseListController_opaque[v34] = v30;

    v4 = *(void **)&self->super.AXUISettingsBaseListController_opaque[v34];
  }

  return v4;
}

- (id)_selectedPunctuation:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  v4 = [v3 voiceOverPunctuationGroup];

  if (!v4)
  {
    v4 = AXSettingsDefaultPunctuationGroupUUID();
  }
  uint64_t v5 = AXSettingsNameForPunctuationGroupUUID(v4);

  return v5;
}

- (void)_loadPunctationGroups
{
  id v29 = +[NSMutableArray array];
  uint64_t v3 = [(AXVoiceOverPunctuationBaseController *)self customPunctuationGroups];
  v4 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Loading punctuation groups: %@", buf, 0xCu);
  }

  if ([v3 count])
  {
    uint64_t v5 = settingsLocString(@"CUSTOM_PUNCTUATION_GROUPS", @"VoiceOverSettings");
    v6 = +[PSSpecifier groupSpecifierWithName:v5];

    [v6 setProperty:@"CustomPunctuationGroup" forKey:PSIDKey];
    [v29 addObject:v6];
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v27 = v3;
  id obj = [v3 sortedArrayUsingComparator:&__block_literal_global_51];
  id v7 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v35;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v12 = [v11 name];
        v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:"_numberEntriesInGroup:" detail:objc_opt_class() cell:2 edit:0];

        [v13 setProperty:v11 forKey:@"PunctuationGroup"];
        [v13 setProperty:&__kCFBooleanTrue forKey:@"CustomGroup"];
        v14 = [v11 uuid];
        [v13 setProperty:v14 forKey:@"punctuationGroupUUID"];

        [v29 addObject:v13];
      }
      id v8 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v8);
  }

  id v15 = [(NSMutableArray *)self->_customPunctuationSpecs copy];
  objc_storeStrong((id *)&self->_customPunctuationSpecs, v29);
  [(AXVoiceOverPunctuationController *)self beginUpdates];
  [(AXVoiceOverPunctuationController *)self removeContiguousSpecifiers:v15];
  [(AXVoiceOverPunctuationController *)self insertContiguousSpecifiers:v29 atIndex:[(AXVoiceOverPunctuationController *)self indexOfSpecifierID:@"NewPunctuationGroup"] animated:1];
  [(AXVoiceOverPunctuationController *)self endUpdates];
  id v16 = [(AXVoiceOverPunctuationController *)self table];
  [v16 beginUpdates];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v17 = v29;
  id v18 = [v17 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v31;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v30 + 1) + 8 * (void)j);
        v23 = [(AXVoiceOverPunctuationController *)self table];
        v24 = [(AXVoiceOverPunctuationController *)self indexPathForSpecifier:v22];
        long long v38 = v24;
        v25 = +[NSArray arrayWithObjects:&v38 count:1];
        [v23 reloadRowsAtIndexPaths:v25 withRowAnimation:5];
      }
      id v19 = [v17 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v19);
  }

  v26 = [(AXVoiceOverPunctuationController *)self table];
  [v26 endUpdates];
}

int64_t __57__AXVoiceOverPunctuationController__loadPunctationGroups__block_invoke(id a1, AXSSPunctuationGroup *a2, AXSSPunctuationGroup *a3)
{
  v4 = a3;
  uint64_t v5 = [(AXSSPunctuationGroup *)a2 name];
  v6 = [(AXSSPunctuationGroup *)v4 name];

  id v7 = [v5 localizedCompare:v6];
  return (int64_t)v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AXVoiceOverPunctuationController *)self specifierAtIndexPath:v7];
  uint64_t v9 = PSIDKey;
  v10 = [v8 propertyForKey:PSIDKey];
  unsigned int v11 = [v10 isEqualToString:@"NewPunctuation"];

  if (v11)
  {
    v56 = v8;
    id v57 = v7;
    id v58 = v6;
    v12 = settingsLocString(@"PUNCTUATION_ORIGINAL_GROUP_SELECTION_TITLE", @"VoiceOverSettings");
    v13 = settingsLocString(@"PUNCTUATION_ORIGINAL_GROUP_SELECTION_MESSAGE", @"VoiceOverSettings");
    v14 = +[UIAlertController alertControllerWithTitle:v12 message:v13 preferredStyle:AXDeviceIsPad()];

    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = __70__AXVoiceOverPunctuationController_tableView_didSelectRowAtIndexPath___block_invoke;
    v74[3] = &unk_20B6A0;
    v74[4] = self;
    id v15 = objc_retainBlock(v74);
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    v55 = self;
    id obj = self->_systemPunctuationSpecs;
    id v16 = [(NSMutableArray *)obj countByEnumeratingWithState:&v70 objects:v77 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v71;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v71 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          v21 = [v20 propertyForKey:@"punctuationGroupUUID"];
          uint64_t v22 = [v20 name];
          v67[0] = _NSConcreteStackBlock;
          v67[1] = 3221225472;
          v67[2] = __70__AXVoiceOverPunctuationController_tableView_didSelectRowAtIndexPath___block_invoke_2;
          v67[3] = &unk_20B6C8;
          v23 = v15;
          id v68 = v21;
          id v69 = v23;
          id v24 = v21;
          v25 = +[UIAlertAction actionWithTitle:v22 style:0 handler:v67];

          [v14 addAction:v25];
        }
        id v17 = [(NSMutableArray *)obj countByEnumeratingWithState:&v70 objects:v77 count:16];
      }
      while (v17);
    }

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v26 = +[AXSSPunctuationManager sharedDatabase];
    v27 = [v26 punctuationGroups];

    id v28 = [v27 countByEnumeratingWithState:&v63 objects:v76 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v64;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v64 != v30) {
            objc_enumerationMutation(v27);
          }
          long long v32 = *(void **)(*((void *)&v63 + 1) + 8 * (void)j);
          if (([v32 isSystemPunctuationGroup] & 1) == 0)
          {
            long long v33 = [v32 name];
            v61[0] = _NSConcreteStackBlock;
            v61[1] = 3221225472;
            v61[2] = __70__AXVoiceOverPunctuationController_tableView_didSelectRowAtIndexPath___block_invoke_3;
            v61[3] = &unk_20B6C8;
            long long v34 = v15;
            v61[4] = v32;
            id v62 = v34;
            long long v35 = +[UIAlertAction actionWithTitle:v33 style:0 handler:v61];

            [v14 addAction:v35];
          }
        }
        id v29 = [v27 countByEnumeratingWithState:&v63 objects:v76 count:16];
      }
      while (v29);
    }

    long long v36 = settingsLocString(@"CANCEL", @"Accessibility");
    long long v37 = +[UIAlertAction actionWithTitle:v36 style:1 handler:&__block_literal_global_341];

    long long v38 = v14;
    [v14 addAction:v37];
    self = v55;
    if (_AXSInUnitTestMode())
    {
      long long v39 = [(AXVoiceOverPunctuationController *)v55 testingInitialPunctuationGroup];
      v40 = [v39 uuid];
      ((void (*)(void *, void *))v15[2])(v15, v40);
    }
    else
    {
      long long v39 = [(AXVoiceOverPunctuationController *)v55 view];
      v40 = [v39 window];
      v49 = [v40 rootViewController];
      [v49 presentViewController:v14 animated:1 completion:0];
    }
    id v8 = v56;
    id v7 = v57;
    id v6 = v58;
  }
  else
  {
    v41 = [v8 propertyForKey:v9];
    unsigned int v42 = [v41 isEqualToString:@"ImportPunctuation"];

    if (!v42)
    {
      v48 = [v8 propertyForKey:v9];
      if ([v48 isEqualToString:@"NewPunctuation"])
      {
      }
      else
      {
        id v50 = [v8 detailControllerClass];
        uint64_t v51 = objc_opt_class();

        if (v50 != (id)v51) {
          goto LABEL_27;
        }
      }
      v52 = objc_alloc_init(AXVoiceOverPunctuationGroupController);
      v53 = [v8 propertyForKey:@"PunctuationGroup"];
      [(AXVoiceOverPunctuationGroupController *)v52 setPunctuationGroup:v53];

      v54 = [(AXVoiceOverPunctuationController *)self rootController];
      [(AXVoiceOverPunctuationGroupController *)v52 setRootController:v54];

      [(AXVoiceOverPunctuationGroupController *)v52 setParentController:self];
      [(AXVoiceOverPunctuationController *)self showController:v52 animate:1];

      goto LABEL_28;
    }
    long long v38 = +[UTType typeWithFilenameExtension:AXSSPunctutionGroupFileExtension];
    v43 = +[UTType typeWithIdentifier:@"public.data"];
    id v44 = objc_alloc((Class)UIDocumentPickerViewController);
    v75[0] = v38;
    v75[1] = v43;
    v45 = +[NSArray arrayWithObjects:v75 count:2];
    v46 = (UIDocumentPickerViewController *)[v44 initForOpeningContentTypes:v45];
    docPicker = self->_docPicker;
    self->_docPicker = v46;

    [(UIDocumentPickerViewController *)self->_docPicker setModalPresentationStyle:2];
    [(UIDocumentPickerViewController *)self->_docPicker setDelegate:self];
    [(AXVoiceOverPunctuationController *)self presentViewController:self->_docPicker animated:1 completion:0];
  }
LABEL_27:
  v60.receiver = self;
  v60.super_class = (Class)AXVoiceOverPunctuationController;
  [(AXVoiceOverPunctuationController *)&v60 tableView:v6 didSelectRowAtIndexPath:v7];
LABEL_28:
}

void __70__AXVoiceOverPunctuationController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = objc_alloc_init(AXVoiceOverPunctuationGroupController);
  v4 = [*(id *)(a1 + 32) rootController];
  [(AXVoiceOverPunctuationGroupController *)v6 setRootController:v4];

  uint64_t v5 = +[PSSpecifier emptyGroupSpecifier];
  [v5 setProperty:v3 forKey:@"PunctuationBaseGroup"];

  [(AXVoiceOverPunctuationGroupController *)v6 setSpecifier:v5];
  [(AXVoiceOverPunctuationGroupController *)v6 setParentController:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) showController:v6 animate:1];
}

uint64_t __70__AXVoiceOverPunctuationController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __70__AXVoiceOverPunctuationController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) uuid];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  id v4 = a4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v26;
    UIAccessibilityNotifications notification = UIAccessibilityAnnouncementNotification;
    id v8 = CAGradientLayer_ptr;
    do
    {
      uint64_t v9 = 0;
      id v23 = v6;
      do
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = *(NSObject **)(*((void *)&v25 + 1) + 8 * (void)v9);
        if ([v10 startAccessingSecurityScopedResource])
        {
          unsigned int v11 = v8[52];
          id v24 = 0;
          v12 = [v11 dataWithContentsOfURL:v10 options:0 error:&v24];
          v13 = v24;
          if (v13)
          {
            v14 = AXLogPunctuationStorage();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v30 = v13;
              _os_log_error_impl(&dword_0, v14, OS_LOG_TYPE_ERROR, "Could not open import: %@", buf, 0xCu);
            }
          }
          else
          {
            v14 = +[AXSSPunctuationGroup punctuationGroupFromJSONRepresentation:v12];
            id v15 = AXLogPunctuationStorage();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v30 = v14;
              _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Importing: %@", buf, 0xCu);
            }

            if (v14)
            {
              id v16 = +[AXSSPunctuationManager sharedDatabase];
              [v16 importPunctuationGroup:v14];

              id v17 = settingsLocString(@"VOICEOVER_IMPORT_PUNCTUATION_SUCCESS_ANNOUNCEMENT", @"VoiceOverSettings");
              [v14 name];
              uint64_t v18 = v7;
              v20 = id v19 = v4;
              v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v20);
              UIAccessibilityPostNotification(notification, v21);

              id v4 = v19;
              uint64_t v7 = v18;
              id v6 = v23;

              id v8 = CAGradientLayer_ptr;
            }
            [v10 stopAccessingSecurityScopedResource];
          }
        }
        else
        {
          v13 = AXLogPunctuationStorage();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v30 = v10;
            _os_log_error_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "Could not access url for punctuation import: %@", buf, 0xCu);
          }
        }

        uint64_t v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      id v6 = [v4 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v6);
  }
}

- (id)_numberEntriesInGroup:(id)a3
{
  id v3 = [a3 propertyForKey:@"PunctuationGroup"];
  id v4 = [v3 entries];
  id v5 = objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_357_0);
  id v6 = [v5 count];

  uint64_t v7 = settingsLocString(@"VO_PUNCTUATION_GROUP_ENTRY_COUNT", @"VoiceOverSettings");
  id v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v6);

  return v8;
}

BOOL __58__AXVoiceOverPunctuationController__numberEntriesInGroup___block_invoke(id a1, AXSSPunctuationEntry *a2, unint64_t a3, BOOL *a4)
{
  id v4 = [(AXSSPunctuationEntry *)a2 punctuation];
  BOOL v5 = [v4 length] != 0;

  return v5;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)AXVoiceOverPunctuationController;
  [(AXVoiceOverPunctuationController *)&v8 viewDidLoad];
  [(AXVoiceOverPunctuationController *)self _loadPunctationGroups];
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_punctuationGroupsChanged:" name:AXSSVoiceOverPunctuationGroupsChangedNotification object:0];

  objc_initWeak(&location, self);
  id v4 = +[AXSettings sharedInstance];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __47__AXVoiceOverPunctuationController_viewDidLoad__block_invoke;
  v5[3] = &unk_208798;
  objc_copyWeak(&v6, &location);
  [v4 registerUpdateBlock:v5 forRetrieveSelector:"voiceOverPunctuationGroup" withListener:self];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __47__AXVoiceOverPunctuationController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"voiceOverPunctuationGroup"];
}

- (void)_punctuationGroupsChanged:(id)a3
{
  if ([(AXVoiceOverPunctuationController *)self ignoreGroupsChangedNotification])
  {
    [(AXVoiceOverPunctuationController *)self setIgnoreGroupsChangedNotification:0];
  }
  else
  {
    AXPerformBlockAsynchronouslyOnMainThread();
  }
}

void __62__AXVoiceOverPunctuationController__punctuationGroupsChanged___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadPunctationGroups];
  AXAssetAndDataClient();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = +[AXAccessQueue mainAccessQueue];
  [v2 sendAsynchronousMessage:&__NSDictionary0__struct withIdentifier:3 targetAccessQueue:v1 completion:0];
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AXVoiceOverPunctuationController;
  [(AXVoiceOverPunctuationController *)&v4 dealloc];
}

- (void)willResignActive
{
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AXVoiceOverPunctuationController;
  -[AXVoiceOverPunctuationController viewWillAppear:](&v5, "viewWillAppear:");
  [(AXVoiceOverPunctuationController *)self _configureEditButton:v3];
  [(AXVoiceOverPunctuationController *)self _updateEditingStatusForSpecifiers:v3];
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  objc_super v4 = [(AXVoiceOverPunctuationController *)self specifierAtIndexPath:a4];
  objc_super v5 = [v4 propertyForKey:@"PunctuationGroup"];
  unsigned int v6 = [v5 isSystemPunctuationGroup] ^ 1;
  if (v5) {
    BOOL v7 = v6;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  objc_super v4 = [(AXVoiceOverPunctuationController *)self specifierAtIndexPath:a4];
  objc_super v5 = [v4 propertyForKey:@"PunctuationGroup"];
  unsigned int v6 = [v5 isSystemPunctuationGroup] ^ 1;
  if (v5) {
    int64_t v7 = v6;
  }
  else {
    int64_t v7 = 0;
  }

  return v7;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    unsigned int v6 = [(AXVoiceOverPunctuationController *)self specifierAtIndexPath:a5];
    int64_t v7 = [v6 propertyForKey:@"PunctuationGroup"];
    unsigned __int8 v8 = [v7 isSystemPunctuationGroup];
    if (v7 && (v8 & 1) == 0)
    {
      uint64_t v9 = +[AXSettings sharedInstance];
      v10 = [v9 voiceOverPunctuationGroup];
      unsigned int v11 = [v7 uuid];
      unsigned int v12 = [v10 isEqual:v11];

      if (v12)
      {
        v13 = +[AXSettings sharedInstance];
        [v13 setVoiceOverPunctuationGroup:0];
      }
      [(AXVoiceOverPunctuationController *)self setIgnoreGroupsChangedNotification:1];
      v14 = +[AXSSPunctuationManager sharedDatabase];
      [v14 removePunctuationGroup:v7];

      [(AXVoiceOverPunctuationController *)self beginUpdates];
      id v15 = [(AXVoiceOverPunctuationBaseController *)self customPunctuationGroups];
      id v16 = [v15 count];

      if (!v16)
      {
        id v17 = [(AXVoiceOverPunctuationController *)self specifierForID:@"CustomPunctuationGroup"];
        [(NSMutableArray *)self->_customPunctuationSpecs removeObject:v17];
        [(AXVoiceOverPunctuationController *)self removeSpecifier:v17 animated:1];
      }
      uint64_t v18 = AXLogPunctuationStorage();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v21 = 138412290;
        uint64_t v22 = v7;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "remove group: %@", (uint8_t *)&v21, 0xCu);
      }

      id v19 = AXLogPunctuationStorage();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = [(AXVoiceOverPunctuationBaseController *)self customPunctuationGroups];
        int v21 = 138412290;
        uint64_t v22 = v20;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "existing groups: %@", (uint8_t *)&v21, 0xCu);
      }
      [(NSMutableArray *)self->_customPunctuationSpecs removeObject:v6];
      [(AXVoiceOverPunctuationController *)self removeSpecifier:v6 animated:1];
      [(AXVoiceOverPunctuationController *)self endUpdates];
    }
  }
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  [(AXVoiceOverPunctuationController *)self setEditing:1 animated:1];

  [(AXVoiceOverPunctuationController *)self _configureEditButton:1];
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  [(AXVoiceOverPunctuationController *)self setEditing:0 animated:1];

  [(AXVoiceOverPunctuationController *)self _configureEditButton:1];
}

- (void)_addDoneButton
{
  id v4 = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_donePressed"];
  BOOL v3 = [(AXVoiceOverPunctuationController *)self navigationItem];
  [v3 setRightBarButtonItem:v4];
}

- (void)_configureEditButton:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(AXVoiceOverPunctuationController *)self specifiers];
  unsigned int v6 = objc_msgSend(v5, "ax_filteredArrayUsingBlock:", &__block_literal_global_382);
  id v7 = [v6 count];

  if ((uint64_t)v7 < 1)
  {
    id v8 = [(AXVoiceOverPunctuationController *)self navigationItem];
    [v8 setRightBarButtonItem:0];
  }
  else
  {
    if ([(AXVoiceOverPunctuationController *)self isEditing])
    {
      [(AXVoiceOverPunctuationController *)self _addDoneButton];
      goto LABEL_7;
    }
    id v8 = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:2 target:self action:"_editPressed"];
    uint64_t v9 = [(AXVoiceOverPunctuationController *)self navigationItem];
    [v9 setRightBarButtonItem:v8];
  }
LABEL_7:

  [(AXVoiceOverPunctuationController *)self _updateEditingStatusForSpecifiers:v3];
}

BOOL __57__AXVoiceOverPunctuationController__configureEditButton___block_invoke(id a1, PSSpecifier *a2, unint64_t a3, BOOL *a4)
{
  id v4 = [(PSSpecifier *)a2 propertyForKey:@"CustomGroup", a4];
  unsigned __int8 v5 = [v4 BOOLValue];

  return v5;
}

- (void)_updateEditingStatusForSpecifiers:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(AXVoiceOverPunctuationController *)self isEditing];
  [(AXVoiceOverPunctuationController *)self beginUpdates];
  id v11 = [(AXVoiceOverPunctuationController *)self specifierForID:@"NewPunctuation"];
  uint64_t v6 = v5 ^ 1;
  id v7 = +[NSNumber numberWithInt:v6];
  uint64_t v8 = PSEnabledKey;
  [v11 setProperty:v7 forKey:PSEnabledKey];

  [(AXVoiceOverPunctuationController *)self reloadSpecifier:v11 animated:v3];
  uint64_t v9 = [(AXVoiceOverPunctuationController *)self specifierForID:@"ImportPunctuation"];
  v10 = +[NSNumber numberWithInt:v6];
  [v9 setProperty:v10 forKey:v8];

  [(AXVoiceOverPunctuationController *)self reloadSpecifier:v9 animated:1];
  [(AXVoiceOverPunctuationController *)self endUpdates];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)AXVoiceOverPunctuationController;
  -[AXVoiceOverPunctuationController setEditing:animated:](&v6, "setEditing:animated:", a3);
  [(AXVoiceOverPunctuationController *)self _updateEditingStatusForSpecifiers:v4];
  [(AXVoiceOverPunctuationController *)self _configureEditButton:v4];
}

- (void)_editPressed
{
  [(AXVoiceOverPunctuationController *)self setEditing:1 animated:1];

  [(AXVoiceOverPunctuationController *)self _addDoneButton];
}

- (void)_donePressed
{
  [(AXVoiceOverPunctuationController *)self setEditing:0 animated:1];
  BOOL v3 = [(AXVoiceOverPunctuationController *)self table];
  [v3 setEditing:0 animated:1];

  id v4 = [(AXVoiceOverPunctuationController *)self table];
  [v4 reloadData];
}

- (AXSSPunctuationGroup)testingInitialPunctuationGroup
{
  return self->_testingInitialPunctuationGroup;
}

- (void)setTestingInitialPunctuationGroup:(id)a3
{
}

- (BOOL)ignoreGroupsChangedNotification
{
  return self->_ignoreGroupsChangedNotification;
}

- (void)setIgnoreGroupsChangedNotification:(BOOL)a3
{
  self->_ignoreGroupsChangedNotification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testingInitialPunctuationGroup, 0);
  objc_storeStrong((id *)&self->_docPicker, 0);
  objc_storeStrong((id *)&self->_systemPunctuationSpecs, 0);

  objc_storeStrong((id *)&self->_customPunctuationSpecs, 0);
}

@end