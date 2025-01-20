@interface HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventDataSource
- (HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventDataSource)initWithHealthStore:(id)a3 category:(id)a4 action:(id)a5;
- (id)_walkingSteadinessEventValueForCategory:(id)a3;
- (id)ageWithError:(id *)a3;
- (id)biologicalSexWithError:(id *)a3;
- (id)notificationClassificationWithError:(id *)a3;
- (id)notificationInteractionTypeWithError:(id *)a3;
- (id)notificationTypeWithError:(id *)a3;
@end

@implementation HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventDataSource

- (HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventDataSource)initWithHealthStore:(id)a3 category:(id)a4 action:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventDataSource;
  v12 = [(HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventDataSource *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_healthStore, a3);
    objc_storeStrong((id *)&v13->_category, a4);
    objc_storeStrong((id *)&v13->_actionIdentifier, a5);
  }

  return v13;
}

- (id)ageWithError:(id *)a3
{
  return +[HKMobilityAnalyticsUtilities ageWithHealthStore:self->_healthStore error:a3];
}

- (id)biologicalSexWithError:(id *)a3
{
  return +[HKMobilityAnalyticsUtilities biologicalSexWithHealthStore:self->_healthStore error:a3];
}

- (id)notificationClassificationWithError:(id *)a3
{
  v3 = [(HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventDataSource *)self _walkingSteadinessEventValueForCategory:self->_category];
  v4 = v3;
  if (v3)
  {
    v5 = +[HKMobilityWalkingSteadinessAnalyticsUtilities payloadStringForWalkingSteadinessNotificationClassificationWithValue:](HKMobilityWalkingSteadinessAnalyticsUtilities, "payloadStringForWalkingSteadinessNotificationClassificationWithValue:", [v3 integerValue]);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)notificationInteractionTypeWithError:(id *)a3
{
  return +[HKMobilityWalkingSteadinessAnalyticsUtilities payloadStringForWalkingSteadinessNotificationInteractionWithActionIdentifier:self->_actionIdentifier];
}

- (id)notificationTypeWithError:(id *)a3
{
  v3 = [(HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventDataSource *)self _walkingSteadinessEventValueForCategory:self->_category];
  v4 = v3;
  if (v3)
  {
    v5 = +[HKMobilityWalkingSteadinessAnalyticsUtilities payloadStringForWalkingSteadinessNotificationTypeWithValue:](HKMobilityWalkingSteadinessAnalyticsUtilities, "payloadStringForWalkingSteadinessNotificationTypeWithValue:", [v3 integerValue]);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_walkingSteadinessEventValueForCategory:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MobilityAppPlugin.WalkingSteadinessInitial.Low"])
  {
    v4 = &unk_1F3B93F10;
  }
  else if ([v3 isEqualToString:@"MobilityAppPlugin.WalkingSteadinessInitial.VeryLow"])
  {
    v4 = &unk_1F3B93F28;
  }
  else if ([v3 isEqualToString:@"MobilityAppPlugin.WalkingSteadinessRepeat.Low"])
  {
    v4 = &unk_1F3B93F40;
  }
  else if ([v3 isEqualToString:@"MobilityAppPlugin.WalkingSteadinessRepeat.VeryLow"])
  {
    v4 = &unk_1F3B93F58;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_category, 0);

  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end