@interface __CFN_ConnectionMetrics
+ (BOOL)supportsSecureCoding;
- (BOOL)_daemon_isDataBudgetingEnabled;
- (BOOL)_daemon_isDiscretionary;
- (NSString)_daemon_interfaceName;
- (__CFN_ConnectionMetrics)initWithCoder:(id)a3;
- (double)_daemon_establishTime;
- (id).cxx_construct;
- (id)_subflowCounts;
- (id)_tcpInfo;
- (void)encodeWithCoder:(id)a3;
- (void)subflowCounts;
- (void)tcpInfo;
- (void)tlsMetadataReceived:(_WORD *)a1;
@end

@implementation __CFN_ConnectionMetrics

- (id).cxx_construct
{
  *((void *)self + 23) = 0;
  *((void *)self + 24) = 0;
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_daemon_isDiscretionary
{
  return self->_discretionary;
}

- (BOOL)_daemon_isDataBudgetingEnabled
{
  return self->_dataBudgetingEnabled;
}

- (NSString)_daemon_interfaceName
{
  return self->_interfaceName;
}

- (double)_daemon_establishTime
{
  return self->_establishTime;
}

- (void).cxx_destruct
{
  cntrl = self->_transportConnection.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_establishmentReport, 0);
  objc_storeStrong((id *)&self->_networkProtocolName, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_remoteEndpoint, 0);
  objc_storeStrong((id *)&self->_localEndpoint, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_initiatingTransactionID, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_cachedSubflowCounts, 0);
  objc_storeStrong((id *)&self->_cachedTCPInfoAtEnd, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)tcpInfo
{
  p_os_unfair_lock_opaque = &a1->_os_unfair_lock_opaque;
  if (a1)
  {
    os_unfair_lock_lock(a1 + 2);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v5 = __34____CFN_ConnectionMetrics_tcpInfo__block_invoke;
    v6 = &unk_1E5258228;
    v7 = p_os_unfair_lock_opaque;
    v2 = (void *)p_os_unfair_lock_opaque[6];
    if (v2)
    {
      p_os_unfair_lock_opaque = v2;
      __34____CFN_ConnectionMetrics_tcpInfo__block_invoke((uint64_t)v4);
    }
    else
    {
      *((unsigned char *)p_os_unfair_lock_opaque + 12) = 1;
      p_os_unfair_lock_opaque = -[__CFN_ConnectionMetrics _tcpInfo]((uint64_t)p_os_unfair_lock_opaque);
      v5((uint64_t)v4);
    }
  }

  return p_os_unfair_lock_opaque;
}

- (id)_tcpInfo
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
  id v2 = *(id *)(a1 + 40);
  if (v2)
  {
    v3 = (void *)nw_connection_copy_tcp_info();
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)subflowCounts
{
  p_os_unfair_lock_opaque = &a1->_os_unfair_lock_opaque;
  if (a1)
  {
    if (BYTE2(a1[4]._os_unfair_lock_opaque))
    {
      os_unfair_lock_lock(a1 + 2);
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v5 = __40____CFN_ConnectionMetrics_subflowCounts__block_invoke;
      v6 = &unk_1E5258228;
      v7 = p_os_unfair_lock_opaque;
      id v2 = (void *)p_os_unfair_lock_opaque[7];
      if (v2)
      {
        p_os_unfair_lock_opaque = v2;
        __40____CFN_ConnectionMetrics_subflowCounts__block_invoke((uint64_t)v4);
      }
      else
      {
        *((unsigned char *)p_os_unfair_lock_opaque + 13) = 1;
        p_os_unfair_lock_opaque = -[__CFN_ConnectionMetrics _subflowCounts]((uint64_t)p_os_unfair_lock_opaque);
        v5((uint64_t)v4);
      }
    }
    else
    {
      p_os_unfair_lock_opaque = 0;
    }
  }

  return p_os_unfair_lock_opaque;
}

- (void)tlsMetadataReceived:(_WORD *)a1
{
  v3 = a2;
  if (a1)
  {
    metadata = v3;
    negotiated_protocol = sec_protocol_metadata_get_negotiated_protocol(v3);
    if (negotiated_protocol)
    {
      v5 = [NSString stringWithUTF8String:negotiated_protocol];
      objc_setProperty_atomic_copy(a1, v6, v5, 160);
    }
    a1[14] = sec_protocol_metadata_get_negotiated_tls_protocol_version(metadata);
    a1[15] = sec_protocol_metadata_get_negotiated_tls_ciphersuite(metadata);
    v3 = metadata;
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 64, 1);
  }
  else {
    id Property = 0;
  }
  [v11 encodeObject:Property forKey:@"UUID"];
  [v11 encodeInt64:self->_identifier forKey:@"identifier"];
  [v11 encodeObject:self->_initiatingTransactionID forKey:@"initiatingTransactionID"];
  [v11 encodeDouble:@"beginTime" forKey:self->_beginTime];
  [v11 encodeDouble:@"establishTime" forKey:self->_establishTime];
  [v11 encodeDouble:@"endTime" forKey:self->_endTime];
  if (self->_endpoint)
  {
    SEL v6 = objc_msgSend(MEMORY[0x1E4F38BE8], "endpointWithCEndpoint:");
    [v11 encodeObject:v6 forKey:@"endpoint"];
  }
  [v11 encodeBool:self->_TLSConfigured forKey:@"TLSConfigured"];
  [v11 encodeInteger:self->_http3DiscoveryStatus forKey:@"http3DiscoveryStatus"];
  if (self->_localEndpoint)
  {
    v7 = objc_msgSend(MEMORY[0x1E4F38BE8], "endpointWithCEndpoint:");
    [v11 encodeObject:v7 forKey:@"localEndpoint"];
  }
  if (self->_remoteEndpoint)
  {
    v8 = objc_msgSend(MEMORY[0x1E4F38BE8], "endpointWithCEndpoint:");
    [v11 encodeObject:v8 forKey:@"remoteEndpoint"];
  }
  [v11 encodeObject:self->_interfaceName forKey:@"interfaceName"];
  [v11 encodeBool:self->_cellular forKey:@"cellular"];
  [v11 encodeBool:self->_expensive forKey:@"expensive"];
  [v11 encodeBool:self->_constrained forKey:@"constrained"];
  [v11 encodeBool:self->_multipath forKey:@"multipath"];
  [v11 encodeBool:self->_usedTFO forKey:@"usedTFO"];
  [v11 encodeBool:self->_isUnlistedTracker forKey:@"isUnlistedTracker"];
  objc_msgSend(v11, "encodeObject:forKey:", objc_getProperty(self, v9, 160, 1), @"networkProtocolName");
  [v11 encodeInt:self->_negotiatedTLSProtocolVersion forKey:@"negotiatedTLSProtocolVersion"];
  [v11 encodeInt:self->_negotiatedTLSCipherSuite forKey:@"negotiatedTLSCipherSuite"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_establishmentReport)
  {
    v10 = (void *)nw_establishment_report_copy_dictionary();
    [v11 encodeXPCObject:v10 forKey:@"establishmentReport"];
  }
  [v11 encodeInt:self->_privacyStance forKey:@"privacyStance"];
  [v11 encodeDouble:@"idleAtTime" forKey:self->_idleAtTime];
}

- (__CFN_ConnectionMetrics)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)__CFN_ConnectionMetrics;
  v5 = [(__CFN_ConnectionMetrics *)&v32 init];
  if (v5)
  {
    SEL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    objc_setProperty_atomic(v5, v7, v6, 64);

    v5->_identifier = [v4 decodeInt64ForKey:@"identifier"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"initiatingTransactionID"];
    initiatingTransactionID = v5->_initiatingTransactionID;
    v5->_initiatingTransactionID = (NSUUID *)v8;

    [v4 decodeDoubleForKey:@"beginTime"];
    v5->_beginTime = v10;
    [v4 decodeDoubleForKey:@"establishTime"];
    v5->_establishTime = v11;
    [v4 decodeDoubleForKey:@"endTime"];
    v5->_endTime = v12;
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endpoint"];
    uint64_t v14 = [v13 copyCEndpoint];
    endpoint = v5->_endpoint;
    v5->_endpoint = (OS_nw_endpoint *)v14;

    v5->_TLSConfigured = [v4 decodeBoolForKey:@"TLSConfigured"];
    v5->_http3DiscoveryStatus = [v4 decodeIntegerForKey:@"http3DiscoveryStatus"];
    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localEndpoint"];
    uint64_t v17 = [v16 copyCEndpoint];
    localEndpoint = v5->_localEndpoint;
    v5->_localEndpoint = (OS_nw_endpoint *)v17;

    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteEndpoint"];
    uint64_t v20 = [v19 copyCEndpoint];
    remoteEndpoint = v5->_remoteEndpoint;
    v5->_remoteEndpoint = (OS_nw_endpoint *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interfaceName"];
    interfaceName = v5->_interfaceName;
    v5->_interfaceName = (NSString *)v22;

    v5->_cellular = [v4 decodeBoolForKey:@"cellular"];
    v5->_expensive = [v4 decodeBoolForKey:@"expensive"];
    v5->_constrained = [v4 decodeBoolForKey:@"constrained"];
    v5->_multipath = [v4 decodeBoolForKey:@"multipath"];
    v5->_usedTFO = [v4 decodeBoolForKey:@"usedTFO"];
    v5->_isUnlistedTracker = [v4 decodeBoolForKey:@"isUnlistedTracker"];
    v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"networkProtocolName"];
    objc_setProperty_atomic_copy(v5, v25, v24, 160);

    v5->_negotiatedTLSProtocolVersion = [v4 decodeIntForKey:@"negotiatedTLSProtocolVersion"];
    v5->_negotiatedTLSCipherSuite = [v4 decodeIntForKey:@"negotiatedTLSCipherSuite"];
    [v4 decodeDoubleForKey:@"idleAtTime"];
    v5->_idleAtTime = v26;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = [v4 decodeXPCObjectOfType:MEMORY[0x1E4F14590] forKey:@"establishmentReport"];
      if (v27)
      {
        uint64_t v28 = nw_establishment_report_create_from_dictionary();
        establishmentReport = v5->_establishmentReport;
        v5->_establishmentReport = (OS_nw_establishment_report *)v28;
      }
    }
    v5->_privacyStance = [v4 decodeIntForKey:@"privacyStance"];
    [v4 decodeDoubleForKey:@"idleAtTime"];
    v5->_idleAtTime = v30;
  }
  return v5;
}

- (id)_subflowCounts
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
  id v2 = *(id *)(a1 + 40);
  if (v2 && (v3 = (void *)nw_connection_multipath_copy_subflow_counts(), (id v4 = v3) != 0))
  {
    v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:xpc_dictionary_get_count(v3)];
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = __41____CFN_ConnectionMetrics__subflowCounts__block_invoke;
    applier[3] = &unk_1E5256350;
    id v6 = v5;
    id v9 = v6;
    xpc_dictionary_apply(v4, applier);
  }
  else
  {

    id v6 = 0;
  }

  return v6;
}

@end