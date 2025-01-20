@interface MCMContainerClassBackupPath
+ (id)systemContainerBackupBaseDirectoryWithUserIdentity:(id)a3;
+ (id)systemContainerBackupDirectoryWithUserIdentity:(id)a3;
+ (id)systemGroupContainerBackupDirectoryWithUserIdentity:(id)a3;
@end

@implementation MCMContainerClassBackupPath

+ (id)systemGroupContainerBackupDirectoryWithUserIdentity:(id)a3
{
  v3 = [a1 systemContainerBackupBaseDirectoryWithUserIdentity:a3];
  v4 = [v3 URLByAppendingPathComponent:@"Shared" isDirectory:1];

  return v4;
}

+ (id)systemContainerBackupDirectoryWithUserIdentity:(id)a3
{
  v3 = [a1 systemContainerBackupBaseDirectoryWithUserIdentity:a3];
  v4 = [v3 URLByAppendingPathComponent:@"Data" isDirectory:1];

  return v4;
}

+ (id)systemContainerBackupBaseDirectoryWithUserIdentity:(id)a3
{
  id v3 = a3;
  id v4 = containermanager_copy_global_configuration();
  int v5 = [v4 systemContainerMode];

  if (v5 == 1)
  {
    id v6 = containermanager_copy_global_configuration();
    v7 = [v6 defaultUser];
    v8 = [v7 homeDirectoryURL];

    if (_os_feature_enabled_impl())
    {
      id v9 = containermanager_copy_global_configuration();
      v10 = [v9 currentUser];
      uint64_t v11 = [v10 homeDirectoryURL];

      v8 = (void *)v11;
    }
  }
  else
  {
    v8 = [v3 homeDirectoryURL];
  }
  v12 = [v8 URLByAppendingPathComponent:@"Library/Backup/SystemContainers" isDirectory:1];

  return v12;
}

@end