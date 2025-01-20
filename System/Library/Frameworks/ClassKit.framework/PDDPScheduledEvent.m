@interface PDDPScheduledEvent
- (BOOL)hasClassId;
- (BOOL)hasDateCreated;
- (BOOL)hasDateLastModified;
- (BOOL)hasEventDate;
- (BOOL)hasObjectId;
- (BOOL)hasParentObjectId;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)classId;
- (NSString)objectId;
- (NSString)parentObjectId;
- (PDDPDate)dateCreated;
- (PDDPDate)dateLastModified;
- (PDDPDate)eventDate;
- (PDDPStatus)status;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClassId:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateLastModified:(id)a3;
- (void)setEventDate:(id)a3;
- (void)setObjectId:(id)a3;
- (void)setParentObjectId:(id)a3;
- (void)setStatus:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPScheduledEvent

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

- (BOOL)hasEventDate
{
  return self->_eventDate != 0;
}

- (BOOL)hasClassId
{
  return self->_classId != 0;
}

- (BOOL)hasStatus
{
  return self->_status != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPScheduledEvent;
  v3 = [(PDDPScheduledEvent *)&v7 description];
  v4 = [(PDDPScheduledEvent *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
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
  eventDate = self->_eventDate;
  if (eventDate)
  {
    v12 = [(PDDPDate *)eventDate dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"event_date"];
  }
  classId = self->_classId;
  if (classId) {
    [v4 setObject:classId forKey:@"class_id"];
  }
  status = self->_status;
  if (status)
  {
    v15 = [(PDDPStatus *)status dictionaryRepresentation];
    [v4 setObject:v15 forKey:@"status"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000A1684((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_objectId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_parentObjectId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_dateCreated)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_dateLastModified)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_eventDate)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_classId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_status)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_objectId)
  {
    objc_msgSend(v4, "setObjectId:");
    id v4 = v5;
  }
  if (self->_parentObjectId)
  {
    objc_msgSend(v5, "setParentObjectId:");
    id v4 = v5;
  }
  if (self->_dateCreated)
  {
    objc_msgSend(v5, "setDateCreated:");
    id v4 = v5;
  }
  if (self->_dateLastModified)
  {
    objc_msgSend(v5, "setDateLastModified:");
    id v4 = v5;
  }
  if (self->_eventDate)
  {
    objc_msgSend(v5, "setEventDate:");
    id v4 = v5;
  }
  if (self->_classId)
  {
    objc_msgSend(v5, "setClassId:");
    id v4 = v5;
  }
  if (self->_status)
  {
    objc_msgSend(v5, "setStatus:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_objectId copyWithZone:a3];
  objc_super v7 = (void *)v5[5];
  v5[5] = v6;

  id v8 = [(NSString *)self->_parentObjectId copyWithZone:a3];
  v9 = (void *)v5[6];
  v5[6] = v8;

  id v10 = [(PDDPDate *)self->_dateCreated copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  id v12 = [(PDDPDate *)self->_dateLastModified copyWithZone:a3];
  v13 = (void *)v5[3];
  v5[3] = v12;

  id v14 = [(PDDPDate *)self->_eventDate copyWithZone:a3];
  v15 = (void *)v5[4];
  v5[4] = v14;

  id v16 = [(NSString *)self->_classId copyWithZone:a3];
  v17 = (void *)v5[1];
  v5[1] = v16;

  id v18 = [(PDDPStatus *)self->_status copyWithZone:a3];
  v19 = (void *)v5[7];
  v5[7] = v18;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((objectId = self->_objectId, !((unint64_t)objectId | v4[5]))
     || -[NSString isEqual:](objectId, "isEqual:"))
    && ((parentObjectId = self->_parentObjectId, !((unint64_t)parentObjectId | v4[6]))
     || -[NSString isEqual:](parentObjectId, "isEqual:"))
    && ((dateCreated = self->_dateCreated, !((unint64_t)dateCreated | v4[2]))
     || -[PDDPDate isEqual:](dateCreated, "isEqual:"))
    && ((dateLastModified = self->_dateLastModified, !((unint64_t)dateLastModified | v4[3]))
     || -[PDDPDate isEqual:](dateLastModified, "isEqual:"))
    && ((eventDate = self->_eventDate, !((unint64_t)eventDate | v4[4]))
     || -[PDDPDate isEqual:](eventDate, "isEqual:"))
    && ((classId = self->_classId, !((unint64_t)classId | v4[1]))
     || -[NSString isEqual:](classId, "isEqual:")))
  {
    status = self->_status;
    if ((unint64_t)status | v4[7]) {
      unsigned __int8 v12 = -[PDDPStatus isEqual:](status, "isEqual:");
    }
    else {
      unsigned __int8 v12 = 1;
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_objectId hash];
  unint64_t v4 = [(NSString *)self->_parentObjectId hash] ^ v3;
  unint64_t v5 = [(PDDPDate *)self->_dateCreated hash];
  unint64_t v6 = v4 ^ v5 ^ [(PDDPDate *)self->_dateLastModified hash];
  unint64_t v7 = [(PDDPDate *)self->_eventDate hash];
  unint64_t v8 = v7 ^ [(NSString *)self->_classId hash];
  return v6 ^ v8 ^ [(PDDPStatus *)self->_status hash];
}

- (void)mergeFrom:(id)a3
{
  unsigned __int8 v12 = a3;
  if (v12[5]) {
    -[PDDPScheduledEvent setObjectId:](self, "setObjectId:");
  }
  if (v12[6]) {
    -[PDDPScheduledEvent setParentObjectId:](self, "setParentObjectId:");
  }
  dateCreated = self->_dateCreated;
  uint64_t v5 = v12[2];
  if (dateCreated)
  {
    if (v5) {
      -[PDDPDate mergeFrom:](dateCreated, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[PDDPScheduledEvent setDateCreated:](self, "setDateCreated:");
  }
  dateLastModified = self->_dateLastModified;
  uint64_t v7 = v12[3];
  if (dateLastModified)
  {
    if (v7) {
      -[PDDPDate mergeFrom:](dateLastModified, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[PDDPScheduledEvent setDateLastModified:](self, "setDateLastModified:");
  }
  eventDate = self->_eventDate;
  uint64_t v9 = v12[4];
  if (eventDate)
  {
    if (v9) {
      -[PDDPDate mergeFrom:](eventDate, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[PDDPScheduledEvent setEventDate:](self, "setEventDate:");
  }
  if (v12[1]) {
    -[PDDPScheduledEvent setClassId:](self, "setClassId:");
  }
  status = self->_status;
  uint64_t v11 = v12[7];
  if (status)
  {
    if (v11) {
      -[PDDPStatus mergeFrom:](status, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[PDDPScheduledEvent setStatus:](self, "setStatus:");
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

- (PDDPDate)eventDate
{
  return self->_eventDate;
}

- (void)setEventDate:(id)a3
{
}

- (NSString)classId
{
  return self->_classId;
}

- (void)setClassId:(id)a3
{
}

- (PDDPStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_parentObjectId, 0);
  objc_storeStrong((id *)&self->_objectId, 0);
  objc_storeStrong((id *)&self->_eventDate, 0);
  objc_storeStrong((id *)&self->_dateLastModified, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);

  objc_storeStrong((id *)&self->_classId, 0);
}

@end