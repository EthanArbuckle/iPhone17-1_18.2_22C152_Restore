@interface _HDSourceOrderTransactionCache
- (_HDSourceOrderTransactionCache)init;
- (id)initWithProfile:(id *)a1;
- (id)orderedSourceIDsForBundleIdentifier:(void *)a3 database:(uint64_t)a4 error:;
@end

@implementation _HDSourceOrderTransactionCache

- (id)initWithProfile:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)_HDSourceOrderTransactionCache;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

- (id)orderedSourceIDsForBundleIdentifier:(void *)a3 database:(uint64_t)a4 error:
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    v9 = *(void **)(a1 + 24);
    if (!v9)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v11 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v10;

      v9 = *(void **)(a1 + 24);
    }
    v12 = [v9 objectForKeyedSubscript:v7];
    if (!v12)
    {
      id v13 = v7;
      id v14 = v8;
      v15 = HDSourceEntityPredicateForSourceWithBundleIdentifier((uint64_t)v13);
      v16 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"uuid" entityClass:objc_opt_class() ascending:1];
      v20[0] = v16;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
      v18 = +[HDSourceEntity sourcesWithPredicate:v15 orderingTerms:v17 includeDeleted:0 database:v14 error:a4];

      if (v18)
      {
        v12 = objc_msgSend(v18, "hk_map:", &__block_literal_global_374_0);
      }
      else
      {
        v12 = 0;
      }

      if (v12) {
        [*(id *)(a1 + 24) setObject:v12 forKeyedSubscript:v13];
      }
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (_HDSourceOrderTransactionCache)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  id v4 = NSStringFromSelector(a2);
  [v3 raise:*MEMORY[0x1E4F1C3C8], @"The -%@ method is not available on %@", v4, objc_opt_class() format];

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedSourceIDsByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_defaultOrderedSources, 0);

  objc_storeStrong((id *)&self->_profile, 0);
}

@end