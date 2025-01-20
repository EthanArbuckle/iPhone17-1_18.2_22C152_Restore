@interface HMDNetworkRouterFirewallRuleLAN
+ (BOOL)__decodeDirection:(id)a3 direction:(unsigned __int8 *)a4 error:(id *)a5;
+ (BOOL)__decodeFlags:(id)a3 critical:(BOOL *)a4 allowInterAccessoryConnections:(BOOL *)a5 requiredForHAPFunctionality:(BOOL *)a6 error:(id *)a7;
+ (BOOL)__decodePurpose:(id)a3 purpose:(unint64_t *)a4 error:(id *)a5;
+ (BOOL)__decodeTransportProtocolFromJSONDictionary:(id)a3 key:(id)a4 transportProtocol:(unsigned __int8 *)a5 error:(id *)a6;
+ (BOOL)__decodeType:(id)a3 type:(unsigned __int8 *)a4 error:(id *)a5;
+ (id)createWithJSONDictionary:(id)a3 error:(id *)a4;
+ (id)createWithJSONDictionary:(id)a3 name:(id)a4 critical:(BOOL)a5 purpose:(unint64_t)a6 allowInterAccessoryConnections:(BOOL)a7 direction:(unsigned __int8)a8 requiredForHAPFunctionality:(BOOL)a9 ruleDictionary:(id)a10 error:(id *)a11;
- (BOOL)areConnectionsWithOtherAccessoriesAllowed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRequiredForHAPFunctionality;
- (HMDNetworkRouterFirewallRuleLAN)initWithJSONDictionary:(id)a3 name:(id)a4 critical:(BOOL)a5 purpose:(unint64_t)a6 allowInterAccessoryConnections:(BOOL)a7 direction:(unsigned __int8)a8 requiredForHAPFunctionality:(BOOL)a9;
- (id)attributeDescriptions;
- (id)prettyJSONDictionary;
- (unint64_t)hash;
- (unint64_t)purpose;
- (unsigned)direction;
@end

@implementation HMDNetworkRouterFirewallRuleLAN

- (BOOL)isRequiredForHAPFunctionality
{
  return self->_requiredForHAPFunctionality;
}

- (unsigned)direction
{
  return self->_direction;
}

- (BOOL)areConnectionsWithOtherAccessoriesAllowed
{
  return self->_allowInterAccessoryConnections;
}

- (unint64_t)purpose
{
  return self->_purpose;
}

- (id)prettyJSONDictionary
{
  v20[2] = *MEMORY[0x263EF8340];
  int v3 = [(HMDNetworkRouterFirewallRuleLAN *)self direction];
  v4 = @"fromAccessory";
  if (v3 == 1) {
    v4 = @"toAccessory";
  }
  v18.receiver = self;
  v18.super_class = (Class)HMDNetworkRouterFirewallRuleLAN;
  v5 = v4;
  v6 = [(HMDNetworkRouterFirewallRule *)&v18 prettyJSONDictionary];
  v7 = (void *)[v6 mutableCopy];

  v19[0] = @"direction";
  v19[1] = @"purpose";
  v20[0] = v5;
  unint64_t v8 = [(HMDNetworkRouterFirewallRuleLAN *)self purpose];
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v8)
  {
    uint64_t v10 = 1;
    unint64_t v11 = v8;
    while (1)
    {
      if ((v10 & v8) != 0)
      {
        if (v10 <= 15)
        {
          v12 = @"Other";
          switch(v10)
          {
            case 1:
              goto LABEL_17;
            case 2:
              v12 = @"Local Access";
              goto LABEL_17;
            case 4:
              v12 = @"Local IoT Access";
              goto LABEL_17;
            case 8:
              v12 = @"Firmware Update";
              goto LABEL_17;
            default:
              goto LABEL_18;
          }
          goto LABEL_18;
        }
        switch(v10)
        {
          case 16:
            v12 = @"Time Synchronization";
            goto LABEL_17;
          case 32:
            v12 = @"Connectivity Checks";
            goto LABEL_17;
          case 64:
            v12 = @"Emergency Notifications";
LABEL_17:
            v11 &= ~v10;
            [v9 addObject:v12];
            break;
        }
      }
LABEL_18:
      v10 *= 2;
      if (v10 - 1 >= v8)
      {
        if (v11)
        {
          v13 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown (0x%llx)", v11, v18.receiver, v18.super_class);
          [v9 addObject:v13];
        }
        break;
      }
    }
  }
  if ([v9 count])
  {
    v14 = [v9 componentsJoinedByString:@", "];
  }
  else
  {
    v14 = @"none";
  }

  v20[1] = v14;
  v15 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];

  [v7 addEntriesFromDictionary:v15];
  if ([(HMDNetworkRouterFirewallRuleLAN *)self areConnectionsWithOtherAccessoriesAllowed])
  {
    [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"allowInterAccessoryConnections"];
  }
  if ([(HMDNetworkRouterFirewallRuleLAN *)self isRequiredForHAPFunctionality]) {
    [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"requiredForHAPFunctionality"];
  }
  v16 = (void *)[v7 copy];

  return v16;
}

- (id)attributeDescriptions
{
  v20[4] = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)HMDNetworkRouterFirewallRuleLAN;
  v17 = [(HMDNetworkRouterFirewallRule *)&v19 attributeDescriptions];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  objc_super v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HMDNetworkRouterFirewallRuleLAN purpose](self, "purpose"));
  v4 = (void *)[v3 initWithName:@"Purpose" value:v18];
  v20[0] = v4;
  id v5 = objc_alloc(MEMORY[0x263F424F8]);
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDNetworkRouterFirewallRuleLAN areConnectionsWithOtherAccessoriesAllowed](self, "areConnectionsWithOtherAccessoriesAllowed"));
  v7 = (void *)[v5 initWithName:@"AreConnectionsWithOtherAccessoriesAllowed" value:v6];
  v20[1] = v7;
  id v8 = objc_alloc(MEMORY[0x263F424F8]);
  id v9 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[HMDNetworkRouterFirewallRuleLAN direction](self, "direction"));
  uint64_t v10 = (void *)[v8 initWithName:@"Direction" value:v9];
  v20[2] = v10;
  id v11 = objc_alloc(MEMORY[0x263F424F8]);
  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDNetworkRouterFirewallRuleLAN isRequiredForHAPFunctionality](self, "isRequiredForHAPFunctionality"));
  v13 = (void *)[v11 initWithName:@"IsRequiredForHAPFunctionality" value:v12];
  void v20[3] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:4];
  v15 = [v17 arrayByAddingObjectsFromArray:v14];

  return v15;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HMDNetworkRouterFirewallRuleLAN *)self purpose];
  BOOL v4 = [(HMDNetworkRouterFirewallRuleLAN *)self areConnectionsWithOtherAccessoriesAllowed];
  uint64_t v5 = 2;
  if (!v4) {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v5 ^ v3 ^ (4 * [(HMDNetworkRouterFirewallRuleLAN *)self direction]);
  BOOL v7 = [(HMDNetworkRouterFirewallRuleLAN *)self isRequiredForHAPFunctionality];
  uint64_t v8 = 8;
  if (!v7) {
    uint64_t v8 = 0;
  }
  return v6 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (HMDNetworkRouterFirewallRuleLAN *)a3;
  if (self == v4)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HMDNetworkRouterFirewallRuleLAN;
    if ([(HMDNetworkRouterFirewallRule *)&v14 isEqual:v4])
    {
      uint64_t v5 = v4;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = 0;
      }
      BOOL v7 = v6;

      if (v7
        && (unint64_t v8 = [(HMDNetworkRouterFirewallRuleLAN *)self purpose],
            v8 == [(HMDNetworkRouterFirewallRuleLAN *)v7 purpose])
        && (BOOL v9 = [(HMDNetworkRouterFirewallRuleLAN *)self areConnectionsWithOtherAccessoriesAllowed], v9 == [(HMDNetworkRouterFirewallRuleLAN *)v7 areConnectionsWithOtherAccessoriesAllowed])&& (v10 = [(HMDNetworkRouterFirewallRuleLAN *)self direction], v10 == [(HMDNetworkRouterFirewallRuleLAN *)v7 direction]))
      {
        BOOL v11 = [(HMDNetworkRouterFirewallRuleLAN *)self isRequiredForHAPFunctionality];
        BOOL v12 = v11 ^ [(HMDNetworkRouterFirewallRuleLAN *)v7 isRequiredForHAPFunctionality] ^ 1;
      }
      else
      {
        LOBYTE(v12) = 0;
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }

  return v12;
}

- (HMDNetworkRouterFirewallRuleLAN)initWithJSONDictionary:(id)a3 name:(id)a4 critical:(BOOL)a5 purpose:(unint64_t)a6 allowInterAccessoryConnections:(BOOL)a7 direction:(unsigned __int8)a8 requiredForHAPFunctionality:(BOOL)a9
{
  v16.receiver = self;
  v16.super_class = (Class)HMDNetworkRouterFirewallRuleLAN;
  BOOL v12 = [(HMDNetworkRouterFirewallRule *)&v16 initWithJSONDictionary:a3 name:a4 critical:a5];
  v13 = v12;
  if (v12)
  {
    v12->_purpose = a6;
    v12->_allowInterAccessoryConnections = a7;
    v12->_direction = a8;
    v12->_requiredForHAPFunctionality = a9;
    objc_super v14 = v12;
  }

  return v13;
}

+ (id)createWithJSONDictionary:(id)a3 name:(id)a4 critical:(BOOL)a5 purpose:(unint64_t)a6 allowInterAccessoryConnections:(BOOL)a7 direction:(unsigned __int8)a8 requiredForHAPFunctionality:(BOOL)a9 ruleDictionary:(id)a10 error:(id *)a11
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a10;
  objc_super v16 = (void *)MEMORY[0x263EFF940];
  uint64_t v17 = *MEMORY[0x263EFF498];
  objc_super v18 = NSString;
  objc_super v19 = NSStringFromSelector(a2);
  v20 = [v18 stringWithFormat:@"You must override %@ in a subclass", v19];
  id v21 = [v16 exceptionWithName:v17 reason:v20 userInfo:0];

  objc_exception_throw(v21);
}

+ (id)createWithJSONDictionary:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  char v25 = 0;
  if (!objc_msgSend(a1, "__decodeType:type:error:", v6, &v25, a4)
    || (unsigned __int8 v24 = 0,
        __int16 v23 = 0,
        !objc_msgSend(a1, "__decodeFlags:critical:allowInterAccessoryConnections:requiredForHAPFunctionality:error:", v6, &v24, (char *)&v23 + 1, &v23, a4)))
  {
    BOOL v9 = 0;
    goto LABEL_28;
  }
  id v7 = objc_alloc((Class)[(id)objc_opt_class() superclass]);
  unint64_t v8 = (void *)[v7 initWithJSONDictionary:v6 critical:v24];
  if (!v8)
  {
    if (a4)
    {
      [MEMORY[0x263F087E8] hmErrorWithCode:3];
      BOOL v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v9 = 0;
    }
    goto LABEL_27;
  }
  uint64_t v22 = 0;
  BOOL v9 = 0;
  if (objc_msgSend(a1, "__decodePurpose:purpose:error:", v6, &v22, a4))
  {
    id v10 = [v6 objectForKeyedSubscript:@"r"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v11 = v10;
    }
    else {
      BOOL v11 = 0;
    }
    id v12 = v11;

    if (v12)
    {
      buf[0] = 0;
      if (objc_msgSend(a1, "__decodeDirection:direction:error:", v12, buf, a4))
      {
        switch(v25)
        {
          case 1:
            id v13 = HMDNetworkRouterFirewallRuleLANMulticast;
            goto LABEL_25;
          case 2:
            id v13 = HMDNetworkRouterFirewallRuleLANStatic;
            goto LABEL_25;
          case 3:
            id v13 = HMDNetworkRouterFirewallRuleLANDynamic;
LABEL_25:
            objc_super v18 = [v8 name];
            uint64_t v19 = [v8 isCritical];
            LOBYTE(v21) = v23;
            BOOL v9 = [(__objc2_class *)v13 createWithJSONDictionary:v6 name:v18 critical:v19 purpose:v22 allowInterAccessoryConnections:HIBYTE(v23) direction:buf[0] requiredForHAPFunctionality:v21 ruleDictionary:v12 error:a4];

            goto LABEL_26;
        }
      }
    }
    else
    {
      id v14 = (void *)MEMORY[0x230FBD990]();
      id v15 = a1;
      objc_super v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v27 = v17;
        __int16 v28 = 2112;
        v29 = @"r";
        __int16 v30 = 2112;
        id v31 = v6;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Rule contains an invalid '%@' value: %@", buf, 0x20u);
      }
      if (a4)
      {
        [MEMORY[0x263F087E8] hmErrorWithCode:3];
        BOOL v9 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

        goto LABEL_27;
      }
    }
    BOOL v9 = 0;
    goto LABEL_26;
  }
LABEL_27:

LABEL_28:
  return v9;
}

+ (BOOL)__decodeTransportProtocolFromJSONDictionary:(id)a3 key:(id)a4 transportProtocol:(unsigned __int8 *)a5 error:(id *)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v23 = 0;
  char v12 = decodeUnsignedIntegerFromJSONDictionary(v10, v11, 1, 0xFFuLL, &v23);
  id v13 = v23;
  id v14 = v13;
  if (v12)
  {
    int v15 = [v13 unsignedCharValue];
    switch(v15)
    {
      case 2:
        *a5 = 2;
        goto LABEL_10;
      case 1:
        BOOL v17 = 1;
        *a5 = 1;
        goto LABEL_17;
      case 0:
        *a5 = 0;
LABEL_10:
        BOOL v17 = 1;
        goto LABEL_17;
    }
    objc_super v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = a1;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      char v25 = v21;
      __int16 v26 = 2112;
      id v27 = v11;
      __int16 v28 = 2112;
      v29 = v14;
      __int16 v30 = 2112;
      id v31 = v10;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Rule contains an unknown '%@' value %@: %@", buf, 0x2Au);
    }
    if (a6)
    {
      objc_super v16 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1070];
      goto LABEL_8;
    }
LABEL_16:
    BOOL v17 = 0;
    goto LABEL_17;
  }
  if (!a6) {
    goto LABEL_16;
  }
  objc_super v16 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
LABEL_8:
  BOOL v17 = 0;
  *a6 = v16;
LABEL_17:

  return v17;
}

+ (BOOL)__decodeDirection:(id)a3 direction:(unsigned __int8 *)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v20 = 0;
  char v9 = decodeUnsignedIntegerFromJSONDictionary(v8, @"d", 1, 0xFFuLL, &v20);
  id v10 = v20;
  id v11 = v10;
  if ((v9 & 1) == 0)
  {
    if (a5)
    {
      id v14 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
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
  if (!v12)
  {
    *a4 = 0;
    BOOL v13 = 1;
    goto LABEL_14;
  }
  if (v12 != 1)
  {
    int v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = a1;
    BOOL v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_super v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      uint64_t v22 = v18;
      __int16 v23 = 2112;
      unsigned __int8 v24 = @"d";
      __int16 v25 = 2112;
      __int16 v26 = v11;
      __int16 v27 = 2112;
      id v28 = v8;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Rule contains an unknown '%@' value %@: %@", buf, 0x2Au);
    }
    if (a5)
    {
      id v14 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1070];
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  BOOL v13 = 1;
  *a4 = 1;
LABEL_14:

  return v13;
}

+ (BOOL)__decodeType:(id)a3 type:(unsigned __int8 *)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v20 = 0;
  char v9 = decodeUnsignedIntegerFromJSONDictionary(v8, @"t", 1, 0xFFuLL, &v20);
  id v10 = v20;
  id v11 = v10;
  if ((v9 & 1) == 0)
  {
    if (a5)
    {
      id v14 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
LABEL_10:
      BOOL v13 = 0;
      *a5 = v14;
      goto LABEL_12;
    }
LABEL_11:
    BOOL v13 = 0;
    goto LABEL_12;
  }
  int v12 = [v10 unsignedCharValue];
  if ((v12 - 1) > 2)
  {
    int v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = a1;
    BOOL v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_super v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      uint64_t v22 = v18;
      __int16 v23 = 2112;
      unsigned __int8 v24 = @"t";
      __int16 v25 = 2112;
      __int16 v26 = v11;
      __int16 v27 = 2112;
      id v28 = v8;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Rule contains an unknown '%@' value %@: %@", buf, 0x2Au);
    }
    if (a5)
    {
      id v14 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1070];
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  *a4 = v12;
  BOOL v13 = 1;
LABEL_12:

  return v13;
}

+ (BOOL)__decodeFlags:(id)a3 critical:(BOOL *)a4 allowInterAccessoryConnections:(BOOL *)a5 requiredForHAPFunctionality:(BOOL *)a6 error:(id *)a7
{
  id v16 = 0;
  char v11 = decodeUnsignedIntegerFromJSONDictionary(a3, @"f", 0, 0xFFFFFFFFuLL, &v16);
  id v12 = v16;
  BOOL v13 = v12;
  if (v11)
  {
    char v14 = [v12 unsignedLongValue];
    *a4 = v14 & 1;
    *a5 = (v14 & 2) != 0;
    *a6 = (v14 & 4) != 0;
  }
  else if (a7)
  {
    *a7 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
  }

  return v11;
}

+ (BOOL)__decodePurpose:(id)a3 purpose:(unint64_t *)a4 error:(id *)a5
{
  id v11 = 0;
  char v7 = decodeUnsignedIntegerFromJSONDictionary(a3, @"u", 1, 0xFFFFFFFFFFFFFFFFLL, &v11);
  id v8 = v11;
  char v9 = v8;
  if (v7)
  {
    *a4 = [v8 unsignedLongLongValue];
  }
  else if (a5)
  {
    *a5 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
  }

  return v7;
}

@end