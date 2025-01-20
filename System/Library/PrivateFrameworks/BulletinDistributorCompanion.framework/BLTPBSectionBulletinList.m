@interface BLTPBSectionBulletinList
+ (Class)bulletinIdentifierType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)bulletinIdentifiers;
- (NSString)sectionID;
- (id)bulletinIdentifierAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)bulletinIdentifiersCount;
- (unint64_t)hash;
- (void)addBulletinIdentifier:(id)a3;
- (void)clearBulletinIdentifiers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBulletinIdentifiers:(id)a3;
- (void)setSectionID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBSectionBulletinList

- (void)clearBulletinIdentifiers
{
}

- (void)addBulletinIdentifier:(id)a3
{
  id v4 = a3;
  bulletinIdentifiers = self->_bulletinIdentifiers;
  id v8 = v4;
  if (!bulletinIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_bulletinIdentifiers;
    self->_bulletinIdentifiers = v6;

    id v4 = v8;
    bulletinIdentifiers = self->_bulletinIdentifiers;
  }
  [(NSMutableArray *)bulletinIdentifiers addObject:v4];
}

- (unint64_t)bulletinIdentifiersCount
{
  return [(NSMutableArray *)self->_bulletinIdentifiers count];
}

- (id)bulletinIdentifierAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_bulletinIdentifiers objectAtIndex:a3];
}

+ (Class)bulletinIdentifierType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBSectionBulletinList;
  id v4 = [(BLTPBSectionBulletinList *)&v8 description];
  v5 = [(BLTPBSectionBulletinList *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  sectionID = self->_sectionID;
  if (sectionID) {
    [v3 setObject:sectionID forKey:@"sectionID"];
  }
  if ([(NSMutableArray *)self->_bulletinIdentifiers count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_bulletinIdentifiers, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_bulletinIdentifiers;
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

    [v4 setObject:v6 forKey:@"bulletinIdentifier"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBSectionBulletinListReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_sectionID) {
    -[BLTPBSectionBulletinList writeTo:]();
  }
  v5 = v4;
  PBDataWriterWriteStringField();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_bulletinIdentifiers;
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
  id v8 = a3;
  [v8 setSectionID:self->_sectionID];
  if ([(BLTPBSectionBulletinList *)self bulletinIdentifiersCount])
  {
    [v8 clearBulletinIdentifiers];
    unint64_t v4 = [(BLTPBSectionBulletinList *)self bulletinIdentifiersCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(BLTPBSectionBulletinList *)self bulletinIdentifierAtIndex:i];
        [v8 addBulletinIdentifier:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_sectionID copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_bulletinIdentifiers;
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
        [v5 addBulletinIdentifier:v13];

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
    && ((sectionID = self->_sectionID, !((unint64_t)sectionID | v4[2]))
     || -[NSString isEqual:](sectionID, "isEqual:")))
  {
    bulletinIdentifiers = self->_bulletinIdentifiers;
    if ((unint64_t)bulletinIdentifiers | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](bulletinIdentifiers, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_sectionID hash];
  return [(NSMutableArray *)self->_bulletinIdentifiers hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[BLTPBSectionBulletinList setSectionID:](self, "setSectionID:");
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
        -[BLTPBSectionBulletinList addBulletinIdentifier:](self, "addBulletinIdentifier:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
}

- (NSMutableArray)bulletinIdentifiers
{
  return self->_bulletinIdentifiers;
}

- (void)setBulletinIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_bulletinIdentifiers, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[BLTPBSectionBulletinList writeTo:]", "BLTPBSectionBulletinList.m", 126, "nil != self->_sectionID");
}

@end