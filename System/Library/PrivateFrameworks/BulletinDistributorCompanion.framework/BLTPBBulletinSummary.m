@interface BLTPBBulletinSummary
+ (Class)keyType;
- (BOOL)hasPublisherBulletinID;
- (BOOL)hasRecordID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)keys;
- (NSString)publisherBulletinID;
- (NSString)recordID;
- (NSString)sectionID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)keyAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)keysCount;
- (unsigned)destinations;
- (void)addKey:(id)a3;
- (void)clearKeys;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDestinations:(unsigned int)a3;
- (void)setKeys:(id)a3;
- (void)setPublisherBulletinID:(id)a3;
- (void)setRecordID:(id)a3;
- (void)setSectionID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBBulletinSummary

- (BOOL)hasPublisherBulletinID
{
  return self->_publisherBulletinID != 0;
}

- (BOOL)hasRecordID
{
  return self->_recordID != 0;
}

- (void)clearKeys
{
}

- (void)addKey:(id)a3
{
  id v4 = a3;
  keys = self->_keys;
  id v8 = v4;
  if (!keys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_keys;
    self->_keys = v6;

    id v4 = v8;
    keys = self->_keys;
  }
  [(NSMutableArray *)keys addObject:v4];
}

- (unint64_t)keysCount
{
  return [(NSMutableArray *)self->_keys count];
}

- (id)keyAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_keys objectAtIndex:a3];
}

+ (Class)keyType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBBulletinSummary;
  id v4 = [(BLTPBBulletinSummary *)&v8 description];
  v5 = [(BLTPBBulletinSummary *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  publisherBulletinID = self->_publisherBulletinID;
  if (publisherBulletinID) {
    [v3 setObject:publisherBulletinID forKey:@"publisherBulletinID"];
  }
  recordID = self->_recordID;
  if (recordID) {
    [v4 setObject:recordID forKey:@"recordID"];
  }
  sectionID = self->_sectionID;
  if (sectionID) {
    [v4 setObject:sectionID forKey:@"sectionID"];
  }
  objc_super v8 = [NSNumber numberWithUnsignedInt:self->_destinations];
  [v4 setObject:v8 forKey:@"destinations"];

  if ([(NSMutableArray *)self->_keys count])
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_keys, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v10 = self->_keys;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    [v4 setObject:v9 forKey:@"key"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBBulletinSummaryReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_publisherBulletinID) {
    PBDataWriterWriteStringField();
  }
  if (self->_recordID) {
    PBDataWriterWriteStringField();
  }
  if (!self->_sectionID) {
    -[BLTPBBulletinSummary writeTo:]();
  }
  PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_keys;
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
  uint64_t v9 = v4;
  if (self->_publisherBulletinID)
  {
    objc_msgSend(v4, "setPublisherBulletinID:");
    id v4 = v9;
  }
  if (self->_recordID)
  {
    objc_msgSend(v9, "setRecordID:");
    id v4 = v9;
  }
  [v4 setSectionID:self->_sectionID];
  v9[2] = self->_destinations;
  if ([(BLTPBBulletinSummary *)self keysCount])
  {
    [v9 clearKeys];
    unint64_t v5 = [(BLTPBBulletinSummary *)self keysCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(BLTPBBulletinSummary *)self keyAtIndex:i];
        [v9 addKey:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_publisherBulletinID copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_recordID copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSString *)self->_sectionID copyWithZone:a3];
  long long v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  *(_DWORD *)(v5 + 8) = self->_destinations;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v12 = self->_keys;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (void)v19);
        [(id)v5 addKey:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((publisherBulletinID = self->_publisherBulletinID, !((unint64_t)publisherBulletinID | v4[3]))
     || -[NSString isEqual:](publisherBulletinID, "isEqual:"))
    && ((recordID = self->_recordID, !((unint64_t)recordID | v4[4]))
     || -[NSString isEqual:](recordID, "isEqual:"))
    && ((sectionID = self->_sectionID, !((unint64_t)sectionID | v4[5]))
     || -[NSString isEqual:](sectionID, "isEqual:"))
    && self->_destinations == *((_DWORD *)v4 + 2))
  {
    keys = self->_keys;
    if ((unint64_t)keys | v4[2]) {
      char v9 = -[NSMutableArray isEqual:](keys, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_publisherBulletinID hash];
  NSUInteger v4 = [(NSString *)self->_recordID hash] ^ v3;
  NSUInteger v5 = v4 ^ [(NSString *)self->_sectionID hash];
  uint64_t v6 = 2654435761 * self->_destinations;
  return v5 ^ [(NSMutableArray *)self->_keys hash] ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 3)) {
    -[BLTPBBulletinSummary setPublisherBulletinID:](self, "setPublisherBulletinID:");
  }
  if (*((void *)v4 + 4)) {
    -[BLTPBBulletinSummary setRecordID:](self, "setRecordID:");
  }
  if (*((void *)v4 + 5)) {
    -[BLTPBBulletinSummary setSectionID:](self, "setSectionID:");
  }
  self->_destinations = *((_DWORD *)v4 + 2);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 2);
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
        -[BLTPBBulletinSummary addKey:](self, "addKey:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)publisherBulletinID
{
  return self->_publisherBulletinID;
}

- (void)setPublisherBulletinID:(id)a3
{
}

- (NSString)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
}

- (unsigned)destinations
{
  return self->_destinations;
}

- (void)setDestinations:(unsigned int)a3
{
  self->_destinations = a3;
}

- (NSMutableArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_publisherBulletinID, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[BLTPBBulletinSummary writeTo:]", "BLTPBBulletinSummary.m", 177, "nil != self->_sectionID");
}

@end