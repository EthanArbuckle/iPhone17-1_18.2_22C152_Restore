@interface NCCNContactsDataclassOwnerContactsImplementation
+ (id)os_log;
- (BOOL)createAndExecuteSaveRequest:(id)a3 errorBlock:(id)a4;
- (BOOL)createContactsAccountForParentAccount:(id)a3 withChildAccounts:(id)a4;
- (BOOL)isContainerEmpty:(id)a3;
- (BOOL)isLocalContainerEmpty;
- (BOOL)mergeContactsFromLocalContainerToContainer:(id)a3;
- (CNACAccountProvider)accountProvider;
- (CNContactStore)contactStore;
- (NCCNContactsDataclassOwnerContactsImplementation)initWithContactStore:(id)a3 accountProvider:(id)a4;
- (id)accountWithExternalIdentifier:(id)a3;
- (id)contactsAccountForParentAccount:(id)a3 withChildAccounts:(id)a4;
- (id)contactsInContainer:(id)a3;
- (id)containersInAccount:(id)a3;
- (id)containersInAccountWithExternalIdentifier:(id)a3;
- (id)defaultContainerForParentAccount:(id)a3 withChildAccounts:(id)a4 createIfNecessary:(BOOL)a5;
- (id)defaultContainerInContactsAccount:(id)a3;
- (id)localContainer;
- (id)syncingAccountIdentifierForParentAccount:(id)a3 withChildAccounts:(id)a4;
- (void)setLocalContainerEnabled:(BOOL)a3;
@end

@implementation NCCNContactsDataclassOwnerContactsImplementation

+ (id)os_log
{
  if (qword_23E38 != -1) {
    dispatch_once(&qword_23E38, &stru_1C4F0);
  }
  v2 = (void *)qword_23E40;

  return v2;
}

- (NCCNContactsDataclassOwnerContactsImplementation)initWithContactStore:(id)a3 accountProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NCCNContactsDataclassOwnerContactsImplementation;
  v9 = [(NCCNContactsDataclassOwnerContactsImplementation *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactStore, a3);
    objc_storeStrong((id *)&v10->_accountProvider, a4);
    v11 = v10;
  }

  return v10;
}

- (void)setLocalContainerEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(NCCNContactsDataclassOwnerContactsImplementation *)self localContainer];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 mutableCopy];
    [v7 setEnabled:v3];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_4EEC;
    v10[3] = &unk_1C518;
    id v11 = v7;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_4EF8;
    v9[3] = &unk_1C540;
    v9[4] = self;
    id v8 = v7;
    [(NCCNContactsDataclassOwnerContactsImplementation *)self createAndExecuteSaveRequest:v10 errorBlock:v9];
  }
}

- (BOOL)isLocalContainerEmpty
{
  v2 = self;
  BOOL v3 = [(NCCNContactsDataclassOwnerContactsImplementation *)self localContainer];
  LOBYTE(v2) = [(NCCNContactsDataclassOwnerContactsImplementation *)v2 isContainerEmpty:v3];

  return (char)v2;
}

- (id)defaultContainerForParentAccount:(id)a3 withChildAccounts:(id)a4 createIfNecessary:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  v9 = [(NCCNContactsDataclassOwnerContactsImplementation *)self contactsAccountForParentAccount:a3 withChildAccounts:v8];
  if (!a3)
  {
    v16 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_F998(v8);
    }
    v10 = 0;
    goto LABEL_11;
  }
  v10 = [(NCCNContactsDataclassOwnerContactsImplementation *)self defaultContainerInContactsAccount:v9];
  if (!v10 && v5)
  {
    id v11 = objc_alloc_init((Class)CNMutableContainer);
    [v11 setEnabled:1];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_522C;
    v31[3] = &unk_1C568;
    id v12 = v11;
    id v32 = v12;
    id v13 = v9;
    id v33 = v13;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_529C;
    v30[3] = &unk_1C540;
    v30[4] = self;
    unsigned int v14 = [(NCCNContactsDataclassOwnerContactsImplementation *)self createAndExecuteSaveRequest:v31 errorBlock:v30];
    v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472;
    v26 = sub_52FC;
    v27 = &unk_1C568;
    id v28 = v12;
    id v15 = v13;
    id v29 = v15;
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = sub_536C;
    v22 = &unk_1C540;
    v23 = self;
    v16 = v12;
    unsigned int v17 = [(NCCNContactsDataclassOwnerContactsImplementation *)self createAndExecuteSaveRequest:&v24 errorBlock:&v19];
    v10 = 0;
    if (v14 && v17)
    {
      v10 = -[NCCNContactsDataclassOwnerContactsImplementation defaultContainerInContactsAccount:](self, "defaultContainerInContactsAccount:", v15, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29);
    }

LABEL_11:
  }

  return v10;
}

- (id)contactsAccountForParentAccount:(id)a3 withChildAccounts:(id)a4
{
  BOOL v5 = [(NCCNContactsDataclassOwnerContactsImplementation *)self syncingAccountIdentifierForParentAccount:a3 withChildAccounts:a4];
  if ((*(uint64_t (**)(void, void *))(CNIsStringEmpty + 16))(CNIsStringEmpty, v5))
  {
    v6 = 0;
  }
  else
  {
    v6 = [(NCCNContactsDataclassOwnerContactsImplementation *)self accountWithExternalIdentifier:v5];
  }

  return v6;
}

- (BOOL)createContactsAccountForParentAccount:(id)a3 withChildAccounts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NCCNContactsDataclassOwnerContactsImplementation *)self syncingAccountIdentifierForParentAccount:v6 withChildAccounts:v7];
  if ((*(uint64_t (**)(void, void *))(CNIsStringEmpty + 16))(CNIsStringEmpty, v8))
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_56D0;
    v19[3] = &unk_1C518;
    id v10 = [objc_alloc((Class)CNAccount) initWithExternalIdentifier:v8];
    id v20 = v10;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_56DC;
    v17[3] = &unk_1C590;
    v17[4] = self;
    id v18 = v8;
    BOOL v9 = [(NCCNContactsDataclassOwnerContactsImplementation *)self createAndExecuteSaveRequest:v19 errorBlock:v17];
    if (v9)
    {
      id v11 = objc_msgSend((id)objc_opt_class(), "os_log");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        id v13 = [v10 identifier];
        unsigned int v14 = [v10 iOSLegacyIdentifier];
        id v15 = [v6 identifier];
        v16 = [v7 valueForKey:@"identifier"];
        *(_DWORD *)buf = 138544130;
        v22 = v13;
        __int16 v23 = 1024;
        unsigned int v24 = v14;
        __int16 v25 = 2114;
        v26 = v15;
        __int16 v27 = 2114;
        id v28 = v16;
        _os_log_debug_impl(&dword_0, v11, OS_LOG_TYPE_DEBUG, "Created a local CN account (identifier = %{public}@  legacy id = %d) for external account with identifier %{public}@ and child identifiers %{public}@", buf, 0x26u);
      }
    }
  }
  return v9;
}

- (BOOL)mergeContactsFromLocalContainerToContainer:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NCCNContactsDataclassOwnerContactsImplementation *)self localContainer];
  if (!v5)
  {
    unsigned __int8 v9 = 1;
    goto LABEL_19;
  }
  id v6 = [(NCCNContactsDataclassOwnerContactsImplementation *)self contactsInContainer:v5];
  id v7 = objc_msgSend(v6, "_cn_map:", &stru_1C620);

  if (!v7)
  {
    id v8 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_FBC4(v4);
    }
    goto LABEL_9;
  }
  if (![v7 count])
  {
    id v8 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_FC5C(v4);
    }
LABEL_9:
  }
  if ((*(uint64_t (**)(void, void *))(CNIsArrayEmpty + 16))(CNIsArrayEmpty, v7))
  {
    unsigned __int8 v9 = 1;
  }
  else
  {
    id v10 = [(NCCNContactsDataclassOwnerContactsImplementation *)self contactStore];
    id v21 = 0;
    unsigned __int8 v9 = [v10 moveContacts:v7 fromContainer:v5 toContainer:v4 error:&v21];
    id v11 = v21;

    id v12 = objc_msgSend((id)objc_opt_class(), "os_log");
    id v13 = v12;
    if (v9)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        id v14 = [v7 count];
        id v15 = [v5 identifier];
        unsigned int v16 = [v5 iOSLegacyIdentifier];
        unsigned int v17 = [v4 identifier];
        unsigned int v18 = [v4 iOSLegacyIdentifier];
        *(_DWORD *)buf = 134219522;
        id v23 = v14;
        __int16 v24 = 2114;
        id v25 = v15;
        __int16 v26 = 1024;
        *(_DWORD *)__int16 v27 = v16;
        *(_WORD *)&v27[4] = 2112;
        *(void *)&v27[6] = v4;
        __int16 v28 = 2114;
        id v29 = v17;
        __int16 v30 = 1024;
        unsigned int v31 = v18;
        __int16 v32 = 2112;
        id v33 = v11;
        _os_log_debug_impl(&dword_0, v13, OS_LOG_TYPE_DEBUG, "Migrated %ld contacts to from local container (identifier = %{public}@ legacy id: %d) to container %@ (identifier = %{public}@ legacy id %d): %@", buf, 0x40u);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v20 = [v7 count];
      *(_DWORD *)buf = 134218498;
      id v23 = v20;
      __int16 v24 = 2112;
      id v25 = v4;
      __int16 v26 = 2112;
      *(void *)__int16 v27 = v11;
      _os_log_error_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "did not migrate %ld contacts to from local container to container %@: %@", buf, 0x20u);
    }
  }
LABEL_19:

  return v9;
}

- (id)syncingAccountIdentifierForParentAccount:(id)a3 withChildAccounts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NCCNContactsDataclassOwnerContactsImplementation *)self accountProvider];
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
          unsigned int v17 = [(NCCNContactsDataclassOwnerContactsImplementation *)self accountProvider];
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
      sub_FCF4(v6, v19);
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
  id v10 = [(NCCNContactsDataclassOwnerContactsImplementation *)self contactStore];
  v13[4] = &v15;
  id v14 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_5DF4;
  v13[3] = &unk_1C5B8;
  [v10 enumerateContactsWithFetchRequest:v7 error:&v14 usingBlock:v13];
  id v11 = v14;

  LODWORD(v10) = *((unsigned __int8 *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return v10 == 0;
}

- (id)localContainer
{
  v2 = [(NCCNContactsDataclassOwnerContactsImplementation *)self contactStore];
  BOOL v3 = +[CNContainer predicateForLocalContainerIncludingDisabled:1];
  id v11 = 0;
  id v4 = [v2 containersMatchingPredicate:v3 error:&v11];
  id v5 = v11;
  id v6 = [v4 firstObject];

  id v7 = objc_msgSend((id)objc_opt_class(), "os_log");
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_FDF0(v6);
    }

    id v9 = v6;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_FD88();
    }
  }

  return v6;
}

- (id)defaultContainerInContactsAccount:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = +[CNContainer predicateForDefaultContainerForAccountWithIdentifier:v5];

  id v7 = [(NCCNContactsDataclassOwnerContactsImplementation *)self contactStore];
  id v15 = 0;
  id v8 = [v7 containersMatchingPredicate:v6 error:&v15];
  id v9 = v15;
  id v10 = [v8 firstObject];

  id v11 = objc_msgSend((id)objc_opt_class(), "os_log");
  id v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_FF44(v10, v4, v12);
    }

    id v13 = v10;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_FE88(v4);
    }
  }

  return v10;
}

- (id)containersInAccountWithExternalIdentifier:(id)a3
{
  id v4 = [(NCCNContactsDataclassOwnerContactsImplementation *)self accountWithExternalIdentifier:a3];
  if (v4)
  {
    id v5 = [(NCCNContactsDataclassOwnerContactsImplementation *)self containersInAccount:v4];
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
  id v5 = +[CNAccount predicateForAccountWithExternalIdentifier:v4];
  id v6 = [(NCCNContactsDataclassOwnerContactsImplementation *)self contactStore];
  id v14 = 0;
  id v7 = [v6 accountsMatchingPredicate:v5 error:&v14];
  id v8 = v14;
  id v9 = [v7 firstObject];

  id v10 = objc_msgSend((id)objc_opt_class(), "os_log");
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_100CC(v9);
    }

    id v12 = v9;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10058((uint64_t)v4);
    }
  }

  return v9;
}

- (id)containersInAccount:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = +[CNContainer predicateForContainersInAccountWithIdentifier:v5 includingDisabledContainers:1];

  id v7 = [(NCCNContactsDataclassOwnerContactsImplementation *)self contactStore];
  id v14 = 0;
  id v8 = [v7 containersMatchingPredicate:v6 error:&v14];
  id v9 = v14;

  id v10 = objc_msgSend((id)objc_opt_class(), "os_log");
  id v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_10250(v8, v4);
    }

    id v12 = v8;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_101A4(v4, (uint64_t)v9, v11);
    }
  }

  return v8;
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
  id v11 = [(NCCNContactsDataclassOwnerContactsImplementation *)self contactStore];
  id v17 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_6514;
  v15[3] = &unk_1C5E0;
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
  id v9 = [(NCCNContactsDataclassOwnerContactsImplementation *)self contactStore];
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