@interface HKMCNotificationSentMetric
+ (NSString)eventName;
- (HKMCNotificationSentMetric)initWithCategory:(id)a3 areHealthNotificationsAuthorized:(id)a4;
- (NSDictionary)eventPayload;
- (NSNumber)areHealthNotificationsAuthorized;
- (NSNumber)internalLiveOnCycleFactorOverrideEnabled;
- (NSNumber)numberOfDaysOffsetFromFertileWindowEnd;
- (NSNumber)numberOfDaysShiftedForFertileWindow;
- (NSNumber)numberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification;
- (NSString)category;
- (id)description;
- (void)setAreHealthNotificationsAuthorized:(id)a3;
- (void)setCategory:(id)a3;
- (void)setEventPayload:(id)a3;
- (void)setInternalLiveOnCycleFactorOverrideEnabled:(id)a3;
- (void)setNumberOfDaysOffsetFromFertileWindowEnd:(id)a3;
- (void)setNumberOfDaysShiftedForFertileWindow:(id)a3;
- (void)setNumberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification:(id)a3;
@end

@implementation HKMCNotificationSentMetric

+ (NSString)eventName
{
  return (NSString *)@"com.apple.health.menstrual-cycles.NotificationSent";
}

- (HKMCNotificationSentMetric)initWithCategory:(id)a3 areHealthNotificationsAuthorized:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKMCNotificationSentMetric;
  v9 = [(HKMCNotificationSentMetric *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_category, a3);
    objc_storeStrong((id *)&v10->_areHealthNotificationsAuthorized, a4);
  }

  return v10;
}

- (NSDictionary)eventPayload
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = [(HKMCNotificationSentMetric *)self category];
  [v3 setObject:v4 forKeyedSubscript:@"category"];

  v5 = [(HKMCNotificationSentMetric *)self areHealthNotificationsAuthorized];
  [v3 setObject:v5 forKeyedSubscript:@"areHealthNotificationsAuthorized"];

  v6 = [(HKMCNotificationSentMetric *)self numberOfDaysShiftedForFertileWindow];
  [v3 setObject:v6 forKeyedSubscript:@"numberOfDaysShiftedForFertileWindow"];

  id v7 = [(HKMCNotificationSentMetric *)self numberOfDaysOffsetFromFertileWindowEnd];
  [v3 setObject:v7 forKeyedSubscript:@"numberOfDaysOffsetFromFertileWindowEnd"];

  id v8 = [(HKMCNotificationSentMetric *)self numberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification];
  [v3 setObject:v8 forKeyedSubscript:@"numberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification"];

  v9 = [(HKMCNotificationSentMetric *)self internalLiveOnCycleFactorOverrideEnabled];
  [v3 setObject:v9 forKeyedSubscript:@"internalLiveOnCycleFactorOverride"];

  v10 = (void *)[v3 copy];
  return (NSDictionary *)v10;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HKMCNotificationSentMetric *)self category];
  v6 = [(HKMCNotificationSentMetric *)self areHealthNotificationsAuthorized];
  id v7 = [(HKMCNotificationSentMetric *)self numberOfDaysShiftedForFertileWindow];
  id v8 = [(HKMCNotificationSentMetric *)self numberOfDaysOffsetFromFertileWindowEnd];
  v9 = [(HKMCNotificationSentMetric *)self numberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification];
  v10 = [(HKMCNotificationSentMetric *)self internalLiveOnCycleFactorOverrideEnabled];
  v11 = [v3 stringWithFormat:@"<%@:%p category:%@ areHealthNotificationsAuthorized:%@ numberOfDaysShiftedForFertileWindow:%@ numberOfDaysOffsetFromFertileWindowEnd:%@ numberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification:%@ internalLiveOnCycleFactorOverrideEnabled:%@>", v4, self, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (void)setEventPayload:(id)a3
{
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (NSNumber)areHealthNotificationsAuthorized
{
  return self->_areHealthNotificationsAuthorized;
}

- (void)setAreHealthNotificationsAuthorized:(id)a3
{
}

- (NSNumber)numberOfDaysShiftedForFertileWindow
{
  return self->_numberOfDaysShiftedForFertileWindow;
}

- (void)setNumberOfDaysShiftedForFertileWindow:(id)a3
{
}

- (NSNumber)numberOfDaysOffsetFromFertileWindowEnd
{
  return self->_numberOfDaysOffsetFromFertileWindowEnd;
}

- (void)setNumberOfDaysOffsetFromFertileWindowEnd:(id)a3
{
}

- (NSNumber)numberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification
{
  return self->_numberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification;
}

- (void)setNumberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification:(id)a3
{
}

- (NSNumber)internalLiveOnCycleFactorOverrideEnabled
{
  return self->_internalLiveOnCycleFactorOverrideEnabled;
}

- (void)setInternalLiveOnCycleFactorOverrideEnabled:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalLiveOnCycleFactorOverrideEnabled, 0);
  objc_storeStrong((id *)&self->_numberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification, 0);
  objc_storeStrong((id *)&self->_numberOfDaysOffsetFromFertileWindowEnd, 0);
  objc_storeStrong((id *)&self->_numberOfDaysShiftedForFertileWindow, 0);
  objc_storeStrong((id *)&self->_areHealthNotificationsAuthorized, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_eventPayload, 0);
}

@end