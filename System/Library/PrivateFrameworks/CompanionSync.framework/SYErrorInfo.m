@interface SYErrorInfo
+ (void)initialize;
- (BOOL)hasUserInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)userInfo;
- (NSString)domain;
- (SYErrorInfo)initWithError:(id)a3;
- (id)_usefulDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)code;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCode:(int)a3;
- (void)setDomain:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SYErrorInfo

- (BOOL)hasUserInfo
{
  return self->_userInfo != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SYErrorInfo;
  v4 = [(SYErrorInfo *)&v8 description];
  v5 = [(SYErrorInfo *)self dictionaryRepresentation];
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
  v6 = [NSNumber numberWithInt:self->_code];
  [v4 setObject:v6 forKey:@"code"];

  userInfo = self->_userInfo;
  if (userInfo) {
    [v4 setObject:userInfo forKey:@"userInfo"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SYErrorInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_domain) {
    -[SYErrorInfo writeTo:]();
  }
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
  if (self->_userInfo) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  v5 = a3;
  [v5 setDomain:self->_domain];
  id v4 = v5;
  v5[2] = self->_code;
  if (self->_userInfo)
  {
    objc_msgSend(v5, "setUserInfo:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_domain copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  *(_DWORD *)(v5 + 8) = self->_code;
  uint64_t v8 = [(NSData *)self->_userInfo copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((domain = self->_domain, !((unint64_t)domain | v4[2]))
     || -[NSString isEqual:](domain, "isEqual:"))
    && self->_code == *((_DWORD *)v4 + 2))
  {
    userInfo = self->_userInfo;
    if ((unint64_t)userInfo | v4[3]) {
      char v7 = -[NSData isEqual:](userInfo, "isEqual:");
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

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_domain hash];
  uint64_t v4 = 2654435761 * self->_code;
  return v4 ^ v3 ^ [(NSData *)self->_userInfo hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[SYErrorInfo setDomain:](self, "setDomain:");
    uint64_t v4 = v5;
  }
  self->_code = v4[2];
  if (*((void *)v4 + 3))
  {
    -[SYErrorInfo setUserInfo:](self, "setUserInfo:");
    uint64_t v4 = v5;
  }
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (int)code
{
  return self->_code;
}

- (void)setCode:(int)a3
{
  self->_code = a3;
}

- (NSData)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    InstanceMethod = class_getInstanceMethod((Class)a1, sel_description);
    uint64_t v4 = class_getInstanceMethod((Class)a1, sel__usefulDescription);
    if (InstanceMethod && v4 != 0)
    {
      method_exchangeImplementations(InstanceMethod, v4);
    }
  }
}

- (SYErrorInfo)initWithError:(id)a3
{
  id v4 = a3;
  if (v4
    && (v12.receiver = self,
        v12.super_class = (Class)SYErrorInfo,
        (self = [(SYErrorInfo *)&v12 init]) != 0))
  {
    uint64_t v5 = [v4 domain];
    [(SYErrorInfo *)self setDomain:v5];

    -[SYErrorInfo setCode:](self, "setCode:", [v4 code]);
    uint64_t v6 = [v4 userInfo];

    if (v6)
    {
      char v7 = (void *)MEMORY[0x263F08910];
      uint64_t v8 = [v4 userInfo];
      v9 = [v7 archivedDataWithRootObject:v8 requiringSecureCoding:1 error:0];
      [(SYErrorInfo *)self setUserInfo:v9];
    }
    self = self;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_usefulDescription
{
  NSUInteger v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)SYErrorInfo;
  id v4 = [(SYErrorInfo *)&v13 description];
  uint64_t v5 = [(SYErrorInfo *)self domain];
  uint64_t v6 = [(SYErrorInfo *)self code];
  char v7 = [(SYErrorInfo *)self userInfo];
  if (v7)
  {
    uint64_t v8 = (void *)MEMORY[0x263F08928];
    v9 = [(SYErrorInfo *)self userInfo];
    v10 = objc_msgSend(v8, "sy_unarchivedObjectFromData:", v9);
    v11 = [v3 stringWithFormat:@"%@: domain=%@, code=%ld, userInfo=%@", v4, v5, v6, v10];
  }
  else
  {
    v11 = [v3 stringWithFormat:@"%@: domain=%@, code=%ld, userInfo=%@", v4, v5, v6, @"(nil)"];
  }

  return v11;
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYErrorInfo writeTo:]", "SYErrorInfo.m", 94, "nil != self->_domain");
}

@end