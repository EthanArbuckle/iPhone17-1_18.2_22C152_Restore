@interface NCCNDataclassActionHandler
+ (OS_os_log)os_log;
- (ACAccount)account;
- (BOOL)createABAccountForACAccount:(id)a3 withChildren:(id)a4;
- (BOOL)mergeContactsFromLocalSourceIntoSource:(id)a3;
- (BOOL)perform;
- (NCCNContactsDataclassOwnerImplementation)implementation;
- (NCCNDataclassActionHandler)initWithParameters:(id)a3;
- (NSArray)childAccounts;
- (id)copyDefaultAddressBookSourceForAccount:(id)a3 withChildren:(id)a4 createIfNecessary:(BOOL)a5;
- (void)disableLocalSourceIfNeededAddingAccount:(id)a3;
- (void)setLocalSourceEnabled:(BOOL)a3;
@end

@implementation NCCNDataclassActionHandler

+ (OS_os_log)os_log
{
  if (qword_23DF8 != -1) {
    dispatch_once(&qword_23DF8, &stru_1C450);
  }
  v2 = (void *)qword_23E00;

  return (OS_os_log *)v2;
}

- (NCCNDataclassActionHandler)initWithParameters:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NCCNDataclassActionHandler;
  v5 = [(NCCNDataclassActionHandler *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 account];
    account = v5->_account;
    v5->_account = (ACAccount *)v6;

    uint64_t v8 = [v4 childAccounts];
    childAccounts = v5->_childAccounts;
    v5->_childAccounts = (NSArray *)v8;

    uint64_t v10 = [v4 implementation];
    implementation = v5->_implementation;
    v5->_implementation = (NCCNContactsDataclassOwnerImplementation *)v10;

    v12 = v5;
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

- (BOOL)createABAccountForACAccount:(id)a3 withChildren:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(NCCNDataclassActionHandler *)self implementation];
  unsigned __int8 v9 = [v8 createContactsAccountForParentAccount:v7 withChildAccounts:v6];

  return v9;
}

- (BOOL)mergeContactsFromLocalSourceIntoSource:(id)a3
{
  id v4 = a3;
  v5 = [(NCCNDataclassActionHandler *)self implementation];
  unsigned __int8 v6 = [v5 mergeContactsFromLocalContainerToContainer:v4];

  return v6;
}

- (id)copyDefaultAddressBookSourceForAccount:(id)a3 withChildren:(id)a4 createIfNecessary:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(NCCNDataclassActionHandler *)self implementation];
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
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "It is necessary to disable the AB local source", v5, 2u);
    }

    [(NCCNDataclassActionHandler *)self setLocalSourceEnabled:0];
  }
}

- (void)setLocalSourceEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NCCNDataclassActionHandler *)self implementation];
  [v4 setLocalContainerEnabled:v3];
}

- (NCCNContactsDataclassOwnerImplementation)implementation
{
  return self->_implementation;
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

  objc_storeStrong((id *)&self->_implementation, 0);
}

@end