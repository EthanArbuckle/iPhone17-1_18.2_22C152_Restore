@interface HMDNetworkRouterClientConfiguration
+ (id)configurationForFirewallConfiguration:(id)a3 hapAccessory:(BOOL)a4 airplayAccessory:(BOOL)a5 withClientIdentifier:(id)a6;
+ (id)configurationForOpenProtectionWithClientIdentifier:(id)a3;
+ (id)configurationWithClientIdentifier:(id)a3 lanIdentifier:(int64_t)a4;
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPTLVUnsignedNumberValue)clientIdentifier;
- (HAPTLVUnsignedNumberValue)lanIdentifier;
- (HMDNetworkRouterClientConfiguration)init;
- (HMDNetworkRouterClientConfiguration)initWithClientIdentifier:(id)a3 lanIdentifier:(id)a4 credential:(id)a5 wanFirewallConfiguration:(id)a6 lanFirewallConfiguration:(id)a7;
- (HMDNetworkRouterCredential)credential;
- (HMDNetworkRouterLANFirewallConfiguration)lanFirewallConfiguration;
- (HMDNetworkRouterWANFirewallConfiguration)wanFirewallConfiguration;
- (NSString)description;
- (NSUUID)fingerprint;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setCredential:(id)a3;
- (void)setLanFirewallConfiguration:(id)a3;
- (void)setLanIdentifier:(id)a3;
- (void)setWanFirewallConfiguration:(id)a3;
@end

@implementation HMDNetworkRouterClientConfiguration

- (NSUUID)fingerprint
{
  uint64_t v3 = [(HMDNetworkRouterClientConfiguration *)self lanIdentifier];
  if (!v3) {
    goto LABEL_6;
  }
  v4 = (HMDNetworkRouterClientConfiguration *)v3;
  v5 = [(HMDNetworkRouterClientConfiguration *)self lanFirewallConfiguration];
  if (v5)
  {
    v6 = [(HMDNetworkRouterClientConfiguration *)self wanFirewallConfiguration];

    if (v6)
    {
      v4 = self;
      v7 = [(HMDNetworkRouterClientConfiguration *)v4 clientIdentifier];
      if (v7)
      {
      }
      else
      {
        v8 = [(HMDNetworkRouterClientConfiguration *)v4 credential];

        if (!v8)
        {
LABEL_9:
          v14 = [(HMDNetworkRouterClientConfiguration *)v4 serializeWithError:0];
          if (v14)
          {
            v15 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"5FA86C71-D9DE-4FE8-80BB-823164245F58"];
            v5 = objc_msgSend(MEMORY[0x1E4F29128], "hmf_UUIDWithNamespace:data:", v15, v14);
          }
          else
          {
            v5 = 0;
          }

          goto LABEL_13;
        }
      }
      v9 = [HMDNetworkRouterClientConfiguration alloc];
      v10 = [(HMDNetworkRouterClientConfiguration *)v4 lanIdentifier];
      v11 = [(HMDNetworkRouterClientConfiguration *)v4 wanFirewallConfiguration];
      v12 = [(HMDNetworkRouterClientConfiguration *)v4 lanFirewallConfiguration];
      uint64_t v13 = [(HMDNetworkRouterClientConfiguration *)v9 initWithClientIdentifier:0 lanIdentifier:v10 credential:0 wanFirewallConfiguration:v11 lanFirewallConfiguration:v12];

      v4 = (HMDNetworkRouterClientConfiguration *)v13;
      goto LABEL_9;
    }
LABEL_6:
    v5 = 0;
    goto LABEL_14;
  }
LABEL_13:

LABEL_14:
  return (NSUUID *)v5;
}

+ (id)configurationForFirewallConfiguration:(id)a3 hapAccessory:(BOOL)a4 airplayAccessory:(BOOL)a5 withClientIdentifier:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = a6;
  if ([v9 hasFullAccessToLAN]) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = 3;
  }
  v12 = +[HMDNetworkRouterClientConfiguration configurationWithClientIdentifier:v10 lanIdentifier:v11];

  uint64_t v13 = +[HMDNetworkRouterLANFirewallConfiguration configurationFromFirewallRuleConfiguration:v9];
  [v12 setLanFirewallConfiguration:v13];

  v14 = +[HMDNetworkRouterWANFirewallConfiguration configurationFromFirewallRuleConfiguration:v9];
  [v12 setWanFirewallConfiguration:v14];

  if (v8 && ([v9 hasFullAccessToLAN] & 1) == 0)
  {
    v15 = +[HMDNetworkRouterDynamicPortRule ruleForHAP];
    v16 = [v12 lanFirewallConfiguration];
    v17 = [v16 ruleList];
    [v15 addTo:v17];
  }
  if (v7 && ([v9 hasAirplayRules] & 1) == 0)
  {
    v18 = +[HMDNetworkRouterHomeKitOnlyFirewallConfiguration fallbackConfigurationForRuleset:@"AirPlay2"];
    v19 = [v12 lanFirewallConfiguration];
    [v19 addRulesFromFirewallConfiguration:v18];
  }
  return v12;
}

+ (id)configurationForOpenProtectionWithClientIdentifier:(id)a3
{
  uint64_t v3 = +[HMDNetworkRouterClientConfiguration configurationWithClientIdentifier:a3 lanIdentifier:1];
  v4 = +[HMDNetworkRouterLANFirewallConfiguration configurationWithFullAccess];
  [v3 setLanFirewallConfiguration:v4];

  v5 = +[HMDNetworkRouterWANFirewallConfiguration configurationWithFullAccess];
  [v3 setWanFirewallConfiguration:v5];

  return v3;
}

+ (id)configurationWithClientIdentifier:(id)a3 lanIdentifier:(int64_t)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(HMDNetworkRouterClientConfiguration);
  if (v5)
  {
    BOOL v7 = (void *)[objc_alloc(MEMORY[0x1E4F5BE68]) initWithValue:v5];
    [(HMDNetworkRouterClientConfiguration *)v6 setClientIdentifier:v7];
  }
  id v8 = objc_alloc(MEMORY[0x1E4F5BE68]);
  id v9 = [NSNumber numberWithInteger:a4];
  id v10 = (void *)[v8 initWithValue:v9];
  [(HMDNetworkRouterClientConfiguration *)v6 setLanIdentifier:v10];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lanFirewallConfiguration, 0);
  objc_storeStrong((id *)&self->_wanFirewallConfiguration, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_lanIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (void)setLanFirewallConfiguration:(id)a3
{
}

- (HMDNetworkRouterLANFirewallConfiguration)lanFirewallConfiguration
{
  return self->_lanFirewallConfiguration;
}

- (void)setWanFirewallConfiguration:(id)a3
{
}

- (HMDNetworkRouterWANFirewallConfiguration)wanFirewallConfiguration
{
  return self->_wanFirewallConfiguration;
}

- (void)setCredential:(id)a3
{
}

- (HMDNetworkRouterCredential)credential
{
  return self->_credential;
}

- (void)setLanIdentifier:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)lanIdentifier
{
  return self->_lanIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  v4 = [(HMDNetworkRouterClientConfiguration *)self clientIdentifier];
  id v5 = [(HMDNetworkRouterClientConfiguration *)self lanIdentifier];
  v6 = [(HMDNetworkRouterClientConfiguration *)self credential];
  BOOL v7 = [(HMDNetworkRouterClientConfiguration *)self wanFirewallConfiguration];
  id v8 = [(HMDNetworkRouterClientConfiguration *)self lanFirewallConfiguration];
  id v9 = [v3 stringWithFormat:@"<HMDNetworkRouterClientConfiguration clientIdentifier=%@, lanIdentifier=%@, credential=%@, wanFirewallConfiguration=%@, lanFirewallConfiguration=%@>", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (HMDNetworkRouterClientConfiguration *)a3;
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
      BOOL v7 = [(HMDNetworkRouterClientConfiguration *)self clientIdentifier];
      id v8 = [(HMDNetworkRouterClientConfiguration *)v6 clientIdentifier];
      if (v7 != v8)
      {
        id v9 = [(HMDNetworkRouterClientConfiguration *)self clientIdentifier];
        [(HMDNetworkRouterClientConfiguration *)v6 clientIdentifier];
        v38 = v39 = v9;
        if (!objc_msgSend(v9, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_29;
        }
      }
      uint64_t v11 = [(HMDNetworkRouterClientConfiguration *)self lanIdentifier];
      v12 = [(HMDNetworkRouterClientConfiguration *)v6 lanIdentifier];
      if (v11 != v12)
      {
        uint64_t v3 = [(HMDNetworkRouterClientConfiguration *)self lanIdentifier];
        v35 = [(HMDNetworkRouterClientConfiguration *)v6 lanIdentifier];
        if (!objc_msgSend(v3, "isEqual:"))
        {
          char v10 = 0;
LABEL_27:

LABEL_28:
          if (v7 == v8)
          {
LABEL_30:

            goto LABEL_31;
          }
LABEL_29:

          goto LABEL_30;
        }
      }
      uint64_t v13 = [(HMDNetworkRouterClientConfiguration *)self credential];
      uint64_t v36 = [(HMDNetworkRouterClientConfiguration *)v6 credential];
      v37 = (void *)v13;
      if (v13 != v36)
      {
        v14 = [(HMDNetworkRouterClientConfiguration *)self credential];
        v33 = [(HMDNetworkRouterClientConfiguration *)v6 credential];
        v34 = v14;
        if (!objc_msgSend(v14, "isEqual:"))
        {
          char v10 = 0;
          v16 = (void *)v36;
          v15 = v37;
LABEL_25:

LABEL_26:
          if (v11 == v12) {
            goto LABEL_28;
          }
          goto LABEL_27;
        }
      }
      v17 = [(HMDNetworkRouterClientConfiguration *)self wanFirewallConfiguration];
      v18 = [(HMDNetworkRouterClientConfiguration *)v6 wanFirewallConfiguration];
      v32 = v3;
      if (v17 == v18)
      {
        v29 = v12;
      }
      else
      {
        v19 = [(HMDNetworkRouterClientConfiguration *)self wanFirewallConfiguration];
        v30 = [(HMDNetworkRouterClientConfiguration *)v6 wanFirewallConfiguration];
        v31 = v19;
        if (!objc_msgSend(v19, "isEqual:"))
        {
          char v10 = 0;
          uint64_t v3 = v32;
          goto LABEL_23;
        }
        v29 = v12;
      }
      v20 = [(HMDNetworkRouterClientConfiguration *)self lanFirewallConfiguration];
      uint64_t v21 = [(HMDNetworkRouterClientConfiguration *)v6 lanFirewallConfiguration];
      if (v20 == (void *)v21)
      {

        char v10 = 1;
      }
      else
      {
        v22 = (void *)v21;
        [(HMDNetworkRouterClientConfiguration *)self lanFirewallConfiguration];
        v23 = v27 = v17;
        [(HMDNetworkRouterClientConfiguration *)v6 lanFirewallConfiguration];
        v28 = v11;
        v25 = v24 = v18;
        char v10 = [v23 isEqual:v25];

        v18 = v24;
        uint64_t v11 = v28;

        v17 = v27;
      }
      v12 = v29;
      uint64_t v3 = v32;
      if (v17 == v18)
      {
LABEL_24:

        v16 = (void *)v36;
        v15 = v37;
        if (v37 == (void *)v36) {
          goto LABEL_26;
        }
        goto LABEL_25;
      }
LABEL_23:

      goto LABEL_24;
    }
    char v10 = 0;
  }
LABEL_31:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HMDNetworkRouterClientConfiguration allocWithZone:a3];
  id v5 = [(HMDNetworkRouterClientConfiguration *)self clientIdentifier];
  v6 = [(HMDNetworkRouterClientConfiguration *)self lanIdentifier];
  BOOL v7 = [(HMDNetworkRouterClientConfiguration *)self credential];
  id v8 = [(HMDNetworkRouterClientConfiguration *)self wanFirewallConfiguration];
  id v9 = [(HMDNetworkRouterClientConfiguration *)self lanFirewallConfiguration];
  char v10 = [(HMDNetworkRouterClientConfiguration *)v4 initWithClientIdentifier:v5 lanIdentifier:v6 credential:v7 wanFirewallConfiguration:v8 lanFirewallConfiguration:v9];

  return v10;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  TLV8BufferInit();
  id v5 = [(HMDNetworkRouterClientConfiguration *)self clientIdentifier];

  if (v5)
  {
    v6 = [(HMDNetworkRouterClientConfiguration *)self clientIdentifier];
    id v27 = 0;
    BOOL v7 = [v6 serializeWithError:&v27];
    id v8 = v27;

    if (v8) {
      goto LABEL_23;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    if (TLV8BufferAppend()) {
      goto LABEL_16;
    }
  }
  char v10 = [(HMDNetworkRouterClientConfiguration *)self lanIdentifier];

  if (v10)
  {
    uint64_t v11 = [(HMDNetworkRouterClientConfiguration *)self lanIdentifier];
    id v26 = 0;
    BOOL v7 = [v11 serializeWithError:&v26];
    id v8 = v26;

    if (v8) {
      goto LABEL_23;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    if (TLV8BufferAppend()) {
      goto LABEL_16;
    }
  }
  v12 = [(HMDNetworkRouterClientConfiguration *)self credential];

  if (!v12) {
    goto LABEL_13;
  }
  uint64_t v13 = [(HMDNetworkRouterClientConfiguration *)self credential];
  id v25 = 0;
  BOOL v7 = [v13 serializeWithError:&v25];
  id v8 = v25;

  if (v8) {
    goto LABEL_23;
  }
  id v9 = v7;
  [v9 bytes];
  [v9 length];
  if (TLV8BufferAppend())
  {
LABEL_16:

LABEL_17:
    if (a3)
    {
      HMErrorFromOSStatus();
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      id v8 = 0;
LABEL_25:
      v19 = 0;
      *a3 = v16;
      goto LABEL_27;
    }
    id v8 = 0;
LABEL_26:
    v19 = 0;
    goto LABEL_27;
  }

LABEL_13:
  v14 = [(HMDNetworkRouterClientConfiguration *)self wanFirewallConfiguration];

  if (v14)
  {
    v15 = [(HMDNetworkRouterClientConfiguration *)self wanFirewallConfiguration];
    id v24 = 0;
    BOOL v7 = [v15 serializeWithError:&v24];
    id v8 = v24;

    if (v8) {
      goto LABEL_23;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    if (TLV8BufferAppend()) {
      goto LABEL_16;
    }
  }
  v17 = [(HMDNetworkRouterClientConfiguration *)self lanFirewallConfiguration];

  if (v17)
  {
    v18 = [(HMDNetworkRouterClientConfiguration *)self lanFirewallConfiguration];
    id v23 = 0;
    BOOL v7 = [v18 serializeWithError:&v23];
    id v8 = v23;

    if (v8)
    {
LABEL_23:

      if (a3)
      {
        id v16 = v8;
        id v8 = v16;
        goto LABEL_25;
      }
      goto LABEL_26;
    }
    id v21 = v7;
    [v21 bytes];
    [v21 length];
    int v22 = TLV8BufferAppend();

    if (v22) {
      goto LABEL_17;
    }
  }
  v19 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v28);
  id v8 = 0;
LABEL_27:
  TLV8BufferFree();

  return v19;
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
    id v24 = self;
    id v25 = v7;
    id v10 = 0;
    uint64_t v11 = 0;
    v12 = 0;
    uint64_t v13 = 0;
    v14 = 0;
    uint64_t v26 = 0;
    uint64_t v15 = v8 + v9;
    while (1)
    {
      char v36 = 0;
      long long v34 = 0;
      uint64_t v35 = 0;
      uint64_t v32 = 0;
      uint64_t v33 = 0;
      if (TLV8GetNext() || TLV8GetOrCopyCoalesced())
      {
        id v7 = v25;
        if (a4)
        {
          HMErrorFromOSStatus();
          BOOL v20 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          BOOL v20 = 0;
        }
        goto LABEL_30;
      }
      if (!v35) {
        break;
      }
      switch(v36)
      {
        case 1:
          id v16 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v31 = v10;
          v17 = &v31;
          [MEMORY[0x1E4F5BE68] parsedFromData:v16 error:&v31];
          uint64_t v26 = v18 = (void *)v26;
          goto LABEL_14;
        case 3:
          id v16 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v30 = v10;
          v17 = &v30;
          [MEMORY[0x1E4F5BE68] parsedFromData:v16 error:&v30];
          v14 = v18 = v14;
          goto LABEL_14;
        case 4:
          id v16 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v29 = v10;
          v17 = &v29;
          +[HMDNetworkRouterCredential parsedFromData:v16 error:&v29];
          uint64_t v13 = v18 = v13;
          goto LABEL_14;
        case 5:
          id v16 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v28 = v10;
          v17 = &v28;
          +[HMDNetworkRouterWANFirewallConfiguration parsedFromData:v16 error:&v28];
          v12 = v18 = v12;
          goto LABEL_14;
        case 6:
          id v16 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v27 = v10;
          v17 = &v27;
          +[HMDNetworkRouterLANFirewallConfiguration parsedFromData:v16 error:&v27];
          uint64_t v11 = v18 = v11;
LABEL_14:
          id v19 = *v17;

          id v10 = v19;
          break;
        default:
          break;
      }
      if (v34) {
        free(v34);
      }
      if (v32 == v15)
      {
        if (v10) {
          goto LABEL_19;
        }
LABEL_25:
        id v7 = v25;
        id v21 = (void *)v26;
        self = v24;
        goto LABEL_26;
      }
    }
    uint64_t v22 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

    id v10 = (id)v22;
    if (!v22) {
      goto LABEL_25;
    }
LABEL_19:
    if (a4)
    {
      id v10 = v10;
      BOOL v20 = 0;
      *a4 = v10;
    }
    else
    {
      BOOL v20 = 0;
    }
    id v7 = v25;
LABEL_30:
    id v21 = (void *)v26;
  }
  else
  {
    uint64_t v11 = 0;
    v12 = 0;
    uint64_t v13 = 0;
    v14 = 0;
    id v21 = 0;
LABEL_26:
    [(HMDNetworkRouterClientConfiguration *)self setClientIdentifier:v21];
    [(HMDNetworkRouterClientConfiguration *)self setLanIdentifier:v14];
    [(HMDNetworkRouterClientConfiguration *)self setCredential:v13];
    [(HMDNetworkRouterClientConfiguration *)self setWanFirewallConfiguration:v12];
    [(HMDNetworkRouterClientConfiguration *)self setLanFirewallConfiguration:v11];
    id v10 = 0;
    BOOL v20 = 1;
  }

  return v20;
}

- (HMDNetworkRouterClientConfiguration)initWithClientIdentifier:(id)a3 lanIdentifier:(id)a4 credential:(id)a5 wanFirewallConfiguration:(id)a6 lanFirewallConfiguration:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMDNetworkRouterClientConfiguration;
  v17 = [(HMDNetworkRouterClientConfiguration *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_clientIdentifier, a3);
    objc_storeStrong((id *)&v18->_lanIdentifier, a4);
    objc_storeStrong((id *)&v18->_credential, a5);
    objc_storeStrong((id *)&v18->_wanFirewallConfiguration, a6);
    objc_storeStrong((id *)&v18->_lanFirewallConfiguration, a7);
  }

  return v18;
}

- (HMDNetworkRouterClientConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterClientConfiguration;
  return [(HMDNetworkRouterClientConfiguration *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HMDNetworkRouterClientConfiguration);
  id v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HMDNetworkRouterClientConfiguration *)v6 parseFromData:v5 error:&v10];
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