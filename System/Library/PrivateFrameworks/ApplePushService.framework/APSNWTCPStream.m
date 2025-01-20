@interface APSNWTCPStream
+ (BOOL)isKeepAliveProxyFeatureEnabled;
+ (BOOL)isKeepAliveProxySupportedOnSomeInterface;
+ (unsigned)cachedServerCountForDomain:(id)a3;
+ (void)setCachedServerCount:(unsigned int)a3 forDomain:(id)a4 ttl:(unsigned int)a5;
- (APSNWTCPStream)initWithEnvironment:(id)a3;
- (APSTCPStreamDelegate)delegate;
- (BOOL)didPushCauseWake;
- (BOOL)forceWWANInterface;
- (BOOL)hasErrorStatus;
- (BOOL)isConnected;
- (BOOL)isKeepAliveProxyConfigured;
- (BOOL)isKeepAliveProxySupportedOnSocketInterface;
- (BOOL)isKeepAliveProxySupportedOnSomeInterface;
- (BOOL)isPeerTrustedForTrust:(__SecTrust *)a3;
- (BOOL)isSuspended;
- (BOOL)isTrust:(__SecTrust *)a3 validWithPolicy:(__SecPolicy *)a4 forPeer:(id)a5;
- (BOOL)remainsConnectedWhenWWANSuspends;
- (BOOL)useAlternatePort;
- (Class)configurationClass;
- (NSString)cachedIPAddress;
- (NSString)connectionDebugInfo;
- (NSString)ifname;
- (NSString)interfaceName;
- (NSString)redirectHostname;
- (NSString)serverHostname;
- (NSString)serverIPAddress;
- (id)_domain;
- (id)_getTCPInfoData;
- (id)tcpInfoDescription;
- (int64_t)allowedInterfaceConstraint;
- (int64_t)interfaceConstraint;
- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4;
- (unint64_t)generation;
- (unsigned)ipAddressFamily;
- (unsigned)serverPort;
- (void)_closeQuery;
- (void)_connectToServerWithConfiguration:(id)a3;
- (void)_connectToServerWithCount:(unsigned int)a3;
- (void)_connectToServerWithPeerName:(id)a3;
- (void)_openWithTXTLookup;
- (void)_queryRecordReply:(const void *)a3 length:(unsigned __int16)a4 ttl:(unsigned int)a5 errorCode:(int)a6;
- (void)_receiveData;
- (void)close;
- (void)dealloc;
- (void)handleState:(int)a3 error:(id)a4;
- (void)open;
- (void)setAllowedInterfaceConstraint:(int64_t)a3;
- (void)setCachedIPAddress:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setForceWWANInterface:(BOOL)a3;
- (void)setIpAddressFamily:(unsigned __int8)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setIsSuspended:(BOOL)a3;
- (void)setRedirectHostname:(id)a3;
- (void)setRemainsConnectedWhenWWANSuspends:(BOOL)a3;
- (void)setUseAlternatePort:(BOOL)a3;
- (void)writeDataInBackground:(id)a3;
@end

@implementation APSNWTCPStream

+ (void)setCachedServerCount:(unsigned int)a3 forDomain:(id)a4 ttl:(unsigned int)a5
{
  uint64_t v6 = *(void *)&a3;
  id v14 = a4;
  id v8 = a1;
  objc_sync_enter(v8);
  if (!qword_10015A900)
  {
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    v10 = (void *)qword_10015A900;
    qword_10015A900 = (uint64_t)v9;
  }
  +[NSDate timeIntervalSinceReferenceDate];
  double v12 = v11;
  v13 = objc_alloc_init(_APSServerCount);
  [(_APSServerCount *)v13 setTtlBegin:v12];
  [(_APSServerCount *)v13 setTtlEnd:v12 + (double)a5];
  [(_APSServerCount *)v13 setServerCount:v6];
  [(id)qword_10015A900 setObject:v13 forKey:v14];

  objc_sync_exit(v8);
}

+ (unsigned)cachedServerCountForDomain:(id)a3
{
  id v4 = a3;
  id v5 = a1;
  objc_sync_enter(v5);
  uint64_t v6 = [(id)qword_10015A900 objectForKey:v4];
  if (v6
    && (+[NSDate timeIntervalSinceReferenceDate],
        double v8 = v7,
        [v6 ttlBegin],
        v8 > v9)
    && ([v6 ttlEnd], v8 < v10))
  {
    unsigned int v11 = [v6 serverCount];
  }
  else
  {
    unsigned int v11 = 0;
  }

  objc_sync_exit(v5);
  return v11;
}

- (APSNWTCPStream)initWithEnvironment:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APSNWTCPStream;
  uint64_t v6 = [(APSNWTCPStream *)&v9 init];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_environment, a3);
    v7->_opened = 0;
  }

  return v7;
}

- (void)dealloc
{
  [(APSNWTCPStream *)self close];
  v3.receiver = self;
  v3.super_class = (Class)APSNWTCPStream;
  [(APSNWTCPStream *)&v3 dealloc];
}

- (void)setForceWWANInterface:(BOOL)a3
{
  if (self->_opened)
  {
    uint64_t v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"APSNWTCPStream.m" lineNumber:174 description:@"stream is opened but expected to be closed"];
  }
  self->_forceWWANInterface = a3;
}

- (void)setUseAlternatePort:(BOOL)a3
{
  if (self->_opened)
  {
    uint64_t v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"APSNWTCPStream.m" lineNumber:179 description:@"stream is opened but expected to be closed"];
  }
  self->_useAlternatePort = a3;
}

- (void)setRedirectHostname:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (self->_opened)
  {
    double v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"APSNWTCPStream.m" lineNumber:184 description:@"stream is opened but expected to be closed"];

    id v5 = v9;
  }
  uint64_t v6 = (NSString *)[v5 copy];
  redirectHostname = self->_redirectHostname;
  self->_redirectHostname = v6;
}

- (NSString)redirectHostname
{
  return self->_redirectHostname;
}

- (void)setCachedIPAddress:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (self->_opened)
  {
    double v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"APSNWTCPStream.m" lineNumber:193 description:@"stream is opened but expected to be closed"];

    id v5 = v9;
  }
  uint64_t v6 = (NSString *)[v5 copy];
  cachedIPAddress = self->_cachedIPAddress;
  self->_cachedIPAddress = v6;
}

- (NSString)cachedIPAddress
{
  return self->_cachedIPAddress;
}

- (void)setIsConnected:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[APSLog stream];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"YES";
    if (self->_isConnected) {
      CFStringRef v7 = @"YES";
    }
    else {
      CFStringRef v7 = @"NO";
    }
    int v8 = 138412802;
    id v9 = self;
    if (!v3) {
      CFStringRef v6 = @"NO";
    }
    __int16 v10 = 2112;
    CFStringRef v11 = v7;
    __int16 v12 = 2112;
    CFStringRef v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ asked to change isConnected=%@ to %@", (uint8_t *)&v8, 0x20u);
  }

  self->_isConnected = v3;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[APSLog stream];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"YES";
    if (self->_isSuspended) {
      CFStringRef v7 = @"YES";
    }
    else {
      CFStringRef v7 = @"NO";
    }
    int v8 = 138412802;
    id v9 = self;
    if (!v3) {
      CFStringRef v6 = @"NO";
    }
    __int16 v10 = 2112;
    CFStringRef v11 = v7;
    __int16 v12 = 2112;
    CFStringRef v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ asked to change isSuspended=%@ to %@", (uint8_t *)&v8, 0x20u);
  }

  self->_isSuspended = v3;
}

- (BOOL)isSuspended
{
  return self->_isSuspended;
}

- (int64_t)interfaceConstraint
{
  return self->_interfaceConstraint;
}

- (NSString)ifname
{
  return self->_interfaceName;
}

- (id)_domain
{
  BOOL v3 = [(APSEnvironment *)self->_environment domain];
  unsigned __int8 v4 = [v3 hasSuffix:@"."];

  id v5 = [(APSEnvironment *)self->_environment domain];
  CFStringRef v6 = v5;
  if ((v4 & 1) == 0)
  {
    uint64_t v7 = [v5 stringByAppendingString:@"."];

    CFStringRef v6 = (void *)v7;
  }
  return v6;
}

- (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (void)open
{
  unsigned __int8 v4 = +[APSLog stream];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    environment = self->_environment;
    CFStringRef v6 = [(APSEnvironment *)environment name];
    *(_DWORD *)buf = 138412802;
    v15 = self;
    __int16 v16 = 2112;
    v17 = environment;
    __int16 v18 = 2112;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Opening %@ with environment %@[%@]", buf, 0x20u);
  }
  if (self->_opened)
  {
    __int16 v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"APSNWTCPStream.m" lineNumber:244 description:@"stream is opened but expected to be closed"];
  }
  self->_opened = 1;
  self->_hasSentPresence = 0;
  self->_generation = arc4random();
  if ([(APSEnvironment *)self->_environment debugHostname])
  {
    uint64_t v7 = [(APSEnvironment *)self->_environment hostname];
    serverHostname = self->_serverHostname;
    self->_serverHostname = v7;

    [(APSNWTCPStream *)self _connectToServerWithPeerName:self->_serverHostname];
  }
  else
  {
    BOOL v9 = !self->_forceWWANInterface;
    __int16 v10 = [(APSNWTCPStream *)self configurationClass];
    CFStringRef v11 = self->_environment;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10006FAF4;
    v13[3] = &unk_10012B4F0;
    v13[4] = self;
    [(objc_class *)v10 loadConfigurationForEnvironment:v11 connectionType:v9 block:v13];
  }
}

- (void)_openWithTXTLookup
{
  if (![(APSEnvironment *)self->_environment isLoadBalanced])
  {
    uint64_t v7 = self;
    id v8 = 0;
    goto LABEL_5;
  }
  unsigned __int8 v4 = objc_opt_class();
  id v5 = [(APSEnvironment *)self->_environment domain];
  id v6 = [v4 cachedServerCountForDomain:v5];

  if (v6)
  {
    uint64_t v7 = self;
    id v8 = v6;
LABEL_5:
    [(APSNWTCPStream *)v7 _connectToServerWithCount:v8];
    return;
  }
  if (self->_forceWWANInterface)
  {
    BOOL v9 = +[PCPersistentInterfaceManager sharedInstance];
    __int16 v10 = [v9 WWANInterfaceName];

    if (v10) {
      uint32_t v11 = if_nametoindex((const char *)[v10 UTF8String]);
    }
    else {
      uint32_t v11 = 0;
    }
  }
  else
  {
    uint32_t v11 = 0;
  }
  __int16 v12 = +[APSLog stream];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v13 = [(APSNWTCPStream *)self _domain];
    *(_DWORD *)buf = 138412546;
    v22 = self;
    __int16 v23 = 2112;
    v24 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ performing DNS lookup for %@", buf, 0x16u);
  }
  id v14 = [(APSNWTCPStream *)self _domain];
  uint64_t Record = DNSServiceQueryRecord(&self->_serviceQuery, 0, v11, (const char *)[v14 UTF8String], 0x10u, 1u, (DNSServiceQueryRecordReply)sub_10007027C, self);

  if (Record)
  {
    __int16 v16 = +[APSLog stream];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = self;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ DNS query failed!", buf, 0xCu);
    }

    [(APSNWTCPStream *)self close];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v20 = Record;
    __int16 v18 = APSError();
    objc_msgSend(WeakRetained, "tcpStream:errorOccured:", self, v18, v20);
  }
  else if (DNSServiceSetDispatchQueue(self->_serviceQuery, (dispatch_queue_t)&_dispatch_main_q))
  {
    v19 = +[NSAssertionHandler currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"APSNWTCPStream.m" lineNumber:327 description:@"DNSServiceSetDispatchQueue failed"];
  }
}

- (void)_queryRecordReply:(const void *)a3 length:(unsigned __int16)a4 ttl:(unsigned int)a5 errorCode:(int)a6
{
  if (a3 && (unsigned int v7 = a4) != 0)
  {
    uint64_t v8 = *(void *)&a5;
    [(APSNWTCPStream *)self _closeQuery];
    uint8_t valueLen = 0;
    ValuePtr = TXTRecordGetValuePtr(v7, a3, "count", &valueLen);
    uint32_t v11 = malloc_type_malloc(valueLen + 1, 0x3DD47EFuLL);
    memcpy(v11, ValuePtr, valueLen);
    *((unsigned char *)v11 + valueLen) = 0;
    uint64_t v12 = strtol((const char *)v11, 0, 0);
    free(v11);
    if (v12)
    {
      CFStringRef v13 = objc_opt_class();
      id v14 = [(APSEnvironment *)self->_environment domain];
      [v13 setCachedServerCount:v12 forDomain:v14 ttl:v8];

      [(APSNWTCPStream *)self _connectToServerWithCount:v12];
    }
    else
    {
      [(APSNWTCPStream *)self close];
      v17 = +[NSData dataWithBytes:a3 length:v7];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v19 = APSError();
      objc_msgSend(WeakRetained, "tcpStream:errorOccured:", self, v19, v17);
    }
  }
  else
  {
    [(APSNWTCPStream *)self close];
    id v20 = objc_loadWeakRetained((id *)&self->_delegate);
    v15 = [(APSEnvironment *)self->_environment domain];
    __int16 v16 = APSError();
    objc_msgSend(v20, "tcpStream:errorOccured:", self, v16, v15);
  }
}

- (void)_closeQuery
{
  serviceQuery = self->_serviceQuery;
  if (serviceQuery)
  {
    DNSServiceRefDeallocate(serviceQuery);
    self->_serviceQuery = 0;
  }
}

- (void)close
{
  if (self->_opened)
  {
    BOOL v3 = +[APSLog stream];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      environment = self->_environment;
      id v5 = [(APSEnvironment *)environment name];
      int v8 = 138412802;
      BOOL v9 = self;
      __int16 v10 = 2112;
      uint32_t v11 = environment;
      __int16 v12 = 2112;
      CFStringRef v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Closing %@ with environment %@[%@]", (uint8_t *)&v8, 0x20u);
    }
    [(APSNWTCPStream *)self _closeQuery];
    connection = self->_connection;
    if (connection)
    {
      nw_connection_cancel(connection);
      unsigned int v7 = self->_connection;
      self->_connection = 0;
    }
    self->_opened = 0;
    self->_generation = 0;
  }
}

- (void)_connectToServerWithPeerName:(id)a3
{
  unsigned __int8 v4 = (NSString *)a3;
  id v5 = v4;
  if (self->_connection)
  {
    id v6 = +[APSLog stream];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_1000CA77C((uint64_t)self, v6);
    }
  }
  else
  {
    unsigned int v7 = (NSString *)[(NSString *)v4 copy];
    peerName = self->_peerName;
    self->_peerName = v7;

    unint64_t v9 = [(APSEnvironment *)self->_environment port];
    if (self->_useAlternatePort) {
      unint64_t v9 = [(APSEnvironment *)self->_environment alternatePort];
    }
    unint64_t v10 = v9;
    uint32_t v11 = +[APSLog stream];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      BOOL forceWWANInterface = self->_forceWWANInterface;
      *(_DWORD *)buf = 138413058;
      if (forceWWANInterface) {
        CFStringRef v13 = @"YES";
      }
      else {
        CFStringRef v13 = @"NO";
      }
      v56 = self;
      __int16 v57 = 2112;
      v58 = v5;
      __int16 v59 = 2048;
      unint64_t v60 = v10;
      __int16 v61 = 2112;
      CFStringRef v62 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ _connectToServerWithPeerName: %@ and port: %lu forceWWANInterface? %@", buf, 0x2Au);
    }

    if (self->_opened)
    {
      id v6 = sub_10007E420(APSDemoHostsKey, 1);
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = [(APSEnvironment *)self->_environment name];
          v15 = [v6 objectForKey:v14];

          if (v15)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              __int16 v16 = (NSString *)[v15 copy];
              serverHostname = self->_serverHostname;
              self->_serverHostname = v16;

              __int16 v18 = (NSString *)[v15 copy];
              v19 = self->_peerName;
              self->_peerName = v18;

              id v20 = +[APSLog stream];
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                v21 = self->_serverHostname;
                *(_DWORD *)buf = 138412546;
                v56 = self;
                __int16 v57 = 2112;
                v58 = v21;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@ Overriding server hostname/IP to %@", buf, 0x16u);
              }
            }
          }
        }
      }
      [(NSString *)self->_serverHostname UTF8String];
      host_with_numeric_port = nw_endpoint_create_host_with_numeric_port();
      objc_initWeak(&location, self);
      BOOL nagleEnabled = self->_nagleEnabled;
      configure_tls[0] = _NSConcreteStackBlock;
      configure_tls[1] = 3221225472;
      configure_tls[2] = sub_100070D70;
      configure_tls[3] = &unk_10012B910;
      v52 = v5;
      objc_copyWeak(&v53, &location);
      configure_tcp[0] = _NSConcreteStackBlock;
      configure_tcp[1] = 3221225472;
      configure_tcp[2] = sub_100070F5C;
      configure_tcp[3] = &unk_10012B938;
      BOOL v50 = nagleEnabled;
      configure_tcp[4] = self;
      secure_tcp = nw_parameters_create_secure_tcp(configure_tls, configure_tcp);
      xpc_object_t empty = xpc_array_create_empty();
      xpc_array_set_uint64(empty, 0xFFFFFFFFFFFFFFFFLL, 0x1389uLL);
      nw_parameters_set_prohibited_interface_subtypes();
      nw_parameters_set_prefer_no_proxy(secure_tcp, 1);
      nw_parameters_set_service_class(secure_tcp, nw_service_class_responsive_data);
      if (_os_feature_enabled_impl() && self->_allowedInterfaceConstraint == 1) {
        nw_parameters_set_allow_ultra_constrained();
      }
      if (!self->_forceWWANInterface) {
        goto LABEL_29;
      }
      v26 = nw_parameters_copy_default_protocol_stack(secure_tcp);
      v27 = nw_protocol_stack_copy_internet_protocol(v26);
      nw_ip_options_set_local_address_preference(v27, nw_ip_local_address_preference_stable);

      if (!self->_forceWWANInterface) {
        goto LABEL_29;
      }
      v28 = +[PCPersistentInterfaceManager sharedInstance];
      unsigned int v29 = [v28 allowBindingToWWAN];

      if (v29)
      {
        v30 = +[APSLog stream];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v56 = self;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%@: binding stream to WWAN interface", buf, 0xCu);
        }

        nw_parameters_set_required_interface_type(secure_tcp, nw_interface_type_cellular);
      }
      else
      {
LABEL_29:
        v31 = +[APSLog stream];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v56 = self;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%@: binding stream to non cellular interface", buf, 0xCu);
        }

        nw_parameters_prohibit_interface_type(secure_tcp, nw_interface_type_cellular);
      }
      v32 = (OS_nw_connection *)nw_connection_create(host_with_numeric_port, secure_tcp);
      connection = self->_connection;
      self->_connection = v32;

      v34 = self->_connection;
      id v35 = &_dispatch_main_q;
      nw_connection_set_queue(v34, (dispatch_queue_t)&_dispatch_main_q);

      sendData = self->_sendData;
      if (sendData)
      {
        v37 = self->_connection;
        v38 = [(NSMutableData *)sendData _createDispatchData];
        nw_connection_send(v37, v38, _nw_content_context_default_message, 1, _nw_connection_send_idempotent_content);

        v39 = self->_sendData;
        self->_sendData = 0;
      }
      v40 = self->_connection;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100071060;
      handler[3] = &unk_10012B960;
      objc_copyWeak(&v48, &location);
      nw_connection_set_state_changed_handler(v40, handler);
      [(APSNWTCPStream *)self _receiveData];
      if (!self->_remainsConnectedWhenWWANSuspends || !self->_forceWWANInterface)
      {
        v41 = self->_connection;
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472;
        v45[2] = sub_1000710CC;
        v45[3] = &unk_10012B988;
        objc_copyWeak(&v46, &location);
        v45[4] = self;
        nw_connection_set_better_path_available_handler(v41, v45);
        objc_destroyWeak(&v46);
      }
      nw_connection_start((nw_connection_t)self->_connection);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v43 = objc_opt_respondsToSelector();

      if (v43)
      {
        id v44 = objc_loadWeakRetained((id *)&self->_delegate);
        [v44 tcpStream:self hasDeterminedServerHostname:self->_serverHostname];
      }
      objc_destroyWeak(&v48);

      objc_destroyWeak(&v53);
      objc_destroyWeak(&location);
    }
    else
    {
      id v6 = +[APSLog stream];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1000C96D0();
      }
    }
  }
}

- (void)_connectToServerWithCount:(unsigned int)a3
{
  if ([(APSEnvironment *)self->_environment debugHostname])
  {
    id v5 = [(APSEnvironment *)self->_environment hostname];
    id v6 = [v5 copy];
  }
  else
  {
    id v7 = objc_alloc((Class)NSString);
    id v5 = [(APSEnvironment *)self->_environment hostname];
    int v8 = [(APSNWTCPStream *)self _domain];
    id v6 = [v7 initWithFormat:@"%@.%@", v5, v8];
  }
  if ([(APSEnvironment *)self->_environment isLoadBalanced])
  {
    if (a3 <= 1) {
      a3 = 1;
    }
    unint64_t v9 = (NSString *)[objc_alloc((Class)NSString) initWithFormat:@"%u-%@", arc4random() % a3 + 1, v6];
  }
  else
  {
    unint64_t v9 = (NSString *)v6;
  }
  serverHostname = self->_serverHostname;
  self->_serverHostname = v9;

  if (self->_redirectHostname)
  {
    uint32_t v11 = +[APSLog stream];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      redirectHostname = self->_redirectHostname;
      *(_DWORD *)buf = 138412802;
      __int16 v16 = self;
      __int16 v17 = 2112;
      __int16 v18 = redirectHostname;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ courier redirect hostname is defined, using hostname %@ and peername %@", buf, 0x20u);
    }

    objc_storeStrong((id *)&self->_serverHostname, self->_redirectHostname);
  }
  if (self->_cachedIPAddress)
  {
    CFStringRef v13 = +[APSLog stream];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      cachedIPAddress = self->_cachedIPAddress;
      *(_DWORD *)buf = 138412802;
      __int16 v16 = self;
      __int16 v17 = 2112;
      __int16 v18 = cachedIPAddress;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ courier last cached ip address is defined, using hostname %@ and peername %@", buf, 0x20u);
    }

    objc_storeStrong((id *)&self->_serverHostname, self->_cachedIPAddress);
  }
  [(APSNWTCPStream *)self _connectToServerWithPeerName:v6];
}

- (void)_connectToServerWithConfiguration:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(APSEnvironment *)self->_environment isLoadBalanced];
  id v6 = +[APSLog stream];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v8 = (NSString *)[v4 serverCount];
      unint64_t v9 = [v4 hostname];
      *(_DWORD *)buf = 138412802;
      v26 = self;
      __int16 v27 = 2048;
      v28 = v8;
      __int16 v29 = 2112;
      v30 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ env isLoadBalanced, using server count %lu and hostname %@", buf, 0x20u);
    }
    unint64_t v10 = arc4random();
    unint64_t v11 = v10 % ((unint64_t)[v4 serverCount] + 1);
    id v12 = objc_alloc((Class)NSString);
    CFStringRef v13 = [v4 hostname];
    id v14 = (NSString *)[v12 initWithFormat:@"%u-%@", v11, v13];
    serverHostname = self->_serverHostname;
    self->_serverHostname = v14;
  }
  else
  {
    if (v7)
    {
      __int16 v16 = [v4 hostname];
      *(_DWORD *)buf = 138412546;
      v26 = self;
      __int16 v27 = 2112;
      v28 = v16;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ env is not load balanced, using config's host name: %@", buf, 0x16u);
    }
    __int16 v17 = [v4 hostname];
    CFStringRef v13 = self->_serverHostname;
    self->_serverHostname = v17;
  }

  if (self->_redirectHostname)
  {
    __int16 v18 = +[APSLog stream];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      redirectHostname = self->_redirectHostname;
      id v20 = [v4 hostname];
      *(_DWORD *)buf = 138412802;
      v26 = self;
      __int16 v27 = 2112;
      v28 = redirectHostname;
      __int16 v29 = 2112;
      v30 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@ courier redirect hostname is defined, using hostname %@ and peername %@", buf, 0x20u);
    }
    objc_storeStrong((id *)&self->_serverHostname, self->_redirectHostname);
  }
  if (self->_cachedIPAddress)
  {
    v21 = +[APSLog stream];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      cachedIPAddress = self->_cachedIPAddress;
      __int16 v23 = [v4 hostname];
      *(_DWORD *)buf = 138412802;
      v26 = self;
      __int16 v27 = 2112;
      v28 = cachedIPAddress;
      __int16 v29 = 2112;
      v30 = v23;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@ courier last cached ip address is defined, using hostname %@ and peername %@", buf, 0x20u);
    }
    objc_storeStrong((id *)&self->_serverHostname, self->_cachedIPAddress);
  }
  v24 = [v4 hostname];
  [(APSNWTCPStream *)self _connectToServerWithPeerName:v24];
}

- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4
{
  if (!self->_connection) {
    return 0;
  }
  id v5 = [objc_alloc((Class)NSData) initWithBytes:a3 length:a4];
  connection = self->_connection;
  BOOL v7 = [v5 _createDispatchData];
  nw_connection_send(connection, v7, _nw_content_context_default_message, 1, _nw_connection_send_idempotent_content);

  id v8 = [v5 length];
  return (int64_t)v8;
}

- (void)writeDataInBackground:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  connection = self->_connection;
  id v11 = v4;
  if (connection)
  {
    BOOL v7 = [v4 _createDispatchData];
    nw_connection_send(connection, v7, _nw_content_context_default_message, 1, _nw_connection_send_idempotent_content);
  }
  else
  {
    sendData = self->_sendData;
    if (!sendData)
    {
      unint64_t v9 = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
      unint64_t v10 = self->_sendData;
      self->_sendData = v9;

      id v5 = v11;
      sendData = self->_sendData;
    }
    [(NSMutableData *)sendData appendData:v5];
  }
}

- (BOOL)isTrust:(__SecTrust *)a3 validWithPolicy:(__SecPolicy *)a4 forPeer:(id)a5
{
  id v7 = a5;
  if (!sub_10007E748()
    || (BOOL v8 = 1,
        unint64_t v9 = (void *)sub_10007E420(APSTrustAllHosts, 1),
        unsigned __int8 v10 = [v9 BOOLValue],
        v9,
        (v10 & 1) == 0))
  {
    if (SecTrustSetPolicies(a3, a4))
    {
      id v11 = +[APSLog stream];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        sub_1000C989C();
      }

      BOOL v8 = 0;
    }
    else
    {
      CFErrorRef error = 0;
      BOOL v8 = SecTrustEvaluateWithError(a3, &error);
      if (!v8)
      {
        if (error)
        {
          id v12 = error;
          CFStringRef v13 = +[APSLog stream];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            sub_1000C9834();
          }
        }
        else
        {
          id v12 = +[APSLog stream];
          if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
            sub_1000C97F0((os_log_t)v12);
          }
        }
      }
    }
  }

  return v8;
}

- (BOOL)isPeerTrustedForTrust:(__SecTrust *)a3
{
  if (!a3) {
    return 0;
  }
  if (os_variant_allows_internal_security_policies()
    && ![(APSEnvironment *)self->_environment isCertificateValidated])
  {
    unsigned __int8 v10 = +[APSLog stream];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      peerName = self->_peerName;
      int v19 = 138412290;
      id v20 = peerName;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Not performing validation for %@", (uint8_t *)&v19, 0xCu);
    }
    BOOL v9 = 1;
    goto LABEL_20;
  }
  if (![(APSEnvironment *)self->_environment isCertificateValidated])
  {
    id v5 = +[APSLog stream];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_1000C99FC((id *)&self->_environment, v5);
    }
  }
  uint64_t ApplePushService = SecPolicyCreateApplePushService();
  if (!ApplePushService)
  {
    unsigned __int8 v10 = +[APSLog stream];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_1000C9910((uint64_t *)&self->_peerName, v10);
    }
    goto LABEL_19;
  }
  id v7 = (const void *)ApplePushService;
  unsigned __int8 v8 = [(APSNWTCPStream *)self isTrust:a3 validWithPolicy:ApplePushService forPeer:self->_peerName];
  CFRelease(v7);
  if ((v8 & 1) == 0)
  {
    unsigned __int8 v10 = +[APSLog stream];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000C998C((uint64_t)&self->_peerName, v10, v12, v13, v14, v15, v16, v17);
    }
LABEL_19:
    BOOL v9 = 0;
LABEL_20:

    return v9;
  }
  return 1;
}

- (void)handleState:(int)a3 error:(id)a4
{
  id v6 = a4;
  if (self->_connection)
  {
    switch(a3)
    {
      case 1:
      case 4:
        [(APSNWTCPStream *)self close];
        self->_hasError = 1;
        id v7 = nw_error_copy_cf_error(v6);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained tcpStream:self errorOccured:v7];
        goto LABEL_36;
      case 3:
        id v7 = nw_connection_copy_connected_path();
        if (v7)
        {
          BOOL v9 = nw_path_copy_interface();
          unsigned __int8 v10 = v9;
          if (v9)
          {
            id v11 = +[NSString stringWithUTF8String:nw_interface_get_name(v9)];
            interfaceName = self->_interfaceName;
            self->_interfaceName = v11;

            if (_os_feature_enabled_impl()) {
              self->_interfaceConstraint = nw_interface_is_ultra_constrained();
            }
          }
        }
        uint64_t v13 = nw_connection_copy_connected_remote_endpoint();
        id WeakRetained = v13;
        if (v13)
        {
          self->_ipAddressFamily = nw_endpoint_get_address(v13)->sa_family;
          uint64_t v14 = +[NSString stringWithUTF8String:nw_endpoint_get_hostname(WeakRetained)];
          serverIPAddress = self->_serverIPAddress;
          self->_serverIPAddress = v14;

          self->_serverPort = nw_endpoint_get_port(WeakRetained);
        }
        if (!self->_hasSentPresence)
        {
          id v16 = objc_loadWeakRetained((id *)&self->_delegate);
          char v17 = objc_opt_respondsToSelector();

          if (v17)
          {
            connection = self->_connection;
            int v19 = nw_protocol_copy_tls_definition();
            id v20 = nw_connection_copy_protocol_metadata(connection, v19);

            v39 = v20;
            if (v20 && nw_protocol_metadata_is_tls(v20))
            {
              v21 = nw_tls_copy_sec_protocol_metadata(v20);
              negotiated_protocol = sec_protocol_metadata_get_negotiated_protocol(v21);
              if (negotiated_protocol)
              {
                __int16 v23 = +[NSString stringWithUTF8String:negotiated_protocol];
              }
              else
              {
                __int16 v23 = 0;
              }
            }
            else
            {
              __int16 v23 = 0;
            }
            v24 = +[APSLog stream];
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = self;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v23;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%@ negotiatedProtocol: %@", buf, 0x16u);
            }

            unsigned int v37 = [v23 hasPrefix:@"apns-pack-v1"];
            v38 = v23;
            if (v37)
            {
              v25 = [v23 componentsSeparatedByString:@":"];
              v26 = +[APSLog stream];
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v25;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Negotiated protocol components: %@", buf, 0xCu);
              }

              if ([v25 count] == (id)3)
              {
                __int16 v27 = [v25 objectAtIndexedSubscript:1];
                id v36 = [v27 integerValue];

                v28 = [v25 objectAtIndexedSubscript:2];
                id v35 = [v28 integerValue];
              }
              else
              {
                id v35 = 0;
                id v36 = 0;
              }
            }
            else
            {
              id v35 = 0;
              id v36 = 0;
            }
            self->_hasSentPresence = 1;
            memset(buf, 0, sizeof(buf));
            nw_connection_fillout_tcp_statistics();
            __int16 v29 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)&buf[8]];
            v30 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)buf];
            v31 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)&buf[16]];
            v32 = +[NSDictionary dictionaryWithObjectsAndKeys:v30, @"dns", v31, @"tls", v29, @"tcp_handshake", 0];
            v33 = +[APSLog stream];
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v40 = 138412290;
              v41 = v32;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "connectionStatistics: %@", v40, 0xCu);
            }

            id v34 = objc_loadWeakRetained((id *)&self->_delegate);
            [v34 tcpStreamHasConnected:self context:v32 enabledPackedFormat:v37 maxEncoderTableSize:v36 maxDecoderTableSize:v35 secureHandshakeEnabled:1];
          }
        }
LABEL_36:

        goto LABEL_37;
      case 5:
        [(APSNWTCPStream *)self close];
        goto LABEL_38;
      default:
        goto LABEL_38;
    }
  }
  id v7 = +[APSLog stream];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1000CA838();
  }
LABEL_37:

LABEL_38:
}

- (BOOL)hasErrorStatus
{
  return self->_hasError;
}

- (void)_receiveData
{
  if (self->_connection)
  {
    uint32_t v3 = 4 * vm_page_size;
    objc_initWeak(&location, self);
    connection = self->_connection;
    completion[0] = _NSConcreteStackBlock;
    completion[1] = 3221225472;
    completion[2] = sub_1000721A8;
    completion[3] = &unk_10012B9B0;
    objc_copyWeak(&v6, &location);
    completion[4] = self;
    nw_connection_receive(connection, 1u, v3, completion);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (id)_getTCPInfoData
{
  if (self->_connection)
  {
    uint32_t v3 = (void *)nw_connection_copy_tcp_info();
    id v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    if ([v4 count])
    {
      uint64_t v8 = 0;
      BOOL v9 = &v8;
      uint64_t v10 = 0x3032000000;
      id v11 = sub_1000724A8;
      uint64_t v12 = sub_1000724B8;
      id v13 = 0;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1000724C0;
      v7[3] = &unk_10012B518;
      v7[4] = self;
      v7[5] = &v8;
      [v4 enumerateKeysAndObjectsUsingBlock:v7];
      id v5 = (id)v9[5];
      _Block_object_dispose(&v8, 8);
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)tcpInfoDescription
{
  v2 = [(APSNWTCPStream *)self _getTCPInfoData];
  if ([v2 length] == (id)408)
  {
    uint32_t v3 = (unsigned __int8 *)[v2 bytes];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @" %u %x %u %u %x %u %u %u %u %u %u %u %u %u %u %u %u %d %u %llu %llu %llu %llu %llu %llu", *v3, v3[1], v3[2], v3[3], *((unsigned int *)v3 + 1), *((unsigned int *)v3 + 2), *((unsigned int *)v3 + 3), *((unsigned int *)v3 + 4), *((unsigned int *)v3 + 5), *((unsigned int *)v3 + 6), *((unsigned int *)v3 + 7), *((unsigned int *)v3 + 9), *((unsigned int *)v3 + 10), *((unsigned int *)v3 + 11), *((unsigned int *)v3 + 12), *((unsigned int *)v3 + 13),
      *((unsigned int *)v3 + 14),
      *((unsigned int *)v3 + 15),
      *((unsigned int *)v3 + 16),
      *(_OWORD *)(v3 + 76),
      *(void *)(v3 + 92),
      *(void *)(v3 + 108),
      *(void *)(v3 + 116),
    id v4 = *(void *)(v3 + 132));
  }
  else
  {
    id v5 = +[APSLog stream];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000C9DF4(v5);
    }

    id v4 = 0;
  }

  return v4;
}

- (BOOL)isKeepAliveProxySupportedOnSocketInterface
{
  return 0;
}

+ (BOOL)isKeepAliveProxySupportedOnSomeInterface
{
  return 0;
}

- (BOOL)isKeepAliveProxyConfigured
{
  return 0;
}

- (BOOL)isKeepAliveProxySupportedOnSomeInterface
{
  return 0;
}

+ (BOOL)isKeepAliveProxyFeatureEnabled
{
  return 0;
}

- (BOOL)didPushCauseWake
{
  return 0;
}

- (NSString)connectionDebugInfo
{
  if (!self->_serverHostname || !self->_connection)
  {
    id v11 = 0;
    goto LABEL_10;
  }
  uint32_t v3 = nw_connection_copy_connected_local_endpoint();
  uint64_t v4 = nw_connection_copy_connected_remote_endpoint();
  id v5 = v4;
  serverHostname = self->_serverHostname;
  if (!v3)
  {
    uint64_t port = 0;
    hostname = "";
    if (v4) {
      goto LABEL_5;
    }
LABEL_8:
    uint64_t v10 = 0;
    BOOL v9 = "";
    goto LABEL_9;
  }
  hostname = nw_endpoint_get_hostname(v3);
  uint64_t port = nw_endpoint_get_port(v3);
  if (!v5) {
    goto LABEL_8;
  }
LABEL_5:
  BOOL v9 = nw_endpoint_get_hostname(v5);
  uint64_t v10 = nw_endpoint_get_port(v5);
LABEL_9:
  id v11 = +[NSString stringWithFormat:@"\"%@\" ([%s]:%u, [%s]:%u)", serverHostname, hostname, port, v9, v10];

LABEL_10:
  return (NSString *)v11;
}

- (APSTCPStreamDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (APSTCPStreamDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)serverHostname
{
  return self->_serverHostname;
}

- (NSString)serverIPAddress
{
  return self->_serverIPAddress;
}

- (unsigned)serverPort
{
  return self->_serverPort;
}

- (BOOL)forceWWANInterface
{
  return self->_forceWWANInterface;
}

- (BOOL)useAlternatePort
{
  return self->_useAlternatePort;
}

- (unint64_t)generation
{
  return self->_generation;
}

- (BOOL)remainsConnectedWhenWWANSuspends
{
  return self->_remainsConnectedWhenWWANSuspends;
}

- (void)setRemainsConnectedWhenWWANSuspends:(BOOL)a3
{
  self->_remainsConnectedWhenWWANSuspends = a3;
}

- (unsigned)ipAddressFamily
{
  return self->_ipAddressFamily;
}

- (void)setIpAddressFamily:(unsigned __int8)a3
{
  self->_ipAddressFamily = a3;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (int64_t)allowedInterfaceConstraint
{
  return self->_allowedInterfaceConstraint;
}

- (void)setAllowedInterfaceConstraint:(int64_t)a3
{
  self->_allowedInterfaceConstraint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_cachedIPAddress, 0);
  objc_storeStrong((id *)&self->_redirectHostname, 0);
  objc_storeStrong((id *)&self->_serverIPAddress, 0);
  objc_storeStrong((id *)&self->_serverHostname, 0);
  objc_storeStrong((id *)&self->_peerName, 0);
  objc_storeStrong((id *)&self->_sendData, 0);
  objc_storeStrong((id *)&self->_receiveData, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_environment, 0);
}

@end