@interface PDDPIngestItem
+ (Class)handoutAuthorizedMetaInfoType;
- (BOOL)hasAction;
- (BOOL)hasObjectId;
- (BOOL)hasProgressEntity;
- (BOOL)hasSyncType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)handoutAuthorizedMetaInfos;
- (NSString)objectId;
- (PDDPProgressEntity)progressEntity;
- (id)actionAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)handoutAuthorizedMetaInfoAtIndex:(unint64_t)a3;
- (id)syncTypeAsString:(int)a3;
- (int)StringAsAction:(id)a3;
- (int)StringAsSyncType:(id)a3;
- (int)action;
- (int)syncType;
- (unint64_t)handoutAuthorizedMetaInfosCount;
- (unint64_t)hash;
- (void)addHandoutAuthorizedMetaInfo:(id)a3;
- (void)clearHandoutAuthorizedMetaInfos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAction:(int)a3;
- (void)setHandoutAuthorizedMetaInfos:(id)a3;
- (void)setHasAction:(BOOL)a3;
- (void)setHasSyncType:(BOOL)a3;
- (void)setObjectId:(id)a3;
- (void)setProgressEntity:(id)a3;
- (void)setSyncType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPIngestItem

- (int)action
{
  if (*(unsigned char *)&self->_has) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (void)setAction:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_action = a3;
}

- (void)setHasAction:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAction
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)actionAsString:(int)a3
{
  if (a3 >= 3)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = off_1001F34A0[a3];
  }

  return v3;
}

- (int)StringAsAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"UPDATE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DELETE"])
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

- (BOOL)hasProgressEntity
{
  return self->_progressEntity != 0;
}

- (int)syncType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_syncType;
  }
  else {
    return 0;
  }
}

- (void)setSyncType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_syncType = a3;
}

- (void)setHasSyncType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSyncType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)syncTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = off_1001F34B8[a3];
  }

  return v3;
}

- (int)StringAsSyncType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_SYNC_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TIME_INTERVAL_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ACTIVITY_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ACTIVITY_ITEM_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RANGE_TYPE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearHandoutAuthorizedMetaInfos
{
}

- (void)addHandoutAuthorizedMetaInfo:(id)a3
{
  id v4 = a3;
  handoutAuthorizedMetaInfos = self->_handoutAuthorizedMetaInfos;
  id v8 = v4;
  if (!handoutAuthorizedMetaInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_handoutAuthorizedMetaInfos;
    self->_handoutAuthorizedMetaInfos = v6;

    id v4 = v8;
    handoutAuthorizedMetaInfos = self->_handoutAuthorizedMetaInfos;
  }
  [(NSMutableArray *)handoutAuthorizedMetaInfos addObject:v4];
}

- (unint64_t)handoutAuthorizedMetaInfosCount
{
  return (unint64_t)[(NSMutableArray *)self->_handoutAuthorizedMetaInfos count];
}

- (id)handoutAuthorizedMetaInfoAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_handoutAuthorizedMetaInfos objectAtIndex:a3];
}

+ (Class)handoutAuthorizedMetaInfoType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPIngestItem;
  id v3 = [(PDDPIngestItem *)&v7 description];
  id v4 = [(PDDPIngestItem *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t action = self->_action;
    if (action >= 3)
    {
      v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_action];
    }
    else
    {
      v5 = off_1001F34A0[action];
    }
    [v3 setObject:v5 forKey:@"action"];
  }
  objectId = self->_objectId;
  if (objectId) {
    [v3 setObject:objectId forKey:@"object_id"];
  }
  progressEntity = self->_progressEntity;
  if (progressEntity)
  {
    id v8 = [(PDDPProgressEntity *)progressEntity dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"progress_entity"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t syncType = self->_syncType;
    if (syncType >= 5)
    {
      v10 = +[NSString stringWithFormat:@"(unknown: %i)", self->_syncType];
    }
    else
    {
      v10 = off_1001F34B8[syncType];
    }
    [v3 setObject:v10 forKey:@"sync_type"];
  }
  if ([(NSMutableArray *)self->_handoutAuthorizedMetaInfos count])
  {
    id v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_handoutAuthorizedMetaInfos, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v12 = self->_handoutAuthorizedMetaInfos;
    id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v19 + 1) + 8 * i) dictionaryRepresentation];
          [v11 addObject:v17];
        }
        id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"handout_authorized_meta_info"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10006F714((uint64_t)self, (uint64_t)a3);
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
  if (self->_progressEntity) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_handoutAuthorizedMetaInfos;
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_action;
    *((unsigned char *)v4 + 44) |= 1u;
  }
  v9 = v4;
  if (self->_objectId)
  {
    objc_msgSend(v4, "setObjectId:");
    id v4 = v9;
  }
  if (self->_progressEntity)
  {
    objc_msgSend(v9, "setProgressEntity:");
    id v4 = v9;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[10] = self->_syncType;
    *((unsigned char *)v4 + 44) |= 2u;
  }
  if ([(PDDPIngestItem *)self handoutAuthorizedMetaInfosCount])
  {
    [v9 clearHandoutAuthorizedMetaInfos];
    unint64_t v5 = [(PDDPIngestItem *)self handoutAuthorizedMetaInfosCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(PDDPIngestItem *)self handoutAuthorizedMetaInfoAtIndex:i];
        [v9 addHandoutAuthorizedMetaInfo:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[2] = self->_action;
    *((unsigned char *)v5 + 44) |= 1u;
  }
  id v7 = [(NSString *)self->_objectId copyWithZone:a3];
  uint64_t v8 = (void *)v6[3];
  v6[3] = v7;

  id v9 = [(PDDPProgressEntity *)self->_progressEntity copyWithZone:a3];
  long long v10 = (void *)v6[4];
  v6[4] = v9;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v6 + 10) = self->_syncType;
    *((unsigned char *)v6 + 44) |= 2u;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v11 = self->_handoutAuthorizedMetaInfos;
  id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        [v6 addHandoutAuthorizedMetaInfo:v16];
      }
      id v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_action != *((_DWORD *)v4 + 2)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
LABEL_18:
    unsigned __int8 v8 = 0;
    goto LABEL_19;
  }
  objectId = self->_objectId;
  if ((unint64_t)objectId | *((void *)v4 + 3) && !-[NSString isEqual:](objectId, "isEqual:")) {
    goto LABEL_18;
  }
  progressEntity = self->_progressEntity;
  if ((unint64_t)progressEntity | *((void *)v4 + 4))
  {
    if (!-[PDDPProgressEntity isEqual:](progressEntity, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_syncType != *((_DWORD *)v4 + 10)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_18;
  }
  handoutAuthorizedMetaInfos = self->_handoutAuthorizedMetaInfos;
  if ((unint64_t)handoutAuthorizedMetaInfos | *((void *)v4 + 2)) {
    unsigned __int8 v8 = -[NSMutableArray isEqual:](handoutAuthorizedMetaInfos, "isEqual:");
  }
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_action;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_objectId hash];
  unint64_t v5 = [(PDDPProgressEntity *)self->_progressEntity hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_syncType;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ (unint64_t)[(NSMutableArray *)self->_handoutAuthorizedMetaInfos hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  id v5 = v4;
  if (v4[11])
  {
    self->_uint64_t action = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3)) {
    -[PDDPIngestItem setObjectId:](self, "setObjectId:");
  }
  progressEntity = self->_progressEntity;
  uint64_t v7 = *((void *)v5 + 4);
  if (progressEntity)
  {
    if (v7) {
      -[PDDPProgressEntity mergeFrom:](progressEntity, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[PDDPIngestItem setProgressEntity:](self, "setProgressEntity:");
  }
  if ((*((unsigned char *)v5 + 44) & 2) != 0)
  {
    self->_uint64_t syncType = *((_DWORD *)v5 + 10);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *((id *)v5 + 2);
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[PDDPIngestItem addHandoutAuthorizedMetaInfo:](self, "addHandoutAuthorizedMetaInfo:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (NSString)objectId
{
  return self->_objectId;
}

- (void)setObjectId:(id)a3
{
}

- (PDDPProgressEntity)progressEntity
{
  return self->_progressEntity;
}

- (void)setProgressEntity:(id)a3
{
}

- (NSMutableArray)handoutAuthorizedMetaInfos
{
  return self->_handoutAuthorizedMetaInfos;
}

- (void)setHandoutAuthorizedMetaInfos:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressEntity, 0);
  objc_storeStrong((id *)&self->_objectId, 0);

  objc_storeStrong((id *)&self->_handoutAuthorizedMetaInfos, 0);
}

@end