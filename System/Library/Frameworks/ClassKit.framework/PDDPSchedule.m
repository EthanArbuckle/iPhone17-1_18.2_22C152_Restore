@interface PDDPSchedule
- (BOOL)hasClassId;
- (BOOL)hasDateCreated;
- (BOOL)hasDateLastModified;
- (BOOL)hasObjectId;
- (BOOL)hasParentObjectId;
- (BOOL)hasScheduleAction;
- (BOOL)hasScheduleDate;
- (BOOL)hasScheduledEntityType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)classId;
- (NSString)objectId;
- (NSString)parentObjectId;
- (PDDPDate)dateCreated;
- (PDDPDate)dateLastModified;
- (PDDPDate)scheduleDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)scheduleActionAsString:(int)a3;
- (id)scheduledEntityTypeAsString:(int)a3;
- (int)StringAsScheduleAction:(id)a3;
- (int)StringAsScheduledEntityType:(id)a3;
- (int)scheduleAction;
- (int)scheduledEntityType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClassId:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateLastModified:(id)a3;
- (void)setHasScheduleAction:(BOOL)a3;
- (void)setHasScheduledEntityType:(BOOL)a3;
- (void)setObjectId:(id)a3;
- (void)setParentObjectId:(id)a3;
- (void)setScheduleAction:(int)a3;
- (void)setScheduleDate:(id)a3;
- (void)setScheduledEntityType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPSchedule

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

- (int)scheduledEntityType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_scheduledEntityType;
  }
  else {
    return 0;
  }
}

- (void)setScheduledEntityType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_scheduledEntityType = a3;
}

- (void)setHasScheduledEntityType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasScheduledEntityType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)scheduledEntityTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"HANDOUT_TYPE";
    }
    else
    {
      v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
    }
  }
  else
  {
    v4 = @"UNKNOWN_TYPE";
  }
  return v4;
}

- (int)StringAsScheduledEntityType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_TYPE"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"HANDOUT_TYPE"];
  }

  return v4;
}

- (int)scheduleAction
{
  if (*(unsigned char *)&self->_has) {
    return self->_scheduleAction;
  }
  else {
    return 0;
  }
}

- (void)setScheduleAction:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_scheduleAction = a3;
}

- (void)setHasScheduleAction:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasScheduleAction
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)scheduleActionAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"PUBLISH_ACTION";
    }
    else
    {
      int v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
    }
  }
  else
  {
    int v4 = @"UNKNOWN_ACTION";
  }
  return v4;
}

- (int)StringAsScheduleAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_ACTION"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"PUBLISH_ACTION"];
  }

  return v4;
}

- (BOOL)hasScheduleDate
{
  return self->_scheduleDate != 0;
}

- (BOOL)hasClassId
{
  return self->_classId != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPSchedule;
  id v3 = [(PDDPSchedule *)&v7 description];
  int v4 = [(PDDPSchedule *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  objectId = self->_objectId;
  if (objectId) {
    [v3 setObject:objectId forKey:@"object_id"];
  }
  parentObjectId = self->_parentObjectId;
  if (parentObjectId) {
    [v4 setObject:parentObjectId forKey:@"parent_object_id"];
  }
  dateCreated = self->_dateCreated;
  if (dateCreated)
  {
    v8 = [(PDDPDate *)dateCreated dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"date_created"];
  }
  dateLastModified = self->_dateLastModified;
  if (dateLastModified)
  {
    v10 = [(PDDPDate *)dateLastModified dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"date_last_modified"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    int scheduledEntityType = self->_scheduledEntityType;
    if (scheduledEntityType)
    {
      if (scheduledEntityType == 1)
      {
        v13 = @"HANDOUT_TYPE";
      }
      else
      {
        v13 = +[NSString stringWithFormat:@"(unknown: %i)", self->_scheduledEntityType];
      }
    }
    else
    {
      v13 = @"UNKNOWN_TYPE";
    }
    [v4 setObject:v13 forKey:@"scheduled_entity_type"];

    char has = (char)self->_has;
  }
  if (has)
  {
    int scheduleAction = self->_scheduleAction;
    if (scheduleAction)
    {
      if (scheduleAction == 1)
      {
        v15 = @"PUBLISH_ACTION";
      }
      else
      {
        v15 = +[NSString stringWithFormat:@"(unknown: %i)", self->_scheduleAction];
      }
    }
    else
    {
      v15 = @"UNKNOWN_ACTION";
    }
    [v4 setObject:v15 forKey:@"schedule_action"];
  }
  scheduleDate = self->_scheduleDate;
  if (scheduleDate)
  {
    v17 = [(PDDPDate *)scheduleDate dictionaryRepresentation];
    [v4 setObject:v17 forKey:@"schedule_date"];
  }
  classId = self->_classId;
  if (classId) {
    [v4 setObject:classId forKey:@"class_id"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000F2FF4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_objectId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_parentObjectId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_dateCreated)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_dateLastModified)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_scheduleDate)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_classId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_objectId)
  {
    objc_msgSend(v4, "setObjectId:");
    id v4 = v6;
  }
  if (self->_parentObjectId)
  {
    objc_msgSend(v6, "setParentObjectId:");
    id v4 = v6;
  }
  if (self->_dateCreated)
  {
    objc_msgSend(v6, "setDateCreated:");
    id v4 = v6;
  }
  if (self->_dateLastModified)
  {
    objc_msgSend(v6, "setDateLastModified:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_scheduledEntityType;
    *((unsigned char *)v4 + 68) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 12) = self->_scheduleAction;
    *((unsigned char *)v4 + 68) |= 1u;
  }
  if (self->_scheduleDate)
  {
    objc_msgSend(v6, "setScheduleDate:");
    id v4 = v6;
  }
  if (self->_classId)
  {
    objc_msgSend(v6, "setClassId:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_objectId copyWithZone:a3];
  objc_super v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(NSString *)self->_parentObjectId copyWithZone:a3];
  v9 = (void *)v5[5];
  v5[5] = v8;

  id v10 = [(PDDPDate *)self->_dateCreated copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  id v12 = [(PDDPDate *)self->_dateLastModified copyWithZone:a3];
  v13 = (void *)v5[3];
  v5[3] = v12;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 16) = self->_scheduledEntityType;
    *((unsigned char *)v5 + 68) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v5 + 12) = self->_scheduleAction;
    *((unsigned char *)v5 + 68) |= 1u;
  }
  id v15 = [(PDDPDate *)self->_scheduleDate copyWithZone:a3];
  v16 = (void *)v5[7];
  v5[7] = v15;

  id v17 = [(NSString *)self->_classId copyWithZone:a3];
  v18 = (void *)v5[1];
  v5[1] = v17;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  objectId = self->_objectId;
  if ((unint64_t)objectId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](objectId, "isEqual:")) {
      goto LABEL_24;
    }
  }
  parentObjectId = self->_parentObjectId;
  if ((unint64_t)parentObjectId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](parentObjectId, "isEqual:")) {
      goto LABEL_24;
    }
  }
  dateCreated = self->_dateCreated;
  if ((unint64_t)dateCreated | *((void *)v4 + 2))
  {
    if (!-[PDDPDate isEqual:](dateCreated, "isEqual:")) {
      goto LABEL_24;
    }
  }
  dateLastModified = self->_dateLastModified;
  if ((unint64_t)dateLastModified | *((void *)v4 + 3))
  {
    if (!-[PDDPDate isEqual:](dateLastModified, "isEqual:")) {
      goto LABEL_24;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_scheduledEntityType != *((_DWORD *)v4 + 16)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
LABEL_24:
    unsigned __int8 v11 = 0;
    goto LABEL_25;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_scheduleAction != *((_DWORD *)v4 + 12)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_24;
  }
  scheduleDate = self->_scheduleDate;
  if ((unint64_t)scheduleDate | *((void *)v4 + 7) && !-[PDDPDate isEqual:](scheduleDate, "isEqual:")) {
    goto LABEL_24;
  }
  classId = self->_classId;
  if ((unint64_t)classId | *((void *)v4 + 1)) {
    unsigned __int8 v11 = -[NSString isEqual:](classId, "isEqual:");
  }
  else {
    unsigned __int8 v11 = 1;
  }
LABEL_25:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_objectId hash];
  NSUInteger v4 = [(NSString *)self->_parentObjectId hash];
  unint64_t v5 = [(PDDPDate *)self->_dateCreated hash];
  unint64_t v6 = [(PDDPDate *)self->_dateLastModified hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v7 = 2654435761 * self->_scheduledEntityType;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v8 = 0;
    goto LABEL_6;
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v8 = 2654435761 * self->_scheduleAction;
LABEL_6:
  NSUInteger v9 = v4 ^ v3 ^ v5 ^ v6;
  unint64_t v10 = v7 ^ v8 ^ [(PDDPDate *)self->_scheduleDate hash];
  return v9 ^ v10 ^ [(NSString *)self->_classId hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (int *)a3;
  id v12 = v4;
  if (*((void *)v4 + 4))
  {
    -[PDDPSchedule setObjectId:](self, "setObjectId:");
    NSUInteger v4 = v12;
  }
  if (*((void *)v4 + 5))
  {
    -[PDDPSchedule setParentObjectId:](self, "setParentObjectId:");
    NSUInteger v4 = v12;
  }
  dateCreated = self->_dateCreated;
  uint64_t v6 = *((void *)v4 + 2);
  if (dateCreated)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[PDDPDate mergeFrom:](dateCreated, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[PDDPSchedule setDateCreated:](self, "setDateCreated:");
  }
  NSUInteger v4 = v12;
LABEL_11:
  dateLastModified = self->_dateLastModified;
  uint64_t v8 = *((void *)v4 + 3);
  if (dateLastModified)
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[PDDPDate mergeFrom:](dateLastModified, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[PDDPSchedule setDateLastModified:](self, "setDateLastModified:");
  }
  NSUInteger v4 = v12;
LABEL_17:
  char v9 = *((unsigned char *)v4 + 68);
  if ((v9 & 2) != 0)
  {
    self->_int scheduledEntityType = v4[16];
    *(unsigned char *)&self->_has |= 2u;
    char v9 = *((unsigned char *)v4 + 68);
  }
  if (v9)
  {
    self->_int scheduleAction = v4[12];
    *(unsigned char *)&self->_has |= 1u;
  }
  scheduleDate = self->_scheduleDate;
  uint64_t v11 = *((void *)v4 + 7);
  if (scheduleDate)
  {
    if (!v11) {
      goto LABEL_27;
    }
    scheduleDate = (PDDPDate *)-[PDDPDate mergeFrom:](scheduleDate, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_27;
    }
    scheduleDate = (PDDPDate *)-[PDDPSchedule setScheduleDate:](self, "setScheduleDate:");
  }
  NSUInteger v4 = v12;
LABEL_27:
  if (*((void *)v4 + 1))
  {
    scheduleDate = (PDDPDate *)-[PDDPSchedule setClassId:](self, "setClassId:");
    NSUInteger v4 = v12;
  }

  _objc_release_x1(scheduleDate, v4);
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

- (PDDPDate)scheduleDate
{
  return self->_scheduleDate;
}

- (void)setScheduleDate:(id)a3
{
}

- (NSString)classId
{
  return self->_classId;
}

- (void)setClassId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleDate, 0);
  objc_storeStrong((id *)&self->_parentObjectId, 0);
  objc_storeStrong((id *)&self->_objectId, 0);
  objc_storeStrong((id *)&self->_dateLastModified, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);

  objc_storeStrong((id *)&self->_classId, 0);
}

@end