@interface AXLoggingSubsystem
+ (BOOL)shouldIncludeBacktraceInLogs;
+ (BOOL)shouldIncludeFileLineAndFunctionInLogs;
+ (BOOL)shouldProcessMessageForLogs;
+ (BOOL)willLog;
+ (BOOL)willLogDebug;
+ (BOOL)willLogInfo;
+ (double)threshold;
+ (id)_errorWithMessage:(id)a3 underlyingError:(id)a4;
+ (id)errorWithDescription:(id)a3;
+ (id)identifier;
+ (id)sharedInstance;
+ (id)subsystems;
+ (id)wrapError:(id)a3 description:(id)a4;
+ (int)defaultLogLevel;
+ (void)initialize;
+ (void)initializeSubsytem;
- (BOOL)ignoreLogging;
- (void)setIgnoreLogging:(BOOL)a3;
@end

@implementation AXLoggingSubsystem

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__AXLoggingSubsystem_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_System;
  return v2;
}

uint64_t __36__AXLoggingSubsystem_sharedInstance__block_invoke()
{
  sharedInstance_System = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x1F41817F8]();
}

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_7);
  }
}

uint64_t __32__AXLoggingSubsystem_initialize__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28E08]);
  v1 = (void *)SubsystemLock;
  SubsystemLock = (uint64_t)v0;

  Subsystems = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  return MEMORY[0x1F41817F8]();
}

+ (void)initializeSubsytem
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__AXLoggingSubsystem_initializeSubsytem__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initializeSubsytem_onceToken != -1) {
    dispatch_once(&initializeSubsytem_onceToken, block);
  }
}

void __40__AXLoggingSubsystem_initializeSubsytem__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  int ClassList = objc_getClassList(0, 0);
  v2 = (Class *)malloc_type_malloc(8 * ClassList, 0x80040B8603338uLL);
  int v3 = objc_getClassList(v2, ClassList);
  if (v3 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = v3;
    do
    {
      Superclass = v2[v4];
      do
        Superclass = class_getSuperclass(Superclass);
      while (Superclass && Superclass != (objc_class *)v0);
      if (Superclass) {
        [(id)Subsystems addObject:v2[v4]];
      }
      ++v4;
    }
    while (v4 != v5);
  }
  free(v2);
}

+ (id)subsystems
{
  [a1 initializeSubsytem];
  v2 = (void *)[(id)Subsystems copy];
  return v2;
}

+ (id)_errorWithMessage:(id)a3 underlyingError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA60] dictionary];
  v9 = v8;
  if (v6) {
    [v8 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F28588]];
  }
  if (v7) {
    [v9 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  v10 = (void *)MEMORY[0x1E4F28C58];
  v11 = [a1 identifier];
  v12 = [v10 errorWithDomain:v11 code:0 userInfo:v9];

  return v12;
}

+ (id)errorWithDescription:(id)a3
{
  if (a3)
  {
    uint64_t v4 = (objc_class *)NSString;
    id v5 = a3;
    id v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v10];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = [a1 _errorWithMessage:v6 underlyingError:0];

  return v7;
}

+ (id)wrapError:(id)a3 description:(id)a4
{
  id v6 = a3;
  if (a4)
  {
    id v7 = (objc_class *)NSString;
    id v8 = a4;
    a4 = (id)[[v7 alloc] initWithFormat:v8 arguments:&v12];
  }
  v9 = [a1 _errorWithMessage:a4 underlyingError:v6];

  return v9;
}

+ (id)identifier
{
  return @"AXGeneric";
}

+ (BOOL)shouldIncludeBacktraceInLogs
{
  return 0;
}

+ (BOOL)shouldIncludeFileLineAndFunctionInLogs
{
  return 1;
}

+ (BOOL)shouldProcessMessageForLogs
{
  return 1;
}

+ (double)threshold
{
  return 0.0;
}

+ (int)defaultLogLevel
{
  return 1;
}

+ (BOOL)willLog
{
  _AXAssert(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AccessibilityLibraries/Source/AXCoreUtilities/source/Logging/AXLoggingSubsystem.m", (void *)0xA3, (uint64_t)"+[AXLoggingSubsystem willLog]", @"Should not be relying on this anymore. Logging is always enabled.", v2, v3, v4, vars0);
  return 1;
}

+ (BOOL)willLogInfo
{
  uint64_t v2 = [a1 identifier];
  BOOL v3 = AXWillLogInfoWithFacility(v2);

  return v3;
}

+ (BOOL)willLogDebug
{
  uint64_t v2 = [a1 identifier];
  BOOL v3 = AXWillLogDebugWithFacility(v2);

  return v3;
}

- (void)setIgnoreLogging:(BOOL)a3
{
  self->_ignoreLogging = a3;
}

- (BOOL)ignoreLogging
{
  return self->_ignoreLogging;
}

@end