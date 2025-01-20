@interface CRNBlockScrollTestParameters
- (CRNBlockScrollTestParameters)initWithTestName:(id)a3 withComposerBlock:(id)a4;
- (CRNBlockScrollTestParameters)initWithTestName:(id)a3 withComposerBlock:(id)a4 completionHandler:(id)a5;
- (NSString)testName;
- (RCPSyntheticEventStream)eventStream;
- (id)completionHandler;
- (id)composerBlock;
- (void)setCompletionHandler:(id)a3;
- (void)setComposerBlock:(id)a3;
- (void)setTestName:(id)a3;
@end

@implementation CRNBlockScrollTestParameters

- (CRNBlockScrollTestParameters)initWithTestName:(id)a3 withComposerBlock:(id)a4
{
  return [(CRNBlockScrollTestParameters *)self initWithTestName:a3 withComposerBlock:a4 completionHandler:0];
}

- (CRNBlockScrollTestParameters)initWithTestName:(id)a3 withComposerBlock:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CRNBlockScrollTestParameters;
  v12 = [(CRNBlockScrollTestParameters *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_testName, a3);
    uint64_t v14 = MEMORY[0x237E0E480](v10);
    id composerBlock = v13->_composerBlock;
    v13->_id composerBlock = (id)v14;

    uint64_t v16 = MEMORY[0x237E0E480](v11);
    id completionHandler = v13->_completionHandler;
    v13->_id completionHandler = (id)v16;
  }
  return v13;
}

- (RCPSyntheticEventStream)eventStream
{
  if (RecapLibraryCore_3())
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x2050000000;
    v3 = (void *)getRCPSyntheticEventStreamClass_softClass_3;
    uint64_t v12 = getRCPSyntheticEventStreamClass_softClass_3;
    if (!getRCPSyntheticEventStreamClass_softClass_3)
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __getRCPSyntheticEventStreamClass_block_invoke_3;
      v8[3] = &unk_264CC1198;
      v8[4] = &v9;
      __getRCPSyntheticEventStreamClass_block_invoke_3((uint64_t)v8);
      v3 = (void *)v10[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v9, 8);
    v5 = [(CRNBlockScrollTestParameters *)self composerBlock];
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
  v2 = (void *)MEMORY[0x237E0E480](self->_composerBlock, a2);
  return v2;
}

- (NSString)testName
{
  return self->_testName;
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

- (void)setComposerBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_composerBlock, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_testName, 0);
}

@end