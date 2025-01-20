@interface _INPBHomeAttribute
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAttributeType;
- (BOOL)hasAttributeValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBHomeAttribute)initWithCoder:(id)a3;
- (_INPBHomeAttributeValue)attributeValue;
- (id)attributeTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int)StringAsAttributeType:(id)a3;
- (int)attributeType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributeType:(int)a3;
- (void)setAttributeValue:(id)a3;
- (void)setHasAttributeType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBHomeAttribute

- (void).cxx_destruct
{
}

- (_INPBHomeAttributeValue)attributeValue
{
  return self->_attributeValue;
}

- (int)attributeType
{
  return self->_attributeType;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBHomeAttribute *)self hasAttributeType])
  {
    uint64_t v4 = [(_INPBHomeAttribute *)self attributeType];
    if (v4 >= 0x42)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E551A600[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"attributeType"];
  }
  v6 = [(_INPBHomeAttribute *)self attributeValue];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"attributeValue"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBHomeAttribute *)self hasAttributeType]) {
    uint64_t v3 = 2654435761 * self->_attributeType;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(_INPBHomeAttributeValue *)self->_attributeValue hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int v5 = [(_INPBHomeAttribute *)self hasAttributeType];
    if (v5 == [v4 hasAttributeType])
    {
      if (![(_INPBHomeAttribute *)self hasAttributeType]
        || ![v4 hasAttributeType]
        || (int attributeType = self->_attributeType, attributeType == [v4 attributeType]))
      {
        v7 = [(_INPBHomeAttribute *)self attributeValue];
        v8 = [v4 attributeValue];
        v9 = v8;
        if ((v7 == 0) != (v8 != 0))
        {
          uint64_t v10 = [(_INPBHomeAttribute *)self attributeValue];
          if (!v10)
          {

LABEL_14:
            BOOL v15 = 1;
            goto LABEL_12;
          }
          v11 = (void *)v10;
          v12 = [(_INPBHomeAttribute *)self attributeValue];
          v13 = [v4 attributeValue];
          char v14 = [v12 isEqual:v13];

          if (v14) {
            goto LABEL_14;
          }
        }
        else
        {
        }
      }
    }
  }
  BOOL v15 = 0;
LABEL_12:

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBHomeAttribute allocWithZone:](_INPBHomeAttribute, "allocWithZone:") init];
  if ([(_INPBHomeAttribute *)self hasAttributeType]) {
    [(_INPBHomeAttribute *)v5 setAttributeType:[(_INPBHomeAttribute *)self attributeType]];
  }
  id v6 = [(_INPBHomeAttributeValue *)self->_attributeValue copyWithZone:a3];
  [(_INPBHomeAttribute *)v5 setAttributeValue:v6];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBHomeAttribute *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBHomeAttribute)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBHomeAttribute *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBHomeAttribute *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBHomeAttribute *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if ([(_INPBHomeAttribute *)self hasAttributeType]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_INPBHomeAttribute *)self attributeValue];

  int v5 = v7;
  if (v4)
  {
    id v6 = [(_INPBHomeAttribute *)self attributeValue];
    PBDataWriterWriteSubmessage();

    int v5 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBHomeAttributeReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasAttributeValue
{
  return self->_attributeValue != 0;
}

- (void)setAttributeValue:(id)a3
{
}

- (int)StringAsAttributeType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ENABLED"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BRIGHTNESS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"HUE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SATURATION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"COLOR_VALUE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"TEMPERATURE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"HUMIDITY"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"LOCK"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"POSITION"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"RAISE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"ROTATION_SPEED"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"ROTATION_DIRECTION"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"SECURITY_SYSTEM_STATE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"HEATING_COOLING_MODE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"HEATER_COOLER_MODE"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"CONTROL_LOCK"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"COOLING_THRESHOLD"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"FAN_OPERATING_MODE"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"HEATING_THRESHOLD"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"HUMIDIFIER_DEHUMIDIFIER_MODE"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"SLAT_OPERATING_MODE"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"SWING_MODE"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"HUMIDIFIER_THRESHOLD"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"DEHUMIDIFIER_THRESHOLD"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"PROGRAM_MODE"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"DURATION"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"POWER"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"AIR_QUALITY_RATING"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"AIR_PARTICULATE_DENSITY"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"AIR_PARTICULATE_SIZE"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"SMOKE_DETECTED"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"CARBON_MONOXIDE_DETECTED"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"CARBON_MONOXIDE_LEVEL"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"CARBON_MONOXIDE_PEAK_LEVEL"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"CARBON_DIOXIDE_DETECTED"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"CARBON_DIOXIDE_LEVEL"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"CARBON_DIOXIDE_PEAK_LEVEL"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"CONTACT_DETECTED"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"OCCUPANCY_DETECTED"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"LEAK_DETECTED"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"MOTION_DETECTED"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"AMBIENT_LIGHT_LEVEL"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"BATTERY_LEVEL"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"CHARGING_STATE"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"LOW_BATTERY"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"IN_USE"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"AIR_PURIFIER_OPERATING_MODE"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"FILTER_CHANGE"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"FILTER_LIFE"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"WATER_LEVEL"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"REMAINING_DURATION"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"STATUS_FAULT"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"SULPHUR_DIOXIDE_DENSITY"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"NITROGEN_DIOXIDE_DENSITY"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"PARTICULATE_MATTER_2_5_DENSITY"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"PARTICULATE_MATTER_10_DENSITY"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"VOLATILE_ORGANIC_COMPOUND_DENSITY"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"OZONE_DENSITY"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"COLOR_TEMPERATURE"])
  {
    int v4 = 58;
  }
  else if ([v3 isEqualToString:@"COUNT"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"LOCATION"])
  {
    int v4 = 60;
  }
  else if ([v3 isEqualToString:@"INVENTORY"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"CAPABILITIES"])
  {
    int v4 = 62;
  }
  else if ([v3 isEqualToString:@"OPEN"])
  {
    int v4 = 63;
  }
  else if ([v3 isEqualToString:@"MEDIA"])
  {
    int v4 = 64;
  }
  else if ([v3 isEqualToString:@"ADAPTIVE_LIGHTING"])
  {
    int v4 = 65;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)attributeTypeAsString:(int)a3
{
  if (a3 >= 0x42)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551A600[a3];
  }

  return v3;
}

- (void)setHasAttributeType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAttributeType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAttributeType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int attributeType = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end