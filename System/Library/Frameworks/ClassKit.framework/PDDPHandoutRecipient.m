@interface PDDPHandoutRecipient
- (BOOL)hasAppIdentifier;
- (BOOL)hasClassId;
- (BOOL)hasObjectId;
- (BOOL)hasParentObjectId;
- (BOOL)hasPersonId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)appIdentifier;
- (NSString)classId;
- (NSString)objectId;
- (NSString)parentObjectId;
- (NSString)personId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppIdentifier:(id)a3;
- (void)setClassId:(id)a3;
- (void)setObjectId:(id)a3;
- (void)setParentObjectId:(id)a3;
- (void)setPersonId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPHandoutRecipient

- (BOOL)hasObjectId
{
  return self->_objectId != 0;
}

- (BOOL)hasParentObjectId
{
  return self->_parentObjectId != 0;
}

- (BOOL)hasClassId
{
  return self->_classId != 0;
}

- (BOOL)hasPersonId
{
  return self->_personId != 0;
}

- (BOOL)hasAppIdentifier
{
  return self->_appIdentifier != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPHandoutRecipient;
  v3 = [(PDDPHandoutRecipient *)&v7 description];
  v4 = [(PDDPHandoutRecipient *)self dictionaryRepresentation];
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
  classId = self->_classId;
  if (classId) {
    [v4 setObject:classId forKey:@"class_id"];
  }
  personId = self->_personId;
  if (personId) {
    [v4 setObject:personId forKey:@"person_id"];
  }
  appIdentifier = self->_appIdentifier;
  if (appIdentifier) {
    [v4 setObject:appIdentifier forKey:@"app_identifier"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100133FB4((uint64_t)self, (uint64_t)a3);
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
  if (self->_classId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_personId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_appIdentifier)
  {
    PBDataWriterWriteStringField();
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
  if (self->_classId)
  {
    objc_msgSend(v5, "setClassId:");
    id v4 = v5;
  }
  if (self->_personId)
  {
    objc_msgSend(v5, "setPersonId:");
    id v4 = v5;
  }
  if (self->_appIdentifier)
  {
    objc_msgSend(v5, "setAppIdentifier:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_objectId copyWithZone:a3];
  objc_super v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(NSString *)self->_parentObjectId copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = [(NSString *)self->_classId copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  id v12 = [(NSString *)self->_personId copyWithZone:a3];
  v13 = (void *)v5[5];
  v5[5] = v12;

  id v14 = [(NSString *)self->_appIdentifier copyWithZone:a3];
  v15 = (void *)v5[1];
  v5[1] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((objectId = self->_objectId, !((unint64_t)objectId | v4[3]))
     || -[NSString isEqual:](objectId, "isEqual:"))
    && ((parentObjectId = self->_parentObjectId, !((unint64_t)parentObjectId | v4[4]))
     || -[NSString isEqual:](parentObjectId, "isEqual:"))
    && ((classId = self->_classId, !((unint64_t)classId | v4[2]))
     || -[NSString isEqual:](classId, "isEqual:"))
    && ((personId = self->_personId, !((unint64_t)personId | v4[5]))
     || -[NSString isEqual:](personId, "isEqual:")))
  {
    appIdentifier = self->_appIdentifier;
    if ((unint64_t)appIdentifier | v4[1]) {
      unsigned __int8 v10 = -[NSString isEqual:](appIdentifier, "isEqual:");
    }
    else {
      unsigned __int8 v10 = 1;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_objectId hash];
  unint64_t v4 = [(NSString *)self->_parentObjectId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_classId hash];
  unint64_t v6 = v4 ^ v5 ^ [(NSString *)self->_personId hash];
  return v6 ^ [(NSString *)self->_appIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if (v4[3]) {
    -[PDDPHandoutRecipient setObjectId:](self, "setObjectId:");
  }
  if (v4[4]) {
    -[PDDPHandoutRecipient setParentObjectId:](self, "setParentObjectId:");
  }
  if (v4[2]) {
    -[PDDPHandoutRecipient setClassId:](self, "setClassId:");
  }
  if (v4[5]) {
    -[PDDPHandoutRecipient setPersonId:](self, "setPersonId:");
  }
  if (v4[1]) {
    -[PDDPHandoutRecipient setAppIdentifier:](self, "setAppIdentifier:");
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

- (NSString)classId
{
  return self->_classId;
}

- (void)setClassId:(id)a3
{
}

- (NSString)personId
{
  return self->_personId;
}

- (void)setPersonId:(id)a3
{
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personId, 0);
  objc_storeStrong((id *)&self->_parentObjectId, 0);
  objc_storeStrong((id *)&self->_objectId, 0);
  objc_storeStrong((id *)&self->_classId, 0);

  objc_storeStrong((id *)&self->_appIdentifier, 0);
}

@end