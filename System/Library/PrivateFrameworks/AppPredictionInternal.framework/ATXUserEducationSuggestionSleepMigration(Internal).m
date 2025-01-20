@interface ATXUserEducationSuggestionSleepMigration(Internal)
- (id)server;
- (id)userDefaultsKeyForTrackingSuggestionState;
- (uint64_t)metricClass;
@end

@implementation ATXUserEducationSuggestionSleepMigration(Internal)

- (id)userDefaultsKeyForTrackingSuggestionState
{
  v1 = NSString;
  v5.receiver = a1;
  v5.super_class = (Class)&off_1F2898F28;
  v2 = objc_msgSendSuper2(&v5, sel_userDefaultsKeyForTrackingSuggestionState);
  v3 = [v1 stringWithFormat:@"%@.%@", v2, @"SleepMigration"];

  return v3;
}

- (uint64_t)metricClass
{
  return objc_opt_class();
}

- (id)server
{
  v0 = +[ATXUserEducationSuggestionServer sharedInstance];
  v1 = [v0 sleepMigrationServer];

  return v1;
}

@end