@interface INGetCarLockStatusIntent
+ (BOOL)supportsSecureCoding;
- (INGetCarLockStatusIntent)initWithCarName:(INSpeakableString *)carName;
- (INSpeakableString)carName;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setCarName:(id)a3;
@end

@implementation INGetCarLockStatusIntent

- (id)verb
{
  return @"GetCarLockStatus";
}

- (id)domain
{
  return @"CarPlay";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INGetCarLockStatusIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v6 = @"carName";
  v2 = [(INGetCarLockStatusIntent *)self carName];
  v3 = v2;
  if (!v2)
  {
    v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  if (!v2) {

  }
  return v4;
}

- (void)setCarName:(id)a3
{
  id v4 = a3;
  id v6 = [(INGetCarLockStatusIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToDataString(v4);

  [v6 setCarName:v5];
}

- (INSpeakableString)carName
{
  v2 = [(INGetCarLockStatusIntent *)self _typedBackingStore];
  v3 = [v2 carName];
  id v4 = INIntentSlotValueTransformFromDataString(v3);

  return (INSpeakableString *)v4;
}

- (INGetCarLockStatusIntent)initWithCarName:(INSpeakableString *)carName
{
  id v4 = carName;
  v8.receiver = self;
  v8.super_class = (Class)INGetCarLockStatusIntent;
  v5 = [(INIntent *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(INGetCarLockStatusIntent *)v5 setCarName:v4];
  }

  return v6;
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
  id v5 = [(INGetCarLockStatusIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INGetCarLockStatusIntent *)self _typedBackingStore];
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