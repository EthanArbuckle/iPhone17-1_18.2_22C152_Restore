@interface AVLazyValueLoadingMetadataItem
+ (id)metadataItemWithPropertiesOfMetadataItem:(id)a3 valueLoadingHandler:(id)a4;
- (BOOL)_valueForKeyDependsOnMetadataValue:(id)a3;
- (id)_initWithFigMetadataDictionary:(id)a3 valueLoadingHandler:(id)a4;
- (id)dataType;
- (id)value;
- (int64_t)_valueStatus;
- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4;
- (void)_valueRequestDidFinish;
- (void)_waitForLoadingOfValueDependentKey:(id)a3;
- (void)dealloc;
- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4;
@end

@implementation AVLazyValueLoadingMetadataItem

+ (id)metadataItemWithPropertiesOfMetadataItem:(id)a3 valueLoadingHandler:(id)a4
{
  v4 = objc_msgSend(objc_alloc((Class)a1), "_initWithFigMetadataDictionary:valueLoadingHandler:", objc_msgSend(a3, "_figMetadataDictionaryWithValue:diviningValueDataType:", 0, 0), a4);
  return v4;
}

- (id)_initWithFigMetadataDictionary:(id)a3 valueLoadingHandler:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AVLazyValueLoadingMetadataItem;
  v5 = [(AVMetadataItem *)&v8 _initWithFigMetadataDictionary:a3];
  if (v5)
  {
    v6 = objc_alloc_init(AVLazyValueLoadingMetadataItemInternal);
    v5[2] = v6;
    if (v6)
    {
      CFRetain(v6);
      if (a4)
      {
        *(void *)(v5[2] + 24) = +[AVMetadataItemValueRequest metadataItemValueRequestWithMetadataItem:v5];
        *(void *)(v5[2] + 32) = [a4 copy];
        *(void *)(v5[2] + 40) = 0;
        *(void *)(v5[2] + 56) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      }
      else
      {
        *(void *)(v5[2] + 40) = 2;
      }
      *(void *)(v5[2] + 64) = av_readwrite_dispatch_queue_create("com.apple.avfoundation.avmetadataitem");
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  lazyMetadataItem = self->_lazyMetadataItem;
  if (lazyMetadataItem)
  {

    v4 = self->_lazyMetadataItem;
    readWriteQueue = v4->readWriteQueue;
    if (readWriteQueue)
    {
      dispatch_release(readWriteQueue);
      v4 = self->_lazyMetadataItem;
    }

    CFRelease(self->_lazyMetadataItem);
  }
  v6.receiver = self;
  v6.super_class = (Class)AVLazyValueLoadingMetadataItem;
  [(AVMetadataItem *)&v6 dealloc];
}

- (void)_valueRequestDidFinish
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__2;
  lazyMetadataItem = self->_lazyMetadataItem;
  v17 = __Block_byref_object_dispose__2;
  uint64_t v18 = 0;
  readWriteQueue = lazyMetadataItem->readWriteQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__AVLazyValueLoadingMetadataItem__valueRequestDidFinish__block_invoke;
  block[3] = &unk_1E57B2160;
  block[4] = self;
  block[5] = &v13;
  av_readwrite_dispatch_queue_write(readWriteQueue, block);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v4 = (void *)v14[5];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * i) + 16))();
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v19 count:16];
    }
    while (v5);
  }

  _Block_object_dispose(&v13, 8);
}

void *__56__AVLazyValueLoadingMetadataItem__valueRequestDidFinish__block_invoke(void *result)
{
  uint64_t v1 = *(void *)(result[4] + 16);
  if (*(uint64_t *)(v1 + 40) <= 2)
  {
    v2 = result;
    uint64_t v3 = [*(id *)(v1 + 24) value];
    uint64_t v4 = *(void *)(v2[4] + 16);
    if (v3)
    {
      *(void *)(v4 + 40) = 2;
      *(void *)(*(void *)(v2[4] + 16) + 8) = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(v2[4] + 16) + 24), "value"), "copyWithZone:", objc_msgSend((id)v2[4], "zone"));
      result = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(v2[4] + 16) + 24), "dataType"), "copy");
      uint64_t v5 = 16;
    }
    else
    {
      *(void *)(v4 + 40) = 3;
      result = (id)[*(id *)(*(void *)(v2[4] + 16) + 24) error];
      uint64_t v5 = 48;
    }
    *(void *)(*(void *)(v2[4] + 16) + v5) = result;
    *(void *)(*(void *)(v2[5] + 8) + 40) = *(void *)(*(void *)(v2[4] + 16) + 56);
    *(void *)(*(void *)(v2[4] + 16) + 56) = 0;
  }
  return result;
}

- (BOOL)_valueForKeyDependsOnMetadataValue:(id)a3
{
  if (a3
    && (([a3 isEqualToString:@"value"] & 1) != 0
     || [a3 rangeOfString:@"Value" options:14] != 0x7FFFFFFFFFFFFFFFLL
     || v5))
  {
    return 1;
  }
  return [a3 isEqualToString:@"dataType"];
}

- (int64_t)_valueStatus
{
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x2020000000;
  lazyMetadataItem = self->_lazyMetadataItem;
  uint64_t v10 = 0;
  readWriteQueue = lazyMetadataItem->readWriteQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__AVLazyValueLoadingMetadataItem__valueStatus__block_invoke;
  v6[3] = &unk_1E57B2110;
  v6[4] = self;
  v6[5] = &v7;
  av_readwrite_dispatch_queue_read(readWriteQueue, v6);
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __46__AVLazyValueLoadingMetadataItem__valueStatus__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 16)
                                                                              + 40);
  return result;
}

- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4
{
  if (![(AVLazyValueLoadingMetadataItem *)self _valueForKeyDependsOnMetadataValue:a3])return 2; {
  int64_t result = [(AVLazyValueLoadingMetadataItem *)self _valueStatus];
  }
  if (a4)
  {
    if (result == 3) {
      *a4 = self->_lazyMetadataItem->valueLoadingError;
    }
  }
  return result;
}

- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  if (objc_msgSend((id)objc_msgSend(a3, "indexesOfObjectsPassingTest:", &__block_literal_global_303), "count"))
  {
    readWriteQueue = self->_lazyMetadataItem->readWriteQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__AVLazyValueLoadingMetadataItem_loadValuesAsynchronouslyForKeys_completionHandler___block_invoke_2;
    block[3] = &unk_1E57B2D78;
    block[4] = self;
    block[5] = a4;
    void block[6] = &v9;
    av_readwrite_dispatch_queue_write(readWriteQueue, block);
    BOOL v7 = *((unsigned char *)v10 + 24) != 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v7 = 1;
    *((unsigned char *)v10 + 24) = 1;
    if (!a4) {
      goto LABEL_7;
    }
  }
  if (v7) {
    (*((void (**)(id))a4 + 2))(a4);
  }
LABEL_7:
  _Block_object_dispose(&v9, 8);
}

BOOL __84__AVLazyValueLoadingMetadataItem_loadValuesAsynchronouslyForKeys_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (!a2) {
    return 0;
  }
  if ([a2 isEqualToString:@"value"]) {
    return 1;
  }
  return [a2 rangeOfString:@"Value" options:14] != 0x7FFFFFFFFFFFFFFFLL || v4 != 0;
}

void __84__AVLazyValueLoadingMetadataItem_loadValuesAsynchronouslyForKeys_completionHandler___block_invoke_2(void *a1)
{
  uint64_t v2 = *(void *)(a1[4] + 16);
  uint64_t v3 = *(void *)(v2 + 40);
  if (v3 == 1)
  {
    uint64_t v6 = (void *)a1[5];
    if (v6)
    {
      BOOL v7 = *(void **)(v2 + 56);
      id v8 = (id)[v6 copy];
      [v7 addObject:v8];
    }
  }
  else if (v3)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  else
  {
    *(void *)(v2 + 40) = 1;
    uint64_t v4 = (void *)a1[5];
    if (v4) {
      objc_msgSend(*(id *)(*(void *)(a1[4] + 16) + 56), "addObject:", (id)objc_msgSend(v4, "copy"));
    }
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__AVLazyValueLoadingMetadataItem_loadValuesAsynchronouslyForKeys_completionHandler___block_invoke_3;
    block[3] = &unk_1E57B1E80;
    block[4] = a1[4];
    dispatch_async(global_queue, block);
  }
}

void __84__AVLazyValueLoadingMetadataItem_loadValuesAsynchronouslyForKeys_completionHandler___block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 32) = 0;
}

- (void)_waitForLoadingOfValueDependentKey:(id)a3
{
  if ([(AVLazyValueLoadingMetadataItem *)self _valueStatus] <= 1)
  {
    uint64_t v5 = dispatch_semaphore_create(0);
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObject:a3];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __69__AVLazyValueLoadingMetadataItem__waitForLoadingOfValueDependentKey___block_invoke;
    v7[3] = &unk_1E57B1E80;
    v7[4] = v5;
    [(AVLazyValueLoadingMetadataItem *)self loadValuesAsynchronouslyForKeys:v6 completionHandler:v7];
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v5);
  }
}

intptr_t __69__AVLazyValueLoadingMetadataItem__waitForLoadingOfValueDependentKey___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)value
{
  return self->_lazyMetadataItem->value;
}

- (id)dataType
{
  [(AVLazyValueLoadingMetadataItem *)self _waitForLoadingOfValueDependentKey:@"dataType"];
  id result = self->_lazyMetadataItem->dataType;
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)AVLazyValueLoadingMetadataItem;
    return [(AVMetadataItem *)&v4 dataType];
  }
  return result;
}

@end