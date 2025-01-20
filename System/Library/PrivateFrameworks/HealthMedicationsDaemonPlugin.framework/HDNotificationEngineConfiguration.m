@interface HDNotificationEngineConfiguration
- (HDNotificationEngineConfiguration)init;
- (HDNotificationEngineConfiguration)initWithCalendar:(id)a3 startGenerationDate:(id)a4 endGenerationDate:(id)a5;
- (NSCalendar)calendar;
- (NSDate)endGenerationDate;
- (NSDate)startGenerationDate;
@end

@implementation HDNotificationEngineConfiguration

- (HDNotificationEngineConfiguration)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDNotificationEngineConfiguration)initWithCalendar:(id)a3 startGenerationDate:(id)a4 endGenerationDate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HDNotificationEngineConfiguration;
  v12 = [(HDNotificationEngineConfiguration *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    startGenerationDate = v12->_startGenerationDate;
    v12->_startGenerationDate = (NSDate *)v13;

    uint64_t v15 = [v11 copy];
    endGenerationDate = v12->_endGenerationDate;
    v12->_endGenerationDate = (NSDate *)v15;

    objc_storeStrong((id *)&v12->_calendar, a3);
  }

  return v12;
}

- (NSDate)startGenerationDate
{
  return self->_startGenerationDate;
}

- (NSDate)endGenerationDate
{
  return self->_endGenerationDate;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_endGenerationDate, 0);
  objc_storeStrong((id *)&self->_startGenerationDate, 0);
}

@end