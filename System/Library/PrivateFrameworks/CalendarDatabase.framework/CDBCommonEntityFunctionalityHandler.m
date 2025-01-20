@interface CDBCommonEntityFunctionalityHandler
+ (void)_notifyDestructionObservers:(id)a3;
- (CDBCommonEntityFunctionalityHandler)init;
- (NSMutableSet)destructionObservers;
- (OS_dispatch_queue)lock;
- (void)addDestructionObserver:(CalRelation *)a3;
- (void)dealloc;
- (void)notifyOfEntityDestruction;
- (void)removeDestructionObserver:(CalRelation *)a3;
- (void)setDestructionObservers:(id)a3;
- (void)setLock:(id)a3;
@end

@implementation CDBCommonEntityFunctionalityHandler

void __62__CDBCommonEntityFunctionalityHandler_addDestructionObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) destructionObservers];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (NSMutableSet)destructionObservers
{
  return self->_destructionObservers;
}

- (CDBCommonEntityFunctionalityHandler)init
{
  v7.receiver = self;
  v7.super_class = (Class)CDBCommonEntityFunctionalityHandler;
  id v2 = [(CDBCommonEntityFunctionalityHandler *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [(CDBCommonEntityFunctionalityHandler *)v2 setDestructionObservers:v3];

    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("CDBCommonEntityFunctionalityHandler.lock", v4);
    [(CDBCommonEntityFunctionalityHandler *)v2 setLock:v5];
  }
  return v2;
}

- (void)setLock:(id)a3
{
}

- (void)setDestructionObservers:(id)a3
{
}

- (void)addDestructionObserver:(CalRelation *)a3
{
  if (a3)
  {
    dispatch_queue_t v5 = [(CDBCommonEntityFunctionalityHandler *)self lock];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __62__CDBCommonEntityFunctionalityHandler_addDestructionObserver___block_invoke;
    v7[3] = &unk_1E5D6BD98;
    v7[4] = self;
    v7[5] = a3;
    dispatch_sync(v5, v7);
  }
  else
  {
    v6 = CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A8E81000, v6, OS_LOG_TYPE_ERROR, "nil 'observer' given.  Will not add destruction observer.", buf, 2u);
    }
  }
}

- (OS_dispatch_queue)lock
{
  return self->_lock;
}

- (void)dealloc
{
  id v3 = [(CDBCommonEntityFunctionalityHandler *)self destructionObservers];
  if ([v3 count]) {
    [(id)objc_opt_class() _notifyDestructionObservers:v3];
  }

  v4.receiver = self;
  v4.super_class = (Class)CDBCommonEntityFunctionalityHandler;
  [(CDBCommonEntityFunctionalityHandler *)&v4 dealloc];
}

- (void)removeDestructionObserver:(CalRelation *)a3
{
  if (a3)
  {
    CFRetain(a3);
    dispatch_queue_t v5 = [(CDBCommonEntityFunctionalityHandler *)self lock];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__CDBCommonEntityFunctionalityHandler_removeDestructionObserver___block_invoke;
    v7[3] = &unk_1E5D6BD98;
    v7[4] = self;
    v7[5] = a3;
    dispatch_sync(v5, v7);

    CFRelease(a3);
  }
  else
  {
    v6 = CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A8E81000, v6, OS_LOG_TYPE_ERROR, "nil 'observer' given.  Will not remove destruction observer.", buf, 2u);
    }
  }
}

void __65__CDBCommonEntityFunctionalityHandler_removeDestructionObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) destructionObservers];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (void)notifyOfEntityDestruction
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__3;
  v9 = __Block_byref_object_dispose__3;
  id v10 = 0;
  id v3 = [(CDBCommonEntityFunctionalityHandler *)self lock];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__CDBCommonEntityFunctionalityHandler_notifyOfEntityDestruction__block_invoke;
  v4[3] = &unk_1E5D6BDC0;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(v3, v4);

  [(id)objc_opt_class() _notifyDestructionObservers:v6[5]];
  _Block_object_dispose(&v5, 8);
}

void __64__CDBCommonEntityFunctionalityHandler_notifyOfEntityDestruction__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) destructionObservers];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [*(id *)(a1 + 32) destructionObservers];
  [v6 removeAllObjects];
}

+ (void)_notifyDestructionObservers:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        CDBRelationEliminateRelatedObjectReference(*(void *)(*((void *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destructionObservers, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end