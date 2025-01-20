@interface DMCEnrollmentFlowControllerBase
- (DMCEnrollmentFlowControllerBase)init;
- (DMCHangDetectionQueue)workerQueue;
- (NSMutableArray)stepQueue;
- (unint64_t)currentStep;
- (unint64_t)nextStepIndex;
- (void)_appendSteps:(id)a3;
- (void)_jumpToStep:(unint64_t)a3;
- (void)_pollNextStep;
- (void)_resetToInitialSteps;
- (void)setCurrentStep:(unint64_t)a3;
- (void)setNextStepIndex:(unint64_t)a3;
- (void)setStepQueue:(id)a3;
- (void)setWorkerQueue:(id)a3;
@end

@implementation DMCEnrollmentFlowControllerBase

- (DMCEnrollmentFlowControllerBase)init
{
  v13.receiver = self;
  v13.super_class = (Class)DMCEnrollmentFlowControllerBase;
  v2 = [(DMCEnrollmentFlowControllerBase *)&v13 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    stepQueue = v2->_stepQueue;
    v2->_stepQueue = (NSMutableArray *)v3;

    id v5 = objc_alloc(MEMORY[0x263F38B80]);
    [MEMORY[0x263F38B70] enrollmentStepTimeoutThresholdWithDefaultValue:10.0];
    double v7 = v6;
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    uint64_t v10 = [v5 initWithQoS:25 hangThreshold:v9 owner:v7];
    workerQueue = v2->_workerQueue;
    v2->_workerQueue = (DMCHangDetectionQueue *)v10;

    [(DMCHangDetectionQueue *)v2->_workerQueue setShouldDumpStackshot:1];
  }
  return v2;
}

- (void)_appendSteps:(id)a3
{
  id v4 = a3;
  id v5 = [(DMCEnrollmentFlowControllerBase *)self workerQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__DMCEnrollmentFlowControllerBase__appendSteps___block_invoke;
  v7[3] = &unk_264778CD8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 queueBlock:v7];
}

void __48__DMCEnrollmentFlowControllerBase__appendSteps___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) stepQueue];
  [v2 addObjectsFromArray:*(void *)(a1 + 40)];
}

- (void)_pollNextStep
{
  uint64_t v3 = [(DMCEnrollmentFlowControllerBase *)self workerQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__DMCEnrollmentFlowControllerBase__pollNextStep__block_invoke;
  v4[3] = &unk_2647785B0;
  v4[4] = self;
  [v3 queueBlock:v4];
}

uint64_t __48__DMCEnrollmentFlowControllerBase__pollNextStep__block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) nextStepIndex];
  uint64_t v3 = [*(id *)(a1 + 32) stepQueue];
  unint64_t v4 = [v3 count];

  id v5 = *(void **)(a1 + 32);
  if (v2 >= v4)
  {
    return objc_msgSend(v5, "_workerQueue_flowCompleted");
  }
  else
  {
    id v6 = [v5 stepQueue];
    double v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "nextStepIndex"));
    uint64_t v8 = [v7 integerValue];

    objc_msgSend(*(id *)(a1 + 32), "setNextStepIndex:", objc_msgSend(*(id *)(a1 + 32), "nextStepIndex") + 1);
    v9 = *(void **)(a1 + 32);
    return objc_msgSend(v9, "_workerQueue_performFlowStep:", v8);
  }
}

- (void)_resetToInitialSteps
{
  uint64_t v3 = [(DMCEnrollmentFlowControllerBase *)self workerQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__DMCEnrollmentFlowControllerBase__resetToInitialSteps__block_invoke;
  v4[3] = &unk_2647785B0;
  v4[4] = self;
  [v3 queueBlock:v4];
}

uint64_t __55__DMCEnrollmentFlowControllerBase__resetToInitialSteps__block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) stepQueue];
  [v2 removeAllObjects];

  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 setNextStepIndex:0];
}

- (void)_jumpToStep:(unint64_t)a3
{
  id v5 = [(DMCEnrollmentFlowControllerBase *)self workerQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__DMCEnrollmentFlowControllerBase__jumpToStep___block_invoke;
  v6[3] = &unk_264779098;
  v6[4] = self;
  v6[5] = a3;
  [v5 queueBlock:v6];
}

uint64_t __47__DMCEnrollmentFlowControllerBase__jumpToStep___block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) stepQueue];
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  uint64_t v4 = [v2 indexOfObject:v3];

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = [*(id *)(a1 + 32) stepQueue];
    uint64_t v4 = [v5 count];

    id v6 = [*(id *)(a1 + 32) stepQueue];
    double v7 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
    [v6 addObject:v7];
  }
  uint64_t v8 = *(void **)(a1 + 32);
  return [v8 setNextStepIndex:v4];
}

- (DMCHangDetectionQueue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
}

- (unint64_t)currentStep
{
  return self->_currentStep;
}

- (void)setCurrentStep:(unint64_t)a3
{
  self->_currentStep = a3;
}

- (unint64_t)nextStepIndex
{
  return self->_nextStepIndex;
}

- (void)setNextStepIndex:(unint64_t)a3
{
  self->_nextStepIndex = a3;
}

- (NSMutableArray)stepQueue
{
  return self->_stepQueue;
}

- (void)setStepQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepQueue, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
}

@end