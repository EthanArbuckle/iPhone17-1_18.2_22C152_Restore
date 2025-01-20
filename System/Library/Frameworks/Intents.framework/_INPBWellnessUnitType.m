@interface _INPBWellnessUnitType
+ (BOOL)supportsSecureCoding;
- (BOOL)hasBloodGlucoseUnit;
- (BOOL)hasBloodPressureUnit;
- (BOOL)hasEnergyUnit;
- (BOOL)hasHeartRateUnit;
- (BOOL)hasLengthUnit;
- (BOOL)hasMassUnit;
- (BOOL)hasRespiratoryRateUnit;
- (BOOL)hasTemperatureUnit;
- (BOOL)hasTimeUnit;
- (BOOL)hasVolumeUnit;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBWellnessUnitType)initWithCoder:(id)a3;
- (id)bloodGlucoseUnitAsString:(int)a3;
- (id)bloodPressureUnitAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)energyUnitAsString:(int)a3;
- (id)heartRateUnitAsString:(int)a3;
- (id)lengthUnitAsString:(int)a3;
- (id)massUnitAsString:(int)a3;
- (id)respiratoryRateUnitAsString:(int)a3;
- (id)temperatureUnitAsString:(int)a3;
- (id)timeUnitAsString:(int)a3;
- (id)volumeUnitAsString:(int)a3;
- (int)StringAsBloodGlucoseUnit:(id)a3;
- (int)StringAsBloodPressureUnit:(id)a3;
- (int)StringAsEnergyUnit:(id)a3;
- (int)StringAsHeartRateUnit:(id)a3;
- (int)StringAsLengthUnit:(id)a3;
- (int)StringAsMassUnit:(id)a3;
- (int)StringAsRespiratoryRateUnit:(id)a3;
- (int)StringAsTemperatureUnit:(id)a3;
- (int)StringAsTimeUnit:(id)a3;
- (int)StringAsVolumeUnit:(id)a3;
- (int)bloodGlucoseUnit;
- (int)bloodPressureUnit;
- (int)energyUnit;
- (int)heartRateUnit;
- (int)lengthUnit;
- (int)massUnit;
- (int)respiratoryRateUnit;
- (int)temperatureUnit;
- (int)timeUnit;
- (int)volumeUnit;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBloodGlucoseUnit:(int)a3;
- (void)setBloodPressureUnit:(int)a3;
- (void)setEnergyUnit:(int)a3;
- (void)setHasBloodGlucoseUnit:(BOOL)a3;
- (void)setHasBloodPressureUnit:(BOOL)a3;
- (void)setHasEnergyUnit:(BOOL)a3;
- (void)setHasHeartRateUnit:(BOOL)a3;
- (void)setHasLengthUnit:(BOOL)a3;
- (void)setHasMassUnit:(BOOL)a3;
- (void)setHasRespiratoryRateUnit:(BOOL)a3;
- (void)setHasTemperatureUnit:(BOOL)a3;
- (void)setHasTimeUnit:(BOOL)a3;
- (void)setHasVolumeUnit:(BOOL)a3;
- (void)setHeartRateUnit:(int)a3;
- (void)setLengthUnit:(int)a3;
- (void)setMassUnit:(int)a3;
- (void)setRespiratoryRateUnit:(int)a3;
- (void)setTemperatureUnit:(int)a3;
- (void)setTimeUnit:(int)a3;
- (void)setVolumeUnit:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBWellnessUnitType

- (int)volumeUnit
{
  return self->_volumeUnit;
}

- (int)timeUnit
{
  return self->_timeUnit;
}

- (int)temperatureUnit
{
  return self->_temperatureUnit;
}

- (int)respiratoryRateUnit
{
  return self->_respiratoryRateUnit;
}

- (int)massUnit
{
  return self->_massUnit;
}

- (int)lengthUnit
{
  return self->_lengthUnit;
}

- (int)heartRateUnit
{
  return self->_heartRateUnit;
}

- (int)energyUnit
{
  return self->_energyUnit;
}

- (int)bloodPressureUnit
{
  return self->_bloodPressureUnit;
}

- (int)bloodGlucoseUnit
{
  return self->_bloodGlucoseUnit;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBWellnessUnitType *)self hasBloodGlucoseUnit])
  {
    uint64_t v4 = [(_INPBWellnessUnitType *)self bloodGlucoseUnit];
    if (v4 >= 3)
    {
      v5 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
    }
    else
    {
      v5 = *(&off_1E5519AE0 + v4);
    }
    [v3 setObject:v5 forKeyedSubscript:@"bloodGlucoseUnit"];
  }
  if ([(_INPBWellnessUnitType *)self hasBloodPressureUnit])
  {
    uint64_t v6 = [(_INPBWellnessUnitType *)self bloodPressureUnit];
    if (v6)
    {
      if (v6 == 1)
      {
        v7 = @"MMHG";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v7 = @"UNKNOWN_BLOOD_PRESSURE_UNIT";
    }
    [v3 setObject:v7 forKeyedSubscript:@"bloodPressureUnit"];
  }
  if ([(_INPBWellnessUnitType *)self hasEnergyUnit])
  {
    uint64_t v8 = [(_INPBWellnessUnitType *)self energyUnit];
    if (v8 >= 6)
    {
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
    }
    else
    {
      v9 = *(&off_1E5519AF8 + v8);
    }
    [v3 setObject:v9 forKeyedSubscript:@"energyUnit"];
  }
  if ([(_INPBWellnessUnitType *)self hasHeartRateUnit])
  {
    uint64_t v10 = [(_INPBWellnessUnitType *)self heartRateUnit];
    if (v10)
    {
      if (v10 == 1)
      {
        v11 = @"BPM";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v11 = @"UNKNOWN_HEART_RATE_UNIT";
    }
    [v3 setObject:v11 forKeyedSubscript:@"heartRateUnit"];
  }
  if ([(_INPBWellnessUnitType *)self hasLengthUnit])
  {
    uint64_t v12 = [(_INPBWellnessUnitType *)self lengthUnit];
    if ((v12 - 1) >= 0x16)
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v12);
    }
    else
    {
      v13 = *(&off_1E5519B28 + (v12 - 1));
    }
    [v3 setObject:v13 forKeyedSubscript:@"lengthUnit"];
  }
  if ([(_INPBWellnessUnitType *)self hasMassUnit])
  {
    uint64_t v14 = [(_INPBWellnessUnitType *)self massUnit];
    if (v14 >= 0x11)
    {
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v14);
    }
    else
    {
      v15 = *(&off_1E5519BD8 + v14);
    }
    [v3 setObject:v15 forKeyedSubscript:@"massUnit"];
  }
  if ([(_INPBWellnessUnitType *)self hasRespiratoryRateUnit])
  {
    uint64_t v16 = [(_INPBWellnessUnitType *)self respiratoryRateUnit];
    if (v16)
    {
      if (v16 == 1)
      {
        v17 = @"BREATHMIN";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v16);
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v17 = @"UNKNOWN_RESPIRATORY_RATE_UNIT";
    }
    [v3 setObject:v17 forKeyedSubscript:@"respiratoryRateUnit"];
  }
  if ([(_INPBWellnessUnitType *)self hasTemperatureUnit])
  {
    uint64_t v18 = [(_INPBWellnessUnitType *)self temperatureUnit];
    if ((v18 - 1) >= 3)
    {
      v19 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v18);
    }
    else
    {
      v19 = *(&off_1E5519C60 + (v18 - 1));
    }
    [v3 setObject:v19 forKeyedSubscript:@"temperatureUnit"];
  }
  if ([(_INPBWellnessUnitType *)self hasTimeUnit])
  {
    uint64_t v20 = [(_INPBWellnessUnitType *)self timeUnit];
    if (v20 >= 8)
    {
      v21 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v20);
    }
    else
    {
      v21 = *(&off_1E5519C78 + v20);
    }
    [v3 setObject:v21 forKeyedSubscript:@"timeUnit"];
  }
  if ([(_INPBWellnessUnitType *)self hasVolumeUnit])
  {
    uint64_t v22 = [(_INPBWellnessUnitType *)self volumeUnit];
    if (v22 >= 0x1D)
    {
      v23 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v22);
    }
    else
    {
      v23 = *(&off_1E5519CB8 + v22);
    }
    [v3 setObject:v23 forKeyedSubscript:@"volumeUnit"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBWellnessUnitType *)self hasBloodGlucoseUnit]) {
    uint64_t v13 = 2654435761 * self->_bloodGlucoseUnit;
  }
  else {
    uint64_t v13 = 0;
  }
  if ([(_INPBWellnessUnitType *)self hasBloodPressureUnit]) {
    uint64_t v3 = 2654435761 * self->_bloodPressureUnit;
  }
  else {
    uint64_t v3 = 0;
  }
  if ([(_INPBWellnessUnitType *)self hasEnergyUnit]) {
    uint64_t v4 = 2654435761 * self->_energyUnit;
  }
  else {
    uint64_t v4 = 0;
  }
  if ([(_INPBWellnessUnitType *)self hasHeartRateUnit]) {
    uint64_t v5 = 2654435761 * self->_heartRateUnit;
  }
  else {
    uint64_t v5 = 0;
  }
  if ([(_INPBWellnessUnitType *)self hasLengthUnit]) {
    uint64_t v6 = 2654435761 * self->_lengthUnit;
  }
  else {
    uint64_t v6 = 0;
  }
  if ([(_INPBWellnessUnitType *)self hasMassUnit]) {
    uint64_t v7 = 2654435761 * self->_massUnit;
  }
  else {
    uint64_t v7 = 0;
  }
  if ([(_INPBWellnessUnitType *)self hasRespiratoryRateUnit]) {
    uint64_t v8 = 2654435761 * self->_respiratoryRateUnit;
  }
  else {
    uint64_t v8 = 0;
  }
  if ([(_INPBWellnessUnitType *)self hasTemperatureUnit]) {
    uint64_t v9 = 2654435761 * self->_temperatureUnit;
  }
  else {
    uint64_t v9 = 0;
  }
  if ([(_INPBWellnessUnitType *)self hasTimeUnit]) {
    uint64_t v10 = 2654435761 * self->_timeUnit;
  }
  else {
    uint64_t v10 = 0;
  }
  if ([(_INPBWellnessUnitType *)self hasVolumeUnit]) {
    uint64_t v11 = 2654435761 * self->_volumeUnit;
  }
  else {
    uint64_t v11 = 0;
  }
  return v3 ^ v13 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_39;
  }
  int v5 = [(_INPBWellnessUnitType *)self hasBloodGlucoseUnit];
  if (v5 != [v4 hasBloodGlucoseUnit]) {
    goto LABEL_39;
  }
  if ([(_INPBWellnessUnitType *)self hasBloodGlucoseUnit])
  {
    if ([v4 hasBloodGlucoseUnit])
    {
      int bloodGlucoseUnit = self->_bloodGlucoseUnit;
      if (bloodGlucoseUnit != [v4 bloodGlucoseUnit]) {
        goto LABEL_39;
      }
    }
  }
  int v7 = [(_INPBWellnessUnitType *)self hasBloodPressureUnit];
  if (v7 != [v4 hasBloodPressureUnit]) {
    goto LABEL_39;
  }
  if ([(_INPBWellnessUnitType *)self hasBloodPressureUnit])
  {
    if ([v4 hasBloodPressureUnit])
    {
      int bloodPressureUnit = self->_bloodPressureUnit;
      if (bloodPressureUnit != [v4 bloodPressureUnit]) {
        goto LABEL_39;
      }
    }
  }
  int v9 = [(_INPBWellnessUnitType *)self hasEnergyUnit];
  if (v9 != [v4 hasEnergyUnit]) {
    goto LABEL_39;
  }
  if ([(_INPBWellnessUnitType *)self hasEnergyUnit])
  {
    if ([v4 hasEnergyUnit])
    {
      int energyUnit = self->_energyUnit;
      if (energyUnit != [v4 energyUnit]) {
        goto LABEL_39;
      }
    }
  }
  int v11 = [(_INPBWellnessUnitType *)self hasHeartRateUnit];
  if (v11 != [v4 hasHeartRateUnit]) {
    goto LABEL_39;
  }
  if ([(_INPBWellnessUnitType *)self hasHeartRateUnit])
  {
    if ([v4 hasHeartRateUnit])
    {
      int heartRateUnit = self->_heartRateUnit;
      if (heartRateUnit != [v4 heartRateUnit]) {
        goto LABEL_39;
      }
    }
  }
  int v13 = [(_INPBWellnessUnitType *)self hasLengthUnit];
  if (v13 != [v4 hasLengthUnit]) {
    goto LABEL_39;
  }
  if ([(_INPBWellnessUnitType *)self hasLengthUnit])
  {
    if ([v4 hasLengthUnit])
    {
      int lengthUnit = self->_lengthUnit;
      if (lengthUnit != [v4 lengthUnit]) {
        goto LABEL_39;
      }
    }
  }
  int v15 = [(_INPBWellnessUnitType *)self hasMassUnit];
  if (v15 != [v4 hasMassUnit]) {
    goto LABEL_39;
  }
  if ([(_INPBWellnessUnitType *)self hasMassUnit])
  {
    if ([v4 hasMassUnit])
    {
      int massUnit = self->_massUnit;
      if (massUnit != [v4 massUnit]) {
        goto LABEL_39;
      }
    }
  }
  int v17 = [(_INPBWellnessUnitType *)self hasRespiratoryRateUnit];
  if (v17 != [v4 hasRespiratoryRateUnit]) {
    goto LABEL_39;
  }
  if ([(_INPBWellnessUnitType *)self hasRespiratoryRateUnit])
  {
    if ([v4 hasRespiratoryRateUnit])
    {
      int respiratoryRateUnit = self->_respiratoryRateUnit;
      if (respiratoryRateUnit != [v4 respiratoryRateUnit]) {
        goto LABEL_39;
      }
    }
  }
  if ((int v19 = [(_INPBWellnessUnitType *)self hasTemperatureUnit],
        v19 == [v4 hasTemperatureUnit])
    && (![(_INPBWellnessUnitType *)self hasTemperatureUnit]
     || ![v4 hasTemperatureUnit]
     || (int temperatureUnit = self->_temperatureUnit, temperatureUnit == [v4 temperatureUnit]))
    && (int v21 = [(_INPBWellnessUnitType *)self hasTimeUnit],
        v21 == [v4 hasTimeUnit])
    && (![(_INPBWellnessUnitType *)self hasTimeUnit]
     || ![v4 hasTimeUnit]
     || (int timeUnit = self->_timeUnit, timeUnit == [v4 timeUnit]))
    && (int v23 = [(_INPBWellnessUnitType *)self hasVolumeUnit],
        v23 == [v4 hasVolumeUnit])
    && (![(_INPBWellnessUnitType *)self hasVolumeUnit]
     || ![v4 hasVolumeUnit]
     || (int volumeUnit = self->_volumeUnit, volumeUnit == [v4 volumeUnit])))
  {
    BOOL v24 = 1;
  }
  else
  {
LABEL_39:
    BOOL v24 = 0;
  }

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[_INPBWellnessUnitType allocWithZone:a3] init];
  if ([(_INPBWellnessUnitType *)self hasBloodGlucoseUnit]) {
    [(_INPBWellnessUnitType *)v4 setBloodGlucoseUnit:[(_INPBWellnessUnitType *)self bloodGlucoseUnit]];
  }
  if ([(_INPBWellnessUnitType *)self hasBloodPressureUnit]) {
    [(_INPBWellnessUnitType *)v4 setBloodPressureUnit:[(_INPBWellnessUnitType *)self bloodPressureUnit]];
  }
  if ([(_INPBWellnessUnitType *)self hasEnergyUnit]) {
    [(_INPBWellnessUnitType *)v4 setEnergyUnit:[(_INPBWellnessUnitType *)self energyUnit]];
  }
  if ([(_INPBWellnessUnitType *)self hasHeartRateUnit]) {
    [(_INPBWellnessUnitType *)v4 setHeartRateUnit:[(_INPBWellnessUnitType *)self heartRateUnit]];
  }
  if ([(_INPBWellnessUnitType *)self hasLengthUnit]) {
    [(_INPBWellnessUnitType *)v4 setLengthUnit:[(_INPBWellnessUnitType *)self lengthUnit]];
  }
  if ([(_INPBWellnessUnitType *)self hasMassUnit]) {
    [(_INPBWellnessUnitType *)v4 setMassUnit:[(_INPBWellnessUnitType *)self massUnit]];
  }
  if ([(_INPBWellnessUnitType *)self hasRespiratoryRateUnit]) {
    [(_INPBWellnessUnitType *)v4 setRespiratoryRateUnit:[(_INPBWellnessUnitType *)self respiratoryRateUnit]];
  }
  if ([(_INPBWellnessUnitType *)self hasTemperatureUnit]) {
    [(_INPBWellnessUnitType *)v4 setTemperatureUnit:[(_INPBWellnessUnitType *)self temperatureUnit]];
  }
  if ([(_INPBWellnessUnitType *)self hasTimeUnit]) {
    [(_INPBWellnessUnitType *)v4 setTimeUnit:[(_INPBWellnessUnitType *)self timeUnit]];
  }
  if ([(_INPBWellnessUnitType *)self hasVolumeUnit]) {
    [(_INPBWellnessUnitType *)v4 setVolumeUnit:[(_INPBWellnessUnitType *)self volumeUnit]];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBWellnessUnitType *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBWellnessUnitType)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBWellnessUnitType *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBWellnessUnitType *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBWellnessUnitType *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ([(_INPBWellnessUnitType *)self hasBloodGlucoseUnit]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBWellnessUnitType *)self hasBloodPressureUnit]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBWellnessUnitType *)self hasEnergyUnit]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBWellnessUnitType *)self hasHeartRateUnit]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBWellnessUnitType *)self hasLengthUnit]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBWellnessUnitType *)self hasMassUnit]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBWellnessUnitType *)self hasRespiratoryRateUnit]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBWellnessUnitType *)self hasTemperatureUnit]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBWellnessUnitType *)self hasTimeUnit]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBWellnessUnitType *)self hasVolumeUnit]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBWellnessUnitTypeReadFrom(self, (uint64_t)a3);
}

- (int)StringAsVolumeUnit:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_VOLUME_UNIT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MEGALITER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"KILOLITER"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LITER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"DECILITER"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CENTILITER"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MILLILITER"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CUBIC_KILOMETER"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"CUBIC_DECIMETER"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"CUBIC_MILLIMETER"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"CUBIC_INCH"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"CUBIC_FEET"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"CUBIC_YARD"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"CUBIC_MILE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"ACRE_FOEET"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"BUSHEL"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"TEASPOON"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"TABLESPOON"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"FLUID_OUNCE"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"CUP"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"PINT"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"QUART"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"GALLON"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"IMPERIAL_TEASPOON"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"IMPERIAL_QUART"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"IMPERIAL_GALLON"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"METRIC_CUP"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"CUBIC_CENTIMETER"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"CUBIC_METER"])
  {
    int v4 = 28;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)volumeUnitAsString:(int)a3
{
  if (a3 >= 0x1D)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E5519CB8 + a3);
  }

  return v3;
}

- (void)setHasVolumeUnit:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasVolumeUnit
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setVolumeUnit:(int)a3
{
  __int16 has = (__int16)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_WORD *)&self->___int16 has = has & 0xFDFF;
  }
  else
  {
    *(_WORD *)&self->___int16 has = has | 0x200;
    self->_int volumeUnit = a3;
  }
}

- (int)StringAsTimeUnit:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_TIME_UNIT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SECOND"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MINUTE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"HOUR"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"DAY"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"WEEK"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MONTH"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"YEAR"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)timeUnitAsString:(int)a3
{
  if (a3 >= 8)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E5519C78 + a3);
  }

  return v3;
}

- (void)setHasTimeUnit:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTimeUnit
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setTimeUnit:(int)a3
{
  __int16 has = (__int16)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_WORD *)&self->___int16 has = has & 0xFEFF;
  }
  else
  {
    *(_WORD *)&self->___int16 has = has | 0x100;
    self->_int timeUnit = a3;
  }
}

- (int)StringAsTemperatureUnit:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CELSIUS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FAHRENHEIT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"KELVIN"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)temperatureUnitAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E5519C60 + (a3 - 1));
  }

  return v3;
}

- (void)setHasTemperatureUnit:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTemperatureUnit
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setTemperatureUnit:(int)a3
{
  __int16 has = (__int16)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_WORD *)&self->___int16 has = has & 0xFF7F;
  }
  else
  {
    *(_WORD *)&self->___int16 has = has | 0x80;
    self->_int temperatureUnit = a3;
  }
}

- (int)StringAsRespiratoryRateUnit:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_RESPIRATORY_RATE_UNIT"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"BREATHMIN"];
  }

  return v4;
}

- (id)respiratoryRateUnitAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"BREATHMIN";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"UNKNOWN_RESPIRATORY_RATE_UNIT";
  }
  return v4;
}

- (void)setHasRespiratoryRateUnit:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRespiratoryRateUnit
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setRespiratoryRateUnit:(int)a3
{
  __int16 has = (__int16)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_WORD *)&self->___int16 has = has & 0xFFBF;
  }
  else
  {
    *(_WORD *)&self->___int16 has = has | 0x40;
    self->_int respiratoryRateUnit = a3;
  }
}

- (int)StringAsMassUnit:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_MASS_UNIT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"KILOGRAM"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"GRAM"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DECIGRAM"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CENTIGRAM"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"MILLIGRAM"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MICROGRAM"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"NANOGRAM"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"PICOGRAM"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"OUNCE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"POUND"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"STONE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"METRIC_TONNE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"SHORT_TONNE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"CARATS"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"OUNCE_TROY"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"SLUG"])
  {
    int v4 = 16;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)massUnitAsString:(int)a3
{
  if (a3 >= 0x11)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E5519BD8 + a3);
  }

  return v3;
}

- (void)setHasMassUnit:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasMassUnit
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setMassUnit:(int)a3
{
  __int16 has = (__int16)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_WORD *)&self->___int16 has = has & 0xFFDF;
  }
  else
  {
    *(_WORD *)&self->___int16 has = has | 0x20;
    self->_int massUnit = a3;
  }
}

- (int)StringAsLengthUnit:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"METERS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MILES"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CENTIMETER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FOOT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"INCH"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"YARD"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"KILOMETER"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"MEGAMETER"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"HECTOMETER"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"DECAMETER"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"DECIMETER"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"MILLIMETER"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"MICROMETER"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"NANOMETER"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"PICOMETER"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"SCANDINAVIAN_MILE"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"LIGHTYEAR"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"NAUTICAL_MILE"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"FATHOM"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"FURLONG"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"ASTRONOMICAL_UNIT"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"PARSEC"])
  {
    int v4 = 22;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)lengthUnitAsString:(int)a3
{
  if ((a3 - 1) >= 0x16)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E5519B28 + (a3 - 1));
  }

  return v3;
}

- (void)setHasLengthUnit:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasLengthUnit
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setLengthUnit:(int)a3
{
  __int16 has = (__int16)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_WORD *)&self->___int16 has = has & 0xFFEF;
  }
  else
  {
    *(_WORD *)&self->___int16 has = has | 0x10;
    self->_int lengthUnit = a3;
  }
}

- (int)StringAsHeartRateUnit:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_HEART_RATE_UNIT"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"BPM"];
  }

  return v4;
}

- (id)heartRateUnitAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"BPM";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"UNKNOWN_HEART_RATE_UNIT";
  }
  return v4;
}

- (void)setHasHeartRateUnit:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasHeartRateUnit
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHeartRateUnit:(int)a3
{
  __int16 has = (__int16)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_WORD *)&self->___int16 has = has & 0xFFF7;
  }
  else
  {
    *(_WORD *)&self->___int16 has = has | 8;
    self->_int heartRateUnit = a3;
  }
}

- (int)StringAsEnergyUnit:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_ENERGY_UNIT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"KILOJOULE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"JOULE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"KILOCALORIE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CALORIE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"KILOWATT_HOUR"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)energyUnitAsString:(int)a3
{
  if (a3 >= 6)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E5519AF8 + a3);
  }

  return v3;
}

- (void)setHasEnergyUnit:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasEnergyUnit
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setEnergyUnit:(int)a3
{
  __int16 has = (__int16)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_WORD *)&self->___int16 has = has & 0xFFFB;
  }
  else
  {
    *(_WORD *)&self->___int16 has = has | 4;
    self->_int energyUnit = a3;
  }
}

- (int)StringAsBloodPressureUnit:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_BLOOD_PRESSURE_UNIT"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"MMHG"];
  }

  return v4;
}

- (id)bloodPressureUnitAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"MMHG";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"UNKNOWN_BLOOD_PRESSURE_UNIT";
  }
  return v4;
}

- (void)setHasBloodPressureUnit:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasBloodPressureUnit
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setBloodPressureUnit:(int)a3
{
  __int16 has = (__int16)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_WORD *)&self->___int16 has = has & 0xFFFD;
  }
  else
  {
    *(_WORD *)&self->___int16 has = has | 2;
    self->_int bloodPressureUnit = a3;
  }
}

- (int)StringAsBloodGlucoseUnit:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_BLOOD_GLUCOSE_UNIT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MGDL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MMOLL"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)bloodGlucoseUnitAsString:(int)a3
{
  if (a3 >= 3)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E5519AE0 + a3);
  }

  return v3;
}

- (void)setHasBloodGlucoseUnit:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBloodGlucoseUnit
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setBloodGlucoseUnit:(int)a3
{
  __int16 has = (__int16)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_WORD *)&self->___int16 has = has & 0xFFFE;
  }
  else
  {
    *(_WORD *)&self->___int16 has = has | 1;
    self->_int bloodGlucoseUnit = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end