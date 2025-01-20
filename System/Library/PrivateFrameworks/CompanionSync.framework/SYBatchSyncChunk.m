@interface SYBatchSyncChunk
+ (Class)objectsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)objects;
- (NSString)syncID;
- (SYMessageHeader)header;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)objectsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)objectsCount;
- (unsigned)chunkIndex;
- (void)addObjects:(id)a3;
- (void)clearObjects;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChunkIndex:(unsigned int)a3;
- (void)setHeader:(id)a3;
- (void)setObjects:(id)a3;
- (void)setSyncID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SYBatchSyncChunk

- (void)clearObjects
{
}

- (void)addObjects:(id)a3
{
  id v4 = a3;
  objects = self->_objects;
  id v8 = v4;
  if (!objects)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_objects;
    self->_objects = v6;

    id v4 = v8;
    objects = self->_objects;
  }
  [(NSMutableArray *)objects addObject:v4];
}

- (unint64_t)objectsCount
{
  return [(NSMutableArray *)self->_objects count];
}

- (id)objectsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_objects objectAtIndex:a3];
}

+ (Class)objectsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SYBatchSyncChunk;
  id v4 = [(SYBatchSyncChunk *)&v8 description];
  v5 = [(SYBatchSyncChunk *)self dictionaryRepresentation];
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
  v7 = [NSNumber numberWithUnsignedInt:self->_chunkIndex];
  [v3 setObject:v7 forKey:@"chunkIndex"];

  objects = self->_objects;
  if (objects) {
    [v3 setObject:objects forKey:@"objects"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYBatchSyncChunkReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_header) {
    -[SYBatchSyncChunk writeTo:]();
  }
  v5 = v4;
  PBDataWriterWriteSubmessage();
  if (!self->_syncID) {
    -[SYBatchSyncChunk writeTo:]();
  }
  PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_objects;
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
  v8[2] = self->_chunkIndex;
  if ([(SYBatchSyncChunk *)self objectsCount])
  {
    [v8 clearObjects];
    unint64_t v4 = [(SYBatchSyncChunk *)self objectsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(SYBatchSyncChunk *)self objectsAtIndex:i];
        [v8 addObjects:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SYMessageHeader *)self->_header copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_syncID copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  *(_DWORD *)(v5 + 8) = self->_chunkIndex;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = self->_objects;
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
        [(id)v5 addObjects:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((header = self->_header, !((unint64_t)header | v4[2])) || -[SYMessageHeader isEqual:](header, "isEqual:"))
    && ((syncID = self->_syncID, !((unint64_t)syncID | v4[4]))
     || -[NSString isEqual:](syncID, "isEqual:"))
    && self->_chunkIndex == *((_DWORD *)v4 + 2))
  {
    objects = self->_objects;
    if ((unint64_t)objects | v4[3]) {
      char v8 = -[NSMutableArray isEqual:](objects, "isEqual:");
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
  uint64_t v5 = 2654435761 * self->_chunkIndex;
  return v4 ^ [(NSMutableArray *)self->_objects hash] ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  header = self->_header;
  uint64_t v6 = *((void *)v4 + 2);
  if (header)
  {
    if (v6) {
      -[SYMessageHeader mergeFrom:](header, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SYBatchSyncChunk setHeader:](self, "setHeader:");
  }
  if (*((void *)v4 + 4)) {
    -[SYBatchSyncChunk setSyncID:](self, "setSyncID:");
  }
  self->_chunkIndex = *((_DWORD *)v4 + 2);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = *((id *)v4 + 3);
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
        -[SYBatchSyncChunk addObjects:](self, "addObjects:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
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

- (unsigned)chunkIndex
{
  return self->_chunkIndex;
}

- (void)setChunkIndex:(unsigned int)a3
{
  self->_chunkIndex = a3;
}

- (NSMutableArray)objects
{
  return self->_objects;
}

- (void)setObjects:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncID, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYBatchSyncChunk writeTo:]", "SYBatchSyncChunk.m", 142, "self->_header != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SYBatchSyncChunk writeTo:]", "SYBatchSyncChunk.m", 147, "nil != self->_syncID");
}

@end