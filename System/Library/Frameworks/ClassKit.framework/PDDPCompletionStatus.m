@interface PDDPCompletionStatus
+ (Class)classIdsType;
- (BOOL)hasDateLastCompleted;
- (BOOL)hasDateLastModified;
- (BOOL)hasParentObjectId;
- (BOOL)hasPersonId;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)classIds;
- (NSString)parentObjectId;
- (NSString)personId;
- (PDDPDate)dateLastCompleted;
- (PDDPDate)dateLastModified;
- (id)classIdsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)statusAsString:(int)a3;
- (int)StringAsStatus:(id)a3;
- (int)status;
- (unint64_t)classIdsCount;
- (unint64_t)hash;
- (void)addClassIds:(id)a3;
- (void)clearClassIds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClassIds:(id)a3;
- (void)setDateLastCompleted:(id)a3;
- (void)setDateLastModified:(id)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setParentObjectId:(id)a3;
- (void)setPersonId:(id)a3;
- (void)setStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPCompletionStatus

- (BOOL)hasParentObjectId
{
  return self->_parentObjectId != 0;
}

- (int)status
{
  if (*(unsigned char *)&self->_has) {
    return self->_status;
  }
  else {
    return 0;
  }
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 >= 6)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = *(&off_1001F3428 + a3);
  }

  return v3;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"COMPLETED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NOT_COMPLETED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MARKED_FOR_COMPLETION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MARKED_FOR_INCOMPLETION"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RETURNED"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasDateLastCompleted
{
  return self->_dateLastCompleted != 0;
}

- (BOOL)hasDateLastModified
{
  return self->_dateLastModified != 0;
}

- (BOOL)hasPersonId
{
  return self->_personId != 0;
}

- (void)clearClassIds
{
}

- (void)addClassIds:(id)a3
{
  id v4 = a3;
  classIds = self->_classIds;
  id v8 = v4;
  if (!classIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_classIds;
    self->_classIds = v6;

    id v4 = v8;
    classIds = self->_classIds;
  }
  [(NSMutableArray *)classIds addObject:v4];
}

- (unint64_t)classIdsCount
{
  return (unint64_t)[(NSMutableArray *)self->_classIds count];
}

- (id)classIdsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_classIds objectAtIndex:a3];
}

+ (Class)classIdsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPCompletionStatus;
  id v3 = [(PDDPCompletionStatus *)&v7 description];
  id v4 = [(PDDPCompletionStatus *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  parentObjectId = self->_parentObjectId;
  if (parentObjectId) {
    [v3 setObject:parentObjectId forKey:@"parent_object_id"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t status = self->_status;
    if (status >= 6)
    {
      objc_super v7 = +[NSString stringWithFormat:@"(unknown: %i)", self->_status];
    }
    else
    {
      objc_super v7 = *(&off_1001F3428 + status);
    }
    [v4 setObject:v7 forKey:@"status"];
  }
  dateLastCompleted = self->_dateLastCompleted;
  if (dateLastCompleted)
  {
    v9 = [(PDDPDate *)dateLastCompleted dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"date_last_completed"];
  }
  dateLastModified = self->_dateLastModified;
  if (dateLastModified)
  {
    v11 = [(PDDPDate *)dateLastModified dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"date_last_modified"];
  }
  personId = self->_personId;
  if (personId) {
    [v4 setObject:personId forKey:@"person_id"];
  }
  classIds = self->_classIds;
  if (classIds) {
    [v4 setObject:classIds forKey:@"class_ids"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000678B0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_parentObjectId) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_dateLastCompleted) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_personId) {
    PBDataWriterWriteStringField();
  }
  if (self->_dateLastModified) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_classIds;
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
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_parentObjectId)
  {
    objc_msgSend(v4, "setParentObjectId:");
    id v4 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 12) = self->_status;
    *((unsigned char *)v4 + 52) |= 1u;
  }
  if (self->_dateLastCompleted) {
    objc_msgSend(v9, "setDateLastCompleted:");
  }
  if (self->_personId) {
    objc_msgSend(v9, "setPersonId:");
  }
  if (self->_dateLastModified) {
    objc_msgSend(v9, "setDateLastModified:");
  }
  if ([(PDDPCompletionStatus *)self classIdsCount])
  {
    [v9 clearClassIds];
    unint64_t v5 = [(PDDPCompletionStatus *)self classIdsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(PDDPCompletionStatus *)self classIdsAtIndex:i];
        [v9 addClassIds:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_parentObjectId copyWithZone:a3];
  objc_super v7 = (void *)v5[4];
  v5[4] = v6;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 12) = self->_status;
    *((unsigned char *)v5 + 52) |= 1u;
  }
  id v8 = [(PDDPDate *)self->_dateLastCompleted copyWithZone:a3];
  id v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(NSString *)self->_personId copyWithZone:a3];
  long long v11 = (void *)v5[5];
  v5[5] = v10;

  id v12 = [(PDDPDate *)self->_dateLastModified copyWithZone:a3];
  long long v13 = (void *)v5[3];
  v5[3] = v12;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v14 = self->_classIds;
  id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "copyWithZone:", a3, (void)v21);
        [v5 addClassIds:v19];
      }
      id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v16);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  parentObjectId = self->_parentObjectId;
  if ((unint64_t)parentObjectId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](parentObjectId, "isEqual:")) {
      goto LABEL_17;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_status != *((_DWORD *)v4 + 12)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
LABEL_17:
    unsigned __int8 v10 = 0;
    goto LABEL_18;
  }
  dateLastCompleted = self->_dateLastCompleted;
  if ((unint64_t)dateLastCompleted | *((void *)v4 + 2) && !-[PDDPDate isEqual:](dateLastCompleted, "isEqual:")) {
    goto LABEL_17;
  }
  personId = self->_personId;
  if ((unint64_t)personId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](personId, "isEqual:")) {
      goto LABEL_17;
    }
  }
  dateLastModified = self->_dateLastModified;
  if ((unint64_t)dateLastModified | *((void *)v4 + 3))
  {
    if (!-[PDDPDate isEqual:](dateLastModified, "isEqual:")) {
      goto LABEL_17;
    }
  }
  classIds = self->_classIds;
  if ((unint64_t)classIds | *((void *)v4 + 1)) {
    unsigned __int8 v10 = -[NSMutableArray isEqual:](classIds, "isEqual:");
  }
  else {
    unsigned __int8 v10 = 1;
  }
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_parentObjectId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_status;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = v4 ^ v3;
  unint64_t v6 = [(PDDPDate *)self->_dateLastCompleted hash];
  unint64_t v7 = v5 ^ v6 ^ [(NSString *)self->_personId hash];
  unint64_t v8 = [(PDDPDate *)self->_dateLastModified hash];
  return v7 ^ v8 ^ (unint64_t)[(NSMutableArray *)self->_classIds hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[PDDPCompletionStatus setParentObjectId:](self, "setParentObjectId:");
  }
  if (*((unsigned char *)v4 + 52))
  {
    self->_uint64_t status = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 1u;
  }
  dateLastCompleted = self->_dateLastCompleted;
  uint64_t v6 = *((void *)v4 + 2);
  if (dateLastCompleted)
  {
    if (v6) {
      -[PDDPDate mergeFrom:](dateLastCompleted, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[PDDPCompletionStatus setDateLastCompleted:](self, "setDateLastCompleted:");
  }
  if (*((void *)v4 + 5)) {
    -[PDDPCompletionStatus setPersonId:](self, "setPersonId:");
  }
  dateLastModified = self->_dateLastModified;
  uint64_t v8 = *((void *)v4 + 3);
  if (dateLastModified)
  {
    if (v8) {
      -[PDDPDate mergeFrom:](dateLastModified, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[PDDPCompletionStatus setDateLastModified:](self, "setDateLastModified:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = *((id *)v4 + 1);
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[PDDPCompletionStatus addClassIds:](self, "addClassIds:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (NSString)parentObjectId
{
  return self->_parentObjectId;
}

- (void)setParentObjectId:(id)a3
{
}

- (PDDPDate)dateLastCompleted
{
  return self->_dateLastCompleted;
}

- (void)setDateLastCompleted:(id)a3
{
}

- (PDDPDate)dateLastModified
{
  return self->_dateLastModified;
}

- (void)setDateLastModified:(id)a3
{
}

- (NSString)personId
{
  return self->_personId;
}

- (void)setPersonId:(id)a3
{
}

- (NSMutableArray)classIds
{
  return self->_classIds;
}

- (void)setClassIds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personId, 0);
  objc_storeStrong((id *)&self->_parentObjectId, 0);
  objc_storeStrong((id *)&self->_dateLastModified, 0);
  objc_storeStrong((id *)&self->_dateLastCompleted, 0);

  objc_storeStrong((id *)&self->_classIds, 0);
}

@end