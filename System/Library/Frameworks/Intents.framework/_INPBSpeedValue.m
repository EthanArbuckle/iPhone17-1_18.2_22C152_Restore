@interface _INPBSpeedValue
+ (BOOL)supportsSecureCoding;
- (BOOL)hasMagnitude;
- (BOOL)hasUnit;
- (BOOL)hasValueMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBSpeedValue)initWithCoder:(id)a3;
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

@implementation _INPBSpeedValue

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
  if ([(_INPBSpeedValue *)self hasMagnitude])
  {
    v4 = NSNumber;
    [(_INPBSpeedValue *)self magnitude];
    v5 = objc_msgSend(v4, "numberWithDouble:");
    [v3 setObject:v5 forKeyedSubscript:@"magnitude"];
  }
  if ([(_INPBSpeedValue *)self hasUnit])
  {
    uint64_t v6 = [(_INPBSpeedValue *)self unit];
    if (v6 >= 5)
    {
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
    }
    else
    {
      v7 = *(&off_1E551FAE8 + v6);
    }
    [v3 setObject:v7 forKeyedSubscript:@"unit"];
  }
  v8 = [(_INPBSpeedValue *)self valueMetadata];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"valueMetadata"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBSpeedValue *)self hasMagnitude])
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
  if ([(_INPBSpeedValue *)self hasUnit]) {
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
    int v5 = [(_INPBSpeedValue *)self hasMagnitude];
    if (v5 == [v4 hasMagnitude])
    {
      if (![(_INPBSpeedValue *)self hasMagnitude]
        || ![v4 hasMagnitude]
        || (double magnitude = self->_magnitude, [v4 magnitude], magnitude == v7))
      {
        int v8 = [(_INPBSpeedValue *)self hasUnit];
        if (v8 == [v4 hasUnit])
        {
          if (![(_INPBSpeedValue *)self hasUnit]
            || ![v4 hasUnit]
            || (int unit = self->_unit, unit == [v4 unit]))
          {
            v10 = [(_INPBSpeedValue *)self valueMetadata];
            v11 = [v4 valueMetadata];
            v12 = v11;
            if ((v10 == 0) != (v11 != 0))
            {
              uint64_t v13 = [(_INPBSpeedValue *)self valueMetadata];
              if (!v13)
              {

LABEL_18:
                BOOL v18 = 1;
                goto LABEL_16;
              }
              v14 = (void *)v13;
              v15 = [(_INPBSpeedValue *)self valueMetadata];
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
  int v5 = [+[_INPBSpeedValue allocWithZone:](_INPBSpeedValue, "allocWithZone:") init];
  if ([(_INPBSpeedValue *)self hasMagnitude])
  {
    [(_INPBSpeedValue *)self magnitude];
    -[_INPBSpeedValue setMagnitude:](v5, "setMagnitude:");
  }
  if ([(_INPBSpeedValue *)self hasUnit]) {
    [(_INPBSpeedValue *)v5 setUnit:[(_INPBSpeedValue *)self unit]];
  }
  id v6 = [(_INPBValueMetadata *)self->_valueMetadata copyWithZone:a3];
  [(_INPBSpeedValue *)v5 setValueMetadata:v6];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSpeedValue *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSpeedValue)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSpeedValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        int v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSpeedValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSpeedValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if ([(_INPBSpeedValue *)self hasMagnitude]) {
    PBDataWriterWriteDoubleField();
  }
  if ([(_INPBSpeedValue *)self hasUnit]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_INPBSpeedValue *)self valueMetadata];

  int v5 = v7;
  if (v4)
  {
    id v6 = [(_INPBSpeedValue *)self valueMetadata];
    PBDataWriterWriteSubmessage();

    int v5 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSpeedValueReadFrom(self, (uint64_t)a3);
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
  if ([v3 isEqualToString:@"UNKNOWN_SPEED_UNIT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"METER_PER_SECOND"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"KILOMETER_PER_HOUR"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MILE_PER_HOUR"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"KNOTS"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)unitAsString:(int)a3
{
  if (a3 >= 5)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551FAE8 + a3);
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