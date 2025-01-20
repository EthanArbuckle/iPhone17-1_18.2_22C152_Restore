@interface _SFSafariViewControllerPrewarmingRequestThrottler
- (_SFSafariViewControllerPrewarmingRequestThrottler)init;
- (double)minimumRequestDelay;
- (id)_URLsToPrewarmForToken:(id)a3;
- (id)_nextTokenToPrewarm;
- (id)_prewarmedURLsWithValidTokens;
- (id)connectionHandler;
- (unint64_t)maximumValidConnectionCount;
- (void)_didPartiallyPrewarmToken:(id)a3;
- (void)_didPrewarmToken:(id)a3;
- (void)_performNextRequest;
- (void)_prewarmURLs:(id)a3;
- (void)_startRequestTimer;
- (void)_stopRequestTimer;
- (void)dealloc;
- (void)invalidateTokenWithID:(unint64_t)a3;
- (void)requestToken:(id)a3;
- (void)resume;
- (void)setConnectionHandler:(id)a3;
- (void)setMaximumValidConnectionCount:(unint64_t)a3;
- (void)setMinimumRequestDelay:(double)a3;
- (void)suspend;
@end

@implementation _SFSafariViewControllerPrewarmingRequestThrottler

- (_SFSafariViewControllerPrewarmingRequestThrottler)init
{
  v13.receiver = self;
  v13.super_class = (Class)_SFSafariViewControllerPrewarmingRequestThrottler;
  v2 = [(_SFSafariViewControllerPrewarmingRequestThrottler *)&v13 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    requestedTokens = v2->_requestedTokens;
    v2->_requestedTokens = (NSHashTable *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    prewarmedTokens = v2->_prewarmedTokens;
    v2->_prewarmedTokens = (NSHashTable *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
    prewarmedURLs = v2->_prewarmedURLs;
    v2->_prewarmedURLs = (NSMutableSet *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    tokensByID = v2->_tokensByID;
    v2->_tokensByID = (NSMutableDictionary *)v9;

    v11 = v2;
  }

  return v2;
}

- (void)requestToken:(id)a3
{
  id v8 = a3;
  if ([v8 isValid])
  {
    tokensByID = self->_tokensByID;
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "requestID"));
    [(NSMutableDictionary *)tokensByID setObject:v8 forKeyedSubscript:v5];

    v6 = [(_SFSafariViewControllerPrewarmingRequestThrottler *)self _URLsToPrewarmForToken:v8];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      [(NSHashTable *)self->_requestedTokens addObject:v8];
      if (!self->_suspended)
      {
        [(_SFSafariViewControllerPrewarmingRequestThrottler *)self _stopRequestTimer];
        [(_SFSafariViewControllerPrewarmingRequestThrottler *)self _startRequestTimer];
      }
    }
    else
    {
      [(_SFSafariViewControllerPrewarmingRequestThrottler *)self _didPrewarmToken:v8];
    }
  }
}

- (void)suspend
{
  self->_suspended = 1;
  [(_SFSafariViewControllerPrewarmingRequestThrottler *)self _stopRequestTimer];
}

- (void)resume
{
  self->_suspended = 0;
  [(_SFSafariViewControllerPrewarmingRequestThrottler *)self _performNextRequest];
}

- (void)invalidateTokenWithID:(unint64_t)a3
{
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  v4 = [(NSMutableDictionary *)self->_tokensByID objectForKeyedSubscript:v5];
  [v4 invalidate];

  [(NSMutableDictionary *)self->_tokensByID setObject:0 forKeyedSubscript:v5];
  if (!self->_requestDelayTimer && !self->_suspended) {
    [(_SFSafariViewControllerPrewarmingRequestThrottler *)self _performNextRequest];
  }
}

- (void)dealloc
{
  [(NSTimer *)self->_requestDelayTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_SFSafariViewControllerPrewarmingRequestThrottler;
  [(_SFSafariViewControllerPrewarmingRequestThrottler *)&v3 dealloc];
}

- (void)_stopRequestTimer
{
  [(NSTimer *)self->_requestDelayTimer invalidate];
  requestDelayTimer = self->_requestDelayTimer;
  self->_requestDelayTimer = 0;
}

- (void)_startRequestTimer
{
  if (self->_minimumRequestDelay <= 0.0)
  {
    [(_SFSafariViewControllerPrewarmingRequestThrottler *)self _performNextRequest];
  }
  else
  {
    objc_initWeak(&location, self);
    objc_super v3 = (void *)MEMORY[0x1E4F1CB00];
    double minimumRequestDelay = self->_minimumRequestDelay;
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    v10 = __71___SFSafariViewControllerPrewarmingRequestThrottler__startRequestTimer__block_invoke;
    v11 = &unk_1E5C733A8;
    objc_copyWeak(&v12, &location);
    id v5 = [v3 timerWithTimeInterval:0 repeats:&v8 block:minimumRequestDelay];
    requestDelayTimer = self->_requestDelayTimer;
    self->_requestDelayTimer = v5;

    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CAC0], "mainRunLoop", v8, v9, v10, v11);
    [v7 addTimer:self->_requestDelayTimer forMode:*MEMORY[0x1E4F1C4B0]];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)_performNextRequest
{
  objc_super v3 = [(_SFSafariViewControllerPrewarmingRequestThrottler *)self _nextTokenToPrewarm];
  if (v3)
  {
    id v12 = v3;
    v4 = [(_SFSafariViewControllerPrewarmingRequestThrottler *)self _URLsToPrewarmForToken:v3];
    if ([v4 count])
    {
      unint64_t maximumValidConnectionCount = self->_maximumValidConnectionCount;
      v6 = [(_SFSafariViewControllerPrewarmingRequestThrottler *)self _prewarmedURLsWithValidTokens];
      uint64_t v7 = [v6 count];

      if (self->_maximumValidConnectionCount)
      {
        unint64_t v8 = maximumValidConnectionCount - v7;
        if (maximumValidConnectionCount - v7 < [v4 count])
        {
          if (maximumValidConnectionCount != v7)
          {
            uint64_t v9 = (void *)[v4 mutableCopy];
            objc_msgSend(v9, "removeObjectsInRange:", v8, objc_msgSend(v4, "count") - v8);
            v10 = [v9 array];
            [(_SFSafariViewControllerPrewarmingRequestThrottler *)self _prewarmURLs:v10];

            [(_SFSafariViewControllerPrewarmingRequestThrottler *)self _didPartiallyPrewarmToken:v12];
          }
          goto LABEL_9;
        }
      }
      v11 = [v4 array];
      [(_SFSafariViewControllerPrewarmingRequestThrottler *)self _prewarmURLs:v11];
    }
    [(_SFSafariViewControllerPrewarmingRequestThrottler *)self _didPrewarmToken:v12];
    [(_SFSafariViewControllerPrewarmingRequestThrottler *)self _performNextRequest];
LABEL_9:

    objc_super v3 = v12;
  }
}

- (void)_prewarmURLs:(id)a3
{
  id v5 = a3;
  -[NSMutableSet addObjectsFromArray:](self->_prewarmedURLs, "addObjectsFromArray:");
  connectionHandler = (void (**)(id, id))self->_connectionHandler;
  if (connectionHandler) {
    connectionHandler[2](connectionHandler, v5);
  }
}

- (id)_nextTokenToPrewarm
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = self->_requestedTokens;
  uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        unint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "isValid", (void)v12))
        {
          if (!v5 || (unint64_t v9 = [v5 requestID], v9 < objc_msgSend(v8, "requestID")))
          {
            id v10 = v8;

            id v5 = v10;
          }
        }
      }
      uint64_t v4 = [(NSHashTable *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_URLsToPrewarmForToken:(id)a3
{
  uint64_t v4 = [a3 URLs];
  id v5 = (void *)[v4 mutableCopy];

  [v5 minusSet:self->_prewarmedURLs];

  return v5;
}

- (id)_prewarmedURLsWithValidTokens
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = self->_prewarmedTokens;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "isValid", (void)v13))
        {
          id v10 = [v9 URLs];
          v11 = [v10 array];
          [v3 addObjectsFromArray:v11];
        }
      }
      uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  [v3 intersectSet:self->_prewarmedURLs];

  return v3;
}

- (void)_didPartiallyPrewarmToken:(id)a3
{
}

- (void)_didPrewarmToken:(id)a3
{
  requestedTokens = self->_requestedTokens;
  id v5 = a3;
  [(NSHashTable *)requestedTokens removeObject:v5];
  [(NSHashTable *)self->_prewarmedTokens addObject:v5];
}

- (id)connectionHandler
{
  return self->_connectionHandler;
}

- (void)setConnectionHandler:(id)a3
{
}

- (double)minimumRequestDelay
{
  return self->_minimumRequestDelay;
}

- (void)setMinimumRequestDelay:(double)a3
{
  self->_double minimumRequestDelay = a3;
}

- (unint64_t)maximumValidConnectionCount
{
  return self->_maximumValidConnectionCount;
}

- (void)setMaximumValidConnectionCount:(unint64_t)a3
{
  self->_unint64_t maximumValidConnectionCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_connectionHandler, 0);
  objc_storeStrong((id *)&self->_requestDelayTimer, 0);
  objc_storeStrong((id *)&self->_tokensByID, 0);
  objc_storeStrong((id *)&self->_prewarmedURLs, 0);
  objc_storeStrong((id *)&self->_prewarmedTokens, 0);

  objc_storeStrong((id *)&self->_requestedTokens, 0);
}

@end