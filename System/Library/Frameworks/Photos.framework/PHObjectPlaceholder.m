@interface PHObjectPlaceholder
- (BOOL)isEqual:(id)a3;
- (PHObjectPlaceholder)initWithLocalIdentifier:(id)a3;
- (id)localIdentifier;
- (id)photoLibrary;
- (int64_t)assetMediaType;
- (unint64_t)hash;
- (void)setAssetMediaType:(int64_t)a3;
@end

@implementation PHObjectPlaceholder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);

  objc_storeStrong((id *)&self->_localIdentifier, 0);
}

- (void)setAssetMediaType:(int64_t)a3
{
  self->_assetMediaType = a3;
}

- (int64_t)assetMediaType
{
  return self->_assetMediaType;
}

- (unint64_t)hash
{
  v2 = [(PHObjectPlaceholder *)self localIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PHObjectPlaceholder *)a3;
  if (self == v4)
  {
    char IsEqual = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(PHObjectPlaceholder *)self localIdentifier];
      v7 = [(PHObjectPlaceholder *)v5 localIdentifier];

      char IsEqual = PLObjectIsEqual();
    }
    else
    {
      char IsEqual = 0;
    }
  }

  return IsEqual;
}

- (id)photoLibrary
{
  return self->_photoLibrary;
}

- (id)localIdentifier
{
  return self->_localIdentifier;
}

- (PHObjectPlaceholder)initWithLocalIdentifier:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PHObjectPlaceholder;
  v5 = [(PHObjectPlaceholder *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    localIdentifier = v5->_localIdentifier;
    v5->_localIdentifier = (NSString *)v6;

    uint64_t v8 = +[PHObject uuidFromLocalIdentifier:v5->_localIdentifier];
    uuid = v5->super._uuid;
    v5->super._uuid = (NSString *)v8;

    uint64_t v10 = +[PHPhotoLibrary photoLibraryForCurrentTransaction];
    photoLibrary = v5->_photoLibrary;
    v5->_photoLibrary = (PHPhotoLibrary *)v10;
  }
  return v5;
}

@end