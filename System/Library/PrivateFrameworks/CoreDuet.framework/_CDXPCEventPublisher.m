@interface _CDXPCEventPublisher
+ (_CDXPCEventPublisher)eventPublisherWithStreamName:(const char *)a3 delegate:(id)a4 queue:(id)a5 log:(id)a6;
+ (_CDXPCEventPublisher)eventPublisherWithStreamName:(const char *)a3 delegate:(id)a4 queue:(id)a5 log:(id)a6 os_variant_diagnostic_subsystem:(const char *)a7;
- (NSMutableArray)pendingSendEvents;
- (NSString)streamName;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (OS_xpc_event_publisher)publisher;
- (_CDXPCEventPublisher)initWithStreamName:(id)a3 delegate:(id)a4 queue:(id)a5 log:(id)a6 os_variant_diagnostic_subsystem:(const char *)a7;
- (_CDXPCEventPublisherDelegate)delegate;
- (const)os_variant_diagnostic_subsystem;
- (void)activatePublisherWithStreamName:(const char *)a3;
- (void)addToken:(unint64_t)a3 descriptor:(id)a4 userID:(unsigned int)a5;
- (void)handleEventWithAction:(unsigned int)a3 token:(unint64_t)a4 descriptor:(id)a5;
- (void)removeToken:(unint64_t)a3;
- (void)sendEvent:(id)a3 toSubscriber:(id)a4 handler:(id)a5;
- (void)sendEvent:(id)a3 toSubscriber:(id)a4 replyHandler:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setLog:(id)a3;
- (void)setOs_variant_diagnostic_subsystem:(const char *)a3;
- (void)setPendingSendEvents:(id)a3;
- (void)setPublisher:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStreamName:(id)a3;
@end

@implementation _CDXPCEventPublisher

- (void)sendEvent:(id)a3 toSubscriber:(id)a4 handler:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  if (v11->_pendingSendEvents)
  {
    v12 = v11->_log;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = +[_CDXPCCodecs messageTypeFromEvent:v8];
      v14 = (void *)v13;
      v15 = @"unknown";
      if (v13) {
        v15 = (__CFString *)v13;
      }
      *(_DWORD *)buf = 138412290;
      v36 = v15;
      _os_log_impl(&dword_18ECEB000, v12, OS_LOG_TYPE_INFO, "Pending %@ sendEvent until barrier is received.", buf, 0xCu);
    }
    objc_initWeak((id *)buf, v11);
    pendingSendEvents = v11->_pendingSendEvents;
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __55___CDXPCEventPublisher_sendEvent_toSubscriber_handler___block_invoke;
    v30 = &unk_1E560D6E0;
    objc_copyWeak(&v34, (id *)buf);
    id v31 = v8;
    id v32 = v9;
    id v33 = v10;
    v17 = (void *)MEMORY[0x192FB31A0](&v27);
    -[NSMutableArray addObject:](pendingSendEvents, "addObject:", v17, v27, v28, v29, v30);

    objc_destroyWeak(&v34);
    objc_destroyWeak((id *)buf);
    objc_sync_exit(v11);
  }
  else
  {
    objc_sync_exit(v11);

    if (os_log_type_enabled((os_log_t)v11->_log, OS_LOG_TYPE_DEBUG))
    {
      if (os_variant_has_internal_diagnostics())
      {
        v18 = (void *)MEMORY[0x192FB36A0](v8);
        log = v11->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
        {
          streamName = v11->_streamName;
          v24 = log;
          *(_DWORD *)buf = 138544130;
          v36 = (__CFString *)streamName;
          __int16 v37 = 2114;
          id v38 = v9;
          __int16 v39 = 1024;
          int count = xpc_dictionary_get_count(v8);
          __int16 v41 = 2080;
          v42 = v18;
          _os_log_debug_impl(&dword_18ECEB000, v24, OS_LOG_TYPE_DEBUG, "Sending event on stream %{public}@ to subscriber %{public}@ with %d keys: %s", buf, 0x26u);
        }
        if (v18) {
          free(v18);
        }
      }
      else
      {
        v20 = v11->_log;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v25 = v11->_streamName;
          v26 = v20;
          *(_DWORD *)buf = 138543874;
          v36 = (__CFString *)v25;
          __int16 v37 = 2114;
          id v38 = v9;
          __int16 v39 = 1024;
          int count = xpc_dictionary_get_count(v8);
          _os_log_debug_impl(&dword_18ECEB000, v26, OS_LOG_TYPE_DEBUG, "Sending event on stream %{public}@ to subscriber %{public}@ with %d keys", buf, 0x1Cu);
        }
      }
    }
    [v9 token];
    if (xpc_event_publisher_fire())
    {
      v21 = v11->_log;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[_CDXPCEventPublisher sendEvent:toSubscriber:handler:]((uint64_t)v11, v21);
      }
      v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreduetd" code:3 userInfo:0];
      (*((void (**)(id, void *))v10 + 2))(v10, v22);
    }
    else
    {
      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }
}

- (void)handleEventWithAction:(unsigned int)a3 token:(unint64_t)a4 descriptor:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    if (v8)
    {
      id v10 = (void *)MEMORY[0x192FB36A0](v8);
      v11 = self->_log;
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        if (!v10) {
          goto LABEL_7;
        }
        goto LABEL_5;
      }
      streamName = self->_streamName;
      *(_DWORD *)buf = 138544130;
      id v33 = streamName;
      __int16 v34 = 1024;
      *(_DWORD *)v35 = a3;
      *(_WORD *)&v35[4] = 2048;
      *(void *)&v35[6] = a4;
      *(_WORD *)&v35[14] = 2080;
      *(void *)&v35[16] = v10;
      _os_log_debug_impl(&dword_18ECEB000, v11, OS_LOG_TYPE_DEBUG, "Publisher for stream %{public}@ received xpc event with action %d and token %llu: %s", buf, 0x26u);
      if (v10) {
LABEL_5:
      }
        free(v10);
    }
    else
    {
      v26 = self->_streamName;
      *(_DWORD *)buf = 138543874;
      id v33 = v26;
      __int16 v34 = 1024;
      *(_DWORD *)v35 = a3;
      *(_WORD *)&v35[4] = 2048;
      *(void *)&v35[6] = a4;
      _os_log_debug_impl(&dword_18ECEB000, log, OS_LOG_TYPE_DEBUG, "Publisher for stream %{public}@ received xpc event with action %d and token %llu", buf, 0x1Cu);
    }
  }
LABEL_7:
  if (a3)
  {
    if (a3 == 1)
    {
      v23 = self->_log;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[_CDXPCEventPublisher handleEventWithAction:token:descriptor:]((uint64_t)self, a4, v23);
      }
      [(_CDXPCEventPublisher *)self removeToken:a4];
    }
    else if (a3 == 2)
    {
      v12 = self->_log;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[_CDXPCEventPublisher handleEventWithAction:token:descriptor:]((uint64_t)self, v12);
      }
      uint64_t v13 = self;
      objc_sync_enter(v13);
      pendingSendEvents = v13->_pendingSendEvents;
      if (pendingSendEvents)
      {
        v15 = pendingSendEvents;
        v16 = v13->_pendingSendEvents;
        v13->_pendingSendEvents = 0;

        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        v17 = v15;
        uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v28 != v19) {
                objc_enumerationMutation(v17);
              }
              (*(void (**)(void))(*(void *)(*((void *)&v27 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v27 + 1) + 8 * i));
            }
            uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
          }
          while (v18);
        }
      }
      objc_sync_exit(v13);
    }
  }
  else
  {
    uint64_t v21 = getuid();
    v22 = self->_log;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v25 = self->_streamName;
      *(_DWORD *)buf = 138543874;
      id v33 = v25;
      __int16 v34 = 2048;
      *(void *)v35 = v21;
      *(_WORD *)&v35[8] = 2048;
      *(void *)&v35[10] = a4;
      _os_log_debug_impl(&dword_18ECEB000, v22, OS_LOG_TYPE_DEBUG, "Publisher for stream %{public}@ received new subscription for uid %lld with token %llu", buf, 0x20u);
    }
    [(_CDXPCEventPublisher *)self addToken:a4 descriptor:v8 userID:v21];
  }
}

+ (_CDXPCEventPublisher)eventPublisherWithStreamName:(const char *)a3 delegate:(id)a4 queue:(id)a5 log:(id)a6 os_variant_diagnostic_subsystem:(const char *)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = objc_alloc((Class)objc_opt_class());
  v15 = [NSString stringWithUTF8String:a3];
  v16 = objc_msgSend(v14, "initWithStreamName:delegate:queue:log:os_variant_diagnostic_subsystem:", v15, v13, v12, v11, a7);

  [v16 activatePublisherWithStreamName:a3];
  return (_CDXPCEventPublisher *)v16;
}

+ (_CDXPCEventPublisher)eventPublisherWithStreamName:(const char *)a3 delegate:(id)a4 queue:(id)a5 log:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = objc_alloc((Class)objc_opt_class());
  id v13 = [NSString stringWithUTF8String:a3];
  id v14 = objc_msgSend(v12, "initWithStreamName:delegate:queue:log:os_variant_diagnostic_subsystem:", v13, v11, v10, v9, 0);

  [v14 activatePublisherWithStreamName:a3];
  return (_CDXPCEventPublisher *)v14;
}

- (_CDXPCEventPublisher)initWithStreamName:(id)a3 delegate:(id)a4 queue:(id)a5 log:(id)a6 os_variant_diagnostic_subsystem:(const char *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v22.receiver = self;
  v22.super_class = (Class)_CDXPCEventPublisher;
  v17 = [(_CDXPCEventPublisher *)&v22 init];
  if (v17)
  {
    uint64_t v18 = objc_opt_new();
    pendingSendEvents = v17->_pendingSendEvents;
    v17->_pendingSendEvents = (NSMutableArray *)v18;

    objc_storeStrong((id *)&v17->_streamName, a3);
    objc_storeStrong((id *)&v17->_delegate, a4);
    objc_storeStrong((id *)&v17->_queue, a5);
    objc_storeStrong((id *)&v17->_log, a6);
    v20 = "com.apple.CoreDuet";
    if (!a7) {
      v20 = 0;
    }
    v17->_os_variant_diagnostic_subsystem = v20;
  }

  return v17;
}

- (void)activatePublisherWithStreamName:(const char *)a3
{
  xpc_event_publisher_create();
  v5 = (OS_xpc_event_publisher *)objc_claimAutoreleasedReturnValue();
  publisher = self->_publisher;
  self->_publisher = v5;

  if (self->_publisher)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56___CDXPCEventPublisher_activatePublisherWithStreamName___block_invoke;
    v9[3] = &unk_1E560FEA0;
    objc_copyWeak(&v10, &location);
    v7 = (void *)MEMORY[0x192FB31A0](v9);
    xpc_event_publisher_set_handler();
    xpc_event_publisher_set_error_handler();
    xpc_event_publisher_activate();

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[_CDXPCEventPublisher activatePublisherWithStreamName:]((uint64_t)a3, log);
    }
  }
}

- (void)sendEvent:(id)a3 toSubscriber:(id)a4 replyHandler:(id)a5
{
  v42[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  objc_sync_enter(v11);
  if (v11->_pendingSendEvents)
  {
    id v12 = v11->_log;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = +[_CDXPCCodecs messageTypeFromEvent:v8];
      id v14 = (void *)v13;
      id v15 = @"unknown";
      if (v13) {
        id v15 = (__CFString *)v13;
      }
      *(_DWORD *)buf = 138412290;
      id v38 = v15;
      _os_log_impl(&dword_18ECEB000, v12, OS_LOG_TYPE_DEFAULT, "Pending %@ sendEvent until barrier is received.", buf, 0xCu);
    }
    objc_initWeak((id *)buf, v11);
    pendingSendEvents = v11->_pendingSendEvents;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __60___CDXPCEventPublisher_sendEvent_toSubscriber_replyHandler___block_invoke;
    v32[3] = &unk_1E560D6E0;
    objc_copyWeak(&v36, (id *)buf);
    id v33 = v8;
    id v34 = v9;
    id v35 = v10;
    v17 = (void *)MEMORY[0x192FB31A0](v32);
    [(NSMutableArray *)pendingSendEvents addObject:v17];

    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)buf);
    objc_sync_exit(v11);
  }
  else
  {
    objc_sync_exit(v11);

    if (os_log_type_enabled((os_log_t)v11->_log, OS_LOG_TYPE_DEBUG))
    {
      if (os_variant_has_internal_diagnostics())
      {
        uint64_t v18 = (void *)MEMORY[0x192FB36A0](v8);
        log = v11->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
        {
          streamName = v11->_streamName;
          long long v29 = log;
          *(_DWORD *)buf = 138544130;
          id v38 = (__CFString *)streamName;
          __int16 v39 = 2114;
          id v40 = v9;
          __int16 v41 = 1024;
          LODWORD(v42[0]) = xpc_dictionary_get_count(v8);
          WORD2(v42[0]) = 2080;
          *(void *)((char *)v42 + 6) = v18;
          _os_log_debug_impl(&dword_18ECEB000, v29, OS_LOG_TYPE_DEBUG, "Sending event on stream %{public}@ to subscriber %{public}@ with %d keys: %s", buf, 0x26u);
        }
        if (v18) {
          free(v18);
        }
      }
      else
      {
        v20 = v11->_log;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          long long v30 = v11->_streamName;
          id v31 = v20;
          *(_DWORD *)buf = 138543874;
          id v38 = (__CFString *)v30;
          __int16 v39 = 2114;
          id v40 = v9;
          __int16 v41 = 1024;
          LODWORD(v42[0]) = xpc_dictionary_get_count(v8);
          _os_log_debug_impl(&dword_18ECEB000, v31, OS_LOG_TYPE_DEBUG, "Sending event on stream %{public}@ to subscriber %{public}@ with %d keys", buf, 0x1Cu);
        }
      }
    }
    [v9 token];
    id v21 = v9;
    objc_super v22 = (void (**)(id, void, void *))v10;
    if (xpc_event_publisher_fire_with_reply())
    {
      v23 = v11->_log;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v25 = v11->_streamName;
        v26 = v23;
        uint64_t v27 = xpc_strerror();
        *(_DWORD *)buf = 138543874;
        id v38 = (__CFString *)v25;
        __int16 v39 = 2112;
        id v40 = v21;
        __int16 v41 = 2080;
        v42[0] = v27;
        _os_log_error_impl(&dword_18ECEB000, v26, OS_LOG_TYPE_ERROR, "Failed to send event on stream %{public}@ to subscriber %@: %s", buf, 0x20u);
      }
      v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreduetd" code:3 userInfo:0];
      v22[2](v22, 0, v24);
    }
  }
}

- (void)addToken:(unint64_t)a3 descriptor:(id)a4 userID:(unsigned int)a5
{
  if (self->_delegate)
  {
    uint64_t v5 = *(void *)&a5;
    id v8 = a4;
    id v9 = [[_CDXPCEventSubscriber alloc] initWithToken:a3 descriptor:v8 userID:v5 streamName:self->_streamName];

    queue = self->_queue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51___CDXPCEventPublisher_addToken_descriptor_userID___block_invoke;
    v12[3] = &unk_1E560D848;
    v12[4] = self;
    uint64_t v13 = v9;
    id v11 = v9;
    dispatch_async(queue, v12);
  }
}

- (void)removeToken:(unint64_t)a3
{
  if (self->_delegate)
  {
    queue = self->_queue;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __36___CDXPCEventPublisher_removeToken___block_invoke;
    v4[3] = &unk_1E560EC00;
    v4[4] = self;
    v4[5] = a3;
    dispatch_async(queue, v4);
  }
}

- (OS_xpc_event_publisher)publisher
{
  return self->_publisher;
}

- (void)setPublisher:(id)a3
{
}

- (NSString)streamName
{
  return self->_streamName;
}

- (void)setStreamName:(id)a3
{
}

- (_CDXPCEventPublisherDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (const)os_variant_diagnostic_subsystem
{
  return self->_os_variant_diagnostic_subsystem;
}

- (void)setOs_variant_diagnostic_subsystem:(const char *)a3
{
  self->_os_variant_diagnostic_subsystem = a3;
}

- (NSMutableArray)pendingSendEvents
{
  return self->_pendingSendEvents;
}

- (void)setPendingSendEvents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingSendEvents, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_streamName, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
}

- (void)activatePublisherWithStreamName:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136446210;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "Failed to create publisher for stream %{public}s", (uint8_t *)&v2, 0xCu);
}

- (void)handleEventWithAction:(uint64_t)a1 token:(NSObject *)a2 descriptor:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_DEBUG, "Publisher for stream %{public}@ received initial barrier", (uint8_t *)&v3, 0xCu);
}

- (void)handleEventWithAction:(uint64_t)a1 token:(uint64_t)a2 descriptor:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 16);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_18ECEB000, log, OS_LOG_TYPE_DEBUG, "Publisher for stream %{public}@ removing subscription with token %llu", (uint8_t *)&v4, 0x16u);
}

- (void)sendEvent:(uint64_t)a1 toSubscriber:(void *)a2 handler:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a2;
  xpc_strerror();
  OUTLINED_FUNCTION_0_11();
  _os_log_error_impl(&dword_18ECEB000, v2, OS_LOG_TYPE_ERROR, "Failed to send event to stream %{public}@: %s", v3, 0x16u);
}

@end