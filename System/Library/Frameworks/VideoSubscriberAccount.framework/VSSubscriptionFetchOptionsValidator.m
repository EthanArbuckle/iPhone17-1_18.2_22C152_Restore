@interface VSSubscriptionFetchOptionsValidator
- (VSSubscriptionPredicateFactory)predicateFactory;
- (id)standardizedFetchOptionsFromOptions:(id)a3 withSecurityTask:(id)a4;
- (id)subscriptionFetchOptionsAllowedForSecurityTask:(id)a3;
- (void)setPredicateFactory:(id)a3;
@end

@implementation VSSubscriptionFetchOptionsValidator

- (VSSubscriptionPredicateFactory)predicateFactory
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_predicateFactory;
  if (!v3)
  {
    v3 = objc_alloc_init(VSSubscriptionPredicateFactory);
    objc_storeStrong((id *)&v2->_predicateFactory, v3);
  }
  objc_sync_exit(v2);

  if (!v3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The __orNil parameter must not be nil."];
  }

  return v3;
}

- (id)subscriptionFetchOptionsAllowedForSecurityTask:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  *(void *)buf = MEMORY[0x1E4F143A8];
  uint64_t v47 = 3221225472;
  v48 = __VSAllSubscriptionFetchOptions_block_invoke;
  v49 = &unk_1E6BD2C38;
  id v50 = &unk_1F34D0E98;
  v51 = (void *)MEMORY[0x1E4F1CC38];
  if (VSAllSubscriptionFetchOptions___vs_lazy_init_predicate != -1) {
    dispatch_once(&VSAllSubscriptionFetchOptions___vs_lazy_init_predicate, buf);
  }
  v5 = v51;
  id v6 = (id)VSAllSubscriptionFetchOptions___vs_lazy_init_variable;

  v7 = (void *)[v6 mutableCopy];
  id v8 = v4;
  v9 = objc_alloc_init(VSSubscriptionFetchOptionDescription);
  [(VSSubscriptionFetchOptionDescription *)v9 setKey:@"VSSubscriptionFetchOptionSubscriberIdentifierHashModifier"];
  [(VSSubscriptionFetchOptionDescription *)v9 setAllowedClass:objc_opt_class()];
  id v45 = 0;
  id v44 = 0;
  int v10 = [v8 getValue:&v45 forEntitlement:@"com.apple.private.subscriptionservce.subscriber-identifier-hash-modifiers" error:&v44];
  id v11 = v45;
  id v12 = v44;
  if (!v10)
  {
    v23 = VSErrorLogObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[VSSubscriptionFetchOptionsValidator subscriptionFetchOptionsAllowedForSecurityTask:]((uint64_t)v12, v23);
    }
    goto LABEL_20;
  }
  if (!v11)
  {
    v23 = VSDefaultLogObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA674000, v23, OS_LOG_TYPE_DEFAULT, "No allowed hash modifiers.", buf, 2u);
    }
LABEL_20:

    v9 = 0;
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v11;
    if ([v13 count])
    {
      id v36 = v11;
      v37 = v9;
      id v38 = v8;
      v39 = v7;
      v14 = (VSSubscriptionFetchOptionDescription *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v35 = v13;
      id v15 = v13;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:buf count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v41;
        uint64_t v19 = *MEMORY[0x1E4F1C3C8];
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v41 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v21 = *(void *)(*((void *)&v40 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [(VSSubscriptionFetchOptionDescription *)v14 addObject:v21];
            }
            else {
              [MEMORY[0x1E4F1CA00] raise:v19, @"Value (%@) in %@ entitlement array is not a string.", v21, @"com.apple.private.subscriptionservce.subscriber-identifier-hash-modifiers" format];
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v40 objects:buf count:16];
        }
        while (v17);
      }

      v22 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self in %@", v14];
      v9 = v37;
      [(VSSubscriptionFetchOptionDescription *)v37 setAllowedValuePredicate:v22];
      v7 = v39;
      id v8 = v38;
      id v11 = v36;
      id v13 = v35;
    }
    else
    {
      v22 = VSDefaultLogObject();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA674000, v22, OS_LOG_TYPE_DEFAULT, "Allowed hash modifiers array is empty.", buf, 2u);
      }
      v14 = v9;
      v9 = 0;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Value for %@ entitlement is not an array.", @"com.apple.private.subscriptionservce.subscriber-identifier-hash-modifiers" format];
  }
LABEL_21:

  if (v9) {
    [v7 setObject:v9 forKey:@"VSSubscriptionFetchOptionSubscriberIdentifierHashModifier"];
  }
  v24 = [v7 objectForKey:@"VSSubscriptionFetchOptionSources"];
  v25 = (void *)[v24 copy];

  if (v25)
  {
    id v26 = v25;
    v27 = [(VSSubscriptionFetchOptionsValidator *)self predicateFactory];
    v28 = [v27 allowedSubscriptionSourcesPredicateForRequestKind:0 fromTask:v8];

    [v26 setAllowedValuePredicate:v28];
    [v7 setObject:v26 forKey:@"VSSubscriptionFetchOptionSources"];
  }
  v29 = [v7 objectForKey:@"VSSubscriptionFetchOptionSourceKind"];
  v30 = (void *)[v29 copy];

  if (v30)
  {
    id v31 = v30;
    v32 = [(VSSubscriptionFetchOptionsValidator *)self predicateFactory];
    v33 = [v32 allowedSubscriptionSourceKindsPredicateForRequestKind:0 fromTask:v8];

    [v31 setAllowedValuePredicate:v33];
    [v7 setObject:v31 forKey:@"VSSubscriptionFetchOptionSourceKind"];
  }

  return v7;
}

- (id)standardizedFetchOptionsFromOptions:(id)a3 withSecurityTask:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  unint64_t v9 = 0x1E4F1C000uLL;
  int v10 = (void *)MEMORY[0x1E4F1C3C8];
  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The providedOptions parameter must not be nil."];
    if (v8) {
      goto LABEL_3;
    }
  }
  [MEMORY[0x1E4F1CA00] raise:*v10 format:@"The securityTask parameter must not be nil."];
LABEL_3:
  id v57 = (id)[v6 mutableCopy];
  v53 = v8;
  [(VSSubscriptionFetchOptionsValidator *)self subscriptionFetchOptionsAllowedForSecurityTask:v8];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v52 = v69 = 0u;
  id v11 = [v52 allValues];
  uint64_t v58 = [v11 countByEnumeratingWithState:&v66 objects:v71 count:16];
  if (v58)
  {
    uint64_t v12 = *(void *)v67;
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    v54 = v11;
    id v55 = v6;
    uint64_t v56 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v58; ++i)
      {
        if (*(void *)v67 != v12) {
          objc_enumerationMutation(v11);
        }
        id v15 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        v60 = (void *)MEMORY[0x1E0173AA0]();
        uint64_t v16 = [v15 key];
        v61 = [v6 objectForKey:v16];
        if (v61)
        {
          uint64_t v59 = i;
          uint64_t v17 = [v15 allowedClass];
          uint64_t v18 = [v15 allowedValuePredicate];
          if ([v15 isContainer])
          {
            if (objc_opt_respondsToSelector())
            {
              unint64_t v19 = [v61 count];
              unint64_t v20 = [v15 minCount];
              if (v19 >= v20)
              {
                long long v64 = 0u;
                long long v65 = 0u;
                long long v62 = 0u;
                long long v63 = 0u;
                id v29 = v61;
                uint64_t v30 = [v29 countByEnumeratingWithState:&v62 objects:v70 count:16];
                if (v30)
                {
                  uint64_t v31 = v30;
                  uint64_t v32 = *(void *)v63;
                  do
                  {
                    for (uint64_t j = 0; j != v31; ++j)
                    {
                      if (*(void *)v63 != v32) {
                        objc_enumerationMutation(v29);
                      }
                      uint64_t v34 = *(void *)(*((void *)&v62 + 1) + 8 * j);
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        id v35 = (void *)MEMORY[0x1E4F1CA00];
                        uint64_t v51 = objc_opt_class();
                        id v36 = v35;
                        unint64_t v9 = 0x1E4F1C000uLL;
                        [v36 raise:v13, @"Contained value (%@) for option %@ was a %@ instead of some kind of %@", v34, v16, v51, v17 format];
                      }
                      if (([v18 evaluateWithObject:v34] & 1) == 0) {
                        [*(id *)(v9 + 2560) raise:v13, @"Contained value (%@) for option %@ not allowed %@", v34, v16, v18 format];
                      }
                    }
                    uint64_t v31 = [v29 countByEnumeratingWithState:&v62 objects:v70 count:16];
                  }
                  while (v31);
                }

                id v11 = v54;
                id v6 = v55;
              }
              else
              {
                unint64_t v21 = v20;
                v22 = (void *)MEMORY[0x1E4F1CA00];
                v23 = [NSNumber numberWithUnsignedInteger:v19];
                v24 = [NSNumber numberWithUnsignedInteger:v21];
                v25 = v22;
                unint64_t v9 = 0x1E4F1C000;
                [v25 raise:v13, @"Collection count (%@) for option %@ was less than %@ minimum.", v23, v16, v24 format];
              }
              uint64_t v12 = v56;
            }
            else
            {
              [*(id *)(v9 + 2560) raise:v13, @"Cannot enumerates values in %@ for option %@", v61, v16, v49 format];
            }
          }
          else
          {
            id v26 = v61;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v27 = *(void **)(v9 + 2560);
              uint64_t v50 = objc_opt_class();
              v28 = v27;
              id v26 = v61;
              [v28 raise:v13, @"Provided value (%@) for option %@ was a %@ instead of some kind of %@", v61, v16, v50, v17 format];
            }
            if (([v18 evaluateWithObject:v26] & 1) == 0) {
              [*(id *)(v9 + 2560) raise:v13, @"Provided value (%@) for option %@ not allowed %@", v26, v16, v18 format];
            }
          }
          uint64_t i = v59;
        }
        else
        {
          uint64_t v18 = [v15 defaultValue];
          if (v18) {
            [v57 setObject:v18 forKey:v16];
          }
        }
      }
      uint64_t v58 = [v11 countByEnumeratingWithState:&v66 objects:v71 count:16];
    }
    while (v58);
  }

  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v38 = [v52 allValues];
  v39 = [v38 valueForKeyPath:@"key"];

  if (v39) {
    [v37 addObjectsFromArray:v39];
  }
  long long v40 = (void *)MEMORY[0x1E4F1CAD0];
  long long v41 = [v57 allKeys];
  long long v42 = [v40 setWithArray:v41];

  long long v43 = (void *)[v42 mutableCopy];
  [v43 minusSet:v37];
  if ([v43 count])
  {
    id v44 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v45 = *MEMORY[0x1E4F1C3C8];
    v46 = [v43 allObjects];
    uint64_t v47 = [v46 componentsJoinedByString:@", "];
    [v44 raise:v45, @"Unrecognized options provided: %@", v47 format];
  }

  return v57;
}

- (void)setPredicateFactory:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)subscriptionFetchOptionsAllowedForSecurityTask:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Unable to obtain value for hash modifiers entitlement: %@", (uint8_t *)&v2, 0xCu);
}

@end