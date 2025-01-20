@interface PipelineStatePromise
- (BOOL)groupWasSuccessful;
- (BOOL)timesOutWaitingForPipelineStates:(double)a3;
- (PipelineStatePromise)initWithDispatchGroup:(id)a3 pipelineStates:(id)a4 errors:(id)a5;
- (id)errorForFunction:(id)a3;
- (id)pipelineStateForFunction:(id)a3;
@end

@implementation PipelineStatePromise

- (PipelineStatePromise)initWithDispatchGroup:(id)a3 pipelineStates:(id)a4 errors:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PipelineStatePromise;
  v12 = [(PipelineStatePromise *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->group, a3);
    objc_storeStrong((id *)&v13->pipelineStates, a4);
    objc_storeStrong((id *)&v13->errors, a5);
  }

  return v13;
}

- (BOOL)timesOutWaitingForPipelineStates:(double)a3
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->initialization_completed);
  if ((v3 & 1) == 0)
  {
    intptr_t v5 = dispatch_group_wait((dispatch_group_t)self->group, (unint64_t)a3);
    BOOL result = 1;
    if (v5) {
      return result;
    }
    atomic_store(1u, (unsigned __int8 *)&self->initialization_completed);
  }
  return 0;
}

- (BOOL)groupWasSuccessful
{
  return [(NSMapTable *)self->errors count] == 0;
}

- (id)pipelineStateForFunction:(id)a3
{
  id v4 = a3;
  [(PipelineStatePromise *)self timesOutWaitingForPipelineStates:1.84467441e19];
  intptr_t v5 = [(NSMapTable *)self->pipelineStates objectForKey:v4];

  return v5;
}

- (id)errorForFunction:(id)a3
{
  id v4 = a3;
  [(PipelineStatePromise *)self timesOutWaitingForPipelineStates:1.84467441e19];
  intptr_t v5 = [(NSMapTable *)self->errors objectForKey:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->group, 0);
  objc_storeStrong((id *)&self->errors, 0);
  objc_storeStrong((id *)&self->pipelineStates, 0);
}

@end