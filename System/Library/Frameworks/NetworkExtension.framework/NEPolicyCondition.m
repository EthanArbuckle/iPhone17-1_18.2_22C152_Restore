@interface NEPolicyCondition
+ (id)accountIdentifier:(id)a3;
+ (id)allInterfaces;
+ (id)allowsUnsafeSocketAccess;
+ (id)clientFlags:(unsigned int)a3;
+ (id)clientProhibitsContrained;
+ (id)clientProhibitsExpensive;
+ (id)customEntitlement:(id)a3;
+ (id)delegateIsPlatformBinary;
+ (id)domain:(id)a3;
+ (id)domainFilter:(unint64_t)a3;
+ (id)effectiveApplication:(id)a3;
+ (id)effectivePID:(int)a3;
+ (id)effectivePID:(int)a3 version:(int)a4;
+ (id)entitlement;
+ (id)fallbackTraffic;
+ (id)flowIPProtocol:(unsigned __int16)a3;
+ (id)flowLocalAddress:(id)a3 prefix:(unsigned __int8)a4;
+ (id)flowLocalAddressEmpty;
+ (id)flowLocalAddressStart:(id)a3 end:(id)a4;
+ (id)flowRemoteAddress:(id)a3 prefix:(unsigned __int8)a4;
+ (id)flowRemoteAddressEmpty;
+ (id)flowRemoteAddressStart:(id)a3 end:(id)a4;
+ (id)hasSignedResult;
+ (id)ipProtocol:(unsigned __int16)a3;
+ (id)isInbound;
+ (id)isListener;
+ (id)isLoopback;
+ (id)isSystemProxyConnection;
+ (id)localAddress:(id)a3 prefix:(unsigned __int8)a4;
+ (id)localAddressStart:(id)a3 end:(id)a4;
+ (id)localNetworks;
+ (id)localNetworksWithFlags:(unsigned __int8)a3;
+ (id)packetFilterTags:(unsigned __int16)a3;
+ (id)platformBinary;
+ (id)realApplication:(id)a3;
+ (id)realUID:(unsigned int)a3;
+ (id)remoteAddress:(id)a3 prefix:(unsigned __int8)a4;
+ (id)remoteAddressStart:(id)a3 end:(id)a4;
+ (id)requiredAgentDomain:(id)a3 agentType:(id)a4;
+ (id)schemeUsingPort:(unsigned __int16)a3;
+ (id)scopedInterface:(id)a3;
+ (id)scopedInterfaceFlags:(unsigned int)a3 eflags:(unsigned int)a4 xflags:(unsigned int)a5;
+ (id)sdkVersion:(unsigned int)a3 minSDKVersion:(unsigned int)a4 platform:(unsigned int)a5;
+ (id)signingIdentifier:(id)a3;
+ (id)trafficClassStart:(unsigned int)a3 end:(unsigned int)a4;
+ (id)uid:(unsigned int)a3;
+ (id)url:(id)a3;
+ (id)usesModernNetworkAPI;
- (BOOL)exactMatch;
- (BOOL)isNegative;
- (NEPolicyCondition)init;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (int64_t)conditionType;
- (void)setConditionType:(int64_t)a3;
- (void)setExactMatch:(BOOL)a3;
- (void)setNegative:(BOOL)a3;
@end

@implementation NEPolicyCondition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingIdentifier, 0);
  objc_storeStrong((id *)&self->_agentType, 0);
  objc_storeStrong((id *)&self->_agentDomain, 0);
  objc_storeStrong((id *)&self->_customEntitlement, 0);
  objc_storeStrong((id *)&self->_endAddress, 0);
  objc_storeStrong((id *)&self->_startAddress, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);

  objc_storeStrong((id *)&self->_applicationUUID, 0);
}

- (void)setExactMatch:(BOOL)a3
{
  self->_exactMatch = a3;
}

- (BOOL)exactMatch
{
  return self->_exactMatch;
}

- (void)setNegative:(BOOL)a3
{
  self->_negative = a3;
}

- (BOOL)isNegative
{
  return self->_negative;
}

- (void)setConditionType:(int64_t)a3
{
  self->_conditionType = a3;
}

- (int64_t)conditionType
{
  return self->_conditionType;
}

- (id)description
{
  return [(NEPolicyCondition *)self descriptionWithIndent:0 options:0];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if (self)
  {
    unint64_t v8 = self->_conditionType - 1;
    if (v8 > 0x2A) {
      v9 = @"unknown";
    }
    else {
      v9 = (__CFString *)*((void *)&off_1E59925D0 + v8);
    }
    if (self->_negative || self->_exactMatch)
    {
      v10 = (__CFString *)[(__CFString *)v9 mutableCopy];
      v9 = v10;
      v11 = "";
      v12 = "exact";
      if (self->_exactMatch)
      {
        BOOL v13 = !self->_negative;
      }
      else
      {
        v12 = "";
        BOOL v13 = 1;
      }
      v14 = ", ";
      if (v13) {
        v14 = "";
      }
      if (self->_negative) {
        v11 = "not";
      }
      [(__CFString *)v10 appendFormat:@" (%s%s%s)", v11, v14, v12];
    }
  }
  else
  {
    v9 = 0;
  }
  [v7 appendPrettyObject:v9 withName:@"condition-type" andIndent:v5 options:a4];

  [v7 appendPrettyObject:self->_applicationUUID withName:@"application-uuid" andIndent:v5 options:a4];
  [v7 appendPrettyObject:self->_startAddress withName:@"address" andIndent:v5 options:a4 | 1];
  [v7 appendPrettyObject:self->_endAddress withName:@"end-address" andIndent:v5 options:a4 | 1];
  [v7 appendPrettyObject:self->_domain withName:@"domain" andIndent:v5 options:a4 | 1];
  uint64_t domainFilter = (int)self->_domainFilter;
  if (domainFilter) {
    [v7 appendPrettyInt:domainFilter withName:@"domain-filter" andIndent:v5 options:a4];
  }
  [v7 appendPrettyObject:self->_accountIdentifier withName:@"account-identifier" andIndent:v5 options:a4];
  [v7 appendPrettyObject:self->_interfaceName withName:@"interface-name" andIndent:v5 options:a4];
  [v7 appendPrettyObject:self->_customEntitlement withName:@"custom-entitlement" andIndent:v5 options:a4];
  [v7 appendPrettyObject:self->_agentDomain withName:@"agent-domain" andIndent:v5 options:a4];
  [v7 appendPrettyObject:self->_agentType withName:@"agent-type" andIndent:v5 options:a4];
  [v7 appendPrettyObject:self->_signingIdentifier withName:@"signing-identifier" andIndent:v5 options:a4];
  if (self->_trafficClassStart || self->_trafficClassEnd)
  {
    objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:");
    [v7 appendPrettyInt:(int)self->_trafficClassEnd withName:@"traffic-class-end" andIndent:v5 options:a4];
  }
  uint64_t pid = self->_pid;
  if (pid) {
    [v7 appendPrettyInt:pid withName:@"pid" andIndent:v5 options:a4];
  }
  uint64_t pid_version = self->_pid_version;
  if (pid_version) {
    [v7 appendPrettyInt:pid_version withName:@"version" andIndent:v5 options:a4];
  }
  uint64_t uid = (int)self->_uid;
  if (uid) {
    [v7 appendPrettyInt:uid withName:@"uid" andIndent:v5 options:a4];
  }
  if (self->_ipProtocol) {
    objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:");
  }
  if (self->_prefix) {
    objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:");
  }
  uint64_t interfaceFlags = (int)self->_interfaceFlags;
  if (interfaceFlags) {
    [v7 appendPrettyHex:interfaceFlags withName:@"flags" andIndent:v5 options:a4];
  }
  uint64_t interfaceEflags = (int)self->_interfaceEflags;
  if (interfaceEflags) {
    [v7 appendPrettyHex:interfaceEflags withName:@"eflags" andIndent:v5 options:a4];
  }
  uint64_t interfaceXflags = (int)self->_interfaceXflags;
  if (interfaceXflags) {
    [v7 appendPrettyHex:interfaceXflags withName:@"flags" andIndent:v5 options:a4];
  }

  return v7;
}

- (NEPolicyCondition)init
{
  v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_error_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_ERROR, "Calling init on NEPolicyCondition is not valid", v5, 2u);
  }

  return 0;
}

+ (id)hasSignedResult
{
  v2 = [NEPolicyCondition alloc];
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)NEPolicyCondition;
    id v3 = objc_msgSendSuper2(&v5, sel_init);
  }
  else
  {
    id v3 = 0;
  }
  [v3 setConditionType:39];

  return v3;
}

+ (id)delegateIsPlatformBinary
{
  v2 = [NEPolicyCondition alloc];
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)NEPolicyCondition;
    id v3 = objc_msgSendSuper2(&v5, sel_init);
  }
  else
  {
    id v3 = 0;
  }
  [v3 setConditionType:32];

  return v3;
}

+ (id)isLoopback
{
  v2 = [NEPolicyCondition alloc];
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)NEPolicyCondition;
    id v3 = objc_msgSendSuper2(&v5, sel_init);
  }
  else
  {
    id v3 = 0;
  }
  [v3 setConditionType:31];

  return v3;
}

+ (id)flowRemoteAddressEmpty
{
  v2 = [NEPolicyCondition alloc];
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)NEPolicyCondition;
    id v3 = objc_msgSendSuper2(&v5, sel_init);
  }
  else
  {
    id v3 = 0;
  }
  [v3 setConditionType:26];

  return v3;
}

+ (id)flowLocalAddressEmpty
{
  v2 = [NEPolicyCondition alloc];
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)NEPolicyCondition;
    id v3 = objc_msgSendSuper2(&v5, sel_init);
  }
  else
  {
    id v3 = 0;
  }
  [v3 setConditionType:25];

  return v3;
}

+ (id)usesModernNetworkAPI
{
  v2 = [NEPolicyCondition alloc];
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)NEPolicyCondition;
    id v3 = objc_msgSendSuper2(&v5, sel_init);
  }
  else
  {
    id v3 = 0;
  }
  [v3 setConditionType:17];

  return v3;
}

+ (id)allowsUnsafeSocketAccess
{
  return +[NEPolicyCondition clientFlags:0x20000];
}

+ (id)isSystemProxyConnection
{
  return +[NEPolicyCondition clientFlags:0x8000];
}

+ (id)isListener
{
  return +[NEPolicyCondition clientFlags:8];
}

+ (id)isInbound
{
  return +[NEPolicyCondition clientFlags:0x4000];
}

+ (id)clientProhibitsExpensive
{
  return +[NEPolicyCondition clientFlags:4];
}

+ (id)clientProhibitsContrained
{
  return +[NEPolicyCondition clientFlags:4096];
}

+ (id)fallbackTraffic
{
  return +[NEPolicyCondition clientFlags:0x2000];
}

+ (id)signingIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)NEPolicyCondition;
    id v5 = objc_msgSendSuper2(&v8, sel_init);
    [v5 setConditionType:29];
    if (v5) {
      objc_setProperty_atomic_copy(v5, v6, v3, 160);
    }
  }
  else
  {
    [0 setConditionType:29];
    id v5 = 0;
  }

  return v5;
}

+ (id)clientFlags:(unsigned int)a3
{
  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)NEPolicyCondition;
    id v5 = objc_msgSendSuper2(&v7, sel_init);
    [v5 setConditionType:24];
    if (v5) {
      v5[14] = a3;
    }
  }
  else
  {
    [0 setConditionType:24];
    id v5 = 0;
  }

  return v5;
}

+ (id)packetFilterTags:(unsigned __int16)a3
{
  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)NEPolicyCondition;
    id v5 = objc_msgSendSuper2(&v7, sel_init);
    [v5 setConditionType:30];
    if (v5) {
      v5[7] = a3;
    }
  }
  else
  {
    [0 setConditionType:30];
    id v5 = 0;
  }

  return v5;
}

+ (id)requiredAgentDomain:(id)a3 agentType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = [NEPolicyCondition alloc];
  if (v7)
  {
    v12.receiver = v7;
    v12.super_class = (Class)NEPolicyCondition;
    id v8 = objc_msgSendSuper2(&v12, sel_init);
    [v8 setConditionType:16];
    if (v8)
    {
      objc_setProperty_atomic_copy(v8, v9, v5, 144);
      objc_setProperty_atomic_copy(v8, v10, v6, 152);
    }
  }
  else
  {
    [0 setConditionType:16];
    id v8 = 0;
  }

  return v8;
}

+ (id)sdkVersion:(unsigned int)a3 minSDKVersion:(unsigned int)a4 platform:(unsigned int)a5
{
  id v8 = [NEPolicyCondition alloc];
  if (v8)
  {
    v11.receiver = v8;
    v11.super_class = (Class)NEPolicyCondition;
    v9 = objc_msgSendSuper2(&v11, sel_init);
    [v9 setConditionType:28];
    if (v9)
    {
      v9[16] = a3;
      v9[17] = a4;
      v9[15] = a5;
    }
  }
  else
  {
    [0 setConditionType:28];
    v9 = 0;
  }

  return v9;
}

+ (id)platformBinary
{
  v2 = [NEPolicyCondition alloc];
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)NEPolicyCondition;
    id v3 = objc_msgSendSuper2(&v5, sel_init);
  }
  else
  {
    id v3 = 0;
  }
  [v3 setConditionType:27];

  return v3;
}

+ (id)customEntitlement:(id)a3
{
  id v3 = a3;
  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)NEPolicyCondition;
    id v5 = objc_msgSendSuper2(&v8, sel_init);
    [v5 setConditionType:15];
    if (v5) {
      objc_setProperty_atomic_copy(v5, v6, v3, 136);
    }
  }
  else
  {
    [0 setConditionType:15];
    id v5 = 0;
  }

  return v5;
}

+ (id)entitlement
{
  v2 = [NEPolicyCondition alloc];
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)NEPolicyCondition;
    id v3 = objc_msgSendSuper2(&v5, sel_init);
  }
  else
  {
    id v3 = 0;
  }
  [v3 setConditionType:15];

  return v3;
}

+ (id)schemeUsingPort:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)NEPolicyCondition;
    objc_super v5 = objc_msgSendSuper2(&v7, sel_init);
    [v5 setConditionType:37];
    if (v5) {
      v5[8] = __rev16(v3);
    }
  }
  else
  {
    [0 setConditionType:37];
    objc_super v5 = 0;
  }

  return v5;
}

+ (id)flowRemoteAddressStart:(id)a3 end:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = [NEPolicyCondition alloc];
  if (v7)
  {
    v12.receiver = v7;
    v12.super_class = (Class)NEPolicyCondition;
    id v8 = objc_msgSendSuper2(&v12, sel_init);
    [v8 setConditionType:23];
    if (v8)
    {
      objc_setProperty_atomic_copy(v8, v9, v5, 120);
      objc_setProperty_atomic_copy(v8, v10, v6, 128);
    }
  }
  else
  {
    [0 setConditionType:23];
    id v8 = 0;
  }

  return v8;
}

+ (id)localNetworksWithFlags:(unsigned __int8)a3
{
  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)NEPolicyCondition;
    id v5 = objc_msgSendSuper2(&v7, sel_init);
    [v5 setConditionType:18];
    if (v5) {
      v5[11] = a3;
    }
  }
  else
  {
    [0 setConditionType:18];
    id v5 = 0;
  }

  return v5;
}

+ (id)localNetworks
{
  v2 = [NEPolicyCondition alloc];
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)NEPolicyCondition;
    id v3 = objc_msgSendSuper2(&v5, sel_init);
  }
  else
  {
    id v3 = 0;
  }
  [v3 setConditionType:18];

  return v3;
}

+ (id)remoteAddressStart:(id)a3 end:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = [NEPolicyCondition alloc];
  if (v7)
  {
    v12.receiver = v7;
    v12.super_class = (Class)NEPolicyCondition;
    id v8 = objc_msgSendSuper2(&v12, sel_init);
    [v8 setConditionType:14];
    if (v8)
    {
      objc_setProperty_atomic_copy(v8, v9, v5, 120);
      objc_setProperty_atomic_copy(v8, v10, v6, 128);
    }
  }
  else
  {
    [0 setConditionType:14];
    id v8 = 0;
  }

  return v8;
}

+ (id)flowLocalAddressStart:(id)a3 end:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = [NEPolicyCondition alloc];
  if (v7)
  {
    v12.receiver = v7;
    v12.super_class = (Class)NEPolicyCondition;
    id v8 = objc_msgSendSuper2(&v12, sel_init);
    [v8 setConditionType:21];
    if (v8)
    {
      objc_setProperty_atomic_copy(v8, v9, v5, 120);
      objc_setProperty_atomic_copy(v8, v10, v6, 128);
    }
  }
  else
  {
    [0 setConditionType:21];
    id v8 = 0;
  }

  return v8;
}

+ (id)localAddressStart:(id)a3 end:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = [NEPolicyCondition alloc];
  if (v7)
  {
    v12.receiver = v7;
    v12.super_class = (Class)NEPolicyCondition;
    id v8 = objc_msgSendSuper2(&v12, sel_init);
    [v8 setConditionType:12];
    if (v8)
    {
      objc_setProperty_atomic_copy(v8, v9, v5, 120);
      objc_setProperty_atomic_copy(v8, v10, v6, 128);
    }
  }
  else
  {
    [0 setConditionType:12];
    id v8 = 0;
  }

  return v8;
}

+ (id)flowRemoteAddress:(id)a3 prefix:(unsigned __int8)a4
{
  id v5 = a3;
  id v6 = [NEPolicyCondition alloc];
  if (v6)
  {
    v10.receiver = v6;
    v10.super_class = (Class)NEPolicyCondition;
    objc_super v7 = objc_msgSendSuper2(&v10, sel_init);
    [v7 setConditionType:22];
    if (v7)
    {
      objc_setProperty_atomic_copy(v7, v8, v5, 120);
      v7[10] = a4;
    }
  }
  else
  {
    [0 setConditionType:22];
    objc_super v7 = 0;
  }

  return v7;
}

+ (id)remoteAddress:(id)a3 prefix:(unsigned __int8)a4
{
  id v5 = a3;
  id v6 = [NEPolicyCondition alloc];
  if (v6)
  {
    v10.receiver = v6;
    v10.super_class = (Class)NEPolicyCondition;
    objc_super v7 = objc_msgSendSuper2(&v10, sel_init);
    [v7 setConditionType:13];
    if (v7)
    {
      objc_setProperty_atomic_copy(v7, v8, v5, 120);
      v7[10] = a4;
    }
  }
  else
  {
    [0 setConditionType:13];
    objc_super v7 = 0;
  }

  return v7;
}

+ (id)flowLocalAddress:(id)a3 prefix:(unsigned __int8)a4
{
  id v5 = a3;
  id v6 = [NEPolicyCondition alloc];
  if (v6)
  {
    v10.receiver = v6;
    v10.super_class = (Class)NEPolicyCondition;
    objc_super v7 = objc_msgSendSuper2(&v10, sel_init);
    [v7 setConditionType:20];
    if (v7)
    {
      objc_setProperty_atomic_copy(v7, v8, v5, 120);
      v7[10] = a4;
    }
  }
  else
  {
    [0 setConditionType:20];
    objc_super v7 = 0;
  }

  return v7;
}

+ (id)localAddress:(id)a3 prefix:(unsigned __int8)a4
{
  id v5 = a3;
  id v6 = [NEPolicyCondition alloc];
  if (v6)
  {
    v10.receiver = v6;
    v10.super_class = (Class)NEPolicyCondition;
    objc_super v7 = objc_msgSendSuper2(&v10, sel_init);
    [v7 setConditionType:11];
    if (v7)
    {
      objc_setProperty_atomic_copy(v7, v8, v5, 120);
      v7[10] = a4;
    }
  }
  else
  {
    [0 setConditionType:11];
    objc_super v7 = 0;
  }

  return v7;
}

+ (id)flowIPProtocol:(unsigned __int16)a3
{
  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)NEPolicyCondition;
    id v5 = objc_msgSendSuper2(&v7, sel_init);
    [v5 setConditionType:19];
    if (v5) {
      v5[6] = a3;
    }
  }
  else
  {
    [0 setConditionType:19];
    id v5 = 0;
  }

  return v5;
}

+ (id)ipProtocol:(unsigned __int16)a3
{
  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)NEPolicyCondition;
    id v5 = objc_msgSendSuper2(&v7, sel_init);
    [v5 setConditionType:10];
    if (v5) {
      v5[6] = a3;
    }
  }
  else
  {
    [0 setConditionType:10];
    id v5 = 0;
  }

  return v5;
}

+ (id)trafficClassStart:(unsigned int)a3 end:(unsigned int)a4
{
  id v6 = [NEPolicyCondition alloc];
  if (v6)
  {
    v9.receiver = v6;
    v9.super_class = (Class)NEPolicyCondition;
    objc_super v7 = objc_msgSendSuper2(&v9, sel_init);
    [v7 setConditionType:9];
    if (v7)
    {
      v7[12] = a3;
      v7[13] = a4;
    }
  }
  else
  {
    [0 setConditionType:9];
    objc_super v7 = 0;
  }

  return v7;
}

+ (id)scopedInterfaceFlags:(unsigned int)a3 eflags:(unsigned int)a4 xflags:(unsigned int)a5
{
  id v8 = [NEPolicyCondition alloc];
  if (v8)
  {
    v11.receiver = v8;
    v11.super_class = (Class)NEPolicyCondition;
    objc_super v9 = objc_msgSendSuper2(&v11, sel_init);
    [v9 setConditionType:43];
    if (v9)
    {
      v9[9] = a3;
      v9[10] = a4;
      v9[11] = a5;
    }
  }
  else
  {
    [0 setConditionType:43];
    objc_super v9 = 0;
  }

  return v9;
}

+ (id)scopedInterface:(id)a3
{
  id v3 = a3;
  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)NEPolicyCondition;
    id v5 = objc_msgSendSuper2(&v8, sel_init);
    [v5 setConditionType:8];
    if (v5) {
      objc_setProperty_atomic_copy(v5, v6, v3, 112);
    }
  }
  else
  {
    [0 setConditionType:8];
    id v5 = 0;
  }

  return v5;
}

+ (id)allInterfaces
{
  v2 = [NEPolicyCondition alloc];
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)NEPolicyCondition;
    id v3 = objc_msgSendSuper2(&v5, sel_init);
  }
  else
  {
    id v3 = 0;
  }
  [v3 setConditionType:7];

  return v3;
}

+ (id)url:(id)a3
{
  id v3 = a3;
  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)NEPolicyCondition;
    id v5 = objc_msgSendSuper2(&v8, sel_init);
    [v5 setConditionType:42];
    if (v5) {
      objc_setProperty_atomic_copy(v5, v6, v3, 104);
    }
  }
  else
  {
    [0 setConditionType:42];
    id v5 = 0;
  }

  return v5;
}

+ (id)domainFilter:(unint64_t)a3
{
  int v3 = a3;
  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)NEPolicyCondition;
    id v5 = objc_msgSendSuper2(&v7, sel_init);
    [v5 setConditionType:38];
    if (v5) {
      v5[8] = v3;
    }
  }
  else
  {
    [0 setConditionType:38];
    id v5 = 0;
  }

  return v5;
}

+ (id)domain:(id)a3
{
  id v3 = a3;
  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)NEPolicyCondition;
    id v5 = objc_msgSendSuper2(&v8, sel_init);
    [v5 setConditionType:6];
    if (v5) {
      objc_setProperty_atomic_copy(v5, v6, v3, 96);
    }
  }
  else
  {
    [0 setConditionType:6];
    id v5 = 0;
  }

  return v5;
}

+ (id)accountIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)NEPolicyCondition;
    id v5 = objc_msgSendSuper2(&v8, sel_init);
    [v5 setConditionType:5];
    if (v5) {
      objc_setProperty_atomic_copy(v5, v6, v3, 88);
    }
  }
  else
  {
    [0 setConditionType:5];
    id v5 = 0;
  }

  return v5;
}

+ (id)realUID:(unsigned int)a3
{
  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)NEPolicyCondition;
    id v5 = objc_msgSendSuper2(&v7, sel_init);
    [v5 setConditionType:40];
    if (v5) {
      v5[7] = a3;
    }
  }
  else
  {
    [0 setConditionType:40];
    id v5 = 0;
  }

  return v5;
}

+ (id)uid:(unsigned int)a3
{
  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)NEPolicyCondition;
    id v5 = objc_msgSendSuper2(&v7, sel_init);
    [v5 setConditionType:4];
    if (v5) {
      v5[7] = a3;
    }
  }
  else
  {
    [0 setConditionType:4];
    id v5 = 0;
  }

  return v5;
}

+ (id)effectivePID:(int)a3 version:(int)a4
{
  id v6 = [NEPolicyCondition alloc];
  if (v6)
  {
    v9.receiver = v6;
    v9.super_class = (Class)NEPolicyCondition;
    objc_super v7 = objc_msgSendSuper2(&v9, sel_init);
    [v7 setConditionType:3];
    if (v7)
    {
      v7[5] = a3;
      v7[6] = a4;
    }
  }
  else
  {
    [0 setConditionType:3];
    objc_super v7 = 0;
  }

  return v7;
}

+ (id)effectivePID:(int)a3
{
  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)NEPolicyCondition;
    id v5 = objc_msgSendSuper2(&v7, sel_init);
    [v5 setConditionType:3];
    if (v5)
    {
      v5[5] = a3;
      v5[6] = 0;
    }
  }
  else
  {
    [0 setConditionType:3];
    id v5 = 0;
  }

  return v5;
}

+ (id)realApplication:(id)a3
{
  id v3 = a3;
  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)NEPolicyCondition;
    id v5 = objc_msgSendSuper2(&v8, sel_init);
    [v5 setConditionType:2];
    if (v5) {
      objc_setProperty_atomic_copy(v5, v6, v3, 80);
    }
  }
  else
  {
    [0 setConditionType:2];
    id v5 = 0;
  }

  return v5;
}

+ (id)effectiveApplication:(id)a3
{
  id v3 = a3;
  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)NEPolicyCondition;
    id v5 = objc_msgSendSuper2(&v8, sel_init);
    [v5 setConditionType:1];
    if (v5) {
      objc_setProperty_atomic_copy(v5, v6, v3, 80);
    }
  }
  else
  {
    [0 setConditionType:1];
    id v5 = 0;
  }

  return v5;
}

@end