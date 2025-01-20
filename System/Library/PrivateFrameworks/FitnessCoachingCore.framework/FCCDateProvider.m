@interface FCCDateProvider
- (FCCDateProvider)init;
- (id)coachingCalendar;
- (id)coachingDate;
@end

@implementation FCCDateProvider

- (id)coachingDate
{
  v2 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"CoachingDate"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  }
  v4 = v3;

  return v4;
}

- (FCCDateProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)FCCDateProvider;
  v2 = [(FCCDateProvider *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1CB18]);
    uint64_t v4 = [v3 initWithSuiteName:*MEMORY[0x1E4F2BEE8]];
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v4;
  }
  return v2;
}

- (id)coachingCalendar
{
  v2 = [(NSUserDefaults *)self->_userDefaults stringForKey:@"CoachingCalendarIdentifier"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9A8]) initWithCalendarIdentifier:v2];
    uint64_t v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      id v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    }
    v6 = v5;
  }
  else
  {
    v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end