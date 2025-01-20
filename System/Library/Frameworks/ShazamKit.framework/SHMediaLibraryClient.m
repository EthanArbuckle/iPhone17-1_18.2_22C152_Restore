@interface SHMediaLibraryClient
- (BOOL)isBundleIdentifierValid;
- (BOOL)isEntitledForSPI;
- (BOOL)isTeamIdentifierValid;
- (SHClientCredentials)credentials;
- (SHMediaLibraryClient)initWithCredentials:(id)a3;
- (int64_t)type;
@end

@implementation SHMediaLibraryClient

- (SHMediaLibraryClient)initWithCredentials:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHMediaLibraryClient;
  v6 = [(SHMediaLibraryClient *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_credentials, a3);
  }

  return v7;
}

- (int64_t)type
{
  if (![(SHMediaLibraryClient *)self isBundleIdentifierValid])
  {
    v3 = sh_log_object();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = 0;
      id v5 = "Invalid Media Library client, bundle id is not valid";
      v6 = (uint8_t *)&v13;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
LABEL_14:
    int64_t v4 = 0;
    goto LABEL_15;
  }
  if (![(SHMediaLibraryClient *)self isEntitledForSPI])
  {
    unsigned __int8 v7 = [(SHMediaLibraryClient *)self isTeamIdentifierValid];
    v3 = sh_log_object();
    BOOL v8 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v8)
      {
        *(_WORD *)v10 = 0;
        int64_t v4 = 2;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Public Media Library client", v10, 2u);
      }
      else
      {
        int64_t v4 = 2;
      }
      goto LABEL_15;
    }
    if (v8)
    {
      *(_WORD *)v11 = 0;
      id v5 = "Invalid Media Library client, team id is not valid";
      v6 = v11;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v3 = sh_log_object();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Entitled Media Library client", buf, 2u);
  }
  int64_t v4 = 1;
LABEL_15:

  return v4;
}

- (BOOL)isEntitledForSPI
{
  v3 = [(SHMediaLibraryClient *)self credentials];
  id v4 = [v3 clientType];

  id v5 = [(SHMediaLibraryClient *)self credentials];
  v6 = [v5 attribution];
  unsigned __int8 v7 = [v6 containingAppBundleIdentifier];
  unsigned __int8 v8 = +[SHAttribution requiresMediaLibraryAttributionForBundleIdentifier:v7];

  if (v4 == (id)1) {
    return 1;
  }
  else {
    return v8 ^ 1;
  }
}

- (BOOL)isBundleIdentifierValid
{
  v2 = [(SHMediaLibraryClient *)self credentials];
  v3 = [v2 attribution];
  id v4 = [v3 containingAppBundleIdentifier];
  BOOL v5 = [v4 length] != 0;

  return v5;
}

- (BOOL)isTeamIdentifierValid
{
  v2 = [(SHMediaLibraryClient *)self credentials];
  v3 = [v2 attribution];
  id v4 = [v3 teamIdentifier];
  BOOL v5 = [v4 length] != 0;

  return v5;
}

- (SHClientCredentials)credentials
{
  return self->_credentials;
}

- (void).cxx_destruct
{
}

@end