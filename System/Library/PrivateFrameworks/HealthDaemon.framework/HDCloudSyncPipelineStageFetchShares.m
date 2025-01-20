@interface HDCloudSyncPipelineStageFetchShares
- (BOOL)fetchAllShares;
- (NSArray)shares;
- (void)main;
- (void)setFetchAllShares:(BOOL)a3;
@end

@implementation HDCloudSyncPipelineStageFetchShares

- (void)main
{
  v3 = [HDCloudSyncFetchSharesOperation alloc];
  v4 = [(HDCloudSyncOperation *)self configuration];
  v5 = [(HDCloudSyncFetchSharesOperation *)v3 initWithConfiguration:v4 cloudState:0];

  [(HDCloudSyncFetchSharesOperation *)v5 setFetchAllShares:self->_fetchAllShares];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__HDCloudSyncPipelineStageFetchShares_main__block_invoke;
  v10[3] = &unk_1E6306DF8;
  v10[4] = self;
  [(HDCloudSyncOperation *)v5 setOnSuccess:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__HDCloudSyncPipelineStageFetchShares_main__block_invoke_2;
  v9[3] = &unk_1E62F2950;
  v9[4] = self;
  [(HDCloudSyncOperation *)v5 setOnError:v9];
  v6 = [(HDCloudSyncOperation *)self progress];
  v7 = [(HDCloudSyncOperation *)v5 progress];
  v8 = [(HDCloudSyncOperation *)self progress];
  objc_msgSend(v6, "addChild:withPendingUnitCount:", v7, objc_msgSend(v8, "totalUnitCount"));

  [(HDCloudSyncOperation *)v5 start];
}

uint64_t __43__HDCloudSyncPipelineStageFetchShares_main__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 shares];
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 136);
  *(void *)(v4 + 136) = v3;

  v6 = *(void **)(a1 + 32);

  return [v6 finishWithSuccess:1 error:0];
}

uint64_t __43__HDCloudSyncPipelineStageFetchShares_main__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithSuccess:0 error:a3];
}

- (BOOL)fetchAllShares
{
  return self->_fetchAllShares;
}

- (void)setFetchAllShares:(BOOL)a3
{
  self->_fetchAllShares = a3;
}

- (NSArray)shares
{
  return self->_shares;
}

- (void).cxx_destruct
{
}

@end