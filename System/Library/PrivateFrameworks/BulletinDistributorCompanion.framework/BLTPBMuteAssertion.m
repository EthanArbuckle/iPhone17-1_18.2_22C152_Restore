@interface BLTPBMuteAssertion
+ (Class)sectionBulletinListType;
- (BOOL)hasExpirationDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)sectionBulletinLists;
- (double)expirationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sectionBulletinListAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)sectionBulletinListsCount;
- (void)addSectionBulletinList:(id)a3;
- (void)clearSectionBulletinLists;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setExpirationDate:(double)a3;
- (void)setHasExpirationDate:(BOOL)a3;
- (void)setSectionBulletinLists:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBMuteAssertion

- (void)setExpirationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_expirationDate = a3;
}

- (void)setHasExpirationDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExpirationDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearSectionBulletinLists
{
}

- (void)addSectionBulletinList:(id)a3
{
  id v4 = a3;
  sectionBulletinLists = self->_sectionBulletinLists;
  id v8 = v4;
  if (!sectionBulletinLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_sectionBulletinLists;
    self->_sectionBulletinLists = v6;

    id v4 = v8;
    sectionBulletinLists = self->_sectionBulletinLists;
  }
  [(NSMutableArray *)sectionBulletinLists addObject:v4];
}

- (unint64_t)sectionBulletinListsCount
{
  return [(NSMutableArray *)self->_sectionBulletinLists count];
}

- (id)sectionBulletinListAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_sectionBulletinLists objectAtIndex:a3];
}

+ (Class)sectionBulletinListType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBMuteAssertion;
  id v4 = [(BLTPBMuteAssertion *)&v8 description];
  v5 = [(BLTPBMuteAssertion *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithDouble:self->_expirationDate];
    [v3 setObject:v4 forKey:@"expirationDate"];
  }
  if ([(NSMutableArray *)self->_sectionBulletinLists count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_sectionBulletinLists, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = self->_sectionBulletinLists;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionaryRepresentation", (void)v13);
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"sectionBulletinList"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBMuteAssertionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_sectionBulletinLists;
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
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = *(void *)&self->_expirationDate;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  id v9 = v4;
  if ([(BLTPBMuteAssertion *)self sectionBulletinListsCount])
  {
    [v9 clearSectionBulletinLists];
    unint64_t v5 = [(BLTPBMuteAssertion *)self sectionBulletinListsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(BLTPBMuteAssertion *)self sectionBulletinListAtIndex:i];
        [v9 addSectionBulletinList:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_expirationDate;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_sectionBulletinLists;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "copyWithZone:", a3, (void)v14);
        [v6 addSectionBulletinList:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_expirationDate != *((double *)v4 + 1)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  sectionBulletinLists = self->_sectionBulletinLists;
  if ((unint64_t)sectionBulletinLists | *((void *)v4 + 2)) {
    char v6 = -[NSMutableArray isEqual:](sectionBulletinLists, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    double expirationDate = self->_expirationDate;
    double v5 = -expirationDate;
    if (expirationDate >= 0.0) {
      double v5 = self->_expirationDate;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  return [(NSMutableArray *)self->_sectionBulletinLists hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = v4;
  if (*((unsigned char *)v4 + 24))
  {
    self->_double expirationDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 2);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        -[BLTPBMuteAssertion addSectionBulletinList:](self, "addSectionBulletinList:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (double)expirationDate
{
  return self->_expirationDate;
}

- (NSMutableArray)sectionBulletinLists
{
  return self->_sectionBulletinLists;
}

- (void)setSectionBulletinLists:(id)a3
{
}

- (void).cxx_destruct
{
}

@end