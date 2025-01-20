@interface INDeleteAlarmIntent
+ (BOOL)supportsSecureCoding;
- (INAlarmSearch)alarmSearch;
- (INDeleteAlarmIntent)initWithAlarmSearch:(id)a3 alarms:(id)a4;
- (NSArray)alarms;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setAlarmSearch:(id)a3;
- (void)setAlarms:(id)a3;
@end

@implementation INDeleteAlarmIntent

- (id)verb
{
  return @"DeleteAlarm";
}

- (id)domain
{
  return @"Alarm";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INDeleteAlarmIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"alarmSearch";
  v3 = [(INDeleteAlarmIntent *)self alarmSearch];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"alarms";
  v10[0] = v4;
  v5 = [(INDeleteAlarmIntent *)self alarms];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (!v5) {

  }
  if (!v3) {

  }
  return v7;
}

- (void)setAlarms:(id)a3
{
  id v4 = a3;
  id v6 = [(INDeleteAlarmIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToAlarms(v4);

  [v6 setAlarms:v5];
}

- (NSArray)alarms
{
  v2 = [(INDeleteAlarmIntent *)self _typedBackingStore];
  v3 = [v2 alarms];
  id v4 = INIntentSlotValueTransformFromAlarms(v3);

  return (NSArray *)v4;
}

- (void)setAlarmSearch:(id)a3
{
  id v4 = a3;
  id v6 = [(INDeleteAlarmIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToAlarmSearch(v4);

  [v6 setAlarmSearch:v5];
}

- (INAlarmSearch)alarmSearch
{
  v2 = [(INDeleteAlarmIntent *)self _typedBackingStore];
  v3 = [v2 alarmSearch];
  id v4 = INIntentSlotValueTransformFromAlarmSearch(v3);

  return (INAlarmSearch *)v4;
}

- (INDeleteAlarmIntent)initWithAlarmSearch:(id)a3 alarms:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)INDeleteAlarmIntent;
  v8 = [(INIntent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(INDeleteAlarmIntent *)v8 setAlarmSearch:v6];
    [(INDeleteAlarmIntent *)v9 setAlarms:v7];
  }

  return v9;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INDeleteAlarmIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INDeleteAlarmIntent *)self _typedBackingStore];
  v3 = [v2 intentMetadata];

  return v3;
}

- (id)_typedBackingStore
{
  v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end