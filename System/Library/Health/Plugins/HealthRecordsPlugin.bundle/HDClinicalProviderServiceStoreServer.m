@interface HDClinicalProviderServiceStoreServer
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
+ (id)taskIdentifier;
- (HDClinicalProviderServiceStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 providerServiceManager:(id)a7;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_cancelInFlightSearchQueriesWithCompletion:(id)a3;
- (void)remote_fetchLogoDataForBrand:(id)a3 scaleKey:(id)a4 completion:(id)a5;
- (void)remote_fetchLogoDataForFeaturedBrandsAtScaleKey:(id)a3 completion:(id)a4;
- (void)remote_fetchRemoteGatewayWithExternalID:(id)a3 batchID:(id)a4 completion:(id)a5;
- (void)remote_fetchRemoteProviderWithExternalID:(id)a3 batchID:(id)a4 completion:(id)a5;
- (void)remote_fetchRemoteSearchResultsPageForQuery:(id)a3 completion:(id)a4;
@end

@implementation HDClinicalProviderServiceStoreServer

- (HDClinicalProviderServiceStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 providerServiceManager:(id)a7
{
  id v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)HDClinicalProviderServiceStoreServer;
  v14 = [(HDClinicalProviderServiceStoreServer *)&v17 initWithUUID:a3 configuration:a4 client:a5 delegate:a6];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_providerServiceManager, a7);
  }

  return v15;
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = [v14 profile];
  objc_super v17 = [v16 profileExtensionWithIdentifier:HKHealthRecordsPluginIdentifier];

  v18 = [v17 providerServiceManager];
  if (v18)
  {
    id v19 = [objc_alloc((Class)a1) initWithUUID:v12 configuration:v13 client:v14 delegate:v15 providerServiceManager:v18];
  }
  else
  {
    id v20 = +[NSError hk_featureUnavailableForProfileError];
    if (v20)
    {
      if (a7) {
        *a7 = v20;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v19 = 0;
  }

  return v19;
}

- (void)remote_fetchRemoteSearchResultsPageForQuery:(id)a3 completion:(id)a4
{
}

- (void)remote_cancelInFlightSearchQueriesWithCompletion:(id)a3
{
}

- (void)remote_fetchRemoteProviderWithExternalID:(id)a3 batchID:(id)a4 completion:(id)a5
{
}

- (void)remote_fetchRemoteGatewayWithExternalID:(id)a3 batchID:(id)a4 completion:(id)a5
{
}

- (void)remote_fetchLogoDataForBrand:(id)a3 scaleKey:(id)a4 completion:(id)a5
{
}

- (void)remote_fetchLogoDataForFeaturedBrandsAtScaleKey:(id)a3 completion:(id)a4
{
}

- (id)exportedInterface
{
  return (id)_HKClinicalProviderServiceStoreServerInterface(self, a2);
}

- (id)remoteInterface
{
  return (id)_HKClinicalProviderServiceStoreClientInterface(self, a2);
}

+ (id)taskIdentifier
{
  return +[HKClinicalProviderServiceStore taskIdentifier];
}

- (void).cxx_destruct
{
}

@end