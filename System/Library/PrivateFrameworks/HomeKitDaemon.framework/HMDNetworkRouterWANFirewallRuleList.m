@interface HMDNetworkRouterWANFirewallRuleList
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HMDNetworkRouterWANFirewallRuleList)init;
- (HMDNetworkRouterWANFirewallRuleList)initWithPortRules:(id)a3 icmpRules:(id)a4;
- (NSMutableArray)icmpRules;
- (NSMutableArray)portRules;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setIcmpRules:(id)a3;
- (void)setPortRules:(id)a3;
@end

@implementation HMDNetworkRouterWANFirewallRuleList

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icmpRules, 0);
  objc_storeStrong((id *)&self->_portRules, 0);
}

- (void)setIcmpRules:(id)a3
{
}

- (NSMutableArray)icmpRules
{
  return self->_icmpRules;
}

- (void)setPortRules:(id)a3
{
}

- (NSMutableArray)portRules
{
  return self->_portRules;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HMDNetworkRouterWANFirewallRuleList *)self portRules];
  v5 = [(HMDNetworkRouterWANFirewallRuleList *)self icmpRules];
  v6 = [v3 stringWithFormat:@"<HMDNetworkRouterWANFirewallRuleList portRules=%@, icmpRules=%@>", v4, v5];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HMDNetworkRouterWANFirewallRuleList *)a3;
  if (self == v5)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      v7 = [(HMDNetworkRouterWANFirewallRuleList *)self portRules];
      v8 = [(HMDNetworkRouterWANFirewallRuleList *)v6 portRules];
      if (v7 != v8)
      {
        v9 = [(HMDNetworkRouterWANFirewallRuleList *)self portRules];
        v3 = [(HMDNetworkRouterWANFirewallRuleList *)v6 portRules];
        if (![v9 isEqual:v3])
        {
          char v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v16 = v9;
      }
      v11 = [(HMDNetworkRouterWANFirewallRuleList *)self icmpRules];
      v12 = [(HMDNetworkRouterWANFirewallRuleList *)v6 icmpRules];
      if (v11 == v12)
      {
        char v10 = 1;
      }
      else
      {
        v13 = [(HMDNetworkRouterWANFirewallRuleList *)self icmpRules];
        v14 = [(HMDNetworkRouterWANFirewallRuleList *)v6 icmpRules];
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
  v4 = +[HMDNetworkRouterWANFirewallRuleList allocWithZone:a3];
  v5 = [(HMDNetworkRouterWANFirewallRuleList *)self portRules];
  v6 = [(HMDNetworkRouterWANFirewallRuleList *)self icmpRules];
  v7 = [(HMDNetworkRouterWANFirewallRuleList *)v4 initWithPortRules:v5 icmpRules:v6];

  return v7;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v40 = 0u;
  TLV8BufferInit();
  long long v37 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v34 = 0u;
  v5 = [(HMDNetworkRouterWANFirewallRuleList *)self portRules];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v35;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v35 != v9) {
        objc_enumerationMutation(v5);
      }
      v11 = *(void **)(*((void *)&v34 + 1) + 8 * v10);
      if (v8)
      {
        if (TLV8BufferAppend()) {
          break;
        }
      }
      id v33 = 0;
      v12 = [v11 serializeWithError:&v33];
      id v13 = v33;
      if (v13)
      {
LABEL_24:
        v25 = v13;

        if (!a3) {
          goto LABEL_30;
        }
        id v26 = v25;
        v25 = v26;
        goto LABEL_28;
      }
      id v14 = v12;
      [v14 bytes];
      [v14 length];
      int v15 = TLV8BufferAppend();

      if (v15) {
        break;
      }
      ++v10;
      char v8 = 1;
      if (v7 == v10)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v5 = [(HMDNetworkRouterWANFirewallRuleList *)self icmpRules];
    uint64_t v16 = [v5 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (!v16)
    {
LABEL_23:

      v24 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v40);
      v25 = 0;
      goto LABEL_31;
    }
    uint64_t v17 = v16;
    char v18 = 0;
    uint64_t v19 = *(void *)v30;
LABEL_14:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v30 != v19) {
        objc_enumerationMutation(v5);
      }
      v21 = *(void **)(*((void *)&v29 + 1) + 8 * v20);
      if (v18)
      {
        if (TLV8BufferAppend()) {
          break;
        }
      }
      id v28 = 0;
      v12 = [v21 serializeWithError:&v28];
      id v13 = v28;
      if (v13) {
        goto LABEL_24;
      }
      id v22 = v12;
      [v22 bytes];
      [v22 length];
      int v23 = TLV8BufferAppend();

      if (v23) {
        break;
      }
      ++v20;
      char v18 = 1;
      if (v17 == v20)
      {
        uint64_t v17 = [v5 countByEnumeratingWithState:&v29 objects:v38 count:16];
        if (v17) {
          goto LABEL_14;
        }
        goto LABEL_23;
      }
    }
  }

  if (a3)
  {
    HMErrorFromOSStatus();
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    v25 = 0;
LABEL_28:
    v24 = 0;
    *a3 = v26;
  }
  else
  {
    v25 = 0;
LABEL_30:
    v24 = 0;
  }
LABEL_31:
  TLV8BufferFree();

  return v24;
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
  uint64_t v10 = [MEMORY[0x263EFF980] array];
  v11 = [MEMORY[0x263EFF980] array];
  if (!v9)
  {
LABEL_27:
    if (objc_msgSend(v10, "count", v24)) {
      v21 = v10;
    }
    else {
      v21 = 0;
    }
    [(HMDNetworkRouterWANFirewallRuleList *)self setPortRules:v21];
    if ([v11 count]) {
      id v22 = v11;
    }
    else {
      id v22 = 0;
    }
    [(HMDNetworkRouterWANFirewallRuleList *)self setIcmpRules:v22];
    v12 = 0;
    BOOL v20 = 1;
    goto LABEL_35;
  }
  v24 = self;
  v12 = 0;
  uint64_t v13 = v8 + v9;
  while (1)
  {
    char v31 = 0;
    long long v29 = 0;
    uint64_t v30 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    if (TLV8GetNext() || TLV8GetOrCopyCoalesced()) {
      break;
    }
    if (!v30)
    {
      uint64_t v19 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F41FD8] code:3 userInfo:0];

      v12 = (void *)v19;
LABEL_23:
      self = v24;
      if (!v12) {
        goto LABEL_27;
      }
      if (a4)
      {
        id v18 = v12;
        v12 = v18;
        goto LABEL_26;
      }
      goto LABEL_34;
    }
    if (v31 == 2)
    {
      id v14 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:");
      id v25 = v12;
      int v15 = +[HMDNetworkRouterWANICMPRule parsedFromData:v14 error:&v25];
      id v16 = v25;

      if (!v16)
      {
        uint64_t v17 = v11;
LABEL_14:
        objc_msgSend(v17, "addObject:", v15, v24);
      }
LABEL_15:

      v12 = v16;
      goto LABEL_16;
    }
    if (v31 == 1)
    {
      id v14 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:");
      id v26 = v12;
      int v15 = +[HMDNetworkRouterWANPortRule parsedFromData:v14 error:&v26];
      id v16 = v26;

      if (!v16)
      {
        uint64_t v17 = v10;
        goto LABEL_14;
      }
      goto LABEL_15;
    }
LABEL_16:
    if (v29) {
      free(v29);
    }
    if (v27 == v13) {
      goto LABEL_23;
    }
  }
  if (a4)
  {
    HMErrorFromOSStatus();
    id v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:
    BOOL v20 = 0;
    *a4 = v18;
    goto LABEL_35;
  }
LABEL_34:
  BOOL v20 = 0;
LABEL_35:

  return v20;
}

- (HMDNetworkRouterWANFirewallRuleList)initWithPortRules:(id)a3 icmpRules:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDNetworkRouterWANFirewallRuleList;
  uint64_t v9 = [(HMDNetworkRouterWANFirewallRuleList *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_portRules, a3);
    objc_storeStrong((id *)&v10->_icmpRules, a4);
  }

  return v10;
}

- (HMDNetworkRouterWANFirewallRuleList)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterWANFirewallRuleList;
  return [(HMDNetworkRouterWANFirewallRuleList *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HMDNetworkRouterWANFirewallRuleList);
  id v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HMDNetworkRouterWANFirewallRuleList *)v6 parseFromData:v5 error:&v10];
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