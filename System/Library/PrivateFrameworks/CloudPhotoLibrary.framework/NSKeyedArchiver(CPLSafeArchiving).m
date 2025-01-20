@interface NSKeyedArchiver(CPLSafeArchiving)
+ (id)cpl_archivedDataWithRootObject:()CPLSafeArchiving;
@end

@implementation NSKeyedArchiver(CPLSafeArchiving)

+ (id)cpl_archivedDataWithRootObject:()CPLSafeArchiving
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v9 = 0;
  v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v9];
  id v5 = v9;
  if (v4) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = _CPLSilentLogging == 0;
  }
  if (v6)
  {
    v7 = __CPLArchiverOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v11 = v3;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "Failed to create archiver for %@: %@", buf, 0x16u);
    }
  }
  return v4;
}

@end