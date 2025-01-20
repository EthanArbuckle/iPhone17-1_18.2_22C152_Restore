@interface HKClinicalProviderServiceStore
- (HKClinicalProviderServiceStore)init;
- (HKClinicalProviderServiceStore)initWithHealthStore:(id)a3;
- (void)_fetchServerProxyWithHandler:(id)a3 errorHandler:(id)a4;
- (void)cancelInFlightSearchQueriesWithCompletion:(id)a3;
- (void)fetchLogoDataForBrand:(id)a3 scaleKey:(id)a4 completion:(id)a5;
- (void)fetchLogoDataForFeaturedBrandsAtScaleKey:(id)a3 completion:(id)a4;
- (void)fetchRemoteGatewayWithExternalID:(id)a3 batchID:(id)a4 completion:(id)a5;
- (void)fetchRemoteProviderWithExternalID:(id)a3 batchID:(id)a4 completion:(id)a5;
- (void)fetchRemoteSearchResultsPageForQuery:(id)a3 completion:(id)a4;
@end

@implementation HKClinicalProviderServiceStore

- (HKClinicalProviderServiceStore)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKClinicalProviderServiceStore)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKClinicalProviderServiceStore;
  v5 = [(HKClinicalProviderServiceStore *)&v12 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F0A818]);
    v7 = [(id)objc_opt_class() taskIdentifier];
    v8 = [MEMORY[0x263F08C38] UUID];
    uint64_t v9 = [v6 initWithHealthStore:v4 taskIdentifier:v7 exportedObject:v5 taskUUID:v8];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v9;
  }
  return v5;
}

- (void)fetchRemoteSearchResultsPageForQuery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __82__HKClinicalProviderServiceStore_fetchRemoteSearchResultsPageForQuery_completion___block_invoke;
  v12[3] = &unk_2645EF6F0;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __82__HKClinicalProviderServiceStore_fetchRemoteSearchResultsPageForQuery_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKClinicalProviderServiceStore *)self _fetchServerProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __82__HKClinicalProviderServiceStore_fetchRemoteSearchResultsPageForQuery_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchRemoteSearchResultsPageForQuery:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __82__HKClinicalProviderServiceStore_fetchRemoteSearchResultsPageForQuery_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancelInFlightSearchQueriesWithCompletion:(id)a3
{
  id v4 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __76__HKClinicalProviderServiceStore_cancelInFlightSearchQueriesWithCompletion___block_invoke;
  v8[3] = &unk_2645EF718;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76__HKClinicalProviderServiceStore_cancelInFlightSearchQueriesWithCompletion___block_invoke_2;
  v6[3] = &unk_2645EE630;
  id v7 = v9;
  id v5 = v9;
  [(HKClinicalProviderServiceStore *)self _fetchServerProxyWithHandler:v8 errorHandler:v6];
}

uint64_t __76__HKClinicalProviderServiceStore_cancelInFlightSearchQueriesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_cancelInFlightSearchQueriesWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __76__HKClinicalProviderServiceStore_cancelInFlightSearchQueriesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchRemoteProviderWithExternalID:(id)a3 batchID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a5];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __87__HKClinicalProviderServiceStore_fetchRemoteProviderWithExternalID_batchID_completion___block_invoke;
  v16[3] = &unk_2645EF740;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __87__HKClinicalProviderServiceStore_fetchRemoteProviderWithExternalID_batchID_completion___block_invoke_2;
  v14[3] = &unk_2645EE630;
  id v15 = v19;
  id v11 = v19;
  id v12 = v9;
  id v13 = v8;
  [(HKClinicalProviderServiceStore *)self _fetchServerProxyWithHandler:v16 errorHandler:v14];
}

uint64_t __87__HKClinicalProviderServiceStore_fetchRemoteProviderWithExternalID_batchID_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchRemoteProviderWithExternalID:batchID:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __87__HKClinicalProviderServiceStore_fetchRemoteProviderWithExternalID_batchID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchRemoteGatewayWithExternalID:(id)a3 batchID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a5];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __86__HKClinicalProviderServiceStore_fetchRemoteGatewayWithExternalID_batchID_completion___block_invoke;
  v16[3] = &unk_2645EF740;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __86__HKClinicalProviderServiceStore_fetchRemoteGatewayWithExternalID_batchID_completion___block_invoke_2;
  v14[3] = &unk_2645EE630;
  id v15 = v19;
  id v11 = v19;
  id v12 = v9;
  id v13 = v8;
  [(HKClinicalProviderServiceStore *)self _fetchServerProxyWithHandler:v16 errorHandler:v14];
}

uint64_t __86__HKClinicalProviderServiceStore_fetchRemoteGatewayWithExternalID_batchID_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchRemoteGatewayWithExternalID:batchID:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __86__HKClinicalProviderServiceStore_fetchRemoteGatewayWithExternalID_batchID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchLogoDataForBrand:(id)a3 scaleKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a5];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __76__HKClinicalProviderServiceStore_fetchLogoDataForBrand_scaleKey_completion___block_invoke;
  v16[3] = &unk_2645EF740;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __76__HKClinicalProviderServiceStore_fetchLogoDataForBrand_scaleKey_completion___block_invoke_2;
  v14[3] = &unk_2645EE630;
  id v15 = v19;
  id v11 = v19;
  id v12 = v9;
  id v13 = v8;
  [(HKClinicalProviderServiceStore *)self _fetchServerProxyWithHandler:v16 errorHandler:v14];
}

uint64_t __76__HKClinicalProviderServiceStore_fetchLogoDataForBrand_scaleKey_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchLogoDataForBrand:scaleKey:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __76__HKClinicalProviderServiceStore_fetchLogoDataForBrand_scaleKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchLogoDataForFeaturedBrandsAtScaleKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __86__HKClinicalProviderServiceStore_fetchLogoDataForFeaturedBrandsAtScaleKey_completion___block_invoke;
  v12[3] = &unk_2645EF6F0;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __86__HKClinicalProviderServiceStore_fetchLogoDataForFeaturedBrandsAtScaleKey_completion___block_invoke_2;
  v10[3] = &unk_2645EE630;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKClinicalProviderServiceStore *)self _fetchServerProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __86__HKClinicalProviderServiceStore_fetchLogoDataForFeaturedBrandsAtScaleKey_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchLogoDataForFeaturedBrandsAtScaleKey:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __86__HKClinicalProviderServiceStore_fetchLogoDataForFeaturedBrandsAtScaleKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchServerProxyWithHandler:(id)a3 errorHandler:(id)a4
{
}

- (void).cxx_destruct
{
}

@end