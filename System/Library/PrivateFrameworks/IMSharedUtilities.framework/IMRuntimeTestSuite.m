@interface IMRuntimeTestSuite
+ (void)runTestsIfNeededWithRepeatCount:(int64_t)a3;
+ (void)runTestsIfNeededWithRepeatCount:(int64_t)a3 withCount:(int64_t)a4;
- (IMRuntimeTest)currentTest;
- (IMRuntimeTestSuite)init;
- (NSArray)tests;
- (NSMutableArray)runningTests;
- (NSTimer)timer;
- (double)testStartDelay;
- (double)testSuiteStartDelay;
- (void)_cancelTimer;
- (void)_startNextTest;
- (void)_timerExpired:(id)a3;
- (void)addTest:(id)a3;
- (void)currentTestDidFinish;
- (void)removeTest:(id)a3;
- (void)setCurrentTest:(id)a3;
- (void)setRunningTests:(id)a3;
- (void)setTestStartDelay:(double)a3;
- (void)setTestSuiteStartDelay:(double)a3;
- (void)setTests:(id)a3;
- (void)setTimer:(id)a3;
- (void)startTest;
@end

@implementation IMRuntimeTestSuite

- (IMRuntimeTestSuite)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMRuntimeTestSuite;
  v2 = [(IMRuntimeTestSuite *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    tests = v2->_tests;
    v2->_tests = v3;
  }
  return v2;
}

- (void)addTest:(id)a3
{
  id v5 = a3;
  v4 = [v5 testName];
  [(IMRuntimeTest *)self testLog:@"added test: %@", v4];

  [(NSMutableArray *)self->_tests addObject:v5];
}

- (void)removeTest:(id)a3
{
  id v5 = a3;
  v4 = [v5 testName];
  [(IMRuntimeTest *)self testLog:@"removed test: %@", v4];

  [(NSMutableArray *)self->_tests removeObject:v5];
}

- (void)startTest
{
  [(IMRuntimeTest *)self testLog:@"starting test suite"];
  v3 = (NSMutableArray *)[(NSMutableArray *)self->_tests mutableCopy];
  runningTests = self->_runningTests;
  self->_runningTests = v3;

  MEMORY[0x1F4181798](self, sel_currentTestDidFinish);
}

- (void)_cancelTimer
{
  v3 = [(IMRuntimeTestSuite *)self timer];
  if (v3)
  {
    id v4 = v3;
    [v3 invalidate];
    [(IMRuntimeTestSuite *)self setTimer:0];
    v3 = v4;
  }
}

- (void)_startNextTest
{
  v3 = [(NSMutableArray *)self->_runningTests objectAtIndex:0];
  currentTest = self->_currentTest;
  self->_currentTest = v3;

  id v5 = [(IMRuntimeTest *)self->_currentTest testName];
  [(IMRuntimeTest *)self testLog:@"starting next test in suite: %@", v5];

  [(NSMutableArray *)self->_runningTests removeObjectAtIndex:0];
  objc_super v6 = self->_currentTest;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1A08169F4;
  v7[3] = &unk_1E5A12B90;
  v7[4] = self;
  [(IMRuntimeTest *)v6 runTest:v7];
}

- (void)_timerExpired:(id)a3
{
}

- (void)currentTestDidFinish
{
  v3 = [(IMRuntimeTest *)self->_currentTest testName];
  [(IMRuntimeTest *)self testLog:@"current test in test suite did finish: %@", v3];

  if ([(NSMutableArray *)self->_tests count] && [(NSMutableArray *)self->_runningTests count])
  {
    [(IMRuntimeTestSuite *)self _cancelTimer];
    id v4 = (void *)MEMORY[0x1E4F1CB00];
    [(IMRuntimeTestSuite *)self testStartDelay];
    objc_msgSend(v4, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__timerExpired_, 0, 0);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(IMRuntimeTestSuite *)self setTimer:v5];
  }
  else
  {
    MEMORY[0x1F4181798](self, sel_finishTest);
  }
}

+ (void)runTestsIfNeededWithRepeatCount:(int64_t)a3 withCount:(int64_t)a4
{
  if (a4 >= a3)
  {
    [a1 testLog:@"Not repeating tests, all done"];
  }
  else
  {
    id v7 = objc_alloc_init((Class)objc_opt_class());
    [v7 testSuiteStartDelay];
    objc_msgSend(a1, "testLog:", @"running test batch %ld of %ld in %f seconds", a4, a3, v8);
    [v7 testSuiteStartDelay];
    dispatch_time_t v10 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A0816C40;
    block[3] = &unk_1E5A12BD8;
    int64_t v15 = a4;
    int64_t v16 = a3;
    id v13 = v7;
    id v14 = a1;
    id v11 = v7;
    dispatch_after(v10, MEMORY[0x1E4F14428], block);
  }
}

+ (void)runTestsIfNeededWithRepeatCount:(int64_t)a3
{
}

- (NSArray)tests
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTests:(id)a3
{
}

- (double)testSuiteStartDelay
{
  return self->_testSuiteStartDelay;
}

- (void)setTestSuiteStartDelay:(double)a3
{
  self->_testSuiteStartDelay = a3;
}

- (double)testStartDelay
{
  return self->_testStartDelay;
}

- (void)setTestStartDelay:(double)a3
{
  self->_testStartDelay = a3;
}

- (NSMutableArray)runningTests
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRunningTests:(id)a3
{
}

- (IMRuntimeTest)currentTest
{
  return (IMRuntimeTest *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCurrentTest:(id)a3
{
}

- (NSTimer)timer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_timer);

  return (NSTimer *)WeakRetained;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_timer);
  objc_storeStrong((id *)&self->_currentTest, 0);
  objc_storeStrong((id *)&self->_runningTests, 0);

  objc_storeStrong((id *)&self->_tests, 0);
}

@end