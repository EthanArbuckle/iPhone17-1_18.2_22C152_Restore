@interface HoverTextFontPickerViewController
- (BOOL)_isDisallowedFontFamily:(id)a3;
- (BOOL)_isLargeTextTypingController;
- (NSString)selectedFont;
- (id)specifiers;
- (void)_updateCheckmarkForCell:(id)a3;
- (void)setSelectedFont:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateTableCheckedSelection:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HoverTextFontPickerViewController

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HoverTextFontPickerViewController;
  [(HoverTextFontPickerViewController *)&v8 viewWillAppear:a3];
  unsigned int v4 = [(HoverTextFontPickerViewController *)self _isLargeTextTypingController];
  v5 = +[AXSettings sharedInstance];
  v6 = v5;
  if (v4) {
    [v5 hoverTextTypingFontName];
  }
  else {
  v7 = [v5 hoverTextFontName];
  }

  [(HoverTextFontPickerViewController *)self setSelectedFont:v7];
  [(HoverTextFontPickerViewController *)self reloadSpecifiers];
}

- (id)specifiers
{
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v21 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    v5 = +[PSSpecifier groupSpecifierWithID:@"DefaultGroup"];
    [v4 addObject:v5];
    v6 = settingsLocString(@"DEFAULT", @"Accessibility");
    v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:3 edit:0];

    uint64_t v22 = PSIDKey;
    objc_msgSend(v7, "setProperty:forKey:", @"DefaultFontCellID");
    [v4 addObject:v7];
    objc_super v8 = +[PSSpecifier groupSpecifierWithID:@"OtherFontsGroup"];

    v23 = v4;
    [v4 addObject:v8];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v9 = +[UIFont familyNames];
    id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v25;
      uint64_t v13 = PSCellClassKey;
      uint64_t v14 = PSTitleKey;
      do
      {
        v15 = 0;
        do
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          id v16 = *(id *)(*((void *)&v24 + 1) + 8 * (void)v15);
          if (![(HoverTextFontPickerViewController *)self _isDisallowedFontFamily:v16])
          {
            v17 = +[PSSpecifier preferenceSpecifierNamed:v16 target:self set:0 get:0 detail:0 cell:3 edit:0];

            [v17 setProperty:objc_opt_class() forKey:v13];
            [v17 setProperty:v16 forKey:v22];
            [v17 setProperty:v16 forKey:v14];
            [v17 setCellType:3];
            [v23 addObject:v17];
            objc_super v8 = v17;
          }

          v15 = (char *)v15 + 1;
        }
        while (v11 != v15);
        id v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v11);
    }

    v18 = *(void **)&self->AXUISettingsBaseListController_opaque[v21];
    *(void *)&self->AXUISettingsBaseListController_opaque[v21] = v23;
    id v19 = v23;

    v3 = *(void **)&self->AXUISettingsBaseListController_opaque[v21];
  }

  return v3;
}

- (BOOL)_isDisallowedFontFamily:(id)a3
{
  uint64_t v3 = _isDisallowedFontFamily__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_isDisallowedFontFamily__onceToken, &__block_literal_global_53);
  }
  unsigned __int8 v5 = [(id)_isDisallowedFontFamily__IrregularFontNames containsObject:v4];

  return v5;
}

void __61__HoverTextFontPickerViewController__isDisallowedFontFamily___block_invoke(id a1)
{
  uint64_t v1 = +[NSSet setWithArray:&off_22BEE8];
  uint64_t v2 = _isDisallowedFontFamily__IrregularFontNames;
  _isDisallowedFontFamily__IrregularFontNames = v1;

  _objc_release_x1(v1, v2);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HoverTextFontPickerViewController;
  [(HoverTextFontPickerViewController *)&v14 tableView:a3 didSelectRowAtIndexPath:v6];
  v7 = [(HoverTextFontPickerViewController *)self specifierAtIndex:[(HoverTextFontPickerViewController *)self indexForIndexPath:v6]];
  objc_super v8 = [v7 propertyForKey:PSIDKey];
  if ([v8 isEqualToString:@"DefaultFontCellID"]) {
    v9 = 0;
  }
  else {
    v9 = v8;
  }
  [(HoverTextFontPickerViewController *)self setSelectedFont:v9];
  unsigned int v10 = [(HoverTextFontPickerViewController *)self _isLargeTextTypingController];
  id v11 = [(HoverTextFontPickerViewController *)self selectedFont];
  uint64_t v12 = +[AXSettings sharedInstance];
  uint64_t v13 = v12;
  if (v10) {
    [v12 setHoverTextTypingFontName:v11];
  }
  else {
    [v12 setHoverTextFontName:v11];
  }

  [(HoverTextFontPickerViewController *)self updateTableCheckedSelection:v6];
}

- (void)updateTableCheckedSelection:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = objc_msgSend(*(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__table], "visibleCells", a3, 0);
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      objc_super v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(HoverTextFontPickerViewController *)self _updateCheckmarkForCell:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        objc_super v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_updateCheckmarkForCell:(id)a3
{
  id v9 = a3;
  id v4 = [v9 specifier];
  id v5 = [v4 propertyForKey:PSIDKey];

  id v6 = [(HoverTextFontPickerViewController *)self selectedFont];
  if ([v5 isEqualToString:v6])
  {

LABEL_3:
    uint64_t v7 = 1;
    goto LABEL_9;
  }
  if ([v5 isEqualToString:@"DefaultFontCellID"])
  {
    objc_super v8 = [(HoverTextFontPickerViewController *)self selectedFont];

    if (!v8) {
      goto LABEL_3;
    }
  }
  else
  {
  }
  uint64_t v7 = 0;
LABEL_9:
  [v9 setChecked:v7];
}

- (BOOL)_isLargeTextTypingController
{
  int v3 = AXHasCapability();
  if (v3)
  {
    id v4 = [(HoverTextFontPickerViewController *)self specifier];
    id v5 = [v4 propertyForKey:PSIDKey];
    unsigned __int8 v6 = [v5 isEqualToString:@"HoverTypingStyle"];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (NSString)selectedFont
{
  return self->selectedFont;
}

- (void)setSelectedFont:(id)a3
{
}

- (void).cxx_destruct
{
}

@end