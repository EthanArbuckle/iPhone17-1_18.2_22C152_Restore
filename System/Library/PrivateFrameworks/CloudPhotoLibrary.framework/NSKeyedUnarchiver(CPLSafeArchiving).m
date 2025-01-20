@interface NSKeyedUnarchiver(CPLSafeArchiving)
+ (id)cpl_safeUnarchiveObjectWithData:()CPLSafeArchiving class:;
+ (id)cpl_safeUnarchiveObjectWithData:()CPLSafeArchiving classes:;
@end

@implementation NSKeyedUnarchiver(CPLSafeArchiving)

+ (id)cpl_safeUnarchiveObjectWithData:()CPLSafeArchiving classes:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v17 = 0;
    v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v6 fromData:v5 error:&v17];
    id v8 = v17;
    if (v7) {
      BOOL v9 = 0;
    }
    else {
      BOOL v9 = _CPLSilentLogging == 0;
    }
    if (v9)
    {
      v10 = __CPLArchiverOSLogDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = [v6 allObjects];
        v12 = [v11 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 138543618;
        v19 = v12;
        __int16 v20 = 2112;
        id v21 = v8;
        _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Data for (%{public}@) was corrupt: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      v13 = __CPLArchiverOSLogDomain();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = [v6 allObjects];
        v15 = [v14 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 138543362;
        v19 = v15;
        _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_ERROR, "Trying to deserialize (%{public}@) with a nil data", buf, 0xCu);
      }
    }
    v7 = 0;
  }

  return v7;
}

+ (id)cpl_safeUnarchiveObjectWithData:()CPLSafeArchiving class:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v12 = 0;
    id v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:a4 fromData:v5 error:&v12];
    id v7 = v12;
    if (v6) {
      BOOL v8 = 0;
    }
    else {
      BOOL v8 = _CPLSilentLogging == 0;
    }
    if (v8)
    {
      BOOL v9 = __CPLArchiverOSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v14 = a4;
        __int16 v15 = 2112;
        id v16 = v7;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "Data for %{public}@ was corrupt: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      v10 = __CPLArchiverOSLogDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v14 = a4;
        _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Trying to deserialize %{public}@ with a nil data", buf, 0xCu);
      }
    }
    id v6 = 0;
  }

  return v6;
}

@end