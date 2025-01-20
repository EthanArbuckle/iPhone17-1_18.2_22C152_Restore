@interface DNDSModeAssertionStoreRecord
+ (id)recordForAssertionStore:(id)a3;
+ (id)recordForDictionary:(id)a3 keys:(id *)a4;
- (NSArray)assertions;
- (NSArray)invalidationRequests;
- (NSArray)invalidations;
- (id)dictionaryWithKeys:(id *)a3 options:(unint64_t)a4;
- (id)object;
- (void)setAssertions:(id)a3;
- (void)setInvalidationRequests:(id)a3;
- (void)setInvalidations:(id)a3;
@end

@implementation DNDSModeAssertionStoreRecord

+ (id)recordForDictionary:(id)a3 keys:(id *)a4
{
  if (a3)
  {
    id v5 = a3;
    v6 = objc_alloc_init(DNDSModeAssertionStoreRecord);
    v7 = objc_msgSend(v5, "bs_safeArrayForKey:", a4->var0.var0);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __69__DNDSModeAssertionStoreRecord_Dictionary__recordForDictionary_keys___block_invoke;
    v16[3] = &__block_descriptor_40_e33___DNDSModeAssertionRecord_16__0_8l;
    v16[4] = a4;
    v8 = objc_msgSend(v7, "bs_mapNoNulls:", v16);

    [(DNDSModeAssertionStoreRecord *)v6 setAssertions:v8];
    v9 = objc_msgSend(v5, "bs_safeArrayForKey:", a4->var0.var1);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __69__DNDSModeAssertionStoreRecord_Dictionary__recordForDictionary_keys___block_invoke_2;
    v15[3] = &__block_descriptor_40_e45___DNDSModeAssertionInvalidationRecord_16__0_8l;
    v15[4] = a4;
    v10 = objc_msgSend(v9, "bs_mapNoNulls:", v15);

    [(DNDSModeAssertionStoreRecord *)v6 setInvalidations:v10];
    v11 = objc_msgSend(v5, "bs_safeArrayForKey:", a4->var0.var2);

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69__DNDSModeAssertionStoreRecord_Dictionary__recordForDictionary_keys___block_invoke_3;
    v14[3] = &__block_descriptor_40_e52___DNDSModeAssertionInvalidationRequestRecord_16__0_8l;
    v14[4] = a4;
    v12 = objc_msgSend(v11, "bs_mapNoNulls:", v14);

    [(DNDSModeAssertionStoreRecord *)v6 setInvalidationRequests:v12];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

id __69__DNDSModeAssertionStoreRecord_Dictionary__recordForDictionary_keys___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  v8 = +[DNDSModeAssertionRecord recordForDictionary:v7 keys:*(void *)(a1 + 32)];

  return v8;
}

id __69__DNDSModeAssertionStoreRecord_Dictionary__recordForDictionary_keys___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  v8 = +[DNDSModeAssertionInvalidationRecord recordForDictionary:v7 keys:*(void *)(a1 + 32)];

  return v8;
}

id __69__DNDSModeAssertionStoreRecord_Dictionary__recordForDictionary_keys___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  v8 = +[DNDSModeAssertionInvalidationRequestRecord recordForDictionary:v7 keys:*(void *)(a1 + 32)];

  return v8;
}

- (id)dictionaryWithKeys:(id *)a3 options:(unint64_t)a4
{
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v8 = [(DNDSModeAssertionStoreRecord *)self assertions];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__DNDSModeAssertionStoreRecord_Dictionary__dictionaryWithKeys_options___block_invoke;
  v17[3] = &__block_descriptor_48_e47___NSDictionary_16__0__DNDSModeAssertionRecord_8l;
  v17[4] = a3;
  v17[5] = a4;
  v9 = objc_msgSend(v8, "bs_mapNoNulls:", v17);

  objc_msgSend(v7, "bs_setSafeObject:forKey:", v9, a3->var0.var0);
  v10 = [(DNDSModeAssertionStoreRecord *)self invalidations];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__DNDSModeAssertionStoreRecord_Dictionary__dictionaryWithKeys_options___block_invoke_2;
  v16[3] = &__block_descriptor_48_e59___NSDictionary_16__0__DNDSModeAssertionInvalidationRecord_8l;
  v16[4] = a3;
  void v16[5] = a4;
  v11 = objc_msgSend(v10, "bs_mapNoNulls:", v16);

  objc_msgSend(v7, "bs_setSafeObject:forKey:", v11, a3->var0.var1);
  v12 = [(DNDSModeAssertionStoreRecord *)self invalidationRequests];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__DNDSModeAssertionStoreRecord_Dictionary__dictionaryWithKeys_options___block_invoke_3;
  v15[3] = &__block_descriptor_48_e66___NSDictionary_16__0__DNDSModeAssertionInvalidationRequestRecord_8l;
  v15[4] = a3;
  void v15[5] = a4;
  v13 = objc_msgSend(v12, "bs_mapNoNulls:", v15);

  objc_msgSend(v7, "bs_setSafeObject:forKey:", v13, a3->var0.var2);
  return v7;
}

uint64_t __71__DNDSModeAssertionStoreRecord_Dictionary__dictionaryWithKeys_options___block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryWithKeys:*(void *)(a1 + 32) options:*(void *)(a1 + 40)];
}

uint64_t __71__DNDSModeAssertionStoreRecord_Dictionary__dictionaryWithKeys_options___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 dictionaryWithKeys:*(void *)(a1 + 32) options:*(void *)(a1 + 40)];
}

uint64_t __71__DNDSModeAssertionStoreRecord_Dictionary__dictionaryWithKeys_options___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 dictionaryWithKeys:*(void *)(a1 + 32) options:*(void *)(a1 + 40)];
}

+ (id)recordForAssertionStore:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = objc_alloc_init(DNDSModeAssertionStoreRecord);
    id v5 = [v3 assertions];
    v6 = objc_msgSend(v5, "bs_mapNoNulls:", &__block_literal_global_27);

    if ([v6 count]) {
      [(DNDSModeAssertionStoreRecord *)v4 setAssertions:v6];
    }
    id v7 = [v3 invalidations];
    v8 = objc_msgSend(v7, "bs_mapNoNulls:", &__block_literal_global_58_1);

    if ([v8 count]) {
      [(DNDSModeAssertionStoreRecord *)v4 setInvalidations:v8];
    }
    v9 = [v3 invalidationRequests];
    v10 = objc_msgSend(v9, "bs_mapNoNulls:", &__block_literal_global_62);

    if ([v10 count]) {
      [(DNDSModeAssertionStoreRecord *)v4 setInvalidationRequests:v10];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id __56__DNDSModeAssertionStoreRecord_recordForAssertionStore___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[DNDSModeAssertionRecord recordForAssertion:a2];
}

id __56__DNDSModeAssertionStoreRecord_recordForAssertionStore___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[DNDSModeAssertionInvalidationRecord recordForInvalidation:a2];
}

id __56__DNDSModeAssertionStoreRecord_recordForAssertionStore___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[DNDSModeAssertionInvalidationRequestRecord recordForInvalidationRequest:a2];
}

- (id)object
{
  id v3 = objc_alloc_init(DNDSMutableModeAssertionStore);
  uint64_t v4 = [(DNDSModeAssertionStoreRecord *)self assertions];
  if ([v4 count])
  {
    id v5 = objc_msgSend(v4, "bs_mapNoNulls:", &__block_literal_global_67);
    [(DNDSMutableModeAssertionStore *)v3 setAssertions:v5];
  }
  v6 = [(DNDSModeAssertionStoreRecord *)self invalidations];
  if ([v6 count])
  {
    id v7 = objc_msgSend(v6, "bs_mapNoNulls:", &__block_literal_global_70);
    [(DNDSMutableModeAssertionStore *)v3 setInvalidations:v7];
  }
  v8 = [(DNDSModeAssertionStoreRecord *)self invalidationRequests];
  if ([v8 count])
  {
    v9 = objc_msgSend(v8, "bs_mapNoNulls:", &__block_literal_global_73);
    [(DNDSMutableModeAssertionStore *)v3 setInvalidationRequests:v9];
  }
  return v3;
}

uint64_t __38__DNDSModeAssertionStoreRecord_object__block_invoke(uint64_t a1, void *a2)
{
  return [a2 object];
}

uint64_t __38__DNDSModeAssertionStoreRecord_object__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 object];
}

uint64_t __38__DNDSModeAssertionStoreRecord_object__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 object];
}

- (NSArray)assertions
{
  return self->_assertions;
}

- (void)setAssertions:(id)a3
{
}

- (NSArray)invalidations
{
  return self->_invalidations;
}

- (void)setInvalidations:(id)a3
{
}

- (NSArray)invalidationRequests
{
  return self->_invalidationRequests;
}

- (void)setInvalidationRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationRequests, 0);
  objc_storeStrong((id *)&self->_invalidations, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
}

@end