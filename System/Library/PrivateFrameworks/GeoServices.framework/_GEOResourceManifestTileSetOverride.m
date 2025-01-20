@interface _GEOResourceManifestTileSetOverride
+ (BOOL)supportsSecureCoding;
- (NSNumber)version;
- (NSURL)baseURL;
- (NSURL)localizationURL;
- (_GEOResourceManifestTileSetOverride)init;
- (_GEOResourceManifestTileSetOverride)initWithCoder:(id)a3;
- (_GEOResourceManifestTileSetOverride)initWithStyle:(int)a3 size:(int)a4 scale:(int)a5;
- (int)scale;
- (int)size;
- (int)style;
- (void)encodeWithCoder:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setLocalizationURL:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation _GEOResourceManifestTileSetOverride

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GEOResourceManifestTileSetOverride)init
{
  result = (_GEOResourceManifestTileSetOverride *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (_GEOResourceManifestTileSetOverride)initWithStyle:(int)a3 size:(int)a4 scale:(int)a5
{
  v12.receiver = self;
  v12.super_class = (Class)_GEOResourceManifestTileSetOverride;
  v8 = [(_GEOResourceManifestTileSetOverride *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_style = a3;
    v8->_size = a4;
    v8->_scale = a5;
    v10 = v8;
  }

  return v9;
}

- (_GEOResourceManifestTileSetOverride)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_GEOResourceManifestTileSetOverride;
  v5 = [(_GEOResourceManifestTileSetOverride *)&v14 init];
  if (v5)
  {
    v5->_style = [v4 decodeInt32ForKey:@"style"];
    v5->_size = [v4 decodeInt32ForKey:@"size"];
    v5->_scale = [v4 decodeInt32ForKey:@"scale"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
    version = v5->_version;
    v5->_version = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baseURL"];
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizationURL"];
    localizationURL = v5->_localizationURL;
    v5->_localizationURL = (NSURL *)v10;

    objc_super v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [v8 encodeInt32:self->_style forKey:@"style"];
  [v8 encodeInt32:self->_size forKey:@"size"];
  [v8 encodeInt32:self->_scale forKey:@"scale"];
  version = self->_version;
  if (version) {
    [v8 encodeObject:version forKey:@"version"];
  }
  baseURL = self->_baseURL;
  if (baseURL) {
    [v8 encodeObject:baseURL forKey:@"baseURL"];
  }
  localizationURL = self->_localizationURL;
  v7 = v8;
  if (localizationURL)
  {
    [v8 encodeObject:localizationURL forKey:@"localizationURL"];
    v7 = v8;
  }
}

- (int)style
{
  return self->_style;
}

- (int)size
{
  return self->_size;
}

- (int)scale
{
  return self->_scale;
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (NSURL)localizationURL
{
  return self->_localizationURL;
}

- (void)setLocalizationURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizationURL, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);

  objc_storeStrong((id *)&self->_version, 0);
}

@end