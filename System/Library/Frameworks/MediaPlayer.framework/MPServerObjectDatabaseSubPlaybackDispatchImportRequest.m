@interface MPServerObjectDatabaseSubPlaybackDispatchImportRequest
- (BOOL)performWithDatabaseOperations:(id)a3 error:(id *)a4;
- (MPServerObjectDatabaseSubPlaybackDispatchImportRequest)initWithIdentifiers:(id)a3 playbackResponse:(id)a4;
@end

@implementation MPServerObjectDatabaseSubPlaybackDispatchImportRequest

- (void).cxx_destruct
{
}

- (BOOL)performWithDatabaseOperations:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [(MPServerObjectDatabaseImportRequest *)self payload];
  v7 = [v6 hlsAssetInfo];
  v8 = v7;
  if (v7)
  {
    uint64_t v23 = [v7 playlistURL];
    v9 = [v8 alternateKeyCertificateURL];
    v26 = v9;
    if (!v9)
    {
      v26 = [v8 alternateKeyCertificateURL];
    }
    v24 = v5;
    v10 = [v8 alternateKeyServerURL];
    v25 = v10;
    if (!v10)
    {
      v25 = [v8 keyServerURL];
    }
    v11 = [v8 keyServerAdamID];
    uint64_t v22 = [v11 longLongValue];
    v12 = [v8 keyServerProtocolType];
    uint64_t v13 = [v8 isiTunesStoreStream];
    identifiers = self->_identifiers;
    uint64_t v15 = [v6 expirationDate];
    v16 = (void *)v15;
    if (v15)
    {
      v19 = identifiers;
      v17 = (void *)v23;
      id v5 = v24;
      [v24 importHLSAssetURL:v23 keyCertificateURL:v26 keyServerURL:v25 redeliveryId:v22 protocolType:v12 isiTunesStoreStream:v13 forIdentifiers:v19 expirationDate:v15];
    }
    else
    {
      v21 = [(MPServerObjectDatabaseImportRequest *)self assetURLExpirationDate];
      v20 = identifiers;
      v17 = (void *)v23;
      id v5 = v24;
      [v24 importHLSAssetURL:v23 keyCertificateURL:v26 keyServerURL:v25 redeliveryId:v22 protocolType:v12 isiTunesStoreStream:v13 forIdentifiers:v20 expirationDate:v21];
    }
    if (!v10) {

    }
    if (!v9) {
  }
    }

  return v8 != 0;
}

- (MPServerObjectDatabaseSubPlaybackDispatchImportRequest)initWithIdentifiers:(id)a3 playbackResponse:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPServerObjectDatabaseSubPlaybackDispatchImportRequest;
  v8 = [(MPServerObjectDatabaseImportRequest *)&v11 _initWithPayload:a4];
  v9 = (MPServerObjectDatabaseSubPlaybackDispatchImportRequest *)v8;
  if (v8) {
    objc_storeStrong(v8 + 5, a3);
  }

  return v9;
}

@end