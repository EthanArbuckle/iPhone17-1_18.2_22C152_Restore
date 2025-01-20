@interface MOWebDomainCategoryShieldPolicy
+ (BOOL)isValidPersistableRepresentation:(id)a3;
+ (id)initializeWithPersistableValue:(id)a3;
- (id)persistableValue;
@end

@implementation MOWebDomainCategoryShieldPolicy

- (id)persistableValue
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(MOCategoryShieldPolicy *)self policy];
  if (v3 == 2)
  {
    id v23 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v24 = [(MOCategoryShieldPolicy *)self excludedContent];
    v6 = objc_msgSend(v23, "initWithCapacity:", objc_msgSend(v24, "count"));

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v25 = [(MOCategoryShieldPolicy *)self excludedContent];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v32 objects:v46 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v33 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = [*(id *)(*((void *)&v32 + 1) + 8 * i) persistableValue];
          [v6 addObject:v30];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v32 objects:v46 count:16];
      }
      while (v27);
    }

    v44 = @"activities";
    v45 = v6;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    goto LABEL_26;
  }
  if (v3 == 1)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v5 = [(MOCategoryShieldPolicy *)self specificCategories];
    v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v7 = [(MOCategoryShieldPolicy *)self specificCategories];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v50 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v9; ++j)
        {
          if (*(void *)v41 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v40 + 1) + 8 * j) persistableValue];
          [v6 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v40 objects:v50 count:16];
      }
      while (v9);
    }

    id v13 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v14 = [(MOCategoryShieldPolicy *)self excludedContent];
    v15 = objc_msgSend(v13, "initWithCapacity:", objc_msgSend(v14, "count"));

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v16 = [(MOCategoryShieldPolicy *)self excludedContent];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v36 objects:v49 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v37;
      do
      {
        for (uint64_t k = 0; k != v18; ++k)
        {
          if (*(void *)v37 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [*(id *)(*((void *)&v36 + 1) + 8 * k) persistableValue];
          [v15 addObject:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v36 objects:v49 count:16];
      }
      while (v18);
    }

    v47[0] = @"categories";
    v47[1] = @"activities";
    v48[0] = v6;
    v48[1] = v15;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:2];

LABEL_26:
    goto LABEL_28;
  }
  v22 = (void *)MEMORY[0x1E4F1CC08];
LABEL_28:
  return v22;
}

+ (id)initializeWithPersistableValue:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!+[MOApplicationCategoryShieldPolicy isValidPersistableRepresentation:v3])
  {
    v15 = 0;
    goto LABEL_28;
  }
  id v4 = v3;
  v5 = [v4 objectForKeyedSubscript:@"categories"];
  unint64_t v6 = 0x1E4F1C000uLL;
  if (!v5)
  {
    v7 = 0;
    goto LABEL_14;
  }
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  if (!v7)
  {
LABEL_14:
    uint64_t v14 = 2;
    goto LABEL_15;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = +[MOCategory initializeWithPersistableValue:*(void *)(*((void *)&v31 + 1) + 8 * i)];
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v10);
  }

  uint64_t v14 = 1;
  unint64_t v6 = 0x1E4F1C000;
LABEL_15:
  v16 = [v4 objectForKeyedSubscript:@"activities"];
  if (v16)
  {
    uint64_t v17 = objc_msgSend(objc_alloc(*(Class *)(v6 + 2632)), "initWithCapacity:", objc_msgSend(v16, "count"));
    if (v17)
    {
      v25 = v5;
      id v26 = v4;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v18 = v16;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v28;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v28 != v21) {
              objc_enumerationMutation(v18);
            }
            id v23 = +[MOWebDomain initializeWithPersistableValue:*(void *)(*((void *)&v27 + 1) + 8 * j)];
            [v17 addObject:v23];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
        }
        while (v20);
      }

      v5 = v25;
      id v4 = v26;
      goto LABEL_27;
    }
  }
  else
  {
    uint64_t v17 = 0;
  }
  uint64_t v14 = 0;
LABEL_27:
  v15 = [(MOCategoryShieldPolicy *)[MOWebDomainCategoryShieldPolicy alloc] initWithPolicy:v14 specificCategories:v7 excludedContent:v17];

LABEL_28:
  return v15;
}

+ (BOOL)isValidPersistableRepresentation:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    v5 = [v4 objectForKeyedSubscript:@"categories"];
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        BOOL v16 = 0;
LABEL_31:

        goto LABEL_32;
      }
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v6 = v5;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v23;
LABEL_6:
        uint64_t v10 = 0;
        while (1)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          if (!+[MOCategory isValidPersistableRepresentation:*(void *)(*((void *)&v22 + 1) + 8 * v10)])goto LABEL_25; {
          if (v8 == ++v10)
          }
          {
            uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
            if (v8) {
              goto LABEL_6;
            }
            break;
          }
        }
      }
    }
    id v6 = [v4 objectForKeyedSubscript:@"activities"];
    if (!v6)
    {
      BOOL v16 = 1;
      goto LABEL_30;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v11 = v6;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v19;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v19 != v14) {
              objc_enumerationMutation(v11);
            }
            if (!+[MOWebDomain isValidPersistableRepresentation:](MOWebDomain, "isValidPersistableRepresentation:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18))
            {
              BOOL v16 = 0;
              goto LABEL_29;
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
      BOOL v16 = 1;
LABEL_29:

      goto LABEL_30;
    }
LABEL_25:
    BOOL v16 = 0;
LABEL_30:

    goto LABEL_31;
  }
  BOOL v16 = 0;
LABEL_32:

  return v16;
}

@end