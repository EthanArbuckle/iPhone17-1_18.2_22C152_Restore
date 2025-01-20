@interface NavdDoomLaunchTrigger
- (NSDate)triggerDate;
- (NSString)description;
- (NavdDoomLaunchTrigger)initWithTriggerDate:(id)a3;
- (int64_t)type;
@end

@implementation NavdDoomLaunchTrigger

- (NavdDoomLaunchTrigger)initWithTriggerDate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NavdDoomLaunchTrigger;
  v5 = [(NavdDoomLaunchTrigger *)&v9 init];
  if (v5)
  {
    v6 = (NSDate *)[v4 copy];
    triggerDate = v5->_triggerDate;
    v5->_triggerDate = v6;
  }
  return v5;
}

- (int64_t)type
{
  return 0;
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)NavdDoomLaunchTrigger;
  v3 = [(NavdDoomLaunchTrigger *)&v8 description];
  id v4 = [(NavdDoomLaunchTrigger *)self triggerDate];
  v5 = MapsSuggestionsStringFromDate(v4);
  v6 = +[NSString stringWithFormat:@"%@ triggerDate=%@", v3, v5];

  return (NSString *)v6;
}

- (NSDate)triggerDate
{
  return self->_triggerDate;
}

- (void).cxx_destruct
{
}

@end