@interface NWPath
+ (NWPath)pathWithProtocolBufferData:(id)a3;
+ (id)allClientIDs;
+ (id)createStringFromStatus:(int64_t)a3;
+ (id)pathForClientID:(id)a3;
+ (id)pathForClientID:(id)a3 parametersTLV:(id)a4 pathResultTLV:(id)a5;
- (BOOL)fallbackEligible;
- (BOOL)fallbackIsPreferred;
- (BOOL)fallbackIsWeak;
- (BOOL)hasAdvertiseDescriptor;
- (BOOL)hasApplicationLevelFirewall;
- (BOOL)hasBrowseDescriptor;
- (BOOL)hasCustomPFRules;
- (BOOL)hasKernelExtensionFilter;
- (BOOL)hasParentalControls;
- (BOOL)hasProxySettings;
- (BOOL)hasUnsatisfiedFallbackAgent;
- (BOOL)isConstrained;
- (BOOL)isDirect;
- (BOOL)isEligibleForCrazyIvan46;
- (BOOL)isEqualToPath:(NWPath *)path;
- (BOOL)isExpensive;
- (BOOL)isFiltered;
- (BOOL)isFlowDivert;
- (BOOL)isLinkQualityAbort;
- (BOOL)isListener;
- (BOOL)isListenerInterfaceSpecific;
- (BOOL)isLocal;
- (BOOL)isPerAppVPN;
- (BOOL)isRoaming;
- (BOOL)isUltraConstrained;
- (BOOL)isViable;
- (BOOL)shouldProbeConnectivity;
- (BOOL)supportsDNS;
- (BOOL)supportsIPv4;
- (BOOL)supportsIPv6;
- (BOOL)unsatisfiedVoluntaryAgentMatchesAddress:(id)a3 triggerImmediately:(BOOL *)a4;
- (BOOL)usesInterfaceType:(int64_t)a3;
- (BOOL)usesNetworkAgent:(id)a3;
- (BOOL)usesNetworkAgentType:(Class)a3;
- (NSArray)dnsSearchDomains;
- (NSArray)dnsServers;
- (NSArray)dnsServersAsStrings;
- (NSArray)flows;
- (NSArray)gateways;
- (NSArray)groupMembers;
- (NSArray)overrideDNSSearchDomains;
- (NSArray)overrideDNSServers;
- (NSArray)overrideDNSServersAsStrings;
- (NSArray)proxySettings;
- (NSString)privateDescription;
- (NSString)reasonDescription;
- (NSString)statusAsString;
- (NSUUID)clientID;
- (NWAdvertiseDescriptor)advertiseDescriptor;
- (NWBrowseDescriptor)browseDescriptor;
- (NWEndpoint)effectiveLocalEndpoint;
- (NWEndpoint)effectiveRemoteEndpoint;
- (NWEndpoint)endpoint;
- (NWInterface)connectedInterface;
- (NWInterface)fallbackInterface;
- (NWInterface)interface;
- (NWInterface)scopedInterface;
- (NWParameters)derivedParameters;
- (NWParameters)parameters;
- (NWPath)init;
- (NWPath)initWithPath:(id)a3;
- (NWPathStatus)status;
- (OS_nw_path)internalPath;
- (id)copyDNSSearchDomains:(BOOL)a3;
- (id)copyDNSServerEndpoints:(BOOL)a3;
- (id)copyDNSServersStrings:(id)a3;
- (id)copyDataFromNetworkAgentWithDomain:(id)a3 type:(id)a4;
- (id)copyFlowDivertToken;
- (id)createProtocolBufferObject;
- (id)delegateInterface;
- (id)description;
- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4;
- (id)genericNetworkAgentsWithDomain:(id)a3 type:(id)a4;
- (id)inactiveNetworkAgentUUIDsOnlyVoluntary:(BOOL)a3;
- (id)networkAgentsOfType:(Class)a3;
- (int)dnsServiceID;
- (int64_t)maximumDatagramSize;
- (int64_t)mtu;
- (int64_t)reason;
- (unint64_t)secondsSinceInterfaceChange;
- (unsigned)fallbackInterfaceIndex;
- (unsigned)filterControlUnit;
- (unsigned)flowDivertAggregateUnit;
- (unsigned)flowDivertControlUnit;
- (unsigned)policyID;
@end

@implementation NWPath

- (BOOL)isExpensive
{
  v2 = [(NWPath *)self internalPath];
  BOOL is_expensive = nw_path_is_expensive(v2);

  return is_expensive;
}

- (BOOL)isConstrained
{
  v2 = [(NWPath *)self internalPath];
  BOOL is_constrained = nw_path_is_constrained(v2);

  return is_constrained;
}

- (BOOL)usesInterfaceType:(int64_t)a3
{
  nw_interface_type_t v3 = a3;
  v4 = [(NWPath *)self internalPath];
  LOBYTE(v3) = nw_path_uses_interface_type(v4, v3);

  return v3;
}

- (NWPathStatus)status
{
  v2 = [(NWPath *)self internalPath];
  NWPathStatus status = (unint64_t)nw_path_get_status(v2);

  return status;
}

- (OS_nw_path)internalPath
{
  return (OS_nw_path *)objc_getProperty(self, a2, 8, 1);
}

- (NWInterface)interface
{
  uint64_t v3 = [(NWPath *)self internalPath];
  if (v3 && (v4 = (void *)v3, id v5 = *(id *)(v3 + 96), v4, v5))
  {
    v6 = [[NWInterface alloc] initWithInterface:v5];
  }
  else
  {
    v7 = [(NWPath *)self internalPath];
    unsigned int interface_index = nw_path_get_interface_index(v7);

    if (interface_index)
    {
      v6 = [[NWInterface alloc] initWithInterfaceIndex:interface_index];
      id v5 = 0;
    }
    else
    {
      id v5 = 0;
      v6 = 0;
    }
  }

  return v6;
}

- (NWPath)initWithPath:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v23.receiver = self;
    v23.super_class = (Class)NWPath;
    v6 = [(NWPath *)&v23 init];
    if (v6)
    {
      v7 = v6;
      objc_storeStrong((id *)&v6->_internalPath, a3);
      goto LABEL_4;
    }
    v14 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v27 = "-[NWPath initWithPath:]";
    v15 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v24 = 0;
    if (!__nwlog_fault(v15, &type, &v24)) {
      goto LABEL_38;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      v16 = __nwlog_obj();
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWPath initWithPath:]";
        v18 = "%{public}s [super init] failed";
LABEL_36:
        _os_log_impl(&dword_1830D4000, v16, v17, v18, buf, 0xCu);
      }
    }
    else if (v24)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      v16 = __nwlog_obj();
      os_log_type_t v17 = type;
      BOOL v22 = os_log_type_enabled(v16, type);
      if (backtrace_string)
      {
        if (v22)
        {
          *(_DWORD *)buf = 136446466;
          v27 = "-[NWPath initWithPath:]";
          __int16 v28 = 2082;
          v29 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v16, v17, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_38;
      }
      if (v22)
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWPath initWithPath:]";
        v18 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_36;
      }
    }
    else
    {
      v16 = __nwlog_obj();
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWPath initWithPath:]";
        v18 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_36;
      }
    }

LABEL_38:
    if (v15) {
      free(v15);
    }
    v7 = 0;
    goto LABEL_4;
  }
  v9 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v27 = "-[NWPath initWithPath:]";
  v10 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v24 = 0;
  if (__nwlog_fault(v10, &type, &v24))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v11 = __nwlog_obj();
      os_log_type_t v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWPath initWithPath:]";
        v13 = "%{public}s called with null path";
LABEL_29:
        _os_log_impl(&dword_1830D4000, v11, v12, v13, buf, 0xCu);
      }
    }
    else
    {
      if (v24)
      {
        v19 = (char *)__nw_create_backtrace_string();
        v11 = __nwlog_obj();
        os_log_type_t v12 = type;
        BOOL v20 = os_log_type_enabled(v11, type);
        if (v19)
        {
          if (v20)
          {
            *(_DWORD *)buf = 136446466;
            v27 = "-[NWPath initWithPath:]";
            __int16 v28 = 2082;
            v29 = v19;
            _os_log_impl(&dword_1830D4000, v11, v12, "%{public}s called with null path, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v19);
          goto LABEL_31;
        }
        if (!v20) {
          goto LABEL_30;
        }
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWPath initWithPath:]";
        v13 = "%{public}s called with null path, no backtrace";
        goto LABEL_29;
      }
      v11 = __nwlog_obj();
      os_log_type_t v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWPath initWithPath:]";
        v13 = "%{public}s called with null path, backtrace limit exceeded";
        goto LABEL_29;
      }
    }
LABEL_30:
  }
LABEL_31:
  if (v10) {
    free(v10);
  }

  v7 = 0;
LABEL_4:

  return v7;
}

- (void).cxx_destruct
{
}

- (id)createProtocolBufferObject
{
  uint64_t v3 = objc_alloc_init(NWPBPath);
  v4 = [(NWPath *)self endpoint];
  id v5 = (void *)[v4 createProtocolBufferObject];
  if (v3) {
    objc_storeStrong((id *)&v3->_endpoint, v5);
  }

  v6 = [(NWPath *)self parameters];
  v7 = (void *)[v6 createProtocolBufferObject];
  if (v3) {
    objc_storeStrong((id *)&v3->_parameters, v7);
  }

  int v8 = [(NWPath *)self status];
  if (v3)
  {
    *(unsigned char *)&v3->_has |= 1u;
    v3->_NWPathStatus status = v8;
  }
  v9 = [(NWPath *)self clientID];
  v10 = [v9 UUIDString];
  if (v3) {
    objc_storeStrong((id *)&v3->_clientUUID, v10);
  }

  v11 = [(NWPath *)self interface];
  os_log_type_t v12 = (void *)[v11 createProtocolBufferObject];
  if (v3) {
    objc_storeStrong((id *)&v3->_directInterface, v12);
  }

  v13 = [(NWPath *)self delegateInterface];
  v14 = (void *)[v13 createProtocolBufferObject];
  if (v3) {
    objc_storeStrong((id *)&v3->_delegateInterface, v14);
  }

  BOOL v15 = [(NWPath *)self isDirect];
  if (v3)
  {
    *(unsigned char *)&v3->_has |= 2u;
    v3->_direct = v15;
    BOOL v16 = [(NWPath *)self isLocal];
    *(unsigned char *)&v3->_has |= 0x10u;
    v3->_local = v16;
    BOOL v17 = [(NWPath *)self supportsIPv4];
    *(unsigned char *)&v3->_has |= 4u;
    v3->_ipv4 = v17;
    BOOL v18 = [(NWPath *)self supportsIPv6];
    *(unsigned char *)&v3->_has |= 8u;
    v3->_ipv6 = v18;
  }
  else
  {
    [(NWPath *)self isLocal];
    [(NWPath *)self supportsIPv4];
    [(NWPath *)self supportsIPv6];
  }
  return v3;
}

- (BOOL)isEligibleForCrazyIvan46
{
  v2 = [(NWPath *)self internalPath];
  char is_eligible_for_CrazyIvan46 = nw_path_is_eligible_for_CrazyIvan46(v2);

  return is_eligible_for_CrazyIvan46;
}

- (BOOL)supportsDNS
{
  v2 = [(NWPath *)self internalPath];
  BOOL has_dns = nw_path_has_dns(v2);

  return has_dns;
}

- (BOOL)supportsIPv6
{
  v2 = [(NWPath *)self internalPath];
  BOOL has_ipv6 = nw_path_has_ipv6(v2);

  return has_ipv6;
}

- (BOOL)supportsIPv4
{
  v2 = [(NWPath *)self internalPath];
  BOOL has_ipv4 = nw_path_has_ipv4(v2);

  return has_ipv4;
}

- (BOOL)hasProxySettings
{
  v2 = [(NWPath *)self internalPath];
  BOOL has_proxy_settings = nw_path_has_proxy_settings(v2);

  return has_proxy_settings;
}

- (NSArray)proxySettings
{
  v2 = [(NWPath *)self internalPath];
  id v3 = nw_path_copy_legacy_proxy_settings(v2);

  if (v3 && object_getClass(v3) == (Class)MEMORY[0x1E4F14568]) {
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  }
  else {
    v4 = 0;
  }

  return (NSArray *)v4;
}

- (BOOL)fallbackIsPreferred
{
  v2 = [(NWPath *)self internalPath];
  char is_preferred = nw_path_fallback_is_preferred(v2);

  return is_preferred;
}

- (BOOL)fallbackEligible
{
  v2 = [(NWPath *)self internalPath];
  BOOL should_fallback = nw_path_should_fallback(v2, 0);

  return should_fallback;
}

- (BOOL)fallbackIsWeak
{
  v2 = [(NWPath *)self internalPath];
  char is_weak = nw_path_fallback_is_weak(v2);

  return is_weak;
}

- (unsigned)fallbackInterfaceIndex
{
  v2 = [(NWPath *)self internalPath];
  fallback_unsigned int interface_index = nw_path_get_fallback_interface_index((uint64_t)v2);

  return fallback_interface_index;
}

- (NWParameters)derivedParameters
{
  id v3 = [NWParameters alloc];
  v4 = [(NWPath *)self internalPath];
  BOOL v5 = nw_path_copy_derived_parameters(v4);
  v6 = [(NWParameters *)v3 initWithParameters:v5];

  return v6;
}

- (NWAdvertiseDescriptor)advertiseDescriptor
{
  v2 = [(NWPath *)self internalPath];
  id v3 = nw_path_copy_advertise_descriptor(v2);

  if (v3) {
    v4 = [[NWAdvertiseDescriptor alloc] initWithDescriptor:v3];
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasAdvertiseDescriptor
{
  v2 = [(NWPath *)self internalPath];
  BOOL has_advertise_descriptor = nw_path_has_advertise_descriptor(v2);

  return has_advertise_descriptor;
}

- (NWBrowseDescriptor)browseDescriptor
{
  v2 = [(NWPath *)self internalPath];
  id v3 = nw_path_copy_browse_descriptor(v2);

  if (v3)
  {
    v4 = +[NWBrowseDescriptor descriptorWithInternalDescriptor:v3];
  }
  else
  {
    v4 = 0;
  }

  return (NWBrowseDescriptor *)v4;
}

- (BOOL)hasBrowseDescriptor
{
  v2 = [(NWPath *)self internalPath];
  BOOL has_browse_descriptor = nw_path_has_browse_descriptor(v2);

  return has_browse_descriptor;
}

- (NWInterface)connectedInterface
{
  v2 = [(NWPath *)self internalPath];
  id v3 = nw_path_copy_connected_interface(v2);

  if (v3) {
    v4 = [[NWInterface alloc] initWithInterface:v3];
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (NWEndpoint)effectiveRemoteEndpoint
{
  v2 = [(NWPath *)self internalPath];
  nw_endpoint_t v3 = nw_path_copy_effective_remote_endpoint(v2);

  if (v3)
  {
    v4 = +[NWEndpoint endpointWithInternalEndpoint:v3];
  }
  else
  {
    v4 = 0;
  }

  return (NWEndpoint *)v4;
}

- (NWEndpoint)effectiveLocalEndpoint
{
  v2 = [(NWPath *)self internalPath];
  nw_endpoint_t v3 = nw_path_copy_effective_local_endpoint(v2);

  if (v3)
  {
    v4 = +[NWEndpoint endpointWithInternalEndpoint:v3];
  }
  else
  {
    v4 = 0;
  }

  return (NWEndpoint *)v4;
}

- (NWEndpoint)endpoint
{
  v2 = [(NWPath *)self internalPath];
  id v3 = nw_path_copy_endpoint(v2);

  if (v3)
  {
    v4 = +[NWEndpoint endpointWithInternalEndpoint:v3];
  }
  else
  {
    v4 = 0;
  }

  return (NWEndpoint *)v4;
}

- (NWParameters)parameters
{
  id v3 = [NWParameters alloc];
  v4 = [(NWPath *)self internalPath];
  id v5 = nw_path_copy_parameters(v4);
  v6 = [(NWParameters *)v3 initWithParameters:v5];

  return v6;
}

- (BOOL)isRoaming
{
  v2 = [(NWPath *)self internalPath];
  BOOL is_roaming = nw_path_is_roaming(v2);

  return is_roaming;
}

- (unsigned)policyID
{
  v2 = [(NWPath *)self internalPath];
  if (v2) {
    unsigned int v3 = v2[85];
  }
  else {
    unsigned int v3 = 0;
  }

  return v3;
}

- (BOOL)isDirect
{
  v2 = [(NWPath *)self internalPath];
  char is_direct = nw_path_is_direct(v2);

  return is_direct;
}

- (BOOL)isLocal
{
  v2 = [(NWPath *)self internalPath];
  char is_local = nw_path_is_local(v2);

  return is_local;
}

- (unsigned)filterControlUnit
{
  v2 = [(NWPath *)self internalPath];
  if (v2) {
    unsigned int v3 = v2[68];
  }
  else {
    unsigned int v3 = 0;
  }

  return v3;
}

- (BOOL)isFiltered
{
  v2 = [(NWPath *)self internalPath];
  if (v2) {
    BOOL v3 = v2[68] != 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (int)dnsServiceID
{
  v2 = [(NWPath *)self internalPath];
  int dns_service_id = nw_path_get_dns_service_id(v2, 1);

  return dns_service_id;
}

- (BOOL)hasUnsatisfiedFallbackAgent
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = [(NWPath *)self internalPath];
  int v5 = 0;
  memset(v6, 0, sizeof(v6));
  BOOL vpn_config_uuid = nw_path_get_vpn_config_uuid(v2, (unsigned __int8 (*)[16])v6, &v5, 1, 1);

  return vpn_config_uuid;
}

- (BOOL)unsatisfiedVoluntaryAgentMatchesAddress:(id)a3 triggerImmediately:(BOOL *)a4
{
  id v5 = a3;
  v6 = [(NWPath *)self internalPath];
  uint64_t v7 = [v5 address];

  char v8 = nw_path_voluntary_agent_matches_address(v6, v7);
  return v8;
}

- (id)copyFlowDivertToken
{
  v2 = [(NWPath *)self internalPath];
  BOOL v3 = (void *)nw_path_copy_flow_divert_token(v2);

  return v3;
}

- (unsigned)flowDivertAggregateUnit
{
  v2 = [(NWPath *)self internalPath];
  if (v2) {
    unsigned int v3 = v2[88];
  }
  else {
    unsigned int v3 = 0;
  }

  return v3;
}

- (unsigned)flowDivertControlUnit
{
  v2 = [(NWPath *)self internalPath];
  unsigned int v3 = v2;
  if (v2 && v2[66] == 4) {
    unsigned int v4 = v2[67];
  }
  else {
    unsigned int v4 = 0;
  }

  return v4;
}

- (BOOL)isFlowDivert
{
  v2 = [(NWPath *)self internalPath];
  unsigned int v3 = v2;
  if (v2)
  {
    if (v2[88]) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = v2[66] == 4;
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (NSString)reasonDescription
{
  v2 = [(NWPath *)self internalPath];
  uint64_t reason_description = nw_path_get_reason_description(v2);

  if (reason_description)
  {
    BOOL v4 = [NSString stringWithUTF8String:reason_description];
  }
  else
  {
    BOOL v4 = &stru_1ECF695B0;
  }

  return (NSString *)v4;
}

- (int64_t)reason
{
  v2 = [(NWPath *)self internalPath];
  int64_t reason = nw_path_get_reason(v2);

  return reason;
}

- (unint64_t)secondsSinceInterfaceChange
{
  v2 = [(NWPath *)self internalPath];
  unint64_t interface_time_delta = nw_path_get_interface_time_delta(v2);

  return interface_time_delta;
}

- (int64_t)maximumDatagramSize
{
  v2 = [(NWPath *)self internalPath];
  int64_t maximum_datagram_size = nw_path_get_maximum_datagram_size(v2);

  return maximum_datagram_size;
}

- (int64_t)mtu
{
  v2 = [(NWPath *)self internalPath];
  int64_t mtu = (int)nw_path_get_mtu(v2);

  return mtu;
}

- (NSArray)groupMembers
{
  v2 = [(NWPath *)self internalPath];
  unsigned int v3 = (atomic_uchar *)nw_path_copy_group_members(v2);

  if (!v3 || *((void *)v3 + 3) == *((void *)v3 + 2))
  {
    id v5 = 0;
  }
  else
  {
    BOOL v4 = [MEMORY[0x1E4F1CA48] array];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __22__NWPath_groupMembers__block_invoke;
    v7[3] = &unk_1E524AE18;
    id v5 = v4;
    id v8 = v5;
    nw_array_apply(v3, (uint64_t)v7);
  }

  return (NSArray *)v5;
}

uint64_t __22__NWPath_groupMembers__block_invoke(uint64_t a1)
{
  v2 = +[NWEndpoint endpointWithInternalEndpoint:](NWEndpoint, "endpointWithInternalEndpoint:");
  if (v2) {
    [*(id *)(a1 + 32) addObject:v2];
  }

  return 1;
}

- (NSArray)gateways
{
  v2 = [(NWPath *)self internalPath];
  unsigned int v3 = (atomic_uchar *)nw_path_copy_gateways(v2);

  if (!v3 || *((void *)v3 + 3) == *((void *)v3 + 2))
  {
    id v5 = 0;
  }
  else
  {
    BOOL v4 = [MEMORY[0x1E4F1CA48] array];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __18__NWPath_gateways__block_invoke;
    v7[3] = &unk_1E524AE18;
    id v5 = v4;
    id v8 = v5;
    nw_array_apply(v3, (uint64_t)v7);
  }

  return (NSArray *)v5;
}

uint64_t __18__NWPath_gateways__block_invoke(uint64_t a1)
{
  v2 = +[NWEndpoint endpointWithInternalEndpoint:](NWEndpoint, "endpointWithInternalEndpoint:");
  if (v2) {
    [*(id *)(a1 + 32) addObject:v2];
  }

  return 1;
}

- (NSArray)overrideDNSSearchDomains
{
  id v2 = [(NWPath *)self copyDNSSearchDomains:1];

  return (NSArray *)v2;
}

- (NSArray)dnsSearchDomains
{
  id v2 = [(NWPath *)self copyDNSSearchDomains:0];

  return (NSArray *)v2;
}

- (id)copyDNSSearchDomains:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [(NWPath *)self internalPath];
  id v5 = v4;
  if (v3) {
    v6 = (atomic_uchar *)nw_path_copy_override_resolver_configs(v4);
  }
  else {
    v6 = (atomic_uchar *)nw_path_copy_resolver_configs(v4);
  }
  uint64_t v7 = v6;

  if (!v7 || *((void *)v7 + 3) == *((void *)v7 + 2))
  {
    id v9 = 0;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA48] array];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __31__NWPath_copyDNSSearchDomains___block_invoke;
    v11[3] = &unk_1E524AE18;
    id v9 = v8;
    id v12 = v9;
    nw_array_apply(v7, (uint64_t)v11);
  }
  return v9;
}

uint64_t __31__NWPath_copyDNSSearchDomains___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__NWPath_copyDNSSearchDomains___block_invoke_2;
  v5[3] = &unk_1E5248CA0;
  id v6 = *(id *)(a1 + 32);
  nw_resolver_config_enumerate_search_domains(a3, v5);

  return 1;
}

uint64_t __31__NWPath_copyDNSSearchDomains___block_invoke_2(uint64_t a1, uint64_t a2)
{
  BOOL v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", a2);
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return 1;
}

- (NSArray)overrideDNSServersAsStrings
{
  BOOL v3 = [(NWPath *)self overrideDNSServers];
  id v4 = [(NWPath *)self copyDNSServersStrings:v3];

  return (NSArray *)v4;
}

- (NSArray)overrideDNSServers
{
  id v2 = [(NWPath *)self copyDNSServerEndpoints:1];

  return (NSArray *)v2;
}

- (NSArray)dnsServersAsStrings
{
  BOOL v3 = [(NWPath *)self dnsServers];
  id v4 = [(NWPath *)self copyDNSServersStrings:v3];

  return (NSArray *)v4;
}

- (NSArray)dnsServers
{
  id v2 = [(NWPath *)self copyDNSServerEndpoints:0];

  return (NSArray *)v2;
}

- (id)copyDNSServersStrings:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "addressStringNoPort", (void)v12);
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)copyDNSServerEndpoints:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NWPath *)self internalPath];
  id v5 = v4;
  if (v3) {
    uint64_t v6 = (atomic_uchar *)nw_path_copy_override_resolver_configs(v4);
  }
  else {
    uint64_t v6 = (atomic_uchar *)nw_path_copy_resolver_configs(v4);
  }
  uint64_t v7 = v6;

  if (!v7 || *((void *)v7 + 3) == *((void *)v7 + 2))
  {
    id v9 = 0;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __33__NWPath_copyDNSServerEndpoints___block_invoke;
    v11[3] = &unk_1E524AE18;
    id v9 = v8;
    id v12 = v9;
    nw_array_apply(v7, (uint64_t)v11);
  }
  return v9;
}

uint64_t __33__NWPath_copyDNSServerEndpoints___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__NWPath_copyDNSServerEndpoints___block_invoke_2;
  v5[3] = &unk_1E5248CA0;
  id v6 = *(id *)(a1 + 32);
  nw_resolver_config_enumerate_name_servers(a3, v5);

  return 1;
}

uint64_t __33__NWPath_copyDNSServerEndpoints___block_invoke_2(uint64_t a1, char *hostname)
{
  nw_endpoint_t host = nw_endpoint_create_host(hostname, "0");
  id v4 = +[NWEndpoint endpointWithInternalEndpoint:host];
  if (v4) {
    [*(id *)(a1 + 32) addObject:v4];
  }

  return 1;
}

- (NSArray)flows
{
  id v2 = [(NWPath *)self internalPath];
  BOOL v3 = (atomic_uchar *)nw_path_copy_flows(v2);

  if (!v3 || *((void *)v3 + 3) == *((void *)v3 + 2))
  {
    id v5 = 0;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __15__NWPath_flows__block_invoke;
    v7[3] = &unk_1E524AE18;
    id v5 = v4;
    id v8 = v5;
    nw_array_apply(v3, (uint64_t)v7);
  }

  return (NSArray *)v5;
}

uint64_t __15__NWPath_flows__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [[NWPathFlow alloc] initWithPathFlow:v4];

  if (v5) {
    [*(id *)(a1 + 32) addObject:v5];
  }

  return 1;
}

- (NWInterface)fallbackInterface
{
  id v2 = [(NWPath *)self internalPath];
  fallback_unsigned int interface_index = nw_path_get_fallback_interface_index((uint64_t)v2);

  if (fallback_interface_index) {
    id v4 = [[NWInterface alloc] initWithInterfaceIndex:fallback_interface_index];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)delegateInterface
{
  id v2 = [(NWPath *)self internalPath];
  id v3 = nw_path_copy_delegate_interface(v2);

  if (v3) {
    id v4 = [[NWInterface alloc] initWithInterface:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (NWInterface)scopedInterface
{
  id v2 = [(NWPath *)self internalPath];
  id v3 = v2;
  if (v2 && ((v4 = v2[66], v4 != 6) ? (BOOL v5 = v4 == 12) : (BOOL v5 = 1), v5))
  {
    uint64_t v6 = v2[67];

    if (v6)
    {
      uint64_t v7 = [[NWInterface alloc] initWithInterfaceIndex:v6];
      goto LABEL_11;
    }
  }
  else
  {
  }
  uint64_t v7 = 0;
LABEL_11:

  return v7;
}

- (id)inactiveNetworkAgentUUIDsOnlyVoluntary:(BOOL)a3
{
  if ([(NWPath *)self status])
  {
    BOOL v5 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v6 = [(NWPath *)self internalPath];
    uint64_t v7 = v6;
    if (v6 && (id v8 = (void *)v6[28]) != 0)
    {
      id v9 = v8;

      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      long long v14 = __49__NWPath_inactiveNetworkAgentUUIDsOnlyVoluntary___block_invoke;
      long long v15 = &unk_1E5242940;
      BOOL v17 = a3;
      id v16 = v5;
      xpc_dictionary_apply(v9, &v12);
    }
    else
    {

      id v9 = 0;
    }
    if (objc_msgSend(v5, "count", v12, v13, v14, v15)) {
      id v10 = v5;
    }
    else {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

uint64_t __49__NWPath_inactiveNetworkAgentUUIDsOnlyVoluntary___block_invoke(uint64_t a1, int a2, xpc_object_t xdict)
{
  size_t length = 0;
  if (xdict)
  {
    data = xpc_dictionary_get_data(xdict, "data", &length);
    if (data)
    {
      if (length >= 0xD8 && length == data[53] + 216)
      {
        int v5 = data[52];
        if ((v5 & 2) == 0 && ((v5 & 0x10) != 0 || !*(unsigned char *)(a1 + 40)))
        {
          uint64_t v6 = *(void **)(a1 + 32);
          uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:data];
          [v6 addObject:v7];
        }
      }
    }
  }
  return 1;
}

- (id)genericNetworkAgentsWithDomain:(id)a3 type:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NWPath *)self status])
  {
    id v8 = [MEMORY[0x1E4F1CA48] array];
    id v9 = [(NWPath *)self internalPath];
    id v10 = v9;
    if (v9 && (v11 = (void *)v9[28]) != 0)
    {
      id v12 = v11;

      applier[0] = MEMORY[0x1E4F143A8];
      applier[1] = 3221225472;
      applier[2] = __46__NWPath_genericNetworkAgentsWithDomain_type___block_invoke;
      applier[3] = &unk_1E5242918;
      id v16 = v6;
      id v17 = v7;
      id v18 = v8;
      xpc_dictionary_apply(v12, applier);
    }
    else
    {

      id v12 = 0;
    }
    if ([v8 count]) {
      id v13 = v8;
    }
    else {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

uint64_t __46__NWPath_genericNetworkAgentsWithDomain_type___block_invoke(uint64_t a1, int a2, xpc_object_t xdict)
{
  size_t length = 0;
  if (xdict)
  {
    data = (unsigned int *)xpc_dictionary_get_data(xdict, "data", &length);
    if (data)
    {
      if (length >= 0xD8)
      {
        id v6 = data;
        if (length == data[53] + 216)
        {
          id v7 = *(void **)(a1 + 32);
          if (v7)
          {
            id v3 = (NWGenericNetworkAgent *)nw_nsstring((uint64_t)(data + 4));
            if (([v7 isEqualToString:v3] & 1) == 0)
            {
LABEL_16:

              return 1;
            }
            id v8 = *(void **)(a1 + 40);
            if (!v8)
            {

              goto LABEL_14;
            }
          }
          else
          {
            id v8 = *(void **)(a1 + 40);
            if (!v8) {
              goto LABEL_14;
            }
          }
          BOOL v9 = nw_nsstring((uint64_t)(v6 + 12));
          int v10 = [v8 isEqualToString:v9];

          if (v7)
          {

            if ((v10 & 1) == 0) {
              return 1;
            }
            goto LABEL_14;
          }
          if (v10)
          {
LABEL_14:
            id v3 = [[NWGenericNetworkAgent alloc] initWithKernelAgent:v6];
            if (v3) {
              [*(id *)(a1 + 48) addObject:v3];
            }
            goto LABEL_16;
          }
        }
      }
    }
  }
  return 1;
}

- (id)networkAgentsOfType:(Class)a3
{
  Class v3 = a3;
  if (a3)
  {
    if ([(NWPath *)self status])
    {
      int v5 = [MEMORY[0x1E4F1CA48] array];
      id v6 = [(NWPath *)self internalPath];
      id v7 = v6;
      if (v6 && (id v8 = (void *)v6[28]) != 0)
      {
        id v9 = v8;

        uint64_t v11 = MEMORY[0x1E4F143A8];
        uint64_t v12 = 3221225472;
        id v13 = __30__NWPath_networkAgentsOfType___block_invoke;
        long long v14 = &unk_1E52428F0;
        Class v16 = v3;
        id v15 = v5;
        xpc_dictionary_apply(v9, &v11);
      }
      else
      {

        id v9 = 0;
      }
      if (objc_msgSend(v5, "count", v11, v12, v13, v14)) {
        Class v3 = v5;
      }
      else {
        Class v3 = 0;
      }
    }
    else
    {
      Class v3 = 0;
    }
  }

  return v3;
}

uint64_t __30__NWPath_networkAgentsOfType___block_invoke(uint64_t a1, int a2, xpc_object_t xdict)
{
  size_t length = 0;
  if (xdict)
  {
    data = (unsigned int *)xpc_dictionary_get_data(xdict, "data", &length);
    if (data)
    {
      if (length >= 0xD8)
      {
        int v5 = data;
        if (length == data[53] + 216)
        {
          id v6 = [*(id *)(a1 + 40) agentDomain];
          uint64_t v7 = nw_nsstring((uint64_t)(v5 + 4));
          if (![v6 isEqualToString:v7]) {
            goto LABEL_24;
          }
          id v8 = [*(id *)(a1 + 40) agentType];
          BOOL v9 = nw_nsstring((uint64_t)(v5 + 12));
          int v10 = [v8 isEqualToString:v9];

          if (v10)
          {
            id v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v5 + 54 length:v5[53]];
            uint64_t v7 = [*(id *)(a1 + 40) agentFromData:v6];
            if (v7)
            {
              uint64_t v11 = [NSString stringWithUTF8String:v5 + 20];
              [(id)v7 setAgentDescription:v11];

              uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v5];
              [(id)v7 setAgentUUID:v12];

              unsigned int v13 = v5[52];
              if ((v13 & 2) != 0)
              {
                [(id)v7 setActive:1];
                unsigned int v13 = v5[52];
                if ((v13 & 4) == 0)
                {
LABEL_10:
                  if ((v13 & 8) == 0) {
                    goto LABEL_11;
                  }
                  goto LABEL_16;
                }
              }
              else if ((v13 & 4) == 0)
              {
                goto LABEL_10;
              }
              [(id)v7 setKernelActivated:1];
              unsigned int v13 = v5[52];
              if ((v13 & 8) == 0)
              {
LABEL_11:
                if ((v13 & 0x10) == 0) {
                  goto LABEL_12;
                }
                goto LABEL_17;
              }
LABEL_16:
              [(id)v7 setUserActivated:1];
              unsigned int v13 = v5[52];
              if ((v13 & 0x10) == 0)
              {
LABEL_12:
                if ((v13 & 0x20) == 0)
                {
LABEL_20:
                  if (v5[52] & 0x40) != 0 && (objc_opt_respondsToSelector()) {
                    [(id)v7 setNetworkProvider:1];
                  }
                  [*(id *)(a1 + 32) addObject:v7];
                  goto LABEL_24;
                }
LABEL_18:
                if (objc_opt_respondsToSelector()) {
                  [(id)v7 setSpecificUseOnly:1];
                }
                goto LABEL_20;
              }
LABEL_17:
              [(id)v7 setVoluntary:1];
              if ((v5[52] & 0x20) == 0) {
                goto LABEL_20;
              }
              goto LABEL_18;
            }
LABEL_24:
          }
        }
      }
    }
  }
  return 1;
}

- (id)copyDataFromNetworkAgentWithDomain:(id)a3 type:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__48061;
  BOOL v22 = __Block_byref_object_dispose__48062;
  id v23 = 0;
  uint64_t v8 = [(NWPath *)self internalPath];
  BOOL v9 = (void *)v8;
  if (v8 && (int v10 = *(void **)(v8 + 224)) != 0)
  {
    id v11 = v10;

    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = __50__NWPath_copyDataFromNetworkAgentWithDomain_type___block_invoke;
    applier[3] = &unk_1E5244750;
    id v15 = v6;
    id v16 = v7;
    id v17 = &v18;
    xpc_dictionary_apply(v11, applier);

    BOOL v9 = v15;
  }
  else
  {
    id v11 = 0;
  }

  id v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

uint64_t __50__NWPath_copyDataFromNetworkAgentWithDomain_type___block_invoke(void *a1, int a2, xpc_object_t xdict)
{
  size_t length = 0;
  if (!xdict) {
    return 1;
  }
  data = (unsigned int *)xpc_dictionary_get_data(xdict, "data", &length);
  if (!data) {
    return 1;
  }
  if (length < 0xD8) {
    return 1;
  }
  int v5 = data;
  if (length != data[53] + 216) {
    return 1;
  }
  id v6 = (void *)a1[4];
  id v7 = (void *)nw_nsstring((uint64_t)(data + 4));
  int v8 = [v6 isEqualToString:v7];
  if (v8)
  {
    BOOL v9 = (void *)a1[5];
    BOOL v10 = nw_nsstring((uint64_t)(v5 + 12));
    LODWORD(v9) = [v9 isEqualToString:v10];

    if (v9)
    {
      uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v5 + 54 length:v5[53]];
      uint64_t v12 = *(void *)(a1[6] + 8);
      id v7 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
      goto LABEL_8;
    }
    return 1;
  }
LABEL_8:
  uint64_t v13 = v8 ^ 1u;

  return v13;
}

- (BOOL)usesNetworkAgent:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  *(void *)uu = 0;
  uint64_t v23 = 0;
  if (v4 && [(NWPath *)self status])
  {
    int v5 = [v4 agentUUID];
    [v5 getUUIDBytes:uu];

    uint64_t v6 = [(NWPath *)self internalPath];
    id v7 = (void *)v6;
    if (v6 && (int v8 = *(void **)(v6 + 224)) != 0)
    {
      id v9 = v8;

      memset(out, 0, 37);
      uuid_unparse(uu, out);
      BOOL v10 = xpc_dictionary_get_value(v9, out);
      uint64_t v11 = v10;
      size_t length = 0;
      if (v10
        && (data = (unsigned int *)xpc_dictionary_get_data(v10, "data", &length)) != 0
        && length >= 0xD8
        && (uint64_t v13 = data, length == data[53] + 216))
      {
        long long v14 = [(id)objc_opt_class() agentDomain];
        BOOL v15 = nw_nsstring((uint64_t)(v13 + 4));
        if ([v14 isEqualToString:v15])
        {
          id v16 = [(id)objc_opt_class() agentType];
          BOOL v17 = nw_nsstring((uint64_t)(v13 + 12));
          char v18 = [v16 isEqualToString:v17];
        }
        else
        {
          char v18 = 0;
        }
      }
      else
      {
        char v18 = 0;
      }

      id v7 = v9;
    }
    else
    {
      char v18 = 0;
    }
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

- (BOOL)usesNetworkAgentType:(Class)a3
{
  Class v3 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  if (a3)
  {
    if ([(NWPath *)self status])
    {
      int v5 = [(NWPath *)self internalPath];
      uint64_t v6 = v5;
      if (v5 && (id v7 = (void *)v5[28]) != 0)
      {
        id v8 = v7;

        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __31__NWPath_usesNetworkAgentType___block_invoke;
        v10[3] = &unk_1E52428C8;
        v10[4] = &v11;
        v10[5] = v3;
        xpc_dictionary_apply(v8, v10);
      }
      else
      {

        id v8 = 0;
      }
      LOBYTE(v3) = *((unsigned char *)v12 + 24) != 0;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  _Block_object_dispose(&v11, 8);
  return (char)v3;
}

BOOL __31__NWPath_usesNetworkAgentType___block_invoke(uint64_t a1, int a2, xpc_object_t xdict)
{
  size_t length = 0;
  if (!xdict) {
    return 1;
  }
  data = (unsigned int *)xpc_dictionary_get_data(xdict, "data", &length);
  if (!data) {
    return 1;
  }
  if (length < 0xD8) {
    return 1;
  }
  int v5 = data;
  if (length != data[53] + 216) {
    return 1;
  }
  uint64_t v6 = [*(id *)(a1 + 40) agentDomain];
  BOOL v7 = nw_nsstring((uint64_t)(v5 + 4));
  if ([v6 isEqualToString:v7])
  {
    id v8 = [*(id *)(a1 + 40) agentType];
    BOOL v9 = nw_nsstring((uint64_t)(v5 + 12));
    int v10 = [v8 isEqualToString:v9];

    if (v10) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    }
  }
  else
  {
  }
  return !*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

- (BOOL)isListenerInterfaceSpecific
{
  id v2 = [(NWPath *)self internalPath];
  char is_interface_specific = nw_path_listener_is_interface_specific(v2);

  return is_interface_specific;
}

- (BOOL)isLinkQualityAbort
{
  id v2 = [(NWPath *)self internalPath];
  char v3 = nw_path_link_quality_abort(v2);

  return v3;
}

- (BOOL)shouldProbeConnectivity
{
  id v2 = [(NWPath *)self internalPath];
  char should_probe_connectivity = nw_path_should_probe_connectivity(v2);

  return should_probe_connectivity;
}

- (BOOL)hasParentalControls
{
  id v2 = [(NWPath *)self internalPath];
  char has_parental_controls = nw_path_has_parental_controls(v2);

  return has_parental_controls;
}

- (BOOL)hasApplicationLevelFirewall
{
  id v2 = [(NWPath *)self internalPath];
  char has_application_level_firewall = nw_path_has_application_level_firewall(v2);

  return has_application_level_firewall;
}

- (BOOL)hasCustomPFRules
{
  id v2 = [(NWPath *)self internalPath];
  char has_custom_pf_rules = nw_path_has_custom_pf_rules(v2);

  return has_custom_pf_rules;
}

- (BOOL)hasKernelExtensionFilter
{
  id v2 = [(NWPath *)self internalPath];
  char has_kernel_extension_filter = nw_path_has_kernel_extension_filter(v2);

  return has_kernel_extension_filter;
}

- (BOOL)isPerAppVPN
{
  id v2 = [(NWPath *)self internalPath];
  BOOL is_per_app_vpn = nw_path_is_per_app_vpn(v2);

  return is_per_app_vpn;
}

- (BOOL)isViable
{
  id v2 = [(NWPath *)self internalPath];
  BOOL is_viable = nw_path_is_viable(v2);

  return is_viable;
}

- (BOOL)isListener
{
  id v2 = [(NWPath *)self internalPath];
  char is_listener = nw_path_is_listener(v2);

  return is_listener;
}

- (BOOL)isUltraConstrained
{
  id v2 = [(NWPath *)self internalPath];
  char is_ultra_constrained = nw_path_is_ultra_constrained(v2);

  return is_ultra_constrained;
}

- (NSUUID)clientID
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  memset(uu, 0, sizeof(uu));
  uuid_clear(uu);
  char v3 = [(NWPath *)self internalPath];
  if (nw_path_get_client_id(v3, uu))
  {
    int is_null = uuid_is_null(uu);

    if (is_null) {
      int v5 = 0;
    }
    else {
      int v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:uu];
    }
  }
  else
  {

    int v5 = 0;
  }

  return (NSUUID *)v5;
}

- (BOOL)isEqualToPath:(NWPath *)path
{
  id v4 = path;
  int v5 = [(NWPath *)self internalPath];
  uint64_t v6 = [(NWPath *)v4 internalPath];

  LOBYTE(v4) = nw_path_is_equal_inner(v5, v6, 0);
  return (char)v4;
}

- (NSString)privateDescription
{
  id v2 = [(NWPath *)self descriptionWithIndent:0 showFullContent:1];

  return (NSString *)v2;
}

- (id)description
{
  id v2 = [(NWPath *)self descriptionWithIndent:0 showFullContent:0];

  return v2;
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v8 = [(NWPath *)self statusAsString];
  [v7 appendPrettyObject:v8 withName:@"status" indent:v5 showFullContent:1];

  objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWPath reason](self, "reason"), @"reasonCode", v5);
  BOOL v9 = [(NWPath *)self reasonDescription];
  [v7 appendPrettyObject:v9 withName:@"reason" indent:v5 showFullContent:1];

  objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWPath isViable](self, "isViable"), @"isViable", v5);
  objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWPath isExpensive](self, "isExpensive"), @"isExpensive", v5);
  objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWPath isConstrained](self, "isConstrained"), @"isConstrained", v5);
  if ([(NWPath *)self isUltraConstrained]) {
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWPath isUltraConstrained](self, "isUltraConstrained"), @"isUltraConstrained", v5);
  }
  int v10 = [(NWPath *)self clientID];
  [v7 appendPrettyObject:v10 withName:@"clientID" indent:v5 showFullContent:1];

  if (!v4)
  {
    objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWPath mtu](self, "mtu"), @"mtu", v5);
    return v7;
  }
  if ([(NWPath *)self usesInterfaceType:1])
  {
    uint64_t v11 = @"wifi";
LABEL_13:
    [v7 appendPrettyObject:v11 withName:@"interfaceType" indent:v5 showFullContent:1];
    goto LABEL_14;
  }
  if ([(NWPath *)self usesInterfaceType:2])
  {
    uint64_t v11 = @"cellular";
    goto LABEL_13;
  }
  if ([(NWPath *)self usesInterfaceType:3])
  {
    uint64_t v11 = @"wired ethernet";
    goto LABEL_13;
  }
  if ([(NWPath *)self usesInterfaceType:4])
  {
    uint64_t v11 = @"loopback";
    goto LABEL_13;
  }
LABEL_14:
  if ([(NWPath *)self fallbackInterfaceIndex]) {
    objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWPath fallbackInterfaceIndex](self, "fallbackInterfaceIndex"), @"fallbackInterfaceIndex", v5);
  }
  if ([(NWPath *)self fallbackIsWeak]) {
    [v7 appendPrettyBOOL:1 withName:@"fallbackIsWeak" indent:v5];
  }
  if ([(NWPath *)self fallbackEligible]) {
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWPath fallbackEligible](self, "fallbackEligible"), @"fallbackEligible", v5);
  }
  if ([(NWPath *)self fallbackIsPreferred]) {
    [v7 appendPrettyBOOL:1 withName:@"fallbackIsPreferred" indent:v5];
  }
  objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWPath mtu](self, "mtu"), @"mtu", v5);
  objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWPath maximumDatagramSize](self, "maximumDatagramSize"), @"maximumDatagramSize", v5);
  objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWPath secondsSinceInterfaceChange](self, "secondsSinceInterfaceChange"), @"secondsSinceInterfaceChange", v5);
  uint64_t v12 = [(NWPath *)self flows];
  [v7 appendPrettyObject:v12 withName:@"flows" indent:v5 showFullContent:1];

  uint64_t v13 = [(NWPath *)self groupMembers];
  [v7 appendPrettyObject:v13 withName:@"groupMembers" indent:v5 showFullContent:1];

  char v14 = [(NWPath *)self internalPath];
  uint64_t v33 = MEMORY[0x1E4F143A8];
  uint64_t v34 = 3221225472;
  v35 = __48__NWPath_descriptionWithIndent_showFullContent___block_invoke;
  v36 = &unk_1E52428A0;
  id v15 = v7;
  id v37 = v15;
  int v38 = v5;
  BOOL v39 = v4;
  nw_path_enumerate_interface_options(v14, &v33);

  id v16 = [(NWPath *)self effectiveLocalEndpoint];
  [v15 appendPrettyObject:v16 withName:@"effectiveLocalEndpoint" indent:v5 showFullContent:1];

  BOOL v17 = [(NWPath *)self effectiveRemoteEndpoint];
  [v15 appendPrettyObject:v17 withName:@"effectiveRemoteEndpoint" indent:v5 showFullContent:1];

  char v18 = [(NWPath *)self interface];
  [v15 appendPrettyObject:v18 withName:@"interface" indent:v5 showFullContent:1];

  v19 = [(NWPath *)self scopedInterface];
  [v15 appendPrettyObject:v19 withName:@"scopedInterface" indent:v5 showFullContent:1];

  uint64_t v20 = [(NWPath *)self dnsServers];
  [v15 appendPrettyObject:v20 withName:@"dnsServers" indent:v5 showFullContent:1];

  v21 = [(NWPath *)self internalPath];
  id v22 = nw_path_copy_resolver_configs(v21);
  [v15 appendPrettyObject:v22 withName:@"resolvers" indent:v5 showFullContent:1];

  uint64_t v23 = [(NWPath *)self dnsSearchDomains];
  [v15 appendPrettyObject:v23 withName:@"dnsSearchDomains" indent:v5 showFullContent:1];

  uint64_t v24 = [(NWPath *)self internalPath];
  id v25 = nw_path_copy_override_resolver_configs(v24);
  [v15 appendPrettyObject:v25 withName:@"override-resolvers" indent:v5 showFullContent:1];

  v26 = [(NWPath *)self overrideDNSSearchDomains];
  [v15 appendPrettyObject:v26 withName:@"override-dnsSearchDomains" indent:v5 showFullContent:1];

  v27 = [(NWPath *)self gateways];
  [v15 appendPrettyObject:v27 withName:@"gateways" indent:v5 showFullContent:1];

  __int16 v28 = [(NWPath *)self proxySettings];
  [v15 appendPrettyObject:v28 withName:@"proxySettings" indent:v5 showFullContent:1];

  v29 = [(NWPath *)self genericNetworkAgentsWithDomain:0 type:0];
  [v15 appendPrettyObject:v29 withName:@"agents" indent:v5 showFullContent:1];

  if ([(NWPath *)self isFlowDivert])
  {
    objc_msgSend(v15, "appendPrettyInt:withName:indent:", -[NWPath flowDivertControlUnit](self, "flowDivertControlUnit"), @"flowDivertControlUnit", v5);
    objc_msgSend(v15, "appendPrettyInt:withName:indent:", -[NWPath flowDivertAggregateUnit](self, "flowDivertAggregateUnit"), @"flowDivertAggregateUnit", v5);
  }
  if ([(NWPath *)self isFiltered]) {
    objc_msgSend(v15, "appendPrettyInt:withName:indent:", -[NWPath filterControlUnit](self, "filterControlUnit"), @"filterControlunit", v5);
  }
  if ([(NWPath *)self isListener]) {
    [v15 appendPrettyBOOL:1 withName:@"isListener" indent:v5];
  }
  if ([(NWPath *)self isDirect]) {
    [v15 appendPrettyBOOL:1 withName:@"isDirect" indent:v5];
  }
  if ([(NWPath *)self isLocal]) {
    [v15 appendPrettyBOOL:1 withName:@"isLocal" indent:v5];
  }
  if ([(NWPath *)self isRoaming]) {
    [v15 appendPrettyBOOL:1 withName:@"isRoaming" indent:v5];
  }
  if ([(NWPath *)self shouldProbeConnectivity]) {
    [v15 appendPrettyBOOL:1 withName:@"shouldProbeConnectivity" indent:v5];
  }
  if ([(NWPath *)self isLinkQualityAbort]) {
    [v15 appendPrettyBOOL:1 withName:@"isLinkQualityAbort" indent:v5];
  }
  if ([(NWPath *)self isListenerInterfaceSpecific]) {
    [v15 appendPrettyBOOL:1 withName:@"isListenerInterfaceSpecific" indent:v5];
  }
  objc_msgSend(v15, "appendPrettyBOOL:withName:indent:", -[NWPath supportsIPv4](self, "supportsIPv4"), @"supportsIPv4", v5);
  objc_msgSend(v15, "appendPrettyBOOL:withName:indent:", -[NWPath supportsIPv6](self, "supportsIPv6"), @"supportsIPv6", v5);
  objc_msgSend(v15, "appendPrettyBOOL:withName:indent:", -[NWPath supportsDNS](self, "supportsDNS"), @"supportsDNS", v5);
  uint64_t v30 = [(NWPath *)self internalPath];
  int has_nat64_prefixes = nw_path_has_nat64_prefixes(v30);

  if (has_nat64_prefixes) {
    [v15 appendPrettyBOOL:1 withName:@"hasNAT64Prefixes" indent:v5];
  }
  objc_msgSend(v15, "appendPrettyBOOL:withName:indent:", -[NWPath hasProxySettings](self, "hasProxySettings"), @"hasProxySettings", v5);
  if ([(NWPath *)self isPerAppVPN]) {
    objc_msgSend(v15, "appendPrettyBOOL:withName:indent:", -[NWPath isPerAppVPN](self, "isPerAppVPN"), @"perAppVPN", v5);
  }
  if ([(NWPath *)self hasKernelExtensionFilter]) {
    objc_msgSend(v15, "appendPrettyBOOL:withName:indent:", -[NWPath hasKernelExtensionFilter](self, "hasKernelExtensionFilter"), @"hasKernelExtensionFilter", v5);
  }
  if ([(NWPath *)self hasCustomPFRules]) {
    objc_msgSend(v15, "appendPrettyBOOL:withName:indent:", -[NWPath hasCustomPFRules](self, "hasCustomPFRules"), @"hasCustomPFRules", v5);
  }
  if ([(NWPath *)self hasApplicationLevelFirewall]) {
    objc_msgSend(v15, "appendPrettyBOOL:withName:indent:", -[NWPath hasApplicationLevelFirewall](self, "hasApplicationLevelFirewall"), @"hasApplicationLevelFirewall", v5);
  }
  if ([(NWPath *)self hasParentalControls]) {
    objc_msgSend(v15, "appendPrettyBOOL:withName:indent:", -[NWPath hasParentalControls](self, "hasParentalControls"), @"hasParentalControls", v5);
  }

  return v7;
}

void __48__NWPath_descriptionWithIndent_showFullContent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F29128];
  id v6 = a2;
  id v8 = (id)[[v5 alloc] initWithUUIDBytes:a3];
  id v7 = (void *)[[NSString alloc] initWithFormat:@"%@ : %@", v6, v8];

  [*(id *)(a1 + 32) appendPrettyObject:v7 withName:@"interfaceOption" indent:*(unsigned int *)(a1 + 40) showFullContent:*(unsigned __int8 *)(a1 + 44)];
}

- (NSString)statusAsString
{
  NWPathStatus v2 = [(NWPath *)self status];

  return (NSString *)+[NWPath createStringFromStatus:v2];
}

- (NWPath)init
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)NWPath;
  NWPathStatus v2 = [(NWPath *)&v15 init];
  char v3 = v2;
  if (v2)
  {
    BOOL v4 = v2;
    goto LABEL_3;
  }
  id v6 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  BOOL v17 = "-[NWPath init]";
  id v7 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v13 = 0;
  if (__nwlog_fault(v7, &type, &v13))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      id v8 = __nwlog_obj();
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        BOOL v17 = "-[NWPath init]";
        int v10 = "%{public}s [super init] failed";
LABEL_17:
        _os_log_impl(&dword_1830D4000, v8, v9, v10, buf, 0xCu);
      }
    }
    else
    {
      if (v13)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        id v8 = __nwlog_obj();
        os_log_type_t v9 = type;
        BOOL v12 = os_log_type_enabled(v8, type);
        if (backtrace_string)
        {
          if (v12)
          {
            *(_DWORD *)buf = 136446466;
            BOOL v17 = "-[NWPath init]";
            __int16 v18 = 2082;
            v19 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v8, v9, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_19;
        }
        if (!v12) {
          goto LABEL_18;
        }
        *(_DWORD *)buf = 136446210;
        BOOL v17 = "-[NWPath init]";
        int v10 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_17;
      }
      id v8 = __nwlog_obj();
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        BOOL v17 = "-[NWPath init]";
        int v10 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_17;
      }
    }
LABEL_18:
  }
LABEL_19:
  if (v7) {
    free(v7);
  }
LABEL_3:

  return v3;
}

+ (NWPath)pathWithProtocolBufferData:(id)a3
{
  uint64_t v170 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = [[NWPBPath alloc] initWithData:v3];
  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v11 = v3;
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v12 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v165 = "+[NWPath pathWithProtocolBufferData:]";
    char v13 = (char *)_os_log_send_and_compose_impl();

    uu[0] = 16;
    char v161 = 0;
    if (__nwlog_fault(v13, uu, &v161))
    {
      if (uu[0] == 17)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        char v14 = (id)gLogObj;
        unsigned __int8 v15 = uu[0];
        if (!os_log_type_enabled(v14, (os_log_type_t)uu[0])) {
          goto LABEL_170;
        }
        *(_DWORD *)buf = 136446210;
        v165 = "+[NWPath pathWithProtocolBufferData:]";
        id v16 = "%{public}s [NWPBPath initWithData:] failed";
LABEL_168:
        v136 = v14;
        os_log_type_t v137 = v15;
        goto LABEL_169;
      }
      if (!v161)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        char v14 = (id)gLogObj;
        unsigned __int8 v15 = uu[0];
        if (!os_log_type_enabled(v14, (os_log_type_t)uu[0])) {
          goto LABEL_170;
        }
        *(_DWORD *)buf = 136446210;
        v165 = "+[NWPath pathWithProtocolBufferData:]";
        id v16 = "%{public}s [NWPBPath initWithData:] failed, backtrace limit exceeded";
        goto LABEL_168;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      char v14 = (id)gLogObj;
      os_log_type_t v134 = uu[0];
      BOOL v135 = os_log_type_enabled(v14, (os_log_type_t)uu[0]);
      if (!backtrace_string)
      {
        if (!v135)
        {
LABEL_170:

          if (!v13) {
            goto LABEL_162;
          }
          goto LABEL_161;
        }
        *(_DWORD *)buf = 136446210;
        v165 = "+[NWPath pathWithProtocolBufferData:]";
        id v16 = "%{public}s [NWPBPath initWithData:] failed, no backtrace";
        v136 = v14;
        os_log_type_t v137 = v134;
LABEL_169:
        _os_log_impl(&dword_1830D4000, v136, v137, v16, buf, 0xCu);
        goto LABEL_170;
      }
      if (v135)
      {
        *(_DWORD *)buf = 136446466;
        v165 = "+[NWPath pathWithProtocolBufferData:]";
        __int16 v166 = 2082;
        uint64_t v167 = (uint64_t)backtrace_string;
        _os_log_impl(&dword_1830D4000, v14, v134, "%{public}s [NWPBPath initWithData:] failed, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (!v13)
    {
LABEL_162:
      v132 = 0;
      goto LABEL_163;
    }
LABEL_161:
    free(v13);
    goto LABEL_162;
  }
  memset(uu, 0, sizeof(uu));
  clientUUID = v4->_clientUUID;
  if (clientUUID)
  {
    id v7 = clientUUID;
    uuid_parse([(NSString *)v7 UTF8String], uu);
  }
  id v145 = v3;
  directInterface = v5->_directInterface;
  if (directInterface)
  {
    os_log_type_t v9 = directInterface;
    int v10 = [(NWPBInterface *)v9 data];
    v147 = +[NWInterface interfaceWithProtocolBufferData:v10];
  }
  else
  {
    v147 = 0;
  }
  delegateInterface = v5->_delegateInterface;
  if (delegateInterface)
  {
    __int16 v18 = delegateInterface;
    v19 = [(NWPBInterface *)v18 data];
    v146 = +[NWInterface interfaceWithProtocolBufferData:v19];
  }
  else
  {
    v146 = 0;
  }
  if ([(NSMutableArray *)v5->_agents count])
  {
    xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
    long long v157 = 0u;
    long long v158 = 0u;
    long long v159 = 0u;
    long long v160 = 0u;
    v143 = v5;
    obj = v5->_agents;
    uint64_t v153 = [(NSMutableArray *)obj countByEnumeratingWithState:&v157 objects:v162 count:16];
    if (v153)
    {
      uint64_t v151 = *(void *)v158;
      unint64_t v20 = 0x1E8F5F000;
LABEL_18:
      uint64_t v21 = 0;
      while (1)
      {
        if (*(void *)v158 != v151) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void *)(*((void *)&v157 + 1) + 8 * v21);
        if (v22 && (uint64_t v23 = *(void **)(v22 + 16)) != 0)
        {
          id v24 = v23;
          uint64_t v25 = [v24 length];
        }
        else
        {
          uint64_t v25 = 0;
        }
        v26 = (unsigned __int8 *)malloc_type_calloc(1uLL, v25 + 8, 0xEAFB8F1AuLL);
        if (v26)
        {
          size_t length = v25 + 8;
          if (v22) {
            goto LABEL_28;
          }
        }
        else
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v111 = (id)gLogObj;
          os_log_type_enabled(v111, OS_LOG_TYPE_ERROR);
          *(_DWORD *)buf = 136446722;
          v165 = "strict_calloc";
          __int16 v166 = 2048;
          uint64_t v167 = 1;
          __int16 v168 = 2048;
          uint64_t v169 = v25 + 8;
          LODWORD(v139) = 32;
          v138 = buf;
          v112 = (void *)_os_log_send_and_compose_impl();

          result = (NWPath *)__nwlog_abort((uint64_t)v112);
          if (result) {
            goto LABEL_174;
          }
          free(v112);
          size_t length = v25 + 8;
          if (v22)
          {
LABEL_28:
            v27 = *(void **)(v22 + 32);
            goto LABEL_29;
          }
        }
        v27 = 0;
LABEL_29:
        id v28 = v27;
        uuid_parse((const char *)[v28 UTF8String], v26);
        xpc_object_t v29 = xpc_dictionary_create(0, 0, 0);
        if (v22)
        {
          id v30 = *(id *)(v22 + *(int *)(v20 + 3884));
          v31 = v30;
          if (v30) {
            v32 = (void *)*((void *)v30 + 1);
          }
          else {
            v32 = 0;
          }
        }
        else
        {
          v31 = 0;
          v32 = 0;
        }
        id v33 = v32;

        if ([v33 UTF8String])
        {
          uint64_t v34 = (unsigned __int8 *)[v33 UTF8String];
          if (!v34)
          {
            pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
            networkd_settings_init();
            v114 = (id)gLogObj;
            os_log_type_enabled(v114, OS_LOG_TYPE_ERROR);
            *(_DWORD *)buf = 136446210;
            v165 = "_strict_strlcpy";
            LODWORD(v139) = 12;
            v138 = buf;
            v115 = (void *)_os_log_send_and_compose_impl();

            result = (NWPath *)__nwlog_abort((uint64_t)v115);
            if (result) {
              goto LABEL_174;
            }
            free(v115);
            unint64_t v20 = 0x1E8F5F000;
          }
          int v35 = *v34;
          v26[16] = v35;
          if (v35)
          {
            int v36 = v34[1];
            v26[17] = v36;
            if (v36)
            {
              int v37 = v34[2];
              v26[18] = v37;
              if (v37)
              {
                int v38 = v34[3];
                v26[19] = v38;
                if (v38)
                {
                  int v39 = v34[4];
                  v26[20] = v39;
                  if (v39)
                  {
                    int v40 = v34[5];
                    v26[21] = v40;
                    if (v40)
                    {
                      int v41 = v34[6];
                      v26[22] = v41;
                      if (v41)
                      {
                        int v42 = v34[7];
                        v26[23] = v42;
                        if (v42)
                        {
                          int v43 = v34[8];
                          v26[24] = v43;
                          if (v43)
                          {
                            int v44 = v34[9];
                            v26[25] = v44;
                            if (v44)
                            {
                              int v45 = v34[10];
                              v26[26] = v45;
                              if (v45)
                              {
                                int v46 = v34[11];
                                v26[27] = v46;
                                if (v46)
                                {
                                  int v47 = v34[12];
                                  v26[28] = v47;
                                  if (v47)
                                  {
                                    int v48 = v34[13];
                                    v26[29] = v48;
                                    if (v48)
                                    {
                                      int v49 = v34[14];
                                      v26[30] = v49;
                                      if (v49)
                                      {
                                        int v50 = v34[15];
                                        v26[31] = v50;
                                        if (v50)
                                        {
                                          int v51 = v34[16];
                                          v26[32] = v51;
                                          if (v51)
                                          {
                                            int v52 = v34[17];
                                            v26[33] = v52;
                                            if (v52)
                                            {
                                              int v53 = v34[18];
                                              v26[34] = v53;
                                              if (v53)
                                              {
                                                int v54 = v34[19];
                                                v26[35] = v54;
                                                if (v54)
                                                {
                                                  int v55 = v34[20];
                                                  v26[36] = v55;
                                                  if (v55)
                                                  {
                                                    int v56 = v34[21];
                                                    v26[37] = v56;
                                                    if (v56)
                                                    {
                                                      int v57 = v34[22];
                                                      v26[38] = v57;
                                                      if (v57)
                                                      {
                                                        int v58 = v34[23];
                                                        v26[39] = v58;
                                                        if (v58)
                                                        {
                                                          int v59 = v34[24];
                                                          v26[40] = v59;
                                                          if (v59)
                                                          {
                                                            int v60 = v34[25];
                                                            v26[41] = v60;
                                                            if (v60)
                                                            {
                                                              int v61 = v34[26];
                                                              v26[42] = v61;
                                                              if (v61)
                                                              {
                                                                int v62 = v34[27];
                                                                v26[43] = v62;
                                                                if (v62)
                                                                {
                                                                  int v63 = v34[28];
                                                                  v26[44] = v63;
                                                                  if (v63)
                                                                  {
                                                                    int v64 = v34[29];
                                                                    v26[45] = v64;
                                                                    if (v64)
                                                                    {
                                                                      int v65 = v34[30];
                                                                      v26[46] = v65;
                                                                      if (v65) {
                                                                        v26[47] = 0;
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        if (v22)
        {
          id v66 = *(id *)(v22 + *(int *)(v20 + 3884));
          v67 = v66;
          if (v66) {
            v68 = (void *)*((void *)v66 + 2);
          }
          else {
            v68 = 0;
          }
        }
        else
        {
          v67 = 0;
          v68 = 0;
        }
        id v69 = v68;

        if ([v69 UTF8String])
        {
          v70 = (unsigned __int8 *)[v69 UTF8String];
          if (!v70)
          {
            pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
            networkd_settings_init();
            v141 = (id)gLogObj;
            os_log_type_enabled(v141, OS_LOG_TYPE_ERROR);
            *(_DWORD *)buf = 136446210;
            v165 = "_strict_strlcpy";
            LODWORD(v139) = 12;
            v138 = buf;
            v116 = (void *)_os_log_send_and_compose_impl();

            result = (NWPath *)__nwlog_abort((uint64_t)v116);
            if (result) {
              goto LABEL_174;
            }
            free(v116);
          }
          int v71 = *v70;
          v26[48] = v71;
          if (v71)
          {
            int v72 = v70[1];
            v26[49] = v72;
            if (v72)
            {
              int v73 = v70[2];
              v26[50] = v73;
              if (v73)
              {
                int v74 = v70[3];
                v26[51] = v74;
                if (v74)
                {
                  int v75 = v70[4];
                  v26[52] = v75;
                  if (v75)
                  {
                    int v76 = v70[5];
                    v26[53] = v76;
                    if (v76)
                    {
                      int v77 = v70[6];
                      v26[54] = v77;
                      if (v77)
                      {
                        int v78 = v70[7];
                        v26[55] = v78;
                        if (v78)
                        {
                          int v79 = v70[8];
                          v26[56] = v79;
                          if (v79)
                          {
                            int v80 = v70[9];
                            v26[57] = v80;
                            if (v80)
                            {
                              int v81 = v70[10];
                              v26[58] = v81;
                              if (v81)
                              {
                                int v82 = v70[11];
                                v26[59] = v82;
                                if (v82)
                                {
                                  int v83 = v70[12];
                                  v26[60] = v83;
                                  if (v83)
                                  {
                                    int v84 = v70[13];
                                    v26[61] = v84;
                                    if (v84)
                                    {
                                      int v85 = v70[14];
                                      v26[62] = v85;
                                      if (v85)
                                      {
                                        int v86 = v70[15];
                                        v26[63] = v86;
                                        if (v86)
                                        {
                                          int v87 = v70[16];
                                          v26[64] = v87;
                                          if (v87)
                                          {
                                            int v88 = v70[17];
                                            v26[65] = v88;
                                            if (v88)
                                            {
                                              int v89 = v70[18];
                                              v26[66] = v89;
                                              if (v89)
                                              {
                                                int v90 = v70[19];
                                                v26[67] = v90;
                                                if (v90)
                                                {
                                                  int v91 = v70[20];
                                                  v26[68] = v91;
                                                  if (v91)
                                                  {
                                                    int v92 = v70[21];
                                                    v26[69] = v92;
                                                    if (v92)
                                                    {
                                                      int v93 = v70[22];
                                                      v26[70] = v93;
                                                      if (v93)
                                                      {
                                                        int v94 = v70[23];
                                                        v26[71] = v94;
                                                        if (v94)
                                                        {
                                                          int v95 = v70[24];
                                                          v26[72] = v95;
                                                          if (v95)
                                                          {
                                                            int v96 = v70[25];
                                                            v26[73] = v96;
                                                            if (v96)
                                                            {
                                                              int v97 = v70[26];
                                                              v26[74] = v97;
                                                              if (v97)
                                                              {
                                                                int v98 = v70[27];
                                                                v26[75] = v98;
                                                                if (v98)
                                                                {
                                                                  int v99 = v70[28];
                                                                  v26[76] = v99;
                                                                  if (v99)
                                                                  {
                                                                    int v100 = v70[29];
                                                                    v26[77] = v100;
                                                                    if (v100)
                                                                    {
                                                                      int v101 = v70[30];
                                                                      v26[78] = v101;
                                                                      if (v101) {
                                                                        v26[79] = 0;
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        if (v22) {
          v102 = *(void **)(v22 + 24);
        }
        else {
          v102 = 0;
        }
        id v103 = v102;
        if ([v103 UTF8String])
        {
          v104 = (unsigned __int8 *)[v103 UTF8String];
          if (!v104)
          {
            pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
            networkd_settings_init();
            v142 = (id)gLogObj;
            os_log_type_enabled(v142, OS_LOG_TYPE_ERROR);
            *(_DWORD *)buf = 136446210;
            v165 = "_strict_strlcpy";
            LODWORD(v139) = 12;
            v138 = buf;
            v140 = (void *)_os_log_send_and_compose_impl();

            result = (NWPath *)__nwlog_abort((uint64_t)v140);
            if (result)
            {
LABEL_174:
              __break(1u);
              return result;
            }
            free(v140);
          }
          v105 = v26 + 80;
          uint64_t v106 = 128;
          while (1)
          {
            int v107 = *v104;
            unsigned char *v105 = v107;
            if (!v107) {
              break;
            }
            ++v105;
            ++v104;
            if ((unint64_t)--v106 <= 1)
            {
              unsigned char *v105 = 0;
              break;
            }
          }
        }
        if (v22)
        {
          if (*(unsigned char *)(v22 + 40)) {
            *((_DWORD *)v26 + 52) |= 2u;
          }
          if (*(unsigned char *)(v22 + 43)) {
            *((_DWORD *)v26 + 52) |= 8u;
          }
          if (*(unsigned char *)(v22 + 44)) {
            *((_DWORD *)v26 + 52) |= 0x10u;
          }
          if (*(unsigned char *)(v22 + 41)) {
            *((_DWORD *)v26 + 52) |= 0x40u;
          }
          if (*(unsigned char *)(v22 + 42)) {
            *((_DWORD *)v26 + 52) |= 0x80u;
          }
          *((_DWORD *)v26 + 53) = v25;
          if (!v25) {
            goto LABEL_125;
          }
          v108 = *(void **)(v22 + 16);
        }
        else
        {
          *((_DWORD *)v26 + 53) = v25;
          if (!v25) {
            goto LABEL_125;
          }
          v108 = 0;
        }
        id v109 = v108;
        [v109 getBytes:v26 + 216 length:v25];

LABEL_125:
        xpc_dictionary_set_data(v29, "data", v26, length);
        free(v26);
        v110 = (const char *)[v28 UTF8String];
        if (v110) {
          xpc_dictionary_set_value(xdict, v110, v29);
        }

        ++v21;
        unint64_t v20 = 0x1E8F5F000uLL;
        if (v21 == v153)
        {
          uint64_t v153 = [(NSMutableArray *)obj countByEnumeratingWithState:&v157 objects:v162 count:16];
          if (!v153) {
            break;
          }
          goto LABEL_18;
        }
      }
    }

    uint64_t v5 = v143;
  }
  else
  {
    xpc_object_t xdict = 0;
  }
  endpoint = v5->_endpoint;
  if (endpoint)
  {
    v118 = endpoint;
    v119 = [(NWPBEndpoint *)v118 data];
    v120 = +[NWEndpoint endpointWithProtocolBufferData:v119];
  }
  else
  {
    v120 = 0;
  }
  parameters = v5->_parameters;
  if (parameters)
  {
    v122 = parameters;
    v123 = [(NWPBParameters *)v122 data];
    v124 = +[NWParameters parametersWithProtocolBufferData:v123];
  }
  else
  {
    v124 = 0;
  }
  v152 = objc_msgSend(v120, "internalEndpoint", v138, v139);
  id obja = [v124 internalParameters];
  v154 = v124;
  lengtha = v120;
  if (*(unsigned char *)&v5->_has) {
    int status = v5->_status;
  }
  else {
    int status = 0;
  }
  int direct = v5->_direct;
  int local = v5->_local;
  ipBOOL v4 = v5->_ipv4;
  ipid v6 = v5->_ipv6;
  v129 = [v147 internalInterface];
  v130 = [v146 internalInterface];
  v131 = nw_path_create_static(v152, obja, status, uu, direct, local, ipv4, ipv6, v129, v130, xdict);

  v132 = [[NWPath alloc] initWithPath:v131];
  uint64_t v11 = v145;
LABEL_163:

  return v132;
}

+ (id)createStringFromStatus:(int64_t)a3
{
  if ((unint64_t)a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"unknown(%ld)", a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5242960[a3];
  }

  return v3;
}

+ (id)pathForClientID:(id)a3 parametersTLV:(id)a4 pathResultTLV:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  memset(uu, 0, sizeof(uu));
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uuid_clear(uu);
  [v9 getUUIDBytes:uu];

  if (nw_context_copy_implicit_context::onceToken != -1) {
    dispatch_once(&nw_context_copy_implicit_context::onceToken, &__block_literal_global_18);
  }
  id v10 = (id)nw_context_copy_implicit_context::implicit_context;
  uint64_t v11 = nw_path_copy_path_for_tlv(uu, v10, [v8 bytes], objc_msgSend(v8, "length"), objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));

  if (v11) {
    id v12 = [[NWPath alloc] initWithPath:v11];
  }
  else {
    id v12 = 0;
  }

  return v12;
}

+ (id)pathForClientID:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  memset(uu, 0, sizeof(uu));
  id v3 = a3;
  uuid_clear(uu);
  [v3 getUUIDBytes:uu];

  if (nw_context_copy_implicit_context::onceToken != -1) {
    dispatch_once(&nw_context_copy_implicit_context::onceToken, &__block_literal_global_18);
  }
  id v4 = (id)nw_context_copy_implicit_context::implicit_context;
  BOOL v5 = nw_path_copy_path_for_client_with_context((uint64_t)uu);

  if (v5) {
    id v6 = [[NWPath alloc] initWithPath:v5];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

+ (id)allClientIDs
{
  xpc_object_t v2 = nw_path_copy_all_client_ids();
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CA48] array];
    size_t count = xpc_array_get_count(v2);
    if (count)
    {
      size_t v5 = count;
      for (size_t i = 0; i != v5; ++i)
      {
        id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", xpc_array_get_uuid(v2, i));
        if (v7) {
          [v3 addObject:v7];
        }
      }
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

@end