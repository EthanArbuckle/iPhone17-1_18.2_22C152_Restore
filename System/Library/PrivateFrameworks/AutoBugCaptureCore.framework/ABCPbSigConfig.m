@interface ABCPbSigConfig
- (BOOL)hasDomain;
- (BOOL)hasSubtype;
- (BOOL)hasSubtypeContext;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)domain;
- (NSString)subtype;
- (NSString)subtypeContext;
- (NSString)type;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDomain:(id)a3;
- (void)setSubtype:(id)a3;
- (void)setSubtypeContext:(id)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ABCPbSigConfig

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (BOOL)hasType
{
  return self->_type != 0;
}

- (BOOL)hasSubtype
{
  return self->_subtype != 0;
}

- (BOOL)hasSubtypeContext
{
  return self->_subtypeContext != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ABCPbSigConfig;
  v4 = [(ABCPbSigConfig *)&v8 description];
  v5 = [(ABCPbSigConfig *)self dictionaryRepresentation];
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
  type = self->_type;
  if (type) {
    [v4 setObject:type forKey:@"type"];
  }
  subtype = self->_subtype;
  if (subtype) {
    [v4 setObject:subtype forKey:@"subtype"];
  }
  subtypeContext = self->_subtypeContext;
  if (subtypeContext) {
    [v4 setObject:subtypeContext forKey:@"subtype_context"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ABCPbSigConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_domain)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_type)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_subtype)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_subtypeContext)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_domain)
  {
    objc_msgSend(v4, "setDomain:");
    id v4 = v5;
  }
  if (self->_type)
  {
    objc_msgSend(v5, "setType:");
    id v4 = v5;
  }
  if (self->_subtype)
  {
    objc_msgSend(v5, "setSubtype:");
    id v4 = v5;
  }
  if (self->_subtypeContext)
  {
    objc_msgSend(v5, "setSubtypeContext:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_domain copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_type copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  uint64_t v10 = [(NSString *)self->_subtype copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  uint64_t v12 = [(NSString *)self->_subtypeContext copyWithZone:a3];
  v13 = (void *)v5[3];
  v5[3] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((domain = self->_domain, !((unint64_t)domain | v4[1]))
     || -[NSString isEqual:](domain, "isEqual:"))
    && ((type = self->_type, !((unint64_t)type | v4[4])) || -[NSString isEqual:](type, "isEqual:"))
    && ((subtype = self->_subtype, !((unint64_t)subtype | v4[2]))
     || -[NSString isEqual:](subtype, "isEqual:")))
  {
    subtypeContext = self->_subtypeContext;
    if ((unint64_t)subtypeContext | v4[3]) {
      char v9 = -[NSString isEqual:](subtypeContext, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_domain hash];
  NSUInteger v4 = [(NSString *)self->_type hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_subtype hash];
  return v4 ^ v5 ^ [(NSString *)self->_subtypeContext hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[1]) {
    -[ABCPbSigConfig setDomain:](self, "setDomain:");
  }
  if (v4[4]) {
    -[ABCPbSigConfig setType:](self, "setType:");
  }
  if (v4[2]) {
    -[ABCPbSigConfig setSubtype:](self, "setSubtype:");
  }
  if (v4[3]) {
    -[ABCPbSigConfig setSubtypeContext:](self, "setSubtypeContext:");
  }
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(id)a3
{
}

- (NSString)subtypeContext
{
  return self->_subtypeContext;
}

- (void)setSubtypeContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_subtypeContext, 0);
  objc_storeStrong((id *)&self->_subtype, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

@end