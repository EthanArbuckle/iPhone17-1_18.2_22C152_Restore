@interface WFCNContactStore
- (BOOL)addContact:(id)a3 error:(id *)a4;
- (CNContactStore)contactStore;
- (WFCNContactStore)init;
- (WFCNContactStore)initWithContactStore:(id)a3;
- (id)allContactsWithSortOrder:(int64_t)a3;
- (id)allContactsWithSortOrder:(int64_t)a3 passingTest:(id)a4;
- (id)contactWithIdentifier:(id)a3;
- (id)contactsMatchingPredicate:(id)a3 error:(id *)a4;
- (id)contactsWithName:(id)a3;
- (id)contactsWithName:(id)a3 keysToFetch:(id)a4;
- (id)firstContactWithEmailAddress:(id)a3;
- (id)firstContactWithPhoneNumber:(id)a3;
- (id)firstContactWithPredicate:(id)a3 propertyID:(int)a4 valueEqualityBlock:(id)a5;
@end

@implementation WFCNContactStore

- (void).cxx_destruct
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (BOOL)addContact:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2050000000;
  v7 = (void *)getCNSaveRequestClass_softClass;
  uint64_t v17 = getCNSaveRequestClass_softClass;
  if (!getCNSaveRequestClass_softClass)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __getCNSaveRequestClass_block_invoke;
    v13[3] = &unk_26428AC60;
    v13[4] = &v14;
    __getCNSaveRequestClass_block_invoke((uint64_t)v13);
    v7 = (void *)v15[3];
  }
  v8 = v7;
  _Block_object_dispose(&v14, 8);
  id v9 = objc_alloc_init(v8);
  [v9 addContact:v6 toContainerWithIdentifier:0];
  v10 = [(WFCNContactStore *)self contactStore];
  char v11 = [v10 executeSaveRequest:v9 error:a4];

  return v11;
}

- (id)contactsMatchingPredicate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(WFCNContactStore *)self contactStore];
  v8 = +[WFCNContact requiredKeysToFetch];
  id v9 = [v7 unifiedContactsMatchingPredicate:v6 keysToFetch:v8 error:a4];

  v10 = objc_msgSend(v9, "if_map:", &__block_literal_global_72);

  return v10;
}

WFCNContact *__52__WFCNContactStore_contactsMatchingPredicate_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WFCNContact contactWithCNContact:a2];
}

- (id)contactWithIdentifier:(id)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFCNContact.m", 208, @"Invalid parameter not satisfying: %@", @"contactIdentifier" object file lineNumber description];
  }
  if (WFCNContactAuthorizationStatus() != 3)
  {
    uint64_t v14 = 0;
    goto LABEL_14;
  }
  id CNContactClass = getCNContactClass();
  v24[0] = v5;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
  v8 = [CNContactClass predicateForContactsWithIdentifiers:v7];

  id v9 = [(WFCNContactStore *)self contactStore];
  v10 = +[WFCNContact requiredKeysToFetch];
  id v17 = 0;
  char v11 = [v9 unifiedContactsMatchingPredicate:v8 keysToFetch:v10 error:&v17];
  id v12 = v17;

  if (v11)
  {
    if (![v11 count])
    {
      uint64_t v14 = 0;
      goto LABEL_13;
    }
    v13 = [v11 firstObject];
    uint64_t v14 = +[WFCNContact contactWithCNContact:v13];
  }
  else
  {
    v13 = getWFWFContactLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v19 = "-[WFCNContactStore contactWithIdentifier:]";
      __int16 v20 = 2114;
      v21 = v8;
      __int16 v22 = 2114;
      id v23 = v12;
      _os_log_impl(&dword_216505000, v13, OS_LOG_TYPE_ERROR, "%s Failed to fetch contacts for predicate %{public}@: %{public}@", buf, 0x20u);
    }
    uint64_t v14 = 0;
  }

LABEL_13:
LABEL_14:

  return v14;
}

- (id)firstContactWithPhoneNumber:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2050000000;
  id v5 = (void *)getCNPhoneNumberClass_softClass;
  uint64_t v18 = getCNPhoneNumberClass_softClass;
  if (!getCNPhoneNumberClass_softClass)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __getCNPhoneNumberClass_block_invoke;
    v14[3] = &unk_26428AC60;
    v14[4] = &v15;
    __getCNPhoneNumberClass_block_invoke((uint64_t)v14);
    id v5 = (void *)v16[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v15, 8);
  v7 = [v4 string];
  v8 = [v6 phoneNumberWithStringValue:v7];

  if (v8)
  {
    id v9 = [getCNContactClass() predicateForContactsMatchingPhoneNumber:v8 prefixHint:0 groupIdentifiers:0 limitToOneResult:1];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __48__WFCNContactStore_firstContactWithPhoneNumber___block_invoke;
    v12[3] = &unk_2642885E8;
    id v13 = v8;
    v10 = [(WFCNContactStore *)self firstContactWithPredicate:v9 propertyID:3 valueEqualityBlock:v12];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __48__WFCNContactStore_firstContactWithPhoneNumber___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 value];
  uint64_t v4 = [v3 isLikePhoneNumber:*(void *)(a1 + 32)];

  return v4;
}

- (id)firstContactWithEmailAddress:(id)a3
{
  id v4 = a3;
  id CNContactClass = getCNContactClass();
  id v6 = [v4 address];
  v7 = [CNContactClass predicateForContactsMatchingEmailAddress:v6 groupIdentifiers:0 limitToOneResult:1];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__WFCNContactStore_firstContactWithEmailAddress___block_invoke;
  v11[3] = &unk_2642885E8;
  id v12 = v4;
  id v8 = v4;
  id v9 = [(WFCNContactStore *)self firstContactWithPredicate:v7 propertyID:4 valueEqualityBlock:v11];

  return v9;
}

uint64_t __49__WFCNContactStore_firstContactWithEmailAddress___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 value];
  id v4 = [*(id *)(a1 + 32) address];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (id)firstContactWithPredicate:(id)a3 propertyID:(int)a4 valueEqualityBlock:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (WFCNContactAuthorizationStatus() == 3)
  {
    v10 = 0;
    goto LABEL_16;
  }
  char v11 = [(WFCNContactStore *)self contactStore];
  id v12 = +[WFCNContact requiredKeysToFetch];
  id v25 = 0;
  id v13 = [v11 unifiedContactsMatchingPredicate:v8 keysToFetch:v12 error:&v25];
  id v14 = v25;

  if (v13)
  {
    uint64_t v15 = [v13 firstObject];
    if (v15)
    {
      uint64_t v16 = CNContactPropertyKeyFromWFContactPropertyID(v6);
      if ([v15 isKeyAvailable:v16])
      {
        uint64_t v17 = [v15 valueForKey:v16];
        uint64_t v20 = MEMORY[0x263EF8330];
        uint64_t v21 = 3221225472;
        __int16 v22 = __76__WFCNContactStore_firstContactWithPredicate_propertyID_valueEqualityBlock___block_invoke;
        id v23 = &unk_264287ED0;
        id v24 = v9;
        uint64_t v18 = [v17 indexOfObjectPassingTest:&v20];
        if (v18 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v10 = 0;
        }
        else
        {
          v10 = +[WFCNContact contactWithCNContact:propertyID:multivalueIndex:](WFCNContact, "contactWithCNContact:propertyID:multivalueIndex:", v15, v6, v18, v20, v21, v22, v23);
        }
      }
      else
      {
        v10 = 0;
      }

      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v15 = getWFWFContactLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v27 = "-[WFCNContactStore firstContactWithPredicate:propertyID:valueEqualityBlock:]";
      __int16 v28 = 2114;
      id v29 = v8;
      __int16 v30 = 2114;
      id v31 = v14;
      _os_log_impl(&dword_216505000, v15, OS_LOG_TYPE_ERROR, "%s Failed to fetch contacts for predicate %{public}@: %{public}@", buf, 0x20u);
    }
  }
  v10 = 0;
LABEL_15:

LABEL_16:
  return v10;
}

uint64_t __76__WFCNContactStore_firstContactWithPredicate_propertyID_valueEqualityBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)contactsWithName:(id)a3 keysToFetch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (WFCNContactAuthorizationStatus() == 3)
  {
    id v8 = 0;
  }
  else
  {
    id v9 = [(WFCNContactStore *)self contactStore];
    v10 = [getCNContactClass() predicateForContactsMatchingName:v6];
    char v11 = [v9 unifiedContactsMatchingPredicate:v10 keysToFetch:v7 error:0];
    id v8 = objc_msgSend(v11, "if_map:", &__block_literal_global_56_11431);
  }
  return v8;
}

WFCNContact *__49__WFCNContactStore_contactsWithName_keysToFetch___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WFCNContact contactWithCNContact:a2];
}

- (id)contactsWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[WFCNContact requiredKeysToFetch];
  id v6 = [(WFCNContactStore *)self contactsWithName:v4 keysToFetch:v5];

  return v6;
}

- (id)allContactsWithSortOrder:(int64_t)a3
{
  return [(WFCNContactStore *)self allContactsWithSortOrder:a3 passingTest:&__block_literal_global_53_11432];
}

uint64_t __45__WFCNContactStore_allContactsWithSortOrder___block_invoke()
{
  return 1;
}

- (id)allContactsWithSortOrder:(int64_t)a3 passingTest:(id)a4
{
  id v6 = a4;
  if (WFCNContactAuthorizationStatus() == 3)
  {
    id v7 = objc_alloc((Class)getCNContactFetchRequestClass());
    id v8 = +[WFCNContact requiredKeysToFetch];
    id v9 = (void *)[v7 initWithKeysToFetch:v8];

    if ((unint64_t)(a3 - 1) >= 3) {
      int64_t v10 = 0;
    }
    else {
      int64_t v10 = a3;
    }
    [v9 setSortOrder:v10];
    char v11 = objc_opt_new();
    id v12 = [(WFCNContactStore *)self contactStore];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __57__WFCNContactStore_allContactsWithSortOrder_passingTest___block_invoke;
    v17[3] = &unk_264287E68;
    id v19 = v6;
    id v13 = v11;
    id v18 = v13;
    [v12 enumerateContactsWithFetchRequest:v9 error:0 usingBlock:v17];

    id v14 = v18;
    id v15 = v13;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

void __57__WFCNContactStore_allContactsWithSortOrder_passingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = +[WFCNContact contactWithCNContact:a2];
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (WFCNContactStore)initWithContactStore:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFCNContactStore;
  id v6 = [(WFContactStore *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contactStore, a3);
    id v8 = v7;
  }

  return v7;
}

- (WFCNContactStore)init
{
  getCNContactStoreClass();
  id v3 = objc_opt_new();
  id v4 = [(WFCNContactStore *)self initWithContactStore:v3];

  return v4;
}

@end