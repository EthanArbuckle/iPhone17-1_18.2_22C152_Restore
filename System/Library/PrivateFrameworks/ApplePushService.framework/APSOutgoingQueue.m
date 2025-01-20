@interface APSOutgoingQueue
- (void)_queueChanged;
- (void)_recalculatePowerAssertion;
- (void)_recalculateTimer;
- (void)_timerFired:(id)a3;
- (void)clearEnqueuedSendsOnInterface:(id)a3;
- (void)enqueueSendBlock:(id)a3 completionBlock:(id)a4;
- (void)handleConnectionClosedOnInterface:(id)a3;
- (void)handleConnectionOpened;
- (void)handleResponseForPendingItem:(id)a3 error:(id)a4 onInterface:(id)a5;
@end

@implementation APSOutgoingQueue

- (void)enqueueSendBlock:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  if ((unint64_t)[(NSMutableArray *)self->_queue count] > 0x63)
  {
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000CB0A8((uint64_t)self);
      }
      v14 = APSError();
      v7[2](v7, 0, v14);
    }
  }
  else if (v6)
  {
    v8 = [APSOutgoingItem alloc];
    v9 = +[NSDate distantFuture];
    [v9 timeIntervalSinceNow];
    v10 = -[APSOutgoingItem initWithSendBlock:completionBlock:timeout:](v8, "initWithSendBlock:completionBlock:timeout:", v6, v7);

    queue = self->_queue;
    if (!queue)
    {
      v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v13 = self->_queue;
      self->_queue = v12;

      queue = self->_queue;
    }
    [(NSMutableArray *)queue addObject:v10];
    [(APSOutgoingQueue *)self _queueChanged];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000CB028((uint64_t)self);
  }
}

- (void)handleResponseForPendingItem:(id)a3 error:(id)a4 onInterface:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(NSMutableArray *)self->_queue count];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = 0;
    while (1)
    {
      v14 = [(NSMutableArray *)self->_queue objectAtIndex:v13];
      v15 = [v14 sendInterface];
      unsigned __int8 v16 = [v15 isEqualToString:v10];

      if (v16) {
        break;
      }
      if (v12 == (id)++v13) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412546;
    v22 = self;
    __int16 v23 = 2048;
    uint64_t v24 = v13;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: handleResponseForPendingItem - firstSentIndex = %lu", (uint8_t *)&v21, 0x16u);
  }
  if (v13 == 0x7FFFFFFFFFFFFFFFLL || ![(NSMutableArray *)self->_queue count])
  {
    v17 = 0;
  }
  else
  {
    v17 = [(NSMutableArray *)self->_queue objectAtIndex:v13];
  }
  if ([v17 sent])
  {
    uint64_t v18 = [v17 completionBlock];
    v19 = (void *)v18;
    if (v18) {
      (*(void (**)(uint64_t, id, id))(v18 + 16))(v18, v8, v9);
    }
    [(NSMutableArray *)self->_queue removeObjectAtIndex:v13];
    [(APSOutgoingQueue *)self _queueChanged];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    id v20 = [(NSMutableArray *)self->_queue count];
    int v21 = 138413058;
    v22 = self;
    __int16 v23 = 2112;
    uint64_t v24 = (uint64_t)v8;
    __int16 v25 = 2112;
    id v26 = v9;
    __int16 v27 = 2048;
    id v28 = v20;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%@: Received response %@ %@ when there were no pending items (queue size %lu)", (uint8_t *)&v21, 0x2Au);
  }
}

- (void)handleConnectionOpened
{
  +[NSDate timeIntervalSinceReferenceDate];
  self->_lastReceivedAckOrReconnect = v3;
  [(APSOutgoingQueue *)self _queueChanged];
}

- (void)handleConnectionClosedOnInterface:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v6 = (uint64_t)[(NSMutableArray *)self->_queue count];
  if (v6 >= 1)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i < v7; ++i)
    {
      id v9 = [(NSMutableArray *)self->_queue objectAtIndex:i];
      id v10 = [v9 sendInterface];
      unsigned int v11 = [v10 isEqualToString:v4];

      if (v11)
      {
        [v9 setSent:0];
        [v9 setSendInterface:0];
        [v5 addObject:v9];
        [(NSMutableArray *)self->_queue removeObjectAtIndex:i--];
        --v7;
      }
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    uint64_t v13 = self;
    __int16 v14 = 2048;
    id v15 = [v5 count];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Moving %lu unsent items to the end of queue", (uint8_t *)&v12, 0x16u);
  }
  [(NSMutableArray *)self->_queue addObjectsFromArray:v5];
  [(APSOutgoingQueue *)self _queueChanged];
}

- (void)clearEnqueuedSendsOnInterface:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (uint64_t)[(NSMutableArray *)self->_queue count];
  if (v5 < 1)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    for (uint64_t i = 0; i < v6; ++i)
    {
      id v9 = [(NSMutableArray *)self->_queue objectAtIndex:i];
      id v10 = [v9 sendInterface];
      unsigned int v11 = [v10 isEqualToString:v4];

      if (v11)
      {
        [v9 setSent:0];
        [v9 setSendInterface:0];
        [(NSMutableArray *)self->_queue removeObjectAtIndex:i--];
        --v6;
        ++v7;
      }
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    uint64_t v13 = self;
    __int16 v14 = 2048;
    uint64_t v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Removing %lu unsent items from the of queue", (uint8_t *)&v12, 0x16u);
  }
  [(APSOutgoingQueue *)self _queueChanged];
}

- (void)_queueChanged
{
  if (![(NSMutableArray *)self->_queue count])
  {
    queue = self->_queue;
    self->_queue = 0;
  }
  id v4 = objc_alloc_init((Class)NSMutableIndexSet);
  uint64_t v5 = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008CD48;
  v7[3] = &unk_10012BED8;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)v5 enumerateObjectsUsingBlock:v7];
  [(NSMutableArray *)self->_queue removeObjectsAtIndexes:v6];
  [(APSOutgoingQueue *)self _recalculateTimer];
  [(APSOutgoingQueue *)self _recalculatePowerAssertion];
}

- (void)_recalculateTimer
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  double v3 = self->_queue;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v4)
  {
    id v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(v9, "hasTimedOut", (void)v20) & 1) == 0)
        {
          [v9 timeout];
          double v11 = v10;
          int v12 = [v9 timestamp];
          uint64_t v13 = [v12 dateByAddingTimeInterval:(double)(unint64_t)v11];

          if (!v6 || [v13 compare:v6] == (id)-1)
          {
            __int16 v14 = v13;

            id v6 = v14;
          }
        }
      }
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v5);

    if (v6)
    {
      timer = self->_timer;
      BOOL v16 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (timer)
      {
        if (v16)
        {
          *(_DWORD *)buf = 138412546;
          __int16 v25 = self;
          __int16 v26 = 2112;
          __int16 v27 = v6;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Setting outgoing message timer fire date %@", buf, 0x16u);
        }
        [(NSTimer *)self->_timer setFireDate:v6];
      }
      else
      {
        if (v16)
        {
          *(_DWORD *)buf = 138412546;
          __int16 v25 = self;
          __int16 v26 = 2112;
          __int16 v27 = v6;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Creating outgoing message timer with fire date %@", buf, 0x16u);
        }
        v17 = (NSTimer *)[objc_alloc((Class)NSTimer) initWithFireDate:v6 interval:self target:"_timerFired:" selector:0 userInfo:0 repeats:0.0];
        uint64_t v18 = self->_timer;
        self->_timer = v17;

        v19 = +[NSRunLoop currentRunLoop];
        [v19 addTimer:self->_timer forMode:NSDefaultRunLoopMode];
      }
      goto LABEL_26;
    }
  }
  else
  {
  }
  if (!self->_timer) {
    return;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v25 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Invalidating outgoing message timer", buf, 0xCu);
  }
  [(NSTimer *)self->_timer invalidate];
  id v6 = self->_timer;
  self->_timer = 0;
LABEL_26:
}

- (void)_recalculatePowerAssertion
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v3 = self->_queue;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v13 != v6) {
        objc_enumerationMutation(v3);
      }
      [*(id *)(*((void *)&v12 + 1) + 8 * v7) timeout];
      if (v8 < 120.0) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    if (self->_powerAssertion) {
      return;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = self;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Creating power assertion", buf, 0xCu);
    }
    id v9 = +[NSString stringWithFormat:@"%@-outgoingqueue", APSBundleIdentifier];
    double v10 = [(APSPowerAssertion_NoHold *)[APSPowerAssertion alloc] initWithName:v9 category:214];
    powerAssertion = self->_powerAssertion;
    self->_powerAssertion = v10;
  }
  else
  {
LABEL_9:

    if (!self->_powerAssertion) {
      return;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = self;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Releasing power assertion", buf, 0xCu);
    }
    id v9 = self->_powerAssertion;
    self->_powerAssertion = 0;
  }
}

- (void)_timerFired:(id)a3
{
  id v19 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v26 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Outgoing item queue timer fired", buf, 0xCu);
  }
  timer = self->_timer;
  self->_timer = 0;

  id v5 = +[NSArray arrayWithArray:self->_queue];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (([v10 hasTimedOut] & 1) == 0)
        {
          double v11 = [v10 timestamp];
          [v11 timeIntervalSinceNow];
          double v13 = v12;
          [v10 timeout];
          double v15 = v13 + v14;

          if (v15 < 0.0)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              __int16 v26 = self;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Outgoing item timed out", buf, 0xCu);
            }
            [v10 setHasTimedOut:1];
            [v10 sent];
            BOOL v16 = APSError();
            uint64_t v17 = [v10 completionBlock];
            uint64_t v18 = (void *)v17;
            if (v17) {
              (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v16);
            }
            if (([v10 sent] & 1) == 0)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                __int16 v26 = self;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Removing unsent timed out item from queue", buf, 0xCu);
              }
              [(NSMutableArray *)self->_queue removeObject:v10];
            }
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }
  [(APSOutgoingQueue *)self _queueChanged];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerAssertion, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end