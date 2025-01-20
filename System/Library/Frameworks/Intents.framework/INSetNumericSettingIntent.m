@interface INSetNumericSettingIntent
+ (BOOL)supportsSecureCoding;
- (INNumericSettingValue)numericValue;
- (INSetNumericSettingIntent)initWithSettingMetadata:(id)a3 numericValue:(id)a4 boundedValue:(int64_t)a5 action:(int64_t)a6 temporalEventTrigger:(id)a7;
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
- (int64_t)boundedValue;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setAction:(int64_t)a3;
- (void)setBoundedValue:(int64_t)a3;
- (void)setNumericValue:(id)a3;
- (void)setSettingMetadata:(id)a3;
- (void)setTemporalEventTrigger:(id)a3;
@end

@implementation INSetNumericSettingIntent

- (id)verb
{
  return @"SetNumericSetting";
}

- (id)domain
{
  return @"Settings";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INSetNumericSettingIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v18[5] = *MEMORY[0x1E4F143B8];
  v17[0] = @"settingMetadata";
  v3 = [(INSetNumericSettingIntent *)self settingMetadata];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[0] = v4;
  v17[1] = @"numericValue";
  v5 = [(INSetNumericSettingIntent *)self numericValue];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[1] = v6;
  v17[2] = @"boundedValue";
  int64_t v7 = [(INSetNumericSettingIntent *)self boundedValue];
  if ((unint64_t)(v7 - 1) > 2) {
    v8 = @"unknown";
  }
  else {
    v8 = off_1E5520478[v7 - 1];
  }
  v9 = v8;
  v18[2] = v9;
  v17[3] = @"action";
  int64_t v10 = [(INSetNumericSettingIntent *)self action];
  if ((unint64_t)(v10 - 1) > 2) {
    v11 = @"unknown";
  }
  else {
    v11 = *(&off_1E55202F8 + v10 - 1);
  }
  v12 = v11;
  v18[3] = v12;
  v17[4] = @"temporalEventTrigger";
  v13 = [(INSetNumericSettingIntent *)self temporalEventTrigger];
  v14 = v13;
  if (!v13)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[4] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
  if (!v13) {

  }
  if (!v5) {
  if (!v3)
  }

  return v15;
}

- (void)setTemporalEventTrigger:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetNumericSettingIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToTemporalEventTrigger(v4);

  [v6 setTemporalEventTrigger:v5];
}

- (INTemporalEventTrigger)temporalEventTrigger
{
  v2 = [(INSetNumericSettingIntent *)self _typedBackingStore];
  v3 = [v2 temporalEventTrigger];
  id v4 = INIntentSlotValueTransformFromTemporalEventTrigger(v3);

  return (INTemporalEventTrigger *)v4;
}

- (void)setAction:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  id v4 = [(INSetNumericSettingIntent *)self _typedBackingStore];
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
  unint64_t v3 = [(INSetNumericSettingIntent *)self _typedBackingStore];
  int v4 = [v3 hasAction];
  id v5 = [(INSetNumericSettingIntent *)self _typedBackingStore];
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

- (void)setBoundedValue:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  int v4 = [(INSetNumericSettingIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3 > 2) {
    [v4 setHasBoundedValue:0];
  }
  else {
    objc_msgSend(v4, "setBoundedValue:");
  }
}

- (int64_t)boundedValue
{
  unint64_t v3 = [(INSetNumericSettingIntent *)self _typedBackingStore];
  int v4 = [v3 hasBoundedValue];
  id v5 = [(INSetNumericSettingIntent *)self _typedBackingStore];
  uint64_t v6 = [v5 boundedValue] - 1;
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

- (void)setNumericValue:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetNumericSettingIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToNumericSettingValue(v4);

  [v6 setNumericValue:v5];
}

- (INNumericSettingValue)numericValue
{
  v2 = [(INSetNumericSettingIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 numericValue];
  id v4 = INIntentSlotValueTransformFromNumericSettingValue(v3);

  return (INNumericSettingValue *)v4;
}

- (void)setSettingMetadata:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetNumericSettingIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToSettingMetadata(v4);

  [v6 setSettingMetadata:v5];
}

- (INSettingMetadata)settingMetadata
{
  v2 = [(INSetNumericSettingIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 settingMetadata];
  id v4 = INIntentSlotValueTransformFromSettingMetadata(v3);

  return (INSettingMetadata *)v4;
}

- (INSetNumericSettingIntent)initWithSettingMetadata:(id)a3 numericValue:(id)a4 boundedValue:(int64_t)a5 action:(int64_t)a6 temporalEventTrigger:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)INSetNumericSettingIntent;
  v15 = [(INIntent *)&v18 init];
  v16 = v15;
  if (v15)
  {
    [(INSetNumericSettingIntent *)v15 setSettingMetadata:v12];
    [(INSetNumericSettingIntent *)v16 setNumericValue:v13];
    [(INSetNumericSettingIntent *)v16 setBoundedValue:a5];
    [(INSetNumericSettingIntent *)v16 setAction:a6];
    [(INSetNumericSettingIntent *)v16 setTemporalEventTrigger:v14];
  }

  return v16;
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
  id v5 = [(INSetNumericSettingIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INSetNumericSettingIntent *)self _typedBackingStore];
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