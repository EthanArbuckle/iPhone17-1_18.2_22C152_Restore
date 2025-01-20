@interface APSConnectionServer
+ (id)environmentForNamedPort:(id)a3 userPreferences:(id)a4;
+ (id)serverEnvironmentNamesForUserPreferences:(id)a3;
+ (id)serversWithEnvironmentName:(id)a3 user:(id)a4 userPreferences:(id)a5 excludeServers:(id)a6 delegate:(id)a7;
+ (void)serversWithEnvironmentName:(id)a3 user:(id)a4 userPreferences:(id)a5 excludeServers:(id)a6 delegate:(id)a7 returnServers:(id)a8;
- (APSConnectionServer)initWithDelegate:(id)a3 user:(id)a4 userPreferences:(id)a5 enableDarkWake:(BOOL)a6 environmentName:(id)a7 connectionPortName:(id)a8 processName:(id)a9 connection:(id)a10;
- (APSConnectionServerDelegate)delegate;
- (APSUser)user;
- (APSUserPreferences)userPreferences;
- (BOOL)_containsInvalidTopic:(id)a3;
- (BOOL)enableCriticalReliability;
- (BOOL)enableDarkWake;
- (BOOL)enableStatusChangeNotifications;
- (BOOL)isClosed;
- (BOOL)isConnected;
- (BOOL)isInitialized;
- (BOOL)isPublicTokenAcknowledged;
- (BOOL)trackActivityPresence;
- (NSData)publicToken;
- (NSSet)enabledTopics;
- (NSSet)ignoredTopics;
- (NSSet)nonWakingTopics;
- (NSSet)opportunisticTopics;
- (NSSet)pushWakeTopics;
- (NSSet)ultraConstrainedTopics;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)environmentName;
- (NSString)name;
- (NSString)processName;
- (OS_xpc_object)connection;
- (double)publicTokenDeliveryDelay;
- (id)JSONDebugState;
- (id)aps_prettyDescription;
- (id)connectionPortName;
- (id)entitledTopicsFromSet:(id)a3 unentitledTopics:(id *)a4;
- (id)processNameWithLabels:(BOOL)a3;
- (int64_t)publicTokenDeliveryRetries;
- (os_unfair_lock_s)connectionLock;
- (unint64_t)largeMessageSize;
- (unint64_t)messageSize;
- (void)_enqueueXPCMessage:(id)a3 wakingClient:(BOOL)a4 highPriority:(BOOL)a5;
- (void)_enqueueXPCMessage:(id)a3 wakingClient:(BOOL)a4 highPriority:(BOOL)a5 shouldBoostPriority:(BOOL)a6 withReply:(id)a7;
- (void)_enqueueXPCMessage:(id)a3 wakingClient:(BOOL)a4 highPriority:(BOOL)a5 withReply:(id)a6;
- (void)_handleInvalidateTokenForInfo:(id)a3;
- (void)_handleRequestTokenForInfo:(id)a3;
- (void)_informTopicManagerOfChangedFilter:(int64_t)a3 newTopics:(id)a4 oldTopics:(id)a5;
- (void)_initiateConnectionIfNecessary;
- (void)_lookUpMachPort;
- (void)_migratePersistentTopicsIfNeeded;
- (void)_redeliverCurrentPublicToken;
- (void)_resumeQueue;
- (void)_savePersistentConnection;
- (void)_savePersistentConnectionTopics;
- (void)_sendClientToken:(id)a3 forInfo:(id)a4;
- (void)_suspendQueue;
- (void)_warnIfOverlappingTopics:(id)a3 againstTopics:(id)a4 string:(id)a5;
- (void)acknowledgeDidReceivePublicToken:(id)a3;
- (void)appendPrettyStatusToStatusPrinter:(id)a3;
- (void)appendPrettyStatusToStatusPrinter:(id)a3 forTopics:(id)a4 type:(id)a5;
- (void)close;
- (void)connectionHandshakeDidComplete;
- (void)connectionInvalidated;
- (void)dealloc;
- (void)handleAckIncomingMessageWithGuid:(id)a3 topic:(id)a4 tracingUUID:(id)a5;
- (void)handleCancelOutgoingMessageWithID:(unint64_t)a3;
- (void)handleChannelSubscriptionFailures:(id)a3 forTopic:(id)a4;
- (void)handleConnectionStatusChanged:(BOOL)a3;
- (void)handleCurrentTokenForInfo:(id)a3;
- (void)handleCurrentURLTokenForInfo:(id)a3;
- (void)handleFakeMessage:(id)a3;
- (void)handleIncomingMessageReceiptWithTopic:(id)a3 tracingUUID:(id)a4;
- (void)handleInvalidatePerAppTokenForInfo:(id)a3;
- (void)handleInvalidatePerAppTokenForTopic:(id)a3 identifier:(id)a4;
- (void)handleInvalidateURLTokenForTopic:(id)a3;
- (void)handleNotificationAcknowledged;
- (void)handlePublicTokenDeliveryReply:(id)a3;
- (void)handleReceivedMessage:(id)a3;
- (void)handleReceivedToken:(id)a3 forInfo:(id)a4;
- (void)handleReceivedTokenError:(id)a3 forInfo:(id)a4;
- (void)handleRequestPerAppTokenForTopic:(id)a3 identifier:(id)a4;
- (void)handleRequestTokenForInfo:(id)a3;
- (void)handleRequestURLTokenForInfo:(id)a3;
- (void)handleResult:(id)a3 forSendingOutgoingMessage:(id)a4;
- (void)handleResult:(id)a3 forSendingOutgoingMessageWithID:(unint64_t)a4;
- (void)handleResult:(id)a3 forSendingOutgoingMessageWithID:(unint64_t)a4 sendRTT:(unint64_t)a5 ackTimestamp:(unint64_t)a6;
- (void)handleSendOutgoingMessage:(id)a3;
- (void)handleSubscribeToChannels:(id)a3 forTopic:(id)a4;
- (void)handleUnsubscribeFromChannels:(id)a3 forTopic:(id)a4;
- (void)saveAndUpdateDelegate;
- (void)setConnection:(id)a3;
- (void)setConnectionLock:(os_unfair_lock_s)a3;
- (void)setDelegate:(id)a3;
- (void)setEnableCriticalReliability:(BOOL)a3;
- (void)setEnableStatusChangeNotifications:(BOOL)a3;
- (void)setEnabledTopics:(id)a3 ignoredTopics:(id)a4 opportunisticTopics:(id)a5 nonWakingTopics:(id)a6;
- (void)setIsInitialized:(BOOL)a3;
- (void)setIsPublicTokenAcknowledged:(BOOL)a3;
- (void)setKeepAliveConfiguration:(unint64_t)a3;
- (void)setLargeMessageSize:(unint64_t)a3;
- (void)setMessageSize:(unint64_t)a3;
- (void)setProcessName:(id)a3;
- (void)setPublicToken:(id)a3 needsAck:(BOOL)a4;
- (void)setPublicTokenDeliveryRetries:(int64_t)a3;
- (void)setPushWakeTopics:(id)a3;
- (void)setTrackActivityPresence:(BOOL)a3;
- (void)setUltraConstrainedTopics:(id)a3;
- (void)setUser:(id)a3;
- (void)setUserPreferences:(id)a3;
@end

@implementation APSConnectionServer

+ (id)serverEnvironmentNamesForUserPreferences:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray array];
  v5 = [v3 persistentTopics];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = v5;
      id v15 = v3;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v6 = v5;
      id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v17;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v17 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = objc_msgSend(v6, "objectForKey:", *(void *)(*((void *)&v16 + 1) + 8 * i), v14, v15, (void)v16);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v12 = [v11 objectForKey:@"environment"];
              if (([v4 containsObject:v12] & 1) == 0)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  [v4 addObject:v12];
                }
              }
            }
          }
          id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v8);
      }

      v5 = v14;
      id v3 = v15;
    }
  }

  return v4;
}

+ (id)serversWithEnvironmentName:(id)a3 user:(id)a4 userPreferences:(id)a5 excludeServers:(id)a6 delegate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  long long v17 = +[NSMutableArray array];
  long long v18 = +[APSLog connectionServer];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    id v22 = v12;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "serversWithEnvironmentNames: %@", (uint8_t *)&v21, 0xCu);
  }

  if (v12)
  {
    [a1 serversWithEnvironmentName:v12 user:v13 userPreferences:v14 excludeServers:v15 delegate:v16 returnServers:v17];
    id v19 = v17;
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

+ (void)serversWithEnvironmentName:(id)a3 user:(id)a4 userPreferences:(id)a5 excludeServers:(id)a6 delegate:(id)a7 returnServers:(id)a8
{
  kern_return_t v24;
  APSConnectionServer *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  APSConnectionServer *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  const char *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  uint64_t v69;
  id v70;
  id v71;
  int v72;
  long long v73;
  long long v74;
  long long v75;
  long long v76;
  uint8_t buf[4];
  APSConnectionServer *v78;
  __int16 v79;
  const char *v80;
  __int16 v81;
  id v82;
  unsigned char v83[128];

  id v12 = a3;
  v71 = a4;
  id v13 = a5;
  v58 = a7;
  v56 = a8;
  id v14 = [v13 persistentTopics];
  id v15 = objc_alloc_init((Class)NSMutableArray);
  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v57 = v13;
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      v54 = v14;
      id v16 = v14;
      id v17 = [v16 countByEnumeratingWithState:&v73 objects:v83 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v74;
        v55 = v12;
        v68 = v15;
        v69 = *(void *)v74;
        do
        {
          v20 = 0;
          v70 = v18;
          do
          {
            if (*(void *)v74 != v19) {
              objc_enumerationMutation(v16);
            }
            int v21 = *(void **)(*((void *)&v73 + 1) + 8 * (void)v20);
            id v22 = objc_msgSend(v16, "objectForKey:", v21, v53);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v72 = 0;
              id v23 = v21;
              v24 = objc_msgSend(v71, "bootstrapLookupForPortName:outConnectionPort:", objc_msgSend(v23, "UTF8String"), &v72);
              getpid();
              v25 = (APSConnectionServer *)v23;
              v53 = [(APSConnectionServer *)v25 UTF8String];
              if (sandbox_check())
              {
                v26 = +[APSLog connectionServer];
                if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v78 = v25;
                  _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "APSConnection is created with an invalid mach port that sandbox hasn't allowlisted yet. Please switch to use mach port with format <com.apple.aps.*>. {MachPort: %@}", buf, 0xCu);
                }
              }
              if ((v72 - 1) >= 0xFFFFFFFE)
              {
                v35 = +[APSLog connectionServer];
                id v18 = v70;
                if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                {
                  v36 = bootstrap_strerror(v24);
                  *(_DWORD *)buf = 138412546;
                  v78 = v25;
                  v79 = 2080;
                  v80 = v36;
                  _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Unable to bootstrap_lookup connection port for '%@': %s", buf, 0x16u);
                }

                [v15 addObject:v25];
              }
              else
              {
                v27 = [v22 objectForKey:@"environment"];
                v28 = [v22 objectForKey:@"processName"];
                v29 = [v22 objectForKey:@"tokenAcked"];
                v30 = [v29 BOOLValue];

                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0 && [v27 isEqualToString:v12])
                {
                  v31 = [[APSConnectionServer alloc] initWithDelegate:v58 user:v71 userPreferences:v57 enableDarkWake:0 environmentName:v27 connectionPortName:v25 processName:v28 connection:0];
                  v32 = +[APSLog connectionServer];
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412802;
                    v78 = v31;
                    v79 = 2112;
                    v80 = (const char *)v25;
                    v81 = 2112;
                    v82 = v71;
                    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Creating server: %@ with connectionPortName: %@ user: %@", buf, 0x20u);
                  }

                  if (v31)
                  {
                    [(APSConnectionServer *)v31 setIsPublicTokenAcknowledged:v30];
                    v33 = [v22 objectForKey:@"enabled"];
                    v34 = APSSafeArrayOfStrings();

                    if (v34) {
                      v67 = [objc_alloc((Class)NSSet) initWithArray:v34];
                    }
                    else {
                      v67 = 0;
                    }
                    v37 = [v22 objectForKey:@"ignored"];
                    v38 = APSSafeArrayOfStrings();

                    v64 = (void *)v38;
                    if (v38) {
                      v66 = [objc_alloc((Class)NSSet) initWithArray:v38];
                    }
                    else {
                      v66 = 0;
                    }
                    v65 = (void *)v34;
                    v39 = [v22 objectForKey:@"opportunistic"];
                    APSSafeArrayOfStrings();
                    v40 = (id)objc_claimAutoreleasedReturnValue();

                    v63 = v40;
                    if (v40) {
                      v40 = [objc_alloc((Class)NSSet) initWithArray:v40];
                    }
                    v41 = [v22 objectForKey:@"nonWaking"];
                    v42 = APSSafeArrayOfStrings();

                    if (v42) {
                      v43 = [objc_alloc((Class)NSSet) initWithArray:v42];
                    }
                    else {
                      v43 = 0;
                    }
                    v60 = v43;
                    v61 = (void *)v42;
                    [(APSConnectionServer *)v31 setEnabledTopics:v67 ignoredTopics:v66 opportunisticTopics:v40 nonWakingTopics:v43];
                    v44 = [v22 objectForKey:@"enableStatusUpdates"];
                    v45 = v44;
                    if (v44) {
                      -[APSConnectionServer setEnableStatusChangeNotifications:](v31, "setEnableStatusChangeNotifications:", [v44 BOOLValue]);
                    }
                    v59 = v45;
                    v46 = [v22 objectForKey:@"pushWake"];
                    v47 = APSSafeArrayOfStrings();

                    v62 = v40;
                    if (v47) {
                      v48 = [objc_alloc((Class)NSSet) initWithArray:v47];
                    }
                    else {
                      v48 = 0;
                    }
                    [(APSConnectionServer *)v31 setPushWakeTopics:v48];
                    v49 = [v22 objectForKey:@"ultraConstrained"];
                    v50 = APSSafeArrayOfStrings();

                    if (v50) {
                      v51 = [objc_alloc((Class)NSSet) initWithArray:v50];
                    }
                    else {
                      v51 = 0;
                    }
                    [(APSConnectionServer *)v31 setUltraConstrainedTopics:v51];
                    [v56 addObject:v31];

                    id v12 = v55;
                  }
                }
                id v15 = v68;
                id v18 = v70;
              }
              uint64_t v19 = v69;
            }

            v20 = (char *)v20 + 1;
          }
          while (v18 != v20);
          id v18 = [v16 countByEnumeratingWithState:&v73 objects:v83 count:16];
        }
        while (v18);
      }

      id v13 = v57;
      id v14 = v54;
    }
  }
  if (objc_msgSend(v15, "count", v53))
  {
    v52 = [v14 mutableCopy];
    [v52 removeObjectsForKeys:v15];
    [v13 setPersistentTopics:v52];
  }
}

- (void)_enqueueXPCMessage:(id)a3 wakingClient:(BOOL)a4 highPriority:(BOOL)a5
{
}

- (void)_enqueueXPCMessage:(id)a3 wakingClient:(BOOL)a4 highPriority:(BOOL)a5 withReply:(id)a6
{
}

- (void)_enqueueXPCMessage:(id)a3 wakingClient:(BOOL)a4 highPriority:(BOOL)a5 shouldBoostPriority:(BOOL)a6 withReply:(id)a7
{
  BOOL v8 = a6;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a7;
  if (v12)
  {
    if (self->_enqueuedBlockCount >= 0x65)
    {
      id v14 = +[APSLog connectionServer];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t enqueuedBlockCount = self->_enqueuedBlockCount;
        *(_DWORD *)buf = 138412546;
        v32 = self;
        __int16 v33 = 2048;
        unint64_t v34 = enqueuedBlockCount;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@: _queue has too many operations %lu! Droping block.", buf, 0x16u);
      }
      goto LABEL_17;
    }
    +[CUTWeakReference weakRefWithObject:self];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10005285C;
    v24[3] = &unk_10012B3E8;
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    v25 = v14;
    BOOL v29 = a5;
    v26 = self;
    id v27 = v12;
    id v28 = v13;
    BOOL v30 = v8;
    id v16 = objc_retainBlock(v24);
    id v17 = v16;
    if (!self->_queue)
    {
      ((void (*)(void *))v16[2])(v16);
LABEL_16:

LABEL_17:
      goto LABEL_18;
    }
    if (v10)
    {
      [(APSConnectionServer *)self _initiateConnectionIfNecessary];
    }
    else if (self->_isQueueSuspended)
    {
      p_numberNotificationsDropped = &self->_numberNotificationsDropped;
LABEL_15:
      atomic_fetch_add(p_numberNotificationsDropped, 1uLL);
      goto LABEL_16;
    }
    uint64_t v19 = self;
    objc_sync_enter(v19);
    ++self->_enqueuedBlockCount;
    objc_sync_exit(v19);

    queue = self->_queue;
    if (v8)
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100052C28;
      v22[3] = &unk_10012B3C0;
      id v23 = v17;
      dispatch_block_t v21 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v22);
      dispatch_async(queue, v21);
    }
    else
    {
      dispatch_async(queue, v17);
    }
    p_numberNotificationsDropped = &v19->_numberNotificationsQueued;
    goto LABEL_15;
  }
LABEL_18:
}

- (APSConnectionServer)initWithDelegate:(id)a3 user:(id)a4 userPreferences:(id)a5 enableDarkWake:(BOOL)a6 environmentName:(id)a7 connectionPortName:(id)a8 processName:(id)a9 connection:(id)a10
{
  id obj = a3;
  id v36 = a4;
  id v35 = a5;
  id v39 = a7;
  id v15 = a8;
  id v38 = a9;
  id v16 = (_xpc_connection_s *)a10;
  v40.receiver = self;
  v40.super_class = (Class)APSConnectionServer;
  id v17 = [(APSConnectionServer *)&v40 init];
  if (!v17) {
    goto LABEL_20;
  }
  id v18 = +[APSLog connectionServer];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v42 = v17;
    __int16 v43 = 2112;
    id v44 = v39;
    __int16 v45 = 2112;
    id v46 = v15;
    __int16 v47 = 2112;
    id v48 = v38;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@: Initializing connection server with environmentName '%@' and connectionPortName '%@' and processName '%@'", buf, 0x2Au);
  }

  objc_storeStrong((id *)&v17->_userPreferences, a5);
  v17->_connectionLock._os_unfair_lock_opaque = 0;
  if (v15)
  {
    id v19 = objc_alloc((Class)NSString);
    v20 = [v36 name];
    dispatch_block_t v21 = (NSString *)[v19 initWithFormat:@"port=%@-user=%@-env=%@", v15, v20, v39];
LABEL_8:
    name = v17->_name;
    v17->_name = v21;

    goto LABEL_9;
  }
  if (v38)
  {
    id v22 = objc_alloc((Class)NSString);
    v20 = [v36 name];
    dispatch_block_t v21 = (NSString *)[v22 initWithFormat:@"proc=%@-user=%@-env=%@", v38, v20, v39];
    goto LABEL_8;
  }
LABEL_9:
  objc_storeStrong((id *)&v17->_user, a4);
  objc_storeWeak((id *)&v17->_delegate, obj);
  objc_storeStrong((id *)&v17->_environmentName, a7);
  v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v25 = dispatch_queue_create("com.apple.apsd-apsconnectionserver", v24);
  queue = v17->_queue;
  v17->_queue = (OS_dispatch_queue *)v25;

  objc_storeStrong((id *)&v17->_processName, a9);
  v17->_publicTokenDeliveryRetries = 0;
  id v27 = +[NSDate date];
  [v27 timeIntervalSinceReferenceDate];
  v17->_dateCreated = v28;

  v17->_enableDarkWake = a6;
  if (v15)
  {
    objc_storeStrong((id *)&v17->_connectionPortName, a8);
    [(APSConnectionServer *)v17 _lookUpMachPort];
  }
  if (v16)
  {
    v17->_clientPID = xpc_connection_get_pid(v16);
    objc_storeStrong((id *)&v17->_connection, a10);
    [(APSConnectionServer *)v17 _migratePersistentTopicsIfNeeded];
  }
  else
  {
    connectionPortName = v17->_connectionPortName;
    BOOL v30 = +[APSLog connectionServer];
    v31 = v30;
    if (connectionPortName)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v32 = (APSConnectionServer *)v17->_connectionPortName;
        *(_DWORD *)buf = 138412290;
        v42 = v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "nil _connection but we have a port name: %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      sub_1000C8F38(v31);
    }
  }
  [(APSConnectionServer *)v17 _suspendQueue];
LABEL_20:

  return v17;
}

- (void)dealloc
{
  [(APSConnectionServer *)self close];
  mach_port_name_t connectionMachPort = self->_connectionMachPort;
  if (connectionMachPort)
  {
    mach_port_deallocate(mach_task_self_, connectionMachPort);
    self->_mach_port_name_t connectionMachPort = 0;
  }
  if (self->_isQueueSuspended) {
    dispatch_resume((dispatch_object_t)self->_queue);
  }
  v4.receiver = self;
  v4.super_class = (Class)APSConnectionServer;
  [(APSConnectionServer *)&v4 dealloc];
}

- (void)_lookUpMachPort
{
  kern_return_t v4;
  NSObject *v5;
  NSString *connectionPortName;
  void *v7;
  const char *v8;
  unsigned int v9;
  uint8_t buf[4];
  NSString *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  const char *v15;

  uint64_t v9 = 0;
  id v3 = [(APSConnectionServer *)self user];
  objc_super v4 = objc_msgSend(v3, "bootstrapLookupForPortName:outConnectionPort:", -[NSString UTF8String](self->_connectionPortName, "UTF8String"), &v9);

  if (v9 - 1 > 0xFFFFFFFD)
  {
    v5 = +[APSLog connectionServer];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      connectionPortName = self->_connectionPortName;
      id v7 = [(APSConnectionServer *)self user];
      BOOL v8 = bootstrap_strerror(v4);
      *(_DWORD *)buf = 138412802;
      v11 = connectionPortName;
      id v12 = 2112;
      id v13 = v7;
      id v14 = 2080;
      id v15 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Unable to bootstrap_look_up connection port '%@' for user %@: %s", buf, 0x20u);
    }
  }
  else
  {
    self->_mach_port_name_t connectionMachPort = v9;
  }
}

- (void)close
{
  self->_isClosed = 1;
  connection = [(APSConnectionServer *)self connection];
  if (connection)
  {
    [(APSConnectionServer *)self _suspendQueue];
    xpc_connection_set_context(connection, 0);
    xpc_connection_cancel(connection);
    [(APSConnectionServer *)self setConnection:0];
  }
}

- (OS_xpc_object)connection
{
  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  objc_super v4 = self->_connection;
  os_unfair_lock_unlock(p_connectionLock);
  return v4;
}

- (NSString)processName
{
  return (NSString *)[(APSConnectionServer *)self processNameWithLabels:0];
}

- (id)processNameWithLabels:(BOOL)a3
{
  connectionPortName = self->_connectionPortName;
  if (connectionPortName)
  {
    CFStringRef v4 = &stru_10012F350;
    if (a3) {
      CFStringRef v4 = @"portname=";
    }
    +[NSString stringWithFormat:@"%@%@", v4, connectionPortName, v8];
  }
  else
  {
    CFStringRef v5 = &stru_10012F350;
    if (a3) {
      CFStringRef v5 = @"process=";
    }
    +[NSString stringWithFormat:@"%@%@[%i]", v5, self->_processName, self->_clientPID];
  id v6 = };
  return v6;
}

- (NSString)debugDescription
{
  id v3 = [(APSConnectionServer *)self processNameWithLabels:1];
  uint64_t v4 = objc_opt_class();
  if (self->_enableCriticalReliability) {
    CFStringRef v5 = "yes";
  }
  else {
    CFStringRef v5 = "no";
  }
  id v6 = APSPrettyPrintCollection();
  id v7 = APSPrettyPrintCollection();
  uint64_t v8 = APSPrettyPrintCollection();
  uint64_t v9 = APSPrettyPrintCollection();
  BOOL v10 = +[NSString stringWithFormat:@"<%@ %p: %@, criticalReliability=%s, enabledTopics=%@, ignoredTopics=%@, opportunisticTopics=%@, nonwakingTopics=%@>", v4, self, v3, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (id)aps_prettyDescription
{
  id v3 = [(APSConnectionServer *)self processNameWithLabels:1];
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  CFStringRef v5 = [(APSPayloadMessageStats *)self->_payloadMessageStats incomingCounts];
  id v6 = [v5 total];
  id v7 = [v6 count];

  if (v7)
  {
    uint64_t v8 = [(APSPayloadMessageStats *)self->_payloadMessageStats incomingCounts];
    uint64_t v9 = [(APSPayloadMessageStats *)self->_payloadMessageStats incomingCountsByTopic];
    BOOL v10 = sub_1000536B0((uint64_t)v9, v8, v9);
    [v4 setObject:v10 forKeyedSubscript:@"in"];
  }
  v11 = [(APSPayloadMessageStats *)self->_payloadMessageStats outgoingCounts];
  id v12 = [v11 total];
  id v13 = [v12 count];

  if (v13)
  {
    id v14 = [(APSPayloadMessageStats *)self->_payloadMessageStats outgoingCounts];
    id v15 = [(APSPayloadMessageStats *)self->_payloadMessageStats outgoingCountsByTopic];
    id v16 = sub_1000536B0((uint64_t)v15, v14, v15);
    [v4 setObject:v16 forKeyedSubscript:@"out"];
  }
  if (self->_enableCriticalReliability) {
    id v17 = "yes";
  }
  else {
    id v17 = "no";
  }
  id v18 = APSPrettyPrintCollection();
  id v19 = APSPrettyPrintCollection();
  v20 = APSPrettyPrintCollection();
  dispatch_block_t v21 = APSPrettyPrintCollection();
  id v22 = APSPrettyPrintCollection();
  id v23 = +[NSString stringWithFormat:@"<%@, criticalReliability=%s, enabledTopics=%@, ignoredTopics=%@, opportunisticTopics=%@, nonwakingTopics=%@, statistic=%@>", v3, v17, v18, v19, v20, v21, v22];

  return v23;
}

- (void)_migratePersistentTopicsIfNeeded
{
  id v18 = [(APSConnectionServer *)self user];
  if ([v18 isDefaultUser])
  {

    return;
  }
  connectionPortName = self->_connectionPortName;

  if (!connectionPortName) {
    return;
  }
  id v4 = [(APSConnectionServer *)self userPreferences];
  CFStringRef v5 = [v4 defaultUserPersistentTopics];

  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v7 = 0;
    goto LABEL_11;
  }
  id v6 = [v5 mutableCopy];
  id v7 = v6;
  if (!v6)
  {
LABEL_11:
    id v9 = 0;
    goto LABEL_12;
  }
  uint64_t v8 = [v6 objectForKey:self->_connectionPortName];
  id v9 = [v8 copy];

LABEL_12:
  [v7 removeObjectForKey:self->_connectionPortName];
  BOOL v10 = [(APSConnectionServer *)self userPreferences];
  [v10 setDefaultUserPersistentTopics:v7];

  if (v9)
  {
    v11 = [(APSConnectionServer *)self userPreferences];
    id v12 = [v11 persistentTopics];

    if (!v12
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (id v13 = [v12 mutableCopy]) == 0)
    {
      id v13 = objc_alloc_init((Class)NSMutableDictionary);
    }
    [v13 setObject:v9 forKey:self->_connectionPortName];
    id v14 = [(APSConnectionServer *)self userPreferences];
    [v14 setPersistentTopics:v13];

    id v15 = +[APSLog connectionServer];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = self->_connectionPortName;
      id v17 = [(APSConnectionServer *)self user];
      *(_DWORD *)buf = 138412802;
      v20 = self;
      __int16 v21 = 2112;
      id v22 = v16;
      __int16 v23 = 2112;
      v24 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ Migrate persistent topics for %@ from Default to %@", buf, 0x20u);
    }
  }
}

- (void)setUser:(id)a3
{
  if (self->_user != a3) {
    [(APSConnectionServer *)self _migratePersistentTopicsIfNeeded];
  }
}

- (void)setConnection:(id)a3
{
  CFStringRef v5 = (_xpc_connection_s *)a3;
  id v6 = [(APSConnectionServer *)self connection];
  id v7 = +[APSLog connectionServer];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    connectionPortName = self->_connectionPortName;
    LODWORD(v11[0]) = 138413058;
    *(void *)((char *)v11 + 4) = v6;
    WORD6(v11[0]) = 2112;
    *(void *)((char *)v11 + 14) = v5;
    WORD3(v11[1]) = 2112;
    *((void *)&v11[1] + 1) = self;
    __int16 v12 = 2112;
    id v13 = connectionPortName;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Replacing xpc conn %@ with %@ for %@ (%@)", (uint8_t *)v11, 0x2Au);
  }

  if (v6 != v5)
  {
    if (v6)
    {
      id v9 = +[APSLog connectionServer];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        sub_1000C8FF0();
      }

      xpc_connection_cancel(v6);
    }
    objc_storeStrong((id *)&self->_connection, a3);
    if (v5 && v6)
    {
      memset(v11, 0, sizeof(v11));
      xpc_connection_get_audit_token();
      if ([(NSSet *)self->_pushWakeTopics count] && !sub_10004AC5C(v11, APSPushWakeEntitlement)) {
        [(APSConnectionServer *)self setPushWakeTopics:0];
      }
      if ([(NSSet *)self->_ultraConstrainedTopics count] && !sub_10004AC5C(v11, APSUltraConstrainedEntitlement)) {
        [(APSConnectionServer *)self setUltraConstrainedTopics:0];
      }
    }
    else
    {
      BOOL v10 = +[APSLog connectionServer];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        sub_1000C8F7C();
      }
    }
    [(APSConnectionServer *)self _suspendQueue];
  }
}

- (void)connectionHandshakeDidComplete
{
  [(APSConnectionServer *)self _resumeQueue];
  id v3 = [(APSConnectionServer *)self connectionPortName];

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained connectionWasOpened:self];
  }
}

- (void)_resumeQueue
{
  queue = self->_queue;
  if (queue)
  {
    if (self->_isQueueSuspended)
    {
      dispatch_resume(queue);
      self->_isQueueSuspended = 0;
    }
  }
}

- (void)_suspendQueue
{
  queue = self->_queue;
  if (queue)
  {
    if (!self->_isQueueSuspended)
    {
      dispatch_suspend(queue);
      self->_isQueueSuspended = 1;
    }
  }
}

- (void)connectionInvalidated
{
  [(APSConnectionServer *)self close];
  if (!self->_connectionPortName)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained connectionWasClosed:self];
  }
}

- (id)connectionPortName
{
  return self->_connectionPortName;
}

- (void)handleConnectionStatusChanged:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000540C4;
  v3[3] = &unk_10012B408;
  BOOL v4 = a3;
  [(APSConnectionServer *)self _enqueueXPCMessage:v3 wakingClient:0 highPriority:0];
}

- (void)_initiateConnectionIfNecessary
{
  id v3 = [(APSConnectionServer *)self connection];

  if (!v3)
  {
    BOOL v4 = +[APSLog connectionServer];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      connectionPortName = self->_connectionPortName;
      *(_DWORD *)buf = 138412290;
      id v16 = (APSConnectionServer *)connectionPortName;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Pinging client via mach since we are not currently connected for port %@", buf, 0xCu);
    }

    if ([(NSString *)self->_connectionPortName length])
    {
      if (self->_connectionMachPort + 1 > 1)
      {
        BOOL v7 = 0;
      }
      else
      {
        id v6 = +[APSLog connectionServer];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Should've had a valid mach port but didn't, trying to create port.", buf, 2u);
        }

        [(APSConnectionServer *)self _lookUpMachPort];
        BOOL v7 = 1;
      }
      self->_freshMachPort = v7;
    }
    unsigned int connectionMachPort = self->_connectionMachPort;
    if (connectionMachPort - 1 > 0xFFFFFFFD)
    {
      BOOL v10 = +[APSLog connectionServer];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = self->_connectionPortName;
        *(_DWORD *)buf = 138412546;
        id v16 = self;
        __int16 v17 = 2112;
        id v18 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ Invalid mach port - Cleaning up this named port's topics. %@", buf, 0x16u);
      }

      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000546CC;
      v12[3] = &unk_10012A5E0;
      v12[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
    }
    else
    {
      id v9 = dispatch_queue_create("pingQueue", 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000543CC;
      block[3] = &unk_10012B430;
      unsigned int v14 = connectionMachPort;
      block[4] = self;
      dispatch_async(v9, block);
    }
  }
}

- (void)handleReceivedMessage:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000548FC;
  v7[3] = &unk_10012B458;
  id v4 = a3;
  id v8 = v4;
  -[APSConnectionServer _enqueueXPCMessage:wakingClient:highPriority:](self, "_enqueueXPCMessage:wakingClient:highPriority:", v7, 1, [v4 priority] == (id)10);
  CFStringRef v5 = +[APSLog PUSHTRACE];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 tracingUUID];
    *(_DWORD *)buf = 138412546;
    BOOL v10 = self;
    __int16 v11 = 2112;
    __int16 v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Sending push to client. UUID: %@", buf, 0x16u);
  }
  [(APSPayloadMessageStats *)self->_payloadMessageStats payloadMessageReceived:v4];
}

- (void)handleResult:(id)a3 forSendingOutgoingMessage:(id)a4
{
  id v6 = a4;
  id v10 = a3;
  id v7 = [v6 messageID];
  id v8 = [v6 sendRTT];
  id v9 = [v6 ackTimestamp];

  [(APSConnectionServer *)self handleResult:v10 forSendingOutgoingMessageWithID:v7 sendRTT:v8 ackTimestamp:v9];
}

- (void)handleResult:(id)a3 forSendingOutgoingMessageWithID:(unint64_t)a4
{
}

- (void)handleResult:(id)a3 forSendingOutgoingMessageWithID:(unint64_t)a4 sendRTT:(unint64_t)a5 ackTimestamp:(unint64_t)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  _OWORD v11[2] = sub_100054B30;
  v11[3] = &unk_10012B480;
  id v12 = a3;
  unint64_t v13 = a4;
  unint64_t v14 = a5;
  unint64_t v15 = a6;
  id v10 = v12;
  [(APSConnectionServer *)self _enqueueXPCMessage:v11 wakingClient:0 highPriority:1];
}

- (void)handleSendOutgoingMessage:(id)a3
{
  id v7 = a3;
  if (_os_feature_enabled_impl())
  {
    id v4 = [v7 topic];
    unsigned int v5 = [v4 isEqualToString:@"com.apple.private.alloy.facetime.multi"];

    if (v5)
    {
      [v7 identifier];
      kdebug_trace();
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained connection:self didReceiveOutgoingMessageToSend:v7];

  [(APSPayloadMessageStats *)self->_payloadMessageStats payloadMessageSent:v7];
}

- (void)handleCancelOutgoingMessageWithID:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained connection:self didReceiveCancellationForOutgoingMessageWithID:a3];
}

- (void)handleFakeMessage:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained connection:self didReceiveFakeMessageToSend:v5];
}

- (void)handleRequestPerAppTokenForTopic:(id)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)APSAppTokenInfo) initUnextendedAppTokenWithTopic:v7 identifier:v6];

  [(APSConnectionServer *)self _handleRequestTokenForInfo:v8];
}

- (void)handleRequestTokenForInfo:(id)a3
{
  id v4 = a3;
  id v5 = +[APSLog connectionServer];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Received extended app token request for info %@", (uint8_t *)&v6, 0x16u);
  }

  [(APSConnectionServer *)self _handleRequestTokenForInfo:v4];
}

- (void)handleRequestURLTokenForInfo:(id)a3
{
  id v4 = a3;
  id v5 = +[APSLog connectionServer];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Received web token request for info %@", (uint8_t *)&v6, 0x16u);
  }

  [(APSConnectionServer *)self _handleRequestTokenForInfo:v4];
}

- (void)_handleRequestTokenForInfo:(id)a3
{
  id v4 = a3;
  [(APSConnectionServer *)self _savePersistentConnectionTopics];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained connection:self didRequestTokenForInfo:v4];
}

- (void)handleReceivedToken:(id)a3 forInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = +[APSLog connectionServer];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 debugDescription];
    int v10 = 138412802;
    __int16 v11 = self;
    __int16 v12 = 2112;
    unint64_t v13 = v9;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: Received token %@ for info %@", (uint8_t *)&v10, 0x20u);
  }
  [(APSConnectionServer *)self _sendClientToken:v6 forInfo:v7];
}

- (void)handleReceivedTokenError:(id)a3 forInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 type] == (id)2)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10005523C;
    v8[3] = &unk_10012B4A8;
    id v9 = v7;
    id v10 = v6;
    [(APSConnectionServer *)self _enqueueXPCMessage:v8 wakingClient:1 highPriority:0];
  }
}

- (void)handleCurrentTokenForInfo:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained connection:self didRequestCurrentTokenForInfo:v5];
}

- (void)handleCurrentURLTokenForInfo:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained connection:self didRequestCurrentTokenForInfo:v5];
}

- (void)_sendClientToken:(id)a3 forInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 type];
  if (v8 == (id)2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    __int16 v11 = [WeakRetained connection:self createURLTokenForToken:v6];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10005578C;
    v12[3] = &unk_10012B4A8;
    id v13 = v7;
    id v14 = v11;
    id v9 = v11;
    [(APSConnectionServer *)self _enqueueXPCMessage:v12 wakingClient:1 highPriority:0];

    goto LABEL_7;
  }
  if (v8 == (id)1)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000556C8;
    v15[3] = &unk_10012B4A8;
    id v16 = v7;
    id v17 = v6;
    [(APSConnectionServer *)self _enqueueXPCMessage:v15 wakingClient:1 highPriority:0];

    id v9 = v16;
    goto LABEL_7;
  }
  if (!v8)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000555F4;
    v18[3] = &unk_10012B4A8;
    id v19 = v7;
    id v20 = v6;
    [(APSConnectionServer *)self _enqueueXPCMessage:v18 wakingClient:1 highPriority:0];

    id v9 = v19;
LABEL_7:
  }
}

- (void)handleInvalidatePerAppTokenForTopic:(id)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)APSAppTokenInfo) initUnextendedAppTokenWithTopic:v7 identifier:v6];

  [(APSConnectionServer *)self _handleInvalidateTokenForInfo:v8];
}

- (void)handleInvalidateURLTokenForTopic:(id)a3
{
  id v4 = a3;
  id v5 = +[APSLog connectionServer];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Received web token invalidate request for topic %@", (uint8_t *)&v7, 0x16u);
  }

  id v6 = [objc_alloc((Class)APSURLTokenInfo) initWithTopic:v4];
  [(APSConnectionServer *)self _handleInvalidateTokenForInfo:v6];
}

- (void)handleInvalidatePerAppTokenForInfo:(id)a3
{
  id v4 = a3;
  id v5 = +[APSLog connectionServer];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    int v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Received extended app token invalidate request for info %@", (uint8_t *)&v6, 0x16u);
  }

  [(APSConnectionServer *)self _handleInvalidateTokenForInfo:v4];
}

- (void)_handleInvalidateTokenForInfo:(id)a3
{
  id v4 = a3;
  [(APSConnectionServer *)self _savePersistentConnectionTopics];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained connection:self didInvalidateTokenForInfo:v4];
}

- (void)handleSubscribeToChannels:(id)a3 forTopic:(id)a4
{
  p_delegate = &self->_delegate;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained connection:self didReceiveSubscribeToChannels:v8 forTopic:v7];
}

- (void)handleUnsubscribeFromChannels:(id)a3 forTopic:(id)a4
{
  p_delegate = &self->_delegate;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained connection:self didReceiveUnsubscribeToChannels:v8 forTopic:v7];
}

- (void)handleIncomingMessageReceiptWithTopic:(id)a3 tracingUUID:(id)a4
{
  p_delegate = &self->_delegate;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained connection:self didReceiveIncomingMessageReceiptWithTopic:v8 tracingUUID:v7];
}

- (void)handleAckIncomingMessageWithGuid:(id)a3 topic:(id)a4 tracingUUID:(id)a5
{
  p_delegate = &self->_delegate;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained connection:self handleAckIncomingMessageWithGuid:v11 topic:v10 tracingUUID:v9];
}

- (void)setPublicToken:(id)a3 needsAck:(BOOL)a4
{
  int v6 = (NSData *)a3;
  id v7 = v6;
  publicToken = self->_publicToken;
  if (publicToken == v6 || publicToken && -[NSData isEqualToData:](v6, "isEqualToData:"))
  {
    char v9 = 0;
    if (a4) {
      goto LABEL_12;
    }
  }
  else
  {
    id v10 = (NSData *)[(NSData *)v7 copy];
    id v11 = self->_publicToken;
    self->_publicToken = v10;

    char v9 = 1;
    if (a4)
    {
LABEL_12:
      BOOL v13 = 1;
LABEL_13:
      id v15 = [(NSData *)self->_publicToken copy];
      id v16 = +[CUTWeakReference weakRefWithObject:self];
      [(APSConnectionServer *)self setIsPublicTokenAcknowledged:0];
      id v20 = v16;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100055F08;
      v21[3] = &unk_10012B458;
      id v22 = v15;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100055F8C;
      v19[3] = &unk_10012B458;
      id v17 = v16;
      id v18 = v15;
      [(APSConnectionServer *)self _enqueueXPCMessage:v21 wakingClient:v13 highPriority:1 withReply:v19];

      goto LABEL_14;
    }
  }
  if (!self->_isPublicTokenAcknowledged) {
    goto LABEL_12;
  }
  __int16 v12 = [(APSConnectionServer *)self connection];

  BOOL v13 = !self->_isPublicTokenAcknowledged;
  char v14 = v9 ^ 1;
  if (!v12) {
    char v14 = 1;
  }
  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_14:
}

- (double)publicTokenDeliveryDelay
{
  return 60.0;
}

- (void)handlePublicTokenDeliveryReply:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    xpc_type_t type = xpc_get_type(v4);
    if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      char v14 = APSGetXPCDataFromDictionary();
      [(APSConnectionServer *)self acknowledgeDidReceivePublicToken:v14];

      [(APSConnectionServer *)self isPublicTokenAcknowledged];
      goto LABEL_11;
    }
    xpc_type_t v7 = type;
    id v8 = +[APSLog connectionServer];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      char v9 = [(APSConnectionServer *)self connectionPortName];
      id v10 = [(APSConnectionServer *)self publicToken];
      int v15 = 138413058;
      xpc_type_t v16 = v7;
      __int16 v17 = 2112;
      id v18 = v9;
      __int16 v19 = 2112;
      int64_t v20 = (int64_t)v10;
      __int16 v21 = 2048;
      int64_t v22 = [(APSConnectionServer *)self publicTokenDeliveryRetries];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received %@ when updating public token. {connectionPort:%@, token: %@, retries: %ld}", (uint8_t *)&v15, 0x2Au);
    }
  }
  else
  {
    id v8 = +[APSLog connectionServer];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(APSConnectionServer *)self connectionPortName];
      __int16 v12 = [(APSConnectionServer *)self publicToken];
      int v15 = 138412802;
      xpc_type_t v16 = v11;
      __int16 v17 = 2112;
      id v18 = v12;
      __int16 v19 = 2048;
      int64_t v20 = [(APSConnectionServer *)self publicTokenDeliveryRetries];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No reply received when updating public token. {connectionPort:%@, token: %@, retries: %ld}", (uint8_t *)&v15, 0x20u);
    }
  }

  uint64_t v13 = [(APSConnectionServer *)self publicTokenDeliveryRetries];
  if (![(APSConnectionServer *)self isPublicTokenAcknowledged] && v13 <= 2)
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_redeliverCurrentPublicToken" object:0];
    [(APSConnectionServer *)self publicTokenDeliveryDelay];
    -[APSConnectionServer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_redeliverCurrentPublicToken", 0);
  }
LABEL_11:
}

- (void)_redeliverCurrentPublicToken
{
  id v3 = +[APSLog connectionServer];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ scheduled public token delivery", (uint8_t *)&v4, 0xCu);
  }

  if (![(APSConnectionServer *)self isClosed]
    && [(APSConnectionServer *)self publicTokenDeliveryRetries] <= 2
    && ![(APSConnectionServer *)self isPublicTokenAcknowledged])
  {
    ++self->_publicTokenDeliveryRetries;
    [(APSConnectionServer *)self setPublicToken:self->_publicToken needsAck:1];
  }
}

- (void)setIsPublicTokenAcknowledged:(BOOL)a3
{
  connectionPortName = self->_connectionPortName;
  if (connectionPortName && (BOOL v5 = a3, [(NSString *)connectionPortName length]))
  {
    if (self->_isPublicTokenAcknowledged != v5)
    {
      self->_isPublicTokenAcknowledged = v5;
      if (v5) {
        self->_publicTokenDeliveryRetries = 0;
      }
      [(APSConnectionServer *)self _savePersistentConnectionTopics];
    }
  }
  else
  {
    self->_isPublicTokenAcknowledged = 1;
  }
}

- (BOOL)isPublicTokenAcknowledged
{
  connectionPortName = self->_connectionPortName;
  return !connectionPortName || ![(NSString *)connectionPortName length] || self->_isPublicTokenAcknowledged;
}

- (void)acknowledgeDidReceivePublicToken:(id)a3
{
  id v4 = a3;
  connectionPortName = self->_connectionPortName;
  if (!connectionPortName || (NSUInteger v6 = [(NSString *)connectionPortName length], !v4) || !v6)
  {
    char v9 = +[APSLog connectionServer];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      processName = self->_processName;
      int v12 = 138412290;
      uint64_t v13 = (APSConnectionServer *)processName;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Ignoring token acknowledgement from %@", (uint8_t *)&v12, 0xCu);
    }
    goto LABEL_12;
  }
  unsigned int v7 = [(NSData *)self->_publicToken isEqualToData:v4];
  id v8 = +[APSLog connectionServer];
  char v9 = v8;
  if (!v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000C91A0((uint64_t *)&self->_connectionPortName, v9);
    }
LABEL_12:

    goto LABEL_13;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = self->_connectionPortName;
    int v12 = 138412546;
    uint64_t v13 = self;
    __int16 v14 = 2112;
    int v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: Token acknowledged by %@", (uint8_t *)&v12, 0x16u);
  }

  [(APSConnectionServer *)self setIsPublicTokenAcknowledged:1];
LABEL_13:
}

- (void)setMessageSize:(unint64_t)a3
{
  if (self->_messageSize != a3)
  {
    self->_messageSize = a3;
    uint64_t v5 = [(APSConnectionServer *)self connectionPortName];
    if (v5)
    {
      NSUInteger v6 = (void *)v5;
      unsigned int v7 = [(APSConnectionServer *)self enabledTopics];
      if (![v7 count])
      {
        id v8 = [(APSConnectionServer *)self opportunisticTopics];
        if (![v8 count])
        {
          id v10 = [(APSConnectionServer *)self ignoredTopics];
          id v11 = [v10 count];

          if (!v11) {
            return;
          }
          goto LABEL_7;
        }
      }
    }
LABEL_7:
    unint64_t largeMessageSize = self->_largeMessageSize;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000566C4;
    v12[3] = &unk_10012B4C8;
    void v12[4] = a3;
    void v12[5] = largeMessageSize;
    [(APSConnectionServer *)self _enqueueXPCMessage:v12 wakingClient:0 highPriority:0];
  }
}

- (void)setLargeMessageSize:(unint64_t)a3
{
  if (self->_largeMessageSize != a3)
  {
    self->_unint64_t largeMessageSize = a3;
    uint64_t v5 = [(APSConnectionServer *)self connectionPortName];
    if (v5)
    {
      NSUInteger v6 = (void *)v5;
      unsigned int v7 = [(APSConnectionServer *)self enabledTopics];
      if (![v7 count])
      {
        id v8 = [(APSConnectionServer *)self opportunisticTopics];
        if (![v8 count])
        {
          id v10 = [(APSConnectionServer *)self ignoredTopics];
          id v11 = [v10 count];

          if (!v11) {
            return;
          }
          goto LABEL_7;
        }
      }
    }
LABEL_7:
    unint64_t messageSize = self->_messageSize;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100056890;
    v12[3] = &unk_10012B4C8;
    void v12[4] = messageSize;
    void v12[5] = a3;
    [(APSConnectionServer *)self _enqueueXPCMessage:v12 wakingClient:0 highPriority:0];
  }
}

- (void)handleChannelSubscriptionFailures:(id)a3 forTopic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[APSLog connectionServer];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    int v15 = self;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ Sending failures %@ to client", buf, 0x16u);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  _OWORD v11[2] = sub_100056A84;
  v11[3] = &unk_10012B4A8;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [(APSConnectionServer *)self _enqueueXPCMessage:v11 wakingClient:1 highPriority:0];
}

- (void)_warnIfOverlappingTopics:(id)a3 againstTopics:(id)a4 string:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v19 = a5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = [v8 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v21;
    *(void *)&long long v11 = 138412802;
    long long v18 = v11;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v9, "containsObject:", v15, v18))
        {
          __int16 v16 = self->_processName;
          if (!v16) {
            __int16 v16 = self->_connectionPortName;
          }
          id v17 = +[APSLog connectionServer];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v18;
            dispatch_queue_t v25 = v16;
            __int16 v26 = 2112;
            uint64_t v27 = v15;
            __int16 v28 = 2112;
            id v29 = v19;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Received request from %@ to put topic %@ into both %@ topic sets", buf, 0x20u);
          }
        }
      }
      id v12 = [v8 countByEnumeratingWithState:&v20 objects:v30 count:16];
    }
    while (v12);
  }
}

- (void)_informTopicManagerOfChangedFilter:(int64_t)a3 newTopics:(id)a4 oldTopics:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v8)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    id v8 = +[NSMutableSet setWithCapacity:0];
    if (v7) {
      goto LABEL_3;
    }
  }
  id v7 = +[NSMutableSet setWithCapacity:0];
LABEL_3:
  id v9 = [v8 mutableCopy];
  [v9 minusSet:v7];
  id v10 = [v7 mutableCopy];
  [v10 minusSet:v8];
  long long v11 = [(APSConnectionServer *)self delegate];
  id v12 = [v11 topicManager];

  [v12 removeTopics:v9 connectionServer:self filter:a3];
  if ([v10 count])
  {
    __int16 v26 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v10 count]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = v10;
    id v13 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v13)
    {
      id v14 = v13;
      long long v20 = v12;
      id v21 = v10;
      id v22 = v9;
      id v23 = v8;
      id v24 = v7;
      uint64_t v15 = 0;
      uint64_t v16 = *(void *)v29;
      do
      {
        id v17 = 0;
        long long v18 = v15;
        do
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v28 + 1) + 8 * (void)v17);
          uint64_t v15 = +[APSTopicAttributes topicAttributesWithFilter:darkWakeEnabled:pushWakeEnabled:criticalWakeEnabled:ultraConstrainedEnabled:](APSTopicAttributes, "topicAttributesWithFilter:darkWakeEnabled:pushWakeEnabled:criticalWakeEnabled:ultraConstrainedEnabled:", a3, -[NSSet containsObject:](self->_darkWakeTopics, "containsObject:", v19, v20, v21, v22, v23, v24), [(NSSet *)self->_pushWakeTopics containsObject:v19], [(NSSet *)self->_criticalWakeTopics containsObject:v19], [(NSSet *)self->_ultraConstrainedTopics containsObject:v19]);

          [v26 setObject:v15 forKey:v19];
          id v17 = (char *)v17 + 1;
          long long v18 = v15;
        }
        while (v14 != v17);
        id v14 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v14);

      id v8 = v23;
      id v7 = v24;
      id v10 = v21;
      id v9 = v22;
      id v12 = v20;
    }

    [v12 addTopicsAndAttributes:v26 connectionServer:self];
  }
}

- (BOOL)_containsInvalidTopic:(id)a3
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "length", (void)v8))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (void)setEnabledTopics:(id)a3 ignoredTopics:(id)a4 opportunisticTopics:(id)a5 nonWakingTopics:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [(APSConnectionServer *)self _warnIfOverlappingTopics:v10 againstTopics:v12 string:@"enabled and opportunistic"];
  [(APSConnectionServer *)self _warnIfOverlappingTopics:v10 againstTopics:v11 string:@"enabled and ignored"];
  [(APSConnectionServer *)self _warnIfOverlappingTopics:v11 againstTopics:v12 string:@"ignored and opportunistic"];
  [(APSConnectionServer *)self _warnIfOverlappingTopics:v10 againstTopics:v13 string:@"enabled and nonWaking"];
  [(APSConnectionServer *)self _warnIfOverlappingTopics:v11 againstTopics:v13 string:@"ignored and nonWaking"];
  [(APSConnectionServer *)self _warnIfOverlappingTopics:v12 againstTopics:v13 string:@"opportunistic and nonWaking"];
  id v14 = [(APSConnectionServer *)self delegate];
  uint64_t v15 = [v14 topicManager];
  [v15 beginTransaction];

  if (v10)
  {
    if (sub_10007DFBC(v10, self->_enabledTopics))
    {
      int v16 = 0;
      id v17 = v10;
      if (!v12) {
        goto LABEL_28;
      }
    }
    else
    {
      uint64_t v19 = +[APSLog connectionServer];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        APSPrettyPrintCollection();
        long long v20 = (NSSet *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v56 = self;
        __int16 v57 = 2112;
        v58 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@: connection set enabled topics %@", buf, 0x16u);
      }
      id v54 = 0;
      id v17 = [(APSConnectionServer *)self entitledTopicsFromSet:v10 unentitledTopics:&v54];
      id v21 = v54;

      if (![v17 count] && objc_msgSend(v21, "count")
        || [(APSConnectionServer *)self _containsInvalidTopic:v17])
      {
        p_super = +[APSLog connectionServer];
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT)) {
          sub_1000C94C8((uint64_t)v17);
        }
        int v16 = 0;
      }
      else
      {
        int v16 = 1;
        [(APSConnectionServer *)self _informTopicManagerOfChangedFilter:1 newTopics:v17 oldTopics:self->_enabledTopics];
        id v22 = v17;
        p_super = &self->_enabledTopics->super;
        self->_enabledTopics = v22;
      }

      if ([v21 count])
      {
        long long v29 = +[APSLog connectionServer];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
          sub_1000C9454((uint64_t)self);
        }
      }
      if (!v12)
      {
LABEL_28:
        long long v18 = 0;
        if (v11) {
          goto LABEL_29;
        }
        goto LABEL_47;
      }
    }
  }
  else
  {
    int v16 = 0;
    id v17 = 0;
    if (!v12) {
      goto LABEL_28;
    }
  }
  if (sub_10007DFBC(v12, self->_opportunisticTopics))
  {
    long long v18 = v12;
    if (v11) {
      goto LABEL_29;
    }
  }
  else
  {
    id v24 = +[APSLog connectionServer];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      APSPrettyPrintCollection();
      dispatch_queue_t v25 = (NSSet *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v56 = self;
      __int16 v57 = 2112;
      v58 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%@: connection set opportuntistic topics %@", buf, 0x16u);
    }
    id v53 = 0;
    long long v18 = [(APSConnectionServer *)self entitledTopicsFromSet:v12 unentitledTopics:&v53];
    id v26 = v53;

    if (![v18 count] && objc_msgSend(v26, "count")
      || [(APSConnectionServer *)self _containsInvalidTopic:v18])
    {
      long long v28 = +[APSLog connectionServer];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
        sub_1000C93E4((uint64_t)v18);
      }
    }
    else
    {
      [(APSConnectionServer *)self _informTopicManagerOfChangedFilter:2 newTopics:v18 oldTopics:self->_opportunisticTopics];
      uint64_t v27 = v18;
      long long v28 = &self->_opportunisticTopics->super;
      self->_opportunisticTopics = v27;
      int v16 = 1;
    }

    if ([v26 count])
    {
      objc_super v40 = +[APSLog connectionServer];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
        sub_1000C9370((uint64_t)self);
      }
    }
    if (v11)
    {
LABEL_29:
      if (sub_10007DFBC(v11, self->_ignoredTopics))
      {
        int v30 = 0;
        long long v31 = v11;
        if (!v13) {
          goto LABEL_64;
        }
      }
      else
      {
        v32 = &objc_retain_x28_ptr;
        __int16 v33 = +[APSLog connectionServer];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          APSPrettyPrintCollection();
          unint64_t v34 = (NSSet *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v56 = self;
          __int16 v57 = 2112;
          v58 = v34;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%@: connection set ignored topics %@", buf, 0x16u);
        }
        id v52 = 0;
        long long v31 = [(APSConnectionServer *)self entitledTopicsFromSet:v11 unentitledTopics:&v52];
        id v35 = v52;

        if (![v31 count] && objc_msgSend(v35, "count")
          || [(APSConnectionServer *)self _containsInvalidTopic:v31])
        {
          id v38 = +[APSLog connectionServer];
          if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
            sub_1000C9300((uint64_t)v31);
          }
          int v30 = 0;
        }
        else
        {
          [(APSConnectionServer *)self _informTopicManagerOfChangedFilter:3 newTopics:v31 oldTopics:self->_ignoredTopics];
          id v36 = +[APSLog connectionServer];
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            ignoredTopics = self->_ignoredTopics;
            *(_DWORD *)buf = 138412802;
            v56 = self;
            __int16 v57 = 2112;
            v58 = ignoredTopics;
            __int16 v59 = 2112;
            v60 = v31;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%@: connection set ignored topics from %@ to %@", buf, 0x20u);
          }

          id v38 = [(NSSet *)self->_ignoredTopics mutableCopy];
          [v38 minusSet:v31];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          [WeakRetained connection:self subscribeToPreviouslyIgnoredTopics:v38];

          objc_storeStrong((id *)&self->_ignoredTopics, v31);
          int v30 = 1;
          v32 = &objc_retain_x28_ptr;
        }

        if ([v35 count])
        {
          __int16 v47 = [v32[147] connectionServer];
          if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT)) {
            sub_1000C928C((uint64_t)self);
          }
        }
        if (!v13) {
          goto LABEL_64;
        }
      }
      goto LABEL_48;
    }
  }
LABEL_47:
  int v30 = 0;
  long long v31 = 0;
  if (!v13)
  {
LABEL_64:
    v41 = 0;
    goto LABEL_69;
  }
LABEL_48:
  if (sub_10007DFBC(v13, self->_nonWakingTopics))
  {
    v41 = v13;
  }
  else
  {
    v42 = +[APSLog connectionServer];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      APSPrettyPrintCollection();
      __int16 v43 = (NSSet *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v56 = self;
      __int16 v57 = 2112;
      v58 = v43;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%@: connection set nonWaking topics %@", buf, 0x16u);
    }
    id v51 = 0;
    v41 = [(APSConnectionServer *)self entitledTopicsFromSet:v13 unentitledTopics:&v51];
    id v44 = v51;

    if (![v41 count] && objc_msgSend(v44, "count")
      || [(APSConnectionServer *)self _containsInvalidTopic:v41])
    {
      id v46 = +[APSLog connectionServer];
      if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT)) {
        sub_1000C921C((uint64_t)v41);
      }
    }
    else
    {
      [(APSConnectionServer *)self _informTopicManagerOfChangedFilter:4 newTopics:v41 oldTopics:self->_nonWakingTopics];
      __int16 v45 = v41;
      id v46 = &self->_nonWakingTopics->super;
      self->_nonWakingTopics = v45;
      int v16 = 1;
    }
  }
LABEL_69:
  id v48 = [(APSConnectionServer *)self delegate];
  v49 = [v48 topicManager];
  [v49 endTransaction];

  if (self->_enableDarkWake && !self->_hasChosenDarkWakeTopics)
  {
    id v50 = objc_alloc_init((Class)NSMutableSet);
    [v50 unionSet:self->_enabledTopics];
    [v50 unionSet:self->_opportunisticTopics];
    [v50 unionSet:self->_ignoredTopics];
    [v50 unionSet:self->_nonWakingTopics];
  }
  if ((v30 | v16) == 1) {
    [(APSConnectionServer *)self saveAndUpdateDelegate];
  }
}

- (void)saveAndUpdateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained connectionTopicsChanged:self];

  [(APSConnectionServer *)self _savePersistentConnectionTopics];
}

- (BOOL)isConnected
{
  v2 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v2) = [WeakRetained connectionDelegateIsConnectedToService:v2];

  return (char)v2;
}

- (void)setEnableCriticalReliability:(BOOL)a3
{
  self->_enableCriticalReliability = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained connectionChangedCriticalReliability:self];
}

- (void)setTrackActivityPresence:(BOOL)a3
{
  self->_trackActivityPresence = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained connectionChangedTrackActivityPresence:self];
}

- (void)setEnableStatusChangeNotifications:(BOOL)a3
{
  if (self->_enableStatusChangeNotifications != a3)
  {
    BOOL v3 = a3;
    self->_enableStatusChangeNotifications = a3;
    uint64_t v5 = +[APSLog connectionServer];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v6 = @"Disabling";
      if (v3) {
        CFStringRef v6 = @"Enabling";
      }
      int v7 = 138412546;
      long long v8 = self;
      __int16 v9 = 2112;
      CFStringRef v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: %@ status notifications for connection", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)_savePersistentConnectionTopics
{
}

- (void)_savePersistentConnection
{
  if (self->_connectionPortName)
  {
    BOOL v3 = [(APSConnectionServer *)self userPreferences];
    id v4 = [v3 persistentTopics];

    if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || (id v5 = [v4 mutableCopy]) == 0) {
      id v5 = objc_alloc_init((Class)NSMutableDictionary);
    }
    id v22 = v5;
    if ([(NSSet *)self->_enabledTopics count]
      || [(NSSet *)self->_ignoredTopics count]
      || [(NSSet *)self->_opportunisticTopics count]
      || [(NSSet *)self->_nonWakingTopics count])
    {
      id v6 = objc_alloc_init((Class)NSMutableDictionary);
      if ([(NSSet *)self->_enabledTopics count])
      {
        int v7 = [(NSSet *)self->_enabledTopics allObjects];
        [v6 setObject:v7 forKey:@"enabled"];
      }
      if ([(NSSet *)self->_nonWakingTopics count])
      {
        id v8 = [(NSSet *)self->_nonWakingTopics mutableCopy];
        [v8 minusSet:self->_enabledTopics];
        __int16 v9 = [v8 allObjects];
        [v6 setObject:v9 forKey:@"nonWaking"];
      }
      if ([(NSSet *)self->_opportunisticTopics count])
      {
        id v10 = [(NSSet *)self->_opportunisticTopics mutableCopy];
        [v10 minusSet:self->_enabledTopics];
        [v10 minusSet:self->_nonWakingTopics];
        id v11 = [v10 allObjects];
        [v6 setObject:v11 forKey:@"opportunistic"];
      }
      if ([(NSSet *)self->_ignoredTopics count])
      {
        id v12 = [(NSSet *)self->_ignoredTopics mutableCopy];
        [v12 minusSet:self->_enabledTopics];
        [v12 minusSet:self->_opportunisticTopics];
        [v12 minusSet:self->_nonWakingTopics];
        id v13 = [v12 allObjects];
        [v6 setObject:v13 forKey:@"ignored"];
      }
      [v6 setObject:self->_environmentName forKey:@"environment"];
      processName = self->_processName;
      if (processName) {
        [v6 setObject:processName forKey:@"processName"];
      }
      uint64_t v15 = +[NSNumber numberWithBool:self->_isPublicTokenAcknowledged];
      [v6 setObject:v15 forKey:@"tokenAcked"];

      int v16 = +[NSNumber numberWithBool:self->_enableDarkWake];
      [v6 setObject:v16 forKey:@"darkWakeEnabled"];

      if ([(NSSet *)self->_pushWakeTopics count])
      {
        id v17 = [(NSSet *)self->_pushWakeTopics allObjects];
        [v6 setObject:v17 forKey:@"pushWake"];
      }
      if ([(NSSet *)self->_ultraConstrainedTopics count])
      {
        long long v18 = [(NSSet *)self->_ultraConstrainedTopics allObjects];
        [v6 setObject:v18 forKey:@"ultraConstrained"];
      }
      if (self->_enableStatusChangeNotifications)
      {
        uint64_t v19 = +[NSNumber numberWithBool:1];
        [v6 setObject:v19 forKey:@"enableStatusUpdates"];
      }
      [v22 setObject:v6 forKey:self->_connectionPortName];
    }
    else
    {
      [v22 removeObjectForKey:self->_connectionPortName];
    }
    id v21 = [(APSConnectionServer *)self userPreferences];
    [v21 setPersistentTopics:v22];
  }
}

+ (id)environmentForNamedPort:(id)a3 userPreferences:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = +[APSLog connectionServer];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412546;
    id v19 = v5;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "environmentForNamedPort called for port %@ from user preferences %@", (uint8_t *)&v18, 0x16u);
  }

  id v8 = [v6 persistentTopics];
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v14 = 0;
    goto LABEL_18;
  }
  __int16 v9 = [v8 objectForKey:v5];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [v9 objectForKey:@"enabled"];
      if ([v10 count])
      {
LABEL_10:

LABEL_11:
        id v12 = [v9 objectForKey:@"environment"];
        id v13 = +[APSLog connectionServer];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 138412546;
          id v19 = v12;
          __int16 v20 = 2112;
          id v21 = v6;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Found persistent connection in environment %@ from user preferences %@", (uint8_t *)&v18, 0x16u);
        }

        goto LABEL_17;
      }
      id v11 = [v9 objectForKey:@"opportunistic"];
      if ([v11 count])
      {

        goto LABEL_10;
      }
      uint64_t v15 = [v9 objectForKey:@"ignored"];
      id v16 = [v15 count];

      if (v16) {
        goto LABEL_11;
      }
    }
  }
  id v12 = 0;
LABEL_17:
  id v14 = v12;

LABEL_18:
  return v14;
}

- (void)setPushWakeTopics:(id)a3
{
  id v4 = a3;
  if (self->_enableDarkWake)
  {
    id v5 = [(APSConnectionServer *)self connection];
    if (v5)
    {
      memset(buf, 0, 32);
      xpc_connection_get_audit_token();
      if (!sub_10004AC5C(buf, APSPushWakeEntitlement))
      {

        id v6 = +[APSLog connectionServer];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
          sub_1000C95D8(v5);
        }

        id v4 = 0;
      }
    }
    if ((sub_10007DFBC(self->_pushWakeTopics, v4) & 1) == 0)
    {
      int v7 = [(APSConnectionServer *)self delegate];
      id v8 = [v7 topicManager];

      __int16 v9 = +[APSLog connectionServer];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = APSPrettyPrintCollection();
        id v11 = APSPrettyPrintCollection();
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v10;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&buf[24] = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: connection set push wake topics from %@ to %@", buf, 0x20u);
      }
      objc_storeStrong((id *)&self->_pushWakeTopics, v4);
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v12 = [v8 topicStatesForConnectionServer:self];
      id v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v13)
      {
        id v14 = v13;
        dispatch_queue_t v25 = v8;
        id v26 = v5;
        char v15 = 0;
        uint64_t v16 = *(void *)v28;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v28 != v16) {
              objc_enumerationMutation(v12);
            }
            int v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            id v19 = objc_msgSend(v18, "topicName", v25, v26);
            __int16 v20 = [v18 attributes];
            id v21 = [v4 containsObject:v19];
            if (v21 != [v20 isPushWakeEnabled])
            {
              [v20 setPushWakeEnabled:v21];
              char v15 = 1;
            }
          }
          id v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v14);

        [(APSConnectionServer *)self _savePersistentConnectionTopics];
        id v8 = v25;
        id v5 = v26;
        if (v15)
        {
          id v22 = [(APSConnectionServer *)self delegate];
          id v23 = [v22 topicManager];
          id v24 = [v23 policy];
          [v24 filtersWillPotentiallyBeChangedBy:self];
        }
      }
      else
      {

        [(APSConnectionServer *)self _savePersistentConnectionTopics];
      }
    }
  }
  else
  {
    id v5 = +[APSLog connectionServer];
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_FAULT)) {
      sub_1000C9538((uint64_t)v4, v5);
    }
  }
}

- (void)setUltraConstrainedTopics:(id)a3
{
  id v4 = a3;
  id v5 = [(APSConnectionServer *)self connection];
  if (v5)
  {
    memset(buf, 0, 32);
    xpc_connection_get_audit_token();
    if (!sub_10004AC5C(buf, APSUltraConstrainedEntitlement))
    {

      id v6 = +[APSLog connectionServer];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        sub_1000C9654(v5);
      }

      id v4 = 0;
    }
  }
  if ((sub_10007DFBC(self->_ultraConstrainedTopics, v4) & 1) == 0)
  {
    int v7 = [(APSConnectionServer *)self delegate];
    id v8 = [v7 topicManager];

    __int16 v9 = +[APSLog connectionServer];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = APSPrettyPrintCollection();
      id v11 = APSPrettyPrintCollection();
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: connection set ultra constrained topics from %@ to %@", buf, 0x20u);
    }
    objc_storeStrong((id *)&self->_ultraConstrainedTopics, v4);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v12 = [v8 topicStatesForConnectionServer:self];
    id v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v13)
    {
      id v14 = v13;
      dispatch_queue_t v25 = v8;
      id v26 = v5;
      char v15 = 0;
      uint64_t v16 = *(void *)v28;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v12);
          }
          int v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v19 = objc_msgSend(v18, "topicName", v25, v26);
          __int16 v20 = [v18 attributes];
          id v21 = [v4 containsObject:v19];
          if (v21 != [v20 isUltraConstrainedEnabled])
          {
            [v20 setUltraConstrainedEnabled:v21];
            char v15 = 1;
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v14);

      [(APSConnectionServer *)self _savePersistentConnectionTopics];
      id v8 = v25;
      id v5 = v26;
      if (v15)
      {
        id v22 = [(APSConnectionServer *)self delegate];
        id v23 = [v22 topicManager];
        id v24 = [v23 policy];
        [v24 filtersWillPotentiallyBeChangedBy:self];
      }
    }
    else
    {

      [(APSConnectionServer *)self _savePersistentConnectionTopics];
    }
  }
}

- (void)setKeepAliveConfiguration:(unint64_t)a3
{
  id v5 = [(APSConnectionServer *)self delegate];
  [v5 connection:self setKeepAliveConfiguration:a3];
}

- (id)entitledTopicsFromSet:(id)a3 unentitledTopics:(id *)a4
{
  id v4 = a3;
  return v4;
}

- (void)handleNotificationAcknowledged
{
  atomic_fetch_add(&self->_numberNotificationsAcknowledged, 1uLL);
  +[NSDate timeIntervalSinceReferenceDate];
  self->_lastNotificationAcknowledgedTime = v3;
}

- (id)JSONDebugState
{
  v34[0] = @"statusChangeNotifications";
  double v3 = +[NSNumber numberWithBool:self->_enableStatusChangeNotifications];
  v34[1] = @"trackAcitivityPresence";
  v35[0] = v3;
  id v4 = +[NSNumber numberWithBool:self->_trackActivityPresence];
  v35[1] = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
  id v6 = [v5 mutableCopy];

  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  id v8 = v7;
  connectionPortName = self->_connectionPortName;
  if (connectionPortName)
  {
    [v7 setObject:connectionPortName forKeyedSubscript:@"portName"];
    processName = self->_processName;
    if (processName) {
      [v8 setObject:processName forKeyedSubscript:@"processName"];
    }
  }
  else
  {
    id v11 = self->_processName;
    if (v11)
    {
      [v7 setObject:v11 forKeyedSubscript:@"processName"];
      id v12 = +[NSNumber numberWithDouble:self->_dateCreated];
      [v8 setObject:v12 forKeyedSubscript:@"connectedTime"];

      id v13 = +[NSNumber numberWithInt:self->_clientPID];
      CFStringRef v14 = @"pid";
    }
    else
    {
      [v7 setObject:self->_name forKeyedSubscript:@"name"];
      id v13 = +[NSNumber numberWithDouble:self->_dateCreated];
      CFStringRef v14 = @"dateCreated";
    }
    [v8 setObject:v13 forKeyedSubscript:v14];
  }
  [v6 setObject:v8 forKeyedSubscript:@"XPCState"];
  publicToken = self->_publicToken;
  if (publicToken && [(NSData *)publicToken length])
  {
    uint64_t v16 = [(NSData *)self->_publicToken debugDescription];
  }
  else
  {
    uint64_t v16 = +[NSNull null];
  }
  id v17 = (void *)v16;
  [v6 setObject:v16 forKeyedSubscript:@"token"];

  v32[0] = @"enabled";
  uint64_t v18 = [(NSSet *)self->_enabledTopics allObjects];
  id v19 = (void *)v18;
  if (v18) {
    __int16 v20 = (void *)v18;
  }
  else {
    __int16 v20 = &__NSArray0__struct;
  }
  v33[0] = v20;
  v32[1] = @"opportunistic";
  uint64_t v21 = [(NSSet *)self->_opportunisticTopics allObjects];
  id v22 = (void *)v21;
  if (v21) {
    id v23 = (void *)v21;
  }
  else {
    id v23 = &__NSArray0__struct;
  }
  v33[1] = v23;
  v32[2] = @"ignored";
  uint64_t v24 = [(NSSet *)self->_ignoredTopics allObjects];
  dispatch_queue_t v25 = (void *)v24;
  if (v24) {
    id v26 = (void *)v24;
  }
  else {
    id v26 = &__NSArray0__struct;
  }
  v33[2] = v26;
  v32[3] = @"nonWaking";
  uint64_t v27 = [(NSSet *)self->_nonWakingTopics allObjects];
  long long v28 = (void *)v27;
  if (v27) {
    long long v29 = (void *)v27;
  }
  else {
    long long v29 = &__NSArray0__struct;
  }
  v33[3] = v29;
  long long v30 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:4];
  [v6 setObject:v30 forKeyedSubscript:@"topics"];

  return v6;
}

- (void)appendPrettyStatusToStatusPrinter:(id)a3
{
  id v4 = a3;
  if (![(NSSet *)self->_enabledTopics count]
    && ![(NSSet *)self->_opportunisticTopics count]
    && ![(NSSet *)self->_nonWakingTopics count])
  {
    CFStringRef v18 = @"No listening topics, will not send or receive push notifications";
    goto LABEL_39;
  }
  publicToken = self->_publicToken;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned int v7 = [WeakRetained connectionDelegateIsConnectedToService:self];

  if (!publicToken)
  {
    if (v7)
    {
      id v19 = objc_loadWeakRetained((id *)&self->_delegate);
      unsigned int v20 = [v19 connectionDelegateHasConnectedUser:self];

      if (v20) {
        CFStringRef v18 = @"Missing token";
      }
      else {
        CFStringRef v18 = @"Missing token because user not connected";
      }
    }
    else
    {
      CFStringRef v18 = @"Missing token because not connected to service";
    }
    goto LABEL_39;
  }
  if ((v7 & 1) == 0)
  {
    CFStringRef v18 = @"Not connected to service";
    if (self->_enableDarkWake) {
      goto LABEL_39;
    }
    uint64_t v21 = +[APSWakeStateManager wakeStateManager];
    unsigned __int8 v22 = [v21 inDarkWake];

    if (v22)
    {
      CFStringRef v18 = @"Not connected to service during dark wake";
      goto LABEL_39;
    }
    long long v28 = +[APSWakeStateManager wakeStateManager];
    unsigned int v29 = [v28 inFullWake];

    CFStringRef v30 = @"Not connected to service during sleep";
LABEL_37:
    if (!v29) {
      CFStringRef v18 = v30;
    }
    goto LABEL_39;
  }
  id v8 = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned __int8 v9 = [v8 connectionDelegateHasConnectedUser:self];

  if ((v9 & 1) == 0)
  {
    CFStringRef v18 = @"User not connected";
    if (self->_enableDarkWake) {
      goto LABEL_39;
    }
    id v23 = +[APSWakeStateManager wakeStateManager];
    unsigned __int8 v24 = [v23 inDarkWake];

    if (v24)
    {
      CFStringRef v18 = @"User not connected during dark wake";
      goto LABEL_39;
    }
    unint64_t v34 = +[APSWakeStateManager wakeStateManager];
    unsigned int v29 = [v34 inFullWake];

    CFStringRef v30 = @"User not connected during sleep";
    goto LABEL_37;
  }
  id v10 = +[NSMutableSet set];
  [v10 unionSet:self->_enabledTopics];
  [v10 unionSet:self->_opportunisticTopics];
  [v10 unionSet:self->_nonWakingTopics];
  id v11 = [(APSConnectionServer *)self delegate];
  id v12 = [v11 topicManager];

  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v13 = v10;
  id v14 = [v13 countByEnumeratingWithState:&v100 objects:v106 count:16];
  if (!v14) {
    goto LABEL_15;
  }
  id v15 = v14;
  uint64_t v16 = *(void *)v101;
  while (2)
  {
    for (i = 0; i != v15; i = (char *)i + 1)
    {
      if (*(void *)v101 != v16) {
        objc_enumerationMutation(v13);
      }
      if ([v12 hasListeningTopic:*(void *)(*((void *)&v100 + 1) + 8 * i)])
      {

        if (!self->_processName && !self->_connectionMachPort)
        {
          CFStringRef v18 = @"Unregistered port name";
          goto LABEL_35;
        }
        dispatch_queue_t v25 = [(APSPayloadMessageStats *)self->_payloadMessageStats incomingCounts];
        id v26 = [v25 total];
        uint64_t v27 = [v26 lastMessageTopic];
        if (v27)
        {
        }
        else
        {
          long long v31 = [(APSPayloadMessageStats *)self->_payloadMessageStats outgoingCounts];
          v32 = [v31 total];
          __int16 v33 = [v32 lastMessageTopic];

          if (!v33)
          {
            CFStringRef v18 = @"Waiting for push notifications";
            goto LABEL_35;
          }
        }
        CFStringRef v18 = @"Ok";
        goto LABEL_35;
      }
    }
    id v15 = [v13 countByEnumeratingWithState:&v100 objects:v106 count:16];
    if (v15) {
      continue;
    }
    break;
  }
LABEL_15:

  CFStringRef v18 = @"No eligible topics, will not send or receive push notifications";
LABEL_35:

LABEL_39:
  if (self->_connectionPortName)
  {
    objc_msgSend(v4, "appendDescription:stringValue:", @"application port name");
    [v4 pushIndent];
    if (self->_processName) {
      objc_msgSend(v4, "appendDescription:stringValue:", @"process");
    }
    [v4 appendDescription:@"persistent connection status" stringValue:v18];
    CFStringRef v35 = @"persistent connection created";
  }
  else if (self->_processName)
  {
    objc_msgSend(v4, "appendDescription:stringValue:", @"process");
    [v4 pushIndent];
    [v4 appendDescription:@"process connection status" stringValue:v18];
    CFStringRef v35 = @"process connected";
  }
  else
  {
    [v4 appendDescription:@"name" stringValue:self->_name];
    [v4 pushIndent];
    CFStringRef v35 = @"created";
  }
  [v4 appendDescription:v35 timeIntervalValue:self->_dateCreated];
  id v36 = [(APSConnectionServer *)self user];
  v37 = [v36 name];
  [v4 appendDescription:@"user" stringValue:v37];

  id v38 = self->_publicToken;
  if (v38 && [(NSData *)v38 length])
  {
    NSUInteger v39 = [(NSData *)self->_publicToken length];
    objc_super v40 = [(NSData *)self->_publicToken debugDescription];
    v41 = +[NSString stringWithFormat:@"%@, {length = %lu, bytes=%@}", @"Yes", v39, v40];
    [v4 appendDescription:@"token" stringValue:v41];
  }
  else
  {
    [v4 appendDescription:@"token" stringValue:@"Missing"];
  }
  [v4 appendDescription:@"status change notifications" enabledValue:self->_enableStatusChangeNotifications];
  [v4 appendDescription:@"track acitivity presence" enabledValue:self->_trackActivityPresence];
  v42 = [(APSPayloadMessageStats *)self->_payloadMessageStats incomingCounts];
  [v42 appendPrettyStatusToStatusPrinter:v4 total:1 direction:@"incoming"];

  __int16 v43 = [(APSPayloadMessageStats *)self->_payloadMessageStats outgoingCounts];
  [v43 appendPrettyStatusToStatusPrinter:v4 total:1 direction:@"reverse"];

  [(APSConnectionServer *)self appendPrettyStatusToStatusPrinter:v4 forTopics:self->_enabledTopics type:@"enabled topics"];
  [(APSConnectionServer *)self appendPrettyStatusToStatusPrinter:v4 forTopics:self->_opportunisticTopics type:@"opportunistic topics"];
  [(APSConnectionServer *)self appendPrettyStatusToStatusPrinter:v4 forTopics:self->_nonWakingTopics type:@"nonwaking topics"];
  int64_t numberNotificationsSent = self->_numberNotificationsSent;
  if (numberNotificationsSent)
  {
    int64_t numberNotificationsAcknowledged = self->_numberNotificationsAcknowledged;
    if (numberNotificationsSent < 1 || numberNotificationsAcknowledged)
    {
      if (numberNotificationsSent <= numberNotificationsAcknowledged) {
        CFStringRef v46 = @"Ok";
      }
      else {
        CFStringRef v46 = @"Application possibly slow or failing to acknowledge some ipc messages";
      }
    }
    else
    {
      CFStringRef v46 = @"Application possibly not responding to ipc messages";
    }
  }
  else
  {
    CFStringRef v46 = @"No ipc messages have been sent";
  }
  [v4 appendDescription:@"ipc message queue status" stringValue:v46];
  if (self->_numberNotifications >= 1)
  {
    [v4 pushIndent];
    __int16 v47 = [(APSPayloadMessageStats *)self->_payloadMessageStats incomingCounts];
    id v48 = [v47 total];
    objc_msgSend(v4, "appendDescription:unsignedIntegerValue:", @"push notifications", objc_msgSend(v48, "count"));

    v49 = [(APSPayloadMessageStats *)self->_payloadMessageStats incomingCounts];
    id v50 = [v49 total];
    [v50 lastMessageTime];
    double v52 = v51;

    if (v52 != 0.0)
    {
      id v53 = [(APSPayloadMessageStats *)self->_payloadMessageStats incomingCounts];
      id v54 = [v53 total];
      [v54 lastMessageTime];
      objc_msgSend(v4, "appendDescription:timeIntervalValue:", @"last push notification");
    }
    v55 = [(APSPayloadMessageStats *)self->_payloadMessageStats incomingCounts];
    v56 = [v55 total];
    __int16 v57 = [v56 lastMessageTopic];

    if (v57)
    {
      v58 = [(APSPayloadMessageStats *)self->_payloadMessageStats incomingCounts];
      __int16 v59 = [v58 total];
      v60 = [v59 lastMessageTopic];
      [v4 appendDescription:@"last push notification topic" stringValue:v60];
    }
    double numberNotifications = (double)self->_numberNotifications;
    v62 = [(APSPayloadMessageStats *)self->_payloadMessageStats incomingCounts];
    v63 = [v62 total];
    [v63 lastMessageTime];
    [v4 appendDescription:@"non-push ipc messages" unsignedIntegerValue:(unint64_t)(numberNotifications - v64)];

    if (self->_lastNotificationTime != 0.0) {
      objc_msgSend(v4, "appendDescription:timeIntervalValue:", @"last ipc action");
    }
    if (self->_numberNotificationsLost >= 1) {
      objc_msgSend(v4, "appendDescription:unsignedIntegerValue:", @"ipc messages lost");
    }
    [v4 appendDescription:@"ipc messages sent" unsignedIntegerValue:self->_numberNotificationsSent];
    if (self->_lastNotificationSentTime != 0.0) {
      objc_msgSend(v4, "appendDescription:timeIntervalValue:", @"last ipc message sent");
    }
    if (self->_numberNotificationsQueued >= 1) {
      objc_msgSend(v4, "appendDescription:unsignedIntegerValue:", @"ipc messages queued");
    }
    if (self->_enqueuedBlockCount || self->_numberNotificationsQueued >= 1) {
      objc_msgSend(v4, "appendDescription:unsignedIntegerValue:", @"ipc messages waiting in queue");
    }
    if (self->_numberNotificationsDropped >= 1) {
      objc_msgSend(v4, "appendDescription:unsignedIntegerValue:", @"ipc messages skipped");
    }
    [v4 appendDescription:@"ipc messages acknowledged" unsignedIntegerValue:self->_numberNotificationsAcknowledged];
    if (self->_lastNotificationAcknowledgedTime != 0.0) {
      objc_msgSend(v4, "appendDescription:timeIntervalValue:", @"last ack from application");
    }
    int64_t v65 = self->_numberNotificationsSent;
    if (v65 >= 1) {
      [v4 appendDescription:@"ipc delivery success rate" successRateWithSuccessCount:self->_numberNotificationsAcknowledged failureCount:v65 - self->_numberNotificationsAcknowledged];
    }
    [v4 popIndent];
  }
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  v66 = [(NSSet *)self->_ignoredTopics allObjects];
  v67 = [v66 sortedArrayUsingSelector:"compare:"];

  id v68 = [v67 countByEnumeratingWithState:&v96 objects:v105 count:16];
  if (v68)
  {
    id v69 = v68;
    uint64_t v70 = *(void *)v97;
    do
    {
      for (j = 0; j != v69; j = (char *)j + 1)
      {
        if (*(void *)v97 != v70) {
          objc_enumerationMutation(v67);
        }
        [v4 appendDescription:@"ignored topic" stringValue:*(void *)(*((void *)&v96 + 1) + 8 * (void)j)];
      }
      id v69 = [v67 countByEnumeratingWithState:&v96 objects:v105 count:16];
    }
    while (v69);
  }

  v72 = [(APSPayloadMessageStats *)self->_payloadMessageStats incomingCountsByTopic];
  v73 = [v72 allKeys];
  v74 = +[NSMutableSet setWithArray:v73];

  v75 = [(APSPayloadMessageStats *)self->_payloadMessageStats outgoingCountsByTopic];
  v76 = [v75 allKeys];
  [v74 addObjectsFromArray:v76];

  v77 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v74 count]);
  [v77 unionSet:self->_enabledTopics];
  [v77 unionSet:self->_opportunisticTopics];
  [v77 unionSet:self->_nonWakingTopics];
  [v77 unionSet:self->_ignoredTopics];
  id v78 = [v74 mutableCopy];
  [v78 minusSet:v77];
  if ([v78 count])
  {
    v89 = v77;
    v90 = v74;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    id v88 = v78;
    v79 = [v78 allObjects];
    v80 = [v79 sortedArrayUsingSelector:"compare:"];

    id obj = v80;
    id v81 = [v80 countByEnumeratingWithState:&v92 objects:v104 count:16];
    if (v81)
    {
      id v82 = v81;
      uint64_t v83 = *(void *)v93;
      do
      {
        for (k = 0; k != v82; k = (char *)k + 1)
        {
          if (*(void *)v93 != v83) {
            objc_enumerationMutation(obj);
          }
          uint64_t v85 = *(void *)(*((void *)&v92 + 1) + 8 * (void)k);
          [v4 appendDescription:@"disabled topic" stringValue:v85];
          [v4 pushIndent];
          [v4 appendDescription:@"status", @"Topic disabled, unable to send or receive push notifications" stringValue];
          v86 = [(APSPayloadMessageStats *)self->_payloadMessageStats incomingCountsForTopic:v85];
          [v86 appendPrettyStatusToStatusPrinter:v4 total:0 direction:@"incoming"];
          v87 = [(APSPayloadMessageStats *)self->_payloadMessageStats outgoingCountsForTopic:v85];
          [v87 appendPrettyStatusToStatusPrinter:v4 total:0 direction:@"reverse"];
          [v4 popIndent];
        }
        id v82 = [obj countByEnumeratingWithState:&v92 objects:v104 count:16];
      }
      while (v82);
    }

    v77 = v89;
    v74 = v90;
    id v78 = v88;
  }
  [v4 popIndent];
}

- (void)appendPrettyStatusToStatusPrinter:(id)a3 forTopics:(id)a4 type:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 count])
  {
    id v31 = v10;
    objc_msgSend(v8, "appendDescription:unsignedIntegerValue:", v10, objc_msgSend(v9, "count"));
    [v8 pushIndent];
    id v11 = [(APSConnectionServer *)self delegate];
    id v36 = [v11 topicManager];

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v32 = v9;
    id v12 = [v9 allObjects];
    id v13 = [v12 sortedArrayUsingSelector:"compare:"];

    id obj = v13;
    id v14 = [v13 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (!v14) {
      goto LABEL_36;
    }
    id v15 = v14;
    uint64_t v35 = *(void *)v38;
    while (1)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v38 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        CFStringRef v18 = [(APSPayloadMessageStats *)self->_payloadMessageStats incomingCountsForTopic:v17];
        id v19 = [(APSPayloadMessageStats *)self->_payloadMessageStats outgoingCountsForTopic:v17];
        if (![v36 hasListeningTopic:v17])
        {
          CFStringRef v22 = @"Paused, topic is redlisted";
          goto LABEL_22;
        }
        if (v18)
        {
          unsigned int v20 = [v18 total];
          uint64_t v21 = [v20 lastMessageTopic];
          __int16 v33 = v20;
          if (v21)
          {
            id v13 = v21;

LABEL_19:
            CFStringRef v22 = @"Ok";
            goto LABEL_22;
          }
          if (!v19)
          {

            id v13 = 0;
            goto LABEL_21;
          }
          id v13 = 0;
        }
        else if (!v19)
        {
          goto LABEL_21;
        }
        id v23 = [v19 total];
        unsigned __int8 v24 = [v23 lastMessageTopic];

        if (v18)
        {
        }
        if (v24) {
          goto LABEL_19;
        }
LABEL_21:
        CFStringRef v22 = @"Waiting for push notifications";
LABEL_22:
        [v8 appendDescription:@"topic" stringValue:v17];
        [v8 pushIndent];
        [v8 appendDescription:@"status" stringValue:v22];
        if ([(NSSet *)self->_pushWakeTopics containsObject:v17]) {
          [v8 appendDescription:@"push-to-wake" BOOLValue:1];
        }
        if ([(NSSet *)self->_darkWakeTopics containsObject:v17]) {
          [v8 appendDescription:@"dark-wake" BOOLValue:1];
        }
        if ([(NSSet *)self->_ultraConstrainedTopics containsObject:v17]) {
          [v8 appendDescription:@"ultra-constrained" BOOLValue:1];
        }
        if (v18)
        {
          dispatch_queue_t v25 = [v18 total];
          id v26 = [v25 lastMessageTopic];

          if (v26)
          {
            uint64_t v27 = [(APSPayloadMessageStats *)self->_payloadMessageStats incomingCountsForTopic:v17];
            [v27 appendPrettyStatusToStatusPrinter:v8 total:0 direction:@"incoming"];
          }
        }
        if (v19)
        {
          long long v28 = [v19 total];
          unsigned int v29 = [v28 lastMessageTopic];

          if (v29)
          {
            CFStringRef v30 = [(APSPayloadMessageStats *)self->_payloadMessageStats outgoingCountsForTopic:v17];
            [v30 appendPrettyStatusToStatusPrinter:v8 total:0 direction:@"reverse"];
          }
        }
        [v8 popIndent];
      }
      id v15 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (!v15)
      {
LABEL_36:

        [v8 popIndent];
        id v10 = v31;
        id v9 = v32;
        break;
      }
    }
  }
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  environmentName = self->_environmentName;
  connectionPortName = self->_connectionPortName;
  processName = self->_processName;
  unsigned int v7 = [(APSUser *)self->_user name];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; %@/%@/%@ %@>",
    v3,
    self,
    environmentName,
    connectionPortName,
    processName,
  id v8 = v7);

  return (NSString *)v8;
}

- (APSConnectionServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (APSConnectionServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSSet)enabledTopics
{
  return self->_enabledTopics;
}

- (NSSet)ignoredTopics
{
  return self->_ignoredTopics;
}

- (NSSet)opportunisticTopics
{
  return self->_opportunisticTopics;
}

- (NSData)publicToken
{
  return self->_publicToken;
}

- (unint64_t)messageSize
{
  return self->_messageSize;
}

- (unint64_t)largeMessageSize
{
  return self->_largeMessageSize;
}

- (BOOL)enableCriticalReliability
{
  return self->_enableCriticalReliability;
}

- (BOOL)enableStatusChangeNotifications
{
  return self->_enableStatusChangeNotifications;
}

- (NSString)environmentName
{
  return self->_environmentName;
}

- (NSSet)pushWakeTopics
{
  return self->_pushWakeTopics;
}

- (NSSet)ultraConstrainedTopics
{
  return self->_ultraConstrainedTopics;
}

- (APSUser)user
{
  return self->_user;
}

- (NSSet)nonWakingTopics
{
  return self->_nonWakingTopics;
}

- (void)setProcessName:(id)a3
{
}

- (BOOL)enableDarkWake
{
  return self->_enableDarkWake;
}

- (BOOL)trackActivityPresence
{
  return self->_trackActivityPresence;
}

- (int64_t)publicTokenDeliveryRetries
{
  return self->_publicTokenDeliveryRetries;
}

- (void)setPublicTokenDeliveryRetries:(int64_t)a3
{
  self->_publicTokenDeliveryRetries = a3;
}

- (BOOL)isClosed
{
  return self->_isClosed;
}

- (NSString)name
{
  return self->_name;
}

- (APSUserPreferences)userPreferences
{
  return self->_userPreferences;
}

- (void)setUserPreferences:(id)a3
{
}

- (BOOL)isInitialized
{
  return self->_isInitialized;
}

- (void)setIsInitialized:(BOOL)a3
{
  self->_isInitialized = a3;
}

- (os_unfair_lock_s)connectionLock
{
  return self->_connectionLock;
}

- (void)setConnectionLock:(os_unfair_lock_s)a3
{
  self->_connectionLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPreferences, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_ultraConstrainedTopics, 0);
  objc_storeStrong((id *)&self->_criticalWakeTopics, 0);
  objc_storeStrong((id *)&self->_darkWakeTopics, 0);
  objc_storeStrong((id *)&self->_pushWakeTopics, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_payloadMessageStats, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_nonWakingTopics, 0);
  objc_storeStrong((id *)&self->_opportunisticTopics, 0);
  objc_storeStrong((id *)&self->_ignoredTopics, 0);
  objc_storeStrong((id *)&self->_enabledTopics, 0);
  objc_storeStrong((id *)&self->_connectionPortName, 0);
  objc_storeStrong((id *)&self->_publicToken, 0);
  objc_storeStrong((id *)&self->_environmentName, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end