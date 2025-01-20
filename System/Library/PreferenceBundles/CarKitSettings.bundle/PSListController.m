@interface PSListController
- (void)_car_emitNavigationEvent:(id)a3 navigationComponents:(id)a4;
- (void)_car_popIfVisible;
@end

@implementation PSListController

- (void)_car_popIfVisible
{
  v3 = [(PSListController *)self navigationController];
  v4 = [v3 topViewController];

  if (v4 == self)
  {
    id v11 = [(PSListController *)self navigationController];
    id v10 = [v11 popViewControllerAnimated:1];
    goto LABEL_6;
  }
  v5 = [(PSListController *)self parentViewController];
  if (v5)
  {
    id v11 = v5;
    v6 = [v5 navigationController];
    id v7 = [v6 topViewController];

    v5 = v11;
    if (v7 == v11)
    {
      v8 = [v11 navigationController];
      id v9 = [v8 popViewControllerAnimated:1];

LABEL_6:
      v5 = v11;
    }
  }
}

- (void)_car_emitNavigationEvent:(id)a3 navigationComponents:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v24 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.General/CARPLAY"];
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 bundleURL];

  id v9 = objc_alloc((Class)_NSLocalizedStringResource);
  id v10 = +[NSLocale currentLocale];
  v26 = v5;
  id v22 = [v9 initWithKey:v5 table:0 locale:v10 bundleURL:v8];

  id v11 = +[NSMutableArray array];
  v25 = v6;
  if ([v6 count])
  {
    v12 = [&off_26078 arrayByAddingObjectsFromArray:v6];
  }
  else
  {
    v12 = &off_26078;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v28;
    do
    {
      v17 = 0;
      do
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v27 + 1) + 8 * (void)v17);
        id v19 = objc_alloc((Class)_NSLocalizedStringResource);
        v20 = +[NSLocale currentLocale];
        id v21 = [v19 initWithKey:v18 table:0 locale:v20 bundleURL:v8];

        [v11 addObject:v21];
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v15);
  }

  [(PSListController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.carplay" title:v22 localizedNavigationComponents:v11 deepLink:v24];
}

@end