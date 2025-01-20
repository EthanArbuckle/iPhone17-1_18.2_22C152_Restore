@interface _INPBPauseTimerIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIntentMetadata;
- (BOOL)hasPauseMultiple;
- (BOOL)hasTargetTimer;
- (BOOL)isEqual:(id)a3;
- (BOOL)pauseMultiple;
- (BOOL)readFrom:(id)a3;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBPauseTimerIntent)initWithCoder:(id)a3;
- (_INPBTimer)targetTimer;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasPauseMultiple:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setPauseMultiple:(BOOL)a3;
- (void)setTargetTimer:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBPauseTimerIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetTimer, 0);

  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

- (_INPBTimer)targetTimer
{
  return self->_targetTimer;
}

- (BOOL)pauseMultiple
{
  return self->_pauseMultiple;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBPauseTimerIntent *)self intentMetadata];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"intentMetadata"];

  if ([(_INPBPauseTimerIntent *)self hasPauseMultiple])
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBPauseTimerIntent pauseMultiple](self, "pauseMultiple"));
    [v3 setObject:v6 forKeyedSubscript:@"pauseMultiple"];
  }
  v7 = [(_INPBPauseTimerIntent *)self targetTimer];
  v8 = [v7 dictionaryRepresentation];
  [v3 setObject:v8 forKeyedSubscript:@"targetTimer"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  if ([(_INPBPauseTimerIntent *)self hasPauseMultiple]) {
    uint64_t v4 = 2654435761 * self->_pauseMultiple;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(_INPBTimer *)self->_targetTimer hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  v5 = [(_INPBPauseTimerIntent *)self intentMetadata];
  v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_15;
  }
  uint64_t v7 = [(_INPBPauseTimerIntent *)self intentMetadata];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBPauseTimerIntent *)self intentMetadata];
    v10 = [v4 intentMetadata];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  int v12 = [(_INPBPauseTimerIntent *)self hasPauseMultiple];
  if (v12 != [v4 hasPauseMultiple]) {
    goto LABEL_16;
  }
  if ([(_INPBPauseTimerIntent *)self hasPauseMultiple])
  {
    if ([v4 hasPauseMultiple])
    {
      int pauseMultiple = self->_pauseMultiple;
      if (pauseMultiple != [v4 pauseMultiple]) {
        goto LABEL_16;
      }
    }
  }
  v5 = [(_INPBPauseTimerIntent *)self targetTimer];
  v6 = [v4 targetTimer];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v14 = [(_INPBPauseTimerIntent *)self targetTimer];
    if (!v14)
    {

LABEL_19:
      BOOL v19 = 1;
      goto LABEL_17;
    }
    v15 = (void *)v14;
    v16 = [(_INPBPauseTimerIntent *)self targetTimer];
    v17 = [v4 targetTimer];
    char v18 = [v16 isEqual:v17];

    if (v18) {
      goto LABEL_19;
    }
  }
  else
  {
LABEL_15:
  }
LABEL_16:
  BOOL v19 = 0;
LABEL_17:

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBPauseTimerIntent allocWithZone:](_INPBPauseTimerIntent, "allocWithZone:") init];
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBPauseTimerIntent *)v5 setIntentMetadata:v6];

  if ([(_INPBPauseTimerIntent *)self hasPauseMultiple]) {
    [(_INPBPauseTimerIntent *)v5 setPauseMultiple:[(_INPBPauseTimerIntent *)self pauseMultiple]];
  }
  id v7 = [(_INPBTimer *)self->_targetTimer copyWithZone:a3];
  [(_INPBPauseTimerIntent *)v5 setTargetTimer:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBPauseTimerIntent *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBPauseTimerIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBPauseTimerIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBPauseTimerIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBPauseTimerIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  id v4 = [(_INPBPauseTimerIntent *)self intentMetadata];

  if (v4)
  {
    v5 = [(_INPBPauseTimerIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBPauseTimerIntent *)self hasPauseMultiple]) {
    PBDataWriterWriteBOOLField();
  }
  id v6 = [(_INPBPauseTimerIntent *)self targetTimer];

  uint64_t v7 = v9;
  if (v6)
  {
    v8 = [(_INPBPauseTimerIntent *)self targetTimer];
    PBDataWriterWriteSubmessage();

    uint64_t v7 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPauseTimerIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTargetTimer
{
  return self->_targetTimer != 0;
}

- (void)setTargetTimer:(id)a3
{
}

- (void)setHasPauseMultiple:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPauseMultiple
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPauseMultiple:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int pauseMultiple = a3;
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