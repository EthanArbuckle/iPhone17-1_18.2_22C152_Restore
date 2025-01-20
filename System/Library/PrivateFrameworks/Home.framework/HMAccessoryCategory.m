@interface HMAccessoryCategory
@end

@implementation HMAccessoryCategory

uint64_t __55__HMAccessoryCategory_HFAdditions__hf_isMediaAccessory__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v1 = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x263F0B130], *MEMORY[0x263F0B038], *MEMORY[0x263F0B030], *MEMORY[0x263F0B010], *MEMORY[0x263F0B0A0], 0);
  uint64_t v2 = _MergedGlobals_286;
  _MergedGlobals_286 = v1;
  return MEMORY[0x270F9A758](v1, v2);
}

void __77__HMAccessoryCategory_HFAdditions__hf_compatibleServiceTypesForCategoryType___block_invoke()
{
  v28[22] = *MEMORY[0x263EF8340];
  v27[0] = *MEMORY[0x263F0B0D0];
  v26 = [MEMORY[0x263EFFA08] set];
  v28[0] = v26;
  v27[1] = *MEMORY[0x263F0B100];
  v25 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D7D8], 0);
  v28[1] = v25;
  v27[2] = *MEMORY[0x263F0B048];
  v24 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D6A8], 0);
  v28[2] = v24;
  v27[3] = *MEMORY[0x263F0B058];
  v23 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D798], 0);
  v28[3] = v23;
  v27[4] = *MEMORY[0x263F0B070];
  v22 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D6C8], 0);
  v28[4] = v22;
  v27[5] = *MEMORY[0x263F0B088];
  v21 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D6F8], 0);
  v28[5] = v21;
  v27[6] = *MEMORY[0x263F0B0B8];
  v20 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D780], 0);
  v28[6] = v20;
  v27[7] = *MEMORY[0x263F0B0E0];
  v19 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D7D0], 0);
  v28[7] = v19;
  v27[8] = *MEMORY[0x263F0B0F0];
  v18 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D820], 0);
  v28[8] = v18;
  v27[9] = *MEMORY[0x263F0B118];
  v17 = objc_msgSend(MEMORY[0x263F0E708], "hf_sensorServiceTypes");
  v28[9] = v17;
  v27[10] = *MEMORY[0x263F0B158];
  v16 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D828], 0);
  v28[10] = v16;
  v27[11] = *MEMORY[0x263F0B1A8];
  uint64_t v0 = *MEMORY[0x263F0D870];
  v15 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D870], 0);
  v28[11] = v15;
  v27[12] = *MEMORY[0x263F0B1C8];
  uint64_t v1 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D8A8], 0);
  v28[12] = v1;
  v27[13] = *MEMORY[0x263F0B1E0];
  uint64_t v2 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D8B8], 0);
  v28[13] = v2;
  v27[14] = *MEMORY[0x263F0B018];
  v3 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D618], 0);
  v28[14] = v3;
  v27[15] = *MEMORY[0x263F0AFE8];
  v4 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v0, 0);
  v28[15] = v4;
  v27[16] = *MEMORY[0x263F0B000];
  uint64_t v5 = *MEMORY[0x263F0D720];
  v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D720], 0);
  v28[16] = v6;
  v27[17] = *MEMORY[0x263F0AFD8];
  v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v5, 0);
  v28[17] = v7;
  v27[18] = *MEMORY[0x263F0B140];
  v8 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D740], 0);
  v28[18] = v8;
  v27[19] = *MEMORY[0x263F0B078];
  uint64_t v9 = *MEMORY[0x263F0D6D8];
  v10 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D6D8], 0);
  v28[19] = v10;
  v27[20] = *MEMORY[0x263F0B120];
  v11 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v9, 0);
  v28[20] = v11;
  v27[21] = *MEMORY[0x263F0B170];
  v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D850], 0);
  v28[21] = v12;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:22];
  v14 = (void *)qword_26AB2F8B0;
  qword_26AB2F8B0 = v13;
}

uint64_t __69__HMAccessoryCategory_HFAdditions__hf_standardAccessoryCategoryTypes__block_invoke()
{
  objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0B0D0], *MEMORY[0x263F0B100], *MEMORY[0x263F0B048], *MEMORY[0x263F0B058], *MEMORY[0x263F0B070], *MEMORY[0x263F0B088], *MEMORY[0x263F0B0B8], *MEMORY[0x263F0B0E0], *MEMORY[0x263F0B0F0], *MEMORY[0x263F0B118], *MEMORY[0x263F0B158], *MEMORY[0x263F0B1A8], *MEMORY[0x263F0B1C8], *MEMORY[0x263F0B1E0], *MEMORY[0x263F0B018], *MEMORY[0x263F0AFE8], *MEMORY[0x263F0B000],
    *MEMORY[0x263F0AFD8],
    *MEMORY[0x263F0B140],
    *MEMORY[0x263F0B078],
    *MEMORY[0x263F0B120],
    *MEMORY[0x263F0B170],
  uint64_t v0 = 0);
  uint64_t v1 = qword_26AB2F8C0;
  qword_26AB2F8C0 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end