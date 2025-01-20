@interface ContactProviderController
- (id)readToggleSwitchSpecifierValue:(id)a3;
- (id)specifiers;
- (void)setToggleSwitchSpecifierValue:(id)a3 specifier:(id)a4;
@end

@implementation ContactProviderController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = sub_7474;
    v28 = sub_7484;
    id v29 = 0;
    uint64_t v6 = +[PSSpecifier emptyGroupSpecifier];
    v7 = (void *)v25[5];
    v25[5] = v6;

    v8 = (void *)v25[5];
    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"PROVIDERS_EXPLANATORY" value:&stru_10D88 table:@"Contacts"];
    [v8 setProperty:v10 forKey:PSFooterTextGroupKey];

    [v5 addObject:v25[5]];
    uint64_t v11 = +[PSSpecifier emptyGroupSpecifier];
    v12 = (void *)v25[5];
    v25[5] = v11;

    [v5 addObject:v25[5]];
    v13 = +[CNContactProviderSupport allDomainsWithError:0];
    v14 = objc_msgSend(v13, "_cn_safeSortedArrayUsingComparator:", &stru_10B30);

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_7500;
    v19[3] = &unk_10B58;
    v21 = &v24;
    v22 = "setToggleSwitchSpecifierValue:specifier:";
    v19[4] = self;
    v23 = "readToggleSwitchSpecifierValue:";
    id v15 = v5;
    id v20 = v15;
    objc_msgSend(v14, "_cn_each:", v19);
    v16 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v15;
    id v17 = v15;

    _Block_object_dispose(&v24, 8);
    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)readToggleSwitchSpecifierValue:(id)a3
{
  uint64_t v3 = [a3 userInfo];
  v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isEnabled]);

  return v4;
}

- (void)setToggleSwitchSpecifierValue:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 userInfo];
  id v9 = [v7 BOOLValue];

  v10 = [v8 domainIdentifier];
  uint64_t v11 = [v8 bundleIdentifier];
  if (v9)
  {
    uint64_t v15 = 0;
    v12 = (id *)&v15;
    +[CNContactProviderSupport enableDomain:v10 bundleIdentifier:v11 shouldSynchronize:1 error:&v15];
  }
  else
  {
    uint64_t v14 = 0;
    v12 = (id *)&v14;
    +[CNContactProviderSupport disableDomain:v10 bundleIdentifier:v11 error:&v14];
  }
  id v13 = *v12;

  if (v13) {
    [(ContactProviderController *)self reloadSpecifier:v6];
  }
  else {
    [v8 setEnabled:v9];
  }
}

@end