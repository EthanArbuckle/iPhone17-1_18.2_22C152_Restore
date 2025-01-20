@interface ESECalendarAvailabilityContext
- (ESECalendarAvailabilityContext)initWithResultsBlock:(id)a3 completionBlock:(id)a4;
- (void)finishedWithError:(id)a3;
- (void)resultsReturned:(id)a3;
@end

@implementation ESECalendarAvailabilityContext

- (ESECalendarAvailabilityContext)initWithResultsBlock:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ESECalendarAvailabilityContext;
  v8 = [(ESECalendarAvailabilityContext *)&v14 init];
  if (v8)
  {
    uint64_t v9 = MEMORY[0x237DAF050](v6);
    id resultsBlock = v8->_resultsBlock;
    v8->_id resultsBlock = (id)v9;

    uint64_t v11 = MEMORY[0x237DAF050](v7);
    id completionBlock = v8->_completionBlock;
    v8->_id completionBlock = (id)v11;
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

- (void)finishedWithError:(id)a3
{
  id v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  id completionBlock = (void (**)(id, id))v4->_completionBlock;
  if (completionBlock)
  {
    completionBlock[2](completionBlock, v8);
    id v6 = v4->_completionBlock;
    v4->_id completionBlock = 0;

    id resultsBlock = v4->_resultsBlock;
    v4->_id resultsBlock = 0;
  }
  objc_sync_exit(v4);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_resultsBlock, 0);
}

@end