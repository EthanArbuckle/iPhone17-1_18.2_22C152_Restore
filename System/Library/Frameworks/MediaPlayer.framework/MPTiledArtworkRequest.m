@interface MPTiledArtworkRequest
- (BOOL)allowsSynchronousArtworkCatalogsBlockExecution;
- (BOOL)hasExistingArtworkCatalogsWithCount:(int64_t)a3;
- (MPTiledArtworkRequest)init;
- (NSCopying)entityIdentifier;
- (NSCopying)namespaceIdentifier;
- (NSCopying)revisionIdentifier;
- (double)tileSpacing;
- (id)artworkCatalogsBlock;
- (id)artworkCatalogsWithCount:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)existingArtworkCatalogsWithCount:(int64_t)a3;
- (unint64_t)numberOfColumns;
- (unint64_t)numberOfRows;
- (void)setAllowsSynchronousArtworkCatalogsBlockExecution:(BOOL)a3;
- (void)setArtworkCatalogsBlock:(id)a3;
- (void)setEntityIdentifier:(id)a3;
- (void)setNamespaceIdentifier:(id)a3;
- (void)setNumberOfColumns:(unint64_t)a3;
- (void)setNumberOfRows:(unint64_t)a3;
- (void)setRevisionIdentifier:(id)a3;
- (void)setTileSpacing:(double)a3;
@end

@implementation MPTiledArtworkRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revisionIdentifier, 0);
  objc_storeStrong((id *)&self->_namespaceIdentifier, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong(&self->_artworkCatalogsBlock, 0);

  objc_storeStrong((id *)&self->_artworkCatalogsCache, 0);
}

- (void)setRevisionIdentifier:(id)a3
{
}

- (NSCopying)revisionIdentifier
{
  return self->_revisionIdentifier;
}

- (void)setNamespaceIdentifier:(id)a3
{
}

- (NSCopying)namespaceIdentifier
{
  return self->_namespaceIdentifier;
}

- (void)setEntityIdentifier:(id)a3
{
}

- (NSCopying)entityIdentifier
{
  return self->_entityIdentifier;
}

- (void)setTileSpacing:(double)a3
{
  self->_tileSpacing = a3;
}

- (double)tileSpacing
{
  return self->_tileSpacing;
}

- (void)setNumberOfRows:(unint64_t)a3
{
  self->_numberOfRows = a3;
}

- (unint64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (void)setNumberOfColumns:(unint64_t)a3
{
  self->_numberOfColumns = a3;
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (void)setAllowsSynchronousArtworkCatalogsBlockExecution:(BOOL)a3
{
  self->_allowsSynchronousArtworkCatalogsBlockExecution = a3;
}

- (BOOL)allowsSynchronousArtworkCatalogsBlockExecution
{
  return self->_allowsSynchronousArtworkCatalogsBlockExecution;
}

- (void)setArtworkCatalogsBlock:(id)a3
{
}

- (id)artworkCatalogsBlock
{
  return self->_artworkCatalogsBlock;
}

- (BOOL)hasExistingArtworkCatalogsWithCount:(int64_t)a3
{
  if ([(MPTiledArtworkRequest *)self allowsSynchronousArtworkCatalogsBlockExecution])
  {
    return 1;
  }
  os_unfair_lock_lock(&self->_cacheLock);
  BOOL v5 = self->_artworkCatalogsCacheCount >= a3;
  os_unfair_lock_unlock(&self->_cacheLock);
  return v5;
}

- (id)existingArtworkCatalogsWithCount:(int64_t)a3
{
  if ([(MPTiledArtworkRequest *)self allowsSynchronousArtworkCatalogsBlockExecution])
  {
    BOOL v5 = [(MPTiledArtworkRequest *)self artworkCatalogsWithCount:a3];
  }
  else
  {
    p_cacheLock = &self->_cacheLock;
    os_unfair_lock_lock(&self->_cacheLock);
    artworkCatalogsCache = self->_artworkCatalogsCache;
    unint64_t v8 = [(NSArray *)artworkCatalogsCache count];
    if (v8 >= a3) {
      int64_t v9 = a3;
    }
    else {
      int64_t v9 = v8;
    }
    BOOL v5 = -[NSArray subarrayWithRange:](artworkCatalogsCache, "subarrayWithRange:", 0, v9);
    os_unfair_lock_unlock(p_cacheLock);
  }

  return v5;
}

- (id)artworkCatalogsWithCount:(unint64_t)a3
{
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  if (self->_artworkCatalogsCacheCount >= a3)
  {
    artworkCatalogsCache = self->_artworkCatalogsCache;
    unint64_t v13 = [(NSArray *)artworkCatalogsCache count];
    if (v13 >= a3) {
      unint64_t v14 = a3;
    }
    else {
      unint64_t v14 = v13;
    }
    uint64_t v11 = -[NSArray subarrayWithRange:](artworkCatalogsCache, "subarrayWithRange:", 0, v14);
LABEL_10:
    v15 = (void *)v11;
    goto LABEL_12;
  }
  artworkCatalogsBlock = (void (**)(id, unint64_t))self->_artworkCatalogsBlock;
  if (artworkCatalogsBlock)
  {
    artworkCatalogsBlock[2](artworkCatalogsBlock, a3);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    unint64_t v8 = self->_artworkCatalogsCache;
    self->_artworkCatalogsCache = v7;

    int64_t v9 = self->_artworkCatalogsCache;
    unint64_t artworkCatalogsCacheCount = self->_artworkCatalogsCacheCount;
    if (artworkCatalogsCacheCount <= a3) {
      unint64_t artworkCatalogsCacheCount = a3;
    }
    self->_unint64_t artworkCatalogsCacheCount = artworkCatalogsCacheCount;
    uint64_t v11 = [(NSArray *)v9 copy];
    goto LABEL_10;
  }
  v15 = 0;
LABEL_12:
  os_unfair_lock_unlock(p_cacheLock);

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_alloc_init(MPTiledArtworkRequest);
  if (v5)
  {
    uint64_t v6 = [self->_artworkCatalogsBlock copy];
    id artworkCatalogsBlock = v5->_artworkCatalogsBlock;
    v5->_id artworkCatalogsBlock = (id)v6;

    v5->_allowsSynchronousArtworkCatalogsBlockExecution = self->_allowsSynchronousArtworkCatalogsBlockExecution;
    v5->_numberOfColumns = self->_numberOfColumns;
    v5->_numberOfRows = self->_numberOfRows;
    v5->_tileSpacing = self->_tileSpacing;
    uint64_t v8 = [(NSCopying *)self->_entityIdentifier copyWithZone:a3];
    entityIdentifier = v5->_entityIdentifier;
    v5->_entityIdentifier = (NSCopying *)v8;

    uint64_t v10 = [(NSCopying *)self->_namespaceIdentifier copyWithZone:a3];
    namespaceIdentifier = v5->_namespaceIdentifier;
    v5->_namespaceIdentifier = (NSCopying *)v10;

    uint64_t v12 = [(NSCopying *)self->_revisionIdentifier copyWithZone:a3];
    revisionIdentifier = v5->_revisionIdentifier;
    v5->_revisionIdentifier = (NSCopying *)v12;
  }
  return v5;
}

- (MPTiledArtworkRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)MPTiledArtworkRequest;
  result = [(MPTiledArtworkRequest *)&v3 init];
  if (result) {
    result->_cacheLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

@end