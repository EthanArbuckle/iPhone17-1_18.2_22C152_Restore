@interface _INPBSearchForNotebookItemsIntentResponse
+ (BOOL)supportsSecureCoding;
+ (Class)notesType;
+ (Class)taskListsType;
+ (Class)tasksType;
- (BOOL)hasSortType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)notes;
- (NSArray)taskLists;
- (NSArray)tasks;
- (_INPBSearchForNotebookItemsIntentResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)notesAtIndex:(unint64_t)a3;
- (id)sortTypeAsString:(int)a3;
- (id)taskListsAtIndex:(unint64_t)a3;
- (id)tasksAtIndex:(unint64_t)a3;
- (int)StringAsSortType:(id)a3;
- (int)sortType;
- (unint64_t)hash;
- (unint64_t)notesCount;
- (unint64_t)taskListsCount;
- (unint64_t)tasksCount;
- (void)addNotes:(id)a3;
- (void)addTaskLists:(id)a3;
- (void)addTasks:(id)a3;
- (void)clearNotes;
- (void)clearTaskLists;
- (void)clearTasks;
- (void)encodeWithCoder:(id)a3;
- (void)setHasSortType:(BOOL)a3;
- (void)setNotes:(id)a3;
- (void)setSortType:(int)a3;
- (void)setTaskLists:(id)a3;
- (void)setTasks:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSearchForNotebookItemsIntentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_taskLists, 0);

  objc_storeStrong((id *)&self->_notes, 0);
}

- (NSArray)tasks
{
  return self->_tasks;
}

- (NSArray)taskLists
{
  return self->_taskLists;
}

- (int)sortType
{
  return self->_sortType;
}

- (NSArray)notes
{
  return self->_notes;
}

- (id)dictionaryRepresentation
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_notes count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v5 = self->_notes;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v37 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v36 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"notes"];
  }
  if ([(_INPBSearchForNotebookItemsIntentResponse *)self hasSortType])
  {
    uint64_t v11 = [(_INPBSearchForNotebookItemsIntentResponse *)self sortType];
    if (v11)
    {
      if (v11 == 1)
      {
        v12 = @"BY_DATE";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v11);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v12 = @"AS_IS";
    }
    [v3 setObject:v12 forKeyedSubscript:@"sortType"];
  }
  if ([(NSArray *)self->_taskLists count])
  {
    v13 = [MEMORY[0x1E4F1CA48] array];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v14 = self->_taskLists;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v32 objects:v41 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v32 + 1) + 8 * j) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v32 objects:v41 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKeyedSubscript:@"taskLists"];
  }
  if ([(NSArray *)self->_tasks count])
  {
    v20 = [MEMORY[0x1E4F1CA48] array];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v21 = self->_tasks;
    uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v28 objects:v40 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v29;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v29 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [*(id *)(*((void *)&v28 + 1) + 8 * k) dictionaryRepresentation];
          [v20 addObject:v26];
        }
        uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v28 objects:v40 count:16];
      }
      while (v23);
    }

    [v3 setObject:v20 forKeyedSubscript:@"tasks"];
  }

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_notes hash];
  if ([(_INPBSearchForNotebookItemsIntentResponse *)self hasSortType]) {
    uint64_t v4 = 2654435761 * self->_sortType;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = v4 ^ v3;
  uint64_t v6 = [(NSArray *)self->_taskLists hash];
  return v5 ^ v6 ^ [(NSArray *)self->_tasks hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  uint64_t v5 = [(_INPBSearchForNotebookItemsIntentResponse *)self notes];
  uint64_t v6 = [v4 notes];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_20;
  }
  uint64_t v7 = [(_INPBSearchForNotebookItemsIntentResponse *)self notes];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_INPBSearchForNotebookItemsIntentResponse *)self notes];
    v10 = [v4 notes];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  int v12 = [(_INPBSearchForNotebookItemsIntentResponse *)self hasSortType];
  if (v12 != [v4 hasSortType]) {
    goto LABEL_21;
  }
  if ([(_INPBSearchForNotebookItemsIntentResponse *)self hasSortType])
  {
    if ([v4 hasSortType])
    {
      int sortType = self->_sortType;
      if (sortType != [v4 sortType]) {
        goto LABEL_21;
      }
    }
  }
  uint64_t v5 = [(_INPBSearchForNotebookItemsIntentResponse *)self taskLists];
  uint64_t v6 = [v4 taskLists];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_20;
  }
  uint64_t v14 = [(_INPBSearchForNotebookItemsIntentResponse *)self taskLists];
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    uint64_t v16 = [(_INPBSearchForNotebookItemsIntentResponse *)self taskLists];
    uint64_t v17 = [v4 taskLists];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBSearchForNotebookItemsIntentResponse *)self tasks];
  uint64_t v6 = [v4 tasks];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v19 = [(_INPBSearchForNotebookItemsIntentResponse *)self tasks];
    if (!v19)
    {

LABEL_24:
      BOOL v24 = 1;
      goto LABEL_22;
    }
    v20 = (void *)v19;
    v21 = [(_INPBSearchForNotebookItemsIntentResponse *)self tasks];
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
  uint64_t v5 = [+[_INPBSearchForNotebookItemsIntentResponse allocWithZone:](_INPBSearchForNotebookItemsIntentResponse, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSArray *)self->_notes copyWithZone:a3];
  [(_INPBSearchForNotebookItemsIntentResponse *)v5 setNotes:v6];

  if ([(_INPBSearchForNotebookItemsIntentResponse *)self hasSortType]) {
    [(_INPBSearchForNotebookItemsIntentResponse *)v5 setSortType:[(_INPBSearchForNotebookItemsIntentResponse *)self sortType]];
  }
  uint64_t v7 = (void *)[(NSArray *)self->_taskLists copyWithZone:a3];
  [(_INPBSearchForNotebookItemsIntentResponse *)v5 setTaskLists:v7];

  uint64_t v8 = (void *)[(NSArray *)self->_tasks copyWithZone:a3];
  [(_INPBSearchForNotebookItemsIntentResponse *)v5 setTasks:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSearchForNotebookItemsIntentResponse *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSearchForNotebookItemsIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSearchForNotebookItemsIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSearchForNotebookItemsIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSearchForNotebookItemsIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v5 = self->_notes;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  if ([(_INPBSearchForNotebookItemsIntentResponse *)self hasSortType]) {
    PBDataWriterWriteInt32Field();
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v10 = self->_taskLists;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v15 = self->_tasks;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSearchForNotebookItemsIntentResponseReadFrom(self, (uint64_t)a3);
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
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
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

- (id)taskListsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_taskLists objectAtIndexedSubscript:a3];
}

- (unint64_t)taskListsCount
{
  return [(NSArray *)self->_taskLists count];
}

- (void)addTaskLists:(id)a3
{
  id v4 = a3;
  taskLists = self->_taskLists;
  id v8 = v4;
  if (!taskLists)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_taskLists;
    self->_taskLists = v6;

    id v4 = v8;
    taskLists = self->_taskLists;
  }
  [(NSArray *)taskLists addObject:v4];
}

- (void)clearTaskLists
{
}

- (void)setTaskLists:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  taskLists = self->_taskLists;
  self->_taskLists = v4;

  MEMORY[0x1F41817F8](v4, taskLists);
}

- (int)StringAsSortType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AS_IS"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"BY_DATE"];
  }

  return v4;
}

- (id)sortTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"BY_DATE";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"AS_IS";
  }
  return v4;
}

- (void)setHasSortType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSortType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSortType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int sortType = a3;
  }
}

- (id)notesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_notes objectAtIndexedSubscript:a3];
}

- (unint64_t)notesCount
{
  return [(NSArray *)self->_notes count];
}

- (void)addNotes:(id)a3
{
  id v4 = a3;
  notes = self->_notes;
  id v8 = v4;
  if (!notes)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_notes;
    self->_notes = v6;

    id v4 = v8;
    notes = self->_notes;
  }
  [(NSArray *)notes addObject:v4];
}

- (void)clearNotes
{
}

- (void)setNotes:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  notes = self->_notes;
  self->_notes = v4;

  MEMORY[0x1F41817F8](v4, notes);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)tasksType
{
  return (Class)objc_opt_class();
}

+ (Class)taskListsType
{
  return (Class)objc_opt_class();
}

+ (Class)notesType
{
  return (Class)objc_opt_class();
}

@end