@interface FTCPPETInteractionLogEvent
+ (Class)interactionsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)interactions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)interactionsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)hashedUserId;
- (unint64_t)interactionsCount;
- (unint64_t)snapshotTimestamp;
- (void)addInteractions:(id)a3;
- (void)clearInteractions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHashedUserId:(unint64_t)a3;
- (void)setInteractions:(id)a3;
- (void)setSnapshotTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation FTCPPETInteractionLogEvent

- (void)clearInteractions
{
}

- (void)addInteractions:(id)a3
{
  id v4 = a3;
  interactions = self->_interactions;
  id v8 = v4;
  if (!interactions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_interactions;
    self->_interactions = v6;

    id v4 = v8;
    interactions = self->_interactions;
  }
  [(NSMutableArray *)interactions addObject:v4];
}

- (unint64_t)interactionsCount
{
  return [(NSMutableArray *)self->_interactions count];
}

- (id)interactionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_interactions objectAtIndex:a3];
}

+ (Class)interactionsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FTCPPETInteractionLogEvent;
  id v4 = [(FTCPPETInteractionLogEvent *)&v8 description];
  v5 = [(FTCPPETInteractionLogEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [NSNumber numberWithUnsignedLongLong:self->_hashedUserId];
  [v3 setObject:v4 forKey:@"hashedUserId"];

  v5 = [NSNumber numberWithUnsignedLongLong:self->_snapshotTimestamp];
  [v3 setObject:v5 forKey:@"snapshotTimestamp"];

  if ([(NSMutableArray *)self->_interactions count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_interactions, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_interactions;
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

    [v3 setObject:v6 forKey:@"interactions"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FTCPPETInteractionLogEventReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_interactions;
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
  id v4 = a3;
  v4[1] = self->_hashedUserId;
  id v9 = v4;
  v4[2] = self->_snapshotTimestamp;
  if ([(FTCPPETInteractionLogEvent *)self interactionsCount])
  {
    [v9 clearInteractions];
    unint64_t v5 = [(FTCPPETInteractionLogEvent *)self interactionsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(FTCPPETInteractionLogEvent *)self interactionsAtIndex:i];
        [v9 addInteractions:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = self->_hashedUserId;
  v5[2] = self->_snapshotTimestamp;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v6 = self->_interactions;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [v5 addInteractions:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_hashedUserId == v4[1]
    && self->_snapshotTimestamp == v4[2])
  {
    interactions = self->_interactions;
    if ((unint64_t)interactions | v4[3]) {
      char v6 = -[NSMutableArray isEqual:](interactions, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v2 = (2654435761u * self->_snapshotTimestamp) ^ (2654435761u * self->_hashedUserId);
  return v2 ^ [(NSMutableArray *)self->_interactions hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_hashedUserId = *((void *)v4 + 1);
  self->_snapshotTimestamp = *((void *)v4 + 2);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        -[FTCPPETInteractionLogEvent addInteractions:](self, "addInteractions:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (unint64_t)hashedUserId
{
  return self->_hashedUserId;
}

- (void)setHashedUserId:(unint64_t)a3
{
  self->_hashedUserId = a3;
}

- (unint64_t)snapshotTimestamp
{
  return self->_snapshotTimestamp;
}

- (void)setSnapshotTimestamp:(unint64_t)a3
{
  self->_snapshotTimestamp = a3;
}

- (NSMutableArray)interactions
{
  return self->_interactions;
}

- (void)setInteractions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end