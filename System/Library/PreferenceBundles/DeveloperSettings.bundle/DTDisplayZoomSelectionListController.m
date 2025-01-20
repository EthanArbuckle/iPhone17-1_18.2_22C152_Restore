@interface DTDisplayZoomSelectionListController
- (id)specifiers;
- (unint64_t)selectedDisplayZoomOption;
- (void)_updateNavigationButtonStateWithNewOption:(unint64_t)a3;
- (void)_userDidConfirmDisplayZoomModeWithSpecifier:(id)a3;
- (void)_userDidSelectSpecifier:(id)a3;
- (void)setSelectedDisplayZoomOption:(unint64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation DTDisplayZoomSelectionListController

- (void)viewDidLoad
{
  v24.receiver = self;
  v24.super_class = (Class)DTDisplayZoomSelectionListController;
  [(DTDisplayZoomSelectionListController *)&v24 viewDidLoad];
  objc_initWeak(&location, self);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_5D64;
  v21[3] = &unk_34B70;
  objc_copyWeak(&v22, &location);
  v3 = objc_retainBlock(v21);
  id v4 = objc_alloc((Class)UIBarButtonItem);
  v5 = sub_1A030(@"SET");
  v6 = +[UIAction actionWithTitle:v5 image:0 identifier:0 handler:v3];
  id v7 = [v4 initWithPrimaryAction:v6];
  v8 = [(DTDisplayZoomSelectionListController *)self navigationItem];
  [v8 setRightBarButtonItem:v7];

  v9 = +[UIDevice currentDevice];
  LODWORD(v6) = objc_msgSend(v9, "sf_isiPad");

  if (v6)
  {
    id v10 = objc_alloc((Class)UIBarButtonItem);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_5F88;
    v19[3] = &unk_34B70;
    objc_copyWeak(&v20, &location);
    v11 = +[UIAction actionWithHandler:v19];
    id v12 = [v10 initWithBarButtonSystemItem:1 primaryAction:v11];
    v13 = [(DTDisplayZoomSelectionListController *)self navigationItem];
    [v13 setLeftBarButtonItem:v12];

    objc_destroyWeak(&v20);
  }
  v14 = +[DBSDisplayZoomConfigurationController defaultController];
  v15 = [v14 currentDisplayZoomMode];
  -[DTDisplayZoomSelectionListController _updateNavigationButtonStateWithNewOption:](self, "_updateNavigationButtonStateWithNewOption:", [v15 displayZoomOption]);

  v16 = sub_1A030(@"DISPLAY_ZOOM");
  [(DTDisplayZoomSelectionListController *)self setTitle:v16];

  v17 = +[DBSDisplayZoomConfigurationController defaultController];
  v18 = [v17 currentDisplayZoomMode];
  -[DTDisplayZoomSelectionListController setSelectedDisplayZoomOption:](self, "setSelectedDisplayZoomOption:", [v18 displayZoomOption]);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)DTDisplayZoomSelectionListController;
  [(DTDisplayZoomSelectionListController *)&v13 viewDidAppear:a3];
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 bundleURL];

  id v6 = objc_alloc((Class)_NSLocalizedStringResource);
  id v7 = +[NSLocale currentLocale];
  id v8 = [v6 initWithKey:@"DEVELOPER" table:@"DTSettings" locale:v7 bundleURL:v5];

  id v9 = objc_alloc((Class)_NSLocalizedStringResource);
  id v10 = +[NSLocale currentLocale];
  id v11 = [v9 initWithKey:@"DISPLAY_ZOOM" table:@"DTDisplayZoom" locale:v10 bundleURL:v5];

  id v12 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Developer/MAGNIFY"];
  [(DTDisplayZoomSelectionListController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.developer-tools" title:v11 localizedNavigationComponents:&__NSArray0__struct deepLink:v12];
}

- (id)specifiers
{
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v22 = OBJC_IVAR___PSListController__specifiers;
    id v4 = +[NSMutableArray array];
    v5 = +[PSSpecifier groupSpecifierWithID:@"DISPLAY_ZOOM" name:&stru_35910];
    [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:PSIsRadioGroupKey];
    objc_super v24 = v5;
    [v4 addObject:v5];
    id v6 = +[DBSDisplayZoomConfigurationController defaultController];
    id v7 = [v6 displayZoomModes];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_640C;
    v29[3] = &unk_34B98;
    v23 = self;
    v29[4] = self;
    id v8 = objc_msgSend(v7, "na_dictionaryByMappingValues:", v29);

    id v9 = +[DBSDisplayZoomConfigurationController defaultController];
    id v10 = [v9 currentDisplayZoomMode];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v11 = [&off_38378 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v26;
      uint64_t v14 = PSRadioGroupCheckedSpecifierKey;
      do
      {
        v15 = 0;
        do
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(&off_38378);
          }
          id v16 = [*(id *)(*((void *)&v25 + 1) + 8 * (void)v15) unsignedIntegerValue];
          v17 = DBSStringForDisplayZoomOption();
          v18 = [v8 objectForKeyedSubscript:v17];
          if (v16 == [v10 displayZoomOption]) {
            [v24 setObject:v18 forKeyedSubscript:v14];
          }
          objc_msgSend(v4, "na_safeAddObject:", v18);

          v15 = (char *)v15 + 1;
        }
        while (v12 != v15);
        id v12 = [&off_38378 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v12);
    }
    v19 = *(void **)&v23->PSListController_opaque[v22];
    *(void *)&v23->PSListController_opaque[v22] = v4;
    id v20 = v4;

    v3 = *(void **)&v23->PSListController_opaque[v22];
  }

  return v3;
}

- (void)_userDidSelectSpecifier:(id)a3
{
  id v4 = a3;
  id v7 = [v4 objectForKeyedSubscript:@"displayZoomMode"];
  v5 = [(DTDisplayZoomSelectionListController *)self specifierForID:@"DISPLAY_ZOOM"];
  [v5 setProperty:v4 forKey:PSRadioGroupCheckedSpecifierKey];

  id v6 = [(DTDisplayZoomSelectionListController *)self specifierForID:@"DISPLAY_ZOOM"];
  [(DTDisplayZoomSelectionListController *)self reloadSpecifier:v6 animated:1];

  -[DTDisplayZoomSelectionListController _updateNavigationButtonStateWithNewOption:](self, "_updateNavigationButtonStateWithNewOption:", [v7 displayZoomOption]);
}

- (void)_updateNavigationButtonStateWithNewOption:(unint64_t)a3
{
  v5 = +[DBSDisplayZoomConfigurationController defaultController];
  id v6 = [v5 currentDisplayZoomMode];
  id v7 = [v6 displayZoomOption];

  [(DTDisplayZoomSelectionListController *)self setSelectedDisplayZoomOption:a3];
  id v9 = [(DTDisplayZoomSelectionListController *)self navigationItem];
  id v8 = [v9 rightBarButtonItem];
  [v8 setEnabled:v7 != (id)a3];
}

- (void)_userDidConfirmDisplayZoomModeWithSpecifier:(id)a3
{
  v3 = [(DTDisplayZoomSelectionListController *)self specifierForID:@"DISPLAY_ZOOM"];
  id v7 = [v3 objectForKeyedSubscript:PSRadioGroupCheckedSpecifierKey];

  id v4 = [v7 objectForKeyedSubscript:@"displayZoomMode"];
  v5 = +[DBSDisplayZoomConfigurationController defaultController];
  id v6 = +[NSURL URLWithString:@"prefs:root=DEVELOPER_SETTINGS&path=MAGNIFY"];
  [v5 setDisplayZoomMode:v4 withRelaunchURL:v6];
}

- (unint64_t)selectedDisplayZoomOption
{
  return self->_selectedDisplayZoomOption;
}

- (void)setSelectedDisplayZoomOption:(unint64_t)a3
{
  self->_selectedDisplayZoomOption = a3;
}

@end