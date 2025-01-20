@interface _INPBDeleteTimerIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)deleteMultiple;
- (BOOL)hasDeleteMultiple;
- (BOOL)hasIntentMetadata;
- (BOOL)hasTargetTimer;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBDeleteTimerIntent)initWithCoder:(id)a3;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBTimer)targetTimer;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDeleteMultiple:(BOOL)a3;
- (void)setHasDeleteMultiple:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setTargetTimer:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBDeleteTimerIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetTimer, 0);

  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

- (_INPBTimer)targetTimer
{
  return self->_targetTimer;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (BOOL)deleteMultiple
{
  return self->_deleteMultiple;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBDeleteTimerIntent *)self hasDeleteMultiple])
  {
    v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBDeleteTimerIntent deleteMultiple](self, "deleteMultiple"));
    [v3 setObject:v4 forKeyedSubscript:@"deleteMultiple"];
  }
  v5 = [(_INPBDeleteTimerIntent *)self intentMetadata];
  v6 = [v5 dictionaryRepresentation];
  [v3 setObject:v6 forKeyedSubscript:@"intentMetadata"];

  v7 = [(_INPBDeleteTimerIntent *)self targetTimer];
  v8 = [v7 dictionaryRepresentation];
  [v3 setObject:v8 forKeyedSubscript:@"targetTimer"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBDeleteTimerIntent *)self hasDeleteMultiple]) {
    uint64_t v3 = 2654435761 * self->_deleteMultiple;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(_INPBIntentMetadata *)self->_intentMetadata hash] ^ v3;
  return v4 ^ [(_INPBTimer *)self->_targetTimer hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  int v5 = [(_INPBDeleteTimerIntent *)self hasDeleteMultiple];
  if (v5 != [v4 hasDeleteMultiple]) {
    goto LABEL_16;
  }
  if ([(_INPBDeleteTimerIntent *)self hasDeleteMultiple])
  {
    if ([v4 hasDeleteMultiple])
    {
      int deleteMultiple = self->_deleteMultiple;
      if (deleteMultiple != [v4 deleteMultiple]) {
        goto LABEL_16;
      }
    }
  }
  v7 = [(_INPBDeleteTimerIntent *)self intentMetadata];
  v8 = [v4 intentMetadata];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_15;
  }
  uint64_t v9 = [(_INPBDeleteTimerIntent *)self intentMetadata];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(_INPBDeleteTimerIntent *)self intentMetadata];
    v12 = [v4 intentMetadata];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  v7 = [(_INPBDeleteTimerIntent *)self targetTimer];
  v8 = [v4 targetTimer];
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v14 = [(_INPBDeleteTimerIntent *)self targetTimer];
    if (!v14)
    {

LABEL_19:
      BOOL v19 = 1;
      goto LABEL_17;
    }
    v15 = (void *)v14;
    v16 = [(_INPBDeleteTimerIntent *)self targetTimer];
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
  int v5 = [+[_INPBDeleteTimerIntent allocWithZone:](_INPBDeleteTimerIntent, "allocWithZone:") init];
  if ([(_INPBDeleteTimerIntent *)self hasDeleteMultiple]) {
    [(_INPBDeleteTimerIntent *)v5 setDeleteMultiple:[(_INPBDeleteTimerIntent *)self deleteMultiple]];
  }
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBDeleteTimerIntent *)v5 setIntentMetadata:v6];

  id v7 = [(_INPBTimer *)self->_targetTimer copyWithZone:a3];
  [(_INPBDeleteTimerIntent *)v5 setTargetTimer:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBDeleteTimerIntent *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBDeleteTimerIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBDeleteTimerIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBDeleteTimerIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBDeleteTimerIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  if ([(_INPBDeleteTimerIntent *)self hasDeleteMultiple]) {
    PBDataWriterWriteBOOLField();
  }
  id v4 = [(_INPBDeleteTimerIntent *)self intentMetadata];

  if (v4)
  {
    int v5 = [(_INPBDeleteTimerIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBDeleteTimerIntent *)self targetTimer];

  uint64_t v7 = v9;
  if (v6)
  {
    v8 = [(_INPBDeleteTimerIntent *)self targetTimer];
    PBDataWriterWriteSubmessage();

    uint64_t v7 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBDeleteTimerIntentReadFrom(self, (uint64_t)a3);
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

- (void)setHasDeleteMultiple:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeleteMultiple
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDeleteMultiple:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int deleteMultiple = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end