@interface _CDReceiverNotifier
+ (id)sharedInstance;
- (_CDReceiverNotifier)init;
- (void)_publishXPCEvent:(id)a3 uid:(unsigned int)a4;
- (void)addSubscriber:(id)a3;
- (void)handleXPCNotificationEvent:(id)a3;
- (void)publishXPCEventForAppIntents:(id)a3 appActivities:(id)a4 uid:(unsigned int)a5;
- (void)publishXPCEventForDeletedIntentGroupIdentifiers:(id)a3 bundleID:(id)a4 uid:(unsigned int)a5;
- (void)publishXPCEventForDeletedIntentIdentifiers:(id)a3 bundleID:(id)a4 uid:(unsigned int)a5;
- (void)removeSubscriberWithToken:(unint64_t)a3 streamName:(id)a4;
@end

@implementation _CDReceiverNotifier

- (_CDReceiverNotifier)init
{
  v32.receiver = self;
  v32.super_class = (Class)_CDReceiverNotifier;
  v2 = [(_CDReceiverNotifier *)&v32 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    id v4 = objc_claimAutoreleasedReturnValue();
    v5 = (const char *)[v4 UTF8String];
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create(v5, v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    LODWORD(v5) = getuid();
    v2->_isRootProcess = v5 == 0;
    v9 = _logChannel();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v10)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_18ECEB000, v9, OS_LOG_TYPE_DEFAULT, "Setting up AppIntent/AppActivity XPC event handler", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, v2);
      v11 = v2->_queue;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __27___CDReceiverNotifier_init__block_invoke;
      handler[3] = &unk_1E560F848;
      objc_copyWeak(&v30, buf);
      xpc_set_event_stream_handler("com.apple.coreduet.xpc.receiver", v11, handler);
      v12 = BiomeLibrary();
      v13 = [v12 App];
      v14 = [v13 Intent];
      uint64_t v15 = [v14 source];
      intentSource = v2->_intentSource;
      v2->_intentSource = (BMSource *)v15;

      v17 = BiomeLibrary();
      v18 = [v17 App];
      v19 = [v18 Activity];
      uint64_t v20 = [v19 source];
      activitySource = v2->_activitySource;
      v2->_activitySource = (BMSource *)v20;

      objc_destroyWeak(&v30);
      objc_destroyWeak(buf);
    }
    else
    {
      if (v10)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_18ECEB000, v9, OS_LOG_TYPE_DEFAULT, "Setting up AppIntent/AppActivity XPC event publisher", (uint8_t *)buf, 2u);
      }

      v22 = v2->_queue;
      v23 = _logChannel();
      uint64_t v24 = +[_CDXPCEventPublisher eventPublisherWithStreamName:"com.apple.coreduet.xpc.receiver" delegate:v2 queue:v22 log:v23];
      xpcPublisher = v2->_xpcPublisher;
      v2->_xpcPublisher = (_CDXPCEventPublisher *)v24;

      uint64_t v26 = objc_opt_new();
      subscribers = v2->_subscribers;
      v2->_subscribers = (NSMutableDictionary *)v26;
    }
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6, &__block_literal_global_46);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_1;
  return v2;
}

- (void)publishXPCEventForAppIntents:(id)a3 appActivities:(id)a4 uid:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = _logChannel();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138478339;
    id v43 = v8;
    __int16 v44 = 2113;
    id v45 = v9;
    __int16 v46 = 1024;
    int v47 = v5;
    _os_log_debug_impl(&dword_18ECEB000, v10, OS_LOG_TYPE_DEBUG, "Publishing XPC event with AppIntents: %{private}@; AppActivities: %{private}@; uid: %d",
      buf,
      0x1Cu);
  }

  v11 = objc_opt_new();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v41 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v35;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [*(id *)(*((void *)&v34 + 1) + 8 * v16) serialize];
        [v11 addObject:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v41 count:16];
    }
    while (v14);
  }

  v18 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v19 = v9;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v31;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = [*(id *)(*((void *)&v30 + 1) + 8 * v23) serialize];
        [v18 addObject:v24];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v21);
  }

  v38[0] = @"_CDAppIntentsKey";
  v38[1] = @"_CDAppActivitiesKey";
  v39[0] = v11;
  v39[1] = v18;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
  id v29 = 0;
  uint64_t v26 = +[_CDXPCCodecs notificationEventWithRegistrationIdentifier:@"_CDAppIntentNotification" info:v25 error:&v29];
  id v27 = v29;

  if (!v26 || v27)
  {
    v28 = _logChannel();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[_CDReceiverNotifier publishXPCEventForAppIntents:appActivities:uid:]();
    }
  }
  else
  {
    [(_CDReceiverNotifier *)self _publishXPCEvent:v26 uid:v5];
  }
}

- (void)publishXPCEventForDeletedIntentIdentifiers:(id)a3 bundleID:(id)a4 uid:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = _logChannel();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138478339;
    id v19 = v8;
    __int16 v20 = 2113;
    id v21 = v9;
    __int16 v22 = 1024;
    int v23 = v5;
    _os_log_debug_impl(&dword_18ECEB000, v10, OS_LOG_TYPE_DEBUG, "Publishing XPC event with deleted intent identifiers: %{private}@; bundleID: %{private}@; uid: %d",
      buf,
      0x1Cu);
  }

  v16[0] = @"_CDAppIntentsDeletedIdentifiersKey";
  v16[1] = @"_CDAppIntentsBundleIDKey";
  v17[0] = v8;
  v17[1] = v9;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  id v15 = 0;
  id v12 = +[_CDXPCCodecs notificationEventWithRegistrationIdentifier:@"_CDAppIntentNotification" info:v11 error:&v15];
  id v13 = v15;

  if (!v12 || v13)
  {
    uint64_t v14 = _logChannel();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[_CDReceiverNotifier publishXPCEventForDeletedIntentIdentifiers:bundleID:uid:]();
    }
  }
  else
  {
    [(_CDReceiverNotifier *)self _publishXPCEvent:v12 uid:v5];
  }
}

- (void)publishXPCEventForDeletedIntentGroupIdentifiers:(id)a3 bundleID:(id)a4 uid:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = _logChannel();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138478339;
    id v19 = v8;
    __int16 v20 = 2113;
    id v21 = v9;
    __int16 v22 = 1024;
    int v23 = v5;
    _os_log_debug_impl(&dword_18ECEB000, v10, OS_LOG_TYPE_DEBUG, "Publishing XPC event with deleted intent group identifiers: %{private}@; bundleID: %{private}@; uid: %d",
      buf,
      0x1Cu);
  }

  v16[0] = @"_CDAppIntentsDeletedGroupIdentifiersKey";
  v16[1] = @"_CDAppIntentsBundleIDKey";
  v17[0] = v8;
  v17[1] = v9;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  id v15 = 0;
  id v12 = +[_CDXPCCodecs notificationEventWithRegistrationIdentifier:@"_CDAppIntentNotification" info:v11 error:&v15];
  id v13 = v15;

  if (!v12 || v13)
  {
    uint64_t v14 = _logChannel();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[_CDReceiverNotifier publishXPCEventForDeletedIntentGroupIdentifiers:bundleID:uid:]();
    }
  }
  else
  {
    [(_CDReceiverNotifier *)self _publishXPCEvent:v12 uid:v5];
  }
}

- (void)_publishXPCEvent:(id)a3 uid:(unsigned int)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  obj = self->_subscribers;
  objc_sync_enter(obj);
  v6 = [(NSMutableDictionary *)self->_subscribers allValues];
  dispatch_queue_t v7 = _logChannel();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[_CDReceiverNotifier _publishXPCEvent:uid:]();
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v12 uid] == a4)
        {
          xpcPublisher = self->_xpcPublisher;
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          void v16[2] = __44___CDReceiverNotifier__publishXPCEvent_uid___block_invoke;
          v16[3] = &unk_1E560D730;
          v16[4] = v12;
          [(_CDXPCEventPublisher *)xpcPublisher sendEvent:v15 toSubscriber:v12 handler:v16];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  objc_sync_exit(obj);
}

- (void)handleXPCNotificationEvent:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _logChannel();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_CDReceiverNotifier handleXPCNotificationEvent:].cold.8(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  id v68 = 0;
  id v69 = 0;
  id v67 = 0;
  BOOL v13 = +[_CDXPCCodecs parseNotificationEvent:v4 registrationIdentifier:&v69 info:&v68 error:&v67];
  id v14 = v69;
  id v15 = v68;
  id v16 = v67;
  long long v17 = _logChannel();
  long long v18 = v17;
  if (!v13)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[_CDReceiverNotifier handleXPCNotificationEvent:].cold.7();
    }
    goto LABEL_42;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[_CDReceiverNotifier handleXPCNotificationEvent:].cold.6();
  }

  long long v19 = [v15 objectForKeyedSubscript:@"_CDAppIntentsKey"];
  if (v19)
  {
  }
  else
  {
    long long v20 = [v15 objectForKeyedSubscript:@"_CDAppActivitiesKey"];

    if (!v20)
    {
      v50 = [v15 objectForKeyedSubscript:@"_CDAppIntentsDeletedIdentifiersKey"];

      if (v50)
      {
        long long v18 = [v15 objectForKeyedSubscript:@"_CDAppIntentsDeletedIdentifiersKey"];
        v51 = [v15 objectForKeyedSubscript:@"_CDAppIntentsBundleIDKey"];
        v52 = _logChannel();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
          -[_CDReceiverNotifier handleXPCNotificationEvent:]();
        }

        [getBMLibraryStreamsPrunerClass() pruneWithDeletedIntentIdentifiers:v18 bundleId:v51];
      }
      else
      {
        v53 = [v15 objectForKeyedSubscript:@"_CDAppIntentsDeletedGroupIdentifiersKey"];

        if (!v53)
        {
          long long v18 = _logChannel();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            -[_CDReceiverNotifier handleXPCNotificationEvent:]();
          }
          goto LABEL_42;
        }
        long long v18 = [v15 objectForKeyedSubscript:@"_CDAppIntentsDeletedGroupIdentifiersKey"];
        v51 = [v15 objectForKeyedSubscript:@"_CDAppIntentsBundleIDKey"];
        v54 = _logChannel();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
          -[_CDReceiverNotifier handleXPCNotificationEvent:]();
        }

        [getBMLibraryStreamsPrunerClass() pruneWithDeletedIntentGroupIdentifiers:v18 bundleId:v51];
      }

LABEL_42:
      goto LABEL_43;
    }
  }
  id v21 = [v15 objectForKeyedSubscript:@"_CDAppIntentsKey"];

  id v55 = v16;
  id v57 = v14;
  if (v21)
  {
    uint64_t v22 = _logChannel();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[_CDReceiverNotifier handleXPCNotificationEvent:].cold.5(v22, v23, v24, v25, v26, v27, v28, v29);
    }

    long long v30 = [v15 objectForKeyedSubscript:@"_CDAppIntentsKey"];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v63 objects:v71 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v64 != v33) {
            objc_enumerationMutation(v30);
          }
          long long v35 = objc_msgSend(MEMORY[0x1E4F4FCA0], "eventWithData:dataVersion:", *(void *)(*((void *)&v63 + 1) + 8 * i), objc_msgSend(MEMORY[0x1E4F4FCA0], "latestDataVersion", v55, v57));
          [(BMSource *)self->_intentSource sendEvent:v35];
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v63 objects:v71 count:16];
      }
      while (v32);
    }

    id v16 = v55;
    id v14 = v57;
  }
  long long v36 = objc_msgSend(v15, "objectForKeyedSubscript:", @"_CDAppActivitiesKey", v55, v57);

  if (v36)
  {
    long long v37 = _logChannel();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
      -[_CDReceiverNotifier handleXPCNotificationEvent:].cold.4(v37, v38, v39, v40, v41, v42, v43, v44);
    }

    long long v18 = [v15 objectForKeyedSubscript:@"_CDAppActivitiesKey"];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    uint64_t v45 = [v18 countByEnumeratingWithState:&v59 objects:v70 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v60;
      do
      {
        for (uint64_t j = 0; j != v46; ++j)
        {
          if (*(void *)v60 != v47) {
            objc_enumerationMutation(v18);
          }
          v49 = objc_msgSend(MEMORY[0x1E4F4FC90], "eventWithData:dataVersion:", *(void *)(*((void *)&v59 + 1) + 8 * j), objc_msgSend(MEMORY[0x1E4F4FC90], "latestDataVersion"));
          [(BMSource *)self->_activitySource sendEvent:v49];
        }
        uint64_t v46 = [v18 countByEnumeratingWithState:&v59 objects:v70 count:16];
      }
      while (v46);
      id v16 = v56;
      id v14 = v58;
    }
    goto LABEL_42;
  }
LABEL_43:
}

- (void)addSubscriber:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _logChannel();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18ECEB000, v5, OS_LOG_TYPE_DEFAULT, "Adding subscriber", buf, 2u);
  }

  uint64_t v6 = [v4 streamName];
  uint64_t v7 = [v4 token];
  uint64_t v8 = [NSString stringWithUTF8String:"com.apple.coreduet.xpc.receiver"];
  int v9 = [v8 isEqualToString:v6];

  if (v9)
  {
    uint64_t v10 = self->_subscribers;
    objc_sync_enter(v10);
    subscribers = self->_subscribers;
    uint64_t v12 = [NSNumber numberWithUnsignedLongLong:v7];
    [(NSMutableDictionary *)subscribers setObject:v4 forKeyedSubscript:v12];

    BOOL v13 = _logChannel();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_18ECEB000, v13, OS_LOG_TYPE_DEFAULT, "Successfully added subscriber", v14, 2u);
    }

    objc_sync_exit(v10);
  }
  else
  {
    _logChannel();
    uint64_t v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super.super, OS_LOG_TYPE_ERROR)) {
      -[_CDReceiverNotifier addSubscriber:]();
    }
  }
}

- (void)removeSubscriberWithToken:(unint64_t)a3 streamName:(id)a4
{
  id v6 = a4;
  uint64_t v7 = _logChannel();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18ECEB000, v7, OS_LOG_TYPE_DEFAULT, "Removing subscriber", buf, 2u);
  }

  uint64_t v8 = [NSString stringWithUTF8String:"com.apple.coreduet.xpc.receiver"];
  int v9 = [v8 isEqualToString:v6];

  if (v9)
  {
    uint64_t v10 = self->_subscribers;
    objc_sync_enter(v10);
    subscribers = self->_subscribers;
    uint64_t v12 = [NSNumber numberWithUnsignedLongLong:a3];
    [(NSMutableDictionary *)subscribers setObject:0 forKeyedSubscript:v12];

    BOOL v13 = _logChannel();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_18ECEB000, v13, OS_LOG_TYPE_DEFAULT, "Successfully removed subscriber for AppIntent recording", v14, 2u);
    }

    objc_sync_exit(v10);
  }
  else
  {
    _logChannel();
    uint64_t v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super.super, OS_LOG_TYPE_ERROR)) {
      -[_CDReceiverNotifier removeSubscriberWithToken:streamName:]();
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activitySource, 0);
  objc_storeStrong((id *)&self->_intentSource, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_xpcPublisher, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)publishXPCEventForAppIntents:appActivities:uid:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Failed to encoding XPC event for AppIntents/AppActivities object with error: %@", v2, v3, v4, v5, v6);
}

- (void)publishXPCEventForDeletedIntentIdentifiers:bundleID:uid:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Failed to encoding XPC event for deleted intent identifiers with error: %@", v2, v3, v4, v5, v6);
}

- (void)publishXPCEventForDeletedIntentGroupIdentifiers:bundleID:uid:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Failed to encoding XPC event for deleted intent group identifiers with error: %@", v2, v3, v4, v5, v6);
}

- (void)_publishXPCEvent:uid:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_DEBUG, "All subscribers %@", v1, 0xCu);
}

- (void)handleXPCNotificationEvent:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Invalid XPC event object: %{private}@", v2, v3, v4, v5, v6);
}

- (void)handleXPCNotificationEvent:.cold.2()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_4_3(&dword_18ECEB000, v0, v1, "Deleting intents with group identifiers: %{private}@; bundleID: %{private}@");
}

- (void)handleXPCNotificationEvent:.cold.3()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_4_3(&dword_18ECEB000, v0, v1, "Deleting intents with identifiers: %{private}@; bundleID: %{private}@");
}

- (void)handleXPCNotificationEvent:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)handleXPCNotificationEvent:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)handleXPCNotificationEvent:.cold.6()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_4_3(&dword_18ECEB000, v0, v1, "Received XPC notification event for registration %@: %{private}@");
}

- (void)handleXPCNotificationEvent:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_18ECEB000, v0, v1, "Failed to parse notification event for registration %@: %@");
}

- (void)handleXPCNotificationEvent:(uint64_t)a3 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addSubscriber:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Unknown event stream name adding subscriber: %{public}@", v2, v3, v4, v5, v6);
}

- (void)removeSubscriberWithToken:streamName:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Unknown event stream name removing subscriber: %{public}@", v2, v3, v4, v5, v6);
}

@end