@interface VOTConfiguration
+ (id)rootConfiguration;
+ (void)initialize;
- (id)preferenceForKey:(id)a3;
- (void)setPreference:(id)a3 forKey:(id)a4;
- (void)setPreferenceSync:(id)a3 forKey:(id)a4;
@end

@implementation VOTConfiguration

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    CFPreferencesAppSynchronize(kAXSAccessibilityPreferenceDomain);
    id v2 = [objc_allocWithZone((Class)VOTConfiguration) init];
    v3 = (void *)qword_1001EB6B0;
    qword_1001EB6B0 = (uint64_t)v2;

    qword_1001EB6B8 = (uint64_t)dispatch_queue_create("vot-preference-storage-queue", 0);
    _objc_release_x1();
  }
}

+ (id)rootConfiguration
{
  return (id)qword_1001EB6B0;
}

- (id)preferenceForKey:(id)a3
{
  if (a3)
  {
    v4 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, kAXSAccessibilityPreferenceDomain);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setPreference:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = [v5 copyWithZone:0];

    v8 = qword_1001EB6B8;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100012204;
    v9[3] = &unk_1001B3448;
    id v10 = v6;
    id v5 = v7;
    id v11 = v5;
    dispatch_async(v8, v9);
  }
}

- (void)setPreferenceSync:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = [v5 copyWithZone:0];

    v8 = qword_1001EB6B8;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100012328;
    v9[3] = &unk_1001B3448;
    id v10 = v6;
    id v5 = v7;
    id v11 = v5;
    dispatch_sync(v8, v9);
  }
}

@end