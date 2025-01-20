@interface CNMAIDMapper
+ (id)os_log;
- (BOOL)executeSaveRequest:(id)a3 error:(id *)a4;
- (BOOL)executeSaveRequest:(id)a3 response:(id *)a4 authorizationContext:(id)a5 error:(id *)a6;
- (BOOL)requestAccessForEntityType:(int64_t)a3 error:(id *)a4;
- (BOOL)shouldLogContactsAccess;
- (CLSDataStore)dataStore;
- (CNMAIDMapper)init;
- (CNMAIDMapper)initWithConfiguration:(id)a3;
- (CNMAIDMapper)initWithDataStore:(id)a3 environment:(id)a4;
- (NSString)description;
- (id)accountsMatchingPredicate:(id)a3 error:(id *)a4;
- (id)authorizedKeysForContactKeys:(id)a3 error:(id *)a4;
- (id)contactCountForFetchRequest:(id)a3 error:(id *)a4;
- (id)contactObservableForFetchRequest:(id)a3;
- (id)containersMatchingPredicate:(id)a3 error:(id *)a4;
- (id)defaultContainerIdentifier;
- (id)groupsMatchingPredicate:(id)a3 error:(id *)a4;
- (id)meContactIdentifiers:(id *)a3;
- (id)policyForContainerWithIdentifier:(id)a3 error:(id *)a4;
- (id)policyWithDescription:(id)a3 error:(id *)a4;
- (id)serverSearchContainersMatchingPredicate:(id)a3 error:(id *)a4;
- (id)subgroupsOfGroupWithIdentifier:(id)a3 error:(id *)a4;
- (void)requestAccessForEntityType:(int64_t)a3 completionHandler:(id)a4;
@end

@implementation CNMAIDMapper

+ (id)os_log
{
  if (os_log_cn_once_token_0_10 != -1) {
    dispatch_once(&os_log_cn_once_token_0_10, &__block_literal_global_66);
  }
  v2 = (void *)os_log_cn_once_object_0_10;

  return v2;
}

uint64_t __22__CNMAIDMapper_os_log__block_invoke()
{
  os_log_cn_once_object_0_10 = (uint64_t)os_log_create("com.apple.contacts", "maid");

  return MEMORY[0x1F41817F8]();
}

- (CNMAIDMapper)init
{
  v3 = [MEMORY[0x1E4F19600] shared];
  v4 = +[CNContactsEnvironment currentEnvironment];
  v5 = [(CNMAIDMapper *)self initWithDataStore:v3 environment:v4];

  return v5;
}

- (CNMAIDMapper)initWithConfiguration:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F19600];
  id v5 = a3;
  v6 = [v4 shared];
  v7 = [v5 environment];

  v8 = [(CNMAIDMapper *)self initWithDataStore:v6 environment:v7];
  return v8;
}

- (CNMAIDMapper)initWithDataStore:(id)a3 environment:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNMAIDMapper;
  v7 = [(CNMAIDMapper *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_dataStore, a3);
    v9 = v8;
  }

  return v8;
}

- (NSString)description
{
  v2 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  v3 = [v2 build];

  return (NSString *)v3;
}

- (void)requestAccessForEntityType:(int64_t)a3 completionHandler:(id)a4
{
}

- (BOOL)requestAccessForEntityType:(int64_t)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)shouldLogContactsAccess
{
  return 0;
}

- (id)contactObservableForFetchRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(CNMAIDMapper *)self dataStore];

  if (v5)
  {
    id v6 = [v4 predicate];
    if ([v6 conformsToProtocol:&unk_1EE0960A0]) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    id v8 = v7;

    if (v8)
    {
      v9 = [(CNMAIDMapper *)self dataStore];
      v10 = [v8 contactsFromCLSDataStore:v9];

      if ([v10 isFailure])
      {
        objc_super v11 = [v10 error];
        v12 = objc_msgSend((id)objc_opt_class(), "os_log");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[CNMAIDMapper contactObservableForFetchRequest:]((uint64_t)v11, v12);
        }

        v13 = [MEMORY[0x1E4F5A480] emptyObservable];
      }
      else
      {
        objc_super v11 = [v10 value];
        v15 = objc_msgSend(v11, "_cn_filter:", &__block_literal_global_52);
        v16 = objc_msgSend(v15, "_cn_map:", &__block_literal_global_58);
        v13 = [MEMORY[0x1E4F5A480] observableWithResult:v16];
      }
    }
    else
    {
      v13 = [MEMORY[0x1E4F5A480] emptyObservable];
    }
  }
  else
  {
    v14 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CNMAIDMapper contactObservableForFetchRequest:](v14);
    }

    v13 = [MEMORY[0x1E4F5A480] emptyObservable];
  }

  return v13;
}

- (id)meContactIdentifiers:(id *)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)executeSaveRequest:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)executeSaveRequest:(id)a3 response:(id *)a4 authorizationContext:(id)a5 error:(id *)a6
{
  return 1;
}

- (id)containersMatchingPredicate:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)serverSearchContainersMatchingPredicate:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)policyForContainerWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_alloc_init(CNPolicyDescription);
  [(CNPolicyDescription *)v7 setContainerIdentifier:v6];

  id v8 = [(CNMAIDMapper *)self policyWithDescription:v7 error:a4];

  return v8;
}

- (id)policyWithDescription:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)accountsMatchingPredicate:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)groupsMatchingPredicate:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)subgroupsOfGroupWithIdentifier:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)defaultContainerIdentifier
{
  return 0;
}

- (id)authorizedKeysForContactKeys:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = self;
  CNUnimplementedMethodException();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (id)contactCountForFetchRequest:(id)a3 error:(id *)a4
{
  return &unk_1EE089350;
}

- (CLSDataStore)dataStore
{
  return self->_dataStore;
}

- (void).cxx_destruct
{
}

- (void)contactObservableForFetchRequest:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1909E3000, log, OS_LOG_TYPE_ERROR, "No MAID data store", v1, 2u);
}

- (void)contactObservableForFetchRequest:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1909E3000, a2, OS_LOG_TYPE_ERROR, "Error searching for MAID results: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end