@interface _MFIconCacheItem
- (NSString)filename;
- (UIImage)cachedImage;
- (_MFIconCacheItem)initWithFilename:(id)a3;
- (void)setCachedImage:(id)a3;
@end

@implementation _MFIconCacheItem

- (_MFIconCacheItem)initWithFilename:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MFIconCacheItem;
  v5 = [(_MFIconCacheItem *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    filename = v5->_filename;
    v5->_filename = v6;
  }
  return v5;
}

- (NSString)filename
{
  return self->_filename;
}

- (UIImage)cachedImage
{
  return self->_cachedImage;
}

- (void)setCachedImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedImage, 0);

  objc_storeStrong((id *)&self->_filename, 0);
}

@end