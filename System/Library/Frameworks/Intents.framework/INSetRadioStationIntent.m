@interface INSetRadioStationIntent
+ (BOOL)supportsSecureCoding;
- (INRadioType)radioType;
- (INSetRadioStationIntent)initWithRadioType:(INRadioType)radioType frequency:(NSNumber *)frequency stationName:(NSString *)stationName channel:(NSString *)channel presetNumber:(NSNumber *)presetNumber;
- (NSNumber)frequency;
- (NSNumber)presetNumber;
- (NSString)channel;
- (NSString)stationName;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setChannel:(id)a3;
- (void)setFrequency:(id)a3;
- (void)setPresetNumber:(id)a3;
- (void)setRadioType:(int64_t)a3;
- (void)setStationName:(id)a3;
@end

@implementation INSetRadioStationIntent

- (id)verb
{
  return @"SetRadioStation";
}

- (id)domain
{
  return @"Radio";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = a4;
  v7 = [(INSetRadioStationIntent *)self _typedBackingStore];
  id v17 = v6;
  v8 = (void *)[v7 copy];
  v9 = [v7 frequency];
  v10 = INIntentSlotValueRedactedDoubleFromDouble(v9, a3);
  [v8 setFrequency:v10];

  v11 = [v7 stationName];
  v12 = INIntentSlotValueRedactedStringFromString(v11, a3, v17);
  [v8 setStationName:v12];

  v13 = [v7 channel];
  v14 = INIntentSlotValueRedactedStringFromString(v13, a3, v17);
  [v8 setChannel:v14];

  v15 = [v7 presetNumber];
  v16 = INIntentSlotValueRedactedIntegerFromInteger(v15, a3);

  [v8 setPresetNumber:v16];
  [(INIntent *)self setBackingStore:v8];
}

- (id)_dictionaryRepresentation
{
  v17[5] = *MEMORY[0x1E4F143B8];
  v16[0] = @"radioType";
  INRadioType v3 = [(INSetRadioStationIntent *)self radioType];
  if ((unint64_t)(v3 - 1) > 4) {
    v4 = @"unknown";
  }
  else {
    v4 = off_1E5518420[v3 - 1];
  }
  v5 = v4;
  v17[0] = v5;
  v16[1] = @"frequency";
  id v6 = [(INSetRadioStationIntent *)self frequency];
  v7 = v6;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[1] = v7;
  v16[2] = @"stationName";
  v8 = [(INSetRadioStationIntent *)self stationName];
  v9 = v8;
  if (!v8)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[2] = v9;
  v16[3] = @"channel";
  v10 = [(INSetRadioStationIntent *)self channel];
  v11 = v10;
  if (!v10)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[3] = v11;
  v16[4] = @"presetNumber";
  v12 = [(INSetRadioStationIntent *)self presetNumber];
  v13 = v12;
  if (!v12)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[4] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];
  if (!v12) {

  }
  if (!v10) {
  if (!v8)
  }

  if (!v6) {

  }
  return v14;
}

- (void)setPresetNumber:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetRadioStationIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToInteger(v4);

  [v6 setPresetNumber:v5];
}

- (NSNumber)presetNumber
{
  v2 = [(INSetRadioStationIntent *)self _typedBackingStore];
  INRadioType v3 = [v2 presetNumber];
  id v4 = INIntentSlotValueTransformFromInteger(v3);

  return (NSNumber *)v4;
}

- (void)setChannel:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetRadioStationIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToString(v4);

  [v6 setChannel:v5];
}

- (NSString)channel
{
  v2 = [(INSetRadioStationIntent *)self _typedBackingStore];
  INRadioType v3 = [v2 channel];
  id v4 = INIntentSlotValueTransformFromString(v3);

  return (NSString *)v4;
}

- (void)setStationName:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetRadioStationIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToString(v4);

  [v6 setStationName:v5];
}

- (NSString)stationName
{
  v2 = [(INSetRadioStationIntent *)self _typedBackingStore];
  INRadioType v3 = [v2 stationName];
  id v4 = INIntentSlotValueTransformFromString(v3);

  return (NSString *)v4;
}

- (void)setFrequency:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetRadioStationIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToDouble(v4);

  [v6 setFrequency:v5];
}

- (NSNumber)frequency
{
  v2 = [(INSetRadioStationIntent *)self _typedBackingStore];
  INRadioType v3 = [v2 frequency];
  id v4 = INIntentSlotValueTransformFromDouble(v3);

  return (NSNumber *)v4;
}

- (void)setRadioType:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  id v4 = [(INSetRadioStationIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3 > 4) {
    [v4 setHasRadioType:0];
  }
  else {
    objc_msgSend(v4, "setRadioType:");
  }
}

- (INRadioType)radioType
{
  unint64_t v3 = [(INSetRadioStationIntent *)self _typedBackingStore];
  int v4 = [v3 hasRadioType];
  id v5 = [(INSetRadioStationIntent *)self _typedBackingStore];
  uint64_t v6 = [v5 radioType] - 1;
  if (v6 <= 4) {
    INRadioType v7 = v6 + 1;
  }
  else {
    INRadioType v7 = INRadioTypeUnknown;
  }
  if (v4) {
    INRadioType v8 = v7;
  }
  else {
    INRadioType v8 = INRadioTypeUnknown;
  }

  return v8;
}

- (INSetRadioStationIntent)initWithRadioType:(INRadioType)radioType frequency:(NSNumber *)frequency stationName:(NSString *)stationName channel:(NSString *)channel presetNumber:(NSNumber *)presetNumber
{
  v12 = frequency;
  v13 = stationName;
  v14 = channel;
  v15 = presetNumber;
  v19.receiver = self;
  v19.super_class = (Class)INSetRadioStationIntent;
  v16 = [(INIntent *)&v19 init];
  id v17 = v16;
  if (v16)
  {
    [(INSetRadioStationIntent *)v16 setRadioType:radioType];
    [(INSetRadioStationIntent *)v17 setFrequency:v12];
    [(INSetRadioStationIntent *)v17 setStationName:v13];
    [(INSetRadioStationIntent *)v17 setChannel:v14];
    [(INSetRadioStationIntent *)v17 setPresetNumber:v15];
  }

  return v17;
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
  id v5 = [(INSetRadioStationIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INSetRadioStationIntent *)self _typedBackingStore];
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