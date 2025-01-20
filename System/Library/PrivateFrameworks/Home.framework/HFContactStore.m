@interface HFContactStore
+ (HFContactStore)defaultStore;
- (CNContactStore)contactStore;
- (HFContactStore)init;
- (id)_fallbackContactWithEmailAddress:(id)a3 phoneNumber:(id)a4;
- (id)_meContactWithEmailAddress:(id)a3 keys:(id)a4;
- (id)contactForEmailAddress:(id)a3 withKeys:(id)a4;
- (id)contactForPhoneNumber:(id)a3 withKeys:(id)a4;
- (id)contactForUserHandle:(id)a3 withKeys:(id)a4;
@end

@implementation HFContactStore

+ (HFContactStore)defaultStore
{
  if (_MergedGlobals_223 != -1) {
    dispatch_once(&_MergedGlobals_223, &__block_literal_global_3_2);
  }
  v2 = (void *)qword_26AB2EDC8;
  return (HFContactStore *)v2;
}

uint64_t __30__HFContactStore_defaultStore__block_invoke_2()
{
  v0 = objc_alloc_init(HFContactStore);
  uint64_t v1 = qword_26AB2EDC8;
  qword_26AB2EDC8 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (HFContactStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)HFContactStore;
  v2 = [(HFContactStore *)&v6 init];
  if (v2)
  {
    v3 = (CNContactStore *)objc_alloc_init(MEMORY[0x263EFEA58]);
    contactStore = v2->_contactStore;
    v2->_contactStore = v3;
  }
  return v2;
}

- (id)contactForUserHandle:(id)a3 withKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [v6 type];
    if (v8 == 1)
    {
      v9 = [v6 userID];
      uint64_t v10 = [(HFContactStore *)self contactForEmailAddress:v9 withKeys:v7];
      goto LABEL_9;
    }
    if (!v8)
    {
      v9 = [v6 userID];
      uint64_t v10 = [(HFContactStore *)self _meContactWithEmailAddress:v9 keys:v7];
LABEL_9:
      v12 = (void *)v10;

      goto LABEL_10;
    }
  }
  v11 = HFLogForCategory(0x46uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v14 = 0;
    _os_log_error_impl(&dword_20B986000, v11, OS_LOG_TYPE_ERROR, "Cannot create contact because HFUserHandle is nil.", v14, 2u);
  }

  v12 = 0;
LABEL_10:

  return v12;
}

- (id)_meContactWithEmailAddress:(id)a3 keys:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    v9 = [v7 arrayByAddingObject:*MEMORY[0x263EFDF80]];

    uint64_t v10 = [(HFContactStore *)self contactStore];
    id v20 = 0;
    v11 = [v10 unifiedMeContactMatchingEmailAddress:v6 keysToFetch:v9 error:&v20];
    id v12 = v20;

    uint64_t v8 = v9;
    if (v11)
    {
      if (!v12) {
        goto LABEL_4;
      }
LABEL_8:
      v16 = HFLogForCategory(0x46uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v12;
        _os_log_impl(&dword_20B986000, v16, OS_LOG_TYPE_DEFAULT, "Error fetching me contact: %@", buf, 0xCu);
      }

      if (v11) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  else
  {
    id v12 = 0;
    v9 = v7;
  }
  v14 = [(HFContactStore *)self contactStore];
  id v19 = v12;
  v11 = objc_msgSend(v14, "_ios_meContactWithKeysToFetch:error:", v8, &v19);
  id v15 = v19;

  id v12 = v15;
  if (v15) {
    goto LABEL_8;
  }
LABEL_4:
  if (v11)
  {
LABEL_5:
    id v13 = v11;
    goto LABEL_12;
  }
LABEL_11:
  id v13 = [(HFContactStore *)self _fallbackContactWithEmailAddress:v6 phoneNumber:0];
LABEL_12:
  v17 = v13;

  return v17;
}

- (id)contactForEmailAddress:(id)a3 withKeys:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [MEMORY[0x263EFE9F8] predicateForContactsMatchingEmailAddress:v6];
    v9 = [(HFContactStore *)self contactStore];
    id v20 = 0;
    uint64_t v10 = [v9 unifiedContactsMatchingPredicate:v8 keysToFetch:v7 error:&v20];
    id v11 = v20;
    id v12 = [v10 firstObject];

    if (v11)
    {
      id v13 = HFLogForCategory(0x46uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v22 = (uint64_t)v6;
        __int16 v23 = 2112;
        id v24 = v11;
        _os_log_error_impl(&dword_20B986000, v13, OS_LOG_TYPE_ERROR, "Error fetching contact with email %@: %@", buf, 0x16u);
      }

      v14 = HFLogForCategory(0x46uLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = [MEMORY[0x263EFEA58] authorizationStatusForEntityType:0];
        *(_DWORD *)buf = 134217984;
        uint64_t v22 = v19;
        _os_log_error_impl(&dword_20B986000, v14, OS_LOG_TYPE_ERROR, "Contact Store access: %ld", buf, 0xCu);
      }
    }
    if (v12)
    {
      id v15 = v12;
    }
    else
    {
      id v15 = [(HFContactStore *)self _fallbackContactWithEmailAddress:v6 phoneNumber:0];
    }
    v17 = v15;
  }
  else
  {
    v16 = HFLogForCategory(0x46uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20B986000, v16, OS_LOG_TYPE_ERROR, "Email address for user is nil!", buf, 2u);
    }

    v17 = [(HFContactStore *)self _fallbackContactWithEmailAddress:0 phoneNumber:0];
  }

  return v17;
}

- (id)contactForPhoneNumber:(id)a3 withKeys:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"HFContactStore.m", 92, @"Invalid parameter not satisfying: %@", @"phoneNumberString" object file lineNumber description];
  }
  v9 = [MEMORY[0x263EFEB28] phoneNumberWithStringValue:v7];
  uint64_t v10 = [MEMORY[0x263EFE9F8] predicateForContactsMatchingPhoneNumber:v9];
  id v11 = [(HFContactStore *)self contactStore];
  id v22 = 0;
  id v12 = [v11 unifiedContactsMatchingPredicate:v10 keysToFetch:v8 error:&v22];
  id v13 = v22;
  v14 = [v12 firstObject];

  if (v13)
  {
    id v15 = HFLogForCategory(0x46uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v24 = (uint64_t)v7;
      __int16 v25 = 2112;
      id v26 = v13;
      _os_log_error_impl(&dword_20B986000, v15, OS_LOG_TYPE_ERROR, "Error fetching contact with phone number %@: %@", buf, 0x16u);
    }

    v16 = HFLogForCategory(0x46uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = [MEMORY[0x263EFEA58] authorizationStatusForEntityType:0];
      *(_DWORD *)buf = 134217984;
      uint64_t v24 = v20;
      _os_log_error_impl(&dword_20B986000, v16, OS_LOG_TYPE_ERROR, "Contact Store access: %ld", buf, 0xCu);
    }
  }
  if (v14)
  {
    id v17 = v14;
  }
  else
  {
    id v17 = [(HFContactStore *)self _fallbackContactWithEmailAddress:0 phoneNumber:v9];
  }
  v18 = v17;

  return v18;
}

- (id)_fallbackContactWithEmailAddress:(id)a3 phoneNumber:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFEAF0]);
  id v8 = v7;
  if (v5)
  {
    [v7 setGivenName:v5];
    v9 = [MEMORY[0x263EFEAD0] labeledValueWithLabel:0 value:v5];
    v16[0] = v9;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    [v8 setEmailAddresses:v10];
  }
  else
  {
    v9 = [v6 stringValue];
    [v8 setGivenName:v9];
  }

  if (v6)
  {
    id v11 = [MEMORY[0x263EFEAD0] labeledValueWithLabel:0 value:v6];
    id v15 = v11;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
    [v8 setPhoneNumbers:v12];
  }
  id v13 = (void *)[v8 copy];

  return v13;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
}

@end