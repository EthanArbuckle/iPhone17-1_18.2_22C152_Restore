@interface INSaveProfileInCarIntent
+ (BOOL)supportsSecureCoding;
- (INSaveProfileInCarIntent)initWithProfileNumber:(NSNumber *)profileNumber profileName:(NSString *)profileName;
- (NSNumber)profileNumber;
- (NSString)profileName;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setProfileName:(id)a3;
- (void)setProfileNumber:(id)a3;
@end

@implementation INSaveProfileInCarIntent

- (id)verb
{
  return @"SaveProfileInCar";
}

- (id)domain
{
  return @"CarPlay";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = a4;
  v7 = [(INSaveProfileInCarIntent *)self _typedBackingStore];
  id v13 = v6;
  v8 = (void *)[v7 copy];
  v9 = [v7 profileNumber];
  v10 = INIntentSlotValueRedactedIntegerFromInteger(v9, a3);
  [v8 setProfileNumber:v10];

  v11 = [v7 profileName];
  v12 = INIntentSlotValueRedactedStringFromString(v11, a3, v13);

  [v8 setProfileName:v12];
  [(INIntent *)self setBackingStore:v8];
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"profileNumber";
  v3 = [(INSaveProfileInCarIntent *)self profileNumber];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"profileName";
  v10[0] = v4;
  v5 = [(INSaveProfileInCarIntent *)self profileName];
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

- (void)setProfileName:(id)a3
{
  id v4 = a3;
  id v6 = [(INSaveProfileInCarIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToString(v4);

  [v6 setProfileName:v5];
}

- (NSString)profileName
{
  v2 = [(INSaveProfileInCarIntent *)self _typedBackingStore];
  v3 = [v2 profileName];
  id v4 = INIntentSlotValueTransformFromString(v3);

  return (NSString *)v4;
}

- (void)setProfileNumber:(id)a3
{
  id v4 = a3;
  id v6 = [(INSaveProfileInCarIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToInteger(v4);

  [v6 setProfileNumber:v5];
}

- (NSNumber)profileNumber
{
  v2 = [(INSaveProfileInCarIntent *)self _typedBackingStore];
  v3 = [v2 profileNumber];
  id v4 = INIntentSlotValueTransformFromInteger(v3);

  return (NSNumber *)v4;
}

- (INSaveProfileInCarIntent)initWithProfileNumber:(NSNumber *)profileNumber profileName:(NSString *)profileName
{
  id v6 = profileNumber;
  v7 = profileName;
  v11.receiver = self;
  v11.super_class = (Class)INSaveProfileInCarIntent;
  v8 = [(INIntent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(INSaveProfileInCarIntent *)v8 setProfileNumber:v6];
    [(INSaveProfileInCarIntent *)v9 setProfileName:v7];
  }

  return v9;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INSaveProfileInCarIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INSaveProfileInCarIntent *)self _typedBackingStore];
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