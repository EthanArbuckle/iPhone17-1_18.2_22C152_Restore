@interface CKMessagesComplicationDataProvider
- (BOOL)isConnectedToDaemon;
- (CKMessagesComplicationDataProvider)init;
- (IMDaemonMultiplexedConnectionManaging)daemonConnection;
- (NSHashTable)subscribers;
- (NSObject)observationToken;
- (OS_os_log)log;
- (id)currentSubscribers;
- (id)urlForLastMessage;
- (os_unfair_lock_s)lock;
- (void)addSubscriber:(id)a3;
- (void)connectToDaemon;
- (void)dealloc;
- (void)disconnectFromDaemon;
- (void)notifySubscribersAboutNewUnreadCount:(id)a3;
- (void)removeSubscriber:(id)a3;
- (void)setDaemonConnection:(id)a3;
- (void)setIsConnectedToDaemon:(BOOL)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setLog:(id)a3;
- (void)setObservationToken:(id)a3;
- (void)setSubscribers:(id)a3;
- (void)startUnreadCountObservation;
- (void)stopUnreadCountObservation;
@end

@implementation CKMessagesComplicationDataProvider

- (CKMessagesComplicationDataProvider)init
{
  v13.receiver = self;
  v13.super_class = (Class)CKMessagesComplicationDataProvider;
  v3 = [(CKMessagesComplicationDataProvider *)&v13 init];
  if (v3)
  {
    uint64_t v8 = objc_msgSend_hashTableWithOptions_(MEMORY[0x263F088B0], v2, v4, v5, v6, v7, 5);
    subscribers = v3->_subscribers;
    v3->_subscribers = (NSHashTable *)v8;

    os_log_t v10 = os_log_create("com.apple.Messages", "CKMessagesComplicationDataProvider");
    log = v3->_log;
    v3->_log = (OS_os_log *)v10;

    v3->_lock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

- (void)dealloc
{
  double v7 = objc_msgSend_subscribers(self, a2, v2, v3, v4, v5);
  objc_msgSend_removeAllObjects(v7, v8, v9, v10, v11, v12);

  objc_msgSend_stopUnreadCountObservation(self, v13, v14, v15, v16, v17);
  objc_msgSend_disconnectFromDaemon(self, v18, v19, v20, v21, v22);
  v23.receiver = self;
  v23.super_class = (Class)CKMessagesComplicationDataProvider;
  [(CKMessagesComplicationDataProvider *)&v23 dealloc];
}

- (void)addSubscriber:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  double v10 = objc_msgSend_subscribers(self, v5, v6, v7, v8, v9);
  objc_msgSend_addObject_(v10, v11, v12, v13, v14, v15, v4);

  double v21 = objc_msgSend_log(self, v16, v17, v18, v19, v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    sub_2388407D4((uint64_t)v4, v21);
  }

  v27 = objc_msgSend_subscribers(self, v22, v23, v24, v25, v26);
  uint64_t v33 = objc_msgSend_count(v27, v28, v29, v30, v31, v32);

  if (v33 == 1)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_23883CF38;
    block[3] = &unk_264D48A68;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_23883CF74;
    v34[3] = &unk_264D48A90;
    v34[4] = self;
    id v35 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v34);
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeSubscriber:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  double v10 = objc_msgSend_subscribers(self, v5, v6, v7, v8, v9);
  objc_msgSend_removeObject_(v10, v11, v12, v13, v14, v15, v4);

  double v21 = objc_msgSend_log(self, v16, v17, v18, v19, v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    sub_23884084C((uint64_t)v4, v21);
  }

  v27 = objc_msgSend_subscribers(self, v22, v23, v24, v25, v26);
  uint64_t v33 = objc_msgSend_count(v27, v28, v29, v30, v31, v32);

  if (!v33)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_23883D110;
    block[3] = &unk_264D48A68;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (id)currentSubscribers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double v9 = objc_msgSend_subscribers(self, v4, v5, v6, v7, v8);
  double v15 = objc_msgSend_copy(v9, v10, v11, v12, v13, v14);

  os_unfair_lock_unlock(p_lock);

  return v15;
}

- (void)connectToDaemon
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double v9 = objc_msgSend_daemonConnection(self, v4, v5, v6, v7, v8);

  if (!v9)
  {
    double v15 = objc_msgSend_sharedController(MEMORY[0x263F4A568], v10, v11, v12, v13, v14);
    double v16 = (objc_class *)objc_opt_class();
    double v17 = NSStringFromClass(v16);
    double v23 = objc_msgSend_multiplexedConnectionWithLabel_capabilities_context_(v15, v18, v19, v20, v21, v22, v17, 0x8000, 0);
    objc_msgSend_setDaemonConnection_(self, v24, v25, v26, v27, v28, v23);

    v34 = objc_msgSend_daemonConnection(self, v29, v30, v31, v32, v33);
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = sub_23883D2DC;
    v39[3] = &unk_264D48A68;
    v39[4] = self;
    objc_msgSend_connectWithCompletion_(v34, v35, COERCE_DOUBLE(3221225472), v36, v37, v38, v39);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)disconnectFromDaemon
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double v9 = objc_msgSend_daemonConnection(self, v4, v5, v6, v7, v8);
  objc_msgSend_invalidate(v9, v10, v11, v12, v13, v14);

  objc_msgSend_setDaemonConnection_(self, v15, v16, v17, v18, v19, 0);
  os_unfair_lock_unlock(p_lock);
  double v25 = objc_msgSend_log(self, v20, v21, v22, v23, v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    sub_2388408F8();
  }
}

- (void)startUnreadCountObservation
{
  double v7 = objc_msgSend_observationToken(self, a2, v2, v3, v4, v5);

  if (!v7)
  {
    double v13 = objc_msgSend_log(self, v8, v9, v10, v11, v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_23884092C();
    }

    id location = 0;
    objc_initWeak(&location, self);
    double v19 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v14, v15, v16, v17, v18);
    double v25 = objc_msgSend_mainQueue(MEMORY[0x263F08A48], v20, v21, v22, v23, v24);
    uint64_t v26 = *MEMORY[0x263F4A490];
    uint64_t v38 = MEMORY[0x263EF8330];
    uint64_t v39 = 3221225472;
    v40 = sub_23883D5F8;
    v41 = &unk_264D48AB8;
    objc_copyWeak(&v42, &location);
    double v32 = objc_msgSend_addObserverForName_object_queue_usingBlock_(v19, v27, v28, v29, v30, v31, v26, 0, v25, &v38);
    objc_msgSend_setObservationToken_(self, v33, v34, v35, v36, v37, v32, v38, v39, v40, v41);

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
  }
}

- (void)notifySubscribersAboutNewUnreadCount:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v10 = objc_msgSend_sharedRegistry(MEMORY[0x263F4A540], v5, v6, v7, v8, v9);
  uint64_t v16 = objc_msgSend_unreadCount(v10, v11, v12, v13, v14, v15);

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v17 = v4;
  uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, v19, v20, v21, v22, &v40, v48, 16);
  if (v23)
  {
    uint64_t v29 = v23;
    uint64_t v30 = *(void *)v41;
    *(void *)&long long v25 = 138543618;
    long long v39 = v25;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v41 != v30) {
          objc_enumerationMutation(v17);
        }
        double v32 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        objc_msgSend_unreadCountDidChange_(v32, v24, *(double *)&v25, v26, v27, v28, v16, v39, (void)v40);
        uint64_t v38 = objc_msgSend_log(self, v33, v34, v35, v36, v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v39;
          v45 = v32;
          __int16 v46 = 2050;
          uint64_t v47 = v16;
          _os_log_debug_impl(&dword_23883B000, v38, OS_LOG_TYPE_DEBUG, "notifed subscriber %{public}@ of unread count: %{public}lu", buf, 0x16u);
        }
      }
      uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v24, *(double *)&v25, v26, v27, v28, &v40, v48, 16);
    }
    while (v29);
  }
}

- (void)stopUnreadCountObservation
{
  double v7 = objc_msgSend_log(self, a2, v2, v3, v4, v5);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_238840960();
  }

  double v13 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v8, v9, v10, v11, v12);
  double v19 = objc_msgSend_observationToken(self, v14, v15, v16, v17, v18);
  objc_msgSend_removeObserver_(v13, v20, v21, v22, v23, v24, v19);

  objc_msgSend_setObservationToken_(self, v25, v26, v27, v28, v29, 0);
}

- (id)urlForLastMessage
{
  double v7 = objc_msgSend_URLWithString_(NSURL, a2, v2, v3, v4, v5, @"com.apple.MobileSMS");
  double v13 = objc_msgSend_sharedRegistry(MEMORY[0x263F4A540], v8, v9, v10, v11, v12);
  uint64_t v19 = objc_msgSend_numberOfExistingChats(v13, v14, v15, v16, v17, v18);

  if (v19)
  {
    uint64_t v51 = 0;
    v52 = &v51;
    uint64_t v53 = 0x3032000000;
    v54 = sub_23883DA7C;
    v55 = sub_23883DA8C;
    id v56 = 0;
    long long v25 = objc_msgSend_sharedRegistry(MEMORY[0x263F4A540], v20, COERCE_DOUBLE(0x3032000000), v22, v23, v24);
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = sub_23883DA94;
    v50[3] = &unk_264D48AE0;
    v50[4] = &v51;
    objc_msgSend__loadChatsFilteredUsingPredicate_lastMessageOlderThan_limit_waitForReply_completionHandler_(v25, v26, COERCE_DOUBLE(3221225472), v27, v28, v29, 0, 0, 1, 1, v50);

    double v35 = (void *)v52[5];
    if (v35 && objc_msgSend_unreadMessageCount(v35, v30, v31, v32, v33, v34))
    {
      long long v41 = objc_msgSend_sharedRegistry(MEMORY[0x263F4A540], v36, v37, v38, v39, v40);
      uint64_t v47 = objc_msgSend_messagesURLWithChat_orHandles_withMessageText_(v41, v42, v43, v44, v45, v46, v52[5], 0, 0);

      double v7 = (void *)v47;
    }
    _Block_object_dispose(&v51, 8);
  }
  else
  {
    v48 = objc_msgSend_log(self, v20, v21, v22, v23, v24);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
      sub_238840994();
    }
  }

  return v7;
}

- (NSHashTable)subscribers
{
  return self->_subscribers;
}

- (void)setSubscribers:(id)a3
{
}

- (NSObject)observationToken
{
  return self->_observationToken;
}

- (void)setObservationToken:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
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

- (IMDaemonMultiplexedConnectionManaging)daemonConnection
{
  return self->_daemonConnection;
}

- (void)setDaemonConnection:(id)a3
{
}

- (BOOL)isConnectedToDaemon
{
  return self->_isConnectedToDaemon;
}

- (void)setIsConnectedToDaemon:(BOOL)a3
{
  self->_isConnectedToDaemon = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonConnection, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_observationToken, 0);

  objc_storeStrong((id *)&self->_subscribers, 0);
}

@end