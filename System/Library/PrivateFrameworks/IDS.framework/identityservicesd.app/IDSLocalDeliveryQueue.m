@interface IDSLocalDeliveryQueue
- (IDSLocalDeliveryQueue)initWithIdentifier:(id)a3;
- (NSArray)messages;
- (NSDictionary)statistics;
- (id)nextSocketPairMessageNotOnServices:(id)a3;
- (id)statisticsForDataProtectionClass:(unsigned int)a3;
- (unint64_t)count;
- (unint64_t)countForDataMessageType:(int64_t)a3;
- (unint64_t)countForDataProtectionClass:(unsigned int)a3;
- (void)_addMessageToStatistics:(id)a3;
- (void)_addStatsFromDict:(id)a3 toAggregate:(id)a4;
- (void)_removeMessageFromStatistics:(id)a3;
- (void)clearStats;
- (void)dealloc;
- (void)dequeueMessage:(id)a3;
- (void)enqueueMessage:(id)a3;
- (void)pushMessage:(id)a3;
- (void)removeMessages:(id)a3;
@end

@implementation IDSLocalDeliveryQueue

- (unint64_t)count
{
  return (unint64_t)[(NSMutableArray *)self->_messages count];
}

- (IDSLocalDeliveryQueue)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSLocalDeliveryQueue;
  v5 = [(IDSLocalDeliveryQueue *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = v6;

    v5->_statisticsLock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (void)dealloc
{
  [(NSMutableArray *)self->_messages enumerateObjectsUsingBlock:&stru_1009893B8];
  v3.receiver = self;
  v3.super_class = (Class)IDSLocalDeliveryQueue;
  [(IDSLocalDeliveryQueue *)&v3 dealloc];
}

- (NSArray)messages
{
  return (NSArray *)self->_messages;
}

- (unint64_t)countForDataProtectionClass:(unsigned int)a3
{
  messages = self->_messages;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003341A8;
  v7[3] = &unk_100987330;
  unsigned int v8 = a3;
  id v4 = [(NSMutableArray *)messages indexesOfObjectsPassingTest:v7];
  id v5 = [v4 count];

  return (unint64_t)v5;
}

- (unint64_t)countForDataMessageType:(int64_t)a3
{
  messages = self->_messages;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10033426C;
  v7[3] = &unk_100987350;
  void v7[4] = a3;
  id v4 = [(NSMutableArray *)messages indexesOfObjectsPassingTest:v7];
  id v5 = [v4 count];

  return (unint64_t)v5;
}

- (void)removeMessages:(id)a3
{
  if (a3) {
    -[NSMutableArray removeObjectsInArray:](self->_messages, "removeObjectsInArray:");
  }
}

- (void)pushMessage:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (!self->_messages)
    {
      id v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      messages = self->_messages;
      self->_messages = v5;
    }
    if ([v4 manualQueueRemoval]) {
      [(NSMutableArray *)self->_messages removeObject:v4];
    }
    if ((unint64_t)[(NSMutableArray *)self->_messages count] >> 4 > 0x270)
    {
      v7 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v9 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "We have exceeded the maximum queue size, dropping message %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
    }
    else
    {
      [(NSMutableArray *)self->_messages insertObject:v4 atIndex:0];
      [(IDSLocalDeliveryQueue *)self _addMessageToStatistics:v4];
    }
  }
}

- (void)enqueueMessage:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    messages = self->_messages;
    if (!messages)
    {
      v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v7 = self->_messages;
      self->_messages = v6;

      messages = self->_messages;
    }
    if ((unint64_t)[(NSMutableArray *)messages count] >> 4 > 0x270)
    {
      v16 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v4;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "We have exceeded the maximum queue size, dropping message %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
    }
    else
    {
      unsigned int v8 = [v4 resourcePath];

      if (v8)
      {
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v9 = self->_messages;
        id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v20;
          while (2)
          {
            v12 = 0;
            do
            {
              if (*(void *)v20 != v11) {
                objc_enumerationMutation(v9);
              }
              v13 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)v12) messageUUID];
              v14 = [v4 messageUUID];
              unsigned __int8 v15 = [v13 isEqualToString:v14];

              if (v15)
              {

                v17 = +[IDSFoundationLog localDeliveryQueue];
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                {
                  v18 = [v4 resourcePath];
                  *(_DWORD *)buf = 138412546;
                  id v24 = v4;
                  __int16 v25 = 2112;
                  v26 = v18;
                  _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "File transfer for message %@ [%@] is already in local delivery queue. Dropping duplicate.", buf, 0x16u);
                }
                goto LABEL_23;
              }
              v12 = (char *)v12 + 1;
            }
            while (v10 != v12);
            id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
      }
      [(NSMutableArray *)self->_messages addObject:v4];
      [(IDSLocalDeliveryQueue *)self _addMessageToStatistics:v4];
    }
  }
LABEL_23:
}

- (void)dequeueMessage:(id)a3
{
  id v4 = a3;
  if (v4 && [(NSMutableArray *)self->_messages containsObject:v4])
  {
    id v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v6 = [v4 manualQueueRemoval];
      CFStringRef v7 = @"NO";
      if (v6) {
        CFStringRef v7 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      id v13 = v4;
      __int16 v14 = 2112;
      CFStringRef v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Force dequeuing message %@ (should be manual: %@)", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      unsigned int v8 = [v4 manualQueueRemoval];
      CFStringRef v9 = @"NO";
      if (v8) {
        CFStringRef v9 = @"YES";
      }
      id v10 = v4;
      CFStringRef v11 = v9;
      _IDSLogV();
    }
    -[IDSLocalDeliveryQueue _removeMessageFromStatistics:](self, "_removeMessageFromStatistics:", v4, v10, v11);
    [(NSMutableArray *)self->_messages removeObject:v4];
  }
}

- (id)nextSocketPairMessageNotOnServices:(id)a3
{
  id v4 = a3;
  if ([(NSMutableArray *)self->_messages count])
  {
    while (1)
    {
      uint64_t v25 = 0;
      v26 = &v25;
      uint64_t v27 = 0x2020000000;
      uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
      messages = self->_messages;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100334CD8;
      v22[3] = &unk_100987418;
      v23 = v4;
      id v24 = &v25;
      [(NSMutableArray *)messages enumerateObjectsUsingBlock:v22];
      uint64_t v6 = v26[3];
      if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      {
        CFStringRef v7 = +[IDSFoundationLog localDeliveryQueue];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v4;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "* No pending messages not on %@", buf, 0xCu);
        }
        unsigned int v8 = 0;
      }
      else
      {
        CFStringRef v7 = [(NSMutableArray *)self->_messages objectAtIndex:v26[3]];
        unsigned int v8 = [v7 socketPairMessage];
        if (!v8)
        {
          CFStringRef v9 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            id v10 = [v7 topic];
            CFStringRef v11 = [v7 command];
            *(_DWORD *)buf = 138412802;
            v30 = v7;
            __int16 v31 = 2112;
            id v32 = v10;
            __int16 v33 = 2112;
            v34 = v11;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Couldn't construct a socketPairMessage for message %@ topic %@ command %@ - discarding", buf, 0x20u);
          }
          if (os_log_shim_legacy_logging_enabled())
          {
            v12 = [v7 topic];
            long long v20 = [v7 command];
            _IDSWarnV();

            id v13 = [v7 topic];
            long long v21 = [v7 command];
            _IDSLogV();

            __int16 v14 = [v7 topic];
            [v7 command];
            long long v19 = v18 = v14;
            v17 = v7;
            _IDSLogTransport();
          }
          -[NSMutableArray removeObjectAtIndex:](self->_messages, "removeObjectAtIndex:", v26[3], v17, v18, v19);
        }
      }

      _Block_object_dispose(&v25, 8);
      if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      if (v8)
      {
        id v15 = v8;
        goto LABEL_17;
      }
    }
    id v15 = 0;
LABEL_17:
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (void)_addMessageToStatistics:(id)a3
{
  id v28 = a3;
  id v4 = [v28 topic];
  id v5 = [v28 dataProtectionClass];
  p_statisticsLock = &self->_statisticsLock;
  os_unfair_lock_lock(&self->_statisticsLock);
  statistics = self->_statistics;
  unsigned int v8 = +[NSNumber numberWithUnsignedInt:v5];
  id v9 = [(NSMutableDictionary *)statistics objectForKey:v8];

  if (self->_statistics)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v18 = self->_statistics;
    self->_statistics = Mutable;

    if (v9) {
      goto LABEL_3;
    }
  }
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  long long v19 = self->_statistics;
  long long v20 = +[NSNumber numberWithUnsignedInt:v5];
  [(NSMutableDictionary *)v19 setObject:v9 forKey:v20];

LABEL_3:
  id v10 = [v9 objectForKey:v4];
  if (v10)
  {
    id v11 = v10;
    v12 = [v10 objectForKey:@"localDeliveryQueueStatMessageCount"];
    id v13 = [v11 objectForKey:@"localDeliveryQueueStatBytes"];
    id v14 = [v12 unsignedLongLongValue];
    id v15 = [v13 unsignedLongLongValue];

    uint64_t v16 = (uint64_t)v14 + 1;
  }
  else
  {
    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    id v15 = 0;
    uint64_t v16 = 1;
  }
  long long v21 = [v28 payload];
  long long v22 = (char *)[v21 length];

  v23 = [v28 protobuf];
  id v24 = [v23 data];
  uint64_t v25 = &v22[(unint64_t)[v24 length] + (void)v15];

  v26 = +[NSNumber numberWithUnsignedLongLong:v16];
  [v11 setObject:v26 forKey:@"localDeliveryQueueStatMessageCount"];

  uint64_t v27 = +[NSNumber numberWithUnsignedLongLong:v25];
  [v11 setObject:v27 forKey:@"localDeliveryQueueStatBytes"];

  [v9 setObject:v11 forKey:v4];
  os_unfair_lock_unlock(p_statisticsLock);
}

- (void)_removeMessageFromStatistics:(id)a3
{
  id v39 = a3;
  id v4 = [v39 topic];
  id v5 = [v39 dataProtectionClass];
  p_statisticsLock = &self->_statisticsLock;
  os_unfair_lock_lock(&self->_statisticsLock);
  statistics = self->_statistics;
  unsigned int v8 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v39 dataProtectionClass]);
  id v9 = [(NSMutableDictionary *)statistics objectForKey:v8];

  if (self->_statistics)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v30 = self->_statistics;
    self->_statistics = Mutable;

    if (v9) {
      goto LABEL_3;
    }
  }
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  __int16 v31 = self->_statistics;
  id v32 = +[NSNumber numberWithUnsignedInt:v5];
  [(NSMutableDictionary *)v31 setObject:v9 forKey:v32];

LABEL_3:
  id v10 = [v9 objectForKey:v4];
  id v11 = v10;
  if (v10)
  {
    v36 = [v10 objectForKey:@"localDeliveryQueueStatMessageCount"];
    v35 = [v11 objectForKey:@"localDeliveryQueueStatBytes"];
    v34 = [v11 objectForKey:@"localDeliveryQueueStatDeliveredMessageCount"];
    __int16 v33 = [v11 objectForKey:@"localDeliveryQueueStatDeliveredBytes"];
    v12 = (char *)[v36 unsignedLongLongValue];
    id v13 = [v35 unsignedLongLongValue];
    id v14 = (char *)[v34 unsignedLongLongValue];
    id v15 = (char *)[v33 unsignedLongLongValue];
    [v39 payload];
    uint64_t v16 = v37 = p_statisticsLock;
    v17 = (char *)[v16 length];
    v18 = [v39 protobuf];
    [v18 data];
    long long v19 = v38 = v4;
    long long v20 = &v17[(void)[v19 length]];

    long long v21 = v14 + 1;
    long long v22 = &v15[(void)v20];
    v23 = +[NSNumber numberWithUnsignedLongLong:v12 - 1];
    [v11 setObject:v23 forKey:@"localDeliveryQueueStatMessageCount"];

    id v24 = +[NSNumber numberWithUnsignedLongLong:v13 - v20];
    [v11 setObject:v24 forKey:@"localDeliveryQueueStatBytes"];

    uint64_t v25 = v21;
    p_statisticsLock = v37;
    v26 = +[NSNumber numberWithUnsignedLongLong:v25];
    [v11 setObject:v26 forKey:@"localDeliveryQueueStatDeliveredMessageCount"];

    uint64_t v27 = +[NSNumber numberWithUnsignedLongLong:v22];
    [v11 setObject:v27 forKey:@"localDeliveryQueueStatDeliveredBytes"];

    ids_monotonic_time();
    id v28 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v11 setObject:v28 forKey:@"localDeliveryQueueStatsLastDeliveredTime"];

    id v4 = v38;
    [v9 setObject:v11 forKey:v38];
  }
  os_unfair_lock_unlock(p_statisticsLock);
}

- (void)_addStatsFromDict:(id)a3 toAggregate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = [&off_1009D2D28 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(&off_1009D2D28);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v12 = [v5 objectForKey:v11];
        id v13 = (char *)[v12 unsignedLongLongValue];

        id v14 = [v6 objectForKey:v11];
        id v15 = &v13[(void)[v14 unsignedLongLongValue]];

        uint64_t v16 = +[NSNumber numberWithUnsignedLongLong:v15];
        [v6 setObject:v16 forKey:v11];
      }
      id v8 = [&off_1009D2D28 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }
  v17 = [v5 objectForKey:@"localDeliveryQueueStatsLastDeliveredTime"];
  [v17 doubleValue];
  double v19 = v18;

  long long v20 = [v6 objectForKey:@"localDeliveryQueueStatsLastDeliveredTime"];
  [v20 doubleValue];
  double v22 = v21;

  if (v19 > v22)
  {
    v23 = +[NSNumber numberWithDouble:v19];
    [v6 setObject:v23 forKey:@"localDeliveryQueueStatsLastDeliveredTime"];
  }
}

- (NSDictionary)statistics
{
  id v25 = objc_alloc_init((Class)NSMutableDictionary);
  os_unfair_lock_lock(&self->_statisticsLock);
  objc_super v3 = [(NSMutableDictionary *)self->_statistics allValues];
  id v4 = objc_alloc_init((Class)NSMutableSet);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v36;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = [*(id *)(*((void *)&v35 + 1) + 8 * i) allKeys];
        id v10 = +[NSSet setWithArray:v9];
        [v4 unionSet:v10];
      }
      id v6 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v6);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v23 = v4;
  id v11 = [v23 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v24 = *(void *)v32;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(v23);
        }
        uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8 * (void)j);
        id v15 = objc_alloc_init((Class)NSMutableDictionary);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v16 = obj;
        id v17 = [v16 countByEnumeratingWithState:&v27 objects:v39 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v28;
          do
          {
            for (k = 0; k != v18; k = (char *)k + 1)
            {
              if (*(void *)v28 != v19) {
                objc_enumerationMutation(v16);
              }
              double v21 = [*(id *)(*((void *)&v27 + 1) + 8 * (void)k) objectForKey:v14];
              [(IDSLocalDeliveryQueue *)self _addStatsFromDict:v21 toAggregate:v15];
            }
            id v18 = [v16 countByEnumeratingWithState:&v27 objects:v39 count:16];
          }
          while (v18);
        }

        [v25 setObject:v15 forKey:v14];
      }
      id v12 = [v23 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v12);
  }

  os_unfair_lock_unlock(&self->_statisticsLock);

  return (NSDictionary *)v25;
}

- (id)statisticsForDataProtectionClass:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  p_statisticsLock = &self->_statisticsLock;
  os_unfair_lock_lock(&self->_statisticsLock);
  statistics = self->_statistics;
  uint64_t v7 = +[NSNumber numberWithUnsignedInt:v3];
  id v8 = [(NSMutableDictionary *)statistics objectForKey:v7];
  id v9 = [v8 copy];

  os_unfair_lock_unlock(p_statisticsLock);

  return v9;
}

- (void)clearStats
{
  os_unfair_lock_t lock = &self->_statisticsLock;
  os_unfair_lock_lock(&self->_statisticsLock);
  ids_monotonic_time();
  double v4 = v3;
  [(NSMutableDictionary *)self->_statistics allValues];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v16 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v16)
  {
    uint64_t v15 = *(void *)v23;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = v5;
        id v6 = [*(id *)(*((void *)&v22 + 1) + 8 * v5) allValues];
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
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
              id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
              [v11 setObject:&off_1009D1D70 forKey:@"localDeliveryQueueStatDeliveredMessageCount"];
              [v11 setObject:&off_1009D1D70 forKey:@"localDeliveryQueueStatDeliveredBytes"];
              id v12 = +[NSNumber numberWithDouble:v4];
              [v11 setObject:v12 forKey:@"localDeliveryQueueStatsLastDeliveredTime"];
            }
            id v8 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v8);
        }

        uint64_t v5 = v17 + 1;
      }
      while ((id)(v17 + 1) != v16);
      id v16 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v16);
  }
  os_unfair_lock_unlock(lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statistics, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_messages, 0);
}

@end