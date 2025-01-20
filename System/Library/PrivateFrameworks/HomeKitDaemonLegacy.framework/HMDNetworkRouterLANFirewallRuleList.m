@interface HMDNetworkRouterLANFirewallRuleList
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HMDNetworkRouterLANFirewallRuleList)init;
- (HMDNetworkRouterLANFirewallRuleList)initWithMulticastBridgingRules:(id)a3 staticPortRules:(id)a4 dynamicPortRules:(id)a5 staticICMPRules:(id)a6;
- (NSMutableArray)dynamicPortRules;
- (NSMutableArray)multicastBridgingRules;
- (NSMutableArray)staticICMPRules;
- (NSMutableArray)staticPortRules;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setDynamicPortRules:(id)a3;
- (void)setMulticastBridgingRules:(id)a3;
- (void)setStaticICMPRules:(id)a3;
- (void)setStaticPortRules:(id)a3;
@end

@implementation HMDNetworkRouterLANFirewallRuleList

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticICMPRules, 0);
  objc_storeStrong((id *)&self->_dynamicPortRules, 0);
  objc_storeStrong((id *)&self->_staticPortRules, 0);
  objc_storeStrong((id *)&self->_multicastBridgingRules, 0);
}

- (void)setStaticICMPRules:(id)a3
{
}

- (NSMutableArray)staticICMPRules
{
  return self->_staticICMPRules;
}

- (void)setDynamicPortRules:(id)a3
{
}

- (NSMutableArray)dynamicPortRules
{
  return self->_dynamicPortRules;
}

- (void)setStaticPortRules:(id)a3
{
}

- (NSMutableArray)staticPortRules
{
  return self->_staticPortRules;
}

- (void)setMulticastBridgingRules:(id)a3
{
}

- (NSMutableArray)multicastBridgingRules
{
  return self->_multicastBridgingRules;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HMDNetworkRouterLANFirewallRuleList *)self multicastBridgingRules];
  v5 = [(HMDNetworkRouterLANFirewallRuleList *)self staticPortRules];
  v6 = [(HMDNetworkRouterLANFirewallRuleList *)self dynamicPortRules];
  v7 = [(HMDNetworkRouterLANFirewallRuleList *)self staticICMPRules];
  v8 = [v3 stringWithFormat:@"<HMDNetworkRouterLANFirewallRuleList multicastBridgingRules=%@, staticPortRules=%@, dynamicPortRules=%@, staticICMPRules=%@>", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HMDNetworkRouterLANFirewallRuleList *)a3;
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
      v7 = [(HMDNetworkRouterLANFirewallRuleList *)self multicastBridgingRules];
      v8 = [(HMDNetworkRouterLANFirewallRuleList *)v6 multicastBridgingRules];
      if (v7 != v8)
      {
        v9 = [(HMDNetworkRouterLANFirewallRuleList *)self multicastBridgingRules];
        v3 = [(HMDNetworkRouterLANFirewallRuleList *)v6 multicastBridgingRules];
        v32 = v9;
        if (![v9 isEqual:v3])
        {
          char v10 = 0;
          goto LABEL_25;
        }
      }
      v11 = [(HMDNetworkRouterLANFirewallRuleList *)self staticPortRules];
      v12 = [(HMDNetworkRouterLANFirewallRuleList *)v6 staticPortRules];
      if (v11 != v12)
      {
        v13 = [(HMDNetworkRouterLANFirewallRuleList *)self staticPortRules];
        v31 = [(HMDNetworkRouterLANFirewallRuleList *)v6 staticPortRules];
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
      uint64_t v14 = [(HMDNetworkRouterLANFirewallRuleList *)self dynamicPortRules];
      v15 = [(HMDNetworkRouterLANFirewallRuleList *)v6 dynamicPortRules];
      v30 = (void *)v14;
      if ((void *)v14 == v15)
      {
        v25 = v12;
        v26 = v11;
      }
      else
      {
        v16 = [(HMDNetworkRouterLANFirewallRuleList *)self dynamicPortRules];
        v27 = [(HMDNetworkRouterLANFirewallRuleList *)v6 dynamicPortRules];
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
      v17 = [(HMDNetworkRouterLANFirewallRuleList *)self staticICMPRules];
      uint64_t v18 = [(HMDNetworkRouterLANFirewallRuleList *)v6 staticICMPRules];
      if (v17 == (void *)v18)
      {

        char v10 = 1;
      }
      else
      {
        v19 = (void *)v18;
        [(HMDNetworkRouterLANFirewallRuleList *)self staticICMPRules];
        v20 = v24 = v3;
        v21 = [(HMDNetworkRouterLANFirewallRuleList *)v6 staticICMPRules];
        char v10 = [v20 isEqual:v21];

        v3 = v24;
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
  v4 = +[HMDNetworkRouterLANFirewallRuleList allocWithZone:a3];
  v5 = [(HMDNetworkRouterLANFirewallRuleList *)self multicastBridgingRules];
  v6 = [(HMDNetworkRouterLANFirewallRuleList *)self staticPortRules];
  v7 = [(HMDNetworkRouterLANFirewallRuleList *)self dynamicPortRules];
  v8 = [(HMDNetworkRouterLANFirewallRuleList *)self staticICMPRules];
  v9 = [(HMDNetworkRouterLANFirewallRuleList *)v4 initWithMulticastBridgingRules:v5 staticPortRules:v6 dynamicPortRules:v7 staticICMPRules:v8];

  return v9;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  long long v88 = 0u;
  long long v87 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v68 = 0u;
  TLV8BufferInit();
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  v5 = [(HMDNetworkRouterLANFirewallRuleList *)self multicastBridgingRules];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v60 objects:v67 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v61;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v61 != v9) {
        objc_enumerationMutation(v5);
      }
      v11 = *(void **)(*((void *)&v60 + 1) + 8 * v10);
      if (v8)
      {
        if (TLV8BufferAppend()) {
          break;
        }
      }
      id v59 = 0;
      v12 = [v11 serializeWithError:&v59];
      id v13 = v59;
      if (v13)
      {
LABEL_46:
        v41 = v13;

        if (!a3) {
          goto LABEL_52;
        }
        id v42 = v41;
        v41 = v42;
        goto LABEL_50;
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
        uint64_t v7 = [v5 countByEnumeratingWithState:&v60 objects:v67 count:16];
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

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v5 = [(HMDNetworkRouterLANFirewallRuleList *)self staticPortRules];
    uint64_t v16 = [v5 countByEnumeratingWithState:&v55 objects:v66 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      char v18 = 0;
      uint64_t v19 = *(void *)v56;
LABEL_14:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v56 != v19) {
          objc_enumerationMutation(v5);
        }
        v21 = *(void **)(*((void *)&v55 + 1) + 8 * v20);
        if (v18)
        {
          if (TLV8BufferAppend()) {
            break;
          }
        }
        id v54 = 0;
        v12 = [v21 serializeWithError:&v54];
        id v13 = v54;
        if (v13) {
          goto LABEL_46;
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
          uint64_t v17 = [v5 countByEnumeratingWithState:&v55 objects:v66 count:16];
          if (v17) {
            goto LABEL_14;
          }
          goto LABEL_23;
        }
      }
    }
    else
    {
LABEL_23:

      long long v53 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v50 = 0u;
      v5 = [(HMDNetworkRouterLANFirewallRuleList *)self dynamicPortRules];
      uint64_t v24 = [v5 countByEnumeratingWithState:&v50 objects:v65 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        char v26 = 0;
        uint64_t v27 = *(void *)v51;
LABEL_25:
        uint64_t v28 = 0;
        while (1)
        {
          if (*(void *)v51 != v27) {
            objc_enumerationMutation(v5);
          }
          v29 = *(void **)(*((void *)&v50 + 1) + 8 * v28);
          if (v26)
          {
            if (TLV8BufferAppend()) {
              break;
            }
          }
          id v49 = 0;
          v12 = [v29 serializeWithError:&v49];
          id v13 = v49;
          if (v13) {
            goto LABEL_46;
          }
          id v30 = v12;
          [v30 bytes];
          [v30 length];
          int v31 = TLV8BufferAppend();

          if (v31) {
            break;
          }
          ++v28;
          char v26 = 1;
          if (v25 == v28)
          {
            uint64_t v25 = [v5 countByEnumeratingWithState:&v50 objects:v65 count:16];
            if (v25) {
              goto LABEL_25;
            }
            goto LABEL_34;
          }
        }
      }
      else
      {
LABEL_34:

        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        v5 = [(HMDNetworkRouterLANFirewallRuleList *)self staticICMPRules];
        uint64_t v32 = [v5 countByEnumeratingWithState:&v45 objects:v64 count:16];
        if (!v32)
        {
LABEL_45:

          v40 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v68);
          v41 = 0;
          goto LABEL_53;
        }
        uint64_t v33 = v32;
        char v34 = 0;
        uint64_t v35 = *(void *)v46;
LABEL_36:
        uint64_t v36 = 0;
        while (1)
        {
          if (*(void *)v46 != v35) {
            objc_enumerationMutation(v5);
          }
          v37 = *(void **)(*((void *)&v45 + 1) + 8 * v36);
          if (v34)
          {
            if (TLV8BufferAppend()) {
              break;
            }
          }
          id v44 = 0;
          v12 = [v37 serializeWithError:&v44];
          id v13 = v44;
          if (v13) {
            goto LABEL_46;
          }
          id v38 = v12;
          [v38 bytes];
          [v38 length];
          int v39 = TLV8BufferAppend();

          if (v39) {
            break;
          }
          ++v36;
          char v34 = 1;
          if (v33 == v36)
          {
            uint64_t v33 = [v5 countByEnumeratingWithState:&v45 objects:v64 count:16];
            if (v33) {
              goto LABEL_36;
            }
            goto LABEL_45;
          }
        }
      }
    }
  }

  if (a3)
  {
    HMErrorFromOSStatus();
    id v42 = (id)objc_claimAutoreleasedReturnValue();
    v41 = 0;
LABEL_50:
    v40 = 0;
    *a3 = v42;
  }
  else
  {
    v41 = 0;
LABEL_52:
    v40 = 0;
  }
LABEL_53:
  TLV8BufferFree();

  return v40;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  uint64_t v27 = self;
  id v5 = a3;
  if (a4) {
    *a4 = 0;
  }
  id v6 = v5;
  uint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  v11 = [MEMORY[0x1E4F1CA48] array];
  v12 = [MEMORY[0x1E4F1CA48] array];
  if (v8)
  {
    v29 = v10;
    id v13 = 0;
    uint64_t v14 = v7 + v8;
    while (1)
    {
      char v38 = 0;
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      uint64_t v34 = 0;
      uint64_t v35 = 0;
      if (TLV8GetNext() || TLV8GetOrCopyCoalesced()) {
        break;
      }
      if (!v37)
      {
        uint64_t v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

        id v13 = (void *)v20;
LABEL_26:
        uint64_t v10 = v29;
        if (!v13) {
          goto LABEL_30;
        }
        if (a4)
        {
          id v19 = v13;
          id v13 = v19;
          goto LABEL_29;
        }
        goto LABEL_43;
      }
      switch(v38)
      {
        case 1:
          int v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v33 = v13;
          uint64_t v16 = +[HMDNetworkRouterMulticastBridgingRule parsedFromData:v15 error:&v33];
          id v17 = v33;

          if (v17) {
            goto LABEL_18;
          }
          char v18 = v9;
          break;
        case 2:
          int v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v32 = v13;
          uint64_t v16 = +[HMDNetworkRouterStaticPortRule parsedFromData:v15 error:&v32];
          id v17 = v32;

          if (v17) {
            goto LABEL_18;
          }
          char v18 = v29;
          break;
        case 3:
          int v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v31 = v13;
          uint64_t v16 = +[HMDNetworkRouterDynamicPortRule parsedFromData:v15 error:&v31];
          id v17 = v31;

          if (v17) {
            goto LABEL_18;
          }
          char v18 = v11;
          break;
        case 4:
          int v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v30 = v13;
          uint64_t v16 = +[HMDNetworkRouterStaticICMPRule parsedFromData:v15 error:&v30];
          id v17 = v30;

          if (v17) {
            goto LABEL_18;
          }
          char v18 = v12;
          break;
        default:
          goto LABEL_19;
      }
      objc_msgSend(v18, "addObject:", v16, v27);
LABEL_18:

      id v13 = v17;
LABEL_19:
      if (v36) {
        free(v36);
      }
      if (v34 == v14) {
        goto LABEL_26;
      }
    }
    uint64_t v10 = v29;
    if (a4)
    {
      HMErrorFromOSStatus();
      id v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:
      BOOL v21 = 0;
      *a4 = v19;
      goto LABEL_44;
    }
LABEL_43:
    BOOL v21 = 0;
  }
  else
  {
LABEL_30:
    if (objc_msgSend(v9, "count", v27)) {
      id v22 = v9;
    }
    else {
      id v22 = 0;
    }
    [v28 setMulticastBridgingRules:v22];
    if ([v10 count]) {
      int v23 = v10;
    }
    else {
      int v23 = 0;
    }
    [v28 setStaticPortRules:v23];
    if ([v11 count]) {
      uint64_t v24 = v11;
    }
    else {
      uint64_t v24 = 0;
    }
    [v28 setDynamicPortRules:v24];
    if ([v12 count]) {
      uint64_t v25 = v12;
    }
    else {
      uint64_t v25 = 0;
    }
    [v28 setStaticICMPRules:v25];
    id v13 = 0;
    BOOL v21 = 1;
  }
LABEL_44:

  return v21;
}

- (HMDNetworkRouterLANFirewallRuleList)initWithMulticastBridgingRules:(id)a3 staticPortRules:(id)a4 dynamicPortRules:(id)a5 staticICMPRules:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDNetworkRouterLANFirewallRuleList;
  int v15 = [(HMDNetworkRouterLANFirewallRuleList *)&v18 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_multicastBridgingRules, a3);
    objc_storeStrong((id *)&v16->_staticPortRules, a4);
    objc_storeStrong((id *)&v16->_dynamicPortRules, a5);
    objc_storeStrong((id *)&v16->_staticICMPRules, a6);
  }

  return v16;
}

- (HMDNetworkRouterLANFirewallRuleList)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterLANFirewallRuleList;
  return [(HMDNetworkRouterLANFirewallRuleList *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HMDNetworkRouterLANFirewallRuleList);
  uint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HMDNetworkRouterLANFirewallRuleList *)v6 parseFromData:v5 error:&v10];
    id v8 = v10;
    if (v8)
    {

      uint64_t v7 = 0;
      if (a4) {
        *a4 = v8;
      }
    }
  }
  return v7;
}

@end