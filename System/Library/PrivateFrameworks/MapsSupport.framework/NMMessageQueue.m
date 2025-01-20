@interface NMMessageQueue
- (BOOL)isPaused;
- (BOOL)shouldSendNewPayload;
- (NMMessageQueue)init;
- (unint64_t)count;
- (unint64_t)maximumInFlightMessagesCount;
- (unint64_t)maximumInFlightMessagesSize;
- (unint64_t)maximumPendingMessagesCount;
- (unint64_t)maximumPendingMessagesForMessageType:(int)a3;
- (void)_trimPendingMessagesIfNeeded;
- (void)_trimPendingMessagesIfNeededOfType:(int)a3;
- (void)dequeueMessageIfPossible:(id)a3 orReply:(id)a4;
- (void)didSendPayloadWithSize:(unint64_t)a3;
- (void)enqueueMessage:(id)a3 options:(id)a4 reply:(id)a5;
- (void)enqueueReply:(id)a3 forMessage:(id)a4 options:(id)a5;
- (void)removeAllMessages;
- (void)removeMessage:(id)a3;
- (void)removeReply:(id)a3;
- (void)setMaximumInFlightMessagesCount:(unint64_t)a3;
- (void)setMaximumInFlightMessagesSize:(unint64_t)a3;
- (void)setMaximumPendingMessages:(unint64_t)a3 forMessageType:(int)a4;
- (void)setMaximumPendingMessagesCount:(unint64_t)a3;
- (void)setPaused:(BOOL)a3;
- (void)willSendPayloadWithSize:(unint64_t)a3;
@end

@implementation NMMessageQueue

- (NMMessageQueue)init
{
  v10.receiver = self;
  v10.super_class = (Class)NMMessageQueue;
  v2 = [(NMMessageQueue *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_maximumPendingMessagesCount = -1;
    v2->_maximumInFlightMessagesCount = -1;
    v2->_maximumInFlightMessagesSize = -1;
    v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    queue = v3->_queue;
    v3->_queue = v4;

    v6 = (NSLock *)objc_alloc_init((Class)NSLock);
    queueLock = v3->_queueLock;
    v3->_queueLock = v6;

    v8 = v3;
  }

  return v3;
}

- (unint64_t)count
{
  [(NSLock *)self->_queueLock lock];
  id v3 = [(NSMutableArray *)self->_queue count];
  [(NSLock *)self->_queueLock unlock];
  return (unint64_t)v3;
}

- (unint64_t)maximumPendingMessagesForMessageType:(int)a3
{
  maximumPendingMessagesByType = self->_maximumPendingMessagesByType;
  v4 = +[NSNumber numberWithInt:*(void *)&a3];
  v5 = [(NSMutableDictionary *)maximumPendingMessagesByType objectForKeyedSubscript:v4];
  id v6 = [v5 unsignedIntegerValue];

  return (unint64_t)v6;
}

- (void)setMaximumPendingMessages:(unint64_t)a3 forMessageType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (!self->_maximumPendingMessagesByType)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    maximumPendingMessagesByType = self->_maximumPendingMessagesByType;
    self->_maximumPendingMessagesByType = v7;
  }
  v9 = +[NSNumber numberWithUnsignedInteger:a3];
  objc_super v10 = self->_maximumPendingMessagesByType;
  v11 = +[NSNumber numberWithInt:v4];
  [(NSMutableDictionary *)v10 setObject:v9 forKeyedSubscript:v11];

  [(NMMessageQueue *)self _trimPendingMessagesIfNeededOfType:v4];
}

- (void)enqueueMessage:(id)a3 options:(id)a4 reply:(id)a5
{
  if (a3)
  {
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    v12 = objc_alloc_init(_NMEnqueuedMessage);
    [(_NMEnqueuedMessage *)v12 setMessage:v10];
    [(_NMEnqueuedMessage *)v12 setOptions:v9];

    [(_NMEnqueuedMessage *)v12 setReplyBlock:v8];
    [(_NMEnqueuedMessage *)v12 setEnqueuedTime:CFAbsoluteTimeGetCurrent()];
    [(NSLock *)self->_queueLock lock];
    [(NSMutableArray *)self->_queue addObject:v12];
    [(NSLock *)self->_queueLock unlock];
    [(NMMessageQueue *)self _trimPendingMessagesIfNeeded];
    id v11 = [v10 type];

    [(NMMessageQueue *)self _trimPendingMessagesIfNeededOfType:v11];
  }
}

- (void)enqueueReply:(id)a3 forMessage:(id)a4 options:(id)a5
{
  if (a3)
  {
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    id v11 = objc_alloc_init(_NMEnqueuedMessage);
    [(_NMEnqueuedMessage *)v11 setReply:v10];

    [(_NMEnqueuedMessage *)v11 setMessage:v9];
    [(_NMEnqueuedMessage *)v11 setOptions:v8];

    [(_NMEnqueuedMessage *)v11 setEnqueuedTime:CFAbsoluteTimeGetCurrent()];
    [(NSLock *)self->_queueLock lock];
    [(NSMutableArray *)self->_queue addObject:v11];
    [(NSLock *)self->_queueLock unlock];
  }
}

- (void)_trimPendingMessagesIfNeeded
{
  [(NSLock *)self->_queueLock lock];
  id v3 = sub_100029020(self->_queue, &stru_100081238);
  if ([v3 count] && (unint64_t)objc_msgSend(v3, "count") > self->_maximumPendingMessagesCount)
  {
    uint64_t v4 = (char *)[v3 count] - self->_maximumPendingMessagesCount;
    v5 = sub_100053F94();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [v3 count];
      unint64_t maximumPendingMessagesCount = self->_maximumPendingMessagesCount;
      int v10 = 134218496;
      id v11 = v6;
      __int16 v12 = 2048;
      unint64_t v13 = maximumPendingMessagesCount;
      __int16 v14 = 2048;
      v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Too many enqueued messages (current:%lu, max:%lu), dropping %lu oldest", (uint8_t *)&v10, 0x20u);
    }

    queue = self->_queue;
    id v9 = objc_msgSend(v3, "subarrayWithRange:", 0, v4);
    [(NSMutableArray *)queue removeObjectsInArray:v9];
  }
  [(NSLock *)self->_queueLock unlock];
}

- (void)_trimPendingMessagesIfNeededOfType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  maximumPendingMessagesByType = self->_maximumPendingMessagesByType;
  id v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
  v7 = [(NSMutableDictionary *)maximumPendingMessagesByType objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = [v7 unsignedIntegerValue];
    if (v8)
    {
      unint64_t v9 = (unint64_t)v8;
      [(NSLock *)self->_queueLock lock];
      queue = self->_queue;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10000E78C;
      v19[3] = &unk_100081258;
      int v20 = v3;
      id v11 = sub_100029020(queue, v19);
      if (![v11 count] || (unint64_t)objc_msgSend(v11, "count") <= v9) {
        goto LABEL_84;
      }
      __int16 v12 = (char *)[v11 count] - v9;
      unint64_t v13 = sub_100053F94();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
LABEL_83:

        v17 = self->_queue;
        v18 = objc_msgSend(v11, "subarrayWithRange:", 0, v12);
        [(NSMutableArray *)v17 removeObjectsInArray:v18];

LABEL_84:
        [(NSLock *)self->_queueLock unlock];

        goto LABEL_85;
      }
      if ((int)v3 <= 199)
      {
        switch((int)v3)
        {
          case '2':
            __int16 v14 = @"START_INITIAL_SYNC";
            break;
          case '3':
            __int16 v14 = @"FETCH_CURRENT_COUNTRY_CODE";
            break;
          case '4':
            __int16 v14 = @"FETCH_EXPERIMENTS_CONFIG";
            break;
          case '5':
            __int16 v14 = @"DID_CHANGE_EXPERIMENTS_CONFIG";
            break;
          case '6':
            __int16 v14 = @"SYNC_UP_NEXT_ITEMS";
            break;
          case '7':
            __int16 v14 = @"REQUEST_UP_NEXT_ITEMS";
            break;
          case '8':
            __int16 v14 = @"SYNC_CONFIG_STORE";
            break;
          case '9':
            __int16 v14 = @"CHECKIN_WITH_CONFIG_STORE";
            break;
          case ':':
            __int16 v14 = @"REQUEST_ANALYTIC_IDENTIFIERS";
            break;
          case ';':
            __int16 v14 = @"CHECKIN_WITH_SUBSCRIPTION_INFO";
            break;
          case '<':
            __int16 v14 = @"SYNC_SUBSCRIPTION_INFO";
            break;
          case '=':
            __int16 v14 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
            break;
          case '>':
            goto LABEL_35;
          case '?':
            __int16 v14 = @"UPDATE_SUBSCRIPTION_STATE";
            break;
          case '@':
            __int16 v14 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
            break;
          case 'A':
            __int16 v14 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
            break;
          case 'B':
            __int16 v14 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
            break;
          case 'C':
            __int16 v14 = @"SET_SUBSCRIPTION_SHOULD_SYNC";
            break;
          default:
            int v15 = v3 - 1;
            if (v3 > 0xC7)
            {
              switch((int)v3)
              {
                case 'd':
                  __int16 v14 = @"CHECKIN_WITH_TILE_GROUP";
                  break;
                case 'e':
                  __int16 v14 = @"FORCE_UPDATE_MANIFEST";
                  break;
                case 'f':
                  __int16 v14 = @"DID_CHANGE_ACTIVE_TILE_GROUP";
                  break;
                case 'g':
                  __int16 v14 = @"FETCH_RESOURCE";
                  break;
                default:
                  goto LABEL_35;
              }
            }
            else
            {
              __int16 v14 = @"FETCH_TILES";
              switch(v15)
              {
                case 0:
                  goto LABEL_82;
                case 1:
                  __int16 v14 = @"CANCEL_TILES";
                  break;
                case 2:
                  __int16 v14 = @"REPORT_CORRUPT_TILE";
                  break;
                case 3:
                  __int16 v14 = @"FETCHED_TILE";
                  break;
                default:
                  JUMPOUT(0);
              }
            }
            return;
        }
        goto LABEL_82;
      }
      if ((int)v3 <= 400)
      {
        switch((int)v3)
        {
          case 300:
            __int16 v14 = @"UPDATE_NAV_ROUTE_DETAILS";
            break;
          case 301:
            __int16 v14 = @"UPDATE_NAV_ROUTE_STATUS";
            break;
          case 302:
            __int16 v14 = @"START_NAV";
            break;
          case 303:
            __int16 v14 = @"STOP_NAV";
            break;
          case 304:
            __int16 v14 = @"PREVIEW_NAV";
            break;
          case 305:
            __int16 v14 = @"CLEAR_NAV_PREVIEW";
            break;
          case 306:
            __int16 v14 = @"SET_WANTS_ALL_NAV_STATUS_UPDATES";
            break;
          case 307:
            __int16 v14 = @"DISMISS_NAV_SAFETY_ALERT";
            break;
          case 308:
            __int16 v14 = @"AVAILABLE_ROUTE";
            break;
          case 309:
            __int16 v14 = @"SELECTED_ROUTE";
            break;
          case 310:
            __int16 v14 = @"REQUEST_NAVIGATION_UPDATE";
            break;
          case 311:
            __int16 v14 = @"UPDATE_NAV_ROUTE_UPDATE";
            break;
          case 312:
            __int16 v14 = @"AVAILABLE_ROUTE_UPDATE";
            break;
          case 313:
            __int16 v14 = @"PAUSE_NAV";
            break;
          case 314:
            __int16 v14 = @"RESUME_NAV";
            break;
          case 315:
            __int16 v14 = @"SET_DISPLAYED_STEP";
            break;
          default:
            switch((int)v3)
            {
              case 200:
                __int16 v14 = @"START_LOCATION_UPDATE";
                break;
              case 201:
                __int16 v14 = @"STOP_LOCATION_UPDATE";
                break;
              case 202:
                __int16 v14 = @"UPDATED_LOCATION";
                break;
              case 203:
                __int16 v14 = @"FAILED_TO_UPDATE_LOCATION";
                break;
              case 204:
                __int16 v14 = @"DID_PAUSE_LOCATION_UPDATES";
                break;
              case 205:
                __int16 v14 = @"DID_RESUME_LOCATION_UPDATES";
                break;
              case 206:
                __int16 v14 = @"APPLY_LOCATION_AUTHORIZATION";
                break;
              default:
                goto LABEL_35;
            }
            break;
        }
        goto LABEL_82;
      }
      if ((int)v3 > 599)
      {
        if ((int)v3 > 1499)
        {
          if (v3 == 1500)
          {
            __int16 v14 = @"DEBUG_FETCH_CONFIGURATION_INFO";
            goto LABEL_82;
          }
          if (v3 == 1501)
          {
            __int16 v14 = @"DEBUG_FETCH_DIAGNOSTICS_STRING";
            goto LABEL_82;
          }
        }
        else
        {
          if (v3 == 600)
          {
            __int16 v14 = @"FETCH_ROUTE_GENIUS";
            goto LABEL_82;
          }
          if (v3 == 1000)
          {
            __int16 v14 = @"PING";
            goto LABEL_82;
          }
        }
      }
      else if ((int)v3 > 500)
      {
        if (v3 == 501)
        {
          __int16 v14 = @"PLACE_DATA_IDENTIFIER_LOOKUP";
          goto LABEL_82;
        }
        if (v3 == 502)
        {
          __int16 v14 = @"SERVICE_REQUEST";
          goto LABEL_82;
        }
      }
      else
      {
        if (v3 == 401)
        {
          __int16 v14 = @"OPEN_URL";
          goto LABEL_82;
        }
        if (v3 == 500)
        {
          __int16 v14 = @"PLACE_DATA_MUID_LOOKUP";
LABEL_82:
          id v16 = [v11 count];
          *(_DWORD *)buf = 138413058;
          v22 = v14;
          __int16 v23 = 2048;
          id v24 = v16;
          __int16 v25 = 2048;
          unint64_t v26 = v9;
          __int16 v27 = 2048;
          v28 = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Too many enqueued messages for %@ (current:%lu, max:%lu), dropping %lu oldest", buf, 0x2Au);

          goto LABEL_83;
        }
      }
LABEL_35:
      __int16 v14 = +[NSString stringWithFormat:@"(unknown: %i)", v3];
      goto LABEL_82;
    }
  }
LABEL_85:
}

- (void)dequeueMessageIfPossible:(id)a3 orReply:(id)a4
{
  id v6 = (void (**)(id, void *, void *, void *, __n128))a3;
  v7 = (void (**)(id, void *, void *, void *, __n128))a4;
  if (![(NMMessageQueue *)self isPaused])
  {
    [(NSLock *)self->_queueLock lock];
    id v8 = [(NSMutableArray *)self->_queue firstObject];
    if (!v8)
    {
      [(NSLock *)self->_queueLock unlock];
      goto LABEL_14;
    }
    [(NSMutableArray *)self->_queue removeObjectAtIndex:0];
    unint64_t v9 = sub_100053F94();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = [v8 message];
      id v11 = [v10 shortDebugDescription];
      id v12 = [(NSMutableArray *)self->_queue count];
      int v23 = 138412546;
      id v24 = v11;
      __int16 v25 = 2048;
      id v26 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Dequeued message: %@, %lu remaining in queue", (uint8_t *)&v23, 0x16u);
    }
    [(NSLock *)self->_queueLock unlock];
    unint64_t v13 = [v8 reply];

    if (v13)
    {
      if (!v7) {
        goto LABEL_14;
      }
      __int16 v14 = [v8 reply];
      int v15 = [v8 message];
      id v16 = [v8 options];
      double Current = CFAbsoluteTimeGetCurrent();
      [v8 enqueuedTime];
      v19.n128_f64[0] = Current - v18;
      v7[2](v7, v14, v15, v16, v19);
    }
    else
    {
      if (!v6) {
        goto LABEL_14;
      }
      __int16 v14 = [v8 message];
      int v15 = [v8 options];
      id v16 = [v8 replyBlock];
      double v20 = CFAbsoluteTimeGetCurrent();
      [v8 enqueuedTime];
      v22.n128_f64[0] = v20 - v21;
      v6[2](v6, v14, v15, v16, v22);
    }

    goto LABEL_14;
  }
  id v8 = sub_100053F94();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LOWORD(v23) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Will not dequeue message, currently paused", (uint8_t *)&v23, 2u);
  }
LABEL_14:
}

- (BOOL)shouldSendNewPayload
{
  if (self->_maximumInFlightMessagesCount == -1 && self->_maximumInFlightMessagesSize == -1) {
    return 1;
  }
  [(NSLock *)self->_queueLock lock];
  if (self->_inFlightPayloadsSize >= self->_maximumInFlightMessagesSize)
  {
    [(NSLock *)self->_queueLock unlock];
    goto LABEL_9;
  }
  unint64_t inFlightPayloadsCount = self->_inFlightPayloadsCount;
  unint64_t maximumInFlightMessagesCount = self->_maximumInFlightMessagesCount;
  [(NSLock *)self->_queueLock unlock];
  if (inFlightPayloadsCount >= maximumInFlightMessagesCount)
  {
LABEL_9:
    v5 = sub_100053F94();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      unint64_t v9 = self->_inFlightPayloadsCount;
      unint64_t inFlightPayloadsSize = self->_inFlightPayloadsSize;
      unint64_t v11 = self->_maximumInFlightMessagesCount;
      unint64_t maximumInFlightMessagesSize = self->_maximumInFlightMessagesSize;
      int v14 = 134218752;
      unint64_t v15 = v9;
      __int16 v16 = 2048;
      unint64_t v17 = v11;
      __int16 v18 = 2048;
      unint64_t v19 = inFlightPayloadsSize;
      __int16 v20 = 2048;
      unint64_t v21 = maximumInFlightMessagesSize;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Delaying message/reply send due to too many/too large in-flight payloads (%lu in-flight payloads (%lu max), %lu total bytes (%lu max))", (uint8_t *)&v14, 0x2Au);
    }
    BOOL v8 = 0;
    goto LABEL_12;
  }
  v5 = sub_100053F94();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v6 = self->_inFlightPayloadsCount;
    unint64_t v7 = self->_inFlightPayloadsSize;
    int v14 = 134218240;
    unint64_t v15 = v6;
    __int16 v16 = 2048;
    unint64_t v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Allowing message/reply to send immediately (%lu in-flight payloads, %lu total bytes)", (uint8_t *)&v14, 0x16u);
  }
  BOOL v8 = 1;
LABEL_12:

  return v8;
}

- (void)willSendPayloadWithSize:(unint64_t)a3
{
  [(NSLock *)self->_queueLock lock];
  unint64_t v5 = self->_inFlightPayloadsSize + a3;
  ++self->_inFlightPayloadsCount;
  self->_unint64_t inFlightPayloadsSize = v5;
  queueLock = self->_queueLock;

  [(NSLock *)queueLock unlock];
}

- (void)didSendPayloadWithSize:(unint64_t)a3
{
  [(NSLock *)self->_queueLock lock];
  unint64_t inFlightPayloadsCount = self->_inFlightPayloadsCount;
  if (inFlightPayloadsCount)
  {
    self->_unint64_t inFlightPayloadsCount = inFlightPayloadsCount - 1;
  }
  else
  {
    unint64_t v6 = sub_100053F94();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "Trying to decrement message queue in-flight count, but would underflow! Ignoring...", buf, 2u);
    }
  }
  unint64_t inFlightPayloadsSize = self->_inFlightPayloadsSize;
  BOOL v8 = inFlightPayloadsSize >= a3;
  unint64_t v9 = inFlightPayloadsSize - a3;
  if (v8)
  {
    self->_unint64_t inFlightPayloadsSize = v9;
  }
  else
  {
    int v10 = sub_100053F94();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)unint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "Trying to decrement message queue in-flight size, but would underflow! Ignoring...", v11, 2u);
    }
  }
  [(NSLock *)self->_queueLock unlock];
}

- (void)removeMessage:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unint64_t v5 = sub_100053F94();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      unint64_t v6 = [v4 shortDebugDescription];
      *(_DWORD *)buf = 138412290;
      int v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Removing message: %@", buf, 0xCu);
    }
    [(NSLock *)self->_queueLock lock];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    unint64_t v7 = self->_queue;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
LABEL_6:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
        objc_msgSend(v12, "message", (void)v17);
        id v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13 == v4) {
          break;
        }
        if (v9 == (id)++v11)
        {
          id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v9) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
      id v14 = v12;

      if (!v14) {
        goto LABEL_17;
      }
      [(NSMutableArray *)self->_queue removeObject:v14];
      [(NSLock *)self->_queueLock unlock];
      unint64_t v15 = sub_100053F94();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        __int16 v16 = [v4 shortDebugDescription];
        *(_DWORD *)buf = 138412290;
        int v23 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Found and removed enqueued message: %@", buf, 0xCu);
      }
    }
    else
    {
LABEL_12:

LABEL_17:
      [(NSLock *)self->_queueLock unlock];
    }
  }
}

- (void)removeReply:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(NSLock *)self->_queueLock lock];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    unint64_t v5 = self->_queue;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          objc_msgSend(v10, "reply", (void)v13);
          id v11 = (id)objc_claimAutoreleasedReturnValue();

          if (v11 == v4)
          {
            id v12 = v10;

            if (v12) {
              [(NSMutableArray *)self->_queue removeObject:v12];
            }
            goto LABEL_13;
          }
        }
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    id v12 = 0;
LABEL_13:
    [(NSLock *)self->_queueLock unlock];
  }
}

- (void)removeAllMessages
{
  [(NSLock *)self->_queueLock lock];
  [(NSMutableArray *)self->_queue removeAllObjects];
  queueLock = self->_queueLock;

  [(NSLock *)queueLock unlock];
}

- (unint64_t)maximumPendingMessagesCount
{
  return self->_maximumPendingMessagesCount;
}

- (void)setMaximumPendingMessagesCount:(unint64_t)a3
{
  self->_unint64_t maximumPendingMessagesCount = a3;
}

- (unint64_t)maximumInFlightMessagesCount
{
  return self->_maximumInFlightMessagesCount;
}

- (void)setMaximumInFlightMessagesCount:(unint64_t)a3
{
  self->_unint64_t maximumInFlightMessagesCount = a3;
}

- (unint64_t)maximumInFlightMessagesSize
{
  return self->_maximumInFlightMessagesSize;
}

- (void)setMaximumInFlightMessagesSize:(unint64_t)a3
{
  self->_unint64_t maximumInFlightMessagesSize = a3;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueLock, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_maximumPendingMessagesByType, 0);
}

@end