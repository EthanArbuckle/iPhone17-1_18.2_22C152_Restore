@interface HDCodableError
- (BOOL)hasCode;
- (BOOL)hasDomain;
- (BOOL)hasLocalizedDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)domain;
- (NSString)localizedDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)code;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCode:(int64_t)a3;
- (void)setDomain:(id)a3;
- (void)setHasCode:(BOOL)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableError

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (NSString)domain
{
  return self->_domain;
}

- (int64_t)code
{
  return self->_code;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

- (void)setDomain:(id)a3
{
}

- (void)setCode:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_code = a3;
}

- (void)setLocalizedDescription:(id)a3
{
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
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_localizedDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (void)setHasCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasLocalizedDescription
{
  return self->_localizedDescription != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableError;
  id v4 = [(HDCodableError *)&v8 description];
  id v5 = [(HDCodableError *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  domain = self->_domain;
  if (domain) {
    [v3 setObject:domain forKey:@"domain"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithLongLong:self->_code];
    [v4 setObject:v6 forKey:@"code"];
  }
  localizedDescription = self->_localizedDescription;
  if (localizedDescription) {
    [v4 setObject:localizedDescription forKey:@"localizedDescription"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableErrorReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_code;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  if (self->_localizedDescription)
  {
    objc_msgSend(v5, "setLocalizedDescription:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_domain copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_code;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_localizedDescription copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  domain = self->_domain;
  if ((unint64_t)domain | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](domain, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_code != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  localizedDescription = self->_localizedDescription;
  if ((unint64_t)localizedDescription | *((void *)v4 + 3)) {
    char v7 = -[NSString isEqual:](localizedDescription, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_domain hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_code;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSString *)self->_localizedDescription hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int64_t *)a3;
  uint64_t v5 = v4;
  if (v4[2])
  {
    -[HDCodableError setDomain:](self, "setDomain:");
    uint64_t v4 = v5;
  }
  if (v4[4])
  {
    self->_code = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v4[3])
  {
    -[HDCodableError setLocalizedDescription:](self, "setLocalizedDescription:");
    uint64_t v4 = v5;
  }
}

@end