@interface MPArtworkConfiguration
+ (id)systemConfiguration;
- (ML3ArtworkConfiguration)artworkConfiguration;
- (MPArtworkConfiguration)initWithConfigurationDictionaries:(id)a3;
- (id)description;
- (id)sizesToAutogenerateForMediaType:(unint64_t)a3 artworkType:(int64_t)a4;
- (id)supportedSizesForMediaType:(unint64_t)a3 artworkType:(int64_t)a4;
- (void)setArtworkConfiguration:(id)a3;
@end

@implementation MPArtworkConfiguration

void __45__MPArtworkConfiguration_systemConfiguration__block_invoke()
{
  v0 = objc_alloc_init(MPArtworkConfiguration);
  v1 = (void *)systemConfiguration___systemConfiguration;
  systemConfiguration___systemConfiguration = (uint64_t)v0;

  id v2 = [MEMORY[0x1E4F79A88] systemConfiguration];
  [(id)systemConfiguration___systemConfiguration setArtworkConfiguration:v2];
}

- (id)supportedSizesForMediaType:(unint64_t)a3 artworkType:(int64_t)a4
{
  uint64_t v6 = MLMediaTypeForMPMediaType(a3);
  v7 = [(MPArtworkConfiguration *)self artworkConfiguration];
  v8 = [v7 supportedSizesForMediaType:v6 artworkType:a4];

  return v8;
}

- (void)setArtworkConfiguration:(id)a3
{
}

- (ML3ArtworkConfiguration)artworkConfiguration
{
  return self->_artworkConfiguration;
}

+ (id)systemConfiguration
{
  if (systemConfiguration_onceToken != -1) {
    dispatch_once(&systemConfiguration_onceToken, &__block_literal_global_54734);
  }
  id v2 = (void *)systemConfiguration___systemConfiguration;

  return v2;
}

- (void).cxx_destruct
{
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MPArtworkConfiguration *)self artworkConfiguration];
  uint64_t v6 = [v3 stringWithFormat:@"<%@ %p %@>\n", v4, self, v5];

  return v6;
}

- (id)sizesToAutogenerateForMediaType:(unint64_t)a3 artworkType:(int64_t)a4
{
  uint64_t v6 = MLMediaTypeForMPMediaType(a3);
  v7 = [(MPArtworkConfiguration *)self artworkConfiguration];
  v8 = [v7 sizesToAutogenerateForMediaType:v6 artworkType:a4];

  return v8;
}

- (MPArtworkConfiguration)initWithConfigurationDictionaries:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MPArtworkConfiguration;
  v5 = [(MPArtworkConfiguration *)&v8 init];
  if (v5)
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F79A88]) initWithConfigurationDictionaries:v4];
    [(MPArtworkConfiguration *)v5 setArtworkConfiguration:v6];
  }
  return v5;
}

@end