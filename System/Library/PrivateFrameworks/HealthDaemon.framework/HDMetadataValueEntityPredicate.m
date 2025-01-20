@interface HDMetadataValueEntityPredicate
+ (id)_predicateWithMetadataKey:(void *)a3 valuesWithinRange:;
+ (id)predicateWithMetadataKey:(id)a3 allowedValues:(id)a4;
+ (id)predicateWithMetadataKey:(id)a3 exists:(BOOL)a4;
+ (id)predicateWithMetadataKey:(id)a3 value:(id)a4 operatorType:(unint64_t)a5;
+ (void)_predicateWithMetadataKey:(char)a3 exists:;
+ (void)_predicateWithMetadataKey:(void *)a3 allowedValues:;
+ (void)_predicateWithMetadataKey:(void *)a3 value:(uint64_t)a4 operatorType:;
- (NSString)description;
- (id)SQLForEntityClass:(Class)a3;
- (id)_valuePredicateForValue:(uint64_t)a3 operatorType:;
- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4;
@end

@implementation HDMetadataValueEntityPredicate

+ (id)predicateWithMetadataKey:(id)a3 allowedValues:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = HKMetadataAliasesForKey();
  unint64_t v9 = 0x1E4F1C000uLL;
  if ([v8 count])
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v11 = +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:allowedValues:]((uint64_t)a1, v6, v7);
    [v10 addObject:v11];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v30 = v8;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v35 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          v18 = [v12 objectForKeyedSubscript:v17];
          v19 = +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:allowedValues:]((uint64_t)a1, v17, v18);
          [v10 addObject:v19];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v14);
    }

    v20 = [MEMORY[0x1E4F65D08] predicateMatchingAnyPredicates:v10];

    v8 = v30;
    unint64_t v9 = 0x1E4F1C000;
  }
  else
  {
    v20 = 0;
  }
  v21 = HKMetadataAliasRangesForKey();
  if (![v21 count])
  {
    if (v20)
    {
      v25 = 0;
      goto LABEL_18;
    }
    goto LABEL_24;
  }
  id v22 = objc_alloc_init(*(Class *)(v9 + 2632));
  v23 = +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:allowedValues:]((uint64_t)a1, v6, v7);
  [v22 addObject:v23];

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __73__HDMetadataValueEntityPredicate_predicateWithMetadataKey_allowedValues___block_invoke;
  v31[3] = &unk_1E62FF9C8;
  id v32 = v22;
  id v33 = a1;
  id v24 = v22;
  [v21 enumerateKeysAndObjectsUsingBlock:v31];
  v25 = [MEMORY[0x1E4F65D08] predicateMatchingAnyPredicates:v24];

  if (v20 && v25)
  {
    v26 = (void *)MEMORY[0x1E4F65D08];
    v38[0] = v20;
    v38[1] = v25;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
    id v28 = [v26 predicateMatchingAnyPredicates:v27];

LABEL_19:
    v25 = v28;
    goto LABEL_20;
  }
  if (v20)
  {
LABEL_18:
    id v28 = v20;
    goto LABEL_19;
  }
  if (!v25)
  {
LABEL_24:
    v25 = +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:allowedValues:]((uint64_t)a1, v6, v7);
  }
LABEL_20:

  return v25;
}

+ (void)_predicateWithMetadataKey:(void *)a3 allowedValues:
{
  id v4 = a3;
  id v5 = a2;
  self;
  id v6 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v7 = HDMetadataKeyPredicateForKey((uint64_t)v5);

  v8 = (void *)v6[1];
  v6[1] = v7;

  uint64_t v9 = -[HDMetadataValueEntityPredicate _valuePredicateForValue:operatorType:]((uint64_t)v6, v4, 10);

  id v10 = (void *)v6[2];
  v6[2] = v9;

  *((unsigned char *)v6 + 24) = 0;

  return v6;
}

void __73__HDMetadataValueEntityPredicate_predicateWithMetadataKey_allowedValues___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(a1 + 32);
        id v12 = +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:valuesWithinRange:](*(void *)(a1 + 40), v5, *(void **)(*((void *)&v13 + 1) + 8 * v10));
        [v11 addObject:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

+ (id)_predicateWithMetadataKey:(void *)a3 valuesWithinRange:
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = self;
  uint64_t v7 = [v4 minValue];
  uint64_t v8 = +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:value:operatorType:](v6, v5, v7, 3);

  uint64_t v9 = [v4 maxValue];

  uint64_t v10 = +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:value:operatorType:](v6, v5, v9, 0);

  v11 = (void *)MEMORY[0x1E4F65D08];
  v15[0] = v8;
  v15[1] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  long long v13 = [v11 predicateMatchingAllPredicates:v12];

  return v13;
}

+ (id)predicateWithMetadataKey:(id)a3 value:(id)a4 operatorType:(unint64_t)a5
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v9) {
    [MEMORY[0x1E4F1CAD0] setWithObject:v9];
  }
  else {
  uint64_t v10 = [MEMORY[0x1E4F1CAD0] set];
  }
  v11 = HKMetadataAliasesForKey();
  v46 = (void *)v10;
  v47 = v8;
  v49 = v11;
  id v50 = v9;
  if ([v11 count])
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v13 = +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:value:operatorType:]((uint64_t)a1, v8, v9, a5);
    [v12 addObject:v13];

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v14 = v11;
    uint64_t v52 = [v14 countByEnumeratingWithState:&v58 objects:v72 count:16];
    if (v52)
    {
      uint64_t v15 = *(void *)v59;
      id v48 = v14;
      uint64_t v51 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v52; ++i)
        {
          if (*(void *)v59 != v15) {
            objc_enumerationMutation(v14);
          }
          v17 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          uint64_t v18 = objc_msgSend(v14, "objectForKeyedSubscript:", v17, v46);
          uint64_t v19 = [v18 count];
          v53 = v18;
          if (v9 || v19)
          {
            long long v56 = 0u;
            long long v57 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            id v20 = v18;
            uint64_t v21 = [v20 countByEnumeratingWithState:&v54 objects:v71 count:16];
            if (v21)
            {
              uint64_t v22 = v21;
              uint64_t v23 = *(void *)v55;
              do
              {
                for (uint64_t j = 0; j != v22; ++j)
                {
                  if (*(void *)v55 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  v25 = +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:value:operatorType:]((uint64_t)a1, v17, *(void **)(*((void *)&v54 + 1) + 8 * j), a5);
                  [v12 addObject:v25];
                }
                uint64_t v22 = [v20 countByEnumeratingWithState:&v54 objects:v71 count:16];
              }
              while (v22);
              v11 = v49;
              id v9 = v50;
              id v14 = v48;
            }
            uint64_t v15 = v51;
          }
          else
          {
            +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:value:operatorType:]((uint64_t)a1, v17, 0, a5);
            id v20 = (id)objc_claimAutoreleasedReturnValue();
            [v12 addObject:v20];
          }
        }
        uint64_t v52 = [v14 countByEnumeratingWithState:&v58 objects:v72 count:16];
      }
      while (v52);
    }

    if (v9 && a5 == 5)
    {
      uint64_t v26 = [MEMORY[0x1E4F65D08] predicateMatchingAllPredicates:v12];
    }
    else
    {
      uint64_t v26 = objc_msgSend(MEMORY[0x1E4F65D08], "predicateMatchingAnyPredicates:", v12, v46);
    }
    v27 = (void *)v26;

    id v8 = v47;
  }
  else
  {
    v27 = 0;
  }
  id v28 = HKMetadataAliasRangesForKey();
  if (![v28 count])
  {
    if (v27)
    {
      id v33 = 0;
LABEL_51:
      id v43 = v27;

      id v33 = v43;
      goto LABEL_56;
    }
    goto LABEL_55;
  }
  id v29 = v28;
  uint64_t v30 = self;
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __84__HDMetadataValueEntityPredicate__predicateWithMetadataKeyAliasRanges_operatorType___block_invoke;
  v62[3] = &unk_1E62FF9F0;
  id v63 = v31;
  unint64_t v64 = a5;
  uint64_t v65 = v30;
  v66 = sel__predicateWithMetadataKeyAliasRanges_operatorType_;
  id v32 = v31;
  [v29 enumerateKeysAndObjectsUsingBlock:v62];

  if (a5 == 5) {
    [MEMORY[0x1E4F65D08] predicateMatchingAllPredicates:v32];
  }
  else {
  long long v34 = [MEMORY[0x1E4F65D08] predicateMatchingAnyPredicates:v32];
  }

  uint64_t v35 = +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:value:operatorType:]((uint64_t)a1, v8, v9, a5);
  long long v36 = (void *)v35;
  if (v9) {
    BOOL v37 = a5 == 5;
  }
  else {
    BOOL v37 = 0;
  }
  int v38 = v37;
  v39 = (void *)MEMORY[0x1E4F65D08];
  if (v37)
  {
    v70[0] = v34;
    v70[1] = v35;
    uint64_t v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:2];
    [v39 predicateMatchingAllPredicates:v40];
  }
  else
  {
    v69[0] = v34;
    v69[1] = v35;
    uint64_t v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:2];
    [v39 predicateMatchingAnyPredicates:v40];
  id v33 = };

  if (v27 && v33)
  {
    v41 = (void *)MEMORY[0x1E4F65D08];
    id v9 = v50;
    if (v38)
    {
      v68[0] = v27;
      v68[1] = v33;
      v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:2];
      [v41 predicateMatchingAllPredicates:v42];
    }
    else
    {
      v67[0] = v27;
      v67[1] = v33;
      v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];
      [v41 predicateMatchingAnyPredicates:v42];
    uint64_t v44 = };

    id v33 = (void *)v44;
    v11 = v49;
    goto LABEL_56;
  }
  id v9 = v50;
  if (v27)
  {
    v11 = v49;
    goto LABEL_51;
  }
  v11 = v49;
  if (!v33)
  {
LABEL_55:
    id v33 = +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:value:operatorType:]((uint64_t)a1, v47, v9, a5);
  }
LABEL_56:

  return v33;
}

+ (void)_predicateWithMetadataKey:(void *)a3 value:(uint64_t)a4 operatorType:
{
  id v6 = a3;
  id v7 = a2;
  self;
  id v8 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v9 = HDMetadataKeyPredicateForKey((uint64_t)v7);

  uint64_t v10 = (void *)v8[1];
  v8[1] = v9;

  uint64_t v11 = -[HDMetadataValueEntityPredicate _valuePredicateForValue:operatorType:]((uint64_t)v8, v6, a4);
  id v12 = (void *)v8[2];
  v8[2] = v11;

  if (v6) {
    BOOL v13 = a4 == 5;
  }
  else {
    BOOL v13 = 0;
  }
  char v14 = v13;
  *((unsigned char *)v8 + 24) = v14;

  return v8;
}

void __84__HDMetadataValueEntityPredicate__predicateWithMetadataKeyAliasRanges_operatorType___block_invoke(void *a1, void *a2, void *a3)
{
  v43[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v38;
    uint64_t v35 = v5;
    uint64_t v36 = *(void *)v38;
    id v32 = v6;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v37 + 1) + 8 * v10);
        switch(a1[5])
        {
          case 0:
          case 3:
            id v12 = (void *)a1[4];
            uint64_t v13 = a1[6];
            char v14 = [*(id *)(*((void *)&v37 + 1) + 8 * v10) minValue];
            goto LABEL_9;
          case 1:
          case 2:
            id v12 = (void *)a1[4];
            uint64_t v13 = a1[6];
            char v14 = [*(id *)(*((void *)&v37 + 1) + 8 * v10) maxValue];
LABEL_9:
            uint64_t v15 = v14;
            long long v16 = +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:value:operatorType:](v13, v5, v14, a1[5]);
            [v12 addObject:v16];

            break;
          case 4:
            id v29 = (void *)a1[4];
            uint64_t v15 = +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:valuesWithinRange:](a1[6], v5, *(void **)(*((void *)&v37 + 1) + 8 * v10));
            uint64_t v30 = v29;
            uint64_t v9 = v36;
            [v30 addObject:v15];
            break;
          case 5:
            id v33 = (void *)MEMORY[0x1E4F65D08];
            long long v34 = (void *)a1[4];
            uint64_t v15 = +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:exists:](a1[6], v5, 0);
            v41[0] = v15;
            id v17 = v11;
            id v18 = v35;
            uint64_t v19 = self;
            id v20 = [v17 minValue];
            uint64_t v21 = +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:value:operatorType:](v19, v18, v20, 0);

            uint64_t v22 = [v17 maxValue];

            uint64_t v23 = +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:value:operatorType:](v19, v18, v22, 3);

            uint64_t v9 = v36;
            id v24 = (void *)MEMORY[0x1E4F65D08];
            v43[0] = v21;
            v43[1] = v23;
            v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
            uint64_t v26 = [v24 predicateMatchingAnyPredicates:v25];

            v41[1] = v26;
            v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
            id v28 = [v33 predicateMatchingAnyPredicates:v27];
            [v34 addObject:v28];

            id v5 = v35;
            id v6 = v32;

            break;
          default:
            uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
            [v15 handleFailureInMethod:a1[7] object:a1[6] file:@"HDMetadataValueEntity.m" lineNumber:455 description:@"Unsupported operator type for aliased value range"];
            break;
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v31 = [v6 countByEnumeratingWithState:&v37 objects:v42 count:16];
      uint64_t v8 = v31;
    }
    while (v31);
  }
}

+ (void)_predicateWithMetadataKey:(char)a3 exists:
{
  id v4 = a2;
  self;
  id v5 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v6 = HDMetadataKeyPredicateForKey((uint64_t)v4);

  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = (void *)v5[2];
  v5[2] = 0;

  *((unsigned char *)v5 + 24) = a3 ^ 1;

  return v5;
}

+ (id)predicateWithMetadataKey:(id)a3 exists:(BOOL)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = HKMetadataAliasesForKey();
  uint64_t v8 = [v7 allKeys];

  uint64_t v9 = HKMetadataAliasRangesForKey();
  uint64_t v10 = [v9 allKeys];

  uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
  id v12 = [v8 arrayByAddingObjectsFromArray:v10];
  uint64_t v13 = [v11 setWithArray:v12];

  if ([v13 count])
  {
    id v24 = v10;
    v25 = v8;
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v15 = +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:exists:]((uint64_t)a1, v6, a4);
    [v14 addObject:v15];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v16 = v13;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:exists:]((uint64_t)a1, *(void **)(*((void *)&v26 + 1) + 8 * i), a4);
          [v14 addObject:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v18);
    }

    if (a4) {
      [MEMORY[0x1E4F65D08] predicateMatchingAnyPredicates:v14];
    }
    else {
    uint64_t v22 = [MEMORY[0x1E4F65D08] predicateMatchingAllPredicates:v14];
    }
    uint64_t v10 = v24;
    uint64_t v8 = v25;
  }
  else
  {
    uint64_t v22 = +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:exists:]((uint64_t)a1, v6, a4);
  }

  return v22;
}

- (id)_valuePredicateForValue:(uint64_t)a3 operatorType:
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    if (a3 == 10)
    {
      HDPredicateForMetadataValues(v5);
    }
    else
    {
      uint64_t v7 = HDSQLiteComparisonTypeForPredicateOperator();
      HDPredicateForMetadataValue(v6, v7);
    uint64_t v8 = };
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)SQLForEntityClass:(Class)a3
{
  id v4 = (void *)[(objc_class *)a3 entityClassForEnumeration];
  uint64_t v5 = *MEMORY[0x1E4F65C70];
  id v6 = [v4 disambiguatedSQLForProperty:*MEMORY[0x1E4F65C70]];
  uint64_t v19 = +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:@"object_id"];
  uint64_t v7 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  uint64_t v18 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  uint64_t v8 = +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:@"key_id"];
  uint64_t v9 = +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:v5];
  uint64_t v10 = [(HDSQLitePredicate *)self->_keyPredicate SQLForEntityClass:objc_opt_class()];
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", @"(");
  valuePredicate = self->_valuePredicate;
  if (!valuePredicate)
  {
    uint64_t v15 = (void *)v18;
    id v14 = (void *)v19;
    goto LABEL_9;
  }
  uint64_t v13 = [(HDSQLitePredicate *)valuePredicate SQLForEntityClass:objc_opt_class()];
  [v11 appendFormat:@"EXISTS (SELECT 1 FROM %@ INNER JOIN %@ ON %@=%@ WHERE ((%@=%@) AND %@ AND (%@)))", v7, v18, v8, v9, v6, v19, v10, v13];

  if (self->_matchObjectsWithoutKey) {
    [v11 appendString:@" OR "];
  }
  if (!self->_valuePredicate)
  {
    id v14 = (void *)v19;
    uint64_t v15 = (void *)v18;
    goto LABEL_9;
  }
  id v14 = (void *)v19;
  uint64_t v15 = (void *)v18;
  if (self->_matchObjectsWithoutKey)
  {
LABEL_9:
    if (self->_matchObjectsWithoutKey) {
      id v16 = @"NOT EXISTS";
    }
    else {
      id v16 = @"EXISTS";
    }
    [v11 appendFormat:@"%@ (SELECT 1 FROM %@ INNER JOIN %@ ON %@=%@ WHERE ((%@=%@) AND %@))", v16, v7, v15, v8, v9, v6, v14, v10];
  }
  [v11 appendString:@""]);

  return v11;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  -[HDSQLitePredicate bindToStatement:bindingIndex:](self->_keyPredicate, "bindToStatement:bindingIndex:");
  valuePredicate = self->_valuePredicate;
  if (valuePredicate)
  {
    [(HDSQLitePredicate *)valuePredicate bindToStatement:a3 bindingIndex:a4];
    if (self->_matchObjectsWithoutKey)
    {
      keyPredicate = self->_keyPredicate;
      [(HDSQLitePredicate *)keyPredicate bindToStatement:a3 bindingIndex:a4];
    }
  }
}

- (NSString)description
{
  valuePredicate = self->_valuePredicate;
  if (valuePredicate)
  {
    if (self->_matchObjectsWithoutKey)
    {
      id v4 = NSString;
      uint64_t v5 = [(HDSQLitePredicate *)valuePredicate description];
      id v6 = [v4 stringWithFormat:@"(key does not exist OR %@)", v5];

      goto LABEL_10;
    }
    uint64_t v8 = [(HDSQLitePredicate *)valuePredicate description];
  }
  else
  {
    if (self->_matchObjectsWithoutKey) {
      uint64_t v7 = @"does not exist";
    }
    else {
      uint64_t v7 = @"exists";
    }
    uint64_t v8 = [NSString stringWithFormat:@"(key %@)", v7];
  }
  id v6 = (void *)v8;
LABEL_10:
  uint64_t v9 = NSString;
  uint64_t v10 = [(HDSQLitePredicate *)self->_keyPredicate description];
  uint64_t v11 = [v9 stringWithFormat:@"<metadata: %@ AND %@>", v10, v6];

  return (NSString *)v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valuePredicate, 0);

  objc_storeStrong((id *)&self->_keyPredicate, 0);
}

@end