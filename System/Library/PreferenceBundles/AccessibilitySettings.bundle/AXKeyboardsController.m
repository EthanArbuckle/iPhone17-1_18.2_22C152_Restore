@interface AXKeyboardsController
- (AXKeyboardsController)init;
- (NSArray)stickyKeysSpecificSpecifiers;
- (id)fullKeyboardAccessEnabled:(id)a3;
- (id)hoverTextTypingEnabled:(id)a3;
- (id)keyRepeatEnabled:(id)a3;
- (id)lowercaseString:(id)a3;
- (id)slowKeysEnabled:(id)a3;
- (id)specifiers;
- (id)stickyKeysEnabled:(id)a3;
- (void)setLowerCase:(id)a3 specifier:(id)a4;
- (void)setStickyKeysSpecificSpecifiers:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AXKeyboardsController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSMutableArray array];
    if (AXHasCapability())
    {
      v6 = +[PSSpecifier emptyGroupSpecifier];
      v7 = settingsLocString(@"HOVER_TYPING_FOOTER", @"Accessibility");
      [v6 setProperty:v7 forKey:PSFooterTextGroupKey];

      [v5 addObject:v6];
      v8 = settingsLocString(@"HOVER_TYPING", @"Accessibility");
      v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:"hoverTextTypingEnabled:" detail:objc_opt_class() cell:2 edit:0];

      [v9 setProperty:@"HOVER_TYPING" forKey:PSIDKey];
      [v5 addObject:v9];
    }
    v10 = [(AXKeyboardsController *)self loadSpecifiersFromPlistName:@"KeyboardsSettings" target:self];
    [v5 axSafelyAddObjectsFromArray:v10];

    if ([v5 count])
    {
      v11 = (char *)[v5 indexOfSpecifierWithID:@"HARDWARE_KEYBOARDS"];
      v12 = [v5 objectAtIndex:v11];
      v13 = AXLocStringKeyForModel();
      v14 = settingsLocString(v13, @"FullKeyboardAccessSettings");
      uint64_t v15 = PSFooterTextGroupKey;
      [v12 setProperty:v14 forKey:PSFooterTextGroupKey];

      [v12 setProperty:&__kCFBooleanFalse forKey:PSSpecifierIsSearchableKey];
      v16 = settingsLocString(@"FULL_KEYBOARD_ACCESS", @"FullKeyboardAccessSettings");
      v17 = +[PSSpecifier preferenceSpecifierNamed:v16 target:self set:0 get:"fullKeyboardAccessEnabled:" detail:objc_opt_class() cell:2 edit:0];

      [v17 setProperty:@"FULL_KEYBOARD_ACCESS" forKey:PSIDKey];
      [v17 setProperty:objc_opt_class() forKey:PSCellClassKey];
      [v5 insertObject:v17 atIndex:v11 + 1];
      v18 = +[PSSpecifier emptyGroupSpecifier];
      v19 = settingsLocString(@"HARDWARE_KEYBOARDS_FOOTER", @"KeyboardsSettings");
      [v18 setProperty:v19 forKey:v15];

      [v5 insertObject:v18 atIndex:v11 + 2];
    }
    v20 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (AXKeyboardsController)init
{
  v13.receiver = self;
  v13.super_class = (Class)AXKeyboardsController;
  v2 = [(AXKeyboardsController *)&v13 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    uint64_t v3 = +[AXSettings sharedInstance];
    v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    v9 = __29__AXKeyboardsController_init__block_invoke;
    v10 = &unk_208798;
    objc_copyWeak(&v11, &location);
    id v4 = objc_loadWeakRetained(&location);
    [v3 registerUpdateBlock:&v7 forRetrieveSelector:"stickyKeysEnabled" withListener:v4];

    objc_destroyWeak(&v11);
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"_preferencesDidChange" name:kAXSFullKeyboardAccessEnabledNotification object:0];

    objc_destroyWeak(&location);
  }
  return v2;
}

void __29__AXKeyboardsController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _preferencesDidChange];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXKeyboardsController;
  [(AXKeyboardsController *)&v4 viewWillAppear:a3];
  [(AXKeyboardsController *)self reloadSpecifiers];
}

- (void)setLowerCase:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  __AXSSetLowercaseKeyboardDisplayEnabled(v4);
}

- (id)lowercaseString:(id)a3
{
  uint64_t v3 = _AXSLowercaseKeyboardDisplayEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (id)keyRepeatEnabled:(id)a3
{
  if (_AXSKeyRepeatEnabled()) {
    uint64_t v3 = @"ON";
  }
  else {
    uint64_t v3 = @"OFF";
  }

  return settingsLocString(v3, @"Accessibility");
}

- (id)stickyKeysEnabled:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  if ([v3 stickyKeysEnabled]) {
    id v4 = @"ON";
  }
  else {
    id v4 = @"OFF";
  }
  v5 = settingsLocString(v4, @"Accessibility");

  return v5;
}

- (id)slowKeysEnabled:(id)a3
{
  if (_AXSSlowKeysEnabled()) {
    uint64_t v3 = @"ON";
  }
  else {
    uint64_t v3 = @"OFF";
  }

  return settingsLocString(v3, @"Accessibility");
}

- (id)fullKeyboardAccessEnabled:(id)a3
{
  if (_AXSFullKeyboardAccessEnabled()) {
    uint64_t v3 = @"ON";
  }
  else {
    uint64_t v3 = @"OFF";
  }

  return settingsLocString(v3, @"Accessibility");
}

- (id)hoverTextTypingEnabled:(id)a3
{
  if (_AXSHoverTextTypingEnabled()) {
    uint64_t v3 = @"ON";
  }
  else {
    uint64_t v3 = @"OFF";
  }

  return settingsLocString(v3, @"Accessibility");
}

- (NSArray)stickyKeysSpecificSpecifiers
{
  return self->_stickyKeysSpecificSpecifiers;
}

- (void)setStickyKeysSpecificSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end