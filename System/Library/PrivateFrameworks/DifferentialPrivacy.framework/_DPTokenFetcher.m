@interface _DPTokenFetcher
+ (unint64_t)getTaskPeriodSeconds;
- (BOOL)cleanupStaleTokensInPath:(id)a3;
- (NSString)taskName;
- (_DPTokenFetcher)initWithTaskName:(id)a3;
- (unint64_t)taskPeriodSeconds;
- (void)doMaintenance;
- (void)scheduleMaintenanceWithName:(id)a3 database:(id)a4;
- (void)setTaskPeriodSeconds:(unint64_t)a3;
@end

@implementation _DPTokenFetcher

- (_DPTokenFetcher)initWithTaskName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DPTokenFetcher;
  v5 = [(_DPTokenFetcher *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    taskName = v5->_taskName;
    v5->_taskName = (NSString *)v6;

    v5->_taskPeriodSeconds = +[_DPTokenFetcher getTaskPeriodSeconds];
  }

  return v5;
}

- (void)doMaintenance
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  v2 = @"com.apple.DPSubmissionService";
  _os_log_error_impl(&dword_1DC55E000, log, OS_LOG_TYPE_ERROR, "Could not create connection to %@", (uint8_t *)&v1, 0xCu);
}

- (BOOL)cleanupStaleTokensInPath:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v26 = v3;
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = +[_DPStrings tokensDirectoryPath];
  }
  v5 = +[_DPReportFilesMaintainer reportsInDirectory:](_DPReportFilesMaintainer, "reportsInDirectory:", v4, v4);
  uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  v7 = [MEMORY[0x1E4F1C9C8] date];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      uint64_t v11 = 0;
      uint64_t v27 = v9;
      do
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = [*(id *)(*((void *)&v30 + 1) + 8 * v11) path];
        v13 = [v6 attributesOfItemAtPath:v12 error:0];
        v14 = [v13 fileCreationDate];

        v15 = [v14 dateByAddingTimeInterval:86500.0];
        if ([v15 compare:v7] == -1)
        {
          uint64_t v16 = v10;
          v17 = v7;
          id v29 = 0;
          v18 = v6;
          char v19 = [v6 removeItemAtPath:v12 error:&v29];
          id v20 = v29;
          v21 = +[_DPLog framework];
          v22 = v21;
          if (v19)
          {
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v35 = v12;
              _os_log_impl(&dword_1DC55E000, v22, OS_LOG_TYPE_INFO, "Successfully removed token bucket file %@.", buf, 0xCu);
            }
          }
          else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v23 = [v20 localizedDescription];
            *(_DWORD *)buf = 138412546;
            v35 = v12;
            __int16 v36 = 2112;
            v37 = v23;
            _os_log_error_impl(&dword_1DC55E000, v22, OS_LOG_TYPE_ERROR, "Failed to remove token bucket file %@ with error %@.", buf, 0x16u);
          }
          v7 = v17;
          uint64_t v10 = v16;
          uint64_t v6 = v18;
          uint64_t v9 = v27;
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v9);
  }

  return 1;
}

- (void)scheduleMaintenanceWithName:(id)a3 database:(id)a4
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56___DPTokenFetcher_scheduleMaintenanceWithName_database___block_invoke;
  v7[3] = &unk_1E6C43BE0;
  v7[4] = self;
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E019FA60](v7);
  uint64_t v6 = +[_DPPeriodicTask taskWithName:period:handler:networkingRequired:](_DPPeriodicTask, "taskWithName:period:handler:networkingRequired:", v4, +[_DPTokenFetcher getTaskPeriodSeconds], v5, 1);

  +[_DPPeriodicTaskManager registerTask:v6];
}

+ (unint64_t)getTaskPeriodSeconds
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = kSecondsIn4Hours;
  id v3 = +[_DPStrings submissionServiceDomainName];
  id v4 = +[_DPStrings tokenRefreshHoursKeyName];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:v3];
  uint64_t v6 = v5;
  if (!v5)
  {
    uint64_t v8 = +[_DPLog framework];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412546;
      v14 = v3;
      __int16 v15 = 2048;
      unint64_t v16 = v2;
      uint64_t v9 = "No defaults in %@, using default token fresh interval of %lu seconds";
      uint64_t v10 = v8;
      uint32_t v11 = 22;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v7 = [v5 integerForKey:v4];
  if (v7 >= 1)
  {
    unint64_t v2 = 3600 * v7;
    uint64_t v8 = +[_DPLog framework];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412802;
      v14 = v3;
      __int16 v15 = 2112;
      unint64_t v16 = (unint64_t)v4;
      __int16 v17 = 2048;
      unint64_t v18 = v2;
      uint64_t v9 = "Using value from %@.%@ to refresh tokens every %ld seconds";
      uint64_t v10 = v8;
      uint32_t v11 = 32;
LABEL_7:
      _os_log_impl(&dword_1DC55E000, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v13, v11);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:

  return v2;
}

- (NSString)taskName
{
  return self->_taskName;
}

- (unint64_t)taskPeriodSeconds
{
  return self->_taskPeriodSeconds;
}

- (void)setTaskPeriodSeconds:(unint64_t)a3
{
  self->_taskPeriodSeconds = a3;
}

- (void).cxx_destruct
{
}

@end