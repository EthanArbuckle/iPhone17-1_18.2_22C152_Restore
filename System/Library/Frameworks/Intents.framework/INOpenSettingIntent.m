@interface INOpenSettingIntent
+ (BOOL)supportsSecureCoding;
- (INOpenSettingIntent)initWithSettingMetadata:(id)a3 searchQuery:(id)a4;
- (INSettingMetadata)settingMetadata;
- (INSpeakableString)searchQuery;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setSearchQuery:(id)a3;
- (void)setSettingMetadata:(id)a3;
@end

@implementation INOpenSettingIntent

- (INSettingMetadata)settingMetadata
{
  v2 = [(INOpenSettingIntent *)self _typedBackingStore];
  v3 = [v2 settingMetadata];
  v4 = INIntentSlotValueTransformFromSettingMetadata(v3);

  return (INSettingMetadata *)v4;
}

- (void)setSettingMetadata:(id)a3
{
  id v4 = a3;
  id v6 = [(INOpenSettingIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToSettingMetadata(v4);

  [v6 setSettingMetadata:v5];
}

- (INSpeakableString)searchQuery
{
  v2 = [(INOpenSettingIntent *)self _typedBackingStore];
  v3 = [v2 searchQuery];
  id v4 = INIntentSlotValueTransformFromDataString(v3);

  return (INSpeakableString *)v4;
}

- (id)verb
{
  return @"OpenSetting";
}

- (id)domain
{
  return @"Settings";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INOpenSettingIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"settingMetadata";
  v3 = [(INOpenSettingIntent *)self settingMetadata];
  id v4 = v3;
  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"searchQuery";
  v10[0] = v4;
  v5 = [(INOpenSettingIntent *)self searchQuery];
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

- (void)setSearchQuery:(id)a3
{
  id v4 = a3;
  id v6 = [(INOpenSettingIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToDataString(v4);

  [v6 setSearchQuery:v5];
}

- (INOpenSettingIntent)initWithSettingMetadata:(id)a3 searchQuery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)INOpenSettingIntent;
  v8 = [(INIntent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(INOpenSettingIntent *)v8 setSettingMetadata:v6];
    [(INOpenSettingIntent *)v9 setSearchQuery:v7];
  }

  return v9;
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
  id v5 = [(INOpenSettingIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INOpenSettingIntent *)self _typedBackingStore];
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