@interface NWPBHostEndpoint
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NWPBHostEndpoint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_port, 0);

  objc_storeStrong((id *)&self->_hostname, 0);
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_hostname hash];
  return [(NSString *)self->_port hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((hostname = self->_hostname, !((unint64_t)hostname | v4[1]))
     || -[NSString isEqual:](hostname, "isEqual:")))
  {
    port = self->_port;
    if ((unint64_t)port | v4[2]) {
      char v7 = -[NSString isEqual:](port, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_hostname copyWithZone:a3];
  char v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_port copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hostname)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_port)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return NWPBHostEndpointReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  hostname = self->_hostname;
  if (hostname) {
    [v3 setObject:hostname forKey:@"hostname"];
  }
  port = self->_port;
  if (port) {
    [v4 setObject:port forKey:@"port"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NWPBHostEndpoint;
  id v4 = [(NWPBHostEndpoint *)&v8 description];
  id v5 = [(NWPBHostEndpoint *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end