@interface HMDNetworkRouterFirewallRuleLANMulticast
+ (id)createWithJSONDictionary:(id)a3 name:(id)a4 critical:(BOOL)a5 purpose:(unint64_t)a6 allowInterAccessoryConnections:(BOOL)a7 direction:(unsigned __int8)a8 requiredForHAPFunctionality:(BOOL)a9 ruleDictionary:(id)a10 error:(id *)a11;
- (BOOL)isEqual:(id)a3;
- (HMDNetworkRouterFirewallRuleLANMulticast)initWithJSONDictionary:(id)a3 name:(id)a4 critical:(BOOL)a5 purpose:(unint64_t)a6 allowInterAccessoryConnections:(BOOL)a7 direction:(unsigned __int8)a8 requiredForHAPFunctionality:(BOOL)a9 ipAddress:(id)a10 port:(unsigned __int16)a11;
- (HMFNetAddress)ipAddress;
- (id)attributeDescriptions;
- (id)prettyJSONDictionary;
- (unint64_t)hash;
- (unsigned)port;
@end

@implementation HMDNetworkRouterFirewallRuleLANMulticast

- (void).cxx_destruct
{
}

- (unsigned)port
{
  return self->_port;
}

- (HMFNetAddress)ipAddress
{
  return self->_ipAddress;
}

- (id)prettyJSONDictionary
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  v11.receiver = self;
  v11.super_class = (Class)HMDNetworkRouterFirewallRuleLANMulticast;
  v4 = [(HMDNetworkRouterFirewallRuleLAN *)&v11 prettyJSONDictionary];
  v5 = [v3 dictionaryWithDictionary:v4];

  [v5 setObject:@"Multicast Bridging Rule" forKeyedSubscript:@"type"];
  v6 = [(HMDNetworkRouterFirewallRuleLANMulticast *)self ipAddress];
  v7 = [v6 addressString];
  [v5 setObject:v7 forKeyedSubscript:@"ipAddress"];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[HMDNetworkRouterFirewallRuleLANMulticast port](self, "port"));
  [v5 setObject:v8 forKeyedSubscript:@"port"];

  v9 = (void *)[v5 copy];
  return v9;
}

- (id)attributeDescriptions
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)HMDNetworkRouterFirewallRuleLANMulticast;
  v3 = [(HMDNetworkRouterFirewallRuleLAN *)&v13 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v5 = [(HMDNetworkRouterFirewallRuleLANMulticast *)self ipAddress];
  v6 = (void *)[v4 initWithName:@"IPAddress" value:v5];
  v14[0] = v6;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[HMDNetworkRouterFirewallRuleLANMulticast port](self, "port"));
  v9 = (void *)[v7 initWithName:@"Port" value:v8];
  v14[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  objc_super v11 = [v3 arrayByAddingObjectsFromArray:v10];

  return v11;
}

- (unint64_t)hash
{
  v3 = [(HMDNetworkRouterFirewallRuleLANMulticast *)self ipAddress];
  uint64_t v4 = [v3 hash];

  return v4 ^ [(HMDNetworkRouterFirewallRuleLANMulticast *)self port];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMDNetworkRouterFirewallRuleLANMulticast *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)HMDNetworkRouterFirewallRuleLANMulticast;
    if ([(HMDNetworkRouterFirewallRuleLAN *)&v13 isEqual:v4])
    {
      v5 = v4;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v6 = v5;
      }
      else {
        v6 = 0;
      }
      id v7 = v6;

      if (v7)
      {
        v8 = [(HMDNetworkRouterFirewallRuleLANMulticast *)self ipAddress];
        v9 = [(HMDNetworkRouterFirewallRuleLANMulticast *)v7 ipAddress];
        if ([v8 isEqual:v9])
        {
          int v10 = [(HMDNetworkRouterFirewallRuleLANMulticast *)self port];
          BOOL v11 = v10 == [(HMDNetworkRouterFirewallRuleLANMulticast *)v7 port];
        }
        else
        {
          BOOL v11 = 0;
        }
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (HMDNetworkRouterFirewallRuleLANMulticast)initWithJSONDictionary:(id)a3 name:(id)a4 critical:(BOOL)a5 purpose:(unint64_t)a6 allowInterAccessoryConnections:(BOOL)a7 direction:(unsigned __int8)a8 requiredForHAPFunctionality:(BOOL)a9 ipAddress:(id)a10 port:(unsigned __int16)a11
{
  uint64_t v11 = a8;
  BOOL v12 = a7;
  BOOL v14 = a5;
  id v18 = a10;
  v24.receiver = self;
  v24.super_class = (Class)HMDNetworkRouterFirewallRuleLANMulticast;
  v19 = [(HMDNetworkRouterFirewallRuleLAN *)&v24 initWithJSONDictionary:a3 name:a4 critical:v14 purpose:a6 allowInterAccessoryConnections:v12 direction:v11 requiredForHAPFunctionality:a9];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_ipAddress, a10);
    v20->_port = a11;
    v21 = v20;
  }

  return v20;
}

+ (id)createWithJSONDictionary:(id)a3 name:(id)a4 critical:(BOOL)a5 purpose:(unint64_t)a6 allowInterAccessoryConnections:(BOOL)a7 direction:(unsigned __int8)a8 requiredForHAPFunctionality:(BOOL)a9 ruleDictionary:(id)a10 error:(id *)a11
{
  unsigned int v31 = a8;
  BOOL v11 = a7;
  BOOL v13 = a5;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v16 = a4;
  id v17 = a10;
  id v33 = 0;
  char v18 = decodeAddressFromJSONDictionary(v17, @"i", 1, &v33);
  id v19 = v33;
  v20 = v19;
  if ((v18 & 1) == 0) {
    goto LABEL_11;
  }
  if ([v19 addressFamily] != 1 && objc_msgSend(v20, "addressFamily") != 2)
  {
    objc_super v24 = (void *)MEMORY[0x1D9452090]();
    id v25 = a1;
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v35 = v27;
      __int16 v36 = 2112;
      v37 = v20;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Rule contains an invalid IP address value: %@", buf, 0x16u);
    }
    goto LABEL_11;
  }
  *(_WORD *)buf = 0;
  if ((decodePortFromJSONDictionary(v17, @"p", 1, buf, 0) & 1) == 0)
  {
LABEL_11:
    if (a11)
    {
      [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      v23 = 0;
      *a11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
    v22 = v32;
    goto LABEL_15;
  }
  if (a11)
  {
    *a11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
  }
  id v21 = objc_alloc((Class)a1);
  LOWORD(v30) = *(_WORD *)buf;
  LOBYTE(v29) = a9;
  v22 = v32;
  v23 = (void *)[v21 initWithJSONDictionary:v32 name:v16 critical:v13 purpose:a6 allowInterAccessoryConnections:v11 direction:v31 requiredForHAPFunctionality:v29 ipAddress:v20 port:v30];
LABEL_15:

  return v23;
}

@end