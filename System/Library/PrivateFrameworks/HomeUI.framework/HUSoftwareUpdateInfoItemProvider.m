@interface HUSoftwareUpdateInfoItemProvider
- (HMHome)home;
- (HUSoftwareUpdateInfoItemProvider)init;
- (HUSoftwareUpdateInfoItemProvider)initWithHome:(id)a3;
- (NSMutableSet)softwareUpdateItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filter;
- (id)invalidationReasons;
- (id)reloadItems;
- (void)setFilter:(id)a3;
- (void)setSoftwareUpdateItems:(id)a3;
@end

@implementation HUSoftwareUpdateInfoItemProvider

- (HUSoftwareUpdateInfoItemProvider)initWithHome:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUSoftwareUpdateInfoItemProvider;
  v6 = [(HFItemProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    uint64_t v8 = objc_opt_new();
    softwareUpdateItems = v7->_softwareUpdateItems;
    v7->_softwareUpdateItems = (NSMutableSet *)v8;
  }
  return v7;
}

- (HUSoftwareUpdateInfoItemProvider)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUSoftwareUpdateInfoItemProvider.m", 33, @"%s is unavailable; use %@ instead",
    "-[HUSoftwareUpdateInfoItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HUSoftwareUpdateInfoItemProvider *)self home];
  v6 = (void *)[v4 initWithHome:v5];

  return v6;
}

- (id)reloadItems
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  long long v32 = 0u;
  id v4 = [(HUSoftwareUpdateInfoItemProvider *)self home];
  id v5 = [v4 accessories];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v33;
    *(void *)&long long v7 = 138412290;
    long long v25 = v7;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (objc_msgSend(v10, "hf_hasSoftwareUpdate", v25))
        {
          objc_super v11 = [(HUSoftwareUpdateInfoItemProvider *)self filter];
          if (!v11
            || ([(HUSoftwareUpdateInfoItemProvider *)self filter],
                v12 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue(),
                int v13 = ((uint64_t (**)(void, void *))v12)[2](v12, v10),
                v12,
                v11,
                v13))
          {
            if (objc_msgSend(v10, "hf_isReadyToInstallSoftwareUpdate")
              && (objc_msgSend(v10, "hf_hasNewValidSoftwareUpdate") & 1) == 0)
            {
              v14 = HFLogForCategory();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v25;
                v37 = v10;
                _os_log_error_impl(&dword_1BE345000, v14, OS_LOG_TYPE_ERROR, "Software update is ready to install but controller not controllable: %@", buf, 0xCu);
              }
            }
            else
            {
              v14 = objc_msgSend(v10, "hf_softwareUpdateHash");
              if (objc_msgSend(v10, "hf_isSoftwareUpdateInstalled"))
              {
                uint64_t v15 = [v14 stringByAppendingString:@"-Installed"];

                v14 = v15;
              }
              v16 = objc_msgSend(v3, "na_objectForKey:withDefaultValue:", v14, &__block_literal_global_160);
              [v16 addObject:v10];
            }
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v6);
  }

  v17 = [v3 allKeys];
  v18 = [v17 sortedArrayUsingSelector:sel_compare_];

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __47__HUSoftwareUpdateInfoItemProvider_reloadItems__block_invoke_2;
  v30[3] = &unk_1E63886E8;
  id v19 = v3;
  id v31 = v19;
  v20 = objc_msgSend(v18, "na_map:", v30);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__HUSoftwareUpdateInfoItemProvider_reloadItems__block_invoke_5;
  aBlock[3] = &unk_1E638D758;
  id v29 = &__block_literal_global_17;
  v21 = _Block_copy(aBlock);
  objc_initWeak((id *)buf, self);
  v22 = [(HFItemProvider *)self reloadItemsWithObjects:v20 keyAdaptor:&__block_literal_global_17 itemAdaptor:v21 filter:0 itemMap:&__block_literal_global_23_3];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __47__HUSoftwareUpdateInfoItemProvider_reloadItems__block_invoke_7;
  v26[3] = &unk_1E6385B38;
  objc_copyWeak(&v27, (id *)buf);
  v23 = [v22 flatMap:v26];
  objc_destroyWeak(&v27);

  objc_destroyWeak((id *)buf);

  return v23;
}

uint64_t __47__HUSoftwareUpdateInfoItemProvider_reloadItems__block_invoke()
{
  return [MEMORY[0x1E4F1CA80] set];
}

uint64_t __47__HUSoftwareUpdateInfoItemProvider_reloadItems__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
}

id __47__HUSoftwareUpdateInfoItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__HUSoftwareUpdateInfoItemProvider_reloadItems__block_invoke_4;
  v5[3] = &unk_1E638D730;
  v5[4] = &v6;
  objc_msgSend(v2, "na_each:", v5);
  v3 = [NSNumber numberWithInteger:v7[3]];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __47__HUSoftwareUpdateInfoItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) ^= [v3 hash];
}

id __47__HUSoftwareUpdateInfoItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 accessories];
  id v4 = (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v4;
}

HUSoftwareUpdateInfoItem *__47__HUSoftwareUpdateInfoItemProvider_reloadItems__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[HUSoftwareUpdateInfoItem alloc] initWithAccessories:v2];

  return v3;
}

id __47__HUSoftwareUpdateInfoItemProvider_reloadItems__block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained softwareUpdateItems];
  uint64_t v6 = [v3 removedItems];
  [v5 minusSet:v6];

  long long v7 = [WeakRetained softwareUpdateItems];
  uint64_t v8 = [v3 addedItems];
  [v7 unionSet:v8];

  uint64_t v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v9;
}

- (id)invalidationReasons
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)HUSoftwareUpdateInfoItemProvider;
  id v2 = [(HFItemProvider *)&v7 invalidationReasons];
  uint64_t v3 = *MEMORY[0x1E4F686F0];
  v8[0] = *MEMORY[0x1E4F686B0];
  v8[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  id v5 = [v2 setByAddingObjectsFromArray:v4];

  return v5;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (NSMutableSet)softwareUpdateItems
{
  return self->_softwareUpdateItems;
}

- (void)setSoftwareUpdateItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softwareUpdateItems, 0);
  objc_storeStrong((id *)&self->_home, 0);

  objc_storeStrong(&self->_filter, 0);
}

@end