@interface TASKControlRequest
- (BOOL)hasCreate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (TASKRequest)create;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCreate:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TASKControlRequest

- (BOOL)hasCreate
{
  return self->_create != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)TASKControlRequest;
  v3 = [(TASKControlRequest *)&v7 description];
  v4 = [(TASKControlRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  create = self->_create;
  if (create)
  {
    v5 = [(TASKRequest *)create dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"create"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10003B2F0((uint64_t)self, (uint64_t)a3);
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
  id v6 = [(TASKRequest *)self->_create copyWithZone:a3];
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
      unsigned __int8 v6 = -[TASKRequest isEqual:](create, "isEqual:");
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
  return [(TASKRequest *)self->_create hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  create = self->_create;
  uint64_t v6 = v4[1];
  if (create)
  {
    if (v6) {
      -[TASKRequest mergeFrom:](create, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[TASKControlRequest setCreate:](self, "setCreate:");
  }
  _objc_release_x1();
}

- (TASKRequest)create
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