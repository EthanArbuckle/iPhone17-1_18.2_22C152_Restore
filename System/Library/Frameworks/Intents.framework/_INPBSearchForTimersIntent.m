@interface _INPBSearchForTimersIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasDuration;
- (BOOL)hasIntentMetadata;
- (BOOL)hasLabel;
- (BOOL)hasState;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBDataString)label;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBSearchForTimersIntent)initWithCoder:(id)a3;
- (double)duration;
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
- (void)setHasState:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setLabel:(id)a3;
- (void)setState:(int)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSearchForTimersIntent

- (id)typeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E551E2B0[a3];
  }

  return v3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

- (int)type
{
  return self->_type;
}

- (int)state
{
  return self->_state;
}

- (_INPBDataString)label
{
  return self->_label;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (double)duration
{
  return self->_duration;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBSearchForTimersIntent *)self hasDuration])
  {
    int v4 = NSNumber;
    [(_INPBSearchForTimersIntent *)self duration];
    v5 = objc_msgSend(v4, "numberWithDouble:");
    [v3 setObject:v5 forKeyedSubscript:@"duration"];
  }
  v6 = [(_INPBSearchForTimersIntent *)self intentMetadata];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"intentMetadata"];

  v8 = [(_INPBSearchForTimersIntent *)self label];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"label"];

  if ([(_INPBSearchForTimersIntent *)self hasState])
  {
    uint64_t v10 = [(_INPBSearchForTimersIntent *)self state];
    if (v10 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E551E298[v10];
    }
    [v3 setObject:v11 forKeyedSubscript:@"state"];
  }
  if ([(_INPBSearchForTimersIntent *)self hasType])
  {
    uint64_t v12 = [(_INPBSearchForTimersIntent *)self type];
    if (v12 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v12);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E551E2B0[v12];
    }
    [v3 setObject:v13 forKeyedSubscript:@"type"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBSearchForTimersIntent *)self hasDuration])
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
  unint64_t v8 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  unint64_t v9 = [(_INPBDataString *)self->_label hash];
  if ([(_INPBSearchForTimersIntent *)self hasState]) {
    uint64_t v10 = 2654435761 * self->_state;
  }
  else {
    uint64_t v10 = 0;
  }
  if ([(_INPBSearchForTimersIntent *)self hasType]) {
    uint64_t v11 = 2654435761 * self->_type;
  }
  else {
    uint64_t v11 = 0;
  }
  return v8 ^ v7 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  int v5 = [(_INPBSearchForTimersIntent *)self hasDuration];
  if (v5 != [v4 hasDuration]) {
    goto LABEL_16;
  }
  if ([(_INPBSearchForTimersIntent *)self hasDuration])
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
  unint64_t v8 = [(_INPBSearchForTimersIntent *)self intentMetadata];
  unint64_t v9 = [v4 intentMetadata];
  if ((v8 == 0) == (v9 != 0)) {
    goto LABEL_15;
  }
  uint64_t v10 = [(_INPBSearchForTimersIntent *)self intentMetadata];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    uint64_t v12 = [(_INPBSearchForTimersIntent *)self intentMetadata];
    v13 = [v4 intentMetadata];
    int v14 = [v12 isEqual:v13];

    if (!v14) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  unint64_t v8 = [(_INPBSearchForTimersIntent *)self label];
  unint64_t v9 = [v4 label];
  if ((v8 == 0) == (v9 != 0))
  {
LABEL_15:

    goto LABEL_16;
  }
  uint64_t v15 = [(_INPBSearchForTimersIntent *)self label];
  if (v15)
  {
    v16 = (void *)v15;
    v17 = [(_INPBSearchForTimersIntent *)self label];
    v18 = [v4 label];
    int v19 = [v17 isEqual:v18];

    if (!v19) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  int v22 = [(_INPBSearchForTimersIntent *)self hasState];
  if (v22 == [v4 hasState])
  {
    if (![(_INPBSearchForTimersIntent *)self hasState]
      || ![v4 hasState]
      || (int state = self->_state, state == [v4 state]))
    {
      int v24 = [(_INPBSearchForTimersIntent *)self hasType];
      if (v24 == [v4 hasType])
      {
        if (![(_INPBSearchForTimersIntent *)self hasType]
          || ![v4 hasType]
          || (int type = self->_type, type == [v4 type]))
        {
          BOOL v20 = 1;
          goto LABEL_17;
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
  int v5 = [+[_INPBSearchForTimersIntent allocWithZone:](_INPBSearchForTimersIntent, "allocWithZone:") init];
  if ([(_INPBSearchForTimersIntent *)self hasDuration])
  {
    [(_INPBSearchForTimersIntent *)self duration];
    -[_INPBSearchForTimersIntent setDuration:](v5, "setDuration:");
  }
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBSearchForTimersIntent *)v5 setIntentMetadata:v6];

  id v7 = [(_INPBDataString *)self->_label copyWithZone:a3];
  [(_INPBSearchForTimersIntent *)v5 setLabel:v7];

  if ([(_INPBSearchForTimersIntent *)self hasState]) {
    [(_INPBSearchForTimersIntent *)v5 setState:[(_INPBSearchForTimersIntent *)self state]];
  }
  if ([(_INPBSearchForTimersIntent *)self hasType]) {
    [(_INPBSearchForTimersIntent *)v5 setType:[(_INPBSearchForTimersIntent *)self type]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSearchForTimersIntent *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSearchForTimersIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSearchForTimersIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        unint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSearchForTimersIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSearchForTimersIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  if ([(_INPBSearchForTimersIntent *)self hasDuration]) {
    PBDataWriterWriteDoubleField();
  }
  id v4 = [(_INPBSearchForTimersIntent *)self intentMetadata];

  if (v4)
  {
    int v5 = [(_INPBSearchForTimersIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBSearchForTimersIntent *)self label];

  if (v6)
  {
    uint64_t v7 = [(_INPBSearchForTimersIntent *)self label];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBSearchForTimersIntent *)self hasState]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBSearchForTimersIntent *)self hasType]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSearchForTimersIntentReadFrom(self, (uint64_t)a3);
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

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFB;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 4;
    self->_int type = a3;
  }
}

- (id)stateAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E551E298[a3];
  }

  return v3;
}

- (void)setHasState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setState:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
    self->_int state = a3;
  }
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (void)setLabel:(id)a3
{
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
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