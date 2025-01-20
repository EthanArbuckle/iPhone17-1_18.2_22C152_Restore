@interface CLPPassLocation
+ (Class)associatedStoreIdType;
- (BOOL)hasAge;
- (BOOL)hasServerHash;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLPLocation)location;
- (NSMutableArray)associatedStoreIds;
- (NSString)passTypeId;
- (double)age;
- (id)associatedStoreIdAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)passSource;
- (int)serverHash;
- (unint64_t)associatedStoreIdsCount;
- (unint64_t)hash;
- (void)addAssociatedStoreId:(id)a3;
- (void)clearAssociatedStoreIds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAge:(double)a3;
- (void)setAssociatedStoreIds:(id)a3;
- (void)setHasAge:(BOOL)a3;
- (void)setHasServerHash:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setPassSource:(int)a3;
- (void)setPassTypeId:(id)a3;
- (void)setServerHash:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPPassLocation

- (void)clearAssociatedStoreIds
{
}

- (void)addAssociatedStoreId:(id)a3
{
  id v4 = a3;
  associatedStoreIds = self->_associatedStoreIds;
  id v8 = v4;
  if (!associatedStoreIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_associatedStoreIds;
    self->_associatedStoreIds = v6;

    id v4 = v8;
    associatedStoreIds = self->_associatedStoreIds;
  }
  [(NSMutableArray *)associatedStoreIds addObject:v4];
}

- (unint64_t)associatedStoreIdsCount
{
  return [(NSMutableArray *)self->_associatedStoreIds count];
}

- (id)associatedStoreIdAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_associatedStoreIds objectAtIndex:a3];
}

+ (Class)associatedStoreIdType
{
  return (Class)objc_opt_class();
}

- (void)setAge:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_age = a3;
}

- (void)setHasAge:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAge
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setServerHash:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_serverHash = a3;
}

- (void)setHasServerHash:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasServerHash
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPPassLocation;
  id v4 = [(CLPPassLocation *)&v8 description];
  v5 = [(CLPPassLocation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  passTypeId = self->_passTypeId;
  if (passTypeId) {
    [v3 setObject:passTypeId forKey:@"passTypeId"];
  }
  associatedStoreIds = self->_associatedStoreIds;
  if (associatedStoreIds) {
    [v4 setObject:associatedStoreIds forKey:@"associatedStoreId"];
  }
  v7 = [NSNumber numberWithInt:self->_passSource];
  [v4 setObject:v7 forKey:@"passSource"];

  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_age];
    [v4 setObject:v8 forKey:@"age"];
  }
  location = self->_location;
  if (location)
  {
    v10 = [(CLPLocation *)location dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"location"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v11 = [NSNumber numberWithInt:self->_serverHash];
    [v4 setObject:v11 forKey:@"serverHash"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CLPPassLocationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_passTypeId) {
    -[CLPPassLocation writeTo:]();
  }
  v5 = v4;
  PBDataWriterWriteStringField();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_associatedStoreIds;
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
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  PBDataWriterWriteInt32Field();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (!self->_location) {
    -[CLPPassLocation writeTo:]();
  }
  PBDataWriterWriteSubmessage();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [v8 setPassTypeId:self->_passTypeId];
  if ([(CLPPassLocation *)self associatedStoreIdsCount])
  {
    [v8 clearAssociatedStoreIds];
    unint64_t v4 = [(CLPPassLocation *)self associatedStoreIdsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(CLPPassLocation *)self associatedStoreIdAtIndex:i];
        [v8 addAssociatedStoreId:v7];
      }
    }
  }
  *((_DWORD *)v8 + 8) = self->_passSource;
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v8 + 1) = *(void *)&self->_age;
    *((unsigned char *)v8 + 52) |= 1u;
  }
  [v8 setLocation:self->_location];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v8 + 12) = self->_serverHash;
    *((unsigned char *)v8 + 52) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_passTypeId copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = self->_associatedStoreIds;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12), "copyWithZone:", a3, (void)v17);
        [(id)v5 addAssociatedStoreId:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  *(_DWORD *)(v5 + 32) = self->_passSource;
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_age;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  id v14 = -[CLPLocation copyWithZone:](self->_location, "copyWithZone:", a3, (void)v17);
  v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_serverHash;
    *(unsigned char *)(v5 + 52) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  passTypeId = self->_passTypeId;
  if ((unint64_t)passTypeId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](passTypeId, "isEqual:")) {
      goto LABEL_19;
    }
  }
  associatedStoreIds = self->_associatedStoreIds;
  if ((unint64_t)associatedStoreIds | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](associatedStoreIds, "isEqual:")) {
      goto LABEL_19;
    }
  }
  if (self->_passSource != *((_DWORD *)v4 + 8)) {
    goto LABEL_19;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_age != *((double *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_19;
  }
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 3))
  {
    if (!-[CLPLocation isEqual:](location, "isEqual:"))
    {
LABEL_19:
      BOOL v9 = 0;
      goto LABEL_20;
    }
    char has = (char)self->_has;
  }
  BOOL v9 = (*((unsigned char *)v4 + 52) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_serverHash != *((_DWORD *)v4 + 12)) {
      goto LABEL_19;
    }
    BOOL v9 = 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_passTypeId hash];
  uint64_t v4 = [(NSMutableArray *)self->_associatedStoreIds hash];
  uint64_t passSource = self->_passSource;
  if (*(unsigned char *)&self->_has)
  {
    double age = self->_age;
    double v8 = -age;
    if (age >= 0.0) {
      double v8 = self->_age;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  unint64_t v11 = [(CLPLocation *)self->_location hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v12 = 2654435761 * self->_serverHash;
  }
  else {
    uint64_t v12 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11 ^ v12 ^ (2654435761 * passSource);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 5)) {
    -[CLPPassLocation setPassTypeId:](self, "setPassTypeId:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        -[CLPPassLocation addAssociatedStoreId:](self, "addAssociatedStoreId:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  self->_uint64_t passSource = *((_DWORD *)v4 + 8);
  if (*((unsigned char *)v4 + 52))
  {
    self->_double age = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  location = self->_location;
  uint64_t v11 = *((void *)v4 + 3);
  if (location)
  {
    if (v11) {
      -[CLPLocation mergeFrom:](location, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[CLPPassLocation setLocation:](self, "setLocation:");
  }
  if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    self->_serverHash = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSString)passTypeId
{
  return self->_passTypeId;
}

- (void)setPassTypeId:(id)a3
{
}

- (NSMutableArray)associatedStoreIds
{
  return self->_associatedStoreIds;
}

- (void)setAssociatedStoreIds:(id)a3
{
}

- (int)passSource
{
  return self->_passSource;
}

- (void)setPassSource:(int)a3
{
  self->_uint64_t passSource = a3;
}

- (double)age
{
  return self->_age;
}

- (CLPLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (int)serverHash
{
  return self->_serverHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passTypeId, 0);
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_associatedStoreIds, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CLPPassLocation writeTo:]", "CLPCollectionRequest.gen.m", 29342, "nil != self->_passTypeId");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[CLPPassLocation writeTo:]", "CLPCollectionRequest.gen.m", 29365, "self->_location != nil");
}

@end