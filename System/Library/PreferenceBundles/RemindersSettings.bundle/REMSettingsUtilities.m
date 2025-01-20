@interface REMSettingsUtilities
+ (id)groupSpecifierWithHeader:(id)a3;
+ (id)groupSpecifierWithHeader:(id)a3 footer:(id)a4;
+ (id)linkListPreferenceSpecifierNamed:(id)a3 target:(id)a4 keyName:(id)a5 defaultValue:(id)a6 scope:(unint64_t)a7 titles:(id)a8 values:(id)a9;
+ (id)linkListPreferenceSpecifierNamed:(id)a3 target:(id)a4 keyName:(id)a5 detail:(Class)a6 scope:(unint64_t)a7 get:(SEL)a8;
+ (id)radioGroupSpecifierWithHeader:(id)a3 footer:(id)a4 keyName:(id)a5 scope:(unint64_t)a6;
+ (id)standardButtonSpecifierNamed:(id)a3 target:(id)a4 selector:(SEL)a5;
+ (id)standardPreferenceSpecifierNamed:(id)a3 target:(id)a4 cell:(int64_t)a5 detail:(Class)a6 keyName:(id)a7 defaultValue:(id)a8 scope:(unint64_t)a9;
+ (id)standardPreferenceSpecifierNamed:(id)a3 target:(id)a4 cell:(int64_t)a5 detail:(Class)a6 keyName:(id)a7 defaultValue:(id)a8 scope:(unint64_t)a9 set:(SEL)a10 get:(SEL)a11;
+ (id)standardSwitchSpecifierNamed:(id)a3 target:(id)a4 keyName:(id)a5 defaultValue:(id)a6 scope:(unint64_t)a7;
+ (void)_applyKey:(id)a3 scope:(unint64_t)a4 toSpecifier:(id)a5;
@end

@implementation REMSettingsUtilities

+ (id)groupSpecifierWithHeader:(id)a3
{
  return [a1 groupSpecifierWithHeader:a3 footer:0];
}

+ (id)groupSpecifierWithHeader:(id)a3 footer:(id)a4
{
  id v5 = a4;
  v6 = +[PSSpecifier groupSpecifierWithName:a3];
  v7 = v6;
  if (v5) {
    [v6 setProperty:v5 forKey:PSFooterTextGroupKey];
  }

  return v7;
}

+ (id)radioGroupSpecifierWithHeader:(id)a3 footer:(id)a4 keyName:(id)a5 scope:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a5;
  v12 = +[PSSpecifier groupSpecifierWithName:a3];
  v13 = v12;
  if (v10) {
    [v12 setProperty:v10 forKey:PSFooterTextGroupKey];
  }
  [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:PSIsRadioGroupKey];
  [a1 _applyKey:v11 scope:a6 toSpecifier:v13];

  return v13;
}

+ (id)standardPreferenceSpecifierNamed:(id)a3 target:(id)a4 cell:(int64_t)a5 detail:(Class)a6 keyName:(id)a7 defaultValue:(id)a8 scope:(unint64_t)a9
{
  return [a1 standardPreferenceSpecifierNamed:a3 target:a4 cell:a5 detail:a6 keyName:a7 defaultValue:a8 scope:a9 set:0 get:0];
}

+ (id)standardPreferenceSpecifierNamed:(id)a3 target:(id)a4 cell:(int64_t)a5 detail:(Class)a6 keyName:(id)a7 defaultValue:(id)a8 scope:(unint64_t)a9 set:(SEL)a10 get:(SEL)a11
{
  SEL v16 = a10;
  id v17 = a8;
  if (!a10) {
    SEL v16 = "setPreferenceValue:specifier:";
  }
  if (a11) {
    SEL v18 = a11;
  }
  else {
    SEL v18 = "readPreferenceValue:";
  }
  id v19 = a7;
  v20 = +[PSSpecifier preferenceSpecifierNamed:a3 target:a4 set:v16 get:v18 detail:a6 cell:a5 edit:a6];
  v21 = v20;
  if (v17) {
    [v20 setObject:v17 forKeyedSubscript:PSDefaultValueKey];
  }
  [v21 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  [a1 _applyKey:v19 scope:a9 toSpecifier:v21];

  return v21;
}

+ (id)standardSwitchSpecifierNamed:(id)a3 target:(id)a4 keyName:(id)a5 defaultValue:(id)a6 scope:(unint64_t)a7
{
  return [a1 standardPreferenceSpecifierNamed:a3 target:a4 cell:6 detail:0 keyName:a5 defaultValue:a6 scope:a7];
}

+ (id)standardButtonSpecifierNamed:(id)a3 target:(id)a4 selector:(SEL)a5
{
  v6 = +[PSSpecifier preferenceSpecifierNamed:a3 target:a4 set:0 get:0 detail:0 cell:13 edit:0];
  [v6 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  [v6 setButtonAction:a5];

  return v6;
}

+ (id)linkListPreferenceSpecifierNamed:(id)a3 target:(id)a4 keyName:(id)a5 defaultValue:(id)a6 scope:(unint64_t)a7 titles:(id)a8 values:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  v22 = [a1 standardPreferenceSpecifierNamed:v21 target:v20 cell:2 detail:objc_opt_class() keyName:v19 defaultValue:v18 scope:a7];

  [v22 setValues:v16 titles:v17];

  return v22;
}

+ (id)linkListPreferenceSpecifierNamed:(id)a3 target:(id)a4 keyName:(id)a5 detail:(Class)a6 scope:(unint64_t)a7 get:(SEL)a8
{
  return [a1 standardPreferenceSpecifierNamed:a3 target:a4 cell:2 detail:a6 keyName:a5 defaultValue:0 scope:a7 set:0 get:a8];
}

+ (void)_applyKey:(id)a3 scope:(unint64_t)a4 toSpecifier:(id)a5
{
  id v12 = a5;
  [v12 setObject:a3 forKeyedSubscript:PSKeyNameKey];
  if (a4)
  {
    if (a4 == 1)
    {
      uint64_t v10 = REMAppBundleIdentifier;
      [v12 setObject:REMAppBundleIdentifier forKeyedSubscript:PSDefaultsKey];
      id v11 = &PSContainerBundleIDKey;
      goto LABEL_8;
    }
    v7 = v12;
    if (a4 != 2) {
      goto LABEL_9;
    }
    uint64_t v8 = REMAppGroupBundleIdentifier;
    [v12 setObject:REMAppGroupBundleIdentifier forKeyedSubscript:PSAppGroupBundleIDKey];
    [v12 setObject:v8 forKeyedSubscript:PSContainerBundleIDKey];
    v9 = (uint64_t *)&REMAppBundleIdentifier;
  }
  else
  {
    v9 = (uint64_t *)&REMDaemonBundleIdentifier;
  }
  uint64_t v10 = *v9;
  id v11 = &PSDefaultsKey;
LABEL_8:
  [v12 setObject:v10 forKeyedSubscript:*v11];
  v7 = v12;
LABEL_9:
}

@end