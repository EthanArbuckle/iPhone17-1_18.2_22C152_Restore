@interface AKSRPContext
- (AKMasterToken)masterToken;
- (NSDictionary)configurationParameters;
- (NSDictionary)serverProvidedData;
- (NSDictionary)status;
- (__AppleIDAuthSupportData)underlyingContext;
- (id)configureWithParameters:(id)a3;
- (void)dealloc;
@end

@implementation AKSRPContext

- (void)dealloc
{
  underlyingContext = self->_underlyingContext;
  if (underlyingContext)
  {
    CFRelease(underlyingContext);
    self->_underlyingContext = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AKSRPContext;
  [(AKSRPContext *)&v4 dealloc];
}

- (id)configureWithParameters:(id)a3
{
  id v4 = a3;
  v5 = (NSDictionary *)[v4 copy];
  configurationParameters = self->_configurationParameters;
  self->_configurationParameters = v5;

  v7 = (__AppleIDAuthSupportData *)AppleIDAuthSupportCreate();
  id v8 = 0;
  self->_underlyingContext = v7;
  if (!v7) {
    id v8 = 0;
  }

  return v8;
}

- (NSDictionary)serverProvidedData
{
  underlyingContext = self->_underlyingContext;
  if (underlyingContext) {
    underlyingContext = (void *)AppleIDAuthSupportCopyProvidedData();
  }

  return (NSDictionary *)underlyingContext;
}

- (AKMasterToken)masterToken
{
  if (self->_underlyingContext && (uint64_t v3 = AppleIDAuthSupportCopyToken()) != 0)
  {
    id v4 = (const void *)v3;
    v5 = (void *)AppleIDAuthSupportTokenCopyExternalizedVersion();
    v6 = [(AKSRPContext *)self serverProvidedData];
    v7 = [v6 objectForKeyedSubscript:@"duration"];
    id v8 = +[AKMasterToken tokenWithExternalizedVersion:v5 lifetime:v7];

    CFRelease(v4);
  }
  else
  {
    id v8 = 0;
  }

  return (AKMasterToken *)v8;
}

- (NSDictionary)status
{
  underlyingContext = self->_underlyingContext;
  if (underlyingContext)
  {
    underlyingContext = AppleIDAuthSupportGetStatus();
  }

  return (NSDictionary *)underlyingContext;
}

- (__AppleIDAuthSupportData)underlyingContext
{
  return self->_underlyingContext;
}

- (NSDictionary)configurationParameters
{
  return self->_configurationParameters;
}

- (void).cxx_destruct
{
}

@end