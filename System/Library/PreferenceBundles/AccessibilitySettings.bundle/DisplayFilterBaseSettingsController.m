@interface DisplayFilterBaseSettingsController
- (BOOL)globalFilterEnabled;
- (DisplayFilterBaseSettingsController)init;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)specifiers;
- (unint64_t)_filterTypeForRow:(int64_t)a3;
- (unint64_t)filterCategory;
- (unint64_t)filterForCellIdentifier:(id)a3;
- (unint64_t)selectedFilter;
- (void)accessibilitySettingsDidChange;
- (void)dealloc;
- (void)setFilterCategory:(unint64_t)a3 filter:(unint64_t)a4;
- (void)setGlobalFilterEnabled:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateSystemFilter;
@end

@implementation DisplayFilterBaseSettingsController

- (DisplayFilterBaseSettingsController)init
{
  v6.receiver = self;
  v6.super_class = (Class)DisplayFilterBaseSettingsController;
  v2 = [(DisplayFilterBaseSettingsController *)&v6 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_accessibilityUpdateSettings, kMADisplayFilterSettingsChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v4 = v2;
  }

  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)DisplayFilterBaseSettingsController;
  [(DisplayFilterBaseSettingsController *)&v4 dealloc];
}

- (id)specifiers
{
  return 0;
}

- (BOOL)globalFilterEnabled
{
  return MADisplayFilterPrefGetCategoryEnabled() != 0;
}

- (unint64_t)_filterTypeForRow:(int64_t)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = *(id *)&self->AXUISettingsSetupCapableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "cellType", (void)v15) == (char *)&dword_0 + 3)
        {
          v12 = [v11 propertyForKey:@"filterOption"];
          if ([v12 length])
          {
            if (v8 == a3)
            {
              unint64_t v13 = [(DisplayFilterBaseSettingsController *)self filterForCellIdentifier:v12];

              goto LABEL_15;
            }
            ++v8;
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  unint64_t v13 = 0;
LABEL_15:

  return v13;
}

- (unint64_t)selectedFilter
{
  unint64_t v2 = [(DisplayFilterBaseSettingsController *)self filterCategory];

  return _MADisplayFilterPrefGetType(v2);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  uint64_t v8 = [(DisplayFilterBaseSettingsController *)self specifierAtIndex:[(DisplayFilterBaseSettingsController *)self indexForIndexPath:v7]];
  uint64_t v9 = [v8 propertyForKey:@"filterOption"];
  if ([v9 length])
  {
    unint64_t v10 = -[DisplayFilterBaseSettingsController _filterTypeForRow:](self, "_filterTypeForRow:", [v7 row]);
    if (v10) {
      BOOL v11 = v10 == [(DisplayFilterBaseSettingsController *)self selectedFilter];
    }
    else {
      BOOL v11 = 0;
    }
    [v12 setChecked:v11];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)DisplayFilterBaseSettingsController;
  [(DisplayFilterBaseSettingsController *)&v9 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = [(DisplayFilterBaseSettingsController *)self specifierAtIndex:[(DisplayFilterBaseSettingsController *)self indexForIndexPath:v6]];
  uint64_t v8 = [v7 propertyForKey:@"filterOption"];
  if ([v8 length])
  {
    -[DisplayFilterBaseSettingsController setFilterCategory:filter:](self, "setFilterCategory:filter:", -[DisplayFilterBaseSettingsController filterCategory](self, "filterCategory"), -[DisplayFilterBaseSettingsController _filterTypeForRow:](self, "_filterTypeForRow:", [v6 row]));
    [(DisplayFilterBaseSettingsController *)self updateSystemFilter];
  }
}

- (void)setFilterCategory:(unint64_t)a3 filter:(unint64_t)a4
{
  MADisplayFilterPrefSetType();

  __AXSGrayscaleSetEnabled(a4 == 1);
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DisplayFilterBaseSettingsController *)self indexForIndexPath:v7];
  objc_super v9 = [*(id *)&self->AXUISettingsSetupCapableListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v8];
  unint64_t v10 = [v9 propertyForKey:PSCellClassKey];
  unsigned int v11 = [v10 isEqual:objc_opt_class()];

  if (v11)
  {
    +[DisplayFilterPreviewCell previewCellHeight];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)DisplayFilterBaseSettingsController;
    [(DisplayFilterBaseSettingsController *)&v15 tableView:v6 estimatedHeightForRowAtIndexPath:v7];
  }
  double v13 = v12;

  return v13;
}

- (void)updateSystemFilter
{
  BOOL v3 = [(DisplayFilterBaseSettingsController *)self globalFilterEnabled];

  [(DisplayFilterBaseSettingsController *)self setGlobalFilterEnabled:v3];
}

- (void)setGlobalFilterEnabled:(BOOL)a3
{
  [(DisplayFilterBaseSettingsController *)self filterCategory];
  uint64_t v3 = MADisplayFilterPrefSetCategoryEnabled();

  __AXSUpdateGrayscaleEnabledCache(v3);
}

- (unint64_t)filterCategory
{
  return 0;
}

- (unint64_t)filterForCellIdentifier:(id)a3
{
  return 0;
}

- (void)accessibilitySettingsDidChange
{
  id v2 = [(DisplayFilterBaseSettingsController *)self table];
  [v2 reloadData];
}

@end