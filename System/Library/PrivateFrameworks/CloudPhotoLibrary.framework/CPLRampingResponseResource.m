@interface CPLRampingResponseResource
- (BOOL)allowed;
- (BOOL)hasAllowed;
- (BOOL)hasResource;
- (BOOL)hasRetryAfterMillis;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)resource;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)retryAfterMillis;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAllowed:(BOOL)a3;
- (void)setHasAllowed:(BOOL)a3;
- (void)setHasRetryAfterMillis:(BOOL)a3;
- (void)setResource:(id)a3;
- (void)setRetryAfterMillis:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CPLRampingResponseResource

- (void).cxx_destruct
{
}

- (int64_t)retryAfterMillis
{
  return self->_retryAfterMillis;
}

- (BOOL)allowed
{
  return self->_allowed;
}

- (void)setResource:(id)a3
{
}

- (NSString)resource
{
  return self->_resource;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 2))
  {
    id v6 = v4;
    -[CPLRampingResponseResource setResource:](self, "setResource:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 2) != 0)
  {
    self->_allowed = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 28);
  }
  if (v5)
  {
    self->_retryAfterMillis = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_resource hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_allowed;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_retryAfterMillis;
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  resource = self->_resource;
  if ((unint64_t)resource | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](resource, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) != 0)
    {
      if (self->_allowed)
      {
        if (!*((unsigned char *)v4 + 24)) {
          goto LABEL_16;
        }
        goto LABEL_12;
      }
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_12;
      }
    }
LABEL_16:
    BOOL v6 = 0;
    goto LABEL_17;
  }
  if ((*((unsigned char *)v4 + 28) & 2) != 0) {
    goto LABEL_16;
  }
LABEL_12:
  BOOL v6 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_retryAfterMillis != *((void *)v4 + 1)) {
      goto LABEL_16;
    }
    BOOL v6 = 1;
  }
LABEL_17:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_resource copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 24) = self->_allowed;
    *(unsigned char *)(v5 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 8) = self->_retryAfterMillis;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_resource)
  {
    id v6 = v4;
    objc_msgSend(v4, "setResource:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 24) = self->_allowed;
    *((unsigned char *)v4 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = self->_retryAfterMillis;
    *((unsigned char *)v4 + 28) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_resource)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return CPLRampingResponseResourceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  resource = self->_resource;
  if (resource) {
    [v3 setObject:resource forKey:@"resource"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = [NSNumber numberWithBool:self->_allowed];
    [v4 setObject:v7 forKey:@"allowed"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v8 = [NSNumber numberWithLongLong:self->_retryAfterMillis];
    [v4 setObject:v8 forKey:@"retryAfterMillis"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CPLRampingResponseResource;
  id v4 = [(CPLRampingResponseResource *)&v8 description];
  uint64_t v5 = [(CPLRampingResponseResource *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasRetryAfterMillis
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasRetryAfterMillis:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setRetryAfterMillis:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_retryAfterMillis = a3;
}

- (BOOL)hasAllowed
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasAllowed:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setAllowed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_allowed = a3;
}

- (BOOL)hasResource
{
  return self->_resource != 0;
}

@end