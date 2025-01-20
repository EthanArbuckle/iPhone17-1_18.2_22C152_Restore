@interface HMDNetworkRouterFirewallRuleLANStatic
+ (id)createWithJSONDictionary:(id)a3 name:(id)a4 critical:(BOOL)a5 purpose:(unint64_t)a6 allowInterAccessoryConnections:(BOOL)a7 direction:(unsigned __int8)a8 requiredForHAPFunctionality:(BOOL)a9 ruleDictionary:(id)a10 error:(id *)a11;
- (BOOL)isEqual:(id)a3;
- (HMDNetworkRouterFirewallRuleLANStatic)initWithJSONDictionary:(id)a3 name:(id)a4 critical:(BOOL)a5 purpose:(unint64_t)a6 allowInterAccessoryConnections:(BOOL)a7 direction:(unsigned __int8)a8 requiredForHAPFunctionality:(BOOL)a9 transportProtocol:(unsigned __int8)a10 ipAddress:(id)a11 portStart:(unsigned __int16)a12 portEnd:(unsigned __int16)a13 icmpTypes:(id)a14;
- (HMFNetAddress)ipAddress;
- (NSArray)icmpTypes;
- (id)attributeDescriptions;
- (id)prettyJSONDictionary;
- (unint64_t)hash;
- (unsigned)portEnd;
- (unsigned)portStart;
- (unsigned)transportProtocol;
@end

@implementation HMDNetworkRouterFirewallRuleLANStatic

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icmpTypes, 0);
  objc_storeStrong((id *)&self->_ipAddress, 0);
}

- (NSArray)icmpTypes
{
  return self->_icmpTypes;
}

- (unsigned)portEnd
{
  return self->_portEnd;
}

- (unsigned)portStart
{
  return self->_portStart;
}

- (HMFNetAddress)ipAddress
{
  return self->_ipAddress;
}

- (unsigned)transportProtocol
{
  return self->_transportProtocol;
}

- (id)prettyJSONDictionary
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  v17.receiver = self;
  v17.super_class = (Class)HMDNetworkRouterFirewallRuleLANStatic;
  v4 = [(HMDNetworkRouterFirewallRuleLAN *)&v17 prettyJSONDictionary];
  v5 = [v3 dictionaryWithDictionary:v4];

  [v5 setObject:@"Static Port Rule" forKeyedSubscript:@"type"];
  v6 = objc_msgSend((id)objc_opt_class(), "__transportProtocolToString:", -[HMDNetworkRouterFirewallRuleLANStatic transportProtocol](self, "transportProtocol"));
  [v5 setObject:v6 forKeyedSubscript:@"transportProtocol"];

  v7 = [(HMDNetworkRouterFirewallRuleLANStatic *)self ipAddress];
  v8 = [v7 addressString];
  [v5 setObject:v8 forKeyedSubscript:@"ipAddress"];

  unsigned int v9 = [(HMDNetworkRouterFirewallRuleLANStatic *)self transportProtocol];
  if (v9 >= 2)
  {
    if (v9 != 2) {
      goto LABEL_9;
    }
    v12 = [(HMDNetworkRouterFirewallRuleLANStatic *)self icmpTypes];
    v14 = objc_msgSend(v12, "na_map:", &__block_literal_global_190894);
    [v5 setObject:v14 forKeyedSubscript:@"icmpTypes"];
  }
  else
  {
    int v10 = [(HMDNetworkRouterFirewallRuleLANStatic *)self portStart];
    int v11 = [(HMDNetworkRouterFirewallRuleLANStatic *)self portEnd];
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[HMDNetworkRouterFirewallRuleLANStatic portStart](self, "portStart"));
    if (v10 == v11)
    {
      v13 = @"port";
    }
    else
    {
      [v5 setObject:v12 forKeyedSubscript:@"portStart"];

      v12 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[HMDNetworkRouterFirewallRuleLANStatic portEnd](self, "portEnd"));
      v13 = @"portEnd";
    }
    [v5 setObject:v12 forKeyedSubscript:v13];
  }

LABEL_9:
  v15 = (void *)[v5 copy];

  return v15;
}

uint64_t __61__HMDNetworkRouterFirewallRuleLANStatic_prettyJSONDictionary__block_invoke(uint64_t a1, void *a2)
{
  return [a2 prettyJSONDictionary];
}

- (id)attributeDescriptions
{
  v20[4] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)HMDNetworkRouterFirewallRuleLANStatic;
  v3 = [(HMDNetworkRouterFirewallRuleLAN *)&v19 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v18 = [(HMDNetworkRouterFirewallRuleLANStatic *)self ipAddress];
  v5 = (void *)[v4 initWithName:@"IPAddress" value:v18];
  v20[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[HMDNetworkRouterFirewallRuleLANStatic portStart](self, "portStart"));
  v8 = (void *)[v6 initWithName:@"PortStart" value:v7];
  v20[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  int v10 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[HMDNetworkRouterFirewallRuleLANStatic portEnd](self, "portEnd"));
  int v11 = (void *)[v9 initWithName:@"PortEnd" value:v10];
  v20[2] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  v13 = [(HMDNetworkRouterFirewallRuleLANStatic *)self icmpTypes];
  v14 = (void *)[v12 initWithName:@"ICMPTypes" value:v13];
  v20[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
  v16 = [v3 arrayByAddingObjectsFromArray:v15];

  return v16;
}

- (unint64_t)hash
{
  v3 = [(HMDNetworkRouterFirewallRuleLANStatic *)self ipAddress];
  uint64_t v4 = [v3 hash];

  uint64_t v5 = v4 ^ [(HMDNetworkRouterFirewallRuleLANStatic *)self portStart];
  uint64_t v6 = [(HMDNetworkRouterFirewallRuleLANStatic *)self portEnd];
  v7 = [(HMDNetworkRouterFirewallRuleLANStatic *)self icmpTypes];
  unint64_t v8 = v5 ^ v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMDNetworkRouterFirewallRuleLANStatic *)a3;
  if (self == v4)
  {
    char v15 = 1;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)HMDNetworkRouterFirewallRuleLANStatic;
    if ([(HMDNetworkRouterFirewallRuleLAN *)&v17 isEqual:v4])
    {
      uint64_t v5 = v4;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = 0;
      }
      v7 = v6;

      if (!v7) {
        goto LABEL_13;
      }
      unint64_t v8 = [(HMDNetworkRouterFirewallRuleLANStatic *)self ipAddress];
      id v9 = [(HMDNetworkRouterFirewallRuleLANStatic *)v7 ipAddress];
      int v10 = HMFEqualObjects();

      if (!v10) {
        goto LABEL_13;
      }
      int v11 = [(HMDNetworkRouterFirewallRuleLANStatic *)self portStart];
      if (v11 == [(HMDNetworkRouterFirewallRuleLANStatic *)v7 portStart]
        && (int v12 = [(HMDNetworkRouterFirewallRuleLANStatic *)self portEnd],
            v12 == [(HMDNetworkRouterFirewallRuleLANStatic *)v7 portEnd]))
      {
        v13 = [(HMDNetworkRouterFirewallRuleLANStatic *)self icmpTypes];
        v14 = [(HMDNetworkRouterFirewallRuleLANStatic *)v7 icmpTypes];
        char v15 = HMFEqualObjects();
      }
      else
      {
LABEL_13:
        char v15 = 0;
      }
    }
    else
    {
      char v15 = 0;
    }
  }

  return v15;
}

- (HMDNetworkRouterFirewallRuleLANStatic)initWithJSONDictionary:(id)a3 name:(id)a4 critical:(BOOL)a5 purpose:(unint64_t)a6 allowInterAccessoryConnections:(BOOL)a7 direction:(unsigned __int8)a8 requiredForHAPFunctionality:(BOOL)a9 transportProtocol:(unsigned __int8)a10 ipAddress:(id)a11 portStart:(unsigned __int16)a12 portEnd:(unsigned __int16)a13 icmpTypes:(id)a14
{
  uint64_t v14 = a8;
  BOOL v15 = a7;
  BOOL v17 = a5;
  id v27 = a11;
  id v26 = a14;
  v28.receiver = self;
  v28.super_class = (Class)HMDNetworkRouterFirewallRuleLANStatic;
  v21 = [(HMDNetworkRouterFirewallRuleLAN *)&v28 initWithJSONDictionary:a3 name:a4 critical:v17 purpose:a6 allowInterAccessoryConnections:v15 direction:v14 requiredForHAPFunctionality:a9];
  v22 = v21;
  if (v21)
  {
    v21->_transportProtocol = a10;
    objc_storeStrong((id *)&v21->_ipAddress, a11);
    v22->_portStart = a12;
    v22->_portEnd = a13;
    objc_storeStrong((id *)&v22->_icmpTypes, a14);
    v23 = v22;
  }

  return v22;
}

+ (id)createWithJSONDictionary:(id)a3 name:(id)a4 critical:(BOOL)a5 purpose:(unint64_t)a6 allowInterAccessoryConnections:(BOOL)a7 direction:(unsigned __int8)a8 requiredForHAPFunctionality:(BOOL)a9 ruleDictionary:(id)a10 error:(id *)a11
{
  uint64_t v11 = a8;
  BOOL v12 = a7;
  BOOL v14 = a5;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a10;
  unsigned __int8 v52 = 0;
  if (!objc_msgSend(a1, "__decodeTransportProtocolFromJSONDictionary:key:transportProtocol:error:", v19, @"r", &v52, a11))
  {
    v30 = 0;
    goto LABEL_50;
  }
  id v48 = v17;
  id v51 = 0;
  char v20 = decodeAddressFromJSONDictionary(v19, @"i", 0, &v51);
  id v21 = v51;
  if ((v20 & 1) == 0)
  {
    if (a11)
    {
      id v31 = v21;
      [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      v30 = 0;
      *a11 = (id)objc_claimAutoreleasedReturnValue();
      id v21 = v31;
    }
    else
    {
      v30 = 0;
    }
    id v17 = v48;
    goto LABEL_49;
  }
  id v47 = v18;
  if (v21)
  {
    v22 = v21;
    BOOL v23 = [v21 addressFamily] == 1;
    id v21 = v22;
    if (!v23)
    {
      BOOL v23 = [v22 addressFamily] == 2;
      id v21 = v22;
      if (!v23)
      {
        v37 = (void *)MEMORY[0x1D9452090](v22);
        id v38 = a1;
        v39 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v41 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v54 = v41;
          __int16 v55 = 2112;
          v56 = v22;
          _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_ERROR, "%{public}@Rule contains an invalid IP address value: %@", buf, 0x16u);
        }
        if (a11)
        {
          [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
          v30 = 0;
          *a11 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v30 = 0;
        }
        id v21 = v22;
        id v18 = v47;
        id v17 = v48;
        goto LABEL_49;
      }
    }
  }
  int v50 = 0;
  if (v52 >= 2u)
  {
    if (v52 != 2)
    {
      id v18 = v47;
      id v17 = v48;
      if (a11)
      {
        id v36 = v21;
        [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
        v30 = 0;
        *a11 = (id)objc_claimAutoreleasedReturnValue();
        id v21 = v36;
      }
      else
      {
        v30 = 0;
      }
      goto LABEL_49;
    }
    id v46 = v21;
    uint64_t v32 = +[HMDNetworkRouterFirewallRuleICMPType createListWithJSONDictionary:v19 key:@"it"];
    if (!v32)
    {
      if (a11)
      {
        [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
        v30 = 0;
        *a11 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v30 = 0;
      }
      id v17 = v48;
      goto LABEL_48;
    }
    v33 = (void *)v32;
    __int16 v34 = 0;
    __int16 v35 = 0;
  }
  else
  {
    id v46 = v21;
    id v17 = v48;
    if ((decodePortFromJSONDictionary(v19, @"p", 1, (_WORD *)&v50 + 1, 0) & 1) == 0)
    {
      if (a11)
      {
        [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
        v30 = 0;
        *a11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_48:
        id v21 = v46;
        id v18 = v47;
        goto LABEL_49;
      }
LABEL_43:
      v30 = 0;
      goto LABEL_48;
    }
    BOOL v49 = 0;
    if ((decodePortFromJSONDictionary(v19, @"q", 0, &v50, &v49) & 1) == 0)
    {
LABEL_41:
      if (a11)
      {
        *a11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      }
      goto LABEL_43;
    }
    __int16 v24 = HIWORD(v50);
    if (v49)
    {
      __int16 v24 = v50;
      if (HIWORD(v50) > (unsigned __int16)v50)
      {
        v25 = (void *)MEMORY[0x1D9452090]();
        id v26 = a1;
        id v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          objc_super v28 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v54 = v28;
          v29 = "%{public}@Must have portStart less than or equal to portEnd";
LABEL_39:
          _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, v29, buf, 0xCu);

          goto LABEL_40;
        }
        goto LABEL_40;
      }
      if (HIWORD(v50) && !(_WORD)v50)
      {
        v25 = (void *)MEMORY[0x1D9452090]();
        id v26 = a1;
        id v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          objc_super v28 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v54 = v28;
          v29 = "%{public}@Must not have portEnd set to 0";
          goto LABEL_39;
        }
LABEL_40:

        id v17 = v48;
        goto LABEL_41;
      }
    }
    v33 = 0;
    __int16 v35 = HIWORD(v50);
    __int16 v34 = v24;
  }
  id v42 = objc_alloc((Class)a1);
  WORD1(v45) = v34;
  LOWORD(v45) = v35;
  BYTE1(v44) = v52;
  LOBYTE(v44) = a9;
  v30 = objc_msgSend(v42, "initWithJSONDictionary:name:critical:purpose:allowInterAccessoryConnections:direction:requiredForHAPFunctionality:transportProtocol:ipAddress:portStart:portEnd:icmpTypes:", v48, v47, v14, a6, v12, v11, v44, v46, v45, v33);

  id v21 = v46;
  id v18 = v47;
  id v17 = v48;
LABEL_49:

LABEL_50:
  return v30;
}

@end