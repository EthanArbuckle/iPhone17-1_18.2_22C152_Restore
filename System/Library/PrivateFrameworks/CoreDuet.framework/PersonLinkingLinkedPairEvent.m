@interface PersonLinkingLinkedPairEvent
+ (Class)pairsType;
- (BOOL)hasUserID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)pairs;
- (NSString)userID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)pairsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)pairsCount;
- (void)addPairs:(id)a3;
- (void)clearPairs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPairs:(id)a3;
- (void)setUserID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PersonLinkingLinkedPairEvent

- (BOOL)hasUserID
{
  return self->_userID != 0;
}

- (void)clearPairs
{
}

- (void)addPairs:(id)a3
{
  id v4 = a3;
  pairs = self->_pairs;
  id v8 = v4;
  if (!pairs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_pairs;
    self->_pairs = v6;

    id v4 = v8;
    pairs = self->_pairs;
  }
  [(NSMutableArray *)pairs addObject:v4];
}

- (unint64_t)pairsCount
{
  return [(NSMutableArray *)self->_pairs count];
}

- (id)pairsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_pairs objectAtIndex:a3];
}

+ (Class)pairsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PersonLinkingLinkedPairEvent;
  id v4 = [(PersonLinkingLinkedPairEvent *)&v8 description];
  v5 = [(PersonLinkingLinkedPairEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  userID = self->_userID;
  if (userID) {
    [v3 setObject:userID forKey:@"userID"];
  }
  if ([(NSMutableArray *)self->_pairs count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_pairs, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_pairs;
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

    [v4 setObject:v6 forKey:@"pairs"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PersonLinkingLinkedPairEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_userID) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_pairs;
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
  if (self->_userID) {
    objc_msgSend(v8, "setUserID:");
  }
  if ([(PersonLinkingLinkedPairEvent *)self pairsCount])
  {
    [v8 clearPairs];
    unint64_t v4 = [(PersonLinkingLinkedPairEvent *)self pairsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(PersonLinkingLinkedPairEvent *)self pairsAtIndex:i];
        [v8 addPairs:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_userID copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_pairs;
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
        [v5 addPairs:v13];

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
    && ((userID = self->_userID, !((unint64_t)userID | v4[2]))
     || -[NSString isEqual:](userID, "isEqual:")))
  {
    pairs = self->_pairs;
    if ((unint64_t)pairs | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](pairs, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_userID hash];
  return [(NSMutableArray *)self->_pairs hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[PersonLinkingLinkedPairEvent setUserID:](self, "setUserID:");
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
        -[PersonLinkingLinkedPairEvent addPairs:](self, "addPairs:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)userID
{
  return self->_userID;
}

- (void)setUserID:(id)a3
{
}

- (NSMutableArray)pairs
{
  return self->_pairs;
}

- (void)setPairs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_pairs, 0);
}

@end