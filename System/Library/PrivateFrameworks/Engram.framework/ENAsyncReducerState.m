@interface ENAsyncReducerState
- (CUTResult)currentResult;
- (NSArray)pendingItems;
- (NSArray)visitedItems;
- (id)cancelBlock;
- (id)continueBlock;
- (id)currentItem;
- (id)stopBlock;
- (void)cancelWithError:(id)a3;
- (void)continueWithResult:(id)a3;
- (void)setCancelBlock:(id)a3;
- (void)setContinueBlock:(id)a3;
- (void)setCurrentItem:(id)a3;
- (void)setCurrentResult:(id)a3;
- (void)setPendingItems:(id)a3;
- (void)setStopBlock:(id)a3;
- (void)setVisitedItems:(id)a3;
- (void)stopWithResult:(id)a3;
@end

@implementation ENAsyncReducerState

- (void)continueWithResult:(id)a3
{
  id v4 = a3;
  v5 = [(ENAsyncReducerState *)self continueBlock];
  v5[2](v5, v4);
}

- (void)cancelWithError:(id)a3
{
  id v4 = a3;
  v5 = [(ENAsyncReducerState *)self cancelBlock];
  v5[2](v5, v4);
}

- (void)stopWithResult:(id)a3
{
  id v4 = a3;
  v5 = [(ENAsyncReducerState *)self stopBlock];
  v5[2](v5, v4);
}

- (NSArray)visitedItems
{
  return self->_visitedItems;
}

- (void)setVisitedItems:(id)a3
{
}

- (NSArray)pendingItems
{
  return self->_pendingItems;
}

- (void)setPendingItems:(id)a3
{
}

- (id)currentItem
{
  return self->_currentItem;
}

- (void)setCurrentItem:(id)a3
{
}

- (CUTResult)currentResult
{
  return self->_currentResult;
}

- (void)setCurrentResult:(id)a3
{
}

- (id)cancelBlock
{
  return self->_cancelBlock;
}

- (void)setCancelBlock:(id)a3
{
}

- (id)continueBlock
{
  return self->_continueBlock;
}

- (void)setContinueBlock:(id)a3
{
}

- (id)stopBlock
{
  return self->_stopBlock;
}

- (void)setStopBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stopBlock, 0);
  objc_storeStrong(&self->_continueBlock, 0);
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong((id *)&self->_currentResult, 0);
  objc_storeStrong(&self->_currentItem, 0);
  objc_storeStrong((id *)&self->_pendingItems, 0);
  objc_storeStrong((id *)&self->_visitedItems, 0);
}

@end