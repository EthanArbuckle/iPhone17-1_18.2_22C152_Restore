@interface CKUnitTestRunner
+ (id)sharedInstance;
- (BOOL)shouldWrite;
- (IMUnitTestRunner)runner;
- (NSFileHandle)fileHandle;
- (void)_dumpResults:(id)a3;
- (void)runUnitTestBundleAtPath:(id)a3 writeToFile:(BOOL)a4;
- (void)setFileHandle:(id)a3;
- (void)setRunner:(id)a3;
- (void)setShouldWrite:(BOOL)a3;
- (void)unitTestRunner:(id)a3 didReceiveOutput:(id)a4;
@end

@implementation CKUnitTestRunner

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_94);
  }
  v2 = (void *)sharedInstance_sRunner;

  return v2;
}

void __34__CKUnitTestRunner_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CKUnitTestRunner);
  v1 = (void *)sharedInstance_sRunner;
  sharedInstance_sRunner = (uint64_t)v0;
}

- (void)runUnitTestBundleAtPath:(id)a3 writeToFile:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(CKUnitTestRunner *)self setShouldWrite:v4];
  id v7 = objc_alloc_init(MEMORY[0x1E4F6EAA8]);
  [v7 setDelegate:self];
  [(CKUnitTestRunner *)self setRunner:v7];
  if (v4)
  {
    v8 = [v6 lastPathComponent];
    v9 = [v8 stringByDeletingPathExtension];

    v10 = [NSString stringWithFormat:@"%@_Results.log", v9];
    v11 = [@"/tmp/" stringByAppendingPathComponent:v10];

    v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v13 = [v12 fileExistsAtPath:v11];

    if (v13)
    {
      v14 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v14 removeItemAtPath:v11 error:0];
    }
    v15 = [NSString stringWithFormat:@"MobileSMS invoking App test for %@\n", v6];
    id v23 = 0;
    [v15 writeToFile:v11 atomically:1 encoding:4 error:&v23];
    id v16 = v23;
    v17 = [MEMORY[0x1E4F28CB0] fileHandleForWritingAtPath:v11];
    if (!v17 || v16) {
      NSLog(&cfstr_ErrorFailedToG.isa, v11, v16);
    }
    [(CKUnitTestRunner *)self setFileHandle:v17];
  }
  id v22 = 0;
  v18 = [v7 runTestsInBundleAtPath:v6 error:&v22];
  id v19 = v22;
  [(CKUnitTestRunner *)self _dumpResults:v18];
  v20 = [(CKUnitTestRunner *)self fileHandle];

  if (v20)
  {
    v21 = [(CKUnitTestRunner *)self fileHandle];
    [v21 closeFile];
  }
  if ([v18 hasSucceeded]) {
    exit(0);
  }
  exit([v18 failureCount]);
}

- (void)_dumpResults:(id)a3
{
  BOOL v4 = NSString;
  id v5 = a3;
  uint64_t v6 = [v5 testCaseCount];
  uint64_t v7 = [v5 failureCount];
  int v8 = [v5 hasSucceeded];

  v9 = @"NO";
  if (v8) {
    v9 = @"YES";
  }
  id v13 = [v4 stringWithFormat:@"\n|-----------------Testing Complete--------------------|\n|>>> Test Cases %tu\n|>>> Failed Tests %lu\n|>>> Suite Passed %@\n|-----------------------------------------------------|", v6, v7, v9];
  v10 = [(CKUnitTestRunner *)self fileHandle];
  [v10 seekToEndOfFile];

  v11 = [v13 dataUsingEncoding:4];
  v12 = [(CKUnitTestRunner *)self fileHandle];
  [v12 writeData:v11];
}

- (void)unitTestRunner:(id)a3 didReceiveOutput:(id)a4
{
  id v9 = a4;
  if ([(CKUnitTestRunner *)self shouldWrite]
    && ([(CKUnitTestRunner *)self fileHandle],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    uint64_t v6 = [(CKUnitTestRunner *)self fileHandle];
    [v6 seekToEndOfFile];

    uint64_t v7 = [v9 dataUsingEncoding:4];
    int v8 = [(CKUnitTestRunner *)self fileHandle];
    [v8 writeData:v7];
  }
  else
  {
    NSLog(&stru_1EDE4F618.isa, v9);
  }
}

- (IMUnitTestRunner)runner
{
  return self->_runner;
}

- (void)setRunner:(id)a3
{
}

- (BOOL)shouldWrite
{
  return self->_shouldWrite;
}

- (void)setShouldWrite:(BOOL)a3
{
  self->_shouldWrite = a3;
}

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (void)setFileHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHandle, 0);

  objc_storeStrong((id *)&self->_runner, 0);
}

@end