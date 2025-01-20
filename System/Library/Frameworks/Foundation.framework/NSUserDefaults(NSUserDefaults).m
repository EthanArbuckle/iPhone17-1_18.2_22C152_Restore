@interface NSUserDefaults(NSUserDefaults)
+ (id)_copyStandardUserDefaultsIfPresent;
+ (id)standardUserDefaults;
+ (void)setStandardUserDefaults:()NSUserDefaults;
- (BOOL)objectIsForcedForKey:()NSUserDefaults;
- (BOOL)objectIsForcedForKey:()NSUserDefaults inDomain:;
- (BOOL)synchronize;
- (CFArrayRef)persistentDomainNames;
- (double)doubleForKey:()NSUserDefaults;
- (double)floatForKey:()NSUserDefaults;
- (id)URLForKey:()NSUserDefaults;
- (id)dealloc;
- (id)dictionaryRepresentation;
- (id)finalize;
- (id)objectForKey:()NSUserDefaults;
- (id)objectForKey:()NSUserDefaults inDomain:;
- (id)persistentDomainForName:()NSUserDefaults;
- (id)volatileDomainForName:()NSUserDefaults;
- (id)volatileDomainNames;
- (uint64_t)BOOLForKey:()NSUserDefaults;
- (uint64_t)_didEndKeyValueObserving;
- (uint64_t)_willBeginKeyValueObserving;
- (uint64_t)arrayForKey:()NSUserDefaults;
- (uint64_t)dataForKey:()NSUserDefaults;
- (uint64_t)dictionaryForKey:()NSUserDefaults;
- (uint64_t)init;
- (uint64_t)initWithSuiteName:()NSUserDefaults;
- (uint64_t)initWithUser:()NSUserDefaults;
- (uint64_t)integerForKey:()NSUserDefaults;
- (uint64_t)longForKey:()NSUserDefaults;
- (uint64_t)removeObjectForKey:()NSUserDefaults;
- (uint64_t)removeObjectForKey:()NSUserDefaults inDomain:;
- (uint64_t)removePersistentDomainForName:()NSUserDefaults;
- (uint64_t)removeSuiteNamed:()NSUserDefaults;
- (uint64_t)removeVolatileDomainForName:()NSUserDefaults;
- (uint64_t)searchList;
- (uint64_t)setBool:()NSUserDefaults forKey:;
- (uint64_t)setDouble:()NSUserDefaults forKey:;
- (uint64_t)setFloat:()NSUserDefaults forKey:;
- (uint64_t)setInteger:()NSUserDefaults forKey:;
- (uint64_t)setLong:()NSUserDefaults forKey:;
- (uint64_t)setObject:()NSUserDefaults forKey:;
- (uint64_t)setObject:()NSUserDefaults forKey:inDomain:;
- (uint64_t)setPersistentDomain:()NSUserDefaults forName:;
- (uint64_t)setVolatileDomain:()NSUserDefaults forName:;
- (uint64_t)stringForKey:()NSUserDefaults;
- (void)_initWithSuiteName:()NSUserDefaults container:;
- (void)addSuiteNamed:()NSUserDefaults;
- (void)registerDefaults:()NSUserDefaults;
- (void)release;
- (void)setSearchList:()NSUserDefaults;
- (void)setURL:()NSUserDefaults forKey:;
- (void)stringArrayForKey:()NSUserDefaults;
@end

@implementation NSUserDefaults(NSUserDefaults)

- (uint64_t)_willBeginKeyValueObserving
{
  uint64_t result = [a1 _kvo];
  if (!result)
  {
    [a1 _setKVO:&off_1ECAB5618];
    return MEMORY[0x1F40D8FF8](a1);
  }
  return result;
}

- (void)registerDefaults:()NSUserDefaults
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3 && [a3 count])
  {
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x3052000000;
    v12 = __Block_byref_object_copy__17;
    v13 = __Block_byref_object_dispose__17;
    uint64_t v14 = 0;
    uint64_t v5 = objc_opt_class();
    v6 = (void *)MEMORY[0x185308110]();
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__NSUserDefaults_NSUserDefaults__registerDefaults___block_invoke;
    v8[3] = &unk_1E51FAA28;
    v8[5] = a3;
    v8[6] = &v9;
    v8[4] = v5;
    [a3 enumerateKeysAndObjectsUsingBlock:v8];
    _CFXPreferencesRegisterDefaultValues();
    v7 = (void *)v10[5];
    if (v7) {

    }
    [+[NSNotificationCenter defaultCenter] postNotificationName:@"NSUserDefaultsDidChangeNotification" object:a1 userInfo:0];
    _Block_object_dispose(&v9, 8);
  }
}

- (void)release
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (qword_1EB1ED888 != -1) {
    dispatch_once(&qword_1EB1ED888, &__block_literal_global_53);
  }
  if (_MergedGlobals_126) {
    BOOL v2 = qword_1EB1ED880 == (void)a1;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2)
  {
    v3.receiver = a1;
    v3.super_class = (Class)&off_1ECAF4220;
    objc_msgSendSuper2(&v3, sel_release);
  }
}

- (id)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if ([a1 _kvo]) {
    _CFPrefsUnregisterUserDefaultsInstance();
  }
  [a1 _setIdentifier:0];
  [a1 _setContainer:0];
  v3.receiver = a1;
  v3.super_class = (Class)&off_1ECAF4220;
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

- (void)_initWithSuiteName:()NSUserDefaults container:
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3
    && (([a3 isEqualToString:@"NSGlobalDomain"] & 1) != 0
     || (MainBundle = CFBundleGetMainBundle(),
         [a3 isEqualToString:CFBundleGetIdentifier(MainBundle)])))
  {
    _NSUserDefaults_Log_Nonsensical_Suites((uint64_t)a3);

    return 0;
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&off_1ECAF4220;
    id v9 = objc_msgSendSuper2(&v11, sel_init);
    v8 = v9;
    if (v9)
    {
      [v9 _setContainer:a4];
      [v8 _setIdentifier:a3];
    }
  }
  return v8;
}

- (id)persistentDomainForName:()NSUserDefaults
{
  [a3 isEqualToString:@"NSGlobalDomain"];
  objc_super v3 = (void *)_CFXPreferencesCopyDictionaryForSourceWithBundleID();

  return v3;
}

- (uint64_t)setInteger:()NSUserDefaults forKey:
{
  v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");

  return [a1 setObject:v6 forKey:a4];
}

- (uint64_t)dataForKey:()NSUserDefaults
{
  uint64_t v1 = objc_msgSend(a1, "objectForKey:");
  if (_NSIsNSData()) {
    return v1;
  }
  else {
    return 0;
  }
}

- (double)floatForKey:()NSUserDefaults
{
  uint64_t v1 = objc_msgSend(a1, "objectForKey:");
  if (!v1) {
    return 0.0;
  }
  BOOL v2 = (void *)v1;
  if ((_NSIsNSNumber() & 1) == 0 && !_NSIsNSString()) {
    return 0.0;
  }

  [v2 floatValue];
  return result;
}

- (double)doubleForKey:()NSUserDefaults
{
  uint64_t v1 = objc_msgSend(a1, "objectForKey:");
  if (!v1) {
    return 0.0;
  }
  BOOL v2 = (void *)v1;
  if ((_NSIsNSNumber() & 1) == 0 && !_NSIsNSString()) {
    return 0.0;
  }

  [v2 doubleValue];
  return result;
}

- (uint64_t)arrayForKey:()NSUserDefaults
{
  uint64_t v1 = objc_msgSend(a1, "objectForKey:");
  if (_NSIsNSArray()) {
    return v1;
  }
  else {
    return 0;
  }
}

- (BOOL)synchronize
{
  [a1 _identifier];
  [a1 _container];
  BOOL v2 = _CFPreferencesAppSynchronizeWithContainer() != 0;
  _CFPrefsSynchronizeForProcessTermination();
  return v2;
}

- (void)stringArrayForKey:()NSUserDefaults
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = objc_msgSend(a1, "objectForKey:");
  if (!_NSIsNSArray()) {
    return 0;
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v7 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
LABEL_4:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v9 != v4) {
        objc_enumerationMutation(v1);
      }
      if (!_NSIsNSString()) {
        return 0;
      }
      if (v3 == ++v5)
      {
        uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v7 count:16];
        if (v3) {
          goto LABEL_4;
        }
        return v1;
      }
    }
  }
  return v1;
}

- (id)dictionaryRepresentation
{
  [a1 _identifier];
  [a1 _container];
  uint64_t v2 = (void *)_CFPrefsCopyAppDictionaryWithContainer();

  return v2;
}

- (uint64_t)dictionaryForKey:()NSUserDefaults
{
  uint64_t v1 = objc_msgSend(a1, "objectForKey:");
  if (_NSIsNSDictionary()) {
    return v1;
  }
  else {
    return 0;
  }
}

- (uint64_t)stringForKey:()NSUserDefaults
{
  uint64_t v1 = objc_msgSend(a1, "objectForKey:");
  if (_NSIsNSString()) {
    return (uint64_t)v1;
  }
  if (!_NSIsNSNumber()) {
    return 0;
  }

  return [v1 stringValue];
}

- (uint64_t)setObject:()NSUserDefaults forKey:
{
  [a1 _identifier];
  [a1 _container];
  _CFPreferencesSetAppValueWithContainer();
  uint64_t v2 = +[NSNotificationCenter defaultCenter];

  return [(NSNotificationCenter *)v2 postNotificationName:@"NSUserDefaultsDidChangeNotification" object:a1 userInfo:0];
}

- (uint64_t)integerForKey:()NSUserDefaults
{
  if ([a1 isMemberOfClass:MEMORY[0x1E4F1CB18]])
  {
    uint64_t v5 = [a1 _identifier];
    uint64_t v6 = [a1 _container];
    return MEMORY[0x1F40D8F70](a3, v5, v6, 0);
  }
  else
  {
    uint64_t v7 = [a1 objectForKey:a3];
    if (v7 && ((long long v8 = (void *)v7, (_NSIsNSString() & 1) != 0) || _NSIsNSNumber()))
    {
      return [v8 integerValue];
    }
    else
    {
      return 0;
    }
  }
}

- (uint64_t)BOOLForKey:()NSUserDefaults
{
  if ([a1 isMemberOfClass:MEMORY[0x1E4F1CB18]])
  {
    [a1 _identifier];
    [a1 _container];
    BOOL v5 = _CFPreferencesGetAppBooleanValueWithContainer() == 0;
    return !v5;
  }
  long long v8 = (void *)[a1 objectForKey:a3];
  if (_NSIsNSString())
  {
    if (([v8 isEqualToString:@"YES"] & 1) == 0)
    {
      uint64_t v9 = [v8 length];
      uint64_t v6 = 1;
      if (!objc_msgSend(v8, "compare:options:range:", @"YES", 1, 0, v9)) {
        return v6;
      }
      uint64_t v6 = 1;
      if (!objc_msgSend(v8, "compare:options:range:", @"Y", 1, 0, v9)) {
        return v6;
      }
      BOOL v5 = [v8 integerValue] == 0;
      return !v5;
    }
    return 1;
  }
  if (!_NSIsNSNumber()) {
    return 0;
  }

  return [v8 BOOLValue];
}

- (id)objectForKey:()NSUserDefaults
{
  [a1 _identifier];
  [a1 _container];
  uint64_t v2 = (void *)_CFPreferencesCopyAppValueWithContainer();

  return v2;
}

+ (id)standardUserDefaults
{
  os_unfair_lock_lock(&stru_1EB1ED87C);
  v0 = (void *)qword_1EB1ED880;
  if (!qword_1EB1ED880)
  {
    _CFAutoreleasePoolPush();
    qword_1EB1ED880 = [objc_allocWithZone(MEMORY[0x1E4F1CB18]) init];
    _CFPreferencesRegisterStandardUserDefaultsExists();
    _CFAutoreleasePoolPop();
    v0 = (void *)qword_1EB1ED880;
  }
  id v1 = v0;
  os_unfair_lock_unlock(&stru_1EB1ED87C);

  return v1;
}

- (uint64_t)initWithSuiteName:()NSUserDefaults
{
  return [a1 _initWithSuiteName:a3 container:0];
}

- (uint64_t)init
{
  return [a1 initWithUser:0];
}

- (uint64_t)initWithUser:()NSUserDefaults
{
  return [a1 initWithSuiteName:0];
}

- (uint64_t)removeObjectForKey:()NSUserDefaults
{
  return [a1 setObject:0 forKey:a3];
}

- (id)objectForKey:()NSUserDefaults inDomain:
{
  if (!a4 || [(__CFString *)a4 isEqualToString:&stru_1ECA5C228])
  {
    long long v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: domain name cannot be nil or empty", _NSMethodExceptionProem(a1, a2)), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  if ([(__CFString *)a4 isEqualToString:@"NSGlobalDomain"]) {
    CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F1D3B8];
  }
  else {
    CFStringRef v8 = a4;
  }
  uint64_t v9 = (void *)CFPreferencesCopyAppValue(a3, v8);

  return v9;
}

- (uint64_t)setBool:()NSUserDefaults forKey:
{
  uint64_t v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:");

  return [a1 setObject:v6 forKey:a4];
}

- (id)volatileDomainForName:()NSUserDefaults
{
  v0 = (void *)_CFXPreferencesCopyDictionaryForNamedVolatileSource();

  return v0;
}

- (uint64_t)removeObjectForKey:()NSUserDefaults inDomain:
{
  return [a1 setObject:0 forKey:a3 inDomain:a4];
}

- (uint64_t)setVolatileDomain:()NSUserDefaults forName:
{
  _CFXPreferencesReplaceValuesInNamedVolatileSource();
  uint64_t v2 = +[NSNotificationCenter defaultCenter];

  return [(NSNotificationCenter *)v2 postNotificationName:@"NSUserDefaultsDidChangeNotification" object:a1 userInfo:0];
}

- (uint64_t)setDouble:()NSUserDefaults forKey:
{
  BOOL v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

  return [a1 setObject:v5 forKey:a3];
}

- (void)setURL:()NSUserDefaults forKey:
{
  uint64_t v7 = (void *)MEMORY[0x185308110]();
  [a1 setObject:encodeURLForDefaults(a3) forKey:a4];
}

- (uint64_t)setFloat:()NSUserDefaults forKey:
{
  BOOL v5 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");

  return [a1 setObject:v5 forKey:a3];
}

- (id)URLForKey:()NSUserDefaults
{
  id v1 = objc_msgSend(a1, "objectForKey:");
  if (_NSIsNSData())
  {
    id v2 = +[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "_strictlyUnarchivedObjectOfClasses:fromData:error:", [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()], v1, 0);
    return v2;
  }
  else if (_NSIsNSString())
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v5 = [v1 stringByExpandingTildeInPath];
    return (id)[v4 fileURLWithPath:v5];
  }
  else
  {
    return 0;
  }
}

- (void)addSuiteNamed:()NSUserDefaults
{
  if (([a3 isEqualToString:@"NSGlobalDomain"] & 1) != 0
    || (MainBundle = CFBundleGetMainBundle(),
        [a3 isEqualToString:CFBundleGetIdentifier(MainBundle)]))
  {
    _NSUserDefaults_Log_Nonsensical_Suites((uint64_t)a3);
  }
  else
  {
    uint64_t v6 = [a1 _identifier];
    uint64_t v7 = [a1 _container];
    MEMORY[0x1F40D8F28](v6, a3, v7);
  }
}

- (uint64_t)setObject:()NSUserDefaults forKey:inDomain:
{
  if (!a5 || [(__CFString *)a5 isEqualToString:&stru_1ECA5C228])
  {
    uint64_t v15 = +[NSString stringWithFormat:@"%@: domain name cannot be nil or empty", _NSMethodExceptionProem(a1, a2)];
    goto LABEL_14;
  }
  if ([(__CFString *)a5 isEqualToString:@"NSGlobalDomain"])
  {
    CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F1D3B8];
    CFStringRef v11 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
    CFStringRef v12 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
    CFPreferencesSetValue(a4, a3, (CFStringRef)*MEMORY[0x1E4F1D3B8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    CFPreferencesSynchronize(v10, v11, v12);
    goto LABEL_10;
  }
  if (([(__CFString *)a5 isEqualToString:@"NSRegistrationDomain"] & 1) != 0
    || [(__CFString *)a5 isEqualToString:@"NSArgumentDomain"])
  {
    if (a3)
    {
      [MEMORY[0x1E4F1C9E8] dictionaryWithObject:a3 forKey:a4];
      _CFXPreferencesReplaceValuesInNamedVolatileSource();
      goto LABEL_10;
    }
    uint64_t v15 = +[NSString stringWithFormat:@"%@: value name cannot be nil for registration or argument domain", _NSMethodExceptionProem(a1, a2)];
LABEL_14:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v15 userInfo:0]);
  }
  CFPreferencesSetAppValue(a4, a3, a5);
  CFPreferencesAppSynchronize(a5);
LABEL_10:
  v13 = +[NSNotificationCenter defaultCenter];

  return [(NSNotificationCenter *)v13 postNotificationName:@"NSUserDefaultsDidChangeNotification" object:a1 userInfo:0];
}

- (uint64_t)longForKey:()NSUserDefaults
{
  v4[1] = *MEMORY[0x1E4F143B8];
  uint64_t result = objc_msgSend(a1, "objectForKey:");
  v4[0] = 0;
  if (result)
  {
    id v2 = (void *)result;
    if (_NSIsNSNumber())
    {
      return [v2 longLongValue];
    }
    else if (_NSIsNSString())
    {
      unint64_t v3 = 0;
      if (_NSScanLongLongFromString(v2, +[NSCharacterSet whitespaceAndNewlineCharacterSet], v4, &v3))return v4[0]; {
      else
      }
        return 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)setLong:()NSUserDefaults forKey:
{
  uint64_t v6 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:");

  return [a1 setObject:v6 forKey:a4];
}

- (uint64_t)searchList
{
  if ((searchList_warnonce & 1) == 0)
  {
    searchList_warnonce = 1;
    NSLog((NSString *)@"-[NSUserDefaults searchList] is obsolete and returns nil; convert off of it.");
  }
  return 0;
}

- (void)setSearchList:()NSUserDefaults
{
  if ((setSearchList__warnonce & 1) == 0)
  {
    setSearchList__warnonce = 1;
    NSLog((NSString *)@"-[NSUserDefaults setSearchList:] is obsolete and has no effect; convert off of it.");
  }
}

- (uint64_t)removeSuiteNamed:()NSUserDefaults
{
  uint64_t v5 = [a1 _identifier];
  uint64_t v6 = [a1 _container];

  return MEMORY[0x1F40D8FA0](v5, a3, v6);
}

- (uint64_t)_didEndKeyValueObserving
{
  uint64_t result = [a1 _kvo];
  if (result)
  {
    _CFPrefsUnregisterUserDefaultsInstance();
    return [a1 _setKVO:0];
  }
  return result;
}

- (id)finalize
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if ([a1 _kvo]) {
    _CFPrefsUnregisterUserDefaultsInstance();
  }
  v3.receiver = a1;
  v3.super_class = (Class)&off_1ECAF4220;
  return objc_msgSendSuper2(&v3, sel_finalize);
}

+ (void)setStandardUserDefaults:()NSUserDefaults
{
  os_unfair_lock_lock(&stru_1EB1ED87C);
  id v4 = a3;

  qword_1EB1ED880 = (uint64_t)a3;

  os_unfair_lock_unlock(&stru_1EB1ED87C);
}

+ (id)_copyStandardUserDefaultsIfPresent
{
  os_unfair_lock_lock(&stru_1EB1ED87C);
  id v0 = (id)qword_1EB1ED880;
  os_unfair_lock_unlock(&stru_1EB1ED87C);
  return v0;
}

- (id)volatileDomainNames
{
  id v0 = (void *)_CFXPreferencesCopyVolatileSourceNames();

  return v0;
}

- (uint64_t)removeVolatileDomainForName:()NSUserDefaults
{
  _CFXPreferencesRemoveNamedVolatileSource();
  id v2 = +[NSNotificationCenter defaultCenter];

  return [(NSNotificationCenter *)v2 postNotificationName:@"NSUserDefaultsDidChangeNotification" object:a1 userInfo:0];
}

- (CFArrayRef)persistentDomainNames
{
  CFArrayRef v0 = CFPreferencesCopyApplicationList((CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  uint64_t v1 = [(__CFArray *)v0 indexOfObject:*MEMORY[0x1E4F1D3B8]];
  if (v1 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v2 = v1;
    objc_super v3 = (void *)[(__CFArray *)v0 mutableCopyWithZone:0];
    [v3 replaceObjectAtIndex:v2 withObject:@"NSGlobalDomain"];

    CFArrayRef v0 = (CFArrayRef)[v3 copyWithZone:0];
  }

  return v0;
}

- (uint64_t)setPersistentDomain:()NSUserDefaults forName:
{
  if (a3
    && [a3 count]
    && (([a4 isEqual:@"NSArgumentDomain"] & 1) != 0
     || [a4 isEqual:@"NSRegistrationDomain"]))
  {
    uint64_t v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: cannot create persistent domain %@. Volatile domain %@ already exists.", _NSMethodExceptionProem(a1, a2), a4, a4), 0 reason userInfo];
    objc_exception_throw(v9);
  }
  [a4 isEqual:@"NSGlobalDomain"];
  [(objc_class *)a1 _container];
  _CFXPreferencesReplaceValuesInSourceWithBundleIDWithContainer();
  [(objc_class *)a1 _container];
  _CFPreferencesSynchronizeWithContainer();
  uint64_t v7 = +[NSNotificationCenter defaultCenter];

  return [(NSNotificationCenter *)v7 postNotificationName:@"NSUserDefaultsDidChangeNotification" object:a1 userInfo:0];
}

- (uint64_t)removePersistentDomainForName:()NSUserDefaults
{
  return [a1 setPersistentDomain:0 forName:a3];
}

- (BOOL)objectIsForcedForKey:()NSUserDefaults
{
  return CFPreferencesAppValueIsForced(a3, (CFStringRef)[a1 _identifier]) != 0;
}

- (BOOL)objectIsForcedForKey:()NSUserDefaults inDomain:
{
  return CFPreferencesAppValueIsForced(key, applicationID) != 0;
}

@end