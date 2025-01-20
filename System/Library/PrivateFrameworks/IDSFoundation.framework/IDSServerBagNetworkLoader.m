@interface IDSServerBagNetworkLoader
- (BOOL)isLoading;
- (BOOL)isServerAvailable;
- (IDSServerBagConfig)config;
- (IDSServerBagNetworkLoader)initWithConfig:(id)a3 queue:(id)a4 connectionMonitorBlock:(id)a5 URLSessionCreationBlock:(id)a6;
- (IMConnectionMonitor)connectionMonitor;
- (IMURLRequestSession)URLRequestSession;
- (OS_dispatch_queue)queue;
- (id)URLSessionCreationBlock;
- (id)connectionMonitorBlock;
- (id)storedCompletion;
- (os_unfair_lock_s)lock;
- (unint64_t)loaderState;
- (void)connectionMonitorDidUpdate:(id)a3;
- (void)dealloc;
- (void)loadBagIfPossibleWithCompletion:(id)a3;
- (void)setConfig:(id)a3;
- (void)setConnectionMonitor:(id)a3;
- (void)setConnectionMonitorBlock:(id)a3;
- (void)setLoaderState:(unint64_t)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setQueue:(id)a3;
- (void)setStoredCompletion:(id)a3;
- (void)setURLRequestSession:(id)a3;
- (void)setURLSessionCreationBlock:(id)a3;
@end

@implementation IDSServerBagNetworkLoader

- (IDSServerBagNetworkLoader)initWithConfig:(id)a3 queue:(id)a4 connectionMonitorBlock:(id)a5 URLSessionCreationBlock:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)IDSServerBagNetworkLoader;
  v15 = [(IDSServerBagNetworkLoader *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_config, a3);
    objc_storeStrong((id *)&v16->_queue, a4);
    v16->_lock._os_unfair_lock_opaque = 0;
    v17 = _Block_copy(v13);
    id connectionMonitorBlock = v16->_connectionMonitorBlock;
    v16->_id connectionMonitorBlock = v17;

    v19 = _Block_copy(v14);
    id URLSessionCreationBlock = v16->_URLSessionCreationBlock;
    v16->_id URLSessionCreationBlock = v19;
  }
  return v16;
}

- (BOOL)isLoading
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = objc_msgSend_loaderState(v2, v4, v5, v6) == 1;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)loadBagIfPossibleWithCompletion:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v8 = objc_msgSend_queue(self, v4, v5, v7);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_19D9E8190;
    v9[3] = &unk_1E59706C8;
    v9[4] = self;
    id v10 = v6;
    dispatch_async(v8, v9);
  }
}

- (BOOL)isServerAvailable
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = sub_19D9E8764((const os_unfair_lock *)v2);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)dealloc
{
  objc_msgSend_clear(self->_connectionMonitor, a2, v2, v3);
  objc_msgSend_setDelegate_(self->_connectionMonitor, v5, 0, v6);
  v7.receiver = self;
  v7.super_class = (Class)IDSServerBagNetworkLoader;
  [(IDSServerBagNetworkLoader *)&v7 dealloc];
}

- (void)connectionMonitorDidUpdate:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  int isImmediatelyReachable = objc_msgSend_isImmediatelyReachable(a3, a2, (uint64_t)a3, v3);
  os_unfair_lock_lock(&self->_lock);
  uint64_t v9 = objc_msgSend_loaderState(self, v6, v7, v8);
  id v13 = objc_msgSend_config(self, v10, v11, v12);
  v17 = objc_msgSend_logCategory(v13, v14, v15, v16);

  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = objc_opt_class();
    int v22 = objc_msgSend_loaderState(self, v19, v20, v21);
    v23 = @"NO";
    int v36 = 138413058;
    uint64_t v37 = v18;
    __int16 v38 = 2048;
    if (isImmediatelyReachable) {
      v23 = @"YES";
    }
    v39 = self;
    __int16 v40 = 1024;
    int v41 = v22;
    __int16 v42 = 2112;
    v43 = v23;
    _os_log_impl(&dword_19D9BE000, v17, OS_LOG_TYPE_INFO, "<%@:%p> Received connectionMonitorDidUpdate {_loaderState: %d; isImmediatelyReachable: %@}",
      (uint8_t *)&v36,
      0x26u);
  }

  if (v9 == 2) {
    int v26 = isImmediatelyReachable;
  }
  else {
    int v26 = 0;
  }
  if (v26 == 1)
  {
    objc_msgSend_setLoaderState_(self, v24, 0, v25);
    v30 = objc_msgSend_storedCompletion(self, v27, v28, v29);
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend_loadBagIfPossibleWithCompletion_(self, v31, (uint64_t)v30, v32);
  }
  else
  {
    if (v9 == 1) {
      char v33 = isImmediatelyReachable;
    }
    else {
      char v33 = 1;
    }
    if ((v33 & 1) == 0)
    {
      objc_msgSend_setURLRequestSession_(self, v24, 0, v25);
      objc_msgSend_setLoaderState_(self, v34, 2, v35);
    }
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (IDSServerBagConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (id)connectionMonitorBlock
{
  return self->_connectionMonitorBlock;
}

- (void)setConnectionMonitorBlock:(id)a3
{
}

- (id)URLSessionCreationBlock
{
  return self->_URLSessionCreationBlock;
}

- (void)setURLSessionCreationBlock:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (IMConnectionMonitor)connectionMonitor
{
  return self->_connectionMonitor;
}

- (void)setConnectionMonitor:(id)a3
{
}

- (IMURLRequestSession)URLRequestSession
{
  return self->_URLRequestSession;
}

- (void)setURLRequestSession:(id)a3
{
}

- (unint64_t)loaderState
{
  return self->_loaderState;
}

- (void)setLoaderState:(unint64_t)a3
{
  self->_loaderState = a3;
}

- (id)storedCompletion
{
  return self->_storedCompletion;
}

- (void)setStoredCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_storedCompletion, 0);
  objc_storeStrong((id *)&self->_URLRequestSession, 0);
  objc_storeStrong((id *)&self->_connectionMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_URLSessionCreationBlock, 0);
  objc_storeStrong(&self->_connectionMonitorBlock, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end