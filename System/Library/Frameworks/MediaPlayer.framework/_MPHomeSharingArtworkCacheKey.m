@interface _MPHomeSharingArtworkCacheKey
- (BOOL)isEqual:(id)a3;
- (CGSize)size;
- (_MPHomeSharingArtworkCacheKey)initWithPersistentID:(unint64_t)a3 size:(CGSize)a4;
- (unint64_t)hash;
- (unint64_t)persistentID;
@end

@implementation _MPHomeSharingArtworkCacheKey

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)persistentID
{
  return self->_persistentID;
}

- (unint64_t)hash
{
  unint64_t persistentID = self->_persistentID;
  [(_MPHomeSharingArtworkCacheKey *)self size];
  unint64_t v5 = llround(v4) ^ persistentID;
  [(_MPHomeSharingArtworkCacheKey *)self size];
  return v5 ^ llround(v6);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 persistentID];
    unint64_t v7 = [(_MPHomeSharingArtworkCacheKey *)self persistentID];
    [v5 size];
    double v9 = v8;
    double v11 = v10;

    [(_MPHomeSharingArtworkCacheKey *)self size];
    BOOL v15 = v9 == v13 && v6 == v7;
    BOOL v16 = v11 == v12 && v15;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (_MPHomeSharingArtworkCacheKey)initWithPersistentID:(unint64_t)a3 size:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  v8.receiver = self;
  v8.super_class = (Class)_MPHomeSharingArtworkCacheKey;
  CGSize result = [(_MPHomeSharingArtworkCacheKey *)&v8 init];
  if (result)
  {
    result->_unint64_t persistentID = a3;
    result->_size.CGFloat width = width;
    result->_size.CGFloat height = height;
  }
  return result;
}

@end