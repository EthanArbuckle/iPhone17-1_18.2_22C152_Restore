@interface PDDPGroup
- (BOOL)hasDateCreated;
- (BOOL)hasDateLastModified;
- (BOOL)hasEmail;
- (BOOL)hasGroupId;
- (BOOL)hasGroupName;
- (BOOL)hasLocationId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)email;
- (NSString)groupId;
- (NSString)groupName;
- (NSString)locationId;
- (PDDPDate)dateCreated;
- (PDDPDate)dateLastModified;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateLastModified:(id)a3;
- (void)setEmail:(id)a3;
- (void)setGroupId:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setLocationId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPGroup

- (BOOL)hasGroupId
{
  return self->_groupId != 0;
}

- (BOOL)hasGroupName
{
  return self->_groupName != 0;
}

- (BOOL)hasDateCreated
{
  return self->_dateCreated != 0;
}

- (BOOL)hasDateLastModified
{
  return self->_dateLastModified != 0;
}

- (BOOL)hasLocationId
{
  return self->_locationId != 0;
}

- (BOOL)hasEmail
{
  return self->_email != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPGroup;
  v3 = [(PDDPGroup *)&v7 description];
  v4 = [(PDDPGroup *)self dictionaryRepresentation];
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
  groupName = self->_groupName;
  if (groupName) {
    [v4 setObject:groupName forKey:@"group_name"];
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
  locationId = self->_locationId;
  if (locationId) {
    [v4 setObject:locationId forKey:@"location_id"];
  }
  email = self->_email;
  if (email) {
    [v4 setObject:email forKey:@"email"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000B36C8((uint64_t)self, (uint64_t)a3);
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
  if (self->_groupName)
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
  if (self->_locationId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_email)
  {
    PBDataWriterWriteStringField();
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
  if (self->_groupName)
  {
    objc_msgSend(v5, "setGroupName:");
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
  if (self->_locationId)
  {
    objc_msgSend(v5, "setLocationId:");
    id v4 = v5;
  }
  if (self->_email)
  {
    objc_msgSend(v5, "setEmail:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_groupId copyWithZone:a3];
  objc_super v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(NSString *)self->_groupName copyWithZone:a3];
  v9 = (void *)v5[5];
  v5[5] = v8;

  id v10 = [(PDDPDate *)self->_dateCreated copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  id v12 = [(PDDPDate *)self->_dateLastModified copyWithZone:a3];
  v13 = (void *)v5[2];
  v5[2] = v12;

  id v14 = [(NSString *)self->_locationId copyWithZone:a3];
  v15 = (void *)v5[6];
  v5[6] = v14;

  id v16 = [(NSString *)self->_email copyWithZone:a3];
  v17 = (void *)v5[3];
  v5[3] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((groupId = self->_groupId, !((unint64_t)groupId | v4[4]))
     || -[NSString isEqual:](groupId, "isEqual:"))
    && ((groupName = self->_groupName, !((unint64_t)groupName | v4[5]))
     || -[NSString isEqual:](groupName, "isEqual:"))
    && ((dateCreated = self->_dateCreated, !((unint64_t)dateCreated | v4[1]))
     || -[PDDPDate isEqual:](dateCreated, "isEqual:"))
    && ((dateLastModified = self->_dateLastModified, !((unint64_t)dateLastModified | v4[2]))
     || -[PDDPDate isEqual:](dateLastModified, "isEqual:"))
    && ((locationId = self->_locationId, !((unint64_t)locationId | v4[6]))
     || -[NSString isEqual:](locationId, "isEqual:")))
  {
    email = self->_email;
    if ((unint64_t)email | v4[3]) {
      unsigned __int8 v11 = -[NSString isEqual:](email, "isEqual:");
    }
    else {
      unsigned __int8 v11 = 1;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_groupId hash];
  unint64_t v4 = [(NSString *)self->_groupName hash] ^ v3;
  unint64_t v5 = [(PDDPDate *)self->_dateCreated hash];
  unint64_t v6 = v4 ^ v5 ^ [(PDDPDate *)self->_dateLastModified hash];
  NSUInteger v7 = [(NSString *)self->_locationId hash];
  return v6 ^ v7 ^ [(NSString *)self->_email hash];
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  if (v8[4]) {
    -[PDDPGroup setGroupId:](self, "setGroupId:");
  }
  if (v8[5]) {
    -[PDDPGroup setGroupName:](self, "setGroupName:");
  }
  dateCreated = self->_dateCreated;
  uint64_t v5 = v8[1];
  if (dateCreated)
  {
    if (v5) {
      -[PDDPDate mergeFrom:](dateCreated, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[PDDPGroup setDateCreated:](self, "setDateCreated:");
  }
  dateLastModified = self->_dateLastModified;
  uint64_t v7 = v8[2];
  if (dateLastModified)
  {
    if (v7) {
      -[PDDPDate mergeFrom:](dateLastModified, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[PDDPGroup setDateLastModified:](self, "setDateLastModified:");
  }
  if (v8[6]) {
    -[PDDPGroup setLocationId:](self, "setLocationId:");
  }
  if (v8[3]) {
    -[PDDPGroup setEmail:](self, "setEmail:");
  }
}

- (NSString)groupId
{
  return self->_groupId;
}

- (void)setGroupId:(id)a3
{
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
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

- (NSString)locationId
{
  return self->_locationId;
}

- (void)setLocationId:(id)a3
{
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationId, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_dateLastModified, 0);

  objc_storeStrong((id *)&self->_dateCreated, 0);
}

@end