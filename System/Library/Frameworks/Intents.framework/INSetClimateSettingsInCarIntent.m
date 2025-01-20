@interface INSetClimateSettingsInCarIntent
+ (BOOL)supportsSecureCoding;
- (INCarAirCirculationMode)airCirculationMode;
- (INCarSeat)climateZone;
- (INRelativeSetting)relativeFanSpeedSetting;
- (INRelativeSetting)relativeTemperatureSetting;
- (INSetClimateSettingsInCarIntent)initWithEnableFan:(NSNumber *)enableFan enableAirConditioner:(NSNumber *)enableAirConditioner enableClimateControl:(NSNumber *)enableClimateControl enableAutoMode:(NSNumber *)enableAutoMode airCirculationMode:(INCarAirCirculationMode)airCirculationMode fanSpeedIndex:(NSNumber *)fanSpeedIndex fanSpeedPercentage:(NSNumber *)fanSpeedPercentage relativeFanSpeedSetting:(INRelativeSetting)relativeFanSpeedSetting temperature:(NSMeasurement *)temperature relativeTemperatureSetting:(INRelativeSetting)relativeTemperatureSetting climateZone:(INCarSeat)climateZone;
- (INSetClimateSettingsInCarIntent)initWithEnableFan:(NSNumber *)enableFan enableAirConditioner:(NSNumber *)enableAirConditioner enableClimateControl:(NSNumber *)enableClimateControl enableAutoMode:(NSNumber *)enableAutoMode airCirculationMode:(INCarAirCirculationMode)airCirculationMode fanSpeedIndex:(NSNumber *)fanSpeedIndex fanSpeedPercentage:(NSNumber *)fanSpeedPercentage relativeFanSpeedSetting:(INRelativeSetting)relativeFanSpeedSetting temperature:(NSMeasurement *)temperature relativeTemperatureSetting:(INRelativeSetting)relativeTemperatureSetting climateZone:(INCarSeat)climateZone carName:(INSpeakableString *)carName;
- (INSpeakableString)carName;
- (NSMeasurement)temperature;
- (NSNumber)enableAirConditioner;
- (NSNumber)enableAutoMode;
- (NSNumber)enableClimateControl;
- (NSNumber)enableFan;
- (NSNumber)fanSpeedIndex;
- (NSNumber)fanSpeedPercentage;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setAirCirculationMode:(int64_t)a3;
- (void)setCarName:(id)a3;
- (void)setClimateZone:(int64_t)a3;
- (void)setEnableAirConditioner:(id)a3;
- (void)setEnableAutoMode:(id)a3;
- (void)setEnableClimateControl:(id)a3;
- (void)setEnableFan:(id)a3;
- (void)setFanSpeedIndex:(id)a3;
- (void)setFanSpeedPercentage:(id)a3;
- (void)setRelativeFanSpeedSetting:(int64_t)a3;
- (void)setRelativeTemperatureSetting:(int64_t)a3;
- (void)setTemperature:(id)a3;
@end

@implementation INSetClimateSettingsInCarIntent

- (INSetClimateSettingsInCarIntent)initWithEnableFan:(NSNumber *)enableFan enableAirConditioner:(NSNumber *)enableAirConditioner enableClimateControl:(NSNumber *)enableClimateControl enableAutoMode:(NSNumber *)enableAutoMode airCirculationMode:(INCarAirCirculationMode)airCirculationMode fanSpeedIndex:(NSNumber *)fanSpeedIndex fanSpeedPercentage:(NSNumber *)fanSpeedPercentage relativeFanSpeedSetting:(INRelativeSetting)relativeFanSpeedSetting temperature:(NSMeasurement *)temperature relativeTemperatureSetting:(INRelativeSetting)relativeTemperatureSetting climateZone:(INCarSeat)climateZone
{
  return [(INSetClimateSettingsInCarIntent *)self initWithEnableFan:enableFan enableAirConditioner:enableAirConditioner enableClimateControl:enableClimateControl enableAutoMode:enableAutoMode airCirculationMode:airCirculationMode fanSpeedIndex:fanSpeedIndex fanSpeedPercentage:fanSpeedPercentage relativeFanSpeedSetting:relativeFanSpeedSetting temperature:temperature relativeTemperatureSetting:relativeTemperatureSetting climateZone:climateZone carName:0];
}

- (id)verb
{
  return @"SetClimateSettingsInCar";
}

- (id)domain
{
  return @"CarPlay";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = a4;
  v7 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
  id v15 = v6;
  v8 = (void *)[v7 copy];
  v9 = [v7 fanSpeedIndex];
  v10 = INIntentSlotValueRedactedIntegerFromInteger(v9, a3);
  [v8 setFanSpeedIndex:v10];

  v11 = [v7 fanSpeedPercentage];
  v12 = INIntentSlotValueRedactedDoubleFromDouble(v11, a3);
  [v8 setFanSpeedPercentage:v12];

  v13 = [v7 temperature];
  v14 = INIntentSlotValueRedactedTemperatureFromTemperature(v13, a3, v15);

  [v8 setTemperature:v14];
  [(INIntent *)self setBackingStore:v8];
}

- (id)_dictionaryRepresentation
{
  v43[12] = *MEMORY[0x1E4F143B8];
  v42[0] = @"enableFan";
  uint64_t v3 = [(INSetClimateSettingsInCarIntent *)self enableFan];
  v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v36 = (void *)v3;
  v43[0] = v3;
  v42[1] = @"enableAirConditioner";
  uint64_t v5 = [(INSetClimateSettingsInCarIntent *)self enableAirConditioner];
  id v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v35 = (void *)v5;
  v43[1] = v5;
  v42[2] = @"enableClimateControl";
  uint64_t v7 = [(INSetClimateSettingsInCarIntent *)self enableClimateControl];
  v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v40 = v6;
  v34 = (void *)v7;
  v43[2] = v7;
  v42[3] = @"enableAutoMode";
  uint64_t v9 = [(INSetClimateSettingsInCarIntent *)self enableAutoMode];
  v10 = (void *)v9;
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v33 = (void *)v9;
  v43[3] = v9;
  v42[4] = @"airCirculationMode";
  INCarAirCirculationMode v11 = [(INSetClimateSettingsInCarIntent *)self airCirculationMode];
  v12 = @"unknown";
  if (v11 == INCarAirCirculationModeRecirculateAir) {
    v12 = @"recirculateAir";
  }
  if (v11 == INCarAirCirculationModeFreshAir) {
    v12 = @"freshAir";
  }
  v38 = v12;
  v43[4] = v38;
  v42[5] = @"fanSpeedIndex";
  uint64_t v13 = [(INSetClimateSettingsInCarIntent *)self fanSpeedIndex];
  v14 = (void *)v13;
  if (!v13)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v39 = v8;
  v32 = (void *)v13;
  v43[5] = v13;
  v42[6] = @"fanSpeedPercentage";
  uint64_t v15 = [(INSetClimateSettingsInCarIntent *)self fanSpeedPercentage];
  v16 = (void *)v15;
  if (!v15)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = (void *)v15;
  v43[6] = v15;
  v42[7] = @"relativeFanSpeedSetting";
  INRelativeSetting v17 = [(INSetClimateSettingsInCarIntent *)self relativeFanSpeedSetting];
  v41 = v4;
  if ((unint64_t)(v17 - 1) > 3) {
    v18 = @"unknown";
  }
  else {
    v18 = off_1E551D918[v17 - 1];
  }
  v19 = v18;
  v43[7] = v19;
  v42[8] = @"temperature";
  v20 = [(INSetClimateSettingsInCarIntent *)self temperature];
  v21 = v20;
  if (!v20)
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v43[8] = v21;
  v42[9] = @"relativeTemperatureSetting";
  INRelativeSetting v22 = [(INSetClimateSettingsInCarIntent *)self relativeTemperatureSetting];
  if ((unint64_t)(v22 - 1) > 3) {
    v23 = @"unknown";
  }
  else {
    v23 = off_1E551D918[v22 - 1];
  }
  v24 = v23;
  v43[9] = v24;
  v42[10] = @"climateZone";
  INCarSeat v25 = [(INSetClimateSettingsInCarIntent *)self climateZone];
  if ((unint64_t)(v25 - 1) > 0xB) {
    v26 = @"unknown";
  }
  else {
    v26 = off_1E5517630[v25 - 1];
  }
  v27 = v26;
  v43[10] = v27;
  v42[11] = @"carName";
  v28 = [(INSetClimateSettingsInCarIntent *)self carName];
  v29 = v28;
  if (!v28)
  {
    v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v43[11] = v29;
  id v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:12];
  if (!v28) {

  }
  if (!v20) {
  if (!v16)
  }

  if (!v14) {
  if (!v10)
  }

  if (!v39) {
  if (!v40)
  }

  if (!v41) {

  }
  return v37;
}

- (void)setCarName:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
  uint64_t v5 = INIntentSlotValueTransformToDataString(v4);

  [v6 setCarName:v5];
}

- (INSpeakableString)carName
{
  v2 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 carName];
  id v4 = INIntentSlotValueTransformFromDataString(v3);

  return (INSpeakableString *)v4;
}

- (void)setClimateZone:(int64_t)a3
{
  uint64_t v3 = 0x7FFFFFFFLL;
  if ((unint64_t)(a3 - 1) <= 0xB) {
    uint64_t v3 = dword_18CFC41BC[a3 - 1];
  }
  id v4 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3 == 0x7FFFFFFF) {
    [v4 setHasClimateZone:0];
  }
  else {
    [v4 setClimateZone:v3];
  }
}

- (INCarSeat)climateZone
{
  uint64_t v3 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
  int v4 = [v3 hasClimateZone];
  id v5 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
  int v6 = [v5 climateZone];
  if (v4 && (v6 - 1) <= 0x15) {
    INCarSeat v7 = qword_18CFC41F0[v6 - 1];
  }
  else {
    INCarSeat v7 = INCarSeatUnknown;
  }

  return v7;
}

- (void)setRelativeTemperatureSetting:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  int v4 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3 > 3) {
    [v4 setHasRelativeTemperatureSetting:0];
  }
  else {
    objc_msgSend(v4, "setRelativeTemperatureSetting:");
  }
}

- (INRelativeSetting)relativeTemperatureSetting
{
  unint64_t v3 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
  int v4 = [v3 hasRelativeTemperatureSetting];
  id v5 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
  uint64_t v6 = [v5 relativeTemperatureSetting] - 1;
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

- (void)setTemperature:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToTemperature(v4);

  [v6 setTemperature:v5];
}

- (NSMeasurement)temperature
{
  v2 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 temperature];
  id v4 = INIntentSlotValueTransformFromTemperature(v3);

  return (NSMeasurement *)v4;
}

- (void)setRelativeFanSpeedSetting:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  id v4 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3 > 3) {
    [v4 setHasRelativeFanSpeedSetting:0];
  }
  else {
    objc_msgSend(v4, "setRelativeFanSpeedSetting:");
  }
}

- (INRelativeSetting)relativeFanSpeedSetting
{
  unint64_t v3 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
  int v4 = [v3 hasRelativeFanSpeedSetting];
  id v5 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
  uint64_t v6 = [v5 relativeFanSpeedSetting] - 1;
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

- (void)setFanSpeedPercentage:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToDouble(v4);

  [v6 setFanSpeedPercentage:v5];
}

- (NSNumber)fanSpeedPercentage
{
  v2 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 fanSpeedPercentage];
  id v4 = INIntentSlotValueTransformFromDouble(v3);

  return (NSNumber *)v4;
}

- (void)setFanSpeedIndex:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToInteger(v4);

  [v6 setFanSpeedIndex:v5];
}

- (NSNumber)fanSpeedIndex
{
  v2 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 fanSpeedIndex];
  id v4 = INIntentSlotValueTransformFromInteger(v3);

  return (NSNumber *)v4;
}

- (void)setAirCirculationMode:(int64_t)a3
{
  if (a3 == 1) {
    unsigned int v3 = 1;
  }
  else {
    unsigned int v3 = 0x7FFFFFFF;
  }
  if (a3 == 2) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = v3;
  }
  id v5 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
  id v6 = v5;
  if (v4 == 0x7FFFFFFF) {
    [v5 setHasAirCirculationMode:0];
  }
  else {
    [v5 setAirCirculationMode:v4];
  }
}

- (INCarAirCirculationMode)airCirculationMode
{
  unsigned int v3 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
  int v4 = [v3 hasAirCirculationMode];
  id v5 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
  int v6 = [v5 airCirculationMode];
  uint64_t v7 = 2 * (v6 == 2);
  if (v6 == 1) {
    uint64_t v7 = 1;
  }
  if (v4) {
    INCarAirCirculationMode v8 = v7;
  }
  else {
    INCarAirCirculationMode v8 = INCarAirCirculationModeUnknown;
  }

  return v8;
}

- (void)setEnableAutoMode:(id)a3
{
  id v5 = a3;
  int v4 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
  if (v5) {
    objc_msgSend(v4, "setEnableAutoMode:", objc_msgSend(v5, "BOOLValue"));
  }
  else {
    [v4 setHasEnableAutoMode:0];
  }
}

- (NSNumber)enableAutoMode
{
  unsigned int v3 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
  if ([v3 hasEnableAutoMode])
  {
    int v4 = NSNumber;
    id v5 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
    int v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "enableAutoMode"));
  }
  else
  {
    int v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setEnableClimateControl:(id)a3
{
  id v5 = a3;
  int v4 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
  if (v5) {
    objc_msgSend(v4, "setEnableClimateControl:", objc_msgSend(v5, "BOOLValue"));
  }
  else {
    [v4 setHasEnableClimateControl:0];
  }
}

- (NSNumber)enableClimateControl
{
  unsigned int v3 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
  if ([v3 hasEnableClimateControl])
  {
    int v4 = NSNumber;
    id v5 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
    int v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "enableClimateControl"));
  }
  else
  {
    int v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setEnableAirConditioner:(id)a3
{
  id v5 = a3;
  int v4 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
  if (v5) {
    objc_msgSend(v4, "setEnableAirConditioner:", objc_msgSend(v5, "BOOLValue"));
  }
  else {
    [v4 setHasEnableAirConditioner:0];
  }
}

- (NSNumber)enableAirConditioner
{
  unsigned int v3 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
  if ([v3 hasEnableAirConditioner])
  {
    int v4 = NSNumber;
    id v5 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
    int v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "enableAirConditioner"));
  }
  else
  {
    int v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setEnableFan:(id)a3
{
  id v5 = a3;
  int v4 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
  if (v5) {
    objc_msgSend(v4, "setEnableFan:", objc_msgSend(v5, "BOOLValue"));
  }
  else {
    [v4 setHasEnableFan:0];
  }
}

- (NSNumber)enableFan
{
  unsigned int v3 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
  if ([v3 hasEnableFan])
  {
    int v4 = NSNumber;
    id v5 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
    int v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "enableFan"));
  }
  else
  {
    int v6 = 0;
  }

  return (NSNumber *)v6;
}

- (INSetClimateSettingsInCarIntent)initWithEnableFan:(NSNumber *)enableFan enableAirConditioner:(NSNumber *)enableAirConditioner enableClimateControl:(NSNumber *)enableClimateControl enableAutoMode:(NSNumber *)enableAutoMode airCirculationMode:(INCarAirCirculationMode)airCirculationMode fanSpeedIndex:(NSNumber *)fanSpeedIndex fanSpeedPercentage:(NSNumber *)fanSpeedPercentage relativeFanSpeedSetting:(INRelativeSetting)relativeFanSpeedSetting temperature:(NSMeasurement *)temperature relativeTemperatureSetting:(INRelativeSetting)relativeTemperatureSetting climateZone:(INCarSeat)climateZone carName:(INSpeakableString *)carName
{
  v30 = enableFan;
  v29 = enableAirConditioner;
  v19 = enableClimateControl;
  v20 = enableAutoMode;
  v21 = fanSpeedIndex;
  INRelativeSetting v22 = fanSpeedPercentage;
  v23 = temperature;
  v24 = carName;
  v31.receiver = self;
  v31.super_class = (Class)INSetClimateSettingsInCarIntent;
  INCarSeat v25 = [(INIntent *)&v31 init];
  v26 = v25;
  if (v25)
  {
    [(INSetClimateSettingsInCarIntent *)v25 setEnableFan:v30];
    [(INSetClimateSettingsInCarIntent *)v26 setEnableAirConditioner:v29];
    [(INSetClimateSettingsInCarIntent *)v26 setEnableClimateControl:v19];
    [(INSetClimateSettingsInCarIntent *)v26 setEnableAutoMode:v20];
    [(INSetClimateSettingsInCarIntent *)v26 setAirCirculationMode:airCirculationMode];
    [(INSetClimateSettingsInCarIntent *)v26 setFanSpeedIndex:v21];
    [(INSetClimateSettingsInCarIntent *)v26 setFanSpeedPercentage:v22];
    [(INSetClimateSettingsInCarIntent *)v26 setRelativeFanSpeedSetting:relativeFanSpeedSetting];
    [(INSetClimateSettingsInCarIntent *)v26 setTemperature:v23];
    [(INSetClimateSettingsInCarIntent *)v26 setRelativeTemperatureSetting:relativeTemperatureSetting];
    [(INSetClimateSettingsInCarIntent *)v26 setClimateZone:climateZone];
    [(INSetClimateSettingsInCarIntent *)v26 setCarName:v24];
  }

  return v26;
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
  id v5 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INSetClimateSettingsInCarIntent *)self _typedBackingStore];
  unsigned int v3 = [v2 intentMetadata];

  return v3;
}

- (id)_typedBackingStore
{
  v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v3 = v2;
  }
  else {
    unsigned int v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end