@interface INChangeAlarmStatusIntent
+ (BOOL)supportsSecureCoding;
- (INAlarmSearch)alarmSearch;
- (INChangeAlarmStatusIntent)initWithAlarmSearch:(id)a3 alarms:(id)a4 operation:(int64_t)a5;
- (NSArray)alarms;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)operation;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setAlarmSearch:(id)a3;
- (void)setAlarms:(id)a3;
- (void)setOperation:(int64_t)a3;
@end

@implementation INChangeAlarmStatusIntent

- (id)verb
{
  return @"ChangeAlarmStatus";
}

- (id)domain
{
  return @"Alarm";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INChangeAlarmStatusIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v12[0] = @"alarmSearch";
  v3 = [(INChangeAlarmStatusIntent *)self alarmSearch];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[0] = v4;
  v12[1] = @"alarms";
  v5 = [(INChangeAlarmStatusIntent *)self alarms];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[1] = v6;
  v12[2] = @"operation";
  int64_t v7 = [(INChangeAlarmStatusIntent *)self operation];
  if ((unint64_t)(v7 - 1) > 2) {
    v8 = @"unknown";
  }
  else {
    v8 = off_1E5520730[v7 - 1];
  }
  v9 = v8;
  v13[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  if (!v5) {
  if (!v3)
  }

  return v10;
}

- (void)setOperation:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  v4 = [(INChangeAlarmStatusIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3 > 2) {
    [v4 setHasOperation:0];
  }
  else {
    objc_msgSend(v4, "setOperation:");
  }
}

- (int64_t)operation
{
  unint64_t v3 = [(INChangeAlarmStatusIntent *)self _typedBackingStore];
  int v4 = [v3 hasOperation];
  id v5 = [(INChangeAlarmStatusIntent *)self _typedBackingStore];
  uint64_t v6 = [v5 operation] - 1;
  if (v6 <= 2) {
    int64_t v7 = v6 + 1;
  }
  else {
    int64_t v7 = 0;
  }
  if (v4) {
    int64_t v8 = v7;
  }
  else {
    int64_t v8 = 0;
  }

  return v8;
}

- (void)setAlarms:(id)a3
{
  id v4 = a3;
  id v6 = [(INChangeAlarmStatusIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToAlarms(v4);

  [v6 setAlarms:v5];
}

- (NSArray)alarms
{
  v2 = [(INChangeAlarmStatusIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 alarms];
  id v4 = INIntentSlotValueTransformFromAlarms(v3);

  return (NSArray *)v4;
}

- (void)setAlarmSearch:(id)a3
{
  id v4 = a3;
  id v6 = [(INChangeAlarmStatusIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToAlarmSearch(v4);

  [v6 setAlarmSearch:v5];
}

- (INAlarmSearch)alarmSearch
{
  v2 = [(INChangeAlarmStatusIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 alarmSearch];
  id v4 = INIntentSlotValueTransformFromAlarmSearch(v3);

  return (INAlarmSearch *)v4;
}

- (INChangeAlarmStatusIntent)initWithAlarmSearch:(id)a3 alarms:(id)a4 operation:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)INChangeAlarmStatusIntent;
  v10 = [(INIntent *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(INChangeAlarmStatusIntent *)v10 setAlarmSearch:v8];
    [(INChangeAlarmStatusIntent *)v11 setAlarms:v9];
    [(INChangeAlarmStatusIntent *)v11 setOperation:a5];
  }

  return v11;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INChangeAlarmStatusIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INChangeAlarmStatusIntent *)self _typedBackingStore];
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