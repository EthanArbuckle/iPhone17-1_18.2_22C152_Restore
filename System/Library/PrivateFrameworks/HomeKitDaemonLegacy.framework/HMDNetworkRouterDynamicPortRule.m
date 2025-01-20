@interface HMDNetworkRouterDynamicPortRule
+ (id)parsedFromData:(id)a3 error:(id *)a4;
+ (id)ruleForHAP;
+ (id)ruleFromFirewallRuleLAN:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPTLVUnsignedNumberValue)flags;
- (HMDNetworkRouterAdvertisementProtocol)advertisementProtocol;
- (HMDNetworkRouterDynamicPortRule)init;
- (HMDNetworkRouterDynamicPortRule)initWithDirection:(id)a3 lanIdentifierList:(id)a4 protocol:(id)a5 advertisementProtocol:(id)a6 flags:(id)a7 serviceType:(id)a8;
- (HMDNetworkRouterLANIdentifierList)lanIdentifierList;
- (HMDNetworkRouterProtocol)protocol;
- (HMDNetworkRouterRuleDirection)direction;
- (HMDNetworkRouterServiceType)serviceType;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)addTo:(id)a3;
- (void)setAdvertisementProtocol:(id)a3;
- (void)setDirection:(id)a3;
- (void)setFlags:(id)a3;
- (void)setLanIdentifierList:(id)a3;
- (void)setProtocol:(id)a3;
- (void)setServiceType:(id)a3;
@end

@implementation HMDNetworkRouterDynamicPortRule

- (void)addTo:(id)a3
{
  id v7 = a3;
  v4 = [v7 dynamicPortRules];
  v5 = v4;
  if (v4)
  {
    [v4 addObject:self];
  }
  else
  {
    v6 = [MEMORY[0x1E4F1CA48] arrayWithObject:self];
    [v7 setDynamicPortRules:v6];
  }
}

+ (id)ruleFromFirewallRuleLAN:(id)a3
{
  id v3 = a3;
  v4 = +[HMDNetworkRouterRuleDirection directionFromLANDirection:](HMDNetworkRouterRuleDirection, "directionFromLANDirection:", [v3 direction]);
  v5 = createIdentifierListFromLANRule(v3);
  v6 = +[HMDNetworkRouterProtocol protocolFromTransportProtocol:](HMDNetworkRouterProtocol, "protocolFromTransportProtocol:", [v3 transportProtocol]);
  id v7 = +[HMDNetworkRouterAdvertisementProtocol protocolFromFirewallRuleAdvertisingProtocol:](HMDNetworkRouterAdvertisementProtocol, "protocolFromFirewallRuleAdvertisingProtocol:", [v3 advertisingProtocol]);
  v8 = [v3 serviceType];

  if (v8)
  {
    v9 = [HMDNetworkRouterServiceType alloc];
    v10 = [v3 serviceType];
    v8 = [(HMDNetworkRouterServiceType *)v9 initWithName:v10];
  }
  id v11 = objc_alloc(MEMORY[0x1E4F5BE68]);
  if ([v3 isAdvertisingOnly]) {
    v12 = &unk_1F2DC7EA0;
  }
  else {
    v12 = &unk_1F2DC7E88;
  }
  uint64_t v13 = [v11 initWithValue:v12];
  v14 = (void *)v13;
  v15 = 0;
  if (v4 && v5 && v6 && v7 && v13) {
    v15 = [[HMDNetworkRouterDynamicPortRule alloc] initWithDirection:v4 lanIdentifierList:v5 protocol:v6 advertisementProtocol:v7 flags:v13 serviceType:v8];
  }

  return v15;
}

+ (id)ruleForHAP
{
  v2 = [[HMDNetworkRouterRuleDirection alloc] initWithDirection:1];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F5BE68]) initWithValue:&unk_1F2DC7E70];
  v4 = [HMDNetworkRouterLANIdentifierList alloc];
  v5 = [MEMORY[0x1E4F1CA48] arrayWithObject:v3];
  v6 = [(HMDNetworkRouterLANIdentifierList *)v4 initWithIdentifiers:v5];

  id v7 = [[HMDNetworkRouterProtocol alloc] initWithProtocol:0];
  v8 = [[HMDNetworkRouterAdvertisementProtocol alloc] initWithAdvertisementProtocol:0];
  v9 = [[HMDNetworkRouterServiceType alloc] initWithName:@"hap"];
  v10 = [HMDNetworkRouterDynamicPortRule alloc];
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F5BE68]) initWithValue:&unk_1F2DC7E88];
  v12 = [(HMDNetworkRouterDynamicPortRule *)v10 initWithDirection:v2 lanIdentifierList:v6 protocol:v7 advertisementProtocol:v8 flags:v11 serviceType:v9];

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_advertisementProtocol, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_lanIdentifierList, 0);
  objc_storeStrong((id *)&self->_direction, 0);
}

- (void)setServiceType:(id)a3
{
}

- (HMDNetworkRouterServiceType)serviceType
{
  return self->_serviceType;
}

- (void)setFlags:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)flags
{
  return self->_flags;
}

- (void)setAdvertisementProtocol:(id)a3
{
}

- (HMDNetworkRouterAdvertisementProtocol)advertisementProtocol
{
  return self->_advertisementProtocol;
}

- (void)setProtocol:(id)a3
{
}

- (HMDNetworkRouterProtocol)protocol
{
  return self->_protocol;
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
  v4 = [(HMDNetworkRouterDynamicPortRule *)self direction];
  v5 = [(HMDNetworkRouterDynamicPortRule *)self lanIdentifierList];
  v6 = [(HMDNetworkRouterDynamicPortRule *)self protocol];
  id v7 = [(HMDNetworkRouterDynamicPortRule *)self advertisementProtocol];
  v8 = [(HMDNetworkRouterDynamicPortRule *)self flags];
  v9 = [(HMDNetworkRouterDynamicPortRule *)self serviceType];
  v10 = [v3 stringWithFormat:@"<HMDNetworkRouterDynamicPortRule direction=%@, lanIdentifierList=%@, protocol=%@, advertisementProtocol=%@, flags=%@, serviceType=%@>", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HMDNetworkRouterDynamicPortRule *)a3;
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
      id v7 = [(HMDNetworkRouterDynamicPortRule *)self direction];
      v8 = [(HMDNetworkRouterDynamicPortRule *)v6 direction];
      if (v7 != v8)
      {
        v9 = [(HMDNetworkRouterDynamicPortRule *)self direction];
        v48 = [(HMDNetworkRouterDynamicPortRule *)v6 direction];
        v49 = v9;
        if (!objc_msgSend(v9, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_36;
        }
      }
      id v11 = [(HMDNetworkRouterDynamicPortRule *)self lanIdentifierList];
      v12 = [(HMDNetworkRouterDynamicPortRule *)v6 lanIdentifierList];
      if (v11 != v12)
      {
        id v3 = [(HMDNetworkRouterDynamicPortRule *)self lanIdentifierList];
        v47 = [(HMDNetworkRouterDynamicPortRule *)v6 lanIdentifierList];
        if (!objc_msgSend(v3, "isEqual:"))
        {
          char v10 = 0;
LABEL_34:

LABEL_35:
          if (v7 == v8)
          {
LABEL_37:

            goto LABEL_38;
          }
LABEL_36:

          goto LABEL_37;
        }
      }
      uint64_t v13 = [(HMDNetworkRouterDynamicPortRule *)self protocol];
      uint64_t v14 = [(HMDNetworkRouterDynamicPortRule *)v6 protocol];
      v46 = (void *)v13;
      BOOL v15 = v13 == v14;
      v16 = (void *)v14;
      if (!v15)
      {
        v17 = [(HMDNetworkRouterDynamicPortRule *)self protocol];
        v41 = [(HMDNetworkRouterDynamicPortRule *)v6 protocol];
        v42 = v17;
        if (!objc_msgSend(v17, "isEqual:"))
        {
          char v10 = 0;
          v18 = v46;
LABEL_32:

LABEL_33:
          if (v11 == v12) {
            goto LABEL_35;
          }
          goto LABEL_34;
        }
      }
      uint64_t v19 = [(HMDNetworkRouterDynamicPortRule *)self advertisementProtocol];
      uint64_t v44 = [(HMDNetworkRouterDynamicPortRule *)v6 advertisementProtocol];
      v45 = (void *)v19;
      v43 = v16;
      if (v19 == v44)
      {
        v37 = v12;
      }
      else
      {
        v20 = v3;
        v21 = [(HMDNetworkRouterDynamicPortRule *)self advertisementProtocol];
        v39 = [(HMDNetworkRouterDynamicPortRule *)v6 advertisementProtocol];
        v40 = v21;
        if (!objc_msgSend(v21, "isEqual:"))
        {
          char v10 = 0;
          v24 = (void *)v44;
          id v3 = v20;
LABEL_30:

LABEL_31:
          v16 = v43;
          v18 = v46;
          if (v46 == v43) {
            goto LABEL_33;
          }
          goto LABEL_32;
        }
        v37 = v12;
        id v3 = v20;
      }
      v22 = [(HMDNetworkRouterDynamicPortRule *)self flags];
      uint64_t v38 = [(HMDNetworkRouterDynamicPortRule *)v6 flags];
      if (v22 == (void *)v38)
      {
        v33 = v3;
        v34 = v11;
      }
      else
      {
        v23 = [(HMDNetworkRouterDynamicPortRule *)self flags];
        v35 = [(HMDNetworkRouterDynamicPortRule *)v6 flags];
        v36 = v23;
        if (!objc_msgSend(v23, "isEqual:"))
        {
          char v10 = 0;
          v12 = v37;
          v30 = (void *)v38;
          goto LABEL_28;
        }
        v33 = v3;
        v34 = v11;
      }
      v25 = [(HMDNetworkRouterDynamicPortRule *)self serviceType];
      uint64_t v26 = [(HMDNetworkRouterDynamicPortRule *)v6 serviceType];
      if (v25 == (void *)v26)
      {

        char v10 = 1;
      }
      else
      {
        v27 = (void *)v26;
        [(HMDNetworkRouterDynamicPortRule *)self serviceType];
        v28 = v32 = v22;
        v29 = [(HMDNetworkRouterDynamicPortRule *)v6 serviceType];
        char v10 = [v28 isEqual:v29];

        v22 = v32;
      }
      v12 = v37;
      v30 = (void *)v38;
      id v3 = v33;
      id v11 = v34;
      if (v22 == (void *)v38)
      {
LABEL_29:

        v24 = (void *)v44;
        if (v45 == (void *)v44) {
          goto LABEL_31;
        }
        goto LABEL_30;
      }
LABEL_28:

      goto LABEL_29;
    }
    char v10 = 0;
  }
LABEL_38:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HMDNetworkRouterDynamicPortRule allocWithZone:a3];
  v5 = [(HMDNetworkRouterDynamicPortRule *)self direction];
  v6 = [(HMDNetworkRouterDynamicPortRule *)self lanIdentifierList];
  id v7 = [(HMDNetworkRouterDynamicPortRule *)self protocol];
  v8 = [(HMDNetworkRouterDynamicPortRule *)self advertisementProtocol];
  v9 = [(HMDNetworkRouterDynamicPortRule *)self flags];
  char v10 = [(HMDNetworkRouterDynamicPortRule *)self serviceType];
  id v11 = [(HMDNetworkRouterDynamicPortRule *)v4 initWithDirection:v5 lanIdentifierList:v6 protocol:v7 advertisementProtocol:v8 flags:v9 serviceType:v10];

  return v11;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
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
  long long v31 = 0u;
  TLV8BufferInit();
  v5 = [(HMDNetworkRouterDynamicPortRule *)self direction];

  if (v5)
  {
    v6 = [(HMDNetworkRouterDynamicPortRule *)self direction];
    id v30 = 0;
    id v7 = [v6 serializeWithError:&v30];
    id v8 = v30;

    if (v8) {
      goto LABEL_27;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    if (TLV8BufferAppend()) {
      goto LABEL_20;
    }
  }
  char v10 = [(HMDNetworkRouterDynamicPortRule *)self lanIdentifierList];

  if (v10)
  {
    id v11 = [(HMDNetworkRouterDynamicPortRule *)self lanIdentifierList];
    id v29 = 0;
    id v7 = [v11 serializeWithError:&v29];
    id v8 = v29;

    if (v8) {
      goto LABEL_27;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    if (TLV8BufferAppend()) {
      goto LABEL_20;
    }
  }
  v12 = [(HMDNetworkRouterDynamicPortRule *)self protocol];

  if (v12)
  {
    uint64_t v13 = [(HMDNetworkRouterDynamicPortRule *)self protocol];
    id v28 = 0;
    id v7 = [v13 serializeWithError:&v28];
    id v8 = v28;

    if (v8) {
      goto LABEL_27;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    if (TLV8BufferAppend()) {
      goto LABEL_20;
    }
  }
  uint64_t v14 = [(HMDNetworkRouterDynamicPortRule *)self advertisementProtocol];

  if (!v14) {
    goto LABEL_17;
  }
  BOOL v15 = [(HMDNetworkRouterDynamicPortRule *)self advertisementProtocol];
  id v27 = 0;
  id v7 = [v15 serializeWithError:&v27];
  id v8 = v27;

  if (v8) {
    goto LABEL_27;
  }
  id v9 = v7;
  [v9 bytes];
  [v9 length];
  if (TLV8BufferAppend())
  {
LABEL_20:

LABEL_21:
    if (a3)
    {
      HMErrorFromOSStatus();
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      id v8 = 0;
LABEL_29:
      v21 = 0;
      *a3 = v18;
      goto LABEL_31;
    }
    id v8 = 0;
LABEL_30:
    v21 = 0;
    goto LABEL_31;
  }

LABEL_17:
  v16 = [(HMDNetworkRouterDynamicPortRule *)self flags];

  if (v16)
  {
    v17 = [(HMDNetworkRouterDynamicPortRule *)self flags];
    id v26 = 0;
    id v7 = [v17 serializeWithError:&v26];
    id v8 = v26;

    if (v8) {
      goto LABEL_27;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    if (TLV8BufferAppend()) {
      goto LABEL_20;
    }
  }
  uint64_t v19 = [(HMDNetworkRouterDynamicPortRule *)self serviceType];

  if (v19)
  {
    v20 = [(HMDNetworkRouterDynamicPortRule *)self serviceType];
    id v25 = 0;
    id v7 = [v20 serializeWithError:&v25];
    id v8 = v25;

    if (v8)
    {
LABEL_27:

      if (a3)
      {
        id v18 = v8;
        id v8 = v18;
        goto LABEL_29;
      }
      goto LABEL_30;
    }
    id v23 = v7;
    [v23 bytes];
    [v23 length];
    int v24 = TLV8BufferAppend();

    if (v24) {
      goto LABEL_21;
    }
  }
  v21 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v31);
  id v8 = 0;
LABEL_31:
  TLV8BufferFree();

  return v21;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (a4) {
    *a4 = 0;
  }
  id v7 = v6;
  uint64_t v8 = [v7 bytes];
  id v26 = v7;
  uint64_t v9 = [v7 length];
  if (v9)
  {
    id v10 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    id v11 = 0;
    v12 = 0;
    uint64_t v13 = 0;
    uint64_t v27 = 0;
    uint64_t v14 = v8 + v9;
    while (1)
    {
      char v40 = 0;
      uint64_t v39 = 0;
      uint64_t v37 = 0;
      long long v38 = 0;
      uint64_t v36 = 0;
      if (TLV8GetNext() || TLV8GetOrCopyCoalesced())
      {
        id v23 = v26;
        if (a4)
        {
          HMErrorFromOSStatus();
          BOOL v19 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          BOOL v19 = 0;
        }
        goto LABEL_31;
      }
      if (!v39) {
        break;
      }
      switch(v40)
      {
        case 1:
          BOOL v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v35 = v10;
          v16 = &v35;
          +[HMDNetworkRouterRuleDirection parsedFromData:v15 error:&v35];
          uint64_t v29 = v17 = (void *)v29;
          goto LABEL_15;
        case 2:
          BOOL v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v34 = v10;
          v16 = &v34;
          +[HMDNetworkRouterLANIdentifierList parsedFromData:v15 error:&v34];
          uint64_t v28 = v17 = (void *)v28;
          goto LABEL_15;
        case 3:
          BOOL v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v33 = v10;
          v16 = &v33;
          +[HMDNetworkRouterProtocol parsedFromData:v15 error:&v33];
          uint64_t v27 = v17 = (void *)v27;
          goto LABEL_15;
        case 4:
          BOOL v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v32 = v10;
          v16 = &v32;
          +[HMDNetworkRouterAdvertisementProtocol parsedFromData:v15 error:&v32];
          uint64_t v13 = v17 = v13;
          goto LABEL_15;
        case 5:
          BOOL v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v31 = v10;
          v16 = &v31;
          [MEMORY[0x1E4F5BE68] parsedFromData:v15 error:&v31];
          v12 = v17 = v12;
          goto LABEL_15;
        case 6:
          BOOL v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v30 = v10;
          v16 = &v30;
          +[HMDNetworkRouterServiceType parsedFromData:v15 error:&v30];
          id v11 = v17 = v11;
LABEL_15:
          id v18 = *v16;

          id v10 = v18;
          break;
        default:
          break;
      }
      if (v38) {
        free(v38);
      }
      if (v36 == v14)
      {
        if (v10) {
          goto LABEL_20;
        }
LABEL_26:
        id v23 = v26;
        v21 = (void *)v27;
        v22 = (void *)v28;
        v20 = (void *)v29;
        goto LABEL_27;
      }
    }
    uint64_t v24 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

    id v10 = (id)v24;
    if (!v24) {
      goto LABEL_26;
    }
LABEL_20:
    if (a4)
    {
      id v10 = v10;
      BOOL v19 = 0;
      *a4 = v10;
    }
    else
    {
      BOOL v19 = 0;
    }
    id v23 = v26;
LABEL_31:
    v22 = (void *)v28;
    v20 = (void *)v29;
    v21 = (void *)v27;
  }
  else
  {
    v20 = 0;
    id v11 = 0;
    v12 = 0;
    uint64_t v13 = 0;
    v21 = 0;
    v22 = 0;
    id v23 = v7;
LABEL_27:
    [(HMDNetworkRouterDynamicPortRule *)self setDirection:v20];
    [(HMDNetworkRouterDynamicPortRule *)self setLanIdentifierList:v22];
    [(HMDNetworkRouterDynamicPortRule *)self setProtocol:v21];
    [(HMDNetworkRouterDynamicPortRule *)self setAdvertisementProtocol:v13];
    [(HMDNetworkRouterDynamicPortRule *)self setFlags:v12];
    [(HMDNetworkRouterDynamicPortRule *)self setServiceType:v11];
    id v10 = 0;
    BOOL v19 = 1;
  }

  return v19;
}

- (HMDNetworkRouterDynamicPortRule)initWithDirection:(id)a3 lanIdentifierList:(id)a4 protocol:(id)a5 advertisementProtocol:(id)a6 flags:(id)a7 serviceType:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HMDNetworkRouterDynamicPortRule;
  id v18 = [(HMDNetworkRouterDynamicPortRule *)&v24 init];
  BOOL v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_direction, a3);
    objc_storeStrong((id *)&v19->_lanIdentifierList, a4);
    objc_storeStrong((id *)&v19->_protocol, a5);
    objc_storeStrong((id *)&v19->_advertisementProtocol, a6);
    objc_storeStrong((id *)&v19->_flags, a7);
    objc_storeStrong((id *)&v19->_serviceType, a8);
  }

  return v19;
}

- (HMDNetworkRouterDynamicPortRule)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterDynamicPortRule;
  return [(HMDNetworkRouterDynamicPortRule *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HMDNetworkRouterDynamicPortRule);
  id v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HMDNetworkRouterDynamicPortRule *)v6 parseFromData:v5 error:&v10];
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