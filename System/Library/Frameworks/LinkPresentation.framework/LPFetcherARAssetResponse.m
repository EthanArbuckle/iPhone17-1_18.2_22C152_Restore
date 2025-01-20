@interface LPFetcherARAssetResponse
+ (BOOL)isValidMIMEType:(id)a3;
+ (id)arAssetPropertiesForFetcher:(id)a3;
+ (id)responseForFetcher:(id)a3 withData:(id)a4 MIMEType:(id)a5;
- (LPARAsset)arAsset;
- (LPFetcherARAssetResponse)initWithARAsset:(id)a3 fetcher:(id)a4;
@end

@implementation LPFetcherARAssetResponse

+ (BOOL)isValidMIMEType:(id)a3
{
  return +[LPMIMETypeRegistry isARAssetType:a3];
}

+ (id)arAssetPropertiesForFetcher:(id)a3
{
  v3 = objc_alloc_init(LPARAssetProperties);

  return v3;
}

+ (id)responseForFetcher:(id)a3 withData:(id)a4 MIMEType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 length])
  {
    v11 = [LPARAsset alloc];
    v12 = [a1 arAssetPropertiesForFetcher:v8];
    v13 = [(LPARAsset *)v11 initWithData:v9 MIMEType:v10 properties:v12];

    if (v13) {
      v14 = [[LPFetcherARAssetResponse alloc] initWithARAsset:v13 fetcher:v8];
    }
    else {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (LPFetcherARAssetResponse)initWithARAsset:(id)a3 fetcher:(id)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPFetcherARAssetResponse;
  id v8 = [(LPFetcherResponse *)&v12 initWithState:2 fetcher:a4];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_arAsset, a3);
    id v10 = v9;
  }

  return v9;
}

- (LPARAsset)arAsset
{
  return self->_arAsset;
}

- (void).cxx_destruct
{
}

@end