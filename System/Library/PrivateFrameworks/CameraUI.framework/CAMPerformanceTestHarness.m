@interface CAMPerformanceTestHarness
- (BOOL)isRunningTest;
- (BOOL)isSetupHarness;
- (CAMPerformanceTestHarness)initWithTestName:(id)a3;
- (CAMPerformanceTestHarnessDelegate)delegate;
- (NSString)testName;
- (id)completionHandler;
- (id)startHandler;
- (void)failedTestWithReason:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsSetupHarness:(BOOL)a3;
- (void)setRunningTest:(BOOL)a3;
- (void)setStartHandler:(id)a3;
- (void)startSubtestWithName:(id)a3;
- (void)startSubtestWithName:(id)a3 withMetrics:(id)a4;
- (void)startTesting;
- (void)stopSubtestWithName:(id)a3;
- (void)stopTesting;
@end

@implementation CAMPerformanceTestHarness

- (CAMPerformanceTestHarness)initWithTestName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMPerformanceTestHarness;
  v5 = [(CAMPerformanceTestHarness *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    testName = v5->_testName;
    v5->_testName = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)startTesting
{
  [(CAMPerformanceTestHarness *)self setRunningTest:1];
  v3 = [(CAMPerformanceTestHarness *)self delegate];
  [v3 willStartTestHarness:self];

  id v4 = [(CAMPerformanceTestHarness *)self startHandler];
  if (v4)
  {
    v5 = v4;
    v4[2]();
    id v4 = v5;
  }
}

- (void)stopTesting
{
  [(CAMPerformanceTestHarness *)self setRunningTest:0];
  v3 = [(CAMPerformanceTestHarness *)self delegate];
  [v3 willEndTestHarness:self];

  id v4 = [(CAMPerformanceTestHarness *)self completionHandler];
  if (v4)
  {
    v5 = v4;
    v4[2]();
    id v4 = v5;
  }
}

- (void)failedTestWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMPerformanceTestHarness *)self delegate];
  [v5 didFailTestHarness:self withReason:v4];
}

- (void)startSubtestWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMPerformanceTestHarness *)self delegate];
  [v5 didStartSubtest:self withName:v4 withMetrics:0];
}

- (void)startSubtestWithName:(id)a3 withMetrics:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CAMPerformanceTestHarness *)self delegate];
  [v8 didStartSubtest:self withName:v7 withMetrics:v6];
}

- (void)stopSubtestWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMPerformanceTestHarness *)self delegate];
  [v5 didStopSubtest:self withName:v4];
}

- (NSString)testName
{
  return self->_testName;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)startHandler
{
  return self->_startHandler;
}

- (void)setStartHandler:(id)a3
{
}

- (CAMPerformanceTestHarnessDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMPerformanceTestHarnessDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isSetupHarness
{
  return self->_isSetupHarness;
}

- (void)setIsSetupHarness:(BOOL)a3
{
  self->_isSetupHarness = a3;
}

- (BOOL)isRunningTest
{
  return self->_runningTest;
}

- (void)setRunningTest:(BOOL)a3
{
  self->_runningTest = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_startHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_testName, 0);
}

@end