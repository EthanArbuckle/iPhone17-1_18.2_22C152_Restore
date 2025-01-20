@interface INSetSeatSettingsInCarIntent
+ (BOOL)supportsSecureCoding;
- (INCarSeat)seat;
- (INRelativeSetting)relativeLevelSetting;
- (INSetSeatSettingsInCarIntent)initWithEnableHeating:(NSNumber *)enableHeating enableCooling:(NSNumber *)enableCooling enableMassage:(NSNumber *)enableMassage seat:(INCarSeat)seat level:(NSNumber *)level relativeLevelSetting:(INRelativeSetting)relativeLevelSetting;
- (INSetSeatSettingsInCarIntent)initWithEnableHeating:(NSNumber *)enableHeating enableCooling:(NSNumber *)enableCooling enableMassage:(NSNumber *)enableMassage seat:(INCarSeat)seat level:(NSNumber *)level relativeLevelSetting:(INRelativeSetting)relativeLevelSetting carName:(INSpeakableString *)carName;
- (INSpeakableString)carName;
- (NSNumber)enableCooling;
- (NSNumber)enableHeating;
- (NSNumber)enableMassage;
- (NSNumber)level;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setCarName:(id)a3;
- (void)setEnableCooling:(id)a3;
- (void)setEnableHeating:(id)a3;
- (void)setEnableMassage:(id)a3;
- (void)setLevel:(id)a3;
- (void)setRelativeLevelSetting:(int64_t)a3;
- (void)setSeat:(int64_t)a3;
@end

@implementation INSetSeatSettingsInCarIntent

- (INSetSeatSettingsInCarIntent)initWithEnableHeating:(NSNumber *)enableHeating enableCooling:(NSNumber *)enableCooling enableMassage:(NSNumber *)enableMassage seat:(INCarSeat)seat level:(NSNumber *)level relativeLevelSetting:(INRelativeSetting)relativeLevelSetting
{
  return [(INSetSeatSettingsInCarIntent *)self initWithEnableHeating:enableHeating enableCooling:enableCooling enableMassage:enableMassage seat:seat level:level relativeLevelSetting:relativeLevelSetting carName:0];
}

- (id)verb
{
  return @"SetSeatSettingsInCar";
}

- (id)domain
{
  return @"CarPlay";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = a4;
  v7 = [(INSetSeatSettingsInCarIntent *)self _typedBackingStore];
  id v11 = v6;
  v8 = (void *)[v7 copy];
  v9 = [v7 level];
  v10 = INIntentSlotValueRedactedIntegerFromInteger(v9, a3);

  [v8 setLevel:v10];
  [(INIntent *)self setBackingStore:v8];
}

- (id)_dictionaryRepresentation
{
  v25[7] = *MEMORY[0x1E4F143B8];
  v24[0] = @"enableHeating";
  uint64_t v3 = [(INSetSeatSettingsInCarIntent *)self enableHeating];
  v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v3;
  v25[0] = v3;
  v24[1] = @"enableCooling";
  uint64_t v5 = [(INSetSeatSettingsInCarIntent *)self enableCooling];
  id v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v5;
  v25[1] = v5;
  v24[2] = @"enableMassage";
  uint64_t v7 = [(INSetSeatSettingsInCarIntent *)self enableMassage];
  v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[2] = v7;
  v24[3] = @"seat";
  INCarSeat v9 = [(INSetSeatSettingsInCarIntent *)self seat];
  if ((unint64_t)(v9 - 1) > 0xB) {
    v10 = @"unknown";
  }
  else {
    v10 = off_1E5517630[v9 - 1];
  }
  id v11 = v10;
  v25[3] = v11;
  v24[4] = @"level";
  v12 = [(INSetSeatSettingsInCarIntent *)self level];
  v13 = v12;
  if (!v12)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[4] = v13;
  v24[5] = @"relativeLevelSetting";
  INRelativeSetting v14 = [(INSetSeatSettingsInCarIntent *)self relativeLevelSetting];
  if ((unint64_t)(v14 - 1) > 3) {
    v15 = @"unknown";
  }
  else {
    v15 = off_1E551D918[v14 - 1];
  }
  v16 = v15;
  v25[5] = v16;
  v24[6] = @"carName";
  v17 = [(INSetSeatSettingsInCarIntent *)self carName];
  v18 = v17;
  if (!v17)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[6] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:7];
  if (!v17) {

  }
  if (!v12) {
  if (!v8)
  }

  if (!v6) {
  if (!v4)
  }

  return v19;
}

- (void)setCarName:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetSeatSettingsInCarIntent *)self _typedBackingStore];
  uint64_t v5 = INIntentSlotValueTransformToDataString(v4);

  [v6 setCarName:v5];
}

- (INSpeakableString)carName
{
  v2 = [(INSetSeatSettingsInCarIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 carName];
  id v4 = INIntentSlotValueTransformFromDataString(v3);

  return (INSpeakableString *)v4;
}

- (void)setRelativeLevelSetting:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  id v4 = [(INSetSeatSettingsInCarIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3 > 3) {
    [v4 setHasRelativeLevelSetting:0];
  }
  else {
    objc_msgSend(v4, "setRelativeLevelSetting:");
  }
}

- (INRelativeSetting)relativeLevelSetting
{
  unint64_t v3 = [(INSetSeatSettingsInCarIntent *)self _typedBackingStore];
  int v4 = [v3 hasRelativeLevelSetting];
  id v5 = [(INSetSeatSettingsInCarIntent *)self _typedBackingStore];
  uint64_t v6 = [v5 relativeLevelSetting] - 1;
  if (v6 <= 3) {
    INRelativeSetting v7 = v6 + 1;
  }
  else {
    INRelativeSetting v7 = INRelativeSettingUnknown;
  }
  if (v4) {
    INRelativeSetting v8 = v7;
  }
  else {
    INRelativeSetting v8 = INRelativeSettingUnknown;
  }

  return v8;
}

- (void)setLevel:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetSeatSettingsInCarIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToInteger(v4);

  [v6 setLevel:v5];
}

- (NSNumber)level
{
  v2 = [(INSetSeatSettingsInCarIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 level];
  id v4 = INIntentSlotValueTransformFromInteger(v3);

  return (NSNumber *)v4;
}

- (void)setSeat:(int64_t)a3
{
  uint64_t v3 = 0x7FFFFFFFLL;
  if ((unint64_t)(a3 - 1) <= 0xB) {
    uint64_t v3 = dword_18CFC41BC[a3 - 1];
  }
  id v4 = [(INSetSeatSettingsInCarIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3 == 0x7FFFFFFF) {
    [v4 setHasSeat:0];
  }
  else {
    [v4 setSeat:v3];
  }
}

- (INCarSeat)seat
{
  uint64_t v3 = [(INSetSeatSettingsInCarIntent *)self _typedBackingStore];
  int v4 = [v3 hasSeat];
  id v5 = [(INSetSeatSettingsInCarIntent *)self _typedBackingStore];
  int v6 = [v5 seat];
  if (v4 && (v6 - 1) <= 0x15) {
    INCarSeat v7 = qword_18CFC41F0[v6 - 1];
  }
  else {
    INCarSeat v7 = INCarSeatUnknown;
  }

  return v7;
}

- (void)setEnableMassage:(id)a3
{
  id v5 = a3;
  int v4 = [(INSetSeatSettingsInCarIntent *)self _typedBackingStore];
  if (v5) {
    objc_msgSend(v4, "setEnableMassage:", objc_msgSend(v5, "BOOLValue"));
  }
  else {
    [v4 setHasEnableMassage:0];
  }
}

- (NSNumber)enableMassage
{
  uint64_t v3 = [(INSetSeatSettingsInCarIntent *)self _typedBackingStore];
  if ([v3 hasEnableMassage])
  {
    int v4 = NSNumber;
    id v5 = [(INSetSeatSettingsInCarIntent *)self _typedBackingStore];
    int v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "enableMassage"));
  }
  else
  {
    int v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setEnableCooling:(id)a3
{
  id v5 = a3;
  int v4 = [(INSetSeatSettingsInCarIntent *)self _typedBackingStore];
  if (v5) {
    objc_msgSend(v4, "setEnableCooling:", objc_msgSend(v5, "BOOLValue"));
  }
  else {
    [v4 setHasEnableCooling:0];
  }
}

- (NSNumber)enableCooling
{
  uint64_t v3 = [(INSetSeatSettingsInCarIntent *)self _typedBackingStore];
  if ([v3 hasEnableCooling])
  {
    int v4 = NSNumber;
    id v5 = [(INSetSeatSettingsInCarIntent *)self _typedBackingStore];
    int v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "enableCooling"));
  }
  else
  {
    int v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setEnableHeating:(id)a3
{
  id v5 = a3;
  int v4 = [(INSetSeatSettingsInCarIntent *)self _typedBackingStore];
  if (v5) {
    objc_msgSend(v4, "setEnableHeating:", objc_msgSend(v5, "BOOLValue"));
  }
  else {
    [v4 setHasEnableHeating:0];
  }
}

- (NSNumber)enableHeating
{
  uint64_t v3 = [(INSetSeatSettingsInCarIntent *)self _typedBackingStore];
  if ([v3 hasEnableHeating])
  {
    int v4 = NSNumber;
    id v5 = [(INSetSeatSettingsInCarIntent *)self _typedBackingStore];
    int v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "enableHeating"));
  }
  else
  {
    int v6 = 0;
  }

  return (NSNumber *)v6;
}

- (INSetSeatSettingsInCarIntent)initWithEnableHeating:(NSNumber *)enableHeating enableCooling:(NSNumber *)enableCooling enableMassage:(NSNumber *)enableMassage seat:(INCarSeat)seat level:(NSNumber *)level relativeLevelSetting:(INRelativeSetting)relativeLevelSetting carName:(INSpeakableString *)carName
{
  v15 = enableHeating;
  v16 = enableCooling;
  v17 = enableMassage;
  v18 = level;
  v19 = carName;
  v23.receiver = self;
  v23.super_class = (Class)INSetSeatSettingsInCarIntent;
  v20 = [(INIntent *)&v23 init];
  v21 = v20;
  if (v20)
  {
    [(INSetSeatSettingsInCarIntent *)v20 setEnableHeating:v15];
    [(INSetSeatSettingsInCarIntent *)v21 setEnableCooling:v16];
    [(INSetSeatSettingsInCarIntent *)v21 setEnableMassage:v17];
    [(INSetSeatSettingsInCarIntent *)v21 setSeat:seat];
    [(INSetSeatSettingsInCarIntent *)v21 setLevel:v18];
    [(INSetSeatSettingsInCarIntent *)v21 setRelativeLevelSetting:relativeLevelSetting];
    [(INSetSeatSettingsInCarIntent *)v21 setCarName:v19];
  }

  return v21;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INSetSeatSettingsInCarIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INSetSeatSettingsInCarIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 intentMetadata];

  return v3;
}

- (id)_typedBackingStore
{
  v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end