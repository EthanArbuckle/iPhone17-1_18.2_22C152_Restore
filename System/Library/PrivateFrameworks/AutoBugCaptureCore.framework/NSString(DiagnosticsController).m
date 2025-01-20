@interface NSString(DiagnosticsController)
- (id)maximumLogLevelString:()DiagnosticsController;
@end

@implementation NSString(DiagnosticsController)

- (id)maximumLogLevelString:()DiagnosticsController
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = a1;
  v6 = v5;
  id v7 = v5;
  if (v4)
  {
    id v7 = v5;
    if (([v5 isEqualToString:v4] & 1) == 0)
    {
      if ([v6 isEqualToString:@"debug"])
      {
        unint64_t v8 = 4;
      }
      else if ([v6 isEqualToString:@"info"])
      {
        unint64_t v8 = 3;
      }
      else if ([v6 isEqualToString:@"default"])
      {
        unint64_t v8 = 2;
      }
      else
      {
        unint64_t v8 = 0;
      }
      if ([v4 isEqualToString:@"debug"])
      {
        unint64_t v9 = 4;
      }
      else if ([v4 isEqualToString:@"info"])
      {
        unint64_t v9 = 3;
      }
      else
      {
        int v10 = [v4 isEqualToString:@"default"];
        unint64_t v9 = 2;
        if (!v10) {
          unint64_t v9 = 0;
        }
      }
      id v7 = v6;
      if (v9 > v8)
      {
        id v7 = v4;
      }
    }
  }
  v11 = diagcollectLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138412290;
    id v14 = v7;
    _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_DEBUG, "> Choosing log level: %@", (uint8_t *)&v13, 0xCu);
  }

  return v7;
}

@end