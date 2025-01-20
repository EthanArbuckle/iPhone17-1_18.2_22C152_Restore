@interface BKHIDEventDeliverySequence
- (BKHIDBufferedEventProcessor)processor;
- (BKHIDEventDeliverySequence)initWithProcessor:(id)a3 dispatcher:(id)a4 senderInfo:(id)a5 additionalContext:(id)a6 keyCommand:(id)a7 deliveryManager:(id)a8 resolutions:(id)a9 buffers:(id)a10;
- (BKHIDEventDispatcher)dispatcher;
- (BKSHIDEventKeyCommand)keyCommand;
- (NSString)description;
- (id)buffers;
- (id)firstAdditionalContext;
- (id)resolutions;
- (void)_resolveDispatchTargetsToBuffers:(int)a3 repostFirstEvent:;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)bufferDidDrain:(id)a3;
- (void)dealloc;
- (void)postEvent:(__IOHIDEvent *)a3 position:(int64_t)a4 additionalContext:(id)a5;
- (void)postEvent:(__IOHIDEvent *)a3 position:(int64_t)a4 additionalContext:(id)a5 fromBuffer:(id)a6 toResolution:(id)a7;
- (void)repostFirstEventToBufferedTargets:(id)a3;
@end

@implementation BKHIDEventDeliverySequence

- (void).cxx_destruct
{
  objc_storeStrong(&self->_firstAdditionalContext, 0);
  objc_storeStrong((id *)&self->_repostedToBuffers, 0);
  objc_storeStrong((id *)&self->_resolutionsWithIncompleteSequences, 0);
  objc_storeStrong((id *)&self->_currentResolutions, 0);
  objc_storeStrong((id *)&self->_buffersWithIncompleteSequences, 0);
  objc_storeStrong((id *)&self->_currentBuffers, 0);
  objc_storeStrong((id *)&self->_keyCommand, 0);
  objc_storeStrong(&self->_additionalContext, 0);
  objc_storeStrong((id *)&self->_deliveryManager, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_processor, 0);

  objc_storeStrong((id *)&self->_senderInfo, 0);
}

- (BKHIDBufferedEventProcessor)processor
{
  return (BKHIDBufferedEventProcessor *)objc_getProperty(self, a2, 16, 1);
}

- (BKHIDEventDispatcher)dispatcher
{
  return (BKHIDEventDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (BKSHIDEventKeyCommand)keyCommand
{
  return (BKSHIDEventKeyCommand *)objc_getProperty(self, a2, 48, 1);
}

- (id)firstAdditionalContext
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__BKHIDEventDeliverySequence_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E68718D8;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [v5 appendProem:0 block:v6];
}

id __59__BKHIDEventDeliverySequence_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__BKHIDEventDeliverySequence_appendDescriptionToFormatter___block_invoke_2;
  v8[3] = &unk_1E6871458;
  v8[4] = *(void *)(a1 + 40);
  [v2 appendCustomFormatWithName:@"sq" block:v8];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 56) count];
  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "bs_compactMap:", &__block_literal_global_1253);
    id v6 = (id)[v4 appendObject:v5 withName:@"buffers"];
  }
  id result = (id)[*(id *)(*(void *)(a1 + 40) + 72) count];
  if (result) {
    return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 72) withName:0];
  }
  if (!v3) {
    return (id)[*(id *)(a1 + 32) appendString:@"(no destinations)" withName:0];
  }
  return result;
}

uint64_t __59__BKHIDEventDeliverySequence_appendDescriptionToFormatter___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", @"%p", *(void *)(a1 + 32));
}

uint64_t __59__BKHIDEventDeliverySequence_appendDescriptionToFormatter___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 dispatchTarget];
}

- (id)resolutions
{
  v2 = (void *)[(NSMutableSet *)self->_currentResolutions copy];

  return v2;
}

- (id)buffers
{
  v2 = (void *)[(NSMutableSet *)self->_currentBuffers copy];

  return v2;
}

- (void)repostFirstEventToBufferedTargets:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__BKHIDEventDeliverySequence_repostFirstEventToBufferedTargets___block_invoke;
  v8[3] = &unk_1E6871430;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];

  -[BKHIDEventDeliverySequence _resolveDispatchTargetsToBuffers:repostFirstEvent:]((uint64_t)self, v7, 1);
}

void __64__BKHIDEventDeliverySequence_repostFirstEventToBufferedTargets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (([*(id *)(*(void *)(a1 + 32) + 88) containsObject:v5] & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 88) addObject:v5];
    [*(id *)(a1 + 40) setObject:v5 forKey:v6];
  }
}

- (void)_resolveDispatchTargetsToBuffers:(int)a3 repostFirstEvent:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = (void *)[*(id *)(a1 + 72) copy];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v29 count:16];
    if (v7)
    {
      uint64_t v9 = v7;
      uint64_t v10 = *(void *)v20;
      *(void *)&long long v8 = 134218498;
      long long v18 = v8;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "dispatchingTarget", v18);
          v14 = [v5 objectForKey:v13];

          if (v14)
          {
            [*(id *)(a1 + 72) removeObject:v12];
            [*(id *)(a1 + 56) addObject:v14];
            v15 = BKLogEventDelivery();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v18;
              uint64_t v24 = a1;
              __int16 v25 = 2114;
              v26 = v12;
              __int16 v27 = 2048;
              v28 = v14;
              _os_log_debug_impl(&dword_1CFDE2000, v15, OS_LOG_TYPE_DEBUG, "sq:%p %{public}@ is now buffering to buf:%p", buf, 0x20u);
            }

            if (a3)
            {
              v16 = BKLogEventDelivery();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                v17 = BKSHIDEventGetConciseDescription();
                *(_DWORD *)buf = v18;
                uint64_t v24 = a1;
                __int16 v25 = 2114;
                v26 = v17;
                __int16 v27 = 2048;
                v28 = v14;
                _os_log_debug_impl(&dword_1CFDE2000, v16, OS_LOG_TYPE_DEBUG, "sq:%p repost [%{public}@] to buf:%p", buf, 0x20u);
              }
              [v14 appendEvent:*(void *)(a1 + 96) sender:*(void *)(a1 + 8) sequence:a1 additionalContext:*(void *)(a1 + 104)];
              [*(id *)(a1 + 64) addObject:v14];
            }
          }
        }
        uint64_t v9 = [v6 countByEnumeratingWithState:&v19 objects:v29 count:16];
      }
      while (v9);
    }
  }
}

- (void)bufferDidDrain:(id)a3
{
}

- (void)postEvent:(__IOHIDEvent *)a3 position:(int64_t)a4 additionalContext:(id)a5 fromBuffer:(id)a6 toResolution:(id)a7
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v35 = a5;
  id v11 = a6;
  id v32 = a7;
  v37 = [v32 dispatchingTarget];
  v31 = v11;
  char v12 = [(NSMutableSet *)self->_repostedToBuffers containsObject:v11];
  char v13 = v12;
  int64_t v34 = a4;
  if (a4 <= 1 && (v12 & 1) != 0) {
    goto LABEL_19;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v14 = (void *)[(NSMutableSet *)self->_resolutionsWithIncompleteSequences copy];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (!v15)
  {

LABEL_19:
    long long v18 = 0;
LABEL_20:
    if (([v18 isEqual:v32] & 1) == 0
      && (v34 != 1
       || ([(NSMutableSet *)self->_resolutionsWithIncompleteSequences containsObject:v32] & 1) == 0))
    {
      if ([(NSMutableSet *)self->_buffersWithIncompleteSequences containsObject:v31]) {
        [(NSMutableSet *)self->_currentResolutions addObject:v32];
      }
      v28 = BKLogEventDelivery();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        v29 = BKSHIDEventGetConciseDescription();
        *(_DWORD *)buf = 134218754;
        v43 = self;
        __int16 v44 = 2048;
        v45 = v31;
        __int16 v46 = 2114;
        v47 = v29;
        __int16 v48 = 2114;
        id v49 = v32;
        _os_log_debug_impl(&dword_1CFDE2000, v28, OS_LOG_TYPE_DEBUG, "sq:%p buf:%p post [%{public}@] to resolution:%{public}@", buf, 0x2Au);
      }
      [(BKHIDBufferedEventProcessor *)self->_processor postEvent:a3 withContext:v35 toResolution:v32 fromSequence:self];
    }
    goto LABEL_28;
  }
  uint64_t v17 = v15;
  char v33 = v13;
  long long v18 = 0;
  uint64_t v19 = *(void *)v39;
  char v20 = 1;
  *(void *)&long long v16 = 134218754;
  long long v30 = v16;
  do
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v39 != v19) {
        objc_enumerationMutation(v14);
      }
      long long v22 = *(void **)(*((void *)&v38 + 1) + 8 * i);
      v23 = objc_msgSend(v22, "dispatchingTarget", v30);
      int v24 = [v37 isEqual:v23];

      if (v24)
      {
        __int16 v25 = BKLogEventDelivery();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          __int16 v27 = BKSHIDEventGetConciseDescription();
          *(_DWORD *)buf = v30;
          v43 = self;
          __int16 v44 = 2048;
          v45 = v31;
          __int16 v46 = 2114;
          v47 = v27;
          __int16 v48 = 2114;
          id v49 = v32;
          _os_log_debug_impl(&dword_1CFDE2000, v25, OS_LOG_TYPE_DEBUG, "sq:%p buf:%p unbuffer [%{public}@] to resolution:%{public}@", buf, 0x2Au);
        }
        [(BKHIDBufferedEventProcessor *)self->_processor postEvent:a3 withContext:v35 toResolution:v22 fromSequence:self];
        id v26 = v22;

        char v20 = v33;
        if (v34 == 3) {
          [(NSMutableSet *)self->_resolutionsWithIncompleteSequences removeObject:v26];
        }
        long long v18 = v26;
      }
    }
    uint64_t v17 = [v14 countByEnumeratingWithState:&v38 objects:v50 count:16];
  }
  while (v17);

  if (v20) {
    goto LABEL_20;
  }
LABEL_28:
}

- (void)postEvent:(__IOHIDEvent *)a3 position:(int64_t)a4 additionalContext:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (self->_firstEvent)
  {
    firstAdditionalContext = [(BKHIDEventDeliveryManager *)self->_deliveryManager currentBuffersPerDispatchTarget];
    -[BKHIDEventDeliverySequence _resolveDispatchTargetsToBuffers:repostFirstEvent:]((uint64_t)self, firstAdditionalContext, 0);
  }
  else
  {
    self->_firstEvent = (__IOHIDEvent *)IOHIDEventCreateCopy();
    id v10 = v8;
    firstAdditionalContext = self->_firstAdditionalContext;
    self->_firstAdditionalContext = v10;
  }

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = self->_currentBuffers;
  uint64_t v12 = [(NSMutableSet *)obj countByEnumeratingWithState:&v41 objects:v52 count:16];
  v36 = v8;
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v42;
    *(void *)&long long v13 = 134218498;
    long long v32 = v13;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v42 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        long long v18 = objc_msgSend(v17, "dispatchTarget", v32);
        [v11 addObject:v18];

        uint64_t v19 = BKLogEventDelivery();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          char v20 = BKSHIDEventGetConciseDescription();
          *(_DWORD *)buf = v32;
          v47 = self;
          __int16 v48 = 2114;
          id v49 = v20;
          __int16 v50 = 2048;
          uint64_t v51 = v17;
          _os_log_debug_impl(&dword_1CFDE2000, v19, OS_LOG_TYPE_DEBUG, "sq:%p append [%{public}@] to buf:%p", buf, 0x20u);

          id v8 = v36;
        }

        [v17 appendEvent:a3 sender:self->_senderInfo sequence:self additionalContext:v8];
        if (a4 == 3)
        {
          [(NSMutableSet *)self->_buffersWithIncompleteSequences removeObject:v17];
        }
        else if (a4 == 1)
        {
          [(NSMutableSet *)self->_buffersWithIncompleteSequences addObject:v17];
        }
      }
      uint64_t v14 = [(NSMutableSet *)obj countByEnumeratingWithState:&v41 objects:v52 count:16];
    }
    while (v14);
  }

  long long v21 = (void *)[(NSMutableSet *)self->_currentResolutions mutableCopy];
  [v21 unionSet:self->_resolutionsWithIncompleteSequences];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obja = v21;
  uint64_t v22 = [obja countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v22)
  {
    uint64_t v24 = v22;
    uint64_t v25 = *(void *)v38;
    *(void *)&long long v23 = 134218498;
    long long v33 = v23;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v38 != v25) {
          objc_enumerationMutation(obja);
        }
        __int16 v27 = *(void **)(*((void *)&v37 + 1) + 8 * j);
        v28 = objc_msgSend(v27, "dispatchingTarget", v33);
        char v29 = [v11 containsObject:v28];

        if ((v29 & 1) == 0)
        {
          long long v30 = BKLogEventDelivery();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            v31 = BKSHIDEventGetConciseDescription();
            *(_DWORD *)buf = v33;
            v47 = self;
            __int16 v48 = 2114;
            id v49 = v31;
            __int16 v50 = 2114;
            uint64_t v51 = v27;
            _os_log_debug_impl(&dword_1CFDE2000, v30, OS_LOG_TYPE_DEBUG, "sq:%p post [%{public}@] to resolution:%{public}@", buf, 0x20u);
          }
          [(BKHIDBufferedEventProcessor *)self->_processor postEvent:a3 withContext:v36 toResolution:v27 fromSequence:self];
          if (a4 == 3)
          {
            [(NSMutableSet *)self->_resolutionsWithIncompleteSequences removeObject:v27];
          }
          else if (a4 == 1)
          {
            [(NSMutableSet *)self->_resolutionsWithIncompleteSequences addObject:v27];
          }
        }
      }
      uint64_t v24 = [obja countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v24);
  }
}

- (NSString)description
{
  v2 = [MEMORY[0x1E4F4F720] descriptionForRootObject:self];
  uint64_t v3 = [v2 description];

  return (NSString *)v3;
}

- (void)dealloc
{
  firstEvent = self->_firstEvent;
  if (firstEvent)
  {
    CFRelease(firstEvent);
    self->_firstEvent = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)BKHIDEventDeliverySequence;
  [(BKHIDEventDeliverySequence *)&v4 dealloc];
}

- (BKHIDEventDeliverySequence)initWithProcessor:(id)a3 dispatcher:(id)a4 senderInfo:(id)a5 additionalContext:(id)a6 keyCommand:(id)a7 deliveryManager:(id)a8 resolutions:(id)a9 buffers:(id)a10
{
  id v37 = a3;
  id v36 = a4;
  id v35 = a5;
  id v34 = a6;
  id v33 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  v38.receiver = self;
  v38.super_class = (Class)BKHIDEventDeliverySequence;
  char v20 = [(BKHIDEventDeliverySequence *)&v38 init];
  long long v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_deliveryManager, a8);
    objc_storeStrong((id *)&v21->_dispatcher, a4);
    objc_storeStrong((id *)&v21->_processor, a3);
    objc_storeStrong(&v21->_additionalContext, a6);
    objc_storeStrong((id *)&v21->_senderInfo, a5);
    objc_storeStrong((id *)&v21->_keyCommand, a7);
    if (v19) {
      uint64_t v22 = (NSMutableSet *)[v19 mutableCopy];
    }
    else {
      uint64_t v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    }
    currentBuffers = v21->_currentBuffers;
    v21->_currentBuffers = v22;

    uint64_t v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    buffersWithIncompleteSequences = v21->_buffersWithIncompleteSequences;
    v21->_buffersWithIncompleteSequences = v24;

    if (v18) {
      id v26 = (NSMutableSet *)[v18 mutableCopy];
    }
    else {
      id v26 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    }
    currentResolutions = v21->_currentResolutions;
    v21->_currentResolutions = v26;

    v28 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    resolutionsWithIncompleteSequences = v21->_resolutionsWithIncompleteSequences;
    v21->_resolutionsWithIncompleteSequences = v28;

    long long v30 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    repostedToBuffers = v21->_repostedToBuffers;
    v21->_repostedToBuffers = v30;
  }
  return v21;
}

@end