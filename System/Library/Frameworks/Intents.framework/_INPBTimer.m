@interface _INPBTimer
+ (BOOL)supportsSecureCoding;
- (BOOL)hasDuration;
- (BOOL)hasIdentifier;
- (BOOL)hasLabel;
- (BOOL)hasRemainingTime;
- (BOOL)hasState;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)identifier;
- (_INPBDataString)label;
- (_INPBTimer)initWithCoder:(id)a3;
- (double)duration;
- (double)remainingTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)stateAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsState:(id)a3;
- (int)StringAsType:(id)a3;
- (int)state;
- (int)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDuration:(double)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasRemainingTime:(BOOL)a3;
- (void)setHasState:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setLabel:(id)a3;
- (void)setRemainingTime:(double)a3;
- (void)setState:(int)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (int)type
{
  return self->_type;
}

- (int)state
{
  return self->_state;
}

- (double)remainingTime
{
  return self->_remainingTime;
}

- (_INPBDataString)label
{
  return self->_label;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)duration
{
  return self->_duration;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBTimer *)self hasDuration])
  {
    v4 = NSNumber;
    [(_INPBTimer *)self duration];
    v5 = objc_msgSend(v4, "numberWithDouble:");
    [v3 setObject:v5 forKeyedSubscript:@"duration"];
  }
  if (self->_identifier)
  {
    v6 = [(_INPBTimer *)self identifier];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"identifier"];
  }
  v8 = [(_INPBTimer *)self label];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"label"];

  if ([(_INPBTimer *)self hasRemainingTime])
  {
    v10 = NSNumber;
    [(_INPBTimer *)self remainingTime];
    v11 = objc_msgSend(v10, "numberWithDouble:");
    [v3 setObject:v11 forKeyedSubscript:@"remainingTime"];
  }
  if ([(_INPBTimer *)self hasState])
  {
    uint64_t v12 = [(_INPBTimer *)self state];
    if (v12 >= 3)
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v12);
    }
    else
    {
      v13 = *(&off_1E5519DE0 + v12);
    }
    [v3 setObject:v13 forKeyedSubscript:@"state"];
  }
  if ([(_INPBTimer *)self hasType])
  {
    uint64_t v14 = [(_INPBTimer *)self type];
    if (v14 >= 3)
    {
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v14);
    }
    else
    {
      v15 = *(&off_1E5519DF8 + v14);
    }
    [v3 setObject:v15 forKeyedSubscript:@"type"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBTimer *)self hasDuration])
  {
    double duration = self->_duration;
    double v4 = -duration;
    if (duration >= 0.0) {
      double v4 = self->_duration;
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
  NSUInteger v8 = [(NSString *)self->_identifier hash];
  unint64_t v9 = [(_INPBDataString *)self->_label hash];
  if ([(_INPBTimer *)self hasRemainingTime])
  {
    double remainingTime = self->_remainingTime;
    double v11 = -remainingTime;
    if (remainingTime >= 0.0) {
      double v11 = self->_remainingTime;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v14 += (unint64_t)v13;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ([(_INPBTimer *)self hasState]) {
    uint64_t v15 = 2654435761 * self->_state;
  }
  else {
    uint64_t v15 = 0;
  }
  if ([(_INPBTimer *)self hasType]) {
    uint64_t v16 = 2654435761 * self->_type;
  }
  else {
    uint64_t v16 = 0;
  }
  return v8 ^ v7 ^ v9 ^ v14 ^ v15 ^ v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  int v5 = [(_INPBTimer *)self hasDuration];
  if (v5 != [v4 hasDuration]) {
    goto LABEL_16;
  }
  if ([(_INPBTimer *)self hasDuration])
  {
    if ([v4 hasDuration])
    {
      double duration = self->_duration;
      [v4 duration];
      if (duration != v7) {
        goto LABEL_16;
      }
    }
  }
  NSUInteger v8 = [(_INPBTimer *)self identifier];
  unint64_t v9 = [v4 identifier];
  if ((v8 == 0) == (v9 != 0)) {
    goto LABEL_15;
  }
  uint64_t v10 = [(_INPBTimer *)self identifier];
  if (v10)
  {
    double v11 = (void *)v10;
    long double v12 = [(_INPBTimer *)self identifier];
    double v13 = [v4 identifier];
    int v14 = [v12 isEqual:v13];

    if (!v14) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  NSUInteger v8 = [(_INPBTimer *)self label];
  unint64_t v9 = [v4 label];
  if ((v8 == 0) == (v9 != 0))
  {
LABEL_15:

    goto LABEL_16;
  }
  uint64_t v15 = [(_INPBTimer *)self label];
  if (v15)
  {
    uint64_t v16 = (void *)v15;
    v17 = [(_INPBTimer *)self label];
    v18 = [v4 label];
    int v19 = [v17 isEqual:v18];

    if (!v19) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  int v22 = [(_INPBTimer *)self hasRemainingTime];
  if (v22 == [v4 hasRemainingTime])
  {
    if (![(_INPBTimer *)self hasRemainingTime]
      || ![v4 hasRemainingTime]
      || (double remainingTime = self->_remainingTime, [v4 remainingTime], remainingTime == v24))
    {
      int v25 = [(_INPBTimer *)self hasState];
      if (v25 == [v4 hasState])
      {
        if (![(_INPBTimer *)self hasState]
          || ![v4 hasState]
          || (int state = self->_state, state == [v4 state]))
        {
          int v27 = [(_INPBTimer *)self hasType];
          if (v27 == [v4 hasType])
          {
            if (![(_INPBTimer *)self hasType]
              || ![v4 hasType]
              || (int type = self->_type, type == [v4 type]))
            {
              BOOL v20 = 1;
              goto LABEL_17;
            }
          }
        }
      }
    }
  }
LABEL_16:
  BOOL v20 = 0;
LABEL_17:

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBTimer allocWithZone:](_INPBTimer, "allocWithZone:") init];
  if ([(_INPBTimer *)self hasDuration])
  {
    [(_INPBTimer *)self duration];
    -[_INPBTimer setDuration:](v5, "setDuration:");
  }
  double v6 = (void *)[(NSString *)self->_identifier copyWithZone:a3];
  [(_INPBTimer *)v5 setIdentifier:v6];

  id v7 = [(_INPBDataString *)self->_label copyWithZone:a3];
  [(_INPBTimer *)v5 setLabel:v7];

  if ([(_INPBTimer *)self hasRemainingTime])
  {
    [(_INPBTimer *)self remainingTime];
    -[_INPBTimer setRemainingTime:](v5, "setRemainingTime:");
  }
  if ([(_INPBTimer *)self hasState]) {
    [(_INPBTimer *)v5 setState:[(_INPBTimer *)self state]];
  }
  if ([(_INPBTimer *)self hasType]) {
    [(_INPBTimer *)v5 setType:[(_INPBTimer *)self type]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBTimer *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBTimer)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBTimer *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        NSUInteger v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBTimer *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBTimer *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if ([(_INPBTimer *)self hasDuration]) {
    PBDataWriterWriteDoubleField();
  }
  id v4 = [(_INPBTimer *)self identifier];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  int v5 = [(_INPBTimer *)self label];

  if (v5)
  {
    id v6 = [(_INPBTimer *)self label];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBTimer *)self hasRemainingTime]) {
    PBDataWriterWriteDoubleField();
  }
  if ([(_INPBTimer *)self hasState]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBTimer *)self hasType]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBTimerReadFrom(self, (uint64_t)a3);
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DEFAULT_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SLEEP_TIMER"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 3)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E5519DF8 + a3);
  }

  return v3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xF7;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 8;
    self->_int type = a3;
  }
}

- (int)StringAsState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TIMER_RUNNING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TIMER_PAUSED"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)stateAsString:(int)a3
{
  if (a3 >= 3)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E5519DE0 + a3);
  }

  return v3;
}

- (void)setHasState:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasState
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setState:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFB;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 4;
    self->_int state = a3;
  }
}

- (void)setHasRemainingTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRemainingTime
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRemainingTime:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double remainingTime = a3;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (void)setLabel:(id)a3
{
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setIdentifier:(id)a3
{
  int v4 = (NSString *)[a3 copy];
  identifier = self->_identifier;
  self->_identifier = v4;

  MEMORY[0x1F41817F8](v4, identifier);
}

- (void)setHasDuration:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDuration:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double duration = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end