@interface _INPBGetCarPowerLevelStatusIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)charging;
- (BOOL)hasActiveConnector;
- (BOOL)hasCarIdentifier;
- (BOOL)hasChargePercentRemaining;
- (BOOL)hasCharging;
- (BOOL)hasChargingFormulaArguments;
- (BOOL)hasConsumptionFormulaArguments;
- (BOOL)hasCurrentBatteryCapacity;
- (BOOL)hasDateOfLastStateUpdate;
- (BOOL)hasDistanceRemaining;
- (BOOL)hasDistanceRemainingElectric;
- (BOOL)hasDistanceRemainingFuel;
- (BOOL)hasFuelPercentRemaining;
- (BOOL)hasMaximumBatteryCapacity;
- (BOOL)hasMaximumDistance;
- (BOOL)hasMaximumDistanceElectric;
- (BOOL)hasMaximumDistanceFuel;
- (BOOL)hasMinimumBatteryCapacity;
- (BOOL)hasMinutesToFull;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)carIdentifier;
- (_INPBDateTime)dateOfLastStateUpdate;
- (_INPBDistance)distanceRemaining;
- (_INPBDistance)distanceRemainingElectric;
- (_INPBDistance)distanceRemainingFuel;
- (_INPBDistance)maximumDistance;
- (_INPBDistance)maximumDistanceElectric;
- (_INPBDistance)maximumDistanceFuel;
- (_INPBDouble)chargePercentRemaining;
- (_INPBDouble)fuelPercentRemaining;
- (_INPBEnergy)currentBatteryCapacity;
- (_INPBEnergy)maximumBatteryCapacity;
- (_INPBEnergy)minimumBatteryCapacity;
- (_INPBGetCarPowerLevelStatusIntentResponse)initWithCoder:(id)a3;
- (_INPBInteger)minutesToFull;
- (_INPBJSONDictionary)chargingFormulaArguments;
- (_INPBJSONDictionary)consumptionFormulaArguments;
- (id)activeConnectorAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int)StringAsActiveConnector:(id)a3;
- (int)activeConnector;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveConnector:(int)a3;
- (void)setCarIdentifier:(id)a3;
- (void)setChargePercentRemaining:(id)a3;
- (void)setCharging:(BOOL)a3;
- (void)setChargingFormulaArguments:(id)a3;
- (void)setConsumptionFormulaArguments:(id)a3;
- (void)setCurrentBatteryCapacity:(id)a3;
- (void)setDateOfLastStateUpdate:(id)a3;
- (void)setDistanceRemaining:(id)a3;
- (void)setDistanceRemainingElectric:(id)a3;
- (void)setDistanceRemainingFuel:(id)a3;
- (void)setFuelPercentRemaining:(id)a3;
- (void)setHasActiveConnector:(BOOL)a3;
- (void)setHasCharging:(BOOL)a3;
- (void)setMaximumBatteryCapacity:(id)a3;
- (void)setMaximumDistance:(id)a3;
- (void)setMaximumDistanceElectric:(id)a3;
- (void)setMaximumDistanceFuel:(id)a3;
- (void)setMinimumBatteryCapacity:(id)a3;
- (void)setMinutesToFull:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBGetCarPowerLevelStatusIntentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minutesToFull, 0);
  objc_storeStrong((id *)&self->_minimumBatteryCapacity, 0);
  objc_storeStrong((id *)&self->_maximumDistanceFuel, 0);
  objc_storeStrong((id *)&self->_maximumDistanceElectric, 0);
  objc_storeStrong((id *)&self->_maximumDistance, 0);
  objc_storeStrong((id *)&self->_maximumBatteryCapacity, 0);
  objc_storeStrong((id *)&self->_fuelPercentRemaining, 0);
  objc_storeStrong((id *)&self->_distanceRemainingFuel, 0);
  objc_storeStrong((id *)&self->_distanceRemainingElectric, 0);
  objc_storeStrong((id *)&self->_distanceRemaining, 0);
  objc_storeStrong((id *)&self->_dateOfLastStateUpdate, 0);
  objc_storeStrong((id *)&self->_currentBatteryCapacity, 0);
  objc_storeStrong((id *)&self->_consumptionFormulaArguments, 0);
  objc_storeStrong((id *)&self->_chargingFormulaArguments, 0);
  objc_storeStrong((id *)&self->_chargePercentRemaining, 0);

  objc_storeStrong((id *)&self->_carIdentifier, 0);
}

- (_INPBInteger)minutesToFull
{
  return self->_minutesToFull;
}

- (_INPBEnergy)minimumBatteryCapacity
{
  return self->_minimumBatteryCapacity;
}

- (_INPBDistance)maximumDistanceFuel
{
  return self->_maximumDistanceFuel;
}

- (_INPBDistance)maximumDistanceElectric
{
  return self->_maximumDistanceElectric;
}

- (_INPBDistance)maximumDistance
{
  return self->_maximumDistance;
}

- (_INPBEnergy)maximumBatteryCapacity
{
  return self->_maximumBatteryCapacity;
}

- (_INPBDouble)fuelPercentRemaining
{
  return self->_fuelPercentRemaining;
}

- (_INPBDistance)distanceRemainingFuel
{
  return self->_distanceRemainingFuel;
}

- (_INPBDistance)distanceRemainingElectric
{
  return self->_distanceRemainingElectric;
}

- (_INPBDistance)distanceRemaining
{
  return self->_distanceRemaining;
}

- (_INPBDateTime)dateOfLastStateUpdate
{
  return self->_dateOfLastStateUpdate;
}

- (_INPBEnergy)currentBatteryCapacity
{
  return self->_currentBatteryCapacity;
}

- (_INPBJSONDictionary)consumptionFormulaArguments
{
  return self->_consumptionFormulaArguments;
}

- (_INPBJSONDictionary)chargingFormulaArguments
{
  return self->_chargingFormulaArguments;
}

- (BOOL)charging
{
  return self->_charging;
}

- (_INPBDouble)chargePercentRemaining
{
  return self->_chargePercentRemaining;
}

- (NSString)carIdentifier
{
  return self->_carIdentifier;
}

- (int)activeConnector
{
  return self->_activeConnector;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBGetCarPowerLevelStatusIntentResponse *)self hasActiveConnector])
  {
    uint64_t v4 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self activeConnector];
    if ((v4 - 2) >= 0xA)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E55173D8[(v4 - 2)];
    }
    [v3 setObject:v5 forKeyedSubscript:@"activeConnector"];
  }
  if (self->_carIdentifier)
  {
    v6 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self carIdentifier];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"carIdentifier"];
  }
  v8 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self chargePercentRemaining];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"chargePercentRemaining"];

  if ([(_INPBGetCarPowerLevelStatusIntentResponse *)self hasCharging])
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBGetCarPowerLevelStatusIntentResponse charging](self, "charging"));
    [v3 setObject:v10 forKeyedSubscript:@"charging"];
  }
  v11 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self chargingFormulaArguments];
  v12 = [v11 dictionaryRepresentation];
  [v3 setObject:v12 forKeyedSubscript:@"chargingFormulaArguments"];

  v13 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self consumptionFormulaArguments];
  v14 = [v13 dictionaryRepresentation];
  [v3 setObject:v14 forKeyedSubscript:@"consumptionFormulaArguments"];

  v15 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self currentBatteryCapacity];
  v16 = [v15 dictionaryRepresentation];
  [v3 setObject:v16 forKeyedSubscript:@"currentBatteryCapacity"];

  v17 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self dateOfLastStateUpdate];
  v18 = [v17 dictionaryRepresentation];
  [v3 setObject:v18 forKeyedSubscript:@"dateOfLastStateUpdate"];

  v19 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self distanceRemaining];
  v20 = [v19 dictionaryRepresentation];
  [v3 setObject:v20 forKeyedSubscript:@"distanceRemaining"];

  v21 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self distanceRemainingElectric];
  v22 = [v21 dictionaryRepresentation];
  [v3 setObject:v22 forKeyedSubscript:@"distanceRemainingElectric"];

  v23 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self distanceRemainingFuel];
  v24 = [v23 dictionaryRepresentation];
  [v3 setObject:v24 forKeyedSubscript:@"distanceRemainingFuel"];

  v25 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self fuelPercentRemaining];
  v26 = [v25 dictionaryRepresentation];
  [v3 setObject:v26 forKeyedSubscript:@"fuelPercentRemaining"];

  v27 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self maximumBatteryCapacity];
  v28 = [v27 dictionaryRepresentation];
  [v3 setObject:v28 forKeyedSubscript:@"maximumBatteryCapacity"];

  v29 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self maximumDistance];
  v30 = [v29 dictionaryRepresentation];
  [v3 setObject:v30 forKeyedSubscript:@"maximumDistance"];

  v31 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self maximumDistanceElectric];
  v32 = [v31 dictionaryRepresentation];
  [v3 setObject:v32 forKeyedSubscript:@"maximumDistanceElectric"];

  v33 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self maximumDistanceFuel];
  v34 = [v33 dictionaryRepresentation];
  [v3 setObject:v34 forKeyedSubscript:@"maximumDistanceFuel"];

  v35 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self minimumBatteryCapacity];
  v36 = [v35 dictionaryRepresentation];
  [v3 setObject:v36 forKeyedSubscript:@"minimumBatteryCapacity"];

  v37 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self minutesToFull];
  v38 = [v37 dictionaryRepresentation];
  [v3 setObject:v38 forKeyedSubscript:@"minutesToFull"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBGetCarPowerLevelStatusIntentResponse *)self hasActiveConnector]) {
    uint64_t v3 = 2654435761 * self->_activeConnector;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_carIdentifier hash];
  unint64_t v5 = [(_INPBDouble *)self->_chargePercentRemaining hash];
  if ([(_INPBGetCarPowerLevelStatusIntentResponse *)self hasCharging]) {
    uint64_t v6 = 2654435761 * self->_charging;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = v4 ^ v3 ^ v5 ^ v6;
  unint64_t v8 = [(_INPBJSONDictionary *)self->_chargingFormulaArguments hash];
  unint64_t v9 = v8 ^ [(_INPBJSONDictionary *)self->_consumptionFormulaArguments hash];
  unint64_t v10 = v7 ^ v9 ^ [(_INPBEnergy *)self->_currentBatteryCapacity hash];
  unint64_t v11 = [(_INPBDateTime *)self->_dateOfLastStateUpdate hash];
  unint64_t v12 = v11 ^ [(_INPBDistance *)self->_distanceRemaining hash];
  unint64_t v13 = v12 ^ [(_INPBDistance *)self->_distanceRemainingElectric hash];
  unint64_t v14 = v10 ^ v13 ^ [(_INPBDistance *)self->_distanceRemainingFuel hash];
  unint64_t v15 = [(_INPBDouble *)self->_fuelPercentRemaining hash];
  unint64_t v16 = v15 ^ [(_INPBEnergy *)self->_maximumBatteryCapacity hash];
  unint64_t v17 = v16 ^ [(_INPBDistance *)self->_maximumDistance hash];
  unint64_t v18 = v17 ^ [(_INPBDistance *)self->_maximumDistanceElectric hash];
  unint64_t v19 = v14 ^ v18 ^ [(_INPBDistance *)self->_maximumDistanceFuel hash];
  unint64_t v20 = [(_INPBEnergy *)self->_minimumBatteryCapacity hash];
  return v19 ^ v20 ^ [(_INPBInteger *)self->_minutesToFull hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_90;
  }
  int v5 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self hasActiveConnector];
  if (v5 != [v4 hasActiveConnector]) {
    goto LABEL_90;
  }
  if ([(_INPBGetCarPowerLevelStatusIntentResponse *)self hasActiveConnector])
  {
    if ([v4 hasActiveConnector])
    {
      int activeConnector = self->_activeConnector;
      if (activeConnector != [v4 activeConnector]) {
        goto LABEL_90;
      }
    }
  }
  NSUInteger v7 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self carIdentifier];
  unint64_t v8 = [v4 carIdentifier];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_89;
  }
  uint64_t v9 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self carIdentifier];
  if (v9)
  {
    unint64_t v10 = (void *)v9;
    unint64_t v11 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self carIdentifier];
    unint64_t v12 = [v4 carIdentifier];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_90;
    }
  }
  else
  {
  }
  NSUInteger v7 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self chargePercentRemaining];
  unint64_t v8 = [v4 chargePercentRemaining];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_89;
  }
  uint64_t v14 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self chargePercentRemaining];
  if (v14)
  {
    unint64_t v15 = (void *)v14;
    unint64_t v16 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self chargePercentRemaining];
    unint64_t v17 = [v4 chargePercentRemaining];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_90;
    }
  }
  else
  {
  }
  int v19 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self hasCharging];
  if (v19 != [v4 hasCharging]) {
    goto LABEL_90;
  }
  if ([(_INPBGetCarPowerLevelStatusIntentResponse *)self hasCharging])
  {
    if ([v4 hasCharging])
    {
      int charging = self->_charging;
      if (charging != [v4 charging]) {
        goto LABEL_90;
      }
    }
  }
  NSUInteger v7 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self chargingFormulaArguments];
  unint64_t v8 = [v4 chargingFormulaArguments];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_89;
  }
  uint64_t v21 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self chargingFormulaArguments];
  if (v21)
  {
    v22 = (void *)v21;
    v23 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self chargingFormulaArguments];
    v24 = [v4 chargingFormulaArguments];
    int v25 = [v23 isEqual:v24];

    if (!v25) {
      goto LABEL_90;
    }
  }
  else
  {
  }
  NSUInteger v7 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self consumptionFormulaArguments];
  unint64_t v8 = [v4 consumptionFormulaArguments];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_89;
  }
  uint64_t v26 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self consumptionFormulaArguments];
  if (v26)
  {
    v27 = (void *)v26;
    v28 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self consumptionFormulaArguments];
    v29 = [v4 consumptionFormulaArguments];
    int v30 = [v28 isEqual:v29];

    if (!v30) {
      goto LABEL_90;
    }
  }
  else
  {
  }
  NSUInteger v7 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self currentBatteryCapacity];
  unint64_t v8 = [v4 currentBatteryCapacity];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_89;
  }
  uint64_t v31 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self currentBatteryCapacity];
  if (v31)
  {
    v32 = (void *)v31;
    v33 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self currentBatteryCapacity];
    v34 = [v4 currentBatteryCapacity];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_90;
    }
  }
  else
  {
  }
  NSUInteger v7 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self dateOfLastStateUpdate];
  unint64_t v8 = [v4 dateOfLastStateUpdate];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_89;
  }
  uint64_t v36 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self dateOfLastStateUpdate];
  if (v36)
  {
    v37 = (void *)v36;
    v38 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self dateOfLastStateUpdate];
    v39 = [v4 dateOfLastStateUpdate];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_90;
    }
  }
  else
  {
  }
  NSUInteger v7 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self distanceRemaining];
  unint64_t v8 = [v4 distanceRemaining];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_89;
  }
  uint64_t v41 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self distanceRemaining];
  if (v41)
  {
    v42 = (void *)v41;
    v43 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self distanceRemaining];
    v44 = [v4 distanceRemaining];
    int v45 = [v43 isEqual:v44];

    if (!v45) {
      goto LABEL_90;
    }
  }
  else
  {
  }
  NSUInteger v7 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self distanceRemainingElectric];
  unint64_t v8 = [v4 distanceRemainingElectric];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_89;
  }
  uint64_t v46 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self distanceRemainingElectric];
  if (v46)
  {
    v47 = (void *)v46;
    v48 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self distanceRemainingElectric];
    v49 = [v4 distanceRemainingElectric];
    int v50 = [v48 isEqual:v49];

    if (!v50) {
      goto LABEL_90;
    }
  }
  else
  {
  }
  NSUInteger v7 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self distanceRemainingFuel];
  unint64_t v8 = [v4 distanceRemainingFuel];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_89;
  }
  uint64_t v51 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self distanceRemainingFuel];
  if (v51)
  {
    v52 = (void *)v51;
    v53 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self distanceRemainingFuel];
    v54 = [v4 distanceRemainingFuel];
    int v55 = [v53 isEqual:v54];

    if (!v55) {
      goto LABEL_90;
    }
  }
  else
  {
  }
  NSUInteger v7 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self fuelPercentRemaining];
  unint64_t v8 = [v4 fuelPercentRemaining];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_89;
  }
  uint64_t v56 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self fuelPercentRemaining];
  if (v56)
  {
    v57 = (void *)v56;
    v58 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self fuelPercentRemaining];
    v59 = [v4 fuelPercentRemaining];
    int v60 = [v58 isEqual:v59];

    if (!v60) {
      goto LABEL_90;
    }
  }
  else
  {
  }
  NSUInteger v7 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self maximumBatteryCapacity];
  unint64_t v8 = [v4 maximumBatteryCapacity];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_89;
  }
  uint64_t v61 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self maximumBatteryCapacity];
  if (v61)
  {
    v62 = (void *)v61;
    v63 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self maximumBatteryCapacity];
    v64 = [v4 maximumBatteryCapacity];
    int v65 = [v63 isEqual:v64];

    if (!v65) {
      goto LABEL_90;
    }
  }
  else
  {
  }
  NSUInteger v7 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self maximumDistance];
  unint64_t v8 = [v4 maximumDistance];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_89;
  }
  uint64_t v66 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self maximumDistance];
  if (v66)
  {
    v67 = (void *)v66;
    v68 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self maximumDistance];
    v69 = [v4 maximumDistance];
    int v70 = [v68 isEqual:v69];

    if (!v70) {
      goto LABEL_90;
    }
  }
  else
  {
  }
  NSUInteger v7 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self maximumDistanceElectric];
  unint64_t v8 = [v4 maximumDistanceElectric];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_89;
  }
  uint64_t v71 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self maximumDistanceElectric];
  if (v71)
  {
    v72 = (void *)v71;
    v73 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self maximumDistanceElectric];
    v74 = [v4 maximumDistanceElectric];
    int v75 = [v73 isEqual:v74];

    if (!v75) {
      goto LABEL_90;
    }
  }
  else
  {
  }
  NSUInteger v7 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self maximumDistanceFuel];
  unint64_t v8 = [v4 maximumDistanceFuel];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_89;
  }
  uint64_t v76 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self maximumDistanceFuel];
  if (v76)
  {
    v77 = (void *)v76;
    v78 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self maximumDistanceFuel];
    v79 = [v4 maximumDistanceFuel];
    int v80 = [v78 isEqual:v79];

    if (!v80) {
      goto LABEL_90;
    }
  }
  else
  {
  }
  NSUInteger v7 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self minimumBatteryCapacity];
  unint64_t v8 = [v4 minimumBatteryCapacity];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_89;
  }
  uint64_t v81 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self minimumBatteryCapacity];
  if (v81)
  {
    v82 = (void *)v81;
    v83 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self minimumBatteryCapacity];
    v84 = [v4 minimumBatteryCapacity];
    int v85 = [v83 isEqual:v84];

    if (!v85) {
      goto LABEL_90;
    }
  }
  else
  {
  }
  NSUInteger v7 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self minutesToFull];
  unint64_t v8 = [v4 minutesToFull];
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v86 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self minutesToFull];
    if (!v86)
    {

LABEL_93:
      BOOL v91 = 1;
      goto LABEL_91;
    }
    v87 = (void *)v86;
    v88 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self minutesToFull];
    v89 = [v4 minutesToFull];
    char v90 = [v88 isEqual:v89];

    if (v90) {
      goto LABEL_93;
    }
  }
  else
  {
LABEL_89:
  }
LABEL_90:
  BOOL v91 = 0;
LABEL_91:

  return v91;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBGetCarPowerLevelStatusIntentResponse allocWithZone:](_INPBGetCarPowerLevelStatusIntentResponse, "allocWithZone:") init];
  if ([(_INPBGetCarPowerLevelStatusIntentResponse *)self hasActiveConnector]) {
    [(_INPBGetCarPowerLevelStatusIntentResponse *)v5 setActiveConnector:[(_INPBGetCarPowerLevelStatusIntentResponse *)self activeConnector]];
  }
  uint64_t v6 = (void *)[(NSString *)self->_carIdentifier copyWithZone:a3];
  [(_INPBGetCarPowerLevelStatusIntentResponse *)v5 setCarIdentifier:v6];

  id v7 = [(_INPBDouble *)self->_chargePercentRemaining copyWithZone:a3];
  [(_INPBGetCarPowerLevelStatusIntentResponse *)v5 setChargePercentRemaining:v7];

  if ([(_INPBGetCarPowerLevelStatusIntentResponse *)self hasCharging]) {
    [(_INPBGetCarPowerLevelStatusIntentResponse *)v5 setCharging:[(_INPBGetCarPowerLevelStatusIntentResponse *)self charging]];
  }
  id v8 = [(_INPBJSONDictionary *)self->_chargingFormulaArguments copyWithZone:a3];
  [(_INPBGetCarPowerLevelStatusIntentResponse *)v5 setChargingFormulaArguments:v8];

  id v9 = [(_INPBJSONDictionary *)self->_consumptionFormulaArguments copyWithZone:a3];
  [(_INPBGetCarPowerLevelStatusIntentResponse *)v5 setConsumptionFormulaArguments:v9];

  id v10 = [(_INPBEnergy *)self->_currentBatteryCapacity copyWithZone:a3];
  [(_INPBGetCarPowerLevelStatusIntentResponse *)v5 setCurrentBatteryCapacity:v10];

  id v11 = [(_INPBDateTime *)self->_dateOfLastStateUpdate copyWithZone:a3];
  [(_INPBGetCarPowerLevelStatusIntentResponse *)v5 setDateOfLastStateUpdate:v11];

  id v12 = [(_INPBDistance *)self->_distanceRemaining copyWithZone:a3];
  [(_INPBGetCarPowerLevelStatusIntentResponse *)v5 setDistanceRemaining:v12];

  id v13 = [(_INPBDistance *)self->_distanceRemainingElectric copyWithZone:a3];
  [(_INPBGetCarPowerLevelStatusIntentResponse *)v5 setDistanceRemainingElectric:v13];

  id v14 = [(_INPBDistance *)self->_distanceRemainingFuel copyWithZone:a3];
  [(_INPBGetCarPowerLevelStatusIntentResponse *)v5 setDistanceRemainingFuel:v14];

  id v15 = [(_INPBDouble *)self->_fuelPercentRemaining copyWithZone:a3];
  [(_INPBGetCarPowerLevelStatusIntentResponse *)v5 setFuelPercentRemaining:v15];

  id v16 = [(_INPBEnergy *)self->_maximumBatteryCapacity copyWithZone:a3];
  [(_INPBGetCarPowerLevelStatusIntentResponse *)v5 setMaximumBatteryCapacity:v16];

  id v17 = [(_INPBDistance *)self->_maximumDistance copyWithZone:a3];
  [(_INPBGetCarPowerLevelStatusIntentResponse *)v5 setMaximumDistance:v17];

  id v18 = [(_INPBDistance *)self->_maximumDistanceElectric copyWithZone:a3];
  [(_INPBGetCarPowerLevelStatusIntentResponse *)v5 setMaximumDistanceElectric:v18];

  id v19 = [(_INPBDistance *)self->_maximumDistanceFuel copyWithZone:a3];
  [(_INPBGetCarPowerLevelStatusIntentResponse *)v5 setMaximumDistanceFuel:v19];

  id v20 = [(_INPBEnergy *)self->_minimumBatteryCapacity copyWithZone:a3];
  [(_INPBGetCarPowerLevelStatusIntentResponse *)v5 setMinimumBatteryCapacity:v20];

  id v21 = [(_INPBInteger *)self->_minutesToFull copyWithZone:a3];
  [(_INPBGetCarPowerLevelStatusIntentResponse *)v5 setMinutesToFull:v21];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBGetCarPowerLevelStatusIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBGetCarPowerLevelStatusIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBGetCarPowerLevelStatusIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBGetCarPowerLevelStatusIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v36 = a3;
  if ([(_INPBGetCarPowerLevelStatusIntentResponse *)self hasActiveConnector]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self carIdentifier];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  int v5 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self chargePercentRemaining];

  if (v5)
  {
    id v6 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self chargePercentRemaining];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBGetCarPowerLevelStatusIntentResponse *)self hasCharging]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v7 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self chargingFormulaArguments];

  if (v7)
  {
    id v8 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self chargingFormulaArguments];
    PBDataWriterWriteSubmessage();
  }
  id v9 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self consumptionFormulaArguments];

  if (v9)
  {
    id v10 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self consumptionFormulaArguments];
    PBDataWriterWriteSubmessage();
  }
  id v11 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self currentBatteryCapacity];

  if (v11)
  {
    id v12 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self currentBatteryCapacity];
    PBDataWriterWriteSubmessage();
  }
  id v13 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self dateOfLastStateUpdate];

  if (v13)
  {
    id v14 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self dateOfLastStateUpdate];
    PBDataWriterWriteSubmessage();
  }
  id v15 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self distanceRemaining];

  if (v15)
  {
    id v16 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self distanceRemaining];
    PBDataWriterWriteSubmessage();
  }
  id v17 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self distanceRemainingElectric];

  if (v17)
  {
    id v18 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self distanceRemainingElectric];
    PBDataWriterWriteSubmessage();
  }
  id v19 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self distanceRemainingFuel];

  if (v19)
  {
    id v20 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self distanceRemainingFuel];
    PBDataWriterWriteSubmessage();
  }
  id v21 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self fuelPercentRemaining];

  if (v21)
  {
    v22 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self fuelPercentRemaining];
    PBDataWriterWriteSubmessage();
  }
  v23 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self maximumBatteryCapacity];

  if (v23)
  {
    v24 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self maximumBatteryCapacity];
    PBDataWriterWriteSubmessage();
  }
  int v25 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self maximumDistance];

  if (v25)
  {
    uint64_t v26 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self maximumDistance];
    PBDataWriterWriteSubmessage();
  }
  v27 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self maximumDistanceElectric];

  if (v27)
  {
    v28 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self maximumDistanceElectric];
    PBDataWriterWriteSubmessage();
  }
  v29 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self maximumDistanceFuel];

  if (v29)
  {
    int v30 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self maximumDistanceFuel];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v31 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self minimumBatteryCapacity];

  if (v31)
  {
    v32 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self minimumBatteryCapacity];
    PBDataWriterWriteSubmessage();
  }
  v33 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self minutesToFull];

  v34 = v36;
  if (v33)
  {
    int v35 = [(_INPBGetCarPowerLevelStatusIntentResponse *)self minutesToFull];
    PBDataWriterWriteSubmessage();

    v34 = v36;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBGetCarPowerLevelStatusIntentResponseReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasMinutesToFull
{
  return self->_minutesToFull != 0;
}

- (void)setMinutesToFull:(id)a3
{
}

- (BOOL)hasMinimumBatteryCapacity
{
  return self->_minimumBatteryCapacity != 0;
}

- (void)setMinimumBatteryCapacity:(id)a3
{
}

- (BOOL)hasMaximumDistanceFuel
{
  return self->_maximumDistanceFuel != 0;
}

- (void)setMaximumDistanceFuel:(id)a3
{
}

- (BOOL)hasMaximumDistanceElectric
{
  return self->_maximumDistanceElectric != 0;
}

- (void)setMaximumDistanceElectric:(id)a3
{
}

- (BOOL)hasMaximumDistance
{
  return self->_maximumDistance != 0;
}

- (void)setMaximumDistance:(id)a3
{
}

- (BOOL)hasMaximumBatteryCapacity
{
  return self->_maximumBatteryCapacity != 0;
}

- (void)setMaximumBatteryCapacity:(id)a3
{
}

- (BOOL)hasFuelPercentRemaining
{
  return self->_fuelPercentRemaining != 0;
}

- (void)setFuelPercentRemaining:(id)a3
{
}

- (BOOL)hasDistanceRemainingFuel
{
  return self->_distanceRemainingFuel != 0;
}

- (void)setDistanceRemainingFuel:(id)a3
{
}

- (BOOL)hasDistanceRemainingElectric
{
  return self->_distanceRemainingElectric != 0;
}

- (void)setDistanceRemainingElectric:(id)a3
{
}

- (BOOL)hasDistanceRemaining
{
  return self->_distanceRemaining != 0;
}

- (void)setDistanceRemaining:(id)a3
{
}

- (BOOL)hasDateOfLastStateUpdate
{
  return self->_dateOfLastStateUpdate != 0;
}

- (void)setDateOfLastStateUpdate:(id)a3
{
}

- (BOOL)hasCurrentBatteryCapacity
{
  return self->_currentBatteryCapacity != 0;
}

- (void)setCurrentBatteryCapacity:(id)a3
{
}

- (BOOL)hasConsumptionFormulaArguments
{
  return self->_consumptionFormulaArguments != 0;
}

- (void)setConsumptionFormulaArguments:(id)a3
{
}

- (BOOL)hasChargingFormulaArguments
{
  return self->_chargingFormulaArguments != 0;
}

- (void)setChargingFormulaArguments:(id)a3
{
}

- (void)setHasCharging:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCharging
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCharging:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int charging = a3;
}

- (BOOL)hasChargePercentRemaining
{
  return self->_chargePercentRemaining != 0;
}

- (void)setChargePercentRemaining:(id)a3
{
}

- (BOOL)hasCarIdentifier
{
  return self->_carIdentifier != 0;
}

- (void)setCarIdentifier:(id)a3
{
  self->_carIdentifier = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (int)StringAsActiveConnector:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"J1772"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"C_C_S1"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"C_C_S2"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CHAdeMO"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"G_B_T_A_C"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"G_B_T_D_C"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Tesla"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Mennekes"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"N_A_C_S_D_C"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"N_A_C_S_A_C"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 2;
  }

  return v4;
}

- (id)activeConnectorAsString:(int)a3
{
  if ((a3 - 2) >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E55173D8[a3 - 2];
  }

  return v3;
}

- (void)setHasActiveConnector:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActiveConnector
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setActiveConnector:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int activeConnector = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end