@interface _INPBCreateTaskListIntent
+ (BOOL)supportsSecureCoding;
+ (Class)taskTitlesType;
- (BOOL)hasGroupName;
- (BOOL)hasIntentMetadata;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)taskTitles;
- (_INPBCreateTaskListIntent)initWithCoder:(id)a3;
- (_INPBDataString)groupName;
- (_INPBDataString)title;
- (_INPBIntentMetadata)intentMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)taskTitlesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)taskTitlesCount;
- (void)addTaskTitles:(id)a3;
- (void)clearTaskTitles;
- (void)encodeWithCoder:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setTaskTitles:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBCreateTaskListIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_taskTitles, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);

  objc_storeStrong((id *)&self->_groupName, 0);
}

- (_INPBDataString)title
{
  return self->_title;
}

- (NSArray)taskTitles
{
  return self->_taskTitles;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBDataString)groupName
{
  return self->_groupName;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBCreateTaskListIntent *)self groupName];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"groupName"];

  v6 = [(_INPBCreateTaskListIntent *)self intentMetadata];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"intentMetadata"];

  if ([(NSArray *)self->_taskTitles count])
  {
    v8 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v9 = self->_taskTitles;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKeyedSubscript:@"taskTitles"];
  }
  v15 = [(_INPBCreateTaskListIntent *)self title];
  v16 = [v15 dictionaryRepresentation];
  [v3 setObject:v16 forKeyedSubscript:@"title"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBDataString *)self->_groupName hash];
  unint64_t v4 = [(_INPBIntentMetadata *)self->_intentMetadata hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_taskTitles hash];
  return v4 ^ v5 ^ [(_INPBDataString *)self->_title hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  uint64_t v5 = [(_INPBCreateTaskListIntent *)self groupName];
  v6 = [v4 groupName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(_INPBCreateTaskListIntent *)self groupName];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBCreateTaskListIntent *)self groupName];
    uint64_t v10 = [v4 groupName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBCreateTaskListIntent *)self intentMetadata];
  v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(_INPBCreateTaskListIntent *)self intentMetadata];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBCreateTaskListIntent *)self intentMetadata];
    v15 = [v4 intentMetadata];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBCreateTaskListIntent *)self taskTitles];
  v6 = [v4 taskTitles];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(_INPBCreateTaskListIntent *)self taskTitles];
  if (v17)
  {
    long long v18 = (void *)v17;
    long long v19 = [(_INPBCreateTaskListIntent *)self taskTitles];
    long long v20 = [v4 taskTitles];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBCreateTaskListIntent *)self title];
  v6 = [v4 title];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(_INPBCreateTaskListIntent *)self title];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    uint64_t v23 = (void *)v22;
    v24 = [(_INPBCreateTaskListIntent *)self title];
    v25 = [v4 title];
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBCreateTaskListIntent allocWithZone:](_INPBCreateTaskListIntent, "allocWithZone:") init];
  id v6 = [(_INPBDataString *)self->_groupName copyWithZone:a3];
  [(_INPBCreateTaskListIntent *)v5 setGroupName:v6];

  id v7 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBCreateTaskListIntent *)v5 setIntentMetadata:v7];

  v8 = (void *)[(NSArray *)self->_taskTitles copyWithZone:a3];
  [(_INPBCreateTaskListIntent *)v5 setTaskTitles:v8];

  id v9 = [(_INPBDataString *)self->_title copyWithZone:a3];
  [(_INPBCreateTaskListIntent *)v5 setTitle:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBCreateTaskListIntent *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBCreateTaskListIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBCreateTaskListIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBCreateTaskListIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBCreateTaskListIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_INPBCreateTaskListIntent *)self groupName];

  if (v5)
  {
    id v6 = [(_INPBCreateTaskListIntent *)self groupName];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_INPBCreateTaskListIntent *)self intentMetadata];

  if (v7)
  {
    v8 = [(_INPBCreateTaskListIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = self->_taskTitles;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  v14 = [(_INPBCreateTaskListIntent *)self title];

  if (v14)
  {
    v15 = [(_INPBCreateTaskListIntent *)self title];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCreateTaskListIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (void)setTitle:(id)a3
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
  id v4 = (NSArray *)[a3 mutableCopy];
  taskTitles = self->_taskTitles;
  self->_taskTitles = v4;

  MEMORY[0x1F41817F8](v4, taskTitles);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (BOOL)hasGroupName
{
  return self->_groupName != 0;
}

- (void)setGroupName:(id)a3
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

@end