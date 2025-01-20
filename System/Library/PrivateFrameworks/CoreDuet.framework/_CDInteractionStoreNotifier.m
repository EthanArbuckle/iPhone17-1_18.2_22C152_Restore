@interface _CDInteractionStoreNotifier
+ (_CDInteractionStoreNotifier)sharedInstance;
- (_CDInteractionStoreNotifier)init;
- (id)filterInteractionsForUser:(id)a3;
- (void)addSubscriber:(id)a3;
- (void)dealloc;
- (void)deleteAll;
- (void)deleted:(id)a3;
- (void)handleXPCNotificationEvent:(id)a3;
- (void)init;
- (void)postPackedMechanisms:(unint64_t)a3;
- (void)publishDeletedXPCEvent:(id)a3;
- (void)publishRecordedXPCEvent:(id)a3;
- (void)recorded:(id)a3;
- (void)removeSubscriberWithToken:(unint64_t)a3 streamName:(id)a4;
- (void)resume;
- (void)suspend;
@end

@implementation _CDInteractionStoreNotifier

+ (_CDInteractionStoreNotifier)sharedInstance
{
  if (sharedInstance__pasOnceToken2_0 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_0, &__block_literal_global_64);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_3;
  return (_CDInteractionStoreNotifier *)v2;
}

- (void)removeSubscriberWithToken:(unint64_t)a3 streamName:(id)a4
{
  id v6 = a4;
  v7 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18ECEB000, v7, OS_LOG_TYPE_DEFAULT, "Removing subscriber", buf, 2u);
  }

  v8 = [NSString stringWithUTF8String:"com.apple.coreduetinteraction.interaction-recorded"];
  int v9 = [v8 isEqualToString:v6];

  if (v9)
  {
    v10 = self->_interactionStoreRecordedEventSubscribersByToken;
    objc_sync_enter(v10);
    interactionStoreRecordedEventSubscribersByToken = self->_interactionStoreRecordedEventSubscribersByToken;
    v12 = [NSNumber numberWithUnsignedLongLong:a3];
    [(NSMutableDictionary *)interactionStoreRecordedEventSubscribersByToken setObject:0 forKeyedSubscript:v12];

    v13 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = 0;
      v14 = "Successfully removed subscriber for interaction recording";
      v15 = (uint8_t *)&v21;
LABEL_9:
      _os_log_impl(&dword_18ECEB000, v13, OS_LOG_TYPE_DEFAULT, v14, v15, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  v16 = [NSString stringWithUTF8String:"com.apple.coreduetinteraction.interaction-deleted"];
  int v17 = [v16 isEqualToString:v6];

  if (v17)
  {
    v10 = self->_interactionStoreDeletedEventSubscribersByToken;
    objc_sync_enter(v10);
    interactionStoreDeletedEventSubscribersByToken = self->_interactionStoreDeletedEventSubscribersByToken;
    v19 = [NSNumber numberWithUnsignedLongLong:a3];
    [(NSMutableDictionary *)interactionStoreDeletedEventSubscribersByToken setObject:0 forKeyedSubscript:v19];

    v13 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v20 = 0;
      v14 = "Successfully removed subscriber for interaction deletion";
      v15 = (uint8_t *)&v20;
      goto LABEL_9;
    }
LABEL_10:

    objc_sync_exit(v10);
    goto LABEL_13;
  }
  v10 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(&v10->super.super, OS_LOG_TYPE_ERROR)) {
    -[_CDInteractionStoreNotifier removeSubscriberWithToken:streamName:]((uint64_t)v6, &v10->super.super);
  }
LABEL_13:
}

- (void)publishRecordedXPCEvent:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v4 = (_CDXPCEventPublisher *)a3;
  v5 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138739971;
    v29 = v4;
    _os_log_impl(&dword_18ECEB000, v5, OS_LOG_TYPE_INFO, "Publishing recorded XPC event with interactions %{sensitive}@", buf, 0xCu);
  }

  id v6 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    interactionRecordedEventPublisher = self->_interactionRecordedEventPublisher;
    *(_DWORD *)buf = 138412290;
    v29 = interactionRecordedEventPublisher;
    _os_log_impl(&dword_18ECEB000, v6, OS_LOG_TYPE_INFO, "_interactionRecordedEventPublisher %@", buf, 0xCu);
  }

  if (self->_interactionRecordedEventPublisher)
  {
    if (v4) {
      v8 = v4;
    }
    else {
      v8 = (_CDXPCEventPublisher *)MEMORY[0x1E4F1CBF0];
    }
    v26 = @"_CDInteractionsKey";
    v27 = v8;
    int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    id v24 = 0;
    v10 = +[_CDXPCCodecs notificationEventWithRegistrationIdentifier:@"_CDInteractionStoreRecordedInteractionsNotification" info:v9 error:&v24];
    id v11 = v24;

    v12 = self->_interactionStoreRecordedEventSubscribersByToken;
    objc_sync_enter(v12);
    v13 = [(NSMutableDictionary *)self->_interactionStoreRecordedEventSubscribersByToken allValues];
    v14 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v13;
      _os_log_impl(&dword_18ECEB000, v14, OS_LOG_TYPE_INFO, "All subscribers %@", buf, 0xCu);
    }

    v19 = v4;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v15 = v13;
    uint64_t v16 = [(_CDXPCEventPublisher *)v15 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v15);
          }
          -[_CDXPCEventPublisher sendEvent:toSubscriber:handler:](self->_interactionRecordedEventPublisher, "sendEvent:toSubscriber:handler:", v10);
        }
        uint64_t v16 = [(_CDXPCEventPublisher *)v15 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v16);
    }

    v4 = v19;
    objc_sync_exit(v12);
  }
}

- (_CDInteractionStoreNotifier)init
{
  v39.receiver = self;
  v39.super_class = (Class)_CDInteractionStoreNotifier;
  v2 = [(_CDInteractionStoreNotifier *)&v39 init];
  if (v2)
  {
    if (notify_register_check((const char *)[@"PSStoreChangedNotificationInternal" UTF8String], &v2->_notifierToken))
    {
      v3 = +[_CDLogging interactionChannel];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        [(_CDInteractionStoreNotifier *)v3 init];
      }
    }
    id v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    id v12 = objc_claimAutoreleasedReturnValue();
    v13 = (const char *)[v12 UTF8String];
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create(v13, v14);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v15;

    LODWORD(v13) = getuid();
    v2->_isRootProcess = v13 == 0;
    uint64_t v17 = +[_CDLogging interactionChannel];
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v18)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_18ECEB000, v17, OS_LOG_TYPE_DEFAULT, "Setting up interaction XPC event handler", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, v2);
      v19 = v2->_queue;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __35___CDInteractionStoreNotifier_init__block_invoke;
      handler[3] = &unk_1E560F848;
      objc_copyWeak(&v37, buf);
      xpc_set_event_stream_handler("com.apple.coreduetinteraction.interaction-recorded", v19, handler);
      long long v20 = v2->_queue;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __35___CDInteractionStoreNotifier_init__block_invoke_2;
      v34[3] = &unk_1E560F848;
      objc_copyWeak(&v35, buf);
      xpc_set_event_stream_handler("com.apple.coreduetinteraction.interaction-deleted", v20, v34);
      objc_destroyWeak(&v35);
      objc_destroyWeak(&v37);
      objc_destroyWeak(buf);
    }
    else
    {
      if (v18)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_18ECEB000, v17, OS_LOG_TYPE_DEFAULT, "Setting up interaction XPC event publisher", (uint8_t *)buf, 2u);
      }

      long long v21 = v2->_queue;
      long long v22 = +[_CDLogging interactionChannel];
      uint64_t v23 = +[_CDXPCEventPublisher eventPublisherWithStreamName:"com.apple.coreduetinteraction.interaction-recorded" delegate:v2 queue:v21 log:v22];
      interactionRecordedEventPublisher = v2->_interactionRecordedEventPublisher;
      v2->_interactionRecordedEventPublisher = (_CDXPCEventPublisher *)v23;

      v25 = v2->_queue;
      v26 = +[_CDLogging interactionChannel];
      uint64_t v27 = +[_CDXPCEventPublisher eventPublisherWithStreamName:"com.apple.coreduetinteraction.interaction-deleted" delegate:v2 queue:v25 log:v26];
      interactionDeletedEventPublisher = v2->_interactionDeletedEventPublisher;
      v2->_interactionDeletedEventPublisher = (_CDXPCEventPublisher *)v27;

      uint64_t v29 = objc_opt_new();
      interactionStoreRecordedEventSubscribersByToken = v2->_interactionStoreRecordedEventSubscribersByToken;
      v2->_interactionStoreRecordedEventSubscribersByToken = (NSMutableDictionary *)v29;

      uint64_t v31 = objc_opt_new();
      interactionStoreDeletedEventSubscribersByToken = v2->_interactionStoreDeletedEventSubscribersByToken;
      v2->_interactionStoreDeletedEventSubscribersByToken = (NSMutableDictionary *)v31;
    }
  }
  return v2;
}

- (void)dealloc
{
  int notifierToken = self->_notifierToken;
  if (notifierToken) {
    notify_cancel(notifierToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)_CDInteractionStoreNotifier;
  [(_CDInteractionStoreNotifier *)&v4 dealloc];
}

- (void)postPackedMechanisms:(unint64_t)a3
{
  if (notify_set_state(self->_notifierToken, a3))
  {
    v3 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[_CDInteractionStoreNotifier postPackedMechanisms:](v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  notify_post((const char *)[@"PSStoreChangedNotificationInternal" UTF8String]);
}

- (id)filterInteractionsForUser:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_isRootProcess)
  {
    id v6 = v4;
  }
  else
  {
    objc_msgSend(v4, "_pas_filteredArrayWithTest:", &__block_literal_global_33);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v7 = v6;

  return v7;
}

- (void)recorded:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40___CDInteractionStoreNotifier_recorded___block_invoke;
  v11[3] = &unk_1E560D848;
  id v12 = v4;
  v13 = self;
  id v6 = v11;
  uint64_t v7 = queue;
  id v8 = v4;
  uint64_t v9 = (void *)os_transaction_create();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_7;
  block[3] = &unk_1E560D978;
  id v15 = v9;
  id v16 = v6;
  id v10 = v9;
  dispatch_async(v7, block);
}

- (void)deleted:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __39___CDInteractionStoreNotifier_deleted___block_invoke;
  v11[3] = &unk_1E560D848;
  id v12 = v4;
  v13 = self;
  id v6 = v11;
  uint64_t v7 = queue;
  id v8 = v4;
  uint64_t v9 = (void *)os_transaction_create();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_7;
  block[3] = &unk_1E560D978;
  id v15 = v9;
  id v16 = v6;
  id v10 = v9;
  dispatch_async(v7, block);
}

- (void)deleteAll
{
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"_CDInteractionStoreDeleteAllInteractionsNotification" object:0 userInfo:0];

  id v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 postNotificationName:@"_CDInteractionStoreDeleteAllInteractionsNotification" object:0 userInfo:0];
}

- (void)suspend
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38___CDInteractionStoreNotifier_suspend__block_invoke;
  block[3] = &unk_1E560D578;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)resume
{
}

- (void)addSubscriber:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18ECEB000, v5, OS_LOG_TYPE_DEFAULT, "Adding subscriber", buf, 2u);
  }

  id v6 = [v4 streamName];
  uint64_t v7 = [v4 token];
  id v8 = [NSString stringWithUTF8String:"com.apple.coreduetinteraction.interaction-recorded"];
  int v9 = [v8 isEqualToString:v6];

  if (v9)
  {
    id v10 = self->_interactionStoreRecordedEventSubscribersByToken;
    objc_sync_enter(v10);
    interactionStoreRecordedEventSubscribersByToken = self->_interactionStoreRecordedEventSubscribersByToken;
    id v12 = [NSNumber numberWithUnsignedLongLong:v7];
    [(NSMutableDictionary *)interactionStoreRecordedEventSubscribersByToken setObject:v4 forKeyedSubscript:v12];

    v13 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = 0;
      v14 = "Successfully added subscriber for interaction recording";
      id v15 = (uint8_t *)&v21;
LABEL_9:
      _os_log_impl(&dword_18ECEB000, v13, OS_LOG_TYPE_DEFAULT, v14, v15, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  id v16 = [NSString stringWithUTF8String:"com.apple.coreduetinteraction.interaction-deleted"];
  int v17 = [v16 isEqualToString:v6];

  if (v17)
  {
    id v10 = self->_interactionStoreDeletedEventSubscribersByToken;
    objc_sync_enter(v10);
    interactionStoreDeletedEventSubscribersByToken = self->_interactionStoreDeletedEventSubscribersByToken;
    v19 = [NSNumber numberWithUnsignedLongLong:v7];
    [(NSMutableDictionary *)interactionStoreDeletedEventSubscribersByToken setObject:v4 forKeyedSubscript:v19];

    v13 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v20 = 0;
      v14 = "Successfully added subscriber for interaction deletions";
      id v15 = (uint8_t *)&v20;
      goto LABEL_9;
    }
LABEL_10:

    objc_sync_exit(v10);
    goto LABEL_13;
  }
  id v10 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(&v10->super.super, OS_LOG_TYPE_ERROR)) {
    -[_CDInteractionStoreNotifier addSubscriber:]((uint64_t)v6, &v10->super.super);
  }
LABEL_13:
}

- (void)handleXPCNotificationEvent:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18ECEB000, v5, OS_LOG_TYPE_DEFAULT, "Handling notification event", buf, 2u);
  }

  id v13 = 0;
  id v14 = 0;
  id v12 = 0;
  BOOL v6 = +[_CDXPCCodecs parseNotificationEvent:v4 registrationIdentifier:&v14 info:&v13 error:&v12];

  id v7 = v14;
  id v8 = v13;
  id v9 = v12;
  id v10 = +[_CDLogging interactionChannel];
  id v11 = v10;
  if (!v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[_CDInteractionStoreNotifier handleXPCNotificationEvent:]((uint64_t)v7);
    }
    goto LABEL_12;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412547;
    id v16 = v7;
    __int16 v17 = 2113;
    id v18 = v8;
    _os_log_impl(&dword_18ECEB000, v11, OS_LOG_TYPE_DEFAULT, "Received XPC notification event for registration %@: %{private}@", buf, 0x16u);
  }

  if ([@"_CDInteractionStoreRecordedInteractionsNotification" isEqualToString:v7])
  {
    id v11 = [v8 objectForKeyedSubscript:@"_CDInteractionsKey"];
    [(_CDInteractionStoreNotifier *)self recorded:v11];
LABEL_12:

    goto LABEL_13;
  }
  if ([@"_CDInteractionStoreDeletedInteractionsNotification" isEqualToString:v7])
  {
    id v11 = [v8 objectForKeyedSubscript:@"_CDInteractionsKey"];
    [(_CDInteractionStoreNotifier *)self deleted:v11];
    goto LABEL_12;
  }
LABEL_13:
}

- (void)publishDeletedXPCEvent:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = (_CDXPCEventPublisher *)a3;
  uint64_t v5 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138739971;
    uint64_t v29 = v4;
    _os_log_impl(&dword_18ECEB000, v5, OS_LOG_TYPE_INFO, "Publishing deleted XPC event with interactions %{sensitive}@", buf, 0xCu);
  }

  BOOL v6 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    interactionDeletedEventPublisher = self->_interactionDeletedEventPublisher;
    *(_DWORD *)buf = 138412290;
    uint64_t v29 = interactionDeletedEventPublisher;
    _os_log_impl(&dword_18ECEB000, v6, OS_LOG_TYPE_INFO, "_interactionDeletedEventPublisher %@", buf, 0xCu);
  }

  if (self->_interactionDeletedEventPublisher)
  {
    if (v4) {
      id v8 = v4;
    }
    else {
      id v8 = (_CDXPCEventPublisher *)MEMORY[0x1E4F1CBF0];
    }
    v26 = @"_CDInteractionsKey";
    uint64_t v27 = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    id v24 = 0;
    id v10 = +[_CDXPCCodecs notificationEventWithRegistrationIdentifier:@"_CDInteractionStoreDeletedInteractionsNotification" info:v9 error:&v24];
    id v11 = v24;

    id v12 = self->_interactionStoreDeletedEventSubscribersByToken;
    objc_sync_enter(v12);
    id v13 = [(NSMutableDictionary *)self->_interactionStoreDeletedEventSubscribersByToken allValues];
    id v14 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v29 = v13;
      _os_log_impl(&dword_18ECEB000, v14, OS_LOG_TYPE_INFO, "All subscribers %@", buf, 0xCu);
    }

    uint64_t v19 = v4;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v15 = v13;
    uint64_t v16 = [(_CDXPCEventPublisher *)v15 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v15);
          }
          -[_CDXPCEventPublisher sendEvent:toSubscriber:handler:](self->_interactionDeletedEventPublisher, "sendEvent:toSubscriber:handler:", v10);
        }
        uint64_t v16 = [(_CDXPCEventPublisher *)v15 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v16);
    }

    id v4 = v19;
    objc_sync_exit(v12);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionStoreDeletedEventSubscribersByToken, 0);
  objc_storeStrong((id *)&self->_interactionStoreRecordedEventSubscribersByToken, 0);
  objc_storeStrong((id *)&self->_interactionDeletedEventPublisher, 0);
  objc_storeStrong((id *)&self->_interactionRecordedEventPublisher, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)init
{
}

- (void)postPackedMechanisms:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addSubscriber:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "Unknown event stream name adding subscriber: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)removeSubscriberWithToken:(uint64_t)a1 streamName:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "Unknown event stream name removing subscriber: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)handleXPCNotificationEvent:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_5(&dword_18ECEB000, v1, v2, "Failed to parse notification event for registration %@: %@", (void)v3, DWORD2(v3));
}

@end