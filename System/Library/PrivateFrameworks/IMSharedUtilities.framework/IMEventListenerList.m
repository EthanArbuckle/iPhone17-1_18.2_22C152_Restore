@interface IMEventListenerList
- (BOOL)containsObject:(id)a3;
- (IMEventListenerList)init;
- (unint64_t)count;
- (void)addObject:(id)a3;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)removeObject:(id)a3;
@end

@implementation IMEventListenerList

- (IMEventListenerList)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMEventListenerList;
  v2 = [(IMEventListenerList *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    eventListeners = v2->_eventListeners;
    v2->_eventListeners = (NSMutableArray *)v3;
  }
  return v2;
}

- (unint64_t)count
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = v2->_eventListeners;
  unint64_t v4 = 0;
  uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v7), "eventListener", (void)v11);
        BOOL v9 = v8 != 0;

        v4 += v9;
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v2);
  return v4;
}

- (void)addObject:(id)a3
{
  id v7 = a3;
  unint64_t v4 = self;
  objc_sync_enter(v4);
  eventListeners = v4->_eventListeners;
  uint64_t v6 = [[IMEventListenerReference alloc] initWithEventListener:v7];
  [(NSMutableArray *)eventListeners addObject:v6];

  objc_sync_exit(v4);
}

- (void)removeObject:(id)a3
{
  id v9 = a3;
  unint64_t v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(NSMutableArray *)v4->_eventListeners count];
  if (v5 - 1 >= 0)
  {
    do
    {
      uint64_t v6 = [(NSMutableArray *)v4->_eventListeners objectAtIndex:--v5];
      id v7 = [v6 eventListener];
      if (v7) {
        BOOL v8 = v7 == v9;
      }
      else {
        BOOL v8 = 1;
      }
      if (v8) {
        [(NSMutableArray *)v4->_eventListeners removeObjectAtIndex:v5];
      }
    }
    while (v5 > 0);
  }
  objc_sync_exit(v4);
}

- (BOOL)containsObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(NSMutableArray *)v5->_eventListeners count];
  if (v6 - 1 < 0)
  {
LABEL_7:
    BOOL v10 = 0;
    goto LABEL_8;
  }
  while (1)
  {
    id v7 = [(NSMutableArray *)v5->_eventListeners objectAtIndex:--v6];
    uint64_t v8 = [v7 eventListener];
    id v9 = (void *)v8;
    if (!v8)
    {
      [(NSMutableArray *)v5->_eventListeners removeObjectAtIndex:v6];
      goto LABEL_6;
    }
    if ((id)v8 == v4) {
      break;
    }
LABEL_6:

    if (v6 <= 0) {
      goto LABEL_7;
    }
  }

  BOOL v10 = 1;
LABEL_8:
  objc_sync_exit(v5);

  return v10;
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, uint64_t, char *))a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  char v17 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = v5->_eventListeners;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v6);
      }
      long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "eventListener", (void)v13);
      if (v11) {
        v4[2](v4, v11, v8++, &v17);
      }
      BOOL v12 = v17 == 0;

      if (!v12) {
        break;
      }
      if (v7 == ++v10)
      {
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  objc_sync_exit(v5);
}

- (void).cxx_destruct
{
}

@end