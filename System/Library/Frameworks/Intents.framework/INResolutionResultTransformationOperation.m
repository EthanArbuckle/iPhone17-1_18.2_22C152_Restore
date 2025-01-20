@interface INResolutionResultTransformationOperation
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (INIntent)intent;
- (INIntentParameterOptionsProviding)optionsProvider;
- (INIntentResolutionResultDataProviding)result;
- (INIntentSlotDescription)intentSlotDescription;
- (INResolutionResultTransformationOperation)initWithResult:(id)a3 intent:(id)a4 intentSlotDescription:(id)a5 optionsProvider:(id)a6;
- (id)returnBlock;
- (void)setReturnBlock:(id)a3;
- (void)start;
@end

@implementation INResolutionResultTransformationOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_returnBlock, 0);
  objc_storeStrong((id *)&self->_optionsProvider, 0);
  objc_storeStrong((id *)&self->_intentSlotDescription, 0);
  objc_storeStrong((id *)&self->_intent, 0);

  objc_storeStrong((id *)&self->_result, 0);
}

- (void)setReturnBlock:(id)a3
{
}

- (id)returnBlock
{
  return self->_returnBlock;
}

- (INIntentParameterOptionsProviding)optionsProvider
{
  return self->_optionsProvider;
}

- (INIntentSlotDescription)intentSlotDescription
{
  return self->_intentSlotDescription;
}

- (INIntent)intent
{
  return self->_intent;
}

- (INIntentResolutionResultDataProviding)result
{
  return self->_result;
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)start
{
  self->_executing = 1;
  v3 = [(INResolutionResultTransformationOperation *)self result];
  v4 = [(INResolutionResultTransformationOperation *)self intent];
  v5 = [(INResolutionResultTransformationOperation *)self intentSlotDescription];
  v6 = [(INResolutionResultTransformationOperation *)self optionsProvider];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__INResolutionResultTransformationOperation_start__block_invoke;
  v7[3] = &unk_1E551C690;
  v7[4] = self;
  [v3 transformResolutionResultForIntent:v4 intentSlotDescription:v5 withOptionsProvider:v6 completion:v7];
}

void __50__INResolutionResultTransformationOperation_start__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  [*(id *)(a1 + 32) willChangeValueForKey:@"executing"];
  *(unsigned char *)(*(void *)(a1 + 32) + 249) = 0;
  [*(id *)(a1 + 32) didChangeValueForKey:@"executing"];
  v3 = [*(id *)(a1 + 32) returnBlock];

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) returnBlock];
    ((void (**)(void, id))v4)[2](v4, v7);
  }
  [*(id *)(a1 + 32) willChangeValueForKey:@"finished"];
  *(unsigned char *)(*(void *)(a1 + 32) + 248) = 1;
  [*(id *)(a1 + 32) didChangeValueForKey:@"finished"];
  v5 = [*(id *)(a1 + 32) completionBlock];

  if (v5)
  {
    v6 = [*(id *)(a1 + 32) completionBlock];
    v6[2]();
  }
}

- (INResolutionResultTransformationOperation)initWithResult:(id)a3 intent:(id)a4 intentSlotDescription:(id)a5 optionsProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)INResolutionResultTransformationOperation;
  v15 = [(INResolutionResultTransformationOperation *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_result, a3);
    objc_storeStrong((id *)&v16->_intent, a4);
    objc_storeStrong((id *)&v16->_intentSlotDescription, a5);
    objc_storeStrong((id *)&v16->_optionsProvider, a6);
  }

  return v16;
}

@end