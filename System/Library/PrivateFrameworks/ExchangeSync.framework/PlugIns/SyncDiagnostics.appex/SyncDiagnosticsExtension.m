@interface SyncDiagnosticsExtension
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
- (void)_addDAManagedDefaults;
- (void)_removeDAManagedDefaults;
- (void)setupWithParameters:(id)a3;
- (void)teardownWithParameters:(id)a3;
@end

@implementation SyncDiagnosticsExtension

- (void)_addDAManagedDefaults
{
  CFStringRef v10 = @".GlobalPreferences";
  v2 = +[NSArray arrayWithObjects:&v10 count:1];
  v3 = +[NSMutableDictionary dictionaryWithContentsOfFile:@"/private/var/Managed Preferences/mobile/.GlobalPreferences.plist"];
  v4 = +[NSNumber numberWithBool:1, @"DADiagnosticsEnabled"];
  v9[0] = v4;
  v8[1] = @"DALogLevel";
  v5 = +[NSNumber numberWithInt:6];
  v9[1] = v5;
  v8[2] = @"DAOutputLevel";
  v6 = +[NSNumber numberWithInt:6];
  v9[2] = v6;
  v7 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  [v3 addEntriesFromDictionary:v7];
  _CFPreferencesWriteManagedDomainForUser();
  _CFPreferencesManagementStatusChangedForDomains();
  _CFPreferencesPostValuesChangedInDomains();
}

- (void)_removeDAManagedDefaults
{
  v16[0] = @"DADiagnosticsEnabled";
  v16[1] = @"DALogLevel";
  v16[2] = @"DAOutputLevel";
  v2 = +[NSArray arrayWithObjects:v16 count:3];
  CFStringRef v15 = @".GlobalPreferences";
  v3 = +[NSArray arrayWithObjects:&v15 count:1];
  v4 = +[NSMutableDictionary dictionaryWithContentsOfFile:@"/private/var/Managed Preferences/mobile/.GlobalPreferences.plist"];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v2;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "removeObjectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * (void)v9), (void)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  _CFPreferencesWriteManagedDomainForUser();
  _CFPreferencesManagementStatusChangedForDomains();
  _CFPreferencesPostValuesChangedInDomains();
}

- (void)setupWithParameters:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (v4 && [v4 count])
  {
    id v5 = [v6 objectForKey:@"hostAppString"];
    if ([v5 isEqualToString:@"Timberlorry"]) {
      [(SyncDiagnosticsExtension *)self _addDAManagedDefaults];
    }
  }
  else
  {
    [(SyncDiagnosticsExtension *)self _addDAManagedDefaults];
  }
}

- (void)teardownWithParameters:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (v4 && [v4 count])
  {
    id v5 = [v6 objectForKey:@"hostAppString"];
    if ([v5 isEqualToString:@"Timberlorry"]) {
      [(SyncDiagnosticsExtension *)self _removeDAManagedDefaults];
    }
  }
  else
  {
    [(SyncDiagnosticsExtension *)self _removeDAManagedDefaults];
  }
}

- (id)attachmentList
{
  uint64_t v2 = +[NSURL URLWithString:@"/private/var/mobile/Library/Logs/CrashReporter/DataAccess"];
  v3 = +[NSFileManager defaultManager];
  id v21 = 0;
  v16 = (void *)v2;
  id v4 = [v3 contentsOfDirectoryAtURL:v2 includingPropertiesForKeys:0 options:4 error:&v21];
  id v15 = v21;

  id v5 = +[NSMutableArray array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v12 = objc_msgSend(v11, "lastPathComponent", v15);
        if ([v12 containsString:@"ExchangeTraffic.com.apple."]
          && [v12 containsString:@"501_"])
        {
          long long v13 = +[DEAttachmentItem attachmentWithPathURL:v11];
          [v5 addObject:v13];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)attachmentsForParameters:(id)a3
{
  return [(SyncDiagnosticsExtension *)self attachmentList];
}

@end