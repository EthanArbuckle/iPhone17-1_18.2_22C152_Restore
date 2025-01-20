@interface CNFamilyCircleConfigurationUpdateTask
+ (id)os_log;
- (ACAccountStore)accountStore;
- (CNDelegateAccountSink)accountSink;
- (CNDelegateAccountSource)accountSource;
- (CNFamilyCircleConfigurationUpdateTask)init;
- (CNFamilyCircleConfigurationUpdateTask)initWithAccountSource:(id)a3 accountSink:(id)a4 accountStore:(id)a5;
- (CNFamilyCircleConfigurationUpdateTask)initWithName:(id)a3;
- (CNResult)result;
- (NSArray)delegateAccounts;
- (id)description;
- (id)run:(id *)a3;
- (void)loadDefaultSinkIfNecessary;
- (void)loadDefaultSourceIfNecessary;
- (void)loadDelegateAccountsFromSource;
- (void)setResult:(id)a3;
- (void)updateDelegateAccounts;
@end

@implementation CNFamilyCircleConfigurationUpdateTask

+ (id)os_log
{
  if (os_log_cn_once_token_1_7 != -1) {
    dispatch_once(&os_log_cn_once_token_1_7, &__block_literal_global_37);
  }
  v2 = (void *)os_log_cn_once_object_1_7;

  return v2;
}

uint64_t __47__CNFamilyCircleConfigurationUpdateTask_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts", "family-circle-config-update-task");
  uint64_t v1 = os_log_cn_once_object_1_7;
  os_log_cn_once_object_1_7 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (CNFamilyCircleConfigurationUpdateTask)init
{
  v3 = [MEMORY[0x1E4F179C8] defaultStore];
  v4 = [(CNFamilyCircleConfigurationUpdateTask *)self initWithAccountSource:0 accountSink:0 accountStore:v3];

  return v4;
}

- (CNFamilyCircleConfigurationUpdateTask)initWithName:(id)a3
{
  v3 = [(CNFamilyCircleConfigurationUpdateTask *)self init];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (CNFamilyCircleConfigurationUpdateTask)initWithAccountSource:(id)a3 accountSink:(id)a4 accountStore:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CNFamilyCircleConfigurationUpdateTask;
  v12 = [(CNTask *)&v20 initWithName:@"CNFamilyCircleConfigurationUpdateTask"];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accountSource, a3);
    objc_storeStrong((id *)&v13->_accountSink, a4);
    objc_storeStrong((id *)&v13->_accountStore, a5);
    delegateAccounts = v13->_delegateAccounts;
    v13->_delegateAccounts = 0;

    v15 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v16 = +[CNResult successWithValue:v15];
    v17 = v13->_result;
    v13->_result = (CNResult *)v16;

    v18 = v13;
  }

  return v13;
}

- (id)description
{
  v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"accountSource" object:self->_accountSource];
  id v5 = (id)[v3 appendName:@"accountSink" object:self->_accountSink];
  v6 = [v3 build];

  return v6;
}

- (id)run:(id *)a3
{
  [(CNFamilyCircleConfigurationUpdateTask *)self loadDefaultSourceIfNecessary];
  [(CNFamilyCircleConfigurationUpdateTask *)self loadDelegateAccountsFromSource];
  [(CNFamilyCircleConfigurationUpdateTask *)self loadDefaultSinkIfNecessary];
  [(CNFamilyCircleConfigurationUpdateTask *)self updateDelegateAccounts];
  id v5 = self->_result;
  v6 = [(CNResult *)v5 value];

  if (v6)
  {
    v7 = [(CNResult *)v5 value];
  }
  else
  {
    v8 = [(CNResult *)v5 error];
    id v9 = v8;
    if (a3) {
      *a3 = v8;
    }

    v7 = 0;
  }

  return v7;
}

- (void)loadDefaultSourceIfNecessary
{
  uint64_t v1 = [a1 userInfo];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1(&dword_19091D000, v2, v3, "Failed to fetch family circle: %@ %@", v4, v5, v6, v7, v8);
}

- (void)loadDelegateAccountsFromSource
{
  id v5 = [(CNDelegateAccountSource *)self->_accountSource delegateAccounts];
  uint64_t v3 = (NSArray *)[v5 copy];
  delegateAccounts = self->_delegateAccounts;
  self->_delegateAccounts = v3;
}

- (void)loadDefaultSinkIfNecessary
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 accountSource];
  uint64_t v4 = [v3 primaryAccount];
  id v5 = [v4 appleID];
  int v6 = 138412290;
  uint64_t v7 = v5;
  _os_log_error_impl(&dword_19091D000, a2, OS_LOG_TYPE_ERROR, "Parent CardDAV ACAccount not found for appleID: %@", (uint8_t *)&v6, 0xCu);
}

- (void)updateDelegateAccounts
{
  uint64_t v1 = [a1 userInfo];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1(&dword_19091D000, v2, v3, "Error updating family circle CardDAV ACAccounts: %@ %@", v4, v5, v6, v7, v8);
}

- (CNDelegateAccountSource)accountSource
{
  return self->_accountSource;
}

- (CNDelegateAccountSink)accountSink
{
  return self->_accountSink;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (NSArray)delegateAccounts
{
  return self->_delegateAccounts;
}

- (CNResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_delegateAccounts, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_accountSink, 0);

  objc_storeStrong((id *)&self->_accountSource, 0);
}

@end