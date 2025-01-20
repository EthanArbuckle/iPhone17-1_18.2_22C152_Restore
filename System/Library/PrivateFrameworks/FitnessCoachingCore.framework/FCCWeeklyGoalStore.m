@interface FCCWeeklyGoalStore
- (FCCWeeklyGoalStore)init;
- (id)currentDisplayContext;
- (void)clearContext;
- (void)updateDisplayContext:(id)a3;
@end

@implementation FCCWeeklyGoalStore

- (FCCWeeklyGoalStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)FCCWeeklyGoalStore;
  v2 = [(FCCWeeklyGoalStore *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.FitnessCoaching"];
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v3;
  }
  return v2;
}

- (id)currentDisplayContext
{
  v2 = [(NSUserDefaults *)self->_userDefaults dictionaryForKey:@"WeeklyGoalDisplayContext"];
  uint64_t v3 = [[FCCWeeklyGoalDisplayContext alloc] initWithDictionary:v2];

  return v3;
}

- (void)updateDisplayContext:(id)a3
{
  id v4 = [a3 dictionaryRepresentation];
  [(NSUserDefaults *)self->_userDefaults setObject:v4 forKey:@"WeeklyGoalDisplayContext"];
}

- (void)clearContext
{
}

- (void).cxx_destruct
{
}

@end