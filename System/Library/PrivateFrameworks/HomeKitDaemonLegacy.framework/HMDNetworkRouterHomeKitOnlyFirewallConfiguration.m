@interface HMDNetworkRouterHomeKitOnlyFirewallConfiguration
+ (id)fallbackConfigurationForRuleset:(id)a3;
+ (id)fallbackIdentifier;
- (HMDNetworkRouterHomeKitOnlyFirewallConfiguration)initWithAccessory:(id)a3 sourceConfiguration:(id)a4;
- (id)description;
@end

@implementation HMDNetworkRouterHomeKitOnlyFirewallConfiguration

- (id)description
{
  v3 = NSString;
  if (self->_isFiltered)
  {
    [(HMDNetworkRouterFirewallRuleConfiguration *)self hasFullAccessToLAN];
    v4 = HMFBooleanToString();
    v5 = [(HMDNetworkRouterFirewallRuleConfiguration *)self lanRules];
    uint64_t v6 = [v5 count];
    v7 = [(HMDNetworkRouterFirewallRuleConfiguration *)self wanRules];
    v8 = [v3 stringWithFormat:@"<HomeKitOnly filtered Full LAN = %@, # LAN rules = %lu, # WAN rules = %lu>", v4, v6, objc_msgSend(v7, "count")];
  }
  else
  {
    v4 = HMFBooleanToString();
    v5 = HMFBooleanToString();
    v8 = [v3 stringWithFormat:@"<HomeKitOnly synthetic RTP = %@, HDS = %@>", v4, v5];
  }

  return v8;
}

- (HMDNetworkRouterHomeKitOnlyFirewallConfiguration)initWithAccessory:(id)a3 sourceConfiguration:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v6 = a4;
  unsigned __int8 v45 = 0;
  v7 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  if (v6)
  {
    v8 = [v6 accessoryIdentifier];
    v9 = [v6 lastModifiedTime];
    v10 = [v6 lanRules];

    if (!v10) {
      goto LABEL_20;
    }
    v11 = [v6 lanRules];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __90__HMDNetworkRouterHomeKitOnlyFirewallConfiguration_initWithAccessory_sourceConfiguration___block_invoke;
    v35[3] = &unk_1E6A0E698;
    v36 = v7;
    objc_msgSend(v11, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v35);

    LODWORD(v10) = 0;
    v12 = v36;
  }
  else
  {
    v8 = [(id)objc_opt_class() fallbackIdentifier];
    v9 = [MEMORY[0x1E4F1C9C8] distantPast];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __90__HMDNetworkRouterHomeKitOnlyFirewallConfiguration_initWithAccessory_sourceConfiguration___block_invoke_2;
    aBlock[3] = &unk_1E6A0E6C0;
    aBlock[4] = &v41;
    aBlock[5] = &v37;
    v12 = (void (**)(void *, id))_Block_copy(aBlock);
    id v13 = v29;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    id v15 = v14;

    if (v15)
    {
      v12[2](v12, v15);
      v16 = [v15 identifiersForBridgedAccessories];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __90__HMDNetworkRouterHomeKitOnlyFirewallConfiguration_initWithAccessory_sourceConfiguration___block_invoke_3;
      v31[3] = &unk_1E6A0E6E8;
      id v32 = v15;
      v33 = v12;
      objc_msgSend(v16, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v31);

      if (*((unsigned char *)v42 + 24))
      {
        context = (void *)MEMORY[0x1D9452090]();
        v17 = self;
        HMFGetOSLogHandle();
        v18 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v19 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v47 = v19;
          __int16 v48 = 2112;
          v49 = @"RTP";
          _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Adding fallback LAN rules for %@", buf, 0x16u);
        }
        v20 = [(id)objc_opt_class() fallbackConfigurationForRuleset:@"RTP"];
        addFallbackLANRules(&v45, v7, v20);
      }
      if (*((unsigned char *)v38 + 24))
      {
        context = (void *)MEMORY[0x1D9452090]();
        v21 = self;
        HMFGetOSLogHandle();
        v22 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v47 = v23;
          __int16 v48 = 2112;
          v49 = @"HDS";
          _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Adding fallback LAN rules for %@", buf, 0x16u);
        }
        v24 = [(id)objc_opt_class() fallbackConfigurationForRuleset:@"HDS"];
        addFallbackLANRules(&v45, v7, v24);
      }
      LODWORD(v10) = v45;
    }
    else
    {
      LODWORD(v10) = 0;
    }
  }
LABEL_20:
  v25 = objc_msgSend(v7, "copy", context);
  v30.receiver = self;
  v30.super_class = (Class)HMDNetworkRouterHomeKitOnlyFirewallConfiguration;
  v26 = [(HMDNetworkRouterFirewallRuleConfiguration *)&v30 initWithAccessoryIdentifier:v8 lastModifiedTime:v9 fullAccessLAN:v10 != 0 lanRules:v25 fullAccessWAN:0 wanRules:MEMORY[0x1E4F1CBF0]];

  if (v26)
  {
    v26->_isFiltered = v6 != 0;
    v26->_useFallbackForRTP = *((unsigned char *)v42 + 24);
    v26->_useFallbackForHDS = *((unsigned char *)v38 + 24);
  }
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  return v26;
}

void __90__HMDNetworkRouterHomeKitOnlyFirewallConfiguration_initWithAccessory_sourceConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isRequiredForHAPFunctionality]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __90__HMDNetworkRouterHomeKitOnlyFirewallConfiguration_initWithAccessory_sourceConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F2DDE8];
  id v4 = a2;
  v5 = [v4 findServiceWithServiceType:v3];

  if (v5) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  id v6 = [v4 findServiceWithServiceType:@"00000129-0000-1000-8000-0026BB765291"];

  if (v6) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void __90__HMDNetworkRouterHomeKitOnlyFirewallConfiguration_initWithAccessory_sourceConfiguration___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 home];
  id v6 = [v5 accessoryWithUUID:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v9 = v7;

  v8 = v9;
  if (v9)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    v8 = v9;
  }
}

+ (id)fallbackConfigurationForRuleset:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__HMDNetworkRouterHomeKitOnlyFirewallConfiguration_fallbackConfigurationForRuleset___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  uint64_t v3 = fallbackConfigurationForRuleset__once;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&fallbackConfigurationForRuleset__once, block);
  }
  v5 = [(id)fallbackConfigurationForRuleset__fallback objectForKeyedSubscript:v4];

  return v5;
}

void __84__HMDNetworkRouterHomeKitOnlyFirewallConfiguration_fallbackConfigurationForRuleset___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:*(void *)(a1 + 32)];
  uint64_t v3 = [v2 pathForResource:@"NetworkProtectionRules" ofType:@"plist"];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v3];
    if (v4)
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      v20 = __84__HMDNetworkRouterHomeKitOnlyFirewallConfiguration_fallbackConfigurationForRuleset___block_invoke_20;
      v21 = &unk_1E6A0E670;
      uint64_t v6 = *(void *)(a1 + 32);
      id v22 = v5;
      uint64_t v23 = v6;
      id v7 = v5;
      [v4 enumerateKeysAndObjectsUsingBlock:&v18];
      uint64_t v8 = objc_msgSend(v7, "copy", v18, v19, v20, v21);
      id v9 = (void *)fallbackConfigurationForRuleset__fallback;
      fallbackConfigurationForRuleset__fallback = v8;
    }
    else
    {
      v14 = (void *)MEMORY[0x1D9452090]();
      id v15 = *(id *)(a1 + 32);
      v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v25 = v17;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to load fallback network protection rules", buf, 0xCu);
      }
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = *(id *)(a1 + 32);
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v25 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to locate fallback network protection rules", buf, 0xCu);
    }
  }
}

void __84__HMDNetworkRouterHomeKitOnlyFirewallConfiguration_fallbackConfigurationForRuleset___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  id v10 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  if (v9) {
    BOOL v13 = v12 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13
    || (v14 = [HMDNetworkRouterFirewallRuleConfiguration alloc],
        [*(id *)(a1 + 40) fallbackIdentifier],
        id v15 = objc_claimAutoreleasedReturnValue(),
        v16 = [(HMDNetworkRouterFirewallRuleConfiguration *)v14 initWithAccessoryIdentifier:v15 jsonDictionary:v12], v15, !v16))
  {
    v17 = (void *)MEMORY[0x1D9452090]();
    id v18 = *(id *)(a1 + 40);
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      int v21 = 138543618;
      id v22 = v20;
      __int16 v23 = 2112;
      id v24 = v7;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse fallback network protection rules for '%@'", (uint8_t *)&v21, 0x16u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) setObject:v16 forKeyedSubscript:v9];
  }
}

+ (id)fallbackIdentifier
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F65590]) initWithMajorVersion:0 minorVersion:0 updateVersion:0];
  uint64_t v3 = [[HMDNetworkRouterFirewallRuleAccessoryIdentifier alloc] initWithProductGroup:@"00000000" productNumber:@"00000000" firmwareVersion:v2];

  return v3;
}

@end