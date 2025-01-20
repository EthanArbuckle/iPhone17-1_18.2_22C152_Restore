@interface NSBundle(UserNotifications)
+ (id)userNotificationsBundleWithIdentifier:()UserNotifications;
@end

@implementation NSBundle(UserNotifications)

+ (id)userNotificationsBundleWithIdentifier:()UserNotifications
{
  v37[3] = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  if (v29)
  {
    v5 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
    unint64_t v6 = 0x1E4F1C000uLL;
    if (UNIsInternalInstall())
    {
      v7 = NSString;
      v8 = BSSystemRootDirectory();
      v37[0] = v8;
      v37[1] = @"AppleInternal";
      v37[2] = @"Library";
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:3];
      v10 = [v7 pathWithComponents:v9];
      uint64_t v11 = [v5 arrayByAddingObject:v10];

      v5 = (void *)v11;
    }
    v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v13 = v5;
    v14 = (void *)[v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v32;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          v18 = (void *)MEMORY[0x1E4F1CB10];
          v19 = BSSystemRootDirectory();
          v35[0] = v19;
          v35[1] = v17;
          v35[2] = @"UserNotifications";
          v35[3] = @"Bundles";
          v20 = [v29 stringByAppendingPathExtension:@"bundle"];
          v35[4] = v20;
          unint64_t v21 = v6;
          v22 = [*(id *)(v6 + 2424) arrayWithObjects:v35 count:5];
          v23 = [v18 fileURLWithPathComponents:v22];

          unsigned __int8 v30 = 0;
          v24 = [v23 path];
          LODWORD(v20) = [v12 fileExistsAtPath:v24 isDirectory:&v30];
          int v25 = v30;

          if (v20) {
            BOOL v26 = v25 == 0;
          }
          else {
            BOOL v26 = 1;
          }
          if (!v26)
          {
            v14 = [MEMORY[0x1E4F28B50] bundleWithURL:v23];

            goto LABEL_16;
          }

          unint64_t v6 = v21;
        }
        v14 = (void *)[v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v14);
    }
LABEL_16:
  }
  else
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, a1, @"NSBundle+UserNotifications.m", 18, @"Invalid parameter not satisfying: %@", @"identifier != nil" object file lineNumber description];

    v14 = 0;
  }

  return v14;
}

@end