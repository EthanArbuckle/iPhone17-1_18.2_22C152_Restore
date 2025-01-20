@interface ATPError
- (BOOL)hasCode;
- (BOOL)hasDomain;
- (BOOL)hasDomainCode;
- (BOOL)hasErrorDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)domain;
- (NSString)errorDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)code;
- (int64_t)domainCode;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCode:(int)a3;
- (void)setDomain:(id)a3;
- (void)setDomainCode:(int64_t)a3;
- (void)setErrorDescription:(id)a3;
- (void)setHasCode:(BOOL)a3;
- (void)setHasDomainCode:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATPError

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDescription, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

- (void)setErrorDescription:(id)a3
{
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (int)code
{
  return self->_code;
}

- (int64_t)domainCode
{
  return self->_domainCode;
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
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[ATPError setDomain:](self, "setDomain:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 40);
  if (v5)
  {
    self->_domainCode = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 40);
  }
  if ((v5 & 2) != 0)
  {
    self->_code = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 4))
  {
    -[ATPError setErrorDescription:](self, "setErrorDescription:");
    id v4 = v6;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_domain hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_domainCode;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5 ^ [(NSString *)self->_errorDescription hash];
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_code;
  return v4 ^ v3 ^ v5 ^ [(NSString *)self->_errorDescription hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  domain = self->_domain;
  if ((unint64_t)domain | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](domain, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_domainCode != *((void *)v4 + 1)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_16:
    char v7 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_code != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_16;
  }
  errorDescription = self->_errorDescription;
  if ((unint64_t)errorDescription | *((void *)v4 + 4)) {
    char v7 = -[NSString isEqual:](errorDescription, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_17:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_domain copyWithZone:a3];
  char v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_domainCode;
    *(unsigned char *)(v5 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_code;
    *(unsigned char *)(v5 + 40) |= 2u;
  }
  uint64_t v9 = [(NSString *)self->_errorDescription copyWithZone:a3];
  v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_domain)
  {
    objc_msgSend(v4, "setDomain:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_domainCode;
    *((unsigned char *)v4 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_code;
    *((unsigned char *)v4 + 40) |= 2u;
  }
  if (self->_errorDescription)
  {
    objc_msgSend(v6, "setErrorDescription:");
    id v4 = v6;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_domain)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_errorDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ATPErrorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  domain = self->_domain;
  if (domain) {
    [v3 setObject:domain forKey:@"domain"];
  }
  char has = (char)self->_has;
  if (has)
  {
    char v7 = [NSNumber numberWithLongLong:self->_domainCode];
    [v4 setObject:v7 forKey:@"domainCode"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v8 = [NSNumber numberWithInt:self->_code];
    [v4 setObject:v8 forKey:@"code"];
  }
  errorDescription = self->_errorDescription;
  if (errorDescription) {
    [v4 setObject:errorDescription forKey:@"errorDescription"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATPError;
  id v4 = [(ATPError *)&v8 description];
  uint64_t v5 = [(ATPError *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasErrorDescription
{
  return self->_errorDescription != 0;
}

- (BOOL)hasCode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasCode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setCode:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_code = a3;
}

- (BOOL)hasDomainCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasDomainCode:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setDomainCode:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_domainCode = a3;
}

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

@end