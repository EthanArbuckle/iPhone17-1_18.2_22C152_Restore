@interface AEAccessibilityServerBackedAssessmentStateReader
- (AEAccessibilityServerBackedAssessmentStateReader)initWithAccessibilityServerPrimitives:(id)a3 queue:(id)a4;
- (BOOL)isActive;
- (id)updateForLatestAssessmentState;
- (void)beginObserving;
- (void)dealloc;
- (void)endObserving;
- (void)setActive:(BOOL)a3;
@end

@implementation AEAccessibilityServerBackedAssessmentStateReader

- (void)dealloc
{
  -[AEAccessibilityServerBackedAssessmentStateReader endObserving]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)AEAccessibilityServerBackedAssessmentStateReader;
  [(AEAccessibilityServerBackedAssessmentStateReader *)&v3 dealloc];
}

- (void)endObserving
{
  if (a1)
  {
    [*(id *)(a1 + 32) invalidate];
    v2 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;
  }
}

- (AEAccessibilityServerBackedAssessmentStateReader)initWithAccessibilityServerPrimitives:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AEAccessibilityServerBackedAssessmentStateReader;
  v9 = [(AEAccessibilityServerBackedAssessmentStateReader *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessibilityServerPrimitives, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
  }
  -[AEAccessibilityServerBackedAssessmentStateReader beginObserving]((id *)&v10->super.isa);
  -[AEAccessibilityServerBackedAssessmentStateReader updateForLatestAssessmentState]((id *)&v10->super.isa);

  return v10;
}

- (void)beginObserving
{
  if (val)
  {
    objc_initWeak(&location, val);
    id v2 = val[2];
    id v3 = val[3];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __66__AEAccessibilityServerBackedAssessmentStateReader_beginObserving__block_invoke;
    v6[3] = &unk_264EA37A8;
    objc_copyWeak(&v7, &location);
    uint64_t v4 = [v2 observeGuidedAccessActiveStateChangeOnQueue:v3 withHandler:v6];
    id v5 = val[4];
    val[4] = (id)v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (id)updateForLatestAssessmentState
{
  if (result)
  {
    v1 = result;
    int v2 = [result isActive];
    result = (id *)[v1[2] isRestrictedForAAC];
    if (v2 != result)
    {
      return (id *)[v1 setActive:result];
    }
  }
  return result;
}

void __66__AEAccessibilityServerBackedAssessmentStateReader_beginObserving__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  -[AEAccessibilityServerBackedAssessmentStateReader updateForLatestAssessmentState](WeakRetained);
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
  objc_storeStrong((id *)&self->_guidedAccessActiveStateChangeObservation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_accessibilityServerPrimitives, 0);
}

@end