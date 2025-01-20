@interface IMUnitTestFrameworkLoader
- (BOOL)findFrameworkPathsWithFrameworkNames:(id)a3 searchPaths:(id)a4 outFrameworkPaths:(id *)a5 error:(id *)a6;
- (BOOL)frameworkExistsAtPath:(id)a3;
- (BOOL)loadFrameworkNamesFromTextFile:(id)a3 outNames:(id *)a4 error:(id *)a5;
- (BOOL)loadFrameworks:(id)a3 outError:(id *)a4;
- (BOOL)loadTestFrameworks:(id *)a3;
- (BOOL)loadXCTestFramework:(id *)a3;
- (BOOL)loadXCTestFrameworkFromSDK:(id *)a3;
- (BOOL)readXCTestFrameworkDependencies:(id *)a3 error:(id *)a4;
- (BOOL)xctestFrameworkLoaded;
- (IMUnitTestBundleLoader)bundleLoader;
- (IMUnitTestFrameworkLoader)initWithLogger:(id)a3 bundleLoader:(id)a4;
- (IMUnitTestLogger)logger;
- (id)frameworkSearchPaths;
- (void)setXctestFrameworkLoaded:(BOOL)a3;
@end

@implementation IMUnitTestFrameworkLoader

- (IMUnitTestFrameworkLoader)initWithLogger:(id)a3 bundleLoader:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMUnitTestFrameworkLoader;
  v9 = [(IMUnitTestFrameworkLoader *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_logger, a3);
    objc_storeStrong((id *)&v10->_bundleLoader, a4);
  }

  return v10;
}

- (BOOL)loadFrameworkNamesFromTextFile:(id)a3 outNames:(id *)a4 error:(id *)a5
{
  id v8 = NSString;
  id v20 = 0;
  id v9 = a3;
  v10 = [v8 stringWithContentsOfFile:v9 encoding:4 error:&v20];
  id v11 = v20;
  objc_super v12 = v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 0;
  }
  if (v13)
  {
    v16 = [(IMUnitTestFrameworkLoader *)self logger];
    [v16 log:@"Loaded dependencies from file at path: '%@'\n%@", v9, v10];

    v17 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    v18 = [v10 stringByTrimmingCharactersInSet:v17];
    id v14 = [v18 componentsSeparatedByString:@"\n"];

    BOOL v15 = v14 != 0;
    if (a4 && v14)
    {
      id v14 = v14;
      *a4 = v14;
      BOOL v15 = 1;
    }
  }
  else
  {
    if (a5) {
      *a5 = v11;
    }
    id v14 = [(IMUnitTestFrameworkLoader *)self logger];
    [v14 log:@"Unable to load framework dependencies from file at path: '%@', error = %@", v9, v12];

    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)readXCTestFrameworkDependencies:(id *)a3 error:(id *)a4
{
  id v7 = [@"/AppleInternal/XCTests/com.apple.imcore/Frameworks" stringByAppendingPathComponent:@"XCTest-framework-list.txt"];
  LOBYTE(a4) = [(IMUnitTestFrameworkLoader *)self loadFrameworkNamesFromTextFile:v7 outNames:a3 error:a4];

  return (char)a4;
}

- (BOOL)frameworkExistsAtPath:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  v5 = [v3 defaultManager];
  char v6 = [v5 fileExistsAtPath:v4];

  return v6;
}

- (id)frameworkSearchPaths
{
  return &unk_1EF305CA0;
}

- (BOOL)findFrameworkPathsWithFrameworkNames:(id)a3 searchPaths:(id)a4 outFrameworkPaths:(id *)a5 error:(id *)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v32 = a4;
  id v31 = [MEMORY[0x1E4F1CA48] array];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v9 = v8;
  uint64_t v30 = [v9 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v30)
  {
    id obj = v9;
    uint64_t v29 = *(void *)v38;
    v26 = a5;
    while (1)
    {
      uint64_t v10 = 0;
LABEL_4:
      if (*(void *)v38 != v29) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void *)(*((void *)&v37 + 1) + 8 * v10);
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v12 = v32;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v43 count:16];
      if (!v13) {
        break;
      }
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v34;
LABEL_8:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [*(id *)(*((void *)&v33 + 1) + 8 * v16) stringByAppendingPathComponent:v11];
        v18 = [MEMORY[0x1E4F28CB8] defaultManager];
        int v19 = [v18 fileExistsAtPath:v17];

        if (v19) {
          break;
        }

        if (v14 == ++v16)
        {
          uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v43 count:16];
          if (v14) {
            goto LABEL_8;
          }
          goto LABEL_20;
        }
      }
      [v31 addObject:v17];

      if (++v10 != v30) {
        goto LABEL_4;
      }
      id v9 = obj;
      a5 = v26;
      uint64_t v30 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
      if (!v30) {
        goto LABEL_17;
      }
    }
LABEL_20:

    if (a6)
    {
      v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F281F8];
      uint64_t v41 = *MEMORY[0x1E4F28568];
      v23 = [NSString stringWithFormat:@"Framework not found: '%@'", v11];
      v42 = v23;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      *a6 = [v21 errorWithDomain:v22 code:4 userInfo:v24];
    }
    id v9 = obj;

    BOOL v20 = 0;
  }
  else
  {
LABEL_17:

    if (a5) {
      *a5 = v31;
    }
    BOOL v20 = 1;
  }

  return v20;
}

- (BOOL)loadFrameworks:(id)a3 outError:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int v19 = a4;
    uint64_t v9 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v12 = [(IMUnitTestFrameworkLoader *)self bundleLoader];
        id v20 = 0;
        char v13 = [v12 loadTestBundle:v11 bundle:0 error:&v20];
        id v14 = v20;

        uint64_t v15 = [(IMUnitTestFrameworkLoader *)self logger];
        uint64_t v16 = v15;
        if ((v13 & 1) == 0)
        {
          [v15 log:@"Unable to load XCTest.framework dependency: %@ (%@)", v11, v14];

          if (v19) {
            *int v19 = v14;
          }

          BOOL v17 = 0;
          goto LABEL_13;
        }
        [v15 log:@"Loaded XCTest.framework dependency ok: %@", v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v17 = 1;
LABEL_13:

  return v17;
}

- (BOOL)loadXCTestFrameworkFromSDK:(id *)a3
{
  v5 = [@"/AppleInternal/XCTests/com.apple.imcore/Frameworks" stringByAppendingPathComponent:@"XCTest-framework-list.txt"];
  id v23 = 0;
  id v24 = 0;
  BOOL v6 = [(IMUnitTestFrameworkLoader *)self loadFrameworkNamesFromTextFile:v5 outNames:&v24 error:&v23];
  id v7 = v24;
  id v8 = v23;
  if (v8) {
    BOOL v6 = 0;
  }

  if (v6)
  {
    uint64_t v9 = [(IMUnitTestFrameworkLoader *)self frameworkSearchPaths];
    id v21 = 0;
    id v22 = 0;
    BOOL v10 = [(IMUnitTestFrameworkLoader *)self findFrameworkPathsWithFrameworkNames:v7 searchPaths:v9 outFrameworkPaths:&v22 error:&v21];
    id v11 = v22;
    id v8 = v21;
    if (v8) {
      BOOL v10 = 0;
    }

    if (v10)
    {
      id v20 = 0;
      BOOL v12 = [(IMUnitTestFrameworkLoader *)self loadFrameworks:v11 outError:&v20];
      id v13 = v20;
      if (v13) {
        BOOL v14 = 0;
      }
      else {
        BOOL v14 = v12;
      }
      if (v14)
      {
        id v8 = 0;
        int v15 = 0;
        goto LABEL_18;
      }
      id v8 = v13;
      int v19 = [(IMUnitTestFrameworkLoader *)self logger];
      [v19 log:@"Unable to load XCTest.frameworks %@ with error: (%@)", v11, v8];
    }
    else
    {
      int v19 = [(IMUnitTestFrameworkLoader *)self logger];
      [v19 log:@"Unable to find XCTest.framework dependencies: (%@)", v8];
    }

    int v15 = 1;
LABEL_18:

    if (!a3) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  uint64_t v16 = [(IMUnitTestFrameworkLoader *)self logger];
  BOOL v17 = [@"/AppleInternal/XCTests/com.apple.imcore/Frameworks" stringByAppendingPathComponent:@"XCTest-framework-list.txt"];
  [v16 log:@"Unable to find XCTest.framework dependencies in file: (%@): %@", v17, v8];

  int v15 = 1;
  if (a3) {
LABEL_13:
  }
    *a3 = v8;
LABEL_14:

  return v15 == 0;
}

- (BOOL)loadXCTestFramework:(id *)a3
{
  id v23 = 0;
  id v24 = 0;
  BOOL v5 = [(IMUnitTestFrameworkLoader *)self readXCTestFrameworkDependencies:&v24 error:&v23];
  id v6 = v24;
  id v7 = v23;
  if (v7) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v5;
  }
  if (v8)
  {
    uint64_t v9 = [(IMUnitTestFrameworkLoader *)self frameworkSearchPaths];
    id v21 = 0;
    id v22 = 0;
    BOOL v10 = [(IMUnitTestFrameworkLoader *)self findFrameworkPathsWithFrameworkNames:v6 searchPaths:v9 outFrameworkPaths:&v22 error:&v21];
    id v11 = v22;
    id v12 = v21;
    if (v12) {
      BOOL v10 = 0;
    }

    if (v10)
    {
      id v20 = 0;
      BOOL v13 = [(IMUnitTestFrameworkLoader *)self loadFrameworks:v11 outError:&v20];
      id v14 = v20;
      if (v14) {
        BOOL v15 = 0;
      }
      else {
        BOOL v15 = v13;
      }
      if (v15)
      {
        id v12 = 0;
        int v16 = 0;
        goto LABEL_19;
      }
      id v12 = v14;
      int v19 = [(IMUnitTestFrameworkLoader *)self logger];
      [v19 log:@"Unable to load XCTest.frameworks %@ with error: (%@)", v11, v12];
    }
    else
    {
      int v19 = [(IMUnitTestFrameworkLoader *)self logger];
      [v19 log:@"Unable to find XCTest.framework dependencies: (%@)", v12];
    }

    int v16 = 1;
LABEL_19:

    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  id v12 = v7;
  BOOL v17 = [(IMUnitTestFrameworkLoader *)self logger];
  [v17 log:@"Unable to find XCTest.framework dependencies: %@", v12];

  int v16 = 1;
  if (a3) {
LABEL_14:
  }
    *a3 = v12;
LABEL_15:

  return v16 == 0;
}

- (BOOL)loadTestFrameworks:(id *)a3
{
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = sub_1A083CE70;
  BOOL v8 = &unk_1E5A13660;
  uint64_t v9 = self;
  BOOL v10 = a3;
  if (qword_1E94FF858 != -1) {
    dispatch_once(&qword_1E94FF858, &v5);
  }
  return [(IMUnitTestFrameworkLoader *)self xctestFrameworkLoaded];
}

- (BOOL)xctestFrameworkLoaded
{
  return self->_xctestFrameworkLoaded;
}

- (void)setXctestFrameworkLoaded:(BOOL)a3
{
  self->_xctestFrameworkLoaded = a3;
}

- (IMUnitTestBundleLoader)bundleLoader
{
  return self->_bundleLoader;
}

- (IMUnitTestLogger)logger
{
  return (IMUnitTestLogger *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);

  objc_storeStrong((id *)&self->_bundleLoader, 0);
}

@end