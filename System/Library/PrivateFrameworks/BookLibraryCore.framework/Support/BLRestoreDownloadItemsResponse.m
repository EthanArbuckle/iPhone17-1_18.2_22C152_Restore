@interface BLRestoreDownloadItemsResponse
- (BLStoreDownloadQueueResponse)serverResponse;
- (NSArray)requestItems;
- (void)setRequestItems:(id)a3;
- (void)setServerResponse:(id)a3;
- (void)setServerResponseWithError:(id)a3;
@end

@implementation BLRestoreDownloadItemsResponse

- (void)setServerResponseWithError:(id)a3
{
  id v4 = a3;
  v5 = [[BLStoreDownloadQueueResponse alloc] initWithError:v4 userIdentifier:0];

  serverResponse = self->_serverResponse;
  self->_serverResponse = v5;
}

- (NSArray)requestItems
{
  return self->_requestItems;
}

- (void)setRequestItems:(id)a3
{
}

- (BLStoreDownloadQueueResponse)serverResponse
{
  return self->_serverResponse;
}

- (void)setServerResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverResponse, 0);

  objc_storeStrong((id *)&self->_requestItems, 0);
}

@end