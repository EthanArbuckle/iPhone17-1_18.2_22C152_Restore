@interface CloudDocsDiagnosticExtension
- (BOOL)_backupDatabaseWithSession:(id)a3 toOutputPath:(id)a4;
- (BOOL)_dumpDatabaseToOutputPath:(id)a3;
- (BOOL)_dumpSpotlightJournalToOutputPath:(id)a3;
- (BOOL)_getConfigureLogsParam:(id)a3 configureLogs:(BOOL *)a4;
- (id)attachmentsForParameters:(id)a3;
- (id)computeHomeDirPathForAccount:(id)a3;
- (void)_enableLogSensitiveData:(BOOL)a3;
@end

@implementation CloudDocsDiagnosticExtension

- (BOOL)_getConfigureLogsParam:(id)a3 configureLogs:(BOOL *)a4
{
  BOOL v4 = 0;
  if (a3 && a4)
  {
    v6 = [a3 objectForKey:@"configure_logs"];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      *a4 = [v6 BOOLValue];
      BOOL v4 = 1;
    }
    else
    {
      v7 = brc_bread_crumbs();
      v8 = brc_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_100002948();
      }

      BOOL v4 = 0;
    }
  }
  return v4;
}

- (void)_enableLogSensitiveData:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = brc_bread_crumbs();
  v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000029B0(v3, (uint64_t)v4, v5);
  }

  if (v3) {
    v6 = &off_100004408;
  }
  else {
    v6 = 0;
  }
  CFPreferencesSetValue(@"com.apple.fileprovider.log-sensitive-data", v6, kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  CFPreferencesSynchronize(kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
}

- (id)computeHomeDirPathForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NSProcessInfo processInfo];
  v5 = [v4 environment];

  if (geteuid() || ([v3 isDataSeparated] & 1) != 0)
  {
    v6 = +[NSString br_currentHomeDir];
    if (v6) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  v9 = [v5 objectForKeyedSubscript:@"HOME"];
  v6 = NSHomeDirectoryForUser(@"mobile");

  if (!v6)
  {
LABEL_4:
    id v7 = [v3 accountIdentifier];
    printf("couldn't get home path for account %s\n", (const char *)[v7 UTF8String]);
  }
LABEL_5:

  return v6;
}

- (id)attachmentsForParameters:(id)a3
{
  id v16 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_100001E38;
  v30 = sub_100001E48;
  id v31 = +[NSMutableArray array];
  v18 = NSTemporaryDirectory();
  id v3 = brc_bread_crumbs();
  BOOL v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100002AB8();
  }

  char v25 = 0;
  unsigned int v5 = [(CloudDocsDiagnosticExtension *)self _getConfigureLogsParam:v16 configureLogs:&v25];
  unsigned int v6 = v5;
  if (v25) {
    unsigned int v7 = v5;
  }
  else {
    unsigned int v7 = 0;
  }
  if (v7 == 1)
  {
    v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100002A40((uint64_t)v8, v9);
    }

    [(CloudDocsDiagnosticExtension *)self _enableLogSensitiveData:1];
    id v10 = (id)v27[5];
  }
  else
  {
    +[BRAccountDescriptor allLoggedInAccountDescriptors];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = (char *)[obj countByEnumeratingWithState:&v21 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(obj);
          }
          id v20 = v18;
          BRPerformWithAccountDescriptorAndError();
        }
        v11 = (char *)[obj countByEnumeratingWithState:&v21 objects:v32 count:16];
      }
      while (v11);
    }

    if (v6) {
      [(CloudDocsDiagnosticExtension *)self _enableLogSensitiveData:0];
    }
    id v10 = (id)v27[5];
  }
  _Block_object_dispose(&v26, 8);

  return v10;
}

- (BOOL)_backupDatabaseWithSession:(id)a3 toOutputPath:(id)a4
{
  id v5 = a3;
  unsigned int v6 = +[NSURL fileURLWithPath:a4];
  id v11 = 0;
  unsigned __int8 v7 = [v5 backupDatabaseToURL:v6 error:&v11];

  id v8 = v11;
  if ((v7 & 1) == 0)
  {
    id v9 = [v8 description];
    syslog(3, "unable to backup databases; %s", (const char *)[v9 UTF8String]);
  }
  return v7;
}

- (BOOL)_dumpDatabaseToOutputPath:(id)a3
{
  id v3 = a3;
  uint64_t v4 = open((const char *)[v3 fileSystemRepresentation], 525, 420);
  if ((v4 & 0x80000000) != 0)
  {
    id v5 = (const char *)[v3 fileSystemRepresentation];
    unsigned int v6 = __error();
    unsigned __int8 v7 = strerror(*v6);
    syslog(3, "unable open file at path %s; %s", v5, v7);
  }
  id v8 = [objc_alloc((Class)NSFileHandle) initWithFileDescriptor:v4 closeOnDealloc:1];
  id v9 = dispatch_group_create();
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  dispatch_group_enter(v9);
  id v10 = v9;
  BRDumpDatabaseToFileHandle();
  dispatch_time_t v11 = dispatch_time(0, 30000000000);
  if (dispatch_group_wait(v10, v11)) {
    syslog(3, "unable to dump database; timeout");
  }
  char v12 = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v12;
}

- (BOOL)_dumpSpotlightJournalToOutputPath:(id)a3
{
  id v3 = a3;
  uint64_t v4 = fopen((const char *)[v3 fileSystemRepresentation], "w");
  if (v4)
  {
    id v5 = [@"~/Library" stringByExpandingTildeInPath];
    id v6 = [v5 stringByAppendingPathComponent:@"Spotlight/CoreSpotlight/NSFileProtectionCompleteUntilFirstUserAuthentication/index.spotlightV2/activityJournal.1"];
    [v6 fileSystemRepresentation];
    BRActivityDump();
    fclose(v4);
  }
  else
  {
    unsigned __int8 v7 = (const char *)[v3 fileSystemRepresentation];
    id v8 = __error();
    id v9 = strerror(*v8);
    syslog(3, "unable to dump spotlight journal at %s: %s", v7, v9);
  }

  return v4 != 0;
}

@end