@interface AccountPSOutgoingController
- (id)_getStatusForServer:(id)a3;
- (id)specifierForDeliveryAccount:(id)a3 isPrimary:(BOOL)a4 isCarrierAccount:(BOOL)a5;
- (id)specifiers;
- (void)canceledAccountSetup;
- (void)finishedAccountSetup;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation AccountPSOutgoingController

- (id)_getStatusForServer:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = [v5 objectForKey:@"OutgoingAccountAccountKey"];

  v7 = [v4 userInfo];
  v8 = [v7 objectForKey:@"OutgoingAccountIsCarrierAccountKey"];
  unsigned int v9 = [v8 BOOLValue];

  v10 = [v4 userInfo];
  v11 = [v10 objectForKey:@"OutgoingAccountIsPrimaryAccountKey"];
  LODWORD(v8) = [v11 BOOLValue];

  v12 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] userInfo];
  v13 = [v12 objectForKey:@"ExistingMessageAccount"];

  if (!v8)
  {
    if (v9) {
      unsigned int v15 = [v13 canUseCarrierDeliveryFallback];
    }
    else {
      unsigned int v15 = [v13 canUseDeliveryAccount:v6];
    }
    if (v15) {
      goto LABEL_4;
    }
LABEL_9:
    CFStringRef v14 = @"OFF";
    goto LABEL_10;
  }
  if (![v6 isActive]
    || ([v13 isPrimaryDeliveryAccountDisabled] & 1) != 0)
  {
    goto LABEL_9;
  }
LABEL_4:
  CFStringRef v14 = @"ON";
LABEL_10:

  return (id)v14;
}

- (id)specifierForDeliveryAccount:(id)a3 isPrimary:(BOOL)a4 isCarrierAccount:(BOOL)a5
{
  BOOL v34 = a5;
  BOOL v5 = a4;
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = [v6 displayHostname];
  }
  else
  {
    unsigned int v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = [v9 localizedStringForKey:@"NO_PRIMARY_SMTP_SERVER_CONFIGURED" value:&stru_B9F70 table:@"AccountPreferences"];
  }
  BOOL v32 = v5;
  if (v34)
  {
    v10 = +[MFNetworkController sharedInstance];
    id v11 = [v10 copyCarrierBundleValue:@"CarrierName"];

    v12 = +[NSBundle bundleForClass:objc_opt_class()];
    if (v11)
    {
      v13 = [v12 localizedStringForKey:@"CARRIER_SMTP_SERVER" value:&stru_B9F70 table:@"AccountPreferences"];

      uint64_t v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v11);
    }
    else
    {
      v13 = [v12 localizedStringForKey:@"CARRIER_ACCOUNT_STRING" value:&stru_B9F70 table:@"AccountPreferences"];

      unsigned int v15 = +[NSBundle bundleForClass:objc_opt_class()];
      v16 = [v15 localizedStringForKey:@"CELL_DATA_ONLY" value:&stru_B9F70 table:@"AccountPreferences"];
      uint64_t v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v8, v16);

      v8 = v15;
    }

    v8 = (void *)v14;
  }
  v17 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:"_getStatusForServer:" detail:objc_opt_class() cell:2 edit:0];
  v18 = +[NSArray arrayWithObjects:@"OFF", @"ON", 0];
  v19 = +[NSBundle bundleForClass:objc_opt_class()];
  v20 = [v19 localizedStringForKey:@"OFF" value:&stru_B9F70 table:@"AccountPreferences"];
  v21 = +[NSBundle bundleForClass:objc_opt_class()];
  v22 = [v21 localizedStringForKey:@"ON" value:&stru_B9F70 table:@"AccountPreferences"];
  v23 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v20, v22, 0);
  [v17 setValues:v18 titles:v23];

  v24 = [v7 uniqueID];
  [v17 setProperty:v24 forKey:PSIDKey];

  id v25 = objc_alloc_init((Class)NSMutableDictionary);
  v26 = v25;
  if (v7) {
    [v25 setObject:v7 forKey:@"OutgoingAccountAccountKey"];
  }
  v27 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] userInfo];
  v28 = [v27 objectForKey:@"ExistingMessageAccount"];
  [v26 setObject:v28 forKey:@"OutgoingAccountViewingAccountKey"];

  if (v32)
  {
    v29 = +[NSNumber numberWithBool:1];
    [v26 setObject:v29 forKey:@"OutgoingAccountIsPrimaryAccountKey"];
  }
  if (v34)
  {
    v30 = +[NSNumber numberWithBool:1];
    [v26 setObject:v30 forKey:@"OutgoingAccountIsCarrierAccountKey"];
  }
  [v17 setUserInfo:v26];

  return v17;
}

- (id)specifiers
{
  uint64_t v2 = OBJC_IVAR___PSViewController__specifier;
  v36 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] userInfo];
  v37 = [v36 objectForKey:@"ExistingMessageAccount"];
  v42 = +[NSMutableArray arrayWithCapacity:6];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"PRIMARY_SERVER" value:&stru_B9F70 table:@"AccountPreferences"];
  BOOL v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:0 set:0 get:0 detail:0 cell:0 edit:0];
  [v42 addObject:v5];

  v45 = [v37 deliveryAccount];
  id v6 = [(AccountPSOutgoingController *)self specifierForDeliveryAccount:v45 isPrimary:1 isCarrierAccount:0];
  [v42 addObject:v6];

  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"OTHER_SMTP_SERVERS" value:&stru_B9F70 table:@"AccountPreferences"];
  v38 = +[PSSpecifier groupSpecifierWithName:v8];

  unsigned int v9 = +[NSBundle bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"OTHER_SMTP_SERVERS_DESCRIPTION" value:&stru_B9F70 table:@"AccountPreferences"];
  [v38 setProperty:v10 forKey:PSFooterTextGroupKey];

  [v42 addObject:v38];
  +[DeliveryAccount deliveryAccounts];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v11 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v51;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v51 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        if (([v14 isEqual:v45] & 1) == 0
          && [v14 canBeFallbackAccount])
        {
          unsigned int v15 = [(AccountPSOutgoingController *)self specifierForDeliveryAccount:v14 isPrimary:0 isCarrierAccount:0];
          [v42 addObject:v15];
        }
      }
      id v11 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v11);
  }

  v35 = +[DeliveryAccount carrierDeliveryAccount];
  if (v35)
  {
    v16 = [(AccountPSOutgoingController *)self specifierForDeliveryAccount:v35 isPrimary:0 isCarrierAccount:1];
    [v42 addObject:v16];
  }
  v17 = +[NSBundle bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:@"ADD_SMTP_SERVER" value:&stru_B9F70 table:@"AccountPreferences"];
  id v39 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

  objc_storeStrong((id *)&self->_newOutgoingAccountSpecifier, v39);
  id v40 = objc_alloc_init((Class)NSMutableDictionary);
  v19 = [*(id *)&self->PSListController_opaque[v2] userInfo];
  v20 = [v19 objectForKey:@"ExistingMessageAccount"];
  [v40 setObject:v20 forKey:@"OutgoingAccountViewingAccountKey"];

  [v40 setObject:kCFBooleanTrue forKey:@"disableForModificationRestrictions"];
  [v39 setUserInfo:v40];
  [v42 addObject:v39];
  v21 = +[MCProfileConnection sharedConnection];
  LODWORD(v19) = [v21 effectiveBoolValueForSetting:MCFeatureAccountModificationAllowed] == 2;

  if (v19)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v43 = v42;
    id v22 = [v43 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v47;
      uint64_t v24 = PSEnabledKey;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v47 != v23) {
            objc_enumerationMutation(v43);
          }
          v26 = *(void **)(*((void *)&v46 + 1) + 8 * (void)j);
          v27 = [v26 userInfo];
          v28 = [v27 objectForKeyedSubscript:@"disableForModificationRestrictions"];
          unsigned int v29 = [v28 BOOLValue];

          if (v29) {
            [v26 setProperty:kCFBooleanFalse forKey:v24];
          }
        }
        id v22 = [v43 countByEnumeratingWithState:&v46 objects:v54 count:16];
      }
      while (v22);
    }
  }
  v30 = (id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  id v31 = *v30;
  id *v30 = v42;
  id v32 = v42;

  id v33 = *v30;
  return v33;
}

- (void)finishedAccountSetup
{
  [(AccountPSOutgoingController *)self reloadOutgoingAccounts];
  id v3 = [(AccountPSOutgoingController *)self parentController];
  [v3 reloadSpecifiers];
}

- (void)canceledAccountSetup
{
  id v4 = [(AccountPSOutgoingController *)self parentController];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v5 = [(AccountPSOutgoingController *)self parentController];
    [v5 performSelector:"didFinishEditingDeliveryAccount"];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_msgSend(*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers], "objectAtIndex:", -[AccountPSOutgoingController indexForIndexPath:](self, "indexForIndexPath:", v7));
  v8 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  if (self->_newOutgoingAccountSpecifier == v8)
  {
    unsigned int v9 = [(AccountPSOutgoingController *)self parentController];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = [(AccountPSOutgoingController *)self parentController];
      [v11 performSelector:"didFinishEditingDeliveryAccount"];
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)AccountPSOutgoingController;
  [(AccountPSOutgoingController *)&v12 tableView:v6 didSelectRowAtIndexPath:v7];
}

- (void).cxx_destruct
{
}

@end