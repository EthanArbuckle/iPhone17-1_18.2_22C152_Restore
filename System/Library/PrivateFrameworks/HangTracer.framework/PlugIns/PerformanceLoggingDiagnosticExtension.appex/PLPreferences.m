@interface PLPreferences
+ (void)removeKey:(__CFString *)a3 domain:(__CFString *)a4;
+ (void)setBool:(BOOL)a3 key:(__CFString *)a4 domain:(__CFString *)a5;
+ (void)setDouble:(double)a3 key:(__CFString *)a4 domain:(__CFString *)a5;
+ (void)setInteger:(int64_t)a3 key:(__CFString *)a4 domain:(__CFString *)a5;
+ (void)setString:(__CFString *)a3 key:(__CFString *)a4 domain:(__CFString *)a5;
@end

@implementation PLPreferences

+ (void)setDouble:(double)a3 key:(__CFString *)a4 domain:(__CFString *)a5
{
  id v7 = +[NSNumber numberWithDouble:a3];
  CFPreferencesSetValue(a4, v7, a5, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
}

+ (void)setInteger:(int64_t)a3 key:(__CFString *)a4 domain:(__CFString *)a5
{
  id v7 = +[NSNumber numberWithInteger:a3];
  CFPreferencesSetValue(a4, v7, a5, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
}

+ (void)setString:(__CFString *)a3 key:(__CFString *)a4 domain:(__CFString *)a5
{
}

+ (void)setBool:(BOOL)a3 key:(__CFString *)a4 domain:(__CFString *)a5
{
  v5 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!a3) {
    v5 = (CFPropertyListRef *)&kCFBooleanFalse;
  }
  CFPreferencesSetValue(a4, *v5, a5, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
}

+ (void)removeKey:(__CFString *)a3 domain:(__CFString *)a4
{
}

@end