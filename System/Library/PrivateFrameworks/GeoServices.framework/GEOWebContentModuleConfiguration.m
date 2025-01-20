@interface GEOWebContentModuleConfiguration
- (BOOL)shouldDrawPlatter;
- (GEOWebContentModuleConfiguration)initWithWebModuleConfiguration:(id)a3;
- (NSURL)url;
- (id)description;
@end

@implementation GEOWebContentModuleConfiguration

- (GEOWebContentModuleConfiguration)initWithWebModuleConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOWebContentModuleConfiguration;
  v6 = [(GEOWebContentModuleConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_webModuleConfig, a3);
  }

  return v7;
}

- (BOOL)shouldDrawPlatter
{
  webModuleConfig = self->_webModuleConfig;
  return webModuleConfig
      && (*(unsigned char *)&webModuleConfig->_flags & 2) != 0
      && webModuleConfig->_shouldRenderBackgroundPlatter;
}

- (NSURL)url
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  v3 = -[GEOPDWebModuleConfiguration url]((id *)&self->_webModuleConfig->super.super.isa);
  v4 = [v2 URLWithString:v3];

  return (NSURL *)v4;
}

- (id)description
{
  return [(GEOPDWebModuleConfiguration *)self->_webModuleConfig description];
}

- (void).cxx_destruct
{
}

@end