@interface SYLogErrorInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSError)cocoaError;
- (NSString)domain;
- (SYLogErrorInfo)initWithCocoaError:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)code;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCode:(int64_t)a3;
- (void)setDomain:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SYLogErrorInfo

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SYLogErrorInfo;
  v4 = [(SYLogErrorInfo *)&v8 description];
  v5 = [(SYLogErrorInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  domain = self->_domain;
  if (domain) {
    [v3 setObject:domain forKey:@"domain"];
  }
  v6 = [NSNumber numberWithLongLong:self->_code];
  [v4 setObject:v6 forKey:@"code"];

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SYLogErrorInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_domain) {
    -[SYLogErrorInfo writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt64Field();
}

- (void)copyTo:(id)a3
{
  domain = self->_domain;
  id v5 = a3;
  [v5 setDomain:domain];
  v5[1] = self->_code;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_domain copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  v5[1] = self->_code;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = [v4 isMemberOfClass:objc_opt_class()]
    && ((domain = self->_domain, !((unint64_t)domain | v4[2]))
     || -[NSString isEqual:](domain, "isEqual:"))
    && self->_code == v4[1];

  return v6;
}

- (unint64_t)hash
{
  return (2654435761 * self->_code) ^ [(NSString *)self->_domain hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = (int64_t *)a3;
  if (v4[2])
  {
    id v5 = v4;
    -[SYLogErrorInfo setDomain:](self, "setDomain:");
    id v4 = v5;
  }
  self->_code = v4[1];
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (int64_t)code
{
  return self->_code;
}

- (void)setCode:(int64_t)a3
{
  self->_code = a3;
}

- (void).cxx_destruct
{
}

- (SYLogErrorInfo)initWithCocoaError:(id)a3
{
  id v4 = a3;
  if (v4
    && (v8.receiver = self,
        v8.super_class = (Class)SYLogErrorInfo,
        (self = [(SYLogErrorInfo *)&v8 init]) != 0))
  {
    id v5 = [v4 domain];
    [(SYLogErrorInfo *)self setDomain:v5];

    -[SYLogErrorInfo setCode:](self, "setCode:", [v4 code]);
    self = self;
    BOOL v6 = self;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (NSError)cocoaError
{
  id v3 = objc_alloc(MEMORY[0x263F087E8]);
  id v4 = [(SYLogErrorInfo *)self domain];
  id v5 = objc_msgSend(v3, "initWithDomain:code:userInfo:", v4, -[SYLogErrorInfo code](self, "code"), 0);

  return (NSError *)v5;
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYLogErrorInfo writeTo:]", "SYLogErrorInfo.m", 79, "nil != self->_domain");
}

@end