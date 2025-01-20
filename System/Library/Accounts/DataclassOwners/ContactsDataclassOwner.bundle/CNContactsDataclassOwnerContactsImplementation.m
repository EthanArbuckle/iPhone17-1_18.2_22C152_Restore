@interface CNContactsDataclassOwnerContactsImplementation
+ (id)os_log;
+ (void)removeDelegate:(id)a3;
- (BOOL)areContainersEmptyForParentAccount:(id)a3;
- (BOOL)createAndExecuteSaveRequest:(id)a3 errorBlock:(id)a4;
- (BOOL)createContactsAccountForParentAccount:(id)a3 withChildAccounts:(id)a4;
- (BOOL)emptyLocalContainer;
- (BOOL)isContainerEmpty:(id)a3;
- (BOOL)isLocalContainerEmpty;
- (BOOL)mergeContactsFromLocalContainerToContainer:(id)a3;
- (BOOL)mergeContactsIntoLocalContainerFromContainersOfContactsAccount:(id)a3;
- (BOOL)moveContacts:(id)a3 fromContainer:(id)a4 toContainer:(id)a5;
- (BOOL)removeContactsAccount:(id)a3;
- (BOOL)removeContactsAccountForParentAccount:(id)a3 delegates:(id)a4 withChildAccounts:(id)a5;
- (CNACAccountProvider)accountProvider;
- (CNContactStore)contactStore;
- (CNContactsDataclassOwnerContactsImplementation)init;
- (CNContactsDataclassOwnerContactsImplementation)initWithAccountProvider:(id)a3;
- (CNContactsDataclassOwnerContactsImplementation)initWithContactStore:(id)a3 accountProvider:(id)a4;
- (id)accountWithExternalIdentifier:(id)a3;
- (id)contactsAccountForParentAccount:(id)a3 withChildAccounts:(id)a4;
- (id)contactsInContainer:(id)a3;
- (id)containersInAccount:(id)a3;
- (id)containersInAccountWithExternalIdentifier:(id)a3;
- (id)defaultContainerForParentAccount:(id)a3 withChildAccounts:(id)a4 createIfNecessary:(BOOL)a5;
- (id)defaultContainerInContactsAccount:(id)a3;
- (id)localContainer;
- (id)syncingAccountIdentifierForParentAccount:(id)a3 withChildAccounts:(id)a4;
- (void)setContainersEnabled:(BOOL)a3 forParentAccount:(id)a4 withChildAccounts:(id)a5;
- (void)setLocalContainerEnabled:(BOOL)a3;
@end

@implementation CNContactsDataclassOwnerContactsImplementation

+ (id)os_log
{
  if (qword_15CB0 != -1) {
    dispatch_once(&qword_15CB0, &stru_10408);
  }
  v2 = (void *)qword_15CB8;
  return v2;
}

- (CNContactsDataclassOwnerContactsImplementation)init
{
  v3 = +[ACAccountStore defaultStore];
  v4 = +[CNACAccountProvider providerWithStore:v3];

  v5 = [(CNContactsDataclassOwnerContactsImplementation *)self initWithAccountProvider:v4];
  return v5;
}

- (CNContactsDataclassOwnerContactsImplementation)initWithAccountProvider:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)CNContactStore);
  v6 = [(CNContactsDataclassOwnerContactsImplementation *)self initWithContactStore:v5 accountProvider:v4];

  return v6;
}

- (CNContactsDataclassOwnerContactsImplementation)initWithContactStore:(id)a3 accountProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNContactsDataclassOwnerContactsImplementation;
  v9 = [(CNContactsDataclassOwnerContactsImplementation *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactStore, a3);
    objc_storeStrong((id *)&v10->_accountProvider, a4);
    v11 = v10;
  }

  return v10;
}

- (void)setContainersEnabled:(BOOL)a3 forParentAccount:(id)a4 withChildAccounts:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_msgSend((id)objc_opt_class(), "os_log");
  v11 = [(CNContactsDataclassOwnerContactsImplementation *)self contactsAccountForParentAccount:v8 withChildAccounts:v9];
  if (v11)
  {
    v12 = [(CNContactsDataclassOwnerContactsImplementation *)self containersInAccount:v11];
    if (((*(uint64_t (**)(void, NSObject *))(CNIsArrayEmpty + 16))(CNIsArrayEmpty, v12) & 1) == 0)
    {
      objc_super v13 = CNLogicalNot();
      v14 = [v12 _cn_filter:v13];
      v15 = objc_msgSend(v14, "_cn_map:", &stru_10690);

      objc_msgSend(v15, "_cn_each:", &stru_10710);
      v16 = v10;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        CFStringRef v18 = @"NO";
        if (v6) {
          CFStringRef v18 = @"YES";
        }
        CFStringRef v22 = v18;
        id v21 = [v12 count];
        v19 = [v8 identifier];
        v20 = [v9 valueForKey:@"identifier"];
        *(_DWORD *)buf = 138544130;
        CFStringRef v28 = v22;
        __int16 v29 = 2048;
        id v30 = v21;
        __int16 v31 = 2114;
        v32 = v19;
        __int16 v33 = 2114;
        v34 = v20;
        _os_log_debug_impl(&dword_0, v16, OS_LOG_TYPE_DEBUG, "setting enabled to %{public}@ for %ld containers associated with account (external identifier = %{public}@ child external identifiers = %{public}@)", buf, 0x2Au);
      }
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_6744;
      v25[3] = &unk_10458;
      id v26 = v15;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_67E8;
      v23[3] = &unk_10480;
      v24 = v16;
      id v17 = v15;
      [(CNContactsDataclassOwnerContactsImplementation *)self createAndExecuteSaveRequest:v25 errorBlock:v23];
    }
  }
  else
  {
    v12 = v10;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_9EC4();
    }
  }
}

- (void)setLocalContainerEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactsDataclassOwnerContactsImplementation *)self localContainer];
  BOOL v6 = v5;
  if (v5)
  {
    id v7 = [v5 mutableCopy];
    [v7 setEnabled:v3];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_6940;
    v10[3] = &unk_10458;
    id v11 = v7;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_694C;
    v9[3] = &unk_10480;
    v9[4] = self;
    id v8 = v7;
    [(CNContactsDataclassOwnerContactsImplementation *)self createAndExecuteSaveRequest:v10 errorBlock:v9];
  }
}

- (BOOL)isLocalContainerEmpty
{
  v2 = self;
  BOOL v3 = [(CNContactsDataclassOwnerContactsImplementation *)self localContainer];
  LOBYTE(v2) = [(CNContactsDataclassOwnerContactsImplementation *)v2 isContainerEmpty:v3];

  return (char)v2;
}

- (BOOL)areContainersEmptyForParentAccount:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  BOOL v6 = [v4 identifier];
  objc_msgSend(v5, "_cn_addNonNilObject:", v6);

  id v7 = [(CNContactsDataclassOwnerContactsImplementation *)self accountProvider];
  id v8 = [v7 childAccountsForAccount:v4];
  id v9 = [v8 valueForKey:@"identifier"];
  [v5 addObjectsFromArray:v9];

  if ((*(uint64_t (**)(void, void *))(CNIsArrayEmpty + 16))(CNIsArrayEmpty, v5))
  {
    char v10 = 1;
  }
  else
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_6C14;
    v18[3] = &unk_104A8;
    v18[4] = self;
    id v11 = objc_msgSend(v5, "_cn_map:", v18);
    v12 = objc_msgSend(v11, "_cn_flatten");
    objc_super v13 = objc_msgSend(v12, "_cn_filter:", CNIsNotNull);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_6C20;
    v17[3] = &unk_104D0;
    v17[4] = self;
    v14 = objc_msgSend(v13, "_cn_firstObjectPassingTest:", v17);

    v15 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_A054();
    }

    char v10 = v14 == 0;
  }

  return v10;
}

- (BOOL)emptyLocalContainer
{
  BOOL v3 = objc_msgSend((id)objc_opt_class(), "os_log");
  id v4 = [(CNContactsDataclassOwnerContactsImplementation *)self localContainer];
  if (v4)
  {
    id v5 = [(CNContactsDataclassOwnerContactsImplementation *)self contactsInContainer:v4];
    BOOL v6 = objc_msgSend(v5, "_cn_map:", &stru_106D0);

    if (v6)
    {
      uint64_t v7 = CNIsArrayEmpty;
      if ((*(unsigned int (**)(void, void *))(CNIsArrayEmpty + 16))(CNIsArrayEmpty, v6)
        && os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        sub_A1E4(v3);
      }
    }
    else
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        sub_A1A0(v3);
      }
      uint64_t v7 = CNIsArrayEmpty;
    }
    if ((*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v6))
    {
      LOBYTE(v8) = 1;
    }
    else
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_6E78;
      v15[3] = &unk_10458;
      id v16 = v6;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_6F1C;
      v12[3] = &unk_10520;
      id v9 = v3;
      objc_super v13 = v9;
      id v14 = v16;
      BOOL v8 = [(CNContactsDataclassOwnerContactsImplementation *)self createAndExecuteSaveRequest:v15 errorBlock:v12];
      if (v8)
      {
        char v10 = v9;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_A114();
        }
      }
    }
  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (id)defaultContainerForParentAccount:(id)a3 withChildAccounts:(id)a4 createIfNecessary:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  char v10 = objc_msgSend((id)objc_opt_class(), "os_log");
  id v11 = [(CNContactsDataclassOwnerContactsImplementation *)self contactsAccountForParentAccount:v9 withChildAccounts:v8];

  if (!v9)
  {
    v19 = v10;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_A2C4(v8);
    }
    v12 = 0;
    goto LABEL_11;
  }
  v12 = [(CNContactsDataclassOwnerContactsImplementation *)self defaultContainerInContactsAccount:v11];
  if (!v12 && v5)
  {
    id v13 = objc_alloc_init((Class)CNMutableContainer);
    [v13 setEnabled:1];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_723C;
    v29[3] = &unk_10548;
    id v14 = v13;
    id v30 = v14;
    id v15 = v11;
    id v31 = v15;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_72AC;
    v27[3] = &unk_10480;
    id v16 = v10;
    id v28 = v16;
    unsigned int v17 = [(CNContactsDataclassOwnerContactsImplementation *)self createAndExecuteSaveRequest:v29 errorBlock:v27];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_72FC;
    v24[3] = &unk_10548;
    id v25 = v14;
    id v18 = v15;
    id v26 = v18;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_736C;
    v22[3] = &unk_10480;
    id v23 = v16;
    v19 = v14;
    unsigned int v20 = [(CNContactsDataclassOwnerContactsImplementation *)self createAndExecuteSaveRequest:v24 errorBlock:v22];
    v12 = 0;
    if (v17 && v20)
    {
      v12 = [(CNContactsDataclassOwnerContactsImplementation *)self defaultContainerInContactsAccount:v18];
    }

LABEL_11:
  }

  return v12;
}

- (id)contactsAccountForParentAccount:(id)a3 withChildAccounts:(id)a4
{
  BOOL v5 = [(CNContactsDataclassOwnerContactsImplementation *)self syncingAccountIdentifierForParentAccount:a3 withChildAccounts:a4];
  if ((*(uint64_t (**)(void, void *))(CNIsStringEmpty + 16))(CNIsStringEmpty, v5))
  {
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = [(CNContactsDataclassOwnerContactsImplementation *)self accountWithExternalIdentifier:v5];
  }

  return v6;
}

- (BOOL)createContactsAccountForParentAccount:(id)a3 withChildAccounts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend((id)objc_opt_class(), "os_log");
  id v9 = [(CNContactsDataclassOwnerContactsImplementation *)self syncingAccountIdentifierForParentAccount:v6 withChildAccounts:v7];
  if ((*(uint64_t (**)(void, void *))(CNIsStringEmpty + 16))(CNIsStringEmpty, v9))
  {
    LOBYTE(v10) = 0;
  }
  else
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_7794;
    v29[3] = &unk_10458;
    id v30 = [objc_alloc((Class)CNAccount) initWithExternalIdentifier:v9];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_77A0;
    v26[3] = &unk_10520;
    id v11 = v8;
    id v27 = v11;
    id v12 = v9;
    id v28 = v12;
    id v13 = v30;
    BOOL v10 = [(CNContactsDataclassOwnerContactsImplementation *)self createAndExecuteSaveRequest:v29 errorBlock:v26];
    if (v10)
    {
      id v14 = [(CNContactsDataclassOwnerContactsImplementation *)self accountWithExternalIdentifier:v12];
      id v15 = [v7 valueForKey:@"identifier"];
      id v16 = v11;
      unsigned int v17 = v16;
      if (v14)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          id v25 = [v14 identifier];
          unsigned int v23 = [v14 iOSLegacyIdentifier];
          v24 = [v14 externalIdentifierString];
          uint64_t v18 = [v6 identifier];
          *(_DWORD *)buf = 138544386;
          id v32 = v25;
          __int16 v33 = 1024;
          *(_DWORD *)v34 = v23;
          *(_WORD *)&v34[4] = 2114;
          *(void *)&v34[6] = v24;
          *(_WORD *)&v34[14] = 2114;
          *(void *)&v34[16] = v18;
          v19 = (void *)v18;
          __int16 v35 = 2114;
          v36 = v15;
          _os_log_debug_impl(&dword_0, v17, OS_LOG_TYPE_DEBUG, "Created a local CN account (identifier = %{public}@ legacy id = %d, externalIdentifier = %{public}@) for external account with identifier %{public}@ and child identifiers %{public}@", buf, 0x30u);
        }
      }
      else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = [v6 identifier];
        *(_DWORD *)buf = 138543874;
        id v32 = v12;
        __int16 v33 = 2114;
        *(void *)v34 = v21;
        CFStringRef v22 = (void *)v21;
        *(_WORD *)&v34[8] = 2114;
        *(void *)&v34[10] = v15;
        _os_log_error_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, "Failed to create a CN account (externalIdentifier = %{public}@) for external account with for external account with identifier %{public}@ and child identifiers %{public}@", buf, 0x20u);
      }
    }
  }
  return v10;
}

- (BOOL)removeContactsAccountForParentAccount:(id)a3 delegates:(id)a4 withChildAccounts:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_msgSend((id)objc_opt_class(), "os_log");
  id v12 = [(CNContactsDataclassOwnerContactsImplementation *)self contactsAccountForParentAccount:v8 withChildAccounts:v10];
  if (v12)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_7944;
    v16[3] = &unk_10570;
    v16[4] = self;
    objc_msgSend(v9, "_cn_each:", v16);
    BOOL v13 = [(CNContactsDataclassOwnerContactsImplementation *)self removeContactsAccount:v12];
  }
  else
  {
    id v14 = [(CNContactsDataclassOwnerContactsImplementation *)self syncingAccountIdentifierForParentAccount:v8 withChildAccounts:v10];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_A4F0();
    }

    BOOL v13 = 0;
  }

  return v13;
}

+ (void)removeDelegate:(id)a3
{
  id v3 = a3;
  id v4 = [v3 first];
  BOOL v5 = [v3 second];

  id v6 = [objc_alloc((Class)CNAccount) initWithExternalIdentifier:v4];
  id v7 = [objc_alloc((Class)CNCoreDelegateInfo) initWithDSID:0 altDSID:v5 appleID:0 principalPath:0 nameComponents:0 isMe:0];
  id v8 = +[CNContactStore storeWithDelegateInfo:v7];
  id v9 = objc_alloc_init((Class)CNSaveRequest);
  [v9 removeAccount:v6];
  id v13 = 0;
  unsigned __int8 v10 = [v8 executeSaveRequest:v9 error:&v13];
  id v11 = v13;
  if ((v10 & 1) == 0)
  {
    id v12 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_A558();
    }
  }
}

- (BOOL)removeContactsAccount:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_A5C0(v4, v5);
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_7C3C;
  v13[3] = &unk_10458;
  id v14 = v4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_7C48;
  v10[3] = &unk_10520;
  id v11 = v5;
  id v12 = v14;
  id v6 = v14;
  id v7 = v5;
  BOOL v8 = [(CNContactsDataclassOwnerContactsImplementation *)self createAndExecuteSaveRequest:v13 errorBlock:v10];

  return v8;
}

- (BOOL)mergeContactsFromLocalContainerToContainer:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_msgSend((id)objc_opt_class(), "os_log");
  id v6 = [(CNContactsDataclassOwnerContactsImplementation *)self localContainer];
  if (v6)
  {
    id v7 = [(CNContactsDataclassOwnerContactsImplementation *)self contactsInContainer:v6];
    BOOL v8 = objc_msgSend(v7, "_cn_map:", &stru_106D0);

    if (![v8 count])
    {
      id v9 = v5;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_A734(v4);
      }
    }
    if ((*(uint64_t (**)(void, void *))(CNIsArrayEmpty + 16))(CNIsArrayEmpty, v8))
    {
      unsigned __int8 v10 = 1;
    }
    else
    {
      id v11 = [(CNContactsDataclassOwnerContactsImplementation *)self contactStore];
      id v22 = 0;
      unsigned __int8 v10 = [v11 moveContacts:v8 fromContainer:v6 toContainer:v4 error:&v22];
      id v12 = v22;

      id v13 = v5;
      id v14 = v13;
      if (v10)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          id v21 = [v8 count];
          id v15 = [v6 identifier];
          unsigned int v16 = [v6 iOSLegacyIdentifier];
          unsigned int v17 = [v4 identifier];
          unsigned int v18 = [v4 iOSLegacyIdentifier];
          *(_DWORD *)buf = 134219522;
          id v24 = v21;
          __int16 v25 = 2114;
          id v26 = v15;
          __int16 v27 = 1024;
          *(_DWORD *)id v28 = v16;
          *(_WORD *)&v28[4] = 2112;
          *(void *)&v28[6] = v4;
          __int16 v29 = 2114;
          id v30 = v17;
          __int16 v31 = 1024;
          unsigned int v32 = v18;
          __int16 v33 = 2112;
          id v34 = v12;
          _os_log_debug_impl(&dword_0, v14, OS_LOG_TYPE_DEBUG, "Migrated %ld contacts to from local container (identifier = %{public}@ legacy id: %d) to container %@ (identifier = %{public}@ legacy id %d): %@", buf, 0x40u);
        }
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v20 = [v8 count];
        *(_DWORD *)buf = 134218498;
        id v24 = v20;
        __int16 v25 = 2112;
        id v26 = v4;
        __int16 v27 = 2112;
        *(void *)id v28 = v12;
        _os_log_error_impl(&dword_0, v14, OS_LOG_TYPE_ERROR, "did not migrate %ld contacts to from local container to container %@: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    unsigned __int8 v10 = 1;
  }

  return v10;
}

- (BOOL)mergeContactsIntoLocalContainerFromContainersOfContactsAccount:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNContactsDataclassOwnerContactsImplementation *)self localContainer];
  if (v5)
  {
    id v6 = [(CNContactsDataclassOwnerContactsImplementation *)self containersInAccount:v4];
    if (v6)
    {
      uint64_t v18 = 0;
      v19 = &v18;
      uint64_t v20 = 0x2020000000;
      char v21 = 1;
      id v7 = objc_msgSend((id)objc_opt_class(), "os_log");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        id v11 = [v4 identifier];
        id v12 = [v4 externalIdentifierString];
        unsigned int v13 = [v4 iOSLegacyIdentifier];
        *(_DWORD *)buf = 138543874;
        unsigned int v23 = v11;
        __int16 v24 = 2114;
        __int16 v25 = v12;
        __int16 v26 = 1024;
        unsigned int v27 = v13;
        _os_log_debug_impl(&dword_0, v7, OS_LOG_TYPE_DEBUG, "Merging contacts into local container from account with CN identifier: %{public}@ external identifier: %{public}@ legacy id = %d", buf, 0x1Cu);
      }
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_81F8;
      v17[3] = &unk_10598;
      v17[4] = self;
      BOOL v8 = objc_msgSend(v6, "_cn_map:", v17);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_8290;
      v14[3] = &unk_105C0;
      v14[4] = self;
      id v15 = v5;
      unsigned int v16 = &v18;
      objc_msgSend(v8, "_cn_each:", v14);

      BOOL v9 = *((unsigned char *)v19 + 24) != 0;
      _Block_object_dispose(&v18, 8);
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)moveContacts:(id)a3 fromContainer:(id)a4 toContainer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_msgSend((id)objc_opt_class(), "os_log");
  id v12 = [(CNContactsDataclassOwnerContactsImplementation *)self contactStore];
  id v22 = 0;
  unsigned __int8 v13 = [v12 moveContacts:v8 fromContainer:v9 toContainer:v10 error:&v22];
  id v14 = v22;

  if (v13)
  {
    id v15 = v11;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      id v21 = [v8 count];
      unsigned int v17 = [v10 identifier];
      unsigned int v18 = [v10 iOSLegacyIdentifier];
      v19 = [v9 identifier];
      unsigned int v20 = [v9 iOSLegacyIdentifier];
      *(_DWORD *)buf = 134219010;
      id v24 = v21;
      __int16 v25 = 2114;
      __int16 v26 = v17;
      __int16 v27 = 1024;
      unsigned int v28 = v18;
      __int16 v29 = 2114;
      id v30 = v19;
      __int16 v31 = 1024;
      unsigned int v32 = v20;
      _os_log_debug_impl(&dword_0, v15, OS_LOG_TYPE_DEBUG, "Moved %ld contacts into container (CN identifier: %{public}@ legacy id = %d) from container (CN identifier: %{public}@ legacy id = %d)", buf, 0x2Cu);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    sub_A7CC();
  }

  return v13;
}

- (id)syncingAccountIdentifierForParentAccount:(id)a3 withChildAccounts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CNContactsDataclassOwnerContactsImplementation *)self accountProvider];
  unsigned int v9 = [v8 isAccountSyncable:v6];

  if (v9)
  {
    id v10 = [v6 identifier];
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v7;
    id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v22;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          unsigned int v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          unsigned int v17 = [(CNContactsDataclassOwnerContactsImplementation *)self accountProvider];
          unsigned __int8 v18 = [v17 isAccountSyncable:v16];

          if (v18)
          {
            id v10 = [v16 identifier];

            goto LABEL_15;
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    v19 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_A834(v6, v19);
    }

    id v10 = 0;
  }
LABEL_15:

  return v10;
}

- (BOOL)isContainerEmpty:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)CNContactFetchRequest);
  v19 = CNContactIdentifierKey;
  id v6 = +[NSArray arrayWithObjects:&v19 count:1];
  id v7 = [v5 initWithKeysToFetch:v6];

  [v7 setUnifyResults:0];
  id v8 = [v4 identifier];
  unsigned int v9 = +[CNContact predicateForContactsInContainerWithIdentifier:v8];
  [v7 setPredicate:v9];

  uint64_t v15 = 0;
  unsigned int v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v10 = [(CNContactsDataclassOwnerContactsImplementation *)self contactStore];
  void v13[4] = &v15;
  id v14 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_88F0;
  v13[3] = &unk_105E8;
  [v10 enumerateContactsWithFetchRequest:v7 error:&v14 usingBlock:v13];
  id v11 = v14;

  LODWORD(v10) = *((unsigned __int8 *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return v10 == 0;
}

- (id)localContainer
{
  id v3 = objc_msgSend((id)objc_opt_class(), "os_log");
  id v4 = [(CNContactsDataclassOwnerContactsImplementation *)self contactStore];
  id v5 = +[CNContainer predicateForLocalContainerIncludingDisabled:1];
  id v12 = 0;
  id v6 = [v4 containersMatchingPredicate:v5 error:&v12];
  id v7 = v12;
  id v8 = [v6 firstObject];

  if (v8)
  {
    unsigned int v9 = v3;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_A930(v8);
    }

    id v10 = v8;
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    sub_A8C8();
  }

  return v8;
}

- (id)defaultContainerInContactsAccount:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(), "os_log");
  id v6 = [v4 identifier];
  id v7 = +[CNContainer predicateForDefaultContainerForAccountWithIdentifier:v6];

  id v8 = [(CNContactsDataclassOwnerContactsImplementation *)self contactStore];
  id v16 = 0;
  unsigned int v9 = [v8 containersMatchingPredicate:v7 error:&v16];
  id v10 = v16;
  id v11 = [v9 firstObject];

  id v12 = v5;
  id v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_AA7C(v11, v4, v13);
    }

    id v14 = v11;
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_A9C8(v4);
    }
  }
  return v11;
}

- (id)containersInAccountWithExternalIdentifier:(id)a3
{
  id v4 = [(CNContactsDataclassOwnerContactsImplementation *)self accountWithExternalIdentifier:a3];
  if (v4)
  {
    id v5 = [(CNContactsDataclassOwnerContactsImplementation *)self containersInAccount:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)accountWithExternalIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(), "os_log");
  id v6 = +[CNAccount predicateForAccountWithExternalIdentifier:v4];
  id v7 = [(CNContactsDataclassOwnerContactsImplementation *)self contactStore];
  id v14 = 0;
  id v8 = [v7 accountsMatchingPredicate:v6 error:&v14];
  id v9 = v14;
  id v10 = [v8 firstObject];

  if (v10)
  {
    id v11 = v5;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_ABF8(v10);
    }

    id v12 = v10;
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_AB90();
  }

  return v10;
}

- (id)containersInAccount:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(), "os_log");
  id v6 = [v4 identifier];
  id v7 = +[CNContainer predicateForContainersInAccountWithIdentifier:v6 includingDisabledContainers:1];

  id v8 = [(CNContactsDataclassOwnerContactsImplementation *)self contactStore];
  id v15 = 0;
  id v9 = [v8 containersMatchingPredicate:v7 error:&v15];
  id v10 = v15;

  id v11 = v5;
  id v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_AD60();
    }

    id v13 = v9;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_ACC8();
    }
  }
  return v9;
}

- (id)contactsInContainer:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)CNContactFetchRequest);
  char v18 = CNContactIdentifierKey;
  id v6 = +[NSArray arrayWithObjects:&v18 count:1];
  id v7 = [v5 initWithKeysToFetch:v6];

  [v7 setUnifyResults:0];
  id v8 = [v4 identifier];

  id v9 = +[CNContact predicateForContactsInContainerWithIdentifier:v8];
  [v7 setPredicate:v9];

  id v10 = +[NSMutableArray array];
  id v11 = [(CNContactsDataclassOwnerContactsImplementation *)self contactStore];
  id v17 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_9048;
  v15[3] = &unk_10610;
  id v12 = v10;
  id v16 = v12;
  [v11 enumerateContactsWithFetchRequest:v7 error:&v17 usingBlock:v15];
  id v13 = v17;

  return v12;
}

- (BOOL)createAndExecuteSaveRequest:(id)a3 errorBlock:(id)a4
{
  id v6 = (void (**)(id, id))a3;
  id v7 = (void (**)(id, id))a4;
  id v8 = objc_alloc_init((Class)CNSaveRequest);
  if (v6) {
    v6[2](v6, v8);
  }
  id v9 = [(CNContactsDataclassOwnerContactsImplementation *)self contactStore];
  id v13 = 0;
  unsigned __int8 v10 = [v9 executeSaveRequest:v8 error:&v13];
  id v11 = v13;

  if (v7 && (v10 & 1) == 0) {
    v7[2](v7, v11);
  }

  return v10;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (CNACAccountProvider)accountProvider
{
  return self->_accountProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountProvider, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end