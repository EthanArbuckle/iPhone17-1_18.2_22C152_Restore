@interface HDCodableObjectAuthorization
+ (Class)authorizationsType;
- (BOOL)hasObjectUUID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)objectUUID;
- (NSMutableArray)authorizations;
- (id)authorizationsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)authorizationsCount;
- (unint64_t)hash;
- (void)addAuthorizations:(id)a3;
- (void)clearAuthorizations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuthorizations:(id)a3;
- (void)setObjectUUID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableObjectAuthorization

- (BOOL)hasObjectUUID
{
  return self->_objectUUID != 0;
}

- (void)clearAuthorizations
{
}

- (void)addAuthorizations:(id)a3
{
  id v4 = a3;
  authorizations = self->_authorizations;
  id v8 = v4;
  if (!authorizations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_authorizations;
    self->_authorizations = v6;

    id v4 = v8;
    authorizations = self->_authorizations;
  }
  [(NSMutableArray *)authorizations addObject:v4];
}

- (unint64_t)authorizationsCount
{
  return [(NSMutableArray *)self->_authorizations count];
}

- (id)authorizationsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_authorizations objectAtIndex:a3];
}

+ (Class)authorizationsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableObjectAuthorization;
  id v4 = [(HDCodableObjectAuthorization *)&v8 description];
  v5 = [(HDCodableObjectAuthorization *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  objectUUID = self->_objectUUID;
  if (objectUUID) {
    [v3 setObject:objectUUID forKey:@"objectUUID"];
  }
  if ([(NSMutableArray *)self->_authorizations count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_authorizations, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_authorizations;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"authorizations"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableObjectAuthorizationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_objectUUID) {
    PBDataWriterWriteDataField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_authorizations;
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
  if (self->_objectUUID) {
    objc_msgSend(v8, "setObjectUUID:");
  }
  if ([(HDCodableObjectAuthorization *)self authorizationsCount])
  {
    [v8 clearAuthorizations];
    unint64_t v4 = [(HDCodableObjectAuthorization *)self authorizationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HDCodableObjectAuthorization *)self authorizationsAtIndex:i];
        [v8 addAuthorizations:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_objectUUID copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_authorizations;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [v5 addAuthorizations:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((objectUUID = self->_objectUUID, !((unint64_t)objectUUID | v4[2]))
     || -[NSData isEqual:](objectUUID, "isEqual:")))
  {
    authorizations = self->_authorizations;
    if ((unint64_t)authorizations | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](authorizations, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_objectUUID hash];
  return [(NSMutableArray *)self->_authorizations hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[HDCodableObjectAuthorization setObjectUUID:](self, "setObjectUUID:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[HDCodableObjectAuthorization addAuthorizations:](self, "addAuthorizations:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSData)objectUUID
{
  return self->_objectUUID;
}

- (void)setObjectUUID:(id)a3
{
}

- (NSMutableArray)authorizations
{
  return self->_authorizations;
}

- (void)setAuthorizations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectUUID, 0);

  objc_storeStrong((id *)&self->_authorizations, 0);
}

@end