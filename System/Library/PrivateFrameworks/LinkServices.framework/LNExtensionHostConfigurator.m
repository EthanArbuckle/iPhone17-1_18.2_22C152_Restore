@interface LNExtensionHostConfigurator
+ (id)extensionIdentityWithExtensionPointIdentifier:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5;
+ (id)extensionProcessWithExtensionRecord:(id)a3 extensionType:(int64_t *)a4 error:(id *)a5;
@end

@implementation LNExtensionHostConfigurator

+ (id)extensionProcessWithExtensionRecord:(id)a3 extensionType:(int64_t *)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!v9)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"LNExtensionHostConfigurator.m", 21, @"Invalid parameter not satisfying: %@", @"extensionRecord" object file lineNumber description];
  }
  v10 = [v9 extensionPointRecord];
  v11 = [v10 identifier];

  if ([v11 isEqualToString:@"com.apple.appintents-extension"]) {
    *a4 = 0;
  }
  if ([v11 isEqualToString:@"com.apple.widgetkit-extension"])
  {
    v12 = 0;
    *a4 = 1;
  }
  else if (a4)
  {
    v13 = [v9 bundleIdentifier];
    v14 = [a1 extensionIdentityWithExtensionPointIdentifier:v11 bundleIdentifier:v13 error:a5];

    if (v14)
    {
      v15 = (void *)[objc_alloc(MEMORY[0x1E4F25870]) initWithExtensionIdentity:v14];
      v12 = [MEMORY[0x1E4F25868] extensionProcessWithConfiguration:v15 error:a5];
    }
    else
    {
      v17 = getLNLogCategoryConnection();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = *a5;
        *(_DWORD *)buf = 138543362;
        id v22 = v18;
        _os_log_impl(&dword_1A4419000, v17, OS_LOG_TYPE_ERROR, "Unable to create extension identity: %{public}@", buf, 0xCu);
      }

      v12 = 0;
    }
  }
  else
  {
    v16 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v22 = v11;
      _os_log_impl(&dword_1A4419000, v16, OS_LOG_TYPE_ERROR, "Unsupported extension point identifier %{public}@", buf, 0xCu);
    }

    v12 = 0;
  }

  return v12;
}

+ (id)extensionIdentityWithExtensionPointIdentifier:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc(MEMORY[0x1E4F25880]);
  v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"bundleIdentifier = %@", v8];
  v11 = (void *)[v9 initWithExtensionPointIdentifier:v7 predicate:v10];

  v12 = [MEMORY[0x1E4F25888] executeQuery:v11];
  if ([v12 count])
  {
    if ((unint64_t)[v12 count] >= 2)
    {
      v13 = getLNLogCategoryConnection();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = [v12 firstObject];
        v15 = [v14 url];
        *(_DWORD *)buf = 138412546;
        id v21 = v8;
        __int16 v22 = 2112;
        uint64_t v23 = v15;
      }
    }
    a5 = [v12 firstObject];
  }
  else if (a5)
  {
    v16 = (void *)MEMORY[0x1E4F28C58];
    v17 = uint64_t v24 = *MEMORY[0x1E4F28568];
    v25[0] = v17;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    *a5 = [v16 errorWithDomain:@"LNConnectionErrorDomain" code:1100 userInfo:v18];

    a5 = 0;
  }

  return a5;
}

@end