@interface HUServiceDetailsShowContainedItemsInGroupItem
- (BOOL)hasAnyVisibleBridgedAccessories;
- (BOOL)hasAnyVisibleBridgedServices;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)sourceBridgeAccessory;
@end

@implementation HUServiceDetailsShowContainedItemsInGroupItem

- (id)_subclass_updateWithOptions:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v48 = a3;
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsContainedServicesLabel", @"HUServiceDetailsContainedServicesLabel", 1);
  uint64_t v6 = *MEMORY[0x1E4F68AB8];
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [v4 setObject:@"AccessoryDetails.ContainedServices" forKeyedSubscript:*MEMORY[0x1E4F68928]];
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  uint64_t v53 = 0;
  v7 = [MEMORY[0x1E4F1CA80] set];
  v8 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  LODWORD(v5) = [v8 conformsToProtocol:&unk_1F1AA7668];

  if (v5)
  {
    v9 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
    v10 = &unk_1F1AA7668;
    id v11 = v9;
    if ([v11 conformsToProtocol:v10]) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
    id v13 = v12;

    uint64_t v14 = [v13 numberOfCompoundItems];
    v51[3] = v14;
    id v15 = [v13 homeKitObject];
    objc_msgSend(v7, "na_safeAddObject:", v15);
LABEL_16:

    goto LABEL_17;
  }
  if ([(HUServiceDetailsAbstractItem *)self isItemGroup])
  {
    v16 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
    v17 = &unk_1F1A3D6E8;
    id v18 = v16;
    if ([v18 conformsToProtocol:v17]) {
      v19 = v18;
    }
    else {
      v19 = 0;
    }
    id v20 = v19;

    uint64_t v21 = [v20 numberOfItemsContainedWithinGroup];
    v51[3] = v21;
    objc_opt_class();
    id v13 = v20;
    if (objc_opt_isKindOfClass()) {
      v22 = v13;
    }
    else {
      v22 = 0;
    }
    id v15 = v22;

    if ([v15 isHomePodMediaSystem])
    {
      v23 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsContainedSpeakersLabel", @"HUServiceDetailsContainedSpeakersLabel", 1);
      [v4 setObject:v23 forKeyedSubscript:v6];
    }
    v24 = [v13 homeKitObject];
    [v7 addObject:v24];

    goto LABEL_16;
  }
LABEL_17:
  v25 = [(HUServiceDetailsShowContainedItemsInGroupItem *)self sourceBridgeAccessory];
  v26 = objc_msgSend(v25, "hf_bridgedAccessories");
  if ([(HUServiceDetailsAbstractItem *)self isBridge]
    && ![(HUServiceDetailsAbstractItem *)self isService])
  {
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __77__HUServiceDetailsShowContainedItemsInGroupItem__subclass_updateWithOptions___block_invoke;
    v49[3] = &unk_1E638D730;
    v49[4] = &v50;
    objc_msgSend(v26, "na_each:", v49);
    objc_msgSend(v7, "na_safeAddObject:", v25);
  }
  v27 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v28 = [(HUServiceDetailsAbstractItem *)self isMediaAccessoryGroup];

    if (!v28)
    {
      v29 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
      v30 = [v29 accessories];
      v31 = [v30 anyObject];
      v32 = objc_msgSend(v31, "hf_visibleServices");
      uint64_t v33 = [v32 count];

      v34 = HFLogForCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        id v45 = (id)objc_claimAutoreleasedReturnValue();
        v46 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
        *(_DWORD *)buf = 138413058;
        v55 = self;
        __int16 v56 = 2112;
        id v57 = v45;
        __int16 v58 = 2048;
        uint64_t v59 = v33;
        __int16 v60 = 2112;
        v61 = v46;
        _os_log_error_impl(&dword_1BE345000, v34, OS_LOG_TYPE_ERROR, "%@:%@ Adding %ld, visible services to count for media accessory %@", buf, 0x2Au);
      }
      v51[3] += v33;
    }
  }
  else
  {
  }
  if ([(HUServiceDetailsShowContainedItemsInGroupItem *)self hasAnyVisibleBridgedAccessories])
  {
    uint64_t v35 = v51[3];
    v36 = [v25 uniqueIdentifiersForBridgedAccessories];
    uint64_t v37 = [v36 count];
    v51[3] = v37 + v35;

    [v7 addObject:v26];
  }
  if (v51[3] < 1)
  {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  }
  else
  {
    v38 = (void *)MEMORY[0x1E4F28EE0];
    v39 = objc_msgSend(NSNumber, "numberWithInteger:");
    v40 = [v38 localizedStringFromNumber:v39 numberStyle:0];
    [v4 setObject:v40 forKeyedSubscript:*MEMORY[0x1E4F68980]];

    [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68908]];
  }
  v41 = (void *)MEMORY[0x1E4F7A0D8];
  v42 = [MEMORY[0x1E4F69228] outcomeWithResults:v4];
  v43 = [v41 futureWithResult:v42];

  _Block_object_dispose(&v50, 8);

  return v43;
}

void __77__HUServiceDetailsShowContainedItemsInGroupItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_msgSend(v4, "hf_showAsIndividualServices"))
  {
    v3 = objc_msgSend(v4, "hf_visibleServices");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v3 count];
  }
  else
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
}

- (id)sourceBridgeAccessory
{
  v3 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v5 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  uint64_t v6 = v5;
  if (isKindOfClass)
  {
    v7 = [v5 service];
    v8 = [v7 accessory];

LABEL_5:
    goto LABEL_7;
  }
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();

  if (v9)
  {
    uint64_t v6 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
    v8 = [v6 accessory];
    goto LABEL_5;
  }
  v8 = 0;
LABEL_7:

  return v8;
}

- (BOOL)hasAnyVisibleBridgedServices
{
  BOOL v3 = [(HUServiceDetailsAbstractItem *)self isBridge];
  if (v3)
  {
    id v4 = [(HUServiceDetailsShowContainedItemsInGroupItem *)self sourceBridgeAccessory];
    v5 = objc_msgSend(v4, "hf_servicesBehindBridge");
    char v6 = objc_msgSend(v5, "na_any:", &__block_literal_global_247);

    LOBYTE(v3) = v6;
  }
  return v3;
}

uint64_t __77__HUServiceDetailsShowContainedItemsInGroupItem_hasAnyVisibleBridgedServices__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isVisible");
}

- (BOOL)hasAnyVisibleBridgedAccessories
{
  BOOL v3 = [(HUServiceDetailsAbstractItem *)self isBridge];
  if (v3)
  {
    id v4 = [(HUServiceDetailsShowContainedItemsInGroupItem *)self sourceBridgeAccessory];
    v5 = objc_msgSend(v4, "hf_bridgedAccessories");
    char v6 = objc_msgSend(v5, "na_any:", &__block_literal_global_83_1);

    LOBYTE(v3) = v6;
  }
  return v3;
}

uint64_t __80__HUServiceDetailsShowContainedItemsInGroupItem_hasAnyVisibleBridgedAccessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isRemoteControl");
}

@end