@interface NSArray(CPLArchiver)
- (id)initWithCPLArchiver:()CPLArchiver;
- (id)plistArchiveWithCPLArchiver:()CPLArchiver;
@end

@implementation NSArray(CPLArchiver)

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
    [v15 handleFailureInMethod:a2, v6, v16, 1023, @"Invalid %@. Found %@ in archive: '%@'", v17, objc_opt_class(), v5[2] object file lineNumber description];

    abort();
  }
  id v7 = v5[2];

  return v7;
}

- (id)plistArchiveWithCPLArchiver:()CPLArchiver
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  if ([a1 count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
    id v6 = v4[2];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = a1;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "plistArchiveWithCPLArchiver:", v4, (void)v15);
          [v5 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    id v13 = v4[2];
    v4[2] = v6;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

@end