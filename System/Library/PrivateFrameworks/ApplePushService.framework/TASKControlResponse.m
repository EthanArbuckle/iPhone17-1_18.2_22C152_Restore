@interface TASKControlResponse
- (BOOL)hasCreate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (TASKResponse)create;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCreate:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TASKControlResponse

- (BOOL)hasCreate
{
  return self->_create != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)TASKControlResponse;
  v3 = [(TASKControlResponse *)&v7 description];
  v4 = [(TASKControlResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  create = self->_create;
  if (create)
  {
    v5 = [(TASKResponse *)create dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"create"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10008E09C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_create) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  create = self->_create;
  if (create) {
    [a3 setCreate:create];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(TASKResponse *)self->_create copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    create = self->_create;
    if ((unint64_t)create | v4[1]) {
      unsigned __int8 v6 = -[TASKResponse isEqual:](create, "isEqual:");
    }
    else {
      unsigned __int8 v6 = 1;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(TASKResponse *)self->_create hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  create = self->_create;
  uint64_t v6 = v4[1];
  if (create)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_super v7 = v4;
    create = (TASKResponse *)-[TASKResponse mergeFrom:](create, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_super v7 = v4;
    create = (TASKResponse *)-[TASKControlResponse setCreate:](self, "setCreate:");
  }
  v4 = v7;
LABEL_7:
  _objc_release_x1(create, v4);
}

- (TASKResponse)create
{
  return self->_create;
}

- (void)setCreate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end