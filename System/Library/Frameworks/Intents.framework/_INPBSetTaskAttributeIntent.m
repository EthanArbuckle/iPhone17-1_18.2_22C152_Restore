@interface _INPBSetTaskAttributeIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasContactEventTrigger;
- (BOOL)hasIntentMetadata;
- (BOOL)hasPriority;
- (BOOL)hasSpatialEventTrigger;
- (BOOL)hasStatus;
- (BOOL)hasTargetTask;
- (BOOL)hasTaskTitle;
- (BOOL)hasTemporalEventTrigger;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBContactEventTrigger)contactEventTrigger;
- (_INPBDataString)taskTitle;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBSetTaskAttributeIntent)initWithCoder:(id)a3;
- (_INPBSpatialEventTrigger)spatialEventTrigger;
- (_INPBTask)targetTask;
- (_INPBTemporalEventTrigger)temporalEventTrigger;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)priorityAsString:(int)a3;
- (id)statusAsString:(int)a3;
- (int)StringAsPriority:(id)a3;
- (int)StringAsStatus:(id)a3;
- (int)priority;
- (int)status;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setContactEventTrigger:(id)a3;
- (void)setHasPriority:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setPriority:(int)a3;
- (void)setSpatialEventTrigger:(id)a3;
- (void)setStatus:(int)a3;
- (void)setTargetTask:(id)a3;
- (void)setTaskTitle:(id)a3;
- (void)setTemporalEventTrigger:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSetTaskAttributeIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporalEventTrigger, 0);
  objc_storeStrong((id *)&self->_taskTitle, 0);
  objc_storeStrong((id *)&self->_targetTask, 0);
  objc_storeStrong((id *)&self->_spatialEventTrigger, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);

  objc_storeStrong((id *)&self->_contactEventTrigger, 0);
}

- (_INPBTemporalEventTrigger)temporalEventTrigger
{
  return self->_temporalEventTrigger;
}

- (_INPBDataString)taskTitle
{
  return self->_taskTitle;
}

- (_INPBTask)targetTask
{
  return self->_targetTask;
}

- (int)status
{
  return self->_status;
}

- (_INPBSpatialEventTrigger)spatialEventTrigger
{
  return self->_spatialEventTrigger;
}

- (int)priority
{
  return self->_priority;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBContactEventTrigger)contactEventTrigger
{
  return self->_contactEventTrigger;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBSetTaskAttributeIntent *)self contactEventTrigger];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"contactEventTrigger"];

  v6 = [(_INPBSetTaskAttributeIntent *)self intentMetadata];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"intentMetadata"];

  if ([(_INPBSetTaskAttributeIntent *)self hasPriority])
  {
    uint64_t v8 = [(_INPBSetTaskAttributeIntent *)self priority];
    if (v8 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E5515E30[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"priority"];
  }
  v10 = [(_INPBSetTaskAttributeIntent *)self spatialEventTrigger];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"spatialEventTrigger"];

  if ([(_INPBSetTaskAttributeIntent *)self hasStatus])
  {
    uint64_t v12 = [(_INPBSetTaskAttributeIntent *)self status];
    if (v12)
    {
      if (v12 == 20)
      {
        v13 = @"COMPLETED";
      }
      else if (v12 == 10)
      {
        v13 = @"NOT_COMPLETED";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v12);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v13 = @"UNKNOWN_STATUS";
    }
    [v3 setObject:v13 forKeyedSubscript:@"status"];
  }
  v14 = [(_INPBSetTaskAttributeIntent *)self targetTask];
  v15 = [v14 dictionaryRepresentation];
  [v3 setObject:v15 forKeyedSubscript:@"targetTask"];

  v16 = [(_INPBSetTaskAttributeIntent *)self taskTitle];
  v17 = [v16 dictionaryRepresentation];
  [v3 setObject:v17 forKeyedSubscript:@"taskTitle"];

  v18 = [(_INPBSetTaskAttributeIntent *)self temporalEventTrigger];
  v19 = [v18 dictionaryRepresentation];
  [v3 setObject:v19 forKeyedSubscript:@"temporalEventTrigger"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBContactEventTrigger *)self->_contactEventTrigger hash];
  unint64_t v4 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  if ([(_INPBSetTaskAttributeIntent *)self hasPriority]) {
    uint64_t v5 = 2654435761 * self->_priority;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = [(_INPBSpatialEventTrigger *)self->_spatialEventTrigger hash];
  if ([(_INPBSetTaskAttributeIntent *)self hasStatus]) {
    uint64_t v7 = 2654435761 * self->_status;
  }
  else {
    uint64_t v7 = 0;
  }
  unint64_t v8 = v4 ^ v3 ^ v5 ^ v6;
  unint64_t v9 = v7 ^ [(_INPBTask *)self->_targetTask hash];
  unint64_t v10 = v8 ^ v9 ^ [(_INPBDataString *)self->_taskTitle hash];
  return v10 ^ [(_INPBTemporalEventTrigger *)self->_temporalEventTrigger hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_40;
  }
  uint64_t v5 = [(_INPBSetTaskAttributeIntent *)self contactEventTrigger];
  unint64_t v6 = [v4 contactEventTrigger];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_39;
  }
  uint64_t v7 = [(_INPBSetTaskAttributeIntent *)self contactEventTrigger];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(_INPBSetTaskAttributeIntent *)self contactEventTrigger];
    unint64_t v10 = [v4 contactEventTrigger];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_40;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBSetTaskAttributeIntent *)self intentMetadata];
  unint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_39;
  }
  uint64_t v12 = [(_INPBSetTaskAttributeIntent *)self intentMetadata];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBSetTaskAttributeIntent *)self intentMetadata];
    v15 = [v4 intentMetadata];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_40;
    }
  }
  else
  {
  }
  int v17 = [(_INPBSetTaskAttributeIntent *)self hasPriority];
  if (v17 != [v4 hasPriority]) {
    goto LABEL_40;
  }
  if ([(_INPBSetTaskAttributeIntent *)self hasPriority])
  {
    if ([v4 hasPriority])
    {
      int priority = self->_priority;
      if (priority != [v4 priority]) {
        goto LABEL_40;
      }
    }
  }
  uint64_t v5 = [(_INPBSetTaskAttributeIntent *)self spatialEventTrigger];
  unint64_t v6 = [v4 spatialEventTrigger];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_39;
  }
  uint64_t v19 = [(_INPBSetTaskAttributeIntent *)self spatialEventTrigger];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(_INPBSetTaskAttributeIntent *)self spatialEventTrigger];
    v22 = [v4 spatialEventTrigger];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_40;
    }
  }
  else
  {
  }
  int v24 = [(_INPBSetTaskAttributeIntent *)self hasStatus];
  if (v24 != [v4 hasStatus]) {
    goto LABEL_40;
  }
  if ([(_INPBSetTaskAttributeIntent *)self hasStatus])
  {
    if ([v4 hasStatus])
    {
      int status = self->_status;
      if (status != [v4 status]) {
        goto LABEL_40;
      }
    }
  }
  uint64_t v5 = [(_INPBSetTaskAttributeIntent *)self targetTask];
  unint64_t v6 = [v4 targetTask];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_39;
  }
  uint64_t v26 = [(_INPBSetTaskAttributeIntent *)self targetTask];
  if (v26)
  {
    v27 = (void *)v26;
    v28 = [(_INPBSetTaskAttributeIntent *)self targetTask];
    v29 = [v4 targetTask];
    int v30 = [v28 isEqual:v29];

    if (!v30) {
      goto LABEL_40;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBSetTaskAttributeIntent *)self taskTitle];
  unint64_t v6 = [v4 taskTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_39;
  }
  uint64_t v31 = [(_INPBSetTaskAttributeIntent *)self taskTitle];
  if (v31)
  {
    v32 = (void *)v31;
    v33 = [(_INPBSetTaskAttributeIntent *)self taskTitle];
    v34 = [v4 taskTitle];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_40;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBSetTaskAttributeIntent *)self temporalEventTrigger];
  unint64_t v6 = [v4 temporalEventTrigger];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v36 = [(_INPBSetTaskAttributeIntent *)self temporalEventTrigger];
    if (!v36)
    {

LABEL_43:
      BOOL v41 = 1;
      goto LABEL_41;
    }
    v37 = (void *)v36;
    v38 = [(_INPBSetTaskAttributeIntent *)self temporalEventTrigger];
    v39 = [v4 temporalEventTrigger];
    char v40 = [v38 isEqual:v39];

    if (v40) {
      goto LABEL_43;
    }
  }
  else
  {
LABEL_39:
  }
LABEL_40:
  BOOL v41 = 0;
LABEL_41:

  return v41;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBSetTaskAttributeIntent allocWithZone:](_INPBSetTaskAttributeIntent, "allocWithZone:") init];
  id v6 = [(_INPBContactEventTrigger *)self->_contactEventTrigger copyWithZone:a3];
  [(_INPBSetTaskAttributeIntent *)v5 setContactEventTrigger:v6];

  id v7 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBSetTaskAttributeIntent *)v5 setIntentMetadata:v7];

  if ([(_INPBSetTaskAttributeIntent *)self hasPriority]) {
    [(_INPBSetTaskAttributeIntent *)v5 setPriority:[(_INPBSetTaskAttributeIntent *)self priority]];
  }
  id v8 = [(_INPBSpatialEventTrigger *)self->_spatialEventTrigger copyWithZone:a3];
  [(_INPBSetTaskAttributeIntent *)v5 setSpatialEventTrigger:v8];

  if ([(_INPBSetTaskAttributeIntent *)self hasStatus]) {
    [(_INPBSetTaskAttributeIntent *)v5 setStatus:[(_INPBSetTaskAttributeIntent *)self status]];
  }
  id v9 = [(_INPBTask *)self->_targetTask copyWithZone:a3];
  [(_INPBSetTaskAttributeIntent *)v5 setTargetTask:v9];

  id v10 = [(_INPBDataString *)self->_taskTitle copyWithZone:a3];
  [(_INPBSetTaskAttributeIntent *)v5 setTaskTitle:v10];

  id v11 = [(_INPBTemporalEventTrigger *)self->_temporalEventTrigger copyWithZone:a3];
  [(_INPBSetTaskAttributeIntent *)v5 setTemporalEventTrigger:v11];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSetTaskAttributeIntent *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSetTaskAttributeIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSetTaskAttributeIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSetTaskAttributeIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSetTaskAttributeIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v17 = a3;
  id v4 = [(_INPBSetTaskAttributeIntent *)self contactEventTrigger];

  if (v4)
  {
    uint64_t v5 = [(_INPBSetTaskAttributeIntent *)self contactEventTrigger];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBSetTaskAttributeIntent *)self intentMetadata];

  if (v6)
  {
    uint64_t v7 = [(_INPBSetTaskAttributeIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBSetTaskAttributeIntent *)self hasPriority]) {
    PBDataWriterWriteInt32Field();
  }
  id v8 = [(_INPBSetTaskAttributeIntent *)self spatialEventTrigger];

  if (v8)
  {
    id v9 = [(_INPBSetTaskAttributeIntent *)self spatialEventTrigger];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBSetTaskAttributeIntent *)self hasStatus]) {
    PBDataWriterWriteInt32Field();
  }
  id v10 = [(_INPBSetTaskAttributeIntent *)self targetTask];

  if (v10)
  {
    id v11 = [(_INPBSetTaskAttributeIntent *)self targetTask];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v12 = [(_INPBSetTaskAttributeIntent *)self taskTitle];

  if (v12)
  {
    v13 = [(_INPBSetTaskAttributeIntent *)self taskTitle];
    PBDataWriterWriteSubmessage();
  }
  v14 = [(_INPBSetTaskAttributeIntent *)self temporalEventTrigger];

  v15 = v17;
  if (v14)
  {
    int v16 = [(_INPBSetTaskAttributeIntent *)self temporalEventTrigger];
    PBDataWriterWriteSubmessage();

    v15 = v17;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetTaskAttributeIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTemporalEventTrigger
{
  return self->_temporalEventTrigger != 0;
}

- (void)setTemporalEventTrigger:(id)a3
{
}

- (BOOL)hasTaskTitle
{
  return self->_taskTitle != 0;
}

- (void)setTaskTitle:(id)a3
{
}

- (BOOL)hasTargetTask
{
  return self->_targetTask != 0;
}

- (void)setTargetTask:(id)a3
{
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_STATUS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NOT_COMPLETED"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"COMPLETED"])
  {
    int v4 = 20;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)statusAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 20)
    {
      int v4 = @"COMPLETED";
    }
    else if (a3 == 10)
    {
      int v4 = @"NOT_COMPLETED";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"UNKNOWN_STATUS";
  }
  return v4;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setStatus:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
    self->_int status = a3;
  }
}

- (BOOL)hasSpatialEventTrigger
{
  return self->_spatialEventTrigger != 0;
}

- (void)setSpatialEventTrigger:(id)a3
{
}

- (int)StringAsPriority:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_PRIORITY"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NOT_FLAGGED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FLAGGED"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)priorityAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5515E30[a3];
  }

  return v3;
}

- (void)setHasPriority:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPriority
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPriority:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int priority = a3;
  }
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (BOOL)hasContactEventTrigger
{
  return self->_contactEventTrigger != 0;
}

- (void)setContactEventTrigger:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end