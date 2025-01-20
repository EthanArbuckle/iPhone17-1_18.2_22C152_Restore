@interface ASSettingsAdvancedAccountController
- (ASAccount)account;
- (ASSettingsAccountsUIController)accountController;
- (ASSettingsAdvancedAccountController)init;
- (BOOL)_accountIsManaged;
- (BOOL)_allowIdentitySelectionForIdentityPickerController:(id)a3;
- (BOOL)_allowUserInteractiveSwitchForIdentityPickerController:(id)a3;
- (BOOL)accountArchivesMailByDefault;
- (BOOL)allowEditingForIdentityPickerController:(id)a3;
- (BOOL)isPropertyEnabledForIdentityPickerController:(id)a3;
- (BOOL)remotedManaged;
- (__SecIdentity)selectedIdentityForIdentityPickerController:(id)a3;
- (__SecTrust)copyTrustForIdentityPickerController:(id)a3 identity:(__SecIdentity *)a4;
- (id)_persistentRefForIdentity:(__SecIdentity *)a3;
- (id)_smimeEncryptSpecifier;
- (id)_smimeSigningSpecifier;
- (id)accountBooleanPropertyWithSpecifier:(id)a3;
- (id)copyIdentitiesForIdentityPickerController:(id)a3;
- (id)emailAddressesForIdentityPickerController:(id)a3;
- (id)lastGroupSpecifierInSpecifiers:(id)a3;
- (id)localizedSwitchNameForIdentityPickerController:(id)a3;
- (id)specifiers;
- (unint64_t)configurationOptionsForIdentityPickerController:(id)a3;
- (void)_handleTrustFromIdentity:(__SecIdentity *)a3 handler:(id)a4;
- (void)_setNeedsSaveAndValidation:(BOOL)a3;
- (void)dealloc;
- (void)identityPickerController:(id)a3 setPropertyEnabled:(BOOL)a4 withIdentity:(__SecIdentity *)a5;
- (void)setAccount:(id)a3;
- (void)setAccountArchivesMailByDefault:(BOOL)a3;
- (void)setAccountBooleanProperty:(id)a3 withSpecifier:(id)a4;
- (void)setAccountController:(id)a3;
- (void)setRemotedManaged:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation ASSettingsAdvancedAccountController

- (ASSettingsAdvancedAccountController)init
{
  v5.receiver = self;
  v5.super_class = (Class)ASSettingsAdvancedAccountController;
  v2 = [(ASSettingsAdvancedAccountController *)&v5 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_accountsChanged:" name:ACAccountStoreDidChangeNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:ACAccountStoreDidChangeNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)ASSettingsAdvancedAccountController;
  [(ASSettingsAdvancedAccountController *)&v4 dealloc];
}

- (id)specifiers
{
  objc_super v4 = [(ASSettingsAdvancedAccountController *)self specifier];
  objc_super v5 = [v4 propertyForKey:@"ASAdvancedControllerAccountKey"];
  [(ASSettingsAdvancedAccountController *)self setAccount:v5];

  v6 = [(ASSettingsAdvancedAccountController *)self account];
  v7 = [v6 backingAccountInfo];
  v8 = [v7 managingOwnerIdentifier];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    v11 = [(ASSettingsAdvancedAccountController *)self account];
    id v10 = [v11 objectForKeyedSubscript:ACAccountPropertyConfigurationProfileIdentifier];
  }
  if (v10)
  {
    v12 = DALoggingwithCategory();
    os_log_type_t v13 = _CPLog_to_os_log_type[7];
    if (os_log_type_enabled(v12, v13))
    {
      v14 = [(ASSettingsAdvancedAccountController *)self account];
      *(_DWORD *)buf = 138412546;
      v92 = v14;
      __int16 v93 = 2112;
      id v94 = v10;
      _os_log_impl(&dword_0, v12, v13, "Disable editing for %@, account is managed by %@", buf, 0x16u);
    }
    v15 = self;
    uint64_t v16 = 1;
  }
  else
  {
    v15 = self;
    uint64_t v16 = 0;
  }
  [(ASSettingsAdvancedAccountController *)v15 setRemotedManaged:v16];
  v17 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v17)
  {
    location = (id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
    v18 = (id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__parentController];
    id WeakRetained = objc_loadWeakRetained(v18);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v69 = +[NSAssertionHandler currentHandler];
      id v70 = objc_loadWeakRetained(v18);
      [v69 handleFailureInMethod:a2, self, @"ASSettingsAdvancedAccountController.m", 90, @"My parent is of unknown origin, is class %@", objc_opt_class() object file lineNumber description];
    }
    id v21 = objc_loadWeakRetained(v18);
    objc_storeWeak((id *)&self->_accountController, v21);

    v22 = [(ASSettingsAdvancedAccountController *)self loadSpecifiersFromPlistName:@"ASAdvancedAccountSetup" target:self];
    v23 = +[NSMutableArray array];
    v24 = +[NSMutableArray array];
    id v73 = v10;
    if ([(ASSettingsAdvancedAccountController *)self _accountIsManaged])
    {
      v25 = [(ASSettingsAdvancedAccountController *)self account];
      v26 = [v25 backingAccountInfo];
      v27 = [v26 mcBackingProfile];

      v28 = +[NSBundle bundleForClass:objc_opt_class()];
      v29 = [v28 localizedStringForKey:@"PROFILE_EXPLANATION_FORMAT" value:&stru_30C50 table:@"ASAdvancedAccountSetup"];
      v30 = [v27 friendlyName];
      v31 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v29, v30);

      v32 = [(ASSettingsAdvancedAccountController *)self lastGroupSpecifierInSpecifiers:v22];
      if (!v32)
      {
        v33 = DALoggingwithCategory();
        os_log_type_t v34 = _CPLog_to_os_log_type[3];
        if (os_log_type_enabled(v33, v34))
        {
          *(_DWORD *)buf = 138412290;
          v92 = v22;
          _os_log_impl(&dword_0, v33, v34, "No group found, not setting the profile text.  Specifiers: %@", buf, 0xCu);
        }
      }
      [v32 setProperty:v31 forKey:PSFooterTextGroupKey];
      [v24 addObject:@"USE_SSL"];

      id v10 = v73;
    }
    v35 = [(ASSettingsAdvancedAccountController *)self account];
    unsigned int v36 = [v35 isHotmailAccount];

    if (v36) {
      [v23 addObjectsFromArray:&off_327A0];
    }
    v37 = [(ASSettingsAdvancedAccountController *)self account];
    unsigned int v38 = [v37 supportsDraftFolderSync];

    if (v38 == 2)
    {
      v90[0] = @"DRAFTS_GROUP";
      v90[1] = @"SERVER_DRAFTS_ENABLED";
      v39 = +[NSArray arrayWithObjects:v90 count:2];
      [v23 addObjectsFromArray:v39];
    }
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v40 = v23;
    id v41 = [v40 countByEnumeratingWithState:&v83 objects:v89 count:16];
    if (v41)
    {
      id v42 = v41;
      uint64_t v43 = *(void *)v84;
      do
      {
        for (i = 0; i != v42; i = (char *)i + 1)
        {
          if (*(void *)v84 != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = [v22 specifierForID:*(void *)(*((void *)&v83 + 1) + 8 * i)];
          [v22 removeObject:v45];
        }
        id v42 = [v40 countByEnumeratingWithState:&v83 objects:v89 count:16];
      }
      while (v42);
    }
    v72 = v40;

    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v46 = v24;
    id v47 = [v46 countByEnumeratingWithState:&v79 objects:v88 count:16];
    if (v47)
    {
      id v48 = v47;
      uint64_t v49 = *(void *)v80;
      uint64_t v50 = PSEnabledKey;
      do
      {
        for (j = 0; j != v48; j = (char *)j + 1)
        {
          if (*(void *)v80 != v49) {
            objc_enumerationMutation(v46);
          }
          v52 = [v22 specifierForID:*(void *)(*((void *)&v79 + 1) + 8 * (void)j)];
          [v52 setProperty:&__kCFBooleanFalse forKey:v50];
        }
        id v48 = [v46 countByEnumeratingWithState:&v79 objects:v88 count:16];
      }
      while (v48);
    }

    v53 = [v22 specifierForID:@"ARCHIVE_MAIL_BY_DEFAULT_GROUP"];
    if ([(ASSettingsAdvancedAccountController *)self accountArchivesMailByDefault]) {
      CFStringRef v54 = @"ARCHIVE_MAILBOX";
    }
    else {
      CFStringRef v54 = @"DELETED_MAILBOX";
    }
    v55 = [v22 specifierForID:v54];
    [v53 setProperty:v55 forKey:PSRadioGroupCheckedSpecifierKey];

    v56 = [(ASSettingsAdvancedAccountController *)self _smimeSigningSpecifier];
    [v22 addObject:v56];

    v57 = [(ASSettingsAdvancedAccountController *)self _smimeEncryptSpecifier];
    [v22 addObject:v57];

    v58 = location;
    objc_storeStrong(location, v22);
    if ([(ASSettingsAdvancedAccountController *)self remotedManaged])
    {
      v71 = v53;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id v59 = v22;
      id v60 = [v59 countByEnumeratingWithState:&v75 objects:v87 count:16];
      if (v60)
      {
        id v61 = v60;
        uint64_t v62 = *(void *)v76;
        uint64_t v63 = PSEnabledKey;
        do
        {
          for (k = 0; k != v61; k = (char *)k + 1)
          {
            if (*(void *)v76 != v62) {
              objc_enumerationMutation(v59);
            }
            v65 = *(void **)(*((void *)&v75 + 1) + 8 * (void)k);
            v66 = [v65 identifier];
            if ([@"USE_SSL" isEqualToString:v66]) {
              [v65 setProperty:&__kCFBooleanFalse forKey:v63];
            }
          }
          id v61 = [v59 countByEnumeratingWithState:&v75 objects:v87 count:16];
        }
        while (v61);
      }

      id v10 = v73;
      v58 = location;
      v53 = v71;
    }

    v17 = *v58;
  }
  id v67 = v17;

  return v67;
}

- (id)_smimeSigningSpecifier
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 localizedStringForKey:@"ENABLE_SMIME_SIGNING" value:&stru_30C50 table:@"ASAdvancedAccountSetup"];
  objc_super v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:"setAccountBooleanProperty:withSpecifier:" get:"accountBooleanPropertyWithSpecifier:" detail:objc_opt_class() cell:2 edit:0];

  [v5 setProperty:MFMailAccountSigningEnabled forKey:PSKeyNameKey];
  [v5 setIdentifier:@"ASSpecifierSMIMESignID"];
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"NO" value:&stru_30C50 table:@"ASAdvancedAccountSetup"];
  v12[0] = v7;
  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"YES" value:&stru_30C50 table:@"ASAdvancedAccountSetup"];
  v12[1] = v9;
  id v10 = +[NSArray arrayWithObjects:v12 count:2];
  [v5 setValues:&off_327B8 titles:v10];

  return v5;
}

- (id)_smimeEncryptSpecifier
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 localizedStringForKey:@"ENABLE_SMIME_ENCRYPTION" value:&stru_30C50 table:@"ASAdvancedAccountSetup"];
  objc_super v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:"setAccountBooleanProperty:withSpecifier:" get:"accountBooleanPropertyWithSpecifier:" detail:objc_opt_class() cell:2 edit:0];

  [v5 setProperty:MFMailAccountEncryptionEnabled forKey:PSKeyNameKey];
  [v5 setIdentifier:@"ASSpecifierSMIMEEncryptID"];
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"NO" value:&stru_30C50 table:@"ASAdvancedAccountSetup"];
  v12[0] = v7;
  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"YES" value:&stru_30C50 table:@"ASAdvancedAccountSetup"];
  v12[1] = v9;
  id v10 = +[NSArray arrayWithObjects:v12 count:2];
  [v5 setValues:&off_327D0 titles:v10];

  return v5;
}

- (id)lastGroupSpecifierInSpecifiers:(id)a3
{
  [a3 reverseObjectEnumerator];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v4 = (char *)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(char **)(*((void *)&v9 + 1) + 8 * i);
        if (!*(void *)&v7[OBJC_IVAR___PSSpecifier_cellType])
        {
          objc_super v4 = v7;
          goto LABEL_11;
        }
      }
      objc_super v4 = (char *)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ASSettingsAdvancedAccountController;
  [(ASSettingsAdvancedAccountController *)&v15 tableView:a3 didSelectRowAtIndexPath:v6];
  v7 = [(ASSettingsAdvancedAccountController *)self specifierForID:@"ARCHIVE_MAIL_BY_DEFAULT_GROUP"];
  id v8 = [v6 section];
  long long v9 = [(ASSettingsAdvancedAccountController *)self indexPathForIndex:[(ASSettingsAdvancedAccountController *)self indexOfSpecifier:v7]];
  id v10 = [v9 section];

  if (v8 == v10)
  {
    long long v11 = [(ASSettingsAdvancedAccountController *)self specifierAtIndex:[(ASSettingsAdvancedAccountController *)self indexForIndexPath:v6]];
    long long v12 = v11;
    if (v11)
    {
      os_log_type_t v13 = [v11 propertyForKey:PSValueKey];
      id v14 = [v13 BOOLValue];
    }
    else
    {
      id v14 = 0;
    }
    [(ASSettingsAdvancedAccountController *)self setAccountArchivesMailByDefault:v14];
  }
}

- (BOOL)accountArchivesMailByDefault
{
  v2 = [(ASSettingsAdvancedAccountController *)self account];
  unsigned __int8 v3 = [v2 accountBoolPropertyForKey:MFMailAccountArchive];

  return v3;
}

- (void)setAccountArchivesMailByDefault:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(ASSettingsAdvancedAccountController *)self account];
  [v5 setAccountBoolProperty:v3 forKey:MFMailAccountArchive];

  [(ASSettingsAdvancedAccountController *)self _setNeedsSaveAndValidation:0];
}

- (void)setAccountBooleanProperty:(id)a3 withSpecifier:(id)a4
{
  id v6 = a3;
  id v10 = [a4 identifier];
  id v7 = [v6 BOOLValue];

  id v8 = [v10 isEqualToString:@"USE_SSL"];
  if (v8)
  {
    long long v9 = [(ASSettingsAdvancedAccountController *)self account];
    [v9 setUseSSL:v7];
  }
  else
  {
    if (![v10 isEqualToString:@"SERVER_DRAFTS_ENABLED"]) {
      goto LABEL_6;
    }
    long long v9 = [(ASSettingsAdvancedAccountController *)self account];
    [v9 setAccountBoolProperty:v7 forKey:MFDAMailAccountStoreDraftsOnServer];
  }

LABEL_6:
  [(ASSettingsAdvancedAccountController *)self _setNeedsSaveAndValidation:v8];
}

- (void)_setNeedsSaveAndValidation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ASSettingsAdvancedAccountController *)self parentController];
  if (objc_opt_respondsToSelector()) {
    [v4 setNeedsSaveAndValidation:v3];
  }
}

- (id)accountBooleanPropertyWithSpecifier:(id)a3
{
  id v4 = [a3 identifier];
  if ([v4 isEqualToString:@"USE_SSL"])
  {
    uint64_t v5 = [(ASSettingsAdvancedAccountController *)self account];
    id v6 = [v5 useSSL];
LABEL_3:
    id v7 = v6;
LABEL_9:

    goto LABEL_10;
  }
  if ([v4 isEqualToString:@"ASSpecifierSMIMESignID"])
  {
    id v8 = [(ASSettingsAdvancedAccountController *)self account];
    uint64_t v5 = v8;
    long long v9 = &MFMailAccountSigningEnabled;
LABEL_8:
    id v10 = [v8 accountPropertyForKey:*v9];
    id v7 = [v10 BOOLValue];

    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"ASSpecifierSMIMEEncryptID"])
  {
    id v8 = [(ASSettingsAdvancedAccountController *)self account];
    uint64_t v5 = v8;
    long long v9 = &MFMailAccountEncryptionEnabled;
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"SERVER_DRAFTS_ENABLED"])
  {
    os_log_type_t v13 = [(ASSettingsAdvancedAccountController *)self account];
    uint64_t v5 = [v13 accountPropertyForKey:MFDAMailAccountStoreDraftsOnServer];

    if (!v5)
    {
      id v7 = &dword_0 + 1;
      goto LABEL_9;
    }
    id v6 = [v5 BOOLValue];
    goto LABEL_3;
  }
  id v7 = 0;
LABEL_10:
  long long v11 = +[NSNumber numberWithBool:v7];

  return v11;
}

- (id)_persistentRefForIdentity:(__SecIdentity *)a3
{
  keys[0] = (void *)kSecValueRef;
  keys[1] = (void *)kSecReturnPersistentRef;
  values[0] = a3;
  values[1] = kCFBooleanTrue;
  CFDictionaryRef v3 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, (const void **)values, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFTypeRef result = 0;
  OSStatus v4 = SecItemCopyMatching(v3, &result);
  uint64_t v5 = (void *)result;
  CFRelease(v3);
  if (!v4)
  {
    id v6 = DALoggingwithCategory();
    int v7 = _CPLog_to_os_log_type[3];
    if (os_log_type_enabled(v6, (os_log_type_t)_CPLog_to_os_log_type[3]))
    {
      *(_DWORD *)buf = 67109120;
      int v11 = 0;
      _os_log_impl(&dword_0, v6, (os_log_type_t)v7, "Could not create persistent ref for identity. %d", buf, 8u);
    }
  }

  return v5;
}

- (void)_handleTrustFromIdentity:(__SecIdentity *)a3 handler:(id)a4
{
  if (a3 && a4)
  {
    id v6 = (void (**)(id, CFTypeRef, id, void *))a4;
    int v7 = [(ASSettingsAdvancedAccountController *)self account];
    id v8 = [v7 emailAddress];
    long long v9 = objc_msgSend(v8, "mf_uncommentedAddress");

    id v10 = +[MFMessageKeychainManager copySMIMESigningPolicyForAddress:v9];
    id v11 = [objc_alloc((Class)CertUITrustManager) initWithAccessGroup:@"com.apple.mobilemail.smime"];
    CFTypeRef cf = 0;
    SecCertificateRef certificateRef = 0;
    SecIdentityCopyCertificate(a3, &certificateRef);
    SecTrustCreateWithCertificates(certificateRef, v10, (SecTrustRef *)&cf);
    v6[2](v6, cf, v11, v9);

    if (certificateRef) {
      CFRelease(certificateRef);
    }
    if (cf) {
      CFRelease(cf);
    }
    if (v10) {
      CFRelease(v10);
    }
  }
}

- (BOOL)_accountIsManaged
{
  v2 = [(ASSettingsAdvancedAccountController *)self account];
  CFDictionaryRef v3 = [v2 backingAccountInfo];
  OSStatus v4 = [v3 mcBackingPayload];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)isPropertyEnabledForIdentityPickerController:(id)a3
{
  OSStatus v4 = [a3 specifier];
  BOOL v5 = [v4 propertyForKey:PSKeyNameKey];

  if (v5)
  {
    id v6 = [(ASSettingsAdvancedAccountController *)self account];
    int v7 = [v6 accountPropertyForKey:v5];

    if (v7) {
      unsigned __int8 v8 = [v7 BOOLValue];
    }
    else {
      unsigned __int8 v8 = 0;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (__SecIdentity)selectedIdentityForIdentityPickerController:(id)a3
{
  OSStatus v4 = [a3 specifier];
  BOOL v5 = [v4 identifier];

  if ([v5 isEqualToString:@"ASSpecifierSMIMESignID"])
  {
    id v6 = [(ASSettingsAdvancedAccountController *)self account];
    uint64_t v7 = [v6 signingIdentityPersistentReference];
  }
  else
  {
    if (![v5 isEqualToString:@"ASSpecifierSMIMEEncryptID"])
    {
LABEL_12:
      objc_super v15 = 0;
      goto LABEL_15;
    }
    id v6 = [(ASSettingsAdvancedAccountController *)self account];
    uint64_t v7 = [v6 encryptionIdentityPersistentReference];
  }
  unsigned __int8 v8 = (void *)v7;

  if (!v8) {
    goto LABEL_12;
  }
  id v17 = 0;
  id v9 = +[MFMessageKeychainManager copyIdentityForPersistentReference:v8 error:&v17];
  id v10 = v17;
  if (v10)
  {
    id v11 = DALoggingwithCategory();
    os_log_type_t v12 = _CPLog_to_os_log_type[3];
    if (os_log_type_enabled(v11, v12))
    {
      os_log_type_t v13 = [(ASSettingsAdvancedAccountController *)self account];
      id v14 = [v13 emailAddress];
      *(_DWORD *)buf = 138412546;
      v19 = v14;
      __int16 v20 = 2112;
      id v21 = v10;
      _os_log_impl(&dword_0, v11, v12, "Error retrieving identity for email address %@ %@", buf, 0x16u);
    }
  }
  if (v9) {
    objc_super v15 = (__SecIdentity *)CFAutorelease(v9);
  }
  else {
    objc_super v15 = 0;
  }

LABEL_15:
  return v15;
}

- (void)identityPickerController:(id)a3 setPropertyEnabled:(BOOL)a4 withIdentity:(__SecIdentity *)a5
{
  BOOL v6 = a4;
  id v15 = a3;
  unsigned __int8 v8 = [v15 specifier];
  id v9 = [(ASSettingsAdvancedAccountController *)self account];
  id v10 = [v8 propertyForKey:PSKeyNameKey];
  [v9 setAccountBoolProperty:v6 forKey:v10];

  if (a5)
  {
    id v11 = [v8 identifier];
    if ([v11 isEqualToString:@"ASSpecifierSMIMESignID"]) {
      [(ASSettingsAdvancedAccountController *)self _handleTrustFromIdentity:a5 handler:&stru_308C8];
    }
    os_log_type_t v12 = [(ASSettingsAdvancedAccountController *)self _persistentRefForIdentity:a5];
    if (!v12) {
      goto LABEL_10;
    }
    if ([v11 isEqualToString:@"ASSpecifierSMIMESignID"])
    {
      os_log_type_t v13 = [(ASSettingsAdvancedAccountController *)self account];
      [v13 setSigningIdentityPersistentReference:v12];
    }
    else
    {
      if (![v11 isEqualToString:@"ASSpecifierSMIMEEncryptID"])
      {
LABEL_10:

        goto LABEL_11;
      }
      os_log_type_t v13 = [(ASSettingsAdvancedAccountController *)self account];
      [v13 setEncryptionIdentityPersistentReference:v12];
    }

    goto LABEL_10;
  }
LABEL_11:
  id v14 = [v15 specifier];
  [(ASSettingsAdvancedAccountController *)self reloadSpecifier:v14];

  [(ASSettingsAdvancedAccountController *)self _setNeedsSaveAndValidation:0];
}

- (id)localizedSwitchNameForIdentityPickerController:(id)a3
{
  CFDictionaryRef v3 = [a3 specifier];
  OSStatus v4 = [v3 name];

  return v4;
}

- (id)copyIdentitiesForIdentityPickerController:(id)a3
{
  OSStatus v4 = [a3 property];
  if ([v4 isEqualToString:MFMailAccountSigningEnabled])
  {
    BOOL v5 = [(ASSettingsAdvancedAccountController *)self account];
    BOOL v6 = [v5 emailAddress];
    uint64_t v15 = 0;
    uint64_t v7 = (id *)&v15;
    id v8 = +[MFMessageKeychainManager copyAllSigningIdentitiesForAddress:v6 error:&v15];
  }
  else
  {
    if (![v4 isEqualToString:MFMailAccountEncryptionEnabled])
    {
      id v10 = 0;
      id v9 = 0;
      goto LABEL_10;
    }
    BOOL v5 = [(ASSettingsAdvancedAccountController *)self account];
    BOOL v6 = [v5 emailAddress];
    uint64_t v14 = 0;
    uint64_t v7 = (id *)&v14;
    id v8 = +[MFMessageKeychainManager copyAllEncryptionIdentitiesForAddress:v6 error:&v14];
  }
  id v9 = v8;
  id v10 = *v7;

  if (v10)
  {
    id v11 = DALoggingwithCategory();
    os_log_type_t v12 = _CPLog_to_os_log_type[3];
    if (os_log_type_enabled(v11, v12))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v10;
      _os_log_impl(&dword_0, v11, v12, "%@", buf, 0xCu);
    }
  }
LABEL_10:

  return v9;
}

- (__SecTrust)copyTrustForIdentityPickerController:(id)a3 identity:(__SecIdentity *)a4
{
  BOOL v6 = [a3 property];
  uint64_t v7 = [(ASSettingsAdvancedAccountController *)self account];
  id v8 = [v7 emailAddress];

  SecTrustRef v13 = 0;
  SecCertificateRef certificateRef = 0;
  SecIdentityCopyCertificate(a4, &certificateRef);
  if (certificateRef)
  {
    if (([v6 isEqualToString:MFMailAccountSigningEnabled] & 1) != 0
      || [v6 isEqualToString:MFMailAccountEncryptionEnabled])
    {
      id v9 = +[MFMessageKeychainManager copySMIMESigningPolicyForAddress:](MFMessageKeychainManager, "copySMIMESigningPolicyForAddress:", v8, v13);
      if (v9)
      {
        id v10 = v9;
        SecTrustCreateWithCertificates(certificateRef, v9, &v13);
        CFRelease(v10);
      }
    }
    CFRelease(certificateRef);
    id v11 = v13;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)emailAddressesForIdentityPickerController:(id)a3
{
  CFDictionaryRef v3 = [(ASSettingsAdvancedAccountController *)self account];
  OSStatus v4 = [v3 emailAddresses];

  return v4;
}

- (BOOL)allowEditingForIdentityPickerController:(id)a3
{
  return ![(ASSettingsAdvancedAccountController *)self _accountIsManaged];
}

- (unint64_t)configurationOptionsForIdentityPickerController:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 property];
  unsigned int v6 = [v5 isEqualToString:MFMailAccountEncryptionEnabled];

  if (v6) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = 0;
  }
  if ([(ASSettingsAdvancedAccountController *)self _accountIsManaged])
  {
    unint64_t v8 = v7 | [(ASSettingsAdvancedAccountController *)self _allowUserInteractiveSwitchForIdentityPickerController:v4];
    if ([(ASSettingsAdvancedAccountController *)self _allowIdentitySelectionForIdentityPickerController:v4])
    {
      unint64_t v9 = v8 | 2;
    }
    else
    {
      unint64_t v9 = v8;
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
  BOOL v5 = [v4 property];
  unsigned __int8 v6 = [v5 isEqualToString:MFMailAccountSigningEnabled];

  if (v6)
  {
    uint64_t v7 = &MFMailAccountSigningUserOverrideable;
  }
  else
  {
    unint64_t v8 = [v4 property];
    unsigned int v9 = [v8 isEqualToString:MFMailAccountEncryptionEnabled];

    if (!v9)
    {
      unsigned __int8 v12 = 1;
      goto LABEL_7;
    }
    uint64_t v7 = &MFMailAccountEncryptByDefaultUserOverrideable;
  }
  id v10 = [(ASSettingsAdvancedAccountController *)self account];
  id v11 = [v10 accountPropertyForKey:*v7];
  unsigned __int8 v12 = [v11 BOOLValue];

LABEL_7:
  return v12;
}

- (BOOL)_allowIdentitySelectionForIdentityPickerController:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 property];
  unsigned __int8 v6 = [v5 isEqualToString:MFMailAccountSigningEnabled];

  if (v6)
  {
    uint64_t v7 = &MFMailAccountSigningIdentityUserOverrideable;
  }
  else
  {
    unint64_t v8 = [v4 property];
    unsigned int v9 = [v8 isEqualToString:MFMailAccountEncryptionEnabled];

    if (!v9)
    {
      unsigned __int8 v12 = 1;
      goto LABEL_7;
    }
    uint64_t v7 = &MFMailAccountEncryptionIdentityUserOverrideable;
  }
  id v10 = [(ASSettingsAdvancedAccountController *)self account];
  id v11 = [v10 accountPropertyForKey:*v7];
  unsigned __int8 v12 = [v11 BOOLValue];

LABEL_7:
  return v12;
}

- (ASSettingsAccountsUIController)accountController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountController);

  return (ASSettingsAccountsUIController *)WeakRetained;
}

- (void)setAccountController:(id)a3
{
}

- (ASAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (BOOL)remotedManaged
{
  return self->_remotedManaged;
}

- (void)setRemotedManaged:(BOOL)a3
{
  self->_remotedManaged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);

  objc_destroyWeak((id *)&self->_accountController);
}

@end