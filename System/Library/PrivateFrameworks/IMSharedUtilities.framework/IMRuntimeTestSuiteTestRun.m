@interface IMRuntimeTestSuiteTestRun
- (IMRuntimeTestSuiteTestRun)init;
- (NSArray)testRuns;
- (void)addTestRun:(id)a3;
@end

@implementation IMRuntimeTestSuiteTestRun

- (IMRuntimeTestSuiteTestRun)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMRuntimeTestSuiteTestRun;
  v2 = [(IMRuntimeTestSuiteTestRun *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    testRuns = v2->_testRuns;
    v2->_testRuns = v3;
  }
  return v2;
}

- (void)addTestRun:(id)a3
{
}

- (NSArray)testRuns
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testRun, 0);

  objc_storeStrong((id *)&self->_testRuns, 0);
}

@end