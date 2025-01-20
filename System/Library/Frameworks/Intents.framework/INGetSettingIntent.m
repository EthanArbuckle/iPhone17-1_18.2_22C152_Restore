@interface INGetSettingIntent
+ (BOOL)supportsSecureCoding;
- (INGetSettingIntent)initWithSettingMetadata:(id)a3;
- (INGetSettingIntent)initWithSettingMetadata:(id)a3 confirmationValue:(int64_t)a4;
- (INSettingMetadata)settingMetadata;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (int64_t)confirmationValue;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setConfirmationValue:(int64_t)a3;
- (void)setSettingMetadata:(id)a3;
@end

@implementation INGetSettingIntent

- (INGetSettingIntent)initWithSettingMetadata:(id)a3
{
  return [(INGetSettingIntent *)self initWithSettingMetadata:a3 confirmationValue:0];
}

- (id)verb
{
  return @"GetSetting";
}

- (id)domain
{
  return @"Settings";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INGetSettingIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"settingMetadata";
  v3 = [(INGetSettingIntent *)self settingMetadata];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = @"confirmationValue";
  v11[0] = v4;
  int64_t v5 = [(INGetSettingIntent *)self confirmationValue];
  if ((unint64_t)(v5 - 1) > 2) {
    id v6 = @"unknown";
  }
  else {
    id v6 = *(&off_1E5520240 + v5 - 1);
  }
  v7 = v6;
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  if (!v3) {

  }
  return v8;
}

- (void)setConfirmationValue:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  v4 = [(INGetSettingIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3 > 2) {
    [v4 setHasConfirmationValue:0];
  }
  else {
    objc_msgSend(v4, "setConfirmationValue:");
  }
}

- (int64_t)confirmationValue
{
  unint64_t v3 = [(INGetSettingIntent *)self _typedBackingStore];
  int v4 = [v3 hasConfirmationValue];
  id v5 = [(INGetSettingIntent *)self _typedBackingStore];
  uint64_t v6 = [v5 confirmationValue] - 1;
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
  id v6 = [(INGetSettingIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToSettingMetadata(v4);

  [v6 setSettingMetadata:v5];
}

- (INSettingMetadata)settingMetadata
{
  v2 = [(INGetSettingIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 settingMetadata];
  id v4 = INIntentSlotValueTransformFromSettingMetadata(v3);

  return (INSettingMetadata *)v4;
}

- (INGetSettingIntent)initWithSettingMetadata:(id)a3 confirmationValue:(int64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INGetSettingIntent;
  int64_t v7 = [(INIntent *)&v10 init];
  int64_t v8 = v7;
  if (v7)
  {
    [(INGetSettingIntent *)v7 setSettingMetadata:v6];
    [(INGetSettingIntent *)v8 setConfirmationValue:a4];
  }

  return v8;
}

- (id)_categoryVerb
{
  return @"View";
}

- (int64_t)_intentCategory
{
  return 1;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INGetSettingIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INGetSettingIntent *)self _typedBackingStore];
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