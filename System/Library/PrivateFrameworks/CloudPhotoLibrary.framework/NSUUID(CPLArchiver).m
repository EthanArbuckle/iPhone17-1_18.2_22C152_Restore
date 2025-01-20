@interface NSUUID(CPLArchiver)
- (uint64_t)initWithCPLArchiver:()CPLArchiver;
@end

@implementation NSUUID(CPLArchiver)

- (uint64_t)initWithCPLArchiver:()CPLArchiver
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      v8 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = objc_opt_class();
        uint64_t v10 = v5[2];
        *(_DWORD *)buf = 138412546;
        v15 = v9;
        __int16 v16 = 2112;
        uint64_t v17 = v10;
        id v11 = v9;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_ERROR, "Incorrect string for NSUUID. Found %@: '%@'", buf, 0x16u);
      }
    }
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
    [v12 handleFailureInMethod:a2, a1, v13, 1097, @"Incorrect string for NSUUID. Found %@: '%@'", objc_opt_class(), v5[2] object file lineNumber description];

    abort();
  }
  uint64_t v6 = [a1 initWithUUIDString:v5[2]];

  return v6;
}

@end