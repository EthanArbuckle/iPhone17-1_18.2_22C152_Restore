@interface THThreadNetworkCredentialsStoreLocalClient
- (NSString)keychainAccessGroup;
- (THThreadNetworkCredentialsBackingStore)backingStore;
- (THThreadNetworkCredentialsStoreLocalClient)initWithKeychainAccessGroup:(id)a3 backingStore:(id)a4;
- (id)initApplePrivateStoreWithBackingStore:(id)a3;
- (id)parseActiveOperationalDataSet:(id)a3;
- (id)parseCredsFromTLVs:(const char *)a3 data_len:(unsigned int)a4;
- (id)parseDataSetFromSpinel:(const char *)a3 data_len:(unsigned int)a4;
- (id)parseDataSetFromTLVs:(const char *)a3 data_len:(unsigned int)a4;
- (id)parseThreadNetworkActiveDataSet:(id)a3;
- (id)setFromSpinelFrame:(const char *)a3 data_len:(unsigned int)a4;
- (void)addPreferredNetworkWithCompletionInternally:(id)a3 borderAgentID:(id)a4 ipV4NwSignature:(id)a5 ipv6NwSignature:(id)a6 wifiSSID:(id)a7 wifiPassword:(id)a8 completion:(id)a9;
- (void)checkIfRecordForPreferredNetworkIsPresentWithCompletion:(id)a3;
- (void)checkIsPreferredNetworkForActiveOperationalDataset:(id)a3 completion:(id)a4;
- (void)cleanThreadKeychainDatabase:(id)a3;
- (void)deleteActiveDataSetRecordForThreadBorderAgent:(id)a3 completion:(id)a4;
- (void)deleteActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup:(id)a3 completion:(id)a4;
- (void)deleteActiveDataSetRecordWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)deleteActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup:(id)a3 completion:(id)a4;
- (void)deletePreferredAndFrozenThreadNetworksWithCompletion:(id)a3;
- (void)deletePreferredNetworkEntryWithCompletion:(id)a3 completion:(id)a4;
- (void)deletePreferredNetworkForNetworkSignatureInternallyWithCompletion:(id)a3 ipv6NwSignature:(id)a4 wifiSSID:(id)a5 completion:(id)a6;
- (void)deletePreferredNetworkWithCompletion:(id)a3;
- (void)deleteRecordForNetwork:(id)a3 completion:(id)a4;
- (void)deleteRecordWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)retrieveActiveDataSetRecordForThreadBorderAgent:(id)a3 completion:(id)a4;
- (void)retrieveActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup:(id)a3 completion:(id)a4;
- (void)retrieveActiveDataSetRecordOnMdnsWithExtendedPANId:(id)a3 completion:(id)a4;
- (void)retrieveActiveDataSetRecordWithExtendedPANId:(id)a3 completion:(id)a4;
- (void)retrieveActiveDataSetRecordWithTLVsForThreadBorderAgent:(id)a3 completion:(id)a4;
- (void)retrieveActiveDataSetRecordWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)retrieveActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup:(id)a3 completion:(id)a4;
- (void)retrieveAllActiveDataSetRecordsForClientKeychainAccessGroup:(id)a3 compleiton:(id)a4;
- (void)retrieveAllActiveDataSetRecordsForClientKeychainAccessGroup:(id)a3 completion:(id)a4;
- (void)retrieveAllActiveDataSetRecordsForNetwork:(id)a3 completion:(id)a4;
- (void)retrieveAllActiveDataSetRecordsWithCompletion:(id)a3;
- (void)retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup:(id)a3 activeFlag:(BOOL)a4 compleiton:(id)a5;
- (void)retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup:(id)a3 activeFlag:(BOOL)a4 completion:(id)a5;
- (void)retrieveAllRecordsForNetwork:(id)a3 completion:(id)a4;
- (void)retrieveAllRecordsWithCompletion:(id)a3;
- (void)retrieveOrGeneratePreferredNetworkInternallyWithCompletion:(id)a3;
- (void)retrievePreferredNetworkInternallyWithCompletion:(id)a3;
- (void)retrievePreferredNetworkOfAnyDSFormatWithCompletion:(id)a3;
- (void)retrievePreferredNetworkWithCompletion:(id)a3;
- (void)retrievePreferredNetworkWithNoScanWithCompletion:(id)a3;
- (void)retrieveRecordWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)retrieveThirdPartyInfo:(id)a3;
- (void)storeCachedAODasPreferredNetwork:(id)a3 completion:(id)a4;
- (void)storeCredentials:(id)a3 forNetwork:(id)a4 completion:(id)a5;
- (void)storeCredentials:(id)a3 waitForSync:(BOOL)a4 forNetwork:(id)a5 completion:(id)a6;
- (void)storeThreadNetworkCredentialActiveDataSet:(id)a3 network:(id)a4 credentials:(id)a5 credentialsDataSet:(id)a6 waitForSync:(BOOL)a7 completion:(id)a8;
- (void)storeThreadNetworkCredentialActiveDataSet:(id)a3 network:(id)a4 credentialsDataSet:(id)a5 waitForSync:(BOOL)a6 completion:(id)a7;
- (void)updatePreferredNetworkInternallyWithCompletion:(id)a3;
- (void)updatePreferredNetworkWithNewDataset:(id)a3 network:(id)a4 credentialsDataSet:(id)a5 completion:(id)a6;
- (void)validateAODInternally:(id)a3 completion:(id)a4;
- (void)validateRecordWithMdnsScanWithDataSet:(id)a3 borderAgentID:(id)a4 completion:(id)a5;
@end

@implementation THThreadNetworkCredentialsStoreLocalClient

- (id)initApplePrivateStoreWithBackingStore:(id)a3
{
  return [(THThreadNetworkCredentialsStoreLocalClient *)self initWithKeychainAccessGroup:@"0000000000" backingStore:a3];
}

- (THThreadNetworkCredentialsStoreLocalClient)initWithKeychainAccessGroup:(id)a3 backingStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)THThreadNetworkCredentialsStoreLocalClient;
  v9 = [(THThreadNetworkCredentialsStoreLocalClient *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keychainAccessGroup, a3);
    objc_storeWeak((id *)&v10->_backingStore, v8);
  }

  return v10;
}

- (void)deleteRecordWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v8)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __90__THThreadNetworkCredentialsStoreLocalClient_deleteRecordWithUniqueIdentifier_completion___block_invoke_2;
    v13[3] = &unk_1004996A8;
    v9 = &v14;
    id v14 = v7;
    id v10 = v7;
    [v8 deleteRecordWithUniqueIdentifier:v6 completion:v13];
  }
  else
  {
    v11 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __90__THThreadNetworkCredentialsStoreLocalClient_deleteRecordWithUniqueIdentifier_completion___block_invoke;
    block[3] = &unk_100499320;
    v9 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v11, block);
  }
}

void __90__THThreadNetworkCredentialsStoreLocalClient_deleteRecordWithUniqueIdentifier_completion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to delete record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__THThreadNetworkCredentialsStoreLocalClient_deleteRecordWithUniqueIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrieveAllRecordsForNetwork:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v8)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __86__THThreadNetworkCredentialsStoreLocalClient_retrieveAllRecordsForNetwork_completion___block_invoke_2;
    v13[3] = &unk_1004996D0;
    v9 = &v14;
    id v14 = v7;
    id v10 = v7;
    [v8 retrieveAllRecordsForNetwork:v6 completion:v13];
  }
  else
  {
    v11 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __86__THThreadNetworkCredentialsStoreLocalClient_retrieveAllRecordsForNetwork_completion___block_invoke;
    block[3] = &unk_100499320;
    v9 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v11, block);
  }
}

void __86__THThreadNetworkCredentialsStoreLocalClient_retrieveAllRecordsForNetwork_completion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __86__THThreadNetworkCredentialsStoreLocalClient_retrieveAllRecordsForNetwork_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  scrubRecords(a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrieveAllRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v5)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __79__THThreadNetworkCredentialsStoreLocalClient_retrieveAllRecordsWithCompletion___block_invoke_2;
    v10[3] = &unk_1004996D0;
    id v6 = &v11;
    id v11 = v4;
    id v7 = v4;
    [v5 retrieveAllRecordsWithCompletion:v10];
  }
  else
  {
    id v8 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __79__THThreadNetworkCredentialsStoreLocalClient_retrieveAllRecordsWithCompletion___block_invoke;
    block[3] = &unk_100499320;
    id v6 = &v13;
    id v13 = v4;
    id v9 = v4;
    dispatch_async(v8, block);
  }
}

void __79__THThreadNetworkCredentialsStoreLocalClient_retrieveAllRecordsWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve all records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__THThreadNetworkCredentialsStoreLocalClient_retrieveAllRecordsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  scrubRecords(a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrieveRecordWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v8)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __92__THThreadNetworkCredentialsStoreLocalClient_retrieveRecordWithUniqueIdentifier_completion___block_invoke_2;
    v13[3] = &unk_1004996F8;
    id v9 = &v14;
    id v14 = v7;
    id v10 = v7;
    [v8 retrieveRecordWithUniqueIdentifier:v6 completion:v13];
  }
  else
  {
    id v11 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __92__THThreadNetworkCredentialsStoreLocalClient_retrieveRecordWithUniqueIdentifier_completion___block_invoke;
    block[3] = &unk_100499320;
    id v9 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v11, block);
  }
}

void __92__THThreadNetworkCredentialsStoreLocalClient_retrieveRecordWithUniqueIdentifier_completion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __92__THThreadNetworkCredentialsStoreLocalClient_retrieveRecordWithUniqueIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteRecordForNetwork:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(THThreadNetworkCredentialsStoreLocalClient *)self keychainAccessGroup];
  id v9 = +[THThreadNetworkCredentialsStoreRecord computedUniqueIdentifierForNetwork:v7 keychainAccessGroup:v8];

  if (v9)
  {
    [(THThreadNetworkCredentialsStoreLocalClient *)self deleteRecordWithUniqueIdentifier:v9 completion:v6];
  }
  else
  {
    id v10 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __80__THThreadNetworkCredentialsStoreLocalClient_deleteRecordForNetwork_completion___block_invoke;
    block[3] = &unk_100499320;
    id v12 = v6;
    dispatch_async(v10, block);
  }
}

void __80__THThreadNetworkCredentialsStoreLocalClient_deleteRecordForNetwork_completion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:4 description:@"Failed to delete record; unable to calculate UUID"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)storeCredentials:(id)a3 forNetwork:(id)a4 completion:(id)a5
{
}

- (void)storeCredentials:(id)a3 waitForSync:(BOOL)a4 forNetwork:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v13)
  {
    id v14 = objc_alloc((Class)THThreadNetworkCredentialsStoreRecord);
    v15 = [(THThreadNetworkCredentialsStoreLocalClient *)self keychainAccessGroup];
    id v16 = [v14 initWithNetwork:v11 credentials:v10 uniqueIdentifier:0 keychainAccessGroup:v15 creationDate:0 lastModificationDate:0];

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __97__THThreadNetworkCredentialsStoreLocalClient_storeCredentials_waitForSync_forNetwork_completion___block_invoke_2;
    v19[3] = &unk_100499460;
    id v20 = v12;
    id v17 = v12;
    [v13 storeRecord:v16 waitForSync:v8 completion:v19];
  }
  else
  {
    v18 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __97__THThreadNetworkCredentialsStoreLocalClient_storeCredentials_waitForSync_forNetwork_completion___block_invoke;
    block[3] = &unk_100499320;
    id v22 = v12;
    id v16 = v12;
    dispatch_async(v18, block);

    id v17 = v22;
  }
}

void __97__THThreadNetworkCredentialsStoreLocalClient_storeCredentials_waitForSync_forNetwork_completion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to store record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __97__THThreadNetworkCredentialsStoreLocalClient_storeCredentials_waitForSync_forNetwork_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteActiveDataSetRecordWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v8)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __103__THThreadNetworkCredentialsStoreLocalClient_deleteActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke_2;
    v13[3] = &unk_1004996A8;
    id v9 = &v14;
    id v14 = v7;
    id v10 = v7;
    [v8 deleteActiveDataSetRecordWithUniqueIdentifier:v6 completion:v13];
  }
  else
  {
    id v11 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __103__THThreadNetworkCredentialsStoreLocalClient_deleteActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke;
    block[3] = &unk_100499320;
    id v9 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v11, block);
  }
}

void __103__THThreadNetworkCredentialsStoreLocalClient_deleteActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to delete active dataset record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __103__THThreadNetworkCredentialsStoreLocalClient_deleteActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteActiveDataSetRecordForThreadBorderAgent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v8)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __103__THThreadNetworkCredentialsStoreLocalClient_deleteActiveDataSetRecordForThreadBorderAgent_completion___block_invoke_2;
    v13[3] = &unk_1004996A8;
    id v9 = &v14;
    id v14 = v7;
    id v10 = v7;
    [v8 deleteActiveDataSetRecordForThreadBorderAgent:v6 completion:v13];
  }
  else
  {
    id v11 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __103__THThreadNetworkCredentialsStoreLocalClient_deleteActiveDataSetRecordForThreadBorderAgent_completion___block_invoke;
    block[3] = &unk_100499320;
    id v9 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v11, block);
  }
}

void __103__THThreadNetworkCredentialsStoreLocalClient_deleteActiveDataSetRecordForThreadBorderAgent_completion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to delete active dataset record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __103__THThreadNetworkCredentialsStoreLocalClient_deleteActiveDataSetRecordForThreadBorderAgent_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrieveAllActiveDataSetRecordsForNetwork:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v8)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __99__THThreadNetworkCredentialsStoreLocalClient_retrieveAllActiveDataSetRecordsForNetwork_completion___block_invoke_2;
    v13[3] = &unk_1004996D0;
    id v9 = &v14;
    id v14 = v7;
    id v10 = v7;
    [v8 retrieveAllActiveDataSetRecordsForNetwork:v6 completion:v13];
  }
  else
  {
    id v11 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __99__THThreadNetworkCredentialsStoreLocalClient_retrieveAllActiveDataSetRecordsForNetwork_completion___block_invoke;
    block[3] = &unk_100499320;
    id v9 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v11, block);
  }
}

void __99__THThreadNetworkCredentialsStoreLocalClient_retrieveAllActiveDataSetRecordsForNetwork_completion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __99__THThreadNetworkCredentialsStoreLocalClient_retrieveAllActiveDataSetRecordsForNetwork_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  scrubRecords(a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrieveAllActiveDataSetRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v5)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __92__THThreadNetworkCredentialsStoreLocalClient_retrieveAllActiveDataSetRecordsWithCompletion___block_invoke_2;
    v10[3] = &unk_1004996D0;
    id v6 = &v11;
    id v11 = v4;
    id v7 = v4;
    [v5 retrieveAllActiveDataSetRecordsWithCompletion:v10];
  }
  else
  {
    BOOL v8 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __92__THThreadNetworkCredentialsStoreLocalClient_retrieveAllActiveDataSetRecordsWithCompletion___block_invoke;
    block[3] = &unk_100499320;
    id v6 = &v13;
    id v13 = v4;
    id v9 = v4;
    dispatch_async(v8, block);
  }
}

void __92__THThreadNetworkCredentialsStoreLocalClient_retrieveAllActiveDataSetRecordsWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve all records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __92__THThreadNetworkCredentialsStoreLocalClient_retrieveAllActiveDataSetRecordsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  scrubRecords(a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrieveActiveDataSetRecordWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v8)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __105__THThreadNetworkCredentialsStoreLocalClient_retrieveActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke_2;
    v13[3] = &unk_100499720;
    id v9 = &v14;
    id v14 = v7;
    id v10 = v7;
    [v8 retrieveActiveDataSetRecordWithUniqueIdentifier:v6 completion:v13];
  }
  else
  {
    id v11 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __105__THThreadNetworkCredentialsStoreLocalClient_retrieveActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke;
    block[3] = &unk_100499320;
    id v9 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v11, block);
  }
}

void __105__THThreadNetworkCredentialsStoreLocalClient_retrieveActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __105__THThreadNetworkCredentialsStoreLocalClient_retrieveActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrieveThirdPartyInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  id v6 = v5;
  if (v5)
  {
    [v5 retrieveThirdPartyInfo:v4];
  }
  else
  {
    id v7 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __69__THThreadNetworkCredentialsStoreLocalClient_retrieveThirdPartyInfo___block_invoke;
    block[3] = &unk_100499320;
    id v9 = v4;
    dispatch_async(v7, block);
  }
}

void __69__THThreadNetworkCredentialsStoreLocalClient_retrieveThirdPartyInfo___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrieveActiveDataSetRecordWithExtendedPANId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v8)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __102__THThreadNetworkCredentialsStoreLocalClient_retrieveActiveDataSetRecordWithExtendedPANId_completion___block_invoke_2;
    v13[3] = &unk_100499720;
    id v9 = &v14;
    id v14 = v7;
    id v10 = v7;
    [v8 retrieveActiveDataSetRecordWithExtendedPANId:v6 completion:v13];
  }
  else
  {
    id v11 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __102__THThreadNetworkCredentialsStoreLocalClient_retrieveActiveDataSetRecordWithExtendedPANId_completion___block_invoke;
    block[3] = &unk_100499320;
    id v9 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v11, block);
  }
}

void __102__THThreadNetworkCredentialsStoreLocalClient_retrieveActiveDataSetRecordWithExtendedPANId_completion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __102__THThreadNetworkCredentialsStoreLocalClient_retrieveActiveDataSetRecordWithExtendedPANId_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrieveActiveDataSetRecordOnMdnsWithExtendedPANId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v8)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __108__THThreadNetworkCredentialsStoreLocalClient_retrieveActiveDataSetRecordOnMdnsWithExtendedPANId_completion___block_invoke_2;
    v13[3] = &unk_100499720;
    id v9 = &v14;
    id v14 = v7;
    id v10 = v7;
    [v8 retrieveActiveDataSetRecordOnMdnsWithExtendedPANId:v6 completion:v13];
  }
  else
  {
    id v11 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __108__THThreadNetworkCredentialsStoreLocalClient_retrieveActiveDataSetRecordOnMdnsWithExtendedPANId_completion___block_invoke;
    block[3] = &unk_100499320;
    id v9 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v11, block);
  }
}

void __108__THThreadNetworkCredentialsStoreLocalClient_retrieveActiveDataSetRecordOnMdnsWithExtendedPANId_completion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __108__THThreadNetworkCredentialsStoreLocalClient_retrieveActiveDataSetRecordOnMdnsWithExtendedPANId_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrieveActiveDataSetRecordWithTLVsForThreadBorderAgent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v8)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __113__THThreadNetworkCredentialsStoreLocalClient_retrieveActiveDataSetRecordWithTLVsForThreadBorderAgent_completion___block_invoke_2;
    v13[3] = &unk_100499720;
    id v9 = &v14;
    id v14 = v7;
    id v10 = v7;
    [v8 retrieveActiveDataSetRecordWithTLVsForThreadBorderAgent:v6 completion:v13];
  }
  else
  {
    id v11 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __113__THThreadNetworkCredentialsStoreLocalClient_retrieveActiveDataSetRecordWithTLVsForThreadBorderAgent_completion___block_invoke;
    block[3] = &unk_100499320;
    id v9 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v11, block);
  }
}

void __113__THThreadNetworkCredentialsStoreLocalClient_retrieveActiveDataSetRecordWithTLVsForThreadBorderAgent_completion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __113__THThreadNetworkCredentialsStoreLocalClient_retrieveActiveDataSetRecordWithTLVsForThreadBorderAgent_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrieveActiveDataSetRecordForThreadBorderAgent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v8)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __105__THThreadNetworkCredentialsStoreLocalClient_retrieveActiveDataSetRecordForThreadBorderAgent_completion___block_invoke_2;
    v13[3] = &unk_100499720;
    id v9 = &v14;
    id v14 = v7;
    id v10 = v7;
    [v8 retrieveActiveDataSetRecordForThreadBorderAgent:v6 completion:v13];
  }
  else
  {
    id v11 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __105__THThreadNetworkCredentialsStoreLocalClient_retrieveActiveDataSetRecordForThreadBorderAgent_completion___block_invoke;
    block[3] = &unk_100499320;
    id v9 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v11, block);
  }
}

void __105__THThreadNetworkCredentialsStoreLocalClient_retrieveActiveDataSetRecordForThreadBorderAgent_completion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __105__THThreadNetworkCredentialsStoreLocalClient_retrieveActiveDataSetRecordForThreadBorderAgent_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrieveAllActiveDataSetRecordsForClientKeychainAccessGroup:(id)a3 completion:(id)a4
{
}

- (void)retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup:(id)a3 activeFlag:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v10)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __136__THThreadNetworkCredentialsStoreLocalClient_retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup_activeFlag_completion___block_invoke_2;
    v15[3] = &unk_1004996D0;
    id v11 = &v16;
    id v16 = v9;
    id v12 = v9;
    [v10 retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup:v8 activeFlag:v6 compleiton:v15];
  }
  else
  {
    id v13 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __136__THThreadNetworkCredentialsStoreLocalClient_retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup_activeFlag_completion___block_invoke;
    block[3] = &unk_100499320;
    id v11 = &v18;
    id v18 = v9;
    id v14 = v9;
    dispatch_async(v13, block);
  }
}

void __136__THThreadNetworkCredentialsStoreLocalClient_retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup_activeFlag_completion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __136__THThreadNetworkCredentialsStoreLocalClient_retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup_activeFlag_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  scrubRecords(a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrieveAllActiveDataSetRecordsForClientKeychainAccessGroup:(id)a3 compleiton:(id)a4
{
}

- (void)retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup:(id)a3 activeFlag:(BOOL)a4 compleiton:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v10)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __136__THThreadNetworkCredentialsStoreLocalClient_retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup_activeFlag_compleiton___block_invoke_2;
    v15[3] = &unk_1004996D0;
    id v11 = &v16;
    id v16 = v9;
    id v12 = v9;
    [v10 retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup:v8 activeFlag:v6 compleiton:v15];
  }
  else
  {
    id v13 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __136__THThreadNetworkCredentialsStoreLocalClient_retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup_activeFlag_compleiton___block_invoke;
    block[3] = &unk_100499320;
    id v11 = &v18;
    id v18 = v9;
    id v14 = v9;
    dispatch_async(v13, block);
  }
}

void __136__THThreadNetworkCredentialsStoreLocalClient_retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup_activeFlag_compleiton___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __136__THThreadNetworkCredentialsStoreLocalClient_retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup_activeFlag_compleiton___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  scrubRecords(a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)checkIfRecordForPreferredNetworkIsPresentWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (!v5)
  {
    id v7 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __102__THThreadNetworkCredentialsStoreLocalClient_checkIfRecordForPreferredNetworkIsPresentWithCompletion___block_invoke;
    block[3] = &unk_100499320;
    id v12 = v4;
    dispatch_async(v7, block);

    id v6 = v12;
    goto LABEL_5;
  }
  if (_os_feature_enabled_impl())
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __102__THThreadNetworkCredentialsStoreLocalClient_checkIfRecordForPreferredNetworkIsPresentWithCompletion___block_invoke_31;
    v9[3] = &unk_100499748;
    id v10 = v4;
    [v5 checkIfRecordForPreferredNetworkIsPresentWithCompletion:v9];
    id v6 = v10;
LABEL_5:

    goto LABEL_9;
  }
  id v8 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[THThreadNetworkCredentialsStoreLocalClient checkIfRecordForPreferredNetworkIsPresentWithCompletion:]();
  }

  (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
LABEL_9:
}

uint64_t __102__THThreadNetworkCredentialsStoreLocalClient_checkIfRecordForPreferredNetworkIsPresentWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __102__THThreadNetworkCredentialsStoreLocalClient_checkIfRecordForPreferredNetworkIsPresentWithCompletion___block_invoke_31(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrievePreferredNetworkWithNoScanWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v5)
  {
    if (_os_feature_enabled_impl())
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = __95__THThreadNetworkCredentialsStoreLocalClient_retrievePreferredNetworkWithNoScanWithCompletion___block_invoke_36;
      v9[3] = &unk_100499720;
      id v10 = v4;
      [v5 retrievePreferredNetworkWithNoScanWithCompletion:v9];
      id v6 = v10;
    }
    else
    {
      id v8 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsStoreLocalClient retrievePreferredNetworkWithNoScanWithCompletion:]();
      }

      id v6 = +[NSError storeError:17 description:@"Feature is unsupported"];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
    }
  }
  else
  {
    id v7 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __95__THThreadNetworkCredentialsStoreLocalClient_retrievePreferredNetworkWithNoScanWithCompletion___block_invoke;
    block[3] = &unk_100499320;
    id v12 = v4;
    dispatch_async(v7, block);

    id v6 = v12;
  }
}

void __95__THThreadNetworkCredentialsStoreLocalClient_retrievePreferredNetworkWithNoScanWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __95__THThreadNetworkCredentialsStoreLocalClient_retrievePreferredNetworkWithNoScanWithCompletion___block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  else
  {
    id v8 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __95__THThreadNetworkCredentialsStoreLocalClient_retrievePreferredNetworkWithNoScanWithCompletion___block_invoke_36_cold_1();
    }
  }
}

- (void)retrievePreferredNetworkWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v5)
  {
    if (_os_feature_enabled_impl())
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = __85__THThreadNetworkCredentialsStoreLocalClient_retrievePreferredNetworkWithCompletion___block_invoke_37;
      v9[3] = &unk_100499720;
      id v10 = v4;
      [v5 retrievePreferredNetworkWithCompletion:v9];
      id v6 = v10;
    }
    else
    {
      id v8 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsStoreLocalClient retrievePreferredNetworkWithCompletion:]();
      }

      id v6 = +[NSError storeError:17 description:@"Feature is unsupported"];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
    }
  }
  else
  {
    uint64_t v7 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __85__THThreadNetworkCredentialsStoreLocalClient_retrievePreferredNetworkWithCompletion___block_invoke;
    block[3] = &unk_100499320;
    id v12 = v4;
    dispatch_async(v7, block);

    id v6 = v12;
  }
}

void __85__THThreadNetworkCredentialsStoreLocalClient_retrievePreferredNetworkWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __85__THThreadNetworkCredentialsStoreLocalClient_retrievePreferredNetworkWithCompletion___block_invoke_37(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  else
  {
    id v8 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __85__THThreadNetworkCredentialsStoreLocalClient_retrievePreferredNetworkWithCompletion___block_invoke_37_cold_1();
    }
  }
}

- (void)retrievePreferredNetworkInternallyWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v5)
  {
    if (_os_feature_enabled_impl())
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = __95__THThreadNetworkCredentialsStoreLocalClient_retrievePreferredNetworkInternallyWithCompletion___block_invoke_38;
      v9[3] = &unk_100499720;
      id v10 = v4;
      [v5 retrievePreferredNetworkInternallyWithCompletion:v9];
      id v6 = v10;
    }
    else
    {
      id v8 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsStoreLocalClient retrievePreferredNetworkInternallyWithCompletion:]();
      }

      id v6 = +[NSError storeError:17 description:@"Feature is unsupported"];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
    }
  }
  else
  {
    uint64_t v7 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __95__THThreadNetworkCredentialsStoreLocalClient_retrievePreferredNetworkInternallyWithCompletion___block_invoke;
    block[3] = &unk_100499320;
    id v12 = v4;
    dispatch_async(v7, block);

    id v6 = v12;
  }
}

void __95__THThreadNetworkCredentialsStoreLocalClient_retrievePreferredNetworkInternallyWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __95__THThreadNetworkCredentialsStoreLocalClient_retrievePreferredNetworkInternallyWithCompletion___block_invoke_38(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  else
  {
    id v8 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __95__THThreadNetworkCredentialsStoreLocalClient_retrievePreferredNetworkInternallyWithCompletion___block_invoke_38_cold_1();
    }
  }
}

- (void)retrievePreferredNetworkOfAnyDSFormatWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v5)
  {
    if (_os_feature_enabled_impl())
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = __98__THThreadNetworkCredentialsStoreLocalClient_retrievePreferredNetworkOfAnyDSFormatWithCompletion___block_invoke_39;
      v9[3] = &unk_100499720;
      id v10 = v4;
      [v5 retrievePreferredNetworkOfAnyDSFormatWithCompletion:v9];
      id v6 = v10;
    }
    else
    {
      id v8 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsStoreLocalClient retrievePreferredNetworkOfAnyDSFormatWithCompletion:]();
      }

      id v6 = +[NSError storeError:17 description:@"Feature is unsupported"];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
    }
  }
  else
  {
    uint64_t v7 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __98__THThreadNetworkCredentialsStoreLocalClient_retrievePreferredNetworkOfAnyDSFormatWithCompletion___block_invoke;
    block[3] = &unk_100499320;
    id v12 = v4;
    dispatch_async(v7, block);

    id v6 = v12;
  }
}

void __98__THThreadNetworkCredentialsStoreLocalClient_retrievePreferredNetworkOfAnyDSFormatWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __98__THThreadNetworkCredentialsStoreLocalClient_retrievePreferredNetworkOfAnyDSFormatWithCompletion___block_invoke_39(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrieveOrGeneratePreferredNetworkInternallyWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v5)
  {
    if (_os_feature_enabled_impl())
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = __105__THThreadNetworkCredentialsStoreLocalClient_retrieveOrGeneratePreferredNetworkInternallyWithCompletion___block_invoke_40;
      v9[3] = &unk_100499720;
      id v10 = v4;
      [v5 retrieveOrGeneratePreferredNetworkInternallyWithCompletion:v9];
      id v6 = v10;
    }
    else
    {
      id v8 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsStoreLocalClient retrieveOrGeneratePreferredNetworkInternallyWithCompletion:]();
      }

      id v6 = +[NSError storeError:17 description:@"Feature is unsupported"];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
    }
  }
  else
  {
    uint64_t v7 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __105__THThreadNetworkCredentialsStoreLocalClient_retrieveOrGeneratePreferredNetworkInternallyWithCompletion___block_invoke;
    block[3] = &unk_100499320;
    id v12 = v4;
    dispatch_async(v7, block);

    id v6 = v12;
  }
}

void __105__THThreadNetworkCredentialsStoreLocalClient_retrieveOrGeneratePreferredNetworkInternallyWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __105__THThreadNetworkCredentialsStoreLocalClient_retrieveOrGeneratePreferredNetworkInternallyWithCompletion___block_invoke_40(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addPreferredNetworkWithCompletionInternally:(id)a3 borderAgentID:(id)a4 ipV4NwSignature:(id)a5 ipv6NwSignature:(id)a6 wifiSSID:(id)a7 wifiPassword:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v22)
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = __169__THThreadNetworkCredentialsStoreLocalClient_addPreferredNetworkWithCompletionInternally_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion___block_invoke_2;
    v27[3] = &unk_1004996A8;
    v23 = &v28;
    id v28 = v21;
    id v24 = v21;
    [v22 addPreferredNetworkWithCompletionInternally:v15 borderAgentID:v16 ipV4NwSignature:v17 ipv6NwSignature:v18 wifiSSID:v19 wifiPassword:v20 completion:v27];
  }
  else
  {
    v25 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __169__THThreadNetworkCredentialsStoreLocalClient_addPreferredNetworkWithCompletionInternally_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion___block_invoke;
    block[3] = &unk_100499320;
    v23 = &v30;
    id v30 = v21;
    id v26 = v21;
    dispatch_async(v25, block);
  }
}

void __169__THThreadNetworkCredentialsStoreLocalClient_addPreferredNetworkWithCompletionInternally_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __169__THThreadNetworkCredentialsStoreLocalClient_addPreferredNetworkWithCompletionInternally_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deletePreferredNetworkForNetworkSignatureInternallyWithCompletion:(id)a3 ipv6NwSignature:(id)a4 wifiSSID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v14)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __148__THThreadNetworkCredentialsStoreLocalClient_deletePreferredNetworkForNetworkSignatureInternallyWithCompletion_ipv6NwSignature_wifiSSID_completion___block_invoke_2;
    v19[3] = &unk_1004996A8;
    id v15 = &v20;
    id v20 = v13;
    id v16 = v13;
    [v14 deletePreferredNetworkForNetworkSignatureInternallyWithCompletion:v10 ipv6NwSignature:v11 wifiSSID:v12 completion:v19];
  }
  else
  {
    id v17 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __148__THThreadNetworkCredentialsStoreLocalClient_deletePreferredNetworkForNetworkSignatureInternallyWithCompletion_ipv6NwSignature_wifiSSID_completion___block_invoke;
    block[3] = &unk_100499320;
    id v15 = &v22;
    id v22 = v13;
    id v18 = v13;
    dispatch_async(v17, block);
  }
}

void __148__THThreadNetworkCredentialsStoreLocalClient_deletePreferredNetworkForNetworkSignatureInternallyWithCompletion_ipv6NwSignature_wifiSSID_completion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __148__THThreadNetworkCredentialsStoreLocalClient_deletePreferredNetworkForNetworkSignatureInternallyWithCompletion_ipv6NwSignature_wifiSSID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deletePreferredNetworkEntryWithCompletion:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v8)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __99__THThreadNetworkCredentialsStoreLocalClient_deletePreferredNetworkEntryWithCompletion_completion___block_invoke_2;
    v13[3] = &unk_1004996A8;
    id v9 = &v14;
    id v14 = v7;
    id v10 = v7;
    [v8 deletePreferredNetworkEntryWithCompletion:v6 completion:v13];
  }
  else
  {
    id v11 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __99__THThreadNetworkCredentialsStoreLocalClient_deletePreferredNetworkEntryWithCompletion_completion___block_invoke;
    block[3] = &unk_100499320;
    id v9 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v11, block);
  }
}

void __99__THThreadNetworkCredentialsStoreLocalClient_deletePreferredNetworkEntryWithCompletion_completion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __99__THThreadNetworkCredentialsStoreLocalClient_deletePreferredNetworkEntryWithCompletion_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deletePreferredNetworkWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v5)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __83__THThreadNetworkCredentialsStoreLocalClient_deletePreferredNetworkWithCompletion___block_invoke_2;
    v10[3] = &unk_1004996A8;
    id v6 = &v11;
    id v11 = v4;
    id v7 = v4;
    [v5 deletePreferredNetworkWithCompletion:v10];
  }
  else
  {
    id v8 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __83__THThreadNetworkCredentialsStoreLocalClient_deletePreferredNetworkWithCompletion___block_invoke;
    block[3] = &unk_100499320;
    id v6 = &v13;
    id v13 = v4;
    id v9 = v4;
    dispatch_async(v8, block);
  }
}

void __83__THThreadNetworkCredentialsStoreLocalClient_deletePreferredNetworkWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __83__THThreadNetworkCredentialsStoreLocalClient_deletePreferredNetworkWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deletePreferredAndFrozenThreadNetworksWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v5)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __99__THThreadNetworkCredentialsStoreLocalClient_deletePreferredAndFrozenThreadNetworksWithCompletion___block_invoke_2;
    v10[3] = &unk_1004996A8;
    id v6 = &v11;
    id v11 = v4;
    id v7 = v4;
    [v5 deletePreferredAndFrozenThreadNetworksWithCompletion:v10];
  }
  else
  {
    id v8 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __99__THThreadNetworkCredentialsStoreLocalClient_deletePreferredAndFrozenThreadNetworksWithCompletion___block_invoke;
    block[3] = &unk_100499320;
    id v6 = &v13;
    id v13 = v4;
    id v9 = v4;
    dispatch_async(v8, block);
  }
}

void __99__THThreadNetworkCredentialsStoreLocalClient_deletePreferredAndFrozenThreadNetworksWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to delete all records locally; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __99__THThreadNetworkCredentialsStoreLocalClient_deletePreferredAndFrozenThreadNetworksWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)storeCachedAODasPreferredNetwork:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v8)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __90__THThreadNetworkCredentialsStoreLocalClient_storeCachedAODasPreferredNetwork_completion___block_invoke_2;
    v13[3] = &unk_100499460;
    id v9 = &v14;
    id v14 = v7;
    id v10 = v7;
    [v8 storeCachedAODasPreferredNetwork:v6 completion:v13];
  }
  else
  {
    id v11 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __90__THThreadNetworkCredentialsStoreLocalClient_storeCachedAODasPreferredNetwork_completion___block_invoke;
    block[3] = &unk_100499320;
    id v9 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v11, block);
  }
}

void __90__THThreadNetworkCredentialsStoreLocalClient_storeCachedAODasPreferredNetwork_completion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to store record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__THThreadNetworkCredentialsStoreLocalClient_storeCachedAODasPreferredNetwork_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)storeThreadNetworkCredentialActiveDataSet:(id)a3 network:(id)a4 credentialsDataSet:(id)a5 waitForSync:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v16)
  {
    id v17 = [v14 dataSetArray];
    id v18 = [(THThreadNetworkCredentialsStoreLocalClient *)self parseThreadNetworkActiveDataSet:v17];

    if (v18)
    {
      id v19 = objc_alloc((Class)THThreadNetworkCredentialsActiveDataSetRecord);
      id v20 = [(THThreadNetworkCredentialsStoreLocalClient *)self keychainAccessGroup];
      id v21 = [v19 initWithBorderAgent:v12 credentialsDataSet:v14 network:v13 credentials:v18 uniqueIdentifier:0 keychainAccessGroup:v20 creationDate:0 lastModificationDate:0];

      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = __138__THThreadNetworkCredentialsStoreLocalClient_storeThreadNetworkCredentialActiveDataSet_network_credentialsDataSet_waitForSync_completion___block_invoke_2;
      v25[3] = &unk_100499460;
      id v26 = v15;
      [v16 storeThreadCredentialActiveDataSetRecord:v21 waitForSync:v8 completion:v25];
    }
    else
    {
      v23 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsStoreLocalClient storeThreadNetworkCredentialActiveDataSet:network:credentialsDataSet:waitForSync:completion:]();
      }

      id v24 = dispatch_get_global_queue(0, 0);
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = __138__THThreadNetworkCredentialsStoreLocalClient_storeThreadNetworkCredentialActiveDataSet_network_credentialsDataSet_waitForSync_completion___block_invoke_44;
      v27[3] = &unk_100499320;
      id v28 = v15;
      dispatch_async(v24, v27);

      id v21 = v28;
    }
  }
  else
  {
    id v22 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __138__THThreadNetworkCredentialsStoreLocalClient_storeThreadNetworkCredentialActiveDataSet_network_credentialsDataSet_waitForSync_completion___block_invoke;
    block[3] = &unk_100499320;
    id v30 = v15;
    dispatch_async(v22, block);

    id v18 = v30;
  }
}

void __138__THThreadNetworkCredentialsStoreLocalClient_storeThreadNetworkCredentialActiveDataSet_network_credentialsDataSet_waitForSync_completion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to store record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __138__THThreadNetworkCredentialsStoreLocalClient_storeThreadNetworkCredentialActiveDataSet_network_credentialsDataSet_waitForSync_completion___block_invoke_44(uint64_t a1)
{
  id v2 = +[NSError storeError:29 description:@"Failed to store record; Invalid Dataset"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __138__THThreadNetworkCredentialsStoreLocalClient_storeThreadNetworkCredentialActiveDataSet_network_credentialsDataSet_waitForSync_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updatePreferredNetworkWithNewDataset:(id)a3 network:(id)a4 credentialsDataSet:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v14)
  {
    id v15 = [v12 dataSetArray];
    id v16 = [(THThreadNetworkCredentialsStoreLocalClient *)self parseThreadNetworkActiveDataSet:v15];

    if (v16)
    {
      id v17 = objc_alloc((Class)THThreadNetworkCredentialsActiveDataSetRecord);
      id v18 = [(THThreadNetworkCredentialsStoreLocalClient *)self keychainAccessGroup];
      id v19 = [v17 initWithBorderAgent:v10 credentialsDataSet:v12 network:v11 credentials:v16 uniqueIdentifier:0 keychainAccessGroup:v18 creationDate:0 lastModificationDate:0];

      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = __121__THThreadNetworkCredentialsStoreLocalClient_updatePreferredNetworkWithNewDataset_network_credentialsDataSet_completion___block_invoke_2;
      v23[3] = &unk_100499770;
      id v24 = v13;
      [v14 updatePreferredNetworkWithNewDatasetRecord:v19 completion:v23];
    }
    else
    {
      id v21 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsStoreLocalClient storeThreadNetworkCredentialActiveDataSet:network:credentialsDataSet:waitForSync:completion:]();
      }

      id v22 = dispatch_get_global_queue(0, 0);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = __121__THThreadNetworkCredentialsStoreLocalClient_updatePreferredNetworkWithNewDataset_network_credentialsDataSet_completion___block_invoke_49;
      v25[3] = &unk_100499320;
      id v26 = v13;
      dispatch_async(v22, v25);

      id v19 = v26;
    }
  }
  else
  {
    id v20 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __121__THThreadNetworkCredentialsStoreLocalClient_updatePreferredNetworkWithNewDataset_network_credentialsDataSet_completion___block_invoke;
    block[3] = &unk_100499320;
    id v28 = v13;
    dispatch_async(v20, block);

    id v16 = v28;
  }
}

void __121__THThreadNetworkCredentialsStoreLocalClient_updatePreferredNetworkWithNewDataset_network_credentialsDataSet_completion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to store record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __121__THThreadNetworkCredentialsStoreLocalClient_updatePreferredNetworkWithNewDataset_network_credentialsDataSet_completion___block_invoke_49(uint64_t a1)
{
  id v2 = +[NSError storeError:29 description:@"Failed to store record; Invalid Dataset"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __121__THThreadNetworkCredentialsStoreLocalClient_updatePreferredNetworkWithNewDataset_network_credentialsDataSet_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)storeThreadNetworkCredentialActiveDataSet:(id)a3 network:(id)a4 credentials:(id)a5 credentialsDataSet:(id)a6 waitForSync:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v19)
  {
    id v20 = objc_alloc((Class)THThreadNetworkCredentialsActiveDataSetRecord);
    id v21 = [(THThreadNetworkCredentialsStoreLocalClient *)self keychainAccessGroup];
    id v22 = [v20 initWithBorderAgent:v14 credentialsDataSet:v17 network:v15 credentials:v16 uniqueIdentifier:0 keychainAccessGroup:v21 creationDate:0 lastModificationDate:0];

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = __150__THThreadNetworkCredentialsStoreLocalClient_storeThreadNetworkCredentialActiveDataSet_network_credentials_credentialsDataSet_waitForSync_completion___block_invoke_2;
    v25[3] = &unk_100499460;
    id v26 = v18;
    id v23 = v18;
    [v19 storeThreadCredentialActiveDataSetRecord:v22 waitForSync:v9 completion:v25];
  }
  else
  {
    id v24 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __150__THThreadNetworkCredentialsStoreLocalClient_storeThreadNetworkCredentialActiveDataSet_network_credentials_credentialsDataSet_waitForSync_completion___block_invoke;
    block[3] = &unk_100499320;
    id v28 = v18;
    id v22 = v18;
    dispatch_async(v24, block);

    id v23 = v28;
  }
}

void __150__THThreadNetworkCredentialsStoreLocalClient_storeThreadNetworkCredentialActiveDataSet_network_credentials_credentialsDataSet_waitForSync_completion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to store record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __150__THThreadNetworkCredentialsStoreLocalClient_storeThreadNetworkCredentialActiveDataSet_network_credentials_credentialsDataSet_waitForSync_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrieveActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v8)
  {
    BOOL v9 = [(THThreadNetworkCredentialsStoreLocalClient *)self keychainAccessGroup];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __128__THThreadNetworkCredentialsStoreLocalClient_retrieveActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup_completion___block_invoke_2;
    v13[3] = &unk_100499720;
    id v10 = &v14;
    id v14 = v7;
    id v11 = v7;
    [v8 retrieveActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup:v6 keychainAccessGroup:v9 completion:v13];
  }
  else
  {
    BOOL v9 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __128__THThreadNetworkCredentialsStoreLocalClient_retrieveActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup_completion___block_invoke;
    block[3] = &unk_100499320;
    id v10 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

void __128__THThreadNetworkCredentialsStoreLocalClient_retrieveActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup_completion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __128__THThreadNetworkCredentialsStoreLocalClient_retrieveActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrieveActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v8)
  {
    BOOL v9 = [(THThreadNetworkCredentialsStoreLocalClient *)self keychainAccessGroup];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __128__THThreadNetworkCredentialsStoreLocalClient_retrieveActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup_completion___block_invoke_2;
    v13[3] = &unk_100499720;
    id v10 = &v14;
    id v14 = v7;
    id v11 = v7;
    [v8 retrieveActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup:v6 keychainAccessGroup:v9 completion:v13];
  }
  else
  {
    BOOL v9 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __128__THThreadNetworkCredentialsStoreLocalClient_retrieveActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup_completion___block_invoke;
    block[3] = &unk_100499320;
    id v10 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

void __128__THThreadNetworkCredentialsStoreLocalClient_retrieveActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup_completion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __128__THThreadNetworkCredentialsStoreLocalClient_retrieveActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v8)
  {
    BOOL v9 = [(THThreadNetworkCredentialsStoreLocalClient *)self keychainAccessGroup];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __126__THThreadNetworkCredentialsStoreLocalClient_deleteActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup_completion___block_invoke_2;
    v13[3] = &unk_1004996A8;
    id v10 = &v14;
    id v14 = v7;
    id v11 = v7;
    [v8 deleteActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup:v6 keychainAccessGroup:v9 completion:v13];
  }
  else
  {
    BOOL v9 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __126__THThreadNetworkCredentialsStoreLocalClient_deleteActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup_completion___block_invoke;
    block[3] = &unk_100499320;
    id v10 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

void __126__THThreadNetworkCredentialsStoreLocalClient_deleteActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup_completion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to delete active dataset record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __126__THThreadNetworkCredentialsStoreLocalClient_deleteActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v8)
  {
    BOOL v9 = [(THThreadNetworkCredentialsStoreLocalClient *)self keychainAccessGroup];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __126__THThreadNetworkCredentialsStoreLocalClient_deleteActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup_completion___block_invoke_2;
    v13[3] = &unk_1004996A8;
    id v10 = &v14;
    id v14 = v7;
    id v11 = v7;
    [v8 deleteActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup:v6 keychainAccessGroup:v9 completion:v13];
  }
  else
  {
    BOOL v9 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __126__THThreadNetworkCredentialsStoreLocalClient_deleteActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup_completion___block_invoke;
    block[3] = &unk_100499320;
    id v10 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

void __126__THThreadNetworkCredentialsStoreLocalClient_deleteActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup_completion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to delete active dataset record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __126__THThreadNetworkCredentialsStoreLocalClient_deleteActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)validateRecordWithMdnsScanWithDataSet:(id)a3 borderAgentID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v11)
  {
    id v12 = [(THThreadNetworkCredentialsStoreLocalClient *)self parseActiveOperationalDataSet:v8];
    id v13 = v12;
    if (v12)
    {
      id v14 = [v12 network];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = __109__THThreadNetworkCredentialsStoreLocalClient_validateRecordWithMdnsScanWithDataSet_borderAgentID_completion___block_invoke_3;
      v18[3] = &unk_100499798;
      id v15 = &v20;
      id v20 = v10;
      id v19 = v13;
      [v11 validateRecordWithMdnsScan:v14 borderAgentID:v9 completion:v18];

      id v16 = v19;
    }
    else
    {
      id v16 = dispatch_get_global_queue(0, 0);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = __109__THThreadNetworkCredentialsStoreLocalClient_validateRecordWithMdnsScanWithDataSet_borderAgentID_completion___block_invoke_2;
      v21[3] = &unk_100499320;
      id v15 = &v22;
      id v22 = v10;
      dispatch_async(v16, v21);
    }
  }
  else
  {
    id v17 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __109__THThreadNetworkCredentialsStoreLocalClient_validateRecordWithMdnsScanWithDataSet_borderAgentID_completion___block_invoke;
    block[3] = &unk_100499320;
    id v24 = v10;
    dispatch_async(v17, block);

    id v13 = v24;
  }
}

void __109__THThreadNetworkCredentialsStoreLocalClient_validateRecordWithMdnsScanWithDataSet_borderAgentID_completion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:18 description:@"Failed to run mdns check; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __109__THThreadNetworkCredentialsStoreLocalClient_validateRecordWithMdnsScanWithDataSet_borderAgentID_completion___block_invoke_2(uint64_t a1)
{
  id v2 = +[NSError storeError:18 description:@"Failed to run mdns check; Unable to parse the Active Operational Data Set"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __109__THThreadNetworkCredentialsStoreLocalClient_validateRecordWithMdnsScanWithDataSet_borderAgentID_completion___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = a3;
    id v7 = [v4 network];
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);
  }
  else
  {
    id v6 = *(void (**)(uint64_t, void, void))(v3 + 16);
    id v7 = a3;
    v6(v3, 0, 0);
  }
}

- (void)checkIsPreferredNetworkForActiveOperationalDataset:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
    if (!v8)
    {
      id v11 = dispatch_get_global_queue(0, 0);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = __108__THThreadNetworkCredentialsStoreLocalClient_checkIsPreferredNetworkForActiveOperationalDataset_completion___block_invoke_58;
      v16[3] = &unk_100499320;
      id v17 = v7;
      dispatch_async(v11, v16);

      id v9 = v17;
      goto LABEL_7;
    }
    if (_os_feature_enabled_impl())
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = __108__THThreadNetworkCredentialsStoreLocalClient_checkIsPreferredNetworkForActiveOperationalDataset_completion___block_invoke_59;
      v13[3] = &unk_1004997C0;
      id v14 = v6;
      id v15 = v7;
      [v8 retrievePreferredNetworkWithCompletion:v13];

      id v9 = v14;
LABEL_7:

      goto LABEL_11;
    }
    id v12 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsStoreLocalClient checkIsPreferredNetworkForActiveOperationalDataset:completion:]();
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
  else
  {
    id v10 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __108__THThreadNetworkCredentialsStoreLocalClient_checkIsPreferredNetworkForActiveOperationalDataset_completion___block_invoke;
    block[3] = &unk_100499320;
    id v19 = v7;
    dispatch_async(v10, block);

    id v8 = v19;
  }
LABEL_11:
}

uint64_t __108__THThreadNetworkCredentialsStoreLocalClient_checkIsPreferredNetworkForActiveOperationalDataset_completion___block_invoke(uint64_t a1)
{
  id v2 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __108__THThreadNetworkCredentialsStoreLocalClient_checkIsPreferredNetworkForActiveOperationalDataset_completion___block_invoke_cold_1();
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __108__THThreadNetworkCredentialsStoreLocalClient_checkIsPreferredNetworkForActiveOperationalDataset_completion___block_invoke_58(uint64_t a1)
{
  id v2 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __108__THThreadNetworkCredentialsStoreLocalClient_checkIsPreferredNetworkForActiveOperationalDataset_completion___block_invoke_58_cold_1();
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __108__THThreadNetworkCredentialsStoreLocalClient_checkIsPreferredNetworkForActiveOperationalDataset_completion___block_invoke_59(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (!v5) {
    goto LABEL_9;
  }
  if (a3) {
    goto LABEL_9;
  }
  uint64_t v7 = [v5 credentialsDataSet];
  if (!v7) {
    goto LABEL_9;
  }
  id v8 = (void *)v7;
  id v9 = [v6 credentialsDataSet];
  id v10 = [v9 dataSetArray];

  if (!v10) {
    goto LABEL_9;
  }
  id v11 = *(void **)(a1 + 32);
  id v12 = [v6 credentialsDataSet];
  id v13 = [v12 dataSetArray];
  LODWORD(v11) = [v11 isEqualToData:v13];

  if (v11)
  {
    id v14 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315394;
      id v18 = "-[THThreadNetworkCredentialsStoreLocalClient checkIsPreferredNetworkForActiveOperationalDataset:completion:]_block_invoke";
      __int16 v19 = 1024;
      int v20 = 879;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s : %d: Given dataset matches with Preferred Network", (uint8_t *)&v17, 0x12u);
    }

    id v15 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
LABEL_9:
    id v16 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __108__THThreadNetworkCredentialsStoreLocalClient_checkIsPreferredNetworkForActiveOperationalDataset_completion___block_invoke_59_cold_1();
    }

    id v15 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v15();
}

- (void)updatePreferredNetworkInternallyWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __93__THThreadNetworkCredentialsStoreLocalClient_updatePreferredNetworkInternallyWithCompletion___block_invoke;
    v6[3] = &unk_1004997E8;
    id v7 = v4;
    [v5 updatePreferredNetworkInternallyWithCompletion:v6];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

uint64_t __93__THThreadNetworkCredentialsStoreLocalClient_updatePreferredNetworkInternallyWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cleanThreadKeychainDatabase:(id)a3
{
  id v4 = a3;
  id v5 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v5)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __74__THThreadNetworkCredentialsStoreLocalClient_cleanThreadKeychainDatabase___block_invoke_2;
    v10[3] = &unk_1004996A8;
    id v6 = &v11;
    id v11 = v4;
    id v7 = v4;
    [v5 cleanThreadKeychainDatabase:v10];
  }
  else
  {
    id v8 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __74__THThreadNetworkCredentialsStoreLocalClient_cleanThreadKeychainDatabase___block_invoke;
    block[3] = &unk_100499320;
    id v6 = &v13;
    id v13 = v4;
    id v9 = v4;
    dispatch_async(v8, block);
  }
}

void __74__THThreadNetworkCredentialsStoreLocalClient_cleanThreadKeychainDatabase___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to store record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __74__THThreadNetworkCredentialsStoreLocalClient_cleanThreadKeychainDatabase___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)validateAODInternally:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v8)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __79__THThreadNetworkCredentialsStoreLocalClient_validateAODInternally_completion___block_invoke_2;
    v13[3] = &unk_100499720;
    id v9 = &v14;
    id v14 = v7;
    id v10 = v7;
    [v8 validateAODInternally:v6 completion:v13];
  }
  else
  {
    id v11 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __79__THThreadNetworkCredentialsStoreLocalClient_validateAODInternally_completion___block_invoke;
    block[3] = &unk_100499320;
    id v9 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v11, block);
  }
}

void __79__THThreadNetworkCredentialsStoreLocalClient_validateAODInternally_completion___block_invoke(uint64_t a1)
{
  id v2 = +[NSError storeError:18 description:@"Failed to run mdns check; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __79__THThreadNetworkCredentialsStoreLocalClient_validateAODInternally_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)setFromSpinelFrame:(const char *)a3 data_len:(unsigned int)a4
{
  id v6 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[THThreadNetworkCredentialsStoreLocalClient setFromSpinelFrame:data_len:].cold.9(a4, v6);
  }

  encode_data_into_string((unsigned __int8 *)a3, a4, __b, 0x3E8uLL, 0);
  id v7 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[THThreadNetworkCredentialsStoreLocalClient setFromSpinelFrame:data_len:].cold.8();
  }

  if (a4)
  {
    id v8 = 0;
    id v9 = 0;
    id v10 = 0;
    unsigned __int8 v47 = 0;
    while (1)
    {
      id v11 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v66 = a4;
        *(_WORD *)&v66[4] = 1024;
        *(_DWORD *)&v66[6] = 955;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#MOS : data_len : %d, Line : %d", buf, 0xEu);
      }

      v54 = 0;
      unsigned int v53 = 0;
      int v17 = spinel_datatype_unpack((unsigned __int8 *)a3, a4, "d", v12, v13, v14, v15, v16, (uint64_t)&v54);
      id v18 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v66 = v17;
        *(_WORD *)&v66[4] = 1024;
        *(_DWORD *)&v66[6] = 967;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "#MOS : length : %d, Line : %d", buf, 0xEu);
      }

      if (v17 < 1) {
        goto LABEL_53;
      }
      int v52 = 0;
      v51 = 0;
      unsigned int v50 = 0;
      v46 = &v51;
      int v24 = spinel_datatype_unpack(v54, v53, "iD", v19, v20, v21, v22, v23, (uint64_t)&v52);
      v25 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v66 = v52;
        *(_WORD *)&v66[4] = 1024;
        *(_DWORD *)&v66[6] = v24;
        __int16 v67 = 1024;
        int v68 = 988;
        _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "#MOS : propkey : %d, length: %d, Line : %d", buf, 0x14u);
      }

      if (v24 < 1) {
        goto LABEL_53;
      }
      if (v52 > 69)
      {
        if (v52 == 75)
        {
          v39 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            -[THThreadNetworkCredentialsStoreLocalClient setFromSpinelFrame:data_len:].cold.7(v57, v58, v39);
          }

          uint64_t v40 = +[NSData dataWithBytes:v51 length:v50];

          v41 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138739971;
            *(void *)v66 = v40;
            _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "#MOS : PSKc : %{sensitive}@", buf, 0xCu);
          }

          id v10 = (void *)v40;
          goto LABEL_45;
        }
        if (v52 == 70)
        {
          if (!v50) {
            goto LABEL_53;
          }
          v35 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            -[THThreadNetworkCredentialsStoreLocalClient setFromSpinelFrame:data_len:].cold.4(v63, v64, v35);
          }

          v34 = +[NSData dataWithBytes:v51 length:v50];

          v36 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138739971;
            *(void *)v66 = v34;
            _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "#MOS : Master Key: %{sensitive}@", buf, 0xCu);
          }

          goto LABEL_46;
        }
      }
      else
      {
        if (v52 == 33)
        {
          LOBYTE(v49) = 0;
          if ((int)spinel_datatype_unpack(v51, v50, "C", v26, v27, v28, v29, v30, (uint64_t)&v49) < 1) {
            goto LABEL_53;
          }
          v38 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            -[THThreadNetworkCredentialsStoreLocalClient setFromSpinelFrame:data_len:].cold.6(v59, v60, v38);
          }

          unsigned __int8 v47 = v49;
          v37 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v66 = v49;
            _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "#MOS : Channel : %d", buf, 8u);
          }
          goto LABEL_39;
        }
        if (v52 == 54)
        {
          unsigned __int16 v49 = 0;
          if ((int)spinel_datatype_unpack(v51, v50, "S", v26, v27, v28, v29, v30, (uint64_t)&v49) < 1) {
            goto LABEL_53;
          }
          v31 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            -[THThreadNetworkCredentialsStoreLocalClient setFromSpinelFrame:data_len:].cold.5(v61, v62, v31);
          }

          unsigned __int16 v48 = bswap32(v49) >> 16;
          uint64_t v32 = +[NSData dataWithBytes:&v48 length:2];

          v33 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v66 = v48;
            _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "#MOS : PANID : %hu", buf, 8u);
          }

          v34 = v9;
          id v8 = (void *)v32;
          goto LABEL_46;
        }
      }
      v37 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsStoreLocalClient setFromSpinelFrame:data_len:](v55, v56, v37);
      }
LABEL_39:

LABEL_45:
      v34 = v9;
LABEL_46:
      a3 += v17;
      id v9 = v34;
      a4 -= v17;
      if (!a4) {
        goto LABEL_49;
      }
    }
  }
  unsigned __int8 v47 = 0;
  id v10 = 0;
  v34 = 0;
  id v8 = 0;
LABEL_49:
  LOBYTE(v46) = 1;
  id v42 = [objc_alloc((Class)THThreadNetworkCredentials) initWithMasterKey:v34 passPhrase:0 PSKc:v10 channel:v47 PANID:v8 userInfo:0 credentialDataSet:0 isActiveDevice:v46];
  if (v42)
  {
    v43 = v42;
    v44 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsStoreLocalClient setFromSpinelFrame:data_len:]();
    }
  }
  else
  {
    id v9 = v34;
LABEL_53:
    v44 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsStoreLocalClient setFromSpinelFrame:data_len:]();
    }
    v43 = 0;
    v34 = v9;
  }

  return v43;
}

- (id)parseDataSetFromSpinel:(const char *)a3 data_len:(unsigned int)a4
{
  id v6 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:].cold.8();
  }

  encode_data_into_string((unsigned __int8 *)a3, a4, __b, 0x3E8uLL, 0);
  id v7 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:].cold.7();
  }

  if (a4)
  {
    id v8 = 0;
    id v9 = 0;
    id v10 = 0;
    id v11 = 0;
    uint64_t v12 = 0;
    unsigned __int8 v69 = 0;
    while (1)
    {
      uint64_t v13 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v80 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
        __int16 v81 = 1024;
        *(_DWORD *)v82 = a4;
        *(_WORD *)&v82[4] = 1024;
        *(_DWORD *)&v82[6] = 1101;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s: #MOS : data_len : %d, Line : %d", buf, 0x18u);
      }

      v76 = 0;
      unsigned int v75 = 0;
      int v19 = spinel_datatype_unpack((unsigned __int8 *)a3, a4, "d", v14, v15, v16, v17, v18, (uint64_t)&v76);
      uint64_t v20 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v80 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
        __int16 v81 = 1024;
        *(_DWORD *)v82 = v19;
        *(_WORD *)&v82[4] = 1024;
        *(_DWORD *)&v82[6] = 1113;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s: #MOS : length : %d, Line : %d", buf, 0x18u);
      }

      if (v19 < 1) {
        break;
      }
      int v74 = 0;
      v73 = 0;
      unsigned int v72 = 0;
      int v68 = &v73;
      int v26 = spinel_datatype_unpack(v76, v75, "iD", v21, v22, v23, v24, v25, (uint64_t)&v74);
      uint64_t v27 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v80 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
        __int16 v81 = 1024;
        *(_DWORD *)v82 = v74;
        *(_WORD *)&v82[4] = 1024;
        *(_DWORD *)&v82[6] = v26;
        __int16 v83 = 1024;
        int v84 = 1134;
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s: #MOS : propkey : %d, length: %d, Line : %d", buf, 0x1Eu);
      }

      if (v26 < 1) {
        break;
      }
      switch(v74)
      {
        case 'D':
          uint64_t v71 = 0;
          if ((int)spinel_datatype_unpack(v73, v72, "U", v28, v29, v30, v31, v32, (uint64_t)&v71) < 1) {
            goto LABEL_80;
          }
          v33 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v80 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
            __int16 v81 = 1024;
            *(_DWORD *)v82 = 1152;
            _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded Network Name Line : %d", buf, 0x12u);
          }

          v34 = +[NSString stringWithUTF8String:v71];

          v35 = THCredentialsServerLogHandleForCategory(1);
          BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
          if (v34)
          {
            if (v36)
            {
              *(_DWORD *)buf = 136315394;
              v80 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
              __int16 v81 = 2112;
              *(void *)v82 = v34;
              _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%s : #MOS : Network Name : %@", buf, 0x16u);
            }

            goto LABEL_57;
          }
          if (v36) {
            -[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:].cold.6(v35, v37, v38, v39, v40, v41, v42, v43);
          }

          id v8 = 0;
          goto LABEL_80;
        case 'E':
          if (!v72) {
            goto LABEL_80;
          }
          unsigned __int16 v48 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v80 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
            __int16 v81 = 1024;
            *(_DWORD *)v82 = 1166;
            _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded XPAN ID : %d", buf, 0x12u);
          }

          uint64_t v49 = +[NSData dataWithBytes:v73 length:v72];

          unsigned int v50 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v80 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
            __int16 v81 = 2112;
            *(void *)v82 = v49;
            _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%s: #MOS : XPAN ID: %@", buf, 0x16u);
          }

          id v9 = (void *)v49;
          goto LABEL_56;
        case 'F':
          if (!v72) {
            goto LABEL_80;
          }
          v51 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v80 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
            __int16 v81 = 1024;
            *(_DWORD *)v82 = 1176;
            _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded master key Line : %d", buf, 0x12u);
          }

          uint64_t v52 = +[NSData dataWithBytes:v73 length:v72];

          unsigned int v53 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315395;
            v80 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
            __int16 v81 = 2117;
            *(void *)v82 = v52;
            _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%s: #MOS : Master Key: %{sensitive}@", buf, 0x16u);
          }

          id v11 = (void *)v52;
          goto LABEL_56;
        case 'G':
        case 'H':
        case 'I':
        case 'J':
          goto LABEL_31;
        case 'K':
          v54 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v80 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
            __int16 v81 = 1024;
            *(_DWORD *)v82 = 1225;
            _os_log_error_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded pskc Line : %d", buf, 0x12u);
          }

          uint64_t v55 = +[NSData dataWithBytes:v73 length:v72];

          v56 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315395;
            v80 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
            __int16 v81 = 2117;
            *(void *)v82 = v55;
            _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%s: #MOS : PSKc : %{sensitive}@", buf, 0x16u);
          }

          uint64_t v12 = (void *)v55;
          goto LABEL_56;
        default:
          if (v74 == 33)
          {
            LOBYTE(v71) = 0;
            if ((int)spinel_datatype_unpack(v73, v72, "C", v28, v29, v30, v31, v32, (uint64_t)&v71) < 1) {
              goto LABEL_80;
            }
            v57 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v80 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
              __int16 v81 = 1024;
              *(_DWORD *)v82 = 1215;
              _os_log_error_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded channel Line : %d", buf, 0x12u);
            }

            unsigned __int8 v69 = v71;
            unsigned __int8 v47 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v80 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
              __int16 v81 = 1024;
              *(_DWORD *)v82 = v71;
              _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%s: #MOS : Channel : %d", buf, 0x12u);
            }
            goto LABEL_55;
          }
          if (v74 != 54)
          {
LABEL_31:
            unsigned __int8 v47 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
              -[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:].cold.5(v77, v78, v47);
            }
LABEL_55:

            goto LABEL_56;
          }
          LOWORD(v71) = 0;
          if ((int)spinel_datatype_unpack(v73, v72, "S", v28, v29, v30, v31, v32, (uint64_t)&v71) < 1) {
            goto LABEL_80;
          }
          v44 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v80 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
            __int16 v81 = 1024;
            *(_DWORD *)v82 = 1195;
            _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded pan id Line : %d", buf, 0x12u);
          }

          unsigned __int16 v70 = bswap32((unsigned __int16)v71) >> 16;
          uint64_t v45 = +[NSData dataWithBytes:&v70 length:2];

          v46 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v80 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
            __int16 v81 = 1024;
            *(_DWORD *)v82 = v70;
            _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%s: #MOS : PANID : %hu", buf, 0x12u);
          }

          id v10 = (void *)v45;
LABEL_56:
          v34 = v8;
LABEL_57:
          a3 += v19;
          id v8 = v34;
          a4 -= v19;
          if (!a4) {
            goto LABEL_60;
          }
          break;
      }
    }
LABEL_80:
    id v64 = 0;
    v34 = v8;
  }
  else
  {
    unsigned __int8 v69 = 0;
    uint64_t v12 = 0;
    id v11 = 0;
    id v10 = 0;
    id v9 = 0;
    v34 = 0;
LABEL_60:
    LOBYTE(v68) = 1;
    id v58 = [objc_alloc((Class)THThreadNetworkCredentials) initWithMasterKey:v11 passPhrase:0 PSKc:v12 channel:v69 PANID:v10 userInfo:0 credentialDataSet:0 isActiveDevice:v68];
    v59 = THCredentialsServerLogHandleForCategory(1);
    BOOL v60 = os_log_type_enabled(v59, OS_LOG_TYPE_ERROR);
    if (v58)
    {
      if (v60) {
        -[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:].cold.4();
      }

      id v61 = [objc_alloc((Class)THThreadNetwork) initWithName:v34 extendedPANID:v9];
      if (v61)
      {
        v62 = v61;
        id v63 = [objc_alloc((Class)THThreadNetworkCredentialsStoreRecord) initWithNetwork:v61 credentials:v58 uniqueIdentifier:0 keychainAccessGroup:@"com.apple.thread.network" creationDate:0 lastModificationDate:0];
        if (v63)
        {
          id v64 = v63;

          goto LABEL_81;
        }
        v66 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
          -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:].cold.5();
        }
      }
      else
      {
        v65 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
          -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]();
        }
      }
    }
    else
    {
      if (v60) {
        -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]();
      }
    }
    id v64 = 0;
  }
LABEL_81:

  return v64;
}

- (id)parseActiveOperationalDataSet:(id)a3
{
  id v4 = a3;
  id v5 = [v4 bytes];
  id v6 = [v4 length];

  return [(THThreadNetworkCredentialsStoreLocalClient *)self parseDataSetFromTLVs:v5 data_len:v6];
}

- (id)parseThreadNetworkActiveDataSet:(id)a3
{
  id v4 = a3;
  id v5 = [v4 bytes];
  id v6 = [v4 length];

  return [(THThreadNetworkCredentialsStoreLocalClient *)self parseCredsFromTLVs:v5 data_len:v6];
}

- (id)parseDataSetFromTLVs:(const char *)a3 data_len:(unsigned int)a4
{
  id v6 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]3();
  }

  encode_data_into_string((unsigned __int8 *)a3, a4, __b, 0x3E8uLL, 0);
  id v7 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]2();
  }

  if (a4)
  {
    id v8 = 0;
    id v63 = 0;
    id v64 = 0;
    id v9 = 0;
    v62 = 0;
    LOBYTE(v10) = 0;
    unsigned int v11 = 0;
    while (1)
    {
      uint64_t v12 = v11 + 1;
      if (v12 >= a4) {
        break;
      }
      uint64_t v13 = a3[v12];
      uint64_t v14 = v11 + 2;
      unsigned int v15 = v11 + 2 + v13;
      if (v15 > a4)
      {
        uint64_t v18 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:].cold.6();
        }
LABEL_132:
        id v54 = 0;
        goto LABEL_133;
      }
      int v16 = a3[v11];
      switch(a3[v11])
      {
        case 0:
          uint64_t v17 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v66 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]";
            __int16 v67 = 1024;
            *(_DWORD *)int v68 = 1468;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded channel Line : %d", buf, 0x12u);
          }

          if (v13 != 3)
          {
            uint64_t v18 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              -[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]3();
            }
            goto LABEL_132;
          }
          if (a3[v14])
          {
            uint64_t v18 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              -[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]2();
            }
            goto LABEL_132;
          }
          int v10 = a3[v11 + 4];
          uint64_t v18 = THCredentialsServerLogHandleForCategory(1);
          BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
          if ((v10 - 27) <= 0xEFu)
          {
            if (v19) {
              -[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]1();
            }
            goto LABEL_132;
          }
          if (!v19) {
            goto LABEL_61;
          }
          *(_DWORD *)buf = 136315394;
          v66 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]";
          __int16 v67 = 1024;
          *(_DWORD *)int v68 = v10;
          uint64_t v20 = v18;
          uint64_t v21 = "%s: #MOS : Channel : %d";
          uint32_t v22 = 18;
          goto LABEL_31;
        case 1:
          uint64_t v27 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v66 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]";
            __int16 v67 = 1024;
            *(_DWORD *)int v68 = 1502;
            _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded pan id Line : %d", buf, 0x12u);
          }

          if (v13 != 2)
          {
            uint64_t v18 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              -[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]4();
            }
            goto LABEL_132;
          }
          uint64_t v28 = +[NSData dataWithBytes:&a3[v14] length:2];

          uint64_t v18 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v66 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]";
            __int16 v67 = 2112;
            *(void *)int v68 = v28;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s: #MOS : PANID : %@", buf, 0x16u);
          }
          id v63 = (void *)v28;
          goto LABEL_61;
        case 2:
          uint64_t v29 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v66 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]";
            __int16 v67 = 1024;
            *(_DWORD *)int v68 = 1517;
            _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded XPAN ID : %d", buf, 0x12u);
          }

          if (v13 != 8)
          {
            uint64_t v18 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              -[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]5();
            }
            goto LABEL_132;
          }
          uint64_t v30 = +[NSData dataWithBytes:&a3[v14] length:8];

          uint64_t v18 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v66 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]";
            __int16 v67 = 2112;
            *(void *)int v68 = v30;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s: #MOS : XPAN ID: %@", buf, 0x16u);
          }
          id v64 = (void *)v30;
          goto LABEL_61;
        case 3:
          __memcpy_chk();
          v70[v13] = 0;
          uint64_t v31 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v66 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]";
            __int16 v67 = 1024;
            *(_DWORD *)int v68 = 1457;
            _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded Network Name Line : %d", buf, 0x12u);
          }

          uint64_t v32 = +[NSString stringWithUTF8String:v70];

          uint64_t v18 = THCredentialsServerLogHandleForCategory(1);
          BOOL v33 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
          if (!v32)
          {
            if (v33) {
              -[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]0(v18, v34, v35, v36, v37, v38, v39, v40);
            }
            id v54 = 0;
            id v8 = 0;
            goto LABEL_133;
          }
          if (v33)
          {
            *(_DWORD *)buf = 136315394;
            v66 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]";
            __int16 v67 = 2112;
            *(void *)int v68 = v32;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s : #MOS : Network Name : %@", buf, 0x16u);
          }
          goto LABEL_62;
        case 4:
          uint64_t v41 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v66 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]";
            __int16 v67 = 1024;
            *(_DWORD *)int v68 = 1532;
            _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded pskc Line : %d", buf, 0x12u);
          }

          if (v13 != 16)
          {
            uint64_t v18 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              -[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]6();
            }
            goto LABEL_132;
          }
          uint64_t v42 = +[NSData dataWithBytes:&a3[v14] length:16];

          uint64_t v18 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315395;
            v66 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]";
            __int16 v67 = 2117;
            *(void *)int v68 = v42;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s: #MOS : PSKc : %{sensitive}@", buf, 0x16u);
          }
          v62 = (void *)v42;
          goto LABEL_61;
        case 5:
          uint64_t v43 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v66 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]";
            __int16 v67 = 1024;
            *(_DWORD *)int v68 = 1548;
            _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded master key Line : %d", buf, 0x12u);
          }

          if (v13 != 16)
          {
            uint64_t v18 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              -[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]7();
            }
            goto LABEL_132;
          }
          uint64_t v44 = +[NSData dataWithBytes:&a3[v14] length:16];

          uint64_t v18 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315395;
            v66 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]";
            __int16 v67 = 2117;
            *(void *)int v68 = v44;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s: #MOS : Master Key: %{sensitive}@", buf, 0x16u);
          }
          id v9 = (void *)v44;
          goto LABEL_61;
        case 6:
        case 8:
        case 9:
        case 0xA:
        case 0xB:
          goto LABEL_29;
        case 7:
          uint64_t v45 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v66 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]";
            __int16 v67 = 1024;
            *(_DWORD *)int v68 = 1578;
            _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded mesh local prefix Line : %d", buf, 0x12u);
          }

          if (v13 == 8) {
            goto LABEL_63;
          }
          uint64_t v18 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            -[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]0();
          }
          goto LABEL_132;
        case 0xC:
          v46 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v66 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]";
            __int16 v67 = 1024;
            *(_DWORD *)int v68 = 1563;
            _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded security policy Line : %d", buf, 0x12u);
          }

          if ((v13 - 3) >= 2)
          {
            uint64_t v18 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              -[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]9();
            }
            goto LABEL_132;
          }
          if (!a3[v14] && !a3[v11 + 3])
          {
            uint64_t v18 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              -[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]8();
            }
            goto LABEL_132;
          }
          goto LABEL_63;
        default:
          if (v16 == 53)
          {
            uint64_t v23 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v66 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]";
              __int16 v67 = 1024;
              *(_DWORD *)int v68 = 1419;
              _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded Channel Mask TLV Line : %d", buf, 0x12u);
            }

            unsigned int v24 = v11 + 3;
            while (1)
            {
              if (v24 - 1 >= v15) {
                goto LABEL_63;
              }
              if (v24 >= v15 || v24 + 5 > v15) {
                break;
              }
              if ((a3[v24 - 1] & 0xFD) != 0)
              {
                uint64_t v18 = THCredentialsServerLogHandleForCategory(1);
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
                  -[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:].cold.9();
                }
                goto LABEL_132;
              }
              int v26 = a3[v24];
              v24 += 6;
              if (v26 != 4)
              {
                uint64_t v18 = THCredentialsServerLogHandleForCategory(1);
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
                  -[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:].cold.8();
                }
                goto LABEL_132;
              }
            }
            uint64_t v18 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              -[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:].cold.7();
            }
            goto LABEL_132;
          }
LABEL_29:
          uint64_t v18 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v66 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]";
            __int16 v67 = 1024;
            *(_DWORD *)int v68 = v16;
            *(_WORD *)&v68[4] = 1024;
            *(_DWORD *)&v68[6] = 1588;
            uint64_t v20 = v18;
            uint64_t v21 = "%s: #MOS : ==> Unknown type : %d, Line : %d";
            uint32_t v22 = 24;
LABEL_31:
            _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v21, buf, v22);
          }
LABEL_61:
          uint64_t v32 = (uint64_t)v8;
LABEL_62:

          id v8 = (void *)v32;
LABEL_63:
          unsigned int v11 = v15;
          if (v15 >= a4) {
            goto LABEL_76;
          }
          break;
      }
    }
    uint64_t v18 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]1();
    }
    goto LABEL_132;
  }
  LOBYTE(v10) = 0;
  v62 = 0;
  id v63 = 0;
  id v9 = 0;
  id v64 = 0;
  id v8 = 0;
LABEL_76:
  unsigned __int16 v48 = v62;
  unsigned __int8 v47 = v63;
  if (v8 && v64 && v9 && v62 && v63)
  {
    LOBYTE(v61) = 1;
    uint64_t v18 = [objc_alloc((Class)THThreadNetworkCredentials) initWithMasterKey:v9 passPhrase:0 PSKc:v62 channel:v10 PANID:v63 userInfo:0 credentialDataSet:0 isActiveDevice:v61];
    uint64_t v49 = THCredentialsServerLogHandleForCategory(1);
    BOOL v50 = os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (v50) {
        -[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:].cold.4();
      }

      id v51 = [objc_alloc((Class)THThreadNetwork) initWithName:v8 extendedPANID:v64];
      if (!v51)
      {
        uint64_t v55 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
          -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]();
        }

        goto LABEL_132;
      }
      uint64_t v52 = v51;
      id v53 = [objc_alloc((Class)THThreadNetworkCredentialsStoreRecord) initWithNetwork:v51 credentials:v18 uniqueIdentifier:0 keychainAccessGroup:@"com.apple.thread.network" creationDate:0 lastModificationDate:0];
      if (!v53)
      {
        v57 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
          -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:].cold.5();
        }

        goto LABEL_132;
      }
      id v54 = v53;
    }
    else
    {
      if (v50) {
        -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]();
      }
      id v54 = 0;
      uint64_t v18 = v49;
    }
LABEL_133:
    unsigned __int16 v48 = v62;
    unsigned __int8 v47 = v63;
  }
  else
  {
    uint64_t v18 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:].cold.5();
    }
    id v54 = 0;
  }

  return v54;
}

- (id)parseCredsFromTLVs:(const char *)a3 data_len:(unsigned int)a4
{
  id v6 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]1();
  }

  encode_data_into_string((unsigned __int8 *)a3, a4, __b, 0x3E8uLL, 0);
  id v7 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]0();
  }

  if (a4)
  {
    id v8 = 0;
    id v54 = 0;
    uint64_t v55 = 0;
    v56 = 0;
    v57 = 0;
    LOBYTE(v9) = 0;
    unsigned int v10 = 0;
    while (1)
    {
      uint64_t v11 = v10 + 1;
      if (v11 >= a4)
      {
        uint64_t v17 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]9();
        }
        goto LABEL_96;
      }
      uint64_t v12 = a3[v11];
      uint64_t v13 = v10 + 2;
      unsigned int v14 = v10 + 2 + v12;
      if (v14 > a4)
      {
        uint64_t v17 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:].cold.4();
        }
        goto LABEL_96;
      }
      int v15 = a3[v10];
      switch(a3[v10])
      {
        case 0:
          int v16 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v59 = "-[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]";
            __int16 v60 = 1024;
            *(_DWORD *)uint64_t v61 = 1756;
            _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded channel Line : %d", buf, 0x12u);
          }

          if (v12 != 3)
          {
            uint64_t v17 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              -[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]1();
            }
            goto LABEL_96;
          }
          if (a3[v13])
          {
            uint64_t v17 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              -[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]0();
            }
            goto LABEL_96;
          }
          int v9 = a3[v10 + 4];
          uint64_t v17 = THCredentialsServerLogHandleForCategory(1);
          BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
          if ((v9 - 27) <= 0xEFu)
          {
            if (v18) {
              -[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:].cold.9();
            }
            goto LABEL_96;
          }
          if (!v18) {
            goto LABEL_61;
          }
          *(_DWORD *)buf = 136315394;
          v59 = "-[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]";
          __int16 v60 = 1024;
          *(_DWORD *)uint64_t v61 = v9;
          BOOL v19 = v17;
          uint64_t v20 = "%s: #MOS : Channel : %d";
          uint32_t v21 = 18;
          goto LABEL_31;
        case 1:
          int v26 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v59 = "-[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]";
            __int16 v60 = 1024;
            *(_DWORD *)uint64_t v61 = 1790;
            _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded pan id Line : %d", buf, 0x12u);
          }

          if (v12 != 2)
          {
            uint64_t v17 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              -[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]2();
            }
            goto LABEL_96;
          }
          uint64_t v27 = +[NSData dataWithBytes:&a3[v13] length:2];

          uint64_t v17 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v59 = "-[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]";
            __int16 v60 = 2112;
            *(void *)uint64_t v61 = v27;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s: #MOS : PANID : %@", buf, 0x16u);
          }
          uint64_t v55 = (void *)v27;
          goto LABEL_61;
        case 2:
          uint64_t v28 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v59 = "-[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]";
            __int16 v60 = 1024;
            *(_DWORD *)uint64_t v61 = 1805;
            _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded XPAN ID : %d", buf, 0x12u);
          }

          if (v12 != 8)
          {
            uint64_t v17 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              -[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]3();
            }
            goto LABEL_96;
          }
          uint64_t v29 = +[NSData dataWithBytes:&a3[v13] length:8];

          uint64_t v17 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v59 = "-[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]";
            __int16 v60 = 2112;
            *(void *)uint64_t v61 = v29;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s: #MOS : XPAN ID: %@", buf, 0x16u);
          }
          id v54 = (void *)v29;
          goto LABEL_61;
        case 3:
          __memcpy_chk();
          v63[v12] = 0;
          uint64_t v30 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v59 = "-[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]";
            __int16 v60 = 1024;
            *(_DWORD *)uint64_t v61 = 1745;
            _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded Network Name Line : %d", buf, 0x12u);
          }

          uint64_t v31 = +[NSString stringWithUTF8String:v63];

          uint64_t v17 = THCredentialsServerLogHandleForCategory(1);
          BOOL v32 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
          if (!v31)
          {
            if (v32) {
              -[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:].cold.8(v17, v33, v34, v35, v36, v37, v38, v39);
            }
            id v8 = 0;
            goto LABEL_96;
          }
          if (v32)
          {
            *(_DWORD *)buf = 136315394;
            v59 = "-[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]";
            __int16 v60 = 2112;
            *(void *)uint64_t v61 = v31;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s : #MOS : Network Name : %@", buf, 0x16u);
          }
          goto LABEL_62;
        case 4:
          uint64_t v40 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v59 = "-[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]";
            __int16 v60 = 1024;
            *(_DWORD *)uint64_t v61 = 1820;
            _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded pskc Line : %d", buf, 0x12u);
          }

          if (v12 != 16)
          {
            uint64_t v17 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              -[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]4();
            }
            goto LABEL_96;
          }
          uint64_t v41 = +[NSData dataWithBytes:&a3[v13] length:16];

          uint64_t v17 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315395;
            v59 = "-[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]";
            __int16 v60 = 2117;
            *(void *)uint64_t v61 = v41;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s: #MOS : PSKc : %{sensitive}@", buf, 0x16u);
          }
          v56 = (void *)v41;
          goto LABEL_61;
        case 5:
          uint64_t v42 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v59 = "-[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]";
            __int16 v60 = 1024;
            *(_DWORD *)uint64_t v61 = 1836;
            _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded master key Line : %d", buf, 0x12u);
          }

          if (v12 != 16)
          {
            uint64_t v17 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              -[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]5();
            }
            goto LABEL_96;
          }
          uint64_t v43 = +[NSData dataWithBytes:&a3[v13] length:16];

          uint64_t v17 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315395;
            v59 = "-[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]";
            __int16 v60 = 2117;
            *(void *)uint64_t v61 = v43;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s: #MOS : Master Key: %{sensitive}@", buf, 0x16u);
          }
          v57 = (void *)v43;
          goto LABEL_61;
        case 6:
        case 8:
        case 9:
        case 0xA:
        case 0xB:
          goto LABEL_29;
        case 7:
          uint64_t v44 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v59 = "-[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]";
            __int16 v60 = 1024;
            *(_DWORD *)uint64_t v61 = 1866;
            _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded mesh local prefix Line : %d", buf, 0x12u);
          }

          if (v12 == 8) {
            goto LABEL_63;
          }
          uint64_t v17 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            -[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]8();
          }
          goto LABEL_96;
        case 0xC:
          uint64_t v45 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v59 = "-[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]";
            __int16 v60 = 1024;
            *(_DWORD *)uint64_t v61 = 1851;
            _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded security policy Line : %d", buf, 0x12u);
          }

          if ((v12 - 3) >= 2)
          {
            uint64_t v17 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              -[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]7();
            }
            goto LABEL_96;
          }
          if (!a3[v13] && !a3[v10 + 3])
          {
            uint64_t v17 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              -[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]6();
            }
            goto LABEL_96;
          }
          goto LABEL_63;
        default:
          if (v15 == 53)
          {
            uint32_t v22 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v59 = "-[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]";
              __int16 v60 = 1024;
              *(_DWORD *)uint64_t v61 = 1707;
              _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded Channel Mask TLV Line : %d", buf, 0x12u);
            }

            unsigned int v23 = v10 + 3;
            while (1)
            {
              if (v23 - 1 >= v14) {
                goto LABEL_63;
              }
              if (v23 >= v14 || v23 + 5 > v14) {
                break;
              }
              if ((a3[v23 - 1] & 0xFD) != 0)
              {
                uint64_t v17 = THCredentialsServerLogHandleForCategory(1);
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
                  -[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:].cold.7();
                }
                goto LABEL_96;
              }
              int v25 = a3[v23];
              v23 += 6;
              if (v25 != 4)
              {
                uint64_t v17 = THCredentialsServerLogHandleForCategory(1);
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
                  -[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:].cold.6();
                }
                goto LABEL_96;
              }
            }
            uint64_t v17 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              -[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:].cold.5();
            }
LABEL_96:

LABEL_97:
            unsigned __int16 v48 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
              -[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]();
            }
LABEL_99:
            unsigned __int8 v47 = 0;
            goto LABEL_100;
          }
LABEL_29:
          uint64_t v17 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v59 = "-[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]";
            __int16 v60 = 1024;
            *(_DWORD *)uint64_t v61 = v15;
            *(_WORD *)&uint8_t v61[4] = 1024;
            *(_DWORD *)&v61[6] = 1876;
            BOOL v19 = v17;
            uint64_t v20 = "%s: #MOS : ==> Unknown type : %d, Line : %d";
            uint32_t v21 = 24;
LABEL_31:
            _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v20, buf, v21);
          }
LABEL_61:
          uint64_t v31 = (uint64_t)v8;
LABEL_62:

          id v8 = (void *)v31;
LABEL_63:
          unsigned int v10 = v14;
          if (v14 >= a4) {
            goto LABEL_76;
          }
          break;
      }
    }
  }
  LOBYTE(v9) = 0;
  v56 = 0;
  v57 = 0;
  id v54 = 0;
  uint64_t v55 = 0;
  id v8 = 0;
LABEL_76:
  if (!v8 || !v54 || !v57 || !v56 || !v55)
  {
    unsigned __int16 v48 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]();
    }
    goto LABEL_99;
  }
  LOBYTE(v53) = 1;
  id v46 = [objc_alloc((Class)THThreadNetworkCredentials) initWithMasterKey:v57 passPhrase:0 PSKc:v56 channel:v9 PANID:v55 userInfo:0 credentialDataSet:0 isActiveDevice:v53];
  if (!v46) {
    goto LABEL_97;
  }
  unsigned __int8 v47 = v46;
  unsigned __int16 v48 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
    -[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]();
  }
LABEL_100:

  return v47;
}

- (NSString)keychainAccessGroup
{
  return self->_keychainAccessGroup;
}

- (THThreadNetworkCredentialsBackingStore)backingStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backingStore);

  return (THThreadNetworkCredentialsBackingStore *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backingStore);

  objc_storeStrong((id *)&self->_keychainAccessGroup, 0);
}

- (void)checkIfRecordForPreferredNetworkIsPresentWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: %d: Feature is unsupported", v2, v3, v4, v5, v6);
}

- (void)retrievePreferredNetworkWithNoScanWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: %d: Feature is unsupported", v2, v3, v4, v5, v6);
}

void __95__THThreadNetworkCredentialsStoreLocalClient_retrievePreferredNetworkWithNoScanWithCompletion___block_invoke_36_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: %d: Completion handler is nil, avoiding completion call", v2, v3, v4, v5, v6);
}

- (void)retrievePreferredNetworkWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: %d: Feature is unsupported", v2, v3, v4, v5, v6);
}

void __85__THThreadNetworkCredentialsStoreLocalClient_retrievePreferredNetworkWithCompletion___block_invoke_37_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: %d: Completion handler is nil, avoiding completion call", v2, v3, v4, v5, v6);
}

- (void)retrievePreferredNetworkInternallyWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: %d: Feature is unsupported", v2, v3, v4, v5, v6);
}

void __95__THThreadNetworkCredentialsStoreLocalClient_retrievePreferredNetworkInternallyWithCompletion___block_invoke_38_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: %d: Completion handler is nil, avoiding completion call", v2, v3, v4, v5, v6);
}

- (void)retrievePreferredNetworkOfAnyDSFormatWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: %d: Feature is unsupported", v2, v3, v4, v5, v6);
}

- (void)retrieveOrGeneratePreferredNetworkInternallyWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: %d: Feature is unsupported", v2, v3, v4, v5, v6);
}

- (void)storeThreadNetworkCredentialActiveDataSet:network:credentialsDataSet:waitForSync:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "creds are NULL #MOS !!", v2, v3, v4, v5, v6);
}

- (void)checkIsPreferredNetworkForActiveOperationalDataset:completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: %d: Feature is unsupported", v2, v3, v4, v5, v6);
}

void __108__THThreadNetworkCredentialsStoreLocalClient_checkIsPreferredNetworkForActiveOperationalDataset_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: %d: Invalid parameter passed", v2, v3, v4, v5, v6);
}

void __108__THThreadNetworkCredentialsStoreLocalClient_checkIsPreferredNetworkForActiveOperationalDataset_completion___block_invoke_58_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: %d: Backing store is nil", v2, v3, v4, v5, v6);
}

void __108__THThreadNetworkCredentialsStoreLocalClient_checkIsPreferredNetworkForActiveOperationalDataset_completion___block_invoke_59_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s : %d: Given dataset does not match with Preferred Network", v2, v3, v4, v5, v6);
}

- (void)setFromSpinelFrame:data_len:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: #MOS creds NILL : Line : %d", v2, v3, v4, v5, v6);
}

- (void)setFromSpinelFrame:data_len:.cold.2()
{
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "#MOS creds master_key :%{sensitive}@ : Line : %d", v2, v3, v4, v5, 3u);
}

- (void)setFromSpinelFrame:(NSObject *)a3 data_len:.cold.3(uint8_t *a1, _DWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a2 = 1055;
  OUTLINED_FUNCTION_6_3((void *)&_mh_execute_header, (int)a2, a3, "#MOS : break !! : %d", a1);
}

- (void)setFromSpinelFrame:(NSObject *)a3 data_len:.cold.4(uint8_t *a1, _DWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a2 = 999;
  OUTLINED_FUNCTION_6_3((void *)&_mh_execute_header, (int)a2, a3, "#MOS : ==> Decoded master key Line : %d", a1);
}

- (void)setFromSpinelFrame:(NSObject *)a3 data_len:.cold.5(uint8_t *a1, _DWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a2 = 1018;
  OUTLINED_FUNCTION_6_3((void *)&_mh_execute_header, (int)a2, a3, "#MOS : ==> Decoded pan id Line : %d", a1);
}

- (void)setFromSpinelFrame:(NSObject *)a3 data_len:.cold.6(uint8_t *a1, _DWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a2 = 1038;
  OUTLINED_FUNCTION_6_3((void *)&_mh_execute_header, (int)a2, a3, "#MOS : ==> Decoded channel Line : %d", a1);
}

- (void)setFromSpinelFrame:(NSObject *)a3 data_len:.cold.7(uint8_t *a1, _DWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a2 = 1048;
  OUTLINED_FUNCTION_6_3((void *)&_mh_execute_header, (int)a2, a3, "#MOS : ==> Decoded pskc Line : %d", a1);
}

- (void)setFromSpinelFrame:data_len:.cold.8()
{
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "#MOS : dump: %{sensitive}s, Line : %d", v2, v3, v4, v5, 3u);
}

- (void)setFromSpinelFrame:(int)a1 data_len:(NSObject *)a2 .cold.9(int a1, NSObject *a2)
{
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 950;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#MOS : data_len : %d, Line : %d", (uint8_t *)v2, 0xEu);
}

- (void)parseDataSetFromSpinel:data_len:.cold.4()
{
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "#MOS creds master_key :%{sensitive}@ : Line : %d", v2, v3, v4, v5, 3u);
}

- (void)parseDataSetFromSpinel:(NSObject *)a3 data_len:.cold.5(uint8_t *a1, _DWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a2 = 1232;
  OUTLINED_FUNCTION_6_3((void *)&_mh_execute_header, (int)a2, a3, "#MOS : break !! : %d", a1);
}

- (void)parseDataSetFromSpinel:(uint64_t)a3 data_len:(uint64_t)a4 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)parseDataSetFromSpinel:data_len:.cold.7()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "%s: #MOS : dump: %{sensitive}s, Line : %d", v2, v3, v4, v5, 3u);
}

- (void)parseDataSetFromSpinel:data_len:.cold.8()
{
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s: #MOS : data_len : %d, Line : %d", v2, v3, v4, v5, 2u);
}

- (void)parseDataSetFromTLVs:data_len:.cold.4()
{
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "#MOS creds master_key :%{sensitive}@ : Line : %d", v2, v3, v4, v5, 3u);
}

- (void)parseDataSetFromTLVs:data_len:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: %d: Failed to parse dataset tlvs", v2, v3, v4, v5, v6);
}

- (void)parseDataSetFromTLVs:data_len:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Decoded TLV, format is invalid, current position goes out of bound, Line : %d", v2, v3, v4, v5, v6);
}

- (void)parseDataSetFromTLVs:data_len:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Decoded Channel mask, mask entry format is invalid, Line : %d", v2, v3, v4, v5, v6);
}

- (void)parseDataSetFromTLVs:data_len:.cold.8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> error : Decoded entry length is not matching,  Line : %d", v2, v3, v4, v5, v6);
}

- (void)parseDataSetFromTLVs:data_len:.cold.9()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> error : Decoded Channel page is neither zero nor 2,  Line : %d", v2, v3, v4, v5, v6);
}

- (void)parseDataSetFromTLVs:(uint64_t)a3 data_len:(uint64_t)a4 .cold.10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)parseDataSetFromTLVs:data_len:.cold.11()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s : #MOS : Channel is not in the range : %d", v2, v3, v4, v5, 2u);
}

- (void)parseDataSetFromTLVs:data_len:.cold.12()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s : #MOS : Channel Page is not Zero : %d", v2, v3, v4, v5, 2u);
}

- (void)parseDataSetFromTLVs:data_len:.cold.13()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Decoded channel Len : %d", v2, v3, v4, v5, v6);
}

- (void)parseDataSetFromTLVs:data_len:.cold.14()
{
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid pan id length %d, Line : %d", v2, v3, v4, v5, 2u);
}

- (void)parseDataSetFromTLVs:data_len:.cold.15()
{
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid extended pan id length %d, Line : %d", v2, v3, v4, v5, 2u);
}

- (void)parseDataSetFromTLVs:data_len:.cold.16()
{
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid pskc length %d, Line : %d", v2, v3, v4, v5, 2u);
}

- (void)parseDataSetFromTLVs:data_len:.cold.17()
{
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid network key length %d, Line : %d", v2, v3, v4, v5, 2u);
}

- (void)parseDataSetFromTLVs:data_len:.cold.18()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid rotation time, Line : %d", v2, v3, v4, v5, v6);
}

- (void)parseDataSetFromTLVs:data_len:.cold.19()
{
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid Security Policy length %d, Line : %d", v2, v3, v4, v5, 2u);
}

- (void)parseDataSetFromTLVs:data_len:.cold.20()
{
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid Mesh local prefix length %d, Line : %d", v2, v3, v4, v5, 2u);
}

- (void)parseDataSetFromTLVs:data_len:.cold.21()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Decoded TLV, format is invalid, current position goes out of bound, Line : %d", v2, v3, v4, v5, v6);
}

- (void)parseDataSetFromTLVs:data_len:.cold.22()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "%s: #MOS : dump: %{sensitive}s, Line : %d", v2, v3, v4, v5, 3u);
}

- (void)parseDataSetFromTLVs:data_len:.cold.23()
{
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s: #MOS : data_len : %d, Line : %d", v2, v3, v4, v5, 2u);
}

- (void)parseCredsFromTLVs:data_len:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: #MOS creds NILL : Line : %d", v2, v3, v4, v5, v6);
}

- (void)parseCredsFromTLVs:data_len:.cold.2()
{
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "#MOS creds master_key :%{sensitive}@ : Line : %d", v2, v3, v4, v5, 3u);
}

- (void)parseCredsFromTLVs:data_len:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: %d: Failed to parse dataset tlvs", v2, v3, v4, v5, v6);
}

- (void)parseCredsFromTLVs:data_len:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Decoded TLV, format is invalid, current position goes out of bound, Line : %d", v2, v3, v4, v5, v6);
}

- (void)parseCredsFromTLVs:data_len:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Decoded Channel mask, mask entry format is invalid, Line : %d", v2, v3, v4, v5, v6);
}

- (void)parseCredsFromTLVs:data_len:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> error : Decoded entry length is not matching,  Line : %d", v2, v3, v4, v5, v6);
}

- (void)parseCredsFromTLVs:data_len:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> error : Decoded Channel page is neither zero nor 2,  Line : %d", v2, v3, v4, v5, v6);
}

- (void)parseCredsFromTLVs:(uint64_t)a3 data_len:(uint64_t)a4 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)parseCredsFromTLVs:data_len:.cold.9()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s : #MOS : Channel is not in the range : %d", v2, v3, v4, v5, 2u);
}

- (void)parseCredsFromTLVs:data_len:.cold.10()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s : #MOS : Channel Page is not Zero : %d", v2, v3, v4, v5, 2u);
}

- (void)parseCredsFromTLVs:data_len:.cold.11()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Decoded channel Len : %d", v2, v3, v4, v5, v6);
}

- (void)parseCredsFromTLVs:data_len:.cold.12()
{
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid pan id length %d, Line : %d", v2, v3, v4, v5, 2u);
}

- (void)parseCredsFromTLVs:data_len:.cold.13()
{
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid extended pan id length %d, Line : %d", v2, v3, v4, v5, 2u);
}

- (void)parseCredsFromTLVs:data_len:.cold.14()
{
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid pskc length %d, Line : %d", v2, v3, v4, v5, 2u);
}

- (void)parseCredsFromTLVs:data_len:.cold.15()
{
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid network key length %d, Line : %d", v2, v3, v4, v5, 2u);
}

- (void)parseCredsFromTLVs:data_len:.cold.16()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid rotation time, Line : %d", v2, v3, v4, v5, v6);
}

- (void)parseCredsFromTLVs:data_len:.cold.17()
{
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid Security Policy length %d, Line : %d", v2, v3, v4, v5, 2u);
}

- (void)parseCredsFromTLVs:data_len:.cold.18()
{
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid Mesh local prefix length %d, Line : %d", v2, v3, v4, v5, 2u);
}

- (void)parseCredsFromTLVs:data_len:.cold.19()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Decoded TLV, format is invalid, current position goes out of bound, Line : %d", v2, v3, v4, v5, v6);
}

- (void)parseCredsFromTLVs:data_len:.cold.20()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "%s: #MOS : dump: %{sensitive}s, Line : %d", v2, v3, v4, v5, 3u);
}

- (void)parseCredsFromTLVs:data_len:.cold.21()
{
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s: #MOS : data_len : %d, Line : %d", v2, v3, v4, v5, 2u);
}

@end