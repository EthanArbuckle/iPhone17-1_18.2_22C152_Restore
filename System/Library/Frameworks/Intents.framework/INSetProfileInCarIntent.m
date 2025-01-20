@interface INSetProfileInCarIntent
+ (BOOL)supportsSecureCoding;
- (INSetProfileInCarIntent)initWithProfileNumber:(NSNumber *)profileNumber profileName:(NSString *)profileName defaultProfile:(NSNumber *)defaultProfile;
- (INSetProfileInCarIntent)initWithProfileNumber:(NSNumber *)profileNumber profileName:(NSString *)profileName defaultProfile:(NSNumber *)defaultProfile carName:(INSpeakableString *)carName;
- (INSpeakableString)carName;
- (NSNumber)defaultProfile;
- (NSNumber)profileNumber;
- (NSString)profileName;
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
- (void)setDefaultProfile:(id)a3;
- (void)setProfileName:(id)a3;
- (void)setProfileNumber:(id)a3;
@end

@implementation INSetProfileInCarIntent

- (id)verb
{
  return @"SetProfileInCar";
}

- (id)domain
{
  return @"CarPlay";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = a4;
  v7 = [(INSetProfileInCarIntent *)self _typedBackingStore];
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
  v14[4] = *MEMORY[0x1E4F143B8];
  v13[0] = @"profileNumber";
  v3 = [(INSetProfileInCarIntent *)self profileNumber];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v4;
  v13[1] = @"profileName";
  v5 = [(INSetProfileInCarIntent *)self profileName];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v6;
  v13[2] = @"defaultProfile";
  v7 = [(INSetProfileInCarIntent *)self defaultProfile];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v8;
  v13[3] = @"carName";
  v9 = [(INSetProfileInCarIntent *)self carName];
  v10 = v9;
  if (!v9)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  if (!v9) {

  }
  if (!v7) {
  if (!v5)
  }

  if (!v3) {

  }
  return v11;
}

- (void)setCarName:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetProfileInCarIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToDataString(v4);

  [v6 setCarName:v5];
}

- (INSpeakableString)carName
{
  v2 = [(INSetProfileInCarIntent *)self _typedBackingStore];
  v3 = [v2 carName];
  id v4 = INIntentSlotValueTransformFromDataString(v3);

  return (INSpeakableString *)v4;
}

- (void)setDefaultProfile:(id)a3
{
  id v5 = a3;
  id v4 = [(INSetProfileInCarIntent *)self _typedBackingStore];
  if (v5) {
    objc_msgSend(v4, "setDefaultProfile:", objc_msgSend(v5, "BOOLValue"));
  }
  else {
    [v4 setHasDefaultProfile:0];
  }
}

- (NSNumber)defaultProfile
{
  v3 = [(INSetProfileInCarIntent *)self _typedBackingStore];
  if ([v3 hasDefaultProfile])
  {
    id v4 = NSNumber;
    id v5 = [(INSetProfileInCarIntent *)self _typedBackingStore];
    id v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "defaultProfile"));
  }
  else
  {
    id v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setProfileName:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetProfileInCarIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToString(v4);

  [v6 setProfileName:v5];
}

- (NSString)profileName
{
  v2 = [(INSetProfileInCarIntent *)self _typedBackingStore];
  v3 = [v2 profileName];
  id v4 = INIntentSlotValueTransformFromString(v3);

  return (NSString *)v4;
}

- (void)setProfileNumber:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetProfileInCarIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToInteger(v4);

  [v6 setProfileNumber:v5];
}

- (NSNumber)profileNumber
{
  v2 = [(INSetProfileInCarIntent *)self _typedBackingStore];
  v3 = [v2 profileNumber];
  id v4 = INIntentSlotValueTransformFromInteger(v3);

  return (NSNumber *)v4;
}

- (INSetProfileInCarIntent)initWithProfileNumber:(NSNumber *)profileNumber profileName:(NSString *)profileName defaultProfile:(NSNumber *)defaultProfile carName:(INSpeakableString *)carName
{
  v10 = profileNumber;
  v11 = profileName;
  v12 = defaultProfile;
  id v13 = carName;
  v17.receiver = self;
  v17.super_class = (Class)INSetProfileInCarIntent;
  v14 = [(INIntent *)&v17 init];
  v15 = v14;
  if (v14)
  {
    [(INSetProfileInCarIntent *)v14 setProfileNumber:v10];
    [(INSetProfileInCarIntent *)v15 setProfileName:v11];
    [(INSetProfileInCarIntent *)v15 setDefaultProfile:v12];
    [(INSetProfileInCarIntent *)v15 setCarName:v13];
  }

  return v15;
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
  id v5 = [(INSetProfileInCarIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INSetProfileInCarIntent *)self _typedBackingStore];
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

- (INSetProfileInCarIntent)initWithProfileNumber:(NSNumber *)profileNumber profileName:(NSString *)profileName defaultProfile:(NSNumber *)defaultProfile
{
  return [(INSetProfileInCarIntent *)self initWithProfileNumber:profileNumber profileName:profileName defaultProfile:defaultProfile carName:0];
}

@end