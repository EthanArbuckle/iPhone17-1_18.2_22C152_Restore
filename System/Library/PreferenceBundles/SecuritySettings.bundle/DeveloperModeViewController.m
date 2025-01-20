@interface DeveloperModeViewController
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (DeveloperModeViewController)init;
- (id)readPreferenceValue:(id)a3;
- (id)specifiers;
- (id)specifiersForPairing;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (int)commitChanges;
- (void)dealloc;
- (void)promptRebootWithCallback:(id)a3 onCancel:(id)a4;
- (void)readAndSetSettings;
- (void)reboot;
- (void)refreshLinkStatusInParent;
- (void)setPreferenceValue:(id)a3 forSpecifier:(id)a4;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation DeveloperModeViewController

- (DeveloperModeViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)DeveloperModeViewController;
  v2 = [(DeveloperModeViewController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->settings = 0;
    uint64_t v4 = create_amfid_xpc_connection();
    amfidXpc = v3->amfidXpc;
    v3->amfidXpc = (OS_xpc_object *)v4;

    xpc_connection_resume(v3->amfidXpc);
  }
  return v3;
}

- (void)dealloc
{
  amfidXpc = self->amfidXpc;
  if (amfidXpc)
  {
    xpc_connection_cancel(amfidXpc);
    uint64_t v4 = self->amfidXpc;
    self->amfidXpc = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)DeveloperModeViewController;
  [(DeveloperModeViewController *)&v5 dealloc];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  uint64_t v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    objc_super v5 = +[NSMutableArray array];
    v6 = [(DeveloperModeViewController *)self bundle];
    id v19 = 0;
    id v20 = 0;
    id v7 = objc_alloc((Class)NSMutableDictionary);
    v8 = [v6 pathForResource:@"DeveloperMode" ofType:@"plist"];
    id v9 = [v7 initWithContentsOfFile:v8];

    id v10 = objc_alloc((Class)NSMutableArray);
    id v11 = [v10 initWithArray:*(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__bundleControllers]];
    id v18 = v11;
    v12 = SpecifiersFromPlist();
    id v13 = v18;

    objc_msgSend(v5, "addObjectsFromArray:", v12, &v18);
    [(DeveloperModeViewController *)self setTitle:v19];
    [(DeveloperModeViewController *)self setSpecifierID:v20];
    if (_os_feature_enabled_impl() && self->settings == 1)
    {
      v14 = [(DeveloperModeViewController *)self specifiersForPairing];
      [v5 addObjectsFromArray:v14];
    }
    v15 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;
    id v16 = v5;

    uint64_t v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)DeveloperModeViewController;
  [(DeveloperModeViewController *)&v5 viewDidLoad];
  [(DeveloperModeViewController *)self readAndSetSettings];
  if (_os_feature_enabled_impl())
  {
    uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v4 = [v3 localizedStringForKey:@"DEV_TOOLS_TITLE" value:&stru_8420 table:0];
    [(DeveloperModeViewController *)self setTitle:v4];
  }
}

- (void)readAndSetSettings
{
  amfidXpc = self->amfidXpc;
  uint64_t v4 = dict_to_xpc_msg();
  xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(amfidXpc, v4);

  v6 = xpc_msg_to_dict(v5);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412290;
    v25 = v6;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "amfid response %@", (uint8_t *)&v24, 0xCu);
  }
  id v7 = [v6 objectForKeyedSubscript:@"success"];
  unsigned int v8 = [v7 BOOLValue];

  if (v8)
  {
    id v9 = [v6 objectForKeyedSubscript:@"writable"];
    id v10 = &__kCFBooleanFalse;
    if ([v9 BOOLValue])
    {
      id v11 = [v6 objectForKeyedSubscript:@"armed"];
      unsigned int v12 = [v11 BOOLValue];
      id v13 = &__kCFBooleanTrue;
      if (v12) {
        id v13 = &__kCFBooleanFalse;
      }
      id v10 = v13;
    }
    v14 = [v6 objectForKeyedSubscript:@"status"];
    if ([v14 BOOLValue])
    {
      self->settings = 1;
    }
    else
    {
      v15 = [v6 objectForKeyedSubscript:@"armed"];
      self->settings = [v15 BOOLValue];
    }
    if (_os_feature_enabled_impl()) {
      [(DeveloperModeViewController *)self reloadSpecifiers];
    }
    uint64_t v16 = OBJC_IVAR___PSListController__specifiers;
    v17 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] specifierForID:kDeveloperModeToggle];
    [v17 setProperty:v10 forKey:PSEnabledKey];

    id v18 = [*(id *)&self->PSListController_opaque[v16] specifierForID:kDeveloperModeFooter];
    id v19 = +[NSBundle bundleForClass:objc_opt_class()];
    id v20 = [v6 objectForKeyedSubscript:@"writable"];
    if ([v20 BOOLValue]) {
      CFStringRef v21 = @"DEV_MODE_FOOTER";
    }
    else {
      CFStringRef v21 = @"DEV_MODE_FOOTER_FORCE_ENABLED";
    }
    v22 = [v19 localizedStringForKey:v21 value:&stru_8420 table:0];
    [v18 setProperty:v22 forKey:PSFooterTextGroupKey];

    v23 = [*(id *)&self->PSListController_opaque[v16] specifierForID:kDeveloperModeToggle];
    [(DeveloperModeViewController *)self reloadSpecifier:v23 animated:1];
  }
}

- (id)readPreferenceValue:(id)a3
{
  uint64_t v4 = [a3 identifier];
  if ([v4 isEqual:kDeveloperModeToggle])
  {
    xpc_object_t v5 = +[NSNumber numberWithUnsignedLongLong:self->settings];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_6010((uint64_t)v4);
    }
    xpc_object_t v5 = &__kCFBooleanFalse;
  }

  return v5;
}

- (void)refreshLinkStatusInParent
{
  uint64_t v3 = (id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__parentController];
  id WeakRetained = objc_loadWeakRetained(v3);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = objc_loadWeakRetained(v3);
    [v6 reloadSpecifier:*(void *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier]];
  }
}

- (void)setPreferenceValue:(id)a3 forSpecifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = [v6 identifier];
  unsigned int v9 = [v7 BOOLValue];

  if ([v8 isEqual:kDeveloperModeToggle])
  {
    if (v9)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_5198;
      v21[3] = &unk_8328;
      v21[4] = self;
      id v22 = v6;
      v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472;
      v17 = sub_52D4;
      id v18 = &unk_8328;
      id v19 = self;
      id v20 = v22;
      [(DeveloperModeViewController *)self promptRebootWithCallback:v21 onCancel:&v15];
    }
    else
    {
      self->settings = 0;
      [(DeveloperModeViewController *)self reloadSpecifier:v6 animated:1];
      amfidXpc = self->amfidXpc;
      id v11 = dict_to_xpc_msg();
      xpc_object_t v12 = xpc_connection_send_message_with_reply_sync(amfidXpc, v11);

      if (v12)
      {
        id v13 = xpc_msg_to_dict(v12);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = [v13 description];
          *(_DWORD *)buf = 136315138;
          id v24 = [v14 UTF8String];
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "amfid response %s", buf, 0xCu);
        }
      }
    }
    [(DeveloperModeViewController *)self refreshLinkStatusInParent];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_6090((uint64_t)v8);
  }
}

- (void)promptRebootWithCallback:(id)a3 onCancel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v9 = [v8 localizedStringForKey:@"DEV_MODE_WARNING" value:&stru_8420 table:0];
  id v10 = +[UIAlertController alertControllerWithTitle:0 message:v9 preferredStyle:0];

  id v11 = +[NSBundle bundleForClass:objc_opt_class()];
  xpc_object_t v12 = [v11 localizedStringForKey:@"REBOOT" value:&stru_8420 table:0];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_5570;
  v21[3] = &unk_8350;
  v21[4] = self;
  id v22 = v6;
  id v13 = v6;
  id v14 = +[UIAlertAction actionWithTitle:v12 style:2 handler:v21];
  [v10 addAction:v14];

  v15 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v16 = [v15 localizedStringForKey:@"CANCEL" value:&stru_8420 table:0];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_55B8;
  v19[3] = &unk_8378;
  id v20 = v7;
  id v17 = v7;
  id v18 = +[UIAlertAction actionWithTitle:v16 style:0 handler:v19];
  [v10 addAction:v18];

  [(DeveloperModeViewController *)self presentViewController:v10 animated:1 completion:0];
}

- (int)commitChanges
{
  return 0;
}

- (void)reboot
{
  id v3 = [objc_alloc((Class)FBSShutdownOptions) initWithReason:@"com.apple.amfi.developer_mode"];
  [v3 setRebootType:1];
  [v3 setSource:1];
  v2 = +[FBSSystemService sharedService];
  [v2 shutdownWithOptions:v3];
}

- (id)specifiersForPairing
{
  v2 = +[NSMutableArray array];
  id v3 = [&off_8A38 count];
  uint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
  xpc_object_t v5 = v4;
  id v6 = &NSStringFromClass_ptr;
  if (v3)
  {
    id v7 = [v4 localizedStringForKey:@"PAIRED_DEVICES_HEADER" value:&stru_8420 table:0];
    unsigned int v8 = +[PSSpecifier groupSpecifierWithID:@"PAIRED-DEVICES" name:v7];

    [v2 addObject:v8];
    if ([&off_8A38 count])
    {
      unint64_t v9 = 0;
      uint64_t v10 = PSAccessoryKey;
      uint64_t v11 = PSIDKey;
      do
      {
        xpc_object_t v12 = [&off_8A38 objectAtIndexedSubscript:v9];
        id v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:0 set:0 get:0 detail:objc_opt_class() cell:-1 edit:0];

        id v14 = +[NSNumber numberWithInteger:4];
        [v13 setProperty:v14 forKey:v10];

        v15 = +[NSString stringWithFormat:@"%@-%d", @"PAIRED-DEVICE", v9];
        [v13 setProperty:v15 forKey:v11];

        [v2 addObject:v13];
        ++v9;
      }
      while ((unint64_t)[&off_8A38 count] > v9);
    }
    uint64_t v16 = +[NSBundle bundleForClass:objc_opt_class()];
    id v17 = [v16 localizedStringForKey:@"PAIRABLE_DEVICES_HEADER" value:&stru_8420 table:0];
    id v18 = +[PSSpecifier groupSpecifierWithID:@"PAIRABLE-DEVICES" name:v17];

    id v19 = (objc_class *)objc_opt_class();
    id v20 = NSStringFromClass(v19);
    [v18 setProperty:v20 forKey:PSHeaderCellClassGroupKey];

    [v2 addObject:v18];
    id v6 = &NSStringFromClass_ptr;
  }
  else
  {
    CFStringRef v21 = [v4 localizedStringForKey:@"DEVICES_HEADER" value:&stru_8420 table:0];
    unsigned int v8 = +[PSSpecifier groupSpecifierWithID:@"PAIRABLE-DEVICES" name:v21];

    id v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    [v8 setProperty:v23 forKey:PSHeaderCellClassGroupKey];

    [v2 addObject:v8];
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v24 = [&off_8A50 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v33;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v33 != v26) {
          objc_enumerationMutation(&off_8A50);
        }
        [v6[61] stringWithFormat:@"Pair with %@", *(void *)(*((void *)&v32 + 1) + 8 * i)];
        v29 = v28 = v6;
        v30 = +[PSSpecifier preferenceSpecifierNamed:v29 target:0 set:"pairWithHostForSpecificer:" get:0 detail:0 cell:13 edit:0];
        [v2 addObject:v30];

        id v6 = v28;
      }
      id v25 = [&off_8A50 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v25);
  }

  return v2;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v10 = a4;
  if (_os_feature_enabled_impl())
  {
    id v5 = [(DeveloperModeViewController *)self indexForIndexPath:v10];
    id v6 = [(DeveloperModeViewController *)self indexOfSpecifierID:@"PAIRED-DEVICES"];
    if ((uint64_t)v5 <= 255 && (uint64_t)v6 <= 255)
    {
      id v7 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v5];
      unsigned int v8 = objc_opt_new();
      [(DeveloperModeViewController *)self setShowingSetupController:0];
      id WeakRetained = objc_loadWeakRetained((id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__rootController]);
      [v8 setRootController:WeakRetained];

      [v8 setParentController:self];
      [v8 setSpecifier:v7];
      [(DeveloperModeViewController *)self showController:v8];
    }
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_os_feature_enabled_impl()
    && ([(DeveloperModeViewController *)self specifierAtIndexPath:v7],
        unsigned int v8 = objc_claimAutoreleasedReturnValue(),
        [v8 identifier],
        unint64_t v9 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v10 = [v9 containsString:@"PAIRED-DEVICE"],
        v9,
        v8,
        (v10 & 1) != 0))
  {
    BOOL v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)DeveloperModeViewController;
    BOOL v11 = [(DeveloperModeViewController *)&v13 tableView:v6 canEditRowAtIndexPath:v7];
  }

  return v11;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if (_os_feature_enabled_impl())
  {
    id v6 = [(DeveloperModeViewController *)self specifierAtIndexPath:v5];
    id v7 = [v6 identifier];
    unsigned int v8 = [v7 containsString:@"PAIRED-DEVICE"];

    if (v8)
    {
      unint64_t v9 = +[NSBundle bundleForClass:objc_opt_class()];
      unsigned __int8 v10 = [v9 localizedStringForKey:@"PAIRED_DEVICE_SWIPE_ACTION_UNPAIR" value:&stru_8420 table:0];
      uint64_t v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472;
      id v18 = sub_5F14;
      id v19 = &unk_83A0;
      id v20 = self;
      id v21 = v6;
      id v11 = v6;
      xpc_object_t v12 = +[UIContextualAction contextualActionWithStyle:1 title:v10 handler:&v16];

      id v22 = v12;
      objc_super v13 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1, v16, v17, v18, v19, v20);
      id v14 = +[UISwipeActionsConfiguration configurationWithActions:v13];

      goto LABEL_6;
    }
  }
  id v14 = +[UISwipeActionsConfiguration configurationWithActions:&__NSArray0__struct];
LABEL_6:

  return v14;
}

- (void).cxx_destruct
{
}

@end