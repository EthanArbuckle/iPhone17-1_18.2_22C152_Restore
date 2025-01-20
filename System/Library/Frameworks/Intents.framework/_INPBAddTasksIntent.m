@interface _INPBAddTasksIntent
+ (BOOL)supportsSecureCoding;
+ (Class)targetTaskListMembersType;
+ (Class)taskTitlesType;
- (BOOL)hasContactEventTrigger;
- (BOOL)hasIntent;
- (BOOL)hasIntentMetadata;
- (BOOL)hasPriority;
- (BOOL)hasSpatialEventTrigger;
- (BOOL)hasTargetTaskList;
- (BOOL)hasTaskReference;
- (BOOL)hasTemporalEventTrigger;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)targetTaskListMembers;
- (NSArray)taskTitles;
- (_INPBAddTasksIntent)initWithCoder:(id)a3;
- (_INPBContactEventTrigger)contactEventTrigger;
- (_INPBIntent)intent;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBSpatialEventTrigger)spatialEventTrigger;
- (_INPBTaskList)targetTaskList;
- (_INPBTemporalEventTrigger)temporalEventTrigger;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)priorityAsString:(int)a3;
- (id)targetTaskListMembersAtIndex:(unint64_t)a3;
- (id)taskReferenceAsString:(int)a3;
- (id)taskTitlesAtIndex:(unint64_t)a3;
- (int)StringAsPriority:(id)a3;
- (int)StringAsTaskReference:(id)a3;
- (int)priority;
- (int)taskReference;
- (unint64_t)hash;
- (unint64_t)targetTaskListMembersCount;
- (unint64_t)taskTitlesCount;
- (void)addTargetTaskListMembers:(id)a3;
- (void)addTaskTitles:(id)a3;
- (void)clearTargetTaskListMembers;
- (void)clearTaskTitles;
- (void)encodeWithCoder:(id)a3;
- (void)setContactEventTrigger:(id)a3;
- (void)setHasPriority:(BOOL)a3;
- (void)setHasTaskReference:(BOOL)a3;
- (void)setIntent:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setPriority:(int)a3;
- (void)setSpatialEventTrigger:(id)a3;
- (void)setTargetTaskList:(id)a3;
- (void)setTargetTaskListMembers:(id)a3;
- (void)setTaskReference:(int)a3;
- (void)setTaskTitles:(id)a3;
- (void)setTemporalEventTrigger:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBAddTasksIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporalEventTrigger, 0);
  objc_storeStrong((id *)&self->_taskTitles, 0);
  objc_storeStrong((id *)&self->_targetTaskListMembers, 0);
  objc_storeStrong((id *)&self->_targetTaskList, 0);
  objc_storeStrong((id *)&self->_spatialEventTrigger, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_intent, 0);

  objc_storeStrong((id *)&self->_contactEventTrigger, 0);
}

- (_INPBTemporalEventTrigger)temporalEventTrigger
{
  return self->_temporalEventTrigger;
}

- (NSArray)taskTitles
{
  return self->_taskTitles;
}

- (int)taskReference
{
  return self->_taskReference;
}

- (NSArray)targetTaskListMembers
{
  return self->_targetTaskListMembers;
}

- (_INPBTaskList)targetTaskList
{
  return self->_targetTaskList;
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

- (_INPBIntent)intent
{
  return self->_intent;
}

- (_INPBContactEventTrigger)contactEventTrigger
{
  return self->_contactEventTrigger;
}

- (id)dictionaryRepresentation
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBAddTasksIntent *)self contactEventTrigger];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"contactEventTrigger"];

  v6 = [(_INPBAddTasksIntent *)self intent];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"intent"];

  v8 = [(_INPBAddTasksIntent *)self intentMetadata];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"intentMetadata"];

  if ([(_INPBAddTasksIntent *)self hasPriority])
  {
    uint64_t v10 = [(_INPBAddTasksIntent *)self priority];
    if (v10 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E5519610[v10];
    }
    [v3 setObject:v11 forKeyedSubscript:@"priority"];
  }
  v12 = [(_INPBAddTasksIntent *)self spatialEventTrigger];
  v13 = [v12 dictionaryRepresentation];
  [v3 setObject:v13 forKeyedSubscript:@"spatialEventTrigger"];

  v14 = [(_INPBAddTasksIntent *)self targetTaskList];
  v15 = [v14 dictionaryRepresentation];
  [v3 setObject:v15 forKeyedSubscript:@"targetTaskList"];

  if ([(NSArray *)self->_targetTaskListMembers count])
  {
    v16 = [MEMORY[0x1E4F1CA48] array];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v17 = self->_targetTaskListMembers;
    uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v40 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = [*(id *)(*((void *)&v39 + 1) + 8 * i) dictionaryRepresentation];
          [v16 addObject:v22];
        }
        uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v19);
    }

    [v3 setObject:v16 forKeyedSubscript:@"targetTaskListMembers"];
  }
  if ([(_INPBAddTasksIntent *)self hasTaskReference])
  {
    uint64_t v23 = [(_INPBAddTasksIntent *)self taskReference];
    if (v23)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v23);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = @"CURRENT_ACTIVITY";
    }
    [v3 setObject:v24 forKeyedSubscript:@"taskReference"];
  }
  if ([(NSArray *)self->_taskTitles count])
  {
    v25 = [MEMORY[0x1E4F1CA48] array];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v26 = self->_taskTitles;
    uint64_t v27 = [(NSArray *)v26 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v36 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = [*(id *)(*((void *)&v35 + 1) + 8 * j) dictionaryRepresentation];
          [v25 addObject:v31];
        }
        uint64_t v28 = [(NSArray *)v26 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v28);
    }

    [v3 setObject:v25 forKeyedSubscript:@"taskTitles"];
  }
  v32 = [(_INPBAddTasksIntent *)self temporalEventTrigger];
  v33 = [v32 dictionaryRepresentation];
  [v3 setObject:v33 forKeyedSubscript:@"temporalEventTrigger"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBContactEventTrigger *)self->_contactEventTrigger hash];
  unint64_t v4 = [(_INPBIntent *)self->_intent hash];
  unint64_t v5 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  if ([(_INPBAddTasksIntent *)self hasPriority]) {
    uint64_t v6 = 2654435761 * self->_priority;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = [(_INPBSpatialEventTrigger *)self->_spatialEventTrigger hash];
  unint64_t v8 = [(_INPBTaskList *)self->_targetTaskList hash];
  uint64_t v9 = [(NSArray *)self->_targetTaskListMembers hash];
  if ([(_INPBAddTasksIntent *)self hasTaskReference]) {
    uint64_t v10 = 2654435761 * self->_taskReference;
  }
  else {
    uint64_t v10 = 0;
  }
  unint64_t v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  uint64_t v12 = v10 ^ [(NSArray *)self->_taskTitles hash];
  return v11 ^ v12 ^ [(_INPBTemporalEventTrigger *)self->_temporalEventTrigger hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_50;
  }
  unint64_t v5 = [(_INPBAddTasksIntent *)self contactEventTrigger];
  uint64_t v6 = [v4 contactEventTrigger];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_49;
  }
  uint64_t v7 = [(_INPBAddTasksIntent *)self contactEventTrigger];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    uint64_t v9 = [(_INPBAddTasksIntent *)self contactEventTrigger];
    uint64_t v10 = [v4 contactEventTrigger];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_50;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBAddTasksIntent *)self intent];
  uint64_t v6 = [v4 intent];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_49;
  }
  uint64_t v12 = [(_INPBAddTasksIntent *)self intent];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBAddTasksIntent *)self intent];
    v15 = [v4 intent];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_50;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBAddTasksIntent *)self intentMetadata];
  uint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_49;
  }
  uint64_t v17 = [(_INPBAddTasksIntent *)self intentMetadata];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(_INPBAddTasksIntent *)self intentMetadata];
    uint64_t v20 = [v4 intentMetadata];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_50;
    }
  }
  else
  {
  }
  int v22 = [(_INPBAddTasksIntent *)self hasPriority];
  if (v22 != [v4 hasPriority]) {
    goto LABEL_50;
  }
  if ([(_INPBAddTasksIntent *)self hasPriority])
  {
    if ([v4 hasPriority])
    {
      int priority = self->_priority;
      if (priority != [v4 priority]) {
        goto LABEL_50;
      }
    }
  }
  unint64_t v5 = [(_INPBAddTasksIntent *)self spatialEventTrigger];
  uint64_t v6 = [v4 spatialEventTrigger];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_49;
  }
  uint64_t v24 = [(_INPBAddTasksIntent *)self spatialEventTrigger];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [(_INPBAddTasksIntent *)self spatialEventTrigger];
    uint64_t v27 = [v4 spatialEventTrigger];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_50;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBAddTasksIntent *)self targetTaskList];
  uint64_t v6 = [v4 targetTaskList];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_49;
  }
  uint64_t v29 = [(_INPBAddTasksIntent *)self targetTaskList];
  if (v29)
  {
    v30 = (void *)v29;
    v31 = [(_INPBAddTasksIntent *)self targetTaskList];
    v32 = [v4 targetTaskList];
    int v33 = [v31 isEqual:v32];

    if (!v33) {
      goto LABEL_50;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBAddTasksIntent *)self targetTaskListMembers];
  uint64_t v6 = [v4 targetTaskListMembers];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_49;
  }
  uint64_t v34 = [(_INPBAddTasksIntent *)self targetTaskListMembers];
  if (v34)
  {
    long long v35 = (void *)v34;
    long long v36 = [(_INPBAddTasksIntent *)self targetTaskListMembers];
    long long v37 = [v4 targetTaskListMembers];
    int v38 = [v36 isEqual:v37];

    if (!v38) {
      goto LABEL_50;
    }
  }
  else
  {
  }
  int v39 = [(_INPBAddTasksIntent *)self hasTaskReference];
  if (v39 != [v4 hasTaskReference]) {
    goto LABEL_50;
  }
  if ([(_INPBAddTasksIntent *)self hasTaskReference])
  {
    if ([v4 hasTaskReference])
    {
      int taskReference = self->_taskReference;
      if (taskReference != [v4 taskReference]) {
        goto LABEL_50;
      }
    }
  }
  unint64_t v5 = [(_INPBAddTasksIntent *)self taskTitles];
  uint64_t v6 = [v4 taskTitles];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_49;
  }
  uint64_t v41 = [(_INPBAddTasksIntent *)self taskTitles];
  if (v41)
  {
    long long v42 = (void *)v41;
    v43 = [(_INPBAddTasksIntent *)self taskTitles];
    v44 = [v4 taskTitles];
    int v45 = [v43 isEqual:v44];

    if (!v45) {
      goto LABEL_50;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBAddTasksIntent *)self temporalEventTrigger];
  uint64_t v6 = [v4 temporalEventTrigger];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v46 = [(_INPBAddTasksIntent *)self temporalEventTrigger];
    if (!v46)
    {

LABEL_53:
      BOOL v51 = 1;
      goto LABEL_51;
    }
    v47 = (void *)v46;
    v48 = [(_INPBAddTasksIntent *)self temporalEventTrigger];
    v49 = [v4 temporalEventTrigger];
    char v50 = [v48 isEqual:v49];

    if (v50) {
      goto LABEL_53;
    }
  }
  else
  {
LABEL_49:
  }
LABEL_50:
  BOOL v51 = 0;
LABEL_51:

  return v51;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBAddTasksIntent allocWithZone:](_INPBAddTasksIntent, "allocWithZone:") init];
  id v6 = [(_INPBContactEventTrigger *)self->_contactEventTrigger copyWithZone:a3];
  [(_INPBAddTasksIntent *)v5 setContactEventTrigger:v6];

  id v7 = [(_INPBIntent *)self->_intent copyWithZone:a3];
  [(_INPBAddTasksIntent *)v5 setIntent:v7];

  id v8 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBAddTasksIntent *)v5 setIntentMetadata:v8];

  if ([(_INPBAddTasksIntent *)self hasPriority]) {
    [(_INPBAddTasksIntent *)v5 setPriority:[(_INPBAddTasksIntent *)self priority]];
  }
  id v9 = [(_INPBSpatialEventTrigger *)self->_spatialEventTrigger copyWithZone:a3];
  [(_INPBAddTasksIntent *)v5 setSpatialEventTrigger:v9];

  id v10 = [(_INPBTaskList *)self->_targetTaskList copyWithZone:a3];
  [(_INPBAddTasksIntent *)v5 setTargetTaskList:v10];

  int v11 = (void *)[(NSArray *)self->_targetTaskListMembers copyWithZone:a3];
  [(_INPBAddTasksIntent *)v5 setTargetTaskListMembers:v11];

  if ([(_INPBAddTasksIntent *)self hasTaskReference]) {
    [(_INPBAddTasksIntent *)v5 setTaskReference:[(_INPBAddTasksIntent *)self taskReference]];
  }
  uint64_t v12 = (void *)[(NSArray *)self->_taskTitles copyWithZone:a3];
  [(_INPBAddTasksIntent *)v5 setTaskTitles:v12];

  id v13 = [(_INPBTemporalEventTrigger *)self->_temporalEventTrigger copyWithZone:a3];
  [(_INPBAddTasksIntent *)v5 setTemporalEventTrigger:v13];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBAddTasksIntent *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBAddTasksIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBAddTasksIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBAddTasksIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBAddTasksIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(_INPBAddTasksIntent *)self contactEventTrigger];

  if (v5)
  {
    id v6 = [(_INPBAddTasksIntent *)self contactEventTrigger];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_INPBAddTasksIntent *)self intent];

  if (v7)
  {
    id v8 = [(_INPBAddTasksIntent *)self intent];
    PBDataWriterWriteSubmessage();
  }
  id v9 = [(_INPBAddTasksIntent *)self intentMetadata];

  if (v9)
  {
    id v10 = [(_INPBAddTasksIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBAddTasksIntent *)self hasPriority]) {
    PBDataWriterWriteInt32Field();
  }
  int v11 = [(_INPBAddTasksIntent *)self spatialEventTrigger];

  if (v11)
  {
    uint64_t v12 = [(_INPBAddTasksIntent *)self spatialEventTrigger];
    PBDataWriterWriteSubmessage();
  }
  id v13 = [(_INPBAddTasksIntent *)self targetTaskList];

  if (v13)
  {
    v14 = [(_INPBAddTasksIntent *)self targetTaskList];
    PBDataWriterWriteSubmessage();
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v15 = self->_targetTaskListMembers;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v32;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v17);
  }

  if ([(_INPBAddTasksIntent *)self hasTaskReference]) {
    PBDataWriterWriteInt32Field();
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v20 = self->_taskTitles;
  uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v28;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v22);
  }

  v25 = [(_INPBAddTasksIntent *)self temporalEventTrigger];

  if (v25)
  {
    v26 = [(_INPBAddTasksIntent *)self temporalEventTrigger];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBAddTasksIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTemporalEventTrigger
{
  return self->_temporalEventTrigger != 0;
}

- (void)setTemporalEventTrigger:(id)a3
{
}

- (id)taskTitlesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_taskTitles objectAtIndexedSubscript:a3];
}

- (unint64_t)taskTitlesCount
{
  return [(NSArray *)self->_taskTitles count];
}

- (void)addTaskTitles:(id)a3
{
  id v4 = a3;
  taskTitles = self->_taskTitles;
  id v8 = v4;
  if (!taskTitles)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_taskTitles;
    self->_taskTitles = v6;

    id v4 = v8;
    taskTitles = self->_taskTitles;
  }
  [(NSArray *)taskTitles addObject:v4];
}

- (void)clearTaskTitles
{
}

- (void)setTaskTitles:(id)a3
{
  self->_taskTitles = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
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
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = @"CURRENT_ACTIVITY";
  }
  return v4;
}

- (void)setHasTaskReference:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTaskReference
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTaskReference:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
    self->_int taskReference = a3;
  }
}

- (id)targetTaskListMembersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_targetTaskListMembers objectAtIndexedSubscript:a3];
}

- (unint64_t)targetTaskListMembersCount
{
  return [(NSArray *)self->_targetTaskListMembers count];
}

- (void)addTargetTaskListMembers:(id)a3
{
  id v4 = a3;
  targetTaskListMembers = self->_targetTaskListMembers;
  id v8 = v4;
  if (!targetTaskListMembers)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_targetTaskListMembers;
    self->_targetTaskListMembers = v6;

    id v4 = v8;
    targetTaskListMembers = self->_targetTaskListMembers;
  }
  [(NSArray *)targetTaskListMembers addObject:v4];
}

- (void)clearTargetTaskListMembers
{
}

- (void)setTargetTaskListMembers:(id)a3
{
  self->_targetTaskListMembers = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasTargetTaskList
{
  return self->_targetTaskList != 0;
}

- (void)setTargetTaskList:(id)a3
{
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
    id v3 = off_1E5519610[a3];
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

- (BOOL)hasIntent
{
  return self->_intent != 0;
}

- (void)setIntent:(id)a3
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

+ (Class)taskTitlesType
{
  return (Class)objc_opt_class();
}

+ (Class)targetTaskListMembersType
{
  return (Class)objc_opt_class();
}

@end