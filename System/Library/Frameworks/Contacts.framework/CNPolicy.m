@interface CNPolicy
+ (BOOL)supportsSecureCoding;
- (BOOL)_validateLabeledValueArrayAttributeSupport:(id)a3 forContactProperty:(id)a4 replacementValue:(id *)a5;
- (BOOL)_validateLabeledValueArrayLabels:(id)a3 forContactProperty:(id)a4 replacementValue:(id *)a5;
- (BOOL)isContactPropertySupported:(id)a3;
- (BOOL)isReadonly;
- (BOOL)shouldAddContact:(id)a3;
- (BOOL)shouldRemoveContact:(id)a3;
- (BOOL)shouldSetValue:(id)a3 property:(id)a4 contact:(id)a5 replacementValue:(id *)a6;
- (CNPolicy)initWithCoder:(id)a3;
- (id)_replacementLabeledValue:(id)a3 omittingKeys:(id)a4;
- (id)supportedLabelsForContactProperty:(id)a3;
- (id)unsupportedAttributesForLabeledContactProperty:(id)a3;
- (unint64_t)maximumCountOfValuesForContactProperty:(id)a3;
- (unint64_t)maximumCountOfValuesForContactProperty:(id)a3 label:(id)a4;
@end

@implementation CNPolicy

- (BOOL)isReadonly
{
  return 0;
}

- (unint64_t)maximumCountOfValuesForContactProperty:(id)a3
{
  return 0;
}

- (id)supportedLabelsForContactProperty:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "array", a3);
}

- (unint64_t)maximumCountOfValuesForContactProperty:(id)a3 label:(id)a4
{
  return 0;
}

- (id)unsupportedAttributesForLabeledContactProperty:(id)a3
{
  return 0;
}

- (BOOL)shouldAddContact:(id)a3
{
  return 0;
}

- (BOOL)shouldRemoveContact:(id)a3
{
  return 0;
}

- (BOOL)isContactPropertySupported:(id)a3
{
  return 0;
}

- (BOOL)shouldSetValue:(id)a3 property:(id)a4 contact:(id)a5 replacementValue:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = +[CN contactPropertiesByKey];
  v12 = [v11 objectForKey:v10];

  if (![(CNPolicy *)self isContactPropertySupported:v10]) {
    goto LABEL_5;
  }
  if (![v12 isMultiValue])
  {
    id v14 = 0;
    LOBYTE(v15) = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (unint64_t v13 = [v9 count],
        v13 <= [(CNPolicy *)self maximumCountOfValuesForContactProperty:v10]))
  {
    id v23 = 0;
    BOOL v17 = [(CNPolicy *)self _validateLabeledValueArrayLabels:v9 forContactProperty:v10 replacementValue:&v23];
    id v18 = v23;
    v19 = v18;
    if (!v17 && v18)
    {
      id v20 = v18;

      id v9 = v20;
    }
    id v22 = v19;
    BOOL v21 = [(CNPolicy *)self _validateLabeledValueArrayAttributeSupport:v9 forContactProperty:v10 replacementValue:&v22];
    id v14 = v22;

    int v15 = v17 && v21;
    if (a6 && !v15 && v14)
    {
      id v14 = v14;
      *a6 = v14;
    }
  }
  else
  {
LABEL_5:
    id v14 = 0;
    LOBYTE(v15) = 0;
  }
LABEL_7:

  return v15;
}

- (BOOL)_validateLabeledValueArrayLabels:(id)a3 forContactProperty:(id)a4 replacementValue:(id *)a5
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v37 = a4;
  v34 = -[CNPolicy supportedLabelsForContactProperty:](self, "supportedLabelsForContactProperty:");
  if (![v34 count])
  {
    BOOL v9 = 1;
    goto LABEL_36;
  }
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  if (a5)
  {
    v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v33, "count"));
    v35 = [MEMORY[0x1E4F28E60] indexSet];
  }
  else
  {
    v35 = 0;
    v8 = 0;
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v10 = v34;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v54 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v53 + 1) + 8 * i);
        int v15 = objc_msgSend(NSNumber, "numberWithInteger:", -[CNPolicy maximumCountOfValuesForContactProperty:label:](self, "maximumCountOfValuesForContactProperty:label:", v37, v14));
        [v7 setObject:v15 forKey:v14];
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v11);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  obuint64_t j = v33;
  uint64_t v16 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (!v16)
  {

    int v30 = 1;
    goto LABEL_35;
  }
  uint64_t v17 = *(void *)v50;
  int v18 = 1;
  do
  {
    for (uint64_t j = 0; j != v16; ++j)
    {
      if (*(void *)v50 != v17) {
        objc_enumerationMutation(obj);
      }
      id v20 = *(void **)(*((void *)&v49 + 1) + 8 * j);
      BOOL v21 = [v20 label];
      id v22 = [v7 objectForKey:v21];

      if (v22 && [v22 integerValue])
      {
        if (v8)
        {
          id v23 = [v20 label];
          [v8 addObject:v23];
        }
        v24 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v22, "integerValue") - 1);
        v25 = [v20 label];
        [v7 setObject:v24 forKey:v25];

        goto LABEL_25;
      }
      if (v8)
      {
        objc_msgSend(v35, "addIndex:", objc_msgSend(v8, "count"));
        v24 = [MEMORY[0x1E4F1CA98] null];
        [v8 addObject:v24];
        int v18 = 0;
LABEL_25:

        goto LABEL_27;
      }
      int v18 = 0;
LABEL_27:
    }
    uint64_t v16 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
  }
  while (v16);

  if (v18 & 1 | (a5 == 0))
  {
    int v30 = v18;
  }
  else
  {
    uint64_t v45 = 0;
    v46 = &v45;
    uint64_t v47 = 0x2020000000;
    char v48 = 1;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __81__CNPolicy__validateLabeledValueArrayLabels_forContactProperty_replacementValue___block_invoke;
    v41[3] = &unk_1E56B8B78;
    id v42 = v7;
    id v26 = v8;
    id v43 = v26;
    v44 = &v45;
    [v35 enumerateIndexesUsingBlock:v41];
    if (*((unsigned char *)v46 + 24))
    {
      v27 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(obj, "count"));
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __81__CNPolicy__validateLabeledValueArrayLabels_forContactProperty_replacementValue___block_invoke_2;
      v38[3] = &unk_1E56B5AD0;
      id v39 = v26;
      id v28 = v27;
      id v40 = v28;
      [obj enumerateObjectsUsingBlock:v38];
      id v29 = v28;
      *a5 = v29;
    }
    _Block_object_dispose(&v45, 8);
    int v30 = 0;
  }
LABEL_35:

  BOOL v9 = v30 != 0;
LABEL_36:

  return v9;
}

void __81__CNPolicy__validateLabeledValueArrayLabels_forContactProperty_replacementValue___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__30;
  int v18 = __Block_byref_object_dispose__30;
  id v19 = 0;
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__30;
  uint64_t v12 = __Block_byref_object_dispose__30;
  id v13 = 0;
  v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__CNPolicy__validateLabeledValueArrayLabels_forContactProperty_replacementValue___block_invoke_24;
  v7[3] = &unk_1E56B8B50;
  v7[4] = &v14;
  v7[5] = &v8;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];
  if (v15[5])
  {
    objc_msgSend(*(id *)(a1 + 40), "replaceObjectAtIndex:withObject:", a2);
    v5 = *(void **)(a1 + 32);
    v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend((id)v9[5], "integerValue") - 1);
    [v5 setObject:v6 forKey:v15[5]];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
}

void __81__CNPolicy__validateLabeledValueArrayLabels_forContactProperty_replacementValue___block_invoke_24(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v9 = a2;
  id v8 = a3;
  if ([v8 integerValue] >= 1)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

void __81__CNPolicy__validateLabeledValueArrayLabels_forContactProperty_replacementValue___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  v5 = [v10 label];
  v6 = [*(id *)(a1 + 32) objectAtIndex:a3];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    [*(id *)(a1 + 40) addObject:v10];
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) objectAtIndex:a3];
    id v9 = [v10 labeledValueBySettingLabel:v8];

    [*(id *)(a1 + 40) addObject:v9];
  }
}

- (BOOL)_validateLabeledValueArrayAttributeSupport:(id)a3 forContactProperty:(id)a4 replacementValue:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 1;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__30;
  id v26 = __Block_byref_object_dispose__30;
  id v27 = 0;
  id v10 = [(CNPolicy *)self unsupportedAttributesForLabeledContactProperty:v9];
  uint64_t v11 = v10;
  if (!v10)
  {
    *((unsigned char *)v29 + 24) = 0;
    if (!a5) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if ([v10 count])
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __91__CNPolicy__validateLabeledValueArrayAttributeSupport_forContactProperty_replacementValue___block_invoke;
    v15[3] = &unk_1E56B8BA0;
    id v16 = v11;
    id v19 = &v28;
    BOOL v21 = a5 != 0;
    id v20 = &v22;
    id v17 = v8;
    int v18 = self;
    [v17 enumerateObjectsUsingBlock:v15];
  }
  if (a5)
  {
LABEL_7:
    uint64_t v12 = (void *)v23[5];
    if (v12) {
      *a5 = v12;
    }
  }
LABEL_9:
  char v13 = *((unsigned char *)v29 + 24);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v13;
}

void __91__CNPolicy__validateLabeledValueArrayAttributeSupport_forContactProperty_replacementValue___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v7, "value", (void)v23);
        int v15 = [v14 valueForKey:v13];

        if (v15)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
          if (*(unsigned char *)(a1 + 72))
          {
            if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
            {
              uint64_t v16 = [*(id *)(a1 + 40) mutableCopy];
              uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
              int v18 = *(void **)(v17 + 40);
              *(void *)(v17 + 40) = v16;
            }
          }
          else
          {
            *a4 = 1;
          }
          id v19 = [*(id *)(a1 + 48) _replacementLabeledValue:v7 omittingKeys:*(void *)(a1 + 32)];
          if (v19)
          {
            id v20 = [v7 labeledValueBySettingValue:v19];
            [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) replaceObjectAtIndex:a3 withObject:v20];
          }
          else
          {
            uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8);
            uint64_t v22 = *(void **)(v21 + 40);
            *(void *)(v21 + 40) = 0;

            *a4 = 1;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }
}

- (id)_replacementLabeledValue:(id)a3 omittingKeys:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 value];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [v5 value];
    uint64_t v10 = (void *)[v9 mutableCopy];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(v10, "setValue:forKey:", 0, *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNPolicy)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CNPolicy;
  v3 = [(CNPolicy *)&v7 init];
  v4 = v3;
  if (v3) {
    id v5 = v3;
  }

  return v4;
}

@end