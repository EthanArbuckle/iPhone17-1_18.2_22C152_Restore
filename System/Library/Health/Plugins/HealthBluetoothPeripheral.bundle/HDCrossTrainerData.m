@interface HDCrossTrainerData
+ (id)uuid;
+ (unsigned)flagFieldLength;
- (BOOL)averagePowerIsSet;
- (BOOL)averageSpeedIsSet;
- (BOOL)averageStepRateIsSet;
- (BOOL)elapsedTimeIsSet;
- (BOOL)energyPerHourIsSet;
- (BOOL)energyPerMinuteIsSet;
- (BOOL)heartRateIsSet;
- (BOOL)inclinationIsSet;
- (BOOL)instantaneousPowerIsSet;
- (BOOL)instantaneousSpeedIsSet;
- (BOOL)metabolicEquivalentIsSet;
- (BOOL)negativeElevationGainIsSet;
- (BOOL)positiveElevationGainIsSet;
- (BOOL)rampSettingIsSet;
- (BOOL)remainingTimeIsSet;
- (BOOL)resistanceLevelIsSet;
- (BOOL)stepPerMinuteIsSet;
- (BOOL)strideCountIsSet;
- (BOOL)totalDistanceIsSet;
- (BOOL)totalEnergyIsSet;
- (double)averageSpeed;
- (double)inclination;
- (double)instantaneousSpeed;
- (double)rampSetting;
- (double)resistanceLevel;
- (double)strideCount;
- (id)_init;
- (id)allFields;
- (id)description;
- (id)generateDatums:(id)a3;
- (signed)averagePower;
- (signed)instantaneousPower;
- (unsigned)averageStepRate;
- (unsigned)elapsedTime;
- (unsigned)energyPerHour;
- (unsigned)energyPerMinute;
- (unsigned)heartRate;
- (unsigned)metabolicEquivalent;
- (unsigned)negativeElevationGain;
- (unsigned)positiveElevationGain;
- (unsigned)remainingTime;
- (unsigned)stepPerMinute;
- (unsigned)totalDistance;
- (unsigned)totalEnergy;
@end

@implementation HDCrossTrainerData

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
    if ([(HDCrossTrainerData *)self instantaneousSpeedIsSet])
    {
      v10 = +[HKUnit unitFromString:@"km/hr"];
      [(HDCrossTrainerData *)self instantaneousSpeed];
      v11 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v10);

      id v12 = objc_alloc((Class)HDQuantityDatum);
      v13 = +[NSUUID UUID];
      id v14 = [v12 initWithIdentifier:v13 dateInterval:v4 resumeContext:0 quantity:v11];

      [v5 setObject:v14 forKeyedSubscript:&off_63E70];
    }
    if ([(HDCrossTrainerData *)self averageSpeedIsSet])
    {
      v15 = +[HKUnit unitFromString:@"km/hr"];
      [(HDCrossTrainerData *)self averageSpeed];
      v16 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v15);

      id v17 = objc_alloc((Class)HDQuantityDatum);
      v18 = +[NSUUID UUID];
      id v19 = [v17 initWithIdentifier:v18 dateInterval:v4 resumeContext:0 quantity:v16];

      [v5 setObject:v19 forKeyedSubscript:&off_63E88];
    }
  }
  if ([(HDCrossTrainerData *)self totalDistanceIsSet])
  {
    v20 = +[HKUnit unitFromString:@"m"];
    v21 = +[HKQuantity quantityWithUnit:v20 doubleValue:(double)[(HDCrossTrainerData *)self totalDistance]];

    id v22 = objc_alloc((Class)HDQuantityDatum);
    v23 = +[NSUUID UUID];
    id v24 = [v22 initWithIdentifier:v23 dateInterval:v4 resumeContext:0 quantity:v21];

    [v5 setObject:v24 forKeyedSubscript:&off_63EA0];
  }
  if ([(HDCrossTrainerData *)self strideCountIsSet])
  {
    v25 = +[HKUnit unitFromString:@"count"];
    [(HDCrossTrainerData *)self strideCount];
    v26 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v25);

    id v27 = objc_alloc((Class)HDQuantityDatum);
    v28 = +[NSUUID UUID];
    id v29 = [v27 initWithIdentifier:v28 dateInterval:v4 resumeContext:0 quantity:v26];

    [v5 setObject:v29 forKeyedSubscript:&off_63EB8];
  }
  if ([(HDCrossTrainerData *)self positiveElevationGainIsSet])
  {
    v30 = +[HKUnit unitFromString:@"m"];
    v31 = +[HKQuantity quantityWithUnit:v30 doubleValue:(double)[(HDCrossTrainerData *)self positiveElevationGain]];

    id v32 = objc_alloc((Class)HDQuantityDatum);
    v33 = +[NSUUID UUID];
    id v34 = [v32 initWithIdentifier:v33 dateInterval:v4 resumeContext:0 quantity:v31];

    [v5 setObject:v34 forKeyedSubscript:&off_63ED0];
  }
  if ([(HDCrossTrainerData *)self inclinationIsSet])
  {
    v35 = +[HKUnit unitFromString:@"%"];
    [(HDCrossTrainerData *)self inclination];
    v36 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v35);

    id v37 = objc_alloc((Class)HDQuantityDatum);
    v38 = +[NSUUID UUID];
    id v39 = [v37 initWithIdentifier:v38 dateInterval:v4 resumeContext:0 quantity:v36];

    [v5 setObject:v39 forKeyedSubscript:&off_63EE8];
  }
  if ([(HDCrossTrainerData *)self resistanceLevelIsSet])
  {
    v40 = +[HKUnit unitFromString:@"count"];
    [(HDCrossTrainerData *)self resistanceLevel];
    v41 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v40);

    id v42 = objc_alloc((Class)HDQuantityDatum);
    v43 = +[NSUUID UUID];
    id v44 = [v42 initWithIdentifier:v43 dateInterval:v4 resumeContext:0 quantity:v41];

    [v5 setObject:v44 forKeyedSubscript:&off_63F00];
  }
  if ([(HDCrossTrainerData *)self instantaneousPowerIsSet])
  {
    v45 = +[HKUnit wattUnit];
    v46 = +[HKQuantity quantityWithUnit:v45 doubleValue:(double)[(HDCrossTrainerData *)self instantaneousPower]];

    id v47 = objc_alloc((Class)HDQuantityDatum);
    v48 = +[NSUUID UUID];
    id v49 = [v47 initWithIdentifier:v48 dateInterval:v4 resumeContext:0 quantity:v46];

    [v5 setObject:v49 forKeyedSubscript:&off_63F18];
  }
  if ([(HDCrossTrainerData *)self averagePowerIsSet])
  {
    v50 = +[HKUnit wattUnit];
    v51 = +[HKQuantity quantityWithUnit:v50 doubleValue:(double)[(HDCrossTrainerData *)self averagePower]];

    id v52 = objc_alloc((Class)HDQuantityDatum);
    v53 = +[NSUUID UUID];
    id v54 = [v52 initWithIdentifier:v53 dateInterval:v4 resumeContext:0 quantity:v51];

    [v5 setObject:v54 forKeyedSubscript:&off_63F30];
  }
  if ([(HDCrossTrainerData *)self totalEnergyIsSet])
  {
    v55 = +[HKUnit unitFromString:@"kcal"];
    v56 = +[HKQuantity quantityWithUnit:v55 doubleValue:(double)[(HDCrossTrainerData *)self totalEnergy]];

    id v57 = objc_alloc((Class)HDQuantityDatum);
    v58 = +[NSUUID UUID];
    id v59 = [v57 initWithIdentifier:v58 dateInterval:v4 resumeContext:0 quantity:v56];

    [v5 setObject:v59 forKeyedSubscript:&off_63F48];
  }
  if ([(HDCrossTrainerData *)self elapsedTimeIsSet])
  {
    v60 = +[HKUnit unitFromString:@"s"];
    v61 = +[HKQuantity quantityWithUnit:v60 doubleValue:(double)[(HDCrossTrainerData *)self elapsedTime]];

    id v62 = objc_alloc((Class)HDQuantityDatum);
    v63 = +[NSUUID UUID];
    id v64 = [v62 initWithIdentifier:v63 dateInterval:v4 resumeContext:0 quantity:v61];

    [v5 setObject:v64 forKeyedSubscript:&off_63F60];
  }

  return v5;
}

- (id)allFields
{
  averageSpeedField = self->_averageSpeedField;
  v14[0] = self->_instantaneousSpeedField;
  v14[1] = averageSpeedField;
  stepPerMinuteField = self->_stepPerMinuteField;
  v14[2] = self->_totalDistanceField;
  v14[3] = stepPerMinuteField;
  strideCountField = self->_strideCountField;
  v14[4] = self->_averageStepRateField;
  v14[5] = strideCountField;
  negativeElevationGainField = self->_negativeElevationGainField;
  v14[6] = self->_positiveElevationGainField;
  v14[7] = negativeElevationGainField;
  rampSettingField = self->_rampSettingField;
  v14[8] = self->_inclinationField;
  v14[9] = rampSettingField;
  instantaneousPowerField = self->_instantaneousPowerField;
  v14[10] = self->_resistanceLevelField;
  v14[11] = instantaneousPowerField;
  totalEnergyField = self->_totalEnergyField;
  v14[12] = self->_averagePowerField;
  v14[13] = totalEnergyField;
  energyPerMinuteField = self->_energyPerMinuteField;
  v14[14] = self->_energyPerHourField;
  v14[15] = energyPerMinuteField;
  metabolicEquivalentField = self->_metabolicEquivalentField;
  v14[16] = self->_heartRateField;
  v14[17] = metabolicEquivalentField;
  remainingTimeField = self->_remainingTimeField;
  v14[18] = self->_elapsedTimeField;
  v14[19] = remainingTimeField;
  id v12 = +[NSArray arrayWithObjects:v14 count:20];

  return v12;
}

+ (id)uuid
{
  return +[CBUUID UUIDWithString:@"0x2ACE"];
}

+ (unsigned)flagFieldLength
{
  return 3;
}

- (id)_init
{
  v44.receiver = self;
  v44.super_class = (Class)HDCrossTrainerData;
  id v2 = [(HDHealthServiceCharacteristic *)&v44 _init];
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

    unsigned int v9 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt16Field alloc] initWithCorrespondingFlagBit:3 fieldLength:2 factor:1];
    v10 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v9;

    v11 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt16Field alloc] initWithCorrespondingFlagBit:3 fieldLength:2 factor:1];
    id v12 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v11;

    v13 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicDoubleField alloc] initWithCorrespondingFlagBit:4 fieldLength:2 factor:10];
    id v14 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v13;

    v15 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt16Field alloc] initWithCorrespondingFlagBit:5 fieldLength:2 factor:1];
    v16 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v15;

    id v17 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt16Field alloc] initWithCorrespondingFlagBit:5 fieldLength:2 factor:1];
    v18 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v17;

    id v19 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicDoubleField alloc] initWithCorrespondingFlagBit:6 fieldLength:2 factor:10];
    v20 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v19;

    [*((id *)v2 + 10) setIsSigned:1];
    v21 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicDoubleField alloc] initWithCorrespondingFlagBit:6 fieldLength:2 factor:10];
    id v22 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v21;

    [*((id *)v2 + 11) setIsSigned:1];
    v23 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicDoubleField alloc] initWithCorrespondingFlagBit:7 fieldLength:2 factor:10];
    id v24 = (void *)*((void *)v2 + 12);
    *((void *)v2 + 12) = v23;

    [*((id *)v2 + 12) setIsSigned:1];
    v25 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicInt16Field alloc] initWithCorrespondingFlagBit:8 fieldLength:2 factor:1];
    v26 = (void *)*((void *)v2 + 13);
    *((void *)v2 + 13) = v25;

    id v27 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicInt16Field alloc] initWithCorrespondingFlagBit:9 fieldLength:2 factor:1];
    v28 = (void *)*((void *)v2 + 14);
    *((void *)v2 + 14) = v27;

    id v29 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt16Field alloc] initWithCorrespondingFlagBit:10 fieldLength:2 factor:1];
    v30 = (void *)*((void *)v2 + 15);
    *((void *)v2 + 15) = v29;

    v31 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt16Field alloc] initWithCorrespondingFlagBit:10 fieldLength:2 factor:1];
    id v32 = (void *)*((void *)v2 + 16);
    *((void *)v2 + 16) = v31;

    v33 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt8Field alloc] initWithCorrespondingFlagBit:10 fieldLength:1 factor:1];
    id v34 = (void *)*((void *)v2 + 17);
    *((void *)v2 + 17) = v33;

    v35 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt8Field alloc] initWithCorrespondingFlagBit:11 fieldLength:1 factor:1];
    v36 = (void *)*((void *)v2 + 18);
    *((void *)v2 + 18) = v35;

    id v37 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt8Field alloc] initWithCorrespondingFlagBit:12 fieldLength:1 factor:1];
    v38 = (void *)*((void *)v2 + 19);
    *((void *)v2 + 19) = v37;

    id v39 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt16Field alloc] initWithCorrespondingFlagBit:13 fieldLength:2 factor:1];
    v40 = (void *)*((void *)v2 + 20);
    *((void *)v2 + 20) = v39;

    v41 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt16Field alloc] initWithCorrespondingFlagBit:14 fieldLength:2 factor:1];
    id v42 = (void *)*((void *)v2 + 21);
    *((void *)v2 + 21) = v41;
  }
  return v2;
}

- (id)description
{
  unsigned int v29 = [(HDFitnessMachineCharacteristicField *)self->_instantaneousSpeedField isSet];
  if (v29)
  {
    [(HDFitnessMachineCharacteristicDoubleField *)self->_instantaneousSpeedField value];
    +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = @"(null)";
  }
  unsigned int v28 = [(HDFitnessMachineCharacteristicField *)self->_averageSpeedField isSet];
  if (v28)
  {
    [(HDFitnessMachineCharacteristicDoubleField *)self->_averageSpeedField value];
    +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    objc_super v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v44 = @"(null)";
  }
  unsigned int v27 = [(HDFitnessMachineCharacteristicField *)self->_totalDistanceField isSet];
  if (v27)
  {
    v43 = +[NSNumber numberWithUnsignedInt:[(HDFitnessMachineCharacteristicUInt24Field *)self->_totalDistanceField value]];
  }
  else
  {
    v43 = @"(null)";
  }
  unsigned int v26 = [(HDFitnessMachineCharacteristicField *)self->_stepPerMinuteField isSet];
  if (v26)
  {
    id v42 = +[NSNumber numberWithUnsignedShort:[(HDFitnessMachineCharacteristicUInt16Field *)self->_stepPerMinuteField value]];
  }
  else
  {
    id v42 = @"(null)";
  }
  unsigned int v25 = [(HDFitnessMachineCharacteristicField *)self->_averageStepRateField isSet];
  if (v25)
  {
    v41 = +[NSNumber numberWithUnsignedShort:[(HDFitnessMachineCharacteristicUInt16Field *)self->_averageStepRateField value]];
  }
  else
  {
    v41 = @"(null)";
  }
  unsigned int v24 = [(HDFitnessMachineCharacteristicField *)self->_strideCountField isSet];
  if (v24)
  {
    [(HDFitnessMachineCharacteristicDoubleField *)self->_strideCountField value];
    +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v40 = @"(null)";
  }
  unsigned int v23 = [(HDFitnessMachineCharacteristicField *)self->_positiveElevationGainField isSet];
  if (v23)
  {
    CFStringRef v22 = +[NSNumber numberWithUnsignedShort:[(HDFitnessMachineCharacteristicUInt16Field *)self->_positiveElevationGainField value]];
  }
  else
  {
    CFStringRef v22 = @"(null)";
  }
  unsigned int v21 = [(HDFitnessMachineCharacteristicField *)self->_negativeElevationGainField isSet];
  if (v21)
  {
    id v39 = +[NSNumber numberWithUnsignedShort:[(HDFitnessMachineCharacteristicUInt16Field *)self->_negativeElevationGainField value]];
  }
  else
  {
    id v39 = @"(null)";
  }
  unsigned int v20 = [(HDFitnessMachineCharacteristicField *)self->_inclinationField isSet];
  if (v20)
  {
    [(HDFitnessMachineCharacteristicDoubleField *)self->_inclinationField value];
    +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v38 = @"(null)";
  }
  unsigned int v19 = [(HDFitnessMachineCharacteristicField *)self->_rampSettingField isSet];
  if (v19)
  {
    [(HDFitnessMachineCharacteristicDoubleField *)self->_rampSettingField value];
    +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    id v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v37 = @"(null)";
  }
  unsigned int v18 = [(HDFitnessMachineCharacteristicField *)self->_resistanceLevelField isSet];
  if (v18)
  {
    [(HDFitnessMachineCharacteristicDoubleField *)self->_resistanceLevelField value];
    +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = @"(null)";
  }
  unsigned int v17 = [(HDFitnessMachineCharacteristicField *)self->_instantaneousPowerField isSet];
  if (v17)
  {
    v35 = +[NSNumber numberWithShort:[(HDFitnessMachineCharacteristicInt16Field *)self->_instantaneousPowerField value]];
  }
  else
  {
    v35 = @"(null)";
  }
  unsigned int v16 = [(HDFitnessMachineCharacteristicField *)self->_averagePowerField isSet];
  if (v16)
  {
    id v34 = +[NSNumber numberWithShort:[(HDFitnessMachineCharacteristicInt16Field *)self->_averagePowerField value]];
  }
  else
  {
    id v34 = @"(null)";
  }
  unsigned int v15 = [(HDFitnessMachineCharacteristicField *)self->_totalEnergyField isSet];
  if (v15)
  {
    v33 = +[NSNumber numberWithUnsignedShort:[(HDFitnessMachineCharacteristicUInt16Field *)self->_totalEnergyField value]];
  }
  else
  {
    v33 = @"(null)";
  }
  unsigned int v14 = [(HDFitnessMachineCharacteristicField *)self->_energyPerHourField isSet];
  if (v14)
  {
    id v32 = +[NSNumber numberWithUnsignedShort:[(HDFitnessMachineCharacteristicUInt16Field *)self->_energyPerHourField value]];
  }
  else
  {
    id v32 = @"(null)";
  }
  unsigned int v13 = [(HDFitnessMachineCharacteristicField *)self->_energyPerMinuteField isSet];
  if (v13)
  {
    v31 = +[NSNumber numberWithUnsignedChar:[(HDFitnessMachineCharacteristicUInt8Field *)self->_energyPerMinuteField value]];
  }
  else
  {
    v31 = @"(null)";
  }
  unsigned int v4 = [(HDFitnessMachineCharacteristicField *)self->_heartRateField isSet];
  if (v4)
  {
    v30 = +[NSNumber numberWithUnsignedChar:[(HDFitnessMachineCharacteristicUInt8Field *)self->_heartRateField value]];
  }
  else
  {
    v30 = @"(null)";
  }
  unsigned int v5 = [(HDFitnessMachineCharacteristicField *)self->_metabolicEquivalentField isSet];
  if (v5)
  {
    v6 = +[NSNumber numberWithUnsignedChar:[(HDFitnessMachineCharacteristicUInt8Field *)self->_metabolicEquivalentField value]];
  }
  else
  {
    v6 = @"(null)";
  }
  unsigned int v7 = [(HDFitnessMachineCharacteristicField *)self->_elapsedTimeField isSet];
  if (v7)
  {
    v8 = +[NSNumber numberWithUnsignedShort:[(HDFitnessMachineCharacteristicUInt16Field *)self->_elapsedTimeField value]];
  }
  else
  {
    v8 = @"(null)";
  }
  if (![(HDFitnessMachineCharacteristicField *)self->_remainingTimeField isSet])
  {
    v10 = (__CFString *)v22;
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Cross Trainer Data: instantaneousSpeed = %@, averageSpeed = %@, totalDistance = %@, stepPerMinute = %@, averageStepRate = %@, strideCount = %@, positiveElevationGain = %@, negativeElevationGain = %@, inclination = %@, rampSetting = %@, resistanceLevel = %@, instantaneousPower = %@, averagePower = %@, totalEnergy = %@, energyPerHour = %@, energyPerMinute = %@, heartRate = %@, metabolicEquivalent = %@, elapsedTime = %@, remainingTime = %@", v3, v44, v43, v42, v41, v40, v22, v39, v38, v37, v36, v35, v34, v33, v32, v31,
      v30,
      v6,
      v8,
    v11 = @"(null)");
    if (!v7) {
      goto LABEL_63;
    }
    goto LABEL_62;
  }
  unsigned int v9 = +[NSNumber numberWithUnsignedShort:[(HDFitnessMachineCharacteristicUInt16Field *)self->_remainingTimeField value]];
  v10 = (__CFString *)v22;
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Cross Trainer Data: instantaneousSpeed = %@, averageSpeed = %@, totalDistance = %@, stepPerMinute = %@, averageStepRate = %@, strideCount = %@, positiveElevationGain = %@, negativeElevationGain = %@, inclination = %@, rampSetting = %@, resistanceLevel = %@, instantaneousPower = %@, averagePower = %@, totalEnergy = %@, energyPerHour = %@, energyPerMinute = %@, heartRate = %@, metabolicEquivalent = %@, elapsedTime = %@, remainingTime = %@", v3, v44, v43, v42, v41, v40, v22, v39, v38, v37, v36, v35, v34, v33, v32, v31,
    v30,
    v6,
    v8,
  v11 = v9);

  if (v7) {
LABEL_62:
  }

LABEL_63:
  if (!v5)
  {
    if (!v4) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }

  if (v4) {
LABEL_65:
  }

LABEL_66:
  if (v13) {

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

  if (v23) {
  if (v24)
  }

  if (v25) {
  if (v26)
  }

  if (v27) {
  if (v28)
  }

  if (v29) {

  }
  return v11;
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

- (BOOL)stepPerMinuteIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_stepPerMinuteField isSet];
}

- (unsigned)stepPerMinute
{
  return [(HDFitnessMachineCharacteristicUInt16Field *)self->_stepPerMinuteField value];
}

- (BOOL)averageStepRateIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_averageStepRateField isSet];
}

- (unsigned)averageStepRate
{
  return [(HDFitnessMachineCharacteristicUInt16Field *)self->_averageStepRateField value];
}

- (BOOL)strideCountIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_strideCountField isSet];
}

- (double)strideCount
{
  [(HDFitnessMachineCharacteristicDoubleField *)self->_strideCountField value];
  return result;
}

- (BOOL)positiveElevationGainIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_positiveElevationGainField isSet];
}

- (unsigned)positiveElevationGain
{
  return [(HDFitnessMachineCharacteristicUInt16Field *)self->_positiveElevationGainField value];
}

- (BOOL)negativeElevationGainIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_negativeElevationGainField isSet];
}

- (unsigned)negativeElevationGain
{
  return [(HDFitnessMachineCharacteristicUInt16Field *)self->_negativeElevationGainField value];
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

- (BOOL)resistanceLevelIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_resistanceLevelField isSet];
}

- (double)resistanceLevel
{
  [(HDFitnessMachineCharacteristicDoubleField *)self->_resistanceLevelField value];
  return result;
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
  objc_storeStrong((id *)&self->_rampSettingField, 0);
  objc_storeStrong((id *)&self->_inclinationField, 0);
  objc_storeStrong((id *)&self->_negativeElevationGainField, 0);
  objc_storeStrong((id *)&self->_positiveElevationGainField, 0);
  objc_storeStrong((id *)&self->_strideCountField, 0);
  objc_storeStrong((id *)&self->_averageStepRateField, 0);
  objc_storeStrong((id *)&self->_stepPerMinuteField, 0);
  objc_storeStrong((id *)&self->_totalDistanceField, 0);
  objc_storeStrong((id *)&self->_averageSpeedField, 0);

  objc_storeStrong((id *)&self->_instantaneousSpeedField, 0);
}

@end