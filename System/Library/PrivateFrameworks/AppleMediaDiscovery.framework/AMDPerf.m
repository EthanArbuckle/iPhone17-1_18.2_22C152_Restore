@interface AMDPerf
+ (id)generatePerformanceDict;
+ (id)getContainer;
+ (void)enable:(BOOL)a3;
+ (void)endMonitoringEvent:(id)a3;
+ (void)log:(id)a3 atLevel:(int)a4;
+ (void)provision;
+ (void)sampleForKey:(id)a3;
+ (void)setVerbosity:(char)a3;
+ (void)startMonitoringEvent:(id)a3;
@end

@implementation AMDPerf

+ (void)provision
{
  v4[2] = a1;
  v4[1] = (id)a2;
  v4[0] = [[AMDPerfContainer alloc] initWithSwitch:1 atLevel:0];
  id v3 = (id)[MEMORY[0x263F08B88] currentThread];
  id v2 = (id)[v3 threadDictionary];
  [v2 setObject:v4[0] forKey:@"__AMDPerfContainer"];

  objc_storeStrong(v4, 0);
}

+ (id)getContainer
{
  v11[2] = a1;
  v11[1] = (id)a2;
  id v7 = (id)[MEMORY[0x263F08B88] currentThread];
  id v6 = (id)[v7 threadDictionary];
  v11[0] = (id)[v6 objectForKey:@"__AMDPerfContainer"];

  if (v11[0])
  {
    if ([v11[0] isEnabled]) {
      id v12 = v11[0];
    }
    else {
      id v12 = 0;
    }
  }
  else
  {
    id location = &_os_log_internal;
    char v9 = 16;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      log = location;
      os_log_type_t type = v9;
      __os_log_helper_16_0_0(v8);
      _os_log_error_impl(&dword_20ABD4000, log, type, "Programmer error: no perf container!", v8, 2u);
    }
    objc_storeStrong(&location, 0);
    id v12 = 0;
  }
  objc_storeStrong(v11, 0);
  id v2 = v12;

  return v2;
}

+ (void)enable:(BOOL)a3
{
  id v6 = a1;
  SEL v5 = a2;
  BOOL v4 = a3;
  id location = +[AMDPerf getContainer];
  if (location) {
    [location setIsEnabled:v4];
  }
  objc_storeStrong(&location, 0);
}

+ (void)setVerbosity:(char)a3
{
  id v6 = a1;
  SEL v5 = a2;
  char v4 = a3;
  id location = +[AMDPerf getContainer];
  if (location) {
    [location setLevel:v4];
  }
  objc_storeStrong(&location, 0);
}

+ (void)startMonitoringEvent:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = +[AMDPerf getContainer];
  if (v17)
  {
    id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v17 getTime];
    double v13 = v3;
    +[AMDPerfContainer getMemoryUsage:logType:timeDelta:](AMDPerfContainer, "getMemoryUsage:logType:timeDelta:", location[0], 0.0);
    int v12 = v4;
    id v6 = v15;
    id v7 = (id)[NSNumber numberWithDouble:v13];
    objc_msgSend(v6, "setObject:forKey:");

    id v8 = v14;
    LODWORD(v5) = v12;
    id v9 = (id)[NSNumber numberWithFloat:v5];
    objc_msgSend(v8, "setObject:forKey:");

    id v10 = (id)[v17 timeUsage];
    [v10 setObject:v15 forKey:location[0]];

    id v11 = (id)[v17 memoryUsage];
    [v11 setObject:v14 forKey:location[0]];

    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
    int v16 = 0;
  }
  else
  {
    int v16 = 1;
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

+ (void)endMonitoringEvent:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = +[AMDPerf getContainer];
  if (v22)
  {
    id v14 = (id)[v22 timeUsage];
    id v20 = (id)[v14 objectForKey:location[0]];

    id v15 = (id)[v22 memoryUsage];
    id v19 = (id)[v15 objectForKey:location[0]];

    if (v20 && v19)
    {
      [v22 getTime];
      double v17 = v3;
      double v8 = v3;
      id v7 = (id)[v20 objectForKey:@"start"];
      [v7 doubleValue];
      double v9 = v8 - v4;

      +[AMDPerfContainer getMemoryUsage:logType:timeDelta:](AMDPerfContainer, "getMemoryUsage:logType:timeDelta:", location[0], v9);
      int v16 = v5;
      id v10 = (id)[NSNumber numberWithDouble:v17];
      objc_msgSend(v20, "setObject:forKey:");

      LODWORD(v6) = v16;
      id v11 = (id)[NSNumber numberWithFloat:v6];
      objc_msgSend(v19, "setObject:forKey:");

      id v12 = (id)[v22 timeUsage];
      [v12 setObject:v20 forKey:location[0]];

      id v13 = (id)[v22 memoryUsage];
      [v13 setObject:v19 forKey:location[0]];

      int v21 = 0;
    }
    else
    {
      id v18 = &_os_log_internal;
      if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v24, (uint64_t)location[0]);
        _os_log_error_impl(&dword_20ABD4000, (os_log_t)v18, OS_LOG_TYPE_ERROR, "Programmer error: Ending monitoring event '%@' without starting it", v24, 0xCu);
      }
      objc_storeStrong(&v18, 0);
      int v21 = 1;
    }
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v20, 0);
  }
  else
  {
    int v21 = 1;
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

+ (id)generatePerformanceDict
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v39[2] = a1;
  v39[1] = (id)a2;
  v39[0] = +[AMDPerf getContainer];
  if (v39[0])
  {
    id v23 = objc_alloc(MEMORY[0x263EFF9A0]);
    id v24 = (id)[v39[0] timeUsage];
    id v37 = (id)objc_msgSend(v23, "initWithCapacity:", objc_msgSend(v24, "count"));

    memset(__b, 0, sizeof(__b));
    id obj = (id)[v39[0] timeUsage];
    uint64_t v26 = [obj countByEnumeratingWithState:__b objects:v41 count:16];
    if (v26)
    {
      uint64_t v20 = *(void *)__b[2];
      uint64_t v21 = 0;
      unint64_t v22 = v26;
      while (1)
      {
        uint64_t v19 = v21;
        if (*(void *)__b[2] != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v36 = *(void *)(__b[1] + 8 * v21);
        id v17 = (id)[v39[0] memoryUsage];
        id v34 = (id)[v17 objectForKey:v36];

        id v18 = (id)[v39[0] timeUsage];
        id v33 = (id)[v18 objectForKey:v36];

        id v32 = (id)[v33 objectForKey:@"end"];
        id v31 = (id)[v33 objectForKey:@"start"];
        double v30 = -1.0;
        if (v32 && v31)
        {
          [v32 doubleValue];
          double v16 = v2;
          [v31 doubleValue];
          double v30 = v16 - v3;
        }
        id v29 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        id v28 = (id)[v34 objectForKey:@"start"];
        id location = (id)[v34 objectForKey:@"end"];
        if (v28)
        {
          id v14 = v29;
          id v13 = NSNumber;
          [v28 floatValue];
          id v15 = (id)objc_msgSend(v13, "numberWithFloat:");
          objc_msgSend(v14, "setObject:forKey:");
        }
        if (location)
        {
          id v11 = v29;
          id v10 = NSNumber;
          [location floatValue];
          id v12 = (id)objc_msgSend(v10, "numberWithFloat:");
          objc_msgSend(v11, "setObject:forKey:");
        }
        id v8 = v29;
        id v9 = (id)[NSNumber numberWithDouble:v30];
        objc_msgSend(v8, "setObject:forKey:");

        [v37 setObject:v29 forKey:v36];
        objc_storeStrong(&location, 0);
        objc_storeStrong(&v28, 0);
        objc_storeStrong(&v29, 0);
        objc_storeStrong(&v31, 0);
        objc_storeStrong(&v32, 0);
        objc_storeStrong(&v33, 0);
        objc_storeStrong(&v34, 0);
        ++v21;
        if (v19 + 1 >= v22)
        {
          uint64_t v21 = 0;
          unint64_t v22 = [obj countByEnumeratingWithState:__b objects:v41 count:16];
          if (!v22) {
            break;
          }
        }
      }
    }

    id v6 = v37;
    id v7 = (id)[v39[0] samples];
    objc_msgSend(v6, "setObject:forKey:");

    id v40 = v37;
    int v38 = 1;
    objc_storeStrong(&v37, 0);
  }
  else
  {
    id v40 = MEMORY[0x263EFFA78];
    int v38 = 1;
  }
  objc_storeStrong(v39, 0);
  double v4 = v40;

  return v4;
}

+ (void)sampleForKey:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = +[AMDPerf getContainer];
  if (v13)
  {
    id v10 = (id)[v13 samples];
    id v11 = (id)[v10 objectForKey:location[0]];

    if (!v11)
    {
      id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    }
    id v5 = v11;
    double v3 = NSNumber;
    [v13 getTime];
    id v8 = (id)objc_msgSend(v3, "numberWithDouble:");
    v15[0] = v8;
    double v4 = NSNumber;
    +[AMDPerfContainer getMemoryUsage:location[0] logType:@"sample" timeDelta:0.0];
    id v7 = (id)objc_msgSend(v4, "numberWithFloat:");
    v15[1] = v7;
    id v6 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
    objc_msgSend(v5, "addObject:");

    id v9 = (id)[v13 samples];
    [v9 setObject:v11 forKey:location[0]];

    objc_storeStrong(&v11, 0);
    int v12 = 0;
  }
  else
  {
    int v12 = 1;
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

+ (void)log:(id)a3 atLevel:(int)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int v8 = a4;
  id v7 = +[AMDPerf getContainer];
  if (v7)
  {
    if (v8 <= (char)[v7 level])
    {
      os_log_t oslog = (os_log_t)&_os_log_internal;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)location[0]);
        _os_log_impl(&dword_20ABD4000, oslog, OS_LOG_TYPE_INFO, "%@", v10, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      int v6 = 0;
    }
    else
    {
      int v6 = 1;
    }
  }
  else
  {
    int v6 = 1;
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

@end