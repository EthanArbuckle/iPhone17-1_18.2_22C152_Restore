@interface MusicSettingsAtmosAudioController
- (id)itemsFromParent;
- (void)_displayDownloadsDialogIfNeededWithCompletion:(id)a3;
- (void)listItemSelected:(id)a3;
- (void)shouldSelectAtmosAlwaysOn:(id)a3 completion:(id)a4;
- (void)shouldSelectAtmosAutomatic:(id)a3 completion:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation MusicSettingsAtmosAudioController

- (void)viewDidAppear:(BOOL)a3
{
  v21.receiver = self;
  v21.super_class = (Class)MusicSettingsAtmosAudioController;
  [(MusicSettingsAtmosAudioController *)&v21 viewDidAppear:a3];
  v20 = +[NSURL URLWithString:@"prefs:root=MUSIC&path=com.apple.Music:Atmos"];
  id v4 = objc_alloc((Class)_NSLocalizedStringResource);
  v5 = +[NSLocale currentLocale];
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 bundleURL];
  id v8 = [v4 initWithKey:@"APPS" table:@"MusicSettings" locale:v5 bundleURL:v7];

  id v9 = objc_alloc((Class)_NSLocalizedStringResource);
  v10 = +[NSLocale currentLocale];
  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 bundleURL];
  id v13 = [v9 initWithKey:@"MUSIC" table:@"MusicSettings" locale:v10 bundleURL:v12];

  id v14 = objc_alloc((Class)_NSLocalizedStringResource);
  v15 = +[NSLocale currentLocale];
  v16 = +[NSBundle bundleForClass:objc_opt_class()];
  v17 = [v16 bundleURL];
  id v18 = [v14 initWithKey:@"DOLBY_ATMOS" table:@"MusicSettings" locale:v15 bundleURL:v17];

  v22[0] = v8;
  v22[1] = v13;
  v19 = +[NSArray arrayWithObjects:v22 count:2];
  [(MusicSettingsAtmosAudioController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.Music" title:v18 localizedNavigationComponents:v19 deepLink:v20];
}

- (void)shouldSelectAtmosAlwaysOn:(id)a3 completion:(id)a4
{
  id v5 = a4;
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"ATMOS_ALWAYS_ON_WARN_TITLE" value:&stru_18CF0 table:@"MusicSettings"];
  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"ATMOS_ALWAYS_ON_WARN_BODY" value:&stru_18CF0 table:@"MusicSettings"];
  v10 = +[UIAlertController alertControllerWithTitle:v7 message:v9 preferredStyle:1];

  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"ATMOS_ALWAYS_ON_WARN_CANCEL" value:&stru_18CF0 table:@"MusicSettings"];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_41A8;
  v25[3] = &unk_18720;
  v25[4] = self;
  id v13 = v5;
  id v26 = v13;
  id v14 = +[UIAlertAction actionWithTitle:v12 style:1 handler:v25];
  [v10 addAction:v14];

  v15 = +[NSBundle bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"ATMOS_ALWAYS_ON_WARN_ACCEPT" value:&stru_18CF0 table:@"MusicSettings"];
  v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  objc_super v21 = sub_4244;
  v22 = &unk_18720;
  v23 = self;
  id v24 = v13;
  id v17 = v13;
  id v18 = +[UIAlertAction actionWithTitle:v16 style:0 handler:&v19];
  objc_msgSend(v10, "addAction:", v18, v19, v20, v21, v22, v23);

  [(MusicSettingsAtmosAudioController *)self presentViewController:v10 animated:1 completion:0];
}

- (void)shouldSelectAtmosAutomatic:(id)a3 completion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_4374;
  v6[3] = &unk_186D0;
  id v7 = a4;
  id v5 = v7;
  [(MusicSettingsAtmosAudioController *)self _displayDownloadsDialogIfNeededWithCompletion:v6];
}

- (void)listItemSelected:(id)a3
{
  id v4 = a3;
  id v5 = [(MusicSettingsAtmosAudioController *)self specifierAtIndexPath:v4];
  v6 = [v5 propertyForKey:@"cellObject"];
  if (([v6 isChecked] & 1) == 0)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_4544;
    v15[3] = &unk_186A8;
    id v16 = v4;
    id v17 = self;
    id v7 = v5;
    id v18 = v7;
    id v8 = objc_retainBlock(v15);
    id v9 = [v7 propertyForKey:MusicSettingsShouldSelectAction];
    SEL v10 = NSSelectorFromString(v9);

    if (v10)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_45D4;
      v13[3] = &unk_186D0;
      id v14 = v8;
      v11 = objc_retainBlock(v13);
      id v12 = (id)MusicSettingsPerformSelector2();
    }
    else
    {
      ((void (*)(void *))v8[2])(v8);
    }
  }
}

- (id)itemsFromParent
{
  v17.receiver = self;
  v17.super_class = (Class)MusicSettingsAtmosAudioController;
  v3 = [(MusicSettingsAtmosAudioController *)&v17 itemsFromParent];
  uint64_t v4 = OBJC_IVAR___PSViewController__specifier;
  id v5 = [*(id *)&self->PSListItemsController_opaque[OBJC_IVAR___PSViewController__specifier] properties];
  uint64_t v6 = MusicSettingsShouldSelectAction;
  id v7 = [v5 objectForKeyedSubscript:MusicSettingsShouldSelectAction];

  id v8 = [*(id *)&self->PSListItemsController_opaque[v4] properties];
  uint64_t v9 = MusicSettingsDidSelectAction;
  SEL v10 = [v8 objectForKeyedSubscript:MusicSettingsDidSelectAction];

  v11 = objc_msgSend(v3, "subarrayWithRange:", 1, (char *)objc_msgSend(v3, "count") - 1);
  if ([v11 count])
  {
    unint64_t v12 = 0;
    do
    {
      id v13 = [v11 objectAtIndexedSubscript:v12];
      if (v12 < (unint64_t)[v7 count])
      {
        id v14 = [v7 objectAtIndexedSubscript:v12];
        if ([v14 length]) {
          [v13 setProperty:v14 forKey:v6];
        }
      }
      if (v12 < (unint64_t)[v10 count])
      {
        v15 = [v10 objectAtIndexedSubscript:v12];
        if ([v15 length]) {
          [v13 setProperty:v15 forKey:v9];
        }
      }
      ++v12;
    }
    while (v12 < (unint64_t)[v11 count]);
  }

  return v3;
}

- (void)_displayDownloadsDialogIfNeededWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t))a3;
  id v5 = +[MPPlaybackUserDefaults standardUserDefaults];
  unsigned int v6 = [v5 prefersSpatialDownloads];

  if (v6)
  {
    v4[2](v4, 1);
  }
  else
  {
    id v7 = +[NSBundle bundleForClass:objc_opt_class()];
    id v8 = [v7 localizedStringForKey:@"ATMOS_UPGRADE_TITLE" value:&stru_18CF0 table:@"MusicSettings"];
    uint64_t v9 = +[NSBundle bundleForClass:objc_opt_class()];
    SEL v10 = [v9 localizedStringForKey:@"ATMOS_UPGRADE_BODY" value:&stru_18CF0 table:@"MusicSettings"];
    v11 = +[UIAlertController alertControllerWithTitle:v8 message:v10 preferredStyle:1];

    unint64_t v12 = +[NSBundle bundleForClass:objc_opt_class()];
    id v13 = [v12 localizedStringForKey:@"ATMOS_UPGRADE_ACTION_CANCEL" value:&stru_18CF0 table:@"MusicSettings"];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_4AC4;
    v24[3] = &unk_18658;
    id v14 = v4;
    v25 = v14;
    v15 = +[UIAlertAction actionWithTitle:v13 style:1 handler:v24];
    [v11 addAction:v15];

    id v16 = +[NSBundle bundleForClass:objc_opt_class()];
    objc_super v17 = [v16 localizedStringForKey:@"ATMOS_UPGRADE_ACTION_ACCEPT" value:&stru_18CF0 table:@"MusicSettings"];
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    objc_super v21 = sub_4AD8;
    v22 = &unk_18658;
    v23 = v14;
    id v18 = +[UIAlertAction actionWithTitle:v17 style:0 handler:&v19];
    objc_msgSend(v11, "addAction:", v18, v19, v20, v21, v22);

    [(MusicSettingsAtmosAudioController *)self presentViewController:v11 animated:1 completion:0];
  }
}

@end