@interface HFMediaStatusItem
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HFMediaStatusItem

- (id)_subclass_updateWithOptions:(id)a3
{
  v44[1] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263EFFA08];
  v5 = [(HFStatusItem *)self home];
  v6 = objc_msgSend(v5, "hf_allUniqueMediaProfileContainers");
  v7 = [v4 setWithArray:v6];

  v8 = [(HFStatusItem *)self room];

  if (v8)
  {
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __49__HFMediaStatusItem__subclass_updateWithOptions___block_invoke;
    v42[3] = &unk_264090270;
    v42[4] = self;
    v9 = v42;
  }
  else
  {
    v9 = &__block_literal_global_42;
  }
  v10 = objc_msgSend(v7, "na_filter:", v9);

  if ([v10 count])
  {
    v11 = objc_msgSend(v10, "na_filter:", &__block_literal_global_6_0);
    v12 = objc_msgSend(v11, "na_filter:", &__block_literal_global_8_0);
    v13 = [MEMORY[0x263EFFA08] set];
    uint64_t v14 = [v12 count];
    if (v14)
    {
      id v15 = v12;

      v16 = &unk_26C0F6270;
      uint64_t v17 = 2;
      v13 = v15;
    }
    else
    {
      uint64_t v17 = [v11 count] != 0;
      v16 = &unk_26C0F6288;
    }
    v20 = [MEMORY[0x263EFF9A0] dictionary];
    v21 = [NSNumber numberWithInteger:v17];
    [v20 setObject:v21 forKeyedSubscript:@"state"];

    [v20 setObject:v16 forKeyedSubscript:@"priority"];
    if ((unint64_t)[v13 count] > 1)
    {
      uint64_t v22 = [v13 count];
      HFLocalizedStringWithFormat(@"HFStatusTitleSpeaker_Multiple", @"%lu", v23, v24, v25, v26, v27, v28, v22);
    }
    else
    {
      _HFLocalizedStringWithDefaultValue(@"HFStatusTitleSpeaker_One", @"HFStatusTitleSpeaker_One", 1);
    v29 = };
    [v20 setObject:v29 forKeyedSubscript:@"title"];

    if (v14) {
      v30 = @"HFStatusDescriptionSpeaker_Playing";
    }
    else {
      v30 = @"HFStatusDescriptionSpeaker_NotPlaying";
    }
    if (v14) {
      v31 = @"hifispeaker.fill";
    }
    else {
      v31 = @"hifispeaker";
    }
    v32 = _HFLocalizedStringWithDefaultValue(v30, v30, 1);
    [v20 setObject:v32 forKeyedSubscript:@"description"];

    v33 = [MEMORY[0x263F1C6C8] configurationWithPointSize:24.0];
    v34 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:v31 configuration:v33];
    [v20 setObject:v34 forKeyedSubscript:@"icon"];

    [v20 setObject:v13 forKeyedSubscript:@"representedHomeKitObjects"];
    if (!v14) {
      [v20 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hidden"];
    }
    v35 = [MEMORY[0x263EFF9C0] set];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __49__HFMediaStatusItem__subclass_updateWithOptions___block_invoke_36;
    v40[3] = &unk_2640902B8;
    id v41 = v35;
    id v36 = v35;
    objc_msgSend(v10, "na_each:", v40);
    [v20 setObject:v36 forKeyedSubscript:@"dependentHomeKitObjects"];
    v37 = (void *)MEMORY[0x263F58190];
    v38 = +[HFItemUpdateOutcome outcomeWithResults:v20];
    v19 = [v37 futureWithResult:v38];
  }
  else
  {
    v18 = (void *)MEMORY[0x263F58190];
    v43 = @"hidden";
    v44[0] = MEMORY[0x263EFFA88];
    v11 = [NSDictionary dictionaryWithObjects:v44 forKeys:&v43 count:1];
    v12 = +[HFItemUpdateOutcome outcomeWithResults:v11];
    v19 = [v18 futureWithResult:v12];
  }

  return v19;
}

uint64_t __49__HFMediaStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 accessories];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__HFMediaStatusItem__subclass_updateWithOptions___block_invoke_2;
  v6[3] = &unk_26408D968;
  v6[4] = *(void *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

BOOL __49__HFMediaStatusItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 room];
  uint64_t v4 = [*(id *)(a1 + 32) room];
  BOOL v5 = v3 == v4;

  return v5;
}

uint64_t __49__HFMediaStatusItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isVisibleInHomeStatus");
}

uint64_t __49__HFMediaStatusItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isReachable");
}

BOOL __49__HFMediaStatusItem__subclass_updateWithOptions___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = [a2 mediaSession];
  BOOL v3 = [v2 playbackState] == 1;

  return v3;
}

void __49__HFMediaStatusItem__subclass_updateWithOptions___block_invoke_36(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  BOOL v5 = [v4 accessories];
  [v3 unionSet:v5];

  v6 = *(void **)(a1 + 32);
  v7 = [v4 mediaProfiles];
  [v6 unionSet:v7];

  v8 = *(void **)(a1 + 32);
  id v9 = [v4 mediaSession];

  objc_msgSend(v8, "na_safeAddObject:", v9);
}

@end