@interface HFNetworkConfigurationItem
+ (id)defaultItemComparator;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HFNetworkConfigurationItem

+ (id)defaultItemComparator
{
  return &__block_literal_global_117;
}

uint64_t __51__HFNetworkConfigurationItem_defaultItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = v4;
  if (!v7) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  v9 = v7;
  if (!v8)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    v11 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v10 handleFailureInFunction:v11, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v6, objc_opt_class() file lineNumber description];

LABEL_7:
    v9 = 0;
  }

  uint64_t v12 = objc_opt_class();
  id v13 = v5;
  if (v13)
  {
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    v15 = v13;
    if (v14) {
      goto LABEL_15;
    }
    v16 = [MEMORY[0x263F08690] currentHandler];
    v17 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v16 handleFailureInFunction:v17, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v12, objc_opt_class() file lineNumber description];
  }
  v15 = 0;
LABEL_15:

  v29 = v9;
  v18 = [v9 accessory];
  v19 = [v15 accessory];
  v20 = [v18 room];
  v21 = [v20 name];
  v22 = [v19 room];
  v23 = [v22 name];
  uint64_t v24 = [v21 compare:v23];

  if (!v24)
  {
    v25 = [v18 name];
    v26 = [v19 name];
    uint64_t v24 = [v25 compare:v26];

    if (!v24)
    {
      v27 = +[HFItemSection defaultItemComparator];
      uint64_t v24 = ((uint64_t (**)(void, id, id))v27)[2](v27, v7, v13);
    }
  }

  return v24;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HFNetworkConfigurationItem;
  id v4 = [(HFAccessoryProfileItem *)&v8 _subclass_updateWithOptions:a3];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__HFNetworkConfigurationItem__subclass_updateWithOptions___block_invoke;
  v7[3] = &unk_26408E470;
  v7[4] = self;
  id v5 = [v4 flatMap:v7];

  return v5;
}

id __58__HFNetworkConfigurationItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)[a2 mutableCopy];
  id v4 = [v3 objectForKeyedSubscript:@"dependentHomeKitObjects"];
  id v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = [*(id *)(a1 + 32) profile];
  id v7 = [v6 accessory];
  objc_super v8 = [v7 home];
  [v5 addObject:v8];

  [v3 setObject:v5 forKeyedSubscript:@"dependentHomeKitObjects"];
  v9 = [*(id *)(a1 + 32) profile];
  v10 = [v9 accessory];
  v11 = [v10 name];
  [v3 setObject:v11 forKeyedSubscript:@"title"];

  [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"shouldHideForNonAdminUsers"];
  uint64_t v12 = NSNumber;
  id v13 = [*(id *)(a1 + 32) profile];
  v14 = objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "currentProtectionMode"));
  [v3 setObject:v14 forKeyedSubscript:@"HFResultNetworkConfigurationTargetProtectionMode"];

  v15 = NSNumber;
  v16 = [*(id *)(a1 + 32) profile];
  v17 = objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v16, "targetProtectionMode"));
  [v3 setObject:v17 forKeyedSubscript:@"HFResultNetworkConfigurationCurrentProtectionMode"];

  v18 = NSNumber;
  v19 = [*(id *)(a1 + 32) profile];
  v20 = objc_msgSend(v18, "numberWithInt:", objc_msgSend(v19, "hf_targetProtectionModeIsValid") ^ 1);
  [v3 setObject:v20 forKeyedSubscript:@"HFResultNetworkConfigurationInvalid"];

  v21 = NSNumber;
  v22 = [*(id *)(a1 + 32) profile];
  v23 = [v22 accessory];
  uint64_t v24 = [v23 home];
  v25 = objc_msgSend(v21, "numberWithInt:", objc_msgSend(v24, "hf_isNetworkProtectionSupportedForAccessories") ^ 1);
  [v3 setObject:v25 forKeyedSubscript:@"HFResultNetworkConfigurationUnsupported"];

  v26 = NSNumber;
  v27 = [*(id *)(a1 + 32) profile];
  v28 = [v27 accessory];
  v29 = [v28 home];
  v30 = objc_msgSend(v26, "numberWithInt:", objc_msgSend(v29, "hf_isNetworkProtectionEnabled") ^ 1);
  [v3 setObject:v30 forKeyedSubscript:@"HFResultNetworkConfigurationDisabled"];

  v31 = [*(id *)(a1 + 32) profile];
  v32 = objc_msgSend(v31, "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");
  [v3 setObject:v32 forKeyedSubscript:@"description"];

  v33 = NSNumber;
  v34 = [*(id *)(a1 + 32) profile];
  v35 = objc_msgSend(v33, "numberWithBool:", objc_msgSend(v34, "hf_hasProtectionModeMismatch"));
  [v3 setObject:v35 forKeyedSubscript:@"HFResultNetworkConfigurationProtectionModeMismatch"];

  v36 = [*(id *)(a1 + 32) profile];
  v37 = [v36 allowedHosts];
  [v3 setObject:v37 forKeyedSubscript:@"HFResultNetworkConfigurationAllowedHosts"];

  v38 = (void *)MEMORY[0x263EFFA08];
  v39 = [*(id *)(a1 + 32) profile];
  v40 = [v38 setWithObject:v39];
  v41 = +[HFNetworkConfigurationAllowedHostGroup groupsForNetworkConfigurationProfiles:v40];
  [v3 setObject:v41 forKeyedSubscript:@"HFResultNetworkConfigurationAllowedHostGroups"];

  v42 = NSNumber;
  v43 = [*(id *)(a1 + 32) profile];
  uint64_t v44 = [v43 targetProtectionMode];
  if (v44)
  {
    BOOL v45 = 0;
  }
  else
  {
    v29 = [*(id *)(a1 + 32) profile];
    BOOL v45 = [v29 currentProtectionMode] == 4;
  }
  v46 = [v42 numberWithInt:v45];
  [v3 setObject:v46 forKeyedSubscript:@"HFResultNetworkConfigurationDisplayAllowedHostException"];

  if (!v44) {
  [v3 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"HFResultNetworkConfigurationDisplayAllowedHostMismatch"];
  }
  v47 = NSNumber;
  v48 = [*(id *)(a1 + 32) profile];
  v49 = objc_msgSend(v47, "numberWithBool:", objc_msgSend(v48, "hf_hasCurrentNetworkAccessViolation"));
  [v3 setObject:v49 forKeyedSubscript:@"HFResultNetworkConfigurationDisplayAccessViolation"];

  v50 = NSNumber;
  v51 = [*(id *)(a1 + 32) profile];
  v52 = objc_msgSend(v50, "numberWithBool:", objc_msgSend(v51, "hf_requiresManualWiFiReconfiguration"));
  [v3 setObject:v52 forKeyedSubscript:@"HFResultNetworkConfigurationRequiresManualWiFiReconfiguration"];

  v53 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v53;
}

@end