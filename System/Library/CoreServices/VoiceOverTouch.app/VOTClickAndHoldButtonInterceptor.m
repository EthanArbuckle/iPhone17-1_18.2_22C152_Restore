@interface VOTClickAndHoldButtonInterceptor
- (VOTClickAndHoldButtonInterceptor)initWithThreadKey:(id)a3;
- (double)holdDuration;
- (double)releaseDuration;
- (id)clickAndHoldHandler;
- (id)clickHandler;
- (id)holdHandler;
- (void)_drainQueueAndSendEventsToSystem:(BOOL)a3;
- (void)_holdTimerFired;
- (void)_processStateChangeWithEvent:(int64_t)a3 axEvent:(id)a4;
- (void)_releaseTimerFired;
- (void)_resetStateAndSendPendingEventsToSystem:(BOOL)a3;
- (void)buttonDownOccurred:(id)a3;
- (void)buttonUpOccurred:(id)a3;
- (void)dealloc;
- (void)setClickAndHoldHandler:(id)a3;
- (void)setClickHandler:(id)a3;
- (void)setHoldDuration:(double)a3;
- (void)setHoldHandler:(id)a3;
- (void)setReleaseDuration:(double)a3;
@end

@implementation VOTClickAndHoldButtonInterceptor

- (VOTClickAndHoldButtonInterceptor)initWithThreadKey:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VOTClickAndHoldButtonInterceptor;
  v5 = [(VOTClickAndHoldButtonInterceptor *)&v16 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v7 = dispatch_queue_create("VOTClickAndHoldButtonInterceptor", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    v5->_state = 0;
    v5->_holdDuration = 1.0;
    v5->_releaseDuration = 0.5;
    v9 = (SCRCTargetSelectorTimer *)[objc_allocWithZone((Class)SCRCTargetSelectorTimer) initWithTarget:v5 selector:"_holdTimerFired" threadKey:v4];
    holdTimer = v5->_holdTimer;
    v5->_holdTimer = v9;

    v11 = (SCRCTargetSelectorTimer *)[objc_allocWithZone((Class)SCRCTargetSelectorTimer) initWithTarget:v5 selector:"_releaseTimerFired" threadKey:v4];
    releaseTimer = v5->_releaseTimer;
    v5->_releaseTimer = v11;

    uint64_t v13 = +[NSMutableArray array];
    eventQueue = v5->_eventQueue;
    v5->_eventQueue = (NSMutableArray *)v13;
  }
  return v5;
}

- (void)dealloc
{
  holdTimer = self->_holdTimer;
  if (holdTimer)
  {
    [(SCRCTargetSelectorTimer *)holdTimer invalidate];
    id v4 = self->_holdTimer;
    self->_holdTimer = 0;
  }
  releaseTimer = self->_releaseTimer;
  if (releaseTimer)
  {
    [(SCRCTargetSelectorTimer *)releaseTimer invalidate];
    v6 = self->_releaseTimer;
    self->_releaseTimer = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)VOTClickAndHoldButtonInterceptor;
  [(VOTClickAndHoldButtonInterceptor *)&v7 dealloc];
}

- (void)buttonDownOccurred:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VOTClickAndHoldButtonInterceptor;
  [(VOTButtonInterceptor *)&v9 buttonDownOccurred:v4];
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10010D590;
  v7[3] = &unk_1001B3448;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)buttonUpOccurred:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VOTClickAndHoldButtonInterceptor;
  [(VOTButtonInterceptor *)&v9 buttonUpOccurred:v4];
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10010D66C;
  v7[3] = &unk_1001B3448;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_processStateChangeWithEvent:(int64_t)a3 axEvent:(id)a4
{
  id v6 = a4;
  p_state = &self->_state;
  switch(self->_state)
  {
    case 0:
      if (a3) {
        goto LABEL_27;
      }
      [(NSMutableArray *)self->_eventQueue addObject:v6];
      [(SCRCTargetSelectorTimer *)self->_holdTimer dispatchAfterDelay:self->_holdDuration];
      uint64_t v8 = 1;
      goto LABEL_26;
    case 1:
      if (!a3) {
        goto LABEL_32;
      }
      if (a3 == 1)
      {
        [(NSMutableArray *)self->_eventQueue addObject:v6];
        [(SCRCTargetSelectorTimer *)self->_holdTimer cancel];
        [(SCRCTargetSelectorTimer *)self->_releaseTimer dispatchAfterDelay:self->_releaseDuration];
        uint64_t v8 = 2;
        goto LABEL_26;
      }
      if (a3 != 2) {
        goto LABEL_27;
      }
      objc_super v16 = [(VOTClickAndHoldButtonInterceptor *)self holdHandler];

      if (v16)
      {
        v17 = [(VOTClickAndHoldButtonInterceptor *)self holdHandler];
        v17[2]();
      }
      uint64_t v8 = 4;
      goto LABEL_26;
    case 2:
      if (a3)
      {
        if (a3 == 3)
        {
          objc_super v9 = [(VOTClickAndHoldButtonInterceptor *)self clickHandler];

          if (v9)
          {
            v10 = [(VOTClickAndHoldButtonInterceptor *)self clickHandler];
            int v11 = v10[2]();

            uint64_t v12 = v11 ^ 1u;
          }
          else
          {
            uint64_t v12 = 1;
          }
          v15 = self;
        }
        else
        {
LABEL_27:
          v18 = VOTLogEvent();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            sub_100124898(&self->_state, a3, v18);
          }

LABEL_30:
          v15 = self;
          uint64_t v12 = 0;
        }
LABEL_31:
        [(VOTClickAndHoldButtonInterceptor *)v15 _resetStateAndSendPendingEventsToSystem:v12];
      }
      else
      {
        [(NSMutableArray *)self->_eventQueue addObject:v6];
        [(SCRCTargetSelectorTimer *)self->_releaseTimer cancel];
        [(SCRCTargetSelectorTimer *)self->_holdTimer dispatchAfterDelay:self->_holdDuration];
        uint64_t v8 = 3;
LABEL_26:
        int64_t *p_state = v8;
      }
LABEL_32:

      return;
    case 3:
      if (a3 == 1) {
        goto LABEL_20;
      }
      if (a3 != 2) {
        goto LABEL_27;
      }
      uint64_t v13 = [(VOTClickAndHoldButtonInterceptor *)self clickAndHoldHandler];

      if (v13)
      {
        v14 = [(VOTClickAndHoldButtonInterceptor *)self clickAndHoldHandler];
        v14[2]();
      }
      if ([(NSMutableArray *)self->_eventQueue count] != (id)3) {
        goto LABEL_27;
      }
      -[NSMutableArray removeObjectsInRange:](self->_eventQueue, "removeObjectsInRange:", 0, 2);
      [(VOTClickAndHoldButtonInterceptor *)self _drainQueueAndSendEventsToSystem:1];
      uint64_t v8 = 5;
      goto LABEL_26;
    case 4:
      if (a3 != 1) {
        goto LABEL_27;
      }
      goto LABEL_30;
    case 5:
      if (a3 != 1) {
        goto LABEL_27;
      }
LABEL_20:
      [(NSMutableArray *)self->_eventQueue addObject:v6];
      v15 = self;
      uint64_t v12 = 1;
      goto LABEL_31;
    default:
      goto LABEL_27;
  }
}

- (void)_resetStateAndSendPendingEventsToSystem:(BOOL)a3
{
  BOOL v3 = a3;
  self->_state = 0;
  [(SCRCTargetSelectorTimer *)self->_holdTimer cancel];
  [(SCRCTargetSelectorTimer *)self->_releaseTimer cancel];

  [(VOTClickAndHoldButtonInterceptor *)self _drainQueueAndSendEventsToSystem:v3];
}

- (void)_holdTimerFired
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010DA64;
  block[3] = &unk_1001B33B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_releaseTimerFired
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010DAF0;
  block[3] = &unk_1001B33B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_drainQueueAndSendEventsToSystem:(BOOL)a3
{
  if (a3)
  {
    id v4 = +[AXEventTapManager sharedManager];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v5 = self->_eventQueue;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        objc_super v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(v4, "sendHIDSystemEvent:repostCreatorHIDEvent:senderID:", *(void *)(*((void *)&v10 + 1) + 8 * (void)v9), 1, 0x8000000817319373, (void)v10);
          usleep(0x3E8u);
          objc_super v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
  [(NSMutableArray *)self->_eventQueue removeAllObjects];
}

- (double)holdDuration
{
  return self->_holdDuration;
}

- (void)setHoldDuration:(double)a3
{
  self->_holdDuration = a3;
}

- (double)releaseDuration
{
  return self->_releaseDuration;
}

- (void)setReleaseDuration:(double)a3
{
  self->_releaseDuration = a3;
}

- (id)clickHandler
{
  return self->_clickHandler;
}

- (void)setClickHandler:(id)a3
{
}

- (id)holdHandler
{
  return self->_holdHandler;
}

- (void)setHoldHandler:(id)a3
{
}

- (id)clickAndHoldHandler
{
  return self->_clickAndHoldHandler;
}

- (void)setClickAndHoldHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clickAndHoldHandler, 0);
  objc_storeStrong(&self->_holdHandler, 0);
  objc_storeStrong(&self->_clickHandler, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_holdTimer, 0);

  objc_storeStrong((id *)&self->_releaseTimer, 0);
}

@end