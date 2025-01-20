@interface INCreateAlarmIntent
+ (BOOL)supportsSecureCoding;
- (INCreateAlarmIntent)initWithRelativeOffsetInMinutes:(id)a3 time:(id)a4 label:(id)a5 alarmRepeatScheduleOptions:(unint64_t)a6;
- (INDateComponentsRange)time;
- (INSpeakableString)label;
- (NSNumber)relativeOffsetInMinutes;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (unint64_t)alarmRepeatScheduleOptions;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setAlarmRepeatScheduleOptions:(unint64_t)a3;
- (void)setLabel:(id)a3;
- (void)setRelativeOffsetInMinutes:(id)a3;
- (void)setTime:(id)a3;
@end

@implementation INCreateAlarmIntent

- (id)verb
{
  return @"CreateAlarm";
}

- (id)domain
{
  return @"Alarm";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = a4;
  v7 = [(INCreateAlarmIntent *)self _typedBackingStore];
  id v11 = v6;
  v8 = (void *)[v7 copy];
  v9 = [v7 time];
  v10 = INIntentSlotValueRedactedDateTimeRangeFromDateTimeRange(v9, a3);

  [v8 setTime:v10];
  [(INIntent *)self setBackingStore:v8];
}

- (id)_dictionaryRepresentation
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v13[0] = @"relativeOffsetInMinutes";
  v3 = [(INCreateAlarmIntent *)self relativeOffsetInMinutes];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v4;
  v13[1] = @"time";
  v5 = [(INCreateAlarmIntent *)self time];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v6;
  v13[2] = @"label";
  v7 = [(INCreateAlarmIntent *)self label];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v8;
  v13[3] = @"alarmRepeatScheduleOptions";
  v9 = INAlarmRepeatScheduleOptionsGetNames([(INCreateAlarmIntent *)self alarmRepeatScheduleOptions]);
  v10 = v9;
  if (!v9)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[3] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  if (!v9) {

  }
  if (!v7) {
  if (!v5)
  }

  if (!v3) {

  }
  return v11;
}

- (void)setAlarmRepeatScheduleOptions:(unint64_t)a3
{
  v5 = [(INCreateAlarmIntent *)self _typedBackingStore];
  [v5 clearAlarmRepeatScheduleOptions];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__INCreateAlarmIntent_setAlarmRepeatScheduleOptions___block_invoke;
  v6[3] = &unk_1E5520C28;
  v6[4] = self;
  INAlarmRepeatScheduleOptionsEnumerateBackingTypes(a3, v6);
}

void __53__INCreateAlarmIntent_setAlarmRepeatScheduleOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _typedBackingStore];
  [v3 addAlarmRepeatScheduleOptions:a2];
}

- (unint64_t)alarmRepeatScheduleOptions
{
  unint64_t v8 = 0;
  id v3 = [(INCreateAlarmIntent *)self _typedBackingStore];
  uint64_t v4 = [v3 alarmRepeatScheduleOptionsCount];

  if (!v4) {
    return 0;
  }
  for (uint64_t i = 0; i != v4; ++i)
  {
    id v6 = [(INCreateAlarmIntent *)self _typedBackingStore];
    INAlarmRepeatScheduleOptionsAddBackingType((uint64_t *)&v8, [v6 alarmRepeatScheduleOptionsAtIndex:i]);
  }
  return v8;
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  id v6 = [(INCreateAlarmIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToDataString(v4);

  [v6 setLabel:v5];
}

- (INSpeakableString)label
{
  v2 = [(INCreateAlarmIntent *)self _typedBackingStore];
  id v3 = [v2 label];
  id v4 = INIntentSlotValueTransformFromDataString(v3);

  return (INSpeakableString *)v4;
}

- (void)setTime:(id)a3
{
  id v4 = a3;
  id v6 = [(INCreateAlarmIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToDateTimeRange(v4);

  [v6 setTime:v5];
}

- (INDateComponentsRange)time
{
  v2 = [(INCreateAlarmIntent *)self _typedBackingStore];
  id v3 = [v2 time];
  id v4 = INIntentSlotValueTransformFromDateTimeRange(v3);

  return (INDateComponentsRange *)v4;
}

- (void)setRelativeOffsetInMinutes:(id)a3
{
  id v5 = a3;
  id v4 = [(INCreateAlarmIntent *)self _typedBackingStore];
  if (v5) {
    objc_msgSend(v4, "setRelativeOffsetInMinutes:", objc_msgSend(v5, "intValue"));
  }
  else {
    [v4 setHasRelativeOffsetInMinutes:0];
  }
}

- (NSNumber)relativeOffsetInMinutes
{
  id v3 = [(INCreateAlarmIntent *)self _typedBackingStore];
  if ([v3 hasRelativeOffsetInMinutes])
  {
    id v4 = NSNumber;
    id v5 = [(INCreateAlarmIntent *)self _typedBackingStore];
    id v6 = objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "relativeOffsetInMinutes"));
  }
  else
  {
    id v6 = 0;
  }

  return (NSNumber *)v6;
}

- (INCreateAlarmIntent)initWithRelativeOffsetInMinutes:(id)a3 time:(id)a4 label:(id)a5 alarmRepeatScheduleOptions:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)INCreateAlarmIntent;
  v13 = [(INIntent *)&v16 init];
  v14 = v13;
  if (v13)
  {
    [(INCreateAlarmIntent *)v13 setRelativeOffsetInMinutes:v10];
    [(INCreateAlarmIntent *)v14 setTime:v11];
    [(INCreateAlarmIntent *)v14 setLabel:v12];
    [(INCreateAlarmIntent *)v14 setAlarmRepeatScheduleOptions:a6];
  }

  return v14;
}

- (id)_categoryVerb
{
  return @"Create";
}

- (int64_t)_intentCategory
{
  return 8;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INCreateAlarmIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INCreateAlarmIntent *)self _typedBackingStore];
  id v3 = [v2 intentMetadata];

  return v3;
}

- (id)_typedBackingStore
{
  v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end