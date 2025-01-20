@interface _INPBTask
+ (BOOL)supportsSecureCoding;
- (BOOL)hasContactEventTrigger;
- (BOOL)hasCreatedDateTime;
- (BOOL)hasIdentifier;
- (BOOL)hasModifiedDateTime;
- (BOOL)hasParentIdentifier;
- (BOOL)hasPriority;
- (BOOL)hasSpatialEventTrigger;
- (BOOL)hasStatus;
- (BOOL)hasTaskReference;
- (BOOL)hasTaskType;
- (BOOL)hasTemporalEventTrigger;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)identifier;
- (NSString)parentIdentifier;
- (_INPBContactEventTrigger)contactEventTrigger;
- (_INPBDataString)title;
- (_INPBDateTime)createdDateTime;
- (_INPBDateTime)modifiedDateTime;
- (_INPBSpatialEventTrigger)spatialEventTrigger;
- (_INPBTask)initWithCoder:(id)a3;
- (_INPBTemporalEventTrigger)temporalEventTrigger;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)priorityAsString:(int)a3;
- (id)statusAsString:(int)a3;
- (id)taskReferenceAsString:(int)a3;
- (id)taskTypeAsString:(int)a3;
- (int)StringAsPriority:(id)a3;
- (int)StringAsStatus:(id)a3;
- (int)StringAsTaskReference:(id)a3;
- (int)StringAsTaskType:(id)a3;
- (int)priority;
- (int)status;
- (int)taskReference;
- (int)taskType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setContactEventTrigger:(id)a3;
- (void)setCreatedDateTime:(id)a3;
- (void)setHasPriority:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setHasTaskReference:(BOOL)a3;
- (void)setHasTaskType:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setModifiedDateTime:(id)a3;
- (void)setParentIdentifier:(id)a3;
- (void)setPriority:(int)a3;
- (void)setSpatialEventTrigger:(id)a3;
- (void)setStatus:(int)a3;
- (void)setTaskReference:(int)a3;
- (void)setTaskType:(int)a3;
- (void)setTemporalEventTrigger:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_temporalEventTrigger, 0);
  objc_storeStrong((id *)&self->_spatialEventTrigger, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_modifiedDateTime, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_createdDateTime, 0);

  objc_storeStrong((id *)&self->_contactEventTrigger, 0);
}

- (_INPBDataString)title
{
  return self->_title;
}

- (_INPBTemporalEventTrigger)temporalEventTrigger
{
  return self->_temporalEventTrigger;
}

- (int)taskType
{
  return self->_taskType;
}

- (int)taskReference
{
  return self->_taskReference;
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

- (NSString)parentIdentifier
{
  return self->_parentIdentifier;
}

- (_INPBDateTime)modifiedDateTime
{
  return self->_modifiedDateTime;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_INPBDateTime)createdDateTime
{
  return self->_createdDateTime;
}

- (_INPBContactEventTrigger)contactEventTrigger
{
  return self->_contactEventTrigger;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBTask *)self contactEventTrigger];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"contactEventTrigger"];

  v6 = [(_INPBTask *)self createdDateTime];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"createdDateTime"];

  if (self->_identifier)
  {
    v8 = [(_INPBTask *)self identifier];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"identifier"];
  }
  v10 = [(_INPBTask *)self modifiedDateTime];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"modifiedDateTime"];

  if (self->_parentIdentifier)
  {
    v12 = [(_INPBTask *)self parentIdentifier];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"parentIdentifier"];
  }
  if ([(_INPBTask *)self hasPriority])
  {
    uint64_t v14 = [(_INPBTask *)self priority];
    if (v14 >= 3)
    {
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v14);
    }
    else
    {
      v15 = *(&off_1E551B910 + v14);
    }
    [v3 setObject:v15 forKeyedSubscript:@"priority"];
  }
  v16 = [(_INPBTask *)self spatialEventTrigger];
  v17 = [v16 dictionaryRepresentation];
  [v3 setObject:v17 forKeyedSubscript:@"spatialEventTrigger"];

  if ([(_INPBTask *)self hasStatus])
  {
    uint64_t v18 = [(_INPBTask *)self status];
    if (v18)
    {
      if (v18 == 20)
      {
        v19 = @"COMPLETED";
      }
      else if (v18 == 10)
      {
        v19 = @"NOT_COMPLETED";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v18);
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v19 = @"UNKNOWN_STATUS";
    }
    [v3 setObject:v19 forKeyedSubscript:@"status"];
  }
  if ([(_INPBTask *)self hasTaskReference])
  {
    uint64_t v20 = [(_INPBTask *)self taskReference];
    if (v20)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v20);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = @"CURRENT_ACTIVITY";
    }
    [v3 setObject:v21 forKeyedSubscript:@"taskReference"];
  }
  if ([(_INPBTask *)self hasTaskType])
  {
    uint64_t v22 = [(_INPBTask *)self taskType];
    if (v22)
    {
      if (v22 == 20)
      {
        v23 = @"COMPLETABLE";
      }
      else if (v22 == 10)
      {
        v23 = @"NOT_COMPLETABLE";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v22);
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v23 = @"UNKNOWN_TASK_TYPE";
    }
    [v3 setObject:v23 forKeyedSubscript:@"taskType"];
  }
  v24 = [(_INPBTask *)self temporalEventTrigger];
  v25 = [v24 dictionaryRepresentation];
  [v3 setObject:v25 forKeyedSubscript:@"temporalEventTrigger"];

  v26 = [(_INPBTask *)self title];
  v27 = [v26 dictionaryRepresentation];
  [v3 setObject:v27 forKeyedSubscript:@"title"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v15 = [(_INPBContactEventTrigger *)self->_contactEventTrigger hash];
  unint64_t v3 = [(_INPBDateTime *)self->_createdDateTime hash];
  NSUInteger v4 = [(NSString *)self->_identifier hash];
  unint64_t v5 = [(_INPBDateTime *)self->_modifiedDateTime hash];
  NSUInteger v6 = [(NSString *)self->_parentIdentifier hash];
  if ([(_INPBTask *)self hasPriority]) {
    uint64_t v7 = 2654435761 * self->_priority;
  }
  else {
    uint64_t v7 = 0;
  }
  unint64_t v8 = [(_INPBSpatialEventTrigger *)self->_spatialEventTrigger hash];
  if ([(_INPBTask *)self hasStatus]) {
    uint64_t v9 = 2654435761 * self->_status;
  }
  else {
    uint64_t v9 = 0;
  }
  if ([(_INPBTask *)self hasTaskReference]) {
    uint64_t v10 = 2654435761 * self->_taskReference;
  }
  else {
    uint64_t v10 = 0;
  }
  if ([(_INPBTask *)self hasTaskType]) {
    uint64_t v11 = 2654435761 * self->_taskType;
  }
  else {
    uint64_t v11 = 0;
  }
  unint64_t v12 = v3 ^ v15 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  unint64_t v13 = v9 ^ v10 ^ v11 ^ [(_INPBTemporalEventTrigger *)self->_temporalEventTrigger hash];
  return v12 ^ v13 ^ [(_INPBDataString *)self->_title hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_58;
  }
  unint64_t v5 = [(_INPBTask *)self contactEventTrigger];
  NSUInteger v6 = [v4 contactEventTrigger];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_57;
  }
  uint64_t v7 = [(_INPBTask *)self contactEventTrigger];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    uint64_t v9 = [(_INPBTask *)self contactEventTrigger];
    uint64_t v10 = [v4 contactEventTrigger];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBTask *)self createdDateTime];
  NSUInteger v6 = [v4 createdDateTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_57;
  }
  uint64_t v12 = [(_INPBTask *)self createdDateTime];
  if (v12)
  {
    unint64_t v13 = (void *)v12;
    uint64_t v14 = [(_INPBTask *)self createdDateTime];
    unint64_t v15 = [v4 createdDateTime];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBTask *)self identifier];
  NSUInteger v6 = [v4 identifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_57;
  }
  uint64_t v17 = [(_INPBTask *)self identifier];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    v19 = [(_INPBTask *)self identifier];
    uint64_t v20 = [v4 identifier];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBTask *)self modifiedDateTime];
  NSUInteger v6 = [v4 modifiedDateTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_57;
  }
  uint64_t v22 = [(_INPBTask *)self modifiedDateTime];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_INPBTask *)self modifiedDateTime];
    v25 = [v4 modifiedDateTime];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBTask *)self parentIdentifier];
  NSUInteger v6 = [v4 parentIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_57;
  }
  uint64_t v27 = [(_INPBTask *)self parentIdentifier];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_INPBTask *)self parentIdentifier];
    v30 = [v4 parentIdentifier];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  int v32 = [(_INPBTask *)self hasPriority];
  if (v32 != [v4 hasPriority]) {
    goto LABEL_58;
  }
  if ([(_INPBTask *)self hasPriority])
  {
    if ([v4 hasPriority])
    {
      int priority = self->_priority;
      if (priority != [v4 priority]) {
        goto LABEL_58;
      }
    }
  }
  unint64_t v5 = [(_INPBTask *)self spatialEventTrigger];
  NSUInteger v6 = [v4 spatialEventTrigger];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_57;
  }
  uint64_t v34 = [(_INPBTask *)self spatialEventTrigger];
  if (v34)
  {
    v35 = (void *)v34;
    v36 = [(_INPBTask *)self spatialEventTrigger];
    v37 = [v4 spatialEventTrigger];
    int v38 = [v36 isEqual:v37];

    if (!v38) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  int v39 = [(_INPBTask *)self hasStatus];
  if (v39 != [v4 hasStatus]) {
    goto LABEL_58;
  }
  if ([(_INPBTask *)self hasStatus])
  {
    if ([v4 hasStatus])
    {
      int status = self->_status;
      if (status != [v4 status]) {
        goto LABEL_58;
      }
    }
  }
  int v41 = [(_INPBTask *)self hasTaskReference];
  if (v41 != [v4 hasTaskReference]) {
    goto LABEL_58;
  }
  if ([(_INPBTask *)self hasTaskReference])
  {
    if ([v4 hasTaskReference])
    {
      int taskReference = self->_taskReference;
      if (taskReference != [v4 taskReference]) {
        goto LABEL_58;
      }
    }
  }
  int v43 = [(_INPBTask *)self hasTaskType];
  if (v43 != [v4 hasTaskType]) {
    goto LABEL_58;
  }
  if ([(_INPBTask *)self hasTaskType])
  {
    if ([v4 hasTaskType])
    {
      int taskType = self->_taskType;
      if (taskType != [v4 taskType]) {
        goto LABEL_58;
      }
    }
  }
  unint64_t v5 = [(_INPBTask *)self temporalEventTrigger];
  NSUInteger v6 = [v4 temporalEventTrigger];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_57;
  }
  uint64_t v45 = [(_INPBTask *)self temporalEventTrigger];
  if (v45)
  {
    v46 = (void *)v45;
    v47 = [(_INPBTask *)self temporalEventTrigger];
    v48 = [v4 temporalEventTrigger];
    int v49 = [v47 isEqual:v48];

    if (!v49) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBTask *)self title];
  NSUInteger v6 = [v4 title];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v50 = [(_INPBTask *)self title];
    if (!v50)
    {

LABEL_61:
      BOOL v55 = 1;
      goto LABEL_59;
    }
    v51 = (void *)v50;
    v52 = [(_INPBTask *)self title];
    v53 = [v4 title];
    char v54 = [v52 isEqual:v53];

    if (v54) {
      goto LABEL_61;
    }
  }
  else
  {
LABEL_57:
  }
LABEL_58:
  BOOL v55 = 0;
LABEL_59:

  return v55;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBTask allocWithZone:](_INPBTask, "allocWithZone:") init];
  id v6 = [(_INPBContactEventTrigger *)self->_contactEventTrigger copyWithZone:a3];
  [(_INPBTask *)v5 setContactEventTrigger:v6];

  id v7 = [(_INPBDateTime *)self->_createdDateTime copyWithZone:a3];
  [(_INPBTask *)v5 setCreatedDateTime:v7];

  unint64_t v8 = (void *)[(NSString *)self->_identifier copyWithZone:a3];
  [(_INPBTask *)v5 setIdentifier:v8];

  id v9 = [(_INPBDateTime *)self->_modifiedDateTime copyWithZone:a3];
  [(_INPBTask *)v5 setModifiedDateTime:v9];

  uint64_t v10 = (void *)[(NSString *)self->_parentIdentifier copyWithZone:a3];
  [(_INPBTask *)v5 setParentIdentifier:v10];

  if ([(_INPBTask *)self hasPriority]) {
    [(_INPBTask *)v5 setPriority:[(_INPBTask *)self priority]];
  }
  id v11 = [(_INPBSpatialEventTrigger *)self->_spatialEventTrigger copyWithZone:a3];
  [(_INPBTask *)v5 setSpatialEventTrigger:v11];

  if ([(_INPBTask *)self hasStatus]) {
    [(_INPBTask *)v5 setStatus:[(_INPBTask *)self status]];
  }
  if ([(_INPBTask *)self hasTaskReference]) {
    [(_INPBTask *)v5 setTaskReference:[(_INPBTask *)self taskReference]];
  }
  if ([(_INPBTask *)self hasTaskType]) {
    [(_INPBTask *)v5 setTaskType:[(_INPBTask *)self taskType]];
  }
  id v12 = [(_INPBTemporalEventTrigger *)self->_temporalEventTrigger copyWithZone:a3];
  [(_INPBTask *)v5 setTemporalEventTrigger:v12];

  id v13 = [(_INPBDataString *)self->_title copyWithZone:a3];
  [(_INPBTask *)v5 setTitle:v13];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBTask *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBTask)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBTask *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        unint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBTask *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBTask *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v19 = a3;
  id v4 = [(_INPBTask *)self contactEventTrigger];

  if (v4)
  {
    unint64_t v5 = [(_INPBTask *)self contactEventTrigger];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBTask *)self createdDateTime];

  if (v6)
  {
    uint64_t v7 = [(_INPBTask *)self createdDateTime];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v8 = [(_INPBTask *)self identifier];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  id v9 = [(_INPBTask *)self modifiedDateTime];

  if (v9)
  {
    uint64_t v10 = [(_INPBTask *)self modifiedDateTime];
    PBDataWriterWriteSubmessage();
  }
  id v11 = [(_INPBTask *)self parentIdentifier];

  if (v11) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBTask *)self hasPriority]) {
    PBDataWriterWriteInt32Field();
  }
  id v12 = [(_INPBTask *)self spatialEventTrigger];

  if (v12)
  {
    id v13 = [(_INPBTask *)self spatialEventTrigger];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBTask *)self hasStatus]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBTask *)self hasTaskReference]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBTask *)self hasTaskType]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v14 = [(_INPBTask *)self temporalEventTrigger];

  if (v14)
  {
    unint64_t v15 = [(_INPBTask *)self temporalEventTrigger];
    PBDataWriterWriteSubmessage();
  }
  int v16 = [(_INPBTask *)self title];

  uint64_t v17 = v19;
  if (v16)
  {
    uint64_t v18 = [(_INPBTask *)self title];
    PBDataWriterWriteSubmessage();

    uint64_t v17 = v19;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBTaskReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)hasTemporalEventTrigger
{
  return self->_temporalEventTrigger != 0;
}

- (void)setTemporalEventTrigger:(id)a3
{
}

- (int)StringAsTaskType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_TASK_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NOT_COMPLETABLE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"COMPLETABLE"])
  {
    int v4 = 20;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)taskTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 20)
    {
      int v4 = @"COMPLETABLE";
    }
    else if (a3 == 10)
    {
      int v4 = @"NOT_COMPLETABLE";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"UNKNOWN_TASK_TYPE";
  }
  return v4;
}

- (void)setHasTaskType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTaskType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTaskType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xF7;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 8;
    self->_int taskType = a3;
  }
}

- (int)StringAsTaskReference:(id)a3
{
  return 0;
}

- (id)taskReferenceAsString:(int)a3
{
  if (a3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v4 = @"CURRENT_ACTIVITY";
  }
  return v4;
}

- (void)setHasTaskReference:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTaskReference
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTaskReference:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFB;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 4;
    self->_int taskReference = a3;
  }
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
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
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
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551B910 + a3);
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

- (BOOL)hasParentIdentifier
{
  return self->_parentIdentifier != 0;
}

- (void)setParentIdentifier:(id)a3
{
  int v4 = (NSString *)[a3 copy];
  parentIdentifier = self->_parentIdentifier;
  self->_parentIdentifier = v4;

  MEMORY[0x1F41817F8](v4, parentIdentifier);
}

- (BOOL)hasModifiedDateTime
{
  return self->_modifiedDateTime != 0;
}

- (void)setModifiedDateTime:(id)a3
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

- (BOOL)hasCreatedDateTime
{
  return self->_createdDateTime != 0;
}

- (void)setCreatedDateTime:(id)a3
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