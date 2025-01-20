@interface IMUnitTestRunner
- (BOOL)_loadFrameworksIfNeeded:(id *)a3;
- (IMUnitTestBundleLoader)bundleLoader;
- (IMUnitTestFrameworkLoader)frameworkLoader;
- (IMUnitTestLogger)logger;
- (IMUnitTestRunner)init;
- (IMUnitTestRunner)initWithLogger:(id)a3 bundleLoader:(id)a4;
- (IMUnitTestRunner)initWithLogger:(id)a3 bundleLoader:(id)a4 frameworkLoader:(id)a5;
- (IMUnitTestRunnerDelegate)delegate;
- (NSArray)failedTests;
- (id)dateFormatter;
- (id)descriptionFromResult:(id)a3;
- (id)pathToPluginBundle:(id)a3;
- (id)runTestsInBundleAtPath:(id)a3 error:(id *)a4;
- (id)runTestsInBundleNamed:(id)a3 error:(id *)a4;
- (int64_t)runTestsInBundleAtPath:(id)a3;
- (void)log:(id)a3;
- (void)logBanner:(id)a3;
- (void)setDelegate:(id)a3;
- (void)testCase:(id)a3 didFailWithDescription:(id)a4 inFile:(id)a5 atLine:(unint64_t)a6;
- (void)testCaseDidFinish:(id)a3;
- (void)testCaseWillStart:(id)a3;
- (void)testLogWithFormat:(id)a3;
- (void)testSuite:(id)a3 didFailWithDescription:(id)a4 inFile:(id)a5 atLine:(unint64_t)a6;
- (void)testSuiteDidFinish:(id)a3;
- (void)testSuiteWillStart:(id)a3;
@end

@implementation IMUnitTestRunner

- (IMUnitTestRunner)initWithLogger:(id)a3 bundleLoader:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMUnitTestRunner;
  v9 = [(IMUnitTestRunner *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_logger, a3);
    objc_storeStrong((id *)&v10->_bundleLoader, a4);
  }

  return v10;
}

- (IMUnitTestRunner)initWithLogger:(id)a3 bundleLoader:(id)a4 frameworkLoader:(id)a5
{
  id v9 = a5;
  v10 = [(IMUnitTestRunner *)self initWithLogger:a3 bundleLoader:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_frameworkLoader, a5);
  }

  return v11;
}

- (IMUnitTestRunner)init
{
  v3 = objc_alloc_init(IMUnitTestLogger);
  v4 = [[IMUnitTestBundleLoader alloc] initWithLogger:v3];
  v5 = [[IMUnitTestFrameworkLoader alloc] initWithLogger:v3 bundleLoader:v4];
  v6 = [(IMUnitTestRunner *)self initWithLogger:v3 bundleLoader:v4 frameworkLoader:v5];

  return v6;
}

- (void)testLogWithFormat:(id)a3
{
  v4 = (objc_class *)NSString;
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v10];

  id v7 = [(IMUnitTestRunner *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(IMUnitTestRunner *)self delegate];
    [v9 unitTestRunner:self didReceiveOutput:v6];
  }
  else
  {
    id v9 = [(IMUnitTestRunner *)self logger];
    [v9 writeOutputToStdout:v6];
  }
}

- (BOOL)_loadFrameworksIfNeeded:(id *)a3
{
  if (MEMORY[0x1A6227910](@"XCTestSuite", @"/Developer/Library/Frameworks/XCTest.framework"))
  {
    [(IMUnitTestRunner *)self testLogWithFormat:@"XCTest classes already loaded, no need to load frameworks..."];
    return 1;
  }
  else
  {
    v6 = [(IMUnitTestRunner *)self frameworkLoader];

    if (v6)
    {
      [(IMUnitTestRunner *)self testLogWithFormat:@"Attempting to load XCTest frameworks..."];
      id v7 = [(IMUnitTestRunner *)self frameworkLoader];
      id v10 = 0;
      char v5 = [v7 loadTestFrameworks:&v10];
      id v8 = v10;

      if (v5)
      {
        [(IMUnitTestRunner *)self testLogWithFormat:@"Frameworks loaded ok..."];
      }
      else
      {
        if (!v8)
        {
          id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IMUnitTestRunnerErrorDomain" code:1 userInfo:0];
        }
        [(IMUnitTestRunner *)self testLogWithFormat:@"Failed to load test frameworks with error: %@", v8];
        if (a3)
        {
          id v8 = v8;
          *a3 = v8;
        }
      }
    }
    else
    {
      [(IMUnitTestRunner *)self testLogWithFormat:@"Framework loader is nil, unable to proceed"];
      if (a3)
      {
        [MEMORY[0x1E4F28C58] errorWithDomain:@"IMUnitTestRunnerErrorDomain" code:1 userInfo:0];
        char v5 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        return 0;
      }
    }
  }
  return v5;
}

- (id)runTestsInBundleAtPath:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(IMUnitTestRunner *)self testLogWithFormat:@"Starting tests for bundle at path: %@", v6];
  v51[0] = 0;
  BOOL v7 = [(IMUnitTestRunner *)self _loadFrameworksIfNeeded:v51];
  id v8 = v51[0];
  if (v7)
  {
    id v9 = (void *)MEMORY[0x1A6227910](@"XCTestSuite", @"/Developer/Library/Frameworks/XCTest.framework");
    uint64_t v10 = MEMORY[0x1A6227910](@"XCTestObservationCenter", @"/Developer/Library/Frameworks/XCTest.framework");
    if (v9)
    {
      v11 = (void *)v10;
      objc_super v12 = [(IMUnitTestRunner *)self bundleLoader];
      id v50 = v8;
      char v13 = [v12 loadTestBundle:v6 bundle:0 error:&v50];
      id v14 = v50;

      if (v13)
      {
        v15 = [(IMUnitTestRunner *)self delegate];
        char v16 = objc_opt_respondsToSelector();

        if (v16)
        {
          v17 = [(IMUnitTestRunner *)self delegate];
          [v17 unitTestRunner:self willRunTestsInBundleAtPath:v6];
        }
        v45 = [v9 testSuiteForBundlePath:v6];
        if (v45)
        {
          if (v11)
          {
            v18 = [v11 sharedTestObservationCenter];
            [v18 addTestObserver:self];

            v19 = [v45 name];
            [(IMUnitTestRunner *)self testLogWithFormat:@"Starting test suite %@:", v19];

            v20 = [v45 tests];
            -[IMUnitTestRunner testLogWithFormat:](self, "testLogWithFormat:", @"Found %ld tests", [v20 count]);
            long long v48 = 0u;
            long long v49 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            id v21 = v20;
            uint64_t v22 = [v21 countByEnumeratingWithState:&v46 objects:v52 count:16];
            if (v22)
            {
              uint64_t v23 = *(void *)v47;
              do
              {
                for (uint64_t i = 0; i != v22; ++i)
                {
                  if (*(void *)v47 != v23) {
                    objc_enumerationMutation(v21);
                  }
                  v25 = [*(id *)(*((void *)&v46 + 1) + 8 * i) name];
                  [(IMUnitTestRunner *)self testLogWithFormat:@"Test: %@", v25];
                }
                uint64_t v22 = [v21 countByEnumeratingWithState:&v46 objects:v52 count:16];
              }
              while (v22);
            }

            v26 = NSStringFromClass((Class)[v45 testRunClass]);
            [(IMUnitTestRunner *)self testLogWithFormat:@"XCTestSuite testRun class: %@", v26];

            [v45 runTest];
            id v9 = [v45 testRun];
            if (v9)
            {
              v27 = [(IMUnitTestRunner *)self descriptionFromResult:v9];
              [(IMUnitTestRunner *)self testLogWithFormat:@"Finished tests for bundle at path: %@, with result: %@", v6, v27];

              v28 = [(IMUnitTestRunner *)self delegate];
              char v29 = objc_opt_respondsToSelector();

              if (v29)
              {
                v30 = [(IMUnitTestRunner *)self delegate];
                [v30 unitTestRunner:self didRunTestsInBundleAtPath:v6 results:v9];
              }
              id v31 = v9;
            }
            else
            {
              [(IMUnitTestRunner *)self testLogWithFormat:@"XCTest suite returned a nil test run, all tests failed"];
              uint64_t v42 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IMUnitTestRunnerErrorDomain" code:5 userInfo:0];

              id v14 = (id)v42;
            }
          }
          else
          {
            [(IMUnitTestRunner *)self testLogWithFormat:@"XCTestObservationCenter is unavailable, all tests failed."];
            [MEMORY[0x1E4F28C58] errorWithDomain:@"IMUnitTestRunnerErrorDomain" code:2 userInfo:0];
            id v9 = 0;
            id v21 = v14;
            id v14 = (id)objc_claimAutoreleasedReturnValue();
          }

          int v35 = 1;
        }
        else
        {
          int v35 = 0;
        }

LABEL_34:
        id v8 = v14;
        if (!a4) {
          goto LABEL_36;
        }
        goto LABEL_35;
      }
      v39 = [(IMUnitTestRunner *)self delegate];
      char v40 = objc_opt_respondsToSelector();

      if (v40)
      {
        v41 = [(IMUnitTestRunner *)self delegate];
        [v41 unitTestRunner:self runningTestsInBundleAtPath:v6 failedWithError:v14];
      }
    }
    else
    {
      [(IMUnitTestRunner *)self testLogWithFormat:@"XCTest classes not found, tests will not be run"];
      id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IMUnitTestRunnerErrorDomain" code:2 userInfo:0];

      v36 = [(IMUnitTestRunner *)self delegate];
      uint64_t v37 = objc_opt_respondsToSelector();

      if (v37)
      {
        v38 = [(IMUnitTestRunner *)self delegate];
        [v38 unitTestRunner:self runningTestsInBundleAtPath:v6 failedWithError:v14];
      }
    }
    id v9 = 0;
    int v35 = 1;
    goto LABEL_34;
  }
  [(IMUnitTestRunner *)self testLogWithFormat:@"Unable to run tests at path: %@", v6];
  v32 = [(IMUnitTestRunner *)self delegate];
  char v33 = objc_opt_respondsToSelector();

  if (v33)
  {
    v34 = [(IMUnitTestRunner *)self delegate];
    [v34 unitTestRunner:self runningTestsInBundleAtPath:v6 failedWithError:v8];
  }
  id v9 = 0;
  int v35 = 1;
  if (a4) {
LABEL_35:
  }
    *a4 = v8;
LABEL_36:
  if ((v35 | 2) == 2) {
    v43 = 0;
  }
  else {
    v43 = v9;
  }

  return v43;
}

- (void)logBanner:(id)a3
{
}

- (int64_t)runTestsInBundleAtPath:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v22 = 0;
  uint64_t v4 = [(IMUnitTestRunner *)self runTestsInBundleAtPath:a3 error:&v22];
  id v15 = v22;
  [(IMUnitTestRunner *)self testLogWithFormat:&stru_1EF2CAD28];
  [(IMUnitTestRunner *)self logBanner:@"Messages Test Results"];
  char v16 = (void *)v4;
  char v5 = [(IMUnitTestRunner *)self descriptionFromResult:v4];
  [(IMUnitTestRunner *)self testLogWithFormat:@"%@", v5];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [(IMUnitTestRunner *)self failedTests];
  uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v19;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * v10);
        objc_super v12 = objc_msgSend(NSString, "stringWithFormat:", @"Failure #%ld", v8 + v10 + 1);
        [(IMUnitTestRunner *)self logBanner:v12];

        [(IMUnitTestRunner *)self testLogWithFormat:@"%@\n", v11];
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v23 count:16];
      v8 += v10;
    }
    while (v7);
  }

  int64_t v13 = [v16 totalFailureCount];
  return v13;
}

- (id)pathToPluginBundle:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  char v5 = [v3 mainBundle];
  uint64_t v6 = [v5 bundleURL];
  uint64_t v7 = [v6 path];

  uint64_t v8 = [v7 stringByAppendingPathComponent:@"/Contents/Plugins/"];

  uint64_t v9 = [v8 stringByAppendingPathComponent:v4];

  return v9;
}

- (id)runTestsInBundleNamed:(id)a3 error:(id *)a4
{
  uint64_t v6 = [(IMUnitTestRunner *)self pathToPluginBundle:a3];
  uint64_t v7 = [(IMUnitTestRunner *)self runTestsInBundleAtPath:v6 error:a4];

  return v7;
}

- (id)dateFormatter
{
  if (qword_1E94FF520 != -1) {
    dispatch_once(&qword_1E94FF520, &unk_1EF2BF420);
  }
  v2 = (void *)qword_1E94FF518;

  return v2;
}

- (id)descriptionFromResult:(id)a3
{
  if (a3)
  {
    long long v20 = NSString;
    id v4 = a3;
    if ([v4 hasSucceeded]) {
      char v5 = "passed";
    }
    else {
      char v5 = "failed";
    }
    uint64_t v6 = [(IMUnitTestRunner *)self dateFormatter];
    uint64_t v7 = [v4 stopDate];
    uint64_t v8 = [v6 stringFromDate:v7];
    uint64_t v9 = [v4 executionCount];
    uint64_t v10 = "";
    if ([v4 executionCount] == 1) {
      uint64_t v11 = "";
    }
    else {
      uint64_t v11 = "s";
    }
    uint64_t v12 = [v4 totalFailureCount];
    if ([v4 totalFailureCount] != 1) {
      uint64_t v10 = "s";
    }
    uint64_t v13 = [v4 unexpectedExceptionCount];
    [v4 testDuration];
    uint64_t v15 = v14;
    [v4 totalDuration];
    uint64_t v17 = v16;

    long long v18 = [v20 stringWithFormat:@"Tests %s at %@.\n\t Executed %lu test%s, with %lu failure%s (%lu unexpected) in %.3f (%.3f) seconds\n", v5, v8, v9, v11, v12, v10, v13, v15, v17];
  }
  else
  {
    long long v18 = @"*** TESTS FAILED: No results to report on (XCTestResult is nil)...";
  }

  return v18;
}

- (void)testSuiteWillStart:(id)a3
{
  id v11 = a3;
  id v4 = [v11 name];
  uint64_t v5 = [(IMUnitTestRunner *)self dateFormatter];
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v7 = [(id)v5 stringFromDate:v6];
  [(IMUnitTestRunner *)self testLogWithFormat:@"Test Suite '%@' started at %@\n", v4, v7];

  uint64_t v8 = [(IMUnitTestRunner *)self delegate];
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v9 = [(IMUnitTestRunner *)self delegate];
    uint64_t v10 = [v11 name];
    [v9 unitTestRunner:self testSuiteWillStart:v10];
  }
}

- (void)testSuite:(id)a3 didFailWithDescription:(id)a4 inFile:(id)a5 atLine:(unint64_t)a6
{
  id v25 = a3;
  id v10 = a4;
  id v11 = (__CFString *)a5;
  uint64_t v12 = v11;
  uint64_t v13 = NSString;
  if (v11) {
    uint64_t v14 = v11;
  }
  else {
    uint64_t v14 = @"<unknown>";
  }
  if (v11) {
    unint64_t v15 = a6;
  }
  else {
    unint64_t v15 = 0;
  }
  uint64_t v16 = [v25 name];
  uint64_t v17 = [v13 stringWithFormat:@"%@:%lu: error: %@ : %@\n", v14, v15, v16, v10];

  failedTests = self->_failedTests;
  if (!failedTests)
  {
    long long v19 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = self->_failedTests;
    self->_failedTests = v19;

    failedTests = self->_failedTests;
  }
  [(NSMutableArray *)failedTests addObject:v17];
  [(IMUnitTestRunner *)self testLogWithFormat:@"%@", v17];
  long long v21 = [(IMUnitTestRunner *)self delegate];
  char v22 = objc_opt_respondsToSelector();

  if (v22)
  {
    uint64_t v23 = [(IMUnitTestRunner *)self delegate];
    uint64_t v24 = [v25 name];
    [v23 unitTestRunner:self testSuite:v24 didFailWithDescription:v10 inFile:v12 atLine:a6];
  }
}

- (void)testSuiteDidFinish:(id)a3
{
  id v24 = a3;
  id v4 = [v24 testRun];
  uint64_t v23 = [v24 name];
  int v5 = [v4 hasSucceeded];
  uint64_t v6 = "failed";
  if (v5) {
    uint64_t v6 = "passed";
  }
  char v22 = v6;
  uint64_t v7 = [(IMUnitTestRunner *)self dateFormatter];
  uint64_t v8 = [v4 stopDate];
  uint64_t v9 = [v7 stringFromDate:v8];
  uint64_t v10 = [v4 executionCount];
  id v11 = "";
  if ([v4 executionCount] == 1) {
    uint64_t v12 = "";
  }
  else {
    uint64_t v12 = "s";
  }
  uint64_t v13 = [v4 totalFailureCount];
  if ([v4 totalFailureCount] != 1) {
    id v11 = "s";
  }
  uint64_t v14 = [v4 unexpectedExceptionCount];
  [v4 testDuration];
  uint64_t v16 = v15;
  [v4 totalDuration];
  [(IMUnitTestRunner *)self testLogWithFormat:@"Test Suite '%@' %s at %@.\n\t Executed %lu test%s, with %lu failure%s (%lu unexpected) in %.3f (%.3f) seconds\n", v23, v22, v9, v10, v12, v13, v11, v14, v16, v17];

  long long v18 = [(IMUnitTestRunner *)self delegate];
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    long long v20 = [(IMUnitTestRunner *)self delegate];
    long long v21 = [v24 name];
    [v20 unitTestRunner:self testSuiteDidFinish:v21 withResult:v4];
  }
}

- (void)testCaseWillStart:(id)a3
{
  id v9 = a3;
  id v4 = [v9 name];
  [(IMUnitTestRunner *)self testLogWithFormat:@"Test Case '%@' started.\n", v4];

  int v5 = [(IMUnitTestRunner *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(IMUnitTestRunner *)self delegate];
    uint64_t v8 = [v9 name];
    [v7 unitTestRunner:self testCaseWillStart:v8];
  }
}

- (void)testCase:(id)a3 didFailWithDescription:(id)a4 inFile:(id)a5 atLine:(unint64_t)a6
{
  id v20 = a3;
  id v10 = a4;
  id v11 = (__CFString *)a5;
  uint64_t v12 = v11;
  if (v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = @"<unknown>";
  }
  if (v11) {
    unint64_t v14 = a6;
  }
  else {
    unint64_t v14 = 0;
  }
  uint64_t v15 = [v20 name];
  [(IMUnitTestRunner *)self testLogWithFormat:@"%@:%lu: error: %@ : %@\n", v13, v14, v15, v10];

  uint64_t v16 = [(IMUnitTestRunner *)self delegate];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    long long v18 = [(IMUnitTestRunner *)self delegate];
    char v19 = [v20 name];
    [v18 unitTestRunner:self testCase:v19 didFailWithDescription:v10 inFile:v12 atLine:a6];
  }
}

- (void)testCaseDidFinish:(id)a3
{
  id v12 = a3;
  id v4 = [v12 testRun];
  int v5 = [v12 name];
  if ([v4 hasSucceeded]) {
    char v6 = "passed";
  }
  else {
    char v6 = "failed";
  }
  [v4 totalDuration];
  [(IMUnitTestRunner *)self testLogWithFormat:@"Test Case '%@' %s (%.3f seconds).\n", v5, v6, v7];

  uint64_t v8 = [(IMUnitTestRunner *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(IMUnitTestRunner *)self delegate];
    id v11 = [v12 name];
    [v10 unitTestRunner:self testCaseDidFinish:v11 withResult:v4];
  }
}

- (void)log:(id)a3
{
  id v4 = (objc_class *)NSString;
  id v5 = a3;
  char v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v8];

  uint64_t v7 = [(IMUnitTestRunner *)self logger];
  [v7 writeOutputToStdout:v6];
}

- (NSArray)failedTests
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (IMUnitTestRunnerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IMUnitTestRunnerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (IMUnitTestBundleLoader)bundleLoader
{
  return (IMUnitTestBundleLoader *)objc_getProperty(self, a2, 24, 1);
}

- (IMUnitTestLogger)logger
{
  return (IMUnitTestLogger *)objc_getProperty(self, a2, 32, 1);
}

- (IMUnitTestFrameworkLoader)frameworkLoader
{
  return (IMUnitTestFrameworkLoader *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameworkLoader, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_bundleLoader, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_failedTests, 0);
}

@end