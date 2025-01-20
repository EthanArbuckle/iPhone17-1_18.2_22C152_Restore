@interface HMDNetworkRouterFirewallRuleWAN
+ (BOOL)__decodeAddress:(id)a3 subject:(id *)a4;
+ (BOOL)__decodeAddressRange:(id)a3 endValue:(id)a4 subject:(id *)a5;
+ (BOOL)__decodeAddresses:(id)a3 subject:(id *)a4;
+ (BOOL)__decodeFlags:(id)a3 critical:(BOOL *)a4;
+ (BOOL)__decodeHostnames:(id)a3 subject:(id *)a4;
+ (BOOL)__decodePorts:(id)a3 portStart:(unsigned __int16 *)a4 portEnd:(unsigned __int16 *)a5;
+ (BOOL)__decodePurpose:(id)a3 purpose:(unint64_t *)a4;
+ (BOOL)__decodeSubject:(id)a3 subject:(id *)a4;
+ (BOOL)__decodeType:(id)a3 transportProtocol:(unsigned __int8 *)a4 error:(id *)a5;
+ (HMFNetAddress)ipAddressAny;
+ (HMFNetAddress)ipAddressAnyIPv4;
+ (HMFNetAddress)ipAddressAnyIPv6;
+ (id)__nonWildcardAddressFrom:(id)a3 key:(id)a4;
+ (id)createWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (HMDNetworkRouterFirewallRuleWAN)initWithJSONDictionary:(id)a3 name:(id)a4 critical:(BOOL)a5 purpose:(unint64_t)a6 transportProtocol:(unsigned __int8)a7 subject:(id)a8 portStart:(unsigned __int16)a9 portEnd:(unsigned __int16)a10 icmpTypes:(id)a11;
- (HMDNetworkRouterFirewallRuleWANSubject)subject;
- (NSArray)icmpTypes;
- (id)attributeDescriptions;
- (id)prettyJSONDictionary;
- (unint64_t)hash;
- (unint64_t)purpose;
- (unsigned)portEnd;
- (unsigned)portStart;
- (unsigned)transportProtocol;
@end

@implementation HMDNetworkRouterFirewallRuleWAN

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icmpTypes, 0);
  objc_storeStrong((id *)&self->_subject, 0);
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

- (HMDNetworkRouterFirewallRuleWANSubject)subject
{
  return self->_subject;
}

- (unsigned)transportProtocol
{
  return self->_transportProtocol;
}

- (unint64_t)purpose
{
  return self->_purpose;
}

- (id)prettyJSONDictionary
{
  v23.receiver = self;
  v23.super_class = (Class)HMDNetworkRouterFirewallRuleWAN;
  v3 = [(HMDNetworkRouterFirewallRule *)&v23 prettyJSONDictionary];
  v4 = (void *)[v3 mutableCopy];

  v5 = objc_msgSend((id)objc_opt_class(), "__transportProtocolToString:", -[HMDNetworkRouterFirewallRuleWAN transportProtocol](self, "transportProtocol"));
  [v4 setObject:v5 forKeyedSubscript:@"transportProtocol"];

  unint64_t v6 = [(HMDNetworkRouterFirewallRuleWAN *)self purpose];
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (!v6) {
    goto LABEL_36;
  }
  uint64_t v8 = 1;
  unint64_t v9 = v6;
  do
  {
    if ((v8 & v6) == 0) {
      goto LABEL_33;
    }
    if (v8 > 127)
    {
      if (v8 <= 1023)
      {
        switch(v8)
        {
          case 128:
            v10 = @"Metrics";
            break;
          case 256:
            v10 = @"Diagnostics";
            break;
          case 512:
            v10 = @"Remote Access";
            break;
          default:
            goto LABEL_33;
        }
      }
      else if (v8 > 4095)
      {
        if (v8 == 4096)
        {
          v10 = @"Connectivity Checks";
        }
        else
        {
          if (v8 != 0x2000) {
            goto LABEL_33;
          }
          v10 = @"Emergency Notifications";
        }
      }
      else if (v8 == 1024)
      {
        v10 = @"Alternative Home Ecosystem";
      }
      else
      {
        if (v8 != 2048) {
          goto LABEL_33;
        }
        v10 = @"Time Synchronization";
      }
      goto LABEL_32;
    }
    if (v8 > 15)
    {
      switch(v8)
      {
        case 16:
          v10 = @"Events";
          break;
        case 32:
          v10 = @"Storage";
          break;
        case 64:
          v10 = @"Notifications";
          break;
        default:
          goto LABEL_33;
      }
LABEL_32:
      v9 &= ~v8;
      [v7 addObject:v10];
      goto LABEL_33;
    }
    v10 = @"Other";
    switch(v8)
    {
      case 1:
        goto LABEL_32;
      case 2:
        v10 = @"Firmware Update";
        goto LABEL_32;
      case 4:
        v10 = @"Account Management";
        goto LABEL_32;
      case 8:
        v10 = @"Peer to Peer";
        goto LABEL_32;
      default:
        break;
    }
LABEL_33:
    v8 *= 2;
  }
  while (v8 - 1 < v6);
  if (v9)
  {
    v11 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown (0x%llx)", v9);
    [v7 addObject:v11];
  }
LABEL_36:
  if ([v7 count])
  {
    v12 = [v7 componentsJoinedByString:@", "];
  }
  else
  {
    v12 = @"none";
  }

  [v4 setObject:v12 forKeyedSubscript:@"purpose"];
  v13 = [(HMDNetworkRouterFirewallRuleWAN *)self subject];
  v14 = [v13 prettyJSONDictionary];
  [v4 addEntriesFromDictionary:v14];

  unsigned int v15 = [(HMDNetworkRouterFirewallRuleWAN *)self transportProtocol];
  if (v15 >= 2)
  {
    if (v15 == 2)
    {
      v18 = [(HMDNetworkRouterFirewallRuleWAN *)self icmpTypes];
      v20 = objc_msgSend(v18, "na_map:", &__block_literal_global_216_205184);
      [v4 setObject:v20 forKeyedSubscript:@"icmpTypes"];

      goto LABEL_46;
    }
  }
  else
  {
    int v16 = [(HMDNetworkRouterFirewallRuleWAN *)self portStart];
    int v17 = [(HMDNetworkRouterFirewallRuleWAN *)self portEnd];
    v18 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[HMDNetworkRouterFirewallRuleWAN portStart](self, "portStart"));
    if (v16 == v17)
    {
      v19 = @"port";
    }
    else
    {
      [v4 setObject:v18 forKeyedSubscript:@"portStart"];

      v18 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[HMDNetworkRouterFirewallRuleWAN portEnd](self, "portEnd"));
      v19 = @"portEnd";
    }
    [v4 setObject:v18 forKeyedSubscript:v19];
LABEL_46:
  }
  v21 = (void *)[v4 copy];

  return v21;
}

uint64_t __55__HMDNetworkRouterFirewallRuleWAN_prettyJSONDictionary__block_invoke(uint64_t a1, void *a2)
{
  return [a2 prettyJSONDictionary];
}

- (id)attributeDescriptions
{
  v26[6] = *MEMORY[0x263EF8340];
  v25.receiver = self;
  v25.super_class = (Class)HMDNetworkRouterFirewallRuleWAN;
  v3 = [(HMDNetworkRouterFirewallRule *)&v25 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v24 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HMDNetworkRouterFirewallRuleWAN purpose](self, "purpose"));
  objc_super v23 = (void *)[v4 initWithName:@"Purpose" value:v24];
  v26[0] = v23;
  id v5 = objc_alloc(MEMORY[0x263F424F8]);
  v22 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[HMDNetworkRouterFirewallRuleWAN transportProtocol](self, "transportProtocol"));
  v21 = (void *)[v5 initWithName:@"TransportProtocol" value:v22];
  v26[1] = v21;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v20 = [(HMDNetworkRouterFirewallRuleWAN *)self subject];
  id v7 = (void *)[v6 initWithName:@"Subject" value:v20];
  v26[2] = v7;
  id v8 = objc_alloc(MEMORY[0x263F424F8]);
  unint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[HMDNetworkRouterFirewallRuleWAN portStart](self, "portStart"));
  v10 = (void *)[v8 initWithName:@"PortStart" value:v9];
  v26[3] = v10;
  id v11 = objc_alloc(MEMORY[0x263F424F8]);
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[HMDNetworkRouterFirewallRuleWAN portEnd](self, "portEnd"));
  v13 = (void *)[v11 initWithName:@"PortEnd" value:v12];
  v26[4] = v13;
  id v14 = objc_alloc(MEMORY[0x263F424F8]);
  unsigned int v15 = [(HMDNetworkRouterFirewallRuleWAN *)self icmpTypes];
  int v16 = (void *)[v14 initWithName:@"ICMPTypes" value:v15];
  v26[5] = v16;
  int v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:6];
  v18 = [v3 arrayByAddingObjectsFromArray:v17];

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HMDNetworkRouterFirewallRuleWAN *)self purpose];
  uint64_t v4 = [(HMDNetworkRouterFirewallRuleWAN *)self transportProtocol];
  id v5 = [(HMDNetworkRouterFirewallRuleWAN *)self subject];
  uint64_t v6 = v3 ^ [v5 hash] ^ v4;

  uint64_t v7 = [(HMDNetworkRouterFirewallRuleWAN *)self portStart];
  uint64_t v8 = v6 ^ v7 ^ [(HMDNetworkRouterFirewallRuleWAN *)self portEnd];
  unint64_t v9 = [(HMDNetworkRouterFirewallRuleWAN *)self icmpTypes];
  unint64_t v10 = v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMDNetworkRouterFirewallRuleWAN *)a3;
  if (self == v4)
  {
    char v16 = 1;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)HMDNetworkRouterFirewallRuleWAN;
    if ([(HMDNetworkRouterFirewallRule *)&v18 isEqual:v4])
    {
      id v5 = v4;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = 0;
      }
      uint64_t v7 = v6;

      if (v7
        && (unint64_t v8 = [(HMDNetworkRouterFirewallRuleWAN *)self purpose],
            v8 == [(HMDNetworkRouterFirewallRuleWAN *)v7 purpose])
        && (int v9 = [(HMDNetworkRouterFirewallRuleWAN *)self transportProtocol],
            v9 == [(HMDNetworkRouterFirewallRuleWAN *)v7 transportProtocol]))
      {
        unint64_t v10 = [(HMDNetworkRouterFirewallRuleWAN *)self subject];
        id v11 = [(HMDNetworkRouterFirewallRuleWAN *)v7 subject];
        if ([v10 isEqual:v11]
          && (int v12 = [(HMDNetworkRouterFirewallRuleWAN *)self portStart],
              v12 == [(HMDNetworkRouterFirewallRuleWAN *)v7 portStart])
          && (int v13 = [(HMDNetworkRouterFirewallRuleWAN *)self portEnd],
              v13 == [(HMDNetworkRouterFirewallRuleWAN *)v7 portEnd]))
        {
          id v14 = [(HMDNetworkRouterFirewallRuleWAN *)self icmpTypes];
          unsigned int v15 = [(HMDNetworkRouterFirewallRuleWAN *)v7 icmpTypes];
          char v16 = HMFEqualObjects();
        }
        else
        {
          char v16 = 0;
        }
      }
      else
      {
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 0;
    }
  }

  return v16;
}

- (HMDNetworkRouterFirewallRuleWAN)initWithJSONDictionary:(id)a3 name:(id)a4 critical:(BOOL)a5 purpose:(unint64_t)a6 transportProtocol:(unsigned __int8)a7 subject:(id)a8 portStart:(unsigned __int16)a9 portEnd:(unsigned __int16)a10 icmpTypes:(id)a11
{
  BOOL v14 = a5;
  id v18 = a8;
  id v19 = a11;
  v24.receiver = self;
  v24.super_class = (Class)HMDNetworkRouterFirewallRuleWAN;
  v20 = [(HMDNetworkRouterFirewallRule *)&v24 initWithJSONDictionary:a3 name:a4 critical:v14];
  v21 = v20;
  if (v20)
  {
    v20->_purpose = a6;
    v20->_transportProtocol = a7;
    objc_storeStrong((id *)&v20->_subject, a8);
    v21->_portStart = a9;
    v21->_portEnd = a10;
    objc_storeStrong((id *)&v21->_icmpTypes, a11);
    v22 = v21;
  }

  return v21;
}

+ (id)createWithJSONDictionary:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  unsigned __int8 v29 = 0;
  if (!objc_msgSend(a1, "__decodeType:transportProtocol:error:", v6, &v29, a4))
  {
LABEL_15:
    BOOL v14 = 0;
    goto LABEL_33;
  }
  unsigned __int8 v28 = 0;
  if ((objc_msgSend(a1, "__decodeFlags:critical:", v6, &v28) & 1) == 0)
  {
    if (a4)
    {
      [MEMORY[0x263F087E8] hmErrorWithCode:3];
      BOOL v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
    goto LABEL_15;
  }
  uint64_t v7 = [HMDNetworkRouterFirewallRule alloc];
  unint64_t v8 = [(HMDNetworkRouterFirewallRule *)v7 initWithJSONDictionary:v6 critical:v28];
  if (!v8 || (uint64_t v27 = 0, (objc_msgSend(a1, "__decodePurpose:purpose:", v6, &v27) & 1) == 0))
  {
    if (a4)
    {
      [MEMORY[0x263F087E8] hmErrorWithCode:3];
      BOOL v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v14 = 0;
    }
    goto LABEL_32;
  }
  id v9 = [v6 objectForKeyedSubscript:@"r"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v10 = v9;
  }
  else {
    unint64_t v10 = 0;
  }
  id v11 = v10;

  if (!v11)
  {
    unsigned int v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = a1;
    int v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v31 = v18;
      __int16 v32 = 2112;
      v33 = @"r";
      __int16 v34 = 2112;
      id v35 = v6;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@WAN rule contains an invalid '%@' value: %@", buf, 0x20u);
    }
    if (a4)
    {
      [MEMORY[0x263F087E8] hmErrorWithCode:3];
      BOOL v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v14 = 0;
    }
    goto LABEL_31;
  }
  id v26 = 0;
  char v12 = objc_msgSend(a1, "__decodeSubject:subject:", v11, &v26);
  id v13 = v26;
  if ((v12 & 1) == 0) {
    goto LABEL_25;
  }
  *(_WORD *)buf = 0;
  __int16 v25 = 0;
  if (v29 < 2u)
  {
    if (objc_msgSend(a1, "__decodePorts:portStart:portEnd:", v11, buf, &v25)) {
      goto LABEL_28;
    }
    goto LABEL_25;
  }
  if (v29 != 2)
  {
LABEL_28:
    id v19 = 0;
    goto LABEL_29;
  }
  id v19 = +[HMDNetworkRouterFirewallRuleICMPType createListWithJSONDictionary:v11 key:@"it"];
  if (!v19)
  {
LABEL_25:
    if (a4)
    {
      [MEMORY[0x263F087E8] hmErrorWithCode:3];
      BOOL v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v14 = 0;
    }
    goto LABEL_30;
  }
LABEL_29:
  id v20 = objc_alloc((Class)a1);
  v21 = [(HMDNetworkRouterFirewallRule *)v8 name];
  uint64_t v22 = [(HMDNetworkRouterFirewallRule *)v8 isCritical];
  WORD1(v24) = v25;
  LOWORD(v24) = *(_WORD *)buf;
  BOOL v14 = objc_msgSend(v20, "initWithJSONDictionary:name:critical:purpose:transportProtocol:subject:portStart:portEnd:icmpTypes:", v6, v21, v22, v27, v29, v13, v24, v19);

LABEL_30:
LABEL_31:

LABEL_32:
LABEL_33:

  return v14;
}

+ (BOOL)__decodePorts:(id)a3 portStart:(unsigned __int16 *)a4 portEnd:(unsigned __int16 *)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  unsigned __int16 v19 = 0;
  BOOL v9 = 0;
  if (decodePortFromJSONDictionary(v8, @"p", 1, &v19, 0))
  {
    unsigned __int16 v18 = 0;
    BOOL v17 = 0;
    BOOL v9 = 0;
    if (decodePortFromJSONDictionary(v8, @"q", 0, &v18, &v17))
    {
      unsigned __int16 v10 = v19;
      if (v17)
      {
        unsigned __int16 v10 = v18;
        if (v19 > v18)
        {
          id v11 = (void *)MEMORY[0x230FBD990]();
          id v12 = a1;
          id v13 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            BOOL v14 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v21 = v14;
            unsigned int v15 = "%{public}@Must have portStart less than or equal to portEnd";
LABEL_11:
            _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);

            goto LABEL_12;
          }
          goto LABEL_12;
        }
        if (v19 && !v18)
        {
          id v11 = (void *)MEMORY[0x230FBD990]();
          id v12 = a1;
          id v13 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            BOOL v14 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v21 = v14;
            unsigned int v15 = "%{public}@Must not have portEnd set to 0";
            goto LABEL_11;
          }
LABEL_12:

          BOOL v9 = 0;
          goto LABEL_14;
        }
      }
      *a4 = v19;
      *a5 = v10;
      BOOL v9 = 1;
    }
  }
LABEL_14:

  return v9;
}

+ (BOOL)__decodeSubject:(id)a3 subject:(id *)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"h"];
  uint64_t v8 = [v6 objectForKeyedSubscript:@"i"];
  BOOL v9 = [v6 objectForKeyedSubscript:@"j"];
  uint64_t v10 = [v6 objectForKeyedSubscript:@"is"];
  id v11 = (void *)v10;
  if (!v7 && !v8 && !v10)
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = a1;
    BOOL v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      unsigned int v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v36 = v15;
      id v16 = "%{public}@One subject must be set";
LABEL_24:
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);

      goto LABEL_25;
    }
    goto LABEL_25;
  }
  if (v8) {
    BOOL v17 = v10 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  int v18 = !v17;
  if (v8 | v10) {
    BOOL v19 = v7 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  if (!v19 || v18)
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = a1;
    BOOL v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      unsigned int v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v36 = v15;
      id v16 = "%{public}@Only one subject can be set";
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  if (v9 && !v8)
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = a1;
    BOOL v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      unsigned int v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v36 = v15;
      id v16 = "%{public}@ipAddressEnd is only valid if ipAddressStart is specified";
      goto LABEL_24;
    }
LABEL_25:

    char v20 = 0;
    goto LABEL_26;
  }
  if (v7)
  {
    char v22 = objc_msgSend(a1, "__decodeHostnames:subject:", v7, a4);
LABEL_36:
    char v20 = v22;
    goto LABEL_26;
  }
  if (v9) {
    BOOL v23 = 1;
  }
  else {
    BOOL v23 = v8 == 0;
  }
  if (v23 && !v10)
  {
    char v22 = objc_msgSend(a1, "__decodeAddressRange:endValue:subject:", v8, v9, a4);
    goto LABEL_36;
  }
  if (v8) {
    uint64_t v24 = (void *)v8;
  }
  else {
    uint64_t v24 = (void *)v10;
  }
  id v25 = v24;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v26 = v25;
  }
  else {
    id v26 = 0;
  }
  id v27 = v26;
  if (v27)
  {
    char v20 = objc_msgSend(a1, "__decodeAddresses:subject:", v27, a4);
  }
  else
  {
    id v28 = v25;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned __int8 v29 = v28;
    }
    else {
      unsigned __int8 v29 = 0;
    }
    id v30 = v29;

    if (v30)
    {
      char v20 = objc_msgSend(a1, "__decodeAddress:subject:", v30, a4);
    }
    else
    {
      context = (void *)MEMORY[0x230FBD990]();
      id v31 = a1;
      __int16 v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v36 = v33;
        __int16 v37 = 2112;
        id v38 = v28;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Invalid address value: %@", buf, 0x16u);

        id v30 = 0;
      }

      char v20 = 0;
    }

    id v27 = 0;
  }

LABEL_26:
  return v20;
}

+ (BOOL)__decodeAddressRange:(id)a3 endValue:(id)a4 subject:(id *)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = objc_msgSend(a1, "__nonWildcardAddressFrom:key:", v8, @"addressStart");
  if (v10)
  {
    id v11 = objc_msgSend(a1, "__nonWildcardAddressFrom:key:", v9, @"addressEnd");
    if (v11)
    {
      uint64_t v12 = [v10 addressFamily];
      if (v12 == [v11 addressFamily])
      {
        id v13 = [[HMDNetworkRouterFirewallRuleWANAddressRange alloc] initWithAddressStart:v10 addressEnd:v11];
        *a5 = [[HMDNetworkRouterFirewallRuleWANSubject alloc] initWithHostnames:0 addresses:0 addressRange:v13];

        BOOL v14 = 1;
LABEL_10:

        goto LABEL_11;
      }
      unsigned int v15 = (void *)MEMORY[0x230FBD990]();
      id v16 = a1;
      BOOL v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v18 = HMFGetLogIdentifier();
        int v20 = 138543362;
        v21 = v18;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@IP address range must have matching address family", (uint8_t *)&v20, 0xCu);
      }
    }
    BOOL v14 = 0;
    goto LABEL_10;
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

+ (id)__nonWildcardAddressFrom:(id)a3 key:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (!v10)
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = a1;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      BOOL v14 = HMFGetLogIdentifier();
      int v27 = 138543874;
      id v28 = v14;
      __int16 v29 = 2112;
      id v30 = v7;
      __int16 v31 = 2112;
      id v32 = v8;
      unsigned int v15 = "%{public}@WAN rule contains a non-string %@: %@";
      goto LABEL_10;
    }
LABEL_11:

    id v16 = 0;
    goto LABEL_23;
  }
  if ([v10 isEqualToString:@"*"])
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = a1;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      BOOL v14 = HMFGetLogIdentifier();
      int v27 = 138543874;
      id v28 = v14;
      __int16 v29 = 2112;
      id v30 = v7;
      __int16 v31 = 2112;
      id v32 = v10;
      unsigned int v15 = "%{public}@WAN rule contains a wildcard address for %@: %@";
LABEL_10:
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v27, 0x20u);

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  BOOL v17 = createHMFNetAddressFromIPAddressString(v10);
  if (v17)
  {
    int v18 = [a1 ipAddressAnyIPv4];
    if ([v17 isEqual:v18])
    {
    }
    else
    {
      uint64_t v24 = [a1 ipAddressAnyIPv6];
      int v25 = [v17 isEqual:v24];

      if (!v25)
      {
        id v16 = v17;
        goto LABEL_22;
      }
    }
    BOOL v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = a1;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      int v27 = 138543874;
      id v28 = v22;
      __int16 v29 = 2112;
      id v30 = v7;
      __int16 v31 = 2112;
      id v32 = v10;
      BOOL v23 = "%{public}@WAN rule contains a wildcard address for %@: %@";
      goto LABEL_20;
    }
  }
  else
  {
    BOOL v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = a1;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      int v27 = 138543874;
      id v28 = v22;
      __int16 v29 = 2112;
      id v30 = v7;
      __int16 v31 = 2112;
      id v32 = v10;
      BOOL v23 = "%{public}@WAN rule contains an invalid %@: %@";
LABEL_20:
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v27, 0x20u);
    }
  }

  id v16 = 0;
LABEL_22:

LABEL_23:
  return v16;
}

+ (BOOL)__decodeAddresses:(id)a3 subject:(id *)a4
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (![v6 count])
  {
    __int16 v31 = (void *)MEMORY[0x230FBD990]();
    id v32 = a1;
    uint64_t v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      __int16 v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v59 = v34;
      _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@WAN rule contains an empty address array", buf, 0xCu);
    }
    BOOL v35 = 0;
    goto LABEL_47;
  }
  id v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v50 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v6, "count"));
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v8 = v6;
  uint64_t v53 = [v8 countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (!v53)
  {

    goto LABEL_40;
  }
  v47 = a4;
  id v48 = v6;
  uint64_t v52 = 0;
  uint64_t v49 = 0;
  uint64_t v9 = *(void *)v55;
  id v10 = v50;
  uint64_t v51 = *(void *)v55;
  while (2)
  {
    for (uint64_t i = 0; i != v53; ++i)
    {
      if (*(void *)v55 != v9) {
        objc_enumerationMutation(v8);
      }
      id v12 = *(id *)(*((void *)&v54 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v13 = v12;
      }
      else {
        id v13 = 0;
      }
      id v14 = v13;

      if (!v14)
      {
        uint64_t v36 = (void *)MEMORY[0x230FBD990]();
        id v37 = a1;
        id v38 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          uint64_t v39 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v59 = v39;
          __int16 v60 = 2112;
          id v61 = v12;
          _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, "%{public}@WAN rule contains a non-string address: %@", buf, 0x16u);
        }
        goto LABEL_44;
      }
      if ([v14 isEqualToString:@"*"])
      {
        unsigned int v15 = [a1 ipAddressAny];
        uint64_t v52 = 0x100000001;
        goto LABEL_21;
      }
      uint64_t v16 = createHMFNetAddressFromIPAddressString(v14);
      if (!v16)
      {
        v42 = (void *)MEMORY[0x230FBD990]();
        id v43 = a1;
        v44 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          v45 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v59 = v45;
          __int16 v60 = 2112;
          id v61 = v14;
          _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_ERROR, "%{public}@WAN rule contains an invalid address: %@", buf, 0x16u);
        }

LABEL_44:
        id v6 = v48;

LABEL_45:
        BOOL v35 = 0;
        goto LABEL_46;
      }
      unsigned int v15 = (void *)v16;
      BOOL v17 = [a1 ipAddressAnyIPv4];
      char v18 = [v15 isEqual:v17];

      if (v18)
      {
        HIDWORD(v52) = 1;
      }
      else
      {
        BOOL v19 = [a1 ipAddressAnyIPv6];
        char v20 = [v15 isEqual:v19];

        if (v20)
        {
          LODWORD(v52) = 1;
        }
        else if ([v15 addressFamily] == 1)
        {
          LODWORD(v49) = 1;
        }
        else
        {
          HIDWORD(v49) |= [v15 addressFamily] == 2;
        }
      }
LABEL_21:
      if ([v10 containsObject:v15])
      {
        id v21 = v8;
        uint64_t v22 = (void *)MEMORY[0x230FBD990]();
        id v23 = a1;
        uint64_t v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v26 = int v25 = v7;
          *(_DWORD *)buf = 138543618;
          v59 = v26;
          __int16 v60 = 2112;
          id v61 = v15;
          _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@WAN rule contains a duplicate address: %@", buf, 0x16u);

          id v7 = v25;
          id v10 = v50;
        }

        id v8 = v21;
        uint64_t v9 = v51;
      }
      else
      {
        [v7 addObject:v15];
        [v10 addObject:v15];
      }
    }
    uint64_t v53 = [v8 countByEnumeratingWithState:&v54 objects:v62 count:16];
    if (v53) {
      continue;
    }
    break;
  }

  a4 = v47;
  id v6 = v48;
  if (HIDWORD(v52) & v49 & 1) != 0 || (v52 & HIDWORD(v49))
  {
    int v27 = (void *)MEMORY[0x230FBD990]();
    id v28 = a1;
    __int16 v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      id v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v59 = v30;
      __int16 v60 = 2112;
      id v61 = v8;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@WAN rule contains a mix of wildcard and non-wildcard addresses: %@", buf, 0x16u);
    }
    goto LABEL_45;
  }
LABEL_40:
  v40 = [HMDNetworkRouterFirewallRuleWANSubject alloc];
  v41 = (void *)[v7 copy];
  *a4 = [(HMDNetworkRouterFirewallRuleWANSubject *)v40 initWithHostnames:0 addresses:v41 addressRange:0];

  BOOL v35 = 1;
LABEL_46:

LABEL_47:
  return v35;
}

+ (BOOL)__decodeAddress:(id)a3 subject:(id *)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a3;
  id v8 = [v6 arrayWithObjects:&v10 count:1];

  LOBYTE(a4) = objc_msgSend(a1, "__decodeAddresses:subject:", v8, a4, v10, v11);
  return (char)a4;
}

+ (BOOL)__decodeHostnames:(id)a3 subject:(id *)a4
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  uint64_t v9 = v6;
  if (!v8)
  {
    id v102 = v6;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v102 count:1];
  }
  if (![v9 count])
  {
    uint64_t v39 = (void *)MEMORY[0x230FBD990]();
    id v40 = a1;
    v41 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v42 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v112 = (uint64_t)v42;
      _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@WAN rule contains an empty hostname array", buf, 0xCu);
    }
    BOOL v38 = 0;
    goto LABEL_57;
  }
  id v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  uint64_t v11 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v9, "count"));
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v93 objects:v101 count:16];
  if (!v13) {
    goto LABEL_41;
  }
  unint64_t v14 = 0x263F08000uLL;
  uint64_t v15 = *(void *)v94;
  v89 = v11;
  id v90 = v12;
  id v91 = a1;
  v92 = v9;
  v87 = v10;
  uint64_t v84 = *(void *)v94;
  v85 = a4;
LABEL_9:
  uint64_t v16 = 0;
  uint64_t v86 = v13;
LABEL_10:
  if (*(void *)v94 != v15) {
    objc_enumerationMutation(v12);
  }
  unint64_t v17 = v14;
  id v18 = *(id *)(*((void *)&v93 + 1) + 8 * v16);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v19 = v18;
  }
  else {
    BOOL v19 = 0;
  }
  id v20 = v19;

  if (!v20)
  {
    id v61 = (void *)MEMORY[0x230FBD990]();
    id v62 = a1;
    uint64_t v63 = HMFGetOSLogHandle();
    uint64_t v9 = v92;
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      uint64_t v64 = HMFGetLogIdentifier();
      id v65 = v18;
      v66 = (void *)v64;
      *(_DWORD *)buf = 138543618;
      uint64_t v112 = v64;
      __int16 v113 = 2112;
      id v114 = v65;
      _os_log_impl(&dword_22F52A000, v63, OS_LOG_TYPE_ERROR, "%{public}@WAN rule contains a non-string hostname: %@", buf, 0x16u);
    }
    goto LABEL_55;
  }
  v88 = v18;
  id v21 = v20;
  if (![v21 length] || (unint64_t)objc_msgSend(v21, "length") >= 0xFE)
  {
    long long v56 = (void *)MEMORY[0x230FBD990]();
    long long v57 = objc_opt_class();
    v58 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      v59 = HMFGetLogIdentifier();
      uint64_t v60 = [v21 length];
      *(_DWORD *)v103 = 138543874;
      v104 = v59;
      __int16 v105 = 2112;
      id v106 = v21;
      __int16 v107 = 2048;
      uint64_t v108 = v60;
      _os_log_impl(&dword_22F52A000, v58, OS_LOG_TYPE_INFO, "%{public}@Hostname '%@' is invalid because its length is out of bounds: %lu", v103, 0x20u);

      uint64_t v11 = v89;
    }

LABEL_61:
    uint64_t v9 = v92;
    goto LABEL_52;
  }
  id v22 = [v21 componentsSeparatedByString:@"."];
  if ((unint64_t)[v22 count] > 1)
  {
    if (validateHostNameForWANFirewallRule_onceTokenRegex != -1) {
      dispatch_once(&validateHostNameForWANFirewallRule_onceTokenRegex, &__block_literal_global_212654);
    }
    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    id v22 = v22;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v97 objects:buf count:16];
    if (!v23) {
      goto LABEL_30;
    }
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v98;
LABEL_23:
    uint64_t v26 = 0;
    while (1)
    {
      if (*(void *)v98 != v25) {
        objc_enumerationMutation(v22);
      }
      int v27 = *(void **)(*((void *)&v97 + 1) + 8 * v26);
      uint64_t v28 = [v27 length];
      if ((unint64_t)(v28 - 64) <= 0xFFFFFFFFFFFFFFC0) {
        break;
      }
      if (objc_msgSend((id)validateHostNameForWANFirewallRule_componentRegex, "numberOfMatchesInString:options:range:", v27, 0, 0, v28) != 1)
      {
        id v43 = (void *)MEMORY[0x230FBD990]();
        v44 = objc_opt_class();
        v45 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          v46 = HMFGetLogIdentifier();
          *(_DWORD *)v103 = 138543874;
          v104 = v46;
          __int16 v105 = 2112;
          id v106 = v21;
          __int16 v107 = 2112;
          uint64_t v108 = (uint64_t)v27;
          id v48 = "%{public}@Hostname '%@' component '%@' is invalid because it does not match regular expression";
          uint64_t v49 = v45;
          uint32_t v50 = 32;
LABEL_49:
          _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_INFO, v48, v103, v50);
        }
        goto LABEL_50;
      }
      if (v24 == ++v26)
      {
        uint64_t v24 = [v22 countByEnumeratingWithState:&v97 objects:buf count:16];
        id v12 = v90;
        if (v24) {
          goto LABEL_23;
        }
LABEL_30:

        __int16 v29 = objc_msgSend(v22, "objectAtIndexedSubscript:", objc_msgSend(v22, "count") - 2);
        int v30 = [v29 containsString:@"*"];

        if (v30)
        {
          v71 = (void *)MEMORY[0x230FBD990]();
          v72 = objc_opt_class();
          v73 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
          {
            v74 = HMFGetLogIdentifier();
            *(_DWORD *)v103 = 138543618;
            v104 = v74;
            __int16 v105 = 2112;
            id v106 = v21;
            _os_log_impl(&dword_22F52A000, v73, OS_LOG_TYPE_INFO, "%{public}@Hostname '%@' is invalid because its second-to-last component contains a wildcard", v103, 0x16u);
          }
          a1 = v91;
          uint64_t v9 = v92;
          goto LABEL_51;
        }
        __int16 v31 = [v22 lastObject];
        if ([v31 isEqualToString:@"local"])
        {
          v75 = (void *)MEMORY[0x230FBD990]();
          v76 = objc_opt_class();
          v77 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
          {
            v78 = HMFGetLogIdentifier();
            *(_DWORD *)v103 = 138543618;
            v104 = v78;
            __int16 v105 = 2112;
            id v106 = v21;
            _os_log_impl(&dword_22F52A000, v77, OS_LOG_TYPE_INFO, "%{public}@Hostname '%@' is invalid because its last component is 'local'", v103, 0x16u);
          }
          a1 = v91;
          uint64_t v9 = v92;
          goto LABEL_76;
        }
        a1 = v91;
        if ([v31 containsString:@"*"])
        {
          v75 = (void *)MEMORY[0x230FBD990]();
          v76 = objc_opt_class();
          v77 = HMFGetOSLogHandle();
          uint64_t v9 = v92;
          if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
          {
            v79 = HMFGetLogIdentifier();
            *(_DWORD *)v103 = 138543618;
            v104 = v79;
            __int16 v105 = 2112;
            id v106 = v21;
            _os_log_impl(&dword_22F52A000, v77, OS_LOG_TYPE_INFO, "%{public}@Hostname '%@' is invalid because its last component contains a wildcard", v103, 0x16u);

            a1 = v91;
          }
LABEL_76:

          goto LABEL_51;
        }
        id v32 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"];
        if ([v31 rangeOfCharacterFromSet:v32] == 0x7FFFFFFFFFFFFFFFLL)
        {
          v80 = (void *)MEMORY[0x230FBD990]();
          v81 = objc_opt_class();
          v82 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
          {
            v83 = HMFGetLogIdentifier();
            *(_DWORD *)v103 = 138543618;
            v104 = v83;
            __int16 v105 = 2112;
            id v106 = v21;
            _os_log_impl(&dword_22F52A000, v82, OS_LOG_TYPE_INFO, "%{public}@Hostname '%@' is invalid because its last component does not contain letters", v103, 0x16u);

            a1 = v91;
          }

          uint64_t v11 = v89;
          goto LABEL_61;
        }

        uint64_t v11 = v89;
        if ([v89 containsObject:v21])
        {
          uint64_t v33 = (void *)MEMORY[0x230FBD990]();
          id v34 = v91;
          BOOL v35 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            uint64_t v36 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v112 = (uint64_t)v36;
            __int16 v113 = 2112;
            id v114 = v21;
            _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@WAN rule contains a duplicate hostname: %@", buf, 0x16u);

            a1 = v91;
          }

          id v12 = v90;
        }
        else
        {
          [v87 addObject:v21];
          [v89 addObject:v21];
        }

        ++v16;
        a4 = v85;
        unint64_t v14 = v17;
        uint64_t v9 = v92;
        uint64_t v15 = v84;
        if (v16 == v86)
        {
          uint64_t v13 = [v12 countByEnumeratingWithState:&v93 objects:v101 count:16];
          id v10 = v87;
          if (!v13)
          {
LABEL_41:

            id v37 = [HMDNetworkRouterFirewallRuleWANSubject alloc];
            id v12 = (id)[v10 copy];
            *a4 = [(HMDNetworkRouterFirewallRuleWANSubject *)v37 initWithHostnames:v12 addresses:0 addressRange:0];
            BOOL v38 = 1;
            goto LABEL_56;
          }
          goto LABEL_9;
        }
        goto LABEL_10;
      }
    }
    id v43 = (void *)MEMORY[0x230FBD990]();
    v44 = objc_opt_class();
    v45 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      v46 = HMFGetLogIdentifier();
      uint64_t v47 = [v27 length];
      *(_DWORD *)v103 = 138544130;
      v104 = v46;
      __int16 v105 = 2112;
      id v106 = v21;
      __int16 v107 = 2112;
      uint64_t v108 = (uint64_t)v27;
      __int16 v109 = 2048;
      uint64_t v110 = v47;
      id v48 = "%{public}@Hostname '%@' component '%@' is invalid because its length is out of bounds: %lu";
      uint64_t v49 = v45;
      uint32_t v50 = 42;
      goto LABEL_49;
    }
LABEL_50:
    id v12 = v90;
    a1 = v91;
    uint64_t v9 = v92;

    goto LABEL_51;
  }
  v67 = (void *)MEMORY[0x230FBD990]();
  v68 = objc_opt_class();
  v69 = HMFGetOSLogHandle();
  uint64_t v9 = v92;
  if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
  {
    v70 = HMFGetLogIdentifier();
    *(_DWORD *)v103 = 138543874;
    v104 = v70;
    __int16 v105 = 2112;
    id v106 = v21;
    __int16 v107 = 2048;
    uint64_t v108 = 2;
    _os_log_impl(&dword_22F52A000, v69, OS_LOG_TYPE_INFO, "%{public}@Hostname '%@' is invalid because it does not contain at least %lu components", v103, 0x20u);
  }
LABEL_51:

  uint64_t v11 = v89;
LABEL_52:
  uint64_t v51 = (void *)MEMORY[0x230FBD990]();
  id v52 = a1;
  uint64_t v53 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
  {
    long long v54 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v112 = (uint64_t)v54;
    __int16 v113 = 2112;
    id v114 = v21;
    _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_ERROR, "%{public}@WAN rule contains an invalid hostname: %@", buf, 0x16u);
  }

LABEL_55:
  BOOL v38 = 0;
  id v10 = v87;
LABEL_56:

LABEL_57:
  return v38;
}

+ (BOOL)__decodeType:(id)a3 transportProtocol:(unsigned __int8 *)a4 error:(id *)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v20 = 0;
  char v9 = decodeUnsignedIntegerFromJSONDictionary(v8, @"t", 1, 0xFFuLL, &v20);
  id v10 = v20;
  uint64_t v11 = v10;
  if (v9)
  {
    int v12 = [v10 unsignedCharValue];
    switch(v12)
    {
      case 5:
        *a4 = 2;
        goto LABEL_10;
      case 2:
        BOOL v14 = 1;
        *a4 = 1;
        goto LABEL_17;
      case 1:
        *a4 = 0;
LABEL_10:
        BOOL v14 = 1;
        goto LABEL_17;
    }
    uint64_t v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = a1;
    unint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v22 = v18;
      __int16 v23 = 2112;
      uint64_t v24 = v11;
      __int16 v25 = 2112;
      id v26 = v8;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@WAN rule contains an unkown type value %@: %@", buf, 0x20u);
    }
    if (a5)
    {
      uint64_t v13 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1070];
      goto LABEL_8;
    }
LABEL_16:
    BOOL v14 = 0;
    goto LABEL_17;
  }
  if (!a5) {
    goto LABEL_16;
  }
  uint64_t v13 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
LABEL_8:
  BOOL v14 = 0;
  *a5 = v13;
LABEL_17:

  return v14;
}

+ (BOOL)__decodeFlags:(id)a3 critical:(BOOL *)a4
{
  id v9 = 0;
  int v5 = decodeUnsignedIntegerFromJSONDictionary(a3, @"f", 0, 0xFFFFFFFFuLL, &v9);
  id v6 = v9;
  id v7 = v6;
  if (v5) {
    *a4 = [v6 unsignedLongValue] & 1;
  }

  return v5;
}

+ (BOOL)__decodePurpose:(id)a3 purpose:(unint64_t *)a4
{
  id v9 = 0;
  int v5 = decodeUnsignedIntegerFromJSONDictionary(a3, @"u", 1, 0xFFFFFFFFFFFFFFFFLL, &v9);
  id v6 = v9;
  id v7 = v6;
  if (v5) {
    *a4 = [v6 unsignedLongLongValue];
  }

  return v5;
}

+ (HMFNetAddress)ipAddressAny
{
  if (ipAddressAny_onceToken != -1) {
    dispatch_once(&ipAddressAny_onceToken, &__block_literal_global_168_205365);
  }
  v2 = (void *)ipAddressAny_address;
  return (HMFNetAddress *)v2;
}

void __47__HMDNetworkRouterFirewallRuleWAN_ipAddressAny__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F425A0]) initWithHostname:@"*"];
  v1 = (void *)ipAddressAny_address;
  ipAddressAny_address = v0;
}

+ (HMFNetAddress)ipAddressAnyIPv6
{
  if (ipAddressAnyIPv6_onceToken != -1) {
    dispatch_once(&ipAddressAnyIPv6_onceToken, &__block_literal_global_165_205368);
  }
  v2 = (void *)ipAddressAnyIPv6_address;
  return (HMFNetAddress *)v2;
}

void __51__HMDNetworkRouterFirewallRuleWAN_ipAddressAnyIPv6__block_invoke()
{
  v2[0] = xmmword_2303E46F8;
  *(_OWORD *)((char *)v2 + 12) = *(long long *)((char *)&xmmword_2303E46F8 + 12);
  uint64_t v0 = [objc_alloc(MEMORY[0x263F425A0]) initWithSocketAddress:v2];
  v1 = (void *)ipAddressAnyIPv6_address;
  ipAddressAnyIPv6_address = v0;
}

+ (HMFNetAddress)ipAddressAnyIPv4
{
  if (ipAddressAnyIPv4_onceToken != -1) {
    dispatch_once(&ipAddressAnyIPv4_onceToken, &__block_literal_global_162_205370);
  }
  v2 = (void *)ipAddressAnyIPv4_address;
  return (HMFNetAddress *)v2;
}

void __51__HMDNetworkRouterFirewallRuleWAN_ipAddressAnyIPv4__block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  long long v2 = xmmword_2303E3CB0;
  uint64_t v0 = [objc_alloc(MEMORY[0x263F425A0]) initWithSocketAddress:&v2];
  v1 = (void *)ipAddressAnyIPv4_address;
  ipAddressAnyIPv4_address = v0;
}

@end