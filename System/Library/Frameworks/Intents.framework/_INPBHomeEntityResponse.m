@interface _INPBHomeEntityResponse
+ (BOOL)supportsSecureCoding;
+ (Class)taskResponsesType;
- (BOOL)hasEntity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)taskResponses;
- (_INPBHomeEntity)entity;
- (_INPBHomeEntityResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)taskResponsesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)taskResponsesCount;
- (void)addTaskResponses:(id)a3;
- (void)clearTaskResponses;
- (void)encodeWithCoder:(id)a3;
- (void)setEntity:(id)a3;
- (void)setTaskResponses:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBHomeEntityResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskResponses, 0);

  objc_storeStrong((id *)&self->_entity, 0);
}

- (NSArray)taskResponses
{
  return self->_taskResponses;
}

- (_INPBHomeEntity)entity
{
  return self->_entity;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBHomeEntityResponse *)self entity];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"entity"];

  if ([(NSArray *)self->_taskResponses count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_taskResponses;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"taskResponses"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBHomeEntity *)self->_entity hash];
  return [(NSArray *)self->_taskResponses hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBHomeEntityResponse *)self entity];
  v6 = [v4 entity];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBHomeEntityResponse *)self entity];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(_INPBHomeEntityResponse *)self entity];
    uint64_t v10 = [v4 entity];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBHomeEntityResponse *)self taskResponses];
  v6 = [v4 taskResponses];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBHomeEntityResponse *)self taskResponses];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    long long v14 = [(_INPBHomeEntityResponse *)self taskResponses];
    long long v15 = [v4 taskResponses];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBHomeEntityResponse allocWithZone:](_INPBHomeEntityResponse, "allocWithZone:") init];
  id v6 = [(_INPBHomeEntity *)self->_entity copyWithZone:a3];
  [(_INPBHomeEntityResponse *)v5 setEntity:v6];

  uint64_t v7 = (void *)[(NSArray *)self->_taskResponses copyWithZone:a3];
  [(_INPBHomeEntityResponse *)v5 setTaskResponses:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBHomeEntityResponse *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBHomeEntityResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBHomeEntityResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBHomeEntityResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBHomeEntityResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_INPBHomeEntityResponse *)self entity];

  if (v5)
  {
    id v6 = [(_INPBHomeEntityResponse *)self entity];
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_taskResponses;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBHomeEntityResponseReadFrom(self, (uint64_t)a3);
}

- (id)taskResponsesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_taskResponses objectAtIndexedSubscript:a3];
}

- (unint64_t)taskResponsesCount
{
  return [(NSArray *)self->_taskResponses count];
}

- (void)addTaskResponses:(id)a3
{
  id v4 = a3;
  taskResponses = self->_taskResponses;
  id v8 = v4;
  if (!taskResponses)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_taskResponses;
    self->_taskResponses = v6;

    id v4 = v8;
    taskResponses = self->_taskResponses;
  }
  [(NSArray *)taskResponses addObject:v4];
}

- (void)clearTaskResponses
{
}

- (void)setTaskResponses:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  taskResponses = self->_taskResponses;
  self->_taskResponses = v4;

  MEMORY[0x1F41817F8](v4, taskResponses);
}

- (BOOL)hasEntity
{
  return self->_entity != 0;
}

- (void)setEntity:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)taskResponsesType
{
  return (Class)objc_opt_class();
}

@end