@interface INSetTemporalSettingIntent
+ (BOOL)supportsSecureCoding;
- (INDateComponentsRange)timeValue;
- (INSetTemporalSettingIntent)initWithSettingMetadata:(id)a3 timeValue:(id)a4 temporalEventTrigger:(id)a5 action:(int64_t)a6;
- (INSettingMetadata)settingMetadata;
- (INTemporalEventTrigger)temporalEventTrigger;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (int64_t)action;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setAction:(int64_t)a3;
- (void)setSettingMetadata:(id)a3;
- (void)setTemporalEventTrigger:(id)a3;
- (void)setTimeValue:(id)a3;
@end

@implementation INSetTemporalSettingIntent

- (id)verb
{
  return @"SetTemporalSetting";
}

- (id)domain
{
  return @"Settings";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INSetTemporalSettingIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v14[0] = @"settingMetadata";
  v3 = [(INSetTemporalSettingIntent *)self settingMetadata];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[0] = v4;
  v14[1] = @"timeValue";
  v5 = [(INSetTemporalSettingIntent *)self timeValue];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[1] = v6;
  v14[2] = @"temporalEventTrigger";
  v7 = [(INSetTemporalSettingIntent *)self temporalEventTrigger];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[2] = v8;
  v14[3] = @"action";
  int64_t v9 = [(INSetTemporalSettingIntent *)self action];
  if ((unint64_t)(v9 - 1) > 2) {
    v10 = @"unknown";
  }
  else {
    v10 = *(&off_1E55202F8 + v9 - 1);
  }
  v11 = v10;
  v15[3] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];

  if (!v7) {
  if (!v5)
  }

  if (!v3) {

  }
  return v12;
}

- (void)setAction:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  v4 = [(INSetTemporalSettingIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3 > 2) {
    [v4 setHasAction:0];
  }
  else {
    objc_msgSend(v4, "setAction:");
  }
}

- (int64_t)action
{
  unint64_t v3 = [(INSetTemporalSettingIntent *)self _typedBackingStore];
  int v4 = [v3 hasAction];
  id v5 = [(INSetTemporalSettingIntent *)self _typedBackingStore];
  uint64_t v6 = [v5 action] - 1;
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

- (void)setTemporalEventTrigger:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetTemporalSettingIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToTemporalEventTrigger(v4);

  [v6 setTemporalEventTrigger:v5];
}

- (INTemporalEventTrigger)temporalEventTrigger
{
  v2 = [(INSetTemporalSettingIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 temporalEventTrigger];
  id v4 = INIntentSlotValueTransformFromTemporalEventTrigger(v3);

  return (INTemporalEventTrigger *)v4;
}

- (void)setTimeValue:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetTemporalSettingIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToDateTimeRangeValue(v4);

  [v6 setTimeValue:v5];
}

- (INDateComponentsRange)timeValue
{
  v2 = [(INSetTemporalSettingIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 timeValue];
  id v4 = INIntentSlotValueTransformFromDateTimeRangeValue(v3);

  return (INDateComponentsRange *)v4;
}

- (void)setSettingMetadata:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetTemporalSettingIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToSettingMetadata(v4);

  [v6 setSettingMetadata:v5];
}

- (INSettingMetadata)settingMetadata
{
  v2 = [(INSetTemporalSettingIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 settingMetadata];
  id v4 = INIntentSlotValueTransformFromSettingMetadata(v3);

  return (INSettingMetadata *)v4;
}

- (INSetTemporalSettingIntent)initWithSettingMetadata:(id)a3 timeValue:(id)a4 temporalEventTrigger:(id)a5 action:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)INSetTemporalSettingIntent;
  v13 = [(INIntent *)&v16 init];
  v14 = v13;
  if (v13)
  {
    [(INSetTemporalSettingIntent *)v13 setSettingMetadata:v10];
    [(INSetTemporalSettingIntent *)v14 setTimeValue:v11];
    [(INSetTemporalSettingIntent *)v14 setTemporalEventTrigger:v12];
    [(INSetTemporalSettingIntent *)v14 setAction:a6];
  }

  return v14;
}

- (id)_categoryVerb
{
  return @"Set";
}

- (int64_t)_intentCategory
{
  return 16;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INSetTemporalSettingIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INSetTemporalSettingIntent *)self _typedBackingStore];
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