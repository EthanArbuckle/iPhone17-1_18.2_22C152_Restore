@interface AMDFrameworkMetrics
+ (id)getValueForKey:(id)a3;
+ (void)flush;
+ (void)log:(id)a3 withKey:(id)a4 atVerbosity:(char)a5;
+ (void)provisionInstanceAtVerbosity:(char)a3 andAction:(id)a4 andVersion:(id)a5 andBuild:(id)a6 andStorefrontId:(id)a7 withLoggingProbability:(id)a8;
@end

@implementation AMDFrameworkMetrics

+ (void)provisionInstanceAtVerbosity:(char)a3 andAction:(id)a4 andVersion:(id)a5 andBuild:(id)a6 andStorefrontId:(id)a7 withLoggingProbability:(id)a8
{
  id v23 = a1;
  SEL v22 = a2;
  char v21 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v19 = 0;
  objc_storeStrong(&v19, a5);
  id v18 = 0;
  objc_storeStrong(&v18, a6);
  id v17 = 0;
  objc_storeStrong(&v17, a7);
  id v16 = 0;
  objc_storeStrong(&v16, a8);
  v8 = [AMDMetricsContainer alloc];
  v15 = [(AMDMetricsContainer *)v8 initWithLevel:v21 andAction:location andVersion:v19 andBuild:v18 andStorefrontId:v17 withLoggingProbability:v16];
  id v14 = (id)[MEMORY[0x263F08B88] currentThread];
  id v13 = (id)[v14 threadDictionary];
  [v13 setObject:v15 forKey:@"__AMDMetricsContainer"];

  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&location, 0);
}

+ (void)log:(id)a3 withKey:(id)a4 atVerbosity:(char)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v35 = 0;
  objc_storeStrong(&v35, a4);
  char v34 = a5;
  if (v35)
  {
    if (location[0])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        char v25 = 1;
        v12 = (void *)MEMORY[0x263F08900];
        id v38 = v35;
        id v39 = location[0];
        id v13 = (id)[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
        char v14 = objc_msgSend(v12, "isValidJSONObject:");

        if ((v14 & 1) == 0)
        {
          id v24 = &_os_log_internal;
          os_log_type_t v23 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v37, (uint64_t)v35);
            _os_log_error_impl(&dword_20ABD4000, (os_log_t)v24, v23, "Unserializable info passed to Figaro logger for key: %@", v37, 0xCu);
          }
          objc_storeStrong(&v24, 0);
          char v25 = 0;
        }
        id v11 = (id)[MEMORY[0x263F08B88] currentThread];
        id v10 = (id)[v11 threadDictionary];
        id v22 = (id)[v10 objectForKey:@"__AMDMetricsContainer"];

        if (v22)
        {
          char v5 = [v22 verbosity];
          if (v34 <= v5)
          {
            if (v25)
            {
              id v6 = (id)[v22 logData];
              [v6 setObject:location[0] forKey:v35];

              int v30 = 0;
            }
            else
            {
              id v7 = (id)[v22 logData];
              [v7 setObject:@"Unserializable info passed" forKey:v35];

              int v30 = 1;
            }
          }
          else
          {
            int v30 = 1;
          }
        }
        else
        {
          id v21 = &_os_log_internal;
          char v20 = 1;
          if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_INFO))
          {
            v8 = v21;
            os_log_type_t v9 = v20;
            __os_log_helper_16_0_0(v19);
            _os_log_impl(&dword_20ABD4000, v8, v9, "No metrics container currently defined. Skipping log", v19, 2u);
          }
          objc_storeStrong(&v21, 0);
          int v30 = 1;
        }
        objc_storeStrong(&v22, 0);
      }
      else
      {
        id v27 = &_os_log_internal;
        os_log_type_t v26 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v40, (uint64_t)v35);
          _os_log_error_impl(&dword_20ABD4000, (os_log_t)v27, v26, "Unsupported data type being logged for key : %@", v40, 0xCu);
        }
        objc_storeStrong(&v27, 0);
        int v30 = 1;
      }
    }
    else
    {
      id v29 = &_os_log_internal;
      os_log_type_t v28 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v41, (uint64_t)v35);
        _os_log_error_impl(&dword_20ABD4000, (os_log_t)v29, v28, "Attempting to log nil info to Figaro logger for key : %@", v41, 0xCu);
      }
      objc_storeStrong(&v29, 0);
      int v30 = 1;
    }
  }
  else
  {
    id v33 = &_os_log_internal;
    char v32 = 16;
    if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR))
    {
      log = v33;
      os_log_type_t type = v32;
      __os_log_helper_16_0_0(v31);
      _os_log_error_impl(&dword_20ABD4000, log, type, "Attempting to log nil key to Figaro logger", v31, 2u);
    }
    objc_storeStrong(&v33, 0);
    int v30 = 1;
  }
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
}

+ (id)getValueForKey:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = (id)[MEMORY[0x263F08B88] currentThread];
  id v6 = (id)[v7 threadDictionary];
  id v11 = (id)[v6 objectForKey:@"__AMDMetricsContainer"];

  char v9 = 0;
  BOOL v8 = 1;
  if (v11)
  {
    id v10 = (id)[v11 logData];
    char v9 = 1;
    BOOL v8 = v10 == 0;
  }
  if (v9) {

  }
  if (v8)
  {
    id v13 = 0;
  }
  else
  {
    id v5 = (id)[v11 logData];
    id v13 = (id)[v5 objectForKey:location[0]];
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  v3 = v13;

  return v3;
}

+ (void)flush
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v37[2] = a1;
  v37[1] = (id)a2;
  id v21 = (id)[MEMORY[0x263F08B88] currentThread];
  id v20 = (id)[v21 threadDictionary];
  v37[0] = (id)[v20 objectForKey:@"__AMDMetricsContainer"];

  if (v37[0])
  {
    double v32 = (double)arc4random() / 4294967300.0;
    id v16 = (id)[v37[0] loggingProbability];
    [v16 doubleValue];
    BOOL v17 = v32 <= v2;

    if (v17)
    {
      id v11 = (void *)MEMORY[0x263F08900];
      id v12 = (id)[v37[0] logData];
      char v13 = objc_msgSend(v11, "isValidJSONObject:");

      if (v13)
      {
        id v28 = &_os_log_internal;
        char v27 = 1;
        if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_INFO))
        {
          char v9 = v28;
          os_log_type_t v10 = v27;
          __os_log_helper_16_0_0(v26);
          _os_log_impl(&dword_20ABD4000, v9, v10, "Flushing logs", v26, 2u);
        }
        objc_storeStrong(&v28, 0);
        id v25 = &_os_log_internal;
        os_log_type_t v24 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEBUG))
        {
          id v8 = (id)[v37[0] logData];
          __os_log_helper_16_2_1_8_64((uint64_t)v39, (uint64_t)v8);
          _os_log_debug_impl(&dword_20ABD4000, (os_log_t)v25, v24, "Log data: %@", v39, 0xCu);
        }
        objc_storeStrong(&v25, 0);
        id v5 = (id)[v37[0] metricEvent];
        id v4 = (id)[v37[0] logData];
        objc_msgSend(v5, "setProperty:forBodyKey:");

        uint64_t v23 = [objc_alloc(MEMORY[0x263F27D40]) initWithContainerID:@"com.apple.AppleMediaServices" bag:0];
        id v6 = (id)v23;
        id v7 = (id)[v37[0] metricEvent];
        objc_msgSend(v6, "enqueueEvent:");

        objc_storeStrong((id *)&v23, 0);
      }
      else
      {
        id v22 = &_os_log_internal;
        if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
        {
          id v3 = (id)[v37[0] logData];
          __os_log_helper_16_2_1_8_64((uint64_t)v38, (uint64_t)v3);
          _os_log_error_impl(&dword_20ABD4000, (os_log_t)v22, OS_LOG_TYPE_ERROR, "Cannot flush unserializable log data: %@", v38, 0xCu);
        }
        objc_storeStrong(&v22, 0);
      }
      int v33 = 0;
    }
    else
    {
      id v31 = &_os_log_internal;
      char v30 = 1;
      if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_INFO))
      {
        char v14 = v31;
        os_log_type_t v15 = v30;
        __os_log_helper_16_0_0(v29);
        _os_log_impl(&dword_20ABD4000, v14, v15, "Skipping logging for this event invocation", v29, 2u);
      }
      objc_storeStrong(&v31, 0);
      int v33 = 1;
    }
  }
  else
  {
    id location = &_os_log_internal;
    char v35 = 16;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      log = location;
      os_log_type_t type = v35;
      __os_log_helper_16_0_0(v34);
      _os_log_error_impl(&dword_20ABD4000, log, type, "Programmer error: no metrics container!", v34, 2u);
    }
    objc_storeStrong(&location, 0);
    int v33 = 1;
  }
  objc_storeStrong(v37, 0);
}

@end