@interface MSStreamsProtocol
- (MSStreamsProtocol)initWithPersonID:(id)a3 baseURL:(id)a4;
- (MSStreamsProtocolDelegate)delegate;
- (NSString)personID;
- (NSURL)deleteURL;
- (NSURL)getURL;
- (NSURL)putURL;
- (NSURL)reauthorizeURL;
- (NSURL)resetURL;
- (NSURL)uploadCompleteURL;
- (id)deviceInfoDict;
- (void)_didFindServerSideConfigurationVersion:(id)a3;
- (void)_didReceiveRetryAfterDate:(id)a3;
- (void)_refreshAuthTokenForContext:(__MSSPCContext *)a3;
- (void)abort;
- (void)setDelegate:(id)a3;
@end

@implementation MSStreamsProtocol

- (void).cxx_destruct
{
}

- (NSString)personID
{
  return self->_personID;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MSStreamsProtocolDelegate *)a3;
}

- (MSStreamsProtocolDelegate)delegate
{
  return self->_delegate;
}

- (void)_refreshAuthTokenForContext:(__MSSPCContext *)a3
{
  authToken = a3->authToken;
  if (authToken) {
    CFRelease(authToken);
  }
  MSPlatform();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  a3->authToken = [v6 authTokenForPersonID:self->_personID];
}

- (void)_didReceiveRetryAfterDate:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    [(MSStreamsProtocolDelegate *)self->_delegate protocol:self didReceiveRetryAfterDate:v4];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v5 = v7;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ retrieved a retry-after header, but we're ignoring it.", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_didFindServerSideConfigurationVersion:(id)a3
{
  id v4 = a3;
  MSPlatform();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v7 theDaemon];
  int v6 = [(MSStreamsProtocol *)self personID];
  [v5 didReceiveServerSideConfigurationVersion:v4 forPersonID:v6];
}

- (id)deviceInfoDict
{
  v2 = [(MSStreamsProtocol *)self personID];
  v3 = +[MSProtocolUtilities deviceInfoDictForPersonID:v2];

  return v3;
}

- (void)abort
{
}

- (NSURL)deleteURL
{
  v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = [NSString stringWithFormat:@"%@/streams/deletemetadata", self->_personID];
  id v5 = MSPlatform();
  int v6 = [v5 baseURLForPersonID:self->_personID];
  id v7 = [v3 URLWithString:v4 relativeToURL:v6];

  return (NSURL *)v7;
}

- (NSURL)uploadCompleteURL
{
  v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = [NSString stringWithFormat:@"%@/streams/uploadcomplete", self->_personID];
  id v5 = MSPlatform();
  int v6 = [v5 baseURLForPersonID:self->_personID];
  id v7 = [v3 URLWithString:v4 relativeToURL:v6];

  return (NSURL *)v7;
}

- (NSURL)reauthorizeURL
{
  v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = [NSString stringWithFormat:@"%@/streams/gettokens", self->_personID];
  id v5 = MSPlatform();
  int v6 = [v5 baseURLForPersonID:self->_personID];
  id v7 = [v3 URLWithString:v4 relativeToURL:v6];

  return (NSURL *)v7;
}

- (NSURL)resetURL
{
  v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = [NSString stringWithFormat:@"%@/streams/reset", self->_personID];
  id v5 = MSPlatform();
  int v6 = [v5 baseURLForPersonID:self->_personID];
  id v7 = [v3 URLWithString:v4 relativeToURL:v6];

  return (NSURL *)v7;
}

- (NSURL)putURL
{
  v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = [NSString stringWithFormat:@"%@/streams/putmetadata", self->_personID];
  id v5 = MSPlatform();
  int v6 = [v5 baseURLForPersonID:self->_personID];
  id v7 = [v3 URLWithString:v4 relativeToURL:v6];

  return (NSURL *)v7;
}

- (NSURL)getURL
{
  v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = [NSString stringWithFormat:@"%@/streams/getmetadata", self->_personID];
  id v5 = MSPlatform();
  int v6 = [v5 baseURLForPersonID:self->_personID];
  id v7 = [v3 URLWithString:v4 relativeToURL:v6];

  return (NSURL *)v7;
}

- (MSStreamsProtocol)initWithPersonID:(id)a3 baseURL:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MSStreamsProtocol;
  id v7 = [(MSStreamsProtocol *)&v13 init];
  uint64_t v8 = v7;
  if (!v7) {
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v7->_personID, a3);
  v9 = MSPlatform();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_7:

    goto LABEL_8;
  }
  v10 = MSPlatform();
  if (([v10 shouldEnableNewFeatures] & 1) == 0)
  {

    goto LABEL_7;
  }
  uint64_t v11 = _MSSPCForcedProtocolVersionString;

  if (!v11) {
    _MSSPCForcedProtocolVersionString = @"kfjVrXr0t5Dl";
  }
LABEL_8:

  return v8;
}

@end