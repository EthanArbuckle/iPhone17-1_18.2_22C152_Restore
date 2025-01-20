@interface _INPBHomeAttributeRange
+ (BOOL)supportsSecureCoding;
- (BOOL)hasLowerValue;
- (BOOL)hasUpperValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBHomeAttributeRange)initWithCoder:(id)a3;
- (double)lowerValue;
- (double)upperValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasLowerValue:(BOOL)a3;
- (void)setHasUpperValue:(BOOL)a3;
- (void)setLowerValue:(double)a3;
- (void)setUpperValue:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBHomeAttributeRange

- (double)upperValue
{
  return self->_upperValue;
}

- (double)lowerValue
{
  return self->_lowerValue;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBHomeAttributeRange *)self hasLowerValue])
  {
    v4 = NSNumber;
    [(_INPBHomeAttributeRange *)self lowerValue];
    v5 = objc_msgSend(v4, "numberWithDouble:");
    [v3 setObject:v5 forKeyedSubscript:@"lowerValue"];
  }
  if ([(_INPBHomeAttributeRange *)self hasUpperValue])
  {
    v6 = NSNumber;
    [(_INPBHomeAttributeRange *)self upperValue];
    v7 = objc_msgSend(v6, "numberWithDouble:");
    [v3 setObject:v7 forKeyedSubscript:@"upperValue"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBHomeAttributeRange *)self hasLowerValue])
  {
    double lowerValue = self->_lowerValue;
    double v4 = -lowerValue;
    if (lowerValue >= 0.0) {
      double v4 = self->_lowerValue;
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
  if ([(_INPBHomeAttributeRange *)self hasUpperValue])
  {
    double upperValue = self->_upperValue;
    double v9 = -upperValue;
    if (upperValue >= 0.0) {
      double v9 = self->_upperValue;
    }
    long double v10 = floor(v9 + 0.5);
    double v11 = (v9 - v10) * 1.84467441e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v12 += (unint64_t)v11;
      }
    }
    else
    {
      v12 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  return v12 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v9 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int v5 = [(_INPBHomeAttributeRange *)self hasLowerValue];
    if (v5 == [v4 hasLowerValue])
    {
      if (![(_INPBHomeAttributeRange *)self hasLowerValue]
        || ![v4 hasLowerValue]
        || (double lowerValue = self->_lowerValue, [v4 lowerValue], lowerValue == v7))
      {
        int v8 = [(_INPBHomeAttributeRange *)self hasUpperValue];
        if (v8 == [v4 hasUpperValue])
        {
          if (![(_INPBHomeAttributeRange *)self hasUpperValue]
            || ![v4 hasUpperValue]
            || (double upperValue = self->_upperValue, [v4 upperValue], upperValue == v12))
          {
            BOOL v9 = 1;
          }
        }
      }
    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[_INPBHomeAttributeRange allocWithZone:a3] init];
  if ([(_INPBHomeAttributeRange *)self hasLowerValue])
  {
    [(_INPBHomeAttributeRange *)self lowerValue];
    -[_INPBHomeAttributeRange setLowerValue:](v4, "setLowerValue:");
  }
  if ([(_INPBHomeAttributeRange *)self hasUpperValue])
  {
    [(_INPBHomeAttributeRange *)self upperValue];
    -[_INPBHomeAttributeRange setUpperValue:](v4, "setUpperValue:");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBHomeAttributeRange *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBHomeAttributeRange)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBHomeAttributeRange *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        int v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBHomeAttributeRange *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBHomeAttributeRange *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ([(_INPBHomeAttributeRange *)self hasLowerValue]) {
    PBDataWriterWriteDoubleField();
  }
  if ([(_INPBHomeAttributeRange *)self hasUpperValue]) {
    PBDataWriterWriteDoubleField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBHomeAttributeRangeReadFrom(self, (uint64_t)a3);
}

- (void)setHasUpperValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUpperValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setUpperValue:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double upperValue = a3;
}

- (void)setHasLowerValue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLowerValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLowerValue:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double lowerValue = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end