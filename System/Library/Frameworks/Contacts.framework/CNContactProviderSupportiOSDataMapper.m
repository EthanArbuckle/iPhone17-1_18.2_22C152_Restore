@interface CNContactProviderSupportiOSDataMapper
+ (id)os_log;
- (BOOL)executeSaveRequest:(id)a3 error:(id *)a4;
- (BOOL)executeSaveRequest:(id)a3 response:(id *)a4 authorizationContext:(id)a5 error:(id *)a6;
- (BOOL)fetchContactsForFetchRequest:(id)a3 error:(id *)a4 batchHandler:(id)a5;
- (BOOL)fetchEncodedContactsForFetchRequest:(id)a3 error:(id *)a4 cancelationToken:(id)a5 batchHandler:(id)a6;
- (BOOL)requestAccessForEntityType:(int64_t)a3 error:(id *)a4;
- (BOOL)shouldLogContactsAccess;
- (CNContactProviderSupportiOSDataMapper)initWithConfiguration:(id)a3;
- (CNContactProviderSupportiOSDataMapper)initWithConfiguration:(id)a3 addressBook:(id)a4;
- (id)accountsMatchingPredicate:(id)a3 error:(id *)a4;
- (id)authorizedKeysForContactKeys:(id)a3 error:(id *)a4;
- (id)contactCountForFetchRequest:(id)a3 error:(id *)a4;
- (id)contactObservableForFetchRequest:(id)a3;
- (id)containersMatchingPredicate:(id)a3 error:(id *)a4;
- (id)currentHistoryAnchor;
- (id)defaultContainerIdentifier;
- (id)defaultContainerIdentifierImpl;
- (id)encodedContactsCursorForFetchRequest:(id)a3 cursorCleanupBlock:(id)a4 error:(id *)a5;
- (id)groupsMatchingPredicate:(id)a3 error:(id *)a4;
- (id)meContactIdentifiers:(id *)a3;
- (id)policyForContainerWithIdentifier:(id)a3 error:(id *)a4;
- (id)policyWithDescription:(id)a3 error:(id *)a4;
- (id)serverSearchContainersMatchingPredicate:(id)a3 error:(id *)a4;
- (id)subgroupsOfGroupWithIdentifier:(id)a3 error:(id *)a4;
- (void)requestAccessForEntityType:(int64_t)a3 completionHandler:(id)a4;
- (void)updateManagedConfiguration;
@end

@implementation CNContactProviderSupportiOSDataMapper

+ (id)os_log
{
  self;
  if (os_log_cn_once_token_0_21 != -1) {
    dispatch_once(&os_log_cn_once_token_0_21, &__block_literal_global_131);
  }
  v0 = (void *)os_log_cn_once_object_0_21;

  return v0;
}

uint64_t __47__CNContactProviderSupportiOSDataMapper_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts.provider", "CNContactProviderSupportiOSDataMapper");
  uint64_t v1 = os_log_cn_once_object_0_21;
  os_log_cn_once_object_0_21 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (CNContactProviderSupportiOSDataMapper)initWithConfiguration:(id)a3
{
  return [(CNContactProviderSupportiOSDataMapper *)self initWithConfiguration:a3 addressBook:0];
}

- (CNContactProviderSupportiOSDataMapper)initWithConfiguration:(id)a3 addressBook:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CNContactProviderSupportiOSDataMapper;
  v8 = [(CNContactProviderSupportiOSDataMapper *)&v17 init];
  if (v8)
  {
    v9 = [[CNiOSAddressBookDataMapper alloc] initWithConfiguration:v6 addressBook:v7];
    dataMapper = v8->_dataMapper;
    v8->_dataMapper = v9;

    uint64_t v11 = [v6 contactProviderManager];
    contactProviderManager = v8->_contactProviderManager;
    v8->_contactProviderManager = (CNContactProviderSupportManager *)v11;

    uint64_t v13 = [v6 managedConfiguration];
    managedConfiguration = v8->_managedConfiguration;
    v8->_managedConfiguration = (CNManagedConfiguration *)v13;

    v15 = v8;
  }

  return v8;
}

- (void)updateManagedConfiguration
{
  if (a1)
  {
    v2 = [*(id *)(a1 + 16) providerContainer];
    id v4 = v2;
    if (v2)
    {
      v3 = [v2 identifier];
    }
    else
    {
      v3 = @"Extension not enabled";
    }
    [*(id *)(a1 + 24) setProviderContainerIdentifier:v3];
  }
}

- (BOOL)shouldLogContactsAccess
{
  return 0;
}

- (void)requestAccessForEntityType:(int64_t)a3 completionHandler:(id)a4
{
}

- (BOOL)requestAccessForEntityType:(int64_t)a3 error:(id *)a4
{
  return 1;
}

- (id)contactObservableForFetchRequest:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = +[CNContactProviderSupportiOSDataMapper os_log]();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1909E3000, v5, OS_LOG_TYPE_INFO, "Calling contactObservableForFetchRequest:", v9, 2u);
  }

  -[CNContactProviderSupportiOSDataMapper updateManagedConfiguration]((uint64_t)self);
  if (self) {
    dataMapper = self->_dataMapper;
  }
  else {
    dataMapper = 0;
  }
  id v7 = [(CNiOSAddressBookDataMapper *)dataMapper contactObservableForFetchRequest:v4];

  return v7;
}

- (id)containersMatchingPredicate:(id)a3 error:(id *)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  v5 = +[CNContactProviderSupportiOSDataMapper os_log]();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_1909E3000, v5, OS_LOG_TYPE_INFO, "Overriding containersMatchingPredicate:error:, returning provider container", v11, 2u);
  }

  if (self) {
    contactProviderManager = self->_contactProviderManager;
  }
  else {
    contactProviderManager = 0;
  }
  id v7 = contactProviderManager;
  v8 = [(CNContactProviderSupportManager *)v7 providerContainer];

  if (v8)
  {
    v12[0] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

- (id)defaultContainerIdentifier
{
  objc_opt_class();
  v2 = +[CNContactProviderSupportiOSDataMapper os_log]();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1909E3000, v2, OS_LOG_TYPE_INFO, "Overriding defaultContainerIdentifier, returning provider container identifier", buf, 2u);
  }

  v3 = cn_objectResultWithObjectLock();

  return v3;
}

id __67__CNContactProviderSupportiOSDataMapper_defaultContainerIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  if (!v3)
  {
    uint64_t v4 = -[CNContactProviderSupportiOSDataMapper defaultContainerIdentifierImpl](v2);
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v4;

    v3 = *(void **)(*(void *)(a1 + 32) + 32);
  }

  return v3;
}

- (id)defaultContainerIdentifierImpl
{
  if (a1)
  {
    uint64_t v1 = [*(id *)(a1 + 16) providerContainer];
    uint64_t v2 = [v1 identifier];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (BOOL)executeSaveRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  id v7 = +[CNContactProviderSupportiOSDataMapper os_log]();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_1909E3000, v7, OS_LOG_TYPE_INFO, "Calling executeSaveRequest:error:", v11, 2u);
  }

  if (self) {
    dataMapper = self->_dataMapper;
  }
  else {
    dataMapper = 0;
  }
  BOOL v9 = [(CNiOSAddressBookDataMapper *)dataMapper executeSaveRequest:v6 error:a4];

  return v9;
}

- (BOOL)executeSaveRequest:(id)a3 response:(id *)a4 authorizationContext:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a3;
  objc_opt_class();
  v12 = +[CNContactProviderSupportiOSDataMapper os_log]();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_1909E3000, v12, OS_LOG_TYPE_INFO, "Calling executeSaveRequest:response:context:error:", v16, 2u);
  }

  if (self) {
    dataMapper = self->_dataMapper;
  }
  else {
    dataMapper = 0;
  }
  BOOL v14 = [(CNiOSAddressBookDataMapper *)dataMapper executeSaveRequest:v11 response:a4 authorizationContext:v10 error:a6];

  return v14;
}

- (id)groupsMatchingPredicate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  id v7 = +[CNContactProviderSupportiOSDataMapper os_log]();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_1909E3000, v7, OS_LOG_TYPE_INFO, "Calling groupsMatchingPredicate:error:", v11, 2u);
  }

  -[CNContactProviderSupportiOSDataMapper updateManagedConfiguration]((uint64_t)self);
  if (self) {
    dataMapper = self->_dataMapper;
  }
  else {
    dataMapper = 0;
  }
  BOOL v9 = [(CNiOSAddressBookDataMapper *)dataMapper groupsMatchingPredicate:v6 error:a4];

  return v9;
}

- (id)policyForContainerWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  id v7 = +[CNContactProviderSupportiOSDataMapper os_log]();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_1909E3000, v7, OS_LOG_TYPE_INFO, "Calling policyForContainerWithIdentifier:error:", v11, 2u);
  }

  if (self) {
    dataMapper = self->_dataMapper;
  }
  else {
    dataMapper = 0;
  }
  BOOL v9 = [(CNiOSAddressBookDataMapper *)dataMapper policyForContainerWithIdentifier:v6 error:a4];

  return v9;
}

- (id)policyWithDescription:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  id v7 = +[CNContactProviderSupportiOSDataMapper os_log]();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_1909E3000, v7, OS_LOG_TYPE_INFO, "Calling policyWithDescription:error:", v11, 2u);
  }

  if (self) {
    dataMapper = self->_dataMapper;
  }
  else {
    dataMapper = 0;
  }
  BOOL v9 = [(CNiOSAddressBookDataMapper *)dataMapper policyWithDescription:v6 error:a4];

  return v9;
}

- (id)encodedContactsCursorForFetchRequest:(id)a3 cursorCleanupBlock:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  objc_opt_class();
  id v10 = +[CNContactProviderSupportiOSDataMapper os_log]();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v14 = 0;
    _os_log_impl(&dword_1909E3000, v10, OS_LOG_TYPE_INFO, "Calling encodedContactsCursorForFetchRequest:cursorCleanupBlock:error:", v14, 2u);
  }

  -[CNContactProviderSupportiOSDataMapper updateManagedConfiguration]((uint64_t)self);
  if (self) {
    dataMapper = self->_dataMapper;
  }
  else {
    dataMapper = 0;
  }
  v12 = [(CNiOSAddressBookDataMapper *)dataMapper encodedContactsCursorForFetchRequest:v9 cursorCleanupBlock:v8 error:a5];

  return v12;
}

- (BOOL)fetchContactsForFetchRequest:(id)a3 error:(id *)a4 batchHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  objc_opt_class();
  id v10 = +[CNContactProviderSupportiOSDataMapper os_log]();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v14 = 0;
    _os_log_impl(&dword_1909E3000, v10, OS_LOG_TYPE_INFO, "Calling encodedContactsCursorForFetchRequest:error:batchHandler:", v14, 2u);
  }

  -[CNContactProviderSupportiOSDataMapper updateManagedConfiguration]((uint64_t)self);
  if (self) {
    dataMapper = self->_dataMapper;
  }
  else {
    dataMapper = 0;
  }
  BOOL v12 = [(CNiOSAddressBookDataMapper *)dataMapper fetchContactsForFetchRequest:v9 error:a4 batchHandler:v8];

  return v12;
}

- (BOOL)fetchEncodedContactsForFetchRequest:(id)a3 error:(id *)a4 cancelationToken:(id)a5 batchHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  -[CNContactProviderSupportiOSDataMapper updateManagedConfiguration]((uint64_t)self);
  objc_opt_class();
  uint64_t v13 = +[CNContactProviderSupportiOSDataMapper os_log]();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v17 = 0;
    _os_log_impl(&dword_1909E3000, v13, OS_LOG_TYPE_INFO, "Calling encodedContactsCursorForFetchRequest:error:cancelationToken:batchHandler:", v17, 2u);
  }

  if (self) {
    dataMapper = self->_dataMapper;
  }
  else {
    dataMapper = 0;
  }
  BOOL v15 = [(CNiOSAddressBookDataMapper *)dataMapper fetchEncodedContactsForFetchRequest:v12 error:a4 cancelationToken:v11 batchHandler:v10];

  return v15;
}

- (id)currentHistoryAnchor
{
  objc_opt_class();
  v3 = +[CNContactProviderSupportiOSDataMapper os_log]();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1909E3000, v3, OS_LOG_TYPE_INFO, "Calling currentHistoryAnchor", v7, 2u);
  }

  if (self) {
    dataMapper = self->_dataMapper;
  }
  else {
    dataMapper = 0;
  }
  uint64_t v5 = [(CNiOSAddressBookDataMapper *)dataMapper currentHistoryAnchor];

  return v5;
}

- (id)authorizedKeysForContactKeys:(id)a3 error:(id *)a4
{
  objc_opt_class();
  uint64_t v4 = +[CNContactProviderSupportiOSDataMapper os_log]();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[CNContactProviderSupportiOSDataMapper authorizedKeysForContactKeys:error:]();
  }

  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)accountsMatchingPredicate:(id)a3 error:(id *)a4
{
  objc_opt_class();
  uint64_t v4 = +[CNContactProviderSupportiOSDataMapper os_log]();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[CNContactProviderSupportiOSDataMapper accountsMatchingPredicate:error:]();
  }

  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)serverSearchContainersMatchingPredicate:(id)a3 error:(id *)a4
{
  objc_opt_class();
  uint64_t v4 = +[CNContactProviderSupportiOSDataMapper os_log]();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[CNContactProviderSupportiOSDataMapper serverSearchContainersMatchingPredicate:error:]();
  }

  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)subgroupsOfGroupWithIdentifier:(id)a3 error:(id *)a4
{
  objc_opt_class();
  uint64_t v4 = +[CNContactProviderSupportiOSDataMapper os_log]();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[CNContactProviderSupportiOSDataMapper subgroupsOfGroupWithIdentifier:error:]();
  }

  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)contactCountForFetchRequest:(id)a3 error:(id *)a4
{
  objc_opt_class();
  uint64_t v4 = +[CNContactProviderSupportiOSDataMapper os_log]();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[CNContactProviderSupportiOSDataMapper contactCountForFetchRequest:error:]();
  }

  return &unk_1EE089470;
}

- (id)meContactIdentifiers:(id *)a3
{
  objc_opt_class();
  v3 = +[CNContactProviderSupportiOSDataMapper os_log]();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[CNContactProviderSupportiOSDataMapper meContactIdentifiers:]();
  }

  return (id)MEMORY[0x1E4F1CBF0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedContainerIdentifier, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_contactProviderManager, 0);

  objc_storeStrong((id *)&self->_dataMapper, 0);
}

- (void)authorizedKeysForContactKeys:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1909E3000, v0, v1, "Unexpected usage of authorizedKeysForContactKeys:error:", v2, v3, v4, v5, v6);
}

- (void)accountsMatchingPredicate:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1909E3000, v0, v1, "Unexpected usage of accountsMatchingPredicate:error:", v2, v3, v4, v5, v6);
}

- (void)serverSearchContainersMatchingPredicate:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1909E3000, v0, v1, "Unexpected usage of serverSearchContainersMatchingPredicate:error:", v2, v3, v4, v5, v6);
}

- (void)subgroupsOfGroupWithIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1909E3000, v0, v1, "Unexpected usage of subgroupsOfGroupWithIdentifier:error:", v2, v3, v4, v5, v6);
}

- (void)contactCountForFetchRequest:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1909E3000, v0, v1, "Unexpected usage of contactCountForFetchRequest:error:", v2, v3, v4, v5, v6);
}

- (void)meContactIdentifiers:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1909E3000, v0, v1, "Unexpected usage of meContactIdentifiers:", v2, v3, v4, v5, v6);
}

@end