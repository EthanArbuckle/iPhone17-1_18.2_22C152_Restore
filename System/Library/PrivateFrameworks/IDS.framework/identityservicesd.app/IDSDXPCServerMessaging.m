@interface IDSDXPCServerMessaging
- (BOOL)_entitledForTopic:(id)a3;
- (BOOL)entitledForAllTopics;
- (FTMessageDelivery)messageDelivery;
- (IDSDXPCServerMessaging)initWithQueue:(id)a3 connection:(id)a4 messageDelivery:(id)a5 pushHandler:(id)a6;
- (IDSPushHandler)pushHandler;
- (NSArray)serverMessagingEntitlements;
- (NSMutableDictionary)clientContextByTopic;
- (NSMutableDictionary)messagesToCancelOnDeallocByTopic;
- (NSMutableDictionary)pendingFetchMessagesWaiting;
- (OS_dispatch_queue)queue;
- (id)_commands;
- (id)_topics;
- (void)_handlePendingFetchBlocksForIdentifier:(id)a3 topic:(id)a4;
- (void)_recalculateTopics;
- (void)cancelMessageWithIdentifier:(id)a3 onTopic:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)handler:(id)a3 didReceiveMessage:(id)a4 forTopic:(id)a5 fromID:(id)a6 messageContext:(id)a7;
- (void)handler:(id)a3 receivedNoStorageResponseForTopic:(id)a4 identifier:(id)a5 messageContext:(id)a6;
- (void)handler:(id)a3 receivedOfflineMessagePendingForTopic:(id)a4 messageContext:(id)a5;
- (void)sendCertifiedDeliveryReceipt:(id)a3;
- (void)sendMessageData:(id)a3 onTopic:(id)a4 withOptions:(id)a5 identifier:(id)a6 completion:(id)a7;
- (void)sendServerStorageFetchForTopic:(id)a3 completion:(id)a4;
- (void)setClientContextByTopic:(id)a3;
- (void)setEntitledForAllTopics:(BOOL)a3;
- (void)setMessageDelivery:(id)a3;
- (void)setMessagesToCancelOnDeallocByTopic:(id)a3;
- (void)setPendingFetchMessagesWaiting:(id)a3;
- (void)setPushHandler:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServerMessagingEntitlements:(id)a3;
- (void)setupServerMessagingClient:(id)a3 withUUID:(id)a4 forTopic:(id)a5 commands:(id)a6;
@end

@implementation IDSDXPCServerMessaging

- (IDSDXPCServerMessaging)initWithQueue:(id)a3 connection:(id)a4 messageDelivery:(id)a5 pushHandler:(id)a6
{
  id v11 = a3;
  v12 = (IDSDXPCServerMessaging *)a4;
  id obj = a5;
  id v13 = a5;
  id v14 = a6;
  v15 = [(IDSDXPCServerMessaging *)v12 valueForEntitlement:kIDSServerMessagingEntitlement];
  v16 = [(IDSDXPCServerMessaging *)v12 valueForEntitlement:kIDSTestToolEntitlement];
  if (!v15)
  {
    v18 = +[IDSFoundationLog IDSServerMessaging];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10071BD00();
    }
    goto LABEL_30;
  }
  id v35 = a6;
  objc_opt_class();
  BOOL v17 = (objc_opt_isKindOfClass() & 1) != 0 && [v15 count] != 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v15 BOOLValue]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unsigned int v19 = [(IDSDXPCServerMessaging *)v16 BOOLValue];
  }
  else
  {
    unsigned int v19 = 0;
  }
  if (((v17 | v19) & 1) == 0)
  {
    v18 = +[IDSFoundationLog IDSServerMessaging];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v44 = v12;
      __int16 v45 = 2112;
      v46 = v15;
      __int16 v47 = 2112;
      v48 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Invalid server messaging entitlement -- failing creation of IDSDXPCServerMessaging collaborator {connection: %@, serverMessagingEntitlementValue: %@, testToolEntitlementValue: %@}", buf, 0x20u);
    }
LABEL_30:

    v28 = 0;
    goto LABEL_37;
  }
  if (v17)
  {
    v32 = self;
    id v33 = v14;
    id v34 = v13;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v20 = v15;
    v21 = (char *)[v20 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v21)
    {
      v22 = v21;
      uint64_t v23 = *(void *)v39;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(void *)v39 != v23) {
            objc_enumerationMutation(v20);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v29 = +[IDSFoundationLog IDSServerMessaging];
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
              sub_10071BD68();
            }

            v28 = 0;
            id v14 = v33;
            id v13 = v34;
            self = v32;
            goto LABEL_37;
          }
        }
        v22 = (char *)[v20 countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }

    id v13 = v34;
    id v14 = v33;
    self = v32;
  }
  v37.receiver = self;
  v37.super_class = (Class)IDSDXPCServerMessaging;
  v25 = [(IDSDXPCServerMessaging *)&v37 init];
  if (v25)
  {
    v26 = +[IDSFoundationLog IDSServerMessaging];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v44 = v25;
      __int16 v45 = 2112;
      v46 = v15;
      __int16 v47 = 2112;
      v48 = v12;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Created XPCServerMessaging {self: %p, serverMessagingEntitlementValue: %@, connection: %@}", buf, 0x20u);
    }

    objc_storeStrong((id *)&v25->_queue, a3);
    if (v19)
    {
      v27 = 0;
      v25->_entitledForAllTopics = 1;
    }
    else
    {
      v25->_entitledForAllTopics = 0;
      v27 = v15;
    }
    serverMessagingEntitlements = v25->_serverMessagingEntitlements;
    v25->_serverMessagingEntitlements = v27;

    objc_storeStrong((id *)&v25->_messageDelivery, obj);
    objc_storeStrong((id *)&v25->_pushHandler, v35);
  }
  self = v25;
  v28 = self;
LABEL_37:

  return v28;
}

- (void)dealloc
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [(IDSDXPCServerMessaging *)self messagesToCancelOnDeallocByTopic];
  id v15 = [obj countByEnumeratingWithState:&v22 objects:v33 count:16];
  if (v15)
  {
    uint64_t v14 = *(void *)v23;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = v3;
        uint64_t v4 = *(void *)(*((void *)&v22 + 1) + 8 * v3);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        v5 = [(IDSDXPCServerMessaging *)self messagesToCancelOnDeallocByTopic];
        v6 = [v5 objectForKeyedSubscript:v4];

        id v7 = [v6 countByEnumeratingWithState:&v18 objects:v32 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v19;
          do
          {
            for (i = 0; i != v8; i = (char *)i + 1)
            {
              if (*(void *)v19 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
              v12 = +[IDSFoundationLog IDSServerMessaging];
              if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218498;
                v27 = self;
                __int16 v28 = 2112;
                uint64_t v29 = v11;
                __int16 v30 = 2112;
                uint64_t v31 = v4;
                _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Cancelling pending message {self: %p, identifier: %@, topic: %@}", buf, 0x20u);
              }

              [(IDSDXPCServerMessaging *)self cancelMessageWithIdentifier:v11 onTopic:v4 completion:&stru_100987970];
            }
            id v8 = [v6 countByEnumeratingWithState:&v18 objects:v32 count:16];
          }
          while (v8);
        }

        uint64_t v3 = v16 + 1;
      }
      while ((id)(v16 + 1) != v15);
      id v15 = [obj countByEnumeratingWithState:&v22 objects:v33 count:16];
    }
    while (v15);
  }

  v17.receiver = self;
  v17.super_class = (Class)IDSDXPCServerMessaging;
  [(IDSDXPCServerMessaging *)&v17 dealloc];
}

- (BOOL)_entitledForTopic:(id)a3
{
  id v4 = a3;
  if ([(IDSDXPCServerMessaging *)self entitledForAllTopics]
    || ([(IDSDXPCServerMessaging *)self serverMessagingEntitlements],
        v5 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v6 = [v5 containsObject:v4],
        v5,
        (v6 & 1) != 0))
  {
    BOOL v7 = 1;
  }
  else
  {
    id v8 = +[IDSFoundationLog IDSServerMessaging];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10071BDD0(self, (uint64_t)v4, v8);
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (id)_commands
{
  id v3 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithObjects:", &off_1009D1A40, &off_1009D1A58, &off_1009D1A70, &off_1009D1A88, 0);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [(IDSDXPCServerMessaging *)self clientContextByTopic];
  id v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v29;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v4;
        uint64_t v5 = *(void *)(*((void *)&v28 + 1) + 8 * v4);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        unsigned __int8 v6 = [(IDSDXPCServerMessaging *)self clientContextByTopic];
        BOOL v7 = [v6 objectForKeyedSubscript:v5];

        id v8 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v25;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v25 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * i);
              id v13 = [(IDSDXPCServerMessaging *)self clientContextByTopic];
              uint64_t v14 = [v13 objectForKeyedSubscript:v5];
              id v15 = [v14 objectForKeyedSubscript:v12];

              uint64_t v16 = [v15 commands];

              if (v16)
              {
                objc_super v17 = [v15 commands];
                [v3 unionSet:v17];
              }
            }
            id v9 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v9);
        }

        uint64_t v4 = v23 + 1;
      }
      while ((id)(v23 + 1) != v22);
      id v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v22);
  }

  id v18 = [v3 copy];

  return v18;
}

- (id)_topics
{
  v2 = [(IDSDXPCServerMessaging *)self clientContextByTopic];
  id v3 = [v2 allKeys];
  uint64_t v4 = objc_msgSend(v3, "__imSetFromArray");

  return v4;
}

- (void)_recalculateTopics
{
  id v3 = [(IDSDXPCServerMessaging *)self clientContextByTopic];
  id v4 = [v3 count];

  id v10 = [(IDSDXPCServerMessaging *)self pushHandler];
  if (v4)
  {
    uint64_t v5 = [(IDSDXPCServerMessaging *)self clientContextByTopic];
    unsigned __int8 v6 = [v5 allKeys];
    BOOL v7 = objc_msgSend(v6, "__imSetFromArray");
    id v8 = [(IDSDXPCServerMessaging *)self _commands];
    id v9 = [(IDSDXPCServerMessaging *)self queue];
    [v10 addListener:self topics:v7 commands:v8 queue:v9];
  }
  else
  {
    [v10 removeListener:self];
  }
}

- (void)_handlePendingFetchBlocksForIdentifier:(id)a3 topic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IDSDXPCServerMessaging *)self pendingFetchMessagesWaiting];
  id v9 = [v8 objectForKeyedSubscript:v7];

  if ([v9 count])
  {
    id v10 = +[IDSFoundationLog IDSServerMessaging];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v24 = v7;
      __int16 v25 = 2112;
      id v26 = v6;
      __int16 v27 = 2112;
      long long v28 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Calling pending fetch blocks { topic: %@, identifier: %@, blocks: %@ }", buf, 0x20u);
    }

    if (v6)
    {
      uint64_t v11 = [v9 objectForKeyedSubscript:v6];
      id v12 = (id)v11;
      if (v11) {
        (*(void (**)(uint64_t))(v11 + 16))(v11);
      }
    }
    else
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v12 = v9;
      id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v19;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v19 != v15) {
              objc_enumerationMutation(v12);
            }
            objc_msgSend(v12, "objectForKeyedSubscript:", *(void *)(*((void *)&v18 + 1) + 8 * (void)v16), (void)v18);
            objc_super v17 = (void (**)(void))objc_claimAutoreleasedReturnValue();
            v17[2]();

            uint64_t v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v14);
      }
    }
  }
}

- (void)setupServerMessagingClient:(id)a3 withUUID:(id)a4 forTopic:(id)a5 commands:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(IDSDXPCServerMessaging *)self _entitledForTopic:v12])
  {
    if (v10)
    {
      id v14 = [v10 remoteObjectProxy];
      uint64_t v15 = +[IDSFoundationLog IDSServerMessaging];
      uint64_t v16 = (IDSXPCServerMessagingClientContext *)v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v34 = 134218498;
          id v35 = self;
          __int16 v36 = 2112;
          id v37 = v11;
          __int16 v38 = 2112;
          id v39 = v12;
          _os_log_impl((void *)&_mh_execute_header, &v16->super, OS_LOG_TYPE_DEFAULT, "Adding server messaging client {self: %p, uuid: %@, topic: %@}", (uint8_t *)&v34, 0x20u);
        }

        objc_super v17 = [(IDSDXPCServerMessaging *)self clientContextByTopic];

        if (!v17)
        {
          id v18 = objc_alloc_init((Class)NSMutableDictionary);
          [(IDSDXPCServerMessaging *)self setClientContextByTopic:v18];
        }
        long long v19 = [(IDSDXPCServerMessaging *)self clientContextByTopic];
        long long v20 = [v19 objectForKeyedSubscript:v12];

        if (!v20)
        {
          id v21 = objc_alloc_init((Class)NSMutableDictionary);
          id v22 = [(IDSDXPCServerMessaging *)self clientContextByTopic];
          [v22 setObject:v21 forKeyedSubscript:v12];
        }
        uint64_t v16 = objc_alloc_init(IDSXPCServerMessagingClientContext);
        [(IDSXPCServerMessagingClientContext *)v16 setClient:v14];
        [(IDSXPCServerMessagingClientContext *)v16 setCommands:v13];
        uint64_t v23 = [(IDSDXPCServerMessaging *)self clientContextByTopic];
        id v24 = [v23 objectForKeyedSubscript:v12];
        [v24 setObject:v16 forKeyedSubscript:v11];

        [(IDSDXPCServerMessaging *)self _recalculateTopics];
      }
      else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v34 = 134218498;
        id v35 = self;
        __int16 v36 = 2112;
        id v37 = v11;
        __int16 v38 = 2112;
        id v39 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, &v16->super, OS_LOG_TYPE_ERROR, "Error creating proxy for server messaging client {self: %p, uuid: %@, topic: %@}", (uint8_t *)&v34, 0x20u);
      }
    }
    else
    {
      __int16 v25 = +[IDSFoundationLog IDSServerMessaging];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        int v34 = 134218498;
        id v35 = self;
        __int16 v36 = 2112;
        id v37 = v11;
        __int16 v38 = 2112;
        id v39 = v12;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Removing server messaging client {self: %p, uuid: %@, topic: %@}", (uint8_t *)&v34, 0x20u);
      }

      id v26 = [(IDSDXPCServerMessaging *)self clientContextByTopic];
      __int16 v27 = [v26 objectForKeyedSubscript:v12];
      [v27 setObject:0 forKeyedSubscript:v11];

      long long v28 = [(IDSDXPCServerMessaging *)self clientContextByTopic];
      long long v29 = [v28 objectForKeyedSubscript:v12];
      id v30 = [v29 count];

      if (!v30)
      {
        long long v31 = [(IDSDXPCServerMessaging *)self clientContextByTopic];
        [v31 setObject:0 forKeyedSubscript:v12];
      }
      v32 = [(IDSDXPCServerMessaging *)self clientContextByTopic];
      id v33 = [v32 count];

      if (!v33) {
        [(IDSDXPCServerMessaging *)self setClientContextByTopic:0];
      }
      [(IDSDXPCServerMessaging *)self _recalculateTopics];
    }
  }
}

- (void)sendMessageData:(id)a3 onTopic:(id)a4 withOptions:(id)a5 identifier:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  LOBYTE(a7) = [(IDSDXPCServerMessaging *)self _entitledForTopic:v13];
  objc_super v17 = +[IDSFoundationLog IDSServerMessaging];
  id v18 = v17;
  if (a7)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v53 = v15;
      __int16 v54 = 2112;
      id v55 = v14;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "daemon requested sendMessageData { guid: %@, options: %@ }", buf, 0x16u);
    }

    id v19 = objc_alloc_init((Class)IDSServerMessagingMessage);
    id v45 = v12;
    [v19 setMessageData:v12];
    long long v20 = [v14 timeout];

    if (v20)
    {
      id v21 = [v14 timeout];
      [v21 doubleValue];
      id v22 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");

      [v19 setExpirationDate:v22];
    }
    [v19 setMessageID:v15];
    [v19 setTopic:v13];
    uint64_t v23 = [v14 command];
    [v19 setUserSpecifiedCommand:v23];

    id v24 = [(IDSDXPCServerMessaging *)self pushHandler];
    __int16 v25 = [v24 pushToken];
    [v19 setPushToken:v25];

    id v26 = [v14 additionalTopLevelFields];
    [v19 setUserDefinedTopLevelFields:v26];

    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_100296668;
    v46[3] = &unk_100987998;
    id v51 = v16;
    id v27 = v14;
    id v47 = v27;
    v48 = self;
    id v28 = v13;
    id v49 = v28;
    id v29 = v15;
    id v50 = v29;
    [v19 setCompletionBlock:v46];
    id v30 = +[IDSFoundationLog IDSServerMessaging];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v53 = v19;
      __int16 v54 = 2112;
      id v55 = v29;
      __int16 v56 = 2112;
      id v57 = v28;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Sending server message { guid: %@, topic: %@, message: %@ } ", buf, 0x20u);
    }

    long long v31 = [(IDSDXPCServerMessaging *)self messageDelivery];
    [v31 sendMessage:v19];

    v32 = [v27 cancelOnClientCrash];
    unsigned int v33 = [v32 BOOLValue];

    if (v33)
    {
      int v34 = [(IDSDXPCServerMessaging *)self messagesToCancelOnDeallocByTopic];

      if (!v34)
      {
        id v35 = objc_alloc_init((Class)NSMutableDictionary);
        [(IDSDXPCServerMessaging *)self setMessagesToCancelOnDeallocByTopic:v35];
      }
      __int16 v36 = [(IDSDXPCServerMessaging *)self messagesToCancelOnDeallocByTopic];
      id v37 = [v36 objectForKeyedSubscript:v28];

      if (!v37)
      {
        id v38 = objc_alloc_init((Class)NSMutableSet);
        id v39 = [(IDSDXPCServerMessaging *)self messagesToCancelOnDeallocByTopic];
        [v39 setObject:v38 forKeyedSubscript:v28];
      }
      long long v40 = [(IDSDXPCServerMessaging *)self messagesToCancelOnDeallocByTopic];
      long long v41 = [v40 objectForKeyedSubscript:v28];
      [v41 addObject:v29];
    }
    id v12 = v45;
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10071BE8C();
    }

    uint64_t v42 = IDSServerMessagingErrorDomain;
    NSErrorUserInfoKey v58 = NSUnderlyingErrorKey;
    v43 = +[IDSXPCConnection errorForMissingEntitlement:kIDSServerMessagingEntitlement];
    v59 = v43;
    v44 = +[NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
    id v19 = +[NSError errorWithDomain:v42 code:1 userInfo:v44];

    (*((void (**)(id, void, id))v16 + 2))(v16, 0, v19);
  }
}

- (void)cancelMessageWithIdentifier:(id)a3 onTopic:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  int v34 = self;
  unsigned __int8 v11 = [(IDSDXPCServerMessaging *)self _entitledForTopic:v9];
  id v12 = +[IDSFoundationLog IDSServerMessaging];
  id v13 = v12;
  if (v11)
  {
    unsigned int v33 = v10;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v40 = v8;
      __int16 v41 = 2112;
      id v42 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "daemon requested cancelMessageWithIdentifier { identifier: %@, topic: %@ }", buf, 0x16u);
    }

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v14 = [(IDSDXPCServerMessaging *)self messageDelivery];
    id v15 = [v14 queuedMessages];
    id v16 = [v15 _copyForEnumerating];

    id v17 = [v16 countByEnumeratingWithState:&v35 objects:v45 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v36;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v36 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v22 = v21;
            uint64_t v23 = [v22 topic];
            unsigned int v24 = [v23 isEqualToString:v9];

            if (v24)
            {
              __int16 v25 = [v22 messageID];
              unsigned int v26 = [v25 isEqualToString:v8];

              if (v26)
              {
                id v27 = +[IDSFoundationLog IDSServerMessaging];
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412802;
                  id v40 = v22;
                  __int16 v41 = 2112;
                  id v42 = v8;
                  __int16 v43 = 2112;
                  id v44 = v9;
                  _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Cancelling server message { guid: %@, topic: %@, message: %@ } ", buf, 0x20u);
                }

                id v28 = [(IDSDXPCServerMessaging *)v34 messageDelivery];
                [v28 cancelMessage:v22];
              }
            }
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v35 objects:v45 count:16];
      }
      while (v18);
    }

    id v10 = v33;
    if (v33) {
      v33[2](v33, 1, 0);
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10071BF5C();
    }

    uint64_t v29 = IDSServerMessagingErrorDomain;
    NSErrorUserInfoKey v46 = NSUnderlyingErrorKey;
    id v30 = +[IDSXPCConnection errorForMissingEntitlement:kIDSServerMessagingEntitlement];
    id v47 = v30;
    long long v31 = +[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    v32 = +[NSError errorWithDomain:v29 code:1 userInfo:v31];

    v10[2](v10, 0, v32);
  }
}

- (void)sendCertifiedDeliveryReceipt:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = +[IDSFoundationLog IDSServerMessaging];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10071C02C(v5);
    }
  }
  id v6 = [v4 service];
  if ([(IDSDXPCServerMessaging *)self _entitledForTopic:v6])
  {
    id v7 = [objc_alloc((Class)IDSCertifiedDeliveryReceiptMessage) initWithCertifiedDeliveryContext:v4];
    id v8 = [v4 service];
    [v7 setTopic:v8];

    id v9 = +[IDSFoundationLog IDSServerMessaging];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v4 originalGUID];
      int v12 = 138412802;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v10;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Sending certified delivery receipt to server { topic: %@, guid: %@, context: %@ }", (uint8_t *)&v12, 0x20u);
    }
    unsigned __int8 v11 = [(IDSDXPCServerMessaging *)self messageDelivery];
    [v11 sendMessage:v7];
  }
  else
  {
    id v7 = +[IDSFoundationLog IDSServerMessaging];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10071BFC4();
    }
  }
}

- (void)sendServerStorageFetchForTopic:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(IDSDXPCServerMessaging *)self _entitledForTopic:v6])
  {
    id v8 = +[NSUUID UUID];
    id v9 = [v8 UUIDString];

    if (v7)
    {
      id v10 = [(IDSDXPCServerMessaging *)self pendingFetchMessagesWaiting];

      if (!v10)
      {
        id v11 = objc_alloc_init((Class)NSMutableDictionary);
        [(IDSDXPCServerMessaging *)self setPendingFetchMessagesWaiting:v11];
      }
      int v12 = [(IDSDXPCServerMessaging *)self pendingFetchMessagesWaiting];
      id v13 = [v12 objectForKeyedSubscript:v6];

      if (!v13)
      {
        id v14 = objc_alloc_init((Class)NSMutableDictionary);
        id v15 = [(IDSDXPCServerMessaging *)self pendingFetchMessagesWaiting];
        [v15 setObject:v14 forKeyedSubscript:v6];
      }
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100297294;
      v26[3] = &unk_10097E7F0;
      id v27 = v7;
      __int16 v16 = objc_retainBlock(v26);
      id v17 = [(IDSDXPCServerMessaging *)self pendingFetchMessagesWaiting];
      id v18 = [v17 objectForKeyedSubscript:v6];
      [v18 setObject:v16 forKeyedSubscript:v9];
    }
    id v19 = objc_alloc_init((Class)IDSPendingOfflineMessageResponse);
    [v19 setTopic:v6];
    [v19 setMessageIdentifier:v9];
    long long v20 = +[IDSFoundationLog IDSServerMessaging];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v6;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Client triggered sending pending offline to server in IDSServerMessaging { topic: %@ }", buf, 0xCu);
    }

    id v21 = [(IDSDXPCServerMessaging *)self messageDelivery];
    [v21 sendMessage:v19];
  }
  else
  {
    id v22 = +[IDSFoundationLog IDSServerMessaging];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10071C070();
    }

    uint64_t v23 = IDSServerMessagingErrorDomain;
    NSErrorUserInfoKey v30 = NSUnderlyingErrorKey;
    unsigned int v24 = +[IDSXPCConnection errorForMissingEntitlement:kIDSServerMessagingEntitlement];
    long long v31 = v24;
    __int16 v25 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    id v9 = +[NSError errorWithDomain:v23 code:1 userInfo:v25];

    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v9);
  }
}

- (void)handler:(id)a3 didReceiveMessage:(id)a4 forTopic:(id)a5 fromID:(id)a6 messageContext:(id)a7
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  int v12 = [v9 objectForKey:@"U"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = [v9 objectForKey:@"U"];
    uint64_t v14 = +[NSData _IDSDataFromBase64String:v13];
LABEL_5:
    id v15 = (void *)v14;
    uint64_t v84 = JWUUIDPushObjectToString();

    goto LABEL_7;
  }
  id v13 = [v9 objectForKey:@"U"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [v9 objectForKey:@"U"];
    goto LABEL_5;
  }
  uint64_t v84 = JWUUIDPushObjectToString();
LABEL_7:

  __int16 v16 = +[IDSFoundationLog IDSServerMessaging];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v93 = v84;
    __int16 v94 = 2112;
    id v95 = v10;
    __int16 v96 = 2112;
    id v97 = v11;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received incoming server message over push in IDSDXPCServerMessaging { guid: %@, topic: %@, fromID: %@ }", buf, 0x20u);
  }

  uint64_t v17 = IDSPayloadKey;
  id v18 = [v9 objectForKey:IDSPayloadKey];
  objc_opt_class();
  id v83 = v10;
  v74 = v11;
  uint64_t v78 = v17;
  if (objc_opt_isKindOfClass())
  {
    id v19 = [v9 objectForKey:v17];
    uint64_t v20 = +[NSData _IDSDataFromBase64String:v19];
LABEL_13:
    v81 = (void *)v20;
    goto LABEL_15;
  }
  id v19 = [v9 objectForKey:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v20 = [v9 objectForKey:v17];
    goto LABEL_13;
  }
  v81 = 0;
LABEL_15:

  uint64_t v21 = objc_opt_class();
  id v22 = sub_100297C64(v21, v9, @"H");
  uint64_t v23 = objc_opt_class();
  v85 = sub_100297C64(v23, v9, @"c");
  unsigned __int8 v77 = [v22 unsignedIntValue];
  v73 = v22;
  unsigned __int8 v24 = [v22 unsignedIntValue];
  uint64_t v25 = IDSTokenKey;
  unsigned int v26 = [v9 objectForKey:IDSTokenKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v27 = [v9 objectForKey:v25];
    uint64_t v28 = +[NSData _IDSDataFromBase64String:v27];
LABEL_19:
    v75 = (void *)v28;
    goto LABEL_21;
  }
  id v27 = [v9 objectForKey:v25];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v28 = [v9 objectForKey:v25];
    goto LABEL_19;
  }
  v75 = 0;
LABEL_21:

  uint64_t v29 = objc_opt_class();
  uint64_t v71 = IDSCertifiedDeliveryVersionKey;
  NSErrorUserInfoKey v30 = sub_100297C64(v29, v9, IDSCertifiedDeliveryVersionKey);
  id v69 = [v30 integerValue];

  uint64_t v31 = IDSCertifiedDeliveryRTSKey;
  v32 = [v9 objectForKey:IDSCertifiedDeliveryRTSKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v33 = [v9 objectForKey:v31];
    v76 = +[NSData _IDSDataFromBase64String:v33];
    int v34 = v83;
  }
  else
  {
    unsigned int v33 = [v9 objectForKey:v31];
    objc_opt_class();
    int v34 = v83;
    if (objc_opt_isKindOfClass())
    {
      v76 = [v9 objectForKey:v31];
    }
    else
    {
      v76 = 0;
    }
  }

  uint64_t v35 = IDSStorageFetchIdentifierKey;
  long long v36 = [v9 objectForKey:IDSStorageFetchIdentifierKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v37 = [v9 objectForKey:v35];
    long long v38 = +[NSData _IDSDataFromBase64String:v37];
    v80 = JWUUIDPushObjectToString();
  }
  else
  {
    long long v37 = [v9 objectForKey:v35];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v39 = [v9 objectForKey:v35];
      v80 = JWUUIDPushObjectToString();
    }
    else
    {
      v80 = JWUUIDPushObjectToString();
    }
  }
  id v40 = self;

  id v41 = [v9 mutableCopy];
  v91[0] = v78;
  v91[1] = @"H";
  v91[2] = @"c";
  v91[3] = v25;
  v91[4] = v71;
  v91[5] = v31;
  id v42 = +[NSArray arrayWithObjects:v91 count:6];
  [v41 removeObjectsForKeys:v42];

  if (v76)
  {
    __int16 v43 = (void *)v84;
    id v44 = [objc_alloc((Class)IDSCertifiedDeliveryContext) initWithGUID:v84 service:v34 certifiedDeliveryVersion:v69 certifiedDeliveryRTS:v76 senderToken:v75];
  }
  else
  {
    id v45 = +[IDSFoundationLog IDSServerMessaging];
    __int16 v43 = (void *)v84;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      sub_10071C140();
    }

    id v44 = 0;
  }
  v70 = v41;
  v72 = v44;
  id v79 = [objc_alloc((Class)IDSServerMessagingIncomingContext) initWithFromServerStorage:v77 & 1 certifiedDeliveryContext:v44 command:v85 identifier:v43 additionalTopLevelFields:v41];
  NSErrorUserInfoKey v46 = [(IDSDXPCServerMessaging *)self clientContextByTopic];
  id v47 = [v46 objectForKeyedSubscript:v34];
  id v48 = [v47 count];

  if (v48)
  {
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v49 = [(IDSDXPCServerMessaging *)self clientContextByTopic];
    id v50 = [v49 objectForKeyedSubscript:v34];

    id v51 = [v50 countByEnumeratingWithState:&v86 objects:v90 count:16];
    if (v51)
    {
      id v52 = v51;
      id v68 = v9;
      uint64_t v53 = *(void *)v87;
      while (1)
      {
        for (i = 0; i != v52; i = (char *)i + 1)
        {
          if (*(void *)v87 != v53) {
            objc_enumerationMutation(v50);
          }
          id v55 = *(void **)(*((void *)&v86 + 1) + 8 * i);
          __int16 v56 = +[IDSFoundationLog IDSServerMessaging];
          BOOL v57 = os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT);
          if ((v24 & 2) != 0)
          {
            if (!v57) {
              goto LABEL_48;
            }
            *(_DWORD *)buf = 138412546;
            uint64_t v93 = v84;
            __int16 v94 = 2112;
            id v95 = v55;
            NSErrorUserInfoKey v58 = v56;
            v59 = "Giving message to client - and last storage indication { guid: %@, clientUUID: %@ }";
          }
          else
          {
            if (!v57) {
              goto LABEL_48;
            }
            *(_DWORD *)buf = 138412546;
            uint64_t v93 = v84;
            __int16 v94 = 2112;
            id v95 = v55;
            NSErrorUserInfoKey v58 = v56;
            v59 = "Giving message to client { guid: %@, clientUUID: %@ }";
          }
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, v59, buf, 0x16u);
LABEL_48:

          if ([v85 longValue] != (id)255)
          {
            v60 = [(IDSDXPCServerMessaging *)v40 clientContextByTopic];
            v61 = [v60 objectForKeyedSubscript:v34];
            v62 = [v61 objectForKeyedSubscript:v55];
            v63 = [v62 client];
            [v63 handleReceivedIncomingMessageData:v81 identifier:v84 context:v79];

            id v40 = self;
            int v34 = v83;
          }
          if ((v24 & 2) != 0)
          {
            [(IDSDXPCServerMessaging *)v40 _handlePendingFetchBlocksForIdentifier:v80 topic:v34];
            v64 = [(IDSDXPCServerMessaging *)v40 clientContextByTopic];
            v65 = [v64 objectForKeyedSubscript:v34];
            v66 = [v65 objectForKeyedSubscript:v55];
            v67 = [v66 client];
            [v67 handleReceivedFinalStorageIndication];

            int v34 = v83;
            id v40 = self;
          }
        }
        id v52 = [v50 countByEnumeratingWithState:&v86 objects:v90 count:16];
        if (!v52)
        {
          id v9 = v68;
          __int16 v43 = (void *)v84;
          break;
        }
      }
    }
  }
  else
  {
    id v50 = +[IDSFoundationLog IDSServerMessaging];
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      sub_10071C0D8();
    }
  }
}

- (void)handler:(id)a3 receivedOfflineMessagePendingForTopic:(id)a4 messageContext:(id)a5
{
  id v6 = a4;
  id v7 = objc_alloc_init((Class)IDSPendingOfflineMessageResponse);
  [v7 setTopic:v6];
  id v8 = +[IDSFoundationLog IDSServerMessaging];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending pending offline message response to server in IDSServerMessaging { topic: %@ }", (uint8_t *)&v10, 0xCu);
  }

  id v9 = [(IDSDXPCServerMessaging *)self messageDelivery];
  [v9 sendMessage:v7];
}

- (void)handler:(id)a3 receivedNoStorageResponseForTopic:(id)a4 identifier:(id)a5 messageContext:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  int v10 = [(IDSDXPCServerMessaging *)self clientContextByTopic];
  id v11 = [v10 objectForKeyedSubscript:v8];
  id v12 = [v11 count];

  if (v12)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v13 = [(IDSDXPCServerMessaging *)self clientContextByTopic];
    uint64_t v14 = [v13 objectForKeyedSubscript:v8];

    id obj = v14;
    id v15 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v15)
    {
      id v16 = v15;
      id v25 = v9;
      uint64_t v17 = *(void *)v28;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v20 = +[IDSFoundationLog IDSServerMessaging];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v32 = v8;
            __int16 v33 = 2112;
            uint64_t v34 = v19;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Giving no storage response indication to client { topic: %@, clientUUID: %@ }", buf, 0x16u);
          }

          uint64_t v21 = [(IDSDXPCServerMessaging *)self clientContextByTopic];
          id v22 = [v21 objectForKeyedSubscript:v8];
          uint64_t v23 = [v22 objectForKeyedSubscript:v19];
          unsigned __int8 v24 = [v23 client];
          [v24 handleReceivedFinalStorageIndication];
        }
        id v16 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v16);
      id v9 = v25;
    }
  }
  else
  {
    id obj = +[IDSFoundationLog IDSServerMessaging];
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      sub_10071C22C();
    }
  }

  [(IDSDXPCServerMessaging *)self _handlePendingFetchBlocksForIdentifier:v9 topic:v8];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)entitledForAllTopics
{
  return self->_entitledForAllTopics;
}

- (void)setEntitledForAllTopics:(BOOL)a3
{
  self->_entitledForAllTopics = a3;
}

- (NSArray)serverMessagingEntitlements
{
  return self->_serverMessagingEntitlements;
}

- (void)setServerMessagingEntitlements:(id)a3
{
}

- (NSMutableDictionary)clientContextByTopic
{
  return self->_clientContextByTopic;
}

- (void)setClientContextByTopic:(id)a3
{
}

- (NSMutableDictionary)messagesToCancelOnDeallocByTopic
{
  return self->_messagesToCancelOnDeallocByTopic;
}

- (void)setMessagesToCancelOnDeallocByTopic:(id)a3
{
}

- (NSMutableDictionary)pendingFetchMessagesWaiting
{
  return self->_pendingFetchMessagesWaiting;
}

- (void)setPendingFetchMessagesWaiting:(id)a3
{
}

- (FTMessageDelivery)messageDelivery
{
  return self->_messageDelivery;
}

- (void)setMessageDelivery:(id)a3
{
}

- (IDSPushHandler)pushHandler
{
  return self->_pushHandler;
}

- (void)setPushHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushHandler, 0);
  objc_storeStrong((id *)&self->_messageDelivery, 0);
  objc_storeStrong((id *)&self->_pendingFetchMessagesWaiting, 0);
  objc_storeStrong((id *)&self->_messagesToCancelOnDeallocByTopic, 0);
  objc_storeStrong((id *)&self->_clientContextByTopic, 0);
  objc_storeStrong((id *)&self->_serverMessagingEntitlements, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end