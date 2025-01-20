@interface SYSyncAllObjects
+ (Class)allObjectsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)allObjects;
- (NSString)syncID;
- (SYMessageHeader)header;
- (id)allObjectsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)allObjectsCount;
- (unint64_t)hash;
- (unint64_t)version;
- (void)addAllObjects:(id)a3;
- (void)clearAllObjects;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAllObjects:(id)a3;
- (void)setHeader:(id)a3;
- (void)setSyncID:(id)a3;
- (void)setVersion:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation SYSyncAllObjects

- (void)clearAllObjects
{
}

- (void)addAllObjects:(id)a3
{
  id v4 = a3;
  allObjects = self->_allObjects;
  id v8 = v4;
  if (!allObjects)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_allObjects;
    self->_allObjects = v6;

    id v4 = v8;
    allObjects = self->_allObjects;
  }
  [(NSMutableArray *)allObjects addObject:v4];
}

- (unint64_t)allObjectsCount
{
  return [(NSMutableArray *)self->_allObjects count];
}

- (id)allObjectsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_allObjects objectAtIndex:a3];
}

+ (Class)allObjectsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SYSyncAllObjects;
  id v4 = [(SYSyncAllObjects *)&v8 description];
  v5 = [(SYSyncAllObjects *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  header = self->_header;
  if (header)
  {
    v5 = [(SYMessageHeader *)header dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"header"];
  }
  syncID = self->_syncID;
  if (syncID) {
    [v3 setObject:syncID forKey:@"syncID"];
  }
  v7 = [NSNumber numberWithUnsignedLongLong:self->_version];
  [v3 setObject:v7 forKey:@"version"];

  allObjects = self->_allObjects;
  if (allObjects) {
    [v3 setObject:allObjects forKey:@"allObjects"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYSyncAllObjectsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_header) {
    -[SYSyncAllObjects writeTo:]();
  }
  v5 = v4;
  PBDataWriterWriteSubmessage();
  if (!self->_syncID) {
    -[SYSyncAllObjects writeTo:]();
  }
  PBDataWriterWriteStringField();
  PBDataWriterWriteUint64Field();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_allObjects;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteDataField();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = a3;
  [v8 setHeader:self->_header];
  [v8 setSyncID:self->_syncID];
  v8[1] = self->_version;
  if ([(SYSyncAllObjects *)self allObjectsCount])
  {
    [v8 clearAllObjects];
    unint64_t v4 = [(SYSyncAllObjects *)self allObjectsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(SYSyncAllObjects *)self allObjectsAtIndex:i];
        [v8 addAllObjects:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SYMessageHeader *)self->_header copyWithZone:a3];
  uint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_syncID copyWithZone:a3];
  uint64_t v9 = (void *)v5[4];
  v5[4] = v8;

  v5[1] = self->_version;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = self->_allObjects;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (void)v17);
        [v5 addAllObjects:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((header = self->_header, !((unint64_t)header | v4[3])) || -[SYMessageHeader isEqual:](header, "isEqual:"))
    && ((syncID = self->_syncID, !((unint64_t)syncID | v4[4]))
     || -[NSString isEqual:](syncID, "isEqual:"))
    && self->_version == v4[1])
  {
    allObjects = self->_allObjects;
    if ((unint64_t)allObjects | v4[2]) {
      char v8 = -[NSMutableArray isEqual:](allObjects, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SYMessageHeader *)self->_header hash];
  NSUInteger v4 = [(NSString *)self->_syncID hash] ^ v3;
  unint64_t v5 = 2654435761u * self->_version;
  return v4 ^ [(NSMutableArray *)self->_allObjects hash] ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  header = self->_header;
  uint64_t v6 = *((void *)v4 + 3);
  if (header)
  {
    if (v6) {
      -[SYMessageHeader mergeFrom:](header, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SYSyncAllObjects setHeader:](self, "setHeader:");
  }
  if (*((void *)v4 + 4)) {
    -[SYSyncAllObjects setSyncID:](self, "setSyncID:");
  }
  self->_version = *((void *)v4 + 1);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = *((id *)v4 + 2);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[SYSyncAllObjects addAllObjects:](self, "addAllObjects:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (SYMessageHeader)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (NSString)syncID
{
  return self->_syncID;
}

- (void)setSyncID:(id)a3
{
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (NSMutableArray)allObjects
{
  return self->_allObjects;
}

- (void)setAllObjects:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncID, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_allObjects, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYSyncAllObjects writeTo:]", "SYSyncAllObjects.m", 142, "self->_header != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SYSyncAllObjects writeTo:]", "SYSyncAllObjects.m", 147, "nil != self->_syncID");
}

@end