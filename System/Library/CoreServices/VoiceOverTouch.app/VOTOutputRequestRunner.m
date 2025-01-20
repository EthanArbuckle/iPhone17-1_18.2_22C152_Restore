@interface VOTOutputRequestRunner
- (BOOL)isActive;
- (BOOL)onHold;
- (VOTOutputRequest)currentRequest;
- (VOTOutputRequestRunner)init;
- (double)performSelector:(SEL)a3 withThreadKey:(id)a4 count:(unsigned int)a5 objects:(id)a6;
- (double)performSelector:(SEL)a3 withThreadKey:(id)a4 waitTime:(double)a5 cancelMask:(unsigned int)a6 count:(unsigned int)a7 objects:(id)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)_handleNotifications:(id)a3;
- (void)_handleProcessActions:(id)a3;
- (void)_initializeThread;
- (void)_performAction:(id)a3 withComponent:(id)a4;
- (void)_processActions;
- (void)dealloc;
- (void)handleEvent:(id)a3;
- (void)resume;
- (void)runOutputRequest:(id)a3;
- (void)sendNotification:(unsigned int)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setOnHold:(BOOL)a3;
@end

@implementation VOTOutputRequestRunner

- (VOTOutputRequestRunner)init
{
  v7.receiver = self;
  v7.super_class = (Class)VOTOutputRequestRunner;
  v2 = [(VOTOutputRequestRunner *)&v7 init];
  if (v2)
  {
    v3 = (SCRCThread *)objc_alloc_init((Class)SCRCThread);
    runnerThread = v2->_runnerThread;
    v2->_runnerThread = v3;

    [(SCRCThread *)v2->_runnerThread performSelector:"_initializeThread" onTarget:v2 count:0 objects:0];
    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  [(SCRCThread *)self->_runnerThread setIsInvalid:1];
  [(SCRCThread *)self->_runnerThread setIsInvalid:1];
  v3.receiver = self;
  v3.super_class = (Class)VOTOutputRequestRunner;
  [(VOTOutputRequestRunner *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(id)objc_opt_class() allocWithZone:a3];
  v4[3] = self->_currentActionIndex;
  id v5 = [(NSArray *)self->_currentActions copy];
  v6 = (void *)*((void *)v4 + 2);
  *((void *)v4 + 2) = v5;

  *((unsigned char *)v4 + 24) = self->_didProcessNoSyncActions;
  *((_OWORD *)v4 + 2) = self->_currentRange;
  return v4;
}

- (void)_initializeThread
{
  AXSetThreadPriority();
  id v4 = +[NSThread currentThread];
  v2 = (objc_class *)objc_opt_class();
  objc_super v3 = NSStringFromClass(v2);
  [v4 setName:v3];
}

- (double)performSelector:(SEL)a3 withThreadKey:(id)a4 count:(unsigned int)a5 objects:(id)a6
{
  [(SCRCThread *)self->_runnerThread performSelector:a3 onTarget:self count:*(void *)&a5 objects:a6];
  return result;
}

- (double)performSelector:(SEL)a3 withThreadKey:(id)a4 waitTime:(double)a5 cancelMask:(unsigned int)a6 count:(unsigned int)a7 objects:(id)a8
{
  -[SCRCThread performSelector:onTarget:cancelMask:count:objects:](self->_runnerThread, "performSelector:onTarget:cancelMask:count:objects:", a3, self, *(void *)&a6, *(void *)&a7, a8, a5);
  return result;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)runOutputRequest:(id)a3
{
  id v4 = a3;
  id v6 = [objc_allocWithZone((Class)NSNumber) initWithUnsignedInt:4];
  id v5 = [objc_allocWithZone((Class)AXIndexMap) init];
  [v5 setObject:v6 forIndex:1];
  [v5 setObject:v4 forIndex:14];

  [(SCRCThread *)self->_runnerThread performSelector:"handleEvent:" onTarget:self cancelMask:0xFFFFFFFFLL count:1 objects:v5];
}

- (void)sendNotification:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v7 = [objc_allocWithZone((Class)AXIndexMap) init];
  id v5 = [objc_allocWithZone((Class)NSNumber) initWithUnsignedInt:v3];
  id v6 = [objc_allocWithZone((Class)NSNumber) initWithUnsignedInt:5];
  [v7 setObject:v5 forIndex:10];
  [v7 setObject:v6 forIndex:1];
  [(SCRCThread *)self->_runnerThread performSelector:"handleEvent:" onTarget:self count:1 objects:v7];
}

- (void)handleEvent:(id)a3
{
  id v6 = a3;
  if (![(VOTOutputRequestRunner *)self onHold])
  {
    id v4 = [v6 objectForIndex:1];
    unsigned int v5 = [v4 unsignedIntValue];

    if (v5 == 5)
    {
      [(VOTOutputRequestRunner *)self _handleNotifications:v6];
    }
    else if (v5 == 4)
    {
      [(VOTOutputRequestRunner *)self _handleProcessActions:v6];
    }
  }

  _objc_release_x1();
}

- (void)resume
{
  [(VOTOutputRequestRunner *)self setOnHold:0];
  id v6 = [(NSArray *)self->_currentActions objectAtIndex:self->_currentActionIndex];
  uint64_t v3 = [v6 originalString];
  NSUInteger location = self->_currentRange.location;
  if (location < (unint64_t)[v3 length])
  {
    unsigned int v5 = [v3 substringFromIndex:self->_currentRange.location];
    [v6 setString:v5];
  }
  [v6 setHasBeenDispatched:0];
  [(VOTOutputRequestRunner *)self _processActions];
}

- (void)_handleNotifications:(id)a3
{
  id v4 = a3;
  if (self->_currentActions)
  {
    id v19 = v4;
    unsigned int v5 = [v4 objectForIndex:10];
    unsigned int v6 = [v5 unsignedIntValue];

    if (v6 == 22)
    {
      id v7 = [v19 objectForIndex:14];
      self->_currentRange.NSUInteger location = (NSUInteger)[v7 rangeValue];
      self->_currentRange.length = v10;
    }
    else if (v6 == 21)
    {
      currentActions = self->_currentActions;
      self->_currentActions = 0;

      [(VOTOutputRequest *)self->_currentRequest setFinishedSuccessfully:0];
      id v7 = +[VOTOutputManager outputManager];
      [v7 finishedOutputRequest:self->_currentRequest];
    }
    else
    {
      id v4 = v19;
      if (v6 != 19) {
        goto LABEL_17;
      }
      id v7 = [v19 objectForIndex:14];
      v8 = [v7 outputRequest];
      if ([(NSArray *)self->_currentActions indexOfObject:v7] == 0x7FFFFFFFFFFFFFFFLL)
      {
        [v8 setFinishedSuccessfully:0];
        v9 = +[VOTOutputManager outputManager];
        [v9 finishedOutputRequest:v8];
      }
      else
      {
        v12 = [v19 objectForIndex:20];
        unsigned __int8 v13 = [v12 BOOLValue];

        v14 = self->_currentActions;
        if (v13)
        {
          v15 = [(NSArray *)v14 objectAtIndex:self->_currentActionIndex];

          if (v15 == v7)
          {
            v16 = [v8 actionCompletionBlock];

            if (v16)
            {
              v17 = [v8 actionCompletionBlock];
              ((void (**)(void, void *, void *))v17)[2](v17, v8, v7);
            }
            [(VOTOutputRequestRunner *)self _processActions];
          }
        }
        else
        {
          self->_currentActions = 0;

          self->_isActive = 0;
          [(VOTOutputRequest *)self->_currentRequest setFinishedSuccessfully:0];
          v18 = +[VOTOutputManager outputManager];
          [v18 finishedOutputRequest:self->_currentRequest];
        }
      }
    }
    id v4 = v19;
  }
LABEL_17:
}

- (void)_handleProcessActions:(id)a3
{
  id v4 = [a3 objectForIndex:14];
  unsigned int v5 = [(VOTOutputRequest *)v4 outputActions];
  self->_didProcessNoSyncActions = 0;
  self->_currentActionIndex = 0;
  currentActions = self->_currentActions;
  self->_currentActions = v5;
  id v7 = v5;

  currentRequest = self->_currentRequest;
  self->_currentRequest = v4;

  [(VOTOutputRequestRunner *)self _processActions];
}

- (void)_performAction:(id)a3 withComponent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v8 = objc_msgSend(v6, "outputEvents", 0);
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v12);
        v14 = +[VOTOutputManager outputManager];
        [v14 sendEvent:v13];

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  [v6 setHasBeenDispatched:1];
  [v7 performAction:v6 owner:self];
}

- (void)_processActions
{
  NSUInteger v3 = [(NSArray *)self->_currentActions count];
  unint64_t v4 = v3;
  if (!self->_didProcessNoSyncActions)
  {
    NSUInteger v27 = v3;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    unsigned int v5 = self->_currentActions;
    id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v29;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if (([v10 hasBeenDispatched] & 1) == 0
            && ([v10 synchronization] & 1) != 0)
          {
            uint64_t v11 = +[VOTOutputManager outputManager];
            v12 = objc_msgSend(v11, "componentForType:", objc_msgSend(v10, "component"));

            if (v12)
            {
              uint64_t v13 = +[NSNull null];
              unsigned __int8 v14 = [v12 isEqual:v13];

              if ((v14 & 1) == 0) {
                [(VOTOutputRequestRunner *)self _performAction:v10 withComponent:v12];
              }
            }
          }
        }
        id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v7);
    }

    self->_didProcessNoSyncActions = 1;
    unint64_t v4 = v27;
  }
  if (v4 > self->_currentActionIndex)
  {
    char v15 = 0;
    while (1)
    {
      long long v16 = -[NSArray objectAtIndex:](self->_currentActions, "objectAtIndex:");
      long long v17 = [v16 objectForVariant:61];
      unsigned __int8 v18 = [v17 BOOLValue];

      if (([v16 hasBeenDispatched] & 1) == 0)
      {
        id v19 = +[VOTOutputManager outputManager];
        v20 = objc_msgSend(v19, "componentForType:", objc_msgSend(v16, "component"));

        if (v20)
        {
          v21 = +[NSNull null];
          unsigned __int8 v22 = [v20 isEqual:v21];

          if ((v22 & 1) == 0)
          {
            [(VOTOutputRequestRunner *)self _performAction:v16 withComponent:v20];
            if (([v16 synchronization] & 2) != 0)
            {

              return;
            }
          }
        }
      }
      v15 |= v18;
      ++self->_currentActionIndex;

      if (v4 <= self->_currentActionIndex) {
        goto LABEL_26;
      }
    }
  }
  char v15 = 0;
LABEL_26:
  currentActions = self->_currentActions;
  self->_currentActions = 0;

  self->_isActive = 0;
  self->_didProcessNoSyncActions = 0;
  [(VOTOutputRequest *)self->_currentRequest setFinishedSuccessfully:1];
  v24 = +[VOTOutputManager outputManager];
  [v24 finishedOutputRequest:self->_currentRequest];

  currentRequest = self->_currentRequest;
  self->_currentRequest = 0;

  if (v15)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, kAXDidFinishSpeakingAssistantNotification, 0, 0, 1u);
  }
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)VOTOutputRequestRunner;
  NSUInteger v3 = [(VOTOutputRequestRunner *)&v6 description];
  unint64_t v4 = +[NSString stringWithFormat:@"%@ - %@", v3, self->_currentRequest];

  return v4;
}

- (BOOL)onHold
{
  return self->_onHold;
}

- (void)setOnHold:(BOOL)a3
{
  self->_onHold = a3;
}

- (VOTOutputRequest)currentRequest
{
  return self->_currentRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_runnerThread, 0);

  objc_storeStrong((id *)&self->_currentActions, 0);
}

@end