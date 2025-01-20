@interface INSetLabeledSettingIntent
+ (BOOL)supportsSecureCoding;
- (INSetLabeledSettingIntent)initWithSettingMetadata:(id)a3 labeledValue:(id)a4 temporalEventTrigger:(id)a5;
- (INSettingMetadata)settingMetadata;
- (INTemporalEventTrigger)temporalEventTrigger;
- (NSString)labeledValue;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setLabeledValue:(id)a3;
- (void)setSettingMetadata:(id)a3;
- (void)setTemporalEventTrigger:(id)a3;
@end

@implementation INSetLabeledSettingIntent

- (id)verb
{
  return @"SetLabeledSetting";
}

- (id)domain
{
  return @"Settings";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INSetLabeledSettingIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"settingMetadata";
  v3 = [(INSetLabeledSettingIntent *)self settingMetadata];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v4;
  v11[1] = @"labeledValue";
  v5 = [(INSetLabeledSettingIntent *)self labeledValue];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v6;
  v11[2] = @"temporalEventTrigger";
  v7 = [(INSetLabeledSettingIntent *)self temporalEventTrigger];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (!v7) {

  }
  if (!v5) {
  if (!v3)
  }

  return v9;
}

- (void)setTemporalEventTrigger:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetLabeledSettingIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToTemporalEventTrigger(v4);

  [v6 setTemporalEventTrigger:v5];
}

- (INTemporalEventTrigger)temporalEventTrigger
{
  v2 = [(INSetLabeledSettingIntent *)self _typedBackingStore];
  v3 = [v2 temporalEventTrigger];
  id v4 = INIntentSlotValueTransformFromTemporalEventTrigger(v3);

  return (INTemporalEventTrigger *)v4;
}

- (void)setLabeledValue:(id)a3
{
  id v4 = a3;
  id v5 = [(INSetLabeledSettingIntent *)self _typedBackingStore];
  [v5 setLabeledValue:v4];
}

- (NSString)labeledValue
{
  v2 = [(INSetLabeledSettingIntent *)self _typedBackingStore];
  v3 = [v2 labeledValue];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (void)setSettingMetadata:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetLabeledSettingIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToSettingMetadata(v4);

  [v6 setSettingMetadata:v5];
}

- (INSettingMetadata)settingMetadata
{
  v2 = [(INSetLabeledSettingIntent *)self _typedBackingStore];
  v3 = [v2 settingMetadata];
  id v4 = INIntentSlotValueTransformFromSettingMetadata(v3);

  return (INSettingMetadata *)v4;
}

- (INSetLabeledSettingIntent)initWithSettingMetadata:(id)a3 labeledValue:(id)a4 temporalEventTrigger:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)INSetLabeledSettingIntent;
  v11 = [(INIntent *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(INSetLabeledSettingIntent *)v11 setSettingMetadata:v8];
    [(INSetLabeledSettingIntent *)v12 setLabeledValue:v9];
    [(INSetLabeledSettingIntent *)v12 setTemporalEventTrigger:v10];
  }

  return v12;
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
  id v5 = [(INSetLabeledSettingIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INSetLabeledSettingIntent *)self _typedBackingStore];
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