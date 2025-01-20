@interface AVPlayerItemMetadataCollector
- (AVPlayerItemMetadataCollector)init;
- (AVPlayerItemMetadataCollector)initWithIdentifiers:(NSArray *)identifiers classifyingLabels:(NSArray *)classifyingLabels;
- (BOOL)_attachToPlayerItem:(id)a3;
- (BOOL)_isAttachedToPlayerItem;
- (dispatch_queue_t)delegateQueue;
- (id)_getFilteredMetadataGroups:(id)a3 fromIdentifiers:(id)a4 andClassifyingLabels:(id)a5 modifiedIndexesOut:(id *)a6 newIndexesOut:(id *)a7;
- (id)delegate;
- (void)_detatchFromPlayerItem;
- (void)_updateTaggedRangeMetadataArray:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)delegate queue:(dispatch_queue_t)delegateQueue;
@end

@implementation AVPlayerItemMetadataCollector

- (AVPlayerItemMetadataCollector)init
{
  return [(AVPlayerItemMetadataCollector *)self initWithIdentifiers:0 classifyingLabels:0];
}

- (AVPlayerItemMetadataCollector)initWithIdentifiers:(NSArray *)identifiers classifyingLabels:(NSArray *)classifyingLabels
{
  v9.receiver = self;
  v9.super_class = (Class)AVPlayerItemMetadataCollector;
  v6 = [(AVPlayerItemMediaDataCollector *)&v9 init];
  if (v6)
  {
    v7 = objc_alloc_init(AVPlayerItemMetadataCollectorInternal);
    v6->_metadataCollectorInternal = v7;
    if (v7)
    {
      CFRetain(v7);
      v6->_metadataCollectorInternal->identifiers = (NSArray *)[(NSArray *)identifiers copy];
      v6->_metadataCollectorInternal->classifyingLabels = (NSArray *)[(NSArray *)classifyingLabels copy];
      v6->_metadataCollectorInternal->delegateStorage = objc_alloc_init(AVWeakReferencingDelegateStorage);
      v6->_metadataCollectorInternal->ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avplayeritemmetadatacollector.ivars");
      v6->_metadataCollectorInternal->mostRecentlyModifiedMetadataGroupTimestamp = (NSDate *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:0.0];
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  metadataCollectorInternal = self->_metadataCollectorInternal;
  if (metadataCollectorInternal)
  {

    v4 = (dispatch_object_t *)self->_metadataCollectorInternal;
    if (v4[2])
    {
      dispatch_release(v4[2]);
      v4 = (dispatch_object_t *)self->_metadataCollectorInternal;
    }
    CFRelease(v4);
    metadataCollectorInternal = self->_metadataCollectorInternal;
  }

  v5.receiver = self;
  v5.super_class = (Class)AVPlayerItemMetadataCollector;
  [(AVPlayerItemMediaDataCollector *)&v5 dealloc];
}

- (void)setDelegate:(id)delegate queue:(dispatch_queue_t)delegateQueue
{
  if (delegate)
  {
    if (!delegateQueue)
    {
      v8 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v9 = *MEMORY[0x1E4F1C3C8];
      v10 = "newDelegateQueue != NULL";
      goto LABEL_9;
    }
  }
  else if (delegateQueue)
  {
    v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    v10 = "newDelegateQueue == NULL";
LABEL_9:
    v12 = (void *)[v8 exceptionWithName:v9, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", (uint64_t)delegateQueue, v4, v5, v6, v7, (uint64_t)v10), 0 reason userInfo];
    objc_exception_throw(v12);
  }
  delegateStorage = self->_metadataCollectorInternal->delegateStorage;
  -[AVWeakReferencingDelegateStorage setDelegate:queue:](delegateStorage, "setDelegate:queue:");
}

- (id)delegate
{
  return [(AVWeakReferencingDelegateStorage *)self->_metadataCollectorInternal->delegateStorage delegate];
}

- (dispatch_queue_t)delegateQueue
{
  return (dispatch_queue_t)[(AVWeakReferencingDelegateStorage *)self->_metadataCollectorInternal->delegateStorage delegateQueue];
}

- (BOOL)_attachToPlayerItem:(id)a3
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  if (!a3)
  {
    v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v3, v4, v5, v6, v7, (uint64_t)"playerItem != nil"), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  ivarAccessQueue = self->_metadataCollectorInternal->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__AVPlayerItemMetadataCollector_AVPlayerItemMediaDataCollector_Internal___attachToPlayerItem___block_invoke;
  block[3] = &unk_1E57B3270;
  block[5] = a3;
  block[6] = &v13;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  BOOL v9 = *((unsigned char *)v14 + 24) == 0;
  _Block_object_dispose(&v13, 8);
  return v9;
}

id __94__AVPlayerItemMetadataCollector_AVPlayerItemMediaDataCollector_Internal___attachToPlayerItem___block_invoke(id result)
{
  *(unsigned char *)(*(void *)(*((void *)result + 6) + 8) + 24) = *(void *)(*(void *)(*((void *)result + 4) + 16)
                                                                            + 48) != 0;
  if (!*(unsigned char *)(*(void *)(*((void *)result + 6) + 8) + 24))
  {
    v1 = result;
    result = (id)[*((id *)result + 5) _weakReference];
    *(void *)(*(void *)(v1[4] + 16) + 48) = result;
  }
  return result;
}

- (void)_detatchFromPlayerItem
{
  ivarAccessQueue = self->_metadataCollectorInternal->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__AVPlayerItemMetadataCollector_AVPlayerItemMediaDataCollector_Internal___detatchFromPlayerItem__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

void __96__AVPlayerItemMetadataCollector_AVPlayerItemMediaDataCollector_Internal___detatchFromPlayerItem__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 48) = 0;
}

- (BOOL)_isAttachedToPlayerItem
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  metadataCollectorInternal = self->_metadataCollectorInternal;
  char v10 = 0;
  ivarAccessQueue = metadataCollectorInternal->ivarAccessQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __97__AVPlayerItemMetadataCollector_AVPlayerItemMediaDataCollector_Internal___isAttachedToPlayerItem__block_invoke;
  v6[3] = &unk_1E57B2110;
  v6[4] = self;
  v6[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v6);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __97__AVPlayerItemMetadataCollector_AVPlayerItemMediaDataCollector_Internal___isAttachedToPlayerItem__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                         + 16)
                                                                             + 48) != 0;
  return result;
}

- (id)_getFilteredMetadataGroups:(id)a3 fromIdentifiers:(id)a4 andClassifyingLabels:(id)a5 modifiedIndexesOut:(id *)a6 newIndexesOut:(id *)a7
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  v11 = (void *)[MEMORY[0x1E4F1CA48] array];
  v44 = (void *)[MEMORY[0x1E4F28E60] indexSet];
  v47 = (void *)[MEMORY[0x1E4F28E60] indexSet];
  v12 = self->_metadataCollectorInternal->mostRecentlyModifiedMetadataGroupTimestamp;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  obuint64_t j = a3;
  uint64_t v49 = [a3 countByEnumeratingWithState:&v54 objects:v59 count:16];
  if (v49)
  {
    uint64_t v48 = *(void *)v55;
    id v42 = a4;
    id v43 = a5;
    v45 = v12;
    do
    {
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v55 != v48) {
          objc_enumerationMutation(obj);
        }
        id v14 = [[AVDateRangeMetadataGroup alloc] _initWithTaggedRangeMetadataDictionary:*(void *)(*((void *)&v54 + 1) + 8 * i) items:0];
        uint64_t v15 = v14;
        if (!a5
          || [v14 classifyingLabel]
          && objc_msgSend(a5, "containsObject:", objc_msgSend(v15, "classifyingLabel")))
        {
          char v16 = (void *)[v15 modificationTimestamp];
          if (a4)
          {
            v17 = self;
            id v18 = +[AVMetadataItem metadataItemsFromArray:filteredByIdentifiers:](AVMetadataItem, "metadataItemsFromArray:filteredByIdentifiers:", [v15 items], a4);
            v19 = (void *)[v15 mutableCopy];
            [v19 setItems:v18];

            uint64_t v15 = (void *)[v19 copy];
            long long v52 = 0u;
            long long v53 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            uint64_t v20 = [v18 countByEnumeratingWithState:&v50 objects:v58 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              v22 = v11;
              uint64_t v23 = *(void *)v51;
              do
              {
                for (uint64_t j = 0; j != v21; ++j)
                {
                  if (*(void *)v51 != v23) {
                    objc_enumerationMutation(v18);
                  }
                  v25 = *(void **)(*((void *)&v50 + 1) + 8 * j);
                  objc_msgSend((id)objc_msgSend(v25, "discoveryTimestamp"), "timeIntervalSinceReferenceDate");
                  double v27 = v26;
                  [v16 timeIntervalSinceReferenceDate];
                  if (v27 > v28) {
                    char v16 = (void *)[v25 discoveryTimestamp];
                  }
                }
                uint64_t v21 = [v18 countByEnumeratingWithState:&v50 objects:v58 count:16];
              }
              while (v21);
              v11 = v22;
              a4 = v42;
              a5 = v43;
            }
            self = v17;
            v12 = v45;
          }
          [v11 addObject:v15];
          objc_msgSend((id)objc_msgSend(v15, "discoveryTimestamp"), "timeIntervalSinceReferenceDate");
          double v30 = v29;
          [(NSDate *)v12 timeIntervalSinceReferenceDate];
          v31 = v47;
          if (v30 > v32
            || ([v16 timeIntervalSinceReferenceDate],
                double v34 = v33,
                [(NSDate *)v12 timeIntervalSinceReferenceDate],
                v31 = v44,
                v34 > v35))
          {
            objc_msgSend(v31, "addIndex:", objc_msgSend(v11, "indexOfObject:", v15));
          }
          [v16 timeIntervalSinceReferenceDate];
          double v37 = v36;
          [(NSDate *)self->_metadataCollectorInternal->mostRecentlyModifiedMetadataGroupTimestamp timeIntervalSinceReferenceDate];
          if (v37 > v38)
          {

            self->_metadataCollectorInternal->mostRecentlyModifiedMetadataGroupTimestamp = (NSDate *)v16;
          }
        }
      }
      uint64_t v49 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
    }
    while (v49);
  }
  *a6 = (id)[v44 copy];
  *a7 = (id)[v47 copy];

  return v11;
}

- (void)_updateTaggedRangeMetadataArray:(id)a3
{
  ivarAccessQueue = self->_metadataCollectorInternal->ivarAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __106__AVPlayerItemMetadataCollector_AVPlayerItemMediaDataCollector_Internal___updateTaggedRangeMetadataArray___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = self;
  v4[5] = a3;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v4);
}

uint64_t __106__AVPlayerItemMetadataCollector_AVPlayerItemMediaDataCollector_Internal___updateTaggedRangeMetadataArray___block_invoke(uint64_t a1)
{
  id v7 = 0;
  id v8 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) _getFilteredMetadataGroups:*(void *)(a1 + 40) fromIdentifiers:*(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 24) andClassifyingLabels:*(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 32) modifiedIndexesOut:&v8 newIndexesOut:&v7];
  if ([v8 count] || (uint64_t result = objc_msgSend(v7, "count")) != 0)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(*(void *)(v4 + 16) + 8);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __106__AVPlayerItemMetadataCollector_AVPlayerItemMediaDataCollector_Internal___updateTaggedRangeMetadataArray___block_invoke_2;
    v6[3] = &unk_1E57B4670;
    v6[4] = v4;
    v6[5] = v2;
    void v6[6] = v7;
    v6[7] = v8;
    return [v5 invokeDelegateCallbackWithBlock:v6];
  }
  return result;
}

uint64_t __106__AVPlayerItemMetadataCollector_AVPlayerItemMediaDataCollector_Internal___updateTaggedRangeMetadataArray___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [*(id *)(a1 + 32) _isAttachedToPlayerItem];
  if (result)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 56);
      return [a2 metadataCollector:v5 didCollectDateRangeMetadataGroups:v6 indexesOfNewGroups:v7 indexesOfModifiedGroups:v8];
    }
  }
  return result;
}

@end