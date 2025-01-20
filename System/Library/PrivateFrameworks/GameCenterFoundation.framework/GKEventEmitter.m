@interface GKEventEmitter
+ (id)eventEmitterForProtocols:(id)a3;
+ (id)eventEmitterForProtocols:(id)a3 shouldQueue:(BOOL)a4;
- (BOOL)listenerRegisteredForSelector:(SEL)a3;
- (BOOL)shouldQueue;
- (GKEventEmitter)initWithSupportedProtocols:(id)a3 shouldQueue:(BOOL)a4;
- (NSHashTable)listeners;
- (NSMutableArray)queuedEvents;
- (NSMutableArray)supportedProtocols;
- (id)invocationForProtocol:(id)a3 selector:(SEL)a4;
- (id)methodSignatureForProtocol:(id)a3 selector:(SEL)a4;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)dispatchQueuedEventsToListener:(id)a3;
- (void)forwardInvocation:(id)a3;
- (void)registerListener:(id)a3;
- (void)setListeners:(id)a3;
- (void)setQueuedEvents:(id)a3;
- (void)setShouldQueue:(BOOL)a3;
- (void)setSupportedProtocols:(id)a3;
- (void)unregisterAllListeners;
- (void)unregisterListener:(id)a3;
@end

@implementation GKEventEmitter

- (GKEventEmitter)initWithSupportedProtocols:(id)a3 shouldQueue:(BOOL)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GKEventEmitter;
  v7 = [(GKEventEmitter *)&v12 init];
  if (v7)
  {
    v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [(GKEventEmitter *)v7 setListeners:v8];

    v9 = [MEMORY[0x1E4F1CA48] arrayWithArray:v6];
    [(GKEventEmitter *)v7 setSupportedProtocols:v9];

    v10 = [MEMORY[0x1E4F1CA48] array];
    [(GKEventEmitter *)v7 setQueuedEvents:v10];

    v7->_shouldQueue = a4;
  }

  return v7;
}

- (void)setSupportedProtocols:(id)a3
{
}

- (void)setQueuedEvents:(id)a3
{
}

- (void)setListeners:(id)a3
{
}

+ (id)eventEmitterForProtocols:(id)a3 shouldQueue:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [[GKEventEmitter alloc] initWithSupportedProtocols:v5 shouldQueue:v4];

  return v6;
}

+ (id)eventEmitterForProtocols:(id)a3
{
  return +[GKEventEmitter eventEmitterForProtocols:a3 shouldQueue:1];
}

- (void)dispatchQueuedEventsToListener:(id)a3
{
  id v8 = a3;
  if ([(NSMutableArray *)self->_queuedEvents count])
  {
    uint64_t v4 = [(NSMutableArray *)self->_queuedEvents objectAtIndex:0];
    if (v4)
    {
      id v5 = (void *)v4;
      unint64_t v6 = 0;
      while (1)
      {
        [v5 selector];
        if (objc_opt_respondsToSelector())
        {
          [v5 invokeWithTarget:v8];
          [(NSMutableArray *)self->_queuedEvents removeObjectAtIndex:v6];
        }
        else
        {
          ++v6;
        }
        if (v6 >= [(NSMutableArray *)self->_queuedEvents count]) {
          break;
        }
        uint64_t v7 = [(NSMutableArray *)self->_queuedEvents objectAtIndex:v6];

        id v5 = (void *)v7;
        if (!v7) {
          goto LABEL_11;
        }
      }
    }
  }
LABEL_11:
}

- (void)registerListener:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NSHashTable *)self->_listeners containsObject:v4])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = self->_supportedProtocols;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          if (objc_msgSend(v4, "conformsToProtocol:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10))
          {
            [(NSHashTable *)self->_listeners addObject:v4];
            [(GKEventEmitter *)self dispatchQueuedEventsToListener:v4];
            goto LABEL_12;
          }
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (void)unregisterListener:(id)a3
{
}

- (void)unregisterAllListeners
{
}

- (id)methodSignatureForProtocol:(id)a3 selector:(SEL)a4
{
  id v5 = (Protocol *)a3;
  objc_method_description MethodDescription = protocol_getMethodDescription(v5, a4, 1, 1);
  types = MethodDescription.types;
  if (MethodDescription.name || (objc_method_description v8 = protocol_getMethodDescription(v5, a4, 0, 1), types = v8.types, v8.name))
  {
    v9 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:types];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)invocationForProtocol:(id)a3 selector:(SEL)a4
{
  id v5 = -[GKEventEmitter methodSignatureForProtocol:selector:](self, "methodSignatureForProtocol:selector:", a3);
  uint64_t v6 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v5];
  [v6 setSelector:a4];

  return v6;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)GKEventEmitter;
  id v5 = -[GKEventEmitter methodSignatureForSelector:](&v17, sel_methodSignatureForSelector_);
  if (!v5)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = self->_supportedProtocols;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = -[GKEventEmitter methodSignatureForProtocol:selector:](self, "methodSignatureForProtocol:selector:", *(void *)(*((void *)&v13 + 1) + 8 * i), a3, (void)v13);
          if (v11)
          {
            id v5 = (void *)v11;
            goto LABEL_12;
          }
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    id v5 = 0;
LABEL_12:
  }

  return v5;
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 selector];
  id v5 = [(GKEventEmitter *)self listeners];
  uint64_t v6 = (void *)[v5 copy];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v8)
  {

LABEL_13:
    if (self->_shouldQueue)
    {
      [v4 retainArguments];
      [(NSMutableArray *)self->_queuedEvents addObject:v4];
    }
    goto LABEL_15;
  }
  uint64_t v9 = v8;
  char v10 = 0;
  uint64_t v11 = *(void *)v15;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v15 != v11) {
        objc_enumerationMutation(v7);
      }
      uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8 * i);
      if (objc_opt_respondsToSelector())
      {
        objc_msgSend(v4, "invokeWithTarget:", v13, (void)v14);
        char v10 = 1;
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  }
  while (v9);

  if ((v10 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_15:
}

- (BOOL)listenerRegisteredForSelector:(SEL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = self->_listeners;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_opt_respondsToSelector())
        {
          BOOL v8 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_11:

  return v8;
}

- (NSHashTable)listeners
{
  return self->_listeners;
}

- (NSMutableArray)supportedProtocols
{
  return self->_supportedProtocols;
}

- (BOOL)shouldQueue
{
  return self->_shouldQueue;
}

- (void)setShouldQueue:(BOOL)a3
{
  self->_shouldQueue = a3;
}

- (NSMutableArray)queuedEvents
{
  return self->_queuedEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedEvents, 0);
  objc_storeStrong((id *)&self->_supportedProtocols, 0);

  objc_storeStrong((id *)&self->_listeners, 0);
}

@end