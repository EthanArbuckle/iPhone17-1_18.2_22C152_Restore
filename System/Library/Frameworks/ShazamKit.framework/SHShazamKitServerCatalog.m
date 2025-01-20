@interface SHShazamKitServerCatalog
+ (BOOL)validateClientIdentifier:(id)a3;
- (NSString)clientIdentifier;
- (NSString)installationID;
- (SHServerResponseContextBuilder)contextBuilder;
- (SHShazamKitServerCatalog)initWithClientIdentifier:(id)a3 clientType:(int64_t)a4 installationID:(id)a5;
- (SHShazamKitServerURLBuilder)URLBuilder;
- (id)_createMatcher;
- (id)_initWithConfiguration:(id)a3 installationID:(id)a4;
- (int64_t)clientType;
- (void)loadConfiguration:(id)a3;
- (void)loadContext:(id)a3;
- (void)setContextBuilder:(id)a3;
- (void)setURLBuilder:(id)a3;
@end

@implementation SHShazamKitServerCatalog

- (SHShazamKitServerCatalog)initWithClientIdentifier:(id)a3 clientType:(int64_t)a4 installationID:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (([(id)objc_opt_class() validateClientIdentifier:v9] & 1) == 0)
  {
    v19 = +[NSString stringWithFormat:@"%@ is not a valid client identifier", v9];
    id v20 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v19 userInfo:0];

    objc_exception_throw(v20);
  }
  id v11 = objc_alloc_init((Class)SHCatalogConfiguration);
  [v11 setInstallationID:v10];
  v21.receiver = self;
  v21.super_class = (Class)SHShazamKitServerCatalog;
  v12 = [(SHShazamKitServerCatalog *)&v21 initWithConfiguration:v11 error:0];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clientIdentifier, a3);
    v13->_clientType = a4;
    objc_storeStrong((id *)&v13->_installationID, a5);
    v14 = objc_alloc_init(SHShazamKitServerURLBuilder);
    URLBuilder = v13->_URLBuilder;
    v13->_URLBuilder = v14;

    v16 = objc_alloc_init(SHServerResponseContextBuilder);
    contextBuilder = v13->_contextBuilder;
    v13->_contextBuilder = v16;
  }
  return v13;
}

- (id)_initWithConfiguration:(id)a3 installationID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, @"-[_initWithConfiguration:installationID:] should not be used on this class", 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (void)loadConfiguration:(id)a3
{
  id v4 = a3;
  id v8 = [(SHShazamKitServerCatalog *)self URLBuilder];
  id v5 = [(SHShazamKitServerCatalog *)self clientIdentifier];
  int64_t v6 = [(SHShazamKitServerCatalog *)self clientType];
  id v7 = [(SHShazamKitServerCatalog *)self installationID];
  [v8 loadMatchEndpointForClientIdentifier:v5 clientType:v6 installationID:v7 callback:v4];
}

- (void)loadContext:(id)a3
{
  id v4 = a3;
  id v6 = [(SHShazamKitServerCatalog *)self contextBuilder];
  id v5 = [(SHShazamKitServerCatalog *)self clientIdentifier];
  [v6 loadContextForClientIdentifier:v5 completion:v4];
}

- (id)_createMatcher
{
  v2 = [[SHShazamKitServerMatcher alloc] initWithCatalog:self];

  return v2;
}

+ (BOOL)validateClientIdentifier:(id)a3
{
  return [a3 length] != 0;
}

- (NSString)installationID
{
  return self->_installationID;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (int64_t)clientType
{
  return self->_clientType;
}

- (SHShazamKitServerURLBuilder)URLBuilder
{
  return self->_URLBuilder;
}

- (void)setURLBuilder:(id)a3
{
}

- (SHServerResponseContextBuilder)contextBuilder
{
  return self->_contextBuilder;
}

- (void)setContextBuilder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextBuilder, 0);
  objc_storeStrong((id *)&self->_URLBuilder, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);

  objc_storeStrong((id *)&self->_installationID, 0);
}

@end