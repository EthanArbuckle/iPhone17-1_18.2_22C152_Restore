@interface FBApplicationProcess
+ (id)_internalDebugEnvironmentVariables;
- (BOOL)isApplicationProcess;
- (BOOL)isConnectedToExternalAccessory;
- (BOOL)isNowPlayingWithAudio;
- (BOOL)isRecordingAudio;
- (double)elapsedCPUTime;
- (id)_createBootstrapContext;
- (void)_bootstrapDidComplete;
- (void)_finishInit;
- (void)killForReason:(int64_t)a3 andReport:(BOOL)a4 withDescription:(id)a5;
- (void)setConnectedToExternalAccessory:(BOOL)a3;
- (void)setNowPlayingWithAudio:(BOOL)a3;
- (void)setRecordingAudio:(BOOL)a3;
@end

@implementation FBApplicationProcess

- (BOOL)isApplicationProcess
{
  return 1;
}

- (void)_finishInit
{
  if (![(FBProcessExecutionContext *)self->super._executionContext launchIntent])
  {
    int pid = self->super._pid;
    if (pid != getpid())
    {
      executionContext = self->super._executionContext;
      if (executionContext) { {
        v5 = (FBMutableProcessExecutionContext *)[(FBProcessExecutionContext *)executionContext mutableCopy];
      }
      }
      else {
        v5 = objc_alloc_init(FBMutableProcessExecutionContext);
      }
      v6 = v5;
      [(FBProcessExecutionContext *)v5 setLaunchIntent:2];
      v7 = (FBProcessExecutionContext *)[(FBMutableProcessExecutionContext *)v6 copy];
      v8 = self->super._executionContext;
      self->super._executionContext = v7;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)FBApplicationProcess;
  [(FBProcess *)&v9 _finishInit];
}

- (id)_createBootstrapContext
{
  if ([(FBProcess *)self isCurrentProcess])
  {
    v20.receiver = self;
    v20.super_class = (Class)FBApplicationProcess;
    v3 = [(FBProcess *)&v20 _createBootstrapContext];
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)FBApplicationProcess;
    v3 = [(FBProcess *)&v19 _createBootstrapContext];
    v4 = [(FBProcess *)self executionContext];
    if (!self->super._rbsHandle)
    {
      v5 = [MEMORY[0x1E4F1CA60] dictionary];
      v6 = [MEMORY[0x1E4F62848] environmentAliases];
      v7 = [v6 environmentRepresentation];
      [v5 addEntriesFromDictionary:v7];

      v8 = [v4 environment];
      [v5 addEntriesFromDictionary:v8];

      objc_super v9 = +[FBApplicationProcess _internalDebugEnvironmentVariables];
      [v5 addEntriesFromDictionary:v9];

      v10 = [v4 arguments];
      v11 = [v4 standardOutputURL];
      v12 = [v11 path];

      v13 = [v4 standardErrorURL];
      v14 = [v13 path];

      unsigned int v15 = [v4 waitForDebugger];
      int v16 = [v4 disableASLR];
      [v3 setArguments:v10];
      if ([v5 count]) { {
        [v3 _setAdditionalEnvironment:v5];
      }
      }
      [v3 setStandardOutputPath:v12];
      [v3 setStandardErrorPath:v14];
      if (v16) { {
        uint64_t v17 = v15 | 2;
      }
      }
      else {
        uint64_t v17 = v15;
      }
      [v3 setExecutionOptions:v17];
    }
  }

  return v3;
}

- (void)_bootstrapDidComplete
{
  v3 = [(FBProcess *)self rbsHandle];
  if (v3)
  {
    v4 = [[FBProcessCPUStatistics alloc] initWithProcessHandle:v3];
    cpuStatistics = self->_cpuStatistics;
    self->_cpuStatistics = v4;
  }
  v6.receiver = self;
  v6.super_class = (Class)FBApplicationProcess;
  [(FBProcess *)&v6 _bootstrapDidComplete];
}

+ (id)_internalDebugEnvironmentVariables
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (CFPreferencesGetAppBooleanValue(@"FBMallocStackLogging", @"com.apple.frontboard", 0)
    || CFPreferencesGetAppBooleanValue(@"FBMallocStackLoggingAlways", @"com.apple.frontboard", 0))
  {
    [v2 setObject:@"1" forKey:@"MallocStackLogging"];
    CFPreferencesSetAppValue(@"FBMallocStackLogging", 0, @"com.apple.frontboard");
    int v3 = 1;
  }
  else
  {
    int v3 = 0;
  }
  if (CFPreferencesGetAppBooleanValue(@"FBMallocScribble", @"com.apple.frontboard", 0)
    || CFPreferencesGetAppBooleanValue(@"FBMallocScribbleAlways", @"com.apple.frontboard", 0))
  {
    [v2 setObject:@"1" forKey:@"MallocScribble"];
    CFPreferencesSetAppValue(@"FBMallocScribble", 0, @"com.apple.frontboard");
    int v3 = 1;
  }
  if (CFPreferencesGetAppBooleanValue(@"FBMallocGuardEdges", @"com.apple.frontboard", 0)
    || CFPreferencesGetAppBooleanValue(@"FBMallocGuardEdgesAlways", @"com.apple.frontboard", 0))
  {
    [v2 setObject:@"1" forKey:@"MallocGuardEdges"];
    CFPreferencesSetAppValue(@"FBMallocGuardEdges", 0, @"com.apple.frontboard");
    int v3 = 1;
  }
  if (CFPreferencesGetAppBooleanValue(@"FBMallocCheckHeap", @"com.apple.frontboard", 0)
    || CFPreferencesGetAppBooleanValue(@"FBMallocCheckHeapAlways", @"com.apple.frontboard", 0))
  {
    [v2 setObject:@"1" forKey:@"MallocCheckHeapStart"];
    [v2 setObject:@"1" forKey:@"MallocCheckHeapAbort"];
    [v2 setObject:@"1" forKey:@"MallocErrorAbort"];
    [v2 setObject:@"1" forKey:@"MallocScribble"];
    CFPreferencesSetAppValue(@"FBMallocCheckHeap", 0, @"com.apple.frontboard");
    int v3 = 1;
  }
  if (CFPreferencesGetAppBooleanValue(@"FBGuardMalloc", @"com.apple.frontboard", 0)
    || CFPreferencesGetAppBooleanValue(@"FBGuardMallocAlways", @"com.apple.frontboard", 0))
  {
    [v2 setObject:@"/usr/lib/libgmalloc.dylib" forKey:@"DYLD_INSERT_LIBRARIES"];
    CFPreferencesSetAppValue(@"FBGuardMalloc", 0, @"com.apple.frontboard");
    int v3 = 1;
  }
  if (CFPreferencesGetAppBooleanValue(@"FBZombieEnabled", @"com.apple.frontboard", 0)
    || CFPreferencesGetAppBooleanValue(@"FBZombieEnabledAlways", @"com.apple.frontboard", 0))
  {
    [v2 setObject:@"YES" forKey:@"NSZombieEnabled"];
    CFPreferencesSetAppValue(@"FBZombieEnabled", 0, @"com.apple.frontboard");
    int v3 = 1;
  }
  if (CFPreferencesGetAppBooleanValue(@"FBDeallocateZombies", @"com.apple.frontboard", 0)
    || CFPreferencesGetAppBooleanValue(@"FBDeallocateZombiesAlways", @"com.apple.frontboard", 0))
  {
    [v2 setObject:@"YES" forKey:@"NSDeallocateZombies"];
    CFPreferencesSetAppValue(@"FBDeallocateZombies", 0, @"com.apple.frontboard");
    int v3 = 1;
  }
  if (CFPreferencesGetAppBooleanValue(@"FBSQLiteAutoTrace", @"com.apple.frontboard", 0)
    || CFPreferencesGetAppBooleanValue(@"FBSQLiteAutoTraceAlways", @"com.apple.frontboard", 0))
  {
    [v2 setObject:@"1" forKey:@"SQLITE_AUTO_TRACE"];
    CFPreferencesSetAppValue(@"FBSQLiteAutoTrace", 0, @"com.apple.frontboard");
    int v3 = 1;
  }
  if (CFPreferencesGetAppBooleanValue(@"FBDYLDRegionPrivate", @"com.apple.frontboard", 0)
    || CFPreferencesGetAppBooleanValue(@"FBDYLDRegionPrivateAlways", @"com.apple.frontboard", 0))
  {
    [v2 setObject:@"private" forKey:@"DYLD_SHARED_REGION"];
    CFPreferencesSetAppValue(@"FBDYLDRegionPrivate", 0, @"com.apple.frontboard");
    int v3 = 1;
  }
  CFPropertyListRef v7 = CFPreferencesCopyAppValue(@"FBDYLDAlternateSharedCacheDir", @"com.apple.frontboard");
  if (v7)
  {
    CFPreferencesSetAppValue(@"FBDYLDAlternateSharedCacheDir", 0, @"com.apple.frontboard");
    int v3 = 1;
    CFPropertyListRef v4 = v7;
  }
  else
  {
    CFPropertyListRef v4 = CFPreferencesCopyAppValue(@"FBDYLDAlternateSharedCacheDirAlways", @"com.apple.frontboard");
    CFPropertyListRef v7 = v4;
    if (!v4) { {
      goto LABEL_33;
    }
    }
  }
  CFTypeID v5 = CFGetTypeID(v4);
  if (v5 == CFStringGetTypeID())
  {
    [v2 setObject:v7 forKey:@"DYLD_SHARED_CACHE_DIR"];
    [v2 setObject:@"private" forKey:@"DYLD_SHARED_REGION"];
  }
LABEL_33:
  if (v3) { {
    CFPreferencesSynchronize(@"com.apple.frontboard", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  }
  }
  fbs_release();

  return v2;
}

- (void)setRecordingAudio:(BOOL)a3
{
  self->_recordingAudio = a3;
}

- (void)killForReason:(int64_t)a3 andReport:(BOOL)a4 withDescription:(id)a5
{
}

- (double)elapsedCPUTime
{
  return result;
}

- (BOOL)isRecordingAudio
{
  return self->_recordingAudio;
}

- (BOOL)isNowPlayingWithAudio
{
  return self->_nowPlayingWithAudio;
}

- (void)setNowPlayingWithAudio:(BOOL)a3
{
  self->_nowPlayingWithAudio = a3;
}

- (BOOL)isConnectedToExternalAccessory
{
  return self->_connectedToExternalAccessory;
}

- (void)setConnectedToExternalAccessory:(BOOL)a3
{
  self->_connectedToExternalAccessory = a3;
}

- (void).cxx_destruct
{
}

@end