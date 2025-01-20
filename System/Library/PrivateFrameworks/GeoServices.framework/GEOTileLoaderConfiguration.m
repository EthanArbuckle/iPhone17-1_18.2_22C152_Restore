@interface GEOTileLoaderConfiguration
- (Class)serverProxyClass;
- (GEOResourceManifestConfiguration)manifestConfiguration;
- (GEOTileLoaderConfiguration)init;
- (NSLocale)locale;
- (NSString)diskCacheExternalLocation;
- (NSString)diskCacheLocation;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)backpressureControlCountLimit;
- (unint64_t)memoryCacheCostLimit;
- (unint64_t)memoryCacheCountLimit;
- (void)setBackpressureControlCountLimit:(unint64_t)a3;
- (void)setDiskCacheExternalLocation:(id)a3;
- (void)setDiskCacheLocation:(id)a3;
- (void)setLocale:(id)a3;
- (void)setManifestConfiguration:(id)a3;
- (void)setMemoryCacheCostLimit:(unint64_t)a3;
- (void)setMemoryCacheCountLimit:(unint64_t)a3;
- (void)setServerProxyClass:(Class)a3;
@end

@implementation GEOTileLoaderConfiguration

- (unint64_t)backpressureControlCountLimit
{
  return self->_backpressureControlCountLimit;
}

- (unint64_t)memoryCacheCountLimit
{
  return self->_memoryCacheCountLimit;
}

- (unint64_t)memoryCacheCostLimit
{
  return self->_memoryCacheCostLimit;
}

- (GEOResourceManifestConfiguration)manifestConfiguration
{
  return self->_manifestConfiguration;
}

- (Class)serverProxyClass
{
  return self->_serverProxyClass;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSString)diskCacheLocation
{
  return self->_diskCacheLocation;
}

- (NSString)diskCacheExternalLocation
{
  return self->_diskCacheExternalLocation;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[GEOTileLoaderConfiguration allocWithZone:a3] init];
  [(GEOTileLoaderConfiguration *)v4 setServerProxyClass:[(GEOTileLoaderConfiguration *)self serverProxyClass]];
  [(GEOTileLoaderConfiguration *)v4 setMemoryCacheCountLimit:[(GEOTileLoaderConfiguration *)self memoryCacheCountLimit]];
  [(GEOTileLoaderConfiguration *)v4 setMemoryCacheCostLimit:[(GEOTileLoaderConfiguration *)self memoryCacheCostLimit]];
  [(GEOTileLoaderConfiguration *)v4 setBackpressureControlCountLimit:[(GEOTileLoaderConfiguration *)self backpressureControlCountLimit]];
  v5 = [(GEOTileLoaderConfiguration *)self diskCacheLocation];
  [(GEOTileLoaderConfiguration *)v4 setDiskCacheLocation:v5];

  v6 = [(GEOTileLoaderConfiguration *)self diskCacheExternalLocation];
  [(GEOTileLoaderConfiguration *)v4 setDiskCacheExternalLocation:v6];

  v7 = [(GEOTileLoaderConfiguration *)self manifestConfiguration];
  [(GEOTileLoaderConfiguration *)v4 setManifestConfiguration:v7];

  v8 = [(GEOTileLoaderConfiguration *)self locale];
  [(GEOTileLoaderConfiguration *)v4 setLocale:v8];

  return v4;
}

- (GEOTileLoaderConfiguration)init
{
  v12.receiver = self;
  v12.super_class = (Class)GEOTileLoaderConfiguration;
  v2 = [(GEOTileLoaderConfiguration *)&v12 init];
  if (v2)
  {
    v2->_serverProxyClass = (Class)objc_opt_class();
    *(_OWORD *)&v2->_memoryCacheCountLimit = xmmword_18A62C070;
    v2->_backpressureControlCountLimit = 50;
    v3 = objc_alloc_init(GEOResourceManifestConfiguration);
    manifestConfiguration = v2->_manifestConfiguration;
    v2->_manifestConfiguration = v3;

    v5 = +[GEOFilePaths pathFor:10];
    uint64_t v6 = [v5 copy];
    diskCacheLocation = v2->_diskCacheLocation;
    v2->_diskCacheLocation = (NSString *)v6;

    v8 = +[GEOFilePaths pathFor:11];
    uint64_t v9 = [v8 copy];
    diskCacheExternalLocation = v2->_diskCacheExternalLocation;
    v2->_diskCacheExternalLocation = (NSString *)v9;
  }
  return v2;
}

- (void)setServerProxyClass:(Class)a3
{
  self->_serverProxyClass = a3;
}

- (void)setMemoryCacheCountLimit:(unint64_t)a3
{
  self->_memoryCacheCountLimit = a3;
}

- (void)setMemoryCacheCostLimit:(unint64_t)a3
{
  self->_memoryCacheCostLimit = a3;
}

- (void)setDiskCacheLocation:(id)a3
{
}

- (void)setManifestConfiguration:(id)a3
{
}

- (void)setLocale:(id)a3
{
}

- (void)setDiskCacheExternalLocation:(id)a3
{
}

- (void)setBackpressureControlCountLimit:(unint64_t)a3
{
  self->_backpressureControlCountLimit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_manifestConfiguration, 0);
  objc_storeStrong((id *)&self->_diskCacheExternalLocation, 0);

  objc_storeStrong((id *)&self->_diskCacheLocation, 0);
}

@end