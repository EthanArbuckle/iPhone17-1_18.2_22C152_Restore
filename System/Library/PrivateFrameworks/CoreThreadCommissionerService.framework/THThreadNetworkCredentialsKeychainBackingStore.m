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
- (void)updatePreferredNetworkInternallyWithCompletion:(id)a3;
- (void)updatePreferredNetworkWithNewDatasetRecord:(id)a3 completion:(id)a4;
- (void)validateAODInternally:(id)a3 completion:(id)a4;
- (void)validateRecordWithMdnsScan:(id)a3 borderAgentID:(id)a4 completion:(id)a5;
@end

@implementation THThreadNetworkCredentialsKeychainBackingStore

+ (id)defaultBackingStore
{
  if (qword_10007D658 != -1) {
    dispatch_once(&qword_10007D658, &stru_100074E18);
  }
  v2 = (void *)qword_10007D650;

  return v2;
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
      v18 = sub_10001CCA0(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10003B494();
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
      v20 = sub_10001CCA0(1);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10003B4FC();
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
              v16 = sub_10001CCA0(1);
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
  block[2] = sub_10001D24C;
  block[3] = &unk_100074E40;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)retrieveAllRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  OSStatus v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001D464;
  v7[3] = &unk_100074E68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)retrieveRecordWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D6C0;
  block[3] = &unk_100074E40;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)errorout:(int)a3 completion:(id)a4
{
  OSStatus v5 = (void (**)(id, void, void *))a4;
  id v6 = (__CFString *)SecCopyErrorMessageString(a3, 0);
  id v7 = sub_10001CCA0(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_10003B564();
  }

  id v8 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:a3 userInfo:0];
  id v9 = +[NSError storeError:2 underlyingError:v8 description:v6];
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
  id v9 = [v6 keyChainItemRepresentationForAddOperation];
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
      v14[2] = sub_10001DB1C;
      v14[3] = &unk_100074F30;
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

- (void)storeRecord:(id)a3 completion:(id)a4
{
}

- (void)storeRecord:(id)a3 waitForSync:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = dispatch_get_global_queue(0, 0);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001E994;
  v13[3] = &unk_100074F58;
  id v15 = self;
  id v16 = v9;
  BOOL v17 = a4;
  id v14 = v8;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)deleteRecordWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = dispatch_get_global_queue(0, 0);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001ECF0;
  v10[3] = &unk_100074E68;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
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
    id v7 = (void *)SecCopyErrorMessageString(v5, 0);
    id v9 = sub_10001CCA0(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003B640();
    }

    if (a4)
    {
      id v10 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v6 userInfo:0];
      *a4 = +[NSError storeError:2 underlyingError:v10 description:v7];
    }
LABEL_10:
    id v8 = 0;
    goto LABEL_11;
  }
  id v7 = (void *)result;
  if (!result)
  {
    id v12 = sub_10001CCA0(1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10003B6A8(v12, v13, v14, v15, v16, v17, v18, v19);
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
      id v7 = +[NSSet set];
    }
    else
    {
      uint64_t v16 = (__CFString *)SecCopyErrorMessageString(v5, 0);
      uint64_t v17 = sub_10001CCA0(1);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10003B640();
      }

      if (a4)
      {
        uint64_t v18 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v6 userInfo:0];
        *a4 = +[NSError storeError:2 underlyingError:v18 description:v16];
      }
      id v7 = 0;
    }
  }
  else
  {
    id v8 = (void *)result;
    if (result && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      uint64_t v19 = sub_10001CCA0(1);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10003B4FC();
      }

      if (a4)
      {
        +[NSError storeError:3 description:@"Bad return type from SecItemCopyMatching"];
        id v7 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v7 = 0;
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

      id v7 = +[NSSet setWithArray:v9];
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
      id v7 = sub_10001CCA0(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10003B780();
      }

      id v8 = +[NSSet set];
    }
    else
    {
      uint64_t v17 = (__CFString *)SecCopyErrorMessageString(v5, 0);
      uint64_t v18 = sub_10001CCA0(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10003B718();
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
      v20 = sub_10001CCA0(1);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10003B7FC();
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
      id v7 = sub_10001CCA0(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10003B8E4();
      }

      id v8 = +[NSSet set];
    }
    else
    {
      uint64_t v17 = (__CFString *)SecCopyErrorMessageString(v5, 0);
      uint64_t v18 = sub_10001CCA0(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10003B87C();
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
      v20 = sub_10001CCA0(1);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10003B960();
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
  v11[3] = sub_10001FAD0;
  v11[4] = sub_10001FAE0;
  id v12 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = sub_10001FAD0;
  v9[4] = sub_10001FAE0;
  id v10 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001FAE8;
  v5[3] = &unk_100074F80;
  id v7 = v11;
  id v8 = v9;
  id v4 = a3;
  v5[4] = self;
  id v6 = v4;
  [(THThreadNetworkCredentialsKeychainBackingStore *)self retrieveAllActiveDataSetRecordsWithCompletion:v5];

  _Block_object_dispose(v9, 8);
  _Block_object_dispose(v11, 8);
}

- (void)retrieveAllActiveDataSetRecordsForNetwork:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020180;
  block[3] = &unk_100074E40;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)retrieveAllActiveDataSetRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  OSStatus v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000203B8;
  v7[3] = &unk_100074E68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)retrieveActiveDataSetRecordWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020584;
  block[3] = &unk_100074E40;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)retrieveActiveDataSetRecordWithExtendedPANId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000207A8;
  block[3] = &unk_100074E40;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)retrieveActiveDataSetRecordOnMdnsWithExtendedPANId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000209CC;
  block[3] = &unk_100074E40;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)retrieveActiveDataSetRecordForThreadBorderAgent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020CE0;
  block[3] = &unk_100074E40;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)retrieveActiveDataSetRecordWithTLVsForThreadBorderAgent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020F14;
  block[3] = &unk_100074E40;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (id)getActiveRecords:(id)a3
{
  id v4 = a3;
  OSStatus v5 = sub_10001CCA0(1);
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
        id v12 = &AWDPostMetric_ptr;
        id v59 = v4;
        v55 = self;
        v56 = v6;
        unint64_t v54 = v8;
        do
        {
          id v13 = -[ThreadBRFinder getBorderAgentForIndex:](v6, "getBorderAgentForIndex:", v11, v53);
          id v14 = v13;
          if (v13)
          {
            uint64_t v15 = [v13 addresses];

            if (v15)
            {
              uint64_t v16 = v12[191];
              uint64_t v17 = [v14 TXTRecordData];
              uint64_t v18 = [v16 dictionaryFromTXTRecordData:v17];

              if (!v18)
              {
                v29 = sub_10001CCA0(1);
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
              v62 = v18;
              uint64_t v19 = [v18 objectForKey:@"xa"];
              v20 = sub_10001CCA0(1);
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

              v60 = v14;
              if (v19)
              {
                if ([v19 length] != (id)16)
                {
                  v32 = self;
                  v33 = v19;
                  id v34 = [v19 length];
                  long long v24 = sub_10001CCA0(1);
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
                    v61 = 0;
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
                          v40 = *(void **)(*((void *)&v63 + 1) + 8 * i);
                          v41 = [v40 borderAgent];
                          v42 = [v41 discriminatorId];
                          unsigned int v43 = [v42 isEqualToData:v23];

                          if (v43)
                          {
                            v44 = sub_10001CCA0(1);
                            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                            {
                              v45 = [v40 borderAgent];
                              v46 = [v45 discriminatorId];
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
                      id v12 = &AWDPostMetric_ptr;
                      uint64_t v19 = v57;
                    }
                    else
                    {
                      id v12 = &AWDPostMetric_ptr;
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
                      v61 = 0;
                    }
                    else
                    {
                      id v23 = 0;
                      v61 = 0;
                      uint64_t v19 = v33;
                    }
                    self = v32;
                    id v4 = v59;
                  }
                  goto LABEL_53;
                }
                long long v21 = sub_10001CCA0(1);
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
                  v61 = v22;
                  -[THThreadNetworkCredentialsKeychainBackingStore dataFromHexString:](self, "dataFromHexString:");
                  id v23 = (id)objc_claimAutoreleasedReturnValue();
                  long long v24 = sub_10001CCA0(1);
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
                  v29 = v61;
                  uint64_t v18 = v62;
LABEL_54:

                  goto LABEL_55;
                }
                long long v24 = sub_10001CCA0(1);
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  v69 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveRecords:]";
                  __int16 v70 = 1024;
                  *(_DWORD *)v71 = 873;
                  *(_WORD *)&v71[4] = 2112;
                  *(void *)&v71[6] = v14;
                  __int16 v30 = v24;
                  int v31 = "%s : %d baid nsstring conversion failure, server : %@, continue to next network";
LABEL_51:
                  _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, v31, buf, 0x1Cu);
                }
              }
              else
              {
                long long v24 = sub_10001CCA0(1);
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  v69 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveRecords:]";
                  __int16 v70 = 1024;
                  *(_DWORD *)v71 = 852;
                  *(_WORD *)&v71[4] = 2112;
                  *(void *)&v71[6] = v14;
                  __int16 v30 = v24;
                  int v31 = "%s : %d cannot parse dictionary data for server : %@, continue to next network";
                  goto LABEL_51;
                }
              }
              id v23 = 0;
              v61 = 0;
              goto LABEL_53;
            }
            uint64_t v18 = sub_10001CCA0(1);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v53;
              v69 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveRecords:]";
              __int16 v70 = 2112;
              *(void *)v71 = v14;
              long long v26 = v18;
              v27 = "%s : No IP address is available for the server : %@, continue to next BR";
              uint32_t v28 = 22;
              goto LABEL_25;
            }
          }
          else
          {
            uint64_t v18 = sub_10001CCA0(1);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v53;
              v69 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveRecords:]";
              __int16 v70 = 1024;
              *(_DWORD *)v71 = 831;
              long long v26 = v18;
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
        v50 = +[NSSet setWithArray:v7];
        goto LABEL_70;
      }
    }
    else
    {
      v51 = sub_10001CCA0(1);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        sub_10003BCBC();
      }
    }
  }
  else
  {
    id v7 = sub_10001CCA0(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10003BC40();
    }
  }
  v50 = 0;
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
  v13[2] = sub_100021CD0;
  v13[3] = &unk_100074FA8;
  BOOL v17 = a4;
  id v14 = v8;
  uint64_t v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)retrieveAllActiveDataSetRecordsForClientKeychainAccessGroup:(id)a3 completion:(id)a4
{
}

- (void)retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup:(id)a3 activeFlag:(BOOL)a4 compleiton:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unint64_t v10 = dispatch_get_global_queue(0, 0);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100022010;
  v13[3] = &unk_100074FA8;
  BOOL v17 = a4;
  id v14 = v8;
  uint64_t v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
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
  v10[2] = sub_100022338;
  v10[3] = &unk_100074E68;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

- (void)deleteActiveDataSetRecordForThreadBorderAgent:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = dispatch_get_global_queue(0, 0);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100022624;
  v10[3] = &unk_100074E68;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
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
    id v13 = +[NSError storeError:4 description:@"Bad network parameter"];
    v7[2](v7, 0, v13);

    id v11 = 0;
LABEL_6:
    unint64_t v10 = 0;
    goto LABEL_7;
  }
  id v22 = 0;
  unint64_t v10 = +[CKKSControl controlObject:&v22];
  id v11 = v22;
  if (!v10)
  {
    id v14 = +[NSError storeError:5 description:@"CKKS object allocation failed"];
    v7[2](v7, 0, v14);

    goto LABEL_6;
  }
  uint64_t v12 = kSecAttrViewHintHome;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100022A9C;
  v15[3] = &unk_100074FF8;
  v20 = v23;
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

- (BOOL)isFrozenRecord:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)THFrozenThreadNetwork);
  id v6 = [v4 credentialsDataSet];
  id v7 = [v5 initWithCredentialsDataSet:v6 creationDate:0 lastModificationDate:0];

  if (v7)
  {
    id v8 = +[THFrozenThreadNetwork keyChainQueryForFrozenThreadNetworkRecordOperationForCredentialsDataSet:v7];
    if (v8)
    {
      id v18 = 0;
      id v9 = [(THThreadNetworkCredentialsKeychainBackingStore *)self _doFetchFrozenThreadNetworks:v8 error:&v18];
      unint64_t v10 = v18;
      id v11 = sub_10001CCA0(1);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = [v9 count];
        *(_DWORD *)buf = 136315650;
        v20 = "-[THThreadNetworkCredentialsKeychainBackingStore isFrozenRecord:]";
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
        id v14 = sub_10001CCA0(1);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          uint64_t v15 = [v4 network];
          id v16 = [v15 networkName];
          *(_DWORD *)buf = 136315650;
          v20 = "-[THThreadNetworkCredentialsKeychainBackingStore isFrozenRecord:]";
          __int16 v21 = 1024;
          int v22 = 1244;
          __int16 v23 = 2112;
          id v24 = v16;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s:%d: Record(name : %@) credentials are marked frozen network in the Database ", buf, 0x1Cu);
        }
      }
      else
      {
        id v14 = sub_10001CCA0(1);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v20 = "-[THThreadNetworkCredentialsKeychainBackingStore isFrozenRecord:]";
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
      unint64_t v10 = sub_10001CCA0(1);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10003BF08();
      }
    }
  }
  else
  {
    BOOL v13 = 1;
    id v8 = sub_10001CCA0(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10003BE8C();
    }
  }

  return v13;
}

- (void)updatePreferredNetworkWithNewDatasetRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023C70;
  block[3] = &unk_100075020;
  BOOL v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)validateAODInternally:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024394;
  block[3] = &unk_100074E40;
  id v12 = v6;
  BOOL v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)storeCachedAODasPreferredNetwork:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002460C;
  block[3] = &unk_100074E40;
  id v12 = v6;
  BOOL v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)storeThreadCredentialActiveDataSetRecord:(id)a3 waitForSync:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = dispatch_get_global_queue(0, 0);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000248F4;
  v13[3] = &unk_100074F58;
  uint64_t v15 = self;
  id v16 = v9;
  id v14 = v8;
  BOOL v17 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)retrieveActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup:(id)a3 keychainAccessGroup:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = dispatch_get_global_queue(0, 0);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100025640;
  v15[3] = &unk_100075070;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)retrieveActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup:(id)a3 keychainAccessGroup:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = dispatch_get_global_queue(0, 0);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002588C;
  v15[3] = &unk_100075070;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)deleteActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup:(id)a3 keychainAccessGroup:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025ADC;
  block[3] = &unk_100074E40;
  id v15 = v7;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v10, block);
}

- (void)deleteActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup:(id)a3 keychainAccessGroup:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025DEC;
  block[3] = &unk_100074E40;
  id v15 = v7;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v10, block);
}

- (BOOL)checkWiFiStatus
{
  id v2 = [objc_alloc((Class)NWPathEvaluator) initWithEndpoint:0 parameters:0];
  if (v2)
  {
    v3 = v2;
    id v4 = [v2 path];
    unsigned __int8 v5 = [v4 usesInterfaceType:1];

    LOBYTE(v2) = v5;
  }
  return (char)v2;
}

- (BOOL)checkIfXpanIDMatchToMDNSScan:(id)a3
{
  id v3 = a3;
  id v4 = sub_10001CCA0(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfXpanIDMatchToMDNSScan:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1621;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s:%d: Entered. Checking if Network extendedPANID matches with Mdns", buf, 0x12u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  __int16 v21 = sub_10001FAD0;
  int v22 = sub_10001FAE0;
  __int16 v23 = objc_alloc_init(ThreadBRFinder);
  unsigned __int8 v5 = *(void **)(*(void *)&buf[8] + 40);
  if (!v5)
  {
    id v11 = sub_10001CCA0(1);
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
    id v11 = sub_10001CCA0(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10003C35C();
    }
LABEL_15:

LABEL_16:
    BOOL v12 = 0;
    goto LABEL_17;
  }
  id v6 = sub_10001CCA0(1);
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
  block[2] = sub_100026478;
  block[3] = &unk_100075098;
  void block[4] = buf;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  if (v9)
  {
    id v10 = sub_10001CCA0(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10003C2E0();
    }

    [*(id *)(*(void *)&buf[8] + 40) clear];
    goto LABEL_16;
  }
  id v14 = sub_10001CCA0(1);
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

- (BOOL)checkIfNetworkMatchToMDNSScan:(id)a3 borderAgentID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  dispatch_time_t v7 = sub_10001CCA0(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfNetworkMatchToMDNSScan:borderAgentID:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1660;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s:%d: Entered. Checking if borderAgentID Network matches with Mdns", buf, 0x12u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v27 = sub_10001FAD0;
  uint32_t v28 = sub_10001FAE0;
  v29 = objc_alloc_init(ThreadBRFinder);
  id v8 = *(void **)(*(void *)&buf[8] + 40);
  if (!v8)
  {
    id v17 = sub_10001CCA0(1);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v22 = 136315394;
      __int16 v23 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfNetworkMatchToMDNSScan:borderAgentID:]";
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
    id v17 = sub_10001CCA0(1);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10003C454();
    }
LABEL_15:

LABEL_16:
    BOOL v18 = 0;
    goto LABEL_17;
  }
  BOOL v12 = sub_10001CCA0(1);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)int v22 = 136315394;
    __int16 v23 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfNetworkMatchToMDNSScan:borderAgentID:]";
    __int16 v24 = 1024;
    int v25 = 1674;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s:%d: Waiting for borderAgentID network record to match on Mdns meshcop", v22, 0x12u);
  }

  dispatch_time_t v13 = dispatch_time(0, 10000000000);
  id v14 = [*(id *)(*(void *)&buf[8] + 40) baFinderSemaphore];
  intptr_t v15 = dispatch_semaphore_wait(v14, v13);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000268BC;
  block[3] = &unk_100075098;
  void block[4] = buf;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  if (v15)
  {
    id v16 = sub_10001CCA0(1);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10003C3D8();
    }

    [*(id *)(*(void *)&buf[8] + 40) clear];
    goto LABEL_16;
  }
  v20 = sub_10001CCA0(1);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)int v22 = 136315394;
    __int16 v23 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfNetworkMatchToMDNSScan:borderAgentID:]";
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

- (void)validateRecordWithMdnsScan:(id)a3 borderAgentID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned __int8 v11 = dispatch_get_global_queue(0, 0);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000269D0;
  v15[3] = &unk_1000750C0;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)checkIfRecordForPreferredNetworkIsPresentWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100026C78;
  v7[3] = &unk_100074E68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)getRecordForPreferredNetwork:(BOOL)a3 anyDsFormat:(BOOL)a4
{
  return [(THThreadNetworkCredentialsKeychainBackingStore *)self getRecordForPreferredNetwork:a3 anyDsFormat:a4 skipScan:0];
}

- (id)getRecordForPreferredNetwork:(BOOL)a3 anyDsFormat:(BOOL)a4 skipScan:(BOOL)a5
{
  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x3032000000;
  v79 = sub_10001FAD0;
  v80 = sub_10001FAE0;
  id v81 = 0;
  uint64_t v70 = 0;
  v71 = (id *)&v70;
  uint64_t v72 = 0x3032000000;
  id v73 = sub_10001FAD0;
  v74 = sub_10001FAE0;
  id v75 = 0;
  uint64_t v5 = [(THThreadNetworkCredentialsKeychainBackingStore *)self getPreferredNetwork:a3 skipScan:a5];
  id v6 = (void *)v77[5];
  v77[5] = v5;

  dispatch_time_t v7 = (void *)v77[5];
  if (!v7)
  {
    uint64_t v58 = sub_10001CCA0(1);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
      sub_10003C4D0();
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
  id v10 = [v9 credentialsDataSet];
  unsigned __int8 v11 = [v10 dataSetArray];
  if (!v11)
  {

    goto LABEL_12;
  }
  id v12 = [(id)v77[5] credentialsDataSetRecord];
  id v13 = [v12 credentialsDataSet];
  id v14 = [v13 dataSetArray];
  BOOL v15 = [v14 length] == 0;

  if (v15)
  {
LABEL_12:
    __int16 v24 = sub_10001CCA0(1);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      int v25 = [(id)v77[5] network];
      long long v26 = [v25 networkName];
      v27 = [(id)v77[5] network];
      uint32_t v28 = [v27 extendedPANID];
      *(_DWORD *)buf = 136315906;
      v84 = "-[THThreadNetworkCredentialsKeychainBackingStore getRecordForPreferredNetwork:anyDsFormat:skipScan:]";
      __int16 v85 = 1024;
      int v86 = 1791;
      __int16 v87 = 2112;
      id v88 = v26;
      __int16 v89 = 2112;
      v90 = v28;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s : %d - Request to fetch all active dataset records for preferred network (name=%@, xpanid=%@)", buf, 0x26u);
    }
    v29 = [(id)v77[5] network];
    uint64_t v58 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchActiveDataSetRecordsOperationForNetwork:v29];

    id v69 = 0;
    v56 = [(THThreadNetworkCredentialsKeychainBackingStore *)self _doFetchActiveDataSetRecords:v58 error:&v69];
    id v55 = v69;
    __int16 v30 = sub_10001CCA0(1);
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

    v32 = [v56 allObjects];
    v57 = +[NSMutableArray arrayWithArray:v32];

    if (v57)
    {
      [v57 sortUsingComparator:&stru_100075100];
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
            BOOL v35 = *(void **)(*((void *)&v65 + 1) + 8 * i);
            id v36 = [v35 borderAgent];
            id v37 = [v36 discriminatorId];
            if (v37)
            {
              uint64_t v38 = [v35 credentialsDataSet];
              v39 = [v38 dataSetArray];
              int v40 = v39 == 0;
              if (v39 && !a4)
              {
                v41 = [v35 credentialsDataSet];
                v42 = [v41 dataSetArray];
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
            v44 = sub_10001CCA0(1);
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              v45 = [v35 network];
              v46 = [v45 networkName];
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
        id v48 = sub_10001CCA0(1);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          id v49 = [v71[5] network];
          v50 = [v49 networkName];
          *(_DWORD *)buf = 136315650;
          v84 = "-[THThreadNetworkCredentialsKeychainBackingStore getRecordForPreferredNetwork:anyDsFormat:skipScan:]";
          __int16 v85 = 1024;
          int v86 = 1836;
          __int16 v87 = 2112;
          id v88 = v50;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "%s : %d : Check if require to update preferred network with record : name : %@", buf, 0x1Cu);
        }
        v51 = [(id)v77[5] credentialsDataSetRecord];
        BOOL v52 = v51 == 0;

        if (v52)
        {
          objc_initWeak((id *)buf, self);
          long long v53 = dispatch_get_global_queue(0, 0);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100027B64;
          block[3] = &unk_100075128;
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
      id v47 = sub_10001CCA0(1);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        sub_10003C54C();
      }

      id v23 = 0;
    }

    goto LABEL_44;
  }
  id v16 = sub_10001CCA0(1);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = [(id)v77[5] credentialsDataSetRecord];
    id v18 = [v17 network];
    id v19 = [v18 networkName];
    v20 = [(id)v77[5] credentialsDataSetRecord];
    __int16 v21 = [v20 credentialsDataSet];
    int v22 = [v21 dataSetArray];
    *(_DWORD *)buf = 136315906;
    v84 = "-[THThreadNetworkCredentialsKeychainBackingStore getRecordForPreferredNetwork:anyDsFormat:skipScan:]";
    __int16 v85 = 1024;
    int v86 = 1787;
    __int16 v87 = 2112;
    id v88 = v19;
    __int16 v89 = 2112;
    v90 = v22;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s:%d: This preferred network entry has record associated with it, returning the same record : %@, dataset : %@", buf, 0x26u);
  }
  id v23 = [(id)v77[5] credentialsDataSetRecord];
LABEL_45:
  _Block_object_dispose(&v70, 8);

  _Block_object_dispose(&v76, 8);

  return v23;
}

- (void)retrievePreferredNetworkOfAnyDSFormatWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100027D50;
  v7[3] = &unk_100074E68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)retrievePreferredNetworkWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002805C;
  v7[3] = &unk_100074E68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)retrievePreferredNetworkInternallyWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002838C;
  v7[3] = &unk_100074E68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)retrievePreferredNetworkWithNoScanWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000286BC;
  v7[3] = &unk_100074E68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (BOOL)storePreferredNetworkWithRecord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(THThreadNetworkCredentialsKeychainBackingStore *)self getNetworkSignature];
  if (v5)
  {
    id v6 = objc_alloc((Class)THThreadNetwork);
    dispatch_time_t v7 = [v4 network];
    id v8 = [v7 networkName];
    id v9 = [v4 network];
    id v10 = [v9 extendedPANID];
    unsigned __int8 v11 = [v6 initWithName:v8 extendedPANID:v10];

    if (!v11)
    {
      id v16 = sub_10001CCA0(1);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10003C830(v16, v33, v34, v35, v36, v37, v38, v39);
      }
      BOOL v17 = 0;
      goto LABEL_18;
    }
    id v12 = [v4 borderAgent];
    id v13 = [(THThreadNetworkCredentialsKeychainBackingStore *)self getActiveDataSetRecord:v12];

    id v14 = objc_alloc((Class)THPreferredThreadNetwork);
    BOOL v15 = [v4 keychainAccessGroup];
    id v16 = [v14 initWithThreadNetwork:v11 networkSignature:v5 credentialsDataSetRecord:v13 creationDate:0 lastModificationDate:0 userInfo:v15];

    BOOL v17 = v16 != 0;
    if (v16)
    {
      if (![(THThreadNetworkCredentialsKeychainBackingStore *)self storePreferred:v16])
      {
        BOOL v17 = 0;
        goto LABEL_17;
      }
      id v18 = sub_10001CCA0(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10003C8A8(v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }
    else
    {
      id v18 = sub_10001CCA0(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10003C920(v18, v40, v41, v42, v43, v44, v45, v46);
      }
    }

LABEL_17:
LABEL_18:

    goto LABEL_19;
  }
  unsigned __int8 v11 = sub_10001CCA0(1);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_10003C7B8(v11, v26, v27, v28, v29, v30, v31, v32);
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
  v7[2] = sub_100028C14;
  v7[3] = &unk_100074E68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
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
  v30[2] = sub_1000292A4;
  v30[3] = &unk_100075150;
  id v31 = v17;
  id v32 = v18;
  id v33 = v19;
  id v34 = v20;
  id v35 = v16;
  uint64_t v36 = self;
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

- (void)deletePreferredNetworkForNetworkSignatureInternallyWithCompletion:(id)a3 ipv6NwSignature:(id)a4 wifiSSID:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = dispatch_get_global_queue(0, 0);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100029B6C;
  v18[3] = &unk_100075070;
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

- (void)deletePreferredNetworkWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002A1D4;
  v7[3] = &unk_100075178;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)deletePreferredNetworkEntryWithCompletion:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  dispatch_time_t v7 = dispatch_get_global_queue(0, 0);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002A8EC;
  v10[3] = &unk_100074E68;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

- (void)deletePreferredAndFrozenThreadNetworksWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002AC54;
  v7[3] = &unk_100075178;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)updatePreferredNetworkInternallyWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002B17C;
  v7[3] = &unk_100075178;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)getOneRecordForNetwork:(id)a3
{
  id v4 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryFetchForOneActiveDataSetOperationForThreadNetwork:a3];
  if (!v4)
  {
    id v5 = sub_10001CCA0(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10003D550();
    }
  }
  uint64_t v11 = 0;
  id v6 = [(THThreadNetworkCredentialsKeychainBackingStore *)self _doFetchOneActiveDataSetRecords:v4 error:&v11];
  dispatch_time_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = sub_10001CCA0(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003D4D4();
    }
  }

  return v7;
}

- (id)getNumberOfRecordsForKeychainAccessGroup:(id)a3 count:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  dispatch_time_t v7 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryFetchForNumberOfActiveDataSetOperationForKeychainAccessGroup:v6 count:v4];
  if (!v7)
  {
    id v8 = sub_10001CCA0(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10003D5CC();
    }
  }
  uint64_t v14 = 0;
  id v9 = [(THThreadNetworkCredentialsKeychainBackingStore *)self _doFetchActiveDataSetRecords:v7 error:&v14];
  id v10 = sub_10001CCA0(1);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = [v9 count];
    *(_DWORD *)buf = 136315906;
    id v16 = "-[THThreadNetworkCredentialsKeychainBackingStore getNumberOfRecordsForKeychainAccessGroup:count:]";
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
    id v6 = sub_10001CCA0(1);
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
    dispatch_time_t v7 = sub_10001CCA0(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10003D6E0();
    }
  }
  else
  {
    dispatch_time_t v7 = sub_10001CCA0(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10003D664();
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
    id v29 = self;
    uint64_t v30 = v9;
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
        id v16 = [v15 borderAgent];
        __int16 v17 = [v16 discriminatorId];
        int v18 = [v10 borderAgent];
        __int16 v19 = [v18 discriminatorId];
        if ([v17 isEqualToData:v19])
        {
          [v15 credentialsDataSet];
          v20 = id v31 = v15;
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
            id v26 = sub_10001CCA0(1);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
              sub_10003D75C(v10, v31, v26);
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
  CFDictionaryRef v4 = sub_10001CCA0(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003E1A0();
  }

  OSStatus v5 = [v3 uniqueIdentifier];

  if (v5)
  {
    id v6 = sub_10001CCA0(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10003E0FC(v3);
    }
  }
  dispatch_time_t v7 = sub_10001CCA0(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_10003E060(v3);
  }

  id v8 = sub_10001CCA0(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_10003DFC4(v3);
  }

  id v9 = sub_10001CCA0(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_10003DF28(v3);
  }

  id v10 = [v3 credentials];
  id v11 = [v10 PANID];

  if (v11)
  {
    id v12 = sub_10001CCA0(1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10003DE8C(v3);
    }
  }
  uint64_t v13 = [v3 credentials];
  __int16 v14 = [v13 masterKey];

  if (v14)
  {
    OSStatus v15 = sub_10001CCA0(1);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10003DDF0(v3);
    }
  }
  id v16 = [v3 credentials];
  __int16 v17 = [v16 PSKc];

  if (v17)
  {
    int v18 = sub_10001CCA0(1);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10003DD54(v3);
    }
  }
  __int16 v19 = [v3 credentials];
  int v20 = [v19 passPhrase];

  if (v20)
  {
    __int16 v21 = sub_10001CCA0(1);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10003DCB8(v3);
    }
  }
  id v22 = [v3 credentials];
  unsigned int v23 = [v22 channel];
  int v24 = kTHNetworkChannel_None;

  if (v23 != v24)
  {
    BOOL v25 = sub_10001CCA0(1);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_10003DC2C(v3);
    }
  }
  id v26 = sub_10001CCA0(1);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    sub_10003DB90(v3);
  }

  id v27 = [v3 credentials];
  id v28 = [v27 userInfo];

  if (v28)
  {
    id v29 = sub_10001CCA0(1);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_10003DAF4(v3);
    }
  }
  uint64_t v30 = [v3 keychainAccessGroup];

  if (v30)
  {
    id v31 = sub_10001CCA0(1);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_10003DA70(v3);
    }
  }
  uint64_t v32 = [v3 creationDate];

  if (v32)
  {
    id v33 = sub_10001CCA0(1);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_10003D9EC(v3);
    }
  }
  id v34 = [v3 lastModificationDate];

  if (v34)
  {
    unsigned int v35 = sub_10001CCA0(1);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_10003D968(v3);
    }
  }
  long long v36 = sub_10001CCA0(1);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
    sub_10003D934();
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
    dispatch_time_t v7 = [v3 networkSignature];
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
  id v16 = [v3 network];
  __int16 v17 = [v16 extendedPANID];
  int v18 = +[NSString stringWithFormat:@"%@%@", v15, v17];

LABEL_9:

  return v18;
}

- (id)checkIfPrefItemPresentInTheCleanupList:(id)a3 cleanupList:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  dispatch_time_t v7 = v6;
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
        id v16 = [v15 networkName];
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
        id v47 = v13;
        uint64_t v44 = v20;
        __int16 v21 = v17;
        id v49 = [v12 networkSignature];
        id v22 = [v49 ipv4NwSignature];
        uint64_t v46 = [v53 networkSignature];
        [v46 ipv4NwSignature];
        v45 = id v48 = v22;
        if (objc_msgSend(v22, "isEqualToData:"))
        {
          uint64_t v40 = [v12 networkSignature];
          unsigned int v23 = [v40 ipv6NwSignature];
          uint64_t v41 = [v53 networkSignature];
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
              id v34 = [v53 networkSignature];
              id v26 = [v34 wifiPassword];
              unsigned __int8 v43 = objc_msgSend(v33, "isEqualToString:");
            }
            else
            {
              unsigned __int8 v43 = 0;
            }
            id v29 = v40;
          }
          else
          {
            unsigned __int8 v43 = 0;
            id v29 = v40;
          }

          id v28 = v47;
          id v27 = v44;
        }
        else
        {
          unsigned __int8 v43 = 0;
          id v27 = v44;
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
  dispatch_time_t v7 = v32;
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

  dispatch_time_t v7 = +[NSNumber numberWithUnsignedLongLong:a3->var1];
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

- (void)cleanThreadKeychainDatabase:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002C5C4;
  v7[3] = &unk_100075178;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
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
      dispatch_time_t v7 = sub_10001CCA0(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315138;
        uint64_t v13 = "-[THThreadNetworkCredentialsKeychainBackingStore updateRecord:]";
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
    dispatch_time_t v7 = [(THThreadNetworkCredentialsKeychainBackingStore *)self _doFetchPreferredNetworks:v6 error:&v34];
    CFDictionaryRef v8 = v34;
    CFDictionaryRef v9 = sub_10001CCA0(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      BOOL v10 = [v4 network];
      id v11 = [v10 networkName];
      *(_DWORD *)buf = 136315650;
      long long v37 = "-[THThreadNetworkCredentialsKeychainBackingStore isPreferred:]";
      __int16 v38 = 1024;
      int v39 = 3082;
      __int16 v40 = 2112;
      uint64_t v41 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s : %d - Preferred Networks in Database for Network  = %@", buf, 0x1Cu);
    }
    if (v7 && [v7 count])
    {
      int v12 = [v4 network];
      uint64_t v13 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchActiveDataSetRecordsOperationForNetwork:v12];

      id v33 = 0;
      __int16 v14 = [(THThreadNetworkCredentialsKeychainBackingStore *)self _doFetchActiveDataSetRecords:v13 error:&v33];
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
        id v27 = v7;
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
        dispatch_time_t v7 = v27;
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
      uint64_t v13 = sub_10001CCA0(1);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10003E8B4(v4);
      }
      BOOL v24 = 0;
    }
  }
  else
  {
    BOOL v24 = 1;
    CFDictionaryRef v8 = sub_10001CCA0(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10003E838();
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
          uint64_t v13 = [v12 credentials];
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
  id v22 = sub_10001FAD0;
  unsigned int v23 = sub_10001FAE0;
  id v4 = v3;
  id v24 = v4;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = (void *)v20[5];
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  long long v15 = sub_10002FEC4;
  long long v16 = &unk_100074C58;
  long long v18 = &v19;
  id v7 = v5;
  long long v17 = v7;
  id v8 = &_dispatch_main_q;
  [v6 startScan:&v13 queue:&_dispatch_main_q timeInSec:5];

  int v9 = sub_10001CCA0(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_10003E9E4();
  }

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = objc_msgSend((id)v20[5], "findNWs", v13, v14, v15, v16);
  id v11 = sub_10001CCA0(1);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_10003E964();
  }

  _Block_object_dispose(&v19, 8);
  return (unint64_t)v10;
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
    int v8 = sub_10001CCA0(1);
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
  uint64_t v13 = sub_10001CCA0(1);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_10003EA60(v7, v5);
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
      int v16 = sub_10001CCA0(1);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10003EC24();
      }
      long long v15 = 0;
      goto LABEL_39;
    }
    [v15 sortUsingComparator:&stru_1000751C0];
  }
  else
  {
    long long v15 = 0;
  }
  if (![(THThreadNetworkCredentialsKeychainBackingStore *)self wifiInfoAvailable:v11]
    && ![(THThreadNetworkCredentialsKeychainBackingStore *)self wifiInfoAvailable:v12])
  {
    BOOL v17 = 1;
    int v16 = sub_10001CCA0(1);
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
    int v16 = sub_10001CCA0(1);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10003EBA8();
    }
LABEL_39:
    BOOL v17 = 0;
    goto LABEL_54;
  }
  if (![(THThreadNetworkCredentialsKeychainBackingStore *)self wifiInfoAvailable:v11]
    && [(THThreadNetworkCredentialsKeychainBackingStore *)self wifiInfoAvailable:v12])
  {
    BOOL v17 = 1;
    int v16 = sub_10001CCA0(1);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10003EB2C();
    }
    goto LABEL_54;
  }
  __int16 v18 = [v11 wifiSSID];
  int v19 = [v12 wifiSSID];
  unsigned int v20 = [v18 isEqualToString:v19];

  if (v20)
  {
    id v21 = sub_10001CCA0(1);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v22 = [v11 wifiSSID];
      *(_DWORD *)buf = 136315650;
      uint64_t v78 = "-[THThreadNetworkCredentialsKeychainBackingStore isMatchingNetworkSignature:preferredNwSignature:preferred:s"
            "ignaturePrefEntries:updatedPreferred:]";
      __int16 v79 = 1024;
      int v80 = 3290;
      __int16 v81 = 2112;
      v82 = v22;
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

              uint64_t v41 = sub_10001CCA0(1);
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
                  v82 = v54;
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
                v82 = v44;
                _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%s:%d: WiFi Info is not available for the Preferred Network Entry : %@, updating it", buf, 0x1Cu);
              }
              id v24 = v67;
              [(THThreadNetworkCredentialsKeychainBackingStore *)v67 dumpPreferredNetwork:v25];
              id v45 = objc_alloc((Class)THPreferredThreadNetwork);
              uint64_t v46 = [v25 network];
              id v47 = [v13 networkSignature];
              id v48 = [v25 credentialsDataSetRecord];
              id v49 = [v25 creationDate];
              [v25 userInfo];
              v51 = uint64_t v50 = v25;
              *a7 = [v45 initWithThreadNetwork:v46 networkSignature:v47 credentialsDataSetRecord:v48 creationDate:v49 lastModificationDate:0 userInfo:v51];

              int v16 = v66;
              if ([(THThreadNetworkCredentialsKeychainBackingStore *)v67 storePreferred:*a7])
              {
                long long v55 = sub_10001CCA0(1);
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
                  v82 = v57;
                  _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "%s:%d: Original Preferred Network with the name : %@", buf, 0x1Cu);

                  int v16 = v66;
                }

                [(THThreadNetworkCredentialsKeychainBackingStore *)v67 dumpPreferredNetwork:v13];
                uint64_t v58 = sub_10001CCA0(1);
                id v12 = v62;
                id v11 = v63;
                if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
                {
                  id v59 = [*a7 network];
                  v60 = [v59 networkName];
                  *(_DWORD *)buf = 136315650;
                  uint64_t v78 = "-[THThreadNetworkCredentialsKeychainBackingStore isMatchingNetworkSignature:preferredNwSignature"
                        ":preferred:signaturePrefEntries:updatedPreferred:]";
                  __int16 v79 = 1024;
                  int v80 = 3321;
                  __int16 v81 = 2112;
                  v82 = v60;
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
            unsigned int v35 = v25;
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

- (BOOL)matchPreferredNetworkRecordWithMdns:(id)a3
{
  id v3 = a3;
  id v4 = sub_10001CCA0(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[THThreadNetworkCredentialsKeychainBackingStore matchPreferredNetworkRecordWithMdns:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 3368;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s:%d: Entered. Trying to match Preferred with Mdns records", buf, 0x12u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v26 = sub_10001FAD0;
  unsigned __int8 v27 = sub_10001FAE0;
  id v28 = objc_alloc_init(ThreadBRFinder);
  uint64_t v5 = *(void **)(*(void *)&buf[8] + 40);
  if (!v5)
  {
    int v16 = sub_10001CCA0(1);
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
  int v7 = [v6 networkName];
  int v8 = [v3 network];
  unsigned __int8 v9 = [v8 extendedPANID];
  unsigned __int8 v10 = [v5 dispatchStartScan:v7 extendedPanIdToFind:v9 borderAgentIdToFind:0];

  if ((v10 & 1) == 0)
  {
    int v16 = sub_10001CCA0(1);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10003ED1C();
    }
LABEL_15:

LABEL_16:
    BOOL v17 = 0;
    goto LABEL_17;
  }
  id v11 = sub_10001CCA0(1);
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
  block[2] = sub_100030FA8;
  block[3] = &unk_100075098;
  void block[4] = buf;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  if (v14)
  {
    long long v15 = sub_10001CCA0(1);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10003ECA0();
    }

    [*(id *)(*(void *)&buf[8] + 40) clear];
    goto LABEL_16;
  }
  int v19 = sub_10001CCA0(1);
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

- (id)matchPreferredNetworkWithMdns:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_10001CCA0(1);
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
  id v21 = sub_10001FAD0;
  __int16 v22 = sub_10001FAE0;
  __int16 v23 = objc_alloc_init(ThreadBRFinder);
  id v4 = (void *)v19[5];
  if (!v4)
  {
    char v10 = sub_10001CCA0(1);
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
    char v10 = sub_10001CCA0(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10003EE14();
    }
LABEL_14:

LABEL_15:
    id v11 = 0;
    goto LABEL_16;
  }
  uint64_t v5 = sub_10001CCA0(1);
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
  block[2] = sub_100031584;
  block[3] = &unk_100075098;
  void block[4] = &v18;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  if (v8)
  {
    id v9 = sub_10001CCA0(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003ED98();
    }

    [(id)v19[5] clear];
    goto LABEL_15;
  }
  uint64_t v13 = [(id)v19[5] preferredRecord];
  intptr_t v14 = sub_10001CCA0(1);
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

- (BOOL)deletePreferredNetworkEntry:(id)a3
{
  id v3 = a3;
  CFDictionaryRef v4 = +[THPreferredThreadNetwork keyChainQueryForDeletePreferredNetworkRecord:v3];
  CFDictionaryRef v5 = v4;
  if (!v4)
  {
    char v10 = sub_10001CCA0(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10003EE90();
    }
    goto LABEL_15;
  }
  OSStatus v6 = SecItemDelete(v4);
  id v7 = sub_10001CCA0(1);
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
    char v10 = sub_10001CCA0(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10003EFBC(v3);
    }
LABEL_15:
    BOOL v14 = 0;
    goto LABEL_16;
  }
  id v11 = [v3 network];
  char v10 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForDeleteAllActiveDataSetOperationForThreadNetwork:v11];

  OSStatus v12 = SecItemDelete((CFDictionaryRef)v10);
  uint64_t v13 = sub_10001CCA0(1);
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
    long long v15 = sub_10001CCA0(1);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10003EF0C(v3);
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
  CFDictionaryRef v5 = sub_10001CCA0(1);
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
    intptr_t v8 = sub_10001CCA0(1);
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
    OSStatus v6 = sub_10001CCA0(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10003F0D4(v3);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_10003F058();
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
          uint64_t v20 = v32 = v15;
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
      __int16 v23 = sub_10001CCA0(1);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        int v24 = [v13 network];
        BOOL v25 = [v24 networkName];
        *(_DWORD *)buf = 136315650;
        uint64_t v41 = "-[THThreadNetworkCredentialsKeychainBackingStore deleteOldEntryForTheNetworkSignatureIfThreadNetworkIsDiff"
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
  BOOL v14 = sub_10001CCA0(1);
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
      long long v29 = sub_10001CCA0(1);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_10003F184();
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
    __int16 v23 = sub_10001CCA0(1);
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
    BOOL v26 = sub_10001CCA0(1);
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
  id v8 = sub_10001CCA0(1);
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
    __int16 v21 = sub_10001CCA0(1);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10003F200();
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
  CFDictionaryRef v4 = sub_10001CCA0(1);
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
    id v8 = sub_10001CCA0(1);
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
    id v11 = sub_10001CCA0(1);
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
    BOOL v14 = sub_10001CCA0(1);
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
        long long v24 = sub_10001CCA0(1);
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
        CFDictionaryRef v5 = sub_10001CCA0(1);
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
      unsigned int v17 = sub_10001CCA0(1);
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
    sub_10003F27C();
  }
LABEL_21:
}

- (void)dumpPreferredNetworksArray:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = sub_10001CCA0(1);
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
            BOOL v14 = sub_10001CCA0(1);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              sub_10003F374();
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

    uint64_t v13 = sub_10001CCA0(1);
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
    uint64_t v13 = sub_10001CCA0(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10003F2F8();
    }
  }
}

- (void)dumpPreferredNetworks:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = sub_10001CCA0(1);
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
            BOOL v14 = sub_10001CCA0(1);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              sub_10003F46C();
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

    uint64_t v13 = sub_10001CCA0(1);
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
    uint64_t v13 = sub_10001CCA0(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10003F3F0();
    }
  }
}

- (void)dumpFrozenThreadNetworks:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 count])
  {
    CFDictionaryRef v5 = sub_10001CCA0(1);
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
          uint64_t v13 = sub_10001CCA0(1);
          BOOL v14 = v13;
          if (v9 + i == 10)
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
              sub_10003F4E8();
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

    long long v17 = sub_10001CCA0(1);
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
    long long v17 = sub_10001CCA0(1);
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
  id v8 = sub_10001CCA0(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v48 = "-[THThreadNetworkCredentialsKeychainBackingStore sortAndReturnPreferredNetwork:onlyMdns:]";
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
    uint64_t v13 = sub_10001CCA0(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10003F564();
    }
    BOOL v14 = 0;
    goto LABEL_11;
  }
  [v10 sortUsingComparator:&stru_1000751E0];
  [(THThreadNetworkCredentialsKeychainBackingStore *)self dumpPreferredNetworksArray:v10];
  if (v4)
  {
    uint64_t v11 = sub_10001CCA0(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10003F65C(v6);
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
    long long v15 = sub_10001CCA0(1);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      long long v16 = [v14 network];
      long long v17 = [v16 networkName];
      *(_DWORD *)buf = 136315650;
      id v48 = "-[THThreadNetworkCredentialsKeychainBackingStore sortAndReturnPreferredNetwork:onlyMdns:]";
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
      uint64_t v46 = v7;
      int v23 = [v14 credentialsDataSetRecord];
      __int16 v24 = [v23 credentialsDataSet];
      int v25 = [v24 dataSetArray];
      id v45 = [v25 length];

      if (v45)
      {
        __int16 v26 = sub_10001CCA0(1);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = [v14 credentialsDataSetRecord];
          __int16 v28 = [v27 network];
          __int16 v29 = [v28 networkName];
          int v30 = [v14 credentialsDataSetRecord];
          __int16 v31 = [v30 credentialsDataSet];
          long long v32 = [v31 dataSetArray];
          *(_DWORD *)buf = 136315906;
          id v48 = "-[THThreadNetworkCredentialsKeychainBackingStore sortAndReturnPreferredNetwork:onlyMdns:]";
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
            long long v38 = sub_10001CCA0(1);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              long long v39 = [v14 network];
              id v40 = [v39 networkName];
              *(_DWORD *)buf = 136315650;
              id v48 = "-[THThreadNetworkCredentialsKeychainBackingStore sortAndReturnPreferredNetwork:onlyMdns:]";
              __int16 v49 = 2112;
              *(void *)uint64_t v50 = v40;
              *(_WORD *)&v50[8] = 1024;
              *(_DWORD *)&v50[10] = v37;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%s: Frozen Preferred Network : %@, Deletion result :(err=%d)", buf, 0x1Cu);
            }
            if (!v37) {
              goto LABEL_39;
            }
            uint64_t v41 = SecCopyErrorMessageString(v37, 0);
            __int16 v42 = sub_10001CCA0(1);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
              sub_10003CDDC();
            }
          }
          else
          {
            uint64_t v41 = sub_10001CCA0(1);
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
              sub_10003F5E0();
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

- (BOOL)wifiInfoAvailable:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 wifiSSID];
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
  CFDictionaryRef v5 = sub_10001CCA0(1);
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
      int v9 = sub_10001CCA0(1);
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
    uint64_t v12 = sub_10001CCA0(1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10003F6E8();
    }
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)getPrefEntriesForSSIDAndSignature:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = sub_10001CCA0(1);
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
      int v9 = sub_10001CCA0(1);
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
    BOOL v14 = sub_10001CCA0(1);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10003F764();
    }
    id v15 = 0;
  }

  return v15;
}

- (id)getPrefEntriesForSSID:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = sub_10001CCA0(1);
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
      int v9 = sub_10001CCA0(1);
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
    uint64_t v12 = sub_10001CCA0(1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10003F7E0(v4);
    }
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)getPrefEntriesForSignature:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = sub_10001CCA0(1);
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
      uint64_t v11 = sub_10001CCA0(1);
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
    id v15 = sub_10001CCA0(1);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10003F878();
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
    BOOL v6 = sub_10001CCA0(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10003F9EC(v4);
    }

    if (v4 && [v4 count])
    {
      id v7 = v4;
    }
    else
    {
      id v8 = sub_10001CCA0(1);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10003F970();
      }

      id v7 = 0;
    }
  }
  else
  {
    CFDictionaryRef v5 = sub_10001CCA0(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10003F8F4();
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
    id v7 = sub_10001CCA0(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10003FB70(v5);
    }

    if (v5 && [v5 count])
    {
      id v8 = v5;
    }
    else
    {
      int v9 = sub_10001CCA0(1);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10003FAF4();
      }

      id v8 = 0;
    }
  }
  else
  {
    BOOL v6 = sub_10001CCA0(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10003FA78();
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
  id v3 = sub_10001CCA0(1);
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
    int v9 = sub_10001CCA0(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003FC1C();
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
    long long v16 = sub_10001CCA0(1);
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
  unsigned __int8 v10 = sub_10001CCA0(1);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_10003FC98(v8);
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
  uint64_t v13 = sub_10001CCA0(1);
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
  uint64_t v7 = sub_10001CCA0(1);
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
    unsigned __int8 v10 = sub_10001CCA0(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10003FD24();
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
    id v24 = sub_10001CCA0(1);
    __int16 v25 = v24;
    if (v4)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_10003FDA0();
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
      long long v32 = sub_10001CCA0(1);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_10003FE98(v31);
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
      CFDictionaryRef v36 = sub_10001CCA0(1);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        OSStatus v37 = [v26 network];
        v61 = [v37 networkName];
        long long v38 = [v26 network];
        id v59 = [v38 extendedPANID];
        long long v39 = [v26 networkSignature];
        __int16 v49 = [v39 wifiSSID];
        __int16 v51 = v39;
        long long v53 = v38;
        long long v55 = v37;
        if (v49)
        {
          id v47 = [v26 networkSignature];
          long long v57 = [v47 wifiSSID];
        }
        else
        {
          long long v57 = &stru_100075A30;
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
      unsigned int v34 = sub_10001CCA0(1);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_10003FE1C();
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
    int v19 = sub_10001CCA0(1);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      __int16 v20 = [v15 network];
      v60 = [v20 networkName];
      int v21 = [v15 network];
      uint64_t v58 = [v21 extendedPANID];
      int v22 = [v15 networkSignature];
      __int16 v23 = [v22 wifiSSID];
      BOOL v52 = v21;
      long long v54 = v20;
      uint64_t v50 = v22;
      if (v23)
      {
        id v48 = [v15 networkSignature];
        long long v56 = [v48 wifiSSID];
      }
      else
      {
        long long v56 = &stru_100075A30;
      }
      id v40 = [v15 credentialsDataSetRecord];
      uint64_t v41 = [v15 networkSignature];
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
  BOOL v4 = sub_10001CCA0(1);
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
    id v24 = sub_10001CCA0(1);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10003FF24();
    }
    goto LABEL_17;
  }
  OSStatus v16 = SecItemAdd(v14, 0);
  if (v16 == -25299)
  {
    id v17 = sub_10001CCA0(1);
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
      int v22 = sub_10001CCA0(1);
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
  __int16 v23 = sub_10001CCA0(1);
  id v24 = v23;
  if (v16)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10003FFFC();
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
  BOOL v4 = sub_10001CCA0(1);
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
  CFDictionaryRef v15 = sub_10001CCA0(1);
  OSStatus v16 = v15;
  if (!v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000400D8();
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
    id v18 = sub_10001CCA0(1);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10004028C(v3);
    }

    CFDictionaryRef v19 = [v3 keyChainQueryForpreferredNetworkUpdateOperation];
    CFDictionaryRef v20 = [v3 keyChainItemRepresentationForpreferredNetworkUpdateOperation];
    CFDictionaryRef v21 = sub_10001CCA0(1);
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
      int v22 = sub_10001CCA0(1);
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
  __int16 v23 = sub_10001CCA0(1);
  OSStatus v16 = v23;
  if (v17)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_1000401B0();
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
  CFDictionaryRef v6 = sub_10001CCA0(1);
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
    id v47 = v15;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s:%d:Request to store Preferred Network (networkName=%@, xpanid=%@), with record name : %@ dataset : %@", buf, 0x3Au);

    id v5 = v13;
    a4 = v36;
  }
  CFDictionaryRef v16 = [v5 keyChainItemRepresentationForpreferredNetworkAddOperation];
  OSStatus v17 = sub_10001CCA0(1);
  id v18 = v17;
  if (!v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10004033C();
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
    CFDictionaryRef v20 = sub_10001CCA0(1);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10004056C(v5);
    }

    CFDictionaryRef v21 = [v5 keyChainQueryForpreferredNetworkUpdateOperation];
    CFDictionaryRef v22 = [v5 keyChainItemRepresentationForpreferredNetworkUpdateOperation];
    __int16 v23 = sub_10001CCA0(1);
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
      BOOL v24 = sub_10001CCA0(1);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_1000404F0();
      }
    }
    else
    {
      *a4 = 1;
      BOOL v24 = sub_10001CCA0(1);
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
  __int16 v26 = sub_10001CCA0(1);
  id v18 = v26;
  if (v19)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_100040414();
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
  BOOL v4 = sub_10001CCA0(1);
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
    uint64_t v11 = sub_10001CCA0(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10004061C(v3);
    }
    goto LABEL_14;
  }
  OSStatus v9 = SecItemAdd(v7, 0);
  if (v9)
  {
    if (v9 == -25299)
    {
      BOOL v10 = 1;
      uint64_t v11 = sub_10001CCA0(1);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10004077C();
      }
      goto LABEL_15;
    }
    uint64_t v11 = sub_10001CCA0(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000406CC(v3);
    }
LABEL_14:
    BOOL v10 = 0;
    goto LABEL_15;
  }
  BOOL v10 = 1;
  uint64_t v11 = sub_10001CCA0(1);
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
  CFDictionaryRef v7 = sub_10001CCA0(1);
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
    OSStatus v9 = sub_10001CCA0(1);
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
    uint64_t v11 = sub_10001CCA0(1);
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
    id v13 = sub_10001CCA0(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100040874();
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

    CFDictionaryRef v16 = sub_10001CCA0(1);
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
      CFDictionaryRef v20 = sub_10001CCA0(1);
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
        __int16 v23 = sub_10001CCA0(1);
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
          __int16 v23 = sub_10001CCA0(1);
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
      __int16 v23 = sub_10001CCA0(1);
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
  __int16 v17 = sub_10001CCA0(1);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_1000407F8();
  }
  int v26 = 0;
LABEL_43:

  BOOL v27 = (void *)WiFiCopyCurrentNetworkInfoEx();
  __int16 v28 = &stru_100075A30;
  if (v27)
  {
    CFDictionaryRef v29 = sub_10001CCA0(1);
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
    int v35 = sub_10001CCA0(1);
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
  CFDictionaryRef v6 = sub_10001CCA0(1);
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
  id v13 = sub_10001CCA0(1);
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
        CFDictionaryRef v20 = sub_10001CCA0(1);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          id v62 = "-[THThreadNetworkCredentialsKeychainBackingStore dispatchRemoveInActiveRecords:]";
          __int16 v63 = 1024;
          *(_DWORD *)__int16 v64 = 4466;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s:%d: Deleting excess active dataset record", buf, 0x12u);
        }

        [v19 sortUsingComparator:&stru_100075200];
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
              int v26 = sub_10001CCA0(1);
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
      id v33 = &AWDPostMetric_ptr;
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
              int v40 = v33[207];
              uint64_t v41 = [v35 borderAgent];
              CFDictionaryRef v42 = [v40 keyChainQueryForDeleteActiveDataSetOperationForThreadNetworkBorderAgent:v41];

              if (v42)
              {
                OSStatus v43 = SecItemDelete(v42);
                __int16 v44 = sub_10001CCA0(1);
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

                  id v33 = &AWDPostMetric_ptr;
                }
              }
              else
              {
                __int16 v44 = sub_10001CCA0(1);
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
              sub_10001CCA0(1);
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
    int v15 = sub_10001CCA0(1);
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

- (void)dispatchRemoveExcessPreferredEntry
{
  id v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    CFDictionaryRef v20 = "-[THThreadNetworkCredentialsKeychainBackingStore dispatchRemoveExcessPreferredEntry]";
    __int16 v21 = 1024;
    int v22 = 4523;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:%d: Remove Excess preferred network entry", buf, 0x12u);
  }

  id v4 = +[THPreferredThreadNetwork keyChainQueryForFetchPreferredNetworkRecordsOperation];
  if (v4)
  {
    uint64_t v18 = 0;
    uint64_t v5 = [(THThreadNetworkCredentialsKeychainBackingStore *)self _doFetchPreferredNetworks:v4 error:&v18];
    if (v5)
    {
      CFDictionaryRef v6 = sub_10001CCA0(1);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1000409E8(v5);
      }

      if ((unint64_t)[v5 count] >= 0xC9)
      {
        CFDictionaryRef v7 = [v5 allObjects];
        unsigned int v8 = +[NSMutableArray arrayWithArray:v7];

        if (v8)
        {
          [v8 sortUsingComparator:&stru_100075220];
          OSStatus v9 = sub_10001CCA0(1);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            CFDictionaryRef v20 = "-[THThreadNetworkCredentialsKeychainBackingStore dispatchRemoveExcessPreferredEntry]";
            __int16 v21 = 1024;
            int v22 = 4573;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s:%d: Deleting excess preferred entry", buf, 0x12u);
          }

          if ([v5 count] != (id)200)
          {
            uint64_t v11 = 0;
            *(void *)&long long v10 = 136315650;
            long long v17 = v10;
            do
            {
              id v12 = objc_msgSend(v8, "objectAtIndexedSubscript:", 0, v17);
              CFDictionaryRef v13 = +[THPreferredThreadNetwork keyChainQueryForDeletePreferredNetworkRecord:v12];

              if (v13)
              {
                OSStatus v14 = SecItemDelete(v13);
                int v15 = sub_10001CCA0(1);
                if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v17;
                  CFDictionaryRef v20 = "-[THThreadNetworkCredentialsKeychainBackingStore dispatchRemoveExcessPreferredEntry]";
                  __int16 v21 = 1024;
                  int v22 = 4582;
                  __int16 v23 = 1024;
                  OSStatus v24 = v14;
                  _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s:%d: Deleting excess preferred entry, got on deletion : (err=%d)", buf, 0x18u);
                }
              }
              ++v11;
            }
            while (v11 < (char *)[v5 count] - 200);
          }
        }
        else
        {
          CFDictionaryRef v16 = sub_10001CCA0(1);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            sub_10004096C();
          }
        }
      }
    }
  }
  else
  {
    uint64_t v5 = sub_10001CCA0(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000408F0();
    }
  }
}

- (id)getPreferredNetworkWithRecords
{
  id v3 = [(THThreadNetworkCredentialsKeychainBackingStore *)self getPreferredNetwork:0];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 credentialsDataSetRecord];

    CFDictionaryRef v6 = sub_10001CCA0(1);
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
        CFDictionaryRef v13 = [v4 credentialsDataSetRecord];
        OSStatus v14 = [v13 credentialsDataSet];
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
      uint64_t v18 = [v4 network];
      __int16 v19 = [v18 networkName];
      CFDictionaryRef v20 = [v4 network];
      __int16 v21 = [v20 extendedPANID];
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
    OSStatus v24 = [(THThreadNetworkCredentialsKeychainBackingStore *)self _doFetchActiveDataSetRecords:v23 error:&v38];
    id v25 = v38;
    int v26 = sub_10001CCA0(1);
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
      id v31 = sub_10001CCA0(1);
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
      __int16 v34 = sub_10001CCA0(1);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_100040B6C(v4);
      }
    }
    else
    {
      __int16 v34 = sub_10001CCA0(1);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_100040AF0();
      }
    }

LABEL_24:
    id v16 = 0;
    goto LABEL_25;
  }
  long long v17 = sub_10001CCA0(1);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_100040A74();
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
    OSStatus v14 = sub_10001CCA0(1);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100040C08();
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
  OSStatus v14 = [(THThreadNetworkCredentialsKeychainBackingStore *)self getPreferredNetwork:0];
  if (v14)
  {
    int v15 = [v5 network];
    id v16 = [v5 borderAgent];
    long long v17 = [(THThreadNetworkCredentialsKeychainBackingStore *)self getActiveDataSetRecordForNetworkAndBorderAgentId:v15 borderAgent:v16];

    id v18 = objc_alloc((Class)THPreferredThreadNetwork);
    __int16 v19 = [v17 network];
    CFDictionaryRef v20 = [v14 networkSignature];
    __int16 v21 = [v14 userInfo];
    id v22 = [v18 initWithThreadNetwork:v19 networkSignature:v20 credentialsDataSetRecord:v17 creationDate:0 lastModificationDate:0 userInfo:v21];

    if (v22)
    {
      unsigned int v23 = [(THThreadNetworkCredentialsKeychainBackingStore *)self storePreferred:v22];
      OSStatus v24 = sub_10001CCA0(1);
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
          v32 = int v40 = v28;
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
        id v25 = sub_10001CCA0(1);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_100040D00();
        }
LABEL_23:

LABEL_24:
        goto LABEL_17;
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_100040DD8();
      }
    }
    else
    {
      id v25 = sub_10001CCA0(1);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_100040C84();
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
    int v51 = sub_10001CCA0(1);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      sub_100040E54();
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
  OSStatus v14 = [v8 credentialsDataSet];
  int v15 = [v14 dataSetArray];
  id v16 = [v15 length];

  if (!v16) {
    goto LABEL_18;
  }
  v90 = self;
  long long v17 = [v6 network];
  id v18 = [v17 networkName];
  __int16 v19 = [v8 network];
  CFDictionaryRef v20 = [v19 networkName];
  if (![v18 isEqualToString:v20])
  {

    goto LABEL_23;
  }
  __int16 v21 = [v6 network];
  id v22 = [v21 extendedPANID];
  [v8 network];
  unsigned int v23 = v89 = v6;
  OSStatus v24 = [v23 extendedPANID];
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
    v60 = [v58 network];
    v61 = [v6 networkSignature];
    id v62 = [v6 userInfo];
    id v63 = [v59 initWithThreadNetwork:v60 networkSignature:v61 credentialsDataSetRecord:v58 creationDate:0 lastModificationDate:0 userInfo:v62];

    if (v63)
    {
      unsigned int v64 = [(THThreadNetworkCredentialsKeychainBackingStore *)v90 storePreferred:v63];
      int v65 = sub_10001CCA0(1);
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
          v96 = v68;
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
          __int16 v66 = sub_10001CCA0(1);
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
            sub_1000411B4(v51);
          }
        }
        else
        {
          __int16 v66 = sub_10001CCA0(1);
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
            sub_100041264(v6);
          }
        }
      }
      else if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        sub_100041314();
      }
    }
    else
    {
      __int16 v66 = sub_10001CCA0(1);
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
        sub_100041138();
      }
    }

    goto LABEL_56;
  }
  int v26 = sub_10001CCA0(1);
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
    v96 = v28;
    __int16 v97 = 2112;
    v98 = v30;
    __int16 v99 = 2112;
    v100 = v32;
    __int16 v101 = 2112;
    v102 = v34;
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
  v83 = [v85 credentialsDataSet];
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
    long long v75 = v74 = v36;
    uint64_t v76 = [v6 networkSignature];
    v77 = [v6 userInfo];
    id v58 = [v73 initWithThreadNetwork:v75 networkSignature:v76 credentialsDataSetRecord:v51 creationDate:0 lastModificationDate:0 userInfo:v77];

    if (v58)
    {
      unsigned int v78 = [(THThreadNetworkCredentialsKeychainBackingStore *)v74 storePreferred:v58];
      __int16 v79 = sub_10001CCA0(1);
      int v80 = v79;
      if (v78)
      {
        if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
        {
          __int16 v81 = [v58 network];
          v82 = [v81 networkName];
          *(_DWORD *)buf = 136315650;
          v92 = "-[THThreadNetworkCredentialsKeychainBackingStore updateRecordToPreferredNetworkEntry:credentialsDataSetRecord:]";
          __int16 v93 = 1024;
          int v94 = 4723;
          __int16 v95 = 2112;
          v96 = v82;
          _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_INFO, "%s:%d: Updated Preferred Network with the name : %@", buf, 0x1Cu);
        }
        goto LABEL_49;
      }
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
        sub_100040F4C();
      }
    }
    else
    {
      int v80 = sub_10001CCA0(1);
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
        sub_100040ED0();
      }
    }

LABEL_56:
LABEL_20:
    BOOL v50 = 0;
    goto LABEL_21;
  }
  BOOL v50 = 1;
  int v51 = sub_10001CCA0(1);
  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
    sub_100040FC8(v89, v8, v51);
  }
LABEL_21:

  return v50;
}

- (id)deleteActiveDataSetRecordForNetworkAndBorderAgentId:(id)a3 borderAgent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_10001CCA0(1);
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
    OSStatus v24 = v8;
    __int16 v25 = 2112;
    int v26 = v9;
    __int16 v27 = 2112;
    CFDictionaryRef v28 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s:%d: Fetch active dataset record with network name : %@, network xpanid : %@, borderAgent %@", (uint8_t *)&v19, 0x30u);
  }
  CFDictionaryRef v11 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForDeleteActiveDataSetOperationForNetworkAndBorderAgent:v5 borderAgent:v6];
  OSStatus v12 = SecItemDelete(v11);
  id v13 = sub_10001CCA0(1);
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
    OSStatus v14 = (__CFString *)SecCopyErrorMessageString(v12, 0);
    int v15 = sub_10001CCA0(1);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100041390();
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
  unsigned int v8 = sub_10001CCA0(1);
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
  OSStatus v14 = v13;
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
  id v5 = sub_10001CCA0(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 discriminatorId];
    *(_DWORD *)buf = 136315650;
    OSStatus v14 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveDataSetRecord:]";
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
    id v5 = sub_10001CCA0(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10004148C();
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
      unsigned int v8 = sub_10001CCA0(1);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100041410();
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
  BOOL v7 = sub_10001CCA0(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v107 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
    __int16 v108 = 1024;
    int v109 = 4926;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Validating Dataset : %d", buf, 0x12u);
  }
  id v96 = v4;

  unsigned int v8 = sub_10001CCA0(1);
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

  sub_10000A244(v5, v6, (char *)buf, 0x3E8uLL, 0);
  uint64_t v9 = sub_10001CCA0(1);
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
    v100 = 0;
    __int16 v101 = 0;
    __int16 v97 = 0;
    v98 = 0;
    long long v10 = 0;
LABEL_78:
    uint64_t v39 = sub_10001CCA0(1);
    BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
    uint64_t v41 = v97;
    CFDictionaryRef v42 = v98;
    if (!v10 || !v97 || !v101 || !v100 || !v98 || !(_BYTE)v11)
    {
      __int16 v43 = v96;
      if (v40) {
        sub_100041700();
      }
      goto LABEL_114;
    }
    __int16 v43 = v96;
    if (v40) {
      sub_100041684();
    }

    LOBYTE(v87) = 1;
    uint64_t v39 = [objc_alloc((Class)THThreadNetworkCredentials) initWithMasterKey:v101 passPhrase:0 PSKc:v100 channel:v11 PANID:v98 userInfo:0 credentialDataSet:0 isActiveDevice:v87];
    int v44 = sub_10001CCA0(1);
    BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
    if (!v39)
    {
      if (v45) {
        sub_100041508();
      }
      BOOL v58 = 0;
      uint64_t v39 = v44;
      goto LABEL_115;
    }
    if (v45) {
      sub_10004160C();
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
        int v51 = sub_10003A020();
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
            v90 = [*a4 credentials];
            [v90 userInfo];
            id v59 = v91 = v54;
            id v60 = [v88 initWithDataSetArray:v89 userInfo:v59];
            v61 = [*a4 credentials];
            [v61 setCredentialsDataSet:v60];

LABEL_127:
            CFDictionaryRef v42 = v98;
            goto LABEL_115;
          }
          __int16 v66 = sub_10001CCA0(1);
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
            sub_1000415D8();
          }
        }
        else
        {
          int v65 = sub_10001CCA0(1);
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
            sub_1000415A4();
          }
        }
        BOOL v58 = 0;
        goto LABEL_127;
      }
      unsigned int v64 = sub_10001CCA0(1);
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
        sub_100041570();
      }
    }
    else
    {
      __int16 v47 = sub_10001CCA0(1);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        sub_10004153C();
      }
    }

    goto LABEL_114;
  }
  long long v10 = 0;
  __int16 v97 = 0;
  v98 = 0;
  v100 = 0;
  __int16 v101 = 0;
  LOBYTE(v11) = 0;
  unsigned int v12 = 0;
  while (2)
  {
    uint64_t v13 = v12 + 1;
    if (v13 >= v6)
    {
      __int16 v20 = sub_10001CCA0(1);
      __int16 v43 = v96;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100041F44();
      }
      goto LABEL_112;
    }
    uint64_t v14 = v5[v13];
    uint64_t v15 = v12 + 2;
    unsigned int v16 = v12 + 2 + v14;
    if (v16 > v6)
    {
      __int16 v20 = sub_10001CCA0(1);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1000417F8();
      }
      goto LABEL_111;
    }
    int v17 = v5[v12];
    switch(v5[v12])
    {
      case 0u:
        id v18 = sub_10001CCA0(1);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v102 = 136315394;
          v103 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
          __int16 v104 = 1024;
          LODWORD(v105[0]) = 5034;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: #MOS : ==> Decoded channel Line : %d", v102, 0x12u);
        }

        if (v14 == 3)
        {
          if (v5[v15])
          {
            __int16 v20 = sub_10001CCA0(1);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              sub_100041AE0((uint64_t)&v5[v15], v20, v75, v76, v77, v78, v79, v80);
            }
          }
          else
          {
            uint64_t v11 = v5[v12 + 4];
            int v19 = sub_10001CCA0(1);
            __int16 v20 = v19;
            if ((v11 - 27) > 0xEFu)
            {
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v102 = 136315394;
                v103 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
                __int16 v104 = 1024;
                LODWORD(v105[0]) = v11;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: #MOS : Channel : %d", v102, 0x12u);
              }
              goto LABEL_73;
            }
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              sub_100041A60(v11, v20, v81, v82, v83, v84, v85, v86);
            }
          }
        }
        else
        {
          __int16 v20 = sub_10001CCA0(1);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            sub_100041B64();
          }
        }
        goto LABEL_111;
      case 1u:
        __int16 v25 = sub_10001CCA0(1);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v102 = 136315394;
          v103 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
          __int16 v104 = 1024;
          LODWORD(v105[0]) = 5068;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s: #MOS : ==> Decoded pan id Line : %d", v102, 0x12u);
        }

        if (v14 != 2)
        {
          __int16 v20 = sub_10001CCA0(1);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            sub_100041BE0();
          }
          goto LABEL_111;
        }
        uint64_t v26 = +[NSData dataWithBytes:&v5[v15] length:2];

        __int16 v20 = sub_10001CCA0(1);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v102 = 136315394;
          v103 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
          __int16 v104 = 2112;
          v105[0] = v26;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: #MOS : PANID : %@", v102, 0x16u);
        }
        v98 = (void *)v26;
        goto LABEL_73;
      case 2u:
        __int16 v27 = sub_10001CCA0(1);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v102 = 136315394;
          v103 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
          __int16 v104 = 1024;
          LODWORD(v105[0]) = 5083;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s: #MOS : ==> Decoded XPAN ID : %d", v102, 0x12u);
        }

        if (v14 != 8)
        {
          __int16 v20 = sub_10001CCA0(1);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            sub_100041C5C();
          }
          goto LABEL_111;
        }
        uint64_t v28 = +[NSData dataWithBytes:&v5[v15] length:8];

        __int16 v20 = sub_10001CCA0(1);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v102 = 136315394;
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
        CFDictionaryRef v29 = sub_10001CCA0(1);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v102 = 136315394;
          v103 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
          __int16 v104 = 1024;
          LODWORD(v105[0]) = 5023;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s: #MOS : ==> Decoded Network Name Line : %d", v102, 0x12u);
        }

        uint64_t v30 = +[NSString stringWithUTF8String:v112];

        id v31 = sub_10001CCA0(1);
        __int16 v20 = v31;
        if (!v30)
        {
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            sub_1000419E8(v20, v67, v68, v69, v70, v71, v72, v73);
          }
          long long v10 = 0;
          goto LABEL_111;
        }
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v102 = 136315394;
          v103 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
          __int16 v104 = 2112;
          v105[0] = v30;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s : #MOS : Network Name : %@", v102, 0x16u);
        }
        goto LABEL_74;
      case 4u:
        uint64_t v32 = sub_10001CCA0(1);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v102 = 136315394;
          v103 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
          __int16 v104 = 1024;
          LODWORD(v105[0]) = 5098;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%s: #MOS : ==> Decoded pskc Line : %d", v102, 0x12u);
        }

        if (v14 != 16)
        {
          __int16 v20 = sub_10001CCA0(1);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            sub_100041CD8();
          }
          goto LABEL_111;
        }
        uint64_t v33 = +[NSData dataWithBytes:&v5[v15] length:16];

        __int16 v20 = sub_10001CCA0(1);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v102 = 136315395;
          v103 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
          __int16 v104 = 2117;
          v105[0] = v33;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: #MOS : PSKc : %{sensitive}@", v102, 0x16u);
        }
        v100 = (void *)v33;
        goto LABEL_73;
      case 5u:
        __int16 v34 = sub_10001CCA0(1);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v102 = 136315394;
          v103 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
          __int16 v104 = 1024;
          LODWORD(v105[0]) = 5114;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%s: #MOS : ==> Decoded master key Line : %d", v102, 0x12u);
        }

        if (v14 != 16)
        {
          __int16 v20 = sub_10001CCA0(1);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            sub_100041D54();
          }
          goto LABEL_111;
        }
        uint64_t v35 = +[NSData dataWithBytes:&v5[v15] length:16];

        __int16 v20 = sub_10001CCA0(1);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v102 = 136315395;
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
        __int16 v36 = sub_10001CCA0(1);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v102 = 136315394;
          v103 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
          __int16 v104 = 1024;
          LODWORD(v105[0]) = 5145;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%s: #MOS : ==> Decoded mesh local prefix Line : %d", v102, 0x12u);
        }

        if (v14 == 8) {
          goto LABEL_75;
        }
        __int16 v20 = sub_10001CCA0(1);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_100041EC8();
        }
        goto LABEL_111;
      case 0xCu:
        unsigned __int8 v37 = sub_10001CCA0(1);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v102 = 136315650;
          v103 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
          __int16 v104 = 1024;
          LODWORD(v105[0]) = 5129;
          WORD2(v105[0]) = 1024;
          *(_DWORD *)((char *)v105 + 6) = v14;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%s: #MOS : ==> Decoded security policy Line : %d, len : %d", v102, 0x18u);
        }

        if ((v14 - 3) >= 2)
        {
          __int16 v20 = sub_10001CCA0(1);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            sub_100041E4C();
          }
          goto LABEL_111;
        }
        if (!v5[v15] && !v5[v12 + 3])
        {
          __int16 v20 = sub_10001CCA0(1);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            sub_100041DD0();
          }
          goto LABEL_111;
        }
        __int16 v20 = sub_10001CCA0(1);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          id v38 = +[NSData dataWithBytes:&v5[v15] length:v14];
          *(_DWORD *)v102 = 136315394;
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
          __int16 v20 = sub_10001CCA0(1);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v102 = 136315650;
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
        int v21 = sub_10001CCA0(1);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v102 = 136315394;
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
            __int16 v20 = sub_10001CCA0(1);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              sub_10004196C();
            }
            goto LABEL_111;
          }
          int v24 = v5[v22];
          v22 += 6;
          if (v24 != 4)
          {
            __int16 v20 = sub_10001CCA0(1);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              sub_1000418F0();
            }
            goto LABEL_111;
          }
        }
        __int16 v20 = sub_10001CCA0(1);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_100041874();
        }
LABEL_111:
        __int16 v43 = v96;
LABEL_112:
        uint64_t v41 = v97;
        CFDictionaryRef v42 = v98;

        uint64_t v39 = sub_10001CCA0(1);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          sub_10004177C();
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
  id v3 = sub_10001CCA0(1);
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
    id v4 = sub_10001CCA0(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10004203C();
    }

    if (![(THThreadNetworkCredentialsKeychainBackingStore *)self isWiFiNetwork]) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if ([(THThreadNetworkCredentialsKeychainBackingStore *)self isWiFiNetwork])
  {
LABEL_9:
    id v5 = sub_10001CCA0(1);
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
    uint64_t v39 = sub_10003A910();
    uint64_t v9 = -[THThreadNetworkCredentialsKeychainBackingStore dataFromHexString:](self, "dataFromHexString:");
    *(_WORD *)((char *)&v53 + (v8 + 8)) = ((unsigned __int16)[v9 length] << 8) | 2;
    id v10 = v9;
    memcpy((char *)&v53 + (v8 + 10), [v10 bytes], objc_msgSend(v10, "length"));
    unsigned __int8 v37 = [v10 length];
    unsigned int v11 = v8 + 10 + [v10 length];
    unsigned int v12 = sub_10003AA18();
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
    id v18 = sub_10003ABB4();
    *(_WORD *)((char *)&v53 + (v16 + 9)) = ((unsigned __int16)[v18 length] << 8) | 3;
    unsigned int v19 = v16 + 11;
    id v20 = v18;
    memcpy((char *)&v53 + v19, [v20 cStringUsingEncoding:4], (size_t)objc_msgSend(v20, "length"));
    LOBYTE(v18) = [v20 length];
    unsigned int v21 = v19 + [v20 length];
    unsigned int v22 = sub_10003AA18();
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
    sub_10000A244((unsigned __int8 *)&v53, v25, (char *)buf, 0x3E8uLL, 0);
    uint64_t v26 = sub_10001CCA0(1);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)BOOL v45 = 136315394;
      __int16 v46 = buf;
      __int16 v47 = 1024;
      int v48 = 5598;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "dump: %s, Line : %d", v45, 0x12u);
    }

    __int16 v27 = (uint8_t *)[objc_alloc((Class)NSData) initWithBytes:&v53 length:v25];
    uint64_t v28 = sub_10001CCA0(1);
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
    id v31 = sub_10001CCA0(1);
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
      __int16 v34 = sub_10001CCA0(1);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_100041FC0();
      }

      uint64_t v33 = 0;
    }

    goto LABEL_29;
  }
  uint64_t v30 = sub_10001CCA0(1);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
    sub_1000420B8();
  }
  uint64_t v33 = 0;
LABEL_29:

  return v33;
}

@end