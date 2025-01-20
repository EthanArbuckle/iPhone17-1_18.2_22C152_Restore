@interface PDDPGroupMember
- (BOOL)hasDateCreated;
- (BOOL)hasDateLastModified;
- (BOOL)hasGroupId;
- (BOOL)hasPersonIds;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)groupId;
- (PDDPDate)dateCreated;
- (PDDPDate)dateLastModified;
- (PDDPTypedValue)personIds;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateLastModified:(id)a3;
- (void)setGroupId:(id)a3;
- (void)setPersonIds:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPGroupMember

- (BOOL)hasGroupId
{
  return self->_groupId != 0;
}

- (BOOL)hasPersonIds
{
  return self->_personIds != 0;
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
  v7.super_class = (Class)PDDPGroupMember;
  v3 = [(PDDPGroupMember *)&v7 description];
  v4 = [(PDDPGroupMember *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  groupId = self->_groupId;
  if (groupId) {
    [v3 setObject:groupId forKey:@"group_id"];
  }
  personIds = self->_personIds;
  if (personIds)
  {
    objc_super v7 = [(PDDPTypedValue *)personIds dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"person_ids"];
  }
  dateCreated = self->_dateCreated;
  if (dateCreated)
  {
    v9 = [(PDDPDate *)dateCreated dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"date_created"];
  }
  dateLastModified = self->_dateLastModified;
  if (dateLastModified)
  {
    v11 = [(PDDPDate *)dateLastModified dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"date_last_modified"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100062FA4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_groupId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_personIds)
  {
    PBDataWriterWriteSubmessage();
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
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_groupId)
  {
    objc_msgSend(v4, "setGroupId:");
    id v4 = v5;
  }
  if (self->_personIds)
  {
    objc_msgSend(v5, "setPersonIds:");
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
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_groupId copyWithZone:a3];
  objc_super v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(PDDPTypedValue *)self->_personIds copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = [(PDDPDate *)self->_dateCreated copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  id v12 = [(PDDPDate *)self->_dateLastModified copyWithZone:a3];
  v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((groupId = self->_groupId, !((unint64_t)groupId | v4[3]))
     || -[NSString isEqual:](groupId, "isEqual:"))
    && ((personIds = self->_personIds, !((unint64_t)personIds | v4[4]))
     || -[PDDPTypedValue isEqual:](personIds, "isEqual:"))
    && ((dateCreated = self->_dateCreated, !((unint64_t)dateCreated | v4[1]))
     || -[PDDPDate isEqual:](dateCreated, "isEqual:")))
  {
    dateLastModified = self->_dateLastModified;
    if ((unint64_t)dateLastModified | v4[2]) {
      unsigned __int8 v9 = -[PDDPDate isEqual:](dateLastModified, "isEqual:");
    }
    else {
      unsigned __int8 v9 = 1;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_groupId hash];
  unint64_t v4 = [(PDDPTypedValue *)self->_personIds hash] ^ v3;
  unint64_t v5 = [(PDDPDate *)self->_dateCreated hash];
  return v4 ^ v5 ^ [(PDDPDate *)self->_dateLastModified hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  v11 = v4;
  if (v4[3])
  {
    -[PDDPGroupMember setGroupId:](self, "setGroupId:");
    unint64_t v4 = v11;
  }
  personIds = self->_personIds;
  uint64_t v6 = v4[4];
  if (personIds)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[PDDPTypedValue mergeFrom:](personIds, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[PDDPGroupMember setPersonIds:](self, "setPersonIds:");
  }
  unint64_t v4 = v11;
LABEL_9:
  dateCreated = self->_dateCreated;
  uint64_t v8 = v4[1];
  if (dateCreated)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[PDDPDate mergeFrom:](dateCreated, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[PDDPGroupMember setDateCreated:](self, "setDateCreated:");
  }
  unint64_t v4 = v11;
LABEL_15:
  dateLastModified = self->_dateLastModified;
  uint64_t v10 = v4[2];
  if (dateLastModified)
  {
    if (v10) {
      -[PDDPDate mergeFrom:](dateLastModified, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[PDDPGroupMember setDateLastModified:](self, "setDateLastModified:");
  }

  _objc_release_x1();
}

- (NSString)groupId
{
  return self->_groupId;
}

- (void)setGroupId:(id)a3
{
}

- (PDDPTypedValue)personIds
{
  return self->_personIds;
}

- (void)setPersonIds:(id)a3
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
  objc_storeStrong((id *)&self->_personIds, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_dateLastModified, 0);

  objc_storeStrong((id *)&self->_dateCreated, 0);
}

@end