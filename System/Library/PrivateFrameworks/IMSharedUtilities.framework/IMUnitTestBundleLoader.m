@interface IMUnitTestBundleLoader
- (BOOL)loadTestBundle:(id)a3 bundle:(id *)a4 error:(id *)a5;
- (IMUnitTestBundleLoader)initWithLogger:(id)a3;
- (IMUnitTestLogger)logger;
@end

@implementation IMUnitTestBundleLoader

- (IMUnitTestBundleLoader)initWithLogger:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMUnitTestBundleLoader;
  v6 = [(IMUnitTestBundleLoader *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_logger, a3);
  }

  return v7;
}

- (BOOL)loadTestBundle:(id)a3 bundle:(id *)a4 error:(id *)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  objc_super v9 = [(IMUnitTestBundleLoader *)self logger];
  [v9 log:@"Attempting to load bundle at path: '%@'", v8];

  v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v11 = [v10 fileExistsAtPath:v8];

  if (v11)
  {
    v12 = [MEMORY[0x1E4F28B50] bundleWithPath:v8];
    id v22 = 0;
    char v13 = [v12 loadAndReturnError:&v22];
    id v14 = v22;
    if (v13)
    {
      if (a4) {
        *a4 = v12;
      }
      v15 = [(IMUnitTestBundleLoader *)self logger];
      [v15 log:@"Loaded bundle at path: '%@' ok", v8];
    }
    else
    {
      v15 = [(IMUnitTestBundleLoader *)self logger];
      v20 = [v14 localizedDescription];
      [v15 log:@"Unable to load bundle at path: '%@' with error: '%@'", v8, v20];
    }
  }
  else
  {
    v16 = [(IMUnitTestBundleLoader *)self logger];
    [v16 log:@"Bundle not found at path: '%@'", v8];

    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v18 = [NSString stringWithFormat:@"Bundle not found at path: '%@'", v8];
    v24[0] = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    id v14 = [v17 errorWithDomain:*MEMORY[0x1E4F281F8] code:4 userInfo:v19];

    char v13 = 0;
  }
  if (a5) {
    *a5 = v14;
  }

  return v13 & 1;
}

- (IMUnitTestLogger)logger
{
  return (IMUnitTestLogger *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end