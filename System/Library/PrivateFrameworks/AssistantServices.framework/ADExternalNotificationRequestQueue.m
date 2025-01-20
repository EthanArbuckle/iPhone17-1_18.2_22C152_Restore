@interface ADExternalNotificationRequestQueue
- (ADAnnounceNotificationRequest)currentRequest;
- (ADExternalNotificationRequestQueue)init;
- (BOOL)_isAnnounceNotificationRequest:(id)a3 equalToRequest:(id)a4;
- (BOOL)removeAnnouncementRequest:(id)a3;
- (id)_identifierForNotificationRequest:(id)a3;
- (id)_lastRequestIdentifierInQueue;
- (id)_nextRequestIdentifier;
- (id)nextAnnouncementRequest;
- (id)notificationRequestForNotificationIdentifierInAnnouncementQueue:(id)a3;
- (int64_t)_lastRequestAnnouncementTypeInQueue;
- (unint64_t)_numberOfNotificationRequests;
- (unint64_t)_numberOfThreads;
- (void)clearRequestQueue;
- (void)completeCurrentRequestWithSuccess:(BOOL)a3 forReason:(int64_t)a4 shouldEmitInstrumentationEvent:(BOOL)a5;
- (void)deliverSummary:(id)a3 forNotificationWithIdentifier:(id)a4 completion:(id)a5;
- (void)enqueueAnnouncementRequest:(id)a3;
- (void)fetchUnreadNotificationsFromThreadAfterNotificationWithID:(id)a3 completion:(id)a4;
- (void)markNotificationAsReadWithIdentifer:(id)a3;
- (void)setCurrentRequest:(id)a3;
- (void)setDelgate:(id)a3;
@end

@implementation ADExternalNotificationRequestQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resettingBurstTimer, 0);
  objc_storeStrong((id *)&self->_maxTimeEnqueueableTimer, 0);
  objc_storeStrong((id *)&self->_timersQueue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_queuedRequestMap, 0);
  objc_storeStrong((id *)&self->_queuedNotificationRequestIdentifiers, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
}

- (void)setCurrentRequest:(id)a3
{
}

- (ADAnnounceNotificationRequest)currentRequest
{
  return self->_currentRequest;
}

- (unint64_t)_numberOfNotificationRequests
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(NSMutableDictionary *)self->_queuedRequestMap objectEnumerator];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += (unint64_t)[*(id *)(*((void *)&v9 + 1) + 8 * i) count];
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)_numberOfThreads
{
  v2 = [(NSMutableDictionary *)self->_queuedRequestMap allKeys];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (void)markNotificationAsReadWithIdentifer:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(AFQueue *)self->_queuedNotificationRequestIdentifiers frontObject];
  if (v5)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v19 = v5;
    uint64_t v6 = [(NSMutableDictionary *)self->_queuedRequestMap objectForKey:v5];
    id v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          long long v12 = [v11 notification];
          v13 = [v12 request];

          v14 = [v13 identifier];
          unsigned int v15 = [v14 isEqualToString:v4];

          if (v15)
          {
            v16 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v25 = "-[ADExternalNotificationRequestQueue markNotificationAsReadWithIdentifer:]";
              __int16 v26 = 2112;
              id v27 = v4;
              _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s found request with identifier: %@ in request queue", buf, 0x16u);
            }
            v17 = [v11 completion];

            if (v17) {
              [v11 completeRequestWithSuccess:1 forReason:1 shouldEmitInstrumentationEvent:1];
            }
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v8);
    }

    unint64_t v5 = v19;
  }
  else
  {
    v18 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[ADExternalNotificationRequestQueue markNotificationAsReadWithIdentifer:]";
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s No active announcement request", buf, 0xCu);
    }
  }
}

- (void)fetchUnreadNotificationsFromThreadAfterNotificationWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v35 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v8 = [(AFQueue *)self->_queuedNotificationRequestIdentifiers frontObject];
  uint64_t v9 = (void *)v8;
  if (v8)
  {
    v33 = (void *)v8;
    v34 = v7;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v10 = [(NSMutableDictionary *)self->_queuedRequestMap objectForKey:v8];
    id v11 = [v10 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v11)
    {
      id v12 = v11;
      char v13 = 0;
      uint64_t v14 = *(void *)v38;
      do
      {
        unsigned int v15 = 0;
        id v36 = v12;
        do
        {
          if (*(void *)v38 != v14) {
            objc_enumerationMutation(v10);
          }
          v16 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v15);
          v17 = [v16 notification];
          v18 = [v17 request];

          v19 = [v18 identifier];
          unsigned int v20 = [v19 isEqualToString:v6];

          if (v20)
          {
            long long v21 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v42 = "-[ADExternalNotificationRequestQueue fetchUnreadNotificationsFromThreadAfterNotificationWithID:completion:]";
              __int16 v43 = 2112;
              id v44 = v6;
              _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%s found request with identifier: %@ in request queue", buf, 0x16u);
            }
            char v13 = 1;
          }
          else if (v13)
          {
            char v13 = 1;
            [v16 completeRequestWithSuccess:1 forReason:1 shouldEmitInstrumentationEvent:1];
            id v22 = objc_alloc_init((Class)AFBulletin);
            long long v23 = [v16 notification];
            [v16 appID];
            uint64_t v24 = v14;
            id v25 = v6;
            v27 = __int16 v26 = v10;
            [v22 setNotification:v23 fromSourceApp:v27];

            objc_msgSend(v22, "setAnnouncementType:", objc_msgSend(v16, "announcementType"));
            v28 = [v16 summary];
            v29 = [v28 summary];
            [v22 setSummary:v29];

            v30 = [v16 notification];
            v31 = [v30 request];
            [v22 setNotificationRequest:v31];

            long long v10 = v26;
            id v6 = v25;
            uint64_t v14 = v24;
            id v12 = v36;

            [v35 addObject:v22];
          }
          else
          {
            char v13 = 0;
          }

          unsigned int v15 = (char *)v15 + 1;
        }
        while (v12 != v15);
        id v12 = [v10 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v12);
    }

    uint64_t v9 = v33;
    id v7 = v34;
  }
  else
  {
    v32 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v42 = "-[ADExternalNotificationRequestQueue fetchUnreadNotificationsFromThreadAfterNotificationWithID:completion:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "%s No notification thread found in queue", buf, 0xCu);
    }
  }
  v7[2](v7, v35);
}

- (BOOL)removeAnnouncementRequest:(id)a3
{
  id v4 = (ADAnnounceNotificationRequest *)a3;
  unint64_t v5 = v4;
  if (!v4)
  {
LABEL_10:
    BOOL v11 = 0;
    goto LABEL_14;
  }
  if (self->_currentRequest == v4)
  {
    id v12 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[ADExternalNotificationRequestQueue removeAnnouncementRequest:]";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Current request is equal to request we are trying to remove. Ignoring as this is not supported.", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_10;
  }
  id v6 = [(ADAnnouncementRequest *)v4 completion];

  if (!v6)
  {
    char v13 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[ADExternalNotificationRequestQueue removeAnnouncementRequest:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s Request to be removed has no completion, meaning we've already completed this request. Ignoring as this is not supported.", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_10;
  }
  id v7 = [(ADExternalNotificationRequestQueue *)self _identifierForNotificationRequest:v5];
  uint64_t v8 = [(NSMutableDictionary *)self->_queuedRequestMap objectForKey:v7];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10014AED0;
  v16[3] = &unk_1005038E8;
  v16[4] = self;
  uint64_t v9 = v5;
  v17 = v9;
  p_long long buf = &buf;
  [v8 enumerateObjectsUsingBlock:v16];
  uint64_t v10 = *(void *)(*((void *)&buf + 1) + 24);
  BOOL v11 = v10 != 0x7FFFFFFFFFFFFFFFLL;
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v19 = 136315394;
      unsigned int v20 = "-[ADExternalNotificationRequestQueue removeAnnouncementRequest:]";
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%s Couldn't find request to remove: %@", v19, 0x16u);
    }
  }
  else
  {
    objc_msgSend(v8, "removeObjectAtIndex:");
    [(ADAnnouncementRequest *)v9 completeRequestWithSuccess:0 forReason:6 shouldEmitInstrumentationEvent:1];
    [(NSMutableDictionary *)self->_queuedRequestMap setObject:v8 forKey:v7];
  }

  _Block_object_dispose(&buf, 8);
LABEL_14:

  return v11;
}

- (id)notificationRequestForNotificationIdentifierInAnnouncementQueue:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x3032000000;
  unsigned int v15 = sub_10014B10C;
  v16 = sub_10014B11C;
  id v17 = 0;
  queuedRequestMap = self->_queuedRequestMap;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10014B124;
  v9[3] = &unk_1005038C0;
  id v6 = v4;
  id v10 = v6;
  BOOL v11 = &v12;
  [(NSMutableDictionary *)queuedRequestMap enumerateKeysAndObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)_isAnnounceNotificationRequest:(id)a3 equalToRequest:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 notification];
  uint64_t v8 = [v7 request];
  uint64_t v9 = [v8 identifier];
  id v10 = [v5 notification];
  BOOL v11 = [v10 request];
  uint64_t v12 = [v11 identifier];
  unsigned int v13 = [v9 isEqualToString:v12];

  uint64_t v14 = [v6 appID];
  unsigned int v15 = [v5 appID];
  unsigned __int8 v16 = [v14 isEqualToString:v15];

  id v17 = [v6 platform];
  id v18 = [v5 platform];

  if (!v13) {
    return 0;
  }
  if (v17 == v18) {
    return v16;
  }
  return 0;
}

- (void)clearRequestQueue
{
  currentRequest = self->_currentRequest;
  self->_currentRequest = 0;

  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    v19 = "-[ADExternalNotificationRequestQueue clearRequestQueue]";
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s clearing request queue", buf, 0xCu);
  }
  [(AFWatchdogTimer *)self->_maxTimeEnqueueableTimer cancel];
  [(AFWatchdogTimer *)self->_resettingBurstTimer cancel];
  maxTimeEnqueueableTimer = self->_maxTimeEnqueueableTimer;
  self->_maxTimeEnqueueableTimer = 0;

  resettingBurstTimer = self->_resettingBurstTimer;
  self->_resettingBurstTimer = 0;

  while ([(AFQueue *)self->_queuedNotificationRequestIdentifiers count])
  {
    id v7 = [(AFQueue *)self->_queuedNotificationRequestIdentifiers dequeueObject];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v8 = -[NSMutableDictionary objectForKey:](self->_queuedRequestMap, "objectForKey:", v7, 0);
    id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) completeRequestWithSuccess:0 forReason:9 shouldEmitInstrumentationEvent:0];
          uint64_t v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
  [(NSMutableDictionary *)self->_queuedRequestMap removeAllObjects];
}

- (void)completeCurrentRequestWithSuccess:(BOOL)a3 forReason:(int64_t)a4 shouldEmitInstrumentationEvent:(BOOL)a5
{
  if (self->_currentRequest)
  {
    BOOL v5 = a5;
    BOOL v7 = a3;
    [(AFWatchdogTimer *)self->_maxTimeEnqueueableTimer cancel];
    [(AFWatchdogTimer *)self->_resettingBurstTimer cancel];
    id v9 = [(ADExternalNotificationRequestQueue *)self _identifierForNotificationRequest:self->_currentRequest];
    id v10 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      id v17 = v10;
      if ((unint64_t)a4 > 0x10) {
        id v18 = @"(unknown)";
      }
      else {
        id v18 = *(&off_100504598 + a4);
      }
      v19 = v18;
      *(_DWORD *)long long buf = 136315906;
      __int16 v26 = "-[ADExternalNotificationRequestQueue completeCurrentRequestWithSuccess:forReason:shouldEmitInstrumentationEvent:]";
      __int16 v27 = 2112;
      v28 = v9;
      __int16 v29 = 1024;
      BOOL v30 = v7;
      __int16 v31 = 2112;
      v32 = v19;
      _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s completing request with id: %@ with success: %d for reason: %@", buf, 0x26u);
    }
    [(ADAnnouncementRequest *)self->_currentRequest completeRequestWithSuccess:v7 forReason:a4 shouldEmitInstrumentationEvent:v5];
    if (!v7)
    {
      uint64_t v11 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 136315138;
        __int16 v26 = "-[ADExternalNotificationRequestQueue completeCurrentRequestWithSuccess:forReason:shouldEmitInstrumentationEvent:]";
        _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s request failed, mark all requests in thread with failure", buf, 0xCu);
      }
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v12 = -[NSMutableDictionary objectForKey:](self->_queuedRequestMap, "objectForKey:", v9, 0);
      id v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v21;
        do
        {
          long long v16 = 0;
          do
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(v12);
            }
            [*(id *)(*((void *)&v20 + 1) + 8 * (void)v16) completeRequestWithSuccess:0 forReason:a4 shouldEmitInstrumentationEvent:v5];
            long long v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          id v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v14);
      }
    }
  }
}

- (id)_nextRequestIdentifier
{
  return [(AFQueue *)self->_queuedNotificationRequestIdentifiers frontObject];
}

- (id)nextAnnouncementRequest
{
  if (self->_currentRequest)
  {
    id v3 = [(AFQueue *)self->_queuedNotificationRequestIdentifiers frontObject];
    id v4 = objc_alloc_init((Class)NSMutableArray);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    BOOL v5 = -[NSMutableDictionary objectForKey:](self->_queuedRequestMap, "objectForKey:", v3, 0);
    id v6 = [v5 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v32;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v32 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v11 = [v10 completion];

          if (v11) {
            [v4 addObject:v10];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v7);
    }

    if ([v4 count])
    {
      uint64_t v12 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        __int16 v29 = v12;
        BOOL v30 = (ADAnnounceNotificationRequest *)[v4 count];
        *(_DWORD *)long long buf = 136315394;
        id v36 = "-[ADExternalNotificationRequestQueue nextAnnouncementRequest]";
        __int16 v37 = 2048;
        long long v38 = v30;
        _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "%s %lu unread notifications, starting request at first unread notification", buf, 0x16u);
      }
      [(NSMutableDictionary *)self->_queuedRequestMap setObject:v4 forKey:v3];
      goto LABEL_23;
    }
    uint64_t v15 = [(AFQueue *)self->_queuedNotificationRequestIdentifiers dequeueObject];
    if (v15)
    {
      [(NSMutableDictionary *)self->_queuedRequestMap removeObjectForKey:v15];
      long long v16 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 136315394;
        id v36 = "-[ADExternalNotificationRequestQueue nextAnnouncementRequest]";
        __int16 v37 = 2112;
        long long v38 = v15;
        id v17 = "%s removing %@ and associated requests from the request queue";
        id v18 = v16;
        uint32_t v19 = 22;
LABEL_35:
        _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, v17, buf, v19);
      }
    }
    else
    {
      long long v20 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 136315138;
        id v36 = "-[ADExternalNotificationRequestQueue nextAnnouncementRequest]";
        id v17 = "%s old request queue is empty";
        id v18 = v20;
        uint32_t v19 = 12;
        goto LABEL_35;
      }
    }

LABEL_23:
    long long v21 = [(ADExternalNotificationRequestQueue *)self _nextRequestIdentifier];
    if (v21)
    {
      long long v22 = [(NSMutableDictionary *)self->_queuedRequestMap objectForKey:v21];
      long long v23 = [v22 firstObject];
      currentRequest = self->_currentRequest;
      self->_currentRequest = v23;
    }
    else
    {
      uint64_t v25 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 136315138;
        id v36 = "-[ADExternalNotificationRequestQueue nextAnnouncementRequest]";
        _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%s request queue is empty, returning nil", buf, 0xCu);
      }
      long long v22 = self->_currentRequest;
      self->_currentRequest = 0;
    }

    __int16 v26 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      v28 = self->_currentRequest;
      *(_DWORD *)long long buf = 136315394;
      id v36 = "-[ADExternalNotificationRequestQueue nextAnnouncementRequest]";
      __int16 v37 = 2112;
      long long v38 = v28;
      _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "%s next request is %@", buf, 0x16u);
    }
    id v14 = self->_currentRequest;

    goto LABEL_31;
  }
  id v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    id v36 = "-[ADExternalNotificationRequestQueue nextAnnouncementRequest]";
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s no current request, returning nil for next request", buf, 0xCu);
  }
  id v14 = 0;
LABEL_31:
  return v14;
}

- (void)deliverSummary:(id)a3 forNotificationWithIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (ADAnnounceNotificationRequest *)a4;
  id v10 = (void (**)(id, uint64_t))a5;
  if (v10)
  {
    uint64_t v11 = [(ADExternalNotificationRequestQueue *)self notificationRequestForNotificationIdentifierInAnnouncementQueue:v9];
    uint64_t v12 = AFSiriLogContextDaemon;
    if (v11)
    {
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 136315394;
        __int16 v29 = "-[ADExternalNotificationRequestQueue deliverSummary:forNotificationWithIdentifier:completion:]";
        __int16 v30 = 2112;
        long long v31 = v11;
        _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s Found request, setting summary on %@", buf, 0x16u);
      }
      [(ADAnnounceNotificationRequest *)v11 setSummary:v8];
      if (self->_currentRequest == v11)
      {
        [(ADExternalNotificationRequestQueue *)self _identifierForNotificationRequest:v11];
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = v26 = 0u;
        id v13 = -[NSMutableDictionary objectForKey:](self->_queuedRequestMap, "objectForKey:");
        id v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v24;
          while (2)
          {
            for (i = 0; i != v15; i = (char *)i + 1)
            {
              if (*(void *)v24 != v16) {
                objc_enumerationMutation(v13);
              }
              id v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
              if ([v18 summaryDecision] == (id)2)
              {
                uint32_t v19 = [v18 summary];

                if (!v19)
                {
                  long long v21 = AFSiriLogContextDaemon;
                  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)long long buf = 136315138;
                    __int16 v29 = "-[ADExternalNotificationRequestQueue deliverSummary:forNotificationWithIdentifier:completion:]";
                    _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%s There is still a notification pending a summary in this thread, don't announce yet.", buf, 0xCu);
                  }
                  v10[2](v10, 1);

                  goto LABEL_10;
                }
              }
            }
            id v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }

        long long v20 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 136315138;
          __int16 v29 = "-[ADExternalNotificationRequestQueue deliverSummary:forNotificationWithIdentifier:completion:]";
          _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%s Summary has been set for last notification pending a summary in thread, announcing it", buf, 0xCu);
        }
        [(AFWatchdogTimer *)self->_resettingBurstTimer cancel];
        [(AFWatchdogTimer *)self->_maxTimeEnqueueableTimer cancel];
        [(ADExternalNotificationRequestQueueObserver *)self->_delegate announcementRequestReadyToBeAnnounced:self->_currentRequest];
      }
      v10[2](v10, 1);
    }
    else
    {
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        __int16 v29 = "-[ADExternalNotificationRequestQueue deliverSummary:forNotificationWithIdentifier:completion:]";
        __int16 v30 = 2112;
        long long v31 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Unable to find request with notificationIdentifier: %@", buf, 0x16u);
      }
      v10[2](v10, 0);
    }
LABEL_10:
  }
}

- (void)enqueueAnnouncementRequest:(id)a3
{
  id v5 = a3;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_10014C82C;
  v48[3] = &unk_100503898;
  v48[4] = self;
  id v6 = objc_retainBlock(v48);
  id v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315394;
    v50 = "-[ADExternalNotificationRequestQueue enqueueAnnouncementRequest:]";
    __int16 v51 = 2112;
    id v52 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s enqueueing request: %@", buf, 0x16u);
  }
  id v8 = [(ADExternalNotificationRequestQueue *)self _identifierForNotificationRequest:v5];
  if (self->_currentRequest)
  {
    int64_t v9 = [(ADAnnounceNotificationRequest *)self->_currentRequest announcementType];
    id v10 = [v5 announcementType];
    int64_t v11 = [(ADExternalNotificationRequestQueue *)self _lastRequestAnnouncementTypeInQueue];
    uint64_t v12 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      log = v12;
      long long v39 = AFSiriUserNotificationAnnouncementTypeGetName();
      long long v38 = AFSiriUserNotificationAnnouncementTypeGetName();
      uint64_t v36 = AFSiriUserNotificationAnnouncementTypeGetName();
      *(_DWORD *)long long buf = 136315906;
      v50 = "-[ADExternalNotificationRequestQueue enqueueAnnouncementRequest:]";
      __int16 v51 = 2112;
      id v52 = v39;
      __int16 v53 = 2112;
      v54 = v38;
      __int16 v55 = 2112;
      uint64_t v56 = v36;
      __int16 v37 = (void *)v36;
      _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s current request type: %@, tail request type: %@, incoming announcement Type: %@", buf, 0x2Au);
    }
    if (v10 == (id)1)
    {
      id v13 = [(NSMutableDictionary *)self->_queuedRequestMap objectForKey:v8];
      id v14 = AFSiriLogContextDaemon;
      BOOL v15 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
      if (v13)
      {
        if (v15)
        {
          *(_DWORD *)long long buf = 136315394;
          v50 = "-[ADExternalNotificationRequestQueue enqueueAnnouncementRequest:]";
          __int16 v51 = 2112;
          id v52 = v8;
          _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%s found a thread id match for message announcement, adding it to: %@", buf, 0x16u);
        }
        [v13 addObject:v5];
        uint64_t v16 = [(ADExternalNotificationRequestQueue *)self _identifierForNotificationRequest:v5];
        unsigned int v17 = [v8 isEqualToString:v16];

        if (v17 && [v5 supportsImmediateBurstMode])
        {
          id v18 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 136315138;
            v50 = "-[ADExternalNotificationRequestQueue enqueueAnnouncementRequest:]";
            _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%s resetting burst timer for queue", buf, 0xCu);
          }
          [(AFWatchdogTimer *)self->_resettingBurstTimer reset];
        }
      }
      else
      {
        if (v15)
        {
          *(_DWORD *)long long buf = 136315394;
          v50 = "-[ADExternalNotificationRequestQueue enqueueAnnouncementRequest:]";
          __int16 v51 = 2112;
          id v52 = v8;
          _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%s No thread id match for message announcement, enqueue request: %@", buf, 0x16u);
        }
        ((void (*)(void *, id, void *))v6[2])(v6, v5, v8);
      }
      goto LABEL_33;
    }
    if (v10 == (id)v9)
    {
      id v13 = [(ADExternalNotificationRequestQueue *)self _identifierForNotificationRequest:self->_currentRequest];
      __int16 v30 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 136315394;
        v50 = "-[ADExternalNotificationRequestQueue enqueueAnnouncementRequest:]";
        __int16 v51 = 2112;
        id v52 = v13;
        _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%s same type as current request, adding it to the current request's queue %@", buf, 0x16u);
      }
      long long v31 = [(NSMutableDictionary *)self->_queuedRequestMap objectForKey:v13];
      [v31 addObject:v5];
      if ([v5 supportsImmediateBurstMode])
      {
        long long v32 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 136315138;
          v50 = "-[ADExternalNotificationRequestQueue enqueueAnnouncementRequest:]";
          _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "%s resetting burst timer for queue", buf, 0xCu);
        }
        [(AFWatchdogTimer *)self->_resettingBurstTimer reset];
      }

      goto LABEL_33;
    }
    long long v33 = AFSiriLogContextDaemon;
    BOOL v34 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
    if (v10 == (id)v11)
    {
      if (v34)
      {
        *(_DWORD *)long long buf = 136315138;
        v50 = "-[ADExternalNotificationRequestQueue enqueueAnnouncementRequest:]";
        _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "%s same type as tail request, adding it to the tail request's queue", buf, 0xCu);
      }
      id v13 = [(ADExternalNotificationRequestQueue *)self _lastRequestIdentifierInQueue];
      id v35 = [(NSMutableDictionary *)self->_queuedRequestMap objectForKey:v13];
      [v35 addObject:v5];

      goto LABEL_33;
    }
    if (v34)
    {
      *(_DWORD *)long long buf = 136315394;
      v50 = "-[ADExternalNotificationRequestQueue enqueueAnnouncementRequest:]";
      __int16 v51 = 2112;
      id v52 = v8;
      _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "%s No head or tail match of request type, enqueueing request: %@", buf, 0x16u);
    }
    ((void (*)(void *, id, void *))v6[2])(v6, v5, v8);
  }
  else
  {
    objc_storeStrong((id *)&self->_currentRequest, a3);
    ((void (*)(void *, id, void *))v6[2])(v6, v5, v8);
    if ([v5 supportsImmediateBurstMode])
    {
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_10014C960;
      v47[3] = &unk_10050C0A8;
      v47[4] = self;
      id v19 = [objc_alloc((Class)AFSafetyBlock) initWithBlock:v47];
      id v20 = objc_alloc((Class)AFWatchdogTimer);
      timersQueue = self->_timersQueue;
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_10014CA54;
      v44[3] = &unk_10050E160;
      id v22 = v5;
      id v45 = v22;
      id v23 = v19;
      id v46 = v23;
      long long v24 = (AFWatchdogTimer *)[v20 initWithTimeoutInterval:timersQueue onQueue:v44 timeoutHandler:10.0];
      maxTimeEnqueueableTimer = self->_maxTimeEnqueueableTimer;
      self->_maxTimeEnqueueableTimer = v24;

      id v26 = objc_alloc((Class)AFWatchdogTimer);
      __int16 v27 = self->_timersQueue;
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_10014CB1C;
      v41[3] = &unk_10050E160;
      id v42 = v22;
      id v43 = v23;
      id v13 = v23;
      v28 = (AFWatchdogTimer *)[v26 initWithTimeoutInterval:v27 onQueue:v41 timeoutHandler:3.0];
      resettingBurstTimer = self->_resettingBurstTimer;
      self->_resettingBurstTimer = v28;

      [(AFWatchdogTimer *)self->_maxTimeEnqueueableTimer start];
      [(AFWatchdogTimer *)self->_resettingBurstTimer start];

LABEL_33:
      goto LABEL_34;
    }
    [(ADExternalNotificationRequestQueueObserver *)self->_delegate announcementRequestReadyToBeAnnounced:self->_currentRequest];
  }
LABEL_34:
}

- (int64_t)_lastRequestAnnouncementTypeInQueue
{
  id v3 = [(ADExternalNotificationRequestQueue *)self _lastRequestIdentifierInQueue];
  if (v3
    && ([(NSMutableDictionary *)self->_queuedRequestMap objectForKey:v3],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 firstObject],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    id v6 = [v5 announcementType];
  }
  else
  {
    id v6 = 0;
  }

  return (int64_t)v6;
}

- (id)_lastRequestIdentifierInQueue
{
  id v3 = (char *)[(AFQueue *)self->_queuedNotificationRequestIdentifiers count] - 1;
  queuedNotificationRequestIdentifiers = self->_queuedNotificationRequestIdentifiers;
  return [(AFQueue *)queuedNotificationRequestIdentifiers objectAtIndex:v3];
}

- (void)setDelgate:(id)a3
{
}

- (ADExternalNotificationRequestQueue)init
{
  v12.receiver = self;
  v12.super_class = (Class)ADExternalNotificationRequestQueue;
  v2 = [(ADExternalNotificationRequestQueue *)&v12 init];
  if (v2)
  {
    id v3 = (AFQueue *)objc_alloc_init((Class)AFQueue);
    queuedNotificationRequestIdentifiers = v2->_queuedNotificationRequestIdentifiers;
    v2->_queuedNotificationRequestIdentifiers = v3;

    id v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    queuedRequestMap = v2->_queuedRequestMap;
    v2->_queuedRequestMap = v5;

    delegate = v2->_delegate;
    v2->_delegate = 0;

    id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("ADExternalRequestHandlerQueueTimers", v8);

    timersQueue = v2->_timersQueue;
    v2->_timersQueue = (OS_dispatch_queue *)v9;
  }
  return v2;
}

- (id)_identifierForNotificationRequest:(id)a3
{
  id v3 = a3;
  id v4 = [v3 notification];
  id v5 = [v4 request];

  if ([v3 announcementType] == (id)1)
  {
    id v6 = [v5 content];
    uint64_t v7 = [v6 threadIdentifier];
LABEL_6:
    id v8 = (void *)v7;

    goto LABEL_7;
  }
  if ([v3 announcementType] == (id)8 || objc_msgSend(v3, "announcementType") == (id)9)
  {
    id v6 = [v3 announcementIdentifier];
    uint64_t v7 = [v6 UUIDString];
    goto LABEL_6;
  }
  id v8 = [v5 identifier];
LABEL_7:

  return v8;
}

@end