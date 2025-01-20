@interface _CNAggregateTask
- (BOOL)cancel;
- (NSArray)tasks;
- (_CNAggregateTask)initWithName:(id)a3 tasks:(id)a4;
- (id)description;
- (id)run:(id *)a3;
- (id)runSubtask:(id)a3 error:(id *)a4;
- (void)cancelSubtasks;
@end

@implementation _CNAggregateTask

- (_CNAggregateTask)initWithName:(id)a3 tasks:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_CNAggregateTask;
  v7 = [(CNTask *)&v12 initWithName:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    tasks = v7->_tasks;
    v7->_tasks = (NSArray *)v8;

    v10 = v7;
  }

  return v7;
}

- (id)description
{
  v3 = [(CNTask *)self name];
  v4 = [(_CNAggregateTask *)self tasks];
  v5 = +[CNDescriptionBuilder descriptionForObject:self, @"name", v3, @"subtasks", v4, 0 withNamesAndObjects];

  return v5;
}

- (id)run:(id *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F1CA98] null];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = [(_CNAggregateTask *)self tasks];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v19;
LABEL_3:
    uint64_t v11 = 0;
    objc_super v12 = v9;
    v13 = v5;
    while (1)
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(v6);
      }
      uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
      id v17 = v12;
      v5 = [(_CNAggregateTask *)self runSubtask:v14 error:&v17];
      id v9 = v17;

      if (!v5) {
        break;
      }
      ++v11;
      objc_super v12 = v9;
      v13 = v5;
      if (v8 == v11)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  v15 = +[CNFoundationError ifResultIsNil:v5 setOutputError:a3 toError:v9];

  return v15;
}

- (id)runSubtask:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(CNTask *)self isCancelled])
  {
    uint64_t v7 = +[CNFoundationError userCanceledError];
    uint64_t v8 = v7;
    if (a4) {
      *a4 = v7;
    }

    id v9 = 0;
  }
  else
  {
    id v9 = [v6 run:a4];
  }

  return v9;
}

- (BOOL)cancel
{
  v5.receiver = self;
  v5.super_class = (Class)_CNAggregateTask;
  BOOL v3 = [(CNTask *)&v5 cancel];
  if (v3) {
    [(_CNAggregateTask *)self cancelSubtasks];
  }
  return v3;
}

- (void)cancelSubtasks
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(_CNAggregateTask *)self tasks];
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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) cancel];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (NSArray)tasks
{
  return self->_tasks;
}

- (void).cxx_destruct
{
}

@end