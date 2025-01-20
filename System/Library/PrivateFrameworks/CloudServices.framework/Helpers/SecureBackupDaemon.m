@interface SecureBackupDaemon
- (BOOL)_backupEnabled;
- (BOOL)_restoreKeychainWithBackupPassword:(id)a3 keybagDigest:(id)a4 error:(id *)a5;
- (BOOL)_restoreView:(id)a3 password:(id)a4 keybagDigest:(id)a5 restoredViews:(id)a6 error:(id *)a7;
- (BOOL)_usesEscrow;
- (BOOL)backupAllowed;
- (BOOL)backupSetConfirmedManifest:(id)a3 digest:(id)a4 manifest:(id)a5 error:(id *)a6;
- (BOOL)backupSliceKeybagHasRecoveryKey:(id)a3;
- (BOOL)backupWithChanges:(id)a3 error:(id *)a4 handler:(id)a5;
- (BOOL)backupWithRegisteredBackupViewWithError:(id)a3 error:(id *)a4;
- (BOOL)backupWithRegisteredBackupsWithError:(id *)a3 handler:(id)a4;
- (BOOL)forceICDP;
- (BOOL)hasRecoveryKeyInKVS:(id)a3 error:(id *)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)needInitialBackup;
- (BOOL)pendingNotification;
- (BOOL)registerSingleRecoverySecret:(id)a3 iCDP:(BOOL)a4 error:(id *)a5;
- (BOOL)removeRecoveryKey:(id *)a3;
- (BOOL)verifyRKWithKeyBag:(id)a3 password:(id)a4 error:(id *)a5;
- (BOOL)verifyRecoveryKey:(id)a3 error:(id *)a4;
- (NSData)iCDPKeybag;
- (NSMutableDictionary)handledNotifications;
- (NSMutableDictionary)ignoredNotifications;
- (NSString)cachedPassphrase;
- (NSString)cachedRecordID;
- (NSString)cachedRecordIDPassphrase;
- (NSString)iCloudEnvironment;
- (NSURL)cacheDirURL;
- (NSURL)cachedKeychainURL;
- (NSURL)cachedManifestURL;
- (OS_dispatch_queue)backupQueue;
- (OS_dispatch_queue)connectionQueue;
- (OS_dispatch_queue)kvsQueue;
- (SBEscrowOperationLogger)operationsLogger;
- (SecureBackupDaemon)initWithOperationsLogger:(id)a3;
- (id)_EMCSBackup;
- (id)_EMCSBackupDictForKeybagDigest:(id)a3;
- (id)_KVSKeybag;
- (id)_consumeBackupJournal;
- (id)_consumeFullBackupForRecordID:(id)a3;
- (id)_consumeViewBackup:(id)a3 recordID:(id)a4;
- (id)_createBackupKeybagWithPassword:(id)a3;
- (id)_gestaltValueForKey:(__CFString *)a3;
- (id)_getDERBackupFromKVS;
- (id)_getICDPBackupFromKVS:(id)a3 forView:(id)a4;
- (id)_getKeychainItemForKey:(id)a3 status:(int *)a4;
- (id)_getLastBackupTimestamp;
- (id)_getProtectedKeychainAndKeybagDigestFromKVS:(id *)a3;
- (id)_metadata;
- (id)_pushCachedKeychainToKVS;
- (id)_pushCachedKeychainToKVSForView:(id)a3 recordID:(id)a4;
- (id)_recordIDFromLabel:(id)a3 withPrefix:(id)a4 suffix:(id)a5;
- (id)allViews;
- (id)cachedPassphraseForFD:(int)a3;
- (id)cachedRecoveryKey;
- (id)circleChangedNotification;
- (id)copyBackupKey:(id)a3;
- (id)copyBackupKeyForNewDeviceRecoverySecret:(id)a3 error:(id *)a4;
- (id)copyEncodedData:(id)a3 error:(id *)a4;
- (id)copyKVSState;
- (id)copyMyPeerID;
- (id)copyMyPeerIDWithError:(id *)a3;
- (id)copyMyPeerInfo:(id *)a3;
- (id)copyMyPeerWithNewDeviceRecoverySecret:(id)a3 error:(id *)a4;
- (id)copyOSVersion:(id)a3;
- (id)copyPeerID:(id)a3;
- (id)copySerialNumber:(id)a3;
- (id)createDERDataFromPlist:(id)a3;
- (id)createEncodedDirectBackupSliceKeybagFromData:(id)a3 error:(id *)a4;
- (id)createPeerInfoFromData:(id)a3 error:(id *)a4;
- (id)createPlistFromDERData:(id)a3;
- (id)createiCloudRecoveryPasswordWithError:(id *)a3;
- (id)currentViews;
- (id)derDataFromDict:(id)a3;
- (id)encodedStatsForViews:(id)a3;
- (id)fetchPRK:(id *)a3;
- (id)filteriCDPRecords:(id)a3;
- (id)getPendingEscrowRequest:(id *)a3;
- (id)keysOfEntriesContainingObject:(id)a3 backups:(id)a4;
- (id)kvs;
- (id)makeRecordCandidate:(id)a3 error:(id *)a4;
- (id)massageIncomingMetadataFromInfo:(id)a3;
- (id)massageOutgoingMetadataFromRequest:(id)a3;
- (id)normalizeSMSTarget:(id)a3 error:(id *)a4;
- (id)removeRKFromKeyBag:(id)a3 error:(id *)a4;
- (id)restoreBackup:(id)a3 withName:(id)a4 keybagDigest:(id)a5 keybag:(id)a6 password:(id)a7;
- (id)restoreEMCSBackup:(id)a3 keybag:(id)a4 password:(id)a5;
- (id)restoreEMCSBackup:(id)a3 withPassword:(id)a4;
- (id)secureBackups;
- (id)sortRecordsByBottleID:(id)a3;
- (id)tagStaleBottleRecords:(id)a3 suggestedBottles:(id)a4;
- (int)cachedPassphraseFD;
- (int)cachedRecordIDPassphraseFD;
- (int)cachedRecoveryKeyFD;
- (int)getPasscodeRequestFlag:(unint64_t *)a3;
- (int)notifyToken;
- (int)setPasscodeRequestFlag:(unint64_t)a3;
- (int)storeCachedPassphrase:(id)a3;
- (int64_t)compare:(id)a3 with:(id)a4 backups:(id)a5;
- (int64_t)compareEscrowDatesBetweenCurrentRecord:(id)a3 andCandidateRecord:(id)a4;
- (os_state_data_s)_stateCapture;
- (void)_backupCloudIdentityKeychainViewAndPushToKVS;
- (void)_backupCloudIdentityKeychainViewAndPushToKVSCheckBackupEnabled:(BOOL)a3;
- (void)_backupCloudIdentityKeychainViewAndPushToKVSForRecoveryKey;
- (void)_backupFullKeychain;
- (void)_backupFullKeychainWithReply:(id)a3;
- (void)_backupKeychain;
- (void)_backupKeychainFully:(BOOL)a3 reply:(id)a4;
- (void)_deleteAlliCDPRecordsWithContext:(id)a3;
- (void)_disableBackup;
- (void)_enumerateICDPBackupsUsingBlock:(id)a3;
- (void)_fetchStingrayAccountStatusInDaemon:(id)a3 reply:(id)a4;
- (void)_getAccountInfoWithRequest:(id)a3 reply:(id)a4;
- (void)_recoverSilentWithCDPContext:(id)a3 allRecords:(id)a4 reply:(id)a5;
- (void)_recoverWithCDPContext:(id)a3 escrowRecord:(id)a4 reply:(id)a5;
- (void)_recoverWithRequest:(id)a3 reply:(id)a4;
- (void)_removeCachedKeychain;
- (void)_removeKVSKeybag;
- (void)_removeKeychainItemForKey:(id)a3;
- (void)_removeMetadata;
- (void)_removeProtectedKeychain;
- (void)_removeUsesEscrow;
- (void)_removeVeeTwoBackup;
- (void)_restoreKeychainAsyncWithBackupBag:(id)a3 password:(id)a4 keybagDigest:(id)a5 haveBottledPeer:(BOOL)a6 restoredViews:(id)a7 viewsNotToBeRestored:(id)a8;
- (void)_restoreKeychainAsyncWithPassword:(id)a3 keybagDigest:(id)a4 haveBottledPeer:(BOOL)a5 viewsNotToBeRestored:(id)a6 reply:(id)a7;
- (void)_saveKeychainItem:(id)a3 forKey:(id)a4;
- (void)_setAutobackupEnabled;
- (void)_setAutobackupEnabledWithReply:(id)a3;
- (void)_setBackupEnabled:(BOOL)a3 iCDP:(BOOL)a4;
- (void)_setEMCSBackup:(id)a3 keybag:(id)a4;
- (void)_setKVSKeybag:(id)a3;
- (void)_setMetadata:(id)a3;
- (void)_setUsesEscrow:(BOOL)a3;
- (void)_stashRecoveryDataWithRequest:(id)a3 reply:(id)a4;
- (void)_storeProtectedKeychainInKVS:(id)a3 keybagDigest:(id)a4;
- (void)_storeVeeTwoBackupInKVS:(id)a3 forViewName:(id)a4 withKeyStore:(id)a5 manifestDigest:(id)a6 keybagDigest:(id)a7;
- (void)backOffDateWithRequest:(id)a3 reply:(id)a4;
- (void)backupForRecoveryKeyWithInfo:(id)a3 garbageCollect:(BOOL)a4 reply:(id)a5;
- (void)backupForRecoveryKeyWithInfoInDaemon:(id)a3 reply:(id)a4;
- (void)backupWithInfo:(id)a3 garbageCollect:(BOOL)a4 reply:(id)a5;
- (void)backupWithInfo:(id)a3 reply:(id)a4;
- (void)beginHSA2PasscodeRequest:(id)a3 desirePasscodeImmediately:(BOOL)a4 uuid:(id)a5 reason:(id)a6 reply:(id)a7;
- (void)cachePassphraseWithRequest:(id)a3 reply:(id)a4;
- (void)cachePassphraseWithRequestAsync:(id)a3;
- (void)cacheRecoveryKeyWithRequest:(id)a3 reply:(id)a4;
- (void)changeSMSTargetWithRequest:(id)a3 reply:(id)a4;
- (void)clearNotifyToken;
- (void)createICDPRecordWithRequest:(id)a3 recordContents:(id)a4 reply:(id)a5;
- (void)daemonPasscodeRequestOpinion:(id)a3;
- (void)deleteAlliCDPRecordsWithRequest:(id)a3 reply:(id)a4;
- (void)disableWithRequest:(id)a3 reply:(id)a4;
- (void)disableiCDPBackup;
- (void)doEnableEscrowMultiICSCWithRequest:(id)a3 reply:(id)a4;
- (void)doSynchronize;
- (void)enableGuitarfishTokenWithRequest:(id)a3 reply:(id)a4;
- (void)enableWithRequest:(id)a3 reply:(id)a4;
- (void)fetchStingrayAccountStatusInDaemon:(id)a3 reply:(id)a4;
- (void)garbageCollectEMCSBackupsExcluding:(id)a3;
- (void)getAcceptedTermsForAltDSID:(id)a3 reply:(id)a4;
- (void)getAccountInfoWithRequest:(id)a3 reply:(id)a4;
- (void)getCertificatesWithRequest:(id)a3 reply:(id)a4;
- (void)getCountrySMSCodesWithRequest:(id)a3 reply:(id)a4;
- (void)handleEscrowStoreResults:(id)a3 escrowError:(id)a4 request:(id)a5 peerID:(id)a6 newRecordMetadata:(id)a7 backupKeybag:(id)a8 reply:(id)a9;
- (void)handleNotification:(id)a3;
- (void)isRecoveryKeySetInDaemon:(id)a3;
- (void)knownICDPFederations:(id)a3;
- (void)moveToFederationAllowed:(id)a3 altDSID:(id)a4 reply:(id)a5;
- (void)notificationInfoWithReply:(id)a3;
- (void)notificationOccurred:(id)a3;
- (void)prepareHSA2EscrowRecordContents:(id)a3 usesComplexPassphrase:(BOOL)a4 reply:(id)a5;
- (void)recordIDAndMetadataForSilentAttempt:(id)a3 passphraseLength:(unint64_t)a4 platform:(int)a5 reply:(id)a6;
- (void)recordNotification:(id)a3 handled:(BOOL)a4;
- (void)recoverEscrowWithRequest:(id)a3 reply:(id)a4;
- (void)recoverGuitarfishTokenWithRequest:(id)a3 reply:(id)a4;
- (void)recoverRecordContentsWithRequest:(id)a3 reply:(id)a4;
- (void)recoverSilentWithCDPContextInDaemon:(id)a3 allRecords:(id)a4 reply:(id)a5;
- (void)recoverWithCDPContextInDaemon:(id)a3 escrowRecord:(id)a4 reply:(id)a5;
- (void)recoverWithRequest:(id)a3 reply:(id)a4;
- (void)registerForNotifyEvent:(id)a3;
- (void)removeRecoveryKeyFromBackupInDaemon:(id)a3;
- (void)restoreBackupName:(id)a3 peerID:(id)a4 keybag:(id)a5 password:(id)a6 backup:(id)a7 reply:(id)a8;
- (void)restoreKeychainAsyncWithPasswordInDaemon:(id)a3 keybagDigest:(id)a4 haveBottledPeer:(BOOL)a5 viewsNotToBeRestored:(id)a6 reply:(id)a7;
- (void)restoreKeychainWithBackupPasswordInDaemon:(id)a3 reply:(id)a4;
- (void)saveTermsAcceptance:(id)a3 reply:(id)a4;
- (void)setBackOffDateWithRequest:(id)a3 reply:(id)a4;
- (void)setBackupAllowed:(BOOL)a3;
- (void)setCacheDirURL:(id)a3;
- (void)setCachedPassphrase:(id)a3;
- (void)setCachedPassphraseFD:(int)a3;
- (void)setCachedRecordID:(id)a3;
- (void)setCachedRecordIDPassphrase:(id)a3;
- (void)setCachedRecordIDPassphraseFD:(int)a3;
- (void)setCachedRecoveryKey:(id)a3;
- (void)setCachedRecoveryKeyFD:(int)a3;
- (void)setEMCSDict:(id)a3 backupKeybag:(id)a4 saveKeybag:(BOOL)a5 reply:(id)a6;
- (void)setHandledNotifications:(id)a3;
- (void)setICloudEnvironment:(id)a3;
- (void)setIgnoredNotifications:(id)a3;
- (void)setNeedInitialBackup:(BOOL)a3;
- (void)setPasscodeMetadata:(id)a3 passphraseType:(int)a4;
- (void)setPendingNotification:(BOOL)a3;
- (void)setupNotifyEvents;
- (void)sortForMatchingPassphraseLengthAndPlatform:(id)a3 secureBackups:(id)a4 passphraseLength:(unint64_t)a5 platform:(unint64_t)a6 reply:(id)a7;
- (void)startSMSChallengeWithRequest:(id)a3 reply:(id)a4;
- (void)stashRecoveryDataWithRequest:(id)a3 reply:(id)a4;
- (void)stateCaptureWithReply:(id)a3;
- (void)storeDERBackupInKVS:(id)a3;
- (void)synchronizeKVSWithHandler:(id)a3;
- (void)uncachePassphraseWithRequest:(id)a3 reply:(id)a4;
- (void)uncachePassphraseWithRequestAsync:(id)a3;
- (void)uncacheRecordIDPassphrase;
- (void)uncacheRecoveryKeyWithRequest:(id)a3 reply:(id)a4;
- (void)unregisterForNotifyEvent:(id)a3;
- (void)updateMetadataWithRequest:(id)a3 reply:(id)a4;
- (void)verifyRecoveryKeyInDaemon:(id)a3 reply:(id)a4;
@end

@implementation SecureBackupDaemon

- (id)_createBackupKeybagWithPassword:(id)a3
{
  int v15 = -1;
  id v3 = a3;
  id v4 = [v3 bytes];
  int v5 = [v3 length];

  int v6 = sub_1000481CC((uint64_t)v4, v5, 4u, &v15);
  if (v6)
  {
    int v7 = v6;
    v8 = CloudServicesLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v18) = 67109120;
      HIDWORD(v18) = v7;
      v9 = "ask_create_bag() returned %d";
      v10 = (uint8_t *)&v18;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 8u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v18 = 0;
  int v11 = sub_10004833C();
  if (v11)
  {
    int v12 = v11;
    v8 = CloudServicesLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v17 = v12;
      v9 = "aks_save_bag() returned %d";
      v10 = buf;
      goto LABEL_7;
    }
LABEL_8:

    v13 = 0;
    goto LABEL_9;
  }
  v13 = +[NSData dataWithBytes:v18 length:1];
  if (v18) {
    free(v18);
  }
LABEL_9:

  return v13;
}

- (void)_saveKeychainItem:(id)a3 forKey:(id)a4
{
  v13[0] = kSecAttrAccount;
  v13[1] = kSecAttrService;
  v14[0] = a4;
  v14[1] = @"SecureBackupService";
  v13[2] = kSecClass;
  v13[3] = kSecAttrSynchronizable;
  v14[2] = kSecClassGenericPassword;
  v14[3] = &__kCFBooleanTrue;
  v13[4] = kSecAttrAccessible;
  v13[5] = kSecValueData;
  v14[4] = kSecAttrAccessibleAfterFirstUnlock;
  v14[5] = a3;
  id v5 = a4;
  id v6 = a3;
  CFDictionaryRef v7 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:6];

  OSStatus v8 = SecItemAdd(v7, 0);
  if (v8)
  {
    OSStatus v9 = v8;
    v10 = CloudServicesLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      uint64_t v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "SecItemAdd() returned %ld", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)_removeKeychainItemForKey:(id)a3
{
  v10[0] = kSecAttrAccount;
  v10[1] = kSecAttrService;
  v11[0] = a3;
  v11[1] = @"SecureBackupService";
  v10[2] = kSecClass;
  v10[3] = kSecAttrSynchronizable;
  v11[2] = kSecClassGenericPassword;
  v11[3] = &__kCFBooleanTrue;
  id v3 = a3;
  CFDictionaryRef v4 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];

  OSStatus v5 = SecItemDelete(v4);
  if (v5)
  {
    OSStatus v6 = v5;
    CFDictionaryRef v7 = CloudServicesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      uint64_t v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "SecItemDelete() returned %ld", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (id)_getKeychainItemForKey:(id)a3 status:(int *)a4
{
  id v5 = a3;
  CFTypeRef result = 0;
  v15[0] = kSecAttrAccount;
  v15[1] = kSecAttrService;
  v16[0] = v5;
  v16[1] = @"SecureBackupService";
  v15[2] = kSecClass;
  v15[3] = kSecAttrSynchronizable;
  v16[2] = kSecClassGenericPassword;
  v16[3] = &__kCFBooleanTrue;
  v15[4] = kSecReturnData;
  v16[4] = &__kCFBooleanTrue;
  CFDictionaryRef v6 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:5];
  OSStatus v7 = SecItemCopyMatching(v6, &result);
  OSStatus v8 = v7;
  if (a4) {
    *a4 = v7;
  }
  if (v7 != -25300 && v7)
  {
    v10 = CloudServicesLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "SecItemCopyMatching() returned %ld", buf, 0xCu);
    }

    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = (void *)result;
  }

  return v9;
}

- (void)_storeProtectedKeychainInKVS:(id)a3 keybagDigest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  OSStatus v8 = [(SecureBackupDaemon *)self kvs];
  uint64_t v9 = +[CSDateUtilities posixDateFormatter];
  v10 = +[NSDate date];
  int v11 = [v9 stringFromDate:v10];

  uint64_t v12 = CloudServicesLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    int v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Storing keychain in KVS @%@", (uint8_t *)&v14, 0xCu);
  }

  v13 = +[NSMutableDictionary dictionary];
  [v13 setObject:v11 forKeyedSubscript:kSecureBackupTimestampKey];
  [v13 setObject:v7 forKeyedSubscript:@"com.apple.securebackup.keychain"];

  [v13 setObject:v6 forKeyedSubscript:kSecureBackupKeybagDigestKey];
  [v8 setDictionary:v13 forKey:@"com.apple.securebackup.record"];
  [(SecureBackupDaemon *)self doSynchronize];
}

- (void)_storeVeeTwoBackupInKVS:(id)a3 forViewName:(id)a4 withKeyStore:(id)a5 manifestDigest:(id)a6 keybagDigest:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v36 = a7;
  id v15 = [objc_alloc((Class)NSString) initWithFormat:@"%@.%@", @"com.apple.icdp.backup", v12];
  v34 = [v13 dictionaryForKey:v15];
  v16 = [v34 objectForKeyedSubscript:@"com.apple.securebackup.keychain"];
  uint64_t v17 = [v11 objectForKeyedSubscript:@"keybag"];
  v18 = [v16 objectForKeyedSubscript:@"backup"];
  v19 = [v11 objectForKeyedSubscript:@"backup"];
  v33 = (void *)v17;
  if ([v18 isEqual:v19])
  {
    [v16 objectForKeyedSubscript:@"keybag"];
    v21 = id v20 = v14;
    unsigned int v22 = [v21 isEqual:v17];

    id v14 = v20;
    if (v22)
    {
      v23 = CloudServicesLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v40 = v12;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "skipping identical backup for %@", buf, 0xCu);
      }
      goto LABEL_9;
    }
  }
  else
  {
  }
  v23 = objc_alloc_init((Class)NSDate);
  v24 = objc_msgSend(v12, "substringToIndex:", objc_msgSend(v12, "rangeOfString:", @"-tomb"));
  id v31 = v14;
  v25 = [v14 hexString];
  v26 = [v25 substringToIndex:6];

  v27 = [v36 hexString];
  v28 = [v27 substringToIndex:6];

  v29 = CloudServicesLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v40 = v26;
    __int16 v41 = 2112;
    v42 = v28;
    __int16 v43 = 2112;
    v44 = v24;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "backing up manifest digest %@, keybag digest %@, view %@", buf, 0x20u);
  }

  v37[0] = kSecureBackupTimestampKey;
  v37[1] = @"com.apple.securebackup.keychain";
  v38[0] = v23;
  v38[1] = v11;
  v30 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
  [v13 setDictionary:v30 forKey:v15];
  [(SecureBackupDaemon *)self doSynchronize];

  id v14 = v31;
LABEL_9:
}

- (void)_removeCachedKeychain
{
  id v3 = [(SecureBackupDaemon *)self cachedKeychainURL];

  if (v3)
  {
    CFDictionaryRef v4 = +[NSFileManager defaultManager];
    id v5 = [(SecureBackupDaemon *)self cachedKeychainURL];
    id v9 = 0;
    unsigned __int8 v6 = [v4 removeItemAtURL:v5 error:&v9];
    id v7 = v9;

    if ((v6 & 1) == 0 && [v7 code] != (id)4)
    {
      OSStatus v8 = CloudServicesLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "error removing keychain: %@", buf, 0xCu);
      }
    }
  }
}

- (id)derDataFromDict:(id)a3
{
  id v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100011208;
  v8[3] = &unk_100071178;
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = v9;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  unsigned __int8 v6 = [(SecureBackupDaemon *)self createDERDataFromPlist:v5];

  return v6;
}

- (void)storeDERBackupInKVS:(id)a3
{
  id v4 = a3;
  id v5 = [(SecureBackupDaemon *)self kvs];
  unsigned __int8 v6 = +[CSDateUtilities posixDateFormatter];
  id v7 = +[NSDate date];
  OSStatus v8 = [v6 stringFromDate:v7];

  id v9 = CloudServicesLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Storing DER keychain in KVS @%@", (uint8_t *)&v11, 0xCu);
  }

  v10 = +[NSMutableDictionary dictionary];
  [v10 setObject:v8 forKeyedSubscript:kSecureBackupTimestampKey];
  [v10 setObject:v4 forKeyedSubscript:@"com.apple.securebackup.keychain"];

  [v5 setDictionary:v10 forKey:@"DERBackup"];
  [(SecureBackupDaemon *)self doSynchronize];
}

- (id)_pushCachedKeychainToKVSForView:(id)a3 recordID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  OSStatus v8 = [(SecureBackupDaemon *)self kvs];
  id v9 = [[SecureBackupViewStore alloc] initWithViewName:v6 recordID:v7];

  v10 = [(SecureBackupViewStore *)v9 backupData];
  if (v10)
  {
    if ([v6 isEqualToString:@"KeychainV0-tomb"])
    {
      int v11 = [(SecureBackupDaemon *)self _getProtectedKeychainAndKeybagDigestFromKVS:0];
      id v12 = [(SecureBackupViewStore *)v9 backupDict];
      id v13 = [(SecureBackupViewStore *)v9 keybagDigest];
      id v14 = v11;
      id v15 = v12;
      if (v14 == v15) {
        goto LABEL_6;
      }
      id v16 = [v14 hash];
      if (v16 != [v15 hash]) {
        goto LABEL_16;
      }
      uint64_t v17 = [v14 allKeys];
      v30 = +[NSSet setWithArray:v17];

      v18 = [v15 allKeys];
      v19 = +[NSSet setWithArray:v18];

      unsigned int v29 = [v30 isEqualToSet:v19];
      if (v29)
      {
LABEL_6:
      }
      else
      {
LABEL_16:

        [(SecureBackupDaemon *)self _storeProtectedKeychainInKVS:v15 keybagDigest:v13];
      }
    }
    else
    {
      id v14 = [(SecureBackupViewStore *)v9 keybag];
      uint64_t v21 = [(SecureBackupViewStore *)v9 recordID];
      unsigned int v22 = (void *)v21;
      if (v14 && v21)
      {
        v34[0] = @"backup";
        v34[1] = @"keybag";
        v35[0] = v10;
        v35[1] = v14;
        v34[2] = @"recordID";
        v35[2] = v21;
        v23 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:3];
        v24 = [(SecureBackupViewStore *)v9 manifestHash];
        v25 = [v24 sha1Digest];
        [v14 sha1Digest];
        id v31 = v22;
        v27 = v26 = v8;
        [(SecureBackupDaemon *)self _storeVeeTwoBackupInKVS:v23 forViewName:v6 withKeyStore:v26 manifestDigest:v25 keybagDigest:v27];

        OSStatus v8 = v26;
        unsigned int v22 = v31;
      }
      else
      {
        v23 = CloudServicesLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_10004A0A8();
        }
      }
    }
  }
  else
  {
    id v20 = CloudServicesLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v6;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "skipping empty backup for view %@", buf, 0xCu);
    }
  }
  [(SecureBackupViewStore *)v9 closeStore];

  return 0;
}

- (id)_pushCachedKeychainToKVS
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_100011AB0;
  unsigned int v22 = sub_100011AC0;
  id v23 = 0;
  id obj = 0;
  id v3 = [(SecureBackupDaemon *)self copyMyPeerInfo:&obj];
  objc_storeStrong(&v23, obj);
  if (v3)
  {
    id v4 = [(SecureBackupDaemon *)self copyPeerID:v3];
    id v5 = CloudServicesLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "backing up peer ID %@", buf, 0xCu);
    }

    id v6 = [(SecureBackupDaemon *)self copyBackupKey:v3];
    id v7 = v6;
    if (v6)
    {
      OSStatus v8 = [v6 sha1Digest];
      id v9 = CloudServicesLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "using backup key: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v7 = CloudServicesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10004A14C();
    }
    id v4 = @"unknown";
  }

  v10 = [(SecureBackupDaemon *)self kvsQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100011AC8;
  v14[3] = &unk_1000711C8;
  id v15 = v4;
  id v16 = &v18;
  v14[4] = self;
  int v11 = v4;
  dispatch_sync(v10, v14);

  id v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

- (void)_removeProtectedKeychain
{
  id v3 = [(SecureBackupDaemon *)self kvs];
  id v4 = [v3 objectForKey:@"com.apple.securebackup.record"];
  id v5 = CloudServicesLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 objectForKeyedSubscript:kSecureBackupTimestampKey];
    int v7 = 138412290;
    OSStatus v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing backup record from @%@", (uint8_t *)&v7, 0xCu);
  }
  [v3 removeObjectForKey:@"com.apple.securebackup.record"];
  [(SecureBackupDaemon *)self doSynchronize];
  [(SecureBackupDaemon *)self _removeCachedKeychain];
}

- (id)_getProtectedKeychainAndKeybagDigestFromKVS:(id *)a3
{
  id v4 = [(SecureBackupDaemon *)self kvs];
  id v5 = [v4 dictionaryForKey:@"com.apple.securebackup.record"];
  id v6 = CloudServicesLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [v5 objectForKeyedSubscript:kSecureBackupTimestampKey];
    int v10 = 138412290;
    int v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Retrieving keychain from @%@", (uint8_t *)&v10, 0xCu);
  }
  if (a3)
  {
    *a3 = [v5 objectForKeyedSubscript:kSecureBackupKeybagDigestKey];
  }
  OSStatus v8 = [v5 objectForKeyedSubscript:@"com.apple.securebackup.keychain"];

  return v8;
}

- (id)_getICDPBackupFromKVS:(id)a3 forView:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSString) initWithFormat:@"%@.%@-tomb", @"com.apple.icdp.backup", v5];

  OSStatus v8 = [v6 dictionaryForKey:v7];

  return v8;
}

- (void)_enumerateICDPBackupsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(SecureBackupDaemon *)self kvsQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001207C;
  v7[3] = &unk_1000711F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)_removeVeeTwoBackup
{
  id v3 = [(SecureBackupDaemon *)self kvs];
  id v4 = [v3 objectForKey:@"com.apple.icdp.backup"];
  id v5 = CloudServicesLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 objectForKeyedSubscript:kSecureBackupTimestampKey];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing view-based backup from @%@", (uint8_t *)&v7, 0xCu);
  }
  [v3 removeObjectForKey:@"com.apple.icdp.backup"];
  [(SecureBackupDaemon *)self doSynchronize];
}

- (id)_getDERBackupFromKVS
{
  v2 = [(SecureBackupDaemon *)self kvs];
  id v3 = [v2 dictionaryForKey:@"DERBackup"];
  id v4 = CloudServicesLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 objectForKeyedSubscript:kSecureBackupTimestampKey];
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Retrieving keychain from @%@", (uint8_t *)&v8, 0xCu);
  }
  id v6 = [v3 objectForKeyedSubscript:@"com.apple.securebackup.keychain"];

  return v6;
}

- (id)_getLastBackupTimestamp
{
  v2 = [(SecureBackupDaemon *)self kvs];
  id v3 = [v2 dictionaryForKey:@"com.apple.securebackup.record"];
  id v4 = [v3 objectForKeyedSubscript:kSecureBackupTimestampKey];

  return v4;
}

- (void)_setBackupEnabled:(BOOL)a3 iCDP:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (_os_feature_enabled_impl())
  {
    int v7 = CloudServicesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "SOS Compatibility Mode enabled, ignoring setting backup enabled bit", (uint8_t *)v11, 2u);
    }
  }
  else
  {
    int v7 = [(SecureBackupDaemon *)self kvs];
    int v8 = @"com.apple.securebackup.enabled";
    if (v4) {
      int v8 = @"com.apple.icdpbackup.enabled";
    }
    id v9 = v8;
    int v10 = CloudServicesLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109376;
      v11[1] = [v7 BOOLForKey:v9];
      __int16 v12 = 1024;
      BOOL v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Changing backup status %u->%u", (uint8_t *)v11, 0xEu);
    }

    [v7 setBool:v5 forKey:v9];
    if (v5) {
      [v7 setString:@"1" forKey:@"BackupVersion"];
    }
    else {
      [v7 removeObjectForKey:@"BackupVersion"];
    }
    [(SecureBackupDaemon *)self doSynchronize];
  }
}

- (BOOL)_backupEnabled
{
  if (_os_feature_enabled_impl())
  {
    id v3 = CloudServicesLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SOS Compatibility Mode enabled, backup is no longer supported", v7, 2u);
    }

    return 0;
  }
  else
  {
    BOOL v5 = [(SecureBackupDaemon *)self kvs];
    if ([v5 BOOLForKey:@"com.apple.securebackup.enabled"]) {
      unsigned __int8 v4 = 1;
    }
    else {
      unsigned __int8 v4 = [v5 BOOLForKey:@"com.apple.icdpbackup.enabled"];
    }
  }
  return v4;
}

- (void)_setUsesEscrow:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(SecureBackupDaemon *)self kvs];
  id v6 = CloudServicesLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109376;
    v7[1] = [v5 BOOLForKey:@"BackupUsesEscrow"];
    __int16 v8 = 1024;
    BOOL v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Changing escrow usage %u->%u", (uint8_t *)v7, 0xEu);
  }

  [v5 setBool:v3 forKey:@"BackupUsesEscrow"];
  [(SecureBackupDaemon *)self doSynchronize];
}

- (BOOL)_usesEscrow
{
  v2 = [(SecureBackupDaemon *)self kvs];
  unsigned __int8 v3 = [v2 BOOLForKey:@"BackupUsesEscrow"];

  return v3;
}

- (void)_removeUsesEscrow
{
  id v3 = [(SecureBackupDaemon *)self kvs];
  [v3 removeObjectForKey:@"BackupUsesEscrow"];
  [(SecureBackupDaemon *)self doSynchronize];
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SecureBackupDaemon *)self kvs];
  id v6 = CloudServicesLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  uint64_t v8 = kSecureBackupMetadataKey;
  if (v7)
  {
    BOOL v9 = [v5 objectForKey:kSecureBackupMetadataKey];
    int v10 = 138412546;
    int v11 = v9;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Changing metadata old: %@\n\nnew: %@", (uint8_t *)&v10, 0x16u);
  }
  [v5 setDictionary:v4 forKey:v8];
  [(SecureBackupDaemon *)self doSynchronize];
}

- (id)_metadata
{
  v2 = [(SecureBackupDaemon *)self kvs];
  id v3 = [v2 dictionaryForKey:kSecureBackupMetadataKey];

  return v3;
}

- (void)_removeMetadata
{
  id v3 = [(SecureBackupDaemon *)self kvs];
  id v4 = CloudServicesLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  uint64_t v6 = kSecureBackupMetadataKey;
  if (v5)
  {
    BOOL v7 = [v3 objectForKey:kSecureBackupMetadataKey];
    int v8 = 138412290;
    BOOL v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing metadata: %@", (uint8_t *)&v8, 0xCu);
  }
  [v3 removeObjectForKey:v6];
  [(SecureBackupDaemon *)self doSynchronize];
}

- (void)_setKVSKeybag:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SecureBackupDaemon *)self kvs];
  uint64_t v6 = [v5 dataForKey:@"BackupKeybag"];
  if (v6)
  {
    BOOL v7 = CloudServicesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [v6 sha1Digest];
      int v11 = 138412290;
      __int16 v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Overwriting keybag in KVS! Old digest: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  BOOL v9 = CloudServicesLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [v4 sha1Digest];
    int v11 = 138412290;
    __int16 v12 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Saving keybag in KVS digest: %@", (uint8_t *)&v11, 0xCu);
  }
  [v5 setData:v4 forKey:@"BackupKeybag"];
  [(SecureBackupDaemon *)self doSynchronize];
}

- (id)_KVSKeybag
{
  v2 = [(SecureBackupDaemon *)self kvs];
  id v3 = [v2 dataForKey:@"BackupKeybag"];

  return v3;
}

- (void)_setEMCSBackup:(id)a3 keybag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19 = self;
  int v8 = [(SecureBackupDaemon *)self kvs];
  BOOL v9 = +[NSUbiquitousKeyValueStore additionalStoreWithIdentifier:@"com.apple.sbd.emcs"];
  int v10 = CloudServicesLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Saving EMCS backup", buf, 2u);
  }

  int v11 = +[NSUUID UUID];
  __int16 v12 = [v11 UUIDString];

  CFPreferencesSetAppValue(@"EMCSBackupUUID", v12, SECURE_BACKUP_SERVICE_NAME);
  [v9 setString:v12 forKey:@"EMCSBackupUUID"];
  v21[0] = @"backup";
  v21[1] = @"keybag";
  v22[0] = v6;
  v22[1] = v7;
  v21[2] = @"timestamp";
  id v13 = objc_alloc_init((Class)NSDate);
  v21[3] = @"uuid";
  v22[2] = v13;
  v22[3] = v12;
  id v14 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];

  id v15 = objc_alloc((Class)NSString);
  id v16 = [v7 sha1Digest];
  uint64_t v17 = [v16 hexString];
  id v18 = [v15 initWithFormat:@"%@-%@", @"EMCSBackupDict", v17];

  [v8 setDictionary:v14 forKey:v18];
  [v8 setDictionary:v14 forKey:@"EMCSBackupDict"];
  [(SecureBackupDaemon *)v19 doSynchronize];
}

- (id)_EMCSBackup
{
  v2 = [(SecureBackupDaemon *)self kvs];
  id v3 = [v2 dataForKey:@"EMCSBackup"];

  return v3;
}

- (id)_EMCSBackupDictForKeybagDigest:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SecureBackupDaemon *)self kvs];
  id v6 = @"EMCSBackupDict";
  if (v4)
  {
    id v7 = objc_alloc((Class)NSString);
    int v8 = [v4 hexString];
    id v6 = (__CFString *)[v7 initWithFormat:@"%@-%@", @"EMCSBackupDict", v8];
  }
  uint64_t v9 = [v5 dictionaryForKey:v6];
  if (v9)
  {
    int v10 = (void *)v9;
    if (!v4) {
      goto LABEL_23;
    }
    int v11 = [v5 dictionaryForKey:@"EMCSBackupDict"];
    __int16 v12 = [v11 objectForKeyedSubscript:@"keybag"];
    id v13 = v12;
    if (v11)
    {
      if (v12)
      {
        id v14 = [v12 sha1Digest];
        unsigned int v15 = [v4 isEqual:v14];

        if (v15)
        {
          id v16 = [v10 objectForKeyedSubscript:@"timestamp"];
          if (v16)
          {
            uint64_t v17 = [v11 objectForKeyedSubscript:@"timestamp"];
            id v18 = [v17 compare:v16];

            if (v18 == (id)1)
            {
              v19 = CloudServicesLog();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Found non-tagged EMCS backup with more recent timestamp", buf, 2u);
              }

              id v20 = v11;
              int v10 = v20;
            }
          }
        }
      }
    }
    goto LABEL_22;
  }
  uint64_t v21 = CloudServicesLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "looking for non-tagged EMCS backup", buf, 2u);
  }

  int v10 = [v5 dictionaryForKey:@"EMCSBackupDict"];
  if (!v10)
  {
    unsigned int v22 = CloudServicesLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "looking for old-style EMCS backup", buf, 2u);
    }

    int v11 = [v5 dataForKey:@"EMCSBackup"];
    uint64_t v23 = [v5 dataForKey:@"BackupKeybag"];
    id v13 = (void *)v23;
    int v10 = 0;
    if (v11 && v23)
    {
      v26[0] = @"backup";
      v26[1] = @"keybag";
      v27[0] = v11;
      v27[1] = v23;
      int v10 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
    }
LABEL_22:
  }
LABEL_23:

  return v10;
}

- (void)garbageCollectEMCSBackupsExcluding:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SecureBackupDaemon *)self kvs];
  id v6 = [v5 dictionaryRepresentation];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v16;
    *(void *)&long long v8 = 138412290;
    long long v14 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        __int16 v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isEqualToString:", @"EMCSBackupDict", v14) & 1) == 0
          && [v12 hasPrefix:@"EMCSBackupDict"]
          && ([v12 hasSuffix:v4] & 1) == 0)
        {
          id v13 = CloudServicesLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            id v20 = v12;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "garbage collecting backup %@", buf, 0xCu);
          }

          [v5 removeObjectForKey:v12];
        }
      }
      id v9 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v9);
  }
}

- (void)_removeKVSKeybag
{
  id v3 = [(SecureBackupDaemon *)self kvs];
  id v4 = CloudServicesLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = [v3 objectForKey:@"BackupKeybag"];
    id v6 = [v5 sha1Digest];
    int v7 = 138412290;
    long long v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing keybag from KVS digest: %@", (uint8_t *)&v7, 0xCu);
  }
  [v3 removeObjectForKey:@"BackupKeybag"];
  [(SecureBackupDaemon *)self doSynchronize];
}

- (void)_setAutobackupEnabledWithReply:(id)a3
{
  [(SecureBackupDaemon *)self _backupFullKeychainWithReply:a3];
  id v4 = [(SecureBackupDaemon *)self circleChangedNotification];
  [(SecureBackupDaemon *)self unregisterForNotifyEvent:v4];

  [(SecureBackupDaemon *)self setNeedInitialBackup:0];
}

- (void)_setAutobackupEnabled
{
}

- (void)_backupFullKeychainWithReply:(id)a3
{
}

- (void)_backupFullKeychain
{
}

- (void)_backupKeychain
{
}

- (void)_backupKeychainFully:(BOOL)a3 reply:(id)a4
{
  id v6 = a4;
  if ([(SecureBackupDaemon *)self _backupEnabled])
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = sub_100011AB0;
    v17[4] = sub_100011AC0;
    id v18 = (id)0xAAAAAAAAAAAAAAAALL;
    id v18 = (id)os_transaction_create();
    int v7 = CloudServicesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      long long v8 = "";
      if (!v6) {
        long long v8 = "a";
      }
      *(_DWORD *)buf = 136315138;
      id v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "calling %ssynchronous backup", buf, 0xCu);
    }

    id v9 = [(SecureBackupDaemon *)self backupQueue];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100013948;
    v13[3] = &unk_100071218;
    v13[4] = self;
    BOOL v16 = a3;
    id v14 = v6;
    long long v15 = v17;
    dispatch_async(v9, v13);

    _Block_object_dispose(v17, 8);
  }
  else
  {
    uint64_t v10 = CloudServicesLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10004A21C();
    }

    if (v6)
    {
      NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
      CFStringRef v22 = @"Attempt to back up when backup not enabled";
      int v11 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      __int16 v12 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:16 userInfo:v11];
      (*((void (**)(id, void *))v6 + 2))(v6, v12);
    }
  }
}

- (void)_backupCloudIdentityKeychainViewAndPushToKVSForRecoveryKey
{
}

- (void)_backupCloudIdentityKeychainViewAndPushToKVS
{
}

- (void)_backupCloudIdentityKeychainViewAndPushToKVSCheckBackupEnabled:(BOOL)a3
{
  if (!a3)
  {
    BOOL v5 = CloudServicesLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_backupCloudIdentityKeychainViewAndPushToKVS: not checking if backup is enabled", buf, 2u);
    }

    goto LABEL_9;
  }
  if ([(SecureBackupDaemon *)self _backupEnabled])
  {
LABEL_9:
    *(void *)buf = 0;
    id v9 = buf;
    uint64_t v10 = 0x3032000000;
    int v11 = sub_100011AB0;
    __int16 v12 = sub_100011AC0;
    id v13 = (id)0xAAAAAAAAAAAAAAAALL;
    id v13 = (id)os_transaction_create();
    id v6 = [(SecureBackupDaemon *)self backupQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    _DWORD v7[2] = sub_100013BD8;
    v7[3] = &unk_100071240;
    v7[4] = self;
    void v7[5] = buf;
    dispatch_async(v6, v7);

    _Block_object_dispose(buf, 8);
    return;
  }
  id v4 = CloudServicesLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10004A250();
  }
}

- (id)_consumeViewBackup:(id)a3 recordID:(id)a4
{
  id v5 = a3;
  id v55 = a4;
  id v6 = CloudServicesLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "_consumeViewBackup: consuming backup for view %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v107 = 0x3032000000;
  v108 = sub_100011AB0;
  v109 = sub_100011AC0;
  id v110 = 0;
  uint64_t v86 = 0;
  v87 = &v86;
  uint64_t v88 = 0x2020000000;
  char v89 = 0;
  uint64_t v80 = 0;
  v81 = &v80;
  uint64_t v82 = 0x3032000000;
  v83 = sub_100011AB0;
  v84 = sub_100011AC0;
  id v85 = 0;
  uint64_t v53 = CloudServicesAnalyticsBackupForViewName;
  uint64_t v54 = kSecureBackupErrorDomain;
  uint64_t v52 = CloudServicesAnalyticsSetConfirmedManifest;
  do
  {
    long long v8 = CloudServicesLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v96 = 138412290;
      id v97 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "_consumeViewBackup: calling SecItemBackupWithChanges() for viewname: %@", v96, 0xCu);
    }

    uint64_t v76 = 0;
    v77 = &v76;
    uint64_t v78 = 0x2020000000;
    int v79 = 0;
    uint64_t v72 = 0;
    v73 = &v72;
    uint64_t v74 = 0x2020000000;
    int v75 = 0;
    uint64_t v68 = 0;
    v69 = &v68;
    uint64_t v70 = 0x2020000000;
    int v71 = 0;
    id v67 = 0;
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_10001495C;
    v58[3] = &unk_100071268;
    v61 = &v86;
    v62 = &v76;
    v63 = &v80;
    id v9 = v5;
    id v59 = v9;
    id v10 = v55;
    id v60 = v10;
    p_long long buf = &buf;
    v65 = &v72;
    v66 = &v68;
    unsigned int v11 = [(SecureBackupDaemon *)self backupWithChanges:v9 error:&v67 handler:v58];
    id v12 = v67;
    id v13 = CloudServicesLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = "false";
      if (v11) {
        id v14 = "true";
      }
      int v15 = *((_DWORD *)v77 + 6);
      int v16 = *((_DWORD *)v73 + 6);
      int v17 = *((_DWORD *)v69 + 6);
      *(_DWORD *)v96 = 138413314;
      id v97 = v5;
      __int16 v98 = 2080;
      v99 = v14;
      __int16 v100 = 1024;
      int v101 = v15;
      __int16 v102 = 1024;
      int v103 = v16;
      __int16 v104 = 1024;
      int v105 = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "_consumeViewBackup: SecItemBackupWithChanges() for view %@ returned %s (%d reset, %d add, %d remove)", v96, 0x28u);
    }

    if ((v11 & 1) == 0)
    {
      if (v12)
      {
        v25 = [v12 domain];
        if ([v25 isEqualToString:NSPOSIXErrorDomain])
        {
          BOOL v26 = [v12 code] == (id)2;

          if (v26)
          {
            v19 = CloudServicesLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v96 = 138412290;
              id v97 = v5;
              _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "_consumeViewBackup: SecKeychainBackupWithChanges: no journal file, skipping %@", v96, 0xCu);
            }
            goto LABEL_31;
          }
        }
        else
        {
        }
      }
      v35 = CloudServicesLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v96 = 138412546;
        id v97 = v5;
        __int16 v98 = 2112;
        v99 = (const char *)v12;
        _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "_consumeViewBackup: SecKeychainBackupWithChanges for view %@ failed: %@", v96, 0x16u);
      }

      if (v12)
      {
        id v36 = +[CloudServicesAnalytics logger];
        CFStringRef v94 = @"view";
        id v95 = v9;
        v37 = +[NSDictionary dictionaryWithObjects:&v95 forKeys:&v94 count:1];
        [v36 logUnrecoverableError:v12 forEvent:v53 withAttributes:v37];
      }
      v19 = objc_alloc_init((Class)NSMutableDictionary);
      [v19 setObject:v12 forKeyedSubscript:NSUnderlyingErrorKey];
      uint64_t v38 = +[NSError errorWithDomain:v54 code:24 userInfo:v19];
      v39 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v38;

      goto LABEL_31;
    }
    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      id v18 = CloudServicesLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v48 = *(const char **)(*((void *)&buf + 1) + 40);
        *(_DWORD *)v96 = 138412546;
        id v97 = v5;
        __int16 v98 = 2112;
        v99 = v48;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "_consumeViewBackup: Handling events for view %@ failed: %@", v96, 0x16u);
      }

      v19 = objc_alloc_init((Class)NSMutableDictionary);
      [v19 setObject:*(void *)(*((void *)&buf + 1) + 40) forKeyedSubscript:NSUnderlyingErrorKey];
      uint64_t v20 = +[NSError errorWithDomain:v54 code:24 userInfo:v19];
      NSErrorUserInfoKey v21 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v20;

      CFStringRef v22 = +[CloudServicesAnalytics logger];
      uint64_t v23 = *(void *)(*((void *)&buf + 1) + 40);
      CFStringRef v92 = @"view";
      id v93 = v9;
      v24 = +[NSDictionary dictionaryWithObjects:&v93 forKeys:&v92 count:1];
      [v22 logUnrecoverableError:v23 forEvent:v53 withAttributes:v24];

LABEL_31:
      int v34 = 0;
      goto LABEL_32;
    }
    v27 = CloudServicesLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v96 = 138412290;
      id v97 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "_consumeViewBackup: Successfully handled event for view: %@", v96, 0xCu);
    }

    v28 = +[CloudServicesAnalytics logger];
    [v28 logSuccessForEvent:v53];

    unsigned int v29 = (void *)v81[5];
    if (!v29)
    {
      int v34 = 1;
      goto LABEL_33;
    }
    v30 = [v29 keybagDigest];
    id v31 = [(id)v81[5] manifestHash];
    uint64_t v32 = *((void *)&buf + 1);
    id obj = *(id *)(*((void *)&buf + 1) + 40);
    unsigned __int8 v33 = [(SecureBackupDaemon *)self backupSetConfirmedManifest:v9 digest:v30 manifest:v31 error:&obj];
    objc_storeStrong((id *)(v32 + 40), obj);

    if ((v33 & 1) == 0)
    {
      id v40 = CloudServicesLog();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v49 = *(const char **)(*((void *)&buf + 1) + 40);
        *(_DWORD *)v96 = 138412546;
        id v97 = v5;
        __int16 v98 = 2112;
        v99 = v49;
        _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "_consumeViewBackup: SecItemBackupSetConfirmedManifest for view %@ failed: %@", v96, 0x16u);
      }

      if ([*(id *)(*((void *)&buf + 1) + 40) code] != (id)-25308
        || ([*(id *)(*((void *)&buf + 1) + 40) domain],
            __int16 v41 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v42 = [v41 isEqualToString:NSOSStatusErrorDomain],
            v41,
            (v42 & 1) == 0))
      {
        __int16 v43 = +[CloudServicesAnalytics logger];
        uint64_t v44 = *(void *)(*((void *)&buf + 1) + 40);
        CFStringRef v90 = @"view";
        id v91 = v9;
        v45 = +[NSDictionary dictionaryWithObjects:&v91 forKeys:&v90 count:1];
        [v43 logUnrecoverableError:v44 forEvent:v52 withAttributes:v45];
      }
      v19 = objc_alloc_init((Class)NSMutableDictionary);
      [v19 setObject:*(void *)(*((void *)&buf + 1) + 40) forKeyedSubscript:NSUnderlyingErrorKey];
      uint64_t v46 = +[NSError errorWithDomain:v54 code:24 userInfo:v19];
      v47 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v46;

      goto LABEL_31;
    }
    v19 = +[CloudServicesAnalytics logger];
    [v19 logSuccessForEvent:v52];
    int v34 = 1;
LABEL_32:

LABEL_33:
    _Block_object_dispose(&v68, 8);
    _Block_object_dispose(&v72, 8);
    _Block_object_dispose(&v76, 8);
  }
  while (v34 && !*((unsigned char *)v87 + 24));
  [(id)v81[5] closeStore];
  id v50 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&v80, 8);

  _Block_object_dispose(&v86, 8);
  _Block_object_dispose(&buf, 8);

  return v50;
}

- (id)_consumeFullBackupForRecordID:(id)a3
{
  id v4 = a3;
  id v5 = CloudServicesLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "consuming full backup", buf, 2u);
  }

  *(void *)long long buf = 0;
  BOOL v26 = buf;
  uint64_t v27 = 0x3032000000;
  v28 = sub_100011AB0;
  unsigned int v29 = sub_100011AC0;
  id v30 = 0;
  uint64_t v23 = buf;
  id v24 = 0;
  int v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_100015010;
  uint64_t v20 = &unk_1000711A0;
  NSErrorUserInfoKey v21 = self;
  id v6 = v4;
  id v22 = v6;
  unsigned int v7 = [(SecureBackupDaemon *)self backupWithRegisteredBackupsWithError:&v24 handler:&v17];
  id v8 = v24;
  id v9 = CloudServicesLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = "false";
    if (v7) {
      id v10 = "true";
    }
    *(_DWORD *)id v31 = 136315138;
    uint64_t v32 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SecItemBackupWithRegisteredBackups() returned %s", v31, 0xCu);
  }

  if (v7)
  {
    id v11 = +[CloudServicesAnalytics logger];
    [v11 logSuccessForEvent:CloudServicesAnalyticsBackupWithChangesFull];
  }
  else
  {
    id v12 = CloudServicesLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10004A444();
    }

    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, NSUnderlyingErrorKey, v17, v18, v19, v20, v21);
    uint64_t v13 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:v11];
    id v14 = (void *)*((void *)v26 + 5);
    *((void *)v26 + 5) = v13;
  }
  id v15 = *((id *)v26 + 5);

  _Block_object_dispose(buf, 8);

  return v15;
}

- (id)_consumeBackupJournal
{
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_100011AB0;
  id v31 = sub_100011AC0;
  id v32 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  id v22 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000153C4;
  v17[3] = &unk_1000712B8;
  uint64_t v20 = &v27;
  uint64_t v18 = self;
  id v3 = [(SecureBackupDaemon *)self copyMyPeerID];
  id v19 = v3;
  NSErrorUserInfoKey v21 = &v23;
  unsigned int v4 = [(SecureBackupDaemon *)v18 backupWithRegisteredBackupsWithError:&v22 handler:v17];
  id v5 = v22;
  id v6 = CloudServicesLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = "false";
    if (v4) {
      unsigned int v7 = "true";
    }
    *(_DWORD *)long long buf = 136315138;
    int v34 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SecItemBackupWithRegisteredBackups() returned %s", buf, 0xCu);
  }

  if ((v4 & 1) == 0)
  {
    id v8 = CloudServicesLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10004A444();
    }

    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    [v9 setObject:v5 forKeyedSubscript:NSUnderlyingErrorKey];
    uint64_t v10 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:v9];
    id v11 = (void *)v28[5];
    v28[5] = v10;
  }
  if (*((unsigned char *)v24 + 24))
  {
    id v12 = CloudServicesLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "forcing KVS push", buf, 2u);
    }

    uint64_t v13 = [(SecureBackupDaemon *)self _pushCachedKeychainToKVS];
    id v14 = (void *)v28[5];
    v28[5] = v13;
  }
  id v15 = (id)v28[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v15;
}

- (void)_disableBackup
{
  [(SecureBackupDaemon *)self _removeKeychainItemForKey:@"SecureBackupPublicKeybag"];
  [(SecureBackupDaemon *)self _removeKVSKeybag];
  [(SecureBackupDaemon *)self _removeMetadata];
  [(SecureBackupDaemon *)self _removeProtectedKeychain];
  [(SecureBackupDaemon *)self _removeKeychainItemForKey:@"SecureBackupEscrowCert"];

  [(SecureBackupDaemon *)self _setBackupEnabled:0 iCDP:0];
}

- (void)disableiCDPBackup
{
  [(SecureBackupDaemon *)self _removeVeeTwoBackup];
  [(SecureBackupDaemon *)self _removeMetadata];

  [(SecureBackupDaemon *)self _setBackupEnabled:0 iCDP:1];
}

- (void)registerForNotifyEvent:(id)a3
{
  id v3 = (const char *)[a3 UTF8String];
  if (v3)
  {
    unsigned int v4 = v3;
    id v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v5, "Notification", v4);
    xpc_set_event();
  }
}

- (void)unregisterForNotifyEvent:(id)a3
{
  if ([a3 UTF8String])
  {
    xpc_set_event();
  }
}

- (id)_gestaltValueForKey:(__CFString *)a3
{
  id v3 = (void *)MGCopyAnswerWithError();
  if (!v3)
  {
    unsigned int v4 = CloudServicesLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10004A6C0();
    }

    id v5 = +[CloudServicesAnalytics logger];
    uint64_t v6 = CloudServicesAnalyticsGestalt;
    CFStringRef v10 = @"errorCode";
    unsigned int v7 = +[NSNumber numberWithInt:0];
    id v11 = v7;
    id v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    [v5 logHardFailureForEventNamed:v6 withAttributes:v8];
  }

  return v3;
}

- (id)normalizeSMSTarget:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 length];
  unint64_t v7 = (2 * (void)v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  id v8 = (char *)&v16 - v7;
  if (v6) {
    memset((char *)&v16 - v7, 170, 2 * (void)v6);
  }
  id v9 = +[NSCharacterSet decimalDigitCharacterSet];
  CFStringRef v10 = [v9 invertedSet];

  if ([v5 rangeOfCharacterFromSet:v10 options:2] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (v6)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
        *(_WORD *)&v8[2 * (void)i] = u_charDigitValue((UChar32)[v5 characterAtIndex:i]) + 48;
    }
    a4 = +[NSString stringWithCharacters:v8 length:v6];
  }
  else
  {
    id v12 = CloudServicesLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10004A748();
    }

    if (a4)
    {
      id v13 = objc_alloc_init((Class)NSMutableDictionary);
      id v14 = [objc_alloc((Class)NSString) initWithFormat:@"attempt to enable backup with non-decimal digits in SMS target: %@", v5];
      [v13 setObject:v14 forKeyedSubscript:NSLocalizedDescriptionKey];

      *a4 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:5 userInfo:v13];

      a4 = 0;
    }
  }

  return a4;
}

- (SecureBackupDaemon)initWithOperationsLogger:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SecureBackupDaemon;
  id v6 = [(SecureBackupDaemon *)&v24 init];
  unint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_operationsLogger, a3);
    id v8 = +[NSFileManager defaultManager];
    id v23 = 0;
    id v9 = [v8 URLForDirectory:14 inDomain:1 appropriateForURL:0 create:0 error:&v23];
    id v10 = v23;
    id v11 = [v9 URLByAppendingPathComponent:@"com.apple.sbd" isDirectory:1];
    [(SecureBackupDaemon *)v7 setCacheDirURL:v11];

    id v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.sbd.connectionQueue", v12);
    connectionQueue = v7->_connectionQueue;
    v7->_connectionQueue = (OS_dispatch_queue *)v13;

    id v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.sbd.backupQueue", v15);
    backupQueue = v7->_backupQueue;
    v7->_backupQueue = (OS_dispatch_queue *)v16;

    uint64_t v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.sbd.kvsQueue", v18);
    kvsQueue = v7->_kvsQueue;
    v7->_kvsQueue = (OS_dispatch_queue *)v19;

    *(void *)&v7->_cachedPassphraseFD = -1;
    id v22 = v7;
    os_state_add_handler();
    [(SecureBackupDaemon *)v22 setupNotifyEvents];
  }
  return v7;
}

- (void)setupNotifyEvents
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  [(SecureBackupDaemon *)self setHandledNotifications:v3];

  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  [(SecureBackupDaemon *)self setIgnoredNotifications:v4];

  id v5 = +[UMUserManager sharedManager];
  unsigned int v6 = [v5 isMultiUser];

  if (v6) {
    [(SecureBackupDaemon *)self registerForNotifyEvent:@"com.apple.security.keychainchanged"];
  }
  unint64_t v7 = [(SecureBackupDaemon *)self connectionQueue];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000165F8;
  handler[3] = &unk_100071308;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v7, handler);
}

- (id)copyKVSState
{
  id v3 = [(SecureBackupDaemon *)self kvs];
  if (v3)
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    id v5 = sub_100004428();
    [v4 setObject:v5 forKeyedSubscript:@"uuid"];

    unsigned int v6 = [v3 objectForKey:@"com.apple.securebackup.enabled"];
    [v4 setObject:v6 forKeyedSubscript:@"backup enabled"];

    unint64_t v7 = [v3 objectForKey:@"com.apple.icdpbackup.enabled"];
    [v4 setObject:v7 forKeyedSubscript:@"iCDP backup enabled"];

    id v8 = [v3 objectForKey:@"BackupUsesEscrow"];
    [v4 setObject:v8 forKeyedSubscript:@"uses escrow"];

    id v9 = [v3 objectForKey:kSecureBackupMetadataKey];
    [v4 setObject:v9 forKeyedSubscript:@"metadata"];

    id v10 = [v3 dictionaryForKey:@"com.apple.securebackup.record"];
    id v11 = v10;
    if (v10)
    {
      id v12 = [v10 objectForKeyedSubscript:kSecureBackupTimestampKey];
      [v4 setObject:v12 forKeyedSubscript:@"backup timestamp"];

      dispatch_queue_t v13 = [v11 objectForKeyedSubscript:kSecureBackupKeybagDigestKey];
      [v4 setObject:v13 forKeyedSubscript:@"keybag digest"];
    }
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100016920;
    v19[3] = &unk_100071330;
    id v20 = objc_alloc_init((Class)NSMutableDictionary);
    id v14 = v4;
    id v21 = v14;
    id v15 = v20;
    [(SecureBackupDaemon *)self _enumerateICDPBackupsUsingBlock:v19];
    dispatch_queue_t v16 = v21;
    id v17 = v14;
  }
  else
  {
    id v17 = &__NSDictionary0__struct;
  }

  return v17;
}

- (os_state_data_s)_stateCapture
{
  id v3 = CloudServicesLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "capturing KVS state", buf, 2u);
  }

  id v5 = [(SecureBackupDaemon *)self copyKVSState];
  if (v5)
  {
    id v14 = 0;
    unsigned int v6 = +[NSPropertyListSerialization dataWithPropertyList:v5 format:200 options:0 error:&v14];
    unint64_t v7 = v14;
    if (v6)
    {
      id v8 = [v6 length];
      id v9 = CloudServicesLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        id v16 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "captured %zd bytes of KVS data", buf, 0xCu);
      }

      id v10 = (os_state_data_s *)malloc_type_calloc(1uLL, (size_t)v8 + 200, 0x64FC0773uLL);
      if (v10)
      {
        id v11 = v10;
        v10->var0 = 1;
        v10->var1.var1 = v8;
        __strlcpy_chk();
        memcpy(v11->var4, [v6 bytes], (size_t)v8);
LABEL_17:

        goto LABEL_18;
      }
      id v12 = CloudServicesLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10004A84C();
      }
    }
    else
    {
      id v12 = CloudServicesLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10004A7E4();
      }
    }

    id v11 = 0;
    goto LABEL_17;
  }
  unint64_t v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_10004A7B0();
  }
  id v11 = 0;
LABEL_18:

  return v11;
}

- (NSURL)cachedKeychainURL
{
  id v3 = [(SecureBackupDaemon *)self cacheDirURL];

  if (v3)
  {
    id v4 = sub_100004428();
    if (v4)
    {
      id v5 = [(SecureBackupDaemon *)self cacheDirURL];
      unsigned int v6 = [v5 URLByAppendingPathComponent:v4];
      unint64_t v7 = [v6 URLByAppendingPathExtension:@"plist"];
    }
    else
    {
      id v8 = CloudServicesLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "no uuid, could not create cache file URL", v10, 2u);
      }

      unint64_t v7 = 0;
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return (NSURL *)v7;
}

- (NSURL)cachedManifestURL
{
  id v3 = [(SecureBackupDaemon *)self cacheDirURL];

  if (v3)
  {
    id v4 = sub_100004428();
    if (v4)
    {
      id v5 = [(SecureBackupDaemon *)self cacheDirURL];
      unsigned int v6 = [v5 URLByAppendingPathComponent:v4];
      unint64_t v7 = [v6 URLByAppendingPathExtension:@"manifest"];
    }
    else
    {
      id v8 = CloudServicesLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "no uuid, could not create manifest file URL", v10, 2u);
      }

      unint64_t v7 = 0;
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return (NSURL *)v7;
}

- (BOOL)forceICDP
{
  return CFPreferencesGetAppBooleanValue(@"ForceICDP", SECURE_BACKUP_SERVICE_NAME, 0) != 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 valueForEntitlement:@"application-identifier"];
  id v9 = CloudServicesLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v10 = [v7 processIdentifier];
    id v11 = [v6 serviceName];
    v24[0] = 67109634;
    v24[1] = v10;
    __int16 v25 = 2112;
    char v26 = v8;
    __int16 v27 = 2112;
    v28 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "sbd listener begin from pid %d (%@) [%@]", (uint8_t *)v24, 0x1Cu);
  }
  id v12 = [v7 valueForEntitlement:@"com.apple.securebackupd.access"];

  if (!v12)
  {
    uint64_t v18 = CloudServicesLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10004A880(v7);
    }
    goto LABEL_13;
  }
  dispatch_queue_t v13 = [v6 serviceName];
  unsigned int v14 = [v13 isEqualToString:SECURE_BACKUP_SERVICE_NAME];

  if (!v14)
  {
    dispatch_queue_t v19 = [v6 serviceName];
    unsigned int v20 = [v19 isEqualToString:SECURE_BACKUP_CONCURRENT_SERVICE_NAME];

    if (v20)
    {
      id v21 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SecureBackupConcurrentProtocol];
      id v16 = SecureBackupSetupConcurrentProtocol();

      [v7 setExportedInterface:v16];
      [v7 setExportedObject:self];
      goto LABEL_10;
    }
    uint64_t v18 = CloudServicesLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10004A90C(v7, v6);
    }
LABEL_13:

    BOOL v22 = 0;
    goto LABEL_14;
  }
  id v15 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SecureBackupProtocol];
  id v16 = SecureBackupSetupProtocol();

  [v7 setExportedInterface:v16];
  [v7 setExportedObject:self];
  id v17 = [(SecureBackupDaemon *)self connectionQueue];
  [v7 _setQueue:v17];

LABEL_10:
  [v7 resume];
  BOOL v22 = 1;
LABEL_14:

  return v22;
}

- (void)recordNotification:(id)a3 handled:(BOOL)a4
{
  id v6 = a3;
  if (a4) {
    [(SecureBackupDaemon *)self handledNotifications];
  }
  else {
  id v9 = [(SecureBackupDaemon *)self ignoredNotifications];
  }
  id v7 = [v9 objectForKeyedSubscript:v6];
  id v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v7 integerValue] + 1);
  [v9 setObject:v8 forKeyedSubscript:v6];
}

- (void)handleNotification:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 isEqualToString:@"com.apple.security.itembackup"];
  unsigned int v6 = [v4 isEqualToString:@"com.apple.security.keychainchanged"];
  id v7 = [(SecureBackupDaemon *)self circleChangedNotification];
  unsigned int v8 = [v4 isEqualToString:v7];

  if ((v5 & 1) == 0 && !v6)
  {
    if (!v8 || [(SecureBackupDaemon *)self needInitialBackup])
    {
      [(SecureBackupDaemon *)self notificationOccurred:v4];
      goto LABEL_16;
    }
    id v9 = CloudServicesLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v18 = 0;
      unsigned int v10 = "ignoring circle changed notification";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  if ([(SecureBackupDaemon *)self pendingNotification])
  {
    id v9 = CloudServicesLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v18 = 0;
      unsigned int v10 = "notification already pending";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, v18, 2u);
    }
LABEL_15:

    [(SecureBackupDaemon *)self recordNotification:v4 handled:0];
    goto LABEL_16;
  }
  *(void *)uint64_t v18 = 0;
  dispatch_queue_t v19 = v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_100011AB0;
  BOOL v22 = sub_100011AC0;
  id v23 = (id)0xAAAAAAAAAAAAAAAALL;
  id v23 = (id)os_transaction_create();
  [(SecureBackupDaemon *)self setPendingNotification:1];
  id v11 = CloudServicesLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "calling dispatch_after() to enqueue notification", buf, 2u);
  }

  dispatch_time_t v12 = dispatch_time(0, 5000000000);
  dispatch_queue_t v13 = [(SecureBackupDaemon *)self connectionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000175AC;
  block[3] = &unk_100071358;
  block[4] = self;
  id v15 = v4;
  id v16 = v18;
  dispatch_after(v12, v13, block);

  _Block_object_dispose(v18, 8);
LABEL_16:
}

- (void)notificationOccurred:(id)a3
{
  id v4 = a3;
  [(SecureBackupDaemon *)self recordNotification:v4 handled:1];
  unsigned __int8 v5 = CloudServicesLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "got notification: %@", buf, 0xCu);
  }

  if ([v4 isEqualToString:@"com.apple.security.itembackup"])
  {
    [(SecureBackupDaemon *)self _backupKeychain];
  }
  else if ([v4 isEqualToString:@"com.apple.security.keychainchanged"])
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    id v7 = CloudServicesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Backing up EMCS in response to keychain changed", buf, 2u);
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000178EC;
    v13[3] = &unk_100071380;
    dispatch_semaphore_t v14 = v6;
    unsigned int v8 = v6;
    [(SecureBackupDaemon *)self backupWithInfo:0 reply:v13];
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    id v9 = [(SecureBackupDaemon *)self circleChangedNotification];
    unsigned int v10 = [v4 isEqualToString:v9];

    if (v10)
    {
      id v11 = CloudServicesLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Performing initial backup", buf, 2u);
      }

      [(SecureBackupDaemon *)self _setAutobackupEnabled];
    }
    else if ([v4 isEqualToString:@"com.apple.sbd.kvstorechange"])
    {
      dispatch_time_t v12 = CloudServicesLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v16 = v4;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "handling notification %@", buf, 0xCu);
      }

      [(SecureBackupDaemon *)self doSynchronize];
    }
  }
}

- (id)massageIncomingMetadataFromInfo:(id)a3
{
  uint64_t v3 = kSecureBackupClientMetadataKey;
  id v4 = a3;
  unsigned __int8 v5 = [v4 objectForKeyedSubscript:v3];
  id v6 = [v5 mutableCopy];

  id v7 = [v4 objectForKeyedSubscript:kSecureBackupTimestampKey];

  unsigned int v8 = [v6 objectForKeyedSubscript:kSecureBackupMetadataTimestampKey];
  uint64_t v9 = kSecureBackupUsesComplexPassphraseKey;
  unsigned int v10 = [v6 objectForKeyedSubscript:kSecureBackupUsesComplexPassphraseKey];
  unsigned __int8 v11 = [v10 isEqual:&__kCFBooleanTrue];

  uint64_t v12 = kSecureBackupUsesNumericPassphraseKey;
  dispatch_queue_t v13 = [v6 objectForKeyedSubscript:kSecureBackupUsesNumericPassphraseKey];
  dispatch_semaphore_t v14 = v13;
  if ((v11 & 1) == 0)
  {
    [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:v12];
    uint64_t v20 = kSecureBackupNumericPassphraseLengthKey;
    uint64_t v18 = &off_100076030;
LABEL_11:
    dispatch_queue_t v19 = v6;
    goto LABEL_12;
  }
  if (!v13 || ![v13 BOOLValue])
  {
    [v6 setObject:&__kCFBooleanFalse forKeyedSubscript:v12];
    uint64_t v20 = kSecureBackupNumericPassphraseLengthKey;
    uint64_t v18 = &off_100076048;
    goto LABEL_11;
  }
  uint64_t v15 = kSecureBackupNumericPassphraseLengthKey;
  id v16 = [v6 objectForKeyedSubscript:kSecureBackupNumericPassphraseLengthKey];
  unsigned int v17 = [v16 intValue];

  if (v17 == 6) {
    goto LABEL_7;
  }
  if (v17 == 4)
  {
    [v6 setObject:&__kCFBooleanFalse forKeyedSubscript:v12];
    [v6 setObject:&off_100076048 forKeyedSubscript:v15];
LABEL_7:
    if ([v8 isEqualToString:v7])
    {
      uint64_t v18 = (_UNKNOWN **)&__kCFBooleanFalse;
      dispatch_queue_t v19 = v6;
      uint64_t v20 = v9;
      goto LABEL_12;
    }
  }
  [v6 setObject:&__kCFBooleanFalse forKeyedSubscript:v12];
  uint64_t v18 = &off_100076048;
  dispatch_queue_t v19 = v6;
  uint64_t v20 = v15;
LABEL_12:
  [v19 setObject:v18 forKeyedSubscript:v20];

  return v6;
}

- (id)filteriCDPRecords:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableSet);
  id v6 = [(SecureBackupDaemon *)self kvs];
  id v7 = [(SecureBackupDaemon *)self _getICDPBackupFromKVS:v6 forView:@"iCloudIdentity"];

  id v36 = v5;
  if (!v7)
  {
    uint64_t v9 = CloudServicesLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10004A9B8();
    }
    goto LABEL_27;
  }
  unsigned int v8 = [v7 objectForKeyedSubscript:@"com.apple.securebackup.keychain"];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"keybag"];

  if (v9)
  {
    unsigned int v10 = +[CloudServicesAnalytics logger];
    [v10 logSuccessForEvent:CloudServicesAnalyticsiCDPKeybag];

    v37 = [v9 backupKeyDigests];
    unsigned __int8 v11 = CloudServicesLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v9 peerIDs];
      *(_DWORD *)long long buf = 138412290;
      __int16 v43 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "iCloudIdentity backup keybag peers: %@", buf, 0xCu);
    }
    dispatch_queue_t v13 = CloudServicesLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      __int16 v43 = v37;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "keybag contains key digests %@", buf, 0xCu);
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v14 = v4;
    id v15 = [v14 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v15)
    {
      id v16 = v15;
      unsigned __int8 v33 = v9;
      int v34 = v7;
      id v35 = v4;
      uint64_t v17 = *(void *)v39;
      uint64_t v18 = kSecureBackupKeybagDigestKey;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v39 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v20 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          id v21 = [v20 objectForKeyedSubscript:@"metadata"];
          BOOL v22 = [v21 objectForKeyedSubscript:v18];
          if (v22 && [v37 containsObject:v22])
          {
            [v5 addObject:v20];
          }
          else
          {
            id v23 = CloudServicesLog();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              objc_super v24 = [v20 objectForKeyedSubscript:@"recordID"];
              __int16 v25 = [v22 hexString];
              *(_DWORD *)long long buf = 138412546;
              __int16 v43 = v24;
              __int16 v44 = 2112;
              v45 = v25;
              _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "record id %@ cannot recover iCloudIdentity backup! (backup key digest: %@)", buf, 0x16u);

              id v5 = v36;
            }
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v16);

      id v7 = v34;
      id v4 = v35;
      uint64_t v9 = v33;
    }
    else
    {
    }
LABEL_27:

    if ([v5 count])
    {
      id v30 = +[CloudServicesAnalytics logger];
      [v30 logSuccessForEvent:CloudServicesiCloudIdentity];
    }
    else
    {
      id v30 = +[CloudServicesError errorWithCode:212 error:0 format:@"iCloudIdentity not found in backup"];
      id v31 = +[CloudServicesAnalytics logger];
      [v31 logUnrecoverableError:v30 forEvent:CloudServicesiCloudIdentity withAttributes:0];

      id v5 = v36;
    }

    uint64_t v29 = [v5 allObjects];
    goto LABEL_31;
  }
  char v26 = CloudServicesLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    sub_10004A9EC();
  }

  __int16 v27 = +[CloudServicesError errorWithCode:211 error:0 format:@"no keybag found in iCloudIdentity backup"];
  v28 = +[CloudServicesAnalytics logger];
  [v28 logUnrecoverableError:v27 forEvent:CloudServicesAnalyticsiCDPKeybag withAttributes:0];

  uint64_t v29 = &__NSArray0__struct;
LABEL_31:

  return v29;
}

- (BOOL)hasRecoveryKeyInKVS:(id)a3 error:(id *)a4
{
  id v6 = [(SecureBackupDaemon *)self _getICDPBackupFromKVS:a3 forView:@"iCloudIdentity"];
  id v7 = v6;
  if (!v6)
  {
    id v14 = CloudServicesLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10004AA54();
    }

    id v15 = +[CloudServicesError errorWithCode:204 error:0 format:@"could not get iCloudIdentity backup!"];
    uint64_t v9 = v15;
    if (a4)
    {
      LOBYTE(v11) = 0;
      *a4 = v15;
      goto LABEL_16;
    }
LABEL_15:
    LOBYTE(v11) = 0;
    goto LABEL_16;
  }
  unsigned int v8 = [v6 objectForKeyedSubscript:@"com.apple.securebackup.keychain"];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"keybag"];

  if (!v9)
  {
    id v16 = CloudServicesLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10004A9EC();
    }

    uint64_t v17 = +[CloudServicesError errorWithCode:211 error:0 format:@"no keybag found in for recovery key"];
    uint64_t v9 = v17;
    if (a4) {
      *a4 = v17;
    }
    uint64_t v18 = +[CloudServicesAnalytics logger];
    [v18 logUnrecoverableError:v9 forEvent:CloudServicesAnalyticsiCDPKeybagRecoveryKey withAttributes:0];

    goto LABEL_15;
  }
  unsigned int v10 = +[CloudServicesAnalytics logger];
  [v10 logSuccessForEvent:CloudServicesAnalyticsiCDPKeybagRecoveryKey];

  BOOL v11 = [(SecureBackupDaemon *)self backupSliceKeybagHasRecoveryKey:v9];
  uint64_t v12 = CloudServicesLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v13 = [v9 peerIDs];
    int v20 = 138412546;
    id v21 = v13;
    __int16 v22 = 1024;
    BOOL v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "iCloudIdentity backup keybag peers: %@ -- returning %{BOOL}d", (uint8_t *)&v20, 0x12u);
  }
LABEL_16:

  return v11;
}

- (id)_recordIDFromLabel:(id)a3 withPrefix:(id)a4 suffix:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = (char *)[a4 length];
  id v10 = [v8 length];

  unint64_t v11 = (unint64_t)v10 + (void)(v9 + 1);
  if ((unint64_t)[v7 length] > v11
    && [v7 characterAtIndex:v9] == 46)
  {
    uint64_t v12 = objc_msgSend(v7, "substringWithRange:", v9 + 1, (char *)objc_msgSend(v7, "length") - v11);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)_getAccountInfoWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = CloudServicesLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v22 = "-[SecureBackupDaemon _getAccountInfoWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  uint64_t v9 = [EscrowService alloc];
  id v10 = [(SecureBackupDaemon *)self operationsLogger];
  unint64_t v11 = [(EscrowService *)v9 initWithOperationsLogger:v10];

  uint64_t v12 = CloudServicesLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "calling getAccountInfoWithRequest: in daemon", buf, 2u);
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100018608;
  v16[3] = &unk_1000713D0;
  id v17 = v6;
  uint64_t v18 = self;
  dispatch_queue_t v19 = v11;
  id v20 = v7;
  dispatch_queue_t v13 = v11;
  id v14 = v6;
  id v15 = v7;
  [(EscrowService *)v13 getAccountInfoWithRequest:v14 completionBlock:v16];
}

- (void)_fetchStingrayAccountStatusInDaemon:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = CloudServicesLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v17 = "-[SecureBackupDaemon _fetchStingrayAccountStatusInDaemon:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  uint64_t v9 = [EscrowService alloc];
  id v10 = [(SecureBackupDaemon *)self operationsLogger];
  unint64_t v11 = [(EscrowService *)v9 initWithOperationsLogger:v10];

  uint64_t v12 = CloudServicesLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "calling getAccountInfoWithRequest: in daemon", buf, 2u);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001A5E8;
  v14[3] = &unk_1000713F8;
  id v15 = v6;
  id v13 = v6;
  [(EscrowService *)v11 getAccountInfoWithRequest:v7 completionBlock:v14];
}

- (id)tagStaleBottleRecords:(id)a3 suggestedBottles:(id)a4
{
  id v5 = a4;
  +[NSMutableArray arrayWithArray:a3];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v28;
    uint64_t v9 = kEscrowServiceRecordMetadataKey;
    uint64_t v26 = kSecureBackupBottleIDKey;
    uint64_t v23 = kSecureBackupRecordStatusInvalid;
    uint64_t v22 = kSecureBackupBottleValidityKey;
    uint64_t v24 = kEscrowServiceRecordMetadataKey;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(obj);
        }
        unint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v12 = [v11 objectForKeyedSubscript:v9];
        id v13 = +[NSMutableDictionary dictionaryWithDictionary:v12];

        id v14 = [v13 objectForKeyedSubscript:v26];
        if (v14)
        {
          id v15 = [v5 preferredBottleIDs];
          if ([v15 containsObject:v14])
          {
          }
          else
          {
            [v5 partialRecoveryBottleIDs];
            id v16 = v7;
            uint64_t v17 = v8;
            v19 = id v18 = v5;
            unsigned __int8 v20 = [v19 containsObject:v14];

            id v5 = v18;
            uint64_t v8 = v17;
            id v7 = v16;
            uint64_t v9 = v24;

            if ((v20 & 1) == 0) {
              [v13 setObject:v23 forKeyedSubscript:v22];
            }
          }
        }
        [v11 setObject:v13 forKeyedSubscript:v9];
      }
      id v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v7);
  }

  return obj;
}

- (id)sortRecordsByBottleID:(id)a3
{
  id v4 = a3;
  id v5 = CloudServicesLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    *(_DWORD *)uint64_t v88 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sorting %d records", buf, 8u);
  }

  id v6 = objc_alloc_init((Class)OTConfigurationContext);
  id v7 = sub_100010238();
  [v6 setAltDSID:v7];

  [v6 setContext:OTDefaultContext];
  id v85 = 0;
  uint64_t v8 = +[OTClique findOptimalBottleIDsWithContextData:v6 error:&v85];
  id v9 = v85;
  id v10 = v9;
  if (!v8 || v9)
  {
    v65 = CloudServicesLog();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
      sub_10004AABC();
    }
    goto LABEL_47;
  }
  uint64_t v11 = [v8 preferredBottleIDs];
  if (!v11
    || (uint64_t v12 = (void *)v11,
        [v8 preferredBottleIDs],
        id v13 = objc_claimAutoreleasedReturnValue(),
        id v14 = [v13 count],
        v13,
        v12,
        !v14))
  {
    uint64_t v15 = [v8 partialRecoveryBottleIDs];
    if (!v15
      || (id v16 = (void *)v15,
          [v8 partialRecoveryBottleIDs],
          uint64_t v17 = objc_claimAutoreleasedReturnValue(),
          id v18 = [v17 count],
          v17,
          v16,
          !v18))
    {
      v65 = CloudServicesLog();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
        sub_10004AB24();
      }
LABEL_47:

      v66 = [(SecureBackupDaemon *)self tagStaleBottleRecords:v4 suggestedBottles:v8];
      goto LABEL_52;
    }
  }
  id v70 = v6;
  dispatch_queue_t v19 = CloudServicesLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v20 = [v8 preferredBottleIDs];
    unsigned int v21 = [v20 count];
    uint64_t v22 = [v8 partialRecoveryBottleIDs];
    unsigned int v23 = [v22 count];
    *(_DWORD *)long long buf = 67109376;
    *(_DWORD *)uint64_t v88 = v21;
    *(_WORD *)&v88[4] = 1024;
    *(_DWORD *)&v88[6] = v23;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Returned %d preferred bottles, %d partial recovery bottles", buf, 0xEu);
  }
  id v24 = objc_alloc((Class)NSMutableArray);
  __int16 v25 = [v8 preferredBottleIDs];
  id v26 = objc_msgSend(v24, "initWithCapacity:", objc_msgSend(v25, "count"));

  id v27 = objc_alloc((Class)NSMutableArray);
  long long v28 = [v8 partialRecoveryBottleIDs];
  id v29 = objc_msgSend(v27, "initWithCapacity:", objc_msgSend(v28, "count"));

  uint64_t v72 = +[NSMutableArray array];
  long long v30 = [v8 preferredBottleIDs];
  id v31 = [v30 count];

  if (v31)
  {
    unint64_t v32 = 0;
    do
    {
      [v26 setObject:&__NSDictionary0__struct atIndexedSubscript:v32++];
      unsigned __int8 v33 = [v8 preferredBottleIDs];
      id v34 = [v33 count];
    }
    while (v32 < (unint64_t)v34);
  }
  uint64_t v74 = v26;
  v69 = self;
  id v35 = [v8 partialRecoveryBottleIDs];
  id v36 = [v35 count];

  if (v36)
  {
    unint64_t v37 = 0;
    do
    {
      [v29 setObject:&__NSDictionary0__struct atIndexedSubscript:v37++];
      long long v38 = [v8 partialRecoveryBottleIDs];
      id v39 = [v38 count];
    }
    while (v37 < (unint64_t)v39);
  }
  v73 = v29;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v71 = v4;
  id v40 = v4;
  id v80 = [v40 countByEnumeratingWithState:&v81 objects:v86 count:16];
  if (v80)
  {
    uint64_t v79 = *(void *)v82;
    uint64_t v41 = kEscrowServiceRecordMetadataKey;
    uint64_t v78 = kSecureBackupBottleIDKey;
    uint64_t v76 = kSecureBackupRecordStatusValid;
    uint64_t v75 = kSecureBackupBottleValidityKey;
    id obj = v40;
    do
    {
      for (i = 0; i != v80; i = (char *)i + 1)
      {
        if (*(void *)v82 != v79) {
          objc_enumerationMutation(obj);
        }
        __int16 v43 = *(void **)(*((void *)&v81 + 1) + 8 * i);
        __int16 v44 = +[NSMutableDictionary dictionaryWithDictionary:v43];
        v45 = [v43 objectForKeyedSubscript:@"recordID"];
        uint64_t v46 = [v44 objectForKeyedSubscript:v41];
        v47 = +[NSMutableDictionary dictionaryWithDictionary:v46];

        v48 = [v47 objectForKeyedSubscript:v78];
        if (!v48)
        {
          uint64_t v54 = CloudServicesLog();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)uint64_t v88 = v45;
            v56 = v54;
            v57 = "Record %@ does not have a bottle, ignoring it";
LABEL_29:
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, v57, buf, 0xCu);
          }
LABEL_30:

          goto LABEL_37;
        }
        v49 = [v8 preferredBottleIDs];
        id v50 = [v49 indexOfObject:v48];

        v51 = v8;
        uint64_t v52 = [v8 partialRecoveryBottleIDs];
        id v53 = [v52 indexOfObject:v48];

        if (v50 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v54 = CloudServicesLog();
          BOOL v55 = os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT);
          if (v53 == (id)0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v8 = v51;
            if (v55)
            {
              *(_DWORD *)long long buf = 138412290;
              *(void *)uint64_t v88 = v45;
              v56 = v54;
              v57 = "Record %@ has an unknown bottle";
              goto LABEL_29;
            }
            goto LABEL_30;
          }
          uint64_t v8 = v51;
          if (v55)
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)uint64_t v88 = v45;
            _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Record %@ in partially preferred bottle list, adding", buf, 0xCu);
          }

          [v47 setObject:v76 forKeyedSubscript:v75];
          [v44 setObject:v47 forKeyedSubscript:v41];
          [v73 setObject:v44 atIndexedSubscript:v53];
        }
        else
        {
          v58 = CloudServicesLog();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)uint64_t v88 = v45;
            _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Record %@ in preferred bottle list, adding", buf, 0xCu);
          }

          [v47 setObject:v76 forKeyedSubscript:v75];
          [v44 setObject:v47 forKeyedSubscript:v41];
          [v74 setObject:v44 atIndexedSubscript:v50];
          uint64_t v8 = v51;
        }
LABEL_37:
      }
      id v40 = obj;
      id v80 = [obj countByEnumeratingWithState:&v81 objects:v86 count:16];
    }
    while (v80);
  }

  [v72 addObjectsFromArray:v74];
  [v72 addObjectsFromArray:v73];
  [v72 removeObject:&__NSDictionary0__struct];
  id v59 = [v72 count];
  id v60 = CloudServicesLog();
  id v61 = v40;
  v62 = v60;
  if (v59)
  {
    id v10 = 0;
    id v6 = v70;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v63 = [v72 count];
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)uint64_t v88 = v63;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Returning %d sorted records", buf, 8u);
    }

    id v64 = v72;
  }
  else
  {
    id v67 = v61;
    id v10 = 0;
    id v6 = v70;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      sub_10004AB58(v67, v62);
    }

    id v64 = [(SecureBackupDaemon *)v69 tagStaleBottleRecords:v67 suggestedBottles:v8];
  }
  v66 = v64;
  id v4 = v71;

LABEL_52:

  return v66;
}

- (void)doSynchronize
{
}

- (void)synchronizeKVSWithHandler:(id)a3
{
  id v4 = a3;
  if (qword_100081038 != -1) {
    dispatch_once(&qword_100081038, &stru_100071458);
  }
  id v5 = [(SecureBackupDaemon *)self kvs];
  if (v5)
  {
    kdebug_trace();
    id v6 = _CloudServicesSignpostLogSystem();
    os_signpost_id_t v7 = _CloudServicesSignpostCreate(v6);
    uint64_t v9 = v8;

    id v10 = _CloudServicesSignpostLogSystem();
    uint64_t v11 = v10;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "KVSSynchronize", " enableTelemetry=YES ", buf, 2u);
    }

    uint64_t v12 = _CloudServicesSignpostLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      os_signpost_id_t v23 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: KVSSynchronize  enableTelemetry=YES ", buf, 0xCu);
    }

    id v13 = CloudServicesLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "waiting for sync group", buf, 2u);
    }

    dispatch_group_wait((dispatch_group_t)qword_100081040, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_group_enter((dispatch_group_t)qword_100081040);
    id v14 = CloudServicesLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "calling synchronizeWithCompletionHandler", buf, 2u);
    }

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10001BB58;
    v17[3] = &unk_1000714D0;
    os_signpost_id_t v20 = v7;
    uint64_t v21 = v9;
    void v17[4] = self;
    id v19 = v4;
    id v18 = v5;
    [v18 synchronizeWithCompletionHandler:v17];
  }
  else
  {
    NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
    CFStringRef v25 = @"KVS not available";
    uint64_t v15 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v16 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:32 userInfo:v15];
    (*((void (**)(id, void *))v4 + 2))(v4, v16);
  }
}

- (void)getAccountInfoWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)os_transaction_create();
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10001C190;
  v20[3] = &unk_1000714F8;
  id v9 = v7;
  id v22 = v9;
  id v10 = v8;
  id v21 = v10;
  uint64_t v11 = objc_retainBlock(v20);
  uint64_t v12 = [(SecureBackupDaemon *)self connectionQueue];
  [v6 setQueue:v12];

  id v13 = [v6 error];

  if (v13)
  {
    id v14 = objc_alloc_init((Class)NSMutableDictionary);
    [v14 setObject:@"error decoding request properties" forKeyedSubscript:NSLocalizedDescriptionKey];
    uint64_t v15 = [v6 error];
    [v14 setObject:v15 forKeyedSubscript:NSUnderlyingErrorKey];

    id v16 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:5 userInfo:v14];
    ((void (*)(void *, void, void *))v11[2])(v11, 0, v16);
  }
  else if ([v6 synchronize] && OctagonPlatformSupportsSOS())
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10001C1A0;
    v17[3] = &unk_100071520;
    id v19 = v11;
    void v17[4] = self;
    id v18 = v6;
    [(SecureBackupDaemon *)self synchronizeKVSWithHandler:v17];
  }
  else
  {
    [(SecureBackupDaemon *)self _getAccountInfoWithRequest:v6 reply:v11];
  }
}

- (void)fetchStingrayAccountStatusInDaemon:(id)a3 reply:(id)a4
{
  id v13 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = (void *)os_transaction_create();
  uint64_t v8 = [(SecureBackupDaemon *)self connectionQueue];
  [v13 setQueue:v8];

  id v9 = [v13 error];

  if (v9)
  {
    id v10 = objc_alloc_init((Class)NSMutableDictionary);
    [v10 setObject:@"error decoding request properties" forKeyedSubscript:NSLocalizedDescriptionKey];
    uint64_t v11 = [v13 error];
    [v10 setObject:v11 forKeyedSubscript:NSUnderlyingErrorKey];

    uint64_t v12 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:5 userInfo:v10];
    v6[2](v6, 0, v12);
  }
  else
  {
    [(SecureBackupDaemon *)self _fetchStingrayAccountStatusInDaemon:v13 reply:v6];
  }
}

- (id)massageOutgoingMetadataFromRequest:(id)a3
{
  id v3 = a3;
  id v4 = [v3 metadata];
  id v5 = [v4 mutableCopy];

  if (v5
    && ([v3 stingray] & 1) == 0
    && ([v3 usesRandomPassphrase] & 1) == 0)
  {
    uint64_t v6 = kSecureBackupUsesComplexPassphraseKey;
    id v7 = [v5 objectForKeyedSubscript:kSecureBackupUsesComplexPassphraseKey];
    unsigned int v8 = [v7 isEqual:&__kCFBooleanTrue];

    if (v8)
    {
      [v5 setObject:&__kCFBooleanFalse forKeyedSubscript:kSecureBackupUsesNumericPassphraseKey];
      uint64_t v9 = kSecureBackupNumericPassphraseLengthKey;
      id v10 = &off_100076048;
      uint64_t v11 = v5;
LABEL_9:
      [v11 setObject:v10 forKeyedSubscript:v9];
      goto LABEL_13;
    }
    uint64_t v12 = [v5 objectForKeyedSubscript:kSecureBackupNumericPassphraseLengthKey];
    unsigned int v13 = [v12 intValue];

    if (v13 == 4) {
      goto LABEL_13;
    }
    if (v13 == 6)
    {
      id v10 = (_UNKNOWN **)&__kCFBooleanTrue;
      uint64_t v11 = v5;
      uint64_t v9 = v6;
      goto LABEL_9;
    }
    id v14 = CloudServicesLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10004ACE8();
    }
  }
LABEL_13:

  return v5;
}

- (void)_stashRecoveryDataWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  unsigned int v8 = CloudServicesLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[SecureBackupDaemon _stashRecoveryDataWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  uint64_t v9 = [(SecureBackupDaemon *)self connectionQueue];
  [v6 setQueue:v9];

  id v10 = [v6 error];

  if (!v10)
  {
    unsigned int v15 = [v6 emcsMode];
    id v16 = CloudServicesLog();
    uint64_t v17 = v16;
    if (!v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10004AF80();
      }

      NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
      CFStringRef v49 = @"stashRecoveryDataWithRequest called without EMCS mode set?";
      id v11 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
      uint64_t v13 = kSecureBackupErrorDomain;
      uint64_t v14 = 4;
      goto LABEL_16;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "EMCS mode", buf, 2u);
    }

    id v18 = objc_alloc_init((Class)NSMutableDictionary);
    *(void *)long long buf = 0;
    uint64_t v19 = [v6 emcsDict];
    uint64_t v20 = [v6 emcsCred];
    if (!(v19 | v20))
    {
      id v29 = CloudServicesLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_10004AEF0(v29);
      }

      NSErrorUserInfoKey v56 = NSLocalizedDescriptionKey;
      id v30 = [objc_alloc((Class)NSString) initWithFormat:@"Missing parameter for SecEMCSCreateDerivedKey(): dict: %@nil, user credential: %@nil", &stru_100072CF8, &stru_100072CF8];
      id v57 = v30;
      uint64_t v19 = +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];

      id v11 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:4 userInfo:v19];
      v7[2](v7, v11);
      goto LABEL_55;
    }
    if (v19)
    {
      uint64_t v21 = SecEMCSCreateDerivedEMCSKey();
      if (v21)
      {
        uint64_t v22 = v21;
        [v18 setObject:v21 forKeyedSubscript:@"stashedEMCSKey"];
        uint64_t v23 = kSecureBackupTimestampKey;
        NSErrorUserInfoKey v24 = [(id)v19 objectForKeyedSubscript:kSecureBackupTimestampKey];
        [v18 setObject:v24 forKeyedSubscript:v23];

        CFStringRef v25 = [(id)v19 objectForKeyedSubscript:@"digest"];
        if (v25)
        {
          CFStringRef v26 = @"digest";
          id v27 = v18;
          long long v28 = v25;
        }
        else
        {
          CFStringRef v26 = @"stashedEMCSDict";
          id v27 = v18;
          long long v28 = (void *)v19;
        }
        [v27 setObject:v28 forKeyedSubscript:v26];
        id v32 = (id)v19;
        uint64_t v19 = v22;
        goto LABEL_32;
      }
      id v35 = CloudServicesLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_10004AD50();
      }

      id v32 = objc_alloc_init((Class)NSMutableDictionary);
      [v32 setObject:@"SecEMCSCreateDerivedKey() failed" forKeyedSubscript:NSLocalizedDescriptionKey];
    }
    else
    {
      id v31 = CloudServicesLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v47 = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "no dict, calling SecEMCSCreateNewiDMSKey", v47, 2u);
      }

      v46[1] = 0;
      SecEMCSCreateNewiDMSKey();
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      id v33 = 0;
      uint64_t v19 = (uint64_t)v33;
      if (v32)
      {
        if (!v33)
        {
          __int16 v43 = CloudServicesLog();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
            sub_10004AE88();
          }

          NSErrorUserInfoKey v52 = NSLocalizedDescriptionKey;
          CFStringRef v53 = @"SecEMCSCreateNewiDMSKey() returned nil EMCS key";
          __int16 v44 = +[NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
          id v11 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:v44];
          v7[2](v7, v11);

          uint64_t v19 = (uint64_t)v32;
          goto LABEL_55;
        }
        uint64_t v34 = [(SecureBackupDaemon *)self _createBackupKeybagWithPassword:v33];
        if (!v34)
        {
          v45 = CloudServicesLog();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
            sub_10004AEBC();
          }

          NSErrorUserInfoKey v50 = NSLocalizedDescriptionKey;
          CFStringRef v51 = @"could not create backup keybag";
          id v36 = +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
          id v11 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:20 userInfo:v36];
          v7[2](v7, v11);
          goto LABEL_53;
        }
        CFStringRef v25 = (void *)v34;
        [v18 setObject:v34 forKeyedSubscript:@"stashedKeybag"];
        [v18 setObject:v32 forKeyedSubscript:@"stashedEMCSDict"];
LABEL_32:

        v46[0] = 0;
        id v36 = +[NSPropertyListSerialization dataWithPropertyList:v18 format:200 options:0 error:v46];
        id v11 = v46[0];
        if (v36)
        {
          *(void *)long long buf = 0;
          unint64_t v37 = CloudServicesLog();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v47 = 0;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "calling MKBUserSessionSetSecureBackupBlob", v47, 2u);
          }

          if (MKBUserSessionSetSecureBackupBlob())
          {
            v7[2](v7, 0);
LABEL_53:

            goto LABEL_54;
          }
          id v40 = CloudServicesLog();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
            sub_10004ADEC();
          }

          id v38 = objc_alloc_init((Class)NSMutableDictionary);
          [v38 setObject:@"MKBUserSessionSetSecureBackupBlob() failed" forKeyedSubscript:NSLocalizedDescriptionKey];
          id v39 = *(NSObject **)buf;
          [v38 setObject:*(void *)buf forKeyedSubscript:NSUnderlyingErrorKey];
        }
        else
        {
          id v38 = objc_alloc_init((Class)NSMutableDictionary);
          [v38 setObject:v11 forKeyedSubscript:NSUnderlyingErrorKey];
          [v38 setObject:@"could not create backup blob from stash dict" forKeyedSubscript:NSLocalizedDescriptionKey];
          id v39 = CloudServicesLog();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            sub_10004AD84();
          }
        }

        uint64_t v41 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:v38];

        v7[2](v7, (id)v41);
        id v11 = (id)v41;
        goto LABEL_53;
      }
      unsigned __int8 v42 = CloudServicesLog();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        sub_10004AE54();
      }

      NSErrorUserInfoKey v54 = NSLocalizedDescriptionKey;
      CFStringRef v55 = @"SecEMCSCreateNewiDMSKey() failed";
      id v32 = +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
    }
    id v11 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:v32];
    v7[2](v7, v11);
LABEL_54:

LABEL_55:
    goto LABEL_17;
  }
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  [v11 setObject:@"error decoding request properties" forKeyedSubscript:NSLocalizedDescriptionKey];
  uint64_t v12 = [v6 error];
  [v11 setObject:v12 forKeyedSubscript:NSUnderlyingErrorKey];

  uint64_t v13 = kSecureBackupErrorDomain;
  uint64_t v14 = 5;
LABEL_16:
  id v18 = +[NSError errorWithDomain:v13 code:v14 userInfo:v11];
  v7[2](v7, v18);
LABEL_17:
}

- (void)stashRecoveryDataWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  kdebug_trace();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001CE88;
  v10[3] = &unk_100071548;
  id v11 = (id)os_transaction_create();
  id v12 = v6;
  id v8 = v11;
  id v9 = v6;
  [(SecureBackupDaemon *)self _stashRecoveryDataWithRequest:v7 reply:v10];
}

- (void)setEMCSDict:(id)a3 backupKeybag:(id)a4 saveKeybag:(BOOL)a5 reply:(id)a6
{
  BOOL v48 = a5;
  id v53 = a3;
  id v54 = a4;
  id v8 = (void (**)(void))a6;
  id v9 = CloudServicesLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[SecureBackupDaemon setEMCSDict:backupKeybag:saveKeybag:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "In %s", (uint8_t *)&buf, 0xCu);
  }

  id v10 = +[UMUserManager sharedManager];
  id v11 = [v10 currentUser];
  id v12 = [v11 alternateDSID];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v70 = 0x3032000000;
  id v71 = sub_100011AB0;
  uint64_t v72 = sub_100011AC0;
  id v73 = 0;
  if (v12)
  {
    id v13 = [v53 mutableCopy];
    uint64_t v14 = [v54 sha1Digest];
    [v13 setObject:v14 forKeyedSubscript:@"digest"];
    unsigned int v15 = +[NSDate date];
    uint64_t v47 = kSecureBackupTimestampKey;
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v15);
    NSErrorUserInfoKey v50 = (void *)v14;

    id v51 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
    dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
    kdebug_trace();
    uint64_t v17 = _CloudServicesSignpostLogSystem();
    os_signpost_id_t v18 = _CloudServicesSignpostCreate(v17);
    uint64_t v20 = v19;

    uint64_t v21 = _CloudServicesSignpostLogSystem();
    uint64_t v22 = v21;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)v62 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_BEGIN, v18, "EMCSKVSSynchronize", " enableTelemetry=YES ", v62, 2u);
    }

    uint64_t v23 = _CloudServicesSignpostLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v62 = 134217984;
      *(void *)&v62[4] = v18;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: EMCSKVSSynchronize  enableTelemetry=YES ", v62, 0xCu);
    }

    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_10001D740;
    v56[3] = &unk_100071598;
    p_long long buf = &buf;
    NSErrorUserInfoKey v24 = v16;
    id v57 = v24;
    v58 = self;
    [v51 setConfigurationInfo:v13 forIdentifier:@"com.apple.idms.config.KCKey" forAltDSID:v12 completion:v56];
    dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
    kdebug_trace();
    double Nanoseconds = _CloudServicesSignpostGetNanoseconds(v18, v20);
    CFStringRef v26 = _CloudServicesSignpostLogSystem();
    id v27 = v26;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      BOOL v28 = *(void *)(*((void *)&buf + 1) + 40) == 0;
      *(_DWORD *)v62 = 67240192;
      *(_DWORD *)&v62[4] = v28;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_END, v18, "EMCSKVSSynchronize", " CloudServicesSignpostNameEMCSKVSSynchronize=%{public,signpost.telemetry:number1,name=CloudServicesSignpostNameEMCSKVSSynchronize}d ", v62, 8u);
    }

    id v29 = _CloudServicesSignpostLogSystem();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)v62 = 134218496;
      *(void *)&v62[4] = v18;
      __int16 v63 = 2048;
      double v64 = Nanoseconds / 1000000000.0;
      __int16 v65 = 1026;
      BOOL v66 = v30 == 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: EMCSKVSSynchronize  CloudServicesSignpostNameEMCSKVSSynchronize=%{public,signpost.telemetry:number1,name=CloudServicesSignpostNameEMCSKVSSynchronize}d ", v62, 0x1Cu);
    }

    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      v8[2](v8);
    }
    else
    {
      if (v48)
      {
        uint64_t v34 = CloudServicesLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v62 = 0;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "creating backup bag", v62, 2u);
        }

        uint64_t v35 = *((void *)&buf + 1);
        id obj = *(id *)(*((void *)&buf + 1) + 40);
        id v36 = v54;
        unint64_t v37 = sub_100033010();
        CFStringRef v74 = kSecValueData;
        *(void *)v62 = v36;
        id v38 = +[NSDictionary dictionaryWithObjects:v62 forKeys:&v74 count:1];

        LOBYTE(v36) = sub_1000044F0(v37, v38, &obj);
        objc_storeStrong((id *)(v35 + 40), obj);
        if ((v36 & 1) == 0)
        {
          uint64_t v46 = CloudServicesLog();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
            sub_10004AFE8();
          }

          ((void (*)(void (**)(void), void))v8[2])(v8, *(void *)(*((void *)&buf + 1) + 40));
          goto LABEL_30;
        }
        id v39 = +[CSDateUtilities posixDateFormatter];
        id v40 = +[NSDate date];
        uint64_t v41 = [v39 stringFromDate:v40];
        CFStringRef v49 = v39;

        v60[0] = kSecureBackupContainsEMCSDataKey;
        v60[1] = v47;
        v61[0] = &__kCFBooleanTrue;
        v61[1] = v41;
        v60[2] = kSecureBackupKeybagDigestKey;
        v61[2] = v50;
        unsigned __int8 v42 = +[NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:3];
        [(SecureBackupDaemon *)self _setMetadata:v42];
        __int16 v43 = sub_100004428();
        LODWORD(v39) = v43 == 0;

        if (v39)
        {
          __int16 v44 = +[NSUUID UUID];
          v45 = [v44 UUIDString];
          sub_100004484(v45);
        }
        [(SecureBackupDaemon *)self _setBackupEnabled:1 iCDP:0];
      }
      [(SecureBackupDaemon *)self setBackupAllowed:1];
      [(SecureBackupDaemon *)self backupWithInfo:0 garbageCollect:1 reply:v8];
    }
LABEL_30:

    goto LABEL_31;
  }
  id v31 = CloudServicesLog();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
    sub_10004AFB4();
  }

  NSErrorUserInfoKey v67 = NSLocalizedDescriptionKey;
  CFStringRef v68 = @"no alt DSID for setting IdMS info";
  id v13 = +[NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];
  uint64_t v32 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:v13];
  id v33 = *(void **)(*((void *)&buf + 1) + 40);
  *(void *)(*((void *)&buf + 1) + 40) = v32;

  ((void (*)(void (**)(void), void))v8[2])(v8, *(void *)(*((void *)&buf + 1) + 40));
LABEL_31:

  _Block_object_dispose(&buf, 8);
}

- (void)enableWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 guitarfish] || !objc_msgSend(v6, "guitarfishToken"))
  {
    if ([v6 guitarfishToken])
    {
      [(SecureBackupDaemon *)self enableGuitarfishTokenWithRequest:v6 reply:v7];
      goto LABEL_180;
    }
    id v9 = _CloudServicesSignpostLogSystem();
    os_signpost_id_t v10 = _CloudServicesSignpostCreate(v9);
    uint64_t v12 = v11;

    id v13 = _CloudServicesSignpostLogSystem();
    uint64_t v14 = v13;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      unsigned int v15 = [v6 activityLabel];
      *(_DWORD *)long long buf = 138543362;
      *(void *)v172 = v15;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "EnableWithRequest", " enableTelemetry=YES  Activity=%{public,signpost.telemetry:string1,name=Activity}@ ", buf, 0xCu);
    }
    dispatch_semaphore_t v16 = _CloudServicesSignpostLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [v6 activityLabel];
      *(_DWORD *)long long buf = 134218242;
      *(void *)v172 = v10;
      *(_WORD *)&v172[8] = 2114;
      CFStringRef v173 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: EnableWithRequest  enableTelemetry=YES  Activity=%{public,signpost.telemetry:string1,name=Activity}@ ", buf, 0x16u);
    }
    os_signpost_id_t v18 = [[SBEscrowOperationStartEvent alloc] initWithRequest:v6 type:100];
    uint64_t v19 = [(SecureBackupDaemon *)self operationsLogger];
    [v19 updateStoreWithEvent:v18];

    v166[0] = _NSConcreteStackBlock;
    v166[1] = 3221225472;
    v166[2] = sub_10001F700;
    v166[3] = &unk_1000715C0;
    os_signpost_id_t v169 = v10;
    uint64_t v170 = v12;
    v166[4] = self;
    uint64_t v20 = v18;
    v167 = v20;
    id v168 = v7;
    uint64_t v21 = objc_retainBlock(v166);
    uint64_t v22 = CloudServicesLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      *(void *)v172 = "-[SecureBackupDaemon enableWithRequest:reply:]";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
    }

    uint64_t v23 = [(SecureBackupDaemon *)self connectionQueue];
    [v6 setQueue:v23];

    NSErrorUserInfoKey v24 = [v6 error];

    if (v24)
    {
      id v25 = objc_alloc_init((Class)NSMutableDictionary);
      [v25 setObject:@"error decoding request properties" forKeyedSubscript:NSLocalizedDescriptionKey];
      CFStringRef v26 = [v6 error];
      [v25 setObject:v26 forKeyedSubscript:NSUnderlyingErrorKey];

      id v27 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:5 userInfo:v25];
      ((void (*)(void *, void *))v21[2])(v21, v27);

LABEL_179:
      goto LABEL_180;
    }
    BOOL v28 = [v6 iCloudEnv];
    [(SecureBackupDaemon *)self setICloudEnvironment:v28];

    if ([v6 emcsMode])
    {
      v153 = [v6 oldEMCSCred];
      v154 = [v6 emcsCred];
      v152 = [v6 emcsDict];
      if (!v154)
      {
        id v54 = CloudServicesLog();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
          sub_10004B170();
        }

        id v155 = objc_alloc_init((Class)NSMutableDictionary);
        [v155 setObject:@"Missing user credential for SecEMCSCreateDerivedKey()" forKeyedSubscript:NSLocalizedDescriptionKey];
        id v31 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:4 userInfo:v155];
        ((void (*)(void *, id))v21[2])(v21, v31);
        goto LABEL_178;
      }
      id v29 = +[MCProfileConnection sharedConnection];
      id v165 = 0;
      unsigned __int8 v30 = [v29 changePasscodeFrom:v153 to:v154 outError:&v165];
      id v31 = v165;

      if ((v30 & 1) == 0)
      {
        id v57 = CloudServicesLog();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          v58 = [v31 localizedDescription];
          sub_10004B1D8(v58, (uint64_t)v178, v57);
        }

        id v155 = objc_alloc_init((Class)NSMutableDictionary);
        [v155 setObject:@"Could not change device passcode" forKeyedSubscript:NSLocalizedDescriptionKey];
        [v155 setObject:v31 forKeyedSubscript:NSUnderlyingErrorKey];
        uint64_t v59 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:5 userInfo:v155];

        ((void (*)(void *, uint64_t))v21[2])(v21, v59);
        id v31 = (id)v59;
        goto LABEL_178;
      }
      uint64_t v32 = 0;
      if (v153)
      {
        if (v152)
        {
          uint64_t v32 = SecEMCSCreateDerivedEMCSKey();
          if (!v32)
          {
            id v80 = CloudServicesLog();
            if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
              sub_10004B1A4();
            }

            id v155 = objc_alloc_init((Class)NSMutableDictionary);
            [v155 setObject:@"SecEMCSCreateDerivedEMCSKey() failed with old data" forKeyedSubscript:NSLocalizedDescriptionKey];
            uint64_t v81 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:v155];

            ((void (*)(void *, uint64_t))v21[2])(v21, v81);
            id v31 = (id)v81;
            goto LABEL_178;
          }
        }
      }
      v164[1] = 0;
      id v155 = (id)v32;
      SecEMCSCreateNewiDMSKey();
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      id v34 = 0;
      v146 = v34;
      if (!v33)
      {
        NSErrorUserInfoKey v67 = CloudServicesLog();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
          sub_10004AE54();
        }

        id v35 = objc_alloc_init((Class)NSMutableDictionary);
        [v35 setObject:@"SecEMCSCreateNewiDMSKey() failed" forKeyedSubscript:NSLocalizedDescriptionKey];
        uint64_t v68 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:v35];

        ((void (*)(void *, uint64_t))v21[2])(v21, v68);
        id v31 = (id)v68;
        goto LABEL_163;
      }
      if (!v34)
      {
        uint64_t v78 = CloudServicesLog();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
          sub_10004AE88();
        }

        id v35 = objc_alloc_init((Class)NSMutableDictionary);
        [v35 setObject:@"SecEMCSCreateNewiDMSKey() returned nil EMCS key" forKeyedSubscript:NSLocalizedDescriptionKey];
        uint64_t v79 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:v35];

        ((void (*)(void *, uint64_t))v21[2])(v21, v79);
        id v31 = (id)v79;
        goto LABEL_163;
      }
      id v35 = [(SecureBackupDaemon *)self _createBackupKeybagWithPassword:v34];
      if (v35)
      {
        [(SecureBackupDaemon *)self setEMCSDict:v33 backupKeybag:v35 saveKeybag:1 reply:v21];
LABEL_163:

        id v77 = v33;
        id v33 = v146;
LABEL_176:

LABEL_177:
        goto LABEL_178;
      }
      v143 = 0;
      int v103 = CloudServicesLog();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEFAULT, "could not create backup keybag", buf, 2u);
      }

      id v104 = objc_alloc_init((Class)NSMutableDictionary);
      [v104 setObject:@"could not create backup keybag" forKeyedSubscript:NSLocalizedDescriptionKey];
      uint64_t v105 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:20 userInfo:v104];

      ((void (*)(void *, uint64_t))v21[2])(v21, v105);
      id v31 = (id)v105;
LABEL_162:

      id v35 = v143;
      goto LABEL_163;
    }
    if (([v6 stingray] & 1) == 0 && (objc_msgSend(v6, "icdp") & 1) == 0)
    {
      if ([(SecureBackupDaemon *)self _backupEnabled])
      {
        id v36 = [v6 metadataHash];
        BOOL v37 = v36 == 0;

        if (v37)
        {
          id v85 = CloudServicesLog();
          if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "Backup already enabled", buf, 2u);
          }

          [(SecureBackupDaemon *)self _backupKeychain];
          ((void (*)(void *, void))v21[2])(v21, 0);
          goto LABEL_179;
        }
      }
    }
    if (([v6 stingray] & 1) == 0
      && [v6 usesRandomPassphrase]
      && ([v6 metadataHash],
          id v38 = objc_claimAutoreleasedReturnValue(),
          BOOL v39 = v38 == 0,
          v38,
          v39))
    {
      int v148 = 0;
    }
    else
    {
      if (([v6 stingray] & 1) == 0 && objc_msgSend(v6, "usesMultipleiCSC"))
      {
        id v40 = CloudServicesLog();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Heading down multi-icsc path", buf, 2u);
        }

        [(SecureBackupDaemon *)self doEnableEscrowMultiICSCWithRequest:v6 reply:v21];
        goto LABEL_179;
      }
      int v148 = 1;
    }
    uint64_t v41 = CloudServicesLog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v42 = [v6 stingray];
      unsigned int v43 = [v6 usesRandomPassphrase];
      unsigned int v44 = [v6 usesMultipleiCSC];
      *(_DWORD *)long long buf = 67109632;
      *(_DWORD *)v172 = v42;
      *(_WORD *)&v172[4] = 1024;
      *(_DWORD *)&v172[6] = v43;
      LOWORD(v173) = 1024;
      *(_DWORD *)((char *)&v173 + 2) = v44;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Heading down spaghetti path: s: %d, uRP: %d, uMiCSC:%d", buf, 0x14u);
    }

    v153 = [(SecureBackupDaemon *)self massageOutgoingMetadataFromRequest:v6];
    v45 = [v6 metadataHash];
    v154 = [v45 objectForKeyedSubscript:kSecureBackupEncodedMetadataKey];

    uint64_t v46 = [v6 metadataHash];
    v152 = [v46 objectForKeyedSubscript:@"duplicateEncodedMetadata"];

    id v155 = +[NSMutableDictionary dictionary];
    if ([v6 stingray])
    {
      uint64_t v47 = [v6 appleID];
      if ([v47 length])
      {
        BOOL v48 = [v6 iCloudPassword];
        if ([v48 length])
        {
          CFStringRef v49 = [v6 iCloudIdentityData];
          BOOL v50 = [v49 length] == 0;

          if (!v50)
          {
            id v33 = [v6 iCloudIdentityData];
            if ([v6 guitarfish])
            {
              uint64_t v51 = [v33 sha256Digest];
              [v155 setObject:v51 forKeyedSubscript:kSecureBackupKeybagSHA256Key];
              v140 = (void *)v51;
              NSErrorUserInfoKey v52 = 0;
              v146 = 0;
              uint64_t v53 = 0;
              goto LABEL_103;
            }
            uint64_t v86 = [v33 sha1Digest];
            [v155 setObject:v86 forKeyedSubscript:kSecureBackupKeybagDigestKey];
            v146 = (void *)v86;
            NSErrorUserInfoKey v52 = 0;
            goto LABEL_101;
          }
LABEL_76:
          v69 = CloudServicesLog();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
          {
            v119 = [v6 appleID];
            v120 = [v6 iCloudPassword];
            uint64_t v121 = [v6 iCloudIdentityData];
            v122 = (void *)v121;
            CFStringRef v123 = @"non-";
            if (v120) {
              CFStringRef v124 = @"non-";
            }
            else {
              CFStringRef v124 = &stru_100072CF8;
            }
            *(_DWORD *)long long buf = 138412802;
            *(void *)v172 = v119;
            CFStringRef v173 = v124;
            *(_WORD *)&v172[8] = 2112;
            if (!v121) {
              CFStringRef v123 = &stru_100072CF8;
            }
            __int16 v174 = 2112;
            CFStringRef v175 = v123;
            _os_log_error_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "attempted to store stingray identities, with invalid parameters: %@, %@nil iCloud password, %@nil iCloud identity data", buf, 0x20u);
          }
          id v70 = objc_alloc((Class)NSString);
          id v71 = [v6 appleID];
          uint64_t v72 = [v6 iCloudPassword];
          uint64_t v73 = [v6 iCloudIdentityData];
          CFStringRef v74 = (void *)v73;
          CFStringRef v75 = @"non-";
          if (v72) {
            CFStringRef v76 = @"non-";
          }
          else {
            CFStringRef v76 = &stru_100072CF8;
          }
          if (!v73) {
            CFStringRef v75 = &stru_100072CF8;
          }
          id v33 = [v70 initWithFormat:@"attempted to store stingray identities, with invalid parameters: %@, %@nil iCloud password, %@nil iCloud identity data", v71, v76, v75];

          id v77 = objc_alloc_init((Class)NSMutableDictionary);
          [v77 setObject:v33 forKeyedSubscript:NSLocalizedDescriptionKey];
          id v31 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:4 userInfo:v77];
          ((void (*)(void *, id))v21[2])(v21, v31);
          goto LABEL_176;
        }
      }
      goto LABEL_76;
    }
    if ([(SecureBackupDaemon *)self forceICDP])
    {
      CFStringRef v55 = CloudServicesLog();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "FORCING ICDP + MULTIPLE ICSC", buf, 2u);
      }
    }
    NSErrorUserInfoKey v56 = [v6 passphrase];
    if ([v56 length])
    {
    }
    else
    {
      unsigned int v60 = [v6 useCachedPassphrase];

      if (v60)
      {
        id v61 = [(SecureBackupDaemon *)self cachedPassphrase];
        [v6 setPassphrase:v61];

        v62 = [v6 passphrase];
        BOOL v63 = [v62 length] == 0;

        if (v63)
        {
          v114 = CloudServicesLog();
          if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR)) {
            sub_10004B2F8();
          }

          id v33 = objc_alloc_init((Class)NSMutableDictionary);
          [v33 setObject:@"Missing cached passphrase" forKeyedSubscript:NSLocalizedDescriptionKey];
          id v31 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:9 userInfo:v33];
          ((void (*)(void *, id))v21[2])(v21, v31);
          goto LABEL_177;
        }
      }
    }
    double v64 = [v6 passphrase];
    if ([v64 length])
    {
      if (!v148)
      {

        BOOL v66 = [v6 passphrase];
        id v33 = [v66 dataUsingEncoding:4];

        if (!v33)
        {
          __int16 v102 = CloudServicesLog();
          if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR)) {
            sub_10004B32C();
          }

          id v33 = objc_alloc_init((Class)NSMutableDictionary);
          [v33 setObject:@"could not create backup bag password" forKeyedSubscript:NSLocalizedDescriptionKey];
          id v31 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:v33];
          ((void (*)(void *, id))v21[2])(v21, v31);
          goto LABEL_177;
        }
        NSErrorUserInfoKey v52 = 0;
        goto LABEL_68;
      }
      if ([v6 icdp])
      {

LABEL_64:
        v164[0] = 0;
        id v33 = [(SecureBackupDaemon *)self createiCloudRecoveryPasswordWithError:v164];
        id v65 = v164[0];
        id v31 = v65;
        if (!v33)
        {
          ((void (*)(void *, id))v21[2])(v21, v65);
LABEL_178:

          goto LABEL_179;
        }
        NSErrorUserInfoKey v52 = v65;
LABEL_68:
        if (([v6 usesMultipleiCSC] & 1) == 0)
        {
          uint64_t v53 = [(SecureBackupDaemon *)self _createBackupKeybagWithPassword:v33];
          if (!v53)
          {
            v115 = CloudServicesLog();
            if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR)) {
              sub_10004AEBC();
            }

            id v77 = objc_alloc_init((Class)NSMutableDictionary);
            [v77 setObject:@"could not create backup keybag" forKeyedSubscript:NSLocalizedDescriptionKey];
            id v31 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:20 userInfo:v77];

            ((void (*)(void *, id))v21[2])(v21, v31);
            goto LABEL_176;
          }
          v146 = 0;
          goto LABEL_102;
        }
        v146 = 0;
LABEL_101:
        uint64_t v53 = 0;
LABEL_102:
        v140 = 0;
LABEL_103:
        v143 = (void *)v53;
        v141 = +[CSDateUtilities posixDateFormatter];
        v87 = +[NSDate date];
        v145 = [v141 stringFromDate:v87];

        uint64_t v88 = kSecureBackupTimestampKey;
        [v155 setObject:v145 forKeyedSubscript:kSecureBackupTimestampKey];
        if (v153)
        {
          [v153 setObject:v145 forKeyedSubscript:kSecureBackupMetadataTimestampKey];
          [v155 setObject:v153 forKeyedSubscript:kSecureBackupClientMetadataKey];
        }
        if (!v148)
        {
          [v155 setObject:&__kCFBooleanFalse forKeyedSubscript:kSecureBackupUsesMultipleiCSCKey];
          id v156 = v52;
          unsigned __int8 v95 = [(SecureBackupDaemon *)self registerSingleRecoverySecret:v143 iCDP:0 error:&v156];
          id v31 = v156;

          if (v95)
          {
            [(SecureBackupDaemon *)self _setUsesEscrow:0];
            [(SecureBackupDaemon *)self _setMetadata:v155];
            v96 = sub_100004428();
            BOOL v97 = v96 == 0;

            if (v97)
            {
              __int16 v98 = +[NSUUID UUID];
              v99 = [v98 UUIDString];
              sub_100004484(v99);
            }
            [(SecureBackupDaemon *)self _setKVSKeybag:v143];
            [(SecureBackupDaemon *)self _removeProtectedKeychain];
            -[SecureBackupDaemon _setBackupEnabled:iCDP:](self, "_setBackupEnabled:iCDP:", 1, [v6 icdp]);
            if ([v6 synchronize])
            {
              [(SecureBackupDaemon *)self _setAutobackupEnabledWithReply:v21];
            }
            else
            {
              [(SecureBackupDaemon *)self _setAutobackupEnabled];
              ((void (*)(void *, id))v21[2])(v21, v31);
            }
          }
          else
          {
            __int16 v100 = CloudServicesLog();
            if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR)) {
              sub_10004B290();
            }

            id v150 = objc_alloc_init((Class)NSMutableDictionary);
            [v150 setObject:v31 forKeyedSubscript:NSUnderlyingErrorKey];
            uint64_t v101 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:20 userInfo:v150];

            ((void (*)(void *, uint64_t))v21[2])(v21, v101);
            id v31 = (id)v101;
          }
          goto LABEL_161;
        }
        uint64_t v139 = v88;
        char v89 = [EscrowService alloc];
        CFStringRef v90 = [(SecureBackupDaemon *)self operationsLogger];
        v149 = [(EscrowService *)v89 initWithOperationsLogger:v90];

        id v91 = [v6 smsTarget];

        if (v91)
        {
          CFStringRef v92 = [v6 smsTarget];
          id v163 = v52;
          id v93 = [(SecureBackupDaemon *)self normalizeSMSTarget:v92 error:&v163];
          id v31 = v163;

          [v6 setSmsTarget:v93];
          CFStringRef v94 = [v6 smsTarget];
          LODWORD(v92) = v94 == 0;

          if (v92)
          {
            ((void (*)(void *, id))v21[2])(v21, v31);
LABEL_160:

LABEL_161:
            id v104 = v140;
            goto LABEL_162;
          }
        }
        else
        {
          id v31 = v52;
        }
        if ([v6 stingray])
        {
          id v106 = v31;
        }
        else
        {
          if ([v6 usesMultipleiCSC])
          {
            v113 = CloudServicesLog();
            if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR)) {
              sub_10004B228();
            }

            id v107 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:&__NSDictionary0__struct];
            ((void (*)(void *, id))v21[2])(v21, v107);
            goto LABEL_159;
          }
          [v155 setObject:&__kCFBooleanFalse forKeyedSubscript:kSecureBackupUsesMultipleiCSCKey];
          id v116 = [v6 icdp];
          id v162 = v31;
          unsigned __int8 v117 = [(SecureBackupDaemon *)self registerSingleRecoverySecret:v143 iCDP:v116 error:&v162];
          id v106 = v162;

          if ((v117 & 1) == 0)
          {
            v125 = CloudServicesLog();
            if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR)) {
              sub_10004B290();
            }

            id v107 = objc_alloc_init((Class)NSMutableDictionary);
            [v107 setObject:@"SOSCCRegisterSingleRecoverySecret() failed" forKeyedSubscript:NSLocalizedDescriptionKey];
            [v107 setObject:v106 forKeyedSubscript:NSUnderlyingErrorKey];
            id v31 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:20 userInfo:v107];

            ((void (*)(void *, id))v21[2])(v21, v31);
            goto LABEL_159;
          }
          uint64_t v118 = [v143 sha1Digest];

          [v155 setObject:v118 forKeyedSubscript:kSecureBackupKeybagDigestKey];
          v146 = (void *)v118;
        }
        id v107 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:5];
        unsigned int v108 = [v6 guitarfish];
        if (v108) {
          v109 = v140;
        }
        else {
          v109 = v146;
        }
        id v110 = &kSecureBackupKeybagSHA256Key;
        if (!v108) {
          id v110 = &kSecureBackupKeybagDigestKey;
        }
        [v107 setObject:v109 forKeyedSubscript:*v110];
        [v107 setObject:v33 forKeyedSubscript:kSecureBackupBagPasswordKey];
        [v107 setObject:@"1" forKeyedSubscript:@"BackupVersion"];
        [v107 setObject:v145 forKeyedSubscript:v139];
        [v6 setEscrowRecord:v107];
        [v6 setMetadata:v155];
        [v6 setEncodedMetadata:v154];
        [v6 setDuplicateEncodedMetadata:v152];
        v111 = [v6 encodedMetadata];

        if (v111)
        {
          v112 = CloudServicesLog();
          if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEFAULT, "enableWithInfo(): beginning an update request", buf, 2u);
          }
        }
        v157[0] = _NSConcreteStackBlock;
        v157[1] = 3221225472;
        v157[2] = sub_10001F92C;
        v157[3] = &unk_1000715E8;
        v157[4] = self;
        id v158 = v6;
        id v159 = v155;
        id v160 = v143;
        v161 = v21;
        [(EscrowService *)v149 storeRecordWithRequest:v158 completionBlock:v157];

        id v31 = v106;
LABEL_159:

        goto LABEL_160;
      }
      long long v82 = [v6 countryDialCode];
      if ([v82 length])
      {
        long long v83 = [v6 countryCode];
        if ([v83 length])
        {
          v147 = [v6 smsTarget];
          if ([v147 length])
          {
            v144 = [v6 appleID];
            if ([v144 length])
            {
              long long v84 = [v6 iCloudPassword];
              BOOL v142 = [v84 length] == 0;

              if (!v142) {
                goto LABEL_64;
              }
LABEL_169:
              v126 = CloudServicesLog();
              if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
              {
                v151 = [v6 passphrase];
                if (v151) {
                  CFStringRef v134 = @"non-";
                }
                else {
                  CFStringRef v134 = &stru_100072CF8;
                }
                v135 = [v6 smsTarget];
                v136 = [v6 appleID];
                v137 = [v6 iCloudPassword];
                CFStringRef v138 = @"non-";
                if (!v137) {
                  CFStringRef v138 = &stru_100072CF8;
                }
                *(_DWORD *)long long buf = 138413058;
                *(void *)v172 = v134;
                *(_WORD *)&v172[8] = 2112;
                CFStringRef v173 = v135;
                __int16 v174 = 2112;
                CFStringRef v175 = v136;
                __int16 v176 = 2112;
                CFStringRef v177 = v138;
                _os_log_error_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_ERROR, "attempted to enable backup, with invalid parameters: %@nil recovery password, %@, %@, %@nil iCloud password", buf, 0x2Au);
              }
              id v127 = objc_alloc((Class)NSString);
              v128 = [v6 passphrase];
              if (v128) {
                CFStringRef v129 = @"non-";
              }
              else {
                CFStringRef v129 = &stru_100072CF8;
              }
              v130 = [v6 smsTarget];
              v131 = [v6 appleID];
              v132 = [v6 iCloudPassword];
              CFStringRef v133 = @"non-";
              if (!v132) {
                CFStringRef v133 = &stru_100072CF8;
              }
              id v33 = [v127 initWithFormat:@"attempted to enable backup, with invalid parameters: %@nil recovery password, %@, %@, %@nil iCloud password", v129, v130, v131, v133];

              id v77 = objc_alloc_init((Class)NSMutableDictionary);
              [v77 setObject:v33 forKeyedSubscript:NSLocalizedDescriptionKey];
              id v31 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:4 userInfo:v77];
              ((void (*)(void *, id))v21[2])(v21, v31);
              goto LABEL_176;
            }
          }
        }
      }
    }

    goto LABEL_169;
  }
  id v8 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:5 userInfo:0];
  (*((void (**)(id, void *))v7 + 2))(v7, v8);

LABEL_180:
}

- (void)handleEscrowStoreResults:(id)a3 escrowError:(id)a4 request:(id)a5 peerID:(id)a6 newRecordMetadata:(id)a7 backupKeybag:(id)a8 reply:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  uint64_t v19 = (void (**)(id, id))a9;
  if (v15)
  {
    uint64_t v20 = [v15 domain];
    unsigned int v21 = [v20 isEqualToString:kEscrowServiceErrorDomain];

    if (v21 && [v15 code] == (id)-5012)
    {
      uint64_t v22 = kSecureBackupErrorDomain;
      uint64_t v23 = [v15 userInfo];
      uint64_t v24 = +[NSError errorWithDomain:v22 code:29 userInfo:v23];

      id v15 = (id)v24;
    }
    id v25 = CloudServicesLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_10004B360();
    }

    v19[2](v19, v15);
  }
  else
  {
    CFStringRef v26 = CloudServicesLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "escrowService storeRecordWithRequest: succeeded", buf, 2u);
    }

    if (([v16 stingray] & 1) == 0)
    {
      [(SecureBackupDaemon *)self _setUsesEscrow:1];
      [(SecureBackupDaemon *)self _setMetadata:v17];
      id v27 = sub_100004428();

      if (!v27)
      {
        BOOL v28 = +[NSUUID UUID];
        id v29 = [v28 UUIDString];
        sub_100004484(v29);
      }
      -[SecureBackupDaemon _setBackupEnabled:iCDP:](self, "_setBackupEnabled:iCDP:", 1, [v16 icdp]);
      [(SecureBackupDaemon *)self _removeProtectedKeychain];
      if (v18) {
        [(SecureBackupDaemon *)self _setKVSKeybag:v18];
      }
      [(SecureBackupDaemon *)self _removeKeychainItemForKey:@"SecureBackupEscrowCert"];
      unsigned __int8 v30 = [v14 objectForKeyedSubscript:@"EscrowServiceCertificate"];
      [(SecureBackupDaemon *)self _saveKeychainItem:v30 forKey:@"SecureBackupEscrowCert"];

      [(SecureBackupDaemon *)self _backupCloudIdentityKeychainViewAndPushToKVS];
      id v31 = CloudServicesLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "backing up the rest of the keychain!", (uint8_t *)v32, 2u);
      }

      [(SecureBackupDaemon *)self _setAutobackupEnabled];
    }
    v19[2](v19, 0);
  }
}

- (BOOL)backupAllowed
{
  v2 = sem_open("com.apple.sbd.backupAllowed", 0);
  id v3 = v2;
  if (v2 != (sem_t *)-1) {
    sem_close(v2);
  }
  return v3 != (sem_t *)-1;
}

- (void)setBackupAllowed:(BOOL)a3
{
  id v3 = sem_open("com.apple.sbd.backupAllowed", 512, a3, 256, 0);
  if (v3 == (sem_t *)-1)
  {
    id v4 = CloudServicesLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10004B3C8(v4);
    }
  }
  else
  {
    sem_close(v3);
  }
}

- (void)backupForRecoveryKeyWithInfo:(id)a3 garbageCollect:(BOOL)a4 reply:(id)a5
{
  id v6 = (void (**)(id, void))a5;
  id v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    id v9 = "-[SecureBackupDaemon backupForRecoveryKeyWithInfo:garbageCollect:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "In %s", (uint8_t *)&v8, 0xCu);
  }

  [(SecureBackupDaemon *)self _backupCloudIdentityKeychainViewAndPushToKVSForRecoveryKey];
  v6[2](v6, 0);
}

- (void)backupWithInfo:(id)a3 garbageCollect:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  id v7 = (void (**)(id, void))a5;
  int v8 = CloudServicesLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v34 = 136315138;
    *(void *)&v34[4] = "-[SecureBackupDaemon backupWithInfo:garbageCollect:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "In %s", v34, 0xCu);
  }

  id v9 = [(SecureBackupDaemon *)self _metadata];
  os_signpost_id_t v10 = [v9 objectForKeyedSubscript:kSecureBackupContainsEMCSDataKey];
  unsigned int v11 = [v10 isEqual:&__kCFBooleanTrue];

  if (!v11)
  {
    [(SecureBackupDaemon *)self _backupFullKeychain];
LABEL_36:
    v7[2](v7, 0);
    goto LABEL_37;
  }
  if (![(SecureBackupDaemon *)self backupAllowed])
  {
    id v13 = CloudServicesLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "backup not allowed: skipping", v34, 2u);
    }
    goto LABEL_35;
  }
  uint64_t v12 = sub_1000203A0();
  if (v12)
  {
    id v13 = v12;
    kdebug_trace();
    id v14 = _CloudServicesSignpostLogSystem();
    os_signpost_id_t v15 = _CloudServicesSignpostCreate(v14);
    uint64_t v17 = v16;

    id v18 = _CloudServicesSignpostLogSystem();
    uint64_t v19 = v18;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)id v34 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, v15, "CopyEMCSBackup", " enableTelemetry=YES ", v34, 2u);
    }

    uint64_t v20 = _CloudServicesSignpostLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v34 = 134217984;
      *(void *)&v34[4] = v15;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CopyEMCSBackup  enableTelemetry=YES ", v34, 0xCu);
    }

    unsigned int v21 = (void *)_SecKeychainCopyEMCSBackup();
    double Nanoseconds = _CloudServicesSignpostGetNanoseconds(v15, v17);
    uint64_t v23 = _CloudServicesSignpostLogSystem();
    uint64_t v24 = v23;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_DWORD *)id v34 = 67240192;
      *(_DWORD *)&v34[4] = v21 != 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, v15, "CopyEMCSBackup", " CloudServicesSignpostNameSecKeychainCopyEMCSBackup=%{public,signpost.telemetry:number1,name=CloudServicesSignpostNameSecKeychainCopyEMCSBackup}d ", v34, 8u);
    }

    id v25 = _CloudServicesSignpostLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v34 = 134218496;
      *(void *)&v34[4] = v15;
      *(_WORD *)&v34[12] = 2048;
      *(double *)&v34[14] = Nanoseconds / 1000000000.0;
      __int16 v35 = 1026;
      BOOL v36 = v21 != 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CopyEMCSBackup  CloudServicesSignpostNameSecKeychainCopyEMCSBackup=%{public,signpost.telemetry:number1,name=CloudServicesSignpostNameSecKeychainCopyEMCSBackup}d ", v34, 0x1Cu);
    }

    kdebug_trace();
    if (v21)
    {
      CFStringRef v26 = [v9 objectForKeyedSubscript:kSecureBackupKeybagDigestKey];
      id v27 = [v13 sha1Digest];
      BOOL v28 = CloudServicesLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v34 = 138412546;
        *(void *)&v34[4] = v27;
        *(_WORD *)&v34[12] = 2112;
        *(void *)&v34[14] = v26;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Pushing EMCS backup, keybag digest %@, metadata digest %@", v34, 0x16u);
      }

      if (([v26 isEqual:v27] & 1) == 0)
      {
        id v29 = CloudServicesLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_10004B4B8();
        }
      }
      -[SecureBackupDaemon _setEMCSBackup:keybag:](self, "_setEMCSBackup:keybag:", v21, v13, *(_OWORD *)v34);
      if (v5)
      {
        unsigned __int8 v30 = [v27 hexString];
        [(SecureBackupDaemon *)self garbageCollectEMCSBackupsExcluding:v30];
      }
    }
    else
    {
      CFStringRef v26 = CloudServicesLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_10004B484();
      }
    }

LABEL_35:
    goto LABEL_36;
  }
  id v31 = CloudServicesLog();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
    sub_10004B450();
  }

  NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
  CFStringRef v38 = @"attempting to back up with no keybag";
  uint64_t v32 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
  id v33 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:22 userInfo:v32];
  ((void (**)(id, void *))v7)[2](v7, v33);

LABEL_37:
}

- (void)backupForRecoveryKeyWithInfoInDaemon:(id)a3 reply:(id)a4
{
}

- (void)backupWithInfo:(id)a3 reply:(id)a4
{
}

- (id)restoreBackup:(id)a3 withName:(id)a4 keybagDigest:(id)a5 keybag:(id)a6 password:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  __int16 v35 = sub_100011AB0;
  BOOL v36 = sub_100011AC0;
  id v37 = 0;
  uint64_t v17 = [(SecureBackupDaemon *)self createPlistFromDERData:v12];
  if (v17)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v17 enumerateKeysAndObjectsUsingBlock:&stru_100071628];
    }
    else
    {
      uint64_t v20 = CloudServicesLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10004B558();
      }
    }
    if ([v13 isEqualToString:@"KeychainV0-tomb"])
    {
      unsigned int v21 = (id *)(v33 + 5);
      id obj = (id)v33[5];
      uint64_t v22 = [(SecureBackupDaemon *)self createEncodedDirectBackupSliceKeybagFromData:v15 error:&obj];
      objc_storeStrong(v21, obj);

      id v15 = (id)v22;
    }
    uint64_t v23 = (void *)v33[5];
    if (!v23)
    {
      uint64_t v24 = [v15 peerIDForKeybagDigest:v14];
      if (v24)
      {
        id v25 = CloudServicesLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v26 = [v15 peerIDs];
          *(_DWORD *)long long buf = 138412546;
          BOOL v39 = v24;
          __int16 v40 = 2112;
          uint64_t v41 = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "using peerID %@ from backup keybag peers: %@", buf, 0x16u);
        }
      }
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100020950;
      v28[3] = &unk_100071650;
      id v29 = v13;
      unsigned __int8 v30 = &v32;
      [(SecureBackupDaemon *)self restoreBackupName:v29 peerID:v24 keybag:v15 password:v16 backup:v12 reply:v28];

      uint64_t v23 = (void *)v33[5];
    }
    id v19 = v23;
  }
  else
  {
    NSErrorUserInfoKey v42 = NSLocalizedDescriptionKey;
    CFStringRef v43 = @"could not create plist from DER backup";
    id v18 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    id v19 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:19 userInfo:v18];
  }
  _Block_object_dispose(&v32, 8);

  return v19;
}

- (id)encodedStatsForViews:(id)a3
{
  id v3 = a3;
  if (qword_100081058 != -1) {
    dispatch_once(&qword_100081058, &stru_100071670);
  }
  id v4 = objc_alloc_init((Class)NSMutableString);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = (id)qword_100081050;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        objc_msgSend((id)qword_100081048, "objectForKeyedSubscript:", v10, (void)v15);
        unsigned int v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!v11 || (unsigned __int8 v12 = [v3 containsObject:v10], v13 = v11, (v12 & 1) == 0)) {
          CFStringRef v13 = @"_";
        }
        [v4 appendString:v13];
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)_restoreView:(id)a3 password:(id)a4 keybagDigest:(id)a5 restoredViews:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  long long v16 = [(SecureBackupDaemon *)self kvs];
  long long v17 = [(SecureBackupDaemon *)self _getICDPBackupFromKVS:v16 forView:v12];

  if (!v17)
  {
    if (a7) {
      goto LABEL_17;
    }
LABEL_20:
    BOOL v27 = 0;
    id v26 = 0;
    goto LABEL_22;
  }
  __int16 v35 = v15;
  long long v18 = [v17 objectForKeyedSubscript:@"com.apple.securebackup.keychain"];
  id v19 = CloudServicesLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    [v17 objectForKeyedSubscript:kSecureBackupTimestampKey];
    v21 = id v20 = v14;
    *(_DWORD *)long long buf = 138412546;
    id v37 = v12;
    __int16 v38 = 2112;
    BOOL v39 = v21;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Retrieving backup for view %@ from %@", buf, 0x16u);

    id v14 = v20;
  }

  if (!v18)
  {

    id v15 = v35;
    if (a7) {
      goto LABEL_17;
    }
    goto LABEL_20;
  }
  id v34 = v13;
  uint64_t v22 = CloudServicesLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v37 = v12;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "restoring backup view %@", buf, 0xCu);
  }

  uint64_t v23 = [v18 objectForKeyedSubscript:@"keybag"];
  uint64_t v24 = [v18 objectForKeyedSubscript:@"backup"];
  id v25 = (void *)v24;
  id v26 = 0;
  BOOL v27 = 0;
  if (v23 && v24)
  {
    id v28 = [objc_alloc((Class)NSString) initWithFormat:@"%@-tomb", v12];
    id v29 = v14;
    unsigned __int8 v30 = v28;
    id v31 = self;
    uint64_t v32 = v29;
    -[SecureBackupDaemon restoreBackup:withName:keybagDigest:keybag:password:](v31, "restoreBackup:withName:keybagDigest:keybag:password:", v25, v30);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v27 = v26 == 0;
    if (!v26) {
      [v35 addObject:v12];
    }

    id v14 = v32;
  }

  if (!a7)
  {
    id v13 = v34;
    id v15 = v35;
    goto LABEL_22;
  }
  id v13 = v34;
  id v15 = v35;
  if (!v27)
  {
    if (v26)
    {
LABEL_18:
      id v26 = v26;
      BOOL v27 = 0;
      *a7 = v26;
      goto LABEL_22;
    }
LABEL_17:
    id v26 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:0];
    goto LABEL_18;
  }
LABEL_22:

  return v27;
}

- (void)_restoreKeychainAsyncWithBackupBag:(id)a3 password:(id)a4 keybagDigest:(id)a5 haveBottledPeer:(BOOL)a6 restoredViews:(id)a7 viewsNotToBeRestored:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  char v34 = 0;
  id v19 = [(SecureBackupDaemon *)self backupQueue];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000211D8;
  v25[3] = &unk_100071698;
  v25[4] = self;
  id v26 = v16;
  id v30 = v14;
  id v31 = v33;
  id v27 = v18;
  id v28 = v15;
  id v29 = v17;
  BOOL v32 = a6;
  id v20 = v14;
  id v21 = v17;
  id v22 = v15;
  id v23 = v18;
  id v24 = v16;
  dispatch_async(v19, v25);

  _Block_object_dispose(v33, 8);
}

- (BOOL)_restoreKeychainWithBackupPassword:(id)a3 keybagDigest:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x3032000000;
  CFStringRef v49 = sub_100011AB0;
  BOOL v50 = sub_100011AC0;
  id v51 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x3032000000;
  CFStringRef v43 = sub_100011AB0;
  unsigned int v44 = sub_100011AC0;
  id v45 = (id)0xAAAAAAAAAAAAAAAALL;
  id v45 = objc_alloc_init((Class)NSMutableSet);
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  uint64_t v10 = [(SecureBackupDaemon *)self backupQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021B98;
  block[3] = &unk_1000716C0;
  block[4] = self;
  id v11 = v8;
  id v31 = v11;
  id v12 = v9;
  id v32 = v12;
  id v33 = &v40;
  char v34 = &v46;
  __int16 v35 = &v36;
  dispatch_sync(v10, block);

  id v13 = CloudServicesLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = v41[5];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v53 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "restoredViews: %@", buf, 0xCu);
  }

  id v15 = CloudServicesLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "kicking off async restore of the other keychain views", buf, 2u);
  }

  id v16 = [(SecureBackupDaemon *)self backupQueue];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100021CB8;
  v25[3] = &unk_1000716E8;
  v25[4] = self;
  id v17 = v12;
  id v26 = v17;
  id v28 = &v36;
  id v18 = v11;
  id v27 = v18;
  id v29 = &v40;
  dispatch_async(v16, v25);

  if (sub_100004254())
  {
    id v19 = +[NSMutableDictionary dictionary];
    id v20 = [(SecureBackupDaemon *)self encodedStatsForViews:v41[5]];
    [v19 setObject:v20 forKeyedSubscript:@"views"];

    id v21 = +[CloudServicesAnalytics logger];
    [v21 logSoftFailureForEventNamed:CloudServicesSOSRestoreMetrics withAttributes:v19];
  }
  if (!*((unsigned char *)v37 + 24))
  {
    id v22 = CloudServicesLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10004B764();
    }

    if (a5) {
      *a5 = (id) v47[5];
    }
  }
  BOOL v23 = *((unsigned char *)v37 + 24) != 0;

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  return v23;
}

- (id)secureBackups
{
  if (OctagonPlatformSupportsSOS())
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100022000;
    v5[3] = &unk_100071710;
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
    id v6 = v3;
    [(SecureBackupDaemon *)self _enumerateICDPBackupsUsingBlock:v5];
  }
  else
  {
    id v3 = &__NSDictionary0__struct;
  }

  return v3;
}

- (void)recordIDAndMetadataForSilentAttempt:(id)a3 passphraseLength:(unint64_t)a4 platform:(int)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = CloudServicesLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    unint64_t v21 = a4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "looking for record for silent attempt of passphrase length %lu", buf, 0xCu);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100022328;
  v15[3] = &unk_100071738;
  id v17 = v11;
  unint64_t v18 = a4;
  v15[4] = self;
  id v16 = v10;
  int v19 = a5;
  id v13 = v10;
  id v14 = v11;
  [(SecureBackupDaemon *)self getAccountInfoWithRequest:v13 reply:v15];
}

- (id)restoreEMCSBackup:(id)a3 keybag:(id)a4 password:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  kdebug_trace();
  id v10 = _CloudServicesSignpostLogSystem();
  os_signpost_id_t v11 = _CloudServicesSignpostCreate(v10);
  uint64_t v13 = v12;

  id v14 = _CloudServicesSignpostLogSystem();
  id v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(v27) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "RestoreEMCSBackup", " enableTelemetry=YES ", (uint8_t *)&v27, 2u);
  }

  id v16 = _CloudServicesSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 134217984;
    os_signpost_id_t v28 = v11;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RestoreEMCSBackup  enableTelemetry=YES ", (uint8_t *)&v27, 0xCu);
  }

  int v17 = _SecKeychainRestoreBackup();
  double Nanoseconds = _CloudServicesSignpostGetNanoseconds(v11, v13);
  int v19 = _CloudServicesSignpostLogSystem();
  id v20 = v19;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    int v27 = 67240192;
    LODWORD(v28) = v17 == 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_END, v11, "RestoreEMCSBackup", " CloudServicesSignpostNameRestoreEMCSBackup=%{public,signpost.telemetry:number1,name=CloudServicesSignpostNameRestoreEMCSBackup}d ", (uint8_t *)&v27, 8u);
  }

  unint64_t v21 = _CloudServicesSignpostLogSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 134218496;
    os_signpost_id_t v28 = v11;
    __int16 v29 = 2048;
    double v30 = Nanoseconds / 1000000000.0;
    __int16 v31 = 1026;
    BOOL v32 = v17 == 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RestoreEMCSBackup  CloudServicesSignpostNameRestoreEMCSBackup=%{public,signpost.telemetry:number1,name=CloudServicesSignpostNameRestoreEMCSBackup}d ", (uint8_t *)&v27, 0x1Cu);
  }

  kdebug_trace();
  id v22 = CloudServicesLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 134217984;
    os_signpost_id_t v28 = v17;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "_SecKeychainRestoreBackup() returned %ld", (uint8_t *)&v27, 0xCu);
  }

  if (v17)
  {
    id v23 = objc_alloc_init((Class)NSMutableDictionary);
    [v23 setObject:@"_SecKeychainRestoreBackup() failed" forKeyedSubscript:NSLocalizedDescriptionKey];
    id v24 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v17 userInfo:0];
    [v23 setObject:v24 forKeyedSubscript:NSUnderlyingErrorKey];

    id v25 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:v23];
  }
  else
  {
    id v25 = 0;
  }

  return v25;
}

- (id)restoreEMCSBackup:(id)a3 withPassword:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SecureBackupDaemon *)self _metadata];
  id v9 = [v8 objectForKeyedSubscript:kSecureBackupKeybagDigestKey];
  id v10 = [v6 objectForKeyedSubscript:@"timestamp"];
  if (v10)
  {
    os_signpost_id_t v11 = +[CSDateUtilities localStringFromDate:v10];
  }
  else
  {
    os_signpost_id_t v11 = @"before we saved timestamps";
  }
  uint64_t v34 = [v6 objectForKeyedSubscript:@"backup"];
  uint64_t v12 = [v6 objectForKeyedSubscript:@"keybag"];
  __int16 v35 = [v12 sha1Digest];
  uint64_t v13 = [v6 objectForKeyedSubscript:@"uuid"];
  id v14 = CloudServicesLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138413058;
    id v37 = v11;
    __int16 v38 = 2112;
    CFStringRef v39 = v35;
    __int16 v40 = 2112;
    uint64_t v41 = v9;
    __int16 v42 = 2112;
    CFStringRef v43 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "found backup from %@, keybag digest %@, metadataDigest %@, uuid %@", buf, 0x2Au);
  }

  id v33 = v11;
  if (v13)
  {
    BOOL v32 = v10;
    id v15 = v9;
    id v16 = v8;
    id v17 = v7;
    unint64_t v18 = (__CFString *)CFPreferencesCopyAppValue(@"EMCSBackupUUID", SECURE_BACKUP_SERVICE_NAME);
    unsigned int v19 = [(__CFString *)v18 isEqualToString:v13];
    id v20 = CloudServicesLog();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      id v7 = v17;
      if (v21)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Found matching backup from this device, skipping keychain restore", buf, 2u);
      }

      id v22 = 0;
      id v8 = v16;
      id v9 = v15;
      id v10 = v32;
      goto LABEL_29;
    }
    if (v21)
    {
      *(_DWORD *)long long buf = 138412290;
      id v37 = v18;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Backup does not match this device's last backup uuid (%@)", buf, 0xCu);
    }

    id v7 = v17;
    id v8 = v16;
    id v9 = v15;
    id v10 = v32;
    os_signpost_id_t v11 = v33;
  }
  id v23 = (void *)v34;
  if (v12 && v34)
  {
    id v22 = [(SecureBackupDaemon *)self restoreEMCSBackup:v34 keybag:v12 password:v7];
    goto LABEL_30;
  }
  id v24 = CloudServicesLog();
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  id v31 = v7;
  if (v34) {
    CFStringRef v26 = @"non-";
  }
  else {
    CFStringRef v26 = &stru_100072CF8;
  }
  if (v25)
  {
    if (v12) {
      CFStringRef v27 = @"non-";
    }
    else {
      CFStringRef v27 = &stru_100072CF8;
    }
    *(_DWORD *)long long buf = 138412546;
    id v37 = (__CFString *)v26;
    __int16 v38 = 2112;
    CFStringRef v39 = v27;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "attempted restore with backup = %@nil, keybag = %@nil", buf, 0x16u);
  }
  else if (v12)
  {
    CFStringRef v27 = @"non-";
  }
  else
  {
    CFStringRef v27 = &stru_100072CF8;
  }

  id v28 = objc_alloc_init((Class)NSMutableDictionary);
  id v29 = [objc_alloc((Class)NSString) initWithFormat:@"attempted restore with backup = %@nil, keybag = %@nil", v26, v27];
  [v28 setObject:v29 forKeyedSubscript:NSLocalizedDescriptionKey];

  id v22 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:v28];

  id v7 = v31;
LABEL_29:
  os_signpost_id_t v11 = v33;
  id v23 = (void *)v34;
LABEL_30:

  return v22;
}

- (void)recoverEscrowWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _CloudServicesSignpostLogSystem();
  os_signpost_id_t v9 = _CloudServicesSignpostCreate(v8);
  uint64_t v11 = v10;

  uint64_t v12 = _CloudServicesSignpostLogSystem();
  uint64_t v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    id v14 = [v6 activityLabel];
    *(_DWORD *)long long buf = 138543362;
    os_signpost_id_t v42 = (os_signpost_id_t)v14;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "RecoverEscrowWithRequest", " enableTelemetry=YES  Activity=%{public,signpost.telemetry:string1,name=Activity}@ ", buf, 0xCu);
  }
  id v15 = _CloudServicesSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [v6 activityLabel];
    *(_DWORD *)long long buf = 134218242;
    os_signpost_id_t v42 = v9;
    __int16 v43 = 2114;
    unsigned int v44 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RecoverEscrowWithRequest  enableTelemetry=YES  Activity=%{public,signpost.telemetry:string1,name=Activity}@ ", buf, 0x16u);
  }
  id v17 = CloudServicesLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v18 = [v6 recordID];
    unsigned int v19 = [v6 metadata];
    *(_DWORD *)long long buf = 138412546;
    os_signpost_id_t v42 = (os_signpost_id_t)v18;
    __int16 v43 = 2112;
    unsigned int v44 = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Attempting recovery of record %@ with metadata: %@", buf, 0x16u);
  }
  id v20 = [EscrowService alloc];
  BOOL v21 = [(SecureBackupDaemon *)self operationsLogger];
  id v22 = [(EscrowService *)v20 initWithOperationsLogger:v21];

  id v23 = _CloudServicesSignpostLogSystem();
  os_signpost_id_t v24 = _CloudServicesSignpostCreate(v23);
  uint64_t v26 = v25;

  CFStringRef v27 = _CloudServicesSignpostLogSystem();
  id v28 = v27;
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    id v29 = [v6 activityLabel];
    *(_DWORD *)long long buf = 138543362;
    os_signpost_id_t v42 = (os_signpost_id_t)v29;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_BEGIN, v24, "RecoverRecordWithRequest", " enableTelemetry=YES  Activity=%{public,signpost.telemetry:string1,name=Activity}@ ", buf, 0xCu);
  }
  double v30 = _CloudServicesSignpostLogSystem();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    id v31 = [v6 activityLabel];
    *(_DWORD *)long long buf = 134218242;
    os_signpost_id_t v42 = v24;
    __int16 v43 = 2114;
    unsigned int v44 = v31;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RecoverRecordWithRequest  enableTelemetry=YES  Activity=%{public,signpost.telemetry:string1,name=Activity}@ ", buf, 0x16u);
  }
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000232BC;
  void v34[3] = &unk_100071760;
  uint64_t v38 = v26;
  os_signpost_id_t v39 = v9;
  uint64_t v40 = v11;
  id v36 = v7;
  os_signpost_id_t v37 = v24;
  v34[4] = self;
  id v35 = v6;
  id v32 = v6;
  id v33 = v7;
  [(EscrowService *)v22 recoverRecordWithRequest:v32 completionBlock:v34];
}

- (id)keysOfEntriesContainingObject:(id)a3 backups:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000244A8;
  v8[3] = &unk_1000710B8;
  id v9 = a3;
  id v5 = v9;
  id v6 = [a4 keysOfEntriesPassingTest:v8];

  return v6;
}

- (int64_t)compareEscrowDatesBetweenCurrentRecord:(id)a3 andCandidateRecord:(id)a4
{
  id v5 = a4;
  id v6 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[a3 creationDate]);
  id v7 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v5 creationDate]);
  id v8 = [v6 compare:v7];
  id v9 = CloudServicesLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8 == (id)-1)
  {
    if (v10)
    {
      uint64_t v11 = [v5 recordId];
      int v14 = 138412290;
      id v15 = v11;
      uint64_t v12 = "candidate record (%@) is newer";
      goto LABEL_6;
    }
  }
  else if (v10)
  {
    uint64_t v11 = [v5 recordId];
    int v14 = 138412290;
    id v15 = v11;
    uint64_t v12 = "candidate record (%@) is not newer";
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v14, 0xCu);
  }
  return (int64_t)v8;
}

- (int64_t)compare:(id)a3 with:(id)a4 backups:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 escrowInformationMetadata];
  uint64_t v12 = [v11 backupKeybagDigest];

  uint64_t v13 = [v9 escrowInformationMetadata];
  uint64_t v14 = [v13 backupKeybagDigest];

  id v15 = [(SecureBackupDaemon *)self keysOfEntriesContainingObject:v12 backups:v10];
  id v16 = (void *)v14;
  id v43 = v10;
  id v17 = [(SecureBackupDaemon *)self keysOfEntriesContainingObject:v14 backups:v10];
  unint64_t v18 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v8 creationDate]);
  id v44 = v9;
  uint64_t v19 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v9 creationDate]);
  id v45 = (void *)v19;
  if ([v15 isEqualToSet:v17])
  {
    int64_t v20 = (int64_t)[v18 compare:v19];
    BOOL v21 = CloudServicesLog();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    id v23 = v18;
    os_signpost_id_t v24 = v16;
    if (v20 == -1)
    {
      uint64_t v25 = v43;
      if (v22)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "candidate can recover same views but is newer", buf, 2u);
      }
      int64_t v20 = -1;
    }
    else
    {
      uint64_t v25 = v43;
      if (v22)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "candidate can recover same views but is not newer", buf, 2u);
      }
    }
    uint64_t v34 = v44;
    goto LABEL_30;
  }
  uint64_t v41 = v12;
  id v42 = v8;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v26 = [&off_100076018 countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (!v26) {
    goto LABEL_14;
  }
  id v27 = v26;
  uint64_t v28 = *(void *)v47;
  while (2)
  {
    for (i = 0; i != v27; i = (char *)i + 1)
    {
      if (*(void *)v47 != v28) {
        objc_enumerationMutation(&off_100076018);
      }
      uint64_t v30 = *(void *)(*((void *)&v46 + 1) + 8 * i);
      id v31 = [v15 compareMembershipOfObject:v30 withSet:v17];
      int64_t v20 = (int64_t)v31;
      if (v31 == (id)1)
      {
        BOOL v21 = CloudServicesLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v51 = v30;
          id v35 = "candidate cannot recover %@";
LABEL_26:
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v35, buf, 0xCu);
        }
LABEL_27:
        uint64_t v12 = v41;
        id v8 = v42;
        os_signpost_id_t v24 = v16;
        uint64_t v34 = v44;
        goto LABEL_28;
      }
      if (v31 == (id)-1)
      {
        BOOL v21 = CloudServicesLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v51 = v30;
          id v35 = "candidate can recover %@";
          goto LABEL_26;
        }
        goto LABEL_27;
      }
    }
    id v27 = [&off_100076018 countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (v27) {
      continue;
    }
    break;
  }
LABEL_14:
  id v32 = [v15 countOfObjectsWithPrefix:@"PCS"];
  id v33 = [v17 countOfObjectsWithPrefix:@"PCS"];
  if (v32 > v33)
  {
    BOOL v21 = CloudServicesLog();
    uint64_t v12 = v41;
    id v8 = v42;
    os_signpost_id_t v24 = v16;
    id v23 = v18;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "candidate can recover fewer PCS views", buf, 2u);
    }
    int64_t v20 = 1;
    uint64_t v25 = v43;
    uint64_t v34 = v44;
    goto LABEL_30;
  }
  uint64_t v12 = v41;
  os_signpost_id_t v24 = v16;
  if (v32 < v33)
  {
    BOOL v21 = CloudServicesLog();
    id v8 = v42;
    uint64_t v34 = v44;
    id v23 = v18;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      os_signpost_id_t v37 = "candidate can recover more PCS views";
      goto LABEL_41;
    }
    goto LABEL_42;
  }
  id v38 = [v15 count];
  id v8 = v42;
  uint64_t v34 = v44;
  if (v38 > [v17 count])
  {
    BOOL v21 = CloudServicesLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "candidate can recover fewer total views", buf, 2u);
    }
    int64_t v20 = 1;
LABEL_28:
    id v23 = v18;
    goto LABEL_29;
  }
  id v39 = [v15 count];
  if (v39 < [v17 count])
  {
    BOOL v21 = CloudServicesLog();
    id v23 = v18;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      os_signpost_id_t v37 = "candidate can recover more total views";
LABEL_41:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v37, buf, 2u);
    }
LABEL_42:
    int64_t v20 = -1;
LABEL_29:
    uint64_t v25 = v43;
    goto LABEL_30;
  }
  id v23 = v18;
  int64_t v20 = (int64_t)[v18 compare:v45];
  BOOL v21 = CloudServicesLog();
  BOOL v40 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v20 == -1)
  {
    uint64_t v25 = v43;
    if (v40)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "candidate can recover same number of views but is newer", buf, 2u);
    }
    int64_t v20 = -1;
  }
  else
  {
    uint64_t v25 = v43;
    if (v40)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "candidate can recover same number of views but is not newer", buf, 2u);
    }
  }
LABEL_30:

  return v20;
}

- (void)sortForMatchingPassphraseLengthAndPlatform:(id)a3 secureBackups:(id)a4 passphraseLength:(unint64_t)a5 platform:(unint64_t)a6 reply:(id)a7
{
  id v9 = a3;
  id v57 = a4;
  id v10 = (void (**)(id, void *, void *, void))a7;
  uint64_t v11 = CloudServicesLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    unint64_t v73 = a5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "looking for record for silent attempt of passphrase length %llu", buf, 0xCu);
  }

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v12 = v9;
  id v67 = [v12 countByEnumeratingWithState:&v68 objects:v76 count:16];
  if (!v67)
  {
    v62 = 0;
    NSErrorUserInfoKey v52 = 0;
    BOOL v50 = 0;
    uint64_t v53 = v12;
    unint64_t v54 = a5;
    goto LABEL_82;
  }
  NSErrorUserInfoKey v56 = v10;
  unsigned int v60 = 0;
  id v61 = 0;
  v62 = 0;
  uint64_t v13 = &CC_SHA1_ptr;
  uint64_t v66 = *(void *)v69;
  unint64_t v65 = a5;
  BOOL v63 = v12;
  do
  {
    uint64_t v14 = 0;
    do
    {
      if (*(void *)v69 != v66) {
        objc_enumerationMutation(v12);
      }
      id v15 = *(void **)(*((void *)&v68 + 1) + 8 * (void)v14);
      id v17 = objc_msgSend(v13[307], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v15, "creationDate"));
      unint64_t v18 = [v15 recordId];
      uint64_t v19 = CloudServicesLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v20 = +[CSDateUtilities localStringFromDate:v17];
        *(_DWORD *)long long buf = 138412546;
        unint64_t v73 = (unint64_t)v18;
        __int16 v74 = 2112;
        unint64_t v75 = (unint64_t)v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "checking escrow record: %@ from %@", buf, 0x16u);
      }
      id v21 = [v15 remainingAttempts];
      id v22 = [v15 silentAttemptAllowed];
      if (v21 == (id)10 && v22 != 0)
      {
        id v26 = [v15 escrowInformationMetadata];
        id v27 = [v15 escrowInformationMetadata];
        uint64_t v28 = [v27 clientMetadata];

        id v29 = CloudServicesLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          unint64_t v73 = (unint64_t)v26;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "metadata containing bottle: %@", buf, 0xCu);
        }

        id v31 = [v28 devicePlatform];
        id v32 = [v28 secureBackupUsesNumericPassphrase];
        if (v31 == (id)a6)
        {
          if (v32)
          {
            id v33 = [v28 secureBackupNumericPassphraseLength];
            uint64_t v34 = CloudServicesLog();
            BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
            if ((unint64_t)v33 > a5)
            {
              if (v35)
              {
                *(_DWORD *)long long buf = 134218240;
                unint64_t v73 = (unint64_t)v33;
                __int16 v74 = 2048;
                unint64_t v75 = a5;
                id v36 = v34;
                os_signpost_id_t v37 = "escrow passphrase length (%llu) longer than silent attempt passphrase (%llu), skipping";
                uint32_t v38 = 22;
                goto LABEL_29;
              }
              goto LABEL_30;
            }
            if (v35)
            {
              *(_DWORD *)long long buf = 134217984;
              unint64_t v73 = (unint64_t)v33;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "found clean record with passwordLength: %llu", buf, 0xCu);
            }

            if (_os_feature_enabled_impl())
            {
              id v42 = v62;
              if (!v62
                || [(SecureBackupDaemon *)self compareEscrowDatesBetweenCurrentRecord:v62 andCandidateRecord:v15])
              {
                id v43 = CloudServicesLog();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                {
                  CFStringRef v44 = @"better";
                  if (!v62) {
                    CFStringRef v44 = @"first";
                  }
                  goto LABEL_66;
                }
                goto LABEL_67;
              }
              uint64_t v34 = CloudServicesLog();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
LABEL_71:
                *(_WORD *)long long buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "keeping current candidate", buf, 2u);
              }
LABEL_72:
              id v33 = (id)v65;
            }
            else
            {
              id v42 = v62;
              if (v62
                && [(SecureBackupDaemon *)self compare:v62 with:v15 backups:v57] != -1)
              {
                uint64_t v34 = CloudServicesLog();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_71;
                }
                goto LABEL_72;
              }
              id v43 = CloudServicesLog();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
              {
                CFStringRef v44 = @"better";
                if (!v62) {
                  CFStringRef v44 = @"first";
                }
LABEL_66:
                *(_DWORD *)long long buf = 138412290;
                unint64_t v73 = (unint64_t)v44;
                _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "found %@ candidate", buf, 0xCu);
              }
LABEL_67:

              id v47 = v15;
              id v48 = v18;

              uint64_t v34 = v61;
              unsigned int v60 = v48;
              id v61 = v26;
              v62 = v47;
            }
            uint64_t v13 = &CC_SHA1_ptr;
LABEL_31:

            unint64_t v65 = (unint64_t)v33;
            uint64_t v12 = v63;
            goto LABEL_32;
          }
          if (_os_feature_enabled_impl())
          {
            id v39 = v62;
            if (!v62
              || [(SecureBackupDaemon *)self compareEscrowDatesBetweenCurrentRecord:v62 andCandidateRecord:v15])
            {
              BOOL v40 = CloudServicesLog();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                CFStringRef v41 = @"better";
                if (!v62) {
                  CFStringRef v41 = @"first";
                }
                goto LABEL_61;
              }
              goto LABEL_62;
            }
            uint64_t v34 = CloudServicesLog();
            if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_30;
            }
          }
          else
          {
            id v39 = v62;
            if (!v62 || [(SecureBackupDaemon *)self compare:v62 with:v15 backups:v57] == -1)
            {
              BOOL v40 = CloudServicesLog();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                CFStringRef v41 = @"better";
                if (!v62) {
                  CFStringRef v41 = @"first";
                }
LABEL_61:
                *(_DWORD *)long long buf = 138412290;
                unint64_t v73 = (unint64_t)v41;
                _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "found %@ candidate", buf, 0xCu);
              }
LABEL_62:

              id v45 = v15;
              id v46 = v18;

              uint64_t v34 = v61;
              unsigned int v60 = v46;
              id v61 = v26;
              id v33 = (id)a5;
              v62 = v45;
              goto LABEL_31;
            }
            uint64_t v34 = CloudServicesLog();
            if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_30;
            }
          }
          *(_WORD *)long long buf = 0;
          id v36 = v34;
          os_signpost_id_t v37 = "keeping current candidate";
        }
        else
        {
          uint64_t v34 = CloudServicesLog();
          if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_30;
          }
          *(_WORD *)long long buf = 0;
          id v36 = v34;
          os_signpost_id_t v37 = "escrow record not same platform, skipping";
        }
        uint32_t v38 = 2;
LABEL_29:
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, v37, buf, v38);
LABEL_30:
        id v33 = (id)v65;
        goto LABEL_31;
      }
      id v24 = v22;
      id v26 = CloudServicesLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134218242;
        CFStringRef v25 = &stru_100072CF8;
        if (!v24) {
          CFStringRef v25 = @"not ";
        }
        unint64_t v73 = (unint64_t)v21;
        __int16 v74 = 2112;
        unint64_t v75 = (unint64_t)v25;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "candidate not eligible: remaining attempts = %llu, silent attempt %@allowed", buf, 0x16u);
      }
LABEL_32:

      uint64_t v14 = (char *)v14 + 1;
    }
    while (v67 != v14);
    id v49 = [v12 countByEnumeratingWithState:&v68 objects:v76 count:16];
    id v67 = v49;
  }
  while (v49);

  BOOL v50 = v60;
  if (v60)
  {
    uint64_t v51 = CloudServicesLog();
    id v10 = v56;
    NSErrorUserInfoKey v52 = v61;
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      sub_10004BAC8();
    }

    uint64_t v53 = CloudServicesLog();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      sub_10004BA3C(v62, v53);
    }
    unint64_t v54 = v65;
LABEL_82:

    unint64_t v55 = v54;
  }
  else
  {
    id v10 = v56;
    NSErrorUserInfoKey v52 = v61;
    unint64_t v55 = v65;
  }
  v10[2](v10, v50, v52, v55);
}

- (void)_recoverSilentWithCDPContext:(id)a3 allRecords:(id)a4 reply:(id)a5
{
  id v51 = a3;
  id v48 = a4;
  id v49 = a5;
  id v8 = CloudServicesLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[SecureBackupDaemon _recoverSilentWithCDPContext:allRecords:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "In %s", (uint8_t *)&buf, 0xCu);
  }

  BOOL v50 = +[OTEscrowTranslation CDPRecordContextToDictionary:v51];
  id v9 = [objc_alloc((Class)SecureBackup) initWithUserActivityLabel:@"silent escrow recovery"];
  [v9 populateWithInfo:v50];
  id v10 = [(SecureBackupDaemon *)self connectionQueue];
  [v9 setQueue:v10];

  uint64_t v11 = [v9 error];

  if (!v11)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v75 = 0x3032000000;
    CFStringRef v76 = sub_100011AB0;
    id v77 = sub_100011AC0;
    id v78 = (id)0xAAAAAAAAAAAAAAAALL;
    id v78 = (id)os_transaction_create();
    id v15 = CloudServicesLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10004BBCC();
    }

    id v16 = [v9 passphrase];
    BOOL v17 = [v16 length] == 0;

    if (!v17) {
      goto LABEL_8;
    }
    if ([v9 useCachedPassphrase])
    {
      BOOL v40 = [(SecureBackupDaemon *)self cachedPassphrase];
      [v9 setPassphrase:v40];

      CFStringRef v41 = [v9 passphrase];
      BOOL v42 = [v41 length] == 0;

      if (!v42)
      {
LABEL_8:
        unint64_t v18 = [v9 passphrase];
        id v47 = [v18 length];

        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v19 = v48;
        id v20 = [v19 countByEnumeratingWithState:&v61 objects:v69 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v62;
          while (2)
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v62 != v21) {
                objc_enumerationMutation(v19);
              }
              id v23 = *(void **)(*((void *)&v61 + 1) + 8 * i);
              id v24 = objc_msgSend(v23, "recordId", v47);
              if (v24)
              {
                CFStringRef v25 = [(SecureBackupDaemon *)self cachedRecordID];
                unsigned int v26 = [v25 isEqualToString:v24];

                if (v26)
                {
                  uint64_t v30 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v23 creationDate]);
                  id v31 = CloudServicesLog();
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                  {
                    id v32 = +[CSDateUtilities localStringFromDate:v30];
                    *(_DWORD *)unint64_t v65 = 138412546;
                    uint64_t v66 = v24;
                    __int16 v67 = 2112;
                    long long v68 = v32;
                    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "found preferred record: %@ from %@", v65, 0x16u);
                  }
                  [v9 setRecordID:v24];
                  id v33 = [v23 escrowInformationMetadata];
                  uint64_t v34 = +[OTEscrowTranslation metadataToDictionary:v33];
                  [v9 setMetadata:v34];

                  BOOL v35 = CloudServicesLog();
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                  {
                    id v36 = [v9 metadata];
                    *(_DWORD *)unint64_t v65 = 138412290;
                    uint64_t v66 = v36;
                    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "using metadata :%@", v65, 0xCu);
                  }
                  os_signpost_id_t v37 = [(SecureBackupDaemon *)self cachedRecordID];
                  unsigned int v38 = [v37 isEqualToString:v24];

                  if (v38)
                  {
                    id v39 = [(SecureBackupDaemon *)self cachedRecordIDPassphrase];
                    [v9 setPassphrase:v39];
                  }
                  else
                  {
                    id v39 = [v9 passphrase];
                    CFStringRef v44 = [v39 substringToIndex:v47];
                    [v9 setPassphrase:v44];
                  }
                  v58[0] = _NSConcreteStackBlock;
                  v58[1] = 3221225472;
                  v58[2] = sub_100026018;
                  v58[3] = &unk_100071788;
                  id v59 = v49;
                  p_long long buf = &buf;
                  [(SecureBackupDaemon *)self recoverEscrowWithRequest:v9 reply:v58];

                  uint64_t v28 = v19;
                  goto LABEL_40;
                }
              }
            }
            id v20 = [v19 countByEnumeratingWithState:&v61 objects:v69 count:16];
            if (v20) {
              continue;
            }
            break;
          }
        }

        id v27 = CloudServicesLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)unint64_t v65 = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "sorting through backups!", v65, 2u);
        }

        uint64_t v28 = [(SecureBackupDaemon *)self secureBackups];
        if ([v28 count]
          || !OctagonPlatformSupportsSOS()
          || _os_feature_enabled_impl())
        {
          v54[0] = _NSConcreteStackBlock;
          v54[1] = 3221225472;
          v54[2] = sub_100026068;
          v54[3] = &unk_1000717B0;
          v57[0] = v49;
          id v55 = v9;
          NSErrorUserInfoKey v56 = self;
          v57[1] = &buf;
          [(SecureBackupDaemon *)self sortForMatchingPassphraseLengthAndPlatform:v19 secureBackups:v28 passphraseLength:v47 platform:1 reply:v54];

          id v29 = (void **)v57;
        }
        else
        {
          id v46 = CloudServicesLog();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
            sub_10004BB98();
          }

          v52[0] = _NSConcreteStackBlock;
          v52[1] = 3221225472;
          v52[2] = sub_1000263B0;
          v52[3] = &unk_1000713F8;
          id v53 = v49;
          [(SecureBackupDaemon *)self _recoverWithRequest:v9 reply:v52];
          id v29 = &v53;
        }
        id v24 = *v29;
        goto LABEL_40;
      }
      id v43 = CloudServicesLog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unint64_t v65 = 0;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Missing cached passphrase", v65, 2u);
      }

      NSErrorUserInfoKey v72 = NSLocalizedDescriptionKey;
      CFStringRef v73 = @"Missing cached passphrase";
      uint64_t v28 = +[NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
      id v24 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:9 userInfo:v28];
      (*((void (**)(id, void, void *))v49 + 2))(v49, 0, v24);
    }
    else
    {
      id v45 = CloudServicesLog();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unint64_t v65 = 0;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "attempted to recover with empty passphrase", v65, 2u);
      }

      NSErrorUserInfoKey v70 = NSLocalizedDescriptionKey;
      CFStringRef v71 = @"attempted to recover with empty passphrase";
      uint64_t v28 = +[NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
      id v24 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:4 userInfo:v28];
      (*((void (**)(id, void, void *))v49 + 2))(v49, 0, v24);
    }
LABEL_40:

    _Block_object_dispose(&buf, 8);
    goto LABEL_41;
  }
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  [v12 setObject:@"error decoding request properties" forKeyedSubscript:NSLocalizedDescriptionKey];
  uint64_t v13 = [v9 error];
  [v12 setObject:v13 forKeyedSubscript:NSUnderlyingErrorKey];

  uint64_t v14 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:5 userInfo:v12];
  (*((void (**)(id, void, void *))v49 + 2))(v49, 0, v14);

LABEL_41:
}

- (void)_recoverWithCDPContext:(id)a3 escrowRecord:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  uint64_t v11 = CloudServicesLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[SecureBackupDaemon _recoverWithCDPContext:escrowRecord:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "In %s", (uint8_t *)&buf, 0xCu);
  }

  id v12 = [objc_alloc((Class)SecureBackup) initWithUserActivityLabel:@"escrow recovery"];
  uint64_t v13 = +[OTEscrowTranslation CDPRecordContextToDictionary:v8];
  [v12 populateWithInfo:v13];
  uint64_t v14 = [v9 escrowInformationMetadata];
  id v15 = +[OTEscrowTranslation metadataToDictionary:v14];
  [v12 setMetadata:v15];

  id v16 = [v9 recordId];
  [v12 setRecordID:v16];

  BOOL v17 = [(SecureBackupDaemon *)self connectionQueue];
  [v12 setQueue:v17];

  unint64_t v18 = [v12 error];

  if (v18)
  {
    id v19 = objc_alloc_init((Class)NSMutableDictionary);
    [v19 setObject:@"error decoding request properties" forKeyedSubscript:NSLocalizedDescriptionKey];
    id v20 = [v12 error];
    [v19 setObject:v20 forKeyedSubscript:NSUnderlyingErrorKey];

    uint64_t v21 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:5 userInfo:v19];
    v10[2](v10, 0, v21);
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v27 = 0x3032000000;
    uint64_t v28 = sub_100011AB0;
    id v29 = sub_100011AC0;
    id v30 = (id)0xAAAAAAAAAAAAAAAALL;
    id v30 = (id)os_transaction_create();
    id v22 = CloudServicesLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10004BC84();
    }

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100026874;
    v23[3] = &unk_100071788;
    id v24 = v10;
    p_long long buf = &buf;
    [(SecureBackupDaemon *)self recoverEscrowWithRequest:v12 reply:v23];

    _Block_object_dispose(&buf, 8);
  }
}

- (void)_restoreKeychainAsyncWithPassword:(id)a3 keybagDigest:(id)a4 haveBottledPeer:(BOOL)a5 viewsNotToBeRestored:(id)a6 reply:(id)a7
{
  BOOL v9 = a5;
  id v22 = a3;
  id v12 = a4;
  id v13 = a6;
  uint64_t v14 = (void (**)(id, void))a7;
  id v15 = CloudServicesLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v24 = "-[SecureBackupDaemon _restoreKeychainAsyncWithPassword:keybagDigest:haveBottledPeer:viewsNotToBeRestored:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  id v16 = (void *)os_transaction_create();
  BOOL v17 = CloudServicesLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_10004BD08();
  }

  id v18 = objc_alloc_init((Class)NSMutableSet);
  id v19 = [(SecureBackupDaemon *)self _KVSKeybag];
  id v20 = [v13 mutableCopy];
  id v21 = [v18 mutableCopy];
  [(SecureBackupDaemon *)self _restoreKeychainAsyncWithBackupBag:v19 password:v22 keybagDigest:v12 haveBottledPeer:v9 restoredViews:v21 viewsNotToBeRestored:v20];
  v14[2](v14, 0);
}

- (void)_recoverWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if ([v6 guitarfish] && objc_msgSend(v6, "guitarfishToken"))
  {
    id v8 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:5 userInfo:0];
    v7[2](v7, 0, v8);

    goto LABEL_10;
  }
  if ([v6 guitarfishToken])
  {
    [(SecureBackupDaemon *)self recoverGuitarfishTokenWithRequest:v6 reply:v7];
    goto LABEL_10;
  }
  BOOL v9 = CloudServicesLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[SecureBackupDaemon _recoverWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "In %s", (uint8_t *)&buf, 0xCu);
  }

  id v10 = [(SecureBackupDaemon *)self connectionQueue];
  [v6 setQueue:v10];

  uint64_t v11 = [v6 error];

  if (v11)
  {
    id v12 = objc_alloc_init((Class)NSMutableDictionary);
    [v12 setObject:@"error decoding request properties" forKeyedSubscript:NSLocalizedDescriptionKey];
    id v13 = [v6 error];
    [v12 setObject:v13 forKeyedSubscript:NSUnderlyingErrorKey];

    uint64_t v14 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:5 userInfo:v12];
    v7[2](v7, 0, v14);

    goto LABEL_10;
  }
  if ([v6 emcsMode])
  {
    id v15 = CloudServicesLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "performing EMCS recovery", (uint8_t *)&buf, 2u);
    }

    if ([(SecureBackupDaemon *)self backupAllowed])
    {
      id v16 = CloudServicesLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "skipping recovery, enable/recover already called", (uint8_t *)&buf, 2u);
      }
LABEL_17:

      v7[2](v7, 0, 0);
      goto LABEL_10;
    }
    uint64_t v71 = 0;
    id v72 = 0;
    if (MKBUserSessionRetrieveSecureBackupBlob())
    {
      id v16 = CloudServicesLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10004BD8C();
      }
      goto LABEL_17;
    }
    id v29 = CloudServicesLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_10004BF34();
    }

    id v30 = objc_alloc_init((Class)NSMutableDictionary);
    [v30 setObject:v72 forKeyedSubscript:NSUnderlyingErrorKey];

    id v31 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:v30];
    v7[2](v7, 0, v31);
  }
  else
  {
    if ([v6 idmsRecovery])
    {
      BOOL v17 = CloudServicesLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Performing IDMS Recovery", (uint8_t *)&buf, 2u);
      }

      [v6 setIcdp:1];
      [v6 setUseRecoveryPET:1];
      id v18 = [EscrowService alloc];
      id v19 = [(SecureBackupDaemon *)self operationsLogger];
      id v20 = [(EscrowService *)v18 initWithOperationsLogger:v19];

      v67[0] = _NSConcreteStackBlock;
      v67[1] = 3221225472;
      v67[2] = sub_1000285FC;
      v67[3] = &unk_100071850;
      NSErrorUserInfoKey v70 = v7;
      id v68 = v6;
      long long v69 = self;
      [(EscrowService *)v20 recoverRecordWithRequest:v68 completionBlock:v67];

      goto LABEL_10;
    }
    if ([v6 fmipRecovery])
    {
      id v21 = CloudServicesLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Performing FMIP recovery", (uint8_t *)&buf, 2u);
      }

      [v6 setIcdp:1];
      id v22 = [EscrowService alloc];
      id v23 = [(SecureBackupDaemon *)self operationsLogger];
      id v24 = [(EscrowService *)v22 initWithOperationsLogger:v23];

      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472;
      v65[2] = sub_100028B80;
      v65[3] = &unk_1000713F8;
      uint64_t v66 = v7;
      [(EscrowService *)v24 recoverRecordWithRequest:v6 completionBlock:v65];

      goto LABEL_10;
    }
    if ([v6 stingray])
    {
      CFStringRef v25 = CloudServicesLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Performing Stingray recovery", (uint8_t *)&buf, 2u);
      }

      unsigned int v26 = [EscrowService alloc];
      uint64_t v27 = [(SecureBackupDaemon *)self operationsLogger];
      uint64_t v28 = [(EscrowService *)v26 initWithOperationsLogger:v27];

      v63[0] = _NSConcreteStackBlock;
      v63[1] = 3221225472;
      v63[2] = sub_100028EF4;
      v63[3] = &unk_1000713F8;
      long long v64 = v7;
      [(EscrowService *)v28 recoverRecordWithRequest:v6 completionBlock:v63];

      goto LABEL_10;
    }
    if (![v6 silent] || !objc_msgSend(v6, "usesRecoveryKey")) {
      goto LABEL_40;
    }
    id v32 = CloudServicesLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Using cached recovery key", (uint8_t *)&buf, 2u);
    }

    id v33 = [(SecureBackupDaemon *)self cachedRecoveryKey];
    [v6 setRecoveryKey:v33];

    uint64_t v34 = [v6 recoveryKey];
    LODWORD(v33) = v34 == 0;

    if (!v33)
    {
LABEL_40:
      BOOL v35 = [v6 passphrase];
      BOOL v36 = [v35 length] == 0;

      if (v36)
      {
        if (![v6 useCachedPassphrase])
        {
          id v48 = CloudServicesLog();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "attempted to recover with empty passphrase", (uint8_t *)&buf, 2u);
          }

          NSErrorUserInfoKey v73 = NSLocalizedDescriptionKey;
          CFStringRef v74 = @"attempted to recover with empty passphrase";
          id v49 = +[NSDictionary dictionaryWithObjects:&v74 forKeys:&v73 count:1];
          BOOL v50 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:4 userInfo:v49];
          v7[2](v7, 0, v50);

          goto LABEL_10;
        }
        BOOL v42 = [(SecureBackupDaemon *)self cachedPassphrase];
        [v6 setPassphrase:v42];

        id v43 = [v6 passphrase];
        BOOL v44 = [v43 length] == 0;

        if (v44)
        {
          id v45 = CloudServicesLog();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Missing cached passphrase", (uint8_t *)&buf, 2u);
          }

          NSErrorUserInfoKey v75 = NSLocalizedDescriptionKey;
          CFStringRef v76 = @"Missing cached passphrase";
          id v46 = +[NSDictionary dictionaryWithObjects:&v76 forKeys:&v75 count:1];
          id v47 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:9 userInfo:v46];
          v7[2](v7, 0, v47);

          goto LABEL_10;
        }
      }
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v78 = 0x3032000000;
      uint64_t v79 = sub_100011AB0;
      id v80 = sub_100011AC0;
      id v81 = (id)0xAAAAAAAAAAAAAAAALL;
      id v81 = (id)os_transaction_create();
      if (([v6 icdp] & 1) != 0 || -[SecureBackupDaemon _usesEscrow](self, "_usesEscrow"))
      {
        if ([v6 icdp] && objc_msgSend(v6, "silent"))
        {
          os_signpost_id_t v37 = CloudServicesLog();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            sub_10004BFD0();
          }

          unsigned int v38 = [v6 passphrase];
          id v39 = [v38 length];
          v58[0] = _NSConcreteStackBlock;
          v58[1] = 3221225472;
          v58[2] = sub_1000294B4;
          v58[3] = &unk_100071878;
          long long v61 = v7;
          id v59 = v6;
          unsigned int v60 = self;
          p_long long buf = &buf;
          [(SecureBackupDaemon *)self recordIDAndMetadataForSilentAttempt:v59 passphraseLength:v39 platform:1 reply:v58];

          BOOL v40 = v61;
        }
        else
        {
          CFStringRef v41 = CloudServicesLog();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
            sub_10004BC84();
          }

          v55[0] = _NSConcreteStackBlock;
          v55[1] = 3221225472;
          v55[2] = sub_100029734;
          v55[3] = &unk_100071788;
          NSErrorUserInfoKey v56 = v7;
          id v57 = &buf;
          [(SecureBackupDaemon *)self recoverEscrowWithRequest:v6 reply:v55];
          BOOL v40 = v56;
        }
      }
      else
      {
        id v51 = CloudServicesLog();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
          sub_10004C004();
        }

        v7[2](v7, 0, 0);
        BOOL v40 = *(void **)(*((void *)&buf + 1) + 40);
        *(void *)(*((void *)&buf + 1) + 40) = 0;
      }

      _Block_object_dispose(&buf, 8);
      goto LABEL_10;
    }
    NSErrorUserInfoKey v52 = CloudServicesLog();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
      sub_10004BF9C();
    }

    id v53 = objc_alloc_init((Class)NSMutableDictionary);
    [v53 setObject:@"silent attempt with missing cached recovery key" forKeyedSubscript:NSLocalizedDescriptionKey];
    unint64_t v54 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:5 userInfo:v53];
    v7[2](v7, 0, v54);
  }
LABEL_10:
}

- (void)recoverWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  kdebug_trace();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100029874;
  v10[3] = &unk_1000714F8;
  id v11 = (id)os_transaction_create();
  id v12 = v6;
  id v8 = v11;
  id v9 = v6;
  [(SecureBackupDaemon *)self _recoverWithRequest:v7 reply:v10];
}

- (void)recoverWithCDPContextInDaemon:(id)a3 escrowRecord:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  kdebug_trace();
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100029A10;
  v13[3] = &unk_1000714F8;
  id v14 = (id)os_transaction_create();
  id v15 = v8;
  id v11 = v14;
  id v12 = v8;
  [(SecureBackupDaemon *)self _recoverWithCDPContext:v10 escrowRecord:v9 reply:v13];
}

- (void)recoverSilentWithCDPContextInDaemon:(id)a3 allRecords:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  kdebug_trace();
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100029BAC;
  v13[3] = &unk_1000714F8;
  id v14 = (id)os_transaction_create();
  id v15 = v8;
  id v11 = v14;
  id v12 = v8;
  [(SecureBackupDaemon *)self _recoverSilentWithCDPContext:v10 allRecords:v9 reply:v13];
}

- (void)restoreKeychainWithBackupPasswordInDaemon:(id)a3 reply:(id)a4
{
  id v6 = (void (**)(id, BOOL, id))a4;
  id v7 = a3;
  kdebug_trace();
  id v10 = 0;
  BOOL v8 = [(SecureBackupDaemon *)self _restoreKeychainWithBackupPassword:v7 keybagDigest:0 error:&v10];

  id v9 = v10;
  kdebug_trace();
  v6[2](v6, v8, v9);
}

- (void)removeRecoveryKeyFromBackupInDaemon:(id)a3
{
  id v7 = 0;
  id v4 = (void (**)(id, BOOL, id))a3;
  BOOL v5 = [(SecureBackupDaemon *)self removeRecoveryKey:&v7];
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (BOOL)removeRecoveryKey:(id *)a3
{
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = sub_100011AB0;
  BOOL v35 = sub_100011AC0;
  id v36 = 0;
  uint64_t v28 = 0;
  v29[0] = &v28;
  v29[1] = 0x2020000000;
  char v30 = 0;
  uint64_t v25 = 0;
  v26[0] = &v25;
  v26[1] = 0x2020000000;
  char v27 = 0;
  BOOL v5 = [(SecureBackupDaemon *)self kvsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029FD4;
  block[3] = &unk_1000718A0;
  block[4] = self;
  void block[5] = &v31;
  block[6] = &v28;
  block[7] = &v25;
  dispatch_sync(v5, block);

  if (*(unsigned char *)(v29[0] + 24) && *(unsigned char *)(v26[0] + 24))
  {
    id v6 = CloudServicesLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "recovery key removed from iCloudIdentity and PCS keybags", v23, 2u);
    }

    BOOL v7 = 1;
  }
  else
  {
    BOOL v8 = CloudServicesLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10004C140((uint64_t)v29, v8, v9, v10, v11, v12, v13, v14);
    }

    id v15 = CloudServicesLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10004C0CC((uint64_t)v26, v15, v16, v17, v18, v19, v20, v21);
    }

    BOOL v7 = 0;
    if (a3) {
      *a3 = (id) v32[5];
    }
  }
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v31, 8);

  return v7;
}

- (void)verifyRecoveryKeyInDaemon:(id)a3 reply:(id)a4
{
  id v9 = 0;
  id v6 = (void (**)(id, BOOL, id))a4;
  BOOL v7 = [(SecureBackupDaemon *)self verifyRecoveryKey:a3 error:&v9];
  id v8 = v9;
  v6[2](v6, v7, v8);
}

- (BOOL)verifyRecoveryKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v29 = 0;
  char v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = sub_100011AB0;
  uint64_t v33 = sub_100011AC0;
  id v34 = 0;
  uint64_t v25 = 0;
  unsigned int v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  BOOL v7 = [(SecureBackupDaemon *)self backupQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002A980;
  block[3] = &unk_1000718C8;
  id v8 = v6;
  id v16 = v8;
  uint64_t v17 = self;
  uint64_t v18 = &v25;
  uint64_t v19 = &v29;
  uint64_t v20 = &v21;
  dispatch_sync(v7, block);

  if (*((unsigned char *)v26 + 24))
  {
    if (*((unsigned char *)v22 + 24))
    {
      id v9 = CloudServicesLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "recovery key verified against iCloudIdentity and PCSMasterKey keybags", buf, 2u);
      }
LABEL_12:

      BOOL v11 = 1;
      goto LABEL_13;
    }
LABEL_7:
    id v9 = CloudServicesLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (*((unsigned char *)v26 + 24)) {
        CFStringRef v10 = @"iCloudIdentity";
      }
      else {
        CFStringRef v10 = @"PCSMasterKey";
      }
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v36 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "recovery key verified against %@ keybag", buf, 0xCu);
    }
    goto LABEL_12;
  }
  if (*((unsigned char *)v22 + 24)) {
    goto LABEL_7;
  }
  uint64_t v13 = CloudServicesLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_10004C284();
  }

  BOOL v11 = 0;
  if (a4)
  {
    uint64_t v14 = (void *)v30[5];
    if (v14)
    {
      BOOL v11 = 0;
      *a4 = v14;
    }
  }
LABEL_13:

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v11;
}

- (void)isRecoveryKeySetInDaemon:(id)a3
{
  id v4 = (void (**)(id, BOOL, id))a3;
  BOOL v5 = +[NSUbiquitousKeyValueStore defaultStore];
  id v8 = 0;
  BOOL v6 = [(SecureBackupDaemon *)self hasRecoveryKeyInKVS:v5 error:&v8];
  id v7 = v8;
  v4[2](v4, v6, v7);
}

- (void)restoreKeychainAsyncWithPasswordInDaemon:(id)a3 keybagDigest:(id)a4 haveBottledPeer:(BOOL)a5 viewsNotToBeRestored:(id)a6 reply:(id)a7
{
  BOOL v8 = a5;
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  kdebug_trace();
  id v16 = (void *)os_transaction_create();
  uint64_t v17 = CloudServicesLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    char v24 = "-[SecureBackupDaemon restoreKeychainAsyncWithPasswordInDaemon:keybagDigest:haveBottledPeer:viewsNotToBeRestored:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10002B02C;
  v20[3] = &unk_100071548;
  id v21 = v16;
  id v22 = v12;
  id v18 = v16;
  id v19 = v12;
  [(SecureBackupDaemon *)self _restoreKeychainAsyncWithPassword:v15 keybagDigest:v14 haveBottledPeer:v8 viewsNotToBeRestored:v13 reply:v20];
}

- (void)recoverRecordContentsWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  BOOL v8 = (void *)os_transaction_create();
  id v9 = CloudServicesLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v21 = "-[SecureBackupDaemon recoverRecordContentsWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  CFStringRef v10 = [(SecureBackupDaemon *)self connectionQueue];
  [v6 setQueue:v10];

  BOOL v11 = [v6 error];

  if (v11)
  {
    id v12 = (EscrowService *)objc_alloc_init((Class)NSMutableDictionary);
    [(EscrowService *)v12 setObject:@"error decoding request properties" forKeyedSubscript:NSLocalizedDescriptionKey];
    id v13 = [v6 error];
    [(EscrowService *)v12 setObject:v13 forKeyedSubscript:NSUnderlyingErrorKey];

    id v14 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:5 userInfo:v12];
    v7[2](v7, 0, v14);
  }
  else
  {
    kdebug_trace();
    id v15 = [EscrowService alloc];
    id v16 = [(SecureBackupDaemon *)self operationsLogger];
    id v12 = [(EscrowService *)v15 initWithOperationsLogger:v16];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002B324;
    v17[3] = &unk_1000714F8;
    id v19 = v7;
    id v18 = v8;
    [(EscrowService *)v12 recoverRecordWithRequest:v6 completionBlock:v17];

    id v14 = v19;
  }
}

- (void)createICDPRecordWithRequest:(id)a3 recordContents:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  CFStringRef v10 = (void (**)(id, void *))a5;
  BOOL v11 = (void *)os_transaction_create();
  id v12 = CloudServicesLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    *(void *)id v49 = "-[SecureBackupDaemon createICDPRecordWithRequest:recordContents:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  if ((sub_100004254() & 1) == 0)
  {
    uint64_t v17 = CloudServicesLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      *(void *)id v49 = "-[SecureBackupDaemon createICDPRecordWithRequest:recordContents:reply:]";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s is only available on internal releases", buf, 0xCu);
    }

    id v18 = objc_alloc_init((Class)NSMutableDictionary);
    id v15 = v18;
    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    CFStringRef v20 = @"Invalid OS version for call";
    goto LABEL_28;
  }
  id v13 = [(SecureBackupDaemon *)self connectionQueue];
  [v8 setQueue:v13];

  id v14 = [v8 error];

  if (v14)
  {
    id v15 = objc_alloc_init((Class)NSMutableDictionary);
    [v15 setObject:@"error decoding request properties" forKeyedSubscript:NSLocalizedDescriptionKey];
    id v16 = [v8 error];
    [v15 setObject:v16 forKeyedSubscript:NSUnderlyingErrorKey];

LABEL_29:
    char v28 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:5 userInfo:v15];
    v10[2](v10, v28);
    goto LABEL_30;
  }
  if (![v8 icdp]
    || ![v8 usesMultipleiCSC]
    || ([v8 passphrase],
        id v21 = objc_claimAutoreleasedReturnValue(),
        id v22 = [v21 length],
        v21,
        !v22))
  {
    unsigned int v38 = CloudServicesLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      *(void *)id v49 = "-[SecureBackupDaemon createICDPRecordWithRequest:recordContents:reply:]";
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "In %s, request doesn't look right", buf, 0xCu);
    }

    id v39 = CloudServicesLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v40 = [v8 icdp];
      unsigned int v41 = [v8 usesMultipleiCSC];
      BOOL v42 = [v8 passphrase];
      id v43 = [v42 length];
      CFStringRef v44 = @"present";
      *(_DWORD *)long long buf = 67109634;
      *(_DWORD *)id v49 = v40;
      if (!v43) {
        CFStringRef v44 = @"not present";
      }
      *(_WORD *)&v49[4] = 1024;
      *(_DWORD *)&v49[6] = v41;
      __int16 v50 = 2112;
      CFStringRef v51 = v44;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "request: icdp:%d multipleICSC:%d passphrase:%@", buf, 0x18u);
    }
    id v18 = objc_alloc_init((Class)NSMutableDictionary);
    id v15 = v18;
    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    CFStringRef v20 = @"Request must be a multiple-icsc request with a passphrase";
LABEL_28:
    [v18 setObject:v20 forKeyedSubscript:v19];
    goto LABEL_29;
  }
  uint64_t v23 = [v8 dsid];

  if (!v23)
  {
    char v24 = CloudServicesLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "setting DSID", buf, 2u);
    }

    uint64_t v25 = sub_1000100D4();
    [v8 setDsid:v25];
  }
  id v15 = +[NSMutableDictionary dictionary];
  [v15 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecureBackupUsesMultipleiCSCKey];
  unsigned int v26 = +[NSDate now];
  uint64_t v27 = +[CSDateUtilities localStringFromDate:v26];
  [v15 setObject:v27 forKeyedSubscript:kSecureBackupTimestampKey];

  char v28 = [(SecureBackupDaemon *)self massageOutgoingMetadataFromRequest:v8];
  if (v28)
  {
    uint64_t v29 = +[NSDate now];
    [v28 setObject:v29 forKeyedSubscript:kSecureBackupMetadataTimestampKey];

    [v15 setObject:v28 forKeyedSubscript:kSecureBackupClientMetadataKey];
  }
  char v30 = [(SecureBackupDaemon *)self _gestaltValueForKey:@"SerialNumber"];
  [v15 setObject:v30 forKeyedSubscript:kSecureBackupSerialNumberKey];

  uint64_t v31 = [(SecureBackupDaemon *)self _gestaltValueForKey:@"BuildVersion"];
  [v15 setObject:v31 forKeyedSubscript:kSecureBackupBuildVersionKey];

  [v8 setMetadata:v15];
  id v32 = [v9 mutableCopy];
  if ([v8 requiresDoubleEnrollment])
  {
    uint64_t v33 = +[NSUUID UUID];
    id v34 = [v33 UUIDString];
    [v32 setObject:v34 forKeyedSubscript:@"DoubleEnrollmentPassword"];

    [v32 setObject:&off_100076060 forKeyedSubscript:@"DoubleEnrollmentVersion"];
  }
  [v8 setEscrowRecord:v32];
  BOOL v35 = [EscrowService alloc];
  CFStringRef v36 = [(SecureBackupDaemon *)self operationsLogger];
  os_signpost_id_t v37 = [(EscrowService *)v35 initWithOperationsLogger:v36];

  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_10002BAE0;
  v45[3] = &unk_1000714F8;
  id v47 = v10;
  id v46 = v11;
  [(EscrowService *)v37 storeRecordWithRequest:v8 completionBlock:v45];

LABEL_30:
}

- (void)_deleteAlliCDPRecordsWithContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 recordIDs];
  id v6 = [v5 count];

  if (v6)
  {
    id v7 = [v4 recordIDs];
    id v8 = [v7 objectAtIndex:0];

    id v9 = [v4 recordIDs];
    [v9 removeObjectAtIndex:0];

    CFStringRef v10 = [v4 request];
    [v10 setRecordID:v8];

    BOOL v11 = [v4 escrowService];
    id v12 = [v4 request];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10002BD34;
    v15[3] = &unk_1000718F0;
    id v16 = v4;
    uint64_t v17 = self;
    [v11 deleteRecordWithRequest:v12 completionBlock:v15];
  }
  else
  {
    id v13 = [v4 completionBlock];
    id v14 = [v4 deleteError];
    ((void (**)(void, void *))v13)[2](v13, v14);
  }
}

- (void)deleteAlliCDPRecordsWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = CloudServicesLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    NSErrorUserInfoKey v19 = "-[SecureBackupDaemon deleteAlliCDPRecordsWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  id v9 = [(SecureBackupDaemon *)self connectionQueue];
  [v6 setQueue:v9];

  CFStringRef v10 = [v6 error];

  if (v10)
  {
    BOOL v11 = (void (**)(id, void *))objc_alloc_init((Class)NSMutableDictionary);
    [v11 setObject:@"error decoding request properties" forKeyedSubscript:NSLocalizedDescriptionKey];
    id v12 = [v6 error];
    [v11 setObject:v12 forKeyedSubscript:NSUnderlyingErrorKey];

    id v13 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:5 userInfo:v11];
    v7[2](v7, v13);
  }
  else
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002C018;
    v14[3] = &unk_100071850;
    uint64_t v17 = v7;
    id v15 = v6;
    id v16 = self;
    [(SecureBackupDaemon *)self getAccountInfoWithRequest:v15 reply:v14];

    BOOL v11 = v17;
  }
}

- (void)backOffDateWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = CloudServicesLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v17 = "-[SecureBackupDaemon backOffDateWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  id v9 = [(SecureBackupDaemon *)self connectionQueue];
  [v6 setQueue:v9];

  CFStringRef v10 = [v6 error];

  if (v10)
  {
    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    [v11 setObject:@"error decoding request properties" forKeyedSubscript:NSLocalizedDescriptionKey];
    id v12 = [v6 error];
    [v11 setObject:v12 forKeyedSubscript:NSUnderlyingErrorKey];

    id v13 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:5 userInfo:v11];
    v7[2](v7, 0, v13);
  }
  else
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002C4A8;
    v14[3] = &unk_1000713F8;
    id v15 = v7;
    [(SecureBackupDaemon *)self getAccountInfoWithRequest:v6 reply:v14];
    id v11 = v15;
  }
}

- (void)setBackOffDateWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = CloudServicesLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    CFStringRef v44 = "-[SecureBackupDaemon setBackOffDateWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  id v9 = [(SecureBackupDaemon *)self connectionQueue];
  [v6 setQueue:v9];

  CFStringRef v10 = [v6 error];

  if (v10)
  {
    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    [v11 setObject:@"error decoding request properties" forKeyedSubscript:NSLocalizedDescriptionKey];
    id v12 = [v6 error];
    [v11 setObject:v12 forKeyedSubscript:NSUnderlyingErrorKey];

    id v13 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:5 userInfo:v11];
    v7[2](v7, v13);
  }
  else
  {
    id v14 = [v6 metadataHash];
    id v13 = [v14 objectForKeyedSubscript:kSecureBackupEncodedMetadataKey];

    id v15 = [v6 backOffDate];

    if (v15 && v13)
    {
      id v16 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v13 options:0];
      if (v16)
      {
        id v34 = 0;
        uint64_t v17 = +[NSPropertyListSerialization propertyListWithData:v16 options:0 format:0 error:&v34];
        id v11 = v34;
        if (v17)
        {
          id v18 = [v17 objectForKeyedSubscript:kSecureBackupClientMetadataKey];
          if (v18)
          {
            [v6 setStingray:1];
            [v6 setMetadata:v18];
            [(SecureBackupDaemon *)self updateMetadataWithRequest:v6 reply:v7];
          }
          else
          {
            char v30 = CloudServicesLog();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
              sub_10004C53C();
            }

            NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
            CFStringRef v36 = @"missing kSecureBackupClientMetadataKey";
            uint64_t v31 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
            uint64_t v32 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:4 userInfo:v31];

            v7[2](v7, (void *)v32);
            id v11 = (id)v32;
          }
        }
        else
        {
          char v28 = CloudServicesLog();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            sub_10004C4D4();
          }

          v37[0] = NSLocalizedDescriptionKey;
          v37[1] = NSUnderlyingErrorKey;
          v38[0] = @"metadata could not be decoded";
          v38[1] = v11;
          id v18 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
          uint64_t v29 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:5 userInfo:v18];

          v7[2](v7, (void *)v29);
          id v11 = (id)v29;
        }
      }
      else
      {
        uint64_t v27 = CloudServicesLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          sub_10004C4A0();
        }

        NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
        CFStringRef v40 = @"encodedMetadata not base64";
        uint64_t v17 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
        id v11 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:5 userInfo:v17];
        v7[2](v7, v11);
      }
    }
    else
    {
      uint64_t v33 = v13;
      NSErrorUserInfoKey v19 = CloudServicesLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10004C388(v6, v19);
      }

      id v20 = objc_alloc((Class)NSString);
      id v21 = [v6 metadataHash];
      if (v21) {
        CFStringRef v22 = @"have";
      }
      else {
        CFStringRef v22 = @"missing";
      }
      uint64_t v23 = [v6 backOffDate];
      if (v23) {
        CFStringRef v24 = @"have";
      }
      else {
        CFStringRef v24 = @"missing";
      }
      uint64_t v25 = [v6 encodedMetadata];
      if (v25) {
        CFStringRef v26 = @"have";
      }
      else {
        CFStringRef v26 = @"missing";
      }
      id v16 = [v20 initWithFormat:@"missing parameter: %@ metadataHash, %@ backOffDate, %@ encodedMetadata", v22, v24, v26];

      NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
      id v42 = v16;
      uint64_t v17 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      id v11 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:4 userInfo:v17];
      v7[2](v7, v11);
      id v13 = v33;
    }
  }
}

- (void)disableWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _CloudServicesSignpostLogSystem();
  os_signpost_id_t v9 = _CloudServicesSignpostCreate(v8);
  uint64_t v11 = v10;

  id v12 = _CloudServicesSignpostLogSystem();
  id v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    id v14 = [v6 activityLabel];
    *(_DWORD *)long long buf = 138543362;
    id v47 = v14;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "DisableWithRequest", " enableTelemetry=YES  Activity=%{public,signpost.telemetry:string1,name=Activity}@ ", buf, 0xCu);
  }
  id v15 = _CloudServicesSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [v6 activityLabel];
    *(_DWORD *)long long buf = 134218242;
    id v47 = (const char *)v9;
    __int16 v48 = 2114;
    id v49 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: DisableWithRequest  enableTelemetry=YES  Activity=%{public,signpost.telemetry:string1,name=Activity}@ ", buf, 0x16u);
  }
  uint64_t v17 = [[SBEscrowOperationStartEvent alloc] initWithRequest:v6 type:101];
  id v18 = [(SecureBackupDaemon *)self operationsLogger];
  [v18 updateStoreWithEvent:v17];

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10002D21C;
  v41[3] = &unk_1000715C0;
  os_signpost_id_t v44 = v9;
  uint64_t v45 = v11;
  v41[4] = self;
  NSErrorUserInfoKey v19 = v17;
  id v42 = v19;
  id v20 = v7;
  id v43 = v20;
  id v21 = objc_retainBlock(v41);
  CFStringRef v22 = CloudServicesLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v47 = "-[SecureBackupDaemon disableWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  uint64_t v23 = (void *)os_transaction_create();
  CFStringRef v24 = [(SecureBackupDaemon *)self connectionQueue];
  [v6 setQueue:v24];

  uint64_t v25 = [v6 error];

  if (v25)
  {
    id v26 = objc_alloc_init((Class)NSMutableDictionary);
    [v26 setObject:@"error decoding request properties" forKeyedSubscript:NSLocalizedDescriptionKey];
    uint64_t v27 = [v6 error];
    [v26 setObject:v27 forKeyedSubscript:NSUnderlyingErrorKey];

    char v28 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:5 userInfo:v26];
    ((void (*)(void *, void *))v21[2])(v21, v28);

    goto LABEL_18;
  }
  if ([v6 icdp] && objc_msgSend(v6, "deleteAll"))
  {
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    void v38[2] = sub_10002D448;
    v38[3] = &unk_100071918;
    v38[4] = self;
    CFStringRef v40 = v21;
    id v39 = v23;
    [(SecureBackupDaemon *)self deleteAlliCDPRecordsWithRequest:v6 reply:v38];

    goto LABEL_18;
  }
  if ([v6 stingray])
  {
LABEL_17:
    char v30 = [EscrowService alloc];
    uint64_t v31 = [(SecureBackupDaemon *)self operationsLogger];
    uint64_t v32 = [(EscrowService *)v30 initWithOperationsLogger:v31];

    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10002D4B0;
    void v33[3] = &unk_100071940;
    id v34 = v6;
    NSErrorUserInfoKey v35 = self;
    os_signpost_id_t v37 = v21;
    id v36 = v23;
    [(EscrowService *)v32 deleteRecordWithRequest:v34 completionBlock:v33];

    goto LABEL_18;
  }
  uint64_t v29 = [v6 recordID];
  if (v29)
  {

    goto LABEL_17;
  }
  if ([(SecureBackupDaemon *)self _usesEscrow]) {
    goto LABEL_17;
  }
  [(SecureBackupDaemon *)self _disableBackup];
  if (v21) {
    ((void (*)(void *, void))v21[2])(v21, 0);
  }
LABEL_18:
}

- (void)updateMetadataWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = CloudServicesLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    os_signpost_id_t v44 = "-[SecureBackupDaemon updateMetadataWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  os_signpost_id_t v9 = [(SecureBackupDaemon *)self connectionQueue];
  [v6 setQueue:v9];

  uint64_t v10 = [v6 error];

  if (!v10)
  {
    if (([v6 stingray] & 1) == 0)
    {
      uint64_t v29 = CloudServicesLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_10004C610();
      }

      NSErrorUserInfoKey v49 = NSLocalizedDescriptionKey;
      CFStringRef v50 = @" metadata only supported for stingray records";
      id v14 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      char v30 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:5 userInfo:v14];
      v7[2](v7, v30);
      goto LABEL_21;
    }
    id v14 = [v6 metadataHash];
    uint64_t v15 = kSecureBackupKeybagSHA256Key;
    uint64_t v40 = [v14 objectForKeyedSubscript:kSecureBackupKeybagSHA256Key];
    uint64_t v16 = kSecureBackupKeybagDigestKey;
    uint64_t v17 = [v14 objectForKeyedSubscript:kSecureBackupKeybagDigestKey];
    uint64_t v18 = kSecureBackupTimestampKey;
    id v39 = [v14 objectForKeyedSubscript:kSecureBackupTimestampKey];
    uint64_t v19 = [v14 objectForKeyedSubscript:kSecureBackupEncodedMetadataKey];
    uint64_t v20 = kSecureBackupBackOffDateKey;
    os_signpost_id_t v37 = [v14 objectForKeyedSubscript:kSecureBackupBackOffDateKey];
    id v21 = [v6 metadata];
    unsigned int v38 = (void *)v19;
    if (v21 && v40 | v17 && v39)
    {

      if (v19)
      {
        id v22 = objc_alloc_init((Class)NSMutableDictionary);
        [v22 setObject:v40 forKeyedSubscript:v15];
        [v22 setObject:v17 forKeyedSubscript:v16];
        [v22 setObject:v39 forKeyedSubscript:v18];
        uint64_t v23 = [v6 metadata];
        [v22 setObject:v23 forKeyedSubscript:kSecureBackupClientMetadataKey];

        CFStringRef v24 = [v6 backOffDate];

        if (v24)
        {
          uint64_t v25 = [v6 backOffDate];
          [v25 timeIntervalSinceReferenceDate];
          BOOL v27 = v26 > 0.0;

          if (v27)
          {
            char v28 = [v6 backOffDate];
            [v22 setObject:v28 forKeyedSubscript:v20];
          }
        }
        else if (v37)
        {
          [v22 setObject:v37 forKeyedSubscript:v20];
        }
        uint64_t v33 = [EscrowService alloc];
        id v34 = [(SecureBackupDaemon *)self operationsLogger];
        NSErrorUserInfoKey v35 = [(EscrowService *)v33 initWithOperationsLogger:v34];

        [v6 setEncodedMetadata:v38];
        [v6 setMetadata:v22];
        id v36 = CloudServicesLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Attempting to update record metadata", buf, 2u);
        }

        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_10002DDA8;
        v41[3] = &unk_1000713F8;
        id v42 = v7;
        [(EscrowService *)v35 updateRecordMetadataWithRequest:v6 completionBlock:v41];

        char v30 = 0;
LABEL_20:

LABEL_21:
        goto LABEL_22;
      }
    }
    else
    {
    }
    uint64_t v31 = CloudServicesLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = [v6 appleID];
      *(_DWORD *)long long buf = 138412546;
      os_signpost_id_t v44 = v32;
      __int16 v45 = 2112;
      id v46 = v14;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "attempted to update stingray metadata, with invalid parameters: %@, %@ metadata hash", buf, 0x16u);
    }
    NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
    CFStringRef v48 = @"attempted to update stingray metadata, with incomplete metadata hash";
    id v22 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    char v30 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:4 userInfo:v22];
    v7[2](v7, v30);
    goto LABEL_20;
  }
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  [v11 setObject:@"error decoding request properties" forKeyedSubscript:NSLocalizedDescriptionKey];
  id v12 = [v6 error];
  [v11 setObject:v12 forKeyedSubscript:NSUnderlyingErrorKey];

  id v13 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:5 userInfo:v11];
  v7[2](v7, v13);

LABEL_22:
}

- (int)storeCachedPassphrase:(id)a3
{
  id v3 = a3;
  if (![v3 length])
  {
    uint64_t v23 = CloudServicesLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10004C644();
    }
    goto LABEL_27;
  }
  BOOL v5 = NSTemporaryDirectory();
  id v6 = +[NSUUID UUID];
  id v7 = [v6 UUIDString];
  id v8 = [v5 stringByAppendingPathComponent:v7];
  os_signpost_id_t v9 = (const char *)[v8 fileSystemRepresentation];

  int v10 = open_dprotected_np(v9, 1794, 1, 0, 384);
  if (v10 < 0)
  {
    CFStringRef v24 = CloudServicesLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10004C678(v24);
    }

    goto LABEL_28;
  }
  int v11 = v10;
  if (unlink(v9) < 0)
  {
    uint64_t v16 = CloudServicesLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10004C788(v16);
    }
    goto LABEL_24;
  }
  id v12 = +[NSUUID UUID];
  id v13 = [v12 UUIDString];

  v30[0] = kSecureBackupPassphraseKey;
  v30[1] = @"uuid";
  v31[0] = v3;
  v31[1] = v13;
  id v14 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
  id v27 = 0;
  uint64_t v15 = +[NSPropertyListSerialization dataWithPropertyList:v14 format:200 options:0 error:&v27];
  uint64_t v16 = v27;
  if (!v15)
  {
    id v22 = CloudServicesLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10004C810();
    }
    goto LABEL_23;
  }
  if (ftruncate(v11, (off_t)[v15 length]) < 0)
  {
    id v22 = CloudServicesLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10004C878(v22);
    }
    goto LABEL_23;
  }
  id v17 = v15;
  ssize_t v18 = pwrite(v11, [v17 bytes], (size_t)objc_msgSend(v17, "length"), 0);
  if (v18 < 0)
  {
    id v22 = CloudServicesLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10004C900(v22);
    }
    goto LABEL_23;
  }
  uint64_t v19 = v18;
  double v26 = v13;
  id v20 = [v17 length];
  id v21 = CloudServicesLog();
  id v22 = v21;
  if (v19 < (uint64_t)v20)
  {
    id v13 = v26;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10004C988(v17, v19, v22);
    }
LABEL_23:

LABEL_24:
    if ((close(v11) & 0x80000000) == 0)
    {
LABEL_28:
      int v11 = -1;
      goto LABEL_29;
    }
    uint64_t v23 = CloudServicesLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10004C700(v23);
    }
LABEL_27:

    goto LABEL_28;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v29 = v26;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "saving uuid %@", buf, 0xCu);
  }

LABEL_29:

  return v11;
}

- (void)setCachedPassphrase:(id)a3
{
  uint64_t v4 = [(SecureBackupDaemon *)self storeCachedPassphrase:a3];

  [(SecureBackupDaemon *)self setCachedPassphraseFD:v4];
}

- (void)setCachedRecordIDPassphrase:(id)a3
{
  uint64_t v4 = [(SecureBackupDaemon *)self storeCachedPassphrase:a3];

  [(SecureBackupDaemon *)self setCachedRecordIDPassphraseFD:v4];
}

- (void)setCachedRecoveryKey:(id)a3
{
  uint64_t v4 = [(SecureBackupDaemon *)self storeCachedPassphrase:a3];

  [(SecureBackupDaemon *)self setCachedRecoveryKeyFD:v4];
}

- (id)cachedPassphraseForFD:(int)a3
{
  if (a3 < 0) {
    goto LABEL_13;
  }
  v5.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v5.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)v19.st_qspare = v5;
  *(timespec *)&v19.st_size = v5;
  *(timespec *)&v19.st_blksize = v5;
  v19.st_ctimespec = v5;
  v19.st_birthtimespec = v5;
  v19.st_atimespec = v5;
  v19.st_mtimespec = v5;
  *(timespec *)&v19.st_dev = v5;
  *(timespec *)&v19.st_uid = v5;
  if (fstat(a3, &v19) < 0)
  {
    id v7 = CloudServicesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10004CA24();
    }
    goto LABEL_12;
  }
  id v6 = objc_alloc((Class)NSMutableData);
  id v7 = [v6 initWithLength:v19.st_size];
  id v8 = [v7 mutableBytes];
  ssize_t v9 = pread(a3, v8, v19.st_size, 0);
  if (v9 < 0)
  {
    int v10 = CloudServicesLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10004CAB8(v10);
    }
    goto LABEL_11;
  }
  if (v9 < v19.st_size)
  {
    int v10 = CloudServicesLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10004CB40();
    }
LABEL_11:

LABEL_12:
LABEL_13:
    id v11 = 0;
LABEL_14:
    id v12 = 0;
    goto LABEL_15;
  }
  id v18 = 0;
  id v14 = +[NSPropertyListSerialization propertyListWithData:v7 options:0 format:0 error:&v18];
  id v15 = v18;
  if (v14)
  {
    id v11 = [v14 objectForKeyedSubscript:kSecureBackupPassphraseKey];
    uint64_t v16 = CloudServicesLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [v14 objectForKeyedSubscript:@"uuid"];
      *(_DWORD *)long long buf = 138412290;
      id v21 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "fetched uuid %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v16 = CloudServicesLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10004CBB8();
    }
    id v11 = 0;
  }

  if (!v14) {
    goto LABEL_14;
  }
  id v11 = v11;
  id v12 = v11;
LABEL_15:

  return v12;
}

- (NSString)cachedPassphrase
{
  uint64_t v3 = [(SecureBackupDaemon *)self cachedPassphraseFD];

  return (NSString *)[(SecureBackupDaemon *)self cachedPassphraseForFD:v3];
}

- (NSString)cachedRecordIDPassphrase
{
  uint64_t v3 = [(SecureBackupDaemon *)self cachedRecordIDPassphraseFD];

  return (NSString *)[(SecureBackupDaemon *)self cachedPassphraseForFD:v3];
}

- (id)cachedRecoveryKey
{
  uint64_t v3 = [(SecureBackupDaemon *)self cachedRecoveryKeyFD];

  return [(SecureBackupDaemon *)self cachedPassphraseForFD:v3];
}

- (void)uncacheRecordIDPassphrase
{
  uint64_t v3 = CloudServicesLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(SecureBackupDaemon *)self cachedRecordID];
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "uncaching recordID %@", (uint8_t *)&v6, 0xCu);
  }
  if (([(SecureBackupDaemon *)self cachedRecordIDPassphraseFD] & 0x80000000) == 0)
  {
    if (close([(SecureBackupDaemon *)self cachedRecordIDPassphraseFD]) < 0)
    {
      timespec v5 = CloudServicesLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_10004C700(v5);
      }
    }
    [(SecureBackupDaemon *)self setCachedRecordIDPassphraseFD:0xFFFFFFFFLL];
    [(SecureBackupDaemon *)self setCachedRecordID:0];
  }
}

- (void)cachePassphraseWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = CloudServicesLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315138;
    id v18 = "-[SecureBackupDaemon cachePassphraseWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "In %s", (uint8_t *)&v17, 0xCu);
  }

  ssize_t v9 = [(SecureBackupDaemon *)self connectionQueue];
  [v6 setQueue:v9];

  int v10 = [v6 error];

  if (v10)
  {
    if (v7)
    {
      id v11 = objc_alloc_init((Class)NSMutableDictionary);
      [v11 setObject:@"error decoding request properties" forKeyedSubscript:NSLocalizedDescriptionKey];
      id v12 = [v6 error];
      [v11 setObject:v12 forKeyedSubscript:NSUnderlyingErrorKey];

      id v13 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:5 userInfo:v11];
      v7[2](v7, v13);
    }
  }
  else
  {
    if (!atomic_fetch_add_explicit(&dword_100081070, 1u, memory_order_relaxed))
    {
      uint64_t v14 = os_transaction_create();
      id v15 = (void *)qword_100081060;
      qword_100081060 = v14;
    }
    uint64_t v16 = [v6 passphrase];
    [(SecureBackupDaemon *)self setCachedPassphrase:v16];

    if (v7) {
      v7[2](v7, 0);
    }
  }
}

- (void)cachePassphraseWithRequestAsync:(id)a3
{
}

- (void)uncachePassphraseWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = CloudServicesLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    uint64_t v16 = "-[SecureBackupDaemon uncachePassphraseWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "In %s", (uint8_t *)&v15, 0xCu);
  }

  ssize_t v9 = [(SecureBackupDaemon *)self connectionQueue];
  [v6 setQueue:v9];

  int v10 = [v6 error];

  if (v10)
  {
    if (v7)
    {
      id v11 = objc_alloc_init((Class)NSMutableDictionary);
      [v11 setObject:@"error decoding request properties" forKeyedSubscript:NSLocalizedDescriptionKey];
      id v12 = [v6 error];
      [v11 setObject:v12 forKeyedSubscript:NSUnderlyingErrorKey];

      id v13 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:5 userInfo:v11];
      v7[2](v7, v13);

LABEL_14:
    }
  }
  else
  {
    if (close([(SecureBackupDaemon *)self cachedPassphraseFD]) < 0)
    {
      uint64_t v14 = CloudServicesLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10004C700(v14);
      }
    }
    [(SecureBackupDaemon *)self setCachedPassphraseFD:0xFFFFFFFFLL];
    if (v7) {
      v7[2](v7, 0);
    }
    if (atomic_fetch_add_explicit(&dword_100081070, 0xFFFFFFFF, memory_order_relaxed) == 1)
    {
      id v11 = (id)qword_100081060;
      qword_100081060 = 0;
      goto LABEL_14;
    }
  }
}

- (void)cacheRecoveryKeyWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = CloudServicesLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315138;
    id v18 = "-[SecureBackupDaemon cacheRecoveryKeyWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "In %s", (uint8_t *)&v17, 0xCu);
  }

  ssize_t v9 = [(SecureBackupDaemon *)self connectionQueue];
  [v6 setQueue:v9];

  int v10 = [v6 error];

  if (v10)
  {
    if (v7)
    {
      id v11 = objc_alloc_init((Class)NSMutableDictionary);
      [v11 setObject:@"error decoding request properties" forKeyedSubscript:NSLocalizedDescriptionKey];
      id v12 = [v6 error];
      [v11 setObject:v12 forKeyedSubscript:NSUnderlyingErrorKey];

      id v13 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:5 userInfo:v11];
      v7[2](v7, v13);
    }
  }
  else
  {
    if (!atomic_fetch_add_explicit(&dword_100081074, 1u, memory_order_relaxed))
    {
      uint64_t v14 = os_transaction_create();
      int v15 = (void *)qword_100081068;
      qword_100081068 = v14;
    }
    uint64_t v16 = [v6 recoveryKey];
    [(SecureBackupDaemon *)self setCachedRecoveryKey:v16];

    if (v7) {
      v7[2](v7, 0);
    }
  }
}

- (void)uncacheRecoveryKeyWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = CloudServicesLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    uint64_t v16 = "-[SecureBackupDaemon uncacheRecoveryKeyWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "In %s", (uint8_t *)&v15, 0xCu);
  }

  ssize_t v9 = [(SecureBackupDaemon *)self connectionQueue];
  [v6 setQueue:v9];

  int v10 = [v6 error];

  if (v10)
  {
    if (v7)
    {
      id v11 = objc_alloc_init((Class)NSMutableDictionary);
      [v11 setObject:@"error decoding request properties" forKeyedSubscript:NSLocalizedDescriptionKey];
      id v12 = [v6 error];
      [v11 setObject:v12 forKeyedSubscript:NSUnderlyingErrorKey];

      id v13 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:5 userInfo:v11];
      v7[2](v7, v13);

LABEL_14:
    }
  }
  else
  {
    if (close([(SecureBackupDaemon *)self cachedRecoveryKeyFD]) < 0)
    {
      uint64_t v14 = CloudServicesLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10004C700(v14);
      }
    }
    [(SecureBackupDaemon *)self setCachedRecoveryKeyFD:0xFFFFFFFFLL];
    if (v7) {
      v7[2](v7, 0);
    }
    if (atomic_fetch_add_explicit(&dword_100081074, 0xFFFFFFFF, memory_order_relaxed) == 1)
    {
      id v11 = (id)qword_100081068;
      qword_100081068 = 0;
      goto LABEL_14;
    }
  }
}

- (void)uncachePassphraseWithRequestAsync:(id)a3
{
}

- (void)startSMSChallengeWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = CloudServicesLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v20 = "-[SecureBackupDaemon startSMSChallengeWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  ssize_t v9 = [(SecureBackupDaemon *)self connectionQueue];
  [v6 setQueue:v9];

  int v10 = [v6 error];

  if (v10)
  {
    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    [v11 setObject:@"error decoding request properties" forKeyedSubscript:NSLocalizedDescriptionKey];
    id v12 = [v6 error];
    [v11 setObject:v12 forKeyedSubscript:NSUnderlyingErrorKey];

    id v13 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:5 userInfo:v11];
    v7[2](v7, 0, v13);
  }
  else
  {
    uint64_t v14 = [EscrowService alloc];
    int v15 = [(SecureBackupDaemon *)self operationsLogger];
    uint64_t v16 = [(EscrowService *)v14 initWithOperationsLogger:v15];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002F484;
    v17[3] = &unk_1000713F8;
    id v18 = v7;
    [(EscrowService *)v16 startSMSChallengeWithRequest:v6 completionBlock:v17];
  }
}

- (void)getCountrySMSCodesWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = CloudServicesLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v20 = "-[SecureBackupDaemon getCountrySMSCodesWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  ssize_t v9 = [(SecureBackupDaemon *)self connectionQueue];
  [v6 setQueue:v9];

  int v10 = [v6 error];

  if (v10)
  {
    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    [v11 setObject:@"error decoding request properties" forKeyedSubscript:NSLocalizedDescriptionKey];
    id v12 = [v6 error];
    [v11 setObject:v12 forKeyedSubscript:NSUnderlyingErrorKey];

    id v13 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:5 userInfo:v11];
    v7[2](v7, 0, v13);
  }
  else
  {
    uint64_t v14 = [EscrowService alloc];
    int v15 = [(SecureBackupDaemon *)self operationsLogger];
    uint64_t v16 = [(EscrowService *)v14 initWithOperationsLogger:v15];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002FA1C;
    v17[3] = &unk_1000713F8;
    id v18 = v7;
    [(EscrowService *)v16 getCountrySMSCodesWithRequest:v6 completionBlock:v17];
  }
}

- (void)changeSMSTargetWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = CloudServicesLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v45 = "-[SecureBackupDaemon changeSMSTargetWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  ssize_t v9 = [(SecureBackupDaemon *)self connectionQueue];
  [v6 setQueue:v9];

  int v10 = [v6 error];

  if (v10)
  {
    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    [v11 setObject:@"error decoding request properties" forKeyedSubscript:NSLocalizedDescriptionKey];
    id v12 = [v6 error];
    [v11 setObject:v12 forKeyedSubscript:NSUnderlyingErrorKey];

    id v13 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:5 userInfo:v11];
    v7[2](v7, v13);

    goto LABEL_31;
  }
  if ([(SecureBackupDaemon *)self _backupEnabled])
  {
    if ([(SecureBackupDaemon *)self _usesEscrow])
    {
      uint64_t v14 = [EscrowService alloc];
      int v15 = [(SecureBackupDaemon *)self operationsLogger];
      uint64_t v16 = [(EscrowService *)v14 initWithOperationsLogger:v15];

      int v17 = [v6 countryDialCode];
      if ([v17 length])
      {
        id v18 = [v6 countryCode];
        if ([v18 length])
        {
          stat v19 = [v6 smsTarget];
          if ([v19 length])
          {
            id v20 = [v6 appleID];
            if ([v20 length])
            {
              id v21 = [v6 iCloudPassword];
              BOOL v22 = [v21 length] == 0;

              if (!v22)
              {
                uint64_t v23 = [v6 smsTarget];
                id v41 = 0;
                CFStringRef v24 = [(SecureBackupDaemon *)self normalizeSMSTarget:v23 error:&v41];
                id v25 = v41;
                [v6 setSmsTarget:v24];

                double v26 = [v6 smsTarget];
                LODWORD(v23) = v26 == 0;

                if (v23)
                {
                  v7[2](v7, v25);
                  goto LABEL_30;
                }
                v39[0] = _NSConcreteStackBlock;
                v39[1] = 3221225472;
                v39[2] = sub_1000303A0;
                v39[3] = &unk_1000713F8;
                uint64_t v40 = v7;
                [(EscrowService *)v16 changeSMSTargetWithRequest:v6 completionBlock:v39];
                id v27 = v40;
LABEL_29:

LABEL_30:
                goto LABEL_31;
              }
LABEL_24:
              id v34 = CloudServicesLog();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                NSErrorUserInfoKey v35 = [v6 smsTarget];
                id v36 = [v6 appleID];
                os_signpost_id_t v37 = [v6 iCloudPassword];
                CFStringRef v38 = @"non-";
                *(_DWORD *)long long buf = 138412802;
                __int16 v45 = v35;
                __int16 v46 = 2112;
                if (!v37) {
                  CFStringRef v38 = &stru_100072CF8;
                }
                NSErrorUserInfoKey v47 = v36;
                __int16 v48 = 2112;
                CFStringRef v49 = v38;
                _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "attempted to change SMS target, with invalid parameters: %@, %@, %@nil iCloud password", buf, 0x20u);
              }
              NSErrorUserInfoKey v42 = NSLocalizedDescriptionKey;
              CFStringRef v43 = @"attempted to change SMS target with invalid parameters";
              id v25 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
              id v27 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:4 userInfo:v25];
              v7[2](v7, v27);
              goto LABEL_29;
            }
          }
        }
      }
      goto LABEL_24;
    }
    uint64_t v31 = CloudServicesLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "attempted to change SMS target, but not using escrow", buf, 2u);
    }

    NSErrorUserInfoKey v50 = NSLocalizedDescriptionKey;
    CFStringRef v51 = @"attempted to change SMS target, but not using escrow";
    uint64_t v32 = +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    uint64_t v33 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:10 userInfo:v32];
    v7[2](v7, v33);
  }
  else
  {
    char v28 = CloudServicesLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "attempted to change SMS target, but backup is not enabled", buf, 2u);
    }

    NSErrorUserInfoKey v52 = NSLocalizedDescriptionKey;
    CFStringRef v53 = @"attempted to change SMS target, but backup is not enabled";
    uint64_t v29 = +[NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    char v30 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:16 userInfo:v29];
    v7[2](v7, v30);
  }
LABEL_31:
}

- (void)notificationInfoWithReply:(id)a3
{
  int v10 = (void (**)(id, id, void))a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = [(SecureBackupDaemon *)self handledNotifications];
  [v5 setObject:v6 forKeyedSubscript:@"handled_notifications"];

  id v7 = [(SecureBackupDaemon *)self ignoredNotifications];
  [v5 setObject:v7 forKeyedSubscript:@"ignored_notifications"];

  id v8 = (void *)xpc_copy_event();
  if (v8)
  {
    ssize_t v9 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    [v5 setObject:v9 forKeyedSubscript:@"events"];
  }
  v10[2](v10, v5, 0);
}

- (void)stateCaptureWithReply:(id)a3
{
  id v6 = (void (**)(id, id, void))a3;
  id v5 = [(SecureBackupDaemon *)self copyKVSState];
  v6[2](v6, v5, 0);
}

- (id)getPendingEscrowRequest:(id *)a3
{
  uint64_t v4 = +[SecEscrowRequest request:](SecEscrowRequest, "request:");
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 fetchRequestWaitingOnPasscode:a3];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)beginHSA2PasscodeRequest:(id)a3 desirePasscodeImmediately:(BOOL)a4 uuid:(id)a5 reason:(id)a6 reply:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  int v15 = (void (**)(id, void, void *))a7;
  uint64_t v16 = CloudServicesLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "beginning an HSA2 passcode request", buf, 2u);
  }

  int v17 = [(SecureBackupDaemon *)self connectionQueue];
  [v12 setQueue:v17];

  [v12 setIcdp:1];
  if ([v14 reason] == 1)
  {
    id v18 = CloudServicesLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      stat v19 = [v14 expectedFederationID];
      *(_DWORD *)long long buf = 138412290;
      v39[0] = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "will attempt federation move to %@", buf, 0xCu);
    }
    id v20 = [v14 expectedFederationID];
    id v21 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v20 integerValue]);
    [v12 setSpecifiedFederation:v21];
  }
  BOOL v22 = (void *)os_transaction_create();
  if (v10) {
    uint64_t v23 = 2;
  }
  else {
    uint64_t v23 = 1;
  }
  unsigned int v24 = [(SecureBackupDaemon *)self setPasscodeRequestFlag:v23];
  id v25 = CloudServicesLog();
  BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
  if (v24)
  {
    if (v26)
    {
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v39[0]) = v24;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "unable to set state for token: %d", buf, 8u);
    }

    uint64_t v27 = kSecureBackupErrorDomain;
    NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
    CFStringRef v41 = @"unable to set state for token";
    char v28 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    uint64_t v29 = +[NSError errorWithDomain:v27 code:24 userInfo:v28];
    v15[2](v15, 0, v29);
  }
  else
  {
    if (v26)
    {
      *(_DWORD *)long long buf = 67109376;
      LODWORD(v39[0]) = v23;
      WORD2(v39[0]) = 1024;
      *(_DWORD *)((char *)v39 + 6) = v10;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "successfully set notify state for request to %d (desire immediately: %d)", buf, 0xEu);
    }

    char v30 = [EscrowService alloc];
    uint64_t v31 = [(SecureBackupDaemon *)self operationsLogger];
    uint64_t v32 = [(EscrowService *)v30 initWithOperationsLogger:v31];

    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100030B0C;
    void v33[3] = &unk_100071968;
    os_signpost_id_t v37 = v15;
    id v34 = v32;
    id v35 = v13;
    id v36 = v22;
    char v28 = v32;
    [(EscrowService *)v28 fetchCertificatesAndDuplicateRequest:v12 completionBlock:v33];

    uint64_t v29 = v37;
  }
}

- (int)notifyToken
{
  v2 = self;
  objc_sync_enter(v2);
  if (dword_100080E60 == -1)
  {
    uint32_t v3 = notify_register_check((const char *)[SecureBackupPasscodeRequestNotifyTokenName UTF8String], &dword_100080E60);
    if (v3)
    {
      uint64_t v4 = CloudServicesLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v6[0] = 67109120;
        v6[1] = v3;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "unable to fetch notify token: %d", (uint8_t *)v6, 8u);
      }

      dword_100080E60 = -1;
    }
  }
  objc_sync_exit(v2);

  return dword_100080E60;
}

- (void)clearNotifyToken
{
  id obj = self;
  objc_sync_enter(obj);
  if (dword_100080E60 != -1) {
    notify_cancel(dword_100080E60);
  }
  dword_100080E60 = -1;
  objc_sync_exit(obj);
}

- (int)setPasscodeRequestFlag:(unint64_t)a3
{
  int v5 = [(SecureBackupDaemon *)self notifyToken];
  if (v5 != -1)
  {
    int result = notify_set_state(v5, a3);
    if (result != 2) {
      return result;
    }
    [(SecureBackupDaemon *)self clearNotifyToken];
  }
  return 2;
}

- (int)getPasscodeRequestFlag:(unint64_t *)a3
{
  int v5 = [(SecureBackupDaemon *)self notifyToken];
  if (v5 != -1)
  {
    int result = notify_get_state(v5, a3);
    if (result != 2) {
      return result;
    }
    [(SecureBackupDaemon *)self clearNotifyToken];
  }
  return 2;
}

- (void)prepareHSA2EscrowRecordContents:(id)a3 usesComplexPassphrase:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  ssize_t v9 = (void (**)(id, void *))a5;
  BOOL v10 = CloudServicesLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    BOOL v83 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "beginning an prepare HSA2 contents request: usesComplexPassphrase: %d", buf, 8u);
  }

  id v11 = [(SecureBackupDaemon *)self connectionQueue];
  [v8 setQueue:v11];

  unsigned int v12 = [(SecureBackupDaemon *)self setPasscodeRequestFlag:4];
  id v13 = CloudServicesLog();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
  if (v12)
  {
    if (v14) {
      sub_10004D154();
    }

    uint64_t v15 = kSecureBackupErrorDomain;
    NSErrorUserInfoKey v80 = NSLocalizedDescriptionKey;
    CFStringRef v81 = @"unable to set state (to 0) for token";
    uint64_t v16 = &v81;
    int v17 = &v80;
    goto LABEL_13;
  }
  if (v14) {
    sub_10004D120();
  }

  if (![v8 stingray])
  {
    if ([v8 usesRandomPassphrase])
    {
      uint64_t v15 = kSecureBackupErrorDomain;
      NSErrorUserInfoKey v76 = NSLocalizedDescriptionKey;
      CFStringRef v77 = @"Cannot prepare HSA2 Escrow record for a usesRandomPassphrase request";
      uint64_t v16 = &v77;
      int v17 = &v76;
      goto LABEL_13;
    }
    if (([v8 usesMultipleiCSC] & 1) == 0)
    {
      id v20 = CloudServicesLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "record preparation requires a multiple iCSC world, so do that", buf, 2u);
      }

      [v8 setUsesMultipleiCSC:1];
    }
    if (([v8 icdp] & 1) == 0)
    {
      id v21 = CloudServicesLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "record preparation requires an ICDP world, so do that", buf, 2u);
      }

      [v8 setIcdp:1];
    }
    BOOL v22 = [v8 dsid];

    if (!v22)
    {
      uint64_t v23 = CloudServicesLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "setting record DSID", buf, 2u);
      }

      unsigned int v24 = sub_1000100D4();
      [v8 setDsid:v24];
    }
    id v25 = [v8 metadata];
    uint64_t v26 = kSecureBackupUsesComplexPassphraseKey;
    id v18 = [v25 objectForKeyedSubscript:kSecureBackupUsesComplexPassphraseKey];

    id v27 = [v18 integerValue];
    char v28 = [v8 metadata];
    id v29 = [v28 mutableCopy];
    char v30 = v29;
    if (v27 || v6)
    {
      if (v29)
      {
        id v32 = v29;
      }
      else
      {
        id v32 = +[NSMutableDictionary dictionary];
      }
      uint64_t v33 = v32;

      [v33 setObject:&__kCFBooleanTrue forKeyedSubscript:v26];
      [v33 setObject:&__kCFBooleanFalse forKeyedSubscript:kSecureBackupUsesNumericPassphraseKey];
      [v33 setObject:&off_100076048 forKeyedSubscript:kSecureBackupNumericPassphraseLengthKey];
    }
    else
    {
      if (v29)
      {
        id v31 = v29;
      }
      else
      {
        id v31 = +[NSMutableDictionary dictionary];
      }
      uint64_t v33 = v31;

      [v33 setObject:&__kCFBooleanFalse forKeyedSubscript:v26];
      [v33 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecureBackupUsesNumericPassphraseKey];
      id v34 = [v8 passphrase];
      id v35 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v34 length]);
      [v33 setObject:v35 forKeyedSubscript:kSecureBackupNumericPassphraseLengthKey];
    }
    [v8 setMetadata:v33];

    id v73 = 0;
    id v36 = +[SecEscrowRequest request:&v73];
    id v37 = v73;
    stat v19 = v37;
    if (!v36)
    {
      NSErrorUserInfoKey v42 = CloudServicesLog();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        sub_10004CE48();
      }

      v9[2](v9, v19);
      goto LABEL_84;
    }
    id v72 = v37;
    CFStringRef v38 = [v36 fetchRequestWaitingOnPasscode:&v72];
    id v39 = v72;

    if (!v38 || v39)
    {
      CFStringRef v43 = CloudServicesLog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        sub_10004CEB0();
      }

      if (v39)
      {
        v9[2](v9, v39);
      }
      else
      {
        uint64_t v44 = kSecureBackupErrorDomain;
        NSErrorUserInfoKey v74 = NSLocalizedDescriptionKey;
        CFStringRef v75 = @"No outstanding escrow request";
        __int16 v45 = +[NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
        __int16 v46 = +[NSError errorWithDomain:v44 code:-1 userInfo:v45];
        v9[2](v9, v46);

        id v39 = 0;
      }
      goto LABEL_83;
    }
    id v71 = 0;
    NSErrorUserInfoKey v40 = [(SecureBackupDaemon *)self fetchPRK:&v71];
    id v39 = v71;
    [v8 setIdmsData:v40];

    if (v39)
    {
      CFStringRef v41 = CloudServicesLog();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        sub_10004D0B8();
      }

      v9[2](v9, v39);
LABEL_83:

      stat v19 = v39;
LABEL_84:

      goto LABEL_14;
    }
    NSErrorUserInfoKey v47 = [v8 idmsData];

    __int16 v48 = CloudServicesLog();
    BOOL v49 = os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
    if (v47)
    {
      if (!v49) {
        goto LABEL_58;
      }
      *(_WORD *)long long buf = 0;
      NSErrorUserInfoKey v50 = "prepareHSA2: found IDMS data";
    }
    else
    {
      if (!v49) {
        goto LABEL_58;
      }
      *(_WORD *)long long buf = 0;
      NSErrorUserInfoKey v50 = "prepareHSA2: found no IDMS data";
    }
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, v50, buf, 2u);
LABEL_58:

    id v70 = 0;
    CFStringRef v51 = [(SecureBackupDaemon *)self makeRecordCandidate:v8 error:&v70];
    id v52 = v70;
    id v39 = v52;
    if (!v51 || v52)
    {
      long long v63 = CloudServicesLog();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
        sub_10004CF18();
      }

      v9[2](v9, v39);
    }
    else
    {
      CFStringRef v53 = [EscrowService alloc];
      unint64_t v54 = [(SecureBackupDaemon *)self operationsLogger];
      id v55 = [(EscrowService *)v53 initWithOperationsLogger:v54];

      id v69 = 0;
      NSErrorUserInfoKey v56 = [(EscrowService *)v55 fetchCachedCertificateWithRequest:v8 error:&v69];
      id v57 = v69;
      id v39 = v57;
      if (!v56 || v57)
      {
        long long v64 = CloudServicesLog();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
          sub_10004CF80();
        }

        v9[2](v9, v39);
      }
      else
      {
        unint64_t v65 = v55;
        id v68 = 0;
        v58 = +[EscrowPrerecord createPrerecordFromCandidate:v51 storedCertificate:v56 request:v8 error:&v68];
        id v39 = v68;
        id v59 = CloudServicesLog();
        unsigned int v60 = v59;
        uint64_t v66 = v58;
        if (!v58 || v39)
        {
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
            sub_10004CFE8();
          }

          v9[2](v9, v39);
          id v55 = v65;
        }
        else
        {
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Successfully made an escrow prerecord", buf, 2u);
          }

          long long v61 = [v58 data];
          id v67 = 0;
          [v36 cachePrerecord:v38 serializedPrerecord:v61 error:&v67];
          id v39 = v67;

          id v55 = v65;
          if (v39)
          {
            long long v62 = CloudServicesLog();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
              sub_10004D050();
            }

            v9[2](v9, v39);
          }
          else
          {
            v9[2](v9, 0);
          }
        }
      }
    }

    goto LABEL_83;
  }
  uint64_t v15 = kSecureBackupErrorDomain;
  NSErrorUserInfoKey v78 = NSLocalizedDescriptionKey;
  CFStringRef v79 = @"Cannot prepare HSA2 Escrow record for a stingray request";
  uint64_t v16 = &v79;
  int v17 = &v78;
LABEL_13:
  id v18 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v17 count:1];
  stat v19 = +[NSError errorWithDomain:v15 code:24 userInfo:v18];
  v9[2](v9, v19);
LABEL_14:
}

- (id)fetchPRK:(id *)a3
{
  uint64_t v3 = sub_100042CEC();
  uint64_t v4 = (void *)v3;
  if (v3)
  {
    CFStringRef v8 = @"prk";
    uint64_t v9 = v3;
    int v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    BOOL v6 = +[NSKeyedArchiver archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
  }
  else
  {
    int v5 = CloudServicesLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10004D188();
    }
    BOOL v6 = 0;
  }

  return v6;
}

- (void)daemonPasscodeRequestOpinion:(id)a3
{
  uint64_t v4 = (void (**)(id, void, id))a3;
  id v24 = 0;
  int v5 = +[SecEscrowRequest request:&v24];
  id v6 = v24;
  id v7 = v6;
  if (v5)
  {
    id v23 = v6;
    CFStringRef v8 = [v5 fetchRequestWaitingOnPasscode:&v23];
    id v9 = v23;

    if (v9)
    {
      BOOL v10 = CloudServicesLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10004D28C();
      }

      v4[2](v4, 0, v9);
    }
    else
    {
      unsigned int v12 = CloudServicesLog();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v13)
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = v8;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "daemonPasscodeRequestOpinion: found outstanding request %@", buf, 0xCu);
        }

        *(void *)long long buf = 0;
        if ([(SecureBackupDaemon *)self getPasscodeRequestFlag:buf])
        {
          BOOL v14 = CloudServicesLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            sub_10004D224();
          }
        }
        if (!*(void *)buf)
        {
          uint64_t v15 = CloudServicesLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v22[0] = 0;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "daemonPasscodeRequestOpinion: notify lost our state. Setting back on...", (uint8_t *)v22, 2u);
          }

          [(SecureBackupDaemon *)self setPasscodeRequestFlag:1];
        }
        uint64_t v16 = v4[2];
        int v17 = v4;
        uint64_t v18 = 2;
      }
      else
      {
        if (v13)
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "daemonPasscodeRequestOpinion: no outstanding request", buf, 2u);
        }

        unsigned int v19 = [(SecureBackupDaemon *)self setPasscodeRequestFlag:4];
        id v20 = CloudServicesLog();
        BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
        if (v19)
        {
          if (v21) {
            sub_10004D154();
          }
        }
        else if (v21)
        {
          sub_10004D120();
        }

        uint64_t v16 = v4[2];
        int v17 = v4;
        uint64_t v18 = 1;
      }
      v16(v17, v18, 0);
    }
  }
  else
  {
    id v11 = CloudServicesLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10004D1BC();
    }

    v4[2](v4, 0, v7);
    id v9 = v7;
  }
}

- (void)getCertificatesWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  CFStringRef v8 = CloudServicesLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    int v17 = "-[SecureBackupDaemon getCertificatesWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  id v9 = [(SecureBackupDaemon *)self connectionQueue];
  [v7 setQueue:v9];

  BOOL v10 = [EscrowService alloc];
  id v11 = [(SecureBackupDaemon *)self operationsLogger];
  unsigned int v12 = [(EscrowService *)v10 initWithOperationsLogger:v11];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100031E94;
  v14[3] = &unk_100071990;
  id v15 = v6;
  id v13 = v6;
  [(EscrowService *)v12 fetchCertificatesWithRequest:v7 completionBlock:v14];
}

- (void)saveTermsAcceptance:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v16 = "-[SecureBackupDaemon saveTermsAcceptance:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  CFStringRef v8 = [v5 altDSID];
  if (v8)
  {
    +[CSCertOperations storeTerms:v5 withAltDSID:v8 reply:v6];
  }
  else
  {
    id v9 = CloudServicesLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to store terms: no altDSID provided", buf, 2u);
    }

    uint64_t v10 = kSecureBackupErrorDomain;
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    CFStringRef v14 = @"missing altDSID";
    id v11 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    unsigned int v12 = +[NSError errorWithDomain:v10 code:4 userInfo:v11];

    v6[2](v6, v12);
  }
}

- (void)getAcceptedTermsForAltDSID:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    unsigned int v12 = "-[SecureBackupDaemon getAcceptedTermsForAltDSID:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100032240;
  v9[3] = &unk_1000719B8;
  id v10 = v5;
  id v8 = v5;
  +[CSCertOperations fetchTermsWithAltDSID:v6 reply:v9];
}

- (void)moveToFederationAllowed:(id)a3 altDSID:(id)a4 reply:(id)a5
{
  id v7 = (void (**)(id, id, void))a5;
  id v8 = a4;
  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a3 integerValue]);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = +[CSCertOperations moveToFederationAllowed:v10 altDSID:v8];

  v7[2](v7, v9, 0);
}

- (void)knownICDPFederations:(id)a3
{
  uint64_t v3 = (void (**)(id, void *, void))a3;
  uint64_t v4 = CloudServicesLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[SecureBackupDaemon knownICDPFederations:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "In %s", (uint8_t *)&v6, 0xCu);
  }

  id v5 = +[CSCertOperations knownICDPFederations];
  v3[2](v3, v5, 0);
}

- (void)enableGuitarfishTokenWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = CloudServicesLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v35 = "-[SecureBackupDaemon enableGuitarfishTokenWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  id v9 = [(SecureBackupDaemon *)self connectionQueue];
  [v6 setQueue:v9];

  id v10 = [v6 error];

  if (v10)
  {
    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    [v11 setObject:@"error decoding request properties" forKeyedSubscript:NSLocalizedDescriptionKey];
    unsigned int v12 = [v6 error];
    [v11 setObject:v12 forKeyedSubscript:NSUnderlyingErrorKey];

    NSErrorUserInfoKey v13 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:5 userInfo:v11];
    v7[2](v7, v13);
  }
  else
  {
    CFStringRef v14 = [v6 metadata];
    id v11 = [v14 mutableCopy];

    id v15 = [v6 metadataHash];
    NSErrorUserInfoKey v13 = [v15 objectForKeyedSubscript:kSecureBackupEncodedMetadataKey];

    uint64_t v16 = +[NSMutableDictionary dictionary];
    char v30 = [v6 iCloudIdentityData];
    uint64_t v17 = [v30 sha256Digest];
    uint64_t v18 = kSecureBackupKeybagSHA256Key;
    id v31 = (void *)v17;
    objc_msgSend(v16, "setObject:forKeyedSubscript:");
    unsigned int v19 = +[CSDateUtilities posixDateFormatter];
    id v20 = +[NSDate date];
    id v29 = v19;
    BOOL v21 = [v19 stringFromDate:v20];

    uint64_t v22 = kSecureBackupTimestampKey;
    [v16 setObject:v21 forKeyedSubscript:kSecureBackupTimestampKey];
    if (v11)
    {
      [v11 setObject:v21 forKeyedSubscript:kSecureBackupMetadataTimestampKey];
      [v16 setObject:v11 forKeyedSubscript:kSecureBackupClientMetadataKey];
    }
    id v23 = [EscrowService alloc];
    id v24 = [(SecureBackupDaemon *)self operationsLogger];
    char v28 = [(EscrowService *)v23 initWithOperationsLogger:v24];

    id v25 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:5];
    [v25 setObject:v31 forKeyedSubscript:v18];
    [v25 setObject:v30 forKeyedSubscript:kSecureBackupBagPasswordKey];
    [v25 setObject:@"1" forKeyedSubscript:@"BackupVersion"];
    [v25 setObject:v21 forKeyedSubscript:v22];
    [v6 setEscrowRecord:v25];
    [v6 setMetadata:v16];
    [v6 setEncodedMetadata:v13];
    uint64_t v26 = [v6 encodedMetadata];

    if (v26)
    {
      id v27 = CloudServicesLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "enableWithInfo(): beginning an update request", buf, 2u);
      }
    }
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100032874;
    v32[3] = &unk_1000713F8;
    uint64_t v33 = v7;
    [(EscrowService *)v28 storeRecordWithRequest:v6 completionBlock:v32];
  }
}

- (void)recoverGuitarfishTokenWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = CloudServicesLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v20 = "-[SecureBackupDaemon recoverGuitarfishTokenWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  id v9 = [(SecureBackupDaemon *)self connectionQueue];
  [v6 setQueue:v9];

  id v10 = [v6 error];

  if (v10)
  {
    id v11 = (EscrowService *)objc_alloc_init((Class)NSMutableDictionary);
    [(EscrowService *)v11 setObject:@"error decoding request properties" forKeyedSubscript:NSLocalizedDescriptionKey];
    unsigned int v12 = [v6 error];
    [(EscrowService *)v11 setObject:v12 forKeyedSubscript:NSUnderlyingErrorKey];

    NSErrorUserInfoKey v13 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:5 userInfo:v11];
    v7[2](v7, 0, v13);
  }
  else
  {
    CFStringRef v14 = CloudServicesLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Performing Guitarfish token recovery", buf, 2u);
    }

    id v15 = [EscrowService alloc];
    uint64_t v16 = [(SecureBackupDaemon *)self operationsLogger];
    id v11 = [(EscrowService *)v15 initWithOperationsLogger:v16];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100032BC8;
    v17[3] = &unk_1000713F8;
    uint64_t v18 = v7;
    [(EscrowService *)v11 recoverRecordWithRequest:v6 completionBlock:v17];
    NSErrorUserInfoKey v13 = v18;
  }
}

- (SBEscrowOperationLogger)operationsLogger
{
  return self->_operationsLogger;
}

- (NSURL)cacheDirURL
{
  return self->_cacheDirURL;
}

- (void)setCacheDirURL:(id)a3
{
}

- (NSData)iCDPKeybag
{
  return self->_iCDPKeybag;
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (OS_dispatch_queue)backupQueue
{
  return self->_backupQueue;
}

- (OS_dispatch_queue)kvsQueue
{
  return self->_kvsQueue;
}

- (BOOL)needInitialBackup
{
  return self->_needInitialBackup;
}

- (void)setNeedInitialBackup:(BOOL)a3
{
  self->_needInitialBackup = a3;
}

- (NSString)cachedRecordID
{
  return self->_cachedRecordID;
}

- (void)setCachedRecordID:(id)a3
{
}

- (int)cachedPassphraseFD
{
  return self->_cachedPassphraseFD;
}

- (void)setCachedPassphraseFD:(int)a3
{
  self->_cachedPassphraseFD = a3;
}

- (int)cachedRecordIDPassphraseFD
{
  return self->_cachedRecordIDPassphraseFD;
}

- (void)setCachedRecordIDPassphraseFD:(int)a3
{
  self->_cachedRecordIDPassphraseFD = a3;
}

- (int)cachedRecoveryKeyFD
{
  return self->_cachedRecoveryKeyFD;
}

- (void)setCachedRecoveryKeyFD:(int)a3
{
  self->_cachedRecoveryKeyFD = a3;
}

- (NSString)iCloudEnvironment
{
  return self->_iCloudEnvironment;
}

- (void)setICloudEnvironment:(id)a3
{
}

- (BOOL)pendingNotification
{
  return self->_pendingNotification;
}

- (void)setPendingNotification:(BOOL)a3
{
  self->_pendingNotification = a3;
}

- (NSMutableDictionary)ignoredNotifications
{
  return self->_ignoredNotifications;
}

- (void)setIgnoredNotifications:(id)a3
{
}

- (NSMutableDictionary)handledNotifications
{
  return self->_handledNotifications;
}

- (void)setHandledNotifications:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handledNotifications, 0);
  objc_storeStrong((id *)&self->_ignoredNotifications, 0);
  objc_storeStrong((id *)&self->_iCloudEnvironment, 0);
  objc_storeStrong((id *)&self->_cachedRecordID, 0);
  objc_storeStrong((id *)&self->_kvsQueue, 0);
  objc_storeStrong((id *)&self->_backupQueue, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_iCDPKeybag, 0);
  objc_storeStrong((id *)&self->_cacheDirURL, 0);

  objc_storeStrong((id *)&self->_operationsLogger, 0);
}

- (id)kvs
{
  if (OctagonPlatformSupportsSOS())
  {
    if (sub_10000FFC8())
    {
      v2 = +[NSUbiquitousKeyValueStore defaultStore];
      goto LABEL_8;
    }
    uint64_t v3 = CloudServicesLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10004E57C(v3);
    }
  }
  v2 = 0;
LABEL_8:

  return v2;
}

- (void)restoreBackupName:(id)a3 peerID:(id)a4 keybag:(id)a5 password:(id)a6 backup:(id)a7 reply:(id)a8
{
  id v13 = a3;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  unsigned int v19 = _CloudServicesSignpostLogSystem();
  os_signpost_id_t v20 = _CloudServicesSignpostCreate(v19);

  BOOL v21 = _CloudServicesSignpostLogSystem();
  uint64_t v22 = v21;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "BackupRestore", " enableTelemetry=YES ", buf, 2u);
  }

  id v23 = _CloudServicesSignpostLogSystem();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    os_signpost_id_t v29 = v20;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: BackupRestore  enableTelemetry=YES ", buf, 0xCu);
  }

  uint64_t v26 = v13;
  id v27 = v14;
  id v24 = v14;
  id v25 = v13;
  SecItemBackupRestore();
}

- (BOOL)verifyRKWithKeyBag:(id)a3 password:(id)a4 error:(id *)a5
{
  id v6 = a4;
  id v16 = 0;
  uint64_t v7 = SOSBackupSliceKeyBagCreateFromData();
  if (v7) {
    BOOL v8 = v16 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8)
  {
    id v9 = CloudServicesLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10004E5C0();
    }
LABEL_13:

    BOOL v13 = 0;
    if (a5) {
      *a5 = v16;
    }
    goto LABEL_15;
  }
  id v10 = (const void *)v7;
  int v11 = SOSBSKBLoadAndUnlockWithWrappingSecret();
  CFRelease(v10);
  unsigned int v12 = CloudServicesLog();
  id v9 = v12;
  if (v11 == -1)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10004E628();
    }
    goto LABEL_13;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "RK checks out", v15, 2u);
  }

  BOOL v13 = 1;
LABEL_15:

  return v13;
}

- (id)removeRKFromKeyBag:(id)a3 error:(id *)a4
{
  id v16 = 0;
  uint64_t v5 = SOSBackupSliceKeyBagCreateFromData();
  if (v5) {
    BOOL v6 = v16 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    id v9 = (const void *)v5;
    SOSBSKBRemoveRecoveryKey();
    id v10 = CloudServicesLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "removed recovery key from bskb", (uint8_t *)&v15, 2u);
    }

    id v15 = 0;
    int v11 = (void *)SOSBSKBCopyEncoded();
    if (v11) {
      BOOL v12 = v15 == 0;
    }
    else {
      BOOL v12 = 0;
    }
    if (v12)
    {
      CFRelease(v9);
      id v8 = v11;
    }
    else
    {
      BOOL v13 = CloudServicesLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10004E690();
      }

      if (a4) {
        *a4 = v15;
      }
      CFRelease(v9);
      id v8 = 0;
    }
  }
  else
  {
    uint64_t v7 = CloudServicesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10004E5C0();
    }

    id v8 = 0;
    if (a4) {
      *a4 = v16;
    }
  }

  return v8;
}

- (BOOL)backupWithRegisteredBackupsWithError:(id *)a3 handler:(id)a4
{
  id v5 = a4;
  BOOL v6 = _CloudServicesSignpostLogSystem();
  os_signpost_id_t v7 = _CloudServicesSignpostCreate(v6);
  uint64_t v9 = v8;

  id v10 = _CloudServicesSignpostLogSystem();
  int v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "BackupWithRegisteredBackups", " enableTelemetry=YES ", buf, 2u);
  }

  BOOL v12 = _CloudServicesSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    os_signpost_id_t v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: BackupWithRegisteredBackups  enableTelemetry=YES ", buf, 0xCu);
  }

  id v13 = v5;
  int v14 = SecItemBackupWithRegisteredBackups();
  BOOL v15 = v14;
  if (a3 && (v14 & 1) == 0) {
    *a3 = 0;
  }
  double Nanoseconds = _CloudServicesSignpostGetNanoseconds(v7, v9);
  id v17 = _CloudServicesSignpostLogSystem();
  id v18 = v17;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_DWORD *)long long buf = 67240192;
    LODWORD(v22) = v15;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, v7, "BackupWithRegisteredBackups", " CloudServicesSignpostNameSecItemBackupWithRegisteredBackups=%{public,signpost.telemetry:number1,name=CloudServicesSignpostNameSecItemBackupWithRegisteredBackups}d ", buf, 8u);
  }

  unsigned int v19 = _CloudServicesSignpostLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218496;
    os_signpost_id_t v22 = v7;
    __int16 v23 = 2048;
    double v24 = Nanoseconds / 1000000000.0;
    __int16 v25 = 1026;
    BOOL v26 = v15;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: BackupWithRegisteredBackups  CloudServicesSignpostNameSecItemBackupWithRegisteredBackups=%{public,signpost.telemetry:number1,name=CloudServicesSignpostNameSecItemBackupWithRegisteredBackups}d ", buf, 0x1Cu);
  }

  return v15;
}

- (BOOL)backupWithRegisteredBackupViewWithError:(id)a3 error:(id *)a4
{
  id v5 = a3;
  int v6 = SecItemBackupWithRegisteredViewBackup();
  os_signpost_id_t v7 = CloudServicesLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)long long buf = 138412290;
      id v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "registered view!! %@", buf, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)long long buf = 138412290;
      id v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "failed to register view: %@", buf, 0xCu);
    }

    if (a4) {
      *a4 = 0;
    }
  }

  return v6;
}

- (BOOL)backupSetConfirmedManifest:(id)a3 digest:(id)a4 manifest:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  BOOL v12 = CloudServicesLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v10 sha1Digest];
    int v14 = [v13 hexString];
    BOOL v15 = [v9 hexString];
    *(_DWORD *)id v18 = 138412546;
    *(void *)&v18[4] = v14;
    __int16 v19 = 2112;
    os_signpost_id_t v20 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "setting manifest hash: %@, digest: %@", v18, 0x16u);
  }
  *(void *)id v18 = 0;
  char v16 = SecItemBackupSetConfirmedManifest();

  if (a6 && (v16 & 1) == 0) {
    *a6 = *(id *)v18;
  }

  return v16;
}

- (BOOL)backupWithChanges:(id)a3 error:(id *)a4 handler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = _CloudServicesSignpostLogSystem();
  os_signpost_id_t v10 = _CloudServicesSignpostCreate(v9);
  uint64_t v12 = v11;

  id v13 = _CloudServicesSignpostLogSystem();
  int v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "BackupWithChanges", " enableTelemetry=YES ", buf, 2u);
  }

  BOOL v15 = _CloudServicesSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    os_signpost_id_t v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: BackupWithChanges  enableTelemetry=YES ", buf, 0xCu);
  }

  id v16 = v8;
  int v17 = SecItemBackupWithChanges();
  BOOL v18 = v17;
  if (a4 && (v17 & 1) == 0) {
    *a4 = 0;
  }
  double Nanoseconds = _CloudServicesSignpostGetNanoseconds(v10, v12);
  os_signpost_id_t v20 = _CloudServicesSignpostLogSystem();
  BOOL v21 = v20;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_DWORD *)long long buf = 138543618;
    os_signpost_id_t v25 = (os_signpost_id_t)v7;
    __int16 v26 = 1026;
    LODWORD(v27) = v18;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_END, v10, "BackupWithChanges", " CloudServicesSignpostNameSecItemBackupWithChanges=%{public,signpost.telemetry:string1,name=CloudServicesSignpostNameSecItemBackupWithChanges}@  CloudServicesSignpostNameSecItemBackupWithChanges=%{public,signpost.telemetry:number1,name=CloudServicesSignpostNameSecItemBackupWithChanges}d ", buf, 0x12u);
  }

  os_signpost_id_t v22 = _CloudServicesSignpostLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218754;
    os_signpost_id_t v25 = v10;
    __int16 v26 = 2048;
    double v27 = Nanoseconds / 1000000000.0;
    __int16 v28 = 2114;
    id v29 = v7;
    __int16 v30 = 1026;
    BOOL v31 = v18;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: BackupWithChanges  CloudServicesSignpostNameSecItemBackupWithChanges=%{public,signpost.telemetry:string1,name=CloudServicesSignpostNameSecItemBackupWithChanges}@  CloudServicesSignpostNameSecItemBackupWithChanges=%{public,signpost.telemetry:number1,name=CloudServicesSignpostNameSecItemBackupWithChanges}d ", buf, 0x26u);
  }

  return v18;
}

- (id)copyMyPeerInfo:(id *)a3
{
  uint64_t v4 = SOSCCCopyMyPeerInfo();
  id v5 = (void *)v4;
  if (a3 && !v4) {
    *a3 = 0;
  }
  return v5;
}

- (id)copyPeerID:(id)a3
{
  id result = (id)SOSPeerInfoGetPeerID();
  if (result)
  {
    return (id)CFStringCreateCopy(0, (CFStringRef)result);
  }
  return result;
}

- (id)copyMyPeerID
{
  id v14 = 0;
  id v3 = [(SecureBackupDaemon *)self copyMyPeerInfo:&v14];
  id v4 = v14;
  if (v3)
  {
    CFStringRef v5 = [(SecureBackupDaemon *)self copyPeerID:v3];
  }
  else
  {
    int v6 = CloudServicesLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10004E6F8((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
    }

    CFStringRef v5 = @"unknown";
  }

  return (id)v5;
}

- (id)copyMyPeerIDWithError:(id *)a3
{
  id v4 = -[SecureBackupDaemon copyMyPeerInfo:](self, "copyMyPeerInfo:");
  if (v4)
  {
    id v5 = [(SecureBackupDaemon *)self copyPeerID:v4];
  }
  else
  {
    int v6 = CloudServicesLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10004E764();
    }

    id v5 = 0;
  }

  return v5;
}

- (id)copyBackupKey:(id)a3
{
  return (id)SOSPeerInfoCopyBackupKey();
}

- (id)copyBackupKeyForNewDeviceRecoverySecret:(id)a3 error:(id *)a4
{
  uint64_t v5 = SOSCopyDeviceBackupPublicKey();
  int v6 = (void *)v5;
  if (a4 && !v5) {
    *a4 = 0;
  }
  return v6;
}

- (id)copyMyPeerWithNewDeviceRecoverySecret:(id)a3 error:(id *)a4
{
  uint64_t v5 = SOSCCCopyMyPeerWithNewDeviceRecoverySecret();
  int v6 = (void *)v5;
  if (a4 && !v5) {
    *a4 = 0;
  }
  return v6;
}

- (id)copyEncodedData:(id)a3 error:(id *)a4
{
  uint64_t v5 = SOSPeerInfoCopyEncodedData();
  int v6 = (void *)v5;
  if (a4 && !v5) {
    *a4 = 0;
  }
  return v6;
}

- (BOOL)registerSingleRecoverySecret:(id)a3 iCDP:(BOOL)a4 error:(id *)a5
{
  char v6 = SOSCCRegisterSingleRecoverySecret();
  BOOL v7 = v6;
  if (a5 && (v6 & 1) == 0) {
    *a5 = 0;
  }
  return v7;
}

- (id)createPeerInfoFromData:(id)a3 error:(id *)a4
{
  uint64_t v5 = SOSPeerInfoCreateFromData();
  char v6 = (void *)v5;
  if (a4 && !v5) {
    *a4 = 0;
  }

  return v6;
}

- (id)copySerialNumber:(id)a3
{
  return (id)_SOSPeerInfoV2DictionaryCopyString(a3, sSerialNumberKey);
}

- (id)copyOSVersion:(id)a3
{
  id result = (id)SOSPeerInfoLookupGestaltValue();
  if (result)
  {
    return (id)CFStringCreateCopy(0, (CFStringRef)result);
  }
  return result;
}

- (id)allViews
{
  v2 = (void *)SOSViewCopyViewSet();
  id v3 = [v2 allObjects];
  id v4 = [v3 sortedArrayUsingSelector:"compare:"];

  return v4;
}

- (id)currentViews
{
  AllCurrent = (void *)SOSViewsGetAllCurrent();
  if (AllCurrent)
  {
    id v3 = [AllCurrent allObjects];
    id v4 = [v3 sortedArrayUsingSelector:"compare:"];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)circleChangedNotification
{
  if (OctagonPlatformSupportsSOS() && !_os_feature_enabled_impl()) {
    v2 = &kSOSCCCircleChangedNotification;
  }
  else {
    v2 = &OTTrustStatusChangeNotification;
  }
  id v3 = +[NSString stringWithUTF8String:*v2];

  return v3;
}

- (id)createEncodedDirectBackupSliceKeybagFromData:(id)a3 error:(id *)a4
{
  Direct = (void *)SOSBackupSliceKeyBagCreateDirect();
  if (Direct)
  {
    char v6 = (void *)SOSBSKBCopyEncoded();
    if (v6) {
      goto LABEL_10;
    }
    BOOL v7 = CloudServicesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10004E848();
    }
  }
  else
  {
    BOOL v7 = CloudServicesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10004E7E0();
    }
  }

  if (a4)
  {
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    [v8 setObject:0 forKeyedSubscript:NSUnderlyingErrorKey];

    *a4 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:19 userInfo:v8];
  }
  char v6 = 0;
LABEL_10:

  return v6;
}

- (BOOL)backupSliceKeybagHasRecoveryKey:(id)a3
{
  id v3 = [a3 bskb];
  if (v3) {
    char v4 = SOSBSKBHasRecoveryKey();
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)createDERDataFromPlist:(id)a3
{
  uint64_t v12 = 0;
  DERData = (void *)CFPropertyListCreateDERData();
  if (!DERData)
  {
    char v4 = CloudServicesLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10004E8B0(&v12, v4, v5, v6, v7, v8, v9, v10);
    }
  }

  return DERData;
}

- (id)createPlistFromDERData:(id)a3
{
  uint64_t v12 = 0;
  id v3 = (void *)CFPropertyListCreateWithDERData();
  if (!v3)
  {
    char v4 = CloudServicesLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10004E92C(&v12, v4, v5, v6, v7, v8, v9, v10);
    }
  }

  return v3;
}

- (id)createiCloudRecoveryPasswordWithError:(id *)a3
{
  char v4 = (void *)SecPasswordGenerate();
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 dataUsingEncoding:4];
  }
  else
  {
    uint64_t v7 = CloudServicesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10004E9A8();
    }

    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    [v8 setObject:@"SecPasswordGenerate() failed" forKeyedSubscript:NSLocalizedDescriptionKey];
    [v8 setObject:0 forKeyedSubscript:NSUnderlyingErrorKey];

    if (a3)
    {
      *a3 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:v8];
    }

    uint64_t v6 = 0;
  }

  return v6;
}

- (void)doEnableEscrowMultiICSCWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id))a4;
  id v8 = [(SecureBackupDaemon *)self massageOutgoingMetadataFromRequest:v6];
  uint64_t v9 = [v6 metadataHash];
  uint64_t v10 = [v9 objectForKeyedSubscript:kSecureBackupEncodedMetadataKey];

  uint64_t v11 = [v6 metadataHash];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"duplicateEncodedMetadata"];

  id v13 = +[NSMutableDictionary dictionary];
  if ([(SecureBackupDaemon *)self forceICDP])
  {
    id v14 = CloudServicesLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "FORCING ICDP + MULTIPLE ICSC", buf, 2u);
    }
  }
  BOOL v15 = [v6 passphrase];
  if ([v15 length])
  {

    goto LABEL_9;
  }
  unsigned int v16 = [v6 useCachedPassphrase];

  if (!v16) {
    goto LABEL_9;
  }
  int v17 = [(SecureBackupDaemon *)self cachedPassphrase];
  [v6 setPassphrase:v17];

  BOOL v18 = [v6 passphrase];
  id v19 = [v18 length];

  if (v19)
  {
LABEL_9:
    os_signpost_id_t v20 = [v6 passphrase];
    v145 = v13;
    v146 = v8;
    if ([v20 length])
    {
    }
    else
    {
      BOOL v21 = [v6 hsa2CachedPrerecordUUID];

      if (!v21) {
        goto LABEL_70;
      }
    }
    if ([v6 icdp]) {
      goto LABEL_13;
    }
    id v34 = [v6 countryDialCode];
    if ([v34 length])
    {
      id v35 = [v6 countryCode];
      if ([v35 length])
      {
        id v36 = [v6 smsTarget];
        if ([v36 length])
        {
          id v37 = [v6 appleID];
          if ([v37 length])
          {
            [v6 iCloudPassword];
            CFStringRef v38 = v12;
            id v39 = v10;
            id v40 = v6;
            v42 = CFStringRef v41 = v7;
            id v138 = [v42 length];

            uint64_t v7 = v41;
            id v6 = v40;
            uint64_t v10 = v39;
            uint64_t v12 = v38;

            id v13 = v145;
            if (v138)
            {
LABEL_13:
              os_signpost_id_t v22 = [v6 hsa2CachedPrerecordUUID];

              __int16 v23 = CloudServicesLog();
              BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
              if (v22)
              {
                if (v24)
                {
                  os_signpost_id_t v25 = [v6 hsa2CachedPrerecordUUID];
                  *(_DWORD *)long long buf = 138412290;
                  id v160 = v25;
                  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "enableWithRequest to escrow a prerecord: %@", buf, 0xCu);
                }
                id v158 = 0;
                __int16 v26 = +[SecEscrowRequest request:&v158];
                id v27 = v158;
                if (!v26)
                {
                  id v72 = CloudServicesLog();
                  id v8 = v146;
                  if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
                    sub_10004CE48();
                  }

                  v7[2](v7, v27);
                  goto LABEL_79;
                }
                __int16 v28 = [v6 hsa2CachedPrerecordUUID];
                id v157 = v27;
                id v29 = [v26 fetchPrerecord:v28 error:&v157];
                id v30 = v157;

                if (!v29 || v30)
                {
                  id v73 = v10;
                  NSErrorUserInfoKey v74 = v7;
                  CFStringRef v75 = CloudServicesLog();
                  if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
                    sub_10004EEB0();
                  }

                  NSErrorUserInfoKey v76 = +[NSMutableDictionary dictionary];
                  [v76 setObject:v30 forKeyedSubscript:NSUnderlyingErrorKey];
                  [v76 setObject:@"unable to fetch a prerecord" forKeyedSubscript:NSLocalizedDescriptionKey];
                  CFStringRef v77 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:38 userInfo:v76];
                  v74[2](v74, v77);

                  uint64_t v7 = v74;
                  id v27 = v30;
                  uint64_t v10 = v73;
                }
                else
                {
                  BOOL v31 = [[EscrowPrerecord alloc] initWithData:v29];
                  if (v31)
                  {
                    v143 = v10;
                    [v6 setPrerecord:v31];
                    [(SecureBackupDaemon *)self setPasscodeMetadata:v146 passphraseType:[(EscrowPrerecord *)v31 passphraseType]];
                    id v32 = CloudServicesLog();
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)long long buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "prepareHSA2: acquired prerecord", buf, 2u);
                    }
                    uint64_t v33 = v7;

                    id v27 = 0;
                    goto LABEL_33;
                  }
                  v96 = CloudServicesLog();
                  if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR)) {
                    sub_10004EF18();
                  }

                  BOOL v97 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:38 userInfo:0];
                  v7[2](v7, v97);

                  id v27 = v26;
                }
                id v13 = v145;
                id v8 = v146;
                goto LABEL_80;
              }
              v143 = v10;
              if (v24)
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "enableWithRequest to escrow a password", buf, 2u);
              }

              id v156 = 0;
              BOOL v31 = [(SecureBackupDaemon *)self makeRecordCandidate:v6 error:&v156];
              id v43 = v156;
              id v27 = v43;
              if (!v31)
              {
                if (!v43)
                {
                  id v80 = objc_alloc_init((Class)NSMutableDictionary);
                  [v80 setObject:@"could not create escrow record contents" forKeyedSubscript:NSLocalizedDescriptionKey];
                  id v27 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:v80];
                }
                CFStringRef v81 = CloudServicesLog();
                if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
                  sub_10004EB70();
                }

                v7[2](v7, v27);
                goto LABEL_82;
              }
              uint64_t v33 = v7;
              __int16 v26 = [(EscrowPrerecord *)v31 recordContents];
              [v6 setEscrowRecord:v26];
LABEL_33:

              id v13 = v145;
              [v145 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecureBackupUsesMultipleiCSCKey];
              uint64_t v44 = [(EscrowPrerecord *)v31 timestamp];
              [v145 setObject:v44 forKeyedSubscript:kSecureBackupTimestampKey];

              __int16 v45 = [(EscrowPrerecord *)v31 sosBackupKeybagDigest];
              uint64_t v139 = kSecureBackupKeybagDigestKey;
              objc_msgSend(v145, "setObject:forKeyedSubscript:", v45);

              __int16 v46 = [(EscrowPrerecord *)v31 escrowedSPKI];
              [v145 setObject:v46 forKeyedSubscript:kSecureBackupEscrowedSPKIKey];

              NSErrorUserInfoKey v47 = [(EscrowPrerecord *)v31 bottleID];
              [v145 setObject:v47 forKeyedSubscript:kSecureBackupBottleIDKey];

              uint64_t v48 = [(EscrowPrerecord *)v31 passcodeGeneration];
              if (v48)
              {
                BOOL v49 = (void *)v48;
                NSErrorUserInfoKey v50 = [(EscrowPrerecord *)v31 passcodeGeneration];
                unsigned int v51 = [v50 hasValue];

                if (v51)
                {
                  id v52 = [(EscrowPrerecord *)v31 passcodeGeneration];
                  CFStringRef v53 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v52 value]);
                  [v145 setObject:v53 forKeyedSubscript:kSecureBackupPasscodeGenerationKey];
                }
              }
              if (v146)
              {
                unint64_t v54 = [(EscrowPrerecord *)v31 timestamp];
                [v146 setObject:v54 forKeyedSubscript:kSecureBackupMetadataTimestampKey];

                [v145 setObject:v146 forKeyedSubscript:kSecureBackupClientMetadataKey];
              }
              id v55 = [v6 smsTarget];

              if (!v55)
              {
LABEL_41:
                unsigned int v60 = [(SecureBackupDaemon *)self _gestaltValueForKey:@"SerialNumber"];
                [v145 setObject:v60 forKeyedSubscript:kSecureBackupSerialNumberKey];

                long long v61 = [(SecureBackupDaemon *)self _gestaltValueForKey:@"BuildVersion"];
                [v145 setObject:v61 forKeyedSubscript:kSecureBackupBuildVersionKey];

                if (!OctagonPlatformSupportsSOS() || (_os_feature_enabled_impl() & 1) != 0)
                {
                  long long v62 = (__CFString *)objc_alloc_init((Class)OTConfigurationContext);
                  long long v63 = sub_100010238();
                  [(__CFString *)v62 setAltDSID:v63];

                  [(__CFString *)v62 setContext:OTDefaultContext];
                  id v152 = 0;
                  id v141 = [objc_alloc((Class)OTClique) initWithContextData:v62];
                  long long v64 = [v141 cliqueMemberIdentifier:&v152];
                  id v65 = v152;
                  [v6 setRecordID:v64];

                  uint64_t v66 = [v6 recordID];

                  uint64_t v7 = v33;
                  if (!v66 || v65)
                  {
                    id v82 = v65;
                    BOOL v83 = CloudServicesLog();
                    uint64_t v10 = v143;
                    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
                      sub_10004EBD8();
                    }

                    id v8 = v146;
                    id v71 = v82;
                    if (!v82)
                    {
                      long long v84 = +[NSDictionary dictionaryWithObjectsAndKeys:@"OTClique no cliqueMemberIdentifier", NSLocalizedDescriptionKey, 0];
                      id v71 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:44 userInfo:v84];

                      id v8 = v146;
                    }
                    v7[2](v7, v71);

                    goto LABEL_116;
                  }
                  id v67 = v62;
                  v140 = 0;
                  uint64_t v10 = v143;
                  goto LABEL_46;
                }
                __int16 v98 = [(EscrowPrerecord *)v31 sosBackupKeybagPassword];
                id v154 = 0;
                id v99 = [(SecureBackupDaemon *)self copyMyPeerWithNewDeviceRecoverySecret:v98 error:&v154];
                v137 = (__CFString *)v154;

                uint64_t v7 = v33;
                id v141 = v99;
                if (v99)
                {
                  __int16 v100 = [(SecureBackupDaemon *)self copyPeerID:v99];
                  if (v100)
                  {
                    long long v62 = v100;
                    [v6 setRecordID:v100];
                    uint64_t v101 = [(EscrowPrerecord *)v31 sosPeerID];
                    if (v101)
                    {
                      __int16 v102 = (void *)v101;
                      CFStringRef v103 = [(EscrowPrerecord *)v31 sosPeerID];
                      id v104 = (__CFString *)v103;
                      uint64_t v105 = v103 ? (__CFString *)v103 : @"not possible";
                      unsigned __int8 v106 = [(__CFString *)v62 isEqualToString:v105];

                      if (v106)
                      {
                        id v107 = CloudServicesLog();
                        if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_WORD *)long long buf = 0;
                          _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "Escrow record peer ID matches peer ID at backup time", buf, 2u);
                        }

                        unsigned int v108 = CloudServicesLog();
                        if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
                        {
                          v109 = [v6 recordID];
                          *(_DWORD *)long long buf = 138412290;
                          id v160 = v109;
                          _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "Escrow record ID will be %@", buf, 0xCu);
                        }
                        id v110 = [(SecureBackupDaemon *)self copyBackupKey:v141];
                        v136 = v110;
                        if (v110)
                        {
                          v111 = [v110 sha1Digest];
                          v112 = [(EscrowPrerecord *)v31 sosBackupKeybagDigest];
                          v135 = v111;
                          unsigned __int8 v113 = [v111 isEqual:v112];

                          v114 = CloudServicesLog();
                          v115 = v114;
                          if (v113)
                          {
                            if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
                            {
                              *(_DWORD *)long long buf = 138412802;
                              id v160 = v62;
                              __int16 v161 = 2112;
                              id v162 = v136;
                              __int16 v163 = 2112;
                              v164 = v135;
                              _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_DEFAULT, "SOSCCCopyMyPeerWithNewDeviceRecoverySecret() called got peer ID: %@, backup key: %@, digest: %@", buf, 0x20u);
                            }

                            [v145 setObject:v135 forKeyedSubscript:v139];
                            v153 = v137;
                            id v116 = [(SecureBackupDaemon *)self copyEncodedData:v141 error:&v153];
                            id v67 = v153;

                            uint64_t v7 = v33;
                            if (v116)
                            {
                              [v145 setObject:v116 forKeyedSubscript:kSecureBackupPeerInfoDataKey];
                              uint64_t v10 = v143;
                            }
                            else
                            {
                              CFStringRef v134 = CloudServicesLog();
                              uint64_t v10 = v143;
                              if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR)) {
                                sub_10004EE14();
                              }

                              id v116 = 0;
                            }

                            v140 = v62;
LABEL_46:

                            [v6 setMetadata:v145];
                            [v6 setEncodedMetadata:v10];
                            [v6 setDuplicateEncodedMetadata:v12];
                            id v68 = [EscrowService alloc];
                            id v69 = [(SecureBackupDaemon *)self operationsLogger];
                            id v70 = [(EscrowService *)v68 initWithOperationsLogger:v69];

                            id v71 = v70;
                            v147[0] = _NSConcreteStackBlock;
                            v147[1] = 3221225472;
                            v147[2] = sub_10004733C;
                            v147[3] = &unk_1000715E8;
                            v147[4] = self;
                            id v148 = v6;
                            v149 = v140;
                            id v150 = v145;
                            v151 = v7;
                            long long v62 = v140;
                            [(EscrowService *)v70 storeRecordWithRequest:v148 completionBlock:v147];

                            id v8 = v146;
LABEL_116:

LABEL_79:
                            id v13 = v145;
                            goto LABEL_80;
                          }
                          if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR)) {
                            sub_10004EE7C();
                          }

                          uint64_t v132 = kSecureBackupErrorDomain;
                          NSErrorUserInfoKey v165 = NSLocalizedDescriptionKey;
                          CFStringRef v166 = @"SOS backup keybag digest mismatch";
                          uint64_t v133 = +[NSDictionary dictionaryWithObjects:&v166 forKeys:&v165 count:1];
                          id v131 = +[NSError errorWithDomain:v132 code:37 userInfo:v133];

                          id v27 = (id)v133;
                          uint64_t v7 = v33;
                          id v8 = v146;
                          id v129 = v135;
                        }
                        else
                        {
                          v128 = CloudServicesLog();
                          if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR)) {
                            sub_10004EDAC();
                          }

                          id v129 = objc_alloc_init((Class)NSMutableDictionary);
                          [v129 setObject:@"SOSPeerInfoCopyBackupKey() returned no backup public key for peer" forKeyedSubscript:NSLocalizedDescriptionKey];
                          id v130 = objc_alloc((Class)NSError);
                          id v131 = [v130 initWithDomain:kSecureBackupErrorDomain code:20 userInfo:v129];
                          uint64_t v7 = v33;
                          id v8 = v146;
                        }

                        v7[2](v7, v131);
                        id v27 = v131;
                        uint64_t v10 = v143;
LABEL_115:
                        id v71 = v137;
                        goto LABEL_116;
                      }
                    }
                    v122 = CloudServicesLog();
                    if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR)) {
                      sub_10004ECF8((uint64_t)v62, v31, v122);
                    }

                    uint64_t v123 = kSecureBackupErrorDomain;
                    NSErrorUserInfoKey v167 = NSLocalizedDescriptionKey;
                    CFStringRef v168 = @"SOS peer ID mismatch";
                    CFStringRef v124 = +[NSDictionary dictionaryWithObjects:&v168 forKeys:&v167 count:1];
                    uint64_t v125 = +[NSError errorWithDomain:v123 code:24 userInfo:v124];

                    uint64_t v7 = v33;
                    v33[2](v33, (id)v125);
                    id v27 = (id)v125;
LABEL_114:
                    uint64_t v10 = v143;

                    id v8 = v146;
                    goto LABEL_115;
                  }
                  v126 = CloudServicesLog();
                  if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR)) {
                    sub_10004ECC4();
                  }

                  id v120 = objc_alloc_init((Class)NSMutableDictionary);
                  id v118 = v120;
                  NSErrorUserInfoKey v119 = NSLocalizedDescriptionKey;
                  CFStringRef v121 = @"SOSPeerInfoGetPeerID() failed";
                }
                else
                {
                  unsigned __int8 v117 = CloudServicesLog();
                  if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR)) {
                    sub_10004EC40(v137);
                  }

                  id v118 = objc_alloc_init((Class)NSMutableDictionary);
                  [v118 setObject:@"SOSCCCopyMyPeerWithNewDeviceRecoverySecret() failed" forKeyedSubscript:NSLocalizedDescriptionKey];
                  NSErrorUserInfoKey v119 = NSUnderlyingErrorKey;
                  id v120 = v118;
                  CFStringRef v121 = v137;
                }
                [v120 setObject:v121 forKeyedSubscript:v119];
                uint64_t v127 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:17 userInfo:v118];

                v33[2](v33, (id)v127);
                long long v62 = 0;
                id v27 = (id)v127;
                goto LABEL_114;
              }
              NSErrorUserInfoKey v56 = [v6 smsTarget];
              id v155 = v27;
              id v57 = [(SecureBackupDaemon *)self normalizeSMSTarget:v56 error:&v155];
              id v58 = v155;

              [v6 setSmsTarget:v57];
              id v59 = [v6 smsTarget];

              if (v59)
              {
                id v27 = v58;
                goto LABEL_41;
              }
              uint64_t v7 = v33;
              v33[2](v33, v58);

              id v27 = v58;
              uint64_t v10 = v143;
LABEL_82:
              id v8 = v146;
              goto LABEL_80;
            }
LABEL_70:
            BOOL v142 = v12;
            v144 = v10;
            id v85 = v7;
            uint64_t v86 = CloudServicesLog();
            if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
              sub_10004EA44(v6, v86);
            }

            id v87 = objc_alloc((Class)NSString);
            uint64_t v88 = [v6 passphrase];
            if (v88) {
              CFStringRef v89 = @"non-";
            }
            else {
              CFStringRef v89 = &stru_100072CF8;
            }
            CFStringRef v90 = [v6 smsTarget];
            id v91 = [v6 appleID];
            CFStringRef v92 = [v6 iCloudPassword];
            if (v92) {
              CFStringRef v93 = @"non-";
            }
            else {
              CFStringRef v93 = &stru_100072CF8;
            }
            id v27 = [v87 initWithFormat:@"attempted to enable backup, with invalid parameters: %@nil recovery password, %@, %@, %@nil iCloud password", v89, v90, v91, v93];

            id v94 = objc_alloc_init((Class)NSMutableDictionary);
            [v94 setObject:v27 forKeyedSubscript:NSLocalizedDescriptionKey];
            unsigned __int8 v95 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:4 userInfo:v94];
            uint64_t v7 = v85;
            v85[2](v85, v95);

            id v8 = v146;
            uint64_t v12 = v142;
            uint64_t v10 = v144;
            goto LABEL_79;
          }
        }
      }
    }
    goto LABEL_70;
  }
  NSErrorUserInfoKey v78 = CloudServicesLog();
  if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
    sub_10004EA10();
  }

  id v27 = objc_alloc_init((Class)NSMutableDictionary);
  [v27 setObject:@"Missing cached passphrase" forKeyedSubscript:NSLocalizedDescriptionKey];
  CFStringRef v79 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:9 userInfo:v27];
  v7[2](v7, v79);

LABEL_80:
}

- (void)setPasscodeMetadata:(id)a3 passphraseType:(int)a4
{
  id v5 = a3;
  if (a4 <= 3)
  {
    uint64_t v6 = (uint64_t)*(&off_1000721F0 + a4);
    uint64_t v7 = (uint64_t)*(&off_100072210 + a4);
    id v8 = (&off_100072230)[a4];
    id v9 = v5;
    [v5 setObject:v6 forKeyedSubscript:kSecureBackupUsesComplexPassphraseKey];
    [v9 setObject:v7 forKeyedSubscript:kSecureBackupUsesNumericPassphraseKey];
    [v9 setObject:v8 forKeyedSubscript:kSecureBackupNumericPassphraseLengthKey];
    id v5 = v9;
  }
}

- (id)makeRecordCandidate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(SecureBackupEscrowRecordCandidate);
  id v68 = 0;
  id v8 = [(SecureBackupDaemon *)self createiCloudRecoveryPasswordWithError:&v68];
  id v9 = v68;
  [(SecureBackupEscrowRecordCandidate *)v7 setSosBackupKeybagPassword:v8];
  if (v8)
  {
    id v10 = +[CSDateUtilities posixDateFormatter];
    uint64_t v11 = +[NSDate date];
    uint64_t v12 = [v10 stringFromDate:v11];

    [(SecureBackupEscrowRecordCandidate *)v7 setTimestamp:v12];
    if (!OctagonPlatformSupportsSOS() || (_os_feature_enabled_impl() & 1) != 0)
    {
      id v46 = v9;
      goto LABEL_5;
    }
    id v67 = v9;
    id v31 = [(SecureBackupDaemon *)self copyMyPeerIDWithError:&v67];
    id v46 = v67;

    [(SecureBackupEscrowRecordCandidate *)v7 setSosPeerID:v31];
    id v32 = [(SecureBackupEscrowRecordCandidate *)v7 sosPeerID];
    if (v32) {
      BOOL v33 = v46 == 0;
    }
    else {
      BOOL v33 = 0;
    }
    int v34 = !v33;

    id v35 = CloudServicesLog();
    id v36 = v35;
    if (v34)
    {
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_10004EFB4();
      }

      if (a4)
      {
        id v17 = objc_alloc_init((Class)NSMutableDictionary);
        [v17 setObject:@"SOSCopyPeerID() failed" forKeyedSubscript:NSLocalizedDescriptionKey];
        [v17 setObject:v46 forKeyedSubscript:NSUnderlyingErrorKey];
        id v37 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:17 userInfo:v17];
LABEL_55:
        BOOL v18 = 0;
        *a4 = v37;
        goto LABEL_43;
      }
    }
    else
    {
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        id v40 = [(SecureBackupEscrowRecordCandidate *)v7 sosPeerID];
        LODWORD(v73) = 138412290;
        *(void *)((char *)&v73 + 4) = v40;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Creating record candidate with SOS peerID %@", (uint8_t *)&v73, 0xCu);
      }
      id v66 = 0;
      id v41 = [(SecureBackupDaemon *)self copyBackupKeyForNewDeviceRecoverySecret:v8 error:&v66];
      id v46 = v66;
      if (v41)
      {
        NSErrorUserInfoKey v42 = [v41 sha1Digest];
        [(SecureBackupEscrowRecordCandidate *)v7 setSosBackupKeybagDigest:v42];

LABEL_5:
        id v13 = objc_alloc_init((Class)OTConfigurationContext);
        id v14 = sub_100010238();
        [v13 setAltDSID:v14];

        [v13 setContext:OTDefaultContext];
        id v15 = [objc_alloc((Class)OTClique) initWithContextData:v13];
        *(void *)&long long v73 = 0;
        *((void *)&v73 + 1) = &v73;
        uint64_t v74 = 0x3032000000;
        CFStringRef v75 = sub_100047DE0;
        NSErrorUserInfoKey v76 = sub_100047DF0;
        id v77 = 0;
        uint64_t v60 = 0;
        long long v61 = &v60;
        uint64_t v62 = 0x3032000000;
        long long v63 = sub_100047DE0;
        long long v64 = sub_100047DF0;
        id v65 = 0;
        uint64_t v54 = 0;
        id v55 = &v54;
        uint64_t v56 = 0x3032000000;
        id v57 = sub_100047DE0;
        id v58 = sub_100047DF0;
        id v59 = 0;
        uint64_t v48 = 0;
        BOOL v49 = &v48;
        uint64_t v50 = 0x3032000000;
        unsigned int v51 = sub_100047DE0;
        id v52 = sub_100047DF0;
        id v53 = 0;
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_100047DF8;
        v47[3] = &unk_1000721D0;
        v47[4] = &v48;
        v47[5] = &v54;
        v47[6] = &v73;
        v47[7] = &v60;
        [v15 fetchEscrowContents:v47];
        unsigned int v16 = (void *)v49[5];
        if (v16)
        {
          if (a4)
          {
            id v17 = 0;
            BOOL v18 = 0;
            *a4 = v16;
LABEL_42:
            _Block_object_dispose(&v48, 8);

            _Block_object_dispose(&v54, 8);
            _Block_object_dispose(&v60, 8);

            _Block_object_dispose(&v73, 8);
LABEL_43:

LABEL_44:
            id v9 = v46;
            goto LABEL_45;
          }
        }
        else
        {
          if (*(void *)(*((void *)&v73 + 1) + 40) && v61[5] && v55[5])
          {
            os_signpost_id_t v20 = CloudServicesLog();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v21 = *(void *)(*((void *)&v73 + 1) + 40);
              id v22 = [(id)v61[5] length];
              *(_DWORD *)long long buf = 138412546;
              uint64_t v70 = v21;
              __int16 v71 = 2048;
              id v72 = v22;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Including contents for bottle ID %@ (%llu bytes)", buf, 0x16u);
            }

            [(SecureBackupEscrowRecordCandidate *)v7 setEscrowedSPKI:v55[5]];
            [(SecureBackupEscrowRecordCandidate *)v7 setBottleID:*(void *)(*((void *)&v73 + 1) + 40)];
            id v17 = (id)v61[5];
            __int16 v45 = (void *)MKBGetDeviceConfigurations();
            if (v45)
            {
              __int16 v23 = [v45 objectForKeyedSubscript:@"PasscodeGeneration"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                BOOL v24 = objc_alloc_init(EscrowPrerecordPasscodeGeneration);
                [(SecureBackupEscrowRecordCandidate *)v7 setPasscodeGeneration:v24];

                id v43 = [v23 unsignedLongLongValue];
                os_signpost_id_t v25 = [(SecureBackupEscrowRecordCandidate *)v7 passcodeGeneration];
                [v25 setValue:v43];
              }
            }
            id v26 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:5];
            id v27 = [(SecureBackupEscrowRecordCandidate *)v7 sosBackupKeybagDigest];
            [v26 setObject:v27 forKeyedSubscript:kSecureBackupKeybagDigestKey];

            [v26 setObject:v8 forKeyedSubscript:kSecureBackupBagPasswordKey];
            [v26 setObject:@"1" forKeyedSubscript:@"BackupVersion"];
            [v26 setObject:v12 forKeyedSubscript:kSecureBackupTimestampKey];
            if ([v6 requiresDoubleEnrollment])
            {
              uint64_t v44 = +[NSUUID UUID];
              __int16 v28 = [v44 UUIDString];
              [v26 setObject:v28 forKeyedSubscript:@"DoubleEnrollmentPassword"];

              [v26 setObject:&off_1000760D8 forKeyedSubscript:@"DoubleEnrollmentVersion"];
            }
            id v29 = [v6 idmsData];

            if (v29)
            {
              id v30 = [v6 idmsData];
              [v26 setObject:v30 forKeyedSubscript:kSecureBackupIDMSDataKey];
            }
            if (v17) {
              [v26 setObject:v17 forKeyedSubscript:@"BottledPeerEntropy"];
            }
            [(SecureBackupEscrowRecordCandidate *)v7 setRecordContents:v26];
            BOOL v18 = v7;

            goto LABEL_42;
          }
          if (a4)
          {
            id v38 = objc_alloc_init((Class)NSMutableDictionary);
            [v38 setObject:@"fetchEscrowContents failed" forKeyedSubscript:NSLocalizedDescriptionKey];
            *a4 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:46 userInfo:v38];
          }
        }
        id v17 = 0;
        BOOL v18 = 0;
        goto LABEL_42;
      }
      if (a4)
      {
        id v17 = objc_alloc_init((Class)NSMutableDictionary);
        [v17 setObject:@"copyBackupKeyForNewDeviceRecoverySecret() failed" forKeyedSubscript:NSLocalizedDescriptionKey];
        [v17 setObject:v46 forKeyedSubscript:NSUnderlyingErrorKey];
        id v37 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:17 userInfo:v17];
        goto LABEL_55;
      }
    }
    BOOL v18 = 0;
    goto LABEL_44;
  }
  id v19 = CloudServicesLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_10004EF4C();
  }

  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  [v10 setObject:@"could not create backup bag password" forKeyedSubscript:NSLocalizedDescriptionKey];
  if (a4)
  {
    +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:v10];
    BOOL v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_45:

  return v18;
}

@end