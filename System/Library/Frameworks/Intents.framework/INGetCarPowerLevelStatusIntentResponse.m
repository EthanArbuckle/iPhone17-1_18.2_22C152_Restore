@interface INGetCarPowerLevelStatusIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INCarChargingConnectorType)activeConnector;
- (INGetCarPowerLevelStatusIntentResponse)initWithBackingStore:(id)a3;
- (INGetCarPowerLevelStatusIntentResponse)initWithCode:(INGetCarPowerLevelStatusIntentResponseCode)code userActivity:(NSUserActivity *)userActivity;
- (INGetCarPowerLevelStatusIntentResponse)initWithCoder:(id)a3;
- (INGetCarPowerLevelStatusIntentResponseCode)code;
- (NSDateComponents)dateOfLastStateUpdate;
- (NSDictionary)chargingFormulaArguments;
- (NSDictionary)consumptionFormulaArguments;
- (NSMeasurement)currentBatteryCapacity;
- (NSMeasurement)distanceRemaining;
- (NSMeasurement)distanceRemainingElectric;
- (NSMeasurement)distanceRemainingFuel;
- (NSMeasurement)maximumBatteryCapacity;
- (NSMeasurement)maximumDistance;
- (NSMeasurement)maximumDistanceElectric;
- (NSMeasurement)maximumDistanceFuel;
- (NSMeasurement)minimumBatteryCapacity;
- (NSNumber)chargePercentRemaining;
- (NSNumber)charging;
- (NSNumber)fuelPercentRemaining;
- (NSNumber)minutesToFull;
- (NSString)carIdentifier;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (id)init;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveConnector:(INCarChargingConnectorType)activeConnector;
- (void)setCarIdentifier:(NSString *)carIdentifier;
- (void)setChargePercentRemaining:(NSNumber *)chargePercentRemaining;
- (void)setCharging:(NSNumber *)charging;
- (void)setChargingFormulaArguments:(NSDictionary *)chargingFormulaArguments;
- (void)setConsumptionFormulaArguments:(NSDictionary *)consumptionFormulaArguments;
- (void)setCurrentBatteryCapacity:(NSMeasurement *)currentBatteryCapacity;
- (void)setDateOfLastStateUpdate:(NSDateComponents *)dateOfLastStateUpdate;
- (void)setDistanceRemaining:(NSMeasurement *)distanceRemaining;
- (void)setDistanceRemainingElectric:(NSMeasurement *)distanceRemainingElectric;
- (void)setDistanceRemainingFuel:(NSMeasurement *)distanceRemainingFuel;
- (void)setFuelPercentRemaining:(NSNumber *)fuelPercentRemaining;
- (void)setMaximumBatteryCapacity:(NSMeasurement *)maximumBatteryCapacity;
- (void)setMaximumDistance:(NSMeasurement *)maximumDistance;
- (void)setMaximumDistanceElectric:(NSMeasurement *)maximumDistanceElectric;
- (void)setMaximumDistanceFuel:(NSMeasurement *)maximumDistanceFuel;
- (void)setMinimumBatteryCapacity:(NSMeasurement *)minimumBatteryCapacity;
- (void)setMinutesToFull:(NSNumber *)minutesToFull;
@end

@implementation INGetCarPowerLevelStatusIntentResponse

- (id)_dictionaryRepresentation
{
  v71[19] = *MEMORY[0x1E4F143B8];
  v70[0] = @"code";
  INGetCarPowerLevelStatusIntentResponseCode v3 = [(INGetCarPowerLevelStatusIntentResponse *)self code];
  unint64_t v68 = v3;
  if ((unint64_t)v3 <= INGetCarPowerLevelStatusIntentResponseCodeFailureRequiringAppLaunch)
  {
    uint64_t v4 = (uint64_t)*(&off_1E551B928 + v3);
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v56 = (void *)v4;
  v71[0] = v4;
  v70[1] = @"carIdentifier";
  uint64_t v5 = [(INGetCarPowerLevelStatusIntentResponse *)self carIdentifier];
  v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v55 = (void *)v5;
  v71[1] = v5;
  v70[2] = @"fuelPercentRemaining";
  uint64_t v7 = [(INGetCarPowerLevelStatusIntentResponse *)self fuelPercentRemaining];
  v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v54 = (void *)v7;
  v71[2] = v7;
  v70[3] = @"chargePercentRemaining";
  uint64_t v9 = [(INGetCarPowerLevelStatusIntentResponse *)self chargePercentRemaining];
  v10 = (void *)v9;
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v53 = (void *)v9;
  v71[3] = v9;
  v70[4] = @"distanceRemaining";
  uint64_t v11 = [(INGetCarPowerLevelStatusIntentResponse *)self distanceRemaining];
  v12 = (void *)v11;
  if (!v11)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v52 = (void *)v11;
  v71[4] = v11;
  v70[5] = @"charging";
  uint64_t v13 = [(INGetCarPowerLevelStatusIntentResponse *)self charging];
  v14 = (void *)v13;
  if (!v13)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v51 = (void *)v13;
  v71[5] = v13;
  v70[6] = @"minutesToFull";
  uint64_t v15 = [(INGetCarPowerLevelStatusIntentResponse *)self minutesToFull];
  v16 = (void *)v15;
  if (!v15)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v50 = (void *)v15;
  v71[6] = v15;
  v70[7] = @"maximumDistance";
  uint64_t v17 = [(INGetCarPowerLevelStatusIntentResponse *)self maximumDistance];
  v18 = (void *)v17;
  if (!v17)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v49 = (void *)v17;
  v71[7] = v17;
  v70[8] = @"distanceRemainingElectric";
  uint64_t v19 = [(INGetCarPowerLevelStatusIntentResponse *)self distanceRemainingElectric];
  v61 = (void *)v19;
  if (!v19)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v48 = (void *)v19;
  v71[8] = v19;
  v70[9] = @"maximumDistanceElectric";
  uint64_t v20 = [(INGetCarPowerLevelStatusIntentResponse *)self maximumDistanceElectric];
  v21 = (void *)v20;
  if (!v20)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v47 = (void *)v20;
  v71[9] = v20;
  v70[10] = @"distanceRemainingFuel";
  uint64_t v22 = [(INGetCarPowerLevelStatusIntentResponse *)self distanceRemainingFuel];
  v23 = (void *)v22;
  if (!v22)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v46 = (void *)v22;
  v71[10] = v22;
  v70[11] = @"maximumDistanceFuel";
  uint64_t v24 = [(INGetCarPowerLevelStatusIntentResponse *)self maximumDistanceFuel];
  v69 = (void *)v24;
  if (!v24)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v66 = v8;
  v45 = (void *)v24;
  v71[11] = v24;
  v70[12] = @"consumptionFormulaArguments";
  uint64_t v25 = [(INGetCarPowerLevelStatusIntentResponse *)self consumptionFormulaArguments];
  v58 = (void *)v25;
  if (!v25)
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v62 = v18;
  v44 = (void *)v25;
  v71[12] = v25;
  v70[13] = @"chargingFormulaArguments";
  uint64_t v26 = [(INGetCarPowerLevelStatusIntentResponse *)self chargingFormulaArguments];
  v27 = (void *)v26;
  if (!v26)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v67 = v6;
  v43 = (void *)v26;
  v71[13] = v26;
  v70[14] = @"dateOfLastStateUpdate";
  uint64_t v28 = [(INGetCarPowerLevelStatusIntentResponse *)self dateOfLastStateUpdate];
  v29 = (void *)v28;
  if (!v28)
  {
    uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v59 = v23;
  v64 = v12;
  v42 = (void *)v28;
  v71[14] = v28;
  v70[15] = @"activeConnector";
  uint64_t v30 = [(INGetCarPowerLevelStatusIntentResponse *)self activeConnector];
  v31 = (void *)v30;
  if (!v30)
  {
    uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v60 = v21;
  v63 = v14;
  v65 = v10;
  v41 = (void *)v30;
  v71[15] = v30;
  v70[16] = @"maximumBatteryCapacity";
  v32 = [(INGetCarPowerLevelStatusIntentResponse *)self maximumBatteryCapacity];
  v33 = v32;
  if (!v32)
  {
    v33 = [MEMORY[0x1E4F1CA98] null];
  }
  v34 = v16;
  v71[16] = v33;
  v70[17] = @"currentBatteryCapacity";
  v35 = [(INGetCarPowerLevelStatusIntentResponse *)self currentBatteryCapacity];
  v36 = v35;
  if (!v35)
  {
    v36 = [MEMORY[0x1E4F1CA98] null];
  }
  v71[17] = v36;
  v70[18] = @"minimumBatteryCapacity";
  v37 = [(INGetCarPowerLevelStatusIntentResponse *)self minimumBatteryCapacity];
  v38 = v37;
  if (!v37)
  {
    v38 = [MEMORY[0x1E4F1CA98] null];
  }
  v71[18] = v38;
  id v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:19];
  if (!v37) {

  }
  if (!v35) {
  if (!v32)
  }

  if (!v31) {
  if (!v29)
  }

  if (!v27) {
  if (!v58)
  }

  v39 = v69;
  if (!v69)
  {

    v39 = 0;
  }

  if (!v59) {
  if (!v60)
  }

  if (!v61) {
  if (!v62)
  }

  if (!v34) {
  if (!v63)
  }

  if (!v64) {
  if (!v65)
  }

  if (!v66) {
  if (!v67)
  }

  if (v68 >= 6) {

  }
  return v57;
}

- (void)setMinimumBatteryCapacity:(NSMeasurement *)minimumBatteryCapacity
{
  uint64_t v4 = minimumBatteryCapacity;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToEnergy(v4);

  [v5 setMinimumBatteryCapacity:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setCurrentBatteryCapacity:(NSMeasurement *)currentBatteryCapacity
{
  uint64_t v4 = currentBatteryCapacity;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToEnergy(v4);

  [v5 setCurrentBatteryCapacity:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setMaximumBatteryCapacity:(NSMeasurement *)maximumBatteryCapacity
{
  uint64_t v4 = maximumBatteryCapacity;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToEnergy(v4);

  [v5 setMaximumBatteryCapacity:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setActiveConnector:(INCarChargingConnectorType)activeConnector
{
  uint64_t BackingType = INCarChargingConnectorTypeGetBackingType(activeConnector);
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = v5;
  if (BackingType == 0x7FFFFFFF) {
    [v5 setHasActiveConnector:0];
  }
  else {
    [v5 setActiveConnector:BackingType];
  }

  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setDateOfLastStateUpdate:(NSDateComponents *)dateOfLastStateUpdate
{
  uint64_t v4 = dateOfLastStateUpdate;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToDateTime(v4);

  [v5 setDateOfLastStateUpdate:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setChargingFormulaArguments:(NSDictionary *)chargingFormulaArguments
{
  uint64_t v4 = chargingFormulaArguments;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToJSONDictionary((uint64_t)v4);

  [v5 setChargingFormulaArguments:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setConsumptionFormulaArguments:(NSDictionary *)consumptionFormulaArguments
{
  uint64_t v4 = consumptionFormulaArguments;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToJSONDictionary((uint64_t)v4);

  [v5 setConsumptionFormulaArguments:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setMaximumDistanceFuel:(NSMeasurement *)maximumDistanceFuel
{
  uint64_t v4 = maximumDistanceFuel;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToDistance(v4);

  [v5 setMaximumDistanceFuel:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setDistanceRemainingFuel:(NSMeasurement *)distanceRemainingFuel
{
  uint64_t v4 = distanceRemainingFuel;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToDistance(v4);

  [v5 setDistanceRemainingFuel:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setMaximumDistanceElectric:(NSMeasurement *)maximumDistanceElectric
{
  uint64_t v4 = maximumDistanceElectric;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToDistance(v4);

  [v5 setMaximumDistanceElectric:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setDistanceRemainingElectric:(NSMeasurement *)distanceRemainingElectric
{
  uint64_t v4 = distanceRemainingElectric;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToDistance(v4);

  [v5 setDistanceRemainingElectric:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setMaximumDistance:(NSMeasurement *)maximumDistance
{
  uint64_t v4 = maximumDistance;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToDistance(v4);

  [v5 setMaximumDistance:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setMinutesToFull:(NSNumber *)minutesToFull
{
  uint64_t v4 = minutesToFull;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToInteger(v4);

  [v5 setMinutesToFull:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setCharging:(NSNumber *)charging
{
  uint64_t v7 = charging;
  uint64_t v4 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  if (v7) {
    objc_msgSend(v4, "setCharging:", -[NSNumber BOOLValue](v7, "BOOLValue"));
  }
  else {
    [v4 setHasCharging:0];
  }

  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = [v5 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v6];
}

- (void)setDistanceRemaining:(NSMeasurement *)distanceRemaining
{
  uint64_t v4 = distanceRemaining;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToDistance(v4);

  [v5 setDistanceRemaining:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setChargePercentRemaining:(NSNumber *)chargePercentRemaining
{
  uint64_t v4 = chargePercentRemaining;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToDouble(v4);

  [v5 setChargePercentRemaining:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setFuelPercentRemaining:(NSNumber *)fuelPercentRemaining
{
  uint64_t v4 = fuelPercentRemaining;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToDouble(v4);

  [v5 setFuelPercentRemaining:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setCarIdentifier:(NSString *)carIdentifier
{
  uint64_t v4 = carIdentifier;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  [v5 setCarIdentifier:v4];

  id v7 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = [v7 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v6];
}

- (NSMeasurement)minimumBatteryCapacity
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INGetCarPowerLevelStatusIntentResponseCode v3 = [v2 minimumBatteryCapacity];
  uint64_t v4 = INIntentSlotValueTransformFromEnergy(v3);

  return (NSMeasurement *)v4;
}

- (NSMeasurement)currentBatteryCapacity
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INGetCarPowerLevelStatusIntentResponseCode v3 = [v2 currentBatteryCapacity];
  uint64_t v4 = INIntentSlotValueTransformFromEnergy(v3);

  return (NSMeasurement *)v4;
}

- (NSMeasurement)maximumBatteryCapacity
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INGetCarPowerLevelStatusIntentResponseCode v3 = [v2 maximumBatteryCapacity];
  uint64_t v4 = INIntentSlotValueTransformFromEnergy(v3);

  return (NSMeasurement *)v4;
}

- (INCarChargingConnectorType)activeConnector
{
  INGetCarPowerLevelStatusIntentResponseCode v3 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  int v4 = [v3 hasActiveConnector];
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  int v6 = [v5 activeConnector];
  if (v4 && (v6 - 2) <= 9) {
    id v7 = off_1E5520B30[v6 - 2];
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (NSDateComponents)dateOfLastStateUpdate
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INGetCarPowerLevelStatusIntentResponseCode v3 = [v2 dateOfLastStateUpdate];
  int v4 = INIntentSlotValueTransformFromDateTime(v3);

  return (NSDateComponents *)v4;
}

- (NSDictionary)chargingFormulaArguments
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INGetCarPowerLevelStatusIntentResponseCode v3 = [v2 chargingFormulaArguments];
  int v4 = INIntentSlotValueTransformFromJSONDictionary(v3);

  return (NSDictionary *)v4;
}

- (NSDictionary)consumptionFormulaArguments
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INGetCarPowerLevelStatusIntentResponseCode v3 = [v2 consumptionFormulaArguments];
  int v4 = INIntentSlotValueTransformFromJSONDictionary(v3);

  return (NSDictionary *)v4;
}

- (NSMeasurement)maximumDistanceFuel
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INGetCarPowerLevelStatusIntentResponseCode v3 = [v2 maximumDistanceFuel];
  int v4 = INIntentSlotValueTransformFromDistance(v3);

  return (NSMeasurement *)v4;
}

- (NSMeasurement)distanceRemainingFuel
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INGetCarPowerLevelStatusIntentResponseCode v3 = [v2 distanceRemainingFuel];
  int v4 = INIntentSlotValueTransformFromDistance(v3);

  return (NSMeasurement *)v4;
}

- (NSMeasurement)maximumDistanceElectric
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INGetCarPowerLevelStatusIntentResponseCode v3 = [v2 maximumDistanceElectric];
  int v4 = INIntentSlotValueTransformFromDistance(v3);

  return (NSMeasurement *)v4;
}

- (NSMeasurement)distanceRemainingElectric
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INGetCarPowerLevelStatusIntentResponseCode v3 = [v2 distanceRemainingElectric];
  int v4 = INIntentSlotValueTransformFromDistance(v3);

  return (NSMeasurement *)v4;
}

- (NSMeasurement)maximumDistance
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INGetCarPowerLevelStatusIntentResponseCode v3 = [v2 maximumDistance];
  int v4 = INIntentSlotValueTransformFromDistance(v3);

  return (NSMeasurement *)v4;
}

- (NSNumber)minutesToFull
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INGetCarPowerLevelStatusIntentResponseCode v3 = [v2 minutesToFull];
  int v4 = INIntentSlotValueTransformFromInteger(v3);

  return (NSNumber *)v4;
}

- (NSNumber)charging
{
  INGetCarPowerLevelStatusIntentResponseCode v3 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  if ([v3 hasCharging])
  {
    int v4 = NSNumber;
    uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
    int v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "charging"));
  }
  else
  {
    int v6 = 0;
  }

  return (NSNumber *)v6;
}

- (NSMeasurement)distanceRemaining
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INGetCarPowerLevelStatusIntentResponseCode v3 = [v2 distanceRemaining];
  int v4 = INIntentSlotValueTransformFromDistance(v3);

  return (NSMeasurement *)v4;
}

- (NSNumber)chargePercentRemaining
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INGetCarPowerLevelStatusIntentResponseCode v3 = [v2 chargePercentRemaining];
  int v4 = INIntentSlotValueTransformFromDouble(v3);

  return (NSNumber *)v4;
}

- (NSNumber)fuelPercentRemaining
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INGetCarPowerLevelStatusIntentResponseCode v3 = [v2 fuelPercentRemaining];
  int v4 = INIntentSlotValueTransformFromDouble(v3);

  return (NSNumber *)v4;
}

- (NSString)carIdentifier
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INGetCarPowerLevelStatusIntentResponseCode v3 = [v2 carIdentifier];
  int v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INGetCarPowerLevelStatusIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INGetCarPowerLevelStatusIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INGetCarPowerLevelStatusIntentResponseCodeInProgress"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INGetCarPowerLevelStatusIntentResponseCodeSuccess"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INGetCarPowerLevelStatusIntentResponseCodeFailure"]) {
    int64_t v5 = 4;
  }
  else {
    int64_t v5 = v4;
  }
  int v6 = [v3 isEqualToString:@"INGetCarPowerLevelStatusIntentResponseCodeFailureRequiringAppLaunch"];

  if (v6) {
    return 5;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  INGetCarPowerLevelStatusIntentResponseCode v2 = [(INGetCarPowerLevelStatusIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 4) {
    return 0;
  }
  else {
    return qword_18CFC5A10[v2 - 1];
  }
}

- (INGetCarPowerLevelStatusIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INGetCarPowerLevelStatusIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INGetCarPowerLevelStatusIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (INGetCarPowerLevelStatusIntentResponseCode)code
{
  v3.receiver = self;
  v3.super_class = (Class)INGetCarPowerLevelStatusIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INGetCarPowerLevelStatusIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INGetCarPowerLevelStatusIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INGetCarPowerLevelStatusIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INGetCarPowerLevelStatusIntentResponse)initWithCode:(INGetCarPowerLevelStatusIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v6 = userActivity;
  id v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)code > INGetCarPowerLevelStatusIntentResponseCodeFailureRequiringAppLaunch) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = (uint64_t)*(&off_1E551B928 + code);
    }
    *(_DWORD *)buf = 136315906;
    v14 = "-[INGetCarPowerLevelStatusIntentResponse initWithCode:userActivity:]";
    __int16 v15 = 2048;
    INGetCarPowerLevelStatusIntentResponseCode v16 = code;
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    uint64_t v20 = v6;
    uint64_t v9 = v7;
    _os_log_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v12.receiver = self;
  v12.super_class = (Class)INGetCarPowerLevelStatusIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:code userActivity:v6];

  return v10;
}

- (id)init
{
  return [(INGetCarPowerLevelStatusIntentResponse *)self initWithCode:0 userActivity:0];
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 5;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  return 0x7FFFFFFF;
}

+ (int)_typeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return 3;
  }
  else {
    return dword_18CFC59FC[a3 - 1];
  }
}

+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5
{
  int64_t result = 0;
  switch(a3)
  {
    case 0:
      int64_t result = 3;
      break;
    case 1:
      if (a5) {
        int64_t result = 5;
      }
      else {
        int64_t result = 4;
      }
      break;
    case 2:
      int64_t result = 2;
      break;
    case 5:
      int64_t result = 1;
      break;
    default:
      return result;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end