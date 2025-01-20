@interface PDDPReportRequestItem
+ (Class)handoutIdsType;
+ (Class)studentIdsType;
- (BOOL)hasClassId;
- (BOOL)hasDesiredGranularity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)handoutIds;
- (NSMutableArray)studentIds;
- (NSString)classId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)desiredGranularityAsString:(int)a3;
- (id)dictionaryRepresentation;
- (id)handoutIdsAtIndex:(unint64_t)a3;
- (id)studentIdsAtIndex:(unint64_t)a3;
- (int)StringAsDesiredGranularity:(id)a3;
- (int)desiredGranularity;
- (unint64_t)handoutIdsCount;
- (unint64_t)hash;
- (unint64_t)studentIdsCount;
- (void)addHandoutIds:(id)a3;
- (void)addStudentIds:(id)a3;
- (void)clearHandoutIds;
- (void)clearStudentIds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClassId:(id)a3;
- (void)setDesiredGranularity:(int)a3;
- (void)setHandoutIds:(id)a3;
- (void)setHasDesiredGranularity:(BOOL)a3;
- (void)setStudentIds:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPReportRequestItem

- (BOOL)hasClassId
{
  return self->_classId != 0;
}

- (void)clearHandoutIds
{
}

- (void)addHandoutIds:(id)a3
{
  id v4 = a3;
  handoutIds = self->_handoutIds;
  id v8 = v4;
  if (!handoutIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_handoutIds;
    self->_handoutIds = v6;

    id v4 = v8;
    handoutIds = self->_handoutIds;
  }
  [(NSMutableArray *)handoutIds addObject:v4];
}

- (unint64_t)handoutIdsCount
{
  return (unint64_t)[(NSMutableArray *)self->_handoutIds count];
}

- (id)handoutIdsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_handoutIds objectAtIndex:a3];
}

+ (Class)handoutIdsType
{
  return (Class)objc_opt_class();
}

- (void)clearStudentIds
{
}

- (void)addStudentIds:(id)a3
{
  id v4 = a3;
  studentIds = self->_studentIds;
  id v8 = v4;
  if (!studentIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_studentIds;
    self->_studentIds = v6;

    id v4 = v8;
    studentIds = self->_studentIds;
  }
  [(NSMutableArray *)studentIds addObject:v4];
}

- (unint64_t)studentIdsCount
{
  return (unint64_t)[(NSMutableArray *)self->_studentIds count];
}

- (id)studentIdsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_studentIds objectAtIndex:a3];
}

+ (Class)studentIdsType
{
  return (Class)objc_opt_class();
}

- (int)desiredGranularity
{
  if (*(unsigned char *)&self->_has) {
    return self->_desiredGranularity;
  }
  else {
    return 0;
  }
}

- (void)setDesiredGranularity:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_desiredGranularity = a3;
}

- (void)setHasDesiredGranularity:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDesiredGranularity
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)desiredGranularityAsString:(int)a3
{
  if (a3 >= 5)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = off_1001F4528[a3];
  }

  return v3;
}

- (int)StringAsDesiredGranularity:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_GRANULARITY"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DAILY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EVERY_7_DAY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"EVERY_30_DAY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"COMPLETE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPReportRequestItem;
  id v3 = [(PDDPReportRequestItem *)&v7 description];
  int v4 = [(PDDPReportRequestItem *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  classId = self->_classId;
  if (classId) {
    [v3 setObject:classId forKey:@"class_id"];
  }
  handoutIds = self->_handoutIds;
  if (handoutIds) {
    [v4 setObject:handoutIds forKey:@"handout_ids"];
  }
  studentIds = self->_studentIds;
  if (studentIds) {
    [v4 setObject:studentIds forKey:@"student_ids"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t desiredGranularity = self->_desiredGranularity;
    if (desiredGranularity >= 5)
    {
      v9 = +[NSString stringWithFormat:@"(unknown: %i)", self->_desiredGranularity];
    }
    else
    {
      v9 = off_1001F4528[desiredGranularity];
    }
    [v4 setObject:v9 forKey:@"desired_granularity"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000D7568((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_classId) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_handoutIds;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_studentIds;
  v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if (self->_classId) {
    objc_msgSend(v12, "setClassId:");
  }
  if ([(PDDPReportRequestItem *)self handoutIdsCount])
  {
    [v12 clearHandoutIds];
    unint64_t v4 = [(PDDPReportRequestItem *)self handoutIdsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        objc_super v7 = [(PDDPReportRequestItem *)self handoutIdsAtIndex:i];
        [v12 addHandoutIds:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v12 + 4) = self->_desiredGranularity;
    *((unsigned char *)v12 + 40) |= 1u;
  }
  if ([(PDDPReportRequestItem *)self studentIdsCount])
  {
    [v12 clearStudentIds];
    unint64_t v8 = [(PDDPReportRequestItem *)self studentIdsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        v11 = [(PDDPReportRequestItem *)self studentIdsAtIndex:j];
        [v12 addStudentIds:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_classId copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  unint64_t v8 = self->_handoutIds;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v25 + 1) + 8 * (void)v12) copyWithZone:a3];
        [v5 addHandoutIds:v13];

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 4) = self->_desiredGranularity;
    *((unsigned char *)v5 + 40) |= 1u;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v14 = self->_studentIds;
  id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      long long v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)v18), "copyWithZone:", a3, (void)v21);
        [v5 addStudentIds:v19];

        long long v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  classId = self->_classId;
  if ((unint64_t)classId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](classId, "isEqual:")) {
      goto LABEL_13;
    }
  }
  handoutIds = self->_handoutIds;
  if ((unint64_t)handoutIds | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](handoutIds, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_desiredGranularity != *((_DWORD *)v4 + 4)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    unsigned __int8 v8 = 0;
    goto LABEL_14;
  }
  studentIds = self->_studentIds;
  if ((unint64_t)studentIds | *((void *)v4 + 4)) {
    unsigned __int8 v8 = -[NSMutableArray isEqual:](studentIds, "isEqual:");
  }
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_classId hash];
  unint64_t v4 = (unint64_t)[(NSMutableArray *)self->_handoutIds hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_desiredGranularity;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ (unint64_t)[(NSMutableArray *)self->_studentIds hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[PDDPReportRequestItem setClassId:](self, "setClassId:");
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = *((id *)v4 + 3);
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(PDDPReportRequestItem *)self addHandoutIds:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v4 + 40))
  {
    self->_uint64_t desiredGranularity = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v4 + 4);
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[PDDPReportRequestItem addStudentIds:](self, "addStudentIds:", *(void *)(*((void *)&v15 + 1) + 8 * (void)j), (void)v15);
      }
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (NSString)classId
{
  return self->_classId;
}

- (void)setClassId:(id)a3
{
}

- (NSMutableArray)handoutIds
{
  return self->_handoutIds;
}

- (void)setHandoutIds:(id)a3
{
}

- (NSMutableArray)studentIds
{
  return self->_studentIds;
}

- (void)setStudentIds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_studentIds, 0);
  objc_storeStrong((id *)&self->_handoutIds, 0);

  objc_storeStrong((id *)&self->_classId, 0);
}

@end