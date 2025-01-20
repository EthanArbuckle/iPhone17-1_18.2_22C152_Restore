@interface AXCaptioningThemeController
- (AXCaptioningThemeController)initWithNibName:(id)a3 bundle:(id)a4;
- (BOOL)_profileOverridesStyle:(__CFString *)a3;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (NSMutableArray)customProfiles;
- (NSMutableArray)defaultProfiles;
- (id)_videoOverridesStyle:(id)a3;
- (id)specifiers;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_addEditButton;
- (void)_donePressed;
- (void)_editPressed;
- (void)_resetActiveProfileToDefault;
- (void)_selectProfile:(id)a3;
- (void)_setVideoOverridesStyle:(id)a3 specifier:(id)a4;
- (void)_themeCountChanged:(id)a3;
- (void)dealloc;
- (void)setCustomProfiles:(id)a3;
- (void)setDefaultProfiles:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AXCaptioningThemeController

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AXCaptioningThemeController;
  [(AXCaptioningThemeController *)&v4 dealloc];
}

- (AXCaptioningThemeController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AXCaptioningThemeController;
  objc_super v4 = [(AXCaptionStyleChooserController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"_themeCountChanged:" name:@"AXThemeCountChangedNotification" object:0];

    v6 = v4;
  }

  return v4;
}

- (void)_themeCountChanged:(id)a3
{
  objc_super v4 = *(void **)&self->super.AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->super.AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers] = 0;

  [(AXCaptioningThemeController *)self setCustomProfiles:0];
  [(AXCaptioningThemeController *)self setDefaultProfiles:0];

  [(AXCaptioningThemeController *)self reloadSpecifiers];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  if (!*(void *)&self->super.AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers])
  {
    editableVisibleSpecifiers = self->_editableVisibleSpecifiers;
    if (editableVisibleSpecifiers)
    {
      id v5 = [(NSMutableArray *)editableVisibleSpecifiers mutableCopy];
      v6 = *(void **)&self->super.AXUISettingsBaseListController_opaque[v3];
      *(void *)&self->super.AXUISettingsBaseListController_opaque[v3] = v5;
    }
    else
    {
      id v7 = objc_alloc_init((Class)NSMutableArray);
      uint64_t v41 = 0;
      v42 = &v41;
      uint64_t v43 = 0x3032000000;
      v44 = __Block_byref_object_copy__3;
      v45 = __Block_byref_object_dispose__3;
      id v46 = +[NSMutableArray array];
      uint64_t v35 = 0;
      v36 = &v35;
      uint64_t v37 = 0x3032000000;
      v38 = __Block_byref_object_copy__3;
      v39 = __Block_byref_object_dispose__3;
      id v40 = +[NSMutableArray array];
      objc_super v8 = (void *)MACaptionAppearancePrefCopyProfileIDs();
      v9 = [v8 sortedArrayUsingComparator:&__block_literal_global_50];

      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = __41__AXCaptioningThemeController_specifiers__block_invoke_2;
      v34[3] = &unk_20B608;
      v34[4] = self;
      v34[5] = &v35;
      v34[6] = &v41;
      [v9 enumerateObjectsUsingBlock:v34];
      v10 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:11 edit:0];
      [v10 setProperty:objc_opt_class() forKey:PSCellClassKey];
      [v10 setProperty:@"PreviewCell" forKey:PSKeyNameKey];
      [v7 addObject:v10];
      v11 = +[PSSpecifier preferenceSpecifierNamed:&stru_20F6B8 target:self set:0 get:0 detail:0 cell:0 edit:0];

      [v7 addObject:v11];
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v12 = (id)v42[5];
      id v13 = [v12 countByEnumeratingWithState:&v30 objects:v48 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v31;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v31 != v14) {
              objc_enumerationMutation(v12);
            }
            [v7 addObject:*(void *)(*((void *)&v30 + 1) + 8 * i)];
          }
          id v13 = [v12 countByEnumeratingWithState:&v30 objects:v48 count:16];
        }
        while (v13);
      }

      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v16 = (id)v36[5];
      id v17 = [v16 countByEnumeratingWithState:&v26 objects:v47 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v27;
        do
        {
          for (j = 0; j != v17; j = (char *)j + 1)
          {
            if (*(void *)v27 != v18) {
              objc_enumerationMutation(v16);
            }
            [v7 addObject:*(void *)(*((void *)&v26 + 1) + 8 * (void)j)];
          }
          id v17 = [v16 countByEnumeratingWithState:&v26 objects:v47 count:16];
        }
        while (v17);
      }

      v20 = settingsLocString(@"create.new.theme", @"Captioning");
      v21 = +[PSSpecifier preferenceSpecifierNamed:v20 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

      [v21 setProperty:@"CreateNewStyle" forKey:PSIDKey];
      [v7 addObject:v21];
      [(AXCaptioningThemeController *)self setCustomProfiles:v36[5]];
      [(AXCaptioningThemeController *)self setDefaultProfiles:v42[5]];
      v22 = *(void **)&self->super.AXUISettingsBaseListController_opaque[v3];
      *(void *)&self->super.AXUISettingsBaseListController_opaque[v3] = v7;
      id v23 = v7;

      _Block_object_dispose(&v35, 8);
      _Block_object_dispose(&v41, 8);
    }
  }
  v24 = *(void **)&self->super.AXUISettingsBaseListController_opaque[v3];

  return v24;
}

int64_t __41__AXCaptioningThemeController_specifiers__block_invoke(id a1, id a2, id a3)
{
  id v3 = a3;
  objc_super v4 = (void *)MACaptionAppearancePrefCopyProfileOrder();
  id v5 = (void *)MACaptionAppearancePrefCopyProfileOrder();

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass())) {
    int64_t v6 = (int64_t)[v4 compare:v5];
  }
  else {
    int64_t v6 = -1;
  }

  return v6;
}

uint64_t __41__AXCaptioningThemeController_specifiers__block_invoke_2(void *a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 isEqualToString:@"MACaptionProfile-ContentProvided"];
  id v4 = v9;
  if ((v3 & 1) == 0)
  {
    id v5 = (void *)MACaptionAppearancePrefCopyProfileName();
    int64_t v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:a1[4] set:0 get:0 detail:0 cell:4 edit:0];
    [v6 setProperty:v5 forKey:PSTitleKey];
    [v6 setProperty:v9 forKey:@"CaptionProfileID"];
    [v6 setProperty:&__kCFBooleanTrue forKey:@"IsCaptionProfile"];
    [v6 setCellType:3];
    if (MACaptionAppearancePrefIsProfileEditable()) {
      uint64_t v7 = a1[5];
    }
    else {
      uint64_t v7 = a1[6];
    }
    [*(id *)(*(void *)(v7 + 8) + 40) addObject:v6];

    id v4 = v9;
  }

  return _objc_release_x1(v3, v4);
}

- (void)_resetActiveProfileToDefault
{
  if (AXCaptionResetDefaultActiveProfile())
  {
    [(AXCaptioningThemeController *)self reload];
  }
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)AXCaptioningThemeController;
  [(AXCaptioningThemeController *)&v6 viewDidLoad];
  active = (void *)MACaptionAppearancePrefCopyActiveProfileID();
  id v4 = (void *)MACaptionAppearancePrefCopyProfileIDs();
  id v5 = v4;
  if (!active || ([v4 containsObject:active] & 1) == 0) {
    [(AXCaptioningThemeController *)self _resetActiveProfileToDefault];
  }
}

- (BOOL)_profileOverridesStyle:(__CFString *)a3
{
  CFBooleanRef v3 = (CFBooleanRef)MACaptionAppearancePrefCopyVideoOverrideForegroundColor();
  CFBooleanRef v4 = (CFBooleanRef)MACaptionAppearancePrefCopyVideoOverrideBackgroundColor();
  CFBooleanRef v5 = (CFBooleanRef)MACaptionAppearancePrefCopyVideoOverrideWindowColor();
  CFBooleanRef v6 = (CFBooleanRef)MACaptionAppearancePrefCopyVideoOverrideForegroundOpacity();
  CFBooleanRef v7 = (CFBooleanRef)MACaptionAppearancePrefCopyVideoOverrideBackgroundOpacity();
  CFBooleanRef v8 = (CFBooleanRef)MACaptionAppearancePrefCopyVideoOverrideWindowOpacity();
  CFBooleanRef v9 = (CFBooleanRef)MACaptionAppearancePrefCopyVideoOverrideRelativeCharSize();
  CFBooleanRef v10 = (CFBooleanRef)MACaptionAppearancePrefCopyVideoOverrideTextEdgeStyle();
  CFBooleanRef v11 = (CFBooleanRef)MACaptionAppearancePrefCopyVideoOverrideFontForStyle();
  if (v3) {
    CFRelease(v3);
  }
  if (v4) {
    CFRelease(v4);
  }
  if (v5) {
    CFRelease(v5);
  }
  if (v6) {
    CFRelease(v6);
  }
  if (v7) {
    CFRelease(v7);
  }
  if (v8) {
    CFRelease(v8);
  }
  if (v9) {
    CFRelease(v9);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v11) {
    CFRelease(v11);
  }
  return v3 == kCFBooleanTrue
      && v4 == kCFBooleanTrue
      && v5 == kCFBooleanTrue
      && v6 == kCFBooleanTrue
      && v7 == kCFBooleanTrue
      && v8 == kCFBooleanTrue
      && v9 == kCFBooleanTrue
      && v10 == kCFBooleanTrue
      && v11 == kCFBooleanTrue;
}

- (id)_videoOverridesStyle:(id)a3
{
  active = (void *)MACaptionAppearancePrefCopyActiveProfileID();
  if ([(AXCaptioningThemeController *)self _profileOverridesStyle:active]) {
    CFBooleanRef v5 = &__kCFBooleanTrue;
  }
  else {
    CFBooleanRef v5 = &__kCFBooleanFalse;
  }

  return v5;
}

- (void)_setVideoOverridesStyle:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  active = (const void *)MACaptionAppearancePrefCopyActiveProfileID();
  [v6 BOOLValue];
  MACaptionAppearancePrefSetVideoOverrideForegroundColor();
  [v6 BOOLValue];
  MACaptionAppearancePrefSetVideoOverrideBackgroundColor();
  [v6 BOOLValue];
  MACaptionAppearancePrefSetVideoOverrideWindowColor();
  [v6 BOOLValue];
  MACaptionAppearancePrefSetVideoOverrideForegroundOpacity();
  [v6 BOOLValue];
  MACaptionAppearancePrefSetVideoOverrideBackgroundOpacity();
  [v6 BOOLValue];
  MACaptionAppearancePrefSetVideoOverrideWindowOpacity();
  [v6 BOOLValue];
  MACaptionAppearancePrefSetVideoOverrideRelativeCharSize();
  [v6 BOOLValue];
  MACaptionAppearancePrefSetVideoOverrideTextEdgeStyle();
  for (uint64_t i = 0; i != 8; ++i)
  {
    [v6 BOOLValue];
    MACaptionAppearancePrefSetVideoOverrideFontForStyle();
  }
  if (active) {
    CFRelease(active);
  }
}

- (void)_selectProfile:(id)a3
{
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)AXCaptioningThemeController;
  [(AXCaptioningThemeController *)&v20 tableView:v6 didSelectRowAtIndexPath:v7];
  CFBooleanRef v8 = [v6 cellForRowAtIndexPath:v7];
  if ([v8 isCaptionProfile])
  {
    CFBooleanRef v9 = [v8 specifier];
    CFBooleanRef v10 = [v9 propertyForKey:@"CaptionProfileID"];
    [(AXCaptioningThemeController *)self _selectProfile:v10];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    CFBooleanRef v11 = objc_msgSend(v6, "visibleCells", 0);
    id v12 = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * (void)v15) setChecked:0];
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v13);
    }

    [v8 setChecked:1];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)AXCaptioningThemeController;
  [(AXCaptioningThemeController *)&v14 viewWillAppear:a3];
  [(AXCaptioningThemeController *)self _addEditButton];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  CFBooleanRef v4 = [(AXCaptioningThemeController *)self table];
  CFBooleanRef v5 = [v4 visibleCells];

  id v6 = (char *)[v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          AXPerformBlockOnMainThreadAfterDelay();
        }
      }
      id v7 = (char *)[v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

void __46__AXCaptioningThemeController_viewWillAppear___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) captionPreviewView];
  [v1 updateSubtitle];
}

- (void)_addEditButton
{
  CFBooleanRef v3 = [(AXCaptioningThemeController *)self customProfiles];
  id v4 = [v3 count];

  if (v4)
  {
    if (([*(id *)&self->super.AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__table] isEditing] & 1) == 0)
    {
      id v7 = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:2 target:self action:"_editPressed"];
      id v6 = [(AXCaptioningThemeController *)self navigationItem];
      [v6 setRightBarButtonItem:v7];
    }
  }
  else
  {
    CFBooleanRef v5 = [(AXCaptioningThemeController *)self navigationItem];
    [v5 setRightBarButtonItem:0];

    [(AXCaptioningThemeController *)self setEditing:0 animated:1];
  }
}

- (void)_editPressed
{
  [(AXCaptioningThemeController *)self setEditing:1 animated:1];
  id v4 = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_donePressed"];
  CFBooleanRef v3 = [(AXCaptioningThemeController *)self navigationItem];
  [v3 setRightBarButtonItem:v4];
}

- (void)_donePressed
{
  [(AXCaptioningThemeController *)self setEditing:0 animated:1];

  [(AXCaptioningThemeController *)self _addEditButton];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  self->_isEditingTable = a3;
  [(AXCaptioningThemeController *)self _manageHiddenSpecifiers:a4 editing:a3];
  uint64_t v7 = OBJC_IVAR___PSListController__table;
  [*(id *)&self->super.AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__table] beginUpdates];
  v8.receiver = self;
  v8.super_class = (Class)AXCaptioningThemeController;
  [(AXCaptioningThemeController *)&v8 setEditing:v5 animated:v4];
  [*(id *)&self->super.AXUISettingsBaseListController_opaque[v7] endUpdates];
  [*(id *)&self->super.AXUISettingsBaseListController_opaque[v7] setEditing:v5 animated:v4];
  [*(id *)&self->super.AXUISettingsBaseListController_opaque[v7] reloadData];
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  BOOL v4 = [(AXCaptioningThemeController *)self specifierAtIndexPath:a4];
  BOOL v5 = [v4 propertyForKey:PSIDKey];
  id v6 = [v4 propertyForKey:PSCellClassKey];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    LOBYTE(v8) = 1;
  }
  else if ([v5 isEqualToString:@"VideoOverridesStyleSwitch"])
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    unsigned int v8 = [v5 isEqualToString:@"VideoOverridesStyleGroup"] ^ 1;
  }

  return v8;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [v9 section];
  if ((uint64_t)v10 < (uint64_t)[v8 numberOfSections])
  {
    id v11 = [v9 row];
    if ((uint64_t)v11 < (uint64_t)objc_msgSend(v8, "numberOfRowsInSection:", objc_msgSend(v9, "section")))
    {
      if (a4 == 1)
      {
        long long v26 = [(AXCaptioningThemeController *)self specifierAtIndexPath:v9];
        uint64_t v12 = [v26 propertyForKey:@"CaptionProfileID"];
        uint64_t active = MACaptionAppearancePrefCopyActiveProfileID();
        v25 = (void *)v12;
        MACaptionAppearancePrefRemoveProfile();
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v13 = (id)MACaptionAppearancePrefCopyProfileIDs();
        objc_super v14 = (char *)[v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v14)
        {
          v15 = v14;
          uint64_t v16 = *(void *)v28;
          uint64_t v17 = 1;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v28 != v16) {
                objc_enumerationMutation(v13);
              }
              if (MACaptionAppearancePrefIsProfileEditable())
              {
                +[NSNumber numberWithInteger:v17];
                MACaptionAppearancePrefSetProfileOrder();
                ++v17;
              }
            }
            v15 = (char *)[v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
          }
          while (v15);
        }

        objc_super v20 = (void *)active;
        long long v19 = v25;
        if ([v25 isEqualToString:active]) {
          [(AXCaptioningThemeController *)self _resetActiveProfileToDefault];
        }
        -[AXCaptioningThemeController removeSpecifier:animated:](self, "removeSpecifier:animated:", v26, 1, active, v25);
        v21 = [(AXCaptioningThemeController *)self customProfiles];
        [v21 removeObject:v26];

        [(AXCaptionStyleChooserController *)self scrollViewDidScroll:v8];
      }
      v22 = [(AXCaptioningThemeController *)self customProfiles];
      id v23 = [v22 count];

      if (!v23) {
        AXPerformBlockOnMainThreadAfterDelay();
      }
    }
  }
}

id __78__AXCaptioningThemeController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _donePressed];
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  BOOL v4 = [(AXCaptioningThemeController *)self specifierAtIndexPath:a4];
  unsigned int v5 = [v4 isEditableCaptionProfile];

  return v5;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  BOOL v4 = [(AXCaptioningThemeController *)self specifierAtIndexPath:a4];
  unsigned int v5 = [v4 propertyForKey:PSIDKey];
  if (([v4 isCaptionProfile] & 1) != 0
    || ([v5 isEqualToString:@"CreateNewStyle"] & 1) != 0)
  {
    char isKindOfClass = 1;
  }
  else
  {
    uint64_t v7 = [v4 propertyForKey:PSCellClassKey];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v7 = [(AXCaptioningThemeController *)self specifierAtIndexPath:a4];
  unsigned int v5 = objc_alloc_init(AXCaptioningThemeStyleController);
  id v6 = [(AXCaptioningThemeController *)self rootController];
  [(AXCaptioningThemeStyleController *)v5 setRootController:v6];

  [(AXCaptioningThemeStyleController *)v5 setSpecifier:0];
  [(AXCaptioningThemeStyleController *)v5 setParentController:self];
  [(AXCaptioningThemeStyleController *)v5 setShouldSaveProfile:1];
  -[AXCaptioningThemeStyleController setProfileId:](v5, "setProfileId:", [v7 propertyForKey:@"CaptionProfileID"]);
  [(AXCaptioningThemeController *)self showController:v5 animate:1];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)AXCaptioningThemeController;
  [(AXCaptionStyleChooserController *)&v20 tableView:a3 willDisplayCell:v8 forRowAtIndexPath:a5];
  id v9 = v8;
  if ([v9 isCaptionProfile])
  {
    id v10 = [v9 specifier];
    uint64_t active = (void *)MACaptionAppearancePrefCopyActiveProfileID();
    [v10 propertyForKey:@"CaptionProfileID"];
    uint64_t v12 = (void *)MACaptionAppearancePrefCopyProfileName();
    id v13 = [v9 titleLabel];
    [v13 setText:v12];

    BOOL v16 = 0;
    if (!self->_isEditingTable)
    {
      objc_super v14 = [v10 propertyForKey:@"CaptionProfileID"];
      unsigned __int8 v15 = [v14 isEqualToString:active];

      if (v15) {
        BOOL v16 = 1;
      }
    }
    [v9 setChecked:v16];
    if (self->_isEditingTable && [v9 isEditableCaptionProfile]) {
      [v9 setEditingAccessoryType:4];
    }
  }
  uint64_t v17 = [v9 specifier];
  long long v18 = [v17 propertyForKey:PSIDKey];

  if (([v18 isEqualToString:@"CreateNewStyle"] & 1) != 0
    || [v9 isCaptionProfile] && !objc_msgSend(v9, "isEditableCaptionProfile")
    || [v18 isEqualToString:@"VideoOverridesStyleSwitch"])
  {
    long long v19 = [v9 titleLabel];
    [v19 setEnabled:!self->_isEditingTable];

    [v9 setUserInteractionEnabled:!self->_isEditingTable];
  }
}

- (NSMutableArray)customProfiles
{
  return self->_customProfiles;
}

- (void)setCustomProfiles:(id)a3
{
}

- (NSMutableArray)defaultProfiles
{
  return self->_defaultProfiles;
}

- (void)setDefaultProfiles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultProfiles, 0);
  objc_storeStrong((id *)&self->_customProfiles, 0);
  objc_storeStrong((id *)&self->_editableVisibleSpecifiers, 0);

  objc_storeStrong((id *)&self->_editableHiddenSpecifiers, 0);
}

@end