@interface CNContactsDataclassOwner
+ (OS_os_log)log;
+ (id)dataclasses;
- (BOOL)areSourcesEmptyForAccount:(id)a3;
- (BOOL)isLocalSourceEmpty;
- (BOOL)performAction:(id)a3 forAccount:(id)a4 withChildren:(id)a5 forDataclass:(id)a6;
- (CNACAccountProvider)accountProvider;
- (CNContactsDataclassOwner)init;
- (CNContactsDataclassOwner)initWithImplementation:(id)a3 accountProvider:(id)a4;
- (CNContactsDataclassOwnerImplementation)implementation;
- (id)actionsForAddingAccount:(id)a3 forDataclass:(id)a4;
- (id)actionsForDeletingAccount:(id)a3 forDataclass:(id)a4;
- (id)actionsForDeletingAppleAccount:(id)a3;
- (id)actionsForDeletingGenericAccount:(id)a3;
- (id)actionsForDisablingDataclassOnAccount:(id)a3 forDataclass:(id)a4;
- (id)actionsForDisablingDataclassOnAppleAccount:(id)a3;
- (id)actionsForDisablingDataclassOnGenericAccount:(id)a3;
- (id)actionsForEnablingDataclassOnAccount:(id)a3 forDataclass:(id)a4;
- (id)actionsForEnablingDataclassOnAppleAccount:(id)a3;
- (id)actionsForEnablingDataclassOnGenericAccount:(id)a3;
@end

@implementation CNContactsDataclassOwner

+ (id)dataclasses
{
  uint64_t v4 = kAccountDataclassContacts;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];
  return v2;
}

+ (OS_os_log)log
{
  if (qword_15C90 != -1) {
    dispatch_once(&qword_15C90, &stru_10308);
  }
  v2 = (void *)qword_15C98;
  return (OS_os_log *)v2;
}

- (CNContactsDataclassOwner)init
{
  v3 = +[ACAccountStore defaultStore];
  id v4 = objc_alloc_init((Class)CNContactStore);
  v5 = +[CNACAccountProvider providerWithStore:v3];
  v6 = [[CNContactsDataclassOwnerContactsImplementation alloc] initWithContactStore:v4 accountProvider:v5];
  v7 = [(CNContactsDataclassOwner *)self initWithImplementation:v6 accountProvider:v5];

  return v7;
}

- (CNContactsDataclassOwner)initWithImplementation:(id)a3 accountProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNContactsDataclassOwner;
  v9 = [(CNContactsDataclassOwner *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_implementation, a3);
    objc_storeStrong((id *)&v10->_accountProvider, a4);
    v11 = v10;
  }

  return v10;
}

- (id)actionsForAddingAccount:(id)a3 forDataclass:(id)a4
{
  return [(CNContactsDataclassOwner *)self actionsForEnablingDataclassOnAccount:a3 forDataclass:a4];
}

- (id)actionsForEnablingDataclassOnAccount:(id)a3 forDataclass:(id)a4
{
  id v5 = a3;
  if (+[CNACAccountTypeAnalyzer isAccountAppleAccount:v5])
  {
    uint64_t v6 = [(CNContactsDataclassOwner *)self actionsForEnablingDataclassOnAppleAccount:v5];
LABEL_5:
    id v7 = (void *)v6;
    goto LABEL_7;
  }
  if (+[CNACAccountTypeAnalyzer isAccountGenericContactsSyncingAccount:v5])
  {
    uint64_t v6 = [(CNContactsDataclassOwner *)self actionsForEnablingDataclassOnGenericAccount:v5];
    goto LABEL_5;
  }
  id v7 = 0;
LABEL_7:

  return v7;
}

- (id)actionsForEnablingDataclassOnAppleAccount:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CNContactsDataclassOwner *)self isLocalSourceEmpty];
  uint64_t v6 = [(id)objc_opt_class() log];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7) {
      sub_9834();
    }

    id v8 = +[CNDataclassActionDefinition createSyncDataStore];
    objc_super v13 = v8;
    v9 = +[NSArray arrayWithObjects:&v13 count:1];
  }
  else
  {
    if (v7) {
      sub_989C();
    }

    id v8 = +[CNDataclassActionDefinition mergeLocalDataIntoSyncData];
    v10 = +[CNDataclassActionDefinition cancel];
    v12[1] = v10;
    v9 = +[NSArray arrayWithObjects:v12 count:2];
  }
  return v9;
}

- (id)actionsForEnablingDataclassOnGenericAccount:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CNContactsDataclassOwner *)self isLocalSourceEmpty];
  uint64_t v6 = [(id)objc_opt_class() log];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7) {
      sub_9904();
    }

    id v8 = +[CNDataclassActionDefinition createSyncDataStore];
    v14 = v8;
    v9 = +[NSArray arrayWithObjects:&v14 count:1];
  }
  else
  {
    if (v7) {
      sub_996C();
    }

    id v8 = +[CNDataclassActionDefinition createSyncDataStoreKeepLocalData];
    v13[0] = v8;
    v10 = +[CNDataclassActionDefinition createSyncDataStoreDeleteLocalData];
    v13[1] = v10;
    v11 = +[CNDataclassActionDefinition cancel];
    v13[2] = v11;
    v9 = +[NSArray arrayWithObjects:v13 count:3];
  }
  return v9;
}

- (id)actionsForDeletingAccount:(id)a3 forDataclass:(id)a4
{
  id v5 = a3;
  if (+[CNACAccountTypeAnalyzer isAccountAppleAccount:v5])
  {
    uint64_t v6 = [(CNContactsDataclassOwner *)self actionsForDeletingAppleAccount:v5];
LABEL_5:
    BOOL v7 = (void *)v6;
    goto LABEL_7;
  }
  if (+[CNACAccountTypeAnalyzer isAccountGenericContactsSyncingAccount:v5])
  {
    uint64_t v6 = [(CNContactsDataclassOwner *)self actionsForDeletingGenericAccount:v5];
    goto LABEL_5;
  }
  BOOL v7 = 0;
LABEL_7:

  return v7;
}

- (id)actionsForDeletingAppleAccount:(id)a3
{
  id v4 = a3;
  if (+[CNACAccountTypeAnalyzer isiCloudSignoutRestrictionEnabled])
  {
    id v5 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_99D4();
    }

    uint64_t v6 = +[CNDataclassActionDefinition cancelDueToRestrictions];
    v17 = v6;
    BOOL v7 = &v17;
LABEL_9:
    v11 = +[NSArray arrayWithObjects:v7 count:1];
    goto LABEL_13;
  }
  unsigned int v8 = [(CNContactsDataclassOwner *)self areSourcesEmptyForAccount:v4];
  v9 = [(id)objc_opt_class() log];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v10) {
      sub_9A3C();
    }

    uint64_t v6 = +[CNDataclassActionDefinition deleteSyncData];
    v16 = v6;
    BOOL v7 = &v16;
    goto LABEL_9;
  }
  if (v10) {
    sub_9AA4();
  }

  uint64_t v6 = +[CNDataclassActionDefinition deleteSyncData];
  v12 = +[CNDataclassActionDefinition mergeSyncDataIntoLocalData];
  v15[1] = v12;
  objc_super v13 = +[CNDataclassActionDefinition cancel];
  v15[2] = v13;
  v11 = +[NSArray arrayWithObjects:v15 count:3];

LABEL_13:
  return v11;
}

- (id)actionsForDeletingGenericAccount:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_9B0C();
  }

  id v5 = +[CNDataclassActionDefinition deleteSyncData];
  v9[0] = v5;
  uint64_t v6 = +[CNDataclassActionDefinition cancel];
  v9[1] = v6;
  BOOL v7 = +[NSArray arrayWithObjects:v9 count:2];

  return v7;
}

- (id)actionsForDisablingDataclassOnAccount:(id)a3 forDataclass:(id)a4
{
  id v5 = a3;
  if (+[CNACAccountTypeAnalyzer isAccountAppleAccount:v5])
  {
    uint64_t v6 = [(CNContactsDataclassOwner *)self actionsForDisablingDataclassOnAppleAccount:v5];
LABEL_5:
    BOOL v7 = (void *)v6;
    goto LABEL_7;
  }
  if (+[CNACAccountTypeAnalyzer isAccountPopularContactsSyncingAccount:v5])
  {
    uint64_t v6 = [(CNContactsDataclassOwner *)self actionsForDisablingDataclassOnGenericAccount:v5];
    goto LABEL_5;
  }
  BOOL v7 = 0;
LABEL_7:

  return v7;
}

- (id)actionsForDisablingDataclassOnAppleAccount:(id)a3
{
  id v4 = a3;
  if (+[CNACAccountTypeAnalyzer isiCloudSignoutRestrictionEnabled])
  {
    id v5 = +[CNDataclassActionDefinition cancelDueToRestrictions];
    v15 = v5;
    uint64_t v6 = (uint64_t *)&v15;
LABEL_5:
    v9 = +[NSArray arrayWithObjects:v6 count:1];
    goto LABEL_7;
  }
  unsigned int v7 = [(CNContactsDataclassOwner *)self areSourcesEmptyForAccount:v4];
  uint64_t v8 = +[CNDataclassActionDefinition deleteSyncData];
  id v5 = (void *)v8;
  if (v7)
  {
    uint64_t v14 = v8;
    uint64_t v6 = &v14;
    goto LABEL_5;
  }
  BOOL v10 = +[CNDataclassActionDefinition mergeSyncDataIntoLocalData];
  v13[1] = v10;
  v11 = +[CNDataclassActionDefinition cancel];
  v13[2] = v11;
  v9 = +[NSArray arrayWithObjects:v13 count:3];

LABEL_7:
  return v9;
}

- (id)actionsForDisablingDataclassOnGenericAccount:(id)a3
{
  id v3 = +[CNDataclassActionDefinition deleteSyncData];
  v7[0] = v3;
  id v4 = +[CNDataclassActionDefinition cancel];
  v7[1] = v4;
  id v5 = +[NSArray arrayWithObjects:v7 count:2];

  return v5;
}

- (BOOL)performAction:(id)a3 forAccount:(id)a4 withChildren:(id)a5 forDataclass:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = objc_alloc_init(CNDataclassActionParameters);
  [(CNDataclassActionParameters *)v12 setAction:v9];
  [(CNDataclassActionParameters *)v12 setAccount:v10];
  [(CNDataclassActionParameters *)v12 setChildAccounts:v11];

  objc_super v13 = [(CNContactsDataclassOwner *)self accountProvider];
  [(CNDataclassActionParameters *)v12 setAccountProvider:v13];

  uint64_t v14 = [(CNContactsDataclassOwner *)self implementation];
  [(CNDataclassActionParameters *)v12 setImplementation:v14];

  v15 = +[CNDataclassActionHandler actionHandlerSuitableForParameters:v12];
  v16 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 134218754;
    v20 = self;
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v10;
    __int16 v25 = 2112;
    v26 = v15;
    _os_log_debug_impl(&dword_0, v16, OS_LOG_TYPE_DEBUG, "%p - CNContactsDataclassOwner will performAction (%@) forAccount (%@) with handler (%@).", (uint8_t *)&v19, 0x2Au);
  }

  unsigned __int8 v17 = [v15 perform];
  return v17;
}

- (BOOL)isLocalSourceEmpty
{
  v2 = [(CNContactsDataclassOwner *)self implementation];
  unsigned __int8 v3 = [v2 isLocalContainerEmpty];

  return v3;
}

- (BOOL)areSourcesEmptyForAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactsDataclassOwner *)self implementation];
  unsigned __int8 v6 = [v5 areContainersEmptyForParentAccount:v4];

  return v6;
}

- (CNACAccountProvider)accountProvider
{
  return self->_accountProvider;
}

- (CNContactsDataclassOwnerImplementation)implementation
{
  return self->_implementation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_implementation, 0);
  objc_storeStrong((id *)&self->_accountProvider, 0);
}

@end