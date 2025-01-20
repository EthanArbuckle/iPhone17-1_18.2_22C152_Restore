@interface HUMediaServiceErrorBannerItem
- (id)_subclass_updateWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HUMediaServiceErrorBannerItem

- (id)_subclass_updateWithOptions:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v4 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F68720]];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F7A0D8];
    id v7 = objc_alloc(MEMORY[0x1E4F69228]);
    uint64_t v24 = *MEMORY[0x1E4F68B10];
    v25[0] = MEMORY[0x1E4F1CC38];
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    id v9 = (id)[v7 initWithResults:v8];
    v10 = [v6 futureWithResult:v9];
  }
  else
  {
    v11 = [MEMORY[0x1E4F692B8] sharedManager];
    v12 = [(HUBannerItem *)self home];
    v8 = [v11 mediaServicesForHome:v12];

    v13 = objc_msgSend(v8, "na_firstObjectPassingTest:", &__block_literal_global_233);
    if (v13 || [(HUBannerItem *)self forceShowBanner])
    {
      v14 = (void *)MEMORY[0x1E4F7A0D8];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __61__HUMediaServiceErrorBannerItem__subclass_updateWithOptions___block_invoke_2;
      v22[3] = &unk_1E6385108;
      id v15 = v13;
      id v23 = v15;
      v16 = [v14 futureWithBlock:v22];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __61__HUMediaServiceErrorBannerItem__subclass_updateWithOptions___block_invoke_4;
      v19[3] = &unk_1E638FEC0;
      id v9 = v15;
      id v20 = v9;
      v21 = self;
      v10 = [v16 flatMap:v19];
    }
    else
    {
      v18 = objc_opt_new();
      [v18 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
      v10 = [MEMORY[0x1E4F7A0D8] futureWithResult:v18];

      id v9 = 0;
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUMediaServiceErrorBannerItem;
  id v4 = [(HUBannerItem *)&v6 copyWithZone:a3];
  [v4 copyLatestResultsFromItem:self];
  return v4;
}

uint64_t __61__HUMediaServiceErrorBannerItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 authFatalError];
}

void __61__HUMediaServiceErrorBannerItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F42A80];
  int v5 = [*(id *)(a1 + 32) iconImageURL];
  objc_super v6 = objc_msgSend(v4, "hf_fetchImageFromURL:", v5);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__HUMediaServiceErrorBannerItem__subclass_updateWithOptions___block_invoke_3;
  v9[3] = &unk_1E638B108;
  id v10 = v3;
  id v7 = v3;
  id v8 = (id)[v6 addCompletionBlock:v9];
}

uint64_t __61__HUMediaServiceErrorBannerItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

id __61__HUMediaServiceErrorBannerItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_opt_new();
  int v5 = [*(id *)(a1 + 32) serviceName];
  v12 = HULocalizedStringWithFormat(@"HUMediaServiceError_Title_FormatString", @"%@", v6, v7, v8, v9, v10, v11, (uint64_t)v5);
  [v4 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  [v4 setObject:@"Home.Banners.MediaServiceError.ReconnectAccount" forKeyedSubscript:*MEMORY[0x1E4F68928]];
  [v4 setObject:@"HUMediaServiceError" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
  v19 = HULocalizedStringWithFormat(@"HUMediaServiceError_Details_FormatString", @"%@", v13, v14, v15, v16, v17, v18, (uint64_t)v5);
  [v4 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F68980]];
  v26 = HULocalizedStringWithFormat(@"HUMediaServiceError_Button_FormatString", @"%@", v20, v21, v22, v23, v24, v25, (uint64_t)v5);
  [v4 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F68948]];
  if (v3)
  {
    [v4 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F689F8]];
  }
  else
  {
    id v27 = objc_alloc(MEMORY[0x1E4F692D0]);
    uint64_t v28 = *MEMORY[0x1E4F68670];
    v37[0] = *MEMORY[0x1E4F68678];
    v37[1] = v28;
    uint64_t v29 = *MEMORY[0x1E4F685D8];
    v38[0] = *MEMORY[0x1E4F685E0];
    v38[1] = v29;
    v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
    v31 = (void *)[v27 initWithImageIdentifiersKeyedBySize:v30];
    [v4 setObject:v31 forKeyedSubscript:*MEMORY[0x1E4F689E8]];
  }
  v32 = [*(id *)(a1 + 32) bundleIdentifier];
  [v4 setObject:v32 forKeyedSubscript:@"HFResultMediaServiceBundleIdentifierKey"];

  LODWORD(v32) = [*(id *)(a1 + 32) authFatalError];
  int v33 = [*(id *)(a1 + 40) forceShowBanner];
  v34 = [NSNumber numberWithBool:(v33 | v32) ^ 1];
  [v4 setObject:v34 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  [v4 setObject:&unk_1F19B4D90 forKeyedSubscript:@"bannerItemCategory"];
  v35 = [MEMORY[0x1E4F7A0D8] futureWithResult:v4];

  return v35;
}

@end