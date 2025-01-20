@interface MPServerObjectDatabaseImportResult
- (MPServerObjectDatabaseImportResult)initWithAnnotatedPayload:(id *)a3 playableAssetIdentifiers:(id)a4 error:(id)a5;
- (MPServerObjectDatabasePlaybackAuthorizationTokenTrustProvider)trustProvider;
- (NSArray)playableAssetIdentifiers;
- (NSError)error;
- (id)annotatedPayload;
@end

@implementation MPServerObjectDatabaseImportResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playableAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_trustProvider, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong(&self->_annotatedPayload, 0);
}

- (NSArray)playableAssetIdentifiers
{
  return self->_playableAssetIdentifiers;
}

- (MPServerObjectDatabasePlaybackAuthorizationTokenTrustProvider)trustProvider
{
  return self->_trustProvider;
}

- (NSError)error
{
  return self->_error;
}

- (id)annotatedPayload
{
  return self->_annotatedPayload;
}

- (MPServerObjectDatabaseImportResult)initWithAnnotatedPayload:(id *)a3 playableAssetIdentifiers:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MPServerObjectDatabaseImportResult;
  v10 = [(MPServerObjectDatabaseImportResult *)&v19 init];
  v11 = v10;
  if (v10)
  {
    if (a3)
    {
      uint64_t v12 = [*a3 copy];
      id annotatedPayload = v11->_annotatedPayload;
      v11->_id annotatedPayload = (id)v12;
    }
    else
    {
      id annotatedPayload = v10->_annotatedPayload;
      v10->_id annotatedPayload = 0;
    }

    uint64_t v14 = [v8 copy];
    playableAssetIdentifiers = v11->_playableAssetIdentifiers;
    v11->_playableAssetIdentifiers = (NSArray *)v14;

    uint64_t v16 = [v9 copy];
    error = v11->_error;
    v11->_error = (NSError *)v16;
  }
  return v11;
}

@end