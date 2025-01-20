@interface _INPBSearchForFilesIntentResponse
+ (BOOL)supportsSecureCoding;
+ (Class)entitiesType;
- (BOOL)hasNumResults;
- (BOOL)hasQuery;
- (BOOL)hasSuccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)success;
- (NSArray)entities;
- (_INPBInteger)numResults;
- (_INPBSearchForFilesIntentResponse)initWithCoder:(id)a3;
- (_INPBString)query;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)entitiesAtIndex:(unint64_t)a3;
- (unint64_t)entitiesCount;
- (unint64_t)hash;
- (void)addEntities:(id)a3;
- (void)clearEntities;
- (void)encodeWithCoder:(id)a3;
- (void)setEntities:(id)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setNumResults:(id)a3;
- (void)setQuery:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSearchForFilesIntentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_numResults, 0);

  objc_storeStrong((id *)&self->_entities, 0);
}

- (BOOL)success
{
  return self->_success;
}

- (_INPBString)query
{
  return self->_query;
}

- (_INPBInteger)numResults
{
  return self->_numResults;
}

- (NSArray)entities
{
  return self->_entities;
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_entities count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v5 = self->_entities;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"entities"];
  }
  v11 = [(_INPBSearchForFilesIntentResponse *)self numResults];
  v12 = [v11 dictionaryRepresentation];
  [v3 setObject:v12 forKeyedSubscript:@"numResults"];

  v13 = [(_INPBSearchForFilesIntentResponse *)self query];
  v14 = [v13 dictionaryRepresentation];
  [v3 setObject:v14 forKeyedSubscript:@"query"];

  if ([(_INPBSearchForFilesIntentResponse *)self hasSuccess])
  {
    v15 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBSearchForFilesIntentResponse success](self, "success"));
    [v3 setObject:v15 forKeyedSubscript:@"success"];
  }

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_entities hash];
  unint64_t v4 = [(_INPBInteger *)self->_numResults hash];
  unint64_t v5 = [(_INPBString *)self->_query hash];
  if ([(_INPBSearchForFilesIntentResponse *)self hasSuccess]) {
    uint64_t v6 = 2654435761 * self->_success;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  unint64_t v5 = [(_INPBSearchForFilesIntentResponse *)self entities];
  uint64_t v6 = [v4 entities];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBSearchForFilesIntentResponse *)self entities];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_INPBSearchForFilesIntentResponse *)self entities];
    v10 = [v4 entities];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSearchForFilesIntentResponse *)self numResults];
  uint64_t v6 = [v4 numResults];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBSearchForFilesIntentResponse *)self numResults];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBSearchForFilesIntentResponse *)self numResults];
    v15 = [v4 numResults];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSearchForFilesIntentResponse *)self query];
  uint64_t v6 = [v4 query];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v17 = [(_INPBSearchForFilesIntentResponse *)self query];
  if (v17)
  {
    long long v18 = (void *)v17;
    long long v19 = [(_INPBSearchForFilesIntentResponse *)self query];
    long long v20 = [v4 query];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  int v24 = [(_INPBSearchForFilesIntentResponse *)self hasSuccess];
  if (v24 == [v4 hasSuccess])
  {
    if (![(_INPBSearchForFilesIntentResponse *)self hasSuccess]
      || ![v4 hasSuccess]
      || (int success = self->_success, success == [v4 success]))
    {
      BOOL v22 = 1;
      goto LABEL_18;
    }
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBSearchForFilesIntentResponse allocWithZone:](_INPBSearchForFilesIntentResponse, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSArray *)self->_entities copyWithZone:a3];
  [(_INPBSearchForFilesIntentResponse *)v5 setEntities:v6];

  id v7 = [(_INPBInteger *)self->_numResults copyWithZone:a3];
  [(_INPBSearchForFilesIntentResponse *)v5 setNumResults:v7];

  id v8 = [(_INPBString *)self->_query copyWithZone:a3];
  [(_INPBSearchForFilesIntentResponse *)v5 setQuery:v8];

  if ([(_INPBSearchForFilesIntentResponse *)self hasSuccess]) {
    [(_INPBSearchForFilesIntentResponse *)v5 setSuccess:[(_INPBSearchForFilesIntentResponse *)self success]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSearchForFilesIntentResponse *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSearchForFilesIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSearchForFilesIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSearchForFilesIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSearchForFilesIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v5 = self->_entities;
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

  v10 = [(_INPBSearchForFilesIntentResponse *)self numResults];

  if (v10)
  {
    int v11 = [(_INPBSearchForFilesIntentResponse *)self numResults];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v12 = [(_INPBSearchForFilesIntentResponse *)self query];

  if (v12)
  {
    v13 = [(_INPBSearchForFilesIntentResponse *)self query];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBSearchForFilesIntentResponse *)self hasSuccess]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSearchForFilesIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)setHasSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSuccess
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int success = a3;
}

- (BOOL)hasQuery
{
  return self->_query != 0;
}

- (void)setQuery:(id)a3
{
}

- (BOOL)hasNumResults
{
  return self->_numResults != 0;
}

- (void)setNumResults:(id)a3
{
}

- (id)entitiesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_entities objectAtIndexedSubscript:a3];
}

- (unint64_t)entitiesCount
{
  return [(NSArray *)self->_entities count];
}

- (void)addEntities:(id)a3
{
  id v4 = a3;
  entities = self->_entities;
  id v8 = v4;
  if (!entities)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_entities;
    self->_entities = v6;

    id v4 = v8;
    entities = self->_entities;
  }
  [(NSArray *)entities addObject:v4];
}

- (void)clearEntities
{
}

- (void)setEntities:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  entities = self->_entities;
  self->_entities = v4;

  MEMORY[0x1F41817F8](v4, entities);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)entitiesType
{
  return (Class)objc_opt_class();
}

@end