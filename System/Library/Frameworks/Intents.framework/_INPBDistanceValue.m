@interface _INPBDistanceValue
+ (BOOL)supportsSecureCoding;
- (BOOL)hasMagnitude;
- (BOOL)hasUnit;
- (BOOL)hasValueMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBDistanceValue)initWithCoder:(id)a3;
- (_INPBValueMetadata)valueMetadata;
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

@implementation _INPBDistanceValue

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
  if ([(_INPBDistanceValue *)self hasMagnitude])
  {
    v4 = NSNumber;
    [(_INPBDistanceValue *)self magnitude];
    v5 = objc_msgSend(v4, "numberWithDouble:");
    [v3 setObject:v5 forKeyedSubscript:@"magnitude"];
  }
  if ([(_INPBDistanceValue *)self hasUnit])
  {
    uint64_t v6 = [(_INPBDistanceValue *)self unit];
    if ((v6 - 1) >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E551BDA8[(v6 - 1)];
    }
    [v3 setObject:v7 forKeyedSubscript:@"unit"];
  }
  v8 = [(_INPBDistanceValue *)self valueMetadata];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"valueMetadata"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBDistanceValue *)self hasMagnitude])
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
  if ([(_INPBDistanceValue *)self hasUnit]) {
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
    int v5 = [(_INPBDistanceValue *)self hasMagnitude];
    if (v5 == [v4 hasMagnitude])
    {
      if (![(_INPBDistanceValue *)self hasMagnitude]
        || ![v4 hasMagnitude]
        || (double magnitude = self->_magnitude, [v4 magnitude], magnitude == v7))
      {
        int v8 = [(_INPBDistanceValue *)self hasUnit];
        if (v8 == [v4 hasUnit])
        {
          if (![(_INPBDistanceValue *)self hasUnit]
            || ![v4 hasUnit]
            || (int unit = self->_unit, unit == [v4 unit]))
          {
            v10 = [(_INPBDistanceValue *)self valueMetadata];
            v11 = [v4 valueMetadata];
            v12 = v11;
            if ((v10 == 0) != (v11 != 0))
            {
              uint64_t v13 = [(_INPBDistanceValue *)self valueMetadata];
              if (!v13)
              {

LABEL_18:
                BOOL v18 = 1;
                goto LABEL_16;
              }
              v14 = (void *)v13;
              v15 = [(_INPBDistanceValue *)self valueMetadata];
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
  int v5 = [+[_INPBDistanceValue allocWithZone:](_INPBDistanceValue, "allocWithZone:") init];
  if ([(_INPBDistanceValue *)self hasMagnitude])
  {
    [(_INPBDistanceValue *)self magnitude];
    -[_INPBDistanceValue setMagnitude:](v5, "setMagnitude:");
  }
  if ([(_INPBDistanceValue *)self hasUnit]) {
    [(_INPBDistanceValue *)v5 setUnit:[(_INPBDistanceValue *)self unit]];
  }
  id v6 = [(_INPBValueMetadata *)self->_valueMetadata copyWithZone:a3];
  [(_INPBDistanceValue *)v5 setValueMetadata:v6];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBDistanceValue *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBDistanceValue)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBDistanceValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        int v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBDistanceValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBDistanceValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if ([(_INPBDistanceValue *)self hasMagnitude]) {
    PBDataWriterWriteDoubleField();
  }
  if ([(_INPBDistanceValue *)self hasUnit]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_INPBDistanceValue *)self valueMetadata];

  int v5 = v7;
  if (v4)
  {
    id v6 = [(_INPBDistanceValue *)self valueMetadata];
    PBDataWriterWriteSubmessage();

    int v5 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBDistanceValueReadFrom(self, (uint64_t)a3);
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

- (id)unitAsString:(int)a3
{
  if ((a3 - 1) >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551BDA8[a3 - 1];
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