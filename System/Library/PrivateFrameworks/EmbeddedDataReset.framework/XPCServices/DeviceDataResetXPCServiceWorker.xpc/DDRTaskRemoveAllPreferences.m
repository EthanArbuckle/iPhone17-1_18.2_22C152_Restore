@interface DDRTaskRemoveAllPreferences
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)run;
@end

@implementation DDRTaskRemoveAllPreferences

- (void)run
{
  v2 = NSHomeDirectory();
  v3 = [v2 stringByAppendingPathComponent:@"Library"];
  v4 = [v3 stringByAppendingPathComponent:@"Preferences"];

  id v5 = v4;
  v6 = +[NSFileManager defaultManager];
  v18 = v5;
  v7 = [v6 contentsOfDirectoryAtPath:v5 error:0];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v14 = [v13 pathExtension];
        unsigned int v15 = [v14 isEqualToString:@"plist"];

        if (v15 && ([&off_100011738 containsObject:v13] & 1) == 0)
        {
          v16 = [v13 stringByDeletingPathExtension];
          v17 = +[NSUserDefaults standardUserDefaults];
          [v17 removePersistentDomainForName:v16];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  removeSubFiles(v18, &off_100011738);
}

- (double)estimatedTimeOfCompletion
{
  return 0.3;
}

- (id)identifier
{
  return @"com.apple.devicedatareset.removeAllPreferences";
}

@end