@interface MTRPluginPBMError
- (BOOL)hasCode;
- (BOOL)hasDomain;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)readFrom:(id)a3;
- (MTRPluginPBMError)initWithError:(id)a3;
- (NSError)error;
- (NSString)domain;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)code;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCode:(unint64_t)a3;
- (void)setDomain:(id)a3;
- (void)setError:(id)a3;
- (void)setHasCode:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTRPluginPBMError

- (MTRPluginPBMError)initWithError:(id)a3
{
  id v4 = a3;
  if (v4 && (self = [(MTRPluginPBMError *)self init]) != 0)
  {
    -[MTRPluginPBMError setCode:](self, "setCode:", [v4 code]);
    v5 = [v4 domain];
    [(MTRPluginPBMError *)self setDomain:v5];

    self = self;
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setError:(id)a3
{
  id v4 = a3;
  -[MTRPluginPBMError setCode:](self, "setCode:", [v4 code]);
  id v5 = [v4 domain];

  [(MTRPluginPBMError *)self setDomain:v5];
}

- (NSError)error
{
  v3 = [(MTRPluginPBMError *)self domain];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x263F087E8];
    id v5 = [(MTRPluginPBMError *)self domain];
    v6 = objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, -[MTRPluginPBMError code](self, "code"), 0);
  }
  else
  {
    v6 = 0;
  }
  return (NSError *)v6;
}

- (BOOL)isValid
{
  BOOL v3 = [(MTRPluginPBMError *)self hasCode];
  if (v3)
  {
    LOBYTE(v3) = [(MTRPluginPBMError *)self hasDomain];
  }
  return v3;
}

- (void)setCode:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_code = a3;
}

- (void)setHasCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (id)description
{
  BOOL v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTRPluginPBMError;
  id v4 = [(MTRPluginPBMError *)&v8 description];
  id v5 = [(MTRPluginPBMError *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  BOOL v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedLongLong:self->_code];
    [v3 setObject:v4 forKey:@"code"];
  }
  domain = self->_domain;
  if (domain) {
    [v3 setObject:domain forKey:@"domain"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MTRPluginPBMErrorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_domain)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_code;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_domain)
  {
    id v5 = v4;
    objc_msgSend(v4, "setDomain:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_code;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_domain copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_code != *((void *)v4 + 1)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  domain = self->_domain;
  if ((unint64_t)domain | *((void *)v4 + 2)) {
    char v6 = -[NSString isEqual:](domain, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v2 = 2654435761u * self->_code;
  }
  else {
    unint64_t v2 = 0;
  }
  return [(NSString *)self->_domain hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[3])
  {
    self->_code = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v4[2])
  {
    uint64_t v5 = v4;
    -[MTRPluginPBMError setDomain:](self, "setDomain:");
    id v4 = v5;
  }
}

- (unint64_t)code
{
  return self->_code;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (void).cxx_destruct
{
}

@end