@interface _NSProgressSubscriber
- (_NSProgressSubscriber)initWithPublishingHandler:(id)a3;
- (void)addPublisher:(id)a3 forID:(id)a4 withValues:(id)a5 isOld:(BOOL)a6;
- (void)dealloc;
- (void)observePublisherForID:(id)a3 values:(id)a4 forKeys:(id)a5;
- (void)observePublisherUserInfoForID:(id)a3 value:(id)a4 forKey:(id)a5;
- (void)removePublisherForID:(id)a3;
- (void)startForCategory:(id)a3;
- (void)startForFileURL:(id)a3;
- (void)stop;
@end

@implementation _NSProgressSubscriber

- (void)observePublisherUserInfoForID:(id)a3 value:(id)a4 forKey:(id)a5
{
  [(NSLock *)self->_lock lock];
  id v9 = (id)[(NSMutableDictionary *)self->_proxiesByPublisherID objectForKey:a3];
  [(NSLock *)self->_lock unlock];
  [v9 _setRemoteUserInfoValue:a4 forKey:a5];
}

- (_NSProgressSubscriber)initWithPublishingHandler:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)_NSProgressSubscriber;
  v4 = [(_NSProgressSubscriber *)&v6 init];
  if (v4)
  {
    v4->_publishingHandler = (id)[a3 copy];
    v4->_subscriberID = [+[NSUUID UUID] UUIDString];
    v4->_proxiesByPublisherID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4->_lock = (NSLock *)objc_opt_new();
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (self->_started) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSProgress: you invoked +[NSProgress addSubscriber...] but then didn't pass the result to +[NSProgress removeSubscriber:] before it was released. Not allowed." userInfo:0]);
  }

  v3.receiver = self;
  v3.super_class = (Class)_NSProgressSubscriber;
  [(_NSProgressSubscriber *)&v3 dealloc];
}

- (void)startForCategory:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_lock lock];
  if (!self->_started)
  {
    self->_started = 1;
    v5 = [+[NSBundle mainBundle] bundleIdentifier];
    objc_super v6 = _NSProgressIPCDebugLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = _NSProgressIPCDebugLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        subscriberID = self->_subscriberID;
        int v10 = 134218498;
        v11 = self;
        __int16 v12 = 2114;
        v13 = subscriberID;
        __int16 v14 = 2114;
        id v15 = a3;
        _os_log_debug_impl(&dword_181795000, v8, OS_LOG_TYPE_DEBUG, "<NSProgressSubscriber %p> Start for ID %{public}@ category %{public}@", (uint8_t *)&v10, 0x20u);
      }
    }
    objc_msgSend((id)objc_msgSend(+[NSProgress _serverConnection](NSProgress, "_serverConnection", v7), "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_91), "addSubscriber:forID:appBundleID:category:completionHandler:", self, self->_subscriberID, -[NSString lowercaseString](v5, "lowercaseString"), objc_msgSend(a3, "lowercaseString"), &__block_literal_global_13_1);
  }
  [(NSLock *)self->_lock unlock];
}

- (void)startForFileURL:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_lock lock];
  if (!self->_started)
  {
    self->_started = 1;
    v5 = [+[NSBundle mainBundle] bundleIdentifier];
    objc_super v6 = _NSProgressIPCDebugLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = _NSProgressIPCDebugLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        subscriberID = self->_subscriberID;
        int v10 = 134218499;
        v11 = self;
        __int16 v12 = 2114;
        v13 = subscriberID;
        __int16 v14 = 2113;
        id v15 = a3;
        _os_log_debug_impl(&dword_181795000, v8, OS_LOG_TYPE_DEBUG, "<NSProgressSubscriber %p> Start for ID %{public}@ URL %{private}@", (uint8_t *)&v10, 0x20u);
      }
    }
    objc_msgSend((id)objc_msgSend(+[NSProgress _serverConnection](NSProgress, "_serverConnection", v7), "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_16), "addSubscriber:forID:appBundleID:fileURL:completionHandler:", self, self->_subscriberID, -[NSString lowercaseString](v5, "lowercaseString"), a3, &__block_literal_global_18_0);
  }
  [(NSLock *)self->_lock unlock];
}

- (void)stop
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_super v3 = _NSProgressIPCDebugLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = _NSProgressIPCDebugLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      subscriberID = self->_subscriberID;
      int v6 = 134218242;
      uint64_t v7 = self;
      __int16 v8 = 2114;
      id v9 = subscriberID;
      _os_log_debug_impl(&dword_181795000, v4, OS_LOG_TYPE_DEBUG, "<NSProgressSubscriber %p> Stop for ID %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
  [(NSLock *)self->_lock lock];
  [(NSMutableDictionary *)self->_proxiesByPublisherID enumerateKeysAndObjectsUsingBlock:&__block_literal_global_21_0];
  [(NSMutableDictionary *)self->_proxiesByPublisherID removeAllObjects];
  objc_msgSend((id)objc_msgSend(+[NSProgress _serverConnection](NSProgress, "_serverConnection"), "remoteObjectProxy"), "removeSubscriberForID:", self->_subscriberID);
  self->_started = 0;
  [(NSLock *)self->_lock unlock];
}

- (void)addPublisher:(id)a3 forID:(id)a4 withValues:(id)a5 isOld:(BOOL)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = [[_NSProgressProxy alloc] _initWithForwarder:a3 values:a5 isOld:a6];
  [(NSLock *)self->_lock lock];
  BOOL started = self->_started;
  if (self->_started) {
    [(NSMutableDictionary *)self->_proxiesByPublisherID setObject:v9 forKey:a4];
  }
  [(NSLock *)self->_lock unlock];
  v11 = _NSProgressIPCDebugLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    __int16 v12 = _NSProgressIPCDebugLog();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
    if (started)
    {
      if (v13)
      {
        *(_DWORD *)buf = 134218498;
        uint64_t v16 = self;
        __int16 v17 = 2048;
        id v18 = a3;
        __int16 v19 = 2114;
        id v20 = a4;
        _os_log_debug_impl(&dword_181795000, v12, OS_LOG_TYPE_DEBUG, "<NSProgressSubscriber %p> Add publisher %p forID: %{public}@", buf, 0x20u);
      }
      goto LABEL_8;
    }
    if (v13)
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v16 = self;
      __int16 v17 = 2048;
      id v18 = a3;
      __int16 v19 = 2114;
      id v20 = a4;
      _os_log_debug_impl(&dword_181795000, v12, OS_LOG_TYPE_DEBUG, "<NSProgressSubscriber %p> Ignoring add publisher %p forID: %{public}@, because subscriber is stopped", buf, 0x20u);
    }
  }
  else if (started)
  {
LABEL_8:
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61___NSProgressSubscriber_addPublisher_forID_withValues_isOld___block_invoke;
    v14[3] = &unk_1E51FED60;
    v14[4] = self;
    v14[5] = a4;
    [v9 _invokePublishingHandler:v14];
  }
}

- (void)observePublisherForID:(id)a3 values:(id)a4 forKeys:(id)a5
{
  [(NSLock *)self->_lock lock];
  id v9 = (id)[(NSMutableDictionary *)self->_proxiesByPublisherID objectForKey:a3];
  [(NSLock *)self->_lock unlock];
  [v9 _setRemoteValues:a4 forKeys:a5];
}

- (void)removePublisherForID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_lock lock];
  v5 = (void *)[(NSMutableDictionary *)self->_proxiesByPublisherID objectForKey:a3];
  int v6 = _NSProgressIPCDebugLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = _NSProgressIPCDebugLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 134218242;
      id v9 = self;
      __int16 v10 = 2114;
      id v11 = a3;
      _os_log_debug_impl(&dword_181795000, v7, OS_LOG_TYPE_DEBUG, "<NSProgressSubscriber %p> Remove publisher forID: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  [v5 _invokeUnpublishingHandler];
  [(NSMutableDictionary *)self->_proxiesByPublisherID removeObjectForKey:a3];
  [(NSLock *)self->_lock unlock];
}

@end