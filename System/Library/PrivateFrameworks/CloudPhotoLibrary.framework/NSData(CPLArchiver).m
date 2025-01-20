@interface NSData(CPLArchiver)
- (id)initWithCPLArchiver:()CPLArchiver;
- (id)plistArchiveWithCPLArchiver:()CPLArchiver;
@end

@implementation NSData(CPLArchiver)

- (id)initWithCPLArchiver:()CPLArchiver
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v5 = a3;
  v6 = (void *)[a1 init];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      v9 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = objc_opt_class();
        id v11 = v10;
        v12 = objc_opt_class();
        id v13 = v5[2];
        *(_DWORD *)buf = 138412802;
        v19 = v10;
        __int16 v20 = 2112;
        v21 = v12;
        __int16 v22 = 2112;
        id v23 = v13;
        id v14 = v12;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "Invalid %@. Found %@ in archive: '%@'", buf, 0x20u);
      }
    }
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
    uint64_t v17 = objc_opt_class();
    [v15 handleFailureInMethod:a2, v6, v16, 1066, @"Invalid %@. Found %@ in archive: '%@'", v17, objc_opt_class(), v5[2] object file lineNumber description];

    abort();
  }
  id v7 = v5[2];

  return v7;
}

- (id)plistArchiveWithCPLArchiver:()CPLArchiver
{
  if ([a3 forDisplay])
  {
    id v4 = [a1 base64EncodedStringWithOptions:0];
  }
  else
  {
    id v4 = a1;
  }
  return v4;
}

@end