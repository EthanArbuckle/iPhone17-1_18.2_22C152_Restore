@interface NCBSTinkerMeCardViewController
- (BOOL)_addSatellitePhoneNumberToContactIfNotPresent:(id)a3;
- (BOOL)hasMeCard;
- (NCBSBridgeSetupControllerDelegate)miniFlowDelegate;
- (NCBSTinkerMeCardViewController)init;
- (id)_activeSatellitePhoneNumber;
- (id)_newMeContactForFamilyMember:(id)a3;
- (id)_updatedContactForFamilyMember:(id)a3 originalContact:(id)a4;
- (id)alternateButtonTitle;
- (id)detailString;
- (id)familyMemberScopedContactStore;
- (id)imageResource;
- (id)imageResourceBundleIdentifier;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)_addFamilyMemberContactToGuardianStore:(id)a3;
- (void)_setFamilyMemberMeContact:(id)a3;
- (void)_visitMeCard;
- (void)alternateButtonPressed:(id)a3;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)setMiniFlowDelegate:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation NCBSTinkerMeCardViewController

- (NCBSTinkerMeCardViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)NCBSTinkerMeCardViewController;
  v2 = [(NCBSTinkerMeCardViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NCBSTinkerMeCardViewController *)v2 setStyle:10];
  }
  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NCBSTinkerMeCardViewController;
  [(NCBSTinkerMeCardViewController *)&v3 viewWillAppear:a3];
}

- (id)titleString
{
  v2 = self;
  objc_super v3 = [(NCBSTinkerMeCardViewController *)self miniFlowDelegate];
  v4 = [v3 familyMemberFirstName];

  LODWORD(v2) = [(NCBSTinkerMeCardViewController *)v2 hasMeCard];
  objc_super v5 = NanoContactsBridgeSetupBundle();
  v6 = v5;
  if (v2) {
    CFStringRef v7 = @"TK_CONTACTS_TINKERUSER_ME_TITLE_UPDATE";
  }
  else {
    CFStringRef v7 = @"TK_CONTACTS_TINKERUSER_ME_TITLE_CREATE";
  }
  v8 = [v5 localizedStringForKey:v7 value:&stru_1C900 table:@"NanoContactsBridgeSetup"];
  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v4);

  return v9;
}

- (id)detailString
{
  v2 = [(NCBSTinkerMeCardViewController *)self miniFlowDelegate];
  objc_super v3 = [v2 familyMemberFirstName];

  v4 = NanoContactsBridgeSetupBundle();
  objc_super v5 = [v4 localizedStringForKey:@"TK_CONTACTS_TINKERUSER_ME_DETAIL" value:&stru_1C900 table:@"NanoContactsBridgeSetup"];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v3);

  return v6;
}

- (id)imageResource
{
  return @"Contacts-Header_80";
}

- (id)imageResourceBundleIdentifier
{
  return NanoContactsBridgeSetupBundleIdentifier;
}

- (id)suggestedButtonTitle
{
  unsigned int v2 = [(NCBSTinkerMeCardViewController *)self hasMeCard];
  objc_super v3 = NanoContactsBridgeSetupBundle();
  v4 = v3;
  if (v2) {
    CFStringRef v5 = @"TK_CONTACTS_TINKERUSER_ME_BUTTON_UPDATE";
  }
  else {
    CFStringRef v5 = @"TK_CONTACTS_TINKERUSER_ME_BUTTON_CREATE";
  }
  v6 = [v3 localizedStringForKey:v5 value:&stru_1C900 table:@"NanoContactsBridgeSetup"];

  return v6;
}

- (void)suggestedButtonPressed:(id)a3
{
}

- (id)alternateButtonTitle
{
  unsigned int v2 = NanoContactsBridgeSetupBundle();
  objc_super v3 = [v2 localizedStringForKey:@"TK_CONTACTS_TINKERUSER_ME_BUTTON_LATER" value:&stru_1C900 table:@"NanoContactsBridgeSetup"];

  return v3;
}

- (void)alternateButtonPressed:(id)a3
{
  id v4 = [(NCBSTinkerMeCardViewController *)self miniFlowDelegate];
  [v4 miniFlowStepComplete:self];
}

- (id)familyMemberScopedContactStore
{
  objc_super v3 = NCBS_Tinker_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    familyMemberScopedContactStore = self->_familyMemberScopedContactStore;
    *(_DWORD *)buf = 136446466;
    v20 = "-[NCBSTinkerMeCardViewController familyMemberScopedContactStore]";
    __int16 v21 = 2112;
    v22 = familyMemberScopedContactStore;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "%{public}s - _familyMemberScopedContactStore: %@", buf, 0x16u);
  }

  CFStringRef v5 = self->_familyMemberScopedContactStore;
  if (!v5)
  {
    v6 = [(NCBSTinkerMeCardViewController *)self miniFlowDelegate];
    CFStringRef v7 = [v6 familyMember];

    if (v7)
    {
      v8 = +[CNContactStore storeForFamilyMember:v7];
      v9 = self->_familyMemberScopedContactStore;
      self->_familyMemberScopedContactStore = v8;

      v10 = self->_familyMemberScopedContactStore;
      if (v10)
      {
        v11 = +[CNContactViewController descriptorForRequiredKeys];
        v29 = v11;
        v12 = +[NSArray arrayWithObjects:&v29 count:1];
        id v18 = 0;
        v13 = [(CNContactStore *)v10 _ios_meContactWithKeysToFetch:v12 error:&v18];
        v10 = (CNContactStore *)v18;

        self->_BOOL hasMeCard = v13 != 0;
      }
      v14 = NCBS_Tinker_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = self->_familyMemberScopedContactStore;
        BOOL hasMeCard = self->_hasMeCard;
        *(_DWORD *)buf = 136447234;
        v20 = "-[NCBSTinkerMeCardViewController familyMemberScopedContactStore]";
        __int16 v21 = 2112;
        v22 = v7;
        __int16 v23 = 2112;
        v24 = v15;
        __int16 v25 = 1024;
        BOOL v26 = hasMeCard;
        __int16 v27 = 2114;
        v28 = v10;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%{public}s - familyMember: %@; OPENED familyMemberScopedContactStore: %@, hasMeCard: %d (error: %{public}@)",
          buf,
          0x30u);
      }
    }
    CFStringRef v5 = self->_familyMemberScopedContactStore;
  }

  return v5;
}

- (BOOL)hasMeCard
{
  if (self->_hasMeCard) {
    return 1;
  }
  if (self->_familyMemberScopedContactStore) {
    return 0;
  }
  id v4 = [(NCBSTinkerMeCardViewController *)self familyMemberScopedContactStore];
  return self->_hasMeCard;
}

- (id)_newMeContactForFamilyMember:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = objc_opt_new();
  v6 = [v4 firstName];
  [v5 setGivenName:v6];

  CFStringRef v7 = [v4 lastName];
  [v5 setFamilyName:v7];

  v8 = [v4 appleID];

  if (v8)
  {
    v9 = +[CNLabeledValue labeledValueWithLabel:CNLabelEmailiCloud value:v8];
    v13 = v9;
    v10 = +[NSArray arrayWithObjects:&v13 count:1];
    [v5 setEmailAddresses:v10];
  }
  [(NCBSTinkerMeCardViewController *)self _addSatellitePhoneNumberToContactIfNotPresent:v5];
  id v11 = [v5 copy];

  return v11;
}

- (id)_updatedContactForFamilyMember:(id)a3 originalContact:(id)a4
{
  id v5 = objc_msgSend(a4, "mutableCopy", a3);
  [(NCBSTinkerMeCardViewController *)self _addSatellitePhoneNumberToContactIfNotPresent:v5];
  id v6 = [v5 copy];

  return v6;
}

- (void)_visitMeCard
{
  objc_super v3 = [(NCBSTinkerMeCardViewController *)self miniFlowDelegate];
  id v4 = [v3 familyMember];

  id v5 = NCBS_Tinker_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NCBSTinkerMeCardViewController *)self familyMemberScopedContactStore];
    *(_DWORD *)buf = 136446722;
    BOOL v26 = "-[NCBSTinkerMeCardViewController _visitMeCard]";
    __int16 v27 = 2112;
    v28 = v6;
    __int16 v29 = 2112;
    id v30 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s - familyMemberScopedContactStore: %@, familyMember: %@", buf, 0x20u);
  }
  CFStringRef v7 = [(NCBSTinkerMeCardViewController *)self familyMemberScopedContactStore];
  v8 = +[CNContactViewController descriptorForRequiredKeys];
  v24 = v8;
  v9 = +[NSArray arrayWithObjects:&v24 count:1];
  id v23 = 0;
  v10 = objc_msgSend(v7, "_ios_meContactWithKeysToFetch:error:", v9, &v23);
  id v11 = v23;

  v12 = NCBS_Tinker_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    BOOL v26 = "-[NCBSTinkerMeCardViewController _visitMeCard]";
    __int16 v27 = 2112;
    v28 = v10;
    __int16 v29 = 2114;
    id v30 = v11;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%{public}s - _ios_meContactWithKeysToFetch result: %@, error: %{public}@", buf, 0x20u);
  }

  if (v10)
  {
    id v13 = [(NCBSTinkerMeCardViewController *)self _updatedContactForFamilyMember:v4 originalContact:v10];
    +[CNContactViewController viewControllerForUpdatingContact:v13 withPropertiesFromContact:0];
  }
  else
  {
    id v13 = [(NCBSTinkerMeCardViewController *)self _newMeContactForFamilyMember:v4];
    +[CNContactViewController viewControllerForNewContact:v13];
  v14 = };

  v15 = [(NCBSTinkerMeCardViewController *)self familyMemberScopedContactStore];
  [v14 setContactStore:v15];

  [v14 setDisplayMode:2];
  [v14 setDelegate:self];
  v16 = +[CNUICoreFamilyMemberContactsController propertyKeysContainingSenstiveData];
  [v14 setProhibitedPropertyKeys:v16];

  v17 = NCBS_Tinker_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [v14 prohibitedPropertyKeys];
    *(_DWORD *)buf = 136446466;
    BOOL v26 = "-[NCBSTinkerMeCardViewController _visitMeCard]";
    __int16 v27 = 2114;
    v28 = v18;
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "%{public}s - prohibitedPropertyKeys: %{public}@", buf, 0x16u);
  }
  id v19 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v14];
  v20 = [(NCBSTinkerMeCardViewController *)self view];
  __int16 v21 = [v20 tintColor];
  v22 = [v19 view];
  [v22 setTintColor:v21];

  [(NCBSTinkerMeCardViewController *)self presentViewController:v19 animated:1 completion:0];
}

- (void)_setFamilyMemberMeContact:(id)a3
{
  id v4 = a3;
  id v5 = [(NCBSTinkerMeCardViewController *)self familyMemberScopedContactStore];
  id v9 = 0;
  unsigned int v6 = [v5 setMeContact:v4 error:&v9];
  id v7 = v9;

  self->_hasMeCard |= v6;
  v8 = NCBS_Tinker_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    id v11 = "-[NCBSTinkerMeCardViewController _setFamilyMemberMeContact:]";
    __int16 v12 = 1024;
    unsigned int v13 = v6;
    __int16 v14 = 2114;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}s - setMeContact result: %d, error: %{public}@, contact: %@", buf, 0x26u);
  }
}

- (void)_addFamilyMemberContactToGuardianStore:(id)a3
{
  id v3 = a3;
  id v4 = [v3 copyWithDistinctIdentifier];
  id v5 = objc_alloc_init((Class)CNSaveRequest);
  id v6 = [v4 mutableCopy];
  [v5 addContact:v6 toContainerWithIdentifier:0];

  id v7 = objc_alloc_init((Class)CNContactStore);
  id v12 = 0;
  unsigned __int8 v8 = [v7 executeSaveRequest:v5 error:&v12];
  id v9 = v12;
  v10 = NCBS_Tinker_log();
  id v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v14 = "-[NCBSTinkerMeCardViewController _addFamilyMemberContactToGuardianStore:]";
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%{public}s - saved, contact: %@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    __int16 v14 = "-[NCBSTinkerMeCardViewController _addFamilyMemberContactToGuardianStore:]";
    __int16 v15 = 2114;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v3;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_error_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "%{public}s - save failed, error: %{public}@, contact in: %@, contact to save: %@", buf, 0x2Au);
  }
}

- (id)_activeSatellitePhoneNumber
{
  unsigned int v2 = +[NPHCellularBridgeUIManager sharedInstance];
  id v3 = [v2 selectedCellularPlan];
  id v4 = [v3 phoneNumber];

  id v5 = NCBS_Tinker_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    unsigned __int8 v8 = "-[NCBSTinkerMeCardViewController _activeSatellitePhoneNumber]";
    __int16 v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s - phoneNumber:%@", (uint8_t *)&v7, 0x16u);
  }

  return v4;
}

- (BOOL)_addSatellitePhoneNumberToContactIfNotPresent:(id)a3
{
  id v4 = a3;
  id v5 = [(NCBSTinkerMeCardViewController *)self _activeSatellitePhoneNumber];
  if ([v5 length])
  {
    id v6 = +[CNPhoneNumber phoneNumberWithStringValue:v5];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    objc_msgSend(v4, "phoneNumbers", 0);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = [v7 countByEnumeratingWithState:&v22 objects:v32 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v23;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          unsigned int v13 = [v12 value];
          unsigned int v14 = [v13 isLikePhoneNumber:v6];

          if (v14)
          {
            __int16 v17 = NCBS_Tinker_log();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              id v18 = [v12 value];
              *(_DWORD *)buf = 136446722;
              __int16 v27 = "-[NCBSTinkerMeCardViewController _addSatellitePhoneNumberToContactIfNotPresent:]";
              __int16 v28 = 2112;
              __int16 v29 = v18;
              __int16 v30 = 2112;
              id v31 = v4;
              _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "%{public}s - contact already has device number:%@; contact: %@",
                buf,
                0x20u);
            }
            goto LABEL_17;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v22 objects:v32 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    __int16 v15 = [v4 phoneNumbers];
    if (v15)
    {
      id v16 = [v4 phoneNumbers];
      id v7 = [v16 mutableCopy];
    }
    else
    {
      id v7 = +[NSMutableArray array];
    }

    __int16 v19 = +[CNLabeledValue labeledValueWithLabel:CNLabelPhoneNumberAppleWatch value:v6];
    [v7 addObject:v19];

    id v20 = [v7 copy];
    [v4 setPhoneNumbers:v20];

    __int16 v17 = NCBS_Tinker_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v27 = "-[NCBSTinkerMeCardViewController _addSatellitePhoneNumberToContactIfNotPresent:]";
      __int16 v28 = 2112;
      __int16 v29 = v6;
      __int16 v30 = 2112;
      id v31 = v4;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "%{public}s - added device number:%@; contact: %@", buf, 0x20u);
    }
LABEL_17:
  }
  return 0;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v5 = a4;
  [(NCBSTinkerMeCardViewController *)self dismissViewControllerAnimated:1 completion:0];
  if (v5)
  {
    [(NCBSTinkerMeCardViewController *)self _setFamilyMemberMeContact:v5];
    [(NCBSTinkerMeCardViewController *)self _addFamilyMemberContactToGuardianStore:v5];
    id v6 = [(NCBSTinkerMeCardViewController *)self miniFlowDelegate];
    [v6 miniFlowStepComplete:self];
  }
  else
  {
    id v7 = NCBS_Tinker_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136446210;
      id v9 = "-[NCBSTinkerMeCardViewController contactViewController:didCompleteWithContact:]";
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}s - setMeContact canceled (no contact)", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (NCBSBridgeSetupControllerDelegate)miniFlowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->miniFlowDelegate);

  return (NCBSBridgeSetupControllerDelegate *)WeakRetained;
}

- (void)setMiniFlowDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->miniFlowDelegate);

  objc_storeStrong((id *)&self->_familyMemberScopedContactStore, 0);
}

@end