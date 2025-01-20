@interface PDDPEventStatus
- (BOOL)hasObjectId;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)objectId;
- (PDDPStatus)status;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setObjectId:(id)a3;
- (void)setStatus:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPEventStatus

- (BOOL)hasStatus
{
  return self->_status != 0;
}

- (BOOL)hasObjectId
{
  return self->_objectId != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPEventStatus;
  v3 = [(PDDPEventStatus *)&v7 description];
  v4 = [(PDDPEventStatus *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  status = self->_status;
  if (status)
  {
    v5 = [(PDDPStatus *)status dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"status"];
  }
  objectId = self->_objectId;
  if (objectId) {
    [v3 setObject:objectId forKey:@"object_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100126E84((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_status)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_objectId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_status)
  {
    objc_msgSend(v4, "setStatus:");
    id v4 = v5;
  }
  if (self->_objectId)
  {
    objc_msgSend(v5, "setObjectId:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PDDPStatus *)self->_status copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSString *)self->_objectId copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((status = self->_status, !((unint64_t)status | v4[2])) || -[PDDPStatus isEqual:](status, "isEqual:")))
  {
    objectId = self->_objectId;
    if ((unint64_t)objectId | v4[1]) {
      unsigned __int8 v7 = -[NSString isEqual:](objectId, "isEqual:");
    }
    else {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PDDPStatus *)self->_status hash];
  return [(NSString *)self->_objectId hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  status = self->_status;
  uint64_t v6 = v4[2];
  unsigned __int8 v7 = v4;
  if (status)
  {
    if (!v6) {
      goto LABEL_7;
    }
    status = (PDDPStatus *)-[PDDPStatus mergeFrom:](status, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    status = (PDDPStatus *)-[PDDPEventStatus setStatus:](self, "setStatus:");
  }
  id v4 = v7;
LABEL_7:
  if (v4[1])
  {
    status = (PDDPStatus *)-[PDDPEventStatus setObjectId:](self, "setObjectId:");
    id v4 = v7;
  }

  _objc_release_x1(status, v4);
}

- (PDDPStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (NSString)objectId
{
  return self->_objectId;
}

- (void)setObjectId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);

  objc_storeStrong((id *)&self->_objectId, 0);
}

@end