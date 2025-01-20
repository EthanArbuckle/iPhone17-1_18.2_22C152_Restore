@interface SHShazamKitServerURLBuilder
+ (void)updateTokensForEndpoint:(id)a3 language:(id)a4 storefront:(id)a5 installationID:(id)a6;
- (SHStorefront)storefront;
- (void)defaultValuesWithCompletion:(id)a3;
- (void)loadEndpointForClientIdentifier:(id)a3 clientType:(int64_t)a4 endpointType:(int64_t)a5 installationID:(id)a6 callback:(id)a7;
- (void)loadHapticsEndpointForClientIdentifier:(id)a3 clientType:(int64_t)a4 callback:(id)a5;
- (void)loadLookupEndpointForClientIdentifier:(id)a3 clientType:(int64_t)a4 callback:(id)a5;
- (void)loadMatchEndpointForClientIdentifier:(id)a3 clientType:(int64_t)a4 installationID:(id)a5 callback:(id)a6;
@end

@implementation SHShazamKitServerURLBuilder

- (void)loadLookupEndpointForClientIdentifier:(id)a3 clientType:(int64_t)a4 callback:(id)a5
{
}

- (void)loadMatchEndpointForClientIdentifier:(id)a3 clientType:(int64_t)a4 installationID:(id)a5 callback:(id)a6
{
}

- (void)loadHapticsEndpointForClientIdentifier:(id)a3 clientType:(int64_t)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  v10 = +[SHRemoteConfiguration sharedInstance];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000479AC;
  v13[3] = &unk_100076128;
  id v11 = v9;
  id v15 = v11;
  id v12 = v8;
  id v14 = v12;
  objc_copyWeak(&v16, &location);
  [v10 hostForClientType:a4 completion:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)loadEndpointForClientIdentifier:(id)a3 clientType:(int64_t)a4 endpointType:(int64_t)a5 installationID:(id)a6 callback:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  objc_initWeak(&location, self);
  id v15 = +[SHRemoteConfiguration sharedInstance];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10004809C;
  v19[3] = &unk_1000761A0;
  id v16 = v14;
  id v22 = v16;
  v23[1] = (id)a5;
  id v17 = v12;
  id v20 = v17;
  objc_copyWeak(v23, &location);
  id v18 = v13;
  id v21 = v18;
  [v15 hostForClientType:a4 completion:v19];

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
}

- (void)defaultValuesWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[SHRemoteConfiguration sharedInstance];
  [v4 defaultValuesWithCompletion:v3];
}

- (SHStorefront)storefront
{
  storefront = self->_storefront;
  if (!storefront)
  {
    id v4 = (SHStorefront *)objc_alloc_init((Class)SHStorefront);
    v5 = self->_storefront;
    self->_storefront = v4;

    storefront = self->_storefront;
  }

  return storefront;
}

+ (void)updateTokensForEndpoint:(id)a3 language:(id)a4 storefront:(id)a5 installationID:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  [v11 updateToken:2 withValue:a4];
  [v11 updateToken:3 withValue:v10];

  [v11 updateToken:0 withValue:v9];
}

- (void).cxx_destruct
{
}

@end