@interface CRNGroupScrollTestParameters
+ (id)parametersByCombining:(id)a3 testName:(id)a4 completionHandler:(id)a5;
- (CRNGroupScrollTestParameters)initWithTestName:(id)a3 withParameters:(id)a4 completionHandler:(id)a5;
- (NSArray)parameters;
- (NSString)testName;
- (RCPSyntheticEventStream)eventStream;
- (id)completionHandler;
- (id)composerBlock;
- (void)setCompletionHandler:(id)a3;
- (void)setParameters:(id)a3;
- (void)setTestName:(id)a3;
@end

@implementation CRNGroupScrollTestParameters

- (CRNGroupScrollTestParameters)initWithTestName:(id)a3 withParameters:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)CRNGroupScrollTestParameters;
  v9 = [(CRNGroupScrollTestParameters *)&v12 init];
  v10 = v9;
  if (v9)
  {
    [(CRNGroupScrollTestParameters *)v9 setParameters:v7];
    [(CRNGroupScrollTestParameters *)v10 setCompletionHandler:v8];
  }

  return v10;
}

- (void)setParameters:(id)a3
{
}

+ (id)parametersByCombining:(id)a3 testName:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[CRNGroupScrollTestParameters alloc] initWithTestName:v8 withParameters:v9 completionHandler:v7];

  return v10;
}

- (RCPSyntheticEventStream)eventStream
{
  if (RecapLibraryCore_0())
  {
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x2050000000;
    v3 = (void *)getRCPSyntheticEventStreamClass_softClass_0;
    uint64_t v12 = getRCPSyntheticEventStreamClass_softClass_0;
    if (!getRCPSyntheticEventStreamClass_softClass_0)
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __getRCPSyntheticEventStreamClass_block_invoke_0;
      v8[3] = &unk_264CC1198;
      v8[4] = &v9;
      __getRCPSyntheticEventStreamClass_block_invoke_0((uint64_t)v8);
      v3 = (void *)v10[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v9, 8);
    v5 = [(CRNGroupScrollTestParameters *)self composerBlock];
    v6 = [v4 eventStreamWithEventActions:v5];
  }
  else
  {
    v6 = 0;
  }
  return (RCPSyntheticEventStream *)v6;
}

- (id)composerBlock
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__CRNGroupScrollTestParameters_composerBlock__block_invoke;
  v4[3] = &unk_264CC11C0;
  v4[4] = self;
  v2 = (void *)MEMORY[0x237E0E480](v4, a2);
  return v2;
}

void __45__CRNGroupScrollTestParameters_composerBlock__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "parameters", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) composerBlock];
        ((void (**)(void, id))v9)[2](v9, v3);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (NSString)testName
{
  return self->testName;
}

- (void)setTestName:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->testName, 0);
}

@end