@interface MSServerSideConfigProtocol
- (MSServerSideConfigProtocol)initWithPersonID:(id)a3 baseURL:(id)a4;
- (MSServerSideConfigProtocolDelegate)delegate;
- (NSString)personID;
- (void)_didFailAuthenticationWithError:(id)a3;
- (void)_didFinishWithResponse:(id)a3 error:(id)a4;
- (void)abort;
- (void)dealloc;
- (void)queryConfiguration;
- (void)setDelegate:(id)a3;
@end

@implementation MSServerSideConfigProtocol

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configURL, 0);
  objc_storeStrong((id *)&self->_personID, 0);
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MSServerSideConfigProtocolDelegate *)a3;
}

- (MSServerSideConfigProtocolDelegate)delegate
{
  return self->_delegate;
}

- (NSString)personID
{
  return self->_personID;
}

- (void)_didFailAuthenticationWithError:(id)a3
{
}

- (void)_didFinishWithResponse:(id)a3 error:(id)a4
{
}

- (void)abort
{
}

- (void)queryConfiguration
{
  p_context = &self->_context;
  configURL = self->_configURL;
  CFDictionaryRef v4 = (const __CFDictionary *)MSPURLConnectionProperties();
  MSSSCPCQueryConfiguration(p_context, (uint64_t)configURL, v4);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MSServerSideConfigProtocol;
  [(MSServerSideConfigProtocol *)&v3 dealloc];
}

- (MSServerSideConfigProtocol)initWithPersonID:(id)a3 baseURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MSServerSideConfigProtocol;
  v9 = [(MSServerSideConfigProtocol *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_personID, a3);
    v10->_context._super.owner = v10;
    v11 = (__CFString *)v7;
    v10->_context._super.personID = v11;
    v12 = MSPlatform();
    v10->_context._super.authToken = [v12 authTokenForPersonID:v11];

    v10->_context._super.deviceInfo = +[MSProtocolUtilities deviceInfoDictForPersonID:v11];
    v10->_context._super.connectionTimeout = 0.0;
    v10->_context.didFinishCallback = _didFinish_2251;
    v10->_context.didFailAuthenticationCallback = _didFailAuthentication_2250;
    if (v8)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F1CB10]);
      v14 = [NSString stringWithFormat:@"%@/streams/configuration", v11];
      uint64_t v15 = [v13 initWithString:v14 relativeToURL:v8];
      configURL = v10->_configURL;
      v10->_configURL = (NSURL *)v15;
    }
  }

  return v10;
}

@end