@interface NSUserDefaults(NSUserDefaults_NSURLExtras)
+ (__CFString)_web_preferredLanguageCode;
+ (void)_web_addDefaultsChangeObserver;
+ (void)_web_defaultsDidChange;
@end

@implementation NSUserDefaults(NSUserDefaults_NSURLExtras)

+ (__CFString)_web_preferredLanguageCode
{
  v2 = (void *)[a1 standardUserDefaults];
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_127);
  uint64_t v3 = qword_1EB1ED898;
  v4 = (__CFString *)qword_1EB1ED898;
  if (!qword_1EB1ED898)
  {
    v5 = (void *)[v2 stringArrayForKey:@"AppleLanguages"];
    if ([v5 count]) {
      v4 = (__CFString *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", 0), "_web_HTTPStyleLanguageCode"), "copy");
    }
    else {
      v4 = @"en";
    }
    qword_1EB1ED898 = (uint64_t)v4;
  }
  v6 = v4;
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_127);
  if (!v3) {
    objc_msgSend(a1, "_web_addDefaultsChangeObserver");
  }
  return v6;
}

+ (void)_web_addDefaultsChangeObserver
{
  if (_web_addDefaultsChangeObserver_addDefaultsChangeObserverOnce != -1) {
    dispatch_once(&_web_addDefaultsChangeObserver_addDefaultsChangeObserverOnce, &__block_literal_global_54);
  }
}

+ (void)_web_defaultsDidChange
{
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_127);

  qword_1EB1ED898 = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_127);
}

@end