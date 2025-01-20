@interface SHLTaskOutcome
- (NSArray)failedItemIdentifiers;
- (NSArray)tasksToRetry;
- (NSError)error;
- (SHLTaskOutcome)init;
- (SHLTaskOutcome)initWithError:(id)a3;
- (SHLTaskOutcome)initWithTasksToRetry:(id)a3 error:(id)a4;
- (id)_initWithTasksToRetry:(id)a3 error:(id)a4;
@end

@implementation SHLTaskOutcome

- (SHLTaskOutcome)init
{
  return (SHLTaskOutcome *)[(SHLTaskOutcome *)self _initWithTasksToRetry:0 error:0];
}

- (SHLTaskOutcome)initWithError:(id)a3
{
  return (SHLTaskOutcome *)[(SHLTaskOutcome *)self _initWithTasksToRetry:0 error:a3];
}

- (SHLTaskOutcome)initWithTasksToRetry:(id)a3 error:(id)a4
{
  return (SHLTaskOutcome *)[(SHLTaskOutcome *)self _initWithTasksToRetry:a3 error:a4];
}

- (id)_initWithTasksToRetry:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SHLTaskOutcome;
  v8 = [(SHLTaskOutcome *)&v12 init];
  p_isa = (id *)&v8->super.isa;
  if (v8)
  {
    if (v6) {
      v10 = v6;
    }
    else {
      v10 = &__NSArray0__struct;
    }
    objc_storeStrong((id *)&v8->_tasksToRetry, v10);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (NSArray)failedItemIdentifiers
{
  v3 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(SHLTaskOutcome *)self tasksToRetry];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (![v9 type])
        {
          v10 = [v9 allItemIdentifiers];
          [v3 addObjectsFromArray:v10];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)tasksToRetry
{
  return self->_tasksToRetry;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_tasksToRetry, 0);
}

@end