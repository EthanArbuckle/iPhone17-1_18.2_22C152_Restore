@interface INSetDefrosterSettingsInCarIntent
+ (BOOL)supportsSecureCoding;
- (INCarDefroster)defroster;
- (INSetDefrosterSettingsInCarIntent)initWithEnable:(NSNumber *)enable defroster:(INCarDefroster)defroster;
- (INSetDefrosterSettingsInCarIntent)initWithEnable:(NSNumber *)enable defroster:(INCarDefroster)defroster carName:(INSpeakableString *)carName;
- (INSpeakableString)carName;
- (NSNumber)enable;
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
- (void)setDefroster:(int64_t)a3;
- (void)setEnable:(id)a3;
@end

@implementation INSetDefrosterSettingsInCarIntent

- (INSetDefrosterSettingsInCarIntent)initWithEnable:(NSNumber *)enable defroster:(INCarDefroster)defroster
{
  return [(INSetDefrosterSettingsInCarIntent *)self initWithEnable:enable defroster:defroster carName:0];
}

- (id)verb
{
  return @"SetDefrosterSettingsInCar";
}

- (id)domain
{
  return @"CarPlay";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INSetDefrosterSettingsInCarIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v12[0] = @"enable";
  v3 = [(INSetDefrosterSettingsInCarIntent *)self enable];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[0] = v4;
  v12[1] = @"defroster";
  INCarDefroster v5 = [(INSetDefrosterSettingsInCarIntent *)self defroster];
  if ((unint64_t)(v5 - 1) > 2) {
    id v6 = @"unknown";
  }
  else {
    id v6 = off_1E551AC60[v5 - 1];
  }
  v7 = v6;
  v13[1] = v7;
  v12[2] = @"carName";
  v8 = [(INSetDefrosterSettingsInCarIntent *)self carName];
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

- (void)setCarName:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetDefrosterSettingsInCarIntent *)self _typedBackingStore];
  INCarDefroster v5 = INIntentSlotValueTransformToDataString(v4);

  [v6 setCarName:v5];
}

- (INSpeakableString)carName
{
  v2 = [(INSetDefrosterSettingsInCarIntent *)self _typedBackingStore];
  v3 = [v2 carName];
  id v4 = INIntentSlotValueTransformFromDataString(v3);

  return (INSpeakableString *)v4;
}

- (void)setDefroster:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  id v4 = [(INSetDefrosterSettingsInCarIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3 > 2) {
    [v4 setHasDefroster:0];
  }
  else {
    objc_msgSend(v4, "setDefroster:");
  }
}

- (INCarDefroster)defroster
{
  unint64_t v3 = [(INSetDefrosterSettingsInCarIntent *)self _typedBackingStore];
  int v4 = [v3 hasDefroster];
  id v5 = [(INSetDefrosterSettingsInCarIntent *)self _typedBackingStore];
  uint64_t v6 = [v5 defroster] - 1;
  if (v6 <= 2) {
    INCarDefroster v7 = v6 + 1;
  }
  else {
    INCarDefroster v7 = INCarDefrosterUnknown;
  }
  if (v4) {
    INCarDefroster v8 = v7;
  }
  else {
    INCarDefroster v8 = INCarDefrosterUnknown;
  }

  return v8;
}

- (void)setEnable:(id)a3
{
  id v5 = a3;
  int v4 = [(INSetDefrosterSettingsInCarIntent *)self _typedBackingStore];
  if (v5) {
    objc_msgSend(v4, "setEnable:", objc_msgSend(v5, "BOOLValue"));
  }
  else {
    [v4 setHasEnable:0];
  }
}

- (NSNumber)enable
{
  unint64_t v3 = [(INSetDefrosterSettingsInCarIntent *)self _typedBackingStore];
  if ([v3 hasEnable])
  {
    int v4 = NSNumber;
    id v5 = [(INSetDefrosterSettingsInCarIntent *)self _typedBackingStore];
    uint64_t v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "enable"));
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (NSNumber *)v6;
}

- (INSetDefrosterSettingsInCarIntent)initWithEnable:(NSNumber *)enable defroster:(INCarDefroster)defroster carName:(INSpeakableString *)carName
{
  INCarDefroster v8 = enable;
  v9 = carName;
  v13.receiver = self;
  v13.super_class = (Class)INSetDefrosterSettingsInCarIntent;
  v10 = [(INIntent *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(INSetDefrosterSettingsInCarIntent *)v10 setEnable:v8];
    [(INSetDefrosterSettingsInCarIntent *)v11 setDefroster:defroster];
    [(INSetDefrosterSettingsInCarIntent *)v11 setCarName:v9];
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
  id v5 = [(INSetDefrosterSettingsInCarIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INSetDefrosterSettingsInCarIntent *)self _typedBackingStore];
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