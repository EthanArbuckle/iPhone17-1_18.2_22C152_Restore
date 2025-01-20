@interface PDDPStateChangeMeta
- (BOOL)hasEtag;
- (BOOL)hasExecutionId;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)etag;
- (NSString)executionId;
- (PDDPStatus)status;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEtag:(id)a3;
- (void)setExecutionId:(id)a3;
- (void)setStatus:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPStateChangeMeta

- (BOOL)hasExecutionId
{
  return self->_executionId != 0;
}

- (BOOL)hasStatus
{
  return self->_status != 0;
}

- (BOOL)hasEtag
{
  return self->_etag != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPStateChangeMeta;
  v3 = [(PDDPStateChangeMeta *)&v7 description];
  v4 = [(PDDPStateChangeMeta *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  executionId = self->_executionId;
  if (executionId) {
    [v3 setObject:executionId forKey:@"execution_id"];
  }
  status = self->_status;
  if (status)
  {
    objc_super v7 = [(PDDPStatus *)status dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"status"];
  }
  etag = self->_etag;
  if (etag) {
    [v4 setObject:etag forKey:@"etag"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000482C8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_executionId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_status)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_etag)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_executionId)
  {
    objc_msgSend(v4, "setExecutionId:");
    id v4 = v5;
  }
  if (self->_status)
  {
    objc_msgSend(v5, "setStatus:");
    id v4 = v5;
  }
  if (self->_etag)
  {
    objc_msgSend(v5, "setEtag:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_executionId copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(PDDPStatus *)self->_status copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = [(NSString *)self->_etag copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((executionId = self->_executionId, !((unint64_t)executionId | v4[2]))
     || -[NSString isEqual:](executionId, "isEqual:"))
    && ((status = self->_status, !((unint64_t)status | v4[3])) || -[PDDPStatus isEqual:](status, "isEqual:")))
  {
    etag = self->_etag;
    if ((unint64_t)etag | v4[1]) {
      unsigned __int8 v8 = -[NSString isEqual:](etag, "isEqual:");
    }
    else {
      unsigned __int8 v8 = 1;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_executionId hash];
  unint64_t v4 = [(PDDPStatus *)self->_status hash] ^ v3;
  return v4 ^ [(NSString *)self->_etag hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  objc_super v7 = v4;
  if (v4[2])
  {
    -[PDDPStateChangeMeta setExecutionId:](self, "setExecutionId:");
    unint64_t v4 = v7;
  }
  status = self->_status;
  uint64_t v6 = v4[3];
  if (status)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[PDDPStatus mergeFrom:](status, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[PDDPStateChangeMeta setStatus:](self, "setStatus:");
  }
  unint64_t v4 = v7;
LABEL_9:
  if (v4[1]) {
    -[PDDPStateChangeMeta setEtag:](self, "setEtag:");
  }

  _objc_release_x1();
}

- (NSString)executionId
{
  return self->_executionId;
}

- (void)setExecutionId:(id)a3
{
}

- (PDDPStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_executionId, 0);

  objc_storeStrong((id *)&self->_etag, 0);
}

@end