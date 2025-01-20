@interface HFSymptomStatusItem
- (HMSymptom)symptom;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HFSymptomStatusItem

BOOL __51__HFSymptomStatusItem__subclass_updateWithOptions___block_invoke_2(id *a1, void *a2)
{
  id v4 = a2;
  v5 = [v4 mediaProfile];

  if (v5)
  {
    v2 = [v4 mediaProfile];
    BOOL v6 = +[HFMediaHelper isContainedWithinMediaSystem:v2];
  }
  else
  {
    BOOL v6 = 0;
  }
  v7 = [a1[4] room];
  if (v7)
  {
    v2 = [v4 room];
    a1 = [a1[4] room];
    if (![v2 isEqual:a1])
    {
      BOOL v6 = 1;
LABEL_10:

      goto LABEL_11;
    }
  }
  v8 = [v4 symptomsHandler];
  v9 = [v8 symptoms];
  if (![v9 count]) {
    BOOL v6 = 1;
  }

  if (v7) {
    goto LABEL_10;
  }
LABEL_11:

  return !v6;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFFA08];
  v5 = [(HFStatusItem *)self home];
  BOOL v6 = [v5 mediaSystems];
  v7 = [v4 setWithArray:v6];
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __51__HFSymptomStatusItem__subclass_updateWithOptions___block_invoke;
  v49[3] = &unk_2640913C0;
  v49[4] = self;
  v8 = objc_msgSend(v7, "na_filter:", v49);

  v9 = (void *)MEMORY[0x263EFFA08];
  v10 = [(HFStatusItem *)self home];
  v11 = [v10 accessories];
  v12 = [v9 setWithArray:v11];
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __51__HFSymptomStatusItem__subclass_updateWithOptions___block_invoke_2;
  v48[3] = &unk_26408D968;
  v48[4] = self;
  v13 = objc_msgSend(v12, "na_filter:", v48);

  v14 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __51__HFSymptomStatusItem__subclass_updateWithOptions___block_invoke_2_5;
  v46[3] = &unk_26408F388;
  id v15 = v14;
  id v47 = v15;
  objc_msgSend(v13, "na_each:", v46);
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __51__HFSymptomStatusItem__subclass_updateWithOptions___block_invoke_3;
  v44[3] = &unk_264096650;
  id v16 = v15;
  id v45 = v16;
  objc_msgSend(v8, "na_each:", v44);
  v17 = objc_msgSend(MEMORY[0x263F0E830], "hf_symptomArraySortComparator");
  v18 = [v16 keyEnumerator];
  v19 = [v18 allObjects];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __51__HFSymptomStatusItem__subclass_updateWithOptions___block_invoke_5;
  v42[3] = &unk_264096678;
  id v20 = v17;
  id v43 = v20;
  v21 = [v19 sortedArrayUsingComparator:v42];

  v22 = [v21 firstObject];
  v23 = objc_msgSend(v22, "hf_symptomsSortedByPriority");
  v24 = [v23 firstObject];

  v25 = objc_alloc_init(HFMutableItemUpdateOutcome);
  v26 = (void *)MEMORY[0x263EFFA08];
  uint64_t v27 = objc_opt_class();
  v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
  [(HFMutableItemUpdateOutcome *)v25 setObject:v28 forKeyedSubscript:@"dependentHomeKitClasses"];

  uint64_t v29 = [v24 type];
  if (v29 == 12
    || v29 == 15
    || v29 == 1000
    || (objc_msgSend(v24, "hf_shortDescription"), (uint64_t v30 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    [(HFMutableItemUpdateOutcome *)v25 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hidden"];
  }
  else
  {
    v39 = (void *)v30;
    v31 = [MEMORY[0x263EFF9C0] set];
    [v31 unionSet:v13];
    [v31 unionSet:v8];
    [(HFMutableItemUpdateOutcome *)v25 setObject:v31 forKeyedSubscript:@"representedHomeKitObjects"];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __51__HFSymptomStatusItem__subclass_updateWithOptions___block_invoke_6;
    v40[3] = &unk_264091DC0;
    id v38 = v24;
    id v41 = v38;
    v32 = objc_msgSend(v31, "na_filter:", v40);
    [(HFMutableItemUpdateOutcome *)v25 setObject:v32 forKeyedSubscript:@"statusRepresentedHomeKitObjects"];

    v37 = [MEMORY[0x263F1C6C8] configurationWithPointSize:24.0];
    v33 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:@"exclamationmark.circle.fill" configuration:v37];
    [(HFMutableItemUpdateOutcome *)v25 setObject:v33 forKeyedSubscript:@"icon"];

    [(HFMutableItemUpdateOutcome *)v25 setObject:v39 forKeyedSubscript:@"title"];
    [(HFMutableItemUpdateOutcome *)v25 setObject:&unk_26C0F6BD0 forKeyedSubscript:@"statusItemCategory"];
    v34 = _HFLocalizedStringWithDefaultValue(@"HFStatusSortKeySymptoms", @"HFStatusSortKeySymptoms", 1);
    [(HFMutableItemUpdateOutcome *)v25 setObject:v34 forKeyedSubscript:@"sortKey"];

    [(HFMutableItemUpdateOutcome *)v25 setObject:&unk_26C0F6BE8 forKeyedSubscript:@"priority"];
    [(HFMutableItemUpdateOutcome *)v25 setObject:v38 forKeyedSubscript:@"symptom"];
  }
  v35 = [MEMORY[0x263F58190] futureWithResult:v25];

  return v35;
}

uint64_t __51__HFSymptomStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 accessories];
  char v5 = objc_msgSend(v4, "na_any:", &__block_literal_global_121);

  if (v5)
  {
    uint64_t v6 = 1;
  }
  else
  {
    v7 = [v3 symptoms];
    uint64_t v6 = [v7 count] != 0;
  }
  v8 = HFLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v3 symptoms];
    v15[0] = 67109378;
    v15[1] = v6;
    __int16 v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Media system has symptoms handler: %d, with symptoms: %@", (uint8_t *)v15, 0x12u);
  }
  v10 = [*(id *)(a1 + 32) room];
  if (v10)
  {
    v11 = objc_msgSend(v3, "hf_parentRoom");
    v12 = [*(id *)(a1 + 32) room];
    int v13 = [v11 isEqual:v12];

    uint64_t v6 = v13 & v6;
  }

  return v6;
}

BOOL __51__HFSymptomStatusItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 symptomsHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

void __51__HFSymptomStatusItem__subclass_updateWithOptions___block_invoke_2_5(uint64_t a1, void *a2)
{
  id v7 = a2;
  BOOL v3 = [v7 mediaProfile];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    char v5 = [v7 mediaProfile];
    uint64_t v6 = [v7 symptomsHandler];
    [v4 setObject:v5 forKey:v6];
  }
}

void __51__HFSymptomStatusItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 accessories];
  objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_8_4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  char v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v7 symptomsHandler];
  [v5 setObject:v3 forKey:v6];
}

BOOL __51__HFSymptomStatusItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 symptomsHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __51__HFSymptomStatusItem__subclass_updateWithOptions___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = objc_msgSend(a2, "hf_symptomsSortedByPriority");
  id v7 = objc_msgSend(v5, "hf_symptomsSortedByPriority");

  uint64_t v8 = *(void *)(a1 + 32);
  v9 = [v6 firstObject];
  v10 = [v7 firstObject];
  uint64_t v11 = (*(uint64_t (**)(uint64_t, void *, void *))(v8 + 16))(v8, v9, v10);

  return v11;
}

uint64_t __51__HFSymptomStatusItem__subclass_updateWithOptions___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = [v6 symptomsHandler];
    id v8 = v7;
  }
  else
  {
    objc_opt_class();
    id v8 = v4;
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    id v10 = v9;

    if (!v10)
    {
      id v8 = 0;
      uint64_t v12 = 0;
      goto LABEL_12;
    }
    id v7 = v10;
  }
  uint64_t v11 = [v7 symptoms];
  uint64_t v12 = [v11 containsObject:*(void *)(a1 + 32)];

LABEL_12:
  return v12;
}

- (HMSymptom)symptom
{
  return self->_symptom;
}

- (void).cxx_destruct
{
}

@end