@interface _EXExtensionPoint
- (NSDictionary)SDKDictionary;
- (NSString)description;
- (NSString)domain;
- (NSString)identifier;
- (NSString)name;
- (NSURL)url;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)variant;
- (unsigned)platform;
- (void)reset;
- (void)setDomain:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setPlatform:(unsigned int)a3;
- (void)setSDKDictionary:(id)a3;
- (void)setUrl:(id)a3;
- (void)setVariant:(unint64_t)a3;
@end

@implementation _EXExtensionPoint

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = [(_EXExtensionPoint *)self identifier];
  v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  uint64_t v7 = [(_EXExtensionPoint *)self SDKDictionary];
  v8 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v7;

  *(_DWORD *)(v4 + 8) = [(_EXExtensionPoint *)self platform];
  *(void *)(v4 + 32) = [(_EXExtensionPoint *)self variant];
  uint64_t v9 = [(_EXExtensionPoint *)self url];
  v10 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v9;

  return (id)v4;
}

- (void)reset
{
  identifier = self->_identifier;
  self->_identifier = 0;

  SDKDictionary = self->_SDKDictionary;
  self->_SDKDictionary = 0;

  self->_platform = 0;
  url = self->_url;
  self->_variant = 0;
  self->_url = 0;
}

- (NSString)description
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSDictionary)SDKDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSDKDictionary:(id)a3
{
}

- (unsigned)platform
{
  return self->_platform;
}

- (void)setPlatform:(unsigned int)a3
{
  self->_platform = a3;
}

- (unint64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(unint64_t)a3
{
  self->_variant = a3;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUrl:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)domain
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDomain:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_SDKDictionary, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end