@interface CalCompositeCalendarMigrationFailureRecorder
- (CalCompositeCalendarMigrationFailureRecorder)initWithFailureRecorders:(id)a3;
- (NSArray)failureRecorders;
- (void)recordMigrationFailure:(id)a3;
- (void)reportRecordedFailures;
@end

@implementation CalCompositeCalendarMigrationFailureRecorder

- (CalCompositeCalendarMigrationFailureRecorder)initWithFailureRecorders:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CalCompositeCalendarMigrationFailureRecorder;
  v5 = [(CalCompositeCalendarMigrationFailureRecorder *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    failureRecorders = v5->_failureRecorders;
    v5->_failureRecorders = (NSArray *)v6;
  }
  return v5;
}

- (void)recordMigrationFailure:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(CalCompositeCalendarMigrationFailureRecorder *)self failureRecorders];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) recordMigrationFailure:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)reportRecordedFailures
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(CalCompositeCalendarMigrationFailureRecorder *)self failureRecorders];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) reportRecordedFailures];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (NSArray)failureRecorders
{
  return self->_failureRecorders;
}

- (void).cxx_destruct
{
}

@end