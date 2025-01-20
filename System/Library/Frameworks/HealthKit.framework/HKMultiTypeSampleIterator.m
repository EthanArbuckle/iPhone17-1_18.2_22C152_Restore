@interface HKMultiTypeSampleIterator
- (BOOL)_queryForNextPageIfNecessaryWithError:(id *)a3;
- (BOOL)advanceWithError:(id *)a3;
- (HKMultiTypeSampleIterator)init;
- (HKMultiTypeSampleIterator)initWithQueryDescriptors:(id)a3 sortDescriptors:(id)a4 bufferSize:(int64_t)a5 healthStore:(id)a6;
- (HKMultiTypeSampleIterator)initWithQueryDescriptors:(id)a3 sortDescriptors:(id)a4 followingAnchor:(id)a5 upToAndIncludingAnchor:(id)a6 distinctByKeyPaths:(id)a7 bufferSize:(unint64_t)a8 limit:(unint64_t)a9 healthStore:(id)a10;
- (HKSample)sample;
- (id)copyWithZone:(_NSZone *)a3;
- (id)object;
@end

@implementation HKMultiTypeSampleIterator

- (HKMultiTypeSampleIterator)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (BOOL)_queryForNextPageIfNecessaryWithError:(id *)a3
{
  if ([(NSMutableArray *)self->_buffer count]) {
    return 1;
  }
  if (self->_state == 2)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 900, @"Multi-type sample iterator is exhausted");
    return 0;
  }
  else
  {
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__33;
    v26 = __Block_byref_object_dispose__33;
    id v27 = 0;
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__HKMultiTypeSampleIterator__queryForNextPageIfNecessaryWithError___block_invoke;
    aBlock[3] = &unk_1E58C4E78;
    v20 = &v22;
    v7 = v6;
    v18 = v7;
    v19 = self;
    v21 = &v28;
    v8 = _Block_copy(aBlock);
    unint64_t bufferSize = self->_bufferSize;
    unint64_t limit = self->_limit;
    if (limit)
    {
      unint64_t v11 = limit - self->_numberOfSamplesDelivered;
      if (bufferSize >= v11) {
        unint64_t bufferSize = v11;
      }
    }
    if (self->_state == 1) {
      v12 = [[HKSampleIteratorQuery alloc] initWithQueryCursor:self->_queryCursor limit:bufferSize resultsHandler:v8];
    }
    else {
      v12 = [[HKSampleIteratorQuery alloc] initWithQueryDescriptors:self->_queryDescriptors sortDescriptors:self->_sortDescriptors followingAnchor:self->_followingAnchor upToAndIncludingAnchor:self->_upToAndIncludingAnchor distinctByKeyPaths:self->_distinctByKeyPaths limit:bufferSize resultsHandler:v8];
    }
    v13 = v12;
    [(HKHealthStore *)self->_healthStore executeQuery:v12];
    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    id v14 = (id)v23[5];
    v15 = v14;
    if (v14)
    {
      if (a3) {
        *a3 = v14;
      }
      else {
        _HKLogDroppedError(v14);
      }
    }

    BOOL v5 = *((unsigned char *)v29 + 24) != 0;
    _Block_object_dispose(&v22, 8);

    _Block_object_dispose(&v28, 8);
  }
  return v5;
}

void __67__HKMultiTypeSampleIterator__queryForNextPageIfNecessaryWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v20)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 80), a4);
    if (v8)
    {
      unint64_t v10 = [v20 count];
      uint64_t v11 = *(void *)(a1 + 40);
      BOOL v12 = v10 >= *(void *)(v11 + 48);
      v13 = v20;
      uint64_t v14 = 1;
      if (!v12) {
        uint64_t v14 = 2;
      }
    }
    else
    {
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v14 = 2;
      v13 = v20;
    }
    *(void *)(v11 + 72) = v14;
    v15 = [v13 reverseObjectEnumerator];
    v16 = [v15 allObjects];
    uint64_t v17 = [v16 mutableCopy];
    uint64_t v18 = *(void *)(a1 + 40);
    v19 = *(void **)(v18 + 88);
    *(void *)(v18 + 88) = v17;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a5);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (HKMultiTypeSampleIterator)initWithQueryDescriptors:(id)a3 sortDescriptors:(id)a4 followingAnchor:(id)a5 upToAndIncludingAnchor:(id)a6 distinctByKeyPaths:(id)a7 bufferSize:(unint64_t)a8 limit:(unint64_t)a9 healthStore:(id)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a10;
  if (!v17)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"HKMultiTypeSampleIterator.m", 138, @"Invalid parameter not satisfying: %@", @"queryDescriptors" object file lineNumber description];
  }
  if ([v17 count])
  {
    if (v22) {
      goto LABEL_5;
    }
  }
  else
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"HKMultiTypeSampleIterator.m", 139, @"Invalid parameter not satisfying: %@", @"queryDescriptors.count > 0" object file lineNumber description];

    if (v22) {
      goto LABEL_5;
    }
  }
  v39 = [MEMORY[0x1E4F28B00] currentHandler];
  [v39 handleFailureInMethod:a2, self, @"HKMultiTypeSampleIterator.m", 140, @"Invalid parameter not satisfying: %@", @"healthStore" object file lineNumber description];

LABEL_5:
  v40.receiver = self;
  v40.super_class = (Class)HKMultiTypeSampleIterator;
  v23 = [(HKMultiTypeSampleIterator *)&v40 init];
  if (v23)
  {
    uint64_t v24 = [v17 copy];
    queryDescriptors = v23->_queryDescriptors;
    v23->_queryDescriptors = (NSArray *)v24;

    uint64_t v26 = [v18 copy];
    sortDescriptors = v23->_sortDescriptors;
    v23->_sortDescriptors = (NSArray *)v26;

    uint64_t v28 = [v19 copy];
    followingAnchor = v23->_followingAnchor;
    v23->_followingAnchor = (HKQueryAnchor *)v28;

    uint64_t v30 = [v20 copy];
    upToAndIncludingAnchor = v23->_upToAndIncludingAnchor;
    v23->_upToAndIncludingAnchor = (HKQueryAnchor *)v30;

    uint64_t v32 = [v21 copy];
    distinctByKeyPaths = v23->_distinctByKeyPaths;
    v23->_distinctByKeyPaths = (NSArray *)v32;

    v23->_unint64_t bufferSize = a8;
    v23->_unint64_t limit = a9;
    objc_storeStrong((id *)&v23->_healthStore, a10);
    queryCursor = v23->_queryCursor;
    v23->_state = 0;
    v23->_queryCursor = 0;

    current = v23->_current;
    v23->_current = 0;

    v23->_numberOfSamplesDelivered = 0;
  }

  return v23;
}

- (HKMultiTypeSampleIterator)initWithQueryDescriptors:(id)a3 sortDescriptors:(id)a4 bufferSize:(int64_t)a5 healthStore:(id)a6
{
  return [(HKMultiTypeSampleIterator *)self initWithQueryDescriptors:a3 sortDescriptors:a4 followingAnchor:0 upToAndIncludingAnchor:0 distinctByKeyPaths:0 bufferSize:a5 limit:0 healthStore:a6];
}

- (BOOL)advanceWithError:(id *)a3
{
  BOOL v6 = -[HKMultiTypeSampleIterator _queryForNextPageIfNecessaryWithError:](self, "_queryForNextPageIfNecessaryWithError:");
  if (v6)
  {
    if ([(NSMutableArray *)self->_buffer count])
    {
      v7 = [(NSMutableArray *)self->_buffer lastObject];
      current = self->_current;
      self->_current = v7;

      [(NSMutableArray *)self->_buffer removeLastObject];
      ++self->_numberOfSamplesDelivered;
      LOBYTE(v6) = 1;
    }
    else
    {
      if (self->_state != 2)
      {
        id v9 = [MEMORY[0x1E4F28B00] currentHandler];
        [v9 handleFailureInMethod:a2, self, @"HKMultiTypeSampleIterator.m", 184, @"Invalid parameter not satisfying: %@", @"_state == HKMultiTypeSampleIteratorStateComplete" object file lineNumber description];
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 900, @"Multi-type sample iterator is exhausted");
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (id)object
{
  return self->_current;
}

- (HKSample)sample
{
  return self->_current;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [[HKMultiTypeSampleIterator alloc] initWithQueryDescriptors:self->_queryDescriptors sortDescriptors:self->_sortDescriptors followingAnchor:self->_followingAnchor upToAndIncludingAnchor:self->_upToAndIncludingAnchor distinctByKeyPaths:self->_distinctByKeyPaths bufferSize:self->_bufferSize limit:self->_limit healthStore:self->_healthStore];
  uint64_t v5 = [(HKSampleIteratorQueryCursor *)self->_queryCursor copy];
  queryCursor = v4->_queryCursor;
  v4->_queryCursor = (HKSampleIteratorQueryCursor *)v5;

  uint64_t v7 = [(NSMutableArray *)self->_buffer mutableCopy];
  buffer = v4->_buffer;
  v4->_buffer = (NSMutableArray *)v7;

  uint64_t v9 = [(HKSample *)self->_current copy];
  current = v4->_current;
  v4->_current = (HKSample *)v9;

  v4->_state = self->_state;
  v4->_numberOfSamplesDelivered = self->_numberOfSamplesDelivered;
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_current, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_queryCursor, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_distinctByKeyPaths, 0);
  objc_storeStrong((id *)&self->_upToAndIncludingAnchor, 0);
  objc_storeStrong((id *)&self->_followingAnchor, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);

  objc_storeStrong((id *)&self->_queryDescriptors, 0);
}

@end