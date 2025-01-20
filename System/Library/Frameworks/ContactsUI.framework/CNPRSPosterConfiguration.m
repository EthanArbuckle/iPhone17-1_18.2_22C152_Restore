@interface CNPRSPosterConfiguration
- (CNPRSPosterConfiguration)initWithPosterConfiguration:(id)a3;
- (NSString)providerBundleIdentifier;
- (NSURL)assetDirectory;
- (PRSPosterConfiguration)wrappedPosterConfiguration;
- (id)loadUserInfoWithError:(id *)a3;
- (id)serverUUID;
- (void)setAssetDirectory:(id)a3;
@end

@implementation CNPRSPosterConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetDirectory, 0);

  objc_storeStrong((id *)&self->_wrappedPosterConfiguration, 0);
}

- (void)setAssetDirectory:(id)a3
{
}

- (PRSPosterConfiguration)wrappedPosterConfiguration
{
  return self->_wrappedPosterConfiguration;
}

- (NSString)providerBundleIdentifier
{
  return (NSString *)[(PRSPosterConfiguration *)self->_wrappedPosterConfiguration providerBundleIdentifier];
}

- (NSURL)assetDirectory
{
  return (NSURL *)[(PRSPosterConfiguration *)self->_wrappedPosterConfiguration assetDirectory];
}

- (id)serverUUID
{
  return (id)[(PRSPosterConfiguration *)self->_wrappedPosterConfiguration serverUUID];
}

- (id)loadUserInfoWithError:(id *)a3
{
  return (id)[(PRSPosterConfiguration *)self->_wrappedPosterConfiguration loadUserInfoWithError:a3];
}

- (CNPRSPosterConfiguration)initWithPosterConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNPRSPosterConfiguration;
  v6 = [(CNPRSPosterConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_wrappedPosterConfiguration, a3);
  }

  return v7;
}

@end