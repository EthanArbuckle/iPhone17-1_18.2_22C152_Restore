@interface HREUtilities
+ (id)accessoryCategoryAnalyticsDescription:(id)a3;
@end

@implementation HREUtilities

+ (id)accessoryCategoryAnalyticsDescription:(id)a3
{
  id v3 = a3;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __54__HREUtilities_accessoryCategoryAnalyticsDescription___block_invoke;
  v24[3] = &unk_264CF4908;
  id v4 = v3;
  id v25 = v4;
  v5 = (uint64_t (**)(void))MEMORY[0x237E2AE20](v24);
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = __54__HREUtilities_accessoryCategoryAnalyticsDescription___block_invoke_3;
  v22 = &unk_264CF4908;
  id v6 = v4;
  id v23 = v6;
  v7 = (uint64_t (**)(void))MEMORY[0x237E2AE20](&v19);
  v8 = objc_msgSend(v6, "accessories", v19, v20, v21, v22);
  v9 = objc_msgSend(v8, "na_map:", &__block_literal_global_11_0);

  if ([v9 count] == 1)
  {
    id v10 = [v9 anyObject];
  }
  else
  {
    id v10 = 0;
  }
  if (v5[2](v5))
  {
    v11 = @"MixedServiceGroup";
    if (!v10) {
      goto LABEL_15;
    }
  }
  else if (v7[2](v7))
  {
    v11 = @"MixedMediaAccessory";
    if (!v10) {
      goto LABEL_15;
    }
  }
  else if (v10)
  {
    v11 = 0;
  }
  else
  {
    id v10 = (id)*MEMORY[0x263F0B0D0];
    v11 = 0;
    if (!v10)
    {
LABEL_15:
      v15 = 0;
      goto LABEL_18;
    }
  }
  v12 = objc_msgSend(MEMORY[0x263F0DF00], "hf_getUserFriendlyDescriptionKey:", v10);
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x263F0E708], "hf_getUserFriendlyDescriptionKey:", v10);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

LABEL_18:
  if (v15) {
    v16 = v15;
  }
  else {
    v16 = v11;
  }
  v17 = v16;

  return v17;
}

uint64_t __54__HREUtilities_accessoryCategoryAnalyticsDescription___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) services];
  uint64_t v2 = objc_msgSend(v1, "na_all:", &__block_literal_global_14);

  return v2;
}

BOOL __54__HREUtilities_accessoryCategoryAnalyticsDescription___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "hf_serviceGroup");
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __54__HREUtilities_accessoryCategoryAnalyticsDescription___block_invoke_3(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) accessories];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_8_3);

  return v2;
}

uint64_t __54__HREUtilities_accessoryCategoryAnalyticsDescription___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isMediaAccessory");
}

uint64_t __54__HREUtilities_accessoryCategoryAnalyticsDescription___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_categoryOrPrimaryServiceType");
}

@end