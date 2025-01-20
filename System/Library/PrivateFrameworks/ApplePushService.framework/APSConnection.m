@interface APSConnection
+ (BOOL)isValidEnvironment:(id)a3;
+ (__SecIdentity)copyIdentity;
+ (double)keepAliveIntervalForEnvironmentName:(id)a3;
+ (double)serverTime;
+ (id)_createXPCConnectionWithQueueName:(const char *)a3;
+ (id)connectionsDebuggingStateOfStyle:(unint64_t)a3;
+ (id)geoRegion;
+ (unint64_t)serverTimeInNanoSeconds;
+ (void)_flushIdentityCache;
+ (void)_safelyCancelAndReleaseConnection:(id)a3;
+ (void)_setTokenState;
+ (void)invalidateDeviceIdentity;
+ (void)notifySafeToSendFilter;
+ (void)requestCourierConnection;
- (APSConnection)initWithEnvironmentName:(id)a3;
- (APSConnection)initWithEnvironmentName:(id)a3 namedDelegatePort:(id)a4;
- (APSConnection)initWithEnvironmentName:(id)a3 namedDelegatePort:(id)a4 personaUniqueString:(id)a5 queue:(id)a6;
- (APSConnection)initWithEnvironmentName:(id)a3 namedDelegatePort:(id)a4 queue:(id)a5;
- (APSConnection)initWithEnvironmentName:(id)a3 queue:(id)a4;
- (APSConnectionDelegate)delegate;
- (BOOL)hasIdentity;
- (BOOL)isConnected;
- (BOOL)isShutdown;
- (BOOL)trackActivityPresence;
- (BOOL)usesAppLaunchStats;
- (NSArray)enabledTopics;
- (NSArray)ignoredTopics;
- (NSArray)nonWakingTopics;
- (NSArray)opportunisticTopics;
- (NSData)publicToken;
- (NSMutableArray)accumulatedTopicMoves;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)ivarQueue;
- (id)_initWithEnvironmentName:(id)a3 namedDelegatePort:(id)a4 enablePushDuringSleep:(BOOL)a5 personaUniqueString:(id)a6 queue:(id)a7;
- (id)_removeURLTokenBlocksForInfo:(id)a3;
- (id)_topicListNameForLogging:(unint64_t)a3;
- (id)registeredChannelsForTopic:(id)a3 error:(id *)a4;
- (os_unfair_lock_s)topicMoveLock;
- (unint64_t)largeMessageSize;
- (unint64_t)messageSize;
- (void)_addEnableCriticalReliabilityToXPCMessage:(id)a3;
- (void)_addEnableStatusNotificationsToXPCMessage:(id)a3;
- (void)_addPushWakeTopicsToXPCMessage:(id)a3;
- (void)_addTrackActivityPresenceToXPCMessage:(id)a3;
- (void)_addUltraConstrainedTopicsToXPCMessage:(id)a3;
- (void)_asyncOnDelegateQueueWithBlock:(id)a3;
- (void)_asyncOnDelegateQueueWithBlock:(id)a3 requiresDelegate:(BOOL)a4;
- (void)_cancelConnection;
- (void)_cancelConnectionOnIvarQueue;
- (void)_connectIfNecessary;
- (void)_connectIfNecessaryOnIvarQueue;
- (void)_deliverConnectionStatusChange:(BOOL)a3;
- (void)_deliverConnectionStatusFromDealloc:(BOOL)a3;
- (void)_deliverDidReconnectOnIvarQueue;
- (void)_deliverFailedChannelSubscriptions:(id)a3 onTopic:(id)a4;
- (void)_deliverMessage:(id)a3;
- (void)_deliverOutgoingMessageResultWithID:(unint64_t)a3 error:(id)a4 sendRTT:(unint64_t)a5;
- (void)_deliverOutgoingMessageResultWithID:(unint64_t)a3 error:(id)a4 sendRTT:(unint64_t)a5 ackTimestamp:(unint64_t)a6;
- (void)_deliverPublicToken:(id)a3 withCompletionBlock:(id)a4;
- (void)_deliverPublicTokenOnIvarQueue:(id)a3 withCompletionBlock:(id)a4;
- (void)_deliverToken:(id)a3 forInfo:(id)a4;
- (void)_deliverToken:(id)a3 forTopic:(id)a4 identifier:(id)a5;
- (void)_deliverURLToken:(id)a3 forInfo:(id)a4;
- (void)_deliverURLTokenError:(id)a3 forInfo:(id)a4;
- (void)_disconnect;
- (void)_disconnectFromDealloc;
- (void)_disconnectOnIvarQueue;
- (void)_dispatch_async_to_ivarQueue:(id)a3;
- (void)_dispatch_async_to_ivarQueue:(id)a3 shutdownBlock:(id)a4;
- (void)_dispatch_sync_to_ivarQueue:(id)a3 shutdownBlock:(id)a4;
- (void)_handleEvent:(id)a3 withHandler:(id)a4;
- (void)_handleEvent:(id)a3 withHandler:(id)a4 errorHandler:(id)a5;
- (void)_insertURLTokenBlock:(id)a3 forInfo:(id)a4;
- (void)_noteDisconnectedFromDaemonOnIvarQueue;
- (void)_onIvarQueue_setEnabledTopics:(id)a3 ignoredTopics:(id)a4 opportunisticTopics:(id)a5 nonWakingTopics:(id)a6 sendToDaemon:(BOOL)a7 completion:(id)a8;
- (void)_onIvarQueue_setPushWakeTopics:(id)a3;
- (void)_onIvarQueue_setUltraConstrainedTopics:(id)a3;
- (void)_processQueuedTopicMovesOnIvarQueue;
- (void)_reconnectIfNecessaryOnIvarQueueAfterDelay;
- (void)_sendOutgoingMessage:(id)a3 fake:(BOOL)a4;
- (void)_setEnableCriticalReliability:(BOOL)a3 sendToDaemon:(BOOL)a4;
- (void)_setEnableStatusNotifications:(BOOL)a3 sendToDaemon:(BOOL)a4;
- (void)_setEnabledTopics:(id)a3;
- (void)_setEnabledTopics:(id)a3 ignoredTopics:(id)a4 opportunisticTopics:(id)a5 nonWakingTopics:(id)a6 sendToDaemon:(BOOL)a7 completion:(id)a8;
- (void)_setIgnoredTopics:(id)a3;
- (void)_setNonWakingTopics:(id)a3;
- (void)_setOpportunisticTopics:(id)a3;
- (void)_setTrackActivityPresence:(BOOL)a3 sendToDaemon:(BOOL)a4;
- (void)_shutdownFromDealloc;
- (void)_shutdownOnIvarQueue;
- (void)calloutToDelegatesForURLTokenError:(id)a3 forInfo:(id)a4 completion:(id)a5;
- (void)calloutToInvalidateCompletion:(id)a3 withSuccess:(BOOL)a4 error:(id)a5;
- (void)cancelOutgoingMessage:(id)a3;
- (void)confirmReceiptForMessage:(id)a3;
- (void)currentTokenForInfo:(id)a3;
- (void)currentURLTokenForInfo:(id)a3;
- (void)dealloc;
- (void)getRegisteredChannelsForTopic:(id)a3 completion:(id)a4;
- (void)getRegisteredChannelsForTopic:(id)a3 withCompletion:(id)a4;
- (void)invalidateTokenForInfo:(id)a3;
- (void)invalidateTokenForTopic:(id)a3 identifier:(id)a4;
- (void)invalidateURLTokenForInfo:(id)a3;
- (void)invalidateURLTokenForInfo:(id)a3 completion:(id)a4;
- (void)moveTopic:(id)a3 fromList:(unint64_t)a4 toList:(unint64_t)a5;
- (void)moveTopics:(id)a3 fromList:(unint64_t)a4 toList:(unint64_t)a5;
- (void)removeFromRunLoop;
- (void)requestKeepAlive;
- (void)requestTokenForInfo:(id)a3;
- (void)requestTokenForTopic:(id)a3 identifier:(id)a4;
- (void)requestURLTokenForInfo:(id)a3;
- (void)requestURLTokenForInfo:(id)a3 completion:(id)a4;
- (void)rollBAACertsWithCompletion:(id)a3;
- (void)scheduleInRunLoop:(id)a3;
- (void)sendFakeMessage:(id)a3;
- (void)sendOutgoingMessage:(id)a3;
- (void)setAccumulatedTopicMoves:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnableCriticalReliability:(BOOL)a3;
- (void)setEnableStatusNotifications:(BOOL)a3;
- (void)setEnabledTopics:(id)a3 ignoredTopics:(id)a4;
- (void)setEnabledTopics:(id)a3 ignoredTopics:(id)a4 opportunisticTopics:(id)a5;
- (void)setEnabledTopics:(id)a3 ignoredTopics:(id)a4 opportunisticTopics:(id)a5 nonWakingTopics:(id)a6;
- (void)setEnabledTopics:(id)a3 ignoredTopics:(id)a4 opportunisticTopics:(id)a5 nonWakingTopics:(id)a6 completion:(id)a7;
- (void)setLargeMessageSize:(unint64_t)a3;
- (void)setMessageSize:(unint64_t)a3;
- (void)setTopicMoveLock:(os_unfair_lock_s)a3;
- (void)setTrackActivityPresence:(BOOL)a3;
- (void)setUltraConstrainedTopics:(id)a3;
- (void)setUsesAppLaunchStats:(BOOL)a3;
- (void)shutdown;
- (void)signDataWithDeviceIdentity:(id)a3 withCompletion:(id)a4;
- (void)subscribeToChannel:(id)a3 forTopic:(id)a4;
- (void)subscribeToChannels:(id)a3 forTopic:(id)a4;
- (void)unsubscribeFromChannel:(id)a3 forTopic:(id)a4;
- (void)unsubscribeFromChannels:(id)a3 forTopic:(id)a4;
@end

@implementation APSConnection

uint64_t __60__APSConnection__dispatch_async_to_ivarQueue_shutdownBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)largeMessageSize
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__APSConnection_largeMessageSize__block_invoke;
  v5[3] = &unk_1E5982608;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __65__APSConnection__asyncOnDelegateQueueWithBlock_requiresDelegate___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x19F3B00F0]();
  unint64_t v3 = [*(id *)(a1 + 32) object];
  if (v3 || !*(unsigned char *)(a1 + 48)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setUltraConstrainedTopics:(id)a3
{
  v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__APSConnection_setUltraConstrainedTopics___block_invoke;
  v6[3] = &unk_1E59823E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v6];
}

- (void)_deliverToken:(id)a3 forTopic:(id)a4 identifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__APSConnection__deliverToken_forTopic_identifier___block_invoke;
  v14[3] = &unk_1E59825B8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v14];
}

- (void)requestTokenForTopic:(id)a3 identifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (__CFString *)a4;
  id v8 = +[APSLog connection];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v14 = self;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_19DC4C000, v8, OS_LOG_TYPE_DEFAULT, "%@: Requesting per-app token for topic %@ and identifier %@", buf, 0x20u);
  }

  if (v6)
  {
    id v9 = &stru_1EF02C710;
    if (v7) {
      id v9 = v7;
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__APSConnection_requestTokenForTopic_identifier___block_invoke;
    v10[3] = &unk_1E59825E0;
    v10[4] = self;
    id v7 = v9;
    id v11 = v7;
    id v12 = v6;
    [(APSConnection *)self _dispatch_async_to_ivarQueue:v10];
  }
}

- (void)_dispatch_async_to_ivarQueue:(id)a3 shutdownBlock:(id)a4
{
  id v5 = a3;
  ivarQueue = self->_ivarQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__APSConnection__dispatch_async_to_ivarQueue_shutdownBlock___block_invoke;
  block[3] = &unk_1E59826F8;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(ivarQueue, block);
}

- (void)_dispatch_async_to_ivarQueue:(id)a3
{
}

void __51__APSConnection__deliverToken_forTopic_identifier___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = +[APSLog connection];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = [*(id *)(a1 + 40) debugDescription];
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138413058;
    uint64_t v14 = v3;
    __int16 v15 = 2112;
    id v16 = v4;
    __int16 v17 = 2112;
    uint64_t v18 = v5;
    __int16 v19 = 2112;
    uint64_t v20 = v6;
    _os_log_impl(&dword_19DC4C000, v2, OS_LOG_TYPE_DEFAULT, "%@ Received token %@ forTopic %@ identifier %@", buf, 0x2Au);
  }
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    if (*(void *)(a1 + 48))
    {
      id v8 = *(void **)(a1 + 32);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __51__APSConnection__deliverToken_forTopic_identifier___block_invoke_163;
      v9[3] = &unk_1E5982838;
      v9[4] = v8;
      id v10 = v7;
      id v11 = *(id *)(a1 + 48);
      id v12 = *(id *)(a1 + 56);
      [v8 _asyncOnDelegateQueueWithBlock:v9];
    }
  }
}

- (void)_asyncOnDelegateQueueWithBlock:(id)a3 requiresDelegate:(BOOL)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x19F3B00F0]();
    delegateReference = self->_delegateReference;
    if (!delegateReference && a4) {
      goto LABEL_19;
    }
    if (self->_delegateQueue)
    {
      id v16 = delegateReference;
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __65__APSConnection__asyncOnDelegateQueueWithBlock_requiresDelegate___block_invoke;
      block[3] = &unk_1E5982408;
      uint64_t v20 = v16;
      BOOL v22 = a4;
      id v21 = v6;
      __int16 v15 = v16;
      dispatch_async(delegateQueue, block);

LABEL_15:
      goto LABEL_16;
    }
    if (!delegateReference)
    {
LABEL_19:
      if (!self->_everHadDelegate)
      {
        id v9 = +[APSLog connection];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v24 = self;
          _os_log_impl(&dword_19DC4C000, v9, OS_LOG_TYPE_DEFAULT, "%@ queuing call to delegate to tolerate setDelegate race", buf, 0xCu);
        }

        queuedDelegateBlocks = self->_queuedDelegateBlocks;
        if (!queuedDelegateBlocks)
        {
          id v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          id v12 = self->_queuedDelegateBlocks;
          self->_queuedDelegateBlocks = v11;

          dispatch_time_t v13 = dispatch_time(0, 5000000000);
          ivarQueue = self->_ivarQueue;
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __65__APSConnection__asyncOnDelegateQueueWithBlock_requiresDelegate___block_invoke_58;
          v18[3] = &unk_1E5982370;
          v18[4] = self;
          dispatch_after(v13, ivarQueue, v18);
          queuedDelegateBlocks = self->_queuedDelegateBlocks;
        }
        __int16 v15 = MEMORY[0x19F3B0300](v6);
        [(NSMutableArray *)queuedDelegateBlocks addObject:v15];
        goto LABEL_15;
      }
    }
    __int16 v15 = +[APSLog connection];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = self;
      _os_log_impl(&dword_19DC4C000, v15, OS_LOG_TYPE_DEFAULT, "%@ dropping delegate call, no delegate", buf, 0xCu);
    }
    goto LABEL_15;
  }
LABEL_16:
}

- (void)_asyncOnDelegateQueueWithBlock:(id)a3
{
}

- (void)moveTopic:(id)a3 fromList:(unint64_t)a4 toList:(unint64_t)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v11 = a3;
    id v8 = (void *)MEMORY[0x1E4F1C978];
    id v9 = a3;
    id v10 = [v8 arrayWithObjects:&v11 count:1];

    -[APSConnection moveTopics:fromList:toList:](self, "moveTopics:fromList:toList:", v10, a4, a5, v11, v12);
  }
}

- (void)_onIvarQueue_setUltraConstrainedTopics:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (NSArray *)a3;
  id v6 = +[APSLog connection];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = self;
    __int16 v17 = 2112;
    uint64_t v18 = v5;
    _os_log_impl(&dword_19DC4C000, v6, OS_LOG_TYPE_DEFAULT, "%@: Setting UltraConstrainedTopics: %@", buf, 0x16u);
  }

  if (self->_ultraConstrainedTopics != v5) {
    objc_storeStrong((id *)&self->_ultraConstrainedTopics, a3);
  }
  [(APSConnection *)self _connectIfNecessaryOnIvarQueue];
  if (self->_connection)
  {
    id v7 = xpc_dictionary_create(0, 0, 0);
    id v8 = (const char *)[@"message-type" UTF8String];
    APSInsertIntsToXPCDictionary(v7, v8, v9, v10, v11, v12, v13, v14, 25);
    [(APSConnection *)self _addUltraConstrainedTopicsToXPCMessage:v7];
    xpc_connection_send_message(self->_connection, v7);
  }
  else
  {
    id v7 = +[APSLog connection];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = self;
      _os_log_impl(&dword_19DC4C000, v7, OS_LOG_TYPE_DEFAULT, "%@ _connection is NULL in _setUltraConstrainedTopics", buf, 0xCu);
    }
  }
}

- (void)_addUltraConstrainedTopicsToXPCMessage:(id)a3
{
}

- (void)_onIvarQueue_setEnabledTopics:(id)a3 ignoredTopics:(id)a4 opportunisticTopics:(id)a5 nonWakingTopics:(id)a6 sendToDaemon:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  uint64_t v19 = +[APSLog connection];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    if (v9) {
      uint64_t v20 = @"YES";
    }
    else {
      uint64_t v20 = @"NO";
    }
    id v21 = (void *)MEMORY[0x19F3B0300](v18);
    *(_DWORD *)buf = 138413826;
    v47 = self;
    __int16 v48 = 2112;
    id v49 = v14;
    __int16 v50 = 2112;
    id v51 = v15;
    __int16 v52 = 2112;
    id v53 = v16;
    __int16 v54 = 2112;
    id v55 = v17;
    __int16 v56 = 2112;
    v57 = v20;
    __int16 v58 = 2112;
    v59 = v21;
    _os_log_impl(&dword_19DC4C000, v19, OS_LOG_TYPE_DEFAULT, "%@ setEnabledTopics %@ ignoredTopics %@ opportunisticTopics %@ nonWakingTopics %@ sendToDaemon: %@ completion: %@", buf, 0x48u);
  }
  BOOL v22 = (void *)MEMORY[0x19F3B00F0]();
  BOOL v23 = ![(NSArray *)self->_enabledTopics isEqualToArray:v14]
     || ![(NSArray *)self->_ignoredTopics isEqualToArray:v15]
     || ![(NSArray *)self->_opportunisticTopics isEqualToArray:v16]
     || ![(NSArray *)self->_nonWakingTopics isEqualToArray:v17];
  if (![(NSArray *)self->_enabledTopics count]
    && ![(NSArray *)self->_ignoredTopics count]
    && ![(NSArray *)self->_opportunisticTopics count]
    && ![(NSArray *)self->_nonWakingTopics count])
  {
    v24 = +[APSLog connection];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v47 = self;
      _os_log_impl(&dword_19DC4C000, v24, OS_LOG_TYPE_DEFAULT, "%@ got all nil topics, considering this as a change to flush any cached topics in apsd for named ports.", buf, 0xCu);
    }

    BOOL v23 = 1;
  }
  if (v9) {
    [(APSConnection *)self _connectIfNecessaryOnIvarQueue];
  }
  uint64_t v25 = (NSArray *)[v14 copy];
  enabledTopics = self->_enabledTopics;
  self->_enabledTopics = v25;

  v27 = (NSArray *)[v15 copy];
  ignoredTopics = self->_ignoredTopics;
  self->_ignoredTopics = v27;

  v29 = (NSArray *)[v16 copy];
  opportunisticTopics = self->_opportunisticTopics;
  self->_opportunisticTopics = v29;

  v31 = (NSArray *)[v17 copy];
  nonWakingTopics = self->_nonWakingTopics;
  self->_nonWakingTopics = v31;

  char v33 = !v23;
  if (!self->_connection) {
    char v33 = 1;
  }
  if ((v33 & 1) != 0 || !v9)
  {
    v34 = +[APSLog connection];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v47 = self;
      _os_log_impl(&dword_19DC4C000, v34, OS_LOG_TYPE_DEFAULT, "APS %@ _connection is NULL in _sendEnabledTopics:ignoredTopics:opportunisticTopics:!", buf, 0xCu);
    }
  }
  else
  {
    v34 = xpc_dictionary_create(0, 0, 0);
    v35 = (const char *)[@"message-type" UTF8String];
    APSInsertIntsToXPCDictionary(v34, v35, v36, v37, v38, v39, v40, v41, 1);
    APSInsertEnabledTopicsToXPCDictionary(v34, self->_enabledTopics);
    APSInsertIgnoredTopicsToXPCDictionary(v34, self->_ignoredTopics);
    APSInsertOpportunisticTopicsToXPCDictionary(v34, self->_opportunisticTopics);
    APSInsertNonWakingTopicsToXPCDictionary(v34, self->_nonWakingTopics);
    connection = self->_connection;
    ivarQueue = self->_ivarQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __121__APSConnection__onIvarQueue_setEnabledTopics_ignoredTopics_opportunisticTopics_nonWakingTopics_sendToDaemon_completion___block_invoke;
    handler[3] = &unk_1E5982518;
    handler[4] = self;
    id v45 = v18;
    xpc_connection_send_message_with_reply(connection, v34, ivarQueue, handler);
  }
}

- (void)_processQueuedTopicMovesOnIvarQueue
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MEMORY[0x19F3B00F0](self, a2);
  v4 = self->_enabledTopics;
  __int16 v52 = self->_opportunisticTopics;
  id v53 = self->_ignoredTopics;
  __int16 v54 = self->_nonWakingTopics;
  v61 = 0;
  v62 = 0;
  v59 = 0;
  uint64_t v60 = 0;
  os_unfair_lock_lock(&self->_topicMoveLock);
  uint64_t v5 = self->_accumulatedTopicMoves;
  accumulatedTopicMoves = self->_accumulatedTopicMoves;
  __int16 v50 = self;
  self->_accumulatedTopicMoves = 0;

  os_unfair_lock_unlock(&self->_topicMoveLock);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v7 = v5;
  id v8 = (void *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v55 objects:v67 count:16];
  context = (void *)v3;
  if (v8)
  {
    uint64_t v9 = *(void *)v56;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v56 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "topic", context);
        uint64_t v13 = [v11 fromListID];
        uint64_t v14 = [v11 toListID];
        id v15 = &v62;
        id v16 = v4;
        switch(v13)
        {
          case 0:
            goto LABEL_10;
          case 1:
            id v15 = &v61;
            id v16 = v52;
            goto LABEL_10;
          case 2:
            id v15 = &v60;
            id v16 = v53;
            goto LABEL_10;
          case 3:
            id v15 = &v59;
            id v16 = v54;
LABEL_10:
            id v17 = v16;
            id v18 = v17;
            if (!v17 || ![(NSArray *)v17 containsObject:v12]) {
              goto LABEL_17;
            }
            uint64_t v19 = *v15;
            if (!*v15)
            {
              uint64_t v20 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v18];
              id v21 = *v15;
              *id v15 = (void *)v20;

              uint64_t v19 = *v15;
            }
            [v19 removeObject:v12];
            BOOL v22 = &v62;
            BOOL v23 = v4;
            switch(v14)
            {
              case 0:
                goto LABEL_21;
              case 1:
                BOOL v22 = &v61;
                BOOL v23 = v52;
                goto LABEL_21;
              case 2:
                BOOL v22 = &v60;
                BOOL v23 = v53;
                goto LABEL_21;
              case 3:
                BOOL v22 = &v59;
                BOOL v23 = v54;
LABEL_21:
                v24 = v23;
                if (!*v22)
                {
                  id v26 = objc_alloc(MEMORY[0x1E4F1CA80]);
                  if (v24) {
                    uint64_t v27 = [v26 initWithArray:v24];
                  }
                  else {
                    uint64_t v27 = [v26 initWithCapacity:1];
                  }
                  id v28 = *v22;
                  *BOOL v22 = (id)v27;
                }
                [*v22 addObject:v12];
                break;
              default:
                v24 = +[APSLog connection];
                if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v64 = v12;
                  __int16 v65 = 2048;
                  uint64_t v66 = v14;
                  _os_log_fault_impl(&dword_19DC4C000, v24, OS_LOG_TYPE_FAULT, "Unable to move topic %@, The to list is not valid! %lu", buf, 0x16u);
                }
                break;
            }
            break;
          default:
            id v18 = 0;
LABEL_17:
            v24 = +[APSLog connection];
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              uint64_t v25 = [(APSConnection *)v50 _topicListNameForLogging:v14];
              *(_DWORD *)buf = 138412546;
              v64 = v12;
              __int16 v65 = 2112;
              uint64_t v66 = (uint64_t)v25;
              _os_log_error_impl(&dword_19DC4C000, v24, OS_LOG_TYPE_ERROR, "Unable to move topic %@, This topic was not in the list provided! %@", buf, 0x16u);
            }
            break;
        }
      }
      id v8 = (void *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v55 objects:v67 count:16];
    }
    while (v8);
    v30 = v61;
    v29 = v62;
    v31 = v59;
    id v8 = v60;
  }
  else
  {
    v31 = 0;
    v30 = 0;
    v29 = 0;
  }
  id v51 = v29;
  v32 = v7;

  uint64_t v33 = [v29 allObjects];
  v34 = (void *)v33;
  if (v33) {
    v35 = (void *)v33;
  }
  else {
    v35 = v4;
  }
  id v36 = v35;

  uint64_t v37 = [v30 allObjects];
  uint64_t v38 = (void *)v37;
  if (v37) {
    uint64_t v39 = (void *)v37;
  }
  else {
    uint64_t v39 = v52;
  }
  id v40 = v39;

  uint64_t v41 = [v8 allObjects];
  v42 = (void *)v41;
  if (v41) {
    v43 = (void *)v41;
  }
  else {
    v43 = v53;
  }
  id v44 = v43;

  uint64_t v45 = [v31 allObjects];
  v46 = (void *)v45;
  if (v45) {
    v47 = (void *)v45;
  }
  else {
    v47 = v54;
  }
  id v48 = v47;

  [(APSConnection *)v50 _onIvarQueue_setEnabledTopics:v36 ignoredTopics:v44 opportunisticTopics:v40 nonWakingTopics:v48 sendToDaemon:1 completion:0];
}

- (void)moveTopics:(id)a3 fromList:(unint64_t)a4 toList:(unint64_t)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [v8 count];
  if (a4 != a5 && (a5 | a4) <= 3 && v9)
  {
    uint64_t v10 = +[APSLog connection];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [(APSConnection *)self _topicListNameForLogging:a4];
      uint64_t v12 = [(APSConnection *)self _topicListNameForLogging:a5];
      *(_DWORD *)buf = 138413058;
      uint64_t v33 = self;
      __int16 v34 = 2112;
      id v35 = v8;
      __int16 v36 = 2112;
      uint64_t v37 = v11;
      __int16 v38 = 2112;
      uint64_t v39 = v12;
      _os_log_impl(&dword_19DC4C000, v10, OS_LOG_TYPE_DEFAULT, "%@ moveTopics %@ fromList %@ toList %@", buf, 0x2Au);
    }
    os_unfair_lock_lock(&self->_topicMoveLock);
    accumulatedTopicMoves = self->_accumulatedTopicMoves;
    if (!accumulatedTopicMoves)
    {
      uint64_t v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v14 = self->_accumulatedTopicMoves;
      self->_accumulatedTopicMoves = v13;
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v25 = v8;
    id v15 = v8;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          id v21 = objc_alloc_init(_APSTopicMove);
          [(_APSTopicMove *)v21 setTopic:v20];
          [(_APSTopicMove *)v21 setFromListID:a4];
          [(_APSTopicMove *)v21 setToListID:a5];
          [(NSMutableArray *)self->_accumulatedTopicMoves addObject:v21];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v17);
    }

    os_unfair_lock_unlock(&self->_topicMoveLock);
    id v8 = v25;
    if (!accumulatedTopicMoves)
    {
      dispatch_time_t v22 = dispatch_time(0, 500000000);
      ivarQueue = self->_ivarQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __44__APSConnection_moveTopics_fromList_toList___block_invoke;
      block[3] = &unk_1E5982370;
      void block[4] = self;
      dispatch_after(v22, ivarQueue, block);
    }
  }
}

- (id)_topicListNameForLogging:(unint64_t)a3
{
  if (a3 > 4) {
    return @"Unknown List";
  }
  else {
    return off_1E5982B48[a3];
  }
}

void __51__APSConnection__deliverToken_forTopic_identifier___block_invoke_163(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    v4 = +[APSLog connection];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = a1[4];
      uint64_t v6 = a1[5];
      uint64_t v7 = a1[6];
      uint64_t v8 = a1[7];
      int v11 = 138413314;
      uint64_t v12 = v5;
      __int16 v13 = 2112;
      id v14 = v3;
      __int16 v15 = 2112;
      uint64_t v16 = v6;
      __int16 v17 = 2112;
      uint64_t v18 = v7;
      __int16 v19 = 2112;
      uint64_t v20 = v8;
      _os_log_impl(&dword_19DC4C000, v4, OS_LOG_TYPE_DEFAULT, "%@ calling %@ for received token %@ for topic %@ identifier %@", (uint8_t *)&v11, 0x34u);
    }

    [v3 connection:a1[4] didReceiveToken:a1[5] forTopic:a1[6] identifier:a1[7]];
    uint64_t v9 = +[APSLog connection];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = a1[4];
      int v11 = 138412546;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_19DC4C000, v9, OS_LOG_TYPE_DEFAULT, "%@ returned from %@ didReceiveToken:forTopic:identifier", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (unint64_t)messageSize
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__APSConnection_messageSize__block_invoke;
  v5[3] = &unk_1E5982608;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __49__APSConnection_requestTokenForTopic_identifier___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _connectIfNecessaryOnIvarQueue];
  if (*(void *)(*(void *)(a1 + 32) + 104))
  {
    xpc_object_t message = xpc_dictionary_create(0, 0, 0);
    v2 = (const char *)[@"message-type" UTF8String];
    APSInsertIntsToXPCDictionary(message, v2, v3, v4, v5, v6, v7, v8, 14);
    APSInsertNSStringsToXPCDictionary(message, "identifier", v9, v10, v11, v12, v13, v14, *(void *)(a1 + 40));
    xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 32) + 104), message);
  }
  else
  {
    __int16 v15 = +[APSLog connection];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v16;
      _os_log_impl(&dword_19DC4C000, v15, OS_LOG_TYPE_DEFAULT, "%@ APS _connection is NULL in requestTokenForTopic!", buf, 0xCu);
    }
  }
}

uint64_t __28__APSConnection_messageSize__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _connectIfNecessaryOnIvarQueue];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 40);
  return result;
}

uint64_t __33__APSConnection_largeMessageSize__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _connectIfNecessaryOnIvarQueue];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 48);
  return result;
}

- (void)_connectIfNecessaryOnIvarQueue
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19DC4C000, log, OS_LOG_TYPE_ERROR, "Connection timed out trying to communicate with apsd", v1, 2u);
}

- (OS_dispatch_queue)ivarQueue
{
  return self->_ivarQueue;
}

uint64_t __43__APSConnection_setUltraConstrainedTopics___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onIvarQueue_setUltraConstrainedTopics:", *(void *)(a1 + 40));
}

uint64_t __44__APSConnection_moveTopics_fromList_toList___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processQueuedTopicMovesOnIvarQueue];
}

void __47__APSConnection__connectIfNecessaryOnIvarQueue__block_invoke(uint64_t a1, void *a2)
{
}

void __121__APSConnection__onIvarQueue_setEnabledTopics_ignoredTopics_opportunisticTopics_nonWakingTopics_sendToDaemon_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __121__APSConnection__onIvarQueue_setEnabledTopics_ignoredTopics_opportunisticTopics_nonWakingTopics_sendToDaemon_completion___block_invoke_2;
  v6[3] = &unk_1E59824F0;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v4 _handleEvent:a2 withHandler:v6];
}

- (void)_handleEvent:(id)a3 withHandler:(id)a4 errorHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (void (**)(id, id))a4;
  uint64_t v10 = (void (**)(void))a5;
  uint64_t v11 = (void *)MEMORY[0x19F3B00F0]();
  uint64_t v12 = MEMORY[0x19F3B06C0](v8);
  if (v12 != MEMORY[0x1E4F145A8])
  {
    if (v12 == MEMORY[0x1E4F14590])
    {
      if (v9) {
        v9[2](v9, v8);
      }
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  if (v8 == (id)MEMORY[0x1E4F14520])
  {
    __int16 v17 = +[APSLog connection];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_19DC4C000, v17, OS_LOG_TYPE_DEFAULT, "_handleEventWithHandler: Interrupted connection to service", (uint8_t *)&v20, 2u);
    }

    __APSConnectionInterruptedHandlerBlock_block_invoke(v18, self->_connection);
LABEL_14:
    if (!v10) {
      goto LABEL_16;
    }
LABEL_15:
    v10[2](v10);
    goto LABEL_16;
  }
  id v13 = (id)MEMORY[0x1E4F14528];
  uint64_t v14 = +[APSLog connection];
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v8 == v13)
  {
    if (v15)
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_19DC4C000, v14, OS_LOG_TYPE_DEFAULT, "_handleEventWithHandler: Connection Invalid for service", (uint8_t *)&v20, 2u);
    }

    __APSConnectionInvalidationHandlerBlock_block_invoke(v19, self->_connection);
    if (v10) {
      goto LABEL_15;
    }
  }
  else
  {
    if (v15)
    {
      string = xpc_dictionary_get_string(v8, (const char *)*MEMORY[0x1E4F14530]);
      int v20 = 136315138;
      uint64_t v21 = string;
      _os_log_impl(&dword_19DC4C000, v14, OS_LOG_TYPE_DEFAULT, "Unexpected error for service: %s", (uint8_t *)&v20, 0xCu);
    }

    if (v10) {
      goto LABEL_15;
    }
  }
LABEL_16:
}

void __121__APSConnection__onIvarQueue_setEnabledTopics_ignoredTopics_opportunisticTopics_nonWakingTopics_sendToDaemon_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = (uint64_t *)(a1 + 32);
    uint64_t v5 = v7;
    id v8 = *(NSObject **)(v7 + 112);
    if (v8)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __121__APSConnection__onIvarQueue_setEnabledTopics_ignoredTopics_opportunisticTopics_nonWakingTopics_sendToDaemon_completion___block_invoke_3;
      v10[3] = &unk_1E59824C8;
      v10[4] = v5;
      id v11 = v4;
      dispatch_async(v8, v10);
    }
    else
    {
      uint64_t v9 = +[APSLog connection];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        __121__APSConnection__onIvarQueue_setEnabledTopics_ignoredTopics_opportunisticTopics_nonWakingTopics_sendToDaemon_completion___block_invoke_2_cold_1(v6, v9);
      }
    }
  }
}

- (void)_handleEvent:(id)a3 withHandler:(id)a4
{
}

+ (BOOL)isValidEnvironment:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  BOOL v4 = (objc_opt_isKindOfClass() & 1) != 0
    && (![v3 compare:@"production"]
     || ![v3 compare:@"development"]
     || ![v3 compare:@"demo"]
     || ![v3 compare:@"qa2"]);

  return v4;
}

- (APSConnection)initWithEnvironmentName:(id)a3
{
  return [(APSConnection *)self initWithEnvironmentName:a3 namedDelegatePort:0 queue:0];
}

- (APSConnection)initWithEnvironmentName:(id)a3 namedDelegatePort:(id)a4
{
  return [(APSConnection *)self initWithEnvironmentName:a3 namedDelegatePort:a4 queue:0];
}

- (APSConnection)initWithEnvironmentName:(id)a3 queue:(id)a4
{
  return [(APSConnection *)self initWithEnvironmentName:a3 namedDelegatePort:0 queue:a4];
}

- (APSConnection)initWithEnvironmentName:(id)a3 namedDelegatePort:(id)a4 queue:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[APSLog connection];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138413058;
    BOOL v15 = self;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl(&dword_19DC4C000, v11, OS_LOG_TYPE_DEFAULT, "Initializing APSConnection %@: env=%@ port=%@ queue=%@", (uint8_t *)&v14, 0x2Au);
  }

  uint64_t v12 = [(APSConnection *)self _initWithEnvironmentName:v8 namedDelegatePort:v9 enablePushDuringSleep:0 personaUniqueString:0 queue:v10];
  return v12;
}

- (APSConnection)initWithEnvironmentName:(id)a3 namedDelegatePort:(id)a4 personaUniqueString:(id)a5 queue:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  int v14 = +[APSLog connection];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138413058;
    __int16 v18 = self;
    __int16 v19 = 2112;
    id v20 = v10;
    __int16 v21 = 2112;
    id v22 = v11;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl(&dword_19DC4C000, v14, OS_LOG_TYPE_DEFAULT, "Initializing APSConnection %@: env=%@ port=%@ queue=%@", (uint8_t *)&v17, 0x2Au);
  }

  BOOL v15 = [(APSConnection *)self _initWithEnvironmentName:v10 namedDelegatePort:v11 enablePushDuringSleep:0 personaUniqueString:v13 queue:v12];
  return v15;
}

- (id)_initWithEnvironmentName:(id)a3 namedDelegatePort:(id)a4 enablePushDuringSleep:(BOOL)a5 personaUniqueString:(id)a6 queue:(id)a7
{
  kern_return_t v38;
  mach_error_t v39;
  NSObject *v40;
  dispatch_queue_t v41;
  void *v42;
  dispatch_source_t v43;
  void *v44;
  NSObject *v45;
  void v47[4];
  char *v48;
  void handler[4];
  id v50;
  uint8_t *v51;
  objc_super v52;
  uint8_t buf[16];
  long long v54;
  long long v55;
  long long v56;
  long long v57;
  long long v58;
  long long v59;
  long long v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  if ((_os_feature_enabled_impl() & 1) != 0 || ![v13 length])
  {
    v52.receiver = self;
    v52.super_class = (Class)APSConnection;
    int v17 = [(APSConnection *)&v52 init];
    if (!v17)
    {
LABEL_32:
      self = v17;
      __int16 v16 = self;
      goto LABEL_33;
    }
    id v18 = [NSString stringWithFormat:@"APSConnection-ivarQueue: %@", v17];
    dispatch_queue_t v19 = dispatch_queue_create((const char *)[v18 UTF8String], 0);
    id v20 = (void *)*((void *)v17 + 2);
    *((void *)v17 + 2) = v19;

    uint64_t v21 = [v11 copy];
    id v22 = (void *)*((void *)v17 + 3);
    *((void *)v17 + 3) = v21;

    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v24 = (void *)*((void *)v17 + 9);
    *((void *)v17 + 9) = v23;

    *((_DWORD *)v17 + 16) = 0;
    uint64_t v25 = v17 + 64;
    *((void *)v17 + 10) = 1;
    *(int64x2_t *)(v17 + 40) = vdupq_n_s64(0x1400uLL);
    *((_DWORD *)v17 + 47) = 0;
    id v26 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v27 = [v26 processName];
    long long v28 = (void *)*((void *)v17 + 17);
    *((void *)v17 + 17) = v27;

    char v29 = [v12 isEqualToString:@"com.apple.aps.ignore.namedPort"];
    id v30 = v12;
    v31 = v30;
    BOOL v32 = 0;
    id v12 = v30;
    if (v30 && (v29 & 1) == 0)
    {
      v59 = 0u;
      uint64_t v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      *(_OWORD *)buf = 0u;
      __int16 v54 = 0u;
      if (([v30 getCString:buf maxLength:128 encoding:4] & 1) == 0) {
        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s unable to convert nameOfPort argument to UTF8 string less than %i characters", "-[APSConnection _initWithEnvironmentName:namedDelegatePort:enablePushDuringSleep:personaUniqueString:queue:]", 128);
      }
      int v33 = bootstrap_check_in2();
      BOOL v32 = v33 != 0;
      id v12 = v31;
      if (v33)
      {
        NSLog(&cfstr_UnableToBootst.isa, v31);

        id v12 = 0;
        *uint64_t v25 = 0;
      }
    }
    uint64_t v34 = [v12 copy];
    id v35 = (void *)*((void *)v17 + 7);
    *((void *)v17 + 7) = v34;

    if (v29)
    {
      __int16 v36 = +[APSLog connection];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19DC4C000, v36, OS_LOG_TYPE_DEFAULT, "Client opted out of using a mach port", buf, 2u);
      }
    }
    else
    {
      BOOL v37 = !v32;
      if (!v31) {
        BOOL v37 = 0;
      }
      if (v37) {
        goto LABEL_22;
      }
      __int16 v36 = +[APSLog connection];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        -[APSConnection _initWithEnvironmentName:namedDelegatePort:enablePushDuringSleep:personaUniqueString:queue:]();
      }
    }

LABEL_22:
    if ([*((id *)v17 + 7) length])
    {
      if ((*v25 + 1) <= 1
        && (__int16 v38 = mach_port_allocate(*MEMORY[0x1E4F14960], 1u, (mach_port_name_t *)v17 + 16)) != 0)
      {
        uint64_t v39 = v38;
        uint64_t v40 = +[APSLog connection];
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19DC4C000, v40, OS_LOG_TYPE_DEFAULT, "Failed allocating and checking into port", buf, 2u);
        }

        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"%s unable to allocate delegate port: %s", "-[APSConnection _initWithEnvironmentName:namedDelegatePort:enablePushDuringSleep:personaUniqueString:queue:]", mach_error_string(v39));
      }
      else
      {
        uint64_t v41 = dispatch_queue_create("APSPortQueue", 0);
        v42 = (void *)*((void *)v17 + 11);
        *((void *)v17 + 11) = v41;

        v43 = dispatch_source_create(MEMORY[0x1E4F14458], *((unsigned int *)v17 + 16), 0, *((dispatch_queue_t *)v17 + 11));
        id v44 = (void *)*((void *)v17 + 12);
        *((void *)v17 + 12) = v43;

        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&__int16 v54 = 0x3032000000;
        *((void *)&v54 + 1) = __Block_byref_object_copy_;
        *(void *)&long long v55 = __Block_byref_object_dispose_;
        *((void *)&v55 + 1) = *((id *)v17 + 12);
        uint64_t v45 = *((void *)v17 + 12);
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __108__APSConnection__initWithEnvironmentName_namedDelegatePort_enablePushDuringSleep_personaUniqueString_queue___block_invoke;
        handler[3] = &unk_1E59823B8;
        id v51 = buf;
        __int16 v50 = v12;
        dispatch_source_set_event_handler(v45, handler);
        dispatch_resume(*((dispatch_object_t *)v17 + 12));

        _Block_object_dispose(buf, 8);
      }
    }
    if (v14)
    {
      objc_storeStrong((id *)v17 + 14, a7);
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __108__APSConnection__initWithEnvironmentName_namedDelegatePort_enablePushDuringSleep_personaUniqueString_queue___block_invoke_43;
      v47[3] = &unk_1E5982370;
      id v48 = v17;
      objc_msgSend(v48, "_dispatch_async_to_ivarQueue:", v47);
    }
    goto LABEL_32;
  }
  BOOL v15 = +[APSLog connection];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v13;
    _os_log_impl(&dword_19DC4C000, v15, OS_LOG_TYPE_DEFAULT, "Given specific persona string, feature flag is not enabled {personaUniqueString: %@}", buf, 0xCu);
  }

  __int16 v16 = 0;
LABEL_33:

  return v16;
}

void __108__APSConnection__initWithEnvironmentName_namedDelegatePort_enablePushDuringSleep_personaUniqueString_queue___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  mach_error_t v2 = dispatch_mig_server();
  if (v2) {
    BOOL v3 = v2 == 268435459;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3 && v2 != 268451843)
  {
    mach_error_t v5 = v2;
    uint64_t v6 = +[APSLog connection];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = mach_error_string(v5);
      uint64_t v8 = [*(id *)(a1 + 32) UTF8String];
      int v9 = 136315394;
      id v10 = v7;
      __int16 v11 = 2080;
      uint64_t v12 = v8;
      _os_log_impl(&dword_19DC4C000, v6, OS_LOG_TYPE_DEFAULT, "dispatch_mig_server failed: %s   port: %s\n", (uint8_t *)&v9, 0x16u);
    }
  }
}

void __108__APSConnection__initWithEnvironmentName_namedDelegatePort_enablePushDuringSleep_personaUniqueString_queue___block_invoke_43(uint64_t a1)
{
  mach_error_t v2 = (void *)MEMORY[0x19F3B00F0]();
  [*(id *)(a1 + 32) _connectIfNecessaryOnIvarQueue];
}

- (void)_shutdownOnIvarQueue
{
  self->_isShutdown = 1;
  [(APSConnection *)self _disconnectOnIvarQueue];
  if (self->_mach_source)
  {
    mach_port_name_t handle = dispatch_source_get_handle((dispatch_source_t)self->_mach_source);
    dispatch_source_cancel_and_wait();
    if (mach_port_mod_refs(*MEMORY[0x1E4F14960], handle, 1u, -1)) {
      fwrite("mach_port_mod_refs() failed\n", 0x1CuLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
    }
    mach_source = self->_mach_source;
    self->_mach_source = 0;

    p_mach_port_name_t connectionPort = &self->_connectionPort;
  }
  else
  {
    p_mach_port_name_t connectionPort = &self->_connectionPort;
    mach_port_name_t connectionPort = self->_connectionPort;
    if (!connectionPort) {
      goto LABEL_8;
    }
    mach_port_mod_refs(*MEMORY[0x1E4F14960], connectionPort, 1u, -1);
  }
  unsigned int *p_connectionPort = 0;
LABEL_8:
  machQueue = self->_machQueue;
  if (machQueue)
  {
    self->_machQueue = 0;
  }
}

- (void)shutdown
{
  ivarQueue = self->_ivarQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__APSConnection_shutdown__block_invoke;
  block[3] = &unk_1E5982370;
  void block[4] = self;
  dispatch_sync(ivarQueue, block);
}

uint64_t __25__APSConnection_shutdown__block_invoke(uint64_t a1)
{
  mach_error_t v2 = *(void **)(a1 + 32);
  BOOL v3 = (void *)v2[14];
  if (v3)
  {
    v2[14] = 0;

    mach_error_t v2 = *(void **)(a1 + 32);
  }
  return [v2 _shutdownOnIvarQueue];
}

- (void)_shutdownFromDealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[APSLog connection];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    mach_error_t v5 = self;
    _os_log_impl(&dword_19DC4C000, v3, OS_LOG_TYPE_DEFAULT, "%@ _shutdownFromDealloc", (uint8_t *)&v4, 0xCu);
  }

  [(APSConnection *)self _shutdownOnIvarQueue];
}

- (void)dealloc
{
  self->_isDeallocing = 1;
  [(APSConnection *)self _shutdownFromDealloc];
  v3.receiver = self;
  v3.super_class = (Class)APSConnection;
  [(APSConnection *)&v3 dealloc];
}

- (APSConnectionDelegate)delegate
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__APSConnection_delegate__block_invoke;
  v5[3] = &unk_1E59823B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (APSConnectionDelegate *)v3;
}

uint64_t __25__APSConnection_delegate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) object];
  return MEMORY[0x1F41817F8]();
}

- (void)setDelegate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = _os_feature_enabled_impl();
  uint64_t v6 = +[APSLog connection];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v14 = self;
    __int16 v15 = 2112;
    if (v5) {
      uint64_t v7 = @"YES";
    }
    id v16 = v4;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_19DC4C000, v6, OS_LOG_TYPE_DEFAULT, "%@ setting delegate %@ {asyncSetDelegate: %@}", buf, 0x20u);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __29__APSConnection_setDelegate___block_invoke;
  v11[3] = &unk_1E59823E0;
  v11[4] = self;
  id v8 = v4;
  id v12 = v8;
  int v9 = (void *)MEMORY[0x19F3B0300](v11);
  ivarQueue = self->_ivarQueue;
  if (v5) {
    dispatch_async(ivarQueue, v9);
  }
  else {
    dispatch_sync(ivarQueue, v9);
  }
}

void __29__APSConnection_setDelegate___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  mach_error_t v2 = (void *)MEMORY[0x19F3B00F0]();
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = 0;

  if (*(void *)(a1 + 40))
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F59E30], "weakRefWithObject:");
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 8);
    *(void *)(v6 + 8) = v5;

    *(unsigned char *)(*(void *)(a1 + 32) + 120) = 1;
    id v8 = +[APSLog connection];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = [*(id *)(v9 + 128) count];
      *(_DWORD *)buf = 138412546;
      uint64_t v25 = v9;
      __int16 v26 = 2048;
      uint64_t v27 = v10;
      _os_log_impl(&dword_19DC4C000, v8, OS_LOG_TYPE_DEFAULT, "%@ Delivering queued delegate calls: %lu", buf, 0x16u);
    }

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v11 = *(id *)(*(void *)(a1 + 32) + 128);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = (void *)MEMORY[0x19F3B0300](*(void *)(*((void *)&v19 + 1) + 8 * v15));
          objc_msgSend(*(id *)(a1 + 32), "_asyncOnDelegateQueueWithBlock:", v16, (void)v19);

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }

    uint64_t v17 = *(void *)(a1 + 32);
    id v18 = *(void **)(v17 + 128);
    *(void *)(v17 + 128) = 0;
  }
  [*(id *)(a1 + 32) setEnableStatusNotifications:objc_opt_respondsToSelector() & 1];
}

void __65__APSConnection__asyncOnDelegateQueueWithBlock_requiresDelegate___block_invoke_58(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  mach_error_t v2 = +[APSLog connection];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(v3 + 128) count];
    int v7 = 138412546;
    uint64_t v8 = v3;
    __int16 v9 = 2048;
    uint64_t v10 = v4;
    _os_log_impl(&dword_19DC4C000, v2, OS_LOG_TYPE_DEFAULT, "%@ Flushing any queuedDelegateBlocks %lu", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = 0;
}

- (void)_noteDisconnectedFromDaemonOnIvarQueue
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[APSLog connection];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v26 = self;
    _os_log_impl(&dword_19DC4C000, v3, OS_LOG_TYPE_DEFAULT, "%@ disconnected from apsd...", buf, 0xCu);
  }

  uint64_t v4 = [(NSMutableDictionary *)self->_idsToOutgoingMessages allValues];
  uint64_t v5 = +[APSLog connection];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 count];
    *(_DWORD *)buf = 138412546;
    __int16 v26 = self;
    __int16 v27 = 2048;
    uint64_t v28 = v6;
    _os_log_impl(&dword_19DC4C000, v5, OS_LOG_TYPE_DEFAULT, "%@ failing %lu pending outgoing messages.", buf, 0x16u);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v11), "messageID", (void)v20);
        long long v19 = APSError(1, @"APSD crashed", v13, v14, v15, v16, v17, v18, v20);
        [(APSConnection *)self _deliverOutgoingMessageResultWithID:v12 error:v19 sendRTT:0];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
}

- (void)_reconnectIfNecessaryOnIvarQueueAfterDelay
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_isReconnectScheduled)
  {
    uint64_t v3 = +[APSLog connection];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = self;
      uint64_t v4 = "%@: Skipping reconnect due to already scheduled reconnect";
LABEL_7:
      uint64_t v5 = v3;
      uint32_t v6 = 12;
LABEL_8:
      _os_log_impl(&dword_19DC4C000, v5, OS_LOG_TYPE_DEFAULT, v4, buf, v6);
    }
  }
  else if (self->_connection)
  {
    uint64_t v3 = +[APSLog connection];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = self;
      uint64_t v4 = "%@: Skipping reconnect due to already being connected";
      goto LABEL_7;
    }
  }
  else
  {
    double reconnectDelay = self->_reconnectDelay;
    double v8 = reconnectDelay + reconnectDelay;
    BOOL v9 = reconnectDelay == 0.0;
    double v10 = 0.1;
    if (!v9) {
      double v10 = v8;
    }
    if (v10 > 300.0) {
      double v10 = 300.0;
    }
    self->_double reconnectDelay = v10;
    self->_isReconnectScheduled = 1;
    dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
    ivarQueue = self->_ivarQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__APSConnection__reconnectIfNecessaryOnIvarQueueAfterDelay__block_invoke;
    block[3] = &unk_1E5982370;
    void block[4] = self;
    dispatch_after(v11, ivarQueue, block);
    uint64_t v3 = +[APSLog connection];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      double v13 = self->_reconnectDelay;
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = self;
      __int16 v17 = 2048;
      double v18 = v13;
      uint64_t v4 = "%@: Will attempt reconnect in %f seconds";
      uint64_t v5 = v3;
      uint32_t v6 = 22;
      goto LABEL_8;
    }
  }
}

unsigned char *__59__APSConnection__reconnectIfNecessaryOnIvarQueueAfterDelay__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 152) = 0;
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (!result[153] && !result[154]) {
    return (unsigned char *)[result _connectIfNecessaryOnIvarQueue];
  }
  return result;
}

void __47__APSConnection__connectIfNecessaryOnIvarQueue__block_invoke_2(void *a1)
{
  uint64_t v2 = *(void *)(a1[4] + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(a1[5] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  uint64_t v6 = *(void *)(a1[6] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  uint64_t v8 = *(void *)(a1[7] + 8);
  BOOL v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;

  uint64_t v10 = *(void *)(a1[8] + 8);
  dispatch_time_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;

  uint64_t v12 = *(void *)(a1[9] + 8);
  double v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0;
}

void __47__APSConnection__connectIfNecessaryOnIvarQueue__block_invoke_3(void *a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (!v3)
  {
    uint64_t v6 = @"no reply received!";
    goto LABEL_7;
  }
  uint64_t v5 = MEMORY[0x19F3B06C0](v3);
  if (v5 == MEMORY[0x1E4F145A8])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s", xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E4F14530]));
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v6) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v10 = APSGetEnabledTopicsFromXPCDictionary(v4);
    uint64_t v11 = *(void *)(a1[6] + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    uint64_t v13 = APSGetIgnoredTopicsFromXPCDictionary(v4);
    uint64_t v14 = *(void *)(a1[7] + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    uint64_t v16 = APSGetOpportunisticTopicsFromXPCDictionary(v4);
    uint64_t v17 = *(void *)(a1[8] + 8);
    double v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    uint64_t v19 = APSGetNonWakingTopicsFromXPCDictionary(v4);
    uint64_t v20 = *(void *)(a1[9] + 8);
    long long v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

    *(unsigned char *)(*(void *)(a1[10] + 8) + 24) = APSGetEnableCriticalReliability(v4, 0);
    *(unsigned char *)(*(void *)(a1[11] + 8) + 24) = APSGetEnableStatusNotifications(v4, 0);
    *(unsigned char *)(*(void *)(a1[12] + 8) + 24) = APSGetTrackActivityPresence(v4, 0);
    uint64_t v22 = APSGetXPCDataFromDictionary(v4, "publicToken");
    uint64_t v23 = *(void *)(a1[13] + 8);
    id v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;

    *(void *)(*(void *)(a1[14] + 8) + 24) = (int)APSGetXPCIntFromDictionary(v4, "messageSize");
    *(void *)(*(void *)(a1[15] + 8) + 24) = (int)APSGetXPCIntFromDictionary(v4, "largeMessageSize");
    uint64_t v6 = 0;
    *(unsigned char *)(*(void *)(a1[16] + 8) + 24) = APSGetXPCBoolFromDictionary(v4, "isConnected");
    char v9 = 1;
    goto LABEL_11;
  }
  if (v5 == MEMORY[0x1E4F14590]) {
    goto LABEL_10;
  }
  uint64_t v6 = @"Received reply is not of type dictionary!";
LABEL_7:
  id v7 = +[APSLog connection];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = a1[4];
    *(_DWORD *)buf = 138412546;
    uint64_t v27 = v8;
    __int16 v28 = 2112;
    uint64_t v29 = v6;
    _os_log_impl(&dword_19DC4C000, v7, OS_LOG_TYPE_DEFAULT, "%@ Bad response from apsd: %@", buf, 0x16u);
  }

  char v9 = 0;
LABEL_11:
  *(unsigned char *)(*(void *)(a1[17] + 8) + 24) = v9;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    uint64_t v25 = a1[5];
    if (v25) {
      dispatch_semaphore_signal(v25);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1[18] + 8) + 40));
}

- (void)_connectIfNecessary
{
  ivarQueue = self->_ivarQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__APSConnection__connectIfNecessary__block_invoke;
  block[3] = &unk_1E5982370;
  void block[4] = self;
  dispatch_sync(ivarQueue, block);
}

uint64_t __36__APSConnection__connectIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connectIfNecessaryOnIvarQueue];
}

+ (void)_safelyCancelAndReleaseConnection:(id)a3
{
  id v3 = (_xpc_connection_s *)a3;
  uint64_t v4 = v3;
  if (v3)
  {
    xpc_connection_set_event_handler(v3, &__block_literal_global_91);
    xpc_connection_cancel(v4);
    uint64_t v5 = v4;
    dispatch_time_t v6 = dispatch_time(0, 10000000000);
    id v7 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__APSConnection__safelyCancelAndReleaseConnection___block_invoke_2;
    block[3] = &unk_1E5982370;
    uint64_t v10 = v5;
    uint64_t v8 = v5;
    dispatch_after(v6, v7, block);
  }
}

- (void)_cancelConnectionOnIvarQueue
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = +[APSLog connection];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = self;
    _os_log_impl(&dword_19DC4C000, v3, OS_LOG_TYPE_DEFAULT, "%@ _cancelConnection called", (uint8_t *)&v6, 0xCu);
  }

  connection = self->_connection;
  if (connection)
  {
    xpc_connection_cancel(connection);
    uint64_t v5 = self->_connection;
    self->_connection = 0;

    [(APSConnection *)self _deliverConnectionStatusChange:0];
  }
}

- (void)_cancelConnection
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __34__APSConnection__cancelConnection__block_invoke;
  v2[3] = &unk_1E5982370;
  v2[4] = self;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v2];
}

uint64_t __34__APSConnection__cancelConnection__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelConnectionOnIvarQueue];
}

- (void)_disconnectOnIvarQueue
{
  self->_isDisconnected = 1;
  connection = self->_connection;
  if (connection) {
    APSXPCConnectionSetEventHandlers(connection, 0, 0, 0);
  }
  [(APSConnection *)self _cancelConnectionOnIvarQueue];
}

- (void)_disconnect
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __28__APSConnection__disconnect__block_invoke;
  v2[3] = &unk_1E5982370;
  v2[4] = self;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v2];
}

uint64_t __28__APSConnection__disconnect__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _disconnectOnIvarQueue];
}

- (void)_disconnectFromDealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = +[APSLog connection];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = self;
    _os_log_impl(&dword_19DC4C000, v3, OS_LOG_TYPE_DEFAULT, "%@ _disconnectFromDealloc", (uint8_t *)&v4, 0xCu);
  }

  [(APSConnection *)self _disconnectOnIvarQueue];
}

- (void)scheduleInRunLoop:(id)a3
{
  id v4 = a3;
  if (!scheduleInRunLoop__sRunLoopSource) {
    scheduleInRunLoop__sRunLoopSource = (uint64_t)CFRunLoopSourceCreate(0, 0, &scheduleInRunLoop__sourceContext);
  }
  uint64_t v5 = (__CFRunLoop *)[v4 getCFRunLoop];
  CFRunLoopAddSource(v5, (CFRunLoopSourceRef)scheduleInRunLoop__sRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__APSConnection_scheduleInRunLoop___block_invoke;
  v7[3] = &unk_1E59823E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v7];
}

uint64_t __35__APSConnection_scheduleInRunLoop___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[APSLog connection];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v20 = 138412290;
    uint64_t v21 = v3;
    _os_log_impl(&dword_19DC4C000, v2, OS_LOG_TYPE_DEFAULT, "%@ scheduleInRunLoop called", (uint8_t *)&v20, 0xCu);
  }

  if (*(void *)(*(void *)(a1 + 32) + 112))
  {
    id v4 = +[APSLog connection];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __35__APSConnection_scheduleInRunLoop___block_invoke_cold_1(v4);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 112);
    if (v6)
    {
      *(void *)(v5 + 112) = 0;
    }
  }
  id v7 = *(void **)(a1 + 40);
  id v8 = [MEMORY[0x1E4F1CAC0] mainRunLoop];

  char v9 = +[APSLog connection];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7 == v8)
  {
    if (v10)
    {
      uint64_t v15 = *(void *)(a1 + 32);
      int v20 = 138412290;
      uint64_t v21 = v15;
      _os_log_impl(&dword_19DC4C000, v9, OS_LOG_TYPE_DEFAULT, "%@ scheduleInRunLoop called with main runloop. Scheduling on main serial queue.", (uint8_t *)&v20, 0xCu);
    }

    uint64_t v16 = MEMORY[0x1E4F14428];
    id v17 = MEMORY[0x1E4F14428];
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v14 = *(void **)(v18 + 112);
    *(void *)(v18 + 112) = v16;
  }
  else
  {
    if (v10)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v20 = 138412290;
      uint64_t v21 = v11;
      _os_log_impl(&dword_19DC4C000, v9, OS_LOG_TYPE_DEFAULT, "%@ scheduleInRunLoop called with non-main runloop. Scheduling on non-main serial queue.", (uint8_t *)&v20, 0xCu);
    }

    dispatch_queue_t v12 = dispatch_queue_create("APSConnectionQueue", 0);
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void **)(v13 + 112);
    *(void *)(v13 + 112) = v12;
  }

  return [*(id *)(a1 + 32) _connectIfNecessaryOnIvarQueue];
}

- (void)removeFromRunLoop
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[APSLog connection];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v6 = self;
    _os_log_impl(&dword_19DC4C000, v3, OS_LOG_TYPE_DEFAULT, "%@ removeFromRunLoop", buf, 0xCu);
  }

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__APSConnection_removeFromRunLoop__block_invoke;
  v4[3] = &unk_1E5982370;
  v4[4] = self;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v4];
}

uint64_t __34__APSConnection_removeFromRunLoop__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[14];
  if (v3)
  {
    v2[14] = 0;

    uint64_t v2 = *(void **)(a1 + 32);
  }
  return [v2 _disconnectOnIvarQueue];
}

uint64_t __121__APSConnection__onIvarQueue_setEnabledTopics_ignoredTopics_opportunisticTopics_nonWakingTopics_sendToDaemon_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[APSLog connection];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19DC4C000, v2, OS_LOG_TYPE_DEFAULT, "%@ calling topics completion", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_setEnabledTopics:(id)a3 ignoredTopics:(id)a4 opportunisticTopics:(id)a5 nonWakingTopics:(id)a6 sendToDaemon:(BOOL)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __109__APSConnection__setEnabledTopics_ignoredTopics_opportunisticTopics_nonWakingTopics_sendToDaemon_completion___block_invoke;
  v24[3] = &unk_1E5982540;
  v24[4] = self;
  id v25 = v14;
  id v26 = v15;
  id v27 = v16;
  BOOL v30 = a7;
  id v28 = v17;
  id v29 = v18;
  id v19 = v18;
  id v20 = v17;
  id v21 = v16;
  id v22 = v15;
  id v23 = v14;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v24];
}

uint64_t __109__APSConnection__setEnabledTopics_ignoredTopics_opportunisticTopics_nonWakingTopics_sendToDaemon_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onIvarQueue_setEnabledTopics:ignoredTopics:opportunisticTopics:nonWakingTopics:sendToDaemon:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(unsigned __int8 *)(a1 + 80), *(void *)(a1 + 72));
}

- (void)setEnabledTopics:(id)a3 ignoredTopics:(id)a4 opportunisticTopics:(id)a5 nonWakingTopics:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = (void *)[a3 copy];
  id v17 = (void *)[v15 copy];

  id v18 = (void *)[v14 copy];
  id v19 = (void *)[v13 copy];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __95__APSConnection_setEnabledTopics_ignoredTopics_opportunisticTopics_nonWakingTopics_completion___block_invoke;
  v25[3] = &unk_1E5982568;
  v25[4] = self;
  id v26 = v16;
  id v27 = v17;
  id v28 = v18;
  id v29 = v19;
  id v30 = v12;
  id v20 = v12;
  id v21 = v19;
  id v22 = v18;
  id v23 = v17;
  id v24 = v16;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v25];
}

uint64_t __95__APSConnection_setEnabledTopics_ignoredTopics_opportunisticTopics_nonWakingTopics_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onIvarQueue_setEnabledTopics:ignoredTopics:opportunisticTopics:nonWakingTopics:sendToDaemon:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), 1, *(void *)(a1 + 72));
}

- (void)setEnabledTopics:(id)a3 ignoredTopics:(id)a4 opportunisticTopics:(id)a5 nonWakingTopics:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = (void *)[a3 copy];
  id v14 = (void *)[v12 copy];

  id v15 = (void *)[v11 copy];
  id v16 = (void *)[v10 copy];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __84__APSConnection_setEnabledTopics_ignoredTopics_opportunisticTopics_nonWakingTopics___block_invoke;
  v21[3] = &unk_1E5982590;
  v21[4] = self;
  id v22 = v13;
  id v23 = v14;
  id v24 = v15;
  id v25 = v16;
  id v17 = v16;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v21];
}

uint64_t __84__APSConnection_setEnabledTopics_ignoredTopics_opportunisticTopics_nonWakingTopics___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onIvarQueue_setEnabledTopics:ignoredTopics:opportunisticTopics:nonWakingTopics:sendToDaemon:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), 1, 0);
}

- (void)setEnabledTopics:(id)a3 ignoredTopics:(id)a4 opportunisticTopics:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)[a3 copy];
  id v11 = (void *)[v9 copy];

  id v12 = (void *)[v8 copy];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__APSConnection_setEnabledTopics_ignoredTopics_opportunisticTopics___block_invoke;
  v16[3] = &unk_1E59825B8;
  v16[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v19 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v16];
}

uint64_t __68__APSConnection_setEnabledTopics_ignoredTopics_opportunisticTopics___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onIvarQueue_setEnabledTopics:ignoredTopics:opportunisticTopics:nonWakingTopics:sendToDaemon:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(*(void *)(a1 + 32) + 216), 1, 0);
}

- (void)setEnabledTopics:(id)a3 ignoredTopics:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)[a3 copy];
  id v8 = (void *)[v6 copy];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__APSConnection_setEnabledTopics_ignoredTopics___block_invoke;
  v11[3] = &unk_1E59825E0;
  v11[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v11];
}

uint64_t __48__APSConnection_setEnabledTopics_ignoredTopics___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onIvarQueue_setEnabledTopics:ignoredTopics:opportunisticTopics:nonWakingTopics:sendToDaemon:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(*(void *)(a1 + 32) + 208), *(void *)(*(void *)(a1 + 32) + 216), 1, 0);
}

- (void)_setEnabledTopics:(id)a3
{
  id v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__APSConnection__setEnabledTopics___block_invoke;
  v6[3] = &unk_1E59823E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v6];
}

uint64_t __35__APSConnection__setEnabledTopics___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onIvarQueue_setEnabledTopics:ignoredTopics:opportunisticTopics:nonWakingTopics:sendToDaemon:completion:", *(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 200), *(void *)(*(void *)(a1 + 32) + 208), *(void *)(*(void *)(a1 + 32) + 216), 1, 0);
}

- (void)_setOpportunisticTopics:(id)a3
{
  id v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__APSConnection__setOpportunisticTopics___block_invoke;
  v6[3] = &unk_1E59823E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v6];
}

uint64_t __41__APSConnection__setOpportunisticTopics___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onIvarQueue_setEnabledTopics:ignoredTopics:opportunisticTopics:nonWakingTopics:sendToDaemon:completion:", *(void *)(*(void *)(a1 + 32) + 192), *(void *)(*(void *)(a1 + 32) + 200), *(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 216), 1, 0);
}

- (void)_setIgnoredTopics:(id)a3
{
  id v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__APSConnection__setIgnoredTopics___block_invoke;
  v6[3] = &unk_1E59823E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v6];
}

uint64_t __35__APSConnection__setIgnoredTopics___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onIvarQueue_setEnabledTopics:ignoredTopics:opportunisticTopics:nonWakingTopics:sendToDaemon:completion:", *(void *)(*(void *)(a1 + 32) + 192), *(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 208), *(void *)(*(void *)(a1 + 32) + 216), 1, 0);
}

- (void)_setNonWakingTopics:(id)a3
{
  id v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__APSConnection__setNonWakingTopics___block_invoke;
  v6[3] = &unk_1E59823E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v6];
}

uint64_t __37__APSConnection__setNonWakingTopics___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onIvarQueue_setEnabledTopics:ignoredTopics:opportunisticTopics:nonWakingTopics:sendToDaemon:completion:", *(void *)(*(void *)(a1 + 32) + 192), *(void *)(*(void *)(a1 + 32) + 200), *(void *)(*(void *)(a1 + 32) + 208), *(void *)(a1 + 40), 1, 0);
}

- (NSArray)enabledTopics
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__APSConnection_enabledTopics__block_invoke;
  v5[3] = &unk_1E59823B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __30__APSConnection_enabledTopics__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 192) copy];
  return MEMORY[0x1F41817F8]();
}

- (NSArray)ignoredTopics
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__APSConnection_ignoredTopics__block_invoke;
  v5[3] = &unk_1E59823B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __30__APSConnection_ignoredTopics__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 200) copy];
  return MEMORY[0x1F41817F8]();
}

- (NSArray)opportunisticTopics
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__APSConnection_opportunisticTopics__block_invoke;
  v5[3] = &unk_1E59823B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __36__APSConnection_opportunisticTopics__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 208) copy];
  return MEMORY[0x1F41817F8]();
}

- (NSArray)nonWakingTopics
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__APSConnection_nonWakingTopics__block_invoke;
  v5[3] = &unk_1E59823B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __32__APSConnection_nonWakingTopics__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 216) copy];
  return MEMORY[0x1F41817F8]();
}

- (NSData)publicToken
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__APSConnection_publicToken__block_invoke;
  v5[3] = &unk_1E5982608;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSData *)v3;
}

void __28__APSConnection_publicToken__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _connectIfNecessaryOnIvarQueue];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = +[APSLog connection];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v8 = 138412546;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_19DC4C000, v5, OS_LOG_TYPE_DEFAULT, "%@ asked for publicToken, got %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)_setTrackActivityPresence:(BOOL)a3 sendToDaemon:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = +[APSLog connection];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = @"NO";
    if (v5) {
      uint64_t v9 = @"YES";
    }
    else {
      uint64_t v9 = @"NO";
    }
    *(_DWORD *)buf = 138412802;
    id v14 = self;
    id v16 = v9;
    __int16 v15 = 2112;
    if (v4) {
      int v8 = @"YES";
    }
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl(&dword_19DC4C000, v7, OS_LOG_TYPE_DEFAULT, "%@ _setTrackActivityPresence %@ sendToDaemon %@", buf, 0x20u);
  }

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__APSConnection__setTrackActivityPresence_sendToDaemon___block_invoke;
  v10[3] = &unk_1E5982658;
  v10[4] = self;
  BOOL v11 = v5;
  BOOL v12 = v4;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v10];
}

void __56__APSConnection__setTrackActivityPresence_sendToDaemon___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 71) != v2)
  {
    *(unsigned char *)(v1 + 71) = v2;
    if (*(unsigned char *)(a1 + 41))
    {
      [*(id *)(a1 + 32) _connectIfNecessaryOnIvarQueue];
      if (*(void *)(*(void *)(a1 + 32) + 104))
      {
        BOOL v4 = xpc_dictionary_create(0, 0, 0);
        BOOL v5 = (const char *)[@"message-type" UTF8String];
        APSInsertIntsToXPCDictionary(v4, v5, v6, v7, v8, v9, v10, v11, 4);
        [*(id *)(a1 + 32) _addTrackActivityPresenceToXPCMessage:v4];
        uint64_t v12 = *(void *)(a1 + 32);
        id v13 = *(_xpc_connection_s **)(v12 + 104);
        id v14 = *(NSObject **)(v12 + 16);
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __56__APSConnection__setTrackActivityPresence_sendToDaemon___block_invoke_2;
        handler[3] = &unk_1E5982450;
        handler[4] = v12;
        xpc_connection_send_message_with_reply(v13, v4, v14, handler);
      }
      else
      {
        BOOL v4 = +[APSLog connection];
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          uint64_t v18 = v15;
          _os_log_impl(&dword_19DC4C000, v4, OS_LOG_TYPE_DEFAULT, "%@ _connection is NULL in _setTrackActivityPresence!", buf, 0xCu);
        }
      }
    }
  }
}

void __56__APSConnection__setTrackActivityPresence_sendToDaemon___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__APSConnection__setTrackActivityPresence_sendToDaemon___block_invoke_3;
  v6[3] = &unk_1E5982630;
  BOOL v4 = *(void **)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  [v4 _handleEvent:v5 withHandler:v6];
}

uint64_t __56__APSConnection__setTrackActivityPresence_sendToDaemon___block_invoke_3(uint64_t a1)
{
  BOOL v2 = APSGetTrackActivityPresence(*(void **)(a1 + 32), 0);
  id v3 = *(void **)(a1 + 40);
  return [v3 _setTrackActivityPresence:v2 sendToDaemon:0];
}

- (void)setTrackActivityPresence:(BOOL)a3
{
}

- (BOOL)trackActivityPresence
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__APSConnection_trackActivityPresence__block_invoke;
  v5[3] = &unk_1E5982608;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__APSConnection_trackActivityPresence__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _connectIfNecessaryOnIvarQueue];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 71);
  return result;
}

- (void)setMessageSize:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = +[APSLog connection];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v8 = self;
    __int16 v9 = 2048;
    unint64_t v10 = a3;
    _os_log_impl(&dword_19DC4C000, v5, OS_LOG_TYPE_DEFAULT, "%@ setMessageSize: %lu", buf, 0x16u);
  }

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__APSConnection_setMessageSize___block_invoke;
  v6[3] = &unk_1E5982680;
  void v6[4] = self;
  void v6[5] = a3;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v6];
}

uint64_t __32__APSConnection_setMessageSize___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 40) = *(void *)(result + 40);
  return result;
}

- (void)setLargeMessageSize:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = +[APSLog connection];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    __int16 v9 = self;
    __int16 v10 = 2048;
    unint64_t v11 = a3;
    _os_log_impl(&dword_19DC4C000, v5, OS_LOG_TYPE_DEFAULT, "%@ setLargeMessageSize: %lu", buf, 0x16u);
  }

  ivarQueue = self->_ivarQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__APSConnection_setLargeMessageSize___block_invoke;
  v7[3] = &unk_1E5982680;
  v7[4] = self;
  void v7[5] = a3;
  dispatch_async(ivarQueue, v7);
}

uint64_t __37__APSConnection_setLargeMessageSize___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 48) = *(void *)(result + 40);
  return result;
}

+ (__SecIdentity)copyIdentity
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__APSConnection_copyIdentity__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (copyIdentity_onceToken != -1) {
    dispatch_once(&copyIdentity_onceToken, block);
  }
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__APSConnection_copyIdentity__block_invoke_2;
  v4[3] = &unk_1E59826A8;
  v4[4] = &v5;
  dispatch_sync((dispatch_queue_t)sIdentityQueue, v4);
  BOOL v2 = (__SecIdentity *)v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __29__APSConnection_copyIdentity__block_invoke(uint64_t a1)
{
  dispatch_queue_t v2 = dispatch_queue_create("copyIdentityQueue", 0);
  char v3 = (void *)sIdentityQueue;
  sIdentityQueue = (uint64_t)v2;

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v5) = info.denom;
  LODWORD(v4) = info.numer;
  *(double *)&copyIdentity_sTimeScale = (double)v4 / (double)v5 * 0.000000001;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)_APSClientIdentityUpdatedNotificationFired, @"APSClientIdentityUpdatedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

CFTypeRef __29__APSConnection_copyIdentity__block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = sIdentity;
  char v3 = +[APSLog connection];
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19DC4C000, v3, OS_LOG_TYPE_DEFAULT, "Returning cached identity", buf, 2u);
    }

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sIdentity;
    CFTypeRef v5 = *(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    return CFRetain(v5);
  }
  if (v4)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19DC4C000, v3, OS_LOG_TYPE_DEFAULT, "Copying identity...", buf, 2u);
  }

  CFTypeRef result = 0;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B550], @"com.apple.apsd");
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B788], @"APSClientIdentity");
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B990]);
  uint64_t v7 = (const void *)*MEMORY[0x1E4F1CFD0];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BC80], (const void *)*MEMORY[0x1E4F1CFD0]);
  uint64_t v8 = +[APSMultiUserMode sharedInstance];
  int v9 = [v8 isMultiUser];

  if (v9) {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BD20], v7);
  }
  OSStatus v10 = SecItemCopyMatching(Mutable, &result);
  if (v10 != -25300 && v10)
  {
    uint64_t v15 = v10;
    NSLog(&cfstr_Secitemcopymat.isa, v10);
    unint64_t v11 = +[APSLog connection];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v19 = v15;
      uint64_t v12 = "SecItemCopyMatching() failed: %ld";
      id v13 = v11;
      uint32_t v14 = 12;
      goto LABEL_18;
    }
LABEL_19:

    goto LABEL_20;
  }
  if (!result)
  {
    NSLog(&cfstr_NoIdentityFoun.isa);
    unint64_t v11 = +[APSLog connection];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v12 = "No identity found!";
      id v13 = v11;
      uint32_t v14 = 2;
LABEL_18:
      _os_log_impl(&dword_19DC4C000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
LABEL_20:
  CFRelease(Mutable);
  CFTypeRef v5 = (CFTypeRef)sIdentity;
  if ((CFTypeRef)sIdentity != result)
  {
    if (sIdentity) {
      CFRelease((CFTypeRef)sIdentity);
    }
    *(double *)&copyIdentity_sCacheMachAge = *(double *)&copyIdentity_sTimeScale * (double)mach_absolute_time();
    sIdentity = (uint64_t)result;
    dispatch_time_t v16 = dispatch_time(0, 60000000000);
    dispatch_after(v16, (dispatch_queue_t)sIdentityQueue, &__block_literal_global_131);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sIdentity;
    CFTypeRef v5 = *(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    if (v5) {
      return CFRetain(v5);
    }
  }
  return v5;
}

void __29__APSConnection_copyIdentity__block_invoke_129()
{
  if (-(*(double *)&copyIdentity_sCacheMachAge - (double)mach_absolute_time() * *(double *)&copyIdentity_sTimeScale) > 30.0
    && sIdentity != 0)
  {
    uint64_t v1 = +[APSLog connection];
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v2 = 0;
      _os_log_impl(&dword_19DC4C000, v1, OS_LOG_TYPE_DEFAULT, "Flushing cached identity", v2, 2u);
    }

    CFRelease((CFTypeRef)sIdentity);
    sIdentity = 0;
  }
}

+ (void)_flushIdentityCache
{
  if (sIdentityQueue) {
    dispatch_async((dispatch_queue_t)sIdentityQueue, &__block_literal_global_133);
  }
}

void __36__APSConnection__flushIdentityCache__block_invoke()
{
  if (sIdentity)
  {
    v0 = +[APSLog connection];
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v1 = 0;
      _os_log_impl(&dword_19DC4C000, v0, OS_LOG_TYPE_DEFAULT, "Flushing cached identity", v1, 2u);
    }

    CFRelease((CFTypeRef)sIdentity);
    sIdentity = 0;
  }
}

- (void)signDataWithDeviceIdentity:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__APSConnection_signDataWithDeviceIdentity_withCompletion___block_invoke;
  v10[3] = &unk_1E59826D0;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v10];
}

void __59__APSConnection_signDataWithDeviceIdentity_withCompletion___block_invoke(id *a1)
{
  [a1[4] _connectIfNecessaryOnIvarQueue];
  if (*((void *)a1[4] + 13))
  {
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    char v3 = (const char *)[@"message-type" UTF8String];
    APSInsertIntsToXPCDictionary(v2, v3, v4, v5, v6, v7, v8, v9, 26);
    OSStatus v10 = [a1[5] data];

    if (v10)
    {
      id v11 = [a1[5] data];
      APSInsertDatasToXPCDictionary(v2, "dataToSign", v12, v13, v14, v15, v16, v17, (uint64_t)v11);
    }
    uint64_t v18 = [a1[5] time];

    if (v18)
    {
      uint64_t v19 = [a1[5] time];
      uint64_t v20 = [v19 unsignedLongLongValue];
      APSInsertUnsignedLongLongsToXPCDictionary(v2, "serverTime", v21, v22, v23, v24, v25, v26, v20);
    }
    id v27 = +[APSLog connection];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19DC4C000, v27, OS_LOG_TYPE_DEFAULT, "Requesting to sign data with device push identity", buf, 2u);
    }

    id v28 = a1[4];
    id v29 = (_xpc_connection_s *)*((void *)v28 + 13);
    id v30 = *((void *)v28 + 2);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __59__APSConnection_signDataWithDeviceIdentity_withCompletion___block_invoke_136;
    handler[3] = &unk_1E5982518;
    handler[4] = v28;
    id v32 = a1[6];
    xpc_connection_send_message_with_reply(v29, v2, v30, handler);
  }
}

void __59__APSConnection_signDataWithDeviceIdentity_withCompletion___block_invoke_136(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__APSConnection_signDataWithDeviceIdentity_withCompletion___block_invoke_2;
  v6[3] = &unk_1E5982518;
  id v7 = v3;
  uint64_t v4 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 _handleEvent:v5 withHandler:v6];
}

void __59__APSConnection_signDataWithDeviceIdentity_withCompletion___block_invoke_2(uint64_t a1)
{
  id v5 = objc_alloc_init(APSSignDataWithIdentityResponse);
  xpc_object_t v2 = APSGetXPCArrayFromDictionary(*(void **)(a1 + 32), "pushCerts");
  [(APSSignDataWithIdentityResponse *)v5 setCertificates:v2];

  id v3 = APSGetXPCDataFromDictionary(*(void **)(a1 + 32), "nonce");
  [(APSSignDataWithIdentityResponse *)v5 setNonce:v3];

  uint64_t v4 = APSGetXPCDataFromDictionary(*(void **)(a1 + 32), "sig");
  [(APSSignDataWithIdentityResponse *)v5 setSignature:v4];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)rollBAACertsWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__APSConnection_rollBAACertsWithCompletion___block_invoke;
  v6[3] = &unk_1E59824C8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v6];
}

void __44__APSConnection_rollBAACertsWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _connectIfNecessaryOnIvarQueue];
  if (*(void *)(*(void *)(a1 + 32) + 104))
  {
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    id v3 = (const char *)[@"message-type" UTF8String];
    APSInsertIntsToXPCDictionary(v2, v3, v4, v5, v6, v7, v8, v9, 27);
    OSStatus v10 = +[APSLog connection];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19DC4C000, v10, OS_LOG_TYPE_DEFAULT, "Requesting to roll BAA certs and push identity for all environments", buf, 2u);
    }

    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(_xpc_connection_s **)(v11 + 104);
    uint64_t v13 = *(NSObject **)(v11 + 16);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __44__APSConnection_rollBAACertsWithCompletion___block_invoke_141;
    handler[3] = &unk_1E5982518;
    handler[4] = v11;
    id v15 = *(id *)(a1 + 40);
    xpc_connection_send_message_with_reply(v12, v2, v13, handler);
  }
}

void __44__APSConnection_rollBAACertsWithCompletion___block_invoke_141(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__APSConnection_rollBAACertsWithCompletion___block_invoke_2;
  v6[3] = &unk_1E5982518;
  id v7 = v3;
  uint64_t v4 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 _handleEvent:v5 withHandler:v6];
}

void __44__APSConnection_rollBAACertsWithCompletion___block_invoke_2(uint64_t a1)
{
  APSGetXPCArrayFromDictionary(*(void **)(a1 + 32), "pushCerts");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)isConnected
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__APSConnection_isConnected__block_invoke;
  v5[3] = &unk_1E5982608;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __28__APSConnection_isConnected__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _connectIfNecessaryOnIvarQueue];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 70);
  return result;
}

- (void)_setEnableCriticalReliability:(BOOL)a3 sendToDaemon:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = +[APSLog connection];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = @"NO";
    if (v5) {
      char v9 = @"YES";
    }
    else {
      char v9 = @"NO";
    }
    *(_DWORD *)buf = 138412802;
    uint64_t v14 = self;
    uint64_t v16 = v9;
    __int16 v15 = 2112;
    if (v4) {
      uint64_t v8 = @"YES";
    }
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    _os_log_impl(&dword_19DC4C000, v7, OS_LOG_TYPE_DEFAULT, "%@ setEnableCriticalReliability %@ sendToDaemon %@", buf, 0x20u);
  }

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__APSConnection__setEnableCriticalReliability_sendToDaemon___block_invoke;
  v10[3] = &unk_1E5982658;
  v10[4] = self;
  BOOL v11 = v5;
  BOOL v12 = v4;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v10];
}

void __60__APSConnection__setEnableCriticalReliability_sendToDaemon___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 68) != v2)
  {
    *(unsigned char *)(v1 + 68) = v2;
    if (*(unsigned char *)(a1 + 41))
    {
      [*(id *)(a1 + 32) _connectIfNecessaryOnIvarQueue];
      if (*(void *)(*(void *)(a1 + 32) + 104))
      {
        BOOL v4 = xpc_dictionary_create(0, 0, 0);
        BOOL v5 = (const char *)[@"message-type" UTF8String];
        APSInsertIntsToXPCDictionary(v4, v5, v6, v7, v8, v9, v10, v11, 2);
        [*(id *)(a1 + 32) _addEnableCriticalReliabilityToXPCMessage:v4];
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v13 = *(_xpc_connection_s **)(v12 + 104);
        uint64_t v14 = *(NSObject **)(v12 + 16);
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __60__APSConnection__setEnableCriticalReliability_sendToDaemon___block_invoke_2;
        handler[3] = &unk_1E5982450;
        handler[4] = v12;
        xpc_connection_send_message_with_reply(v13, v4, v14, handler);
      }
      else
      {
        BOOL v4 = +[APSLog connection];
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          uint64_t v18 = v15;
          _os_log_impl(&dword_19DC4C000, v4, OS_LOG_TYPE_DEFAULT, "%@ _connection is NULL in _sendEnableCriticalReliability!", buf, 0xCu);
        }
      }
    }
  }
}

void __60__APSConnection__setEnableCriticalReliability_sendToDaemon___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__APSConnection__setEnableCriticalReliability_sendToDaemon___block_invoke_3;
  v6[3] = &unk_1E5982630;
  BOOL v4 = *(void **)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  [v4 _handleEvent:v5 withHandler:v6];
}

uint64_t __60__APSConnection__setEnableCriticalReliability_sendToDaemon___block_invoke_3(uint64_t a1)
{
  BOOL v2 = APSGetEnableCriticalReliability(*(void **)(a1 + 32), 0);
  id v3 = *(void **)(a1 + 40);
  return [v3 _setEnableCriticalReliability:v2 sendToDaemon:0];
}

- (void)setEnableCriticalReliability:(BOOL)a3
{
}

- (void)_setEnableStatusNotifications:(BOOL)a3 sendToDaemon:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = +[APSLog connection];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = @"NO";
    if (v5) {
      uint64_t v9 = @"YES";
    }
    else {
      uint64_t v9 = @"NO";
    }
    *(_DWORD *)buf = 138412802;
    uint64_t v14 = self;
    uint64_t v16 = v9;
    __int16 v15 = 2112;
    if (v4) {
      uint64_t v8 = @"YES";
    }
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    _os_log_impl(&dword_19DC4C000, v7, OS_LOG_TYPE_DEFAULT, "%@ _setEnableStatusNotifications %@ sendToDaemon %@", buf, 0x20u);
  }

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__APSConnection__setEnableStatusNotifications_sendToDaemon___block_invoke;
  v10[3] = &unk_1E5982658;
  v10[4] = self;
  BOOL v11 = v5;
  BOOL v12 = v4;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v10];
}

void __60__APSConnection__setEnableStatusNotifications_sendToDaemon___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 69) != v2)
  {
    *(unsigned char *)(v1 + 69) = v2;
    if (*(unsigned char *)(a1 + 41))
    {
      [*(id *)(a1 + 32) _connectIfNecessaryOnIvarQueue];
      if (*(void *)(*(void *)(a1 + 32) + 104))
      {
        BOOL v4 = xpc_dictionary_create(0, 0, 0);
        BOOL v5 = (const char *)[@"message-type" UTF8String];
        APSInsertIntsToXPCDictionary(v4, v5, v6, v7, v8, v9, v10, v11, 3);
        [*(id *)(a1 + 32) _addEnableStatusNotificationsToXPCMessage:v4];
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v13 = *(_xpc_connection_s **)(v12 + 104);
        uint64_t v14 = *(NSObject **)(v12 + 16);
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __60__APSConnection__setEnableStatusNotifications_sendToDaemon___block_invoke_2;
        handler[3] = &unk_1E5982450;
        handler[4] = v12;
        xpc_connection_send_message_with_reply(v13, v4, v14, handler);
      }
      else
      {
        BOOL v4 = +[APSLog connection];
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          uint64_t v18 = v15;
          _os_log_impl(&dword_19DC4C000, v4, OS_LOG_TYPE_DEFAULT, "%@ _connection is NULL in _sendEnableStatusNotifications.", buf, 0xCu);
        }
      }
    }
  }
}

void __60__APSConnection__setEnableStatusNotifications_sendToDaemon___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__APSConnection__setEnableStatusNotifications_sendToDaemon___block_invoke_3;
  v6[3] = &unk_1E5982630;
  BOOL v4 = *(void **)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  [v4 _handleEvent:v5 withHandler:v6];
}

uint64_t __60__APSConnection__setEnableStatusNotifications_sendToDaemon___block_invoke_3(uint64_t a1)
{
  BOOL v2 = APSGetEnableStatusNotifications(*(void **)(a1 + 32), 0);
  id v3 = *(void **)(a1 + 40);
  return [v3 _setEnableStatusNotifications:v2 sendToDaemon:0];
}

- (void)setEnableStatusNotifications:(BOOL)a3
{
}

- (void)_addEnableCriticalReliabilityToXPCMessage:(id)a3
{
  APSInsertBoolsToXPCDictionary(a3, "enableCriticalReliability", (uint64_t)a3, v3, v4, v5, v6, v7, self->_enableCriticalReliability);
}

- (void)_addTrackActivityPresenceToXPCMessage:(id)a3
{
  APSInsertBoolsToXPCDictionary(a3, "trackActivityPresence", (uint64_t)a3, v3, v4, v5, v6, v7, self->_trackActivityPresence);
}

- (void)_addEnableStatusNotificationsToXPCMessage:(id)a3
{
  APSInsertBoolsToXPCDictionary(a3, "enableStatusNotifications", (uint64_t)a3, v3, v4, v5, v6, v7, self->_enableStatusNotifications);
}

- (void)_addPushWakeTopicsToXPCMessage:(id)a3
{
  APSInsertNSArraysToXPCDictionary(a3, "pushWakeTopics", (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)self->_pushWakeTopics);
}

- (void)_dispatch_sync_to_ivarQueue:(id)a3 shutdownBlock:(id)a4
{
  id v5 = a3;
  ivarQueue = self->_ivarQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__APSConnection__dispatch_sync_to_ivarQueue_shutdownBlock___block_invoke;
  block[3] = &unk_1E59826F8;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(ivarQueue, block);
}

uint64_t __59__APSConnection__dispatch_sync_to_ivarQueue_shutdownBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_deliverMessage:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[APSLog connection];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 identifier];
    id v7 = [v4 topic];
    *(_DWORD *)buf = 138413058;
    uint64_t v21 = self;
    __int16 v22 = 2112;
    id v23 = v4;
    __int16 v24 = 2048;
    uint64_t v25 = v6;
    __int16 v26 = 2112;
    id v27 = v7;
    _os_log_impl(&dword_19DC4C000, v5, OS_LOG_TYPE_DEFAULT, "%@ Delivering message from apsd: %@ %lu %@", buf, 0x2Au);
  }
  uint64_t v8 = +[APSLog PUSHTRACE];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v4 tracingUUID];
    *(_DWORD *)buf = 138412546;
    uint64_t v21 = self;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl(&dword_19DC4C000, v8, OS_LOG_TYPE_DEFAULT, "%@ Delivering message from apsd. UUID: %@", buf, 0x16u);
  }
  uint64_t v10 = [v4 topic];
  uint64_t v11 = [v4 userInfo];
  if (!v4)
  {
    uint64_t v12 = +[APSLog connection];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = self;
      uint64_t v13 = "%@ Received empty APS message from apsd";
      uint64_t v14 = v12;
      uint32_t v15 = 12;
LABEL_16:
      _os_log_impl(&dword_19DC4C000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if (![v10 length])
  {
    uint64_t v12 = +[APSLog connection];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = self;
      __int16 v22 = 2112;
      id v23 = v4;
      uint64_t v13 = "%@ Received empty topic from apsd: %@";
LABEL_15:
      uint64_t v14 = v12;
      uint32_t v15 = 22;
      goto LABEL_16;
    }
LABEL_17:

    goto LABEL_18;
  }
  if (!v11)
  {
    uint64_t v12 = +[APSLog connection];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = self;
      __int16 v22 = 2112;
      id v23 = v4;
      uint64_t v13 = "%@ Received empty userInfo from apsd: %@";
      goto LABEL_15;
    }
    goto LABEL_17;
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __33__APSConnection__deliverMessage___block_invoke;
  v16[3] = &unk_1E59825B8;
  v16[4] = self;
  id v17 = v10;
  id v18 = v4;
  id v19 = v11;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v16];

LABEL_18:
}

void __33__APSConnection__deliverMessage___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  BOOL v2 = dispatch_group_create();
  if (([*(id *)(*(void *)(a1 + 32) + 192) containsObject:*(void *)(a1 + 40)] & 1) != 0
    || ([*(id *)(*(void *)(a1 + 32) + 192) containsObject:@"*"] & 1) != 0
    || ([*(id *)(*(void *)(a1 + 32) + 208) containsObject:*(void *)(a1 + 40)] & 1) != 0
    || ([*(id *)(*(void *)(a1 + 32) + 208) containsObject:@"*"] & 1) != 0
    || ([*(id *)(*(void *)(a1 + 32) + 216) containsObject:*(void *)(a1 + 40)] & 1) != 0
    || [*(id *)(*(void *)(a1 + 32) + 216) containsObject:@"*"])
  {
    dispatch_group_enter(v2);
    uint64_t v3 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __33__APSConnection__deliverMessage___block_invoke_2;
    v14[3] = &unk_1E5982720;
    v14[4] = v3;
    id v15 = *(id *)(a1 + 48);
    id v16 = *(id *)(a1 + 56);
    id v17 = *(id *)(a1 + 40);
    id v18 = v2;
    [v3 _asyncOnDelegateQueueWithBlock:v14];
  }
  else
  {
    uint64_t v6 = +[APSLog connection];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *(void **)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v9 = v7[24];
      uint64_t v10 = v7[26];
      uint64_t v11 = v7[27];
      *(_DWORD *)buf = 138413314;
      uint64_t v20 = v7;
      __int16 v21 = 2112;
      uint64_t v22 = v8;
      __int16 v23 = 2112;
      uint64_t v24 = v9;
      __int16 v25 = 2112;
      uint64_t v26 = v10;
      __int16 v27 = 2112;
      uint64_t v28 = v11;
      _os_log_impl(&dword_19DC4C000, v6, OS_LOG_TYPE_DEFAULT, "%@ Received message from apsd: %@ but it didn't match the enabled topics: %@ or opportunistic topics: %@ or non-waking topics: %@", buf, 0x34u);
    }
  }
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__APSConnection__deliverMessage___block_invoke_151;
  block[3] = &unk_1E59823E0;
  void block[4] = v4;
  id v13 = *(id *)(a1 + 48);
  dispatch_group_notify(v2, v5, block);
}

void __33__APSConnection__deliverMessage___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[APSLog connection];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [*(id *)(a1 + 40) identifier];
    id v7 = APSLoggableDescriptionForObjectOnTopic_NoLoad(*(void **)(a1 + 48), *(void **)(a1 + 56));
    uint64_t v8 = *(void *)(a1 + 56);
    int v17 = 138413314;
    uint64_t v18 = v5;
    __int16 v19 = 2112;
    id v20 = v3;
    __int16 v21 = 2048;
    uint64_t v22 = v6;
    __int16 v23 = 2112;
    uint64_t v24 = v7;
    __int16 v25 = 2112;
    uint64_t v26 = v8;
    _os_log_impl(&dword_19DC4C000, v4, OS_LOG_TYPE_DEFAULT, "%@ making delegate (%@) calls to deliver message %lu %@ for topic %@", (uint8_t *)&v17, 0x34u);
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = +[APSLog connection];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v17 = 138412546;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_impl(&dword_19DC4C000, v9, OS_LOG_TYPE_DEFAULT, "%@ calling %@ connection:didReceiveMessageForTopic:", (uint8_t *)&v17, 0x16u);
    }

    [v3 connection:*(void *)(a1 + 32) didReceiveMessageForTopic:*(void *)(a1 + 56) userInfo:*(void *)(a1 + 48)];
    uint64_t v11 = +[APSLog connection];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v17 = 138412546;
      uint64_t v18 = v12;
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_impl(&dword_19DC4C000, v11, OS_LOG_TYPE_DEFAULT, "%@ returned from %@ connection:didReceiveMessageForTopic:", (uint8_t *)&v17, 0x16u);
    }
  }
  if (objc_opt_respondsToSelector())
  {
    id v13 = +[APSLog connection];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      int v17 = 138412546;
      uint64_t v18 = v14;
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_impl(&dword_19DC4C000, v13, OS_LOG_TYPE_DEFAULT, "%@ calling %@ connection:didReceiveIncomingMessage:", (uint8_t *)&v17, 0x16u);
    }

    [v3 connection:*(void *)(a1 + 32) didReceiveIncomingMessage:*(void *)(a1 + 40)];
    id v15 = +[APSLog connection];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      int v17 = 138412546;
      uint64_t v18 = v16;
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_impl(&dword_19DC4C000, v15, OS_LOG_TYPE_DEFAULT, "%@ returned from %@ connection:didReceiveIncomingMessage:", (uint8_t *)&v17, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __33__APSConnection__deliverMessage___block_invoke_151(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  BOOL v2 = +[APSLog connection];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) guid];
    *(_DWORD *)buf = 138412546;
    uint64_t v40 = v3;
    __int16 v41 = 2112;
    v42 = v4;
    _os_log_impl(&dword_19DC4C000, v2, OS_LOG_TYPE_DEFAULT, "%@ responding with an ack for message with guid %@", buf, 0x16u);
  }
  uint64_t v5 = +[APSLog PUSHTRACE];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [*(id *)(a1 + 40) tracingUUID];
    *(_DWORD *)buf = 138412546;
    uint64_t v40 = v6;
    __int16 v41 = 2112;
    v42 = v7;
    _os_log_impl(&dword_19DC4C000, v5, OS_LOG_TYPE_DEFAULT, "%@ responding with an ack. UUID: %@", buf, 0x16u);
  }
  uint64_t v8 = [*(id *)(a1 + 40) guid];

  if (v8)
  {
    [*(id *)(a1 + 32) _connectIfNecessaryOnIvarQueue];
    if (*(void *)(*(void *)(a1 + 32) + 104))
    {
      uint64_t v9 = xpc_dictionary_create(0, 0, 0);
      uint64_t v10 = (const char *)[@"message-type" UTF8String];
      APSInsertIntsToXPCDictionary(v9, v10, v11, v12, v13, v14, v15, v16, 22);
      int v17 = [*(id *)(a1 + 40) guid];
      APSInsertNSStringsToXPCDictionary(v9, "guid", v18, v19, v20, v21, v22, v23, (uint64_t)v17);

      if ([*(id *)(a1 + 40) isTracingEnabled])
      {
        uint64_t v24 = [*(id *)(a1 + 40) tracingUUID];
        APSInsertDatasToXPCDictionary(v9, "tracingUUID", v25, v26, v27, v28, v29, v30, (uint64_t)v24);

        v31 = [*(id *)(a1 + 40) topic];
        APSInsertNSStringsToXPCDictionary(v9, "topic", v32, v33, v34, v35, v36, v37, (uint64_t)v31);
      }
      xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 32) + 104), v9);
    }
    else
    {
      uint64_t v9 = +[APSLog connection];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v38 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v40 = v38;
        _os_log_impl(&dword_19DC4C000, v9, OS_LOG_TYPE_DEFAULT, "%@ _connection is NULL in _deliverMessage:.", buf, 0xCu);
      }
    }
  }
}

- (void)_deliverDidReconnectOnIvarQueue
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[APSLog connection];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v6 = self;
    _os_log_impl(&dword_19DC4C000, v3, OS_LOG_TYPE_DEFAULT, "%@ Delivering did reconnect apsd", buf, 0xCu);
  }

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__APSConnection__deliverDidReconnectOnIvarQueue__block_invoke;
  v4[3] = &unk_1E5982748;
  v4[4] = self;
  [(APSConnection *)self _asyncOnDelegateQueueWithBlock:v4];
}

void __48__APSConnection__deliverDidReconnectOnIvarQueue__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = +[APSLog connection];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_19DC4C000, v4, OS_LOG_TYPE_DEFAULT, "%@ Calling %@ connectionDidReconnect", (uint8_t *)&v8, 0x16u);
    }

    [v3 connectionDidReconnect:*(void *)(a1 + 32)];
    uint64_t v6 = +[APSLog connection];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_19DC4C000, v6, OS_LOG_TYPE_DEFAULT, "%@ returned from %@ connectionDidReconnect", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)_deliverPublicTokenOnIvarQueue:(id)a3 withCompletionBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (NSData *)a3;
  int v8 = (void (**)(id, id))a4;
  uint64_t v9 = +[APSLog connection];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v15 = self;
    __int16 v16 = 2112;
    int v17 = v7;
    _os_log_impl(&dword_19DC4C000, v9, OS_LOG_TYPE_DEFAULT, "%@ Delivering publicToken from apsd: %@", buf, 0x16u);
  }

  publicToken = self->_publicToken;
  if (publicToken == v7 || publicToken && -[NSData isEqualToData:](v7, "isEqualToData:"))
  {
    if (v8) {
      v8[2](v8, v7);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_publicToken, a3);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__APSConnection__deliverPublicTokenOnIvarQueue_withCompletionBlock___block_invoke;
    v11[3] = &unk_1E5982770;
    v11[4] = self;
    uint64_t v12 = v7;
    uint64_t v13 = v8;
    [(APSConnection *)self _asyncOnDelegateQueueWithBlock:v11];
  }
}

void __68__APSConnection__deliverPublicTokenOnIvarQueue_withCompletionBlock___block_invoke(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[APSLog connection];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    int v9 = 138412546;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_19DC4C000, v4, OS_LOG_TYPE_DEFAULT, "%@ calling %@ didReceivePublicToken:", (uint8_t *)&v9, 0x16u);
  }

  [v3 connection:a1[4] didReceivePublicToken:a1[5]];
  uint64_t v6 = a1[6];
  if (v6) {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, a1[5]);
  }
  uint64_t v7 = +[APSLog connection];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = a1[4];
    int v9 = 138412546;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_19DC4C000, v7, OS_LOG_TYPE_DEFAULT, "%@ returned from %@ didReceivePublicToken:", (uint8_t *)&v9, 0x16u);
  }
}

- (void)_deliverPublicToken:(id)a3 withCompletionBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[APSLog connection];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v15 = self;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_19DC4C000, v8, OS_LOG_TYPE_DEFAULT, "%@ Async Delivering publicToken from apsd: %@", buf, 0x16u);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__APSConnection__deliverPublicToken_withCompletionBlock___block_invoke;
  v11[3] = &unk_1E59826D0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v11];
}

uint64_t __57__APSConnection__deliverPublicToken_withCompletionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deliverPublicTokenOnIvarQueue:*(void *)(a1 + 40) withCompletionBlock:*(void *)(a1 + 48)];
}

- (void)_deliverConnectionStatusChange:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!self->_isDeallocing && !self->_isShutdown)
  {
    BOOL v4 = a3;
    uint64_t v5 = +[APSLog connection];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = @"NO";
      if (v4) {
        id v6 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      id v10 = self;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_19DC4C000, v5, OS_LOG_TYPE_DEFAULT, "%@ Delivering connectionStatusChange from apsd: %@", buf, 0x16u);
    }

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__APSConnection__deliverConnectionStatusChange___block_invoke;
    v7[3] = &unk_1E59827C0;
    v7[4] = self;
    BOOL v8 = v4;
    [(APSConnection *)self _dispatch_async_to_ivarQueue:v7];
  }
}

uint64_t __48__APSConnection__deliverConnectionStatusChange___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 70) != v2)
  {
    *(unsigned char *)(v1 + 70) = v2;
    id v3 = *(unsigned char **)(result + 32);
    if (v3[69])
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __48__APSConnection__deliverConnectionStatusChange___block_invoke_2;
      v4[3] = &unk_1E5982798;
      v4[4] = v3;
      char v5 = *(unsigned char *)(result + 40);
      return [v3 _asyncOnDelegateQueueWithBlock:v4];
    }
  }
  return result;
}

void __48__APSConnection__deliverConnectionStatusChange___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = +[APSLog connection];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v10 = 138412546;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_19DC4C000, v4, OS_LOG_TYPE_DEFAULT, "%@ seeing if delegate %@ responds to status changes", (uint8_t *)&v10, 0x16u);
  }

  if (objc_opt_respondsToSelector())
  {
    id v6 = +[APSLog connection];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v10 = 138412546;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_19DC4C000, v6, OS_LOG_TYPE_DEFAULT, "%@ calling %@ didChangeConnectedStatus:", (uint8_t *)&v10, 0x16u);
    }

    [v3 connection:*(void *)(a1 + 32) didChangeConnectedStatus:*(unsigned __int8 *)(a1 + 40)];
    BOOL v8 = +[APSLog connection];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138412546;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_19DC4C000, v8, OS_LOG_TYPE_DEFAULT, "%@ returned from %@ didChangeConnectedStatus:", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)_deliverConnectionStatusFromDealloc:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_isConnected != a3)
  {
    self->_isConnected = a3;
    if (self->_enableStatusNotifications)
    {
      if (self->_delegateQueue)
      {
        delegateReference = self->_delegateReference;
        if (delegateReference)
        {
          id v6 = [(CUTWeakReference *)delegateReference object];
          uint64_t v7 = +[APSLog connection];
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v13 = self;
            __int16 v14 = 2112;
            uint64_t v15 = v6;
            _os_log_impl(&dword_19DC4C000, v7, OS_LOG_TYPE_DEFAULT, "%@ seeing if delegate %@ responds to status changes", buf, 0x16u);
          }

          if (objc_opt_respondsToSelector())
          {
            delegateQueue = self->_delegateQueue;
            v9[0] = MEMORY[0x1E4F143A8];
            v9[1] = 3221225472;
            v9[2] = __53__APSConnection__deliverConnectionStatusFromDealloc___block_invoke;
            v9[3] = &unk_1E59827C0;
            id v10 = v6;
            BOOL v11 = a3;
            dispatch_async(delegateQueue, v9);
          }
        }
      }
    }
  }
}

void __53__APSConnection__deliverConnectionStatusFromDealloc___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v2 = +[APSLog connection];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = 0;
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    _os_log_impl(&dword_19DC4C000, v2, OS_LOG_TYPE_DEFAULT, "%@ calling %@ didChangeConnectedStatus:", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 32) connection:0 didChangeConnectedStatus:*(unsigned __int8 *)(a1 + 40)];
  BOOL v4 = +[APSLog connection];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = 0;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl(&dword_19DC4C000, v4, OS_LOG_TYPE_DEFAULT, "%@ returned from %@ didChangeConnectedStatus:", (uint8_t *)&v6, 0x16u);
  }
}

- (void)_deliverOutgoingMessageResultWithID:(unint64_t)a3 error:(id)a4 sendRTT:(unint64_t)a5 ackTimestamp:(unint64_t)a6
{
  id v10 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__APSConnection__deliverOutgoingMessageResultWithID_error_sendRTT_ackTimestamp___block_invoke;
  v12[3] = &unk_1E5982810;
  v12[4] = self;
  id v13 = v10;
  unint64_t v14 = a3;
  unint64_t v15 = a5;
  unint64_t v16 = a6;
  id v11 = v10;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v12];
}

void __80__APSConnection__deliverOutgoingMessageResultWithID_error_sendRTT_ackTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v2 = +[APSLog connection];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v17 = v5;
    __int16 v18 = 2048;
    uint64_t v19 = v3;
    __int16 v20 = 2112;
    uint64_t v21 = v4;
    _os_log_impl(&dword_19DC4C000, v2, OS_LOG_TYPE_DEFAULT, "%@ delivering outgoing message result for id %lu, error = %@", buf, 0x20u);
  }

  int v6 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKey:v6];
  [v7 setSendRTT:*(void *)(a1 + 56)];
  [v7 setAckTimestamp:*(void *)(a1 + 64)];
  if (v7)
  {
    [*(id *)(*(void *)(a1 + 32) + 72) removeObjectForKey:v6];
    __int16 v8 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __80__APSConnection__deliverOutgoingMessageResultWithID_error_sendRTT_ackTimestamp___block_invoke_158;
    v13[3] = &unk_1E59827E8;
    v13[4] = v8;
    id v14 = v7;
    id v15 = *(id *)(a1 + 40);
    [v8 _asyncOnDelegateQueueWithBlock:v13];
  }
  else
  {
    uint64_t v9 = +[APSLog connection];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v17 = v12;
      __int16 v18 = 2048;
      uint64_t v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      _os_log_impl(&dword_19DC4C000, v9, OS_LOG_TYPE_DEFAULT, "%@ Receiving result for sending unknown outgoing message %lu: %@", buf, 0x20u);
    }
  }
}

void __80__APSConnection__deliverOutgoingMessageResultWithID_error_sendRTT_ackTimestamp___block_invoke_158(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[APSLog connection];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    int v16 = 138413058;
    uint64_t v17 = v5;
    __int16 v18 = 2112;
    id v19 = v3;
    __int16 v20 = 2112;
    uint64_t v21 = v6;
    __int16 v22 = 2112;
    uint64_t v23 = v7;
    _os_log_impl(&dword_19DC4C000, v4, OS_LOG_TYPE_DEFAULT, "%@ calling %@ for outgoing message %@ result %@", (uint8_t *)&v16, 0x2Au);
  }

  if ([*(id *)(a1 + 48) code])
  {
    if (objc_opt_respondsToSelector())
    {
      __int16 v8 = +[APSLog connection];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v16 = 138412546;
        uint64_t v17 = v9;
        __int16 v18 = 2112;
        id v19 = v3;
        _os_log_impl(&dword_19DC4C000, v8, OS_LOG_TYPE_DEFAULT, "%@ calling %@ didFailToSendOutgoingMessage:", (uint8_t *)&v16, 0x16u);
      }

      [v3 connection:*(void *)(a1 + 32) didFailToSendOutgoingMessage:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
      uint64_t v10 = +[APSLog connection];
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      uint64_t v11 = *(void *)(a1 + 32);
      int v16 = 138412546;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      id v19 = v3;
      uint64_t v12 = "%@ returned from %@ didFailToSendOutgoingMessage:";
LABEL_14:
      _os_log_impl(&dword_19DC4C000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, 0x16u);
LABEL_15:
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    id v13 = +[APSLog connection];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      int v16 = 138412546;
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_impl(&dword_19DC4C000, v13, OS_LOG_TYPE_DEFAULT, "%@ calling %@ didSendOutgoingMessage:", (uint8_t *)&v16, 0x16u);
    }

    [v3 connection:*(void *)(a1 + 32) didSendOutgoingMessage:*(void *)(a1 + 40)];
    uint64_t v10 = +[APSLog connection];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    uint64_t v15 = *(void *)(a1 + 32);
    int v16 = 138412546;
    uint64_t v17 = v15;
    __int16 v18 = 2112;
    id v19 = v3;
    uint64_t v12 = "%@ returned from %@ didSendOutgoingMessage:";
    goto LABEL_14;
  }
}

- (void)_deliverOutgoingMessageResultWithID:(unint64_t)a3 error:(id)a4 sendRTT:(unint64_t)a5
{
}

- (void)_deliverToken:(id)a3 forInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__APSConnection__deliverToken_forInfo___block_invoke;
  v10[3] = &unk_1E59825E0;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v10];
}

void __39__APSConnection__deliverToken_forInfo___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v2 = +[APSLog connection];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) debugDescription];
    uint64_t v5 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    uint64_t v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    __int16 v15 = 2112;
    uint64_t v16 = v5;
    _os_log_impl(&dword_19DC4C000, v2, OS_LOG_TYPE_DEFAULT, "%@ Received extended app token %@ forInfo %@", buf, 0x20u);
  }
  if (*(void *)(a1 + 40))
  {
    id v6 = [*(id *)(a1 + 48) topic];

    if (v6)
    {
      id v7 = *(void **)(a1 + 32);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __39__APSConnection__deliverToken_forInfo___block_invoke_166;
      v8[3] = &unk_1E59827E8;
      v8[4] = v7;
      id v9 = *(id *)(a1 + 40);
      id v10 = *(id *)(a1 + 48);
      [v7 _asyncOnDelegateQueueWithBlock:v8];
    }
  }
}

void __39__APSConnection__deliverToken_forInfo___block_invoke_166(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = +[APSLog connection];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = a1[4];
      uint64_t v6 = a1[5];
      uint64_t v7 = a1[6];
      int v10 = 138413058;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      id v13 = v3;
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      __int16 v16 = 2112;
      uint64_t v17 = v7;
      _os_log_impl(&dword_19DC4C000, v4, OS_LOG_TYPE_DEFAULT, "%@ calling %@ for received extended app token %@ for info %@", (uint8_t *)&v10, 0x2Au);
    }

    [v3 connection:a1[4] didReceiveToken:a1[5] forInfo:a1[6]];
    id v8 = +[APSLog connection];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = a1[4];
      int v10 = 138412546;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_19DC4C000, v8, OS_LOG_TYPE_DEFAULT, "%@ returned from %@ didReceiveToken:forInfo", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)_deliverURLToken:(id)a3 forInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__APSConnection__deliverURLToken_forInfo___block_invoke;
  v10[3] = &unk_1E59825E0;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v10];
}

void __42__APSConnection__deliverURLToken_forInfo___block_invoke(id *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v2 = +[APSLog connection];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    uint64_t v4 = [a1[5] debugDescription];
    id v5 = a1[6];
    *(_DWORD *)buf = 138412802;
    id v18 = v3;
    __int16 v19 = 2112;
    __int16 v20 = v4;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl(&dword_19DC4C000, v2, OS_LOG_TYPE_DEFAULT, "%@ Received web token %@ for info %@", buf, 0x20u);
  }
  if (a1[5])
  {
    id v6 = [a1[6] topic];

    if (v6)
    {
      id v7 = [a1[4] _removeURLTokenBlocksForInfo:a1[6]];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __42__APSConnection__deliverURLToken_forInfo___block_invoke_169;
      v12[3] = &unk_1E5982838;
      id v13 = v7;
      id v8 = a1[4];
      id v9 = a1[5];
      id v10 = a1[4];
      id v14 = v9;
      id v15 = v10;
      id v16 = a1[6];
      id v11 = v7;
      [v8 _asyncOnDelegateQueueWithBlock:v12 requiresDelegate:0];
    }
  }
}

void __42__APSConnection__deliverURLToken_forInfo___block_invoke_169(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v15 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v27 count:16];
    }
    while (v6);
  }

  if (objc_opt_respondsToSelector())
  {
    id v9 = +[APSLog connection];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138413058;
      uint64_t v20 = v10;
      __int16 v21 = 2112;
      id v22 = v3;
      __int16 v23 = 2112;
      uint64_t v24 = v11;
      __int16 v25 = 2112;
      uint64_t v26 = v12;
      _os_log_impl(&dword_19DC4C000, v9, OS_LOG_TYPE_DEFAULT, "%@ calling %@ for received web token %@ for info %@", buf, 0x2Au);
    }

    [v3 connection:*(void *)(a1 + 48) didReceiveURLToken:*(void *)(a1 + 40) forInfo:*(void *)(a1 + 56)];
    id v13 = +[APSLog connection];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = v14;
      __int16 v21 = 2112;
      id v22 = v3;
      _os_log_impl(&dword_19DC4C000, v13, OS_LOG_TYPE_DEFAULT, "%@ returned from %@ didReceiveURLToken:forInfo", buf, 0x16u);
    }
  }
}

- (void)_deliverURLTokenError:(id)a3 forInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__APSConnection__deliverURLTokenError_forInfo___block_invoke;
  v10[3] = &unk_1E59825E0;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v10];
}

void __47__APSConnection__deliverURLTokenError_forInfo___block_invoke(id *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v2 = +[APSLog connection];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    id v4 = a1[5];
    id v5 = a1[6];
    *(_DWORD *)buf = 138412802;
    id v18 = v3;
    __int16 v19 = 2112;
    id v20 = v4;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl(&dword_19DC4C000, v2, OS_LOG_TYPE_DEFAULT, "%@ Received web token error %@ for info %@", buf, 0x20u);
  }

  if (a1[5])
  {
    id v6 = [a1[6] topic];

    if (v6)
    {
      id v7 = [a1[4] _removeURLTokenBlocksForInfo:a1[6]];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __47__APSConnection__deliverURLTokenError_forInfo___block_invoke_172;
      v12[3] = &unk_1E5982838;
      id v13 = v7;
      id v8 = a1[4];
      id v9 = a1[5];
      id v10 = a1[4];
      id v14 = v9;
      id v15 = v10;
      id v16 = a1[6];
      id v11 = v7;
      [v8 _asyncOnDelegateQueueWithBlock:v12 requiresDelegate:0];
    }
  }
}

void __47__APSConnection__deliverURLTokenError_forInfo___block_invoke_172(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v15 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v27 count:16];
    }
    while (v6);
  }

  if (objc_opt_respondsToSelector())
  {
    id v9 = +[APSLog connection];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138413058;
      uint64_t v20 = v10;
      __int16 v21 = 2112;
      id v22 = v3;
      __int16 v23 = 2112;
      uint64_t v24 = v11;
      __int16 v25 = 2112;
      uint64_t v26 = v12;
      _os_log_impl(&dword_19DC4C000, v9, OS_LOG_TYPE_DEFAULT, "%@ calling %@ for received web token error %@ for info %@", buf, 0x2Au);
    }

    [v3 connection:*(void *)(a1 + 48) didReceiveURLTokenError:*(void *)(a1 + 40) forInfo:*(void *)(a1 + 56)];
    id v13 = +[APSLog connection];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = v14;
      __int16 v21 = 2112;
      id v22 = v3;
      _os_log_impl(&dword_19DC4C000, v13, OS_LOG_TYPE_DEFAULT, "%@ returned from %@ didReceiveURLTokenError:forInfo", buf, 0x16u);
    }
  }
}

void __65__APSConnection__blockingXPCCallWithArgumentBlock_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = +[APSLog connection];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19DC4C000, v3, OS_LOG_TYPE_DEFAULT, "_makeXPCCallWithArgumentBlock messageHandler %@", (uint8_t *)&v4, 0xCu);
  }
}

void __65__APSConnection__blockingXPCCallWithArgumentBlock_resultHandler___block_invoke_178()
{
  v0 = +[APSLog connection];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_19DC4C000, v0, OS_LOG_TYPE_DEFAULT, "_makeXPCCallWithArgumentBlock Connection interrupted while trying to make blocking XPC call", v1, 2u);
  }
}

void __65__APSConnection__blockingXPCCallWithArgumentBlock_resultHandler___block_invoke_181()
{
  v0 = +[APSLog connection];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_19DC4C000, v0, OS_LOG_TYPE_DEFAULT, "_makeXPCCallWithArgumentBlock Connection invalidated while trying to make blocking XPC call", v1, 2u);
  }
}

- (BOOL)hasIdentity
{
  if (hasIdentity_onceToken != -1) {
    dispatch_once(&hasIdentity_onceToken, &__block_literal_global_188);
  }
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__APSConnection_hasIdentity__block_invoke_2;
  v5[3] = &unk_1E5982608;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)hasIdentity_sQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __28__APSConnection_hasIdentity__block_invoke()
{
  hasIdentity_sQueue = (uint64_t)dispatch_queue_create("hasIdentityQueue", 0);
  return MEMORY[0x1F41817F8]();
}

uint64_t __28__APSConnection_hasIdentity__block_invoke_2(uint64_t result)
{
  uint64_t v1 = result;
  if (hasIdentity_sHasFoundIdentity)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  else
  {
    id v2 = objc_opt_class();
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __28__APSConnection_hasIdentity__block_invoke_3;
    v4[3] = &unk_1E5982450;
    v4[4] = *(void *)(v1 + 32);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __28__APSConnection_hasIdentity__block_invoke_4;
    v3[3] = &unk_1E5982860;
    v3[4] = *(void *)(v1 + 40);
    uint64_t result = [v2 _blockingXPCCallWithArgumentBlock:v4 resultHandler:v3];
    if (*(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24)) {
      hasIdentity_sHasFoundIdentity = 1;
    }
  }
  return result;
}

void __28__APSConnection_hasIdentity__block_invoke_3(uint64_t a1, void *a2)
{
  id xdict = a2;
  char v3 = (const char *)[@"message-type" UTF8String];
  APSInsertIntsToXPCDictionary(xdict, v3, v4, v5, v6, v7, v8, v9, 8);
  APSInsertNSStringsToXPCDictionary(xdict, "environmentName", v10, v11, v12, v13, v14, v15, *(void *)(*(void *)(a1 + 32) + 24));
}

BOOL __28__APSConnection_hasIdentity__block_invoke_4(uint64_t a1, void *a2)
{
  BOOL result = APSGetXPCBoolFromDictionary(a2, "hasIdentity");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (double)serverTime
{
  return (double)(unint64_t)[a1 serverTimeInNanoSeconds] / 1000000000.0;
}

+ (unint64_t)serverTimeInNanoSeconds
{
  if (serverTimeInNanoSeconds_onceToken != -1) {
    dispatch_once(&serverTimeInNanoSeconds_onceToken, &__block_literal_global_192);
  }
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__APSConnection_serverTimeInNanoSeconds__block_invoke_2;
  block[3] = &unk_1E59828B0;
  void block[5] = &v7;
  block[6] = a1;
  void block[4] = &v11;
  dispatch_sync((dispatch_queue_t)serverTimeInNanoSeconds_sQueue, block);
  unint64_t v3 = v12[3];
  if (!v3)
  {
    double v4 = v8[3];
    if (v4 == 0.0)
    {
      unint64_t v3 = 0;
    }
    else
    {
      unint64_t v3 = (unint64_t)(v4 * 1000000000.0);
      v12[3] = v3;
    }
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  return v3;
}

uint64_t __40__APSConnection_serverTimeInNanoSeconds__block_invoke()
{
  serverTimeInNanoSeconds_sQueue = (uint64_t)dispatch_queue_create("requestServerTimeInNS", 0);
  return MEMORY[0x1F41817F8]();
}

uint64_t __40__APSConnection_serverTimeInNanoSeconds__block_invoke_2(uint64_t a1)
{
  id v2 = objc_opt_class();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__APSConnection_serverTimeInNanoSeconds__block_invoke_4;
  v4[3] = &unk_1E5982888;
  long long v5 = *(_OWORD *)(a1 + 32);
  return [v2 _blockingXPCCallWithArgumentBlock:&__block_literal_global_195 resultHandler:v4];
}

void __40__APSConnection_serverTimeInNanoSeconds__block_invoke_3(uint64_t a1, void *a2)
{
  id xdict = a2;
  id v2 = (const char *)[@"message-type" UTF8String];
  APSInsertIntsToXPCDictionary(xdict, v2, v3, v4, v5, v6, v7, v8, 9);
}

double __40__APSConnection_serverTimeInNanoSeconds__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = APSGetXPCUnsignedLongLongFromDictionary(v3, "serverTimeNS");
  uint64_t v4 = APSGetXPCUnsignedLongLongFromDictionary(v3, "serverTime");

  double result = (double)v4;
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (double)v4;
  return result;
}

+ (id)geoRegion
{
  if (geoRegion_onceToken != -1) {
    dispatch_once(&geoRegion_onceToken, &__block_literal_global_198);
  }
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __26__APSConnection_geoRegion__block_invoke_2;
  v5[3] = &unk_1E59828D8;
  v5[4] = &v6;
  v5[5] = a1;
  dispatch_sync((dispatch_queue_t)geoRegion_sQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __26__APSConnection_geoRegion__block_invoke()
{
  geoRegion_sQueue = (uint64_t)dispatch_queue_create("requestGeoRegion", 0);
  return MEMORY[0x1F41817F8]();
}

uint64_t __26__APSConnection_geoRegion__block_invoke_2(uint64_t a1)
{
  id v2 = objc_opt_class();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __26__APSConnection_geoRegion__block_invoke_4;
  v4[3] = &unk_1E5982860;
  void v4[4] = *(void *)(a1 + 32);
  return [v2 _blockingXPCCallWithArgumentBlock:&__block_literal_global_201 resultHandler:v4];
}

void __26__APSConnection_geoRegion__block_invoke_3(uint64_t a1, void *a2)
{
  id xdict = a2;
  id v2 = (const char *)[@"message-type" UTF8String];
  APSInsertIntsToXPCDictionary(xdict, v2, v3, v4, v5, v6, v7, v8, 10);
}

void __26__APSConnection_geoRegion__block_invoke_4(uint64_t a1, void *a2)
{
  APSGetXPCStringFromDictionary(a2, "geoRegion");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v6 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (void)requestCourierConnection
{
  uint64_t v3 = +[APSLog connection];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19DC4C000, v3, OS_LOG_TYPE_DEFAULT, "requestCourierConnection", buf, 2u);
  }

  uint64_t v4 = dispatch_queue_create("requestCourierConnection", 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__APSConnection_requestCourierConnection__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  dispatch_async(v4, block);
}

uint64_t __41__APSConnection_requestCourierConnection__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _blockingXPCCallWithArgumentBlock:&__block_literal_global_205 resultHandler:&__block_literal_global_207];
}

void __41__APSConnection_requestCourierConnection__block_invoke_2(uint64_t a1, void *a2)
{
  id xdict = a2;
  id v2 = (const char *)[@"message-type" UTF8String];
  APSInsertIntsToXPCDictionary(xdict, v2, v3, v4, v5, v6, v7, v8, 13);
}

void __41__APSConnection_requestCourierConnection__block_invoke_3()
{
  v0 = +[APSLog connection];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_19DC4C000, v0, OS_LOG_TYPE_DEFAULT, "Success!", v1, 2u);
  }
}

+ (void)invalidateDeviceIdentity
{
  uint64_t v3 = +[APSLog connection];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19DC4C000, v3, OS_LOG_TYPE_DEFAULT, "invalidateDeviceIdentity", buf, 2u);
  }

  uint64_t v4 = dispatch_queue_create("invalidateDeviceIdentity", 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__APSConnection_invalidateDeviceIdentity__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  dispatch_async(v4, block);
}

uint64_t __41__APSConnection_invalidateDeviceIdentity__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _blockingXPCCallWithArgumentBlock:&__block_literal_global_210 resultHandler:&__block_literal_global_212];
}

void __41__APSConnection_invalidateDeviceIdentity__block_invoke_2(uint64_t a1, void *a2)
{
  id xdict = a2;
  id v2 = (const char *)[@"message-type" UTF8String];
  APSInsertIntsToXPCDictionary(xdict, v2, v3, v4, v5, v6, v7, v8, 23);
}

void __41__APSConnection_invalidateDeviceIdentity__block_invoke_3()
{
  v0 = +[APSLog connection];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_19DC4C000, v0, OS_LOG_TYPE_DEFAULT, "Success!", v1, 2u);
  }
}

+ (double)keepAliveIntervalForEnvironmentName:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[APSLog connection];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_19DC4C000, v5, OS_LOG_TYPE_DEFAULT, "keepAliveIntervalForEnvironmentName %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__APSConnection_keepAliveIntervalForEnvironmentName___block_invoke;
  v10[3] = &unk_1E5982450;
  id v6 = v4;
  id v11 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__APSConnection_keepAliveIntervalForEnvironmentName___block_invoke_2;
  v9[3] = &unk_1E5982860;
  void v9[4] = &buf;
  [a1 _blockingXPCCallWithArgumentBlock:v10 resultHandler:v9];
  double v7 = *(double *)(*((void *)&buf + 1) + 24);

  _Block_object_dispose(&buf, 8);
  return v7;
}

void __53__APSConnection_keepAliveIntervalForEnvironmentName___block_invoke(uint64_t a1, void *a2)
{
  id xdict = a2;
  uint64_t v3 = (const char *)[@"message-type" UTF8String];
  APSInsertIntsToXPCDictionary(xdict, v3, v4, v5, v6, v7, v8, v9, 12);
  APSInsertNSStringsToXPCDictionary(xdict, "environmentName", v10, v11, v12, v13, v14, v15, *(void *)(a1 + 32));
}

void __53__APSConnection_keepAliveIntervalForEnvironmentName___block_invoke_2(uint64_t a1, void *a2)
{
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = APSGetXPCDoubleFromDictionary(a2, "keepAliveInterval");
}

+ (id)connectionsDebuggingStateOfStyle:(unint64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy_;
  uint64_t v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__APSConnection_connectionsDebuggingStateOfStyle___block_invoke;
  v6[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  void v6[4] = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__APSConnection_connectionsDebuggingStateOfStyle___block_invoke_2;
  v5[3] = &unk_1E5982860;
  v5[4] = &v7;
  [a1 _blockingXPCCallWithArgumentBlock:v6 resultHandler:v5];
  id v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

void __50__APSConnection_connectionsDebuggingStateOfStyle___block_invoke(uint64_t a1, void *a2)
{
  id xdict = a2;
  id v3 = (const char *)[@"message-type" UTF8String];
  APSInsertIntsToXPCDictionary(xdict, v3, v4, v5, v6, v7, v8, v9, 5);
  APSInsertIntsToXPCDictionary(xdict, "style", v10, v11, v12, v13, v14, v15, *(void *)(a1 + 32));
}

uint64_t __50__APSConnection_connectionsDebuggingStateOfStyle___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = APSGetXPCStringFromDictionary(a2, "connectionsDebuggingState");
  return MEMORY[0x1F41817F8]();
}

+ (void)_setTokenState
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__APSConnection__setTokenState__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __31__APSConnection__setTokenState__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (_setTokenState_sTokenFailures > 9) {
    return;
  }
  id v2 = +[APSLog connection];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    int v9 = _setTokenState_sTokenFailures;
    _os_log_impl(&dword_19DC4C000, v2, OS_LOG_TYPE_DEFAULT, "notifySafeToSendFilter - failures=%d", buf, 8u);
  }

  int v3 = _setTokenState_token;
  if (_setTokenState_token != -1) {
    goto LABEL_5;
  }
  uint32_t v4 = notify_register_check("APSSafeToSendFilterNotification", &_setTokenState_token);
  if (!v4)
  {
    int v3 = _setTokenState_token;
LABEL_5:
    uint32_t v4 = notify_set_state(v3, 1uLL);
    if (!v4)
    {
      uint32_t v4 = notify_post("APSSafeToSendFilterNotification");
      if (!v4) {
        return;
      }
    }
  }
  uint64_t v5 = +[APSLog connection];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    int v9 = v4;
    _os_log_impl(&dword_19DC4C000, v5, OS_LOG_TYPE_DEFAULT, "setting token failed with status %d", buf, 8u);
  }

  notify_cancel(_setTokenState_token);
  _setTokenState_token = -1;
  ++_setTokenState_sTokenFailures;
  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__APSConnection__setTokenState__block_invoke_218;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v6, MEMORY[0x1E4F14428], block);
}

uint64_t __31__APSConnection__setTokenState__block_invoke_218(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setTokenState];
}

+ (void)notifySafeToSendFilter
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__APSConnection_notifySafeToSendFilter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (notifySafeToSendFilter_onceToken != -1) {
    dispatch_once(&notifySafeToSendFilter_onceToken, block);
  }
}

uint64_t __39__APSConnection_notifySafeToSendFilter__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setTokenState];
}

- (void)_sendOutgoingMessage:(id)a3 fake:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_ivarQueue);
  int v7 = _os_feature_enabled_impl();
  uint64_t v8 = +[APSLog connection];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 identifier];
    uint64_t v10 = [v6 topic];
    uint64_t v11 = [v6 userInfo];
    uint64_t v12 = [v6 topic];
    uint64_t v13 = APSLoggableDescriptionForObjectOnTopic_NoLoad(v11, v12);
    uint64_t v14 = (void *)v13;
    *(_DWORD *)long long buf = 138413826;
    uint64_t v15 = @"NO";
    __int16 v23 = self;
    __int16 v24 = 2112;
    __int16 v26 = 2048;
    if (v4) {
      long long v16 = @"YES";
    }
    else {
      long long v16 = @"NO";
    }
    id v25 = v6;
    if (v7) {
      uint64_t v15 = @"YES";
    }
    uint64_t v27 = v9;
    __int16 v28 = 2112;
    uint64_t v29 = v10;
    __int16 v30 = 2112;
    uint64_t v31 = v13;
    __int16 v32 = 2112;
    uint64_t v33 = v16;
    __int16 v34 = 2112;
    uint64_t v35 = v15;
    _os_log_impl(&dword_19DC4C000, v8, OS_LOG_TYPE_DEFAULT, "%@ _sendOutgoingMessage: %@ [id=%lu] %@ %@ fake: %@ syncToIvarQueue: %@", buf, 0x48u);
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __43__APSConnection__sendOutgoingMessage_fake___block_invoke;
  v19[3] = &unk_1E5982948;
  v19[4] = self;
  id v20 = v6;
  BOOL v21 = v4;
  id v17 = v6;
  long long v18 = (void *)MEMORY[0x19F3B0300](v19);
  if (v7) {
    [(APSConnection *)self _dispatch_sync_to_ivarQueue:v18 shutdownBlock:0];
  }
  else {
    [(APSConnection *)self _dispatch_async_to_ivarQueue:v18];
  }
}

void __43__APSConnection__sendOutgoingMessage_fake___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _connectIfNecessaryOnIvarQueue];
  if (!*(void *)(a1 + 40)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Message is null"];
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 104))
  {
    int v3 = *(void **)(a1 + 40);
    ++*(void *)(v2 + 80);
    objc_msgSend(v3, "setMessageID:");
    if (!*(unsigned char *)(a1 + 48)
      || ([*(id *)(a1 + 40) timestamp],
          BOOL v4 = objc_claimAutoreleasedReturnValue(),
          v4,
          !v4))
    {
      uint64_t v5 = *(void **)(a1 + 40);
      id v6 = [MEMORY[0x1E4F1C9C8] date];
      [v5 setTimestamp:v6];
    }
    int v7 = *(void **)(a1 + 40);
    uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 72);
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "messageID"));
    [v8 setObject:v7 forKey:v9];

    uint64_t v10 = xpc_dictionary_create(0, 0, 0);
    LODWORD(v8) = *(unsigned __int8 *)(a1 + 48);
    uint64_t v11 = (const char *)[@"message-type" UTF8String];
    uint64_t v18 = 6;
    if (v8) {
      uint64_t v18 = 7;
    }
    APSInsertIntsToXPCDictionary(v10, v11, v12, v13, v14, v15, v16, v17, v18);
    __int16 v19 = [*(id *)(a1 + 40) dictionaryRepresentation];
    id v20 = APSCreateXPCObjectFromDictionary(v19);

    xpc_dictionary_set_value(v10, "message", v20);
    if (_os_feature_enabled_impl())
    {
      BOOL v21 = [*(id *)(a1 + 40) topic];
      int v22 = [v21 isEqualToString:@"com.apple.private.alloy.facetime.multi"];

      if (v22)
      {
        [*(id *)(a1 + 40) identifier];
        kdebug_trace();
      }
    }
    uint64_t v23 = *(void *)(a1 + 32);
    __int16 v24 = *(_xpc_connection_s **)(v23 + 104);
    id v25 = *(NSObject **)(v23 + 16);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __43__APSConnection__sendOutgoingMessage_fake___block_invoke_2;
    handler[3] = &unk_1E5982630;
    handler[4] = v23;
    id v28 = *(id *)(a1 + 40);
    xpc_connection_send_message_with_reply(v24, v10, v25, handler);
  }
  else
  {
    uint64_t v10 = +[APSLog connection];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v30 = v26;
      _os_log_impl(&dword_19DC4C000, v10, OS_LOG_TYPE_DEFAULT, "%@ APS _connection is NULL in _sendOutgoingMessage!", buf, 0xCu);
    }
  }
}

void __43__APSConnection__sendOutgoingMessage_fake___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__APSConnection__sendOutgoingMessage_fake___block_invoke_3;
  v7[3] = &unk_1E5982920;
  uint64_t v5 = *(void **)(a1 + 32);
  BOOL v4 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v5;
  id v10 = v4;
  id v6 = v3;
  [v5 _handleEvent:v6 withHandler:v7];
}

void __43__APSConnection__sendOutgoingMessage_fake___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  if (v4)
  {
    if (APSGetXPCBoolFromDictionary(v4, "success")) {
      goto LABEL_9;
    }
    uint64_t v5 = [NSString stringWithFormat:@"APSD rejected message as invalid."];
    if (!v5) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v5 = @"no reply received!";
  }
  id v6 = *(void **)(*(void *)(a1 + 40) + 72);
  int v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "messageID"));
  [v6 removeObjectForKey:v7];

  uint64_t v14 = APSError(1, @"Unable to send outgoing message to apsd: %@", v8, v9, v10, v11, v12, v13, (uint64_t)v5);
  uint64_t v15 = +[APSLog connection];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    int v22 = v14;
    _os_log_impl(&dword_19DC4C000, v15, OS_LOG_TYPE_DEFAULT, "Error sending outgoing message! %@", buf, 0xCu);
  }

  uint64_t v16 = *(void **)(a1 + 40);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __43__APSConnection__sendOutgoingMessage_fake___block_invoke_237;
  v18[3] = &unk_1E59827E8;
  v18[4] = v16;
  id v19 = *(id *)(a1 + 48);
  id v20 = v14;
  id v17 = v14;
  [v16 _asyncOnDelegateQueueWithBlock:v18];

LABEL_9:
}

void __43__APSConnection__sendOutgoingMessage_fake___block_invoke_237(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = +[APSLog connection];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    uint64_t v7 = a1[6];
    int v12 = 138413058;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    id v15 = v3;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v7;
    _os_log_impl(&dword_19DC4C000, v4, OS_LOG_TYPE_DEFAULT, "%@ checking if %@ responds to message %@ failing to send %@", (uint8_t *)&v12, 0x2Au);
  }

  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = +[APSLog connection];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = a1[4];
      int v12 = 138412546;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_19DC4C000, v8, OS_LOG_TYPE_DEFAULT, "%@ calling %@ didFailToSendOutgoingMessage:", (uint8_t *)&v12, 0x16u);
    }

    [v3 connection:a1[4] didFailToSendOutgoingMessage:a1[5] error:a1[6]];
    uint64_t v10 = +[APSLog connection];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = a1[4];
      int v12 = 138412546;
      uint64_t v13 = v11;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_19DC4C000, v10, OS_LOG_TYPE_DEFAULT, "%@ returned from %@ didFailToSendOutgoingMessage:", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)sendOutgoingMessage:(id)a3
{
}

- (void)cancelOutgoingMessage:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[APSLog connection];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    uint64_t v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    __int16 v13 = 2048;
    uint64_t v14 = [v4 identifier];
    _os_log_impl(&dword_19DC4C000, v5, OS_LOG_TYPE_DEFAULT, "%@ cancelOutgoingMessage: %@ id=%lu", buf, 0x20u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__APSConnection_cancelOutgoingMessage___block_invoke;
  v7[3] = &unk_1E59823E0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v7];
}

void __39__APSConnection_cancelOutgoingMessage___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _connectIfNecessaryOnIvarQueue];
  if (*(void *)(*(void *)(a1 + 32) + 104))
  {
    xpc_object_t message = xpc_dictionary_create(0, 0, 0);
    uint64_t v2 = (const char *)[@"message-type" UTF8String];
    APSInsertIntsToXPCDictionary(message, v2, v3, v4, v5, v6, v7, v8, 11);
    uint64_t v9 = [*(id *)(a1 + 40) messageID];
    APSInsertIntsToXPCDictionary(message, "messageID", v10, v11, v12, v13, v14, v15, v9);
    xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 32) + 104), message);
  }
  else
  {
    __int16 v16 = +[APSLog connection];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v20 = v17;
      _os_log_impl(&dword_19DC4C000, v16, OS_LOG_TYPE_DEFAULT, "%@ APS _connection is NULL in cancelOutgoingMessage!", buf, 0xCu);
    }
  }
}

- (void)sendFakeMessage:(id)a3
{
}

- (void)requestTokenForInfo:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[APSLog connection];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    uint64_t v17 = self;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_19DC4C000, v5, OS_LOG_TYPE_DEFAULT, "%@: Requesting extended app token for info %@", buf, 0x16u);
  }

  uint64_t v6 = [v4 topic];

  if (v6)
  {
    uint64_t v7 = [v4 identifier];

    if (!v7) {
      [v4 setIdentifier:&stru_1EF02C710];
    }
    uint64_t v8 = [v4 expirationDate];
    if (!v8) {
      goto LABEL_8;
    }
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [v4 expirationDate];
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v12 = [v10 compare:v11];

    if (v12 == -1)
    {
      uint64_t v13 = +[APSLog connection];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        uint64_t v17 = self;
        __int16 v18 = 2112;
        id v19 = v4;
        _os_log_impl(&dword_19DC4C000, v13, OS_LOG_TYPE_DEFAULT, "%@: Token was requested for an expiration date that is in the past %@", buf, 0x16u);
      }
    }
    else
    {
LABEL_8:
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __37__APSConnection_requestTokenForInfo___block_invoke;
      v14[3] = &unk_1E59823E0;
      v14[4] = self;
      id v15 = v4;
      [(APSConnection *)self _dispatch_async_to_ivarQueue:v14];
    }
  }
}

void __37__APSConnection_requestTokenForInfo___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _connectIfNecessaryOnIvarQueue];
  if (*(void *)(*(void *)(a1 + 32) + 104))
  {
    xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
    uint64_t v2 = (const char *)[@"message-type" UTF8String];
    APSInsertIntsToXPCDictionary(xdict, v2, v3, v4, v5, v6, v7, v8, 15);
    uint64_t v9 = [*(id *)(a1 + 40) dictionaryRepresentation];
    uint64_t v10 = APSCreateXPCObjectFromDictionary(v9);

    xpc_dictionary_set_value(xdict, "info", v10);
    xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 32) + 104), xdict);
  }
  else
  {
    uint64_t v11 = +[APSLog connection];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v15 = v12;
      _os_log_impl(&dword_19DC4C000, v11, OS_LOG_TYPE_DEFAULT, "%@ APS _connection is NULL in requestTokenForInfo!", buf, 0xCu);
    }
  }
}

- (void)invalidateTokenForTopic:(id)a3 identifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (__CFString *)a4;
  uint64_t v8 = +[APSLog connection];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    uint64_t v15 = self;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_19DC4C000, v8, OS_LOG_TYPE_DEFAULT, "%@ invalidateTokenForTopic: %@ identifier %@", buf, 0x20u);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__APSConnection_invalidateTokenForTopic_identifier___block_invoke;
  v11[3] = &unk_1E59825E0;
  if (!v7) {
    uint64_t v7 = &stru_1EF02C710;
  }
  v11[4] = self;
  uint64_t v12 = v7;
  id v13 = v6;
  id v9 = v6;
  uint64_t v10 = v7;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v11];
}

void __52__APSConnection_invalidateTokenForTopic_identifier___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _connectIfNecessaryOnIvarQueue];
  if (*(void *)(*(void *)(a1 + 32) + 104))
  {
    xpc_object_t message = xpc_dictionary_create(0, 0, 0);
    uint64_t v2 = (const char *)[@"message-type" UTF8String];
    APSInsertIntsToXPCDictionary(message, v2, v3, v4, v5, v6, v7, v8, 17);
    APSInsertNSStringsToXPCDictionary(message, "identifier", v9, v10, v11, v12, v13, v14, *(void *)(a1 + 40));
    xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 32) + 104), message);
  }
  else
  {
    uint64_t v15 = +[APSLog connection];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v19 = v16;
      _os_log_impl(&dword_19DC4C000, v15, OS_LOG_TYPE_DEFAULT, "%@ APS _connection is NULL in invalidateTokenForTopic!", buf, 0xCu);
    }
  }
}

- (void)invalidateTokenForInfo:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[APSLog connection];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    uint64_t v11 = self;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_19DC4C000, v5, OS_LOG_TYPE_DEFAULT, "%@ invalidateTokenForInfo: %@", buf, 0x16u);
  }

  uint64_t v6 = [v4 identifier];

  if (!v6) {
    [v4 setIdentifier:&stru_1EF02C710];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__APSConnection_invalidateTokenForInfo___block_invoke;
  v8[3] = &unk_1E59823E0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v8];
}

void __40__APSConnection_invalidateTokenForInfo___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _connectIfNecessaryOnIvarQueue];
  if (*(void *)(*(void *)(a1 + 32) + 104))
  {
    xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
    uint64_t v2 = (const char *)[@"message-type" UTF8String];
    APSInsertIntsToXPCDictionary(xdict, v2, v3, v4, v5, v6, v7, v8, 18);
    id v9 = [*(id *)(a1 + 40) dictionaryRepresentation];
    uint64_t v10 = APSCreateXPCObjectFromDictionary(v9);

    xpc_dictionary_set_value(xdict, "info", v10);
    xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 32) + 104), xdict);
  }
  else
  {
    uint64_t v11 = +[APSLog connection];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v15 = v12;
      _os_log_impl(&dword_19DC4C000, v11, OS_LOG_TYPE_DEFAULT, "%@ APS _connection is NULL in invalidateTokenForInfo!", buf, 0xCu);
    }
  }
}

- (void)calloutToDelegatesForURLTokenError:(id)a3 forInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__APSConnection_calloutToDelegatesForURLTokenError_forInfo_completion___block_invoke;
  v14[3] = &unk_1E5982970;
  id v15 = v8;
  uint64_t v16 = self;
  id v17 = v9;
  id v18 = v10;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(APSConnection *)self _asyncOnDelegateQueueWithBlock:v14 requiresDelegate:0];
}

void __71__APSConnection_calloutToDelegatesForURLTokenError_forInfo_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = a1[7];
  if (v4) {
    (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, 0, a1[4]);
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = +[APSLog connection];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = a1[4];
      uint64_t v6 = a1[5];
      uint64_t v8 = a1[6];
      int v11 = 138413058;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      id v14 = v3;
      __int16 v15 = 2112;
      uint64_t v16 = v7;
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      _os_log_impl(&dword_19DC4C000, v5, OS_LOG_TYPE_DEFAULT, "%@ calling %@ for received web token error %@ for info %@", (uint8_t *)&v11, 0x2Au);
    }

    [v3 connection:a1[5] didReceiveURLTokenError:a1[4] forInfo:a1[6]];
    id v9 = +[APSLog connection];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = a1[5];
      int v11 = 138412546;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_19DC4C000, v9, OS_LOG_TYPE_DEFAULT, "%@ returned from %@ didReceiveURLTokenError:forInfo", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)requestURLTokenForInfo:(id)a3
{
}

- (void)requestURLTokenForInfo:(id)a3 completion:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[APSLog connection];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)MEMORY[0x19F3B0300](v7);
    *(_DWORD *)long long buf = 138412802;
    uint64_t v36 = self;
    __int16 v37 = 2112;
    id v38 = v6;
    __int16 v39 = 2112;
    uint64_t v40 = v9;
    _os_log_impl(&dword_19DC4C000, v8, OS_LOG_TYPE_DEFAULT, "%@: requestURLTokenForInfo %@ completion %@", buf, 0x20u);
  }
  uint64_t v10 = [v6 topic];
  if (!v10
    || (int v11 = (void *)v10,
        [v6 vapidPublicKey],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        !v12))
  {
    uint64_t v18 = +[APSLog connection];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[APSConnection requestURLTokenForInfo:completion:]();
    }

    id v25 = @"Missing topic and/or vapidPublicKey";
    goto LABEL_11;
  }
  uint64_t v13 = [v6 expirationDate];
  if (v13)
  {
    id v14 = (void *)v13;
    __int16 v15 = [v6 expirationDate];
    uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v17 = [v15 compare:v16];

    if (v17 == -1)
    {
      uint64_t v27 = +[APSLog connection];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[APSConnection requestURLTokenForInfo:completion:]();
      }

      id v25 = @"expirationDate is in the past";
LABEL_11:
      uint64_t v26 = APSURLTokenError(100, v25, v19, v20, v21, v22, v23, v24, v28[0]);
      [(APSConnection *)self calloutToDelegatesForURLTokenError:v26 forInfo:v6 completion:v7];

      goto LABEL_12;
    }
  }
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __51__APSConnection_requestURLTokenForInfo_completion___block_invoke;
  v32[3] = &unk_1E5982998;
  v32[4] = self;
  id v34 = v7;
  id v33 = v6;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = (uint64_t)__51__APSConnection_requestURLTokenForInfo_completion___block_invoke_253;
  v28[3] = (uint64_t)&unk_1E59826D0;
  id v29 = v33;
  uint64_t v30 = self;
  id v31 = v34;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v32 shutdownBlock:v28];

LABEL_12:
}

void __51__APSConnection_requestURLTokenForInfo_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) _connectIfNecessaryOnIvarQueue];
  if (*((void *)*v2 + 13))
  {
    [*v2 _insertURLTokenBlock:*(void *)(a1 + 48) forInfo:*(void *)(a1 + 40)];
    xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
    id v3 = (const char *)[@"message-type" UTF8String];
    APSInsertIntsToXPCDictionary(xdict, v3, v4, v5, v6, v7, v8, v9, 16);
    uint64_t v10 = [*(id *)(a1 + 40) dictionaryRepresentation];
    int v11 = APSCreateXPCObjectFromDictionary(v10);

    xpc_dictionary_set_value(xdict, "info", v11);
    xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 32) + 104), xdict);
  }
  else
  {
    uint64_t v12 = +[APSLog connection];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __51__APSConnection_requestURLTokenForInfo_completion___block_invoke_cold_1();
    }

    uint64_t v19 = APSURLTokenError(101, @"No connection to apsd", v13, v14, v15, v16, v17, v18, v20);
    [*(id *)(a1 + 32) calloutToDelegatesForURLTokenError:v19 forInfo:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
}

void __51__APSConnection_requestURLTokenForInfo_completion___block_invoke_253(uint64_t a1)
{
  uint64_t v2 = +[APSLog connection];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __51__APSConnection_requestURLTokenForInfo_completion___block_invoke_253_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  uint64_t v15 = APSURLTokenError(101, @"Shutting down, unable to reach apsd", v9, v10, v11, v12, v13, v14, v16);
  [*(id *)(a1 + 40) calloutToDelegatesForURLTokenError:v15 forInfo:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
}

- (void)_insertURLTokenBlock:(id)a3 forInfo:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  pendingURLTokenBlocks = self->_pendingURLTokenBlocks;
  if (!pendingURLTokenBlocks)
  {
    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v9 = self->_pendingURLTokenBlocks;
    self->_pendingURLTokenBlocks = v8;

    pendingURLTokenBlocks = self->_pendingURLTokenBlocks;
  }
  uint64_t v10 = [(NSMutableDictionary *)pendingURLTokenBlocks objectForKeyedSubscript:v6];

  if (v10)
  {
    uint64_t v11 = [(NSMutableDictionary *)self->_pendingURLTokenBlocks objectForKeyedSubscript:v6];
    uint64_t v12 = (void *)MEMORY[0x19F3B0300](v14);
    [v11 addObject:v12];
  }
  else
  {
    id v13 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v11 = (void *)MEMORY[0x19F3B0300](v14);
    uint64_t v12 = objc_msgSend(v13, "initWithObjects:", v11, 0);
    [(NSMutableDictionary *)self->_pendingURLTokenBlocks setObject:v12 forKeyedSubscript:v6];
  }
}

- (id)_removeURLTokenBlocksForInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_pendingURLTokenBlocks objectForKeyedSubscript:v4];
  if (v5)
  {
    [(NSMutableDictionary *)self->_pendingURLTokenBlocks setObject:0 forKeyedSubscript:v4];
    if (![(NSMutableDictionary *)self->_pendingURLTokenBlocks count])
    {
      pendingURLTokenBlocks = self->_pendingURLTokenBlocks;
      self->_pendingURLTokenBlocks = 0;
    }
  }

  return v5;
}

- (void)calloutToInvalidateCompletion:(id)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __65__APSConnection_calloutToInvalidateCompletion_withSuccess_error___block_invoke;
    v10[3] = &unk_1E59829C0;
    id v12 = v8;
    BOOL v13 = a4;
    id v11 = v9;
    [(APSConnection *)self _asyncOnDelegateQueueWithBlock:v10 requiresDelegate:0];
  }
}

uint64_t __65__APSConnection_calloutToInvalidateCompletion_withSuccess_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)invalidateURLTokenForInfo:(id)a3
{
}

- (void)invalidateURLTokenForInfo:(id)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[APSLog connection];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)MEMORY[0x19F3B0300](v7);
    *(_DWORD *)long long buf = 138412802;
    uint64_t v26 = self;
    __int16 v27 = 2112;
    id v28 = v6;
    __int16 v29 = 2112;
    uint64_t v30 = v9;
    _os_log_impl(&dword_19DC4C000, v8, OS_LOG_TYPE_DEFAULT, "%@ invalidateURLTokenForInfo: %@ completion %@", buf, 0x20u);
  }
  uint64_t v10 = [v6 topic];

  if (v10)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __54__APSConnection_invalidateURLTokenForInfo_completion___block_invoke;
    v22[3] = &unk_1E59826D0;
    v22[4] = self;
    id v23 = v6;
    id v24 = v7;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = (uint64_t)__54__APSConnection_invalidateURLTokenForInfo_completion___block_invoke_264;
    v19[3] = (uint64_t)&unk_1E59826D0;
    v19[4] = (uint64_t)self;
    id v20 = v23;
    id v21 = v24;
    [(APSConnection *)self _dispatch_async_to_ivarQueue:v22 shutdownBlock:v19];
  }
  else
  {
    id v11 = +[APSLog connection];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[APSConnection requestURLTokenForInfo:completion:]();
    }

    uint64_t v18 = APSURLTokenError(100, @"Missing topic", v12, v13, v14, v15, v16, v17, v19[0]);
    [(APSConnection *)self calloutToInvalidateCompletion:v7 withSuccess:0 error:v18];
  }
}

void __54__APSConnection_invalidateURLTokenForInfo_completion___block_invoke(id *a1)
{
  uint64_t v2 = a1 + 4;
  [a1[4] _connectIfNecessaryOnIvarQueue];
  if (*((void *)*v2 + 13))
  {
    uint64_t v3 = xpc_dictionary_create(0, 0, 0);
    id v4 = (const char *)[@"message-type" UTF8String];
    APSInsertIntsToXPCDictionary(v3, v4, v5, v6, v7, v8, v9, v10, 19);
    id v11 = [a1[5] topic];
    APSInsertNSStringsToXPCDictionary(v3, "topic", v12, v13, v14, v15, v16, v17, (uint64_t)v11);

    id v18 = a1[4];
    uint64_t v19 = (_xpc_connection_s *)*((void *)v18 + 13);
    id v20 = *((void *)v18 + 2);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __54__APSConnection_invalidateURLTokenForInfo_completion___block_invoke_2;
    handler[3] = &unk_1E59829E8;
    handler[4] = v18;
    id v32 = a1[5];
    id v33 = a1[6];
    xpc_connection_send_message_with_reply(v19, v3, v20, handler);
  }
  else
  {
    id v21 = +[APSLog connection];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      __54__APSConnection_invalidateURLTokenForInfo_completion___block_invoke_cold_1();
    }

    id v22 = a1[4];
    id v23 = a1[6];
    uint64_t v3 = APSURLTokenError(101, @"No connection to apsd", v24, v25, v26, v27, v28, v29, v30);
    [v22 calloutToInvalidateCompletion:v23 withSuccess:0 error:v3];
  }
}

void __54__APSConnection_invalidateURLTokenForInfo_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__APSConnection_invalidateURLTokenForInfo_completion___block_invoke_3;
  v9[3] = &unk_1E59829E8;
  void v9[4] = v4;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__APSConnection_invalidateURLTokenForInfo_completion___block_invoke_260;
  v6[3] = &unk_1E59826D0;
  uint64_t v5 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  id v8 = *(id *)(a1 + 48);
  [v4 _handleEvent:a2 withHandler:v9 errorHandler:v6];
}

uint64_t __54__APSConnection_invalidateURLTokenForInfo_completion___block_invoke_3(uint64_t result, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v2 = result;
    uint64_t v3 = +[APSLog connection];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(v2 + 32);
      uint64_t v5 = *(void *)(v2 + 40);
      int v6 = 138412546;
      uint64_t v7 = v4;
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_impl(&dword_19DC4C000, v3, OS_LOG_TYPE_DEFAULT, "%@ invalidateURLTokenForInfo calling completion for %@", (uint8_t *)&v6, 0x16u);
    }

    return [*(id *)(v2 + 32) calloutToInvalidateCompletion:*(void *)(v2 + 48) withSuccess:1 error:0];
  }
  return result;
}

void __54__APSConnection_invalidateURLTokenForInfo_completion___block_invoke_260(uint64_t a1)
{
  uint64_t v2 = +[APSLog connection];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __54__APSConnection_invalidateURLTokenForInfo_completion___block_invoke_260_cold_1();
  }

  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  id v11 = APSURLTokenError(101, @"apsd connection interrupted", v5, v6, v7, v8, v9, v10, v12);
  [v3 calloutToInvalidateCompletion:v4 withSuccess:0 error:v11];
}

void __54__APSConnection_invalidateURLTokenForInfo_completion___block_invoke_264(uint64_t a1)
{
  uint64_t v2 = +[APSLog connection];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __54__APSConnection_invalidateURLTokenForInfo_completion___block_invoke_264_cold_1();
  }

  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  id v11 = APSURLTokenError(101, @"Shutting down, unable to reach apsd", v5, v6, v7, v8, v9, v10, v12);
  [v3 calloutToInvalidateCompletion:v4 withSuccess:0 error:v11];
}

- (void)currentTokenForInfo:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[APSLog connection];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v11 = self;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_19DC4C000, v5, OS_LOG_TYPE_DEFAULT, "%@: Current token for info %@", buf, 0x16u);
  }

  uint64_t v6 = [v4 topic];

  if (v6)
  {
    uint64_t v7 = [v4 identifier];

    if (!v7) {
      [v4 setIdentifier:&stru_1EF02C710];
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __37__APSConnection_currentTokenForInfo___block_invoke;
    v8[3] = &unk_1E59823E0;
    v8[4] = self;
    id v9 = v4;
    [(APSConnection *)self _dispatch_async_to_ivarQueue:v8];
  }
}

void __37__APSConnection_currentTokenForInfo___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _connectIfNecessaryOnIvarQueue];
  if (*(void *)(*(void *)(a1 + 32) + 104))
  {
    xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
    uint64_t v2 = (const char *)[@"message-type" UTF8String];
    APSInsertIntsToXPCDictionary(xdict, v2, v3, v4, v5, v6, v7, v8, 20);
    id v9 = [*(id *)(a1 + 40) dictionaryRepresentation];
    uint64_t v10 = APSCreateXPCObjectFromDictionary(v9);

    xpc_dictionary_set_value(xdict, "info", v10);
    xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 32) + 104), xdict);
  }
  else
  {
    id v11 = +[APSLog connection];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v15 = v12;
      _os_log_impl(&dword_19DC4C000, v11, OS_LOG_TYPE_DEFAULT, "%@ APS _connection is NULL in currentTokenForInfo!", buf, 0xCu);
    }
  }
}

- (void)currentURLTokenForInfo:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[APSLog connection];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    uint64_t v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_19DC4C000, v5, OS_LOG_TYPE_DEFAULT, "%@: Current url token for info %@", buf, 0x16u);
  }

  uint64_t v6 = [v4 topic];

  if (v6)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __40__APSConnection_currentURLTokenForInfo___block_invoke;
    v7[3] = &unk_1E59823E0;
    void v7[4] = self;
    id v8 = v4;
    [(APSConnection *)self _dispatch_async_to_ivarQueue:v7];
  }
}

void __40__APSConnection_currentURLTokenForInfo___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _connectIfNecessaryOnIvarQueue];
  if (*(void *)(*(void *)(a1 + 32) + 104))
  {
    xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
    uint64_t v2 = (const char *)[@"message-type" UTF8String];
    APSInsertIntsToXPCDictionary(xdict, v2, v3, v4, v5, v6, v7, v8, 21);
    id v9 = [*(id *)(a1 + 40) dictionaryRepresentation];
    uint64_t v10 = APSCreateXPCObjectFromDictionary(v9);

    xpc_dictionary_set_value(xdict, "info", v10);
    xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 32) + 104), xdict);
  }
  else
  {
    __int16 v11 = +[APSLog connection];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v15 = v12;
      _os_log_impl(&dword_19DC4C000, v11, OS_LOG_TYPE_DEFAULT, "%@ APS _connection is NULL in currentTokenForInfo!", buf, 0xCu);
    }
  }
}

- (void)requestKeepAlive
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __33__APSConnection_requestKeepAlive__block_invoke;
  v2[3] = &unk_1E5982370;
  v2[4] = self;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v2];
}

void __33__APSConnection_requestKeepAlive__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _connectIfNecessaryOnIvarQueue];
  if (*(void *)(*(void *)(a1 + 32) + 104))
  {
    xpc_object_t message = xpc_dictionary_create(0, 0, 0);
    uint64_t v2 = (const char *)[@"message-type" UTF8String];
    APSInsertIntsToXPCDictionary(message, v2, v3, v4, v5, v6, v7, v8, 49);
    xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 32) + 104), message);
  }
  else
  {
    id v9 = +[APSLog connection];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v13 = v10;
      _os_log_impl(&dword_19DC4C000, v9, OS_LOG_TYPE_DEFAULT, "%@ APS _connection is NULL in requestKeepAlive!", buf, 0xCu);
    }
  }
}

- (void)confirmReceiptForMessage:(id)a3
{
  id v4 = a3;
  if ([v4 isTracingEnabled])
  {
    uint64_t v5 = [v4 tracingUUID];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      uint64_t v7 = [v4 topic];

      if (v7)
      {
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __42__APSConnection_confirmReceiptForMessage___block_invoke;
        v8[3] = &unk_1E59823E0;
        v8[4] = self;
        id v9 = v4;
        [(APSConnection *)self _dispatch_async_to_ivarQueue:v8];
      }
    }
  }
}

void __42__APSConnection_confirmReceiptForMessage___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _connectIfNecessaryOnIvarQueue];
  if (*(void *)(*(void *)(a1 + 32) + 104))
  {
    xpc_object_t message = xpc_dictionary_create(0, 0, 0);
    uint64_t v2 = (const char *)[@"message-type" UTF8String];
    APSInsertIntsToXPCDictionary(message, v2, v3, v4, v5, v6, v7, v8, 24);
    id v9 = [*(id *)(a1 + 40) tracingUUID];
    APSInsertDatasToXPCDictionary(message, "tracingUUID", v10, v11, v12, v13, v14, v15, (uint64_t)v9);

    uint64_t v16 = [*(id *)(a1 + 40) topic];
    APSInsertNSStringsToXPCDictionary(message, "topic", v17, v18, v19, v20, v21, v22, (uint64_t)v16);

    xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 32) + 104), message);
  }
  else
  {
    id v23 = +[APSLog connection];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v27 = v24;
      _os_log_impl(&dword_19DC4C000, v23, OS_LOG_TYPE_DEFAULT, "%@ APS _connection is NULL in confirmReceiptForMessage!", buf, 0xCu);
    }
  }
}

+ (id)_createXPCConnectionWithQueueName:(const char *)a3
{
  dispatch_queue_t v3 = dispatch_queue_create(a3, 0);
  uint64_t v4 = APSXPCCreateConnectionForServiceWithQueue(1, 0, "com.apple.apsd", v3, 0, 0);

  return v4;
}

- (void)subscribeToChannel:(id)a3 forTopic:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:&v10 count:1];

  -[APSConnection subscribeToChannels:forTopic:](self, "subscribeToChannels:forTopic:", v9, v7, v10, v11);
}

- (void)subscribeToChannels:(id)a3 forTopic:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v31 = (void *)[v6 mutableCopy];
  id v32 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v30 = [MEMORY[0x1E4F1CA48] array];
  id v8 = [(APSConnection *)self enabledTopics];
  if ([v8 containsObject:v7]) {
    goto LABEL_6;
  }
  id v9 = [(APSConnection *)self opportunisticTopics];
  if ([v9 containsObject:v7])
  {
LABEL_5:

LABEL_6:
    goto LABEL_7;
  }
  id v10 = [(APSConnection *)self nonWakingTopics];
  if ([v10 containsObject:v7])
  {

    goto LABEL_5;
  }
  uint64_t v27 = [(APSConnection *)self ignoredTopics];
  char v28 = [v27 containsObject:v7];

  if ((v28 & 1) == 0)
  {
    id v8 = +[APSLog connection];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[APSConnection subscribeToChannels:forTopic:](v8);
    }
    goto LABEL_6;
  }
LABEL_7:
  uint64_t v29 = v7;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v38 objects:v46 count:16];
  uint64_t v13 = v30;
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v39;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v39 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void **)(*((void *)&v38 + 1) + 8 * v16);
        id v18 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        uint64_t v19 = [v17 channelID];
        uint64_t v20 = (void *)[v18 initWithBase64EncodedString:v19 options:0];

        uint64_t v21 = +[APSLog connection];
        uint64_t v22 = v21;
        if (v20)
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v43 = v17;
            _os_log_impl(&dword_19DC4C000, v22, OS_LOG_TYPE_DEFAULT, "Sending subscription request %@ to daemon", buf, 0xCu);
          }

          id v23 = [v17 dictionaryRepresentation];
          [v13 addObject:v23];
        }
        else
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            [(APSConnection *)v44 subscribeToChannels:&v45 forTopic:v22];
          }

          id v23 = objc_alloc_init(APSChannelSubscriptionFailure);
          uint64_t v24 = [v17 channelID];
          [(APSChannelSubscriptionFailure *)v23 setChannelID:v24];

          [(APSChannelSubscriptionFailure *)v23 setFailureReason:0];
          [v32 addObject:v23];
          [v31 removeObject:v17];
          uint64_t v13 = v30;
        }

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v11 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v14);
  }

  if ([v32 count])
  {
    uint64_t v25 = [(APSConnection *)self delegate];
    char v26 = objc_opt_respondsToSelector();

    if (v26)
    {
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __46__APSConnection_subscribeToChannels_forTopic___block_invoke;
      v36[3] = &unk_1E5982A10;
      v36[4] = self;
      id v37 = v32;
      [(APSConnection *)self _asyncOnDelegateQueueWithBlock:v36];
    }
  }
  if ([v31 count])
  {
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __46__APSConnection_subscribeToChannels_forTopic___block_invoke_2;
    v33[3] = &unk_1E59825E0;
    v33[4] = self;
    id v34 = v30;
    id v35 = v29;
    [(APSConnection *)self _dispatch_async_to_ivarQueue:v33];
  }
}

void __46__APSConnection_subscribeToChannels_forTopic___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 connection:*(void *)(a1 + 32) channelSubscriptionsFailedWithFailures:*(void *)(a1 + 40)];
}

void __46__APSConnection_subscribeToChannels_forTopic___block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _connectIfNecessaryOnIvarQueue];
  if (*(void *)(*(void *)(a1 + 32) + 104))
  {
    xpc_object_t message = xpc_dictionary_create(0, 0, 0);
    id v2 = (const char *)[@"message-type" UTF8String];
    APSInsertIntsToXPCDictionary(message, v2, v3, v4, v5, v6, v7, v8, 50);
    APSInsertNSArraysToXPCDictionary(message, "channelDicts", v9, v10, v11, v12, v13, v14, *(void *)(a1 + 40));
    APSInsertNSStringsToXPCDictionary(message, "pushTopic", v15, v16, v17, v18, v19, v20, *(void *)(a1 + 48));
    xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 32) + 104), message);
  }
  else
  {
    uint64_t v21 = +[APSLog connection];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v25 = v22;
      _os_log_impl(&dword_19DC4C000, v21, OS_LOG_TYPE_DEFAULT, "%@ APS _connection is NULL in subscribeToChannel:forTopic:!", buf, 0xCu);
    }
  }
}

- (void)unsubscribeFromChannel:(id)a3 forTopic:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 arrayWithObjects:&v10 count:1];

  -[APSConnection unsubscribeFromChannels:forTopic:](self, "unsubscribeFromChannels:forTopic:", v9, v7, v10, v11);
}

- (void)unsubscribeFromChannels:(id)a3 forTopic:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v17 = a4;
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v13 = +[APSLog connection];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v27 = v12;
          _os_log_impl(&dword_19DC4C000, v13, OS_LOG_TYPE_DEFAULT, "Sending unsubscribe request %@ to daemon", buf, 0xCu);
        }

        uint64_t v14 = [v12 dictionaryRepresentation];
        [v6 addObject:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v9);
  }

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __50__APSConnection_unsubscribeFromChannels_forTopic___block_invoke;
  v19[3] = &unk_1E59825E0;
  v19[4] = self;
  id v20 = v6;
  id v21 = v17;
  id v15 = v17;
  id v16 = v6;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v19];
}

void __50__APSConnection_unsubscribeFromChannels_forTopic___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _connectIfNecessaryOnIvarQueue];
  if (*(void *)(*(void *)(a1 + 32) + 104))
  {
    xpc_object_t message = xpc_dictionary_create(0, 0, 0);
    id v2 = (const char *)[@"message-type" UTF8String];
    APSInsertIntsToXPCDictionary(message, v2, v3, v4, v5, v6, v7, v8, 51);
    APSInsertNSDictionariesToXPCDictionary(message, "channelDicts", v9, v10, v11, v12, v13, v14, *(void *)(a1 + 40));
    APSInsertNSStringsToXPCDictionary(message, "pushTopic", v15, v16, v17, v18, v19, v20, *(void *)(a1 + 48));
    xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 32) + 104), message);
  }
  else
  {
    id v21 = +[APSLog connection];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v25 = v22;
      _os_log_impl(&dword_19DC4C000, v21, OS_LOG_TYPE_DEFAULT, "%@ APS _connection is NULL in unsubscribeFromChannel:forTopic:!", buf, 0xCu);
    }
  }
}

- (void)getRegisteredChannelsForTopic:(id)a3 withCompletion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __62__APSConnection_getRegisteredChannelsForTopic_withCompletion___block_invoke;
    v17[3] = &unk_1E5982A60;
    v17[4] = self;
    id v18 = v7;
    uint64_t v9 = (void *)MEMORY[0x19F3B0300](v17);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __62__APSConnection_getRegisteredChannelsForTopic_withCompletion___block_invoke_3;
    v14[3] = &unk_1E59826D0;
    void v14[4] = self;
    id v15 = v6;
    id v16 = v9;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__APSConnection_getRegisteredChannelsForTopic_withCompletion___block_invoke_280;
    v12[3] = &unk_1E59824C8;
    void v12[4] = self;
    id v13 = v16;
    id v10 = v16;
    [(APSConnection *)self _dispatch_async_to_ivarQueue:v14 shutdownBlock:v12];
  }
  else
  {
    uint64_t v11 = +[APSLog connection];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v20 = self;
      _os_log_impl(&dword_19DC4C000, v11, OS_LOG_TYPE_DEFAULT, "%@ APS getRegisteredChannelsForTopic:withCompletion: was given a nil block -- returning", buf, 0xCu);
    }
  }
}

void __62__APSConnection_getRegisteredChannelsForTopic_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__APSConnection_getRegisteredChannelsForTopic_withCompletion___block_invoke_2;
  v11[3] = &unk_1E5982A38;
  id v7 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  [v7 _asyncOnDelegateQueueWithBlock:v11 requiresDelegate:0];
}

uint64_t __62__APSConnection_getRegisteredChannelsForTopic_withCompletion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __62__APSConnection_getRegisteredChannelsForTopic_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _connectIfNecessaryOnIvarQueue];
  if (*(void *)(*(void *)(a1 + 32) + 104))
  {
    id v2 = xpc_dictionary_create(0, 0, 0);
    uint64_t v3 = (const char *)[@"message-type" UTF8String];
    APSInsertIntsToXPCDictionary(v2, v3, v4, v5, v6, v7, v8, v9, 52);
    APSInsertNSStringsToXPCDictionary(v2, "pushTopic", v10, v11, v12, v13, v14, v15, *(void *)(a1 + 40));
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(_xpc_connection_s **)(v16 + 104);
    id v18 = *(NSObject **)(v16 + 16);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __62__APSConnection_getRegisteredChannelsForTopic_withCompletion___block_invoke_4;
    handler[3] = &unk_1E59829E8;
    handler[4] = v16;
    id v30 = *(id *)(a1 + 40);
    id v31 = *(id *)(a1 + 48);
    xpc_connection_send_message_with_reply(v17, v2, v18, handler);
  }
  else
  {
    uint64_t v19 = +[APSLog connection];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v33 = v20;
      _os_log_impl(&dword_19DC4C000, v19, OS_LOG_TYPE_DEFAULT, "%@ APS _connection is NULL in subscribeToChannel:forTopic:!", buf, 0xCu);
    }

    uint64_t v21 = *(void *)(a1 + 48);
    id v2 = APSPubSubError(100, @"Failed connecting to apsd", v22, v23, v24, v25, v26, v27, v28);
    (*(void (**)(uint64_t, void, void *))(v21 + 16))(v21, 0, v2);
  }
}

void __62__APSConnection_getRegisteredChannelsForTopic_withCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__APSConnection_getRegisteredChannelsForTopic_withCompletion___block_invoke_5;
  v12[3] = &unk_1E5982A88;
  id v5 = v3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = v6;
  id v15 = v7;
  id v16 = *(id *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__APSConnection_getRegisteredChannelsForTopic_withCompletion___block_invoke_273;
  v9[3] = &unk_1E59826D0;
  void v9[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v11 = *(id *)(a1 + 48);
  id v8 = v5;
  [v4 _handleEvent:v8 withHandler:v12 errorHandler:v9];
}

void __62__APSConnection_getRegisteredChannelsForTopic_withCompletion___block_invoke_5(void *a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)a1[4];
  if (v2)
  {
    id v3 = APSGetXPCArrayFromDictionary(v2, "subscribedChannels");
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * v9);
          id v11 = objc_alloc((Class)CUTWeakLinkClass());
          uint64_t v12 = objc_msgSend(v11, "initWithDictionary:", v10, (void)v16);
          [v4 addObject:v12];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v26 count:16];
      }
      while (v7);
    }

    id v13 = +[APSLog connection];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = a1[5];
      uint64_t v15 = a1[6];
      *(_DWORD *)long long buf = 138412802;
      uint64_t v21 = v14;
      __int16 v22 = 2112;
      uint64_t v23 = v15;
      __int16 v24 = 2112;
      uint64_t v25 = v4;
      _os_log_impl(&dword_19DC4C000, v13, OS_LOG_TYPE_DEFAULT, "%@ push topic %@ got registered channels %@", buf, 0x20u);
    }

    (*(void (**)(void))(a1[7] + 16))();
  }
}

void __62__APSConnection_getRegisteredChannelsForTopic_withCompletion___block_invoke_273(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = +[APSLog connection];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    *(_DWORD *)id v13 = 138412546;
    *(void *)&v13[4] = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    _os_log_impl(&dword_19DC4C000, v2, OS_LOG_TYPE_DEFAULT, "%@ APS received an error in getRegisteredChannelsForTopic:withCompletion: %@", v13, 0x16u);
  }

  uint64_t v5 = a1[6];
  uint64_t v12 = APSPubSubError(100, @"XPC Error received", v6, v7, v8, v9, v10, v11, *(uint64_t *)v13);
  (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v12);
}

void __62__APSConnection_getRegisteredChannelsForTopic_withCompletion___block_invoke_280(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = +[APSLog connection];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)uint64_t v12 = 138412290;
    *(void *)&void v12[4] = v3;
    _os_log_impl(&dword_19DC4C000, v2, OS_LOG_TYPE_DEFAULT, "%@ APS getRegisteredChannelsForTopic:withCompletion: shutting down -- returning", v12, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v11 = APSPubSubError(100, @"Shutting down, unable to reach apsd", v5, v6, v7, v8, v9, v10, *(uint64_t *)v12);
  (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v11);
}

- (void)getRegisteredChannelsForTopic:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__APSConnection_getRegisteredChannelsForTopic_completion___block_invoke;
    v9[3] = &unk_1E5982AB0;
    uint64_t v10 = v6;
    [(APSConnection *)self getRegisteredChannelsForTopic:a3 withCompletion:v9];
    uint64_t v8 = v10;
  }
  else
  {
    uint64_t v8 = +[APSLog connection];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v12 = self;
      _os_log_impl(&dword_19DC4C000, v8, OS_LOG_TYPE_DEFAULT, "%@ APS getRegisteredChannelsForTopic:completion: was given a nil block -- returning", buf, 0xCu);
    }
  }
}

uint64_t __58__APSConnection_getRegisteredChannelsForTopic_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3) {
    a2 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
}

- (id)registeredChannelsForTopic:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy_;
  uint64_t v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__APSConnection_registeredChannelsForTopic_error___block_invoke;
  v12[3] = &unk_1E5982B28;
  void v12[4] = self;
  id v7 = v6;
  id v13 = v7;
  __int16 v14 = &v16;
  uint64_t v15 = &v22;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__APSConnection_registeredChannelsForTopic_error___block_invoke_282;
  v11[3] = &unk_1E5982608;
  void v11[4] = self;
  void v11[5] = &v22;
  [(APSConnection *)self _dispatch_sync_to_ivarQueue:v12 shutdownBlock:v11];
  if (a4)
  {
    uint64_t v8 = (void *)v23[5];
    if (v8) {
      *a4 = v8;
    }
  }
  id v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

void __50__APSConnection_registeredChannelsForTopic_error___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _connectIfNecessaryOnIvarQueue];
  if (*(void *)(*(void *)(a1 + 32) + 104))
  {
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    uint64_t v3 = (const char *)[@"message-type" UTF8String];
    APSInsertIntsToXPCDictionary(v2, v3, v4, v5, v6, v7, v8, v9, 52);
    APSInsertNSStringsToXPCDictionary(v2, "pushTopic", v10, v11, v12, v13, v14, v15, *(void *)(a1 + 40));
    xpc_object_t v16 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(*(void *)(a1 + 32) + 104), v2);
    long long v17 = *(void **)(a1 + 32);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __50__APSConnection_registeredChannelsForTopic_error___block_invoke_2;
    v38[3] = &unk_1E5982AD8;
    id v18 = v16;
    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v20 = *(void **)(a1 + 40);
    id v39 = v18;
    uint64_t v40 = v19;
    id v21 = v20;
    uint64_t v22 = *(void *)(a1 + 48);
    id v41 = v21;
    uint64_t v42 = v22;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __50__APSConnection_registeredChannelsForTopic_error___block_invoke_281;
    v35[3] = &unk_1E5982B00;
    v35[4] = *(void *)(a1 + 32);
    id v36 = v18;
    uint64_t v37 = *(void *)(a1 + 56);
    id v23 = v18;
    [v17 _handleEvent:v23 withHandler:v38 errorHandler:v35];
  }
  else
  {
    uint64_t v24 = +[APSLog connection];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v44 = v25;
      _os_log_impl(&dword_19DC4C000, v24, OS_LOG_TYPE_DEFAULT, "%@ APS _connection is NULL in subscribeToChannel:forTopic:!", buf, 0xCu);
    }

    uint64_t v32 = APSPubSubError(100, @"Failed connecting to apsd", v26, v27, v28, v29, v30, v31, v34);
    uint64_t v33 = *(void *)(*(void *)(a1 + 56) + 8);
    xpc_object_t v2 = *(xpc_object_t *)(v33 + 40);
    *(void *)(v33 + 40) = v32;
  }
}

void __50__APSConnection_registeredChannelsForTopic_error___block_invoke_2(void *a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  xpc_object_t v2 = (void *)a1[4];
  if (v2)
  {
    uint64_t v3 = APSGetXPCArrayFromDictionary(v2, "subscribedChannels");
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * v9);
          id v11 = objc_alloc((Class)CUTWeakLinkClass());
          uint64_t v12 = objc_msgSend(v11, "initWithDictionary:", v10, (void)v19);
          [v4 addObject:v12];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v29 count:16];
      }
      while (v7);
    }

    uint64_t v13 = +[APSLog connection];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = a1[5];
      uint64_t v15 = a1[6];
      *(_DWORD *)long long buf = 138412802;
      uint64_t v24 = v14;
      __int16 v25 = 2112;
      uint64_t v26 = v15;
      __int16 v27 = 2112;
      uint64_t v28 = v4;
      _os_log_impl(&dword_19DC4C000, v13, OS_LOG_TYPE_DEFAULT, "%@ push topic %@ got registered channels %@", buf, 0x20u);
    }

    uint64_t v16 = [v4 copy];
    uint64_t v17 = *(void *)(a1[7] + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
  }
}

void __50__APSConnection_registeredChannelsForTopic_error___block_invoke_281(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  xpc_object_t v2 = +[APSLog connection];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    *(_DWORD *)uint64_t v14 = 138412546;
    *(void *)&void v14[4] = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    _os_log_impl(&dword_19DC4C000, v2, OS_LOG_TYPE_DEFAULT, "%@ APS received an error in getRegisteredChannelsForTopic:withCompletion: %@", v14, 0x16u);
  }

  uint64_t v11 = APSPubSubError(100, @"XPC Error received", v5, v6, v7, v8, v9, v10, *(uint64_t *)v14);
  uint64_t v12 = *(void *)(a1[6] + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

void __50__APSConnection_registeredChannelsForTopic_error___block_invoke_282(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  xpc_object_t v2 = +[APSLog connection];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)uint64_t v13 = 138412290;
    *(void *)&v13[4] = v3;
    _os_log_impl(&dword_19DC4C000, v2, OS_LOG_TYPE_DEFAULT, "%@ APS getRegisteredChannelsForTopic:withCompletion: shutting down -- returning", v13, 0xCu);
  }

  uint64_t v10 = APSPubSubError(100, @"Shutting down, unable to reach apsd", v4, v5, v6, v7, v8, v9, *(uint64_t *)v13);
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (void)_deliverFailedChannelSubscriptions:(id)a3 onTopic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__APSConnection__deliverFailedChannelSubscriptions_onTopic___block_invoke;
  v10[3] = &unk_1E59825E0;
  id v11 = v6;
  id v12 = v7;
  uint64_t v13 = self;
  id v8 = v7;
  id v9 = v6;
  [(APSConnection *)self _dispatch_async_to_ivarQueue:v10];
}

void __60__APSConnection__deliverFailedChannelSubscriptions_onTopic___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  xpc_object_t v2 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v19 + 1) + 8 * v6);
        id v8 = objc_alloc_init(APSChannelSubscriptionFailure);
        id v9 = [v7 objectForKeyedSubscript:@"channelID"];
        [(APSChannelSubscriptionFailure *)v8 setChannelID:v9];

        uint64_t v10 = [v7 objectForKeyedSubscript:@"reason"];
        -[APSChannelSubscriptionFailure setFailureReason:](v8, "setFailureReason:", [v10 integerValue]);
        [(APSChannelSubscriptionFailure *)v8 setPushTopic:*(void *)(a1 + 40)];
        [v2 addObject:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v29 count:16];
    }
    while (v4);
  }

  id v11 = +[APSLog connection];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    *(_DWORD *)long long buf = 138412802;
    uint64_t v24 = v12;
    __int16 v25 = 2112;
    uint64_t v26 = v2;
    __int16 v27 = 2112;
    uint64_t v28 = v13;
    _os_log_impl(&dword_19DC4C000, v11, OS_LOG_TYPE_DEFAULT, "%@ Received failed subscription requests %@ for topic %@", buf, 0x20u);
  }

  uint64_t v14 = *(void **)(a1 + 48);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __60__APSConnection__deliverFailedChannelSubscriptions_onTopic___block_invoke_289;
  v17[3] = &unk_1E5982A10;
  v17[4] = v14;
  id v18 = v2;
  id v15 = v2;
  [v14 _asyncOnDelegateQueueWithBlock:v17];
}

void __60__APSConnection__deliverFailedChannelSubscriptions_onTopic___block_invoke_289(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = +[APSLog connection];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_19DC4C000, v4, OS_LOG_TYPE_DEFAULT, "%@ calling %@ for subscription failures", (uint8_t *)&v8, 0x16u);
    }

    [v3 connection:*(void *)(a1 + 32) channelSubscriptionsFailedWithFailures:*(void *)(a1 + 40)];
    uint64_t v6 = +[APSLog connection];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_19DC4C000, v6, OS_LOG_TYPE_DEFAULT, "%@ returned from %@ channelSubscriptionsFailedWithFailures:", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)_onIvarQueue_setPushWakeTopics:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (NSArray *)a3;
  uint64_t v6 = +[APSLog connection];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    uint64_t v16 = self;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl(&dword_19DC4C000, v6, OS_LOG_TYPE_DEFAULT, "%@: Setting PushWakeTopics: %@", buf, 0x16u);
  }

  if (self->_pushWakeTopics != v5) {
    objc_storeStrong((id *)&self->_pushWakeTopics, a3);
  }
  [(APSConnection *)self _connectIfNecessaryOnIvarQueue];
  if (self->_connection)
  {
    uint64_t v7 = xpc_dictionary_create(0, 0, 0);
    int v8 = (const char *)[@"message-type" UTF8String];
    APSInsertIntsToXPCDictionary(v7, v8, v9, v10, v11, v12, v13, v14, 38);
    [(APSConnection *)self _addPushWakeTopicsToXPCMessage:v7];
    xpc_connection_send_message(self->_connection, v7);
  }
  else
  {
    uint64_t v7 = +[APSLog connection];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v16 = self;
      _os_log_impl(&dword_19DC4C000, v7, OS_LOG_TYPE_DEFAULT, "%@ _connection is NULL in _setPushWakeTopics", buf, 0xCu);
    }
  }
}

- (BOOL)usesAppLaunchStats
{
  return self->_usesAppLaunchStats;
}

- (void)setUsesAppLaunchStats:(BOOL)a3
{
  self->_usesAppLaunchStats = a3;
}

- (os_unfair_lock_s)topicMoveLock
{
  return self->_topicMoveLock;
}

- (void)setTopicMoveLock:(os_unfair_lock_s)a3
{
  self->_topicMoveLock = a3;
}

- (NSMutableArray)accumulatedTopicMoves
{
  return self->_accumulatedTopicMoves;
}

- (void)setAccumulatedTopicMoves:(id)a3
{
}

- (BOOL)isShutdown
{
  return self->_isShutdown;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accumulatedTopicMoves, 0);
  objc_storeStrong((id *)&self->_nonWakingTopics, 0);
  objc_storeStrong((id *)&self->_opportunisticTopics, 0);
  objc_storeStrong((id *)&self->_ignoredTopics, 0);
  objc_storeStrong((id *)&self->_enabledTopics, 0);
  objc_storeStrong((id *)&self->_pendingURLTokenBlocks, 0);
  objc_storeStrong((id *)&self->_ultraConstrainedTopics, 0);
  objc_storeStrong((id *)&self->_pushWakeTopics, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_queuedDelegateBlocks, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_mach_source, 0);
  objc_storeStrong((id *)&self->_machQueue, 0);
  objc_storeStrong((id *)&self->_idsToOutgoingMessages, 0);
  objc_storeStrong((id *)&self->_connectionPortName, 0);
  objc_storeStrong((id *)&self->_publicToken, 0);
  objc_storeStrong((id *)&self->_environmentName, 0);
  objc_storeStrong((id *)&self->_ivarQueue, 0);
  objc_storeStrong((id *)&self->_delegateReference, 0);
}

- (void)_initWithEnvironmentName:namedDelegatePort:enablePushDuringSleep:personaUniqueString:queue:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_19DC4C000, v0, v1, "Client provided an invalid port name! {nameOfPort: %@}", v2, v3, v4, v5, v6);
}

void __35__APSConnection_scheduleInRunLoop___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_19DC4C000, log, OS_LOG_TYPE_ERROR, "We should not call scheduleInRunLoop if _queue is not null!", v1, 2u);
}

void __121__APSConnection__onIvarQueue_setEnabledTopics_ignoredTopics_opportunisticTopics_nonWakingTopics_sendToDaemon_completion___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_19DC4C000, a2, OS_LOG_TYPE_FAULT, "%@ provided setTopics completion block without delegate queue to callback on -- dropping", (uint8_t *)&v3, 0xCu);
}

+ (void)_blockingXPCCallWithArgumentBlock:resultHandler:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v2 = 2080;
  int v3 = "com.apple.apsd";
  _os_log_fault_impl(&dword_19DC4C000, v0, OS_LOG_TYPE_FAULT, "%@: Failed to perform blocking call, unable to allocate XPC connection to '%s'", v1, 0x16u);
}

- (void)requestURLTokenForInfo:completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_19DC4C000, v0, v1, "Web token info does not contain required fields. Failing %@", v2, v3, v4, v5, v6);
}

- (void)requestURLTokenForInfo:completion:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_19DC4C000, v0, v1, "Web token info contains past expiration date. Failing %@", v2, v3, v4, v5, v6);
}

void __51__APSConnection_requestURLTokenForInfo_completion___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_19DC4C000, v0, (uint64_t)v0, "%@ APS _connection is NULL in requestURLTokenForInfo %@", v1);
}

void __51__APSConnection_requestURLTokenForInfo_completion___block_invoke_253_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __54__APSConnection_invalidateURLTokenForInfo_completion___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_19DC4C000, v0, (uint64_t)v0, "%@ APS _connection is NULL in invalidateURLTokenForInfo %@", v1);
}

void __54__APSConnection_invalidateURLTokenForInfo_completion___block_invoke_260_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_19DC4C000, v0, v1, "%@ invalidateURLTokenForInfo commmunication error. Failing %@", v2);
}

void __54__APSConnection_invalidateURLTokenForInfo_completion___block_invoke_264_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_19DC4C000, v0, v1, "%@ invalidateURLTokenForInfo shutting down. Failing %@", v2);
}

- (void)subscribeToChannels:(void *)a3 forTopic:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 channelID];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_19DC4C000, a4, OS_LOG_TYPE_ERROR, "ChannelID is not invalid.  Provided ID is not a base64 string. %@", a1, 0xCu);
}

- (void)subscribeToChannels:(os_log_t)log forTopic:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_19DC4C000, log, OS_LOG_TYPE_FAULT, "You are subscribing to a push topic that has not been enabled. This can lead to undefined behavior.  Please enable topics before subscribing.", v1, 2u);
}

@end