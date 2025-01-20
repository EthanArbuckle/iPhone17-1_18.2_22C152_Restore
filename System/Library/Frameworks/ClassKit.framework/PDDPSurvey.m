@interface PDDPSurvey
+ (Class)classIdsType;
- (BOOL)hasCreatedBy;
- (BOOL)hasDateCreated;
- (BOOL)hasDateLastModified;
- (BOOL)hasEtag;
- (BOOL)hasObjectId;
- (BOOL)hasParentObjectId;
- (BOOL)hasStudentDateFirstSubmitted;
- (BOOL)hasTeacherDateLastModified;
- (BOOL)hasTitle;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)classIds;
- (NSString)createdBy;
- (NSString)etag;
- (NSString)objectId;
- (NSString)parentObjectId;
- (NSString)title;
- (PDDPDate)dateCreated;
- (PDDPDate)dateLastModified;
- (PDDPDate)studentDateFirstSubmitted;
- (PDDPDate)teacherDateLastModified;
- (id)classIdsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)classIdsCount;
- (unint64_t)hash;
- (void)addClassIds:(id)a3;
- (void)clearClassIds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClassIds:(id)a3;
- (void)setCreatedBy:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateLastModified:(id)a3;
- (void)setEtag:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setObjectId:(id)a3;
- (void)setParentObjectId:(id)a3;
- (void)setStudentDateFirstSubmitted:(id)a3;
- (void)setTeacherDateLastModified:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPSurvey

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
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"EXIT_TICKET_TYPE";
    }
    else
    {
      v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
    }
  }
  else
  {
    v4 = @"UNKNOWN_SURVEY_TYPE";
  }
  return v4;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_SURVEY_TYPE"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"EXIT_TICKET_TYPE"];
  }

  return v4;
}

- (BOOL)hasObjectId
{
  return self->_objectId != 0;
}

- (BOOL)hasParentObjectId
{
  return self->_parentObjectId != 0;
}

- (BOOL)hasDateCreated
{
  return self->_dateCreated != 0;
}

- (BOOL)hasDateLastModified
{
  return self->_dateLastModified != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasCreatedBy
{
  return self->_createdBy != 0;
}

- (BOOL)hasStudentDateFirstSubmitted
{
  return self->_studentDateFirstSubmitted != 0;
}

- (BOOL)hasTeacherDateLastModified
{
  return self->_teacherDateLastModified != 0;
}

- (BOOL)hasEtag
{
  return self->_etag != 0;
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
  v7.super_class = (Class)PDDPSurvey;
  id v3 = [(PDDPSurvey *)&v7 description];
  id v4 = [(PDDPSurvey *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    int type = self->_type;
    if (type)
    {
      if (type == 1)
      {
        v5 = @"EXIT_TICKET_TYPE";
      }
      else
      {
        v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_type];
      }
    }
    else
    {
      v5 = @"UNKNOWN_SURVEY_TYPE";
    }
    [v3 setObject:v5 forKey:@"type"];
  }
  objectId = self->_objectId;
  if (objectId) {
    [v3 setObject:objectId forKey:@"object_id"];
  }
  parentObjectId = self->_parentObjectId;
  if (parentObjectId) {
    [v3 setObject:parentObjectId forKey:@"parent_object_id"];
  }
  dateCreated = self->_dateCreated;
  if (dateCreated)
  {
    v9 = [(PDDPDate *)dateCreated dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"date_created"];
  }
  dateLastModified = self->_dateLastModified;
  if (dateLastModified)
  {
    v11 = [(PDDPDate *)dateLastModified dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"date_last_modified"];
  }
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  createdBy = self->_createdBy;
  if (createdBy) {
    [v3 setObject:createdBy forKey:@"created_by"];
  }
  studentDateFirstSubmitted = self->_studentDateFirstSubmitted;
  if (studentDateFirstSubmitted)
  {
    v15 = [(PDDPDate *)studentDateFirstSubmitted dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"student_date_first_submitted"];
  }
  teacherDateLastModified = self->_teacherDateLastModified;
  if (teacherDateLastModified)
  {
    v17 = [(PDDPDate *)teacherDateLastModified dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"teacher_date_last_modified"];
  }
  etag = self->_etag;
  if (etag) {
    [v3 setObject:etag forKey:@"etag"];
  }
  classIds = self->_classIds;
  if (classIds) {
    [v3 setObject:classIds forKey:@"class_ids"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10016142C((uint64_t)self, (uint64_t)a3);
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
  if (self->_parentObjectId) {
    PBDataWriterWriteStringField();
  }
  if (self->_dateCreated) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_dateLastModified) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  if (self->_createdBy) {
    PBDataWriterWriteStringField();
  }
  if (self->_studentDateFirstSubmitted) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_teacherDateLastModified) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_etag) {
    PBDataWriterWriteStringField();
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
  if (*(unsigned char *)&self->_has)
  {
    v4[22] = self->_type;
    *((unsigned char *)v4 + 92) |= 1u;
  }
  id v9 = v4;
  if (self->_objectId) {
    objc_msgSend(v4, "setObjectId:");
  }
  if (self->_parentObjectId) {
    objc_msgSend(v9, "setParentObjectId:");
  }
  if (self->_dateCreated) {
    objc_msgSend(v9, "setDateCreated:");
  }
  if (self->_dateLastModified) {
    objc_msgSend(v9, "setDateLastModified:");
  }
  if (self->_title) {
    objc_msgSend(v9, "setTitle:");
  }
  if (self->_createdBy) {
    objc_msgSend(v9, "setCreatedBy:");
  }
  if (self->_studentDateFirstSubmitted) {
    objc_msgSend(v9, "setStudentDateFirstSubmitted:");
  }
  if (self->_teacherDateLastModified) {
    objc_msgSend(v9, "setTeacherDateLastModified:");
  }
  if (self->_etag) {
    objc_msgSend(v9, "setEtag:");
  }
  if ([(PDDPSurvey *)self classIdsCount])
  {
    [v9 clearClassIds];
    unint64_t v5 = [(PDDPSurvey *)self classIdsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(PDDPSurvey *)self classIdsAtIndex:i];
        [v9 addClassIds:v8];
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
    *((_DWORD *)v5 + 22) = self->_type;
    *((unsigned char *)v5 + 92) |= 1u;
  }
  id v7 = [(NSString *)self->_objectId copyWithZone:a3];
  uint64_t v8 = (void *)v6[6];
  v6[6] = v7;

  id v9 = [(NSString *)self->_parentObjectId copyWithZone:a3];
  long long v10 = (void *)v6[7];
  v6[7] = v9;

  id v11 = [(PDDPDate *)self->_dateCreated copyWithZone:a3];
  long long v12 = (void *)v6[3];
  v6[3] = v11;

  id v13 = [(PDDPDate *)self->_dateLastModified copyWithZone:a3];
  v14 = (void *)v6[4];
  v6[4] = v13;

  id v15 = [(NSString *)self->_title copyWithZone:a3];
  v16 = (void *)v6[10];
  v6[10] = v15;

  id v17 = [(NSString *)self->_createdBy copyWithZone:a3];
  v18 = (void *)v6[2];
  v6[2] = v17;

  id v19 = [(PDDPDate *)self->_studentDateFirstSubmitted copyWithZone:a3];
  v20 = (void *)v6[8];
  v6[8] = v19;

  id v21 = [(PDDPDate *)self->_teacherDateLastModified copyWithZone:a3];
  v22 = (void *)v6[9];
  v6[9] = v21;

  id v23 = [(NSString *)self->_etag copyWithZone:a3];
  v24 = (void *)v6[5];
  v6[5] = v23;

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v25 = self->_classIds;
  id v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v27; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v33 != v28) {
          objc_enumerationMutation(v25);
        }
        id v30 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "copyWithZone:", a3, (void)v32);
        [v6 addClassIds:v30];
      }
      id v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v27);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 92) & 1) == 0 || self->_type != *((_DWORD *)v4 + 22)) {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)v4 + 92))
  {
LABEL_27:
    unsigned __int8 v15 = 0;
    goto LABEL_28;
  }
  objectId = self->_objectId;
  if ((unint64_t)objectId | *((void *)v4 + 6) && !-[NSString isEqual:](objectId, "isEqual:")) {
    goto LABEL_27;
  }
  parentObjectId = self->_parentObjectId;
  if ((unint64_t)parentObjectId | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](parentObjectId, "isEqual:")) {
      goto LABEL_27;
    }
  }
  dateCreated = self->_dateCreated;
  if ((unint64_t)dateCreated | *((void *)v4 + 3))
  {
    if (!-[PDDPDate isEqual:](dateCreated, "isEqual:")) {
      goto LABEL_27;
    }
  }
  dateLastModified = self->_dateLastModified;
  if ((unint64_t)dateLastModified | *((void *)v4 + 4))
  {
    if (!-[PDDPDate isEqual:](dateLastModified, "isEqual:")) {
      goto LABEL_27;
    }
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_27;
    }
  }
  createdBy = self->_createdBy;
  if ((unint64_t)createdBy | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](createdBy, "isEqual:")) {
      goto LABEL_27;
    }
  }
  studentDateFirstSubmitted = self->_studentDateFirstSubmitted;
  if ((unint64_t)studentDateFirstSubmitted | *((void *)v4 + 8))
  {
    if (!-[PDDPDate isEqual:](studentDateFirstSubmitted, "isEqual:")) {
      goto LABEL_27;
    }
  }
  teacherDateLastModified = self->_teacherDateLastModified;
  if ((unint64_t)teacherDateLastModified | *((void *)v4 + 9))
  {
    if (!-[PDDPDate isEqual:](teacherDateLastModified, "isEqual:")) {
      goto LABEL_27;
    }
  }
  etag = self->_etag;
  if ((unint64_t)etag | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](etag, "isEqual:")) {
      goto LABEL_27;
    }
  }
  classIds = self->_classIds;
  if ((unint64_t)classIds | *((void *)v4 + 1)) {
    unsigned __int8 v15 = -[NSMutableArray isEqual:](classIds, "isEqual:");
  }
  else {
    unsigned __int8 v15 = 1;
  }
LABEL_28:

  return v15;
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
  NSUInteger v5 = [(NSString *)self->_parentObjectId hash];
  unint64_t v6 = v4 ^ v5 ^ [(PDDPDate *)self->_dateCreated hash];
  unint64_t v7 = [(PDDPDate *)self->_dateLastModified hash];
  unint64_t v8 = v7 ^ [(NSString *)self->_title hash];
  unint64_t v9 = v6 ^ v8 ^ [(NSString *)self->_createdBy hash];
  unint64_t v10 = [(PDDPDate *)self->_studentDateFirstSubmitted hash];
  unint64_t v11 = v10 ^ [(PDDPDate *)self->_teacherDateLastModified hash];
  unint64_t v12 = v11 ^ [(NSString *)self->_etag hash];
  return v9 ^ v12 ^ (unint64_t)[(NSMutableArray *)self->_classIds hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  id v5 = v4;
  if (v4[23])
  {
    self->_int type = v4[22];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 6)) {
    -[PDDPSurvey setObjectId:](self, "setObjectId:");
  }
  if (*((void *)v5 + 7)) {
    -[PDDPSurvey setParentObjectId:](self, "setParentObjectId:");
  }
  dateCreated = self->_dateCreated;
  uint64_t v7 = *((void *)v5 + 3);
  if (dateCreated)
  {
    if (v7) {
      -[PDDPDate mergeFrom:](dateCreated, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[PDDPSurvey setDateCreated:](self, "setDateCreated:");
  }
  dateLastModified = self->_dateLastModified;
  uint64_t v9 = *((void *)v5 + 4);
  if (dateLastModified)
  {
    if (v9) {
      -[PDDPDate mergeFrom:](dateLastModified, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[PDDPSurvey setDateLastModified:](self, "setDateLastModified:");
  }
  if (*((void *)v5 + 10)) {
    -[PDDPSurvey setTitle:](self, "setTitle:");
  }
  if (*((void *)v5 + 2)) {
    -[PDDPSurvey setCreatedBy:](self, "setCreatedBy:");
  }
  studentDateFirstSubmitted = self->_studentDateFirstSubmitted;
  uint64_t v11 = *((void *)v5 + 8);
  if (studentDateFirstSubmitted)
  {
    if (v11) {
      -[PDDPDate mergeFrom:](studentDateFirstSubmitted, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[PDDPSurvey setStudentDateFirstSubmitted:](self, "setStudentDateFirstSubmitted:");
  }
  teacherDateLastModified = self->_teacherDateLastModified;
  uint64_t v13 = *((void *)v5 + 9);
  if (teacherDateLastModified)
  {
    if (v13) {
      -[PDDPDate mergeFrom:](teacherDateLastModified, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[PDDPSurvey setTeacherDateLastModified:](self, "setTeacherDateLastModified:");
  }
  if (*((void *)v5 + 5)) {
    -[PDDPSurvey setEtag:](self, "setEtag:");
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = *((id *)v5 + 1);
  id v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        -[PDDPSurvey addClassIds:](self, "addClassIds:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
      }
      id v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v16);
  }
}

- (NSString)objectId
{
  return self->_objectId;
}

- (void)setObjectId:(id)a3
{
}

- (NSString)parentObjectId
{
  return self->_parentObjectId;
}

- (void)setParentObjectId:(id)a3
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

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)createdBy
{
  return self->_createdBy;
}

- (void)setCreatedBy:(id)a3
{
}

- (PDDPDate)studentDateFirstSubmitted
{
  return self->_studentDateFirstSubmitted;
}

- (void)setStudentDateFirstSubmitted:(id)a3
{
}

- (PDDPDate)teacherDateLastModified
{
  return self->_teacherDateLastModified;
}

- (void)setTeacherDateLastModified:(id)a3
{
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
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
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_teacherDateLastModified, 0);
  objc_storeStrong((id *)&self->_studentDateFirstSubmitted, 0);
  objc_storeStrong((id *)&self->_parentObjectId, 0);
  objc_storeStrong((id *)&self->_objectId, 0);
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_dateLastModified, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_createdBy, 0);

  objc_storeStrong((id *)&self->_classIds, 0);
}

@end