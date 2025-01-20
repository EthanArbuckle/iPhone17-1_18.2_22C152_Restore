@interface APSTCPStream
+ (BOOL)isKeepAliveProxyFeatureEnabled;
+ (BOOL)isKeepAliveProxySupportedOnSomeInterface;
+ (unsigned)cachedServerCountForDomain:(id)a3;
+ (void)setCachedServerCount:(unsigned int)a3 forDomain:(id)a4 ttl:(unsigned int)a5;
- (APSTCPStream)initWithEnvironment:(id)a3;
- (APSTCPStreamDelegate)delegate;
- (BOOL)didPushCauseWake;
- (BOOL)forceWWANInterface;
- (BOOL)hasErrorStatus;
- (BOOL)isConnected;
- (BOOL)isKeepAliveProxyConfigured;
- (BOOL)isKeepAliveProxySupportedOnSocketInterface;
- (BOOL)isKeepAliveProxySupportedOnSomeInterface;
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
- (id)_copyServerIPAddressString;
- (id)_domain;
- (id)_getTCPInfoData;
- (id)taskTransactionMetrics;
- (id)tcpInfoDescription;
- (int64_t)allowedInterfaceConstraint;
- (int64_t)interfaceConstraint;
- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4;
- (sockaddr)_copyLocalSockAddr;
- (sockaddr)_copyRemoteSockAddr;
- (unint64_t)generation;
- (unsigned)ipAddressFamily;
- (unsigned)serverPort;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 streamTask:(id)a4 didBecomeInputStream:(id)a5 outputStream:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)_closeQuery;
- (void)_connectToServerWithConfiguration:(id)a3;
- (void)_connectToServerWithCount:(unsigned int)a3;
- (void)_connectToServerWithPeerName:(id)a3;
- (void)_hasBytesAvailable;
- (void)_hasSpaceAvailable;
- (void)_openWithTXTLookup;
- (void)_queryRecordReply:(const void *)a3 length:(unsigned __int16)a4 ttl:(unsigned int)a5 errorCode:(int)a6;
- (void)close;
- (void)configureWhetherPeerIsTrustedFor:(__SecTrust *)a3;
- (void)dealloc;
- (void)open;
- (void)setCachedIPAddress:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setForceWWANInterface:(BOOL)a3;
- (void)setIpAddressFamily:(unsigned __int8)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setIsSuspended:(BOOL)a3;
- (void)setRedirectHostname:(id)a3;
- (void)setRemainsConnectedWhenWWANSuspends:(BOOL)a3;
- (void)setUseAlternatePort:(BOOL)a3;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
- (void)writeDataInBackground:(id)a3;
@end

@implementation APSTCPStream

+ (void)setCachedServerCount:(unsigned int)a3 forDomain:(id)a4 ttl:(unsigned int)a5
{
  uint64_t v6 = *(void *)&a3;
  id v14 = a4;
  id v8 = a1;
  objc_sync_enter(v8);
  if (!qword_10015A888)
  {
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    v10 = (void *)qword_10015A888;
    qword_10015A888 = (uint64_t)v9;
  }
  +[NSDate timeIntervalSinceReferenceDate];
  double v12 = v11;
  v13 = objc_alloc_init(_APSServerCount);
  [(_APSServerCount *)v13 setTtlBegin:v12];
  [(_APSServerCount *)v13 setTtlEnd:v12 + (double)a5];
  [(_APSServerCount *)v13 setServerCount:v6];
  [(id)qword_10015A888 setObject:v13 forKey:v14];

  objc_sync_exit(v8);
}

+ (unsigned)cachedServerCountForDomain:(id)a3
{
  id v4 = a3;
  id v5 = a1;
  objc_sync_enter(v5);
  uint64_t v6 = [(id)qword_10015A888 objectForKey:v4];
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

- (APSTCPStream)initWithEnvironment:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APSTCPStream;
  uint64_t v6 = [(APSTCPStream *)&v9 init];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_environment, a3);
    *(_WORD *)&v7->_hasCompletedTLSHandshake = 0;
    v7->_opened = 0;
  }

  return v7;
}

- (void)dealloc
{
  [(APSTCPStream *)self close];
  v3.receiver = self;
  v3.super_class = (Class)APSTCPStream;
  [(APSTCPStream *)&v3 dealloc];
}

- (void)setForceWWANInterface:(BOOL)a3
{
  if (self->_opened)
  {
    uint64_t v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"APSTCPStream.m" lineNumber:177 description:@"stream is opened but expected to be closed"];
  }
  self->_forceWWANInterface = a3;
}

- (void)setUseAlternatePort:(BOOL)a3
{
  if (self->_opened)
  {
    uint64_t v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"APSTCPStream.m" lineNumber:182 description:@"stream is opened but expected to be closed"];
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
    [v8 handleFailureInMethod:a2 object:self file:@"APSTCPStream.m" lineNumber:187 description:@"stream is opened but expected to be closed"];

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
    [v8 handleFailureInMethod:a2 object:self file:@"APSTCPStream.m" lineNumber:196 description:@"stream is opened but expected to be closed"];

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
  return 0;
}

- (int64_t)allowedInterfaceConstraint
{
  return 0;
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
    [v12 handleFailureInMethod:a2 object:self file:@"APSTCPStream.m" lineNumber:255 description:@"stream is opened but expected to be closed"];
  }
  self->_opened = 1;
  self->_hasSentPresence = 0;
  self->_generation = arc4random();
  if ([(APSEnvironment *)self->_environment debugHostname])
  {
    uint64_t v7 = [(APSEnvironment *)self->_environment hostname];
    serverHostname = self->_serverHostname;
    self->_serverHostname = v7;

    [(APSTCPStream *)self _connectToServerWithPeerName:self->_serverHostname];
  }
  else
  {
    BOOL v9 = !self->_forceWWANInterface;
    __int16 v10 = [(APSTCPStream *)self configurationClass];
    CFStringRef v11 = self->_environment;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10005A954;
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
    [(APSTCPStream *)v7 _connectToServerWithCount:v8];
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
    CFStringRef v13 = [(APSTCPStream *)self _domain];
    *(_DWORD *)buf = 138412546;
    v22 = self;
    __int16 v23 = 2112;
    v24 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ performing DNS lookup for %@", buf, 0x16u);
  }
  id v14 = [(APSTCPStream *)self _domain];
  uint64_t Record = DNSServiceQueryRecord(&self->_serviceQuery, 0, v11, (const char *)[v14 UTF8String], 0x10u, 1u, (DNSServiceQueryRecordReply)sub_10005B0DC, self);

  if (Record)
  {
    __int16 v16 = +[APSLog stream];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = self;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ DNS query failed!", buf, 0xCu);
    }

    [(APSTCPStream *)self close];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v20 = Record;
    __int16 v18 = APSError();
    objc_msgSend(WeakRetained, "tcpStream:errorOccured:", self, v18, v20);
  }
  else if (DNSServiceSetDispatchQueue(self->_serviceQuery, (dispatch_queue_t)&_dispatch_main_q))
  {
    v19 = +[NSAssertionHandler currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"APSTCPStream.m" lineNumber:339 description:@"DNSServiceSetDispatchQueue failed"];
  }
}

- (void)_queryRecordReply:(const void *)a3 length:(unsigned __int16)a4 ttl:(unsigned int)a5 errorCode:(int)a6
{
  if (a3 && (unsigned int v7 = a4) != 0)
  {
    uint64_t v8 = *(void *)&a5;
    [(APSTCPStream *)self _closeQuery];
    uint8_t valueLen = 0;
    ValuePtr = TXTRecordGetValuePtr(v7, a3, "count", &valueLen);
    uint32_t v11 = malloc_type_malloc(valueLen + 1, 0x1CD0A7A2uLL);
    memcpy(v11, ValuePtr, valueLen);
    *((unsigned char *)v11 + valueLen) = 0;
    uint64_t v12 = strtol((const char *)v11, 0, 0);
    free(v11);
    if (v12)
    {
      CFStringRef v13 = objc_opt_class();
      id v14 = [(APSEnvironment *)self->_environment domain];
      [v13 setCachedServerCount:v12 forDomain:v14 ttl:v8];

      [(APSTCPStream *)self _connectToServerWithCount:v12];
    }
    else
    {
      [(APSTCPStream *)self close];
      v17 = +[NSData dataWithBytes:a3 length:v7];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v19 = APSError();
      objc_msgSend(WeakRetained, "tcpStream:errorOccured:", self, v19, v17);
    }
  }
  else
  {
    [(APSTCPStream *)self close];
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
      int v11 = 138412802;
      uint64_t v12 = self;
      __int16 v13 = 2112;
      id v14 = environment;
      __int16 v15 = 2112;
      __int16 v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Closing %@ with environment %@[%@]", (uint8_t *)&v11, 0x20u);
    }
    [(APSTCPStream *)self _closeQuery];
    readStream = self->_readStream;
    if (readStream && self->_writeStream)
    {
      [(NSInputStream *)readStream setDelegate:0];
      [(NSOutputStream *)self->_writeStream setDelegate:0];
      [(NSInputStream *)self->_readStream close];
      [(NSOutputStream *)self->_writeStream close];
      streamTask = self->_streamTask;
      self->_streamTask = 0;

      urlSession = self->_urlSession;
      self->_urlSession = 0;

      BOOL v9 = self->_readStream;
      self->_readStream = 0;

      writeStream = self->_writeStream;
      self->_writeStream = 0;
    }
    else
    {
      [(NSURLSessionStreamTask *)self->_streamTask cancel];
    }
    self->_opened = 0;
    self->_generation = 0;
  }
}

- (void)_connectToServerWithPeerName:(id)a3
{
  unsigned __int8 v4 = (__CFString *)a3;
  id v5 = v4;
  if (*(_OWORD *)&self->_readStream != 0)
  {
    id v6 = +[APSLog stream];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_1000C9738((uint64_t)self, v6);
    }
    goto LABEL_4;
  }
  unsigned int v7 = (NSString *)[(__CFString *)v4 copy];
  peerName = self->_peerName;
  self->_peerName = v7;

  unint64_t v9 = [(APSEnvironment *)self->_environment port];
  if (self->_useAlternatePort) {
    unint64_t v9 = [(APSEnvironment *)self->_environment alternatePort];
  }
  unint64_t v10 = v9;
  int v11 = +[APSLog stream];
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
    v48 = self;
    __int16 v49 = 2112;
    CFStringRef v50 = v5;
    __int16 v51 = 2048;
    unint64_t v52 = v10;
    __int16 v53 = 2112;
    CFStringRef v54 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ _connectToServerWithPeerName: %@ and port: %lu forceWWANInterface? %@", buf, 0x2Au);
  }

  if (self->_opened)
  {
    unint64_t v46 = v10;
    id v6 = sub_10007E420(APSDemoHostsKey, 1);
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = [(APSEnvironment *)self->_environment name];
        __int16 v15 = [v6 objectForKey:v14];

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
              v48 = self;
              __int16 v49 = 2112;
              CFStringRef v50 = (const __CFString *)v21;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@ Overriding server hostname/IP to %@", buf, 0x16u);
            }
          }
        }
      }
    }
    v22 = +[NSMutableDictionary dictionary];
    __int16 v23 = +[NSURLSessionConfiguration defaultSessionConfiguration];
    objc_msgSend(v23, "set_tlsTrustPinningPolicyName:", kSecPolicyNameApplePushService);
    [v23 setAllowsCellularAccess:1];
    [v23 setNetworkServiceType:6];
    if ([(APSEnvironment *)self->_environment isCertificateValidated])
    {
      v24 = v5;
    }
    else
    {
      v24 = +[NSNull null];
    }
    v25 = v24;
    id v26 = objc_alloc((Class)NSMutableDictionary);
    v27 = +[NSNumber numberWithBool:[(APSEnvironment *)self->_environment isCertificateValidated]];
    v45 = v25;
    id v28 = objc_msgSend(v26, "initWithObjectsAndKeys:", v25, kCFStreamSSLPeerName, v27, kCFStreamSSLValidatesCertificateChain, 0);

    [v22 setObject:v28 forKey:kCFStreamPropertySSLSettings];
    [v22 setObject:&off_100137A20 forKey:_kCFStreamPropertyNPNProtocolsAvailable];
    if (self->_forceWWANInterface
      && (+[PCPersistentInterfaceManager sharedInstance],
          v29 = objc_claimAutoreleasedReturnValue(),
          unsigned int v30 = [v29 allowBindingToWWAN],
          v29,
          v30))
    {
      v31 = +[APSLog stream];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v48 = self;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%@: binding stream to WWAN interface", buf, 0xCu);
      }

      v32 = &kCFStreamPropertyDataConnectionServiceType;
      v33 = (const CFBooleanRef *)&kCTDataConnectionServiceTypeInternet;
    }
    else
    {
      v34 = +[APSLog stream];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v48 = self;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%@: binding stream to non cellular interface", buf, 0xCu);
      }

      [v22 setObject:kCFBooleanTrue forKey:kCFStreamPropertyNoCellular];
      v32 = &kCFStreamPropertyDataContextOnDemand;
      v33 = &kCFBooleanFalse;
    }
    [v22 setObject:*v33 forKey:*v32];
    [v22 setObject:v28 forKey:kCFStreamPropertySSLSettings];
    [v22 setObject:&__kCFBooleanTrue forKey:_kCFStreamPropertyEnableConnectionStatistics];
    if (self->_remainsConnectedWhenWWANSuspends)
    {
      if (!self->_forceWWANInterface)
      {
LABEL_39:
        if (!self->_nagleEnabled)
        {
          [v22 setObject:&__kCFBooleanTrue forKey:_kCFStreamSocketSetNoDelay];
          v35 = +[APSLog stream];
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            CFStringRef v36 = @"NO";
            if (!self->_nagleEnabled) {
              CFStringRef v36 = @"YES";
            }
            *(_DWORD *)buf = 138412546;
            v48 = self;
            __int16 v49 = 2112;
            CFStringRef v50 = v36;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%@ Set _kCFStreamSocketSetNoDelay = %@", buf, 0x16u);
          }
        }
        [v22 setObject:kCFBooleanTrue forKey:_kCFStreamPropertyNoCompanion];
        [v22 setObject:&__kCFBooleanTrue forKey:@"_kCFStreamPropertyPrefersNoProxy"];
        objc_msgSend(v23, "set_socketStreamProperties:", v22);
        [v23 setTLSMinimumSupportedProtocolVersion:772];
        uint64_t v38 = +[NSOperationQueue mainQueue];
        v39 = +[NSURLSession sessionWithConfiguration:v23 delegate:self delegateQueue:v38];
        urlSession = self->_urlSession;
        self->_urlSession = v39;

        v41 = [(NSURLSession *)self->_urlSession streamTaskWithHostName:self->_serverHostname port:v46];
        streamTask = self->_streamTask;
        self->_streamTask = v41;

        [(NSURLSessionStreamTask *)self->_streamTask startSecureConnection];
        [(NSURLSessionStreamTask *)self->_streamTask resume];
        [(NSURLSessionStreamTask *)self->_streamTask captureStreams];
        [(NSURLSession *)self->_urlSession finishTasksAndInvalidate];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        LOBYTE(v38) = objc_opt_respondsToSelector();

        if (v38)
        {
          id v44 = objc_loadWeakRetained((id *)&self->_delegate);
          [v44 tcpStream:self hasDeterminedServerHostname:self->_serverHostname];
        }

        goto LABEL_4;
      }
      [v22 setObject:&__kCFBooleanFalse forKey:@"kCFStreamPropertyAutoErrorOnSystemChange"];
    }
    if (self->_forceWWANInterface) {
      [v22 setObject:&off_100137608 forKey:_kCFStreamPropertyLocalAddressPreference];
    }
    goto LABEL_39;
  }
  id v6 = +[APSLog stream];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_1000C96D0();
  }
LABEL_4:
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
    uint64_t v8 = [(APSTCPStream *)self _domain];
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
    int v11 = +[APSLog stream];
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
  [(APSTCPStream *)self _connectToServerWithPeerName:v6];
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
      uint64_t v8 = (NSString *)[v4 serverCount];
      unint64_t v9 = [v4 hostname];
      *(_DWORD *)buf = 138412802;
      id v26 = self;
      __int16 v27 = 2048;
      id v28 = v8;
      __int16 v29 = 2112;
      unsigned int v30 = v9;
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
      id v26 = self;
      __int16 v27 = 2112;
      id v28 = v16;
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
      id v26 = self;
      __int16 v27 = 2112;
      id v28 = redirectHostname;
      __int16 v29 = 2112;
      unsigned int v30 = v20;
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
      id v26 = self;
      __int16 v27 = 2112;
      id v28 = cachedIPAddress;
      __int16 v29 = 2112;
      unsigned int v30 = v23;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@ courier last cached ip address is defined, using hostname %@ and peername %@", buf, 0x20u);
    }
    objc_storeStrong((id *)&self->_serverHostname, self->_cachedIPAddress);
  }
  v24 = [v4 hostname];
  [(APSTCPStream *)self _connectToServerWithPeerName:v24];
}

- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4
{
  writeStream = self->_writeStream;
  if (!writeStream) {
    return 0;
  }
  if (!self->_hasCompletedTLSHandshake)
  {
    -[APSTCPStream stream:handleEvent:](self, "stream:handleEvent:");
    writeStream = self->_writeStream;
    if (!writeStream) {
      return 0;
    }
  }
  if (self->_sendData) {
    return 0;
  }
  return [(NSOutputStream *)writeStream write:a3 maxLength:a4];
}

- (void)writeDataInBackground:(id)a3
{
  id v4 = a3;
  if (self->_isSuspended)
  {
    unsigned int v5 = +[APSLog stream];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      unint64_t v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ asked to write data on suspended stream", (uint8_t *)&v10, 0xCu);
    }
  }
  sendData = self->_sendData;
  if (!sendData)
  {
    BOOL v7 = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
    uint64_t v8 = self->_sendData;
    self->_sendData = v7;

    sendData = self->_sendData;
  }
  [(NSMutableData *)sendData appendData:v4];
  writeStream = self->_writeStream;
  if (writeStream && [(NSOutputStream *)writeStream hasSpaceAvailable]) {
    [(APSTCPStream *)self _hasSpaceAvailable];
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
      unint64_t v11 = +[APSLog stream];
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

- (void)configureWhetherPeerIsTrustedFor:(__SecTrust *)a3
{
  if (a3)
  {
    *(_WORD *)&self->_hasCompletedTLSHandshake = 1;
    if (os_variant_allows_internal_security_policies()
      && ![(APSEnvironment *)self->_environment isCertificateValidated])
    {
      __int16 v16 = +[APSLog stream];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        peerName = self->_peerName;
        int v18 = 138412290;
        __int16 v19 = peerName;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Not performing validation for %@", (uint8_t *)&v18, 0xCu);
      }

      self->_peerCertificateIsAuthorized = 1;
    }
    else
    {
      if (![(APSEnvironment *)self->_environment isCertificateValidated])
      {
        unsigned int v5 = +[APSLog stream];
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
          sub_1000C99FC((id *)&self->_environment, v5);
        }
      }
      p_peerName = (uint64_t *)&self->_peerName;
      uint64_t ApplePushService = SecPolicyCreateApplePushService();
      if (ApplePushService)
      {
        BOOL v8 = (const void *)ApplePushService;
        self->_peerCertificateIsAuthorized = [(APSTCPStream *)self isTrust:*a3 validWithPolicy:ApplePushService forPeer:self->_peerName];
        CFRelease(v8);
        if (self->_peerCertificateIsAuthorized) {
          return;
        }
        unint64_t v9 = +[APSLog stream];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1000C998C((uint64_t)p_peerName, v9, v10, v11, v12, v13, v14, v15);
        }
      }
      else
      {
        unint64_t v9 = +[APSLog stream];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
          sub_1000C9910(p_peerName, v9);
        }
      }
    }
  }
  else
  {
    *(_WORD *)&self->_hasCompletedTLSHandshake = 0;
  }
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6 = (NSInputStream *)a3;
  id v7 = v6;
  if (self->_opened)
  {
    switch(a4)
    {
      case 1uLL:
        if (self->_readStream == v6)
        {
          BOOL v8 = [(NSInputStream *)v6 propertyForKey:@"kCFStreamPropertyInterfaceIdentifier"];
          interfaceName = self->_interfaceName;
          self->_interfaceName = v8;

          if (!self->_interfaceName)
          {
            uint64_t v10 = +[APSLog stream];
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
              sub_1000C9AFC();
            }
          }
          if (!self->_serverIPAddress)
          {
            uint64_t v11 = [(APSTCPStream *)self _copyServerIPAddressString];
            serverIPAddress = self->_serverIPAddress;
            self->_serverIPAddress = v11;

            uint64_t v13 = [(NSURLSessionStreamTask *)self->_streamTask _incompleteCurrentTaskTransactionMetrics];
            uint64_t v14 = [v13 remotePort];
            self->_serverPort = (unsigned __int16)[v14 unsignedIntValue];

            uint64_t v15 = [(APSTCPStream *)self _copyLocalSockAddr];
            if (v15) {
              unsigned __int8 sa_family = v15->sa_family;
            }
            else {
              unsigned __int8 sa_family = 30;
            }
            self->_ipAddressFamily = sa_family;
            free(v15);
          }
        }
        goto LABEL_20;
      case 2uLL:
        [(APSTCPStream *)self _hasBytesAvailable];
        goto LABEL_20;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        goto LABEL_20;
      case 4uLL:
        if (self->_hasSentPresence) {
          goto LABEL_17;
        }
        if (!self->_hasCompletedTLSHandshake) {
          goto LABEL_17;
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        char v20 = objc_opt_respondsToSelector();

        if ((v20 & 1) == 0) {
          goto LABEL_17;
        }
        v21 = [(NSInputStream *)v7 propertyForKey:@"_kCFStreamPropertyNPNSelectedProtocol"];
        v22 = +[APSLog stream];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v44 = self;
          __int16 v45 = 2112;
          CFStringRef v46 = v21;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@ npnSelectedProtocols: %@", buf, 0x16u);
        }

        unsigned int v42 = [(__CFString *)v21 hasPrefix:@"apns-pack-v1"];
        v39 = v21;
        if (v42)
        {
          __int16 v23 = [(NSInputStream *)v7 propertyForKey:@"_kCFStreamPropertyNPNSelectedProtocol"];
          v24 = [v23 componentsSeparatedByString:@":"];

          v25 = +[APSLog stream];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v44 = v24;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "NPN Selected protocol components: %@", buf, 0xCu);
          }

          if ([(APSTCPStream *)v24 count] == (id)3)
          {
            id v26 = [(APSTCPStream *)v24 objectAtIndexedSubscript:1];
            id v41 = [v26 integerValue];

            __int16 v27 = [(APSTCPStream *)v24 objectAtIndexedSubscript:2];
            id v40 = [v27 integerValue];
          }
          else
          {
            id v40 = 0;
            id v41 = 0;
          }
        }
        else
        {
          id v40 = 0;
          id v41 = 0;
        }
        self->_hasSentPresence = 1;
        id v28 = [(NSInputStream *)v7 propertyForKey:@"_kCFStreamPropertyConnectionStatistics"];
        __int16 v29 = [(APSTCPStream *)v28 objectForKey:@"_kCFStreamStatsConnectionEstablishmentTimeMs"];
        unsigned int v30 = [(APSTCPStream *)v28 objectForKey:@"_kCFStreamStatsDNS_ResolutionTimeMs"];
        v31 = [(APSTCPStream *)v28 objectForKey:@"_kCFStreamStatsTLS_HandshakeTimeMs"];
        v32 = +[NSDictionary dictionaryWithObjectsAndKeys:v30, @"dns", v31, @"tls", v29, @"tcp_handshake", 0];
        v33 = [(NSInputStream *)v7 propertyForKey:_kCFStreamPropertySSLClientCertificateState];
        id v34 = [v33 isEqualToNumber:&off_100137620];

        v35 = +[APSLog stream];
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v36 = @"NO";
          if (v34) {
            CFStringRef v36 = @"YES";
          }
          *(_DWORD *)buf = 138412546;
          id v44 = v28;
          __int16 v45 = 2112;
          CFStringRef v46 = v36;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "connectionStatistics: %@ secureHandshakeEnabled %@", buf, 0x16u);
        }

        CFRetain(self);
        id v37 = objc_loadWeakRetained((id *)&self->_delegate);
        [v37 tcpStreamHasConnected:self context:v32 enabledPackedFormat:v42 maxEncoderTableSize:v41 maxDecoderTableSize:v40 secureHandshakeEnabled:v34];

        LODWORD(v37) = self->_opened;
        CFRelease(self);
        if (v37)
        {

LABEL_17:
          [(APSTCPStream *)self _hasSpaceAvailable];
        }
        else
        {
          uint64_t v38 = +[APSLog stream];
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            id v44 = self;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "<APSTCPStream: %p> TCPStream closed in call to tcpStreamHasConnected: -- returning", buf, 0xCu);
          }
        }
        goto LABEL_20;
      case 8uLL:
        __int16 v17 = objc_loadWeakRetained((id *)&self->_delegate);
        int v18 = [(NSInputStream *)v7 streamError];
        [v17 tcpStream:self errorOccured:v18];

        goto LABEL_19;
      default:
        if (a4 != 16) {
          goto LABEL_20;
        }
        [(APSTCPStream *)self close];
        __int16 v17 = objc_loadWeakRetained((id *)&self->_delegate);
        [v17 tcpStreamEndEncountered:self withReason:21];
        goto LABEL_19;
    }
  }
  __int16 v17 = +[APSLog stream];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_1000C9A94();
  }
LABEL_19:

LABEL_20:
}

- (BOOL)hasErrorStatus
{
  return [(NSInputStream *)self->_readStream streamStatus] == (id)7;
}

- (id)_copyServerIPAddressString
{
  v2 = [(NSURLSessionStreamTask *)self->_streamTask _incompleteCurrentTaskTransactionMetrics];
  BOOL v3 = [v2 remoteAddress];

  return v3;
}

- (sockaddr)_copyLocalSockAddr
{
  BOOL v3 = [(NSURLSessionStreamTask *)self->_streamTask _incompleteCurrentTaskTransactionMetrics];
  id v4 = [v3 localAddress];
  unsigned int v5 = (char *)[v4 UTF8String];

  id v6 = [v3 localPort];
  unsigned int v7 = [v6 unsignedShortValue];

  BOOL v8 = +[APSLog stream];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412802;
    uint64_t v12 = self;
    __int16 v13 = 2080;
    uint64_t v14 = v5;
    __int16 v15 = 1024;
    unsigned int v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ Copying local sockaddr {address: %s, port: %d}", (uint8_t *)&v11, 0x1Cu);
  }

  unint64_t v9 = 0;
  if (v5 && v7) {
    unint64_t v9 = (sockaddr *)sub_10005CE1C(v5);
  }

  return v9;
}

- (sockaddr)_copyRemoteSockAddr
{
  BOOL v3 = [(NSURLSessionStreamTask *)self->_streamTask _incompleteCurrentTaskTransactionMetrics];
  id v4 = [v3 remoteAddress];
  unsigned int v5 = (char *)[v4 UTF8String];

  id v6 = [v3 remotePort];
  unsigned int v7 = [v6 unsignedShortValue];

  BOOL v8 = +[APSLog stream];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412802;
    uint64_t v12 = self;
    __int16 v13 = 2080;
    uint64_t v14 = v5;
    __int16 v15 = 1024;
    unsigned int v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ Copying remote sockaddr {address: %s, port: %d}", (uint8_t *)&v11, 0x1Cu);
  }

  unint64_t v9 = 0;
  if (v5 && v7) {
    unint64_t v9 = (sockaddr *)sub_10005CE1C(v5);
  }

  return v9;
}

- (void)URLSession:(id)a3 streamTask:(id)a4 didBecomeInputStream:(id)a5 outputStream:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  __int16 v15 = v14;
  if (!v13 || !v14)
  {
    unsigned int v30 = +[NSAssertionHandler currentHandler];
    [v30 handleFailureInMethod:a2, self, @"APSTCPStream.m", 862, @" %s: %@ received nil streams, readStream %@ writeStream %@", "-[APSTCPStream URLSession:streamTask:didBecomeInputStream:outputStream:]", self, self->_readStream, self->_writeStream object file lineNumber description];
  }
  unsigned int v16 = [v13 streamError];
  if (v16 || ([v15 streamError], (unsigned int v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    __int16 v17 = +[APSLog stream];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000C9BEC();
    }

    [v13 close];
    [v15 close];
    [(APSTCPStream *)self close];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v19 = objc_opt_respondsToSelector();

    if (v19)
    {
      id v20 = objc_loadWeakRetained((id *)&self->_delegate);
      [v20 tcpStream:self errorOccured:v16];
    }
  }
  else
  {
    if (self->_opened)
    {
      p_readStream = (id *)&self->_readStream;
      objc_storeStrong((id *)&self->_readStream, a5);
      p_writeStream = (id *)&self->_writeStream;
      objc_storeStrong((id *)&self->_writeStream, a6);
      clientContext.version = 0;
      clientContext.info = self;
      clientContext.retain = (void *(__cdecl *)(void *))&_CFRetain;
      clientContext.release = (void (__cdecl *)(void *))&_CFRelease;
      clientContext.copyDescription = (CFStringRef (__cdecl *)(void *))&CFCopyDescription;
      CFReadStreamSetClient((CFReadStreamRef)self->_readStream, 0x1BuLL, (CFReadStreamClientCallBack)sub_10005D368, &clientContext);
      [(NSOutputStream *)self->_writeStream setDelegate:self];
      __int16 v23 = +[APSLog stream];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Opening streams", buf, 2u);
      }

      v24 = (__CFReadStream *)*p_readStream;
      Main = CFRunLoopGetMain();
      CFReadStreamScheduleWithRunLoop(v24, Main, kCFRunLoopDefaultMode);
      id v26 = (__CFWriteStream *)*p_writeStream;
      __int16 v27 = CFRunLoopGetMain();
      CFWriteStreamScheduleWithRunLoop(v26, v27, kCFRunLoopDefaultMode);
      [*p_readStream open];
      [*p_writeStream open];
    }
    else
    {
      streamTask = self->_streamTask;
      self->_streamTask = 0;

      urlSession = self->_urlSession;
      self->_urlSession = 0;
    }
    unsigned int v16 = 0;
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v8 = a5;
  unint64_t v9 = (void (**)(id, void, void *))a6;
  uint64_t v10 = [v8 protectionSpace];
  id v11 = [v10 authenticationMethod];
  unsigned int v12 = [v11 isEqualToString:NSURLAuthenticationMethodServerTrust];

  if (v12)
  {
    id v13 = [v8 protectionSpace];
    id v14 = [v13 host];

    __int16 v15 = +[APSLog stream];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      peerName = self->_peerName;
      *(_DWORD *)buf = 138412802;
      id v26 = self;
      __int16 v27 = 2112;
      *(void *)id v28 = v14;
      *(_WORD *)&v28[8] = 2112;
      __int16 v29 = peerName;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ sslHostname: %@ peerName: %@", buf, 0x20u);
    }

    __int16 v17 = [v8 protectionSpace];
    id v18 = [v17 serverTrust];

    id v24 = v18;
    [(APSTCPStream *)self configureWhetherPeerIsTrustedFor:&v24];
    char v19 = +[APSLog stream];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      BOOL hasCompletedTLSHandshake = self->_hasCompletedTLSHandshake;
      BOOL peerCertificateIsAuthorized = self->_peerCertificateIsAuthorized;
      *(_DWORD *)buf = 138412802;
      id v26 = self;
      __int16 v27 = 1024;
      *(_DWORD *)id v28 = hasCompletedTLSHandshake;
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)&v28[6] = peerCertificateIsAuthorized;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@ didReceiveChallenge: _hasCompletedTLSHandshake: %d _peerCertificateIsAuthorized : %d", buf, 0x18u);
    }

    if (self->_hasCompletedTLSHandshake && self->_peerCertificateIsAuthorized)
    {
      v22 = [v8 protectionSpace];
      __int16 v23 = +[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", [v22 serverTrust]);
      v9[2](v9, 0, v23);
    }
    else
    {
      v9[2](v9, 2, 0);
    }
  }
  else
  {
    v9[2](v9, 1, 0);
  }
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_opened)
  {
    if (v7)
    {
      unint64_t v9 = +[APSLog stream];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000C9CBC();
      }

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v11 = objc_opt_respondsToSelector();

      if (v11)
      {
        id v12 = objc_loadWeakRetained((id *)&self->_delegate);
        [v12 tcpStream:self errorOccured:v8];
      }
      [(APSTCPStream *)self close];
    }
  }
  else
  {
    streamTask = self->_streamTask;
    self->_streamTask = 0;

    urlSession = self->_urlSession;
    self->_urlSession = 0;

    if (v8)
    {
      __int16 v15 = +[APSLog stream];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000C9C54();
      }
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = v10;
  if (self->_opened)
  {
    if (v10)
    {
      id v12 = +[APSLog stream];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000C9D8C();
      }

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v14 = objc_opt_respondsToSelector();

      if (v14)
      {
        id v15 = objc_loadWeakRetained((id *)&self->_delegate);
        [v15 tcpStream:self errorOccured:v11];
      }
      [(APSTCPStream *)self close];
    }
  }
  else
  {
    streamTask = self->_streamTask;
    self->_streamTask = 0;

    urlSession = self->_urlSession;
    self->_urlSession = 0;

    if (v11)
    {
      id v18 = +[APSLog stream];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1000C9D24();
      }
    }
  }
}

- (void)_hasBytesAvailable
{
  vm_size_t v3 = 4 * vm_page_size;
  receiveData = self->_receiveData;
  if (!receiveData)
  {
    unsigned int v5 = (NSMutableData *)[objc_alloc((Class)NSMutableData) initWithCapacity:v3];
    id v6 = self->_receiveData;
    self->_receiveData = v5;

    receiveData = self->_receiveData;
  }
  id v7 = [(NSMutableData *)receiveData length];
  [(NSMutableData *)self->_receiveData increaseLengthBy:v3];
  uint64_t v8 = [(NSInputStream *)self->_readStream read:&v7[(void)[(NSMutableData *)self->_receiveData mutableBytes]] maxLength:v3];
  id v9 = &v7[v8 & ~(v8 >> 63)];
  [(NSMutableData *)self->_receiveData setLength:v9];
  unsigned int v16 = self;
  if (v9
    && ([(NSInputStream *)self->_readStream propertyForKey:@"_kCFStreamPropertyWakeReadEvent"],
        id v10 = objc_claimAutoreleasedReturnValue(),
        id v11 = [v10 BOOLValue],
        v10,
        id WeakRetained = objc_loadWeakRetained((id *)&v16->_delegate),
        id v13 = (char *)[WeakRetained tcpStream:v16 dataReceived:self->_receiveData isWakingMessage:v11], WeakRetained, v13 != v9))
  {
    if (v13)
    {
      if (v13 >= v9) {
        id v15 = v9;
      }
      else {
        id v15 = v13;
      }
      -[NSMutableData replaceBytesInRange:withBytes:length:](self->_receiveData, "replaceBytesInRange:withBytes:length:", 0, v15, 0, 0);
    }
  }
  else
  {
    char v14 = self->_receiveData;
    self->_receiveData = 0;
  }
}

- (void)_hasSpaceAvailable
{
  if (self->_writeStream && !self->_hasCompletedTLSHandshake) {
    -[APSTCPStream stream:handleEvent:](self, "stream:handleEvent:");
  }
  sendData = self->_sendData;
  if (sendData)
  {
    uint64_t v4 = [(NSOutputStream *)self->_writeStream write:[(NSMutableData *)sendData bytes] maxLength:[(NSMutableData *)self->_sendData length]];
    unint64_t v5 = v4 & ~(v4 >> 63);
    NSUInteger v6 = [(NSMutableData *)self->_sendData length];
    id v7 = self->_sendData;
    if (v6 <= v5)
    {
      self->_sendData = 0;
    }
    else
    {
      -[NSMutableData replaceBytesInRange:withBytes:length:](v7, "replaceBytesInRange:withBytes:length:", 0, v5, 0, 0);
    }
  }
}

- (id)_getTCPInfoData
{
  readStream = self->_readStream;
  if (readStream)
  {
    uint64_t v4 = [(NSInputStream *)readStream propertyForKey:_kCFStreamPropertyTCPInfo];
    if ([v4 count])
    {
      uint64_t v8 = 0;
      id v9 = &v8;
      uint64_t v10 = 0x3032000000;
      id v11 = sub_10005DC04;
      id v12 = sub_10005DC14;
      id v13 = 0;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10005DC1C;
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
  v2 = [(APSTCPStream *)self _getTCPInfoData];
  if ([v2 length] == (id)408)
  {
    vm_size_t v3 = (unsigned __int8 *)[v2 bytes];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @" %u %x %u %u %x %u %u %u %u %u %u %u %u %u %u %u %u %d %u %llu %llu %llu %llu %llu %llu", *v3, v3[1], v3[2], v3[3], *((unsigned int *)v3 + 1), *((unsigned int *)v3 + 2), *((unsigned int *)v3 + 3), *((unsigned int *)v3 + 4), *((unsigned int *)v3 + 5), *((unsigned int *)v3 + 6), *((unsigned int *)v3 + 7), *((unsigned int *)v3 + 9), *((unsigned int *)v3 + 10), *((unsigned int *)v3 + 11), *((unsigned int *)v3 + 12), *((unsigned int *)v3 + 13),
      *((unsigned int *)v3 + 14),
      *((unsigned int *)v3 + 15),
      *((unsigned int *)v3 + 16),
      *(_OWORD *)(v3 + 76),
      *(void *)(v3 + 92),
      *(void *)(v3 + 108),
      *(void *)(v3 + 116),
    uint64_t v4 = *(void *)(v3 + 132));
  }
  else
  {
    id v5 = +[APSLog stream];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000C9DF4(v5);
    }

    uint64_t v4 = 0;
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
  if (self->_serverHostname)
  {
    vm_size_t v3 = [(APSTCPStream *)self taskTransactionMetrics];
    serverHostname = self->_serverHostname;
    id v5 = [v3 localAddress];
    NSUInteger v6 = [v3 localPort];
    id v7 = [v3 remoteAddress];
    uint64_t v8 = [v3 remotePort];
    id v9 = +[NSString stringWithFormat:@"\"%@\" ([%@]:%@, [%@]:%@)", serverHostname, v5, v6, v7, v8];
  }
  else
  {
    id v9 = 0;
  }
  return (NSString *)v9;
}

- (id)taskTransactionMetrics
{
  return [(NSURLSessionStreamTask *)self->_streamTask _incompleteCurrentTaskTransactionMetrics];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamTask, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_cachedIPAddress, 0);
  objc_storeStrong((id *)&self->_redirectHostname, 0);
  objc_storeStrong((id *)&self->_serverIPAddress, 0);
  objc_storeStrong((id *)&self->_serverHostname, 0);
  objc_storeStrong((id *)&self->_peerName, 0);
  objc_storeStrong((id *)&self->_sendData, 0);
  objc_storeStrong((id *)&self->_receiveData, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_writeStream, 0);
  objc_storeStrong((id *)&self->_readStream, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

@end