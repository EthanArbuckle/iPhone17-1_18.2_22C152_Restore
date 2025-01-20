@interface BDSUserPreferencesSync
+ (NSArray)syncedPreferenceKeys;
+ (id)objectFromGroupPreferencesForKey:(id)a3;
@end

@implementation BDSUserPreferencesSync

+ (NSArray)syncedPreferenceKeys
{
  if (qword_1002974E8 != -1) {
    dispatch_once(&qword_1002974E8, &stru_10025FC28);
  }
  v2 = (void *)qword_1002974E0;
  return (NSArray *)v2;
}

+ (id)objectFromGroupPreferencesForKey:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)NSUserDefaults);
  v5 = +[BDSAppGroupContainer containerIdentifier];
  v6 = +[BDSAppGroupContainer containerURL];
  id v7 = [v4 _initWithSuiteName:v5 container:v6];

  v8 = [@"watchSynced-" stringByAppendingString:v3];
  v9 = [v7 objectForKey:v8];

  return v9;
}

@end