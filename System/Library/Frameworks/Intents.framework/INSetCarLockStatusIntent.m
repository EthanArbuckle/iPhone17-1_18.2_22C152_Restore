@interface INSetCarLockStatusIntent
+ (BOOL)supportsSecureCoding;
- (INSetCarLockStatusIntent)initWithLocked:(NSNumber *)locked carName:(INSpeakableString *)carName;
- (INSpeakableString)carName;
- (NSNumber)locked;
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
- (void)setLocked:(id)a3;
@end

@implementation INSetCarLockStatusIntent

- (id)verb
{
  return @"SetCarLockStatus";
}

- (id)domain
{
  return @"CarPlay";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INSetCarLockStatusIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"locked";
  v3 = [(INSetCarLockStatusIntent *)self locked];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"carName";
  v10[0] = v4;
  v5 = [(INSetCarLockStatusIntent *)self carName];
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

- (void)setCarName:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetCarLockStatusIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToDataString(v4);

  [v6 setCarName:v5];
}

- (INSpeakableString)carName
{
  v2 = [(INSetCarLockStatusIntent *)self _typedBackingStore];
  v3 = [v2 carName];
  id v4 = INIntentSlotValueTransformFromDataString(v3);

  return (INSpeakableString *)v4;
}

- (void)setLocked:(id)a3
{
  id v5 = a3;
  id v4 = [(INSetCarLockStatusIntent *)self _typedBackingStore];
  if (v5) {
    objc_msgSend(v4, "setLocked:", objc_msgSend(v5, "BOOLValue"));
  }
  else {
    [v4 setHasLocked:0];
  }
}

- (NSNumber)locked
{
  v3 = [(INSetCarLockStatusIntent *)self _typedBackingStore];
  if ([v3 hasLocked])
  {
    id v4 = NSNumber;
    id v5 = [(INSetCarLockStatusIntent *)self _typedBackingStore];
    id v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "locked"));
  }
  else
  {
    id v6 = 0;
  }

  return (NSNumber *)v6;
}

- (INSetCarLockStatusIntent)initWithLocked:(NSNumber *)locked carName:(INSpeakableString *)carName
{
  id v6 = locked;
  v7 = carName;
  v11.receiver = self;
  v11.super_class = (Class)INSetCarLockStatusIntent;
  v8 = [(INIntent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(INSetCarLockStatusIntent *)v8 setLocked:v6];
    [(INSetCarLockStatusIntent *)v9 setCarName:v7];
  }

  return v9;
}

- (id)_categoryVerb
{
  return @"Start";
}

- (int64_t)_intentCategory
{
  return 6;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INSetCarLockStatusIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INSetCarLockStatusIntent *)self _typedBackingStore];
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