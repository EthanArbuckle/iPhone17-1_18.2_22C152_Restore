@interface NSObject(CPLArchiver)
+ (Class)classForStoredClassName:()CPLArchiver forCPLArchiver:;
- (NSString)storedClassNameForCPLArchiver:()CPLArchiver;
- (id)plistArchiveWithCPLArchiver:()CPLArchiver;
- (void)initWithCPLArchiver:()CPLArchiver;
@end

@implementation NSObject(CPLArchiver)

- (void)initWithCPLArchiver:()CPLArchiver
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      v9 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = objc_opt_class();
        uint64_t v11 = v5[2];
        *(_DWORD *)buf = 138412546;
        v16 = v10;
        __int16 v17 = 2112;
        uint64_t v18 = v11;
        id v12 = v10;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "Invalid object properties dictionary. Found %@ in archive: '%@'", buf, 0x16u);
      }
    }
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
    [v13 handleFailureInMethod:a2, a1, v14, 992, @"Invalid object properties dictionary. Found %@ in archive: '%@'", objc_opt_class(), v5[2] object file lineNumber description];

    abort();
  }
  v6 = (void *)[a1 init];
  v7 = v6;
  if (v6) {
    [v6 cplDecodePropertiesFromCoder:v5];
  }

  return v7;
}

- (id)plistArchiveWithCPLArchiver:()CPLArchiver
{
  v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = v5[2];
  objc_storeStrong(v5 + 2, v6);
  [a1 cplEncodePropertiesWithCoder:v5];
  id v8 = v5[2];
  v5[2] = v7;
  id v9 = v7;

  return v6;
}

- (NSString)storedClassNameForCPLArchiver:()CPLArchiver
{
  v1 = (objc_class *)[a1 classForCoder];
  return NSStringFromClass(v1);
}

+ (Class)classForStoredClassName:()CPLArchiver forCPLArchiver:
{
  return NSClassFromString(aClassName);
}

@end