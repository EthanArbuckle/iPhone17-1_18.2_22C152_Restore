@interface AccountPSAdvancedController
- (BOOL)_allowIdentitySelectionForIdentityPickerController:(id)a3;
- (BOOL)_allowUserInteractiveSwitchForIdentityPickerController:(id)a3;
- (BOOL)isPropertyEnabledForIdentityPickerController:(id)a3;
- (BOOL)shouldSelectResponderOnAppearance;
- (BOOL)storeMailboxTypeOnServer:(int64_t)a3;
- (NSDictionary)accountValues;
- (__SecIdentity)selectedIdentityForIdentityPickerController:(id)a3;
- (__SecTrust)copyTrustForIdentityPickerController:(id)a3 identity:(__SecIdentity *)a4;
- (id)account;
- (id)accountPropertyWithSpecifier:(id)a3;
- (id)authSchemeTitlesForSpecifier:(id)a3;
- (id)authSchemeValuesForSpecifier:(id)a3;
- (id)copyIdentitiesForIdentityPickerController:(id)a3;
- (id)deleteIntervalString;
- (id)emailAddressesForIdentityPickerController:(id)a3;
- (id)localizedSwitchNameForIdentityPickerController:(id)a3;
- (id)mailbox:(id)a3;
- (id)mailboxUidForType:(int64_t)a3;
- (id)specifiers;
- (unint64_t)configurationOptionsForIdentityPickerController:(id)a3;
- (void)_resetTargetsForSpecifiers:(id)a3;
- (void)_updateArchiveByDefaultSpecifiers;
- (void)identityPickerController:(id)a3 setPropertyEnabled:(BOOL)a4 withIdentity:(__SecIdentity *)a5;
- (void)pickerDidChooseMailbox:(id)a3 forType:(int64_t)a4;
- (void)setAccountProperty:(id)a3 withSpecifier:(id)a4;
- (void)setDeleteIntervalString:(id)a3 withSpecifier:(id)a4;
- (void)setSSLSetting:(id)a3 withSpecifier:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation AccountPSAdvancedController

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)AccountPSAdvancedController;
  [(AccountPSAdvancedController *)&v8 viewDidLoad];
  if (!self->_accountValues)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    accountValues = self->_accountValues;
    self->_accountValues = v3;
  }
  if (!self->_originalAccountValues)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    originalAccountValues = self->_originalAccountValues;
    self->_originalAccountValues = v5;
  }
  [(MailAccount *)self->_account copySecureMIMEIdentitiesIntoDictionary:self->_accountValues];
  [(MailAccount *)self->_account copySecureMIMEIdentitiesIntoDictionary:self->_originalAccountValues];
  uint64_t v7 = OBJC_IVAR___PSListController__specifiers;
  [(MailAccount *)self->_account copyAccountPropertiesForSpecifiers:*(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] intoDictionary:self->_accountValues];
  [(MailAccount *)self->_account copyAccountPropertiesForSpecifiers:*(void *)&self->PSListController_opaque[v7] intoDictionary:self->_originalAccountValues];
  [(AccountPSAdvancedController *)self _updateArchiveByDefaultSpecifiers];
}

- (id)specifiers
{
  v38 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] userInfo];
  id obj = [v38 objectForKey:@"ExistingMessageAccount"];
  if (obj)
  {
    id v2 = objc_alloc((Class)NSMutableArray);
    v3 = [obj advancedSpecifiers];
    id v4 = [v2 initWithArray:v3];

    v35 = v4;
    [(AccountPSAdvancedController *)self _resetTargetsForSpecifiers:v4];
    v5 = [v38 objectForKeyedSubscript:@"values"];
    accountValues = self->_accountValues;
    self->_accountValues = v5;

    uint64_t v7 = [v38 objectForKeyedSubscript:@"originalValues"];
    originalAccountValues = self->_originalAccountValues;
    self->_originalAccountValues = v7;

    p_account = &self->_account;
    objc_storeStrong((id *)&self->_account, obj);
    if ([(MailAccount *)self->_account isManaged])
    {
      id v40 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:0];
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v39 = v4;
      id v9 = [v39 countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v47;
        uint64_t v11 = PSEnabledKey;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v47 != v10) {
              objc_enumerationMutation(v39);
            }
            v13 = *(char **)(*((void *)&v46 + 1) + 8 * i);
            v14 = objc_msgSend(v13, "userInfo", p_account);
            v15 = [v14 objectForKey:@"disableForManagedAccounts"];
            unsigned int v16 = [v15 BOOLValue];

            if (v16) {
              [v13 setProperty:kCFBooleanFalse forKey:v11];
            }
            if (!*(void *)&v13[OBJC_IVAR___PSSpecifier_cellType])
            {
              v17 = v13;

              id v40 = v17;
            }
          }
          id v9 = [v39 countByEnumeratingWithState:&v46 objects:v51 count:16];
        }
        while (v9);
      }

      v18 = [(MailAccount *)*p_account managedAccountFooterText];
      if (v18) {
        [v40 setProperty:v18 forKey:PSFooterTextGroupKey];
      }
    }
    v19 = +[MCProfileConnection sharedConnection];
    BOOL v20 = [v19 effectiveBoolValueForSetting:MCFeatureAccountModificationAllowed] == 2;

    if (v20)
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v41 = v35;
      id v21 = [v41 countByEnumeratingWithState:&v42 objects:v50 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v43;
        uint64_t v23 = PSEnabledKey;
        do
        {
          for (j = 0; j != v21; j = (char *)j + 1)
          {
            if (*(void *)v43 != v22) {
              objc_enumerationMutation(v41);
            }
            v25 = *(void **)(*((void *)&v42 + 1) + 8 * (void)j);
            v26 = [v25 userInfo];
            v27 = [v26 objectForKeyedSubscript:@"disableForModificationRestrictions"];
            unsigned int v28 = [v27 BOOLValue];

            if (v28) {
              [v25 setProperty:kCFBooleanFalse forKey:v23];
            }
          }
          id v21 = [v41 countByEnumeratingWithState:&v42 objects:v50 count:16];
        }
        while (v21);
      }
    }
    v29 = (id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
    id v30 = *v29;
    id *v29 = v35;
    id v31 = v35;

    id v32 = *v29;
  }
  else
  {
    id v32 = 0;
  }

  return v32;
}

- (BOOL)shouldSelectResponderOnAppearance
{
  return 0;
}

- (NSDictionary)accountValues
{
  id v2 = [(NSMutableDictionary *)self->_accountValues copy];

  return (NSDictionary *)v2;
}

- (void)_resetTargetsForSpecifiers:(id)a3
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v7), "setTarget:", self, (void)v8);
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_updateArchiveByDefaultSpecifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiersByID;
  id v8 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiersByID] objectForKey:@"MFArchiveMessagesGroupSpecifierID"];
  id v4 = [*(id *)&self->PSListController_opaque[v3] objectForKey:@"MFArchiveMessagesTrashMailboxSpecifierID"];
  id v5 = [*(id *)&self->PSListController_opaque[v3] objectForKey:@"MFArchiveMessagesArchiveMailboxSpecifierID"];
  uint64_t v6 = [(NSMutableDictionary *)self->_accountValues objectForKey:MFMailAccountArchive];
  if ([v6 BOOLValue]) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = v4;
  }
  [v8 setProperty:v7 forKey:PSRadioGroupCheckedSpecifierKey];
}

- (void)setAccountProperty:(id)a3 withSpecifier:(id)a4
{
  id v10 = a3;
  uint64_t v6 = [a4 propertyForKey:PSKeyNameKey];
  if (v6)
  {
    accountValues = self->_accountValues;
    if (v10)
    {
      if (!accountValues)
      {
        id v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        long long v9 = self->_accountValues;
        self->_accountValues = v8;

        accountValues = self->_accountValues;
      }
      [(NSMutableDictionary *)accountValues setObject:v10 forKey:v6];
    }
    else
    {
      [(NSMutableDictionary *)accountValues removeObjectForKey:v6];
    }
  }
}

- (id)accountPropertyWithSpecifier:(id)a3
{
  accountValues = self->_accountValues;
  id v4 = [a3 propertyForKey:PSKeyNameKey];
  id v5 = [(NSMutableDictionary *)accountValues objectForKey:v4];

  return v5;
}

- (void)setSSLSetting:(id)a3 withSpecifier:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v7 = [(AccountPSAdvancedController *)self specifierForID:@"SERVER_PORT"];
  if ([v13 BOOLValue])
  {
    id v8 = [(AccountPSAdvancedController *)self accountPropertyWithSpecifier:v7];
    unsigned int v9 = [v8 intValue];

    if (v9 == 143)
    {
      CFStringRef v10 = @"993";
LABEL_7:
      [(AccountPSAdvancedController *)self setAccountProperty:v10 withSpecifier:v7];
      goto LABEL_8;
    }
  }
  if (([v13 BOOLValue] & 1) == 0)
  {
    long long v11 = [(AccountPSAdvancedController *)self accountPropertyWithSpecifier:v7];
    unsigned int v12 = [v11 intValue];

    if (v12 == 993)
    {
      CFStringRef v10 = @"143";
      goto LABEL_7;
    }
  }
LABEL_8:
  [(AccountPSAdvancedController *)self setAccountProperty:v13 withSpecifier:v6];
  [(AccountPSAdvancedController *)self reloadSpecifiers];
}

- (id)mailbox:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"MailboxType"];
  uint64_t v6 = (int)[v5 intValue];

  uint64_t v7 = +[MFAccount storeOnServerSettingsForType:v6];
  id v8 = [v7 key];
  unsigned int v9 = [v7 mailboxNameKey];
  CFStringRef v10 = [(NSMutableDictionary *)self->_accountValues objectForKey:v8];
  unsigned int v11 = [v10 BOOLValue];

  if (v11)
  {
    unsigned int v12 = [(NSMutableDictionary *)self->_accountValues objectForKey:v9];
    id v13 = v12;
    if (v12)
    {
      v14 = [v12 displayName];
      goto LABEL_7;
    }
    v15 = -[MailAccount specialMailboxNameForType:](self->_account, "specialMailboxNameForType:", [v7 type]);
    uint64_t v16 = [v15 lastPathComponent];
  }
  else
  {
    id v13 = +[NSBundle bundleForClass:objc_opt_class()];
    v15 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"ON_MY"];
    uint64_t v16 = [v13 localizedStringForKey:v15 value:&stru_B9F70 table:@"AccountPreferences"];
  }
  v14 = (void *)v16;

LABEL_7:

  return v14;
}

- (id)authSchemeValuesForSpecifier:(id)a3
{
  uint64_t v3 = [(id)objc_opt_class() authSchemeValues];

  return v3;
}

- (id)authSchemeTitlesForSpecifier:(id)a3
{
  uint64_t v3 = [(id)objc_opt_class() authSchemeTitles];

  return v3;
}

- (void)setDeleteIntervalString:(id)a3 withSpecifier:(id)a4
{
  id v8 = a3;
  if ([v8 isEqual:@"NEVER"])
  {
    uint64_t v5 = 0;
    account = self->_account;
LABEL_5:
    [(MailAccount *)account setMessageDeletionPolicy:v5];
    goto LABEL_7;
  }
  unsigned int v7 = [v8 isEqual:@"AFTER_DELETE"];
  account = self->_account;
  if (v7)
  {
    uint64_t v5 = 3;
    goto LABEL_5;
  }
  [(MailAccount *)account setMessageDeletionPolicy:2];
  [(MailAccount *)self->_account setDelayedMessageDeletionInterval:7];
LABEL_7:
}

- (id)deleteIntervalString
{
  id v2 = (char *)[(MailAccount *)self->_account messageDeletionPolicy];
  CFStringRef v3 = @"NEVER";
  if (v2 == (unsigned char *)&dword_0 + 3) {
    CFStringRef v3 = @"AFTER_DELETE";
  }
  if (v2 == (unsigned char *)&dword_0 + 2) {
    return @"7_DAYS";
  }
  else {
    return (id)v3;
  }
}

- (id)account
{
  return self->_account;
}

- (id)mailboxUidForType:(int64_t)a3
{
  id v4 = +[MFAccount storeOnServerSettingsForType:a3];
  accountValues = self->_accountValues;
  uint64_t v6 = [v4 mailboxNameKey];
  unsigned int v7 = [(NSMutableDictionary *)accountValues objectForKey:v6];

  return v7;
}

- (BOOL)storeMailboxTypeOnServer:(int64_t)a3
{
  id v4 = +[MFAccount storeOnServerSettingsForType:a3];
  accountValues = self->_accountValues;
  uint64_t v6 = [v4 key];
  unsigned int v7 = [(NSMutableDictionary *)accountValues objectForKey:v6];
  unsigned __int8 v8 = [v7 BOOLValue];

  return v8;
}

- (void)pickerDidChooseMailbox:(id)a3 forType:(int64_t)a4
{
  id v12 = a3;
  uint64_t v6 = +[MFAccount storeOnServerSettingsForType:a4];
  unsigned int v7 = [v6 key];
  unsigned __int8 v8 = [v6 mailboxNameKey];
  accountValues = self->_accountValues;
  if (v12)
  {
    CFStringRef v10 = +[NSNumber numberWithBool:1];
    [(NSMutableDictionary *)accountValues setObject:v10 forKey:v7];

    [(NSMutableDictionary *)self->_accountValues setObject:v12 forKey:v8];
  }
  else
  {
    unsigned int v11 = +[NSNumber numberWithBool:0];
    [(NSMutableDictionary *)accountValues setObject:v11 forKey:v7];

    [(NSMutableDictionary *)self->_accountValues removeObjectForKey:v8];
  }
  [(AccountPSAdvancedController *)self reloadSpecifiers];
}

- (BOOL)isPropertyEnabledForIdentityPickerController:(id)a3
{
  accountValues = self->_accountValues;
  id v4 = [a3 property];
  uint64_t v5 = [(NSMutableDictionary *)accountValues objectForKey:v4];
  unsigned __int8 v6 = [v5 BOOLValue];

  return v6;
}

- (__SecIdentity)selectedIdentityForIdentityPickerController:(id)a3
{
  accountValues = self->_accountValues;
  id v4 = [a3 property];
  uint64_t v5 = sub_10638(v4, MFMailAccountSigningIdentity, MFMailAccountEncryptionIdentity);
  unsigned __int8 v6 = (__SecIdentity *)[(NSMutableDictionary *)accountValues objectForKey:v5];

  return v6;
}

- (void)identityPickerController:(id)a3 setPropertyEnabled:(BOOL)a4 withIdentity:(__SecIdentity *)a5
{
  BOOL v6 = a4;
  id v12 = [a3 property];
  accountValues = self->_accountValues;
  unsigned int v9 = +[NSNumber numberWithBool:v6];
  [(NSMutableDictionary *)accountValues setObject:v9 forKey:v12];

  CFStringRef v10 = sub_10638(v12, MFMailAccountSigningIdentity, MFMailAccountEncryptionIdentity);
  unsigned int v11 = self->_accountValues;
  if (a5) {
    [(NSMutableDictionary *)v11 setObject:a5 forKey:v10];
  }
  else {
    [(NSMutableDictionary *)v11 removeObjectForKey:v10];
  }
  [(AccountPSAdvancedController *)self reload];
}

- (__SecTrust)copyTrustForIdentityPickerController:(id)a3 identity:(__SecIdentity *)a4
{
  BOOL v6 = [a3 property];
  unsigned int v7 = [(MailAccount *)self->_account firstEmailAddress];
  SecTrustRef v11 = 0;
  SecCertificateRef certificateRef = 0;
  SecIdentityCopyCertificate(a4, &certificateRef);
  if (certificateRef)
  {
    if (([v6 isEqualToString:MFMailAccountSigningEnabled] & 1) != 0
      || [v6 isEqualToString:MFMailAccountEncryptionEnabled])
    {
      id v8 = +[MFMessageKeychainManager copySMIMESigningPolicyForAddress:](MFMessageKeychainManager, "copySMIMESigningPolicyForAddress:", v7, v11);
      if (v8)
      {
        SecTrustCreateWithCertificates(certificateRef, v8, &v11);
        CFRelease(v8);
      }
    }
    CFRelease(certificateRef);
    unsigned int v9 = v11;
  }
  else
  {
    unsigned int v9 = 0;
  }

  return v9;
}

- (id)localizedSwitchNameForIdentityPickerController:(id)a3
{
  id v3 = a3;
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v5 = [v3 property];
  BOOL v6 = sub_10638(v5, @"ENABLE_SIGNING", @"ENABLE_ENCRYPTION");
  unsigned int v7 = [v4 localizedStringForKey:v6 value:&stru_B9F70 table:@"AccountPreferences"];

  return v7;
}

- (id)emailAddressesForIdentityPickerController:(id)a3
{
  id v3 = [(MailAccount *)self->_account emailAddressesAndAliasesList];
  id v4 = objc_msgSend(v3, "ef_map:", &stru_B8DF0);

  return v4;
}

- (id)copyIdentitiesForIdentityPickerController:(id)a3
{
  id v4 = [a3 property];
  if ([v4 isEqualToString:MFMailAccountSigningEnabled])
  {
    uint64_t v5 = [(MailAccount *)self->_account firstEmailAddress];
    uint64_t v14 = 0;
    BOOL v6 = (id *)&v14;
    id v7 = +[MFMessageKeychainManager copyAllSigningIdentitiesForAddress:v5 error:&v14];
  }
  else
  {
    if (![v4 isEqualToString:MFMailAccountEncryptionEnabled])
    {
      id v8 = 0;
      id v9 = 0;
      goto LABEL_10;
    }
    uint64_t v5 = [(MailAccount *)self->_account firstEmailAddress];
    uint64_t v13 = 0;
    BOOL v6 = (id *)&v13;
    id v7 = +[MFMessageKeychainManager copyAllEncryptionIdentitiesForAddress:v5 error:&v13];
  }
  id v8 = v7;
  id v9 = *v6;

  if (v9)
  {
    CFStringRef v10 = MFLogGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      SecTrustRef v11 = objc_msgSend(v9, "ef_publicDescription");
      sub_7B440(v11, buf, v10);
    }
  }
LABEL_10:

  return v8;
}

- (unint64_t)configurationOptionsForIdentityPickerController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 property];
  unsigned int v6 = [v5 isEqualToString:MFMailAccountEncryptionEnabled];

  if (v6) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = 0;
  }
  if ([(MailAccount *)self->_account isManaged])
  {
    unsigned int v8 = [(AccountPSAdvancedController *)self _allowUserInteractiveSwitchForIdentityPickerController:v4];
    if ([(AccountPSAdvancedController *)self _allowIdentitySelectionForIdentityPickerController:v4])
    {
      unint64_t v9 = v7 | v8 | 2;
    }
    else
    {
      unint64_t v9 = v7 | v8;
    }
  }
  else
  {
    unint64_t v9 = v7 | 3;
  }

  return v9;
}

- (BOOL)_allowUserInteractiveSwitchForIdentityPickerController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 property];
  unsigned int v6 = [v5 isEqualToString:MFMailAccountSigningEnabled];

  if (v6)
  {
    uint64_t v7 = [(AccountPSAdvancedController *)self account];
    unsigned int v8 = [v7 accountPropertyForKey:MFMailAccountSigningUserOverrideable];
    unsigned __int8 v9 = [v8 BOOLValue];
  }
  else
  {
    CFStringRef v10 = [v4 property];
    unsigned int v11 = [v10 isEqualToString:MFMailAccountEncryptionEnabled];

    if (!v11)
    {
      BOOL v12 = 1;
      goto LABEL_7;
    }
    uint64_t v7 = [(AccountPSAdvancedController *)self account];
    unsigned int v8 = [v7 accountPropertyForKey:MFMailAccountEncryptByDefaultUserOverrideable];
    unsigned __int8 v9 = [v8 BOOLValue];
  }
  BOOL v12 = v9;

LABEL_7:
  return v12;
}

- (BOOL)_allowIdentitySelectionForIdentityPickerController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 property];
  unsigned int v6 = [v5 isEqualToString:MFMailAccountSigningEnabled];

  if (v6)
  {
    uint64_t v7 = [(AccountPSAdvancedController *)self account];
    unsigned int v8 = [v7 accountPropertyForKey:MFMailAccountSigningIdentityUserOverrideable];
    unsigned __int8 v9 = [v8 BOOLValue];
  }
  else
  {
    CFStringRef v10 = [v4 property];
    unsigned int v11 = [v10 isEqualToString:MFMailAccountEncryptionEnabled];

    if (!v11)
    {
      BOOL v12 = 1;
      goto LABEL_7;
    }
    uint64_t v7 = [(AccountPSAdvancedController *)self account];
    unsigned int v8 = [v7 accountPropertyForKey:MFMailAccountEncryptionIdentityUserOverrideable];
    unsigned __int8 v9 = [v8 BOOLValue];
  }
  BOOL v12 = v9;

LABEL_7:
  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AccountPSAdvancedController;
  [(AccountPSAdvancedController *)&v14 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = [(AccountPSAdvancedController *)self specifierForID:@"MFArchiveMessagesGroupSpecifierID"];
  if (v7)
  {
    id v8 = [v6 section];
    unsigned __int8 v9 = [(AccountPSAdvancedController *)self indexPathForIndex:[(AccountPSAdvancedController *)self indexOfSpecifier:v7]];
    id v10 = [v9 section];

    if (v8 == v10)
    {
      unsigned int v11 = [(AccountPSAdvancedController *)self specifierAtIndex:[(AccountPSAdvancedController *)self indexForIndexPath:v6]];
      BOOL v12 = v11;
      if (v11)
      {
        uint64_t v13 = [v11 propertyForKey:PSValueKey];
      }
      else
      {
        uint64_t v13 = &__kCFBooleanFalse;
      }
      [(AccountPSAdvancedController *)self setAccountProperty:v13 withSpecifier:v12];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalAccountValues, 0);
  objc_storeStrong((id *)&self->_accountValues, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end