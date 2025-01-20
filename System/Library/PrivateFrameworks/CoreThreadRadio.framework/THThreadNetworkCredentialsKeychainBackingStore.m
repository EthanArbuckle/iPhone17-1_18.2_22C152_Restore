@interface THThreadNetworkCredentialsKeychainBackingStore
+ (id)defaultBackingStore;
- (BOOL)DBGstorePreferred:(id)a3;
- (BOOL)areValidDataSetTLVs:(id)a3;
- (BOOL)areValidDataSetTLVs:(id)a3 creds:(id *)a4;
- (BOOL)checkIfActiveDatasetRecordIsPresentInTheGivenList:(id)a3 Missinglist:(id)a4 record:(id)a5;
- (BOOL)checkIfNetworkMatchToMDNSScan:(id)a3 borderAgentID:(id)a4;
- (BOOL)checkIfPrefEntryForCurrentSignatureIsMissingSSID:(id)a3 nwSignature:(id)a4;
- (BOOL)checkIfXpanIDMatchToMDNSScan:(id)a3;
- (BOOL)checkWiFiStatus;
- (BOOL)deleteAllRecordsForKeychainAccessGroup:(id)a3;
- (BOOL)deleteOldEntryForTheNetworkSignatureIfThreadNetworkIsDifferent:(id)a3 nwSignature:(id)a4;
- (BOOL)deletePreferredNetworkEntry:(id)a3;
- (BOOL)deletePreferredNetworkEntryWithoutRecords:(id)a3;
- (BOOL)fetchRecord:(id)a3;
- (BOOL)isEthernetNetwork;
- (BOOL)isFrozenRecord:(id)a3;
- (BOOL)isMatchingMdnsRecords:(id)a3 preferredNw:(id)a4;
- (BOOL)isMatchingNetworkSignature:(id)a3 preferredNwSignature:(id)a4;
- (BOOL)isMatchingNetworkSignature:(id)a3 preferredNwSignature:(id)a4 preferred:(id)a5 signaturePrefEntries:(id)a6 updatedPreferred:(id *)a7;
- (BOOL)isPreferred:(id)a3;
- (BOOL)isWiFiNetwork;
- (BOOL)markAsPreferred:(id)a3;
- (BOOL)matchPreferredNetworkRecordWithMdns:(id)a3;
- (BOOL)skipDeleteWithBorderAgent:(id)a3;
- (BOOL)skipDeleteWithUUID:(id)a3;
- (BOOL)storeFrozenThreadNetwork:(id)a3;
- (BOOL)storePreferred:(id)a3;
- (BOOL)storePreferredEntryAndCheckForDup:(id)a3 isDuplicate:(int *)a4;
- (BOOL)storePreferredNetworkWithRecord:(id)a3;
- (BOOL)updatePreferredNetwork;
- (BOOL)updatePreferredNetworkEntry:(id)a3;
- (BOOL)updateRecord:(id)a3;
- (BOOL)updateRecordToPreferredNetworkEntry:(id)a3 credentialsDataSetRecord:(id)a4;
- (BOOL)wifiInfoAvailable:(id)a3;
- (id)_doFetchActiveDataSetRecords:(id)a3 error:(id *)a4;
- (id)_doFetchFrozenThreadNetworks:(id)a3 error:(id *)a4;
- (id)_doFetchOneActiveDataSetRecords:(id)a3 error:(id *)a4;
- (id)_doFetchPreferredNetworks:(id)a3 error:(id *)a4;
- (id)_doFetchRecords:(id)a3 error:(id *)a4;
- (id)checkIfNetworkSignatureUpdateIsRequiredForPreferredNetwork:(id)a3 nwSignature:(id)a4;
- (id)checkIfNetworkSignatureUpdateIsRequiredForPreferredNetwork:(id)a3 nwSignature:(id)a4 signaturePrefEntries:(id)a5;
- (id)checkIfPrefItemPresentInTheCleanupList:(id)a3 cleanupList:(id)a4;
- (id)dataFromHexString:(id)a3;
- (id)deleteActiveDataSetRecordForNetworkAndBorderAgentId:(id)a3 borderAgent:(id)a4;
- (id)generateCredentials;
- (id)getActiveDataSetRecord:(id)a3;
- (id)getActiveDataSetRecordForNetworkAndBorderAgentId:(id)a3 borderAgent:(id)a4;
- (id)getActiveRecords:(id)a3;
- (id)getAllPrefEntries;
- (id)getNetworkSignature;
- (id)getNumberOfPrefEntriesForTheCount:(int)a3;
- (id)getNumberOfRecordsForKeychainAccessGroup:(id)a3 count:(int)a4;
- (id)getOneRecordForNetwork:(id)a3;
- (id)getPrefEntriesForLabelAsSSID:(id)a3;
- (id)getPrefEntriesForSSID:(id)a3;
- (id)getPrefEntriesForSSIDAndSignature:(id)a3;
- (id)getPrefEntriesForSignature:(id)a3;
- (id)getPreferredNetwork:(BOOL)a3;
- (id)getPreferredNetwork:(BOOL)a3 skipScan:(BOOL)a4;
- (id)getPreferredNetworkInternally;
- (id)getPreferredNetworkWithRecords;
- (id)getRecordForPreferredNetwork:(BOOL)a3 anyDsFormat:(BOOL)a4;
- (id)getRecordForPreferredNetwork:(BOOL)a3 anyDsFormat:(BOOL)a4 skipScan:(BOOL)a5;
- (id)getTheKeyFromPreferredNetworkEntry:(id)a3;
- (id)getTheMdnsMatchingEntryFromTheList:(id)a3;
- (id)matchPreferredNetworkWithMdns:(id)a3;
- (id)matchPreferredNetworkWithNetworkSignature:(id)a3 nwSignature:(id)a4;
- (id)sortAndReturnPreferredNetwork:(id)a3;
- (id)sortAndReturnPreferredNetwork:(id)a3 onlyMdns:(BOOL)a4;
- (unint64_t)getCountOfThreadBorderRoutersWithMdns:(id)a3;
- (void)addPreferredNetworkWithCompletionInternally:(id)a3 borderAgentID:(id)a4 ipV4NwSignature:(id)a5 ipv6NwSignature:(id)a6 wifiSSID:(id)a7 wifiPassword:(id)a8 completion:(id)a9;
- (void)checkIfRecordForPreferredNetworkIsPresentWithCompletion:(id)a3;
- (void)cleanThreadKeychainDatabase:(id)a3;
- (void)deleteActiveDataSetRecordForThreadBorderAgent:(id)a3 completion:(id)a4;
- (void)deleteActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup:(id)a3 keychainAccessGroup:(id)a4 completion:(id)a5;
- (void)deleteActiveDataSetRecordWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)deleteActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup:(id)a3 keychainAccessGroup:(id)a4 completion:(id)a5;
- (void)deletePreferredAndFrozenThreadNetworksWithCompletion:(id)a3;
- (void)deletePreferredNetworkEntryWithCompletion:(id)a3 completion:(id)a4;
- (void)deletePreferredNetworkForNetworkSignatureInternallyWithCompletion:(id)a3 ipv6NwSignature:(id)a4 wifiSSID:(id)a5 completion:(id)a6;
- (void)deletePreferredNetworkWithCompletion:(id)a3;
- (void)deleteRecordWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)dispatchRemoveExcessPreferredEntry;
- (void)dispatchRemoveInActiveRecords:(id)a3;
- (void)dumpFrozenThreadNetworks:(id)a3;
- (void)dumpPreferredNetwork:(id)a3;
- (void)dumpPreferredNetworks:(id)a3;
- (void)dumpPreferredNetworksArray:(id)a3;
- (void)errorout:(int)a3 completion:(id)a4;
- (void)generateCredentials;
- (void)getAllPrefEntries;
- (void)getNetworkSignature;
- (void)getPreferredNetworkWithRecords;
- (void)getSecFlags:(char *)a3;
- (void)retrieveActiveDataSetRecordForThreadBorderAgent:(id)a3 completion:(id)a4;
- (void)retrieveActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup:(id)a3 keychainAccessGroup:(id)a4 completion:(id)a5;
- (void)retrieveActiveDataSetRecordOnMdnsWithExtendedPANId:(id)a3 completion:(id)a4;
- (void)retrieveActiveDataSetRecordWithExtendedPANId:(id)a3 completion:(id)a4;
- (void)retrieveActiveDataSetRecordWithTLVsForThreadBorderAgent:(id)a3 completion:(id)a4;
- (void)retrieveActiveDataSetRecordWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)retrieveActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup:(id)a3 keychainAccessGroup:(id)a4 completion:(id)a5;
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
- (void)sendCAMetricsForCleanUpRecordInfo:(cleanUpStats *)a3;
- (void)storeActiveDataSetRecordAndSync:(id)a3 completion:(id)a4;
- (void)storeCachedAODasPreferredNetwork:(id)a3 completion:(id)a4;
- (void)storeRecord:(id)a3 completion:(id)a4;
- (void)storeRecord:(id)a3 waitForSync:(BOOL)a4 completion:(id)a5;
- (void)storeRecordAndSync:(id)a3 completion:(id)a4;
- (void)storeThreadCredentialActiveDataSetRecord:(id)a3 waitForSync:(BOOL)a4 completion:(id)a5;
- (void)thDumpActiveDatasetRecord:(id)a3;
- (void)updatePreferredNetwork;
- (void)updatePreferredNetworkInternallyWithCompletion:(id)a3;
- (void)updatePreferredNetworkWithNewDatasetRecord:(id)a3 completion:(id)a4;
- (void)validateAODInternally:(id)a3 completion:(id)a4;
- (void)validateRecordWithMdnsScan:(id)a3 borderAgentID:(id)a4 completion:(id)a5;
@end

@implementation THThreadNetworkCredentialsKeychainBackingStore

+ (id)defaultBackingStore
{
  if (defaultBackingStore_onceToken != -1) {
    dispatch_once(&defaultBackingStore_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)defaultBackingStore_singleton;

  return v2;
}

void __69__THThreadNetworkCredentialsKeychainBackingStore_defaultBackingStore__block_invoke(id a1)
{
  v1 = objc_alloc_init(THThreadNetworkCredentialsKeychainBackingStore);
  v2 = (void *)defaultBackingStore_singleton;
  defaultBackingStore_singleton = (uint64_t)v1;
}

- (id)_doFetchRecords:(id)a3 error:(id *)a4
{
  CFTypeRef result = 0;
  OSStatus v5 = SecItemCopyMatching((CFDictionaryRef)a3, &result);
  if (v5)
  {
    OSStatus v6 = v5;
    if (v5 == -25300)
    {
      v7 = +[NSSet set];
    }
    else
    {
      v17 = (__CFString *)SecCopyErrorMessageString(v5, 0);
      v18 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore _doFetchRecords:error:]();
      }

      if (a4)
      {
        v19 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v6 userInfo:0];
        *a4 = +[NSError storeError:2 underlyingError:v19 description:v17];
      }
      v7 = 0;
    }
  }
  else
  {
    v8 = (void *)result;
    if (result && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v20 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore _doFetchRecords:error:]();
      }

      if (a4)
      {
        +[NSError storeError:3 description:@"Bad return type from SecItemCopyMatching"];
        v7 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }
    }
    else
    {
      v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v22 = v8;
      id v10 = v8;
      id v11 = [v10 countByEnumeratingWithState:&v23 objects:v32 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v24;
        do
        {
          v14 = 0;
          do
          {
            if (*(void *)v24 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = +[THThreadNetworkCredentialsStoreRecord recordFromKeychainDictionary:*(void *)(*((void *)&v23 + 1) + 8 * (void)v14)];
            if (v15)
            {
              [v9 addObject:v15];
            }
            else
            {
              v16 = THCredentialsServerLogHandleForCategory(1);
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v29 = "-[THThreadNetworkCredentialsKeychainBackingStore _doFetchRecords:error:]";
                __int16 v30 = 1024;
                int v31 = 107;
                _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s:%d: Failed to interpret keychain item! SKIPPING!", buf, 0x12u);
              }
            }
            v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          id v12 = [v10 countByEnumeratingWithState:&v23 objects:v32 count:16];
        }
        while (v12);
      }

      v7 = +[NSSet setWithArray:v9];

      v8 = v22;
    }
  }

  return v7;
}

- (void)retrieveAllRecordsForNetwork:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __90__THThreadNetworkCredentialsKeychainBackingStore_retrieveAllRecordsForNetwork_completion___block_invoke;
  block[3] = &unk_100499258;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __90__THThreadNetworkCredentialsKeychainBackingStore_retrieveAllRecordsForNetwork_completion___block_invoke(uint64_t a1)
{
  v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [*(id *)(a1 + 32) networkName];
    OSStatus v5 = [*(id *)(a1 + 32) extendedPANID];
    *(_DWORD *)buf = 138412546;
    id v12 = v4;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to fetch credentials for network (name=%@, xpanid=%@)", buf, 0x16u);
  }
  id v6 = +[THThreadNetworkCredentialsStoreRecord keyChainQueryForFetchOperationForNetwork:*(void *)(a1 + 32)];
  id v7 = *(void **)(a1 + 40);
  id v10 = 0;
  v8 = [v7 _doFetchRecords:v6 error:&v10];
  id v9 = v10;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)retrieveAllRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  OSStatus v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __83__THThreadNetworkCredentialsKeychainBackingStore_retrieveAllRecordsWithCompletion___block_invoke;
  v7[3] = &unk_100499280;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __83__THThreadNetworkCredentialsKeychainBackingStore_retrieveAllRecordsWithCompletion___block_invoke(uint64_t a1)
{
  v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to fetch all credentials", buf, 2u);
  }

  id v4 = +[THThreadNetworkCredentialsStoreRecord keyChainQueryForFetchAllOperation];
  OSStatus v5 = *(void **)(a1 + 32);
  id v12 = 0;
  id v6 = [v5 _doFetchRecords:v4 error:&v12];
  id v7 = v12;
  id v8 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "fetched all credentials", v11, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v9 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "fetched all credentials, and completion block is done", v10, 2u);
  }
}

- (void)retrieveRecordWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __96__THThreadNetworkCredentialsKeychainBackingStore_retrieveRecordWithUniqueIdentifier_completion___block_invoke;
  block[3] = &unk_100499258;
  id v12 = v6;
  __int16 v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __96__THThreadNetworkCredentialsKeychainBackingStore_retrieveRecordWithUniqueIdentifier_completion___block_invoke(void *a1)
{
  v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = a1[4];
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to fetch credential with UUID %@", buf, 0xCu);
  }

  OSStatus v5 = +[THThreadNetworkCredentialsStoreRecord keyChainQueryForFetchOneOperationForUniqueIdentifier:a1[4]];
  id v6 = (void *)a1[5];
  id v11 = 0;
  id v7 = [v6 _doFetchRecords:v5 error:&v11];
  id v8 = v11;
  uint64_t v9 = a1[6];
  id v10 = [v7 anyObject];
  (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v8);
}

- (void)errorout:(int)a3 completion:(id)a4
{
  OSStatus v5 = (void (**)(id, void, void *))a4;
  id v6 = (__CFString *)SecCopyErrorMessageString(a3, 0);
  id v7 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[THThreadNetworkCredentialsKeychainBackingStore errorout:completion:]();
  }

  id v8 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:a3 userInfo:0];
  uint64_t v9 = +[NSError storeError:2 underlyingError:v8 description:v6];
  v5[2](v5, 0, v9);
}

- (void)storeRecordAndSync:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(0, 0);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  uint64_t v9 = [v6 keyChainItemRepresentationForAddOperation];
  if (v9)
  {
    id v22 = 0;
    id v10 = +[CKKSControl controlObject:&v22];
    id v11 = v22;
    if (v10)
    {
      uint64_t v12 = kSecAttrViewHintHome;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = __80__THThreadNetworkCredentialsKeychainBackingStore_storeRecordAndSync_completion___block_invoke;
      v14[3] = &unk_100499348;
      v20 = v23;
      id v15 = v8;
      id v16 = v6;
      id v19 = v7;
      id v17 = v9;
      v18 = self;
      __int16 v21 = 120;
      [v10 rpcKnownBadState:v12 reply:v14];

      uint64_t v13 = v15;
    }
    else
    {
      uint64_t v13 = +[NSError storeError:5 description:@"CKKS object allocation failed"];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v13);
      id v10 = 0;
    }
  }
  else
  {
    uint64_t v13 = +[NSError storeError:4 description:@"Bad network parameter"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v13);
    id v11 = 0;
    id v10 = 0;
  }

  _Block_object_dispose(v23, 8);
}

void __80__THThreadNetworkCredentialsKeychainBackingStore_storeRecordAndSync_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a2 == 0;
  uint64_t v4 = THCredentialsServerLogHandleForCategory(1);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CKKS response for known state is Likely good", buf, 2u);
    }

    dispatch_group_t v7 = dispatch_group_create();
    *(void *)buf = 0;
    v42 = buf;
    uint64_t v43 = 0x2020000000;
    char v44 = 0;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = __80__THThreadNetworkCredentialsKeychainBackingStore_storeRecordAndSync_completion___block_invoke_32;
    v37[3] = &unk_1004992A8;
    uint64_t v8 = *(void *)(a1 + 72);
    v39 = buf;
    uint64_t v40 = v8;
    id v6 = v7;
    v38 = v6;
    uint64_t v9 = objc_retainBlock(v37);
    dispatch_group_enter(v6);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __80__THThreadNetworkCredentialsKeychainBackingStore_storeRecordAndSync_completion___block_invoke_34;
    block[3] = &unk_1004992D0;
    uint64_t v36 = *(void *)(a1 + 72);
    id v10 = *(NSObject **)(a1 + 32);
    id v34 = *(id *)(a1 + 40);
    id v35 = *(id *)(a1 + 64);
    dispatch_group_notify(v6, v10, block);
    v28 = _NSConcreteStackBlock;
    uint64_t v29 = 3221225472;
    __int16 v30 = __80__THThreadNetworkCredentialsKeychainBackingStore_storeRecordAndSync_completion___block_invoke_35;
    int v31 = &unk_1004992F8;
    id v11 = v9;
    id v32 = v11;
    uint64_t v12 = _SecItemAddAndNotifyOnSync();
    uint64_t v13 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = "error";
      v46 = "-[THThreadNetworkCredentialsKeychainBackingStore storeRecordAndSync:completion:]_block_invoke";
      *(_DWORD *)v45 = 136315650;
      if (!v12) {
        id v14 = "success";
      }
      __int16 v47 = 1024;
      int v48 = 286;
      __int16 v49 = 2080;
      v50 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s:%d _SecItemAddAndNotifyOnSync return value : %s...", v45, 0x1Cu);
    }

    if (v12)
    {
      id v15 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v45 = 136315394;
        v46 = "-[THThreadNetworkCredentialsKeychainBackingStore storeRecordAndSync:completion:]_block_invoke";
        __int16 v47 = 1024;
        int v48 = 292;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s:%d _SecItemAddAndNotifyOnSync returned error", v45, 0x12u);
      }

      if (v12 != -25299) {
        goto LABEL_21;
      }
      id v16 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v45 = 136315138;
        v46 = "-[THThreadNetworkCredentialsKeychainBackingStore storeRecordAndSync:completion:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: Credential exists. Will update instead.", v45, 0xCu);
      }

      CFDictionaryRef v17 = [*(id *)(a1 + 40) keyChainQueryForUpdateOperation];
      CFDictionaryRef v18 = [*(id *)(a1 + 40) keyChainItemRepresentationForUpdateOperation];
      uint64_t v12 = SecItemUpdate(v17, v18);
      if (v12)
      {
        id v19 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v45 = 136315394;
          v46 = "-[THThreadNetworkCredentialsKeychainBackingStore storeRecordAndSync:completion:]_block_invoke";
          __int16 v47 = 1024;
          int v48 = 300;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s:%d SecItemUpdate returned error", v45, 0x12u);
        }

LABEL_21:
        v20 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v45 = 136315394;
          v46 = "-[THThreadNetworkCredentialsKeychainBackingStore storeRecordAndSync:completion:]_block_invoke";
          __int16 v47 = 1024;
          int v48 = 305;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s:%d Returning error", v45, 0x12u);
        }

        [*(id *)(a1 + 56) errorout:v12 completion:*(void *)(a1 + 64)];
        goto LABEL_31;
      }

      long long v25 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v45 = 136315394;
        v46 = "-[THThreadNetworkCredentialsKeychainBackingStore storeRecordAndSync:completion:]_block_invoke";
        __int16 v47 = 1024;
        int v48 = 310;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s:%d Credential exists, updated successfully..", v45, 0x12u);
      }

      char v24 = [*(id *)(a1 + 40) computedUniqueIdentifier];
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    else
    {
      dispatch_time_t v21 = dispatch_time(0, 1000000000 * *(unsigned __int16 *)(a1 + 80));
      id v22 = *(NSObject **)(a1 + 32);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = __80__THThreadNetworkCredentialsKeychainBackingStore_storeRecordAndSync_completion___block_invoke_39;
      v26[3] = &unk_100499320;
      v27 = v11;
      dispatch_after(v21, v22, v26);
      long long v23 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v45 = 136315394;
        v46 = "-[THThreadNetworkCredentialsKeychainBackingStore storeRecordAndSync:completion:]_block_invoke";
        __int16 v47 = 1024;
        int v48 = 330;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s:%d Timer Scheduled !....... ", v45, 0x12u);
      }

      char v24 = v27;
    }

LABEL_31:
    _Block_object_dispose(buf, 8);
    goto LABEL_32;
  }
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CKKS response for known is Not good", buf, 2u);
  }

  id v6 = +[NSError storeError:7 description:@"CKKS response for known state is Not good"];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_32:
}

void __80__THThreadNetworkCredentialsKeychainBackingStore_storeRecordAndSync_completion___block_invoke_32(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 40) + 8) + 24), (unsigned __int8 *)&v4, 1u);
  BOOL v5 = v4 == 0;
  id v6 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    uint64_t v13 = "-[THThreadNetworkCredentialsKeychainBackingStore storeRecordAndSync:completion:]_block_invoke";
    __int16 v14 = 1024;
    int v15 = 227;
    __int16 v16 = 1024;
    LODWORD(v17) = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s:%d nowFinished : %d", (uint8_t *)&v12, 0x18u);
  }

  if (v5)
  {
    if (v3)
    {
      dispatch_group_t v7 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315650;
        uint64_t v13 = "-[THThreadNetworkCredentialsKeychainBackingStore storeRecordAndSync:completion:]_block_invoke";
        __int16 v14 = 1024;
        int v15 = 235;
        __int16 v16 = 2112;
        id v17 = v3;
        uint64_t v8 = "%s:%d Credential sync error, ErrorInfo : %@ ";
        uint64_t v9 = v7;
        uint32_t v10 = 28;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v10);
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      dispatch_group_t v7 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        int v12 = 136315650;
        uint64_t v13 = "-[THThreadNetworkCredentialsKeychainBackingStore storeRecordAndSync:completion:]_block_invoke";
        __int16 v14 = 1024;
        int v15 = 233;
        __int16 v16 = 1024;
        LODWORD(v17) = v11;
        uint64_t v8 = "%s:%d Credential sync Complete, syncDone : %d";
        uint64_t v9 = v7;
        uint32_t v10 = 24;
        goto LABEL_9;
      }
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __80__THThreadNetworkCredentialsKeychainBackingStore_storeRecordAndSync_completion___block_invoke_34(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v2 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      OSStatus v3 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      int v10 = 136315650;
      int v11 = "-[THThreadNetworkCredentialsKeychainBackingStore storeRecordAndSync:completion:]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 255;
      __int16 v14 = 1024;
      OSStatus v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s:%d Inside group notify block, sync is done, syncDone : %d", (uint8_t *)&v10, 0x18u);
    }

    CFDictionaryRef v4 = [*(id *)(a1 + 32) computedUniqueIdentifier];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    BOOL v5 = [*(id *)(a1 + 32) computedUniqueIdentifier];
    CFDictionaryRef v4 = +[THThreadNetworkCredentialsStoreRecord keyChainQueryForDeleteOperationForUniqueIdentifier:v5];

    OSStatus v6 = SecItemDelete(v4);
    dispatch_group_t v7 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315650;
      int v11 = "-[THThreadNetworkCredentialsKeychainBackingStore storeRecordAndSync:completion:]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 264;
      __int16 v14 = 1024;
      OSStatus v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s:%d sync not done, let's delete the local record, Got on deletion : (err=%d)", (uint8_t *)&v10, 0x18u);
    }

    uint64_t v8 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      int v11 = "-[THThreadNetworkCredentialsKeychainBackingStore storeRecordAndSync:completion:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Error, Sync failure ", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v9 = +[NSError storeError:6 description:@"Error, iCloud Sync failure"];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __80__THThreadNetworkCredentialsKeychainBackingStore_storeRecordAndSync_completion___block_invoke_35(uint64_t a1, int a2, uint64_t a3)
{
  OSStatus v6 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    uint64_t v9 = "-[THThreadNetworkCredentialsKeychainBackingStore storeRecordAndSync:completion:]_block_invoke";
    __int16 v10 = 1024;
    int v11 = a2;
    __int16 v12 = 2112;
    uint64_t v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Inside Sync completion, didSync : %d, ErrorInfo : %@ ", (uint8_t *)&v8, 0x1Cu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80__THThreadNetworkCredentialsKeychainBackingStore_storeRecordAndSync_completion___block_invoke_39(uint64_t a1)
{
  v2 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    BOOL v5 = "-[THThreadNetworkCredentialsKeychainBackingStore storeRecordAndSync:completion:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 325;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s:%d Timer Fired !!! ", (uint8_t *)&v4, 0x12u);
  }

  OSStatus v3 = +[NSError storeError:8 description:@"Error, Credentials sync timed out"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)storeRecord:(id)a3 completion:(id)a4
{
}

- (void)storeRecord:(id)a3 waitForSync:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  __int16 v10 = dispatch_get_global_queue(0, 0);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __85__THThreadNetworkCredentialsKeychainBackingStore_storeRecord_waitForSync_completion___block_invoke;
  v13[3] = &unk_100499370;
  OSStatus v15 = self;
  id v16 = v9;
  BOOL v17 = a4;
  id v14 = v8;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __85__THThreadNetworkCredentialsKeychainBackingStore_storeRecord_waitForSync_completion___block_invoke(uint64_t a1)
{
  v2 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    OSStatus v3 = [*(id *)(a1 + 32) network];
    int v4 = [v3 networkName];
    BOOL v5 = [*(id *)(a1 + 32) network];
    __int16 v6 = [v5 extendedPANID];
    int v7 = [*(id *)(a1 + 32) uniqueIdentifier];
    int v16 = 138412802;
    BOOL v17 = v4;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    dispatch_time_t v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Request to store credential (networkName=%@, xpanid=%@, uuid=%@", (uint8_t *)&v16, 0x20u);
  }
  CFDictionaryRef v8 = [*(id *)(a1 + 32) keyChainItemRepresentationForAddOperation];
  CFDictionaryRef v9 = v8;
  if (!v8)
  {
    __int16 v10 = +[NSError storeError:4 description:@"Bad network parameter"];
    id v11 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_7:
    v11();

    goto LABEL_14;
  }
  if (!*(unsigned char *)(a1 + 56))
  {
    uint64_t v12 = SecItemAdd(v8, 0);
    if (v12 == -25299)
    {
      uint64_t v13 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136315138;
        BOOL v17 = "-[THThreadNetworkCredentialsKeychainBackingStore storeRecord:waitForSync:completion:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Credential exists. Will update instead.", (uint8_t *)&v16, 0xCu);
      }

      CFDictionaryRef v14 = [*(id *)(a1 + 32) keyChainQueryForUpdateOperation];
      CFDictionaryRef v15 = [*(id *)(a1 + 32) keyChainItemRepresentationForUpdateOperation];
      uint64_t v12 = SecItemUpdate(v14, v15);
    }
    if (v12)
    {
      [*(id *)(a1 + 40) errorout:v12 completion:*(void *)(a1 + 48)];
      goto LABEL_14;
    }
    __int16 v10 = [*(id *)(a1 + 32) computedUniqueIdentifier];
    id v11 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_7;
  }
  [*(id *)(a1 + 40) storeRecordAndSync:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
LABEL_14:
}

- (void)deleteRecordWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = dispatch_get_global_queue(0, 0);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __94__THThreadNetworkCredentialsKeychainBackingStore_deleteRecordWithUniqueIdentifier_completion___block_invoke;
  v10[3] = &unk_100499280;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __94__THThreadNetworkCredentialsKeychainBackingStore_deleteRecordWithUniqueIdentifier_completion___block_invoke(uint64_t a1)
{
  OSStatus v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(const char **)(a1 + 32);
    int v12 = 138412290;
    uint64_t v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to DELETE credential with identifier %@", (uint8_t *)&v12, 0xCu);
  }

  CFDictionaryRef v5 = +[THThreadNetworkCredentialsStoreRecord keyChainQueryForDeleteOperationForUniqueIdentifier:*(void *)(a1 + 32)];
  OSStatus v6 = SecItemDelete(v5);
  int v7 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    uint64_t v13 = "-[THThreadNetworkCredentialsKeychainBackingStore deleteRecordWithUniqueIdentifier:completion:]_block_invoke";
    __int16 v14 = 1024;
    OSStatus v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: GOT: (err=%d)", (uint8_t *)&v12, 0x12u);
  }

  if (v6)
  {
    id v8 = (__CFString *)SecCopyErrorMessageString(v6, 0);
    id v9 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __94__THThreadNetworkCredentialsKeychainBackingStore_deleteRecordWithUniqueIdentifier_completion___block_invoke_cold_1();
    }

    __int16 v10 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v6 userInfo:0];
    id v11 = +[NSError storeError:2 underlyingError:v10 description:v8];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)_doFetchOneActiveDataSetRecords:(id)a3 error:(id *)a4
{
  CFTypeRef result = 0;
  OSStatus v5 = SecItemCopyMatching((CFDictionaryRef)a3, &result);
  if (v5 == -25300)
  {
    id v8 = 0;
    goto LABEL_12;
  }
  OSStatus v6 = v5;
  if (v5)
  {
    int v7 = (void *)SecCopyErrorMessageString(v5, 0);
    id v9 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore _doFetchOneActiveDataSetRecords:error:]();
    }

    if (a4)
    {
      __int16 v10 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v6 userInfo:0];
      *a4 = +[NSError storeError:2 underlyingError:v10 description:v7];
    }
LABEL_10:
    id v8 = 0;
    goto LABEL_11;
  }
  int v7 = (void *)result;
  if (!result)
  {
    int v12 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore _doFetchOneActiveDataSetRecords:error:](v12, v13, v14, v15, v16, v17, v18, v19);
    }

    if (a4)
    {
      +[NSError storeError:3 description:@"Bad return type from SecItemCopyMatching"];
      id v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  id v8 = +[THThreadNetworkCredentialsActiveDataSetRecord activeDataSetRecordFromKeychainDictionary:result];
LABEL_11:

LABEL_12:

  return v8;
}

- (id)_doFetchActiveDataSetRecords:(id)a3 error:(id *)a4
{
  CFTypeRef result = 0;
  OSStatus v5 = SecItemCopyMatching((CFDictionaryRef)a3, &result);
  if (v5)
  {
    OSStatus v6 = v5;
    if (v5 == -25300)
    {
      int v7 = +[NSSet set];
    }
    else
    {
      uint64_t v16 = (__CFString *)SecCopyErrorMessageString(v5, 0);
      uint64_t v17 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore _doFetchOneActiveDataSetRecords:error:]();
      }

      if (a4)
      {
        uint64_t v18 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v6 userInfo:0];
        *a4 = +[NSError storeError:2 underlyingError:v18 description:v16];
      }
      int v7 = 0;
    }
  }
  else
  {
    id v8 = (void *)result;
    if (result && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      uint64_t v19 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore _doFetchRecords:error:]();
      }

      if (a4)
      {
        +[NSError storeError:3 description:@"Bad return type from SecItemCopyMatching"];
        int v7 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        int v7 = 0;
      }
    }
    else
    {
      id v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v10 = v8;
      id v11 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v22;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v22 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = +[THThreadNetworkCredentialsActiveDataSetRecord activeDataSetRecordFromKeychainDictionary:](THThreadNetworkCredentialsActiveDataSetRecord, "activeDataSetRecordFromKeychainDictionary:", *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
            if (v15) {
              [v9 addObject:v15];
            }
          }
          id v12 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v12);
      }

      int v7 = +[NSSet setWithArray:v9];
    }
  }

  return v7;
}

- (id)_doFetchPreferredNetworks:(id)a3 error:(id *)a4
{
  CFTypeRef result = 0;
  OSStatus v5 = SecItemCopyMatching((CFDictionaryRef)a3, &result);
  if (v5)
  {
    OSStatus v6 = v5;
    if (v5 == -25300)
    {
      int v7 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore _doFetchPreferredNetworks:error:]();
      }

      id v8 = +[NSSet set];
    }
    else
    {
      uint64_t v17 = (__CFString *)SecCopyErrorMessageString(v5, 0);
      uint64_t v18 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore _doFetchPreferredNetworks:error:]();
      }

      if (a4)
      {
        uint64_t v19 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v6 userInfo:0];
        *a4 = +[NSError storeError:9 underlyingError:v19 description:v17];
      }
      id v8 = 0;
    }
  }
  else
  {
    id v9 = (void *)result;
    if (result && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      __int16 v20 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore _doFetchPreferredNetworks:error:]();
      }

      if (a4)
      {
        +[NSError storeError:9 description:@"Bad return type from SecItemCopyMatching"];
        id v8 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v8 = 0;
      }
    }
    else
    {
      id v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v11 = v9;
      id v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v23;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = +[THPreferredThreadNetwork preferredNetworkFromKeychainDictionary:](THPreferredThreadNetwork, "preferredNetworkFromKeychainDictionary:", *(void *)(*((void *)&v22 + 1) + 8 * i), (void)v22);
            if (v16) {
              [v10 addObject:v16];
            }
          }
          id v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v13);
      }

      id v8 = +[NSSet setWithArray:v10];
    }
  }

  return v8;
}

- (id)_doFetchFrozenThreadNetworks:(id)a3 error:(id *)a4
{
  CFTypeRef result = 0;
  OSStatus v5 = SecItemCopyMatching((CFDictionaryRef)a3, &result);
  if (v5)
  {
    OSStatus v6 = v5;
    if (v5 == -25300)
    {
      int v7 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore _doFetchFrozenThreadNetworks:error:]();
      }

      id v8 = +[NSSet set];
    }
    else
    {
      uint64_t v17 = (__CFString *)SecCopyErrorMessageString(v5, 0);
      uint64_t v18 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore _doFetchFrozenThreadNetworks:error:]();
      }

      if (a4)
      {
        uint64_t v19 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v6 userInfo:0];
        *a4 = +[NSError storeError:30 underlyingError:v19 description:v17];
      }
      id v8 = 0;
    }
  }
  else
  {
    id v9 = (void *)result;
    if (result && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      __int16 v20 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore _doFetchFrozenThreadNetworks:error:]();
      }

      if (a4)
      {
        +[NSError storeError:30 description:@"Bad return type from SecItemCopyMatching"];
        id v8 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v8 = 0;
      }
    }
    else
    {
      id v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v11 = v9;
      id v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v23;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = +[THFrozenThreadNetwork frozenThreadNetworkFromKeychainDictionary:](THFrozenThreadNetwork, "frozenThreadNetworkFromKeychainDictionary:", *(void *)(*((void *)&v22 + 1) + 8 * i), (void)v22);
            if (v16) {
              [v10 addObject:v16];
            }
          }
          id v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v13);
      }

      id v8 = +[NSSet setWithArray:v10];
    }
  }

  return v8;
}

- (void)retrieveThirdPartyInfo:(id)a3
{
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy_;
  v11[4] = __Block_byref_object_dispose_;
  id v12 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy_;
  v9[4] = __Block_byref_object_dispose_;
  id v10 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __73__THThreadNetworkCredentialsKeychainBackingStore_retrieveThirdPartyInfo___block_invoke;
  v5[3] = &unk_100499398;
  int v7 = v11;
  id v8 = v9;
  id v4 = a3;
  v5[4] = self;
  id v6 = v4;
  [(THThreadNetworkCredentialsKeychainBackingStore *)self retrieveAllActiveDataSetRecordsWithCompletion:v5];

  _Block_object_dispose(v9, 8);
  _Block_object_dispose(v11, 8);
}

void __73__THThreadNetworkCredentialsKeychainBackingStore_retrieveThirdPartyInfo___block_invoke(void *a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a1 + 6;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a3);
  if (!*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    id v10 = [*(id *)(*(void *)(*v8 + 8) + 40) count];
    id v11 = THCredentialsServerLogHandleForCategory(1);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (!v10)
    {
      if (v12) {
        __73__THThreadNetworkCredentialsKeychainBackingStore_retrieveThirdPartyInfo___block_invoke_cold_1();
      }

      goto LABEL_5;
    }
    char v44 = a1;
    if (v12) {
      __73__THThreadNetworkCredentialsKeychainBackingStore_retrieveThirdPartyInfo___block_invoke_cold_4((uint64_t)(a1 + 6));
    }
    id v45 = v7;
    id v46 = v6;

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v13 = *(id *)(*(void *)(*v8 + 8) + 40);
    id v14 = [v13 countByEnumeratingWithState:&v53 objects:v64 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = 0;
      uint64_t v17 = *(void *)v54;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v54 != v17) {
            objc_enumerationMutation(v13);
          }
          uint64_t v19 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          __int16 v20 = [v19 keychainAccessGroup];
          if ([v20 isEqualToString:@"0000000000"])
          {
          }
          else
          {
            long long v21 = [v19 keychainAccessGroup];
            uint64_t v22 = [v21 isEqualToString:@"com.apple.thread.network"] ^ 1;

            v16 += v22;
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v53 objects:v64 count:16];
      }
      while (v15);
    }

    long long v23 = +[THPreferredThreadNetwork keyChainQueryForFetchPreferredNetworkRecordsOperation];
    id v6 = v46;
    if (v23)
    {
      long long v24 = (void *)v44[4];
      id v52 = 0;
      long long v25 = [v24 _doFetchPreferredNetworks:v23 error:&v52];
      id v26 = v52;
      v27 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        id v28 = [v25 count];
        *(_DWORD *)buf = 136315650;
        v59 = "-[THThreadNetworkCredentialsKeychainBackingStore retrieveThirdPartyInfo:]_block_invoke";
        __int16 v60 = 1024;
        int v61 = 640;
        __int16 v62 = 2048;
        id v63 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s : %d - Preferred Networks in Database = %lu", buf, 0x1Cu);
      }

      if ([v25 count])
      {
        id v43 = v26;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        v42 = v25;
        id v29 = v25;
        id v30 = [v29 countByEnumeratingWithState:&v48 objects:v57 count:16];
        if (!v30) {
          goto LABEL_47;
        }
        id v31 = v30;
        uint64_t v47 = 0;
        uint64_t v32 = 0;
        uint64_t v33 = *(void *)v49;
        while (1)
        {
          for (j = 0; j != v31; j = (char *)j + 1)
          {
            if (*(void *)v49 != v33) {
              objc_enumerationMutation(v29);
            }
            id v35 = *(void **)(*((void *)&v48 + 1) + 8 * (void)j);
            if (v35)
            {
              uint64_t v36 = [*(id *)(*((void *)&v48 + 1) + 8 * (void)j) userInfo];
              if ([v36 isEqualToString:@"0000000000"])
              {

LABEL_36:
                ++v32;
                continue;
              }
              v37 = [v35 userInfo];
              unsigned __int8 v38 = [v37 isEqualToString:@"com.apple.thread.network"];

              if (v38) {
                goto LABEL_36;
              }
              ++v47;
            }
          }
          id v31 = [v29 countByEnumeratingWithState:&v48 objects:v57 count:16];
          if (!v31)
          {
LABEL_47:

            v41 = +[NSError storeError:0 description:@"Success: Found the thirdParty information"];
            (*(void (**)(void))(v44[5] + 16))();
            id v7 = v45;
            id v6 = v46;
            id v26 = v43;
            long long v25 = v42;
            goto LABEL_48;
          }
        }
      }
      uint64_t v40 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        __73__THThreadNetworkCredentialsKeychainBackingStore_retrieveThirdPartyInfo___block_invoke_cold_3();
      }

      v41 = +[NSError storeError:9 description:@"Failed to find any  preferred network"];
      (*(void (**)(void))(v44[5] + 16))();
LABEL_48:
    }
    else
    {
      v39 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        __73__THThreadNetworkCredentialsKeychainBackingStore_retrieveThirdPartyInfo___block_invoke_cold_2();
      }

      id v26 = +[NSError storeError:3 description:@"Failed to create query to retrieve preferred network"];
      (*(void (**)(void))(v44[5] + 16))();
    }

    goto LABEL_50;
  }
  id v9 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    __73__THThreadNetworkCredentialsKeychainBackingStore_retrieveThirdPartyInfo___block_invoke_cold_5((uint64_t)(a1 + 7));
  }

LABEL_5:
  (*(void (**)(void))(a1[5] + 16))();
LABEL_50:
}

- (void)retrieveAllActiveDataSetRecordsForNetwork:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __103__THThreadNetworkCredentialsKeychainBackingStore_retrieveAllActiveDataSetRecordsForNetwork_completion___block_invoke;
  block[3] = &unk_100499258;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __103__THThreadNetworkCredentialsKeychainBackingStore_retrieveAllActiveDataSetRecordsForNetwork_completion___block_invoke(uint64_t a1)
{
  OSStatus v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) networkName];
    OSStatus v5 = [*(id *)(a1 + 32) extendedPANID];
    *(_DWORD *)buf = 136315906;
    id v12 = "-[THThreadNetworkCredentialsKeychainBackingStore retrieveAllActiveDataSetRecordsForNetwork:completion:]_block_invoke";
    __int16 v13 = 1024;
    int v14 = 680;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    __int16 v17 = 2112;
    uint64_t v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s : %d - Request to fetch active dataset records for network (name=%@, xpanid=%@)", buf, 0x26u);
  }
  id v6 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchActiveDataSetRecordsOperationForNetwork:*(void *)(a1 + 32)];
  id v7 = *(void **)(a1 + 40);
  id v10 = 0;
  id v8 = [v7 _doFetchActiveDataSetRecords:v6 error:&v10];
  id v9 = v10;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)retrieveAllActiveDataSetRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  OSStatus v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __96__THThreadNetworkCredentialsKeychainBackingStore_retrieveAllActiveDataSetRecordsWithCompletion___block_invoke;
  v7[3] = &unk_100499280;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __96__THThreadNetworkCredentialsKeychainBackingStore_retrieveAllActiveDataSetRecordsWithCompletion___block_invoke(uint64_t a1)
{
  OSStatus v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to fetch all active dataset records", buf, 2u);
  }

  id v4 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchAllActiveDataSetRecordsOperation];
  OSStatus v5 = *(void **)(a1 + 32);
  id v8 = 0;
  id v6 = [v5 _doFetchActiveDataSetRecords:v4 error:&v8];
  id v7 = v8;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)retrieveActiveDataSetRecordWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __109__THThreadNetworkCredentialsKeychainBackingStore_retrieveActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke;
  block[3] = &unk_100499258;
  id v12 = v6;
  __int16 v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __109__THThreadNetworkCredentialsKeychainBackingStore_retrieveActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke(void *a1)
{
  OSStatus v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = a1[4];
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to fetch active dataset record with UUID %@", buf, 0xCu);
  }

  OSStatus v5 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchOneActiveDataSetRecordOperationForUniqueIdentifier:a1[4]];
  id v6 = (void *)a1[5];
  id v11 = 0;
  id v7 = [v6 _doFetchActiveDataSetRecords:v5 error:&v11];
  id v8 = v11;
  uint64_t v9 = a1[6];
  id v10 = [v7 anyObject];
  (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v8);
}

- (void)retrieveActiveDataSetRecordWithExtendedPANId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __106__THThreadNetworkCredentialsKeychainBackingStore_retrieveActiveDataSetRecordWithExtendedPANId_completion___block_invoke;
  block[3] = &unk_100499258;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __106__THThreadNetworkCredentialsKeychainBackingStore_retrieveActiveDataSetRecordWithExtendedPANId_completion___block_invoke(void *a1)
{
  OSStatus v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = a1[4];
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to fetch active dataset record with xpanid %@", buf, 0xCu);
  }

  OSStatus v5 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchOneActiveDataSetRecordOperationForXPANId:a1[4]];
  id v6 = (void *)a1[5];
  id v11 = 0;
  id v7 = [v6 _doFetchActiveDataSetRecords:v5 error:&v11];
  id v8 = v11;
  uint64_t v9 = a1[6];
  id v10 = [v7 anyObject];
  (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v8);
}

- (void)retrieveActiveDataSetRecordOnMdnsWithExtendedPANId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __112__THThreadNetworkCredentialsKeychainBackingStore_retrieveActiveDataSetRecordOnMdnsWithExtendedPANId_completion___block_invoke;
  block[3] = &unk_100499258;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __112__THThreadNetworkCredentialsKeychainBackingStore_retrieveActiveDataSetRecordOnMdnsWithExtendedPANId_completion___block_invoke(uint64_t a1)
{
  OSStatus v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to fetch active dataset record with xpanid %@", buf, 0xCu);
  }

  if ([*(id *)(a1 + 40) checkWiFiStatus])
  {
    OSStatus v5 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchOneActiveDataSetRecordOperationForXPANId:*(void *)(a1 + 32)];
    id v6 = *(void **)(a1 + 40);
    id v16 = 0;
    id v7 = [v6 _doFetchActiveDataSetRecords:v5 error:&v16];
    id v8 = v16;
    id v9 = [v7 anyObject];
    id v10 = v9;
    if (v8 || !v9)
    {
      id v14 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    else
    {
      id v11 = *(void **)(a1 + 40);
      id v12 = [v9 network];
      uint64_t v13 = [v12 extendedPANID];
      LODWORD(v11) = [v11 checkIfXpanIDMatchToMDNSScan:v13];

      if (!v11)
      {
        __int16 v15 = +[NSError storeError:20 description:@"Thread network credentials does not match with any of the active thread networks around"];
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

        goto LABEL_12;
      }
      id v14 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    v14();
LABEL_12:

    goto LABEL_13;
  }
  id v10 = +[NSError storeError:19 description:@"Error : Device is not connected to the network"];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_13:
}

- (void)retrieveActiveDataSetRecordForThreadBorderAgent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __109__THThreadNetworkCredentialsKeychainBackingStore_retrieveActiveDataSetRecordForThreadBorderAgent_completion___block_invoke;
  block[3] = &unk_100499258;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __109__THThreadNetworkCredentialsKeychainBackingStore_retrieveActiveDataSetRecordForThreadBorderAgent_completion___block_invoke(uint64_t a1)
{
  OSStatus v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [*(id *)(a1 + 32) discriminatorId];
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to fetch active dataset record with borderAgent %@", buf, 0xCu);
  }
  OSStatus v5 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchActiveDataSetRecordOperationForBorderAgent:*(void *)(a1 + 32)];
  id v6 = *(void **)(a1 + 40);
  id v11 = 0;
  id v7 = [v6 _doFetchActiveDataSetRecords:v5 error:&v11];
  id v8 = v11;
  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = [v7 anyObject];
  (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v8);
}

- (void)retrieveActiveDataSetRecordWithTLVsForThreadBorderAgent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __117__THThreadNetworkCredentialsKeychainBackingStore_retrieveActiveDataSetRecordWithTLVsForThreadBorderAgent_completion___block_invoke;
  block[3] = &unk_100499258;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __117__THThreadNetworkCredentialsKeychainBackingStore_retrieveActiveDataSetRecordWithTLVsForThreadBorderAgent_completion___block_invoke(uint64_t a1)
{
  OSStatus v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [*(id *)(a1 + 32) discriminatorId];
    *(_DWORD *)buf = 138412290;
    id v28 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to fetch active dataset record with borderAgent %@", buf, 0xCu);
  }
  OSStatus v5 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchActiveDataSetRecordOperationForBorderAgent:*(void *)(a1 + 32)];
  id v6 = *(void **)(a1 + 40);
  id v25 = 0;
  id v7 = [v6 _doFetchActiveDataSetRecords:v5 error:&v25];
  id v8 = v25;
  if (!v8)
  {
    uint64_t v19 = v7;
    __int16 v20 = v2;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v22;
      while (2)
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(a1 + 40);
          __int16 v15 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)v13), "credentialsDataSet", v19, v20, (void)v21);
          id v16 = [v15 dataSetArray];
          LODWORD(v14) = [v14 areValidDataSetTLVs:v16];

          if (v14)
          {
            __int16 v17 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v18 = [*(id *)(a1 + 32) discriminatorId];
              *(_DWORD *)buf = 138412290;
              id v28 = v18;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Return the record for borderAgent ID %@", buf, 0xCu);
            }
            (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

            id v8 = 0;
            goto LABEL_16;
          }
          uint64_t v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v8 = +[NSError storeError:28 description:@"Error: Does Not Have DataSet TLVs"];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_16:
    id v7 = v19;
    v2 = v20;
  }
}

- (id)getActiveRecords:(id)a3
{
  id v4 = a3;
  OSStatus v5 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v69 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveRecords:]";
    __int16 v70 = 1024;
    *(_DWORD *)v71 = 808;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:%d: Entered. Matching records with Mdns records", buf, 0x12u);
  }

  id v6 = objc_alloc_init(ThreadBRFinder);
  if (v6)
  {
    id v7 = objc_opt_new();
    if (v7)
    {
      unint64_t v8 = [(THThreadNetworkCredentialsKeychainBackingStore *)self getCountOfThreadBorderRoutersWithMdns:v6];
      if (v8)
      {
        unint64_t v10 = v8;
        uint64_t v11 = 0;
        *(void *)&long long v9 = 136315394;
        long long v53 = v9;
        uint64_t v12 = &exit_ptr;
        id v59 = v4;
        long long v55 = self;
        long long v56 = v6;
        unint64_t v54 = v8;
        do
        {
          uint64_t v13 = -[ThreadBRFinder getBorderAgentForIndex:](v6, "getBorderAgentForIndex:", v11, v53);
          id v14 = v13;
          if (v13)
          {
            __int16 v15 = [v13 addresses];

            if (v15)
            {
              id v16 = v12[319];
              __int16 v17 = [v14 TXTRecordData];
              uint64_t v18 = [v16 dictionaryFromTXTRecordData:v17];

              if (!v18)
              {
                id v29 = THCredentialsServerLogHandleForCategory(1);
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  v69 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveRecords:]";
                  __int16 v70 = 1024;
                  *(_DWORD *)v71 = 842;
                  *(_WORD *)&v71[4] = 2112;
                  *(void *)&v71[6] = v14;
                  _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s : %d No text record data available for the server : %@, continue to next network", buf, 0x1Cu);
                }
                goto LABEL_54;
              }
              __int16 v62 = v18;
              uint64_t v19 = [v18 objectForKey:@"xa"];
              __int16 v20 = THCredentialsServerLogHandleForCategory(1);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v69 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveRecords:]";
                __int16 v70 = 1024;
                *(_DWORD *)v71 = 849;
                *(_WORD *)&v71[4] = 2112;
                *(void *)&v71[6] = v62;
                _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s:%d BorderAgent MDNS Text Record Data : %@", buf, 0x1Cu);
              }

              __int16 v60 = v14;
              if (v19)
              {
                if ([v19 length] != (id)16)
                {
                  uint64_t v32 = self;
                  uint64_t v33 = v19;
                  id v34 = [v19 length];
                  long long v24 = THCredentialsServerLogHandleForCategory(1);
                  BOOL v35 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
                  if (v34 == (id)8)
                  {
                    uint64_t v19 = v33;
                    if (v35)
                    {
                      id v48 = [v33 length];
                      *(_DWORD *)buf = 136315650;
                      v69 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveRecords:]";
                      __int16 v70 = 1024;
                      *(_DWORD *)v71 = 861;
                      *(_WORD *)&v71[4] = 2048;
                      *(void *)&v71[6] = v48;
                      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s:%d BorderAgent ID is of NEW format (binary based) with length : %lu", buf, 0x1Cu);
                    }

                    id v23 = v33;
                    int v61 = 0;
                    self = v32;
                    id v4 = v59;
LABEL_34:
                    long long v65 = 0u;
                    long long v66 = 0u;
                    long long v63 = 0u;
                    long long v64 = 0u;
                    long long v24 = v4;
                    id v36 = [v24 countByEnumeratingWithState:&v63 objects:v67 count:16];
                    if (v36)
                    {
                      id v37 = v36;
                      v57 = v19;
                      uint64_t v58 = v11;
                      uint64_t v38 = *(void *)v64;
                      do
                      {
                        for (i = 0; i != v37; i = (char *)i + 1)
                        {
                          if (*(void *)v64 != v38) {
                            objc_enumerationMutation(v24);
                          }
                          uint64_t v40 = *(void **)(*((void *)&v63 + 1) + 8 * i);
                          v41 = [v40 borderAgent];
                          v42 = [v41 discriminatorId];
                          unsigned int v43 = [v42 isEqualToData:v23];

                          if (v43)
                          {
                            char v44 = THCredentialsServerLogHandleForCategory(1);
                            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                            {
                              id v45 = [v40 borderAgent];
                              id v46 = [v45 discriminatorId];
                              *(_DWORD *)buf = 136315906;
                              v69 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveRecords:]";
                              __int16 v70 = 1024;
                              *(_DWORD *)v71 = 892;
                              *(_WORD *)&v71[4] = 2112;
                              *(void *)&v71[6] = v46;
                              __int16 v72 = 2112;
                              id v73 = v23;
                              _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%s : %d: baID :%@ matches with mdns record :%@", buf, 0x26u);
                            }
                            [v7 addObject:v40];
                          }
                        }
                        id v37 = [v24 countByEnumeratingWithState:&v63 objects:v67 count:16];
                      }
                      while (v37);
                      uint64_t v11 = v58;
                      id v4 = v59;
                      self = v55;
                      id v6 = v56;
                      unint64_t v10 = v54;
                      uint64_t v12 = &exit_ptr;
                      uint64_t v19 = v57;
                    }
                    else
                    {
                      uint64_t v12 = &exit_ptr;
                    }
                  }
                  else
                  {
                    if (v35)
                    {
                      uint64_t v19 = v33;
                      id v49 = [v33 length];
                      *(_DWORD *)buf = 136315650;
                      v69 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveRecords:]";
                      __int16 v70 = 1024;
                      *(_DWORD *)v71 = 865;
                      *(_WORD *)&v71[4] = 2048;
                      *(void *)&v71[6] = v49;
                      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s:%d Continuing... BorderAgent ID length mismatch !!! border agent id length : %lu", buf, 0x1Cu);
                      id v23 = 0;
                      int v61 = 0;
                    }
                    else
                    {
                      id v23 = 0;
                      int v61 = 0;
                      uint64_t v19 = v33;
                    }
                    self = v32;
                    id v4 = v59;
                  }
                  goto LABEL_53;
                }
                long long v21 = THCredentialsServerLogHandleForCategory(1);
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  id v47 = [v19 length];
                  *(_DWORD *)buf = 136315650;
                  v69 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveRecords:]";
                  __int16 v70 = 1024;
                  *(_DWORD *)v71 = 857;
                  *(_WORD *)&v71[4] = 2048;
                  *(void *)&v71[6] = v47;
                  _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s:%d BorderAgent IDis of OLD format (string based) with length : %lu", buf, 0x1Cu);
                }

                long long v22 = [objc_alloc((Class)NSString) initWithData:v19 encoding:4];
                if (v22)
                {
                  int v61 = v22;
                  -[THThreadNetworkCredentialsKeychainBackingStore dataFromHexString:](self, "dataFromHexString:");
                  id v23 = (id)objc_claimAutoreleasedReturnValue();
                  long long v24 = THCredentialsServerLogHandleForCategory(1);
                  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
                  if (v23)
                  {
                    if (v25)
                    {
                      *(_DWORD *)buf = 136315906;
                      v69 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveRecords:]";
                      __int16 v70 = 1024;
                      *(_DWORD *)v71 = 884;
                      *(_WORD *)&v71[4] = 2112;
                      *(void *)&v71[6] = v61;
                      __int16 v72 = 2112;
                      id v73 = v23;
                      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s:%d: baid str : %@, foundbaid : %@", buf, 0x26u);
                    }

                    goto LABEL_34;
                  }
                  if (v25)
                  {
                    *(_DWORD *)buf = 136315650;
                    v69 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveRecords:]";
                    __int16 v70 = 1024;
                    *(_DWORD *)v71 = 880;
                    *(_WORD *)&v71[4] = 2112;
                    *(void *)&v71[6] = v60;
                    _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s : %d hex string conversion to nsdata failure for server : %@, continue to next network", buf, 0x1Cu);
                  }
                  id v23 = 0;
LABEL_53:

                  id v14 = v60;
                  id v29 = v61;
                  uint64_t v18 = v62;
LABEL_54:

                  goto LABEL_55;
                }
                long long v24 = THCredentialsServerLogHandleForCategory(1);
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  v69 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveRecords:]";
                  __int16 v70 = 1024;
                  *(_DWORD *)v71 = 873;
                  *(_WORD *)&v71[4] = 2112;
                  *(void *)&v71[6] = v14;
                  id v30 = v24;
                  id v31 = "%s : %d baid nsstring conversion failure, server : %@, continue to next network";
LABEL_51:
                  _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, v31, buf, 0x1Cu);
                }
              }
              else
              {
                long long v24 = THCredentialsServerLogHandleForCategory(1);
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  v69 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveRecords:]";
                  __int16 v70 = 1024;
                  *(_DWORD *)v71 = 852;
                  *(_WORD *)&v71[4] = 2112;
                  *(void *)&v71[6] = v14;
                  id v30 = v24;
                  id v31 = "%s : %d cannot parse dictionary data for server : %@, continue to next network";
                  goto LABEL_51;
                }
              }
              id v23 = 0;
              int v61 = 0;
              goto LABEL_53;
            }
            uint64_t v18 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v53;
              v69 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveRecords:]";
              __int16 v70 = 2112;
              *(void *)v71 = v14;
              id v26 = v18;
              v27 = "%s : No IP address is available for the server : %@, continue to next BR";
              uint32_t v28 = 22;
              goto LABEL_25;
            }
          }
          else
          {
            uint64_t v18 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v53;
              v69 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveRecords:]";
              __int16 v70 = 1024;
              *(_DWORD *)v71 = 831;
              id v26 = v18;
              v27 = "%s:%d: Failed to get the server";
              uint32_t v28 = 18;
LABEL_25:
              _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, v27, buf, v28);
            }
          }
LABEL_55:

          ++v11;
        }
        while (v11 != v10);
      }
      if ([v7 count])
      {
        long long v50 = +[NSSet setWithArray:v7];
        goto LABEL_70;
      }
    }
    else
    {
      long long v51 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore getActiveRecords:]();
      }
    }
  }
  else
  {
    id v7 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore getActiveRecords:]();
    }
  }
  long long v50 = 0;
LABEL_70:

  return v50;
}

- (void)retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup:(id)a3 activeFlag:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unint64_t v10 = dispatch_get_global_queue(0, 0);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __140__THThreadNetworkCredentialsKeychainBackingStore_retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup_activeFlag_completion___block_invoke;
  v13[3] = &unk_1004993C0;
  BOOL v17 = a4;
  id v14 = v8;
  __int16 v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __140__THThreadNetworkCredentialsKeychainBackingStore_retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup_activeFlag_completion___block_invoke(uint64_t a1)
{
  OSStatus v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 136315906;
    id v23 = "-[THThreadNetworkCredentialsKeychainBackingStore retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAcces"
          "sGroup:activeFlag:completion:]_block_invoke";
    __int16 v24 = 1024;
    int v25 = 910;
    __int16 v26 = 2112;
    uint64_t v27 = v4;
    __int16 v28 = 1024;
    int v29 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s:%d: Request to fetch active dataset record with Client Keychain Access Group %@, active flag :%d", buf, 0x22u);
  }

  id v6 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchActiveDataSetRecordsOperationForClientKeychainAccessGroup:*(void *)(a1 + 32)];
  id v7 = *(void **)(a1 + 40);
  id v21 = 0;
  id v8 = [v7 _doFetchActiveDataSetRecords:v6 error:&v21];
  id v9 = v21;
  if (v8
    && (![v8 count]
     || !*(unsigned char *)(a1 + 56)
     || ([*(id *)(a1 + 40) getActiveRecords:v8],
         uint64_t v10 = objc_claimAutoreleasedReturnValue(),
         v8,
         (id v8 = (void *)v10) != 0))
    && [v8 count])
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v11 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __140__THThreadNetworkCredentialsKeychainBackingStore_retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup_activeFlag_completion___block_invoke_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
    }

    uint64_t v19 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:0 userInfo:0];
    uint64_t v20 = +[NSError storeError:3 underlyingError:v19 description:@"Failed to retrieve all active border router records"];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v9 = (id)v20;
  }
}

- (void)retrieveAllActiveDataSetRecordsForClientKeychainAccessGroup:(id)a3 completion:(id)a4
{
}

- (void)retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup:(id)a3 activeFlag:(BOOL)a4 compleiton:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = dispatch_get_global_queue(0, 0);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __140__THThreadNetworkCredentialsKeychainBackingStore_retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup_activeFlag_compleiton___block_invoke;
  v13[3] = &unk_1004993C0;
  BOOL v17 = a4;
  id v14 = v8;
  uint64_t v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __140__THThreadNetworkCredentialsKeychainBackingStore_retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup_activeFlag_compleiton___block_invoke(uint64_t a1)
{
  OSStatus v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 136315906;
    id v23 = "-[THThreadNetworkCredentialsKeychainBackingStore retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAcces"
          "sGroup:activeFlag:compleiton:]_block_invoke";
    __int16 v24 = 1024;
    int v25 = 947;
    __int16 v26 = 2112;
    uint64_t v27 = v4;
    __int16 v28 = 1024;
    int v29 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s:%d: Request to fetch active dataset record with Client Keychain Access Group %@, active flag :%d", buf, 0x22u);
  }

  id v6 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchActiveDataSetRecordsOperationForClientKeychainAccessGroup:*(void *)(a1 + 32)];
  id v7 = *(void **)(a1 + 40);
  id v21 = 0;
  id v8 = [v7 _doFetchActiveDataSetRecords:v6 error:&v21];
  id v9 = v21;
  if (v8
    && (![v8 count]
     || !*(unsigned char *)(a1 + 56)
     || ([*(id *)(a1 + 40) getActiveRecords:v8],
         uint64_t v10 = objc_claimAutoreleasedReturnValue(),
         v8,
         (id v8 = (void *)v10) != 0))
    && [v8 count])
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v11 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __140__THThreadNetworkCredentialsKeychainBackingStore_retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup_activeFlag_completion___block_invoke_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
    }

    uint64_t v19 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:0 userInfo:0];
    uint64_t v20 = +[NSError storeError:3 underlyingError:v19 description:@"Failed to retrieve all active border router records"];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v9 = (id)v20;
  }
}

- (void)retrieveAllActiveDataSetRecordsForClientKeychainAccessGroup:(id)a3 compleiton:(id)a4
{
}

- (void)deleteActiveDataSetRecordWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = dispatch_get_global_queue(0, 0);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __107__THThreadNetworkCredentialsKeychainBackingStore_deleteActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke;
  v10[3] = &unk_100499280;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __107__THThreadNetworkCredentialsKeychainBackingStore_deleteActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke(uint64_t a1)
{
  OSStatus v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(const char **)(a1 + 32);
    int v12 = 138412290;
    uint64_t v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to DELETE credential with identifier %@", (uint8_t *)&v12, 0xCu);
  }

  CFDictionaryRef v5 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForDeleteActiveDataSetRecordOperationForUniqueIdentifier:*(void *)(a1 + 32)];
  OSStatus v6 = SecItemDelete(v5);
  id v7 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    uint64_t v13 = "-[THThreadNetworkCredentialsKeychainBackingStore deleteActiveDataSetRecordWithUniqueIdentifier:completion:]_block_invoke";
    __int16 v14 = 1024;
    OSStatus v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: GOT: (err=%d)", (uint8_t *)&v12, 0x12u);
  }

  if (v6)
  {
    id v8 = (__CFString *)SecCopyErrorMessageString(v6, 0);
    id v9 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __107__THThreadNetworkCredentialsKeychainBackingStore_deleteActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke_cold_1();
    }

    uint64_t v10 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v6 userInfo:0];
    id v11 = +[NSError storeError:2 underlyingError:v10 description:v8];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)deleteActiveDataSetRecordForThreadBorderAgent:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = dispatch_get_global_queue(0, 0);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __107__THThreadNetworkCredentialsKeychainBackingStore_deleteActiveDataSetRecordForThreadBorderAgent_completion___block_invoke;
  v10[3] = &unk_100499280;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __107__THThreadNetworkCredentialsKeychainBackingStore_deleteActiveDataSetRecordForThreadBorderAgent_completion___block_invoke(uint64_t a1)
{
  OSStatus v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [*(id *)(a1 + 32) discriminatorId];
    int v12 = 136315394;
    uint64_t v13 = "-[THThreadNetworkCredentialsKeychainBackingStore deleteActiveDataSetRecordForThreadBorderAgent:completion:]_block_invoke";
    __int16 v14 = 2112;
    OSStatus v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: Request to DELETE credential with Ba %@", (uint8_t *)&v12, 0x16u);
  }
  CFDictionaryRef v5 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForDeleteActiveDataSetOperationForThreadNetworkBorderAgent:*(void *)(a1 + 32)];
  OSStatus v6 = SecItemDelete(v5);
  id v7 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    uint64_t v13 = "-[THThreadNetworkCredentialsKeychainBackingStore deleteActiveDataSetRecordForThreadBorderAgent:completion:]_block_invoke";
    __int16 v14 = 1024;
    LODWORD(v15) = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: GOT: (err=%d)", (uint8_t *)&v12, 0x12u);
  }

  if (v6)
  {
    id v8 = (__CFString *)SecCopyErrorMessageString(v6, 0);
    id v9 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __107__THThreadNetworkCredentialsKeychainBackingStore_deleteActiveDataSetRecordForThreadBorderAgent_completion___block_invoke_cold_1();
    }

    uint64_t v10 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v6 userInfo:0];
    id v11 = +[NSError storeError:2 underlyingError:v10 description:v8];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)storeActiveDataSetRecordAndSync:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = dispatch_get_global_queue(0, 0);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  id v9 = [v6 keyChainItemRepresentationForActiveDataSetRecordAddOperation];
  if (!v9)
  {
    uint64_t v13 = +[NSError storeError:4 description:@"Bad network parameter"];
    v7[2](v7, 0, v13);

    id v11 = 0;
LABEL_6:
    uint64_t v10 = 0;
    goto LABEL_7;
  }
  id v22 = 0;
  uint64_t v10 = +[CKKSControl controlObject:&v22];
  id v11 = v22;
  if (!v10)
  {
    __int16 v14 = +[NSError storeError:5 description:@"CKKS object allocation failed"];
    v7[2](v7, 0, v14);

    goto LABEL_6;
  }
  uint64_t v12 = kSecAttrViewHintHome;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __93__THThreadNetworkCredentialsKeychainBackingStore_storeActiveDataSetRecordAndSync_completion___block_invoke;
  v15[3] = &unk_100499410;
  uint64_t v20 = v23;
  v15[4] = self;
  id v16 = v6;
  id v17 = v8;
  uint64_t v19 = v7;
  id v18 = v9;
  __int16 v21 = 120;
  [v10 rpcKnownBadState:v12 reply:v15];

LABEL_7:
  _Block_object_dispose(v23, 8);
}

void __93__THThreadNetworkCredentialsKeychainBackingStore_storeActiveDataSetRecordAndSync_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a2 == 0;
  uint64_t v4 = THCredentialsServerLogHandleForCategory(1);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CKKS response for known state is Likely good", buf, 2u);
    }

    dispatch_group_t v7 = dispatch_group_create();
    *(void *)buf = 0;
    char v44 = buf;
    uint64_t v45 = 0x2020000000;
    char v46 = 0;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = __93__THThreadNetworkCredentialsKeychainBackingStore_storeActiveDataSetRecordAndSync_completion___block_invoke_79;
    v38[3] = &unk_1004993E8;
    id v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 72);
    v41 = buf;
    uint64_t v42 = v9;
    v38[4] = *(void *)(a1 + 32);
    id v39 = v8;
    id v6 = v7;
    uint64_t v40 = v6;
    uint64_t v10 = objc_retainBlock(v38);
    dispatch_group_enter(v6);
    id v11 = *(NSObject **)(a1 + 48);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __93__THThreadNetworkCredentialsKeychainBackingStore_storeActiveDataSetRecordAndSync_completion___block_invoke_82;
    block[3] = &unk_1004992D0;
    uint64_t v37 = *(void *)(a1 + 72);
    id v35 = *(id *)(a1 + 40);
    id v36 = *(id *)(a1 + 64);
    dispatch_group_notify(v6, v11, block);
    int v29 = _NSConcreteStackBlock;
    uint64_t v30 = 3221225472;
    id v31 = __93__THThreadNetworkCredentialsKeychainBackingStore_storeActiveDataSetRecordAndSync_completion___block_invoke_83;
    uint64_t v32 = &unk_1004992F8;
    uint64_t v12 = v10;
    id v33 = v12;
    uint64_t v13 = _SecItemAddAndNotifyOnSync();
    __int16 v14 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      OSStatus v15 = "error";
      id v48 = "-[THThreadNetworkCredentialsKeychainBackingStore storeActiveDataSetRecordAndSync:completion:]_block_invoke";
      *(_DWORD *)id v47 = 136315650;
      if (!v13) {
        OSStatus v15 = "success";
      }
      __int16 v49 = 1024;
      int v50 = 1154;
      __int16 v51 = 2080;
      id v52 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s:%d _SecItemAddAndNotifyOnSync return value : %s...", v47, 0x1Cu);
    }

    if (v13)
    {
      id v16 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v47 = 136315394;
        id v48 = "-[THThreadNetworkCredentialsKeychainBackingStore storeActiveDataSetRecordAndSync:completion:]_block_invoke";
        __int16 v49 = 1024;
        int v50 = 1160;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s:%d _SecItemAddAndNotifyOnSync returned error", v47, 0x12u);
      }

      if (v13 != -25299) {
        goto LABEL_21;
      }
      id v17 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v47 = 136315138;
        id v48 = "-[THThreadNetworkCredentialsKeychainBackingStore storeActiveDataSetRecordAndSync:completion:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: Credential exists. Will update instead.", v47, 0xCu);
      }

      CFDictionaryRef v18 = [*(id *)(a1 + 40) keyChainQueryForActiveDataSetRecordUpdateOperation];
      CFDictionaryRef v19 = [*(id *)(a1 + 40) keyChainItemRepresentationForActiveDataSetRecordUpdateOperation];
      uint64_t v13 = SecItemUpdate(v18, v19);
      if (v13)
      {
        uint64_t v20 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id v47 = 136315394;
          id v48 = "-[THThreadNetworkCredentialsKeychainBackingStore storeActiveDataSetRecordAndSync:completion:]_block_invoke";
          __int16 v49 = 1024;
          int v50 = 1168;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s:%d SecItemUpdate returned error", v47, 0x12u);
        }

LABEL_21:
        __int16 v21 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id v47 = 136315394;
          id v48 = "-[THThreadNetworkCredentialsKeychainBackingStore storeActiveDataSetRecordAndSync:completion:]_block_invoke";
          __int16 v49 = 1024;
          int v50 = 1173;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s:%d Returning error", v47, 0x12u);
        }

        [*(id *)(a1 + 32) errorout:v13 completion:*(void *)(a1 + 64)];
        goto LABEL_31;
      }

      __int16 v26 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v47 = 136315394;
        id v48 = "-[THThreadNetworkCredentialsKeychainBackingStore storeActiveDataSetRecordAndSync:completion:]_block_invoke";
        __int16 v49 = 1024;
        int v50 = 1178;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s:%d Credential exists, updated successfully..", v47, 0x12u);
      }

      int v25 = [*(id *)(a1 + 40) computedUniqueIdentifier];
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    else
    {
      dispatch_time_t v22 = dispatch_time(0, 1000000000 * *(unsigned __int16 *)(a1 + 80));
      id v23 = *(NSObject **)(a1 + 48);
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = __93__THThreadNetworkCredentialsKeychainBackingStore_storeActiveDataSetRecordAndSync_completion___block_invoke_84;
      v27[3] = &unk_100499320;
      __int16 v28 = v12;
      dispatch_after(v22, v23, v27);
      char v24 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v47 = 136315394;
        id v48 = "-[THThreadNetworkCredentialsKeychainBackingStore storeActiveDataSetRecordAndSync:completion:]_block_invoke";
        __int16 v49 = 1024;
        int v50 = 1198;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s:%d Timer Scheduled !....... ", v47, 0x12u);
      }

      int v25 = v28;
    }

LABEL_31:
    _Block_object_dispose(buf, 8);
    goto LABEL_32;
  }
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CKKS response for known is Not good", buf, 2u);
  }

  id v6 = +[NSError storeError:7 description:@"CKKS response for known state is Not good"];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_32:
}

void __93__THThreadNetworkCredentialsKeychainBackingStore_storeActiveDataSetRecordAndSync_completion___block_invoke_79(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 56) + 8) + 24), (unsigned __int8 *)&v4, 1u);
  BOOL v5 = v4 == 0;
  id v6 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    uint64_t v13 = "-[THThreadNetworkCredentialsKeychainBackingStore storeActiveDataSetRecordAndSync:completion:]_block_invoke";
    __int16 v14 = 1024;
    int v15 = 1091;
    __int16 v16 = 1024;
    LODWORD(v17) = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s:%d nowFinished : %d", (uint8_t *)&v12, 0x18u);
  }

  if (v5)
  {
    if (v3)
    {
      dispatch_group_t v7 = THCredentialsServerLogHandleForCategory(1);
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
LABEL_13:

        dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
        goto LABEL_14;
      }
      int v12 = 136315650;
      uint64_t v13 = "-[THThreadNetworkCredentialsKeychainBackingStore storeActiveDataSetRecordAndSync:completion:]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 1103;
      __int16 v16 = 2112;
      id v17 = v3;
      id v8 = "%s:%d Credential sync error, ErrorInfo : %@ ";
      uint64_t v9 = v7;
      uint32_t v10 = 28;
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      if (_os_feature_enabled_impl()
        && ([*(id *)(a1 + 32) markAsPreferred:*(void *)(a1 + 40)] & 1) == 0)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      }
      dispatch_group_t v7 = THCredentialsServerLogHandleForCategory(1);
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      int v11 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      int v12 = 136315650;
      uint64_t v13 = "-[THThreadNetworkCredentialsKeychainBackingStore storeActiveDataSetRecordAndSync:completion:]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 1101;
      __int16 v16 = 1024;
      LODWORD(v17) = v11;
      id v8 = "%s:%d Credential sync Complete, syncDone : %d";
      uint64_t v9 = v7;
      uint32_t v10 = 24;
    }
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v10);
    goto LABEL_13;
  }
LABEL_14:
}

void __93__THThreadNetworkCredentialsKeychainBackingStore_storeActiveDataSetRecordAndSync_completion___block_invoke_82(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v2 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      OSStatus v3 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      int v10 = 136315650;
      int v11 = "-[THThreadNetworkCredentialsKeychainBackingStore storeActiveDataSetRecordAndSync:completion:]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 1123;
      __int16 v14 = 1024;
      OSStatus v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s:%d Inside group notify block, sync is done, syncDone : %d", (uint8_t *)&v10, 0x18u);
    }

    CFDictionaryRef v4 = [*(id *)(a1 + 32) computedUniqueIdentifier];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    BOOL v5 = [*(id *)(a1 + 32) borderAgent];
    CFDictionaryRef v4 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForDeleteActiveDataSetOperationForThreadNetworkBorderAgent:v5];

    OSStatus v6 = SecItemDelete(v4);
    dispatch_group_t v7 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315650;
      int v11 = "-[THThreadNetworkCredentialsKeychainBackingStore storeActiveDataSetRecordAndSync:completion:]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 1132;
      __int16 v14 = 1024;
      OSStatus v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s:%d sync not done, let's delete the local record, Got on deletion : (err=%d)", (uint8_t *)&v10, 0x18u);
    }

    id v8 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      int v11 = "-[THThreadNetworkCredentialsKeychainBackingStore storeActiveDataSetRecordAndSync:completion:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Error, Sync failure ", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v9 = +[NSError storeError:6 description:@"Error, iCloud Sync failure"];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __93__THThreadNetworkCredentialsKeychainBackingStore_storeActiveDataSetRecordAndSync_completion___block_invoke_83(uint64_t a1, int a2, uint64_t a3)
{
  OSStatus v6 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    uint64_t v9 = "-[THThreadNetworkCredentialsKeychainBackingStore storeActiveDataSetRecordAndSync:completion:]_block_invoke";
    __int16 v10 = 1024;
    int v11 = a2;
    __int16 v12 = 2112;
    uint64_t v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Inside Sync completion, didSync : %d, ErrorInfo : %@ ", (uint8_t *)&v8, 0x1Cu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __93__THThreadNetworkCredentialsKeychainBackingStore_storeActiveDataSetRecordAndSync_completion___block_invoke_84(uint64_t a1)
{
  v2 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    BOOL v5 = "-[THThreadNetworkCredentialsKeychainBackingStore storeActiveDataSetRecordAndSync:completion:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 1193;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s:%d Timer Fired !!! ", (uint8_t *)&v4, 0x12u);
  }

  OSStatus v3 = +[NSError storeError:8 description:@"Error, Credentials sync timed out"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isFrozenRecord:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)THFrozenThreadNetwork);
  __int16 v6 = [v4 credentialsDataSet];
  id v7 = [v5 initWithCredentialsDataSet:v6 creationDate:0 lastModificationDate:0];

  if (v7)
  {
    int v8 = +[THFrozenThreadNetwork keyChainQueryForFrozenThreadNetworkRecordOperationForCredentialsDataSet:v7];
    if (v8)
    {
      id v18 = 0;
      uint64_t v9 = [(THThreadNetworkCredentialsKeychainBackingStore *)self _doFetchFrozenThreadNetworks:v8 error:&v18];
      __int16 v10 = v18;
      int v11 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = [v9 count];
        *(_DWORD *)buf = 136315650;
        uint64_t v20 = "-[THThreadNetworkCredentialsKeychainBackingStore isFrozenRecord:]";
        __int16 v21 = 1024;
        int v22 = 1234;
        __int16 v23 = 2048;
        id v24 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s : %d - Frozen network in Database = %lu", buf, 0x1Cu);
      }

      [(THThreadNetworkCredentialsKeychainBackingStore *)self dumpFrozenThreadNetworks:v9];
      if (v9 && [v9 count])
      {
        BOOL v13 = 1;
        __int16 v14 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          OSStatus v15 = [v4 network];
          __int16 v16 = [v15 networkName];
          *(_DWORD *)buf = 136315650;
          uint64_t v20 = "-[THThreadNetworkCredentialsKeychainBackingStore isFrozenRecord:]";
          __int16 v21 = 1024;
          int v22 = 1244;
          __int16 v23 = 2112;
          id v24 = v16;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s:%d: Record(name : %@) credentials are marked frozen network in the Database ", buf, 0x1Cu);
        }
      }
      else
      {
        __int16 v14 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v20 = "-[THThreadNetworkCredentialsKeychainBackingStore isFrozenRecord:]";
          __int16 v21 = 1024;
          int v22 = 1240;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s:%d: No frozen network found in Database ", buf, 0x12u);
        }
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 1;
      __int16 v10 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore isFrozenRecord:]();
      }
    }
  }
  else
  {
    BOOL v13 = 1;
    int v8 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore isFrozenRecord:]();
    }
  }

  return v13;
}

- (void)updatePreferredNetworkWithNewDatasetRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __104__THThreadNetworkCredentialsKeychainBackingStore_updatePreferredNetworkWithNewDatasetRecord_completion___block_invoke;
  block[3] = &unk_100499438;
  BOOL v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __104__THThreadNetworkCredentialsKeychainBackingStore_updatePreferredNetworkWithNewDatasetRecord_completion___block_invoke(uint64_t a1)
{
  v2 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    OSStatus v3 = [*(id *)(a1 + 32) network];
    id v4 = [v3 networkName];
    id v5 = [*(id *)(a1 + 32) network];
    id v6 = [v5 extendedPANID];
    id v7 = [*(id *)(a1 + 32) uniqueIdentifier];
    int v48 = 136316162;
    __int16 v49 = "-[THThreadNetworkCredentialsKeychainBackingStore updatePreferredNetworkWithNewDatasetRecord:completion:]_block_invoke";
    __int16 v50 = 1024;
    int v51 = 1255;
    __int16 v52 = 2112;
    long long v53 = v4;
    __int16 v54 = 2112;
    long long v55 = v6;
    __int16 v56 = 2112;
    v57 = v7;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s:%d: :Request to update preferred credentials with (networkName=%@, xpanid=%@, uuid = %@", (uint8_t *)&v48, 0x30u);
  }
  int v8 = *(void **)(a1 + 32);
  if (!v8) {
    goto LABEL_10;
  }
  uint64_t v9 = [v8 credentialsDataSet];
  if (!v9) {
    goto LABEL_10;
  }
  id v10 = (void *)v9;
  int v11 = [*(id *)(a1 + 32) credentialsDataSet];
  uint64_t v12 = [v11 dataSetArray];
  if (!v12)
  {

    goto LABEL_10;
  }
  BOOL v13 = (void *)v12;
  id v14 = [*(id *)(a1 + 32) credentialsDataSet];
  OSStatus v15 = [v14 dataSetArray];
  id v16 = [v15 length];

  if (!v16)
  {
LABEL_10:
    uint64_t v27 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      __104__THThreadNetworkCredentialsKeychainBackingStore_updatePreferredNetworkWithNewDatasetRecord_completion___block_invoke_cold_1();
    }

    CFStringRef v25 = @"record parameter is invalid";
    uint64_t v26 = 4;
    goto LABEL_13;
  }
  id v17 = [*(id *)(a1 + 32) credentials];
  [v17 setIsActiveDevice:1];

  id v18 = objc_alloc((Class)THThreadNetworkCredentialsDataSet);
  CFDictionaryRef v19 = [*(id *)(a1 + 32) credentialsDataSet];
  uint64_t v20 = [v19 dataSetArray];
  __int16 v21 = [*(id *)(a1 + 32) credentials];
  int v22 = [v21 userInfo];
  id v23 = [v18 initWithDataSetArray:v20 userInfo:v22];
  id v24 = [*(id *)(a1 + 32) credentials];
  [v24 setCredentialsDataSet:v23];

  if (![*(id *)(a1 + 40) isFrozenRecord:*(void *)(a1 + 32)])
  {
    CFDictionaryRef v29 = [*(id *)(a1 + 32) keyChainItemRepresentationForActiveDataSetRecordAddOperation];
    __int16 v28 = v29;
    if (v29)
    {
      OSStatus v30 = SecItemAdd(v29, 0);
      OSStatus v31 = v30;
      if (v30 == -25299)
      {
        uint64_t v32 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          __104__THThreadNetworkCredentialsKeychainBackingStore_updatePreferredNetworkWithNewDatasetRecord_completion___block_invoke_cold_4();
        }

        CFDictionaryRef v33 = [*(id *)(a1 + 32) keyChainQueryForActiveDataSetRecordUpdateOperation];
        CFDictionaryRef v34 = [*(id *)(a1 + 32) keyChainItemRepresentationForActiveDataSetRecordUpdateOperation];
        OSStatus v31 = SecItemUpdate(v33, v34);
      }
      if (v31)
      {
        id v35 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          int v48 = 136315650;
          __int16 v49 = "-[THThreadNetworkCredentialsKeychainBackingStore updatePreferredNetworkWithNewDatasetRecord:completion:]_block_invoke";
          __int16 v50 = 1024;
          int v51 = 1301;
          __int16 v52 = 1024;
          LODWORD(v53) = v31;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%s:%d Error while adding/updating the record : (err=%d)", (uint8_t *)&v48, 0x18u);
        }

        CFDictionaryRef v36 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v31 userInfo:0];
        uint64_t v37 = +[NSError storeError:2 underlyingError:v36 description:@"Error while adding/updating the record"];
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        goto LABEL_24;
      }
      if ([*(id *)(a1 + 40) updatePreferredNetworkEntry:*(void *)(a1 + 32)])
      {
        uint64_t v41 = *(void *)(a1 + 48);
        CFDictionaryRef v36 = [*(id *)(a1 + 32) computedUniqueIdentifier];
        uint64_t v40 = *(void (**)(void))(v41 + 16);
        goto LABEL_29;
      }
      uint64_t v42 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        __104__THThreadNetworkCredentialsKeychainBackingStore_updatePreferredNetworkWithNewDatasetRecord_completion___block_invoke_cold_3();
      }

      if (v30 != -25299)
      {
        unsigned int v43 = [*(id *)(a1 + 32) network];
        char v44 = [*(id *)(a1 + 32) borderAgent];
        CFDictionaryRef v36 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForDeleteActiveDataSetOperationForNetworkAndBorderAgent:v43 borderAgent:v44];

        OSStatus v45 = SecItemDelete(v36);
        char v46 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
          __104__THThreadNetworkCredentialsKeychainBackingStore_updatePreferredNetworkWithNewDatasetRecord_completion___block_invoke_cold_2();
        }

        if (v45)
        {
          uint64_t v37 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v45 userInfo:0];
          id v47 = +[NSError storeError:2 underlyingError:v37 description:@"Error while adding/updating the record"];
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_24:
LABEL_30:

          goto LABEL_14;
        }
      }
      CFStringRef v38 = @"No preferred network found";
      uint64_t v39 = 10;
    }
    else
    {
      CFStringRef v38 = @"Bad network parameter";
      uint64_t v39 = 4;
    }
    CFDictionaryRef v36 = +[NSError storeError:v39 description:v38];
    uint64_t v40 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_29:
    v40();
    goto LABEL_30;
  }
  CFStringRef v25 = @"Can not store frozen credentials";
  uint64_t v26 = 31;
LABEL_13:
  __int16 v28 = +[NSError storeError:v26 description:v25];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_14:
}

- (void)validateAODInternally:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __83__THThreadNetworkCredentialsKeychainBackingStore_validateAODInternally_completion___block_invoke;
  block[3] = &unk_100499258;
  id v12 = v6;
  BOOL v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __83__THThreadNetworkCredentialsKeychainBackingStore_validateAODInternally_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (!v2) {
    goto LABEL_7;
  }
  uint64_t v3 = [v2 dataSetArray];
  if (!v3) {
    goto LABEL_7;
  }
  id v4 = (void *)v3;
  id v5 = [*(id *)(a1 + 32) dataSetArray];
  if (![v5 length])
  {

LABEL_7:
    id v9 = 0;
    goto LABEL_8;
  }
  id v6 = *(void **)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) dataSetArray];
  id v12 = 0;
  unsigned __int8 v8 = [v6 areValidDataSetTLVs:v7 creds:&v12];
  id v9 = v12;

  if (v8)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_11;
  }
LABEL_8:
  id v10 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v14 = "-[THThreadNetworkCredentialsKeychainBackingStore validateAODInternally:completion:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Error, dataset is not valid ", buf, 0xCu);
  }

  int v11 = +[NSError storeError:37 description:@"Unable parse the Active Operational Dataset"];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_11:
}

- (void)storeCachedAODasPreferredNetwork:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __94__THThreadNetworkCredentialsKeychainBackingStore_storeCachedAODasPreferredNetwork_completion___block_invoke;
  block[3] = &unk_100499258;
  id v12 = v6;
  BOOL v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __94__THThreadNetworkCredentialsKeychainBackingStore_storeCachedAODasPreferredNetwork_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (!v2) {
    goto LABEL_7;
  }
  uint64_t v3 = [v2 dataSetArray];
  if (!v3) {
    goto LABEL_7;
  }
  id v4 = (void *)v3;
  id v5 = [*(id *)(a1 + 32) dataSetArray];
  if (![v5 length])
  {

LABEL_7:
    id v9 = 0;
    goto LABEL_8;
  }
  id v6 = *(void **)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) dataSetArray];
  id v15 = 0;
  unsigned __int8 v8 = [v6 areValidDataSetTLVs:v7 creds:&v15];
  id v9 = v15;

  if (v8)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __94__THThreadNetworkCredentialsKeychainBackingStore_storeCachedAODasPreferredNetwork_completion___block_invoke_98;
    v13[3] = &unk_100499460;
    id v10 = *(void **)(a1 + 40);
    id v14 = *(id *)(a1 + 48);
    [v10 storeThreadCredentialActiveDataSetRecord:v9 waitForSync:0 completion:v13];
    int v11 = v14;
    goto LABEL_11;
  }
LABEL_8:
  id v12 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v17 = "-[THThreadNetworkCredentialsKeychainBackingStore storeCachedAODasPreferredNetwork:completion:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Error, dataset is not valid ", buf, 0xCu);
  }

  int v11 = +[NSError storeError:10 description:@"No preferred network found"];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_11:
}

uint64_t __94__THThreadNetworkCredentialsKeychainBackingStore_storeCachedAODasPreferredNetwork_completion___block_invoke_98(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)storeThreadCredentialActiveDataSetRecord:(id)a3 waitForSync:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = dispatch_get_global_queue(0, 0);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __114__THThreadNetworkCredentialsKeychainBackingStore_storeThreadCredentialActiveDataSetRecord_waitForSync_completion___block_invoke;
  v13[3] = &unk_100499370;
  id v15 = self;
  id v16 = v9;
  id v14 = v8;
  BOOL v17 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __114__THThreadNetworkCredentialsKeychainBackingStore_storeThreadCredentialActiveDataSetRecord_waitForSync_completion___block_invoke(uint64_t a1)
{
  v2 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) network];
    id v4 = [v3 networkName];
    id v5 = [*(id *)(a1 + 32) network];
    id v6 = [v5 extendedPANID];
    id v7 = [*(id *)(a1 + 32) computedUniqueIdentifier];
    id v8 = [*(id *)(a1 + 32) keychainAccessGroup];
    *(_DWORD *)buf = 136316418;
    v93 = "-[THThreadNetworkCredentialsKeychainBackingStore storeThreadCredentialActiveDataSetRecord:waitForSync:completi"
          "on:]_block_invoke";
    __int16 v94 = 1024;
    int v95 = 1387;
    __int16 v96 = 2112;
    v97 = v4;
    __int16 v98 = 2112;
    v99 = v6;
    __int16 v100 = 2112;
    v101 = v7;
    __int16 v102 = 2112;
    v103 = v8;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s:%d:Request to store credential (networkName=%@, xpanid=%@, uuid = %@, keychainaccessgroup : %@", buf, 0x3Au);
  }
  id v9 = *(void **)(a1 + 32);
  if (!v9) {
    goto LABEL_10;
  }
  uint64_t v10 = [v9 credentialsDataSet];
  if (!v10) {
    goto LABEL_10;
  }
  id v11 = (void *)v10;
  id v12 = [*(id *)(a1 + 32) credentialsDataSet];
  uint64_t v13 = [v12 dataSetArray];
  if (!v13)
  {

    goto LABEL_10;
  }
  id v14 = (void *)v13;
  id v15 = [*(id *)(a1 + 32) credentialsDataSet];
  id v16 = [v15 dataSetArray];
  id v17 = [v16 length];

  if (!v17)
  {
LABEL_10:
    __int16 v28 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      __114__THThreadNetworkCredentialsKeychainBackingStore_storeThreadCredentialActiveDataSetRecord_waitForSync_completion___block_invoke_cold_1();
    }

    CFStringRef v26 = @"record parameter is invalid";
    uint64_t v27 = 4;
    goto LABEL_13;
  }
  id v18 = [*(id *)(a1 + 32) credentials];
  [v18 setIsActiveDevice:1];

  id v19 = objc_alloc((Class)THThreadNetworkCredentialsDataSet);
  uint64_t v20 = [*(id *)(a1 + 32) credentialsDataSet];
  __int16 v21 = [v20 dataSetArray];
  int v22 = [*(id *)(a1 + 32) credentials];
  id v23 = [v22 userInfo];
  id v24 = [v19 initWithDataSetArray:v21 userInfo:v23];
  CFStringRef v25 = [*(id *)(a1 + 32) credentials];
  [v25 setCredentialsDataSet:v24];

  if ([*(id *)(a1 + 40) isFrozenRecord:*(void *)(a1 + 32)])
  {
    CFStringRef v26 = @"Can not store frozen credentials";
    uint64_t v27 = 31;
LABEL_13:
    CFDictionaryRef v29 = +[NSError storeError:v27 description:v26];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_14;
  }
  OSStatus v30 = [*(id *)(a1 + 32) keychainAccessGroup];
  unsigned int v31 = [v30 isEqualToString:@"0000000000"];

  if (v31)
  {
    uint64_t v32 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      CFDictionaryRef v33 = [*(id *)(a1 + 32) network];
      CFDictionaryRef v34 = [v33 networkName];
      id v35 = [*(id *)(a1 + 32) network];
      CFDictionaryRef v36 = [v35 extendedPANID];
      uint64_t v37 = [*(id *)(a1 + 32) computedUniqueIdentifier];
      CFStringRef v38 = [*(id *)(a1 + 32) keychainAccessGroup];
      *(_DWORD *)buf = 136316418;
      v93 = "-[THThreadNetworkCredentialsKeychainBackingStore storeThreadCredentialActiveDataSetRecord:waitForSync:comple"
            "tion:]_block_invoke";
      __int16 v94 = 1024;
      int v95 = 1410;
      __int16 v96 = 2112;
      v97 = v34;
      __int16 v98 = 2112;
      v99 = v36;
      __int16 v100 = 2112;
      v101 = v37;
      __int16 v102 = 2112;
      v103 = v38;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%s:%d:Request to store INTERNAL credential (networkName=%@, xpanid=%@, uuid = %@, keychainaccessgroup : %@", buf, 0x3Au);
    }
    uint64_t v39 = [*(id *)(a1 + 40) getRecordForPreferredNetwork:0 anyDsFormat:0];
    CFDictionaryRef v29 = v39;
    if (!v39) {
      goto LABEL_49;
    }
    uint64_t v40 = [v39 credentialsDataSet];
    if (v40)
    {
      uint64_t v41 = (void *)v40;
      uint64_t v42 = [*(id *)(a1 + 32) credentialsDataSet];
      if (v42)
      {
        unsigned int v43 = (void *)v42;
        char v44 = [v29 credentialsDataSet];
        OSStatus v45 = [v44 dataSetArray];
        if ([v45 length])
        {
          char v46 = [*(id *)(a1 + 32) credentialsDataSet];
          id v47 = [v46 dataSetArray];
          if ([v47 length])
          {
            v88 = [v29 credentialsDataSet];
            int v48 = [v88 dataSetArray];
            __int16 v49 = [*(id *)(a1 + 32) credentialsDataSet];
            [v49 dataSetArray];
            __int16 v50 = v86 = v46;
            unsigned int v90 = [v48 isEqualToData:v50];

            if (v90)
            {
              int v51 = THCredentialsServerLogHandleForCategory(1);
              if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                v93 = "-[THThreadNetworkCredentialsKeychainBackingStore storeThreadCredentialActiveDataSetRecord:waitForS"
                      "ync:completion:]_block_invoke";
                __int16 v94 = 1024;
                int v95 = 1422;
                _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "%s:%d: Record matches with preferred network", buf, 0x12u);
              }

              __int16 v52 = THCredentialsServerLogHandleForCategory(1);
              if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                v93 = "-[THThreadNetworkCredentialsKeychainBackingStore storeThreadCredentialActiveDataSetRecord:waitForS"
                      "ync:completion:]_block_invoke";
                __int16 v94 = 1024;
                int v95 = 1424;
                _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "%s:%d: prefRecord =======>", buf, 0x12u);
              }

              [*(id *)(a1 + 40) thDumpActiveDatasetRecord:v29];
              long long v53 = THCredentialsServerLogHandleForCategory(1);
              if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                v93 = "-[THThreadNetworkCredentialsKeychainBackingStore storeThreadCredentialActiveDataSetRecord:waitForS"
                      "ync:completion:]_block_invoke";
                __int16 v94 = 1024;
                int v95 = 1427;
                _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "%s:%d: Incoming record =====>", buf, 0x12u);
              }

              [*(id *)(a1 + 40) thDumpActiveDatasetRecord:*(void *)(a1 + 32)];
              uint64_t v54 = *(void *)(a1 + 48);
              long long v55 = [v29 uniqueIdentifier];
              __int16 v56 = *(void (**)(void))(v54 + 16);
              goto LABEL_55;
            }
            goto LABEL_34;
          }
        }
      }
    }
LABEL_34:
    uint64_t v57 = [v29 credentialsDataSet];
    if (v57)
    {
      uint64_t v58 = (void *)v57;
      uint64_t v59 = [*(id *)(a1 + 32) credentialsDataSet];
      if (v59)
      {
        __int16 v60 = (void *)v59;
        int v61 = [v29 credentialsDataSet];
        __int16 v62 = [v61 dataSetArray];
        if ([v62 length])
        {
          long long v63 = [*(id *)(a1 + 32) credentialsDataSet];
          long long v64 = [v63 dataSetArray];
          if ([v64 length])
          {
            v89 = [v29 credentialsDataSet];
            long long v65 = [v89 dataSetArray];
            long long v66 = [*(id *)(a1 + 32) credentialsDataSet];
            [v66 dataSetArray];
            v67 = v87 = v63;
            unsigned __int8 v91 = [v65 isEqualToData:v67];

            if ((v91 & 1) == 0)
            {
              v68 = THCredentialsServerLogHandleForCategory(1);
              if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
                __114__THThreadNetworkCredentialsKeychainBackingStore_storeThreadCredentialActiveDataSetRecord_waitForSync_completion___block_invoke_cold_2();
              }

              v69 = THCredentialsServerLogHandleForCategory(1);
              if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                v93 = "-[THThreadNetworkCredentialsKeychainBackingStore storeThreadCredentialActiveDataSetRecord:waitForS"
                      "ync:completion:]_block_invoke";
                __int16 v94 = 1024;
                int v95 = 1441;
                _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_INFO, "%s:%d: prefRecord =======>", buf, 0x12u);
              }

              [*(id *)(a1 + 40) thDumpActiveDatasetRecord:v29];
              __int16 v70 = THCredentialsServerLogHandleForCategory(1);
              if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                v93 = "-[THThreadNetworkCredentialsKeychainBackingStore storeThreadCredentialActiveDataSetRecord:waitForS"
                      "ync:completion:]_block_invoke";
                __int16 v94 = 1024;
                int v95 = 1444;
                _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "%s:%d: Incoming record =====>", buf, 0x12u);
              }

              [*(id *)(a1 + 40) thDumpActiveDatasetRecord:*(void *)(a1 + 32)];
            }
            goto LABEL_49;
          }
        }
      }
    }
LABEL_49:
  }
  CFDictionaryRef v71 = [*(id *)(a1 + 32) keyChainItemRepresentationForActiveDataSetRecordAddOperation];
  CFDictionaryRef v29 = v71;
  if (!v71)
  {
    CFStringRef v72 = @"Bad network parameter";
    uint64_t v73 = 4;
    goto LABEL_54;
  }
  if (*(unsigned char *)(a1 + 56))
  {
    [*(id *)(a1 + 40) storeActiveDataSetRecordAndSync:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
    goto LABEL_14;
  }
  uint64_t v74 = SecItemAdd(v71, 0);
  if (v74 == -25299)
  {
    v75 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v93 = "-[THThreadNetworkCredentialsKeychainBackingStore storeThreadCredentialActiveDataSetRecord:waitForSync:comple"
            "tion:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "%s: Credential exists. Will update instead.", buf, 0xCu);
    }

    CFDictionaryRef v76 = [*(id *)(a1 + 32) keyChainQueryForActiveDataSetRecordUpdateOperation];
    CFDictionaryRef v77 = [*(id *)(a1 + 32) keyChainItemRepresentationForActiveDataSetRecordUpdateOperation];
    uint64_t v74 = SecItemUpdate(v76, v77);
  }
  if (!v74)
  {
    if (!_os_feature_enabled_impl()
      || ([*(id *)(a1 + 40) markAsPreferred:*(void *)(a1 + 32)] & 1) != 0)
    {
      long long v55 = [*(id *)(a1 + 32) computedUniqueIdentifier];
      __int16 v56 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
      goto LABEL_55;
    }
    v79 = *(void **)(a1 + 32);
    if (v79)
    {
      v80 = [v79 network];
      v81 = [*(id *)(a1 + 32) borderAgent];
      CFDictionaryRef v82 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForDeleteActiveDataSetOperationForNetworkAndBorderAgent:v80 borderAgent:v81];

      OSStatus v83 = SecItemDelete(v82);
      v84 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v93 = "-[THThreadNetworkCredentialsKeychainBackingStore storeThreadCredentialActiveDataSetRecord:waitForSync:comp"
              "letion:]_block_invoke";
        __int16 v94 = 1024;
        int v95 = 1501;
        __int16 v96 = 1024;
        LODWORD(v97) = v83;
        _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "%s:%d Preferred network storing failed, deleted the local record : (err=%d)", buf, 0x18u);
      }
    }
    v85 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v93 = "-[THThreadNetworkCredentialsKeychainBackingStore storeThreadCredentialActiveDataSetRecord:waitForSync:comple"
            "tion:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "%s: Error, Preferred network storing failure ", buf, 0xCu);
    }

    CFStringRef v72 = @"No preferred network found";
    uint64_t v73 = 10;
LABEL_54:
    long long v55 = +[NSError storeError:v73 description:v72];
    __int16 v56 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_55:
    v56();

    goto LABEL_14;
  }
  v78 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v93 = "-[THThreadNetworkCredentialsKeychainBackingStore storeThreadCredentialActiveDataSetRecord:waitForSync:completi"
          "on:]_block_invoke";
    __int16 v94 = 1024;
    int v95 = 1482;
    __int16 v96 = 1024;
    LODWORD(v97) = v74;
    _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "%s:%d Error while adding/updating the record : (err=%d)", buf, 0x18u);
  }

  [*(id *)(a1 + 40) errorout:v74 completion:*(void *)(a1 + 48)];
LABEL_14:
}

- (void)retrieveActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup:(id)a3 keychainAccessGroup:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = dispatch_get_global_queue(0, 0);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __152__THThreadNetworkCredentialsKeychainBackingStore_retrieveActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup_keychainAccessGroup_completion___block_invoke;
  v15[3] = &unk_100499488;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __152__THThreadNetworkCredentialsKeychainBackingStore_retrieveActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup_keychainAccessGroup_completion___block_invoke(void *a1)
{
  uint64_t v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = a1[4];
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to fetch active dataset record with UUID %@", buf, 0xCu);
  }

  id v5 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchOneActiveDataSetRecordOperationForUniqueIdentifierWithKeychainAccessGroup:a1[4] clientKeychainAccessGroup:a1[5]];
  id v6 = (void *)a1[6];
  id v11 = 0;
  id v7 = [v6 _doFetchActiveDataSetRecords:v5 error:&v11];
  id v8 = v11;
  uint64_t v9 = a1[7];
  id v10 = [v7 anyObject];
  (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v8);
}

- (void)retrieveActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup:(id)a3 keychainAccessGroup:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = dispatch_get_global_queue(0, 0);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __152__THThreadNetworkCredentialsKeychainBackingStore_retrieveActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup_keychainAccessGroup_completion___block_invoke;
  v15[3] = &unk_100499488;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __152__THThreadNetworkCredentialsKeychainBackingStore_retrieveActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup_keychainAccessGroup_completion___block_invoke(uint64_t a1)
{
  uint64_t v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [*(id *)(a1 + 32) discriminatorId];
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to fetch active dataset record with borderAgent %@", buf, 0xCu);
  }
  id v5 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchActiveDataSetRecordOperationForBorderAgentWithKeychainAccessGroup:*(void *)(a1 + 32) clientKeychainAccessGroup:*(void *)(a1 + 40)];
  id v6 = *(void **)(a1 + 48);
  id v11 = 0;
  id v7 = [v6 _doFetchActiveDataSetRecords:v5 error:&v11];
  id v8 = v11;
  uint64_t v9 = *(void *)(a1 + 56);
  id v10 = [v7 anyObject];
  (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v8);
}

- (void)deleteActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup:(id)a3 keychainAccessGroup:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __150__THThreadNetworkCredentialsKeychainBackingStore_deleteActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup_keychainAccessGroup_completion___block_invoke;
  block[3] = &unk_100499258;
  id v15 = v7;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v10, block);
}

void __150__THThreadNetworkCredentialsKeychainBackingStore_deleteActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup_keychainAccessGroup_completion___block_invoke(void *a1)
{
  uint64_t v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (const char *)a1[4];
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to DELETE credential with identifier %@", (uint8_t *)&v12, 0xCu);
  }

  CFDictionaryRef v5 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForDeleteActiveDataSetRecordOperationForUniqueIdentifierWithKeychainAccessGroup:a1[4] clientKeychainAccessGroup:a1[5]];
  OSStatus v6 = SecItemDelete(v5);
  id v7 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    id v13 = "-[THThreadNetworkCredentialsKeychainBackingStore deleteActiveDataSetRecordWithUniqueIdentifierWithKeychainAcce"
          "ssGroup:keychainAccessGroup:completion:]_block_invoke";
    __int16 v14 = 1024;
    OSStatus v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: GOT: (err=%d)", (uint8_t *)&v12, 0x12u);
  }

  if (v6)
  {
    id v8 = (__CFString *)SecCopyErrorMessageString(v6, 0);
    id v9 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __107__THThreadNetworkCredentialsKeychainBackingStore_deleteActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke_cold_1();
    }

    id v10 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v6 userInfo:0];
    id v11 = +[NSError storeError:13 underlyingError:v10 description:v8];
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (void)deleteActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup:(id)a3 keychainAccessGroup:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __150__THThreadNetworkCredentialsKeychainBackingStore_deleteActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup_keychainAccessGroup_completion___block_invoke;
  block[3] = &unk_100499258;
  id v15 = v7;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v10, block);
}

void __150__THThreadNetworkCredentialsKeychainBackingStore_deleteActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup_keychainAccessGroup_completion___block_invoke(uint64_t a1)
{
  uint64_t v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [*(id *)(a1 + 32) discriminatorId];
    int v12 = 136315394;
    id v13 = "-[THThreadNetworkCredentialsKeychainBackingStore deleteActiveDataSetRecordForThreadBorderAgentWithKeychainAcce"
          "ssGroup:keychainAccessGroup:completion:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: Request to DELETE credential with Ba %@", (uint8_t *)&v12, 0x16u);
  }
  CFDictionaryRef v5 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForDeleteActiveDataSetOperationForThreadNetworkBorderAgentWithKeychainAccessGroup:*(void *)(a1 + 32) clientKeychainAccessGroup:*(void *)(a1 + 40)];
  OSStatus v6 = SecItemDelete(v5);
  id v7 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    id v13 = "-[THThreadNetworkCredentialsKeychainBackingStore deleteActiveDataSetRecordForThreadBorderAgentWithKeychainAcce"
          "ssGroup:keychainAccessGroup:completion:]_block_invoke";
    __int16 v14 = 1024;
    LODWORD(v15) = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: GOT: (err=%d)", (uint8_t *)&v12, 0x12u);
  }

  if (v6)
  {
    id v8 = (__CFString *)SecCopyErrorMessageString(v6, 0);
    id v9 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __150__THThreadNetworkCredentialsKeychainBackingStore_deleteActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup_keychainAccessGroup_completion___block_invoke_cold_1();
    }

    id v10 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v6 userInfo:0];
    id v11 = +[NSError storeError:12 underlyingError:v10 description:v8];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (BOOL)checkWiFiStatus
{
  id v2 = [objc_alloc((Class)NWPathEvaluator) initWithEndpoint:0 parameters:0];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = [v2 path];
    unsigned __int8 v5 = [v4 usesInterfaceType:1];

    LOBYTE(v2) = v5;
  }
  return (char)v2;
}

- (BOOL)checkIfXpanIDMatchToMDNSScan:(id)a3
{
  id v3 = a3;
  uint64_t v4 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfXpanIDMatchToMDNSScan:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1621;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s:%d: Entered. Checking if Network extendedPANID matches with Mdns", buf, 0x12u);
  }

  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  __int16 v21 = __Block_byref_object_copy_;
  int v22 = __Block_byref_object_dispose_;
  id v23 = objc_alloc_init(ThreadBRFinder);
  unsigned __int8 v5 = *(void **)(*(void *)&buf[8] + 40);
  if (!v5)
  {
    id v11 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v16 = 136315394;
      id v17 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfXpanIDMatchToMDNSScan:]";
      __int16 v18 = 1024;
      int v19 = 1626;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s:%d: baFinder is nil..", v16, 0x12u);
    }
    goto LABEL_15;
  }
  if (([v5 dispatchStartScan:0 extendedPanIdToFind:v3 borderAgentIdToFind:0] & 1) == 0)
  {
    id v11 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore checkIfXpanIDMatchToMDNSScan:]();
    }
LABEL_15:

LABEL_16:
    BOOL v12 = 0;
    goto LABEL_17;
  }
  OSStatus v6 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id v16 = 136315394;
    id v17 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfXpanIDMatchToMDNSScan:]";
    __int16 v18 = 1024;
    int v19 = 1635;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s:%d: Waiting for extendedPANID network record to match on Mdns meshcop", v16, 0x12u);
  }

  dispatch_time_t v7 = dispatch_time(0, 10000000000);
  id v8 = [*(id *)(*(void *)&buf[8] + 40) baFinderSemaphore];
  intptr_t v9 = dispatch_semaphore_wait(v8, v7);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __79__THThreadNetworkCredentialsKeychainBackingStore_checkIfXpanIDMatchToMDNSScan___block_invoke;
  block[3] = &unk_1004994B0;
  void block[4] = buf;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  if (v9)
  {
    id v10 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore checkIfXpanIDMatchToMDNSScan:]();
    }

    [*(id *)(*(void *)&buf[8] + 40) clear];
    goto LABEL_16;
  }
  __int16 v14 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id v16 = 136315394;
    id v17 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfXpanIDMatchToMDNSScan:]";
    __int16 v18 = 1024;
    int v19 = 1651;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s:%d: extendedPANID network record matches on Mdns meshcop", v16, 0x12u);
  }

  [*(id *)(*(void *)&buf[8] + 40) clear];
  BOOL v12 = 1;
LABEL_17:
  _Block_object_dispose(buf, 8);

  return v12;
}

id __79__THThreadNetworkCredentialsKeychainBackingStore_checkIfXpanIDMatchToMDNSScan___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stopScan];
}

- (BOOL)checkIfNetworkMatchToMDNSScan:(id)a3 borderAgentID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  dispatch_time_t v7 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfNetworkMatchToMDNSScan:borderAgentID:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1660;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s:%d: Entered. Checking if borderAgentID Network matches with Mdns", buf, 0x12u);
  }

  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy_;
  __int16 v28 = __Block_byref_object_dispose_;
  CFDictionaryRef v29 = objc_alloc_init(ThreadBRFinder);
  id v8 = *(void **)(*(void *)&buf[8] + 40);
  if (!v8)
  {
    id v17 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v22 = 136315394;
      id v23 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfNetworkMatchToMDNSScan:borderAgentID:]";
      __int16 v24 = 1024;
      int v25 = 1665;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s:%d: baFinder is nil..", v22, 0x12u);
    }
    goto LABEL_15;
  }
  intptr_t v9 = [v5 networkName];
  id v10 = [v5 extendedPANID];
  unsigned __int8 v11 = [v8 dispatchStartScan:v9 extendedPanIdToFind:v10 borderAgentIdToFind:v6];

  if ((v11 & 1) == 0)
  {
    id v17 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore checkIfNetworkMatchToMDNSScan:borderAgentID:]();
    }
LABEL_15:

LABEL_16:
    BOOL v18 = 0;
    goto LABEL_17;
  }
  BOOL v12 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)int v22 = 136315394;
    id v23 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfNetworkMatchToMDNSScan:borderAgentID:]";
    __int16 v24 = 1024;
    int v25 = 1674;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s:%d: Waiting for borderAgentID network record to match on Mdns meshcop", v22, 0x12u);
  }

  dispatch_time_t v13 = dispatch_time(0, 10000000000);
  __int16 v14 = [*(id *)(*(void *)&buf[8] + 40) baFinderSemaphore];
  intptr_t v15 = dispatch_semaphore_wait(v14, v13);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __94__THThreadNetworkCredentialsKeychainBackingStore_checkIfNetworkMatchToMDNSScan_borderAgentID___block_invoke;
  block[3] = &unk_1004994B0;
  void block[4] = buf;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  if (v15)
  {
    id v16 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore checkIfNetworkMatchToMDNSScan:borderAgentID:]();
    }

    [*(id *)(*(void *)&buf[8] + 40) clear];
    goto LABEL_16;
  }
  uint64_t v20 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)int v22 = 136315394;
    id v23 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfNetworkMatchToMDNSScan:borderAgentID:]";
    __int16 v24 = 1024;
    int v25 = 1689;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s:%d: borderAgentID network record matches on Mdns meshcop", v22, 0x12u);
  }

  [*(id *)(*(void *)&buf[8] + 40) clear];
  BOOL v18 = 1;
LABEL_17:
  _Block_object_dispose(buf, 8);

  return v18;
}

id __94__THThreadNetworkCredentialsKeychainBackingStore_checkIfNetworkMatchToMDNSScan_borderAgentID___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stopScan];
}

- (void)validateRecordWithMdnsScan:(id)a3 borderAgentID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned __int8 v11 = dispatch_get_global_queue(0, 0);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __102__THThreadNetworkCredentialsKeychainBackingStore_validateRecordWithMdnsScan_borderAgentID_completion___block_invoke;
  v15[3] = &unk_1004994D8;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __102__THThreadNetworkCredentialsKeychainBackingStore_validateRecordWithMdnsScan_borderAgentID_completion___block_invoke(uint64_t a1)
{
  id v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [*(id *)(a1 + 32) networkName];
    int v10 = 136315394;
    unsigned __int8 v11 = "-[THThreadNetworkCredentialsKeychainBackingStore validateRecordWithMdnsScan:borderAgentID:completion:]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: Request to validate network with MDNS %@", (uint8_t *)&v10, 0x16u);
  }
  if (([*(id *)(a1 + 40) checkWiFiStatus] & 1) == 0)
  {
    CFStringRef v7 = @"Error : Device is not connected to the network";
    uint64_t v8 = 19;
LABEL_10:
    id v9 = +[NSError storeError:v8 description:v7];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

    goto LABEL_11;
  }
  if (([*(id *)(a1 + 40) checkIfNetworkMatchToMDNSScan:*(void *)(a1 + 32) borderAgentID:*(void *)(a1 + 48)] & 1) == 0)
  {
    CFStringRef v7 = @"Thread network credentials does not match with any of the active thread networks around";
    uint64_t v8 = 20;
    goto LABEL_10;
  }
  id v5 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(a1 + 32) networkName];
    int v10 = 136315394;
    unsigned __int8 v11 = "-[THThreadNetworkCredentialsKeychainBackingStore validateRecordWithMdnsScan:borderAgentID:completion:]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Valid Thread network credentials, network name :  %@", (uint8_t *)&v10, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_11:
}

- (void)checkIfRecordForPreferredNetworkIsPresentWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __106__THThreadNetworkCredentialsKeychainBackingStore_checkIfRecordForPreferredNetworkIsPresentWithCompletion___block_invoke;
  v7[3] = &unk_100499280;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __106__THThreadNetworkCredentialsKeychainBackingStore_checkIfRecordForPreferredNetworkIsPresentWithCompletion___block_invoke(uint64_t a1)
{
  id v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v39 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfRecordForPreferredNetworkIsPresentWithCompletion:]_block_invoke";
    __int16 v40 = 1024;
    int v41 = 1724;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:%d: Request to check if there are any records for the preferred network exists", buf, 0x12u);
  }

  id v4 = [*(id *)(a1 + 32) getPreferredNetwork:0];
  id v5 = v4;
  if (!v4)
  {
    id v17 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v39 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfRecordForPreferredNetworkIsPresentWithCompletion:]_block_invoke";
      __int16 v40 = 1024;
      int v41 = 1729;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s:%d: No Preferred Network..", buf, 0x12u);
    }
    goto LABEL_11;
  }
  uint64_t v6 = [v4 credentialsDataSetRecord];
  if (v6)
  {
    CFStringRef v7 = (void *)v6;
    id v8 = [v5 credentialsDataSetRecord];
    id v9 = [v8 credentialsDataSet];
    uint64_t v10 = [v9 dataSetArray];
    if (v10)
    {
      unsigned __int8 v11 = (void *)v10;
      __int16 v12 = [v5 credentialsDataSetRecord];
      id v13 = [v12 credentialsDataSet];
      [v13 dataSetArray];
      uint64_t v14 = a1;
      v16 = intptr_t v15 = v2;
      id v36 = [v16 length];

      id v2 = v15;
      a1 = v14;

      if (v36)
      {
        id v17 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          id v18 = [v5 credentialsDataSetRecord];
          id v19 = [v18 network];
          uint64_t v20 = [v19 networkName];
          __int16 v21 = [v5 credentialsDataSetRecord];
          int v22 = [v21 credentialsDataSet];
          id v23 = [v22 dataSetArray];
          *(_DWORD *)buf = 136315906;
          uint64_t v39 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfRecordForPreferredNetworkIsPresentWithCompletion:]_block_invoke";
          __int16 v40 = 1024;
          int v41 = 1739;
          __int16 v42 = 2112;
          id v43 = v20;
          __int16 v44 = 2112;
          OSStatus v45 = v23;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s:%d: This preferred network entry has record associated with it, returning the same preferred network : %@, dataset : %@", buf, 0x26u);
        }
LABEL_11:

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        goto LABEL_18;
      }
    }
    else
    {
    }
  }
  __int16 v24 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    int v25 = [v5 network];
    CFStringRef v26 = [v25 networkName];
    uint64_t v27 = [v5 network];
    __int16 v28 = [v27 extendedPANID];
    *(_DWORD *)buf = 136315906;
    uint64_t v39 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfRecordForPreferredNetworkIsPresentWithCompletion:]_block_invoke";
    __int16 v40 = 1024;
    int v41 = 1744;
    __int16 v42 = 2112;
    id v43 = v26;
    __int16 v44 = 2112;
    OSStatus v45 = v28;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s : %d - Request to check how many active dataset records are present for preferred network (name=%@, xpanid=%@)", buf, 0x26u);
  }
  CFDictionaryRef v29 = [v5 network];
  OSStatus v30 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchActiveDataSetRecordsOperationForNetwork:v29];

  unsigned int v31 = *(void **)(a1 + 32);
  id v37 = 0;
  uint64_t v32 = [v31 _doFetchActiveDataSetRecords:v30 error:&v37];
  id v33 = v37;
  CFDictionaryRef v34 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    id v35 = [v32 count];
    *(_DWORD *)buf = 136315650;
    uint64_t v39 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfRecordForPreferredNetworkIsPresentWithCompletion:]_block_invoke";
    __int16 v40 = 1024;
    int v41 = 1750;
    __int16 v42 = 2048;
    id v43 = v35;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "%s:%d: Preferred Network present and the matching Active dataset records size is: %lu", buf, 0x1Cu);
  }

  [v32 count];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

LABEL_18:
}

- (id)getRecordForPreferredNetwork:(BOOL)a3 anyDsFormat:(BOOL)a4
{
  return [(THThreadNetworkCredentialsKeychainBackingStore *)self getRecordForPreferredNetwork:a3 anyDsFormat:a4 skipScan:0];
}

- (id)getRecordForPreferredNetwork:(BOOL)a3 anyDsFormat:(BOOL)a4 skipScan:(BOOL)a5
{
  uint64_t v76 = 0;
  CFDictionaryRef v77 = &v76;
  uint64_t v78 = 0x3032000000;
  v79 = __Block_byref_object_copy_;
  v80 = __Block_byref_object_dispose_;
  id v81 = 0;
  uint64_t v70 = 0;
  CFDictionaryRef v71 = (id *)&v70;
  uint64_t v72 = 0x3032000000;
  uint64_t v73 = __Block_byref_object_copy_;
  uint64_t v74 = __Block_byref_object_dispose_;
  id v75 = 0;
  uint64_t v5 = [(THThreadNetworkCredentialsKeychainBackingStore *)self getPreferredNetwork:a3 skipScan:a5];
  uint64_t v6 = (void *)v77[5];
  v77[5] = v5;

  CFStringRef v7 = (void *)v77[5];
  if (!v7)
  {
    uint64_t v58 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore getRecordForPreferredNetwork:anyDsFormat:skipScan:]();
    }
    id v23 = 0;
LABEL_44:

    goto LABEL_45;
  }
  id v8 = [v7 credentialsDataSetRecord];
  if (!v8) {
    goto LABEL_12;
  }
  id v9 = [(id)v77[5] credentialsDataSetRecord];
  uint64_t v10 = [v9 credentialsDataSet];
  unsigned __int8 v11 = [v10 dataSetArray];
  if (!v11)
  {

    goto LABEL_12;
  }
  __int16 v12 = [(id)v77[5] credentialsDataSetRecord];
  id v13 = [v12 credentialsDataSet];
  uint64_t v14 = [v13 dataSetArray];
  BOOL v15 = [v14 length] == 0;

  if (v15)
  {
LABEL_12:
    __int16 v24 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      int v25 = [(id)v77[5] network];
      CFStringRef v26 = [v25 networkName];
      uint64_t v27 = [(id)v77[5] network];
      __int16 v28 = [v27 extendedPANID];
      *(_DWORD *)buf = 136315906;
      v84 = "-[THThreadNetworkCredentialsKeychainBackingStore getRecordForPreferredNetwork:anyDsFormat:skipScan:]";
      __int16 v85 = 1024;
      int v86 = 1791;
      __int16 v87 = 2112;
      id v88 = v26;
      __int16 v89 = 2112;
      unsigned int v90 = v28;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s : %d - Request to fetch all active dataset records for preferred network (name=%@, xpanid=%@)", buf, 0x26u);
    }
    CFDictionaryRef v29 = [(id)v77[5] network];
    uint64_t v58 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchActiveDataSetRecordsOperationForNetwork:v29];

    id v69 = 0;
    __int16 v56 = [(THThreadNetworkCredentialsKeychainBackingStore *)self _doFetchActiveDataSetRecords:v58 error:&v69];
    id v55 = v69;
    OSStatus v30 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      id v31 = [v56 count];
      *(_DWORD *)buf = 136315650;
      v84 = "-[THThreadNetworkCredentialsKeychainBackingStore getRecordForPreferredNetwork:anyDsFormat:skipScan:]";
      __int16 v85 = 1024;
      int v86 = 1797;
      __int16 v87 = 2048;
      id v88 = v31;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "%s:%d: Active dataset records size is: %lu", buf, 0x1Cu);
    }

    uint64_t v32 = [v56 allObjects];
    uint64_t v57 = +[NSMutableArray arrayWithArray:v32];

    if (v57)
    {
      [v57 sortUsingComparator:&__block_literal_global_103];
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id obj = v57;
      id v33 = [obj countByEnumeratingWithState:&v65 objects:v82 count:16];
      if (v33)
      {
        uint64_t v62 = *(void *)v66;
        do
        {
          for (i = 0; i != v33; i = (char *)i + 1)
          {
            if (*(void *)v66 != v62) {
              objc_enumerationMutation(obj);
            }
            id v35 = *(void **)(*((void *)&v65 + 1) + 8 * i);
            id v36 = [v35 borderAgent];
            id v37 = [v36 discriminatorId];
            if (v37)
            {
              CFStringRef v38 = [v35 credentialsDataSet];
              uint64_t v39 = [v38 dataSetArray];
              int v40 = v39 == 0;
              if (v39 && !a4)
              {
                int v41 = [v35 credentialsDataSet];
                __int16 v42 = [v41 dataSetArray];
                unsigned int v43 = [(THThreadNetworkCredentialsKeychainBackingStore *)self areValidDataSetTLVs:v42];

                int v40 = v43 ^ 1;
              }

              if (!v40)
              {
                objc_storeStrong(v71 + 5, v35);
                goto LABEL_37;
              }
            }
            else
            {
            }
            __int16 v44 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              OSStatus v45 = [v35 network];
              char v46 = [v45 networkName];
              *(_DWORD *)buf = 136315650;
              v84 = "-[THThreadNetworkCredentialsKeychainBackingStore getRecordForPreferredNetwork:anyDsFormat:skipScan:]";
              __int16 v85 = 1024;
              int v86 = 1827;
              __int16 v87 = 2112;
              id v88 = v46;
              _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "%s : %d : skipping older format credentials : name : %@", buf, 0x1Cu);
            }
          }
          id v33 = [obj countByEnumeratingWithState:&v65 objects:v82 count:16];
        }
        while (v33);
      }
LABEL_37:

      if (v71[5])
      {
        int v48 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          __int16 v49 = [v71[5] network];
          __int16 v50 = [v49 networkName];
          *(_DWORD *)buf = 136315650;
          v84 = "-[THThreadNetworkCredentialsKeychainBackingStore getRecordForPreferredNetwork:anyDsFormat:skipScan:]";
          __int16 v85 = 1024;
          int v86 = 1836;
          __int16 v87 = 2112;
          id v88 = v50;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "%s : %d : Check if require to update preferred network with record : name : %@", buf, 0x1Cu);
        }
        int v51 = [(id)v77[5] credentialsDataSetRecord];
        BOOL v52 = v51 == 0;

        if (v52)
        {
          objc_initWeak((id *)buf, self);
          long long v53 = dispatch_get_global_queue(0, 0);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = __100__THThreadNetworkCredentialsKeychainBackingStore_getRecordForPreferredNetwork_anyDsFormat_skipScan___block_invoke_104;
          block[3] = &unk_100499540;
          objc_copyWeak(&v64, (id *)buf);
          void block[4] = &v70;
          void block[5] = &v76;
          dispatch_async(v53, block);

          objc_destroyWeak(&v64);
          objc_destroyWeak((id *)buf);
        }
      }
      id v23 = v71[5];
    }
    else
    {
      id v47 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore getRecordForPreferredNetwork:anyDsFormat:skipScan:]();
      }

      id v23 = 0;
    }

    goto LABEL_44;
  }
  id v16 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = [(id)v77[5] credentialsDataSetRecord];
    id v18 = [v17 network];
    id v19 = [v18 networkName];
    uint64_t v20 = [(id)v77[5] credentialsDataSetRecord];
    __int16 v21 = [v20 credentialsDataSet];
    int v22 = [v21 dataSetArray];
    *(_DWORD *)buf = 136315906;
    v84 = "-[THThreadNetworkCredentialsKeychainBackingStore getRecordForPreferredNetwork:anyDsFormat:skipScan:]";
    __int16 v85 = 1024;
    int v86 = 1787;
    __int16 v87 = 2112;
    id v88 = v19;
    __int16 v89 = 2112;
    unsigned int v90 = v22;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s:%d: This preferred network entry has record associated with it, returning the same record : %@, dataset : %@", buf, 0x26u);
  }
  id v23 = [(id)v77[5] credentialsDataSetRecord];
LABEL_45:
  _Block_object_dispose(&v70, 8);

  _Block_object_dispose(&v76, 8);

  return v23;
}

int64_t __100__THThreadNetworkCredentialsKeychainBackingStore_getRecordForPreferredNetwork_anyDsFormat_skipScan___block_invoke(id a1, id a2, id a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 lastModificationDate];
  uint64_t v6 = [v4 lastModificationDate];

  id v7 = [v5 compare:v6];
  if (v7 == (id)1) {
    int64_t v8 = -1;
  }
  else {
    int64_t v8 = (int64_t)v7;
  }
  if (v7 == (id)-1) {
    return 1;
  }
  else {
    return v8;
  }
}

void __100__THThreadNetworkCredentialsKeychainBackingStore_getRecordForPreferredNetwork_anyDsFormat_skipScan___block_invoke_104(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) network];
    uint64_t v5 = [v4 networkName];
    int v6 = 136315650;
    id v7 = "-[THThreadNetworkCredentialsKeychainBackingStore getRecordForPreferredNetwork:anyDsFormat:skipScan:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 1841;
    __int16 v10 = 2112;
    unsigned __int8 v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s : %d : Updating preferred network with record : name : %@", (uint8_t *)&v6, 0x1Cu);
  }
  [WeakRetained updateRecordToPreferredNetworkEntry:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) credentialsDataSetRecord:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

- (void)retrievePreferredNetworkOfAnyDSFormatWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __102__THThreadNetworkCredentialsKeychainBackingStore_retrievePreferredNetworkOfAnyDSFormatWithCompletion___block_invoke;
  v7[3] = &unk_100499280;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __102__THThreadNetworkCredentialsKeychainBackingStore_retrievePreferredNetworkOfAnyDSFormatWithCompletion___block_invoke(uint64_t a1)
{
  id v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v14) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Request to fetch Preferred Network Active Dataset Record with Any format", (uint8_t *)&v14, 2u);
  }

  id v4 = [*(id *)(a1 + 32) getRecordForPreferredNetwork:0 anyDsFormat:1];
  uint64_t v5 = THCredentialsServerLogHandleForCategory(1);
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v7 = [v4 network];
      id v8 = [v7 networkName];
      int v9 = [v4 network];
      __int16 v10 = [v9 extendedPANID];
      unsigned __int8 v11 = [v4 borderAgent];
      __int16 v12 = [v11 discriminatorId];
      int v14 = 136316162;
      BOOL v15 = "-[THThreadNetworkCredentialsKeychainBackingStore retrievePreferredNetworkOfAnyDSFormatWithCompletion:]_block_invoke";
      __int16 v16 = 1024;
      int v17 = 1863;
      __int16 v18 = 2112;
      id v19 = v8;
      __int16 v20 = 2112;
      __int16 v21 = v10;
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s : %d - Returning record (name=%@, xpanid=%@, baid=%@)", (uint8_t *)&v14, 0x30u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __102__THThreadNetworkCredentialsKeychainBackingStore_retrievePreferredNetworkOfAnyDSFormatWithCompletion___block_invoke_cold_1();
    }

    id v13 = +[NSError storeError:9 description:@"No preferred network found"];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)retrievePreferredNetworkWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __89__THThreadNetworkCredentialsKeychainBackingStore_retrievePreferredNetworkWithCompletion___block_invoke;
  v7[3] = &unk_100499280;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __89__THThreadNetworkCredentialsKeychainBackingStore_retrievePreferredNetworkWithCompletion___block_invoke(uint64_t a1)
{
  id v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315394;
    BOOL v15 = "-[THThreadNetworkCredentialsKeychainBackingStore retrievePreferredNetworkWithCompletion:]_block_invoke";
    __int16 v16 = 1024;
    int v17 = 1873;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:%d:Request to fetch Preferred Network Active Dataset Record", (uint8_t *)&v14, 0x12u);
  }

  id v4 = [*(id *)(a1 + 32) getRecordForPreferredNetwork:0 anyDsFormat:0];
  uint64_t v5 = THCredentialsServerLogHandleForCategory(1);
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v7 = [v4 network];
      id v8 = [v7 networkName];
      int v9 = [v4 network];
      __int16 v10 = [v9 extendedPANID];
      unsigned __int8 v11 = [v4 borderAgent];
      __int16 v12 = [v11 discriminatorId];
      int v14 = 136316162;
      BOOL v15 = "-[THThreadNetworkCredentialsKeychainBackingStore retrievePreferredNetworkWithCompletion:]_block_invoke";
      __int16 v16 = 1024;
      int v17 = 1884;
      __int16 v18 = 2112;
      id v19 = v8;
      __int16 v20 = 2112;
      __int16 v21 = v10;
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s : %d - Returning record (name=%@, xpanid=%@, baid=%@)", (uint8_t *)&v14, 0x30u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __89__THThreadNetworkCredentialsKeychainBackingStore_retrievePreferredNetworkWithCompletion___block_invoke_cold_1();
    }

    id v13 = +[NSError storeError:9 description:@"No preferred network found"];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)retrievePreferredNetworkInternallyWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __99__THThreadNetworkCredentialsKeychainBackingStore_retrievePreferredNetworkInternallyWithCompletion___block_invoke;
  v7[3] = &unk_100499280;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __99__THThreadNetworkCredentialsKeychainBackingStore_retrievePreferredNetworkInternallyWithCompletion___block_invoke(uint64_t a1)
{
  id v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315394;
    BOOL v15 = "-[THThreadNetworkCredentialsKeychainBackingStore retrievePreferredNetworkInternallyWithCompletion:]_block_invoke";
    __int16 v16 = 1024;
    int v17 = 1894;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:%d:Request to fetch Preferred Network Active Dataset Record", (uint8_t *)&v14, 0x12u);
  }

  id v4 = [*(id *)(a1 + 32) getRecordForPreferredNetwork:1 anyDsFormat:0];
  uint64_t v5 = THCredentialsServerLogHandleForCategory(1);
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v7 = [v4 network];
      id v8 = [v7 networkName];
      int v9 = [v4 network];
      __int16 v10 = [v9 extendedPANID];
      unsigned __int8 v11 = [v4 borderAgent];
      __int16 v12 = [v11 discriminatorId];
      int v14 = 136316162;
      BOOL v15 = "-[THThreadNetworkCredentialsKeychainBackingStore retrievePreferredNetworkInternallyWithCompletion:]_block_invoke";
      __int16 v16 = 1024;
      int v17 = 1905;
      __int16 v18 = 2112;
      id v19 = v8;
      __int16 v20 = 2112;
      __int16 v21 = v10;
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s : %d - Returning record (name=%@, xpanid=%@, baid=%@)", (uint8_t *)&v14, 0x30u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __99__THThreadNetworkCredentialsKeychainBackingStore_retrievePreferredNetworkInternallyWithCompletion___block_invoke_cold_1();
    }

    id v13 = +[NSError storeError:9 description:@"No preferred network found"];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)retrievePreferredNetworkWithNoScanWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __99__THThreadNetworkCredentialsKeychainBackingStore_retrievePreferredNetworkWithNoScanWithCompletion___block_invoke;
  v7[3] = &unk_100499280;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __99__THThreadNetworkCredentialsKeychainBackingStore_retrievePreferredNetworkWithNoScanWithCompletion___block_invoke(uint64_t a1)
{
  id v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315394;
    BOOL v15 = "-[THThreadNetworkCredentialsKeychainBackingStore retrievePreferredNetworkWithNoScanWithCompletion:]_block_invoke";
    __int16 v16 = 1024;
    int v17 = 1915;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:%d:Request to fetch Preferred Network Active Dataset Record", (uint8_t *)&v14, 0x12u);
  }

  id v4 = [*(id *)(a1 + 32) getRecordForPreferredNetwork:0 anyDsFormat:0 skipScan:1];
  uint64_t v5 = THCredentialsServerLogHandleForCategory(1);
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v7 = [v4 network];
      id v8 = [v7 networkName];
      int v9 = [v4 network];
      __int16 v10 = [v9 extendedPANID];
      unsigned __int8 v11 = [v4 borderAgent];
      __int16 v12 = [v11 discriminatorId];
      int v14 = 136316162;
      BOOL v15 = "-[THThreadNetworkCredentialsKeychainBackingStore retrievePreferredNetworkWithNoScanWithCompletion:]_block_invoke";
      __int16 v16 = 1024;
      int v17 = 1926;
      __int16 v18 = 2112;
      id v19 = v8;
      __int16 v20 = 2112;
      __int16 v21 = v10;
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s : %d - Returning record (name=%@, xpanid=%@, baid=%@)", (uint8_t *)&v14, 0x30u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __99__THThreadNetworkCredentialsKeychainBackingStore_retrievePreferredNetworkWithNoScanWithCompletion___block_invoke_cold_1();
    }

    id v13 = +[NSError storeError:9 description:@"No preferred network found"];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (BOOL)storePreferredNetworkWithRecord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(THThreadNetworkCredentialsKeychainBackingStore *)self getNetworkSignature];
  if (v5)
  {
    id v6 = objc_alloc((Class)THThreadNetwork);
    id v7 = [v4 network];
    id v8 = [v7 networkName];
    int v9 = [v4 network];
    __int16 v10 = [v9 extendedPANID];
    unsigned __int8 v11 = [v6 initWithName:v8 extendedPANID:v10];

    if (!v11)
    {
      __int16 v16 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore storePreferredNetworkWithRecord:](v16, v33, v34, v35, v36, v37, v38, v39);
      }
      BOOL v17 = 0;
      goto LABEL_18;
    }
    __int16 v12 = [v4 borderAgent];
    id v13 = [(THThreadNetworkCredentialsKeychainBackingStore *)self getActiveDataSetRecord:v12];

    id v14 = objc_alloc((Class)THPreferredThreadNetwork);
    BOOL v15 = [v4 keychainAccessGroup];
    __int16 v16 = [v14 initWithThreadNetwork:v11 networkSignature:v5 credentialsDataSetRecord:v13 creationDate:0 lastModificationDate:0 userInfo:v15];

    BOOL v17 = v16 != 0;
    if (v16)
    {
      if (![(THThreadNetworkCredentialsKeychainBackingStore *)self storePreferred:v16])
      {
        BOOL v17 = 0;
        goto LABEL_17;
      }
      __int16 v18 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore storePreferredNetworkWithRecord:](v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }
    else
    {
      __int16 v18 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore storePreferredNetworkWithRecord:].cold.4(v18, v40, v41, v42, v43, v44, v45, v46);
      }
    }

LABEL_17:
LABEL_18:

    goto LABEL_19;
  }
  unsigned __int8 v11 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[THThreadNetworkCredentialsKeychainBackingStore storePreferredNetworkWithRecord:](v11, v26, v27, v28, v29, v30, v31, v32);
  }
  BOOL v17 = 0;
LABEL_19:

  return v17;
}

- (void)retrieveOrGeneratePreferredNetworkInternallyWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __109__THThreadNetworkCredentialsKeychainBackingStore_retrieveOrGeneratePreferredNetworkInternallyWithCompletion___block_invoke;
  v7[3] = &unk_100499280;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __109__THThreadNetworkCredentialsKeychainBackingStore_retrieveOrGeneratePreferredNetworkInternallyWithCompletion___block_invoke(uint64_t a1)
{
  id v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v28 = 136315394;
    uint64_t v29 = "-[THThreadNetworkCredentialsKeychainBackingStore retrieveOrGeneratePreferredNetworkInternallyWithCompletion:]_block_invoke";
    __int16 v30 = 1024;
    int v31 = 1973;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:%d:Request to fetch Preferred Network Active Dataset Record", (uint8_t *)&v28, 0x12u);
  }

  id v4 = [*(id *)(a1 + 32) getRecordForPreferredNetwork:0 anyDsFormat:0];
  uint64_t v5 = THCredentialsServerLogHandleForCategory(1);
  id v6 = v5;
  if (!v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __109__THThreadNetworkCredentialsKeychainBackingStore_retrieveOrGeneratePreferredNetworkInternallyWithCompletion___block_invoke_cold_2();
    }

    id v13 = +[NSError storeError:9 description:@"No preferred network found"];
    id v14 = [*(id *)(a1 + 32) generateCredentials];
    id v4 = v14;
    if (!v14)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_27:

      goto LABEL_28;
    }
    CFDictionaryRef v15 = [v14 keyChainItemRepresentationForActiveDataSetRecordAddOperation];
    CFDictionaryRef v16 = v15;
    if (v15)
    {
      OSStatus v17 = SecItemAdd(v15, 0);
      if (v17 == -25299)
      {
        __int16 v18 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          __109__THThreadNetworkCredentialsKeychainBackingStore_retrieveOrGeneratePreferredNetworkInternallyWithCompletion___block_invoke_cold_1();
        }

        CFDictionaryRef v19 = [v4 keyChainQueryForActiveDataSetRecordUpdateOperation];
        CFDictionaryRef v20 = [v4 keyChainItemRepresentationForActiveDataSetRecordUpdateOperation];
        OSStatus v17 = SecItemUpdate(v19, v20);
      }
      if (v17)
      {
        uint64_t v21 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          int v28 = 136315650;
          uint64_t v29 = "-[THThreadNetworkCredentialsKeychainBackingStore retrieveOrGeneratePreferredNetworkInternallyWithComplet"
                "ion:]_block_invoke";
          __int16 v30 = 1024;
          int v31 = 2010;
          __int16 v32 = 1024;
          LODWORD(v33) = v17;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s:%d Error while adding/updating the record : (err=%d)", (uint8_t *)&v28, 0x18u);
        }

        uint64_t v22 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v17 userInfo:0];
        uint64_t v23 = +[NSError storeError:2 underlyingError:v22 description:@"Error while adding/updating the record"];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        goto LABEL_25;
      }
      uint64_t v25 = *(void **)(a1 + 32);
      uint64_t v26 = [v4 borderAgent];
      uint64_t v22 = [v25 getActiveDataSetRecord:v26];

      if (([*(id *)(a1 + 32) storePreferredNetworkWithRecord:v22] & 1) == 0)
      {
        uint64_t v23 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:0 userInfo:0];
        uint64_t v27 = +[NSError storeError:2 underlyingError:v23 description:@"Error while adding preferred network entry"];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

LABEL_25:
        goto LABEL_26;
      }
      uint64_t v24 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else
    {
      uint64_t v22 = +[NSError storeError:4 description:@"Bad network parameter"];
      uint64_t v24 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    v24();
LABEL_26:

    goto LABEL_27;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v7 = [v4 network];
    id v8 = [v7 networkName];
    int v9 = [v4 network];
    __int16 v10 = [v9 extendedPANID];
    unsigned __int8 v11 = [v4 borderAgent];
    __int16 v12 = [v11 discriminatorId];
    int v28 = 136316162;
    uint64_t v29 = "-[THThreadNetworkCredentialsKeychainBackingStore retrieveOrGeneratePreferredNetworkInternallyWithCompletion:]_block_invoke";
    __int16 v30 = 1024;
    int v31 = 2029;
    __int16 v32 = 2112;
    uint64_t v33 = v8;
    __int16 v34 = 2112;
    uint64_t v35 = v10;
    __int16 v36 = 2112;
    uint64_t v37 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s : %d - Returning record (name=%@, xpanid=%@, baid=%@)", (uint8_t *)&v28, 0x30u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_28:
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
  uint64_t v22 = dispatch_get_global_queue(0, 0);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = __173__THThreadNetworkCredentialsKeychainBackingStore_addPreferredNetworkWithCompletionInternally_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion___block_invoke;
  v30[3] = &unk_100499568;
  id v31 = v17;
  id v32 = v18;
  id v33 = v19;
  id v34 = v20;
  id v35 = v16;
  __int16 v36 = self;
  id v37 = v15;
  id v38 = v21;
  id v23 = v15;
  id v24 = v16;
  id v25 = v21;
  id v26 = v20;
  id v27 = v19;
  id v28 = v18;
  id v29 = v17;
  dispatch_async(v22, v30);
}

void __173__THThreadNetworkCredentialsKeychainBackingStore_addPreferredNetworkWithCompletionInternally_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion___block_invoke(uint64_t a1)
{
  id v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v29 = 136315394;
    __int16 v30 = "-[THThreadNetworkCredentialsKeychainBackingStore addPreferredNetworkWithCompletionInternally:borderAgentID:ipV"
          "4NwSignature:ipv6NwSignature:wifiSSID:wifiPassword:completion:]_block_invoke";
    __int16 v31 = 1024;
    int v32 = 2040;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:%d:Request to add Preferred Network", (uint8_t *)&v29, 0x12u);
  }

  v42[0] = 0;
  v42[1] = 0;
  v41[0] = 0;
  v41[1] = 0;
  id v4 = +[NSUUID UUID];
  [v4 getUUIDBytes:v42];

  uint64_t v5 = +[NSUUID UUID];
  [v5 getUUIDBytes:v41];

  uint64_t v6 = (uint64_t)*(id *)(a1 + 32);
  uint64_t v7 = (uint64_t)*(id *)(a1 + 40);
  generatreRandomSSID();
  id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  generatreRandomPWD();
  int v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  __int16 v10 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    int v29 = 136316418;
    __int16 v30 = "-[THThreadNetworkCredentialsKeychainBackingStore addPreferredNetworkWithCompletionInternally:borderAgentID:ipV"
          "4NwSignature:ipv6NwSignature:wifiSSID:wifiPassword:completion:]_block_invoke";
    __int16 v31 = 1024;
    int v32 = 2054;
    __int16 v33 = 2112;
    uint64_t v34 = v11;
    __int16 v35 = 2112;
    uint64_t v36 = v12;
    __int16 v37 = 2112;
    id v38 = v8;
    __int16 v39 = 2112;
    uint64_t v40 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s:%d:Entered with signatures ipv4 : %@, ipv6 : %@, ssid : %@, pwd : %@", (uint8_t *)&v29, 0x3Au);
  }

  id v13 = *(__CFString **)(a1 + 48);
  if (!v13) {
    id v13 = &stru_1004A31D0;
  }
  id v14 = v13;

  id v15 = *(__CFString **)(a1 + 56);
  if (!v15) {
    id v15 = &stru_1004A31D0;
  }
  id v16 = v15;

  if (!(v6 | v7))
  {
    uint64_t v6 = +[NSData dataWithBytes:v42 length:16];
    uint64_t v17 = 16;
LABEL_15:
    uint64_t v7 = +[NSData dataWithBytes:v41 length:v17];
    goto LABEL_16;
  }
  if (!v7)
  {
    uint64_t v17 = 0;
    goto LABEL_15;
  }
  if (!v6)
  {
    uint64_t v6 = +[NSData dataWithBytes:v42 length:0];
  }
LABEL_16:
  id v18 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    int v29 = 136316418;
    __int16 v30 = "-[THThreadNetworkCredentialsKeychainBackingStore addPreferredNetworkWithCompletionInternally:borderAgentID:ipV"
          "4NwSignature:ipv6NwSignature:wifiSSID:wifiPassword:completion:]_block_invoke";
    __int16 v31 = 1024;
    int v32 = 2071;
    __int16 v33 = 2112;
    uint64_t v34 = v6;
    __int16 v35 = 2112;
    uint64_t v36 = v7;
    __int16 v37 = 2112;
    id v38 = v14;
    __int16 v39 = 2112;
    uint64_t v40 = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s:%d:Random signatures ipv4 : %@, ipv6 : %@, ssid : %@, pwd : %@", (uint8_t *)&v29, 0x3Au);
  }

  id v19 = [objc_alloc((Class)THNetworkSignature) initWithSignatures:v6 ipv6NwSignature:v7 wifSSID:v14 wifiPassword:v16];
  id v20 = THCredentialsServerLogHandleForCategory(1);
  id v21 = v20;
  if (v19)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = [v19 ipv4NwSignature];
      id v23 = [v19 ipv6NwSignature];
      int v29 = 136315906;
      __int16 v30 = "-[THThreadNetworkCredentialsKeychainBackingStore addPreferredNetworkWithCompletionInternally:borderAgentID:i"
            "pV4NwSignature:ipv6NwSignature:wifiSSID:wifiPassword:completion:]_block_invoke";
      __int16 v31 = 1024;
      int v32 = 2083;
      __int16 v33 = 2112;
      uint64_t v34 = (uint64_t)v22;
      __int16 v35 = 2112;
      uint64_t v36 = (uint64_t)v23;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s:%d:Calculated signatures ipv4 : %@, ipv6 : %@", (uint8_t *)&v29, 0x26u);
    }
    id v24 = *(void **)(a1 + 64);
    if (v24)
    {
      id v25 = [v24 discriminatorId];

      if (v25)
      {
        id v25 = [*(id *)(a1 + 72) getActiveDataSetRecord:*(void *)(a1 + 64)];
      }
    }
    else
    {
      id v25 = 0;
    }
    id v26 = [objc_alloc((Class)THPreferredThreadNetwork) initWithThreadNetwork:*(void *)(a1 + 80) networkSignature:v19 credentialsDataSetRecord:v25 creationDate:0 lastModificationDate:0 userInfo:@"0000000000"];
    if (v26)
    {
      if (*(void *)(a1 + 48) || *(void *)(a1 + 56))
      {
        if ([*(id *)(a1 + 72) storePreferred:v26])
        {
LABEL_32:
          (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
LABEL_38:

          goto LABEL_39;
        }
        id v27 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          __173__THThreadNetworkCredentialsKeychainBackingStore_addPreferredNetworkWithCompletionInternally_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion___block_invoke_cold_4();
        }
      }
      else
      {
        if ([*(id *)(a1 + 72) DBGstorePreferred:v26]) {
          goto LABEL_32;
        }
        id v27 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          __173__THThreadNetworkCredentialsKeychainBackingStore_addPreferredNetworkWithCompletionInternally_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion___block_invoke_cold_3();
        }
      }
    }
    else
    {
      id v27 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        __173__THThreadNetworkCredentialsKeychainBackingStore_addPreferredNetworkWithCompletionInternally_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion___block_invoke_cold_2();
      }
    }

    id v28 = +[NSError storeError:35 description:@"Unable to add preferred network"];
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();

    goto LABEL_38;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    __173__THThreadNetworkCredentialsKeychainBackingStore_addPreferredNetworkWithCompletionInternally_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion___block_invoke_cold_1();
  }

  id v25 = +[NSError storeError:35 description:@"Unable to add preferred network"];
  (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
LABEL_39:
}

- (void)deletePreferredNetworkForNetworkSignatureInternallyWithCompletion:(id)a3 ipv6NwSignature:(id)a4 wifiSSID:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = dispatch_get_global_queue(0, 0);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __152__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredNetworkForNetworkSignatureInternallyWithCompletion_ipv6NwSignature_wifiSSID_completion___block_invoke;
  v18[3] = &unk_100499488;
  id v19 = v9;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  id v17 = v9;
  dispatch_async(v13, v18);
}

void __152__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredNetworkForNetworkSignatureInternallyWithCompletion_ipv6NwSignature_wifiSSID_completion___block_invoke(uint64_t a1)
{
  id v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v31 = 136315394;
    int v32 = "-[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkForNetworkSignatureInternallyWithComple"
          "tion:ipv6NwSignature:wifiSSID:completion:]_block_invoke";
    __int16 v33 = 1024;
    *(_DWORD *)uint64_t v34 = 2130;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:%d:Request to delete Preferred Network for network signature", (uint8_t *)&v31, 0x12u);
  }

  v40[0] = 0;
  v40[1] = 0;
  v39[0] = 0;
  v39[1] = 0;
  id v4 = +[NSUUID UUID];
  [v4 getUUIDBytes:v40];

  uint64_t v5 = +[NSUUID UUID];
  [v5 getUUIDBytes:v39];

  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(a1 + 40);
    id v11 = *(__CFString **)(a1 + 48);
    int v31 = 136316162;
    int v32 = "-[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkForNetworkSignatureInternallyWithComple"
          "tion:ipv6NwSignature:wifiSSID:completion:]_block_invoke";
    __int16 v33 = 1024;
    *(_DWORD *)uint64_t v34 = 2141;
    *(_WORD *)&v34[4] = 2112;
    *(void *)&v34[6] = v9;
    __int16 v35 = 2112;
    id v36 = v10;
    __int16 v37 = 2112;
    id v38 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s:%d:Entered with signatures ipv4 : %@, ipv6 : %@, ssid : %@", (uint8_t *)&v31, 0x30u);
  }

  id v12 = *(__CFString **)(a1 + 48);
  if (!v12) {
    id v12 = &stru_1004A31D0;
  }
  id v13 = v12;
  if (v7)
  {
    if (v6) {
      goto LABEL_9;
    }
  }
  else
  {
    id v7 = +[NSData dataWithBytes:v39 length:0];
    if (v6) {
      goto LABEL_9;
    }
  }
  id v6 = +[NSData dataWithBytes:v40 length:0];
LABEL_9:
  id v14 = [objc_alloc((Class)THNetworkSignature) initWithSignatures:v6 ipv6NwSignature:v7 wifSSID:v13 wifiPassword:&stru_1004A31D0];
  id v15 = THCredentialsServerLogHandleForCategory(1);
  id v16 = v15;
  if (!v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v31 = 136316162;
      int v32 = "-[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkForNetworkSignatureInternallyWithComp"
            "letion:ipv6NwSignature:wifiSSID:completion:]_block_invoke";
      __int16 v33 = 1024;
      *(_DWORD *)uint64_t v34 = 2159;
      *(_WORD *)&v34[4] = 2112;
      *(void *)&v34[6] = v6;
      __int16 v35 = 2112;
      id v36 = v7;
      __int16 v37 = 2112;
      id v38 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s:%d:Error : Random signatures ipv4 : %@, ipv6 : %@, ssid : %@", (uint8_t *)&v31, 0x30u);
    }

    id v20 = +[NSError storeError:35 description:@"Unable to add preferred network"];
    id v28 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_28;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v17 = [v14 ipv4NwSignature];
    id v18 = [v14 ipv6NwSignature];
    int v31 = 136315906;
    int v32 = "-[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkForNetworkSignatureInternallyWithComple"
          "tion:ipv6NwSignature:wifiSSID:completion:]_block_invoke";
    __int16 v33 = 1024;
    *(_DWORD *)uint64_t v34 = 2166;
    *(_WORD *)&v34[4] = 2112;
    *(void *)&v34[6] = v17;
    __int16 v35 = 2112;
    id v36 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s:%d:Calculated signatures ipv4 : %@, ipv6 : %@", (uint8_t *)&v31, 0x26u);
  }
  CFDictionaryRef v19 = +[THPreferredThreadNetwork keyChainQueryForDeletePreferredNetworkRecordForNetworkSignature:v14];
  id v20 = v19;
  if (v19)
  {
    OSStatus v21 = SecItemDelete(v19);
    id v22 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = [v14 wifiSSID];
      int v31 = 136315650;
      int v32 = "-[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkForNetworkSignatureInternallyWithComp"
            "letion:ipv6NwSignature:wifiSSID:completion:]_block_invoke";
      __int16 v33 = 2112;
      *(void *)uint64_t v34 = v23;
      *(_WORD *)&v34[8] = 1024;
      *(_DWORD *)&v34[10] = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s: Preferred Network for network signature : %@, Deletion result :(err=%d)", (uint8_t *)&v31, 0x1Cu);
    }
    if (v21)
    {
      id v24 = (__CFString *)SecCopyErrorMessageString(v21, 0);
      id v25 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        __152__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredNetworkForNetworkSignatureInternallyWithCompletion_ipv6NwSignature_wifiSSID_completion___block_invoke_cold_2();
      }

      id v26 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v21 userInfo:0];
      id v27 = +[NSError storeError:11 underlyingError:v26 description:v24];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

      goto LABEL_29;
    }
    id v28 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_28:
    v28();
    goto LABEL_29;
  }
  int v29 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    __152__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredNetworkForNetworkSignatureInternallyWithCompletion_ipv6NwSignature_wifiSSID_completion___block_invoke_cold_1();
  }

  __int16 v30 = +[NSError storeError:16 description:@"Failed to create query to delete preferred network for networksignature"];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

LABEL_29:
}

- (void)deletePreferredNetworkWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __87__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredNetworkWithCompletion___block_invoke;
  v7[3] = &unk_100499590;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __87__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredNetworkWithCompletion___block_invoke(uint64_t a1)
{
  id v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to DELETE Preferred Network", buf, 2u);
  }

  id v4 = &exit_ptr;
  uint64_t v5 = +[THPreferredThreadNetwork keyChainQueryForFetchPreferredNetworkRecordsOperation];
  if (!v5)
  {
    uint64_t v34 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      __87__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredNetworkWithCompletion___block_invoke_cold_1();
    }

    id v8 = +[NSError storeError:16 description:@"Failed to create query to fetch preferred networks"];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_43;
  }
  id v6 = *(void **)(a1 + 32);
  id v51 = 0;
  id v7 = [v6 _doFetchPreferredNetworks:v5 error:&v51];
  id v8 = v51;
  uint64_t v9 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    __87__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredNetworkWithCompletion___block_invoke_cold_6(v7);
  }

  if (![v7 count])
  {
    __int16 v35 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      __87__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredNetworkWithCompletion___block_invoke_cold_2();
    }

    goto LABEL_30;
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v7;
  id v10 = [obj countByEnumeratingWithState:&v47 objects:v58 count:16];
  if (!v10) {
    goto LABEL_23;
  }
  id v11 = v10;
  uint64_t v12 = *(void *)v48;
  uint64_t v42 = v5;
  uint64_t v43 = v2;
  id v41 = v8;
  uint64_t v44 = v7;
  while (2)
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v48 != v12) {
        objc_enumerationMutation(obj);
      }
      id v14 = *(void **)(*((void *)&v47 + 1) + 8 * i);
      id v15 = objc_msgSend(v14, "credentialsDataSetRecord", v41, v42, v43);

      if (v15)
      {
        id v16 = objc_alloc((Class)THFrozenThreadNetwork);
        id v17 = [v14 credentialsDataSetRecord];
        id v18 = [v17 credentialsDataSet];
        id v19 = [v16 initWithCredentialsDataSet:v18 creationDate:0 lastModificationDate:0];

        [*(id *)(a1 + 32) storeFrozenThreadNetwork:v19];
      }
      CFDictionaryRef v20 = [v4[331] keyChainQueryForDeletePreferredNetworkRecord:v14];
      CFDictionaryRef v21 = v20;
      if (!v20)
      {
        id v36 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          __87__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredNetworkWithCompletion___block_invoke_cold_3();
        }

        int v31 = +[NSError storeError:16 description:@"Failed to create query to delete preferred networks"];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        goto LABEL_41;
      }
      OSStatus v22 = SecItemDelete(v20);
      id v23 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = [v14 network];
        [v24 networkName];
        CFDictionaryRef v46 = v21;
        id v25 = v11;
        uint64_t v26 = v12;
        uint64_t v27 = a1;
        int v29 = v28 = v4;
        *(_DWORD *)buf = 136315650;
        long long v53 = "-[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkWithCompletion:]_block_invoke";
        __int16 v54 = 2112;
        id v55 = v29;
        __int16 v56 = 1024;
        OSStatus v57 = v22;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s: Preferred Network : %@, Deletion result :(err=%d)", buf, 0x1Cu);

        id v4 = v28;
        a1 = v27;
        uint64_t v12 = v26;
        id v11 = v25;
        CFDictionaryRef v21 = v46;
      }
      if (v22)
      {
        int v31 = (void *)SecCopyErrorMessageString(v22, 0);
        __int16 v37 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          __152__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredNetworkForNetworkSignatureInternallyWithCompletion_ipv6NwSignature_wifiSSID_completion___block_invoke_cold_2();
        }

        id v38 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v22 userInfo:0];
        __int16 v39 = +[NSError storeError:11 underlyingError:v38 description:v31];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

LABEL_40:
LABEL_41:
        uint64_t v5 = v42;
        id v2 = v43;
        id v8 = v41;

        id v7 = v44;
        goto LABEL_42;
      }
      __int16 v30 = [v14 network];
      int v31 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForDeleteAllActiveDataSetOperationForThreadNetwork:v30];

      OSStatus v32 = SecItemDelete((CFDictionaryRef)v31);
      __int16 v33 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        long long v53 = "-[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkWithCompletion:]_block_invoke";
        __int16 v54 = 1024;
        LODWORD(v55) = v32;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "%s: GOT: (err=%d)", buf, 0x12u);
      }

      if (v32)
      {
        uint64_t v40 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          __87__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredNetworkWithCompletion___block_invoke_cold_4(v14);
        }

        id v38 = +[NSError storeError:32 description:@"Failed to delete credentials records for frozen preferred network"];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        goto LABEL_40;
      }
    }
    id v11 = [obj countByEnumeratingWithState:&v47 objects:v58 count:16];
    uint64_t v5 = v42;
    id v2 = v43;
    id v8 = v41;
    id v7 = v44;
    if (v11) {
      continue;
    }
    break;
  }
LABEL_23:

LABEL_30:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_42:

LABEL_43:
}

- (void)deletePreferredNetworkEntryWithCompletion:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = dispatch_get_global_queue(0, 0);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __103__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredNetworkEntryWithCompletion_completion___block_invoke;
  v10[3] = &unk_100499280;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __103__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredNetworkEntryWithCompletion_completion___block_invoke(uint64_t a1)
{
  id v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to DELETE Preferred Network Entry", (uint8_t *)&v16, 2u);
  }

  CFDictionaryRef v4 = +[THPreferredThreadNetwork keyChainQueryForDeletePreferredNetworkRecord:*(void *)(a1 + 32)];
  CFDictionaryRef v5 = v4;
  if (v4)
  {
    OSStatus v6 = SecItemDelete(v4);
    id v7 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 32) network];
      id v9 = [v8 networkName];
      int v16 = 136315650;
      id v17 = "-[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkEntryWithCompletion:completion:]_block_invoke";
      __int16 v18 = 2112;
      id v19 = v9;
      __int16 v20 = 1024;
      OSStatus v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Preferred Network : %@, Deletion result :(err=%d)", (uint8_t *)&v16, 0x1Cu);
    }
    if (v6)
    {
      id v10 = (__CFString *)SecCopyErrorMessageString(v6, 0);
      id v11 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __152__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredNetworkForNetworkSignatureInternallyWithCompletion_ipv6NwSignature_wifiSSID_completion___block_invoke_cold_2();
      }

      id v12 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v6 userInfo:0];
      id v13 = +[NSError storeError:11 underlyingError:v12 description:v10];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    id v14 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __103__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredNetworkEntryWithCompletion_completion___block_invoke_cold_1();
    }

    id v15 = +[NSError storeError:16 description:@"Failed to create query to delete preferred network entry"];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)deletePreferredAndFrozenThreadNetworksWithCompletion:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __103__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredAndFrozenThreadNetworksWithCompletion___block_invoke;
  v7[3] = &unk_100499590;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __103__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredAndFrozenThreadNetworksWithCompletion___block_invoke(uint64_t a1)
{
  id v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v24 = 136315394;
    id v25 = "-[THThreadNetworkCredentialsKeychainBackingStore deletePreferredAndFrozenThreadNetworksWithCompletion:]_block_invoke";
    __int16 v26 = 1024;
    int v27 = 2311;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:%d: Request to DELETE all preferred and frozen networks", (uint8_t *)&v24, 0x12u);
  }

  CFDictionaryRef v4 = +[THPreferredThreadNetwork keyChainQueryForDeleteAllPreferredNetworks];
  CFDictionaryRef v5 = v4;
  if (!v4)
  {
    id v17 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __103__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredAndFrozenThreadNetworksWithCompletion___block_invoke_cold_1();
    }

    id v10 = +[NSError storeError:16 description:@"Failed to create query to fetch preferred networks"];
    int v16 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_25;
  }
  OSStatus v6 = SecItemDelete(v4);
  if (v6)
  {
    OSStatus v7 = v6;
    if (v6 != -25300)
    {
      id v10 = (void *)SecCopyErrorMessageString(v6, 0);
      __int16 v18 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __103__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredAndFrozenThreadNetworksWithCompletion___block_invoke_cold_2();
      }

      id v19 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v7 userInfo:0];
      __int16 v20 = +[NSError storeError:32 underlyingError:v19 description:v10];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_35:

LABEL_36:
      goto LABEL_37;
    }
    id v8 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __103__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredAndFrozenThreadNetworksWithCompletion___block_invoke_cold_7();
    }
  }
  CFDictionaryRef v9 = +[THFrozenThreadNetwork keyChainQueryForDeleteFrozenThreadNetworkRecordsOperation];
  id v10 = v9;
  if (!v9)
  {
    OSStatus v21 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      __103__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredAndFrozenThreadNetworksWithCompletion___block_invoke_cold_3();
    }

    id v19 = +[NSError storeError:34 description:@"Failed to create query to fetch frozen thread networks"];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_36;
  }
  OSStatus v11 = SecItemDelete(v9);
  if (v11)
  {
    OSStatus v12 = v11;
    if (v11 == -25300)
    {
      id v13 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __103__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredAndFrozenThreadNetworksWithCompletion___block_invoke_cold_6();
      }

      goto LABEL_15;
    }
    id v19 = (void *)SecCopyErrorMessageString(v11, 0);
    OSStatus v22 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      __103__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredAndFrozenThreadNetworksWithCompletion___block_invoke_cold_4();
    }

    __int16 v20 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v12 userInfo:0];
    id v23 = +[NSError storeError:33 underlyingError:v20 description:v19];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    goto LABEL_35;
  }
LABEL_15:
  if (([*(id *)(a1 + 32) deleteAllRecordsForKeychainAccessGroup:@"0000000000"] & 1) == 0)
  {
    id v14 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __103__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredAndFrozenThreadNetworksWithCompletion___block_invoke_cold_5();
    }
  }
  id v15 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v24 = 136315394;
    id v25 = "-[THThreadNetworkCredentialsKeychainBackingStore deletePreferredAndFrozenThreadNetworksWithCompletion:]_block_invoke";
    __int16 v26 = 1024;
    int v27 = 2378;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s:%d: Deleted all preferred and frozen networks !", (uint8_t *)&v24, 0x12u);
  }

  int v16 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_25:
  v16();
LABEL_37:
}

- (void)updatePreferredNetworkInternallyWithCompletion:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __97__THThreadNetworkCredentialsKeychainBackingStore_updatePreferredNetworkInternallyWithCompletion___block_invoke;
  v7[3] = &unk_100499590;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __97__THThreadNetworkCredentialsKeychainBackingStore_updatePreferredNetworkInternallyWithCompletion___block_invoke(uint64_t a1)
{
  id v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    CFDictionaryRef v5 = "-[THThreadNetworkCredentialsKeychainBackingStore updatePreferredNetworkInternallyWithCompletion:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 2387;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:%d:Request to update Preferred Network", (uint8_t *)&v4, 0x12u);
  }

  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [*(id *)(a1 + 32) updatePreferredNetwork]);
}

- (id)getOneRecordForNetwork:(id)a3
{
  int v4 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryFetchForOneActiveDataSetOperationForThreadNetwork:a3];
  if (!v4)
  {
    CFDictionaryRef v5 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore getOneRecordForNetwork:]();
    }
  }
  uint64_t v11 = 0;
  __int16 v6 = [(THThreadNetworkCredentialsKeychainBackingStore *)self _doFetchOneActiveDataSetRecords:v4 error:&v11];
  int v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    CFDictionaryRef v9 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore getOneRecordForNetwork:]();
    }
  }

  return v7;
}

- (id)getNumberOfRecordsForKeychainAccessGroup:(id)a3 count:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  int v7 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryFetchForNumberOfActiveDataSetOperationForKeychainAccessGroup:v6 count:v4];
  if (!v7)
  {
    id v8 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore getNumberOfRecordsForKeychainAccessGroup:count:]();
    }
  }
  uint64_t v14 = 0;
  CFDictionaryRef v9 = [(THThreadNetworkCredentialsKeychainBackingStore *)self _doFetchActiveDataSetRecords:v7 error:&v14];
  id v10 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = [v9 count];
    *(_DWORD *)buf = 136315906;
    int v16 = "-[THThreadNetworkCredentialsKeychainBackingStore getNumberOfRecordsForKeychainAccessGroup:count:]";
    __int16 v17 = 1024;
    int v18 = 2427;
    __int16 v19 = 1024;
    int v20 = v4;
    __int16 v21 = 2048;
    id v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s:%d: Fetched Active dataset records for the count : %d, size of the recods is: %lu", buf, 0x22u);
  }

  if (v9 && [v9 count]) {
    id v12 = v9;
  }
  else {
    id v12 = 0;
  }

  return v12;
}

- (BOOL)deleteAllRecordsForKeychainAccessGroup:(id)a3
{
  CFDictionaryRef v3 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForDeleteAllActiveDataSetOperationWithKeychainAccessGroup:a3];
  CFDictionaryRef v4 = v3;
  if (v3)
  {
    OSStatus v5 = SecItemDelete(v3);
    id v6 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315650;
      id v11 = "-[THThreadNetworkCredentialsKeychainBackingStore deleteAllRecordsForKeychainAccessGroup:]";
      __int16 v12 = 1024;
      int v13 = 2446;
      __int16 v14 = 1024;
      OSStatus v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s:%d: Deleting all records for com.apple.thread.dataset, Deletion result :(err=%d)", (uint8_t *)&v10, 0x18u);
    }

    if (!v5)
    {
      BOOL v8 = 1;
      goto LABEL_11;
    }
    int v7 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore deleteAllRecordsForKeychainAccessGroup:]();
    }
  }
  else
  {
    int v7 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore deleteAllRecordsForKeychainAccessGroup:]();
    }
  }

  BOOL v8 = 0;
LABEL_11:

  return v8;
}

- (BOOL)checkIfActiveDatasetRecordIsPresentInTheGivenList:(id)a3 Missinglist:(id)a4 record:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v8;
  id v11 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v11)
  {
    id v12 = v11;
    int v29 = self;
    __int16 v30 = v9;
    uint64_t v13 = *(void *)v37;
    uint64_t v32 = *(void *)v37;
    while (2)
    {
      __int16 v14 = 0;
      id v33 = v12;
      do
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(obj);
        }
        OSStatus v15 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v14);
        int v16 = [v15 borderAgent];
        __int16 v17 = [v16 discriminatorId];
        int v18 = [v10 borderAgent];
        __int16 v19 = [v18 discriminatorId];
        if ([v17 isEqualToData:v19])
        {
          [v15 credentialsDataSet];
          v20 = int v31 = v15;
          __int16 v21 = [v20 dataSetArray];
          id v22 = [v10 credentialsDataSet];
          [v22 dataSetArray];
          v24 = id v23 = v10;
          unsigned int v35 = [v21 isEqualToData:v24];

          id v10 = v23;
          id v12 = v33;

          uint64_t v13 = v32;
          if (v35)
          {
            __int16 v26 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
              -[THThreadNetworkCredentialsKeychainBackingStore checkIfActiveDatasetRecordIsPresentInTheGivenList:Missinglist:record:](v10, v31, v26);
            }

            [(THThreadNetworkCredentialsKeychainBackingStore *)v29 thDumpActiveDatasetRecord:v10];
            [(THThreadNetworkCredentialsKeychainBackingStore *)v29 thDumpActiveDatasetRecord:v31];
            id v9 = v30;
            [v30 removeObject:v31];
            BOOL v25 = 1;
            goto LABEL_17;
          }
        }
        else
        {
        }
        __int16 v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v12) {
        continue;
      }
      break;
    }
    BOOL v25 = 0;
    id v9 = v30;
  }
  else
  {
    BOOL v25 = 0;
  }
LABEL_17:

  return v25;
}

- (void)thDumpActiveDatasetRecord:(id)a3
{
  id v3 = a3;
  CFDictionaryRef v4 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[THThreadNetworkCredentialsKeychainBackingStore thDumpActiveDatasetRecord:]6();
  }

  OSStatus v5 = [v3 uniqueIdentifier];

  if (v5)
  {
    id v6 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore thDumpActiveDatasetRecord:]5(v3);
    }
  }
  int v7 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[THThreadNetworkCredentialsKeychainBackingStore thDumpActiveDatasetRecord:]4(v3);
  }

  id v8 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[THThreadNetworkCredentialsKeychainBackingStore thDumpActiveDatasetRecord:]3(v3);
  }

  id v9 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[THThreadNetworkCredentialsKeychainBackingStore thDumpActiveDatasetRecord:]2(v3);
  }

  id v10 = [v3 credentials];
  id v11 = [v10 PANID];

  if (v11)
  {
    id v12 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore thDumpActiveDatasetRecord:]1(v3);
    }
  }
  uint64_t v13 = [v3 credentials];
  __int16 v14 = [v13 masterKey];

  if (v14)
  {
    OSStatus v15 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore thDumpActiveDatasetRecord:]0(v3);
    }
  }
  int v16 = [v3 credentials];
  __int16 v17 = [v16 PSKc];

  if (v17)
  {
    int v18 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore thDumpActiveDatasetRecord:].cold.9(v3);
    }
  }
  __int16 v19 = [v3 credentials];
  int v20 = [v19 passPhrase];

  if (v20)
  {
    __int16 v21 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore thDumpActiveDatasetRecord:].cold.8(v3);
    }
  }
  id v22 = [v3 credentials];
  unsigned int v23 = [v22 channel];
  int v24 = kTHNetworkChannel_None;

  if (v23 != v24)
  {
    BOOL v25 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore thDumpActiveDatasetRecord:].cold.7(v3);
    }
  }
  __int16 v26 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    -[THThreadNetworkCredentialsKeychainBackingStore thDumpActiveDatasetRecord:].cold.6(v3);
  }

  int v27 = [v3 credentials];
  id v28 = [v27 userInfo];

  if (v28)
  {
    int v29 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore thDumpActiveDatasetRecord:].cold.5(v3);
    }
  }
  __int16 v30 = [v3 keychainAccessGroup];

  if (v30)
  {
    int v31 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore thDumpActiveDatasetRecord:].cold.4(v3);
    }
  }
  uint64_t v32 = [v3 creationDate];

  if (v32)
  {
    id v33 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore thDumpActiveDatasetRecord:](v3);
    }
  }
  uint64_t v34 = [v3 lastModificationDate];

  if (v34)
  {
    unsigned int v35 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore thDumpActiveDatasetRecord:](v3);
    }
  }
  long long v36 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
    -[THThreadNetworkCredentialsKeychainBackingStore thDumpActiveDatasetRecord:]();
  }
}

- (id)getTheKeyFromPreferredNetworkEntry:(id)a3
{
  id v3 = a3;
  CFDictionaryRef v4 = [v3 networkSignature];
  uint64_t v5 = [v4 wifiPassword];
  if (v5)
  {
    id v6 = (void *)v5;
    int v7 = [v3 networkSignature];
    id v8 = [v7 wifiPassword];
    id v9 = [v8 length];

    if (v9)
    {
      id v10 = [v3 networkSignature];
      id v11 = [v10 wifiPassword];
      unsigned __int8 v12 = [v11 isEqualToString:@"ApplePreferredNetworkRecordLabel"];

      uint64_t v13 = [v3 networkSignature];
      __int16 v14 = v13;
      if (v12) {
        [v13 wifiSSID];
      }
      else {
      int v18 = [v13 wifiPassword];
      }
      goto LABEL_9;
    }
  }
  else
  {
  }
  __int16 v14 = [v3 network];
  OSStatus v15 = [v14 networkName];
  int v16 = [v3 network];
  __int16 v17 = [v16 extendedPANID];
  int v18 = +[NSString stringWithFormat:@"%@%@", v15, v17];

LABEL_9:

  return v18;
}

- (id)checkIfPrefItemPresentInTheCleanupList:(id)a3 cleanupList:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = v6;
  if (!v5)
  {
    id v30 = 0;
    goto LABEL_30;
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (!v8)
  {
    id v30 = 0;
    goto LABEL_29;
  }
  id v9 = v8;
  uint64_t v32 = v7;
  uint64_t v10 = *(void *)v55;
  long long v53 = v5;
  uint64_t v50 = *(void *)v55;
  while (2)
  {
    id v11 = 0;
    id v51 = v9;
    do
    {
      if (*(void *)v55 != v10) {
        objc_enumerationMutation(obj);
      }
      unsigned __int8 v12 = *(void **)(*((void *)&v54 + 1) + 8 * (void)v11);
      if (v12)
      {
        uint64_t v13 = [*(id *)(*((void *)&v54 + 1) + 8 * (void)v11) network];
        __int16 v14 = [v13 networkName];
        OSStatus v15 = [v5 network];
        int v16 = [v15 networkName];
        if (![v14 isEqualToString:v16]) {
          goto LABEL_15;
        }
        __int16 v17 = [v12 network];
        int v18 = [v17 extendedPANID];
        __int16 v19 = [v5 network];
        int v20 = [v19 extendedPANID];
        if (![v18 isEqualToData:v20])
        {

          id v5 = v53;
          uint64_t v10 = v50;
          id v9 = v51;
LABEL_15:

          goto LABEL_22;
        }
        long long v47 = v13;
        uint64_t v44 = v20;
        __int16 v21 = v17;
        long long v49 = [v12 networkSignature];
        id v22 = [v49 ipv4NwSignature];
        CFDictionaryRef v46 = [v53 networkSignature];
        [v46 ipv4NwSignature];
        v45 = long long v48 = v22;
        if (objc_msgSend(v22, "isEqualToData:"))
        {
          uint64_t v40 = [v12 networkSignature];
          unsigned int v23 = [v40 ipv6NwSignature];
          id v41 = [v53 networkSignature];
          int v24 = [v41 ipv6NwSignature];
          uint64_t v42 = v23;
          if ([v23 isEqualToData:v24])
          {
            long long v39 = [v12 networkSignature];
            BOOL v25 = [v39 wifiSSID];
            long long v37 = [v53 networkSignature];
            [v37 wifiSSID];
            long long v36 = v38 = v25;
            if (objc_msgSend(v25, "isEqualToString:"))
            {
              unsigned int v35 = [v12 networkSignature];
              id v33 = [v35 wifiPassword];
              uint64_t v34 = [v53 networkSignature];
              __int16 v26 = [v34 wifiPassword];
              unsigned __int8 v43 = objc_msgSend(v33, "isEqualToString:");
            }
            else
            {
              unsigned __int8 v43 = 0;
            }
            int v29 = v40;
          }
          else
          {
            unsigned __int8 v43 = 0;
            int v29 = v40;
          }

          id v28 = v47;
          int v27 = v44;
        }
        else
        {
          unsigned __int8 v43 = 0;
          int v27 = v44;
          id v28 = v47;
        }

        id v5 = v53;
        uint64_t v10 = v50;
        id v9 = v51;
        if (v43)
        {
          id v30 = v12;
          goto LABEL_27;
        }
      }
LABEL_22:
      id v11 = (char *)v11 + 1;
    }
    while (v9 != v11);
    id v9 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v9) {
      continue;
    }
    break;
  }
  id v30 = 0;
LABEL_27:
  int v7 = v32;
LABEL_29:

LABEL_30:

  return v30;
}

- (void)sendCAMetricsForCleanUpRecordInfo:(cleanUpStats *)a3
{
  CFDictionaryRef v4 = +[NSMutableDictionary dictionary];
  id v5 = +[NSNumber numberWithUnsignedLongLong:a3->var0];
  [v4 setObject:v5 forKey:@"number_of_first_party_BR_records_count"];

  id v6 = +[NSNumber numberWithUnsignedLongLong:a3->var2];
  [v4 setObject:v6 forKey:@"number_of_first_party_BR_records_updated_count"];

  int v7 = +[NSNumber numberWithUnsignedLongLong:a3->var1];
  [v4 setObject:v7 forKey:@"number_of_first_party_BR_records_cleaned_up_count"];

  id v8 = +[NSNumber numberWithUnsignedLongLong:a3->var3];
  [v4 setObject:v8 forKey:@"number_of_pref_nw_records_count"];

  id v9 = +[NSNumber numberWithUnsignedLongLong:a3->var5];
  [v4 setObject:v9 forKey:@"number_of_pref_nw_records_updated_count"];

  uint64_t v10 = +[NSNumber numberWithUnsignedLongLong:a3->var4];
  [v4 setObject:v10 forKey:@"number_of_pref_nw_records_cleaned_up_count"];

  id v11 = +[NSNumber numberWithUnsignedLongLong:a3->var6];
  [v4 setObject:v11 forKey:@"number_of_third_party_BR_records_count"];

  uint64_t v13 = v4;
  id v12 = v4;
  AnalyticsSendEventLazy();
}

id __84__THThreadNetworkCredentialsKeychainBackingStore_sendCAMetricsForCleanUpRecordInfo___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)cleanThreadKeychainDatabase:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __78__THThreadNetworkCredentialsKeychainBackingStore_cleanThreadKeychainDatabase___block_invoke;
  v7[3] = &unk_100499590;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __78__THThreadNetworkCredentialsKeychainBackingStore_cleanThreadKeychainDatabase___block_invoke(uint64_t a1)
{
  uint64_t v386 = 0;
  long long v384 = 0u;
  long long v385 = 0u;
  long long v383 = 0u;
  id v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __78__THThreadNetworkCredentialsKeychainBackingStore_cleanThreadKeychainDatabase___block_invoke_cold_12();
  }

  CFDictionaryRef v4 = +[THThreadNetworkCredentialsStoreRecord keyChainQueryForDeleteAllCredentialsRecord];
  CFDictionaryRef v267 = v4;
  if (!v4)
  {
    v234 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v234, OS_LOG_TYPE_ERROR)) {
      __78__THThreadNetworkCredentialsKeychainBackingStore_cleanThreadKeychainDatabase___block_invoke_cold_1();
    }

    v235 = +[NSError storeError:36 description:@"Failed to create query to delete all com.apple.thread.network records"];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_270;
  }
  v266 = v2;
  OSStatus v5 = SecItemDelete(v4);
  id v6 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __78__THThreadNetworkCredentialsKeychainBackingStore_cleanThreadKeychainDatabase___block_invoke_cold_11();
  }

  if (v5)
  {
    int v7 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __78__THThreadNetworkCredentialsKeychainBackingStore_cleanThreadKeychainDatabase___block_invoke_cold_10();
    }
  }
  id v341 = objc_alloc_init((Class)NSMutableDictionary);
  id v8 = &exit_ptr;
  id v299 = objc_alloc_init((Class)NSMutableArray);
  id v344 = objc_alloc_init((Class)NSMutableArray);
  id v291 = objc_alloc_init((Class)NSMutableArray);
  id v343 = objc_alloc_init((Class)NSMutableDictionary);
  id v342 = objc_alloc_init((Class)NSMutableArray);
  id v9 = [*(id *)(a1 + 32) getNumberOfPrefEntriesForTheCount:200];
  uint64_t v10 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
    __int16 v394 = 1024;
    int v395 = 2712;
    __int16 v396 = 2048;
    id v397 = [v9 count];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s:%d: Before 1st Pass, size of preferred networks (prefNwRecords) : %lu", buf, 0x1Cu);
  }

  id v11 = [v9 count];
  *((void *)&v384 + 1) = v11;
  uint64_t v386 = 0;
  uint64_t v345 = a1;
  if (v9 && [v9 count])
  {
    long long v381 = 0u;
    long long v382 = 0u;
    long long v379 = 0u;
    long long v380 = 0u;
    id obj = v9;
    id v12 = [obj countByEnumeratingWithState:&v379 objects:v411 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v380;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v380 != v14) {
            objc_enumerationMutation(obj);
          }
          int v16 = *(void **)(*((void *)&v379 + 1) + 8 * i);
          __int16 v17 = [*(id *)(v345 + 32) getTheKeyFromPreferredNetworkEntry:v16];
          int v18 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            __int16 v19 = [v16 network];
            int v20 = [v19 networkName];
            __int16 v21 = [v16 network];
            id v22 = [v21 extendedPANID];
            *(_DWORD *)buf = 136316162;
            v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
            __int16 v394 = 1024;
            int v395 = 2732;
            __int16 v396 = 2112;
            id v397 = v20;
            __int16 v398 = 2112;
            id v399 = v22;
            __int16 v400 = 2112;
            CFStringRef v401 = v17;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s:%d: item : (name : %@ | xpanid : %@), key : %@", buf, 0x30u);
          }
          unsigned int v23 = [v341 objectForKeyedSubscript:v17];
          if (v23)
          {
            int v24 = [v16 lastModificationDate];
            BOOL v25 = [v23 lastModificationDate];
            id v26 = [v24 compare:v25];

            if (v26 == (id)1)
            {
              [v341 setObject:v16 forKey:v17];
              int v27 = v344;
              id v28 = v23;
            }
            else
            {
              int v27 = v344;
              id v28 = v16;
            }
            [v27 addObject:v28];
          }
          else
          {
            [v341 setObject:v16 forKey:v17];
          }
        }
        id v13 = [obj countByEnumeratingWithState:&v379 objects:v411 count:16];
      }
      while (v13);
    }

    int v29 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      id v30 = [v344 count];
      *(_DWORD *)buf = 136315650;
      v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
      __int16 v394 = 1024;
      int v395 = 2756;
      __int16 v396 = 2048;
      id v397 = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%s:%d: End of 1st pass, size of cleanUpPreferredList : %lu ", buf, 0x1Cu);
    }

    int v31 = [v341 allValues];
    uint64_t v32 = +[NSMutableArray arrayWithArray:v31];

    id v33 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      id v34 = [v32 count];
      *(_DWORD *)buf = 136315650;
      v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
      __int16 v394 = 1024;
      int v395 = 2759;
      __int16 v396 = 2048;
      id v397 = v34;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "%s:%d: Before 2nd pass, size of keepPreferredList : %lu ", buf, 0x1Cu);
    }

    [v341 removeAllObjects];
    long long v377 = 0u;
    long long v378 = 0u;
    long long v375 = 0u;
    long long v376 = 0u;
    id v35 = v32;
    id v292 = v35;
    id obja = [v35 countByEnumeratingWithState:&v375 objects:v410 count:16];
    if (obja)
    {
      uint64_t v316 = *(void *)v376;
      uint64_t v272 = 136316418;
      do
      {
        for (j = 0; j != obja; j = (char *)j + 1)
        {
          if (*(void *)v376 != v316) {
            objc_enumerationMutation(v292);
          }
          long long v37 = *(void **)(*((void *)&v375 + 1) + 8 * (void)j);
          long long v38 = [v37 networkSignature];
          long long v39 = [v38 wifiPassword];
          if ([v39 isEqualToString:@"ApplePreferredNetworkRecordLabel"])
          {
          }
          else
          {
            uint64_t v40 = [v37 networkSignature];
            id v41 = [v40 wifiPassword];
            id v42 = [v41 length];

            if (v42)
            {
              [v344 addObject:v37];
              [v299 addObject:v37];
              [*(id *)(v345 + 32) dumpPreferredNetwork:v37];
              unsigned __int8 v43 = THCredentialsServerLogHandleForCategory(1);
              if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
                goto LABEL_74;
              }
              v324 = [v37 networkSignature];
              uint64_t v44 = [v324 ipv4NwSignature];
              uint64_t v45 = [v37 networkSignature];
              CFDictionaryRef v46 = [v45 ipv6NwSignature];
              long long v47 = [v37 networkSignature];
              long long v48 = [v47 wifiSSID];
              CFStringRef v49 = &stru_1004A31D0;
              if (v48)
              {
                v271 = [v37 networkSignature];
                CFStringRef v49 = [v271 wifiSSID];
                v270 = (__CFString *)v49;
              }
              uint64_t v50 = [v37 networkSignature];
              id v51 = [v50 wifiPassword];
              *(_DWORD *)buf = 136316418;
              v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
              __int16 v394 = 1024;
              int v395 = 2811;
              __int16 v396 = 2112;
              id v397 = v44;
              __int16 v398 = 2112;
              id v399 = v46;
              __int16 v400 = 2112;
              CFStringRef v401 = v49;
              __int16 v402 = 2112;
              id v403 = v51;
              _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%s:%d Label is not equal to constant - ApplePreferredNetworkRecordLabel : ipv4 signature : %@, ipv6 signature : %@ , ssid : %@, pwd : %@", buf, 0x3Au);

              if (!v48) {
                goto LABEL_68;
              }

              BOOL v52 = v271;
              goto LABEL_67;
            }
          }
          long long v53 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
          {
            long long v54 = [v37 network];
            v325 = [v54 networkName];
            long long v55 = [v37 network];
            long long v56 = [v55 extendedPANID];
            long long v57 = [v37 networkSignature];
            uint64_t v58 = [v57 wifiSSID];
            id v307 = v54;
            v300 = v55;
            if (v58)
            {
              v280 = [v37 networkSignature];
              CFStringRef v59 = [v280 wifiSSID];
              v275 = (__CFString *)v59;
            }
            else
            {
              CFStringRef v59 = &stru_1004A31D0;
            }
            __int16 v60 = [v37 credentialsDataSetRecord];
            int v61 = [v37 networkSignature];
            uint64_t v62 = [v61 wifiPassword];
            if (v62)
            {
              v285 = [v37 networkSignature];
              v277 = [v285 wifiPassword];
              CFStringRef v63 = v277;
            }
            else
            {
              CFStringRef v63 = @"EMPTY LABEL";
            }
            *(_DWORD *)buf = 136316674;
            v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
            __int16 v394 = 1024;
            int v395 = 2790;
            __int16 v396 = 2112;
            id v397 = v325;
            __int16 v398 = 2112;
            id v399 = v56;
            __int16 v400 = 2112;
            CFStringRef v401 = v59;
            __int16 v402 = 2048;
            id v403 = v60;
            __int16 v404 = 2112;
            CFStringRef v405 = v63;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "%s:%d: No network signature modification is needed for this item : (name : %@ | xpanid : %@), ssid : %@, DS Record = %p, pwd = %@", buf, 0x44u);
            if (v62)
            {
            }
            if (v58)
            {
            }
          }

          id v64 = [v37 credentialsDataSetRecord];

          if (v64)
          {
            long long v65 = [v37 credentialsDataSetRecord];
            [v342 addObject:v65];

            unsigned __int8 v43 = THCredentialsServerLogHandleForCategory(1);
            if (!os_log_type_enabled(v43, OS_LOG_TYPE_INFO)) {
              goto LABEL_74;
            }
            long long v66 = [v37 network];
            v326 = [v66 networkName];
            long long v67 = [v37 network];
            long long v68 = [v67 extendedPANID];
            id v69 = [v37 networkSignature];
            uint64_t v70 = [v69 wifiSSID];
            id v308 = v66;
            if (v70)
            {
              v274 = [v37 networkSignature];
              CFStringRef v71 = [v274 wifiSSID];
              v273 = (__CFString *)v71;
            }
            else
            {
              CFStringRef v71 = &stru_1004A31D0;
            }
            uint64_t v76 = [v37 credentialsDataSetRecord];
            CFDictionaryRef v77 = [v37 networkSignature];
            uint64_t v78 = [v77 wifiPassword];
            *(_DWORD *)buf = 136316674;
            v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
            __int16 v394 = 1024;
            int v395 = 2801;
            __int16 v396 = 2112;
            id v397 = v326;
            __int16 v398 = 2112;
            id v399 = v68;
            __int16 v400 = 2112;
            CFStringRef v401 = v71;
            __int16 v402 = 2048;
            id v403 = v76;
            __int16 v404 = 2112;
            CFStringRef v405 = v78;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "%s:%d: adding item to finalPreferredBARecordList - item : (name : %@ | xpanid : %@), ssid : %@, DS Record = %p, pwd = %@", buf, 0x44u);

            if (v70)
            {
            }
            id v75 = v308;
            goto LABEL_73;
          }
          [v299 addObject:v37];
          unsigned __int8 v43 = THCredentialsServerLogHandleForCategory(1);
          if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
            goto LABEL_74;
          }
          v324 = [v37 networkSignature];
          uint64_t v44 = [v324 ipv4NwSignature];
          uint64_t v45 = [v37 networkSignature];
          CFDictionaryRef v46 = [v45 ipv6NwSignature];
          long long v47 = [v37 networkSignature];
          long long v48 = [v47 wifiSSID];
          CFStringRef v72 = &stru_1004A31D0;
          if (v48)
          {
            v269 = [v37 networkSignature];
            CFStringRef v72 = [v269 wifiSSID];
            v268 = (void *)v72;
          }
          uint64_t v73 = [v37 networkSignature];
          uint64_t v74 = [v73 wifiPassword];
          *(_DWORD *)buf = 136316418;
          v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
          __int16 v394 = 1024;
          int v395 = 2796;
          __int16 v396 = 2112;
          id v397 = v44;
          __int16 v398 = 2112;
          id v399 = v46;
          __int16 v400 = 2112;
          CFStringRef v401 = v72;
          __int16 v402 = 2112;
          id v403 = v74;
          _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%s:%d DS Record is nil but Label is equal to constant - ApplePreferredNetworkRecordLabel or it is empty : ipv4 signature : %@, ipv6 signature : %@ , ssid : %@, pwd : %@", buf, 0x3Au);

          if (v48)
          {

            BOOL v52 = v269;
LABEL_67:
          }
LABEL_68:

          id v75 = v324;
LABEL_73:

LABEL_74:
        }
        id v35 = v292;
        id obja = [v292 countByEnumeratingWithState:&v375 objects:v410 count:16];
      }
      while (obja);
    }

    [v35 removeAllObjects];
    v79 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
    {
      id v80 = [v299 count];
      id v81 = [v344 count];
      *(_DWORD *)buf = 136315906;
      v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
      __int16 v394 = 1024;
      int v395 = 2819;
      __int16 v396 = 2048;
      id v397 = v80;
      __int16 v398 = 2048;
      id v399 = v81;
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_INFO, "%s:%d: End of 2nd pass, size of keepPreferredListForModification : %lu, size of cleanUpPreferredList : %lu ", buf, 0x26u);
    }

    CFDictionaryRef v82 = THCredentialsServerLogHandleForCategory(1);
    a1 = v345;
    if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
    {
      id v83 = [v299 count];
      id v84 = [v342 count];
      *(_DWORD *)buf = 136315906;
      v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
      __int16 v394 = 1024;
      int v395 = 2820;
      __int16 v396 = 2048;
      id v397 = v83;
      __int16 v398 = 2048;
      id v399 = v84;
      _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_INFO, "%s:%d: End of 2nd pass, size of keepPreferredListForModification : %lu , size of finalPreferredBARecordList : %lu", buf, 0x26u);
    }

    __int16 v85 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
      __int16 v394 = 1024;
      int v395 = 2822;
      _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_INFO, "%s:%d: Before 3rd pass starts", buf, 0x12u);
    }

    long long v373 = 0u;
    long long v374 = 0u;
    long long v371 = 0u;
    long long v372 = 0u;
    id v309 = v299;
    id v327 = [v309 countByEnumeratingWithState:&v371 objects:v409 count:16];
    if (v327)
    {
      uint64_t v317 = *(void *)v372;
      do
      {
        int v86 = 0;
        do
        {
          if (*(void *)v372 != v317) {
            objc_enumerationMutation(v309);
          }
          __int16 v87 = *(void **)(*((void *)&v371 + 1) + 8 * (void)v86);
          id v88 = [v87 credentialsDataSetRecord];

          if (v88)
          {
            __int16 v89 = [v87 credentialsDataSetRecord];
LABEL_90:
            v92 = [v87 networkSignature];
            v93 = [v92 wifiPassword];
            if ([v93 isEqualToString:@"ApplePreferredNetworkRecordLabel"])
            {

              goto LABEL_97;
            }
            __int16 v94 = [v87 networkSignature];
            [v94 wifiPassword];
            int v95 = objb = v89;
            id v96 = [v95 length];

            __int16 v89 = objb;
            if (v96)
            {
              id v97 = objc_alloc((Class)THNetworkSignature);
              __int16 v98 = [v87 networkSignature];
              v99 = [v98 ipv4NwSignature];
              __int16 v100 = [v87 networkSignature];
              v101 = [v100 ipv6NwSignature];
              __int16 v102 = [v87 networkSignature];
              v103 = [v102 wifiPassword];
              id v104 = [v97 initWithSignatures:v99 ipv6NwSignature:v101 wifSSID:v103 wifiPassword:@"ApplePreferredNetworkRecordLabel"];

              a1 = v345;
              __int16 v89 = objb;

              if (!v104)
              {
                v105 = THCredentialsServerLogHandleForCategory(1);
                if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
                {
                  v127 = [v87 network];
                  v128 = [v127 networkName];
                  v129 = [v87 network];
                  v130 = [v129 extendedPANID];
                  *(_DWORD *)buf = 136315906;
                  v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
                  __int16 v394 = 1024;
                  int v395 = 2849;
                  __int16 v396 = 2112;
                  id v397 = v128;
                  __int16 v398 = 2112;
                  id v399 = v130;
                  _os_log_error_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_ERROR, "%s:%d:Error : initializing copy of nw signature for item : (name : %@ | xpanid : %@)", buf, 0x26u);
                }
                [v344 removeObject:v87];
                goto LABEL_106;
              }
            }
            else
            {
LABEL_97:
              id v104 = [v87 networkSignature];
            }
            id v106 = objc_alloc((Class)THPreferredThreadNetwork);
            v107 = [v87 network];
            v108 = [v87 creationDate];
            v109 = [v87 userInfo];
            id v110 = [v106 initWithThreadNetwork:v107 networkSignature:v104 credentialsDataSetRecord:v89 creationDate:v108 lastModificationDate:0 userInfo:v109];

            if (v110)
            {
              v111 = [v110 credentialsDataSetRecord];
              [v342 addObject:v111];

              [v291 addObject:v110];
              v112 = THCredentialsServerLogHandleForCategory(1);
              if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
              {
                v115 = [v110 network];
                v116 = [v115 networkName];
                v117 = [v110 network];
                v118 = [v117 extendedPANID];
                *(_DWORD *)buf = 136315906;
                v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
                __int16 v394 = 1024;
                int v395 = 2864;
                __int16 v396 = 2112;
                id v397 = v116;
                __int16 v398 = 2112;
                id v399 = v118;
                _os_log_error_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_ERROR, "%s:%d: 3rd pass, updated Signature & adding to Final/ToBeUpdated Preferred List - item : (name : %@ | xpanid : %@)", buf, 0x26u);

                a1 = v345;
              }
            }
            else
            {
              v113 = THCredentialsServerLogHandleForCategory(1);
              if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
              {
                v119 = [v87 network];
                v120 = [v119 networkName];
                v121 = [v87 network];
                v122 = [v121 extendedPANID];
                *(_DWORD *)buf = 136315906;
                v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
                __int16 v394 = 1024;
                int v395 = 2867;
                __int16 v396 = 2112;
                id v397 = v120;
                __int16 v398 = 2112;
                id v399 = v122;
                _os_log_error_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_ERROR, "%s:%d: Failed to create instance of updated preferred network for item : (name : %@ | xpanid : %@)", buf, 0x26u);

                a1 = v345;
              }

              [v344 removeObject:v87];
            }

LABEL_106:
            goto LABEL_107;
          }
          unsigned int v90 = *(void **)(a1 + 32);
          unsigned __int8 v91 = [v87 network];
          __int16 v89 = [v90 getOneRecordForNetwork:v91];

          if (v89) {
            goto LABEL_90;
          }
          v114 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
          {
            v123 = [v87 network];
            v124 = [v123 networkName];
            v125 = [v87 network];
            v126 = [v125 extendedPANID];
            *(_DWORD *)buf = 136315906;
            v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
            __int16 v394 = 1024;
            int v395 = 2830;
            __int16 v396 = 2112;
            id v397 = v124;
            __int16 v398 = 2112;
            id v399 = v126;
            _os_log_error_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_ERROR, "%s:%d: Failed to get ds record for item : (name : %@ | xpanid : %@)", buf, 0x26u);
          }
          [v344 addObject:v87];
LABEL_107:
          int v86 = (char *)v86 + 1;
        }
        while (v327 != v86);
        id v131 = [v309 countByEnumeratingWithState:&v371 objects:v409 count:16];
        id v327 = v131;
      }
      while (v131);
    }

    v132 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR)) {
      __78__THThreadNetworkCredentialsKeychainBackingStore_cleanThreadKeychainDatabase___block_invoke_cold_9(v291, v344);
    }

    v133 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v133, OS_LOG_TYPE_INFO))
    {
      id v134 = [v342 count];
      id v135 = [v291 count];
      *(_DWORD *)buf = 136315906;
      v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
      __int16 v394 = 1024;
      int v395 = 2873;
      __int16 v396 = 2048;
      id v397 = v134;
      __int16 v398 = 2048;
      id v399 = v135;
      _os_log_impl((void *)&_mh_execute_header, v133, OS_LOG_TYPE_INFO, "%s:%d: End of 3rd pass, size of finalPreferredBARecordList : %lu, toBeUpdatedPreferredList : %lu ", buf, 0x26u);
    }

    [v309 removeAllObjects];
    v136 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR)) {
      __78__THThreadNetworkCredentialsKeychainBackingStore_cleanThreadKeychainDatabase___block_invoke_cold_8(v291);
    }

    long long v369 = 0u;
    long long v370 = 0u;
    long long v367 = 0u;
    long long v368 = 0u;
    id v137 = v291;
    id v138 = [v137 countByEnumeratingWithState:&v367 objects:v408 count:16];
    if (v138)
    {
      id v139 = v138;
      uint64_t v140 = *(void *)v368;
      id v278 = v137;
      do
      {
        v141 = 0;
        do
        {
          if (*(void *)v368 != v140) {
            objc_enumerationMutation(v137);
          }
          v142 = *(void **)(*((void *)&v367 + 1) + 8 * (void)v141);
          int v366 = 0;
          [*(id *)(a1 + 32) dumpPreferredNetwork:v142];
          if (v142
            && [*(id *)(a1 + 32) storePreferredEntryAndCheckForDup:v142 isDuplicate:&v366])
          {
            int v143 = v366;
            v144 = THCredentialsServerLogHandleForCategory(1);
            BOOL v145 = os_log_type_enabled(v144, OS_LOG_TYPE_ERROR);
            if (v143 == 1)
            {
              if (v145)
              {
                v303 = [v142 network];
                obje = [v303 networkName];
                v295 = [v142 network];
                v330 = [v295 extendedPANID];
                v288 = [v142 networkSignature];
                v320 = [v288 ipv4NwSignature];
                v282 = [v142 networkSignature];
                id v312 = [v282 ipv6NwSignature];
                v159 = [v142 networkSignature];
                v160 = [v159 wifiSSID];
                CFStringRef v161 = &stru_1004A31D0;
                if (v160)
                {
                  uint64_t v272 = [v142 networkSignature];
                  CFStringRef v161 = [(id)v272 wifiSSID];
                  v270 = (__CFString *)v161;
                }
                v162 = [v142 networkSignature];
                v163 = [v162 wifiPassword];
                *(_DWORD *)buf = 136316930;
                v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
                __int16 v394 = 1024;
                int v395 = 2892;
                __int16 v396 = 2112;
                id v397 = obje;
                __int16 v398 = 2112;
                id v399 = v330;
                __int16 v400 = 2112;
                CFStringRef v401 = v320;
                __int16 v402 = 2112;
                id v403 = v312;
                __int16 v404 = 2112;
                CFStringRef v405 = v161;
                __int16 v406 = 2112;
                v407 = v163;
                _os_log_error_impl((void *)&_mh_execute_header, v144, OS_LOG_TYPE_ERROR, "%s:%d Updated the preferred Network : (name : %@ | xpanid : %@), ipv4 signature : %@, ipv6 signature : %@ , ssid : %@, pwd : %@", buf, 0x4Eu);

                if (v160)
                {
                }
                a1 = v345;
                id v137 = v278;
              }

              v144 = [*(id *)(a1 + 32) checkIfPrefItemPresentInTheCleanupList:v142 cleanupList:v344];
              if (v144)
              {
                v146 = THCredentialsServerLogHandleForCategory(1);
                if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
                {
                  v304 = [v142 network];
                  objf = [v304 networkName];
                  v296 = [v142 network];
                  v331 = [v296 extendedPANID];
                  v289 = [v142 networkSignature];
                  v321 = [v289 ipv4NwSignature];
                  v283 = [v142 networkSignature];
                  id v313 = [v283 ipv6NwSignature];
                  v164 = [v142 networkSignature];
                  v165 = [v164 wifiSSID];
                  CFStringRef v166 = &stru_1004A31D0;
                  if (v165)
                  {
                    v268 = [v142 networkSignature];
                    CFStringRef v166 = [v268 wifiSSID];
                    v265 = (__CFString *)v166;
                  }
                  v167 = [v142 networkSignature];
                  v168 = [v167 wifiPassword];
                  *(_DWORD *)buf = 136316930;
                  v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
                  __int16 v394 = 1024;
                  int v395 = 2896;
                  __int16 v396 = 2112;
                  id v397 = objf;
                  __int16 v398 = 2112;
                  id v399 = v331;
                  __int16 v400 = 2112;
                  CFStringRef v401 = v321;
                  __int16 v402 = 2112;
                  id v403 = v313;
                  __int16 v404 = 2112;
                  CFStringRef v405 = v166;
                  __int16 v406 = 2112;
                  v407 = v168;
                  _os_log_error_impl((void *)&_mh_execute_header, v146, OS_LOG_TYPE_ERROR, "%s:%d Removing from  cleanUpPreferredList : (name : %@ | xpanid : %@), ipv4 signature : %@, ipv6 signature : %@ , ssid : %@, pwd : %@", buf, 0x4Eu);

                  if (v165)
                  {
                  }
                  a1 = v345;
                  id v137 = v278;
                }

                [v344 removeObject:v144];
              }
            }
            else if (v145)
            {
              id v310 = [v142 network];
              objc = [v310 networkName];
              v301 = [v142 network];
              v328 = [v301 extendedPANID];
              v293 = [v142 networkSignature];
              v318 = [v293 ipv4NwSignature];
              v286 = [v142 networkSignature];
              v148 = [v286 ipv6NwSignature];
              v149 = [v142 networkSignature];
              v150 = [v149 wifiSSID];
              CFStringRef v151 = &stru_1004A31D0;
              if (v150)
              {
                v271 = [v142 networkSignature];
                CFStringRef v151 = [v271 wifiSSID];
                v269 = (void *)v151;
              }
              v152 = [v142 networkSignature];
              v153 = [v152 wifiPassword];
              *(_DWORD *)buf = 136316930;
              v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
              __int16 v394 = 1024;
              int v395 = 2901;
              __int16 v396 = 2112;
              id v397 = objc;
              __int16 v398 = 2112;
              id v399 = v328;
              __int16 v400 = 2112;
              CFStringRef v401 = v318;
              __int16 v402 = 2112;
              id v403 = v148;
              __int16 v404 = 2112;
              CFStringRef v405 = v151;
              __int16 v406 = 2112;
              v407 = v153;
              _os_log_error_impl((void *)&_mh_execute_header, v144, OS_LOG_TYPE_ERROR, "%s:%d Stored a new entry for preferred Network : (name : %@ | xpanid : %@), ipv4 signature : %@, ipv6 signature : %@ , ssid : %@, pwd : %@", buf, 0x4Eu);

              if (v150)
              {
              }
              a1 = v345;
              id v137 = v278;
            }
          }
          else
          {
            v147 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v147, OS_LOG_TYPE_ERROR))
            {
              v302 = [v142 network];
              objd = [v302 networkName];
              v294 = [v142 network];
              v329 = [v294 extendedPANID];
              v287 = [v142 networkSignature];
              v319 = [v287 ipv4NwSignature];
              v281 = [v142 networkSignature];
              id v311 = [v281 ipv6NwSignature];
              v154 = [v142 networkSignature];
              v155 = [v154 wifiSSID];
              CFStringRef v156 = &stru_1004A31D0;
              if (v155)
              {
                v274 = [v142 networkSignature];
                CFStringRef v156 = [v274 wifiSSID];
                v273 = (__CFString *)v156;
              }
              v157 = [v142 networkSignature];
              v158 = [v157 wifiPassword];
              *(_DWORD *)buf = 136316930;
              v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
              __int16 v394 = 1024;
              int v395 = 2906;
              __int16 v396 = 2112;
              id v397 = objd;
              __int16 v398 = 2112;
              id v399 = v329;
              __int16 v400 = 2112;
              CFStringRef v401 = v319;
              __int16 v402 = 2112;
              id v403 = v311;
              __int16 v404 = 2112;
              CFStringRef v405 = v156;
              __int16 v406 = 2112;
              v407 = v158;
              _os_log_error_impl((void *)&_mh_execute_header, v147, OS_LOG_TYPE_ERROR, "%s:%d Failed to store preferred network  : (name : %@ | xpanid : %@), ipv4 signature : %@, ipv6 signature : %@ , ssid : %@, pwd : %@", buf, 0x4Eu);

              if (v155)
              {
              }
              a1 = v345;
              id v137 = v278;
            }

            v144 = [*(id *)(a1 + 32) getTheKeyFromPreferredNetworkEntry:v142];
            [v343 setObject:v142 forKey:v144];
          }

          v141 = (char *)v141 + 1;
        }
        while (v139 != v141);
        id v169 = [v137 countByEnumeratingWithState:&v367 objects:v408 count:16];
        id v139 = v169;
      }
      while (v169);
    }

    [v137 removeAllObjects];
    v170 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v170, OS_LOG_TYPE_ERROR)) {
      __78__THThreadNetworkCredentialsKeychainBackingStore_cleanThreadKeychainDatabase___block_invoke_cold_7(v344);
    }

    long long v364 = 0u;
    long long v365 = 0u;
    long long v362 = 0u;
    long long v363 = 0u;
    id v171 = v344;
    id v172 = [v171 countByEnumeratingWithState:&v362 objects:v391 count:16];
    if (v172)
    {
      id v173 = v172;
      uint64_t v174 = *(void *)v363;
      id objg = v171;
      do
      {
        v175 = 0;
        do
        {
          if (*(void *)v363 != v174) {
            objc_enumerationMutation(v171);
          }
          v176 = *(void **)(*((void *)&v362 + 1) + 8 * (void)v175);
          v177 = [*(id *)(a1 + 32) getTheKeyFromPreferredNetworkEntry:v176];
          v178 = [v343 objectForKeyedSubscript:v177];

          if (v178)
          {
            v179 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v179, OS_LOG_TYPE_ERROR))
            {
              v181 = [v176 network];
              v182 = [v181 networkName];
              v183 = [v176 network];
              v184 = [v183 extendedPANID];
              *(_DWORD *)buf = 136315906;
              v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
              __int16 v394 = 1024;
              int v395 = 2927;
              __int16 v396 = 2112;
              id v397 = v182;
              __int16 v398 = 2112;
              id v399 = v184;
              _os_log_error_impl((void *)&_mh_execute_header, v179, OS_LOG_TYPE_ERROR, "%s:%d: Do not touch the preferred network entry : (name : %@ | xpanid : %@)", buf, 0x26u);

              a1 = v345;
              id v171 = objg;
            }

            [*(id *)(a1 + 32) dumpPreferredNetwork:v176];
          }
          else if (([*(id *)(a1 + 32) deletePreferredNetworkEntryWithoutRecords:v176] & 1) == 0)
          {
            v180 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v180, OS_LOG_TYPE_ERROR))
            {
              v290 = [v176 network];
              v322 = [v290 networkName];
              v284 = [v176 network];
              id v314 = [v284 extendedPANID];
              v279 = [v176 networkSignature];
              v305 = [v279 ipv4NwSignature];
              v276 = [v176 networkSignature];
              v297 = [v276 ipv6NwSignature];
              v185 = [v176 networkSignature];
              v186 = [v185 wifiSSID];
              CFStringRef v187 = &stru_1004A31D0;
              if (v186)
              {
                v274 = [v176 networkSignature];
                CFStringRef v187 = [v274 wifiSSID];
                v273 = (__CFString *)v187;
              }
              v188 = [v176 networkSignature];
              v189 = [v188 wifiPassword];
              *(_DWORD *)buf = 136316930;
              v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
              __int16 v394 = 1024;
              int v395 = 2934;
              __int16 v396 = 2112;
              id v397 = v322;
              __int16 v398 = 2112;
              id v399 = v314;
              __int16 v400 = 2112;
              CFStringRef v401 = v305;
              __int16 v402 = 2112;
              id v403 = v297;
              __int16 v404 = 2112;
              CFStringRef v405 = v187;
              __int16 v406 = 2112;
              v407 = v189;
              _os_log_error_impl((void *)&_mh_execute_header, v180, OS_LOG_TYPE_ERROR, "%s:%d Failed to delete the previous preferred network entry : (name : %@ | xpanid : %@), ipv4 signature : %@, ipv6 signature : %@ , ssid : %@, pwd : %@", buf, 0x4Eu);

              if (v186)
              {
              }
              a1 = v345;
              id v171 = objg;
            }
          }
          v175 = (char *)v175 + 1;
        }
        while (v173 != v175);
        id v190 = [v171 countByEnumeratingWithState:&v362 objects:v391 count:16];
        id v173 = v190;
      }
      while (v190);
    }

    [v343 removeAllObjects];
    [v171 removeAllObjects];
    v191 = [*(id *)(a1 + 32) getNumberOfPrefEntriesForTheCount:200];
    v192 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v192, OS_LOG_TYPE_INFO))
    {
      id v193 = [v191 count];
      *(_DWORD *)buf = 136315650;
      v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
      __int16 v394 = 1024;
      int v395 = 2942;
      __int16 v396 = 2048;
      id v397 = v193;
      _os_log_impl((void *)&_mh_execute_header, v192, OS_LOG_TYPE_INFO, "%s:%d: End of 3rd Pass, size of preferred networks (prefNwFinalRecords) : %lu", buf, 0x1Cu);
    }

    id v194 = [v191 count];
    id v11 = (id)*((void *)&v384 + 1);
    *((void *)&v385 + 1) = v194;
    *(void *)&long long v385 = *((void *)&v384 + 1) - (void)v194;

    id v8 = &exit_ptr;
  }
  else
  {
    id v292 = v9;
    v195 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v195, OS_LOG_TYPE_ERROR)) {
      __78__THThreadNetworkCredentialsKeychainBackingStore_cleanThreadKeychainDatabase___block_invoke_cold_6();
    }

    long long v385 = 0uLL;
  }

  v196 = [*(id *)(a1 + 32) getNumberOfRecordsForKeychainAccessGroup:@"0000000000" count:400];
  v197 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v197, OS_LOG_TYPE_ERROR)) {
    __78__THThreadNetworkCredentialsKeychainBackingStore_cleanThreadKeychainDatabase___block_invoke_cold_5(v196);
  }

  v315 = (char *)[v196 count];
  *(void *)&long long v383 = v315;
  v306 = v196;
  if (!v196)
  {
    long long v348 = 0u;
    long long v349 = 0u;
    long long v346 = 0u;
    long long v347 = 0u;
    id v220 = v342;
    id v236 = [v220 countByEnumeratingWithState:&v346 objects:v387 count:16];
    if (!v236) {
      goto LABEL_265;
    }
    id v237 = v236;
    id v298 = v11;
    uint64_t v238 = *(void *)v347;
    while (1)
    {
      v239 = 0;
      do
      {
        if (*(void *)v347 != v238) {
          objc_enumerationMutation(v220);
        }
        v240 = *(void **)(*((void *)&v346 + 1) + 8 * (void)v239);
        if (v240
          && [*(id *)(v345 + 32) updateRecord:*(void *)(*((void *)&v346 + 1) + 8 * (void)v239)])
        {
          v241 = THCredentialsServerLogHandleForCategory(1);
          if (!os_log_type_enabled(v241, OS_LOG_TYPE_ERROR)) {
            goto LABEL_239;
          }
          v242 = [v240 network];
          v243 = [v242 networkName];
          v244 = [v240 network];
          v245 = [v244 extendedPANID];
          *(_DWORD *)buf = 136315906;
          v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
          __int16 v394 = 1024;
          int v395 = 3019;
          __int16 v396 = 2112;
          id v397 = v243;
          __int16 v398 = 2112;
          id v399 = v245;
          v246 = v241;
          v247 = "%s:%d: Updated BA Record for item : (name : %@ | xpanid : %@)";
        }
        else
        {
          v241 = THCredentialsServerLogHandleForCategory(1);
          if (!os_log_type_enabled(v241, OS_LOG_TYPE_ERROR)) {
            goto LABEL_239;
          }
          v242 = [v240 network];
          v243 = [v242 networkName];
          v244 = [v240 network];
          v245 = [v244 extendedPANID];
          *(_DWORD *)buf = 136315906;
          v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
          __int16 v394 = 1024;
          int v395 = 3021;
          __int16 v396 = 2112;
          id v397 = v243;
          __int16 v398 = 2112;
          id v399 = v245;
          v246 = v241;
          v247 = "%s:%d: Failed to create instance of BA Record for item : (name : %@ | xpanid : %@)";
        }
        _os_log_error_impl((void *)&_mh_execute_header, v246, OS_LOG_TYPE_ERROR, v247, buf, 0x26u);

LABEL_239:
        v239 = (char *)v239 + 1;
      }
      while (v237 != v239);
      id v248 = [v220 countByEnumeratingWithState:&v346 objects:v387 count:16];
      id v237 = v248;
      if (!v248)
      {
LABEL_264:
        a1 = v345;
        id v11 = v298;
        goto LABEL_265;
      }
    }
  }
  if ((unint64_t)[v196 count] <= 0x18F)
  {
    id v298 = v11;
    v198 = [v8[314] arrayWithArray:v342];
    long long v358 = 0u;
    long long v359 = 0u;
    long long v360 = 0u;
    long long v361 = 0u;
    id v199 = v196;
    id v200 = [v199 countByEnumeratingWithState:&v358 objects:v390 count:16];
    if (!v200) {
      goto LABEL_208;
    }
    id v201 = v200;
    uint64_t v202 = *(void *)v359;
    while (1)
    {
      for (k = 0; k != v201; k = (char *)k + 1)
      {
        if (*(void *)v359 != v202) {
          objc_enumerationMutation(v199);
        }
        v204 = *(void **)(*((void *)&v358 + 1) + 8 * (void)k);
        if (v204)
        {
          if ([*(id *)(v345 + 32) checkIfActiveDatasetRecordIsPresentInTheGivenList:v342 Missinglist:v198 record:*(void *)(*((void *)&v358 + 1) + 8 * (void)k)])
          {
            v205 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v205, OS_LOG_TYPE_ERROR))
            {
              v332 = [v204 network];
              v206 = [v332 networkName];
              v323 = [v204 network];
              v207 = [v323 extendedPANID];
              v208 = [v204 borderAgent];
              v209 = [v208 discriminatorId];
              *(_DWORD *)buf = 136316162;
              v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
              __int16 v394 = 1024;
              int v395 = 2984;
              __int16 v396 = 2112;
              id v397 = v206;
              __int16 v398 = 2112;
              id v399 = v207;
              __int16 v400 = 2112;
              CFStringRef v401 = v209;
              v210 = v205;
              v211 = "%s:%d: Not deleting the ba record (name : %@ | xpanid : %@ | baID : %@), this belongs to Preferred BARecord List.";
              goto LABEL_203;
            }
LABEL_205:

            continue;
          }
          v212 = *(void **)(v345 + 32);
          v213 = [v204 network];
          v214 = [v204 borderAgent];
          v215 = [v212 deleteActiveDataSetRecordForNetworkAndBorderAgentId:v213 borderAgent:v214];

          if (v215)
          {
            v205 = THCredentialsServerLogHandleForCategory(1);
            if (!os_log_type_enabled(v205, OS_LOG_TYPE_ERROR)) {
              goto LABEL_205;
            }
            v332 = [v204 network];
            v206 = [v332 networkName];
            v323 = [v204 network];
            v216 = [v323 extendedPANID];
            v217 = [v204 borderAgent];
            v218 = [v217 discriminatorId];
            *(_DWORD *)buf = 136316162;
            v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
            __int16 v394 = 1024;
            int v395 = 2976;
            __int16 v396 = 2112;
            id v397 = v206;
            __int16 v398 = 2112;
            id v399 = v216;
            __int16 v400 = 2112;
            CFStringRef v401 = v218;
            _os_log_error_impl((void *)&_mh_execute_header, v205, OS_LOG_TYPE_ERROR, "%s:%d: Failed to delete border agent record (name : %@ | xpanid : %@ | baID : %@)", buf, 0x30u);
          }
          else
          {
            [*(id *)(v345 + 32) thDumpActiveDatasetRecord:v204];
            v205 = THCredentialsServerLogHandleForCategory(1);
            if (!os_log_type_enabled(v205, OS_LOG_TYPE_ERROR)) {
              goto LABEL_205;
            }
            v332 = [v204 network];
            v206 = [v332 networkName];
            v323 = [v204 network];
            v207 = [v323 extendedPANID];
            v208 = [v204 borderAgent];
            v209 = [v208 discriminatorId];
            *(_DWORD *)buf = 136316162;
            v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
            __int16 v394 = 1024;
            int v395 = 2979;
            __int16 v396 = 2112;
            id v397 = v206;
            __int16 v398 = 2112;
            id v399 = v207;
            __int16 v400 = 2112;
            CFStringRef v401 = v209;
            v210 = v205;
            v211 = "%s:%d: Deleted the ba record (name : %@ | xpanid : %@ | baID : %@), this doesn't belong to Preferred BARecord List.";
LABEL_203:
            _os_log_error_impl((void *)&_mh_execute_header, v210, OS_LOG_TYPE_ERROR, v211, buf, 0x30u);
          }
          goto LABEL_205;
        }
      }
      id v201 = [v199 countByEnumeratingWithState:&v358 objects:v390 count:16];
      if (!v201)
      {
LABEL_208:

        v219 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v219, OS_LOG_TYPE_ERROR)) {
          __78__THThreadNetworkCredentialsKeychainBackingStore_cleanThreadKeychainDatabase___block_invoke_cold_3(v198);
        }

        long long v356 = 0u;
        long long v357 = 0u;
        long long v354 = 0u;
        long long v355 = 0u;
        id v220 = v198;
        id v221 = [v220 countByEnumeratingWithState:&v354 objects:v389 count:16];
        if (!v221)
        {
LABEL_225:

          goto LABEL_264;
        }
        id v222 = v221;
        uint64_t v223 = *(void *)v355;
        while (2)
        {
          uint64_t v224 = 0;
LABEL_213:
          if (*(void *)v355 != v223) {
            objc_enumerationMutation(v220);
          }
          v225 = *(void **)(*((void *)&v354 + 1) + 8 * v224);
          if (v225
            && [*(id *)(v345 + 32) updateRecord:*(void *)(*((void *)&v354 + 1) + 8 * v224)])
          {
            v226 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v226, OS_LOG_TYPE_ERROR))
            {
              v227 = [v225 network];
              v228 = [v227 networkName];
              v229 = [v225 network];
              v230 = [v229 extendedPANID];
              *(_DWORD *)buf = 136315906;
              v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
              __int16 v394 = 1024;
              int v395 = 2993;
              __int16 v396 = 2112;
              id v397 = v228;
              __int16 v398 = 2112;
              id v399 = v230;
              v231 = v226;
              v232 = "%s:%d: Updated Missing BA Record for item : (name : %@ | xpanid : %@)";
              goto LABEL_223;
            }
          }
          else
          {
            v226 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v226, OS_LOG_TYPE_ERROR))
            {
              v227 = [v225 network];
              v228 = [v227 networkName];
              v229 = [v225 network];
              v230 = [v229 extendedPANID];
              *(_DWORD *)buf = 136315906;
              v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
              __int16 v394 = 1024;
              int v395 = 2995;
              __int16 v396 = 2112;
              id v397 = v228;
              __int16 v398 = 2112;
              id v399 = v230;
              v231 = v226;
              v232 = "%s:%d: Failed to create instance of Missing BA Record for item : (name : %@ | xpanid : %@)";
LABEL_223:
              _os_log_error_impl((void *)&_mh_execute_header, v231, OS_LOG_TYPE_ERROR, v232, buf, 0x26u);
            }
          }

          if (v222 == (id)++v224)
          {
            id v233 = [v220 countByEnumeratingWithState:&v354 objects:v389 count:16];
            id v222 = v233;
            if (!v233) {
              goto LABEL_225;
            }
            continue;
          }
          goto LABEL_213;
        }
      }
    }
  }
  if (([*(id *)(a1 + 32) deleteAllRecordsForKeychainAccessGroup:@"0000000000"] & 1) == 0)
  {
    v249 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v249, OS_LOG_TYPE_ERROR)) {
      __78__THThreadNetworkCredentialsKeychainBackingStore_cleanThreadKeychainDatabase___block_invoke_cold_4();
    }
  }
  long long v352 = 0u;
  long long v353 = 0u;
  long long v350 = 0u;
  long long v351 = 0u;
  id v220 = v342;
  id v250 = [v220 countByEnumeratingWithState:&v350 objects:v388 count:16];
  if (v250)
  {
    id v251 = v250;
    id v298 = v11;
    uint64_t v252 = *(void *)v351;
    while (1)
    {
      v253 = 0;
      do
      {
        if (*(void *)v351 != v252) {
          objc_enumerationMutation(v220);
        }
        v254 = *(void **)(*((void *)&v350 + 1) + 8 * (void)v253);
        if (v254
          && [*(id *)(v345 + 32) updateRecord:*(void *)(*((void *)&v350 + 1) + 8 * (void)v253)])
        {
          v255 = THCredentialsServerLogHandleForCategory(1);
          if (!os_log_type_enabled(v255, OS_LOG_TYPE_ERROR)) {
            goto LABEL_259;
          }
          v256 = [v254 network];
          v257 = [v256 networkName];
          v258 = [v254 network];
          v259 = [v258 extendedPANID];
          *(_DWORD *)buf = 136315906;
          v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
          __int16 v394 = 1024;
          int v395 = 3009;
          __int16 v396 = 2112;
          id v397 = v257;
          __int16 v398 = 2112;
          id v399 = v259;
          v260 = v255;
          v261 = "%s:%d: Updated BA Record for item : (name : %@ | xpanid : %@)";
        }
        else
        {
          v255 = THCredentialsServerLogHandleForCategory(1);
          if (!os_log_type_enabled(v255, OS_LOG_TYPE_ERROR)) {
            goto LABEL_259;
          }
          v256 = [v254 network];
          v257 = [v256 networkName];
          v258 = [v254 network];
          v259 = [v258 extendedPANID];
          *(_DWORD *)buf = 136315906;
          v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
          __int16 v394 = 1024;
          int v395 = 3011;
          __int16 v396 = 2112;
          id v397 = v257;
          __int16 v398 = 2112;
          id v399 = v259;
          v260 = v255;
          v261 = "%s:%d: Failed to create instance of BA Record for item : (name : %@ | xpanid : %@)";
        }
        _os_log_error_impl((void *)&_mh_execute_header, v260, OS_LOG_TYPE_ERROR, v261, buf, 0x26u);

LABEL_259:
        v253 = (char *)v253 + 1;
      }
      while (v251 != v253);
      id v262 = [v220 countByEnumeratingWithState:&v350 objects:v388 count:16];
      id v251 = v262;
      if (!v262) {
        goto LABEL_264;
      }
    }
  }
LABEL_265:

  v263 = [*(id *)(a1 + 32) getNumberOfRecordsForKeychainAccessGroup:@"0000000000" count:400];

  v264 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v264, OS_LOG_TYPE_ERROR)) {
    __78__THThreadNetworkCredentialsKeychainBackingStore_cleanThreadKeychainDatabase___block_invoke_cold_2(v263);
  }

  *(void *)&long long v384 = [v263 count];
  *((void *)&v383 + 1) = &v315[-v384];
  if (v11) {
    [*(id *)(a1 + 32) sendCAMetricsForCleanUpRecordInfo:&v383];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  id v2 = v266;
  v235 = v341;
LABEL_270:
}

- (BOOL)updateRecord:(id)a3
{
  id v3 = a3;
  CFDictionaryRef v4 = [v3 keyChainItemRepresentationForActiveDataSetRecordAddOperation];
  CFDictionaryRef v5 = v4;
  if (v4)
  {
    OSStatus v6 = SecItemAdd(v4, 0);
    if (v6 == -25299)
    {
      int v7 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315138;
        id v13 = "-[THThreadNetworkCredentialsKeychainBackingStore updateRecord:]";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Credential exists. Will update instead.", (uint8_t *)&v12, 0xCu);
      }

      CFDictionaryRef v8 = [v3 keyChainQueryForActiveDataSetRecordUpdateOperation];
      CFDictionaryRef v9 = [v3 keyChainItemRepresentationForActiveDataSetRecordUpdateOperation];
      OSStatus v6 = SecItemUpdate(v8, v9);
    }
    BOOL v10 = v6 == 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)isPreferred:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = [v4 network];
  OSStatus v6 = +[THPreferredThreadNetwork keyChainQueryForPreferredNetworkRecordsOperationForNetwork:v5];

  if (v6)
  {
    id v34 = 0;
    int v7 = [(THThreadNetworkCredentialsKeychainBackingStore *)self _doFetchPreferredNetworks:v6 error:&v34];
    CFDictionaryRef v8 = v34;
    CFDictionaryRef v9 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      BOOL v10 = [v4 network];
      id v11 = [v10 networkName];
      *(_DWORD *)buf = 136315650;
      long long v37 = "-[THThreadNetworkCredentialsKeychainBackingStore isPreferred:]";
      __int16 v38 = 1024;
      int v39 = 3082;
      __int16 v40 = 2112;
      id v41 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s : %d - Preferred Networks in Database for Network  = %@", buf, 0x1Cu);
    }
    if (v7 && [v7 count])
    {
      int v12 = [v4 network];
      id v13 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchActiveDataSetRecordsOperationForNetwork:v12];

      id v33 = 0;
      uint64_t v14 = [(THThreadNetworkCredentialsKeychainBackingStore *)self _doFetchActiveDataSetRecords:v13 error:&v33];
      id v15 = v33;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v16 = v14;
      id v17 = [v16 countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v17)
      {
        id v18 = v17;
        id v26 = v15;
        int v27 = v7;
        id v28 = v8;
        uint64_t v19 = 0;
        uint64_t v20 = *(void *)v30;
        while (2)
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v30 != v20) {
              objc_enumerationMutation(v16);
            }
            id v22 = [*(id *)(*((void *)&v29 + 1) + 8 * i) borderAgent];
            unsigned int v23 = [v22 discriminatorId];

            if (v23)
            {
              if (v19)
              {
                BOOL v24 = 0;
                goto LABEL_23;
              }
              uint64_t v19 = 1;
            }
          }
          id v18 = [v16 countByEnumeratingWithState:&v29 objects:v35 count:16];
          if (v18) {
            continue;
          }
          break;
        }
        BOOL v24 = 1;
LABEL_23:
        int v7 = v27;
        CFDictionaryRef v8 = v28;
        id v15 = v26;
      }
      else
      {
        BOOL v24 = 1;
      }
    }
    else
    {
      id v13 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore isPreferred:](v4);
      }
      BOOL v24 = 0;
    }
  }
  else
  {
    BOOL v24 = 1;
    CFDictionaryRef v8 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore isPreferred:]();
    }
  }

  return v24;
}

- (BOOL)fetchRecord:(id)a3
{
  id v19 = 0;
  id v4 = [(THThreadNetworkCredentialsKeychainBackingStore *)self _doFetchActiveDataSetRecords:a3 error:&v19];
  id v5 = v19;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    int v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        int v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (-[THThreadNetworkCredentialsKeychainBackingStore isPreferred:](self, "isPreferred:", v12, (void)v15))
        {
          id v13 = [v12 credentials];
          [v13 setIsActiveDevice:0];

          v9 |= [(THThreadNetworkCredentialsKeychainBackingStore *)self updateRecord:v12];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v8);
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9 & 1;
}

- (BOOL)skipDeleteWithBorderAgent:(id)a3
{
  id v4 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchActiveDataSetRecordOperationForBorderAgent:a3];
  LOBYTE(self) = [(THThreadNetworkCredentialsKeychainBackingStore *)self fetchRecord:v4];

  return (char)self;
}

- (BOOL)skipDeleteWithUUID:(id)a3
{
  id v4 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchOneActiveDataSetRecordOperationForUniqueIdentifier:a3];
  LOBYTE(self) = [(THThreadNetworkCredentialsKeychainBackingStore *)self fetchRecord:v4];

  return (char)self;
}

- (unint64_t)getCountOfThreadBorderRoutersWithMdns:(id)a3
{
  id v3 = a3;
  if (!v3) {
    id v3 = [(id)objc_opt_new() init];
  }
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy_;
  unsigned int v23 = __Block_byref_object_dispose_;
  id v4 = v3;
  id v24 = v4;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = (void *)v20[5];
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  long long v15 = __88__THThreadNetworkCredentialsKeychainBackingStore_getCountOfThreadBorderRoutersWithMdns___block_invoke;
  long long v16 = &unk_1004995E0;
  long long v18 = &v19;
  id v7 = v5;
  long long v17 = v7;
  id v8 = &_dispatch_main_q;
  [v6 startScan:&v13 queue:&_dispatch_main_q timeInSec:5];

  int v9 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[THThreadNetworkCredentialsKeychainBackingStore getCountOfThreadBorderRoutersWithMdns:]();
  }

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = objc_msgSend((id)v20[5], "findNWs", v13, v14, v15, v16);
  id v11 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[THThreadNetworkCredentialsKeychainBackingStore getCountOfThreadBorderRoutersWithMdns:]();
  }

  _Block_object_dispose(&v19, 8);
  return (unint64_t)v10;
}

intptr_t __88__THThreadNetworkCredentialsKeychainBackingStore_getCountOfThreadBorderRoutersWithMdns___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) stopScan];
  id v2 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v2);
}

- (id)dataFromHexString:(id)a3
{
  id v3 = [a3 lowercaseString];
  id v4 = objc_opt_new();
  __int16 v12 = 0;
  int v5 = [v3 length];
  if (v5 >= 2)
  {
    int v6 = 0;
    int v7 = v5 - 1;
    do
    {
      int v8 = v6 + 1;
      unsigned __int8 v9 = [v3 characterAtIndex:v6];
      if ((char)v9 >= 48 && v9 <= 0x66u && v9 - 58 >= 0x27)
      {
        __str[0] = v9;
        __str[1] = [v3 characterAtIndex:v8];
        HIBYTE(v12) = strtol(__str, 0, 16);
        [v4 appendBytes:(char *)&v12 + 1 length:1];
        int v8 = v6 + 2;
      }
      int v6 = v8;
    }
    while (v8 < v7);
  }

  return v4;
}

- (BOOL)isMatchingMdnsRecords:(id)a3 preferredNw:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = v6;
  if (!v5 || !v6)
  {
    int v8 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315906;
      long long v17 = "-[THThreadNetworkCredentialsKeychainBackingStore isMatchingMdnsRecords:preferredNw:]";
      __int16 v18 = 1024;
      int v19 = 3185;
      __int16 v20 = 2112;
      id v21 = v5;
      __int16 v22 = 2112;
      unsigned int v23 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s:%d Nil parameter, mdnsNW : %@, preferredNw : %@ ", (uint8_t *)&v16, 0x26u);
    }
    goto LABEL_11;
  }
  int v8 = [v5 networkName];
  unsigned __int8 v9 = [v7 networkName];
  if (([v8 isEqualToString:v9] & 1) == 0)
  {

LABEL_11:
    goto LABEL_12;
  }
  id v10 = [v5 extendedPANID];
  id v11 = [v7 extendedPANID];
  unsigned int v12 = [v10 isEqualToData:v11];

  if (!v12)
  {
LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  id v13 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[THThreadNetworkCredentialsKeychainBackingStore isMatchingMdnsRecords:preferredNw:](v7, v5);
  }

  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (BOOL)isMatchingNetworkSignature:(id)a3 preferredNwSignature:(id)a4
{
  uint64_t v5 = 0;
  return [(THThreadNetworkCredentialsKeychainBackingStore *)self isMatchingNetworkSignature:a3 preferredNwSignature:a4 preferred:0 signaturePrefEntries:0 updatedPreferred:&v5];
}

- (BOOL)isMatchingNetworkSignature:(id)a3 preferredNwSignature:(id)a4 preferred:(id)a5 signaturePrefEntries:(id)a6 updatedPreferred:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v71 = a6;
  if (v71)
  {
    BOOL v14 = [v71 allObjects];
    long long v15 = +[NSMutableArray arrayWithArray:v14];

    if (!v15)
    {
      int v16 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore isMatchingNetworkSignature:preferredNwSignature:preferred:signaturePrefEntries:updatedPreferred:]();
      }
      long long v15 = 0;
      goto LABEL_39;
    }
    [v15 sortUsingComparator:&__block_literal_global_174];
  }
  else
  {
    long long v15 = 0;
  }
  if (![(THThreadNetworkCredentialsKeychainBackingStore *)self wifiInfoAvailable:v11]
    && ![(THThreadNetworkCredentialsKeychainBackingStore *)self wifiInfoAvailable:v12])
  {
    BOOL v17 = 1;
    int v16 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v78 = "-[THThreadNetworkCredentialsKeychainBackingStore isMatchingNetworkSignature:preferredNwSignature:preferred:s"
            "ignaturePrefEntries:updatedPreferred:]";
      __int16 v79 = 1024;
      int v80 = 3258;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s:%d : Current device WiFi info and Preferred Network WiFi info are empty, no need to update !", buf, 0x12u);
    }
    goto LABEL_54;
  }
  if (![(THThreadNetworkCredentialsKeychainBackingStore *)self wifiInfoAvailable:v12]
    && [(THThreadNetworkCredentialsKeychainBackingStore *)self wifiInfoAvailable:v11])
  {
    int v16 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore isMatchingNetworkSignature:preferredNwSignature:preferred:signaturePrefEntries:updatedPreferred:]();
    }
LABEL_39:
    BOOL v17 = 0;
    goto LABEL_54;
  }
  if (![(THThreadNetworkCredentialsKeychainBackingStore *)self wifiInfoAvailable:v11]
    && [(THThreadNetworkCredentialsKeychainBackingStore *)self wifiInfoAvailable:v12])
  {
    BOOL v17 = 1;
    int v16 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore isMatchingNetworkSignature:preferredNwSignature:preferred:signaturePrefEntries:updatedPreferred:]();
    }
    goto LABEL_54;
  }
  __int16 v18 = [v11 wifiSSID];
  int v19 = [v12 wifiSSID];
  unsigned int v20 = [v18 isEqualToString:v19];

  if (v20)
  {
    id v21 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v22 = [v11 wifiSSID];
      *(_DWORD *)buf = 136315650;
      uint64_t v78 = "-[THThreadNetworkCredentialsKeychainBackingStore isMatchingNetworkSignature:preferredNwSignature:preferred:s"
            "ignaturePrefEntries:updatedPreferred:]";
      __int16 v79 = 1024;
      int v80 = 3290;
      __int16 v81 = 2112;
      CFDictionaryRef v82 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s:%d : Networks SSIDs (%@) are matching!!", buf, 0x1Cu);
    }
    if (v71)
    {
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      int v16 = v15;
      id v70 = [v16 countByEnumeratingWithState:&v72 objects:v76 count:16];
      if (v70)
      {
        long long v67 = self;
        id v62 = v12;
        id v63 = v11;
        uint64_t v69 = *(void *)v73;
        long long v66 = v16;
LABEL_21:
        uint64_t v23 = 0;
        id v24 = v67;
        while (1)
        {
          if (*(void *)v73 != v69) {
            objc_enumerationMutation(v16);
          }
          BOOL v25 = *(void **)(*((void *)&v72 + 1) + 8 * v23);
          id v26 = objc_msgSend(v25, "networkSignature", v62, v63);
          unsigned __int8 v27 = [(THThreadNetworkCredentialsKeychainBackingStore *)v24 wifiInfoAvailable:v26];

          if ((v27 & 1) == 0)
          {
            id v28 = [v25 network];
            long long v29 = [v28 networkName];
            long long v30 = [v13 network];
            long long v31 = [v30 networkName];
            if (![v29 isEqualToString:v31])
            {

LABEL_29:
              __int16 v38 = [v25 creationDate];
              int v39 = [v13 creationDate];
              id v40 = [v38 compare:v39];

              id v41 = THCredentialsServerLogHandleForCategory(1);
              BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_INFO);
              if (v40 != (id)-1)
              {
                BOOL v52 = v25;
                id v12 = v62;
                id v11 = v63;
                if (v42)
                {
                  long long v53 = [v52 network];
                  long long v54 = [v53 networkName];
                  *(_DWORD *)buf = 136315650;
                  uint64_t v78 = "-[THThreadNetworkCredentialsKeychainBackingStore isMatchingNetworkSignature:preferredNwSignature"
                        ":preferred:signaturePrefEntries:updatedPreferred:]";
                  __int16 v79 = 1024;
                  int v80 = 3307;
                  __int16 v81 = 2112;
                  CFDictionaryRef v82 = v54;
                  _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%s:%d: No need to update signature for  : %@", buf, 0x1Cu);
                }
                BOOL v17 = 1;
                int v16 = v66;
                goto LABEL_53;
              }
              if (v42)
              {
                unsigned __int8 v43 = [v25 network];
                uint64_t v44 = [v43 networkName];
                *(_DWORD *)buf = 136315650;
                uint64_t v78 = "-[THThreadNetworkCredentialsKeychainBackingStore isMatchingNetworkSignature:preferredNwSignature:p"
                      "referred:signaturePrefEntries:updatedPreferred:]";
                __int16 v79 = 1024;
                int v80 = 3311;
                __int16 v81 = 2112;
                CFDictionaryRef v82 = v44;
                _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%s:%d: WiFi Info is not available for the Preferred Network Entry : %@, updating it", buf, 0x1Cu);
              }
              id v24 = v67;
              [(THThreadNetworkCredentialsKeychainBackingStore *)v67 dumpPreferredNetwork:v25];
              id v45 = objc_alloc((Class)THPreferredThreadNetwork);
              CFDictionaryRef v46 = [v25 network];
              long long v47 = [v13 networkSignature];
              long long v48 = [v25 credentialsDataSetRecord];
              CFStringRef v49 = [v25 creationDate];
              [v25 userInfo];
              v51 = uint64_t v50 = v25;
              *a7 = [v45 initWithThreadNetwork:v46 networkSignature:v47 credentialsDataSetRecord:v48 creationDate:v49 lastModificationDate:0 userInfo:v51];

              int v16 = v66;
              if ([(THThreadNetworkCredentialsKeychainBackingStore *)v67 storePreferred:*a7])
              {
                long long v55 = THCredentialsServerLogHandleForCategory(1);
                if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
                {
                  long long v56 = [v13 network];
                  long long v57 = [v56 networkName];
                  *(_DWORD *)buf = 136315650;
                  uint64_t v78 = "-[THThreadNetworkCredentialsKeychainBackingStore isMatchingNetworkSignature:preferredNwSignature"
                        ":preferred:signaturePrefEntries:updatedPreferred:]";
                  __int16 v79 = 1024;
                  int v80 = 3319;
                  __int16 v81 = 2112;
                  CFDictionaryRef v82 = v57;
                  _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "%s:%d: Original Preferred Network with the name : %@", buf, 0x1Cu);

                  int v16 = v66;
                }

                [(THThreadNetworkCredentialsKeychainBackingStore *)v67 dumpPreferredNetwork:v13];
                uint64_t v58 = THCredentialsServerLogHandleForCategory(1);
                id v12 = v62;
                id v11 = v63;
                if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
                {
                  CFStringRef v59 = [*a7 network];
                  __int16 v60 = [v59 networkName];
                  *(_DWORD *)buf = 136315650;
                  uint64_t v78 = "-[THThreadNetworkCredentialsKeychainBackingStore isMatchingNetworkSignature:preferredNwSignature"
                        ":preferred:signaturePrefEntries:updatedPreferred:]";
                  __int16 v79 = 1024;
                  int v80 = 3321;
                  __int16 v81 = 2112;
                  CFDictionaryRef v82 = v60;
                  _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "%s:%d: Stored updated Preferred Network with the name : %@", buf, 0x1Cu);

                  int v16 = v66;
                }

                [(THThreadNetworkCredentialsKeychainBackingStore *)v67 dumpPreferredNetwork:*a7];
                [(THThreadNetworkCredentialsKeychainBackingStore *)v67 deletePreferredNetworkEntryWithoutRecords:v50];
                [(THThreadNetworkCredentialsKeychainBackingStore *)v67 deletePreferredNetworkEntryWithoutRecords:v13];
                BOOL v17 = 0;
                goto LABEL_53;
              }
              goto LABEL_33;
            }
            long long v32 = [v25 network];
            id v33 = [v32 extendedPANID];
            [v13 network];
            id v34 = v65 = v28;
            [v34 extendedPANID];
            id v35 = v25;
            v37 = id v36 = v13;
            unsigned __int8 v64 = [v33 isEqualToData:v37];

            id v13 = v36;
            BOOL v25 = v35;

            int v16 = v66;
            id v24 = v67;
            if ((v64 & 1) == 0) {
              goto LABEL_29;
            }
          }
LABEL_33:
          if (v70 == (id)++v23)
          {
            BOOL v17 = 1;
            id v70 = [v16 countByEnumeratingWithState:&v72 objects:v76 count:16];
            if (v70) {
              goto LABEL_21;
            }
            long long v15 = v16;
            id v12 = v62;
            id v11 = v63;
            goto LABEL_54;
          }
        }
      }
      BOOL v17 = 1;
LABEL_53:
      long long v15 = v16;
LABEL_54:
    }
    else
    {
      BOOL v17 = 1;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

int64_t __146__THThreadNetworkCredentialsKeychainBackingStore_isMatchingNetworkSignature_preferredNwSignature_preferred_signaturePrefEntries_updatedPreferred___block_invoke(id a1, id a2, id a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 creationDate];
  id v6 = [v4 creationDate];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

- (BOOL)matchPreferredNetworkRecordWithMdns:(id)a3
{
  id v3 = a3;
  id v4 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[THThreadNetworkCredentialsKeychainBackingStore matchPreferredNetworkRecordWithMdns:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 3368;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s:%d: Entered. Trying to match Preferred with Mdns records", buf, 0x12u);
  }

  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  id v26 = __Block_byref_object_copy_;
  unsigned __int8 v27 = __Block_byref_object_dispose_;
  id v28 = objc_alloc_init(ThreadBRFinder);
  uint64_t v5 = *(void **)(*(void *)&buf[8] + 40);
  if (!v5)
  {
    int v16 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v21 = 136315394;
      __int16 v22 = "-[THThreadNetworkCredentialsKeychainBackingStore matchPreferredNetworkRecordWithMdns:]";
      __int16 v23 = 1024;
      int v24 = 3372;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s:%d: baFinder is nil..", v21, 0x12u);
    }
    goto LABEL_15;
  }
  id v6 = [v3 network];
  id v7 = [v6 networkName];
  int v8 = [v3 network];
  unsigned __int8 v9 = [v8 extendedPANID];
  unsigned __int8 v10 = [v5 dispatchStartScan:v7 extendedPanIdToFind:v9 borderAgentIdToFind:0];

  if ((v10 & 1) == 0)
  {
    int v16 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore matchPreferredNetworkRecordWithMdns:]();
    }
LABEL_15:

LABEL_16:
    BOOL v17 = 0;
    goto LABEL_17;
  }
  id v11 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id v21 = 136315394;
    __int16 v22 = "-[THThreadNetworkCredentialsKeychainBackingStore matchPreferredNetworkRecordWithMdns:]";
    __int16 v23 = 1024;
    int v24 = 3381;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s:%d: Waiting for Preferred network record to match on Mdns meshcop", v21, 0x12u);
  }

  dispatch_time_t v12 = dispatch_time(0, 10000000000);
  id v13 = [*(id *)(*(void *)&buf[8] + 40) baFinderSemaphore];
  intptr_t v14 = dispatch_semaphore_wait(v13, v12);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __86__THThreadNetworkCredentialsKeychainBackingStore_matchPreferredNetworkRecordWithMdns___block_invoke;
  block[3] = &unk_1004994B0;
  void block[4] = buf;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  if (v14)
  {
    long long v15 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore matchPreferredNetworkRecordWithMdns:]();
    }

    [*(id *)(*(void *)&buf[8] + 40) clear];
    goto LABEL_16;
  }
  int v19 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id v21 = 136315394;
    __int16 v22 = "-[THThreadNetworkCredentialsKeychainBackingStore matchPreferredNetworkRecordWithMdns:]";
    __int16 v23 = 1024;
    int v24 = 3396;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s:%d: Preferred network record matches on Mdns meshcop", v21, 0x12u);
  }

  [*(id *)(*(void *)&buf[8] + 40) clear];
  BOOL v17 = 1;
LABEL_17:
  _Block_object_dispose(buf, 8);

  return v17;
}

id __86__THThreadNetworkCredentialsKeychainBackingStore_matchPreferredNetworkRecordWithMdns___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stopScan];
}

- (id)matchPreferredNetworkWithMdns:(id)a3
{
  id v4 = a3;
  uint64_t v5 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v22 = "-[THThreadNetworkCredentialsKeychainBackingStore matchPreferredNetworkWithMdns:]";
    __int16 v23 = 1024;
    int v24 = 3403;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:%d: Entered. Matching Preferred with Mdns records", buf, 0x12u);
  }

  id v6 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    char v10 = 0;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (-[THThreadNetworkCredentialsKeychainBackingStore matchPreferredNetworkRecordWithMdns:](self, "matchPreferredNetworkRecordWithMdns:", v13, (void)v16))
        {
          [v6 addObject:v13];
          char v10 = 1;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);

    if (v10)
    {
      intptr_t v14 = +[NSSet setWithArray:v6];
      goto LABEL_16;
    }
  }
  else
  {
  }
  intptr_t v14 = 0;
LABEL_16:

  return v14;
}

- (id)getTheMdnsMatchingEntryFromTheList:(id)a3
{
  id v3 = a3;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy_;
  __int16 v22 = __Block_byref_object_dispose_;
  __int16 v23 = objc_alloc_init(ThreadBRFinder);
  id v4 = (void *)v19[5];
  if (!v4)
  {
    char v10 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v25 = "-[THThreadNetworkCredentialsKeychainBackingStore getTheMdnsMatchingEntryFromTheList:]";
      __int16 v26 = 1024;
      int v27 = 3429;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s:%d: baFinder is nil..", buf, 0x12u);
    }
    goto LABEL_14;
  }
  if (([v4 disPatchStartScanToMatchListOfPreferredNetworkEntries:v3] & 1) == 0)
  {
    char v10 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore getTheMdnsMatchingEntryFromTheList:]();
    }
LABEL_14:

LABEL_15:
    id v11 = 0;
    goto LABEL_16;
  }
  uint64_t v5 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v25 = "-[THThreadNetworkCredentialsKeychainBackingStore getTheMdnsMatchingEntryFromTheList:]";
    __int16 v26 = 1024;
    int v27 = 3439;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:%d: Waiting for Preferred network records to match on Mdns meshcop", buf, 0x12u);
  }

  dispatch_time_t v6 = dispatch_time(0, 10000000000);
  id v7 = [(id)v19[5] baFinderSemaphore];
  intptr_t v8 = dispatch_semaphore_wait(v7, v6);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __85__THThreadNetworkCredentialsKeychainBackingStore_getTheMdnsMatchingEntryFromTheList___block_invoke;
  block[3] = &unk_1004994B0;
  void block[4] = &v18;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  if (v8)
  {
    id v9 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore getTheMdnsMatchingEntryFromTheList:]();
    }

    [(id)v19[5] clear];
    goto LABEL_15;
  }
  uint64_t v13 = [(id)v19[5] preferredRecord];
  intptr_t v14 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    long long v15 = [v13 network];
    long long v16 = [v15 networkName];
    *(_DWORD *)buf = 136315650;
    BOOL v25 = "-[THThreadNetworkCredentialsKeychainBackingStore getTheMdnsMatchingEntryFromTheList:]";
    __int16 v26 = 1024;
    int v27 = 3456;
    __int16 v28 = 2112;
    long long v29 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s:%d: Preferred network record matches on Mdns meshcop preferred network name : %@", buf, 0x1Cu);
  }
  [(id)v19[5] clear];
  id v11 = v13;
LABEL_16:
  _Block_object_dispose(&v18, 8);

  return v11;
}

id __85__THThreadNetworkCredentialsKeychainBackingStore_getTheMdnsMatchingEntryFromTheList___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stopScan];
}

- (BOOL)deletePreferredNetworkEntry:(id)a3
{
  id v3 = a3;
  CFDictionaryRef v4 = +[THPreferredThreadNetwork keyChainQueryForDeletePreferredNetworkRecord:v3];
  CFDictionaryRef v5 = v4;
  if (!v4)
  {
    char v10 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkEntry:]();
    }
    goto LABEL_15;
  }
  OSStatus v6 = SecItemDelete(v4);
  id v7 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    intptr_t v8 = [v3 network];
    id v9 = [v8 networkName];
    int v17 = 136315650;
    uint64_t v18 = "-[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkEntry:]";
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    __int16 v21 = 1024;
    OSStatus v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Preferred Network : %@, Deletion result :(err=%d)", (uint8_t *)&v17, 0x1Cu);
  }
  if (v6)
  {
    char v10 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkEntry:](v3);
    }
LABEL_15:
    BOOL v14 = 0;
    goto LABEL_16;
  }
  id v11 = [v3 network];
  char v10 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForDeleteAllActiveDataSetOperationForThreadNetwork:v11];

  OSStatus v12 = SecItemDelete((CFDictionaryRef)v10);
  uint64_t v13 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315394;
    uint64_t v18 = "-[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkEntry:]";
    __int16 v19 = 1024;
    LODWORD(v20) = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s: GOT: (err=%d)", (uint8_t *)&v17, 0x12u);
  }

  BOOL v14 = v12 == 0;
  if (v12)
  {
    long long v15 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkEntry:](v3);
    }

    goto LABEL_15;
  }
LABEL_16:

  return v14;
}

- (BOOL)deletePreferredNetworkEntryWithoutRecords:(id)a3
{
  id v3 = a3;
  CFDictionaryRef v4 = +[THPreferredThreadNetwork keyChainQueryForDeletePreferredNetworkRecord:v3];
  CFDictionaryRef v5 = THCredentialsServerLogHandleForCategory(1);
  OSStatus v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315650;
      BOOL v14 = "-[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkEntryWithoutRecords:]";
      __int16 v15 = 1024;
      *(_DWORD *)long long v16 = 3501;
      *(_WORD *)&uint8_t v16[4] = 2112;
      *(void *)&v16[6] = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s:%d: SID: Delete keychain query dictionary keyChainDelete: %@", (uint8_t *)&v13, 0x1Cu);
    }

    OSStatus v7 = SecItemDelete(v4);
    intptr_t v8 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v3 network];
      char v10 = [v9 networkName];
      int v13 = 136315650;
      BOOL v14 = "-[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkEntryWithoutRecords:]";
      __int16 v15 = 2112;
      *(void *)long long v16 = v10;
      *(_WORD *)&v16[8] = 1024;
      *(_DWORD *)&v16[10] = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Preferred Network : %@, Deletion result :(err=%d)", (uint8_t *)&v13, 0x1Cu);
    }
    if (!v7)
    {
      BOOL v11 = 1;
      goto LABEL_13;
    }
    OSStatus v6 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkEntryWithoutRecords:](v3);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    -[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkEntryWithoutRecords:]();
  }

  BOOL v11 = 0;
LABEL_13:

  return v11;
}

- (BOOL)deleteOldEntryForTheNetworkSignatureIfThreadNetworkIsDifferent:(id)a3 nwSignature:(id)a4
{
  id v6 = a3;
  OSStatus v7 = [(THThreadNetworkCredentialsKeychainBackingStore *)self getPrefEntriesForSignature:a4];
  intptr_t v8 = v7;
  if (!v7 || ![v7 count])
  {
    BOOL v26 = 1;
    goto LABEL_25;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v8;
  id v9 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (!v9)
  {
    BOOL v26 = 1;
    goto LABEL_24;
  }
  id v10 = v9;
  __int16 v28 = v8;
  uint64_t v11 = *(void *)v37;
  long long v29 = self;
  id v30 = v6;
  uint64_t v33 = *(void *)v37;
  while (2)
  {
    OSStatus v12 = 0;
    id v34 = v10;
    do
    {
      if (*(void *)v37 != v11) {
        objc_enumerationMutation(obj);
      }
      int v13 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v12);
      [(THThreadNetworkCredentialsKeychainBackingStore *)self dumpPreferredNetwork:v13];
      BOOL v14 = [v13 networkSignature];
      if ([(THThreadNetworkCredentialsKeychainBackingStore *)self wifiInfoAvailable:v14])
      {
        __int16 v15 = [v13 network];
        long long v16 = [v15 networkName];
        int v17 = [v6 network];
        uint64_t v18 = [v17 networkName];
        if ([v16 isEqualToString:v18])
        {
          __int16 v19 = [v13 network];
          [v19 extendedPANID];
          v20 = long long v32 = v15;
          __int16 v21 = [v6 network];
          OSStatus v22 = [v21 extendedPANID];
          unsigned __int8 v31 = [v20 isEqualToData:v22];

          id v6 = v30;
          self = v29;

          uint64_t v11 = v33;
          id v10 = v34;
          if (v31) {
            goto LABEL_17;
          }
          goto LABEL_14;
        }

        uint64_t v11 = v33;
        id v10 = v34;
      }

LABEL_14:
      __int16 v23 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        int v24 = [v13 network];
        BOOL v25 = [v24 networkName];
        *(_DWORD *)buf = 136315650;
        id v41 = "-[THThreadNetworkCredentialsKeychainBackingStore deleteOldEntryForTheNetworkSignatureIfThreadNetworkIsDiff"
              "erent:nwSignature:]";
        __int16 v42 = 1024;
        int v43 = 3531;
        __int16 v44 = 2112;
        id v45 = v25;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s:%d: Deleting the Preferred Network Entry : %@", buf, 0x1Cu);
      }
      if (![(THThreadNetworkCredentialsKeychainBackingStore *)self deletePreferredNetworkEntry:v13])
      {
        BOOL v26 = 0;
        goto LABEL_22;
      }
LABEL_17:
      OSStatus v12 = (char *)v12 + 1;
    }
    while (v10 != v12);
    id v10 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v10) {
      continue;
    }
    break;
  }
  BOOL v26 = 1;
LABEL_22:
  intptr_t v8 = v28;
LABEL_24:

LABEL_25:
  return v26;
}

- (id)checkIfNetworkSignatureUpdateIsRequiredForPreferredNetwork:(id)a3 nwSignature:(id)a4
{
  return [(THThreadNetworkCredentialsKeychainBackingStore *)self checkIfNetworkSignatureUpdateIsRequiredForPreferredNetwork:a3 nwSignature:a4 signaturePrefEntries:0];
}

- (id)checkIfNetworkSignatureUpdateIsRequiredForPreferredNetwork:(id)a3 nwSignature:(id)a4 signaturePrefEntries:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 networkSignature];
  id v30 = 0;
  unsigned int v12 = [(THThreadNetworkCredentialsKeychainBackingStore *)self isMatchingNetworkSignature:v9 preferredNwSignature:v11 preferred:v8 signaturePrefEntries:v10 updatedPreferred:&v30];

  id v13 = v30;
  BOOL v14 = THCredentialsServerLogHandleForCategory(1);
  __int16 v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      long long v32 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfNetworkSignatureUpdateIsRequiredForPreferredNetwork:"
            "nwSignature:signaturePrefEntries:]";
      __int16 v33 = 1024;
      int v34 = 3558;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s:%d: Current Network Signature matches with Preferred Network Signature", buf, 0x12u);
    }

    goto LABEL_5;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    long long v32 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfNetworkSignatureUpdateIsRequiredForPreferredNetwork:nw"
          "Signature:signaturePrefEntries:]";
    __int16 v33 = 1024;
    int v34 = 3562;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s:%d: Update is required for the preferred network ssid", buf, 0x12u);
  }

  if (!v13)
  {
    id v18 = objc_alloc((Class)THPreferredThreadNetwork);
    __int16 v19 = [v8 network];
    uint64_t v20 = [v8 credentialsDataSetRecord];
    __int16 v21 = [v8 creationDate];
    OSStatus v22 = [v8 userInfo];
    id v13 = [v18 initWithThreadNetwork:v19 networkSignature:v9 credentialsDataSetRecord:v20 creationDate:v21 lastModificationDate:0 userInfo:v22];

    if (!v13)
    {
      long long v29 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore checkIfNetworkSignatureUpdateIsRequiredForPreferredNetwork:nwSignature:signaturePrefEntries:]();
      }

      id v13 = 0;
      goto LABEL_5;
    }
    if (![(THThreadNetworkCredentialsKeychainBackingStore *)self storePreferred:v13])
    {
LABEL_5:
      long long v16 = 0;
      goto LABEL_10;
    }
    __int16 v23 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v24 = [v8 network];
      BOOL v25 = [v24 networkName];
      *(_DWORD *)buf = 136315650;
      long long v32 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfNetworkSignatureUpdateIsRequiredForPreferredNetwork:"
            "nwSignature:signaturePrefEntries:]";
      __int16 v33 = 1024;
      int v34 = 3579;
      __int16 v35 = 2112;
      long long v36 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s:%d: Original Preferred Network with the name : %@", buf, 0x1Cu);
    }
    [(THThreadNetworkCredentialsKeychainBackingStore *)self dumpPreferredNetwork:v8];
    BOOL v26 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      int v27 = [v13 network];
      __int16 v28 = [v27 networkName];
      *(_DWORD *)buf = 136315650;
      long long v32 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfNetworkSignatureUpdateIsRequiredForPreferredNetwork:"
            "nwSignature:signaturePrefEntries:]";
      __int16 v33 = 1024;
      int v34 = 3581;
      __int16 v35 = 2112;
      long long v36 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s:%d: Stored updated Preferred Network with the name : %@", buf, 0x1Cu);
    }
    [(THThreadNetworkCredentialsKeychainBackingStore *)self dumpPreferredNetwork:v13];
  }
  id v13 = v13;
  long long v16 = v13;
LABEL_10:

  return v16;
}

- (id)matchPreferredNetworkWithNetworkSignature:(id)a3 nwSignature:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v28 = "-[THThreadNetworkCredentialsKeychainBackingStore matchPreferredNetworkWithNetworkSignature:nwSignature:]";
    __int16 v29 = 1024;
    int v30 = 3591;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s:%d: Entered. Matching Preferred with Network Signatures ", buf, 0x12u);
  }

  if (!v7)
  {
    __int16 v21 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore matchPreferredNetworkWithNetworkSignature:nwSignature:]();
    }
    goto LABEL_18;
  }
  __int16 v21 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v10)
  {

LABEL_18:
    id v18 = 0;
    goto LABEL_21;
  }
  id v11 = v10;
  id v20 = v6;
  char v12 = 0;
  uint64_t v13 = *(void *)v23;
  do
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v23 != v13) {
        objc_enumerationMutation(v9);
      }
      __int16 v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      long long v16 = objc_msgSend(v15, "networkSignature", v20);
      unsigned int v17 = [(THThreadNetworkCredentialsKeychainBackingStore *)self isMatchingNetworkSignature:v7 preferredNwSignature:v16];

      if (v17)
      {
        [v21 addObject:v15];
        char v12 = 1;
      }
    }
    id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v11);

  if (v12)
  {
    id v18 = +[NSSet setWithArray:v21];
  }
  else
  {
    id v18 = 0;
  }
  id v6 = v20;
LABEL_21:

  return v18;
}

- (void)dumpPreferredNetwork:(id)a3
{
  id v3 = a3;
  CFDictionaryRef v4 = THCredentialsServerLogHandleForCategory(1);
  CFDictionaryRef v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v6 = [v3 network];
      id v7 = [v6 networkName];
      int v27 = 136315650;
      __int16 v28 = "-[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetwork:]";
      __int16 v29 = 1024;
      int v30 = 3623;
      __int16 v31 = 2112;
      long long v32 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:%d: Preferred Network Name : %@", (uint8_t *)&v27, 0x1Cu);
    }
    id v8 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [v3 network];
      id v10 = [v9 extendedPANID];
      int v27 = 136315650;
      __int16 v28 = "-[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetwork:]";
      __int16 v29 = 1024;
      int v30 = 3625;
      __int16 v31 = 2112;
      long long v32 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s:%d: Preferred Network Extended Pan Id : %@", (uint8_t *)&v27, 0x1Cu);
    }
    id v11 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      char v12 = [v3 networkSignature];
      uint64_t v13 = [v12 ipv4NwSignature];
      int v27 = 136315650;
      __int16 v28 = "-[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetwork:]";
      __int16 v29 = 1024;
      int v30 = 3627;
      __int16 v31 = 2112;
      long long v32 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s:%d: Preferred Network IPv4 NwSignature : %@", (uint8_t *)&v27, 0x1Cu);
    }
    BOOL v14 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      __int16 v15 = [v3 networkSignature];
      long long v16 = [v15 ipv6NwSignature];
      int v27 = 136315650;
      __int16 v28 = "-[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetwork:]";
      __int16 v29 = 1024;
      int v30 = 3629;
      __int16 v31 = 2112;
      long long v32 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s:%d: Preferred Network IPv6 NwSignature : %@", (uint8_t *)&v27, 0x1Cu);
    }
    unsigned int v17 = [v3 networkSignature];
    uint64_t v18 = [v17 wifiSSID];
    if (v18)
    {
      __int16 v19 = (void *)v18;
      id v20 = [v3 networkSignature];
      __int16 v21 = [v20 wifiPassword];

      if (!v21)
      {
LABEL_15:
        long long v24 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          long long v25 = [v3 creationDate];
          int v27 = 136315650;
          __int16 v28 = "-[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetwork:]";
          __int16 v29 = 1024;
          int v30 = 3635;
          __int16 v31 = 2112;
          long long v32 = v25;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s:%d: Preferred Network creation dated : %@", (uint8_t *)&v27, 0x1Cu);
        }
        CFDictionaryRef v5 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          BOOL v26 = [v3 lastModificationDate];
          int v27 = 136315650;
          __int16 v28 = "-[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetwork:]";
          __int16 v29 = 1024;
          int v30 = 3637;
          __int16 v31 = 2112;
          long long v32 = v26;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:%d: Preferred Network last modified : %@", (uint8_t *)&v27, 0x1Cu);
        }
        goto LABEL_21;
      }
      unsigned int v17 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        long long v22 = [v3 networkSignature];
        long long v23 = [v22 wifiSSID];
        int v27 = 136315650;
        __int16 v28 = "-[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetwork:]";
        __int16 v29 = 1024;
        int v30 = 3632;
        __int16 v31 = 2112;
        long long v32 = v23;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s:%d: Preferred Network wifi ssid : %@", (uint8_t *)&v27, 0x1Cu);
      }
    }

    goto LABEL_15;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetwork:]();
  }
LABEL_21:
}

- (void)dumpPreferredNetworksArray:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v21 = "-[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetworksArray:]";
      __int16 v22 = 1024;
      int v23 = 3648;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s:%d: === Sorted List of Preferred Networks  ===", buf, 0x12u);
    }

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      int v10 = 0;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v7);
          }
          if (v10 + i == 10)
          {
            BOOL v14 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              -[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetworksArray:]();
            }

            goto LABEL_19;
          }
          -[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetwork:](self, "dumpPreferredNetwork:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        }
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        v10 += (int)i;
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_19:

    uint64_t v13 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v21 = "-[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetworksArray:]";
      __int16 v22 = 1024;
      int v23 = 3660;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s:%d: ==================================", buf, 0x12u);
    }
  }
  else
  {
    uint64_t v13 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetworksArray:]();
    }
  }
}

- (void)dumpPreferredNetworks:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v21 = "-[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetworks:]";
      __int16 v22 = 1024;
      int v23 = 3672;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s:%d: === List of Preferred Networks ===", buf, 0x12u);
    }

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      int v10 = 0;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v7);
          }
          if (v10 + i == 10)
          {
            BOOL v14 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              -[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetworks:]();
            }

            goto LABEL_19;
          }
          -[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetwork:](self, "dumpPreferredNetwork:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        }
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        v10 += (int)i;
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_19:

    uint64_t v13 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v21 = "-[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetworks:]";
      __int16 v22 = 1024;
      int v23 = 3684;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s:%d: ==================================", buf, 0x12u);
    }
  }
  else
  {
    uint64_t v13 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetworks:]();
    }
  }
}

- (void)dumpFrozenThreadNetworks:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 count])
  {
    CFDictionaryRef v5 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      int v23 = "-[THThreadNetworkCredentialsKeychainBackingStore dumpFrozenThreadNetworks:]";
      __int16 v24 = 1024;
      int v25 = 3696;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:%d: === List of Frozen Thread Networks ===", buf, 0x12u);
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v18 objects:v30 count:16];
    if (v7)
    {
      id v8 = v7;
      int v9 = 0;
      uint64_t v10 = *(void *)v19;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v6);
          }
          char v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v13 = THCredentialsServerLogHandleForCategory(1);
          BOOL v14 = v13;
          if (v9 + i == 10)
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
              -[THThreadNetworkCredentialsKeychainBackingStore dumpFrozenThreadNetworks:]();
            }

            goto LABEL_21;
          }
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            long long v15 = [v12 credentialsDataSet];
            long long v16 = [v15 dataSetArray];
            *(_DWORD *)buf = 136315906;
            int v23 = "-[THThreadNetworkCredentialsKeychainBackingStore dumpFrozenThreadNetworks:]";
            __int16 v24 = 1024;
            int v25 = 3704;
            __int16 v26 = 1024;
            int v27 = v9 + i;
            __int16 v28 = 2112;
            __int16 v29 = v16;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s:%d: %d> Frozen Thread Network  : %@", buf, 0x22u);
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v18 objects:v30 count:16];
        v9 += (int)i;
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_21:

    long long v17 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      int v23 = "-[THThreadNetworkCredentialsKeychainBackingStore dumpFrozenThreadNetworks:]";
      __int16 v24 = 1024;
      int v25 = 3709;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s:%d: ==================================", buf, 0x12u);
    }
  }
  else
  {
    long long v17 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      int v23 = "-[THThreadNetworkCredentialsKeychainBackingStore dumpFrozenThreadNetworks:]";
      __int16 v24 = 1024;
      int v25 = 3692;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s:%d: Frozen thread network records empty ", buf, 0x12u);
    }
  }
}

- (id)getPreferredNetworkInternally
{
  return [(THThreadNetworkCredentialsKeychainBackingStore *)self getPreferredNetwork:1];
}

- (id)sortAndReturnPreferredNetwork:(id)a3
{
  return [(THThreadNetworkCredentialsKeychainBackingStore *)self sortAndReturnPreferredNetwork:a3 onlyMdns:0];
}

- (id)sortAndReturnPreferredNetwork:(id)a3 onlyMdns:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v8 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    long long v48 = "-[THThreadNetworkCredentialsKeychainBackingStore sortAndReturnPreferredNetwork:onlyMdns:]";
    __int16 v49 = 1024;
    *(_DWORD *)uint64_t v50 = 3731;
    *(_WORD *)&v50[4] = 2048;
    *(void *)&v50[6] = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s : %d - Networks in the Database = %lu", buf, 0x1Cu);
  }

  int v9 = [v6 allObjects];
  uint64_t v10 = +[NSMutableArray arrayWithArray:v9];

  if (!v10)
  {
    uint64_t v13 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore sortAndReturnPreferredNetwork:onlyMdns:]();
    }
    BOOL v14 = 0;
    goto LABEL_11;
  }
  [v10 sortUsingComparator:&__block_literal_global_176];
  [(THThreadNetworkCredentialsKeychainBackingStore *)self dumpPreferredNetworksArray:v10];
  if (v4)
  {
    uint64_t v11 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore sortAndReturnPreferredNetwork:onlyMdns:].cold.4(v6);
    }

    uint64_t v12 = [(THThreadNetworkCredentialsKeychainBackingStore *)self getTheMdnsMatchingEntryFromTheList:v10];
  }
  else
  {
    if (![v10 count])
    {
      BOOL v14 = 0;
      goto LABEL_32;
    }
    uint64_t v12 = [v10 objectAtIndexedSubscript:0];
  }
  BOOL v14 = v12;
  if (v12)
  {
    long long v15 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      long long v16 = [v14 network];
      long long v17 = [v16 networkName];
      *(_DWORD *)buf = 136315650;
      long long v48 = "-[THThreadNetworkCredentialsKeychainBackingStore sortAndReturnPreferredNetwork:onlyMdns:]";
      __int16 v49 = 1024;
      *(_DWORD *)uint64_t v50 = 3775;
      *(_WORD *)&v50[4] = 2112;
      *(void *)&v50[6] = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s:%d: Found the Preferred Network : %@", buf, 0x1Cu);
    }
    uint64_t v18 = [v14 credentialsDataSetRecord];
    if (v18)
    {
      uint64_t v13 = v18;
      long long v19 = [v14 credentialsDataSetRecord];
      long long v20 = [v19 credentialsDataSet];
      uint64_t v21 = [v20 dataSetArray];
      if (!v21)
      {

LABEL_11:
        goto LABEL_32;
      }
      __int16 v22 = (void *)v21;
      __int16 v44 = self;
      CFDictionaryRef v46 = v7;
      int v23 = [v14 credentialsDataSetRecord];
      __int16 v24 = [v23 credentialsDataSet];
      int v25 = [v24 dataSetArray];
      id v45 = [v25 length];

      if (v45)
      {
        __int16 v26 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = [v14 credentialsDataSetRecord];
          __int16 v28 = [v27 network];
          __int16 v29 = [v28 networkName];
          int v30 = [v14 credentialsDataSetRecord];
          __int16 v31 = [v30 credentialsDataSet];
          long long v32 = [v31 dataSetArray];
          *(_DWORD *)buf = 136315906;
          long long v48 = "-[THThreadNetworkCredentialsKeychainBackingStore sortAndReturnPreferredNetwork:onlyMdns:]";
          __int16 v49 = 1024;
          *(_DWORD *)uint64_t v50 = 3782;
          *(_WORD *)&v50[4] = 2112;
          *(void *)&v50[6] = v29;
          __int16 v51 = 2112;
          BOOL v52 = v32;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s:%d: This preferred network entry has a record associated with it, record name : %@, dataset : %@, check if it is frozen or not", buf, 0x26u);
        }
        __int16 v33 = [v14 credentialsDataSetRecord];
        unsigned int v34 = [(THThreadNetworkCredentialsKeychainBackingStore *)v44 isFrozenRecord:v33];

        if (v34)
        {
          CFDictionaryRef v35 = +[THPreferredThreadNetwork keyChainQueryForDeletePreferredNetworkRecord:v14];
          CFDictionaryRef v36 = v35;
          if (v35)
          {
            OSStatus v37 = SecItemDelete(v35);
            long long v38 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              long long v39 = [v14 network];
              id v40 = [v39 networkName];
              *(_DWORD *)buf = 136315650;
              long long v48 = "-[THThreadNetworkCredentialsKeychainBackingStore sortAndReturnPreferredNetwork:onlyMdns:]";
              __int16 v49 = 2112;
              *(void *)uint64_t v50 = v40;
              *(_WORD *)&v50[8] = 1024;
              *(_DWORD *)&v50[10] = v37;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%s: Frozen Preferred Network : %@, Deletion result :(err=%d)", buf, 0x1Cu);
            }
            if (!v37) {
              goto LABEL_39;
            }
            id v41 = SecCopyErrorMessageString(v37, 0);
            __int16 v42 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
              __152__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredNetworkForNetworkSignatureInternallyWithCompletion_ipv6NwSignature_wifiSSID_completion___block_invoke_cold_2();
            }
          }
          else
          {
            id v41 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
              -[THThreadNetworkCredentialsKeychainBackingStore sortAndReturnPreferredNetwork:onlyMdns:]();
            }
          }

LABEL_39:
          uint64_t v13 = v14;
          BOOL v14 = 0;
          id v7 = v46;
          goto LABEL_11;
        }
      }
      id v7 = v46;
    }
  }
LABEL_32:

  return v14;
}

int64_t __89__THThreadNetworkCredentialsKeychainBackingStore_sortAndReturnPreferredNetwork_onlyMdns___block_invoke(id a1, id a2, id a3)
{
  id v4 = a3;
  CFDictionaryRef v5 = [a2 creationDate];
  id v6 = [v4 creationDate];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

- (BOOL)wifiInfoAvailable:(id)a3
{
  id v3 = a3;
  id v4 = [v3 wifiSSID];
  if (v4)
  {
    CFDictionaryRef v5 = [v3 wifiSSID];
    BOOL v6 = [v5 length] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)getPrefEntriesForLabelAsSSID:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    long long v17 = "-[THThreadNetworkCredentialsKeychainBackingStore getPrefEntriesForLabelAsSSID:]";
    __int16 v18 = 1024;
    int v19 = 3827;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:%d: Get preferred network for SSID", buf, 0x12u);
  }

  BOOL v6 = +[THPreferredThreadNetwork keyChainQueryForPreferredNetworkRecordsOperationForLabelAsSSID:v4];
  if (v6)
  {
    id v15 = 0;
    id v7 = [(THThreadNetworkCredentialsKeychainBackingStore *)self _doFetchPreferredNetworks:v6 error:&v15];
    id v8 = v15;
    if (v7)
    {
      int v9 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = [v7 count];
        uint64_t v11 = [v4 wifiSSID];
        *(_DWORD *)buf = 136315906;
        long long v17 = "-[THThreadNetworkCredentialsKeychainBackingStore getPrefEntriesForLabelAsSSID:]";
        __int16 v18 = 1024;
        int v19 = 3837;
        __int16 v20 = 2048;
        id v21 = v10;
        __int16 v22 = 2112;
        int v23 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s : %d - Preferred Networks in Database = %lu, for network ssid :(%@)", buf, 0x26u);
      }
    }
    uint64_t v12 = v7;

    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v12 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore getPrefEntriesForLabelAsSSID:]();
    }
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)getPrefEntriesForSSIDAndSignature:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v19 = "-[THThreadNetworkCredentialsKeychainBackingStore getPrefEntriesForSSIDAndSignature:]";
    __int16 v20 = 1024;
    int v21 = 3847;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:%d: Get preferred network for SSID and signature", buf, 0x12u);
  }

  BOOL v6 = +[THPreferredThreadNetwork keyChainQueryForPreferredNetworkRecordsOperationForWifiNetworkWithSignature:v4];
  if (v6)
  {
    id v17 = 0;
    id v7 = [(THThreadNetworkCredentialsKeychainBackingStore *)self _doFetchPreferredNetworks:v6 error:&v17];
    id v8 = v17;
    if (v7)
    {
      int v9 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = [v7 count];
        uint64_t v11 = [v4 wifiSSID];
        uint64_t v12 = [v4 ipv4NwSignature];
        uint64_t v13 = [v4 ipv6NwSignature];
        *(_DWORD *)buf = 136316418;
        int v19 = "-[THThreadNetworkCredentialsKeychainBackingStore getPrefEntriesForSSIDAndSignature:]";
        __int16 v20 = 1024;
        int v21 = 3857;
        __int16 v22 = 2048;
        id v23 = v10;
        __int16 v24 = 2112;
        int v25 = v11;
        __int16 v26 = 2112;
        int v27 = v12;
        __int16 v28 = 2112;
        __int16 v29 = v13;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s : %d - Preferred Networks in Database = %lu, for network ssid :(%@), and network signature(ipv4 : %@, ipv6 : %@)", buf, 0x3Au);
      }
    }
    BOOL v14 = v7;

    id v15 = v14;
  }
  else
  {
    BOOL v14 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore getPrefEntriesForSSIDAndSignature:]();
    }
    id v15 = 0;
  }

  return v15;
}

- (id)getPrefEntriesForSSID:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v17 = "-[THThreadNetworkCredentialsKeychainBackingStore getPrefEntriesForSSID:]";
    __int16 v18 = 1024;
    int v19 = 3867;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:%d: Get preferred network for SSID", buf, 0x12u);
  }

  BOOL v6 = +[THPreferredThreadNetwork keyChainQueryForPreferredNetworkRecordsOperationForWifiNetwork:v4];
  if (v6)
  {
    id v15 = 0;
    id v7 = [(THThreadNetworkCredentialsKeychainBackingStore *)self _doFetchPreferredNetworks:v6 error:&v15];
    id v8 = v15;
    if (v7)
    {
      int v9 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = [v7 count];
        uint64_t v11 = [v4 wifiSSID];
        *(_DWORD *)buf = 136315906;
        id v17 = "-[THThreadNetworkCredentialsKeychainBackingStore getPrefEntriesForSSID:]";
        __int16 v18 = 1024;
        int v19 = 3877;
        __int16 v20 = 2048;
        id v21 = v10;
        __int16 v22 = 2112;
        id v23 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s : %d - Preferred Networks in Database = %lu, for network ssid :(%@)", buf, 0x26u);
      }
    }
    uint64_t v12 = v7;

    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v12 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore getPrefEntriesForSSID:](v4);
    }
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)getPrefEntriesForSignature:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = [v4 ipv4NwSignature];
    id v7 = [v4 ipv6NwSignature];
    *(_DWORD *)buf = 136315906;
    __int16 v20 = "-[THThreadNetworkCredentialsKeychainBackingStore getPrefEntriesForSignature:]";
    __int16 v21 = 1024;
    int v22 = 3887;
    __int16 v23 = 2112;
    id v24 = v6;
    __int16 v25 = 2112;
    __int16 v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:%d: Get preferred network for network signature(ipv4 : %@, ipv6 : %@)", buf, 0x26u);
  }
  id v8 = +[THPreferredThreadNetwork keyChainQueryForPreferredNetworkRecordsOperationForNetworkSignature:v4];
  if (v8)
  {
    id v18 = 0;
    int v9 = [(THThreadNetworkCredentialsKeychainBackingStore *)self _doFetchPreferredNetworks:v8 error:&v18];
    id v10 = v18;
    if (v9)
    {
      uint64_t v11 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = [v9 count];
        uint64_t v13 = [v4 ipv4NwSignature];
        BOOL v14 = [v4 ipv6NwSignature];
        *(_DWORD *)buf = 136316162;
        __int16 v20 = "-[THThreadNetworkCredentialsKeychainBackingStore getPrefEntriesForSignature:]";
        __int16 v21 = 1024;
        int v22 = 3898;
        __int16 v23 = 2048;
        id v24 = v12;
        __int16 v25 = 2112;
        __int16 v26 = v13;
        __int16 v27 = 2112;
        __int16 v28 = v14;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s : %d - Preferred Networks in Database = %lu, for network signature(ipv4 : %@, ipv6 : %@)", buf, 0x30u);
      }
    }
    id v15 = v9;

    long long v16 = v15;
  }
  else
  {
    id v15 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore getPrefEntriesForSignature:]();
    }
    long long v16 = 0;
  }

  return v16;
}

- (id)getAllPrefEntries
{
  id v3 = +[THPreferredThreadNetwork keyChainQueryForFetchPreferredNetworkRecordsOperation];
  if (v3)
  {
    id v10 = 0;
    id v4 = [(THThreadNetworkCredentialsKeychainBackingStore *)self _doFetchPreferredNetworks:v3 error:&v10];
    CFDictionaryRef v5 = v10;
    BOOL v6 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore getAllPrefEntries](v4);
    }

    if (v4 && [v4 count])
    {
      id v7 = v4;
    }
    else
    {
      id v8 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore getAllPrefEntries]();
      }

      id v7 = 0;
    }
  }
  else
  {
    CFDictionaryRef v5 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore getAllPrefEntries]();
    }
    id v7 = 0;
  }

  return v7;
}

- (id)getNumberOfPrefEntriesForTheCount:(int)a3
{
  id v4 = +[THPreferredThreadNetwork keyChainQueryForFetchPreferredNetworkRecordsOperationForTheCount:](THPreferredThreadNetwork, "keyChainQueryForFetchPreferredNetworkRecordsOperationForTheCount:");
  if (v4)
  {
    id v11 = 0;
    CFDictionaryRef v5 = [(THThreadNetworkCredentialsKeychainBackingStore *)self _doFetchPreferredNetworks:v4 error:&v11];
    BOOL v6 = v11;
    id v7 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore getNumberOfPrefEntriesForTheCount:](v5);
    }

    if (v5 && [v5 count])
    {
      id v8 = v5;
    }
    else
    {
      int v9 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore getNumberOfPrefEntriesForTheCount:]();
      }

      id v8 = 0;
    }
  }
  else
  {
    BOOL v6 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore getNumberOfPrefEntriesForTheCount:]();
    }
    id v8 = 0;
  }

  return v8;
}

- (BOOL)checkIfPrefEntryForCurrentSignatureIsMissingSSID:(id)a3 nwSignature:(id)a4
{
  CFDictionaryRef v5 = [(THThreadNetworkCredentialsKeychainBackingStore *)self getPrefEntriesForSignature:a4];
  BOOL v6 = v5;
  if (v5
    && [v5 count]
    && ([(THThreadNetworkCredentialsKeychainBackingStore *)self sortAndReturnPreferredNetwork:v6], (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v8 = v7;
    int v9 = [v7 networkSignature];
    unsigned __int8 v10 = [(THThreadNetworkCredentialsKeychainBackingStore *)self wifiInfoAvailable:v9];

    char v11 = v10 ^ 1;
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)updatePreferredNetwork
{
  id v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315394;
    int v19 = "-[THThreadNetworkCredentialsKeychainBackingStore updatePreferredNetwork]";
    __int16 v20 = 1024;
    int v21 = 3978;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:%d: Update preferred NW", (uint8_t *)&v18, 0x12u);
  }

  id v4 = [(THThreadNetworkCredentialsKeychainBackingStore *)self getNetworkSignature];
  if (!v4)
  {
    int v9 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore updatePreferredNetwork]();
    }
    goto LABEL_29;
  }
  if ([(THThreadNetworkCredentialsKeychainBackingStore *)self wifiInfoAvailable:v4])
  {
    CFDictionaryRef v5 = [(THThreadNetworkCredentialsKeychainBackingStore *)self getPrefEntriesForSSID:v4];
    BOOL v6 = v5;
    if (v5 && [v5 count]
      || ([(THThreadNetworkCredentialsKeychainBackingStore *)self getPrefEntriesForLabelAsSSID:v4], v7 = objc_claimAutoreleasedReturnValue(), v6, (BOOL v6 = (void *)v7) != 0))
    {
      id v8 = v6;
      if ([v6 count]) {
        goto LABEL_14;
      }
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  id v8 = [(THThreadNetworkCredentialsKeychainBackingStore *)self getPrefEntriesForSignature:v4];

  if (!v8)
  {
LABEL_23:
    id v15 = 0;
    int v9 = 0;
LABEL_26:
    long long v16 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315394;
      int v19 = "-[THThreadNetworkCredentialsKeychainBackingStore updatePreferredNetwork]";
      __int16 v20 = 1024;
      int v21 = 4035;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s : %d Preferred Network update is not required", (uint8_t *)&v18, 0x12u);
    }

LABEL_29:
    BOOL v14 = 0;
    goto LABEL_30;
  }
LABEL_14:
  if (![v8 count]) {
    goto LABEL_23;
  }
  [(THThreadNetworkCredentialsKeychainBackingStore *)self dumpPreferredNetworks:v8];
  id v8 = v8;
  unsigned __int8 v10 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[THThreadNetworkCredentialsKeychainBackingStore updatePreferredNetwork](v8);
  }

  if (![v8 count])
  {
    int v9 = 0;
LABEL_25:
    id v15 = v8;
    goto LABEL_26;
  }
  int v9 = [(THThreadNetworkCredentialsKeychainBackingStore *)self sortAndReturnPreferredNetwork:v8];
  if (!v9) {
    goto LABEL_25;
  }
  uint64_t v11 = [(THThreadNetworkCredentialsKeychainBackingStore *)self checkIfNetworkSignatureUpdateIsRequiredForPreferredNetwork:v9 nwSignature:v4];
  if (!v11) {
    goto LABEL_25;
  }
  id v12 = (void *)v11;
  uint64_t v13 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315394;
    int v19 = "-[THThreadNetworkCredentialsKeychainBackingStore updatePreferredNetwork]";
    __int16 v20 = 1024;
    int v21 = 4029;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s : %d Updated Preferred Network", (uint8_t *)&v18, 0x12u);
  }

  BOOL v14 = 1;
LABEL_30:

  return v14;
}

- (id)getPreferredNetwork:(BOOL)a3
{
  return [(THThreadNetworkCredentialsKeychainBackingStore *)self getPreferredNetwork:a3 skipScan:0];
}

- (id)getPreferredNetwork:(BOOL)a3 skipScan:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v7 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v63 = "-[THThreadNetworkCredentialsKeychainBackingStore getPreferredNetwork:skipScan:]";
    __int16 v64 = 1024;
    int v65 = 4045;
    __int16 v66 = 1024;
    LODWORD(v67) = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s:%d: Get preferred NW, onlyMdns : %d", buf, 0x18u);
  }

  id v8 = [(THThreadNetworkCredentialsKeychainBackingStore *)self getNetworkSignature];
  if (!v8)
  {
    unsigned __int8 v10 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore getPreferredNetwork:skipScan:]();
    }
    goto LABEL_25;
  }
  if ([(THThreadNetworkCredentialsKeychainBackingStore *)self wifiInfoAvailable:v8])
  {
    int v9 = [(THThreadNetworkCredentialsKeychainBackingStore *)self getPrefEntriesForSSID:v8];
    unsigned __int8 v10 = v9;
    if (v9 && [v9 count])
    {
      uint64_t v11 = [(THThreadNetworkCredentialsKeychainBackingStore *)self getPrefEntriesForSignature:v8];
      goto LABEL_12;
    }
    uint64_t v14 = [(THThreadNetworkCredentialsKeychainBackingStore *)self getPrefEntriesForLabelAsSSID:v8];

    uint64_t v11 = 0;
    id v12 = 0;
    uint64_t v13 = 0;
    unsigned __int8 v10 = v14;
    if (v14)
    {
LABEL_12:
      id v12 = v10;
      uint64_t v13 = (void *)v11;
      if ([v10 count]) {
        goto LABEL_14;
      }
    }
  }
  else
  {
    id v12 = 0;
    uint64_t v13 = 0;
  }
  unsigned __int8 v10 = [(THThreadNetworkCredentialsKeychainBackingStore *)self getPrefEntriesForSignature:v8];

  if (!v10) {
    goto LABEL_21;
  }
LABEL_14:
  if (![v10 count])
  {
LABEL_21:
    id v24 = THCredentialsServerLogHandleForCategory(1);
    __int16 v25 = v24;
    if (v4)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore getPreferredNetwork:skipScan:]();
      }

LABEL_25:
      __int16 v26 = 0;
      goto LABEL_54;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      id v27 = [v10 count];
      __int16 v28 = [v8 ipv4NwSignature];
      __int16 v29 = [v8 ipv6NwSignature];
      *(_DWORD *)buf = 136316162;
      id v63 = "-[THThreadNetworkCredentialsKeychainBackingStore getPreferredNetwork:skipScan:]";
      __int16 v64 = 1024;
      int v65 = 4104;
      __int16 v66 = 2048;
      id v67 = v27;
      __int16 v68 = 2112;
      uint64_t v69 = v28;
      __int16 v70 = 2112;
      id v71 = v29;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s : %d - Finding network on mdns and checking if it matches to any of the preferred network entry, because, at present, Preferred Networks in Database = %lu, for network signature(ipv4 : %@, ipv6 : %@)", buf, 0x30u);
    }
    int v30 = [(THThreadNetworkCredentialsKeychainBackingStore *)self getAllPrefEntries];
    __int16 v31 = v30;
    if (v30 && [v30 count])
    {
      long long v32 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore getPreferredNetwork:skipScan:].cold.4(v31);
      }

      __int16 v26 = [(THThreadNetworkCredentialsKeychainBackingStore *)self sortAndReturnPreferredNetwork:v31 onlyMdns:1];
      if (!v26) {
        goto LABEL_53;
      }
      __int16 v33 = [(THThreadNetworkCredentialsKeychainBackingStore *)self checkIfNetworkSignatureUpdateIsRequiredForPreferredNetwork:v26 nwSignature:v8];
      unsigned int v34 = v33;
      if (v33)
      {
        CFDictionaryRef v35 = v33;

        __int16 v26 = v35;
      }
      CFDictionaryRef v36 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        OSStatus v37 = [v26 network];
        int v61 = [v37 networkName];
        long long v38 = [v26 network];
        CFStringRef v59 = [v38 extendedPANID];
        long long v39 = [v26 networkSignature];
        __int16 v49 = [v39 wifiSSID];
        __int16 v51 = v39;
        long long v53 = v38;
        long long v55 = v37;
        if (v49)
        {
          long long v47 = [v26 networkSignature];
          long long v57 = [v47 wifiSSID];
        }
        else
        {
          long long v57 = &stru_1004A31D0;
        }
        int v43 = [v26 credentialsDataSetRecord];
        __int16 v44 = [v26 networkSignature];
        id v45 = [v44 wifiPassword];
        *(_DWORD *)buf = 136316674;
        id v63 = "-[THThreadNetworkCredentialsKeychainBackingStore getPreferredNetwork:skipScan:]";
        __int16 v64 = 1024;
        int v65 = 4131;
        __int16 v66 = 2112;
        id v67 = v61;
        __int16 v68 = 2112;
        uint64_t v69 = v59;
        __int16 v70 = 2112;
        id v71 = v57;
        __int16 v72 = 2048;
        long long v73 = v43;
        __int16 v74 = 2112;
        long long v75 = v45;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%s:%d: Returning the preferred network : (name : %@ | xpanid : %@), ssid : %@, DS Record = %p, label = %@", buf, 0x44u);

        if (v49)
        {
        }
      }
    }
    else
    {
      unsigned int v34 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore getPreferredNetwork:skipScan:]();
      }
      __int16 v26 = 0;
    }

LABEL_53:
    goto LABEL_54;
  }
  id v15 = [(THThreadNetworkCredentialsKeychainBackingStore *)self sortAndReturnPreferredNetwork:v10 onlyMdns:v5];
  if (v15)
  {
    long long v16 = [(THThreadNetworkCredentialsKeychainBackingStore *)self checkIfNetworkSignatureUpdateIsRequiredForPreferredNetwork:v15 nwSignature:v8 signaturePrefEntries:v13];
    id v17 = v16;
    if (v16)
    {
      id v18 = v16;

      id v15 = v18;
    }
    int v19 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      __int16 v20 = [v15 network];
      __int16 v60 = [v20 networkName];
      int v21 = [v15 network];
      uint64_t v58 = [v21 extendedPANID];
      int v22 = [v15 networkSignature];
      __int16 v23 = [v22 wifiSSID];
      BOOL v52 = v21;
      long long v54 = v20;
      uint64_t v50 = v22;
      if (v23)
      {
        long long v48 = [v15 networkSignature];
        long long v56 = [v48 wifiSSID];
      }
      else
      {
        long long v56 = &stru_1004A31D0;
      }
      id v40 = [v15 credentialsDataSetRecord];
      id v41 = [v15 networkSignature];
      __int16 v42 = [v41 wifiPassword];
      *(_DWORD *)buf = 136316674;
      id v63 = "-[THThreadNetworkCredentialsKeychainBackingStore getPreferredNetwork:skipScan:]";
      __int16 v64 = 1024;
      int v65 = 4092;
      __int16 v66 = 2112;
      id v67 = v60;
      __int16 v68 = 2112;
      uint64_t v69 = v58;
      __int16 v70 = 2112;
      id v71 = v56;
      __int16 v72 = 2048;
      long long v73 = v40;
      __int16 v74 = 2112;
      long long v75 = v42;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s:%d: Returning the preferred network : (name : %@ | xpanid : %@), ssid : %@, DS Record = %p, label = %@", buf, 0x44u);

      if (v23)
      {
      }
    }
  }
  __int16 v26 = v15;

  unsigned __int8 v10 = v26;
LABEL_54:

  return v26;
}

- (BOOL)DBGstorePreferred:(id)a3
{
  id v3 = a3;
  BOOL v4 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    long long v32 = [v3 network];
    BOOL v5 = [v32 networkName];
    __int16 v31 = [v3 network];
    BOOL v6 = [v31 extendedPANID];
    uint64_t v7 = [v3 credentialsDataSetRecord];
    id v8 = [v7 network];
    int v9 = [v8 networkName];
    [v3 credentialsDataSetRecord];
    v11 = id v10 = v3;
    id v12 = [v11 credentialsDataSet];
    uint64_t v13 = [v12 dataSetArray];
    *(_DWORD *)buf = 136316418;
    unsigned int v34 = "-[THThreadNetworkCredentialsKeychainBackingStore DBGstorePreferred:]";
    __int16 v35 = 1024;
    int v36 = 4139;
    __int16 v37 = 2112;
    long long v38 = v5;
    __int16 v39 = 2112;
    id v40 = v6;
    __int16 v41 = 2112;
    __int16 v42 = v9;
    __int16 v43 = 2112;
    __int16 v44 = v13;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s:%d:Request to store Preferred Network (networkName=%@, xpanid=%@), with record name : %@ dataset : %@", buf, 0x3Au);

    id v3 = v10;
  }

  CFDictionaryRef v14 = [v3 DEBUGkeyChainItemRepresentationForpreferredNetworkAddOperation];
  CFDictionaryRef v15 = v14;
  if (!v14)
  {
    id v24 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore DBGstorePreferred:]();
    }
    goto LABEL_17;
  }
  OSStatus v16 = SecItemAdd(v14, 0);
  if (v16 == -25299)
  {
    id v17 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = [v3 network];
      int v19 = [v18 networkName];
      *(_DWORD *)buf = 136315650;
      unsigned int v34 = "-[THThreadNetworkCredentialsKeychainBackingStore DBGstorePreferred:]";
      __int16 v35 = 1024;
      int v36 = 4152;
      __int16 v37 = 2112;
      long long v38 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s:%d: Preferred network (name : %@) already exists. Updating the existing entry", buf, 0x1Cu);
    }
    CFDictionaryRef v20 = [v3 DEBUGkeyChainQueryForpreferredNetworkUpdateOperation];
    CFDictionaryRef v21 = [v3 keyChainItemRepresentationForpreferredNetworkUpdateOperation];
    OSStatus v16 = SecItemUpdate(v20, v21);
    if (v16)
    {
      int v22 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        unsigned int v34 = "-[THThreadNetworkCredentialsKeychainBackingStore DBGstorePreferred:]";
        __int16 v35 = 1024;
        int v36 = 4158;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s:%d SecItemUpdate returned error while updating preferred network entry", buf, 0x12u);
      }
    }
  }
  __int16 v23 = THCredentialsServerLogHandleForCategory(1);
  id v24 = v23;
  if (v16)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore DBGstorePreferred:]();
    }
LABEL_17:
    BOOL v25 = 0;
    goto LABEL_18;
  }
  BOOL v25 = 1;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    id v27 = [v3 network];
    __int16 v28 = [v27 networkName];
    __int16 v29 = [v3 network];
    int v30 = [v29 extendedPANID];
    *(_DWORD *)buf = 136315906;
    unsigned int v34 = "-[THThreadNetworkCredentialsKeychainBackingStore DBGstorePreferred:]";
    __int16 v35 = 1024;
    int v36 = 4167;
    __int16 v37 = 2112;
    long long v38 = v28;
    __int16 v39 = 2112;
    id v40 = v30;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s:%d:#mOS:Successfully stored Preferred Network (networkName=%@, xpanid=%@)", buf, 0x26u);
  }
LABEL_18:

  return v25;
}

- (BOOL)storePreferred:(id)a3
{
  id v3 = a3;
  BOOL v4 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    __int16 v31 = [v3 network];
    CFDictionaryRef v5 = [v31 networkName];
    int v30 = [v3 network];
    CFDictionaryRef v6 = [v30 extendedPANID];
    uint64_t v7 = [v3 credentialsDataSetRecord];
    id v8 = [v7 network];
    int v9 = [v8 networkName];
    [v3 credentialsDataSetRecord];
    v11 = id v10 = v3;
    id v12 = [v11 credentialsDataSet];
    uint64_t v13 = [v12 dataSetArray];
    *(_DWORD *)buf = 136316418;
    __int16 v33 = "-[THThreadNetworkCredentialsKeychainBackingStore storePreferred:]";
    __int16 v34 = 1024;
    int v35 = 4173;
    __int16 v36 = 2112;
    CFDictionaryRef v37 = v5;
    __int16 v38 = 2112;
    CFDictionaryRef v39 = v6;
    __int16 v40 = 2112;
    __int16 v41 = v9;
    __int16 v42 = 2112;
    __int16 v43 = v13;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s:%d:Request to store Preferred Network (networkName=%@, xpanid=%@), with record name : %@ dataset : %@", buf, 0x3Au);

    id v3 = v10;
  }

  CFDictionaryRef v14 = [v3 keyChainItemRepresentationForpreferredNetworkAddOperation];
  CFDictionaryRef v15 = THCredentialsServerLogHandleForCategory(1);
  OSStatus v16 = v15;
  if (!v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore storePreferred:]();
    }
    goto LABEL_21;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v33 = "-[THThreadNetworkCredentialsKeychainBackingStore storePreferred:]";
    __int16 v34 = 1024;
    int v35 = 4182;
    __int16 v36 = 2112;
    CFDictionaryRef v37 = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s:%d: SIA: Add keychain query dictionary keychainAddDict: %@", buf, 0x1Cu);
  }

  OSStatus v17 = SecItemAdd(v14, 0);
  if (v17 == -25299)
  {
    id v18 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore storePreferred:](v3);
    }

    CFDictionaryRef v19 = [v3 keyChainQueryForpreferredNetworkUpdateOperation];
    CFDictionaryRef v20 = [v3 keyChainItemRepresentationForpreferredNetworkUpdateOperation];
    CFDictionaryRef v21 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      __int16 v33 = "-[THThreadNetworkCredentialsKeychainBackingStore storePreferred:]";
      __int16 v34 = 1024;
      int v35 = 4193;
      __int16 v36 = 2112;
      CFDictionaryRef v37 = v19;
      __int16 v38 = 2112;
      CFDictionaryRef v39 = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s:%d: SIU: Update keychain query dictionary keychainQueryDict: %@, representation keychainUpdateDict : %@", buf, 0x26u);
    }

    OSStatus v17 = SecItemUpdate(v19, v20);
    if (v17)
    {
      int v22 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v33 = "-[THThreadNetworkCredentialsKeychainBackingStore storePreferred:]";
        __int16 v34 = 1024;
        int v35 = 4197;
        __int16 v36 = 1024;
        LODWORD(v37) = v17;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s:%d SecItemUpdate returned error while updating preferred network entry err=%d", buf, 0x18u);
      }
    }
  }
  __int16 v23 = THCredentialsServerLogHandleForCategory(1);
  OSStatus v16 = v23;
  if (v17)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore storePreferred:]();
    }
LABEL_21:
    BOOL v24 = 0;
    goto LABEL_22;
  }
  BOOL v24 = 1;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    __int16 v26 = [v3 network];
    CFDictionaryRef v27 = [v26 networkName];
    __int16 v28 = [v3 network];
    CFDictionaryRef v29 = [v28 extendedPANID];
    *(_DWORD *)buf = 136315906;
    __int16 v33 = "-[THThreadNetworkCredentialsKeychainBackingStore storePreferred:]";
    __int16 v34 = 1024;
    int v35 = 4206;
    __int16 v36 = 2112;
    CFDictionaryRef v37 = v27;
    __int16 v38 = 2112;
    CFDictionaryRef v39 = v29;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s:%d:#mOS:Successfully stored Preferred Network (networkName=%@, xpanid=%@)", buf, 0x26u);
  }
LABEL_22:

  return v24;
}

- (BOOL)storePreferredEntryAndCheckForDup:(id)a3 isDuplicate:(int *)a4
{
  id v5 = a3;
  CFDictionaryRef v6 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v35 = [v5 network];
    uint64_t v7 = [v35 networkName];
    __int16 v34 = [v5 network];
    CFDictionaryRef v8 = [v34 extendedPANID];
    [v5 credentialsDataSetRecord];
    int v9 = v36 = a4;
    id v10 = [v9 network];
    uint64_t v11 = [v10 networkName];
    id v12 = [v5 credentialsDataSetRecord];
    [v12 credentialsDataSet];
    v14 = id v13 = v5;
    CFDictionaryRef v15 = [v14 dataSetArray];
    *(_DWORD *)buf = 136316418;
    __int16 v38 = "-[THThreadNetworkCredentialsKeychainBackingStore storePreferredEntryAndCheckForDup:isDuplicate:]";
    __int16 v39 = 1024;
    int v40 = 4213;
    __int16 v41 = 2112;
    *(void *)__int16 v42 = v7;
    *(_WORD *)&v42[8] = 2112;
    CFDictionaryRef v43 = v8;
    __int16 v44 = 2112;
    id v45 = v11;
    __int16 v46 = 2112;
    long long v47 = v15;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s:%d:Request to store Preferred Network (networkName=%@, xpanid=%@), with record name : %@ dataset : %@", buf, 0x3Au);

    id v5 = v13;
    a4 = v36;
  }
  CFDictionaryRef v16 = [v5 keyChainItemRepresentationForpreferredNetworkAddOperation];
  OSStatus v17 = THCredentialsServerLogHandleForCategory(1);
  id v18 = v17;
  if (!v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore storePreferredEntryAndCheckForDup:isDuplicate:]();
    }
    goto LABEL_22;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v38 = "-[THThreadNetworkCredentialsKeychainBackingStore storePreferredEntryAndCheckForDup:isDuplicate:]";
    __int16 v39 = 1024;
    int v40 = 4222;
    __int16 v41 = 2112;
    *(void *)__int16 v42 = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s:%d: SIA: Add keychain query dictionary keychainAddDict: %@", buf, 0x1Cu);
  }

  OSStatus v19 = SecItemAdd(v16, 0);
  if (v19 == -25299)
  {
    CFDictionaryRef v20 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore storePreferredEntryAndCheckForDup:isDuplicate:].cold.4(v5);
    }

    CFDictionaryRef v21 = [v5 keyChainQueryForpreferredNetworkUpdateOperation];
    CFDictionaryRef v22 = [v5 keyChainItemRepresentationForpreferredNetworkUpdateOperation];
    __int16 v23 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      __int16 v38 = "-[THThreadNetworkCredentialsKeychainBackingStore storePreferredEntryAndCheckForDup:isDuplicate:]";
      __int16 v39 = 1024;
      int v40 = 4233;
      __int16 v41 = 2112;
      *(void *)__int16 v42 = v21;
      *(_WORD *)&v42[8] = 2112;
      CFDictionaryRef v43 = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s:%d: SIU: Update keychain query dictionary keychainQueryDict: %@, representation keychainUpdateDict : %@", buf, 0x26u);
    }

    OSStatus v19 = SecItemUpdate(v21, v22);
    if (v19)
    {
      BOOL v24 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore storePreferredEntryAndCheckForDup:isDuplicate:]();
      }
    }
    else
    {
      *a4 = 1;
      BOOL v24 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        int v25 = *a4;
        *(_DWORD *)buf = 136315906;
        __int16 v38 = "-[THThreadNetworkCredentialsKeychainBackingStore storePreferredEntryAndCheckForDup:isDuplicate:]";
        __int16 v39 = 1024;
        int v40 = 4240;
        __int16 v41 = 1024;
        *(_DWORD *)__int16 v42 = 0;
        *(_WORD *)&v42[4] = 1024;
        *(_DWORD *)&v42[6] = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s:%d SecItemUpdate is successful in updating preferred network entry !!  (err=%d) isDuplicate : %d", buf, 0x1Eu);
      }
    }
  }
  __int16 v26 = THCredentialsServerLogHandleForCategory(1);
  id v18 = v26;
  if (v19)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore storePreferredEntryAndCheckForDup:isDuplicate:]();
    }
LABEL_22:
    BOOL v27 = 0;
    goto LABEL_23;
  }
  BOOL v27 = 1;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    CFDictionaryRef v29 = [v5 network];
    [v29 networkName];
    v31 = int v30 = v5;
    long long v32 = [v30 network];
    CFDictionaryRef v33 = [v32 extendedPANID];
    *(_DWORD *)buf = 136315906;
    __int16 v38 = "-[THThreadNetworkCredentialsKeychainBackingStore storePreferredEntryAndCheckForDup:isDuplicate:]";
    __int16 v39 = 1024;
    int v40 = 4250;
    __int16 v41 = 2112;
    *(void *)__int16 v42 = v31;
    *(_WORD *)&v42[8] = 2112;
    CFDictionaryRef v43 = v33;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s:%d:#mOS:Successfully stored Preferred Network (networkName=%@, xpanid=%@)", buf, 0x26u);

    id v5 = v30;
  }
LABEL_23:

  return v27;
}

- (BOOL)storeFrozenThreadNetwork:(id)a3
{
  id v3 = a3;
  BOOL v4 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [v3 credentialsDataSet];
    CFDictionaryRef v6 = [v5 dataSetArray];
    int v15 = 136315650;
    CFDictionaryRef v16 = "-[THThreadNetworkCredentialsKeychainBackingStore storeFrozenThreadNetwork:]";
    __int16 v17 = 1024;
    int v18 = 4256;
    __int16 v19 = 2112;
    CFDictionaryRef v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s:%d: Request to freeze thread network with dataset %@", (uint8_t *)&v15, 0x1Cu);
  }
  CFDictionaryRef v7 = [v3 keyChainItemRepresentationForFrozenThreadNetworkAddOperation];
  CFDictionaryRef v8 = v7;
  if (!v7)
  {
    uint64_t v11 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore storeFrozenThreadNetwork:](v3);
    }
    goto LABEL_14;
  }
  OSStatus v9 = SecItemAdd(v7, 0);
  if (v9)
  {
    if (v9 == -25299)
    {
      BOOL v10 = 1;
      uint64_t v11 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore storeFrozenThreadNetwork:]();
      }
      goto LABEL_15;
    }
    uint64_t v11 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore storeFrozenThreadNetwork:](v3);
    }
LABEL_14:
    BOOL v10 = 0;
    goto LABEL_15;
  }
  BOOL v10 = 1;
  uint64_t v11 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = [v3 credentialsDataSet];
    id v13 = [v12 dataSetArray];
    int v15 = 136315650;
    CFDictionaryRef v16 = "-[THThreadNetworkCredentialsKeychainBackingStore storeFrozenThreadNetwork:]";
    __int16 v17 = 1024;
    int v18 = 4278;
    __int16 v19 = 2112;
    CFDictionaryRef v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s:%d: Successfully stored frozen thread network to keychain : %@", (uint8_t *)&v15, 0x1Cu);
  }
LABEL_15:

  return v10;
}

- (BOOL)isWiFiNetwork
{
  id v2 = [objc_alloc((Class)NWPathEvaluator) initWithEndpoint:0 parameters:0];
  if (v2)
  {
    id v3 = v2;
    BOOL v4 = [v2 path];
    unsigned __int8 v5 = [v4 usesInterfaceType:1];

    LOBYTE(v2) = v5;
  }
  return (char)v2;
}

- (BOOL)isEthernetNetwork
{
  id v2 = [objc_alloc((Class)NWPathEvaluator) initWithEndpoint:0 parameters:0];
  if (v2)
  {
    id v3 = v2;
    BOOL v4 = [v2 path];
    unsigned __int8 v5 = [v4 usesInterfaceType:3];

    LOBYTE(v2) = v5;
  }
  return (char)v2;
}

- (id)getNetworkSignature
{
  unsigned __int8 v43 = 20;
  unsigned __int8 v42 = 20;
  v57[0] = 0;
  v57[1] = 0;
  v56[0] = 0;
  v56[1] = 0;
  id v3 = +[NSUUID UUID];
  [v3 getUUIDBytes:v57];

  BOOL v4 = +[NSUUID UUID];
  [v4 getUUIDBytes:v56];

  uint64_t v5 = +[NSData dataWithBytes:v57 length:20];
  CFDictionaryRef v6 = +[NSData dataWithBytes:v56 length:20];
  CFDictionaryRef v7 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v45 = "-[THThreadNetworkCredentialsKeychainBackingStore getNetworkSignature]";
    __int16 v46 = 1024;
    int v47 = 4336;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s:%d Entered to get the nw signature ", buf, 0x12u);
  }

  unsigned int v8 = [(THThreadNetworkCredentialsKeychainBackingStore *)self isEthernetNetwork];
  if (v8)
  {
    OSStatus v9 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v45 = "-[THThreadNetworkCredentialsKeychainBackingStore getNetworkSignature]";
      __int16 v46 = 1024;
      int v47 = 4343;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s:%d Device is on Ethernet", buf, 0x12u);
    }
  }
  if ([(THThreadNetworkCredentialsKeychainBackingStore *)self isWiFiNetwork])
  {
    uint64_t v11 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v45 = "-[THThreadNetworkCredentialsKeychainBackingStore getNetworkSignature]";
      __int16 v46 = 1024;
      int v47 = 4348;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s:%d Device is on WiFi", buf, 0x12u);
    }
  }
  else if (v8 != 1)
  {
    id v13 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore getNetworkSignature]();
    }
    __int16 v34 = 0;
    goto LABEL_59;
  }
  int v40 = v6;
  uint64_t v41 = v5;
  int v12 = 0;
  id v13 = 0;
  LOBYTE(v5) = 0;
  char v14 = 0;
  *(void *)&long long v10 = 136315906;
  long long v39 = v10;
  do
  {
    int v15 = v13;
    if (v12) {
      sleep(2u);
    }
    id v13 = +[NetworkPathFinder getNetworkPath];

    CFDictionaryRef v16 = THCredentialsServerLogHandleForCategory(1);
    __int16 v17 = v16;
    if (v13)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        id v45 = "-[THThreadNetworkCredentialsKeychainBackingStore getNetworkSignature]";
        __int16 v46 = 1024;
        int v47 = 4369;
        __int16 v48 = 2112;
        *(void *)__int16 v49 = v13;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s:%d Network path = %@", buf, 0x1Cu);
      }

      __int16 v17 = nw_path_copy_interface();
      has_ipBOOL v4 = nw_path_has_ipv4(v13);
      has_ipCFDictionaryRef v6 = nw_path_has_ipv6(v13);
      CFDictionaryRef v20 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        id v45 = "-[THThreadNetworkCredentialsKeychainBackingStore getNetworkSignature]";
        __int16 v46 = 1024;
        int v47 = 4374;
        __int16 v48 = 2112;
        *(void *)__int16 v49 = v17;
        *(_WORD *)&v49[8] = 1024;
        *(_DWORD *)&v49[10] = has_ipv4;
        __int16 v50 = 1024;
        int v51 = has_ipv6;
        __int16 v52 = 1024;
        LODWORD(v53) = v12;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s:%d Network path Interface = %@, has_ipv4 = %d, has_ipCFDictionaryRef v6 = %d, retry : %d", buf, 0x2Eu);
      }

      if (!has_ipv4 && !has_ipv6)
      {
        __int16 v23 = THCredentialsServerLogHandleForCategory(1);
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
LABEL_38:

          goto LABEL_39;
        }
        *(_DWORD *)buf = 136315394;
        id v45 = "-[THThreadNetworkCredentialsKeychainBackingStore getNetworkSignature]";
        __int16 v46 = 1024;
        int v47 = 4377;
        BOOL v24 = v23;
        int v25 = "%s:%d Error : doesn't have ipv4 and ipv6 network signatures, retrying...";
LABEL_34:
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v25, buf, 0x12u);
        goto LABEL_38;
      }
      LODWORD(v5) = nw_path_get_ipv4_network_signature();
      int ipv6_network_signature = nw_path_get_ipv6_network_signature();
      char v14 = ipv6_network_signature;
      if (v5)
      {
        if ((ipv6_network_signature & 1) == 0)
        {
          int v22 = 0;
          unsigned __int8 v42 = 0;
          goto LABEL_30;
        }
      }
      else
      {
        unsigned __int8 v43 = 0;
        if (!ipv6_network_signature)
        {
          unsigned __int8 v42 = 0;
          __int16 v23 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v39;
            id v45 = "-[THThreadNetworkCredentialsKeychainBackingStore getNetworkSignature]";
            __int16 v46 = 1024;
            int v47 = 4389;
            __int16 v48 = 1024;
            *(_DWORD *)__int16 v49 = 0;
            *(_WORD *)&v49[4] = 1024;
            *(_DWORD *)&v49[6] = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s:%d Error : doesn't have the correct ipv4 [ret = %d] and ipv6 [ret = %d] network signatures, retrying..", buf, 0x1Eu);
            char v14 = 0;
          }
          LOBYTE(v5) = 0;
          goto LABEL_38;
        }
      }
      int v22 = v42;
LABEL_30:
      int v26 = 1;
      if (v43 || v22) {
        goto LABEL_43;
      }
      __int16 v23 = THCredentialsServerLogHandleForCategory(1);
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        goto LABEL_38;
      }
      *(_DWORD *)buf = 136315394;
      id v45 = "-[THThreadNetworkCredentialsKeychainBackingStore getNetworkSignature]";
      __int16 v46 = 1024;
      int v47 = 4394;
      BOOL v24 = v23;
      int v25 = "%s:%d Error : ipv4 and ipv6 network signature length is zero, retrying";
      goto LABEL_34;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v45 = "-[THThreadNetworkCredentialsKeychainBackingStore getNetworkSignature]";
      __int16 v46 = 1024;
      int v47 = 4365;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s:%d Failed to create Network Path Finder", buf, 0x12u);
    }
LABEL_39:

    ++v12;
  }
  while (v12 != 5);
  __int16 v17 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[THThreadNetworkCredentialsKeychainBackingStore getNetworkSignature]();
  }
  int v26 = 0;
LABEL_43:

  BOOL v27 = (void *)WiFiCopyCurrentNetworkInfoEx();
  __int16 v28 = &stru_1004A31D0;
  if (v27)
  {
    CFDictionaryRef v29 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = [v27 objectForKey:@"ssid"];
      *(_DWORD *)buf = 136315650;
      id v45 = "-[THThreadNetworkCredentialsKeychainBackingStore getNetworkSignature]";
      __int16 v46 = 1024;
      int v47 = 4415;
      __int16 v48 = 2112;
      *(void *)__int16 v49 = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s:%d Network Information Wifi SSID : %@", buf, 0x1Cu);
    }
    uint64_t v31 = [v27 objectForKey:@"ssid"];
    if (v31) {
      __int16 v28 = (__CFString *)v31;
    }
  }
  id v32 = objc_alloc((Class)THNetworkSignature);
  if (v26) {
    id v33 = [v32 initSignaturesWithArrays:v59 ipv4BytesLen:v43 ipv6Bytes:v58 ipv6BytesLen:v42 wifSSID:v28 wifiPassword:@"ApplePreferredNetworkRecordLabel"];
  }
  else {
    id v33 = [v32 initWithSignatures:v41 ipv6NwSignature:v40 wifSSID:v28 wifiPassword:@"ApplePreferredNetworkRecordLabel"];
  }
  __int16 v34 = v33;
  if (v33)
  {
    int v35 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v36 = [v34 ipv4NwSignature];
      CFDictionaryRef v37 = [v34 ipv6NwSignature];
      *(_DWORD *)buf = 136316674;
      id v45 = "-[THThreadNetworkCredentialsKeychainBackingStore getNetworkSignature]";
      __int16 v46 = 1024;
      int v47 = 4431;
      __int16 v48 = 1024;
      *(_DWORD *)__int16 v49 = v5 & 1;
      *(_WORD *)&v49[4] = 2112;
      *(void *)&v49[6] = v36;
      __int16 v50 = 1024;
      int v51 = v14 & 1;
      __int16 v52 = 2112;
      long long v53 = v37;
      __int16 v54 = 2112;
      long long v55 = v28;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%s:%d ipv4 signature : [ret = %d]%@, ipv6 signature : [ret = %d]%@ , ssid : %@", buf, 0x3Cu);
    }
  }

  CFDictionaryRef v6 = v40;
  uint64_t v5 = v41;
LABEL_59:

  return v34;
}

- (void)dispatchRemoveInActiveRecords:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v6 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFDictionaryRef v7 = [v4 network];
    unsigned int v8 = [v7 networkName];
    *(_DWORD *)buf = 136315650;
    id v62 = "-[THThreadNetworkCredentialsKeychainBackingStore dispatchRemoveInActiveRecords:]";
    __int16 v63 = 1024;
    *(_DWORD *)__int16 v64 = 4440;
    *(_WORD *)&v64[4] = 2112;
    *(void *)&v64[6] = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s:%d: Remove inactive records for Preferred network Network Name : %@", buf, 0x1Cu);
  }
  OSStatus v9 = [v4 network];
  long long v10 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchActiveDataSetRecordsOperationForNetwork:v9];

  id v59 = 0;
  uint64_t v11 = [(THThreadNetworkCredentialsKeychainBackingStore *)self _doFetchActiveDataSetRecords:v10 error:&v59];
  id v12 = v59;
  id v13 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [v11 count];
    *(_DWORD *)buf = 136315650;
    id v62 = "-[THThreadNetworkCredentialsKeychainBackingStore dispatchRemoveInActiveRecords:]";
    __int16 v63 = 1024;
    *(_DWORD *)__int16 v64 = 4449;
    *(_WORD *)&v64[4] = 2048;
    *(void *)&v64[6] = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s:%d: : Size of record list : %lu", buf, 0x1Cu);
  }

  __int16 v54 = v11;
  if ((unint64_t)[v11 count] > 1)
  {
    int v51 = v5;
    id v52 = v12;
    long long v53 = v10;
    if ((unint64_t)[v11 count] >= 0x191)
    {
      int v18 = [v11 allObjects];
      __int16 v19 = +[NSMutableArray arrayWithArray:v18];

      if (v19)
      {
        CFDictionaryRef v20 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          id v62 = "-[THThreadNetworkCredentialsKeychainBackingStore dispatchRemoveInActiveRecords:]";
          __int16 v63 = 1024;
          *(_DWORD *)__int16 v64 = 4466;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s:%d: Deleting excess active dataset record", buf, 0x12u);
        }

        [v19 sortUsingComparator:&__block_literal_global_182];
        if ([v11 count] != (id)400)
        {
          CFDictionaryRef v21 = 0;
          do
          {
            int v22 = [v19 objectAtIndexedSubscript:v21];
            __int16 v23 = [v22 borderAgent];
            CFDictionaryRef v24 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForDeleteActiveDataSetOperationForThreadNetworkBorderAgent:v23];

            if (v24)
            {
              OSStatus v25 = SecItemDelete(v24);
              int v26 = THCredentialsServerLogHandleForCategory(1);
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                BOOL v27 = [v19 objectAtIndexedSubscript:0];
                __int16 v28 = [v27 borderAgent];
                CFDictionaryRef v29 = [v28 discriminatorId];
                *(_DWORD *)buf = 136315650;
                id v62 = "-[THThreadNetworkCredentialsKeychainBackingStore dispatchRemoveInActiveRecords:]";
                __int16 v63 = 2112;
                *(void *)__int16 v64 = v29;
                *(_WORD *)&v64[8] = 1024;
                *(_DWORD *)&v64[10] = v25;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s : Deleting excess record BA ID : %@, got on deletion : (err=%d)", buf, 0x1Cu);

                uint64_t v11 = v54;
              }
            }
            ++v21;
          }
          while (v21 < (char *)[v11 count] - 400);
        }
      }

      id v12 = v52;
      long long v10 = v53;
    }
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    int v15 = v11;
    id v30 = [v15 countByEnumeratingWithState:&v55 objects:v60 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v56;
      id v33 = &exit_ptr;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v56 != v32) {
            objc_enumerationMutation(v15);
          }
          int v35 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          __int16 v36 = [v35 credentials];
          unsigned __int8 v37 = [v36 isActiveDevice];

          if ((v37 & 1) == 0)
          {
            __int16 v38 = [v35 borderAgent];
            long long v39 = [v38 discriminatorId];

            if (v39)
            {
              int v40 = v33[335];
              uint64_t v41 = [v35 borderAgent];
              CFDictionaryRef v42 = [v40 keyChainQueryForDeleteActiveDataSetOperationForThreadNetworkBorderAgent:v41];

              if (v42)
              {
                OSStatus v43 = SecItemDelete(v42);
                __int16 v44 = THCredentialsServerLogHandleForCategory(1);
                if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
                {
                  id v45 = [v35 borderAgent];
                  __int16 v46 = [v45 discriminatorId];
                  *(_DWORD *)buf = 136315650;
                  id v62 = "-[THThreadNetworkCredentialsKeychainBackingStore dispatchRemoveInActiveRecords:]";
                  __int16 v63 = 2112;
                  *(void *)__int16 v64 = v46;
                  *(_WORD *)&v64[8] = 1024;
                  *(_DWORD *)&v64[10] = v43;
                  _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "%s : BA ID : %@, got on deletion : (err=%d)", buf, 0x1Cu);

                  id v33 = &exit_ptr;
                }
              }
              else
              {
                __int16 v44 = THCredentialsServerLogHandleForCategory(1);
                if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                {
                  __int16 v49 = [v35 network];
                  __int16 v50 = [v49 networkName];
                  *(_DWORD *)buf = 136315394;
                  id v62 = "-[THThreadNetworkCredentialsKeychainBackingStore dispatchRemoveInActiveRecords:]";
                  __int16 v63 = 2112;
                  *(void *)__int16 v64 = v50;
                  _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%s : Could not form Keychain Query for Network : %@, continue..", buf, 0x16u);
                }
              }
            }
            else
            {
              THCredentialsServerLogHandleForCategory(1);
              CFDictionaryRef v42 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_INFO))
              {
                int v47 = [v35 network];
                __int16 v48 = [v47 networkName];
                *(_DWORD *)buf = 136315394;
                id v62 = "-[THThreadNetworkCredentialsKeychainBackingStore dispatchRemoveInActiveRecords:]";
                __int16 v63 = 2112;
                *(void *)__int16 v64 = v48;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)v42, OS_LOG_TYPE_INFO, "%s : Border Agent DiscriminatorId is Nil.. for Network : %@, continue..", buf, 0x16u);
              }
            }
          }
        }
        id v31 = [v15 countByEnumeratingWithState:&v55 objects:v60 count:16];
      }
      while (v31);
      uint64_t v5 = v51;
      id v12 = v52;
      long long v10 = v53;
    }
  }
  else
  {
    int v15 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      CFDictionaryRef v16 = [v4 network];
      __int16 v17 = [v16 networkName];
      *(_DWORD *)buf = 136315650;
      id v62 = "-[THThreadNetworkCredentialsKeychainBackingStore dispatchRemoveInActiveRecords:]";
      __int16 v63 = 1024;
      *(_DWORD *)__int16 v64 = 4453;
      *(_WORD *)&v64[4] = 2112;
      *(void *)&v64[6] = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s:%d: Skip clearing it: %@", buf, 0x1Cu);
    }
  }
}

int64_t __80__THThreadNetworkCredentialsKeychainBackingStore_dispatchRemoveInActiveRecords___block_invoke(id a1, id a2, id a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 lastModificationDate];
  CFDictionaryRef v6 = [v4 lastModificationDate];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

- (void)dispatchRemoveExcessPreferredEntry
{
  [a1 count];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, v1, v2, "%s : %d - Preferred Networks in Database = %lu", v3, v4, v5, v6, 2u);
}

int64_t __84__THThreadNetworkCredentialsKeychainBackingStore_dispatchRemoveExcessPreferredEntry__block_invoke(id a1, id a2, id a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 lastModificationDate];
  uint64_t v6 = [v4 lastModificationDate];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

- (id)getPreferredNetworkWithRecords
{
  uint64_t v3 = [(THThreadNetworkCredentialsKeychainBackingStore *)self getPreferredNetwork:0];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 credentialsDataSetRecord];

    uint64_t v6 = THCredentialsServerLogHandleForCategory(1);
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if (v5)
    {
      if (v7)
      {
        unsigned __int8 v37 = [v4 network];
        unsigned int v8 = [v37 networkName];
        __int16 v36 = [v4 network];
        OSStatus v9 = [v36 extendedPANID];
        long long v10 = [v4 credentialsDataSetRecord];
        uint64_t v11 = [v10 network];
        id v12 = [v11 networkName];
        id v13 = [v4 credentialsDataSetRecord];
        id v14 = [v13 credentialsDataSet];
        int v15 = [v14 dataSetArray];
        *(_DWORD *)buf = 136316418;
        int v40 = "-[THThreadNetworkCredentialsKeychainBackingStore getPreferredNetworkWithRecords]";
        __int16 v41 = 1024;
        *(_DWORD *)CFDictionaryRef v42 = 4598;
        *(_WORD *)&v42[4] = 2112;
        *(void *)&v42[6] = v8;
        __int16 v43 = 2112;
        __int16 v44 = v9;
        __int16 v45 = 2112;
        __int16 v46 = v12;
        __int16 v47 = 2112;
        __int16 v48 = v15;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s:%d: This preferred network entry has record associated with it, returning the same preferred network : (networkName=%@, xpanid=%@), with record name : %@ dataset : %@", buf, 0x3Au);
      }
      id v16 = v4;
      goto LABEL_26;
    }
    if (v7)
    {
      int v18 = [v4 network];
      __int16 v19 = [v18 networkName];
      CFDictionaryRef v20 = [v4 network];
      CFDictionaryRef v21 = [v20 extendedPANID];
      *(_DWORD *)buf = 136315906;
      int v40 = "-[THThreadNetworkCredentialsKeychainBackingStore getPreferredNetworkWithRecords]";
      __int16 v41 = 1024;
      *(_DWORD *)CFDictionaryRef v42 = 4606;
      *(_WORD *)&v42[4] = 2112;
      *(void *)&v42[6] = v19;
      __int16 v43 = 2112;
      __int16 v44 = v21;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s : %d - Request to check how many active dataset records are present for preferred network (name=%@, xpanid=%@)", buf, 0x26u);
    }
    int v22 = [v4 network];
    __int16 v23 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchActiveDataSetRecordsOperationForNetwork:v22];

    id v38 = 0;
    CFDictionaryRef v24 = [(THThreadNetworkCredentialsKeychainBackingStore *)self _doFetchActiveDataSetRecords:v23 error:&v38];
    id v25 = v38;
    int v26 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      id v27 = [v24 count];
      *(_DWORD *)buf = 136315650;
      int v40 = "-[THThreadNetworkCredentialsKeychainBackingStore getPreferredNetworkWithRecords]";
      __int16 v41 = 1024;
      *(_DWORD *)CFDictionaryRef v42 = 4613;
      *(_WORD *)&v42[4] = 2048;
      *(void *)&v42[6] = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s:%d: Preferred Network present and the matching Active dataset records size is: %lu", buf, 0x1Cu);
    }

    if ([v24 count])
    {
      id v16 = v4;
LABEL_25:

      goto LABEL_26;
    }
    CFDictionaryRef v28 = +[THPreferredThreadNetwork keyChainQueryForDeletePreferredNetworkRecord:v4];
    CFDictionaryRef v29 = v28;
    if (v28)
    {
      OSStatus v30 = SecItemDelete(v28);
      id v31 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v32 = [v4 network];
        id v33 = [v32 networkName];
        *(_DWORD *)buf = 136315650;
        int v40 = "-[THThreadNetworkCredentialsKeychainBackingStore getPreferredNetworkWithRecords]";
        __int16 v41 = 2112;
        *(void *)CFDictionaryRef v42 = v33;
        *(_WORD *)&v42[8] = 1024;
        *(_DWORD *)&unsigned char v42[10] = v30;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%s: Preferred Network : %@, Deletion result :(err=%d)", buf, 0x1Cu);
      }
      if (!v30) {
        goto LABEL_24;
      }
      __int16 v34 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore getPreferredNetworkWithRecords](v4);
      }
    }
    else
    {
      __int16 v34 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore getPreferredNetworkWithRecords]();
      }
    }

LABEL_24:
    id v16 = 0;
    goto LABEL_25;
  }
  __int16 v17 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[THThreadNetworkCredentialsKeychainBackingStore getPreferredNetworkWithRecords]();
  }

  id v16 = 0;
LABEL_26:

  return v16;
}

- (BOOL)updatePreferredNetworkEntry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4 || ([v4 credentialsDataSet], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_14:
    id v14 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore updatePreferredNetworkEntry:]();
    }
    goto LABEL_16;
  }
  BOOL v7 = (void *)v6;
  unsigned int v8 = [v5 credentialsDataSet];
  uint64_t v9 = [v8 dataSetArray];
  if (!v9)
  {

    goto LABEL_14;
  }
  long long v10 = (void *)v9;
  uint64_t v11 = [v5 credentialsDataSet];
  id v12 = [v11 dataSetArray];
  id v13 = [v12 length];

  if (!v13) {
    goto LABEL_14;
  }
  id v14 = [(THThreadNetworkCredentialsKeychainBackingStore *)self getPreferredNetwork:0];
  if (v14)
  {
    int v15 = [v5 network];
    id v16 = [v5 borderAgent];
    __int16 v17 = [(THThreadNetworkCredentialsKeychainBackingStore *)self getActiveDataSetRecordForNetworkAndBorderAgentId:v15 borderAgent:v16];

    id v18 = objc_alloc((Class)THPreferredThreadNetwork);
    __int16 v19 = [v17 network];
    CFDictionaryRef v20 = [v14 networkSignature];
    CFDictionaryRef v21 = [v14 userInfo];
    id v22 = [v18 initWithThreadNetwork:v19 networkSignature:v20 credentialsDataSetRecord:v17 creationDate:0 lastModificationDate:0 userInfo:v21];

    if (v22)
    {
      unsigned int v23 = [(THThreadNetworkCredentialsKeychainBackingStore *)self storePreferred:v22];
      CFDictionaryRef v24 = THCredentialsServerLogHandleForCategory(1);
      id v25 = v24;
      if (v23)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          int v26 = [v22 network];
          id v27 = [v26 networkName];
          *(_DWORD *)buf = 136315650;
          CFDictionaryRef v42 = "-[THThreadNetworkCredentialsKeychainBackingStore updatePreferredNetworkEntry:]";
          __int16 v43 = 1024;
          int v44 = 4665;
          __int16 v45 = 2112;
          __int16 v46 = v27;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s:%d: Updated Preferred Network with the name : %@", buf, 0x1Cu);
        }
        CFDictionaryRef v28 = [v14 network];
        CFDictionaryRef v29 = [v28 networkName];
        OSStatus v30 = [v5 network];
        id v31 = [v30 networkName];
        if ([v29 isEqualToString:v31])
        {
          id v38 = [v14 network];
          [v38 extendedPANID];
          uint64_t v32 = v40 = v28;
          id v33 = [v5 network];
          [v33 extendedPANID];
          __int16 v34 = v39 = v29;
          unsigned __int8 v37 = [v32 isEqualToData:v34];

          if (v37) {
            goto LABEL_27;
          }
        }
        else
        {
        }
        if ([(THThreadNetworkCredentialsKeychainBackingStore *)self deletePreferredNetworkEntry:v14])
        {
LABEL_27:
          BOOL v35 = 1;
          goto LABEL_24;
        }
        BOOL v35 = 1;
        id v25 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[THThreadNetworkCredentialsKeychainBackingStore updatePreferredNetworkEntry:]();
        }
LABEL_23:

LABEL_24:
        goto LABEL_17;
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore updatePreferredNetworkEntry:].cold.4();
      }
    }
    else
    {
      id v25 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore updatePreferredNetworkEntry:]();
      }
    }
    BOOL v35 = 0;
    goto LABEL_23;
  }
LABEL_16:
  BOOL v35 = 0;
LABEL_17:

  return v35;
}

- (BOOL)updateRecordToPreferredNetworkEntry:(id)a3 credentialsDataSetRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = v7;
  if (!v7 || ([v7 credentialsDataSet], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_18:
    int v51 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore updateRecordToPreferredNetworkEntry:credentialsDataSetRecord:]();
    }
    goto LABEL_20;
  }
  long long v10 = (void *)v9;
  uint64_t v11 = [v8 credentialsDataSet];
  uint64_t v12 = [v11 dataSetArray];
  if (!v12)
  {

    goto LABEL_18;
  }
  id v13 = (void *)v12;
  id v14 = [v8 credentialsDataSet];
  int v15 = [v14 dataSetArray];
  id v16 = [v15 length];

  if (!v16) {
    goto LABEL_18;
  }
  unsigned int v90 = self;
  __int16 v17 = [v6 network];
  id v18 = [v17 networkName];
  __int16 v19 = [v8 network];
  CFDictionaryRef v20 = [v19 networkName];
  if (![v18 isEqualToString:v20])
  {

    goto LABEL_23;
  }
  CFDictionaryRef v21 = [v6 network];
  id v22 = [v21 extendedPANID];
  [v8 network];
  unsigned int v23 = v89 = v6;
  CFDictionaryRef v24 = [v23 extendedPANID];
  unsigned int v25 = [v22 isEqualToData:v24];

  id v6 = v89;
  if (!v25)
  {
LABEL_23:
    long long v53 = [v6 network];
    __int16 v54 = [v8 borderAgent];
    long long v55 = v90;
    int v51 = [(THThreadNetworkCredentialsKeychainBackingStore *)v90 getActiveDataSetRecordForNetworkAndBorderAgentId:v53 borderAgent:v54];

    if (!v51)
    {
LABEL_50:
      BOOL v50 = 1;
      goto LABEL_21;
    }
    long long v56 = [v8 network];
    long long v57 = [v8 borderAgent];
    id v58 = [(THThreadNetworkCredentialsKeychainBackingStore *)v90 getActiveDataSetRecordForNetworkAndBorderAgentId:v56 borderAgent:v57];

    id v59 = objc_alloc((Class)THPreferredThreadNetwork);
    __int16 v60 = [v58 network];
    int v61 = [v6 networkSignature];
    id v62 = [v6 userInfo];
    id v63 = [v59 initWithThreadNetwork:v60 networkSignature:v61 credentialsDataSetRecord:v58 creationDate:0 lastModificationDate:0 userInfo:v62];

    if (v63)
    {
      unsigned int v64 = [(THThreadNetworkCredentialsKeychainBackingStore *)v90 storePreferred:v63];
      int v65 = THCredentialsServerLogHandleForCategory(1);
      __int16 v66 = v65;
      if (v64)
      {
        if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
        {
          id v67 = [v63 network];
          __int16 v68 = [v67 networkName];
          *(_DWORD *)buf = 136315650;
          v92 = "-[THThreadNetworkCredentialsKeychainBackingStore updateRecordToPreferredNetworkEntry:credentialsDataSetRecord:]";
          __int16 v93 = 1024;
          int v94 = 4749;
          __int16 v95 = 2112;
          id v96 = v68;
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "%s:%d: Updated Preferred Network with the name : %@", buf, 0x1Cu);

          long long v55 = v90;
        }

        if ([(THThreadNetworkCredentialsKeychainBackingStore *)v55 deletePreferredNetworkEntry:v6])
        {
          uint64_t v69 = [v51 network];
          __int16 v70 = [v51 borderAgent];
          id v71 = [(THThreadNetworkCredentialsKeychainBackingStore *)v55 deleteActiveDataSetRecordForNetworkAndBorderAgentId:v69 borderAgent:v70];

          if (!v71)
          {

LABEL_49:
            goto LABEL_50;
          }
          __int16 v66 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
            -[THThreadNetworkCredentialsKeychainBackingStore updateRecordToPreferredNetworkEntry:credentialsDataSetRecord:].cold.6(v51);
          }
        }
        else
        {
          __int16 v66 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
            -[THThreadNetworkCredentialsKeychainBackingStore updateRecordToPreferredNetworkEntry:credentialsDataSetRecord:].cold.7(v6);
          }
        }
      }
      else if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        -[THThreadNetworkCredentialsKeychainBackingStore updateRecordToPreferredNetworkEntry:credentialsDataSetRecord:].cold.8();
      }
    }
    else
    {
      __int16 v66 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore updateRecordToPreferredNetworkEntry:credentialsDataSetRecord:].cold.5();
      }
    }

    goto LABEL_56;
  }
  int v26 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    id v27 = [v89 network];
    CFDictionaryRef v28 = [v27 networkName];
    CFDictionaryRef v29 = [v89 network];
    OSStatus v30 = [v29 extendedPANID];
    id v31 = [v8 network];
    uint64_t v32 = [v31 networkName];
    id v33 = [v8 network];
    __int16 v34 = [v33 extendedPANID];
    *(_DWORD *)buf = 136316418;
    v92 = "-[THThreadNetworkCredentialsKeychainBackingStore updateRecordToPreferredNetworkEntry:credentialsDataSetRecord:]";
    __int16 v93 = 1024;
    int v94 = 4697;
    __int16 v95 = 2112;
    id v96 = v28;
    __int16 v97 = 2112;
    __int16 v98 = v30;
    __int16 v99 = 2112;
    __int16 v100 = v32;
    __int16 v101 = 2112;
    __int16 v102 = v34;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s:%d:Preferred network entry (name : %@, xpanid : %@) And record netowrk (name : %@, xpanid : %@) are matching, update record to Preferred Network", buf, 0x3Au);

    id v6 = v89;
  }

  uint64_t v35 = [v6 credentialsDataSetRecord];
  __int16 v36 = v90;
  if (!v35) {
    goto LABEL_44;
  }
  unsigned __int8 v37 = (void *)v35;
  id v38 = [v6 credentialsDataSetRecord];
  uint64_t v39 = [v38 credentialsDataSet];
  if (!v39) {
    goto LABEL_43;
  }
  int v40 = (void *)v39;
  uint64_t v41 = [v8 credentialsDataSet];
  if (!v41)
  {
LABEL_42:

LABEL_43:
    goto LABEL_44;
  }
  CFDictionaryRef v42 = (void *)v41;
  __int16 v43 = [v6 credentialsDataSetRecord];
  int v44 = [v43 credentialsDataSet];
  __int16 v45 = [v44 dataSetArray];
  if (![v45 length])
  {
LABEL_41:

    id v6 = v89;
    goto LABEL_42;
  }
  __int16 v46 = [v8 credentialsDataSet];
  id v88 = [v46 dataSetArray];
  if (![v88 length])
  {

    goto LABEL_41;
  }
  __int16 v85 = [v89 credentialsDataSetRecord];
  id v83 = [v85 credentialsDataSet];
  [v83 dataSetArray];
  __int16 v47 = v86 = v43;
  __int16 v48 = [v8 credentialsDataSet];
  [v48 dataSetArray];
  __int16 v49 = v84 = v46;
  unsigned int v87 = [v47 isEqualToData:v49];

  __int16 v36 = v90;
  id v6 = v89;

  if (!v87)
  {
LABEL_44:
    __int16 v72 = [v8 borderAgent];
    int v51 = [(THThreadNetworkCredentialsKeychainBackingStore *)v36 getActiveDataSetRecord:v72];

    id v73 = objc_alloc((Class)THPreferredThreadNetwork);
    [v6 network];
    v75 = __int16 v74 = v36;
    uint64_t v76 = [v6 networkSignature];
    CFDictionaryRef v77 = [v6 userInfo];
    id v58 = [v73 initWithThreadNetwork:v75 networkSignature:v76 credentialsDataSetRecord:v51 creationDate:0 lastModificationDate:0 userInfo:v77];

    if (v58)
    {
      unsigned int v78 = [(THThreadNetworkCredentialsKeychainBackingStore *)v74 storePreferred:v58];
      __int16 v79 = THCredentialsServerLogHandleForCategory(1);
      int v80 = v79;
      if (v78)
      {
        if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
        {
          __int16 v81 = [v58 network];
          CFDictionaryRef v82 = [v81 networkName];
          *(_DWORD *)buf = 136315650;
          v92 = "-[THThreadNetworkCredentialsKeychainBackingStore updateRecordToPreferredNetworkEntry:credentialsDataSetRecord:]";
          __int16 v93 = 1024;
          int v94 = 4723;
          __int16 v95 = 2112;
          id v96 = v82;
          _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_INFO, "%s:%d: Updated Preferred Network with the name : %@", buf, 0x1Cu);
        }
        goto LABEL_49;
      }
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore updateRecordToPreferredNetworkEntry:credentialsDataSetRecord:]();
      }
    }
    else
    {
      int v80 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore updateRecordToPreferredNetworkEntry:credentialsDataSetRecord:]();
      }
    }

LABEL_56:
LABEL_20:
    BOOL v50 = 0;
    goto LABEL_21;
  }
  BOOL v50 = 1;
  int v51 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
    -[THThreadNetworkCredentialsKeychainBackingStore updateRecordToPreferredNetworkEntry:credentialsDataSetRecord:].cold.4(v89, v8, v51);
  }
LABEL_21:

  return v50;
}

- (id)deleteActiveDataSetRecordForNetworkAndBorderAgentId:(id)a3 borderAgent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = [v5 networkName];
    uint64_t v9 = [v5 extendedPANID];
    long long v10 = [v6 discriminatorId];
    int v19 = 136316162;
    CFDictionaryRef v20 = "-[THThreadNetworkCredentialsKeychainBackingStore deleteActiveDataSetRecordForNetworkAndBorderAgentId:borderAgent:]";
    __int16 v21 = 1024;
    int v22 = 4774;
    __int16 v23 = 2112;
    CFDictionaryRef v24 = v8;
    __int16 v25 = 2112;
    int v26 = v9;
    __int16 v27 = 2112;
    CFDictionaryRef v28 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s:%d: Fetch active dataset record with network name : %@, network xpanid : %@, borderAgent %@", (uint8_t *)&v19, 0x30u);
  }
  CFDictionaryRef v11 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForDeleteActiveDataSetOperationForNetworkAndBorderAgent:v5 borderAgent:v6];
  OSStatus v12 = SecItemDelete(v11);
  id v13 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315650;
    CFDictionaryRef v20 = "-[THThreadNetworkCredentialsKeychainBackingStore deleteActiveDataSetRecordForNetworkAndBorderAgentId:borderAgent:]";
    __int16 v21 = 1024;
    int v22 = 4779;
    __int16 v23 = 1024;
    LODWORD(v24) = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s:%d Result for deletion operation : (err=%d)", (uint8_t *)&v19, 0x18u);
  }

  if (v12)
  {
    id v14 = (__CFString *)SecCopyErrorMessageString(v12, 0);
    int v15 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore deleteActiveDataSetRecordForNetworkAndBorderAgentId:borderAgent:]();
    }

    id v16 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v12 userInfo:0];
    id v17 = +[NSError storeError:2 underlyingError:v16 description:v14];
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (id)getActiveDataSetRecordForNetworkAndBorderAgentId:(id)a3 borderAgent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 networkName];
    long long v10 = [v6 extendedPANID];
    CFDictionaryRef v11 = [v7 discriminatorId];
    *(_DWORD *)buf = 136316162;
    int v19 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveDataSetRecordForNetworkAndBorderAgentId:borderAgent:]";
    __int16 v20 = 1024;
    int v21 = 4795;
    __int16 v22 = 2112;
    __int16 v23 = v9;
    __int16 v24 = 2112;
    __int16 v25 = v10;
    __int16 v26 = 2112;
    __int16 v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s:%d: Fetch active dataset record with network name : %@, network xpanid : %@, borderAgent %@", buf, 0x30u);
  }
  OSStatus v12 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchActiveDataSetRecordOperationForNetworkAndBorderAgent:v6 borderAgent:v7];
  uint64_t v17 = 0;
  id v13 = [(THThreadNetworkCredentialsKeychainBackingStore *)self _doFetchActiveDataSetRecords:v12 error:&v17];
  id v14 = v13;
  int v15 = 0;
  if (!v17)
  {
    int v15 = [v13 anyObject];
  }

  return v15;
}

- (id)getActiveDataSetRecord:(id)a3
{
  id v4 = a3;
  id v5 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 discriminatorId];
    *(_DWORD *)buf = 136315650;
    id v14 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveDataSetRecord:]";
    __int16 v15 = 1024;
    int v16 = 4806;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d: Fetch active dataset record with borderAgent %@", buf, 0x1Cu);
  }
  id v7 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchActiveDataSetRecordOperationForBorderAgent:v4];
  uint64_t v12 = 0;
  unsigned int v8 = [(THThreadNetworkCredentialsKeychainBackingStore *)self _doFetchActiveDataSetRecords:v7 error:&v12];
  uint64_t v9 = v8;
  long long v10 = 0;
  if (!v12)
  {
    long long v10 = [v8 anyObject];
  }

  return v10;
}

- (BOOL)markAsPreferred:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v5 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore markAsPreferred:]();
    }
  }
  id v6 = [(THThreadNetworkCredentialsKeychainBackingStore *)self getPreferredNetwork:0];
  if (v6)
  {
    if ([(THThreadNetworkCredentialsKeychainBackingStore *)self updateRecordToPreferredNetworkEntry:v6 credentialsDataSetRecord:v4])
    {
      [(THThreadNetworkCredentialsKeychainBackingStore *)self dispatchRemoveInActiveRecords:v6];
      BOOL v7 = 1;
    }
    else
    {
      unsigned int v8 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore markAsPreferred:]();
      }

      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = [(THThreadNetworkCredentialsKeychainBackingStore *)self storePreferredNetworkWithRecord:v4];
  }

  return v7;
}

- (BOOL)areValidDataSetTLVs:(id)a3
{
  uint64_t v4 = 0;
  return [(THThreadNetworkCredentialsKeychainBackingStore *)self areValidDataSetTLVs:a3 creds:&v4];
}

- (BOOL)areValidDataSetTLVs:(id)a3 creds:(id *)a4
{
  id v4 = a3;
  id v5 = (unsigned __int8 *)[v4 bytes];
  unsigned int v6 = [v4 length];
  BOOL v7 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v107 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
    __int16 v108 = 1024;
    int v109 = 4926;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Validating Dataset : %d", buf, 0x12u);
  }
  id v96 = v4;

  unsigned int v8 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v107 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
    __int16 v108 = 1024;
    int v109 = v6;
    __int16 v110 = 1024;
    int v111 = 4928;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: #MOS : data_len : %d, Line : %d", buf, 0x18u);
  }

  encode_data_into_string(v5, v6, (char *)buf, 0x3E8uLL, 0);
  uint64_t v9 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v112 = 136315651;
    v113 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
    __int16 v114 = 2085;
    v115 = buf;
    __int16 v116 = 1024;
    int v117 = 4930;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: #MOS : dump: %{sensitive}s, Line : %d", v112, 0x1Cu);
  }

  if (!v6)
  {
    LOBYTE(v11) = 0;
    __int16 v100 = 0;
    __int16 v101 = 0;
    __int16 v97 = 0;
    __int16 v98 = 0;
    long long v10 = 0;
LABEL_78:
    uint64_t v39 = THCredentialsServerLogHandleForCategory(1);
    BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
    uint64_t v41 = v97;
    CFDictionaryRef v42 = v98;
    if (!v10 || !v97 || !v101 || !v100 || !v98 || !(_BYTE)v11)
    {
      __int16 v43 = v96;
      if (v40) {
        -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:].cold.8();
      }
      goto LABEL_114;
    }
    __int16 v43 = v96;
    if (v40) {
      -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:].cold.7();
    }

    LOBYTE(v87) = 1;
    uint64_t v39 = [objc_alloc((Class)THThreadNetworkCredentials) initWithMasterKey:v101 passPhrase:0 PSKc:v100 channel:v11 PANID:v98 userInfo:0 credentialDataSet:0 isActiveDevice:v87];
    int v44 = THCredentialsServerLogHandleForCategory(1);
    BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
    if (!v39)
    {
      if (v45) {
        -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]();
      }
      BOOL v58 = 0;
      uint64_t v39 = v44;
      goto LABEL_115;
    }
    if (v45) {
      -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:].cold.6();
    }

    __int16 v46 = [objc_alloc((Class)THThreadNetwork) initWithName:v10 extendedPANID:v97];
    if (v46)
    {
      __int16 v47 = v46;
      id v48 = [objc_alloc((Class)THThreadNetworkCredentialsDataSet) initWithDataSetArray:v96 userInfo:0];
      if (v48)
      {
        __int16 v49 = v48;
        id v50 = objc_alloc((Class)THThreadNetworkBorderAgent);
        int v51 = generateNewBorderAgentIDAsString();
        id v52 = [(THThreadNetworkCredentialsKeychainBackingStore *)self dataFromHexString:v51];
        id v53 = [v50 initWithBaDiscrId:v52];

        __int16 v54 = v53;
        if (v53)
        {
          long long v55 = +[THThreadNetworkCredentialsActiveDataSetRecord computedUniqueIdentifierForNetwork:v47 keychainAccessGroup:@"com.apple.thread.dataset"];
          id v56 = [objc_alloc((Class)THThreadNetworkCredentialsActiveDataSetRecord) initWithBorderAgent:v53 credentialsDataSet:v49 network:v47 credentials:v39 uniqueIdentifier:v55 keychainAccessGroup:@"0000000000" creationDate:0 lastModificationDate:0];
          *a4 = v56;
          if (v56)
          {
            __int16 v99 = v49;
            long long v57 = [v56 credentials];
            __int16 v95 = v55;
            BOOL v58 = 1;
            [v57 setIsActiveDevice:1];

            id v88 = objc_alloc((Class)THThreadNetworkCredentialsDataSet);
            v92 = [*a4 credentialsDataSet];
            __int16 v89 = [v92 dataSetArray];
            unsigned int v90 = [*a4 credentials];
            [v90 userInfo];
            id v59 = v91 = v54;
            id v60 = [v88 initWithDataSetArray:v89 userInfo:v59];
            int v61 = [*a4 credentials];
            [v61 setCredentialsDataSet:v60];

LABEL_127:
            CFDictionaryRef v42 = v98;
            goto LABEL_115;
          }
          __int16 v66 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
            -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:].cold.5();
          }
        }
        else
        {
          int v65 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
            -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:].cold.4();
          }
        }
        BOOL v58 = 0;
        goto LABEL_127;
      }
      unsigned int v64 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]();
      }
    }
    else
    {
      __int16 v47 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]();
      }
    }

    goto LABEL_114;
  }
  long long v10 = 0;
  __int16 v97 = 0;
  __int16 v98 = 0;
  __int16 v100 = 0;
  __int16 v101 = 0;
  LOBYTE(v11) = 0;
  unsigned int v12 = 0;
  while (2)
  {
    uint64_t v13 = v12 + 1;
    if (v13 >= v6)
    {
      __int16 v20 = THCredentialsServerLogHandleForCategory(1);
      __int16 v43 = v96;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]5();
      }
      goto LABEL_112;
    }
    uint64_t v14 = v5[v13];
    uint64_t v15 = v12 + 2;
    unsigned int v16 = v12 + 2 + v14;
    if (v16 > v6)
    {
      __int16 v20 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]0();
      }
      goto LABEL_111;
    }
    int v17 = v5[v12];
    switch(v5[v12])
    {
      case 0u:
        id v18 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v102 = 136315394;
          v103 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
          __int16 v104 = 1024;
          LODWORD(v105[0]) = 5034;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: #MOS : ==> Decoded channel Line : %d", v102, 0x12u);
        }

        if (v14 == 3)
        {
          if (v5[v15])
          {
            __int16 v20 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]6((uint64_t)&v5[v15], v20, v75, v76, v77, v78, v79, v80);
            }
          }
          else
          {
            uint64_t v11 = v5[v12 + 4];
            int v19 = THCredentialsServerLogHandleForCategory(1);
            __int16 v20 = v19;
            if ((v11 - 27) > 0xEFu)
            {
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)__int16 v102 = 136315394;
                v103 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
                __int16 v104 = 1024;
                LODWORD(v105[0]) = v11;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: #MOS : Channel : %d", v102, 0x12u);
              }
              goto LABEL_73;
            }
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]5(v11, v20, v81, v82, v83, v84, v85, v86);
            }
          }
        }
        else
        {
          __int16 v20 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]7();
          }
        }
        goto LABEL_111;
      case 1u:
        __int16 v25 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v102 = 136315394;
          v103 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
          __int16 v104 = 1024;
          LODWORD(v105[0]) = 5068;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s: #MOS : ==> Decoded pan id Line : %d", v102, 0x12u);
        }

        if (v14 != 2)
        {
          __int16 v20 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]8();
          }
          goto LABEL_111;
        }
        uint64_t v26 = +[NSData dataWithBytes:&v5[v15] length:2];

        __int16 v20 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v102 = 136315394;
          v103 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
          __int16 v104 = 2112;
          v105[0] = v26;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: #MOS : PANID : %@", v102, 0x16u);
        }
        __int16 v98 = (void *)v26;
        goto LABEL_73;
      case 2u:
        __int16 v27 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v102 = 136315394;
          v103 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
          __int16 v104 = 1024;
          LODWORD(v105[0]) = 5083;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s: #MOS : ==> Decoded XPAN ID : %d", v102, 0x12u);
        }

        if (v14 != 8)
        {
          __int16 v20 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]9();
          }
          goto LABEL_111;
        }
        uint64_t v28 = +[NSData dataWithBytes:&v5[v15] length:8];

        __int16 v20 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v102 = 136315394;
          v103 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
          __int16 v104 = 2112;
          v105[0] = v28;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: #MOS : XPAN ID: %@", v102, 0x16u);
        }
        __int16 v97 = (void *)v28;
        goto LABEL_73;
      case 3u:
        __memcpy_chk();
        v112[v14] = 0;
        CFDictionaryRef v29 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v102 = 136315394;
          v103 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
          __int16 v104 = 1024;
          LODWORD(v105[0]) = 5023;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s: #MOS : ==> Decoded Network Name Line : %d", v102, 0x12u);
        }

        uint64_t v30 = +[NSString stringWithUTF8String:v112];

        id v31 = THCredentialsServerLogHandleForCategory(1);
        __int16 v20 = v31;
        if (!v30)
        {
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]4(v20, v67, v68, v69, v70, v71, v72, v73);
          }
          long long v10 = 0;
          goto LABEL_111;
        }
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v102 = 136315394;
          v103 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
          __int16 v104 = 2112;
          v105[0] = v30;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s : #MOS : Network Name : %@", v102, 0x16u);
        }
        goto LABEL_74;
      case 4u:
        uint64_t v32 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v102 = 136315394;
          v103 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
          __int16 v104 = 1024;
          LODWORD(v105[0]) = 5098;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%s: #MOS : ==> Decoded pskc Line : %d", v102, 0x12u);
        }

        if (v14 != 16)
        {
          __int16 v20 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]0();
          }
          goto LABEL_111;
        }
        uint64_t v33 = +[NSData dataWithBytes:&v5[v15] length:16];

        __int16 v20 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v102 = 136315395;
          v103 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
          __int16 v104 = 2117;
          v105[0] = v33;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: #MOS : PSKc : %{sensitive}@", v102, 0x16u);
        }
        __int16 v100 = (void *)v33;
        goto LABEL_73;
      case 5u:
        __int16 v34 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v102 = 136315394;
          v103 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
          __int16 v104 = 1024;
          LODWORD(v105[0]) = 5114;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%s: #MOS : ==> Decoded master key Line : %d", v102, 0x12u);
        }

        if (v14 != 16)
        {
          __int16 v20 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]1();
          }
          goto LABEL_111;
        }
        uint64_t v35 = +[NSData dataWithBytes:&v5[v15] length:16];

        __int16 v20 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v102 = 136315395;
          v103 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
          __int16 v104 = 2117;
          v105[0] = v35;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: #MOS : Master Key: %{sensitive}@", v102, 0x16u);
        }
        __int16 v101 = (void *)v35;
        goto LABEL_73;
      case 6u:
      case 8u:
      case 9u:
      case 0xAu:
      case 0xBu:
        goto LABEL_31;
      case 7u:
        __int16 v36 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v102 = 136315394;
          v103 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
          __int16 v104 = 1024;
          LODWORD(v105[0]) = 5145;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%s: #MOS : ==> Decoded mesh local prefix Line : %d", v102, 0x12u);
        }

        if (v14 == 8) {
          goto LABEL_75;
        }
        __int16 v20 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]4();
        }
        goto LABEL_111;
      case 0xCu:
        unsigned __int8 v37 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v102 = 136315650;
          v103 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
          __int16 v104 = 1024;
          LODWORD(v105[0]) = 5129;
          WORD2(v105[0]) = 1024;
          *(_DWORD *)((char *)v105 + 6) = v14;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%s: #MOS : ==> Decoded security policy Line : %d, len : %d", v102, 0x18u);
        }

        if ((v14 - 3) >= 2)
        {
          __int16 v20 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]3();
          }
          goto LABEL_111;
        }
        if (!v5[v15] && !v5[v12 + 3])
        {
          __int16 v20 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]2();
          }
          goto LABEL_111;
        }
        __int16 v20 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          id v38 = +[NSData dataWithBytes:&v5[v15] length:v14];
          *(_DWORD *)__int16 v102 = 136315394;
          v103 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
          __int16 v104 = 2112;
          v105[0] = v38;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: #MOS : security policy : %@", v102, 0x16u);
        }
        goto LABEL_73;
      default:
        if (v17 != 53)
        {
LABEL_31:
          __int16 v20 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int16 v102 = 136315650;
            v103 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
            __int16 v104 = 1024;
            LODWORD(v105[0]) = v17;
            WORD2(v105[0]) = 1024;
            *(_DWORD *)((char *)v105 + 6) = 5155;
            _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Unknown type : %d, Line : %d", v102, 0x18u);
          }
LABEL_73:
          uint64_t v30 = (uint64_t)v10;
LABEL_74:

          long long v10 = (void *)v30;
LABEL_75:
          unsigned int v12 = v16;
          if (v16 >= v6) {
            goto LABEL_78;
          }
          continue;
        }
        int v21 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v102 = 136315394;
          v103 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
          __int16 v104 = 1024;
          LODWORD(v105[0]) = 4985;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s: #MOS : ==> Decoded Channel Mask TLV Line : %d", v102, 0x12u);
        }

        unsigned int v22 = v12 + 3;
        while (1)
        {
          if (v22 - 1 >= v16) {
            goto LABEL_75;
          }
          if (v22 >= v16 || v22 + 5 > v16) {
            break;
          }
          if ((v5[v22 - 1] & 0xFD) != 0)
          {
            __int16 v20 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]3();
            }
            goto LABEL_111;
          }
          int v24 = v5[v22];
          v22 += 6;
          if (v24 != 4)
          {
            __int16 v20 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]2();
            }
            goto LABEL_111;
          }
        }
        __int16 v20 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]1();
        }
LABEL_111:
        __int16 v43 = v96;
LABEL_112:
        uint64_t v41 = v97;
        CFDictionaryRef v42 = v98;

        uint64_t v39 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:].cold.9();
        }
LABEL_114:
        BOOL v58 = 0;
LABEL_115:

        return v58;
    }
  }
}

- (void)getSecFlags:(char *)a3
{
  *a3 |= 0xF7u;
  a3[1] |= 0xF8u;
}

- (id)generateCredentials
{
  __int16 v44 = 0;
  uint64_t v3 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v50 = "-[THThreadNetworkCredentialsKeychainBackingStore generateCredentials]";
    __int16 v51 = 1024;
    int v52 = 5347;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s:%d Generating Credentials", buf, 0x12u);
  }

  if ([(THThreadNetworkCredentialsKeychainBackingStore *)self isEthernetNetwork])
  {
    id v4 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsKeychainBackingStore generateCredentials]();
    }

    if (![(THThreadNetworkCredentialsKeychainBackingStore *)self isWiFiNetwork]) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if ([(THThreadNetworkCredentialsKeychainBackingStore *)self isWiFiNetwork])
  {
LABEL_9:
    id v5 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v50 = "-[THThreadNetworkCredentialsKeychainBackingStore generateCredentials]";
      __int16 v51 = 1024;
      int v52 = 5356;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d Device is on WiFi", buf, 0x12u);
    }

LABEL_12:
    memset(v70, 0, sizeof(v70));
    long long v69 = 0u;
    long long v68 = 0u;
    long long v67 = 0u;
    long long v66 = 0u;
    long long v65 = 0u;
    long long v64 = 0u;
    long long v63 = 0u;
    long long v62 = 0u;
    long long v61 = 0u;
    long long v60 = 0u;
    long long v59 = 0u;
    long long v58 = 0u;
    long long v57 = 0u;
    long long v56 = 0u;
    int v53 = -1610480628;
    [(THThreadNetworkCredentialsKeychainBackingStore *)self getSecFlags:&v44];
    __int16 v54 = v44;
    unsigned int v6 = [(THThreadNetworkCredentialsKeychainBackingStore *)self dataFromHexString:@"0004001fffc0"];
    __int16 v55 = ((unsigned __int16)[v6 length] << 8) | 0x35;
    id v7 = v6;
    [v7 bytes];
    [v7 length];
    __memcpy_chk();
    unsigned __int8 v38 = [v7 length];
    BOOL v40 = v7;
    unsigned int v8 = [v7 length];
    uint64_t v39 = generateNewXPANIDAsString();
    uint64_t v9 = -[THThreadNetworkCredentialsKeychainBackingStore dataFromHexString:](self, "dataFromHexString:");
    *(_WORD *)((char *)&v53 + (v8 + 8)) = ((unsigned __int16)[v9 length] << 8) | 2;
    id v10 = v9;
    memcpy((char *)&v53 + (v8 + 10), [v10 bytes], objc_msgSend(v10, "length"));
    unsigned __int8 v37 = [v10 length];
    unsigned int v11 = v8 + 10 + [v10 length];
    unsigned int v12 = generateNewNetworkKeyAsByteArray();
    *(_WORD *)((char *)&v53 + v11) = ((unsigned __int16)[v12 length] << 8) | 5;
    unsigned int v13 = v11 + 2;
    id v14 = v12;
    memcpy((char *)&v53 + v13, [v14 bytes], objc_msgSend(v14, "length"));
    unsigned __int8 v36 = [v14 length];
    unsigned int v15 = [v14 length];
    unsigned int v16 = v13 + v15;
    *(_WORD *)((char *)&v53 + (v13 + v15)) = 768;
    *((unsigned char *)&v53 + (v13 + v15 + 2)) = 0;
    *(_WORD *)((char *)&v53 + (v13 + v15 + 3)) = 6400;
    LOBYTE(v12) = v13 + v15 + 5;
    uint32_t v17 = arc4random();
    *(_WORD *)((char *)&v53 + v12) = 513;
    *(_WORD *)((char *)&v53 + (v16 + 7)) = v17 + ((v17 / 0xF) & 0xF000) + 4096;
    id v18 = generatreNewNetworkName();
    *(_WORD *)((char *)&v53 + (v16 + 9)) = ((unsigned __int16)[v18 length] << 8) | 3;
    unsigned int v19 = v16 + 11;
    id v20 = v18;
    memcpy((char *)&v53 + v19, [v20 cStringUsingEncoding:4], (size_t)objc_msgSend(v20, "length"));
    LOBYTE(v18) = [v20 length];
    unsigned int v21 = v19 + [v20 length];
    unsigned int v22 = generateNewNetworkKeyAsByteArray();
    *(_WORD *)((char *)&v53 + v21) = ((unsigned __int16)[v22 length] << 8) | 4;
    LODWORD(v7) = v21 + 2;
    id v23 = v22;
    memcpy((char *)&v53 + (v21 + 2), [v23 bytes], objc_msgSend(v23, "length"));
    LOBYTE(v21) = [v23 length];
    LODWORD(v7) = v7 + [v23 length];
    v43.__darwin_time_t tv_sec = 0;
    *(void *)&v43.tv_usec = 0;
    gettimeofday(&v43, 0);
    __darwin_time_t tv_sec = v43.tv_sec;
    *(_WORD *)((char *)&v53 + v7) = 2062;
    *(void *)((char *)&v53 + ((_BYTE)v7 + 2)) = bswap64(tv_sec) >> 16;
    long long v42 = 0uLL;
    arc4random_buf((char *)&v42 + 1, 5uLL);
    *(_WORD *)((char *)&v53 + ((_BYTE)v7 + 10)) = 2055;
    LOBYTE(v42) = -3;
    *(_OWORD *)((char *)&v53 + ((_BYTE)v7 + 12)) = v42;
    uint64_t v25 = (v38 + v37 + v36 + (_BYTE)v18 + v21 + 45);
    encode_data_into_string((unsigned __int8 *)&v53, v25, (char *)buf, 0x3E8uLL, 0);
    uint64_t v26 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)BOOL v45 = 136315394;
      __int16 v46 = buf;
      __int16 v47 = 1024;
      int v48 = 5598;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "dump: %s, Line : %d", v45, 0x12u);
    }

    __int16 v27 = (uint8_t *)[objc_alloc((Class)NSData) initWithBytes:&v53 length:v25];
    uint64_t v28 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)BOOL v45 = 138412546;
      __int16 v46 = v27;
      __int16 v47 = 1024;
      int v48 = 5602;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "datasetTlvs : %@, Line : %d", v45, 0x12u);
    }

    id v41 = 0;
    unsigned int v29 = [(THThreadNetworkCredentialsKeychainBackingStore *)self areValidDataSetTLVs:v27 creds:&v41];
    uint64_t v30 = v41;
    id v31 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = "InValid";
      if (v29) {
        uint64_t v32 = "Valid";
      }
      *(_DWORD *)BOOL v45 = 136315394;
      __int16 v46 = (uint8_t *)v32;
      __int16 v47 = 1024;
      int v48 = 5606;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "isValid : %s, Line : %d", v45, 0x12u);
    }

    if (v29)
    {
      uint64_t v33 = v30;
    }
    else
    {
      __int16 v34 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[THThreadNetworkCredentialsKeychainBackingStore generateCredentials]();
      }

      uint64_t v33 = 0;
    }

    goto LABEL_29;
  }
  uint64_t v30 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
    -[THThreadNetworkCredentialsKeychainBackingStore generateCredentials]();
  }
  uint64_t v33 = 0;
LABEL_29:

  return v33;
}

- (void)_doFetchRecords:error:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v0, v1, "Failed retrieving thread credential: %@", v2, v3, v4, v5, v6);
}

- (void)_doFetchRecords:error:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v0, v1, "Retrieved credentials but did not get an array!? %@", v2, v3, v4, v5, v6);
}

- (void)errorout:completion:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v0, v1, "Failed persisting thread credential: %@", v2, v3, v4, v5, v6);
}

void __94__THThreadNetworkCredentialsKeychainBackingStore_deleteRecordWithUniqueIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "%s: Failed deleting thread credentials: %@", v2, v3, v4, v5, 2u);
}

- (void)_doFetchOneActiveDataSetRecords:error:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v0, v1, "Failed retrieving thread active data set record: %@", v2, v3, v4, v5, v6);
}

- (void)_doFetchOneActiveDataSetRecords:(uint64_t)a3 error:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_doFetchPreferredNetworks:error:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v0, v1, "Failed retrieving Preferred Network: %@", v2, v3, v4, v5, v6);
}

- (void)_doFetchPreferredNetworks:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d Preferred Network not found in the keychain database", v2, v3, v4, v5, v6);
}

- (void)_doFetchPreferredNetworks:error:.cold.3()
{
  v2[0] = 136315650;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_9_0((void *)&_mh_execute_header, v0, v1, "%s:%d:Retrieved Preferred Network but did not get an array!? %@", (uint8_t *)v2);
}

- (void)_doFetchFrozenThreadNetworks:error:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v0, v1, "Failed retrieving Frozen thread Network: %@", v2, v3, v4, v5, v6);
}

- (void)_doFetchFrozenThreadNetworks:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d Frozen thread Network not found in the keychain database", v2, v3, v4, v5, v6);
}

- (void)_doFetchFrozenThreadNetworks:error:.cold.3()
{
  v2[0] = 136315650;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_9_0((void *)&_mh_execute_header, v0, v1, "%s:%d:Retrieved Frozen thread network but did not get an array!? %@", (uint8_t *)v2);
}

void __73__THThreadNetworkCredentialsKeychainBackingStore_retrieveThirdPartyInfo___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "No dataset credentials found.\n", v2, v3, v4, v5, v6);
}

void __73__THThreadNetworkCredentialsKeychainBackingStore_retrieveThirdPartyInfo___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to fetch preferred networks", v2, v3, v4, v5, v6);
}

void __73__THThreadNetworkCredentialsKeychainBackingStore_retrieveThirdPartyInfo___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: No Preferred Networks in Database ", v2, v3, v4, v5, v6);
}

void __73__THThreadNetworkCredentialsKeychainBackingStore_retrieveThirdPartyInfo___block_invoke_cold_4(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)a1 + 8) + 40) count];
  OUTLINED_FUNCTION_26((void *)&_mh_execute_header, v1, v2, "Credentials: %d records:\n", v3, v4, v5, v6, 0);
}

void __73__THThreadNetworkCredentialsKeychainBackingStore_retrieveThirdPartyInfo___block_invoke_cold_5(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(*(void *)a1 + 8) + 40) description];
  [v1 UTF8String];
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v2, v3, "Error: failed to retrieve (%s)\n", v4, v5, v6, v7, 2u);
}

- (void)getActiveRecords:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to allocate baFinder", v2, v3, v4, v5, v6);
}

- (void)getActiveRecords:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to allocate recordList", v2, v3, v4, v5, v6);
}

void __140__THThreadNetworkCredentialsKeychainBackingStore_retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup_activeFlag_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __107__THThreadNetworkCredentialsKeychainBackingStore_deleteActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v0, v1, "Failed deleting thread active dataset record: %@", v2, v3, v4, v5, v6);
}

void __107__THThreadNetworkCredentialsKeychainBackingStore_deleteActiveDataSetRecordForThreadBorderAgent_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "%s: Failed deleting thread credentials: %@", v2, v3, v4, v5, 2u);
}

- (void)isFrozenRecord:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create black list record to verify", v2, v3, v4, v5, v6);
}

- (void)isFrozenRecord:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to fetch frozen thread networks", v2, v3, v4, v5, v6);
}

void __104__THThreadNetworkCredentialsKeychainBackingStore_updatePreferredNetworkWithNewDatasetRecord_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Record parameter is invalid ", v2, v3, v4, v5, v6);
}

void __104__THThreadNetworkCredentialsKeychainBackingStore_updatePreferredNetworkWithNewDatasetRecord_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s:%d Delete the local record result (error=%d)", v2, v3, v4, v5, 2u);
}

void __104__THThreadNetworkCredentialsKeychainBackingStore_updatePreferredNetworkWithNewDatasetRecord_completion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d Updating Preferred network entry failed, deleting the local record", v2, v3, v4, v5, v6);
}

void __104__THThreadNetworkCredentialsKeychainBackingStore_updatePreferredNetworkWithNewDatasetRecord_completion___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d Credential exists. Will update instead.", v2, v3, v4, v5, v6);
}

void __114__THThreadNetworkCredentialsKeychainBackingStore_storeThreadCredentialActiveDataSetRecord_waitForSync_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Record parameter is invalid ", v2, v3, v4, v5, v6);
}

void __114__THThreadNetworkCredentialsKeychainBackingStore_storeThreadCredentialActiveDataSetRecord_waitForSync_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Returning error : Incoming record doesn't match with the Preferred network =====>", v2, v3, v4, v5, v6);
}

void __150__THThreadNetworkCredentialsKeychainBackingStore_deleteActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup_keychainAccessGroup_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "%s: Failed deleting thread credentials: %@", v2, v3, v4, v5, 2u);
}

- (void)checkIfXpanIDMatchToMDNSScan:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Error, semaphore wait timed out ", v2, v3, v4, v5, v6);
}

- (void)checkIfXpanIDMatchToMDNSScan:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Error, Failed to dispatch scan", v2, v3, v4, v5, v6);
}

- (void)checkIfNetworkMatchToMDNSScan:borderAgentID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Error, semaphore wait timed out ", v2, v3, v4, v5, v6);
}

- (void)checkIfNetworkMatchToMDNSScan:borderAgentID:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Error, Failed to dispatch scan", v2, v3, v4, v5, v6);
}

- (void)getRecordForPreferredNetwork:anyDsFormat:skipScan:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Unable to find preferred network", v2, v3, v4, v5, v6);
}

- (void)getRecordForPreferredNetwork:anyDsFormat:skipScan:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Unable to convert record Set to Array", v2, v3, v4, v5, v6);
}

void __102__THThreadNetworkCredentialsKeychainBackingStore_retrievePreferredNetworkOfAnyDSFormatWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Unable to get the preferred network record", v2, v3, v4, v5, v6);
}

void __89__THThreadNetworkCredentialsKeychainBackingStore_retrievePreferredNetworkWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Unable to get the preferred network record", v2, v3, v4, v5, v6);
}

void __99__THThreadNetworkCredentialsKeychainBackingStore_retrievePreferredNetworkInternallyWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Unable to get the preferred network record", v2, v3, v4, v5, v6);
}

void __99__THThreadNetworkCredentialsKeychainBackingStore_retrievePreferredNetworkWithNoScanWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Unable to get the preferred network record", v2, v3, v4, v5, v6);
}

- (void)storePreferredNetworkWithRecord:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)storePreferredNetworkWithRecord:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)storePreferredNetworkWithRecord:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)storePreferredNetworkWithRecord:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __109__THThreadNetworkCredentialsKeychainBackingStore_retrieveOrGeneratePreferredNetworkInternallyWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d Credential exists. Will update instead.", v2, v3, v4, v5, v6);
}

void __109__THThreadNetworkCredentialsKeychainBackingStore_retrieveOrGeneratePreferredNetworkInternallyWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Unable to get the preferred network record", v2, v3, v4, v5, v6);
}

void __173__THThreadNetworkCredentialsKeychainBackingStore_addPreferredNetworkWithCompletionInternally_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_17();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x26u);
}

void __173__THThreadNetworkCredentialsKeychainBackingStore_addPreferredNetworkWithCompletionInternally_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d:failed to add Preferred Network", v2, v3, v4, v5, v6);
}

void __173__THThreadNetworkCredentialsKeychainBackingStore_addPreferredNetworkWithCompletionInternally_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d:failed to add old format Preferred Network", v2, v3, v4, v5, v6);
}

void __173__THThreadNetworkCredentialsKeychainBackingStore_addPreferredNetworkWithCompletionInternally_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d:failed to add new format Preferred Network", v2, v3, v4, v5, v6);
}

void __152__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredNetworkForNetworkSignatureInternallyWithCompletion_ipv6NwSignature_wifiSSID_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to delete preferred network for networksignature", v2, v3, v4, v5, v6);
}

void __152__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredNetworkForNetworkSignatureInternallyWithCompletion_ipv6NwSignature_wifiSSID_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v0, v1, "Failed deleting Preferred Network: %@", v2, v3, v4, v5, v6);
}

void __87__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredNetworkWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to fetch preferred networks", v2, v3, v4, v5, v6);
}

void __87__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredNetworkWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: No Preferred Networks in Database for deletion ", v2, v3, v4, v5, v6);
}

void __87__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredNetworkWithCompletion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to delete preferred networks", v2, v3, v4, v5, v6);
}

void __87__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredNetworkWithCompletion___block_invoke_cold_4(void *a1)
{
  uint64_t v1 = [a1 network];
  uint64_t v2 = [v1 networkName];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, v3, v4, "%s:%d: Failed deleting thread credentials for delete preferred network : %@", v5, v6, v7, v8, 2u);
}

void __87__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredNetworkWithCompletion___block_invoke_cold_6(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, v1, v2, "%s : %d - Preferred Networks in Database for deletion = %lu", v3, v4, v5, v6, 2u);
}

void __103__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredNetworkEntryWithCompletion_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to delete preferred networks", v2, v3, v4, v5, v6);
}

void __103__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredAndFrozenThreadNetworksWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to fetch preferred networks", v2, v3, v4, v5, v6);
}

void __103__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredAndFrozenThreadNetworksWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed deleting All preferred network entries", v2, v3, v4, v5, v6);
}

void __103__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredAndFrozenThreadNetworksWithCompletion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to fetch frozen thread networks", v2, v3, v4, v5, v6);
}

void __103__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredAndFrozenThreadNetworksWithCompletion___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed deleting All frozen thread network entries", v2, v3, v4, v5, v6);
}

void __103__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredAndFrozenThreadNetworksWithCompletion___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed deleting all records for Apple team ID - 0000000000 Failed", v2, v3, v4, v5, v6);
}

void __103__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredAndFrozenThreadNetworksWithCompletion___block_invoke_cold_6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: No Frozen Networks in the Database for deletion ", v2, v3, v4, v5, v6);
}

void __103__THThreadNetworkCredentialsKeychainBackingStore_deletePreferredAndFrozenThreadNetworksWithCompletion___block_invoke_cold_7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: No Preferred Networks in Database for deletion ", v2, v3, v4, v5, v6);
}

- (void)getOneRecordForNetwork:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Could not fetched Active dataset record", v2, v3, v4, v5, v6);
}

- (void)getOneRecordForNetwork:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to fetch records", v2, v3, v4, v5, v6);
}

- (void)getNumberOfRecordsForKeychainAccessGroup:count:.cold.1()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x22u);
}

- (void)deleteAllRecordsForKeychainAccessGroup:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to delete records", v2, v3, v4, v5, v6);
}

- (void)deleteAllRecordsForKeychainAccessGroup:.cold.2()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s:%d: Deleting all records for com.apple.thread.dataset, Deletion result :(err=%d)", v2, v3, v4, v5, 2u);
}

- (void)checkIfActiveDatasetRecordIsPresentInTheGivenList:(void *)a1 Missinglist:(void *)a2 record:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint32_t v17 = [a1 network];
  uint64_t v5 = [v17 networkName];
  unsigned int v16 = [a1 network];
  uint8_t v6 = [v16 extendedPANID];
  uint64_t v7 = [a1 borderAgent];
  uint64_t v8 = [v7 discriminatorId];
  uint64_t v9 = [a2 network];
  id v10 = [v9 networkName];
  unsigned int v11 = [a2 network];
  unsigned int v12 = [v11 extendedPANID];
  unsigned int v13 = [a2 borderAgent];
  id v14 = [v13 discriminatorId];
  *(_DWORD *)buf = 136316930;
  unsigned int v19 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfActiveDatasetRecordIsPresentInTheGivenList:Missinglist:record:]";
  __int16 v20 = 1024;
  int v21 = 2463;
  __int16 v22 = 2112;
  id v23 = v5;
  __int16 v24 = 2112;
  uint64_t v25 = v6;
  __int16 v26 = 2112;
  __int16 v27 = v8;
  __int16 v28 = 2112;
  unsigned int v29 = v10;
  __int16 v30 = 2112;
  id v31 = v12;
  __int16 v32 = 2112;
  uint64_t v33 = v14;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s:%d: record (name : %@ | xpanid : %@ | baID : %@) is matching with listItem record (name : %@ | xpanid : %@ | baID : %@)", buf, 0x4Eu);
}

- (void)thDumpActiveDatasetRecord:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "\t-----------------\n", v2, v3, v4, v5, v6);
}

- (void)thDumpActiveDatasetRecord:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 lastModificationDate];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v2, v3, "\t\t  - Last modified on: \t%@\n", v4, v5, v6, v7, v8);
}

- (void)thDumpActiveDatasetRecord:(void *)a1 .cold.3(void *a1)
{
  uint64_t v1 = [a1 creationDate];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v2, v3, "\t\t  - Created on: \t%@\n", v4, v5, v6, v7, v8);
}

- (void)thDumpActiveDatasetRecord:(void *)a1 .cold.4(void *a1)
{
  uint64_t v1 = [a1 keychainAccessGroup];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v2, v3, "\t\t  - Access Group: \t%@\n", v4, v5, v6, v7, v8);
}

- (void)thDumpActiveDatasetRecord:(void *)a1 .cold.5(void *a1)
{
  uint64_t v1 = [a1 credentials];
  uint64_t v2 = [v1 userInfo];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v3, v4, "\t\t  - User Info: \t%@\n", v5, v6, v7, v8, v9);
}

- (void)thDumpActiveDatasetRecord:(void *)a1 .cold.6(void *a1)
{
  uint64_t v1 = [a1 credentialsDataSet];
  uint64_t v2 = [v1 dataSetArray];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v3, v4, "\t\t  - DataSet Credentials: %@\n", v5, v6, v7, v8, v9);
}

- (void)thDumpActiveDatasetRecord:(void *)a1 .cold.7(void *a1)
{
  uint64_t v1 = [a1 credentials];
  [v1 channel];
  OUTLINED_FUNCTION_26((void *)&_mh_execute_header, v2, v3, "\t\t  - Network Channel: \t%u\n", v4, v5, v6, v7, 0);
}

- (void)thDumpActiveDatasetRecord:(void *)a1 .cold.8(void *a1)
{
  uint64_t v1 = [a1 credentials];
  uint64_t v2 = [v1 passPhrase];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v3, v4, "\t\t  - Passphrase: \t%@\n", v5, v6, v7, v8, v9);
}

- (void)thDumpActiveDatasetRecord:(void *)a1 .cold.9(void *a1)
{
  uint64_t v1 = [a1 credentials];
  uint64_t v2 = [v1 PSKc];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v3, v4, "\t\t  - PSKc: \t\t%@\n", v5, v6, v7, v8, v9);
}

- (void)thDumpActiveDatasetRecord:(void *)a1 .cold.10(void *a1)
{
  uint64_t v1 = [a1 credentials];
  uint64_t v2 = [v1 masterKey];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v3, v4, "\t\t  - Master Key: \t%@\n", v5, v6, v7, v8, v9);
}

- (void)thDumpActiveDatasetRecord:(void *)a1 .cold.11(void *a1)
{
  uint64_t v1 = [a1 credentials];
  uint64_t v2 = [v1 PANID];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v3, v4, "\t\t  - Network PANID: \t%@\n", v5, v6, v7, v8, v9);
}

- (void)thDumpActiveDatasetRecord:(void *)a1 .cold.12(void *a1)
{
  uint64_t v1 = [a1 network];
  uint64_t v2 = [v1 extendedPANID];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v3, v4, "\t\t  - Network XPANID: \t%@\n", v5, v6, v7, v8, v9);
}

- (void)thDumpActiveDatasetRecord:(void *)a1 .cold.13(void *a1)
{
  uint64_t v1 = [a1 network];
  uint64_t v2 = [v1 networkName];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v3, v4, "\t\t  - Network Name: \t%@\n", v5, v6, v7, v8, v9);
}

- (void)thDumpActiveDatasetRecord:(void *)a1 .cold.14(void *a1)
{
  uint64_t v1 = [a1 borderAgent];
  uint64_t v2 = [v1 discriminatorId];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v3, v4, "\t\t  - Border Agent Discriminator ID : %@\n", v5, v6, v7, v8, v9);
}

- (void)thDumpActiveDatasetRecord:(void *)a1 .cold.15(void *a1)
{
  uint64_t v1 = [a1 uniqueIdentifier];
  id v2 = [v1 UUIDString];
  [v2 UTF8String];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v3, v4, "\t\t  - UUID: \t\t%s\n", v5, v6, v7, v8, v9);
}

- (void)thDumpActiveDatasetRecord:.cold.16()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "\t==== Credentials ====\n", v2, v3, v4, v5, v6);
}

void __78__THThreadNetworkCredentialsKeychainBackingStore_cleanThreadKeychainDatabase___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to delete all com.apple.thread.network records", v2, v3, v4, v5, v6);
}

void __78__THThreadNetworkCredentialsKeychainBackingStore_cleanThreadKeychainDatabase___block_invoke_cold_2(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, v1, v2, "%s:%d: After BA record cleanup, BA records count in DB: %lu ", v3, v4, v5, v6, 2u);
}

void __78__THThreadNetworkCredentialsKeychainBackingStore_cleanThreadKeychainDatabase___block_invoke_cold_3(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, v1, v2, "%s:%d: After BA record cleanup, Missing BA records count in DB: %lu ", v3, v4, v5, v6, 2u);
}

void __78__THThreadNetworkCredentialsKeychainBackingStore_cleanThreadKeychainDatabase___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed deleting all records for com.apple.thread.dataset Failed", v2, v3, v4, v5, v6);
}

void __78__THThreadNetworkCredentialsKeychainBackingStore_cleanThreadKeychainDatabase___block_invoke_cold_5(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, v1, v2, "%s:%d: Before BA record cleanup, BA records count in DB: %lu ", v3, v4, v5, v6, 2u);
}

void __78__THThreadNetworkCredentialsKeychainBackingStore_cleanThreadKeychainDatabase___block_invoke_cold_6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: No Preferred Network in the Database ", v2, v3, v4, v5, v6);
}

void __78__THThreadNetworkCredentialsKeychainBackingStore_cleanThreadKeychainDatabase___block_invoke_cold_7(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, v1, v2, "%s:%d: deleting items from cleanUpPreferredList,  size of cleanUpPreferredList : %lu ", v3, v4, v5, v6, 2u);
}

void __78__THThreadNetworkCredentialsKeychainBackingStore_cleanThreadKeychainDatabase___block_invoke_cold_8(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, v1, v2, "%s:%d: updating records from toBeUpdatedPreferredList,  size of toBeUpdatedPreferredList : %lu ", v3, v4, v5, v6, 2u);
}

void __78__THThreadNetworkCredentialsKeychainBackingStore_cleanThreadKeychainDatabase___block_invoke_cold_9(void *a1, void *a2)
{
  [a1 count];
  [a2 count];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(v3, v4, v5, v6, v7, 0x26u);
}

void __78__THThreadNetworkCredentialsKeychainBackingStore_cleanThreadKeychainDatabase___block_invoke_cold_10()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to delete all records for com.apple.thread.network, Deletion result :(err=%d)", v2, v3, v4, v5, 2u);
}

void __78__THThreadNetworkCredentialsKeychainBackingStore_cleanThreadKeychainDatabase___block_invoke_cold_11()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s:%d: Deleting all records for com.apple.thread.network, Deletion result :(err=%d)", v2, v3, v4, v5, 2u);
}

void __78__THThreadNetworkCredentialsKeychainBackingStore_cleanThreadKeychainDatabase___block_invoke_cold_12()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Request to Clean the Thread keychain database", v2, v3, v4, v5, v6);
}

- (void)isPreferred:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to fetch preferred networks", v2, v3, v4, v5, v6);
}

- (void)isPreferred:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 network];
  uint64_t v2 = [v1 networkName];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, v3, v4, "%s:%d: No Preferred Networks for Network Name : %@ ", v5, v6, v7, v8, 2u);
}

- (void)getCountOfThreadBorderRoutersWithMdns:.cold.1()
{
  v2[0] = 136315650;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_9_0((void *)&_mh_execute_header, v0, v1, "%s : %d :  Found networks : %lu", (uint8_t *)v2);
}

- (void)getCountOfThreadBorderRoutersWithMdns:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Finding Thread network Broder Routers around", v2, v3, v4, v5, v6);
}

- (void)isMatchingMdnsRecords:(void *)a1 preferredNw:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v3 = [a1 networkName];
  uint8_t v9 = [a2 networkName];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(v4, v5, v6, v7, v8, 0x20u);
}

- (void)isMatchingNetworkSignature:preferredNwSignature:preferred:signaturePrefEntries:updatedPreferred:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d : Current device WiFi info is empty and Preferred Network WiFi info is available, no need to update !", v2, v3, v4, v5, v6);
}

- (void)isMatchingNetworkSignature:preferredNwSignature:preferred:signaturePrefEntries:updatedPreferred:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d : Preferred Network WiFi info is empty, updating it !", v2, v3, v4, v5, v6);
}

- (void)isMatchingNetworkSignature:preferredNwSignature:preferred:signaturePrefEntries:updatedPreferred:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Unable to convert Set to Array", v2, v3, v4, v5, v6);
}

- (void)matchPreferredNetworkRecordWithMdns:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Error, semaphore wait timed out ", v2, v3, v4, v5, v6);
}

- (void)matchPreferredNetworkRecordWithMdns:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Error, Failed to dispatch scan", v2, v3, v4, v5, v6);
}

- (void)getTheMdnsMatchingEntryFromTheList:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Error, semaphore wait timed out ", v2, v3, v4, v5, v6);
}

- (void)getTheMdnsMatchingEntryFromTheList:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Error, Failed to start the dispatch scan", v2, v3, v4, v5, v6);
}

- (void)deletePreferredNetworkEntry:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to delete preferred networks", v2, v3, v4, v5, v6);
}

- (void)deletePreferredNetworkEntry:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 network];
  uint64_t v2 = [v1 networkName];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, v3, v4, "%s:%d: Failed deleting thread credentials for preferred network : %@", v5, v6, v7, v8, 2u);
}

- (void)deletePreferredNetworkEntry:(void *)a1 .cold.3(void *a1)
{
  uint64_t v1 = [a1 network];
  uint64_t v2 = [v1 networkName];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v3, v4, "Failed deleting Preferred Network %@", v5, v6, v7, v8, v9);
}

- (void)deletePreferredNetworkEntryWithoutRecords:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to delete preferred networks", v2, v3, v4, v5, v6);
}

- (void)deletePreferredNetworkEntryWithoutRecords:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 network];
  uint64_t v2 = [v1 networkName];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, v3, v4, "%s : %d: Failed deleting Preferred Network %@", v5, v6, v7, v8, 2u);
}

- (void)checkIfNetworkSignatureUpdateIsRequiredForPreferredNetwork:nwSignature:signaturePrefEntries:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create instance of updated preferred network ", v2, v3, v4, v5, v6);
}

- (void)matchPreferredNetworkWithNetworkSignature:nwSignature:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: network signature is nil... ", v2, v3, v4, v5, v6);
}

- (void)dumpPreferredNetwork:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Preferred Network is empty ", v2, v3, v4, v5, v6);
}

- (void)dumpPreferredNetworksArray:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Preferred Network records empty ", v2, v3, v4, v5, v6);
}

- (void)dumpPreferredNetworksArray:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Not dumping more than ten Preferred Network records  ", v2, v3, v4, v5, v6);
}

- (void)dumpPreferredNetworks:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Preferred Network records empty ", v2, v3, v4, v5, v6);
}

- (void)dumpPreferredNetworks:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Not dumping more than ten Preferred Network records  ", v2, v3, v4, v5, v6);
}

- (void)dumpFrozenThreadNetworks:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Not dumping more than ten Frozen Thread Network records  ", v2, v3, v4, v5, v6);
}

- (void)sortAndReturnPreferredNetwork:onlyMdns:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Unable to convert Set to Array", v2, v3, v4, v5, v6);
}

- (void)sortAndReturnPreferredNetwork:onlyMdns:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to delete frozen preferred networks", v2, v3, v4, v5, v6);
}

- (void)sortAndReturnPreferredNetwork:(void *)a1 onlyMdns:.cold.4(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, v1, v2, "%s : %d - Matching Networks in Database with mDNS Browse, number of records to match are :  %lu", v3, v4, v5, v6, 2u);
}

- (void)getPrefEntriesForLabelAsSSID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to fetch preferred networks for a given Label as ssid", v2, v3, v4, v5, v6);
}

- (void)getPrefEntriesForSSIDAndSignature:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to fetch preferred networks for a given network signature", v2, v3, v4, v5, v6);
}

- (void)getPrefEntriesForSSID:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 wifiSSID];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, v2, v3, "%s:%d: Failed to create query to fetch preferred networks for a given ssid : %@", v4, v5, v6, v7, 2u);
}

- (void)getPrefEntriesForSignature:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to fetch preferred networks for a given network signature", v2, v3, v4, v5, v6);
}

- (void)getAllPrefEntries
{
  [a1 count];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, v1, v2, "%s : %d - Total Preferred Networks in the Database = %lu", v3, v4, v5, v6, 2u);
}

- (void)getNumberOfPrefEntriesForTheCount:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to fetch preferred networks", v2, v3, v4, v5, v6);
}

- (void)getNumberOfPrefEntriesForTheCount:.cold.2()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s:%d: No Preferred Network in the Database for count : %d", v2, v3, v4, v5, 2u);
}

- (void)getNumberOfPrefEntriesForTheCount:(void *)a1 .cold.3(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x22u);
}

- (void)updatePreferredNetwork
{
  [a1 count];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, v1, v2, "%s : %d - Matching Networks in Database for Network = %lu", v3, v4, v5, v6, 2u);
}

- (void)getPreferredNetwork:skipScan:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Could not get Network Signature", v2, v3, v4, v5, v6);
}

- (void)getPreferredNetwork:skipScan:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Could not find preferred network for SSID or signature", v2, v3, v4, v5, v6);
}

- (void)getPreferredNetwork:skipScan:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: No Preferred Network in the Database ", v2, v3, v4, v5, v6);
}

- (void)getPreferredNetwork:(void *)a1 skipScan:.cold.4(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, v1, v2, "%s : %d - Total Preferred Networks in the Database = %lu", v3, v4, v5, v6, 2u);
}

- (void)DBGstorePreferred:.cold.1()
{
  OUTLINED_FUNCTION_24();
  uint64_t v2 = [v1 network];
  [v2 networkName];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_25() network];
  uint64_t v4 = [v3 extendedPANID];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_16((void *)&_mh_execute_header, v5, v6, "%s:%d:#mOS:Failed to store Preferred Network (networkName=%@, xpanid=%@) keychainAddDict is NULL", v7, v8, v9, v10, 2u);
}

- (void)DBGstorePreferred:.cold.2()
{
  OUTLINED_FUNCTION_20_0();
  uint64_t v2 = [v1 network];
  uint64_t v3 = [v2 networkName];
  uint64_t v4 = [v0 network];
  uint64_t v5 = [v4 extendedPANID];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_19_0((void *)&_mh_execute_header, v6, v7, "%s:%d:#mOS:Failed to store Preferred Network (networkName=%@, xpanid=%@) with error = %d", v8, v9, v10, v11, 2u);
}

- (void)storePreferred:.cold.1()
{
  OUTLINED_FUNCTION_24();
  uint64_t v2 = [v1 network];
  [v2 networkName];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_25() network];
  uint64_t v4 = [v3 extendedPANID];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_16((void *)&_mh_execute_header, v5, v6, "%s:%d:Failed to store Preferred Network (networkName=%@, xpanid=%@) keychainAddDict is NULL", v7, v8, v9, v10, 2u);
}

- (void)storePreferred:.cold.2()
{
  OUTLINED_FUNCTION_20_0();
  uint64_t v2 = [v1 network];
  uint64_t v3 = [v2 networkName];
  uint64_t v4 = [v0 network];
  uint64_t v5 = [v4 extendedPANID];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_19_0((void *)&_mh_execute_header, v6, v7, "%s:%d:#mOS:Failed to store Preferred Network (networkName=%@, xpanid=%@) with error = %d", v8, v9, v10, v11, 2u);
}

- (void)storePreferred:(void *)a1 .cold.3(void *a1)
{
  id v1 = [a1 network];
  uint64_t v2 = [v1 networkName];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, v3, v4, "%s:%d: Preferred network (name : %@) already exists. Updating the existing entry", v5, v6, v7, v8, 2u);
}

- (void)storePreferredEntryAndCheckForDup:isDuplicate:.cold.1()
{
  OUTLINED_FUNCTION_24();
  uint64_t v2 = [v1 network];
  [v2 networkName];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_25() network];
  uint64_t v4 = [v3 extendedPANID];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_16((void *)&_mh_execute_header, v5, v6, "%s:%d:Failed to store Preferred Network (networkName=%@, xpanid=%@) keychainAddDict is NULL", v7, v8, v9, v10, 2u);
}

- (void)storePreferredEntryAndCheckForDup:isDuplicate:.cold.2()
{
  OUTLINED_FUNCTION_20_0();
  uint64_t v2 = [v1 network];
  uint64_t v3 = [v2 networkName];
  uint64_t v4 = [v0 network];
  uint64_t v5 = [v4 extendedPANID];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_19_0((void *)&_mh_execute_header, v6, v7, "%s:%d:#mOS:Failed to store Preferred Network (networkName=%@, xpanid=%@) with error = %d", v8, v9, v10, v11, 2u);
}

- (void)storePreferredEntryAndCheckForDup:isDuplicate:.cold.3()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s:%d SecItemUpdate returned error while updating preferred network entry err=%d", v2, v3, v4, v5, 2u);
}

- (void)storePreferredEntryAndCheckForDup:(void *)a1 isDuplicate:.cold.4(void *a1)
{
  uint64_t v1 = [a1 network];
  uint64_t v2 = [v1 networkName];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, v3, v4, "%s:%d: Preferred network (name : %@) already exists. Updating the existing entry", v5, v6, v7, v8, 2u);
}

- (void)storeFrozenThreadNetwork:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 credentialsDataSet];
  uint64_t v2 = [v1 dataSetArray];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, v3, v4, "%s:%d:Failed to store frozen thread network %@", v5, v6, v7, v8, 2u);
}

- (void)storeFrozenThreadNetwork:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 credentialsDataSet];
  uint64_t v2 = [v1 dataSetArray];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, v3, v4, "%s:%d:Failed to store frozen thread network to keychain : %@", v5, v6, v7, v8, 2u);
}

- (void)storeFrozenThreadNetwork:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: frozen thread network credential already exists.", v2, v3, v4, v5, v6);
}

- (void)getNetworkSignature
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d Error : Device is **not** on ethernet, **not** on WiFi, returning nil", v2, v3, v4, v5, v6);
}

- (void)getPreferredNetworkWithRecords
{
  uint64_t v1 = [a1 network];
  uint64_t v2 = [v1 networkName];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v3, v4, "Failed deleting Preferred Network entry : %@", v5, v6, v7, v8, v9);
}

- (void)updatePreferredNetworkEntry:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Record parameter is invalid ", v2, v3, v4, v5, v6);
}

- (void)updatePreferredNetworkEntry:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create instance of updated preferred network ", v2, v3, v4, v5, v6);
}

- (void)updatePreferredNetworkEntry:.cold.3()
{
  OUTLINED_FUNCTION_24();
  uint64_t v2 = [v1 network];
  [v2 networkName];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_25() network];
  uint64_t v4 = [v3 extendedPANID];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_16((void *)&_mh_execute_header, v5, v6, "%s:%d: Failed to delete the previous preferred network entry : (name : %@ | xpanid : %@)", v7, v8, v9, v10, 2u);
}

- (void)updatePreferredNetworkEntry:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create instance of updated preferred network ", v2, v3, v4, v5, v6);
}

- (void)updateRecordToPreferredNetworkEntry:credentialsDataSetRecord:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Record parameter is invalid ", v2, v3, v4, v5, v6);
}

- (void)updateRecordToPreferredNetworkEntry:credentialsDataSetRecord:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create instance of updated preferred network ", v2, v3, v4, v5, v6);
}

- (void)updateRecordToPreferredNetworkEntry:credentialsDataSetRecord:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create instance of updated preferred network ", v2, v3, v4, v5, v6);
}

- (void)updateRecordToPreferredNetworkEntry:(NSObject *)a3 credentialsDataSetRecord:.cold.4(void *a1, void *a2, NSObject *a3)
{
  uint8_t v6 = [a1 network];
  uint64_t v7 = [v6 networkName];
  uint64_t v8 = [a1 network];
  uint64_t v9 = [v8 extendedPANID];
  uint64_t v10 = [a2 network];
  uint64_t v11 = [v10 networkName];
  unsigned int v12 = [a2 network];
  unsigned int v13 = [v12 extendedPANID];
  *(_DWORD *)unsigned int v15 = 136316418;
  OUTLINED_FUNCTION_18();
  *(_DWORD *)&v15[7] = 4706;
  v15[9] = 2112;
  unsigned int v16 = v7;
  __int16 v17 = 2112;
  id v18 = v9;
  __int16 v19 = 2112;
  __int16 v20 = v11;
  __int16 v21 = 2112;
  uint64_t v22 = v14;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s:%d:Preferred network entry (name : %@, xpanid : %@), record netowrk (name : %@, xpanid : %@) and datasets are matching. No need to update", (uint8_t *)v15, 0x3Au);
}

- (void)updateRecordToPreferredNetworkEntry:credentialsDataSetRecord:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create instance of updated preferred network ", v2, v3, v4, v5, v6);
}

- (void)updateRecordToPreferredNetworkEntry:(void *)a1 credentialsDataSetRecord:.cold.6(void *a1)
{
  uint64_t v1 = [a1 network];
  uint64_t v2 = [v1 networkName];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, v3, v4, "%s:%d: Failed to delete the previous record : (name : %@)", v5, v6, v7, v8, 2u);
}

- (void)updateRecordToPreferredNetworkEntry:(void *)a1 credentialsDataSetRecord:.cold.7(void *a1)
{
  uint64_t v1 = [a1 network];
  uint64_t v2 = [v1 networkName];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, v3, v4, "%s:%d: Failed to delete the previous preferred network entry : (name : %@)", v5, v6, v7, v8, 2u);
}

- (void)updateRecordToPreferredNetworkEntry:credentialsDataSetRecord:.cold.8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create instance of updated preferred network ", v2, v3, v4, v5, v6);
}

- (void)deleteActiveDataSetRecordForNetworkAndBorderAgentId:borderAgent:.cold.1()
{
  v2[0] = 136315650;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_9_0((void *)&_mh_execute_header, v0, v1, "%s:%d Failed deleting thread credentials: %@", (uint8_t *)v2);
}

- (void)markAsPreferred:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d:Failed to update record to preferred network entry.", v2, v3, v4, v5, v6);
}

- (void)markAsPreferred:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d:record parameter is passed nil, returning", v2, v3, v4, v5, v6);
}

- (void)areValidDataSetTLVs:creds:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "#MOS creds could not be parsed", v2, v3, v4, v5, v6);
}

- (void)areValidDataSetTLVs:creds:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "#MOS network could not be parsed", v2, v3, v4, v5, v6);
}

- (void)areValidDataSetTLVs:creds:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "#MOS credDataset could not be allocated", v2, v3, v4, v5, v6);
}

- (void)areValidDataSetTLVs:creds:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "#MOS borderAgent could not be allocated", v2, v3, v4, v5, v6);
}

- (void)areValidDataSetTLVs:creds:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "#MOS Credentials record could not be parsed", v2, v3, v4, v5, v6);
}

- (void)areValidDataSetTLVs:creds:.cold.6()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "#MOS creds master_key :%{sensitive}@ : Line : %d", v2, v3, v4, v5, v6);
}

- (void)areValidDataSetTLVs:creds:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: %d: Parsed dataset tlvs successfully", v2, v3, v4, v5, v6);
}

- (void)areValidDataSetTLVs:creds:.cold.8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: %d: Can not parse dataset tlvs", v2, v3, v4, v5, v6);
}

- (void)areValidDataSetTLVs:creds:.cold.9()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: %d: Not a dataset tlv", v2, v3, v4, v5, v6);
}

- (void)areValidDataSetTLVs:creds:.cold.10()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Decoded TLV, format is invalid, current position goes out of bound, Line : %d", v2, v3, v4, v5, v6);
}

- (void)areValidDataSetTLVs:creds:.cold.11()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Decoded Channel mask, mask entry format is invalid, Line : %d", v2, v3, v4, v5, v6);
}

- (void)areValidDataSetTLVs:creds:.cold.12()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> error : Decoded entry length is not matching,  Line : %d", v2, v3, v4, v5, v6);
}

- (void)areValidDataSetTLVs:creds:.cold.13()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> error : Decoded Channel page is neither zero nor 2,  Line : %d", v2, v3, v4, v5, v6);
}

- (void)areValidDataSetTLVs:(uint64_t)a3 creds:(uint64_t)a4 .cold.14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)areValidDataSetTLVs:(uint64_t)a3 creds:(uint64_t)a4 .cold.15(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)areValidDataSetTLVs:(uint64_t)a3 creds:(uint64_t)a4 .cold.16(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)areValidDataSetTLVs:creds:.cold.17()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Decoded channel Len : %d", v2, v3, v4, v5, v6);
}

- (void)areValidDataSetTLVs:creds:.cold.18()
{
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid pan id length %d, Line : %d", v2, v3, v4, v5, 2u);
}

- (void)areValidDataSetTLVs:creds:.cold.19()
{
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid extended pan id length %d, Line : %d", v2, v3, v4, v5, 2u);
}

- (void)areValidDataSetTLVs:creds:.cold.20()
{
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid pskc length %d, Line : %d", v2, v3, v4, v5, 2u);
}

- (void)areValidDataSetTLVs:creds:.cold.21()
{
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid network key length %d, Line : %d", v2, v3, v4, v5, 2u);
}

- (void)areValidDataSetTLVs:creds:.cold.22()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid rotation time, Line : %d", v2, v3, v4, v5, v6);
}

- (void)areValidDataSetTLVs:creds:.cold.23()
{
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid Security Policy length %d, Line : %d", v2, v3, v4, v5, 2u);
}

- (void)areValidDataSetTLVs:creds:.cold.24()
{
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid Mesh local prefix length %d, Line : %d", v2, v3, v4, v5, 2u);
}

- (void)areValidDataSetTLVs:creds:.cold.25()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Decoded TLV, format is invalid, current position goes out of bound, Line : %d", v2, v3, v4, v5, v6);
}

- (void)generateCredentials
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d Generation Error : Device is **not** on ethernet and **not** on WiFi", v2, v3, v4, v5, v6);
}

@end