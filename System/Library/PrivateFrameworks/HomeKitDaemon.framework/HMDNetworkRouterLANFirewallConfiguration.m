@interface HMDNetworkRouterLANFirewallConfiguration
+ (HMDNetworkRouterLANFirewallConfiguration)configurationWithFullAccess;
+ (id)configurationFromFirewallRuleConfiguration:(id)a3;
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HMDNetworkRouterLANFirewall)type;
- (HMDNetworkRouterLANFirewallConfiguration)init;
- (HMDNetworkRouterLANFirewallConfiguration)initWithType:(id)a3 ruleList:(id)a4;
- (HMDNetworkRouterLANFirewallRuleList)ruleList;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)addRulesFromFirewallConfiguration:(id)a3;
- (void)setRuleList:(id)a3;
- (void)setType:(id)a3;
@end

@implementation HMDNetworkRouterLANFirewallConfiguration

- (void)addRulesFromFirewallConfiguration:(id)a3
{
  id v20 = +[HMDNetworkRouterLANFirewallConfiguration configurationFromFirewallRuleConfiguration:a3];
  v4 = [(HMDNetworkRouterLANFirewallConfiguration *)self ruleList];
  v5 = [v4 dynamicPortRules];
  v6 = [v20 ruleList];
  v7 = [v6 dynamicPortRules];
  [v5 addObjectsFromArray:v7];

  v8 = [(HMDNetworkRouterLANFirewallConfiguration *)self ruleList];
  v9 = [v8 staticPortRules];
  v10 = [v20 ruleList];
  v11 = [v10 staticPortRules];
  [v9 addObjectsFromArray:v11];

  v12 = [(HMDNetworkRouterLANFirewallConfiguration *)self ruleList];
  v13 = [v12 staticICMPRules];
  v14 = [v20 ruleList];
  v15 = [v14 staticICMPRules];
  [v13 addObjectsFromArray:v15];

  v16 = [(HMDNetworkRouterLANFirewallConfiguration *)self ruleList];
  v17 = [v16 multicastBridgingRules];
  v18 = [v20 ruleList];
  v19 = [v18 multicastBridgingRules];
  [v17 addObjectsFromArray:v19];
}

+ (id)configurationFromFirewallRuleConfiguration:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_alloc_init(HMDNetworkRouterLANFirewallConfiguration);
  int v5 = [v3 hasFullAccessToLAN];
  char v6 = v5;
  v7 = [[HMDNetworkRouterLANFirewall alloc] initWithType:v5 ^ 1u];
  [(HMDNetworkRouterLANFirewallConfiguration *)v4 setType:v7];

  if ((v6 & 1) == 0)
  {
    v8 = objc_alloc_init(HMDNetworkRouterLANFirewallRuleList);
    [(HMDNetworkRouterLANFirewallConfiguration *)v4 setRuleList:v8];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v33 = v3;
    v9 = [v3 lanRules];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (!v10) {
      goto LABEL_19;
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v36;
    p_cache = &OBJC_METACLASS___HMDDurationEventModel.cache;
    v14 = off_264A12538;
    while (1)
    {
      uint64_t v15 = 0;
      uint64_t v34 = v11;
      do
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v9);
        }
        v16 = *(void **)(*((void *)&v35 + 1) + 8 * v15);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        v18 = v14;
        if ((isKindOfClass & 1) == 0)
        {
          objc_opt_class();
          char v19 = objc_opt_isKindOfClass();
          v18 = off_264A12540;
          if ((v19 & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_14;
            }
            int v20 = [v16 transportProtocol];
            v18 = off_264A12550;
            if (v20 == 2) {
              v18 = off_264A12548;
            }
          }
        }
        uint64_t v21 = [(__objc2_class *)*v18 ruleFromFirewallRuleLAN:v16];
        if (v21)
        {
          v22 = (void *)v21;
          v23 = [(HMDNetworkRouterLANFirewallConfiguration *)v4 ruleList];
          [v22 addTo:v23];

          goto LABEL_17;
        }
LABEL_14:
        v24 = (void *)MEMORY[0x230FBD990]();
        v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          uint64_t v26 = v12;
          v27 = v14;
          v28 = p_cache;
          v29 = v9;
          v31 = v30 = v4;
          *(_DWORD *)buf = 138543618;
          v40 = v31;
          __int16 v41 = 2112;
          v42 = v16;
          _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert LAN rule to TLV, skipping: %@", buf, 0x16u);

          v4 = v30;
          v9 = v29;
          p_cache = v28;
          v14 = v27;
          uint64_t v12 = v26;
          uint64_t v11 = v34;
        }

LABEL_17:
        ++v15;
      }
      while (v11 != v15);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v43 count:16];
      if (!v11)
      {
LABEL_19:

        id v3 = v33;
        break;
      }
    }
  }

  return v4;
}

+ (HMDNetworkRouterLANFirewallConfiguration)configurationWithFullAccess
{
  v2 = objc_alloc_init(HMDNetworkRouterLANFirewallConfiguration);
  id v3 = [[HMDNetworkRouterLANFirewall alloc] initWithType:0];
  [(HMDNetworkRouterLANFirewallConfiguration *)v2 setType:v3];

  v4 = objc_alloc_init(HMDNetworkRouterLANFirewallRuleList);
  [(HMDNetworkRouterLANFirewallConfiguration *)v2 setRuleList:v4];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ruleList, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (void)setRuleList:(id)a3
{
}

- (HMDNetworkRouterLANFirewallRuleList)ruleList
{
  return self->_ruleList;
}

- (void)setType:(id)a3
{
}

- (HMDNetworkRouterLANFirewall)type
{
  return self->_type;
}

- (NSString)description
{
  id v3 = NSString;
  v4 = [(HMDNetworkRouterLANFirewallConfiguration *)self type];
  int v5 = [(HMDNetworkRouterLANFirewallConfiguration *)self ruleList];
  char v6 = [v3 stringWithFormat:@"<HMDNetworkRouterLANFirewallConfiguration type=%@, ruleList=%@>", v4, v5];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = (HMDNetworkRouterLANFirewallConfiguration *)a3;
  if (self == v5)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v6 = v5;
      v7 = [(HMDNetworkRouterLANFirewallConfiguration *)self type];
      v8 = [(HMDNetworkRouterLANFirewallConfiguration *)v6 type];
      if (v7 != v8)
      {
        v9 = [(HMDNetworkRouterLANFirewallConfiguration *)self type];
        id v3 = [(HMDNetworkRouterLANFirewallConfiguration *)v6 type];
        if (![v9 isEqual:v3])
        {
          char v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v16 = v9;
      }
      uint64_t v11 = [(HMDNetworkRouterLANFirewallConfiguration *)self ruleList];
      uint64_t v12 = [(HMDNetworkRouterLANFirewallConfiguration *)v6 ruleList];
      if (v11 == v12)
      {
        char v10 = 1;
      }
      else
      {
        v13 = [(HMDNetworkRouterLANFirewallConfiguration *)self ruleList];
        v14 = [(HMDNetworkRouterLANFirewallConfiguration *)v6 ruleList];
        char v10 = [v13 isEqual:v14];
      }
      v9 = v16;
      if (v7 == v8) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    char v10 = 0;
  }
LABEL_15:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HMDNetworkRouterLANFirewallConfiguration allocWithZone:a3];
  int v5 = [(HMDNetworkRouterLANFirewallConfiguration *)self type];
  char v6 = [(HMDNetworkRouterLANFirewallConfiguration *)self ruleList];
  v7 = [(HMDNetworkRouterLANFirewallConfiguration *)v4 initWithType:v5 ruleList:v6];

  return v7;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v20 = 0u;
  TLV8BufferInit();
  int v5 = [(HMDNetworkRouterLANFirewallConfiguration *)self type];

  if (v5)
  {
    char v6 = [(HMDNetworkRouterLANFirewallConfiguration *)self type];
    id v19 = 0;
    v7 = [v6 serializeWithError:&v19];
    id v8 = v19;

    if (v8) {
      goto LABEL_6;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    int v10 = TLV8BufferAppend();

    if (v10)
    {
LABEL_9:
      if (a3)
      {
        HMErrorFromOSStatus();
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        id v8 = 0;
        goto LABEL_11;
      }
      id v8 = 0;
      goto LABEL_14;
    }
  }
  uint64_t v11 = [(HMDNetworkRouterLANFirewallConfiguration *)self ruleList];

  if (!v11)
  {
LABEL_12:
    v16 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v20);
    id v8 = 0;
    goto LABEL_15;
  }
  uint64_t v12 = [(HMDNetworkRouterLANFirewallConfiguration *)self ruleList];
  id v18 = 0;
  v7 = [v12 serializeWithError:&v18];
  id v8 = v18;

  if (!v8)
  {
    id v14 = v7;
    [v14 bytes];
    [v14 length];
    int v15 = TLV8BufferAppend();

    if (v15) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
LABEL_6:

  if (a3)
  {
    id v13 = v8;
    id v8 = v13;
LABEL_11:
    v16 = 0;
    *a3 = v13;
    goto LABEL_15;
  }
LABEL_14:
  v16 = 0;
LABEL_15:
  TLV8BufferFree();

  return v16;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (a4) {
    *a4 = 0;
  }
  id v7 = v6;
  uint64_t v8 = [v7 bytes];
  uint64_t v9 = [v7 length];
  if (!v9)
  {
    int v10 = 0;
    uint64_t v11 = 0;
    goto LABEL_26;
  }
  long long v22 = self;
  int v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = v8 + v9;
  do
  {
    char v29 = 0;
    long long v27 = 0;
    uint64_t v28 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    if (TLV8GetNext() || TLV8GetOrCopyCoalesced())
    {
      if (a4)
      {
        HMErrorFromOSStatus();
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
LABEL_23:
      BOOL v19 = 0;
      goto LABEL_27;
    }
    if (!v28)
    {
      uint64_t v20 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F41FD8] code:3 userInfo:0];

      uint64_t v12 = (void *)v20;
      if (!v20) {
        goto LABEL_25;
      }
LABEL_17:
      if (a4)
      {
        id v18 = v12;
        uint64_t v12 = v18;
LABEL_22:
        BOOL v19 = 0;
        *a4 = v18;
        goto LABEL_27;
      }
      goto LABEL_23;
    }
    if (v29 == 2)
    {
      id v14 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:");
      long long v23 = v12;
      int v15 = &v23;
      +[HMDNetworkRouterLANFirewallRuleList parsedFromData:v14 error:&v23];
      int v10 = v16 = v10;
    }
    else
    {
      if (v29 != 1) {
        goto LABEL_13;
      }
      id v14 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:");
      long long v24 = v12;
      int v15 = &v24;
      +[HMDNetworkRouterLANFirewall parsedFromData:v14 error:&v24];
      uint64_t v11 = v16 = v11;
    }
    id v17 = *v15;

    uint64_t v12 = v17;
LABEL_13:
    if (v27) {
      free(v27);
    }
  }
  while (v25 != v13);
  if (v12) {
    goto LABEL_17;
  }
LABEL_25:
  self = v22;
LABEL_26:
  -[HMDNetworkRouterLANFirewallConfiguration setType:](self, "setType:", v11, v22);
  [(HMDNetworkRouterLANFirewallConfiguration *)self setRuleList:v10];
  uint64_t v12 = 0;
  BOOL v19 = 1;
LABEL_27:

  return v19;
}

- (HMDNetworkRouterLANFirewallConfiguration)initWithType:(id)a3 ruleList:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDNetworkRouterLANFirewallConfiguration;
  uint64_t v9 = [(HMDNetworkRouterLANFirewallConfiguration *)&v12 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_type, a3);
    objc_storeStrong((id *)&v10->_ruleList, a4);
  }

  return v10;
}

- (HMDNetworkRouterLANFirewallConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterLANFirewallConfiguration;
  return [(HMDNetworkRouterLANFirewallConfiguration *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HMDNetworkRouterLANFirewallConfiguration);
  id v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HMDNetworkRouterLANFirewallConfiguration *)v6 parseFromData:v5 error:&v10];
    id v8 = v10;
    if (v8)
    {

      id v7 = 0;
      if (a4) {
        *a4 = v8;
      }
    }
  }
  return v7;
}

@end