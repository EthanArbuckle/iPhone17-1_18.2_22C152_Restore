@interface INSearchAlarmIntent
+ (BOOL)supportsSecureCoding;
- (INAlarmSearch)alarmSearch;
- (INSearchAlarmIntent)initWithAlarmSearch:(id)a3 alarmSearchType:(int64_t)a4 alarms:(id)a5;
- (NSArray)alarms;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)alarmSearchType;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setAlarmSearch:(id)a3;
- (void)setAlarmSearchType:(int64_t)a3;
- (void)setAlarms:(id)a3;
@end

@implementation INSearchAlarmIntent

- (id)verb
{
  return @"SearchAlarm";
}

- (id)domain
{
  return @"Alarm";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INSearchAlarmIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v12[0] = @"alarmSearch";
  v3 = [(INSearchAlarmIntent *)self alarmSearch];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[0] = v4;
  v12[1] = @"alarmSearchType";
  int64_t v5 = [(INSearchAlarmIntent *)self alarmSearchType];
  if ((unint64_t)(v5 - 1) > 4) {
    id v6 = @"unknown";
  }
  else {
    id v6 = off_1E55209C8[v5 - 1];
  }
  v7 = v6;
  v13[1] = v7;
  v12[2] = @"alarms";
  v8 = [(INSearchAlarmIntent *)self alarms];
  v9 = v8;
  if (!v8)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  if (!v8) {

  }
  if (!v3) {

  }
  return v10;
}

- (void)setAlarms:(id)a3
{
  id v4 = a3;
  id v6 = [(INSearchAlarmIntent *)self _typedBackingStore];
  int64_t v5 = INIntentSlotValueTransformToAlarms(v4);

  [v6 setAlarms:v5];
}

- (NSArray)alarms
{
  v2 = [(INSearchAlarmIntent *)self _typedBackingStore];
  v3 = [v2 alarms];
  id v4 = INIntentSlotValueTransformFromAlarms(v3);

  return (NSArray *)v4;
}

- (void)setAlarmSearchType:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  id v4 = [(INSearchAlarmIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3 > 4) {
    [v4 setHasAlarmSearchType:0];
  }
  else {
    [v4 setAlarmSearchType:v3];
  }
}

- (int64_t)alarmSearchType
{
  unint64_t v3 = [(INSearchAlarmIntent *)self _typedBackingStore];
  unsigned __int8 v4 = [v3 hasAlarmSearchType];
  id v5 = [(INSearchAlarmIntent *)self _typedBackingStore];
  unsigned int v6 = [v5 alarmSearchType];
  if (((v6 < 5) & v4) != 0) {
    int64_t v7 = v6 + 1;
  }
  else {
    int64_t v7 = 0;
  }

  return v7;
}

- (void)setAlarmSearch:(id)a3
{
  id v4 = a3;
  id v6 = [(INSearchAlarmIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToAlarmSearch(v4);

  [v6 setAlarmSearch:v5];
}

- (INAlarmSearch)alarmSearch
{
  v2 = [(INSearchAlarmIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 alarmSearch];
  id v4 = INIntentSlotValueTransformFromAlarmSearch(v3);

  return (INAlarmSearch *)v4;
}

- (INSearchAlarmIntent)initWithAlarmSearch:(id)a3 alarmSearchType:(int64_t)a4 alarms:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)INSearchAlarmIntent;
  v10 = [(INIntent *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(INSearchAlarmIntent *)v10 setAlarmSearch:v8];
    [(INSearchAlarmIntent *)v11 setAlarmSearchType:a4];
    [(INSearchAlarmIntent *)v11 setAlarms:v9];
  }

  return v11;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INSearchAlarmIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INSearchAlarmIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 intentMetadata];

  return v3;
}

- (id)_typedBackingStore
{
  v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v3 = v2;
  }
  else {
    unint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end