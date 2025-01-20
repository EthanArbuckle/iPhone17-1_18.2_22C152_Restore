@interface _INPBVolumeValue
+ (BOOL)supportsSecureCoding;
- (BOOL)hasMagnitude;
- (BOOL)hasUnit;
- (BOOL)hasValueMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBValueMetadata)valueMetadata;
- (_INPBVolumeValue)initWithCoder:(id)a3;
- (double)magnitude;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)unitAsString:(int)a3;
- (int)StringAsUnit:(id)a3;
- (int)unit;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasMagnitude:(BOOL)a3;
- (void)setHasUnit:(BOOL)a3;
- (void)setMagnitude:(double)a3;
- (void)setUnit:(int)a3;
- (void)setValueMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBVolumeValue

- (void).cxx_destruct
{
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (int)unit
{
  return self->_unit;
}

- (double)magnitude
{
  return self->_magnitude;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBVolumeValue *)self hasMagnitude])
  {
    v4 = NSNumber;
    [(_INPBVolumeValue *)self magnitude];
    v5 = objc_msgSend(v4, "numberWithDouble:");
    [v3 setObject:v5 forKeyedSubscript:@"magnitude"];
  }
  if ([(_INPBVolumeValue *)self hasUnit])
  {
    uint64_t v6 = [(_INPBVolumeValue *)self unit];
    if (v6 >= 0x1D)
    {
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
    }
    else
    {
      v7 = *(&off_1E551FA00 + v6);
    }
    [v3 setObject:v7 forKeyedSubscript:@"unit"];
  }
  v8 = [(_INPBVolumeValue *)self valueMetadata];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"valueMetadata"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBVolumeValue *)self hasMagnitude])
  {
    double magnitude = self->_magnitude;
    double v4 = -magnitude;
    if (magnitude >= 0.0) {
      double v4 = self->_magnitude;
    }
    long double v5 = floor(v4 + 0.5);
    double v6 = (v4 - v5) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
    if (v6 >= 0.0)
    {
      if (v6 > 0.0) {
        v7 += (unint64_t)v6;
      }
    }
    else
    {
      v7 -= (unint64_t)fabs(v6);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  if ([(_INPBVolumeValue *)self hasUnit]) {
    uint64_t v8 = 2654435761 * self->_unit;
  }
  else {
    uint64_t v8 = 0;
  }
  return v8 ^ v7 ^ [(_INPBValueMetadata *)self->_valueMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int v5 = [(_INPBVolumeValue *)self hasMagnitude];
    if (v5 == [v4 hasMagnitude])
    {
      if (![(_INPBVolumeValue *)self hasMagnitude]
        || ![v4 hasMagnitude]
        || (double magnitude = self->_magnitude, [v4 magnitude], magnitude == v7))
      {
        int v8 = [(_INPBVolumeValue *)self hasUnit];
        if (v8 == [v4 hasUnit])
        {
          if (![(_INPBVolumeValue *)self hasUnit]
            || ![v4 hasUnit]
            || (int unit = self->_unit, unit == [v4 unit]))
          {
            v10 = [(_INPBVolumeValue *)self valueMetadata];
            v11 = [v4 valueMetadata];
            v12 = v11;
            if ((v10 == 0) != (v11 != 0))
            {
              uint64_t v13 = [(_INPBVolumeValue *)self valueMetadata];
              if (!v13)
              {

LABEL_18:
                BOOL v18 = 1;
                goto LABEL_16;
              }
              v14 = (void *)v13;
              v15 = [(_INPBVolumeValue *)self valueMetadata];
              v16 = [v4 valueMetadata];
              char v17 = [v15 isEqual:v16];

              if (v17) {
                goto LABEL_18;
              }
            }
            else
            {
            }
          }
        }
      }
    }
  }
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBVolumeValue allocWithZone:](_INPBVolumeValue, "allocWithZone:") init];
  if ([(_INPBVolumeValue *)self hasMagnitude])
  {
    [(_INPBVolumeValue *)self magnitude];
    -[_INPBVolumeValue setMagnitude:](v5, "setMagnitude:");
  }
  if ([(_INPBVolumeValue *)self hasUnit]) {
    [(_INPBVolumeValue *)v5 setUnit:[(_INPBVolumeValue *)self unit]];
  }
  id v6 = [(_INPBValueMetadata *)self->_valueMetadata copyWithZone:a3];
  [(_INPBVolumeValue *)v5 setValueMetadata:v6];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBVolumeValue *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBVolumeValue)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBVolumeValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        int v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBVolumeValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBVolumeValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if ([(_INPBVolumeValue *)self hasMagnitude]) {
    PBDataWriterWriteDoubleField();
  }
  if ([(_INPBVolumeValue *)self hasUnit]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_INPBVolumeValue *)self valueMetadata];

  int v5 = v7;
  if (v4)
  {
    id v6 = [(_INPBVolumeValue *)self valueMetadata];
    PBDataWriterWriteSubmessage();

    int v5 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBVolumeValueReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasValueMetadata
{
  return self->_valueMetadata != 0;
}

- (void)setValueMetadata:(id)a3
{
}

- (int)StringAsUnit:(id)a3
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

- (id)unitAsString:(int)a3
{
  if (a3 >= 0x1D)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551FA00 + a3);
  }

  return v3;
}

- (void)setHasUnit:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUnit
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setUnit:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
    self->_int unit = a3;
  }
}

- (void)setHasMagnitude:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMagnitude
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMagnitude:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double magnitude = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end