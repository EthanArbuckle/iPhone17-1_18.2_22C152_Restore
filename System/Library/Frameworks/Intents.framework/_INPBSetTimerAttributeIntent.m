@interface _INPBSetTimerAttributeIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIntentMetadata;
- (BOOL)hasTargetTimer;
- (BOOL)hasToDuration;
- (BOOL)hasToLabel;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBDataString)toLabel;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBSetTimerAttributeIntent)initWithCoder:(id)a3;
- (_INPBTimer)targetTimer;
- (double)toDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasToDuration:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setTargetTimer:(id)a3;
- (void)setToDuration:(double)a3;
- (void)setToLabel:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSetTimerAttributeIntent

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  v5 = [(_INPBSetTimerAttributeIntent *)self intentMetadata];
  v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_20;
  }
  uint64_t v7 = [(_INPBSetTimerAttributeIntent *)self intentMetadata];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBSetTimerAttributeIntent *)self intentMetadata];
    v10 = [v4 intentMetadata];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  v5 = [(_INPBSetTimerAttributeIntent *)self targetTimer];
  v6 = [v4 targetTimer];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_20;
  }
  uint64_t v12 = [(_INPBSetTimerAttributeIntent *)self targetTimer];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBSetTimerAttributeIntent *)self targetTimer];
    v15 = [v4 targetTimer];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  int v17 = [(_INPBSetTimerAttributeIntent *)self hasToDuration];
  if (v17 != [v4 hasToDuration]) {
    goto LABEL_21;
  }
  if ([(_INPBSetTimerAttributeIntent *)self hasToDuration])
  {
    if ([v4 hasToDuration])
    {
      double toDuration = self->_toDuration;
      [v4 toDuration];
      if (toDuration != v19) {
        goto LABEL_21;
      }
    }
  }
  v5 = [(_INPBSetTimerAttributeIntent *)self toLabel];
  v6 = [v4 toLabel];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v20 = [(_INPBSetTimerAttributeIntent *)self toLabel];
    if (!v20)
    {

LABEL_24:
      BOOL v25 = 1;
      goto LABEL_22;
    }
    v21 = (void *)v20;
    v22 = [(_INPBSetTimerAttributeIntent *)self toLabel];
    v23 = [v4 toLabel];
    char v24 = [v22 isEqual:v23];

    if (v24) {
      goto LABEL_24;
    }
  }
  else
  {
LABEL_20:
  }
LABEL_21:
  BOOL v25 = 0;
LABEL_22:

  return v25;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  unint64_t v4 = [(_INPBTimer *)self->_targetTimer hash];
  if ([(_INPBSetTimerAttributeIntent *)self hasToDuration])
  {
    double toDuration = self->_toDuration;
    double v6 = -toDuration;
    if (toDuration >= 0.0) {
      double v6 = self->_toDuration;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v9 += (unint64_t)v8;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  return v4 ^ v3 ^ v9 ^ [(_INPBDataString *)self->_toLabel hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toLabel, 0);
  objc_storeStrong((id *)&self->_targetTimer, 0);

  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

- (_INPBDataString)toLabel
{
  return self->_toLabel;
}

- (double)toDuration
{
  return self->_toDuration;
}

- (_INPBTimer)targetTimer
{
  return self->_targetTimer;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  unint64_t v4 = [(_INPBSetTimerAttributeIntent *)self intentMetadata];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"intentMetadata"];

  double v6 = [(_INPBSetTimerAttributeIntent *)self targetTimer];
  long double v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"targetTimer"];

  if ([(_INPBSetTimerAttributeIntent *)self hasToDuration])
  {
    double v8 = NSNumber;
    [(_INPBSetTimerAttributeIntent *)self toDuration];
    unint64_t v9 = objc_msgSend(v8, "numberWithDouble:");
    [v3 setObject:v9 forKeyedSubscript:@"toDuration"];
  }
  v10 = [(_INPBSetTimerAttributeIntent *)self toLabel];
  int v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"toLabel"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBSetTimerAttributeIntent allocWithZone:](_INPBSetTimerAttributeIntent, "allocWithZone:") init];
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBSetTimerAttributeIntent *)v5 setIntentMetadata:v6];

  id v7 = [(_INPBTimer *)self->_targetTimer copyWithZone:a3];
  [(_INPBSetTimerAttributeIntent *)v5 setTargetTimer:v7];

  if ([(_INPBSetTimerAttributeIntent *)self hasToDuration])
  {
    [(_INPBSetTimerAttributeIntent *)self toDuration];
    -[_INPBSetTimerAttributeIntent setToDuration:](v5, "setToDuration:");
  }
  id v8 = [(_INPBDataString *)self->_toLabel copyWithZone:a3];
  [(_INPBSetTimerAttributeIntent *)v5 setToLabel:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSetTimerAttributeIntent *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSetTimerAttributeIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSetTimerAttributeIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSetTimerAttributeIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSetTimerAttributeIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  id v4 = [(_INPBSetTimerAttributeIntent *)self intentMetadata];

  if (v4)
  {
    v5 = [(_INPBSetTimerAttributeIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBSetTimerAttributeIntent *)self targetTimer];

  if (v6)
  {
    uint64_t v7 = [(_INPBSetTimerAttributeIntent *)self targetTimer];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBSetTimerAttributeIntent *)self hasToDuration]) {
    PBDataWriterWriteDoubleField();
  }
  id v8 = [(_INPBSetTimerAttributeIntent *)self toLabel];

  unint64_t v9 = v11;
  if (v8)
  {
    v10 = [(_INPBSetTimerAttributeIntent *)self toLabel];
    PBDataWriterWriteSubmessage();

    unint64_t v9 = v11;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetTimerAttributeIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasToLabel
{
  return self->_toLabel != 0;
}

- (void)setToLabel:(id)a3
{
}

- (void)setHasToDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasToDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setToDuration:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double toDuration = a3;
}

- (BOOL)hasTargetTimer
{
  return self->_targetTimer != 0;
}

- (void)setTargetTimer:(id)a3
{
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end