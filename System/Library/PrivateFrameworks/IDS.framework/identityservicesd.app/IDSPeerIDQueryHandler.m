@interface IDSPeerIDQueryHandler
+ (BOOL)isQueryRetryForBadSignatureEnabled;
+ (BOOL)isServerBackoffModeActive;
+ (BOOL)shouldUseSelfTokens;
+ (double)queryRetryIntervalForBadSignature;
+ (int)queryRetryNumberForBadSignature;
+ (int)serverBackoffModeMaxSenderRetries;
+ (int)serverBackoffModeReceiverRetryInterval;
- (BOOL)_addCompletionBlock:(id)a3 forURIs:(id)a4 fromURI:(id)a5 fromService:(id)a6 context:(id)a7 queryIdentifier:(id)a8;
- (BOOL)isInServerBackoffMode;
- (BOOL)startQueryForURIs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 context:(id)a7 reason:(id)a8 completionBlock:(id)a9;
- (FTMessageDelivery_DualMode)dualInterfaceidQueryMessageDelivery;
- (IDSPeerIDNetworkChangeNotifier)networkChangeNotifier;
- (IDSPeerIDPushHandler)pushHandler;
- (IDSPeerIDQueryHandler)initWithDelegate:(id)a3 dataSource:(id)a4;
- (IDSPeerIDQueryHandler)initWithDelegate:(id)a3 dataSource:(id)a4 dualMessageDelivery:(id)a5 networkChangeNotifier:(id)a6 pushHandler:(id)a7;
- (IDSPeerIDQueryHandlerDataSource)dataSource;
- (IDSPeerIDQueryHandlerDelegate)delegate;
- (NSMutableArray)queryQueue;
- (NSMutableDictionary)completionBlocksToURIsMap;
- (NSMutableDictionary)disasterModeTokens;
- (NSMutableDictionary)extraCompletionBlocks;
- (id)_completionBlocksForURIs:(id)a3 fromURI:(id)a4 fromService:(id)a5 forRefresh:(BOOL)a6;
- (void)_bagLoaded:(id)a3;
- (void)_dequeuePendingQueryIfPossible;
- (void)_removeCompletionBlocksForURIs:(id)a3 fromURI:(id)a4 fromService:(id)a5 forRefresh:(BOOL)a6;
- (void)_startQueryForURIs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 context:(id)a7 queryIdentifier:(id)a8 reason:(id)a9 completionBlock:(id)a10;
- (void)addCompletionBlock:(id)a3 forToken:(id)a4;
- (void)dealloc;
- (void)removeCompletionBlockForToken:(id)a3;
- (void)setCompletionBlocksToURIsMap:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisasterModeTokens:(id)a3;
- (void)setDualInterfaceidQueryMessageDelivery:(id)a3;
- (void)setExtraCompletionBlocks:(id)a3;
- (void)setIsInServerBackoffMode:(BOOL)a3;
- (void)setNetworkChangeNotifier:(id)a3;
- (void)setPushHandler:(id)a3;
- (void)setQueryQueue:(id)a3;
@end

@implementation IDSPeerIDQueryHandler

+ (BOOL)shouldUseSelfTokens
{
  if (IMGetDomainBoolForKey())
  {
    _IMWarn();
    return 1;
  }
  else
  {
    v3 = +[IDSServerBag sharedInstanceForBagType:0];
    v4 = [v3 objectForKey:@"vc-disaster-sender-self-tokens"];
    BOOL v2 = (int)[v4 intValue] > 0;
  }
  return v2;
}

+ (BOOL)isServerBackoffModeActive
{
  if (IMGetDomainBoolForKey())
  {
    _IMWarn();
    return 1;
  }
  else
  {
    v3 = +[IDSServerBag sharedInstanceForBagType:0];
    unsigned __int8 v4 = [v3 isInDebilitatedMode];

    return v4;
  }
}

+ (int)serverBackoffModeMaxSenderRetries
{
  BOOL v2 = +[IDSServerBag sharedInstanceForBagType:0];
  v3 = [v2 objectForKey:@"vc-disaster-sender-max-retries"];

  if (v3)
  {
    int v4 = [v3 intValue];
    if ((v4 & ~(v4 >> 31)) >= 0xF) {
      int v5 = 15;
    }
    else {
      int v5 = v4 & ~(v4 >> 31);
    }
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

+ (int)serverBackoffModeReceiverRetryInterval
{
  BOOL v2 = +[IDSServerBag sharedInstanceForBagType:0];
  v3 = [v2 objectForKey:@"vc-disaster-receiver-retry-interval"];

  if (v3)
  {
    int v4 = [v3 intValue];
    if ((v4 & ~(v4 >> 31)) >= 0x708) {
      int v5 = 1800;
    }
    else {
      int v5 = v4 & ~(v4 >> 31);
    }
  }
  else
  {
    int v5 = 300;
  }

  return v5;
}

+ (BOOL)isQueryRetryForBadSignatureEnabled
{
  BOOL v2 = +[IDSServerBag sharedInstanceForBagType:0];
  v3 = [v2 objectForKey:@"id-query-bad-signature-retry-enabled"];

  if (v3) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

+ (double)queryRetryIntervalForBadSignature
{
  BOOL v2 = +[IDSServerBag sharedInstanceForBagType:0];
  v3 = [v2 objectForKey:@"id-query-bad-signature-retry-interval"];

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 5.0;
  }

  return v5;
}

+ (int)queryRetryNumberForBadSignature
{
  BOOL v2 = +[IDSServerBag sharedInstanceForBagType:0];
  v3 = [v2 objectForKey:@"id-query-bad-signature-retry-number"];

  if (v3) {
    int v4 = [v3 intValue];
  }
  else {
    int v4 = 1;
  }

  return v4;
}

- (IDSPeerIDQueryHandler)initWithDelegate:(id)a3 dataSource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)FTMessageDelivery_DualMode) initWithPreferedType:1];
  v9 = +[IDSRegistrationRequestTracker sharedInstance];
  [v8 addRequestObserver:v9];

  v10 = +[NetworkChangeNotifier sharedInstance];
  v11 = +[IDSPushHandler sharedInstanceWithPortName:@"com.apple.identityservicesd.aps"];
  v12 = [(IDSPeerIDQueryHandler *)self initWithDelegate:v7 dataSource:v6 dualMessageDelivery:v8 networkChangeNotifier:v10 pushHandler:v11];

  return v12;
}

- (IDSPeerIDQueryHandler)initWithDelegate:(id)a3 dataSource:(id)a4 dualMessageDelivery:(id)a5 networkChangeNotifier:(id)a6 pushHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)IDSPeerIDQueryHandler;
  v17 = [(IDSPeerIDQueryHandler *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_delegate, v12);
    objc_storeStrong((id *)&v18->_dataSource, a4);
    objc_storeStrong((id *)&v18->_networkChangeNotifier, a6);
    objc_storeStrong((id *)&v18->_dualInterfaceidQueryMessageDelivery, a5);
    [(FTMessageDelivery_DualMode *)v18->_dualInterfaceidQueryMessageDelivery setUserAgent:@"com.apple.madrid-lookup"];
    objc_storeStrong((id *)&v18->_pushHandler, a7);
    v18->_isInServerBackoffMode = +[IDSPeerIDQueryHandler isServerBackoffModeActive];
    v19 = +[NSNotificationCenter defaultCenter];
    [v19 addObserver:v18 selector:"_bagLoaded:" name:IDSServerBagFinishedLoadingNotification object:0];
  }
  return v18;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:0 object:0];

  [(FTMessageDelivery_DualMode *)self->_dualInterfaceidQueryMessageDelivery invalidate];
  v4.receiver = self;
  v4.super_class = (Class)IDSPeerIDQueryHandler;
  [(IDSPeerIDQueryHandler *)&v4 dealloc];
}

- (void)_bagLoaded:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[IDSPeerIDQueryHandler isServerBackoffModeActive];
  if (self->_isInServerBackoffMode != v5)
  {
    self->_isInServerBackoffMode = v5;
    id v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_isInServerBackoffMode) {
        CFStringRef v7 = @"YES";
      }
      else {
        CFStringRef v7 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Bag loaded notification! Is in backoff mode changed to %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    if (self->_isInServerBackoffMode) {
      CFStringRef v8 = @"entered";
    }
    else {
      CFStringRef v8 = @"left";
    }
    v9 = +[NSString stringWithFormat:@"iMessage server has %@ debilitated mode.", v8];
    sub_1001484DC(0, @"iMessage Debilitated Mode", v9, 1073);
  }
}

- (BOOL)_addCompletionBlock:(id)a3 forURIs:(id)a4 fromURI:(id)a5 fromService:(id)a6 context:(id)a7 queryIdentifier:(id)a8
{
  id v56 = a3;
  id v14 = a4;
  id v15 = (__CFString *)a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if ([v14 count])
  {
    id v53 = v18;
    v19 = [(__CFString *)v15 prefixedURI];
    id v20 = [v19 length];

    if (v20)
    {
      v52 = objc_msgSend(v14, "__imArrayByApplyingBlock:", &stru_10098A458);
      v54 = objc_msgSend(v52, "__imSetFromArray");
      v55 = sub_10037860C(v15, v16, [v17 forRefresh]);
      objc_super v21 = [(NSMutableDictionary *)self->_completionBlocksToURIsMap objectForKey:v55];
      v22 = [v21 objectForKey:v54];
      id v23 = [v22 count];
      BOOL v24 = v23 == 0;

      if (v56)
      {
        if (v23 || ![v17 preventNewQuery])
        {
          completionBlocksToURIsMap = self->_completionBlocksToURIsMap;
          if (!completionBlocksToURIsMap)
          {
            Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
            v28 = self->_completionBlocksToURIsMap;
            self->_completionBlocksToURIsMap = Mutable;

            completionBlocksToURIsMap = self->_completionBlocksToURIsMap;
          }
          v29 = [(NSMutableDictionary *)completionBlocksToURIsMap objectForKey:v55];
          if (!v29)
          {
            v29 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
            [(NSMutableDictionary *)self->_completionBlocksToURIsMap setObject:v29 forKey:v55];
          }
          id v30 = [v29 objectForKey:v54];
          if (!v30)
          {
            id v30 = objc_alloc_init((Class)NSMutableArray);
            [v29 setObject:v30 forKey:v54];
          }
          v31 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v32 = [v17 forRefresh];
            unsigned int v33 = [v17 preventNewQuery];
            CFStringRef v34 = @"NO";
            *(_DWORD *)buf = 138413826;
            CFStringRef v58 = v15;
            if (v32) {
              CFStringRef v35 = @"YES";
            }
            else {
              CFStringRef v35 = @"NO";
            }
            if (v33) {
              CFStringRef v36 = @"YES";
            }
            else {
              CFStringRef v36 = @"NO";
            }
            if (!v23) {
              CFStringRef v34 = @"YES";
            }
            __int16 v59 = 2112;
            id v60 = v16;
            __int16 v61 = 2112;
            CFStringRef v62 = v35;
            __int16 v63 = 2112;
            CFStringRef v64 = v36;
            __int16 v65 = 2112;
            CFStringRef v66 = v34;
            __int16 v67 = 2112;
            id v68 = v53;
            __int16 v69 = 2112;
            id v70 = v14;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Adding queued query fromURI: %@  service: %@   forRefresh: %@ preventNew: %@ first query: %@ identifier: %@ for URIs: %@", buf, 0x48u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            if ([v17 forRefresh]) {
              CFStringRef v37 = @"YES";
            }
            else {
              CFStringRef v37 = @"NO";
            }
            CFStringRef v51 = v37;
            if ([v17 preventNewQuery]) {
              CFStringRef v38 = @"YES";
            }
            else {
              CFStringRef v38 = @"NO";
            }
            if (v23) {
              CFStringRef v39 = @"NO";
            }
            else {
              CFStringRef v39 = @"YES";
            }
            id v49 = v53;
            id v50 = v14;
            CFStringRef v47 = v38;
            CFStringRef v48 = v39;
            id v45 = v16;
            CFStringRef v46 = v51;
            v44 = v15;
            _IDSLogV();
          }
          id v40 = objc_msgSend(v56, "copy", v44, v45, v46, v47, v48, v49, v50);
          [v30 addObject:v40];
        }
        else
        {
          v25 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            CFStringRef v58 = @"YES";
            __int16 v59 = 2112;
            id v60 = v17;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "First query, but not allowed to start: %@ %@", buf, 0x16u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
            _IDSLogV();
          }
          BOOL v24 = 1;
        }
      }
      else
      {
        v41 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v42 = @"NO";
          if (!v23) {
            CFStringRef v42 = @"YES";
          }
          *(_DWORD *)buf = 138412290;
          CFStringRef v58 = v42;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "No block supplied, but is this the first query: %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
    else
    {
      BOOL v24 = 0;
    }
    id v18 = v53;
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

- (id)_completionBlocksForURIs:(id)a3 fromURI:(id)a4 fromService:(id)a5 forRefresh:(BOOL)a6
{
  unsigned int v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 count])
  {
    id v13 = objc_msgSend(v10, "__imArrayByApplyingBlock:", &stru_10098A478);
    id v14 = objc_msgSend(v13, "__imSetFromArray");

    completionBlocksToURIsMap = self->_completionBlocksToURIsMap;
    id v16 = sub_10037860C(v11, v12, v6);
    id v17 = [(NSMutableDictionary *)completionBlocksToURIsMap objectForKey:v16];
    id v18 = [v17 objectForKey:v14];
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (void)_removeCompletionBlocksForURIs:(id)a3 fromURI:(id)a4 fromService:(id)a5 forRefresh:(BOOL)a6
{
  unsigned int v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 count])
  {
    id v13 = sub_10037860C(v11, v12, v6);
    id v14 = [(NSMutableDictionary *)self->_completionBlocksToURIsMap objectForKey:v13];
    id v15 = objc_msgSend(v10, "__imArrayByApplyingBlock:", &stru_10098A498);
    id v16 = objc_msgSend(v15, "__imSetFromArray");
    id v17 = [v14 objectForKey:v16];

    [v14 removeObjectForKey:v16];
    if (![v14 count]) {
      [(NSMutableDictionary *)self->_completionBlocksToURIsMap removeObjectForKey:v13];
    }
    id v18 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v19 = @"YES";
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v10;
      if (!v17) {
        CFStringRef v19 = @"NO";
      }
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      __int16 v27 = 2112;
      id v28 = v12;
      __int16 v29 = 2112;
      CFStringRef v30 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Removing queued query for URIs: %@   fromURI: %@  service: %@ URIs set found in completion block map: %@", buf, 0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      CFStringRef v20 = @"YES";
      if (!v17) {
        CFStringRef v20 = @"NO";
      }
      id v24 = v12;
      CFStringRef v25 = v20;
      id v22 = v10;
      id v23 = v11;
      _IDSLogV();
    }
    if (![(NSMutableDictionary *)self->_completionBlocksToURIsMap count])
    {
      completionBlocksToURIsMap = self->_completionBlocksToURIsMap;
      self->_completionBlocksToURIsMap = 0;
    }
  }
}

- (void)_startQueryForURIs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 context:(id)a7 queryIdentifier:(id)a8 reason:(id)a9 completionBlock:(id)a10
{
  id v16 = (IDSPeerIDQueryHandler *)a3;
  id v17 = a4;
  id v18 = (IDSPeerIDQueryHandler *)a5;
  id v19 = a6;
  id v48 = a7;
  id v44 = a8;
  id v45 = a9;
  id v47 = a10;
  id v20 = [(IDSPeerIDQueryHandler *)v16 count];
  CFStringRef v46 = v17;
  if (v19 && v18 && v17 && v20)
  {
    queryQueue = self->_queryQueue;
    if (!queryQueue)
    {
      id v22 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      id v23 = self->_queryQueue;
      self->_queryQueue = v22;

      queryQueue = self->_queryQueue;
    }
    id v24 = [(NSMutableArray *)queryQueue count];
    if ((unint64_t)v24 > 0x3C)
    {
      id v36 = v24;
      CFStringRef v37 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413314;
        id v50 = self;
        __int16 v51 = 2048;
        id v52 = v36;
        __int16 v53 = 2112;
        v54 = v16;
        __int16 v55 = 2112;
        id v56 = v19;
        __int16 v57 = 2112;
        CFStringRef v58 = v18;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%@ uh-oh! Our queue is too long %lu. Dropping id query for URIs %@ fromService %@ fromURI %@", buf, 0x34u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v41 = v19;
        CFStringRef v42 = v18;
        id v39 = v36;
        id v40 = v16;
        CFStringRef v38 = self;
        _IDSLogV();
      }
    }
    else
    {
      id v43 = objc_alloc((Class)NSDictionary);
      CFStringRef v25 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v48 forSending]);
      v26 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v48 forRefresh]);
      __int16 v27 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v48 forMessaging]);
      id v28 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v48 resultExpected]);
      __int16 v29 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v48 isForced]);
      id v30 = objc_msgSend(v43, "initWithObjectsAndKeys:", v16, @"URIs", v46, @"FromIdentity", v18, @"FromURI", v19, @"FromService", v25, @"ForSending", v26, @"forRefresh", v27, @"ForMessaging", v28, @"ResultExpected", v29,
              @"IsForced",
              v44,
              @"QueryIdentifier",
              v45,
              @"QueryReason",
              0);

      [(NSMutableArray *)self->_queryQueue addObject:v30];
      v31 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v32 = (IDSPeerIDQueryHandler *)[(NSMutableArray *)self->_queryQueue count];
        *(_DWORD *)buf = 138412802;
        id v50 = self;
        __int16 v51 = 2112;
        id v52 = v30;
        __int16 v53 = 2048;
        v54 = v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%@ enqueuing work %@. Current queue size is %lu", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v39 = v30;
        id v40 = (IDSPeerIDQueryHandler *)[(NSMutableArray *)self->_queryQueue count];
        CFStringRef v38 = self;
        _IDSLogV();
      }
    }
    [(IDSPeerIDQueryHandler *)self _dequeuePendingQueryIfPossible];
  }
  else
  {
    unsigned int v33 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v50 = v16;
      __int16 v51 = 2112;
      id v52 = v17;
      __int16 v53 = 2112;
      v54 = v18;
      __int16 v55 = 2112;
      id v56 = v19;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "  *** failing query for URIs: %@    cert: %@   fromURI: %@   fromService: %@", buf, 0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v40 = v18;
      id v41 = v19;
      id v39 = v17;
      _IDSLogV();
    }
    if (v47)
    {
      -[IDSPeerIDQueryHandler _removeCompletionBlocksForURIs:fromURI:fromService:forRefresh:](self, "_removeCompletionBlocksForURIs:fromURI:fromService:forRefresh:", v16, v18, v19, [v48 forRefresh]);
      CFStringRef v34 = +[NSError errorWithDomain:IDSPeerIDManagerErrorDomain code:2 userInfo:0];
      CFStringRef v35 = +[NSDictionary dictionaryWithKeyArray:v16 defaultValue:v34];

      LOBYTE(v39) = 0;
      (*((void (**)(id, IDSPeerIDQueryHandler *, void, IDSPeerIDQueryHandler *, void, void, id, void, void *, id, IDSPeerIDQueryHandler *, id))v47
       + 2))(v47, v18, 0, v16, 0, 0, v19, 0, v35, v39, v40, v41);
    }
  }
}

- (void)_dequeuePendingQueryIfPossible
{
  BOOL v2 = [(FTMessageDelivery_DualMode *)self->_dualInterfaceidQueryMessageDelivery queuedMessages];
  id v3 = [v2 count];

  if (![(NSMutableArray *)self->_queryQueue count])
  {
    BOOL v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Asked to _dequeuePendingQueryIfPossible but we have no queued queries", buf, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
      return;
    }
LABEL_7:
    _IDSLogV();
    return;
  }
  if ((unint64_t)v3 >= 6)
  {
    id v4 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Tried to _dequeuePendingQueryIfPossible but we currently have %lu in-flight queries", buf, 0xCu);
    }

    if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
      return;
    }
    goto LABEL_7;
  }
  v127 = [(NSMutableArray *)self->_queryQueue objectAtIndex:0];
  [(NSMutableArray *)self->_queryQueue removeObjectAtIndex:0];
  if (![(NSMutableArray *)self->_queryQueue count])
  {
    queryQueue = self->_queryQueue;
    self->_queryQueue = 0;
  }
  CFStringRef v7 = [v127 objectForKey:@"URIs"];
  v126 = [v127 objectForKey:@"FromIdentity"];
  CFStringRef v8 = [v127 objectForKey:@"FromURI"];
  v140 = [v127 objectForKey:@"FromService"];
  v9 = [v127 objectForKey:@"ForSending"];
  unsigned __int8 v119 = [v9 BOOLValue];

  id v10 = [v127 objectForKey:@"forRefresh"];
  unsigned int v139 = [v10 BOOLValue];

  id v11 = [v127 objectForKey:@"ForMessaging"];
  unsigned int v123 = [v11 BOOLValue];

  id v12 = [v127 objectForKey:@"ResultExpected"];
  unsigned int v122 = [v12 BOOLValue];

  id v13 = [v127 objectForKey:@"IsForced"];
  unsigned int v121 = [v13 BOOLValue];

  v125 = [v127 objectForKey:@"QueryIdentifier"];
  v124 = [v127 objectForKey:@"QueryReason"];
  id v14 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v140;
    *(_WORD *)&unsigned char buf[22] = 2112;
    v201 = v125;
    *(_WORD *)v202 = 2112;
    *(void *)&v202[2] = v124;
    *(_WORD *)&v202[10] = 2112;
    *(void *)&v202[12] = v7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Starting ID query from URI: %@ Service: %@ identifier: %@ reason: %@ for IDs: %@", buf, 0x34u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    v117 = v124;
    v118 = v7;
    v111 = v140;
    v114 = v125;
    v106 = v8;
    _IDSLogEventV();
  }
  id v15 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v126;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "       Identity: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v106 = v126;
    _IDSLogV();
  }
  id v16 = +[IDSRegistrationKeyManager sharedInstance];
  id v120 = [v16 identityPrivateKey];

  v187[0] = 0;
  v187[1] = v187;
  v187[2] = 0x2020000000;
  char v188 = 1;
  v185[0] = 0;
  v185[1] = v185;
  v185[2] = 0x2020000000;
  char v186 = 1;
  v183[0] = 0;
  v183[1] = v183;
  v183[2] = 0x2020000000;
  int v184 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v201 = sub_10037AD90;
  *(void *)v202 = sub_10037ADA0;
  *(void *)&v202[8] = 0;
  uint64_t v177 = 0;
  v178 = &v177;
  uint64_t v179 = 0x3032000000;
  v180 = sub_10037AD90;
  v181 = sub_10037ADA0;
  id v182 = 0;
  if ([v140 isEqualToIgnoringCase:@"com.apple.madrid"]) {
    double v17 = 20.0;
  }
  else {
    double v17 = 60.0;
  }
  id v18 = objc_alloc_init((Class)NSMutableArray);
  v132 = (__CFString *)objc_alloc_init((Class)NSMutableArray);
  long long v175 = 0u;
  long long v176 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  id obj = v7;
  id v19 = [obj countByEnumeratingWithState:&v173 objects:v199 count:16];
  v134 = v18;
  if (!v19)
  {
    LODWORD(v128) = 0;
    goto LABEL_94;
  }
  int v129 = 0;
  uint64_t v128 = 0;
  uint64_t v20 = *(void *)v174;
  v137 = (void *)kIDSServiceDefaultsSentinelAlias;
  do
  {
    objc_super v21 = 0;
    do
    {
      if (*(void *)v174 != v20) {
        objc_enumerationMutation(obj);
      }
      id v22 = *(__CFString **)(*((void *)&v173 + 1) + 8 * (void)v21);
      id v23 = [(__CFString *)v22 tokenFreeURI];
      if ((v139 & 1) == 0)
      {
        id v24 = [(IDSPeerIDQueryHandler *)self dataSource];
        unsigned int v25 = [v24 hasQueryResultsForURI:v22 fromURI:v8 service:v140];

        if (v25)
        {
          v26 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v197 = 138412802;
            *(void *)&v197[4] = v22;
            *(_WORD *)&v197[12] = 2112;
            *(void *)&v197[14] = v8;
            *(_WORD *)&v197[22] = 2112;
            id v198 = v140;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "               Skipping URI: %@   => already have tokens   (From: %@   Service: %@)", v197, 0x20u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            v112 = v8;
            id v115 = v140;
            CFStringRef v107 = v22;
            _IDSLogV();
          }
          -[__CFString addObject:](v132, "addObject:", v23, v107, v112, v115);
          goto LABEL_63;
        }
      }
      __int16 v27 = (__CFString *)[(__CFString *)v23 FZIDType];
      id v28 = [(__CFString *)v8 prefixedURI];
      __int16 v29 = objc_msgSend(v28, "_im_normalizedURIString");
      id v30 = [v137 lowercaseString];
      BOOL v31 = [v29 rangeOfString:v30] == (id)0x7FFFFFFFFFFFFFFFLL;

      if (!v31)
      {
        id v39 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v197 = 138412290;
          *(void *)&v197[4] = v8;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "******** Found sentinel alias as from URI: %@, failing *********", v197, 0xCu);
        }

        if (!os_log_shim_legacy_logging_enabled()) {
          goto LABEL_63;
        }
        goto LABEL_56;
      }
      if ([(__CFString *)v8 FZIDType] == (id)-1)
      {
        id v40 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v197 = 138412290;
          *(void *)&v197[4] = v8;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "******** Found invalid from URI: %@, failing *********", v197, 0xCu);
        }

        if (!os_log_shim_legacy_logging_enabled()) {
          goto LABEL_63;
        }
LABEL_56:
        char v41 = _IDSShouldLog();
        CFStringRef v42 = v8;
        if (v41) {
          goto LABEL_62;
        }
        goto LABEL_63;
      }
      unsigned int v32 = [(__CFString *)v23 prefixedURI];
      unsigned int v33 = objc_msgSend(v32, "_im_normalizedURIString");
      CFStringRef v34 = [v137 lowercaseString];
      BOOL v35 = [v33 rangeOfString:v34] == (id)0x7FFFFFFFFFFFFFFFLL;

      if (v35)
      {
        if (v27 == (__CFString *)1)
        {
          id v36 = [(__CFString *)v23 prefixedURI];
          BOOL v37 = [v36 rangeOfString:@"@"] == (id)0x7FFFFFFFFFFFFFFFLL;

          if (v37)
          {
            CFStringRef v38 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v197 = 138412290;
              *(void *)&v197[4] = v23;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "******** Found malformed email in query set: %@, failing *********", v197, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled()) {
              goto LABEL_61;
            }
            goto LABEL_63;
          }
        }
        else if ((unint64_t)v27 >= 7)
        {
          id v45 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v197 = 138412546;
            *(void *)&v197[4] = v23;
            *(_WORD *)&v197[12] = 2048;
            *(void *)&v197[14] = v27;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "******** Found bad URI type in query set: %@ (%ld), failing *********", v197, 0x16u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            CFStringRef v107 = v23;
            v112 = v27;
            _IDSLogV();
          }
          goto LABEL_63;
        }
        unsigned __int8 v46 = [v140 isEqualToString:@"com.apple.private.alloy.facetime.multi"];
        if (v27) {
          char v47 = 1;
        }
        else {
          char v47 = v46;
        }
        if ((v47 & 1) != 0
          || (+[IDSCTAdapter sharedInstance],
              id v48 = objc_claimAutoreleasedReturnValue(),
              [(__CFString *)v23 unprefixedURI],
              id v49 = objc_claimAutoreleasedReturnValue(),
              unsigned int v50 = [v48 isPhoneNumberEmergencyNumber:v49],
              v49,
              v48,
              !v50))
        {
          __int16 v53 = +[IDSTrafficMonitor sharedInstance];
          unsigned __int8 v54 = [v53 noteQueryForService:v140 requestor:@"unknown"];

          if (v54)
          {
            [v134 addObject:v23];
            if (v129 & HIDWORD(v128))
            {
              HIDWORD(v128) = 1;
              int v129 = 1;
            }
            else
            {
              id v56 = [(__CFString *)v23 unprefixedURI];
              int IsEmail = IMStringIsEmail();

              char v58 = BYTE4(v128) | IsEmail ^ 1;
              int v59 = v128 | 2;
              HIDWORD(v128) |= IsEmail ^ 1;
              v129 |= IsEmail;
              if ((v129 & 1) == 0) {
                int v59 = v128;
              }
              LODWORD(v128) = v59 | v58 & 1;
            }
          }
          else
          {
            __int16 v55 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v197 = 138412290;
              *(void *)&v197[4] = v23;
              _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "******** Not querying URI %@ service is over budget, not performing query ********", v197, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              _IDSWarnV();
              _IDSLogV();
              CFStringRef v107 = v23;
              _IDSLogTransport();
            }
          }
        }
        else
        {
          __int16 v51 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v197 = 138412290;
            *(void *)&v197[4] = v23;
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "******** URI %@ is an emergency number, not performing query ********", v197, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            int v52 = _IDSShouldLog();
            CFStringRef v42 = v23;
            if (v52) {
              goto LABEL_62;
            }
          }
        }
      }
      else
      {
        id v43 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v197 = 138412290;
          *(void *)&v197[4] = v23;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "******** Found sentinel alias in query set: %@, failing *********", v197, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
LABEL_61:
          char v44 = _IDSShouldLog();
          CFStringRef v42 = v23;
          if ((v44 & 1) == 0) {
            goto LABEL_63;
          }
LABEL_62:
          CFStringRef v107 = v42;
          _IDSLogV();
        }
      }
LABEL_63:

      objc_super v21 = (char *)v21 + 1;
    }
    while (v19 != v21);
    id v60 = [obj countByEnumeratingWithState:&v173 objects:v199 count:16];
    id v19 = v60;
  }
  while (v60);
LABEL_94:

  if ([v134 count])
  {
    __int16 v61 = +[NSDate date];
    v133 = objc_msgSend(v134, "__imArrayByApplyingBlock:", &stru_10098A4B8);
    CFStringRef v62 = objc_alloc_init(IDSIDQueryMessage);
    [(IDSIDQueryMessage *)v62 setURIs:v133];
    __int16 v63 = [(__CFString *)v8 prefixedURI];
    [(IDSIDQueryMessage *)v62 setSelfURI:v63];

    [(IDSIDQueryMessage *)v62 setIDCertificate:v126];
    [(IDSIDQueryMessage *)v62 setIdentityPrivateKey:v120];
    [(IDSIDQueryMessage *)v62 setTimeout:v17];
    v131 = [(IDSPeerIDPushHandler *)self->_pushHandler pushToken];
    [(IDSIDQueryMessage *)v62 setPushToken:v131];
    [(IDSIDQueryMessage *)v62 setTopic:@"com.apple.ids.query"];
    [(IDSIDQueryMessage *)v62 setUnderlyingService:v140];
    [(IDSIDQueryMessage *)v62 setImportanceLevel:2];
    if (v123) {
      CFStringRef v64 = @"true";
    }
    else {
      CFStringRef v64 = 0;
    }
    -[IDSIDQueryMessage setRequiredForMessaging:](v62, "setRequiredForMessaging:", v64, v107);
    [(IDSIDQueryMessage *)v62 setResultExpected:v122];
    [(IDSIDQueryMessage *)v62 setIsForced:v121];
    __int16 v65 = +[IDSDServiceController sharedInstance];
    v138 = [v65 serviceWithIdentifier:v140];

    CFStringRef v66 = +[IDSDServiceController sharedInstance];
    v130 = [v66 allPrimaryServices];

    if ([v138 adHocServiceType] != 5)
    {
      if ([v130 containsObject:v138])
      {
        if ([v138 adHocServiceType]) {
          [(IDSIDQueryMessage *)v62 setService:v140];
        }
      }
      else
      {
        [(IDSIDQueryMessage *)v62 setSubService:v140];
      }
    }
    if ([v138 forceHTTPQueriesOnly])
    {
      v77 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v197 = 0;
        _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "Service wants to force HTTP queries, setting importance level lower to ensure it doesnt use APS", v197, 2u);
      }

      if os_log_shim_legacy_logging_enabled() && (_IDSShouldLog()) {
        goto LABEL_122;
      }
      goto LABEL_123;
    }
    if (IMGetDomainBoolForKey())
    {
      v78 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v197 = 0;
        _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "*** We are currently forcing HTTP queries due to a default; remove default to re-enable QORP!",
          v197,
          2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
LABEL_122:
      }
        _IDSLogV();
LABEL_123:
      [(IDSIDQueryMessage *)v62 setImportanceLevel:1];
    }
    v79 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      id v80 = [(IDSIDQueryMessage *)v62 service];
      *(_DWORD *)v197 = 138412290;
      *(void *)&v197[4] = v80;
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "The Query Service Is %@", v197, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v108 = [(IDSIDQueryMessage *)v62 service];
      _IDSLogV();
    }
    if (!v178[5])
    {
      id v81 = [objc_alloc((Class)IMPowerAssertion) initWithIdentifier:@"IDSPeerIDLookup" timeout:60.0];
      v82 = (void *)v178[5];
      v178[5] = (uint64_t)v81;
    }
    v83 = +[NSString stringGUID];
    v84 = +[IMMobileNetworkManager sharedInstance];
    [v84 addFastDormancyDisableToken:v83];

    v85 = [v134 componentsJoinedByString:@", "];
    *(void *)v197 = 0;
    *(void *)&v197[8] = v197;
    *(void *)&v197[16] = 0x2020000000;
    LODWORD(v198) = 0;
    v163[0] = 0;
    v163[1] = v163;
    v163[2] = 0x2020000000;
    int v164 = 0;
    v142[0] = _NSConcreteStackBlock;
    v142[1] = 3221225472;
    v142[2] = sub_10037ADB0;
    v142[3] = &unk_10098A4E0;
    v142[4] = self;
    v153 = v185;
    v154 = v183;
    v155 = v187;
    id v86 = v61;
    id v143 = v86;
    v144 = v125;
    id v87 = v85;
    id v145 = v87;
    id v88 = v140;
    id v146 = v88;
    v89 = v8;
    v147 = v89;
    v156 = buf;
    v157 = v197;
    unsigned __int8 v161 = v119;
    int v160 = v128;
    id v148 = v124;
    id v149 = v134;
    v158 = v163;
    v150 = v126;
    id v90 = v83;
    id v151 = v90;
    char v162 = v139;
    id v152 = obj;
    v159 = &v177;
    [(IDSIDQueryMessage *)v62 setCompletionBlock:v142];
    v91 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v189 = 138412802;
      id v190 = v87;
      __int16 v191 = 2112;
      v192 = v89;
      __int16 v193 = 2112;
      id v194 = v88;
      _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "  Sending off query for URIs: %@  from URI: %@   service: %@", v189, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v112 = v89;
      id v115 = v88;
      id v109 = v87;
      _IDSLogV();
    }
    v92 = +[NetworkChangeNotifier sharedInstance];
    id v93 = [v92 linkQualityForInterfaceType:2];

    if (v93 != (id)2)
    {
      v94 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v189 = 0;
        _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, " ** WiFi link quality is not good, requesting cellular preferred", v189, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      [(IDSIDQueryMessage *)v62 setForceCellular:1];
    }
    v95 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v189 = 138412802;
      id v190 = v87;
      __int16 v191 = 2112;
      v192 = v89;
      __int16 v193 = 2112;
      id v194 = v88;
      _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, " => Sending query for URIs: %@  from URI: %@   service: %@", v189, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v113 = v89;
      id v116 = v88;
      id v110 = v87;
      _IDSLogV();
    }
    -[FTMessageDelivery_DualMode sendMessage:](self->_dualInterfaceidQueryMessageDelivery, "sendMessage:", v62, v110, v113, v116);
    v96 = +[IDSServerBag sharedInstanceForBagType:1];
    if ([v96 isServerAvailable]) {
      [v96 startBagLoad];
    }
    v97 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10037DCC4;
    block[3] = &unk_10097E4D0;
    block[4] = self;
    dispatch_async(v97, block);

    _Block_object_dispose(v163, 8);
    _Block_object_dispose(v197, 8);
  }
  else
  {
    long long v171 = 0u;
    long long v172 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    id v67 = obj;
    id v68 = [v67 countByEnumeratingWithState:&v169 objects:v196 count:16];
    if (v68)
    {
      uint64_t v69 = *(void *)v170;
      int v70 = 1;
      do
      {
        for (i = 0; i != v68; i = (char *)i + 1)
        {
          if (*(void *)v170 != v69) {
            objc_enumerationMutation(v67);
          }
          v72 = *(void **)(*((void *)&v169 + 1) + 8 * i);
          v74 = [v72 tokenFreeURI];
          v75 = [(IDSPeerIDQueryHandler *)self dataSource];
          unsigned int v76 = [v75 hasPeerTokensForURI:v74 fromURI:v8 service:v140];

          v70 &= v76;
        }
        id v68 = [v67 countByEnumeratingWithState:&v169 objects:v196 count:16];
      }
      while (v68);
    }
    else
    {
      int v70 = 1;
    }

    v98 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v99 = @"NO";
      *(_DWORD *)v197 = 138412802;
      if (v70) {
        CFStringRef v99 = @"YES";
      }
      *(void *)&v197[4] = v99;
      *(_WORD *)&v197[12] = 2112;
      *(void *)&v197[14] = v132;
      *(_WORD *)&v197[22] = 2112;
      id v198 = v67;
      _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "The requestedURIsToQuery have already been covered by previous queries! -- Returning {success: %@, checked: %@, requested: %@}", v197, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      CFStringRef v100 = @"NO";
      if (v70) {
        CFStringRef v100 = @"YES";
      }
      v112 = v132;
      id v115 = v67;
      CFStringRef v107 = v100;
      _IDSLogV();
    }
    v101 = -[IDSPeerIDQueryHandler _completionBlocksForURIs:fromURI:fromService:forRefresh:](self, "_completionBlocksForURIs:fromURI:fromService:forRefresh:", v67, v8, v140, v139, v107, v112, v115);
    id v102 = [v101 copy];

    long long v167 = 0u;
    long long v168 = 0u;
    long long v165 = 0u;
    long long v166 = 0u;
    id v86 = v102;
    id v103 = [v86 countByEnumeratingWithState:&v165 objects:v195 count:16];
    if (v103)
    {
      uint64_t v104 = *(void *)v166;
      do
      {
        for (j = 0; j != v103; j = (char *)j + 1)
        {
          if (*(void *)v166 != v104) {
            objc_enumerationMutation(v86);
          }
          (*(void (**)(void, __CFString *))(*(void *)(*((void *)&v165 + 1) + 8 * (void)j) + 16))(*(void *)(*((void *)&v165 + 1) + 8 * (void)j), v8);
        }
        id v103 = [v86 countByEnumeratingWithState:&v165 objects:v195 count:16];
      }
      while (v103);
    }

    [(IDSPeerIDQueryHandler *)self _removeCompletionBlocksForURIs:v67 fromURI:v8 fromService:v140 forRefresh:v139];
    [(IDSPeerIDQueryHandler *)self _dequeuePendingQueryIfPossible];
  }

  _Block_object_dispose(&v177, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v183, 8);
  _Block_object_dispose(v185, 8);
  _Block_object_dispose(v187, 8);
}

- (BOOL)startQueryForURIs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 context:(id)a7 reason:(id)a8 completionBlock:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if ([v15 count])
  {
    id v22 = +[NSUUID UUID];
    unsigned int v23 = [(IDSPeerIDQueryHandler *)self _addCompletionBlock:v21 forURIs:v15 fromURI:v17 fromService:v18 context:v19 queryIdentifier:v22];
    if (v23 && ([v19 preventNewQuery] & 1) == 0) {
      [(IDSPeerIDQueryHandler *)self _startQueryForURIs:v15 fromIdentity:v16 fromURI:v17 fromService:v18 context:v19 queryIdentifier:v22 reason:v20 completionBlock:v21];
    }
    unsigned int v24 = v23 & [v19 preventNewQuery] ^ 1;
  }
  else
  {
    LOBYTE(v24) = 0;
  }

  return v24;
}

- (void)addCompletionBlock:(id)a3 forToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      if (!self->_extraCompletionBlocks)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        extraCompletionBlocks = self->_extraCompletionBlocks;
        self->_extraCompletionBlocks = Mutable;
      }
      id v10 = [v6 copy];
      id v11 = v10;
      if (v10)
      {
        id v12 = self->_extraCompletionBlocks;
        id v13 = objc_retainBlock(v10);
        [(NSMutableDictionary *)v12 setObject:v13 forKey:v7];
      }
      goto LABEL_18;
    }
    id v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Empty completion block for token: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
LABEL_17:
    }
      _IDSLogV();
  }
  else
  {
    id v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Empty token for completion block", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      goto LABEL_17;
    }
  }
LABEL_18:
}

- (void)removeCompletionBlockForToken:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(NSMutableDictionary *)self->_extraCompletionBlocks removeObjectForKey:v4];
    if (![(NSMutableDictionary *)self->_extraCompletionBlocks count])
    {
      extraCompletionBlocks = self->_extraCompletionBlocks;
      self->_extraCompletionBlocks = 0;
    }
  }
  else
  {
    id v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Empty token for removing completion block", v7, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (FTMessageDelivery_DualMode)dualInterfaceidQueryMessageDelivery
{
  return self->_dualInterfaceidQueryMessageDelivery;
}

- (void)setDualInterfaceidQueryMessageDelivery:(id)a3
{
}

- (NSMutableArray)queryQueue
{
  return self->_queryQueue;
}

- (void)setQueryQueue:(id)a3
{
}

- (NSMutableDictionary)completionBlocksToURIsMap
{
  return self->_completionBlocksToURIsMap;
}

- (void)setCompletionBlocksToURIsMap:(id)a3
{
}

- (NSMutableDictionary)extraCompletionBlocks
{
  return self->_extraCompletionBlocks;
}

- (void)setExtraCompletionBlocks:(id)a3
{
}

- (NSMutableDictionary)disasterModeTokens
{
  return self->_disasterModeTokens;
}

- (void)setDisasterModeTokens:(id)a3
{
}

- (BOOL)isInServerBackoffMode
{
  return self->_isInServerBackoffMode;
}

- (void)setIsInServerBackoffMode:(BOOL)a3
{
  self->_isInServerBackoffMode = a3;
}

- (IDSPeerIDNetworkChangeNotifier)networkChangeNotifier
{
  return self->_networkChangeNotifier;
}

- (void)setNetworkChangeNotifier:(id)a3
{
}

- (IDSPeerIDPushHandler)pushHandler
{
  return self->_pushHandler;
}

- (void)setPushHandler:(id)a3
{
}

- (IDSPeerIDQueryHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IDSPeerIDQueryHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (IDSPeerIDQueryHandlerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pushHandler, 0);
  objc_storeStrong((id *)&self->_networkChangeNotifier, 0);
  objc_storeStrong((id *)&self->_disasterModeTokens, 0);
  objc_storeStrong((id *)&self->_extraCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_completionBlocksToURIsMap, 0);
  objc_storeStrong((id *)&self->_queryQueue, 0);

  objc_storeStrong((id *)&self->_dualInterfaceidQueryMessageDelivery, 0);
}

@end