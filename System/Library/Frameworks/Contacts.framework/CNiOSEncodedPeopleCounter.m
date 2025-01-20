@interface CNiOSEncodedPeopleCounter
+ (id)os_log;
- (BOOL)supportsCounting;
- (CNiOSEncodedPeopleCounter)initWithFetchRequest:(id)a3 addressBook:(id)a4 managedConfiguration:(id)a5;
- (id)fetchContactCountWithError:(id *)a3;
- (void)supportsCounting;
@end

@implementation CNiOSEncodedPeopleCounter

+ (id)os_log
{
  self;
  if (os_log_cn_once_token_0_22 != -1) {
    dispatch_once(&os_log_cn_once_token_0_22, &__block_literal_global_133);
  }
  v0 = (void *)os_log_cn_once_object_0_22;

  return v0;
}

uint64_t __35__CNiOSEncodedPeopleCounter_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts", "CNiOSEncodedPeopleCounter");
  uint64_t v1 = os_log_cn_once_object_0_22;
  os_log_cn_once_object_0_22 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (CNiOSEncodedPeopleCounter)initWithFetchRequest:(id)a3 addressBook:(id)a4 managedConfiguration:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNiOSEncodedPeopleCounter;
  v12 = [(CNiOSEncodedPeopleCounter *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_addressBook, a4);
    objc_storeStrong((id *)&v13->_contactFetchRequest, a3);
    objc_storeStrong((id *)&v13->_managedConfiguration, a5);
    v14 = v13;
  }

  return v13;
}

- (BOOL)supportsCounting
{
  v2 = self;
  if (self) {
    self = (CNiOSEncodedPeopleCounter *)self->_contactFetchRequest;
  }
  if (([(CNiOSEncodedPeopleCounter *)self disallowsEncodedFetch] & 1) == 0)
  {
    if (v2) {
      contactFetchRequest = v2->_contactFetchRequest;
    }
    else {
      contactFetchRequest = 0;
    }
    id v5 = [(CNContactFetchRequest *)contactFetchRequest effectivePredicate];
    if ([v5 conformsToProtocol:&unk_1EE08B958]) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    id v7 = v6;

    if (v7 && (objc_opt_respondsToSelector() & 1) == 0)
    {
      if (objc_msgSend(v7, "cn_supportsEncodedFetching"))
      {
        -[CNFavoritesEntry setBundleIdentifier:]((uint64_t)v2, v7);
        BOOL v3 = 1;
LABEL_18:

        return v3;
      }
      v8 = +[CNiOSEncodedPeopleCounter os_log]();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[CNiOSEncodedPeopleCounter supportsCounting](v8);
      }
    }
    BOOL v3 = 0;
    goto LABEL_18;
  }
  return 0;
}

- (id)fetchContactCountWithError:(id *)a3
{
  uint64_t v15 = 0;
  objc_super v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__33;
  v19 = __Block_byref_object_dispose__33;
  id v20 = 0;
  if (self) {
    addressBook = self->_addressBook;
  }
  else {
    addressBook = 0;
  }
  v6 = addressBook;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__CNiOSEncodedPeopleCounter_fetchContactCountWithError___block_invoke;
  v14[3] = &unk_1E56B8F08;
  v14[4] = self;
  v14[5] = &v15;
  id v7 = [(CNiOSAddressBook *)v6 resultWithInvalidatedAddressBook:v14];

  v8 = [v7 value];
  id v9 = (void *)v16[5];
  id v10 = v9;
  if (!v9)
  {
    id v10 = [v7 error];
  }
  id v11 = v8;
  v12 = v11;
  if (a3 && !v11) {
    *a3 = v10;
  }
  if (!v9) {

  }
  _Block_object_dispose(&v15, 8);

  return v12;
}

id __56__CNiOSEncodedPeopleCounter_fetchContactCountWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id v5 = *(void **)(v4 + 16);
  }
  else {
    id v5 = 0;
  }
  v6 = *(void **)(a1 + 32);
  if (v6) {
    v6 = (void *)v6[5];
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v7 + 40);
  v8 = v6;
  id v9 = v5;
  id v10 = +[CNiOSPersonFetchRequest fetchRequestFromCNFetchRequest:v9 managedConfiguration:v8 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);

  if (v10)
  {
    id v11 = *(void **)(a1 + 32);
    if (v11) {
      id v11 = (void *)v11[6];
    }
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    id v25 = *(id *)(v12 + 40);
    v13 = v11;
    v14 = objc_msgSend(v13, "cn_ABQSLPredicateForAddressBook:fetchRequest:error:", a2, v10, &v25);
    objc_storeStrong((id *)(v12 + 40), v25);

    if (v14)
    {
      id v15 = objc_alloc(MEMORY[0x1E4F49888]);
      objc_super v16 = *(void **)(a1 + 32);
      if (v16) {
        objc_super v16 = (void *)v16[2];
      }
      uint64_t v17 = v16;
      uint64_t v18 = [v17 unifyResults];
      uint64_t v19 = *(void *)(a1 + 32);
      if (v19) {
        uint64_t v20 = *(void *)(v19 + 40);
      }
      else {
        uint64_t v20 = 0;
      }
      v21 = objc_msgSend(v15, "initWithAddressBook:predicate:includeLinkedContacts:managedConfiguration:", a2, v14, v18, v20, v25);

      objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v21, "fetchContactCount"));
      id v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
        v23 = 0;
      }
      else {
        v23 = &unk_1EE089488;
      }
      id v22 = v23;
    }
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privatePredicate, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_contactFetchRequest, 0);

  objc_storeStrong((id *)&self->_addressBook, 0);
}

- (void)supportsCounting
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (objc_class *)objc_opt_class();
  BOOL v3 = NSStringFromClass(v2);
  uint64_t v4 = NSStringFromSelector(sel_cn_supportsEncodedFetching);
  int v5 = 138543618;
  v6 = v3;
  __int16 v7 = 2114;
  v8 = v4;
  _os_log_error_impl(&dword_1909E3000, a1, OS_LOG_TYPE_ERROR, "Cannot use %{public}@ with a predicate not supporting %{public}@", (uint8_t *)&v5, 0x16u);
}

@end