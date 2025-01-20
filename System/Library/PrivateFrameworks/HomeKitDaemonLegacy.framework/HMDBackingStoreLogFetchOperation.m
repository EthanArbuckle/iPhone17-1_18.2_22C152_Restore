@interface HMDBackingStoreLogFetchOperation
- (HMDBackingStoreLogFetchOperation)initWithAlreadyPushedTo:(unint64_t)a3 result:(id)a4;
- (HMDBackingStoreLogFetchOperation)initWithNeedsPushTo:(unint64_t)a3 result:(id)a4;
- (HMDBackingStoreLogFetchOperation)initWithSentinel:(id)a3 alreadyPushedTo:(unint64_t)a4 fetchResult:(id)a5;
- (HMDBackingStoreLogFetchOperation)initWithSentinel:(id)a3 mask:(int64_t)a4 compare:(int64_t)a5 fetchResult:(id)a6;
- (HMDBackingStoreLogFetchOperation)initWithSentinel:(id)a3 needsPushTo:(unint64_t)a4 fetchResult:(id)a5;
- (id)fetchBlock;
- (id)mainReturningError;
- (id)sentinel;
- (int64_t)compareValue;
- (int64_t)maskValue;
- (void)setCompareValue:(int64_t)a3;
- (void)setFetchBlock:(id)a3;
- (void)setMaskValue:(int64_t)a3;
- (void)setSentinel:(id)a3;
@end

@implementation HMDBackingStoreLogFetchOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sentinel, 0);
  objc_storeStrong(&self->_fetchBlock, 0);
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

- (void)setSentinel:(id)a3
{
}

- (id)sentinel
{
  return self->_sentinel;
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
  v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__131907;
  v32 = __Block_byref_object_dispose__131908;
  id v33 = 0;
  v4 = [(HMDBackingStoreOperation *)self store];
  v5 = [v4 local];
  v6 = [(HMDBackingStoreOperation *)self store];
  v7 = [v6 root];
  v8 = [(HMDBackingStoreLogFetchOperation *)self sentinel];
  uint64_t v9 = [v8 unsignedIntegerValue];
  int64_t v10 = [(HMDBackingStoreLogFetchOperation *)self maskValue];
  int64_t v11 = [(HMDBackingStoreLogFetchOperation *)self compareValue];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __54__HMDBackingStoreLogFetchOperation_mainReturningError__block_invoke;
  v23 = &unk_1E6A11440;
  v26 = &v28;
  id v12 = v3;
  v27 = &v34;
  id v24 = v12;
  v25 = self;
  [v5 _selectLogWithRoot:v7 after:v9 mask:v10 compare:v11 callback:&v20];

  v13 = [(HMDBackingStoreLogFetchOperation *)self fetchBlock];

  if (v13)
  {
    if (v29[5])
    {
      v14 = [(HMDBackingStoreLogFetchOperation *)self fetchBlock];
      v14[2](v14, 0, 0, v29[5]);
    }
    else
    {
      if (![v12 count]) {
        goto LABEL_7;
      }
      v14 = [(HMDBackingStoreLogFetchOperation *)self fetchBlock];
      v15 = [(HMDBackingStoreOperation *)self store];
      v16 = [v15 local];
      v17 = [v16 _selectLogOptionsWithID:v35[3]];
      ((void (**)(void, id, void *, void))v14)[2](v14, v12, v17, 0);
    }
  }
LABEL_7:
  id v18 = (id)v29[5];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v18;
}

uint64_t __54__HMDBackingStoreLogFetchOperation_mainReturningError__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  id v15 = a8;
  if (!v15)
  {
    id v28 = 0;
    v17 = +[HMDBackingStoreModelObject objectFromData:a7 encoding:a6 rowID:a2 error:&v28];
    id v18 = v28;
    id v19 = v28;
    [v17 setObjectChangeType:a5];
    if (v19)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v18);
      [*(id *)(a1 + 32) removeAllObjects];
    }
    else
    {
      uint64_t v20 = *(void **)(a1 + 32);
      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == a3)
      {
        [v20 addObject:v17];
        uint64_t v16 = 0;
        goto LABEL_11;
      }
      if (![v20 count]) {
        goto LABEL_10;
      }
      uint64_t v21 = [*(id *)(a1 + 40) fetchBlock];
      uint64_t v22 = *(void *)(a1 + 32);
      v27 = [*(id *)(a1 + 40) store];
      v23 = [v27 local];
      id v24 = [v23 _selectLogOptionsWithID:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
      v25 = [NSNumber numberWithLongLong:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
      LODWORD(v22) = ((uint64_t (**)(void, uint64_t, void *, void *))v21)[2](v21, v22, v24, v25);

      if (v22)
      {
LABEL_10:
        [*(id *)(a1 + 32) removeAllObjects];
        [*(id *)(a1 + 32) addObject:v17];
        uint64_t v16 = 0;
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3;
        goto LABEL_11;
      }
    }
    uint64_t v16 = 1;
LABEL_11:

    goto LABEL_12;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a8);
  uint64_t v16 = 1;
LABEL_12:

  return v16;
}

- (HMDBackingStoreLogFetchOperation)initWithSentinel:(id)a3 alreadyPushedTo:(unint64_t)a4 fetchResult:(id)a5
{
  return [(HMDBackingStoreLogFetchOperation *)self initWithSentinel:a3 mask:(unsigned __int16)a4 | ((unint64_t)(unsigned __int16)a4 << 16) compare:(unsigned __int16)a4 | ((unint64_t)(unsigned __int16)a4 << 16) fetchResult:a5];
}

- (HMDBackingStoreLogFetchOperation)initWithAlreadyPushedTo:(unint64_t)a3 result:(id)a4
{
  return [(HMDBackingStoreLogFetchOperation *)self initWithSentinel:0 alreadyPushedTo:a3 fetchResult:a4];
}

- (HMDBackingStoreLogFetchOperation)initWithSentinel:(id)a3 needsPushTo:(unint64_t)a4 fetchResult:(id)a5
{
  return [(HMDBackingStoreLogFetchOperation *)self initWithSentinel:a3 mask:(unsigned __int16)a4 | ((unint64_t)(unsigned __int16)a4 << 16) compare:(unsigned __int16)a4 fetchResult:a5];
}

- (HMDBackingStoreLogFetchOperation)initWithNeedsPushTo:(unint64_t)a3 result:(id)a4
{
  return [(HMDBackingStoreLogFetchOperation *)self initWithSentinel:0 needsPushTo:a3 fetchResult:a4];
}

- (HMDBackingStoreLogFetchOperation)initWithSentinel:(id)a3 mask:(int64_t)a4 compare:(int64_t)a5 fetchResult:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMDBackingStoreLogFetchOperation;
  v13 = [(HMDBackingStoreOperation *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong(&v13->_sentinel, a3);
    id v15 = _Block_copy(v12);
    id fetchBlock = v14->_fetchBlock;
    v14->_id fetchBlock = v15;

    v14->_maskValue = a4;
    v14->_compareValue = a5;
    v17 = v14;
  }

  return v14;
}

@end