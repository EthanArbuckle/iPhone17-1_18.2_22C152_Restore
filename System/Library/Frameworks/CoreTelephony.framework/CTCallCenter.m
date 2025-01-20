@interface CTCallCenter
- (BOOL)calculateCallStateChanges_sync:(id)a3;
- (BOOL)getCurrentCallSetFromServer_sync:(id)a3;
- (CTCallCenter)init;
- (CTCallCenter)initWithQueue:(dispatch_queue_s *)a3;
- (CXCallObserver)callKitObserver;
- (NSSet)currentCalls;
- (NSString)description;
- (id).cxx_construct;
- (void)broadcastCallStateChangesIfNeededWithFailureLogMessage:(id)a3;
- (void)callEventHandler;
- (void)callObserver:(id)a3 callChanged:(id)a4;
- (void)dealloc;
- (void)handleCallStatusChange_sync:(id)a3;
- (void)initialize;
- (void)setCallEventHandler:(void *)callEventHandler;
- (void)setCallKitObserver:(id)a3;
- (void)setCurrentCalls:(id)a3;
@end

@implementation CTCallCenter

- (CTCallCenter)initWithQueue:(dispatch_queue_s *)a3
{
  if (a3) {
    dispatch_retain((dispatch_object_t)a3);
  }
  fObj = self->clientQueue.fObj.fObj;
  self->clientQueue.fObj.fObj = (dispatch_object_s *)a3;
  if (fObj) {
    dispatch_release(fObj);
  }

  return [(CTCallCenter *)self init];
}

- (CTCallCenter)init
{
  v10.receiver = self;
  v10.super_class = (Class)CTCallCenter;
  v2 = [(CTCallCenter *)&v10 init];
  v3 = v2;
  if (v2)
  {
    if (!v2->clientQueue.fObj.fObj)
    {
      global_queue = dispatch_get_global_queue(0, 0);
      v7 = global_queue;
      if (global_queue)
      {
        dispatch_retain(global_queue);
        fObj = v3->clientQueue.fObj.fObj;
        v3->clientQueue.fObj.fObj = (dispatch_object_s *)v7;
        if (fObj) {
          dispatch_release(fObj);
        }
      }
      else
      {
        v3->clientQueue.fObj.fObj = 0;
      }
    }
    dispatch_queue_t v4 = dispatch_queue_create("CTCallCenter", 0);
    v5 = v3->_queue.fObj.fObj;
    v3->_queue.fObj.fObj = (dispatch_object_s *)v4;
    if (v5) {
      dispatch_release(v5);
    }
    v3->_currentCalls = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    if (CUTWeakLinkClass())
    {
      v3->_callKitObserver = (CXCallObserver *)objc_opt_new();
      if (![(CTCallCenter *)v3 calculateCallStateChanges_sync:0]) {
        syslog(3, "Could not successfully update call center during initialization, CTCallCenter: %s.", [(NSString *)[(CTCallCenter *)v3 description] UTF8String]);
      }
      [(CTCallCenter *)v3 initialize];
    }
    else
    {
      syslog(3, "CXCallObserver could not be weak linked. Return nil.");
      return 0;
    }
  }
  return v3;
}

- (void)initialize
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__CTCallCenter_initialize__block_invoke;
  block[3] = &unk_1E52640E0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)self->_queue.fObj.fObj, block);
}

uint64_t __26__CTCallCenter_initialize__block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) callKitObserver];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 setDelegate:v3 queue:0];
}

- (void)handleCallStatusChange_sync:(id)a3
{
  id v4 = +[CTCall callForCXCall:a3];
  if (v4)
  {
    v5 = v4;
    currentCalls = self->_currentCalls;
    id v7 = [(NSSet *)currentCalls member:v4];
    v8 = (void *)[v5 callState];
    if (v7)
    {
      if ((objc_msgSend(v8, "isEqualToString:", objc_msgSend(v7, "callState")) & 1) == 0)
      {
        [(NSSet *)currentCalls removeObject:v7];
        if (objc_msgSend((id)objc_msgSend(v5, "callState"), "isEqualToString:", @"CTCallStateDisconnected")) {
          goto LABEL_8;
        }
        goto LABEL_7;
      }
    }
    else if (([v8 isEqualToString:@"CTCallStateDisconnected"] & 1) == 0)
    {
LABEL_7:
      [(NSSet *)currentCalls addObject:v5];
LABEL_8:
      id v9 = v5;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __44__CTCallCenter_handleCallStatusChange_sync___block_invoke;
      v10[3] = &unk_1E5264108;
      v10[4] = self;
      v10[5] = v5;
      dispatch_async((dispatch_queue_t)self->clientQueue.fObj.fObj, v10);
    }
  }
}

void __44__CTCallCenter_handleCallStatusChange_sync___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 32);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(a1 + 40));
  }
  uint64_t v3 = *(void **)(a1 + 40);
}

- (void)dealloc
{
  callKitObserver = self->_callKitObserver;
  if (callKitObserver) {

  }
  v4.receiver = self;
  v4.super_class = (Class)CTCallCenter;
  [(CTCallCenter *)&v4 dealloc];
}

- (void)callEventHandler
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__CTCallCenter_callEventHandler__block_invoke;
  v4[3] = &unk_1E5264130;
  v4[4] = self;
  v5 = v4;
  fObj = self->_queue.fObj.fObj;
  id v7 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___ZN8dispatch9sync_implIU13block_pointerFU13block_pointerFvP6CTCallEvEEENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS7_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = &v7;
  void block[5] = &v5;
  dispatch_sync(fObj, block);
  return v7;
}

uint64_t __32__CTCallCenter_callEventHandler__block_invoke(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 32);
}

- (void)setCallEventHandler:(void *)callEventHandler
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__CTCallCenter_setCallEventHandler___block_invoke;
  v3[3] = &unk_1E5264158;
  v3[4] = self;
  v3[5] = callEventHandler;
  dispatch_async((dispatch_queue_t)self->_queue.fObj.fObj, v3);
}

void __36__CTCallCenter_setCallEventHandler___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 32) != v2)
  {
    id v4 = *(id *)(v3 + 32);
    *(void *)(*(void *)(a1 + 32) + 32) = [v2 copyWithZone:0];
  }
}

- (BOOL)getCurrentCallSetFromServer_sync:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v5 = (void *)MEMORY[0x18531FC50](self, a2);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = [(CXCallObserver *)[(CTCallCenter *)self callKitObserver] calls];
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = +[CTCall callForCXCall:*(void *)(*((void *)&v13 + 1) + 8 * v10)];
          if (v11) {
            [a3 addObject:v11];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  return a3 != 0;
}

- (BOOL)calculateCallStateChanges_sync:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  currentCalls = self->_currentCalls;
  id v7 = a3;
  if (!a3) {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  BOOL v9 = [(CTCallCenter *)self getCurrentCallSetFromServer_sync:v8];
  if (v9)
  {
    if ([v8 count])
    {
      uint64_t v10 = (void *)[v8 objectEnumerator];
      uint64_t v11 = [v10 nextObject];
      if (v11)
      {
        v12 = (void *)v11;
        while (1)
        {
          id v13 = [(NSSet *)currentCalls member:v12];
          if (!v13) {
            goto LABEL_10;
          }
          id v14 = v13;
          if ((objc_msgSend((id)objc_msgSend(v13, "callState"), "isEqualToString:", objc_msgSend(v12, "callState")) & 1) == 0) {
            break;
          }
LABEL_13:
          v12 = (void *)[v10 nextObject];
          if (!v12) {
            goto LABEL_14;
          }
        }
        [(NSSet *)currentCalls removeObject:v14];
LABEL_10:
        if ((objc_msgSend((id)objc_msgSend(v12, "callState"), "isEqualToString:", @"CTCallStateDisconnected") & 1) == 0) {
          [(NSSet *)currentCalls addObject:v12];
        }
        [v7 addObject:v12];
        goto LABEL_13;
      }
LABEL_14:
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v16 = [(NSSet *)currentCalls objectEnumerator];
      uint64_t v17 = [(NSEnumerator *)v16 nextObject];
      if (v17)
      {
        uint64_t v18 = v17;
        do
        {
          if (![v8 member:v18]) {
            [v15 addObject:v18];
          }
          uint64_t v18 = [(NSEnumerator *)v16 nextObject];
        }
        while (v18);
      }
      if ([v15 count])
      {
        v19 = (void *)[v15 objectEnumerator];
        uint64_t v20 = [v19 nextObject];
        if (v20)
        {
          v21 = (void *)v20;
          do
          {
            if (a3)
            {
              [v21 setCallState:@"CTCallStateDisconnected"];
              [a3 addObject:v21];
            }
            [(NSSet *)currentCalls removeObject:v21];
            v21 = (void *)[v19 nextObject];
          }
          while (v21);
        }
      }
    }
    else if ([(NSSet *)currentCalls count])
    {
      v22 = [(NSSet *)currentCalls objectEnumerator];
      uint64_t v23 = [(NSEnumerator *)v22 nextObject];
      if (v23)
      {
        id v24 = (id)v23;
        do
        {
          [v24 setCallState:@"CTCallStateDisconnected"];
          [v7 addObject:v24];
          id v24 = [(NSEnumerator *)v22 nextObject];
        }
        while (v24);
      }
      [(NSSet *)currentCalls removeAllObjects];
    }
  }

  if (!a3 && v7) {
  return v9;
  }
}

- (NSSet)currentCalls
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__CTCallCenter_currentCalls__block_invoke;
  v4[3] = &unk_1E5264180;
  v4[4] = self;
  id v5 = v4;
  fObj = self->_queue.fObj.fObj;
  id v7 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___ZN8dispatch9sync_implIU13block_pointerFP5NSSetvEEENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS5_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = &v7;
  void block[5] = &v5;
  dispatch_sync(fObj, block);
  return v7;
}

uint64_t __28__CTCallCenter_currentCalls__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 32))
  {
    objc_msgSend((id)v2, "calculateCallStateChanges_sync:", 0);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t result = [*(id *)(v2 + 24) count];
  if (result) {
    return *(void *)(*(void *)(a1 + 32) + 24);
  }
  return result;
}

- (void)setCurrentCalls:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__CTCallCenter_setCurrentCalls___block_invoke;
  v3[3] = &unk_1E5264108;
  v3[4] = a3;
  v3[5] = self;
  dispatch_async((dispatch_queue_t)self->_queue.fObj.fObj, v3);
}

void __32__CTCallCenter_setCurrentCalls___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);

  *(void *)(*(void *)(a1 + 40) + 24) = *(void *)(a1 + 32);
}

- (void)broadcastCallStateChangesIfNeededWithFailureLogMessage:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __71__CTCallCenter_broadcastCallStateChangesIfNeededWithFailureLogMessage___block_invoke;
  v3[3] = &unk_1E5264108;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async((dispatch_queue_t)self->_queue.fObj.fObj, v3);
}

void __71__CTCallCenter_broadcastCallStateChangesIfNeededWithFailureLogMessage___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if (objc_msgSend(*(id *)(a1 + 32), "calculateCallStateChanges_sync:", v2))
  {
    if (*(void *)(*(void *)(a1 + 32) + 32))
    {
      if ([v2 count])
      {
        uint64_t v3 = (void *)[v2 objectEnumerator];
        uint64_t v4 = [v3 nextObject];
        if (v4)
        {
          uint64_t v5 = MEMORY[0x1E4F143A8];
          do
          {
            uint64_t v6 = *(void *)(a1 + 32);
            block[0] = v5;
            block[1] = 3221225472;
            block[2] = __71__CTCallCenter_broadcastCallStateChangesIfNeededWithFailureLogMessage___block_invoke_2;
            block[3] = &unk_1E5264108;
            block[4] = v6;
            void block[5] = v4;
            dispatch_async(*(dispatch_queue_t *)(v6 + 16), block);
            uint64_t v4 = [v3 nextObject];
          }
          while (v4);
        }
      }
    }
  }
  else
  {
    syslog(3, "%s", (const char *)[*(id *)(a1 + 40) UTF8String]);
  }
}

uint64_t __71__CTCallCenter_broadcastCallStateChangesIfNeededWithFailureLogMessage___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 32) + 16))();
}

- (NSString)description
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __27__CTCallCenter_description__block_invoke;
  v4[3] = &unk_1E52641A8;
  v4[4] = self;
  uint64_t v5 = v4;
  fObj = self->_queue.fObj.fObj;
  id v7 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___ZN8dispatch9sync_implIU13block_pointerFP8NSStringvEEENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS5_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = &v7;
  void block[5] = &v5;
  dispatch_sync(fObj, block);
  return v7;
}

uint64_t __27__CTCallCenter_description__block_invoke(uint64_t a1)
{
  return [NSString stringWithFormat:@"CTCallCenter(%p): {\n\tcurrentCalls: %@\tcallEventHandler: %p\n}\n", *(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 24), objc_msgSend(*(id *)(a1 + 32), "callEventHandler")];
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CTCallCenter_callObserver_callChanged___block_invoke;
  block[3] = &unk_1E52641D0;
  block[4] = a3;
  void block[5] = self;
  void block[6] = a4;
  dispatch_async((dispatch_queue_t)self->_queue.fObj.fObj, block);
}

void __41__CTCallCenter_callObserver_callChanged___block_invoke(void *a1)
{
  if (a1[4])
  {
    uint64_t v1 = a1[6];
    id v2 = (void *)a1[5];
    objc_msgSend(v2, "handleCallStatusChange_sync:", v1);
  }
  else
  {
    syslog(3, "Error: Call Center is null. Dropping call update.");
  }
}

- (CXCallObserver)callKitObserver
{
  return (CXCallObserver *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCallKitObserver:(id)a3
{
}

- (void).cxx_destruct
{
  fObj = self->clientQueue.fObj.fObj;
  if (fObj) {
    dispatch_release(fObj);
  }
  uint64_t v4 = self->_queue.fObj.fObj;
  if (v4)
  {
    dispatch_release(v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end