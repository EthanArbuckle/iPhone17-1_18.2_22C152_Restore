@interface ILClassificationAndReportingSettingsController
- (ILClassificationAndReportingSettingsController)initWithNibName:(id)a3 bundle:(id)a4;
- (NSMutableArray)extensionSpecifiers;
- (id)specifiers;
- (void)classificationController:(id)a3 didUpdateAvailability:(BOOL)a4 electedExtension:(id)a5 extensions:(id)a6;
- (void)createExtensionSpecifiersWithElectedExtension:(id)a3 allExtensions:(id)a4;
- (void)presentAlertForExtensionName:(id)a3 completion:(id)a4;
- (void)setExtensionSpecifiers:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ILClassificationAndReportingSettingsController

- (ILClassificationAndReportingSettingsController)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)ILClassificationAndReportingSettingsController;
  v4 = [(ILClassificationAndReportingSettingsController *)&v10 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    extensionSpecifiers = v4->_extensionSpecifiers;
    v4->_extensionSpecifiers = v5;

    v7 = +[ILClassificationController sharedInstance];
    [v7 addDelegate:v4];

    v8 = +[ILClassificationController sharedInstance];
    [v8 activateWithCompletion:0];
  }
  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ILClassificationAndReportingSettingsController;
  [(ILClassificationAndReportingSettingsController *)&v9 viewWillAppear:a3];
  v4 = [(ILClassificationAndReportingSettingsController *)self extensionSpecifiers];

  if (v4)
  {
    v5 = +[ILClassificationController sharedInstance];
    v6 = [v5 electedExtension];
    v7 = +[ILClassificationController sharedInstance];
    v8 = [v7 extensions];
    [(ILClassificationAndReportingSettingsController *)self createExtensionSpecifiersWithElectedExtension:v6 allExtensions:v8];
  }
}

- (void)classificationController:(id)a3 didUpdateAvailability:(BOOL)a4 electedExtension:(id)a5 extensions:(id)a6
{
}

- (id)specifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = [(ILClassificationAndReportingSettingsController *)self extensionSpecifiers];
  [v3 addObjectsFromArray:v4];

  id v5 = [v3 copy];
  uint64_t v6 = OBJC_IVAR___PSListController__specifiers;
  v7 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = v5;

  id v8 = *(id *)&self->PSListController_opaque[v6];
  return v8;
}

- (void)createExtensionSpecifiersWithElectedExtension:(id)a3 allExtensions:(id)a4
{
  id v35 = a3;
  id v5 = a4;
  uint64_t v6 = ILDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v45 = v5;
    __int16 v46 = 2112;
    id v47 = v35;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "gotExtensions: %@ elected extension: %@", buf, 0x16u);
  }

  uint64_t v7 = +[ILClassificationSettingsStrings localizedStringForKey:@"REPORTING_MARKETING_NAME"];
  uint64_t v8 = +[ILClassificationSettingsStrings localizedStringForKey:@"NO_EXTENSION_SELECTED"];
  objc_super v9 = +[ILClassificationSettingsStrings localizedStringForKey:@"REPORTING_MARKETING_NAME_%@_EXTENSIONS"];
  uint64_t v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v7);

  v11 = +[ILClassificationSettingsStrings localizedStringForKey:@"ABOUT_REPORT_EXTENSION_MARKETING_NAME_%@_%@_%@_%@_%@_NO_SELECTION_%@"];
  v31 = (void *)v7;
  uint64_t v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v7, v7, v7, v7, v7, v8);

  v13 = +[NSMutableArray array];
  v29 = (void *)v10;
  v14 = +[PSSpecifier groupSpecifierWithID:@"ClassificationAndReportingReportListGroup" name:v10];
  v28 = (void *)v12;
  [v14 setProperty:v12 forKey:PSFooterTextGroupKey];
  [v13 insertObject:v14 atIndex:0];
  v30 = (void *)v8;
  uint64_t v15 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:4 edit:0];
  uint64_t v32 = PSRadioGroupCheckedSpecifierKey;
  v33 = v14;
  v27 = (void *)v15;
  objc_msgSend(v14, "setProperty:forKey:");
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v5;
  id v16 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v40;
    uint64_t v19 = PSEnabledKey;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v40 != v18) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v22 = [v21 _plugIn];
        v23 = [v22 localizedContainingName];

        v24 = +[PSSpecifier preferenceSpecifierNamed:v23 target:self set:0 get:0 detail:0 cell:3 edit:0];
        [v24 setUserInfo:v21];
        v25 = +[NSNumber numberWithBool:1];
        [v24 setProperty:v25 forKey:v19];

        if ([v21 isEqual:v35]) {
          [v14 setProperty:v24 forKey:v32];
        }
        [v13 addObject:v24];
      }
      id v17 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v17);
  }

  [v13 addObject:v27];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_23E8;
  block[3] = &unk_41A8;
  block[4] = self;
  id v38 = v13;
  id v26 = v13;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v24.receiver = self;
  v24.super_class = (Class)ILClassificationAndReportingSettingsController;
  id v6 = a4;
  [(ILClassificationAndReportingSettingsController *)&v24 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = [(ILClassificationAndReportingSettingsController *)self specifierAtIndexPath:v6];

  uint64_t v8 = [(ILClassificationAndReportingSettingsController *)self getGroupSpecifierForSpecifier:v7];
  objc_super v9 = [v7 userInfo];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_268C;
  v20[3] = &unk_41D0;
  id v10 = v7;
  id v21 = v10;
  id v11 = v8;
  id v22 = v11;
  v23 = self;
  uint64_t v12 = objc_retainBlock(v20);
  v13 = v12;
  if (v9)
  {
    v14 = ILDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v9;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "presenting election alert for extension: %@", buf, 0xCu);
    }

    uint64_t v15 = [v9 _plugIn];
    id v16 = [v15 localizedContainingName];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_27D0;
    v17[3] = &unk_41F8;
    id v18 = v9;
    id v19 = v13;
    [(ILClassificationAndReportingSettingsController *)self presentAlertForExtensionName:v16 completion:v17];
  }
  else
  {
    ((void (*)(void *, void))v12[2])(v12, 0);
  }
}

- (void)presentAlertForExtensionName:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[ILClassificationSettingsStrings localizedStringForKey:@"EXTENSION_ENABLE_ALERT_TITLE_MARKETING_NAME_%@_EXTENSION_NAME_%@"];
  objc_super v9 = +[ILClassificationSettingsStrings localizedStringForKey:@"REPORTING_MARKETING_NAME"];
  id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v9, v7);

  id v11 = +[ILClassificationSettingsStrings localizedStringForKey:@"EXTENSION_ENABLE_ALERT_WARNING_EXTENSION_NAME_%@"];
  uint64_t v12 = +[ILClassificationSettingsStrings localizedStringForKey:@"REPORTING_MARKETING_NAME"];
  v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12);

  v14 = +[UIAlertController alertControllerWithTitle:v10 message:v13 preferredStyle:1];
  uint64_t v15 = +[ILClassificationSettingsStrings localizedStringForKey:@"ENABLE_EXTENSION"];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_2B40;
  v23[3] = &unk_4220;
  id v16 = v6;
  id v24 = v16;
  id v17 = +[UIAlertAction actionWithTitle:v15 style:0 handler:v23];
  [v14 addAction:v17];

  id v18 = +[ILClassificationSettingsStrings localizedStringForKey:@"CANCEL"];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_2B54;
  v21[3] = &unk_4220;
  id v22 = v16;
  id v19 = v16;
  v20 = +[UIAlertAction actionWithTitle:v18 style:1 handler:v21];
  [v14 addAction:v20];

  [(ILClassificationAndReportingSettingsController *)self presentViewController:v14 animated:1 completion:0];
}

- (NSMutableArray)extensionSpecifiers
{
  return self->_extensionSpecifiers;
}

- (void)setExtensionSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end