@interface PKDetectionQuery
- (CHQuery)query;
- (void)dealloc;
- (void)pause;
- (void)setQuery:(id)a3;
- (void)start;
- (void)teardown;
@end

@implementation PKDetectionQuery

- (void)start
{
  id v2 = [(PKDetectionQuery *)self query];
  [v2 start];
}

- (void)pause
{
  id v2 = [(PKDetectionQuery *)self query];
  [v2 pause];
}

- (void)teardown
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__PKDetectionQuery_teardown__block_invoke;
  block[3] = &unk_1E64C61C0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __28__PKDetectionQuery_teardown__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) setDelegate:0];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKDetectionQuery;
  [(PKDetectionQuery *)&v2 dealloc];
}

- (CHQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (void).cxx_destruct
{
}

@end