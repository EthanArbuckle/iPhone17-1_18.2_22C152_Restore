@interface GTReplayerOperation
- (GTReplayerOperation)initWithBatch:(id)a3 withBlock:(id)a4;
- (GTReplayerOperation)initWithRequestID:(unint64_t)a3 withBlock:(id)a4;
- (void)main;
@end

@implementation GTReplayerOperation

- (void).cxx_destruct
{
}

- (void)main
{
  GTCoreOperationControl_getOperation(self->_uuid);
  v3 = (void (*)(void))*((void *)self->_block + 2);

  v3();
}

- (GTReplayerOperation)initWithBatch:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GTReplayerOperation;
  v8 = [(GTReplayerOperation *)&v12 init];
  if (v8)
  {
    id v9 = objc_retainBlock(v7);
    id block = v8->_block;
    v8->_id block = v9;

    v8->_uuid = (unint64_t)[v6 uuid];
  }

  return v8;
}

- (GTReplayerOperation)initWithRequestID:(unint64_t)a3 withBlock:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GTReplayerOperation;
  id v7 = [(GTReplayerOperation *)&v14 init];
  if (v7)
  {
    id v8 = objc_retainBlock(v6);
    id block = v7->_block;
    v7->_id block = v8;

    v7->_uuid = a3;
    GTCoreOperationControl_addOperation(a3);
    objc_initWeak(&location, v7);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __51__GTReplayerOperation_initWithRequestID_withBlock___block_invoke;
    v11[3] = &unk_7463E8;
    objc_copyWeak(v12, &location);
    v12[1] = (id)a3;
    [(GTReplayerOperation *)v7 setCompletionBlock:v11];
    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __51__GTReplayerOperation_initWithRequestID_withBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  GTCoreOperationControl_removeOperation(*(void *)(a1 + 40));
}

@end