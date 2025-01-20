@interface _INPBCreateTimerIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasDuration;
- (BOOL)hasIntentMetadata;
- (BOOL)hasLabel;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBCreateTimerIntent)initWithCoder:(id)a3;
- (_INPBDataString)label;
- (_INPBIntentMetadata)intentMetadata;
- (double)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDuration:(double)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setLabel:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBCreateTimerIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

- (int)type
{
  return self->_type;
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
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBCreateTimerIntent *)self hasDuration])
  {
    v4 = NSNumber;
    [(_INPBCreateTimerIntent *)self duration];
    v5 = objc_msgSend(v4, "numberWithDouble:");
    [v3 setObject:v5 forKeyedSubscript:@"duration"];
  }
  v6 = [(_INPBCreateTimerIntent *)self intentMetadata];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"intentMetadata"];

  v8 = [(_INPBCreateTimerIntent *)self label];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"label"];

  if ([(_INPBCreateTimerIntent *)self hasType])
  {
    uint64_t v10 = [(_INPBCreateTimerIntent *)self type];
    if (v10 >= 3)
    {
      v11 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
    }
    else
    {
      v11 = *(&off_1E551E6F8 + v10);
    }
    [v3 setObject:v11 forKeyedSubscript:@"type"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBCreateTimerIntent *)self hasDuration])
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
  if ([(_INPBCreateTimerIntent *)self hasType]) {
    uint64_t v10 = 2654435761 * self->_type;
  }
  else {
    uint64_t v10 = 0;
  }
  return v8 ^ v7 ^ v9 ^ v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  int v5 = [(_INPBCreateTimerIntent *)self hasDuration];
  if (v5 != [v4 hasDuration]) {
    goto LABEL_16;
  }
  if ([(_INPBCreateTimerIntent *)self hasDuration])
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
  unint64_t v8 = [(_INPBCreateTimerIntent *)self intentMetadata];
  unint64_t v9 = [v4 intentMetadata];
  if ((v8 == 0) == (v9 != 0)) {
    goto LABEL_15;
  }
  uint64_t v10 = [(_INPBCreateTimerIntent *)self intentMetadata];
  if (v10)
  {
    v11 = (void *)v10;
    v12 = [(_INPBCreateTimerIntent *)self intentMetadata];
    v13 = [v4 intentMetadata];
    int v14 = [v12 isEqual:v13];

    if (!v14) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  unint64_t v8 = [(_INPBCreateTimerIntent *)self label];
  unint64_t v9 = [v4 label];
  if ((v8 == 0) == (v9 != 0))
  {
LABEL_15:

    goto LABEL_16;
  }
  uint64_t v15 = [(_INPBCreateTimerIntent *)self label];
  if (v15)
  {
    v16 = (void *)v15;
    v17 = [(_INPBCreateTimerIntent *)self label];
    v18 = [v4 label];
    int v19 = [v17 isEqual:v18];

    if (!v19) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  int v22 = [(_INPBCreateTimerIntent *)self hasType];
  if (v22 == [v4 hasType])
  {
    if (![(_INPBCreateTimerIntent *)self hasType]
      || ![v4 hasType]
      || (int type = self->_type, type == [v4 type]))
    {
      BOOL v20 = 1;
      goto LABEL_17;
    }
  }
LABEL_16:
  BOOL v20 = 0;
LABEL_17:

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBCreateTimerIntent allocWithZone:](_INPBCreateTimerIntent, "allocWithZone:") init];
  if ([(_INPBCreateTimerIntent *)self hasDuration])
  {
    [(_INPBCreateTimerIntent *)self duration];
    -[_INPBCreateTimerIntent setDuration:](v5, "setDuration:");
  }
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBCreateTimerIntent *)v5 setIntentMetadata:v6];

  id v7 = [(_INPBDataString *)self->_label copyWithZone:a3];
  [(_INPBCreateTimerIntent *)v5 setLabel:v7];

  if ([(_INPBCreateTimerIntent *)self hasType]) {
    [(_INPBCreateTimerIntent *)v5 setType:[(_INPBCreateTimerIntent *)self type]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBCreateTimerIntent *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBCreateTimerIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBCreateTimerIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        unint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBCreateTimerIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBCreateTimerIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  if ([(_INPBCreateTimerIntent *)self hasDuration]) {
    PBDataWriterWriteDoubleField();
  }
  id v4 = [(_INPBCreateTimerIntent *)self intentMetadata];

  if (v4)
  {
    int v5 = [(_INPBCreateTimerIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBCreateTimerIntent *)self label];

  if (v6)
  {
    uint64_t v7 = [(_INPBCreateTimerIntent *)self label];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBCreateTimerIntent *)self hasType]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCreateTimerIntentReadFrom(self, (uint64_t)a3);
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
    id v3 = *(&off_1E551E6F8 + a3);
  }

  return v3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
    self->_int type = a3;
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