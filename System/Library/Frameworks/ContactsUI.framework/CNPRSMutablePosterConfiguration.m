@interface CNPRSMutablePosterConfiguration
- (BOOL)storeUserInfo:(id)a3 error:(id *)a4;
- (CNPRSMutablePosterConfiguration)init;
- (NSURL)assetDirectory;
- (PRSMutablePosterConfiguration)wrappedMutablePosterConfiguration;
@end

@implementation CNPRSMutablePosterConfiguration

- (void).cxx_destruct
{
}

- (PRSMutablePosterConfiguration)wrappedMutablePosterConfiguration
{
  return self->_wrappedMutablePosterConfiguration;
}

- (NSURL)assetDirectory
{
  return (NSURL *)[(PRSMutablePosterConfiguration *)self->_wrappedMutablePosterConfiguration assetDirectory];
}

- (BOOL)storeUserInfo:(id)a3 error:(id *)a4
{
  return [(PRSMutablePosterConfiguration *)self->_wrappedMutablePosterConfiguration storeUserInfo:a3 error:a4];
}

- (CNPRSMutablePosterConfiguration)init
{
  v12.receiver = self;
  v12.super_class = (Class)CNPRSMutablePosterConfiguration;
  v2 = [(CNPRSMutablePosterConfiguration *)&v12 init];
  if (v2)
  {
    getPRSMutablePosterConfigurationClass[0]();
    objc_opt_class();
    char v3 = objc_opt_respondsToSelector();
    Class v4 = (Class)getPRSMutablePosterConfigurationClass[0]();
    Class v5 = v4;
    if (v3)
    {
      v6 = getPRSPosterRoleIncomingCall_64354();
      uint64_t v7 = [(objc_class *)v5 mutableConfigurationWithRole:v6];
      wrappedMutablePosterConfiguration = v2->_wrappedMutablePosterConfiguration;
      v2->_wrappedMutablePosterConfiguration = (PRSMutablePosterConfiguration *)v7;
    }
    else
    {
      uint64_t v9 = [(objc_class *)v4 mutableConfiguration];
      v6 = v2->_wrappedMutablePosterConfiguration;
      v2->_wrappedMutablePosterConfiguration = (PRSMutablePosterConfiguration *)v9;
    }

    v10 = v2;
  }

  return v2;
}

@end