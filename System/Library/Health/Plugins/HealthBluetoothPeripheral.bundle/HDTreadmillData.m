@interface HDTreadmillData
+ (id)unitTest_fakeTreadmillDataForDistance:(unsigned int)a3 energy:(unsigned __int16)a4 elapsedTime:(unsigned __int16)a5;
+ (id)uuid;
+ (unsigned)flagFieldLength;
- (BOOL)averagePaceIsSet;
- (BOOL)averageSpeedIsSet;
- (BOOL)elapsedTimeIsSet;
- (BOOL)energyPerHourIsSet;
- (BOOL)energyPerMinuteIsSet;
- (BOOL)forceOnBeltIsSet;
- (BOOL)heartRateIsSet;
- (BOOL)inclinationIsSet;
- (BOOL)instantaneousPaceIsSet;
- (BOOL)instantaneousSpeedIsSet;
- (BOOL)metabolicEquivalentIsSet;
- (BOOL)negativeElevationGainIsSet;
- (BOOL)positiveElevationGainIsSet;
- (BOOL)powerOutputIsSet;
- (BOOL)rampSettingIsSet;
- (BOOL)remainingTimeIsSet;
- (BOOL)totalDistanceIsSet;
- (BOOL)totalEnergyIsSet;
- (double)averagePace;
- (double)averageSpeed;
- (double)inclination;
- (double)instantaneousPace;
- (double)instantaneousSpeed;
- (double)negativeElevationGain;
- (double)positiveElevationGain;
- (double)rampSetting;
- (id)_init;
- (id)allFields;
- (id)description;
- (id)generateDatums:(id)a3;
- (unsigned)elapsedTime;
- (unsigned)energyPerHour;
- (unsigned)energyPerMinute;
- (unsigned)forceOnBelt;
- (unsigned)heartRate;
- (unsigned)metabolicEquivalent;
- (unsigned)powerOutput;
- (unsigned)remainingTime;
- (unsigned)totalDistance;
- (unsigned)totalEnergy;
@end

@implementation HDTreadmillData

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
    if ([(HDTreadmillData *)self instantaneousSpeedIsSet])
    {
      v10 = +[HKUnit unitFromString:@"km/hr"];
      [(HDTreadmillData *)self instantaneousSpeed];
      v11 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v10);

      id v12 = objc_alloc((Class)HDQuantityDatum);
      v13 = +[NSUUID UUID];
      id v14 = [v12 initWithIdentifier:v13 dateInterval:v4 resumeContext:0 quantity:v11];

      [v5 setObject:v14 forKeyedSubscript:&off_64110];
    }
    if ([(HDTreadmillData *)self averageSpeedIsSet])
    {
      v15 = +[HKUnit unitFromString:@"km/hr"];
      [(HDTreadmillData *)self averageSpeed];
      v16 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v15);

      id v17 = objc_alloc((Class)HDQuantityDatum);
      v18 = +[NSUUID UUID];
      id v19 = [v17 initWithIdentifier:v18 dateInterval:v4 resumeContext:0 quantity:v16];

      [v5 setObject:v19 forKeyedSubscript:&off_64128];
    }
  }
  if ([(HDTreadmillData *)self totalDistanceIsSet])
  {
    v20 = +[HKUnit unitFromString:@"m"];
    v21 = +[HKQuantity quantityWithUnit:v20 doubleValue:(double)[(HDTreadmillData *)self totalDistance]];

    id v22 = objc_alloc((Class)HDQuantityDatum);
    v23 = +[NSUUID UUID];
    id v24 = [v22 initWithIdentifier:v23 dateInterval:v4 resumeContext:0 quantity:v21];

    [v5 setObject:v24 forKeyedSubscript:&off_64140];
  }
  if ([(HDTreadmillData *)self inclinationIsSet])
  {
    v25 = +[HKUnit unitFromString:@"%"];
    [(HDTreadmillData *)self inclination];
    v26 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v25);

    id v27 = objc_alloc((Class)HDQuantityDatum);
    v28 = +[NSUUID UUID];
    id v29 = [v27 initWithIdentifier:v28 dateInterval:v4 resumeContext:0 quantity:v26];

    [v5 setObject:v29 forKeyedSubscript:&off_64158];
  }
  if ([(HDTreadmillData *)self positiveElevationGainIsSet])
  {
    v30 = +[HKUnit unitFromString:@"m"];
    [(HDTreadmillData *)self positiveElevationGain];
    v31 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v30);

    id v32 = objc_alloc((Class)HDQuantityDatum);
    v33 = +[NSUUID UUID];
    id v34 = [v32 initWithIdentifier:v33 dateInterval:v4 resumeContext:0 quantity:v31];

    [v5 setObject:v34 forKeyedSubscript:&off_64170];
  }
  if ([(HDTreadmillData *)self instantaneousPaceIsSet])
  {
    v35 = +[HKUnit unitFromString:@"km/min"];
    [(HDTreadmillData *)self instantaneousPace];
    v36 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v35);

    id v37 = objc_alloc((Class)HDQuantityDatum);
    v38 = +[NSUUID UUID];
    id v39 = [v37 initWithIdentifier:v38 dateInterval:v4 resumeContext:0 quantity:v36];

    [v5 setObject:v39 forKeyedSubscript:&off_64188];
  }
  if ([(HDTreadmillData *)self averagePaceIsSet])
  {
    v40 = +[HKUnit unitFromString:@"km/min"];
    [(HDTreadmillData *)self averagePace];
    v41 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v40);

    id v42 = objc_alloc((Class)HDQuantityDatum);
    v43 = +[NSUUID UUID];
    id v44 = [v42 initWithIdentifier:v43 dateInterval:v4 resumeContext:0 quantity:v41];

    [v5 setObject:v44 forKeyedSubscript:&off_641A0];
  }
  if ([(HDTreadmillData *)self totalEnergyIsSet])
  {
    v45 = +[HKUnit unitFromString:@"kcal"];
    v46 = +[HKQuantity quantityWithUnit:v45 doubleValue:(double)[(HDTreadmillData *)self totalEnergy]];

    id v47 = objc_alloc((Class)HDQuantityDatum);
    v48 = +[NSUUID UUID];
    id v49 = [v47 initWithIdentifier:v48 dateInterval:v4 resumeContext:0 quantity:v46];

    [v5 setObject:v49 forKeyedSubscript:&off_641B8];
  }
  if ([(HDTreadmillData *)self elapsedTimeIsSet])
  {
    v50 = +[HKUnit unitFromString:@"s"];
    v51 = +[HKQuantity quantityWithUnit:v50 doubleValue:(double)[(HDTreadmillData *)self elapsedTime]];

    id v52 = objc_alloc((Class)HDQuantityDatum);
    v53 = +[NSUUID UUID];
    id v54 = [v52 initWithIdentifier:v53 dateInterval:v4 resumeContext:0 quantity:v51];

    [v5 setObject:v54 forKeyedSubscript:&off_641D0];
  }

  return v5;
}

- (id)allFields
{
  averageSpeedField = self->_averageSpeedField;
  v13[0] = self->_instantaneousSpeedField;
  v13[1] = averageSpeedField;
  inclinationField = self->_inclinationField;
  v13[2] = self->_totalDistanceField;
  v13[3] = inclinationField;
  positiveElevationGainField = self->_positiveElevationGainField;
  v13[4] = self->_rampSettingField;
  v13[5] = positiveElevationGainField;
  instantaneousPaceField = self->_instantaneousPaceField;
  v13[6] = self->_negativeElevationGainField;
  v13[7] = instantaneousPaceField;
  totalEnergyField = self->_totalEnergyField;
  v13[8] = self->_averagePaceField;
  v13[9] = totalEnergyField;
  energyPerMinuteField = self->_energyPerMinuteField;
  v13[10] = self->_energyPerHourField;
  v13[11] = energyPerMinuteField;
  metabolicEquivalentField = self->_metabolicEquivalentField;
  v13[12] = self->_heartRateField;
  v13[13] = metabolicEquivalentField;
  remainingTimeField = self->_remainingTimeField;
  v13[14] = self->_elapsedTimeField;
  v13[15] = remainingTimeField;
  powerOutputField = self->_powerOutputField;
  v13[16] = self->_forceOnBeltField;
  v13[17] = powerOutputField;
  v11 = +[NSArray arrayWithObjects:v13 count:18];

  return v11;
}

+ (id)uuid
{
  return +[CBUUID UUIDWithString:@"0x2ACD"];
}

+ (unsigned)flagFieldLength
{
  return 2;
}

- (id)_init
{
  v40.receiver = self;
  v40.super_class = (Class)HDTreadmillData;
  id v2 = [(HDHealthServiceCharacteristic *)&v40 _init];
  if (v2)
  {
    v3 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicDoubleField alloc] initWithCorrespondingFlagBit:0 fieldLength:2 factor:100];
    id v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    [*((id *)v2 + 2) setFlagFieldFlipped:1];
    id v5 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicDoubleField alloc] initWithCorrespondingFlagBit:1 fieldLength:2 factor:100];
    v6 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v5;

    v7 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt24Field alloc] initWithCorrespondingFlagBit:2 fieldLength:3 factor:1];
    v8 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v7;

    unsigned int v9 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicDoubleField alloc] initWithCorrespondingFlagBit:3 fieldLength:2 factor:10];
    v10 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v9;

    [*((id *)v2 + 5) setIsSigned:1];
    v11 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicDoubleField alloc] initWithCorrespondingFlagBit:3 fieldLength:2 factor:10];
    id v12 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v11;

    [*((id *)v2 + 6) setIsSigned:1];
    v13 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicDoubleField alloc] initWithCorrespondingFlagBit:4 fieldLength:2 factor:10];
    id v14 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v13;

    v15 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicDoubleField alloc] initWithCorrespondingFlagBit:4 fieldLength:2 factor:10];
    v16 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v15;

    id v17 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicDoubleField alloc] initWithCorrespondingFlagBit:5 fieldLength:1 factor:10];
    v18 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v17;

    id v19 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicDoubleField alloc] initWithCorrespondingFlagBit:6 fieldLength:1 factor:10];
    v20 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v19;

    v21 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt16Field alloc] initWithCorrespondingFlagBit:7 fieldLength:2 factor:1];
    id v22 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v21;

    v23 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt16Field alloc] initWithCorrespondingFlagBit:7 fieldLength:2 factor:1];
    id v24 = (void *)*((void *)v2 + 12);
    *((void *)v2 + 12) = v23;

    v25 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt8Field alloc] initWithCorrespondingFlagBit:7 fieldLength:1 factor:1];
    v26 = (void *)*((void *)v2 + 13);
    *((void *)v2 + 13) = v25;

    id v27 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt8Field alloc] initWithCorrespondingFlagBit:8 fieldLength:1 factor:1];
    v28 = (void *)*((void *)v2 + 14);
    *((void *)v2 + 14) = v27;

    id v29 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt8Field alloc] initWithCorrespondingFlagBit:9 fieldLength:1 factor:1];
    v30 = (void *)*((void *)v2 + 15);
    *((void *)v2 + 15) = v29;

    v31 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt16Field alloc] initWithCorrespondingFlagBit:10 fieldLength:2 factor:1];
    id v32 = (void *)*((void *)v2 + 16);
    *((void *)v2 + 16) = v31;

    v33 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt16Field alloc] initWithCorrespondingFlagBit:11 fieldLength:2 factor:1];
    id v34 = (void *)*((void *)v2 + 17);
    *((void *)v2 + 17) = v33;

    v35 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt16Field alloc] initWithCorrespondingFlagBit:12 fieldLength:2 factor:1];
    v36 = (void *)*((void *)v2 + 18);
    *((void *)v2 + 18) = v35;

    id v37 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt16Field alloc] initWithCorrespondingFlagBit:12 fieldLength:2 factor:1];
    v38 = (void *)*((void *)v2 + 19);
    *((void *)v2 + 19) = v37;
  }
  return v2;
}

- (id)description
{
  unsigned int v26 = [(HDFitnessMachineCharacteristicField *)self->_instantaneousSpeedField isSet];
  if (v26)
  {
    [(HDFitnessMachineCharacteristicDoubleField *)self->_instantaneousSpeedField value];
    +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = @"(null)";
  }
  unsigned int v25 = [(HDFitnessMachineCharacteristicField *)self->_averageSpeedField isSet];
  if (v25)
  {
    [(HDFitnessMachineCharacteristicDoubleField *)self->_averageSpeedField value];
    +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    id v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v39 = @"(null)";
  }
  unsigned int v24 = [(HDFitnessMachineCharacteristicField *)self->_totalDistanceField isSet];
  if (v24)
  {
    v38 = +[NSNumber numberWithUnsignedInt:[(HDFitnessMachineCharacteristicUInt24Field *)self->_totalDistanceField value]];
  }
  else
  {
    v38 = @"(null)";
  }
  unsigned int v23 = [(HDFitnessMachineCharacteristicField *)self->_inclinationField isSet];
  if (v23)
  {
    [(HDFitnessMachineCharacteristicDoubleField *)self->_inclinationField value];
    +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    id v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v37 = @"(null)";
  }
  unsigned int v22 = [(HDFitnessMachineCharacteristicField *)self->_rampSettingField isSet];
  if (v22)
  {
    [(HDFitnessMachineCharacteristicDoubleField *)self->_rampSettingField value];
    +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = @"(null)";
  }
  unsigned int v21 = [(HDFitnessMachineCharacteristicField *)self->_positiveElevationGainField isSet];
  if (v21)
  {
    [(HDFitnessMachineCharacteristicDoubleField *)self->_positiveElevationGainField value];
    +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = @"(null)";
  }
  unsigned int v20 = [(HDFitnessMachineCharacteristicField *)self->_negativeElevationGainField isSet];
  if (v20)
  {
    [(HDFitnessMachineCharacteristicDoubleField *)self->_negativeElevationGainField value];
    +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = @"(null)";
  }
  unsigned int v19 = [(HDFitnessMachineCharacteristicField *)self->_instantaneousPaceField isSet];
  if (v19)
  {
    [(HDFitnessMachineCharacteristicDoubleField *)self->_instantaneousPaceField value];
    +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    id v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v34 = @"(null)";
  }
  unsigned int v18 = [(HDFitnessMachineCharacteristicField *)self->_averagePaceField isSet];
  if (v18)
  {
    [(HDFitnessMachineCharacteristicDoubleField *)self->_averagePaceField value];
    +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = @"(null)";
  }
  unsigned int v17 = [(HDFitnessMachineCharacteristicField *)self->_totalEnergyField isSet];
  if (v17)
  {
    id v32 = +[NSNumber numberWithUnsignedShort:[(HDFitnessMachineCharacteristicUInt16Field *)self->_totalEnergyField value]];
  }
  else
  {
    id v32 = @"(null)";
  }
  unsigned int v16 = [(HDFitnessMachineCharacteristicField *)self->_energyPerHourField isSet];
  if (v16)
  {
    v31 = +[NSNumber numberWithUnsignedShort:[(HDFitnessMachineCharacteristicUInt16Field *)self->_energyPerHourField value]];
  }
  else
  {
    v31 = @"(null)";
  }
  unsigned int v15 = [(HDFitnessMachineCharacteristicField *)self->_energyPerMinuteField isSet];
  if (v15)
  {
    v30 = +[NSNumber numberWithUnsignedChar:[(HDFitnessMachineCharacteristicUInt8Field *)self->_energyPerMinuteField value]];
  }
  else
  {
    v30 = @"(null)";
  }
  unsigned int v14 = [(HDFitnessMachineCharacteristicField *)self->_heartRateField isSet];
  if (v14)
  {
    id v29 = +[NSNumber numberWithUnsignedChar:[(HDFitnessMachineCharacteristicUInt8Field *)self->_heartRateField value]];
  }
  else
  {
    id v29 = @"(null)";
  }
  unsigned int v13 = [(HDFitnessMachineCharacteristicField *)self->_metabolicEquivalentField isSet];
  if (v13)
  {
    v28 = +[NSNumber numberWithUnsignedChar:[(HDFitnessMachineCharacteristicUInt8Field *)self->_metabolicEquivalentField value]];
  }
  else
  {
    v28 = @"(null)";
  }
  unsigned int v12 = [(HDFitnessMachineCharacteristicField *)self->_elapsedTimeField isSet];
  if (v12)
  {
    id v27 = +[NSNumber numberWithUnsignedShort:[(HDFitnessMachineCharacteristicUInt16Field *)self->_elapsedTimeField value]];
  }
  else
  {
    id v27 = @"(null)";
  }
  unsigned int v5 = [(HDFitnessMachineCharacteristicField *)self->_remainingTimeField isSet];
  if (v5)
  {
    v6 = +[NSNumber numberWithUnsignedShort:[(HDFitnessMachineCharacteristicUInt16Field *)self->_remainingTimeField value]];
  }
  else
  {
    v6 = @"(null)";
  }
  unsigned int v7 = [(HDFitnessMachineCharacteristicField *)self->_forceOnBeltField isSet];
  if (v7)
  {
    v8 = +[NSNumber numberWithUnsignedShort:[(HDFitnessMachineCharacteristicUInt16Field *)self->_forceOnBeltField value]];
  }
  else
  {
    v8 = @"(null)";
  }
  if (![(HDFitnessMachineCharacteristicField *)self->_powerOutputField isSet])
  {
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Treadmill Data: instantaneousSpeed = %@, averageSpeed = %@, totalDistance = %@, inclination = %@, rampSetting = %@, positiveElevationGain = %@, negativeElevationGain = %@, instantaneousPace = %@, averagePace = %@, totalEnergy = %@, energyPerHour = %@, energyPerMinute = %@, heartRate = %@, metabolicEquivalent = %@, elapsedTime = %@, remainingTime = %@, forceOnBelt = %@, powerOutput = %@", v3, v39, v38, v37, v36, v4, v35, v34, v33, v32, v31, v30, v29, v28, v27, v6,
      v8,
    v10 = @"(null)");
    if (!v7) {
      goto LABEL_57;
    }
    goto LABEL_56;
  }
  unsigned int v9 = +[NSNumber numberWithUnsignedShort:[(HDFitnessMachineCharacteristicUInt16Field *)self->_powerOutputField value]];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Treadmill Data: instantaneousSpeed = %@, averageSpeed = %@, totalDistance = %@, inclination = %@, rampSetting = %@, positiveElevationGain = %@, negativeElevationGain = %@, instantaneousPace = %@, averagePace = %@, totalEnergy = %@, energyPerHour = %@, energyPerMinute = %@, heartRate = %@, metabolicEquivalent = %@, elapsedTime = %@, remainingTime = %@, forceOnBelt = %@, powerOutput = %@", v3, v39, v38, v37, v36, v4, v35, v34, v33, v32, v31, v30, v29, v28, v27, v6,
    v8,
  v10 = v9);

  if (v7) {
LABEL_56:
  }

LABEL_57:
  if (v5) {

  }
  if (v12) {
  if (v13)
  }

  if (v14) {
  if (v15)
  }

  if (v16) {
  if (v17)
  }

  if (v18) {
  if (v19)
  }

  if (v20) {
  if (v21)
  }

  if (v22) {
  if (v23)
  }

  if (v24) {
  if (v25)
  }

  if (v26) {

  }
  return v10;
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

- (BOOL)totalDistanceIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_totalDistanceField isSet];
}

- (unsigned)totalDistance
{
  return [(HDFitnessMachineCharacteristicUInt24Field *)self->_totalDistanceField value];
}

- (BOOL)inclinationIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_inclinationField isSet];
}

- (double)inclination
{
  [(HDFitnessMachineCharacteristicDoubleField *)self->_inclinationField value];
  return result;
}

- (BOOL)rampSettingIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_rampSettingField isSet];
}

- (double)rampSetting
{
  [(HDFitnessMachineCharacteristicDoubleField *)self->_rampSettingField value];
  return result;
}

- (BOOL)positiveElevationGainIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_positiveElevationGainField isSet];
}

- (double)positiveElevationGain
{
  [(HDFitnessMachineCharacteristicDoubleField *)self->_positiveElevationGainField value];
  return result;
}

- (BOOL)negativeElevationGainIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_negativeElevationGainField isSet];
}

- (double)negativeElevationGain
{
  [(HDFitnessMachineCharacteristicDoubleField *)self->_negativeElevationGainField value];
  return result;
}

- (BOOL)instantaneousPaceIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_instantaneousPaceField isSet];
}

- (double)instantaneousPace
{
  [(HDFitnessMachineCharacteristicDoubleField *)self->_instantaneousPaceField value];
  return result;
}

- (BOOL)averagePaceIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_averagePaceField isSet];
}

- (double)averagePace
{
  [(HDFitnessMachineCharacteristicDoubleField *)self->_averagePaceField value];
  return result;
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

- (BOOL)forceOnBeltIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_forceOnBeltField isSet];
}

- (unsigned)forceOnBelt
{
  return [(HDFitnessMachineCharacteristicUInt16Field *)self->_forceOnBeltField value];
}

- (BOOL)powerOutputIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_powerOutputField isSet];
}

- (unsigned)powerOutput
{
  return [(HDFitnessMachineCharacteristicUInt16Field *)self->_powerOutputField value];
}

+ (id)unitTest_fakeTreadmillDataForDistance:(unsigned int)a3 energy:(unsigned __int16)a4 elapsedTime:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  uint64_t v7 = *(void *)&a3;
  v8 = [[HDTreadmillData alloc] _init];
  [v8[4] setValue:v7];
  [v8[4] setIsSet:1];
  [v8[11] setValue:v6];
  [v8[11] setIsSet:1];
  [v8[16] setValue:v5];
  [v8[16] setIsSet:1];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerOutputField, 0);
  objc_storeStrong((id *)&self->_forceOnBeltField, 0);
  objc_storeStrong((id *)&self->_remainingTimeField, 0);
  objc_storeStrong((id *)&self->_elapsedTimeField, 0);
  objc_storeStrong((id *)&self->_metabolicEquivalentField, 0);
  objc_storeStrong((id *)&self->_heartRateField, 0);
  objc_storeStrong((id *)&self->_energyPerMinuteField, 0);
  objc_storeStrong((id *)&self->_energyPerHourField, 0);
  objc_storeStrong((id *)&self->_totalEnergyField, 0);
  objc_storeStrong((id *)&self->_averagePaceField, 0);
  objc_storeStrong((id *)&self->_instantaneousPaceField, 0);
  objc_storeStrong((id *)&self->_negativeElevationGainField, 0);
  objc_storeStrong((id *)&self->_positiveElevationGainField, 0);
  objc_storeStrong((id *)&self->_rampSettingField, 0);
  objc_storeStrong((id *)&self->_inclinationField, 0);
  objc_storeStrong((id *)&self->_totalDistanceField, 0);
  objc_storeStrong((id *)&self->_averageSpeedField, 0);

  objc_storeStrong((id *)&self->_instantaneousSpeedField, 0);
}

@end