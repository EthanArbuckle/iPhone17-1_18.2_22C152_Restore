@interface DAECalendarDirectorySearchContext
- (DAECalendarDirectorySearchContext)initWithResultsBlock:(id)a3 completionBlock:(id)a4;
- (void)finishedWithError:(id)a3 exceededResultLimit:(BOOL)a4;
- (void)resultsReturned:(id)a3;
@end

@implementation DAECalendarDirectorySearchContext

- (DAECalendarDirectorySearchContext)initWithResultsBlock:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DAECalendarDirectorySearchContext;
  v8 = [(DAECalendarDirectorySearchContext *)&v14 init];
  if (v8)
  {
    v9 = _Block_copy(v6);
    id resultsBlock = v8->_resultsBlock;
    v8->_id resultsBlock = v9;

    v11 = _Block_copy(v7);
    id completionBlock = v8->_completionBlock;
    v8->_id completionBlock = v11;
  }
  return v8;
}

- (void)resultsReturned:(id)a3
{
  id v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  id resultsBlock = (void (**)(id, id))v4->_resultsBlock;
  if (resultsBlock) {
    resultsBlock[2](resultsBlock, v6);
  }
  objc_sync_exit(v4);
}

- (void)finishedWithError:(id)a3 exceededResultLimit:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  id completionBlock = (void (**)(id, id, BOOL))v6->_completionBlock;
  if (completionBlock)
  {
    completionBlock[2](completionBlock, v10, v4);
    id v8 = v6->_completionBlock;
    v6->_id completionBlock = 0;

    id resultsBlock = v6->_resultsBlock;
    v6->_id resultsBlock = 0;
  }
  objc_sync_exit(v6);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);

  objc_storeStrong(&self->_resultsBlock, 0);
}

@end