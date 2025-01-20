@interface BSUIMappedImageCacheOptions
+ (id)optionsWithContainerPathProvider:(id)a3;
- (BSPathProviding)containerPathProvider;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation BSUIMappedImageCacheOptions

- (BSPathProviding)containerPathProvider
{
  return self->_containerPathProvider;
}

+ (id)optionsWithContainerPathProvider:(id)a3
{
  id v5 = a3;
  v6 = (id *)objc_alloc_init((Class)a1);
  v7 = v6;
  if (v6) {
    objc_storeStrong(v6 + 1, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

@end