@interface HSPCNameAccessoryViewController
- (HSPCNameAccessoryViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (id)commitConfiguration;
- (id)suggestedAccessoryName;
- (void)viewDidLoad;
@end

@implementation HSPCNameAccessoryViewController

- (HSPCNameAccessoryViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HSPCNameAccessoryViewController;
  v7 = [(HSPCTextFieldViewController *)&v18 initWithCoordinator:v6 config:a4];
  if (v7)
  {
    v8 = [v6 activeTuple];
    v9 = [v8 accessoryCategoryOrPrimaryServiceType];
    v10 = HFLocalizedCategoryOrPrimaryServiceTypeString();
    [(HSPCNameAccessoryViewController *)v7 setTitle:v10];

    v11 = HULocalizedString();
    [(HSPCNameAccessoryViewController *)v7 setSubtitle:v11];

    v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      v15 = [(HSPCTextFieldViewController *)v7 config];
      v16 = [v15 addedAccessory];
      *(_DWORD *)buf = 138412546;
      v20 = v14;
      __int16 v21 = 2112;
      v22 = v16;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ accessory %@", buf, 0x16u);
    }
  }

  return v7;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)HSPCNameAccessoryViewController;
  [(HSPCTextFieldViewController *)&v4 viewDidLoad];
  v3 = [(HSPCNameAccessoryViewController *)self suggestedAccessoryName];
  [(HSPCTextFieldViewController *)self setTextFieldText:v3];
  [(HSPCTextFieldViewController *)self setTextFieldPlaceholderText:v3];
}

- (id)commitConfiguration
{
  [(HSPCTextFieldViewController *)self endEditing];
  v3 = [(HSPCTextFieldViewController *)self config];
  objc_super v4 = [(HSPCTextFieldViewController *)self textFieldText];
  v5 = [v3 updateUserGivenAccessoryName:v4];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100032F34;
  v13[3] = &unk_1000A9E88;
  v13[4] = self;
  id v6 = [v5 flatMap:v13];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100032F84;
  v12[3] = &unk_1000A9E88;
  v12[4] = self;
  v7 = [v6 flatMap:v12];
  v8 = [(HSPCTextFieldViewController *)self textFieldText];
  v9 = +[NSString stringWithFormat:@"Accessory update naming: \"%@\"", v8];
  v10 = [v7 hs_commitConfigurationFutureWithContextMessage:v9];

  return v10;
}

- (id)suggestedAccessoryName
{
  v3 = [(HSPCTextFieldViewController *)self coordinator];
  objc_super v4 = [v3 setupAccessoryDescription];
  v5 = [v4 suggestedAccessoryName];
  id v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = [(HSPCTextFieldViewController *)self coordinator];
    v9 = [v8 activeTuple];
    uint64_t v10 = [v9 titleForAccessory];
    v11 = (void *)v10;
    v12 = &stru_1000ABBA8;
    if (v10) {
      v12 = (__CFString *)v10;
    }
    v7 = v12;
  }
  v13 = [(HSPCTextFieldViewController *)self config];
  v14 = [v13 home];

  if (v14)
  {
    v15 = [v14 accessories];
    uint64_t v16 = [v15 na_map:&stru_1000AA578];
    v17 = (void *)v16;
    if (v16) {
      objc_super v18 = (void *)v16;
    }
    else {
      objc_super v18 = &__NSArray0__struct;
    }
    v19 = +[NSSet setWithArray:v18];
    v20 = [(HSPCTextFieldViewController *)self config];
    __int16 v21 = [v20 addedAccessory];
    v22 = [v21 name];
    v23 = +[NSSet na_setWithSafeObject:v22];
    v24 = [v19 na_setByRemovingObjectsFromSet:v23];

    v25 = +[HFUtilities uniqueHomeKitNameForName:v7 allNames:v24];
  }
  else
  {
    v25 = v7;
  }

  return v25;
}

@end