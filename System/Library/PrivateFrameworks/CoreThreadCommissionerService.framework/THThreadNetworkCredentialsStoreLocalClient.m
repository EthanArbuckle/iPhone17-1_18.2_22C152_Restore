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
    v13[2] = sub_1000496C4;
    v13[3] = &unk_100075290;
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
    block[2] = sub_100049654;
    block[3] = &unk_100074F08;
    v9 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v11, block);
  }
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
    v13[2] = sub_100049890;
    v13[3] = &unk_1000752B8;
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
    block[2] = sub_10004981C;
    block[3] = &unk_100074F08;
    v9 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v11, block);
  }
}

- (void)retrieveAllRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v5)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100049C00;
    v10[3] = &unk_1000752B8;
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
    block[2] = sub_100049B8C;
    block[3] = &unk_100074F08;
    id v6 = &v13;
    id v13 = v4;
    id v9 = v4;
    dispatch_async(v8, block);
  }
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
    v13[2] = sub_100049E38;
    v13[3] = &unk_1000752E0;
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
    block[2] = sub_100049DC4;
    block[3] = &unk_100074F08;
    id v9 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v11, block);
  }
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
    block[2] = sub_100049FC0;
    block[3] = &unk_100074F08;
    id v12 = v6;
    dispatch_async(v10, block);
  }
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
    v19[2] = sub_10004A26C;
    v19[3] = &unk_100075048;
    id v20 = v12;
    id v17 = v12;
    [v13 storeRecord:v16 waitForSync:v8 completion:v19];
  }
  else
  {
    v18 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004A1F8;
    block[3] = &unk_100074F08;
    id v22 = v12;
    id v16 = v12;
    dispatch_async(v18, block);

    id v17 = v22;
  }
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
    v13[2] = sub_10004A434;
    v13[3] = &unk_100075290;
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
    block[2] = sub_10004A3C4;
    block[3] = &unk_100074F08;
    id v9 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v11, block);
  }
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
    v13[2] = sub_10004A5FC;
    v13[3] = &unk_100075290;
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
    block[2] = sub_10004A58C;
    block[3] = &unk_100074F08;
    id v9 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v11, block);
  }
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
    v13[2] = sub_10004A7C8;
    v13[3] = &unk_1000752B8;
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
    block[2] = sub_10004A754;
    block[3] = &unk_100074F08;
    id v9 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v11, block);
  }
}

- (void)retrieveAllActiveDataSetRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v5)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10004A9E4;
    v10[3] = &unk_1000752B8;
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
    block[2] = sub_10004A970;
    block[3] = &unk_100074F08;
    id v6 = &v13;
    id v13 = v4;
    id v9 = v4;
    dispatch_async(v8, block);
  }
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
    v13[2] = sub_10004AC1C;
    v13[3] = &unk_100075308;
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
    block[2] = sub_10004ABA8;
    block[3] = &unk_100074F08;
    id v9 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v11, block);
  }
}

- (void)retrieveThirdPartyInfo:(id)a3
{
  id v4 = a3;
  v5 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
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
    block[2] = sub_10004AD60;
    block[3] = &unk_100074F08;
    id v9 = v4;
    dispatch_async(v7, block);
  }
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
    v13[2] = sub_10004AF98;
    v13[3] = &unk_100075308;
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
    block[2] = sub_10004AF24;
    block[3] = &unk_100074F08;
    id v9 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v11, block);
  }
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
    v13[2] = sub_10004B1C0;
    v13[3] = &unk_100075308;
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
    block[2] = sub_10004B14C;
    block[3] = &unk_100074F08;
    id v9 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v11, block);
  }
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
    v13[2] = sub_10004B3E8;
    v13[3] = &unk_100075308;
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
    block[2] = sub_10004B374;
    block[3] = &unk_100074F08;
    id v9 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v11, block);
  }
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
    v13[2] = sub_10004B610;
    v13[3] = &unk_100075308;
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
    block[2] = sub_10004B59C;
    block[3] = &unk_100074F08;
    id v9 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v11, block);
  }
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
    v15[2] = sub_10004B84C;
    v15[3] = &unk_1000752B8;
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
    block[2] = sub_10004B7D8;
    block[3] = &unk_100074F08;
    id v11 = &v18;
    id v18 = v9;
    id v14 = v9;
    dispatch_async(v13, block);
  }
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
    v15[2] = sub_10004BA98;
    v15[3] = &unk_1000752B8;
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
    block[2] = sub_10004BA24;
    block[3] = &unk_100074F08;
    id v11 = &v18;
    id v18 = v9;
    id v14 = v9;
    dispatch_async(v13, block);
  }
}

- (void)checkIfRecordForPreferredNetworkIsPresentWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (!v5)
  {
    id v7 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004BC9C;
    block[3] = &unk_100074F08;
    id v12 = v4;
    dispatch_async(v7, block);

    BOOL v6 = v12;
    goto LABEL_5;
  }
  if (_os_feature_enabled_impl())
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10004BCB4;
    v9[3] = &unk_100075330;
    id v10 = v4;
    [v5 checkIfRecordForPreferredNetworkIsPresentWithCompletion:v9];
    BOOL v6 = v10;
LABEL_5:

    goto LABEL_9;
  }
  id v8 = sub_10001CCA0(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_1000524AC();
  }

  (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
LABEL_9:
}

- (void)retrievePreferredNetworkWithNoScanWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v5)
  {
    if (_os_feature_enabled_impl())
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10004BEE0;
      v9[3] = &unk_100075308;
      id v10 = v4;
      [v5 retrievePreferredNetworkWithNoScanWithCompletion:v9];
      BOOL v6 = v10;
    }
    else
    {
      id v8 = sub_10001CCA0(1);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100052528();
      }

      BOOL v6 = +[NSError storeError:17 description:@"Feature is unsupported"];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
    }
  }
  else
  {
    id v7 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004BE6C;
    block[3] = &unk_100074F08;
    id v12 = v4;
    dispatch_async(v7, block);

    BOOL v6 = v12;
  }
}

- (void)retrievePreferredNetworkWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v5)
  {
    if (_os_feature_enabled_impl())
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10004C18C;
      v9[3] = &unk_100075308;
      id v10 = v4;
      [v5 retrievePreferredNetworkWithCompletion:v9];
      BOOL v6 = v10;
    }
    else
    {
      id v8 = sub_10001CCA0(1);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100052620();
      }

      BOOL v6 = +[NSError storeError:17 description:@"Feature is unsupported"];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
    }
  }
  else
  {
    id v7 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004C118;
    block[3] = &unk_100074F08;
    id v12 = v4;
    dispatch_async(v7, block);

    BOOL v6 = v12;
  }
}

- (void)retrievePreferredNetworkInternallyWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v5)
  {
    if (_os_feature_enabled_impl())
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10004C438;
      v9[3] = &unk_100075308;
      id v10 = v4;
      [v5 retrievePreferredNetworkInternallyWithCompletion:v9];
      BOOL v6 = v10;
    }
    else
    {
      id v8 = sub_10001CCA0(1);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100052718();
      }

      BOOL v6 = +[NSError storeError:17 description:@"Feature is unsupported"];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
    }
  }
  else
  {
    id v7 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004C3C4;
    block[3] = &unk_100074F08;
    id v12 = v4;
    dispatch_async(v7, block);

    BOOL v6 = v12;
  }
}

- (void)retrievePreferredNetworkOfAnyDSFormatWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v5)
  {
    if (_os_feature_enabled_impl())
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10004C6E4;
      v9[3] = &unk_100075308;
      id v10 = v4;
      [v5 retrievePreferredNetworkOfAnyDSFormatWithCompletion:v9];
      BOOL v6 = v10;
    }
    else
    {
      id v8 = sub_10001CCA0(1);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100052810();
      }

      BOOL v6 = +[NSError storeError:17 description:@"Feature is unsupported"];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
    }
  }
  else
  {
    id v7 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004C670;
    block[3] = &unk_100074F08;
    id v12 = v4;
    dispatch_async(v7, block);

    BOOL v6 = v12;
  }
}

- (void)retrieveOrGeneratePreferredNetworkInternallyWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v5)
  {
    if (_os_feature_enabled_impl())
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10004C96C;
      v9[3] = &unk_100075308;
      id v10 = v4;
      [v5 retrieveOrGeneratePreferredNetworkInternallyWithCompletion:v9];
      BOOL v6 = v10;
    }
    else
    {
      id v8 = sub_10001CCA0(1);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10005288C();
      }

      BOOL v6 = +[NSError storeError:17 description:@"Feature is unsupported"];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
    }
  }
  else
  {
    id v7 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004C8F8;
    block[3] = &unk_100074F08;
    id v12 = v4;
    dispatch_async(v7, block);

    BOOL v6 = v12;
  }
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
    v27[2] = sub_10004CC04;
    v27[3] = &unk_100075290;
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
    block[2] = sub_10004CB94;
    block[3] = &unk_100074F08;
    v23 = &v30;
    id v30 = v21;
    id v26 = v21;
    dispatch_async(v25, block);
  }
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
    v19[2] = sub_10004CDFC;
    v19[3] = &unk_100075290;
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
    block[2] = sub_10004CD8C;
    block[3] = &unk_100074F08;
    id v15 = &v22;
    id v22 = v13;
    id v18 = v13;
    dispatch_async(v17, block);
  }
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
    v13[2] = sub_10004CFC4;
    v13[3] = &unk_100075290;
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
    block[2] = sub_10004CF54;
    block[3] = &unk_100074F08;
    id v9 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v11, block);
  }
}

- (void)deletePreferredNetworkWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v5)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10004D170;
    v10[3] = &unk_100075290;
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
    block[2] = sub_10004D100;
    block[3] = &unk_100074F08;
    id v6 = &v13;
    id v13 = v4;
    id v9 = v4;
    dispatch_async(v8, block);
  }
}

- (void)deletePreferredAndFrozenThreadNetworksWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v5)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10004D31C;
    v10[3] = &unk_100075290;
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
    block[2] = sub_10004D2AC;
    block[3] = &unk_100074F08;
    id v6 = &v13;
    id v13 = v4;
    id v9 = v4;
    dispatch_async(v8, block);
  }
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
    v13[2] = sub_10004D4E8;
    v13[3] = &unk_100075048;
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
    block[2] = sub_10004D474;
    block[3] = &unk_100074F08;
    id v9 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v11, block);
  }
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
      v25[2] = sub_10004D880;
      v25[3] = &unk_100075048;
      id v26 = v15;
      [v16 storeThreadCredentialActiveDataSetRecord:v21 waitForSync:v8 completion:v25];
    }
    else
    {
      v23 = sub_10001CCA0(1);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_100052908();
      }

      id v24 = dispatch_get_global_queue(0, 0);
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10004D80C;
      v27[3] = &unk_100074F08;
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
    block[2] = sub_10004D798;
    block[3] = &unk_100074F08;
    id v30 = v15;
    dispatch_async(v22, block);

    id v18 = v30;
  }
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
      v23[2] = sub_10004DC18;
      v23[3] = &unk_100075358;
      id v24 = v13;
      [v14 updatePreferredNetworkWithNewDatasetRecord:v19 completion:v23];
    }
    else
    {
      id v21 = sub_10001CCA0(1);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_100052908();
      }

      id v22 = dispatch_get_global_queue(0, 0);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10004DBA0;
      v25[3] = &unk_100074F08;
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
    block[2] = sub_10004DB28;
    block[3] = &unk_100074F08;
    id v28 = v13;
    dispatch_async(v20, block);

    id v16 = v28;
  }
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
    v25[2] = sub_10004DE80;
    v25[3] = &unk_100075048;
    id v26 = v18;
    id v23 = v18;
    [v19 storeThreadCredentialActiveDataSetRecord:v22 waitForSync:v9 completion:v25];
  }
  else
  {
    id v24 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004DE0C;
    block[3] = &unk_100074F08;
    id v28 = v18;
    id v22 = v18;
    dispatch_async(v24, block);

    id v23 = v28;
  }
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
    v13[2] = sub_10004E060;
    v13[3] = &unk_100075308;
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
    block[2] = sub_10004DFEC;
    block[3] = &unk_100074F08;
    id v10 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v9, block);
  }
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
    v13[2] = sub_10004E29C;
    v13[3] = &unk_100075308;
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
    block[2] = sub_10004E228;
    block[3] = &unk_100074F08;
    id v10 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v9, block);
  }
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
    v13[2] = sub_10004E4D4;
    v13[3] = &unk_100075290;
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
    block[2] = sub_10004E464;
    block[3] = &unk_100074F08;
    id v10 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v9, block);
  }
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
    v13[2] = sub_10004E6B0;
    v13[3] = &unk_100075290;
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
    block[2] = sub_10004E640;
    block[3] = &unk_100074F08;
    id v10 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v9, block);
  }
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
      v18[2] = sub_10004E9C4;
      v18[3] = &unk_100075380;
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
      v21[2] = sub_10004E94C;
      v21[3] = &unk_100074F08;
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
    block[2] = sub_10004E8D4;
    block[3] = &unk_100074F08;
    id v24 = v10;
    dispatch_async(v17, block);

    id v13 = v24;
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
      v16[2] = sub_10004ECEC;
      v16[3] = &unk_100074F08;
      id v17 = v7;
      dispatch_async(v11, v16);

      id v9 = v17;
      goto LABEL_7;
    }
    if (_os_feature_enabled_impl())
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10004ED4C;
      v13[3] = &unk_1000753A8;
      id v14 = v6;
      id v15 = v7;
      [v8 retrievePreferredNetworkWithCompletion:v13];

      id v9 = v14;
LABEL_7:

      goto LABEL_11;
    }
    id v12 = sub_10001CCA0(1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10005293C();
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
  else
  {
    id v10 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004EC8C;
    block[3] = &unk_100074F08;
    id v19 = v7;
    dispatch_async(v10, block);

    id v8 = v19;
  }
LABEL_11:
}

- (void)updatePreferredNetworkInternallyWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004EFC8;
    v6[3] = &unk_1000753D0;
    id v7 = v4;
    [v5 updatePreferredNetworkInternallyWithCompletion:v6];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)cleanThreadKeychainDatabase:(id)a3
{
  id v4 = a3;
  v5 = [(THThreadNetworkCredentialsStoreLocalClient *)self backingStore];
  if (v5)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10004F174;
    v10[3] = &unk_100075290;
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
    block[2] = sub_10004F104;
    block[3] = &unk_100074F08;
    id v6 = &v13;
    id v13 = v4;
    id v9 = v4;
    dispatch_async(v8, block);
  }
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
    v13[2] = sub_10004F340;
    v13[3] = &unk_100075308;
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
    block[2] = sub_10004F2CC;
    block[3] = &unk_100074F08;
    id v9 = &v16;
    id v16 = v7;
    id v12 = v7;
    dispatch_async(v11, block);
  }
}

- (id)setFromSpinelFrame:(const char *)a3 data_len:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = sub_10001CCA0(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100052DD8(v4, v6);
  }

  sub_10000A244((unsigned __int8 *)a3, v4, __b, 0x3E8uLL, 0);
  id v7 = sub_10001CCA0(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_100052D60();
  }

  if (v4)
  {
    id v8 = 0;
    id v9 = 0;
    id v10 = 0;
    unsigned __int8 v47 = 0;
    while (1)
    {
      id v11 = sub_10001CCA0(1);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v66 = v4;
        *(_WORD *)&v66[4] = 1024;
        *(_DWORD *)&v66[6] = 955;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#MOS : data_len : %d, Line : %d", buf, 0xEu);
      }

      uint64_t v54 = 0;
      unsigned int v53 = 0;
      int v17 = spinel_datatype_unpack((uint64_t)a3, v4, (uint64_t)"d", v12, v13, v14, v15, v16, (uint64_t)&v54);
      id v18 = sub_10001CCA0(1);
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
      uint64_t v51 = 0;
      unsigned int v50 = 0;
      v46 = &v51;
      int v24 = spinel_datatype_unpack(v54, v53, (uint64_t)"iD", v19, v20, v21, v22, v23, (uint64_t)&v52);
      v25 = sub_10001CCA0(1);
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
          v39 = sub_10001CCA0(1);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            sub_100052D20(v57, v58, v39);
          }

          uint64_t v40 = +[NSData dataWithBytes:v51 length:v50];

          v41 = sub_10001CCA0(1);
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
          v35 = sub_10001CCA0(1);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            sub_100052C60(v63, v64, v35);
          }

          v34 = +[NSData dataWithBytes:v51 length:v50];

          v36 = sub_10001CCA0(1);
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
          if ((int)spinel_datatype_unpack(v51, v50, (uint64_t)"C", v26, v27, v28, v29, v30, (uint64_t)&v49) < 1) {
            goto LABEL_53;
          }
          v38 = sub_10001CCA0(1);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            sub_100052CE0(v59, v60, v38);
          }

          unsigned __int8 v47 = v49;
          v37 = sub_10001CCA0(1);
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
          if ((int)spinel_datatype_unpack(v51, v50, (uint64_t)"S", v26, v27, v28, v29, v30, (uint64_t)&v49) < 1) {
            goto LABEL_53;
          }
          v31 = sub_10001CCA0(1);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            sub_100052CA0(v61, v62, v31);
          }

          unsigned __int16 v48 = bswap32(v49) >> 16;
          uint64_t v32 = +[NSData dataWithBytes:&v48 length:2];

          v33 = sub_10001CCA0(1);
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
      v37 = sub_10001CCA0(1);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_100052C20(v55, v56, v37);
      }
LABEL_39:

LABEL_45:
      v34 = v9;
LABEL_46:
      a3 += v17;
      id v9 = v34;
      uint64_t v4 = (v4 - v17);
      if (!v4) {
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
    v44 = sub_10001CCA0(1);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      sub_100052BA8();
    }
  }
  else
  {
    id v9 = v34;
LABEL_53:
    v44 = sub_10001CCA0(1);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      sub_100052B2C();
    }
    v43 = 0;
    v34 = v9;
  }

  return v43;
}

- (id)parseDataSetFromSpinel:(const char *)a3 data_len:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = sub_10001CCA0(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10005300C();
  }

  sub_10000A244((unsigned __int8 *)a3, v4, __b, 0x3E8uLL, 0);
  id v7 = sub_10001CCA0(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_100052F90();
  }

  if (v4)
  {
    id v8 = 0;
    id v9 = 0;
    id v10 = 0;
    id v11 = 0;
    uint64_t v12 = 0;
    unsigned __int8 v69 = 0;
    while (1)
    {
      uint64_t v13 = sub_10001CCA0(1);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v80 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
        __int16 v81 = 1024;
        *(_DWORD *)v82 = v4;
        *(_WORD *)&v82[4] = 1024;
        *(_DWORD *)&v82[6] = 1101;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s: #MOS : data_len : %d, Line : %d", buf, 0x18u);
      }

      uint64_t v76 = 0;
      unsigned int v75 = 0;
      int v19 = spinel_datatype_unpack((uint64_t)a3, v4, (uint64_t)"d", v14, v15, v16, v17, v18, (uint64_t)&v76);
      uint64_t v20 = sub_10001CCA0(1);
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
      uint64_t v73 = 0;
      unsigned int v72 = 0;
      int v68 = &v73;
      int v26 = spinel_datatype_unpack(v76, v75, (uint64_t)"iD", v21, v22, v23, v24, v25, (uint64_t)&v74);
      uint64_t v27 = sub_10001CCA0(1);
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
          if ((int)spinel_datatype_unpack(v73, v72, (uint64_t)"U", v28, v29, v30, v31, v32, (uint64_t)&v71) < 1) {
            goto LABEL_80;
          }
          v33 = sub_10001CCA0(1);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v80 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
            __int16 v81 = 1024;
            *(_DWORD *)v82 = 1152;
            _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded Network Name Line : %d", buf, 0x12u);
          }

          v34 = +[NSString stringWithUTF8String:v71];

          v35 = sub_10001CCA0(1);
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
            sub_100052F18(v35, v37, v38, v39, v40, v41, v42, v43);
          }

          id v8 = 0;
          goto LABEL_80;
        case 'E':
          if (!v72) {
            goto LABEL_80;
          }
          unsigned __int16 v48 = sub_10001CCA0(1);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v80 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
            __int16 v81 = 1024;
            *(_DWORD *)v82 = 1166;
            _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded XPAN ID : %d", buf, 0x12u);
          }

          uint64_t v49 = +[NSData dataWithBytes:v73 length:v72];

          unsigned int v50 = sub_10001CCA0(1);
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
          uint64_t v51 = sub_10001CCA0(1);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v80 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
            __int16 v81 = 1024;
            *(_DWORD *)v82 = 1176;
            _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded master key Line : %d", buf, 0x12u);
          }

          uint64_t v52 = +[NSData dataWithBytes:v73 length:v72];

          unsigned int v53 = sub_10001CCA0(1);
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
          uint64_t v54 = sub_10001CCA0(1);
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v80 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
            __int16 v81 = 1024;
            *(_DWORD *)v82 = 1225;
            _os_log_error_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded pskc Line : %d", buf, 0x12u);
          }

          uint64_t v55 = +[NSData dataWithBytes:v73 length:v72];

          v56 = sub_10001CCA0(1);
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
            if ((int)spinel_datatype_unpack(v73, v72, (uint64_t)"C", v28, v29, v30, v31, v32, (uint64_t)&v71) < 1) {
              goto LABEL_80;
            }
            v57 = sub_10001CCA0(1);
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v80 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
              __int16 v81 = 1024;
              *(_DWORD *)v82 = 1215;
              _os_log_error_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded channel Line : %d", buf, 0x12u);
            }

            unsigned __int8 v69 = v71;
            unsigned __int8 v47 = sub_10001CCA0(1);
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
            unsigned __int8 v47 = sub_10001CCA0(1);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
              sub_100052ED8(v77, v78, v47);
            }
LABEL_55:

            goto LABEL_56;
          }
          LOWORD(v71) = 0;
          if ((int)spinel_datatype_unpack(v73, v72, (uint64_t)"S", v28, v29, v30, v31, v32, (uint64_t)&v71) < 1) {
            goto LABEL_80;
          }
          v44 = sub_10001CCA0(1);
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

          v46 = sub_10001CCA0(1);
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
          uint64_t v4 = (v4 - v19);
          if (!v4) {
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
    v59 = sub_10001CCA0(1);
    BOOL v60 = os_log_type_enabled(v59, OS_LOG_TYPE_ERROR);
    if (v58)
    {
      if (v60) {
        sub_100052E60();
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
        v66 = sub_10001CCA0(1);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
          sub_1000415D8();
        }
      }
      else
      {
        v65 = sub_10001CCA0(1);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
          sub_10004153C();
        }
      }
    }
    else
    {
      if (v60) {
        sub_100041508();
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
  id v6 = sub_10001CCA0(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_1000539A8();
  }

  sub_10000A244((unsigned __int8 *)a3, a4, __b, 0x3E8uLL, 0);
  id v7 = sub_10001CCA0(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_10005392C();
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
        uint64_t v18 = sub_10001CCA0(1);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_10005317C();
        }
LABEL_132:
        id v54 = 0;
        goto LABEL_133;
      }
      int v16 = a3[v11];
      switch(a3[v11])
      {
        case 0:
          uint64_t v17 = sub_10001CCA0(1);
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
            uint64_t v18 = sub_10001CCA0(1);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              sub_1000534D0();
            }
            goto LABEL_132;
          }
          if (a3[v14])
          {
            uint64_t v18 = sub_10001CCA0(1);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              sub_100053458();
            }
            goto LABEL_132;
          }
          int v10 = a3[v11 + 4];
          uint64_t v18 = sub_10001CCA0(1);
          BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
          if ((v10 - 27) <= 0xEFu)
          {
            if (v19) {
              sub_1000533E4();
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
          uint64_t v27 = sub_10001CCA0(1);
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
            uint64_t v18 = sub_10001CCA0(1);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              sub_10005354C();
            }
            goto LABEL_132;
          }
          uint64_t v28 = +[NSData dataWithBytes:&a3[v14] length:2];

          uint64_t v18 = sub_10001CCA0(1);
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
          uint64_t v29 = sub_10001CCA0(1);
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
            uint64_t v18 = sub_10001CCA0(1);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              sub_1000535C8();
            }
            goto LABEL_132;
          }
          uint64_t v30 = +[NSData dataWithBytes:&a3[v14] length:8];

          uint64_t v18 = sub_10001CCA0(1);
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
          uint64_t v31 = sub_10001CCA0(1);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v66 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]";
            __int16 v67 = 1024;
            *(_DWORD *)int v68 = 1457;
            _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded Network Name Line : %d", buf, 0x12u);
          }

          uint64_t v32 = +[NSString stringWithUTF8String:v70];

          uint64_t v18 = sub_10001CCA0(1);
          BOOL v33 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
          if (!v32)
          {
            if (v33) {
              sub_10005336C(v18, v34, v35, v36, v37, v38, v39, v40);
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
          uint64_t v41 = sub_10001CCA0(1);
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
            uint64_t v18 = sub_10001CCA0(1);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              sub_100053644();
            }
            goto LABEL_132;
          }
          uint64_t v42 = +[NSData dataWithBytes:&a3[v14] length:16];

          uint64_t v18 = sub_10001CCA0(1);
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
          uint64_t v43 = sub_10001CCA0(1);
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
            uint64_t v18 = sub_10001CCA0(1);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              sub_1000536C0();
            }
            goto LABEL_132;
          }
          uint64_t v44 = +[NSData dataWithBytes:&a3[v14] length:16];

          uint64_t v18 = sub_10001CCA0(1);
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
          uint64_t v45 = sub_10001CCA0(1);
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
          uint64_t v18 = sub_10001CCA0(1);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            sub_100053834();
          }
          goto LABEL_132;
        case 0xC:
          v46 = sub_10001CCA0(1);
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
            uint64_t v18 = sub_10001CCA0(1);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              sub_1000537B8();
            }
            goto LABEL_132;
          }
          if (!a3[v14] && !a3[v11 + 3])
          {
            uint64_t v18 = sub_10001CCA0(1);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              sub_10005373C();
            }
            goto LABEL_132;
          }
          goto LABEL_63;
        default:
          if (v16 == 53)
          {
            uint64_t v23 = sub_10001CCA0(1);
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
                uint64_t v18 = sub_10001CCA0(1);
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
                  sub_1000532F0();
                }
                goto LABEL_132;
              }
              int v26 = a3[v24];
              v24 += 6;
              if (v26 != 4)
              {
                uint64_t v18 = sub_10001CCA0(1);
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
                  sub_100053274();
                }
                goto LABEL_132;
              }
            }
            uint64_t v18 = sub_10001CCA0(1);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              sub_1000531F8();
            }
            goto LABEL_132;
          }
LABEL_29:
          uint64_t v18 = sub_10001CCA0(1);
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
    uint64_t v18 = sub_10001CCA0(1);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000538B0();
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
    uint64_t v49 = sub_10001CCA0(1);
    BOOL v50 = os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (v50) {
        sub_100053088();
      }

      id v51 = [objc_alloc((Class)THThreadNetwork) initWithName:v8 extendedPANID:v64];
      if (!v51)
      {
        uint64_t v55 = sub_10001CCA0(1);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
          sub_10004153C();
        }

        goto LABEL_132;
      }
      uint64_t v52 = v51;
      id v53 = [objc_alloc((Class)THThreadNetworkCredentialsStoreRecord) initWithNetwork:v51 credentials:v18 uniqueIdentifier:0 keychainAccessGroup:@"com.apple.thread.network" creationDate:0 lastModificationDate:0];
      if (!v53)
      {
        v57 = sub_10001CCA0(1);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
          sub_1000415D8();
        }

        goto LABEL_132;
      }
      id v54 = v53;
    }
    else
    {
      if (v50) {
        sub_100041508();
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
    uint64_t v18 = sub_10001CCA0(1);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100053100();
    }
    id v54 = 0;
  }

  return v54;
}

- (id)parseCredsFromTLVs:(const char *)a3 data_len:(unsigned int)a4
{
  id v6 = sub_10001CCA0(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_1000543C0();
  }

  sub_10000A244((unsigned __int8 *)a3, a4, __b, 0x3E8uLL, 0);
  id v7 = sub_10001CCA0(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_100054344();
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
        uint64_t v17 = sub_10001CCA0(1);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_1000542C8();
        }
        goto LABEL_96;
      }
      uint64_t v12 = a3[v11];
      uint64_t v13 = v10 + 2;
      unsigned int v14 = v10 + 2 + v12;
      if (v14 > a4)
      {
        uint64_t v17 = sub_10001CCA0(1);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_100053B94();
        }
        goto LABEL_96;
      }
      int v15 = a3[v10];
      switch(a3[v10])
      {
        case 0:
          int v16 = sub_10001CCA0(1);
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
            uint64_t v17 = sub_10001CCA0(1);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              sub_100053EE8();
            }
            goto LABEL_96;
          }
          if (a3[v13])
          {
            uint64_t v17 = sub_10001CCA0(1);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              sub_100053E70();
            }
            goto LABEL_96;
          }
          int v9 = a3[v10 + 4];
          uint64_t v17 = sub_10001CCA0(1);
          BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
          if ((v9 - 27) <= 0xEFu)
          {
            if (v18) {
              sub_100053DFC();
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
          int v26 = sub_10001CCA0(1);
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
            uint64_t v17 = sub_10001CCA0(1);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              sub_100053F64();
            }
            goto LABEL_96;
          }
          uint64_t v27 = +[NSData dataWithBytes:&a3[v13] length:2];

          uint64_t v17 = sub_10001CCA0(1);
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
          uint64_t v28 = sub_10001CCA0(1);
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
            uint64_t v17 = sub_10001CCA0(1);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              sub_100053FE0();
            }
            goto LABEL_96;
          }
          uint64_t v29 = +[NSData dataWithBytes:&a3[v13] length:8];

          uint64_t v17 = sub_10001CCA0(1);
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
          uint64_t v30 = sub_10001CCA0(1);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v59 = "-[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]";
            __int16 v60 = 1024;
            *(_DWORD *)uint64_t v61 = 1745;
            _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded Network Name Line : %d", buf, 0x12u);
          }

          uint64_t v31 = +[NSString stringWithUTF8String:v63];

          uint64_t v17 = sub_10001CCA0(1);
          BOOL v32 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
          if (!v31)
          {
            if (v32) {
              sub_100053D84(v17, v33, v34, v35, v36, v37, v38, v39);
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
          uint64_t v40 = sub_10001CCA0(1);
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
            uint64_t v17 = sub_10001CCA0(1);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              sub_10005405C();
            }
            goto LABEL_96;
          }
          uint64_t v41 = +[NSData dataWithBytes:&a3[v13] length:16];

          uint64_t v17 = sub_10001CCA0(1);
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
          uint64_t v42 = sub_10001CCA0(1);
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
            uint64_t v17 = sub_10001CCA0(1);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              sub_1000540D8();
            }
            goto LABEL_96;
          }
          uint64_t v43 = +[NSData dataWithBytes:&a3[v13] length:16];

          uint64_t v17 = sub_10001CCA0(1);
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
          uint64_t v44 = sub_10001CCA0(1);
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
          uint64_t v17 = sub_10001CCA0(1);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            sub_10005424C();
          }
          goto LABEL_96;
        case 0xC:
          uint64_t v45 = sub_10001CCA0(1);
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
            uint64_t v17 = sub_10001CCA0(1);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              sub_1000541D0();
            }
            goto LABEL_96;
          }
          if (!a3[v13] && !a3[v10 + 3])
          {
            uint64_t v17 = sub_10001CCA0(1);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              sub_100054154();
            }
            goto LABEL_96;
          }
          goto LABEL_63;
        default:
          if (v15 == 53)
          {
            uint32_t v22 = sub_10001CCA0(1);
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
                uint64_t v17 = sub_10001CCA0(1);
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
                  sub_100053D08();
                }
                goto LABEL_96;
              }
              int v25 = a3[v23];
              v23 += 6;
              if (v25 != 4)
              {
                uint64_t v17 = sub_10001CCA0(1);
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
                  sub_100053C8C();
                }
                goto LABEL_96;
              }
            }
            uint64_t v17 = sub_10001CCA0(1);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              sub_100053C10();
            }
LABEL_96:

LABEL_97:
            unsigned __int16 v48 = sub_10001CCA0(1);
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
              sub_100053A24();
            }
LABEL_99:
            unsigned __int8 v47 = 0;
            goto LABEL_100;
          }
LABEL_29:
          uint64_t v17 = sub_10001CCA0(1);
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
    unsigned __int16 v48 = sub_10001CCA0(1);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      sub_100053B18();
    }
    goto LABEL_99;
  }
  LOBYTE(v53) = 1;
  id v46 = [objc_alloc((Class)THThreadNetworkCredentials) initWithMasterKey:v57 passPhrase:0 PSKc:v56 channel:v9 PANID:v55 userInfo:0 credentialDataSet:0 isActiveDevice:v53];
  if (!v46) {
    goto LABEL_97;
  }
  unsigned __int8 v47 = v46;
  unsigned __int16 v48 = sub_10001CCA0(1);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
    sub_100053AA0();
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

@end