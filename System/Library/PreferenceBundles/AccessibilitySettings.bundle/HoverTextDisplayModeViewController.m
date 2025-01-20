@interface HoverTextDisplayModeViewController
- (BOOL)_axIsDisplayTypingMode;
- (HoverTextDisplayModeViewController)init;
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation HoverTextDisplayModeViewController

- (HoverTextDisplayModeViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)HoverTextDisplayModeViewController;
  v2 = [(HoverTextDisplayModeViewController *)&v5 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_handleSpecificHardwareKeyboard:" name:_UIDeviceHardwareKeyboardAvailabilityDidChangeNotification object:0];
  }
  return v2;
}

- (id)specifiers
{
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v17 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    objc_super v5 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", &off_229C48, 0);
    if (GSEventIsHardwareKeyboardAttached()
      || ![(HoverTextDisplayModeViewController *)self _axIsDisplayTypingMode])
    {
      [v5 addObject:&off_229C60];
    }
    if ([(HoverTextDisplayModeViewController *)self _axIsDisplayTypingMode])
    {
      [v5 addObject:&off_229C78];
      [v5 addObject:&off_229C90];
    }
    else
    {
      [v5 insertObject:&off_229CA8 atIndex:0];
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = v5;
    id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v20;
      uint64_t v9 = PSTitleKey;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v12 = hoverTextDisplayModeLocString((unint64_t)[v11 integerValue]);
          v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:0 cell:3 edit:0];

          [v13 setProperty:v11 forKey:@"HTDisplayMode"];
          v14 = hoverTextDisplayModeLocString((unint64_t)[v11 integerValue]);
          [v13 setProperty:v14 forKey:v9];

          [v13 setCellType:3];
          [v4 addObject:v13];
        }
        id v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }

    v15 = *(void **)&self->AXUISettingsBaseListController_opaque[v17];
    *(void *)&self->AXUISettingsBaseListController_opaque[v17] = v4;

    v3 = *(void **)&self->AXUISettingsBaseListController_opaque[v17];
  }

  return v3;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6 = a4;
  unsigned __int8 v7 = [(HoverTextDisplayModeViewController *)self _axIsDisplayTypingMode];
  uint64_t v8 = +[AXSettings sharedInstance];
  uint64_t v9 = v8;
  if (v7) {
    id v10 = [v8 hoverTextTypingDisplayMode];
  }
  else {
    id v10 = [v8 hoverTextDisplayMode];
  }
  v11 = +[NSNumber numberWithLong:v10];

  id v15 = v6;
  v12 = [v15 specifier];
  v13 = [v12 propertyForKey:@"HTDisplayMode"];
  id v14 = [v13 isEqual:v11];

  [v15 setChecked:v14];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HoverTextDisplayModeViewController;
  [(HoverTextDisplayModeViewController *)&v13 tableView:a3 didSelectRowAtIndexPath:v6];
  unsigned __int8 v7 = [(HoverTextDisplayModeViewController *)self specifierAtIndex:[(HoverTextDisplayModeViewController *)self indexForIndexPath:v6]];
  uint64_t v8 = [v7 propertyForKey:@"HTDisplayMode"];
  id v9 = [v8 integerValue];

  unsigned int v10 = [(HoverTextDisplayModeViewController *)self _axIsDisplayTypingMode];
  v11 = +[AXSettings sharedInstance];
  v12 = v11;
  if (v10) {
    [v11 setHoverTextTypingDisplayMode:v9];
  }
  else {
    [v11 setHoverTextDisplayMode:v9];
  }

  [(HoverTextDisplayModeViewController *)self updateTableCheckedSelection:v6];
}

- (BOOL)_axIsDisplayTypingMode
{
  v2 = [(HoverTextDisplayModeViewController *)self specifier];
  v3 = [v2 propertyForKey:PSIDKey];

  LOBYTE(v2) = [v3 isEqualToString:@"HoverTextTypingDisplayMode"];
  return (char)v2;
}

@end