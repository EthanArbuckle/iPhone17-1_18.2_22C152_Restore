@interface SGM2CNtoSGContactsCacheHit
- (BOOL)cacheHit;
- (BOOL)hasCacheHit;
- (BOOL)hasKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCacheHit:(BOOL)a3;
- (void)setHasCacheHit:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGM2CNtoSGContactsCacheHit

- (void).cxx_destruct
{
}

- (BOOL)cacheHit
{
  return self->_cacheHit;
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  v4 = (BOOL *)a3;
  if (*((void *)v4 + 1))
  {
    v5 = v4;
    -[SGM2CNtoSGContactsCacheHit setKey:](self, "setKey:");
    v4 = v5;
  }
  if (v4[20])
  {
    self->_cacheHit = v4[16];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_cacheHit;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_6;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0)
    {
LABEL_6:
      BOOL v6 = 0;
      goto LABEL_7;
    }
    if (self->_cacheHit)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_6;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_6;
    }
    BOOL v6 = 1;
  }
LABEL_7:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 16) = self->_cacheHit;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_key)
  {
    uint64_t v5 = v4;
    objc_msgSend(v4, "setKey:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[16] = self->_cacheHit;
    v4[20] |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SGM2CNtoSGContactsCacheHitReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = [NSNumber numberWithBool:self->_cacheHit];
    [v4 setObject:v6 forKey:@"cacheHit"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGM2CNtoSGContactsCacheHit;
  id v4 = [(SGM2CNtoSGContactsCacheHit *)&v8 description];
  id v5 = [(SGM2CNtoSGContactsCacheHit *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasCacheHit
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasCacheHit:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setCacheHit:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cacheHit = a3;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (NSString)key
{
  if (self->_key) {
    return self->_key;
  }
  else {
    return (NSString *)@"CNtoSGContactsCacheHit";
  }
}

@end