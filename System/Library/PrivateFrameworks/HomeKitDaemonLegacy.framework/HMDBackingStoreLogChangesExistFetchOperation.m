@interface HMDBackingStoreLogChangesExistFetchOperation
- (HMDBackingStoreLogChangesExistFetchOperation)initWithNeedsPushTo:(unint64_t)a3 result:(id)a4;
- (id)fetchBlock;
- (id)mainReturningError;
- (int64_t)compareValue;
- (int64_t)maskValue;
- (void)setCompareValue:(int64_t)a3;
- (void)setFetchBlock:(id)a3;
- (void)setMaskValue:(int64_t)a3;
@end

@implementation HMDBackingStoreLogChangesExistFetchOperation

- (void).cxx_destruct
{
}

- (void)setCompareValue:(int64_t)a3
{
  self->_compareValue = a3;
}

- (int64_t)compareValue
{
  return self->_compareValue;
}

- (void)setMaskValue:(int64_t)a3
{
  self->_maskValue = a3;
}

- (int64_t)maskValue
{
  return self->_maskValue;
}

- (void)setFetchBlock:(id)a3
{
}

- (id)fetchBlock
{
  return self->_fetchBlock;
}

- (id)mainReturningError
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__131907;
  v26 = __Block_byref_object_dispose__131908;
  id v27 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v5 = [(HMDBackingStoreOperation *)self store];
  v6 = [v5 local];
  int64_t v7 = [(HMDBackingStoreLogChangesExistFetchOperation *)self maskValue];
  int64_t v8 = [(HMDBackingStoreLogChangesExistFetchOperation *)self compareValue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__HMDBackingStoreLogChangesExistFetchOperation_mainReturningError__block_invoke;
  v15[3] = &unk_1E6A11468;
  v19 = &v22;
  id v9 = v3;
  v20 = v21;
  id v16 = v9;
  v17 = self;
  id v10 = v4;
  id v18 = v10;
  [v6 _selectLogWithMask:v7 compare:v8 callback:v15];

  v11 = [(HMDBackingStoreLogChangesExistFetchOperation *)self fetchBlock];

  if (v11)
  {
    if (v23[5])
    {
      v12 = [(HMDBackingStoreLogChangesExistFetchOperation *)self fetchBlock];
      v12[2](v12, 0, 0, v23[5]);
    }
    else
    {
      v12 = [(HMDBackingStoreLogChangesExistFetchOperation *)self fetchBlock];
      ((void (**)(void, id, id, void))v12)[2](v12, v9, v10, 0);
    }
  }
  id v13 = (id)v23[5];

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v22, 8);

  return v13;
}

BOOL __66__HMDBackingStoreLogChangesExistFetchOperation_mainReturningError__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v10)
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    id v13 = v10;
    v14 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v13;
  }
  else
  {
    if (!v9) {
      goto LABEL_4;
    }
    v14 = [*(id *)(a1 + 32) objectForKey:v9];
    if (!v14)
    {
      v14 = [MEMORY[0x1E4F1CA48] array];
      [*(id *)(a1 + 32) setObject:v14 forKey:v9];
    }
    id v16 = [NSNumber numberWithLongLong:a2];
    [v14 addObject:v16];

    uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
    if (*(void *)(v17 + 24) != a3)
    {
      *(void *)(v17 + 24) = a3;
      id v18 = [*(id *)(a1 + 40) store];
      v19 = [v18 local];
      v20 = [v19 _selectLogOptionsWithID:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];

      if (v20)
      {
        v21 = *(void **)(a1 + 48);
        uint64_t v22 = [v20 label];
        [v21 addObject:v22];
      }
    }
  }

LABEL_4:
  return v11 != 0;
}

- (HMDBackingStoreLogChangesExistFetchOperation)initWithNeedsPushTo:(unint64_t)a3 result:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDBackingStoreLogChangesExistFetchOperation;
  int64_t v7 = [(HMDBackingStoreOperation *)&v12 init];
  if (v7)
  {
    int64_t v8 = _Block_copy(v6);
    id fetchBlock = v7->_fetchBlock;
    v7->_id fetchBlock = v8;

    v7->_maskValue = a3 | (a3 << 16);
    v7->_compareValue = a3;
    id v10 = v7;
  }

  return v7;
}

@end