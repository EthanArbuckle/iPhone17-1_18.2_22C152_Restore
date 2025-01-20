@interface MusicSettingsAudioQualityDetailController
- (id)itemsFromParent;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)listItemSelected:(id)a3;
- (void)shouldSelectHiResLosslessCellular:(id)a3 completion:(id)a4;
- (void)shouldSelectHiResLosslessDownload:(id)a3 completion:(id)a4;
- (void)shouldSelectHiResLosslessWiFi:(id)a3 completion:(id)a4;
- (void)shouldSelectHighQualityDownload:(id)a3 completion:(id)a4;
- (void)shouldSelectLosslessCellular:(id)a3 completion:(id)a4;
- (void)shouldSelectLosslessDownload:(id)a3 completion:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation MusicSettingsAudioQualityDetailController

- (void)viewDidAppear:(BOOL)a3
{
  v26.receiver = self;
  v26.super_class = (Class)MusicSettingsAudioQualityDetailController;
  [(MusicSettingsAudioQualityDetailController *)&v26 viewDidAppear:a3];
  v25 = +[NSURL URLWithString:@"prefs:root=MUSIC&path=com.apple.Music:AudioQualityLowData"];
  id v4 = objc_alloc((Class)_NSLocalizedStringResource);
  v5 = +[NSLocale currentLocale];
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 bundleURL];
  id v24 = [v4 initWithKey:@"APPS" table:@"MusicSettings" locale:v5 bundleURL:v7];

  id v8 = objc_alloc((Class)_NSLocalizedStringResource);
  v9 = +[NSLocale currentLocale];
  v10 = +[NSBundle bundleForClass:objc_opt_class()];
  v11 = [v10 bundleURL];
  id v12 = [v8 initWithKey:@"MUSIC" table:@"MusicSettings" locale:v9 bundleURL:v11];

  id v13 = objc_alloc((Class)_NSLocalizedStringResource);
  v14 = +[NSLocale currentLocale];
  v15 = +[NSBundle bundleForClass:objc_opt_class()];
  v16 = [v15 bundleURL];
  id v17 = [v13 initWithKey:@"AUDIO_QUALITY" table:@"MusicSettings" locale:v14 bundleURL:v16];

  id v18 = objc_alloc((Class)_NSLocalizedStringResource);
  v19 = +[NSLocale currentLocale];
  v20 = +[NSBundle bundleForClass:objc_opt_class()];
  v21 = [v20 bundleURL];
  id v22 = [v18 initWithKey:@"CELLULAR_STREAMING" table:@"MusicSettings" locale:v19 bundleURL:v21];

  v27[0] = v24;
  v27[1] = v12;
  v27[2] = v17;
  v23 = +[NSArray arrayWithObjects:v27 count:3];
  [(MusicSettingsAudioQualityDetailController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.Music" title:v22 localizedNavigationComponents:v23 deepLink:v25];
}

- (void)shouldSelectLosslessCellular:(id)a3 completion:(id)a4
{
  id v5 = a4;
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"LOSSLESS_CELLULAR_WARN_TITLE" value:&stru_18CF0 table:@"MusicSettings"];
  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"LOSSLESS_CELLULAR_WARN_BODY" value:&stru_18CF0 table:@"MusicSettings"];
  v10 = +[UIAlertController alertControllerWithTitle:v7 message:v9 preferredStyle:1];

  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  id v12 = [v11 localizedStringForKey:@"LOSSLESS_CELLULAR_WARN_CANCEL" value:&stru_18CF0 table:@"MusicSettings"];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1F30;
  v24[3] = &unk_18658;
  id v13 = v5;
  id v25 = v13;
  v14 = +[UIAlertAction actionWithTitle:v12 style:1 handler:v24];
  [v10 addAction:v14];

  v15 = +[NSBundle bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"LOSSLESS_CELLULAR_WARN_ACCEPT" value:&stru_18CF0 table:@"MusicSettings"];
  v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  v21 = sub_1F44;
  id v22 = &unk_18658;
  id v23 = v13;
  id v17 = v13;
  id v18 = +[UIAlertAction actionWithTitle:v16 style:0 handler:&v19];
  objc_msgSend(v10, "addAction:", v18, v19, v20, v21, v22);

  [(MusicSettingsAudioQualityDetailController *)self presentViewController:v10 animated:1 completion:0];
}

- (void)shouldSelectHiResLosslessCellular:(id)a3 completion:(id)a4
{
  id v5 = a4;
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"HI_RES_LOSSLESS_CELLULAR_WARN_TITLE" value:&stru_18CF0 table:@"MusicSettings"];
  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"HI_RES_LOSSLESS_CELLULAR_WARN_BODY" value:&stru_18CF0 table:@"MusicSettings"];
  v10 = +[UIAlertController alertControllerWithTitle:v7 message:v9 preferredStyle:1];

  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  id v12 = [v11 localizedStringForKey:@"HI_RES_LOSSLESS_CELLULAR_WARN_CANCEL" value:&stru_18CF0 table:@"MusicSettings"];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_2224;
  v24[3] = &unk_18658;
  id v13 = v5;
  id v25 = v13;
  v14 = +[UIAlertAction actionWithTitle:v12 style:1 handler:v24];
  [v10 addAction:v14];

  v15 = +[NSBundle bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"HI_RES_LOSSLESS_CELLULAR_WARN_ACCEPT" value:&stru_18CF0 table:@"MusicSettings"];
  v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  v21 = sub_2238;
  id v22 = &unk_18658;
  id v23 = v13;
  id v17 = v13;
  id v18 = +[UIAlertAction actionWithTitle:v16 style:0 handler:&v19];
  objc_msgSend(v10, "addAction:", v18, v19, v20, v21, v22);

  [(MusicSettingsAudioQualityDetailController *)self presentViewController:v10 animated:1 completion:0];
}

- (void)shouldSelectHiResLosslessWiFi:(id)a3 completion:(id)a4
{
  id v5 = a4;
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"HI_RES_LOSSLESS_DAC_REQUIRED_WARN_TITLE" value:&stru_18CF0 table:@"MusicSettings"];
  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"HI_RES_LOSSLESS_DAC_REQUIRED_WARN_BODY" value:&stru_18CF0 table:@"MusicSettings"];
  v10 = +[UIAlertController alertControllerWithTitle:v7 message:v9 preferredStyle:1];

  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  id v12 = [v11 localizedStringForKey:@"HI_RES_LOSSLESS_DAC_REQUIRED_WARN_CANCEL" value:&stru_18CF0 table:@"MusicSettings"];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_2518;
  v24[3] = &unk_18658;
  id v13 = v5;
  id v25 = v13;
  v14 = +[UIAlertAction actionWithTitle:v12 style:1 handler:v24];
  [v10 addAction:v14];

  v15 = +[NSBundle bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"HI_RES_LOSSLESS_DAC_REQUIRED_WARN_ACCEPT" value:&stru_18CF0 table:@"MusicSettings"];
  v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  v21 = sub_252C;
  id v22 = &unk_18658;
  id v23 = v13;
  id v17 = v13;
  id v18 = +[UIAlertAction actionWithTitle:v16 style:0 handler:&v19];
  objc_msgSend(v10, "addAction:", v18, v19, v20, v21, v22);

  [(MusicSettingsAudioQualityDetailController *)self presentViewController:v10 animated:1 completion:0];
}

- (void)shouldSelectHighQualityDownload:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSListItemsController_opaque[OBJC_IVAR___PSViewController__parentController]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_25F4;
  v8[3] = &unk_18680;
  id v9 = v5;
  id v7 = v5;
  [WeakRetained displayDowngradeAlertIfNeededWithCompletion:v8];
}

- (void)shouldSelectLosslessDownload:(id)a3 completion:(id)a4
{
  id v5 = a4;
  v6 = +[MPNetworkObserver sharedNetworkObserver];
  unsigned int v7 = [v6 isMusicCellularDownloadingAllowed];

  if (v7)
  {
    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"LOSSLESS_DOWNLOAD_CELLULAR_WARN_TITLE" value:&stru_18CF0 table:@"MusicSettings"];
    v10 = +[NSBundle bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"LOSSLESS_DOWNLOAD_CELLULAR_WARN_BODY" value:&stru_18CF0 table:@"MusicSettings"];
    id v12 = +[UIAlertController alertControllerWithTitle:v9 message:v11 preferredStyle:1];

    id v13 = +[NSBundle bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"LOSSLESS_DOWNLOAD_CELLULAR_WARN_ACTION_CANCEL" value:&stru_18CF0 table:@"MusicSettings"];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_2910;
    v25[3] = &unk_18658;
    id v15 = v5;
    id v26 = v15;
    v16 = +[UIAlertAction actionWithTitle:v14 style:1 handler:v25];
    [v12 addAction:v16];

    id v17 = +[NSBundle bundleForClass:objc_opt_class()];
    id v18 = [v17 localizedStringForKey:@"LOSSLESS_DOWNLOAD_CELLULAR_WARN_ACTION_ACCEPT" value:&stru_18CF0 table:@"MusicSettings"];
    uint64_t v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    id v22 = sub_2924;
    id v23 = &unk_18658;
    id v24 = v15;
    v19 = +[UIAlertAction actionWithTitle:v18 style:0 handler:&v20];
    objc_msgSend(v12, "addAction:", v19, v20, v21, v22, v23);

    [(MusicSettingsAudioQualityDetailController *)self presentViewController:v12 animated:1 completion:0];
  }
  else
  {
    (*((void (**)(id, uint64_t))v5 + 2))(v5, 1);
  }
}

- (void)shouldSelectHiResLosslessDownload:(id)a3 completion:(id)a4
{
  id v5 = a4;
  v6 = +[MPNetworkObserver sharedNetworkObserver];
  unsigned int v7 = [v6 isMusicCellularDownloadingAllowed];

  if (v7)
  {
    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"HI_RES_LOSSLESS_DOWNLOAD_CELLULAR_WARN_TITLE" value:&stru_18CF0 table:@"MusicSettings"];
    v10 = +[NSBundle bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"HI_RES_LOSSLESS_DOWNLOAD_CELLULAR_WARN_BODY" value:&stru_18CF0 table:@"MusicSettings"];
    id v12 = +[UIAlertController alertControllerWithTitle:v9 message:v11 preferredStyle:1];

    id v13 = +[NSBundle bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"HI_RES_LOSSLESS_DOWNLOAD_CELLULAR_WARN_ACTION_CANCEL" value:&stru_18CF0 table:@"MusicSettings"];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_2C40;
    v25[3] = &unk_18658;
    id v15 = v5;
    id v26 = v15;
    v16 = +[UIAlertAction actionWithTitle:v14 style:1 handler:v25];
    [v12 addAction:v16];

    id v17 = +[NSBundle bundleForClass:objc_opt_class()];
    id v18 = [v17 localizedStringForKey:@"HI_RES_LOSSLESS_DOWNLOAD_CELLULAR_WARN_ACTION_ACCEPT" value:&stru_18CF0 table:@"MusicSettings"];
    uint64_t v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    id v22 = sub_2C54;
    id v23 = &unk_18658;
    id v24 = v15;
    v19 = +[UIAlertAction actionWithTitle:v18 style:0 handler:&v20];
    objc_msgSend(v12, "addAction:", v19, v20, v21, v22, v23);

    [(MusicSettingsAudioQualityDetailController *)self presentViewController:v12 animated:1 completion:0];
  }
  else
  {
    (*((void (**)(id, uint64_t))v5 + 2))(v5, 1);
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MusicSettingsAudioQualityDetailController *)self specifierAtIndexPath:v6];
  v15.receiver = self;
  v15.super_class = (Class)MusicSettingsAudioQualityDetailController;
  id v9 = [(MusicSettingsAudioQualityDetailController *)&v15 tableView:v7 cellForRowAtIndexPath:v6];

  v10 = [v8 propertyForKey:@"musicDetails"];
  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  id v12 = [v11 localizedStringForKey:v10 value:&stru_18CF0 table:@"MusicSettings"];

  id v13 = [v9 detailTextLabel];
  [v13 setText:v12];

  return v9;
}

- (void)listItemSelected:(id)a3
{
  id v4 = a3;
  id v5 = [(MusicSettingsAudioQualityDetailController *)self specifierAtIndexPath:v4];
  id v6 = [v5 propertyForKey:@"cellObject"];
  if (([v6 isChecked] & 1) == 0)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_2F54;
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
      v13[2] = sub_2FE4;
      v13[3] = &unk_186D0;
      v14 = v8;
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
  v22.receiver = self;
  v22.super_class = (Class)MusicSettingsAudioQualityDetailController;
  v3 = [(MusicSettingsAudioQualityDetailController *)&v22 itemsFromParent];
  uint64_t v4 = OBJC_IVAR___PSViewController__specifier;
  id v5 = [*(id *)&self->PSListItemsController_opaque[OBJC_IVAR___PSViewController__specifier] properties];
  id v6 = [v5 objectForKeyedSubscript:MusicSettingsValidDetails];

  id v7 = [*(id *)&self->PSListItemsController_opaque[v4] properties];
  uint64_t v21 = MusicSettingsShouldSelectAction;
  id v8 = objc_msgSend(v7, "objectForKeyedSubscript:");

  id v9 = [*(id *)&self->PSListItemsController_opaque[v4] properties];
  uint64_t v10 = MusicSettingsDidSelectAction;
  v11 = [v9 objectForKeyedSubscript:MusicSettingsDidSelectAction];

  id v20 = v3;
  id v12 = objc_msgSend(v3, "subarrayWithRange:", 1, (char *)objc_msgSend(v3, "count") - 1);
  if ([v12 count])
  {
    unint64_t v13 = 0;
    uint64_t v14 = PSCellClassKey;
    do
    {
      objc_super v15 = [v12 objectAtIndexedSubscript:v13];
      [v15 setProperty:objc_opt_class() forKey:v14];
      if (v13 < (unint64_t)[v6 count])
      {
        id v16 = [v6 objectAtIndexedSubscript:v13];
        [v15 setProperty:v16 forKey:@"musicDetails"];
      }
      if (v13 < (unint64_t)[v8 count])
      {
        id v17 = [v8 objectAtIndexedSubscript:v13];
        if ([v17 length]) {
          [v15 setProperty:v17 forKey:v21];
        }
      }
      if (v13 < (unint64_t)[v11 count])
      {
        id v18 = [v11 objectAtIndexedSubscript:v13];
        if ([v18 length]) {
          [v15 setProperty:v18 forKey:v10];
        }
      }
      ++v13;
    }
    while (v13 < (unint64_t)[v12 count]);
  }

  return v20;
}

@end