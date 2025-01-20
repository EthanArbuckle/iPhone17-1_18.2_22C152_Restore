@interface HMPendingRequests
- (HMPendingRequests)init;
- (NSMutableArray)contextLists;
- (id)_retrieveRequestOfType:(int64_t)a3 forIdentifier:(id)a4 remove:(BOOL)a5;
- (id)removeAccessoryDescriptionForIdentifier:(id)a3;
- (id)removeAccessoryForIdentifier:(id)a3;
- (id)removeActionForIdentifier:(id)a3;
- (id)removeApplicationDataForIdentifier:(id)a3;
- (id)removeCompletionBlockForIdentifier:(id)a3;
- (id)removeEventForIdentifier:(id)a3;
- (id)removeEventsForIdentifier:(id)a3;
- (id)removeMediaSystemBuilderForIdentifier:(id)a3;
- (id)removeProgressBlockForIdentifier:(id)a3;
- (id)removeRequestOfType:(int64_t)a3 forIdentifier:(id)a4;
- (id)removeTriggerForIdentifier:(id)a3;
- (id)retrieveAccessoryDescriptionForIdentifier:(id)a3;
- (id)retrieveCompletionBlockForIdentifier:(id)a3;
- (id)retrieveProgressBlockForIdentifier:(id)a3;
- (id)retrieveRequestOfType:(int64_t)a3 forIdentifier:(id)a4;
- (id)uuidForAccessoryDescriptionUUID:(id)a3;
- (void)_addRequest:(id)a3 ofType:(int64_t)a4 forIdentifier:(id)a5;
- (void)addAccessory:(id)a3 andCompletionBlock:(id)a4 forIdentifier:(id)a5;
- (void)addAccessoryDescription:(id)a3 progressBlock:(id)a4 andCompletionBlock:(id)a5 forIdentifier:(id)a6;
- (void)addAction:(id)a3 andCompletionBlock:(id)a4 forIdentifier:(id)a5;
- (void)addApplicationData:(id)a3 andCompletionBlock:(id)a4 forIdentifier:(id)a5;
- (void)addCompletionBlock:(id)a3 forIdentifier:(id)a4;
- (void)addEvent:(id)a3 andCompletionBlock:(id)a4 forIdentifier:(id)a5;
- (void)addEvents:(id)a3 andCompletionBlock:(id)a4 forIdentifier:(id)a5;
- (void)addMediaSystemBuilder:(id)a3 andCompletionBlock:(id)a4 forIdentifier:(id)a5;
- (void)addProgressHandler:(id)a3 forAccessoryIdentifier:(id)a4;
- (void)addRequest:(id)a3 ofType:(int64_t)a4 forIdentifier:(id)a5;
- (void)addTrigger:(id)a3 andCompletionBlock:(id)a4 forIdentifier:(id)a5;
- (void)setContextLists:(id)a3;
@end

@implementation HMPendingRequests

- (id)removeRequestOfType:(int64_t)a3 forIdentifier:(id)a4
{
  id v6 = a4;
  os_unfair_lock_lock_with_options();
  v7 = [(HMPendingRequests *)self _retrieveRequestOfType:a3 forIdentifier:v6 remove:1];
  os_unfair_lock_unlock(&self->_lock);

  return v7;
}

- (id)_retrieveRequestOfType:(int64_t)a3 forIdentifier:(id)a4 remove:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  if (a3 > 9)
  {
    v11 = 0;
  }
  else
  {
    v9 = [(HMPendingRequests *)self contextLists];
    v10 = [v9 objectAtIndexedSubscript:a3];

    if (v10)
    {
      v11 = [v10 objectForKeyedSubscript:v8];
      if (v11 && v5) {
        [v10 removeObjectForKey:v8];
      }
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (NSMutableArray)contextLists
{
  return self->_contextLists;
}

- (id)removeCompletionBlockForIdentifier:(id)a3
{
  return [(HMPendingRequests *)self removeRequestOfType:0 forIdentifier:a3];
}

- (id)retrieveRequestOfType:(int64_t)a3 forIdentifier:(id)a4
{
  id v6 = a4;
  os_unfair_lock_lock_with_options();
  v7 = [(HMPendingRequests *)self _retrieveRequestOfType:a3 forIdentifier:v6 remove:0];
  os_unfair_lock_unlock(&self->_lock);

  return v7;
}

- (id)retrieveCompletionBlockForIdentifier:(id)a3
{
  return [(HMPendingRequests *)self retrieveRequestOfType:0 forIdentifier:a3];
}

- (void)addRequest:(id)a3 ofType:(int64_t)a4 forIdentifier:(id)a5
{
  id v9 = a3;
  id v8 = a5;
  os_unfair_lock_lock_with_options();
  [(HMPendingRequests *)self _addRequest:v9 ofType:a4 forIdentifier:v8];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_addRequest:(id)a3 ofType:(int64_t)a4 forIdentifier:(id)a5
{
  id v11 = a3;
  id v8 = a5;
  if (a4 <= 9)
  {
    id v9 = [(HMPendingRequests *)self contextLists];
    v10 = [v9 objectAtIndexedSubscript:a4];

    if (v11 && v10) {
      [v10 setObject:v11 forKeyedSubscript:v8];
    }
  }
}

- (void)addCompletionBlock:(id)a3 forIdentifier:(id)a4
{
}

- (HMPendingRequests)init
{
  v8.receiver = self;
  v8.super_class = (Class)HMPendingRequests;
  v2 = [(HMPendingRequests *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    contextLists = v2->_contextLists;
    v2->_contextLists = (NSMutableArray *)v3;

    for (uint64_t i = 0; i != 10; ++i)
    {
      id v6 = [MEMORY[0x1E4F1CA60] dictionary];
      [(NSMutableArray *)v2->_contextLists setObject:v6 atIndexedSubscript:i];
    }
  }
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setContextLists:(id)a3
{
}

- (id)removeMediaSystemBuilderForIdentifier:(id)a3
{
  uint64_t v3 = [(HMPendingRequests *)self removeRequestOfType:9 forIdentifier:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)addMediaSystemBuilder:(id)a3 andCompletionBlock:(id)a4 forIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [(HMPendingRequests *)self addRequest:a3 ofType:9 forIdentifier:v8];
  [(HMPendingRequests *)self addRequest:v9 ofType:0 forIdentifier:v8];
}

- (void)addProgressHandler:(id)a3 forAccessoryIdentifier:(id)a4
{
}

- (id)removeTriggerForIdentifier:(id)a3
{
  uint64_t v3 = [(HMPendingRequests *)self removeRequestOfType:2 forIdentifier:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)addTrigger:(id)a3 andCompletionBlock:(id)a4 forIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [(HMPendingRequests *)self addRequest:a3 ofType:2 forIdentifier:v8];
  [(HMPendingRequests *)self addRequest:v9 ofType:0 forIdentifier:v8];
}

- (id)removeProgressBlockForIdentifier:(id)a3
{
  return [(HMPendingRequests *)self removeRequestOfType:7 forIdentifier:a3];
}

- (id)removeAccessoryDescriptionForIdentifier:(id)a3
{
  uint64_t v3 = [(HMPendingRequests *)self removeRequestOfType:8 forIdentifier:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)uuidForAccessoryDescriptionUUID:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__41357;
  v18 = __Block_byref_object_dispose__41358;
  id v19 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(HMPendingRequests *)self contextLists];
  v7 = [v6 objectAtIndexedSubscript:8];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__HMPendingRequests_uuidForAccessoryDescriptionUUID___block_invoke;
  v11[3] = &unk_1E5943258;
  id v8 = v4;
  id v12 = v8;
  v13 = &v14;
  [v7 enumerateKeysAndObjectsUsingBlock:v11];

  os_unfair_lock_unlock(p_lock);
  id v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __53__HMPendingRequests_uuidForAccessoryDescriptionUUID___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v16 = a2;
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v16;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  id v10 = v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  if (v9) {
    BOOL v13 = v12 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    uint64_t v14 = [v12 accessoryUUID];
    int v15 = [v14 isEqual:*(void *)(a1 + 32)];

    if (v15)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v8);
      *a4 = 1;
    }
  }
}

- (void)addAccessoryDescription:(id)a3 progressBlock:(id)a4 andCompletionBlock:(id)a5 forIdentifier:(id)a6
{
  id v12 = a4;
  id v10 = a5;
  id v11 = a6;
  [(HMPendingRequests *)self addRequest:a3 ofType:8 forIdentifier:v11];
  if (v12) {
    [(HMPendingRequests *)self addRequest:v12 ofType:7 forIdentifier:v11];
  }
  if (v10) {
    [(HMPendingRequests *)self addRequest:v10 ofType:0 forIdentifier:v11];
  }
}

- (id)removeAccessoryForIdentifier:(id)a3
{
  uint64_t v3 = [(HMPendingRequests *)self removeRequestOfType:1 forIdentifier:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)addAccessory:(id)a3 andCompletionBlock:(id)a4 forIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [(HMPendingRequests *)self addRequest:a3 ofType:1 forIdentifier:v8];
  [(HMPendingRequests *)self addRequest:v9 ofType:0 forIdentifier:v8];
}

- (id)removeApplicationDataForIdentifier:(id)a3
{
  uint64_t v3 = [(HMPendingRequests *)self removeRequestOfType:6 forIdentifier:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)addApplicationData:(id)a3 andCompletionBlock:(id)a4 forIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [(HMPendingRequests *)self addRequest:a3 ofType:6 forIdentifier:v8];
  [(HMPendingRequests *)self addRequest:v9 ofType:0 forIdentifier:v8];
}

- (id)removeEventsForIdentifier:(id)a3
{
  uint64_t v3 = [(HMPendingRequests *)self removeRequestOfType:5 forIdentifier:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)addEvents:(id)a3 andCompletionBlock:(id)a4 forIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [(HMPendingRequests *)self addRequest:a3 ofType:5 forIdentifier:v8];
  [(HMPendingRequests *)self addRequest:v9 ofType:0 forIdentifier:v8];
}

- (id)removeEventForIdentifier:(id)a3
{
  uint64_t v3 = [(HMPendingRequests *)self removeRequestOfType:4 forIdentifier:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)addEvent:(id)a3 andCompletionBlock:(id)a4 forIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [(HMPendingRequests *)self addRequest:a3 ofType:4 forIdentifier:v8];
  [(HMPendingRequests *)self addRequest:v9 ofType:0 forIdentifier:v8];
}

- (id)removeActionForIdentifier:(id)a3
{
  uint64_t v3 = [(HMPendingRequests *)self removeRequestOfType:3 forIdentifier:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)addAction:(id)a3 andCompletionBlock:(id)a4 forIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [(HMPendingRequests *)self addRequest:a3 ofType:3 forIdentifier:v8];
  [(HMPendingRequests *)self addRequest:v9 ofType:0 forIdentifier:v8];
}

- (id)retrieveAccessoryDescriptionForIdentifier:(id)a3
{
  uint64_t v3 = [(HMPendingRequests *)self retrieveRequestOfType:8 forIdentifier:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)retrieveProgressBlockForIdentifier:(id)a3
{
  return [(HMPendingRequests *)self retrieveRequestOfType:7 forIdentifier:a3];
}

@end