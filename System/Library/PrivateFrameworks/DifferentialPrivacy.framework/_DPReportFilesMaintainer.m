@interface _DPReportFilesMaintainer
+ (BOOL)removeFilesFrom:(id)a3 olderThanSecond:(double)a4;
+ (BOOL)retireFiles:(id)a3 toDirectory:(id)a4;
+ (id)reportsInDirectory:(id)a3;
+ (id)retiredReportsPath:(id)a3;
- (BOOL)doMaintenance;
- (NSString)reportsDirectoryPath;
- (_DPReportFilesMaintainer)init;
- (_DPReportFilesMaintainer)initWithDirectoryPath:(id)a3;
- (void)scheduleMaintenanceWithName:(id)a3 database:(id)a4;
- (void)setReportsDirectoryPath:(id)a3;
@end

@implementation _DPReportFilesMaintainer

- (_DPReportFilesMaintainer)initWithDirectoryPath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DPReportFilesMaintainer;
  v6 = [(_DPReportFilesMaintainer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_reportsDirectoryPath, a3);
  }

  return v7;
}

- (_DPReportFilesMaintainer)init
{
  v3 = +[_DPStrings reportsDirectoryPath];
  v4 = [(_DPReportFilesMaintainer *)self initWithDirectoryPath:v3];

  return v4;
}

+ (id)reportsInDirectory:(id)a3
{
  id v3 = a3;
  context = (void *)MEMORY[0x1E019F810]();
  v4 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  v6 = [v5 enumeratorAtPath:v3];
  uint64_t v7 = [v6 nextObject];
  if (v7)
  {
    v8 = (void *)v7;
    do
    {
      objc_super v9 = [NSString stringWithFormat:@"%@/%@", v3, v8];
      char v15 = 0;
      if ([v5 fileExistsAtPath:v9 isDirectory:&v15])
      {
        if (v15)
        {
          [v6 skipDescendents];
        }
        else
        {
          v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9];
          [v4 addObject:v10];
        }
      }

      uint64_t v11 = [v6 nextObject];

      v8 = (void *)v11;
    }
    while (v11);
  }
  v12 = (void *)[v4 copy];

  return v12;
}

+ (id)retiredReportsPath:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@/%@", a3, @"Retired"];
}

+ (BOOL)removeFilesFrom:(id)a3 olderThanSecond:(double)a4
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-a4];
  uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  v8 = [v7 enumeratorAtPath:v5];
  uint64_t v9 = [v8 nextObject];
  if (v9)
  {
    v10 = (void *)v9;
    unint64_t v11 = 0x1E4F29000uLL;
    do
    {
      v12 = [*(id *)(v11 + 24) stringWithFormat:@"%@/%@", v5, v10];
      char v21 = 0;
      if ([v7 fileExistsAtPath:v12 isDirectory:&v21])
      {
        if (v21)
        {
          [v8 skipDescendents];
        }
        else
        {
          v13 = [v7 attributesOfItemAtPath:v12 error:0];
          v14 = [v13 fileCreationDate];

          if ([v14 compare:v6] == -1)
          {
            char v15 = [MEMORY[0x1E4F28CB8] defaultManager];
            [v15 attributesOfItemAtPath:v12 error:0];
            unint64_t v16 = v11;
            v18 = v17 = v6;
            [v18 fileSize];

            v6 = v17;
            unint64_t v11 = v16;

            [v7 removeItemAtPath:v12 error:0];
          }
        }
      }

      uint64_t v19 = [v8 nextObject];

      v10 = (void *)v19;
    }
    while (v19);
  }

  return 1;
}

+ (BOOL)retireFiles:(id)a3 toDirectory:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  [MEMORY[0x1E4F28CB8] defaultManager];
  v26 = char v33 = 0;
  v27 = v6;
  if (([v26 fileExistsAtPath:v6 isDirectory:&v33] & 1) == 0)
  {
    obj = +[_DPLog daemon];
    if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG)) {
      +[_DPReportFilesMaintainer retireFiles:toDirectory:]();
    }
    goto LABEL_19;
  }
  if (!v33)
  {
    obj = +[_DPLog daemon];
    if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG)) {
      +[_DPReportFilesMaintainer retireFiles:toDirectory:]();
    }
LABEL_19:
    char v21 = 0;
    goto LABEL_20;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v40 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v23 = v5;
    uint64_t v9 = *(void *)v30;
    char v24 = 1;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(obj);
        }
        unint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v12 = [v11 absoluteString];
        v13 = [v12 lastPathComponent];

        v14 = [v27 stringByAppendingPathComponent:v13];
        char v15 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14 isDirectory:0];
        unint64_t v16 = [v11 path];
        uint64_t v17 = [MEMORY[0x1E4F28CB8] defaultManager];
        v18 = [(id)v17 attributesOfItemAtPath:v16 error:0];
        [v18 fileSize];

        id v28 = 0;
        LOBYTE(v17) = [v26 moveItemAtURL:v11 toURL:v15 error:&v28];
        id v19 = v28;
        if ((v17 & 1) == 0)
        {
          v20 = +[_DPLog daemon];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            v35 = v11;
            __int16 v36 = 2112;
            v37 = v15;
            __int16 v38 = 2112;
            id v39 = v19;
            _os_log_debug_impl(&dword_1DC55E000, v20, OS_LOG_TYPE_DEBUG, "moveItemAtURL:%@ toURL:%@ failed with error %@", buf, 0x20u);
          }

          char v24 = 0;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v40 count:16];
    }
    while (v8);
    id v5 = v23;
    char v21 = v24;
  }
  else
  {
    char v21 = 1;
  }
LABEL_20:

  return v21 & 1;
}

- (BOOL)doMaintenance
{
  double v3 = (double)(unint64_t)kSecondsIn3Day;
  v4 = (void *)MEMORY[0x1E019F810](self, a2);
  [(id)objc_opt_class() removeFilesFrom:self->_reportsDirectoryPath olderThanSecond:v3];
  id v5 = objc_opt_class();
  id v6 = [(id)objc_opt_class() retiredReportsPath:self->_reportsDirectoryPath];
  [v5 removeFilesFrom:v6 olderThanSecond:v3];

  return 1;
}

- (void)scheduleMaintenanceWithName:(id)a3 database:(id)a4
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65___DPReportFilesMaintainer_scheduleMaintenanceWithName_database___block_invoke;
  v7[3] = &unk_1E6C43BE0;
  v7[4] = self;
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E019FA60](v7);
  id v6 = +[_DPPeriodicTask taskWithName:v4 period:kSecondsIn24Hours handler:v5];

  +[_DPPeriodicTaskManager registerTask:v6];
}

- (NSString)reportsDirectoryPath
{
  return self->_reportsDirectoryPath;
}

- (void)setReportsDirectoryPath:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)retireFiles:toDirectory:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_4(&dword_1DC55E000, v0, v1, "fileExistsAtPath:isDirectory: was successful for %@ ; isDirectory=%d");
}

+ (void)retireFiles:toDirectory:.cold.2()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_4(&dword_1DC55E000, v0, v1, "fileExistsAtPath:isDirectory: failed for %@ ; isDirectory=%d");
}

@end