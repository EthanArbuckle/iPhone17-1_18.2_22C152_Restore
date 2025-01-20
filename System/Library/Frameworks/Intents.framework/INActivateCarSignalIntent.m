@interface INActivateCarSignalIntent
+ (BOOL)supportsSecureCoding;
- (INActivateCarSignalIntent)initWithCarName:(INSpeakableString *)carName signals:(INCarSignalOptions)signals;
- (INCarSignalOptions)signals;
- (INSpeakableString)carName;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setCarName:(id)a3;
- (void)setSignals:(unint64_t)a3;
@end

@implementation INActivateCarSignalIntent

- (id)verb
{
  return @"ActivateCarSignal";
}

- (id)domain
{
  return @"CarPlay";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INActivateCarSignalIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"carName";
  v3 = [(INActivateCarSignalIntent *)self carName];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"signals";
  v10[0] = v4;
  v5 = INCarSignalOptionsGetNames([(INActivateCarSignalIntent *)self signals]);
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

- (void)setSignals:(unint64_t)a3
{
  v5 = [(INActivateCarSignalIntent *)self _typedBackingStore];
  [v5 clearSignals];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__INActivateCarSignalIntent_setSignals___block_invoke;
  v6[3] = &unk_1E5520C28;
  v6[4] = self;
  INCarSignalOptionsEnumerateBackingTypes(a3, v6);
}

void __40__INActivateCarSignalIntent_setSignals___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _typedBackingStore];
  [v3 addSignals:a2];
}

- (INCarSignalOptions)signals
{
  id v3 = [(INActivateCarSignalIntent *)self _typedBackingStore];
  uint64_t v4 = [v3 signalsCount];

  INCarSignalOptions v5 = 0;
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      v7 = [(INActivateCarSignalIntent *)self _typedBackingStore];
      int v8 = [v7 signalsAtIndex:i];
      uint64_t v9 = v5 | 1;
      if (v8 != 1) {
        uint64_t v9 = v5;
      }
      if (v8 == 2) {
        v5 |= 2uLL;
      }
      else {
        INCarSignalOptions v5 = v9;
      }
    }
  }
  return v5;
}

- (void)setCarName:(id)a3
{
  id v4 = a3;
  id v6 = [(INActivateCarSignalIntent *)self _typedBackingStore];
  INCarSignalOptions v5 = INIntentSlotValueTransformToDataString(v4);

  [v6 setCarName:v5];
}

- (INSpeakableString)carName
{
  v2 = [(INActivateCarSignalIntent *)self _typedBackingStore];
  id v3 = [v2 carName];
  id v4 = INIntentSlotValueTransformFromDataString(v3);

  return (INSpeakableString *)v4;
}

- (INActivateCarSignalIntent)initWithCarName:(INSpeakableString *)carName signals:(INCarSignalOptions)signals
{
  id v6 = carName;
  v10.receiver = self;
  v10.super_class = (Class)INActivateCarSignalIntent;
  v7 = [(INIntent *)&v10 init];
  int v8 = v7;
  if (v7)
  {
    [(INActivateCarSignalIntent *)v7 setCarName:v6];
    [(INActivateCarSignalIntent *)v8 setSignals:signals];
  }

  return v8;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INActivateCarSignalIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INActivateCarSignalIntent *)self _typedBackingStore];
  id v3 = [v2 intentMetadata];

  return v3;
}

- (id)_typedBackingStore
{
  v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end