@interface NWParameters
+ (BOOL)supportsSecureCoding;
+ (NWParameters)parametersWithCParameters:(id)a3;
+ (NWParameters)parametersWithProtocolBufferData:(id)a3;
- (BOOL)allowDuplicateStateUpdates;
- (BOOL)allowJoiningConnectedFd;
- (BOOL)allowSocketAccess;
- (BOOL)allowUnusableAddresses;
- (BOOL)attachProtocolListener;
- (BOOL)copyEffectiveAuditToken:(id *)a3;
- (BOOL)disableNagleAlgorithm;
- (BOOL)enableTFO;
- (BOOL)enableTFONoCookie;
- (BOOL)enableTLS;
- (BOOL)fastOpenForceEnable;
- (BOOL)hasDelegatedPIDForOriginatingPID:(int)a3;
- (BOOL)hasDelegatedProcessUUID;
- (BOOL)hasNonEmptyProxyConfiguration;
- (BOOL)hasPreferredNetworkAgents;
- (BOOL)hasProhibitedNetworkAgents;
- (BOOL)hasRequiredNetworkAgents;
- (BOOL)httpsProxyIsOpaque;
- (BOOL)httpsProxyOverTLS;
- (BOOL)ignoreResolverStats;
- (BOOL)indefinite;
- (BOOL)isDiscretionary;
- (BOOL)isDryRun;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)keepAlive;
- (BOOL)keepAliveOffload;
- (BOOL)multipath;
- (BOOL)multipathForceEnable;
- (BOOL)noProxy;
- (BOOL)preferNoProxy;
- (BOOL)prohibitCellular;
- (BOOL)prohibitConstrainedPaths;
- (BOOL)prohibitExpensivePaths;
- (BOOL)prohibitFallback;
- (BOOL)prohibitJoiningProtocols;
- (BOOL)prohibitRoaming;
- (BOOL)reduceBuffering;
- (BOOL)resolvePTR;
- (BOOL)reuseLocalAddress;
- (BOOL)trustInvalidCertificates;
- (BOOL)useAWDL;
- (BOOL)useLongOutstandingQueries;
- (BOOL)useP2P;
- (NSArray)parentIDs;
- (NSArray)protocolTransforms;
- (NSData)TLSSessionID;
- (NSData)metadata;
- (NSDictionary)proxyConfiguration;
- (NSSet)SSLCipherSuitesInternal;
- (NSString)account;
- (NSString)effectiveBundleID;
- (NSString)privateDescription;
- (NSURL)sanitizedURL;
- (NSURL)url;
- (NSUUID)effectiveProcessUUID;
- (NSUUID)parentID;
- (NSUUID)processUUID;
- (NWAddressEndpoint)localAddress;
- (NWInterface)requiredInterface;
- (NWParameters)init;
- (NWParameters)initWithCoder:(id)a3;
- (NWParameters)initWithParameters:(id)a3;
- (OS_nw_parameters)internalParameters;
- (id)copyCParameters;
- (id)copyRequiredAgentsDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createProtocolBufferObject;
- (id)description;
- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4;
- (int)multipathService;
- (int)pid;
- (int64_t)requiredCompanionProxyInterfaceType;
- (int64_t)requiredInterfaceSubtype;
- (int64_t)requiredInterfaceType;
- (unint64_t)dataMode;
- (unint64_t)hash;
- (unint64_t)keepAliveIdleTime;
- (unint64_t)keepAliveInterval;
- (unint64_t)maximumSSLProtocolVersionInternal;
- (unint64_t)minimumSSLProtocolVersionInternal;
- (unint64_t)trafficClass;
- (unsigned)ipProtocol;
- (unsigned)requiredAddressFamily;
- (unsigned)tlsVersionWithSSLProtocol:(int)a3;
- (unsigned)transportProtocol;
- (unsigned)uid;
- (void)avoidNetworkAgentWithDomain:(id)a3 type:(id)a4;
- (void)avoidNetworkAgentWithUUID:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)preferNetworkAgentWithDomain:(id)a3 type:(id)a4;
- (void)preferNetworkAgentWithUUID:(id)a3;
- (void)prohibitInterface:(id)a3;
- (void)prohibitInterfaceSubtype:(int64_t)a3;
- (void)prohibitInterfaceType:(int64_t)a3;
- (void)prohibitNetworkAgentWithUUID:(id)a3;
- (void)prohibitNetworkAgentsWithDomain:(id)a3 type:(id)a4;
- (void)requireNetworkAgentWithDomain:(id)a3 type:(id)a4;
- (void)requireNetworkAgentWithUUID:(id)a3;
- (void)setAccount:(id)a3;
- (void)setAllowDuplicateStateUpdates:(BOOL)a3;
- (void)setAllowJoiningConnectedFd:(BOOL)a3;
- (void)setAllowSocketAccess:(BOOL)a3;
- (void)setAllowUnusableAddresses:(BOOL)a3;
- (void)setAttachProtocolListener:(BOOL)a3;
- (void)setDataMode:(unint64_t)a3;
- (void)setDisableNagleAlgorithm:(BOOL)a3;
- (void)setDiscretionary:(BOOL)a3;
- (void)setEffectiveBundleID:(id)a3;
- (void)setEffectiveProcessUUID:(id)a3;
- (void)setEnableTFO:(BOOL)a3;
- (void)setEnableTFONoCookie:(BOOL)a3;
- (void)setEnableTLS:(BOOL)a3;
- (void)setFastOpenForceEnable:(BOOL)a3;
- (void)setHttpsProxyIsOpaque:(BOOL)a3;
- (void)setHttpsProxyOverTLS:(BOOL)a3;
- (void)setIgnoreResolverStats:(BOOL)a3;
- (void)setIndefinite:(BOOL)a3;
- (void)setInitialDataPayload:(id)a3;
- (void)setInternalParameters:(id)a3;
- (void)setKeepAlive:(BOOL)a3;
- (void)setKeepAliveIdleTime:(unint64_t)a3;
- (void)setKeepAliveInterval:(unint64_t)a3;
- (void)setKeepAliveOffload:(BOOL)a3;
- (void)setLocalAddress:(id)a3;
- (void)setMaximumSSLProtocolVersion:(unint64_t)a3;
- (void)setMaximumSSLProtocolVersionInternal:(unint64_t)a3;
- (void)setMetadata:(id)a3;
- (void)setMinimumSSLProtocolVersion:(unint64_t)a3;
- (void)setMinimumSSLProtocolVersionInternal:(unint64_t)a3;
- (void)setMultipath:(BOOL)a3;
- (void)setMultipathForceEnable:(BOOL)a3;
- (void)setMultipathService:(int)a3;
- (void)setNoProxy:(BOOL)a3;
- (void)setParentID:(id)a3;
- (void)setPid:(int)a3;
- (void)setPreferNoProxy:(BOOL)a3;
- (void)setProcessUUID:(id)a3;
- (void)setProhibitConstrainedPaths:(BOOL)a3;
- (void)setProhibitExpensivePaths:(BOOL)a3;
- (void)setProhibitFallback:(BOOL)a3;
- (void)setProhibitJoiningProtocols:(BOOL)a3;
- (void)setProhibitRoaming:(BOOL)a3;
- (void)setProtocolAtLevel:(unint64_t)a3 protocol:(nw_protocol_identifier *)a4;
- (void)setProtocolTransforms:(id)a3;
- (void)setProxyConfiguration:(id)a3;
- (void)setReduceBuffering:(BOOL)a3;
- (void)setRequiredAddressFamily:(unsigned __int8)a3;
- (void)setRequiredCompanionProxyInterfaceType:(int64_t)a3;
- (void)setRequiredInterface:(id)a3;
- (void)setRequiredInterfaceSubtype:(int64_t)a3;
- (void)setRequiredInterfaceType:(int64_t)a3;
- (void)setResolvePTR:(BOOL)a3;
- (void)setReuseLocalAddress:(BOOL)a3;
- (void)setSSLCipherSuites:(id)a3;
- (void)setSSLCipherSuitesInternal:(id)a3;
- (void)setSourceApplicationWithBundleID:(id)a3;
- (void)setSourceApplicationWithToken:(id *)a3;
- (void)setTLSSessionID:(id)a3;
- (void)setTrafficClass:(unint64_t)a3;
- (void)setTrustInvalidCertificates:(BOOL)a3;
- (void)setUid:(unsigned int)a3;
- (void)setUrl:(id)a3;
- (void)setUseAWDL:(BOOL)a3;
- (void)setUseLongOutstandingQueries:(BOOL)a3;
- (void)setUseP2P:(BOOL)a3;
@end

@implementation NWParameters

- (BOOL)prohibitRoaming
{
  v2 = [(NWParameters *)self internalParameters];
  char prohibit_roaming = nw_parameters_get_prohibit_roaming(v2);

  return prohibit_roaming;
}

- (unint64_t)dataMode
{
  v2 = [(NWParameters *)self internalParameters];
  unint64_t data_mode = nw_parameters_get_data_mode(v2);

  return data_mode;
}

- (unsigned)requiredAddressFamily
{
  v2 = [(NWParameters *)self internalParameters];
  unsigned __int8 required_address_family = nw_parameters_get_required_address_family(v2);

  return required_address_family;
}

- (BOOL)prohibitConstrainedPaths
{
  v2 = [(NWParameters *)self internalParameters];
  BOOL prohibit_constrained = nw_parameters_get_prohibit_constrained(v2);

  return prohibit_constrained;
}

- (BOOL)enableTLS
{
  v2 = [(NWParameters *)self internalParameters];
  char tls = nw_parameters_get_tls(v2);

  return tls;
}

- (BOOL)reuseLocalAddress
{
  v2 = [(NWParameters *)self internalParameters];
  BOOL reuse_local_address = nw_parameters_get_reuse_local_address(v2);

  return reuse_local_address;
}

- (int64_t)requiredCompanionProxyInterfaceType
{
  v2 = [(NWParameters *)self internalParameters];
  int64_t next_hop_required_interface_type = nw_parameters_get_next_hop_required_interface_type(v2);

  return next_hop_required_interface_type;
}

- (BOOL)isDryRun
{
  v2 = [(NWParameters *)self internalParameters];
  char dry_run = nw_parameters_get_dry_run(v2);

  return dry_run;
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v8 = [(NWParameters *)self processUUID];
  [v7 appendPrettyObject:v8 withName:@"processUUID" indent:v5 showFullContent:v4];

  v9 = [(NWParameters *)self effectiveProcessUUID];
  [v7 appendPrettyObject:v9 withName:@"effectiveProcessUUID" indent:v5 showFullContent:v4];

  v10 = [(NWParameters *)self effectiveBundleID];
  [v7 appendPrettyObject:v10 withName:@"effectiveBundleID" indent:v5 showFullContent:v4];

  objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWParameters pid](self, "pid"), @"pid", v5);
  objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWParameters uid](self, "uid"), @"uid", v5);
  v11 = [(NWParameters *)self account];
  [v7 appendPrettyObject:v11 withName:@"account" indent:v5 showFullContent:v4];

  v12 = [(NWParameters *)self url];
  [v7 appendPrettyObject:v12 withName:@"url" indent:v5 showFullContent:v4];

  v13 = [(NWParameters *)self sanitizedURL];
  [v7 appendPrettyObject:v13 withName:@"sanitizedURL" indent:v5 showFullContent:v4];

  if ([(NWParameters *)self dataMode] == 1)
  {
    v14 = @"Datagram";
  }
  else
  {
    if ([(NWParameters *)self dataMode] != 2) {
      goto LABEL_6;
    }
    v14 = @"Stream";
  }
  [v7 appendPrettyObject:v14 withName:@"dataMode" indent:v5 showFullContent:v4];
LABEL_6:
  v15 = [(NWParameters *)self internalParameters];
  int is_known_tracker = nw_parameters_get_is_known_tracker(v15);

  if (is_known_tracker) {
    [v7 appendPrettyBOOL:1 withName:@"knownTracker" indent:v5];
  }
  v17 = [(NWParameters *)self internalParameters];
  int is_third_party_web_content = nw_parameters_is_third_party_web_content(v17);

  if (is_third_party_web_content) {
    [v7 appendPrettyBOOL:1 withName:@"thirdPartyWebContent" indent:v5];
  }
  v19 = [(NWParameters *)self internalParameters];
  int is_approved_app_domain = nw_parameters_is_approved_app_domain(v19);

  if (is_approved_app_domain) {
    [v7 appendPrettyBOOL:1 withName:@"approvedAppDomain" indent:v5];
  }
  v21 = [(NWParameters *)self protocolTransforms];
  [v7 appendPrettyObject:v21 withName:@"protocolTransforms" indent:v5 showFullContent:v4];

  if ([(NWParameters *)self isDryRun]) {
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWParameters isDryRun](self, "isDryRun"), @"isDryRun", v5);
  }
  if ([(NWParameters *)self trafficClass]) {
    objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWParameters trafficClass](self, "trafficClass"), @"trafficClass", v5);
  }
  if ([(NWParameters *)self ipProtocol]) {
    objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWParameters ipProtocol](self, "ipProtocol"), @"ipProtocol", v5);
  }
  if ([(NWParameters *)self transportProtocol]) {
    objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWParameters transportProtocol](self, "transportProtocol"), @"transportProtocol", v5);
  }
  if ([(NWParameters *)self requiredAddressFamily]) {
    objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWParameters requiredAddressFamily](self, "requiredAddressFamily"), @"requiredAddressFamily", v5);
  }
  v22 = [(NWParameters *)self internalParameters];
  nw_endpoint_t v23 = nw_parameters_copy_local_endpoint(v22);

  if (v23)
  {
    v24 = [(NWParameters *)self localAddress];
    [v7 appendPrettyObject:v24 withName:@"localAddress" indent:v5 showFullContent:v4];
  }
  if ([(NWParameters *)self reuseLocalAddress]) {
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWParameters reuseLocalAddress](self, "reuseLocalAddress"), @"reuseLocalAddress", v5);
  }
  v25 = [(NWParameters *)self requiredInterface];
  [v7 appendPrettyObject:v25 withName:@"requiredInterface" indent:v5 showFullContent:v4];

  if ([(NWParameters *)self requiredInterfaceType])
  {
    v26 = +[NWInterface descriptionForType:[(NWParameters *)self requiredInterfaceType]];
    [v7 appendPrettyObject:v26 withName:@"requiredInterfaceType" indent:v5 showFullContent:1];
  }
  if ([(NWParameters *)self requiredCompanionProxyInterfaceType])
  {
    v27 = +[NWInterface descriptionForType:[(NWParameters *)self requiredCompanionProxyInterfaceType]];
    [v7 appendPrettyObject:v27 withName:@"requiredCompanionInterfaceType" indent:v5 showFullContent:1];
  }
  v28 = [(NWParameters *)self internalParameters];
  BOOL has_prohibited_interface_types = nw_parameters_has_prohibited_interface_types(v28);

  if (has_prohibited_interface_types)
  {
    v30 = [(NWParameters *)self internalParameters];
    id v31 = nw_parameters_copy_prohibited_interface_types(v30);

    if (v31)
    {
      v32 = (void *)MEMORY[0x185319370](v31);
      v33 = [NSString stringWithUTF8String:v32];
      [v7 appendPrettyObject:v33 withName:@"prohibitedInterfaceTypes" indent:v5 showFullContent:1];

      if (v32) {
        free(v32);
      }
    }
  }
  v34 = [(NWParameters *)self internalParameters];
  BOOL has_prohibited_interface_subtypes = nw_parameters_has_prohibited_interface_subtypes(v34);

  if (has_prohibited_interface_subtypes)
  {
    v36 = [(NWParameters *)self internalParameters];
    id v37 = nw_parameters_copy_prohibited_interface_subtypes(v36);

    if (v37)
    {
      v38 = (void *)MEMORY[0x185319370](v37);
      v39 = [NSString stringWithUTF8String:v38];
      [v7 appendPrettyObject:v39 withName:@"prohibitedInterfaceSubtypes" indent:v5 showFullContent:1];

      if (v38) {
        free(v38);
      }
    }
  }
  v40 = [(NWParameters *)self internalParameters];
  BOOL has_preferred_interface_subtypes = nw_parameters_has_preferred_interface_subtypes(v40);

  if (has_preferred_interface_subtypes)
  {
    v42 = [(NWParameters *)self internalParameters];
    id v43 = nw_parameters_copy_preferred_interface_subtypes(v42);

    if (v43)
    {
      v44 = (void *)MEMORY[0x185319370](v43);
      v45 = [NSString stringWithUTF8String:v44];
      [v7 appendPrettyObject:v45 withName:@"preferredInterfaceSubtypes" indent:v5 showFullContent:1];

      if (v44) {
        free(v44);
      }
    }
  }
  v46 = [(NWParameters *)self internalParameters];
  BOOL has_preferred_netagents = nw_parameters_has_preferred_netagents(v46);

  if (has_preferred_netagents)
  {
    v48 = [(NWParameters *)self internalParameters];
    xpc_object_t v49 = nw_parameters_copy_preferred_netagent_domains(v48);

    if (v49)
    {
      v50 = (void *)MEMORY[0x185319370](v49);
      v51 = [NSString stringWithUTF8String:v50];
      [v7 appendPrettyObject:v51 withName:@"preferredNetworkAgentDomains" indent:v5 showFullContent:1];

      if (v50) {
        free(v50);
      }
    }
    v52 = [(NWParameters *)self internalParameters];
    xpc_object_t v53 = nw_parameters_copy_preferred_netagent_types(v52);

    if (v53)
    {
      v54 = (void *)MEMORY[0x185319370](v53);
      v55 = [NSString stringWithUTF8String:v54];
      [v7 appendPrettyObject:v55 withName:@"preferredNetworkAgentTypes" indent:v5 showFullContent:1];

      if (v54) {
        free(v54);
      }
    }
    v56 = [(NWParameters *)self internalParameters];
    id v57 = nw_parameters_copy_preferred_netagent_uuids(v56);

    if (v57)
    {
      v58 = (void *)MEMORY[0x185319370](v57);
      v59 = [NSString stringWithUTF8String:v58];
      [v7 appendPrettyObject:v59 withName:@"preferredNetworkAgentUUIDs" indent:v5 showFullContent:1];

      if (v58) {
        free(v58);
      }
    }
  }
  v60 = [(NWParameters *)self internalParameters];
  BOOL has_required_netagents = nw_parameters_has_required_netagents(v60);

  if (has_required_netagents)
  {
    v62 = [(NWParameters *)self internalParameters];
    id v63 = nw_parameters_copy_required_netagent_domains(v62);

    if (v63)
    {
      v64 = (void *)MEMORY[0x185319370](v63);
      v65 = [NSString stringWithUTF8String:v64];
      [v7 appendPrettyObject:v65 withName:@"requiredNetworkAgentDomains" indent:v5 showFullContent:1];

      if (v64) {
        free(v64);
      }
    }
    v66 = [(NWParameters *)self internalParameters];
    id v67 = nw_parameters_copy_required_netagent_types(v66);

    if (v67)
    {
      v68 = (void *)MEMORY[0x185319370](v67);
      v69 = [NSString stringWithUTF8String:v68];
      [v7 appendPrettyObject:v69 withName:@"requiredNetworkAgentTypes" indent:v5 showFullContent:1];

      if (v68) {
        free(v68);
      }
    }
    v70 = [(NWParameters *)self internalParameters];
    id v71 = nw_parameters_copy_required_netagent_uuids(v70);

    if (v71)
    {
      v72 = (void *)MEMORY[0x185319370](v71);
      v73 = [NSString stringWithUTF8String:v72];
      [v7 appendPrettyObject:v73 withName:@"requiredNetworkAgentUUIDs" indent:v5 showFullContent:1];

      if (v72) {
        free(v72);
      }
    }
  }
  v74 = [(NWParameters *)self internalParameters];
  BOOL has_prohibited_netagents = nw_parameters_has_prohibited_netagents(v74);

  if (has_prohibited_netagents)
  {
    v76 = [(NWParameters *)self internalParameters];
    id v77 = nw_parameters_copy_prohibited_netagent_domains(v76);

    if (v77)
    {
      v78 = (void *)MEMORY[0x185319370](v77);
      v79 = [NSString stringWithUTF8String:v78];
      [v7 appendPrettyObject:v79 withName:@"prohibitedNetworkAgentDomains" indent:v5 showFullContent:1];

      if (v78) {
        free(v78);
      }
    }
    v80 = [(NWParameters *)self internalParameters];
    id v81 = nw_parameters_copy_prohibited_netagent_types(v80);

    if (v81)
    {
      v82 = (void *)MEMORY[0x185319370](v81);
      v83 = [NSString stringWithUTF8String:v82];
      [v7 appendPrettyObject:v83 withName:@"prohibitedNetworkAgentTypes" indent:v5 showFullContent:1];

      if (v82) {
        free(v82);
      }
    }
    v84 = [(NWParameters *)self internalParameters];
    id v85 = nw_parameters_copy_prohibited_netagent_uuids(v84);

    if (v85)
    {
      v86 = (void *)MEMORY[0x185319370](v85);
      v87 = [NSString stringWithUTF8String:v86];
      [v7 appendPrettyObject:v87 withName:@"prohibitedNetworkAgentUUIDs" indent:v5 showFullContent:1];

      if (v86) {
        free(v86);
      }
    }
  }
  if ([(NWParameters *)self prohibitExpensivePaths]) {
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWParameters prohibitExpensivePaths](self, "prohibitExpensivePaths"), @"prohibitExpensivePaths", v5);
  }
  if ([(NWParameters *)self prohibitConstrainedPaths]) {
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWParameters prohibitConstrainedPaths](self, "prohibitConstrainedPaths"), @"prohibitConstrainedPaths", v5);
  }
  if ([(NWParameters *)self prohibitRoaming]) {
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWParameters prohibitRoaming](self, "prohibitRoaming"), @"prohibitRoaming", v5);
  }
  if ([(NWParameters *)self enableTFO]) {
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWParameters enableTFO](self, "enableTFO"), @"enableTFO", v5);
  }
  if ([(NWParameters *)self disableNagleAlgorithm]) {
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWParameters disableNagleAlgorithm](self, "disableNagleAlgorithm"), @"disableNagleAlgorithm", v5);
  }
  if ([(NWParameters *)self useLongOutstandingQueries]) {
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWParameters useLongOutstandingQueries](self, "useLongOutstandingQueries"), @"useLongOutstandingQueries", v5);
  }
  if ([(NWParameters *)self resolvePTR]) {
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWParameters resolvePTR](self, "resolvePTR"), @"resolvePTR", v5);
  }
  if ([(NWParameters *)self useAWDL]) {
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWParameters useAWDL](self, "useAWDL"), @"useAWDL", v5);
  }
  if ([(NWParameters *)self useP2P]) {
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWParameters useP2P](self, "useP2P"), @"useP2P", v5);
  }
  if ([(NWParameters *)self multipathService]) {
    objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWParameters multipathService](self, "multipathService"), @"multipathService", v5);
  }
  if ([(NWParameters *)self enableTLS]) {
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWParameters enableTLS](self, "enableTLS"), @"enableTLS", v5);
  }
  v88 = [(NWParameters *)self TLSSessionID];
  [v7 appendPrettyObject:v88 withName:@"TLSSessionID" indent:v5 showFullContent:v4];

  v89 = [(NWParameters *)self internalParameters];
  LODWORD(v88) = nw_parameters_has_initial_data_payload(v89);

  if (v88)
  {
    v90 = [(NWParameters *)self internalParameters];
    v91 = nw_parameters_copy_initial_data_payload(v90);

    v92 = objc_msgSend(NSString, "stringWithFormat:", @"[%zu bytes]", dispatch_data_get_size(v91));
    [v7 appendPrettyObject:v92 withName:@"initialDataPayload" indent:v5 showFullContent:1];
  }
  if ([(NWParameters *)self trustInvalidCertificates]) {
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWParameters trustInvalidCertificates](self, "trustInvalidCertificates"), @"trustInvalidCertificates", v5);
  }
  v93 = [(NWParameters *)self internalParameters];
  uint64_t fallback_mode = nw_parameters_get_fallback_mode(v93);

  if (fallback_mode) {
    [v7 appendPrettyInt:fallback_mode withName:@"fallbackMode" indent:v5];
  }
  v95 = [(NWParameters *)self internalParameters];
  int include_ble = nw_parameters_get_include_ble(v95);

  if (include_ble) {
    [v7 appendPrettyBOOL:1 withName:@"includeBle" indent:v5];
  }
  v97 = [(NWParameters *)self internalParameters];
  int include_screen_off_devices = nw_parameters_get_include_screen_off_devices(v97);

  if (include_screen_off_devices) {
    [v7 appendPrettyBOOL:1 withName:@"includeScreenOff" indent:v5];
  }
  v99 = [NSString stringWithString:v7];

  return v99;
}

- (id)copyCParameters
{
  id v2 = [(NWParameters *)self internalParameters];
  BOOL v3 = -[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]((id *)[NWConcrete_nw_parameters alloc], v2, 0, 0);

  return (id)v3;
}

- (OS_nw_parameters)internalParameters
{
  return (OS_nw_parameters *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)trafficClass
{
  id v2 = [(NWParameters *)self internalParameters];
  unint64_t traffic_class = nw_parameters_get_traffic_class(v2);

  return traffic_class;
}

- (BOOL)useP2P
{
  id v2 = [(NWParameters *)self internalParameters];
  char use_p2p = nw_parameters_get_use_p2p(v2);

  return use_p2p;
}

- (BOOL)useAWDL
{
  id v2 = [(NWParameters *)self internalParameters];
  char use_awdl = nw_parameters_get_use_awdl(v2);

  return use_awdl;
}

- (unsigned)uid
{
  id v2 = [(NWParameters *)self internalParameters];
  unsigned int uid = nw_parameters_get_uid(v2);

  return uid;
}

- (BOOL)trustInvalidCertificates
{
  id v2 = [(NWParameters *)self internalParameters];
  char should_trust_invalid_certificates = nw_parameters_get_should_trust_invalid_certificates(v2);

  return should_trust_invalid_certificates;
}

- (unsigned)transportProtocol
{
  id v2 = [(NWParameters *)self internalParameters];
  unsigned __int8 upper_transport_protocol = nw_parameters_get_upper_transport_protocol(v2);

  return upper_transport_protocol;
}

- (NWInterface)requiredInterface
{
  id v2 = [(NWParameters *)self internalParameters];
  nw_interface_t v3 = nw_parameters_copy_required_interface(v2);

  if (v3) {
    BOOL v4 = [[NWInterface alloc] initWithInterface:v3];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (int64_t)requiredInterfaceType
{
  id v2 = [(NWParameters *)self internalParameters];
  int64_t required_interface_type = nw_parameters_get_required_interface_type(v2);

  return required_interface_type;
}

- (BOOL)prohibitExpensivePaths
{
  id v2 = [(NWParameters *)self internalParameters];
  BOOL prohibit_expensive = nw_parameters_get_prohibit_expensive(v2);

  return prohibit_expensive;
}

- (int)pid
{
  id v2 = [(NWParameters *)self internalParameters];
  int pid = nw_parameters_get_pid(v2);

  return pid;
}

- (unsigned)ipProtocol
{
  id v2 = [(NWParameters *)self internalParameters];
  unsigned __int8 ip_protocol = nw_parameters_get_ip_protocol(v2);

  return ip_protocol;
}

- (NSString)effectiveBundleID
{
  id v2 = [(NWParameters *)self internalParameters];
  uint64_t effective_bundle_id = nw_parameters_get_effective_bundle_id(v2);

  if (effective_bundle_id)
  {
    BOOL v4 = [NSString stringWithUTF8String:effective_bundle_id];
  }
  else
  {
    BOOL v4 = 0;
  }

  return (NSString *)v4;
}

- (int)multipathService
{
  id v2 = [(NWParameters *)self internalParameters];
  nw_multipath_service_t multipath_service = nw_parameters_get_multipath_service(v2);

  return multipath_service;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SSLCipherSuitesInternal, 0);

  objc_storeStrong((id *)&self->_internalParameters, 0);
}

- (BOOL)useLongOutstandingQueries
{
  id v2 = [(NWParameters *)self internalParameters];
  char use_long_outstanding_queries = nw_parameters_get_use_long_outstanding_queries(v2);

  return use_long_outstanding_queries;
}

- (NSUUID)effectiveProcessUUID
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  memset(uu, 0, sizeof(uu));
  uuid_clear(uu);
  nw_interface_t v3 = [(NWParameters *)self internalParameters];
  nw_parameters_get_e_proc_uuid(v3, uu);

  int is_null = uuid_is_null(uu);
  uint64_t v5 = 0;
  if (!is_null) {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:uu];
  }

  return (NSUUID *)v5;
}

- (NSUUID)processUUID
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  memset(uu, 0, sizeof(uu));
  uuid_clear(uu);
  nw_interface_t v3 = [(NWParameters *)self internalParameters];
  nw_parameters_get_proc_uuid(v3, uu);

  int is_null = uuid_is_null(uu);
  uint64_t v5 = 0;
  if (!is_null) {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:uu];
  }

  return (NSUUID *)v5;
}

- (BOOL)disableNagleAlgorithm
{
  id v2 = [(NWParameters *)self internalParameters];
  BOOL no_delay = nw_parameters_get_no_delay(v2);

  return no_delay;
}

- (BOOL)enableTFO
{
  id v2 = [(NWParameters *)self internalParameters];
  BOOL tfo = nw_parameters_get_tfo(v2);

  return tfo;
}

- (NSString)account
{
  id v2 = [(NWParameters *)self internalParameters];
  uint64_t account_id = nw_parameters_get_account_id(v2);

  if (account_id)
  {
    BOOL v4 = [NSString stringWithUTF8String:account_id];
  }
  else
  {
    BOOL v4 = 0;
  }

  return (NSString *)v4;
}

- (id)description
{
  id v2 = [(NWParameters *)self descriptionWithIndent:0 showFullContent:0];

  return v2;
}

- (NSURL)url
{
  id v2 = [(NWParameters *)self internalParameters];
  url = (void *)nw_parameters_get_url(v2);

  if (url)
  {
    BOOL v4 = (void *)MEMORY[0x1E4F1CB10];
    BOOL v5 = nw_nsstring((uint64_t)url);
    url = [v4 URLWithString:v5];
  }

  return (NSURL *)url;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(NWParameters *)self internalParameters];
  xpc_object_t v6 = nw_parameters_copy_dictionary(v5);

  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA60];
    id v8 = v6;
    v9 = [v7 dictionary];
    *(void *)applier = MEMORY[0x1E4F143A8];
    *(void *)&applier[8] = 3221225472;
    *(void *)&applier[16] = __NWUtilsCreateNSDictionaryFromXPCDictionary_block_invoke;
    v34 = &unk_1E52480D0;
    id v10 = v9;
    id v35 = v10;
    xpc_dictionary_apply(v8, applier);

    if (v10)
    {
      [v4 encodeObject:v10 forKey:@"dictionary"];
LABEL_39:

      goto LABEL_40;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v16 = (id)gLogObj;
    *(_DWORD *)applier = 136446210;
    *(void *)&applier[4] = "-[NWParameters encodeWithCoder:]";
    v17 = (void *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v31 = 0;
    if (!__nwlog_fault((const char *)v17, &type, &v31))
    {
LABEL_37:
      if (v17) {
        free(v17);
      }
      goto LABEL_39;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v18 = (id)gLogObj;
      os_log_type_t v19 = type;
      if (os_log_type_enabled(v18, type))
      {
        *(_DWORD *)applier = 136446210;
        *(void *)&applier[4] = "-[NWParameters encodeWithCoder:]";
        v20 = "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed";
LABEL_34:
        v29 = v18;
        os_log_type_t v30 = v19;
LABEL_35:
        _os_log_impl(&dword_1830D4000, v29, v30, v20, applier, 0xCu);
      }
    }
    else
    {
      if (v31)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v18 = (id)gLogObj;
        os_log_type_t v25 = type;
        BOOL v26 = os_log_type_enabled(v18, type);
        if (backtrace_string)
        {
          if (v26)
          {
            *(_DWORD *)applier = 136446466;
            *(void *)&applier[4] = "-[NWParameters encodeWithCoder:]";
            *(_WORD *)&applier[12] = 2082;
            *(void *)&applier[14] = backtrace_string;
            _os_log_impl(&dword_1830D4000, v18, v25, "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed, dumping backtrace:%{public}s", applier, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_37;
        }
        if (!v26) {
          goto LABEL_36;
        }
        *(_DWORD *)applier = 136446210;
        *(void *)&applier[4] = "-[NWParameters encodeWithCoder:]";
        v20 = "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed, no backtrace";
        v29 = v18;
        os_log_type_t v30 = v25;
        goto LABEL_35;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v18 = (id)gLogObj;
      os_log_type_t v19 = type;
      if (os_log_type_enabled(v18, type))
      {
        *(_DWORD *)applier = 136446210;
        *(void *)&applier[4] = "-[NWParameters encodeWithCoder:]";
        v20 = "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed, backtrace limit exceeded";
        goto LABEL_34;
      }
    }
LABEL_36:

    goto LABEL_37;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v11 = (id)gLogObj;
  *(_DWORD *)applier = 136446210;
  *(void *)&applier[4] = "-[NWParameters encodeWithCoder:]";
  v12 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v31 = 0;
  if (!__nwlog_fault(v12, &type, &v31)) {
    goto LABEL_17;
  }
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v13 = (id)gLogObj;
    os_log_type_t v14 = type;
    if (!os_log_type_enabled(v13, type)) {
      goto LABEL_28;
    }
    *(_DWORD *)applier = 136446210;
    *(void *)&applier[4] = "-[NWParameters encodeWithCoder:]";
    v15 = "%{public}s nw_parameters_copy_dictionary failed";
LABEL_26:
    v27 = v13;
    os_log_type_t v28 = v14;
LABEL_27:
    _os_log_impl(&dword_1830D4000, v27, v28, v15, applier, 0xCu);
    goto LABEL_28;
  }
  if (!v31)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v13 = (id)gLogObj;
    os_log_type_t v14 = type;
    if (!os_log_type_enabled(v13, type)) {
      goto LABEL_28;
    }
    *(_DWORD *)applier = 136446210;
    *(void *)&applier[4] = "-[NWParameters encodeWithCoder:]";
    v15 = "%{public}s nw_parameters_copy_dictionary failed, backtrace limit exceeded";
    goto LABEL_26;
  }
  v21 = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v13 = (id)gLogObj;
  os_log_type_t v22 = type;
  BOOL v23 = os_log_type_enabled(v13, type);
  if (v21)
  {
    if (v23)
    {
      *(_DWORD *)applier = 136446466;
      *(void *)&applier[4] = "-[NWParameters encodeWithCoder:]";
      *(_WORD *)&applier[12] = 2082;
      *(void *)&applier[14] = v21;
      _os_log_impl(&dword_1830D4000, v13, v22, "%{public}s nw_parameters_copy_dictionary failed, dumping backtrace:%{public}s", applier, 0x16u);
    }

    free(v21);
LABEL_17:
    if (!v12) {
      goto LABEL_40;
    }
    goto LABEL_29;
  }
  if (v23)
  {
    *(_DWORD *)applier = 136446210;
    *(void *)&applier[4] = "-[NWParameters encodeWithCoder:]";
    v15 = "%{public}s nw_parameters_copy_dictionary failed, no backtrace";
    v27 = v13;
    os_log_type_t v28 = v22;
    goto LABEL_27;
  }
LABEL_28:

  if (v12) {
LABEL_29:
  }
    free(v12);
LABEL_40:
}

- (NSURL)sanitizedURL
{
  id v2 = [(NWParameters *)self internalParameters];
  sanitized_url = (void *)nw_parameters_get_sanitized_url(v2);

  if (sanitized_url)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CB10]);
    BOOL v5 = nw_nsstring((uint64_t)sanitized_url);
    sanitized_url = (void *)[v4 initWithString:v5];
  }

  return (NSURL *)sanitized_url;
}

- (NWParameters)initWithCoder:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)NWParameters;
  BOOL v5 = [(NWParameters *)&v53 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v6, "initWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
    v13 = [v4 decodeObjectOfClasses:v12 forKey:@"dictionary"];
    os_log_type_t v14 = v13;
    if (v13)
    {
      xpc_object_t XPCDictionaryFromNSDictionary = NWUtilsCreateXPCDictionaryFromNSDictionary(v13);
      id v16 = XPCDictionaryFromNSDictionary;
      if (XPCDictionaryFromNSDictionary)
      {
        BOOL v17 = nw_parameters_create_from_dictionary(XPCDictionaryFromNSDictionary);
        [(NWParameters *)v5 setInternalParameters:v17];

        v18 = [(NWParameters *)v5 internalParameters];

        if (v18)
        {
          os_log_type_t v19 = v5;
LABEL_39:

          goto LABEL_40;
        }
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v33 = (id)gLogObj;
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWParameters initWithCoder:]";
        BOOL v26 = (void *)_os_log_send_and_compose_impl();

        os_log_type_t type = OS_LOG_TYPE_ERROR;
        char v51 = 0;
        if (!__nwlog_fault((const char *)v26, &type, &v51))
        {
LABEL_36:
          if (!v26)
          {
LABEL_38:
            os_log_type_t v19 = 0;
            goto LABEL_39;
          }
LABEL_37:
          free(v26);
          goto LABEL_38;
        }
        if (type == OS_LOG_TYPE_FAULT)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v27 = (id)gLogObj;
          os_log_type_t v28 = type;
          if (!os_log_type_enabled(v27, type)) {
            goto LABEL_58;
          }
          *(_DWORD *)buf = 136446210;
          v55 = "-[NWParameters initWithCoder:]";
          v29 = "%{public}s nw_parameters_create_from_dictionary failed";
          goto LABEL_56;
        }
        if (!v51)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v27 = (id)gLogObj;
          os_log_type_t v28 = type;
          if (!os_log_type_enabled(v27, type)) {
            goto LABEL_58;
          }
          *(_DWORD *)buf = 136446210;
          v55 = "-[NWParameters initWithCoder:]";
          v29 = "%{public}s nw_parameters_create_from_dictionary failed, backtrace limit exceeded";
          goto LABEL_56;
        }
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v27 = (id)gLogObj;
        os_log_type_t v35 = type;
        BOOL v38 = os_log_type_enabled(v27, type);
        if (backtrace_string)
        {
          if (v38)
          {
            *(_DWORD *)buf = 136446466;
            v55 = "-[NWParameters initWithCoder:]";
            __int16 v56 = 2082;
            id v57 = backtrace_string;
            id v37 = "%{public}s nw_parameters_create_from_dictionary failed, dumping backtrace:%{public}s";
            goto LABEL_34;
          }
          goto LABEL_35;
        }
        if (!v38)
        {
LABEL_58:

          if (!v26) {
            goto LABEL_38;
          }
          goto LABEL_37;
        }
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWParameters initWithCoder:]";
        v29 = "%{public}s nw_parameters_create_from_dictionary failed, no backtrace";
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v25 = (id)gLogObj;
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWParameters initWithCoder:]";
        BOOL v26 = (void *)_os_log_send_and_compose_impl();

        os_log_type_t type = OS_LOG_TYPE_ERROR;
        char v51 = 0;
        if (!__nwlog_fault((const char *)v26, &type, &v51)) {
          goto LABEL_36;
        }
        if (type == OS_LOG_TYPE_FAULT)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v27 = (id)gLogObj;
          os_log_type_t v28 = type;
          if (!os_log_type_enabled(v27, type)) {
            goto LABEL_58;
          }
          *(_DWORD *)buf = 136446210;
          v55 = "-[NWParameters initWithCoder:]";
          v29 = "%{public}s NWUtilsCreateXPCDictionaryFromNSDictionary failed";
LABEL_56:
          v42 = v27;
          os_log_type_t v43 = v28;
LABEL_57:
          _os_log_impl(&dword_1830D4000, v42, v43, v29, buf, 0xCu);
          goto LABEL_58;
        }
        if (!v51)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v27 = (id)gLogObj;
          os_log_type_t v28 = type;
          if (!os_log_type_enabled(v27, type)) {
            goto LABEL_58;
          }
          *(_DWORD *)buf = 136446210;
          v55 = "-[NWParameters initWithCoder:]";
          v29 = "%{public}s NWUtilsCreateXPCDictionaryFromNSDictionary failed, backtrace limit exceeded";
          goto LABEL_56;
        }
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v27 = (id)gLogObj;
        os_log_type_t v35 = type;
        BOOL v36 = os_log_type_enabled(v27, type);
        if (backtrace_string)
        {
          if (v36)
          {
            *(_DWORD *)buf = 136446466;
            v55 = "-[NWParameters initWithCoder:]";
            __int16 v56 = 2082;
            id v57 = backtrace_string;
            id v37 = "%{public}s NWUtilsCreateXPCDictionaryFromNSDictionary failed, dumping backtrace:%{public}s";
LABEL_34:
            _os_log_impl(&dword_1830D4000, v27, v35, v37, buf, 0x16u);
          }
LABEL_35:

          free(backtrace_string);
          goto LABEL_36;
        }
        if (!v36) {
          goto LABEL_58;
        }
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWParameters initWithCoder:]";
        v29 = "%{public}s NWUtilsCreateXPCDictionaryFromNSDictionary failed, no backtrace";
      }
      v42 = v27;
      os_log_type_t v43 = v35;
      goto LABEL_57;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v20 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v55 = "-[NWParameters initWithCoder:]";
    v21 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v51 = 0;
    if (__nwlog_fault(v21, &type, &v51))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v22 = (id)gLogObj;
        os_log_type_t v23 = type;
        if (!os_log_type_enabled(v22, type)) {
          goto LABEL_46;
        }
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWParameters initWithCoder:]";
        v24 = "%{public}s decodeObjectOfClasses:forKey failed";
LABEL_44:
        v40 = v22;
        os_log_type_t v41 = v23;
        goto LABEL_45;
      }
      if (!v51)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v22 = (id)gLogObj;
        os_log_type_t v23 = type;
        if (!os_log_type_enabled(v22, type)) {
          goto LABEL_46;
        }
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWParameters initWithCoder:]";
        v24 = "%{public}s decodeObjectOfClasses:forKey failed, backtrace limit exceeded";
        goto LABEL_44;
      }
      os_log_type_t v30 = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      os_log_type_t v22 = (id)gLogObj;
      os_log_type_t v31 = type;
      BOOL v32 = os_log_type_enabled(v22, type);
      if (!v30)
      {
        if (!v32)
        {
LABEL_46:

          if (!v21) {
            goto LABEL_21;
          }
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWParameters initWithCoder:]";
        v24 = "%{public}s decodeObjectOfClasses:forKey failed, no backtrace";
        v40 = v22;
        os_log_type_t v41 = v31;
LABEL_45:
        _os_log_impl(&dword_1830D4000, v40, v41, v24, buf, 0xCu);
        goto LABEL_46;
      }
      if (v32)
      {
        *(_DWORD *)buf = 136446466;
        v55 = "-[NWParameters initWithCoder:]";
        __int16 v56 = 2082;
        id v57 = v30;
        _os_log_impl(&dword_1830D4000, v22, v31, "%{public}s decodeObjectOfClasses:forKey failed, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(v30);
    }
    if (!v21)
    {
LABEL_21:
      os_log_type_t v19 = 0;
LABEL_40:

      goto LABEL_41;
    }
LABEL_20:
    free(v21);
    goto LABEL_21;
  }
  v44 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v55 = "-[NWParameters initWithCoder:]";
  v45 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v51 = 0;
  if (__nwlog_fault(v45, &type, &v51))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v46 = __nwlog_obj();
      os_log_type_t v47 = type;
      if (os_log_type_enabled(v46, type))
      {
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWParameters initWithCoder:]";
        v48 = "%{public}s [super init] failed";
LABEL_76:
        _os_log_impl(&dword_1830D4000, v46, v47, v48, buf, 0xCu);
      }
    }
    else
    {
      if (v51)
      {
        xpc_object_t v49 = (char *)__nw_create_backtrace_string();
        v46 = __nwlog_obj();
        os_log_type_t v47 = type;
        BOOL v50 = os_log_type_enabled(v46, type);
        if (v49)
        {
          if (v50)
          {
            *(_DWORD *)buf = 136446466;
            v55 = "-[NWParameters initWithCoder:]";
            __int16 v56 = 2082;
            id v57 = v49;
            _os_log_impl(&dword_1830D4000, v46, v47, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v49);
          goto LABEL_78;
        }
        if (!v50) {
          goto LABEL_77;
        }
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWParameters initWithCoder:]";
        v48 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_76;
      }
      v46 = __nwlog_obj();
      os_log_type_t v47 = type;
      if (os_log_type_enabled(v46, type))
      {
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWParameters initWithCoder:]";
        v48 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_76;
      }
    }
LABEL_77:
  }
LABEL_78:
  if (v45) {
    free(v45);
  }
  os_log_type_t v19 = 0;
LABEL_41:

  return v19;
}

- (void)setInternalParameters:(id)a3
{
}

- (NSArray)protocolTransforms
{
  id v2 = [(NWParameters *)self internalParameters];
  nw_interface_t v3 = (atomic_uchar *)nw_parameters_copy_transform_array(v2);

  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__NWParameters_protocolTransforms__block_invoke;
  v7[3] = &unk_1E524AE18;
  id v5 = v4;
  id v8 = v5;
  nw_array_apply(v3, (uint64_t)v7);

  return (NSArray *)v5;
}

+ (NWParameters)parametersWithCParameters:(id)a3
{
  id v3 = a3;
  id v4 = [NWParameters alloc];
  id v5 = v3;
  BOOL v6 = -[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]((id *)[NWConcrete_nw_parameters alloc], v5, 0, 0);

  uint64_t v7 = [(NWParameters *)v4 initWithParameters:v6];

  return v7;
}

- (NWParameters)initWithParameters:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v23.receiver = self;
    v23.super_class = (Class)NWParameters;
    BOOL v6 = [(NWParameters *)&v23 init];
    if (v6)
    {
      uint64_t v7 = v6;
      objc_storeStrong((id *)&v6->_internalParameters, a3);
      goto LABEL_4;
    }
    os_log_type_t v14 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v27 = "-[NWParameters initWithParameters:]";
    v15 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v24 = 0;
    if (!__nwlog_fault(v15, &type, &v24)) {
      goto LABEL_38;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      id v16 = __nwlog_obj();
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWParameters initWithParameters:]";
        v18 = "%{public}s [super init] failed";
LABEL_36:
        _os_log_impl(&dword_1830D4000, v16, v17, v18, buf, 0xCu);
      }
    }
    else if (v24)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      id v16 = __nwlog_obj();
      os_log_type_t v17 = type;
      BOOL v22 = os_log_type_enabled(v16, type);
      if (backtrace_string)
      {
        if (v22)
        {
          *(_DWORD *)buf = 136446466;
          v27 = "-[NWParameters initWithParameters:]";
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
        v27 = "-[NWParameters initWithParameters:]";
        v18 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_36;
      }
    }
    else
    {
      id v16 = __nwlog_obj();
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWParameters initWithParameters:]";
        v18 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_36;
      }
    }

LABEL_38:
    if (v15) {
      free(v15);
    }
    uint64_t v7 = 0;
    goto LABEL_4;
  }
  uint64_t v9 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v27 = "-[NWParameters initWithParameters:]";
  uint64_t v10 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v24 = 0;
  if (__nwlog_fault(v10, &type, &v24))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      uint64_t v11 = __nwlog_obj();
      os_log_type_t v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWParameters initWithParameters:]";
        v13 = "%{public}s called with null parameters";
LABEL_29:
        _os_log_impl(&dword_1830D4000, v11, v12, v13, buf, 0xCu);
      }
    }
    else
    {
      if (v24)
      {
        os_log_type_t v19 = (char *)__nw_create_backtrace_string();
        uint64_t v11 = __nwlog_obj();
        os_log_type_t v12 = type;
        BOOL v20 = os_log_type_enabled(v11, type);
        if (v19)
        {
          if (v20)
          {
            *(_DWORD *)buf = 136446466;
            v27 = "-[NWParameters initWithParameters:]";
            __int16 v28 = 2082;
            v29 = v19;
            _os_log_impl(&dword_1830D4000, v11, v12, "%{public}s called with null parameters, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v19);
          goto LABEL_31;
        }
        if (!v20) {
          goto LABEL_30;
        }
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWParameters initWithParameters:]";
        v13 = "%{public}s called with null parameters, no backtrace";
        goto LABEL_29;
      }
      uint64_t v11 = __nwlog_obj();
      os_log_type_t v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWParameters initWithParameters:]";
        v13 = "%{public}s called with null parameters, backtrace limit exceeded";
        goto LABEL_29;
      }
    }
LABEL_30:
  }
LABEL_31:
  if (v10) {
    free(v10);
  }

  uint64_t v7 = 0;
LABEL_4:

  return v7;
}

- (BOOL)resolvePTR
{
  id v2 = [(NWParameters *)self internalParameters];
  char resolve_ptr = nw_parameters_get_resolve_ptr(v2);

  return resolve_ptr;
}

- (NSData)TLSSessionID
{
  id v2 = [(NWParameters *)self internalParameters];
  id v3 = nw_parameters_copy_tls_session_id(v2);

  if (v3 && object_getClass(v3) == (Class)MEMORY[0x1E4F14580]) {
    id v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  }
  else {
    id v4 = 0;
  }

  return (NSData *)v4;
}

- (void)setMaximumSSLProtocolVersionInternal:(unint64_t)a3
{
  self->_maximumSSLProtocolVersionInternal = a3;
}

- (unint64_t)maximumSSLProtocolVersionInternal
{
  return self->_maximumSSLProtocolVersionInternal;
}

- (void)setMinimumSSLProtocolVersionInternal:(unint64_t)a3
{
  self->_minimumSSLProtocolVersionInternal = a3;
}

- (unint64_t)minimumSSLProtocolVersionInternal
{
  return self->_minimumSSLProtocolVersionInternal;
}

- (void)setSSLCipherSuitesInternal:(id)a3
{
}

- (NSSet)SSLCipherSuitesInternal
{
  return self->_SSLCipherSuitesInternal;
}

- (BOOL)allowDuplicateStateUpdates
{
  id v2 = [(NWParameters *)self internalParameters];
  char allow_duplicate_state_updates = nw_parameters_get_allow_duplicate_state_updates(v2);

  return allow_duplicate_state_updates;
}

- (void)setAllowDuplicateStateUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_allow_duplicate_state_updates(v4, v3);
}

- (BOOL)allowJoiningConnectedFd
{
  id v2 = [(NWParameters *)self internalParameters];
  char allow_joining_connected_fd = nw_parameters_get_allow_joining_connected_fd(v2);

  return allow_joining_connected_fd;
}

- (void)setAllowJoiningConnectedFd:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_allow_joining_connected_fd(v4, v3);
}

- (BOOL)prohibitJoiningProtocols
{
  id v2 = [(NWParameters *)self internalParameters];
  char prohibit_joining_protocols = nw_parameters_get_prohibit_joining_protocols(v2);

  return prohibit_joining_protocols;
}

- (void)setProhibitJoiningProtocols:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_prohibit_joining_protocols(v4, v3);
}

- (BOOL)attachProtocolListener
{
  id v2 = [(NWParameters *)self internalParameters];
  char attach_protocol_listener = nw_parameters_get_attach_protocol_listener(v2);

  return attach_protocol_listener;
}

- (void)setAttachProtocolListener:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_attach_protocol_listener(v4, v3);
}

- (BOOL)httpsProxyOverTLS
{
  id v2 = [(NWParameters *)self internalParameters];
  https_proxy_over_char tls = nw_parameters_get_https_proxy_over_tls(v2);

  return https_proxy_over_tls;
}

- (void)setHttpsProxyOverTLS:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_https_proxy_over_tls(v4, v3);
}

- (BOOL)httpsProxyIsOpaque
{
  id v2 = [(NWParameters *)self internalParameters];
  char is_opaque = nw_parameters_get_https_proxy_is_opaque(v2);

  return is_opaque;
}

- (void)setHttpsProxyIsOpaque:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_https_proxy_is_opaque(v4, v3);
}

- (BOOL)preferNoProxy
{
  id v2 = [(NWParameters *)self internalParameters];
  BOOL prefer_no_proxy = nw_parameters_get_prefer_no_proxy(v2);

  return prefer_no_proxy;
}

- (void)setPreferNoProxy:(BOOL)a3
{
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_prefer_no_proxy(v4, a3);
}

- (BOOL)allowUnusableAddresses
{
  id v2 = [(NWParameters *)self internalParameters];
  char allow_unusable_addresses = nw_parameters_get_allow_unusable_addresses(v2);

  return allow_unusable_addresses;
}

- (void)setAllowUnusableAddresses:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_allow_unusable_addresses(v4, v3);
}

- (id)createProtocolBufferObject
{
  BOOL v3 = objc_alloc_init(NWPBParameters);
  id v4 = [(NWParameters *)self effectiveProcessUUID];
  id v5 = [v4 UUIDString];
  if (v3) {
    objc_storeStrong((id *)&v3->_effectiveProcessUUID, v5);
  }

  BOOL v6 = [(NWParameters *)self processUUID];
  uint64_t v7 = [v6 UUIDString];
  if (v3) {
    objc_storeStrong((id *)&v3->_realProcessUUID, v7);
  }

  id v8 = [(NWParameters *)self localAddress];
  uint64_t v9 = (void *)[v8 createProtocolBufferObject];
  if (v3) {
    objc_storeStrong((id *)&v3->_localEndpoint, v9);
  }

  uint64_t v10 = [(NWParameters *)self account];
  if (v3) {
    objc_storeStrong((id *)&v3->_account, v10);
  }

  if ([(NWParameters *)self requiredAddressFamily])
  {
    unsigned int v11 = [(NWParameters *)self requiredAddressFamily];
    if (v3)
    {
      *(_WORD *)&v3->_has |= 1u;
      v3->_addressFamily = v11;
      int v12 = [(NWParameters *)self dataMode];
LABEL_13:
      *(_WORD *)&v3->_has |= 2u;
      v3->_dataMode = v12;
      v13 = [(NWParameters *)self effectiveBundleID];
      objc_storeStrong((id *)&v3->_effectiveBundleID, v13);
      goto LABEL_14;
    }
    [(NWParameters *)self dataMode];
  }
  else
  {
    int v12 = [(NWParameters *)self dataMode];
    if (v3) {
      goto LABEL_13;
    }
  }
  v13 = [(NWParameters *)self effectiveBundleID];
LABEL_14:

  os_log_type_t v14 = [(NWParameters *)self metadata];
  if (v3) {
    objc_storeStrong((id *)&v3->_metadata, v14);
  }

  v15 = [(NWParameters *)self requiredInterface];
  id v16 = (void *)[v15 createProtocolBufferObject];
  if (v3) {
    objc_storeStrong((id *)&v3->_requiredInterface, v16);
  }

  int v17 = [(NWParameters *)self requiredInterfaceType];
  if (v3)
  {
    *(_WORD *)&v3->_has |= 0x10u;
    v3->_requiredInterfaceType = v17;
    unsigned int v18 = [(NWParameters *)self trafficClass];
    *(_WORD *)&v3->_has |= 0x20u;
    v3->_trafficClass = v18;
  }
  else
  {
    [(NWParameters *)self trafficClass];
  }
  os_log_type_t v19 = [(NWParameters *)self url];
  BOOL v20 = [v19 absoluteString];
  if (v3) {
    objc_storeStrong((id *)&v3->_url, v20);
  }

  if ([(NWParameters *)self enableTFO])
  {
    BOOL v21 = [(NWParameters *)self enableTFO];
    if (v3)
    {
      *(_WORD *)&v3->_has |= 0x40u;
      v3->_fastOpesize_t n = v21;
    }
  }
  if ([(NWParameters *)self keepAlive])
  {
    BOOL v22 = [(NWParameters *)self keepAlive];
    if (v3)
    {
      *(_WORD *)&v3->_has |= 0x80u;
      v3->_keepalive = v22;
      BOOL v23 = [(NWParameters *)self useLongOutstandingQueries];
LABEL_29:
      *(_WORD *)&v3->_has |= 0x100u;
      v3->_longOutstandingQueries = v23;
      int v24 = [(NWParameters *)self multipathService];
      *(_WORD *)&v3->_has |= 8u;
      v3->_multipathService = v24;
      BOOL v25 = [(NWParameters *)self prohibitFallback];
      *(_WORD *)&v3->_has |= 0x200u;
      v3->_noFallbacsize_t k = v25;
      BOOL v26 = [(NWParameters *)self prohibitExpensivePaths];
      *(_WORD *)&v3->_has |= 0x400u;
      v3->_prohibitExpensive = v26;
      BOOL v27 = [(NWParameters *)self reuseLocalAddress];
      *(_WORD *)&v3->_has |= 0x1000u;
      v3->_reuseLocalAddress = v27;
      BOOL v28 = [(NWParameters *)self useAWDL];
      *(_WORD *)&v3->_has |= 0x2000u;
      v3->_useAWDL = v28;
      BOOL v29 = [(NWParameters *)self useP2P];
      *(_WORD *)&v3->_has |= 0x4000u;
      v3->_useP2P = v29;
      goto LABEL_30;
    }
    [(NWParameters *)self useLongOutstandingQueries];
  }
  else
  {
    BOOL v23 = [(NWParameters *)self useLongOutstandingQueries];
    if (v3) {
      goto LABEL_29;
    }
  }
  [(NWParameters *)self multipathService];
  [(NWParameters *)self prohibitFallback];
  [(NWParameters *)self prohibitExpensivePaths];
  [(NWParameters *)self reuseLocalAddress];
  [(NWParameters *)self useAWDL];
  [(NWParameters *)self useP2P];
LABEL_30:
  uint64_t v30 = [(NWParameters *)self internalParameters];
  BOOL has_required_netagents = nw_parameters_has_required_netagents(v30);

  if (has_required_netagents)
  {
    BOOL v32 = [(NWParameters *)self internalParameters];
    id v33 = nw_parameters_copy_required_netagent_domains(v32);

    v34 = [(NWParameters *)self internalParameters];
    id v35 = nw_parameters_copy_required_netagent_types(v34);

    if (v33)
    {
      if (v35)
      {
        size_t count = xpc_array_get_count(v33);
        if (count)
        {
          size_t v37 = count;
          for (size_t i = 0; i != v37; ++i)
          {
            string = xpc_array_get_string(v33, i);
            v40 = xpc_array_get_string(v35, i);
            if (string)
            {
              os_log_type_t v41 = v40;
              if (v40)
              {
                v42 = objc_alloc_init(NWPBAgentClass);
                os_log_type_t v43 = [NSString stringWithUTF8String:string];
                if (v42) {
                  objc_storeStrong((id *)&v42->_domain, v43);
                }

                v44 = [NSString stringWithUTF8String:v41];
                if (v42) {
                  objc_storeStrong((id *)&v42->_type, v44);
                }

                v45 = v42;
                if (v3)
                {
                  requiredAgents = v3->_requiredAgents;
                  if (!requiredAgents)
                  {
                    os_log_type_t v47 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
                    v48 = v3->_requiredAgents;
                    v3->_requiredAgents = v47;

                    requiredAgents = v3->_requiredAgents;
                  }
                  [(NSMutableArray *)requiredAgents addObject:v45];
                }
              }
            }
          }
        }
      }
    }
  }
  xpc_object_t v49 = [(NWParameters *)self internalParameters];
  BOOL has_prohibited_netagents = nw_parameters_has_prohibited_netagents(v49);

  if (has_prohibited_netagents)
  {
    char v51 = [(NWParameters *)self internalParameters];
    id v52 = nw_parameters_copy_prohibited_netagent_domains(v51);

    objc_super v53 = [(NWParameters *)self internalParameters];
    id v54 = nw_parameters_copy_prohibited_netagent_types(v53);

    if (v52)
    {
      if (v54)
      {
        size_t v55 = xpc_array_get_count(v52);
        if (v55)
        {
          size_t v56 = v55;
          for (size_t j = 0; j != v56; ++j)
          {
            uint64_t v58 = xpc_array_get_string(v52, j);
            v59 = xpc_array_get_string(v54, j);
            if (v58)
            {
              v60 = v59;
              if (v59)
              {
                v61 = objc_alloc_init(NWPBAgentClass);
                v62 = [NSString stringWithUTF8String:v58];
                if (v61) {
                  objc_storeStrong((id *)&v61->_domain, v62);
                }

                id v63 = [NSString stringWithUTF8String:v60];
                if (v61) {
                  objc_storeStrong((id *)&v61->_type, v63);
                }

                v64 = v61;
                if (v3)
                {
                  prohibitedAgents = v3->_prohibitedAgents;
                  if (!prohibitedAgents)
                  {
                    v66 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
                    id v67 = v3->_prohibitedAgents;
                    v3->_prohibitedAgents = v66;

                    prohibitedAgents = v3->_prohibitedAgents;
                  }
                  [(NSMutableArray *)prohibitedAgents addObject:v64];
                }
              }
            }
          }
        }
      }
    }
  }
  v68 = [(NWParameters *)self internalParameters];
  BOOL has_preferred_netagents = nw_parameters_has_preferred_netagents(v68);

  if (has_preferred_netagents)
  {
    v70 = [(NWParameters *)self internalParameters];
    xpc_object_t v71 = nw_parameters_copy_preferred_netagent_domains(v70);

    v72 = [(NWParameters *)self internalParameters];
    xpc_object_t v73 = nw_parameters_copy_preferred_netagent_types(v72);

    if (v71)
    {
      if (v73)
      {
        size_t v74 = xpc_array_get_count(v71);
        if (v74)
        {
          size_t v75 = v74;
          for (size_t k = 0; k != v75; ++k)
          {
            id v77 = xpc_array_get_string(v71, k);
            v78 = xpc_array_get_string(v73, k);
            if (v77)
            {
              v79 = v78;
              if (v78)
              {
                v80 = objc_alloc_init(NWPBAgentClass);
                id v81 = [NSString stringWithUTF8String:v77];
                if (v80) {
                  objc_storeStrong((id *)&v80->_domain, v81);
                }

                v82 = [NSString stringWithUTF8String:v79];
                if (v80) {
                  objc_storeStrong((id *)&v80->_type, v82);
                }

                v83 = v80;
                if (v3)
                {
                  preferredAgents = v3->_preferredAgents;
                  if (!preferredAgents)
                  {
                    id v85 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
                    v86 = v3->_preferredAgents;
                    v3->_preferredAgents = v85;

                    preferredAgents = v3->_preferredAgents;
                  }
                  [(NSMutableArray *)preferredAgents addObject:v83];
                }
              }
            }
          }
        }
      }
    }
  }
  v87 = [(NWParameters *)self internalParameters];
  BOOL has_prohibited_interfaces = nw_parameters_has_prohibited_interfaces(v87);

  if (has_prohibited_interfaces)
  {
    v89 = [(NWParameters *)self internalParameters];
    id v90 = nw_parameters_copy_prohibited_interfaces(v89);

    if (v90)
    {
      size_t v91 = xpc_array_get_count(v90);
      if (v91)
      {
        size_t v92 = v91;
        for (size_t m = 0; m != v92; ++m)
        {
          v94 = xpc_array_get_value(v90, m);
          v95 = nw_interface_create_from_dictionary(v94);

          if (v95)
          {
            v96 = [[NWInterface alloc] initWithInterface:v95];
            id v97 = [(NWInterface *)v96 createProtocolBufferObject];
            if (v3)
            {
              prohibitedInterfaces = v3->_prohibitedInterfaces;
              if (!prohibitedInterfaces)
              {
                v99 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
                v100 = v3->_prohibitedInterfaces;
                v3->_prohibitedInterfaces = v99;

                prohibitedInterfaces = v3->_prohibitedInterfaces;
              }
              [(NSMutableArray *)prohibitedInterfaces addObject:v97];
            }
          }
        }
      }
    }
  }
  v101 = [(NWParameters *)self internalParameters];
  BOOL has_prohibited_interface_types = nw_parameters_has_prohibited_interface_types(v101);

  if (has_prohibited_interface_types)
  {
    v103 = [(NWParameters *)self internalParameters];
    id v104 = nw_parameters_copy_prohibited_interface_types(v103);

    if (v104)
    {
      size_t v105 = xpc_array_get_count(v104);
      if (v105)
      {
        size_t v106 = v105;
        for (size_t n = 0; n != v106; ++n)
        {
          xpc_array_get_uint64(v104, n);
          if (v3) {
            PBRepeatedInt32Add();
          }
        }
      }
    }
  }
  v108 = [(NWParameters *)self internalParameters];
  BOOL has_prohibited_interface_subtypes = nw_parameters_has_prohibited_interface_subtypes(v108);

  if (has_prohibited_interface_subtypes)
  {
    v110 = [(NWParameters *)self internalParameters];
    id v111 = nw_parameters_copy_prohibited_interface_subtypes(v110);

    if (v111)
    {
      size_t v112 = xpc_array_get_count(v111);
      if (v112)
      {
        size_t v113 = v112;
        for (isize_t i = 0; ii != v113; ++ii)
        {
          xpc_array_get_uint64(v111, ii);
          if (v3) {
            PBRepeatedInt32Add();
          }
        }
      }
    }
  }
  return v3;
}

- (void)setMetadata:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4) {
    xpc_object_t v5 = xpc_data_create((const void *)[v4 bytes], objc_msgSend(v4, "length"));
  }
  else {
    xpc_object_t v5 = 0;
  }
  BOOL v6 = [(NWParameters *)self internalParameters];
  nw_parameters_set_metadata(v6, v5);
}

- (NSData)metadata
{
  id v2 = [(NWParameters *)self internalParameters];
  id v3 = nw_parameters_copy_metadata(v2);

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    bytes_ptr = xpc_data_get_bytes_ptr(v3);
    BOOL v6 = (void *)[v4 initWithBytes:bytes_ptr length:xpc_data_get_length(v3)];
  }
  else
  {
    BOOL v6 = 0;
  }

  return (NSData *)v6;
}

- (unint64_t)hash
{
  id v2 = [(NWParameters *)self internalParameters];
  size_t hash = nw_parameters_get_hash(v2);

  return hash;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && [v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    BOOL v6 = [(NWParameters *)self internalParameters];
    id v7 = [v5 internalParameters];

    char is_equal = nw_parameters_is_equal(v6, v7);
  }
  else
  {
    char is_equal = 0;
  }

  return is_equal;
}

- (void)setProtocolAtLevel:(unint64_t)a3 protocol:(nw_protocol_identifier *)a4
{
  if (a3 - 1 < 4) {
    int v5 = a3;
  }
  else {
    int v5 = 0;
  }
  id v6 = [(NWParameters *)self internalParameters];
  nw_parameters_add_to_protocol_stack(v6, v5, 0xFFFFFFFF, (long long *)a4->name);
}

- (id)copyRequiredAgentsDescription
{
  id v3 = [(NWParameters *)self internalParameters];
  id v4 = nw_parameters_copy_required_netagent_domains(v3);

  if (v4)
  {
    int v5 = [(NWParameters *)self internalParameters];
    id v6 = nw_parameters_copy_required_netagent_types(v5);

    if (v6)
    {
      v15[0] = 0;
      v15[1] = v15;
      v15[2] = 0x2020000000;
      char v16 = 0;
      id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
      applier[0] = MEMORY[0x1E4F143A8];
      applier[1] = 3221225472;
      applier[2] = __45__NWParameters_copyRequiredAgentsDescription__block_invoke;
      applier[3] = &unk_1E5242810;
      id v12 = v6;
      id v8 = v7;
      id v13 = v8;
      os_log_type_t v14 = v15;
      xpc_array_apply(v4, applier);
      if ([v8 length]) {
        uint64_t v9 = (void *)[[NSString alloc] initWithString:v8];
      }
      else {
        uint64_t v9 = 0;
      }

      _Block_object_dispose(v15, 8);
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __45__NWParameters_copyRequiredAgentsDescription__block_invoke(uint64_t a1, size_t a2, void *a3)
{
  id v5 = a3;
  Class Class = object_getClass(v5);
  id v7 = (objc_class *)MEMORY[0x1E4F145F0];
  if (Class == (Class)MEMORY[0x1E4F145F0])
  {
    id v8 = xpc_array_get_value(*(xpc_object_t *)(a1 + 32), a2);
    if (object_getClass(v8) == v7)
    {
      string_ptr = xpc_string_get_string_ptr(v5);
      uint64_t v10 = xpc_string_get_string_ptr(v8);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        unsigned int v11 = ", ";
      }
      else {
        unsigned int v11 = "";
      }
      objc_msgSend(*(id *)(a1 + 40), "appendFormat:", @"%s%s:%s", v11, string_ptr, v10);
    }
  }
  return 1;
}

- (BOOL)hasNonEmptyProxyConfiguration
{
  id v2 = [(NWParameters *)self internalParameters];
  BOOL has_custom_proxy_configs = nw_parameters_has_custom_proxy_configs(v2);

  return has_custom_proxy_configs;
}

- (BOOL)hasProhibitedNetworkAgents
{
  id v2 = [(NWParameters *)self internalParameters];
  BOOL has_prohibited_netagents = nw_parameters_has_prohibited_netagents(v2);

  return has_prohibited_netagents;
}

- (BOOL)hasPreferredNetworkAgents
{
  id v2 = [(NWParameters *)self internalParameters];
  BOOL has_preferred_netagents = nw_parameters_has_preferred_netagents(v2);

  return has_preferred_netagents;
}

- (BOOL)hasRequiredNetworkAgents
{
  id v2 = [(NWParameters *)self internalParameters];
  BOOL has_required_netagents = nw_parameters_has_required_netagents(v2);

  return has_required_netagents;
}

- (void)setDiscretionary:(BOOL)a3
{
  __int16 v3 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_discretionary(v4, v3);
}

- (BOOL)isDiscretionary
{
  id v2 = [(NWParameters *)self internalParameters];
  char discretionary = nw_parameters_get_discretionary(v2);

  return discretionary;
}

- (void)setProhibitFallback:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_no_fallback(v4, v3);
}

- (BOOL)prohibitFallback
{
  id v2 = [(NWParameters *)self internalParameters];
  no_fallbacsize_t k = nw_parameters_get_no_fallback(v2);

  return no_fallback;
}

- (BOOL)isValid
{
  id v2 = [(NWParameters *)self internalParameters];
  BOOL v3 = nw_parameters_are_valid(v2);

  return v3;
}

uint64_t __34__NWParameters_protocolTransforms__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a3;
  id v5 = [[NWProtocolTransform alloc] initWithCTransform:v4];

  [v3 addObject:v5];
  return 1;
}

- (void)setProtocolTransforms:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = nw_array_create();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned int v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "internalTransform", (void)v13);
        nw_array_append(v5, v11);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  id v12 = [(NWParameters *)self internalParameters];
  nw_parameters_set_transform_array(v12, (void *)v5);
}

- (void)setInitialDataPayload:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = v4;
  if (!v4)
  {
    id v6 = 0;
    goto LABEL_8;
  }
  id v6 = (void *)[v4 _createDispatchData];
  if (v6)
  {
LABEL_8:
    id v12 = [(NWParameters *)self internalParameters];
    nw_parameters_set_initial_data_payload(v12, v6);

    goto LABEL_9;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v7 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  BOOL v21 = "-[NWParameters setInitialDataPayload:]";
  uint64_t v8 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v18 = 0;
  if (!__nwlog_fault(v8, &type, &v18)) {
    goto LABEL_20;
  }
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint64_t v9 = (id)gLogObj;
    os_log_type_t v10 = type;
    if (os_log_type_enabled(v9, type))
    {
      *(_DWORD *)buf = 136446210;
      BOOL v21 = "-[NWParameters setInitialDataPayload:]";
      unsigned int v11 = "%{public}s NWCreateDispatchDataFromNSData failed";
LABEL_17:
      long long v16 = v9;
      os_log_type_t v17 = v10;
LABEL_18:
      _os_log_impl(&dword_1830D4000, v16, v17, v11, buf, 0xCu);
    }
  }
  else
  {
    if (v18)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v9 = (id)gLogObj;
      os_log_type_t v14 = type;
      BOOL v15 = os_log_type_enabled(v9, type);
      if (backtrace_string)
      {
        if (v15)
        {
          *(_DWORD *)buf = 136446466;
          BOOL v21 = "-[NWParameters setInitialDataPayload:]";
          __int16 v22 = 2082;
          BOOL v23 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v9, v14, "%{public}s NWCreateDispatchDataFromNSData failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }
      if (!v15) {
        goto LABEL_19;
      }
      *(_DWORD *)buf = 136446210;
      BOOL v21 = "-[NWParameters setInitialDataPayload:]";
      unsigned int v11 = "%{public}s NWCreateDispatchDataFromNSData failed, no backtrace";
      long long v16 = v9;
      os_log_type_t v17 = v14;
      goto LABEL_18;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint64_t v9 = (id)gLogObj;
    os_log_type_t v10 = type;
    if (os_log_type_enabled(v9, type))
    {
      *(_DWORD *)buf = 136446210;
      BOOL v21 = "-[NWParameters setInitialDataPayload:]";
      unsigned int v11 = "%{public}s NWCreateDispatchDataFromNSData failed, backtrace limit exceeded";
      goto LABEL_17;
    }
  }
LABEL_19:

LABEL_20:
  if (v8) {
    free(v8);
  }
LABEL_9:
}

- (void)setSourceApplicationWithBundleID:(id)a3
{
  id v5 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_source_application_by_bundle_id_internal(v4, (const char *)[v5 UTF8String]);
}

- (void)setSourceApplicationWithToken:(id *)a3
{
  id v5 = [(NWParameters *)self internalParameters];
  long long v4 = *(_OWORD *)&a3->var0[4];
  v6[0] = *(_OWORD *)a3->var0;
  v6[1] = v4;
  nw_parameters_set_source_application(v5, v6);
}

- (void)setMaximumSSLProtocolVersion:(unint64_t)a3
{
  -[NWParameters tlsVersionWithSSLProtocol:](self, "tlsVersionWithSSLProtocol:");
  [(NWParameters *)self setMaximumSSLProtocolVersionInternal:a3];
  id v5 = [(NWParameters *)self internalParameters];
  nw_parameters_set_maximum_tls_protocol_version(v5);
}

- (void)setMinimumSSLProtocolVersion:(unint64_t)a3
{
  -[NWParameters tlsVersionWithSSLProtocol:](self, "tlsVersionWithSSLProtocol:");
  [(NWParameters *)self setMinimumSSLProtocolVersionInternal:a3];
  id v5 = [(NWParameters *)self internalParameters];
  nw_parameters_set_minimum_tls_protocol_version(v5);
}

- (unsigned)tlsVersionWithSSLProtocol:(int)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unsigned __int16 result = 768;
  switch(a3)
  {
    case 0:
      return 0;
    case 1:
    case 3:
    case 5:
    case 6:
      id v5 = "deprecated";
      goto LABEL_3;
    case 2:
      return result;
    case 4:
      return 769;
    case 7:
      return 770;
    case 8:
      return 771;
    case 9:
      return -257;
    case 10:
      return 772;
    default:
      id v5 = "unknown";
LABEL_3:
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v6 = (id)gLogObj;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NWParameters tlsVersionWithSSLProtocol:]";
        __int16 v9 = 2082;
        os_log_type_t v10 = v5;
        __int16 v11 = 1024;
        int v12 = a3;
        _os_log_impl(&dword_1830D4000, v6, OS_LOG_TYPE_ERROR, "%{public}s Parameters have %{public}s SSLProtocol %d, ignoring", (uint8_t *)&v7, 0x1Cu);
      }

      return 0;
  }
}

- (void)setKeepAliveOffload:(BOOL)a3
{
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_keepalive_offload(v4, a3);
}

- (BOOL)keepAliveOffload
{
  id v2 = [(NWParameters *)self internalParameters];
  BOOL keepalive_offload = nw_parameters_get_keepalive_offload(v2);

  return keepalive_offload;
}

- (void)setKeepAliveInterval:(unint64_t)a3
{
  uint32_t v3 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_keepalive_interval(v4, v3);
}

- (unint64_t)keepAliveInterval
{
  id v2 = [(NWParameters *)self internalParameters];
  unint64_t keepalive_interval = nw_parameters_get_keepalive_interval(v2);

  return keepalive_interval;
}

- (void)setKeepAliveIdleTime:(unint64_t)a3
{
  uint32_t v3 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_keepalive_idle_time(v4, v3);
}

- (unint64_t)keepAliveIdleTime
{
  id v2 = [(NWParameters *)self internalParameters];
  unint64_t keepalive_idle_time = nw_parameters_get_keepalive_idle_time(v2);

  return keepalive_idle_time;
}

- (void)setKeepAlive:(BOOL)a3
{
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_keepalive_enabled(v4, a3);
}

- (BOOL)keepAlive
{
  id v2 = [(NWParameters *)self internalParameters];
  BOOL keepalive_enabled = nw_parameters_get_keepalive_enabled(v2);

  return keepalive_enabled;
}

- (void)setSSLCipherSuites:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NWParameters *)self setSSLCipherSuitesInternal:v4];
  if (![v4 count])
  {
    id v5 = [(NWParameters *)self internalParameters];
    nw_parameters_set_ssl_cipher_suites(v5, 0, 0);
LABEL_11:

    return;
  }
  id v5 = [v4 allObjects];
  unsigned int v6 = [v5 count];
  if (!v6)
  {
    long long v16 = __nwlog_obj();
    os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 136446210;
    uint64_t v24 = "strict_calloc";
    LODWORD(v22) = 12;
    BOOL v21 = buf;
    os_log_type_t v17 = (void *)_os_log_send_and_compose_impl();

    if (__nwlog_abort((uint64_t)v17)) {
      goto LABEL_18;
    }
    free(v17);
  }
  int v7 = (tls_ciphersuite_t *)malloc_type_calloc(2uLL, v6, 0xEAFB8F1AuLL);
  if (v7)
  {
    uint64_t v8 = v7;
    if (v6)
    {
      for (uint64_t i = 0; i != v6; v8[i++] = v11)
      {
        os_log_type_t v10 = objc_msgSend(v5, "objectAtIndexedSubscript:", i, v21, v22);
        tls_ciphersuite_t v11 = (unsigned __int16)[v10 unsignedIntValue];
      }
      int v12 = [(NWParameters *)self internalParameters];
      uint64_t v13 = v12;
      os_log_type_t v14 = v8;
      int v15 = v6;
    }
    else
    {
      int v12 = [(NWParameters *)self internalParameters];
      uint64_t v13 = v12;
      os_log_type_t v14 = v8;
      int v15 = 0;
    }
    nw_parameters_set_ssl_cipher_suites(v12, v14, v15);

    free(v8);
    goto LABEL_11;
  }
  char v18 = __nwlog_obj();
  os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
  *(_DWORD *)buf = 136446722;
  uint64_t v24 = "strict_calloc";
  __int16 v25 = 2048;
  uint64_t v26 = 2;
  __int16 v27 = 2048;
  uint64_t v28 = v6;
  os_log_type_t v19 = (void *)_os_log_send_and_compose_impl();

  if (!__nwlog_abort((uint64_t)v19))
  {
    free(v19);
    BOOL v20 = __nwlog_obj();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v24 = "-[NWParameters setSSLCipherSuites:]";
      __int16 v25 = 1024;
      LODWORD(v26) = v6;
      _os_log_impl(&dword_1830D4000, v20, OS_LOG_TYPE_ERROR, "%{public}s Could not allocate array for %d SSL cipher suites", buf, 0x12u);
    }

    goto LABEL_11;
  }
LABEL_18:
  __break(1u);
}

- (void)setTLSSessionID:(id)a3
{
  id v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v4)
  {
    id v7 = v4;
    BOOL v5 = object_getClass(v4) == (Class)MEMORY[0x1E4F14580];
    id v4 = v7;
    if (v5)
    {
      unsigned int v6 = [(NWParameters *)self internalParameters];
      nw_parameters_set_tls_session_id(v6, v7);

      id v4 = v7;
    }
  }
}

- (void)setEnableTLS:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_tls(v4, v3);
}

- (void)setNoProxy:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_no_proxy(v4, v3);
}

- (BOOL)noProxy
{
  id v2 = [(NWParameters *)self internalParameters];
  char no_proxy = nw_parameters_get_no_proxy(v2);

  return no_proxy;
}

- (void)setIndefinite:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_indefinite(v4, v3);
}

- (BOOL)indefinite
{
  id v2 = [(NWParameters *)self internalParameters];
  char indefinite = nw_parameters_get_indefinite(v2);

  return indefinite;
}

- (void)setMultipathForceEnable:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_multipath_force_enable(v4, v3);
}

- (BOOL)multipathForceEnable
{
  id v2 = [(NWParameters *)self internalParameters];
  char multipath_force_enable = nw_parameters_get_multipath_force_enable(v2);

  return multipath_force_enable;
}

- (void)setMultipathService:(int)a3
{
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_multipath_service(v4, (nw_multipath_service_t)a3);
}

- (void)setMultipath:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  unsigned int v6 = v4;
  if (v3) {
    nw_multipath_service_t v5 = nw_multipath_service_interactive;
  }
  else {
    nw_multipath_service_t v5 = nw_multipath_service_disabled;
  }
  nw_parameters_set_multipath_service(v4, v5);
}

- (BOOL)multipath
{
  id v2 = [(NWParameters *)self internalParameters];
  BOOL multipath = nw_parameters_get_multipath(v2);

  return multipath;
}

- (void)setResolvePTR:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_resolve_ptr(v4, v3);
}

- (void)setUseP2P:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_use_p2p(v4, v3);
}

- (void)setUseAWDL:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_use_awdl(v4, v3);
}

- (void)setIgnoreResolverStats:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_ignore_resolver_stats(v4, v3);
}

- (BOOL)ignoreResolverStats
{
  id v2 = [(NWParameters *)self internalParameters];
  char ignore_resolver_stats = nw_parameters_get_ignore_resolver_stats(v2);

  return ignore_resolver_stats;
}

- (void)setUseLongOutstandingQueries:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_use_long_outstanding_queries(v4, v3);
}

- (void)setDisableNagleAlgorithm:(BOOL)a3
{
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_no_delay(v4, a3);
}

- (void)setReduceBuffering:(BOOL)a3
{
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_reduce_buffering(v4, a3);
}

- (BOOL)reduceBuffering
{
  id v2 = [(NWParameters *)self internalParameters];
  BOOL reduce_buffering = nw_parameters_get_reduce_buffering(v2);

  return reduce_buffering;
}

- (void)setFastOpenForceEnable:(BOOL)a3
{
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_fast_open_force_enable(v4, a3);
}

- (BOOL)fastOpenForceEnable
{
  id v2 = [(NWParameters *)self internalParameters];
  BOOL fast_open_force_enable = nw_parameters_get_fast_open_force_enable(v2);

  return fast_open_force_enable;
}

- (void)setEnableTFONoCookie:(BOOL)a3
{
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_tfo_no_cookie(v4, a3);
}

- (BOOL)enableTFONoCookie
{
  id v2 = [(NWParameters *)self internalParameters];
  BOOL tfo_no_cookie = nw_parameters_get_tfo_no_cookie(v2);

  return tfo_no_cookie;
}

- (void)setEnableTFO:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_tfo(v4, v3);
}

- (void)avoidNetworkAgentWithDomain:(id)a3 type:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  id v7 = [(NWParameters *)self internalParameters];
  xpc_object_t v8 = nw_parameters_copy_avoided_netagent_domains(v7);

  __int16 v9 = [(NWParameters *)self internalParameters];
  xpc_object_t v10 = nw_parameters_copy_avoided_netagent_types(v9);

  if (!v8 || !v10)
  {
    xpc_object_t v11 = xpc_array_create(0, 0);

    xpc_object_t v12 = xpc_array_create(0, 0);
    xpc_object_t v8 = v11;
    xpc_object_t v10 = v12;
  }
  uint64_t v13 = [v18 UTF8String];
  if (v13) {
    os_log_type_t v14 = (const char *)v13;
  }
  else {
    os_log_type_t v14 = "";
  }
  xpc_array_set_string(v8, 0xFFFFFFFFFFFFFFFFLL, v14);
  uint64_t v15 = [v6 UTF8String];
  if (v15) {
    long long v16 = (const char *)v15;
  }
  else {
    long long v16 = "";
  }
  xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, v16);
  os_log_type_t v17 = [(NWParameters *)self internalParameters];
  nw_parameters_set_avoided_netagent_classes(v17, v8, v10);
}

- (void)avoidNetworkAgentWithUUID:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    nw_multipath_service_t v5 = [(NWParameters *)self internalParameters];
    id v6 = nw_parameters_copy_avoided_netagent_uuids(v5);

    if (!v6) {
      id v6 = xpc_array_create(0, 0);
    }
    *(void *)uunsigned int uid = 0;
    uint64_t v9 = 0;
    [v4 getUUIDBytes:uuid];
    xpc_array_set_uuid(v6, 0xFFFFFFFFFFFFFFFFLL, uuid);
    id v7 = [(NWParameters *)self internalParameters];
    nw_parameters_set_avoided_netagent_uuids(v7, v6);
  }
}

- (void)preferNetworkAgentWithDomain:(id)a3 type:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  id v7 = [(NWParameters *)self internalParameters];
  xpc_object_t v8 = nw_parameters_copy_preferred_netagent_domains(v7);

  uint64_t v9 = [(NWParameters *)self internalParameters];
  xpc_object_t v10 = nw_parameters_copy_preferred_netagent_types(v9);

  if (!v8 || !v10)
  {
    xpc_object_t v11 = xpc_array_create(0, 0);

    xpc_object_t v12 = xpc_array_create(0, 0);
    xpc_object_t v8 = v11;
    xpc_object_t v10 = v12;
  }
  uint64_t v13 = [v18 UTF8String];
  if (v13) {
    os_log_type_t v14 = (const char *)v13;
  }
  else {
    os_log_type_t v14 = "";
  }
  xpc_array_set_string(v8, 0xFFFFFFFFFFFFFFFFLL, v14);
  uint64_t v15 = [v6 UTF8String];
  if (v15) {
    long long v16 = (const char *)v15;
  }
  else {
    long long v16 = "";
  }
  xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, v16);
  os_log_type_t v17 = [(NWParameters *)self internalParameters];
  nw_parameters_set_preferred_netagent_classes(v17, v8, v10);
}

- (void)preferNetworkAgentWithUUID:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    nw_multipath_service_t v5 = [(NWParameters *)self internalParameters];
    id v6 = nw_parameters_copy_preferred_netagent_uuids(v5);

    if (!v6) {
      id v6 = xpc_array_create(0, 0);
    }
    *(void *)uunsigned int uid = 0;
    uint64_t v9 = 0;
    [v4 getUUIDBytes:uuid];
    xpc_array_set_uuid(v6, 0xFFFFFFFFFFFFFFFFLL, uuid);
    id v7 = [(NWParameters *)self internalParameters];
    nw_parameters_set_preferred_netagent_uuids(v7, v6);
  }
}

- (void)requireNetworkAgentWithDomain:(id)a3 type:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  id v7 = [(NWParameters *)self internalParameters];
  id v8 = nw_parameters_copy_required_netagent_domains(v7);

  uint64_t v9 = [(NWParameters *)self internalParameters];
  id v10 = nw_parameters_copy_required_netagent_types(v9);

  if (!v8 || !v10)
  {
    xpc_object_t v11 = xpc_array_create(0, 0);

    xpc_object_t v12 = xpc_array_create(0, 0);
    id v8 = v11;
    id v10 = v12;
  }
  uint64_t v13 = [v18 UTF8String];
  if (v13) {
    os_log_type_t v14 = (const char *)v13;
  }
  else {
    os_log_type_t v14 = "";
  }
  xpc_array_set_string(v8, 0xFFFFFFFFFFFFFFFFLL, v14);
  uint64_t v15 = [v6 UTF8String];
  if (v15) {
    long long v16 = (const char *)v15;
  }
  else {
    long long v16 = "";
  }
  xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, v16);
  os_log_type_t v17 = [(NWParameters *)self internalParameters];
  nw_parameters_set_required_netagent_classes(v17, v8, v10);
}

- (void)requireNetworkAgentWithUUID:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    nw_multipath_service_t v5 = [(NWParameters *)self internalParameters];
    id v6 = nw_parameters_copy_required_netagent_uuids(v5);

    if (!v6) {
      id v6 = xpc_array_create(0, 0);
    }
    *(void *)uunsigned int uid = 0;
    uint64_t v9 = 0;
    [v4 getUUIDBytes:uuid];
    xpc_array_set_uuid(v6, 0xFFFFFFFFFFFFFFFFLL, uuid);
    id v7 = [(NWParameters *)self internalParameters];
    nw_parameters_set_required_netagent_uuids(v7, v6);
  }
}

- (void)setRequiredCompanionProxyInterfaceType:(int64_t)a3
{
  int v3 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_next_hop_required_interface_type(v4, v3);
}

- (void)setRequiredInterfaceSubtype:(int64_t)a3
{
  int v3 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_required_interface_subtype(v4, v3);
}

- (int64_t)requiredInterfaceSubtype
{
  id v2 = [(NWParameters *)self internalParameters];
  required_interface_subos_log_type_t type = nw_parameters_get_required_interface_subtype(v2);

  return required_interface_subtype;
}

- (void)setRequiredInterfaceType:(int64_t)a3
{
  nw_interface_type_t v3 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_required_interface_type(v4, v3);
}

- (void)setRequiredInterface:(id)a3
{
  id v4 = a3;
  parameters = [(NWParameters *)self internalParameters];
  nw_multipath_service_t v5 = [v4 internalInterface];

  nw_parameters_require_interface(parameters, v5);
}

- (void)prohibitNetworkAgentsWithDomain:(id)a3 type:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    uint64_t v9 = [(NWParameters *)self internalParameters];
    id v10 = nw_parameters_copy_prohibited_netagent_domains(v9);

    xpc_object_t v11 = [(NWParameters *)self internalParameters];
    id v12 = nw_parameters_copy_prohibited_netagent_types(v11);

    if (!v10 || !v12)
    {
      xpc_object_t v13 = xpc_array_create(0, 0);

      xpc_object_t v14 = xpc_array_create(0, 0);
      id v12 = v14;
      id v10 = v13;
    }
    uint64_t v15 = (const char *)[v6 UTF8String];
    if (v15)
    {
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, v15);
      goto LABEL_24;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v16 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    v45 = "-[NWParameters prohibitNetworkAgentsWithDomain:type:]";
    __int16 v46 = 2114;
    id v47 = v6;
    LODWORD(v40) = 22;
    BOOL v38 = buf;
    os_log_type_t v17 = (void *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v42 = 0;
    if (!__nwlog_fault((const char *)v17, &type, &v42))
    {
LABEL_22:
      if (v17) {
        free(v17);
      }
LABEL_24:
      uint64_t v26 = (const char *)objc_msgSend(v8, "UTF8String", v38, v40);
      if (v26)
      {
        xpc_array_set_string(v12, 0xFFFFFFFFFFFFFFFFLL, v26);
LABEL_42:
        size_t v37 = [(NWParameters *)self internalParameters];
        nw_parameters_set_prohibited_netagent_classes(v37, v10, v12);

        goto LABEL_43;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v27 = (id)gLogObj;
      *(_DWORD *)buf = 136446466;
      v45 = "-[NWParameters prohibitNetworkAgentsWithDomain:type:]";
      __int16 v46 = 2114;
      id v47 = v8;
      LODWORD(v41) = 22;
      v39 = buf;
      uint64_t v28 = (void *)_os_log_send_and_compose_impl();

      os_log_type_t type = OS_LOG_TYPE_ERROR;
      char v42 = 0;
      if (!__nwlog_fault((const char *)v28, &type, &v42))
      {
LABEL_40:
        if (v28) {
          free(v28);
        }
        goto LABEL_42;
      }
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v29 = (id)gLogObj;
        os_log_type_t v30 = type;
        if (os_log_type_enabled(v29, type))
        {
          *(_DWORD *)buf = 136446466;
          v45 = "-[NWParameters prohibitNetworkAgentsWithDomain:type:]";
          __int16 v46 = 2114;
          id v47 = v8;
          os_log_type_t v31 = "%{public}s Failed to get UTF8String from type %{public}@";
LABEL_37:
          id v35 = v29;
          os_log_type_t v36 = v30;
LABEL_38:
          _os_log_impl(&dword_1830D4000, v35, v36, v31, buf, 0x16u);
        }
      }
      else
      {
        if (v42)
        {
          backtrace_string = (char *)__nw_create_backtrace_string();
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          uint64_t v29 = (id)gLogObj;
          os_log_type_t v33 = type;
          BOOL v34 = os_log_type_enabled(v29, type);
          if (backtrace_string)
          {
            if (v34)
            {
              *(_DWORD *)buf = 136446722;
              v45 = "-[NWParameters prohibitNetworkAgentsWithDomain:type:]";
              __int16 v46 = 2114;
              id v47 = v8;
              __int16 v48 = 2082;
              xpc_object_t v49 = backtrace_string;
              _os_log_impl(&dword_1830D4000, v29, v33, "%{public}s Failed to get UTF8String from type %{public}@, dumping backtrace:%{public}s", buf, 0x20u);
            }

            free(backtrace_string);
            goto LABEL_40;
          }
          if (!v34) {
            goto LABEL_39;
          }
          *(_DWORD *)buf = 136446466;
          v45 = "-[NWParameters prohibitNetworkAgentsWithDomain:type:]";
          __int16 v46 = 2114;
          id v47 = v8;
          os_log_type_t v31 = "%{public}s Failed to get UTF8String from type %{public}@, no backtrace";
          id v35 = v29;
          os_log_type_t v36 = v33;
          goto LABEL_38;
        }
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v29 = (id)gLogObj;
        os_log_type_t v30 = type;
        if (os_log_type_enabled(v29, type))
        {
          *(_DWORD *)buf = 136446466;
          v45 = "-[NWParameters prohibitNetworkAgentsWithDomain:type:]";
          __int16 v46 = 2114;
          id v47 = v8;
          os_log_type_t v31 = "%{public}s Failed to get UTF8String from type %{public}@, backtrace limit exceeded";
          goto LABEL_37;
        }
      }
LABEL_39:

      goto LABEL_40;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v18 = (id)gLogObj;
      os_log_type_t v19 = type;
      if (os_log_type_enabled(v18, type))
      {
        *(_DWORD *)buf = 136446466;
        v45 = "-[NWParameters prohibitNetworkAgentsWithDomain:type:]";
        __int16 v46 = 2114;
        id v47 = v6;
        BOOL v20 = "%{public}s Failed to get UTF8String from domain %{public}@";
LABEL_19:
        uint64_t v24 = v18;
        os_log_type_t v25 = v19;
LABEL_20:
        _os_log_impl(&dword_1830D4000, v24, v25, v20, buf, 0x16u);
      }
    }
    else
    {
      if (v42)
      {
        BOOL v21 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v18 = (id)gLogObj;
        os_log_type_t v22 = type;
        BOOL v23 = os_log_type_enabled(v18, type);
        if (v21)
        {
          if (v23)
          {
            *(_DWORD *)buf = 136446722;
            v45 = "-[NWParameters prohibitNetworkAgentsWithDomain:type:]";
            __int16 v46 = 2114;
            id v47 = v6;
            __int16 v48 = 2082;
            xpc_object_t v49 = v21;
            _os_log_impl(&dword_1830D4000, v18, v22, "%{public}s Failed to get UTF8String from domain %{public}@, dumping backtrace:%{public}s", buf, 0x20u);
          }

          free(v21);
          goto LABEL_22;
        }
        if (!v23) {
          goto LABEL_21;
        }
        *(_DWORD *)buf = 136446466;
        v45 = "-[NWParameters prohibitNetworkAgentsWithDomain:type:]";
        __int16 v46 = 2114;
        id v47 = v6;
        BOOL v20 = "%{public}s Failed to get UTF8String from domain %{public}@, no backtrace";
        uint64_t v24 = v18;
        os_log_type_t v25 = v22;
        goto LABEL_20;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v18 = (id)gLogObj;
      os_log_type_t v19 = type;
      if (os_log_type_enabled(v18, type))
      {
        *(_DWORD *)buf = 136446466;
        v45 = "-[NWParameters prohibitNetworkAgentsWithDomain:type:]";
        __int16 v46 = 2114;
        id v47 = v6;
        BOOL v20 = "%{public}s Failed to get UTF8String from domain %{public}@, backtrace limit exceeded";
        goto LABEL_19;
      }
    }
LABEL_21:

    goto LABEL_22;
  }
LABEL_43:
}

- (void)prohibitNetworkAgentWithUUID:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    nw_multipath_service_t v5 = [(NWParameters *)self internalParameters];
    id v6 = nw_parameters_copy_prohibited_netagent_uuids(v5);

    if (!v6) {
      id v6 = xpc_array_create(0, 0);
    }
    *(void *)uunsigned int uid = 0;
    uint64_t v9 = 0;
    [v4 getUUIDBytes:uuid];
    xpc_array_set_uuid(v6, 0xFFFFFFFFFFFFFFFFLL, uuid);
    id v7 = [(NWParameters *)self internalParameters];
    nw_parameters_set_prohibited_netagent_uuids(v7, v6);
  }
}

- (void)prohibitInterface:(id)a3
{
  id v9 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  id v5 = nw_parameters_copy_prohibited_interfaces(v4);

  if (!v5) {
    id v5 = xpc_array_create(0, 0);
  }
  id v6 = [v9 internalInterface];
  id v7 = nw_interface_copy_dictionary(v6);

  if (v7)
  {
    xpc_array_set_value(v5, 0xFFFFFFFFFFFFFFFFLL, v7);
    id v8 = [(NWParameters *)self internalParameters];
    nw_parameters_set_prohibited_interfaces(v8, v5);
  }
}

- (void)prohibitInterfaceSubtype:(int64_t)a3
{
  id v5 = [(NWParameters *)self internalParameters];
  objectsa = (xpc_object_t *)nw_parameters_copy_prohibited_interface_subtypes(v5);

  id v6 = objectsa;
  if (!objectsa) {
    id v6 = (xpc_object_t *)xpc_array_create(0, 0);
  }
  objects = v6;
  xpc_array_set_uint64(v6, 0xFFFFFFFFFFFFFFFFLL, a3);
  id v7 = [(NWParameters *)self internalParameters];
  nw_parameters_set_prohibited_interface_subtypes(v7, objects);
}

- (void)prohibitInterfaceType:(int64_t)a3
{
  id v5 = [(NWParameters *)self internalParameters];
  objectsa = (xpc_object_t *)nw_parameters_copy_prohibited_interface_types(v5);

  id v6 = objectsa;
  if (!objectsa) {
    id v6 = (xpc_object_t *)xpc_array_create(0, 0);
  }
  objects = v6;
  xpc_array_set_uint64(v6, 0xFFFFFFFFFFFFFFFFLL, a3);
  id v7 = [(NWParameters *)self internalParameters];
  nw_parameters_set_prohibited_interface_types(v7, objects);
}

- (BOOL)prohibitCellular
{
  id v2 = [(NWParameters *)self internalParameters];
  BOOL prohibit_cellular = nw_parameters_get_prohibit_cellular(v2);

  return prohibit_cellular;
}

- (void)setProhibitRoaming:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_prohibit_roaming(v4, v3);
}

- (void)setProhibitConstrainedPaths:(BOOL)a3
{
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_prohibit_constrained(v4, a3);
}

- (void)setProhibitExpensivePaths:(BOOL)a3
{
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_prohibit_expensive(v4, a3);
}

- (void)setProxyConfiguration:(id)a3
{
  id v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v4)
  {
    id v7 = v4;
    BOOL v5 = object_getClass(v4) == (Class)MEMORY[0x1E4F14590];
    id v4 = v7;
    if (v5)
    {
      id v6 = [(NWParameters *)self internalParameters];
      nw_parameters_set_proxy_configuration(v6, v7);

      id v4 = v7;
    }
  }
}

- (NSDictionary)proxyConfiguration
{
  return 0;
}

- (void)setUrl:(id)a3
{
  id v5 = [a3 absoluteString];
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_url(v4, (const char *)[v5 UTF8String]);
}

- (void)setReuseLocalAddress:(BOOL)a3
{
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_reuse_local_address(v4, a3);
}

- (void)setLocalAddress:(id)a3
{
  id v4 = a3;
  parameters = [(NWParameters *)self internalParameters];
  id v5 = [v4 internalEndpoint];

  nw_parameters_set_local_endpoint(parameters, v5);
}

- (NWAddressEndpoint)localAddress
{
  id v2 = [(NWParameters *)self internalParameters];
  nw_endpoint_t v3 = nw_parameters_copy_local_endpoint(v2);

  if (v3)
  {
    id v4 = +[NWEndpoint endpointWithInternalEndpoint:v3];
  }
  else
  {
    id v4 = 0;
  }

  return (NWAddressEndpoint *)v4;
}

- (void)setRequiredAddressFamily:(unsigned __int8)a3
{
  int v3 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_required_address_family(v4, v3);
}

- (void)setParentID:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  memset(uu, 0, sizeof(uu));
  id v4 = a3;
  uuid_clear(uu);
  [v4 getUUIDBytes:uu];

  id v5 = [(NWParameters *)self internalParameters];
  nw_parameters_set_parent_id_inner(v5, uu, 1);
}

- (NSArray)parentIDs
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(NWParameters *)self internalParameters];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __25__NWParameters_parentIDs__block_invoke;
  v7[3] = &unk_1E5248CA0;
  id v5 = v3;
  id v8 = v5;
  nw_parameters_iterate_parent_ids(v4, v7);

  return (NSArray *)v5;
}

uint64_t __25__NWParameters_parentIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a2];
  [v2 addObject:v3];

  return 1;
}

- (NSUUID)parentID
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  memset(uu, 0, sizeof(uu));
  uuid_clear(uu);
  id v3 = [(NWParameters *)self internalParameters];
  nw_parameters_get_parent_id(v3, uu);

  int is_null = uuid_is_null(uu);
  id v5 = 0;
  if (!is_null) {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:uu];
  }

  return (NSUUID *)v5;
}

- (BOOL)copyEffectiveAuditToken:(id *)a3
{
  id v4 = [(NWParameters *)self internalParameters];
  LOBYTE(a3) = nw_parameters_get_effective_audit_token(v4, a3);

  return (char)a3;
}

- (void)setEffectiveBundleID:(id)a3
{
  id v5 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_effective_bundle_id(v4, (const char *)[v5 UTF8String]);
}

- (void)setEffectiveProcessUUID:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  memset(uu, 0, sizeof(uu));
  id v4 = a3;
  uuid_clear(uu);
  [v4 getUUIDBytes:uu];

  id v5 = [(NWParameters *)self internalParameters];
  nw_parameters_set_e_proc_uuid(v5, uu);
}

- (BOOL)hasDelegatedProcessUUID
{
  id v2 = [(NWParameters *)self internalParameters];
  has_delegated_proc_uunsigned int uid = nw_parameters_has_delegated_proc_uuid(v2);

  return has_delegated_proc_uuid;
}

- (void)setProcessUUID:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  memset(uu, 0, sizeof(uu));
  id v4 = a3;
  uuid_clear(uu);
  [v4 getUUIDBytes:uu];

  id v5 = [(NWParameters *)self internalParameters];
  nw_parameters_set_proc_uuid(v5, uu);
}

- (void)setUid:(unsigned int)a3
{
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_uid(v4, a3);
}

- (BOOL)hasDelegatedPIDForOriginatingPID:(int)a3
{
  id v4 = [(NWParameters *)self internalParameters];
  LOBYTE(a3) = nw_parameters_has_delegated_proc_pid(v4, a3);

  return a3;
}

- (void)setPid:(int)a3
{
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_pid(v4, a3);
}

- (void)setTrafficClass:(unint64_t)a3
{
  int v3 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_traffic_class(v4, v3);
}

- (void)setDataMode:(unint64_t)a3
{
  unsigned int v3 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_data_mode(v4, v3);
}

- (void)setAccount:(id)a3
{
  id v5 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_account_id(v4, (const char *)[v5 UTF8String]);
}

- (BOOL)allowSocketAccess
{
  id v2 = [(NWParameters *)self internalParameters];
  char allow_socket_access = nw_parameters_get_allow_socket_access(v2);

  return allow_socket_access;
}

- (void)setAllowSocketAccess:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_allow_socket_access(v4, v3);
}

- (void)setTrustInvalidCertificates:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NWParameters *)self internalParameters];
  nw_parameters_set_should_trust_invalid_certificates(v4, v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[NWParameters allocWithZone:a3];
  id v5 = [(NWParameters *)self internalParameters];
  BOOL v6 = -[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]((id *)[NWConcrete_nw_parameters alloc], v5, 0, 0);

  uint64_t v7 = [(NWParameters *)v4 initWithParameters:v6];
  return v7;
}

- (NSString)privateDescription
{
  id v2 = [(NWParameters *)self descriptionWithIndent:0 showFullContent:1];

  return (NSString *)v2;
}

- (NWParameters)init
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)NWParameters;
  id v2 = [(NWParameters *)&v26 init];
  if (!v2)
  {
    id v18 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    uint64_t v28 = "-[NWParameters init]";
    uint64_t v7 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v24 = 0;
    if (!__nwlog_fault(v7, &type, &v24)) {
      goto LABEL_14;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      os_log_type_t v19 = __nwlog_obj();
      os_log_type_t v20 = type;
      if (os_log_type_enabled(v19, type))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v28 = "-[NWParameters init]";
        BOOL v21 = "%{public}s [super init] failed";
LABEL_39:
        _os_log_impl(&dword_1830D4000, v19, v20, v21, buf, 0xCu);
      }
    }
    else
    {
      if (v24)
      {
        backtrace_string = __nw_create_backtrace_string();
        os_log_type_t v19 = __nwlog_obj();
        os_log_type_t v20 = type;
        BOOL v23 = os_log_type_enabled(v19, type);
        if (backtrace_string)
        {
          if (v23)
          {
            *(_DWORD *)buf = 136446466;
            uint64_t v28 = "-[NWParameters init]";
            __int16 v29 = 2082;
            os_log_type_t v30 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v19, v20, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          xpc_object_t v14 = (char *)backtrace_string;
LABEL_13:
          free(v14);
          goto LABEL_14;
        }
        if (!v23) {
          goto LABEL_40;
        }
        *(_DWORD *)buf = 136446210;
        uint64_t v28 = "-[NWParameters init]";
        BOOL v21 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_39;
      }
      os_log_type_t v19 = __nwlog_obj();
      os_log_type_t v20 = type;
      if (os_log_type_enabled(v19, type))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v28 = "-[NWParameters init]";
        BOOL v21 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_39;
      }
    }
LABEL_40:

LABEL_14:
    if (!v7)
    {
LABEL_16:
      id v5 = 0;
      goto LABEL_17;
    }
LABEL_15:
    free(v7);
    goto LABEL_16;
  }
  nw_parameters_t v3 = nw_parameters_create();
  internalParameters = v2->_internalParameters;
  v2->_internalParameters = (OS_nw_parameters *)v3;

  if (!v2->_internalParameters)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v6 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    uint64_t v28 = "-[NWParameters init]";
    uint64_t v7 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v24 = 0;
    if (!__nwlog_fault(v7, &type, &v24)) {
      goto LABEL_14;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v8 = (id)gLogObj;
      os_log_type_t v9 = type;
      if (!os_log_type_enabled(v8, type)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 136446210;
      uint64_t v28 = "-[NWParameters init]";
      uint64_t v10 = "%{public}s nw_parameters_create failed";
LABEL_20:
      id v16 = v8;
      os_log_type_t v17 = v9;
      goto LABEL_21;
    }
    if (!v24)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v8 = (id)gLogObj;
      os_log_type_t v9 = type;
      if (!os_log_type_enabled(v8, type)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 136446210;
      uint64_t v28 = "-[NWParameters init]";
      uint64_t v10 = "%{public}s nw_parameters_create failed, backtrace limit exceeded";
      goto LABEL_20;
    }
    xpc_object_t v11 = __nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint64_t v8 = (id)gLogObj;
    os_log_type_t v12 = type;
    BOOL v13 = os_log_type_enabled(v8, type);
    if (!v11)
    {
      if (!v13)
      {
LABEL_22:

        if (!v7) {
          goto LABEL_16;
        }
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136446210;
      uint64_t v28 = "-[NWParameters init]";
      uint64_t v10 = "%{public}s nw_parameters_create failed, no backtrace";
      id v16 = v8;
      os_log_type_t v17 = v12;
LABEL_21:
      _os_log_impl(&dword_1830D4000, v16, v17, v10, buf, 0xCu);
      goto LABEL_22;
    }
    if (v13)
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v28 = "-[NWParameters init]";
      __int16 v29 = 2082;
      os_log_type_t v30 = v11;
      _os_log_impl(&dword_1830D4000, v8, v12, "%{public}s nw_parameters_create failed, dumping backtrace:%{public}s", buf, 0x16u);
    }

    xpc_object_t v14 = (char *)v11;
    goto LABEL_13;
  }
  id v5 = v2;
LABEL_17:

  return v5;
}

+ (NWParameters)parametersWithProtocolBufferData:(id)a3
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v80 = a3;
  nw_parameters_t v3 = [[NWPBParameters alloc] initWithData:v80];
  id v81 = v3;
  if (!v3)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v23 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    size_t v105 = "+[NWParameters parametersWithProtocolBufferData:]";
    char v24 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v98 = 0;
    if (__nwlog_fault(v24, &type, &v98))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v25 = (id)gLogObj;
        os_log_type_t v26 = type;
        if (os_log_type_enabled(v25, type))
        {
          *(_DWORD *)buf = 136446210;
          size_t v105 = "+[NWParameters parametersWithProtocolBufferData:]";
          _os_log_impl(&dword_1830D4000, v25, v26, "%{public}s [NWPBParameters initWithData:] failed", buf, 0xCu);
        }
      }
      else if (v98)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v25 = (id)gLogObj;
        os_log_type_t v77 = type;
        BOOL v78 = os_log_type_enabled(v25, type);
        if (backtrace_string)
        {
          if (v78)
          {
            *(_DWORD *)buf = 136446466;
            size_t v105 = "+[NWParameters parametersWithProtocolBufferData:]";
            __int16 v106 = 2082;
            v107 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v25, v77, "%{public}s [NWPBParameters initWithData:] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          id v27 = 0;
          if (!v24) {
            goto LABEL_21;
          }
          goto LABEL_20;
        }
        if (v78)
        {
          *(_DWORD *)buf = 136446210;
          size_t v105 = "+[NWParameters parametersWithProtocolBufferData:]";
          _os_log_impl(&dword_1830D4000, v25, v77, "%{public}s [NWPBParameters initWithData:] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v25 = (id)gLogObj;
        os_log_type_t v79 = type;
        if (os_log_type_enabled(v25, type))
        {
          *(_DWORD *)buf = 136446210;
          size_t v105 = "+[NWParameters parametersWithProtocolBufferData:]";
          _os_log_impl(&dword_1830D4000, v25, v79, "%{public}s [NWPBParameters initWithData:] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
    id v27 = 0;
    if (!v24)
    {
LABEL_21:
      os_log_type_t v9 = 0;
      goto LABEL_22;
    }
LABEL_20:
    free(v24);
    goto LABEL_21;
  }
  id v4 = v3;
  id v5 = [NWParameters alloc];
  id v6 = [NWConcrete_nw_parameters alloc];
  uint64_t v7 = objc_alloc_init(NWConcrete_nw_protocol_stack);
  uint64_t v8 = -[NWConcrete_nw_parameters initWithStack:]((id *)&v6->super.isa, v7);

  os_log_type_t v9 = [(NWParameters *)v5 initWithParameters:v8];
  if (v4->_effectiveProcessUUID)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F29128]);
    xpc_object_t v11 = v4->_effectiveProcessUUID;
    os_log_type_t v12 = (void *)[v10 initWithUUIDString:v11];
    [(NWParameters *)v9 setEffectiveProcessUUID:v12];
  }
  if (v4->_realProcessUUID)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F29128]);
    xpc_object_t v14 = v4->_realProcessUUID;
    uint64_t v15 = (void *)[v13 initWithUUIDString:v14];
    [(NWParameters *)v9 setProcessUUID:v15];
  }
  localEndpoint = v4->_localEndpoint;
  if (localEndpoint)
  {
    os_log_type_t v17 = localEndpoint;
    id v18 = [(NWPBEndpoint *)v17 data];
    os_log_type_t v19 = +[NWEndpoint endpointWithProtocolBufferData:v18];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(NWParameters *)v9 setLocalAddress:v19];
    }

    id v4 = v81;
  }
  os_log_type_t v20 = v4->_account;
  [(NWParameters *)v9 setAccount:v20];

  __int16 has = (__int16)v4->_has;
  if (has)
  {
    [(NWParameters *)v9 setRequiredAddressFamily:LOBYTE(v4->_addressFamily)];
    __int16 has = (__int16)v4->_has;
  }
  if ((has & 2) != 0) {
    uint64_t dataMode = v4->_dataMode;
  }
  else {
    uint64_t dataMode = 0;
  }
  [(NWParameters *)v9 setDataMode:dataMode];
  __int16 v29 = v4->_effectiveBundleID;
  [(NWParameters *)v9 setEffectiveBundleID:v29];

  os_log_type_t v30 = v4->_metadata;
  [(NWParameters *)v9 setMetadata:v30];

  requiredInterface = v4->_requiredInterface;
  if (requiredInterface)
  {
    BOOL v32 = requiredInterface;
    os_log_type_t v33 = [(NWPBInterface *)v32 data];
    BOOL v34 = +[NWInterface interfaceWithProtocolBufferData:v33];
    [(NWParameters *)v9 setRequiredInterface:v34];

    id v4 = v81;
  }
  if ((*(_WORD *)&v4->_has & 0x10) != 0) {
    uint64_t requiredInterfaceType = v4->_requiredInterfaceType;
  }
  else {
    uint64_t requiredInterfaceType = 0;
  }
  [(NWParameters *)v9 setRequiredInterfaceType:requiredInterfaceType];
  [(NWParameters *)v9 setTrafficClass:v4->_trafficClass];
  url = v4->_url;
  if (url)
  {
    size_t v37 = (void *)MEMORY[0x1E4F1CB10];
    BOOL v38 = url;
    v39 = [v37 URLWithString:v38];
    [(NWParameters *)v9 setUrl:v39];

    id v4 = v81;
  }
  __int16 v40 = (__int16)v4->_has;
  if ((v40 & 0x40) != 0)
  {
    [(NWParameters *)v9 setEnableTFO:v4->_fastOpen];
    __int16 v40 = (__int16)v4->_has;
  }
  if ((v40 & 0x80) != 0) {
    [(NWParameters *)v9 setKeepAlive:v4->_keepalive];
  }
  [(NWParameters *)v9 setUseLongOutstandingQueries:v4->_longOutstandingQueries];
  [(NWParameters *)v9 setMultipathService:v4->_multipathService];
  [(NWParameters *)v9 setProhibitFallback:v4->_noFallback];
  [(NWParameters *)v9 setProhibitExpensivePaths:v4->_prohibitExpensive];
  [(NWParameters *)v9 setReuseLocalAddress:v4->_reuseLocalAddress];
  [(NWParameters *)v9 setUseAWDL:v4->_useAWDL];
  [(NWParameters *)v9 setUseP2P:v4->_useP2P];
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  uint64_t v41 = v4->_requiredAgents;
  uint64_t v42 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v94 objects:v103 count:16];
  if (v42)
  {
    uint64_t v43 = *(void *)v95;
    do
    {
      uint64_t v44 = 0;
      do
      {
        if (*(void *)v95 != v43) {
          objc_enumerationMutation(v41);
        }
        uint64_t v45 = *(void *)(*((void *)&v94 + 1) + 8 * v44);
        if (v45)
        {
          id v46 = *(id *)(v45 + 8);
          id v47 = *(void **)(v45 + 16);
        }
        else
        {
          id v46 = 0;
          id v47 = 0;
        }
        id v48 = v47;
        [(NWParameters *)v9 requireNetworkAgentWithDomain:v46 type:v48];

        ++v44;
      }
      while (v42 != v44);
      uint64_t v49 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v94 objects:v103 count:16];
      uint64_t v42 = v49;
    }
    while (v49);
  }

  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  uint64_t v50 = v81->_preferredAgents;
  uint64_t v51 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v90 objects:v102 count:16];
  if (v51)
  {
    uint64_t v52 = *(void *)v91;
    do
    {
      uint64_t v53 = 0;
      do
      {
        if (*(void *)v91 != v52) {
          objc_enumerationMutation(v50);
        }
        uint64_t v54 = *(void *)(*((void *)&v90 + 1) + 8 * v53);
        if (v54)
        {
          id v55 = *(id *)(v54 + 8);
          size_t v56 = *(void **)(v54 + 16);
        }
        else
        {
          id v55 = 0;
          size_t v56 = 0;
        }
        id v57 = v56;
        [(NWParameters *)v9 preferNetworkAgentWithDomain:v55 type:v57];

        ++v53;
      }
      while (v51 != v53);
      uint64_t v58 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v90 objects:v102 count:16];
      uint64_t v51 = v58;
    }
    while (v58);
  }

  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  v59 = v81->_prohibitedAgents;
  uint64_t v60 = [(NSMutableArray *)v59 countByEnumeratingWithState:&v86 objects:v101 count:16];
  if (v60)
  {
    uint64_t v61 = *(void *)v87;
    do
    {
      uint64_t v62 = 0;
      do
      {
        if (*(void *)v87 != v61) {
          objc_enumerationMutation(v59);
        }
        uint64_t v63 = *(void *)(*((void *)&v86 + 1) + 8 * v62);
        if (v63)
        {
          id v64 = *(id *)(v63 + 8);
          v65 = *(void **)(v63 + 16);
        }
        else
        {
          id v64 = 0;
          v65 = 0;
        }
        id v66 = v65;
        [(NWParameters *)v9 prohibitNetworkAgentsWithDomain:v64 type:v66];

        ++v62;
      }
      while (v60 != v62);
      uint64_t v67 = [(NSMutableArray *)v59 countByEnumeratingWithState:&v86 objects:v101 count:16];
      uint64_t v60 = v67;
    }
    while (v67);
  }

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  v68 = v81->_prohibitedInterfaces;
  uint64_t v69 = [(NSMutableArray *)v68 countByEnumeratingWithState:&v82 objects:v100 count:16];
  if (v69)
  {
    uint64_t v70 = *(void *)v83;
    do
    {
      for (uint64_t i = 0; i != v69; ++i)
      {
        if (*(void *)v83 != v70) {
          objc_enumerationMutation(v68);
        }
        v72 = [*(id *)(*((void *)&v82 + 1) + 8 * i) data];
        xpc_object_t v73 = +[NWInterface interfaceWithProtocolBufferData:v72];
        [(NWParameters *)v9 prohibitInterface:v73];
      }
      uint64_t v69 = [(NSMutableArray *)v68 countByEnumeratingWithState:&v82 objects:v100 count:16];
    }
    while (v69);
  }

  unint64_t v74 = 0;
  id v27 = v81;
  while (v74 < v81->_prohibitedInterfaceTypes.count)
  {
    [(NWParameters *)v9 prohibitInterfaceType:v27->_prohibitedInterfaceTypes.list[v74++]];
    id v27 = v81;
  }
  for (unint64_t j = 0; j < v81->_prohibitedInterfaceSubTypes.count; ++j)
  {
    [(NWParameters *)v9 prohibitInterfaceSubtype:v27->_prohibitedInterfaceSubTypes.list[j]];
    id v27 = v81;
  }
LABEL_22:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end