@interface FCCGoalProgressConfiguration
- (FCCAlmostThereConfiguration)almostThereConfiguration;
- (FCCAtypicalDayConfiguration)atypicalDayConfiguration;
- (FCCCompletionOffTrackConfiguration)completionOffTrackConfiguration;
- (FCCGoalProgressConfiguration)initWithMinimumNumberOfActiveDays:(int64_t)a3 userStartOfDay:(id)a4 userEndOfDay:(id)a5 expirationDate:(id)a6 almostThereConfiguration:(id)a7 atypicalDayConfiguration:(id)a8 completionOffTrackConfiguration:(id)a9;
- (FCCGoalProgressConfiguration)initWithProtobuf:(id)a3;
- (FCCGoalProgressConfiguration)initWithTransportData:(id)a3;
- (NSDate)expirationDate;
- (NSDate)userEndOfDay;
- (NSDate)userStartOfDay;
- (NSString)description;
- (id)protobuf;
- (id)transportData;
- (int64_t)minimumNumberOfActiveDays;
@end

@implementation FCCGoalProgressConfiguration

- (FCCGoalProgressConfiguration)initWithMinimumNumberOfActiveDays:(int64_t)a3 userStartOfDay:(id)a4 userEndOfDay:(id)a5 expirationDate:(id)a6 almostThereConfiguration:(id)a7 atypicalDayConfiguration:(id)a8 completionOffTrackConfiguration:(id)a9
{
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)FCCGoalProgressConfiguration;
  v18 = [(FCCGoalProgressConfiguration *)&v25 init];
  v19 = v18;
  if (v18)
  {
    v18->_minimumNumberOfActiveDays = a3;
    objc_storeStrong((id *)&v18->_userStartOfDay, a4);
    objc_storeStrong((id *)&v19->_userEndOfDay, a5);
    objc_storeStrong((id *)&v19->_expirationDate, a6);
    objc_storeStrong((id *)&v19->_almostThereConfiguration, a7);
    objc_storeStrong((id *)&v19->_atypicalDayConfiguration, a8);
    objc_storeStrong((id *)&v19->_completionOffTrackConfiguration, a9);
  }

  return v19;
}

- (NSString)description
{
  v2 = @"YES";
  if (self->_almostThereConfiguration) {
    v3 = @"YES";
  }
  else {
    v3 = @"NO";
  }
  if (self->_atypicalDayConfiguration) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  if (!self->_completionOffTrackConfiguration) {
    v2 = @"NO";
  }
  return (NSString *)[NSString stringWithFormat:@"FCCGoalProgressConfiguration: { \n    minimumNumberOfActiveDays: %ld, \n    userStartOfDay: %@, \n    userEndOfDay: %@, \n    expirationDate: %@ \n    almostThereConfiguration: %@ \n    atypicalDayConfiguration: %@ \n    completionOffTrackConfiguration %@ \n}", *(_OWORD *)&self->_minimumNumberOfActiveDays, self->_userEndOfDay, self->_expirationDate, v3, v4, v2];
}

- (FCCGoalProgressConfiguration)initWithProtobuf:(id)a3
{
  id v4 = a3;
  int v5 = [v4 minimumNumberOfActiveDays];
  id v6 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  [v4 userStartOfDayDate];
  v7 = objc_msgSend(v6, "initWithTimeIntervalSinceReferenceDate:");
  [v4 userEndOfDayDate];
  if (v8 <= 0.0)
  {
    v10 = 0;
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v4 userEndOfDayDate];
    v10 = objc_msgSend(v9, "initWithTimeIntervalSinceReferenceDate:");
  }
  uint64_t v11 = v5;
  id v12 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  [v4 expirationDate];
  v13 = objc_msgSend(v12, "initWithTimeIntervalSinceReferenceDate:");
  v14 = [FCCAlmostThereConfiguration alloc];
  v15 = [v4 almostThereConfiguration];
  id v16 = [(FCCAlmostThereConfiguration *)v14 initWithProtobuf:v15];

  id v17 = [FCCAtypicalDayConfiguration alloc];
  v18 = [v4 atypicalDayConfiguration];
  v19 = [(FCCAtypicalDayConfiguration *)v17 initWithProtobuf:v18];

  v20 = [v4 completionOffTrackConfiguration];
  id v21 = [[FCCCompletionOffTrackConfiguration alloc] initWithProtobuf:v20];
  id v22 = [(FCCGoalProgressConfiguration *)self initWithMinimumNumberOfActiveDays:v11 userStartOfDay:v7 userEndOfDay:v10 expirationDate:v13 almostThereConfiguration:v16 atypicalDayConfiguration:v19 completionOffTrackConfiguration:v21];

  return v22;
}

- (id)protobuf
{
  v3 = objc_alloc_init(FCCGoalProgressConfigurationProtobuf);
  [(FCCGoalProgressConfigurationProtobuf *)v3 setMinimumNumberOfActiveDays:LODWORD(self->_minimumNumberOfActiveDays)];
  [(NSDate *)self->_userStartOfDay timeIntervalSinceReferenceDate];
  -[FCCGoalProgressConfigurationProtobuf setUserStartOfDayDate:](v3, "setUserStartOfDayDate:");
  userEndOfDay = self->_userEndOfDay;
  if (userEndOfDay) {
    [(NSDate *)userEndOfDay timeIntervalSinceReferenceDate];
  }
  else {
    double v5 = 0.0;
  }
  [(FCCGoalProgressConfigurationProtobuf *)v3 setUserEndOfDayDate:v5];
  [(NSDate *)self->_expirationDate timeIntervalSinceReferenceDate];
  -[FCCGoalProgressConfigurationProtobuf setExpirationDate:](v3, "setExpirationDate:");
  id v6 = [(FCCAlmostThereConfiguration *)self->_almostThereConfiguration protobuf];
  [(FCCGoalProgressConfigurationProtobuf *)v3 setAlmostThereConfiguration:v6];

  v7 = [(FCCAtypicalDayConfiguration *)self->_atypicalDayConfiguration protobuf];
  [(FCCGoalProgressConfigurationProtobuf *)v3 setAtypicalDayConfiguration:v7];

  double v8 = [(FCCCompletionOffTrackConfiguration *)self->_completionOffTrackConfiguration protobuf];
  [(FCCGoalProgressConfigurationProtobuf *)v3 setCompletionOffTrackConfiguration:v8];

  return v3;
}

- (FCCGoalProgressConfiguration)initWithTransportData:(id)a3
{
  id v4 = a3;
  double v5 = [[FCCGoalProgressConfigurationProtobuf alloc] initWithData:v4];

  id v6 = [(FCCGoalProgressConfiguration *)self initWithProtobuf:v5];
  return v6;
}

- (id)transportData
{
  v2 = [(FCCGoalProgressConfiguration *)self protobuf];
  v3 = [v2 data];

  return v3;
}

- (int64_t)minimumNumberOfActiveDays
{
  return self->_minimumNumberOfActiveDays;
}

- (NSDate)userStartOfDay
{
  return self->_userStartOfDay;
}

- (NSDate)userEndOfDay
{
  return self->_userEndOfDay;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (FCCAlmostThereConfiguration)almostThereConfiguration
{
  return self->_almostThereConfiguration;
}

- (FCCAtypicalDayConfiguration)atypicalDayConfiguration
{
  return self->_atypicalDayConfiguration;
}

- (FCCCompletionOffTrackConfiguration)completionOffTrackConfiguration
{
  return self->_completionOffTrackConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionOffTrackConfiguration, 0);
  objc_storeStrong((id *)&self->_atypicalDayConfiguration, 0);
  objc_storeStrong((id *)&self->_almostThereConfiguration, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_userEndOfDay, 0);
  objc_storeStrong((id *)&self->_userStartOfDay, 0);
}

@end