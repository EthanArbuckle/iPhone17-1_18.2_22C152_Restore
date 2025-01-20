@interface NSComparisonPredicate(HKFilterExtension)
- (id)_comparisonFilterWithKeyPath:()HKFilterExtension operatorType:value:dataTypes:isSubpredicate:;
- (id)_quantityTypeFromKeyPath:()HKFilterExtension prefix:;
- (id)hk_filterRepresentationForDataTypes:()HKFilterExtension isSubpredicate:;
@end

@implementation NSComparisonPredicate(HKFilterExtension)

- (id)hk_filterRepresentationForDataTypes:()HKFilterExtension isSubpredicate:
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [a1 leftExpression];
  v8 = [a1 rightExpression];
  unint64_t v9 = [a1 predicateOperatorType];
  v10 = (uint64_t *)MEMORY[0x1E4F1C3C8];
  if ((v9 > 0xA || v9 == 6) && v9 != 99) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unsupported operator type in comparison expression: %@", a1 format];
  }
  uint64_t v11 = [v7 expressionType];
  v12 = v7;
  BOOL v13 = v11 != 3;
  if (v11 == 3 || (uint64_t v14 = [v8 expressionType], v12 = v8, v14 == 3))
  {
    v15 = [v12 keyPath];
  }
  else
  {
    v15 = 0;
    BOOL v13 = 0;
  }
  uint64_t v16 = [v7 expressionType];
  v17 = v7;
  if (v16 && (uint64_t v18 = [v8 expressionType], v17 = v8, v18))
  {
    v37 = 0;
    int v19 = 1;
    if (v15) {
      goto LABEL_13;
    }
  }
  else
  {
    v37 = [v17 constantValue];
    int v19 = 0;
    if (v15) {
      goto LABEL_13;
    }
  }
  [MEMORY[0x1E4F1CA00] raise:*v10, @"Expected key-path in comparison expression: %@", a1 format];
LABEL_13:
  if (v19) {
    [MEMORY[0x1E4F1CA00] raise:*v10, @"Expected constant value in comparison expression: %@", a1 format];
  }
  unint64_t v20 = [a1 predicateOperatorType];
  if (v20 < 4 && v13) {
    unint64_t v20 = qword_19C3D3900[v20];
  }
  v40 = v7;
  v41 = v6;
  unsigned int v39 = a4;
  v38 = v8;
  unint64_t v36 = v20;
  if (hk_filterRepresentationForDataTypes_isSubpredicate__onceToken != -1) {
    dispatch_once(&hk_filterRepresentationForDataTypes_isSubpredicate__onceToken, &__block_literal_global_68);
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v22 = (id)hk_filterRepresentationForDataTypes_isSubpredicate__statsPrefixes;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v43;
    uint64_t v26 = *v10;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v43 != v25) {
          objc_enumerationMutation(v22);
        }
        v28 = *(void **)(*((void *)&v42 + 1) + 8 * v27);
        if ([v15 hasPrefix:v28])
        {
          v29 = [a1 _quantityTypeFromKeyPath:v15 prefix:v28];
          if (!v29) {
            [MEMORY[0x1E4F1CA00] raise:v26, @"Expected quantity type in comparison expression: %@", a1 format];
          }
          if ([v28 isEqualToString:@"sumQuantity"])
          {
            uint64_t v30 = [v29 aggregationStyle];
            v31 = @"Expected discrete statistics in comparison expression: %@";
            if (v30) {
              goto LABEL_32;
            }
          }
          else
          {
            int v32 = [v28 isEqualToString:@"activitySumQuantity"];
            if ([v29 aggregationStyle])
            {
              v31 = @"Expected discrete statistics in comparison expression: %@";
              if (!v32) {
                goto LABEL_33;
              }
            }
            else
            {
              v31 = @"Expected cumulative statistics in comparison expression: %@";
              if (v32) {
                goto LABEL_33;
              }
            }
LABEL_32:
            objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", v26, v31, a1);
          }
LABEL_33:
        }
        ++v27;
      }
      while (v24 != v27);
      uint64_t v33 = [v22 countByEnumeratingWithState:&v42 objects:v46 count:16];
      uint64_t v24 = v33;
    }
    while (v33);
  }

  v34 = [a1 _comparisonFilterWithKeyPath:v15 operatorType:v36 value:v37 dataTypes:v41 isSubpredicate:v39];

  return v34;
}

- (id)_quantityTypeFromKeyPath:()HKFilterExtension prefix:
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 hasPrefix:v6])
  {
    v7 = objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v6, "length") + 1);
    v8 = v7;
    if (v7)
    {
      unint64_t v9 = +[HKQuantityType _quantityTypeWithCode:](HKQuantityType, "_quantityTypeWithCode:", [v7 integerValue]);
    }
    else
    {
      unint64_t v9 = 0;
    }
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (id)_comparisonFilterWithKeyPath:()HKFilterExtension operatorType:value:dataTypes:isSubpredicate:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v14 = HKComparisonFilterClasses();
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = [*(id *)(*((void *)&v23 + 1) + 8 * i) filterForKeyPath:v11 operatorType:a4 value:v12 dataTypes:v13 isSubpredicate:a7];
        if (v19)
        {
          unint64_t v20 = (void *)v19;

          goto LABEL_11;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unsupported key path %@ in comparison expression: %@", v11, a1 format];
  unint64_t v20 = 0;
LABEL_11:

  return v20;
}

@end