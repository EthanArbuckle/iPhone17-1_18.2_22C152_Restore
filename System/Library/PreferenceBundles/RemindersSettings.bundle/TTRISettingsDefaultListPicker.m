@interface TTRISettingsDefaultListPicker
- (REMStore)store;
- (TTRISettingsDefaultListPickerViewModel)viewModel;
- (id)generateViewModel;
- (id)listViewModelForIndexPath:(id)a3;
- (id)specifiers;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)setSpecifier:(id)a3;
- (void)setStore:(id)a3;
- (void)setViewModel:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation TTRISettingsDefaultListPicker

- (void)viewDidAppear:(BOOL)a3
{
  v23.receiver = self;
  v23.super_class = (Class)TTRISettingsDefaultListPicker;
  [(TTRISettingsDefaultListPicker *)&v23 viewDidAppear:a3];
  v4 = +[NSString stringWithFormat:@"%@/DEFAULT_LIST", REMSettingsNavigationDeepLinkGeneralPath];
  v5 = +[NSURL URLWithString:v4];

  id v6 = objc_alloc((Class)_NSLocalizedStringResource);
  v7 = +[NSLocale currentLocale];
  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = [v8 bundleURL];
  id v10 = [v6 initWithKey:@"Default List" table:0 locale:v7 bundleURL:v9];

  id v11 = objc_alloc((Class)_NSLocalizedStringResource);
  v12 = +[NSLocale currentLocale];
  v13 = +[NSBundle bundleForClass:objc_opt_class()];
  v14 = [v13 bundleURL];
  id v15 = [v11 initWithKey:@"Apps" table:0 locale:v12 bundleURL:v14];

  id v16 = objc_alloc((Class)_NSLocalizedStringResource);
  v17 = +[NSLocale currentLocale];
  v18 = +[NSBundle bundleForClass:objc_opt_class()];
  v19 = [v18 bundleURL];
  id v20 = [v16 initWithKey:@"Reminders" table:0 locale:v17 bundleURL:v19];

  uint64_t v21 = REMAppBundleIdentifier;
  v24[0] = v15;
  v24[1] = v20;
  v22 = +[NSArray arrayWithObjects:v24 count:2];
  [(TTRISettingsDefaultListPicker *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:v21 title:v10 localizedNavigationComponents:v22 deepLink:v5];
}

- (void)setSpecifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TTRISettingsDefaultListPicker;
  [(TTRISettingsDefaultListPicker *)&v5 setSpecifier:a3];
  id v4 = objc_alloc_init((Class)REMStore);
  [(TTRISettingsDefaultListPicker *)self setStore:v4];
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = +[REMUserDefaults daemonUserDefaults];
  v7 = [v6 preferredDefaultListID];

  v8 = +[NSString stringWithFormat:@"%@/DEFAULT_LIST", REMSettingsNavigationDeepLinkGeneralPath];
  v9 = +[NSURL URLWithString:v8];

  id v10 = objc_alloc((Class)_NSLocalizedStringResource);
  id v11 = +[NSLocale currentLocale];
  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 bundleURL];
  id v14 = [v10 initWithKey:@"Change Default List Settings" table:0 locale:v11 bundleURL:v13];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_55F4;
  v18[3] = &unk_1CC98;
  id v19 = v7;
  id v20 = self;
  id v15 = v7;
  id v16 = objc_retainBlock(v18);
  [(TTRISettingsDefaultListPicker *)self pe_registerUndoActionName:v14 associatedDeepLink:v9 undoAction:v16];
  v17 = +[REMUserDefaults daemonUserDefaults];
  [v17 setPreferredDefaultListID:v5];
}

- (id)specifiers
{
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v28 = OBJC_IVAR___PSListController__specifiers;
    id v4 = [(TTRISettingsDefaultListPicker *)self generateViewModel];
    [(TTRISettingsDefaultListPicker *)self setViewModel:v4];

    id v37 = objc_alloc_init((Class)NSMutableArray);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v5 = [(TTRISettingsDefaultListPicker *)self viewModel];
    id v6 = [v5 accounts];

    id obj = v6;
    id v31 = [v6 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v31)
    {
      uint64_t v30 = *(void *)v43;
      uint64_t v7 = PSValueKey;
      uint64_t v34 = PSRadioGroupCheckedSpecifierKey;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v43 != v30) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v42 + 1) + 8 * v8);
          id v10 = [(TTRISettingsDefaultListPicker *)self viewModel];
          id v11 = [v10 accounts];
          id v12 = [v11 count];

          uint64_t v33 = v8;
          if ((unint64_t)v12 < 2)
          {
            uint64_t v13 = 0;
          }
          else
          {
            uint64_t v13 = [v9 name];
          }
          v32 = (void *)v13;
          v35 = +[REMSettingsUtilities radioGroupSpecifierWithHeader:v13 footer:0 keyName:@"preferredDefaultListID" scope:0];
          objc_msgSend(v37, "addObject:");
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          id v36 = [v9 lists];
          id v14 = [v36 countByEnumeratingWithState:&v38 objects:v46 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v39;
            do
            {
              for (i = 0; i != v15; i = (char *)i + 1)
              {
                if (*(void *)v39 != v16) {
                  objc_enumerationMutation(v36);
                }
                v18 = *(void **)(*((void *)&v38 + 1) + 8 * i);
                id v19 = +[TTRIListSummaryCell specifierWithViewModel:v18 target:self cell:3 detail:0 keyName:@"preferredDefaultListID" defaultValue:0 scope:0];
                id v20 = [v18 listID];
                [v19 setObject:v20 forKeyedSubscript:v7];

                uint64_t v21 = [v18 listID];
                v22 = [(TTRISettingsDefaultListPicker *)self viewModel];
                objc_super v23 = [v22 selectedListID];
                unsigned int v24 = [v21 isEqual:v23];

                if (v24) {
                  [v35 setProperty:v19 forKey:v34];
                }
                [v37 addObject:v19];
              }
              id v15 = [v36 countByEnumeratingWithState:&v38 objects:v46 count:16];
            }
            while (v15);
          }

          uint64_t v8 = v33 + 1;
        }
        while ((id)(v33 + 1) != v31);
        id v31 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v31);
    }

    id v25 = [v37 copy];
    v26 = *(void **)&self->PSListController_opaque[v28];
    *(void *)&self->PSListController_opaque[v28] = v25;

    v3 = *(void **)&self->PSListController_opaque[v28];
  }

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)TTRISettingsDefaultListPicker;
  id v6 = a4;
  [(TTRISettingsDefaultListPicker *)&v14 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = -[TTRISettingsDefaultListPicker specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v14.receiver, v14.super_class);

  uint64_t v8 = [(TTRISettingsDefaultListPicker *)self getGroupSpecifierForSpecifier:v7];
  v9 = [v8 propertyForKey:PSIsRadioGroupKey];
  unsigned int v10 = [v9 BOOLValue];

  if (v10)
  {
    id v11 = [v8 propertyForKey:PSRadioGroupCheckedSpecifierKey];
    id v12 = [v11 propertyForKey:PSValueKey];
    [(TTRISettingsDefaultListPicker *)self setPreferenceValue:v12 specifier:v8];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__parentController]);
  [WeakRetained reloadSpecifier:*(void *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier]];

  [(TTRISettingsDefaultListPicker *)self reloadSpecifiers];
}

- (id)listViewModelForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(TTRISettingsDefaultListPicker *)self viewModel];
  id v6 = [v5 accounts];
  uint64_t v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
  uint64_t v8 = [v7 lists];
  id v9 = [v4 row];

  unsigned int v10 = [v8 objectAtIndexedSubscript:v9];

  return v10;
}

- (id)generateViewModel
{
  id v31 = +[NSMutableArray array];
  v3 = objc_opt_new();
  uint64_t v30 = self;
  id v4 = [(TTRISettingsDefaultListPicker *)self store];
  id v37 = 0;
  id v5 = [v4 fetchEligibleDefaultListsWithError:&v37];
  id v29 = v37;

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v12 = [[TTRISettingsDefaultListPickerViewModel_List alloc] initWithList:v11];
        uint64_t v13 = [v11 account];
        objc_super v14 = [v13 objectID];
        id v15 = [v3 objectForKeyedSubscript:v14];

        if (!v15)
        {
          uint64_t v16 = [TTRISettingsDefaultListPickerViewModel_Account alloc];
          v17 = [v11 account];
          id v15 = [(TTRISettingsDefaultListPickerViewModel_Account *)v16 initWithAccount:v17];

          v18 = [v11 account];
          id v19 = [v18 objectID];
          [v3 setObject:v15 forKeyedSubscript:v19];

          [v31 addObject:v15];
        }
        id v20 = [(TTRISettingsDefaultListPickerViewModel_Account *)v15 lists];
        uint64_t v21 = [v20 arrayByAddingObject:v12];
        [(TTRISettingsDefaultListPickerViewModel_Account *)v15 setLists:v21];
      }
      id v8 = [v6 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v8);
  }

  v22 = objc_alloc_init(TTRISettingsDefaultListPickerViewModel);
  id v23 = [v31 copy];
  [(TTRISettingsDefaultListPickerViewModel *)v22 setAccounts:v23];

  unsigned int v24 = [(TTRISettingsDefaultListPicker *)v30 store];
  id v32 = v29;
  id v25 = [v24 fetchDefaultListWithError:&v32];
  id v26 = v32;

  v27 = [v25 objectID];
  [(TTRISettingsDefaultListPickerViewModel *)v22 setSelectedListID:v27];

  return v22;
}

- (TTRISettingsDefaultListPickerViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (REMStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);

  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end