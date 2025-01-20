@interface HDIndoorBikeData
+ (id)unitTest_fakeIndoorBikeDataForInstantaneousCadence:(double)a3 averageCadence:(double)a4 instantaneousSpeed:(double)a5 totalDistance:(unsigned int)a6 instantaneousPower:(signed __int16)a7 averagePower:(signed __int16)a8 energy:(unsigned __int16)a9 elapsedTime:(unsigned __int16)a10;
+ (id)uuid;
+ (unsigned)flagFieldLength;
- (BOOL)averageCadenceIsSet;
- (BOOL)averagePowerIsSet;
- (BOOL)averageSpeedIsSet;
- (BOOL)elapsedTimeIsSet;
- (BOOL)energyPerHourIsSet;
- (BOOL)energyPerMinuteIsSet;
- (BOOL)heartRateIsSet;
- (BOOL)instantaneousCadenceIsSet;
- (BOOL)instantaneousPowerIsSet;
- (BOOL)instantaneousSpeedIsSet;
- (BOOL)metabolicEquivalentIsSet;
- (BOOL)remainingTimeIsSet;
- (BOOL)resistanceLevelIsSet;
- (BOOL)totalDistanceIsSet;
- (BOOL)totalEnergyIsSet;
- (double)averageCadence;
- (double)averageSpeed;
- (double)instantaneousCadence;
- (double)instantaneousSpeed;
- (id)_init;
- (id)allFields;
- (id)description;
- (id)generateDatums:(id)a3;
- (signed)averagePower;
- (signed)instantaneousPower;
- (signed)resistanceLevel;
- (unsigned)elapsedTime;
- (unsigned)energyPerHour;
- (unsigned)energyPerMinute;
- (unsigned)heartRate;
- (unsigned)metabolicEquivalent;
- (unsigned)remainingTime;
- (unsigned)totalDistance;
- (unsigned)totalEnergy;
@end

@implementation HDIndoorBikeData

- (id)generateDatums:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  v6 = +[NSUserDefaults standardUserDefaults];
  v7 = [v6 persistentDomainForName:kHKConnectedGymPreferencesDomain];

  v8 = [v7 objectForKeyedSubscript:@"ConnectedGymLegacySpeed"];
  unsigned int v9 = [v8 BOOLValue];

  if (v9)
  {
    if ([(HDIndoorBikeData *)self instantaneousSpeedIsSet])
    {
      v10 = +[HKUnit unitFromString:@"km/hr"];
      [(HDIndoorBikeData *)self instantaneousSpeed];
      v11 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v10);

      id v12 = objc_alloc((Class)HDQuantityDatum);
      v13 = +[NSUUID UUID];
      id v14 = [v12 initWithIdentifier:v13 dateInterval:v4 resumeContext:0 quantity:v11];

      [v5 setObject:v14 forKeyedSubscript:&off_63F90];
    }
    if ([(HDIndoorBikeData *)self averageSpeedIsSet])
    {
      v15 = +[HKUnit unitFromString:@"km/hr"];
      [(HDIndoorBikeData *)self averageSpeed];
      v16 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v15);

      id v17 = objc_alloc((Class)HDQuantityDatum);
      v18 = +[NSUUID UUID];
      id v19 = [v17 initWithIdentifier:v18 dateInterval:v4 resumeContext:0 quantity:v16];

      [v5 setObject:v19 forKeyedSubscript:&off_63FA8];
    }
  }
  if ([(HDIndoorBikeData *)self instantaneousCadenceIsSet])
  {
    v20 = +[HKUnit unitFromString:@"count/min"];
    [(HDIndoorBikeData *)self instantaneousCadence];
    v21 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v20);

    id v22 = objc_alloc((Class)HDQuantityDatum);
    v23 = +[NSUUID UUID];
    id v24 = [v22 initWithIdentifier:v23 dateInterval:v4 resumeContext:0 quantity:v21];

    [v5 setObject:v24 forKeyedSubscript:&off_63FC0];
  }
  if ([(HDIndoorBikeData *)self averageCadenceIsSet])
  {
    v25 = +[HKUnit unitFromString:@"count/min"];
    [(HDIndoorBikeData *)self averageCadence];
    v26 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v25);

    id v27 = objc_alloc((Class)HDQuantityDatum);
    v28 = +[NSUUID UUID];
    id v29 = [v27 initWithIdentifier:v28 dateInterval:v4 resumeContext:0 quantity:v26];

    [v5 setObject:v29 forKeyedSubscript:&off_63FD8];
  }
  if ([(HDIndoorBikeData *)self totalDistanceIsSet])
  {
    v30 = +[HKUnit unitFromString:@"m"];
    v31 = +[HKQuantity quantityWithUnit:v30 doubleValue:(double)[(HDIndoorBikeData *)self totalDistance]];

    id v32 = objc_alloc((Class)HDQuantityDatum);
    v33 = +[NSUUID UUID];
    id v34 = [v32 initWithIdentifier:v33 dateInterval:v4 resumeContext:0 quantity:v31];

    [v5 setObject:v34 forKeyedSubscript:&off_63FF0];
  }
  if ([(HDIndoorBikeData *)self resistanceLevelIsSet])
  {
    v35 = +[HKUnit unitFromString:@"count"];
    v36 = +[HKQuantity quantityWithUnit:v35 doubleValue:(double)[(HDIndoorBikeData *)self resistanceLevel]];

    id v37 = objc_alloc((Class)HDQuantityDatum);
    v38 = +[NSUUID UUID];
    id v39 = [v37 initWithIdentifier:v38 dateInterval:v4 resumeContext:0 quantity:v36];

    [v5 setObject:v39 forKeyedSubscript:&off_64008];
  }
  if ([(HDIndoorBikeData *)self instantaneousPowerIsSet])
  {
    v40 = +[HKUnit wattUnit];
    v41 = +[HKQuantity quantityWithUnit:v40 doubleValue:(double)[(HDIndoorBikeData *)self instantaneousPower]];

    id v42 = objc_alloc((Class)HDQuantityDatum);
    v43 = +[NSUUID UUID];
    id v44 = [v42 initWithIdentifier:v43 dateInterval:v4 resumeContext:0 quantity:v41];

    [v5 setObject:v44 forKeyedSubscript:&off_64020];
  }
  if ([(HDIndoorBikeData *)self averagePowerIsSet])
  {
    v45 = +[HKUnit wattUnit];
    v46 = +[HKQuantity quantityWithUnit:v45 doubleValue:(double)[(HDIndoorBikeData *)self averagePower]];

    id v47 = objc_alloc((Class)HDQuantityDatum);
    v48 = +[NSUUID UUID];
    id v49 = [v47 initWithIdentifier:v48 dateInterval:v4 resumeContext:0 quantity:v46];

    [v5 setObject:v49 forKeyedSubscript:&off_64038];
  }
  if ([(HDIndoorBikeData *)self totalEnergyIsSet])
  {
    v50 = +[HKUnit unitFromString:@"kcal"];
    v51 = +[HKQuantity quantityWithUnit:v50 doubleValue:(double)[(HDIndoorBikeData *)self totalEnergy]];

    id v52 = objc_alloc((Class)HDQuantityDatum);
    v53 = +[NSUUID UUID];
    id v54 = [v52 initWithIdentifier:v53 dateInterval:v4 resumeContext:0 quantity:v51];

    [v5 setObject:v54 forKeyedSubscript:&off_64050];
  }
  if ([(HDIndoorBikeData *)self elapsedTimeIsSet])
  {
    v55 = +[HKUnit unitFromString:@"s"];
    v56 = +[HKQuantity quantityWithUnit:v55 doubleValue:(double)[(HDIndoorBikeData *)self elapsedTime]];

    id v57 = objc_alloc((Class)HDQuantityDatum);
    v58 = +[NSUUID UUID];
    id v59 = [v57 initWithIdentifier:v58 dateInterval:v4 resumeContext:0 quantity:v56];

    [v5 setObject:v59 forKeyedSubscript:&off_64068];
  }

  return v5;
}

- (id)allFields
{
  averageSpeedField = self->_averageSpeedField;
  instantaneousCadenceField = self->_instantaneousCadenceField;
  averageCadenceField = self->_averageCadenceField;
  totalDistanceField = self->_totalDistanceField;
  resistanceLevelField = self->_resistanceLevelField;
  instantaneousPowerField = self->_instantaneousPowerField;
  v16[0] = self->_instantaneousSpeedField;
  v16[1] = averageSpeedField;
  averagePowerField = self->_averagePowerField;
  v16[2] = instantaneousCadenceField;
  v16[3] = averageCadenceField;
  totalEnergyField = self->_totalEnergyField;
  v16[4] = totalDistanceField;
  v16[5] = resistanceLevelField;
  energyPerHourField = self->_energyPerHourField;
  v16[6] = instantaneousPowerField;
  v16[7] = averagePowerField;
  energyPerMinuteField = self->_energyPerMinuteField;
  v16[8] = totalEnergyField;
  v16[9] = energyPerHourField;
  heartRateField = self->_heartRateField;
  v16[10] = energyPerMinuteField;
  v16[11] = heartRateField;
  elapsedTimeField = self->_elapsedTimeField;
  v16[12] = self->_metabolicEquivalentField;
  v16[13] = elapsedTimeField;
  v16[14] = self->_remainingTimeField;
  id v14 = +[NSArray arrayWithObjects:v16 count:15];

  return v14;
}

+ (id)uuid
{
  return +[CBUUID UUIDWithString:@"0x2AD2"];
}

+ (unsigned)flagFieldLength
{
  return 2;
}

- (id)_init
{
  v34.receiver = self;
  v34.super_class = (Class)HDIndoorBikeData;
  id v2 = [(HDHealthServiceCharacteristic *)&v34 _init];
  if (v2)
  {
    v3 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicDoubleField alloc] initWithCorrespondingFlagBit:0 fieldLength:2 factor:100];
    id v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    [*((id *)v2 + 2) setFlagFieldFlipped:1];
    id v5 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicDoubleField alloc] initWithCorrespondingFlagBit:1 fieldLength:2 factor:100];
    v6 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v5;

    v7 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicDoubleField alloc] initWithCorrespondingFlagBit:2 fieldLength:2 factor:2];
    v8 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v7;

    [*((id *)v2 + 4) setFlagFieldFlipped:1];
    unsigned int v9 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicDoubleField alloc] initWithCorrespondingFlagBit:3 fieldLength:2 factor:2];
    v10 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v9;

    v11 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt24Field alloc] initWithCorrespondingFlagBit:4 fieldLength:3 factor:1];
    id v12 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v11;

    v13 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicInt16Field alloc] initWithCorrespondingFlagBit:5 fieldLength:2 factor:1];
    id v14 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v13;

    v15 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicInt16Field alloc] initWithCorrespondingFlagBit:6 fieldLength:2 factor:1];
    v16 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v15;

    id v17 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicInt16Field alloc] initWithCorrespondingFlagBit:7 fieldLength:2 factor:1];
    v18 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v17;

    id v19 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt16Field alloc] initWithCorrespondingFlagBit:8 fieldLength:2 factor:1];
    v20 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v19;

    v21 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt16Field alloc] initWithCorrespondingFlagBit:8 fieldLength:2 factor:1];
    id v22 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v21;

    v23 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt8Field alloc] initWithCorrespondingFlagBit:8 fieldLength:1 factor:1];
    id v24 = (void *)*((void *)v2 + 12);
    *((void *)v2 + 12) = v23;

    v25 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt8Field alloc] initWithCorrespondingFlagBit:9 fieldLength:1 factor:1];
    v26 = (void *)*((void *)v2 + 13);
    *((void *)v2 + 13) = v25;

    id v27 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt8Field alloc] initWithCorrespondingFlagBit:10 fieldLength:1 factor:1];
    v28 = (void *)*((void *)v2 + 14);
    *((void *)v2 + 14) = v27;

    id v29 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt16Field alloc] initWithCorrespondingFlagBit:11 fieldLength:2 factor:1];
    v30 = (void *)*((void *)v2 + 15);
    *((void *)v2 + 15) = v29;

    v31 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt16Field alloc] initWithCorrespondingFlagBit:12 fieldLength:2 factor:1];
    id v32 = (void *)*((void *)v2 + 16);
    *((void *)v2 + 16) = v31;
  }
  return v2;
}

- (id)description
{
  unsigned int v24 = [(HDFitnessMachineCharacteristicField *)self->_instantaneousSpeedField isSet];
  if (v24)
  {
    [(HDFitnessMachineCharacteristicDoubleField *)self->_instantaneousSpeedField value];
    +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = @"(null)";
  }
  unsigned int v23 = [(HDFitnessMachineCharacteristicField *)self->_averageSpeedField isSet];
  if (v23)
  {
    [(HDFitnessMachineCharacteristicDoubleField *)self->_averageSpeedField value];
    +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    objc_super v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v34 = @"(null)";
  }
  unsigned int v22 = [(HDFitnessMachineCharacteristicField *)self->_instantaneousCadenceField isSet];
  if (v22)
  {
    [(HDFitnessMachineCharacteristicDoubleField *)self->_instantaneousCadenceField value];
    +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = @"(null)";
  }
  unsigned int v21 = [(HDFitnessMachineCharacteristicField *)self->_averageCadenceField isSet];
  if (v21)
  {
    [(HDFitnessMachineCharacteristicDoubleField *)self->_averageCadenceField value];
    +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    id v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v32 = @"(null)";
  }
  unsigned int v20 = [(HDFitnessMachineCharacteristicField *)self->_totalDistanceField isSet];
  if (v20)
  {
    CFStringRef v4 = +[NSNumber numberWithUnsignedInt:[(HDFitnessMachineCharacteristicUInt24Field *)self->_totalDistanceField value]];
  }
  else
  {
    CFStringRef v4 = @"(null)";
  }
  unsigned int v19 = [(HDFitnessMachineCharacteristicField *)self->_resistanceLevelField isSet];
  if (v19)
  {
    v31 = +[NSNumber numberWithShort:[(HDFitnessMachineCharacteristicInt16Field *)self->_resistanceLevelField value]];
  }
  else
  {
    v31 = @"(null)";
  }
  unsigned int v18 = [(HDFitnessMachineCharacteristicField *)self->_instantaneousPowerField isSet];
  if (v18)
  {
    v30 = +[NSNumber numberWithShort:[(HDFitnessMachineCharacteristicInt16Field *)self->_instantaneousPowerField value]];
  }
  else
  {
    v30 = @"(null)";
  }
  unsigned int v17 = [(HDFitnessMachineCharacteristicField *)self->_averagePowerField isSet];
  if (v17)
  {
    id v29 = +[NSNumber numberWithShort:[(HDFitnessMachineCharacteristicInt16Field *)self->_averagePowerField value]];
  }
  else
  {
    id v29 = @"(null)";
  }
  unsigned int v16 = [(HDFitnessMachineCharacteristicField *)self->_totalEnergyField isSet];
  if (v16)
  {
    v28 = +[NSNumber numberWithUnsignedShort:[(HDFitnessMachineCharacteristicUInt16Field *)self->_totalEnergyField value]];
  }
  else
  {
    v28 = @"(null)";
  }
  unsigned int v15 = [(HDFitnessMachineCharacteristicField *)self->_energyPerHourField isSet];
  if (v15)
  {
    id v27 = +[NSNumber numberWithUnsignedShort:[(HDFitnessMachineCharacteristicUInt16Field *)self->_energyPerHourField value]];
  }
  else
  {
    id v27 = @"(null)";
  }
  unsigned int v14 = [(HDFitnessMachineCharacteristicField *)self->_energyPerMinuteField isSet];
  if (v14)
  {
    v26 = +[NSNumber numberWithUnsignedChar:[(HDFitnessMachineCharacteristicUInt8Field *)self->_energyPerMinuteField value]];
  }
  else
  {
    v26 = @"(null)";
  }
  unsigned int v5 = [(HDFitnessMachineCharacteristicField *)self->_heartRateField isSet];
  if (v5)
  {
    v25 = +[NSNumber numberWithUnsignedChar:[(HDFitnessMachineCharacteristicUInt8Field *)self->_heartRateField value]];
  }
  else
  {
    v25 = @"(null)";
  }
  unsigned int v6 = [(HDFitnessMachineCharacteristicField *)self->_metabolicEquivalentField isSet];
  if (v6)
  {
    v7 = +[NSNumber numberWithUnsignedChar:[(HDFitnessMachineCharacteristicUInt8Field *)self->_metabolicEquivalentField value]];
  }
  else
  {
    v7 = @"(null)";
  }
  v8 = (__CFString *)v4;
  unsigned int v9 = [(HDFitnessMachineCharacteristicField *)self->_elapsedTimeField isSet];
  if (v9)
  {
    v10 = +[NSNumber numberWithUnsignedShort:[(HDFitnessMachineCharacteristicUInt16Field *)self->_elapsedTimeField value]];
  }
  else
  {
    v10 = @"(null)";
  }
  if (![(HDFitnessMachineCharacteristicField *)self->_remainingTimeField isSet])
  {
    id v12 = +[NSString stringWithFormat:@"Indoor Bike Data: instantaneousSpeed = %@, averageSpeed = %@, instantaneousCadence = %@, averageCadence = %@, totalDistance = %@, resistanceLevel = %@, instantaneousPower = %@, averagePower = %@, totalEnergy = %@, energyPerHour = %@, energyPerMinute = %@, heartRate = %@, metabolicEquivalent = %@, elapsedTime = %@, remainingTime = %@", v3, v34, v33, v32, v4, v31, v30, v29, v28, v27, v26, v25, v7, v10, @"(null)"];
    if (!v9) {
      goto LABEL_48;
    }
    goto LABEL_47;
  }
  v11 = +[NSNumber numberWithUnsignedShort:[(HDFitnessMachineCharacteristicUInt16Field *)self->_remainingTimeField value]];
  id v12 = +[NSString stringWithFormat:@"Indoor Bike Data: instantaneousSpeed = %@, averageSpeed = %@, instantaneousCadence = %@, averageCadence = %@, totalDistance = %@, resistanceLevel = %@, instantaneousPower = %@, averagePower = %@, totalEnergy = %@, energyPerHour = %@, energyPerMinute = %@, heartRate = %@, metabolicEquivalent = %@, elapsedTime = %@, remainingTime = %@", v3, v34, v33, v32, v8, v31, v30, v29, v28, v27, v26, v25, v7, v10, v11];

  if (v9) {
LABEL_47:
  }

LABEL_48:
  if (!v6)
  {
    if (!v5) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }

  if (v5) {
LABEL_50:
  }

LABEL_51:
  if (v14) {

  }
  if (v15) {
  if (v16)
  }

  if (v17) {
  if (v18)
  }

  if (v19) {
  if (v20)
  }

  if (v21) {
  if (v22)
  }

  if (v23) {
  if (v24)
  }

  return v12;
}

- (BOOL)instantaneousSpeedIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_instantaneousSpeedField isSet];
}

- (double)instantaneousSpeed
{
  [(HDFitnessMachineCharacteristicDoubleField *)self->_instantaneousSpeedField value];
  return result;
}

- (BOOL)averageSpeedIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_averageSpeedField isSet];
}

- (double)averageSpeed
{
  [(HDFitnessMachineCharacteristicDoubleField *)self->_averageSpeedField value];
  return result;
}

- (BOOL)instantaneousCadenceIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_instantaneousCadenceField isSet];
}

- (double)instantaneousCadence
{
  [(HDFitnessMachineCharacteristicDoubleField *)self->_instantaneousCadenceField value];
  return result;
}

- (BOOL)averageCadenceIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_averageCadenceField isSet];
}

- (double)averageCadence
{
  [(HDFitnessMachineCharacteristicDoubleField *)self->_averageCadenceField value];
  return result;
}

- (BOOL)totalDistanceIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_totalDistanceField isSet];
}

- (unsigned)totalDistance
{
  return [(HDFitnessMachineCharacteristicUInt24Field *)self->_totalDistanceField value];
}

- (BOOL)resistanceLevelIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_resistanceLevelField isSet];
}

- (signed)resistanceLevel
{
  return [(HDFitnessMachineCharacteristicInt16Field *)self->_resistanceLevelField value];
}

- (BOOL)instantaneousPowerIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_instantaneousPowerField isSet];
}

- (signed)instantaneousPower
{
  return [(HDFitnessMachineCharacteristicInt16Field *)self->_instantaneousPowerField value];
}

- (BOOL)averagePowerIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_averagePowerField isSet];
}

- (signed)averagePower
{
  return [(HDFitnessMachineCharacteristicInt16Field *)self->_averagePowerField value];
}

- (BOOL)totalEnergyIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_totalEnergyField isSet];
}

- (unsigned)totalEnergy
{
  return [(HDFitnessMachineCharacteristicUInt16Field *)self->_totalEnergyField value];
}

- (BOOL)energyPerHourIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_energyPerHourField isSet];
}

- (unsigned)energyPerHour
{
  return [(HDFitnessMachineCharacteristicUInt16Field *)self->_energyPerHourField value];
}

- (BOOL)energyPerMinuteIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_energyPerMinuteField isSet];
}

- (unsigned)energyPerMinute
{
  return [(HDFitnessMachineCharacteristicUInt8Field *)self->_energyPerMinuteField value];
}

- (BOOL)heartRateIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_heartRateField isSet];
}

- (unsigned)heartRate
{
  return [(HDFitnessMachineCharacteristicUInt8Field *)self->_heartRateField value];
}

- (BOOL)metabolicEquivalentIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_metabolicEquivalentField isSet];
}

- (unsigned)metabolicEquivalent
{
  return [(HDFitnessMachineCharacteristicUInt8Field *)self->_metabolicEquivalentField value];
}

- (BOOL)elapsedTimeIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_elapsedTimeField isSet];
}

- (unsigned)elapsedTime
{
  return [(HDFitnessMachineCharacteristicUInt16Field *)self->_elapsedTimeField value];
}

- (BOOL)remainingTimeIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_remainingTimeField isSet];
}

- (unsigned)remainingTime
{
  return [(HDFitnessMachineCharacteristicUInt16Field *)self->_remainingTimeField value];
}

+ (id)unitTest_fakeIndoorBikeDataForInstantaneousCadence:(double)a3 averageCadence:(double)a4 instantaneousSpeed:(double)a5 totalDistance:(unsigned int)a6 instantaneousPower:(signed __int16)a7 averagePower:(signed __int16)a8 energy:(unsigned __int16)a9 elapsedTime:(unsigned __int16)a10
{
  uint64_t v10 = a10;
  uint64_t v11 = a9;
  uint64_t v12 = a8;
  uint64_t v13 = a7;
  uint64_t v14 = *(void *)&a6;
  unsigned int v18 = [[HDIndoorBikeData alloc] _init];
  [v18[4] setValue:a3];
  [v18[4] setIsSet:1];
  [v18[5] setValue:a4];
  [v18[5] setIsSet:1];
  [v18[2] setValue:a5];
  [v18[2] setIsSet:1];
  [v18[6] setValue:v14];
  [v18[6] setIsSet:1];
  [v18[8] setValue:v13];
  [v18[8] setIsSet:1];
  [v18[9] setValue:v12];
  [v18[9] setIsSet:1];
  [v18[10] setValue:v11];
  [v18[10] setIsSet:1];
  [v18[15] setValue:v10];
  [v18[15] setIsSet:1];

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remainingTimeField, 0);
  objc_storeStrong((id *)&self->_elapsedTimeField, 0);
  objc_storeStrong((id *)&self->_metabolicEquivalentField, 0);
  objc_storeStrong((id *)&self->_heartRateField, 0);
  objc_storeStrong((id *)&self->_energyPerMinuteField, 0);
  objc_storeStrong((id *)&self->_energyPerHourField, 0);
  objc_storeStrong((id *)&self->_totalEnergyField, 0);
  objc_storeStrong((id *)&self->_averagePowerField, 0);
  objc_storeStrong((id *)&self->_instantaneousPowerField, 0);
  objc_storeStrong((id *)&self->_resistanceLevelField, 0);
  objc_storeStrong((id *)&self->_totalDistanceField, 0);
  objc_storeStrong((id *)&self->_averageCadenceField, 0);
  objc_storeStrong((id *)&self->_instantaneousCadenceField, 0);
  objc_storeStrong((id *)&self->_averageSpeedField, 0);

  objc_storeStrong((id *)&self->_instantaneousSpeedField, 0);
}

@end