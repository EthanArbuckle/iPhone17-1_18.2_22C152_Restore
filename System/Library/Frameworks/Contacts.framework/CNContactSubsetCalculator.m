@interface CNContactSubsetCalculator
+ (BOOL)_isLabel:(id)a3 subsumableIntoLabel:(id)a4 equivalencies:(id)a5;
+ (BOOL)_isLabeledValue:(id)a3 availableInLabeledValues:(id)a4 claimedIndices:(id)a5 forMultiValueProperty:(id)a6;
+ (BOOL)isContact:(id)a3 subsetOfContact:(id)a4 forMultiValueProperty:(id)a5;
+ (BOOL)isContact:(id)a3 subsetOfContact:(id)a4 forSingleValueProperty:(id)a5;
+ (BOOL)isContact:(id)a3 subsetOfContact:(id)a4 ignoringProperties:(id)a5;
@end

@implementation CNContactSubsetCalculator

+ (BOOL)isContact:(id)a3 subsetOfContact:(id)a4 ignoringProperties:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v27 = v9;
  if (v7 == v8)
  {
    BOOL v24 = 1;
  }
  else
  {
    v10 = v9;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = +[CN writableContactProperties];
    uint64_t v11 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v30;
LABEL_4:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v29 + 1) + 8 * v14);
        v16 = [v15 key];
        char v17 = [v10 containsKey:v16];

        if ((v17 & 1) == 0) {
          break;
        }
LABEL_21:
        if (v12 == ++v14)
        {
          uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
          if (v12) {
            goto LABEL_4;
          }
          goto LABEL_23;
        }
      }
      if (v7)
      {
        v18 = [v15 key];
        v34 = v18;
        v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
        int v20 = [v7 areKeysAvailable:v19];

        if (v8) {
          goto LABEL_10;
        }
      }
      else
      {
        int v20 = 1;
        if (v8)
        {
LABEL_10:
          v21 = [v15 key];
          v33 = v21;
          v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
          int v23 = [v8 areKeysAvailable:v22];

          if (v7)
          {
            v10 = v27;
            if ((v20 ^ v23)) {
              goto LABEL_25;
            }
          }
          else
          {
            v10 = v27;
          }
LABEL_16:
          if ((v20 & v23) == 1)
          {
            if ([v15 isMultiValue])
            {
              if (([a1 isContact:v7 subsetOfContact:v8 forMultiValueProperty:v15] & 1) == 0) {
                goto LABEL_25;
              }
            }
            else if (![a1 isContact:v7 subsetOfContact:v8 forSingleValueProperty:v15])
            {
LABEL_25:
              BOOL v24 = 0;
              goto LABEL_26;
            }
          }
          goto LABEL_21;
        }
      }
      int v23 = 1;
      goto LABEL_16;
    }
LABEL_23:
    BOOL v24 = 1;
LABEL_26:
  }
  return v24;
}

+ (BOOL)isContact:(id)a3 subsetOfContact:(id)a4 forSingleValueProperty:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = [v8 CNValueForContact:v7];
  uint64_t v11 = [v8 CNValueForContact:v9];

  if (([v8 canUnifyValue:v10 withValue:v11] & 1) != 0
    || (+[CNContact emptyContact],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        char v13 = [v8 isEqualIgnoringIdentifiersForContact:v7 other:v12],
        v12,
        (v13 & 1) != 0))
  {
    BOOL v14 = 1;
  }
  else
  {
    v15 = [v8 CNValueForContact:v7];
    BOOL v14 = v15 == 0;
  }
  return v14;
}

+ (BOOL)isContact:(id)a3 subsetOfContact:(id)a4 forMultiValueProperty:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = [v9 CNValueForContact:a3];
  uint64_t v11 = [v9 CNValueForContact:v8];
  uint64_t v12 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        if (!objc_msgSend(a1, "_isLabeledValue:availableInLabeledValues:claimedIndices:forMultiValueProperty:", *(void *)(*((void *)&v20 + 1) + 8 * i), v11, v12, v9, (void)v20))
        {
          BOOL v18 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
  BOOL v18 = 1;
LABEL_11:

  return v18;
}

+ (BOOL)_isLabeledValue:(id)a3 availableInLabeledValues:(id)a4 claimedIndices:(id)a5 forMultiValueProperty:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v13 equivalentLabelSets];
  uint64_t v30 = 0;
  long long v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v15 = [v10 label];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __107__CNContactSubsetCalculator__isLabeledValue_availableInLabeledValues_claimedIndices_forMultiValueProperty___block_invoke;
  v22[3] = &unk_1E56B78A8;
  id v16 = v12;
  id v23 = v16;
  id v29 = a1;
  id v17 = v15;
  id v24 = v17;
  id v18 = v14;
  id v25 = v18;
  id v19 = v13;
  id v26 = v19;
  id v20 = v10;
  id v27 = v20;
  v28 = &v30;
  [v11 enumerateObjectsUsingBlock:v22];
  LOBYTE(v14) = *((unsigned char *)v31 + 24);

  _Block_object_dispose(&v30, 8);
  return (char)v14;
}

uint64_t __107__CNContactSubsetCalculator__isLabeledValue_availableInLabeledValues_claimedIndices_forMultiValueProperty___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  if (([*(id *)(a1 + 32) containsIndex:a3] & 1) == 0)
  {
    id v7 = [v12 label];
    if ([*(id *)(a1 + 80) _isLabel:*(void *)(a1 + 40) subsumableIntoLabel:v7 equivalencies:*(void *)(a1 + 48)])
    {
      id v8 = *(void **)(a1 + 56);
      id v9 = [*(id *)(a1 + 64) value];
      id v10 = [v12 value];
      LODWORD(v8) = [v8 canUnifyValue:v9 withValue:v10];

      if (v8)
      {
        [*(id *)(a1 + 32) addIndex:a3];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
        *a4 = 1;
      }
    }
  }

  return MEMORY[0x1F41817F8]();
}

+ (BOOL)_isLabel:(id)a3 subsumableIntoLabel:(id)a4 equivalencies:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))() & 1) != 0 || ([v7 isEqual:v8])
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    id v11 = +[CNLabeledValue localizedStringForLabel:v7];
    id v12 = +[CNLabeledValue localizedStringForLabel:v8];
    if ([v11 isEqual:v12])
    {
      LOBYTE(v10) = 1;
    }
    else
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v13 = v9;
      uint64_t v10 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        uint64_t v14 = *(void *)v19;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v19 != v14) {
              objc_enumerationMutation(v13);
            }
            id v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            if (objc_msgSend(v16, "containsObject:", v7, (void)v18)
              && ([v16 containsObject:v8] & 1) != 0)
            {
              LOBYTE(v10) = 1;
              goto LABEL_17;
            }
          }
          uint64_t v10 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
LABEL_17:
    }
  }

  return v10;
}

@end