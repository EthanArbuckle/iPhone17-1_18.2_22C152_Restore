@interface _EFBlockObserver
- (_EFBlockObserver)initWithResultBlock:(id)a3 completionBlock:(id)a4 failureBlock:(id)a5;
- (void)observerDidComplete;
- (void)observerDidFailWithError:(id)a3;
- (void)observerDidReceiveResult:(id)a3;
@end

@implementation _EFBlockObserver

- (_EFBlockObserver)initWithResultBlock:(id)a3 completionBlock:(id)a4 failureBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_EFBlockObserver;
  v11 = [(_EFBlockObserver *)&v19 init];
  if (v11)
  {
    v12 = _Block_copy(v8);
    id resultBlock = v11->_resultBlock;
    v11->_id resultBlock = v12;

    v14 = _Block_copy(v9);
    id completionBlock = v11->_completionBlock;
    v11->_id completionBlock = v14;

    v16 = _Block_copy(v10);
    id failureBlock = v11->_failureBlock;
    v11->_id failureBlock = v16;
  }
  return v11;
}

- (void)observerDidReceiveResult:(id)a3
{
  id v5 = a3;
  id resultBlock = (void (**)(id, id))self->_resultBlock;
  if (resultBlock) {
    resultBlock[2](resultBlock, v5);
  }
}

- (void)observerDidComplete
{
  id completionBlock = (void (**)(void))self->_completionBlock;
  if (completionBlock) {
    completionBlock[2]();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_failureBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_resultBlock, 0);
}

- (void)observerDidFailWithError:(id)a3
{
  id v5 = a3;
  id failureBlock = (void (**)(id, id))self->_failureBlock;
  if (failureBlock) {
    failureBlock[2](failureBlock, v5);
  }
}

@end