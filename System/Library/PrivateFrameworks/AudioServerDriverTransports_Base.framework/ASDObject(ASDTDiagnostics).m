@interface ASDObject(ASDTDiagnostics)
+ (void)asdtLogComponents:()ASDTDiagnostics withSeparator:;
- (id)asdtName;
- (void)logDiagnostics:()ASDTDiagnostics;
@end

@implementation ASDObject(ASDTDiagnostics)

+ (void)asdtLogComponents:()ASDTDiagnostics withSeparator:
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = a4;
  v7 = [MEMORY[0x263F089D8] string];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v14 = [v7 length];
        if ((unint64_t)([v13 length] + v14) > 0x1DF)
        {
          if (v14)
          {
            v16 = ASDTBaseLogType();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v23 = v7;
              _os_log_impl(&dword_2489BC000, v16, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
            }
          }
          [v7 setString:v13];
        }
        else
        {
          if (v14) {
            v15 = v6;
          }
          else {
            v15 = &stru_26FCA6768;
          }
          [v7 appendFormat:@"%@%@", v15, v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v10);
  }

  if ([v7 length])
  {
    v17 = ASDTBaseLogType();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v7;
      _os_log_impl(&dword_2489BC000, v17, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
  }
}

- (void)logDiagnostics:()ASDTDiagnostics
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = [a1 diagnosticDescriptionWithIndent:&stru_26FCA6768 walkTree:1];
  v6 = NSString;
  uint64_t v7 = [a1 driverClassName];
  id v8 = (void *)v7;
  uint64_t v9 = @"(empty)";
  if (v5) {
    uint64_t v9 = v5;
  }
  uint64_t v10 = [v6 stringWithFormat:@"%@ Diags\n%@", v7, v9];

  if (a3)
  {
    uint64_t v11 = (void *)MEMORY[0x263F28C50];
    v12 = [v10 componentsSeparatedByString:@"\n"];
    [v11 asdtLogComponents:v12 withSeparator:@"\n"];
  }
  else
  {
    v13 = ASDTBaseLogType();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v10;
      _os_log_impl(&dword_2489BC000, v13, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
  }
}

- (id)asdtName
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = [a1 deviceUID];
  }
  else
  {
    v3 = NSString;
    v4 = [a1 driverClassName];
    v2 = [v3 stringWithFormat:@"%@(%p)", v4, a1];
  }
  return v2;
}

@end