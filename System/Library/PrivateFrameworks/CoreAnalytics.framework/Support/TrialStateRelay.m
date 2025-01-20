@interface TrialStateRelay
- (TrialStateRelay)initWithMonitoring:(TrialStateDelegate *)a3;
- (id).cxx_construct;
- (void)_updateTrialState:(id)a3 experimentIdentifiers:(id)a4;
- (void)dealloc;
- (void)refreshTrialState:(id)a3;
- (void)subscribeToTrialNamespace:(id)a3;
- (void)unsubscribeAllUpdateHandlers;
@end

@implementation TrialStateRelay

- (TrialStateRelay)initWithMonitoring:(TrialStateDelegate *)a3
{
  v28.receiver = self;
  v28.super_class = (Class)TrialStateRelay;
  v4 = [(TrialStateRelay *)&v28 init];
  if (v4)
  {
    if (objc_opt_class())
    {
      v4->_trialStateDelegate = a3;
      dispatch_queue_t v5 = dispatch_queue_create("analyticsd.Trial.CallbackQueue", 0);
      fObj = v4->_trialClientQueue.fObj.fObj;
      v4->_trialClientQueue.fObj.fObj = (OS_dispatch_object *)v5;

      uint64_t v7 = objc_opt_new();
      notificationTokens = v4->_notificationTokens;
      v4->_notificationTokens = (NSMutableArray *)v7;

      uint64_t v9 = +[TRIClient clientWithIdentifier:334];
      trialClient = v4->trialClient;
      v4->trialClient = (TRIClient *)v9;

      v11 = qword_10015EF78;
      if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[TrialStateRelay] TrialIdentifier: initialized trialClient for CA project ID", buf, 2u);
      }
      id v27 = 0;
      v12 = +[TRIClient getSandboxExtensionTokensForIdentifierQueryWithError:&v27];
      id v26 = v27;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v13 = v12;
      id v14 = [v13 countByEnumeratingWithState:&v34 objects:v33 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v35;
        do
        {
          v16 = 0;
          do
          {
            if (*(void *)v35 != v15) {
              objc_enumerationMutation(v13);
            }
            v17 = *(void **)(*((void *)&v34 + 1) + 8 * (void)v16);
            if (v17)
            {
              [v17 UTF8String];
              v18 = +[NSNumber numberWithLongLong:sandbox_extension_consume()];
              if (((unint64_t)[v18 longLongValue] & 0x8000000000000000) != 0)
              {
                v19 = (id)qword_10015EF78;
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                {
                  int v21 = *__error();
                  *(_DWORD *)buf = 67109120;
                  int v32 = v21;
                  _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "[TrialStateRelay] Trial: Failed to consume extension: %i", buf, 8u);
                }
              }
              [(NSMutableArray *)v4->_sbExtensionHandles addObject:v18];
            }
            else
            {
              v20 = qword_10015EF78;
              if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_ERROR)) {
                sub_1000FB6D4(&v29, v30, v20);
              }
            }
            v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          id v14 = [v13 countByEnumeratingWithState:&v34 objects:v33 count:16];
        }
        while (v14);
      }

      if (v26)
      {
        v22 = (id)qword_10015EF78;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = [v26 localizedDescription];
          sub_1000FB67C(v23, buf, v22);
        }
      }
    }
    v24 = v4;
  }

  return v4;
}

- (void)dealloc
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v3 = self->_sbExtensionHandles;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v4)
  {
    uint64_t v6 = *(void *)v16;
    *(void *)&long long v5 = 67109120;
    long long v10 = v5;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v7), "longLongValue", v10);
        if (sandbox_extension_release())
        {
          v8 = (id)qword_10015EF78;
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            int v9 = *__error();
            *(_DWORD *)buf = v10;
            int v13 = v9;
            _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[TrialStateRelay] Trial: Couldn't release extension %i", buf, 8u);
          }
        }
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v4);
  }

  v11.receiver = self;
  v11.super_class = (Class)TrialStateRelay;
  [(TrialStateRelay *)&v11 dealloc];
}

- (void)refreshTrialState:(id)a3
{
  id v4 = a3;
  [(TRIClient *)self->trialClient refresh];
  long long v5 = [(TRIClient *)self->trialClient experimentIdentifiersWithNamespaceName:v4];
  uint64_t v6 = qword_10015EF78;
  if (v5)
  {
    uint64_t v7 = (id)qword_10015EF78;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = [v5 experimentId];
      unsigned int v9 = [v5 deploymentId];
      long long v10 = [v5 treatmentId];
      int v11 = 138413058;
      id v12 = v4;
      __int16 v13 = 2112;
      id v14 = v8;
      __int16 v15 = 1024;
      unsigned int v16 = v9;
      __int16 v17 = 2112;
      long long v18 = v10;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[TrialStateRelay] TrialIdentifier: experimentIdentifiers for namespace %@ are: experimentId: %@, deploymentId: %d, treatmentId: %@", (uint8_t *)&v11, 0x26u);
    }
    [(TrialStateRelay *)self _updateTrialState:v4 experimentIdentifiers:v5];
  }
  else if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_DEBUG))
  {
    sub_1000FB714(v6);
  }
}

- (void)subscribeToTrialNamespace:(id)a3
{
  id v4 = a3;
  if (self->trialClient)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    trialClient = self->trialClient;
    uint64_t v7 = sub_10000FD1C((id *)&self->_trialClientQueue.fObj.fObj);
    id v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    id v14 = sub_10007AE00;
    __int16 v15 = &unk_100154CD0;
    objc_copyWeak(&v17, &location);
    id v8 = v4;
    id v16 = v8;
    unsigned int v9 = [(TRIClient *)trialClient addUpdateHandlerForNamespaceName:v8 queue:v7 usingBlock:&v12];

    id v10 = objc_loadWeakRetained(&location);
    objc_msgSend(v10, "refreshTrialState:", v8, v12, v13, v14, v15);

    if (v9) {
      [(NSMutableArray *)self->_notificationTokens addObject:v9];
    }

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    int v11 = qword_10015EF78;
    if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_ERROR)) {
      sub_1000FB784(v11);
    }
  }
}

- (void)unsubscribeAllUpdateHandlers
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_notificationTokens;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(id *)(*((void *)&v9 + 1) + 8 * (void)v6);
        [(TRIClient *)self->trialClient removeUpdateHandlerForToken:v7];

        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v8 count:16];
    }
    while (v4);
  }
}

- (void)_updateTrialState:(id)a3 experimentIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7 && ([v7 experimentId], long long v9 = objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    trialStateDelegate = self->_trialStateDelegate;
    sub_100015438(v22, (char *)[v6 UTF8String]);
    id v11 = [v8 experimentId];
    sub_100015438(v20, (char *)[v11 UTF8String]);
    std::to_string(&v19, (int)[v8 deploymentId]);
    id v12 = [v8 treatmentId];
    sub_100015438(__p, (char *)[v12 UTF8String]);
    (*((void (**)(id *__return_ptr, TrialStateDelegate *, uint64_t, void **, void **, std::string *, void **))trialStateDelegate->var0
     + 2))(&v16, trialStateDelegate, 1, v22, v20, &v19, __p);
    id v13 = v16;
    id v16 = 0;

    if (v18 < 0) {
      operator delete(__p[0]);
    }

    if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v19.__r_.__value_.__l.__data_);
    }
    if (v21 < 0) {
      operator delete(v20[0]);
    }
  }
  else
  {
    id v14 = self->_trialStateDelegate;
    sub_100015438(v22, (char *)[v6 UTF8String]);
    sub_100015438(v20, "");
    sub_100015438(&v19, "");
    sub_100015438(__p, "");
    (*((void (**)(id *__return_ptr, TrialStateDelegate *, void, void **, void **, std::string *, void **))v14->var0
     + 2))(&v24, v14, 0, v22, v20, &v19, __p);
    id v15 = v24;
    id v24 = 0;

    if (v18 < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v19.__r_.__value_.__l.__data_);
    }
    if (v21 < 0) {
      operator delete(v20[0]);
    }
  }
  if (v23 < 0) {
    operator delete(v22[0]);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sbExtensionHandles, 0);
  objc_storeStrong((id *)&self->_notificationTokens, 0);
  fObj = self->_trialClientQueue.fObj.fObj;
  self->_trialClientQueue.fObj.fObj = 0;

  objc_storeStrong((id *)&self->trialClient, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

@end