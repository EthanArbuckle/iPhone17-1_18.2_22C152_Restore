@interface SPProtoCacheSyncData
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)cacheIdentifier;
- (SPProtoCacheAssets)permanentCache;
- (SPProtoCacheAssets)transientCache;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCacheIdentifier:(id)a3;
- (void)setPermanentCache:(id)a3;
- (void)setTransientCache:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SPProtoCacheSyncData

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SPProtoCacheSyncData;
  v3 = [(SPProtoCacheSyncData *)&v7 description];
  v4 = [(SPProtoCacheSyncData *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  cacheIdentifier = self->_cacheIdentifier;
  if (cacheIdentifier) {
    [v3 setObject:cacheIdentifier forKey:@"cacheIdentifier"];
  }
  permanentCache = self->_permanentCache;
  if (permanentCache)
  {
    objc_super v7 = [(SPProtoCacheAssets *)permanentCache dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"permanentCache"];
  }
  transientCache = self->_transientCache;
  if (transientCache)
  {
    v9 = [(SPProtoCacheAssets *)transientCache dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"transientCache"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SPProtoCacheSyncDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteStringField();
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  cacheIdentifier = self->_cacheIdentifier;
  id v5 = a3;
  [v5 setCacheIdentifier:cacheIdentifier];
  [v5 setPermanentCache:self->_permanentCache];
  [v5 setTransientCache:self->_transientCache];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_cacheIdentifier copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(SPProtoCacheAssets *)self->_permanentCache copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(SPProtoCacheAssets *)self->_transientCache copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((cacheIdentifier = self->_cacheIdentifier, !((unint64_t)cacheIdentifier | v4[1]))
     || -[NSString isEqual:](cacheIdentifier, "isEqual:"))
    && ((permanentCache = self->_permanentCache, !((unint64_t)permanentCache | v4[2]))
     || -[SPProtoCacheAssets isEqual:](permanentCache, "isEqual:")))
  {
    transientCache = self->_transientCache;
    if ((unint64_t)transientCache | v4[3]) {
      unsigned __int8 v8 = -[SPProtoCacheAssets isEqual:](transientCache, "isEqual:");
    }
    else {
      unsigned __int8 v8 = 1;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_cacheIdentifier hash];
  unint64_t v4 = [(SPProtoCacheAssets *)self->_permanentCache hash] ^ v3;
  return v4 ^ [(SPProtoCacheAssets *)self->_transientCache hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  v9 = v4;
  if (v4[1])
  {
    -[SPProtoCacheSyncData setCacheIdentifier:](self, "setCacheIdentifier:");
    unint64_t v4 = v9;
  }
  permanentCache = self->_permanentCache;
  uint64_t v6 = v4[2];
  if (permanentCache)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[SPProtoCacheAssets mergeFrom:](permanentCache, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[SPProtoCacheSyncData setPermanentCache:](self, "setPermanentCache:");
  }
  unint64_t v4 = v9;
LABEL_9:
  transientCache = self->_transientCache;
  uint64_t v8 = v4[3];
  if (transientCache)
  {
    if (v8) {
      -[SPProtoCacheAssets mergeFrom:](transientCache, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[SPProtoCacheSyncData setTransientCache:](self, "setTransientCache:");
  }

  _objc_release_x1();
}

- (NSString)cacheIdentifier
{
  return self->_cacheIdentifier;
}

- (void)setCacheIdentifier:(id)a3
{
}

- (SPProtoCacheAssets)permanentCache
{
  return self->_permanentCache;
}

- (void)setPermanentCache:(id)a3
{
}

- (SPProtoCacheAssets)transientCache
{
  return self->_transientCache;
}

- (void)setTransientCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transientCache, 0);
  objc_storeStrong((id *)&self->_permanentCache, 0);

  objc_storeStrong((id *)&self->_cacheIdentifier, 0);
}

@end