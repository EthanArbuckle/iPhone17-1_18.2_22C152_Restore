@interface SGCuratedChangeNotificationsBaseListener
- (SGCuratedChangeNotificationsBaseListener)init;
- (void)addObserver:(id)a3 forObjectLifetime:(id)a4;
- (void)dealloc;
- (void)fire;
@end

@implementation SGCuratedChangeNotificationsBaseListener

- (void).cxx_destruct
{
}

- (void)fire
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = self->_liveObserversMap;
  uint64_t v4 = objc_sync_enter(v3);
  v5 = (void *)MEMORY[0x1CB79B230](v4);
  v6 = [(NSMapTable *)self->_liveObserversMap objectEnumerator];
  v7 = [v6 allObjects];

  objc_sync_exit(v3);

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x1CB79B230](v9);
        (*(void (**)(uint64_t))(v13 + 16))(v13);
        ++v12;
      }
      while (v10 != v12);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v10 = v9;
    }
    while (v9);
  }
}

- (void)addObserver:(id)a3 forObjectLifetime:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = self->_liveObserversMap;
  objc_sync_enter(v7);
  liveObserversMap = self->_liveObserversMap;
  uint64_t v9 = (void *)[v11 copy];
  uint64_t v10 = (void *)MEMORY[0x1CB79B4C0]();
  [(NSMapTable *)liveObserversMap setObject:v10 forKey:v6];

  objc_sync_exit(v7);
}

- (void)dealloc
{
  [(SGCuratedChangeNotificationsBaseListener *)self stopListening];
  v3.receiver = self;
  v3.super_class = (Class)SGCuratedChangeNotificationsBaseListener;
  [(SGCuratedChangeNotificationsBaseListener *)&v3 dealloc];
}

- (SGCuratedChangeNotificationsBaseListener)init
{
  v6.receiver = self;
  v6.super_class = (Class)SGCuratedChangeNotificationsBaseListener;
  v2 = [(SGCuratedChangeNotificationsBaseListener *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    liveObserversMap = v2->_liveObserversMap;
    v2->_liveObserversMap = (NSMapTable *)v3;

    [(SGCuratedChangeNotificationsBaseListener *)v2 startListening];
  }
  return v2;
}

@end