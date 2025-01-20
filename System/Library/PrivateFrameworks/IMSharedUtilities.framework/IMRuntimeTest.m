@interface IMRuntimeTest
+ (id)logHandle;
+ (id)testName;
+ (void)testLog:(id)a3;
- (Class)testRunClass;
- (IMRuntimeTestRun)testRun;
- (id)completion;
- (id)logHandle;
- (id)testName;
- (void)dispatchAfter:(double)a3 block:(id)a4;
- (void)finishTest;
- (void)finishTestAfterInterval:(double)a3;
- (void)runTest:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setTestRun:(id)a3;
- (void)testLog:(id)a3;
@end

@implementation IMRuntimeTest

+ (id)logHandle
{
  if (qword_1E94FF550 != -1) {
    dispatch_once(&qword_1E94FF550, &unk_1EF2BF4A0);
  }
  v2 = (void *)qword_1E94FF548;

  return v2;
}

- (id)logHandle
{
  v2 = objc_opt_class();

  return (id)[v2 logHandle];
}

- (void)finishTest
{
  [(IMRuntimeTest *)self tearDown];
  v3 = [(IMRuntimeTest *)self testRun];
  [v3 stop];

  v5 = [(IMRuntimeTest *)self completion];
  [(IMRuntimeTest *)self setCompletion:0];
  [(IMRuntimeTest *)self testLog:@"Finished test"];
  if (v5)
  {
    v4 = [(IMRuntimeTest *)self testRun];
    v5[2](v5, v4);
  }
}

- (Class)testRunClass
{
  return (Class)objc_opt_class();
}

- (void)runTest:(id)a3
{
  id v4 = a3;
  [(IMRuntimeTest *)self testLog:@"Starting test"];
  [(IMRuntimeTest *)self setCompletion:v4];

  v5 = objc_msgSend(objc_alloc(-[IMRuntimeTest testRunClass](self, "testRunClass")), "initWithTest:", self);
  [(IMRuntimeTest *)self setTestRun:v5];

  [(IMRuntimeTest *)self setUp];
  v6 = [(IMRuntimeTest *)self testRun];
  [v6 start];

  MEMORY[0x1F4181798](self, sel_startTest);
}

- (id)testName
{
  v2 = objc_opt_class();

  return (id)[v2 testName];
}

+ (id)testName
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)dispatchAfter:(double)a3 block:(id)a4
{
  dispatch_block_t block = a4;
  [(IMRuntimeTest *)self testLog:@"Scheduling test block for %f seconds", *(void *)&a3];
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_after(v6, MEMORY[0x1E4F14428], block);
}

- (void)finishTestAfterInterval:(double)a3
{
  [(IMRuntimeTest *)self testLog:@"Will finish test in %f seconds", *(void *)&a3];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1A07F3940;
  v5[3] = &unk_1E5A11D40;
  v5[4] = self;
  [(IMRuntimeTest *)self dispatchAfter:v5 block:a3];
}

- (void)testLog:(id)a3
{
  v3 = (objc_class *)NSString;
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithFormat:v4 arguments:&v6];

  [(id)objc_opt_class() testLog:@"%@", v5];
}

+ (void)testLog:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)NSString;
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v14];

  v7 = [a1 logHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = [a1 testName];
    *(_DWORD *)buf = 138412546;
    v10 = v8;
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "%@: %@", buf, 0x16u);
  }
}

- (IMRuntimeTestRun)testRun
{
  return (IMRuntimeTestRun *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTestRun:(id)a3
{
}

- (id)completion
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_testRun, 0);
}

@end