@interface IDSServerMessagingController
- (IDSServerMessagingController)initWithTopic:(id)a3;
- (IDSServerMessagingController)initWithTopic:(id)a3 commands:(id)a4;
- (IDSServerMessagingController)initWithTopic:(id)a3 commands:(id)a4 daemonController:(id)a5;
- (IDSXPCDaemonController)daemonController;
- (NSHashTable)delegateMap;
- (NSMutableDictionary)inFlightRequests;
- (NSSet)commands;
- (NSString)topic;
- (NSString)uuid;
- (os_unfair_lock_s)daemonControllerLock;
- (os_unfair_lock_s)inFlightLock;
- (void)_failMessages;
- (void)_sendData:(id)a3 withOptions:(id)a4 identifier:(id)a5 completion:(id)a6;
- (void)_setupInterruptionHandler;
- (void)_setupXPC;
- (void)addDelegate:(id)a3;
- (void)cancelMessageWithIdentifier:(id)a3 completion:(id)a4;
- (void)handleReceivedFinalStorageIndication;
- (void)handleReceivedIncomingMessageData:(id)a3 identifier:(id)a4 context:(id)a5;
- (void)performXPC:(id)a3;
- (void)sendCertifiedDeliveryReceipt:(id)a3;
- (void)sendMessageData:(id)a3 withOptions:(id)a4 identifier:(id *)a5 completion:(id)a6;
- (void)sendServerStorageFetchWithCompletion:(id)a3;
- (void)setDaemonController:(id)a3;
- (void)setDaemonControllerLock:(os_unfair_lock_s)a3;
- (void)setDelegateMap:(id)a3;
- (void)setInFlightLock:(os_unfair_lock_s)a3;
- (void)setInFlightRequests:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation IDSServerMessagingController

- (IDSServerMessagingController)initWithTopic:(id)a3 commands:(id)a4 daemonController:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)IDSServerMessagingController;
  v12 = [(IDSServerMessagingController *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_topic, a3);
    objc_storeStrong((id *)&v13->_commands, a4);
    uint64_t v14 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    delegateMap = v13->_delegateMap;
    v13->_delegateMap = (NSHashTable *)v14;

    objc_storeStrong((id *)&v13->_daemonController, a5);
    v13->_daemonControllerLock._os_unfair_lock_opaque = 0;
    uint64_t v16 = [NSString stringGUID];
    uuid = v13->_uuid;
    v13->_uuid = (NSString *)v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    inFlightRequests = v13->_inFlightRequests;
    v13->_inFlightRequests = v18;

    v13->_inFlightLock._os_unfair_lock_opaque = 0;
    v20 = [MEMORY[0x1E4F6B460] IDSServerMessaging];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v13->_uuid;
      *(_DWORD *)buf = 138412546;
      id v25 = v9;
      __int16 v26 = 2112;
      v27 = v21;
      _os_log_impl(&dword_19190B000, v20, OS_LOG_TYPE_DEFAULT, "Client initialized IDSServerMessagingController with topic: %@ uuid: %@", buf, 0x16u);
    }

    [(IDSServerMessagingController *)v13 _setupInterruptionHandler];
    [(IDSServerMessagingController *)v13 _setupXPC];
  }

  return v13;
}

- (IDSServerMessagingController)initWithTopic:(id)a3
{
  return (IDSServerMessagingController *)MEMORY[0x1F4181798](self, sel_initWithTopic_commands_daemonController_);
}

- (IDSServerMessagingController)initWithTopic:(id)a3 commands:(id)a4
{
  return (IDSServerMessagingController *)MEMORY[0x1F4181798](self, sel_initWithTopic_commands_daemonController_);
}

- (void)_setupInterruptionHandler
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19194464C;
  v7[3] = &unk_1E57295B8;
  objc_copyWeak(&v8, &location);
  v3 = (void *)MEMORY[0x192FE03B0](v7);
  os_unfair_lock_lock(&self->_daemonControllerLock);
  daemonController = self->_daemonController;
  if (daemonController)
  {
    [(IDSXPCDaemonController *)daemonController addInterruptionHandler:v3 forTarget:self];
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = sub_191944730;
    v5[3] = &unk_1E5729FE8;
    v5[4] = self;
    id v6 = v3;
    +[IDSXPCDaemonController asyncWeakSharedInstance:v5];
  }
  os_unfair_lock_unlock(&self->_daemonControllerLock);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_setupXPC
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F6B460] IDSServerMessaging];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(IDSServerMessagingController *)self uuid];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v4;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "Setting up xpc for client %@", buf, 0xCu);
  }
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_19194492C;
  v5[3] = &unk_1E5729858;
  objc_copyWeak(&v6, (id *)buf);
  [(IDSServerMessagingController *)self performXPC:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

- (void)performXPC:(id)a3
{
  p_daemonControllerLock = &self->_daemonControllerLock;
  id v5 = a3;
  os_unfair_lock_lock(p_daemonControllerLock);
  daemonController = self->_daemonController;
  if (daemonController) {
    [(IDSXPCDaemonController *)daemonController performTask:v5];
  }
  else {
    +[IDSXPCDaemonController performDaemonControllerTask:v5];
  }

  os_unfair_lock_unlock(p_daemonControllerLock);
}

- (void)_failMessages
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  p_inFlightLock = &self->_inFlightLock;
  os_unfair_lock_lock(&self->_inFlightLock);
  v4 = [(IDSServerMessagingController *)self inFlightRequests];
  id v5 = (void *)[v4 copy];

  id v6 = [(IDSServerMessagingController *)self inFlightRequests];
  [v6 removeAllObjects];

  os_unfair_lock_unlock(p_inFlightLock);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v20;
    *(void *)&long long v9 = 138412546;
    long long v18 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v13, v18, (void)v19);
        uint64_t v14 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
        v15 = [[IDSServerMessagingOutgoingContext alloc] initWithIdentifier:v13];
        uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IDSServerMessagingErrorDomain" code:2 userInfo:0];
        v17 = [MEMORY[0x1E4F6B460] IDSServerMessaging];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v18;
          uint64_t v24 = v13;
          __int16 v25 = 2112;
          __int16 v26 = v16;
          _os_log_error_impl(&dword_19190B000, v17, OS_LOG_TYPE_ERROR, "Failing message due to xpc interruption {guid: %@, error: %@}", buf, 0x16u);
        }

        ((void (**)(void, void, void *, IDSServerMessagingOutgoingContext *))v14)[2](v14, 0, v16, v15);
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v10);
  }
}

- (void)_sendData:(id)a3 withOptions:(id)a4 identifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_191944E68;
  v18[3] = &unk_1E572A038;
  objc_copyWeak(&v23, &location);
  id v14 = v10;
  id v19 = v14;
  id v15 = v11;
  id v20 = v15;
  id v16 = v12;
  id v21 = v16;
  id v17 = v13;
  id v22 = v17;
  [(IDSServerMessagingController *)self performXPC:v18];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (void)addDelegate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IDSServerMessagingController *)self delegateMap];
  char v6 = [v5 containsObject:v4];

  if ((v6 & 1) == 0)
  {
    id v7 = [(IDSServerMessagingController *)self delegateMap];
    [v7 addObject:v4];

    uint64_t v8 = [MEMORY[0x1E4F6B460] IDSServerMessaging];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      long long v9 = [(IDSServerMessagingController *)self uuid];
      id v10 = [(IDSServerMessagingController *)self delegateMap];
      int v11 = 138412546;
      id v12 = v9;
      __int16 v13 = 2048;
      uint64_t v14 = [v10 count];
      _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Client added delegate to listen for incoming messages from server { uuid: %@, delegate count: %lu }", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)sendMessageData:(id)a3 withOptions:(id)a4 identifier:(id *)a5 completion:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!a5)
  {
    id v13 = [NSString stringGUID];
    goto LABEL_5;
  }
  if (*a5)
  {
    id v13 = *a5;
LABEL_5:
    id v14 = v13;
    goto LABEL_7;
  }
  id v14 = [NSString stringGUID];
  *a5 = v14;
LABEL_7:
  uint64_t v15 = [MEMORY[0x1E4F6B460] IDSServerMessaging];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [(IDSServerMessagingController *)self uuid];
    int v19 = 138412802;
    id v20 = v16;
    __int16 v21 = 2112;
    id v22 = v14;
    __int16 v23 = 2112;
    id v24 = v11;
    _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "Client requested send { clientUUID: %@, guid: %@, options: %@ }", (uint8_t *)&v19, 0x20u);
  }
  os_unfair_lock_lock(&self->_inFlightLock);
  id v17 = (void *)MEMORY[0x192FE03B0](v12);
  long long v18 = [(IDSServerMessagingController *)self inFlightRequests];
  [v18 setObject:v17 forKeyedSubscript:v14];

  os_unfair_lock_unlock(&self->_inFlightLock);
  [(IDSServerMessagingController *)self _sendData:v10 withOptions:v11 identifier:v14 completion:v12];
}

- (void)sendCertifiedDeliveryReceipt:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F6B460] IDSServerMessaging];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = [(IDSServerMessagingController *)self uuid];
    id v7 = [v4 originalGUID];
    *(_DWORD *)buf = 138412802;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "Client requested certified delivery receipt { clientUUID: %@, guid: %@, context: %@ }", buf, 0x20u);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1919455FC;
  v9[3] = &unk_1E572A060;
  id v10 = v4;
  id v8 = v4;
  [(IDSServerMessagingController *)self performXPC:v9];
}

- (void)sendServerStorageFetchWithCompletion:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1919457A4;
  v6[3] = &unk_1E572A0B0;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(IDSServerMessagingController *)self performXPC:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)cancelMessageWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_191945B14;
  v10[3] = &unk_1E572A0D8;
  objc_copyWeak(&v13, &location);
  id v8 = v6;
  id v11 = v8;
  id v9 = v7;
  id v12 = v9;
  [(IDSServerMessagingController *)self performXPC:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)handleReceivedIncomingMessageData:(id)a3 identifier:(id)a4 context:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v23 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F6B460] IDSServerMessaging];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(IDSServerMessagingController *)self uuid];
    *(_DWORD *)buf = 138412802;
    id v30 = v11;
    __int16 v31 = 2112;
    id v32 = v23;
    __int16 v33 = 2112;
    id v34 = v9;
    _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "Client received incoming data { clientUUID: %@, guid: %@, context: %@ }", buf, 0x20u);
  }
  id v12 = [(IDSServerMessagingController *)self delegateMap];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    id v14 = [(IDSServerMessagingController *)self delegateMap];
    __int16 v15 = (void *)[v14 copy];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          __int16 v21 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            id v22 = [MEMORY[0x1E4F6B460] IDSServerMessaging];
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v30 = v23;
              __int16 v31 = 2048;
              id v32 = v21;
              _os_log_impl(&dword_19190B000, v22, OS_LOG_TYPE_DEFAULT, "Forwarding server message to delegate { guid: %@, delegate: %p }", buf, 0x16u);
            }

            [v21 controller:self receivedIncomingMessageData:v8 context:v9];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v18);
    }
  }
  else
  {
    id v16 = [MEMORY[0x1E4F6B460] IDSServerMessaging];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_191A2DA20();
    }
  }
}

- (void)handleReceivedFinalStorageIndication
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F6B460] IDSServerMessaging];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(IDSServerMessagingController *)self uuid];
    *(_DWORD *)buf = 138412290;
    id v22 = v4;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "Client received final storage indication { clientUUID: %@ }", buf, 0xCu);
  }
  id v5 = [(IDSServerMessagingController *)self delegateMap];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = [(IDSServerMessagingController *)self delegateMap];
    id v8 = (void *)[v7 copy];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            __int16 v15 = [MEMORY[0x1E4F6B460] IDSServerMessaging];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              id v22 = v14;
              _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "Forwarding server message to delegate { delegate: %p }", buf, 0xCu);
            }

            [v14 receivedIndicationOfEmptyServerStorageForController:self];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F6B460] IDSServerMessaging];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_191A2DA88(v9);
    }
  }
}

- (NSString)topic
{
  return self->_topic;
}

- (NSSet)commands
{
  return self->_commands;
}

- (NSHashTable)delegateMap
{
  return self->_delegateMap;
}

- (void)setDelegateMap:(id)a3
{
}

- (IDSXPCDaemonController)daemonController
{
  return self->_daemonController;
}

- (void)setDaemonController:(id)a3
{
}

- (os_unfair_lock_s)daemonControllerLock
{
  return self->_daemonControllerLock;
}

- (void)setDaemonControllerLock:(os_unfair_lock_s)a3
{
  self->_daemonControllerLock = a3;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSMutableDictionary)inFlightRequests
{
  return self->_inFlightRequests;
}

- (void)setInFlightRequests:(id)a3
{
}

- (os_unfair_lock_s)inFlightLock
{
  return self->_inFlightLock;
}

- (void)setInFlightLock:(os_unfair_lock_s)a3
{
  self->_inFlightLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inFlightRequests, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_daemonController, 0);
  objc_storeStrong((id *)&self->_delegateMap, 0);
  objc_storeStrong((id *)&self->_commands, 0);

  objc_storeStrong((id *)&self->_topic, 0);
}

@end