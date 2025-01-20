@interface INSetBinarySettingIntent
+ (BOOL)supportsSecureCoding;
- (INSetBinarySettingIntent)initWithSettingMetadata:(id)a3 binaryValue:(int64_t)a4 temporalEventTrigger:(id)a5;
- (INSettingMetadata)settingMetadata;
- (INTemporalEventTrigger)temporalEventTrigger;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (int64_t)binaryValue;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setBinaryValue:(int64_t)a3;
- (void)setSettingMetadata:(id)a3;
- (void)setTemporalEventTrigger:(id)a3;
@end

@implementation INSetBinarySettingIntent

- (id)verb
{
  return @"SetBinarySetting";
}

- (id)domain
{
  return @"Settings";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INSetBinarySettingIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v12[0] = @"settingMetadata";
  v3 = [(INSetBinarySettingIntent *)self settingMetadata];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[0] = v4;
  v12[1] = @"binaryValue";
  int64_t v5 = [(INSetBinarySettingIntent *)self binaryValue];
  if ((unint64_t)(v5 - 1) > 2) {
    id v6 = @"unknown";
  }
  else {
    id v6 = *(&off_1E5520240 + v5 - 1);
  }
  v7 = v6;
  v13[1] = v7;
  v12[2] = @"temporalEventTrigger";
  v8 = [(INSetBinarySettingIntent *)self temporalEventTrigger];
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

- (void)setTemporalEventTrigger:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetBinarySettingIntent *)self _typedBackingStore];
  int64_t v5 = INIntentSlotValueTransformToTemporalEventTrigger(v4);

  [v6 setTemporalEventTrigger:v5];
}

- (INTemporalEventTrigger)temporalEventTrigger
{
  v2 = [(INSetBinarySettingIntent *)self _typedBackingStore];
  v3 = [v2 temporalEventTrigger];
  id v4 = INIntentSlotValueTransformFromTemporalEventTrigger(v3);

  return (INTemporalEventTrigger *)v4;
}

- (void)setBinaryValue:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  id v4 = [(INSetBinarySettingIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3 > 2) {
    [v4 setHasBinaryValue:0];
  }
  else {
    objc_msgSend(v4, "setBinaryValue:");
  }
}

- (int64_t)binaryValue
{
  unint64_t v3 = [(INSetBinarySettingIntent *)self _typedBackingStore];
  int v4 = [v3 hasBinaryValue];
  id v5 = [(INSetBinarySettingIntent *)self _typedBackingStore];
  uint64_t v6 = [v5 binaryValue] - 1;
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

- (void)setSettingMetadata:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetBinarySettingIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToSettingMetadata(v4);

  [v6 setSettingMetadata:v5];
}

- (INSettingMetadata)settingMetadata
{
  v2 = [(INSetBinarySettingIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 settingMetadata];
  id v4 = INIntentSlotValueTransformFromSettingMetadata(v3);

  return (INSettingMetadata *)v4;
}

- (INSetBinarySettingIntent)initWithSettingMetadata:(id)a3 binaryValue:(int64_t)a4 temporalEventTrigger:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)INSetBinarySettingIntent;
  v10 = [(INIntent *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(INSetBinarySettingIntent *)v10 setSettingMetadata:v8];
    [(INSetBinarySettingIntent *)v11 setBinaryValue:a4];
    [(INSetBinarySettingIntent *)v11 setTemporalEventTrigger:v9];
  }

  return v11;
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
  id v5 = [(INSetBinarySettingIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INSetBinarySettingIntent *)self _typedBackingStore];
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