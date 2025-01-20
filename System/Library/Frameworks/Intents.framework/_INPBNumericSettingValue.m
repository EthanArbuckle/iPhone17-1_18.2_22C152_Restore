@interface _INPBNumericSettingValue
+ (BOOL)supportsSecureCoding;
- (BOOL)hasUnit;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBNumericSettingValue)initWithCoder:(id)a3;
- (double)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)unitAsString:(int)a3;
- (int)StringAsUnit:(id)a3;
- (int)unit;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasUnit:(BOOL)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setUnit:(int)a3;
- (void)setValue:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBNumericSettingValue

- (double)value
{
  return self->_value;
}

- (int)unit
{
  return self->_unit;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBNumericSettingValue *)self hasUnit])
  {
    uint64_t v4 = [(_INPBNumericSettingValue *)self unit];
    if (v4 == 1)
    {
      v5 = @"PERCENTAGE";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v5 forKeyedSubscript:@"unit"];
  }
  if ([(_INPBNumericSettingValue *)self hasValue])
  {
    v6 = NSNumber;
    [(_INPBNumericSettingValue *)self value];
    v7 = objc_msgSend(v6, "numberWithDouble:");
    [v3 setObject:v7 forKeyedSubscript:@"value"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBNumericSettingValue *)self hasUnit]) {
    uint64_t v3 = 2654435761 * self->_unit;
  }
  else {
    uint64_t v3 = 0;
  }
  if ([(_INPBNumericSettingValue *)self hasValue])
  {
    double value = self->_value;
    double v5 = -value;
    if (value >= 0.0) {
      double v5 = self->_value;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v8 += (unint64_t)v7;
      }
    }
    else
    {
      v8 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  return v8 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v8 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int v5 = [(_INPBNumericSettingValue *)self hasUnit];
    if (v5 == [v4 hasUnit])
    {
      if (![(_INPBNumericSettingValue *)self hasUnit]
        || ![v4 hasUnit]
        || (int unit = self->_unit, unit == [v4 unit]))
      {
        int v7 = [(_INPBNumericSettingValue *)self hasValue];
        if (v7 == [v4 hasValue])
        {
          if (![(_INPBNumericSettingValue *)self hasValue]
            || ![v4 hasValue]
            || (double value = self->_value, [v4 value], value == v11))
          {
            BOOL v8 = 1;
          }
        }
      }
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[_INPBNumericSettingValue allocWithZone:a3] init];
  if ([(_INPBNumericSettingValue *)self hasUnit]) {
    [(_INPBNumericSettingValue *)v4 setUnit:[(_INPBNumericSettingValue *)self unit]];
  }
  if ([(_INPBNumericSettingValue *)self hasValue])
  {
    [(_INPBNumericSettingValue *)self value];
    -[_INPBNumericSettingValue setValue:](v4, "setValue:");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBNumericSettingValue *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBNumericSettingValue)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBNumericSettingValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        BOOL v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBNumericSettingValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBNumericSettingValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ([(_INPBNumericSettingValue *)self hasUnit]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBNumericSettingValue *)self hasValue]) {
    PBDataWriterWriteDoubleField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBNumericSettingValueReadFrom(self, (uint64_t)a3);
}

- (void)setHasValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setValue:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double value = a3;
}

- (int)StringAsUnit:(id)a3
{
  return 1;
}

- (id)unitAsString:(int)a3
{
  if (a3 == 1)
  {
    id v4 = @"PERCENTAGE";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasUnit:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUnit
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setUnit:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int unit = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end