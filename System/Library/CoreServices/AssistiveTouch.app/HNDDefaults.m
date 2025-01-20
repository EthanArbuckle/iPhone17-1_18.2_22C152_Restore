@interface HNDDefaults
+ (id)sharedDefaults;
+ (void)initialize;
- (id)preferenceForKey:(id)a3;
- (void)setPreference:(id)a3 forKey:(id)a4;
@end

@implementation HNDDefaults

+ (void)initialize
{
  CFPreferencesAppSynchronize(@"com.apple.handtool");
  id v2 = [objc_allocWithZone((Class)HNDDefaults) init];
  uint64_t v3 = qword_1001F0A58;
  qword_1001F0A58 = (uint64_t)v2;

  _objc_release_x1(v2, v3);
}

+ (id)sharedDefaults
{
  return (id)qword_1001F0A58;
}

- (id)preferenceForKey:(id)a3
{
  if (a3)
  {
    v4 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, @"com.apple.handtool");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setPreference:(id)a3 forKey:(id)a4
{
  if (a4)
  {
    CFPreferencesSetAppValue((CFStringRef)a4, a3, @"com.apple.handtool");
    CFPreferencesAppSynchronize(@"com.apple.handtool");
  }
}

@end