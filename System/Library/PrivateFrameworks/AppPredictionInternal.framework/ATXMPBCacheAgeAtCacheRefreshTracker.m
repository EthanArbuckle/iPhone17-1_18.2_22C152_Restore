@interface ATXMPBCacheAgeAtCacheRefreshTracker
- (BOOL)hasAbGroup;
- (BOOL)hasCacheAge;
- (BOOL)hasCacheName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)abGroup;
- (NSString)cacheName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)cacheAge;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbGroup:(id)a3;
- (void)setCacheAge:(unsigned int)a3;
- (void)setCacheName:(id)a3;
- (void)setHasCacheAge:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXMPBCacheAgeAtCacheRefreshTracker

- (BOOL)hasCacheName
{
  return self->_cacheName != 0;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
}

- (void)setCacheAge:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cacheAge = a3;
}

- (void)setHasCacheAge:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCacheAge
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXMPBCacheAgeAtCacheRefreshTracker;
  v4 = [(ATXMPBCacheAgeAtCacheRefreshTracker *)&v8 description];
  v5 = [(ATXMPBCacheAgeAtCacheRefreshTracker *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  cacheName = self->_cacheName;
  if (cacheName) {
    [v3 setObject:cacheName forKey:@"cacheName"];
  }
  abGroup = self->_abGroup;
  if (abGroup) {
    [v4 setObject:abGroup forKey:@"abGroup"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_cacheAge];
    [v4 setObject:v7 forKey:@"cacheAge"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBCacheAgeAtCacheRefreshTrackerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_cacheName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_abGroup)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_cacheName)
  {
    objc_msgSend(v4, "setCacheName:");
    id v4 = v5;
  }
  if (self->_abGroup)
  {
    objc_msgSend(v5, "setAbGroup:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_cacheAge;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_cacheName copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_abGroup copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_cacheAge;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  cacheName = self->_cacheName;
  if ((unint64_t)cacheName | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](cacheName, "isEqual:")) {
      goto LABEL_10;
    }
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](abGroup, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) != 0 && self->_cacheAge == *((_DWORD *)v4 + 4))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_cacheName hash];
  NSUInteger v4 = [(NSString *)self->_abGroup hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_cacheAge;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (unsigned int *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[ATXMPBCacheAgeAtCacheRefreshTracker setCacheName:](self, "setCacheName:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[ATXMPBCacheAgeAtCacheRefreshTracker setAbGroup:](self, "setAbGroup:");
    NSUInteger v4 = v5;
  }
  if (v4[8])
  {
    self->_cacheAge = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)cacheName
{
  return self->_cacheName;
}

- (void)setCacheName:(id)a3
{
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void)setAbGroup:(id)a3
{
}

- (unsigned)cacheAge
{
  return self->_cacheAge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheName, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end