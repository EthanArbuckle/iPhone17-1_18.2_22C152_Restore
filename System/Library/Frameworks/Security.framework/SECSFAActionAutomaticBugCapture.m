@interface SECSFAActionAutomaticBugCapture
- (BOOL)hasDomain;
- (BOOL)hasSubtype;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)domain;
- (NSString)subtype;
- (NSString)type;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDomain:(id)a3;
- (void)setSubtype:(id)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECSFAActionAutomaticBugCapture

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_subtype, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

- (void)setSubtype:(id)a3
{
}

- (NSString)subtype
{
  return self->_subtype;
}

- (void)setType:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setDomain:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[1]) {
    -[SECSFAActionAutomaticBugCapture setDomain:](self, "setDomain:");
  }
  if (v4[3]) {
    -[SECSFAActionAutomaticBugCapture setType:](self, "setType:");
  }
  if (v4[2]) {
    -[SECSFAActionAutomaticBugCapture setSubtype:](self, "setSubtype:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_domain hash];
  NSUInteger v4 = [(NSString *)self->_type hash] ^ v3;
  return v4 ^ [(NSString *)self->_subtype hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((domain = self->_domain, !((unint64_t)domain | v4[1]))
     || -[NSString isEqual:](domain, "isEqual:"))
    && ((type = self->_type, !((unint64_t)type | v4[3])) || -[NSString isEqual:](type, "isEqual:")))
  {
    subtype = self->_subtype;
    if ((unint64_t)subtype | v4[2]) {
      char v8 = -[NSString isEqual:](subtype, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_domain copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_type copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_subtype copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
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
}

- (BOOL)readFrom:(id)a3
{
  return SECSFAActionAutomaticBugCaptureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
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

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SECSFAActionAutomaticBugCapture;
  id v4 = [(SECSFAActionAutomaticBugCapture *)&v8 description];
  id v5 = [(SECSFAActionAutomaticBugCapture *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasSubtype
{
  return self->_subtype != 0;
}

- (BOOL)hasType
{
  return self->_type != 0;
}

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

@end