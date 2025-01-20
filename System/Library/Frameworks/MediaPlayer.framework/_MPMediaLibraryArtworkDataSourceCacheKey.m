@interface _MPMediaLibraryArtworkDataSourceCacheKey
- (BOOL)isEqual:(id)a3;
- (CGSize)representationSize;
- (_MPMediaLibraryArtworkDataSourceCacheKey)initWithArtworkCatalog:(id)a3 representativeSize:(CGSize)a4;
- (id)catalogIdentifier;
- (unint64_t)hash;
- (void)setCatalogIdentifier:(id)a3;
- (void)setRepresentationSize:(CGSize)a3;
@end

@implementation _MPMediaLibraryArtworkDataSourceCacheKey

- (void).cxx_destruct
{
}

- (_MPMediaLibraryArtworkDataSourceCacheKey)initWithArtworkCatalog:(id)a3 representativeSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_MPMediaLibraryArtworkDataSourceCacheKey;
  v8 = [(_MPMediaLibraryArtworkDataSourceCacheKey *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v7 visualIdenticalityIdentifier];
    id catalogIdentifier = v8->_catalogIdentifier;
    v8->_id catalogIdentifier = (id)v9;

    v8->_representationSize.CGFloat width = width;
    v8->_representationSize.CGFloat height = height;
  }

  return v8;
}

- (void)setRepresentationSize:(CGSize)a3
{
  self->_representationSize = a3;
}

- (CGSize)representationSize
{
  double width = self->_representationSize.width;
  double height = self->_representationSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCatalogIdentifier:(id)a3
{
}

- (id)catalogIdentifier
{
  return self->_catalogIdentifier;
}

- (unint64_t)hash
{
  v3 = [(_MPMediaLibraryArtworkDataSourceCacheKey *)self catalogIdentifier];
  uint64_t v4 = [v3 hash];
  [(_MPMediaLibraryArtworkDataSourceCacheKey *)self representationSize];
  unint64_t v6 = v4 ^ (unint64_t)v5;
  [(_MPMediaLibraryArtworkDataSourceCacheKey *)self representationSize];
  unint64_t v8 = v6 ^ (unint64_t)v7;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [v5 catalogIdentifier];
    double v7 = [(_MPMediaLibraryArtworkDataSourceCacheKey *)self catalogIdentifier];
    char v8 = [v6 isEqual:v7];

    [v5 representationSize];
    double v10 = v9;
    double v12 = v11;

    [(_MPMediaLibraryArtworkDataSourceCacheKey *)self representationSize];
    if (v10 == v14) {
      BOOL v15 = v8;
    }
    else {
      BOOL v15 = 0;
    }
    BOOL v16 = v12 == v13 && v15;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

@end