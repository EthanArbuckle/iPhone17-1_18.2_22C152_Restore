@interface MCMContainerClassStagingPath
+ (id)_globalStagingComponent;
+ (id)_stagingComponent;
+ (id)containerPathForUserIdentity:(id)a3 containerClass:(unint64_t)a4;
+ (id)stagingGlobalURL;
+ (id)stagingURLWithUserIdentity:(id)a3;
@end

@implementation MCMContainerClassStagingPath

+ (id)_stagingComponent
{
  return @"Staging";
}

+ (id)_globalStagingComponent
{
  return @"Staging";
}

+ (id)stagingURLWithUserIdentity:(id)a3
{
  v4 = [a1 _baseURLForUserIdentity:a3];
  v5 = [a1 _stagingComponent];
  v6 = [v4 URLByAppendingPathComponent:v5 isDirectory:1];

  return v6;
}

+ (id)stagingGlobalURL
{
  id v3 = containermanager_copy_global_configuration();
  v4 = [v3 managedPathRegistry];
  v5 = [v4 containermanagerCaches];

  v6 = [v5 url];
  v7 = [a1 _globalStagingComponent];
  v8 = [v6 URLByAppendingPathComponent:v7 isDirectory:1];

  return v8;
}

+ (id)containerPathForUserIdentity:(id)a3 containerClass:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 posixUser];
  v8 = [a1 posixOwnerForContainerClass:a4 user:v7];

  uint64_t v9 = [a1 _modeForContainerClass:a4];
  id v10 = containermanager_copy_global_configuration();
  int v11 = [v10 isGlobalContainerClass:a4];

  if (v11)
  {
    uint64_t v12 = [a1 stagingGlobalURL];
LABEL_5:
    v13 = (void *)v12;
    goto LABEL_6;
  }
  if (v6)
  {
    uint64_t v12 = [a1 stagingURLWithUserIdentity:v6];
    goto LABEL_5;
  }
  v16 = container_log_handle_for_category();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v18 = a4;
    _os_log_fault_impl(&dword_1D7739000, v16, OS_LOG_TYPE_FAULT, "Container class [%llu] requires a user identity.", buf, 0xCu);
  }

  v13 = 0;
LABEL_6:
  v14 = (void *)[objc_alloc((Class)a1) initWithBaseURL:v13 categoryComponent:0 classComponent:0 containerClass:a4 POSIXOwner:v8 POSIXMode:v9 userIdentity:v6];

  return v14;
}

@end