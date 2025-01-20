@interface HDStairClimberData
+ (id)uuid;
+ (unsigned)flagFieldLength;
- (BOOL)averageStepRateIsSet;
- (BOOL)elapsedTimeIsSet;
- (BOOL)energyPerHourIsSet;
- (BOOL)energyPerMinuteIsSet;
- (BOOL)floorsIsSet;
- (BOOL)heartRateIsSet;
- (BOOL)metabolicEquivalentIsSet;
- (BOOL)positiveElevationGainIsSet;
- (BOOL)remainingTimeIsSet;
- (BOOL)stepCountIsSet;
- (BOOL)stepsPerMinuteIsSet;
- (BOOL)totalEnergyIsSet;
- (id)_init;
- (id)allFields;
- (id)description;
- (id)generateDatums:(id)a3;
- (unsigned)averageStepRate;
- (unsigned)elapsedTime;
- (unsigned)energyPerHour;
- (unsigned)energyPerMinute;
- (unsigned)floors;
- (unsigned)heartRate;
- (unsigned)metabolicEquivalent;
- (unsigned)positiveElevationGain;
- (unsigned)remainingTime;
- (unsigned)stepCount;
- (unsigned)stepsPerMinute;
- (unsigned)totalEnergy;
@end

@implementation HDStairClimberData

- (id)allFields
{
  stepsPerMinuteField = self->_stepsPerMinuteField;
  v10[0] = self->_floorsField;
  v10[1] = stepsPerMinuteField;
  positiveElevationGainField = self->_positiveElevationGainField;
  v10[2] = self->_averageStepRateField;
  v10[3] = positiveElevationGainField;
  totalEnergyField = self->_totalEnergyField;
  v10[4] = self->_stepCountField;
  v10[5] = totalEnergyField;
  energyPerMinuteField = self->_energyPerMinuteField;
  v10[6] = self->_energyPerHourField;
  v10[7] = energyPerMinuteField;
  metabolicEquivalentField = self->_metabolicEquivalentField;
  v10[8] = self->_heartRateField;
  v10[9] = metabolicEquivalentField;
  remainingTimeField = self->_remainingTimeField;
  v10[10] = self->_elapsedTimeField;
  v10[11] = remainingTimeField;
  v8 = +[NSArray arrayWithObjects:v10 count:12];

  return v8;
}

+ (id)uuid
{
  return +[CBUUID UUIDWithString:@"0x2AD0"];
}

+ (unsigned)flagFieldLength
{
  return 2;
}

- (id)_init
{
  v28.receiver = self;
  v28.super_class = (Class)HDStairClimberData;
  id v2 = [(HDHealthServiceCharacteristic *)&v28 _init];
  if (v2)
  {
    v3 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt16Field alloc] initWithCorrespondingFlagBit:0 fieldLength:2 factor:1];
    v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    [*((id *)v2 + 2) setFlagFieldFlipped:1];
    v5 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt16Field alloc] initWithCorrespondingFlagBit:1 fieldLength:2 factor:1];
    v6 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v5;

    v7 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt16Field alloc] initWithCorrespondingFlagBit:2 fieldLength:2 factor:1];
    v8 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v7;

    v9 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt16Field alloc] initWithCorrespondingFlagBit:3 fieldLength:2 factor:1];
    v10 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v9;

    v11 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt16Field alloc] initWithCorrespondingFlagBit:4 fieldLength:2 factor:1];
    v12 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v11;

    v13 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt16Field alloc] initWithCorrespondingFlagBit:5 fieldLength:2 factor:1];
    v14 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v13;

    v15 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt16Field alloc] initWithCorrespondingFlagBit:5 fieldLength:2 factor:1];
    v16 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v15;

    v17 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt8Field alloc] initWithCorrespondingFlagBit:5 fieldLength:1 factor:1];
    v18 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v17;

    v19 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt8Field alloc] initWithCorrespondingFlagBit:6 fieldLength:1 factor:1];
    v20 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v19;

    v21 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt8Field alloc] initWithCorrespondingFlagBit:7 fieldLength:1 factor:1];
    v22 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v21;

    v23 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt16Field alloc] initWithCorrespondingFlagBit:8 fieldLength:2 factor:1];
    v24 = (void *)*((void *)v2 + 12);
    *((void *)v2 + 12) = v23;

    v25 = [(HDFitnessMachineCharacteristicField *)[HDFitnessMachineCharacteristicUInt16Field alloc] initWithCorrespondingFlagBit:9 fieldLength:2 factor:1];
    v26 = (void *)*((void *)v2 + 13);
    *((void *)v2 + 13) = v25;
  }
  return v2;
}

- (id)description
{
  unsigned int v26 = [(HDFitnessMachineCharacteristicField *)self->_floorsField isSet];
  if (v26)
  {
    CFStringRef v3 = +[NSNumber numberWithUnsignedShort:[(HDFitnessMachineCharacteristicUInt16Field *)self->_floorsField value]];
  }
  else
  {
    CFStringRef v3 = @"(null)";
  }
  unsigned int v25 = [(HDFitnessMachineCharacteristicField *)self->_stepsPerMinuteField isSet];
  if (v25)
  {
    CFStringRef v24 = +[NSNumber numberWithUnsignedShort:[(HDFitnessMachineCharacteristicUInt16Field *)self->_stepsPerMinuteField value]];
  }
  else
  {
    CFStringRef v24 = @"(null)";
  }
  unsigned int v23 = [(HDFitnessMachineCharacteristicField *)self->_averageStepRateField isSet];
  if (v23)
  {
    v31 = +[NSNumber numberWithUnsignedShort:[(HDFitnessMachineCharacteristicUInt16Field *)self->_averageStepRateField value]];
  }
  else
  {
    v31 = @"(null)";
  }
  unsigned int v22 = [(HDFitnessMachineCharacteristicField *)self->_positiveElevationGainField isSet];
  if (v22)
  {
    v30 = +[NSNumber numberWithUnsignedShort:[(HDFitnessMachineCharacteristicUInt16Field *)self->_positiveElevationGainField value]];
  }
  else
  {
    v30 = @"(null)";
  }
  unsigned int v21 = [(HDFitnessMachineCharacteristicField *)self->_stepCountField isSet];
  if (v21)
  {
    CFStringRef v4 = +[NSNumber numberWithUnsignedShort:[(HDFitnessMachineCharacteristicUInt16Field *)self->_stepCountField value]];
  }
  else
  {
    CFStringRef v4 = @"(null)";
  }
  unsigned int v20 = [(HDFitnessMachineCharacteristicField *)self->_totalEnergyField isSet];
  if (v20)
  {
    v5 = +[NSNumber numberWithUnsignedShort:[(HDFitnessMachineCharacteristicUInt16Field *)self->_totalEnergyField value]];
  }
  else
  {
    v5 = @"(null)";
  }
  unsigned int v18 = [(HDFitnessMachineCharacteristicField *)self->_energyPerHourField isSet];
  if (v18)
  {
    v29 = +[NSNumber numberWithUnsignedShort:[(HDFitnessMachineCharacteristicUInt16Field *)self->_energyPerHourField value]];
  }
  else
  {
    v29 = @"(null)";
  }
  unsigned int v17 = [(HDFitnessMachineCharacteristicField *)self->_energyPerMinuteField isSet];
  if (v17)
  {
    objc_super v28 = +[NSNumber numberWithUnsignedChar:[(HDFitnessMachineCharacteristicUInt8Field *)self->_energyPerMinuteField value]];
  }
  else
  {
    objc_super v28 = @"(null)";
  }
  unsigned int v16 = [(HDFitnessMachineCharacteristicField *)self->_heartRateField isSet];
  if (v16)
  {
    v27 = +[NSNumber numberWithUnsignedChar:[(HDFitnessMachineCharacteristicUInt8Field *)self->_heartRateField value]];
  }
  else
  {
    v27 = @"(null)";
  }
  unsigned int v6 = [(HDFitnessMachineCharacteristicField *)self->_metabolicEquivalentField isSet];
  CFStringRef v19 = v3;
  v7 = (__CFString *)v4;
  if (v6)
  {
    v8 = +[NSNumber numberWithUnsignedChar:[(HDFitnessMachineCharacteristicUInt8Field *)self->_metabolicEquivalentField value]];
  }
  else
  {
    v8 = @"(null)";
  }
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
    v12 = (__CFString *)v24;
    v13 = (__CFString *)v19;
    v14 = +[NSString stringWithFormat:@"Stair Climber Data: floors = %@, stepsPerMinute = %@, averageStepRate = %@, positiveElevationGain = %@, stepCount = %@, totalEnergy = %@, energyPerHour = %@, energyPerMinute = %@, heartRate = %@, metabolicEquivalent = %@, elapsedTime = %@, remainingTime = %@", v19, v24, v31, v30, v4, v5, v29, v28, v27, v8, v10, @"(null)"];
    if (!v9) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  v11 = +[NSNumber numberWithUnsignedShort:[(HDFitnessMachineCharacteristicUInt16Field *)self->_remainingTimeField value]];
  v12 = (__CFString *)v24;
  v13 = (__CFString *)v19;
  v14 = +[NSString stringWithFormat:@"Stair Climber Data: floors = %@, stepsPerMinute = %@, averageStepRate = %@, positiveElevationGain = %@, stepCount = %@, totalEnergy = %@, energyPerHour = %@, energyPerMinute = %@, heartRate = %@, metabolicEquivalent = %@, elapsedTime = %@, remainingTime = %@", v19, v24, v31, v30, v7, v5, v29, v28, v27, v8, v10, v11];

  if (v9) {
LABEL_38:
  }

LABEL_39:
  if (v6) {

  }
  if (v16) {
  if (v17)
  }

  if (v18) {
  if (v20)
  }

  if (v21) {
  if (v22)
  }

  if (v23) {
  if (v25)
  }

  if (v26) {

  }
  return v14;
}

- (BOOL)floorsIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_floorsField isSet];
}

- (unsigned)floors
{
  return [(HDFitnessMachineCharacteristicUInt16Field *)self->_floorsField value];
}

- (BOOL)stepsPerMinuteIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_stepsPerMinuteField isSet];
}

- (unsigned)stepsPerMinute
{
  return [(HDFitnessMachineCharacteristicUInt16Field *)self->_stepsPerMinuteField value];
}

- (BOOL)averageStepRateIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_averageStepRateField isSet];
}

- (unsigned)averageStepRate
{
  return [(HDFitnessMachineCharacteristicUInt16Field *)self->_averageStepRateField value];
}

- (BOOL)positiveElevationGainIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_positiveElevationGainField isSet];
}

- (unsigned)positiveElevationGain
{
  return [(HDFitnessMachineCharacteristicUInt16Field *)self->_positiveElevationGainField value];
}

- (BOOL)stepCountIsSet
{
  return [(HDFitnessMachineCharacteristicField *)self->_stepCountField isSet];
}

- (unsigned)stepCount
{
  return [(HDFitnessMachineCharacteristicUInt16Field *)self->_stepCountField value];
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
  objc_storeStrong((id *)&self->_stepCountField, 0);
  objc_storeStrong((id *)&self->_positiveElevationGainField, 0);
  objc_storeStrong((id *)&self->_averageStepRateField, 0);
  objc_storeStrong((id *)&self->_stepsPerMinuteField, 0);

  objc_storeStrong((id *)&self->_floorsField, 0);
}

- (id)generateDatums:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  if ([(HDStairClimberData *)self floorsIsSet])
  {
    unsigned int v6 = +[HKUnit unitFromString:@"count"];
    v7 = +[HKQuantity quantityWithUnit:v6 doubleValue:(double)[(HDStairClimberData *)self floors]];

    id v8 = objc_alloc((Class)HDQuantityDatum);
    unsigned int v9 = +[NSUUID UUID];
    id v10 = [v8 initWithIdentifier:v9 dateInterval:v4 resumeContext:0 quantity:v7];

    [v5 setObject:v10 forKeyedSubscript:&off_64098];
  }
  if ([(HDStairClimberData *)self positiveElevationGainIsSet])
  {
    v11 = +[HKUnit unitFromString:@"m"];
    v12 = +[HKQuantity quantityWithUnit:v11 doubleValue:(double)[(HDStairClimberData *)self positiveElevationGain]];

    id v13 = objc_alloc((Class)HDQuantityDatum);
    v14 = +[NSUUID UUID];
    id v15 = [v13 initWithIdentifier:v14 dateInterval:v4 resumeContext:0 quantity:v12];

    [v5 setObject:v15 forKeyedSubscript:&off_640B0];
  }
  if ([(HDStairClimberData *)self stepCountIsSet])
  {
    unsigned int v16 = +[HKUnit unitFromString:@"count"];
    unsigned int v17 = +[HKQuantity quantityWithUnit:v16 doubleValue:(double)[(HDStairClimberData *)self stepCount]];

    id v18 = objc_alloc((Class)HDQuantityDatum);
    CFStringRef v19 = +[NSUUID UUID];
    id v20 = [v18 initWithIdentifier:v19 dateInterval:v4 resumeContext:0 quantity:v17];

    [v5 setObject:v20 forKeyedSubscript:&off_640C8];
  }
  if ([(HDStairClimberData *)self totalEnergyIsSet])
  {
    unsigned int v21 = +[HKUnit unitFromString:@"kcal"];
    unsigned int v22 = +[HKQuantity quantityWithUnit:v21 doubleValue:(double)[(HDStairClimberData *)self totalEnergy]];

    id v23 = objc_alloc((Class)HDQuantityDatum);
    CFStringRef v24 = +[NSUUID UUID];
    id v25 = [v23 initWithIdentifier:v24 dateInterval:v4 resumeContext:0 quantity:v22];

    [v5 setObject:v25 forKeyedSubscript:&off_640E0];
  }
  if ([(HDStairClimberData *)self elapsedTimeIsSet])
  {
    unsigned int v26 = +[HKUnit unitFromString:@"s"];
    v27 = +[HKQuantity quantityWithUnit:v26 doubleValue:(double)[(HDStairClimberData *)self elapsedTime]];

    id v28 = objc_alloc((Class)HDQuantityDatum);
    v29 = +[NSUUID UUID];
    id v30 = [v28 initWithIdentifier:v29 dateInterval:v4 resumeContext:0 quantity:v27];

    [v5 setObject:v30 forKeyedSubscript:&off_640F8];
  }

  return v5;
}

@end