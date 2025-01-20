@interface IDSCoalesceMessageQueueManager
- (BOOL)_isTopicBeingRateLimited:(id)a3;
- (BOOL)coalesceQueueExistsForTopic:(id)a3;
- (IDSCoalesceMessageQueueManager)initWithBag:(id)a3;
- (IDSCoalesceMessageQueueManagerDelegate)delegate;
- (IDSServerBag)bag;
- (NSMutableDictionary)queueMap;
- (NSMutableDictionary)rateLimitMap;
- (NSMutableDictionary)timerMap;
- (double)coalesceDelayForTopic:(id)a3 sendMode:(id)a4;
- (double)defaultDelayForSendMode:(id)a3;
- (id)formattedKeyForTopic:(id)a3 sendMode:(id)a4;
- (id)loggableOverviewForTopic:(id)a3;
- (os_unfair_lock_s)lock;
- (void)_clearQueueForTopic:(id)a3;
- (void)_clearTimerForTopic:(id)a3;
- (void)_createTimerForTopic:(id)a3 withDelay:(double)a4;
- (void)_resetTimerForTopic:(id)a3 withDelay:(double)a4;
- (void)_timerFired:(id)a3;
- (void)_updateTimerForTopic:(id)a3 sendMode:(id)a4;
- (void)enqueueMessage:(id)a3 forTopic:(id)a4 sendMode:(id)a5;
- (void)flushCoalesceQueueForTopic:(id)a3;
- (void)handleMessageToCoalesce:(id)a3 forTopic:(id)a4 sendMode:(id)a5;
- (void)handleRateLimitingResponseForTopic:(id)a3 ttr:(id)a4;
- (void)setBag:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setQueueMap:(id)a3;
- (void)setRateLimitMap:(id)a3;
- (void)setTimerMap:(id)a3;
@end

@implementation IDSCoalesceMessageQueueManager

- (IDSCoalesceMessageQueueManager)initWithBag:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IDSCoalesceMessageQueueManager;
  v6 = [(IDSCoalesceMessageQueueManager *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bag, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    queueMap = v7->_queueMap;
    v7->_queueMap = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    timerMap = v7->_timerMap;
    v7->_timerMap = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    rateLimitMap = v7->_rateLimitMap;
    v7->_rateLimitMap = v12;

    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)handleMessageToCoalesce:(id)a3 forTopic:(id)a4 sendMode:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [(IDSCoalesceMessageQueueManager *)self enqueueMessage:a3 forTopic:v9 sendMode:v8];
  [(IDSCoalesceMessageQueueManager *)self _updateTimerForTopic:v9 sendMode:v8];
}

- (void)enqueueMessage:(id)a3 forTopic:(id)a4 sendMode:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[IDSFoundationLog delivery];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v8 objectForKeyedSubscript:IDSDeliveryMessageKey];
    v13 = [v12 messageID];
    int v19 = 138412802;
    v20 = v13;
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Coalesce queue manager enqueing message { guid : %@ topic : %@ sendMode : %@ }", (uint8_t *)&v19, 0x20u);
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_super v15 = [(NSMutableDictionary *)self->_queueMap objectForKey:v9];
  if (!v15)
  {
    objc_super v15 = [[IDSCoalesceMessageQueue alloc] initWithTopic:v9 sendMode:v10];
    [(NSMutableDictionary *)self->_queueMap setObject:v15 forKey:v9];
  }
  v16 = [(IDSCoalesceMessageQueue *)v15 infos];

  if (!v16)
  {
    id v17 = objc_alloc_init((Class)NSMutableArray);
    [(IDSCoalesceMessageQueue *)v15 setInfos:v17];
  }
  [v8 setObject:&__kCFBooleanTrue forKey:IDSDeliveryFromCoalesceQueueKey];
  v18 = [(IDSCoalesceMessageQueue *)v15 infos];
  [v18 addObject:v8];

  os_unfair_lock_unlock(p_lock);
}

- (void)_clearQueueForTopic:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSFoundationLog delivery];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Clearing coalesce queue for topic : %@", (uint8_t *)&v7, 0xCu);
  }

  v6 = [(NSMutableDictionary *)self->_queueMap objectForKey:v4];

  if (v6) {
    [(NSMutableDictionary *)self->_queueMap removeObjectForKey:v4];
  }
}

- (void)flushCoalesceQueueForTopic:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = [(NSMutableDictionary *)self->_queueMap objectForKey:v4];
  if ([v5 isEmpty])
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v6 = +[IDSFoundationLog delivery];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Flushing coalesce queue for topic : %@", buf, 0xCu);
    }
    id v20 = v4;

    id v7 = objc_alloc_init((Class)NSMutableArray);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    int v19 = v5;
    id v8 = [v5 infos];
    id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v22;
      uint64_t v12 = IDSDeliveryMessageKey;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          objc_super v15 = [v14 objectForKeyedSubscript:v12];
          v16 = [v15 sendMode];
          if ([v16 integerValue] != (id)3) {
            [v7 addObject:v14];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }

    id v4 = v20;
    [(IDSCoalesceMessageQueueManager *)self _clearTimerForTopic:v20];
    [(IDSCoalesceMessageQueueManager *)self _clearQueueForTopic:v20];
    os_unfair_lock_unlock(&self->_lock);
    id v17 = [(IDSCoalesceMessageQueueManager *)self delegate];
    id v5 = v19;
    v18 = [v19 sendMode];
    [v17 queueManager:self receivedMessagesToSend:v7 forTopic:v20 sendMode:v18];
  }
}

- (BOOL)coalesceQueueExistsForTopic:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = [(NSMutableDictionary *)self->_queueMap objectForKey:v4];

  if (v6)
  {
    id v7 = +[IDSFoundationLog delivery];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Coalesce queue exists for topic : %@", (uint8_t *)&v9, 0xCu);
    }
  }
  os_unfair_lock_unlock(p_lock);

  return v6 != 0;
}

- (void)_updateTimerForTopic:(id)a3 sendMode:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  if ([(IDSCoalesceMessageQueueManager *)self _isTopicBeingRateLimited:v20])
  {
    id v7 = [(NSMutableDictionary *)self->_rateLimitMap objectForKey:v20];
    id v8 = [v7 integerValue];

    int v9 = [(NSMutableDictionary *)self->_timerMap objectForKey:v20];

    if (!v9) {
      [(IDSCoalesceMessageQueueManager *)self _createTimerForTopic:v20 withDelay:(double)(uint64_t)v8];
    }
  }
  else
  {
    [(IDSCoalesceMessageQueueManager *)self coalesceDelayForTopic:v20 sendMode:v6];
    double v11 = v10;
    uint64_t v12 = [(NSMutableDictionary *)self->_timerMap objectForKey:v20];

    if (!v12) {
      [(IDSCoalesceMessageQueueManager *)self _createTimerForTopic:v20 withDelay:v11];
    }
    v13 = [(NSMutableDictionary *)self->_queueMap objectForKey:v20];
    v14 = [(NSMutableDictionary *)self->_timerMap objectForKey:v20];
    int v15 = [v6 intValue];
    v16 = [v13 sendMode];
    if (v15 >= (int)[v16 intValue])
    {
    }
    else
    {
      id v17 = [v14 fireDate];
      [v17 timeIntervalSinceNow];
      double v19 = v18;

      if (v19 > v11)
      {
        [v13 setSendMode:v6];
        [(IDSCoalesceMessageQueueManager *)self _resetTimerForTopic:v20 withDelay:v11];
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_createTimerForTopic:(id)a3 withDelay:(double)a4
{
  id v6 = a3;
  id v7 = +[IDSFoundationLog delivery];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v13 = v6;
    __int16 v14 = 2048;
    double v15 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Creating coalesce queue timer for topic : %@ with delay : %f", buf, 0x16u);
  }

  id v8 = objc_alloc((Class)IMDispatchTimer);
  int v9 = im_primary_queue();
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001B6810;
  v11[3] = &unk_100980598;
  v11[4] = self;
  id v10 = [v8 initWithQueue:v9 interval:(unint64_t)a4 repeats:0 userInfo:v6 handlerBlock:v11];

  [(NSMutableDictionary *)self->_timerMap setObject:v10 forKey:v6];
}

- (void)_clearTimerForTopic:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSFoundationLog delivery];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Clearing coalesce queue timer for topic : %@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [(NSMutableDictionary *)self->_timerMap objectForKey:v4];
  if (v6)
  {
    id v7 = v6;
    [v6 invalidate];

    [(NSMutableDictionary *)self->_timerMap removeObjectForKey:v4];
  }
  if ([(IDSCoalesceMessageQueueManager *)self _isTopicBeingRateLimited:v4]) {
    [(NSMutableDictionary *)self->_rateLimitMap removeObjectForKey:v4];
  }
}

- (void)_resetTimerForTopic:(id)a3 withDelay:(double)a4
{
  id v6 = a3;
  id v7 = +[IDSFoundationLog delivery];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 2048;
    double v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Resetting coalesce queue timer for topic : %@ with delay : %f", (uint8_t *)&v8, 0x16u);
  }

  [(IDSCoalesceMessageQueueManager *)self _clearTimerForTopic:v6];
  [(IDSCoalesceMessageQueueManager *)self _createTimerForTopic:v6 withDelay:a4];
}

- (void)_timerFired:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = +[IDSFoundationLog delivery];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Coalesce queue timer fired for topic : %@", (uint8_t *)&v6, 0xCu);
  }

  [(IDSCoalesceMessageQueueManager *)self flushCoalesceQueueForTopic:v4];
}

- (double)coalesceDelayForTopic:(id)a3 sendMode:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(IDSCoalesceMessageQueueManager *)self defaultDelayForSendMode:v6];
  double v9 = v8;
  __int16 v10 = [(IDSCoalesceMessageQueueManager *)self formattedKeyForTopic:v7 sendMode:v6];

  double v11 = [(IDSCoalesceMessageQueueManager *)self bag];
  uint64_t v12 = [v11 objectForKey:v10];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v9 = (double)(uint64_t)[v12 integerValue];
  }
  if (+[IMUserDefaults coalesceDelayOverride] >= 1) {
    double v9 = (double)+[IMUserDefaults coalesceDelayOverride];
  }

  return v9;
}

- (double)defaultDelayForSendMode:(id)a3
{
  unint64_t v3 = (unint64_t)[a3 integerValue];
  double result = 0.0;
  if (v3 <= 3) {
    return dbl_100794470[v3];
  }
  return result;
}

- (id)formattedKeyForTopic:(id)a3 sendMode:(id)a4
{
  id v5 = a3;
  unint64_t v6 = (unint64_t)[a4 integerValue];
  if (v6 > 3) {
    id v7 = 0;
  }
  else {
    id v7 = off_100984D20[v6];
  }
  double v8 = +[NSString stringWithFormat:@"%@-%@-%@", @"coalesce-send-delay", v7, v5];

  return v8;
}

- (id)loggableOverviewForTopic:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  unint64_t v6 = [(NSMutableDictionary *)self->_queueMap objectForKey:v5];
  id v7 = [(NSMutableDictionary *)self->_timerMap objectForKey:v5];
  id v8 = objc_alloc((Class)NSString);
  id v9 = [v6 count];
  __int16 v10 = [v7 fireDate];
  [v10 timeIntervalSinceNow];
  id v12 = [v8 initWithFormat:@"<%@  ->  count: %ld  time until firing: %f>", v5, v9, v11];

  os_unfair_lock_unlock(p_lock);

  return v12;
}

- (BOOL)_isTopicBeingRateLimited:(id)a3
{
  unint64_t v3 = [(NSMutableDictionary *)self->_rateLimitMap objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)handleRateLimitingResponseForTopic:(id)a3 ttr:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  id v8 = [(NSMutableDictionary *)self->_rateLimitMap objectForKey:v6];

  if (!v8)
  {
    id v9 = +[IDSFoundationLog delivery];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v6;
      __int16 v12 = 2048;
      id v13 = [v7 integerValue];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Handling server rate limiting response for topic %@ - messages will be held for %ld seconds", (uint8_t *)&v10, 0x16u);
    }

    [(NSMutableDictionary *)self->_rateLimitMap setObject:v7 forKey:v6];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (IDSCoalesceMessageQueueManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IDSCoalesceMessageQueueManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)queueMap
{
  return self->_queueMap;
}

- (void)setQueueMap:(id)a3
{
}

- (NSMutableDictionary)timerMap
{
  return self->_timerMap;
}

- (void)setTimerMap:(id)a3
{
}

- (NSMutableDictionary)rateLimitMap
{
  return self->_rateLimitMap;
}

- (void)setRateLimitMap:(id)a3
{
}

- (IDSServerBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_rateLimitMap, 0);
  objc_storeStrong((id *)&self->_timerMap, 0);
  objc_storeStrong((id *)&self->_queueMap, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end