@interface HMDNetworkRouterWANFirewallConfiguration
+ (HMDNetworkRouterWANFirewallConfiguration)configurationWithFullAccess;
+ (id)configurationFromFirewallRuleConfiguration:(id)a3;
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HMDNetworkRouterWANFirewall)type;
- (HMDNetworkRouterWANFirewallConfiguration)init;
- (HMDNetworkRouterWANFirewallConfiguration)initWithType:(id)a3 ruleList:(id)a4;
- (HMDNetworkRouterWANFirewallRuleList)ruleList;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setRuleList:(id)a3;
- (void)setType:(id)a3;
@end

@implementation HMDNetworkRouterWANFirewallConfiguration

+ (id)configurationFromFirewallRuleConfiguration:(id)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_alloc_init(HMDNetworkRouterWANFirewallConfiguration);
  int v5 = [v3 hasFullAccessToWAN];
  char v6 = v5;
  v7 = [[HMDNetworkRouterWANFirewall alloc] initWithType:v5 ^ 1u];
  v63 = v4;
  [(HMDNetworkRouterWANFirewallConfiguration *)v4 setType:v7];

  if ((v6 & 1) == 0)
  {
    v8 = objc_alloc_init(HMDNetworkRouterWANFirewallRuleList);
    [(HMDNetworkRouterWANFirewallConfiguration *)v4 setRuleList:v8];

    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v58 = v3;
    id obj = [v3 wanRules];
    uint64_t v66 = [obj countByEnumeratingWithState:&v73 objects:v77 count:16];
    if (!v66) {
      goto LABEL_35;
    }
    uint64_t v65 = *(void *)v74;
    unint64_t v9 = 0x1E4F5B000uLL;
    unint64_t v10 = 0x1E4F28000uLL;
    while (1)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v74 != v65) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(id *)(*((void *)&v73 + 1) + 8 * v11);
        if ([v12 transportProtocol] == 2)
        {
          v13 = [v12 icmpTypes];
          v14 = +[HMDNetworkRouterICMPTypeList typeListFromICMPTypes:v13];

          if (!v14) {
            goto LABEL_13;
          }
          v15 = 0;
          v16 = 0;
          v70 = 0;
        }
        else
        {
          uint64_t v17 = +[HMDNetworkRouterProtocol protocolFromTransportProtocol:](HMDNetworkRouterProtocol, "protocolFromTransportProtocol:", [v12 transportProtocol]);
          if (!v17)
          {
LABEL_13:

            goto LABEL_24;
          }
          v15 = (void *)v17;
          id v18 = objc_alloc(*(Class *)(v9 + 3688));
          v19 = objc_msgSend(*(id *)(v10 + 3792), "numberWithUnsignedShort:", objc_msgSend(v12, "portStart"));
          v16 = (void *)[v18 initWithValue:v19];

          LODWORD(v18) = [v12 portStart];
          if (v18 == [v12 portEnd])
          {
            v70 = 0;
          }
          else
          {
            id v20 = objc_alloc(*(Class *)(v9 + 3688));
            v21 = objc_msgSend(*(id *)(v10 + 3792), "numberWithUnsignedShort:", objc_msgSend(v12, "portEnd"));
            v70 = (void *)[v20 initWithValue:v21];
          }
          v14 = 0;
        }
        v22 = [v12 subject];
        v23 = [v22 hostnames];

        v68 = v16;
        v69 = v15;
        v67 = v14;
        if (v23)
        {
          v24 = [v22 hostnames];
          id v25 = v14;
          id v26 = v15;
          id v27 = v16;
          id v28 = v70;
          v29 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v24, "count"));
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __HMDNetworkRouterWANRulesFromHostNames_block_invoke;
          v79 = &unk_1E6A0BCC0;
          id v80 = v25;
          id v81 = v26;
          id v82 = v27;
          id v83 = v28;
          id v84 = v29;
          id v30 = v25;
          id v31 = v26;
          id v32 = v27;
          id v33 = v28;
          id v34 = v29;
          objc_msgSend(v24, "hmf_enumerateWithAutoreleasePoolUsingBlock:", buf);
          v35 = (void *)[v34 copy];

          unint64_t v9 = 0x1E4F5B000;
          unint64_t v10 = 0x1E4F28000;

          goto LABEL_20;
        }
        v36 = [v22 addresses];

        if (v36)
        {
          v24 = [v22 addresses];
          id v37 = v14;
          id v38 = v15;
          id v39 = v16;
          id v40 = v70;
          v41 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v24, "count"));
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __HMDNetworkRouterWANRulesFromAddresses_block_invoke;
          v79 = &unk_1E6A0BCE8;
          id v80 = v37;
          id v81 = v38;
          id v82 = v39;
          id v83 = v40;
          id v84 = v41;
          id v61 = v37;
          id v31 = v38;
          id v32 = v39;
          id v42 = v40;
          unint64_t v9 = 0x1E4F5B000;
          id v43 = v42;
          id v44 = v41;
          objc_msgSend(v24, "hmf_enumerateWithAutoreleasePoolUsingBlock:", buf);
          v35 = (void *)[v44 copy];

          unint64_t v10 = 0x1E4F28000;
LABEL_20:

LABEL_21:
          v16 = v68;
          v15 = v69;
          v14 = v67;
          goto LABEL_22;
        }
        v35 = [v22 addressRange];

        if (v35)
        {
          v24 = [v22 addressRange];
          id v48 = v14;
          id v62 = v15;
          id v60 = v16;
          id v59 = v70;
          v49 = [v24 addressStart];
          v50 = +[HMDNetworkRouterIPAddress ipAddressFromRuleAddress:v49 allowWildcard:0];

          v51 = [v24 addressEnd];
          v52 = +[HMDNetworkRouterIPAddress ipAddressFromRuleAddress:v51 allowWildcard:0];

          v53 = v48;
          if (v48) {
            v54 = [[HMDNetworkRouterWANICMPRule alloc] initWithHostDNSName:0 hostIPStart:v50 hostIPEnd:v52 icmpTypes:v48];
          }
          else {
            v54 = [[HMDNetworkRouterWANPortRule alloc] initWithProtocol:v62 hostDNSName:0 hostIPStart:v50 hostIPEnd:v52 hostPortStart:v60 hostPortEnd:v59];
          }
          v55 = v54;
          *(void *)buf = v54;
          v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];

          unint64_t v10 = 0x1E4F28000;
          goto LABEL_21;
        }
LABEL_22:

        if (v35)
        {
          v71[0] = MEMORY[0x1E4F143A8];
          v71[1] = 3221225472;
          v71[2] = __98__HMDNetworkRouterWANFirewallConfiguration_Additions__configurationFromFirewallRuleConfiguration___block_invoke;
          v71[3] = &unk_1E6A0BC98;
          v72 = v63;
          objc_msgSend(v35, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v71);

          goto LABEL_27;
        }
LABEL_24:
        v45 = (void *)MEMORY[0x1D9452090]();
        v46 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          v47 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v47;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v12;
          _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert WAN rule to TLV, skipping: %@", buf, 0x16u);
        }
        v35 = 0;
LABEL_27:

        ++v11;
      }
      while (v66 != v11);
      uint64_t v56 = [obj countByEnumeratingWithState:&v73 objects:v77 count:16];
      uint64_t v66 = v56;
      if (!v56)
      {
LABEL_35:

        id v3 = v58;
        break;
      }
    }
  }

  return v63;
}

void __98__HMDNetworkRouterWANFirewallConfiguration_Additions__configurationFromFirewallRuleConfiguration___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 ruleList];
  [v3 addTo:v4];
}

+ (HMDNetworkRouterWANFirewallConfiguration)configurationWithFullAccess
{
  v2 = objc_alloc_init(HMDNetworkRouterWANFirewallConfiguration);
  id v3 = [[HMDNetworkRouterWANFirewall alloc] initWithType:0];
  [(HMDNetworkRouterWANFirewallConfiguration *)v2 setType:v3];

  id v4 = objc_alloc_init(HMDNetworkRouterWANFirewallRuleList);
  [(HMDNetworkRouterWANFirewallConfiguration *)v2 setRuleList:v4];

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

- (HMDNetworkRouterWANFirewallRuleList)ruleList
{
  return self->_ruleList;
}

- (void)setType:(id)a3
{
}

- (HMDNetworkRouterWANFirewall)type
{
  return self->_type;
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = [(HMDNetworkRouterWANFirewallConfiguration *)self type];
  int v5 = [(HMDNetworkRouterWANFirewallConfiguration *)self ruleList];
  char v6 = [v3 stringWithFormat:@"<HMDNetworkRouterWANFirewallConfiguration type=%@, ruleList=%@>", v4, v5];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = (HMDNetworkRouterWANFirewallConfiguration *)a3;
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
      v7 = [(HMDNetworkRouterWANFirewallConfiguration *)self type];
      v8 = [(HMDNetworkRouterWANFirewallConfiguration *)v6 type];
      if (v7 != v8)
      {
        unint64_t v9 = [(HMDNetworkRouterWANFirewallConfiguration *)self type];
        id v3 = [(HMDNetworkRouterWANFirewallConfiguration *)v6 type];
        if (![v9 isEqual:v3])
        {
          char v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v16 = v9;
      }
      uint64_t v11 = [(HMDNetworkRouterWANFirewallConfiguration *)self ruleList];
      id v12 = [(HMDNetworkRouterWANFirewallConfiguration *)v6 ruleList];
      if (v11 == v12)
      {
        char v10 = 1;
      }
      else
      {
        v13 = [(HMDNetworkRouterWANFirewallConfiguration *)self ruleList];
        v14 = [(HMDNetworkRouterWANFirewallConfiguration *)v6 ruleList];
        char v10 = [v13 isEqual:v14];
      }
      unint64_t v9 = v16;
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
  id v4 = +[HMDNetworkRouterWANFirewallConfiguration allocWithZone:a3];
  int v5 = [(HMDNetworkRouterWANFirewallConfiguration *)self type];
  char v6 = [(HMDNetworkRouterWANFirewallConfiguration *)self ruleList];
  v7 = [(HMDNetworkRouterWANFirewallConfiguration *)v4 initWithType:v5 ruleList:v6];

  return v7;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
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
  int v5 = [(HMDNetworkRouterWANFirewallConfiguration *)self type];

  if (v5)
  {
    char v6 = [(HMDNetworkRouterWANFirewallConfiguration *)self type];
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
  uint64_t v11 = [(HMDNetworkRouterWANFirewallConfiguration *)self ruleList];

  if (!v11)
  {
LABEL_12:
    v16 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v20);
    id v8 = 0;
    goto LABEL_15;
  }
  id v12 = [(HMDNetworkRouterWANFirewallConfiguration *)self ruleList];
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
  id v12 = 0;
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
      uint64_t v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

      id v12 = (void *)v20;
      if (!v20) {
        goto LABEL_25;
      }
LABEL_17:
      if (a4)
      {
        id v18 = v12;
        id v12 = v18;
LABEL_22:
        BOOL v19 = 0;
        *a4 = v18;
        goto LABEL_27;
      }
      goto LABEL_23;
    }
    if (v29 == 2)
    {
      id v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
      long long v23 = v12;
      int v15 = &v23;
      +[HMDNetworkRouterWANFirewallRuleList parsedFromData:v14 error:&v23];
      int v10 = v16 = v10;
    }
    else
    {
      if (v29 != 1) {
        goto LABEL_13;
      }
      id v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
      long long v24 = v12;
      int v15 = &v24;
      +[HMDNetworkRouterWANFirewall parsedFromData:v14 error:&v24];
      uint64_t v11 = v16 = v11;
    }
    id v17 = *v15;

    id v12 = v17;
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
  -[HMDNetworkRouterWANFirewallConfiguration setType:](self, "setType:", v11, v22);
  [(HMDNetworkRouterWANFirewallConfiguration *)self setRuleList:v10];
  id v12 = 0;
  BOOL v19 = 1;
LABEL_27:

  return v19;
}

- (HMDNetworkRouterWANFirewallConfiguration)initWithType:(id)a3 ruleList:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDNetworkRouterWANFirewallConfiguration;
  uint64_t v9 = [(HMDNetworkRouterWANFirewallConfiguration *)&v12 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_type, a3);
    objc_storeStrong((id *)&v10->_ruleList, a4);
  }

  return v10;
}

- (HMDNetworkRouterWANFirewallConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterWANFirewallConfiguration;
  return [(HMDNetworkRouterWANFirewallConfiguration *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HMDNetworkRouterWANFirewallConfiguration);
  id v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HMDNetworkRouterWANFirewallConfiguration *)v6 parseFromData:v5 error:&v10];
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