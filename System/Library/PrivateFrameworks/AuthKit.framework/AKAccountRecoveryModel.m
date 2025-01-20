@interface AKAccountRecoveryModel
- (AKAccountRecoveryModel)initWithContext:(id)a3 configuration:(id)a4 utilities:(id)a5;
- (AKAppleIDAuthenticationCommandLineContext)context;
- (AKCommandLineUtilities)cliUtilities;
- (AKServerRequestConfiguration)configuration;
- (void)setCliUtilities:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setContext:(id)a3;
@end

@implementation AKAccountRecoveryModel

- (AKAccountRecoveryModel)initWithContext:(id)a3 configuration:(id)a4 utilities:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AKAccountRecoveryModel;
  v12 = [(AKAccountRecoveryModel *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeStrong((id *)&v13->_configuration, a4);
    objc_storeStrong((id *)&v13->_cliUtilities, a5);
  }

  return v13;
}

- (AKAppleIDAuthenticationCommandLineContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (AKServerRequestConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (AKCommandLineUtilities)cliUtilities
{
  return self->_cliUtilities;
}

- (void)setCliUtilities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cliUtilities, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end