@interface SHHapticsFetcher
- (BOOL)allowsCachedAssets;
- (NSString)bundleIdentifier;
- (SHHapticsEndpointRequester)networkRequester;
- (SHHapticsFetcher)init;
- (SHHapticsFetcher)initWithURLBuilder:(id)a3 networkRequester:(id)a4;
- (SHShazamKitServerURLBuilder)urlBuilder;
- (int64_t)clientType;
- (void)hapticsForMediaItems:(id)a3 completionHandler:(id)a4;
- (void)hasHapticTrackForMediaItem:(id)a3 completionHandler:(id)a4;
- (void)setAllowsCachedAssets:(BOOL)a3;
@end

@implementation SHHapticsFetcher

- (SHHapticsFetcher)init
{
  v3 = objc_alloc_init(SHShazamKitServerURLBuilder);
  v4 = [[SHHapticsEndpointRequester alloc] initWithClientIdentifier:@"com.apple.shazamd" clientType:1];
  v5 = [(SHHapticsFetcher *)self initWithURLBuilder:v3 networkRequester:v4];

  return v5;
}

- (SHHapticsFetcher)initWithURLBuilder:(id)a3 networkRequester:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SHHapticsFetcher;
  v9 = [(SHHapticsFetcher *)&v13 init];
  v10 = v9;
  if (v9)
  {
    bundleIdentifier = v9->_bundleIdentifier;
    v9->_bundleIdentifier = (NSString *)@"com.apple.shazamd";

    v10->_clientType = 1;
    objc_storeStrong((id *)&v10->_urlBuilder, a3);
    objc_storeStrong((id *)&v10->_networkRequester, a4);
    v10->_allowsCachedAssets = 0;
  }

  return v10;
}

- (void)hasHapticTrackForMediaItem:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 properties];
  id v9 = [v8 count];

  if (v9)
  {
    objc_initWeak(&location, self);
    v10 = [(SHHapticsFetcher *)self urlBuilder];
    v11 = [(SHHapticsFetcher *)self bundleIdentifier];
    int64_t v12 = [(SHHapticsFetcher *)self clientType];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100043000;
    v14[3] = &unk_100075F70;
    id v16 = v7;
    id v15 = v6;
    objc_copyWeak(&v17, &location);
    [v10 loadHapticsEndpointForClientIdentifier:v11 clientType:v12 callback:v14];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_super v13 = +[SHCoreError errorWithCode:400 underlyingError:0 keyOverrides:&__NSDictionary0__struct];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v13);
  }
}

- (void)hapticsForMediaItems:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    objc_initWeak(&location, self);
    id v8 = [(SHHapticsFetcher *)self urlBuilder];
    id v9 = [(SHHapticsFetcher *)self bundleIdentifier];
    int64_t v10 = [(SHHapticsFetcher *)self clientType];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10004332C;
    v11[3] = &unk_100075F70;
    id v13 = v7;
    id v12 = v6;
    objc_copyWeak(&v14, &location);
    [v8 loadHapticsEndpointForClientIdentifier:v9 clientType:v10 callback:v11];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void *, void))v7 + 2))(v7, &__NSArray0__struct, 0);
  }
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int64_t)clientType
{
  return self->_clientType;
}

- (SHShazamKitServerURLBuilder)urlBuilder
{
  return self->_urlBuilder;
}

- (SHHapticsEndpointRequester)networkRequester
{
  return self->_networkRequester;
}

- (BOOL)allowsCachedAssets
{
  return self->_allowsCachedAssets;
}

- (void)setAllowsCachedAssets:(BOOL)a3
{
  self->_allowsCachedAssets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkRequester, 0);
  objc_storeStrong((id *)&self->_urlBuilder, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end