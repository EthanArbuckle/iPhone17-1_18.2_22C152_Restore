@interface IDSStewieSessionKeyManager
- (IDSStewieCTClient)stewieCTClient;
- (IDSStewieSessionKeyManager)initWithDelegate:(id)a3 ctClient:(id)a4;
- (IDSStewieSessionKeyManagerDelegate)delegate;
- (NSMutableArray)successKeyResponses;
- (NSMutableDictionary)inProgressKeyUpdates;
- (id)constructKeyInfoToUpdate:(id)a3;
- (void)clearState;
- (void)handleFailureForSessionKeyInfos:(id)a3;
- (void)handleSuccessForSessionKeyInfos:(id)a3;
- (void)performInitialKeyInfoCheck;
- (void)receivedStewieEnabledChanged:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInProgressKeyUpdates:(id)a3;
- (void)setStewieCTClient:(id)a3;
- (void)setSuccessKeyResponses:(id)a3;
- (void)stewieCTClient:(id)a3 receivedSessionKeyUpdate:(id)a4;
- (void)stewieCTClient:(id)a3 receivedStewieMessageConfigChanged:(id)a4;
@end

@implementation IDSStewieSessionKeyManager

- (IDSStewieSessionKeyManager)initWithDelegate:(id)a3 ctClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IDSStewieSessionKeyManager;
  v8 = [(IDSStewieSessionKeyManager *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_stewieCTClient, a4);
    [(IDSStewieCTClient *)v9->_stewieCTClient setDelegate:v9];
    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    inProgressKeyUpdates = v9->_inProgressKeyUpdates;
    v9->_inProgressKeyUpdates = v10;
  }
  return v9;
}

- (void)performInitialKeyInfoCheck
{
  v3 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Performing initial stewie key info check", v5, 2u);
  }

  v4 = [(IDSStewieSessionKeyManager *)self stewieCTClient];
  [v4 fetchSessionKeysUpdate];
}

- (void)clearState
{
  v3 = [(IDSStewieSessionKeyManager *)self inProgressKeyUpdates];
  [v3 removeAllObjects];

  [(IDSStewieSessionKeyManager *)self setSuccessKeyResponses:0];
}

- (void)handleSuccessForSessionKeyInfos:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v26 = [v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v26)
    {
      uint64_t v6 = *(void *)v28;
      uint64_t v25 = *(void *)v28;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v28 != v6) {
            objc_enumerationMutation(v5);
          }
          v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (int)objc_msgSend(v8, "ctIndex", v25));
          v10 = [(IDSStewieSessionKeyManager *)self inProgressKeyUpdates];
          v11 = [v10 objectForKey:v9];

          v12 = [v8 sessionKey];
          objc_super v13 = [v11 key];
          unsigned int v14 = [v12 isEqualToData:v13];

          if (v14)
          {
            v15 = v5;
            v16 = [IDSCTTransportSTK alloc];
            v17 = [v8 serverPublicKey];
            id v18 = [v8 ctIndex];
            v19 = [v8 keyEPKI];
            v20 = [(IDSCTTransportSTK *)v16 initWithSTK:v17 forIdx:v18 epki:v19];

            v21 = [(IDSStewieSessionKeyManager *)self inProgressKeyUpdates];
            [v21 removeObjectForKey:v9];

            v22 = [(IDSStewieSessionKeyManager *)self successKeyResponses];

            if (!v22)
            {
              id v23 = objc_alloc_init((Class)NSMutableArray);
              [(IDSStewieSessionKeyManager *)self setSuccessKeyResponses:v23];
            }
            v24 = [(IDSStewieSessionKeyManager *)self successKeyResponses];
            [v24 addObject:v20];

            v5 = v15;
            uint64_t v6 = v25;
          }
        }
        id v26 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v26);
    }
    sub_10006F278(self);
  }
}

- (void)handleFailureForSessionKeyInfos:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v20;
      id obj = v5;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(obj);
          }
          v10 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)v9) request];
          v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (int)[v10 ctIndex]);
          v12 = [(IDSStewieSessionKeyManager *)self inProgressKeyUpdates];
          objc_super v13 = [v12 objectForKey:v11];

          unsigned int v14 = [v10 sessionKey];
          v15 = [v13 key];
          unsigned int v16 = [v14 isEqualToData:v15];

          if (v16)
          {
            v17 = [(IDSStewieSessionKeyManager *)self inProgressKeyUpdates];
            [v17 removeObjectForKey:v11];
          }
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v5 = obj;
        id v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }
    sub_10006F278(self);
  }
}

- (id)constructKeyInfoToUpdate:(id)a3
{
  id v3 = a3;
  id v4 = [IDSStewieSessionKeyInfo alloc];
  v5 = [v3 key];
  id v6 = [v3 index];
  id v7 = [v3 keyEPKI];
  uint64_t v8 = [v3 retiredEPKI];
  id v9 = [v3 lastResort];

  v10 = [(IDSStewieSessionKeyInfo *)v4 initWithSessionKey:v5 ctIndex:v6 epki:v7 repki:v8 lastResort:v9];

  return v10;
}

- (void)stewieCTClient:(id)a3 receivedSessionKeyUpdate:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  if (v5)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v19 = v5;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          objc_super v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (int)[v12 index]);
          unsigned int v14 = [(IDSStewieSessionKeyManager *)self inProgressKeyUpdates];
          [v14 setObject:v12 forKey:v13];

          v15 = [(IDSStewieSessionKeyManager *)self constructKeyInfoToUpdate:v12];
          [v6 addObject:v15];
        }
        id v9 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v9);
    }

    unsigned int v16 = +[IDSFoundationLog stewieProvisioning];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [v6 count];
      *(_DWORD *)buf = 134217984;
      id v25 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Forwarding %ld session key infos to update to Coordinator", buf, 0xCu);
    }

    id v18 = [(IDSStewieSessionKeyManager *)self delegate];
    [v18 sessionKeyManager:self sessionKeyInfosToUpdate:v6];

    id v5 = v19;
  }
}

- (void)receivedStewieEnabledChanged:(id)a3
{
  id v4 = [(IDSStewieSessionKeyManager *)self delegate];
  [v4 stewieEnabledChanged:self];
}

- (void)stewieCTClient:(id)a3 receivedStewieMessageConfigChanged:(id)a4
{
  id v5 = a4;
  id v6 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Forwarding smsConfig: %@ to Coordinator", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(IDSStewieSessionKeyManager *)self delegate];
  [v7 sessionKeyManager:self stewieMessageConfigChanged:v5];
}

- (IDSStewieSessionKeyManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IDSStewieSessionKeyManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (IDSStewieCTClient)stewieCTClient
{
  return self->_stewieCTClient;
}

- (void)setStewieCTClient:(id)a3
{
}

- (NSMutableDictionary)inProgressKeyUpdates
{
  return self->_inProgressKeyUpdates;
}

- (void)setInProgressKeyUpdates:(id)a3
{
}

- (NSMutableArray)successKeyResponses
{
  return self->_successKeyResponses;
}

- (void)setSuccessKeyResponses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_successKeyResponses, 0);
  objc_storeStrong((id *)&self->_inProgressKeyUpdates, 0);
  objc_storeStrong((id *)&self->_stewieCTClient, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end