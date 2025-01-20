@interface ATXMPBCacheAgeAtEngagementTracker
- (BOOL)hasAbGroup;
- (BOOL)hasCacheName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)abGroup;
- (NSString)cacheName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbGroup:(id)a3;
- (void)setCacheName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXMPBCacheAgeAtEngagementTracker

- (BOOL)hasCacheName
{
  return self->_cacheName != 0;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXMPBCacheAgeAtEngagementTracker;
  v4 = [(ATXMPBCacheAgeAtEngagementTracker *)&v8 description];
  v5 = [(ATXMPBCacheAgeAtEngagementTracker *)self dictionaryRepresentation];
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
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBCacheAgeAtEngagementTrackerReadFrom((uint64_t)self, (uint64_t)a3);
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
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_cacheName copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_abGroup copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((cacheName = self->_cacheName, !((unint64_t)cacheName | v4[2]))
     || -[NSString isEqual:](cacheName, "isEqual:")))
  {
    abGroup = self->_abGroup;
    if ((unint64_t)abGroup | v4[1]) {
      char v7 = -[NSString isEqual:](abGroup, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_cacheName hash];
  return [(NSString *)self->_abGroup hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[ATXMPBCacheAgeAtEngagementTracker setCacheName:](self, "setCacheName:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[ATXMPBCacheAgeAtEngagementTracker setAbGroup:](self, "setAbGroup:");
    id v4 = v5;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheName, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end