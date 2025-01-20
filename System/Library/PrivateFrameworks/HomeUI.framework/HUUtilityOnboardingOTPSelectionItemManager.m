@interface HUUtilityOnboardingOTPSelectionItemManager
- (HFItem)selectedFactor;
- (HUUtilityOnboardingOTPSelectionItemManager)initWithDelegate:(id)a3 context:(id)a4;
- (NSArray)factors;
- (_TtC6HomeUI24UtilityOnboardingContext)context;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (void)setContext:(id)a3;
- (void)setFactors:(id)a3;
- (void)setSelectedFactor:(id)a3;
@end

@implementation HUUtilityOnboardingOTPSelectionItemManager

- (HUUtilityOnboardingOTPSelectionItemManager)initWithDelegate:(id)a3 context:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HUUtilityOnboardingOTPSelectionItemManager;
  v8 = [(HFItemManager *)&v22 initWithDelegate:a3 sourceItem:0];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_context, a4);
    v10 = [v7 otpFactors];
    v11 = objc_msgSend(v10, "na_firstObjectPassingTest:", &__block_literal_global_8);

    if (v11)
    {
      v12 = (void *)MEMORY[0x1E4F1CA80];
      v13 = [v7 otpFactors];
      v14 = [v12 setWithArray:v13];

      v15 = objc_opt_new();
      [v15 addObject:v11];
      [v14 removeObject:v11];
      v16 = [v14 allObjects];
      [v15 addObjectsFromArray:v16];

      objc_storeStrong((id *)&v9->_factors, v15);
      v17 = HFLogForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        factors = v9->_factors;
        *(_DWORD *)buf = 138412802;
        v24 = v9;
        __int16 v25 = 2080;
        v26 = "-[HUUtilityOnboardingOTPSelectionItemManager initWithDelegate:context:]";
        __int16 v27 = 2112;
        v28 = factors;
        _os_log_debug_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEBUG, "%@:%s SORTED FACTORS %@", buf, 0x20u);
      }
    }
    else
    {
      uint64_t v18 = [v7 otpFactors];
      v14 = v9->_factors;
      v9->_factors = (NSArray *)v18;
    }

    v19 = HFLogForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v9;
      __int16 v25 = 2080;
      v26 = "-[HUUtilityOnboardingOTPSelectionItemManager initWithDelegate:context:]";
      _os_log_impl(&dword_1BE345000, v19, OS_LOG_TYPE_DEFAULT, "%@:%s intialized item manager", buf, 0x16u);
    }
  }
  return v9;
}

uint64_t __71__HUUtilityOnboardingOTPSelectionItemManager_initWithDelegate_context___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 objectForKeyedSubscript:@"factorType"];
  uint64_t v3 = [v2 isEqualToString:@"SMS"];

  return v3;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  int v16 = 0;
  v5 = [(HUUtilityOnboardingOTPSelectionItemManager *)self factors];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__HUUtilityOnboardingOTPSelectionItemManager__buildItemProvidersForHome___block_invoke;
  v14[3] = &unk_1E6385438;
  v14[4] = self;
  v14[5] = v15;
  v6 = objc_msgSend(v5, "na_map:", v14);

  id v7 = objc_alloc(MEMORY[0x1E4F695C8]);
  v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
  v9 = (void *)[v7 initWithItems:v8];

  v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v9 items];
    *(_DWORD *)buf = 138413314;
    v19 = self;
    __int16 v20 = 2080;
    v21 = "-[HUUtilityOnboardingOTPSelectionItemManager _buildItemProvidersForHome:]";
    __int16 v22 = 2112;
    v23 = v9;
    __int16 v24 = 2112;
    __int16 v25 = v11;
    __int16 v26 = 2112;
    __int16 v27 = v6;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@:%s item provider: %@ with items %@\nfield items %@", buf, 0x34u);
  }
  v17 = v9;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];

  _Block_object_dispose(v15, 8);

  return v12;
}

id __73__HUUtilityOnboardingOTPSelectionItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v25 = v5;
    __int16 v26 = 2080;
    __int16 v27 = "-[HUUtilityOnboardingOTPSelectionItemManager _buildItemProvidersForHome:]_block_invoke";
    __int16 v28 = 2112;
    id v29 = v3;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%s Each factor  %@", buf, 0x20u);
  }

  v6 = objc_opt_new();
  id v7 = [v3 objectForKeyedSubscript:@"factorType"];
  v8 = [NSString stringWithFormat:@"Home.OnboardingView.Utility.OTP.%@", v7];
  v9 = [@"HUUtilityOnboardingOTPFactorTitle." stringByAppendingString:v7];
  v10 = _HULocalizedStringWithDefaultValue(v9, v9, 1);
  objc_msgSend(v6, "na_safeSetObject:forKey:", v10, *MEMORY[0x1E4F68AB8]);
  objc_msgSend(v6, "na_safeSetObject:forKey:", v7, @"factor-type");
  v11 = [v3 objectForKeyedSubscript:@"destination"];
  objc_msgSend(v6, "na_safeSetObject:forKey:", v11, *MEMORY[0x1E4F68980]);

  v12 = [v3 objectForKeyedSubscript:@"_links"];
  v13 = [v12 objectForKeyedSubscript:@"send"];
  objc_msgSend(v6, "na_safeSetObject:forKey:", v13, *MEMORY[0x1E4F68C80]);

  v14 = [v3 objectForKeyedSubscript:@"_links"];
  v15 = [v14 objectForKeyedSubscript:@"verify"];
  objc_msgSend(v6, "na_safeSetObject:forKey:", v15, *MEMORY[0x1E4F68C90]);

  uint64_t v16 = *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (!v16)
  {
    objc_msgSend(v6, "na_safeSetObject:forKey:", MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F68B40]);
    uint64_t v16 = *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  v17 = [NSNumber numberWithInt:v16];
  objc_msgSend(v6, "na_safeSetObject:forKey:", v17, *MEMORY[0x1E4F68B48]);

  objc_msgSend(v6, "na_safeSetObject:forKey:", v7, @"factor-type");
  objc_msgSend(v6, "na_safeSetObject:forKey:", v8, *MEMORY[0x1E4F68928]);
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t v18 = HFLogForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v25 = v19;
    __int16 v26 = 2080;
    __int16 v27 = "-[HUUtilityOnboardingOTPSelectionItemManager _buildItemProvidersForHome:]_block_invoke";
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "%@:%s result %@", buf, 0x20u);
  }

  id v20 = objc_alloc(MEMORY[0x1E4F695C0]);
  v21 = (void *)[v6 copy];
  __int16 v22 = (void *)[v20 initWithResults:v21];

  return v22;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(HFItemManager *)self allItems];
    *(_DWORD *)buf = 138413058;
    v39 = self;
    __int16 v40 = 2080;
    v41 = "-[HUUtilityOnboardingOTPSelectionItemManager _buildSectionsWithDisplayedItems:]";
    __int16 v42 = 2112;
    id v43 = v4;
    __int16 v44 = 2112;
    v45 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%s with displayed items %@\n%@", buf, 0x2Au);
  }
  id v7 = [MEMORY[0x1E4F1CA48] array];
  v8 = [(HFItemManager *)self allItems];
  v9 = [v8 allObjects];
  v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_115];

  v11 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"field-identifier"];
  v12 = objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_120);

  v13 = objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_122);

  if (v12 && v13)
  {
    v14 = [(UtilityOnboardingContext *)self->_context config];
    v15 = [v14 name];
    HULocalizedStringWithFormat(@"HUUtilityOnboardingOTPSelectionFooter", @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v15);
  }
  else if (v12)
  {
    v14 = [(UtilityOnboardingContext *)self->_context config];
    v15 = [v14 name];
    HULocalizedStringWithFormat(@"HUUtilityOnboardingOTPSelectionFooterSMS", @"%@", v22, v23, v24, v25, v26, v27, (uint64_t)v15);
  }
  else
  {
    if (!v13) {
      goto LABEL_12;
    }
    v14 = [(UtilityOnboardingContext *)self->_context config];
    v15 = [v14 name];
    HULocalizedStringWithFormat(@"HUUtilityOnboardingOTPSelectionFooterEmail", @"%@", v28, v29, v30, v31, v32, v33, (uint64_t)v15);
  v34 = };

  if (v34)
  {
    [v11 setFooterTitle:v34];
  }
LABEL_12:
  [v11 setItems:v10];
  v35 = HFLogForCategory();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v39 = self;
    __int16 v40 = 2080;
    v41 = "-[HUUtilityOnboardingOTPSelectionItemManager _buildSectionsWithDisplayedItems:]";
    __int16 v42 = 2112;
    id v43 = v11;
    _os_log_impl(&dword_1BE345000, v35, OS_LOG_TYPE_DEFAULT, "%@:%s created field section %@", buf, 0x20u);
  }

  [v7 addObject:v11];
  v36 = HFLogForCategory();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v39 = self;
    __int16 v40 = 2080;
    v41 = "-[HUUtilityOnboardingOTPSelectionItemManager _buildSectionsWithDisplayedItems:]";
    __int16 v42 = 2112;
    id v43 = v7;
    _os_log_impl(&dword_1BE345000, v36, OS_LOG_TYPE_DEFAULT, "%@:%s All sections %@", buf, 0x20u);
  }

  return v7;
}

uint64_t __79__HUUtilityOnboardingOTPSelectionItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 latestResults];
  uint64_t v6 = *MEMORY[0x1E4F68B48];
  id v7 = [v5 objectForKey:*MEMORY[0x1E4F68B48]];

  v8 = [v4 latestResults];

  v9 = [v8 objectForKey:v6];

  uint64_t v17 = MEMORY[0x1E4F143A8];
  id v10 = v7;
  uint64_t v18 = v10;
  id v11 = v9;
  v12 = v11;
  id v19 = v11;
  if (v10) {
    uint64_t v13 = -1;
  }
  else {
    uint64_t v13 = v11 != 0;
  }
  if (v10) {
    BOOL v14 = v11 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    v15 = v11;
  }
  else
  {
    uint64_t v13 = objc_msgSend(v10, "compare:", v11, v17, 3221225472, __79__HUUtilityOnboardingOTPSelectionItemManager__buildSectionsWithDisplayedItems___block_invoke_2, &unk_1E6385480, v10);
    v15 = v19;
  }

  return v13;
}

uint64_t __79__HUUtilityOnboardingOTPSelectionItemManager__buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) compare:*(void *)(a1 + 40)];
}

uint64_t __79__HUUtilityOnboardingOTPSelectionItemManager__buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 latestResults];
  id v3 = [v2 objectForKeyedSubscript:@"factor-type"];
  uint64_t v4 = [v3 isEqualToString:@"SMS"];

  return v4;
}

uint64_t __79__HUUtilityOnboardingOTPSelectionItemManager__buildSectionsWithDisplayedItems___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 latestResults];
  id v3 = [v2 objectForKeyedSubscript:@"factor-type"];
  uint64_t v4 = [v3 isEqualToString:@"EMAIL"];

  return v4;
}

- (_TtC6HomeUI24UtilityOnboardingContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSArray)factors
{
  return self->_factors;
}

- (void)setFactors:(id)a3
{
}

- (HFItem)selectedFactor
{
  return self->_selectedFactor;
}

- (void)setSelectedFactor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedFactor, 0);
  objc_storeStrong((id *)&self->_factors, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end