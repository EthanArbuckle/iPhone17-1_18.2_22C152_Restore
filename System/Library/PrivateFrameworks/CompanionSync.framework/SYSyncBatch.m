@interface SYSyncBatch
+ (Class)changesType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)changes;
- (NSString)sessionID;
- (SYMessageHeader)header;
- (id)changesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)changesCount;
- (unint64_t)hash;
- (unint64_t)index;
- (void)addChanges:(id)a3;
- (void)clearChanges;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChanges:(id)a3;
- (void)setHeader:(id)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setSessionID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SYSyncBatch

- (void)clearChanges
{
}

- (void)addChanges:(id)a3
{
  id v4 = a3;
  changes = self->_changes;
  id v8 = v4;
  if (!changes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_changes;
    self->_changes = v6;

    id v4 = v8;
    changes = self->_changes;
  }
  [(NSMutableArray *)changes addObject:v4];
}

- (unint64_t)changesCount
{
  return [(NSMutableArray *)self->_changes count];
}

- (id)changesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_changes objectAtIndex:a3];
}

+ (Class)changesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SYSyncBatch;
  id v4 = [(SYSyncBatch *)&v8 description];
  v5 = [(SYSyncBatch *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  header = self->_header;
  if (header)
  {
    v5 = [(SYMessageHeader *)header dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"header"];
  }
  sessionID = self->_sessionID;
  if (sessionID) {
    [v3 setObject:sessionID forKey:@"sessionID"];
  }
  v7 = [NSNumber numberWithUnsignedLongLong:self->_index];
  [v3 setObject:v7 forKey:@"index"];

  if ([(NSMutableArray *)self->_changes count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_changes, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v9 = self->_changes;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKey:@"changes"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYSyncBatchReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_header) {
    -[SYSyncBatch writeTo:]();
  }
  v5 = v4;
  PBDataWriterWriteSubmessage();
  if (!self->_sessionID) {
    -[SYSyncBatch writeTo:]();
  }
  PBDataWriterWriteStringField();
  PBDataWriterWriteUint64Field();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_changes;
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
        PBDataWriterWriteSubmessage();
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
  [v8 setSessionID:self->_sessionID];
  v8[1] = self->_index;
  if ([(SYSyncBatch *)self changesCount])
  {
    [v8 clearChanges];
    unint64_t v4 = [(SYSyncBatch *)self changesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(SYSyncBatch *)self changesAtIndex:i];
        [v8 addChanges:v7];
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

  uint64_t v8 = [(NSString *)self->_sessionID copyWithZone:a3];
  uint64_t v9 = (void *)v5[4];
  v5[4] = v8;

  v5[1] = self->_index;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = self->_changes;
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
        [v5 addChanges:v15];

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
    && ((sessionID = self->_sessionID, !((unint64_t)sessionID | v4[4]))
     || -[NSString isEqual:](sessionID, "isEqual:"))
    && self->_index == v4[1])
  {
    changes = self->_changes;
    if ((unint64_t)changes | v4[2]) {
      char v8 = -[NSMutableArray isEqual:](changes, "isEqual:");
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
  NSUInteger v4 = [(NSString *)self->_sessionID hash] ^ v3;
  unint64_t v5 = 2654435761u * self->_index;
  return v4 ^ [(NSMutableArray *)self->_changes hash] ^ v5;
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
    -[SYSyncBatch setHeader:](self, "setHeader:");
  }
  if (*((void *)v4 + 4)) {
    -[SYSyncBatch setSessionID:](self, "setSessionID:");
  }
  self->_index = *((void *)v4 + 1);
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
        -[SYSyncBatch addChanges:](self, "addChanges:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
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

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (NSMutableArray)changes
{
  return self->_changes;
}

- (void)setChanges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_changes, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYSyncBatch writeTo:]", "SYSyncBatch.m", 157, "self->_header != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SYSyncBatch writeTo:]", "SYSyncBatch.m", 162, "nil != self->_sessionID");
}

@end