@interface _INPBAddTasksIntentResponse
+ (BOOL)supportsSecureCoding;
+ (Class)addedTasksType;
- (BOOL)hasModifiedTaskList;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)addedTasks;
- (_INPBAddTasksIntentResponse)initWithCoder:(id)a3;
- (_INPBTaskList)modifiedTaskList;
- (id)addedTasksAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)warningsAsString:(int)a3;
- (int)StringAsWarnings:(id)a3;
- (int)warnings;
- (int)warningsAtIndex:(unint64_t)a3;
- (unint64_t)addedTasksCount;
- (unint64_t)hash;
- (unint64_t)warningsCount;
- (void)addAddedTasks:(id)a3;
- (void)addWarnings:(int)a3;
- (void)clearAddedTasks;
- (void)clearWarnings;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAddedTasks:(id)a3;
- (void)setModifiedTaskList:(id)a3;
- (void)setWarnings:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation _INPBAddTasksIntentResponse

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = self->_addedTasks;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  v10 = [(_INPBAddTasksIntentResponse *)self modifiedTaskList];

  if (v10)
  {
    v11 = [(_INPBAddTasksIntentResponse *)self modifiedTaskList];
    PBDataWriterWriteSubmessage();
  }
  p_warnings = &self->_warnings;
  if (p_warnings->count)
  {
    unint64_t v13 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v13;
    }
    while (v13 < p_warnings->count);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedTaskList, 0);

  objc_storeStrong((id *)&self->_addedTasks, 0);
}

- (_INPBTaskList)modifiedTaskList
{
  return self->_modifiedTaskList;
}

- (NSArray)addedTasks
{
  return self->_addedTasks;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_addedTasks count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v5 = self->_addedTasks;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v18 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"addedTasks"];
  }
  v11 = [(_INPBAddTasksIntentResponse *)self modifiedTaskList];
  v12 = [v11 dictionaryRepresentation];
  [v3 setObject:v12 forKeyedSubscript:@"modifiedTaskList"];

  if (self->_warnings.count)
  {
    unint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[_INPBAddTasksIntentResponse warningsCount](self, "warningsCount"));
    if ([(_INPBAddTasksIntentResponse *)self warningsCount])
    {
      unint64_t v14 = 0;
      do
      {
        uint64_t v15 = self->_warnings.list[v14];
        if (v15 >= 5)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_warnings.list[v14]);
          long long v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          long long v16 = off_1E551C410[v15];
        }
        [v13 addObject:v16];

        ++v14;
      }
      while (v14 < [(_INPBAddTasksIntentResponse *)self warningsCount]);
    }
    [v3 setObject:v13 forKeyedSubscript:@"warnings"];
  }

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_addedTasks hash];
  unint64_t v4 = [(_INPBTaskList *)self->_modifiedTaskList hash] ^ v3;
  return v4 ^ PBRepeatedInt32Hash();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBAddTasksIntentResponse *)self addedTasks];
  uint64_t v6 = [v4 addedTasks];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBAddTasksIntentResponse *)self addedTasks];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(_INPBAddTasksIntentResponse *)self addedTasks];
    v10 = [v4 addedTasks];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBAddTasksIntentResponse *)self modifiedTaskList];
  uint64_t v6 = [v4 modifiedTaskList];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBAddTasksIntentResponse *)self modifiedTaskList];
    if (!v12)
    {

LABEL_15:
      char IsEqual = PBRepeatedInt32IsEqual();
      goto LABEL_13;
    }
    unint64_t v13 = (void *)v12;
    unint64_t v14 = [(_INPBAddTasksIntentResponse *)self modifiedTaskList];
    uint64_t v15 = [v4 modifiedTaskList];
    int v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  char IsEqual = 0;
LABEL_13:

  return IsEqual;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBAddTasksIntentResponse allocWithZone:](_INPBAddTasksIntentResponse, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSArray *)self->_addedTasks copyWithZone:a3];
  [(_INPBAddTasksIntentResponse *)v5 setAddedTasks:v6];

  id v7 = [(_INPBTaskList *)self->_modifiedTaskList copyWithZone:a3];
  [(_INPBAddTasksIntentResponse *)v5 setModifiedTaskList:v7];

  PBRepeatedInt32Copy();
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBAddTasksIntentResponse *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBAddTasksIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBAddTasksIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBAddTasksIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBAddTasksIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)dealloc
{
  [(_INPBAddTasksIntentResponse *)self clearWarnings];
  v3.receiver = self;
  v3.super_class = (Class)_INPBAddTasksIntentResponse;
  [(_INPBAddTasksIntentResponse *)&v3 dealloc];
}

- (BOOL)readFrom:(id)a3
{
  return _INPBAddTasksIntentResponseReadFrom(self, (uint64_t)a3);
}

- (int)StringAsWarnings:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LOCATION_SERVICES_DISABLED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FLAGGED_NOT_ALLOWED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CONTACT_TRIGGER_NOT_ALLOWED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"NOT_UPGRADED_TO_CLOUDKIT"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)warningsAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551C410[a3];
  }

  return v3;
}

- (int)warningsAtIndex:(unint64_t)a3
{
  return self->_warnings.list[a3];
}

- (unint64_t)warningsCount
{
  return self->_warnings.count;
}

- (void)addWarnings:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearWarnings
{
}

- (int)warnings
{
  return self->_warnings.list;
}

- (void)setWarnings:(int *)a3 count:(unint64_t)a4
{
}

- (BOOL)hasModifiedTaskList
{
  return self->_modifiedTaskList != 0;
}

- (void)setModifiedTaskList:(id)a3
{
}

- (id)addedTasksAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_addedTasks objectAtIndexedSubscript:a3];
}

- (unint64_t)addedTasksCount
{
  return [(NSArray *)self->_addedTasks count];
}

- (void)addAddedTasks:(id)a3
{
  id v4 = a3;
  addedTasks = self->_addedTasks;
  id v8 = v4;
  if (!addedTasks)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_addedTasks;
    self->_addedTasks = v6;

    id v4 = v8;
    addedTasks = self->_addedTasks;
  }
  [(NSArray *)addedTasks addObject:v4];
}

- (void)clearAddedTasks
{
}

- (void)setAddedTasks:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  addedTasks = self->_addedTasks;
  self->_addedTasks = v4;

  MEMORY[0x1F41817F8](v4, addedTasks);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)addedTasksType
{
  return (Class)objc_opt_class();
}

@end