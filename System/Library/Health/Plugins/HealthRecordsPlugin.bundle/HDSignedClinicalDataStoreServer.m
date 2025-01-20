@interface HDSignedClinicalDataStoreServer
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
+ (id)taskIdentifier;
- (HDHealthRecordsProfileExtension)profileExtension;
- (HDSignedClinicalDataManager)signedClinicalDataManager;
- (HDSignedClinicalDataStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 profileExtension:(id)a7 signedClinicalDataManager:(id)a8;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_deleteSignedClinicalDataRecord:(id)a3 completion:(id)a4;
- (void)remote_fetchCurrentRegistryIssuerContentVersionWithCompletion:(id)a3;
- (void)remote_fetchCurrentRegistryPublicKeyContentVersionWithCompletion:(id)a3;
- (void)remote_fetchPublicKeyEntriesWithCompletion:(id)a3;
- (void)remote_fetchPublicKeyWithKeyID:(id)a3 completion:(id)a4;
- (void)remote_fetchSignedClinicalDataGroupBackingMedicalRecord:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)remote_insertOrReplaceIssuerRegistryEntries:(id)a3 completion:(id)a4;
- (void)remote_insertOrReplacePublicKeyEntries:(id)a3 completion:(id)a4;
- (void)remote_parseSignedClinicalData:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)remote_reextractSignedClinicalDataRecordsForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)remote_removePublicKeyEntriesWithKeyIDs:(id)a3 completion:(id)a4;
- (void)remote_reverifySignatureForRecord:(id)a3 completion:(id)a4;
- (void)remote_setRegistryIssuerContentVersion:(id)a3 completion:(id)a4;
- (void)remote_setRegistryPublicKeyContentVersion:(id)a3 completion:(id)a4;
- (void)remote_storeSignedClinicalData:(id)a3 completion:(id)a4;
- (void)remote_triggerDownloadIssuerRegistryWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)remote_triggerDownloadPublicKeysWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)setProfileExtension:(id)a3;
- (void)setSignedClinicalDataManager:(id)a3;
@end

@implementation HDSignedClinicalDataStoreServer

- (HDSignedClinicalDataStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 profileExtension:(id)a7 signedClinicalDataManager:(id)a8
{
  id v14 = a7;
  id v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)HDSignedClinicalDataStoreServer;
  v16 = [(HDSignedClinicalDataStoreServer *)&v19 initWithUUID:a3 configuration:a4 client:a5 delegate:a6];
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_profileExtension, v14);
    objc_storeStrong((id *)&v17->_signedClinicalDataManager, a8);
  }

  return v17;
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a5;
  v16 = [v15 profile];
  v17 = [v16 profileExtensionWithIdentifier:HKHealthRecordsPluginIdentifier];

  v18 = [v17 signedClinicalDataManager];
  if (v18)
  {
    id v19 = [objc_alloc((Class)a1) initWithUUID:v12 configuration:v13 client:v15 delegate:v14 profileExtension:v17 signedClinicalDataManager:v18];
  }
  else
  {
    v20 = (objc_class *)objc_opt_class();
    uint64_t v21 = NSStringFromClass(v20);
    v22 = [v15 profile];

    +[NSError hk_assignError:a7, 100, @"Cannot use %@ on profile without SCD manager: %@", v21, v22 code format];
    id v19 = 0;
    id v15 = (id)v21;
  }

  return v19;
}

- (void)remote_parseSignedClinicalData:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
}

- (void)remote_storeSignedClinicalData:(id)a3 completion:(id)a4
{
}

- (void)remote_fetchSignedClinicalDataGroupBackingMedicalRecord:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  signedClinicalDataManager = self->_signedClinicalDataManager;
  id v13 = 0;
  v8 = (void (**)(id, void *, void))a5;
  v9 = [(HDSignedClinicalDataManager *)signedClinicalDataManager signedClinicalDataGroupBackingMedicalRecord:a3 options:a4 error:&v13];
  id v10 = v13;
  v11 = v10;
  if (v9) {
    id v12 = 0;
  }
  else {
    id v12 = v10;
  }
  ((void (**)(id, void *, id))v8)[2](v8, v9, v12);
}

- (void)remote_deleteSignedClinicalDataRecord:(id)a3 completion:(id)a4
{
  signedClinicalDataManager = self->_signedClinicalDataManager;
  id v9 = 0;
  v6 = (void (**)(id, id, id))a4;
  BOOL v7 = [(HDSignedClinicalDataManager *)signedClinicalDataManager deleteSignedClinicalDataRecord:a3 error:&v9];
  id v8 = v9;
  v6[2](v6, (id)v7, v8);
}

- (void)remote_reverifySignatureForRecord:(id)a3 completion:(id)a4
{
}

- (void)remote_reextractSignedClinicalDataRecordsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)remote_fetchCurrentRegistryIssuerContentVersionWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, void *))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  v6 = [WeakRetained createSignedClinicalDataRegistry];

  id v11 = 0;
  BOOL v7 = [v6 issuerContentVersionWithError:&v11];
  id v8 = v11;
  id v9 = v8;
  if (v7) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v8 == 0;
  }
  if (v10 || !objc_msgSend(v8, "hk_isHealthKitErrorWithCode:", 11)) {
    v4[2](v4, v7, v9);
  }
  else {
    v4[2](v4, &off_11CF00, 0);
  }
}

- (void)remote_setRegistryIssuerContentVersion:(id)a3 completion:(id)a4
{
  p_profileExtension = &self->_profileExtension;
  v6 = (void (**)(id, id, id))a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profileExtension);
  id v9 = [WeakRetained createSignedClinicalDataRegistry];

  id v12 = 0;
  id v10 = [v9 setIssuerContentVersion:v7 error:&v12];

  id v11 = v12;
  v6[2](v6, v10, v11);
}

- (void)remote_insertOrReplaceIssuerRegistryEntries:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, id))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  id v9 = [WeakRetained createSignedClinicalDataRegistry];

  id v17 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_184E0;
  v14[3] = &unk_112130;
  id v10 = v6;
  id v15 = v10;
  id v11 = v9;
  id v16 = v11;
  id v12 = [v11 performTransactionWithError:&v17 block:v14];
  id v13 = v17;
  if (v12) {
    [(HDSignedClinicalDataManager *)self->_signedClinicalDataManager updateIssuerTitlesUsingRegistry:v11];
  }
  v7[2](v7, v12, v13);
}

- (void)remote_fetchCurrentRegistryPublicKeyContentVersionWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, void *))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  id v6 = [WeakRetained createSignedClinicalDataRegistry];

  id v11 = 0;
  id v7 = [v6 publicKeyContentVersionWithError:&v11];
  id v8 = v11;
  id v9 = v8;
  if (v7) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v8 == 0;
  }
  if (v10 || !objc_msgSend(v8, "hk_isHealthKitErrorWithCode:", 11)) {
    v4[2](v4, v7, v9);
  }
  else {
    v4[2](v4, &off_11CF00, 0);
  }
}

- (void)remote_setRegistryPublicKeyContentVersion:(id)a3 completion:(id)a4
{
  p_profileExtension = &self->_profileExtension;
  id v6 = (void (**)(id, id, id))a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profileExtension);
  id v9 = [WeakRetained createSignedClinicalDataRegistry];

  id v12 = 0;
  id v10 = [v9 setPublicKeyContentVersion:v7 error:&v12];

  id v11 = v12;
  v6[2](v6, v10, v11);
}

- (void)remote_insertOrReplacePublicKeyEntries:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, id))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  id v9 = [WeakRetained createSignedClinicalDataRegistry];

  id v16 = v9;
  id v17 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_188C4;
  v14[3] = &unk_112130;
  id v15 = v6;
  id v10 = v9;
  id v11 = v6;
  id v12 = [v10 performTransactionWithError:&v17 block:v14];
  id v13 = v17;
  v7[2](v7, v12, v13);
}

- (void)remote_fetchPublicKeyWithKeyID:(id)a3 completion:(id)a4
{
  p_profileExtension = &self->_profileExtension;
  id v6 = (void (**)(id, void *, void))a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profileExtension);
  id v10 = [WeakRetained createSignedClinicalDataRegistry];

  id v9 = [v10 publicKeyWithID:v7];

  v6[2](v6, v9, 0);
}

- (void)remote_fetchPublicKeyEntriesWithCompletion:(id)a3
{
  v4 = (void (**)(id, void, id))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  id v6 = [WeakRetained createSignedClinicalDataRegistry];

  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_18CA0;
  id v19 = sub_18CB0;
  id v20 = 0;
  id v13 = &v15;
  id v14 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_18CB8;
  v11[3] = &unk_112158;
  id v7 = v6;
  id v12 = v7;
  unsigned int v8 = [v7 performTransactionWithError:&v14 block:v11];
  id v9 = v14;
  if (v8) {
    uint64_t v10 = v16[5];
  }
  else {
    uint64_t v10 = 0;
  }
  v4[2](v4, v10, v9);

  _Block_object_dispose(&v15, 8);
}

- (void)remote_removePublicKeyEntriesWithKeyIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, id))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  id v9 = [WeakRetained createSignedClinicalDataRegistry];

  id v16 = v9;
  id v17 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_18E3C;
  v14[3] = &unk_112130;
  id v15 = v6;
  id v10 = v9;
  id v11 = v6;
  id v12 = [v10 performTransactionWithError:&v17 block:v14];
  id v13 = v17;
  v7[2](v7, v12, v13);
}

- (void)remote_triggerDownloadIssuerRegistryWithOptions:(unint64_t)a3 completion:(id)a4
{
}

- (void)remote_triggerDownloadPublicKeysWithOptions:(unint64_t)a3 completion:(id)a4
{
}

- (id)exportedInterface
{
  return (id)_HKSignedClinicalDataStoreServerInterface(self, a2);
}

- (id)remoteInterface
{
  return (id)_HKSignedClinicalDataStoreClientInterface(self, a2);
}

+ (id)taskIdentifier
{
  return +[HKSignedClinicalDataStore taskIdentifier];
}

- (HDHealthRecordsProfileExtension)profileExtension
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);

  return (HDHealthRecordsProfileExtension *)WeakRetained;
}

- (void)setProfileExtension:(id)a3
{
}

- (HDSignedClinicalDataManager)signedClinicalDataManager
{
  return self->_signedClinicalDataManager;
}

- (void)setSignedClinicalDataManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signedClinicalDataManager, 0);

  objc_destroyWeak((id *)&self->_profileExtension);
}

@end