@interface NWTCPConnection
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)stringFromNWTCPConnectionState:(int64_t)a3;
- (BOOL)TFOSucceeded;
- (BOOL)fillOutTCPConnectionInfo:(tcp_connection_info *)a3;
- (BOOL)hasBetterPath;
- (BOOL)isMultipath;
- (BOOL)isViable;
- (BOOL)startInternal;
- (NSData)metadata;
- (NSData)txtRecord;
- (NSDictionary)TCPInfo;
- (NSDictionary)multipathSubflowSwitchCounts;
- (NSError)internalError;
- (NSString)privateDescription;
- (NWEndpoint)endpoint;
- (NWEndpoint)localAddress;
- (NWEndpoint)remoteAddress;
- (NWParameters)parameters;
- (NWPath)connectedPath;
- (NWTCPConnection)initWithAcceptedInternalConnection:(id)a3;
- (NWTCPConnection)initWithEndpoint:(id)a3 parameters:(id)a4;
- (NWTCPConnection)initWithEndpoint:(id)a3 parameters:(id)a4 delegate:(id)a5;
- (NWTCPConnection)initWithUpgradeForConnection:(NWTCPConnection *)connection;
- (NWTCPConnectionAuthenticationDelegate)delegate;
- (NWTCPConnectionState)state;
- (OS_nw_connection)internalConnection;
- (id)description;
- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4;
- (int)multipathPrimarySubflowInterfaceIndex;
- (unint64_t)multipathConnectedSubflowCount;
- (unint64_t)multipathSubflowCount;
- (void)cancel;
- (void)dealloc;
- (void)handleIdentityRequestWithMetadata:(id)a3 completionHandler:(id)a4;
- (void)handlePeerCertificateTrustEvaluationWithMetadata:(id)a3 trust:(id)a4 completionHandler:(id)a5;
- (void)readLength:(NSUInteger)length completionHandler:(void *)completion;
- (void)readMinimumLength:(NSUInteger)minimum maximumLength:(NSUInteger)maximum completionHandler:(void *)completion;
- (void)setDelegate:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setHasBetterPath:(BOOL)a3;
- (void)setInternalConnection:(id)a3;
- (void)setInternalError:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setViable:(BOOL)a3;
- (void)setupEventHandler;
- (void)write:(NSData *)data completionHandler:(void *)completion;
- (void)writeClose;
@end

@implementation NWTCPConnection

+ (id)stringFromNWTCPConnectionState:(int64_t)a3
{
  if ((unint64_t)a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"INVALID(%ld)", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E523AB70[a3];
  }

  return v3;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"state"] & 1) != 0
    || ([v4 isEqualToString:@"hasBetterPath"] & 1) != 0
    || ([v4 isEqualToString:@"viable"] & 1) != 0)
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NWTCPConnection;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_internalConnection, 0);
  objc_storeStrong((id *)&self->_internalError, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

- (NWParameters)parameters
{
  return self->_parameters;
}

- (void)setDelegate:(id)a3
{
}

- (NWTCPConnectionAuthenticationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NWTCPConnectionAuthenticationDelegate *)WeakRetained;
}

- (void)setInternalConnection:(id)a3
{
}

- (OS_nw_connection)internalConnection
{
  return (OS_nw_connection *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInternalError:(id)a3
{
}

- (NSError)internalError
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEndpoint:(id)a3
{
}

- (NWEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setHasBetterPath:(BOOL)a3
{
  self->_hasBetterPath = a3;
}

- (BOOL)hasBetterPath
{
  return self->_hasBetterPath;
}

- (void)setViable:(BOOL)a3
{
  self->_viable = a3;
}

- (BOOL)isViable
{
  return self->_viable;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NWTCPConnectionState)state
{
  return self->_state;
}

- (NSData)metadata
{
  v2 = [(NWTCPConnection *)self internalConnection];
  id v3 = nw_connection_copy_metadata(v2);

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    bytes_ptr = xpc_data_get_bytes_ptr(v3);
    v6 = (void *)[v4 initWithBytes:bytes_ptr length:xpc_data_get_length(v3)];
  }
  else
  {
    v6 = 0;
  }

  return (NSData *)v6;
}

- (NSDictionary)TCPInfo
{
  v2 = [(NWTCPConnection *)self internalConnection];
  id v3 = nw_connection_copy_tcp_info(v2);

  if (v3) {
    id v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  }
  else {
    id v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (NSDictionary)multipathSubflowSwitchCounts
{
  v2 = [(NWTCPConnection *)self internalConnection];
  id v3 = nw_connection_multipath_copy_subflow_counts(v2);

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = __47__NWTCPConnection_multipathSubflowSwitchCounts__block_invoke;
    applier[3] = &unk_1E52480D0;
    id v5 = v4;
    id v8 = v5;
    xpc_dictionary_apply(v3, applier);
  }
  else
  {
    id v5 = 0;
  }

  return (NSDictionary *)v5;
}

uint64_t __47__NWTCPConnection_multipathSubflowSwitchCounts__block_invoke(uint64_t a1, uint64_t a2, xpc_object_t xuint)
{
  id v5 = [NSNumber numberWithUnsignedLongLong:xpc_uint64_get_value(xuint)];
  v6 = *(void **)(a1 + 32);
  objc_super v7 = [NSString stringWithUTF8String:a2];
  [v6 setObject:v5 forKeyedSubscript:v7];

  return 1;
}

- (int)multipathPrimarySubflowInterfaceIndex
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [(NWTCPConnection *)self internalConnection];
  id v3 = nw_connection_copy_connected_path(v2);

  if (v3)
  {
    id v4 = (NWConcrete_nw_path *)v3;
    if (nw_path_network_is_satisfied_update_reason(v4, 0)) {
      int routed_interface_index = v4->policy_result.routed_interface_index;
    }
    else {
      int routed_interface_index = 0;
    }
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v6 = (id)gLogObj;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446210;
      v9 = "-[NWTCPConnection multipathPrimarySubflowInterfaceIndex]";
      _os_log_impl(&dword_1830D4000, v6, OS_LOG_TYPE_ERROR, "%{public}s No connected path", (uint8_t *)&v8, 0xCu);
    }

    int routed_interface_index = 0;
  }

  return routed_interface_index;
}

- (unint64_t)multipathConnectedSubflowCount
{
  v2 = [(NWTCPConnection *)self internalConnection];
  unint64_t subflow_count = nw_connection_multipath_get_subflow_count(v2);

  return subflow_count;
}

- (unint64_t)multipathSubflowCount
{
  v2 = [(NWTCPConnection *)self internalConnection];
  unint64_t subflow_count = nw_connection_multipath_get_subflow_count(v2);

  return subflow_count;
}

- (BOOL)isMultipath
{
  v2 = [(NWTCPConnection *)self internalConnection];
  BOOL v3 = nw_connection_uses_multipath(v2);

  return v3;
}

- (BOOL)TFOSucceeded
{
  v2 = [(NWTCPConnection *)self internalConnection];
  BOOL v3 = nw_connection_used_tfo(v2);

  return v3;
}

- (BOOL)fillOutTCPConnectionInfo:(tcp_connection_info *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v3 = a3;
    id v4 = [(NWTCPConnection *)self internalConnection];
    LOBYTE(v3) = nw_connection_fillout_tcp_connection_info(v4, (uint64_t)v3);

    return (char)v3;
  }
  v6 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v16 = "-[NWTCPConnection fillOutTCPConnectionInfo:]";
  objc_super v7 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v13 = 0;
  if (__nwlog_fault(v7, &type, &v13))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      int v8 = __nwlog_obj();
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v16 = "-[NWTCPConnection fillOutTCPConnectionInfo:]";
        uint64_t v10 = "%{public}s called with null tcp_conn_info";
LABEL_17:
        _os_log_impl(&dword_1830D4000, v8, v9, v10, buf, 0xCu);
      }
    }
    else
    {
      if (v13)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        int v8 = __nwlog_obj();
        os_log_type_t v9 = type;
        BOOL v12 = os_log_type_enabled(v8, type);
        if (backtrace_string)
        {
          if (v12)
          {
            *(_DWORD *)buf = 136446466;
            v16 = "-[NWTCPConnection fillOutTCPConnectionInfo:]";
            __int16 v17 = 2082;
            v18 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v8, v9, "%{public}s called with null tcp_conn_info, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_19;
        }
        if (!v12) {
          goto LABEL_18;
        }
        *(_DWORD *)buf = 136446210;
        v16 = "-[NWTCPConnection fillOutTCPConnectionInfo:]";
        uint64_t v10 = "%{public}s called with null tcp_conn_info, no backtrace";
        goto LABEL_17;
      }
      int v8 = __nwlog_obj();
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v16 = "-[NWTCPConnection fillOutTCPConnectionInfo:]";
        uint64_t v10 = "%{public}s called with null tcp_conn_info, backtrace limit exceeded";
        goto LABEL_17;
      }
    }
LABEL_18:
  }
LABEL_19:
  if (v7) {
    free(v7);
  }
  return 0;
}

- (BOOL)startInternal
{
  objc_initWeak(&location, self);
  [(NWTCPConnection *)self setupEventHandler];
  BOOL v3 = [(NWTCPConnection *)self parameters];
  int v4 = [v3 enableTLS];

  if (v4)
  {
    id v5 = [(NWTCPConnection *)self internalConnection];
    nw_parameters_t v6 = nw_connection_copy_parameters(v5);

    objc_super v7 = (void *)nw_protocol_boringssl_copy_definition();
    int v8 = nw_parameters_copy_protocol_options_for_definition(v6, v7);

    os_log_type_t v9 = v8;
    uint64_t v10 = [(NWTCPConnection *)self delegate];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ((objc_opt_respondsToSelector() & 1) == 0
       || [v10 shouldEvaluateTrustForConnection:self]))
    {
      verify_block[0] = MEMORY[0x1E4F143A8];
      verify_block[1] = 3221225472;
      verify_block[2] = __32__NWTCPConnection_startInternal__block_invoke;
      verify_block[3] = &unk_1E523AB28;
      objc_copyWeak(&v18, &location);
      if (NWCopyInternalQueue_init_once != -1) {
        dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_63972);
      }
      v11 = (id)NWCopyInternalQueue_nwQueue;
      sec_protocol_options_set_verify_block(v9, verify_block, v11);

      objc_destroyWeak(&v18);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ((objc_opt_respondsToSelector() & 1) == 0
       || [v10 shouldProvideIdentityForConnection:self]))
    {
      challenge_block[0] = MEMORY[0x1E4F143A8];
      challenge_block[1] = 3221225472;
      challenge_block[2] = __32__NWTCPConnection_startInternal__block_invoke_50;
      challenge_block[3] = &unk_1E523AB50;
      objc_copyWeak(&v16, &location);
      if (NWCopyInternalQueue_init_once != -1) {
        dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_63972);
      }
      BOOL v12 = (id)NWCopyInternalQueue_nwQueue;
      sec_protocol_options_set_challenge_block(v9, challenge_block, v12);

      objc_destroyWeak(&v16);
    }
  }
  char v13 = [(NWTCPConnection *)self internalConnection];
  nw_connection_start(v13);

  objc_destroyWeak(&location);
  return 1;
}

void __32__NWTCPConnection_startInternal__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained handlePeerCertificateTrustEvaluationWithMetadata:v7 trust:v8 completionHandler:v9];
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    BOOL v12 = (id)gLogObj;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446210;
      v14 = "-[NWTCPConnection startInternal]_block_invoke";
      _os_log_impl(&dword_1830D4000, v12, OS_LOG_TYPE_ERROR, "%{public}s Connection went away while waiting for event", (uint8_t *)&v13, 0xCu);
    }
  }
}

void __32__NWTCPConnection_startInternal__block_invoke_50(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained handleIdentityRequestWithMetadata:v5 completionHandler:v6];
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v9 = (id)gLogObj;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446210;
      v11 = "-[NWTCPConnection startInternal]_block_invoke";
      _os_log_impl(&dword_1830D4000, v9, OS_LOG_TYPE_ERROR, "%{public}s Connection went away while waiting for event", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)setupEventHandler
{
  objc_initWeak(&location, self);
  BOOL v3 = [(NWTCPConnection *)self internalConnection];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __36__NWTCPConnection_setupEventHandler__block_invoke;
  handler[3] = &unk_1E524B440;
  objc_copyWeak(&v11, &location);
  nw_connection_set_state_changed_handler(v3, handler);

  int v4 = [(NWTCPConnection *)self internalConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__NWTCPConnection_setupEventHandler__block_invoke_38;
  v8[3] = &unk_1E523C600;
  objc_copyWeak(&v9, &location);
  nw_connection_set_viability_changed_handler(v4, v8);

  id v5 = [(NWTCPConnection *)self internalConnection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__NWTCPConnection_setupEventHandler__block_invoke_40;
  v6[3] = &unk_1E523C600;
  objc_copyWeak(&v7, &location);
  nw_connection_set_better_path_available_handler(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __36__NWTCPConnection_setupEventHandler__block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v5)
    {
      CFErrorRef v7 = nw_error_copy_cf_error(v5);
      [WeakRetained setInternalError:v7];
    }
    uint64_t v8 = [WeakRetained state];
    if (a2 > 5) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = qword_183D5CE98[a2];
    }
    if ([WeakRetained state] != v9)
    {
      [WeakRetained willChangeValueForKey:@"state"];
      [WeakRetained setState:v9];
      [WeakRetained didChangeValueForKey:@"state"];
    }
    if (v9 == 5) {
      [WeakRetained setInternalConnection:0];
    }
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    int v10 = (id)gLogObj;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446210;
      uint64_t v12 = "-[NWTCPConnection setupEventHandler]_block_invoke";
      _os_log_impl(&dword_1830D4000, v10, OS_LOG_TYPE_ERROR, "%{public}s Connection went away while waiting for event", (uint8_t *)&v11, 0xCu);
    }
  }
}

void __36__NWTCPConnection_setupEventHandler__block_invoke_38(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained isViable] != a2)
    {
      [v4 willChangeValueForKey:@"viable"];
      [v4 setViable:a2];
      [v4 didChangeValueForKey:@"viable"];
    }
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v5 = (id)gLogObj;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446210;
      CFErrorRef v7 = "-[NWTCPConnection setupEventHandler]_block_invoke";
      _os_log_impl(&dword_1830D4000, v5, OS_LOG_TYPE_ERROR, "%{public}s Connection went away while waiting for event", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __36__NWTCPConnection_setupEventHandler__block_invoke_40(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained hasBetterPath] != a2)
    {
      [v4 willChangeValueForKey:@"hasBetterPath"];
      [v4 setHasBetterPath:a2];
      [v4 didChangeValueForKey:@"hasBetterPath"];
    }
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v5 = (id)gLogObj;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446210;
      CFErrorRef v7 = "-[NWTCPConnection setupEventHandler]_block_invoke";
      _os_log_impl(&dword_1830D4000, v5, OS_LOG_TYPE_ERROR, "%{public}s Connection went away while waiting for event", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)handleIdentityRequestWithMetadata:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NWTCPConnection *)self delegate];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  uint64_t v9 = (id)gLogObj;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v15 = "-[NWTCPConnection handleIdentityRequestWithMetadata:completionHandler:]";
    _os_log_impl(&dword_1830D4000, v9, OS_LOG_TYPE_DEBUG, "%{public}s Peer asked for identity, asking delegate to provide identity", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__NWTCPConnection_handleIdentityRequestWithMetadata_completionHandler___block_invoke;
  v11[3] = &unk_1E523AB00;
  objc_copyWeak(&v13, (id *)buf);
  id v10 = v7;
  id v12 = v10;
  [v8 provideIdentityForConnection:self completionHandler:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __71__NWTCPConnection_handleIdentityRequestWithMetadata_completionHandler___block_invoke(uint64_t a1, __SecIdentity *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  CFArrayRef v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    sec_identity_t v7 = sec_identity_create_with_certificates(a2, v5);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint64_t v8 = (id)gLogObj;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446210;
      id v10 = "-[NWTCPConnection handleIdentityRequestWithMetadata:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1830D4000, v8, OS_LOG_TYPE_ERROR, "%{public}s Connection went away while waiting for event", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)handlePeerCertificateTrustEvaluationWithMetadata:(id)a3 trust:(id)a4 completionHandler:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    objc_initWeak(&location, self);
    uint64_t v11 = [(NWTCPConnection *)self delegate];
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __92__NWTCPConnection_handlePeerCertificateTrustEvaluationWithMetadata_trust_completionHandler___block_invoke;
    handler[3] = &unk_1E523AAB0;
    id v13 = v12;
    id v29 = v13;
    sec_protocol_metadata_access_peer_certificate_chain(v8, handler);
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v14 = (id)gLogObj;
    uint64_t v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v16 = [v13 count];
        *(_DWORD *)buf = 136446466;
        v33 = "-[NWTCPConnection handlePeerCertificateTrustEvaluationWithMetadata:trust:completionHandler:]";
        __int16 v34 = 2048;
        uint64_t v35 = v16;
        _os_log_impl(&dword_1830D4000, v15, OS_LOG_TYPE_DEBUG, "%{public}s Evaluating trust for peer cert chain of length %lu", buf, 0x16u);
      }

      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __92__NWTCPConnection_handlePeerCertificateTrustEvaluationWithMetadata_trust_completionHandler___block_invoke_34;
      v25[3] = &unk_1E523AAD8;
      objc_copyWeak(&v27, &location);
      id v26 = v10;
      [v11 evaluateTrustForConnection:self peerCertificateChain:v13 completionHandler:v25];

      objc_destroyWeak(&v27);
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v33 = "-[NWTCPConnection handlePeerCertificateTrustEvaluationWithMetadata:trust:completionHandler:]";
        __int16 v34 = 2048;
        uint64_t v35 = 0;
        _os_log_impl(&dword_1830D4000, v15, OS_LOG_TYPE_ERROR, "%{public}s Can't create certificate chain %p for trust evaluation", buf, 0x16u);
      }
    }
    objc_destroyWeak(&location);
    goto LABEL_10;
  }
  __int16 v17 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v33 = "-[NWTCPConnection handlePeerCertificateTrustEvaluationWithMetadata:trust:completionHandler:]";
  id v18 = (char *)_os_log_send_and_compose_impl();

  LOBYTE(location) = 16;
  char v31 = 0;
  if (__nwlog_fault(v18, &location, &v31))
  {
    if (location == 17)
    {
      uint64_t v19 = __nwlog_obj();
      os_log_type_t v20 = location;
      if (os_log_type_enabled(v19, (os_log_type_t)location))
      {
        *(_DWORD *)buf = 136446210;
        v33 = "-[NWTCPConnection handlePeerCertificateTrustEvaluationWithMetadata:trust:completionHandler:]";
        _os_log_impl(&dword_1830D4000, v19, v20, "%{public}s called with null metadata", buf, 0xCu);
      }
    }
    else if (v31)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      uint64_t v19 = __nwlog_obj();
      os_log_type_t v22 = location;
      BOOL v23 = os_log_type_enabled(v19, (os_log_type_t)location);
      if (backtrace_string)
      {
        if (v23)
        {
          *(_DWORD *)buf = 136446466;
          v33 = "-[NWTCPConnection handlePeerCertificateTrustEvaluationWithMetadata:trust:completionHandler:]";
          __int16 v34 = 2082;
          uint64_t v35 = (uint64_t)backtrace_string;
          _os_log_impl(&dword_1830D4000, v19, v22, "%{public}s called with null metadata, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_27;
      }
      if (v23)
      {
        *(_DWORD *)buf = 136446210;
        v33 = "-[NWTCPConnection handlePeerCertificateTrustEvaluationWithMetadata:trust:completionHandler:]";
        _os_log_impl(&dword_1830D4000, v19, v22, "%{public}s called with null metadata, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v19 = __nwlog_obj();
      os_log_type_t v24 = location;
      if (os_log_type_enabled(v19, (os_log_type_t)location))
      {
        *(_DWORD *)buf = 136446210;
        v33 = "-[NWTCPConnection handlePeerCertificateTrustEvaluationWithMetadata:trust:completionHandler:]";
        _os_log_impl(&dword_1830D4000, v19, v24, "%{public}s called with null metadata, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }
LABEL_27:
  if (v18) {
    free(v18);
  }
LABEL_10:
}

void __92__NWTCPConnection_handlePeerCertificateTrustEvaluationWithMetadata_trust_completionHandler___block_invoke(uint64_t a1, sec_certificate_t certificate)
{
  SecCertificateRef v3 = sec_certificate_copy_ref(certificate);
  [*(id *)(a1 + 32) addObject:v3];
}

void __92__NWTCPConnection_handlePeerCertificateTrustEvaluationWithMetadata_trust_completionHandler___block_invoke_34(uint64_t a1, __SecTrust *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    *(void *)cf = 0;
    SecTrustEvaluateWithError(a2, (CFErrorRef *)cf);
    if (*(void *)cf)
    {
      CFRelease(*(CFTypeRef *)cf);
      *(void *)cf = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    CFArrayRef v5 = (id)gLogObj;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)cf = 136446210;
      *(void *)&cf[4] = "-[NWTCPConnection handlePeerCertificateTrustEvaluationWithMetadata:trust:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1830D4000, v5, OS_LOG_TYPE_ERROR, "%{public}s Connection went away while waiting for event", cf, 0xCu);
    }
  }
}

- (void)writeClose
{
  SecCertificateRef v3 = [(NWTCPConnection *)self internalConnection];

  if (v3)
  {
    int v4 = [(NWTCPConnection *)self internalConnection];
    nw_connection_send(v4, 0, (nw_content_context_t)&__block_literal_global_6_42258, 1, &__block_literal_global_24376);
  }
}

- (void)write:(NSData *)data completionHandler:(void *)completion
{
  id v6 = data;
  uint64_t v7 = completion;
  uint64_t v8 = [(NWTCPConnection *)self internalConnection];

  if (v8)
  {
    if (v6) {
      id v9 = [(NSData *)v6 _createDispatchData];
    }
    else {
      id v9 = 0;
    }
    id v12 = [(NWTCPConnection *)self internalConnection];
    completiona[0] = MEMORY[0x1E4F143A8];
    completiona[1] = 3221225472;
    completiona[2] = __43__NWTCPConnection_write_completionHandler___block_invoke;
    completiona[3] = &unk_1E52485F8;
    id v16 = v7;
    id v11 = v7;
    nw_connection_send(v12, v9, (nw_content_context_t)&__block_literal_global_42249, 1, completiona);
  }
  else
  {
    if (NWCopyInternalQueue_init_once != -1) {
      dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_63972);
    }
    id v10 = (id)NWCopyInternalQueue_nwQueue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __43__NWTCPConnection_write_completionHandler___block_invoke_2;
    v13[3] = &unk_1E524AFA8;
    v14 = v7;
    id v9 = v7;
    dispatch_async(v10, v13);

    id v11 = v14;
  }
}

void __43__NWTCPConnection_write_completionHandler___block_invoke(uint64_t a1, nw_error_t error)
{
  if (error) {
    error = (nw_error_t)nw_error_copy_cf_error(error);
  }
  nw_error_t v3 = error;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __43__NWTCPConnection_write_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)readMinimumLength:(NSUInteger)minimum maximumLength:(NSUInteger)maximum completionHandler:(void *)completion
{
  unsigned int v5 = maximum;
  unsigned int v6 = minimum;
  uint64_t v8 = completion;
  id v9 = [(NWTCPConnection *)self internalConnection];

  if (v9)
  {
    id v10 = [(NWTCPConnection *)self internalConnection];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __69__NWTCPConnection_readMinimumLength_maximumLength_completionHandler___block_invoke;
    v16[3] = &unk_1E52485D0;
    id v11 = &v17;
    __int16 v17 = v8;
    id v12 = v8;
    nw_connection_receive_internal(v10, 0, v6, v5, v16);
  }
  else
  {
    if (NWCopyInternalQueue_init_once != -1) {
      dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_63972);
    }
    id v10 = (id)NWCopyInternalQueue_nwQueue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69__NWTCPConnection_readMinimumLength_maximumLength_completionHandler___block_invoke_2;
    v14[3] = &unk_1E524AFA8;
    id v11 = &v15;
    uint64_t v15 = v8;
    id v13 = v8;
    dispatch_async(v10, v14);
  }
}

void __69__NWTCPConnection_readMinimumLength_maximumLength_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  id v16 = a2;
  id v9 = a3;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    id v12 = nw_error_copy_cf_error(v10);
    if (v16) {
      goto LABEL_8;
    }
  }
  else
  {
    id v12 = 0;
    if (v16) {
      goto LABEL_8;
    }
  }
  if (!a4 || v12)
  {
LABEL_8:
    uint64_t v14 = *(void *)(a1 + 32);
    id v13 = v16;
    if (!v16) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:57 userInfo:0];
  id v13 = 0;
  uint64_t v14 = *(void *)(a1 + 32);
LABEL_9:
  id v15 = v13;
LABEL_10:

  (*(void (**)(uint64_t, id, void *))(v14 + 16))(v14, v16, v12);
}

void __69__NWTCPConnection_readMinimumLength_maximumLength_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)readLength:(NSUInteger)length completionHandler:(void *)completion
{
}

- (void)cancel
{
  if ([(NWTCPConnection *)self state] != NWTCPConnectionStateCancelled)
  {
    nw_error_t v3 = [(NWTCPConnection *)self internalConnection];

    if (v3)
    {
      int v4 = [(NWTCPConnection *)self internalConnection];
      nw_connection_cancel(v4);
    }
  }
}

- (NSData)txtRecord
{
  nw_error_t v3 = [(NWTCPConnection *)self internalConnection];

  if (v3)
  {
    int v4 = [(NWTCPConnection *)self internalConnection];
    id v5 = nw_connection_copy_host_endpoint(v4);

    if (v5)
    {
      unsigned int v6 = (id *)v5;
      uint64_t v7 = v6[23];

      if (!v7 || ((uint64_t v8 = v7[1], v9 = v7[2], v8) ? (v10 = v9 == 0) : (v10 = 1), v10)) {
        id v11 = 0;
      }
      else {
        id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v8 length:v9];
      }
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return (NSData *)v11;
}

- (NWEndpoint)remoteAddress
{
  nw_error_t v3 = [(NWTCPConnection *)self internalConnection];

  if (v3)
  {
    int v4 = [(NWTCPConnection *)self internalConnection];
    id v5 = nw_connection_copy_connected_remote_endpoint(v4);

    if (v5)
    {
      nw_error_t v3 = +[NWEndpoint endpointWithInternalEndpoint:v5];
    }
    else
    {
      nw_error_t v3 = 0;
    }
  }

  return (NWEndpoint *)v3;
}

- (NWEndpoint)localAddress
{
  nw_error_t v3 = [(NWTCPConnection *)self internalConnection];

  if (v3)
  {
    int v4 = [(NWTCPConnection *)self internalConnection];
    id v5 = nw_connection_copy_connected_local_endpoint(v4);

    if (v5)
    {
      nw_error_t v3 = +[NWEndpoint endpointWithInternalEndpoint:v5];
    }
    else
    {
      nw_error_t v3 = 0;
    }
  }

  return (NWEndpoint *)v3;
}

- (NWPath)connectedPath
{
  nw_error_t v3 = [(NWTCPConnection *)self internalConnection];

  if (v3)
  {
    int v4 = [(NWTCPConnection *)self internalConnection];
    id v5 = nw_connection_copy_connected_path(v4);

    if (v5) {
      nw_error_t v3 = [[NWPath alloc] initWithPath:v5];
    }
    else {
      nw_error_t v3 = 0;
    }
  }

  return v3;
}

- (NSString)privateDescription
{
  id v2 = [(NWTCPConnection *)self descriptionWithIndent:0 showFullContent:1];

  return (NSString *)v2;
}

- (id)description
{
  id v2 = [(NWTCPConnection *)self descriptionWithIndent:0 showFullContent:0];

  return v2;
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v7 appendString:@"{"];
  uint64_t v8 = [(NWTCPConnection *)self parameters];
  [v7 appendPrettyObject:v8 withName:@"parameters" indent:v5 showFullContent:v4];

  uint64_t v9 = [(NWTCPConnection *)self endpoint];
  [v7 appendPrettyObject:v9 withName:@"endpoint" indent:v5 showFullContent:v4];

  [v7 appendString:@"\n}"];
  return v7;
}

- (void)dealloc
{
  nw_error_t v3 = [(NWTCPConnection *)self internalConnection];

  if (v3)
  {
    BOOL v4 = [(NWTCPConnection *)self internalConnection];
    nw_connection_cancel(v4);

    [(NWTCPConnection *)self setInternalConnection:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)NWTCPConnection;
  [(NWTCPConnection *)&v5 dealloc];
}

- (NWTCPConnection)initWithUpgradeForConnection:(NWTCPConnection *)connection
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  BOOL v4 = connection;
  objc_super v5 = v4;
  if (!v4)
  {
    v33 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
    __int16 v34 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v53 = 0;
    if (!__nwlog_fault(v34, &type, &v53)) {
      goto LABEL_80;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      uint64_t v35 = __nwlog_obj();
      os_log_type_t v36 = type;
      if (!os_log_type_enabled(v35, type)) {
        goto LABEL_79;
      }
      *(_DWORD *)buf = 136446210;
      v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
      v37 = "%{public}s called with null connection";
LABEL_78:
      _os_log_impl(&dword_1830D4000, v35, v36, v37, buf, 0xCu);
      goto LABEL_79;
    }
    if (!v53)
    {
      uint64_t v35 = __nwlog_obj();
      os_log_type_t v36 = type;
      if (os_log_type_enabled(v35, type))
      {
        *(_DWORD *)buf = 136446210;
        v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
        v37 = "%{public}s called with null connection, backtrace limit exceeded";
        goto LABEL_78;
      }
      goto LABEL_79;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    uint64_t v35 = __nwlog_obj();
    os_log_type_t v36 = type;
    BOOL v46 = os_log_type_enabled(v35, type);
    if (!backtrace_string)
    {
      if (v46)
      {
        *(_DWORD *)buf = 136446210;
        v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
        v37 = "%{public}s called with null connection, no backtrace";
        goto LABEL_78;
      }
      goto LABEL_79;
    }
    if (!v46) {
      goto LABEL_60;
    }
    *(_DWORD *)buf = 136446466;
    v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
    __int16 v57 = 2082;
    v58 = backtrace_string;
    v47 = "%{public}s called with null connection, dumping backtrace:%{public}s";
LABEL_59:
    _os_log_impl(&dword_1830D4000, v35, v36, v47, buf, 0x16u);
LABEL_60:

    free(backtrace_string);
    goto LABEL_80;
  }
  unsigned int v6 = [(NWTCPConnection *)v4 endpoint];

  if (!v6)
  {
    v38 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
    __int16 v34 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v53 = 0;
    if (!__nwlog_fault(v34, &type, &v53)) {
      goto LABEL_80;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      uint64_t v35 = __nwlog_obj();
      os_log_type_t v36 = type;
      if (!os_log_type_enabled(v35, type)) {
        goto LABEL_79;
      }
      *(_DWORD *)buf = 136446210;
      v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
      v37 = "%{public}s called with null connection.endpoint";
      goto LABEL_78;
    }
    if (!v53)
    {
      uint64_t v35 = __nwlog_obj();
      os_log_type_t v36 = type;
      if (os_log_type_enabled(v35, type))
      {
        *(_DWORD *)buf = 136446210;
        v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
        v37 = "%{public}s called with null connection.endpoint, backtrace limit exceeded";
        goto LABEL_78;
      }
      goto LABEL_79;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    uint64_t v35 = __nwlog_obj();
    os_log_type_t v36 = type;
    BOOL v48 = os_log_type_enabled(v35, type);
    if (!backtrace_string)
    {
      if (v48)
      {
        *(_DWORD *)buf = 136446210;
        v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
        v37 = "%{public}s called with null connection.endpoint, no backtrace";
        goto LABEL_78;
      }
      goto LABEL_79;
    }
    if (!v48) {
      goto LABEL_60;
    }
    *(_DWORD *)buf = 136446466;
    v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
    __int16 v57 = 2082;
    v58 = backtrace_string;
    v47 = "%{public}s called with null connection.endpoint, dumping backtrace:%{public}s";
    goto LABEL_59;
  }
  id v7 = [(NWTCPConnection *)v5 parameters];

  if (v7)
  {
    uint64_t v8 = [(NWTCPConnection *)v5 endpoint];
    uint64_t v9 = [v8 internalEndpoint];
    BOOL v10 = [(NWTCPConnection *)v5 parameters];
    id v11 = [v10 internalParameters];
    id v12 = nw_connection_create(v9, v11);

    if (v12)
    {
      v52.receiver = self;
      v52.super_class = (Class)NWTCPConnection;
      id v13 = [(NWTCPConnection *)&v52 init];
      if (v13)
      {
        uint64_t v14 = v13;
        if (NWCopyInternalQueue_init_once != -1) {
          dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_63972);
        }
        id v15 = (id)NWCopyInternalQueue_nwQueue;
        nw_connection_set_queue(v12, v15);

        uint64_t v16 = [(NWTCPConnection *)v5 endpoint];
        endpoint = v14->_endpoint;
        v14->_endpoint = (NWEndpoint *)v16;

        uint64_t v18 = [(NWTCPConnection *)v5 parameters];
        parameters = v14->_parameters;
        v14->_parameters = (NWParameters *)v18;

        os_log_type_t v20 = [(NWTCPConnection *)v5 delegate];
        objc_storeWeak((id *)&v14->_delegate, v20);

        objc_storeStrong((id *)&v14->_internalConnection, v12);
        v14->_state = 1;
        [(NWTCPConnection *)v14 startInternal];
        self = v14;
        v21 = self;
        goto LABEL_27;
      }
      v40 = __nwlog_obj();
      *(_DWORD *)buf = 136446210;
      v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
      v41 = (char *)_os_log_send_and_compose_impl();

      os_log_type_t type = OS_LOG_TYPE_ERROR;
      char v53 = 0;
      if (!__nwlog_fault(v41, &type, &v53)) {
        goto LABEL_89;
      }
      if (type == OS_LOG_TYPE_FAULT)
      {
        v42 = __nwlog_obj();
        os_log_type_t v43 = type;
        if (os_log_type_enabled(v42, type))
        {
          *(_DWORD *)buf = 136446210;
          v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
          v44 = "%{public}s [super init] failed";
LABEL_87:
          _os_log_impl(&dword_1830D4000, v42, v43, v44, buf, 0xCu);
        }
      }
      else if (v53)
      {
        v50 = (char *)__nw_create_backtrace_string();
        v42 = __nwlog_obj();
        os_log_type_t v43 = type;
        BOOL v51 = os_log_type_enabled(v42, type);
        if (v50)
        {
          if (v51)
          {
            *(_DWORD *)buf = 136446466;
            v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
            __int16 v57 = 2082;
            v58 = v50;
            _os_log_impl(&dword_1830D4000, v42, v43, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v50);
          goto LABEL_89;
        }
        if (v51)
        {
          *(_DWORD *)buf = 136446210;
          v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
          v44 = "%{public}s [super init] failed, no backtrace";
          goto LABEL_87;
        }
      }
      else
      {
        v42 = __nwlog_obj();
        os_log_type_t v43 = type;
        if (os_log_type_enabled(v42, type))
        {
          *(_DWORD *)buf = 136446210;
          v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
          v44 = "%{public}s [super init] failed, backtrace limit exceeded";
          goto LABEL_87;
        }
      }

LABEL_89:
      if (v41) {
        free(v41);
      }
      self = 0;
      goto LABEL_26;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v22 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
    BOOL v23 = (void *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v53 = 0;
    if (__nwlog_fault((const char *)v23, &type, &v53))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v24 = (id)gLogObj;
        os_log_type_t v25 = type;
        if (!os_log_type_enabled(v24, type)) {
          goto LABEL_24;
        }
        *(_DWORD *)buf = 136446210;
        v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
        id v26 = "%{public}s nw_connection_create failed";
LABEL_22:
        v30 = v24;
        os_log_type_t v31 = v25;
        goto LABEL_23;
      }
      if (!v53)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v24 = (id)gLogObj;
        os_log_type_t v25 = type;
        if (!os_log_type_enabled(v24, type)) {
          goto LABEL_24;
        }
        *(_DWORD *)buf = 136446210;
        v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
        id v26 = "%{public}s nw_connection_create failed, backtrace limit exceeded";
        goto LABEL_22;
      }
      id v27 = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      os_log_type_t v24 = (id)gLogObj;
      os_log_type_t v28 = type;
      BOOL v29 = os_log_type_enabled(v24, type);
      if (!v27)
      {
        if (!v29)
        {
LABEL_24:

          if (!v23)
          {
LABEL_26:
            v21 = 0;
LABEL_27:

            goto LABEL_28;
          }
LABEL_25:
          free(v23);
          goto LABEL_26;
        }
        *(_DWORD *)buf = 136446210;
        v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
        id v26 = "%{public}s nw_connection_create failed, no backtrace";
        v30 = v24;
        os_log_type_t v31 = v28;
LABEL_23:
        _os_log_impl(&dword_1830D4000, v30, v31, v26, buf, 0xCu);
        goto LABEL_24;
      }
      if (v29)
      {
        *(_DWORD *)buf = 136446466;
        v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
        __int16 v57 = 2082;
        v58 = v27;
        _os_log_impl(&dword_1830D4000, v24, v28, "%{public}s nw_connection_create failed, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(v27);
    }
    if (!v23) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  v39 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
  __int16 v34 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v53 = 0;
  if (__nwlog_fault(v34, &type, &v53))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      uint64_t v35 = __nwlog_obj();
      os_log_type_t v36 = type;
      if (os_log_type_enabled(v35, type))
      {
        *(_DWORD *)buf = 136446210;
        v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
        v37 = "%{public}s called with null connection.parameters";
        goto LABEL_78;
      }
LABEL_79:

      goto LABEL_80;
    }
    if (!v53)
    {
      uint64_t v35 = __nwlog_obj();
      os_log_type_t v36 = type;
      if (os_log_type_enabled(v35, type))
      {
        *(_DWORD *)buf = 136446210;
        v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
        v37 = "%{public}s called with null connection.parameters, backtrace limit exceeded";
        goto LABEL_78;
      }
      goto LABEL_79;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    uint64_t v35 = __nwlog_obj();
    os_log_type_t v36 = type;
    BOOL v49 = os_log_type_enabled(v35, type);
    if (!backtrace_string)
    {
      if (v49)
      {
        *(_DWORD *)buf = 136446210;
        v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
        v37 = "%{public}s called with null connection.parameters, no backtrace";
        goto LABEL_78;
      }
      goto LABEL_79;
    }
    if (!v49) {
      goto LABEL_60;
    }
    *(_DWORD *)buf = 136446466;
    v56 = "-[NWTCPConnection initWithUpgradeForConnection:]";
    __int16 v57 = 2082;
    v58 = backtrace_string;
    v47 = "%{public}s called with null connection.parameters, dumping backtrace:%{public}s";
    goto LABEL_59;
  }
LABEL_80:
  if (v34) {
    free(v34);
  }
  v21 = 0;
LABEL_28:

  return v21;
}

- (NWTCPConnection)initWithEndpoint:(id)a3 parameters:(id)a4
{
  return [(NWTCPConnection *)self initWithEndpoint:a3 parameters:a4 delegate:0];
}

- (NWTCPConnection)initWithEndpoint:(id)a3 parameters:(id)a4 delegate:(id)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id obj = a5;
  if (!v9)
  {
    v32 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
    v33 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v58 = 0;
    if (__nwlog_fault(v33, &type, &v58))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __int16 v34 = __nwlog_obj();
        os_log_type_t v35 = type;
        if (os_log_type_enabled(v34, type))
        {
          *(_DWORD *)buf = 136446210;
          v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
          _os_log_impl(&dword_1830D4000, v34, v35, "%{public}s called with null endpoint", buf, 0xCu);
        }
      }
      else if (v58)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __int16 v34 = __nwlog_obj();
        os_log_type_t v45 = type;
        BOOL v46 = os_log_type_enabled(v34, type);
        if (backtrace_string)
        {
          if (v46)
          {
            *(_DWORD *)buf = 136446466;
            v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
            __int16 v62 = 2082;
            v63 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v34, v45, "%{public}s called with null endpoint, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_76;
        }
        if (v46)
        {
          *(_DWORD *)buf = 136446210;
          v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
          _os_log_impl(&dword_1830D4000, v34, v45, "%{public}s called with null endpoint, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __int16 v34 = __nwlog_obj();
        os_log_type_t v53 = type;
        if (os_log_type_enabled(v34, type))
        {
          *(_DWORD *)buf = 136446210;
          v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
          _os_log_impl(&dword_1830D4000, v34, v53, "%{public}s called with null endpoint, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_76:
    if (v33) {
      free(v33);
    }
    goto LABEL_78;
  }
  if (!v10)
  {
    os_log_type_t v36 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
    v37 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v58 = 0;
    if (__nwlog_fault(v37, &type, &v58))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        v38 = __nwlog_obj();
        os_log_type_t v39 = type;
        if (os_log_type_enabled(v38, type))
        {
          *(_DWORD *)buf = 136446210;
          v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
          _os_log_impl(&dword_1830D4000, v38, v39, "%{public}s called with null parameters", buf, 0xCu);
        }
      }
      else if (v58)
      {
        v47 = (char *)__nw_create_backtrace_string();
        v38 = __nwlog_obj();
        os_log_type_t v48 = type;
        BOOL v49 = os_log_type_enabled(v38, type);
        if (v47)
        {
          if (v49)
          {
            *(_DWORD *)buf = 136446466;
            v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
            __int16 v62 = 2082;
            v63 = v47;
            _os_log_impl(&dword_1830D4000, v38, v48, "%{public}s called with null parameters, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v47);
          goto LABEL_82;
        }
        if (v49)
        {
          *(_DWORD *)buf = 136446210;
          v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
          _os_log_impl(&dword_1830D4000, v38, v48, "%{public}s called with null parameters, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v38 = __nwlog_obj();
        os_log_type_t v54 = type;
        if (os_log_type_enabled(v38, type))
        {
          *(_DWORD *)buf = 136446210;
          v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
          _os_log_impl(&dword_1830D4000, v38, v54, "%{public}s called with null parameters, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_82:
    if (v37) {
      free(v37);
    }
LABEL_78:

LABEL_90:
    id v22 = 0;
    goto LABEL_33;
  }
  v57.receiver = self;
  v57.super_class = (Class)NWTCPConnection;
  id v11 = [(NWTCPConnection *)&v57 init];
  if (!v11)
  {
    v40 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
    v41 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v58 = 0;
    if (__nwlog_fault(v41, &type, &v58))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        v42 = __nwlog_obj();
        os_log_type_t v43 = type;
        if (os_log_type_enabled(v42, type))
        {
          *(_DWORD *)buf = 136446210;
          v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
          _os_log_impl(&dword_1830D4000, v42, v43, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if (v58)
      {
        v50 = (char *)__nw_create_backtrace_string();
        v42 = __nwlog_obj();
        os_log_type_t v51 = type;
        BOOL v52 = os_log_type_enabled(v42, type);
        if (v50)
        {
          if (v52)
          {
            *(_DWORD *)buf = 136446466;
            v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
            __int16 v62 = 2082;
            v63 = v50;
            _os_log_impl(&dword_1830D4000, v42, v51, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v50);
          goto LABEL_88;
        }
        if (v52)
        {
          *(_DWORD *)buf = 136446210;
          v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
          _os_log_impl(&dword_1830D4000, v42, v51, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v42 = __nwlog_obj();
        os_log_type_t v55 = type;
        if (os_log_type_enabled(v42, type))
        {
          *(_DWORD *)buf = 136446210;
          v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
          _os_log_impl(&dword_1830D4000, v42, v55, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_88:
    if (v41) {
      free(v41);
    }
    goto LABEL_90;
  }
  id v12 = [v10 copyCParameters];
  id v13 = nw_parameters_copy_default_protocol_stack(v12);
  nw_protocol_options_t v14 = nw_protocol_stack_copy_transport_protocol(v13);
  BOOL v15 = v14 == 0;

  if (v15)
  {
    if (nw_protocol_setup_tcp_definition(void)::onceToken != -1) {
      dispatch_once(&nw_protocol_setup_tcp_definition(void)::onceToken, &__block_literal_global_64304);
    }
    options = nw_protocol_create_options((void *)g_tcp_definition);
    nw_protocol_stack_set_transport_protocol(v13, &options->super);
  }
  nw_parameters_set_indefinite(v12, 1);
  nw_parameters_set_no_opaque_proxy(v12, 1);
  __int16 v17 = [v9 internalEndpoint];
  uint64_t v18 = nw_connection_create(v17, v12);

  if (v18)
  {
    if (NWCopyInternalQueue_init_once != -1) {
      dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_63972);
    }
    uint64_t v19 = (id)NWCopyInternalQueue_nwQueue;
    nw_connection_set_queue(v18, v19);

    objc_storeStrong((id *)&v11->_endpoint, a3);
    os_log_type_t v20 = [[NWParameters alloc] initWithParameters:v12];
    parameters = v11->_parameters;
    v11->_parameters = v20;

    objc_storeStrong((id *)&v11->_internalConnection, v18);
    objc_storeWeak((id *)&v11->_delegate, obj);
    v11->_state = 1;
    [(NWTCPConnection *)v11 startInternal];
    id v22 = v11;
    goto LABEL_32;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v23 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
  os_log_type_t v24 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v58 = 0;
  if (__nwlog_fault(v24, &type, &v58))
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
        v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
        _os_log_impl(&dword_1830D4000, v25, v26, "%{public}s nw_connection_create failed", buf, 0xCu);
      }
    }
    else if (v58)
    {
      id v27 = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      os_log_type_t v25 = (id)gLogObj;
      os_log_type_t v28 = type;
      BOOL v29 = os_log_type_enabled(v25, type);
      if (v27)
      {
        if (v29)
        {
          *(_DWORD *)buf = 136446466;
          v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
          __int16 v62 = 2082;
          v63 = v27;
          _os_log_impl(&dword_1830D4000, v25, v28, "%{public}s nw_connection_create failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v27);
        if (!v24) {
          goto LABEL_31;
        }
        goto LABEL_30;
      }
      if (v29)
      {
        *(_DWORD *)buf = 136446210;
        v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
        _os_log_impl(&dword_1830D4000, v25, v28, "%{public}s nw_connection_create failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      os_log_type_t v25 = (id)gLogObj;
      os_log_type_t v30 = type;
      if (os_log_type_enabled(v25, type))
      {
        *(_DWORD *)buf = 136446210;
        v61 = "-[NWTCPConnection initWithEndpoint:parameters:delegate:]";
        _os_log_impl(&dword_1830D4000, v25, v30, "%{public}s nw_connection_create failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }
  if (v24) {
LABEL_30:
  }
    free(v24);
LABEL_31:
  id v22 = 0;
LABEL_32:

LABEL_33:
  return v22;
}

- (NWTCPConnection)initWithAcceptedInternalConnection:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v21 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v41 = "-[NWTCPConnection initWithAcceptedInternalConnection:]";
    id v22 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v38 = 0;
    if (__nwlog_fault(v22, &type, &v38))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        id v23 = __nwlog_obj();
        os_log_type_t v24 = type;
        if (os_log_type_enabled(v23, type))
        {
          *(_DWORD *)buf = 136446210;
          v41 = "-[NWTCPConnection initWithAcceptedInternalConnection:]";
          _os_log_impl(&dword_1830D4000, v23, v24, "%{public}s called with null internalConnection", buf, 0xCu);
        }
      }
      else if (v38)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        id v23 = __nwlog_obj();
        os_log_type_t v30 = type;
        BOOL v31 = os_log_type_enabled(v23, type);
        if (backtrace_string)
        {
          if (v31)
          {
            *(_DWORD *)buf = 136446466;
            v41 = "-[NWTCPConnection initWithAcceptedInternalConnection:]";
            __int16 v42 = 2082;
            os_log_type_t v43 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v23, v30, "%{public}s called with null internalConnection, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_36;
        }
        if (v31)
        {
          *(_DWORD *)buf = 136446210;
          v41 = "-[NWTCPConnection initWithAcceptedInternalConnection:]";
          _os_log_impl(&dword_1830D4000, v23, v30, "%{public}s called with null internalConnection, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        id v23 = __nwlog_obj();
        os_log_type_t v35 = type;
        if (os_log_type_enabled(v23, type))
        {
          *(_DWORD *)buf = 136446210;
          v41 = "-[NWTCPConnection initWithAcceptedInternalConnection:]";
          _os_log_impl(&dword_1830D4000, v23, v35, "%{public}s called with null internalConnection, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_36:
    if (v22) {
      free(v22);
    }

    goto LABEL_44;
  }
  v37.receiver = self;
  v37.super_class = (Class)NWTCPConnection;
  unsigned int v6 = [(NWTCPConnection *)&v37 init];
  id v7 = v6;
  if (!v6)
  {
    os_log_type_t v25 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v41 = "-[NWTCPConnection initWithAcceptedInternalConnection:]";
    os_log_type_t v26 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v38 = 0;
    if (__nwlog_fault(v26, &type, &v38))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        id v27 = __nwlog_obj();
        os_log_type_t v28 = type;
        if (os_log_type_enabled(v27, type))
        {
          *(_DWORD *)buf = 136446210;
          v41 = "-[NWTCPConnection initWithAcceptedInternalConnection:]";
          _os_log_impl(&dword_1830D4000, v27, v28, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if (v38)
      {
        v32 = (char *)__nw_create_backtrace_string();
        id v27 = __nwlog_obj();
        os_log_type_t v33 = type;
        BOOL v34 = os_log_type_enabled(v27, type);
        if (v32)
        {
          if (v34)
          {
            *(_DWORD *)buf = 136446466;
            v41 = "-[NWTCPConnection initWithAcceptedInternalConnection:]";
            __int16 v42 = 2082;
            os_log_type_t v43 = v32;
            _os_log_impl(&dword_1830D4000, v27, v33, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v32);
          goto LABEL_42;
        }
        if (v34)
        {
          *(_DWORD *)buf = 136446210;
          v41 = "-[NWTCPConnection initWithAcceptedInternalConnection:]";
          _os_log_impl(&dword_1830D4000, v27, v33, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        id v27 = __nwlog_obj();
        os_log_type_t v36 = type;
        if (os_log_type_enabled(v27, type))
        {
          *(_DWORD *)buf = 136446210;
          v41 = "-[NWTCPConnection initWithAcceptedInternalConnection:]";
          _os_log_impl(&dword_1830D4000, v27, v36, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_42:
    if (v26) {
      free(v26);
    }
LABEL_44:
    id v7 = 0;
    goto LABEL_6;
  }
  p_internalConnection = (nw_connection_t *)&v6->_internalConnection;
  objc_storeStrong((id *)&v6->_internalConnection, a3);
  id v9 = (id *)v5;
  id v10 = v9[1];

  uint64_t v11 = +[NWEndpoint endpointWithInternalEndpoint:v10];
  endpoint = v7->_endpoint;
  v7->_endpoint = (NWEndpoint *)v11;

  id v13 = [NWParameters alloc];
  nw_protocol_options_t v14 = v9;
  id v15 = v14[2];

  uint64_t v16 = [(NWParameters *)v13 initWithParameters:v15];
  parameters = v7->_parameters;
  v7->_parameters = (NWParameters *)v16;

  v7->_state = 1;
  [(NWTCPConnection *)v7 setupEventHandler];
  uint64_t v18 = *p_internalConnection;
  if (NWCopyInternalQueue_init_once != -1) {
    dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_63972);
  }
  uint64_t v19 = (id)NWCopyInternalQueue_nwQueue;
  nw_connection_set_queue(v18, v19);

  nw_connection_start(*p_internalConnection);
LABEL_6:

  return v7;
}

@end