@interface _INPBSnoozeTasksIntent
+ (BOOL)supportsSecureCoding;
+ (Class)tasksType;
- (BOOL)all;
- (BOOL)hasAll;
- (BOOL)hasIntentMetadata;
- (BOOL)hasNextTriggerTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)tasks;
- (_INPBDateTimeRange)nextTriggerTime;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBSnoozeTasksIntent)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)tasksAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)tasksCount;
- (void)addTasks:(id)a3;
- (void)clearTasks;
- (void)encodeWithCoder:(id)a3;
- (void)setAll:(BOOL)a3;
- (void)setHasAll:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setNextTriggerTime:(id)a3;
- (void)setTasks:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSnoozeTasksIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_nextTriggerTime, 0);

  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

- (NSArray)tasks
{
  return self->_tasks;
}

- (_INPBDateTimeRange)nextTriggerTime
{
  return self->_nextTriggerTime;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (BOOL)all
{
  return self->_all;
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBSnoozeTasksIntent *)self hasAll])
  {
    v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBSnoozeTasksIntent all](self, "all"));
    [v3 setObject:v4 forKeyedSubscript:@"all"];
  }
  v5 = [(_INPBSnoozeTasksIntent *)self intentMetadata];
  v6 = [v5 dictionaryRepresentation];
  [v3 setObject:v6 forKeyedSubscript:@"intentMetadata"];

  v7 = [(_INPBSnoozeTasksIntent *)self nextTriggerTime];
  v8 = [v7 dictionaryRepresentation];
  [v3 setObject:v8 forKeyedSubscript:@"nextTriggerTime"];

  if ([(NSArray *)self->_tasks count])
  {
    v9 = [MEMORY[0x1E4F1CA48] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v10 = self->_tasks;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKeyedSubscript:@"tasks"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBSnoozeTasksIntent *)self hasAll]) {
    uint64_t v3 = 2654435761 * self->_all;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(_INPBIntentMetadata *)self->_intentMetadata hash] ^ v3;
  unint64_t v5 = [(_INPBDateTimeRange *)self->_nextTriggerTime hash];
  return v4 ^ v5 ^ [(NSArray *)self->_tasks hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  int v5 = [(_INPBSnoozeTasksIntent *)self hasAll];
  if (v5 != [v4 hasAll]) {
    goto LABEL_21;
  }
  if ([(_INPBSnoozeTasksIntent *)self hasAll])
  {
    if ([v4 hasAll])
    {
      int all = self->_all;
      if (all != [v4 all]) {
        goto LABEL_21;
      }
    }
  }
  v7 = [(_INPBSnoozeTasksIntent *)self intentMetadata];
  v8 = [v4 intentMetadata];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_20;
  }
  uint64_t v9 = [(_INPBSnoozeTasksIntent *)self intentMetadata];
  if (v9)
  {
    v10 = (void *)v9;
    uint64_t v11 = [(_INPBSnoozeTasksIntent *)self intentMetadata];
    uint64_t v12 = [v4 intentMetadata];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  v7 = [(_INPBSnoozeTasksIntent *)self nextTriggerTime];
  v8 = [v4 nextTriggerTime];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_20;
  }
  uint64_t v14 = [(_INPBSnoozeTasksIntent *)self nextTriggerTime];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(_INPBSnoozeTasksIntent *)self nextTriggerTime];
    long long v17 = [v4 nextTriggerTime];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  v7 = [(_INPBSnoozeTasksIntent *)self tasks];
  v8 = [v4 tasks];
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v19 = [(_INPBSnoozeTasksIntent *)self tasks];
    if (!v19)
    {

LABEL_24:
      BOOL v24 = 1;
      goto LABEL_22;
    }
    long long v20 = (void *)v19;
    v21 = [(_INPBSnoozeTasksIntent *)self tasks];
    uint64_t v22 = [v4 tasks];
    char v23 = [v21 isEqual:v22];

    if (v23) {
      goto LABEL_24;
    }
  }
  else
  {
LABEL_20:
  }
LABEL_21:
  BOOL v24 = 0;
LABEL_22:

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBSnoozeTasksIntent allocWithZone:](_INPBSnoozeTasksIntent, "allocWithZone:") init];
  if ([(_INPBSnoozeTasksIntent *)self hasAll]) {
    [(_INPBSnoozeTasksIntent *)v5 setAll:[(_INPBSnoozeTasksIntent *)self all]];
  }
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBSnoozeTasksIntent *)v5 setIntentMetadata:v6];

  id v7 = [(_INPBDateTimeRange *)self->_nextTriggerTime copyWithZone:a3];
  [(_INPBSnoozeTasksIntent *)v5 setNextTriggerTime:v7];

  v8 = (void *)[(NSArray *)self->_tasks copyWithZone:a3];
  [(_INPBSnoozeTasksIntent *)v5 setTasks:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSnoozeTasksIntent *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSnoozeTasksIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSnoozeTasksIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSnoozeTasksIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSnoozeTasksIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_INPBSnoozeTasksIntent *)self hasAll]) {
    PBDataWriterWriteBOOLField();
  }
  int v5 = [(_INPBSnoozeTasksIntent *)self intentMetadata];

  if (v5)
  {
    id v6 = [(_INPBSnoozeTasksIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_INPBSnoozeTasksIntent *)self nextTriggerTime];

  if (v7)
  {
    v8 = [(_INPBSnoozeTasksIntent *)self nextTriggerTime];
    PBDataWriterWriteSubmessage();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v9 = self->_tasks;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSnoozeTasksIntentReadFrom(self, (uint64_t)a3);
}

- (id)tasksAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_tasks objectAtIndexedSubscript:a3];
}

- (unint64_t)tasksCount
{
  return [(NSArray *)self->_tasks count];
}

- (void)addTasks:(id)a3
{
  id v4 = a3;
  tasks = self->_tasks;
  id v8 = v4;
  if (!tasks)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_tasks;
    self->_tasks = v6;

    id v4 = v8;
    tasks = self->_tasks;
  }
  [(NSArray *)tasks addObject:v4];
}

- (void)clearTasks
{
}

- (void)setTasks:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  tasks = self->_tasks;
  self->_tasks = v4;

  MEMORY[0x1F41817F8](v4, tasks);
}

- (BOOL)hasNextTriggerTime
{
  return self->_nextTriggerTime != 0;
}

- (void)setNextTriggerTime:(id)a3
{
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (void)setHasAll:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAll
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAll:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int all = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)tasksType
{
  return (Class)objc_opt_class();
}

@end