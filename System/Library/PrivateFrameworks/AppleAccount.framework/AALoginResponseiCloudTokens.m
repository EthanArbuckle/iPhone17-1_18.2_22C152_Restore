@interface AALoginResponseiCloudTokens
- (AALoginResponseiCloudTokens)initWithTokens:(id)a3;
- (NSString)authToken;
- (NSString)cloudKitToken;
- (NSString)fmfAppToken;
- (NSString)fmfToken;
- (NSString)fmipAppToken;
- (NSString)fmipAuthToken;
- (NSString)fmipLostModeToken;
- (NSString)fmipSiriToken;
- (NSString)keyTransparencyToken;
- (NSString)mapsToken;
- (NSString)mdmServerToken;
- (NSString)searchPartyToken;
@end

@implementation AALoginResponseiCloudTokens

- (AALoginResponseiCloudTokens)initWithTokens:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)AALoginResponseiCloudTokens;
  v5 = [(AALoginResponseiCloudTokens *)&v31 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"mmeAuthToken"];
    authToken = v5->_authToken;
    v5->_authToken = (NSString *)v6;

    uint64_t v8 = [v4 objectForKey:@"mmeFMIPToken"];
    fmipAuthToken = v5->_fmipAuthToken;
    v5->_fmipAuthToken = (NSString *)v8;

    uint64_t v10 = [v4 objectForKey:@"mmeFMIPAppToken"];
    fmipAppToken = v5->_fmipAppToken;
    v5->_fmipAppToken = (NSString *)v10;

    uint64_t v12 = [v4 objectForKey:@"lostModeExitAuthToken"];
    fmipLostModeToken = v5->_fmipLostModeToken;
    v5->_fmipLostModeToken = (NSString *)v12;

    uint64_t v14 = [v4 objectForKey:@"mmeFMIPSiriToken"];
    fmipSiriToken = v5->_fmipSiriToken;
    v5->_fmipSiriToken = (NSString *)v14;

    uint64_t v16 = [v4 objectForKey:@"mmeFMFToken"];
    fmfToken = v5->_fmfToken;
    v5->_fmfToken = (NSString *)v16;

    uint64_t v18 = [v4 objectForKey:@"mmeFMFAppToken"];
    fmfAppToken = v5->_fmfAppToken;
    v5->_fmfAppToken = (NSString *)v18;

    uint64_t v20 = [v4 objectForKey:@"cloudKitToken"];
    cloudKitToken = v5->_cloudKitToken;
    v5->_cloudKitToken = (NSString *)v20;

    uint64_t v22 = [v4 objectForKey:@"mdmServerToken"];
    mdmServerToken = v5->_mdmServerToken;
    v5->_mdmServerToken = (NSString *)v22;

    uint64_t v24 = [v4 objectForKey:@"mapsToken"];
    mapsToken = v5->_mapsToken;
    v5->_mapsToken = (NSString *)v24;

    uint64_t v26 = [v4 objectForKey:@"searchPartyToken"];
    searchPartyToken = v5->_searchPartyToken;
    v5->_searchPartyToken = (NSString *)v26;

    uint64_t v28 = [v4 objectForKey:@"keyTransparencyToken"];
    keyTransparencyToken = v5->_keyTransparencyToken;
    v5->_keyTransparencyToken = (NSString *)v28;
  }
  return v5;
}

- (NSString)authToken
{
  return self->_authToken;
}

- (NSString)fmipAuthToken
{
  return self->_fmipAuthToken;
}

- (NSString)fmipAppToken
{
  return self->_fmipAppToken;
}

- (NSString)fmipLostModeToken
{
  return self->_fmipLostModeToken;
}

- (NSString)fmipSiriToken
{
  return self->_fmipSiriToken;
}

- (NSString)fmfToken
{
  return self->_fmfToken;
}

- (NSString)fmfAppToken
{
  return self->_fmfAppToken;
}

- (NSString)cloudKitToken
{
  return self->_cloudKitToken;
}

- (NSString)mdmServerToken
{
  return self->_mdmServerToken;
}

- (NSString)mapsToken
{
  return self->_mapsToken;
}

- (NSString)searchPartyToken
{
  return self->_searchPartyToken;
}

- (NSString)keyTransparencyToken
{
  return self->_keyTransparencyToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyTransparencyToken, 0);
  objc_storeStrong((id *)&self->_searchPartyToken, 0);
  objc_storeStrong((id *)&self->_mapsToken, 0);
  objc_storeStrong((id *)&self->_mdmServerToken, 0);
  objc_storeStrong((id *)&self->_cloudKitToken, 0);
  objc_storeStrong((id *)&self->_fmfAppToken, 0);
  objc_storeStrong((id *)&self->_fmfToken, 0);
  objc_storeStrong((id *)&self->_fmipSiriToken, 0);
  objc_storeStrong((id *)&self->_fmipLostModeToken, 0);
  objc_storeStrong((id *)&self->_fmipAppToken, 0);
  objc_storeStrong((id *)&self->_fmipAuthToken, 0);

  objc_storeStrong((id *)&self->_authToken, 0);
}

@end