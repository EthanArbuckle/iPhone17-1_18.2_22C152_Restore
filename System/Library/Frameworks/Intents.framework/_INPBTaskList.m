@interface _INPBTaskList
+ (BOOL)supportsSecureCoding;
+ (Class)tasksType;
- (BOOL)hasCreatedDateTime;
- (BOOL)hasGroupName;
- (BOOL)hasIdentifier;
- (BOOL)hasModifiedDateTime;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)tasks;
- (NSString)identifier;
- (_INPBDataString)groupName;
- (_INPBDataString)title;
- (_INPBDateTime)createdDateTime;
- (_INPBDateTime)modifiedDateTime;
- (_INPBTaskList)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)tasksAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)tasksCount;
- (void)addTasks:(id)a3;
- (void)clearTasks;
- (void)encodeWithCoder:(id)a3;
- (void)setCreatedDateTime:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setModifiedDateTime:(id)a3;
- (void)setTasks:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBTaskList

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_modifiedDateTime, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_groupName, 0);

  objc_storeStrong((id *)&self->_createdDateTime, 0);
}

- (_INPBDataString)title
{
  return self->_title;
}

- (NSArray)tasks
{
  return self->_tasks;
}

- (_INPBDateTime)modifiedDateTime
{
  return self->_modifiedDateTime;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_INPBDataString)groupName
{
  return self->_groupName;
}

- (_INPBDateTime)createdDateTime
{
  return self->_createdDateTime;
}

- (id)dictionaryRepresentation
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBTaskList *)self createdDateTime];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"createdDateTime"];

  v6 = [(_INPBTaskList *)self groupName];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"groupName"];

  if (self->_identifier)
  {
    v8 = [(_INPBTaskList *)self identifier];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"identifier"];
  }
  v10 = [(_INPBTaskList *)self modifiedDateTime];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"modifiedDateTime"];

  if ([(NSArray *)self->_tasks count])
  {
    v12 = [MEMORY[0x1E4F1CA48] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v13 = self->_tasks;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "dictionaryRepresentation", (void)v22);
          [v12 addObject:v18];
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKeyedSubscript:@"tasks"];
  }
  v19 = [(_INPBTaskList *)self title];
  v20 = [v19 dictionaryRepresentation];
  [v3 setObject:v20 forKeyedSubscript:@"title"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBDateTime *)self->_createdDateTime hash];
  unint64_t v4 = [(_INPBDataString *)self->_groupName hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_identifier hash];
  unint64_t v6 = v4 ^ v5 ^ [(_INPBDateTime *)self->_modifiedDateTime hash];
  uint64_t v7 = [(NSArray *)self->_tasks hash];
  return v6 ^ v7 ^ [(_INPBDataString *)self->_title hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  NSUInteger v5 = [(_INPBTaskList *)self createdDateTime];
  unint64_t v6 = [v4 createdDateTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v7 = [(_INPBTaskList *)self createdDateTime];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBTaskList *)self createdDateTime];
    v10 = [v4 createdDateTime];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBTaskList *)self groupName];
  unint64_t v6 = [v4 groupName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v12 = [(_INPBTaskList *)self groupName];
  if (v12)
  {
    v13 = (void *)v12;
    uint64_t v14 = [(_INPBTaskList *)self groupName];
    uint64_t v15 = [v4 groupName];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBTaskList *)self identifier];
  unint64_t v6 = [v4 identifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v17 = [(_INPBTaskList *)self identifier];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBTaskList *)self identifier];
    v20 = [v4 identifier];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBTaskList *)self modifiedDateTime];
  unint64_t v6 = [v4 modifiedDateTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v22 = [(_INPBTaskList *)self modifiedDateTime];
  if (v22)
  {
    long long v23 = (void *)v22;
    long long v24 = [(_INPBTaskList *)self modifiedDateTime];
    long long v25 = [v4 modifiedDateTime];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBTaskList *)self tasks];
  unint64_t v6 = [v4 tasks];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v27 = [(_INPBTaskList *)self tasks];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_INPBTaskList *)self tasks];
    v30 = [v4 tasks];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBTaskList *)self title];
  unint64_t v6 = [v4 title];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v32 = [(_INPBTaskList *)self title];
    if (!v32)
    {

LABEL_35:
      BOOL v37 = 1;
      goto LABEL_33;
    }
    v33 = (void *)v32;
    v34 = [(_INPBTaskList *)self title];
    v35 = [v4 title];
    char v36 = [v34 isEqual:v35];

    if (v36) {
      goto LABEL_35;
    }
  }
  else
  {
LABEL_31:
  }
LABEL_32:
  BOOL v37 = 0;
LABEL_33:

  return v37;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = [+[_INPBTaskList allocWithZone:](_INPBTaskList, "allocWithZone:") init];
  id v6 = [(_INPBDateTime *)self->_createdDateTime copyWithZone:a3];
  [(_INPBTaskList *)v5 setCreatedDateTime:v6];

  id v7 = [(_INPBDataString *)self->_groupName copyWithZone:a3];
  [(_INPBTaskList *)v5 setGroupName:v7];

  v8 = (void *)[(NSString *)self->_identifier copyWithZone:a3];
  [(_INPBTaskList *)v5 setIdentifier:v8];

  id v9 = [(_INPBDateTime *)self->_modifiedDateTime copyWithZone:a3];
  [(_INPBTaskList *)v5 setModifiedDateTime:v9];

  v10 = (void *)[(NSArray *)self->_tasks copyWithZone:a3];
  [(_INPBTaskList *)v5 setTasks:v10];

  id v11 = [(_INPBDataString *)self->_title copyWithZone:a3];
  [(_INPBTaskList *)v5 setTitle:v11];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBTaskList *)self data];
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBTaskList)initWithCoder:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBTaskList *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBTaskList *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBTaskList *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(_INPBTaskList *)self createdDateTime];

  if (v5)
  {
    id v6 = [(_INPBTaskList *)self createdDateTime];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_INPBTaskList *)self groupName];

  if (v7)
  {
    v8 = [(_INPBTaskList *)self groupName];
    PBDataWriterWriteSubmessage();
  }
  id v9 = [(_INPBTaskList *)self identifier];

  if (v9) {
    PBDataWriterWriteStringField();
  }
  v10 = [(_INPBTaskList *)self modifiedDateTime];

  if (v10)
  {
    id v11 = [(_INPBTaskList *)self modifiedDateTime];
    PBDataWriterWriteSubmessage();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v12 = self->_tasks;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  uint64_t v17 = [(_INPBTaskList *)self title];

  if (v17)
  {
    v18 = [(_INPBTaskList *)self title];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBTaskListReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (void)setTitle:(id)a3
{
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
  self->_tasks = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
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
  self->_identifier = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasGroupName
{
  return self->_groupName != 0;
}

- (void)setGroupName:(id)a3
{
}

- (BOOL)hasCreatedDateTime
{
  return self->_createdDateTime != 0;
}

- (void)setCreatedDateTime:(id)a3
{
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