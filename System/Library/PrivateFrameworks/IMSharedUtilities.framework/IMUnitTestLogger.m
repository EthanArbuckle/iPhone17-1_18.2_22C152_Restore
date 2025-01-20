@interface IMUnitTestLogger
- (void)log:(id)a3;
- (void)writeOutputToStdout:(id)a3;
@end

@implementation IMUnitTestLogger

- (void)writeOutputToStdout:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F28CB0] fileHandleWithStandardOutput];
  v5 = [v3 dataUsingEncoding:4];
  [v4 writeData:v5];

  v6 = IMLogHandleForCategory("IMUnitTesting");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)log:(id)a3
{
  v4 = (objc_class *)NSString;
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v8];

  int v7 = [NSString stringWithFormat:@"%@\n", v6];
  [(IMUnitTestLogger *)self writeOutputToStdout:v7];
}

@end