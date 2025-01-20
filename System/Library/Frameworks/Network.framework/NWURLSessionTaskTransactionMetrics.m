@interface NWURLSessionTaskTransactionMetrics
- (BOOL)_isUnlistedTracker;
- (BOOL)_usedTFO;
- (BOOL)isCellular;
- (BOOL)isConstrained;
- (BOOL)isExpensive;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)isMultipath;
- (BOOL)isProxyConnection;
- (BOOL)isReusedConnection;
- (NSDate)connectEndDate;
- (NSDate)connectStartDate;
- (NSDate)domainLookupEndDate;
- (NSDate)domainLookupStartDate;
- (NSDate)fetchStartDate;
- (NSDate)requestEndDate;
- (NSDate)requestStartDate;
- (NSDate)responseEndDate;
- (NSDate)responseStartDate;
- (NSDate)secureConnectionEndDate;
- (NSDate)secureConnectionStartDate;
- (NSNumber)localPort;
- (NSNumber)negotiatedTLSCipherSuite;
- (NSNumber)negotiatedTLSProtocolVersion;
- (NSNumber)remotePort;
- (NSString)localAddress;
- (NSString)networkProtocolName;
- (NSString)remoteAddress;
- (NSURLRequest)request;
- (NSURLResponse)response;
- (NSUUID)_connectionIdentifier;
- (id)initWithTransactionMetadata:(void *)a3 clientMetadata:;
- (int)_privacyStance;
- (int64_t)countOfRequestBodyBytesBeforeEncoding;
- (int64_t)countOfRequestBodyBytesSent;
- (int64_t)countOfRequestHeaderBytesSent;
- (int64_t)countOfResponseBodyBytesAfterDecoding;
- (int64_t)countOfResponseBodyBytesReceived;
- (int64_t)countOfResponseHeaderBytesReceived;
- (int64_t)domainResolutionProtocol;
- (int64_t)resourceFetchType;
- (nw_endpoint_t)localEndpoint;
- (nw_endpoint_t)remoteEndpoint;
- (void)computeConnectionTiming;
@end

@implementation NWURLSessionTaskTransactionMetrics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientMetadata, 0);

  objc_storeStrong((id *)&self->_transactionMetadata, 0);
}

- (BOOL)_usedTFO
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v3 = connection_metadata;
  if (connection_metadata)
  {
    v4 = connection_metadata;
    v5 = nw_protocol_metadata_copy_definition(v4);
    if (nw_protocol_copy_http_connection_definition_onceToken != -1) {
      dispatch_once(&nw_protocol_copy_http_connection_definition_onceToken, &__block_literal_global_89);
    }
    BOOL is_equal = nw_protocol_definition_is_equal(v5, (nw_protocol_definition_t)nw_protocol_copy_http_connection_definition_definition);

    if (is_equal)
    {
      *(void *)type = 0;
      v19 = type;
      uint64_t v20 = 0x2020000000;
      char v21 = 0;
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __nw_http_connection_metadata_used_tfo_block_invoke;
      v24 = &unk_1E5248E90;
      v25 = type;
      uint64_t isa = (uint64_t)v4[4].isa;
      if (isa)
      {
        __nw_http_connection_metadata_used_tfo_block_invoke((uint64_t)buf, isa);
        BOOL v8 = *((unsigned char *)v19 + 24) != 0;
      }
      else
      {
        BOOL v8 = 0;
      }
      _Block_object_dispose(type, 8);
LABEL_12:

      goto LABEL_13;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v10 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = "nw_http_connection_metadata_used_tfo";
    v11 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    char v22 = 0;
    if (__nwlog_fault(v11, type, &v22))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v12 = (id)gLogObj;
        os_log_type_t v13 = type[0];
        if (os_log_type_enabled(v12, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_connection_metadata_used_tfo";
          _os_log_impl(&dword_1830D4000, v12, v13, "%{public}s metadata must be http_connection", buf, 0xCu);
        }
      }
      else if (v22)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v12 = (id)gLogObj;
        os_log_type_t v15 = type[0];
        BOOL v16 = os_log_type_enabled(v12, type[0]);
        if (backtrace_string)
        {
          if (v16)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = "nw_http_connection_metadata_used_tfo";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = backtrace_string;
            _os_log_impl(&dword_1830D4000, v12, v15, "%{public}s metadata must be http_connection, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_30;
        }
        if (v16)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_connection_metadata_used_tfo";
          _os_log_impl(&dword_1830D4000, v12, v15, "%{public}s metadata must be http_connection, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v12 = (id)gLogObj;
        os_log_type_t v17 = type[0];
        if (os_log_type_enabled(v12, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_connection_metadata_used_tfo";
          _os_log_impl(&dword_1830D4000, v12, v17, "%{public}s metadata must be http_connection, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_30:
    if (v11) {
      free(v11);
    }
    BOOL v8 = 0;
    goto LABEL_12;
  }
  BOOL v8 = 0;
LABEL_13:

  return v8;
}

- (BOOL)_isUnlistedTracker
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v3 = connection_metadata;
  if (connection_metadata)
  {
    v4 = connection_metadata;
    v5 = nw_protocol_metadata_copy_definition(v4);
    if (nw_protocol_copy_http_connection_definition_onceToken != -1) {
      dispatch_once(&nw_protocol_copy_http_connection_definition_onceToken, &__block_literal_global_89);
    }
    BOOL is_equal = nw_protocol_definition_is_equal(v5, (nw_protocol_definition_t)nw_protocol_copy_http_connection_definition_definition);

    if (is_equal)
    {
      *(void *)type = 0;
      v19 = type;
      uint64_t v20 = 0x2020000000;
      char v21 = 0;
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __nw_http_connection_metadata_is_unlisted_tracker_block_invoke;
      v24 = &unk_1E5248E90;
      v25 = type;
      uint64_t isa = (uint64_t)v4[4].isa;
      if (isa)
      {
        __nw_http_connection_metadata_is_unlisted_tracker_block_invoke((uint64_t)buf, isa);
        BOOL v8 = *((unsigned char *)v19 + 24) != 0;
      }
      else
      {
        BOOL v8 = 0;
      }
      _Block_object_dispose(type, 8);
LABEL_12:

      goto LABEL_13;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v10 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = "nw_http_connection_metadata_is_unlisted_tracker";
    v11 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    char v22 = 0;
    if (__nwlog_fault(v11, type, &v22))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v12 = (id)gLogObj;
        os_log_type_t v13 = type[0];
        if (os_log_type_enabled(v12, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_connection_metadata_is_unlisted_tracker";
          _os_log_impl(&dword_1830D4000, v12, v13, "%{public}s metadata must be http_connection", buf, 0xCu);
        }
      }
      else if (v22)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v12 = (id)gLogObj;
        os_log_type_t v15 = type[0];
        BOOL v16 = os_log_type_enabled(v12, type[0]);
        if (backtrace_string)
        {
          if (v16)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = "nw_http_connection_metadata_is_unlisted_tracker";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = backtrace_string;
            _os_log_impl(&dword_1830D4000, v12, v15, "%{public}s metadata must be http_connection, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_30;
        }
        if (v16)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_connection_metadata_is_unlisted_tracker";
          _os_log_impl(&dword_1830D4000, v12, v15, "%{public}s metadata must be http_connection, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v12 = (id)gLogObj;
        os_log_type_t v17 = type[0];
        if (os_log_type_enabled(v12, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_connection_metadata_is_unlisted_tracker";
          _os_log_impl(&dword_1830D4000, v12, v17, "%{public}s metadata must be http_connection, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_30:
    if (v11) {
      free(v11);
    }
    BOOL v8 = 0;
    goto LABEL_12;
  }
  BOOL v8 = 0;
LABEL_13:

  return v8;
}

- (int)_privacyStance
{
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v3 = connection_metadata;
  if (connection_metadata) {
    int privacy_stance = nw_http_connection_metadata_get_privacy_stance(connection_metadata);
  }
  else {
    int privacy_stance = 0;
  }

  return privacy_stance;
}

- (NSUUID)_connectionIdentifier
{
  v6[2] = *MEMORY[0x1E4F143B8];
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v3 = connection_metadata;
  if (connection_metadata)
  {
    v6[0] = 0;
    v6[1] = 0;
    nw_http_connection_metadata_get_uuid(connection_metadata, (uint64_t)v6);
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v6];
  }
  else
  {
    v4 = 0;
  }

  return (NSUUID *)v4;
}

- (int64_t)domainResolutionProtocol
{
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v3 = connection_metadata;
  if (connection_metadata
    && (establishment_report = nw_http_connection_metadata_get_establishment_report(connection_metadata)) != 0)
  {
    v5 = establishment_report;
    uint64_t v9 = 0;
    id v10 = &v9;
    int v12 = 0;
    uint64_t v11 = 0x2020000000;
    enumerate_block[0] = MEMORY[0x1E4F143A8];
    enumerate_block[1] = 3221225472;
    enumerate_block[2] = __62__NWURLSessionTaskTransactionMetrics_domainResolutionProtocol__block_invoke;
    enumerate_block[3] = &unk_1E523EE38;
    enumerate_block[4] = &v9;
    nw_establishment_report_enumerate_resolution_reports(establishment_report, enumerate_block);
    int64_t v6 = *((unsigned int *)v10 + 6);
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

uint64_t __62__NWURLSessionTaskTransactionMetrics_domainResolutionProtocol__block_invoke(uint64_t a1, nw_resolution_report_t resolution_report)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = nw_resolution_report_get_protocol(resolution_report);
  return 0;
}

- (BOOL)isMultipath
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v3 = connection_metadata;
  if (connection_metadata)
  {
    v4 = connection_metadata;
    v5 = nw_protocol_metadata_copy_definition(v4);
    if (nw_protocol_copy_http_connection_definition_onceToken != -1) {
      dispatch_once(&nw_protocol_copy_http_connection_definition_onceToken, &__block_literal_global_89);
    }
    BOOL is_equal = nw_protocol_definition_is_equal(v5, (nw_protocol_definition_t)nw_protocol_copy_http_connection_definition_definition);

    if (is_equal)
    {
      *(void *)type = 0;
      v19 = type;
      uint64_t v20 = 0x2020000000;
      char v21 = 0;
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __nw_http_connection_metadata_is_multipath_block_invoke;
      v24 = &unk_1E5248E90;
      v25 = type;
      uint64_t isa = (uint64_t)v4[4].isa;
      if (isa)
      {
        __nw_http_connection_metadata_is_multipath_block_invoke((uint64_t)buf, isa);
        BOOL v8 = *((unsigned char *)v19 + 24) != 0;
      }
      else
      {
        BOOL v8 = 0;
      }
      _Block_object_dispose(type, 8);
LABEL_12:

      goto LABEL_13;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v10 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = "nw_http_connection_metadata_is_multipath";
    uint64_t v11 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    char v22 = 0;
    if (__nwlog_fault(v11, type, &v22))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        int v12 = (id)gLogObj;
        os_log_type_t v13 = type[0];
        if (os_log_type_enabled(v12, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_connection_metadata_is_multipath";
          _os_log_impl(&dword_1830D4000, v12, v13, "%{public}s metadata must be http_connection", buf, 0xCu);
        }
      }
      else if (v22)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        int v12 = (id)gLogObj;
        os_log_type_t v15 = type[0];
        BOOL v16 = os_log_type_enabled(v12, type[0]);
        if (backtrace_string)
        {
          if (v16)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = "nw_http_connection_metadata_is_multipath";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = backtrace_string;
            _os_log_impl(&dword_1830D4000, v12, v15, "%{public}s metadata must be http_connection, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_30;
        }
        if (v16)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_connection_metadata_is_multipath";
          _os_log_impl(&dword_1830D4000, v12, v15, "%{public}s metadata must be http_connection, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        int v12 = (id)gLogObj;
        os_log_type_t v17 = type[0];
        if (os_log_type_enabled(v12, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_connection_metadata_is_multipath";
          _os_log_impl(&dword_1830D4000, v12, v17, "%{public}s metadata must be http_connection, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_30:
    if (v11) {
      free(v11);
    }
    BOOL v8 = 0;
    goto LABEL_12;
  }
  BOOL v8 = 0;
LABEL_13:

  return v8;
}

- (BOOL)isConstrained
{
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v3 = connection_metadata;
  if (connection_metadata && (path = nw_http_connection_metadata_get_path(connection_metadata)) != 0)
  {
    v5 = path;
    BOOL is_constrained = nw_path_is_constrained(path);
  }
  else
  {
    BOOL is_constrained = 0;
  }

  return is_constrained;
}

- (BOOL)isExpensive
{
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v3 = connection_metadata;
  if (connection_metadata && (path = nw_http_connection_metadata_get_path(connection_metadata)) != 0)
  {
    v5 = path;
    BOOL is_expensive = nw_path_is_expensive(path);
  }
  else
  {
    BOOL is_expensive = 0;
  }

  return is_expensive;
}

- (BOOL)isCellular
{
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v3 = connection_metadata;
  if (connection_metadata && (path = nw_http_connection_metadata_get_path(connection_metadata)) != 0)
  {
    v5 = path;
    BOOL v6 = nw_path_uses_interface_type(path, nw_interface_type_cellular);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (NSNumber)negotiatedTLSCipherSuite
{
  v2 = self;
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v4 = connection_metadata;
  if (connection_metadata
    && (sec_metadata = nw_http_connection_metadata_get_sec_metadata(connection_metadata)) != 0
    || (!v2 ? (clientMetadata = 0) : (clientMetadata = v2->_clientMetadata),
        (sec_metadata = nw_http_client_metadata_get_sec_metadata(clientMetadata)) != 0))
  {
    v7 = [NSNumber numberWithUnsignedShort:sec_protocol_metadata_get_negotiated_tls_ciphersuite(sec_metadata)];
  }
  else
  {
    v7 = 0;
  }

  return (NSNumber *)v7;
}

- (NSNumber)negotiatedTLSProtocolVersion
{
  v2 = self;
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v4 = connection_metadata;
  if (connection_metadata
    && (sec_metadata = nw_http_connection_metadata_get_sec_metadata(connection_metadata)) != 0
    || (!v2 ? (clientMetadata = 0) : (clientMetadata = v2->_clientMetadata),
        (sec_metadata = nw_http_client_metadata_get_sec_metadata(clientMetadata)) != 0))
  {
    v7 = [NSNumber numberWithUnsignedShort:sec_protocol_metadata_get_negotiated_tls_protocol_version(sec_metadata)];
  }
  else
  {
    v7 = 0;
  }

  return (NSNumber *)v7;
}

- (NSNumber)remotePort
{
  v2 = -[NWURLSessionTaskTransactionMetrics remoteEndpoint]((uint64_t)self);
  v3 = v2;
  if (v2 && (id v4 = v2, v5 = [v4 type], v4, v5 == 1))
  {
    BOOL v6 = NSNumber;
    id v7 = v4;
    uint64_t v8 = __rev16([v7 port]);

    uint64_t v9 = [v6 numberWithUnsignedShort:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return (NSNumber *)v9;
}

- (nw_endpoint_t)remoteEndpoint
{
  if (a1)
  {
    id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(*(void **)(a1 + 104));
    v2 = connection_metadata;
    if (connection_metadata)
    {
      if (nw_http_connection_metadata_get_privacy_stance(connection_metadata) == 2)
      {
        establishment_report = nw_http_connection_metadata_get_establishment_report(v2);
        if (establishment_report)
        {
          id v4 = establishment_report;
          uint64_t v9 = 0;
          id v10 = &v9;
          uint64_t v11 = 0x3032000000;
          int v12 = __Block_byref_object_copy__28559;
          os_log_type_t v13 = __Block_byref_object_dispose__28560;
          id v14 = 0;
          v8[0] = MEMORY[0x1E4F143A8];
          v8[1] = 3221225472;
          v8[2] = __52__NWURLSessionTaskTransactionMetrics_remoteEndpoint__block_invoke;
          v8[3] = &unk_1E523EE10;
          v8[4] = &v9;
          nw_establishment_report_enumerate_proxied_next_hop_endpoints(establishment_report, v8);
          nw_endpoint_t v5 = (nw_endpoint_t)(id)v10[5];
          _Block_object_dispose(&v9, 8);

LABEL_8:
LABEL_10:

          goto LABEL_11;
        }
      }
      else
      {
        path = nw_http_connection_metadata_get_path(v2);
        if (path)
        {
          id v4 = path;
          nw_endpoint_t v5 = nw_path_copy_effective_remote_endpoint(path);
          goto LABEL_8;
        }
      }
    }
    nw_endpoint_t v5 = 0;
    goto LABEL_10;
  }
  nw_endpoint_t v5 = 0;
LABEL_11:

  return v5;
}

uint64_t __52__NWURLSessionTaskTransactionMetrics_remoteEndpoint__block_invoke(uint64_t a1, void *a2)
{
  return 1;
}

- (NSString)remoteAddress
{
  v2 = -[NWURLSessionTaskTransactionMetrics remoteEndpoint]((uint64_t)self);
  v3 = v2;
  if (v2 && (id v4 = v2, v5 = [v4 type], v4, v5 == 1))
  {
    BOOL v6 = NSString;
    id v7 = v4;
    uint64_t v8 = [v7 hostname];

    uint64_t v9 = [v6 stringWithUTF8String:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return (NSString *)v9;
}

- (NSNumber)localPort
{
  v2 = -[NWURLSessionTaskTransactionMetrics localEndpoint]((uint64_t)self);
  v3 = v2;
  if (v2 && (id v4 = v2, v5 = [v4 type], v4, v5 == 1))
  {
    BOOL v6 = NSNumber;
    id v7 = v4;
    uint64_t v8 = __rev16([v7 port]);

    uint64_t v9 = [v6 numberWithUnsignedShort:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return (NSNumber *)v9;
}

- (nw_endpoint_t)localEndpoint
{
  if (a1)
  {
    id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(*(void **)(a1 + 104));
    v2 = connection_metadata;
    if (connection_metadata && (path = nw_http_connection_metadata_get_path(connection_metadata)) != 0)
    {
      id v4 = path;
      nw_endpoint_t v5 = nw_path_copy_effective_local_endpoint(path);
    }
    else
    {
      nw_endpoint_t v5 = 0;
    }
  }
  else
  {
    nw_endpoint_t v5 = 0;
  }

  return v5;
}

- (NSString)localAddress
{
  v2 = -[NWURLSessionTaskTransactionMetrics localEndpoint]((uint64_t)self);
  v3 = v2;
  if (v2 && (id v4 = v2, v5 = [v4 type], v4, v5 == 1))
  {
    BOOL v6 = NSString;
    id v7 = v4;
    uint64_t v8 = [v7 hostname];

    uint64_t v9 = [v6 stringWithUTF8String:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return (NSString *)v9;
}

- (int64_t)countOfResponseBodyBytesAfterDecoding
{
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  return nw_http_transaction_metadata_get_inbound_body_size(self);
}

- (int64_t)countOfResponseBodyBytesReceived
{
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  return nw_http_transaction_metadata_get_inbound_body_transfer_size(self);
}

- (int64_t)countOfResponseHeaderBytesReceived
{
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  return nw_http_transaction_metadata_get_inbound_header_size(self);
}

- (int64_t)countOfRequestBodyBytesBeforeEncoding
{
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  return nw_http_transaction_metadata_get_outbound_body_size(self);
}

- (int64_t)countOfRequestBodyBytesSent
{
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  return nw_http_transaction_metadata_get_outbound_body_transfer_size(self);
}

- (int64_t)countOfRequestHeaderBytesSent
{
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  return nw_http_transaction_metadata_get_outbound_header_size(self);
}

- (int64_t)resourceFetchType
{
  return 1;
}

- (BOOL)isReusedConnection
{
  v2 = self;
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  if (connection_metadata)
  {
    if (v2) {
      transactionMetadata = v2->_transactionMetadata;
    }
    else {
      transactionMetadata = 0;
    }
    BOOL v5 = !nw_http_transaction_metadata_is_first_on_connection(transactionMetadata);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)isProxyConnection
{
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v3 = connection_metadata;
  if (connection_metadata
    && (id establishment_report = nw_http_connection_metadata_get_establishment_report(connection_metadata)) != 0)
  {
    BOOL v5 = (unsigned __int8 *)establishment_report;
    BOOL v6 = (v5[84] >> 1) & 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (NSString)networkProtocolName
{
  v2 = self;
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  id v4 = connection_metadata;
  if (connection_metadata
    && (sec_metadata = nw_http_connection_metadata_get_sec_metadata(connection_metadata)) != 0
    || (!v2 ? (clientMetadata = 0) : (clientMetadata = v2->_clientMetadata),
        (sec_metadata = nw_http_client_metadata_get_sec_metadata(clientMetadata)) != 0))
  {
    negotiated_protocol = sec_protocol_metadata_get_negotiated_protocol(sec_metadata);
    if (negotiated_protocol)
    {
      uint64_t v8 = [NSString stringWithUTF8String:negotiated_protocol];
    }
    else
    {

      uint64_t v8 = @"http/1.1";
    }
  }
  else
  {
    uint64_t v9 = @"http/1.1";
    if (!v4) {
      uint64_t v9 = 0;
    }
    uint64_t v8 = v9;
  }

  return (NSString *)v8;
}

- (NSDate)responseEndDate
{
  v2 = self;
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  inbound_message_end_time = (void *)nw_http_transaction_metadata_get_inbound_message_end_time(self);
  if (inbound_message_end_time)
  {
    uint64_t v4 = (uint64_t)inbound_message_end_time;
    if (v2) {
      clientMetadata = v2->_clientMetadata;
    }
    else {
      clientMetadata = 0;
    }
    inbound_message_end_time = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSinceReferenceDate:", nw_http_client_metadata_convert_time_to_absolute(clientMetadata, v4));
  }

  return (NSDate *)inbound_message_end_time;
}

- (NSDate)responseStartDate
{
  v2 = self;
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  inbound_message_start_time = (void *)nw_http_transaction_metadata_get_inbound_message_start_time(self);
  if (inbound_message_start_time)
  {
    uint64_t v4 = (uint64_t)inbound_message_start_time;
    if (v2) {
      clientMetadata = v2->_clientMetadata;
    }
    else {
      clientMetadata = 0;
    }
    inbound_message_start_time = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSinceReferenceDate:", nw_http_client_metadata_convert_time_to_absolute(clientMetadata, v4));
  }

  return (NSDate *)inbound_message_start_time;
}

- (NSDate)requestEndDate
{
  v2 = self;
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  outbound_message_end_time = (void *)nw_http_transaction_metadata_get_outbound_message_end_time(self);
  if (outbound_message_end_time)
  {
    uint64_t v4 = (uint64_t)outbound_message_end_time;
    if (v2) {
      clientMetadata = v2->_clientMetadata;
    }
    else {
      clientMetadata = 0;
    }
    outbound_message_end_time = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSinceReferenceDate:", nw_http_client_metadata_convert_time_to_absolute(clientMetadata, v4));
  }

  return (NSDate *)outbound_message_end_time;
}

- (NSDate)requestStartDate
{
  v2 = self;
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  outbound_message_start_time = (void *)nw_http_transaction_metadata_get_outbound_message_start_time(self);
  if (outbound_message_start_time)
  {
    uint64_t v4 = (uint64_t)outbound_message_start_time;
    if (v2) {
      clientMetadata = v2->_clientMetadata;
    }
    else {
      clientMetadata = 0;
    }
    outbound_message_start_time = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSinceReferenceDate:", nw_http_client_metadata_convert_time_to_absolute(clientMetadata, v4));
  }

  return (NSDate *)outbound_message_start_time;
}

- (NSDate)connectEndDate
{
  v2 = self;
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  if (nw_http_transaction_metadata_is_first_on_connection(self)
    && (-[NWURLSessionTaskTransactionMetrics computeConnectionTiming]((uint64_t)v2), v2->connectionTiming.valid))
  {
    start_time = (void *)nw_http_transaction_metadata_get_start_time(v2->_transactionMetadata);
    if (start_time) {
      start_time = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSinceReferenceDate:", nw_http_client_metadata_convert_time_to_absolute(v2->_clientMetadata, (uint64_t)start_time)+ (double)(v2->connectionTiming.connectDurationMS + v2->connectionTiming.connectStartTimeMS)* 0.001);
    }
  }
  else
  {
    start_time = 0;
  }

  return (NSDate *)start_time;
}

- (void)computeConnectionTiming
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a1 && !*(unsigned char *)(a1 + 97))
  {
    id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(*(void **)(a1 + 104));
    v3 = connection_metadata;
    if (!connection_metadata)
    {
LABEL_20:

      return;
    }
    id establishment_report = nw_http_connection_metadata_get_establishment_report(connection_metadata);
    BOOL v5 = establishment_report;
    if (!establishment_report)
    {
LABEL_19:

      goto LABEL_20;
    }
    uint64_t attempt_started_after_milliseconds = nw_establishment_report_get_attempt_started_after_milliseconds(establishment_report);
    uint64_t resolution_started_after_milliseconds = nw_establishment_report_get_resolution_started_after_milliseconds(v5);
    uint64_t flow_started_after_milliseconds = nw_establishment_report_get_flow_started_after_milliseconds(v5);
    *(void *)(a1 + 56) = resolution_started_after_milliseconds + attempt_started_after_milliseconds;
    *(void *)(a1 + 72) = flow_started_after_milliseconds + attempt_started_after_milliseconds;
    enumerate_block[0] = MEMORY[0x1E4F143A8];
    enumerate_block[1] = 3221225472;
    enumerate_block[2] = __61__NWURLSessionTaskTransactionMetrics_computeConnectionTiming__block_invoke;
    enumerate_block[3] = &unk_1E523EDC0;
    enumerate_block[4] = a1;
    nw_establishment_report_enumerate_resolution_reports(v5, enumerate_block);
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x3032000000;
    uint64_t v26 = __Block_byref_object_copy__28559;
    v27 = __Block_byref_object_dispose__28560;
    id v28 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x2020000000;
    uint64_t v22 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __61__NWURLSessionTaskTransactionMetrics_computeConnectionTiming__block_invoke_3;
    v18[3] = &unk_1E523EDE8;
    v18[4] = &v23;
    v18[5] = &v19;
    nw_establishment_report_enumerate_protocols(v5, v18);
    uint64_t v9 = v24[5];
    if (v9)
    {
      id v10 = nw_protocol_boringssl_copy_definition();
      if (nw_protocol_definition_is_equal(v9, v10))
      {
      }
      else
      {
        uint64_t v11 = v24[5];
        if (nw_protocol_copy_quic_connection_definition::onceToken != -1) {
          dispatch_once(&nw_protocol_copy_quic_connection_definition::onceToken, &__block_literal_global_55981);
        }
        int v12 = (id)nw_protocol_copy_quic_connection_definition::quic_definition;
        BOOL is_equal = nw_protocol_definition_is_equal(v11, v12);

        if (!is_equal) {
          goto LABEL_12;
        }
      }
      *(void *)(a1 + 88) = v20[3];
      *(unsigned char *)(a1 + 96) = 1;
    }
LABEL_12:
    uint64_t v14 = nw_establishment_report_get_duration_milliseconds(v5) - *(void *)(a1 + 72);
    *(void *)(a1 + 80) = v14;
    if (*(void *)(a1 + 88) > v14)
    {
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
      }
      os_log_type_t v15 = (id)gurlLogObj;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = *(void *)(a1 + 80);
        uint64_t v17 = *(void *)(a1 + 88);
        *(_DWORD *)buf = 134218240;
        uint64_t v31 = v17;
        __int16 v32 = 2048;
        uint64_t v33 = v16;
        _os_log_impl(&dword_1830D4000, v15, OS_LOG_TYPE_INFO, "TLS (%llu ms) took longer than connect (%llu ms)", buf, 0x16u);
      }

      *(void *)(a1 + 88) = *(void *)(a1 + 80);
    }
    *(unsigned char *)(a1 + 97) = 1;
    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v23, 8);

    goto LABEL_19;
  }
}

uint64_t __61__NWURLSessionTaskTransactionMetrics_computeConnectionTiming__block_invoke(uint64_t a1, nw_resolution_report_t resolution_report)
{
  *(void *)(*(void *)(a1 + 32) + 64) += nw_resolution_report_get_milliseconds(resolution_report);
  return 1;
}

uint64_t __61__NWURLSessionTaskTransactionMetrics_computeConnectionTiming__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v6 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;

  return 1;
}

- (NSDate)secureConnectionEndDate
{
  v2 = self;
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  if (nw_http_transaction_metadata_is_first_on_connection(self)
    && (-[NWURLSessionTaskTransactionMetrics computeConnectionTiming]((uint64_t)v2), v2->connectionTiming.valid)
    && v2->connectionTiming.secure)
  {
    start_time = (void *)nw_http_transaction_metadata_get_start_time(v2->_transactionMetadata);
    if (start_time) {
      start_time = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSinceReferenceDate:", nw_http_client_metadata_convert_time_to_absolute(v2->_clientMetadata, (uint64_t)start_time)+ (double)(v2->connectionTiming.connectDurationMS + v2->connectionTiming.connectStartTimeMS)* 0.001);
    }
  }
  else
  {
    start_time = 0;
  }

  return (NSDate *)start_time;
}

- (NSDate)secureConnectionStartDate
{
  v2 = self;
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  if (nw_http_transaction_metadata_is_first_on_connection(self)
    && (-[NWURLSessionTaskTransactionMetrics computeConnectionTiming]((uint64_t)v2), v2->connectionTiming.valid)
    && v2->connectionTiming.secure)
  {
    start_time = (void *)nw_http_transaction_metadata_get_start_time(v2->_transactionMetadata);
    if (start_time) {
      start_time = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSinceReferenceDate:", nw_http_client_metadata_convert_time_to_absolute(v2->_clientMetadata, (uint64_t)start_time)+ (double)(v2->connectionTiming.connectDurationMS+ v2->connectionTiming.connectStartTimeMS- v2->connectionTiming.secureConnectionDurationMS)* 0.001);
    }
  }
  else
  {
    start_time = 0;
  }

  return (NSDate *)start_time;
}

- (NSDate)connectStartDate
{
  v2 = self;
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  if (nw_http_transaction_metadata_is_first_on_connection(self)
    && (-[NWURLSessionTaskTransactionMetrics computeConnectionTiming]((uint64_t)v2), v2->connectionTiming.valid))
  {
    start_time = (void *)nw_http_transaction_metadata_get_start_time(v2->_transactionMetadata);
    if (start_time) {
      start_time = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSinceReferenceDate:", nw_http_client_metadata_convert_time_to_absolute(v2->_clientMetadata, (uint64_t)start_time)+ (double)v2->connectionTiming.connectStartTimeMS * 0.001);
    }
  }
  else
  {
    start_time = 0;
  }

  return (NSDate *)start_time;
}

- (NSDate)domainLookupEndDate
{
  v2 = self;
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  if (nw_http_transaction_metadata_is_first_on_connection(self)
    && (-[NWURLSessionTaskTransactionMetrics computeConnectionTiming]((uint64_t)v2), v2->connectionTiming.valid))
  {
    start_time = (void *)nw_http_transaction_metadata_get_start_time(v2->_transactionMetadata);
    if (start_time) {
      start_time = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSinceReferenceDate:", nw_http_client_metadata_convert_time_to_absolute(v2->_clientMetadata, (uint64_t)start_time)+ (double)(v2->connectionTiming.domainLookupDurationMS+ v2->connectionTiming.domainLookupStartMS)* 0.001);
    }
  }
  else
  {
    start_time = 0;
  }

  return (NSDate *)start_time;
}

- (NSDate)domainLookupStartDate
{
  v2 = self;
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  if (nw_http_transaction_metadata_is_first_on_connection(self)
    && (-[NWURLSessionTaskTransactionMetrics computeConnectionTiming]((uint64_t)v2), v2->connectionTiming.valid))
  {
    start_time = (void *)nw_http_transaction_metadata_get_start_time(v2->_transactionMetadata);
    if (start_time) {
      start_time = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSinceReferenceDate:", nw_http_client_metadata_convert_time_to_absolute(v2->_clientMetadata, (uint64_t)start_time)+ (double)v2->connectionTiming.domainLookupStartMS * 0.001);
    }
  }
  else
  {
    start_time = 0;
  }

  return (NSDate *)start_time;
}

- (NSDate)fetchStartDate
{
  v2 = self;
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  start_time = (void *)nw_http_transaction_metadata_get_start_time(self);
  if (start_time)
  {
    uint64_t v4 = (uint64_t)start_time;
    if (v2) {
      clientMetadata = v2->_clientMetadata;
    }
    else {
      clientMetadata = 0;
    }
    start_time = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSinceReferenceDate:", nw_http_client_metadata_convert_time_to_absolute(clientMetadata, v4));
  }

  return (NSDate *)start_time;
}

- (NSURLResponse)response
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    v3 = self->_transactionMetadata;
    if (v3)
    {
      uint64_t v4 = v3;
      BOOL v5 = nw_protocol_metadata_copy_definition((nw_protocol_metadata_t)v3);
      if (nw_protocol_copy_http_transaction_definition_onceToken != -1) {
        dispatch_once(&nw_protocol_copy_http_transaction_definition_onceToken, &__block_literal_global_84_75899);
      }
      BOOL is_equal = nw_protocol_definition_is_equal(v5, (nw_protocol_definition_t)nw_protocol_copy_http_transaction_definition_definition);

      if (is_equal)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        uint64_t v40 = 0;
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __nw_http_transaction_metadata_get_converted_url_response_block_invoke;
        v36[3] = &unk_1E5248E90;
        v36[4] = buf;
        uint64_t v7 = *((void *)v4 + 4);
        if (v7)
        {
          __nw_http_transaction_metadata_get_converted_url_response_block_invoke((uint64_t)v36, v7);
          uint64_t v8 = *(void **)(*(void *)&buf[8] + 24);
        }
        else
        {
          uint64_t v8 = 0;
        }
        _Block_object_dispose(buf, 8);

        if (v8) {
          goto LABEL_25;
        }
        goto LABEL_10;
      }
      uint64_t v20 = __nwlog_obj();
      *(_DWORD *)buf = 136446210;
      *(void *)&uint8_t buf[4] = "nw_http_transaction_metadata_get_converted_url_response";
      uint64_t v21 = (char *)_os_log_send_and_compose_impl();

      os_log_type_t type = OS_LOG_TYPE_ERROR;
      char v37 = 0;
      if (!__nwlog_fault(v21, &type, &v37)) {
        goto LABEL_44;
      }
      if (type == OS_LOG_TYPE_FAULT)
      {
        uint64_t v22 = __nwlog_obj();
        os_log_type_t v23 = type;
        if (os_log_type_enabled(v22, type))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_http_transaction_metadata_get_converted_url_response";
          _os_log_impl(&dword_1830D4000, v22, v23, "%{public}s metadata must be http_transaction", buf, 0xCu);
        }
      }
      else if (v37)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        uint64_t v22 = __nwlog_obj();
        os_log_type_t v25 = type;
        BOOL v26 = os_log_type_enabled(v22, type);
        if (backtrace_string)
        {
          if (v26)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&uint8_t buf[4] = "nw_http_transaction_metadata_get_converted_url_response";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = backtrace_string;
            _os_log_impl(&dword_1830D4000, v22, v25, "%{public}s metadata must be http_transaction, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_44;
        }
        if (v26)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_http_transaction_metadata_get_converted_url_response";
          _os_log_impl(&dword_1830D4000, v22, v25, "%{public}s metadata must be http_transaction, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        uint64_t v22 = __nwlog_obj();
        os_log_type_t v27 = type;
        if (os_log_type_enabled(v22, type))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_http_transaction_metadata_get_converted_url_response";
          _os_log_impl(&dword_1830D4000, v22, v27, "%{public}s metadata must be http_transaction, backtrace limit exceeded", buf, 0xCu);
        }
      }

LABEL_44:
      if (v21) {
        free(v21);
      }

      goto LABEL_10;
    }
  }
  id v28 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  *(void *)&uint8_t buf[4] = "nw_http_transaction_metadata_get_converted_url_response";
  v29 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v37 = 0;
  if (__nwlog_fault(v29, &type, &v37))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v30 = __nwlog_obj();
      os_log_type_t v31 = type;
      if (os_log_type_enabled(v30, type))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "nw_http_transaction_metadata_get_converted_url_response";
        _os_log_impl(&dword_1830D4000, v30, v31, "%{public}s called with null metadata", buf, 0xCu);
      }
LABEL_62:

      goto LABEL_63;
    }
    if (!v37)
    {
      v30 = __nwlog_obj();
      os_log_type_t v35 = type;
      if (os_log_type_enabled(v30, type))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "nw_http_transaction_metadata_get_converted_url_response";
        _os_log_impl(&dword_1830D4000, v30, v35, "%{public}s called with null metadata, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_62;
    }
    __int16 v32 = (char *)__nw_create_backtrace_string();
    v30 = __nwlog_obj();
    os_log_type_t v33 = type;
    BOOL v34 = os_log_type_enabled(v30, type);
    if (!v32)
    {
      if (v34)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "nw_http_transaction_metadata_get_converted_url_response";
        _os_log_impl(&dword_1830D4000, v30, v33, "%{public}s called with null metadata, no backtrace", buf, 0xCu);
      }
      goto LABEL_62;
    }
    if (v34)
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "nw_http_transaction_metadata_get_converted_url_response";
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = v32;
      _os_log_impl(&dword_1830D4000, v30, v33, "%{public}s called with null metadata, dumping backtrace:%{public}s", buf, 0x16u);
    }

    free(v32);
  }
LABEL_63:
  if (v29) {
    free(v29);
  }
  if (!self)
  {
    id outbound_message = nw_http_transaction_metadata_get_outbound_message(0);
    transactionMetadata = 0;
    goto LABEL_11;
  }
LABEL_10:
  id outbound_message = nw_http_transaction_metadata_get_outbound_message(self->_transactionMetadata);
  transactionMetadata = self->_transactionMetadata;
LABEL_11:
  id inbound_message = nw_http_transaction_metadata_get_inbound_message(transactionMetadata);
  int v12 = inbound_message;
  if (outbound_message && inbound_message)
  {
    id v13 = nw_http_metadata_copy_request(outbound_message);
    id v14 = nw_http_metadata_copy_response(v12);
    os_log_type_t v15 = v14;
    if (v13) {
      BOOL v16 = v14 == 0;
    }
    else {
      BOOL v16 = 1;
    }
    int v17 = !v16;
    if (v16)
    {
      uint64_t v8 = 0;
    }
    else
    {
      int version = nw_http_metadata_get_version(v12);
      uint64_t v8 = (void *)nw_http_response_copy_url_response(v15, v13, 0, **((void ***)&unk_1E524BDC0 + version));
    }

    if (v17) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  uint64_t v8 = 0;
LABEL_25:

  return (NSURLResponse *)v8;
}

- (NSURLRequest)request
{
  v2 = self;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  id outbound_message = nw_http_transaction_metadata_get_outbound_message(self);
  uint64_t v4 = outbound_message;
  if (outbound_message)
  {
    id v5 = nw_http_metadata_copy_request(outbound_message);
    if (v5)
    {
      id v6 = v5;
      int version = nw_http_metadata_get_version(v4);
      uint64_t v8 = (void **)MEMORY[0x1E4F18FA0];
      switch(version)
      {
        case 1:
        case 2:
          __break(1u);
          JUMPOUT(0x18385C89CLL);
        case 4:
          uint64_t v8 = (void **)MEMORY[0x1E4F18F98];
          goto LABEL_17;
        case 5:
          goto LABEL_17;
        default:
          goto LABEL_16;
      }
    }
    goto LABEL_56;
  }
  if (!v2 || (uint64_t v9 = v2->_clientMetadata) == 0)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v16 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = "nw_http_client_metadata_get_initial_request";
    int v17 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v34 = 0;
    if (__nwlog_fault(v17, &type, &v34))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v18 = (id)gLogObj;
        os_log_type_t v19 = type;
        if (os_log_type_enabled(v18, type))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_http_client_metadata_get_initial_request";
          _os_log_impl(&dword_1830D4000, v18, v19, "%{public}s called with null metadata", buf, 0xCu);
        }
      }
      else if (v34)
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
            *(_DWORD *)buf = 136446466;
            *(void *)&uint8_t buf[4] = "nw_http_client_metadata_get_initial_request";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = backtrace_string;
            _os_log_impl(&dword_1830D4000, v18, v25, "%{public}s called with null metadata, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_47;
        }
        if (v26)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_http_client_metadata_get_initial_request";
          _os_log_impl(&dword_1830D4000, v18, v25, "%{public}s called with null metadata, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v18 = (id)gLogObj;
        os_log_type_t v30 = type;
        if (os_log_type_enabled(v18, type))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_http_client_metadata_get_initial_request";
          _os_log_impl(&dword_1830D4000, v18, v30, "%{public}s called with null metadata, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_47:
    if (v17) {
      free(v17);
    }
    id v10 = 0;
    goto LABEL_55;
  }
  id v10 = v9;
  uint64_t v11 = nw_protocol_metadata_copy_definition(v9);
  if (nw_protocol_copy_http_client_definition_onceToken != -1) {
    dispatch_once(&nw_protocol_copy_http_client_definition_onceToken, &__block_literal_global_72_75798);
  }
  BOOL is_equal = nw_protocol_definition_is_equal(v11, (nw_protocol_definition_t)nw_protocol_copy_http_client_definition_definition);

  if (!is_equal)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v20 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = "nw_http_client_metadata_get_initial_request";
    uint64_t v21 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v34 = 0;
    if (__nwlog_fault(v21, &type, &v34))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v22 = (id)gLogObj;
        os_log_type_t v23 = type;
        if (os_log_type_enabled(v22, type))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_http_client_metadata_get_initial_request";
          _os_log_impl(&dword_1830D4000, v22, v23, "%{public}s metadata must be http_client", buf, 0xCu);
        }
      }
      else if (v34)
      {
        os_log_type_t v27 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v22 = (id)gLogObj;
        os_log_type_t v28 = type;
        BOOL v29 = os_log_type_enabled(v22, type);
        if (v27)
        {
          if (v29)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&uint8_t buf[4] = "nw_http_client_metadata_get_initial_request";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = v27;
            _os_log_impl(&dword_1830D4000, v22, v28, "%{public}s metadata must be http_client, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v27);
          goto LABEL_53;
        }
        if (v29)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_http_client_metadata_get_initial_request";
          _os_log_impl(&dword_1830D4000, v22, v28, "%{public}s metadata must be http_client, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v22 = (id)gLogObj;
        os_log_type_t v31 = type;
        if (os_log_type_enabled(v22, type))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_http_client_metadata_get_initial_request";
          _os_log_impl(&dword_1830D4000, v22, v31, "%{public}s metadata must be http_client, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_53:
    if (v21) {
      free(v21);
    }
LABEL_55:

LABEL_56:
    BOOL v15 = 0;
    goto LABEL_57;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  char v37 = __Block_byref_object_copy__5_73857;
  v38 = __Block_byref_object_dispose__6_73858;
  id v39 = 0;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __nw_http_client_metadata_get_initial_request_block_invoke;
  v33[3] = &unk_1E5248E90;
  v33[4] = buf;
  uint64_t isa = (uint64_t)v10[4].isa;
  if (isa)
  {
    __nw_http_client_metadata_get_initial_request_block_invoke((uint64_t)v33, isa);
    id v14 = *(void **)(*(void *)&buf[8] + 40);
  }
  else
  {
    id v14 = 0;
  }
  id v6 = v14;
  _Block_object_dispose(buf, 8);

  if (!v6) {
    goto LABEL_56;
  }
LABEL_16:
  uint64_t v8 = (void **)MEMORY[0x1E4F18F90];
LABEL_17:
  BOOL v15 = nw_http_request_copy_url_request(v6, *v8, 0);

LABEL_57:

  return (NSURLRequest *)(id)v15;
}

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NWURLSessionTaskTransactionMetrics;
  if (-[NWURLSessionTaskTransactionMetrics isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return [(objc_class *)a3 isEqual:objc_opt_class()];
  }
}

- (id)initWithTransactionMetadata:(void *)a3 clientMetadata:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)NWURLSessionTaskTransactionMetrics;
    uint64_t v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 13, a2);
      objc_storeStrong(a1 + 14, a3);
    }
  }

  return a1;
}

@end