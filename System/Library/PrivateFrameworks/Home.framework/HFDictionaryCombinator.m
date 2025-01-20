@interface HFDictionaryCombinator
+ (BOOL)_isKindOfContainerClass:(id)a3;
- (NSSet)keysToReconcile;
- (NSSet)keysToSkip;
- (id)_mergeVal1:(id)a3 withVal2:(id)a4;
- (id)combineResultDictionary:(id)a3 withResultDictionary:(id)a4 reconcilationHandler:(id)a5;
- (void)_reconcileKey:(id)a3 fromDictionary:(id)a4 andDictionary:(id)a5 intoResultDictionary:(id)a6 withReconcilationHandler:(id)a7;
- (void)setKeysToReconcile:(id)a3;
- (void)setKeysToSkip:(id)a3;
@end

@implementation HFDictionaryCombinator

+ (BOOL)_isKindOfContainerClass:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (_MergedGlobals_304 != -1) {
    dispatch_once(&_MergedGlobals_304, &__block_literal_global_3_30);
  }
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = (id)qword_26AB2FBB8;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_opt_isKindOfClass())
        {
          LOBYTE(v5) = 1;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v5;
}

uint64_t __50__HFDictionaryCombinator__isKindOfContainerClass___block_invoke_2()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
  uint64_t v4 = qword_26AB2FBB8;
  qword_26AB2FBB8 = v3;
  return MEMORY[0x270F9A758](v3, v4);
}

- (id)combineResultDictionary:(id)a3 withResultDictionary:(id)a4 reconcilationHandler:(id)a5
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  unint64_t v9 = (unint64_t)a3;
  unint64_t v10 = (unint64_t)a4;
  id v61 = a5;
  if (v61)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HFDictionaryCombinator.m", 29, @"Invalid parameter not satisfying: %@", @"reconcilationHandler" object file lineNumber description];

    if (v9)
    {
LABEL_3:
      if (!v10)
      {
        id v11 = (id)v9;
LABEL_9:
        v13 = v11;
        goto LABEL_10;
      }
    }
  }
  if (!v9 && v10)
  {
    id v11 = (id)v10;
    goto LABEL_9;
  }
  if (!(v9 | v10))
  {
    v13 = (void *)MEMORY[0x263EFFA78];
    goto LABEL_10;
  }
  v13 = objc_opt_new();
  v15 = (void *)MEMORY[0x263EFFA08];
  v62 = (void *)v9;
  v16 = [(id)v9 allKeys];
  v17 = [v15 setWithArray:v16];

  v18 = (void *)MEMORY[0x263EFFA08];
  v19 = (void *)v10;
  v20 = [(id)v10 allKeys];
  uint64_t v21 = [v18 setWithArray:v20];

  v58 = (void *)v21;
  v59 = v17;
  v22 = objc_msgSend(v17, "na_setByIntersectingWithSet:", v21);
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v71 objects:v77 count:16];
  v60 = v22;
  if (!v23) {
    goto LABEL_43;
  }
  uint64_t v24 = v23;
  uint64_t v25 = *(void *)v72;
  do
  {
    for (uint64_t i = 0; i != v24; ++i)
    {
      if (*(void *)v72 != v25) {
        objc_enumerationMutation(v22);
      }
      uint64_t v27 = *(void *)(*((void *)&v71 + 1) + 8 * i);
      v28 = [(HFDictionaryCombinator *)self keysToSkip];
      char v29 = [v28 containsObject:v27];

      if ((v29 & 1) == 0)
      {
        v30 = [(HFDictionaryCombinator *)self keysToReconcile];
        int v31 = [v30 containsObject:v27];

        if (v31)
        {
          [(HFDictionaryCombinator *)self _reconcileKey:v27 fromDictionary:v62 andDictionary:v19 intoResultDictionary:v13 withReconcilationHandler:v61];
          continue;
        }
        v32 = [v62 objectForKeyedSubscript:v27];
        uint64_t v33 = [v19 objectForKeyedSubscript:v27];
        v34 = (void *)v33;
        if (v32) {
          BOOL v35 = v33 == 0;
        }
        else {
          BOOL v35 = 1;
        }
        if (!v35 && [v32 isEqual:v33])
        {
          v36 = v13;
          v37 = v32;
          goto LABEL_38;
        }
        uint64_t v38 = objc_opt_class();
        if (v38 == objc_opt_class()
          && [(id)objc_opt_class() _isKindOfContainerClass:v32])
        {
          v39 = [(HFDictionaryCombinator *)self _mergeVal1:v32 withVal2:v34];
          [v13 setObject:v39 forKeyedSubscript:v27];

          goto LABEL_34;
        }
        if (!v32 || v34)
        {
          v22 = v60;
          if (v32 || !v34)
          {
            [(HFDictionaryCombinator *)self _reconcileKey:v27 fromDictionary:v62 andDictionary:v19 intoResultDictionary:v13 withReconcilationHandler:v61];
          }
          else
          {
            v36 = v13;
            v37 = v34;
LABEL_38:
            [v36 setObject:v37 forKeyedSubscript:v27];
          }
        }
        else
        {
          [v13 setObject:v32 forKeyedSubscript:v27];
LABEL_34:
          v22 = v60;
        }

        continue;
      }
    }
    uint64_t v24 = [v22 countByEnumeratingWithState:&v71 objects:v77 count:16];
  }
  while (v24);
LABEL_43:
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v40 = objc_msgSend(v59, "na_setByRemovingObjectsFromSet:", v22);
  uint64_t v41 = [v40 countByEnumeratingWithState:&v67 objects:v76 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v68;
    do
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        if (*(void *)v68 != v43) {
          objc_enumerationMutation(v40);
        }
        uint64_t v45 = *(void *)(*((void *)&v67 + 1) + 8 * j);
        v46 = [(HFDictionaryCombinator *)self keysToSkip];
        char v47 = [v46 containsObject:v45];

        if ((v47 & 1) == 0)
        {
          v48 = [v62 objectForKeyedSubscript:v45];
          [v13 setObject:v48 forKeyedSubscript:v45];
        }
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v67 objects:v76 count:16];
    }
    while (v42);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  v49 = objc_msgSend(v58, "na_setByRemovingObjectsFromSet:", v60);
  uint64_t v50 = [v49 countByEnumeratingWithState:&v63 objects:v75 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = *(void *)v64;
    do
    {
      for (uint64_t k = 0; k != v51; ++k)
      {
        if (*(void *)v64 != v52) {
          objc_enumerationMutation(v49);
        }
        uint64_t v54 = *(void *)(*((void *)&v63 + 1) + 8 * k);
        v55 = [(HFDictionaryCombinator *)self keysToSkip];
        char v56 = [v55 containsObject:v54];

        if ((v56 & 1) == 0)
        {
          v57 = [v19 objectForKeyedSubscript:v54];
          [v13 setObject:v57 forKeyedSubscript:v54];
        }
      }
      uint64_t v51 = [v49 countByEnumeratingWithState:&v63 objects:v75 count:16];
    }
    while (v51);
  }

  unint64_t v9 = (unint64_t)v62;
  unint64_t v10 = (unint64_t)v19;
LABEL_10:

  return v13;
}

- (id)_mergeVal1:(id)a3 withVal2:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 arrayByAddingObjectsFromArray:v8];
LABEL_5:
    unint64_t v10 = (void *)v9;
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 setByAddingObjectsFromSet:v8];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v10 = (void *)[v7 mutableCopy];
    [v10 addEntriesFromDictionary:v8];
  }
  else
  {
    long long v12 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFDictionaryCombinator.m", 126, @"Error; should not have called merge if it isn't mergable. (%@ && %@)",
      v7,
      v8);

    unint64_t v10 = 0;
  }
LABEL_6:

  return v10;
}

- (void)_reconcileKey:(id)a3 fromDictionary:(id)a4 andDictionary:(id)a5 intoResultDictionary:(id)a6 withReconcilationHandler:(id)a7
{
  id v13 = a3;
  id v11 = a6;
  long long v12 = (*((void (**)(id, id, id, id))a7 + 2))(a7, a4, a5, v13);
  if (v12) {
    [v11 setObject:v12 forKeyedSubscript:v13];
  }
}

- (NSSet)keysToReconcile
{
  return self->_keysToReconcile;
}

- (void)setKeysToReconcile:(id)a3
{
}

- (NSSet)keysToSkip
{
  return self->_keysToSkip;
}

- (void)setKeysToSkip:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysToSkip, 0);
  objc_storeStrong((id *)&self->_keysToReconcile, 0);
}

@end