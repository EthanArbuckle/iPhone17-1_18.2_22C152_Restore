@interface PBCodable(CPLArchiver)
- (id)plistArchiveWithCPLArchiver:()CPLArchiver;
- (uint64_t)initWithCPLArchiver:()CPLArchiver;
@end

@implementation PBCodable(CPLArchiver)

- (uint64_t)initWithCPLArchiver:()CPLArchiver
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      v9 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = (objc_class *)objc_opt_class();
        v11 = NSStringFromClass(v10);
        v12 = objc_opt_class();
        uint64_t v13 = v5[2];
        *(_DWORD *)buf = 138412802;
        v20 = v11;
        __int16 v21 = 2112;
        v22 = v12;
        __int16 v23 = 2112;
        uint64_t v24 = v13;
        id v14 = v12;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "Incorrect string for %@. Found %@: '%@'", buf, 0x20u);
      }
    }
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    [v15 handleFailureInMethod:a2, a1, v16, 1347, @"Incorrect string for %@. Found %@: '%@'", v18, objc_opt_class(), v5[2] object file lineNumber description];

    abort();
  }
  v6 = [v5 _decodeKey:@"data" class:objc_opt_class() inDictionary:v5[2]];
  uint64_t v7 = [a1 initWithData:v6];

  return v7;
}

- (id)plistArchiveWithCPLArchiver:()CPLArchiver
{
  v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v7 = [a1 data];
  v8 = [v5 _encodeKey:@"data"];

  [v6 setObject:v7 forKeyedSubscript:v8];
  return v6;
}

@end