@interface DMEnvironment
+ (BOOL)isBuildVersion:(id)a3 equalToBuildVersion:(id)a4;
+ (id)sharedInstance;
- (BOOL)deviceModeIsSharediPad;
- (BOOL)implementMigrationPluginResults;
- (BOOL)isDeviceUsingEphemeralStorage;
- (BOOL)shouldImposePluginArtificialHang;
- (BOOL)shouldWatchdogPluginsAfterTimeout;
- (BOOL)suppressMigrationPluginWrapperExitMarkerPref;
- (BOOL)testMigrationInfrastructureOnly;
- (BOOL)userSessionIsLoginWindow;
- (BOOL)waitForExecutePluginsSignalMarkerPref;
- (id)buildVersion;
- (id)context;
- (id)contextPath;
- (id)continuousIntegrationMarkerPref;
- (id)lastBuildVersionPref;
- (id)lastMigrationResultsPref;
- (id)migrationPluginResultsPref;
- (id)migrationRebootCountPref;
- (id)userDataDispositionPref;
- (unint64_t)migrationRebootCount;
- (void)blockUntilPreferencesFlush;
- (void)clearContext;
- (void)setContext:(id)a3;
- (void)setLastBuildVersionPref:(id)a3;
- (void)setLastMigrationResultsPref:(id)a3;
- (void)setMigrationPluginResultsPref:(id)a3;
- (void)setMigrationRebootCount:(unint64_t)a3;
- (void)setMigrationRebootCountPref:(id)a3;
- (void)setTestMigrationInfrastructureOnly:(BOOL)a3;
- (void)setUserDataDispositionPref:(id)a3;
@end

@implementation DMEnvironment

- (id)userDataDispositionPref
{
  CFStringRef v2 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
  CFPreferencesSynchronize(@"com.apple.migration", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  v4 = (void *)CFPreferencesCopyValue(@"DMUserDataDisposition", @"com.apple.migration", v2, v3);

  return v4;
}

- (id)lastBuildVersionPref
{
  CFStringRef v2 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
  CFPreferencesSynchronize(@"com.apple.migration", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  v4 = (void *)CFPreferencesCopyValue(@"LastSystemVersion", @"com.apple.migration", v2, v3);

  return v4;
}

- (id)buildVersion
{
  CFDictionaryRef v2 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  if (v2)
  {
    CFDictionaryRef v3 = v2;
    v4 = objc_msgSend((id)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E4F1CD10]), "copy");
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  }
  CFDictionaryRef v2 = (void *)sharedInstance__sharedInstance;

  return v2;
}

+ (BOOL)isBuildVersion:(id)a3 equalToBuildVersion:(id)a4
{
  BOOL result = 0;
  if (a3)
  {
    if (a4) {
      return [a3 compare:a4 options:1] == 0;
    }
  }
  return result;
}

uint64_t __31__DMEnvironment_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance = objc_alloc_init(DMEnvironment);

  return MEMORY[0x1F41817F8]();
}

- (void)setLastBuildVersionPref:(id)a3
{
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
  CFPreferencesSetValue(@"LastSystemVersion", a3, @"com.apple.migration", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);

  CFPreferencesSynchronize(@"com.apple.migration", v3, v4);
}

- (id)lastMigrationResultsPref
{
  CFStringRef v2 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
  CFPreferencesSynchronize(@"com.apple.migration", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  CFStringRef v4 = (void *)CFPreferencesCopyValue(@"DMLastMigrationResults", @"com.apple.migration", v2, v3);

  return v4;
}

- (void)setLastMigrationResultsPref:(id)a3
{
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
  CFPreferencesSetValue(@"DMLastMigrationResults", a3, @"com.apple.migration", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);

  CFPreferencesSynchronize(@"com.apple.migration", v3, v4);
}

- (void)setUserDataDispositionPref:(id)a3
{
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
  CFPreferencesSetValue(@"DMUserDataDisposition", a3, @"com.apple.migration", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);

  CFPreferencesSynchronize(@"com.apple.migration", v3, v4);
}

- (id)continuousIntegrationMarkerPref
{
  CFPreferencesAppSynchronize(@"com.apple.migration");
  CFStringRef v2 = (void *)CFPreferencesCopyAppValue(@"com.apple.datamigrator.continuous-integration", @"com.apple.migration");

  return v2;
}

- (BOOL)waitForExecutePluginsSignalMarkerPref
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(@"com.apple.migration");
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"DMWaitForExecutePluginsSignal", @"com.apple.migration", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (BOOL)suppressMigrationPluginWrapperExitMarkerPref
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(@"com.apple.migration");
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"DMSuppressMigrationPluginWrapperExit", @"com.apple.migration", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (BOOL)implementMigrationPluginResults
{
  return 0;
}

- (id)migrationPluginResultsPref
{
  CFStringRef v2 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
  CFPreferencesSynchronize(@"com.apple.migration", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  CFStringRef v4 = (void *)CFPreferencesCopyValue(@"DMMigrationPluginResults", @"com.apple.migration", v2, v3);

  return v4;
}

- (void)setMigrationPluginResultsPref:(id)a3
{
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
  CFPreferencesSetValue(@"DMMigrationPluginResults", a3, @"com.apple.migration", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);

  CFPreferencesSynchronize(@"com.apple.migration", v3, v4);
}

- (BOOL)isDeviceUsingEphemeralStorage
{
  return MEMORY[0x1F40CD670]("com.apple.migration", a2);
}

- (void)blockUntilPreferencesFlush
{
}

- (BOOL)deviceModeIsSharediPad
{
  CFStringRef v3 = (void *)MKBUserTypeDeviceMode();
  _DMLogFunc(v2, 7, @"MKBUserTypeDeviceMode returned error %@ result %@");
  CFStringRef v4 = objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E4F78100], 0, v3);
  char v5 = [v4 isEqualToString:*MEMORY[0x1E4F78110]];

  return v5;
}

- (BOOL)userSessionIsLoginWindow
{
  uint64_t IsLoginWindow = MKBUserSessionIsLoginWindow();
  char v5 = [NSNumber numberWithBool:IsLoginWindow];
  _DMLogFunc(v2, 7, @"MKBUserSessionIsLoginWindow returned error %@ result %@");

  return IsLoginWindow;
}

- (BOOL)shouldWatchdogPluginsAfterTimeout
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(@"com.apple.migration");
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"DMWatchdogPluginsAfterTimeout", @"com.apple.migration", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 0;
  }
  return !v3;
}

- (unint64_t)migrationRebootCount
{
  BOOL v3 = [(DMEnvironment *)self migrationRebootCountPref];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFStringRef v4 = [(DMEnvironment *)self buildVersion];
    char v5 = objc_msgSend(v3, "dm_migrationRebootCountPref_buildVersion");
    BOOL v6 = +[DMEnvironment isBuildVersion:v4 equalToBuildVersion:v5];

    if (v6) {
      unint64_t v7 = objc_msgSend(v3, "dm_migrationRebootCountPref_rebootCount");
    }
    else {
      unint64_t v7 = 0;
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (void)setMigrationRebootCount:(unint64_t)a3
{
  char v5 = (void *)MEMORY[0x1E4F1C9E8];
  BOOL v6 = [(DMEnvironment *)self buildVersion];
  unint64_t v7 = objc_msgSend(v5, "dm_migrationRebootCountPrefWithRebootCount:buildVersion:", a3, v6);
  [(DMEnvironment *)self setMigrationRebootCountPref:v7];

  [(DMEnvironment *)self blockUntilPreferencesFlush];
}

- (id)migrationRebootCountPref
{
  CFStringRef v2 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
  CFPreferencesSynchronize(@"com.apple.migration", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  CFStringRef v4 = (void *)CFPreferencesCopyValue(@"DMMigrationRebootCount", @"com.apple.migration", v2, v3);

  return v4;
}

- (void)setMigrationRebootCountPref:(id)a3
{
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
  CFPreferencesSetValue(@"DMMigrationRebootCount", a3, @"com.apple.migration", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);

  CFPreferencesSynchronize(@"com.apple.migration", v3, v4);
}

- (BOOL)shouldImposePluginArtificialHang
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(@"com.apple.migration");
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"DMImposePluginArtificialHang", @"com.apple.migration", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (BOOL)testMigrationInfrastructureOnly
{
  return self->_testMigrationInfrastructureOnly;
}

- (void)setTestMigrationInfrastructureOnly:(BOOL)a3
{
  self->_testMigrationInfrastructureOnly = a3;
}

- (id)contextPath
{
  return @"/var/mobile/Library/Preferences/com.apple.DataMigration.plist";
}

- (id)context
{
  if (DMContextPath_onceToken != -1) {
    dispatch_once(&DMContextPath_onceToken, &__block_literal_global_2);
  }
  CFURLRef v2 = CFURLCreateWithFileSystemPath(0, (CFStringRef)DMContextPath_retval, kCFURLPOSIXPathStyle, 0);
  if (v2)
  {
    CFURLRef v3 = v2;
    CFStringRef v4 = CFReadStreamCreateWithFile(0, v2);
    if (v4)
    {
      char v5 = v4;
      if (CFReadStreamOpen(v4))
      {
        CFPropertyListRef v6 = CFPropertyListCreateWithStream(0, v5, 0, 0, 0, 0);
        unint64_t v7 = (void *)v6;
        if (v6)
        {
          CFTypeID v8 = CFGetTypeID(v6);
          if (v8 != CFDictionaryGetTypeID())
          {
            CFRelease(v7);
            unint64_t v7 = 0;
          }
        }
        CFReadStreamClose(v5);
      }
      else
      {
        unint64_t v7 = 0;
      }
      CFRelease(v5);
    }
    else
    {
      unint64_t v7 = 0;
    }
    CFRelease(v3);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (void)setContext:(id)a3
{
  id propertyList = a3;
  _DMLogFunc(v3, 7, @"Setting context to %@");
  CFStringRef v4 = getpwnam("mobile");
  if (!v4)
  {
    v11 = @"Couldn't get user info for the mobile user";
LABEL_16:
    _DMLogFunc(v3, 3, v11);
    goto LABEL_23;
  }
  char v5 = v4;
  if (DMContextPath_onceToken != -1) {
    dispatch_once(&DMContextPath_onceToken, &__block_literal_global_2);
  }
  CFURLRef v6 = CFURLCreateWithFileSystemPath(0, (CFStringRef)DMContextPath_retval, kCFURLPOSIXPathStyle, 0);
  if (!v6)
  {
    if (DMContextPath_onceToken != -1) {
      dispatch_once(&DMContextPath_onceToken, &__block_literal_global_2);
    }
    v11 = @"Couldn't create a URL for the path %@";
    goto LABEL_16;
  }
  CFURLRef v7 = v6;
  CFTypeID v8 = CFWriteStreamCreateWithFile(0, v6);
  if (v8)
  {
    v9 = v8;
    if (CFWriteStreamOpen(v8))
    {
      if (!CFPropertyListWrite(propertyList, v9, kCFPropertyListBinaryFormat_v1_0, 0, 0)) {
        _DMLogFunc(v3, 3, @"Error writing context property list to stream.");
      }
      if (chown("/var/mobile/Library/Preferences/com.apple.DataMigration.plist", v5->pw_uid, v5->pw_gid))
      {
        v10 = __error();
        strerror(*v10);
        _DMLogFunc(v3, 3, @"Couldn't chown the preferences file to the mobile user: %s");
      }
      CFWriteStreamClose(v9);
    }
    else
    {
      CFErrorRef v12 = CFWriteStreamCopyError(v9);
      _DMLogFunc(v3, 3, @"Couldn't open the stream at %@: %@");
      if (v12) {
        CFRelease(v12);
      }
    }
  }
  else
  {
    v9 = CFWriteStreamCopyError(0);
    _DMLogFunc(v3, 3, @"Couldn't create a stream for the file at %@: %@");
    if (!v9) {
      goto LABEL_22;
    }
  }
  CFRelease(v9);
LABEL_22:
  CFRelease(v7);
LABEL_23:
}

- (void)clearContext
{
  if (DMContextPathCStr_onceToken != -1) {
    dispatch_once(&DMContextPathCStr_onceToken, &__block_literal_global_38);
  }
  if (unlink((const char *)DMContextPathCStr_retval))
  {
    id v3 = [NSNumber numberWithInt:*__error()];
    if (DMContextPathCStr_onceToken != -1) {
      dispatch_once(&DMContextPathCStr_onceToken, &__block_literal_global_38);
    }
    _DMLogFunc(v2, 3, @"clearContext failed with errno %@ for path '%s'");
  }
  else
  {
    if (DMContextPathCStr_onceToken != -1) {
      dispatch_once(&DMContextPathCStr_onceToken, &__block_literal_global_38);
    }
    _DMLogFunc(v2, 7, @"clearContext succeeded for path '%s'");
  }
}

@end