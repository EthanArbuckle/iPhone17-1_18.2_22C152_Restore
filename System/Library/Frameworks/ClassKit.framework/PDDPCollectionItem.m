@interface PDDPCollectionItem
+ (Class)itemIdsType;
- (BOOL)hasCollectionId;
- (BOOL)hasDateCreated;
- (BOOL)hasDateLastModified;
- (BOOL)hasObjectId;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)itemIds;
- (NSString)collectionId;
- (NSString)objectId;
- (PDDPDate)dateCreated;
- (PDDPDate)dateLastModified;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)itemIdsAtIndex:(unint64_t)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (unint64_t)itemIdsCount;
- (void)addItemIds:(id)a3;
- (void)clearItemIds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCollectionId:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateLastModified:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setItemIds:(id)a3;
- (void)setObjectId:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPCollectionItem

- (int)type
{
  if (*(unsigned char *)&self->_has) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 3)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = off_1001F4140[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_COLLECTION_ITEM_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"HANDOUT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ATTACHMENT"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasObjectId
{
  return self->_objectId != 0;
}

- (BOOL)hasCollectionId
{
  return self->_collectionId != 0;
}

- (void)clearItemIds
{
}

- (void)addItemIds:(id)a3
{
  id v4 = a3;
  itemIds = self->_itemIds;
  id v8 = v4;
  if (!itemIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_itemIds;
    self->_itemIds = v6;

    id v4 = v8;
    itemIds = self->_itemIds;
  }
  [(NSMutableArray *)itemIds addObject:v4];
}

- (unint64_t)itemIdsCount
{
  return (unint64_t)[(NSMutableArray *)self->_itemIds count];
}

- (id)itemIdsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_itemIds objectAtIndex:a3];
}

+ (Class)itemIdsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDateCreated
{
  return self->_dateCreated != 0;
}

- (BOOL)hasDateLastModified
{
  return self->_dateLastModified != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPCollectionItem;
  id v3 = [(PDDPCollectionItem *)&v7 description];
  id v4 = [(PDDPCollectionItem *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t type = self->_type;
    if (type >= 3)
    {
      v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_type];
    }
    else
    {
      v5 = off_1001F4140[type];
    }
    [v3 setObject:v5 forKey:@"type"];
  }
  objectId = self->_objectId;
  if (objectId) {
    [v3 setObject:objectId forKey:@"object_id"];
  }
  collectionId = self->_collectionId;
  if (collectionId) {
    [v3 setObject:collectionId forKey:@"collection_id"];
  }
  itemIds = self->_itemIds;
  if (itemIds) {
    [v3 setObject:itemIds forKey:@"item_ids"];
  }
  dateCreated = self->_dateCreated;
  if (dateCreated)
  {
    v10 = [(PDDPDate *)dateCreated dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"date_created"];
  }
  dateLastModified = self->_dateLastModified;
  if (dateLastModified)
  {
    v12 = [(PDDPDate *)dateLastModified dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"date_last_modified"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000C218C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_objectId) {
    PBDataWriterWriteStringField();
  }
  if (self->_collectionId) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_itemIds;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_dateCreated) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_dateLastModified) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[12] = self->_type;
    *((unsigned char *)v4 + 52) |= 1u;
  }
  id v10 = v4;
  if (self->_objectId) {
    objc_msgSend(v4, "setObjectId:");
  }
  if (self->_collectionId) {
    objc_msgSend(v10, "setCollectionId:");
  }
  if ([(PDDPCollectionItem *)self itemIdsCount])
  {
    [v10 clearItemIds];
    unint64_t v5 = [(PDDPCollectionItem *)self itemIdsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(PDDPCollectionItem *)self itemIdsAtIndex:i];
        [v10 addItemIds:v8];
      }
    }
  }
  if (self->_dateCreated) {
    objc_msgSend(v10, "setDateCreated:");
  }
  v9 = v10;
  if (self->_dateLastModified)
  {
    objc_msgSend(v10, "setDateLastModified:");
    v9 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 12) = self->_type;
    *((unsigned char *)v5 + 52) |= 1u;
  }
  id v7 = [(NSString *)self->_objectId copyWithZone:a3];
  uint64_t v8 = (void *)v6[5];
  v6[5] = v7;

  id v9 = [(NSString *)self->_collectionId copyWithZone:a3];
  id v10 = (void *)v6[1];
  v6[1] = v9;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v11 = self->_itemIds;
  id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "copyWithZone:", a3, (void)v22);
        [v6 addItemIds:v16];
      }
      id v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }

  id v17 = [(PDDPDate *)self->_dateCreated copyWithZone:a3];
  v18 = (void *)v6[2];
  v6[2] = v17;

  id v19 = [(PDDPDate *)self->_dateLastModified copyWithZone:a3];
  v20 = (void *)v6[3];
  v6[3] = v19;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_type != *((_DWORD *)v4 + 12)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
LABEL_17:
    unsigned __int8 v10 = 0;
    goto LABEL_18;
  }
  objectId = self->_objectId;
  if ((unint64_t)objectId | *((void *)v4 + 5) && !-[NSString isEqual:](objectId, "isEqual:")) {
    goto LABEL_17;
  }
  collectionId = self->_collectionId;
  if ((unint64_t)collectionId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](collectionId, "isEqual:")) {
      goto LABEL_17;
    }
  }
  itemIds = self->_itemIds;
  if ((unint64_t)itemIds | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](itemIds, "isEqual:")) {
      goto LABEL_17;
    }
  }
  dateCreated = self->_dateCreated;
  if ((unint64_t)dateCreated | *((void *)v4 + 2))
  {
    if (!-[PDDPDate isEqual:](dateCreated, "isEqual:")) {
      goto LABEL_17;
    }
  }
  dateLastModified = self->_dateLastModified;
  if ((unint64_t)dateLastModified | *((void *)v4 + 3)) {
    unsigned __int8 v10 = -[PDDPDate isEqual:](dateLastModified, "isEqual:");
  }
  else {
    unsigned __int8 v10 = 1;
  }
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(NSString *)self->_objectId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_collectionId hash];
  unint64_t v6 = v4 ^ v5 ^ (unint64_t)[(NSMutableArray *)self->_itemIds hash];
  unint64_t v7 = [(PDDPDate *)self->_dateCreated hash];
  return v6 ^ v7 ^ [(PDDPDate *)self->_dateLastModified hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  id v5 = v4;
  if (v4[13])
  {
    self->_uint64_t type = v4[12];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 5)) {
    -[PDDPCollectionItem setObjectId:](self, "setObjectId:");
  }
  if (*((void *)v5 + 1)) {
    -[PDDPCollectionItem setCollectionId:](self, "setCollectionId:");
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = *((id *)v5 + 4);
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        -[PDDPCollectionItem addItemIds:](self, "addItemIds:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  dateCreated = self->_dateCreated;
  uint64_t v12 = *((void *)v5 + 2);
  if (dateCreated)
  {
    if (v12) {
      -[PDDPDate mergeFrom:](dateCreated, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[PDDPCollectionItem setDateCreated:](self, "setDateCreated:");
  }
  dateLastModified = self->_dateLastModified;
  uint64_t v14 = *((void *)v5 + 3);
  if (dateLastModified)
  {
    if (v14) {
      -[PDDPDate mergeFrom:](dateLastModified, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[PDDPCollectionItem setDateLastModified:](self, "setDateLastModified:");
  }
}

- (NSString)objectId
{
  return self->_objectId;
}

- (void)setObjectId:(id)a3
{
}

- (NSString)collectionId
{
  return self->_collectionId;
}

- (void)setCollectionId:(id)a3
{
}

- (NSMutableArray)itemIds
{
  return self->_itemIds;
}

- (void)setItemIds:(id)a3
{
}

- (PDDPDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
}

- (PDDPDate)dateLastModified
{
  return self->_dateLastModified;
}

- (void)setDateLastModified:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectId, 0);
  objc_storeStrong((id *)&self->_itemIds, 0);
  objc_storeStrong((id *)&self->_dateLastModified, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);

  objc_storeStrong((id *)&self->_collectionId, 0);
}

@end