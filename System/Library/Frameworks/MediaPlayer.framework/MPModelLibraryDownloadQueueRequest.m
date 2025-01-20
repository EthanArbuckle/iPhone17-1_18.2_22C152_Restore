@interface MPModelLibraryDownloadQueueRequest
+ (BOOL)requiresNetwork;
- (id)newOperationWithResponseHandler:(id)a3;
@end

@implementation MPModelLibraryDownloadQueueRequest

+ (BOOL)requiresNetwork
{
  return 0;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F28B48];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__MPModelLibraryDownloadQueueRequest_newOperationWithResponseHandler___block_invoke;
  v9[3] = &unk_1E57F9140;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 blockOperationWithBlock:v9];

  return v7;
}

void __70__MPModelLibraryDownloadQueueRequest_newOperationWithResponseHandler___block_invoke(uint64_t a1)
{
  id v4 = [[_MPModelLibraryDownloadQueueDataSource alloc] initWithRequest:*(void *)(a1 + 32)];
  v2 = [[MPLazySectionedCollection alloc] initWithDataSource:v4];
  v3 = [[MPModelLibraryDownloadQueueResponse alloc] initWithRequest:*(void *)(a1 + 32)];
  [(MPModelResponse *)v3 setResults:v2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end