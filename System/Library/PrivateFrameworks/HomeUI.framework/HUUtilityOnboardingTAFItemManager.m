@interface HUUtilityOnboardingTAFItemManager
- (HUUtilityOnboardingTAFItemManager)initWithDelegate:(id)a3 fields:(id)a4 sections:(id)a5;
- (NSArray)TAFSections;
- (NSArray)TAFfields;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (void)setTAFSections:(id)a3;
- (void)setTAFfields:(id)a3;
@end

@implementation HUUtilityOnboardingTAFItemManager

- (HUUtilityOnboardingTAFItemManager)initWithDelegate:(id)a3 fields:(id)a4 sections:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HUUtilityOnboardingTAFItemManager;
  v11 = [(HFItemManager *)&v16 initWithDelegate:a3 sourceItem:0];
  v12 = v11;
  if (v11)
  {
    if (v9) {
      objc_storeStrong((id *)&v11->_TAFfields, a4);
    }
    if (v10) {
      objc_storeStrong((id *)&v12->_TAFSections, a5);
    }
    v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      v18 = v12;
      __int16 v19 = 2080;
      v20 = "-[HUUtilityOnboardingTAFItemManager initWithDelegate:fields:sections:]";
      __int16 v21 = 2112;
      uint64_t v22 = v14;
      _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "%@:%s intialized item manager with taf type %@ ", buf, 0x20u);
    }
  }
  return v12;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    TAFfields = self->_TAFfields;
    *(_DWORD *)buf = 138412802;
    v20 = self;
    __int16 v21 = 2080;
    uint64_t v22 = "-[HUUtilityOnboardingTAFItemManager _buildItemProvidersForHome:]";
    __int16 v23 = 2112;
    v24 = TAFfields;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "*** %@:%s  TAF fields as set %@", buf, 0x20u);
  }

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  v7 = [(HUUtilityOnboardingTAFItemManager *)self TAFfields];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __64__HUUtilityOnboardingTAFItemManager__buildItemProvidersForHome___block_invoke;
  v16[3] = &unk_1E6387990;
  v16[4] = self;
  v16[5] = v17;
  v8 = objc_msgSend(v7, "na_map:", v16);

  id v9 = objc_alloc(MEMORY[0x1E4F695C8]);
  id v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
  v11 = (NSArray *)[v9 initWithItems:v10];

  v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [(NSArray *)v11 items];
    *(_DWORD *)buf = 138413058;
    v20 = self;
    __int16 v21 = 2080;
    uint64_t v22 = "-[HUUtilityOnboardingTAFItemManager _buildItemProvidersForHome:]";
    __int16 v23 = 2112;
    v24 = v11;
    __int16 v25 = 2112;
    v26 = v13;
    _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "%@:%s item provider: %@ with items %@ ", buf, 0x2Au);
  }
  v18 = v11;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];

  _Block_object_dispose(v17, 8);

  return v14;
}

id __64__HUUtilityOnboardingTAFItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v18 = 138412802;
    uint64_t v19 = v5;
    __int16 v20 = 2080;
    __int16 v21 = "-[HUUtilityOnboardingTAFItemManager _buildItemProvidersForHome:]_block_invoke";
    __int16 v22 = 2112;
    id v23 = v3;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%s Each field  %@", (uint8_t *)&v18, 0x20u);
  }

  v6 = objc_opt_new();
  v7 = [v3 label];
  objc_msgSend(v6, "na_safeSetObject:forKey:", v7, *MEMORY[0x1E4F68AB8]);

  v8 = [v3 formKey];
  objc_msgSend(v6, "na_safeSetObject:forKey:", v8, *MEMORY[0x1E4F68990]);

  if ([v3 required]) {
    id v9 = @"HUUtilityOnboardingTAF_RequiredField";
  }
  else {
    id v9 = @"HUUtilityOnboardingTAF_OptionalField";
  }
  id v10 = _HULocalizedStringWithDefaultValue(v9, v9, 1);
  objc_msgSend(v6, "na_safeSetObject:forKey:", v10, *MEMORY[0x1E4F68AC8]);

  v11 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  objc_msgSend(v6, "na_safeSetObject:forKey:", v11, *MEMORY[0x1E4F68B48]);

  v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v18 = 138412802;
    uint64_t v19 = v13;
    __int16 v20 = 2080;
    __int16 v21 = "-[HUUtilityOnboardingTAFItemManager _buildItemProvidersForHome:]_block_invoke";
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "%@:%s result %@", (uint8_t *)&v18, 0x20u);
  }

  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v14 = objc_alloc(MEMORY[0x1E4F695C0]);
  v15 = (void *)[v6 copy];
  objc_super v16 = (void *)[v14 initWithResults:v15];

  return v16;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[HUUtilityOnboardingTAFItemManager _buildSectionsWithDisplayedItems:]";
    *(_WORD *)&buf[22] = 2112;
    id v26 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%s with displayed items %@", buf, 0x20u);
  }

  v7 = [(HFItemManager *)self allItems];
  v8 = [v7 allObjects];
  id v9 = [v8 sortedArrayUsingComparator:&__block_literal_global_46];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  id v26 = 0;
  id v10 = [(HUUtilityOnboardingTAFItemManager *)self TAFSections];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__HUUtilityOnboardingTAFItemManager__buildSectionsWithDisplayedItems___block_invoke_3;
  v15[3] = &unk_1E63879B8;
  v17 = buf;
  SEL v18 = a2;
  v15[4] = self;
  id v11 = v9;
  id v16 = v11;
  v12 = objc_msgSend(v10, "na_map:", v15);

  uint64_t v13 = HFLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v19 = 138412802;
    __int16 v20 = self;
    __int16 v21 = 2080;
    __int16 v22 = "-[HUUtilityOnboardingTAFItemManager _buildSectionsWithDisplayedItems:]";
    __int16 v23 = 2112;
    uint64_t v24 = v12;
    _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "*** %@:%s All sections %@", v19, 0x20u);
  }

  _Block_object_dispose(buf, 8);

  return v12;
}

uint64_t __70__HUUtilityOnboardingTAFItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 latestResults];
  uint64_t v6 = *MEMORY[0x1E4F68B48];
  v7 = [v5 objectForKey:*MEMORY[0x1E4F68B48]];

  v8 = [v4 latestResults];

  id v9 = [v8 objectForKey:v6];

  uint64_t v17 = MEMORY[0x1E4F143A8];
  id v10 = v7;
  SEL v18 = v10;
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
    uint64_t v13 = objc_msgSend(v10, "compare:", v11, v17, 3221225472, __70__HUUtilityOnboardingTAFItemManager__buildSectionsWithDisplayedItems___block_invoke_2, &unk_1E6385480, v10);
    v15 = v19;
  }

  return v13;
}

uint64_t __70__HUUtilityOnboardingTAFItemManager__buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) compare:*(void *)(a1 + 40)];
}

id __70__HUUtilityOnboardingTAFItemManager__buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v6 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    uint64_t v23 = v5;
    __int16 v24 = 2112;
    __int16 v25 = v6;
    __int16 v26 = 2112;
    id v27 = v3;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "*** %@:%@ Each single section %@", buf, 0x20u);
  }
  v7 = objc_msgSend(@"HUUtilityOnboardingFieldsSectionIdentifier", "stringByAppendingFormat:", @"-%lu", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:v7];
  id v9 = *(void **)(a1 + 40);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __70__HUUtilityOnboardingTAFItemManager__buildSectionsWithDisplayedItems___block_invoke_100;
  v20[3] = &unk_1E6386108;
  id v10 = v3;
  id v21 = v10;
  id v11 = objc_msgSend(v9, "na_filter:", v20);
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 56));
    BOOL v14 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    uint64_t v23 = v13;
    __int16 v24 = 2112;
    __int16 v25 = v14;
    __int16 v26 = 2112;
    id v27 = v11;
    _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "*** %@:%@ Filtered items %@", buf, 0x20u);
  }
  v15 = [v10 objectForKeyedSubscript:@"header"];
  [v8 setHeaderTitle:v15];

  [v8 setItems:v11];
  id v16 = HFLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v23 = v17;
    __int16 v24 = 2080;
    __int16 v25 = "-[HUUtilityOnboardingTAFItemManager _buildSectionsWithDisplayedItems:]_block_invoke";
    __int16 v26 = 2112;
    id v27 = v8;
    _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "*** %@:%s  created field section %@", buf, 0x20u);
  }

  id v18 = v8;
  return v18;
}

uint64_t __70__HUUtilityOnboardingTAFItemManager__buildSectionsWithDisplayedItems___block_invoke_100(uint64_t a1, void *a2)
{
  id v3 = [a2 latestResults];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68990]];

  uint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"fields"];
  uint64_t v6 = [v5 containsObject:v4];

  return v6;
}

- (NSArray)TAFfields
{
  return self->_TAFfields;
}

- (void)setTAFfields:(id)a3
{
}

- (NSArray)TAFSections
{
  return self->_TAFSections;
}

- (void)setTAFSections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_TAFSections, 0);

  objc_storeStrong((id *)&self->_TAFfields, 0);
}

@end