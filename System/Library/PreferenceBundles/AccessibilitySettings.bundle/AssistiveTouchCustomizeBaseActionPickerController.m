@interface AssistiveTouchCustomizeBaseActionPickerController
- (BOOL)_isIconTypeEnabled:(id)a3;
- (NSString)selectedPopoverIcon;
- (NSString)selectedPopoverLocation;
- (id)astPickerCellForRowAtIndexPath:(id)a3 tableView:(id)a4;
- (id)astTitleForSection:(int64_t)a3;
- (id)createASTIconSpecifier:(id)a3;
- (id)iconFilter;
- (id)iconForIndexPath:(id)a3;
- (id)iconSpecifiers;
- (id)localizedIconForIndexPath:(id)a3;
- (id)localizedSortedIcons:(id)a3;
- (id)prependedSystemIcons;
- (id)prependedTopIcons;
- (int64_t)astNumberOfRowsInSection:(int64_t)a3;
- (int64_t)astNumberOfSections;
- (void)astTableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)astTableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)loadView;
- (void)reloadASTDataSource;
- (void)reloadSpecifiers;
- (void)setIconFilter:(id)a3;
- (void)setSelectedPopoverIcon:(id)a3;
- (void)setSelectedPopoverLocation:(id)a3;
@end

@implementation AssistiveTouchCustomizeBaseActionPickerController

- (id)iconSpecifiers
{
  v3 = +[NSMutableArray array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obj = self->_shownIconSections;
  id v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v9 = [v8 objectForKeyedSubscript:@"title"];
        v10 = +[PSSpecifier groupSpecifierWithName:v9];
        [v3 addObject:v10];

        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        v11 = [v8 objectForKeyedSubscript:@"icons"];
        id v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v20;
          do
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = [(AssistiveTouchCustomizeBaseActionPickerController *)self createASTIconSpecifier:*(void *)(*((void *)&v19 + 1) + 8 * (void)j)];
              [v3 addObject:v16];
            }
            id v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v13);
        }
      }
      id v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v5);
  }

  return v3;
}

- (id)prependedSystemIcons
{
  return &__NSArray0__struct;
}

- (id)prependedTopIcons
{
  return &__NSArray0__struct;
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)AssistiveTouchCustomizeBaseActionPickerController;
  [(AssistiveTouchCustomizeBaseActionPickerController *)&v4 loadView];
  v3 = [(AssistiveTouchCustomizeBaseActionPickerController *)self table];
  [v3 setRowHeight:UITableViewAutomaticDimension];

  [(AssistiveTouchCustomizeBaseActionPickerController *)self reloadASTDataSource];
}

- (id)createASTIconSpecifier:(id)a3
{
  id v3 = a3;
  objc_super v4 = AXUIAssistiveTouchStringForName();
  id v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:0 set:0 get:0 detail:0 cell:3 edit:0];

  [v5 setProperty:v3 forKey:PSIDKey];

  return v5;
}

- (id)localizedSortedIcons:(id)a3
{
  return [a3 sortedArrayUsingComparator:&__block_literal_global_56];
}

int64_t __74__AssistiveTouchCustomizeBaseActionPickerController_localizedSortedIcons___block_invoke(id a1, NSString *a2, NSString *a3)
{
  id v3 = a3;
  objc_super v4 = AXUIAssistiveTouchStringForName();
  id v5 = AXUIAssistiveTouchStringForName();

  id v6 = [v4 localizedCaseInsensitiveCompare:v5];
  return (int64_t)v6;
}

- (void)reloadASTDataSource
{
  id v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  shownIconSections = self->_shownIconSections;
  self->_shownIconSections = v3;

  for (uint64_t i = 0; i != 9; ++i)
  {
    id v6 = [(AssistiveTouchCustomizeBaseActionPickerController *)self prependedTopIcons];
    v7 = v6;
    switch(i)
    {
      case 0:
        id v8 = v6;
        v9 = 0;
        break;
      case 1:
        v9 = settingsLocString(@"SystemHeading", @"HandSettings");
        v10 = [(AssistiveTouchCustomizeBaseActionPickerController *)self prependedSystemIcons];
        v11 = AXAssistiveTouchSystemIcons();
        id v12 = [(AssistiveTouchCustomizeBaseActionPickerController *)self localizedSortedIcons:v11];
        id v8 = [v10 arrayByAddingObjectsFromArray:v12];

        break;
      case 2:
        v9 = settingsLocString(@"Accessibility", @"HandSettings");
        uint64_t v13 = AXAssistiveTouchAccessibilityIcons();
        goto LABEL_13;
      case 3:
        v9 = settingsLocString(@"CustomGestureHeading", @"HandSettings");
        uint64_t v13 = AXAssistiveTouchCustomGesturesIcons();
        goto LABEL_13;
      case 4:
        v9 = settingsLocString(@"ScrollHeading", @"HandSettings");
        uint64_t v13 = AXAssistiveTouchScrollIcons();
        goto LABEL_13;
      case 5:
        v9 = settingsLocString(@"AssistiveTouchHeading", @"HandSettings");
        uint64_t v13 = AXAssistiveTouchSpecificActionIcons();
        goto LABEL_13;
      case 6:
        v9 = settingsLocString(@"DwellHeading", @"HandSettings");
        uint64_t v13 = AXAssistiveTouchDwellIcons();
        goto LABEL_13;
      case 7:
        v9 = settingsLocString(@"SiriShortcutsHeading", @"HandSettings");
        uint64_t v13 = AXAssistiveTouchSiriShortcutsIcons();
        goto LABEL_13;
      case 8:
        v9 = settingsLocString(@"EyeTrackingHeading", @"HandSettings");
        uint64_t v13 = AXAssistiveTouchEyeTrackingIcons();
LABEL_13:
        uint64_t v14 = (void *)v13;
        id v8 = [(AssistiveTouchCustomizeBaseActionPickerController *)self localizedSortedIcons:v13];

        break;
      default:
        v9 = 0;
        id v8 = 0;
        break;
    }
    if ([v8 count])
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = __72__AssistiveTouchCustomizeBaseActionPickerController_reloadASTDataSource__block_invoke;
      v17[3] = &unk_20B900;
      v17[4] = self;
      uint64_t v19 = i;
      id v18 = v7;
      v15 = [v8 axFilterObjectsUsingBlock:v17];
      if ([v15 count])
      {
        v16 = +[NSMutableDictionary dictionary];
        [v16 setObject:v15 forKeyedSubscript:@"icons"];
        [v16 setObject:v9 forKeyedSubscript:@"title"];
        [(NSMutableArray *)self->_shownIconSections addObject:v16];
      }
    }
  }
}

uint64_t __72__AssistiveTouchCustomizeBaseActionPickerController_reloadASTDataSource__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) inSetup])
  {
    if ([v3 isEqualToString:AXAssistiveTouchIconTypeCommandAndControl]) {
      goto LABEL_9;
    }
  }
  else
  {
    objc_super v4 = +[CACPreferences sharedPreferences];
    if ([v4 didShowOnboarding])
    {
    }
    else
    {
      unsigned __int8 v5 = [v3 isEqualToString:AXAssistiveTouchIconTypeCommandAndControl];

      if (v5)
      {
LABEL_9:
        uint64_t v6 = 0;
        goto LABEL_13;
      }
    }
  }
  if (*(void *)(a1 + 48) && ([*(id *)(a1 + 40) containsObject:v3] & 1) != 0) {
    goto LABEL_9;
  }
  v7 = [*(id *)(a1 + 32) iconFilter];

  unsigned int v8 = [v3 isEqualToString:AXAssistiveTouchIconTypeEyeTrackingBubbleMode];
  unsigned int v9 = [v3 isEqualToString:AXAssistiveTouchIconTypeEyeTrackingAutoHide];
  if (v7)
  {
    v10 = [*(id *)(a1 + 32) iconFilter];
    uint64_t v6 = ((uint64_t (**)(void, id))v10)[2](v10, v3);
  }
  else
  {
    uint64_t v6 = (v8 | v9) ^ 1;
  }
LABEL_13:

  return v6;
}

- (void)reloadSpecifiers
{
  [(AssistiveTouchCustomizeBaseActionPickerController *)self reloadASTDataSource];
  v3.receiver = self;
  v3.super_class = (Class)AssistiveTouchCustomizeBaseActionPickerController;
  [(AssistiveTouchCustomizeBaseActionPickerController *)&v3 reloadSpecifiers];
}

- (int64_t)astNumberOfSections
{
  return (int64_t)[(NSMutableArray *)self->_shownIconSections count];
}

- (id)astTitleForSection:(int64_t)a3
{
  objc_super v3 = [(NSMutableArray *)self->_shownIconSections objectAtIndexedSubscript:a3];
  objc_super v4 = [v3 objectForKeyedSubscript:@"title"];

  return v4;
}

- (int64_t)astNumberOfRowsInSection:(int64_t)a3
{
  objc_super v3 = [(NSMutableArray *)self->_shownIconSections objectAtIndexedSubscript:a3];
  objc_super v4 = [v3 objectForKeyedSubscript:@"icons"];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)iconForIndexPath:(id)a3
{
  shownIconSections = self->_shownIconSections;
  id v4 = a3;
  id v5 = -[NSMutableArray objectAtIndexedSubscript:](shownIconSections, "objectAtIndexedSubscript:", [v4 section]);
  uint64_t v6 = [v5 objectForKeyedSubscript:@"icons"];
  id v7 = [v4 row];

  unsigned int v8 = [v6 objectAtIndexedSubscript:v7];

  return v8;
}

- (id)localizedIconForIndexPath:(id)a3
{
  objc_super v3 = [(AssistiveTouchCustomizeBaseActionPickerController *)self iconForIndexPath:a3];
  id v4 = AXUIAssistiveTouchStringForName();

  return v4;
}

- (id)astPickerCellForRowAtIndexPath:(id)a3 tableView:(id)a4
{
  id v6 = a4;
  id v7 = [(AssistiveTouchCustomizeBaseActionPickerController *)self localizedIconForIndexPath:a3];
  id v8 = [v6 dequeueReusableCellWithIdentifier:@"row"];

  if (!v8)
  {
    id v8 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"row"];
    unsigned int v9 = [v8 textLabel];
    [v9 setNumberOfLines:0];
  }
  id v10 = [v7 rangeOfString:@"-\n"];
  if (v10 == (id)0x7FFFFFFFFFFFFFFFLL) {
    [v7 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
  }
  else {
  id v12 = objc_msgSend(v7, "stringByReplacingCharactersInRange:withString:", v10, v11, &stru_20F6B8);
  }

  uint64_t v13 = [v8 textLabel];
  [v13 setText:v12];

  return v8;
}

- (void)astTableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(AssistiveTouchCustomizeBaseActionPickerController *)self iconForIndexPath:v6];
  unsigned int v8 = [(AssistiveTouchCustomizeBaseActionPickerController *)self _isIconTypeEnabled:v7];

  if (v8)
  {
    unsigned int v9 = [(AssistiveTouchCustomizeBaseActionPickerController *)self iconForIndexPath:v6];
    [(AssistiveTouchCustomizeBaseActionPickerController *)self setSelectedPopoverIcon:v9];

    id v10 = [(AssistiveTouchCustomizeBaseActionPickerController *)self selectedPopoverIcon];
    LODWORD(v9) = [v10 isEqualToString:AXAssistiveTouchIconTypeMagnifier];

    if (v9)
    {
      uint64_t v11 = +[AXSettings sharedInstance];
      [v11 setMagnifierEnabled:1];
    }
    [v12 deselectRowAtIndexPath:v6 animated:1];
    [v12 reloadData];
  }
}

- (void)astTableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v16 = a4;
  id v7 = [(AssistiveTouchCustomizeBaseActionPickerController *)self iconForIndexPath:a5];
  unsigned int v8 = [(AssistiveTouchCustomizeBaseActionPickerController *)self selectedPopoverIcon];
  unsigned int v9 = [v7 isEqualToString:v8];

  BOOL v10 = v9 == 0;
  uint64_t v11 = 3;
  if (v10) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = 3;
  }
  [v16 setAccessoryType:v12];
  BOOL v13 = [(AssistiveTouchCustomizeBaseActionPickerController *)self _isIconTypeEnabled:v7];
  uint64_t v14 = [v16 textLabel];
  v15 = v14;
  if (!v13) {
    uint64_t v11 = 0;
  }
  [v14 setEnabled:v13];

  [v16 setSelectionStyle:v11];
}

- (BOOL)_isIconTypeEnabled:(id)a3
{
  return ![a3 isEqualToString:AXAssistiveTouchIconTypeZoomController]
      || _AXSZoomTouchEnabled() != 0;
}

- (NSString)selectedPopoverIcon
{
  return self->_selectedPopoverIcon;
}

- (void)setSelectedPopoverIcon:(id)a3
{
}

- (NSString)selectedPopoverLocation
{
  return self->_selectedPopoverLocation;
}

- (void)setSelectedPopoverLocation:(id)a3
{
}

- (id)iconFilter
{
  return self->_iconFilter;
}

- (void)setIconFilter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_iconFilter, 0);
  objc_storeStrong((id *)&self->_selectedPopoverLocation, 0);
  objc_storeStrong((id *)&self->_selectedPopoverIcon, 0);

  objc_storeStrong((id *)&self->_shownIconSections, 0);
}

@end