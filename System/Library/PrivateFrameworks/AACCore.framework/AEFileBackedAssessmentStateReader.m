@interface AEFileBackedAssessmentStateReader
- (AEFileBackedAssessmentStateReader)initWithSystemNotificationPrimitives:(id)a3 fileSystemPrimitives:(id)a4 assessmentFileURL:(id)a5 queue:(id)a6;
- (BOOL)isActive;
- (uint64_t)isAssessmentStateActive;
- (void)beginObserving;
- (void)dealloc;
- (void)endObserving;
- (void)setActive:(BOOL)a3;
- (void)updateForLatestAssessmentState;
@end

@implementation AEFileBackedAssessmentStateReader

- (void)dealloc
{
  -[AEFileBackedAssessmentStateReader endObserving]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)AEFileBackedAssessmentStateReader;
  [(AEFileBackedAssessmentStateReader *)&v3 dealloc];
}

- (void)endObserving
{
  if (a1)
  {
    [*(id *)(a1 + 48) invalidate];
    v2 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;
  }
}

- (AEFileBackedAssessmentStateReader)initWithSystemNotificationPrimitives:(id)a3 fileSystemPrimitives:(id)a4 assessmentFileURL:(id)a5 queue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)AEFileBackedAssessmentStateReader;
  v15 = [(AEFileBackedAssessmentStateReader *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_systemNotificationPrimitives, a3);
    objc_storeStrong((id *)&v16->_fileSystemPrimitives, a4);
    objc_storeStrong((id *)&v16->_assessmentFileURL, a5);
    objc_storeStrong((id *)&v16->_queue, a6);
  }
  -[AEFileBackedAssessmentStateReader beginObserving]((id *)&v16->super.isa);
  -[AEFileBackedAssessmentStateReader updateForLatestAssessmentState](v16);

  return v16;
}

- (void)beginObserving
{
  if (val)
  {
    objc_initWeak(&location, val);
    id v2 = val[3];
    id v3 = val[5];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __51__AEFileBackedAssessmentStateReader_beginObserving__block_invoke;
    v6[3] = &unk_264EA37A8;
    objc_copyWeak(&v7, &location);
    uint64_t v4 = [v2 observeSystemNotificationWithName:@"AssessmentStateDidChange" onQueue:v3 withHandler:v6];
    id v5 = val[6];
    val[6] = (id)v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)updateForLatestAssessmentState
{
  if (result)
  {
    v1 = result;
    int v2 = [result isActive];
    result = (void *)-[AEFileBackedAssessmentStateReader isAssessmentStateActive]((uint64_t)v1);
    if (v2 != result)
    {
      return (void *)[v1 setActive:result];
    }
  }
  return result;
}

void __51__AEFileBackedAssessmentStateReader_beginObserving__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[AEFileBackedAssessmentStateReader updateForLatestAssessmentState](WeakRetained);
}

- (uint64_t)isAssessmentStateActive
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 16);
    id v2 = *(id *)(result + 32);
    uint64_t v3 = [v2 fileExistsAtURL:v1];

    return v3;
  }
  return result;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateChangeNotificationObservation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_fileSystemPrimitives, 0);
  objc_storeStrong((id *)&self->_systemNotificationPrimitives, 0);
  objc_storeStrong((id *)&self->_assessmentFileURL, 0);
}

@end