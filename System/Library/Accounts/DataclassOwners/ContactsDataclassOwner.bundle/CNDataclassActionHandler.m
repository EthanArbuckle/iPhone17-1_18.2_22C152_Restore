@interface CNDataclassActionHandler
+ (OS_os_log)os_log;
+ (id)actionHandlerSuitableForParameters:(id)a3;
+ (id)appleAccountActionHandlerWithParameters:(id)a3;
+ (id)delegatesFromAccounts:(id)a3;
+ (id)genericAccountActionHandlerWithParameters:(id)a3;
- (ACAccount)account;
- (BOOL)createContactsAccountForACAccount:(id)a3 withChildren:(id)a4;
- (BOOL)drainLocalStore;
- (BOOL)mergeContactsFromLocalSourceIntoSource:(id)a3;
- (BOOL)mergeContactsIntoLocalSourceFromABAccount:(id)a3;
- (BOOL)perform;
- (BOOL)removeContactsAccount:(id)a3;
- (BOOL)removeContactsAccountForACAccount:(id)a3 withChildren:(id)a4;
- (CNACAccountProvider)accountProvider;
- (CNContactsDataclassOwnerImplementation)implementation;
- (CNDataclassActionHandler)initWithParameters:(id)a3;
- (NSArray)childAccounts;
- (id)copyABAccountForACAccount:(id)a3 withChildren:(id)a4;
- (id)copyDefaultAddressBookSourceForAccount:(id)a3 withChildren:(id)a4 createIfNecessary:(BOOL)a5;
- (void)disableLocalSourceIfNeededAddingAccount:(id)a3;
- (void)enableLocalSourceIfNecessaryIgnoringAccount:(id)a3;
- (void)setLocalSourceEnabled:(BOOL)a3;
- (void)setSourceEnabled:(BOOL)a3 forAccount:(id)a4 withChildren:(id)a5;
@end

@implementation CNDataclassActionHandler

+ (OS_os_log)os_log
{
  if (qword_15CA0 != -1) {
    dispatch_once(&qword_15CA0, &stru_10328);
  }
  v2 = (void *)qword_15CA8;
  return (OS_os_log *)v2;
}

+ (id)actionHandlerSuitableForParameters:(id)a3
{
  id v4 = a3;
  v5 = [v4 account];
  unsigned int v6 = +[CNACAccountTypeAnalyzer isAccountAppleAccount:v5];

  if (v6)
  {
    uint64_t v7 = [a1 appleAccountActionHandlerWithParameters:v4];
LABEL_5:
    v10 = (void *)v7;
    goto LABEL_7;
  }
  v8 = [v4 account];
  unsigned int v9 = +[CNACAccountTypeAnalyzer isAccountGenericContactsSyncingOrDirectoryAccount:v8];

  if (v9)
  {
    uint64_t v7 = [a1 genericAccountActionHandlerWithParameters:v4];
    goto LABEL_5;
  }
  v10 = 0;
LABEL_7:

  return v10;
}

+ (id)appleAccountActionHandlerWithParameters:(id)a3
{
  id v3 = a3;
  id v4 = [v3 action];
  v5 = +[CNDataclassActionDefinition createSyncDataStore];
  unsigned __int8 v6 = [v4 isEqual:v5];

  if (v6)
  {
    uint64_t v7 = off_10230;
LABEL_9:
    id v17 = [objc_alloc(*v7) initWithParameters:v3];
    goto LABEL_10;
  }
  v8 = [v3 action];
  unsigned int v9 = +[CNDataclassActionDefinition mergeLocalDataIntoSyncData];
  unsigned __int8 v10 = [v8 isEqual:v9];

  if (v10)
  {
    uint64_t v7 = off_10240;
    goto LABEL_9;
  }
  v11 = [v3 action];
  v12 = +[CNDataclassActionDefinition mergeSyncDataIntoLocalData];
  unsigned __int8 v13 = [v11 isEqual:v12];

  if (v13)
  {
    uint64_t v7 = &off_10248;
    goto LABEL_9;
  }
  v14 = [v3 action];
  v15 = +[CNDataclassActionDefinition deleteSyncData];
  unsigned int v16 = [v14 isEqual:v15];

  if (v16)
  {
    uint64_t v7 = off_10238;
    goto LABEL_9;
  }
  id v17 = 0;
LABEL_10:

  return v17;
}

+ (id)genericAccountActionHandlerWithParameters:(id)a3
{
  id v3 = a3;
  id v4 = [v3 action];
  v5 = +[CNDataclassActionDefinition createSyncDataStore];
  unsigned __int8 v6 = [v4 isEqual:v5];

  if (v6)
  {
    uint64_t v7 = off_10278;
LABEL_9:
    id v17 = [objc_alloc(*v7) initWithParameters:v3];
    goto LABEL_10;
  }
  v8 = [v3 action];
  unsigned int v9 = +[CNDataclassActionDefinition createSyncDataStoreDeleteLocalData];
  unsigned __int8 v10 = [v8 isEqual:v9];

  if (v10)
  {
    uint64_t v7 = off_10280;
    goto LABEL_9;
  }
  v11 = [v3 action];
  v12 = +[CNDataclassActionDefinition createSyncDataStoreKeepLocalData];
  unsigned __int8 v13 = [v11 isEqual:v12];

  if (v13)
  {
    uint64_t v7 = off_10288;
    goto LABEL_9;
  }
  v14 = [v3 action];
  v15 = +[CNDataclassActionDefinition deleteSyncData];
  unsigned int v16 = [v14 isEqual:v15];

  if (v16)
  {
    uint64_t v7 = &off_10290;
    goto LABEL_9;
  }
  id v17 = 0;
LABEL_10:

  return v17;
}

- (CNDataclassActionHandler)initWithParameters:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CNDataclassActionHandler;
  v5 = [(CNDataclassActionHandler *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 account];
    account = v5->_account;
    v5->_account = (ACAccount *)v6;

    uint64_t v8 = [v4 childAccounts];
    childAccounts = v5->_childAccounts;
    v5->_childAccounts = (NSArray *)v8;

    uint64_t v10 = [v4 accountProvider];
    accountProvider = v5->_accountProvider;
    v5->_accountProvider = (CNACAccountProvider *)v10;

    uint64_t v12 = [v4 implementation];
    implementation = v5->_implementation;
    v5->_implementation = (CNContactsDataclassOwnerImplementation *)v12;

    v14 = v5;
  }

  return v5;
}

- (BOOL)perform
{
  v2 = self;
  CNAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (BOOL)createContactsAccountForACAccount:(id)a3 withChildren:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CNDataclassActionHandler *)self implementation];
  unsigned __int8 v9 = [v8 createContactsAccountForParentAccount:v7 withChildAccounts:v6];

  return v9;
}

- (BOOL)removeContactsAccountForACAccount:(id)a3 withChildren:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CNDataclassActionHandler *)self implementation];
  unsigned __int8 v9 = [(id)objc_opt_class() delegatesFromAccounts:v6];
  unsigned __int8 v10 = [v8 removeContactsAccountForParentAccount:v7 delegates:v9 withChildAccounts:v6];

  return v10;
}

+ (id)delegatesFromAccounts:(id)a3
{
  id v3 = objc_msgSend(a3, "_cn_filter:", &stru_10368);
  id v4 = objc_msgSend(v3, "_cn_flatMap:", &stru_103A8);
  v5 = objc_msgSend(v4, "_cn_map:", &stru_103E8);

  return v5;
}

- (BOOL)drainLocalStore
{
  v2 = [(CNDataclassActionHandler *)self implementation];
  unsigned __int8 v3 = [v2 emptyLocalContainer];

  return v3;
}

- (BOOL)mergeContactsFromLocalSourceIntoSource:(id)a3
{
  id v4 = a3;
  v5 = [(CNDataclassActionHandler *)self implementation];
  unsigned __int8 v6 = [v5 mergeContactsFromLocalContainerToContainer:v4];

  return v6;
}

- (BOOL)mergeContactsIntoLocalSourceFromABAccount:(id)a3
{
  id v4 = a3;
  v5 = [(CNDataclassActionHandler *)self implementation];
  unsigned __int8 v6 = [v5 mergeContactsIntoLocalContainerFromContainersOfContactsAccount:v4];

  return v6;
}

- (BOOL)removeContactsAccount:(id)a3
{
  id v4 = a3;
  v5 = [(CNDataclassActionHandler *)self implementation];
  unsigned __int8 v6 = [v5 removeContactsAccount:v4];

  return v6;
}

- (id)copyABAccountForACAccount:(id)a3 withChildren:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CNDataclassActionHandler *)self implementation];
  unsigned __int8 v9 = [v8 contactsAccountForParentAccount:v7 withChildAccounts:v6];

  return v9;
}

- (id)copyDefaultAddressBookSourceForAccount:(id)a3 withChildren:(id)a4 createIfNecessary:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  unsigned __int8 v10 = [(CNDataclassActionHandler *)self implementation];
  v11 = [v10 defaultContainerForParentAccount:v9 withChildAccounts:v8 createIfNecessary:v5];

  return v11;
}

- (void)disableLocalSourceIfNeededAddingAccount:(id)a3
{
  if (([a3 MCIsManaged] & 1) == 0)
  {
    id v4 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "It is necessary to disable the Contacts local container", v5, 2u);
    }

    [(CNDataclassActionHandler *)self setLocalSourceEnabled:0];
  }
}

- (void)setLocalSourceEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CNDataclassActionHandler *)self implementation];
  [v4 setLocalContainerEnabled:v3];
}

- (void)setSourceEnabled:(BOOL)a3 forAccount:(id)a4 withChildren:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [(CNDataclassActionHandler *)self implementation];
  [v10 setContainersEnabled:v6 forParentAccount:v9 withChildAccounts:v8];
}

- (void)enableLocalSourceIfNecessaryIgnoringAccount:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNDataclassActionHandler *)self accountProvider];
  unsigned __int8 v6 = [v5 isAnyAccountSyncableIgnoringAccount:v4];

  if ((v6 & 1) == 0)
  {
    id v7 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "It is necessary to enable the Contacts local container", v8, 2u);
    }

    [(CNDataclassActionHandler *)self setLocalSourceEnabled:1];
  }
}

- (CNContactsDataclassOwnerImplementation)implementation
{
  return self->_implementation;
}

- (CNACAccountProvider)accountProvider
{
  return self->_accountProvider;
}

- (ACAccount)account
{
  return self->_account;
}

- (NSArray)childAccounts
{
  return self->_childAccounts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childAccounts, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_accountProvider, 0);
  objc_storeStrong((id *)&self->_implementation, 0);
}

@end