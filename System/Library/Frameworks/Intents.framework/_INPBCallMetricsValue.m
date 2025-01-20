@interface _INPBCallMetricsValue
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCallDuration;
- (BOOL)hasTimeToEstablish;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBCallMetricsValue)initWithCoder:(id)a3;
- (double)callDuration;
- (double)timeToEstablish;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCallDuration:(double)a3;
- (void)setHasCallDuration:(BOOL)a3;
- (void)setHasTimeToEstablish:(BOOL)a3;
- (void)setTimeToEstablish:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBCallMetricsValue

- (double)timeToEstablish
{
  return self->_timeToEstablish;
}

- (double)callDuration
{
  return self->_callDuration;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBCallMetricsValue *)self hasCallDuration])
  {
    v4 = NSNumber;
    [(_INPBCallMetricsValue *)self callDuration];
    v5 = objc_msgSend(v4, "numberWithDouble:");
    [v3 setObject:v5 forKeyedSubscript:@"callDuration"];
  }
  if ([(_INPBCallMetricsValue *)self hasTimeToEstablish])
  {
    v6 = NSNumber;
    [(_INPBCallMetricsValue *)self timeToEstablish];
    v7 = objc_msgSend(v6, "numberWithDouble:");
    [v3 setObject:v7 forKeyedSubscript:@"timeToEstablish"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBCallMetricsValue *)self hasCallDuration])
  {
    double callDuration = self->_callDuration;
    double v4 = -callDuration;
    if (callDuration >= 0.0) {
      double v4 = self->_callDuration;
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
  if ([(_INPBCallMetricsValue *)self hasTimeToEstablish])
  {
    double timeToEstablish = self->_timeToEstablish;
    double v9 = -timeToEstablish;
    if (timeToEstablish >= 0.0) {
      double v9 = self->_timeToEstablish;
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
    int v5 = [(_INPBCallMetricsValue *)self hasCallDuration];
    if (v5 == [v4 hasCallDuration])
    {
      if (![(_INPBCallMetricsValue *)self hasCallDuration]
        || ![v4 hasCallDuration]
        || (double callDuration = self->_callDuration, [v4 callDuration], callDuration == v7))
      {
        int v8 = [(_INPBCallMetricsValue *)self hasTimeToEstablish];
        if (v8 == [v4 hasTimeToEstablish])
        {
          if (![(_INPBCallMetricsValue *)self hasTimeToEstablish]
            || ![v4 hasTimeToEstablish]
            || (double timeToEstablish = self->_timeToEstablish, [v4 timeToEstablish], timeToEstablish == v12))
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
  id v4 = [+[_INPBCallMetricsValue allocWithZone:a3] init];
  if ([(_INPBCallMetricsValue *)self hasCallDuration])
  {
    [(_INPBCallMetricsValue *)self callDuration];
    -[_INPBCallMetricsValue setCallDuration:](v4, "setCallDuration:");
  }
  if ([(_INPBCallMetricsValue *)self hasTimeToEstablish])
  {
    [(_INPBCallMetricsValue *)self timeToEstablish];
    -[_INPBCallMetricsValue setTimeToEstablish:](v4, "setTimeToEstablish:");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBCallMetricsValue *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBCallMetricsValue)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBCallMetricsValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        int v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBCallMetricsValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBCallMetricsValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ([(_INPBCallMetricsValue *)self hasCallDuration]) {
    PBDataWriterWriteDoubleField();
  }
  if ([(_INPBCallMetricsValue *)self hasTimeToEstablish]) {
    PBDataWriterWriteDoubleField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCallMetricsValueReadFrom(self, (uint64_t)a3);
}

- (void)setHasTimeToEstablish:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimeToEstablish
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTimeToEstablish:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double timeToEstablish = a3;
}

- (void)setHasCallDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCallDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCallDuration:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double callDuration = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end