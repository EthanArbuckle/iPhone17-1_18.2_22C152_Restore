@interface HMDNetworkRouterFirewallRuleLANDynamic
+ (BOOL)__decodeAdvertisingProtocol:(id)a3 advertisingProtocol:(unsigned __int8 *)a4 error:(id *)a5;
+ (BOOL)__decodeFlags:(id)a3 advertisingOnly:(BOOL *)a4 error:(id *)a5;
+ (BOOL)__decodeServiceType:(id)a3 serviceType:(id *)a4 error:(id *)a5;
+ (id)__advertisingProtocolToString:(unsigned __int8)a3;
+ (id)createWithJSONDictionary:(id)a3 name:(id)a4 critical:(BOOL)a5 purpose:(unint64_t)a6 allowInterAccessoryConnections:(BOOL)a7 direction:(unsigned __int8)a8 requiredForHAPFunctionality:(BOOL)a9 ruleDictionary:(id)a10 error:(id *)a11;
- (BOOL)isAdvertisingOnly;
- (BOOL)isEqual:(id)a3;
- (HMDNetworkRouterFirewallRuleLANDynamic)initWithJSONDictionary:(id)a3 name:(id)a4 critical:(BOOL)a5 purpose:(unint64_t)a6 allowInterAccessoryConnections:(BOOL)a7 direction:(unsigned __int8)a8 requiredForHAPFunctionality:(BOOL)a9 transportProtocol:(unsigned __int8)a10 advertisingProtocol:(unsigned __int8)a11 advertisingOnly:(BOOL)a12 serviceType:(id)a13;
- (NSString)serviceType;
- (id)attributeDescriptions;
- (id)prettyJSONDictionary;
- (unint64_t)hash;
- (unsigned)advertisingProtocol;
- (unsigned)transportProtocol;
@end

@implementation HMDNetworkRouterFirewallRuleLANDynamic

- (void).cxx_destruct
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (BOOL)isAdvertisingOnly
{
  return self->_advertisingOnly;
}

- (unsigned)advertisingProtocol
{
  return self->_advertisingProtocol;
}

- (unsigned)transportProtocol
{
  return self->_transportProtocol;
}

- (id)prettyJSONDictionary
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  v12.receiver = self;
  v12.super_class = (Class)HMDNetworkRouterFirewallRuleLANDynamic;
  v4 = [(HMDNetworkRouterFirewallRuleLAN *)&v12 prettyJSONDictionary];
  v5 = [v3 dictionaryWithDictionary:v4];

  [v5 setObject:@"Dynamic Port Rule" forKeyedSubscript:@"type"];
  v6 = objc_msgSend((id)objc_opt_class(), "__transportProtocolToString:", -[HMDNetworkRouterFirewallRuleLANDynamic transportProtocol](self, "transportProtocol"));
  [v5 setObject:v6 forKeyedSubscript:@"transportProtocol"];

  v7 = objc_msgSend((id)objc_opt_class(), "__advertisingProtocolToString:", -[HMDNetworkRouterFirewallRuleLANDynamic advertisingProtocol](self, "advertisingProtocol"));
  [v5 setObject:v7 forKeyedSubscript:@"advertisingProtocol"];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDNetworkRouterFirewallRuleLANDynamic isAdvertisingOnly](self, "isAdvertisingOnly"));
  [v5 setObject:v8 forKeyedSubscript:@"advertisingOnly"];

  v9 = [(HMDNetworkRouterFirewallRuleLANDynamic *)self serviceType];
  [v5 setObject:v9 forKeyedSubscript:@"serviceType"];

  v10 = (void *)[v5 copy];
  return v10;
}

- (id)attributeDescriptions
{
  v20[4] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)HMDNetworkRouterFirewallRuleLANDynamic;
  v17 = [(HMDNetworkRouterFirewallRuleLAN *)&v19 attributeDescriptions];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v18 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[HMDNetworkRouterFirewallRuleLANDynamic transportProtocol](self, "transportProtocol"));
  v4 = (void *)[v3 initWithName:@"TransportProtocol" value:v18];
  v20[0] = v4;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[HMDNetworkRouterFirewallRuleLANDynamic advertisingProtocol](self, "advertisingProtocol"));
  v7 = (void *)[v5 initWithName:@"AdvertisingProtocol" value:v6];
  v20[1] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDNetworkRouterFirewallRuleLANDynamic isAdvertisingOnly](self, "isAdvertisingOnly"));
  v10 = (void *)[v8 initWithName:@"AdvertisingOnly" value:v9];
  v20[2] = v10;
  id v11 = objc_alloc(MEMORY[0x1E4F653F8]);
  objc_super v12 = [(HMDNetworkRouterFirewallRuleLANDynamic *)self serviceType];
  v13 = (void *)[v11 initWithName:@"ServiceType" value:v12];
  v20[3] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
  v15 = [v17 arrayByAddingObjectsFromArray:v14];

  return v15;
}

- (unint64_t)hash
{
  int v3 = [(HMDNetworkRouterFirewallRuleLANDynamic *)self transportProtocol];
  int v4 = [(HMDNetworkRouterFirewallRuleLANDynamic *)self advertisingProtocol] ^ v3;
  uint64_t v5 = v4 ^ [(HMDNetworkRouterFirewallRuleLANDynamic *)self isAdvertisingOnly];
  v6 = [(HMDNetworkRouterFirewallRuleLANDynamic *)self serviceType];
  unint64_t v7 = [v6 hash] ^ v5;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (HMDNetworkRouterFirewallRuleLANDynamic *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)HMDNetworkRouterFirewallRuleLANDynamic;
    if ([(HMDNetworkRouterFirewallRuleLAN *)&v15 isEqual:v4])
    {
      uint64_t v5 = v4;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v6 = v5;
      }
      else {
        v6 = 0;
      }
      unint64_t v7 = v6;

      int v8 = [(HMDNetworkRouterFirewallRuleLANDynamic *)self transportProtocol];
      if (v8 == [(HMDNetworkRouterFirewallRuleLANDynamic *)v7 transportProtocol]
        && (int v9 = [(HMDNetworkRouterFirewallRuleLANDynamic *)self advertisingProtocol],
            v9 == [(HMDNetworkRouterFirewallRuleLANDynamic *)v7 advertisingProtocol])
        && (BOOL v10 = [(HMDNetworkRouterFirewallRuleLANDynamic *)self isAdvertisingOnly],
            v10 == [(HMDNetworkRouterFirewallRuleLANDynamic *)v7 isAdvertisingOnly]))
      {
        v13 = [(HMDNetworkRouterFirewallRuleLANDynamic *)self serviceType];
        v14 = [(HMDNetworkRouterFirewallRuleLANDynamic *)v7 serviceType];
        char v11 = HMFEqualObjects();
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (HMDNetworkRouterFirewallRuleLANDynamic)initWithJSONDictionary:(id)a3 name:(id)a4 critical:(BOOL)a5 purpose:(unint64_t)a6 allowInterAccessoryConnections:(BOOL)a7 direction:(unsigned __int8)a8 requiredForHAPFunctionality:(BOOL)a9 transportProtocol:(unsigned __int8)a10 advertisingProtocol:(unsigned __int8)a11 advertisingOnly:(BOOL)a12 serviceType:(id)a13
{
  uint64_t v13 = a8;
  BOOL v14 = a7;
  BOOL v16 = a5;
  id v20 = a13;
  v26.receiver = self;
  v26.super_class = (Class)HMDNetworkRouterFirewallRuleLANDynamic;
  v21 = [(HMDNetworkRouterFirewallRuleLAN *)&v26 initWithJSONDictionary:a3 name:a4 critical:v16 purpose:a6 allowInterAccessoryConnections:v14 direction:v13 requiredForHAPFunctionality:a9];
  v22 = v21;
  if (v21)
  {
    v21->_transportProtocol = a10;
    v21->_advertisingProtocol = a11;
    v21->_advertisingOnly = a12;
    objc_storeStrong((id *)&v21->_serviceType, a13);
    v23 = v22;
  }

  return v22;
}

+ (id)createWithJSONDictionary:(id)a3 name:(id)a4 critical:(BOOL)a5 purpose:(unint64_t)a6 allowInterAccessoryConnections:(BOOL)a7 direction:(unsigned __int8)a8 requiredForHAPFunctionality:(BOOL)a9 ruleDictionary:(id)a10 error:(id *)a11
{
  unsigned int v30 = a8;
  BOOL v11 = a7;
  BOOL v13 = a5;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a10;
  unsigned __int8 v33 = 0;
  if (!objc_msgSend(a1, "__decodeTransportProtocolFromJSONDictionary:key:transportProtocol:error:", v18, @"r", &v33, a11))goto LABEL_12; {
  if (v33 >= 2u)
  }
  {
    objc_super v19 = (void *)MEMORY[0x1D9452090]();
    id v20 = a1;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v35 = v22;
      __int16 v36 = 2112;
      v37 = @"r";
      __int16 v38 = 2112;
      id v39 = v18;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Rule contains an invalid '%@' value: %@", buf, 0x20u);
    }
    if (a11)
    {
      [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      v23 = 0;
      *a11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  buf[0] = 0;
  if (!objc_msgSend(a1, "__decodeAdvertisingProtocol:advertisingProtocol:error:", v18, buf, a11)
    || (char v32 = 0, !objc_msgSend(a1, "__decodeFlags:advertisingOnly:error:", v18, &v32, a11)))
  {
LABEL_12:
    v23 = 0;
    goto LABEL_13;
  }
  id v31 = 0;
  int v24 = objc_msgSend(a1, "__decodeServiceType:serviceType:error:", v18, &v31, a11);
  id v25 = v31;
  v23 = 0;
  if (v24)
  {
    id v26 = v25;
    id v27 = objc_alloc((Class)a1);
    BYTE3(v29) = v32;
    *(_WORD *)((char *)&v29 + 1) = __PAIR16__(buf[0], v33);
    LOBYTE(v29) = a9;
    v23 = objc_msgSend(v27, "initWithJSONDictionary:name:critical:purpose:allowInterAccessoryConnections:direction:requiredForHAPFunctionality:transportProtocol:advertisingProtocol:advertisingOnly:serviceType:", v16, v17, v13, a6, v11, v30, v29, v26);
    id v25 = v26;
  }

LABEL_13:
  return v23;
}

+ (BOOL)__decodeServiceType:(id)a3 serviceType:(id *)a4 error:(id *)a5
{
  id v11 = 0;
  char v7 = decodeStringFromJSONDictionary(a3, @"s", 1, &v11);
  id v8 = v11;
  int v9 = v8;
  if (v7)
  {
    *a4 = v8;
  }
  else if (a5)
  {
    *a5 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
  }

  return v7;
}

+ (BOOL)__decodeFlags:(id)a3 advertisingOnly:(BOOL *)a4 error:(id *)a5
{
  id v11 = 0;
  char v7 = decodeUnsignedIntegerFromJSONDictionary(a3, @"f", 0, 0xFFFFFFFFuLL, &v11);
  id v8 = v11;
  int v9 = v8;
  if (v7)
  {
    *a4 = [v8 unsignedLongValue] & 1;
  }
  else if (a5)
  {
    *a5 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
  }

  return v7;
}

+ (BOOL)__decodeAdvertisingProtocol:(id)a3 advertisingProtocol:(unsigned __int8 *)a4 error:(id *)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v20 = 0;
  char v9 = decodeUnsignedIntegerFromJSONDictionary(v8, @"a", 1, 0xFFuLL, &v20);
  id v10 = v20;
  id v11 = v10;
  if ((v9 & 1) == 0)
  {
    if (a5)
    {
      BOOL v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
LABEL_12:
      BOOL v13 = 0;
      *a5 = v14;
      goto LABEL_14;
    }
LABEL_13:
    BOOL v13 = 0;
    goto LABEL_14;
  }
  int v12 = [v10 unsignedCharValue];
  if (v12 == 1)
  {
    BOOL v13 = 1;
    *a4 = 1;
    goto LABEL_14;
  }
  if (v12)
  {
    objc_super v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = a1;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v22 = v18;
      __int16 v23 = 2112;
      int v24 = @"a";
      __int16 v25 = 2112;
      id v26 = v8;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Rule contains an unknown '%@' value: %@", buf, 0x20u);
    }
    if (a5)
    {
      BOOL v14 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1070];
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  *a4 = 0;
  BOOL v13 = 1;
LABEL_14:

  return v13;
}

+ (id)__advertisingProtocolToString:(unsigned __int8)a3
{
  int v3 = @"Unknown";
  if (a3 == 1) {
    int v3 = @"SSDP";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"DNS-SD";
  }
}

@end