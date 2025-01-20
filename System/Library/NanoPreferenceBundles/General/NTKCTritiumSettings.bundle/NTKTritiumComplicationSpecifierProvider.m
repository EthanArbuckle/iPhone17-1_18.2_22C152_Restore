@interface NTKTritiumComplicationSpecifierProvider
+ (id)_getIconForBundleID:(id)a3;
- (NTKTritiumComplicationSpecifierProvider)init;
- (NTKTritiumComplicationSpecifierProviderDelegate)delegate;
- (id)_createSpecifierForApp:(id)a3;
- (id)appInfosForAppsWithComplications;
- (id)bundleIDsForLegacyComplications;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)updateSpecifiers;
@end

@implementation NTKTritiumComplicationSpecifierProvider

- (NTKTritiumComplicationSpecifierProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)NTKTritiumComplicationSpecifierProvider;
  v2 = [(NTKTritiumComplicationSpecifierProvider *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("TritiumPrivacySpecifierQueue", v3);
    reloadSpecifierQueue = v2->_reloadSpecifierQueue;
    v2->_reloadSpecifierQueue = (OS_dispatch_queue *)v4;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_41F0, NTKTritiumSettingsDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, 0, 0);
  v4.receiver = self;
  v4.super_class = (Class)NTKTritiumComplicationSpecifierProvider;
  [(NTKTritiumComplicationSpecifierProvider *)&v4 dealloc];
}

- (void)updateSpecifiers
{
  reloadSpecifierQueue = self->_reloadSpecifierQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_433C;
  block[3] = &unk_83E8;
  block[4] = self;
  dispatch_async(reloadSpecifierQueue, block);
}

- (id)appInfosForAppsWithComplications
{
  v3 = objc_opt_new();
  objc_super v4 = NTKSharedRemoteComplicationProvider();
  v5 = +[NTKWidgetTritiumComplicationProvider shared];
  v6 = +[NTKBundleComplicationManager sharedManager];
  v7 = [(NTKTritiumComplicationSpecifierProvider *)self bundleIDsForLegacyComplications];
  objc_super v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_4820;
  v18[3] = &unk_8410;
  id v19 = v4;
  id v20 = v5;
  id v21 = v6;
  id v22 = v7;
  id v9 = v3;
  id v23 = v9;
  v24 = v8;
  v10 = v8;
  id v11 = v7;
  id v12 = v6;
  id v13 = v5;
  id v14 = v4;
  +[NTKTritiumSettingsAppProvider loadAppsWithCompletion:v18];
  dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  v15 = v24;
  id v16 = v9;

  return v16;
}

- (id)bundleIDsForLegacyComplications
{
  v2 = +[CLKDevice currentDevice];
  v3 = NTKComplicationTypesToBundleIDMappingForDevice();

  objc_super v4 = [v3 allValues];
  v5 = +[NSSet setWithArray:v4];

  return v5;
}

- (id)_createSpecifierForApp:(id)a3
{
  id v4 = a3;
  v5 = [v4 info];
  v6 = [v5 localizedName];
  v7 = [(NTKTritiumComplicationSpecifierProvider *)self delegate];
  objc_super v8 = [(NTKTritiumComplicationSpecifierProvider *)self delegate];
  id v9 = [v8 specifierSetter];
  v10 = [(NTKTritiumComplicationSpecifierProvider *)self delegate];
  id v11 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, v7, v9, [v10 specifierGetter], 0, 6, 0);

  id v12 = [v4 info];
  id v13 = [v12 appBundleID];
  [v11 setUserInfo:v13];

  id v14 = [v4 info];
  v15 = [v14 appBundleID];
  [v11 setIdentifier:v15];

  id v16 = [v4 info];
  v17 = [v16 appBundleID];
  [v11 setProperty:v17 forKey:PSLazyIconAppID];

  [v11 setProperty:&__kCFBooleanTrue forKey:PSLazyIconLoading];
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2050000000;
  v18 = (void *)qword_CA50;
  uint64_t v25 = qword_CA50;
  if (!qword_CA50)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_4E68;
    v21[3] = &unk_8438;
    v21[4] = &v22;
    sub_4E68((uint64_t)v21);
    v18 = (void *)v23[3];
  }
  id v19 = v18;
  _Block_object_dispose(&v22, 8);
  [v11 setProperty:objc_opt_class() forKey:PSCellClassKey];

  return v11;
}

+ (id)_getIconForBundleID:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)ISIcon) initWithBundleIdentifier:v3];

  v5 = +[UIScreen mainScreen];
  [v5 scale];
  double v7 = v6;

  id v8 = objc_msgSend(objc_alloc((Class)ISImageDescriptor), "initWithSize:scale:", 40.0, 40.0, v7);
  [v8 setShape:2];
  id v9 = [v4 prepareImageForDescriptor:v8];
  if (v9) {
    id v10 = objc_msgSend(objc_alloc((Class)UIImage), "initWithCGImage:scale:orientation:", objc_msgSend(v9, "CGImage"), 0, v7);
  }
  else {
    id v10 = 0;
  }

  return v10;
}

- (NTKTritiumComplicationSpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKTritiumComplicationSpecifierProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_reloadSpecifierQueue, 0);
}

@end