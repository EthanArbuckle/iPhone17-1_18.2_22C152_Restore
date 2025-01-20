@interface BWSinkNode
+ (void)initialize;
- (BOOL)isActive;
- (BWSinkNode)initWithSinkID:(id)a3;
- (NSString)currentStateDebugString;
- (NSString)sinkID;
- (id)nodeType;
- (int64_t)liveConfigurationID;
- (uint64_t)_setupSinkNodeStateMachine;
- (void)addOutput:(id)a3;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)notifyWhenActive:(id)a3;
- (void)notifyWhenConfigurationID:(int64_t)a3 becomesLive:(id)a4;
- (void)notifyWhenIdle:(id)a3;
@end

@implementation BWSinkNode

- (id)nodeType
{
  return @"Sink";
}

- (uint64_t)_setupSinkNodeStateMachine
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = [[FigStateMachine alloc] initWithLabel:@"BWSinkNodeStateMachine" stateCount:4 initialState:1 owner:result];
    *(void *)(v1 + 96) = v2;
    [(FigStateMachine *)v2 setPerformsAtomicStateTransitions:0];
    [*(id *)(v1 + 96) setLabel:@"Idle" forState:1];
    [*(id *)(v1 + 96) setLabel:@"Activating" forState:2];
    [*(id *)(v1 + 96) setLabel:@"Active" forState:4];
    v3 = *(void **)(v1 + 96);
    return [v3 setLabel:@"Deactivating" forState:8];
  }
  return result;
}

- (NSString)sinkID
{
  return self->_sinkID;
}

- (void)notifyWhenActive:(id)a3
{
}

- (BWSinkNode)initWithSinkID:(id)a3
{
  if (!a3)
  {
    fig_log_get_emitter();
    uint64_t v10 = v3;
    int v9 = 0;
    FigDebugAssert3();
  }
  v11.receiver = self;
  v11.super_class = (Class)BWSinkNode;
  v6 = [(BWNode *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_stateLock._os_unfair_lock_opaque = 0;
    -[BWSinkNode _setupSinkNodeStateMachine]((uint64_t)v6);
    v7->_sinkID = (NSString *)[a3 copy];
    v7->_configurationHandlerLock = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    v7->_configurationLiveHandlers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7->_configurationLiveIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v7;
}

- (void)notifyWhenIdle:(id)a3
{
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ([(BWNode *)self supportsConcurrentLiveInputCallbacks])
  {
    uint64_t v20 = [NSString stringWithFormat:@"%@ supports concurrent live input callbacks, and BWSinkNode doesn't know how to manage the idle state for nodes with concurrent input callbacks", self];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v20 userInfo:0]);
  }
  [(BWNode *)self configurationID];
  BOOL v7 = [(BWNode *)self allInputsHaveReachedState:1];
  os_unfair_lock_lock(&self->_stateLock);
  [(FigStateMachine *)self->_stateMachine transitionToState:2 fromState:1];
  if (v7
    && [(FigStateMachine *)self->_stateMachine transitionToState:4 fromState:2])
  {
    handlersToCallWhenActive = self->_handlersToCallWhenActive;
    self->_handlersToCallWhenActive = 0;
    os_unfair_lock_unlock(&self->_stateLock);
    if (handlersToCallWhenActive)
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v9 = [(NSMutableArray *)handlersToCallWhenActive countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v27;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v27 != v11) {
              objc_enumerationMutation(handlersToCallWhenActive);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v26 + 1) + 8 * v12++) + 16))();
          }
          while (v10 != v12);
          uint64_t v10 = [(NSMutableArray *)handlersToCallWhenActive countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v10);
      }
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_stateLock);
  }
  pthread_mutex_lock((pthread_mutex_t *)self->_configurationHandlerLock);
  self->_liveConfigurationID = a3;
  if ([(NSMutableArray *)self->_configurationLiveIDs count]
    && (configurationLiveIDs = self->_configurationLiveIDs,
        v25[0] = MEMORY[0x1E4F143A8],
        v25[1] = 3221225472,
        v25[2] = __70__BWSinkNode_configurationWithID_updatedFormat_didBecomeLiveForInput___block_invoke,
        v25[3] = &__block_descriptor_40_e25_B32__0__NSNumber_8Q16_B24l,
        v25[4] = a3,
        v14 = (void *)-[NSMutableArray indexesOfObjectsPassingTest:](configurationLiveIDs, "indexesOfObjectsPassingTest:", v25), [v14 count]))
  {
    id v15 = (id)[(NSMutableArray *)self->_configurationLiveHandlers objectsAtIndexes:v14];
    [(NSMutableArray *)self->_configurationLiveHandlers removeObjectsAtIndexes:v14];
    [(NSMutableArray *)self->_configurationLiveIDs removeObjectsAtIndexes:v14];
    pthread_mutex_unlock((pthread_mutex_t *)self->_configurationHandlerLock);
    if (v15)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v30 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v22;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v22 != v18) {
              objc_enumerationMutation(v15);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v21 + 1) + 8 * v19++) + 16))();
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v30 count:16];
        }
        while (v17);
      }
    }
  }
  else
  {
    pthread_mutex_unlock((pthread_mutex_t *)self->_configurationHandlerLock);
  }
}

+ (void)initialize
{
}

- (void)dealloc
{
  [(FigStateMachine *)self->_stateMachine currentState];
  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)BWSinkNode;
  [(BWNode *)&v3 dealloc];
}

- (void)notifyWhenConfigurationID:(int64_t)a3 becomesLive:(id)a4
{
  if ([(NSArray *)[(BWNode *)self inputs] count] >= 2) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Don't know how to track configuration IDs becoming live for sink nodes with multiple inputs" userInfo:0]);
  }
  pthread_mutex_lock((pthread_mutex_t *)self->_configurationHandlerLock);
  int64_t liveConfigurationID = self->_liveConfigurationID;
  if (liveConfigurationID >= a3)
  {
    pthread_mutex_unlock((pthread_mutex_t *)self->_configurationHandlerLock);
    uint64_t v10 = (void (*)(id, int64_t))*((void *)a4 + 2);
    v10(a4, liveConfigurationID);
  }
  else
  {
    v8 = (void *)[a4 copy];
    [(NSMutableArray *)self->_configurationLiveHandlers addObject:v8];

    -[NSMutableArray addObject:](self->_configurationLiveIDs, "addObject:", [NSNumber numberWithLongLong:a3]);
    configurationHandlerLock = self->_configurationHandlerLock;
    pthread_mutex_unlock((pthread_mutex_t *)configurationHandlerLock);
  }
}

- (NSString)currentStateDebugString
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = [(NSString *)[(FigStateMachine *)self->_stateMachine currentStateLabel] lowercaseString];
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (BOOL)isActive
{
  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  LODWORD(v2) = [(FigStateMachine *)v2->_stateMachine currentState];
  os_unfair_lock_unlock(p_stateLock);
  return v2 != 1;
}

- (void)addOutput:(id)a3
{
}

- (int64_t)liveConfigurationID
{
  pthread_mutex_lock((pthread_mutex_t *)self->_configurationHandlerLock);
  int64_t liveConfigurationID = self->_liveConfigurationID;
  pthread_mutex_unlock((pthread_mutex_t *)self->_configurationHandlerLock);
  return liveConfigurationID;
}

BOOL __70__BWSinkNode_configurationWithID_updatedFormat_didBecomeLiveForInput___block_invoke(uint64_t a1, void *a2)
{
  return [a2 longLongValue] <= *(void *)(a1 + 32);
}

- (void)didReachEndOfDataForInput:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(BWNode *)self allInputsHaveReachedState:0];
  os_unfair_lock_lock(&self->_stateLock);
  [(FigStateMachine *)self->_stateMachine transitionToState:8 fromState:4];
  if (v4
    && [(FigStateMachine *)self->_stateMachine transitionToState:1 fromState:8])
  {
    handlersToCallWhenIdle = self->_handlersToCallWhenIdle;
    self->_handlersToCallWhenIdle = 0;
    os_unfair_lock_unlock(&self->_stateLock);
    if (handlersToCallWhenIdle)
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      uint64_t v6 = [(NSMutableArray *)handlersToCallWhenIdle countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(handlersToCallWhenIdle);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * i) + 16))();
          }
          uint64_t v7 = [(NSMutableArray *)handlersToCallWhenIdle countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_stateLock);
  }
}

@end