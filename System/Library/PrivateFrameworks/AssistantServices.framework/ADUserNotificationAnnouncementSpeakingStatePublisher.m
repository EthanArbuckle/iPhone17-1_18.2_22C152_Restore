@interface ADUserNotificationAnnouncementSpeakingStatePublisher
+ (BOOL)supportsPublishingArrivalForAceObject:(id)a3;
+ (id)_notificationIdentifiersForObject:(id)a3;
+ (id)sharedPublisher;
- (BOOL)_publishStateChanged:(int64_t)a3 forIdentifiers:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)_initWithQueue:(id)a3;
- (id)connectionProxy;
- (void)_invalidateConnection;
- (void)_publishCancelAndRemoveAllObjectsForReason:(id)a3;
- (void)_publishFinishedAndRemoveAllObjectsForReason:(id)a3;
- (void)_publishObjectHasArrived:(id)a3;
- (void)beginObserving;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
- (void)dealloc;
- (void)publishObjectHasArrived:(id)a3;
- (void)requestLifecycleObserver:(id)a3 requestDidEndWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6;
- (void)requestLifecycleObserver:(id)a3 requestWasCancelledWithInfo:(id)a4 forReason:(int64_t)a5 origin:(int64_t)a6 client:(id)a7 successorInfo:(id)a8;
- (void)requestLifecycleObserver:(id)a3 requestWillBeginWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6;
@end

@implementation ADUserNotificationAnnouncementSpeakingStatePublisher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_currentlyAnnouncingNotificationIdentifiers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_invalidateConnection
{
  [(NSXPCConnection *)self->_connection setExportedObject:0];
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;
}

- (void)connectionInvalidated
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[ADUserNotificationAnnouncementSpeakingStatePublisher connectionInvalidated]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007D574;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)connectionInterrupted
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[ADUserNotificationAnnouncementSpeakingStatePublisher connectionInterrupted]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007D67C;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)connectionProxy
{
  return [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_1004FFED0];
}

- (void)beginObserving
{
  v2 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    v4 = "-[ADUserNotificationAnnouncementSpeakingStatePublisher beginObserving]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s Beginning observations.", (uint8_t *)&v3, 0xCu);
  }
}

- (void)_publishFinishedAndRemoveAllObjectsForReason:(id)a3
{
  id v4 = a3;
  if ([(NSArray *)self->_currentlyAnnouncingNotificationIdentifiers count])
  {
    v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315394;
      v8 = "-[ADUserNotificationAnnouncementSpeakingStatePublisher _publishFinishedAndRemoveAllObjectsForReason:]";
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Request ended for reason \"%@\". Sending finished speaking state.", (uint8_t *)&v7, 0x16u);
    }
    [(ADUserNotificationAnnouncementSpeakingStatePublisher *)self _publishStateChanged:2 forIdentifiers:self->_currentlyAnnouncingNotificationIdentifiers];
    currentlyAnnouncingNotificationIdentifiers = self->_currentlyAnnouncingNotificationIdentifiers;
    self->_currentlyAnnouncingNotificationIdentifiers = 0;
  }
}

- (void)_publishCancelAndRemoveAllObjectsForReason:(id)a3
{
  id v4 = a3;
  if ([(NSArray *)self->_currentlyAnnouncingNotificationIdentifiers count])
  {
    v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315394;
      v8 = "-[ADUserNotificationAnnouncementSpeakingStatePublisher _publishCancelAndRemoveAllObjectsForReason:]";
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Request cancelled for reason \"%@\". Sending cancelled speaking state.", (uint8_t *)&v7, 0x16u);
    }
    [(ADUserNotificationAnnouncementSpeakingStatePublisher *)self _publishStateChanged:3 forIdentifiers:self->_currentlyAnnouncingNotificationIdentifiers];
    currentlyAnnouncingNotificationIdentifiers = self->_currentlyAnnouncingNotificationIdentifiers;
    self->_currentlyAnnouncingNotificationIdentifiers = 0;
  }
}

- (BOOL)_publishStateChanged:(int64_t)a3 forIdentifiers:(id)a4
{
  id v6 = a4;
  if (![v6 count])
  {
    v13 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
LABEL_9:
      BOOL v12 = 0;
      goto LABEL_10;
    }
    int v18 = 136315138;
    v19 = "-[ADUserNotificationAnnouncementSpeakingStatePublisher _publishStateChanged:forIdentifiers:]";
    v14 = "%s Cannot publish notification, no identifiers exist.";
    v15 = v13;
    uint32_t v16 = 12;
LABEL_12:
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v18, v16);
    goto LABEL_9;
  }
  char IsValidAndSpecified = AFSiriUserNotificationAnnouncementSpeakingStateGetIsValidAndSpecified();
  v8 = AFSiriLogContextDaemon;
  if ((IsValidAndSpecified & 1) == 0)
  {
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    int v18 = 136315394;
    v19 = "-[ADUserNotificationAnnouncementSpeakingStatePublisher _publishStateChanged:forIdentifiers:]";
    __int16 v20 = 2048;
    int64_t v21 = a3;
    v14 = "%s Cannot publish notification, invalid state %li";
    v15 = v8;
    uint32_t v16 = 22;
    goto LABEL_12;
  }
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    __int16 v9 = v8;
    id v10 = AFSiriUserNotificationAnnouncementSpeakingStateGetName();
    int v18 = 136315650;
    v19 = "-[ADUserNotificationAnnouncementSpeakingStatePublisher _publishStateChanged:forIdentifiers:]";
    __int16 v20 = 2112;
    int64_t v21 = (int64_t)v10;
    __int16 v22 = 2112;
    id v23 = v6;
  }
  v11 = [(ADUserNotificationAnnouncementSpeakingStatePublisher *)self connectionProxy];
  [v11 speakingStateDidChange:a3 forIdentifiers:v6];

  BOOL v12 = 1;
LABEL_10:

  return v12;
}

- (void)_publishObjectHasArrived:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() _notificationIdentifiersForObject:v4];
  if ([v5 count])
  {
    if (![(NSArray *)self->_currentlyAnnouncingNotificationIdentifiers isEqualToArray:v5]
      && [(NSArray *)self->_currentlyAnnouncingNotificationIdentifiers count])
    {
      [(ADUserNotificationAnnouncementSpeakingStatePublisher *)self _publishFinishedAndRemoveAllObjectsForReason:@"New object arrived and we are currently announcing."];
LABEL_8:
      int v7 = (NSArray *)[v5 copy];
      currentlyAnnouncingNotificationIdentifiers = self->_currentlyAnnouncingNotificationIdentifiers;
      self->_currentlyAnnouncingNotificationIdentifiers = v7;

      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v9 = v5;
      id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v20;
        do
        {
          v13 = 0;
          do
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v13);
            v15 = +[ADExternalNotificationRequestHandler sharedNotificationRequestHandler];
            [v15 markNotificationAsReadWithIdentifer:v14];

            v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v11);
      }

      [(ADUserNotificationAnnouncementSpeakingStatePublisher *)self _publishStateChanged:1 forIdentifiers:v9];
      goto LABEL_18;
    }
    if (![(NSArray *)self->_currentlyAnnouncingNotificationIdentifiers isEqualToArray:v5]) {
      goto LABEL_8;
    }
    id v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[ADUserNotificationAnnouncementSpeakingStatePublisher _publishObjectHasArrived:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Received identifiers that we're already announcing. This is most likely a hint. Ignoring publishing.", buf, 0xCu);
    }
  }
  else
  {
    uint32_t v16 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v17 = v16;
      int v18 = [v4 aceId];
      *(_DWORD *)buf = 136315394;
      v25 = "-[ADUserNotificationAnnouncementSpeakingStatePublisher _publishObjectHasArrived:]";
      __int16 v26 = 2112;
      v27 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Not publishing arrival, no identifiers exist for %@. Ignoring.", buf, 0x16u);
    }
  }
LABEL_18:
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  char HasEntitlement = AFConnectionHasEntitlement();
  if (HasEntitlement)
  {
    queue = self->_queue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10007DFD0;
    v10[3] = &unk_10050E160;
    v10[4] = self;
    id v11 = v5;
    dispatch_async(queue, v10);
  }
  else
  {
    v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[ADUserNotificationAnnouncementSpeakingStatePublisher listener:shouldAcceptNewConnection:]";
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s %@ Announcement Speaking State connection does not have required entitlements.", buf, 0x16u);
    }
  }

  return HasEntitlement;
}

- (void)requestLifecycleObserver:(id)a3 requestWasCancelledWithInfo:(id)a4 forReason:(int64_t)a5 origin:(int64_t)a6 client:(id)a7 successorInfo:(id)a8
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007E334;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)requestLifecycleObserver:(id)a3 requestDidEndWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007E3B8;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)requestLifecycleObserver:(id)a3 requestWillBeginWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007E43C;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)publishObjectHasArrived:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007E4E4;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)dealloc
{
  [(ADUserNotificationAnnouncementSpeakingStatePublisher *)self _publishCancelAndRemoveAllObjectsForReason:@"Dealloc called."];
  [(ADUserNotificationAnnouncementSpeakingStatePublisher *)self _invalidateConnection];
  v3.receiver = self;
  v3.super_class = (Class)ADUserNotificationAnnouncementSpeakingStatePublisher;
  [(ADUserNotificationAnnouncementSpeakingStatePublisher *)&v3 dealloc];
}

- (id)_initWithQueue:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ADUserNotificationAnnouncementSpeakingStatePublisher;
  id v6 = [(ADUserNotificationAnnouncementSpeakingStatePublisher *)&v13 init];
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    id v8 = +[ADRequestLifecycleObserver sharedObserver];
    [v8 addListener:p_isa];

    id v9 = objc_alloc((Class)NSXPCListener);
    id v10 = [v9 initWithMachServiceName:kAssistantAnnouncementSpeakingStateServiceName];
    id v11 = p_isa[4];
    p_isa[4] = v10;

    [p_isa[4] setDelegate:p_isa];
    [p_isa[4] resume];
  }

  return p_isa;
}

+ (id)_notificationIdentifiersForObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v4 = [v3 context];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v13 = [v3 configuration];
      id v4 = [v13 context];
    }
    else
    {
      id v4 = 0;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 identifier];
    id v6 = [v5 scheme];
    uint64_t v7 = AFSiriUserNotificationAnnounceScheme;
    unsigned int v8 = [v6 isEqualToString:AFSiriUserNotificationAnnounceScheme];

    if (v8)
    {
      id v9 = [v5 absoluteString];
      id v10 = +[NSString stringWithFormat:@"%@://", v7];
      id v11 = objc_msgSend(v9, "substringFromIndex:", objc_msgSend(v10, "length"));
      uint64_t v12 = [v11 componentsSeparatedByString:@"&"];
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsPublishingArrivalForAceObject:(id)a3
{
  id v4 = a3;
  id v5 = [v4 aceId];
  if ([v5 length])
  {
    id v6 = [a1 _notificationIdentifiersForObject:v4];
    BOOL v7 = [v6 count] != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (id)sharedPublisher
{
  if (qword_100585800 != -1) {
    dispatch_once(&qword_100585800, &stru_1004FFEB0);
  }
  v2 = (void *)qword_100585808;
  return v2;
}

@end