@interface BuddySkipWiFiAlertController
+ (id)alertController;
- (id)skipWiFi;
- (id)useWiFi;
- (void)setSkipWiFi:(id)a3;
- (void)setUseWiFi:(id)a3;
@end

@implementation BuddySkipWiFiAlertController

+ (id)alertController
{
  v30[2] = a1;
  v30[1] = (id)a2;
  v2 = +[NSBundle mainBundle];
  id v3 = (id)SFLocalizableWAPIStringKeyForKey();
  v4 = [(NSBundle *)v2 localizedStringForKey:v3 value:&stru_1002B4E18 table:@"Localizable"];
  v5 = +[NSBundle mainBundle];
  v6 = [(NSBundle *)v5 localizedStringForKey:@"SKIP_WIFI_MESSAGE" value:&stru_1002B4E18 table:@"Localizable"];
  v30[0] = +[BuddySkipWiFiAlertController alertControllerWithTitle:v4 message:v6 preferredStyle:1];

  objc_initWeak(&location, v30[0]);
  id v7 = v30[0];
  v8 = +[NSBundle mainBundle];
  v9 = [(NSBundle *)v8 localizedStringForKey:@"CONTINUE" value:&stru_1002B4E18 table:@"Localizable"];
  v23 = _NSConcreteStackBlock;
  int v24 = -1073741824;
  int v25 = 0;
  v26 = sub_1000870B4;
  v27 = &unk_1002B13E0;
  objc_copyWeak(v28, &location);
  v10 = +[UIAlertAction actionWithTitle:v9 style:1 handler:&v23];
  [v7 addAction:v10];

  id v11 = v30[0];
  v12 = +[NSBundle mainBundle];
  id v13 = (id)SFLocalizableWAPIStringKeyForKey();
  v14 = [(NSBundle *)v12 localizedStringForKey:v13 value:&stru_1002B4E18 table:@"Localizable"];
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  v20 = sub_100087178;
  v21 = &unk_1002B13E0;
  objc_copyWeak(&v22, &location);
  v15 = +[UIAlertAction actionWithTitle:v14 style:0 handler:&v18];
  [v11 addAction:v15, v18, v19, v20, v21];

  id v16 = v30[0];
  objc_destroyWeak(&v22);
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  objc_storeStrong(v30, 0);
  return v16;
}

- (id)skipWiFi
{
  return self->_skipWiFi;
}

- (void)setSkipWiFi:(id)a3
{
}

- (id)useWiFi
{
  return self->_useWiFi;
}

- (void)setUseWiFi:(id)a3
{
}

- (void).cxx_destruct
{
}

@end