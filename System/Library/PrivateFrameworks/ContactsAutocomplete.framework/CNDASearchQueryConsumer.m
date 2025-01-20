@interface CNDASearchQueryConsumer
+ (id)SuccessfulResults;
- (CNDASearchQueryConsumer)initWithLatch:(id)a3;
- (CNResult)result;
- (void)searchQuery:(id)a3 finishedWithError:(id)a4;
- (void)searchQuery:(id)a3 returnedResults:(id)a4;
@end

@implementation CNDASearchQueryConsumer

- (CNDASearchQueryConsumer)initWithLatch:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNDASearchQueryConsumer;
  v6 = [(CNDASearchQueryConsumer *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_latch, a3);
    uint64_t v8 = objc_opt_new();
    results = v7->_results;
    v7->_results = (NSMutableArray *)v8;

    v10 = v7;
  }

  return v7;
}

+ (id)SuccessfulResults
{
  return &__block_literal_global_13;
}

id __44__CNDASearchQueryConsumer_SuccessfulResults__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 result];
  if ([v2 isSuccess])
  {
    v3 = [v2 value];
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v3;
}

- (void)searchQuery:(id)a3 returnedResults:(id)a4
{
  results = self->_results;
  id v7 = a3;
  [(NSMutableArray *)results addObjectsFromArray:a4];
  LOBYTE(a4) = [v7 isQueryRunning];

  if ((a4 & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F5A4E0] successWithValue:self->_results];
    result = self->_result;
    self->_result = v8;

    latch = self->_latch;
    [(CNCountdownLatch *)latch countDown];
  }
}

- (void)searchQuery:(id)a3 finishedWithError:(id)a4
{
  if (!self->_result)
  {
    id v5 = [MEMORY[0x1E4F5A4E0] failureWithError:a4];
    result = self->_result;
    self->_result = v5;

    latch = self->_latch;
    [(CNCountdownLatch *)latch countDown];
  }
}

- (CNResult)result
{
  return (CNResult *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_latch, 0);
}

@end