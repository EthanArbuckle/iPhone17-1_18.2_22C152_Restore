@interface LPFetcherClipMetadataResponse
- (CPSClipMetadata)metadata;
- (LPFetcherClipMetadataResponse)initWithClipMetadata:(id)a3 iconURL:(id)a4 fetcher:(id)a5;
- (NSURL)iconURL;
@end

@implementation LPFetcherClipMetadataResponse

- (LPFetcherClipMetadataResponse)initWithClipMetadata:(id)a3 iconURL:(id)a4 fetcher:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)LPFetcherClipMetadataResponse;
  v11 = [(LPFetcherResponse *)&v15 initWithState:2 fetcher:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_metadata, a3);
    objc_storeStrong((id *)&v12->_iconURL, a4);
    v13 = v12;
  }

  return v12;
}

- (CPSClipMetadata)metadata
{
  return self->_metadata;
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconURL, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

@end