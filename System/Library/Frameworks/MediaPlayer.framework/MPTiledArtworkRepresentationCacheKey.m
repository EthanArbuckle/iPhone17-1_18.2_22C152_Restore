@interface MPTiledArtworkRepresentationCacheKey
- (BOOL)isEqual:(id)a3;
- (MPTiledArtworkRepresentationCacheKey)init;
- (MPTiledArtworkRepresentationCacheKey)initWithTiledArtworkRequest:(id)a3 scaledFittingSize:(CGSize)a4;
- (NSString)description;
- (id)stringRepresentation;
- (unint64_t)hash;
@end

@implementation MPTiledArtworkRepresentationCacheKey

- (void).cxx_destruct
{
  objc_storeStrong(&self->_revisionIdentifier, 0);
  objc_storeStrong(&self->_namespaceIdentifier, 0);

  objc_storeStrong(&self->_entityIdentifier, 0);
}

- (id)stringRepresentation
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%lx", -[MPTiledArtworkRepresentationCacheKey hash](self, "hash"));
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MPTiledArtworkRepresentationCacheKey *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id entityIdentifier = self->_entityIdentifier;
      BOOL v9 = (entityIdentifier == v5->_entityIdentifier || objc_msgSend(entityIdentifier, "isEqual:"))
        && ((id namespaceIdentifier = self->_namespaceIdentifier, namespaceIdentifier == v5->_namespaceIdentifier)
         || objc_msgSend(namespaceIdentifier, "isEqual:"))
        && self->_numberOfColumns == v5->_numberOfColumns
        && self->_numberOfRows == v5->_numberOfRows
        && ((id revisionIdentifier = self->_revisionIdentifier, revisionIdentifier == v5->_revisionIdentifier)
         || objc_msgSend(revisionIdentifier, "isEqual:"))
        && vabdd_f64(self->_scaledFittingSize.width, v5->_scaledFittingSize.width) < 0.00000011920929
        && vabdd_f64(self->_scaledFittingSize.height, v5->_scaledFittingSize.height) < 0.00000011920929
        && vabdd_f64(self->_tileSpacing, v5->_tileSpacing) < 0.00000011920929;
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [self->_entityIdentifier hash];
  unint64_t v4 = [self->_namespaceIdentifier hash]
     + v3
     + 100 * self->_numberOfColumns
     + 10000 * self->_numberOfRows;
  return v4
       + [self->_revisionIdentifier hash]
       + vcvtmd_u64_f64(self->_scaledFittingSize.width * 100.0)
       + vcvtmd_u64_f64(self->_scaledFittingSize.height * 100.0)
       + vcvtmd_u64_f64(self->_tileSpacing * 100.0);
}

- (NSString)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  unint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  if (self->_entityIdentifier)
  {
    if (self->_namespaceIdentifier)
    {
      [v6 appendFormat:@"; id entityIdentifier = %@", self->_entityIdentifier];
      [v6 appendFormat:@"; id namespaceIdentifier = %@", self->_namespaceIdentifier];
      if (self->_revisionIdentifier) {
        [v6 appendFormat:@"; id revisionIdentifier = %@", self->_revisionIdentifier];
      }
    }
  }
  objc_msgSend(v6, "appendFormat:", @"; numberOfColumns = %lu", self->_numberOfColumns);
  objc_msgSend(v6, "appendFormat:", @"; numberOfRows = %lu", self->_numberOfRows);
  [v6 appendFormat:@"; tileSpacing = %.2f", *(void *)&self->_tileSpacing];
  v7 = NSStringFromCGSize(self->_scaledFittingSize);
  [v6 appendFormat:@"; scaledFittingSize = %@", v7];

  [v6 appendString:@">"];

  return (NSString *)v6;
}

- (MPTiledArtworkRepresentationCacheKey)initWithTiledArtworkRequest:(id)a3 scaledFittingSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MPTiledArtworkRepresentationCacheKey;
  v8 = [(MPTiledArtworkRepresentationCacheKey *)&v17 init];
  if (v8)
  {
    uint64_t v9 = [v7 entityIdentifier];
    id entityIdentifier = v8->_entityIdentifier;
    v8->_id entityIdentifier = (id)v9;

    uint64_t v11 = [v7 namespaceIdentifier];
    id namespaceIdentifier = v8->_namespaceIdentifier;
    v8->_id namespaceIdentifier = (id)v11;

    v8->_numberOfColumns = [v7 numberOfColumns];
    v8->_numberOfRows = [v7 numberOfRows];
    uint64_t v13 = [v7 revisionIdentifier];
    id revisionIdentifier = v8->_revisionIdentifier;
    v8->_id revisionIdentifier = (id)v13;

    [v7 tileSpacing];
    v8->_scaledFittingSize.CGFloat height = height;
    v8->_tileSpacing = v15;
    v8->_scaledFittingSize.CGFloat width = width;
  }

  return v8;
}

- (MPTiledArtworkRepresentationCacheKey)init
{
  return -[MPTiledArtworkRepresentationCacheKey initWithTiledArtworkRequest:scaledFittingSize:](self, "initWithTiledArtworkRequest:scaledFittingSize:", 0, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

@end