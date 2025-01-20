@interface TASKIPAddress
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)ipAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)ttl;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setIpAddress:(id)a3;
- (void)setTtl:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation TASKIPAddress

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)TASKIPAddress;
  v3 = [(TASKIPAddress *)&v7 description];
  v4 = [(TASKIPAddress *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  ipAddress = self->_ipAddress;
  if (ipAddress) {
    [v3 setObject:ipAddress forKey:@"ipAddress"];
  }
  v6 = +[NSNumber numberWithUnsignedInt:self->_ttl];
  [v4 setObject:v6 forKey:@"ttl"];

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000A8914((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteDataField();
  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  ipAddress = self->_ipAddress;
  v5 = a3;
  [v5 setIpAddress:ipAddress];
  v5[4] = self->_ttl;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSData *)self->_ipAddress copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  *((_DWORD *)v5 + 4) = self->_ttl;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = [v4 isMemberOfClass:objc_opt_class()]
    && ((ipAddress = self->_ipAddress, !((unint64_t)ipAddress | *((void *)v4 + 1)))
     || -[NSData isEqual:](ipAddress, "isEqual:"))
    && self->_ttl == *((_DWORD *)v4 + 4);

  return v6;
}

- (unint64_t)hash
{
  return (2654435761 * self->_ttl) ^ (unint64_t)[(NSData *)self->_ipAddress hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = (unsigned int *)a3;
  if (*((void *)v4 + 1))
  {
    v5 = v4;
    -[TASKIPAddress setIpAddress:](self, "setIpAddress:");
    id v4 = v5;
  }
  self->_ttl = v4[4];
}

- (NSData)ipAddress
{
  return self->_ipAddress;
}

- (void)setIpAddress:(id)a3
{
}

- (unsigned)ttl
{
  return self->_ttl;
}

- (void)setTtl:(unsigned int)a3
{
  self->_ttl = a3;
}

- (void).cxx_destruct
{
}

@end