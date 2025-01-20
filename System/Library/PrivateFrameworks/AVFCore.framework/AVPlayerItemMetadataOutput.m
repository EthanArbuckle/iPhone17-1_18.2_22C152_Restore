@interface AVPlayerItemMetadataOutput
+ (void)initialize;
- (AVPlayerItemMetadataOutput)init;
- (AVPlayerItemMetadataOutput)initWithIdentifiers:(NSArray *)identifiers;
- (BOOL)_attachToPlayerItem:(id)a3;
- (BOOL)isDefunct;
- (NSDictionary)_figMetadataOutputsDictionaryOptions;
- (NSTimeInterval)advanceIntervalForDelegateInvocation;
- (dispatch_queue_t)delegateQueue;
- (id)delegate;
- (void)_collectUncollectables;
- (void)_detachFromPlayerItem;
- (void)_pushTimedMetadataGroups:(id)a3 fromPlayerItemTrack:(id)a4;
- (void)_signalFlush;
- (void)dealloc;
- (void)setAdvanceIntervalForDelegateInvocation:(NSTimeInterval)advanceIntervalForDelegateInvocation;
- (void)setDelegate:(id)delegate queue:(dispatch_queue_t)delegateQueue;
@end

@implementation AVPlayerItemMetadataOutput

+ (void)initialize
{
}

- (AVPlayerItemMetadataOutput)init
{
  return [(AVPlayerItemMetadataOutput *)self initWithIdentifiers:0];
}

- (AVPlayerItemMetadataOutput)initWithIdentifiers:(NSArray *)identifiers
{
  v16.receiver = self;
  v16.super_class = (Class)AVPlayerItemMetadataOutput;
  v5 = [(AVPlayerItemOutput *)&v16 init];
  if (identifiers && ![(NSArray *)identifiers count])
  {
    v9 = v5;
    v15 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v5, a2, @"invalid parameter not satisfying: %s", v10, v11, v12, v13, v14, (uint64_t)"[identifiers count] > 0"), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  if (v5)
  {
    v6 = objc_alloc_init(AVPlayerItemMetadataOutputInternal);
    v5->_metadataOutputInternal = v6;
    if (v6)
    {
      CFRetain(v6);
      v5->_metadataOutputInternal->ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avplayeritemmetadataoutput.ivars");
      v5->_metadataOutputInternal->delegateStorage = objc_alloc_init(AVWeakReferencingDelegateStorage);
      v5->_metadataOutputInternal->metadataIdentifiers = (NSArray *)[(NSArray *)identifiers copy];
      v5->_metadataOutputInternal->accumulatedMetadataGroups = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v5->_metadataOutputInternal->accumulationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avplayeritemmetadataoutput.accumulationqueue", v7);
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (void)_collectUncollectables
{
  metadataOutputInternal = self->_metadataOutputInternal;
  if (metadataOutputInternal->ivarAccessQueue)
  {
    dispatch_release((dispatch_object_t)metadataOutputInternal->ivarAccessQueue);
    metadataOutputInternal = self->_metadataOutputInternal;
  }
  if (metadataOutputInternal->accumulatedMetadataGroups)
  {
    CFRelease(metadataOutputInternal->accumulatedMetadataGroups);
    metadataOutputInternal = self->_metadataOutputInternal;
  }
  if (metadataOutputInternal->accumulationQueue)
  {
    dispatch_release((dispatch_object_t)metadataOutputInternal->accumulationQueue);
    metadataOutputInternal = self->_metadataOutputInternal;
  }
  CFRelease(metadataOutputInternal);
}

- (void)dealloc
{
  metadataOutputInternal = self->_metadataOutputInternal;
  if (metadataOutputInternal)
  {

    [(AVPlayerItemMetadataOutput *)self _collectUncollectables];
    metadataOutputInternal = self->_metadataOutputInternal;
  }

  v4.receiver = self;
  v4.super_class = (Class)AVPlayerItemMetadataOutput;
  [(AVPlayerItemOutput *)&v4 dealloc];
}

- (BOOL)_attachToPlayerItem:(id)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  if (!a3)
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v3, v4, v5, v6, v7, (uint64_t)"playerItem != nil"), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  ivarAccessQueue = self->_metadataOutputInternal->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__AVPlayerItemMetadataOutput__attachToPlayerItem___block_invoke;
  block[3] = &unk_1E57B3270;
  block[5] = a3;
  block[6] = &v13;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  BOOL v9 = *((unsigned char *)v14 + 24) == 0;
  _Block_object_dispose(&v13, 8);
  return v9;
}

id __50__AVPlayerItemMetadataOutput__attachToPlayerItem___block_invoke(id result)
{
  *(unsigned char *)(*(void *)(*((void *)result + 6) + 8) + 24) = *(void *)(*(void *)(*((void *)result + 4) + 16)
                                                                            + 40) != 0;
  if (!*(unsigned char *)(*(void *)(*((void *)result + 6) + 8) + 24))
  {
    v1 = result;
    result = (id)[*((id *)result + 5) _weakReference];
    *(void *)(*(void *)(v1[4] + 16) + 40) = result;
  }
  return result;
}

- (void)_detachFromPlayerItem
{
  ivarAccessQueue = self->_metadataOutputInternal->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__AVPlayerItemMetadataOutput__detachFromPlayerItem__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

void __51__AVPlayerItemMetadataOutput__detachFromPlayerItem__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 40) = 0;
}

- (void)setDelegate:(id)delegate queue:(dispatch_queue_t)delegateQueue
{
  if (delegate)
  {
    if (!delegateQueue)
    {
      v8 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v9 = *MEMORY[0x1E4F1C3C8];
      uint64_t v10 = "newDelegateQueue != NULL";
      goto LABEL_9;
    }
  }
  else if (delegateQueue)
  {
    v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    uint64_t v10 = "newDelegateQueue == NULL";
LABEL_9:
    uint64_t v12 = (void *)[v8 exceptionWithName:v9, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", (uint64_t)delegateQueue, v4, v5, v6, v7, (uint64_t)v10), 0 reason userInfo];
    objc_exception_throw(v12);
  }
  delegateStorage = self->_metadataOutputInternal->delegateStorage;
  -[AVWeakReferencingDelegateStorage setDelegate:queue:](delegateStorage, "setDelegate:queue:");
}

- (id)delegate
{
  return [(AVWeakReferencingDelegateStorage *)self->_metadataOutputInternal->delegateStorage delegate];
}

- (dispatch_queue_t)delegateQueue
{
  return (dispatch_queue_t)[(AVWeakReferencingDelegateStorage *)self->_metadataOutputInternal->delegateStorage delegateQueue];
}

- (NSTimeInterval)advanceIntervalForDelegateInvocation
{
  uint64_t v7 = 0;
  v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  metadataOutputInternal = self->_metadataOutputInternal;
  uint64_t v10 = 0;
  ivarAccessQueue = metadataOutputInternal->ivarAccessQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__AVPlayerItemMetadataOutput_advanceIntervalForDelegateInvocation__block_invoke;
  v6[3] = &unk_1E57B2110;
  v6[4] = self;
  v6[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v6);
  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

double __66__AVPlayerItemMetadataOutput_advanceIntervalForDelegateInvocation__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(*(void *)(a1 + 32) + 16) + 48);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setAdvanceIntervalForDelegateInvocation:(NSTimeInterval)advanceIntervalForDelegateInvocation
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__16;
  uint64_t v9 = __Block_byref_object_dispose__16;
  uint64_t v10 = 0;
  ivarAccessQueue = self->_metadataOutputInternal->ivarAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__AVPlayerItemMetadataOutput_setAdvanceIntervalForDelegateInvocation___block_invoke;
  v4[3] = &unk_1E57B4B60;
  *(NSTimeInterval *)&v4[7] = advanceIntervalForDelegateInvocation;
  v4[4] = self;
  v4[5] = &v11;
  v4[6] = &v5;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
  if (*((unsigned char *)v12 + 24)) {
    objc_msgSend((id)objc_msgSend((id)v6[5], "referencedObject"), "_evaluateMetadataOutputs");
  }

  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(&v11, 8);
}

double __70__AVPlayerItemMetadataOutput_setAdvanceIntervalForDelegateInvocation___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(a1 + 56) != *(double *)(*(void *)(*(void *)(a1 + 32) + 16)
                                                                                                 + 48);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_retain(*(id *)(*(void *)(*(void *)(a1 + 32)
                                                                                              + 16)
                                                                                  + 40));
  double result = *(double *)(a1 + 56);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 16) + 48) = result;
  return result;
}

- (void)_signalFlush
{
  accumulationQueue = self->_metadataOutputInternal->accumulationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__AVPlayerItemMetadataOutput_AVPlayerItemMetadataOutput_Internal___signalFlush__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_async(accumulationQueue, block);
}

void __79__AVPlayerItemMetadataOutput_AVPlayerItemMetadataOutput_Internal___signalFlush__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(NSObject **)(*(void *)(v1 + 16) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__AVPlayerItemMetadataOutput_AVPlayerItemMetadataOutput_Internal___signalFlush__block_invoke_2;
  block[3] = &unk_1E57B1E80;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __79__AVPlayerItemMetadataOutput_AVPlayerItemMetadataOutput_Internal___signalFlush__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(*(void *)(v1 + 16) + 16);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79__AVPlayerItemMetadataOutput_AVPlayerItemMetadataOutput_Internal___signalFlush__block_invoke_3;
  v4[3] = &unk_1E57B4B88;
  v4[4] = v1;
  return [v2 invokeDelegateCallbackWithBlock:v4];
}

uint64_t __79__AVPlayerItemMetadataOutput_AVPlayerItemMetadataOutput_Internal___signalFlush__block_invoke_3(uint64_t result, void *a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    double result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v4 = *(void *)(v3 + 32);
      return [a2 outputSequenceWasFlushed:v4];
    }
  }
  return result;
}

- (NSDictionary)_figMetadataOutputsDictionaryOptions
{
  uint64_t v3 = (NSDictionary *)[MEMORY[0x1E4F1CA60] dictionary];
  [(AVPlayerItemMetadataOutput *)self advanceIntervalForDelegateInvocation];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:");
  [(NSDictionary *)v3 setObject:v4 forKey:*MEMORY[0x1E4F33538]];
  metadataIdentifiers = self->_metadataOutputInternal->metadataIdentifiers;
  if (metadataIdentifiers) {
    [(NSDictionary *)v3 setObject:metadataIdentifiers forKey:*MEMORY[0x1E4F33540]];
  }
  return v3;
}

- (void)_pushTimedMetadataGroups:(id)a3 fromPlayerItemTrack:(id)a4
{
  if ([a3 count])
  {
    accumulationQueue = self->_metadataOutputInternal->accumulationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __112__AVPlayerItemMetadataOutput_AVPlayerItemMetadataOutput_Internal___pushTimedMetadataGroups_fromPlayerItemTrack___block_invoke;
    block[3] = &unk_1E57B2138;
    block[4] = a3;
    void block[5] = self;
    block[6] = a4;
    dispatch_async(accumulationQueue, block);
  }
}

void __112__AVPlayerItemMetadataOutput_AVPlayerItemMetadataOutput_Internal___pushTimedMetadataGroups_fromPlayerItemTrack___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = (const void *)a1[6];
  CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, *(CFDictionaryRef *)(*(void *)(a1[5] + 16) + 56));
  if (!v3) {
    uint64_t v3 = (const void *)[MEMORY[0x1E4F1CA98] null];
  }
  Value = (void *)CFDictionaryGetValue(MutableCopy, v3);
  if (Value)
  {
    uint64_t v6 = (void *)[Value mutableCopy];
    [v6 addObjectsFromArray:v2];
    CFDictionarySetValue(MutableCopy, v3, v6);
  }
  else
  {
    CFDictionarySetValue(MutableCopy, v3, (const void *)[MEMORY[0x1E4F1CA48] arrayWithArray:v2]);
  }
  uint64_t v7 = *(void *)(a1[5] + 16);
  v8 = *(const void **)(v7 + 56);
  *(void *)(v7 + 56) = MutableCopy;
  if (MutableCopy) {
    CFRetain(MutableCopy);
  }
  if (v8) {
    CFRelease(v8);
  }
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  uint64_t v9 = a1[5];
  uint64_t v10 = *(NSObject **)(*(void *)(v9 + 16) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__AVPlayerItemMetadataOutput_AVPlayerItemMetadataOutput_Internal___pushTimedMetadataGroups_fromPlayerItemTrack___block_invoke_2;
  block[3] = &unk_1E57B1E80;
  block[4] = v9;
  dispatch_async(v10, block);
}

void __112__AVPlayerItemMetadataOutput_AVPlayerItemMetadataOutput_Internal___pushTimedMetadataGroups_fromPlayerItemTrack___block_invoke_2(uint64_t a1)
{
  if (CFDictionaryGetCount(*(CFDictionaryRef *)(*(void *)(*(void *)(a1 + 32) + 16) + 56)) >= 1)
  {
    uint64_t v2 = dispatch_semaphore_create(0);
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFDictionaryRef Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *(CFDictionaryRef *)(*(void *)(*(void *)(a1 + 32) + 16) + 56));
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(*(void *)(v5 + 16) + 16);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __112__AVPlayerItemMetadataOutput_AVPlayerItemMetadataOutput_Internal___pushTimedMetadataGroups_fromPlayerItemTrack___block_invoke_3;
    v8[3] = &unk_1E57B4BB0;
    v8[5] = v2;
    v8[6] = Copy;
    v8[4] = v5;
    [v6 invokeDelegateCallbackWithBlock:v8];
    uint64_t v7 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 16) + 56);
    if (v7) {
      CFRelease(v7);
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 56) = CFDictionaryCreateMutable(v3, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v2);
  }
}

intptr_t __112__AVPlayerItemMetadataOutput_AVPlayerItemMetadataOutput_Internal___pushTimedMetadataGroups_fromPlayerItemTrack___block_invoke_3(intptr_t result, void *a2)
{
  if (a2)
  {
    intptr_t v3 = result;
    if (objc_opt_respondsToSelector())
    {
      int64_t Count = CFDictionaryGetCount(*(CFDictionaryRef *)(v3 + 48));
      uint64_t v5 = (const void **)malloc_type_calloc(Count, 8uLL, 0xC0040B8AA526DuLL);
      uint64_t v6 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
      CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(v3 + 48), v5, v6);
      if (Count >= 1)
      {
        uint64_t v7 = v5;
        v8 = v6;
        do
        {
          uint64_t v10 = (uint64_t)*v7++;
          uint64_t v9 = v10;
          uint64_t v12 = (uint64_t)*v8++;
          uint64_t v11 = v12;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v13 = 0;
          }
          else {
            uint64_t v13 = v9;
          }
          [a2 metadataOutput:*(void *)(v3 + 32) didOutputTimedMetadataGroups:v11 fromPlayerItemTrack:v13];
          --Count;
        }
        while (Count);
      }
      free(v5);
      free(v6);
    }
    CFRelease(*(CFTypeRef *)(v3 + 48));
    char v14 = *(NSObject **)(v3 + 40);
    return dispatch_semaphore_signal(v14);
  }
  return result;
}

- (BOOL)isDefunct
{
  return 0;
}

@end