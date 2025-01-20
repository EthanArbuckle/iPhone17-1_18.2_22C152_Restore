@interface HMDNetworkRouterStaticICMPRule
+ (id)parsedFromData:(id)a3 error:(id *)a4;
+ (id)ruleFromFirewallRuleLAN:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HMDNetworkRouterICMPTypeList)icmpTypeList;
- (HMDNetworkRouterIPAddress)destinationIPAddress;
- (HMDNetworkRouterLANIdentifierList)lanIdentifierList;
- (HMDNetworkRouterRuleDirection)direction;
- (HMDNetworkRouterStaticICMPRule)init;
- (HMDNetworkRouterStaticICMPRule)initWithDirection:(id)a3 lanIdentifierList:(id)a4 destinationIPAddress:(id)a5 icmpTypeList:(id)a6;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)addTo:(id)a3;
- (void)setDestinationIPAddress:(id)a3;
- (void)setDirection:(id)a3;
- (void)setIcmpTypeList:(id)a3;
- (void)setLanIdentifierList:(id)a3;
@end

@implementation HMDNetworkRouterStaticICMPRule

- (void)addTo:(id)a3
{
  id v7 = a3;
  v4 = [v7 staticICMPRules];
  v5 = v4;
  if (v4)
  {
    [v4 addObject:self];
  }
  else
  {
    v6 = [MEMORY[0x1E4F1CA48] arrayWithObject:self];
    [v7 setStaticICMPRules:v6];
  }
}

+ (id)ruleFromFirewallRuleLAN:(id)a3
{
  id v3 = a3;
  if ([v3 transportProtocol] == 2)
  {
    v4 = +[HMDNetworkRouterRuleDirection directionFromLANDirection:](HMDNetworkRouterRuleDirection, "directionFromLANDirection:", [v3 direction]);
    v5 = createIdentifierListFromLANRule(v3);
    v6 = [v3 ipAddress];

    if (v6
      && ([v3 ipAddress],
          id v7 = objc_claimAutoreleasedReturnValue(),
          +[HMDNetworkRouterIPAddress ipAddressFromRuleAddress:v7 allowWildcard:0], v6 = objc_claimAutoreleasedReturnValue(), v7, !v6))
    {
      v10 = 0;
    }
    else
    {
      v8 = [v3 icmpTypes];
      v9 = +[HMDNetworkRouterICMPTypeList typeListFromICMPTypes:v8];

      v10 = 0;
      if (v4 && v5 && v9) {
        v10 = [[HMDNetworkRouterStaticICMPRule alloc] initWithDirection:v4 lanIdentifierList:v5 destinationIPAddress:v6 icmpTypeList:v9];
      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icmpTypeList, 0);
  objc_storeStrong((id *)&self->_destinationIPAddress, 0);
  objc_storeStrong((id *)&self->_lanIdentifierList, 0);
  objc_storeStrong((id *)&self->_direction, 0);
}

- (void)setIcmpTypeList:(id)a3
{
}

- (HMDNetworkRouterICMPTypeList)icmpTypeList
{
  return self->_icmpTypeList;
}

- (void)setDestinationIPAddress:(id)a3
{
}

- (HMDNetworkRouterIPAddress)destinationIPAddress
{
  return self->_destinationIPAddress;
}

- (void)setLanIdentifierList:(id)a3
{
}

- (HMDNetworkRouterLANIdentifierList)lanIdentifierList
{
  return self->_lanIdentifierList;
}

- (void)setDirection:(id)a3
{
}

- (HMDNetworkRouterRuleDirection)direction
{
  return self->_direction;
}

- (NSString)description
{
  id v3 = NSString;
  v4 = [(HMDNetworkRouterStaticICMPRule *)self direction];
  v5 = [(HMDNetworkRouterStaticICMPRule *)self lanIdentifierList];
  v6 = [(HMDNetworkRouterStaticICMPRule *)self destinationIPAddress];
  id v7 = [(HMDNetworkRouterStaticICMPRule *)self icmpTypeList];
  v8 = [v3 stringWithFormat:@"<HMDNetworkRouterStaticICMPRule direction=%@, lanIdentifierList=%@, destinationIPAddress=%@, icmpTypeList=%@>", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HMDNetworkRouterStaticICMPRule *)a3;
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
      id v7 = [(HMDNetworkRouterStaticICMPRule *)self direction];
      v8 = [(HMDNetworkRouterStaticICMPRule *)v6 direction];
      if (v7 != v8)
      {
        v9 = [(HMDNetworkRouterStaticICMPRule *)self direction];
        id v3 = [(HMDNetworkRouterStaticICMPRule *)v6 direction];
        v32 = v9;
        if (![v9 isEqual:v3])
        {
          char v10 = 0;
          goto LABEL_25;
        }
      }
      v11 = [(HMDNetworkRouterStaticICMPRule *)self lanIdentifierList];
      v12 = [(HMDNetworkRouterStaticICMPRule *)v6 lanIdentifierList];
      if (v11 != v12)
      {
        v13 = [(HMDNetworkRouterStaticICMPRule *)self lanIdentifierList];
        v31 = [(HMDNetworkRouterStaticICMPRule *)v6 lanIdentifierList];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          char v10 = 0;
LABEL_23:

LABEL_24:
          if (v7 == v8)
          {
LABEL_26:

            goto LABEL_27;
          }
LABEL_25:

          goto LABEL_26;
        }
        v29 = v13;
      }
      uint64_t v14 = [(HMDNetworkRouterStaticICMPRule *)self destinationIPAddress];
      v15 = [(HMDNetworkRouterStaticICMPRule *)v6 destinationIPAddress];
      v30 = (void *)v14;
      if ((void *)v14 == v15)
      {
        v25 = v12;
        v26 = v11;
      }
      else
      {
        v16 = [(HMDNetworkRouterStaticICMPRule *)self destinationIPAddress];
        v27 = [(HMDNetworkRouterStaticICMPRule *)v6 destinationIPAddress];
        v28 = v16;
        if (!objc_msgSend(v16, "isEqual:"))
        {
          char v10 = 0;
          v22 = v30;
          goto LABEL_21;
        }
        v25 = v12;
        v26 = v11;
      }
      v17 = [(HMDNetworkRouterStaticICMPRule *)self icmpTypeList];
      uint64_t v18 = [(HMDNetworkRouterStaticICMPRule *)v6 icmpTypeList];
      if (v17 == (void *)v18)
      {

        char v10 = 1;
      }
      else
      {
        v19 = (void *)v18;
        [(HMDNetworkRouterStaticICMPRule *)self icmpTypeList];
        v20 = v24 = v3;
        v21 = [(HMDNetworkRouterStaticICMPRule *)v6 icmpTypeList];
        char v10 = [v20 isEqual:v21];

        id v3 = v24;
      }
      v22 = v30;
      v12 = v25;
      v11 = v26;
      if (v30 == v15)
      {
LABEL_22:

        v13 = v29;
        if (v11 == v12) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
LABEL_21:

      goto LABEL_22;
    }
    char v10 = 0;
  }
LABEL_27:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HMDNetworkRouterStaticICMPRule allocWithZone:a3];
  v5 = [(HMDNetworkRouterStaticICMPRule *)self direction];
  v6 = [(HMDNetworkRouterStaticICMPRule *)self lanIdentifierList];
  id v7 = [(HMDNetworkRouterStaticICMPRule *)self destinationIPAddress];
  v8 = [(HMDNetworkRouterStaticICMPRule *)self icmpTypeList];
  v9 = [(HMDNetworkRouterStaticICMPRule *)v4 initWithDirection:v5 lanIdentifierList:v6 destinationIPAddress:v7 icmpTypeList:v8];

  return v9;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  TLV8BufferInit();
  v5 = [(HMDNetworkRouterStaticICMPRule *)self direction];

  if (v5)
  {
    v6 = [(HMDNetworkRouterStaticICMPRule *)self direction];
    id v24 = 0;
    id v7 = [v6 serializeWithError:&v24];
    id v8 = v24;

    if (v8) {
      goto LABEL_19;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    if (TLV8BufferAppend()) {
      goto LABEL_12;
    }
  }
  char v10 = [(HMDNetworkRouterStaticICMPRule *)self lanIdentifierList];

  if (!v10) {
    goto LABEL_9;
  }
  v11 = [(HMDNetworkRouterStaticICMPRule *)self lanIdentifierList];
  id v23 = 0;
  id v7 = [v11 serializeWithError:&v23];
  id v8 = v23;

  if (v8) {
    goto LABEL_19;
  }
  id v9 = v7;
  [v9 bytes];
  [v9 length];
  if (TLV8BufferAppend())
  {
LABEL_12:

LABEL_13:
    if (a3)
    {
      HMErrorFromOSStatus();
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      id v8 = 0;
LABEL_21:
      v17 = 0;
      *a3 = v14;
      goto LABEL_23;
    }
    id v8 = 0;
LABEL_22:
    v17 = 0;
    goto LABEL_23;
  }

LABEL_9:
  v12 = [(HMDNetworkRouterStaticICMPRule *)self destinationIPAddress];

  if (v12)
  {
    v13 = [(HMDNetworkRouterStaticICMPRule *)self destinationIPAddress];
    id v22 = 0;
    id v7 = [v13 serializeWithError:&v22];
    id v8 = v22;

    if (v8) {
      goto LABEL_19;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    if (TLV8BufferAppend()) {
      goto LABEL_12;
    }
  }
  v15 = [(HMDNetworkRouterStaticICMPRule *)self icmpTypeList];

  if (v15)
  {
    v16 = [(HMDNetworkRouterStaticICMPRule *)self icmpTypeList];
    id v21 = 0;
    id v7 = [v16 serializeWithError:&v21];
    id v8 = v21;

    if (v8)
    {
LABEL_19:

      if (a3)
      {
        id v14 = v8;
        id v8 = v14;
        goto LABEL_21;
      }
      goto LABEL_22;
    }
    id v19 = v7;
    [v19 bytes];
    [v19 length];
    int v20 = TLV8BufferAppend();

    if (v20) {
      goto LABEL_13;
    }
  }
  v17 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v25);
  id v8 = 0;
LABEL_23:
  TLV8BufferFree();

  return v17;
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
  if (v9)
  {
    id v23 = self;
    id v24 = a4;
    id v25 = v7;
    id v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    id v14 = 0;
    uint64_t v15 = v8 + v9;
    while (1)
    {
      char v34 = 0;
      long long v32 = 0;
      uint64_t v33 = 0;
      uint64_t v30 = 0;
      uint64_t v31 = 0;
      if (TLV8GetNext() || TLV8GetOrCopyCoalesced())
      {
        id v7 = v25;
        if (v24)
        {
          HMErrorFromOSStatus();
          BOOL v20 = 0;
          id *v24 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          BOOL v20 = 0;
        }
        goto LABEL_29;
      }
      if (!v33) {
        break;
      }
      switch(v34)
      {
        case 1:
          v16 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v29 = v10;
          v17 = &v29;
          +[HMDNetworkRouterRuleDirection parsedFromData:v16 error:&v29];
          id v14 = v18 = v14;
          goto LABEL_13;
        case 2:
          v16 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v28 = v10;
          v17 = &v28;
          +[HMDNetworkRouterLANIdentifierList parsedFromData:v16 error:&v28];
          v13 = uint64_t v18 = v13;
          goto LABEL_13;
        case 3:
          v16 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v27 = v10;
          v17 = &v27;
          +[HMDNetworkRouterIPAddress parsedFromData:v16 error:&v27];
          v12 = uint64_t v18 = v12;
          goto LABEL_13;
        case 4:
          v16 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v26 = v10;
          v17 = &v26;
          +[HMDNetworkRouterICMPTypeList parsedFromData:v16 error:&v26];
          v11 = uint64_t v18 = v11;
LABEL_13:
          id v19 = *v17;

          id v10 = v19;
          break;
        default:
          break;
      }
      if (v32) {
        free(v32);
      }
      if (v30 == v15)
      {
        if (v10) {
          goto LABEL_18;
        }
LABEL_24:
        id v7 = v25;
        self = v23;
        goto LABEL_25;
      }
    }
    uint64_t v21 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

    id v10 = (id)v21;
    if (!v21) {
      goto LABEL_24;
    }
LABEL_18:
    if (v24)
    {
      id v10 = v10;
      BOOL v20 = 0;
      id *v24 = v10;
    }
    else
    {
      BOOL v20 = 0;
    }
    id v7 = v25;
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    id v14 = 0;
LABEL_25:
    -[HMDNetworkRouterStaticICMPRule setDirection:](self, "setDirection:", v14, v23);
    [(HMDNetworkRouterStaticICMPRule *)self setLanIdentifierList:v13];
    [(HMDNetworkRouterStaticICMPRule *)self setDestinationIPAddress:v12];
    [(HMDNetworkRouterStaticICMPRule *)self setIcmpTypeList:v11];
    id v10 = 0;
    BOOL v20 = 1;
  }
LABEL_29:

  return v20;
}

- (HMDNetworkRouterStaticICMPRule)initWithDirection:(id)a3 lanIdentifierList:(id)a4 destinationIPAddress:(id)a5 icmpTypeList:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDNetworkRouterStaticICMPRule;
  uint64_t v15 = [(HMDNetworkRouterStaticICMPRule *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_direction, a3);
    objc_storeStrong((id *)&v16->_lanIdentifierList, a4);
    objc_storeStrong((id *)&v16->_destinationIPAddress, a5);
    objc_storeStrong((id *)&v16->_icmpTypeList, a6);
  }

  return v16;
}

- (HMDNetworkRouterStaticICMPRule)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterStaticICMPRule;
  return [(HMDNetworkRouterStaticICMPRule *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HMDNetworkRouterStaticICMPRule);
  id v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HMDNetworkRouterStaticICMPRule *)v6 parseFromData:v5 error:&v10];
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