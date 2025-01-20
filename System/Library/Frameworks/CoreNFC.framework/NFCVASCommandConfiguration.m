@interface NFCVASCommandConfiguration
- (NFCVASCommandConfiguration)init;
- (NFCVASCommandConfiguration)initWithVASMode:(NFCVASMode)mode passTypeIdentifier:(NSString *)passTypeIdentifier url:(NSURL *)url;
- (NFCVASMode)mode;
- (NSString)passTypeIdentifier;
- (NSURL)url;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setMode:(NFCVASMode)mode;
- (void)setPassTypeIdentifier:(NSString *)passTypeIdentifier;
- (void)setUrl:(NSURL *)url;
@end

@implementation NFCVASCommandConfiguration

- (NFCVASCommandConfiguration)init
{
  v3 = objc_opt_new();
  v4 = [(NFCVASCommandConfiguration *)self initWithVASMode:1 passTypeIdentifier:&stru_26D38B2E0 url:v3];

  return v4;
}

- (NFCVASCommandConfiguration)initWithVASMode:(NFCVASMode)mode passTypeIdentifier:(NSString *)passTypeIdentifier url:(NSURL *)url
{
  v8 = passTypeIdentifier;
  v9 = url;
  v13.receiver = self;
  v13.super_class = (Class)NFCVASCommandConfiguration;
  v10 = [(NFCVASCommandConfiguration *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(NFCVASCommandConfiguration *)v10 setMode:mode];
    [(NFCVASCommandConfiguration *)v11 setPassTypeIdentifier:v8];
    [(NFCVASCommandConfiguration *)v11 setUrl:v9];
  }

  return v11;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"{Mode=%ld, passId=%@, url=%@}", self->_mode, self->_passTypeIdentifier, self->_url];

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (objc_class *)objc_opt_class();

  return objc_alloc_init(v3);
}

- (NFCVASMode)mode
{
  return self->_mode;
}

- (void)setMode:(NFCVASMode)mode
{
  self->_mode = mode;
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(NSString *)passTypeIdentifier
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(NSURL *)url
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
}

@end