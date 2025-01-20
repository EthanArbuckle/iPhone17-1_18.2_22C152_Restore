@interface CAMPerformanceTestPlan
- (BOOL)_hasTriggeredTestStart;
- (BOOL)isRunningTest;
- (CAMPerformanceTestPlan)initWithTestName:(id)a3;
- (NSMutableArray)_harnesses;
- (NSString)testName;
- (id)_findHarnessAfter:(id)a3;
- (id)completionHandler;
- (id)startHandler;
- (unint64_t)_completedHarnesses;
- (unint64_t)_startedHarnesses;
- (unsigned)settlingDelaySeconds;
- (void)_failedTestWithReason:(id)a3;
- (void)_runHarnessAfter:(id)a3;
- (void)_startTesting;
- (void)_stopTesting;
- (void)didFailTestHarness:(id)a3 withReason:(id)a4;
- (void)didStartSubtest:(id)a3 withName:(id)a4 withMetrics:(id)a5;
- (void)didStopSubtest:(id)a3 withName:(id)a4;
- (void)queueHarness:(id)a3;
- (void)run;
- (void)runHarness:(id)a3;
- (void)runWithSecondsDelay:(unint64_t)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setSettlingDelaySeconds:(unsigned int)a3;
- (void)setStartHandler:(id)a3;
- (void)set_completedHarnesses:(unint64_t)a3;
- (void)set_harnesses:(id)a3;
- (void)set_hasTriggeredTestStart:(BOOL)a3;
- (void)set_startedHarnesses:(unint64_t)a3;
- (void)startSubtestWithName:(id)a3 withMetrics:(id)a4;
- (void)stopSubtestWithName:(id)a3;
- (void)willEndTestHarness:(id)a3;
- (void)willStartTestHarness:(id)a3;
@end

@implementation CAMPerformanceTestPlan

- (CAMPerformanceTestPlan)initWithTestName:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CAMPerformanceTestPlan;
  v5 = [(CAMPerformanceTestPlan *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    testName = v5->_testName;
    v5->_testName = (NSString *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    harnesses = v5->__harnesses;
    v5->__harnesses = v8;

    v10 = v5;
  }

  return v5;
}

- (void)queueHarness:(id)a3
{
  id v5 = a3;
  id v4 = [(CAMPerformanceTestPlan *)self _harnesses];
  [v4 addObject:v5];

  [v5 setDelegate:self];
}

- (void)run
{
}

- (void)runWithSecondsDelay:(unint64_t)a3
{
  if (a3)
  {
    dispatch_time_t v4 = dispatch_time(0, 1000000000 * a3);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__CAMPerformanceTestPlan_runWithSecondsDelay___block_invoke;
    block[3] = &unk_263FA0208;
    block[4] = self;
    dispatch_after(v4, MEMORY[0x263EF83A0], block);
  }
  else
  {
    -[CAMPerformanceTestPlan _runHarnessAfter:](self, "_runHarnessAfter:");
  }
}

uint64_t __46__CAMPerformanceTestPlan_runWithSecondsDelay___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runHarnessAfter:0];
}

- (void)runHarness:(id)a3
{
  id v3 = a3;
  if (([v3 isRunningTest] & 1) == 0) {
    [v3 startTesting];
  }
}

- (void)_startTesting
{
  id v6 = [(CAMPerformanceTestPlan *)self testName];
  id v3 = [MEMORY[0x263F82438] sharedApplication];
  [v3 startedTest:v6];

  uint64_t v4 = [(CAMPerformanceTestPlan *)self startHandler];
  id v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
}

- (void)_stopTesting
{
  id v3 = [MEMORY[0x263F82438] sharedApplication];
  testName = self->_testName;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__CAMPerformanceTestPlan__stopTesting__block_invoke;
  v5[3] = &unk_263FA0208;
  v5[4] = self;
  [v3 finishedTest:testName extraResults:0 withTeardownBlock:v5];
}

void __38__CAMPerformanceTestPlan__stopTesting__block_invoke(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) completionHandler];
  if ([*(id *)(a1 + 32) settlingDelaySeconds]) {
    sleep([*(id *)(a1 + 32) settlingDelaySeconds]);
  }
  v2 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    v2 = (void *)v3;
  }
}

- (void)_failedTestWithReason:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F82438];
  id v5 = a3;
  id v7 = [v4 sharedApplication];
  id v6 = [(CAMPerformanceTestPlan *)self testName];
  [v7 failedTest:v6 withFailure:v5];
}

- (void)_runHarnessAfter:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4)
  {
    id v5 = [(CAMPerformanceTestPlan *)self _findHarnessAfter:v4];
    if (!v5) {
      goto LABEL_7;
    }
  }
  else
  {
    id v6 = [(CAMPerformanceTestPlan *)self _harnesses];
    id v5 = [v6 firstObject];

    if (!v5) {
      goto LABEL_7;
    }
  }
  if (([v5 isRunningTest] & 1) == 0) {
    [v5 startTesting];
  }
LABEL_7:
}

- (id)_findHarnessAfter:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMPerformanceTestPlan *)self _harnesses];
  unint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL
    || ([(CAMPerformanceTestPlan *)self _harnesses],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unint64_t v8 = [v7 count] - 1,
        v7,
        v6 >= v8))
  {
    v10 = 0;
  }
  else
  {
    v9 = [(CAMPerformanceTestPlan *)self _harnesses];
    v10 = [v9 objectAtIndexedSubscript:v6 + 1];
  }
  return v10;
}

- (void)startSubtestWithName:(id)a3 withMetrics:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(CAMPerformanceTestPlan *)self testName];
  unint64_t v8 = [MEMORY[0x263F82438] sharedApplication];
  [v8 startedSubTest:v7 forTest:v9 withMetrics:v6];
}

- (void)stopSubtestWithName:(id)a3
{
  id v4 = a3;
  id v6 = [(CAMPerformanceTestPlan *)self testName];
  id v5 = [MEMORY[0x263F82438] sharedApplication];
  [v5 finishedSubTest:v4 forTest:v6];
}

- (void)willStartTestHarness:(id)a3
{
  id v4 = a3;
  if (![(CAMPerformanceTestPlan *)self _hasTriggeredTestStart]
    && ([v4 isSetupHarness] & 1) == 0)
  {
    [(CAMPerformanceTestPlan *)self set_hasTriggeredTestStart:1];
    [(CAMPerformanceTestPlan *)self _startTesting];
  }
  [(CAMPerformanceTestPlan *)self set_startedHarnesses:[(CAMPerformanceTestPlan *)self _startedHarnesses] + 1];
}

- (void)willEndTestHarness:(id)a3
{
  id v7 = a3;
  [(CAMPerformanceTestPlan *)self set_completedHarnesses:[(CAMPerformanceTestPlan *)self _completedHarnesses] + 1];
  unint64_t v4 = [(CAMPerformanceTestPlan *)self _completedHarnesses];
  id v5 = [(CAMPerformanceTestPlan *)self _harnesses];
  unint64_t v6 = [v5 count];

  if (v4 >= v6)
  {
    if ([(CAMPerformanceTestPlan *)self _hasTriggeredTestStart]) {
      [(CAMPerformanceTestPlan *)self _stopTesting];
    }
  }
  else
  {
    [(CAMPerformanceTestPlan *)self _runHarnessAfter:v7];
  }
}

- (void)didFailTestHarness:(id)a3 withReason:(id)a4
{
}

- (void)didStartSubtest:(id)a3 withName:(id)a4 withMetrics:(id)a5
{
}

- (void)didStopSubtest:(id)a3 withName:(id)a4
{
}

- (BOOL)isRunningTest
{
  return self->_runningTest;
}

- (id)startHandler
{
  return self->_startHandler;
}

- (void)setStartHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSString)testName
{
  return self->_testName;
}

- (unsigned)settlingDelaySeconds
{
  return self->_settlingDelaySeconds;
}

- (void)setSettlingDelaySeconds:(unsigned int)a3
{
  self->_settlingDelaySeconds = a3;
}

- (NSMutableArray)_harnesses
{
  return self->__harnesses;
}

- (void)set_harnesses:(id)a3
{
}

- (unint64_t)_completedHarnesses
{
  return self->__completedHarnesses;
}

- (void)set_completedHarnesses:(unint64_t)a3
{
  self->__completedHarnesses = a3;
}

- (unint64_t)_startedHarnesses
{
  return self->__startedHarnesses;
}

- (void)set_startedHarnesses:(unint64_t)a3
{
  self->__startedHarnesses = a3;
}

- (BOOL)_hasTriggeredTestStart
{
  return self->__hasTriggeredTestStart;
}

- (void)set_hasTriggeredTestStart:(BOOL)a3
{
  self->__hasTriggeredTestStart = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__harnesses, 0);
  objc_storeStrong((id *)&self->_testName, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_startHandler, 0);
}

@end