@interface HFNetworkConfigurationGroupItem
- (HFCharacteristicValueSource)valueSource;
- (HFNetworkConfigurationGroupItem)init;
- (HFNetworkConfigurationGroupItem)initWithGroup:(id)a3 valueSource:(id)a4;
- (HMAccessoryNetworkProtectionGroup)group;
- (NSSet)profiles;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)copyWithValueSource:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HFNetworkConfigurationGroupItem

- (HFNetworkConfigurationGroupItem)initWithGroup:(id)a3 valueSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HFNetworkConfigurationGroupItem;
  v9 = [(HFItemGroupItem *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_group, a3);
    objc_storeStrong((id *)&v10->_valueSource, a4);
    v11 = [(HFNetworkConfigurationGroupItem *)v10 profiles];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __61__HFNetworkConfigurationGroupItem_initWithGroup_valueSource___block_invoke;
    v14[3] = &unk_264096230;
    id v15 = v8;
    v12 = objc_msgSend(v11, "na_map:", v14);
    [(HFItemGroupItem *)v10 setItems:v12];
  }
  return v10;
}

HFNetworkConfigurationItem *__61__HFNetworkConfigurationGroupItem_initWithGroup_valueSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [(HFAccessoryProfileItem *)[HFNetworkConfigurationItem alloc] initWithProfile:v3 valueSource:*(void *)(a1 + 32)];

  return v4;
}

- (HFNetworkConfigurationGroupItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithGroup_valueSource_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFNetworkConfigurationGroupItem.m", 39, @"%s is unavailable; use %@ instead",
    "-[HFNetworkConfigurationGroupItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(HFNetworkConfigurationGroupItem *)self valueSource];
  id v5 = [(HFNetworkConfigurationGroupItem *)self copyWithValueSource:v4];

  return v5;
}

- (NSSet)profiles
{
  v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [(HFNetworkConfigurationGroupItem *)self group];
  v4 = objc_msgSend(v3, "hf_networkConfigurationProfiles");
  id v5 = [v2 setWithArray:v4];

  return (NSSet *)v5;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HFNetworkConfigurationGroupItem;
  v4 = [(HFItemGroupItem *)&v8 _subclass_updateWithOptions:a3];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__HFNetworkConfigurationGroupItem__subclass_updateWithOptions___block_invoke;
  v7[3] = &unk_26408E470;
  v7[4] = self;
  id v5 = [v4 flatMap:v7];

  return v5;
}

id __63__HFNetworkConfigurationGroupItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v3 = (void *)[a2 mutableCopy];
  v4 = [*(id *)(a1 + 32) group];
  id v5 = objc_msgSend(v4, "hf_home");

  if (!v5)
  {
    v6 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v71 = *(void **)(a1 + 32);
      v72 = [v71 group];
      v73 = objc_msgSend(v72, "hf_title");
      v74 = [*(id *)(a1 + 32) group];
      *(_DWORD *)buf = 134218498;
      v88 = v71;
      __int16 v89 = 2112;
      v90 = v73;
      __int16 v91 = 2112;
      uint64_t v92 = (uint64_t)v74;
      _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "<HFNetworkConfigurationGroupItem %p (%@)>: Nil home for HMAccessoryNetworkProtectionGroup %@", buf, 0x20u);
    }
  }
  id v7 = [v3 objectForKeyedSubscript:@"dependentHomeKitObjects"];
  objc_super v8 = (void *)[v7 mutableCopy];

  v9 = [*(id *)(a1 + 32) group];
  [v8 addObject:v9];

  objc_msgSend(v8, "na_safeAddObject:", v5);
  v85 = v8;
  [v3 setObject:v8 forKeyedSubscript:@"dependentHomeKitObjects"];
  v10 = [*(id *)(a1 + 32) group];
  v11 = objc_msgSend(v10, "hf_title");
  [v3 setObject:v11 forKeyedSubscript:@"title"];

  v12 = [*(id *)(a1 + 32) group];
  v13 = [v12 manufacturer];

  if (!v13)
  {
    v14 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v75 = *(void **)(a1 + 32);
      v76 = [v75 group];
      v77 = objc_msgSend(v76, "hf_title");
      v78 = [*(id *)(a1 + 32) group];
      *(_DWORD *)buf = 134218498;
      v88 = v75;
      __int16 v89 = 2112;
      v90 = v77;
      __int16 v91 = 2112;
      uint64_t v92 = (uint64_t)v78;
      _os_log_error_impl(&dword_20B986000, v14, OS_LOG_TYPE_ERROR, "<HFNetworkConfigurationGroupItem %p (%@)>: Nil manufacturer for HMAccessoryNetworkProtectionGroup %@", buf, 0x20u);
    }
  }
  id v15 = (void *)MEMORY[0x263F0DF00];
  objc_super v16 = [*(id *)(a1 + 32) group];
  v17 = [v16 category];
  v18 = [v17 categoryType];
  v19 = objc_msgSend(v15, "hf_userFriendlyLocalizedCapitalizedDescription:", v18);

  if (!v19)
  {
    v20 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v79 = *(void **)(a1 + 32);
      v80 = [v79 group];
      v81 = objc_msgSend(v80, "hf_title");
      v82 = [*(id *)(a1 + 32) group];
      *(_DWORD *)buf = 134218498;
      v88 = v79;
      __int16 v89 = 2112;
      v90 = v81;
      __int16 v91 = 2112;
      uint64_t v92 = (uint64_t)v82;
      _os_log_error_impl(&dword_20B986000, v20, OS_LOG_TYPE_ERROR, "<HFNetworkConfigurationGroupItem %p (%@)>: Nil category for HMAccessoryNetworkProtectionGroup %@", buf, 0x20u);
    }
  }
  v21 = (void *)0x263F0E000;
  v22 = (void *)MEMORY[0x263F0E5F8];
  v23 = [*(id *)(a1 + 32) group];
  v24 = objc_msgSend(v22, "hf_localizedTitleForTargetProtectionMode:", objc_msgSend(v23, "targetProtectionMode"));
  [v3 setObject:v24 forKeyedSubscript:@"description"];

  [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"shouldHideForNonAdminUsers"];
  v25 = NSNumber;
  v26 = [*(id *)(a1 + 32) group];
  v27 = objc_msgSend(v25, "numberWithInteger:", objc_msgSend(v26, "targetProtectionMode"));
  [v3 setObject:v27 forKeyedSubscript:@"HFResultNetworkConfigurationTargetProtectionMode"];

  v28 = NSNumber;
  v29 = [*(id *)(a1 + 32) group];
  v30 = objc_msgSend(v28, "numberWithInteger:", objc_msgSend(v29, "hf_displayCurrentProtectionMode"));
  [v3 setObject:v30 forKeyedSubscript:@"HFResultNetworkConfigurationCurrentProtectionMode"];

  v31 = HFLogForCategory(0x2AuLL);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v84 = v5;
    v32 = *(void **)(a1 + 32);
    v83 = [v32 group];
    v33 = objc_msgSend(v83, "hf_title");
    v34 = [v3 objectForKeyedSubscript:@"HFResultNetworkConfigurationTargetProtectionMode"];
    uint64_t v35 = [v34 unsignedLongValue];
    v36 = [v3 objectForKeyedSubscript:@"HFResultNetworkConfigurationCurrentProtectionMode"];
    uint64_t v37 = [v36 unsignedLongValue];
    v38 = [*(id *)(a1 + 32) group];
    *(_DWORD *)buf = 134219010;
    v88 = v32;
    id v5 = v84;
    __int16 v89 = 2112;
    v90 = v33;
    __int16 v91 = 2048;
    uint64_t v92 = v35;
    __int16 v93 = 2048;
    uint64_t v94 = v37;
    __int16 v95 = 2112;
    v96 = v38;
    _os_log_impl(&dword_20B986000, v31, OS_LOG_TYPE_DEFAULT, "<HFNetworkConfigurationGroupItem %p (%@)>: Protection mode to display (target %lu, current %lu) for HMAccessoryNetworkProtectionGroup %@", buf, 0x34u);

    v21 = (void *)0x263F0E000;
  }

  unint64_t v39 = 0x263F08000uLL;
  v40 = NSNumber;
  v41 = [*(id *)(a1 + 32) profiles];
  v86[0] = MEMORY[0x263EF8330];
  v86[1] = 3221225472;
  v86[2] = __63__HFNetworkConfigurationGroupItem__subclass_updateWithOptions___block_invoke_14;
  v86[3] = &unk_264096258;
  v86[4] = *(void *)(a1 + 32);
  v42 = objc_msgSend(v40, "numberWithBool:", objc_msgSend(v41, "na_any:", v86));
  [v3 setObject:v42 forKeyedSubscript:@"HFResultNetworkConfigurationProtectionModeMismatch"];

  v43 = NSNumber;
  v44 = (void *)MEMORY[0x263F0E5F8];
  v45 = [*(id *)(a1 + 32) group];
  v46 = objc_msgSend(v43, "numberWithInt:", objc_msgSend(v44, "hf_targetProtectionModeIsValid:", objc_msgSend(v45, "targetProtectionMode")) ^ 1);
  [v3 setObject:v46 forKeyedSubscript:@"HFResultNetworkConfigurationInvalid"];

  v47 = [v3 objectForKeyedSubscript:@"HFResultNetworkConfigurationInvalid"];
  LODWORD(v44) = [v47 BOOLValue];

  if (v44)
  {
    v48 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v66 = *(void **)(a1 + 32);
      v67 = [v66 group];
      v68 = objc_msgSend(v67, "hf_title");
      v69 = [*(id *)(a1 + 32) group];
      v21 = (void *)[v69 targetProtectionMode];
      v70 = [*(id *)(a1 + 32) group];
      *(_DWORD *)buf = 134218754;
      v88 = v66;
      __int16 v89 = 2112;
      v90 = v68;
      __int16 v91 = 2048;
      uint64_t v92 = (uint64_t)v21;
      __int16 v93 = 2112;
      uint64_t v94 = (uint64_t)v70;
      _os_log_error_impl(&dword_20B986000, v48, OS_LOG_TYPE_ERROR, "<HFNetworkConfigurationGroupItem %p (%@)>: Invalid targetProtectionMode %lu for HMAccessoryNetworkProtectionGroup %@", buf, 0x2Au);

      unint64_t v39 = 0x263F08000;
    }
  }
  v49 = objc_msgSend(*(id *)(v39 + 2584), "numberWithInt:", objc_msgSend(v5, "hf_isNetworkProtectionSupportedForAccessories") ^ 1);
  [v3 setObject:v49 forKeyedSubscript:@"HFResultNetworkConfigurationUnsupported"];

  v50 = objc_msgSend(*(id *)(v39 + 2584), "numberWithInt:", objc_msgSend(v5, "hf_isNetworkProtectionEnabled") ^ 1);
  [v3 setObject:v50 forKeyedSubscript:@"HFResultNetworkConfigurationDisabled"];

  v51 = [*(id *)(a1 + 32) profiles];
  v52 = +[HFNetworkConfigurationAllowedHostGroup groupsForNetworkConfigurationProfiles:v51];
  [v3 setObject:v52 forKeyedSubscript:@"HFResultNetworkConfigurationAllowedHostGroups"];

  v53 = *(void **)(v39 + 2584);
  v54 = [*(id *)(a1 + 32) profiles];
  v55 = objc_msgSend(v53, "numberWithBool:", objc_msgSend(v54, "na_any:", &__block_literal_global_114));
  [v3 setObject:v55 forKeyedSubscript:@"HFResultNetworkConfigurationDisplayAllowedHostException"];

  v56 = *(void **)(v39 + 2584);
  v57 = [v3 objectForKeyedSubscript:@"HFResultNetworkConfigurationAllowedHostGroups"];
  uint64_t v58 = [v57 count];
  if (v58)
  {
    v21 = [*(id *)(a1 + 32) profiles];
    BOOL v59 = (unint64_t)[v21 count] > 1;
  }
  else
  {
    BOOL v59 = 0;
  }
  v60 = [v56 numberWithInt:v59];
  [v3 setObject:v60 forKeyedSubscript:@"HFResultNetworkConfigurationDisplayAllowedHostMismatch"];

  if (v58) {
  v61 = *(void **)(v39 + 2584);
  }
  v62 = [*(id *)(a1 + 32) profiles];
  v63 = objc_msgSend(v61, "numberWithBool:", objc_msgSend(v62, "na_any:", &__block_literal_global_19_4));
  [v3 setObject:v63 forKeyedSubscript:@"HFResultNetworkConfigurationDisplayAccessViolation"];

  v64 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v64;
}

uint64_t __63__HFNetworkConfigurationGroupItem__subclass_updateWithOptions___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)MEMORY[0x263F0E5F8];
  uint64_t v5 = [v3 currentProtectionMode];
  v6 = [*(id *)(a1 + 32) group];
  int v7 = objc_msgSend(v4, "hf_currentProtectionMode:isValidForTargetProtectionMode:", v5, objc_msgSend(v6, "targetProtectionMode"));

  if ((v7 & 1) == 0)
  {
    objc_super v8 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = *(void **)(a1 + 32);
      v11 = [v10 group];
      v12 = objc_msgSend(v11, "hf_title");
      v13 = [*(id *)(a1 + 32) group];
      int v14 = 134219010;
      id v15 = v10;
      __int16 v16 = 2112;
      v17 = v12;
      __int16 v18 = 2048;
      uint64_t v19 = [v13 targetProtectionMode];
      __int16 v20 = 2048;
      uint64_t v21 = [v3 currentProtectionMode];
      __int16 v22 = 2112;
      id v23 = v3;
      _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "<HFNetworkConfigurationGroupItem %p (%@)>: Protection mode mismatch (target %lu != current %lu) for HMNetworkConfigurationProfile %@", (uint8_t *)&v14, 0x34u);
    }
  }

  return v7 ^ 1u;
}

BOOL __63__HFNetworkConfigurationGroupItem__subclass_updateWithOptions___block_invoke_17(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 targetProtectionMode]) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = [v2 currentProtectionMode] == 4;
  }

  return v3;
}

uint64_t __63__HFNetworkConfigurationGroupItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_hasCurrentNetworkAccessViolation");
}

- (id)copyWithValueSource:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(HFNetworkConfigurationGroupItem *)self group];
  int v7 = (void *)[v5 initWithGroup:v6 valueSource:v4];

  [v7 copyLatestResultsFromItem:self];
  return v7;
}

- (HMAccessoryNetworkProtectionGroup)group
{
  return self->_group;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end