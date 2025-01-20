@interface BMPBEntityRelationshipEvent
+ (Class)attributesType;
- (BMPBEntity)sourceEntity;
- (BMPBEntity)targetEntity;
- (BOOL)hasClientId;
- (BOOL)hasRelationship;
- (BOOL)hasSourceEntity;
- (BOOL)hasSourceId;
- (BOOL)hasTargetEntity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)attributes;
- (NSString)clientId;
- (NSString)relationship;
- (NSString)sourceId;
- (id)attributesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)attributesCount;
- (unint64_t)hash;
- (void)addAttributes:(id)a3;
- (void)clearAttributes;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setClientId:(id)a3;
- (void)setRelationship:(id)a3;
- (void)setSourceEntity:(id)a3;
- (void)setSourceId:(id)a3;
- (void)setTargetEntity:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBEntityRelationshipEvent

- (BOOL)hasClientId
{
  return self->_clientId != 0;
}

- (BOOL)hasRelationship
{
  return self->_relationship != 0;
}

- (BOOL)hasSourceId
{
  return self->_sourceId != 0;
}

- (BOOL)hasSourceEntity
{
  return self->_sourceEntity != 0;
}

- (BOOL)hasTargetEntity
{
  return self->_targetEntity != 0;
}

- (void)clearAttributes
{
}

- (void)addAttributes:(id)a3
{
  id v4 = a3;
  attributes = self->_attributes;
  id v8 = v4;
  if (!attributes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_attributes;
    self->_attributes = v6;

    id v4 = v8;
    attributes = self->_attributes;
  }
  [(NSMutableArray *)attributes addObject:v4];
}

- (unint64_t)attributesCount
{
  return [(NSMutableArray *)self->_attributes count];
}

- (id)attributesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_attributes objectAtIndex:a3];
}

+ (Class)attributesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBEntityRelationshipEvent;
  id v4 = [(BMPBEntityRelationshipEvent *)&v8 description];
  v5 = [(BMPBEntityRelationshipEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  clientId = self->_clientId;
  if (clientId) {
    [v3 setObject:clientId forKey:@"clientId"];
  }
  relationship = self->_relationship;
  if (relationship) {
    [v4 setObject:relationship forKey:@"relationship"];
  }
  sourceId = self->_sourceId;
  if (sourceId) {
    [v4 setObject:sourceId forKey:@"sourceId"];
  }
  sourceEntity = self->_sourceEntity;
  if (sourceEntity)
  {
    v9 = [(BMPBEntity *)sourceEntity dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"sourceEntity"];
  }
  targetEntity = self->_targetEntity;
  if (targetEntity)
  {
    v11 = [(BMPBEntity *)targetEntity dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"targetEntity"];
  }
  if ([(NSMutableArray *)self->_attributes count])
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_attributes, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v13 = self->_attributes;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (void)v20);
          [v12 addObject:v18];
        }
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v15);
    }

    [v4 setObject:v12 forKey:@"attributes"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBEntityRelationshipEventReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_clientId) {
    PBDataWriterWriteStringField();
  }
  if (self->_relationship) {
    PBDataWriterWriteStringField();
  }
  if (self->_sourceId) {
    PBDataWriterWriteStringField();
  }
  if (self->_sourceEntity) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_targetEntity) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_attributes;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_clientId) {
    objc_msgSend(v8, "setClientId:");
  }
  if (self->_relationship) {
    objc_msgSend(v8, "setRelationship:");
  }
  if (self->_sourceId) {
    objc_msgSend(v8, "setSourceId:");
  }
  if (self->_sourceEntity) {
    objc_msgSend(v8, "setSourceEntity:");
  }
  if (self->_targetEntity) {
    objc_msgSend(v8, "setTargetEntity:");
  }
  if ([(BMPBEntityRelationshipEvent *)self attributesCount])
  {
    [v8 clearAttributes];
    unint64_t v4 = [(BMPBEntityRelationshipEvent *)self attributesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(BMPBEntityRelationshipEvent *)self attributesAtIndex:i];
        [v8 addAttributes:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_clientId copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_relationship copyWithZone:a3];
  uint64_t v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_sourceId copyWithZone:a3];
  long long v11 = (void *)v5[5];
  v5[5] = v10;

  id v12 = [(BMPBEntity *)self->_sourceEntity copyWithZone:a3];
  long long v13 = (void *)v5[4];
  v5[4] = v12;

  id v14 = [(BMPBEntity *)self->_targetEntity copyWithZone:a3];
  uint64_t v15 = (void *)v5[6];
  v5[6] = v14;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v16 = self->_attributes;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v20), "copyWithZone:", a3, (void)v23);
        [v5 addAttributes:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v18);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((clientId = self->_clientId, !((unint64_t)clientId | v4[2]))
     || -[NSString isEqual:](clientId, "isEqual:"))
    && ((relationship = self->_relationship, !((unint64_t)relationship | v4[3]))
     || -[NSString isEqual:](relationship, "isEqual:"))
    && ((sourceId = self->_sourceId, !((unint64_t)sourceId | v4[5]))
     || -[NSString isEqual:](sourceId, "isEqual:"))
    && ((sourceEntity = self->_sourceEntity, !((unint64_t)sourceEntity | v4[4]))
     || -[BMPBEntity isEqual:](sourceEntity, "isEqual:"))
    && ((targetEntity = self->_targetEntity, !((unint64_t)targetEntity | v4[6]))
     || -[BMPBEntity isEqual:](targetEntity, "isEqual:")))
  {
    attributes = self->_attributes;
    if ((unint64_t)attributes | v4[1]) {
      char v11 = -[NSMutableArray isEqual:](attributes, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_clientId hash];
  NSUInteger v4 = [(NSString *)self->_relationship hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_sourceId hash];
  unint64_t v6 = v4 ^ v5 ^ [(BMPBEntity *)self->_sourceEntity hash];
  unint64_t v7 = [(BMPBEntity *)self->_targetEntity hash];
  return v6 ^ v7 ^ [(NSMutableArray *)self->_attributes hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[BMPBEntityRelationshipEvent setClientId:](self, "setClientId:");
  }
  if (*((void *)v4 + 3)) {
    -[BMPBEntityRelationshipEvent setRelationship:](self, "setRelationship:");
  }
  if (*((void *)v4 + 5)) {
    -[BMPBEntityRelationshipEvent setSourceId:](self, "setSourceId:");
  }
  sourceEntity = self->_sourceEntity;
  uint64_t v6 = *((void *)v4 + 4);
  if (sourceEntity)
  {
    if (v6) {
      -[BMPBEntity mergeFrom:](sourceEntity, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[BMPBEntityRelationshipEvent setSourceEntity:](self, "setSourceEntity:");
  }
  targetEntity = self->_targetEntity;
  uint64_t v8 = *((void *)v4 + 6);
  if (targetEntity)
  {
    if (v8) {
      -[BMPBEntity mergeFrom:](targetEntity, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[BMPBEntityRelationshipEvent setTargetEntity:](self, "setTargetEntity:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = *((id *)v4 + 1);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[BMPBEntityRelationshipEvent addAttributes:](self, "addAttributes:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (NSString)clientId
{
  return self->_clientId;
}

- (void)setClientId:(id)a3
{
}

- (NSString)relationship
{
  return self->_relationship;
}

- (void)setRelationship:(id)a3
{
}

- (NSString)sourceId
{
  return self->_sourceId;
}

- (void)setSourceId:(id)a3
{
}

- (BMPBEntity)sourceEntity
{
  return self->_sourceEntity;
}

- (void)setSourceEntity:(id)a3
{
}

- (BMPBEntity)targetEntity
{
  return self->_targetEntity;
}

- (void)setTargetEntity:(id)a3
{
}

- (NSMutableArray)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetEntity, 0);
  objc_storeStrong((id *)&self->_sourceId, 0);
  objc_storeStrong((id *)&self->_sourceEntity, 0);
  objc_storeStrong((id *)&self->_relationship, 0);
  objc_storeStrong((id *)&self->_clientId, 0);

  objc_storeStrong((id *)&self->_attributes, 0);
}

@end