@interface INUpdateAlarmIntent
+ (BOOL)supportsSecureCoding;
- (INAlarm)alarm;
- (INAlarmSearch)alarmSearch;
- (INDateComponentsRange)proposedTime;
- (INSpeakableString)proposedLabel;
- (INUpdateAlarmIntent)initWithAlarmSearch:(id)a3 alarm:(id)a4 operation:(int64_t)a5 proposedTime:(id)a6 proposedLabel:(id)a7;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)operation;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setAlarm:(id)a3;
- (void)setAlarmSearch:(id)a3;
- (void)setOperation:(int64_t)a3;
- (void)setProposedLabel:(id)a3;
- (void)setProposedTime:(id)a3;
@end

@implementation INUpdateAlarmIntent

- (id)verb
{
  return @"UpdateAlarm";
}

- (id)domain
{
  return @"Alarm";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = a4;
  v7 = [(INUpdateAlarmIntent *)self _typedBackingStore];
  id v11 = v6;
  v8 = (void *)[v7 copy];
  v9 = [v7 proposedTime];
  v10 = INIntentSlotValueRedactedDateTimeRangeFromDateTimeRange(v9, a3);

  [v8 setProposedTime:v10];
  [(INIntent *)self setBackingStore:v8];
}

- (id)_dictionaryRepresentation
{
  v17[5] = *MEMORY[0x1E4F143B8];
  v16[0] = @"alarmSearch";
  v3 = [(INUpdateAlarmIntent *)self alarmSearch];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[0] = v4;
  v16[1] = @"alarm";
  v5 = [(INUpdateAlarmIntent *)self alarm];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[1] = v6;
  v16[2] = @"operation";
  int64_t v7 = [(INUpdateAlarmIntent *)self operation];
  v8 = @"unknown";
  if (v7 == 2) {
    v8 = @"updateTime";
  }
  if (v7 == 1) {
    v8 = @"updateLabel";
  }
  v9 = v8;
  v17[2] = v9;
  v16[3] = @"proposedTime";
  v10 = [(INUpdateAlarmIntent *)self proposedTime];
  id v11 = v10;
  if (!v10)
  {
    id v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[3] = v11;
  v16[4] = @"proposedLabel";
  v12 = [(INUpdateAlarmIntent *)self proposedLabel];
  v13 = v12;
  if (!v12)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[4] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];
  if (!v12) {

  }
  if (!v10) {
  if (!v5)
  }

  if (!v3) {

  }
  return v14;
}

- (void)setProposedLabel:(id)a3
{
  id v4 = a3;
  id v6 = [(INUpdateAlarmIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToDataString(v4);

  [v6 setProposedLabel:v5];
}

- (INSpeakableString)proposedLabel
{
  v2 = [(INUpdateAlarmIntent *)self _typedBackingStore];
  v3 = [v2 proposedLabel];
  id v4 = INIntentSlotValueTransformFromDataString(v3);

  return (INSpeakableString *)v4;
}

- (void)setProposedTime:(id)a3
{
  id v4 = a3;
  id v6 = [(INUpdateAlarmIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToDateTimeRange(v4);

  [v6 setProposedTime:v5];
}

- (INDateComponentsRange)proposedTime
{
  v2 = [(INUpdateAlarmIntent *)self _typedBackingStore];
  v3 = [v2 proposedTime];
  id v4 = INIntentSlotValueTransformFromDateTimeRange(v3);

  return (INDateComponentsRange *)v4;
}

- (void)setOperation:(int64_t)a3
{
  if (a3 == 1) {
    unsigned int v3 = 1;
  }
  else {
    unsigned int v3 = 0x7FFFFFFF;
  }
  if (a3 == 2) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = v3;
  }
  v5 = [(INUpdateAlarmIntent *)self _typedBackingStore];
  id v6 = v5;
  if (v4 == 0x7FFFFFFF) {
    [v5 setHasOperation:0];
  }
  else {
    [v5 setOperation:v4];
  }
}

- (int64_t)operation
{
  unsigned int v3 = [(INUpdateAlarmIntent *)self _typedBackingStore];
  int v4 = [v3 hasOperation];
  v5 = [(INUpdateAlarmIntent *)self _typedBackingStore];
  int v6 = [v5 operation];
  uint64_t v7 = 2 * (v6 == 2);
  if (v6 == 1) {
    uint64_t v7 = 1;
  }
  if (v4) {
    int64_t v8 = v7;
  }
  else {
    int64_t v8 = 0;
  }

  return v8;
}

- (void)setAlarm:(id)a3
{
  id v4 = a3;
  id v6 = [(INUpdateAlarmIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToAlarm(v4);

  [v6 setAlarm:v5];
}

- (INAlarm)alarm
{
  v2 = [(INUpdateAlarmIntent *)self _typedBackingStore];
  unsigned int v3 = [v2 alarm];
  id v4 = INIntentSlotValueTransformFromAlarm(v3);

  return (INAlarm *)v4;
}

- (void)setAlarmSearch:(id)a3
{
  id v4 = a3;
  id v6 = [(INUpdateAlarmIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToAlarmSearch(v4);

  [v6 setAlarmSearch:v5];
}

- (INAlarmSearch)alarmSearch
{
  v2 = [(INUpdateAlarmIntent *)self _typedBackingStore];
  unsigned int v3 = [v2 alarmSearch];
  id v4 = INIntentSlotValueTransformFromAlarmSearch(v3);

  return (INAlarmSearch *)v4;
}

- (INUpdateAlarmIntent)initWithAlarmSearch:(id)a3 alarm:(id)a4 operation:(int64_t)a5 proposedTime:(id)a6 proposedLabel:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)INUpdateAlarmIntent;
  v16 = [(INIntent *)&v19 init];
  v17 = v16;
  if (v16)
  {
    [(INUpdateAlarmIntent *)v16 setAlarmSearch:v12];
    [(INUpdateAlarmIntent *)v17 setAlarm:v13];
    [(INUpdateAlarmIntent *)v17 setOperation:a5];
    [(INUpdateAlarmIntent *)v17 setProposedTime:v14];
    [(INUpdateAlarmIntent *)v17 setProposedLabel:v15];
  }

  return v17;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INUpdateAlarmIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INUpdateAlarmIntent *)self _typedBackingStore];
  unsigned int v3 = [v2 intentMetadata];

  return v3;
}

- (id)_typedBackingStore
{
  v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v3 = v2;
  }
  else {
    unsigned int v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end