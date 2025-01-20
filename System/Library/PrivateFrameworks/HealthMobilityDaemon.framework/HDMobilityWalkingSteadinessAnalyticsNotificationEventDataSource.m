@interface HDMobilityWalkingSteadinessAnalyticsNotificationEventDataSource
- (HDMobilityWalkingSteadinessAnalyticsNotificationEventDataSource)initWithProfile:(id)a3 category:(id)a4 value:(int64_t)a5 date:(id)a6;
- (id)ageWithError:(id *)a3;
- (id)areHealthNotificationsAuthorizedWithError:(id *)a3;
- (id)biologicalSexWithError:(id *)a3;
- (id)daysSinceLastNotificationWithError:(id *)a3;
- (id)notificationClassificationWithError:(id *)a3;
- (id)notificationTypeWithError:(id *)a3;
@end

@implementation HDMobilityWalkingSteadinessAnalyticsNotificationEventDataSource

- (HDMobilityWalkingSteadinessAnalyticsNotificationEventDataSource)initWithProfile:(id)a3 category:(id)a4 value:(int64_t)a5 date:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HDMobilityWalkingSteadinessAnalyticsNotificationEventDataSource;
  v13 = [(HDMobilityWalkingSteadinessAnalyticsNotificationEventDataSource *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_profile, v10);
    objc_storeStrong((id *)&v14->_category, a4);
    v14->_value = a5;
    objc_storeStrong((id *)&v14->_date, a6);
  }

  return v14;
}

- (id)ageWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v5 = [MEMORY[0x263EFF910] date];
  v6 = +[HDMobilityAnalyticsUtilities ageWithProfile:WeakRetained date:v5 error:a3];

  return v6;
}

- (id)biologicalSexWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v5 = +[HDMobilityAnalyticsUtilities biologicalSexWithProfile:WeakRetained error:a3];

  return v5;
}

- (id)daysSinceLastNotificationWithError:(id *)a3
{
  v5 = HKMobilityWalkingSteadinessEventType();
  v6 = HDSampleEntityPredicateForEndDate();
  v7 = (void *)MEMORY[0x263F43318];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v16 = 0;
  v9 = [v7 mostRecentSampleWithType:v5 profile:WeakRetained encodingOptions:0 predicate:v6 anchor:0 error:&v16];
  id v10 = v16;

  if (v9)
  {
    id v11 = (void *)MEMORY[0x263F452B0];
    id v12 = [v9 endDate];
    v13 = [v11 numberOfDaysBetweenStartDate:v12 endDate:self->_date];
    goto LABEL_8;
  }
  id v14 = v10;
  id v12 = v14;
  if (v14)
  {
    if (a3)
    {
      id v12 = v14;
      v13 = 0;
      *a3 = v12;
      goto LABEL_8;
    }
    _HKLogDroppedError();
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (id)notificationClassificationWithError:(id *)a3
{
  return (id)[MEMORY[0x263F452D0] payloadStringForWalkingSteadinessNotificationClassificationWithValue:self->_value];
}

- (id)notificationTypeWithError:(id *)a3
{
  return (id)[MEMORY[0x263F452D0] payloadStringForWalkingSteadinessNotificationTypeWithValue:self->_value];
}

- (id)areHealthNotificationsAuthorizedWithError:(id *)a3
{
  v3 = NSNumber;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v5 = [WeakRetained notificationManager];
  v6 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v5, "areHealthNotificationsAuthorized"));

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end