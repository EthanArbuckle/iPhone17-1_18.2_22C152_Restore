@interface NSProcessInfo
+ (NSProcessInfo)alloc;
+ (NSProcessInfo)allocWithZone:(_NSZone *)a3;
+ (NSProcessInfo)processInfo;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)macCatalystVersion;
- (BOOL)automaticTerminationSupportEnabled;
- (BOOL)isLowPowerModeEnabled;
- (BOOL)isMacCatalystApp;
- (BOOL)isOperatingSystemAtLeastVersion:(NSOperatingSystemVersion *)version;
- (BOOL)isTranslated;
- (BOOL)isiOSAppOnMac;
- (BOOL)macCatalystVersionIsAtLeastVersion:(id *)a3;
- (NSArray)arguments;
- (NSDictionary)environment;
- (NSOperatingSystemVersion)operatingSystemVersion;
- (NSProcessInfoThermalState)thermalState;
- (NSString)globallyUniqueString;
- (NSString)hostName;
- (NSString)operatingSystemName;
- (NSString)operatingSystemVersionString;
- (NSString)processName;
- (NSString)userName;
- (NSUInteger)activeProcessorCount;
- (NSUInteger)operatingSystem;
- (NSUInteger)processorCount;
- (id)beginActivityWithOptions:(NSActivityOptions)options reason:(NSString *)reason;
- (id)beginSuspensionOfSystemBehaviors:(unint64_t)a3 reason:(id)a4;
- (id)userHomeDirectory;
- (int64_t)_suddenTerminationDisablingCount;
- (unint64_t)physicalMemory;
- (void)_exitIfSuddenTerminationEnabledWithStatus:(int)a3;
- (void)_exitWhenSuddenTerminationEnabledWithStatus:(int)a3;
- (void)_reactivateActivity:(id)a3;
- (void)dealloc;
- (void)disableAutomaticTermination:(NSString *)reason;
- (void)disableSuddenTermination;
- (void)enableAutomaticTermination:(NSString *)reason;
- (void)enableSuddenTermination;
- (void)endActivity:(id)activity;
- (void)endSystemBehaviorSuspension:(id)a3;
- (void)performActivityWithOptions:(NSActivityOptions)options reason:(NSString *)reason usingBlock:(void *)block;
- (void)performExpiringActivityWithReason:(NSString *)reason usingBlock:(void *)block;
- (void)setArguments:(id)a3;
- (void)setAutomaticTerminationSupportEnabled:(BOOL)automaticTerminationSupportEnabled;
- (void)setProcessName:(NSString *)processName;
@end

@implementation NSProcessInfo

+ (NSProcessInfo)processInfo
{
  if (NSProcessInfo == a1)
  {
    return +[_NSSwiftProcessInfo processInfo];
  }
  else
  {
    if (qword_1EB1ED650 != -1) {
      dispatch_once(&qword_1EB1ED650, &__block_literal_global_39);
    }
    return (NSProcessInfo *)qword_1EB1ED658;
  }
}

- (NSString)processName
{
  os_unfair_lock_lock_with_options();
  name = self->name;
  if (!name)
  {
    v4 = (const char **)_CFGetProgname();
    name = (NSString *)CFStringCreateWithFileSystemRepresentation(0, *v4);
    self->name = name;
  }
  v5 = (void *)[(NSString *)name copy];
  os_unfair_lock_unlock((os_unfair_lock_t)&processLock);

  return (NSString *)v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSProcessInfo;
  [(NSProcessInfo *)&v3 dealloc];
}

+ (NSProcessInfo)allocWithZone:(_NSZone *)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (qword_1EB1ED668 != -1) {
    dispatch_once(&qword_1EB1ED668, &__block_literal_global_151);
  }
  if (byte_1EB1ED649 && NSProcessInfo == a1)
  {
    return (NSProcessInfo *)+[NSProcessInfo allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___NSProcessInfo;
    return (NSProcessInfo *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (NSProcessInfoThermalState)thermalState
{
  v2 = +[_NSSwiftProcessInfo processInfo];

  return [(NSProcessInfo *)v2 thermalState];
}

+ (NSProcessInfo)alloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (qword_1EB1ED668 != -1) {
    dispatch_once(&qword_1EB1ED668, &__block_literal_global_151);
  }
  if (byte_1EB1ED649 && NSProcessInfo == a1)
  {
    return (NSProcessInfo *)[_NSSwiftProcessInfo alloc];
  }
  else
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___NSProcessInfo;
    return (NSProcessInfo *)objc_msgSendSuper2(&v4, sel_alloc);
  }
}

uint64_t __28__NSProcessInfo_processInfo__block_invoke()
{
  uint64_t result = [objc_allocWithZone((Class)NSProcessInfo) init];
  qword_1EB1ED658 = result;
  return result;
}

- (NSString)operatingSystemName
{
  NSUInteger v2 = [(NSProcessInfo *)self operatingSystem];
  if (v2 - 1 > 4) {
    return (NSString *)@"NSUnknownOperatingSystem";
  }
  else {
    return (NSString *)off_1E51F9A60[v2 - 1];
  }
}

- (NSUInteger)operatingSystem
{
  return 5;
}

- (id)userHomeDirectory
{
  return NSHomeDirectoryForUser(0);
}

- (BOOL)isTranslated
{
  return 0;
}

- (NSDictionary)environment
{
  uint64_t result = self->environment;
  if (result) {
    return result;
  }
  environ_lock_np();
  objc_super v3 = *_NSGetEnviron();
  if (!v3)
  {
    environ_unlock_np();
    goto LABEL_41;
  }
  objc_super v4 = (void **)malloc_type_malloc(0x100uLL, 0x10040436913F5uLL);
  uint64_t v5 = *v3;
  if (*v3)
  {
    unint64_t v6 = 0;
    unint64_t v7 = 32;
    while (1)
    {
      if (v6 >= v7)
      {
        if ((v7 & 0x8000000000000000) != 0)
        {
          environ_unlock_np();
          freeenv(v4, 2 * v7);
LABEL_41:
          v24 = (void *)MEMORY[0x1E4F1C9E8];
          return (NSDictionary *)[v24 dictionary];
        }
        objc_super v4 = (void **)malloc_type_realloc(v4, 16 * v7, 0x10040436913F5uLL);
        uint64_t v5 = v3[v6];
        v7 *= 2;
      }
      v4[v6] = strdup(v5);
      uint64_t v8 = v6 + 1;
      uint64_t v5 = v3[++v6];
      if (!v5)
      {
        environ_unlock_np();
        goto LABEL_13;
      }
    }
  }
  environ_unlock_np();
  if (!v4) {
    goto LABEL_41;
  }
  uint64_t v8 = 0;
LABEL_13:
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v8];
  if (v8)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      uint64_t v11 = 0;
      v12 = v4[i];
      while (1)
      {
        int v13 = v12[v11];
        if (v13 == 61 || v13 == 0) {
          break;
        }
        ++v11;
      }
      uint64_t v15 = 0;
      while (v12[v11 + v15++])
        ;
      if (v15 != 1)
      {
        v17 = +[NSString stringWithBytes:v4[i] length:v11 encoding:4];
        if (!v17)
        {
          v18 = v4[i];
          if (__NSDefaultStringEncodingFullyInited) {
            uint64_t v19 = _NSDefaultStringEncoding;
          }
          else {
            uint64_t v19 = _NSDefaultCStringEncoding();
          }
          v17 = +[NSString stringWithBytes:v18 length:v12 - v18 + v11 encoding:v19];
        }
        uint64_t v20 = (uint64_t)&v12[v11 + 1];
        v21 = +[NSString stringWithBytes:v20 length:v15 - 2 encoding:4];
        if (!v21)
        {
          if (__NSDefaultStringEncodingFullyInited) {
            uint64_t v22 = _NSDefaultStringEncoding;
          }
          else {
            uint64_t v22 = _NSDefaultCStringEncoding();
          }
          v21 = +[NSString stringWithBytes:v20 length:v15 - 2 encoding:v22];
        }
        if (v17 && v21 && ![v9 objectForKey:v17]) {
          [v9 setObject:v21 forKey:v17];
        }
      }
    }
  }
  v23 = (NSDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v9];

  freeenv(v4, v8);
  return v23;
}

- (NSArray)arguments
{
  os_unfair_lock_lock_with_options();
  arguments = self->arguments;
  if (!arguments)
  {
    objc_super v4 = (const char *)_CFProcessPath();
    uint64_t v5 = (id)CFStringCreateWithFileSystemRepresentation(0, v4);
    if (!v5)
    {
      id v6 = objc_allocWithZone((Class)NSString);
      size_t v7 = strlen(v4);
      if (__NSDefaultStringEncodingFullyInited) {
        uint64_t v8 = _NSDefaultStringEncoding;
      }
      else {
        uint64_t v8 = _NSDefaultCStringEncoding();
      }
      uint64_t v5 = (__CFString *)(id)[v6 initWithBytes:v4 length:v7 encoding:v8];
    }
    if (!v5) {
      uint64_t v5 = &stru_1ECA5C228;
    }
    uint64_t v9 = [(__CFString *)v5 stringByStandardizingPath];
    v10 = (void *)[MEMORY[0x1E4F1CA48] array];
    uint64_t v11 = *_NSGetArgv();
    uint64_t v12 = *_NSGetArgc();
    if ((int)v12 >= 1)
    {
      do
      {
        if (*v11)
        {
          int v13 = +[NSString stringWithCString:*v11 encoding:4];
          if (v13
            || (int v13 = +[NSString stringWithCString:*v11 encoding:5]) != 0)
          {
            [v10 addObject:v13];
          }
        }
        ++v11;
        --v12;
      }
      while (v12);
    }
    if ([v10 count]) {
      [v10 replaceObjectAtIndex:0 withObject:v9];
    }
    else {
      [v10 addObject:v9];
    }
    arguments = (NSArray *)[v10 copy];
    self->arguments = arguments;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&processLock);
  return arguments;
}

- (void)setArguments:(id)a3
{
  os_unfair_lock_lock_with_options();
  arguments = self->arguments;
  if (arguments != a3)
  {

    self->arguments = (NSArray *)[a3 copy];
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&processLock);
}

- (NSString)hostName
{
  uint64_t result = self->hostName;
  if (!result)
  {
    os_unfair_lock_lock(&hostName_hostNameLock);
    if (!self->hostName) {
      self->hostName = (NSString *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F18D48], "currentHost"), "name"), "copy");
    }
    os_unfair_lock_unlock(&hostName_hostNameLock);
    return self->hostName;
  }
  return result;
}

- (void)setProcessName:(NSString *)processName
{
  os_unfair_lock_lock_with_options();
  name = self->name;
  if (name != processName)
  {

    self->name = (NSString *)[(NSString *)processName copy];
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&processLock);
}

- (NSString)globallyUniqueString
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  CFUUIDRef v2 = CFUUIDCreate(0);
  CFStringRef v3 = CFUUIDCreateString(0, v2);
  buffer[0] = 0;
  CFStringGetCString(v3, buffer, 256, 0x600u);
  buffer[255] = 0;
  size_t v4 = strlen(buffer);
  uint64_t v5 = &buffer[v4];
  size_t v6 = 256 - v4;
  uint64_t v7 = getpid();
  uint64_t v8 = mach_absolute_time();
  snprintf(v5, v6, "-%ld-%016qX", v7, v8);
  CFRelease(v3);
  CFRelease(v2);
  return +[NSString stringWithUTF8String:buffer];
}

- (NSString)userName
{
  CFUUIDRef v2 = (void *)CFCopyUserName();

  return (NSString *)v2;
}

- (NSString)operatingSystemVersionString
{
  CFUUIDRef v2 = (void *)CFCopySystemVersionString();

  return (NSString *)v2;
}

- (NSOperatingSystemVersion)operatingSystemVersion
{
  uint64_t result = (NSOperatingSystemVersion *)_CFOperatingSystemVersionGetCurrent();
  *(_OWORD *)&retstr->majorVersion = 0uLL;
  retstr->patchVersion = 0;
  return result;
}

- (BOOL)isOperatingSystemAtLeastVersion:(NSOperatingSystemVersion *)version
{
  return _CFOperatingSystemVersionIsAtLeastVersion() != 0;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)macCatalystVersion
{
  if (self) {
    return ($9FE6E10C8CE45DBC9A88DFDEA39A390D *)[($9FE6E10C8CE45DBC9A88DFDEA39A390D *)self operatingSystemVersion];
  }
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  return self;
}

- (BOOL)macCatalystVersionIsAtLeastVersion:(id *)a3
{
  if (self) {
    [(NSProcessInfo *)self macCatalystVersion];
  }
  if (a3->var0 > 0) {
    return 0;
  }
  if (a3->var0 < 0) {
    return 1;
  }
  int64_t var1 = a3->var1;
  if (var1 > 0) {
    return 0;
  }
  return var1 < 0 || a3->var2 <= 0;
}

- (NSUInteger)processorCount
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = processorCount__pcnt;
  if (processorCount__pcnt == -1)
  {
    *(void *)uint64_t v5 = 0x300000006;
    size_t v4 = 4;
    if (sysctl(v5, 2u, &processorCount__pcnt, &v4, 0, 0))
    {
      int v2 = 0;
      processorCount__pcnt = 0;
    }
    else
    {
      return processorCount__pcnt;
    }
  }
  return v2;
}

- (NSUInteger)activeProcessorCount
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = activeProcessorCount__pcnt;
  if (activeProcessorCount__pcnt == -1)
  {
    *(void *)uint64_t v5 = 0x1900000006;
    size_t v4 = 4;
    if (sysctl(v5, 2u, &activeProcessorCount__pcnt, &v4, 0, 0))
    {
      int v2 = 0;
      activeProcessorCount__pcnt = 0;
    }
    else
    {
      return activeProcessorCount__pcnt;
    }
  }
  return v2;
}

- (unint64_t)physicalMemory
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (_MergedGlobals_115) {
    return qword_1EB1ED660;
  }
  v4[0] = 8;
  int v2 = sysctlbyname("hw.memsize", &qword_1EB1ED660, v4, 0, 0);
  unint64_t result = 0;
  _MergedGlobals_115 = v2 == 0;
  if (!v2) {
    return qword_1EB1ED660;
  }
  return result;
}

- (void)disableSuddenTermination
{
}

- (void)enableSuddenTermination
{
}

- (void)_exitIfSuddenTerminationEnabledWithStatus:(int)a3
{
}

- (void)_exitWhenSuddenTerminationEnabledWithStatus:(int)a3
{
}

- (int64_t)_suddenTerminationDisablingCount
{
  return MEMORY[0x1F40D91B8](self, a2);
}

- (void)disableAutomaticTermination:(NSString *)reason
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSProcessInfo;
  [(NSProcessInfo *)&v3 doesNotRecognizeSelector:a2];
}

- (void)enableAutomaticTermination:(NSString *)reason
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSProcessInfo;
  [(NSProcessInfo *)&v3 doesNotRecognizeSelector:a2];
}

- (void)setAutomaticTerminationSupportEnabled:(BOOL)automaticTerminationSupportEnabled
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSProcessInfo;
  [(NSProcessInfo *)&v3 doesNotRecognizeSelector:a2];
}

- (BOOL)automaticTerminationSupportEnabled
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSProcessInfo;
  [(NSProcessInfo *)&v3 doesNotRecognizeSelector:a2];
  return 0;
}

- (void)_reactivateActivity:(id)a3
{
  if (a3)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Invalid class type" userInfo:0]);
    }
    [a3 _reactivate];
  }
}

- (id)beginSuspensionOfSystemBehaviors:(unint64_t)a3 reason:(id)a4
{
  id v4 = [[_NSActivityAssertion alloc] _initWithActivityOptions:0xFF00EFFFFFLL reason:a4 expirationHandler:0];

  return v4;
}

- (void)endSystemBehaviorSuspension:(id)a3
{
  if (a3) {
    [a3 _endFromDealloc:0];
  }
}

- (id)beginActivityWithOptions:(NSActivityOptions)options reason:(NSString *)reason
{
  if (!reason || !_NSIsNSString() || ![(NSString *)reason length]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot begin activity without reason string or empty reason string" userInfo:0]);
  }
  id v6 = [[_NSActivityAssertion alloc] _initWithActivityOptions:options reason:reason expirationHandler:0];

  return v6;
}

- (void)endActivity:(id)activity
{
  if (activity)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Invalid class type" userInfo:0]);
    }
    [activity _endFromDealloc:0];
  }
}

- (void)performActivityWithOptions:(NSActivityOptions)options reason:(NSString *)reason usingBlock:(void *)block
{
}

- (void)performExpiringActivityWithReason:(NSString *)reason usingBlock:(void *)block
{
}

- (BOOL)isLowPowerModeEnabled
{
  int v2 = +[_NSSwiftProcessInfo processInfo];

  return [(NSProcessInfo *)v2 isLowPowerModeEnabled];
}

- (BOOL)isMacCatalystApp
{
  return _CFMZEnabled() != 0;
}

- (BOOL)isiOSAppOnMac
{
  return 0;
}

@end