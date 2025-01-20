@interface BWStreamStartStopSynchronizer
+ (void)initialize;
- (BOOL)streamWillStart:(id)a3;
- (BOOL)streamWillStop:(id)a3;
- (BOOL)waitForMasterAEToSettle;
- (BWStreamStartStopSynchronizer)initWithStreams:(id)a3 timeoutInSeconds:(float)a4;
- (NSArray)synchronizationSlavesOrderedByPriority;
- (void)dealloc;
- (void)setSynchronizationSlavesOrderedByPriority:(id)a3;
- (void)setWaitForMasterAEToSettle:(BOOL)a3;
- (void)streamDidStart:(id)a3;
- (void)streamDidStop:(id)a3;
@end

@implementation BWStreamStartStopSynchronizer

- (void)setSynchronizationSlavesOrderedByPriority:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];

  self->_synchronizationSlavesOrderedByPriority = (NSArray *)a3;
  v5 = (void *)MEMORY[0x1A6272C70]();
  v6 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(a3);
        }
        v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v12 = -[NSDictionary objectForKeyedSubscript:](self->_streamStatesByPortType, "objectForKeyedSubscript:", [v11 portType]);
        if (v12)
        {
          id v13 = v12;
          if (([v11 isSynchronizationMaster] & 1) == 0
            && ([v6 containsObject:v13] & 1) == 0)
          {
            [v6 addObject:v13];
          }
        }
      }
      uint64_t v8 = [a3 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v8);
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v14 = [(NSDictionary *)self->_streamStatesByPortType allValues];
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v25 + 1) + 8 * v18);
        if (v19) {
          v20 = (void *)v19[2];
        }
        else {
          v20 = 0;
        }
        if (([v20 isSynchronizationMaster] & 1) == 0)
        {
          uint64_t v21 = [v6 indexOfObject:v19];
          if (v21)
          {
            v23 = v6;
            if (v21 != 0x7FFFFFFFFFFFFFFFLL) {
              v23 = objc_msgSend(v6, "subarrayWithRange:", 0, v21);
            }
          }
          else
          {
            v23 = 0;
          }
          if (v19) {
            objc_setProperty_nonatomic(v19, v22, v23, 56);
          }
        }
        ++v18;
      }
      while (v16 != v18);
      uint64_t v24 = [(NSArray *)v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
      uint64_t v16 = v24;
    }
    while (v24);
  }
}

- (BWStreamStartStopSynchronizer)initWithStreams:(id)a3 timeoutInSeconds:(float)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)BWStreamStartStopSynchronizer;
  v6 = [(BWStreamStartStopSynchronizer *)&v27 init];
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v8 = (float *)[a3 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (float *)((char *)i + 1))
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(a3);
          }
          v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ([v11 isSynchronizationMaster])
          {
            uint64_t v8 = -[BWStreamStartStopState initWithStream:masterState:timeoutInSeconds:]([BWStreamStartStopState alloc], v11, 0, a4);
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, objc_msgSend(v11, "portType"));
            goto LABEL_12;
          }
        }
        uint64_t v8 = (float *)[a3 countByEnumeratingWithState:&v23 objects:v29 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v12 = [a3 countByEnumeratingWithState:&v19 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(a3);
          }
          uint64_t v16 = *(void **)(*((void *)&v19 + 1) + 8 * j);
          if (([v16 isSynchronizationMaster] & 1) == 0)
          {
            uint64_t v17 = -[BWStreamStartStopState initWithStream:masterState:timeoutInSeconds:]([BWStreamStartStopState alloc], v16, v8, a4);
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, objc_msgSend(v16, "portType"));
          }
        }
        uint64_t v13 = [a3 countByEnumeratingWithState:&v19 objects:v28 count:16];
      }
      while (v13);
    }
    v6->_streamStatesByPortType = (NSDictionary *)[v7 copy];
  }
  return v6;
}

- (void)setWaitForMasterAEToSettle:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(NSDictionary *)self->_streamStatesByPortType allValues];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * v8);
        if (v9) {
          *(unsigned char *)(v9 + 68) = a3;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)streamDidStart:(id)a3
{
  v3 = -[NSDictionary objectForKeyedSubscript:](self->_streamStatesByPortType, "objectForKeyedSubscript:", [a3 portType]);
  if (v3)
  {
    v4 = v3;
    if (*((_DWORD *)v3 + 2) == 1)
    {
      *((_DWORD *)v3 + 2) = 2;
      dispatch_group_leave(v3[3]);
      *((unsigned char *)v4 + 32) = 0;
    }
  }
}

- (BOOL)waitForMasterAEToSettle
{
  v2 = [(NSArray *)[(NSDictionary *)self->_streamStatesByPortType allValues] firstObject];
  if (v2) {
    LOBYTE(v2) = v2[68] != 0;
  }
  return (char)v2;
}

- (BOOL)streamWillStart:(id)a3
{
  id v3 = -[NSDictionary objectForKeyedSubscript:](self->_streamStatesByPortType, "objectForKeyedSubscript:", [a3 portType]);
  return -[BWStreamStartStopState streamWillStart]((uint64_t)v3);
}

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWStreamStartStopSynchronizer;
  [(BWStreamStartStopSynchronizer *)&v3 dealloc];
}

- (NSArray)synchronizationSlavesOrderedByPriority
{
  v2 = self->_synchronizationSlavesOrderedByPriority;
  return v2;
}

- (BOOL)streamWillStop:(id)a3
{
  id v3 = -[NSDictionary objectForKeyedSubscript:](self->_streamStatesByPortType, "objectForKeyedSubscript:", [a3 portType]);
  return -[BWStreamStartStopState streamWillStop]((uint64_t)v3);
}

- (void)streamDidStop:(id)a3
{
  id v3 = -[NSDictionary objectForKeyedSubscript:](self->_streamStatesByPortType, "objectForKeyedSubscript:", [a3 portType]);
  -[BWStreamStartStopState streamDidStop]((uint64_t)v3);
}

@end