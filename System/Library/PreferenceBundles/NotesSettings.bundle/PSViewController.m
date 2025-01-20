@interface PSViewController
- (void)ic_submitNavigationEventForIdentifier:(id)a3 titleStringKey:(id)a4 navigationComponents:(id)a5;
@end

@implementation PSViewController

- (void)ic_submitNavigationEventForIdentifier:(id)a3 titleStringKey:(id)a4 navigationComponents:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Apps/com.apple.mobilenotes"];
  v11 = v10;
  v32 = v7;
  if (v7)
  {
    uint64_t v12 = [v10 URLByAppendingPathComponent:v7];

    v30 = (void *)v12;
  }
  else
  {
    v30 = v10;
  }
  id v13 = objc_alloc((Class)_NSLocalizedStringResource);
  v14 = +[NSLocale currentLocale];
  v15 = +[NSBundle bundleForClass:objc_opt_class()];
  v16 = [v15 bundleURL];
  v31 = v8;
  id v29 = [v13 initWithKey:v8 table:@"Settings" locale:v14 bundleURL:v16];

  id v17 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v9;
  id v18 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v36;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v36 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        id v23 = objc_alloc((Class)_NSLocalizedStringResource);
        v24 = +[NSLocale currentLocale];
        v25 = +[NSBundle bundleForClass:objc_opt_class()];
        v26 = [v25 bundleURL];
        id v27 = [v23 initWithKey:v22 table:@"Settings" locale:v24 bundleURL:v26];

        if (v27) {
          [v17 addObject:v27];
        }
      }
      id v19 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v19);
  }

  if (v29) {
    [v17 addObject:v29];
  }
  v28 = ICNotesAppBundleIdentifier();
  [(PSViewController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:v28 title:v29 localizedNavigationComponents:v17 deepLink:v30];
}

@end