@interface PDDPPersonLinkId
- (BOOL)hasContext;
- (BOOL)hasPersonLinkId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)context;
- (NSString)personLinkId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContext:(id)a3;
- (void)setPersonLinkId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPPersonLinkId

- (BOOL)hasPersonLinkId
{
  return self->_personLinkId != 0;
}

- (BOOL)hasContext
{
  return self->_context != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPPersonLinkId;
  v3 = [(PDDPPersonLinkId *)&v7 description];
  v4 = [(PDDPPersonLinkId *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  personLinkId = self->_personLinkId;
  if (personLinkId) {
    [v3 setObject:personLinkId forKey:@"person_link_id"];
  }
  context = self->_context;
  if (context) {
    [v4 setObject:context forKey:@"context"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100047968((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_personLinkId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_context)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_personLinkId)
  {
    objc_msgSend(v4, "setPersonLinkId:");
    id v4 = v5;
  }
  if (self->_context)
  {
    objc_msgSend(v5, "setContext:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_personLinkId copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSString *)self->_context copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((personLinkId = self->_personLinkId, !((unint64_t)personLinkId | v4[2]))
     || -[NSString isEqual:](personLinkId, "isEqual:")))
  {
    context = self->_context;
    if ((unint64_t)context | v4[1]) {
      unsigned __int8 v7 = -[NSString isEqual:](context, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_personLinkId hash];
  return [(NSString *)self->_context hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[PDDPPersonLinkId setPersonLinkId:](self, "setPersonLinkId:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[PDDPPersonLinkId setContext:](self, "setContext:");
    id v4 = v5;
  }
}

- (NSString)personLinkId
{
  return self->_personLinkId;
}

- (void)setPersonLinkId:(id)a3
{
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personLinkId, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end