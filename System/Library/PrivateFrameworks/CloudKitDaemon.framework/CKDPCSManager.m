@interface CKDPCSManager
+ (id)_legacyServiceNameForContainerID:(id)a3;
+ (id)allProtectionIdentifiersFromShareProtection:(_OpaquePCSShareProtection *)a3;
+ (id)etagFromPCSData:(id)a3;
+ (id)noMatchingIdentityErrorForPCSError:(id)a3 withErrorCode:(int64_t)a4 description:(id)a5;
+ (id)pcsOverrideKeys;
+ (id)protectionIdentifierFromShareProtection:(_OpaquePCSShareProtection *)a3;
+ (id)publicKeyIDFromIdentity:(_OpaquePCSShareProtection *)a3;
- (BOOL)_addPublicIdentityForService:(unint64_t)a3 toSharePCS:(_OpaquePCSShareProtection *)a4 withError:(id *)a5;
- (BOOL)_checkAndClearPCSTestOverrideForKey:(id)a3;
- (BOOL)_checkPCSTestOverrideForKey:(id)a3;
- (BOOL)_checkUnitTestOverridesForDecryptionFailuresWithState:(BOOL)a3 error:(id *)a4;
- (BOOL)_isAllowlistedKeyRollingContainerID:(id)a3;
- (BOOL)_isKeyRollingUnitTestContainerID:(id)a3;
- (BOOL)addRandomShareeToPCS:(_OpaquePCSShareProtection *)a3;
- (BOOL)addSharePCS:(_OpaquePCSShareProtection *)a3 toRecordPCS:(_OpaquePCSShareProtection *)a4 error:(id *)a5;
- (BOOL)addSharePCS:(_OpaquePCSShareProtection *)a3 toRecordPCS:(_OpaquePCSShareProtection *)a4 permission:(unint64_t)a5 error:(id *)a6;
- (BOOL)availableIdentityForService:(unint64_t)a3 error:(id *)a4;
- (BOOL)canRollShareKeys;
- (BOOL)containerSupportsEnhancedContext;
- (BOOL)currentServiceIsManatee;
- (BOOL)decryptSharedZonePCSData:(id)a3 withInvitedPCS:(_OpaquePCSShareProtection *)a4 error:(id *)a5;
- (BOOL)forceEnableReadOnlyManatee;
- (BOOL)isPCSSizeTooBigForKeyRoll:(unint64_t)a3;
- (BOOL)isPCSTooBigForKeyRoll:(_OpaquePCSShareProtection *)a3;
- (BOOL)isPreviouslyUndecryptablePCS:(id)a3;
- (BOOL)isRemindersZoneThatNeedsUpdate:(_OpaquePCSShareProtection *)a3;
- (BOOL)recordProtectionDataNeedsCounterSign:(id)a3 error:(id *)a4;
- (BOOL)removePublicKeys:(id)a3 fromPCS:(_OpaquePCSShareProtection *)a4;
- (BOOL)removeSharePCS:(_OpaquePCSShareProtection *)a3 fromRecordPCS:(_OpaquePCSShareProtection *)a4 error:(id *)a5;
- (BOOL)serviceTypeIsManatee:(unint64_t)a3;
- (BOOL)sharingFingerprintsContainPublicKeyWithData:(id)a3 error:(id *)a4;
- (BOOL)updateSigningIdentityOnPCS:(_OpaquePCSShareProtection *)a3 usingSignedPCS:(_OpaquePCSShareProtection *)a4;
- (BOOL)useZoneWidePCS;
- (BOOL)validateFullPublicKeySignature:(id)a3 forSignedData:(id)a4 error:(id *)a5;
- (BOOL)validateSignature:(id)a3 forSignedData:(id)a4 usingIdentityType:(unint64_t)a5 error:(id *)a6;
- (BOOL)zonePCSNeedsKeyRolled:(_OpaquePCSShareProtection *)a3;
- (BOOL)zonePCSNeedsKeyRolled:(_OpaquePCSShareProtection *)a3 isZoneishZone:(BOOL)a4 bypassAllowlistedContainers:(BOOL)a5;
- (BOOL)zonePCSNeedsUpdate:(_OpaquePCSShareProtection *)a3;
- (CKContainerID)containerID;
- (CKDAccount)account;
- (CKDContainerScopedUserIDProvider)containerScopedUserIDProvider;
- (CKDLogicalDeviceContext)deviceContext;
- (CKDPCSIdentityManager)identityManager;
- (CKDPCSManager)initWithContainer:(id)a3 account:(id)a4;
- (NSData)boundaryKeyData;
- (NSDate)lastMissingManateeIdentityErrorDateForCurrentService;
- (NSMutableDictionary)pcsTestOverrides;
- (NSMutableSet)undecryptablePCSDataHashes;
- (NSString)pcsServiceName;
- (NSString)responsibleBundleID;
- (NSUUID)uuid;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)synchronizeQueue;
- (_OpaquePCSShareProtection)createChainPCSWithError:(id *)a3;
- (_OpaquePCSShareProtection)createEmptySharePCSOfType:(unint64_t)a3 error:(id *)a4;
- (_OpaquePCSShareProtection)createEmptySignedSharePCSOfType:(unint64_t)a3 forPCSServiceType:(unint64_t)a4 withError:(id *)a5;
- (_OpaquePCSShareProtection)createPCSObjectFromData:(id)a3 ofType:(unint64_t)a4 sharedToPCS:(_OpaquePCSShareProtection *)a5 error:(id *)a6;
- (_OpaquePCSShareProtection)createPCSObjectFromData:(id)a3 ofType:(unint64_t)a4 sharedToPCS:(_OpaquePCSShareProtection *)a5 logFailure:(BOOL)a6 error:(id *)a7;
- (_OpaquePCSShareProtection)createPCSObjectFromData:(id)a3 ofType:(unint64_t)a4 sharedToPCS:(_OpaquePCSShareProtection *)a5 logFailure:(BOOL)a6 trusts:(id)a7 error:(id *)a8;
- (_OpaquePCSShareProtection)createPCSObjectFromData:(id)a3 ofType:(unint64_t)a4 sharedToPCS:(_OpaquePCSShareProtection *)a5 trusts:(id)a6 error:(id *)a7;
- (_OpaquePCSShareProtection)createRecordPCSWithEncryptedZonePCS:(__CFData *)a3 sharePCS:(_OpaquePCSShareProtection *)a4 createLite:(BOOL)a5 error:(id *)a6;
- (_OpaquePCSShareProtection)createRecordPCSWithZonePCS:(_OpaquePCSShareProtection *)a3 sharePCS:(_OpaquePCSShareProtection *)a4 createLite:(BOOL)a5 error:(id *)a6;
- (_OpaquePCSShareProtection)createSharePCSFromData:(id)a3 ofType:(unint64_t)a4 withService:(unint64_t)a5 error:(id *)a6;
- (_OpaquePCSShareProtection)createSharePCSFromData:(id)a3 ofType:(unint64_t)a4 withService:(unint64_t)a5 logFailure:(BOOL)a6 error:(id *)a7;
- (_OpaquePCSShareProtection)createSharePCSFromData:(id)a3 sharePrivateKey:(id)a4 error:(id *)a5;
- (_OpaquePCSShareProtection)createSharePCSFromData:(id)a3 sharingIdentity:(_PCSIdentityData *)a4 error:(id *)a5;
- (_OpaquePCSShareProtection)createSharePCSFromData:(id)a3 sharingIdentity:(_PCSIdentityData *)a4 logFailure:(BOOL)a5 error:(id *)a6;
- (_OpaquePCSShareProtection)createSharePCSFromEncryptedData:(id)a3 error:(id *)a4;
- (_OpaquePCSShareProtection)createSharePCSOfType:(unint64_t)a3 forPCSServiceType:(unint64_t)a4 error:(id *)a5;
- (_OpaquePCSShareProtection)createSharePublicPCSWithIdentity:(_PCSIdentityData *)a3 error:(id *)a4;
- (_OpaquePCSShareProtection)createZonePCSWithError:(id *)a3;
- (_PCSIdentityData)createCombinedIdentityWithOutOfNetworkPrivateKey:(id)a3 publicSharingIdentity:(id)a4;
- (_PCSIdentityData)createRandomSharingIdentityWithError:(id *)a3;
- (_PCSIdentityData)createSharingIdentityFromData:(id)a3 error:(id *)a4;
- (_PCSIdentityData)debugSharingIdentity;
- (_PCSPublicIdentityData)copyDiversifiedPublicIdentityForService:(unint64_t)a3 withError:(id *)a4;
- (_PCSPublicIdentityData)copyPublicAuthorshipIdentityFromPCS:(_OpaquePCSShareProtection *)a3;
- (_PCSPublicIdentityData)createPublicSharingIdentityFromPublicKey:(id)a3 error:(id *)a4;
- (id)_addIdentity:(_PCSIdentitySetData *)a3 withService:(unint64_t)a4 toPCS:(_OpaquePCSShareProtection *)a5;
- (id)_pcsObjectKindForCKDPCSBlobType:(unint64_t)a3;
- (id)_pcsTestOverrideForKey:(id)a3;
- (id)_unwrapEncryptedData:(id)a3 usingKeyID:(id)a4 forPCS:(_OpaquePCSShareProtection *)a5 withContextString:(id)a6;
- (id)addIdentityBackToPCS:(_OpaquePCSShareProtection *)a3;
- (id)addIdentityForService:(unint64_t)a3 toPCS:(_OpaquePCSShareProtection *)a4;
- (id)addPublicIdentity:(_PCSPublicIdentityData *)a3 toSharePCS:(_OpaquePCSShareProtection *)a4 permission:(unsigned int)a5;
- (id)addSharingIdentity:(_PCSIdentityData *)a3 toSharePCS:(_OpaquePCSShareProtection *)a4 permission:(unint64_t)a5;
- (id)copyAllPublicKeysForService:(unint64_t)a3 withError:(id *)a4;
- (id)copyDiversifiedPublicKeyForService:(unint64_t)a3 withError:(id *)a4;
- (id)copyPublicKeyForService:(unint64_t)a3 withError:(id *)a4;
- (id)counterSignRecordPCS:(_OpaquePCSShareProtection *)a3 zonePCS:(_OpaquePCSShareProtection *)a4;
- (id)createCloudKitFeaturesSignatureForData:(id)a3 forScope:(unint64_t)a4 error:(id *)a5;
- (id)createNewSharePCSDataForShareWithID:(id)a3 withPublicSharingKey:(id)a4 addDebugIdentity:(BOOL)a5 error:(id *)a6;
- (id)createProtectionInfoFromOONPrivateKey:(id)a3 privateToken:(id)a4 OONProtectionInfo:(id)a5 error:(id *)a6;
- (id)createSignatureWithIdentity:(_PCSIdentityData *)a3 dataToBeSigned:(id)a4 forScope:(unint64_t)a5 error:(id *)a6;
- (id)dataFromRecordPCS:(_OpaquePCSShareProtection *)a3 error:(id *)a4;
- (id)dataFromSharePCS:(_OpaquePCSShareProtection *)a3 pcsBlobType:(unint64_t)a4 error:(id *)a5;
- (id)dataFromSharingIdentity:(_PCSIdentityData *)a3 error:(id *)a4;
- (id)dataFromZonePCS:(_OpaquePCSShareProtection *)a3 error:(id *)a4;
- (id)decryptChainPCSForRecordPCS:(id)a3;
- (id)etagFromSharePCS:(_OpaquePCSShareProtection *)a3 error:(id *)a4;
- (id)etagFromZonePCS:(_OpaquePCSShareProtection *)a3 error:(id *)a4;
- (id)generateAnonymousCKUserIDForCurrentUserInShare:(id)a3 containerID:(id)a4 acceptA2AShareUsingVersionOneAnonymousIdentifier:(BOOL)a5;
- (id)generateOONPrivateKeyWithError:(id *)a3;
- (id)generateOctopusAnonymousUserID;
- (id)getAllPublicKeysForExportedData:(id)a3 error:(id *)a4;
- (id)getCurrentIdentityExportedPrivateKey;
- (id)keyRollForZoneWideShareRecordPCS:(id)a3 sharedZonePCS:(id)a4 sharePCS:(id)a5 forOperation:(id)a6;
- (id)keyRollForZoneWideShareWithZonePCS:(id)a3 sharePCS:(id)a4 forOperation:(id)a5;
- (id)keyRollIfNeededForPerRecordPCS:(id)a3 needsRollAndCounterSign:(BOOL)a4 forOperation:(id)a5 didRoll:(BOOL *)a6;
- (id)participantPublicKeyForServiceType:(unint64_t)a3 error:(id *)a4;
- (id)publicKeyDataFromPCS:(_OpaquePCSShareProtection *)a3 error:(id *)a4;
- (id)publicKeyFromSignature:(id)a3 error:(id *)a4;
- (id)referenceIdentifierStringFromAssetKey:(id)a3;
- (id)removeEncryptedPCS:(id)a3 fromSharePCS:(_OpaquePCSShareProtection *)a4;
- (id)removePrivateKeysForKeyIDs:(id)a3 fromPCS:(_OpaquePCSShareProtection *)a4;
- (id)removePublicIdentity:(_PCSPublicIdentityData *)a3 fromSharePCS:(_OpaquePCSShareProtection *)a4;
- (id)removePublicKeyID:(id)a3 fromPCS:(_OpaquePCSShareProtection *)a4;
- (id)removeSharingIdentity:(_PCSIdentityData *)a3 fromSharePCS:(_OpaquePCSShareProtection *)a4;
- (id)replacePrimaryKeyInPCS:(_OpaquePCSShareProtection *)a3 ofType:(unint64_t)a4;
- (id)rollIdentityForSharePCS:(_OpaquePCSShareProtection *)a3 ofType:(unint64_t)a4 removeAllExistingPrivateKeys:(BOOL)a5 error:(id *)a6;
- (id)rollMasterKeyForRecordPCS:(_OpaquePCSShareProtection *)a3 forOperation:(id)a4;
- (id)rollMasterKeyForRecordPCS:(_OpaquePCSShareProtection *)a3 isZoneishRecord:(BOOL)a4 bypassAllowlistedContainers:(BOOL)a5 forOperation:(id)a6;
- (id)sharingIdentityDataFromPCS:(_OpaquePCSShareProtection *)a3 error:(id *)a4;
- (id)unwrapAssetKey:(id)a3 withRecordPCS:(_OpaquePCSShareProtection *)a4 inContext:(id)a5 withError:(id *)a6;
- (id)unwrapEncryptedData:(id)a3 withPCS:(_OpaquePCSShareProtection *)a4 inContext:(id)a5;
- (id)unwrapEncryptedData:(id)a3 withPCS:(_OpaquePCSShareProtection *)a4 withContextString:(id)a5;
- (id)updateIdentityAndRollKeyForZonePCS:(_OpaquePCSShareProtection *)a3 usingServiceIdentityWithType:(unint64_t)a4 forOperation:(id)a5;
- (id)updateServiceIdentityOnZonePCS:(_OpaquePCSShareProtection *)a3;
- (id)updateZoneIdentityForRecordPCS:(_OpaquePCSShareProtection *)a3 usingZonePCS:(_OpaquePCSShareProtection *)a4 isZoneishRecord:(BOOL)a5 bypassAllowlistedContainers:(BOOL)a6;
- (id)wrapAssetKey:(id)a3 withRecordPCS:(_OpaquePCSShareProtection *)a4 inContext:(id)a5 withError:(id *)a6;
- (id)wrapEncryptedData:(id)a3 withPCS:(_OpaquePCSShareProtection *)a4 inContext:(id)a5;
- (id)wrapEncryptedData:(id)a3 withPCS:(_OpaquePCSShareProtection *)a4 withContextString:(id)a5;
- (int64_t)keyrollingErrorCodeForPCSOfType:(unint64_t)a3;
- (unint64_t)maxPcsBytes;
- (unint64_t)mmcsEncryptionSupport;
- (unint64_t)publicKeyVersionForServiceType:(unint64_t)a3;
- (unint64_t)removePCSKeys:(id)a3 fromPCS:(_OpaquePCSShareProtection *)a4 withProtectionEtag:(id)a5 forOperation:(id)a6;
- (unint64_t)serviceTypeForSharing;
- (unint64_t)sizeOfPCS:(_OpaquePCSShareProtection *)a3;
- (void)_createPCSFromData:(id)a3 ofType:(unint64_t)a4 usingPCSServiceType:(unint64_t)a5 tryDecryptingWithOtherServices:(BOOL)a6 withSyncKeyRegistryRetry:(BOOL)a7 lastModifiedDate:(id)a8 requestorOperationID:(id)a9 completionHandler:(id)a10;
- (void)_lockedGlobalPerUserBoundaryKeyDataWithCompletionHandler:(id)a3;
- (void)_locked_createPCSFromData:(id)a3 ofType:(unint64_t)a4 usingPCSServiceType:(unint64_t)a5 tryDecryptingWithOtherServices:(BOOL)a6 withSyncKeyRegistryRetry:(BOOL)a7 lastModifiedDate:(id)a8 keySyncAnalytics:(id)a9 requestorOperationID:(id)a10 completionHandler:(id)a11;
- (void)_locked_createZonePCSWithSyncKeyRegistryRetry:(BOOL)a3 requestorOperationID:(id)a4 keySyncAnalytics:(id)a5 completionHandler:(id)a6;
- (void)_locked_decryptCurrentPerParticipantPCSDataOnSharePCS:(id)a3 withPublicSharingKey:(id)a4 oonPrivateKey:(id)a5 shareModificationDate:(id)a6 requestorOperationID:(id)a7 completionHandler:(id)a8;
- (void)_locked_decryptPCSDataOnSharePCS:(id)a3 shareModificationDate:(id)a4 withPublicSharingKey:(id)a5 oonPrivateKey:(id)a6 requestorOperationID:(id)a7 completionHandler:(id)a8;
- (void)_locked_markMissingIdentitiesFromFailedDecryptError:(id)a3 serviceName:(id)a4;
- (void)_locked_pcsDataFromFetchedShare:(id)a3 withPublicSharingKey:(id)a4 oonPrivateKey:(id)a5 withServiceType:(unint64_t)a6 requestorOperationID:(id)a7 completionHandler:(id)a8;
- (void)_onSynchronizeQueue:(id)a3;
- (void)addEntriesForUnitTestOverrides:(id)a3;
- (void)canDecryptInvitedProtectionData:(id)a3 participantProtectionInfo:(id)a4 serviceType:(unint64_t)a5 completionHandler:(id)a6;
- (void)createIngestedPPPCSDataFromInvitationData:(id)a3 shareModificationDate:(id)a4 requestorOperationID:(id)a5 completionHandler:(id)a6;
- (void)createSharePCSFromData:(id)a3 ofType:(unint64_t)a4 withService:(unint64_t)a5 completionHandler:(id)a6;
- (void)createZonePCSFromData:(id)a3 usingServiceIdentityWithType:(unint64_t)a4 zonePCSModificationDate:(id)a5 requestorOperationID:(id)a6 completionHandler:(id)a7;
- (void)createZonePCSWithRequestorOperationID:(id)a3 completionHandler:(id)a4;
- (void)createZonePCSWithSyncKeyRegistryRetry:(BOOL)a3 requestorOperationID:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)decryptPCSDataOnSharePCS:(id)a3 shareModificationDate:(id)a4 requestorOperationID:(id)a5 completionHandler:(id)a6;
- (void)findSelfParticipantOnShareMetadata:(id)a3 invitationToken:(id)a4 completionHandler:(id)a5;
- (void)globalPerUserBoundaryKeyDataWithCompletionHandler:(id)a3;
- (void)markUndecryptablePCS:(id)a3;
- (void)pcsDataFromFetchedShare:(id)a3 requestorOperationID:(id)a4 completionHandler:(id)a5;
- (void)pcsDataFromFetchedShare:(id)a3 withPublicSharingKey:(id)a4 oonPrivateKey:(id)a5 withServiceType:(unint64_t)a6 requestorOperationID:(id)a7 completionHandler:(id)a8;
- (void)pcsDataFromFetchedShare:(id)a3 withServiceType:(unint64_t)a4 requestorOperationID:(id)a5 completionHandler:(id)a6;
- (void)sendCoreAnalyticsEventForKeySync:(id)a3;
- (void)setAccount:(id)a3;
- (void)setBoundaryKeyData:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setLastMissingManateeIdentityErrorDateForCurrentService:(id)a3;
- (void)setOwnerIdentity:(_PCSPublicIdentityData *)a3 onPCS:(_OpaquePCSShareProtection *)a4;
- (void)setPCSServiceNameOverwrite:(id)a3;
- (void)setPcsTestOverrides:(id)a3;
- (void)setSynchronizeQueue:(id)a3;
- (void)setUndecryptablePCSDataHashes:(id)a3;
- (void)setUuid:(id)a3;
- (void)synchronizeUserKeyRegistryForServiceType:(unint64_t)a3 shouldThrottle:(BOOL)a4 context:(id)a5 requestorOperationID:(id)a6 completionHandler:(id)a7;
- (void)synchronizeUserKeyRegistryForSigningIdentitiesForRequestorOperationID:(id)a3 completionHandler:(id)a4;
- (void)updateAccount:(id)a3 clearPCSCacheHandler:(id)a4;
@end

@implementation CKDPCSManager

- (NSString)pcsServiceName
{
  v3 = objc_msgSend_identityManager(self, a2, v2);
  v5 = objc_msgSend_PCSServiceStringFromCKServiceType_(v3, v4, 0);

  return (NSString *)v5;
}

- (CKDPCSIdentityManager)identityManager
{
  return self->_identityManager;
}

+ (id)_legacyServiceNameForContainerID:(id)a3
{
  uint64_t v3 = objc_msgSend_specialContainerType(a3, a2, (uint64_t)a3) - 1;
  v4 = @"com.apple.SafariShared.CloudTabs";
  switch(v3)
  {
    case 0:
      v5 = (id *)MEMORY[0x1E4F93F58];
      goto LABEL_18;
    case 1:
      v5 = (id *)MEMORY[0x1E4F93F70];
      goto LABEL_18;
    case 2:
      v5 = (id *)MEMORY[0x1E4F93F68];
      goto LABEL_18;
    case 3:
      v5 = (id *)MEMORY[0x1E4F93F78];
      goto LABEL_18;
    case 4:
      v5 = (id *)MEMORY[0x1E4F93FB0];
      goto LABEL_18;
    case 5:
      v4 = @"com.apple.icloud.events";
      goto LABEL_19;
    case 8:
      v5 = (id *)MEMORY[0x1E4F94000];
      goto LABEL_18;
    case 12:
      v5 = (id *)MEMORY[0x1E4F93FB8];
      goto LABEL_18;
    case 15:
      v5 = (id *)MEMORY[0x1E4F93FE0];
      goto LABEL_18;
    case 19:
      v5 = (id *)MEMORY[0x1E4F93FD0];
      goto LABEL_18;
    case 20:
      v5 = (id *)MEMORY[0x1E4F93FD8];
      goto LABEL_18;
    case 25:
      v5 = (id *)MEMORY[0x1E4F93FE8];
      goto LABEL_18;
    case 27:
      goto LABEL_19;
    case 29:
      v5 = (id *)MEMORY[0x1E4F93F60];
      goto LABEL_18;
    case 31:
      v5 = (id *)MEMORY[0x1E4F93FA8];
      goto LABEL_18;
    case 32:
      v5 = (id *)MEMORY[0x1E4F93FF8];
      goto LABEL_18;
    default:
      v5 = (id *)MEMORY[0x1E4F93FC0];
LABEL_18:
      v4 = (__CFString *)*v5;
LABEL_19:
      return v4;
  }
}

- (unint64_t)serviceTypeForSharing
{
  v4 = objc_msgSend_containerID(self, a2, v2);
  uint64_t v7 = objc_msgSend_specialContainerType(v4, v5, v6);

  if (v7 == 4) {
    return 1;
  }
  if (objc_msgSend_currentServiceIsManatee(self, v8, v9)) {
    return 0;
  }
  return 2;
}

- (void)updateAccount:(id)a3 clearPCSCacheHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10 = objc_msgSend_synchronizeQueue(self, v8, v9);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4DC6BB4;
  block[3] = &unk_1E64F0FA0;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v10, block);
}

- (CKDPCSManager)initWithContainer:(id)a3 account:(id)a4
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v124.receiver = self;
  v124.super_class = (Class)CKDPCSManager;
  v10 = [(CKDPCSManager *)&v124 init];
  if (v10)
  {
    id v11 = objc_msgSend_containerID(v6, v8, v9);
    uint64_t v14 = objc_msgSend_containerIdentifier(v11, v12, v13);

    v122 = objc_msgSend_stringWithFormat_(NSString, v15, @"%s.%@.%p", "com.apple.cloudkit.pcsmanager.queue", v14, v6);
    v18 = (const char *)objc_msgSend_UTF8String(v122, v16, v17);
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create(v18, v19);
    v21 = (void *)*((void *)v10 + 13);
    *((void *)v10 + 13) = v20;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v10 + 13), "com.apple.cloudkit.pcsmanager.queue", (void *)1, 0);
    v123 = (void *)v14;
    objc_msgSend_stringWithFormat_(NSString, v22, @"%@.%@", @"com.apple.CloudKit.CKDPCSManager.callbackQueue", v14);
    id v23 = objc_claimAutoreleasedReturnValue();
    v26 = (const char *)objc_msgSend_UTF8String(v23, v24, v25);
    v27 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v28 = dispatch_queue_create(v26, v27);
    v29 = (void *)*((void *)v10 + 14);
    *((void *)v10 + 14) = v28;

    uint64_t v32 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v30, v31);
    v33 = (void *)*((void *)v10 + 7);
    *((void *)v10 + 7) = v32;

    v34 = (void **)(v10 + 32);
    objc_storeStrong((id *)v10 + 4, a4);
    objc_storeWeak((id *)v10 + 9, v6);
    uint64_t v37 = objc_msgSend_containerID(v6, v35, v36);
    v38 = (void *)*((void *)v10 + 10);
    *((void *)v10 + 10) = v37;

    v41 = objc_msgSend_deviceContext(v6, v39, v40);
    objc_storeStrong((id *)v10 + 2, v41);
    v44 = objc_msgSend_applicationID(v6, v42, v43);
    uint64_t v47 = objc_msgSend_applicationBundleIdentifier(v44, v45, v46);
    v48 = (void *)*((void *)v10 + 11);
    *((void *)v10 + 11) = v47;

    v51 = objc_msgSend_options(v6, v49, v50);
    v10[8] = objc_msgSend_forceEnableReadOnlyManatee(v51, v52, v53);

    v56 = objc_msgSend_options(v6, v54, v55);
    *((void *)v10 + 12) = objc_msgSend_mmcsEncryptionSupport(v56, v57, v58);

    v61 = objc_msgSend_options(v6, v59, v60);
    v10[9] = objc_msgSend_useZoneWidePCS(v61, v62, v63);

    v66 = objc_msgSend_encryptionServiceName(v6, v64, v65);
    v67 = v66;
    if (v66)
    {
      id v68 = v66;
    }
    else
    {
      v69 = objc_opt_class();
      v72 = objc_msgSend_containerID(v6, v70, v71);
      objc_msgSend__legacyServiceNameForContainerID_(v69, v73, (uint64_t)v72);
      id v68 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v74 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      if (v67) {
        v116 = @"client specified";
      }
      else {
        v116 = @"containerIdentifier default";
      }
      v121 = (void *)*((void *)v10 + 10);
      v117 = v74;
      v120 = objc_msgSend_ckShortDescription(v121, v118, v119);
      *(_DWORD *)buf = 138543874;
      v126 = v116;
      __int16 v127 = 2114;
      id v128 = v68;
      __int16 v129 = 2114;
      v130 = v120;
      _os_log_debug_impl(&dword_1C4CFF000, v117, OS_LOG_TYPE_DEBUG, "Using %{public}@ PCS Service Name %{public}@ with containerID %{public}@", buf, 0x20u);
    }
    v79 = objc_msgSend_accountID(*v34, v75, v76);
    if (v79)
    {
      v80 = objc_msgSend_accountID(*v34, v77, v78);
      int v82 = objc_msgSend_isEqualToString_(v80, v81, *MEMORY[0x1E4F1A570]) ^ 1;
    }
    else
    {
      int v82 = 0;
    }

    if (PCSServiceItemTypeIsManatee() && v82)
    {
      v85 = objc_msgSend_accountDataSecurityObserver(v41, v83, v84);
      objc_msgSend_manateeStatusForAccount_isSecondaryAccount_completionHandler_(v85, v86, (uint64_t)v7, 0, 0);
    }
    if (v82)
    {
      v87 = objc_msgSend_accountDataSecurityObserver(v41, v83, v84);
      objc_msgSend_walrusStatusForAccount_isSecondaryAccount_checkCache_allowFetch_completionHandler_(v87, v88, (uint64_t)v7, 0, 1, 1, 0);
    }
    v89 = [CKDPCSIdentityManager alloc];
    uint64_t v90 = *((void *)v10 + 2);
    v93 = objc_msgSend_options(v6, v91, v92);
    uint64_t OnlyManatee = objc_msgSend_forceEnableReadOnlyManatee(v93, v94, v95);
    uint64_t v99 = objc_msgSend_clientSDKVersion(v6, v97, v98);
    uint64_t OnlyManatee_clientSDKVersion = objc_msgSend_initWithAccount_deviceContext_serviceName_forceEnableReadOnlyManatee_clientSDKVersion_(v89, v100, (uint64_t)v7, v90, v68, OnlyManatee, v99);
    v102 = (void *)*((void *)v10 + 3);
    *((void *)v10 + 3) = OnlyManatee_clientSDKVersion;

    uint64_t v103 = objc_opt_new();
    v104 = (void *)*((void *)v10 + 5);
    *((void *)v10 + 5) = v103;

    v105 = [CKDPCSManagerMissingIdentitiesContext alloc];
    v107 = objc_msgSend_initWithContainer_(v105, v106, (uint64_t)v6);
    v110 = objc_msgSend_sharedNotifier(CKDPCSNotifier, v108, v109);
    v113 = objc_msgSend_uuid(v10, v111, v112);
    objc_msgSend_addContext_forManagerUUID_(v110, v114, (uint64_t)v107, v113);
  }
  return (CKDPCSManager *)v10;
}

- (BOOL)_isAllowlistedKeyRollingContainerID:(id)a3
{
  return objc_msgSend_specialContainerType(a3, a2, (uint64_t)a3) == 18;
}

- (id)_pcsObjectKindForCKDPCSBlobType:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    uint64_t v3 = (id *)MEMORY[0x1E4F93ED8];
  }
  else {
    uint64_t v3 = (id *)qword_1E64F3150[a3 - 1];
  }
  return *v3;
}

- (_PCSIdentityData)debugSharingIdentity
{
  uint64_t v3 = objc_msgSend_identityManager(self, a2, v2);
  id v6 = (_PCSIdentityData *)objc_msgSend_debugSharingIdentity(v3, v4, v5);

  return v6;
}

- (NSDate)lastMissingManateeIdentityErrorDateForCurrentService
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_1C4DC743C;
  uint64_t v9 = sub_1C4DC744C;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C4DC7454;
  v4[3] = &unk_1E64F1BC0;
  v4[4] = self;
  v4[5] = &v5;
  objc_msgSend__onSynchronizeQueue_(self, a2, (uint64_t)v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDate *)v2;
}

- (unint64_t)publicKeyVersionForServiceType:(unint64_t)a3
{
  if (a3 != 2 && a3 != 1)
  {
    if (!a3)
    {
      uint64_t v3 = objc_msgSend_identityManager(self, a2, a3);
      id v6 = objc_msgSend_serviceName(v3, v4, v5);
      NumberByName = (void *)PCSServiceItemGetNumberByName();
      unint64_t v10 = objc_msgSend_unsignedIntegerValue(NumberByName, v8, v9);

      return v10;
    }
    return 0;
  }
  return a3;
}

- (BOOL)currentServiceIsManatee
{
  uint64_t v3 = objc_msgSend_identityManager(self, a2, v2);
  char IsManatee = objc_msgSend_currentServiceIsManatee(v3, v4, v5);

  return IsManatee;
}

- (void)setPCSServiceNameOverwrite:(id)a3
{
  id v4 = a3;
  objc_msgSend_identityManager(self, v5, v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPCSServiceNameOverwrite_(v8, v7, (uint64_t)v4);
}

+ (id)noMatchingIdentityErrorForPCSError:(id)a3 withErrorCode:(int64_t)a4 description:(id)a5
{
  id v7 = a3;
  id v10 = a5;
  if (v7 && objc_msgSend_code(v7, v8, v9) == 73)
  {
    uint64_t v13 = objc_msgSend_userInfo(v7, v11, v12);
    id v15 = objc_msgSend_objectForKeyedSubscript_(v13, v14, *MEMORY[0x1E4F93EB0]);
    uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v13, v16, *MEMORY[0x1E4F93EA8]);
    v19 = objc_msgSend_componentsJoinedByString_(v15, v18, @", ");
    v21 = objc_msgSend_componentsJoinedByString_(v17, v20, @", ");
    id v22 = v19;
    v26 = v22;
    if ((unint64_t)objc_msgSend_count(v15, v23, v24) >= 0xB)
    {
      v27 = objc_msgSend_subarrayWithRange_(v15, v25, 0, 10);
      objc_msgSend_componentsJoinedByString_(v27, v28, @", ");
      v29 = uint64_t v37 = v17;
      v30 = NSString;
      uint64_t v33 = objc_msgSend_count(v15, v31, v32);
      v26 = objc_msgSend_stringWithFormat_(v30, v34, @"%@ ... (and %lu more)", v29, v33 - 10);

      uint64_t v17 = v37;
    }
    v35 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v25, *MEMORY[0x1E4F19DD8], a4, v7, @"%@. Public keys on object: %@. Attempted public keys: %@", v10, v21, v26);
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (id)copyPublicKeyForService:(unint64_t)a3 withError:(id *)a4
{
  uint64_t v6 = objc_msgSend_identityManager(self, a2, a3);
  id v8 = objc_msgSend_copyPublicKeyForService_withError_(v6, v7, a3, a4);

  return v8;
}

- (id)copyAllPublicKeysForService:(unint64_t)a3 withError:(id *)a4
{
  uint64_t v6 = objc_msgSend_identityManager(self, a2, a3);
  id v8 = objc_msgSend_copyAllPublicKeysForService_withError_(v6, v7, a3, a4);

  return v8;
}

- (_PCSPublicIdentityData)copyDiversifiedPublicIdentityForService:(unint64_t)a3 withError:(id *)a4
{
  id v7 = objc_msgSend_containerScopedUserIDProvider(self, a2, a3);
  id v10 = objc_msgSend_containerScopedUserID(v7, v8, v9);
  uint64_t v12 = objc_msgSend_dataUsingEncoding_(v10, v11, 4);

  id v15 = objc_msgSend_identityManager(self, v13, v14);
  uint64_t v17 = (_PCSPublicIdentityData *)objc_msgSend_copyDiversifiedIdentityForService_userIDEntropy_withError_(v15, v16, a3, v12, a4);

  return v17;
}

- (id)copyDiversifiedPublicKeyForService:(unint64_t)a3 withError:(id *)a4
{
  id v7 = objc_msgSend_containerScopedUserIDProvider(self, a2, a3);
  id v10 = objc_msgSend_containerScopedUserID(v7, v8, v9);
  uint64_t v12 = objc_msgSend_dataUsingEncoding_(v10, v11, 4);

  id v15 = objc_msgSend_identityManager(self, v13, v14);
  uint64_t v17 = objc_msgSend_copyDiversifiedPublicKeyForService_userIDEntropy_withError_(v15, v16, a3, v12, a4);

  return v17;
}

- (id)participantPublicKeyForServiceType:(unint64_t)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3 == 2)
  {
    uint64_t v16 = 0;
    uint64_t v6 = (id *)&v16;
    uint64_t v7 = objc_msgSend_copyDiversifiedPublicKeyForService_withError_(self, a2, 2, &v16);
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v6 = (id *)&v15;
    uint64_t v7 = objc_msgSend_copyPublicKeyForService_withError_(self, a2, a3, &v15);
  }
  id v8 = (void *)v7;
  id v9 = *v6;
  id v11 = v9;
  if (!v8 || v9)
  {
    if (!v9)
    {
      id v11 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v10, *MEMORY[0x1E4F19DD8], 5000, @"Couldn't get a public key for our participant");
    }

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v12 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = &stru_1F2044F30;
      if (a3 == 2) {
        uint64_t v14 = @"diversified ";
      }
      *(_DWORD *)buf = 138543618;
      v18 = v14;
      __int16 v19 = 2112;
      dispatch_queue_t v20 = v11;
      _os_log_error_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_ERROR, "Couldn't get a %{public}@key for service: %@", buf, 0x16u);
    }
    id v8 = 0;
  }
  if (a4) {
    *a4 = v11;
  }

  return v8;
}

- (BOOL)addRandomShareeToPCS:(_OpaquePCSShareProtection *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!*MEMORY[0x1E4F1A4E0])
  {
    uint64_t v15 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, self, @"CKDPCSManager.m", 434, @"For testing purposes only");
  }
  id v17 = 0;
  RandomSharingIdentityWithError = (const void *)objc_msgSend_createRandomSharingIdentityWithError_(self, a2, (uint64_t)&v17);
  id v6 = v17;
  id v8 = v6;
  if (RandomSharingIdentityWithError) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  BOOL v10 = v9;
  if (v9)
  {
    id v11 = (id)objc_msgSend_addSharingIdentity_toSharePCS_permission_(self, v7, (uint64_t)RandomSharingIdentityWithError, a3, 0);
    goto LABEL_16;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v12 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v19 = v8;
    _os_log_error_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_ERROR, "Failed to create random sharing identity: %@", buf, 0xCu);
    if (!RandomSharingIdentityWithError) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (RandomSharingIdentityWithError) {
LABEL_16:
  }
    CFRelease(RandomSharingIdentityWithError);
LABEL_17:

  return v10;
}

- (_PCSIdentityData)createRandomSharingIdentityWithError:(id *)a3
{
  id v4 = objc_msgSend_identityManager(self, a2, (uint64_t)a3);
  RandomSharingIdentityWithError = (_PCSIdentityData *)objc_msgSend_createRandomSharingIdentityWithError_(v4, v5, (uint64_t)a3);

  return RandomSharingIdentityWithError;
}

- (_PCSIdentityData)createCombinedIdentityWithOutOfNetworkPrivateKey:(id)a3 publicSharingIdentity:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v10 = objc_msgSend_identityManager(self, v8, v9);
  CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity = (_PCSIdentityData *)objc_msgSend_createCombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity_(v10, v11, (uint64_t)v7, v6);

  return CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity;
}

- (id)createProtectionInfoFromOONPrivateKey:(id)a3 privateToken:(id)a4 OONProtectionInfo:(id)a5 error:(id *)a6
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v15 = objc_msgSend_identityManager(self, v13, v14);
  CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity = (const void *)objc_msgSend_createCombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity_(v15, v16, (uint64_t)v12, v11);

  id v65 = 0;
  __int16 v19 = (const void *)objc_msgSend_createSharePCSFromData_sharingIdentity_error_(self, v18, (uint64_t)v10, CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity, &v65);

  id v20 = v65;
  id v23 = v20;
  if (!v19)
  {
    v42 = objc_msgSend_identityManager(self, v21, v22);
    id v64 = 0;
    v44 = objc_msgSend_dataFromSharingIdentity_error_(v42, v43, (uint64_t)CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity, &v64);
    id v45 = v64;

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v46 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v67 = v23;
      __int16 v68 = 2112;
      v69 = v44;
      __int16 v70 = 2112;
      id v71 = v45;
      _os_log_error_impl(&dword_1C4CFF000, v46, OS_LOG_TYPE_ERROR, "OON keyswap: Failed decrypting calling participant protectionInfo: %@. CombinedOONIdentity: %@ (%@)", buf, 0x20u);
    }

    v30 = 0;
    uint64_t v24 = 0;
LABEL_43:
    v49 = 0;
    if (!CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
  id v63 = v20;
  uint64_t v24 = objc_msgSend_copyDiversifiedPublicKeyForService_withError_(self, v21, 2, &v63);
  id v25 = v63;

  if (v25 || !v24)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v47 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v67 = v25;
      _os_log_error_impl(&dword_1C4CFF000, v47, OS_LOG_TYPE_ERROR, "Couldn't create a diversified public key for the owner participant: %@", buf, 0xCu);
      if (v25)
      {
LABEL_25:
        v30 = 0;
        v49 = 0;
        id v23 = v25;
        if (!CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity) {
          goto LABEL_45;
        }
        goto LABEL_44;
      }
    }
    else if (v25)
    {
      goto LABEL_25;
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v48, *MEMORY[0x1E4F19DD8], 5000, @"Couldn't create a diversified public key for the owner participant");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    goto LABEL_43;
  }
  dispatch_queue_t v28 = objc_msgSend_identityManager(self, v26, v27);
  id v62 = 0;
  v30 = objc_msgSend_createPublicSharingIdentityFromPublicKey_error_(v28, v29, (uint64_t)v24, &v62);
  id v23 = v62;

  uint64_t v31 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
  uint64_t v32 = (void *)*MEMORY[0x1E4F1A548];
  uint64_t v33 = (void *)MEMORY[0x1E4F1A550];
  uint64_t v34 = *MEMORY[0x1E4F1A550];
  if (v23 || !v30)
  {
    if (v34 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v32);
    }
    uint64_t v50 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v67 = v23;
      __int16 v68 = 2114;
      v69 = v24;
      _os_log_error_impl(&dword_1C4CFF000, v50, OS_LOG_TYPE_ERROR, "Couldn't create an identity from the public sharing key for participant: %@ (key was %{public}@)", buf, 0x16u);
      if (v23) {
        goto LABEL_43;
      }
    }
    else if (v23)
    {
      goto LABEL_43;
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v51, *MEMORY[0x1E4F19DD8], 5000, @"Couldn't create an identity from the public sharing key: %@ (key was %@)", 0, v24);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }
  if (v34 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], v32);
  }
  v35 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v67 = v30;
    _os_log_debug_impl(&dword_1C4CFF000, v35, OS_LOG_TYPE_DEBUG, "Created public identity for participant: %@", buf, 0xCu);
  }
  uint64_t v37 = objc_msgSend_addPublicIdentity_toSharePCS_permission_(self, v36, (uint64_t)v30, v19, 1);
  if (v37)
  {
    v39 = (void *)v37;
    if (*v33 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], *v31);
    }
    uint64_t v40 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v67 = v39;
      _os_log_error_impl(&dword_1C4CFF000, v40, OS_LOG_TYPE_ERROR, "Couldn't add public identity to per-participant PCS: %@", buf, 0xCu);
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v41, *MEMORY[0x1E4F19DD8], 5005, @"Couldn't add public identity to per-participant PCS: %@", v39);
    id v23 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_43;
  }
  uint64_t v52 = objc_msgSend_removeSharingIdentity_fromSharePCS_(self, v38, (uint64_t)CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity, v19);
  if (v52)
  {
    id v23 = (id)v52;
    if (*v33 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], *v31);
    }
    v54 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v67 = v23;
      _os_log_error_impl(&dword_1C4CFF000, v54, OS_LOG_TYPE_ERROR, "OON keyswap: Failed to remove combined identity: %@", buf, 0xCu);
    }
    goto LABEL_43;
  }
  id v61 = 0;
  v49 = objc_msgSend_dataFromSharePCS_pcsBlobType_error_(self, v53, (uint64_t)v19, 4, &v61);
  id v55 = v61;
  v56 = v55;
  if (v49 && !v55)
  {
    id v23 = 0;
    if (!CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity) {
      goto LABEL_45;
    }
LABEL_44:
    CFRelease(CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity);
    goto LABEL_45;
  }
  if (*v33 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], *v31);
  }
  v59 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v67 = v56;
    _os_log_error_impl(&dword_1C4CFF000, v59, OS_LOG_TYPE_ERROR, "OON keyswap: failed to convert PCS blob to data: %@", buf, 0xCu);
  }
  objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v60, *MEMORY[0x1E4F19DD8], 5005, v56, @"Couldn't serialize PCS data after key swap on OON PCS blob");
  id v23 = (id)objc_claimAutoreleasedReturnValue();

  if (CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity) {
    goto LABEL_44;
  }
LABEL_45:
  if (v30) {
    CFRelease(v30);
  }
  if (v19) {
    CFRelease(v19);
  }
  if (v23)
  {
    id v57 = 0;
    if (a6) {
      *a6 = v23;
    }
  }
  else
  {
    id v57 = v49;
  }

  return v57;
}

- (void)canDecryptInvitedProtectionData:(id)a3 participantProtectionInfo:(id)a4 serviceType:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1C4DC8544;
  v15[3] = &unk_1E64F28F0;
  v15[4] = self;
  id v16 = v10;
  id v17 = v11;
  id v12 = v11;
  id v13 = v10;
  objc_msgSend_createSharePCSFromData_ofType_withService_completionHandler_(self, v14, (uint64_t)a4, 4, a5, v15);
}

- (id)dataFromSharingIdentity:(_PCSIdentityData *)a3 error:(id *)a4
{
  id v6 = objc_msgSend_identityManager(self, a2, (uint64_t)a3);
  id v8 = objc_msgSend_dataFromSharingIdentity_error_(v6, v7, (uint64_t)a3, a4);

  return v8;
}

- (_PCSIdentityData)createSharingIdentityFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v9 = objc_msgSend_identityManager(self, v7, v8);
  SharingIdentityFromData_error = (_PCSIdentityData *)objc_msgSend_createSharingIdentityFromData_error_(v9, v10, (uint64_t)v6, a4);

  return SharingIdentityFromData_error;
}

- (_PCSPublicIdentityData)createPublicSharingIdentityFromPublicKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v9 = objc_msgSend_identityManager(self, v7, v8);
  PublicSharingIdentityFromPublicKey_error = (_PCSPublicIdentityData *)objc_msgSend_createPublicSharingIdentityFromPublicKey_error_(v9, v10, (uint64_t)v6, a4);

  return PublicSharingIdentityFromPublicKey_error;
}

- (id)_addIdentity:(_PCSIdentitySetData *)a3 withService:(unint64_t)a4 toPCS:(_OpaquePCSShareProtection *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!a5)
  {
    uint64_t v15 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], a2, *MEMORY[0x1E4F19DD8], 1017, @"Can't add an identity to a nil pcs");
    goto LABEL_28;
  }
  CFTypeRef cf = 0;
  uint64_t v9 = objc_msgSend_identityManager(self, a2, (uint64_t)a3);
  objc_msgSend_PCSServiceStringFromCKServiceType_(v9, v10, a4);

  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  if (a3)
  {
    uint64_t v11 = PCSIdentitySetCopyCurrentPublicIdentityWithError();
    id v13 = (const void *)v11;
    if (!v11 || cf)
    {
      uint64_t v15 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v12, *MEMORY[0x1E4F19DD8], 5000, a5, cf);
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
    }
    else
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = sub_1C4DC8CC8;
      v21[3] = &unk_1E64F2918;
      v21[4] = &v22;
      v21[5] = a5;
      v21[6] = v11;
      objc_msgSend__onSynchronizeQueue_(self, v12, (uint64_t)v21);
      if (*((unsigned char *)v23 + 24))
      {
LABEL_20:
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        __int16 v19 = *MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          dispatch_queue_t v28 = v13;
          __int16 v29 = 2112;
          v30 = a5;
          _os_log_debug_impl(&dword_1C4CFF000, v19, OS_LOG_TYPE_DEBUG, "Added identity %@ to PCS %@", buf, 0x16u);
        }
        uint64_t v15 = 0;
        goto LABEL_25;
      }
      uint64_t v15 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v14, *MEMORY[0x1E4F19DD8], 5005, @"Failed to add our public identity to the PCS object");
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v16 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      dispatch_queue_t v28 = 0;
      _os_log_impl(&dword_1C4CFF000, v16, OS_LOG_TYPE_INFO, "Warn: Couldn't get a self identity: %@", buf, 0xCu);
    }
    uint64_t v15 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v17, *MEMORY[0x1E4F19DD8], 5000, @"Couldn't get a self identity to add to the share PCS");
    id v13 = 0;
  }
  if (!v15) {
    goto LABEL_20;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v18 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    dispatch_queue_t v28 = v13;
    __int16 v29 = 2112;
    v30 = a5;
    __int16 v31 = 2112;
    uint64_t v32 = v15;
    _os_log_error_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_ERROR, "Error adding identity %@ to PCS %@: %@", buf, 0x20u);
  }
LABEL_25:
  if (v13) {
    CFRelease(v13);
  }
  _Block_object_dispose(&v22, 8);
LABEL_28:
  return v15;
}

- (id)addIdentityForService:(unint64_t)a3 toPCS:(_OpaquePCSShareProtection *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], a2, *MEMORY[0x1E4F19DD8], 1017, @"Asked to add an identity to an null PCS in addIdentityForService:toPCS:");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  id v7 = objc_msgSend_identityManager(self, a2, a3);
  id v19 = 0;
  uint64_t v9 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(v7, v8, a3, 1, &v19);
  id v10 = v19;

  if (v10) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v9 == 0;
  }
  if (!v12)
  {
    objc_msgSend__addIdentity_withService_toPCS_(self, v11, (uint64_t)v9, a3, a4);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
    CFRelease(v9);
    goto LABEL_15;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v13 = (void *)*MEMORY[0x1E4F1A528];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
  {
    if (v10) {
      goto LABEL_11;
    }
LABEL_22:
    uint64_t v18 = *MEMORY[0x1E4F19DD8];
    if (a3 - 1 > 5) {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v14, v18, 5000, @"Couldn't get a %@ identity set to add to PCS", @"Current Service");
    }
    else {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v14, v18, 5000, @"Couldn't get a %@ identity set to add to PCS", off_1E64F31F8[a3 - 1]);
    }
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (a3 - 1 > 5) {
    id v16 = @"Current Service";
  }
  else {
    id v16 = off_1E64F31F8[a3 - 1];
  }
  *(_DWORD *)buf = 138412546;
  uint64_t v21 = v16;
  __int16 v22 = 2112;
  id v23 = v10;
  id v17 = v13;
  _os_log_impl(&dword_1C4CFF000, v17, OS_LOG_TYPE_INFO, "Warn: Couldn't get a %@ identity set: %@", buf, 0x16u);

  if (!v10) {
    goto LABEL_22;
  }
LABEL_11:
  if (v9) {
    goto LABEL_14;
  }
LABEL_15:
  return v10;
}

- (BOOL)sharingFingerprintsContainPublicKeyWithData:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (v7)
  {
    id v46 = 0;
    uint64_t v8 = objc_msgSend_copyDiversifiedPublicKeyForService_withError_(self, v6, 2, &v46);
    id v9 = v46;
    char isEqualToData = objc_msgSend_isEqualToData_(v8, v10, (uint64_t)v7);
    if (a4 && v9) {
      *a4 = v9;
    }

    if (isEqualToData) {
      goto LABEL_6;
    }
    id v45 = v9;
    uint64_t v14 = objc_msgSend_copyDiversifiedPublicKeyForService_withError_(self, v12, 1, &v45);
    id v15 = v45;

    char v17 = objc_msgSend_isEqualToData_(v14, v16, (uint64_t)v7);
    if (a4 && v15) {
      *a4 = v15;
    }

    if (v17)
    {
      char v13 = 1;
      id v9 = v15;
      goto LABEL_25;
    }
    id v20 = objc_msgSend_identityManager(self, v18, v19);
    id v44 = v15;
    __int16 v22 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(v20, v21, 2, 0, &v44);
    id v23 = v44;

    v26 = objc_msgSend_identityManager(self, v24, v25);
    id v43 = v23;
    char v28 = objc_msgSend_identitySet_containsPublicKey_error_(v26, v27, (uint64_t)v22, v7, &v43);
    id v9 = v43;

    if (v22) {
      CFRelease(v22);
    }
    if (a4 && v9)
    {
      id v31 = v9;
      *a4 = v31;
      if (v28)
      {
        char v13 = 1;
        id v9 = v31;
        goto LABEL_25;
      }
    }
    else if (v28)
    {
LABEL_6:
      char v13 = 1;
LABEL_25:

      goto LABEL_26;
    }
    uint64_t v32 = objc_msgSend_identityManager(self, v29, v30);
    id v42 = v9;
    uint64_t v34 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(v32, v33, 1, 0, &v42);
    id v35 = v42;

    v38 = objc_msgSend_identityManager(self, v36, v37);
    id v41 = v35;
    char v13 = objc_msgSend_identitySet_containsPublicKey_error_(v38, v39, (uint64_t)v34, v7, &v41);
    id v9 = v41;

    if (v34) {
      CFRelease(v34);
    }
    if (a4 && v9)
    {
      id v9 = v9;
      *a4 = v9;
    }
    goto LABEL_25;
  }
  char v13 = 0;
LABEL_26:

  return v13;
}

- (id)generateOONPrivateKeyWithError:(id *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  RandomCompactRaw = (const void *)PCSIdentityCreateRandomCompactRaw();
  uint64_t v5 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
  id v6 = (void *)*MEMORY[0x1E4F1A548];
  id v7 = (void *)MEMORY[0x1E4F1A550];
  uint64_t v8 = *MEMORY[0x1E4F1A550];
  if (RandomCompactRaw)
  {
    if (v8 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v6);
    }
    uint64_t v14 = (os_log_t *)MEMORY[0x1E4F1A500];
    id v15 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = RandomCompactRaw;
      _os_log_debug_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_DEBUG, "Created OON PCS identity %@", buf, 0xCu);
    }
    char v13 = (void *)PCSIdentityCopyExportedPrivateKey();
    if (v13)
    {
      id v12 = 0;
    }
    else
    {
      if (*v7 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], *v5);
      }
      id v16 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = 0;
        _os_log_error_impl(&dword_1C4CFF000, v16, OS_LOG_TYPE_ERROR, "Error extracting private key from OON identity: %@", buf, 0xCu);
      }
      uint64_t v18 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v17, *MEMORY[0x1E4F19DD8], 5005, 0, @"Couldn't export OON private key");
      id v12 = v18;
      if (a3)
      {
        id v12 = v18;
        *a3 = v12;
      }
    }
    CFRelease(RandomCompactRaw);
  }
  else
  {
    if (v8 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v6);
    }
    id v9 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = 0;
      _os_log_error_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_ERROR, "Error creating OON identity: %@", buf, 0xCu);
    }
    uint64_t v11 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v10, *MEMORY[0x1E4F19DD8], 5005, 0, @"Couldn't generate OON identity");
    id v12 = v11;
    if (a3) {
      *a3 = v11;
    }
    char v13 = 0;
  }

  return v13;
}

+ (id)publicKeyIDFromIdentity:(_OpaquePCSShareProtection *)a3
{
  uint64_t v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = (void *)PCSFPCopyKeyIDs();
    if (objc_msgSend_count(v4, v5, v6))
    {
      id v9 = objc_msgSend_lastObject(v4, v7, v8);
      uint64_t v10 = PCSFPCopyPrivateKey();
      if (v10)
      {
        uint64_t v11 = (const void *)v10;
        uint64_t v12 = PCSIdentityCopyPublicIdentity();
        if (v12)
        {
          char v13 = (const void *)v12;
          uint64_t v14 = (void *)PCSPublicIdentityCopyCurrentKeyFingerprint();
          CFRelease(v13);
        }
        else
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          char v17 = *MEMORY[0x1E4F1A528];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
          {
            int v19 = 138412290;
            id v20 = v3;
            _os_log_error_impl(&dword_1C4CFF000, v17, OS_LOG_TYPE_ERROR, "Couldn't get a public identity from PCS %@", (uint8_t *)&v19, 0xCu);
          }
          uint64_t v14 = 0;
        }
        CFRelease(v11);
        goto LABEL_22;
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v16 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
      {
        int v19 = 138412290;
        id v20 = v3;
        _os_log_error_impl(&dword_1C4CFF000, v16, OS_LOG_TYPE_ERROR, "Couldn't get private key from pcs %@", (uint8_t *)&v19, 0xCu);
      }
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v15 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
      {
        int v19 = 138412290;
        id v20 = v3;
        _os_log_error_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_ERROR, "Couldn't get keyIDs from pcs %@", (uint8_t *)&v19, 0xCu);
      }
      id v9 = 0;
    }
    uint64_t v14 = 0;
LABEL_22:
    uint64_t v3 = v14;
  }
  return v3;
}

- (void)_locked_markMissingIdentitiesFromFailedDecryptError:(id)a3 serviceName:(id)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend_synchronizeQueue(self, v8, v9);
  dispatch_assert_queue_V2(v10);

  if (!v6)
  {
    if (!v7) {
      goto LABEL_16;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    __int16 v29 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v71 = v7;
      _os_log_impl(&dword_1C4CFF000, v29, OS_LOG_TYPE_INFO, "We are missing identities for service %{public}@. Will notify clients if any keys arrive.", buf, 0xCu);
    }
    char v13 = objc_msgSend_sharedNotifier(CKDPCSNotifier, v30, v31);
    id v69 = v7;
    id v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v32, (uint64_t)&v69, 1);
    uint64_t v21 = objc_msgSend_uuid(self, v33, v34);
    uint64_t v24 = objc_msgSend_account(self, v35, v36);
    objc_msgSend_addServicesWithMissingIdentities_forManagerUUID_withAccount_(v13, v37, (uint64_t)v15, v21, v24);
    goto LABEL_14;
  }
  char v13 = objc_msgSend_userInfo(v6, v11, v12);
  id v15 = objc_msgSend_objectForKeyedSubscript_(v13, v14, *MEMORY[0x1E4F93EA8]);
  if (objc_msgSend_count(v15, v16, v17))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v18 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v71 = v7;
      __int16 v72 = 2114;
      v73 = v15;
      _os_log_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_INFO, "A PCS blob could not be decrypted for service %{public}@. %{public}@ are keys that can decrypt the zone. Will notify clients if any of these keys arrive.", buf, 0x16u);
    }
    uint64_t v21 = objc_msgSend_sharedNotifier(CKDPCSNotifier, v19, v20);
    uint64_t v24 = objc_msgSend_uuid(self, v22, v23);
    uint64_t v27 = objc_msgSend_account(self, v25, v26);
    objc_msgSend_addMissingIdentityPublicKeys_forManagerUUID_withAccount_(v21, v28, (uint64_t)v15, v24, v27);

LABEL_14:
  }

LABEL_16:
  if (*MEMORY[0x1E4F1A4E0])
  {
    if (objc_msgSend__checkAndClearPCSTestOverrideForKey_(self, v11, @"FakeOutCurrentIdentityIsMissing"))
    {
      uint64_t v40 = objc_msgSend_identityManager(self, v38, v39);
      id v42 = objc_msgSend_PCSServiceStringFromCKServiceType_(v40, v41, 0);

      id v45 = objc_msgSend_identityManager(self, v43, v44);
      uint64_t v47 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(v45, v46, 0, 1, 0);

      if (v47)
      {
        uint64_t v48 = PCSIdentitySetCopyCurrentIdentityWithError();
        if (v48)
        {
          v49 = (const void *)v48;
          uint64_t PublicKey = PCSIdentityGetPublicKey();
          if (PublicKey)
          {
            uint64_t v53 = PublicKey;
            v54 = objc_msgSend_sharedNotifier(CKDPCSNotifier, v51, v52);
            uint64_t v68 = v53;
            v56 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v55, (uint64_t)&v68, 1);
            v59 = objc_msgSend_uuid(self, v57, v58);
            id v62 = objc_msgSend_account(self, v60, v61);
            objc_msgSend_addMissingIdentityPublicKeys_forManagerUUID_withAccount_(v54, v63, (uint64_t)v56, v59, v62);
          }
          CFRelease(v49);
        }
        CFRelease(v47);
      }
    }
    if (objc_msgSend__checkAndClearPCSTestOverrideForKey_(self, v38, @"ClearContainersOnPCSNotifier"))
    {
      v66 = objc_msgSend_sharedNotifier(CKDPCSNotifier, v64, v65);
      objc_msgSend_addTestOverrides_(v66, v67, (uint64_t)&unk_1F20ABAB0);
    }
  }
}

- (void)_locked_createZonePCSWithSyncKeyRegistryRetry:(BOOL)a3 requestorOperationID:(id)a4 keySyncAnalytics:(id)a5 completionHandler:(id)a6
{
  BOOL v115 = a3;
  v140[3] = *MEMORY[0x1E4F143B8];
  id v117 = a4;
  id v9 = a5;
  id v118 = a6;
  uint64_t v12 = objc_msgSend_synchronizeQueue(self, v10, v11);
  dispatch_assert_queue_V2(v12);

  CFTypeRef v134 = 0;
  id v15 = objc_msgSend_identityManager(self, v13, v14);
  objc_msgSend_PCSServiceStringFromCKServiceType_(v15, v16, 0);

  uint64_t v130 = 0;
  uint64_t v131 = &v130;
  uint64_t v132 = 0x2020000000;
  char v133 = 0;
  int v19 = objc_msgSend_identityManager(self, v17, v18);
  id v129 = 0;
  uint64_t v21 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(v19, v20, 0, 1, &v129);
  id v22 = v129;

  if (v22 || !v21)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v52 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v136 = v22;
      _os_log_impl(&dword_1C4CFF000, v52, OS_LOG_TYPE_INFO, "Failed to get signing identity set in createZonePCSWithError: %@", buf, 0xCu);
    }
    if (!v22)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v53, *MEMORY[0x1E4F19DD8], 5000, @"Couldn't get a PCS identity set");
      id v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v55 = objc_msgSend_domain(v22, v53, v54);
    if (objc_msgSend_isEqualToString_(v55, v56, *MEMORY[0x1E4F19DD8])) {
      BOOL v44 = objc_msgSend_code(v22, v57, v58) == 5000;
    }
    else {
      BOOL v44 = 0;
    }

    v116 = 0;
    id v35 = 0;
    uint64_t v51 = 0;
  }
  else
  {
    uint64_t v25 = (const void *)PCSIdentitySetCopyCurrentIdentityWithError();
    if (v25 && !v134)
    {
      v139[0] = *MEMORY[0x1E4F93EE8];
      uint64_t v26 = objc_msgSend_identityManager(self, v23, v24);
      __int16 v29 = objc_msgSend_serviceName(v26, v27, v28);
      uint64_t v30 = *MEMORY[0x1E4F93EC0];
      v140[0] = v29;
      v140[1] = v25;
      uint64_t v31 = *MEMORY[0x1E4F93EC8];
      v139[1] = v30;
      v139[2] = v31;
      v140[2] = *MEMORY[0x1E4F93EE0];
      v116 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v32, (uint64_t)v140, v139, 3);

      uint64_t v33 = PCSFPCreate();
      id v35 = (void *)v33;
      if (v134 || !v33)
      {
        uint64_t v59 = objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(MEMORY[0x1E4F1A280], v34, *MEMORY[0x1E4F19DD8], 5002, 0, @"Couldn't create a new PCSShareProtectionRef");
      }
      else
      {
        uint64_t v37 = PCSFPCreatePrivateKey();
        if (v37)
        {
          CFTypeRef v114 = (CFTypeRef)PCSIdentityCopyPublicIdentity();
          v128[0] = MEMORY[0x1E4F143A8];
          v128[1] = 3221225472;
          v128[2] = sub_1C4DCA7E8;
          v128[3] = &unk_1E64F2918;
          v128[4] = &v130;
          v128[5] = v35;
          v128[6] = v114;
          objc_msgSend__onSynchronizeQueue_(self, v38, (uint64_t)v128);
          CFTypeRef cf = (CFTypeRef)v37;
          if (*((unsigned char *)v131 + 24))
          {
            id v41 = objc_msgSend_containerID(self, v39, v40);
            BOOL v44 = objc_msgSend_specialContainerType(v41, v42, v43) == 25;

            if (!v44)
            {
              uint64_t v51 = 0;
              goto LABEL_30;
            }
            if (*MEMORY[0x1E4F1A4E0])
            {
              uint64_t v47 = objc_msgSend__pcsTestOverrideForKey_(self, v45, @"ForceSingleIdentityForRemindersZone");
              char v50 = objc_msgSend_BOOLValue(v47, v48, v49);

              if (v50)
              {
                uint64_t v51 = 0;
                BOOL v44 = 0;
LABEL_30:
                id v22 = 0;
                goto LABEL_39;
              }
            }
            uint64_t v61 = objc_msgSend_identityManager(self, v45, v46);
            id v127 = 0;
            uint64_t v63 = objc_msgSend_copyIdentitySetWithType_options_error_(v61, v62, 4, 1, &v127);
            id v22 = v127;

            if (*MEMORY[0x1E4F1A4E0]) {
              int v65 = objc_msgSend__checkAndClearPCSTestOverrideForKey_(self, v64, @"ForceKeyRegistrySyncOnRemindersZoneCreation");
            }
            else {
              int v65 = 0;
            }
            if (v22 || !v63 || v65)
            {
              if (*MEMORY[0x1E4F1A550] != -1) {
                dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              v106 = *MEMORY[0x1E4F1A528];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                id v136 = v22;
                _os_log_impl(&dword_1C4CFF000, v106, OS_LOG_TYPE_INFO, "Warn: Couldn't get a Reminders identity set: %@", buf, 0xCu);
              }
              if (!v22)
              {
                objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v107, *MEMORY[0x1E4F19DD8], 5000, @"Couldn't get a Reminders identity set to add to PCS");
                id v22 = (id)objc_claimAutoreleasedReturnValue();
              }
              uint64_t v109 = objc_msgSend_domain(v22, v107, v108);
              if (objc_msgSend_isEqualToString_(v109, v110, *MEMORY[0x1E4F19DD8])) {
                BOOL v44 = objc_msgSend_code(v22, v111, v112) == 5000;
              }
              else {
                BOOL v44 = 0;
              }

              uint64_t v51 = 4;
              goto LABEL_39;
            }
            uint64_t v60 = objc_msgSend__addIdentity_withService_toPCS_(self, v64, v63, 4, v35);
          }
          else
          {
            uint64_t v60 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v39, *MEMORY[0x1E4F19DD8], 5005, @"Failed to add our public identity to the PCS object");
          }
          id v22 = (id)v60;
          uint64_t v51 = 0;
          BOOL v44 = 0;
LABEL_39:
          CFRelease(cf);
          if (v114) {
            CFRelease(v114);
          }
          goto LABEL_41;
        }
        uint64_t v59 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v36, *MEMORY[0x1E4F19DD8], 5000, @"Failed to add a protection key to the zone");
      }
      id v22 = (id)v59;
      BOOL v44 = 0;
      uint64_t v51 = 0;
LABEL_41:
      CFRelease(v25);
      goto LABEL_42;
    }
    objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v23, *MEMORY[0x1E4F19DD8], 5000, 0, v134);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    v116 = 0;
    id v35 = 0;
    uint64_t v51 = 0;
    BOOL v44 = 1;
    if (v25) {
      goto LABEL_41;
    }
  }
LABEL_42:
  if (v134)
  {
    CFRelease(v134);
    CFTypeRef v134 = 0;
  }
  v66 = (void *)*MEMORY[0x1E4F1A548];
  if (v35)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v66);
    }
    id v67 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v136 = v35;
      _os_log_debug_impl(&dword_1C4CFF000, v67, OS_LOG_TYPE_DEBUG, "Created new zone PCS: %@", buf, 0xCu);
    }
    uint64_t v68 = objc_alloc_init(CKDZonePCSData);
    objc_msgSend_setPcs_(v68, v69, (uint64_t)v35);
    CFRelease(v35);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v66);
    }
    __int16 v72 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v136 = v22;
      _os_log_error_impl(&dword_1C4CFF000, v72, OS_LOG_TYPE_ERROR, "Error creating new zone PCS: %@", buf, 0xCu);
    }
    uint64_t v68 = 0;
  }
  if (!*MEMORY[0x1E4F1A4E0])
  {
LABEL_68:
    if (v44 && v115)
    {
      v80 = objc_msgSend_identityManager(self, v70, v71);
      int v82 = objc_msgSend_PCSServiceStringFromCKServiceType_(v80, v81, v51);

      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v83 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543618;
        id v136 = v82;
        __int16 v137 = 2114;
        id v138 = v117;
        _os_log_debug_impl(&dword_1C4CFF000, v83, OS_LOG_TYPE_DEBUG, "Attempting user key sync before retrying zone PCS creation for service %{public}@ and operation %{public}@.", buf, 0x16u);
      }
      v123[0] = MEMORY[0x1E4F143A8];
      v123[1] = 3221225472;
      v123[2] = sub_1C4DCA820;
      v123[3] = &unk_1E64F2968;
      v123[4] = self;
      id v84 = v82;
      id v124 = v84;
      id v125 = v117;
      id v126 = v118;
      objc_msgSend_synchronizeUserKeyRegistryForServiceType_shouldThrottle_context_requestorOperationID_completionHandler_(self, v85, v51, 0, 0x1F2058770, v125, v123);

      goto LABEL_90;
    }
    goto LABEL_76;
  }
  if (objc_msgSend__checkAndClearPCSTestOverrideForKey_(self, v70, @"ForceUserKeyRegistrySyncRetryOnZonePCSCreation"))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v74 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C4CFF000, v74, OS_LOG_TYPE_DEBUG, "Forcing user key sync retry for unit tests", buf, 2u);
    }
    uint64_t v76 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v75, *MEMORY[0x1E4F19DD8], 5000, @"Couldn't create a PCS identity for unit tests");

    BOOL v44 = 1;
    id v22 = (id)v76;
    goto LABEL_68;
  }
  if (!objc_msgSend__checkAndClearPCSTestOverrideForKey_(self, v73, @"ForceImmediateUserKeyRegistrySyncFailure"))goto LABEL_68; {
  if (*MEMORY[0x1E4F1A550] != -1)
  }
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  v77 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C4CFF000, v77, OS_LOG_TYPE_DEBUG, "Forcing user key sync failure for unit tests", buf, 2u);
    if (!v22) {
      goto LABEL_67;
    }
LABEL_76:
    objc_msgSend_domain(v22, v70, v71);
    goto LABEL_77;
  }
  if (v22) {
    goto LABEL_76;
  }
LABEL_67:
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v70, *MEMORY[0x1E4F19DD8], 5000, @"Failed to preflight PCS identities because of unit tests");
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_domain(v22, v78, v79);
  v86 = LABEL_77:;
  uint64_t v87 = *MEMORY[0x1E4F19DD8];
  if (!objc_msgSend_isEqualToString_(v86, v88, *MEMORY[0x1E4F19DD8])
    || objc_msgSend_code(v22, v89, v90) != 5000)
  {
    goto LABEL_81;
  }
  int IsManatee = objc_msgSend_currentServiceIsManatee(self, v91, v92);

  if (IsManatee)
  {
    v96 = (void *)MEMORY[0x1E4F1A280];
    v86 = objc_msgSend_userInfo(v22, v94, v95);
    uint64_t v98 = objc_msgSend_objectForKeyedSubscript_(v86, v97, *MEMORY[0x1E4F28A50]);
    uint64_t v100 = objc_msgSend_errorWithDomain_code_error_format_(v96, v99, v87, 5008, v98, @"Failed to decrypt. Keys unavailable even after synchronization");

    id v22 = (id)v100;
LABEL_81:
  }
  if (v9)
  {
    if (v22) {
      BOOL v101 = 1;
    }
    else {
      BOOL v101 = v68 == 0;
    }
    v102 = off_1E64F5A18;
    if (v101) {
      v102 = off_1E64F5A20;
    }
    objc_msgSend_setOverallResult_(v9, v94, (uint64_t)*v102);
    objc_msgSend_setError_(v9, v103, (uint64_t)v22);
    objc_msgSend_sendCoreAnalyticsEventForKeySync_(self, v104, (uint64_t)v9);
  }
  v105 = objc_msgSend_callbackQueue(self, v94, v95);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4DCABC0;
  block[3] = &unk_1E64F0718;
  id v122 = v118;
  v120 = v68;
  id v22 = v22;
  id v121 = v22;
  dispatch_async(v105, block);

  id v84 = v122;
LABEL_90:

  if (v21) {
    CFRelease(v21);
  }
  _Block_object_dispose(&v130, 8);
}

- (void)createZonePCSWithSyncKeyRegistryRetry:(BOOL)a3 requestorOperationID:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_synchronizeQueue(self, v10, v11);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1C4DCACC8;
  v15[3] = &unk_1E64F3080;
  BOOL v18 = a3;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v12, v15);
}

- (void)createZonePCSWithRequestorOperationID:(id)a3 completionHandler:(id)a4
{
}

- (_OpaquePCSShareProtection)createZonePCSWithError:(id *)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  CFTypeRef v63 = 0;
  uint64_t v5 = objc_msgSend_identityManager(self, a2, (uint64_t)a3);
  objc_msgSend_PCSServiceStringFromCKServiceType_(v5, v6, 0);

  uint64_t v59 = 0;
  uint64_t v60 = &v59;
  uint64_t v61 = 0x2020000000;
  char v62 = 0;
  id v9 = objc_msgSend_identityManager(self, v7, v8);
  id v58 = 0;
  uint64_t v11 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(v9, v10, 0, 1, &v58);
  uint64_t v12 = (_OpaquePCSShareProtection *)v58;

  id v13 = (void *)MEMORY[0x1E4F1A550];
  id v14 = (os_log_t *)MEMORY[0x1E4F1A528];
  if (!v12 && v11)
  {
    id v17 = (const void *)PCSIdentitySetCopyCurrentIdentityWithError();
    if (!v17 || v63)
    {
      objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v15, *MEMORY[0x1E4F19DD8], 5000, 0, v63);
      id v45 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = v45;
      if (a3) {
        *a3 = v45;
      }
      uint64_t v28 = 0;
      uint64_t v25 = 0;
      uint64_t v30 = 0;
      if (!v17) {
        goto LABEL_44;
      }
      goto LABEL_43;
    }
    v64[0] = *MEMORY[0x1E4F93EE8];
    BOOL v18 = objc_msgSend_identityManager(self, v15, v16);
    uint64_t v21 = objc_msgSend_serviceName(v18, v19, v20);
    uint64_t v22 = *MEMORY[0x1E4F93EC0];
    v65[0] = v21;
    v65[1] = v17;
    uint64_t v23 = *MEMORY[0x1E4F93EC8];
    v64[1] = v22;
    v64[2] = v23;
    v65[2] = *MEMORY[0x1E4F93EE0];
    uint64_t v25 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v24, (uint64_t)v65, v64, 3);

    uint64_t v26 = PCSFPCreate();
    uint64_t v28 = (_OpaquePCSShareProtection *)v26;
    if (v63 || !v26)
    {
      objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(MEMORY[0x1E4F1A280], v27, *MEMORY[0x1E4F19DD8], 5002, 0, @"Couldn't create a new PCSShareProtectionRef");
      uint64_t v46 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = v46;
      if (a3) {
        *a3 = v46;
      }
      if (!v28) {
        goto LABEL_32;
      }
    }
    else
    {
      uint64_t v30 = (const void *)PCSFPCreatePrivateKey();
      if (v30)
      {
        CFTypeRef cf = (CFTypeRef)PCSIdentityCopyPublicIdentity();
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = sub_1C4DCB38C;
        v57[3] = &unk_1E64F2918;
        v57[4] = &v59;
        v57[5] = v28;
        v57[6] = cf;
        objc_msgSend__onSynchronizeQueue_(self, v31, (uint64_t)v57);
        if (*((unsigned char *)v60 + 24))
        {
          uint64_t v34 = objc_msgSend_containerID(self, v32, v33);
          BOOL v37 = objc_msgSend_specialContainerType(v34, v35, v36) == 25;

          if (!v37)
          {
            uint64_t v12 = 0;
LABEL_41:
            if (cf) {
              CFRelease(cf);
            }
            goto LABEL_43;
          }
          uint64_t v40 = objc_msgSend_identityManager(self, v38, v39);
          id v56 = 0;
          uint64_t v54 = objc_msgSend_copyIdentitySetWithType_options_error_(v40, v41, 4, 1, &v56);
          uint64_t v12 = (_OpaquePCSShareProtection *)v56;

          if (v12 || !v54)
          {
            if (*v13 != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            uint64_t v48 = *v14;
            if (os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v67 = v12;
              _os_log_impl(&dword_1C4CFF000, v48, OS_LOG_TYPE_INFO, "Warn: Couldn't get a Reminders identity set: %@", buf, 0xCu);
            }
            if (v12) {
              goto LABEL_41;
            }
            uint64_t v43 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v49, *MEMORY[0x1E4F19DD8], 5000, @"Couldn't get a Reminders identity set to add to PCS");
          }
          else
          {
            uint64_t v43 = objc_msgSend__addIdentity_withService_toPCS_(self, v42, v54, 4, v28);
          }
        }
        else
        {
          uint64_t v43 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v32, *MEMORY[0x1E4F19DD8], 5005, @"Failed to add our public identity to the PCS object");
        }
        uint64_t v12 = (_OpaquePCSShareProtection *)v43;
        goto LABEL_41;
      }
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v29, *MEMORY[0x1E4F19DD8], 5000, @"Failed to add a protection key to the zone");
      uint64_t v47 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = v47;
      if (a3) {
        *a3 = v47;
      }
    }
    CFRelease(v28);
    uint64_t v28 = 0;
LABEL_32:
    uint64_t v30 = 0;
LABEL_43:
    CFRelease(v17);
LABEL_44:
    CFRelease(v11);
    if (v30) {
      CFRelease(v30);
    }
    goto LABEL_46;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  BOOL v44 = *v14;
  if (os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v67 = v12;
    _os_log_impl(&dword_1C4CFF000, v44, OS_LOG_TYPE_INFO, "Failed to get signing identity set in createZonePCSWithError: %@", buf, 0xCu);
  }
  if (a3) {
    *a3 = v12;
  }
  uint64_t v30 = 0;
  uint64_t v25 = 0;
  uint64_t v28 = 0;
  if (v11) {
    goto LABEL_44;
  }
LABEL_46:
  if (v63)
  {
    CFRelease(v63);
    CFTypeRef v63 = 0;
  }
  char v50 = (void *)*MEMORY[0x1E4F1A548];
  if (v28)
  {
    if (*v13 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v50);
    }
    uint64_t v51 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v67 = v28;
      _os_log_debug_impl(&dword_1C4CFF000, v51, OS_LOG_TYPE_DEBUG, "Created new zone PCS: %@", buf, 0xCu);
    }
  }
  else
  {
    if (*v13 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v50);
    }
    uint64_t v52 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v67 = v12;
      _os_log_error_impl(&dword_1C4CFF000, v52, OS_LOG_TYPE_ERROR, "Error creating new zone PCS: %@", buf, 0xCu);
    }
  }
  _Block_object_dispose(&v59, 8);

  return v28;
}

- (id)dataFromZonePCS:(_OpaquePCSShareProtection *)a3 error:(id *)a4
{
  id v4 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v17 = 0;
  BOOL v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_1C4DC743C;
  uint64_t v21 = sub_1C4DC744C;
  id v22 = 0;
  if (a3)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1C4DCB6F4;
    v16[3] = &unk_1E64F2990;
    v16[5] = &v23;
    v16[6] = a3;
    v16[4] = &v17;
    objc_msgSend__onSynchronizeQueue_(self, a2, (uint64_t)v16);
    if (v24[3] || !v18[5])
    {
      id v7 = objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(MEMORY[0x1E4F1A280], v6, *MEMORY[0x1E4F19DD8], 5002, 0, @"Couldn't encode zone PCS data");
      uint64_t v8 = v7;
      if (a4) {
        *a4 = v7;
      }
      id v9 = (void *)v18[5];
      v18[5] = 0;

      uint64_t v10 = (const void *)v24[3];
      if (v10)
      {
        CFRelease(v10);
        v24[3] = 0;
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
    uint64_t v11 = (void *)*MEMORY[0x1E4F1A548];
    if (v18[5])
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v11);
      }
      uint64_t v12 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
      {
        id v13 = (void *)v18[5];
        *(_DWORD *)buf = 138412546;
        uint64_t v28 = v4;
        __int16 v29 = 2112;
        uint64_t v30 = v13;
        _os_log_debug_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_DEBUG, "Created zone PCS data from zone PCS %@: %@.", buf, 0x16u);
      }
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v11);
      }
      id v14 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v28 = v4;
        __int16 v29 = 2112;
        uint64_t v30 = v8;
        _os_log_error_impl(&dword_1C4CFF000, v14, OS_LOG_TYPE_ERROR, "Error creating zone PCS data from zone PCS %@: %@", buf, 0x16u);
      }
    }
    id v4 = (_OpaquePCSShareProtection *)(id)v18[5];
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v4;
}

- (id)getAllPublicKeysForExportedData:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v18 = 0;
  id v9 = (const void *)objc_msgSend_createSharePCSFromEncryptedData_error_(self, v8, (uint64_t)v6, &v18);
  id v10 = v18;
  uint64_t v11 = v10;
  if (v9 && !v10)
  {
    uint64_t v12 = PCSShareProtectionCopyPublicKeys();
    if (v12)
    {
      id v13 = (const void *)v12;
      id v17 = v7;
      CKCFArrayForEach();

      CFRelease(v9);
      id v14 = v13;
    }
    else
    {
      id v14 = v9;
    }
    CFRelease(v14);
    goto LABEL_15;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v15 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v11;
    _os_log_error_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_ERROR, "Error creating PCS from encrypted data %@: %@", buf, 0x16u);
    if (!v9) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (v9) {
LABEL_9:
  }
    CFRelease(v9);
LABEL_10:
  if (a4 && v11) {
    *a4 = v11;
  }
LABEL_15:

  return v7;
}

- (void)findSelfParticipantOnShareMetadata:(id)a3 invitationToken:(id)a4 completionHandler:(id)a5
{
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v122 = a4;
  v123 = (void (**)(id, uint64_t))a5;
  id v127 = v7;
  id v126 = objc_msgSend_share(v7, v8, v9);
  if (objc_msgSend_currentServiceIsManatee(self, v10, v11))
  {
    uint64_t v12 = [CKPCSManateeShareInvitation alloc];
    id v15 = objc_msgSend_sharingInvitationData(v122, v13, v14);
    id v17 = objc_msgSend_initWithData_(v12, v16, (uint64_t)v15);
    v120 = objc_msgSend_exportedPCSData(v17, v18, v19);

    id v121 = objc_msgSend_getAllPublicKeysForExportedData_error_(self, v20, (uint64_t)v120, 0);
    __int16 v21 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v22 = (void *)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v98 = v22;
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = objc_msgSend_count(v121, v99, v100);
      _os_log_debug_impl(&dword_1C4CFF000, v98, OS_LOG_TYPE_DEBUG, "Got %lu pcs key(s) to match from dugong invitation", buf, 0xCu);
    }
    if (objc_msgSend_count(v121, v23, v24))
    {
      long long v147 = 0u;
      long long v148 = 0u;
      long long v145 = 0u;
      long long v146 = 0u;
      id obj = v121;
      uint64_t v118 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v25, (uint64_t)&v145, v153, 16);
      if (!v118) {
        goto LABEL_39;
      }
      uint64_t v27 = *(void *)v146;
      *(void *)&long long v26 = 138412290;
      long long v116 = v26;
      uint64_t v117 = *(void *)v146;
      while (1)
      {
        uint64_t v28 = 0;
        do
        {
          if (*(void *)v146 != v27)
          {
            uint64_t v29 = v28;
            objc_enumerationMutation(obj);
            uint64_t v28 = v29;
          }
          uint64_t v30 = v28;
          uint64_t v31 = *(void *)(*((void *)&v145 + 1) + 8 * v28);
          if (*v21 != -1) {
            dispatch_once(v21, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v32 = *MEMORY[0x1E4F1A528];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v116;
            *(void *)&uint8_t buf[4] = v31;
            _os_log_debug_impl(&dword_1C4CFF000, v32, OS_LOG_TYPE_DEBUG, "Matching participants with invitation public key: %@", buf, 0xCu);
          }
          long long v143 = 0u;
          long long v144 = 0u;
          long long v141 = 0u;
          long long v142 = 0u;
          objc_msgSend_participants(v126, v33, v34, v116);
          id v124 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v124, v35, (uint64_t)&v141, v152, 16);
          if (!v38) {
            goto LABEL_37;
          }
          uint64_t v39 = *(void *)v142;
          while (2)
          {
            uint64_t v40 = 0;
            do
            {
              if (*(void *)v142 != v39) {
                objc_enumerationMutation(v124);
              }
              id v41 = *(void **)(*((void *)&v141 + 1) + 8 * v40);
              BOOL v44 = objc_msgSend_protectionInfoPublicKey(v41, v36, v37);
              if (v44) {
                goto LABEL_67;
              }
              BOOL v44 = objc_msgSend_protectionInfo(v41, v42, v43);
              if (!v44) {
                goto LABEL_35;
              }
              BOOL v48 = objc_msgSend_acceptanceStatus(v41, v46, v47) == 2;

              if (!v48) {
                goto LABEL_34;
              }
              if (*v21 != -1) {
                dispatch_once(v21, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              uint64_t v49 = (void *)*MEMORY[0x1E4F1A528];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
              {
                uint64_t v59 = v49;
                char v62 = objc_msgSend_participantID(v41, v60, v61);
                *(_DWORD *)buf = v116;
                *(void *)&uint8_t buf[4] = v62;
                _os_log_debug_impl(&dword_1C4CFF000, v59, OS_LOG_TYPE_DEBUG, "PPPCS public key is not present for participant %@, checking PPPCS blob", buf, 0xCu);
              }
              uint64_t v52 = objc_msgSend_protectionInfo(v41, v50, v51);
              uint64_t v54 = objc_msgSend_getAllPublicKeysForExportedData_error_(self, v53, (uint64_t)v52, 0);

              if (objc_msgSend_count(v54, v55, v56) != 1)
              {

LABEL_34:
                BOOL v44 = 0;
                goto LABEL_35;
              }
              BOOL v44 = objc_msgSend_firstObject(v54, v57, v58);

              if (v44)
              {
LABEL_67:
                if (objc_msgSend_isEqualToData_(v44, v42, v31))
                {
                  objc_msgSend_setIsCurrentUser_(v41, v45, 1);
                  objc_msgSend_setCallingParticipant_(v127, v81, (uint64_t)v41);
                  uint64_t v84 = objc_msgSend_acceptanceStatus(v41, v82, v83);
                  if (v84 == 2)
                  {
                    uint64_t v87 = objc_msgSend_userIdentity(v41, v85, v86);
                    uint64_t v90 = objc_msgSend_userRecordID(v87, v88, v89);
                    v93 = objc_msgSend_recordName(v90, v91, v92);

                    if (*v21 != -1) {
                      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
                    }
                    v94 = (void *)*MEMORY[0x1E4F1A528];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
                    {
                      uint64_t v112 = v94;
                      BOOL v115 = objc_msgSend_participantID(v41, v113, v114);
                      *(_DWORD *)buf = 138412546;
                      *(void *)&uint8_t buf[4] = v115;
                      *(_WORD *)&buf[12] = 2112;
                      *(void *)&buf[14] = v93;
                      _os_log_debug_impl(&dword_1C4CFF000, v112, OS_LOG_TYPE_DEBUG, "Manatee share is already accepted by participant %@, filling anonymousID %@ for share metadata.", buf, 0x16u);
                    }
                    objc_msgSend_fillAnonymousCKUserID_(v127, v95, (uint64_t)v93);
                  }
                  if (*v21 != -1) {
                    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
                  }
                  v96 = (void *)*MEMORY[0x1E4F1A528];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
                  {
                    BOOL v101 = v96;
                    v104 = objc_msgSend_callingParticipant(v127, v102, v103);
                    v107 = objc_msgSend_recordID(v126, v105, v106);
                    *(_DWORD *)buf = 138412546;
                    *(void *)&uint8_t buf[4] = v104;
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v107;
                    _os_log_debug_impl(&dword_1C4CFF000, v101, OS_LOG_TYPE_DEBUG, "Found current participant %@ on anonymous to server share %@", buf, 0x16u);
                  }
                  v123[2](v123, 1);

                  goto LABEL_64;
                }
              }
LABEL_35:

              ++v40;
            }
            while (v38 != v40);
            uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v124, v36, (uint64_t)&v141, v152, 16);
            if (v38) {
              continue;
            }
            break;
          }
LABEL_37:

          uint64_t v28 = v30 + 1;
          uint64_t v27 = v117;
        }
        while (v30 + 1 != v118);
        uint64_t v118 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v63, (uint64_t)&v145, v153, 16);
        uint64_t v27 = v117;
        if (!v118)
        {
LABEL_39:

          goto LABEL_63;
        }
      }
    }
    if (*v21 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v97 = (void *)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      uint64_t v108 = v97;
      v111 = objc_msgSend_recordID(v126, v109, v110);
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v111;
      _os_log_error_impl(&dword_1C4CFF000, v108, OS_LOG_TYPE_ERROR, "Could not get public key data from invitation token for share %@. This won't go well.", buf, 0xCu);
    }
LABEL_63:
    v123[2](v123, 0);
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v151 = 0;
    id v64 = dispatch_group_create();
    long long v137 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    id v67 = objc_msgSend_share(v7, v65, v66);
    objc_msgSend_participants(v67, v68, v69);
    id v125 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v125, v70, (uint64_t)&v137, v149, 16);
    if (v71)
    {
      uint64_t v72 = *(void *)v138;
      do
      {
        for (uint64_t i = 0; i != v71; ++i)
        {
          if (*(void *)v138 != v72) {
            objc_enumerationMutation(v125);
          }
          uint64_t v74 = *(void **)(*((void *)&v137 + 1) + 8 * i);
          dispatch_group_enter(v64);
          v77 = objc_msgSend_protectionInfo(v74, v75, v76);
          v132[0] = MEMORY[0x1E4F143A8];
          v132[1] = 3221225472;
          v132[2] = sub_1C4DCC3D4;
          v132[3] = &unk_1E64F29E0;
          id v136 = buf;
          v132[4] = v74;
          id v133 = v7;
          id v134 = v126;
          v135 = v64;
          objc_msgSend_createSharePCSFromData_ofType_withService_completionHandler_(self, v78, (uint64_t)v77, 4, 2, v132);
        }
        uint64_t v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v125, v79, (uint64_t)&v137, v149, 16);
      }
      while (v71);
    }

    v80 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4DCC624;
    block[3] = &unk_1E64F07E0;
    uint64_t v130 = v123;
    uint64_t v131 = buf;
    dispatch_group_notify(v64, v80, block);

    _Block_object_dispose(buf, 8);
  }
LABEL_64:
}

- (id)getCurrentIdentityExportedPrivateKey
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v22 = 0;
  id v4 = objc_msgSend_identityManager(self, a2, v2);
  objc_msgSend_PCSServiceStringFromCKServiceType_(v4, v5, 0);

  uint64_t v8 = objc_msgSend_identityManager(self, v6, v7);
  id v21 = 0;
  id v10 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(v8, v9, 0, 1, &v21);
  id v11 = v21;

  if (v11 || !v10)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v17 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v11;
      _os_log_impl(&dword_1C4CFF000, v17, OS_LOG_TYPE_INFO, "Failed to get current identity set trying to create anonymous userID %@", buf, 0xCu);
    }
    id v15 = 0;
    id v18 = 0;
    if (v10) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v12 = PCSIdentitySetCopyCurrentIdentityWithError();
    id v13 = (const void *)v12;
    if (!v22 && v12)
    {
      uint64_t v14 = PCSIdentityCopyExportedPrivateKey();
      id v15 = (void *)v14;
      if (v22 || !v14)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v16 = *MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v22;
          _os_log_impl(&dword_1C4CFF000, v16, OS_LOG_TYPE_INFO, "Failed to get exported private key data trying to create anonymous userID: %@", buf, 0xCu);
        }
      }
      CFRelease(v10);
      id v10 = v13;
LABEL_17:
      CFRelease(v10);
      id v18 = v15;
      goto LABEL_18;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v20 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v22;
      _os_log_impl(&dword_1C4CFF000, v20, OS_LOG_TYPE_INFO, "Failed to get current identity trying to create anonymous userID: %@", buf, 0xCu);
    }
    CFRelease(v10);
    id v15 = 0;
    id v18 = 0;
    id v10 = v13;
    if (v13) {
      goto LABEL_17;
    }
  }
LABEL_18:

  return v18;
}

- (id)generateOctopusAnonymousUserID
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  Named = (const void *)PCSIdentitySetCreateNamed();
  uint64_t v3 = (const void *)PCSIdentitySetCopyCurrentIdentityWithError();
  uint64_t v5 = (void *)PCSIdentityCopyExportedPrivateKey();
  if (Named) {
    CFRelease(Named);
  }
  if (v3) {
    CFRelease(v3);
  }
  id v6 = objc_msgSend_stringWithFormat_(NSString, v4, @"%@-%@-%@-%@-%@-%@", @"123456789", @"com.apple.fake.container", @"cloudkit.zoneshare", @"TestZone", @"🐥", v5);
  *(_OWORD *)md = 0u;
  long long v24 = 0u;
  uint64_t v8 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E4F1C9B8], v7, (uint64_t)md, 32, 0);
  id v11 = (const void *)objc_msgSend_UTF8String(v6, v9, v10);
  CC_LONG v13 = objc_msgSend_lengthOfBytesUsingEncoding_(v6, v12, 4);
  CC_SHA256(v11, v13, md);
  uint64_t v16 = objc_msgSend_CKLowercaseHexStringWithoutSpaces(v8, v14, v15);
  id v18 = objc_msgSend_stringByAppendingString_(@"+", v17, (uint64_t)v16);

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v19 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v18;
    _os_log_debug_impl(&dword_1C4CFF000, v19, OS_LOG_TYPE_DEBUG, "Generated fake anonymous user ID %@", buf, 0xCu);
  }

  return v18;
}

- (id)generateAnonymousCKUserIDForCurrentUserInShare:(id)a3 containerID:(id)a4 acceptA2AShareUsingVersionOneAnonymousIdentifier:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v12 = objc_msgSend_account(self, v10, v11);
  uint64_t v15 = objc_msgSend_dsid(v12, v13, v14);

  id v18 = objc_msgSend_containerIdentifier(v9, v16, v17);

  id v21 = objc_msgSend_recordName(v8, v19, v20);
  long long v24 = objc_msgSend_zoneID(v8, v22, v23);
  uint64_t v27 = objc_msgSend_zoneName(v24, v25, v26);

  uint64_t v30 = objc_msgSend_zoneID(v8, v28, v29);
  uint64_t v33 = objc_msgSend_ownerName(v30, v31, v32);

  uint64_t v34 = CKRandomDataWithLength();
  uint64_t v36 = (void *)v34;
  if (v15 && v18 && v21 && v27 && v33 && v34)
  {
    uint64_t v37 = objc_msgSend_stringWithFormat_(NSString, v35, @"%@-%@-%@-%@-%@-%@", v15, v18, v21, v27, v33, v34);
    *(_OWORD *)md = 0u;
    long long v63 = 0u;
    id v57 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E4F1C9B8], v38, (uint64_t)md, 32, 0);
    id v41 = (const void *)objc_msgSend_UTF8String(v37, v39, v40);
    uint64_t v56 = v37;
    CC_LONG v43 = objc_msgSend_lengthOfBytesUsingEncoding_(v37, v42, 4);
    CC_SHA256(v41, v43, md);
    if (*MEMORY[0x1E4F1A4E0] && v5)
    {
      uint64_t v46 = objc_msgSend_CKLowercaseHexStringWithoutSpaces(v57, v44, v45);
      BOOL v48 = objc_msgSend_stringByAppendingString_(@"+", v47, (uint64_t)v46);

      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v49 = *MEMORY[0x1E4F1A500];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG)) {
        goto LABEL_21;
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v59 = v48;
      __int16 v60 = 2112;
      id v61 = v8;
      char v50 = "CKBehaviorOptions override - Generated anonymous user ID %@ for share %@";
    }
    else
    {
      uint64_t v52 = NSString;
      uint64_t v53 = objc_msgSend_CKLowercaseHexStringWithoutSpaces(v57, v44, v45);
      BOOL v48 = objc_msgSend_stringWithFormat_(v52, v54, @"%@%@%@", @"+", @"01", v53);

      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v37 = v56;
      uint64_t v49 = *MEMORY[0x1E4F1A500];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG)) {
        goto LABEL_21;
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v59 = v48;
      __int16 v60 = 2112;
      id v61 = v8;
      char v50 = "Generated versioned anonymous user ID %@ for share %@";
    }
    _os_log_debug_impl(&dword_1C4CFF000, v49, OS_LOG_TYPE_DEBUG, v50, buf, 0x16u);
LABEL_21:

    goto LABEL_22;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v51 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)md = 0;
    _os_log_error_impl(&dword_1C4CFF000, v51, OS_LOG_TYPE_ERROR, "Failed to assemble required components to generate an anonymous userID. Not returning one.", md, 2u);
  }
  BOOL v48 = 0;
LABEL_22:

  return v48;
}

- (id)createSignatureWithIdentity:(_PCSIdentityData *)a3 dataToBeSigned:(id)a4 forScope:(unint64_t)a5 error:(id *)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  if (a3)
  {
    CFAllocatorRef allocator = 0;
    unint64_t v12 = a5 - 1;
    Signature = (void *)PCSIdentityCreateSignature();
    uint64_t v15 = (unsigned char *)MEMORY[0x1E4F1A4E0];
    if (*MEMORY[0x1E4F1A4E0])
    {
      if ((objc_msgSend__checkAndClearPCSTestOverrideForKey_(self, v13, @"GenerateOneInvalidSignature") & 1) != 0
        || objc_msgSend__checkAndClearPCSTestOverrideForKey_(self, v16, @"FakeInvalidSignature"))
      {
        long long v28 = xmmword_1C5080518;
        *(_OWORD *)uint64_t v29 = unk_1C5080528;
        *(void *)&v29[15] = 0xDD6BD7280FB6607ALL;
        id v18 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        uint64_t v20 = objc_msgSend_initWithBytes_length_(v18, v19, (uint64_t)&v28, 39);
        id v21 = (const void *)PCSIdentityCreateFromRaw();
        uint64_t v22 = PCSIdentityCreateSignature();

        if (v21) {
          CFRelease(v21);
        }

        Signature = (void *)v22;
      }
      if (*v15 && v12 <= 5)
      {
        int v23 = objc_msgSend__checkAndClearPCSTestOverrideForKey_(self, v17, (uint64_t)off_1E64F3178[v12]);
        CFAllocatorRef v24 = 0;
        if (!v23)
        {
LABEL_13:
          if (!v24) {
            goto LABEL_21;
          }
          if (a6)
          {
            CFAllocatorRef v25 = v24;
LABEL_18:
            *a6 = v25;
            goto LABEL_21;
          }
          CFRelease(v24);
          goto LABEL_21;
        }
        CFAllocatorRef allocator = CFErrorCreate(0, @"com.apple.protectedcloudstorage", 16, (CFDictionaryRef)&unk_1F20ABAD8);

        Signature = 0;
      }
    }
    CFAllocatorRef v24 = allocator;
    goto LABEL_13;
  }
  if (a6)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v10, *MEMORY[0x1E4F19DD8], 5005, @"Missing the required PCSIdentity to generate a signature");
    CFAllocatorRef v25 = (const __CFAllocator *)(id)objc_claimAutoreleasedReturnValue();
    Signature = 0;
    goto LABEL_18;
  }
  Signature = 0;
LABEL_21:

  return Signature;
}

- (id)createCloudKitFeaturesSignatureForData:(id)a3 forScope:(unint64_t)a4 error:(id *)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v11 = objc_msgSend_deviceContext(self, v9, v10);
  uint64_t v14 = objc_msgSend_accountDataSecurityObserver(v11, v12, v13);
  uint64_t v17 = objc_msgSend_account(self, v15, v16);
  char isSecondaryAccount_error = objc_msgSend_isManateeAvailableForAccount_isSecondaryAccount_error_(v14, v18, (uint64_t)v17, 0, 0);

  if (isSecondaryAccount_error)
  {
    uint64_t v22 = 5;
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    int v23 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C4CFF000, v23, OS_LOG_TYPE_DEBUG, "Manatee unavailable, using CloudKitFeaturesStingray identity for signing.", buf, 2u);
    }
    uint64_t v22 = 6;
  }
  CFAllocatorRef v24 = objc_msgSend_identityManager(self, v20, v21);
  uint64_t v26 = objc_msgSend_PCSServiceStringFromCKServiceType_(v24, v25, v22);

  uint64_t v29 = objc_msgSend_identityManager(self, v27, v28);
  id v62 = 0;
  uint64_t v31 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(v29, v30, v22, 0, &v62);
  id v32 = v62;

  uint64_t v34 = (unsigned char *)MEMORY[0x1E4F1A4E0];
  if (*MEMORY[0x1E4F1A4E0] && a4 - 1 <= 3)
  {
    int v35 = objc_msgSend__checkAndClearPCSTestOverrideForKey_(self, v33, (uint64_t)off_1E64F31A8[a4 - 1]);
    if (!v31) {
      goto LABEL_31;
    }
LABEL_13:
    if (!v32 && !v35) {
      goto LABEL_15;
    }
    goto LABEL_31;
  }
  int v35 = 0;
  if (v31) {
    goto LABEL_13;
  }
LABEL_31:
  if (v31) {
    BOOL v45 = 1;
  }
  else {
    BOOL v45 = *v34 == 0;
  }
  if (v45) {
    char v46 = 1;
  }
  else {
    char v46 = v35;
  }
  if (v46)
  {
    if (!v32)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v33, *MEMORY[0x1E4F19DD8], 5000, @"Failed to create signature. No identity set for service %@.", v26);
      id v32 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v47 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v64 = v26;
      _os_log_error_impl(&dword_1C4CFF000, v47, OS_LOG_TYPE_ERROR, "Failed to create CloudKitFeatures signature. No identity set for service %{public}@.", buf, 0xCu);
    }
    goto LABEL_48;
  }
  id v49 = v8;
  char v50 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v51 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v64 = v26;
    _os_log_impl(&dword_1C4CFF000, v51, OS_LOG_TYPE_INFO, "Warn: The test account has no identity set for service %{public}@. Creating a temporary one, which will not be known to the server.", buf, 0xCu);
  }

  uint64_t v54 = objc_msgSend_identityManager(self, v52, v53);
  id v61 = 0;
  uint64_t v31 = (const void *)objc_msgSend_createTemporaryCloudKitFeaturesSigningIdentitySetForServiceName_withError_(v54, v55, (uint64_t)v26, &v61);
  id v32 = v61;

  if (v32)
  {
    if (*v50 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v8 = v49;
    uint64_t v56 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v64 = v26;
      _os_log_error_impl(&dword_1C4CFF000, v56, OS_LOG_TYPE_ERROR, "Failed to create temporary identity set for service %{public}@.", buf, 0xCu);
      if (!v31)
      {
LABEL_62:
        if (a5)
        {
LABEL_51:
          id v32 = v32;
          id v42 = 0;
          *a5 = v32;
          goto LABEL_64;
        }
        goto LABEL_63;
      }
    }
    else if (!v31)
    {
      goto LABEL_62;
    }
    CFRelease(v31);
    goto LABEL_62;
  }
  id v8 = v49;
LABEL_15:
  CFTypeRef cf = 0;
  uint64_t v37 = (void *)PCSIdentitySetCopyCurrentIdentityWithError();
  if (!v37)
  {
    objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v36, *MEMORY[0x1E4F19DD8], 5000, cf);
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    BOOL v48 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v64 = v26;
      _os_log_error_impl(&dword_1C4CFF000, v48, OS_LOG_TYPE_ERROR, "Failed to create CloudKitFeatures signature. No current identity for service %{public}@", buf, 0xCu);
    }
LABEL_48:
    if (v31) {
      CFRelease(v31);
    }
    if (a5) {
      goto LABEL_51;
    }
LABEL_63:
    id v42 = 0;
    goto LABEL_64;
  }
  uint64_t v58 = a5;
  uint64_t v38 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v39 = (os_log_t *)MEMORY[0x1E4F1A528];
  uint64_t v40 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v64 = v37;
    _os_log_debug_impl(&dword_1C4CFF000, v40, OS_LOG_TYPE_DEBUG, "Creating CloudKitFeatures signature with PCS identity: %@", buf, 0xCu);
  }
  id v59 = 0;
  id v42 = objc_msgSend_createSignatureWithIdentity_dataToBeSigned_forScope_error_(self, v41, (uint64_t)v37, v8, a4, &v59);
  id v43 = v59;
  id v32 = v43;
  if (!v42 || v43)
  {
    if (*v38 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    BOOL v44 = *v39;
    if (os_log_type_enabled(*v39, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v64 = v37;
      __int16 v65 = 2114;
      id v66 = v32;
      _os_log_debug_impl(&dword_1C4CFF000, v44, OS_LOG_TYPE_DEBUG, "Failed to create CloudKitFeatures signature with PCS identity %@. Error: %{public}@", buf, 0x16u);
      if (!v58) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
    if (v58) {
LABEL_26:
    }
      *uint64_t v58 = v32;
  }
LABEL_27:
  CFRelease(v37);
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (v31) {
    CFRelease(v31);
  }
LABEL_64:

  return v42;
}

- (id)publicKeyFromSignature:(id)a3 error:(id *)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v7 = (void *)PCSSignatureCopyKeyID();
  id v9 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v6, *MEMORY[0x1E4F19DD8], 5022, @"Signature does not contain a public key: %@.", v5);
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v10 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v5;
    _os_log_error_impl(&dword_1C4CFF000, v10, OS_LOG_TYPE_ERROR, "Signature does not contain a public key: %@.", buf, 0xCu);
  }
  if (v7)
  {
    CFRelease(v7);
    uint64_t v7 = 0;
  }
  if (a4) {
    *a4 = v9;
  }

  return v7;
}

- (BOOL)validateFullPublicKeySignature:(id)a3 forSignedData:(id)a4 error:(id *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  CFErrorRef cf = 0;
  char v9 = PCSValidateSignature();
  if (*MEMORY[0x1E4F1A4E0]
    && objc_msgSend__checkAndClearPCSTestOverrideForKey_(self, v8, @"FakeSignatureValidationError"))
  {
    CFErrorRef cf = CFErrorCreate(0, @"com.apple.protectedcloudstorage", 16, (CFDictionaryRef)&unk_1F20ABB00);
  }
  if (cf) {
    char v10 = 0;
  }
  else {
    char v10 = v9;
  }
  if ((v10 & 1) == 0)
  {
    id v12 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v8, *MEMORY[0x1E4F19DD8], 5004, v7);
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v13 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v7;
      __int16 v18 = 2114;
      uint64_t v19 = v12;
      _os_log_error_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_ERROR, "Failed to validate signature %@ using the embedded public key. Error: %{public}@", buf, 0x16u);
      if (!a5) {
        goto LABEL_19;
      }
    }
    else if (!a5)
    {
      goto LABEL_19;
    }
LABEL_18:
    *a5 = v12;
    goto LABEL_19;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v11 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v7;
    _os_log_debug_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_DEBUG, "Successfully validated signature %@ using the embedded public key.", buf, 0xCu);
  }
  id v12 = 0;
  if (a5) {
    goto LABEL_18;
  }
LABEL_19:
  if (cf) {
    CFRelease(cf);
  }

  return v9;
}

- (BOOL)validateSignature:(id)a3 forSignedData:(id)a4 usingIdentityType:(unint64_t)a5 error:(id *)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  CFTypeRef cf = 0;
  uint64_t v14 = objc_msgSend_identityManager(self, v12, v13);
  uint64_t v16 = objc_msgSend_PCSServiceStringFromCKServiceType_(v14, v15, a5);

  uint64_t v19 = objc_msgSend_identityManager(self, v17, v18);
  id v33 = 0;
  uint64_t v21 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(v19, v20, a5, 0, &v33);
  id v22 = v33;

  if (!v21 || v22)
  {
    if (!v22)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v23, *MEMORY[0x1E4F19DD8], 5000, @"Failed to validate signature %@. No identity set for service %@.", v10, v16);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v29 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v36 = v10;
      __int16 v37 = 2114;
      uint64_t v38 = v16;
      _os_log_error_impl(&dword_1C4CFF000, v29, OS_LOG_TYPE_ERROR, "Failed to validate signature %@. No identity set for service %{public}@.", buf, 0x16u);
      if (!v21)
      {
LABEL_26:
        char v27 = 0;
        BOOL v30 = 0;
        if (!a6) {
          goto LABEL_28;
        }
LABEL_27:
        id v22 = v22;
        *a6 = v22;
        BOOL v30 = v27;
        goto LABEL_28;
      }
    }
    else if (!v21)
    {
      goto LABEL_26;
    }
    CFRelease(v21);
    goto LABEL_26;
  }
  CFAllocatorRef v25 = (const void *)PCSValidateSignatureWithSet();
  if (*MEMORY[0x1E4F1A4E0]
    && objc_msgSend__checkAndClearPCSTestOverrideForKey_(self, v24, @"FakeSignatureValidationError"))
  {
    CFTypeRef cf = CFErrorCreate(0, @"com.apple.protectedcloudstorage", 16, (CFDictionaryRef)&unk_1F20ABB28);
  }
  if (v25) {
    BOOL v26 = cf == 0;
  }
  else {
    BOOL v26 = 0;
  }
  char v27 = v26;
  if (v26)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v28 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v36 = v10;
      __int16 v37 = 2114;
      uint64_t v38 = v16;
      _os_log_debug_impl(&dword_1C4CFF000, v28, OS_LOG_TYPE_DEBUG, "Successfully validated signature %@ with service %{public}@", buf, 0x16u);
    }
    id v22 = 0;
  }
  else
  {
    objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v24, *MEMORY[0x1E4F19DD8], 5004, v10, v16);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v32 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v36 = v10;
      __int16 v37 = 2114;
      uint64_t v38 = v16;
      _os_log_error_impl(&dword_1C4CFF000, v32, OS_LOG_TYPE_ERROR, "Failed to validate signature %@ with service %{public}@.", buf, 0x16u);
    }
  }
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (v25) {
    CFRelease(v25);
  }
  CFRelease(v21);
  BOOL v30 = v27;
  if (a6) {
    goto LABEL_27;
  }
LABEL_28:

  return v30;
}

- (void)_locked_createPCSFromData:(id)a3 ofType:(unint64_t)a4 usingPCSServiceType:(unint64_t)a5 tryDecryptingWithOtherServices:(BOOL)a6 withSyncKeyRegistryRetry:(BOOL)a7 lastModifiedDate:(id)a8 keySyncAnalytics:(id)a9 requestorOperationID:(id)a10 completionHandler:(id)a11
{
  uint64_t v192 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v118 = a8;
  id v119 = a9;
  id v121 = (__CFString *)a10;
  id v16 = a11;
  uint64_t v19 = objc_msgSend_synchronizeQueue(self, v17, v18);
  dispatch_assert_queue_V2(v19);

  uint64_t v180 = 0;
  v181 = &v180;
  uint64_t v182 = 0x2020000000;
  uint64_t v183 = 0;
  v179[0] = 0;
  v179[1] = v179;
  v179[2] = 0x2020000000;
  v179[3] = 0;
  uint64_t v175 = 0;
  v176 = &v175;
  uint64_t v177 = 0x2020000000;
  uint64_t v178 = 0;
  uint64_t v169 = 0;
  v170 = &v169;
  uint64_t v171 = 0x3032000000;
  v172 = sub_1C4DC743C;
  v173 = sub_1C4DC744C;
  id v174 = 0;
  v167[0] = 0;
  v167[1] = v167;
  v167[2] = 0x3032000000;
  v167[3] = sub_1C4DC743C;
  v167[4] = sub_1C4DC744C;
  id v168 = 0;
  v120 = (void *)PCSFPCreatePEMData();
  id v22 = objc_msgSend_identityManager(self, v20, v21);
  objc_msgSend_PCSServiceStringFromCKServiceType_(v22, v23, a5);
  id v122 = (__CFString *)objc_claimAutoreleasedReturnValue();

  char v27 = objc_msgSend__pcsObjectKindForCKDPCSBlobType_(self, v24, a4);
  if (!v15)
  {
    BOOL v44 = objc_msgSend_callbackQueue(self, v25, v26);
    id v43 = v166;
    v166[0] = MEMORY[0x1E4F143A8];
    v166[1] = 3221225472;
    v166[2] = sub_1C4DCEEA4;
    v166[3] = &unk_1E64F0A80;
    v166[4] = v16;
    dispatch_async(v44, v166);

LABEL_13:
    id v45 = 0;
    char v46 = v43[4];
    goto LABEL_48;
  }
  if (objc_msgSend_isPreviouslyUndecryptablePCS_(self, v25, (uint64_t)v15))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    BOOL v30 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C4CFF000, v30, OS_LOG_TYPE_ERROR, "A decrypt attempt on this exact PCS data has failed before and no useful identities have arrived since. Failing the decryption.", buf, 2u);
    }
    if (!*MEMORY[0x1E4F1A4E0]
      || (objc_msgSend_deviceContext(self, v31, v32),
          id v33 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend_testDeviceReference(v33, v34, v35),
          id v36 = objc_claimAutoreleasedReturnValue(),
          BOOL v37 = v36 == 0,
          v36,
          v33,
          v37))
    {
      if (a5 || (objc_msgSend_currentServiceIsManatee(self, v31, v32) & 1) == 0)
      {
        v111 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v31, v32);
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v111, v112, (uint64_t)a2, self, @"CKDPCSManager.m", 1602, @"We failed a prior decryption of this PCS data a with manatee identity when current identity is non-manatee. Did our identity change?");
      }
    }
    uint64_t v38 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v31, *MEMORY[0x1E4F19DD8], 5011, @"PCS data wasn't decrypted because a prior attempt failed after key sync.");
    uint64_t v39 = (void *)v170[5];
    v170[5] = v38;

    id v42 = objc_msgSend_callbackQueue(self, v40, v41);
    id v43 = block;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4DCEEC4;
    block[3] = &unk_1E64F07E0;
    void block[4] = v16;
    void block[5] = &v169;
    dispatch_async(v42, block);

    goto LABEL_13;
  }
  char v46 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v28, v29);
  if (!objc_msgSend_isAppleInternalInstall(v46, v47, v48))
  {
LABEL_25:

    goto LABEL_26;
  }
  int IsManatee = objc_msgSend_currentServiceIsManatee(self, v49, v50);

  if (IsManatee)
  {
    uint64_t v54 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v52, v53);
    char v46 = objc_msgSend_containerIdentifierToForceFatalManateeZoneDecryptionFailure(v54, v55, v56);

    if (objc_msgSend_length(v46, v57, v58))
    {
      id v61 = objc_msgSend_containerID(self, v59, v60);
      uint64_t v64 = objc_msgSend_containerIdentifier(v61, v62, v63);
      if (objc_msgSend_isEqualToString_(v46, v65, (uint64_t)v64))
      {

LABEL_20:
        uint64_t v69 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v67, *MEMORY[0x1E4F19DD8], 5011, @"Forcing a manatee decryption failure due to behavior option override");
        __int16 v70 = (void *)v170[5];
        v170[5] = v69;

        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v71 = *MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1C4CFF000, v71, OS_LOG_TYPE_ERROR, "Forcing a manatee decryption failure due to behavior option override.", buf, 2u);
        }
        objc_msgSend__locked_markMissingIdentitiesFromFailedDecryptError_serviceName_(self, v72, v181[3], v122);
        v75 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v73, v74);
        objc_msgSend_setLastMissingManateeIdentityErrorDateForCurrentService_(self, v76, (uint64_t)v75);

        objc_msgSend_markUndecryptablePCS_(self, v77, (uint64_t)v15);
        v80 = objc_msgSend_callbackQueue(self, v78, v79);
        v162[0] = MEMORY[0x1E4F143A8];
        v162[1] = 3221225472;
        v162[2] = sub_1C4DCEEF0;
        v162[3] = &unk_1E64F07E0;
        id v163 = v16;
        v164 = &v169;
        dispatch_async(v80, v162);

        id v45 = 0;
        goto LABEL_48;
      }
      int isEqualToString = objc_msgSend_isEqualToString_(v46, v66, @"*");

      if (isEqualToString) {
        goto LABEL_20;
      }
    }
    goto LABEL_25;
  }
LABEL_26:
  v81 = objc_msgSend_identityManager(self, v52, v53);
  int v82 = (id *)(v170 + 5);
  id obj = (id)v170[5];
  uint64_t v84 = objc_msgSend_copyIdentitySetWithType_options_error_(v81, v83, a5, 2, &obj);
  objc_storeStrong(v82, obj);
  v176[3] = v84;

  char v46 = dispatch_group_create();
  if (v170[5])
  {
    uint64_t v114 = 0;
    uint64_t v87 = 0;
  }
  else
  {
    if (v176[3])
    {
      v88 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v85, v86);
      int isAppleInternalInstall = objc_msgSend_isAppleInternalInstall(v88, v89, v90);

      if (isAppleInternalInstall)
      {
        uint64_t v114 = CKDescriptionForIdentitySet(v176[3]);
      }
      else
      {
        uint64_t v114 = 0;
      }
      if (a4 == 6)
      {
        id v94 = objc_alloc(MEMORY[0x1E4F93E78]);
        uint64_t v95 = v176[3];
        v96 = (id *)(v170 + 5);
        id v160 = (id)v170[5];
        v93 = objc_msgSend_initWithSharingRequestData_identitySet_error_(v94, v97, (uint64_t)v15, v95, &v160);
        objc_storeStrong(v96, v160);
        uint64_t v100 = (id *)(v170 + 5);
        uint64_t v99 = (void *)v170[5];
        if (!v93 || v99)
        {
          id v105 = v99;
          uint64_t v87 = 0;
          v181[3] = (uint64_t)v105;
        }
        else
        {
          id v159 = 0;
          uint64_t v87 = objc_msgSend_exportAcceptedSharingRequestWithError_(v93, v98, (uint64_t)&v159);
          objc_storeStrong(v100, v159);
        }
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v106 = *MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
        {
          uint64_t v108 = (void *)v176[3];
          uint64_t v109 = (__CFString *)v170[5];
          uint64_t v110 = @". Error: ";
          if (!v109)
          {
            uint64_t v110 = &stru_1F2044F30;
            uint64_t v109 = &stru_1F2044F30;
          }
          *(_DWORD *)buf = 138412802;
          id v187 = v108;
          __int16 v188 = 2114;
          v189 = v110;
          __int16 v190 = 2112;
          v191 = v109;
          _os_log_debug_impl(&dword_1C4CFF000, v106, OS_LOG_TYPE_DEBUG, "Attempted to decrypt and export sharing invitation token with identity set %@%{public}@%@", buf, 0x20u);
        }
      }
      else
      {
        dispatch_group_enter(v46);
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        BOOL v101 = *MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543874;
          id v187 = v15;
          __int16 v188 = 2114;
          v189 = v122;
          __int16 v190 = 2114;
          v191 = v121;
          _os_log_debug_impl(&dword_1C4CFF000, v101, OS_LOG_TYPE_DEBUG, "Starting to unwrap PCS data %{public}@ with identities for service %{public}@ operation %{public}@.", buf, 0x20u);
        }
        uint64_t v103 = *MEMORY[0x1E4F93EB8];
        v184[0] = *MEMORY[0x1E4F93EC8];
        v184[1] = v103;
        v185[0] = v27;
        v185[1] = MEMORY[0x1E4F1CC38];
        v104 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v102, (uint64_t)v185, v184, 2);
        uint64_t v145 = MEMORY[0x1E4F143A8];
        uint64_t v146 = 3221225472;
        long long v147 = sub_1C4DCEF1C;
        long long v148 = &unk_1E64F2A58;
        id v149 = v15;
        v155 = &v175;
        v150 = v122;
        v156 = v179;
        v157 = &v169;
        char v151 = v121;
        v152 = self;
        BOOL v158 = a6;
        v153 = v46;
        id v154 = v27;
        PCSObjectCreateFromExportedWithIdentitiesAndOptionsAsync();

        uint64_t v87 = 0;
        v93 = v149;
      }
    }
    else
    {
      uint64_t v92 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v85, *MEMORY[0x1E4F19DD8], 5000, @"Couldn't get a service identity set");
      uint64_t v114 = 0;
      uint64_t v87 = 0;
      v93 = (void *)v170[5];
      v170[5] = v92;
    }
  }
  queue = objc_msgSend_synchronizeQueue(self, v85, v86);
  v123[0] = MEMORY[0x1E4F143A8];
  v123[1] = 3221225472;
  v123[2] = sub_1C4DCF648;
  v123[3] = &unk_1E64F2B98;
  v135 = &v169;
  id v136 = v179;
  id v45 = v87;
  id v124 = v45;
  id v125 = v114;
  id v126 = v15;
  id v127 = self;
  long long v137 = v167;
  long long v138 = &v180;
  id v128 = v120;
  long long v139 = &v175;
  BOOL v143 = a7;
  id v129 = v27;
  uint64_t v130 = v122;
  uint64_t v131 = v121;
  SEL v140 = a2;
  unint64_t v141 = a5;
  id v134 = v16;
  unint64_t v142 = a4;
  BOOL v144 = a6;
  id v132 = v118;
  id v133 = v119;
  id v107 = v114;
  dispatch_group_notify(v46, queue, v123);

LABEL_48:
  _Block_object_dispose(v167, 8);

  _Block_object_dispose(&v169, 8);
  _Block_object_dispose(&v175, 8);
  _Block_object_dispose(v179, 8);
  _Block_object_dispose(&v180, 8);
}

- (BOOL)_checkUnitTestOverridesForDecryptionFailuresWithState:(BOOL)a3 error:(id *)a4
{
  if (*MEMORY[0x1E4F1A4E0])
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_17:
    if (!objc_msgSend__checkAndClearPCSTestOverrideForKey_(self, a2, @"ForceUserKeyRegistrySyncRetryOnDecryption"))return 1; {
    if (*MEMORY[0x1E4F1A550] != -1)
    }
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    char v9 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v19 = 0;
      id v11 = "Forcing user key sync retry for unit tests";
      id v12 = v19;
LABEL_25:
      _os_log_debug_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_DEBUG, v11, v12, 2u);
      if (!a4) {
        return 1;
      }
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  uint64_t v14 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, self, @"CKDPCSManager.m", 1847, @"Only suitable for testing");

  if (!a3) {
    goto LABEL_17;
  }
LABEL_3:
  if (objc_msgSend__checkAndClearPCSTestOverrideForKey_(self, a2, @"ForceMissingIdentitiesErrorOnDecryptionRetry"))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v8 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C4CFF000, v8, OS_LOG_TYPE_DEBUG, "Forcing CKUnderlyingErrorPCSNoPublicIdentity after user key sync due to unit tests", buf, 2u);
      if (!a4) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    if (a4)
    {
LABEL_8:
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v7, *MEMORY[0x1E4F19DD8], 5000, @"Failed to decrypt zone PCS because of unit tests");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_9:
  if (!objc_msgSend__checkAndClearPCSTestOverrideForKey_(self, v7, @"ForceDecryptFailedErrorOnDecryptionRetry"))return 1; {
  if (*MEMORY[0x1E4F1A550] != -1)
  }
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  char v9 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v17) = 0;
    id v11 = "Forcing CKUnderlyingErrorPCSDecryptFailed after user key sync due to unit tests";
    id v12 = (uint8_t *)&v17;
    goto LABEL_25;
  }
LABEL_21:
  if (a4)
  {
LABEL_22:
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v10, *MEMORY[0x1E4F19DD8], 5004, @"Failed to decrypt zone PCS because of unit tests", v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 1;
}

- (void)_createPCSFromData:(id)a3 ofType:(unint64_t)a4 usingPCSServiceType:(unint64_t)a5 tryDecryptingWithOtherServices:(BOOL)a6 withSyncKeyRegistryRetry:(BOOL)a7 lastModifiedDate:(id)a8 requestorOperationID:(id)a9 completionHandler:(id)a10
{
  id v16 = a3;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  id v22 = objc_msgSend_synchronizeQueue(self, v20, v21);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1C4DD0F8C;
  v27[3] = &unk_1E64F2BC0;
  v27[4] = self;
  id v28 = v16;
  unint64_t v32 = a4;
  unint64_t v33 = a5;
  BOOL v34 = a6;
  BOOL v35 = a7;
  id v29 = v17;
  id v30 = v18;
  id v31 = v19;
  id v23 = v19;
  id v24 = v18;
  id v25 = v17;
  id v26 = v16;
  dispatch_async(v22, v27);
}

- (void)createZonePCSFromData:(id)a3 usingServiceIdentityWithType:(unint64_t)a4 zonePCSModificationDate:(id)a5 requestorOperationID:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  id v18 = objc_msgSend_containerID(self, v16, v17);
  BOOL v21 = objc_msgSend_specialContainerType(v18, v19, v20) != 25;

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1C4DD10EC;
  v24[3] = &unk_1E64F2BE8;
  id v25 = v12;
  id v22 = v12;
  objc_msgSend__createPCSFromData_ofType_usingPCSServiceType_tryDecryptingWithOtherServices_withSyncKeyRegistryRetry_lastModifiedDate_requestorOperationID_completionHandler_(self, v23, (uint64_t)v15, 3, a4, v21, 1, v14, v13, v24);
}

- (void)createIngestedPPPCSDataFromInvitationData:(id)a3 shareModificationDate:(id)a4 requestorOperationID:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1C4DD125C;
  v13[3] = &unk_1E64F2BE8;
  id v14 = v10;
  id v11 = v10;
  objc_msgSend__createPCSFromData_ofType_usingPCSServiceType_tryDecryptingWithOtherServices_withSyncKeyRegistryRetry_lastModifiedDate_requestorOperationID_completionHandler_(self, v12, (uint64_t)a3, 6, 0, 0, 1, a4, a5, v13);
}

- (BOOL)availableIdentityForService:(unint64_t)a3 error:(id *)a4
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_1C4DC743C;
  id v15 = sub_1C4DC744C;
  id v16 = 0;
  id v7 = objc_msgSend_synchronizeQueue(self, a2, a3);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4DD1424;
  block[3] = &unk_1E64F2C10;
  void block[5] = &v11;
  void block[6] = a3;
  void block[4] = self;
  dispatch_sync(v7, block);

  if (a4) {
    *a4 = (id) v12[5];
  }
  BOOL v8 = v12[5] == 0;
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (void)createSharePCSFromData:(id)a3 ofType:(unint64_t)a4 withService:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = (void (**)(void, void, void))v11;
  uint64_t v41 = 0;
  id v42 = (id *)&v41;
  uint64_t v43 = 0x3032000000;
  BOOL v44 = sub_1C4DC743C;
  id v45 = sub_1C4DC744C;
  id v46 = 0;
  if (v10)
  {
    uint64_t v13 = (void *)PCSFPCreatePEMData();
    uint64_t v37 = 0;
    uint64_t v38 = &v37;
    uint64_t v39 = 0x2020000000;
    uint64_t v40 = 0;
    id v16 = objc_msgSend_identityManager(self, v14, v15);
    uint64_t v17 = v42;
    id obj = v42[5];
    uint64_t v19 = objc_msgSend_copyIdentitySetWithType_options_error_(v16, v18, a5, 2, &obj);
    objc_storeStrong(v17 + 5, obj);

    uint64_t v40 = v19;
    if (v38[3])
    {
      BOOL v21 = objc_msgSend__pcsObjectKindForCKDPCSBlobType_(self, v20, a4);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = sub_1C4DD18C8;
      v27[3] = &unk_1E64F2C60;
      unint64_t v33 = &v37;
      id v22 = v21;
      id v28 = v22;
      BOOL v34 = &v41;
      unint64_t v35 = a4;
      id v29 = v10;
      id v30 = self;
      id v31 = v13;
      unint64_t v32 = v12;
      objc_msgSend__onSynchronizeQueue_(self, v23, (uint64_t)v27);
    }
    else
    {
      id v24 = v42[5];
      if (!v24)
      {
        uint64_t v25 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v20, *MEMORY[0x1E4F19DD8], 5000, @"Couldn't get a service identity set");
        id v26 = v42[5];
        v42[5] = (id)v25;

        id v24 = v42[5];
      }
      ((void (**)(void, void, id))v12)[2](v12, 0, v24);
    }
    _Block_object_dispose(&v37, 8);
  }
  else
  {
    (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);
  }
  _Block_object_dispose(&v41, 8);
}

- (BOOL)decryptSharedZonePCSData:(id)a3 withInvitedPCS:(_OpaquePCSShareProtection *)a4 error:(id *)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (objc_msgSend_pcs(v8, v9, v10) && objc_msgSend_zoneishPCS(v8, v11, v12)) {
    goto LABEL_18;
  }
  if (objc_msgSend_pcs(v8, v11, v12))
  {
    uint64_t v15 = 0;
    goto LABEL_5;
  }
  uint64_t v15 = objc_msgSend_pcsData(v8, v13, v14);

  if (!v15
    || (objc_msgSend_pcsData(v8, v13, v14),
        uint64_t v25 = objc_claimAutoreleasedReturnValue(),
        id v46 = 0,
        uint64_t v15 = objc_msgSend_createPCSObjectFromData_ofType_sharedToPCS_error_(self, v26, (uint64_t)v25, 3, a4, &v46), v20 = v46, v25, v18 = 0, v15)&& !v20)
  {
LABEL_5:
    if (objc_msgSend_zoneishPCS(v8, v13, v14)
      || (objc_msgSend_zoneishPCSData(v8, v16, v17),
          char v27 = objc_claimAutoreleasedReturnValue(),
          v27,
          !v27))
    {
      id v18 = 0;
    }
    else
    {
      id v29 = objc_msgSend_zoneishPCSData(v8, v16, v28);
      id v45 = 0;
      id v18 = (const void *)objc_msgSend_createPCSObjectFromData_ofType_sharedToPCS_error_(self, v30, (uint64_t)v29, 1, v15, &v45);
      id v20 = v45;

      if (!v18 || v20) {
        goto LABEL_8;
      }
    }
    objc_msgSend_setPcs_(v8, v16, (uint64_t)v15);
    objc_msgSend_setZoneishPCS_(v8, v19, (uint64_t)v18);
    id v20 = 0;
  }
LABEL_8:
  if (v15) {
    CFRelease(v15);
  }
  if (v18) {
    CFRelease(v18);
  }
  if (v20)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    BOOL v21 = (void *)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      uint64_t v41 = v21;
      BOOL v44 = objc_msgSend_zoneID(v8, v42, v43);
      *(_DWORD *)buf = 138412546;
      uint64_t v48 = (uint64_t)v44;
      __int16 v49 = 2112;
      uint64_t v50 = (uint64_t)v20;
      _os_log_error_impl(&dword_1C4CFF000, v41, OS_LOG_TYPE_ERROR, "Error creating shared zone PCS using invited PCS for zone %@: %@", buf, 0x16u);

      if (a5) {
        goto LABEL_17;
      }
    }
    else if (a5)
    {
LABEL_17:
      id v20 = v20;
      BOOL v22 = 0;
      *a5 = v20;
      goto LABEL_23;
    }
    BOOL v22 = 0;
    goto LABEL_23;
  }
LABEL_18:
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v23 = (void *)*MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
  {
    id v31 = v23;
    uint64_t v34 = objc_msgSend_pcs(v8, v32, v33);
    uint64_t v37 = objc_msgSend_zoneishPCS(v8, v35, v36);
    uint64_t v40 = objc_msgSend_zoneID(v8, v38, v39);
    *(_DWORD *)buf = 138412802;
    uint64_t v48 = v34;
    __int16 v49 = 2112;
    uint64_t v50 = v37;
    __int16 v51 = 2112;
    uint64_t v52 = v40;
    _os_log_debug_impl(&dword_1C4CFF000, v31, OS_LOG_TYPE_DEBUG, "Created shared zone PCS: %@ and zoneish PCS: %@ for zone %@", buf, 0x20u);
  }
  id v20 = 0;
  BOOL v22 = 1;
LABEL_23:

  return v22;
}

- (id)etagFromZonePCS:(_OpaquePCSShareProtection *)a3 error:(id *)a4
{
  id v4 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v11 = 0;
    id v6 = objc_msgSend_dataFromZonePCS_error_(self, a2, (uint64_t)a3, &v11);
    id v8 = v11;
    if (v6)
    {
      id v4 = objc_msgSend_etagFromPCSData_(CKDPCSManager, v7, (uint64_t)v6);
      if (!a4)
      {
LABEL_5:

        goto LABEL_6;
      }
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v10 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v13 = v4;
        __int16 v14 = 2112;
        id v15 = v8;
        _os_log_error_impl(&dword_1C4CFF000, v10, OS_LOG_TYPE_ERROR, "Couldn't create data from zone PCS %@: %@", buf, 0x16u);
      }
      id v4 = 0;
      if (!a4) {
        goto LABEL_5;
      }
    }
    *a4 = v8;
    goto LABEL_5;
  }
LABEL_6:
  return v4;
}

- (BOOL)zonePCSNeedsKeyRolled:(_OpaquePCSShareProtection *)a3
{
  return objc_msgSend_zonePCSNeedsKeyRolled_isZoneishZone_bypassAllowlistedContainers_(self, a2, (uint64_t)a3, 0, 0);
}

- (BOOL)zonePCSNeedsKeyRolled:(_OpaquePCSShareProtection *)a3 isZoneishZone:(BOOL)a4 bypassAllowlistedContainers:(BOOL)a5
{
  BOOL v6 = a4;
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  char v9 = objc_msgSend_deviceContext(self, a2, (uint64_t)a3);
  if ((objc_msgSend_forceEnableReadOnlyManatee(self, v10, v11) & 1) == 0)
  {
    __int16 v14 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v12, v13);
    char v17 = objc_msgSend_rollZonePCSIdentities(v14, v15, v16);

    id v20 = (void *)MEMORY[0x1E4F1A550];
    BOOL v21 = (os_log_t *)MEMORY[0x1E4F1A528];
    if (v17)
    {
      uint64_t v83 = a3;
      char IsManatee = objc_msgSend_currentServiceIsManatee(self, v18, v19);
      uint64_t v84 = v9;
      uint64_t v25 = objc_msgSend_accountDataSecurityObserver(v9, v23, v24);
      uint64_t v28 = objc_msgSend_account(self, v26, v27);
      int v30 = objc_msgSend_isWalrusEnabledForAccount_allowBlockingFetch_(v25, v29, (uint64_t)v28, 1);

      if (*v20 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      char v31 = IsManatee | v30;
      unint64_t v32 = *v21;
      if (os_log_type_enabled(*v21, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v74 = @"is not";
        if (v30) {
          uint64_t v74 = @"is";
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v87 = (uint64_t)v74;
        _os_log_debug_impl(&dword_1C4CFF000, v32, OS_LOG_TYPE_DEBUG, "Walrus %@ enabled", buf, 0xCu);
        if (v31) {
          goto LABEL_7;
        }
      }
      else if (v31)
      {
LABEL_7:
        if (a5)
        {
          char v35 = 1;
        }
        else
        {
          uint64_t v39 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v33, v34);
          id v42 = v39;
          if (v6) {
            int v43 = objc_msgSend_allowZoneAndRecordKeyRollingInZoneishPCSZonesForAllContainers(v39, v40, v41);
          }
          else {
            int v43 = objc_msgSend_allowZoneKeyRollingInPerRecordPCSZonesForAllContainers(v39, v40, v41);
          }
          int v44 = v43;

          if ((v44 & v30) == 1 && (objc_msgSend_currentServiceIsManatee(self, v33, v34) & 1) == 0)
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            os_log_t v67 = *v21;
            char v35 = 1;
            if (os_log_type_enabled(*v21, OS_LOG_TYPE_INFO))
            {
              uint64_t v68 = v67;
              uint64_t v71 = objc_msgSend_containerID(self, v69, v70);
              uint64_t v72 = (void *)v71;
              v73 = @"NO";
              if (v6) {
                v73 = @"YES";
              }
              *(_DWORD *)buf = 138412546;
              uint64_t v87 = v71;
              __int16 v88 = 2112;
              uint64_t v89 = v73;
              _os_log_impl(&dword_1C4CFF000, v68, OS_LOG_TYPE_INFO, "Bypassing zone key rolling container allow-list restriction due to walrus enabled, non manatee, and behavior option for container %@, isZoneishZone:%@", buf, 0x16u);
            }
          }
          else
          {
            char v35 = 0;
          }
        }
        if (*MEMORY[0x1E4F1A4E0])
        {
          id v45 = objc_msgSend_containerID(self, v33, v34);
          unsigned __int8 isKeyRollingUnitTestContainerID = objc_msgSend__isKeyRollingUnitTestContainerID_(self, v46, (uint64_t)v45);
        }
        else
        {
          unsigned __int8 isKeyRollingUnitTestContainerID = 0;
        }
        uint64_t v48 = objc_msgSend_containerID(self, v33, v34);
        if (objc_msgSend__isAllowlistedKeyRollingContainerID_(self, v49, (uint64_t)v48))
        {

          goto LABEL_27;
        }

        if ((v35 | isKeyRollingUnitTestContainerID))
        {
LABEL_27:
          uint64_t v52 = objc_msgSend_accountDataSecurityObserver(v84, v50, v51);
          id v55 = objc_msgSend_account(self, v53, v54);
          id v85 = 0;
          char isSecondaryAccount_error = objc_msgSend_isManateeAvailableForAccount_isSecondaryAccount_error_(v52, v56, (uint64_t)v55, 0, &v85);
          uint64_t v58 = (__CFString *)v85;

          if (isSecondaryAccount_error)
          {
            if (v83)
            {
              char v37 = PCSFPShouldRoll();
LABEL_38:
              char v9 = v84;

              goto LABEL_14;
            }
          }
          else
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            id v59 = *v21;
            if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
            {
              uint64_t v60 = @"Last CoreCDP error was ";
              id v61 = &stru_1F2044F30;
              if (v58) {
                id v61 = v58;
              }
              else {
                uint64_t v60 = &stru_1F2044F30;
              }
              *(_DWORD *)buf = 138543618;
              uint64_t v87 = (uint64_t)v60;
              __int16 v88 = 2112;
              uint64_t v89 = v61;
              _os_log_impl(&dword_1C4CFF000, v59, OS_LOG_TYPE_INFO, "Not checking PCS shouldRoll hint because manatee isn't available. %{public}@%@", buf, 0x16u);
            }
          }
          char v37 = 0;
          goto LABEL_38;
        }
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        id v62 = *v21;
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          uint64_t v63 = v62;
          id v66 = objc_msgSend_containerID(self, v64, v65);
          *(_DWORD *)buf = 138412290;
          uint64_t v87 = (uint64_t)v66;
          _os_log_impl(&dword_1C4CFF000, v63, OS_LOG_TYPE_INFO, "Not checking PCS shouldRoll hint because we're not allowed to in container %@", buf, 0xCu);
        }
LABEL_56:
        char v37 = 0;
        char v9 = v84;
        goto LABEL_14;
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v75 = *v21;
      if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
      {
        uint64_t v76 = v75;
        uint64_t v79 = objc_msgSend_identityManager(self, v77, v78);
        int v82 = objc_msgSend_serviceName(v79, v80, v81);
        *(_DWORD *)buf = 138543362;
        uint64_t v87 = (uint64_t)v82;
        _os_log_impl(&dword_1C4CFF000, v76, OS_LOG_TYPE_INFO, "Not checking PCS shouldRoll hint because we're using a non-manatee service identity: %{public}@", buf, 0xCu);
      }
      goto LABEL_56;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v36 = *v21;
    if (os_log_type_enabled(*v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C4CFF000, v36, OS_LOG_TYPE_INFO, "Not checking PCS shouldRoll hint because we're asked not to!", buf, 2u);
    }
  }
  char v37 = 0;
LABEL_14:

  return v37;
}

- (BOOL)zonePCSNeedsUpdate:(_OpaquePCSShareProtection *)a3
{
  if (!a3) {
    return 0;
  }
  if (objc_msgSend_forceEnableReadOnlyManatee(self, a2, (uint64_t)a3)) {
    return 0;
  }
  return PCSFPSupportFeature() ^ 1;
}

- (BOOL)isRemindersZoneThatNeedsUpdate:(_OpaquePCSShareProtection *)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = objc_msgSend_containerID(self, a2, (uint64_t)a3);
  uint64_t v7 = objc_msgSend_specialContainerType(v4, v5, v6);

  if (v7 != 25) {
    return 0;
  }
  id v8 = (void *)PCSFPCopyPublicIdentities();
  if (objc_msgSend_count(v8, v9, v10) == 1)
  {
    uint64_t v13 = objc_msgSend_firstObject(v8, v11, v12);
    id v14 = (id)PCSPublicIdentityGetPublicID();
  }
  else
  {
    id v14 = 0;
  }
  uint64_t v16 = objc_msgSend_identityManager(self, v11, v12);
  char v18 = objc_msgSend_liverpoolServiceOwnsPublicID_(v16, v17, (uint64_t)v14);

  return v18;
}

- (id)updateServiceIdentityOnZonePCS:(_OpaquePCSShareProtection *)a3
{
  return (id)objc_msgSend_addIdentityForService_toPCS_(self, a2, 0, a3);
}

- (id)rollMasterKeyForRecordPCS:(_OpaquePCSShareProtection *)a3 forOperation:(id)a4
{
  return (id)objc_msgSend_rollMasterKeyForRecordPCS_isZoneishRecord_bypassAllowlistedContainers_forOperation_(self, a2, (uint64_t)a3, 0, 0, a4);
}

- (id)rollMasterKeyForRecordPCS:(_OpaquePCSShareProtection *)a3 isZoneishRecord:(BOOL)a4 bypassAllowlistedContainers:(BOOL)a5 forOperation:(id)a6
{
  BOOL v7 = a4;
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  uint64_t v13 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v11, v12);
  char v16 = objc_msgSend_rollRecordPCSMasterKeys(v13, v14, v15);

  if ((v16 & 1) == 0)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v26 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C4CFF000, v26, OS_LOG_TYPE_INFO, "Aborting master key roll because of behavior option override", buf, 2u);
    }
    goto LABEL_13;
  }
  int v19 = 1;
  if (v7) {
    uint64_t v20 = 2;
  }
  else {
    uint64_t v20 = 1;
  }
  if (!a5)
  {
    BOOL v21 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v17, v18);
    uint64_t v24 = v21;
    if (v7)
    {
      int v25 = objc_msgSend_allowZoneAndRecordKeyRollingInZoneishPCSZonesForAllContainers(v21, v22, v23);

      if (!v25) {
        goto LABEL_19;
      }
    }
    else
    {
      char v28 = objc_msgSend_allowRecordKeyRollingInPerRecordPCSZonesForAllContainers(v21, v22, v23);

      if ((v28 & 1) == 0) {
        goto LABEL_19;
      }
    }
    id v29 = objc_msgSend_deviceContext(self, v17, v18);
    unint64_t v32 = objc_msgSend_accountDataSecurityObserver(v29, v30, v31);
    char v35 = objc_msgSend_account(self, v33, v34);
    if (objc_msgSend_isWalrusEnabledForAccount_allowBlockingFetch_(v32, v36, (uint64_t)v35, 1))
    {
      char IsManatee = objc_msgSend_currentServiceIsManatee(self, v37, v38);

      if (IsManatee)
      {
        int v19 = 0;
      }
      else
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v75 = (void *)*MEMORY[0x1E4F1A528];
        int v19 = 1;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
        {
          uint64_t v76 = v75;
          uint64_t v79 = objc_msgSend_containerID(self, v77, v78);
          v80 = (void *)v79;
          uint64_t v81 = @"NO";
          if (v7) {
            uint64_t v81 = @"YES";
          }
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v79;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v81;
          _os_log_impl(&dword_1C4CFF000, v76, OS_LOG_TYPE_INFO, "Bypassing record master key rolling container allow-list restriction due to walrus enabled, non manatee, and behavior option for container %@, isZoneishRecord:%@", buf, 0x16u);

          int v19 = 1;
        }
      }
      goto LABEL_20;
    }

LABEL_19:
    int v19 = 0;
  }
LABEL_20:
  if (*MEMORY[0x1E4F1A4E0])
  {
    uint64_t v40 = objc_msgSend_containerID(self, v17, v18);
    int isKeyRollingUnitTestContainerID = objc_msgSend__isKeyRollingUnitTestContainerID_(self, v41, (uint64_t)v40);
  }
  else
  {
    int isKeyRollingUnitTestContainerID = 0;
  }
  int v43 = objc_msgSend_containerID(self, v17, v18);
  if (objc_msgSend__isAllowlistedKeyRollingContainerID_(self, v44, (uint64_t)v43))
  {

    goto LABEL_26;
  }

  if (((v19 | isKeyRollingUnitTestContainerID) & 1) == 0)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v63 = (void *)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      uint64_t v64 = v63;
      os_log_t v67 = objc_msgSend_containerID(self, v65, v66);
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v67;
      _os_log_impl(&dword_1C4CFF000, v64, OS_LOG_TYPE_INFO, "Aborting master key roll because container %@ is not on the allowlist", buf, 0xCu);
    }
LABEL_13:
    uint64_t v27 = 0;
    goto LABEL_62;
  }
LABEL_26:
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  uint64_t v97 = 0;
  uint64_t v88 = 0;
  uint64_t v89 = &v88;
  uint64_t v90 = 0x2020000000;
  char v91 = 0;
  if (!a3)
  {
    uint64_t v60 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v61 = objc_msgSend_keyrollingErrorCodeForPCSOfType_(self, v45, v20);
    uint64_t v27 = objc_msgSend_errorWithDomain_code_format_(v60, v62, *MEMORY[0x1E4F19DD8], v61, @"Cannot roll master key for a nil record PCS");
    uint64_t v51 = 0;
    goto LABEL_41;
  }
  uint64_t v47 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v45, v46);
  unint64_t v50 = objc_msgSend_maxRecordPCSMasterKeyRolls(v47, v48, v49);

  uint64_t v51 = (void *)PCSFPCopyAvailableMasterKeyIDs();
  if (objc_msgSend_count(v51, v52, v53) <= v50)
  {
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = sub_1C4DD31E4;
    v87[3] = &unk_1E64F2990;
    v87[4] = &v88;
    v87[5] = buf;
    v87[6] = a3;
    objc_msgSend__onSynchronizeQueue_(self, v54, (uint64_t)v87);
    if (*((unsigned char *)v89 + 24) && !*(void *)(*(void *)&buf[8] + 24))
    {
      if (*MEMORY[0x1E4F1A550] == -1)
      {
LABEL_57:
        int v82 = *MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)uint64_t v92 = 138412290;
          v93 = a3;
          _os_log_debug_impl(&dword_1C4CFF000, v82, OS_LOG_TYPE_DEBUG, "Rolled master key for record PCS %@", v92, 0xCu);
        }
        v85[0] = MEMORY[0x1E4F143A8];
        v85[1] = 3221225472;
        v85[2] = sub_1C4DD3228;
        v85[3] = &unk_1E64F2C80;
        BOOL v86 = v7;
        objc_msgSend_updateCloudKitMetrics_(v10, v83, (uint64_t)v85);
        goto LABEL_60;
      }
      v73 = (void *)*MEMORY[0x1E4F1A548];
LABEL_66:
      dispatch_once(MEMORY[0x1E4F1A550], v73);
      goto LABEL_57;
    }
    uint64_t v69 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v70 = objc_msgSend_keyrollingErrorCodeForPCSOfType_(self, v68, v20);
    uint64_t v27 = objc_msgSend_errorWithDomain_code_error_format_(v69, v71, *MEMORY[0x1E4F19DD8], v70, *(void *)(*(void *)&buf[8] + 24), @"Couldn't roll master key for record PCS");
LABEL_41:
    uint64_t v72 = *(const void **)(*(void *)&buf[8] + 24);
    if (v72)
    {
      CFRelease(v72);
      *(void *)(*(void *)&buf[8] + 24) = 0;
    }
    v73 = (void *)*MEMORY[0x1E4F1A548];
    if (v27)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v73);
      }
      uint64_t v74 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v92 = 138412546;
        v93 = a3;
        __int16 v94 = 2112;
        uint64_t v95 = (uint64_t)v27;
        _os_log_error_impl(&dword_1C4CFF000, v74, OS_LOG_TYPE_ERROR, "Couldn't roll master key for record PCS %@: %@", v92, 0x16u);
      }
      goto LABEL_61;
    }
    if (*MEMORY[0x1E4F1A550] == -1) {
      goto LABEL_57;
    }
    goto LABEL_66;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v55 = (id)*MEMORY[0x1E4F1A528];
  if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
  {
    uint64_t v58 = objc_msgSend_count(v51, v56, v57);
    *(_DWORD *)uint64_t v92 = 134218240;
    v93 = (_OpaquePCSShareProtection *)v50;
    __int16 v94 = 2048;
    uint64_t v95 = v58;
    _os_log_impl(&dword_1C4CFF000, v55, OS_LOG_TYPE_INFO, "Aborting master key roll due to cap of %lu rolls. Current number of keys: %lu", v92, 0x16u);
  }

  objc_msgSend_updateCloudKitMetrics_(v10, v59, (uint64_t)&unk_1F2043090);
LABEL_60:
  uint64_t v27 = 0;
LABEL_61:
  _Block_object_dispose(&v88, 8);
  _Block_object_dispose(buf, 8);

LABEL_62:
  return v27;
}

- (id)counterSignRecordPCS:(_OpaquePCSShareProtection *)a3 zonePCS:(_OpaquePCSShareProtection *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_currentServiceIsManatee(self, a2, (uint64_t)a3))
  {
    if (a3 && a4)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x2020000000;
      char v28 = 0;
      if (dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CKMarkForCounterSigning"))
      {
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = sub_1C4DD361C;
        v26[3] = &unk_1E64F2918;
        v26[4] = buf;
        v26[5] = a3;
        v26[6] = a4;
        objc_msgSend__onSynchronizeQueue_(self, v7, (uint64_t)v26);
        if (!*(unsigned char *)(*(void *)&buf[8] + 24))
        {
          char v9 = (void *)MEMORY[0x1E4F1A280];
          uint64_t v10 = objc_msgSend_keyrollingErrorCodeForPCSOfType_(self, v8, 1);
          uint64_t v12 = objc_msgSend_errorWithDomain_code_error_format_(v9, v11, *MEMORY[0x1E4F19DD8], v10, 0, @"Couldn't counter-sign record PCS");
LABEL_22:
          _Block_object_dispose(buf, 8);
          goto LABEL_23;
        }
      }
      else
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        char v16 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)int v25 = 0;
          _os_log_impl(&dword_1C4CFF000, v16, OS_LOG_TYPE_INFO, "CKMarkForCounterSigning is not defined. Skipping counterSignRecordPCS", v25, 2u);
        }
      }
      uint64_t v12 = 0;
      goto LABEL_22;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v14 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = a3;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = a4;
      _os_log_error_impl(&dword_1C4CFF000, v14, OS_LOG_TYPE_ERROR, "Didn't get decrypted record PCS and zone PCS. Record PCS: %@, Zone PCS: %@", buf, 0x16u);
    }
    uint64_t v12 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v15, *MEMORY[0x1E4F19DD8], 5005, @"Couldn't counter-sign record PCS due to missing record or zone PCS");
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v13 = (void *)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = v13;
      BOOL v21 = objc_msgSend_identityManager(self, v19, v20);
      uint64_t v24 = objc_msgSend_serviceName(v21, v22, v23);
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v24;
      _os_log_debug_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_DEBUG, "Not counter-signing record PCS because current service %{public}@ is not manatee", buf, 0xCu);
    }
    uint64_t v12 = 0;
  }
LABEL_23:
  return v12;
}

- (id)updateZoneIdentityForRecordPCS:(_OpaquePCSShareProtection *)a3 usingZonePCS:(_OpaquePCSShareProtection *)a4 isZoneishRecord:(BOOL)a5 bypassAllowlistedContainers:(BOOL)a6
{
  BOOL v7 = a5;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], a2, (uint64_t)a3);
  char v14 = objc_msgSend_rollRecordPCSMasterKeys(v11, v12, v13);

  if ((v14 & 1) == 0)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v18 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_INFO, "Not updating zone PCS identity for record PCS because we're asked not to!", buf, 2u);
    }
    goto LABEL_8;
  }
  if (a6) {
    goto LABEL_3;
  }
  uint64_t v20 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v15, v16);
  uint64_t v23 = v20;
  if (v7)
  {
    int v17 = objc_msgSend_allowZoneAndRecordKeyRollingInZoneishPCSZonesForAllContainers(v20, v21, v22);

    if (!v17) {
      goto LABEL_23;
    }
  }
  else
  {
    char v24 = objc_msgSend_allowRecordKeyRollingInPerRecordPCSZonesForAllContainers(v20, v21, v22);

    if ((v24 & 1) == 0) {
      goto LABEL_22;
    }
  }
  int v25 = objc_msgSend_deviceContext(self, v15, v16);
  char v28 = objc_msgSend_accountDataSecurityObserver(v25, v26, v27);
  uint64_t v31 = objc_msgSend_account(self, v29, v30);
  if ((objc_msgSend_isWalrusEnabledForAccount_allowBlockingFetch_(v28, v32, (uint64_t)v31, 1) & 1) == 0)
  {

    goto LABEL_22;
  }
  char IsManatee = objc_msgSend_currentServiceIsManatee(self, v33, v34);

  if (IsManatee)
  {
LABEL_22:
    int v17 = 0;
    goto LABEL_23;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v36 = (void *)*MEMORY[0x1E4F1A528];
  int v17 = 1;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
  {
    char v37 = v36;
    uint64_t v40 = objc_msgSend_containerID(self, v38, v39);
    uint64_t v41 = (void *)v40;
    id v42 = @"NO";
    if (v7) {
      id v42 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v40;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v42;
    _os_log_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_INFO, "Bypassing updating record sharee (zone key) container allow-list restriction due to walrus enabled, non-manatee and behavior option for container %@, isZoneishRecord: %@", buf, 0x16u);

LABEL_3:
    int v17 = 1;
  }
LABEL_23:
  if (*MEMORY[0x1E4F1A4E0])
  {
    int v43 = objc_msgSend_containerID(self, v15, v16);
    int isKeyRollingUnitTestContainerID = objc_msgSend__isKeyRollingUnitTestContainerID_(self, v44, (uint64_t)v43);
  }
  else
  {
    int isKeyRollingUnitTestContainerID = 0;
  }
  uint64_t v46 = objc_msgSend_containerID(self, v15, v16);
  if (objc_msgSend__isAllowlistedKeyRollingContainerID_(self, v47, (uint64_t)v46))
  {

    goto LABEL_29;
  }

  if (((v17 | isKeyRollingUnitTestContainerID) & 1) == 0)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v53 = (void *)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      uint64_t v54 = v53;
      uint64_t v57 = objc_msgSend_containerID(self, v55, v56);
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v57;
      _os_log_impl(&dword_1C4CFF000, v54, OS_LOG_TYPE_INFO, "Not updating zone PCS identity because container %@ is not on the allowlist", buf, 0xCu);
    }
LABEL_8:
    int v19 = 0;
    goto LABEL_52;
  }
LABEL_29:
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  uint64_t v74 = 0;
  uint64_t v63 = 0;
  uint64_t v64 = &v63;
  uint64_t v65 = 0x2020000000;
  char v66 = 0;
  if (!a4)
  {
    uint64_t v52 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v48, *MEMORY[0x1E4F19DD8], 5005, @"Cannot roll key for a nil zone PCS");
    goto LABEL_40;
  }
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = sub_1C4DD3DF4;
  v62[3] = &unk_1E64F2CA8;
  v62[6] = a3;
  v62[7] = a4;
  v62[4] = &v63;
  v62[5] = buf;
  objc_msgSend__onSynchronizeQueue_(self, v48, (uint64_t)v62);
  uint64_t v50 = *(void *)(*(void *)&buf[8] + 24);
  if (!*((unsigned char *)v64 + 24) || v50)
  {
    uint64_t v52 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v49, *MEMORY[0x1E4F19DD8], 5005, v50, @"Couldn't update zone identity on PCS");
LABEL_40:
    int v19 = (void *)v52;
    uint64_t v58 = *(const void **)(*(void *)&buf[8] + 24);
    if (v58)
    {
      CFRelease(v58);
      *(void *)(*(void *)&buf[8] + 24) = 0;
    }
    uint64_t v51 = (void *)*MEMORY[0x1E4F1A548];
    if (v19)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v51);
      }
      id v59 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)os_log_t v67 = 138412802;
        uint64_t v68 = a3;
        __int16 v69 = 2112;
        uint64_t v70 = a4;
        __int16 v71 = 2112;
        uint64_t v72 = v19;
        _os_log_error_impl(&dword_1C4CFF000, v59, OS_LOG_TYPE_ERROR, "Couldn't update zone identity on pcs %@ using zone PCS %@: %@", v67, 0x20u);
      }
      goto LABEL_51;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      goto LABEL_55;
    }
    goto LABEL_48;
  }
  if (*MEMORY[0x1E4F1A550] != -1)
  {
    uint64_t v51 = (void *)*MEMORY[0x1E4F1A548];
LABEL_55:
    dispatch_once(MEMORY[0x1E4F1A550], v51);
  }
LABEL_48:
  uint64_t v60 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)os_log_t v67 = 138412546;
    uint64_t v68 = a3;
    __int16 v69 = 2112;
    uint64_t v70 = a4;
    _os_log_debug_impl(&dword_1C4CFF000, v60, OS_LOG_TYPE_DEBUG, "Updated zone identity on pcs %@ with zone PCS %@", v67, 0x16u);
  }
  int v19 = 0;
LABEL_51:
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(buf, 8);
LABEL_52:
  return v19;
}

- (BOOL)isPreviouslyUndecryptablePCS:(id)a3
{
  id v4 = a3;
  BOOL v7 = objc_msgSend_synchronizeQueue(self, v5, v6);
  dispatch_assert_queue_V2(v7);

  if (objc_msgSend_length(v4, v8, v9))
  {
    char v14 = objc_msgSend_CKSHA256(v4, v10, v11);
    if (v14)
    {
      uint64_t v15 = objc_msgSend_undecryptablePCSDataHashes(self, v12, v13);
      char v17 = objc_msgSend_containsObject_(v15, v16, (uint64_t)v14);
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (void)markUndecryptablePCS:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v7 = objc_msgSend_synchronizeQueue(self, v5, v6);
  dispatch_assert_queue_V2(v7);

  if (objc_msgSend_length(v4, v8, v9))
  {
    uint64_t v12 = objc_msgSend_CKSHA256(v4, v10, v11);
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v13 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      int v18 = 138543362;
      int v19 = v12;
      _os_log_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_INFO, "PCS data with hash %{public}@ is undecryptable. Recording this so we fail early on future attempts.", (uint8_t *)&v18, 0xCu);
    }
    if (v12)
    {
      uint64_t v16 = objc_msgSend_undecryptablePCSDataHashes(self, v14, v15);
      objc_msgSend_addObject_(v16, v17, (uint64_t)v12);
    }
  }
}

- (id)removePrivateKeysForKeyIDs:(id)a3 fromPCS:(_OpaquePCSShareProtection *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = a3;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v21, v33, 16);
  if (v9)
  {
    uint64_t v10 = *(void *)v22;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v22 != v10) {
        objc_enumerationMutation(v6);
      }
      uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * v11);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = sub_1C4DD4360;
      v20[3] = &unk_1E64F2CD0;
      v20[5] = &v25;
      v20[6] = a4;
      v20[4] = v12;
      objc_msgSend__onSynchronizeQueue_(self, v8, (uint64_t)v20);
      if (!*((unsigned char *)v26 + 24)) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v21, v33, 16);
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v8, *MEMORY[0x1E4F19DD8], 5005, @"Failed to clean up the share PCS");
    uint64_t v13 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();

    if (!v13) {
      goto LABEL_15;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    char v14 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v30 = a4;
      __int16 v31 = 2112;
      unint64_t v32 = v13;
      _os_log_error_impl(&dword_1C4CFF000, v14, OS_LOG_TYPE_ERROR, "Failed to clean up share pcs %@: %@", buf, 0x16u);
    }
  }
  else
  {
LABEL_9:

LABEL_15:
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v15 = (id)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = objc_msgSend_count(v6, v16, v17);
      *(_DWORD *)buf = 134218242;
      uint64_t v30 = (_OpaquePCSShareProtection *)v18;
      __int16 v31 = 2112;
      unint64_t v32 = a4;
      _os_log_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_INFO, "Cleaned up %lu private keys from pcs %@", buf, 0x16u);
    }

    uint64_t v13 = 0;
  }
  _Block_object_dispose(&v25, 8);

  return v13;
}

- (int64_t)keyrollingErrorCodeForPCSOfType:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    return 5020;
  }
  else {
    return qword_1C5080540[a3 - 1];
  }
}

- (id)rollIdentityForSharePCS:(_OpaquePCSShareProtection *)a3 ofType:(unint64_t)a4 removeAllExistingPrivateKeys:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  uint64_t v11 = (void *)PCSFPCopyKeyIDs();
  uint64_t v13 = (const void *)PCSFPCreatePrivateKey();
  if (v13)
  {
    if (v7)
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v14 = v11;
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v34, v46, 16);
      if (v17)
      {
        unint64_t v32 = v13;
        uint64_t v18 = *(void *)v35;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v35 != v18) {
              objc_enumerationMutation(v14);
            }
            uint64_t v20 = *(void *)(*((void *)&v34 + 1) + 8 * i);
            v33[0] = MEMORY[0x1E4F143A8];
            v33[1] = 3221225472;
            v33[2] = sub_1C4DD4784;
            v33[3] = &unk_1E64F2CD0;
            v33[5] = &v38;
            v33[6] = a3;
            v33[4] = v20;
            objc_msgSend__onSynchronizeQueue_(self, v16, (uint64_t)v33);
            if (!*((unsigned char *)v39 + 24))
            {
              uint64_t v25 = (void *)MEMORY[0x1E4F1A280];
              uint64_t v26 = objc_msgSend_keyrollingErrorCodeForPCSOfType_(self, v16, a4);
              uint64_t v13 = v32;
              long long v21 = objc_msgSend_errorWithDomain_code_format_(v25, v27, *MEMORY[0x1E4F19DD8], v26, @"Failed to clean up the share PCS when creating a new private key");
              goto LABEL_16;
            }
          }
          uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v16, (uint64_t)&v34, v46, 16);
          if (v17) {
            continue;
          }
          break;
        }
        long long v21 = 0;
        uint64_t v13 = v32;
      }
      else
      {
        long long v21 = 0;
      }
LABEL_16:
    }
    else
    {
      long long v21 = 0;
    }
    CFRelease(v13);
  }
  else
  {
    long long v22 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v23 = objc_msgSend_keyrollingErrorCodeForPCSOfType_(self, v12, a4);
    long long v21 = objc_msgSend_errorWithDomain_code_format_(v22, v24, *MEMORY[0x1E4F19DD8], v23, @"Failed to create a new private key for share PCS");
  }
  char v28 = (void *)*MEMORY[0x1E4F1A548];
  if (v21)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v28);
    }
    uint64_t v29 = *MEMORY[0x1E4F1A528];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      if (!a6) {
        goto LABEL_28;
      }
      goto LABEL_23;
    }
    *(_DWORD *)buf = 138412546;
    int v43 = a3;
    __int16 v44 = 2112;
    id v45 = v21;
    _os_log_error_impl(&dword_1C4CFF000, v29, OS_LOG_TYPE_ERROR, "Failed to roll the identity for share pcs %@: %@", buf, 0x16u);
    if (a6) {
LABEL_23:
    }
      *a6 = v21;
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v28);
    }
    uint64_t v30 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      int v43 = a3;
      _os_log_impl(&dword_1C4CFF000, v30, OS_LOG_TYPE_INFO, "Rolled the identity for share pcs %@", buf, 0xCu);
    }
  }
LABEL_28:
  _Block_object_dispose(&v38, 8);

  return v11;
}

- (unint64_t)sizeOfPCS:(_OpaquePCSShareProtection *)a3
{
  unint64_t v3 = (unint64_t)a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v5 = (void *)MEMORY[0x1C8789E70](self, a2);
    uint64_t v21 = 0;
    long long v22 = &v21;
    uint64_t v23 = 0x2020000000;
    uint64_t v24 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3032000000;
    uint64_t v18 = sub_1C4DC743C;
    int v19 = sub_1C4DC744C;
    id v20 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1C4DD4A10;
    v14[3] = &unk_1E64F2990;
    v14[5] = &v21;
    v14[6] = v3;
    v14[4] = &v15;
    objc_msgSend__onSynchronizeQueue_(self, v6, (uint64_t)v14);
    if (v22[3] || (uint64_t v11 = (void *)v16[5]) == 0)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v9 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
      {
        uint64_t v13 = v22[3];
        *(_DWORD *)buf = 138412546;
        unint64_t v26 = v3;
        __int16 v27 = 2112;
        uint64_t v28 = v13;
        _os_log_debug_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_DEBUG, "Failed to serialize PCS %@: %@", buf, 0x16u);
      }
      uint64_t v10 = (const void *)v22[3];
      if (v10)
      {
        CFRelease(v10);
        unint64_t v3 = 0;
        v22[3] = 0;
      }
      else
      {
        unint64_t v3 = 0;
      }
    }
    else
    {
      unint64_t v3 = objc_msgSend_length(v11, v7, v8);
    }
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(&v21, 8);
  }
  return v3;
}

- (unint64_t)maxPcsBytes
{
  unint64_t v3 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], a2, v2);
  unint64_t v6 = objc_msgSend_maxPCSSizeForKeyRolls(v3, v4, v5);

  return v6;
}

- (BOOL)isPCSSizeTooBigForKeyRoll:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = objc_msgSend_maxPcsBytes(self, a2, a3);
  if (v4) {
    BOOL v5 = v4 >= a3;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = !v5;
  if (v6)
  {
    unint64_t v7 = v4;
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v8 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      int v10 = 134218240;
      unint64_t v11 = a3;
      __int16 v12 = 2048;
      unint64_t v13 = v7;
      _os_log_error_impl(&dword_1C4CFF000, v8, OS_LOG_TYPE_ERROR, "PCS is too big for key rolling: %lu bytes (cap: %lu bytes)", (uint8_t *)&v10, 0x16u);
    }
  }
  return v6;
}

- (BOOL)isPCSTooBigForKeyRoll:(_OpaquePCSShareProtection *)a3
{
  uint64_t v5 = objc_msgSend_sizeOfPCS_(self, a2, (uint64_t)a3);
  return objc_msgSend_isPCSSizeTooBigForKeyRoll_(self, v4, v5);
}

- (id)updateIdentityAndRollKeyForZonePCS:(_OpaquePCSShareProtection *)a3 usingServiceIdentityWithType:(unint64_t)a4 forOperation:(id)a5
{
  uint64_t v64 = a3;
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  int v10 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v8, v9);
  char v13 = objc_msgSend_rollZonePCSIdentities(v10, v11, v12);

  if (v13)
  {
    uint64_t v16 = objc_msgSend_identityManager(self, v14, v15);
    uint64_t v18 = objc_msgSend_PCSServiceStringFromCKServiceType_(v16, v17, a4);

    char IsManatee = objc_msgSend_currentServiceIsManatee(self, v19, v20);
    uint64_t v24 = objc_msgSend_deviceContext(self, v22, v23);
    __int16 v27 = objc_msgSend_accountDataSecurityObserver(v24, v25, v26);
    uint64_t v30 = objc_msgSend_account(self, v28, v29);
    int v32 = objc_msgSend_isWalrusEnabledForAccount_allowBlockingFetch_(v27, v31, (uint64_t)v30, 1);

    uint64_t v33 = (void *)MEMORY[0x1E4F1A550];
    long long v34 = (void *)v18;
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    char v35 = IsManatee | v32;
    long long v36 = (os_log_t *)MEMORY[0x1E4F1A528];
    long long v37 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v61 = @"is not";
      if (v32) {
        uint64_t v61 = @"is";
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v61;
      _os_log_debug_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_DEBUG, "Walrus %@ enabled", (uint8_t *)&buf, 0xCu);
      if (v35)
      {
LABEL_6:
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v79 = 0x2020000000;
        uint64_t v80 = 0;
        uint64_t v68 = 0;
        __int16 v69 = &v68;
        uint64_t v70 = 0x2020000000;
        char v71 = 0;
        if (v64)
        {
          uint64_t v40 = objc_msgSend_identityManager(self, v38, v39);
          char v41 = v34;
          id v67 = 0;
          int v43 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(v40, v42, a4, 1, &v67);
          id v44 = v67;

          if (v43 && !v44)
          {
            if (objc_msgSend_isPCSTooBigForKeyRoll_(self, v45, (uint64_t)v64))
            {
              if (*v33 != -1) {
                dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              uint64_t v47 = *v36;
              if (os_log_type_enabled(*v36, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)uint64_t v72 = 0;
                _os_log_error_impl(&dword_1C4CFF000, v47, OS_LOG_TYPE_ERROR, "Aborting zone identity key roll due to current zone PCS being too large.", v72, 2u);
              }
              objc_msgSend_updateCloudKitMetrics_(v7, v48, (uint64_t)&unk_1F20430B0, v64);
              objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v49, *MEMORY[0x1E4F19DD8], 5018, 0, @"Cannot roll key for too large zone PCS", v65);
            }
            else
            {
              v66[0] = MEMORY[0x1E4F143A8];
              v66[1] = 3221225472;
              v66[2] = sub_1C4DD5370;
              v66[3] = &unk_1E64F2CA8;
              v66[6] = v64;
              v66[7] = v43;
              v66[4] = &v68;
              v66[5] = &buf;
              objc_msgSend__onSynchronizeQueue_(self, v46, (uint64_t)v66);
              uint64_t v54 = *(void *)(*((void *)&buf + 1) + 24);
              if (*((unsigned char *)v69 + 24) && !v54)
              {
                uint64_t v52 = objc_msgSend_replacePrimaryKeyInPCS_ofType_(self, v53, (uint64_t)v64, 3, 0, @"Couldn't roll key for zone PCS");
                if (v52)
                {
                  if (*v33 != -1) {
                    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
                  }
                  id v55 = *v36;
                  if (os_log_type_enabled(*v36, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)uint64_t v72 = 138412546;
                    v73 = v64;
                    __int16 v74 = 2112;
                    uint64_t v75 = v52;
                    _os_log_error_impl(&dword_1C4CFF000, v55, OS_LOG_TYPE_ERROR, "Failed to roll primary key of the zone PCS %@: %@", v72, 0x16u);
                  }
                }
                goto LABEL_31;
              }
              objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v53, *MEMORY[0x1E4F19DD8], 5018, v54, @"Couldn't roll key for zone PCS", v64);
            uint64_t v52 = };
LABEL_31:
            id v44 = 0;
            goto LABEL_32;
          }
          uint64_t v52 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v45, *MEMORY[0x1E4F19DD8], 5000, v44, @"Couldn't get a service identity set", v64);
        }
        else
        {
          uint64_t v52 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v38, *MEMORY[0x1E4F19DD8], 5018, @"Cannot roll key for a nil zone PCS");
          char v41 = v34;
          id v44 = 0;
          int v43 = 0;
        }
LABEL_32:
        uint64_t v56 = *(const void **)(*((void *)&buf + 1) + 24);
        if (v56)
        {
          CFRelease(v56);
          *(void *)(*((void *)&buf + 1) + 24) = 0;
        }
        if (v43) {
          CFRelease(v43);
        }
        uint64_t v57 = (void *)*MEMORY[0x1E4F1A548];
        if (v52)
        {
          if (*v33 != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], v57);
          }
          uint64_t v58 = *v36;
          if (os_log_type_enabled(*v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uint64_t v72 = 138412802;
            v73 = v64;
            __int16 v74 = 2114;
            uint64_t v75 = v41;
            __int16 v76 = 2112;
            v77 = v52;
            _os_log_error_impl(&dword_1C4CFF000, v58, OS_LOG_TYPE_ERROR, "Couldn't roll key for zone PCS %@ with current service %{public}@: %@", v72, 0x20u);
          }
        }
        else
        {
          if (*v33 != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], v57);
          }
          id v59 = *v36;
          if (os_log_type_enabled(*v36, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)uint64_t v72 = 138412546;
            v73 = v64;
            __int16 v74 = 2114;
            uint64_t v75 = v41;
            _os_log_debug_impl(&dword_1C4CFF000, v59, OS_LOG_TYPE_DEBUG, "Rolled key for zone PCS %@ with current service: %{public}@", v72, 0x16u);
          }
          objc_msgSend_updateCloudKitMetrics_(v7, v60, (uint64_t)&unk_1F20430D0, v64);
        }
        id v51 = v52;
        _Block_object_dispose(&v68, 8);
        _Block_object_dispose(&buf, 8);

LABEL_55:
        goto LABEL_56;
      }
    }
    else if (v35)
    {
      goto LABEL_6;
    }
    if (*v33 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    char v41 = v34;
    id v62 = *v36;
    if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v34;
      _os_log_impl(&dword_1C4CFF000, v62, OS_LOG_TYPE_INFO, "Not rolling zone PCS identities because we're using a non-manatee service identity: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    id v51 = 0;
    goto LABEL_55;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v50 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1C4CFF000, v50, OS_LOG_TYPE_INFO, "Not rolling zone PCS identities because we're asked not to!", (uint8_t *)&buf, 2u);
  }
  id v51 = 0;
LABEL_56:

  return v51;
}

- (BOOL)canRollShareKeys
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], a2, v2);
  char v7 = objc_msgSend_rollZoneSharingKeys(v4, v5, v6);

  if (v7)
  {
    char IsManatee = objc_msgSend_currentServiceIsManatee(self, v8, v9);
    char v13 = objc_msgSend_deviceContext(self, v11, v12);
    uint64_t v16 = objc_msgSend_accountDataSecurityObserver(v13, v14, v15);
    int v19 = objc_msgSend_account(self, v17, v18);
    int v21 = objc_msgSend_isWalrusEnabledForAccount_allowBlockingFetch_(v16, v20, (uint64_t)v19, 1);

    long long v22 = (void *)MEMORY[0x1E4F1A550];
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    char v23 = IsManatee | v21;
    uint64_t v24 = (os_log_t *)MEMORY[0x1E4F1A528];
    uint64_t v25 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v28 = @"is not";
      if (v21) {
        uint64_t v28 = @"is";
      }
      int v38 = 138412290;
      uint64_t v39 = v28;
      _os_log_debug_impl(&dword_1C4CFF000, v25, OS_LOG_TYPE_DEBUG, "Walrus %@ enabled", (uint8_t *)&v38, 0xCu);
      if (v23) {
        goto LABEL_6;
      }
    }
    else if (v23)
    {
LABEL_6:
      LOBYTE(v26) = 1;
      return v26;
    }
    if (*v22 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v29 = *v24;
    BOOL v26 = os_log_type_enabled(*v24, OS_LOG_TYPE_INFO);
    if (v26)
    {
      uint64_t v30 = v29;
      uint64_t v33 = objc_msgSend_identityManager(self, v31, v32);
      objc_msgSend_serviceName(v33, v34, v35);
      long long v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v38 = 138543362;
      uint64_t v39 = v36;
      _os_log_impl(&dword_1C4CFF000, v30, OS_LOG_TYPE_INFO, "Not rolling zone sharing PCS identities because current service %{public}@ is not manatee", (uint8_t *)&v38, 0xCu);

      goto LABEL_18;
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    __int16 v27 = *MEMORY[0x1E4F1A528];
    BOOL v26 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO);
    if (v26)
    {
      LOWORD(v38) = 0;
      _os_log_impl(&dword_1C4CFF000, v27, OS_LOG_TYPE_INFO, "Not rolling zone sharing PCS identities due to behavior option", (uint8_t *)&v38, 2u);
LABEL_18:
      LOBYTE(v26) = 0;
    }
  }
  return v26;
}

- (id)keyRollForZoneWideShareWithZonePCS:(id)a3 sharePCS:(id)a4 forOperation:(id)a5
{
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v13 = objc_msgSend_zoneID(v8, v11, v12);
  char canRollShareKeys = objc_msgSend_canRollShareKeys(self, v14, v15);
  int v19 = (os_log_t *)MEMORY[0x1E4F1A528];
  if ((canRollShareKeys & 1) == 0)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    BOOL v26 = *v19;
    if (!os_log_type_enabled(*v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v27 = 0;
      uint64_t v28 = 0;
      id v29 = 0;
LABEL_67:
      uint64_t v60 = *v19;
      if (os_log_type_enabled(*v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v131 = (uint64_t)v13;
        _os_log_impl(&dword_1C4CFF000, v60, OS_LOG_TYPE_INFO, "Skipped key roll for zone-wide share in zone %@", buf, 0xCu);
      }
      goto LABEL_69;
    }
    *(_DWORD *)long long buf = 138412290;
    uint64_t v131 = (uint64_t)v13;
    _os_log_error_impl(&dword_1C4CFF000, v26, OS_LOG_TYPE_ERROR, "Attempting to roll share keys for zone-wide share in zone %@ but this operation is not permitted", buf, 0xCu);
    id v29 = 0;
    uint64_t v28 = 0;
    __int16 v27 = 0;
    goto LABEL_65;
  }
  if (!objc_msgSend_pcs(v9, v17, v18) || !objc_msgSend_pcs(v8, v20, v21))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v30 = *v19;
    if (os_log_type_enabled(*v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v65 = v30;
      *(_DWORD *)long long buf = 138412802;
      uint64_t v131 = objc_msgSend_pcs(v9, v66, v67);
      __int16 v132 = 2112;
      uint64_t v133 = objc_msgSend_pcs(v8, v68, v69);
      __int16 v134 = 2112;
      uint64_t v135 = objc_msgSend_zoneishPCS(v8, v70, v71);
      _os_log_error_impl(&dword_1C4CFF000, v65, OS_LOG_TYPE_ERROR, "Didn't get decrypted share, shared zone pcs to roll- aborting. Share PCS: %@, Zone PCS: %@, Zoneish PCS: %@", buf, 0x20u);
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v31, *MEMORY[0x1E4F19DD8], 5005, @"Couldn't roll zone wide share PCS due to missing share or zone PCS");
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = 0;
    __int16 v27 = 0;
    goto LABEL_15;
  }
  if (objc_msgSend_zoneishPCS(v8, v22, v23))
  {
    objc_msgSend_zoneishPCS(v8, v24, v25);
    CFTypeRef v119 = (CFTypeRef)PCSFPCopyObject();
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    long long v36 = *v19;
    if (!os_log_type_enabled(*v19, OS_LOG_TYPE_INFO))
    {
      CFTypeRef v119 = 0;
      goto LABEL_31;
    }
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1C4CFF000, v36, OS_LOG_TYPE_INFO, "Didn't get decrypted zoneish pcs to roll- solidering on. We're probably using per-record PCS.", buf, 2u);
    CFTypeRef v119 = 0;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
LABEL_31:
  long long v37 = *v19;
  if (os_log_type_enabled(*v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v131 = (uint64_t)v13;
    _os_log_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_INFO, "Rolling identities for zone-wide share and zone pcs for zone %@", buf, 0xCu);
  }
  objc_msgSend_pcs(v8, v38, v39);
  uint64_t v40 = PCSFPCopyObject();
  objc_msgSend_invitedPCS(v9, v41, v42);
  int v43 = (const void *)PCSFPCopyObject();
  objc_msgSend_publicPCS(v9, v44, v45);
  uint64_t v46 = PCSFPCopyObject();
  id v129 = 0;
  CFTypeRef cf = (CFTypeRef)v40;
  LOBYTE(v40) = objc_msgSend_removeSharePCS_fromRecordPCS_error_(self, v47, (uint64_t)v43, v40, &v129);
  id v48 = v129;
  id v29 = v48;
  CFTypeRef v120 = (CFTypeRef)v46;
  if ((v40 & 1) == 0)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v55 = *MEMORY[0x1E4F1A500];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_DWORD *)long long buf = 138412546;
    uint64_t v131 = (uint64_t)v13;
    __int16 v132 = 2112;
    uint64_t v133 = (uint64_t)v29;
    uint64_t v56 = "Couldn't remove old invited PCS from zone PCS for zone-wide share in zone %@: %@";
    goto LABEL_84;
  }
  id v128 = v48;
  char v50 = objc_msgSend_removeSharePCS_fromRecordPCS_error_(self, v49, (uint64_t)v43, v46, &v128);
  id v51 = v128;

  if ((v50 & 1) == 0)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v58 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      uint64_t v131 = (uint64_t)v13;
      __int16 v132 = 2112;
      uint64_t v133 = (uint64_t)v51;
      _os_log_error_impl(&dword_1C4CFF000, v58, OS_LOG_TYPE_ERROR, "Couldn't remove old invited PCS from public PCS for zone-wide share in zone %@: %@", buf, 0x16u);
    }
    int v57 = 0;
    __int16 v27 = 0;
    uint64_t v28 = 0;
    id v29 = v51;
    goto LABEL_51;
  }
  id v127 = v51;
  id v53 = (id)objc_msgSend_rollIdentityForSharePCS_ofType_removeAllExistingPrivateKeys_error_(self, v52, (uint64_t)v43, 5, 1, &v127);
  id v29 = v127;

  if (v29)
  {
    int v19 = (os_log_t *)MEMORY[0x1E4F1A528];
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v55 = *v19;
    if (!os_log_type_enabled(*v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_DWORD *)long long buf = 138412546;
    uint64_t v131 = (uint64_t)v13;
    __int16 v132 = 2112;
    uint64_t v133 = (uint64_t)v29;
    uint64_t v56 = "Failed to roll identity for invited PCS for zone-wide share in zone %@: %@";
LABEL_84:
    _os_log_error_impl(&dword_1C4CFF000, v55, OS_LOG_TYPE_ERROR, v56, buf, 0x16u);
LABEL_43:
    int v57 = 0;
LABEL_44:
    __int16 v27 = 0;
LABEL_45:
    uint64_t v28 = 0;
    goto LABEL_52;
  }
  uint64_t v63 = objc_msgSend_replacePrimaryKeyInPCS_ofType_(self, v54, (uint64_t)v43, 5);
  int v19 = (os_log_t *)MEMORY[0x1E4F1A528];
  if (v63)
  {
    id v29 = (id)v63;
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v55 = *v19;
    if (!os_log_type_enabled(*v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_DWORD *)long long buf = 138412546;
    uint64_t v131 = (uint64_t)v13;
    __int16 v132 = 2112;
    uint64_t v133 = (uint64_t)v29;
    uint64_t v56 = "Failed to roll primary key of the invited PCS for zone-wide share in zone %@: %@";
    goto LABEL_84;
  }
  id v126 = 0;
  char v72 = objc_msgSend_addSharePCS_toRecordPCS_error_(self, v64, (uint64_t)v43, cf, &v126);
  id v73 = v126;
  id v29 = v73;
  if ((v72 & 1) == 0)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v55 = *v19;
    if (!os_log_type_enabled(*v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_DWORD *)long long buf = 138412546;
    uint64_t v131 = (uint64_t)v13;
    __int16 v132 = 2112;
    uint64_t v133 = (uint64_t)v29;
    uint64_t v56 = "Failed to add rolled invited PCS key to zone PCS for zone-wide share in zone %@: %@";
    goto LABEL_84;
  }
  id v125 = v73;
  char v75 = objc_msgSend_addSharePCS_toRecordPCS_error_(self, v74, (uint64_t)v43, v46, &v125);
  id v76 = v125;

  if ((v75 & 1) == 0)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v81 = *v19;
    if (os_log_type_enabled(*v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      uint64_t v131 = (uint64_t)v13;
      __int16 v132 = 2112;
      uint64_t v133 = (uint64_t)v76;
      _os_log_error_impl(&dword_1C4CFF000, v81, OS_LOG_TYPE_ERROR, "Failed to add rolled invited PCS key to public PCS for zone-wide share in zone %@: %@", buf, 0x16u);
    }
    int v57 = 0;
    id v29 = v76;
    goto LABEL_44;
  }
  id v124 = v76;
  objc_msgSend_rollIdentityForSharePCS_ofType_removeAllExistingPrivateKeys_error_(self, v77, (uint64_t)cf, 3, 0, &v124);
  v27 = uint64_t v78 = v76;
  id v29 = v124;

  if (v29)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v80 = *v19;
    if (os_log_type_enabled(*v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      uint64_t v131 = (uint64_t)v13;
      __int16 v132 = 2112;
      uint64_t v133 = (uint64_t)v29;
      _os_log_error_impl(&dword_1C4CFF000, v80, OS_LOG_TYPE_ERROR, "Failed to roll identity for zone PCS for zone %@: %@", buf, 0x16u);
    }
    int v57 = 0;
    goto LABEL_45;
  }
  uint64_t v82 = objc_msgSend_sizeOfPCS_(self, v79, (uint64_t)cf);
  uint64_t v84 = objc_msgSend_sizeOfPCS_(self, v83, (uint64_t)v119) + v82;
  uint64_t v86 = objc_msgSend_sizeOfPCS_(self, v85, (uint64_t)v43);
  uint64_t v88 = objc_msgSend_sizeOfPCS_(self, v87, (uint64_t)v120);
  if (objc_msgSend_isPCSSizeTooBigForKeyRoll_(self, v89, v84 + v86 + v88))
  {
    int v19 = (os_log_t *)MEMORY[0x1E4F1A528];
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    char v91 = *v19;
    if (os_log_type_enabled(*v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v131 = (uint64_t)v13;
      _os_log_error_impl(&dword_1C4CFF000, v91, OS_LOG_TYPE_ERROR, "Skipping zone key roll because combined PCS is too big in zone %@", buf, 0xCu);
    }
    objc_msgSend_updateCloudKitMetrics_(v10, v92, (uint64_t)&unk_1F20430F0);
    uint64_t v28 = 0;
    id v29 = 0;
    int v57 = 1;
LABEL_52:
    id v59 = cf;
    if (!cf) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
  if (v119)
  {
    id v123 = 0;
    uint64_t v28 = objc_msgSend_dataFromRecordPCS_error_(self, v90, (uint64_t)v119, &v123);
    id v29 = v123;
    if (v29 || !v28)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      int v19 = (os_log_t *)MEMORY[0x1E4F1A528];
      id v105 = *MEMORY[0x1E4F1A528];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR)) {
        goto LABEL_119;
      }
      *(_DWORD *)long long buf = 138412290;
      uint64_t v131 = (uint64_t)v29;
      v102 = "Couldn't serialize zoneish PCS for share roll: %@";
      uint64_t v103 = v105;
      uint32_t v104 = 12;
      goto LABEL_138;
    }
    CFRelease(v119);
    id v122 = 0;
    uint64_t v94 = objc_msgSend_createPCSObjectFromData_ofType_sharedToPCS_error_(self, v93, (uint64_t)v28, 1, cf, &v122);
    id v29 = v122;
    CFTypeRef v119 = (CFTypeRef)v94;
    if (v29 || !v94)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v106 = *MEMORY[0x1E4F1A528];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR)) {
        goto LABEL_123;
      }
      *(_DWORD *)long long buf = 138412290;
      uint64_t v131 = (uint64_t)v29;
      uint64_t v99 = "Couldn't decode zoneishPCS data for share roll: %@";
      uint64_t v117 = v106;
      uint32_t v118 = 12;
      goto LABEL_140;
    }
    uint64_t v96 = objc_msgSend_updateZoneIdentityForRecordPCS_usingZonePCS_isZoneishRecord_bypassAllowlistedContainers_(self, v95, v94, cf, 1, 1);
    if (v96)
    {
      id v29 = (id)v96;
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v98 = *MEMORY[0x1E4F1A528];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR)) {
        goto LABEL_123;
      }
      *(_DWORD *)long long buf = 138412546;
      uint64_t v131 = (uint64_t)v13;
      __int16 v132 = 2112;
      uint64_t v133 = (uint64_t)v29;
      uint64_t v99 = "Couldn't update identity on zoneish PCS for zone %@: %@";
      goto LABEL_136;
    }
    uint64_t v114 = objc_msgSend_rollMasterKeyForRecordPCS_isZoneishRecord_bypassAllowlistedContainers_forOperation_(self, v97, v94, 1, 1, v10);
    if (v114)
    {
      id v29 = (id)v114;
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v98 = *MEMORY[0x1E4F1A528];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR)) {
        goto LABEL_123;
      }
      *(_DWORD *)long long buf = 138412546;
      uint64_t v131 = (uint64_t)v13;
      __int16 v132 = 2112;
      uint64_t v133 = (uint64_t)v29;
      uint64_t v99 = "Failed to roll master key for zoneish PCS for zone %@: %@";
      goto LABEL_136;
    }
    uint64_t v116 = objc_msgSend_removePrivateKeysForKeyIDs_fromPCS_(self, v115, (uint64_t)v27, cf);
    if (v116)
    {
      id v29 = (id)v116;
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v98 = *MEMORY[0x1E4F1A528];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR)) {
        goto LABEL_123;
      }
      *(_DWORD *)long long buf = 138412546;
      uint64_t v131 = (uint64_t)v13;
      __int16 v132 = 2112;
      uint64_t v133 = (uint64_t)v29;
      uint64_t v99 = "Couldn't clean up old private keys from PCS for zone %@: %@";
LABEL_136:
      uint64_t v117 = v98;
      uint32_t v118 = 22;
LABEL_140:
      _os_log_error_impl(&dword_1C4CFF000, v117, OS_LOG_TYPE_ERROR, v99, buf, v118);
LABEL_123:
      int v57 = 0;
LABEL_51:
      int v19 = (os_log_t *)MEMORY[0x1E4F1A528];
      goto LABEL_52;
    }
  }
  else
  {
    uint64_t v28 = 0;
    CFTypeRef v119 = 0;
  }
  objc_msgSend_replacePrimaryKeyInPCS_ofType_(self, v90, (uint64_t)cf, 3);
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    int v19 = (os_log_t *)MEMORY[0x1E4F1A528];
    BOOL v101 = *MEMORY[0x1E4F1A528];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR)) {
      goto LABEL_119;
    }
    *(_DWORD *)long long buf = 138412546;
    uint64_t v131 = (uint64_t)v13;
    __int16 v132 = 2112;
    uint64_t v133 = (uint64_t)v29;
    v102 = "Failed to roll primary key of the PCS for zone %@: %@";
    uint64_t v103 = v101;
    uint32_t v104 = 22;
LABEL_138:
    _os_log_error_impl(&dword_1C4CFF000, v103, OS_LOG_TYPE_ERROR, v102, buf, v104);
LABEL_119:
    int v57 = 0;
    goto LABEL_52;
  }
  objc_msgSend_setPcs_(v8, v100, (uint64_t)cf);
  objc_msgSend_setZoneishPCS_(v8, v107, (uint64_t)v119);
  uint64_t v110 = objc_msgSend_invitedPCS(v9, v108, v109);
  objc_msgSend_setPreKeyRollInvitedPCS_(v9, v111, v110);
  objc_msgSend_setInvitedPCS_(v9, v112, (uint64_t)v43);
  objc_msgSend_setPublicPCS_(v9, v113, (uint64_t)v120);
  id v59 = cf;
  int v57 = 0;
  int v19 = (os_log_t *)MEMORY[0x1E4F1A528];
  if (cf) {
LABEL_53:
  }
    CFRelease(v59);
LABEL_54:
  if (v119) {
    CFRelease(v119);
  }
  if (v43) {
    CFRelease(v43);
  }
  if (!v120)
  {
    if (!v57) {
      goto LABEL_15;
    }
LABEL_65:
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    goto LABEL_67;
  }
  CFRelease(v120);
  if (v57) {
    goto LABEL_65;
  }
LABEL_15:
  uint64_t v32 = (void *)*MEMORY[0x1E4F1A548];
  if (v29)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v32);
    }
    uint64_t v33 = *v19;
    if (os_log_type_enabled(*v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      uint64_t v131 = (uint64_t)v13;
      __int16 v132 = 2112;
      uint64_t v133 = (uint64_t)v29;
      _os_log_error_impl(&dword_1C4CFF000, v33, OS_LOG_TYPE_ERROR, "Failed to roll keys for zone-wide share in zone %@: %@", buf, 0x16u);
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v32);
    }
    long long v34 = *v19;
    if (os_log_type_enabled(*v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v131 = (uint64_t)v13;
      _os_log_impl(&dword_1C4CFF000, v34, OS_LOG_TYPE_INFO, "Successfully rolled keys for zone-wide share in zone %@", buf, 0xCu);
    }
    objc_msgSend_updateCloudKitMetrics_(v10, v35, (uint64_t)&unk_1F2043110);
    id v29 = 0;
  }
LABEL_69:
  id v61 = v29;

  return v61;
}

- (id)replacePrimaryKeyInPCS:(_OpaquePCSShareProtection *)a3 ofType:(unint64_t)a4
{
  uint64_t v18 = 0;
  int v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1C4DD68DC;
  v13[3] = &unk_1E64F2990;
  v13[5] = &v18;
  v13[6] = a3;
  void v13[4] = &v14;
  objc_msgSend__onSynchronizeQueue_(self, a2, (uint64_t)v13);
  if (*((unsigned char *)v15 + 24) && !v19[3])
  {
    id v10 = 0;
  }
  else
  {
    char v7 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v8 = objc_msgSend_keyrollingErrorCodeForPCSOfType_(self, v6, a4);
    id v10 = objc_msgSend_errorWithDomain_code_error_format_(v7, v9, *MEMORY[0x1E4F19DD8], v8, v19[3], @"Couldn't replace primary key of PCS");
    unint64_t v11 = (const void *)v19[3];
    if (v11)
    {
      CFRelease(v11);
      v19[3] = 0;
    }
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v10;
}

- (id)keyRollIfNeededForPerRecordPCS:(id)a3 needsRollAndCounterSign:(BOOL)a4 forOperation:(id)a5 didRoll:(BOOL *)a6
{
  BOOL v8 = a4;
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  char IsManatee = objc_msgSend_currentServiceIsManatee(self, v12, v13);
  char v17 = objc_msgSend_deviceContext(self, v15, v16);
  uint64_t v20 = objc_msgSend_accountDataSecurityObserver(v17, v18, v19);
  uint64_t v23 = objc_msgSend_account(self, v21, v22);
  int v25 = objc_msgSend_isWalrusEnabledForAccount_allowBlockingFetch_(v20, v24, (uint64_t)v23, 1);

  BOOL v26 = (uint64_t *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  char v27 = IsManatee | v25;
  uint64_t v28 = (os_log_t *)MEMORY[0x1E4F1A528];
  id v29 = *MEMORY[0x1E4F1A528];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
  {
    if (v27) {
      goto LABEL_5;
    }
LABEL_47:
    if (*v26 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v83 = *v28;
    if (os_log_type_enabled(*v28, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v84 = v83;
      uint64_t v87 = objc_msgSend_identityManager(self, v85, v86);
      uint64_t v90 = objc_msgSend_serviceName(v87, v88, v89);
      int v133 = 138543362;
      uint64_t v134 = (uint64_t)v90;
      _os_log_debug_impl(&dword_1C4CFF000, v84, OS_LOG_TYPE_DEBUG, "Not rolling record PCS keys because current service %{public}@ is not manatee", (uint8_t *)&v133, 0xCu);
    }
    goto LABEL_51;
  }
  uint64_t v82 = @"is not";
  if (v25) {
    uint64_t v82 = @"is";
  }
  int v133 = 138412290;
  uint64_t v134 = (uint64_t)v82;
  _os_log_debug_impl(&dword_1C4CFF000, v29, OS_LOG_TYPE_DEBUG, "Walrus %@ enabled", (uint8_t *)&v133, 0xCu);
  if ((v27 & 1) == 0) {
    goto LABEL_47;
  }
LABEL_5:
  uint64_t v32 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v30, v31);
  int v35 = objc_msgSend_allowRecordKeyRollingInPerRecordPCSZonesForAllContainers(v32, v33, v34);

  if ((v35 & v25) == 1 && (objc_msgSend_currentServiceIsManatee(self, v36, v37) & 1) == 0)
  {
    if (*v26 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v39 = *v28;
    if (os_log_type_enabled(*v28, OS_LOG_TYPE_DEBUG))
    {
      uint32_t v118 = v39;
      id v121 = objc_msgSend_containerID(self, v119, v120);
      int v133 = 138412290;
      uint64_t v134 = (uint64_t)v121;
      _os_log_debug_impl(&dword_1C4CFF000, v118, OS_LOG_TYPE_DEBUG, "Allowing record PCS key rolling in container %@ due to walrus enabled, non manatee, and behavior option override", (uint8_t *)&v133, 0xCu);
    }
    char v38 = 1;
  }
  else
  {
    char v38 = 0;
  }
  if (*MEMORY[0x1E4F1A4E0])
  {
    uint64_t v40 = objc_msgSend_containerID(self, v36, v37);
    unsigned __int8 isKeyRollingUnitTestContainerID = objc_msgSend__isKeyRollingUnitTestContainerID_(self, v41, (uint64_t)v40);
  }
  else
  {
    unsigned __int8 isKeyRollingUnitTestContainerID = 0;
  }
  int v43 = objc_msgSend_containerID(self, v36, v37);
  if (objc_msgSend_specialContainerType(v43, v44, v45) != 34)
  {

    if ((v38 | isKeyRollingUnitTestContainerID)) {
      goto LABEL_19;
    }
    if (*v26 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v73 = *v28;
    if (os_log_type_enabled(*v28, OS_LOG_TYPE_INFO))
    {
      __int16 v74 = v73;
      v77 = objc_msgSend_containerID(self, v75, v76);
      int v133 = 138412290;
      uint64_t v134 = (uint64_t)v77;
      _os_log_impl(&dword_1C4CFF000, v74, OS_LOG_TYPE_INFO, "Not checking PCS shouldRoll hint because we're not allowed to in container %@", (uint8_t *)&v133, 0xCu);
    }
LABEL_51:
    uint64_t v64 = 0;
    goto LABEL_76;
  }

LABEL_19:
  if (!objc_msgSend_pcs(v10, v46, v47)
    || (objc_msgSend_zonePCSData(v10, v48, v49),
        char v50 = objc_claimAutoreleasedReturnValue(),
        uint64_t v53 = objc_msgSend_pcs(v50, v51, v52),
        v50,
        !v53))
  {
    if (*v26 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v71 = *v28;
    if (os_log_type_enabled(*v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v108 = v71;
      uint64_t v111 = objc_msgSend_pcs(v10, v109, v110);
      uint64_t v114 = objc_msgSend_zonePCSData(v10, v112, v113);
      uint64_t v117 = objc_msgSend_pcs(v114, v115, v116);
      int v133 = 138412546;
      uint64_t v134 = v111;
      __int16 v135 = 2112;
      uint64_t v136 = v117;
      _os_log_error_impl(&dword_1C4CFF000, v108, OS_LOG_TYPE_ERROR, "Didn't get decrypted record pcs and zone pcs to roll- aborting. Record PCS: %@, Zone PCS: %@", (uint8_t *)&v133, 0x16u);
    }
    uint64_t v64 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v72, *MEMORY[0x1E4F19DD8], 5005, @"Couldn't roll record PCS due to missing record or zone PCS");
    goto LABEL_71;
  }
  objc_msgSend_pcs(v10, v54, v55);
  uint64_t v56 = (const void *)PCSFPCopyObject();
  if (PCSFPShouldRoll())
  {
    id v59 = objc_msgSend_zonePCSData(v10, v57, v58);
    uint64_t v62 = objc_msgSend_pcs(v59, v60, v61);
    uint64_t v64 = objc_msgSend_updateZoneIdentityForRecordPCS_usingZonePCS_isZoneishRecord_bypassAllowlistedContainers_(self, v63, (uint64_t)v56, v62, 0, 1);

    if (v64)
    {
      if (*v26 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      os_log_t v65 = *v28;
      if (!os_log_type_enabled(*v28, OS_LOG_TYPE_ERROR)) {
        goto LABEL_69;
      }
      char v66 = v65;
      uint64_t v69 = objc_msgSend_recordID(v10, v67, v68);
      int v133 = 138412546;
      uint64_t v134 = (uint64_t)v69;
      __int16 v135 = 2112;
      uint64_t v136 = (uint64_t)v64;
      uint64_t v70 = "Couldn't update identity on record PCS for record %@: %@";
      goto LABEL_42;
    }
  }
  else if (!v8)
  {
    goto LABEL_68;
  }
  uint64_t v78 = objc_msgSend_rollMasterKeyForRecordPCS_isZoneishRecord_bypassAllowlistedContainers_forOperation_(self, v57, (uint64_t)v56, 0, 1, v11);
  if (v78)
  {
    uint64_t v64 = (void *)v78;
    if (*v26 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v79 = *v28;
    if (!os_log_type_enabled(*v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_69;
    }
    char v66 = v79;
    uint64_t v69 = objc_msgSend_recordID(v10, v80, v81);
    int v133 = 138412546;
    uint64_t v134 = (uint64_t)v69;
    __int16 v135 = 2112;
    uint64_t v136 = (uint64_t)v64;
    uint64_t v70 = "Failed to roll master key for record PCS for record %@: %@";
LABEL_42:
    _os_log_error_impl(&dword_1C4CFF000, v66, OS_LOG_TYPE_ERROR, v70, (uint8_t *)&v133, 0x16u);
LABEL_43:

    goto LABEL_69;
  }
  if (a6) {
    *a6 = 1;
  }
  if (*v26 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  os_log_t v91 = *v28;
  if (os_log_type_enabled(*v28, OS_LOG_TYPE_INFO))
  {
    v93 = v91;
    uint64_t v96 = objc_msgSend_recordID(v10, v94, v95);
    int v133 = 138543362;
    uint64_t v134 = (uint64_t)v96;
    _os_log_impl(&dword_1C4CFF000, v93, OS_LOG_TYPE_INFO, "Successfully rolled keys for record %{public}@", (uint8_t *)&v133, 0xCu);
  }
  if (v8)
  {
    uint64_t v97 = objc_msgSend_zonePCSData(v10, v57, v92);
    objc_msgSend_pcs(v97, v98, v99);
    uint64_t v100 = PCSFPCopyObject();

    uint64_t v102 = objc_msgSend_counterSignRecordPCS_zonePCS_(self, v101, (uint64_t)v56, v100);
    uint64_t v103 = (void *)*MEMORY[0x1E4F1A548];
    uint64_t v104 = *v26;
    if (v102)
    {
      uint64_t v64 = (void *)v102;
      if (v104 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v103);
      }
      id v105 = (void *)*MEMORY[0x1E4F1A500];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG)) {
        goto LABEL_69;
      }
      char v66 = v105;
      uint64_t v69 = objc_msgSend_recordID(v10, v106, v107);
      int v133 = 138412546;
      uint64_t v134 = (uint64_t)v69;
      __int16 v135 = 2112;
      uint64_t v136 = 0;
      _os_log_debug_impl(&dword_1C4CFF000, v66, OS_LOG_TYPE_DEBUG, "Error counter-signing record %@: %@", (uint8_t *)&v133, 0x16u);
      goto LABEL_43;
    }
    if (v104 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v103);
    }
    os_log_t v122 = *v28;
    if (os_log_type_enabled(*v28, OS_LOG_TYPE_INFO))
    {
      id v123 = v122;
      id v126 = objc_msgSend_recordID(v10, v124, v125);
      int v133 = 138412290;
      uint64_t v134 = (uint64_t)v126;
      _os_log_impl(&dword_1C4CFF000, v123, OS_LOG_TYPE_INFO, "Successfully counter-signed record %@ if it was necessary", (uint8_t *)&v133, 0xCu);
    }
  }
LABEL_68:
  objc_msgSend_setPcs_(v10, v57, (uint64_t)v56);
  uint64_t v64 = 0;
LABEL_69:
  if (v56) {
    CFRelease(v56);
  }
LABEL_71:
  if (v64)
  {
    if (*v26 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v127 = *v28;
    if (os_log_type_enabled(*v28, OS_LOG_TYPE_ERROR))
    {
      id v129 = v127;
      __int16 v132 = objc_msgSend_recordID(v10, v130, v131);
      int v133 = 138412546;
      uint64_t v134 = (uint64_t)v132;
      __int16 v135 = 2112;
      uint64_t v136 = (uint64_t)v64;
      _os_log_error_impl(&dword_1C4CFF000, v129, OS_LOG_TYPE_ERROR, "Failed to roll keys for record PCS for record %@: %@", (uint8_t *)&v133, 0x16u);
    }
  }
LABEL_76:

  return v64;
}

- (id)keyRollForZoneWideShareRecordPCS:(id)a3 sharedZonePCS:(id)a4 sharePCS:(id)a5 forOperation:(id)a6
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v16 = objc_msgSend_zoneID(v11, v14, v15);
  if (objc_msgSend_canRollShareKeys(self, v17, v18))
  {
    if (!objc_msgSend_pcs(v10, v19, v20) || !objc_msgSend_pcs(v11, v21, v22) || !objc_msgSend_pcs(v12, v23, v24))
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v62 = (void *)*MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
      {
        uint64_t v68 = v62;
        *(_DWORD *)long long buf = 138412802;
        uint64_t v118 = objc_msgSend_pcs(v12, v69, v70);
        __int16 v119 = 2112;
        uint64_t v120 = objc_msgSend_pcs(v11, v71, v72);
        __int16 v121 = 2112;
        uint64_t v122 = objc_msgSend_pcs(v10, v73, v74);
        _os_log_error_impl(&dword_1C4CFF000, v68, OS_LOG_TYPE_ERROR, "Didn't get decrypted share, shared zone and record pcs to roll- aborting. Share PCS: %@, Zone PCS: %@, record PCS: %@", buf, 0x20u);
      }
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v63, *MEMORY[0x1E4F19DD8], 5005, @"Couldn't roll zone-wide share record PCS due to missing share or zone PCS");
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      id v29 = 0;
      if (!v32) {
        goto LABEL_76;
      }
      goto LABEL_27;
    }
    objc_msgSend_pcs(v10, v25, v26);
    char v27 = (const void *)PCSFPCopyObject();
    id v116 = 0;
    id v29 = objc_msgSend_dataFromRecordPCS_error_(self, v28, (uint64_t)v27, &v116);
    id v32 = v116;
    if (v32 || !v29)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      os_log_t v65 = *MEMORY[0x1E4F1A528];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR)) {
        goto LABEL_38;
      }
      *(_DWORD *)long long buf = 138412290;
      uint64_t v118 = (uint64_t)v32;
      char v66 = "Couldn't serialize zone-wide share record PCS for share roll: %@";
    }
    else
    {
      if (v27) {
        CFRelease(v27);
      }
      uint64_t v33 = objc_msgSend_pcs(v11, v30, v31);
      id v115 = 0;
      char v27 = (const void *)objc_msgSend_createPCSObjectFromData_ofType_sharedToPCS_error_(self, v34, (uint64_t)v29, 1, v33, &v115);
      id v32 = v115;
      if (!v32 && v27)
      {
        uint64_t v109 = v29;
        objc_msgSend_publicPCS(v12, v35, v36);
        uint64_t v37 = (uint64_t)v27;
        uint64_t v38 = PCSFPCopyObject();
        uint64_t v40 = objc_msgSend_sizeOfPCS_(self, v39, v37);
        uint64_t v43 = objc_msgSend_pcs(v11, v41, v42);
        uint64_t v45 = objc_msgSend_sizeOfPCS_(self, v44, v43);
        uint64_t v48 = objc_msgSend_pcs(v12, v46, v47);
        uint64_t v50 = v45 + objc_msgSend_sizeOfPCS_(self, v49, v48);
        CFTypeRef cf = (CFTypeRef)v38;
        uint64_t v52 = objc_msgSend_sizeOfPCS_(self, v51, v38);
        int isPCSSizeTooBigForKeyRoll = objc_msgSend_isPCSSizeTooBigForKeyRoll_(self, v53, v50 + v52 + v40);
        if (isPCSSizeTooBigForKeyRoll)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          int v57 = (const void *)v37;
          uint64_t v58 = *MEMORY[0x1E4F1A528];
          id v29 = v109;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v118 = (uint64_t)v16;
            _os_log_error_impl(&dword_1C4CFF000, v58, OS_LOG_TYPE_ERROR, "Skipping zone-wide share record key roll because combined PCS is too big in zone %@", buf, 0xCu);
          }
          objc_msgSend_updateCloudKitMetrics_(v13, v59, (uint64_t)&unk_1F2043130);
          id v32 = 0;
          goto LABEL_72;
        }
        uint64_t v75 = objc_msgSend_pcs(v11, v54, v55);
        uint64_t v77 = objc_msgSend_updateZoneIdentityForRecordPCS_usingZonePCS_isZoneishRecord_bypassAllowlistedContainers_(self, v76, v37, v75, 0, 1);
        int v57 = (const void *)v37;
        if (v77)
        {
          id v32 = (id)v77;
          id v29 = v109;
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          os_log_t v79 = *MEMORY[0x1E4F1A528];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412546;
            uint64_t v118 = (uint64_t)v16;
            __int16 v119 = 2112;
            uint64_t v120 = (uint64_t)v32;
            uint64_t v80 = "Couldn't update identity on zone-wide share record PCS for zone %@: %@";
LABEL_71:
            _os_log_error_impl(&dword_1C4CFF000, v79, OS_LOG_TYPE_ERROR, v80, buf, 0x16u);
          }
        }
        else
        {
          uint64_t v81 = objc_msgSend_rollMasterKeyForRecordPCS_isZoneishRecord_bypassAllowlistedContainers_forOperation_(self, v78, v37, 0, 1, v13);
          id v29 = v109;
          if (v81)
          {
            id v32 = (id)v81;
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            os_log_t v79 = *MEMORY[0x1E4F1A528];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412546;
              uint64_t v118 = (uint64_t)v16;
              __int16 v119 = 2112;
              uint64_t v120 = (uint64_t)v32;
              uint64_t v80 = "Failed to roll master key for zone-wide share record PCS for zone %@: %@";
              goto LABEL_71;
            }
          }
          else
          {
            uint64_t v84 = objc_msgSend_preKeyRollInvitedPCS(v12, v82, v83);
            id v114 = 0;
            char v86 = objc_msgSend_removeSharePCS_fromRecordPCS_error_(self, v85, v84, v57, &v114);
            id v32 = v114;
            if (v86)
            {
              uint64_t v89 = objc_msgSend_preKeyRollInvitedPCS(v12, v87, v88);
              id v113 = v32;
              char v91 = objc_msgSend_removeSharePCS_fromRecordPCS_error_(self, v90, v89, cf, &v113);
              id v107 = v113;

              if (v91)
              {
                uint64_t v94 = objc_msgSend_pcs(v12, v92, v93);
                id v112 = v107;
                char v106 = objc_msgSend_addSharePCS_toRecordPCS_error_(self, v95, v94, v57, &v112);
                id v32 = v112;

                if (v106)
                {
                  uint64_t v98 = objc_msgSend_pcs(v12, v96, v97);
                  id v111 = v32;
                  char v100 = objc_msgSend_addSharePCS_toRecordPCS_error_(self, v99, v98, cf, &v111);
                  id v108 = v111;

                  if (v100)
                  {
                    objc_msgSend_setPcs_(v10, v101, (uint64_t)v57);
                    objc_msgSend_setPublicPCS_(v12, v102, (uint64_t)cf);
                    id v32 = v108;
                    LOBYTE(isPCSSizeTooBigForKeyRoll) = 0;
                  }
                  else
                  {
                    if (*MEMORY[0x1E4F1A550] != -1) {
                      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
                    }
                    id v105 = *MEMORY[0x1E4F1A528];
                    LOBYTE(isPCSSizeTooBigForKeyRoll) = 0;
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)long long buf = 138412546;
                      uint64_t v118 = (uint64_t)v16;
                      __int16 v119 = 2112;
                      uint64_t v120 = (uint64_t)v108;
                      _os_log_error_impl(&dword_1C4CFF000, v105, OS_LOG_TYPE_ERROR, "Failed to add rolled invited PCS key to public PCS for zone-wide share record PCS for zone %@: %@", buf, 0x16u);
                    }
                    id v32 = v108;
                  }
                }
                else
                {
                  if (*MEMORY[0x1E4F1A550] != -1) {
                    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
                  }
                  LOBYTE(isPCSSizeTooBigForKeyRoll) = 0;
                  os_log_t v79 = *MEMORY[0x1E4F1A528];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)long long buf = 138412546;
                    uint64_t v118 = (uint64_t)v16;
                    __int16 v119 = 2112;
                    uint64_t v120 = (uint64_t)v32;
                    uint64_t v80 = "Failed to add rolled invited PCS key to zone-wide share record PCS for zone %@: %@";
                    goto LABEL_71;
                  }
                }
              }
              else
              {
                id v32 = v107;
                if (*MEMORY[0x1E4F1A550] != -1) {
                  dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
                }
                LOBYTE(isPCSSizeTooBigForKeyRoll) = 0;
                os_log_t v79 = *MEMORY[0x1E4F1A500];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)long long buf = 138412546;
                  uint64_t v118 = (uint64_t)v16;
                  __int16 v119 = 2112;
                  uint64_t v120 = (uint64_t)v107;
                  uint64_t v80 = "Failed to remove the old invited PCS from public PCS for zone-wide share record PCS for zone %@: %@";
                  goto LABEL_71;
                }
              }
            }
            else
            {
              if (*MEMORY[0x1E4F1A550] != -1) {
                dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              LOBYTE(isPCSSizeTooBigForKeyRoll) = 0;
              os_log_t v79 = *MEMORY[0x1E4F1A528];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 138412546;
                uint64_t v118 = (uint64_t)v16;
                __int16 v119 = 2112;
                uint64_t v120 = (uint64_t)v32;
                uint64_t v80 = "Failed to remove the old invited PCS key from zone-wide share record PCS for zone %@: %@";
                goto LABEL_71;
              }
            }
          }
        }
LABEL_72:
        CFRelease(v57);
        uint64_t v67 = cf;
        if (!cf) {
          goto LABEL_74;
        }
        goto LABEL_73;
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      os_log_t v65 = *MEMORY[0x1E4F1A528];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
      {
LABEL_38:
        if (v27)
        {
LABEL_39:
          LOBYTE(isPCSSizeTooBigForKeyRoll) = 0;
          uint64_t v67 = v27;
LABEL_73:
          CFRelease(v67);
LABEL_74:
          if (!v32)
          {
            if (isPCSSizeTooBigForKeyRoll)
            {
LABEL_80:
              id v32 = 0;
LABEL_81:
              id v61 = v32;

              goto LABEL_82;
            }
LABEL_76:
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            uint64_t v103 = *MEMORY[0x1E4F1A528];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v118 = (uint64_t)v16;
              _os_log_impl(&dword_1C4CFF000, v103, OS_LOG_TYPE_INFO, "Successfully rolled keys for zone-wide share record PCS in zone %@", buf, 0xCu);
            }
            goto LABEL_80;
          }
LABEL_27:
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v64 = *MEMORY[0x1E4F1A528];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412546;
            uint64_t v118 = (uint64_t)v16;
            __int16 v119 = 2112;
            uint64_t v120 = (uint64_t)v32;
            _os_log_error_impl(&dword_1C4CFF000, v64, OS_LOG_TYPE_ERROR, "Failed to roll keys for zone-wide share record PCS in zone %@: %@", buf, 0x16u);
          }
          goto LABEL_81;
        }
LABEL_57:
        if (!v32) {
          goto LABEL_76;
        }
        goto LABEL_27;
      }
      *(_DWORD *)long long buf = 138412290;
      uint64_t v118 = (uint64_t)v32;
      char v66 = "Couldn't decode zone-wide share record PCS data for share roll: %@";
    }
    _os_log_error_impl(&dword_1C4CFF000, v65, OS_LOG_TYPE_ERROR, v66, buf, 0xCu);
    if (v27) {
      goto LABEL_39;
    }
    goto LABEL_57;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v60 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v118 = (uint64_t)v16;
    _os_log_error_impl(&dword_1C4CFF000, v60, OS_LOG_TYPE_ERROR, "Attempting to roll record PCS keys for zone-wide share in zone %@ but this operation is not permitted", buf, 0xCu);
  }
  id v61 = 0;
LABEL_82:

  return v61;
}

- (_OpaquePCSShareProtection)createRecordPCSWithZonePCS:(_OpaquePCSShareProtection *)a3 sharePCS:(_OpaquePCSShareProtection *)a4 createLite:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  uint64_t v57 = 0;
  uint64_t v58 = &v57;
  uint64_t v59 = 0x2020000000;
  uint64_t v60 = 0;
  uint64_t v53 = 0;
  uint64_t v54 = &v53;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = 0;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x3032000000;
  v51[3] = sub_1C4DC743C;
  v51[4] = sub_1C4DC744C;
  id v52 = 0;
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x2020000000;
  char v50 = 0;
  id v10 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
  id v11 = (void *)MEMORY[0x1E4F1A550];
  id v12 = (os_log_t *)MEMORY[0x1E4F1A528];
  if (!a3)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], a2, *MEMORY[0x1E4F19DD8], 5002, @"Can't create a record PCS with a nil zone PCS");
    uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = v20;
    if (a6)
    {
      uint64_t v18 = v20;
      *a6 = v18;
    }
    goto LABEL_27;
  }
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = sub_1C4DD8568;
  v45[3] = &unk_1E64F2CF8;
  BOOL v46 = a5;
  v45[4] = &v53;
  v45[5] = &v57;
  v45[6] = v51;
  v45[7] = self;
  v45[8] = a3;
  objc_msgSend__onSynchronizeQueue_(self, a2, (uint64_t)v45);
  if (v58[3] || !v54[3])
  {
    if (*v11 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], *v10);
    }
    uint64_t v15 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
    {
      int v25 = (_OpaquePCSShareProtection *)v58[3];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v62 = v25;
      _os_log_error_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_ERROR, "Couldn't create a new PCSShareProtectionRef: %@", buf, 0xCu);
    }
    objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(MEMORY[0x1E4F1A280], v16, *MEMORY[0x1E4F19DD8], 5002, 0, v58[3], 0, 0, @"Couldn't create a new record PCS");
    char v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = v17;
    if (a6) {
      *a6 = v17;
    }
    uint64_t v19 = (const void *)v54[3];
    if (!v19) {
      goto LABEL_27;
    }
    CFRelease(v19);
LABEL_11:
    v54[3] = 0;
    goto LABEL_27;
  }
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = sub_1C4DD86B4;
  v44[3] = &unk_1E64F2990;
  v44[4] = &v47;
  v44[5] = &v53;
  v44[6] = a3;
  objc_msgSend__onSynchronizeQueue_(self, v14, (uint64_t)v44);
  if (!*((unsigned char *)v48 + 24))
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v21, *MEMORY[0x1E4F19DD8], 5002, @"Couldn't add zone PCS to record PCS");
    uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = v23;
    if (a6) {
      *a6 = v23;
    }
    uint64_t v24 = (const void *)v54[3];
    if (!v24) {
      goto LABEL_27;
    }
    CFRelease(v24);
    goto LABEL_11;
  }
  if (!a4) {
    goto LABEL_18;
  }
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = sub_1C4DD86F0;
  v43[3] = &unk_1E64F2990;
  v43[4] = &v47;
  v43[5] = &v53;
  v43[6] = a4;
  objc_msgSend__onSynchronizeQueue_(self, v21, (uint64_t)v43);
  if (*((unsigned char *)v48 + 24))
  {
LABEL_18:
    uint64_t v18 = 0;
    goto LABEL_27;
  }
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v22, *MEMORY[0x1E4F19DD8], 5002, @"Couldn't add share PCS to record PCS");
  uint64_t v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = v26;
  if (a6) {
    *a6 = v26;
  }
  char v27 = (const void *)v54[3];
  if (v27)
  {
    CFRelease(v27);
    goto LABEL_11;
  }
LABEL_27:
  uint64_t v28 = (const void *)v58[3];
  if (v28)
  {
    CFRelease(v28);
    v58[3] = 0;
  }
  dispatch_block_t v29 = *v10;
  if (v54[3])
  {
    if (*v11 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v29);
    }
    os_log_t v30 = *v12;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v33 = &stru_1F2044F30;
      if (v7) {
        uint64_t v34 = @"lightweight ";
      }
      else {
        uint64_t v34 = &stru_1F2044F30;
      }
      if (a4) {
        int v35 = @" and share PCS ";
      }
      else {
        int v35 = &stru_1F2044F30;
      }
      if (a4)
      {
        objc_msgSend_description(a4, v31, v32);
        uint64_t v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      uint64_t v36 = v54[3];
      *(_DWORD *)long long buf = 138413314;
      uint64_t v62 = (_OpaquePCSShareProtection *)v34;
      __int16 v63 = 2114;
      uint64_t v64 = a3;
      __int16 v65 = 2114;
      char v66 = v35;
      __int16 v67 = 2112;
      uint64_t v68 = v33;
      __int16 v69 = 2112;
      uint64_t v70 = v36;
      _os_log_debug_impl(&dword_1C4CFF000, v30, OS_LOG_TYPE_DEBUG, "Created %@record PCS from zone PCS %{public}@%{public}@%@: %@.", buf, 0x34u);
      if (a4) {
    }
      }
  }
  else
  {
    if (*v11 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v29);
    }
    os_log_t v30 = *v12;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      char v41 = &stru_1F2044F30;
      if (a4) {
        uint64_t v42 = @" and share PCS ";
      }
      else {
        uint64_t v42 = &stru_1F2044F30;
      }
      if (a4)
      {
        objc_msgSend_description(a4, v37, v38);
        char v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)long long buf = 138413058;
      uint64_t v62 = a3;
      __int16 v63 = 2114;
      uint64_t v64 = (_OpaquePCSShareProtection *)v42;
      __int16 v65 = 2112;
      char v66 = v41;
      __int16 v67 = 2112;
      uint64_t v68 = v18;
      _os_log_error_impl(&dword_1C4CFF000, v30, OS_LOG_TYPE_ERROR, "Error creating record PCS from zone PCS %@%{public}@%@: %@", buf, 0x2Au);
      if (a4) {
    }
      }
  }

  os_log_t v39 = (_OpaquePCSShareProtection *)v54[3];
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(v51, 8);

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  return v39;
}

- (_OpaquePCSShareProtection)createRecordPCSWithEncryptedZonePCS:(__CFData *)a3 sharePCS:(_OpaquePCSShareProtection *)a4 createLite:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x2020000000;
  uint64_t v59 = 0;
  uint64_t v52 = 0;
  uint64_t v53 = &v52;
  uint64_t v54 = 0x2020000000;
  uint64_t v55 = 0;
  uint64_t v48 = 0;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  id v10 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
  id v11 = (void *)MEMORY[0x1E4F1A550];
  id v12 = (os_log_t *)MEMORY[0x1E4F1A528];
  if (!a3)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], a2, *MEMORY[0x1E4F19DD8], 5002, @"Can't create a record PCS with nil zone PCS data");
    uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = v20;
    if (a6)
    {
      uint64_t v18 = v20;
      *a6 = v18;
    }
    goto LABEL_29;
  }
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = sub_1C4DD8D74;
  v46[3] = &unk_1E64F2D20;
  BOOL v47 = a5;
  v46[4] = &v52;
  v46[5] = &v56;
  objc_msgSend__onSynchronizeQueue_(self, a2, (uint64_t)v46);
  if (v57[3] || !v53[3])
  {
    if (*v11 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], *v10);
    }
    uint64_t v15 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = (__CFData *)v57[3];
      *(_DWORD *)long long buf = 138412290;
      id v61 = v26;
      _os_log_error_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_ERROR, "Couldn't create a new PCSShareProtectionRef: %@", buf, 0xCu);
    }
    objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(MEMORY[0x1E4F1A280], v16, *MEMORY[0x1E4F19DD8], 5002, 0, v57[3], 0, 0, @"Couldn't create a new record PCS");
    char v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = v17;
    if (a6) {
      *a6 = v17;
    }
    uint64_t v19 = (const void *)v53[3];
    if (!v19) {
      goto LABEL_29;
    }
    CFRelease(v19);
LABEL_11:
    v53[3] = 0;
    goto LABEL_29;
  }
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = sub_1C4DD8E74;
  v45[3] = &unk_1E64F2D48;
  v45[4] = &v48;
  v45[5] = &v52;
  v45[6] = &v56;
  v45[7] = a3;
  objc_msgSend__onSynchronizeQueue_(self, v14, (uint64_t)v45);
  if (!*((unsigned char *)v49 + 24))
  {
    objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v21, *MEMORY[0x1E4F19DD8], 5002, v57[3], @"Couldn't add encrypted zone PCS to record PCS");
    uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = v23;
    if (a6) {
      *a6 = v23;
    }
    uint64_t v24 = (const void *)v57[3];
    if (v24)
    {
      CFRelease(v24);
      v57[3] = 0;
    }
    int v25 = (const void *)v53[3];
    if (!v25) {
      goto LABEL_29;
    }
    CFRelease(v25);
    goto LABEL_11;
  }
  if (!a4) {
    goto LABEL_18;
  }
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = sub_1C4DD8EC0;
  v44[3] = &unk_1E64F2990;
  v44[4] = &v48;
  v44[5] = &v52;
  v44[6] = a4;
  objc_msgSend__onSynchronizeQueue_(self, v21, (uint64_t)v44);
  if (*((unsigned char *)v49 + 24))
  {
LABEL_18:
    uint64_t v18 = 0;
    goto LABEL_29;
  }
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v22, *MEMORY[0x1E4F19DD8], 5002, @"Couldn't add share PCS to record PCS");
  char v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = v27;
  if (a6) {
    *a6 = v27;
  }
  uint64_t v28 = (const void *)v53[3];
  if (v28)
  {
    CFRelease(v28);
    goto LABEL_11;
  }
LABEL_29:
  dispatch_block_t v29 = (const void *)v57[3];
  if (v29)
  {
    CFRelease(v29);
    v57[3] = 0;
  }
  dispatch_block_t v30 = *v10;
  if (v53[3])
  {
    if (*v11 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v30);
    }
    uint64_t v31 = *v12;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v34 = &stru_1F2044F30;
      if (v7) {
        int v35 = @"lightweight ";
      }
      else {
        int v35 = &stru_1F2044F30;
      }
      if (a4) {
        uint64_t v36 = @" and share PCS ";
      }
      else {
        uint64_t v36 = &stru_1F2044F30;
      }
      if (a4)
      {
        objc_msgSend_description(a4, v32, v33);
        uint64_t v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      uint64_t v37 = v53[3];
      *(_DWORD *)long long buf = 138413314;
      id v61 = (__CFData *)v35;
      __int16 v62 = 2114;
      __int16 v63 = a3;
      __int16 v64 = 2114;
      __int16 v65 = v36;
      __int16 v66 = 2112;
      __int16 v67 = v34;
      __int16 v68 = 2112;
      uint64_t v69 = v37;
      _os_log_debug_impl(&dword_1C4CFF000, v31, OS_LOG_TYPE_DEBUG, "Created %@record PCS from zone PCS data %{public}@%{public}@%@: %@.", buf, 0x34u);
      if (a4) {
    }
      }
  }
  else
  {
    if (*v11 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v30);
    }
    uint64_t v31 = *v12;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      uint64_t v42 = &stru_1F2044F30;
      if (a4) {
        uint64_t v43 = @" and share PCS ";
      }
      else {
        uint64_t v43 = &stru_1F2044F30;
      }
      if (a4)
      {
        objc_msgSend_description(a4, v38, v39);
        uint64_t v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)long long buf = 138413058;
      id v61 = a3;
      __int16 v62 = 2114;
      __int16 v63 = (__CFData *)v43;
      __int16 v64 = 2112;
      __int16 v65 = v42;
      __int16 v66 = 2112;
      __int16 v67 = v18;
      _os_log_error_impl(&dword_1C4CFF000, v31, OS_LOG_TYPE_ERROR, "Error creating record PCS from zone PCS %@%{public}@%@: %@.", buf, 0x2Au);
      if (a4) {
    }
      }
  }

  uint64_t v40 = (_OpaquePCSShareProtection *)v53[3];
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);
  return v40;
}

- (id)dataFromRecordPCS:(_OpaquePCSShareProtection *)a3 error:(id *)a4
{
  unint64_t v4 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_1C4DC743C;
  uint64_t v21 = sub_1C4DC744C;
  id v22 = 0;
  if (a3)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1C4DD922C;
    v16[3] = &unk_1E64F2990;
    v16[5] = &v23;
    v16[6] = a3;
    v16[4] = &v17;
    objc_msgSend__onSynchronizeQueue_(self, a2, (uint64_t)v16);
    if (v24[3] || !v18[5])
    {
      BOOL v7 = objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(MEMORY[0x1E4F1A280], v6, *MEMORY[0x1E4F19DD8], 5002, 0, @"Couldn't encode record PCS data");
      BOOL v8 = v7;
      if (a4) {
        *a4 = v7;
      }
      id v9 = (void *)v18[5];
      v18[5] = 0;

      id v10 = (const void *)v24[3];
      if (v10)
      {
        CFRelease(v10);
        v24[3] = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
    id v11 = (void *)*MEMORY[0x1E4F1A548];
    if (v18[5])
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v11);
      }
      id v12 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
      {
        id v13 = (void *)v18[5];
        *(_DWORD *)long long buf = 138412546;
        uint64_t v28 = v4;
        __int16 v29 = 2112;
        dispatch_block_t v30 = v13;
        _os_log_debug_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_DEBUG, "Created data from record PCS %@: %@", buf, 0x16u);
      }
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v11);
      }
      uint64_t v14 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412546;
        uint64_t v28 = v4;
        __int16 v29 = 2112;
        dispatch_block_t v30 = v8;
        _os_log_error_impl(&dword_1C4CFF000, v14, OS_LOG_TYPE_ERROR, "Error creating PCS data from record PCS %@: %@", buf, 0x16u);
      }
    }
    unint64_t v4 = (_OpaquePCSShareProtection *)(id)v18[5];
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v4;
}

- (_OpaquePCSShareProtection)createPCSObjectFromData:(id)a3 ofType:(unint64_t)a4 sharedToPCS:(_OpaquePCSShareProtection *)a5 logFailure:(BOOL)a6 trusts:(id)a7 error:(id *)a8
{
  BOOL v10 = a6;
  v59[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v16 = a7;
  CFTypeRef cf = 0;
  if (v14)
  {
    uint64_t v19 = objc_msgSend__pcsObjectKindForCKDPCSBlobType_(self, v15, a4);
    if (!a5)
    {
      uint64_t v33 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v17, *MEMORY[0x1E4F19DD8], 5002, @"Can't create a PCS object without a share PCS");
      id v32 = v33;
      if (a8)
      {
        id v32 = v33;
        *a8 = v32;
      }
      goto LABEL_27;
    }
    if (v16 && objc_msgSend_count(v16, v17, v18))
    {
      uint64_t v58 = *MEMORY[0x1E4F93EC8];
      v59[0] = v19;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v17, (uint64_t)v59, &v58, 1);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      id v21 = v16;
      uint64_t v24 = v21;
      uint64_t v47 = 0;
      uint64_t v48 = &v47;
      uint64_t v49 = 0x2020000000;
      uint64_t v25 = (uint64_t (*)(_OpaquePCSShareProtection *, id, id, void *, CFTypeRef *))off_1EA3D1040;
      uint64_t v50 = off_1EA3D1040;
      if (!off_1EA3D1040)
      {
        *(void *)long long buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = sub_1C4DE7BD0;
        uint64_t v52 = (_OpaquePCSShareProtection *)&unk_1E64F3118;
        *(void *)uint64_t v53 = &v47;
        uint64_t v26 = sub_1C4DE7A08((uint64_t)v21, v22, v23);
        char v27 = dlsym(v26, "PCSObjectCreateFromExportedWithKeyedPCSAndOptionsWithTrusts");
        *(void *)(*(void *)(*(void *)v53 + 8) + 24) = v27;
        off_1EA3D1040 = *(_UNKNOWN **)(*(void *)(*(void *)v53 + 8) + 24);
        uint64_t v25 = (uint64_t (*)(_OpaquePCSShareProtection *, id, id, void *, CFTypeRef *))v48[3];
      }
      _Block_object_dispose(&v47, 8);
      if (!v25)
      {
        char v41 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v28, v29);
        uint64_t v43 = objc_msgSend_stringWithUTF8String_(NSString, v42, (uint64_t)"PCSShareProtectionRef CKPCSObjectCreateFromExportedWithKeyedPCSAndOptionsWithTrusts(PCSShareProtectionRef, NSDictionary<PCSFPOption,id> *__strong, CFDataRef, NSArray *__strong, CFErrorRef *)");
        id v44 = dlerror();
        objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v41, v45, (uint64_t)v43, @"CKDPCSManager.m", 66, @"%s", v44);

        __break(1u);
      }
      dispatch_block_t v30 = (_OpaquePCSShareProtection *)v25(a5, v20, v14, v24, &cf);
    }
    else
    {
      uint64_t v56 = *MEMORY[0x1E4F93EC8];
      uint64_t v57 = v19;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v17, (uint64_t)&v57, &v56, 1);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      dispatch_block_t v30 = (_OpaquePCSShareProtection *)PCSObjectCreateFromExportedWithKeyedPCSAndOptions();
    }

    if (v30 && !cf)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v31 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138543874;
        *(void *)&uint8_t buf[4] = v14;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v30;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v52 = a5;
        _os_log_debug_impl(&dword_1C4CFF000, v31, OS_LOG_TYPE_DEBUG, "Created PCS object from data (%{public}@): %@. Share PCS was %@", buf, 0x20u);
      }
      id v32 = 0;
LABEL_39:

      goto LABEL_40;
    }
    uint64_t v34 = objc_opt_class();
    objc_msgSend_noMatchingIdentityErrorForPCSError_withErrorCode_description_(v34, v35, (uint64_t)cf, 5004, @"Failed to decrypt PCS data");
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      if (!a8) {
        goto LABEL_22;
      }
    }
    else
    {
      objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v36, *MEMORY[0x1E4F19DD8], 5002, cf, @"Couldn't create PCS object from data");
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      if (!a8)
      {
LABEL_22:
        if (!v30) {
          goto LABEL_27;
        }
        goto LABEL_26;
      }
    }
    *a8 = v32;
    if (!v30)
    {
LABEL_27:
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      if (v10)
      {
        uint64_t v37 = (_OpaquePCSShareProtection *)PCSFPCreatePEMData();
        if (a5) {
          uint64_t v38 = (void *)PCSShareProtectionCopyPublicKeys();
        }
        else {
          uint64_t v38 = 0;
        }
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v39 = *MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138413314;
          *(void *)&uint8_t buf[4] = v32;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = a5;
          *(_WORD *)&buf[22] = 2112;
          uint64_t v52 = v37;
          *(_WORD *)uint64_t v53 = 2112;
          *(void *)&v53[2] = v38;
          __int16 v54 = 2112;
          id v55 = v14;
          _os_log_error_impl(&dword_1C4CFF000, v39, OS_LOG_TYPE_ERROR, "Error creating PCS object: %@.\nShare PCS was %@.\nPEM data was %@.\nShare PCS public keys were %@\nExported PCS data was %@", buf, 0x34u);
        }
      }
      dispatch_block_t v30 = 0;
      goto LABEL_39;
    }
LABEL_26:
    CFRelease(v30);
    goto LABEL_27;
  }
  dispatch_block_t v30 = 0;
LABEL_40:

  return v30;
}

- (_OpaquePCSShareProtection)createPCSObjectFromData:(id)a3 ofType:(unint64_t)a4 sharedToPCS:(_OpaquePCSShareProtection *)a5 logFailure:(BOOL)a6 error:(id *)a7
{
  return (_OpaquePCSShareProtection *)MEMORY[0x1F4181798](self, sel_createPCSObjectFromData_ofType_sharedToPCS_logFailure_trusts_error_, a3);
}

- (_OpaquePCSShareProtection)createPCSObjectFromData:(id)a3 ofType:(unint64_t)a4 sharedToPCS:(_OpaquePCSShareProtection *)a5 error:(id *)a6
{
  return (_OpaquePCSShareProtection *)objc_msgSend_createPCSObjectFromData_ofType_sharedToPCS_logFailure_error_(self, a2, (uint64_t)a3, a4, a5, 0, a6);
}

- (_OpaquePCSShareProtection)createPCSObjectFromData:(id)a3 ofType:(unint64_t)a4 sharedToPCS:(_OpaquePCSShareProtection *)a5 trusts:(id)a6 error:(id *)a7
{
  return (_OpaquePCSShareProtection *)MEMORY[0x1F4181798](self, sel_createPCSObjectFromData_ofType_sharedToPCS_logFailure_trusts_error_, a3);
}

- (BOOL)recordProtectionDataNeedsCounterSign:(id)a3 error:(id *)a4
{
  id v5 = a3;
  BOOL v8 = v5;
  cf[0] = 0;
  uint64_t v26 = 0;
  char v27 = &v26;
  uint64_t v28 = 0x2020000000;
  id v9 = (uint64_t (*)(void *, CFTypeRef *))off_1EA3D1048;
  uint64_t v29 = off_1EA3D1048;
  if (!off_1EA3D1048)
  {
    cf[1] = (CFTypeRef)MEMORY[0x1E4F143A8];
    cf[2] = (CFTypeRef)3221225472;
    cf[3] = sub_1C4DE7C20;
    cf[4] = &unk_1E64F3118;
    uint64_t v25 = &v26;
    BOOL v10 = sub_1C4DE7A08((uint64_t)v5, v6, v7);
    v27[3] = (uint64_t)dlsym(v10, "PCSNeedsRollAndCounterSign");
    off_1EA3D1048 = *(_UNKNOWN **)(v25[1] + 24);
    id v9 = (uint64_t (*)(void *, CFTypeRef *))v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (v9)
  {
    char v13 = v9(v8, cf);
    if (cf[0])
    {
      id v14 = objc_opt_class();
      uint64_t v17 = objc_msgSend_noMatchingIdentityErrorForPCSError_withErrorCode_description_(v14, v15, (uint64_t)cf[0], 5004, @"Failed to decrypt PCS data when checking if counter-signature is necessary");
      if (!v17)
      {
        uint64_t v17 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v16, *MEMORY[0x1E4F19DD8], 5002, cf[0], @"Couldn't create PCS object from data when checking if counter-signature is necessary");
      }
      if (a4) {
        *a4 = v17;
      }
      CFRelease(cf[0]);
    }
    return v13;
  }
  else
  {
    uint64_t v19 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v11, v12);
    id v21 = objc_msgSend_stringWithUTF8String_(NSString, v20, (uint64_t)"_Bool CKPCSNeedsRollAndCounterSign(CFDataRef, CFErrorRef *)");
    id v22 = dlerror();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v19, v23, (uint64_t)v21, @"CKDPCSManager.m", 67, @"%s", v22);

    __break(1u);
  }
  return result;
}

- (BOOL)addSharePCS:(_OpaquePCSShareProtection *)a3 toRecordPCS:(_OpaquePCSShareProtection *)a4 permission:(unint64_t)a5 error:(id *)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    char v27 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1C4CFF000, v27, OS_LOG_TYPE_INFO, "Refusing to add a nil share PCS to a record PCS", buf, 2u);
    }
    if (a6)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v28, *MEMORY[0x1E4F19DD8], 5005, @"You can't add a nil share PCS to a record PCS");
      uint64_t v29 = (_OpaquePCSShareProtection *)(id)objc_claimAutoreleasedReturnValue();
LABEL_23:
      uint64_t v23 = 0;
      uint64_t v26 = 0;
LABEL_37:
      BOOL v34 = 0;
      *a6 = v29;
      goto LABEL_44;
    }
LABEL_24:
    uint64_t v23 = 0;
    uint64_t v26 = 0;
    goto LABEL_38;
  }
  BOOL v8 = (void **)MEMORY[0x1E4F1A548];
  id v9 = (void *)*MEMORY[0x1E4F1A548];
  BOOL v10 = (void *)MEMORY[0x1E4F1A550];
  uint64_t v11 = *MEMORY[0x1E4F1A550];
  uint64_t v12 = (os_log_t *)MEMORY[0x1E4F1A528];
  if (!a4)
  {
    if (v11 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v9);
    }
    dispatch_block_t v30 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1C4CFF000, v30, OS_LOG_TYPE_INFO, "Refusing to add a share PCS to a nil record PCS", buf, 2u);
    }
    if (a6)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v31, *MEMORY[0x1E4F19DD8], 5005, @"You can't add a share PCS to a nil record PCS");
      uint64_t v29 = (_OpaquePCSShareProtection *)(id)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  if (v11 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], v9);
  }
  id v16 = *v12;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = v16;
    uint64_t v18 = CKStringFromSharePermission(a5);
    *(_DWORD *)long long buf = 138543874;
    *(void *)&uint8_t buf[4] = v18;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v39 = a4;
    _os_log_impl(&dword_1C4CFF000, v17, OS_LOG_TYPE_INFO, "Adding %{public}@ share PCS\n%@\nTo PCS\n%@", buf, 0x20u);
  }
  id v20 = (const void *)PCSFPCopyCurrentPrivateKey();
  if (v20)
  {
    id v22 = (const void *)PCSIdentityCopyPublicIdentity();
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    LOBYTE(v39) = 0;
    if (v22)
    {
      uint64_t v23 = PCSPublicIdentityGetPublicID();
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = sub_1C4DD9F30;
      v37[3] = &unk_1E64F2D70;
      v37[4] = buf;
      v37[5] = a4;
      v37[6] = v22;
      v37[7] = a5;
      objc_msgSend__onSynchronizeQueue_(self, v24, (uint64_t)v37);
      if (*(unsigned char *)(*(void *)&buf[8] + 24))
      {
        uint64_t v26 = 0;
      }
      else
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v25, *MEMORY[0x1E4F19DD8], 5002, @"Couldn't add share PCS to record PCS");
        uint64_t v26 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
      }
      CFRelease(v22);
    }
    else
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v21, *MEMORY[0x1E4F19DD8], 5002, @"Couldn't get a public identity from the share PCS");
      uint64_t v26 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = 0;
    }
    CFRelease(v20);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v19, *MEMORY[0x1E4F19DD8], 5002, @"Couldn't get a private identity from the share PCS");
    uint64_t v26 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = 0;
  }
  id v32 = *v8;
  if (v26)
  {
    if (*v10 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v32);
    }
    uint64_t v33 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412802;
      *(void *)&uint8_t buf[4] = a3;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = a4;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v39 = v26;
      _os_log_impl(&dword_1C4CFF000, v33, OS_LOG_TYPE_INFO, "Warn: Unable to add share PCS (%@) to record PCS (%@): %@", buf, 0x20u);
    }
    if (a6)
    {
      uint64_t v29 = v26;
      uint64_t v26 = v29;
      goto LABEL_37;
    }
LABEL_38:
    BOOL v34 = 0;
    goto LABEL_44;
  }
  if (*v10 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], v32);
  }
  int v35 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412802;
    *(void *)&uint8_t buf[4] = a3;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v23;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v39 = a4;
    _os_log_debug_impl(&dword_1C4CFF000, v35, OS_LOG_TYPE_DEBUG, "Added share PCS %@ (%@) to record PCS %@.", buf, 0x20u);
  }
  uint64_t v26 = 0;
  BOOL v34 = 1;
LABEL_44:

  return v34;
}

- (BOOL)addSharePCS:(_OpaquePCSShareProtection *)a3 toRecordPCS:(_OpaquePCSShareProtection *)a4 error:(id *)a5
{
  return objc_msgSend_addSharePCS_toRecordPCS_permission_error_(self, a2, (uint64_t)a3, a4, 0, a5);
}

- (BOOL)updateSigningIdentityOnPCS:(_OpaquePCSShareProtection *)a3 usingSignedPCS:(_OpaquePCSShareProtection *)a4
{
  uint64_t v6 = PCSFPGetAuthorshipIdentity();
  uint64_t v8 = v6;
  if (v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1C4DDA018;
    v10[3] = &unk_1E64F2D90;
    v10[4] = a3;
    v10[5] = v6;
    objc_msgSend__onSynchronizeQueue_(self, v7, (uint64_t)v10);
  }
  return v8 != 0;
}

- (BOOL)removeSharePCS:(_OpaquePCSShareProtection *)a3 fromRecordPCS:(_OpaquePCSShareProtection *)a4 error:(id *)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)MEMORY[0x1E4F1A550];
  if (!a3)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v18 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_INFO, "Refusing to remove a nil share PCS from a record PCS", buf, 2u);
    }
    if (a5)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v19, *MEMORY[0x1E4F19DD8], 5005, @"You can't remove a nil share PCS from a record PCS");
      id v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:
      BOOL v23 = 0;
      *a5 = v20;
      return v23;
    }
    return 0;
  }
  uint64_t v8 = (void **)MEMORY[0x1E4F1A548];
  id v9 = (void *)*MEMORY[0x1E4F1A548];
  uint64_t v10 = *MEMORY[0x1E4F1A550];
  if (!a4)
  {
    if (v10 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v9);
    }
    id v21 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1C4CFF000, v21, OS_LOG_TYPE_INFO, "Refusing to remove a share PCS from a nil record PCS", buf, 2u);
    }
    if (a5)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v22, *MEMORY[0x1E4F19DD8], 5005, @"You can't remove a share PCS from a nil record PCS");
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    return 0;
  }
  if (v10 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], v9);
  }
  char v13 = (os_log_t *)MEMORY[0x1E4F1A528];
  id v14 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = a3;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = a4;
    _os_log_impl(&dword_1C4CFF000, v14, OS_LOG_TYPE_INFO, "Removing share PCS\n%@\nFrom PCS\n%@", buf, 0x16u);
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  char v41 = 1;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_1C4DDA4B4;
  v29[3] = &unk_1E64F2CA8;
  v29[6] = a4;
  v29[7] = a3;
  v29[4] = buf;
  v29[5] = &v30;
  objc_msgSend__onSynchronizeQueue_(self, v15, (uint64_t)v29);
  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v16, *MEMORY[0x1E4F19DD8], 5002, v31[3], @"Couldn't remove share PCS from record PCS");
  }
  uint64_t v24 = (const void *)v31[3];
  if (v24)
  {
    CFRelease(v24);
    v31[3] = 0;
  }
  BOOL v23 = v17 == 0;
  uint64_t v25 = *v8;
  if (v17)
  {
    if (*v6 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v25);
    }
    uint64_t v26 = *v13;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)BOOL v34 = 138412802;
      int v35 = a3;
      __int16 v36 = 2112;
      uint64_t v37 = a4;
      __int16 v38 = 2112;
      uint64_t v39 = v17;
      _os_log_impl(&dword_1C4CFF000, v26, OS_LOG_TYPE_INFO, "Warn: Unable to remove share PCS (%@) from record PCS (%@): %@", v34, 0x20u);
    }
    if (a5) {
      *a5 = v17;
    }
  }
  else
  {
    if (*v6 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v25);
    }
    char v27 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)BOOL v34 = 138412546;
      int v35 = a3;
      __int16 v36 = 2112;
      uint64_t v37 = a4;
      _os_log_debug_impl(&dword_1C4CFF000, v27, OS_LOG_TYPE_DEBUG, "Removed share PCS %@ from record PCS %@.", v34, 0x16u);
    }
  }
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(buf, 8);

  return v23;
}

- (unint64_t)removePCSKeys:(id)a3 fromPCS:(_OpaquePCSShareProtection *)a4 withProtectionEtag:(id)a5 forOperation:(id)a6
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a6;
  uint64_t v77 = v9;
  if (v8)
  {
    id v74 = v10;
    if ((objc_msgSend_isEmpty(v8, v11, v12) & 1) == 0)
    {
      if (v9
        && (objc_msgSend_etag(v8, v13, v14),
            id v16 = objc_claimAutoreleasedReturnValue(),
            char isEqualToString = objc_msgSend_isEqualToString_(v9, v17, (uint64_t)v16),
            v16,
            (isEqualToString & 1) == 0))
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        __int16 v67 = (void *)*MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
        {
          __int16 v68 = v67;
          uint64_t v71 = objc_msgSend_etag(v8, v69, v70);
          *(_DWORD *)long long buf = 138412546;
          *(void *)id v115 = v9;
          *(_WORD *)&v115[8] = 2112;
          *(void *)&v115[10] = v71;
          _os_log_impl(&dword_1C4CFF000, v68, OS_LOG_TYPE_INFO, "Skipping PCS key removal due to PCS etag mismatch. current: %@, expected: %@", buf, 0x16u);
        }
      }
      else
      {
        if (a4)
        {
          uint64_t v19 = objc_msgSend_sizeOfPCS_(self, v13, (uint64_t)a4);
          uint64_t v110 = 0;
          id v111 = &v110;
          uint64_t v112 = 0x2020000000;
          uint64_t v113 = 0;
          uint64_t v106 = 0;
          id v107 = &v106;
          uint64_t v108 = 0x2020000000;
          uint64_t v109 = 0;
          uint64_t v102 = 0;
          uint64_t v103 = &v102;
          uint64_t v104 = 0x2020000000;
          uint64_t v105 = 0;
          uint64_t v96 = 0;
          uint64_t v97 = &v96;
          uint64_t v98 = 0x3032000000;
          uint64_t v99 = sub_1C4DC743C;
          char v100 = sub_1C4DC744C;
          id v101 = (id)objc_opt_new();
          uint64_t v90 = 0;
          char v91 = &v90;
          uint64_t v92 = 0x3032000000;
          uint64_t v93 = sub_1C4DC743C;
          uint64_t v94 = sub_1C4DC744C;
          uint64_t v73 = v19;
          id v95 = (id)objc_opt_new();
          uint64_t v84 = 0;
          id v85 = &v84;
          uint64_t v86 = 0x3032000000;
          uint64_t v87 = sub_1C4DC743C;
          uint64_t v88 = sub_1C4DC744C;
          id v89 = (id)objc_opt_new();
          long long v80 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          id v22 = objc_msgSend_keys(v8, v20, v21);
          uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v80, v122, 16);
          if (v26)
          {
            char v27 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
            uint64_t v28 = *(void *)v81;
            uint64_t v29 = (id *)MEMORY[0x1E4F1A528];
            do
            {
              uint64_t v30 = 0;
              do
              {
                if (*(void *)v81 != v28) {
                  objc_enumerationMutation(v22);
                }
                uint64_t v31 = *(void **)(*((void *)&v80 + 1) + 8 * v30);
                uint64_t v32 = objc_msgSend_keyType(v31, v24, v25, v73);
                switch(v32)
                {
                  case 1:
                    uint64_t v40 = (void *)v97[5];
                    __int16 v36 = objc_msgSend_pcsKeyID(v31, v33, v34);
                    objc_msgSend_addObject_(v40, v41, (uint64_t)v36);
                    break;
                  case 2:
                    __int16 v38 = (void *)v91[5];
                    __int16 v36 = objc_msgSend_pcsKeyID(v31, v33, v34);
                    objc_msgSend_addObject_(v38, v39, (uint64_t)v36);
                    break;
                  case 3:
                    int v35 = (void *)v85[5];
                    __int16 v36 = objc_msgSend_pcsKeyID(v31, v33, v34);
                    objc_msgSend_addObject_(v35, v37, (uint64_t)v36);
                    break;
                  default:
                    if (*v27 != -1) {
                      dispatch_once(v27, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
                    }
                    __int16 v36 = *v29;
                    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                    {
                      int v44 = objc_msgSend_keyType(v31, v42, v43);
                      *(_DWORD *)long long buf = 67109378;
                      *(_DWORD *)id v115 = v44;
                      *(_WORD *)&v115[4] = 2112;
                      *(void *)&v115[6] = v31;
                      _os_log_debug_impl(&dword_1C4CFF000, v36, OS_LOG_TYPE_DEBUG, "Unrecognized key type (%d), ignoring %@", buf, 0x12u);
                    }
                    break;
                }

                ++v30;
              }
              while (v26 != v30);
              uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v24, (uint64_t)&v80, v122, 16);
            }
            while (v26);
          }

          v79[0] = MEMORY[0x1E4F143A8];
          v79[1] = 3221225472;
          v79[2] = sub_1C4DDAD98;
          v79[3] = &unk_1E64F2DE0;
          v79[4] = &v96;
          v79[5] = &v106;
          v79[6] = &v90;
          v79[7] = &v110;
          v79[8] = &v84;
          v79[9] = &v102;
          v79[10] = a4;
          objc_msgSend__onSynchronizeQueue_(self, v45, (uint64_t)v79);
          unint64_t v15 = v107[3] + v111[3] + v103[3];
          if (v15)
          {
            uint64_t v48 = objc_msgSend_sizeOfPCS_(self, v46, (uint64_t)a4);
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            uint64_t v49 = *MEMORY[0x1E4F1A528];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
            {
              uint64_t v50 = v103[3];
              uint64_t v51 = v111[3];
              uint64_t v52 = v107[3];
              *(_DWORD *)long long buf = 134219008;
              *(void *)id v115 = v50;
              *(_WORD *)&v115[8] = 2048;
              *(void *)&v115[10] = v51;
              __int16 v116 = 2048;
              uint64_t v117 = v52;
              __int16 v118 = 2048;
              uint64_t v119 = v73;
              __int16 v120 = 2048;
              uint64_t v121 = v48;
              _os_log_impl(&dword_1C4CFF000, v49, OS_LOG_TYPE_INFO, "Removed %zu sharee public identities, %zu unused key pairs and %zu unused primary keys from the PCS, reducing the size from %zu to %zu bytes.", buf, 0x34u);
            }
          }
          uint64_t v53 = objc_msgSend_keys(v8, v46, v47, v73);
          uint64_t v56 = objc_msgSend_count(v53, v54, v55);

          if (v56 != v15)
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            unint64_t v57 = v56 - v15;
            uint64_t v58 = (id)*MEMORY[0x1E4F1A528];
            if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
            {
              id v61 = objc_msgSend_keys(v8, v59, v60);
              uint64_t v64 = objc_msgSend_count(v61, v62, v63);
              *(_DWORD *)long long buf = 134218240;
              *(void *)id v115 = v57;
              *(_WORD *)&v115[8] = 2048;
              *(void *)&v115[10] = v64;
              _os_log_impl(&dword_1C4CFF000, v58, OS_LOG_TYPE_INFO, "Warn: %zu of the %zu keys to remove were not removed from the PCS.", buf, 0x16u);
            }
            v78[0] = MEMORY[0x1E4F143A8];
            v78[1] = 3221225472;
            v78[2] = sub_1C4DDBA08;
            v78[3] = &unk_1E64F2E00;
            v78[4] = v57;
            objc_msgSend_updateCloudKitMetrics_(v74, v65, (uint64_t)v78);
          }
          _Block_object_dispose(&v84, 8);

          _Block_object_dispose(&v90, 8);
          _Block_object_dispose(&v96, 8);

          _Block_object_dispose(&v102, 8);
          _Block_object_dispose(&v106, 8);
          _Block_object_dispose(&v110, 8);
          goto LABEL_37;
        }
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v72 = *MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1C4CFF000, v72, OS_LOG_TYPE_INFO, "Warn: Cannot remove keys from PCS, it has not yet been decrypted.", buf, 2u);
        }
      }
    }
    unint64_t v15 = 0;
LABEL_37:
    id v10 = v74;
    goto LABEL_38;
  }
  unint64_t v15 = 0;
LABEL_38:

  return v15;
}

- (_OpaquePCSShareProtection)createEmptySignedSharePCSOfType:(unint64_t)a3 forPCSServiceType:(unint64_t)a4 withError:(id *)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  id v9 = objc_msgSend_identityManager(self, a2, a3);
  uint64_t v11 = objc_msgSend_PCSServiceStringFromCKServiceType_(v9, v10, a4);

  uint64_t v13 = objc_msgSend__pcsObjectKindForCKDPCSBlobType_(self, v12, a3);
  id v16 = objc_msgSend_identityManager(self, v14, v15);
  id v45 = 0;
  uint64_t v18 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(v16, v17, a4, 1, &v45);
  id v19 = v45;

  id v20 = (void *)MEMORY[0x1E4F1A550];
  uint64_t v21 = (os_log_t *)MEMORY[0x1E4F1A528];
  int v44 = (void *)v13;
  if (v19 || !v18)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v33 = *v21;
    if (os_log_type_enabled(*v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v50 = v19;
      _os_log_impl(&dword_1C4CFF000, v33, OS_LOG_TYPE_INFO, "Failed to get signing identity set in createEmptySignedSharePCSForServiceType:withError: %@", buf, 0xCu);
    }
    uint64_t v32 = v20;
    if (!v19)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v34, *MEMORY[0x1E4F19DD8], 5000, @"Couldn't create a PCS identity");
      id v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v26 = 0;
    uint64_t v29 = 0;
    int v35 = 0;
    __int16 v36 = 0;
    uint64_t v24 = v18;
    if (v18) {
      goto LABEL_27;
    }
  }
  else
  {
    uint64_t v22 = PCSIdentitySetCopyCurrentIdentityWithError();
    uint64_t v24 = (const void *)v22;
    if (v22 && !cf)
    {
      uint64_t v25 = *MEMORY[0x1E4F93EC0];
      v47[0] = *MEMORY[0x1E4F93EE8];
      v47[1] = v25;
      v48[0] = v11;
      v48[1] = v22;
      v47[2] = *MEMORY[0x1E4F93EC8];
      v48[2] = v13;
      uint64_t v26 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v23, (uint64_t)v48, v47, 3);
      uint64_t v27 = PCSFPCreate();
      uint64_t v29 = (_OpaquePCSShareProtection *)v27;
      if (cf || !v27)
      {
        uint64_t v37 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v28, *MEMORY[0x1E4F19DD8], 5002);
        id v19 = v37;
        if (a5) {
          *a5 = v37;
        }
        if (v29)
        {
          uint64_t v32 = v20;
          CFRelease(v29);
          uint64_t v29 = 0;
          goto LABEL_26;
        }
      }
      else
      {
        uint64_t v30 = (const void *)PCSFPCreatePrivateKey();
        if (v30)
        {
          uint64_t v32 = v20;
          CFRelease(v30);
          id v19 = 0;
LABEL_26:
          CFRelease(v18);
          goto LABEL_27;
        }
        __int16 v38 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v31, *MEMORY[0x1E4F19DD8], 5005, @"Failed to add a protection key to the share");
        id v19 = v38;
        if (a5)
        {
          uint64_t v32 = v20;
          id v19 = v38;
          *a5 = v19;
          goto LABEL_26;
        }
      }
      uint64_t v32 = v20;
      goto LABEL_26;
    }
    uint64_t v32 = v20;
    objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v23, *MEMORY[0x1E4F19DD8], 5000, cf);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    CFRelease(v18);
    uint64_t v26 = 0;
    uint64_t v29 = 0;
    int v35 = 0;
    __int16 v36 = 0;
    if (v24)
    {
LABEL_27:
      CFRelease(v24);
      int v35 = (void *)v26;
      __int16 v36 = v29;
    }
  }
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (!v36 || v19)
  {
    if (*v32 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v40 = v44;
    uint64_t v42 = *v21;
    if (os_log_type_enabled(*v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v50 = v19;
      _os_log_impl(&dword_1C4CFF000, v42, OS_LOG_TYPE_INFO, "Warn: Error creating a share PCS: %@", buf, 0xCu);
    }
    if (a5) {
      *a5 = v19;
    }
    if (v36)
    {
      CFRelease(v36);
      __int16 v36 = 0;
    }
  }
  else
  {
    uint64_t v39 = (void *)PCSFPCopyDiagnostic();
    if (*v32 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v40 = v44;
    char v41 = *v21;
    if (os_log_type_enabled(*v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v50 = v39;
      _os_log_impl(&dword_1C4CFF000, v41, OS_LOG_TYPE_INFO, "Created a new signed share PCS: %@", buf, 0xCu);
    }

    id v19 = 0;
  }

  return v36;
}

- (_OpaquePCSShareProtection)createEmptySharePCSOfType:(unint64_t)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend__pcsObjectKindForCKDPCSBlobType_(self, a2, a3);
  uint64_t v22 = *MEMORY[0x1E4F93EC8];
  v23[0] = v5;
  uint64_t v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v6, (uint64_t)v23, &v22, 1);
  id v8 = (_OpaquePCSShareProtection *)PCSFPCreate();

  if (v8)
  {
    id v10 = (const void *)PCSFPCreatePrivateKey();
    if (v10)
    {
      CFRelease(v10);
      id v12 = 0;
    }
    else
    {
      uint64_t v14 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v11, *MEMORY[0x1E4F19DD8], 5005, @"Failed to add a protection key to the share");
      id v12 = v14;
      if (a4)
      {
        id v12 = v14;
        *a4 = v12;
      }
    }
  }
  else
  {
    uint64_t v13 = objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(MEMORY[0x1E4F1A280], v9, *MEMORY[0x1E4F19DD8], 5002, 0, @"Couldn't create a new PCSShareProtectionRef");
    id v12 = v13;
    if (a4) {
      *a4 = v13;
    }
  }
  if (v8) {
    BOOL v15 = v12 == 0;
  }
  else {
    BOOL v15 = 0;
  }
  if (v15)
  {
    uint64_t v17 = (void *)PCSFPCopyDiagnostic();
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v18 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v21 = v17;
      _os_log_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_INFO, "Created a new share PCS: %@", buf, 0xCu);
    }

    id v12 = 0;
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v16 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v21 = v12;
      _os_log_impl(&dword_1C4CFF000, v16, OS_LOG_TYPE_INFO, "Warn: Error creating a share PCS: %@", buf, 0xCu);
    }
    if (a4) {
      *a4 = v12;
    }
    if (v8)
    {
      CFRelease(v8);
      id v8 = 0;
    }
  }

  return v8;
}

- (void)setOwnerIdentity:(_PCSPublicIdentityData *)a3 onPCS:(_OpaquePCSShareProtection *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v7 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    uint64_t v11 = a3;
    __int16 v12 = 2112;
    uint64_t v13 = a4;
    _os_log_impl(&dword_1C4CFF000, v7, OS_LOG_TYPE_INFO, "Setting owner public identity %@ on pcs %@", buf, 0x16u);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C4DDC364;
  v9[3] = &unk_1E64F2D90;
  v9[4] = a4;
  v9[5] = a3;
  objc_msgSend__onSynchronizeQueue_(self, v8, (uint64_t)v9);
}

- (BOOL)_addPublicIdentityForService:(unint64_t)a3 toSharePCS:(_OpaquePCSShareProtection *)a4 withError:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  CFTypeRef v32 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  id v9 = objc_msgSend_identityManager(self, a2, a3);
  id v27 = 0;
  uint64_t v11 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(v9, v10, a3, 1, &v27);
  id v12 = v27;

  if (!v11 || v12)
  {
    if (!v11) {
      goto LABEL_20;
    }
    uint64_t v17 = 0;
  }
  else
  {
    BOOL v15 = objc_msgSend_identityManager(self, v13, v14);
    objc_msgSend_PCSServiceStringFromCKServiceType_(v15, v16, a3);
    uint64_t v17 = (const void *)PCSIdentitySetCopyCurrentPublicIdentityWithError();

    if (!v17 || v32)
    {
      uint64_t v20 = *MEMORY[0x1E4F19DD8];
      if (a3 - 1 > 5) {
        objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v18, v20, 5002, v32, @"Couldn't get a public identity for our current user in order to add our public %@ identity to PCS %@", @"Current Service", a4);
      }
      else {
        objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v18, v20, 5002, v32, @"Couldn't get a public identity for our current user in order to add our public %@ identity to PCS %@", off_1E64F31F8[a3 - 1], a4);
      }
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        CFRelease(v32);
        CFTypeRef v32 = 0;
      }
    }
    else
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = sub_1C4DDC6D4;
      v26[3] = &unk_1E64F2918;
      v26[4] = &v28;
      v26[5] = a4;
      v26[6] = v17;
      objc_msgSend__onSynchronizeQueue_(self, v18, (uint64_t)v26);
      if (*((unsigned char *)v29 + 24))
      {
        id v12 = 0;
      }
      else
      {
        uint64_t v21 = *MEMORY[0x1E4F19DD8];
        if (a3 - 1 > 5) {
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v19, v21, 5005, @"Failed to add our %@ identity to the share", @"Current Service");
        }
        else {
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v19, v21, 5005, @"Failed to add our %@ identity to the share", off_1E64F31F8[a3 - 1]);
        }
        id v12 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  CFRelease(v11);
  if (v17) {
    CFRelease(v17);
  }
LABEL_20:
  if (v12)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v22 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      if (a3 - 1 > 5) {
        BOOL v23 = @"Current Service";
      }
      else {
        BOOL v23 = off_1E64F31F8[a3 - 1];
      }
      *(_DWORD *)long long buf = 138543618;
      uint64_t v34 = v23;
      __int16 v35 = 2112;
      id v36 = v12;
      uint64_t v24 = v22;
      _os_log_impl(&dword_1C4CFF000, v24, OS_LOG_TYPE_INFO, "Warn: Error adding public %{public}@ identity to share PCS: %@", buf, 0x16u);
    }
  }
  if (a5) {
    *a5 = v12;
  }
  _Block_object_dispose(&v28, 8);

  return v12 == 0;
}

- (_OpaquePCSShareProtection)createSharePCSOfType:(unint64_t)a3 forPCSServiceType:(unint64_t)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v25 = 0;
  id v8 = (_OpaquePCSShareProtection *)objc_msgSend_createEmptySharePCSOfType_error_(self, a2, a3, &v25);
  id v9 = v25;
  uint64_t v11 = v9;
  id v12 = (void *)MEMORY[0x1E4F1A550];
  uint64_t v13 = (os_log_t *)MEMORY[0x1E4F1A528];
  if (!v8 || v9)
  {
    if (!v9)
    {
      uint64_t v11 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v10, *MEMORY[0x1E4F19DD8], 5005, @"Couldn't create an empty share PCS");
    }
    if (v8)
    {
      CFRelease(v8);
      id v8 = 0;
    }
  }
  else
  {
    id v24 = 0;
    int v14 = objc_msgSend__addPublicIdentityForService_toSharePCS_withError_(self, v10, a4, v8, &v24);
    id v15 = v24;
    uint64_t v17 = (uint64_t)v15;
    if (!v14 || (uint64_t v11 = 0, v15))
    {
      if (!v15)
      {
        uint64_t v17 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v16, *MEMORY[0x1E4F19DD8], 5005, @"Couldn't add public PCS identity to new share PCS");
      }
      if (*v12 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v18 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v27 = v17;
        _os_log_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_INFO, "Warn: Error adding public sharing identity to share PCS: %@", buf, 0xCu);
      }
      uint64_t v11 = (void *)v17;
    }
    if (v11) {
      char v19 = 0;
    }
    else {
      char v19 = v14;
    }
    if (v19)
    {
      uint64_t v20 = (void *)PCSFPCopyDiagnostic();
      if (*v12 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v21 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v27 = (uint64_t)v20;
        _os_log_impl(&dword_1C4CFF000, v21, OS_LOG_TYPE_INFO, "Created a new share PCS: %@", buf, 0xCu);
      }

      uint64_t v11 = 0;
      goto LABEL_33;
    }
  }
  if (*v12 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v22 = *v13;
  if (os_log_type_enabled(*v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v27 = (uint64_t)v11;
    _os_log_impl(&dword_1C4CFF000, v22, OS_LOG_TYPE_INFO, "Warn: Error creating a share PCS: %@", buf, 0xCu);
  }
  if (a5) {
    *a5 = v11;
  }
  if (v8)
  {
    CFRelease(v8);
    id v8 = 0;
  }
LABEL_33:

  return v8;
}

- (_OpaquePCSShareProtection)createSharePublicPCSWithIdentity:(_PCSIdentityData *)a3 error:(id *)a4
{
  v35[1] = *MEMORY[0x1E4F143B8];
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v34 = *MEMORY[0x1E4F93EC8];
  v35[0] = *MEMORY[0x1E4F93ED8];
  uint64_t v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], a2, (uint64_t)v35, &v34, 1);
  id v8 = (_OpaquePCSShareProtection *)PCSFPCreate();

  if (v29[3] || !v8)
  {
    id v15 = objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(MEMORY[0x1E4F1A280], v9, *MEMORY[0x1E4F19DD8], 5002, 0, @"Couldn't create a new PCSShareProtectionRef");
    int v14 = v15;
    if (a4) {
      *a4 = v15;
    }
    if (!v8) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  uint64_t v11 = (const void *)PCSIdentityCopyPublicIdentity();
  if (!v11)
  {
    id v16 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v10, *MEMORY[0x1E4F19DD8], 5000, @"Couldn't get a public identity'");
    int v14 = v16;
    if (a4) {
      *a4 = v16;
    }
LABEL_13:
    CFRelease(v8);
    id v8 = 0;
LABEL_14:
    uint64_t v11 = 0;
    goto LABEL_22;
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  void v23[2] = sub_1C4DDCE20;
  v23[3] = &unk_1E64F2CA8;
  v23[6] = v8;
  v23[7] = a3;
  v23[4] = &v24;
  v23[5] = &v28;
  objc_msgSend__onSynchronizeQueue_(self, v10, (uint64_t)v23);
  if (*((unsigned char *)v25 + 24))
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1C4DDCE60;
    v22[3] = &unk_1E64F2918;
    v22[4] = &v24;
    v22[5] = v8;
    v22[6] = v11;
    objc_msgSend__onSynchronizeQueue_(self, v12, (uint64_t)v22);
    if (*((unsigned char *)v25 + 24))
    {
      int v14 = 0;
      goto LABEL_22;
    }
    uint64_t v18 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v13, *MEMORY[0x1E4F19DD8], 5005, @"Failed to add public identity to the share PCS");
    int v14 = v18;
    if (a4) {
      *a4 = v18;
    }
    CFRelease(v8);
  }
  else
  {
    uint64_t v17 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v12, *MEMORY[0x1E4F19DD8], 5005, @"Failed to add identity to the share PCS");
    int v14 = v17;
    if (a4) {
      *a4 = v17;
    }
    CFRelease(v8);
  }
  id v8 = 0;
LABEL_22:
  char v19 = (const void *)v29[3];
  if (v19)
  {
    CFRelease(v19);
    v29[3] = 0;
  }
  if (v11) {
    CFRelease(v11);
  }
  if (!v8)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v20 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v33 = v14;
      _os_log_impl(&dword_1C4CFF000, v20, OS_LOG_TYPE_INFO, "Warn: Error creating a share PCS: %@", buf, 0xCu);
    }
  }
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v8;
}

- (_OpaquePCSShareProtection)createChainPCSWithError:(id *)a3
{
  v23[3] = *MEMORY[0x1E4F143B8];
  uint64_t RandomCompactRaw = PCSIdentityCreateRandomCompactRaw();
  if (RandomCompactRaw)
  {
    uint64_t v6 = (const void *)RandomCompactRaw;
    uint64_t ServiceName = PCSIdentityGetServiceName();
    uint64_t v8 = *MEMORY[0x1E4F93EC0];
    v22[0] = *MEMORY[0x1E4F93EE8];
    v22[1] = v8;
    v23[0] = ServiceName;
    v23[1] = v6;
    v22[2] = *MEMORY[0x1E4F93EC8];
    void v23[2] = *MEMORY[0x1E4F93ED8];
    id v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v9, (uint64_t)v23, v22, 3);
    id v12 = (_OpaquePCSShareProtection *)PCSFPCreate();
    if (v12)
    {
      PCSFPSetCurrentPrivateKey();
      id v15 = 0;
    }
    else
    {
      objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(MEMORY[0x1E4F1A280], v11, *MEMORY[0x1E4F19DD8], 5002, 0, @"Couldn't create a new PCSShareProtectionRef");
      int v14 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
      id v15 = v14;
      if (a3) {
        *a3 = v14;
      }
      if (v12)
      {
        CFRelease(v12);
        id v12 = 0;
      }
    }
    CFRelease(v6);
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(MEMORY[0x1E4F1A280], v5, *MEMORY[0x1E4F19DD8], 5000, 0, 0, 0, 0, @"Failed to add a protection key to the chain PCS");
    uint64_t v13 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
    id v15 = v13;
    if (a3)
    {
      id v15 = v13;
      id v12 = 0;
      id v10 = 0;
      *a3 = v15;
    }
    else
    {
      id v12 = 0;
      id v10 = 0;
    }
  }
  id v16 = (void *)*MEMORY[0x1E4F1A548];
  if (v12)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v16);
    }
    uint64_t v17 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v21 = v12;
      _os_log_debug_impl(&dword_1C4CFF000, v17, OS_LOG_TYPE_DEBUG, "Created new chain PCS: %@", buf, 0xCu);
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v16);
    }
    uint64_t v18 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v21 = v15;
      _os_log_error_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_ERROR, "Error creating new chain PCS: %@", buf, 0xCu);
    }
  }

  return v12;
}

- (id)dataFromSharePCS:(_OpaquePCSShareProtection *)a3 pcsBlobType:(unint64_t)a4 error:(id *)a5
{
  id v5 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_1C4DC743C;
  char v27 = sub_1C4DC744C;
  id v28 = 0;
  if (a3)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1C4DDD574;
    void v22[3] = &unk_1E64F2990;
    v22[5] = &v29;
    v22[6] = a3;
    v22[4] = &v23;
    objc_msgSend__onSynchronizeQueue_(self, a2, (uint64_t)v22);
    uint64_t v9 = v30[3];
    if (v9 || !v24[5])
    {
      if (a4 - 1 > 5) {
        id v10 = @"Unknown";
      }
      else {
        id v10 = off_1E64F31C8[a4 - 1];
      }
      uint64_t v11 = (void *)MEMORY[0x1E4F1A280];
      id v12 = objc_msgSend_stringWithFormat_(NSString, v8, @"Couldn't encode share PCS data %@, PCS type %@, error: %@", v5, v10, v9);
      int v14 = objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(v11, v13, *MEMORY[0x1E4F19DD8], 5002, 0, v9, 0, 0, v12);

      if (a5) {
        *a5 = v14;
      }
      id v15 = (void *)v24[5];
      v24[5] = 0;

      id v16 = (const void *)v30[3];
      if (v16)
      {
        CFRelease(v16);
        v30[3] = 0;
      }
    }
    else
    {
      int v14 = 0;
    }
    uint64_t v17 = (void *)*MEMORY[0x1E4F1A548];
    if (v24[5])
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v17);
      }
      uint64_t v18 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
      {
        char v19 = (void *)v24[5];
        *(_DWORD *)long long buf = 138412546;
        uint64_t v34 = v5;
        __int16 v35 = 2112;
        id v36 = v19;
        _os_log_debug_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_DEBUG, "Created data from share PCS %@: %@", buf, 0x16u);
      }
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v17);
      }
      uint64_t v20 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412546;
        uint64_t v34 = v5;
        __int16 v35 = 2112;
        id v36 = v14;
        _os_log_error_impl(&dword_1C4CFF000, v20, OS_LOG_TYPE_ERROR, "Error creating PCS data from share PCS %@: %@", buf, 0x16u);
      }
    }
    id v5 = (_OpaquePCSShareProtection *)(id)v24[5];
  }
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v5;
}

- (_OpaquePCSShareProtection)createSharePCSFromData:(id)a3 sharingIdentity:(_PCSIdentityData *)a4 logFailure:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v10 = (_PCSIdentityData *)a3;
  id v12 = v10;
  uint64_t v34 = 0;
  __int16 v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  if (!v10)
  {
    char v19 = 0;
    goto LABEL_35;
  }
  if (!a4)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v11, *MEMORY[0x1E4F19DD8], 5002, @"Can't create a share PCS without a sharing identity");
    uint64_t v20 = (_PCSIdentityData *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = v20;
    if (a6)
    {
      uint64_t v18 = v20;
      *a6 = v18;
    }
    goto LABEL_21;
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_1C4DDDA64;
  v29[3] = &unk_1E64F2E28;
  v29[6] = v10;
  v29[7] = a4;
  v29[4] = &v30;
  v29[5] = &v34;
  objc_msgSend__onSynchronizeQueue_(self, v11, (uint64_t)v29);
  if (v35[3] || !v31[3])
  {
    if (v7)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v13 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
      {
        int v14 = (_PCSIdentityData *)v35[3];
        *(_DWORD *)long long buf = 138412546;
        uint64_t v39 = a4;
        __int16 v40 = 2112;
        char v41 = v14;
        _os_log_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_INFO, "Couldn't decrypt share PCS data with share identity %@: %@", buf, 0x16u);
      }
    }
    id v15 = objc_opt_class();
    objc_msgSend_noMatchingIdentityErrorForPCSError_withErrorCode_description_(v15, v16, v35[3], 5004, @"Failed to decrypt share PCS data");
    uint64_t v18 = (_PCSIdentityData *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (!a6)
      {
LABEL_19:
        uint64_t v21 = (const void *)v31[3];
        if (v21)
        {
          CFRelease(v21);
          v31[3] = 0;
        }
        goto LABEL_21;
      }
    }
    else
    {
      objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(MEMORY[0x1E4F1A280], v17, *MEMORY[0x1E4F19DD8], 5004, 0, v35[3], 0, 0, @"Couldn't create share PCS object from data");
      uint64_t v18 = (_PCSIdentityData *)objc_claimAutoreleasedReturnValue();
      if (!a6) {
        goto LABEL_19;
      }
    }
    *a6 = v18;
    goto LABEL_19;
  }
  uint64_t v18 = 0;
LABEL_21:
  id v22 = self;
  uint64_t v23 = (const void *)v35[3];
  if (v23)
  {
    CFRelease(v23);
    v35[3] = 0;
  }
  if (v31[3])
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v24 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v25 = (_PCSIdentityData *)v31[3];
      *(_DWORD *)long long buf = 138412802;
      uint64_t v39 = v12;
      __int16 v40 = 2112;
      char v41 = v25;
      __int16 v42 = 2112;
      uint64_t v43 = a4;
      _os_log_debug_impl(&dword_1C4CFF000, v24, OS_LOG_TYPE_DEBUG, "Created share PCS from data (%@): %@. Identity PCS was %@", buf, 0x20u);
    }
  }
  else if (v7)
  {
    uint64_t v26 = (_PCSIdentityData *)PCSFPCreatePEMData();
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    char v27 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138413058;
      uint64_t v39 = v18;
      __int16 v40 = 2112;
      char v41 = a4;
      __int16 v42 = 2112;
      uint64_t v43 = v26;
      __int16 v44 = 2112;
      id v45 = v12;
      _os_log_error_impl(&dword_1C4CFF000, v27, OS_LOG_TYPE_ERROR, "Error creating share PCS: %@.\nIdentity PCS was %@.\nPEM data was %@.\nRecord data was %@", buf, 0x2Au);
    }
  }
  char v19 = (_OpaquePCSShareProtection *)v31[3];

LABEL_35:
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

  return v19;
}

- (_OpaquePCSShareProtection)createSharePCSFromData:(id)a3 sharingIdentity:(_PCSIdentityData *)a4 error:(id *)a5
{
  return (_OpaquePCSShareProtection *)MEMORY[0x1F4181798](self, sel_createSharePCSFromData_sharingIdentity_logFailure_error_, a3);
}

- (_OpaquePCSShareProtection)createSharePCSFromData:(id)a3 ofType:(unint64_t)a4 withService:(unint64_t)a5 logFailure:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  id v16 = objc_msgSend__pcsObjectKindForCKDPCSBlobType_(self, v13, a4);
  if (!v12)
  {
    id v20 = 0;
LABEL_18:
    char v27 = 0;
    goto LABEL_31;
  }
  uint64_t v17 = objc_msgSend_identityManager(self, v14, v15);
  id v37 = 0;
  char v19 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(v17, v18, a5, 2, &v37);
  id v20 = v37;

  if (!v19 || v20)
  {
    if (a7) {
      *a7 = v20;
    }
    if (v8)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v26 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v47 = v20;
        _os_log_impl(&dword_1C4CFF000, v26, OS_LOG_TYPE_INFO, "Couldn't decrypt share PCS data due to identity set unavailable. Error: %@", buf, 0xCu);
      }
    }
    goto LABEL_18;
  }
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = sub_1C4DDDEBC;
  v31[3] = &unk_1E64F2E50;
  uint64_t v34 = &v38;
  uint64_t v36 = v19;
  id v32 = v16;
  id v33 = v12;
  __int16 v35 = &v42;
  objc_msgSend__onSynchronizeQueue_(self, v21, (uint64_t)v31);
  if (v39[3] && !v43[3])
  {
    id v20 = 0;
  }
  else
  {
    id v22 = objc_opt_class();
    objc_msgSend_noMatchingIdentityErrorForPCSError_withErrorCode_description_(v22, v23, v43[3], 5004, @"Failed to decrypt share PCS object");
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(MEMORY[0x1E4F1A280], v24, *MEMORY[0x1E4F19DD8], 5004, 0, v43[3], 0, 0, @"Couldn't create share PCS object from data");
      id v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v25 = (const void *)v43[3];
    if (v25)
    {
      CFRelease(v25);
      v43[3] = 0;
    }
  }
  if (!v39[3])
  {
    if (a7) {
      *a7 = v20;
    }
    if (v8)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v28 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        id v47 = (id)v19;
        __int16 v48 = 2112;
        id v49 = v20;
        _os_log_impl(&dword_1C4CFF000, v28, OS_LOG_TYPE_INFO, "Couldn't decrypt share PCS data with share identities %@: %@", buf, 0x16u);
      }
    }
  }
  CFRelease(v19);
  uint64_t v29 = (const void *)v43[3];
  if (v29)
  {
    CFRelease(v29);
    v43[3] = 0;
  }
  char v27 = (_OpaquePCSShareProtection *)v39[3];

LABEL_31:
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  return v27;
}

- (_OpaquePCSShareProtection)createSharePCSFromData:(id)a3 ofType:(unint64_t)a4 withService:(unint64_t)a5 error:(id *)a6
{
  return (_OpaquePCSShareProtection *)objc_msgSend_createSharePCSFromData_ofType_withService_logFailure_error_(self, a2, (uint64_t)a3, a4, a5, 1, a6);
}

- (_OpaquePCSShareProtection)createSharePCSFromData:(id)a3 sharePrivateKey:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = 0;
  id v10 = 0;
  if (!v8 || !a4) {
    goto LABEL_21;
  }
  id v11 = a4;
  int v14 = objc_msgSend_identityManager(self, v12, v13);
  id v25 = 0;
  id v16 = (const void *)objc_msgSend_createSharingIdentityFromData_error_(v14, v15, (uint64_t)v11, &v25);

  id v9 = v25;
  if (!v16 || v9)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v21 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v27 = v9;
      _os_log_error_impl(&dword_1C4CFF000, v21, OS_LOG_TYPE_ERROR, "Couldn't create an identity from private key data: %@", buf, 0xCu);
      if (v9)
      {
LABEL_17:
        id v10 = 0;
        if (!v16) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }
    }
    else if (v9)
    {
      goto LABEL_17;
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v22, *MEMORY[0x1E4F19DD8], 5005, @"Couldn't create an identity from private key data");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  id v24 = 0;
  id v10 = (_OpaquePCSShareProtection *)objc_msgSend_createSharePCSFromData_sharingIdentity_error_(self, v17, (uint64_t)v8, v16, &v24);
  id v18 = v24;
  id v9 = v18;
  if (v10 && !v18) {
    goto LABEL_18;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  char v19 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412802;
    id v27 = v8;
    __int16 v28 = 2112;
    uint64_t v29 = v16;
    __int16 v30 = 2112;
    id v31 = v9;
    _os_log_error_impl(&dword_1C4CFF000, v19, OS_LOG_TYPE_ERROR, "Couldn't create a public PCS from the PCS data %@ for identity %@: %@", buf, 0x20u);
    if (v9) {
      goto LABEL_18;
    }
    goto LABEL_11;
  }
  if (!v9)
  {
LABEL_11:
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v20, *MEMORY[0x1E4F19DD8], 5005, @"Couldn't create a public PCS from the PCS data %@ for identity %@", v8, v16);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_18:
  CFRelease(v16);
LABEL_19:
  if (a5)
  {
    id v9 = v9;
    *a5 = v9;
  }
LABEL_21:

  return v10;
}

- (_OpaquePCSShareProtection)createSharePCSFromEncryptedData:(id)a3 error:(id *)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = PCSFPCopyRecoverPCS();
    BOOL v7 = (_OpaquePCSShareProtection *)v6;
    if (a4 && !v6) {
      *a4 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)publicKeyDataFromPCS:(_OpaquePCSShareProtection *)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = PCSFPCopyCurrentPrivateKey();
  if (v6)
  {
    id v8 = (const void *)v6;
    uint64_t v9 = PCSIdentityCopyPublicIdentity();
    if (v9)
    {
      id v10 = (const void *)v9;
      id v11 = (void *)PCSPublicIdentityCopyPublicKey();
      CFRelease(v10);
      CFRelease(v8);
      if (v11)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        id v12 = *MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412546;
          id v16 = a3;
          __int16 v17 = 2114;
          id v18 = v11;
          _os_log_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_INFO, "Public key data for current private key for share PCS %@ is %{public}@", buf, 0x16u);
        }
        id v13 = 0;
        goto LABEL_13;
      }
    }
    else
    {
      CFRelease(v8);
    }
  }
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v7, *MEMORY[0x1E4F19DD8], 5005, @"Couldn't create public key data from PCS  %@", a3);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = 0;
  if (a4 && v13)
  {
    id v13 = v13;
    id v11 = 0;
    *a4 = v13;
  }
LABEL_13:

  return v11;
}

- (void)decryptPCSDataOnSharePCS:(id)a3 shareModificationDate:(id)a4 requestorOperationID:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v16 = objc_msgSend_synchronizeQueue(self, v14, v15);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4DDE638;
  block[3] = &unk_1E64F0D78;
  void block[4] = self;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  id v25 = v13;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  dispatch_async(v16, block);
}

- (void)_locked_decryptCurrentPerParticipantPCSDataOnSharePCS:(id)a3 withPublicSharingKey:(id)a4 oonPrivateKey:(id)a5 shareModificationDate:(id)a6 requestorOperationID:(id)a7 completionHandler:(id)a8
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v79 = a5;
  id v77 = a6;
  id v78 = a7;
  id v80 = a8;
  id v18 = objc_msgSend_synchronizeQueue(self, v16, v17);
  dispatch_assert_queue_V2(v18);

  uint64_t v108 = 0;
  uint64_t v109 = (id *)&v108;
  uint64_t v110 = 0x3032000000;
  id v111 = sub_1C4DC743C;
  uint64_t v112 = sub_1C4DC744C;
  id v113 = 0;
  uint64_t v76 = objc_msgSend_shareID(v14, v19, v20);
  uint64_t v23 = objc_msgSend_serviceType(v14, v21, v22);
  uint64_t v26 = objc_msgSend_identityManager(self, v24, v25);
  uint64_t v75 = objc_msgSend_PCSServiceStringFromCKServiceType_(v26, v27, v23);

  __int16 v30 = objc_msgSend_callbackQueue(self, v28, v29);
  id v33 = objc_msgSend_myParticipantPCSData(v14, v31, v32);

  if (v33)
  {
    if (v15 && v79)
    {
      uint64_t v36 = (void *)MEMORY[0x1E4F1A550];
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v37 = (os_log_t *)MEMORY[0x1E4F1A528];
      uint64_t v38 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        id v115 = v76;
        _os_log_debug_impl(&dword_1C4CFF000, v38, OS_LOG_TYPE_DEBUG, "Trying to unlock our per-participant PCS for share %@ using a combined OON key", buf, 0xCu);
      }
      uint64_t v41 = objc_msgSend_identityManager(self, v39, v40);
      uint64_t CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity = objc_msgSend_createCombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity_(v41, v42, (uint64_t)v79, v15);

      uint64_t v46 = objc_msgSend_myParticipantPCSData(v14, v44, v45);
      id v47 = v109;
      id v107 = v109[5];
      id v49 = objc_msgSend_createSharePCSFromData_sharingIdentity_error_(self, v48, (uint64_t)v46, CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity, &v107);
      objc_storeStrong(v47 + 5, v107);

      if (v49)
      {
        objc_msgSend_setMyParticipantPCS_(v14, v50, (uint64_t)v49);
        if (*v36 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v51 = *v37;
        if (os_log_type_enabled(*v37, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412546;
          id v115 = v76;
          __int16 v116 = 2112;
          uint64_t v117 = v49;
          _os_log_debug_impl(&dword_1C4CFF000, v51, OS_LOG_TYPE_DEBUG, "Successfully decrypted a per-participant PCS for share %@ using a combined OON key: %@", buf, 0x16u);
        }
        CFRelease(v49);
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1C4DDEF7C;
      block[3] = &unk_1E64F2E78;
      id v105 = v80;
      id v104 = v14;
      uint64_t v106 = &v108;
      dispatch_async(v30, block);
    }
    else if (v23)
    {
      BOOL v53 = v23 == 1;
      if (v23 == 1)
      {
        BOOL v56 = objc_msgSend_publicPermission(v14, v34, v35) == 1 || objc_msgSend_publicPermission(v14, v54, v55) == 0;
        int v62 = objc_msgSend_myParticipantRole(v14, v54, v55) == 1 || v56;
        if (v62) {
          uint64_t v63 = 2;
        }
        else {
          uint64_t v63 = 1;
        }
        uint64_t v74 = v63;
        if (v62) {
          uint64_t v23 = 1;
        }
        else {
          uint64_t v23 = 2;
        }
      }
      else
      {
        uint64_t v74 = 2;
      }
      objc_initWeak(&location, self);
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v64 = (id)*MEMORY[0x1E4F1A528];
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v71 = objc_msgSend_identityManager(self, v65, v66);
        uint64_t v73 = objc_msgSend_PCSServiceStringFromCKServiceType_(v71, v72, v74);
        *(_DWORD *)long long buf = 138412546;
        id v115 = v76;
        __int16 v116 = 2114;
        uint64_t v117 = v73;
        _os_log_debug_impl(&dword_1C4CFF000, v64, OS_LOG_TYPE_DEBUG, "Attempting decryption of per-participant PCS for share %@ using our %{public}@ identity", buf, 0x16u);
      }
      uint64_t v69 = objc_msgSend_myParticipantPCSData(v14, v67, v68);
      v85[0] = MEMORY[0x1E4F143A8];
      v85[1] = 3221225472;
      v85[2] = sub_1C4DDF1AC;
      v85[3] = &unk_1E64F2EF0;
      objc_copyWeak(v94, &location);
      uint64_t v86 = v30;
      uint64_t v93 = &v108;
      id v87 = v14;
      uint64_t v88 = self;
      v94[1] = (id)v74;
      BOOL v95 = v53;
      id v89 = v76;
      v94[2] = (id)v23;
      id v90 = v77;
      id v91 = v78;
      id v92 = v80;
      objc_msgSend__createPCSFromData_ofType_usingPCSServiceType_tryDecryptingWithOtherServices_withSyncKeyRegistryRetry_lastModifiedDate_requestorOperationID_completionHandler_(self, v70, (uint64_t)v69, 4, v74, 0, 1, v90, v91, v85);

      objc_destroyWeak(v94);
      objc_destroyWeak(&location);
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      unint64_t v57 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412546;
        id v115 = v76;
        __int16 v116 = 2114;
        uint64_t v117 = v75;
        _os_log_debug_impl(&dword_1C4CFF000, v57, OS_LOG_TYPE_DEBUG, "Trying to unlock our per-participant PCS for share %@ using the %{public}@ service", buf, 0x16u);
      }
      uint64_t v60 = objc_msgSend_myParticipantPCSData(v14, v58, v59);
      v97[0] = MEMORY[0x1E4F143A8];
      v97[1] = 3221225472;
      v97[2] = sub_1C4DDEFA8;
      v97[3] = &unk_1E64F2EA0;
      uint64_t v98 = v30;
      uint64_t v102 = &v108;
      id v99 = v14;
      id v100 = v75;
      id v101 = v80;
      objc_msgSend__createPCSFromData_ofType_usingPCSServiceType_tryDecryptingWithOtherServices_withSyncKeyRegistryRetry_lastModifiedDate_requestorOperationID_completionHandler_(self, v61, (uint64_t)v60, 4, 0, 0, 1, v77, v78, v97);
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v52 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v115 = v76;
      _os_log_debug_impl(&dword_1C4CFF000, v52, OS_LOG_TYPE_DEBUG, "No current per-participant PCS data found for decryption on share %@", buf, 0xCu);
    }
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = sub_1C4DDF7EC;
    v81[3] = &unk_1E64F2E78;
    id v83 = v80;
    id v82 = v14;
    uint64_t v84 = &v108;
    dispatch_async(v30, v81);
  }
  _Block_object_dispose(&v108, 8);
}

- (void)_locked_decryptPCSDataOnSharePCS:(id)a3 shareModificationDate:(id)a4 withPublicSharingKey:(id)a5 oonPrivateKey:(id)a6 requestorOperationID:(id)a7 completionHandler:(id)a8
{
  id v14 = a5;
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a4;
  id v19 = a3;
  uint64_t v22 = objc_msgSend_synchronizeQueue(self, v20, v21);
  dispatch_assert_queue_V2(v22);

  uint64_t v25 = objc_msgSend_shareID(v19, v23, v24);
  uint64_t v28 = objc_msgSend_serviceType(v19, v26, v27);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = sub_1C4DDF988;
  v33[3] = &unk_1E64F2F18;
  id v36 = v15;
  uint64_t v37 = v28;
  v33[4] = self;
  id v34 = v14;
  id v35 = v25;
  id v29 = v15;
  id v30 = v25;
  id v31 = v14;
  objc_msgSend__locked_decryptCurrentPerParticipantPCSDataOnSharePCS_withPublicSharingKey_oonPrivateKey_shareModificationDate_requestorOperationID_completionHandler_(self, v32, (uint64_t)v19, v31, v17, v18, v16, v33);
}

- (void)pcsDataFromFetchedShare:(id)a3 requestorOperationID:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v14 = a3;
  uint64_t v12 = objc_msgSend_serviceTypeForSharing(self, v10, v11);
  objc_msgSend_pcsDataFromFetchedShare_withServiceType_requestorOperationID_completionHandler_(self, v13, (uint64_t)v14, v12, v9, v8);
}

- (void)pcsDataFromFetchedShare:(id)a3 withServiceType:(unint64_t)a4 requestorOperationID:(id)a5 completionHandler:(id)a6
{
}

- (void)pcsDataFromFetchedShare:(id)a3 withPublicSharingKey:(id)a4 oonPrivateKey:(id)a5 withServiceType:(unint64_t)a6 requestorOperationID:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  uint64_t v21 = objc_msgSend_synchronizeQueue(self, v19, v20);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4DE07BC;
  block[3] = &unk_1E64F2F40;
  void block[4] = self;
  id v28 = v14;
  id v29 = v15;
  id v30 = v16;
  id v32 = v18;
  unint64_t v33 = a6;
  id v31 = v17;
  id v22 = v18;
  id v23 = v17;
  id v24 = v16;
  id v25 = v15;
  id v26 = v14;
  dispatch_async(v21, block);
}

- (void)_locked_pcsDataFromFetchedShare:(id)a3 withPublicSharingKey:(id)a4 oonPrivateKey:(id)a5 withServiceType:(unint64_t)a6 requestorOperationID:(id)a7 completionHandler:(id)a8
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  uint64_t v21 = objc_msgSend_synchronizeQueue(self, v19, v20);
  dispatch_assert_queue_V2(v21);

  if (v14)
  {
    id v23 = objc_msgSend_dataWithShare_serviceType_(CKDSharePCSData, v22, (uint64_t)v14, a6);
    if (objc_msgSend_privatePCS(v14, v24, v25) && objc_msgSend_publicPCS(v14, v26, v27))
    {
      uint64_t v28 = objc_msgSend_privatePCS(v14, v26, v27);
      objc_msgSend_setPcs_(v23, v29, v28);
      uint64_t v32 = objc_msgSend_publicPCS(v14, v30, v31);
      objc_msgSend_setPublicPCS_(v23, v33, v32);
      if (objc_msgSend_myParticipantPCS(v14, v34, v35))
      {
        uint64_t v38 = objc_msgSend_myParticipantPCS(v14, v36, v37);
        objc_msgSend_setMyParticipantPCS_(v23, v39, v38);
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v40 = (void *)*MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
      {
        uint64_t v43 = v40;
        uint64_t v46 = objc_msgSend_recordID(v14, v44, v45);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v73 = v46;
        _os_log_impl(&dword_1C4CFF000, v43, OS_LOG_TYPE_INFO, "Using pre-decrypted share PCS for share %@", buf, 0xCu);
      }
      id v47 = objc_msgSend_callbackQueue(self, v41, v42);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1C4DE0C70;
      block[3] = &unk_1E64F0790;
      id v69 = v18;
      id v68 = v23;
      dispatch_async(v47, block);

      __int16 v48 = v69;
    }
    else
    {
      __int16 v48 = objc_msgSend_modificationDate(v14, v26, v27);
      if (*MEMORY[0x1E4F1A4E0])
      {
        uint64_t v51 = objc_msgSend_pcsTestOverrides(self, v49, v50);
        BOOL v53 = objc_msgSend_objectForKeyedSubscript_(v51, v52, @"OverrideShareModificationDate");

        if (v53)
        {
          BOOL v56 = objc_msgSend_pcsTestOverrides(self, v54, v55);
          uint64_t v58 = objc_msgSend_objectForKeyedSubscript_(v56, v57, @"OverrideShareModificationDate");

          __int16 v48 = (void *)v58;
        }
      }
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = sub_1C4DE0C94;
      void v64[3] = &unk_1E64F2F68;
      v64[4] = self;
      id v65 = v14;
      id v66 = v18;
      objc_msgSend__locked_decryptPCSDataOnSharePCS_shareModificationDate_withPublicSharingKey_oonPrivateKey_requestorOperationID_completionHandler_(self, v59, (uint64_t)v23, v48, v15, v16, v17, v64);
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v60 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1C4CFF000, v60, OS_LOG_TYPE_ERROR, "Share decryption called without a share", buf, 2u);
    }
    uint64_t v63 = objc_msgSend_callbackQueue(self, v61, v62);
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = sub_1C4DE0C50;
    v70[3] = &unk_1E64F0A80;
    id v71 = v18;
    dispatch_async(v63, v70);

    id v23 = v71;
  }
}

- (_PCSPublicIdentityData)copyPublicAuthorshipIdentityFromPCS:(_OpaquePCSShareProtection *)a3
{
  if (!a3) {
    return 0;
  }
  PCSFPGetAuthorshipIdentity();
  return (_PCSPublicIdentityData *)PCSIdentityCopyPublicIdentity();
}

- (id)createNewSharePCSDataForShareWithID:(id)a3 withPublicSharingKey:(id)a4 addDebugIdentity:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v9 = (__CFString *)a3;
  id v10 = (__CFString *)a4;
  uint64_t v13 = objc_msgSend_serviceTypeForSharing(self, v11, v12);
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v14 = (os_log_t *)MEMORY[0x1E4F1A528];
  id v15 = (void *)*MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(v13 - 1) > 5) {
      id v17 = @"Current Service";
    }
    else {
      id v17 = off_1E64F31F8[v13 - 1];
    }
    *(_DWORD *)long long buf = 138412546;
    id v105 = v9;
    __int16 v106 = 2114;
    id v107 = v17;
    id v18 = v15;
    _os_log_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_INFO, "Creating new PCS data for share %@ with service type %{public}@", buf, 0x16u);
  }
  id v19 = objc_msgSend_dataWithShareID_pcsData_(CKDSharePCSData, v16, (uint64_t)v9, 0);
  objc_msgSend_setServiceType_(v19, v20, v13);
  uint64_t v96 = v9;
  if (v13 == 1)
  {
    id v103 = 0;
    uint64_t v23 = objc_msgSend_createSharePCSOfType_forPCSServiceType_error_(self, v21, 5, 1, &v103);
    id v24 = (__CFString *)v103;
    if (v24)
    {
      uint64_t v27 = v24;
      uint64_t v28 = (uint64_t *)MEMORY[0x1E4F1A550];
      uint64_t v95 = v23;
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v29 = v14;
      id v30 = *v14;
      if (!os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_33;
      }
      goto LABEL_13;
    }
  }
  else
  {
    if (objc_msgSend_currentServiceIsManatee(self, v21, v22))
    {
      uint64_t v102 = 0;
      unint64_t v33 = (id *)&v102;
      uint64_t v34 = objc_msgSend_createEmptySignedSharePCSOfType_forPCSServiceType_withError_(self, v32, 5, v13, &v102);
    }
    else
    {
      uint64_t v101 = 0;
      unint64_t v33 = (id *)&v101;
      uint64_t v34 = objc_msgSend_createEmptySharePCSOfType_error_(self, v32, 5, &v101);
    }
    uint64_t v23 = v34;
    uint64_t v35 = (__CFString *)*v33;
    if (v35)
    {
      uint64_t v27 = v35;
      uint64_t v28 = (uint64_t *)MEMORY[0x1E4F1A550];
      uint64_t v95 = v23;
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v29 = v14;
      id v30 = *v14;
      if (!os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_33;
      }
LABEL_13:
      *(_DWORD *)long long buf = 138412546;
      id v105 = v9;
      __int16 v106 = 2112;
      id v107 = v27;
      uint64_t v31 = "Couldn't create a private PCS object for the share %@: %@";
LABEL_32:
      _os_log_error_impl(&dword_1C4CFF000, v30, OS_LOG_TYPE_ERROR, v31, buf, 0x16u);
LABEL_33:
      SharePublicPCSWithIdentity_error = 0;
      uint64_t v43 = 0;
LABEL_34:
      uint64_t v44 = 0;
LABEL_35:
      uint64_t v45 = 0;
LABEL_36:

      uint64_t v46 = *v28;
      goto LABEL_37;
    }
  }
  uint64_t v95 = v23;
  if (v6)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v36 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v105 = v9;
      _os_log_debug_impl(&dword_1C4CFF000, v36, OS_LOG_TYPE_DEBUG, "Adding debug sharing identity to share %@", buf, 0xCu);
    }
    uint64_t v39 = objc_msgSend_debugSharingIdentity(self, v37, v38);
    uint64_t v41 = objc_msgSend_addSharingIdentity_toSharePCS_permission_(self, v40, v39, v23, 1);
    if (v41)
    {
      uint64_t v27 = (__CFString *)v41;
      uint64_t v28 = (uint64_t *)MEMORY[0x1E4F1A550];
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v29 = v14;
      id v30 = *v14;
      if (!os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_33;
      }
      *(_DWORD *)long long buf = 138412546;
      id v105 = v9;
      __int16 v106 = 2112;
      id v107 = v27;
      uint64_t v31 = "Couldn't add debug sharing identifier to share %@: %@";
      goto LABEL_32;
    }
  }
  uint64_t v50 = objc_msgSend_identityManager(self, v25, v26);
  id v100 = 0;
  uint64_t v43 = (const void *)objc_msgSend_createSharingIdentityFromData_error_(v50, v51, (uint64_t)v10, &v100);
  uint64_t v27 = (__CFString *)v100;

  if (!v43 || v27)
  {
    uint64_t v28 = (uint64_t *)MEMORY[0x1E4F1A550];
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v29 = v14;
    __int16 v54 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      id v105 = v10;
      __int16 v106 = 2112;
      id v107 = v27;
      _os_log_error_impl(&dword_1C4CFF000, v54, OS_LOG_TYPE_ERROR, "Couldn't create a public PCS sharing identity from data (%@): %@", buf, 0x16u);
    }
    SharePublicPCSWithIdentity_error = 0;
    goto LABEL_34;
  }
  v99[1] = 0;
  uint64_t v53 = PCSIdentityCopyExternalForm();
  uint64_t v93 = v53;
  if (v53)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v55 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
    {
      BOOL v56 = v55;
      uint64_t PublicKey = (__CFString *)PCSIdentityGetPublicKey();
      uint64_t v58 = v14;
      uint64_t v59 = (objc_class *)NSString;
      id v91 = PublicKey;
      id v60 = [v59 alloc];
      uint64_t v62 = (__CFString *)objc_msgSend_initWithData_encoding_(v60, v61, v93, 4);
      *(_DWORD *)long long buf = 138412802;
      id v105 = v96;
      __int16 v106 = 2114;
      id v107 = PublicKey;
      __int16 v108 = 2112;
      uint64_t v109 = v62;
      _os_log_impl(&dword_1C4CFF000, v56, OS_LOG_TYPE_INFO, "Using identity for public PCS on share %@: %{public}@: %@", buf, 0x20u);

      id v14 = v58;
    }
  }
  id v29 = v14;
  v99[0] = 0;
  SharePublicPCSWithIdentity_error = (const void *)objc_msgSend_createSharePublicPCSWithIdentity_error_(self, v52, (uint64_t)v43, v99);
  uint64_t v63 = (__CFString *)v99[0];
  if (v63)
  {
    uint64_t v27 = v63;
    uint64_t v28 = (uint64_t *)MEMORY[0x1E4F1A550];
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v44 = (void *)v93;
    id v66 = *v29;
    if (os_log_type_enabled(*v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      id v105 = v96;
      __int16 v106 = 2112;
      id v107 = v27;
      _os_log_error_impl(&dword_1C4CFF000, v66, OS_LOG_TYPE_ERROR, "Couldn't create a public PCS object for the share %@: %@", buf, 0x16u);
    }
    goto LABEL_35;
  }
  id v92 = v10;
  __int16 v67 = objc_msgSend_identityManager(self, v64, v65);
  id v98 = 0;
  uint64_t v45 = objc_msgSend_dataFromSharingIdentity_error_(v67, v68, (uint64_t)v43, &v98);
  uint64_t v27 = (__CFString *)v98;

  if (v27 || !v45)
  {
    uint64_t v28 = (uint64_t *)MEMORY[0x1E4F1A550];
    id v10 = v92;
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v44 = (void *)v93;
    os_log_t v80 = *v29;
    if (!os_log_type_enabled(*v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_36;
    }
    *(_DWORD *)long long buf = 138412290;
    id v105 = v27;
    id v77 = "Couldn't create data from our public sharing identity: %@";
    id v78 = v80;
    uint32_t v79 = 12;
LABEL_87:
    _os_log_error_impl(&dword_1C4CFF000, v78, OS_LOG_TYPE_ERROR, v77, buf, v79);
    goto LABEL_36;
  }
  id v10 = v92;
  if (v6)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v70 = *v29;
    if (os_log_type_enabled(*v29, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v105 = v96;
      _os_log_debug_impl(&dword_1C4CFF000, v70, OS_LOG_TYPE_DEBUG, "Adding debug sharing identity to share %@", buf, 0xCu);
    }
    uint64_t v73 = objc_msgSend_debugSharingIdentity(self, v71, v72);
    uint64_t v75 = objc_msgSend_addSharingIdentity_toSharePCS_permission_(self, v74, v73, SharePublicPCSWithIdentity_error, 1);
    if (v75)
    {
      uint64_t v27 = (__CFString *)v75;
      uint64_t v28 = (uint64_t *)MEMORY[0x1E4F1A550];
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v44 = (void *)v93;
      os_log_t v76 = *v29;
      if (!os_log_type_enabled(*v29, OS_LOG_TYPE_ERROR)) {
        goto LABEL_36;
      }
      *(_DWORD *)long long buf = 138412546;
      id v105 = v96;
      __int16 v106 = 2112;
      id v107 = v27;
      id v77 = "Couldn't add debug sharing identifier to share %@: %@";
      id v78 = v76;
      uint32_t v79 = 22;
      goto LABEL_87;
    }
  }
  if (v13 != 1) {
    goto LABEL_98;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  long long v81 = *v29;
  if (os_log_type_enabled(*v29, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    id v105 = v96;
    _os_log_debug_impl(&dword_1C4CFF000, v81, OS_LOG_TYPE_DEBUG, "Adding the owner to the self-added PCS blob for share %@", buf, 0xCu);
  }
  uint64_t v83 = objc_msgSend_addIdentityForService_toPCS_(self, v82, 1, SharePublicPCSWithIdentity_error);
  if (v83)
  {
    uint64_t v27 = (__CFString *)v83;
    uint64_t v84 = (uint64_t *)MEMORY[0x1E4F1A550];
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v44 = (void *)v93;
    id v85 = *MEMORY[0x1E4F1A500];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v46 = -1;
      goto LABEL_101;
    }
    *(_DWORD *)long long buf = 138543874;
    id v105 = @"Bladerunner";
    __int16 v106 = 2112;
    id v107 = v96;
    __int16 v108 = 2112;
    uint64_t v109 = v27;
    _os_log_error_impl(&dword_1C4CFF000, v85, OS_LOG_TYPE_ERROR, "Couldn't add our %{public}@ identity to the public PCS for share %@: %@", buf, 0x20u);
  }
  else
  {
LABEL_98:
    id v97 = 0;
    char v86 = objc_msgSend_addSharePCS_toRecordPCS_permission_error_(self, v69, v95, SharePublicPCSWithIdentity_error, 0, &v97);
    uint64_t v27 = (__CFString *)v97;
    if ((v86 & 1) == 0)
    {
      uint64_t v28 = (uint64_t *)MEMORY[0x1E4F1A550];
      uint64_t v44 = (void *)v93;
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v90 = *v29;
      if (os_log_type_enabled(*v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        id v105 = v96;
        __int16 v106 = 2112;
        id v107 = v27;
        _os_log_impl(&dword_1C4CFF000, v90, OS_LOG_TYPE_INFO, "Error adding private sharing PCS to public sharing PCS for share %@: %@", buf, 0x16u);
      }
      goto LABEL_36;
    }
    objc_msgSend_setPcs_(v19, v87, v95);
    objc_msgSend_setPublicPCS_(v19, v88, (uint64_t)SharePublicPCSWithIdentity_error);
    uint64_t v84 = (uint64_t *)MEMORY[0x1E4F1A550];
    uint64_t v44 = (void *)v93;
  }
  uint64_t v46 = *v84;
LABEL_101:
  if (!v19)
  {
LABEL_37:
    if (v46 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v47 = *v29;
    if (os_log_type_enabled(*v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      id v105 = v96;
      __int16 v106 = 2112;
      id v107 = v27;
      _os_log_error_impl(&dword_1C4CFF000, v47, OS_LOG_TYPE_ERROR, "Error creating PCS data for share %@: %@", buf, 0x16u);
    }
    __int16 v48 = (const void *)v95;
    if (a6)
    {
      uint64_t v27 = v27;
      id v19 = 0;
      *a6 = v27;
      if (!v95) {
        goto LABEL_46;
      }
    }
    else
    {
      id v19 = 0;
      if (!v95) {
        goto LABEL_46;
      }
    }
LABEL_45:
    CFRelease(v48);
    goto LABEL_46;
  }
  if (v46 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v89 = *v29;
  if (os_log_type_enabled(*v29, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    id v105 = v96;
    _os_log_debug_impl(&dword_1C4CFF000, v89, OS_LOG_TYPE_DEBUG, "Successfully created PCS data for share %@", buf, 0xCu);
  }
  __int16 v48 = (const void *)v95;
  if (v95) {
    goto LABEL_45;
  }
LABEL_46:
  if (SharePublicPCSWithIdentity_error) {
    CFRelease(SharePublicPCSWithIdentity_error);
  }
  if (v43) {
    CFRelease(v43);
  }

  return v19;
}

- (id)etagFromSharePCS:(_OpaquePCSShareProtection *)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v5 = (void *)PCSFPCreateUniqueID();
    id v8 = v5;
    if (v5)
    {
      id v9 = objc_msgSend_CKUppercaseHexStringWithoutSpaces(v5, v6, v7);
      if (!a4)
      {
LABEL_5:

        goto LABEL_7;
      }
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v11 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
      {
        int v12 = 138412546;
        uint64_t v13 = 0;
        __int16 v14 = 2112;
        uint64_t v15 = 0;
        _os_log_error_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_ERROR, "Couldn't create data from share PCS %@: %@", (uint8_t *)&v12, 0x16u);
      }
      id v9 = 0;
      if (!a4) {
        goto LABEL_5;
      }
    }
    *a4 = 0;
    goto LABEL_5;
  }
  id v9 = 0;
LABEL_7:
  return v9;
}

- (id)addPublicIdentity:(_PCSPublicIdentityData *)a3 toSharePCS:(_OpaquePCSShareProtection *)a4 permission:(unsigned int)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v11 = *MEMORY[0x1E4F1A528];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO)) {
      goto LABEL_18;
    }
    *(_WORD *)long long buf = 0;
    int v12 = "Refusing to add a nil public identity to a record PCS";
    goto LABEL_17;
  }
  if (!a4)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v11 = *MEMORY[0x1E4F1A528];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO)) {
      goto LABEL_18;
    }
    *(_WORD *)long long buf = 0;
    int v12 = "Refusing to add a sharing identity to a nil record PCS";
LABEL_17:
    _os_log_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_INFO, v12, buf, 2u);
LABEL_18:
    id v10 = 0;
    goto LABEL_25;
  }
  char v6 = a5;
  *(void *)long long buf = 0;
  uint64_t v20 = buf;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1C4DE20E4;
  v17[3] = &unk_1E64F2F90;
  v17[4] = buf;
  v17[5] = a4;
  v17[6] = a3;
  unsigned int v18 = a5;
  objc_msgSend__onSynchronizeQueue_(self, a2, (uint64_t)v17);
  id v8 = (void *)*MEMORY[0x1E4F1A548];
  if (v20[24])
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v8);
    }
    id v9 = (id)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = CKStringFromSharePermission(v6);
      *(_DWORD *)uint64_t v23 = 138412802;
      id v24 = a3;
      __int16 v25 = 2112;
      uint64_t v26 = a4;
      __int16 v27 = 2114;
      uint64_t v28 = v16;
      _os_log_debug_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_DEBUG, "Successfully added public identity %@ to record PCS %@ with permission %{public}@", v23, 0x20u);
    }
    id v10 = 0;
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v8);
    }
    uint64_t v13 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v23 = 138412546;
      id v24 = a3;
      __int16 v25 = 2112;
      uint64_t v26 = a4;
      _os_log_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_INFO, "Error adding public identity %@ to record PCS %@", v23, 0x16u);
    }
    id v10 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v14, *MEMORY[0x1E4F19DD8], 5005, @"Error adding public identity %@ to record PCS %@", a3, a4);
  }
  _Block_object_dispose(buf, 8);
LABEL_25:
  return v10;
}

- (id)addIdentityBackToPCS:(_OpaquePCSShareProtection *)a3
{
  if (a3)
  {
    id v5 = (void *)PCSFPCopyKeyIDs();
    if (objc_msgSend_count(v5, v6, v7))
    {
      id v10 = objc_msgSend_lastObject(v5, v8, v9);
      uint64_t v11 = PCSFPCopyPrivateKey();
      if (v11)
      {
        uint64_t v13 = (const void *)v11;
        __int16 v14 = objc_msgSend_addSharingIdentity_toSharePCS_permission_(self, v12, v11, a3, 0);
        CFRelease(v13);
      }
      else
      {
        __int16 v14 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v12, *MEMORY[0x1E4F19DD8], 5005, @"Couldn't get PCS identity with key ID %@", v10);
      }
    }
    else
    {
      __int16 v14 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v8, *MEMORY[0x1E4F19DD8], 5005, @"Couldn't get key IDs from share PCS %@", a3);
    }
    id v15 = v14;
  }
  else
  {
    id v15 = 0;
  }
  return v15;
}

- (id)addSharingIdentity:(_PCSIdentityData *)a3 toSharePCS:(_OpaquePCSShareProtection *)a4 permission:(unint64_t)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v13 = *MEMORY[0x1E4F1A528];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    *(_WORD *)long long buf = 0;
    __int16 v14 = "Refusing to add a nil sharing identity to a record PCS";
    goto LABEL_13;
  }
  if (!a4)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v13 = *MEMORY[0x1E4F1A528];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    *(_WORD *)long long buf = 0;
    __int16 v14 = "Refusing to add a sharing identity to a nil record PCS";
LABEL_13:
    _os_log_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_INFO, v14, buf, 2u);
LABEL_14:
    int v12 = 0;
    goto LABEL_15;
  }
  uint64_t v9 = PCSIdentityCopyPublicIdentity();
  if (v9)
  {
    uint64_t v11 = (const void *)v9;
    int v12 = objc_msgSend_addPublicIdentity_toSharePCS_permission_(self, v10, v9, a4, a5);
    CFRelease(v11);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v16 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v19 = a3;
      _os_log_impl(&dword_1C4CFF000, v16, OS_LOG_TYPE_INFO, "Error getting a public identity from sharing identity %@", buf, 0xCu);
    }
    int v12 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v17, *MEMORY[0x1E4F19DD8], 5000, @"Error getting a public identity from sharing identity %@", a3);
  }
LABEL_15:
  return v12;
}

- (id)removePublicIdentity:(_PCSPublicIdentityData *)a3 fromSharePCS:(_OpaquePCSShareProtection *)a4
{
  if (a3)
  {
    if (a4)
    {
      uint64_t v9 = 0;
      id v10 = &v9;
      uint64_t v11 = 0x2020000000;
      char v12 = 0;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = sub_1C4DE2610;
      v8[3] = &unk_1E64F2918;
      v8[4] = &v9;
      v8[5] = a4;
      v8[6] = a3;
      objc_msgSend__onSynchronizeQueue_(self, a2, (uint64_t)v8);
      if (*((unsigned char *)v10 + 24))
      {
        id v5 = 0;
      }
      else
      {
        id v5 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v4, *MEMORY[0x1E4F19DD8], 5005, @"Couldn't remove public identity from share PCS");
      }
      id v6 = v5;
      _Block_object_dispose(&v9, 8);

      goto LABEL_10;
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], a2, *MEMORY[0x1E4F19DD8], 5005, @"Can't remove a public identity from a nil share");
  }
  else
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], a2, *MEMORY[0x1E4F19DD8], 5005, @"Can't remove a nil public identity");
  }
  id v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
  return v6;
}

- (id)removeSharingIdentity:(_PCSIdentityData *)a3 fromSharePCS:(_OpaquePCSShareProtection *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v11 = *MEMORY[0x1E4F1A528];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    *(_WORD *)long long buf = 0;
    char v12 = "Refusing to remove a nil sharing identity from a record PCS";
    goto LABEL_13;
  }
  if (!a4)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v11 = *MEMORY[0x1E4F1A528];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    *(_WORD *)long long buf = 0;
    char v12 = "Refusing to remove a sharing identity from a nil record PCS";
LABEL_13:
    _os_log_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_INFO, v12, buf, 2u);
LABEL_14:
    id v10 = 0;
    goto LABEL_15;
  }
  uint64_t v7 = PCSIdentityCopyPublicIdentity();
  if (v7)
  {
    uint64_t v9 = (const void *)v7;
    id v10 = objc_msgSend_removePublicIdentity_fromSharePCS_(self, v8, v7, a4);
    CFRelease(v9);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    __int16 v14 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v17 = a3;
      _os_log_impl(&dword_1C4CFF000, v14, OS_LOG_TYPE_INFO, "Error getting a public identity from sharing identity %@", buf, 0xCu);
    }
    id v10 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v15, *MEMORY[0x1E4F19DD8], 5005, @"Error getting a public identity from sharing identity %@", a3);
  }
LABEL_15:
  return v10;
}

- (id)removeEncryptedPCS:(id)a3 fromSharePCS:(_OpaquePCSShareProtection *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = 0;
  if (v7 && a4)
  {
    id v15 = 0;
    uint64_t v9 = (const void *)objc_msgSend_createSharePCSFromEncryptedData_error_(self, v6, (uint64_t)v7, &v15);
    id v10 = v15;
    id v8 = v10;
    if (v9 && !v10)
    {
      uint64_t v11 = PCSShareProtectionCopyPublicKeys();
      if (v11)
      {
        char v12 = (const void *)v11;
        CKCFArrayForEach();
        CFRelease(v9);
        uint64_t v9 = v12;
      }
LABEL_12:
      CFRelease(v9);
      goto LABEL_13;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v13 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v17 = v7;
      _os_log_error_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_ERROR, "Couldn't create a PCS from the encrypted blob %@", buf, 0xCu);
    }
    if (v9) {
      goto LABEL_12;
    }
  }
LABEL_13:

  return v8;
}

- (BOOL)removePublicKeys:(id)a3 fromPCS:(_OpaquePCSShareProtection *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a4)
  {
    id v6 = (void *)PCSFPCopyPublicIdentities();
    if (v6)
    {
      uint64_t v24 = 0;
      __int16 v25 = &v24;
      uint64_t v26 = 0x2020000000;
      char v27 = 1;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id obj = v5;
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v20, v32, 16);
      if (v8)
      {
        uint64_t v9 = *(void *)v21;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v21 != v9) {
              objc_enumerationMutation(obj);
            }
            uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * v10);
            uint64_t v16 = 0;
            id v17 = &v16;
            uint64_t v18 = 0x2020000000;
            char v19 = 0;
            CKCFArrayForEach();
            if (!*((unsigned char *)v17 + 24))
            {
              if (*MEMORY[0x1E4F1A550] != -1) {
                dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              char v12 = *MEMORY[0x1E4F1A500];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long buf = 138543618;
                uint64_t v29 = v11;
                __int16 v30 = 2112;
                uint64_t v31 = a4;
                _os_log_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_INFO, "Could not find matching public identity for key %{public}@ on record PCS %@", buf, 0x16u);
              }
            }
            _Block_object_dispose(&v16, 8);
            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v20, v32, 16);
        }
        while (v8);
      }

      LOBYTE(a4) = *((unsigned char *)v25 + 24) != 0;
      _Block_object_dispose(&v24, 8);
    }
    else
    {
      LOBYTE(a4) = 0;
    }
  }
  return (char)a4;
}

- (id)removePublicKeyID:(id)a3 fromPCS:(_OpaquePCSShareProtection *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = 0;
  if (v5 && a4)
  {
    id v7 = (void *)PCSFPCopyPublicIdentities();
    if (v7)
    {
      uint64_t v16 = 0;
      id v17 = &v16;
      uint64_t v18 = 0x3032000000;
      char v19 = sub_1C4DC743C;
      long long v20 = sub_1C4DC744C;
      id v21 = 0;
      uint64_t v12 = 0;
      uint64_t v13 = &v12;
      uint64_t v14 = 0x2020000000;
      char v15 = 0;
      id v8 = v5;
      uint64_t v11 = v8;
      CKCFArrayForEach();
      if (!*((unsigned char *)v13 + 24))
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v9 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138543618;
          id v23 = v8;
          __int16 v24 = 2112;
          __int16 v25 = a4;
          _os_log_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_INFO, "Could not find matching public identity for keyID %{public}@ on record PCS %@. Soldiering on.", buf, 0x16u);
        }
      }
      id v6 = (id)v17[5];

      _Block_object_dispose(&v12, 8);
      _Block_object_dispose(&v16, 8);
    }
    else
    {
      id v6 = 0;
    }
  }
  return v6;
}

- (id)sharingIdentityDataFromPCS:(_OpaquePCSShareProtection *)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v22 = 0;
    goto LABEL_20;
  }
  id v7 = (void *)PCSFPCopyKeyIDs();
  if (!objc_msgSend_count(v7, v8, v9))
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v10, *MEMORY[0x1E4F19DD8], 5005, @"Couldn't get key IDs from share PCS %@", a3);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = 0;
    goto LABEL_12;
  }
  uint64_t v12 = objc_msgSend_lastObject(v7, v10, v11);
  uint64_t v13 = PCSFPCopyPrivateKey();
  if (!v13)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v14, *MEMORY[0x1E4F19DD8], 5005, @"Couldn't get PCS identity with key ID %@", v12);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  uint64_t v16 = (const void *)v13;
  id v17 = objc_msgSend_identityManager(self, v14, v15);
  id v25 = 0;
  char v19 = objc_msgSend_dataFromSharingIdentity_error_(v17, v18, (uint64_t)v16, &v25);
  id v20 = v25;

  CFRelease(v16);
  if (!v19)
  {
LABEL_12:
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v23 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v27 = v20;
      _os_log_impl(&dword_1C4CFF000, v23, OS_LOG_TYPE_INFO, "Warn: Couldn't get sharing identity from PCS data: %@", buf, 0xCu);
    }
    if (a4)
    {
      id v20 = v20;
      char v19 = 0;
      *a4 = v20;
    }
    else
    {
      char v19 = 0;
    }
    goto LABEL_19;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v21 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    id v27 = v19;
    __int16 v28 = 2112;
    uint64_t v29 = a3;
    _os_log_impl(&dword_1C4CFF000, v21, OS_LOG_TYPE_INFO, "Got sharing identity %@ from PCS data %@", buf, 0x16u);
  }
LABEL_19:
  id v22 = v19;

LABEL_20:
  return v22;
}

- (id)decryptChainPCSForRecordPCS:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_chainPCSData(v4, v5, v6);
  uint64_t v10 = objc_msgSend_pcs(v7, v8, v9);

  if (v10)
  {
    id v13 = 0;
    goto LABEL_16;
  }
  if (!objc_msgSend_pcs(v4, v11, v12))
  {
    id v61 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v62 = *MEMORY[0x1E4F19DD8];
    uint64_t v63 = objc_msgSend_recordID(v4, v14, v15);
    objc_msgSend_errorWithDomain_code_format_(v61, v64, v62, 5004, @"Can't decrypt chain PCS for record %@ because we don't have a decrypted record PCS", v63);
LABEL_15:
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }
  uint64_t v16 = objc_msgSend_chainPCSData(v4, v14, v15);
  char v19 = objc_msgSend_encryptedChainPCSPrivateKey(v16, v17, v18);

  if (!v19)
  {
    uint64_t v65 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v66 = *MEMORY[0x1E4F19DD8];
    uint64_t v63 = objc_msgSend_recordID(v4, v20, v21);
    objc_msgSend_errorWithDomain_code_format_(v65, v67, v66, 5004, @"Can't decrypt chain PCS for record %@ because the record has no chain PCS private key", v63);
    goto LABEL_15;
  }
  id v22 = objc_msgSend_chainPCSData(v4, v20, v21);
  id v25 = objc_msgSend_pcsData(v22, v23, v24);

  if (!v25)
  {
    id v68 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v69 = *MEMORY[0x1E4F19DD8];
    uint64_t v63 = objc_msgSend_recordID(v4, v26, v27);
    objc_msgSend_errorWithDomain_code_format_(v68, v70, v69, 5004, @"Can't decrypt chain PCS for record %@ because the record has no chain PCS data", v63);
    goto LABEL_15;
  }
  __int16 v28 = objc_msgSend_chainPCSData(v4, v26, v27);
  uint64_t v31 = objc_msgSend_encryptedChainPCSPrivateKey(v28, v29, v30);
  uint64_t v34 = objc_msgSend_data(v31, v32, v33);

  if (v34) {
    goto LABEL_7;
  }
  uint64_t v72 = [CKDWrappingContext alloc];
  uint64_t v75 = objc_msgSend_recordID(v4, v73, v74);
  id v77 = objc_msgSend_initWithRecordID_fieldName_mergeableDeltaID_fileSignature_referenceSignature_(v72, v76, (uint64_t)v75, *MEMORY[0x1E4F1A580], 0, 0, 0);

  os_log_t v80 = objc_msgSend_chainPCSData(v4, v78, v79);
  uint64_t v83 = objc_msgSend_encryptedChainPCSPrivateKey(v80, v81, v82);
  uint64_t v86 = objc_msgSend_pcs(v4, v84, v85);
  objc_msgSend_unwrapEncryptedData_withPCS_inContext_(self, v87, (uint64_t)v83, v86, v77);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
LABEL_7:
    uint64_t v37 = objc_msgSend_identityManager(self, v35, v36);
    uint64_t v40 = objc_msgSend_chainPCSData(v4, v38, v39);
    uint64_t v43 = objc_msgSend_encryptedChainPCSPrivateKey(v40, v41, v42);
    uint64_t v46 = objc_msgSend_data(v43, v44, v45);
    id v89 = 0;
    __int16 v48 = (const void *)objc_msgSend_createSharingIdentityFromData_error_(v37, v47, (uint64_t)v46, &v89);
    id v13 = v89;

    if (v48 && !v13)
    {
      uint64_t v51 = objc_msgSend_chainPCSData(v4, v49, v50);
      __int16 v54 = objc_msgSend_pcsData(v51, v52, v53);
      id v88 = 0;
      uint64_t v56 = objc_msgSend_createSharePCSFromData_sharingIdentity_error_(self, v55, (uint64_t)v54, v48, &v88);
      id v13 = v88;

      if (!v56 || v13)
      {
        CFRelease(v48);
        __int16 v48 = (const void *)v56;
        if (!v56) {
          goto LABEL_16;
        }
      }
      else
      {
        uint64_t v59 = objc_msgSend_chainPCSData(v4, v57, v58);
        objc_msgSend_setPcs_(v59, v60, v56);

        CFRelease(v48);
        id v13 = 0;
        __int16 v48 = (const void *)v56;
      }
      goto LABEL_26;
    }
    if (!v13)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v49, *MEMORY[0x1E4F19DD8], 5004, @"Couldn't decrypt the private chain PCS identity");
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v48) {
LABEL_26:
    }
      CFRelease(v48);
  }
LABEL_16:

  return v13;
}

- (BOOL)containerSupportsEnhancedContext
{
  if ((objc_msgSend_useZoneWidePCS(self, a2, v2) & 1) == 0
    && (objc_msgSend_mmcsEncryptionSupport(self, v4, v5) & 2) == 0)
  {
    uint64_t v6 = objc_msgSend_identityManager(self, v4, v5);
    uint64_t v9 = objc_msgSend_serviceName(v6, v7, v8);
    int IsManatee = PCSServiceItemTypeIsManatee();

    if (!IsManatee) {
      return 0;
    }
  }
  uint64_t v11 = objc_msgSend_containerID(self, v4, v5);
  unint64_t v14 = objc_msgSend_specialContainerType(v11, v12, v13);

  if (v14 <= 5) {
    return (0xBu >> v14) & 1;
  }
  else {
    return 1;
  }
}

- (id)unwrapAssetKey:(id)a3 withRecordPCS:(_OpaquePCSShareProtection *)a4 inContext:(id)a5 withError:(id *)a6
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = MEMORY[0x1C8789E70]();
  uint64_t v12 = (void *)v11;
  uint64_t v13 = (void *)MEMORY[0x1E4F1A550];
  if (!v9 || !a4)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v21 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1C4CFF000, v21, OS_LOG_TYPE_INFO, "Couldn't unwrap asset key because we have no PCS object or wrapped asset key", buf, 2u);
    }
    id v22 = 0;
LABEL_11:
    if (*v13 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v23 = (void *)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      id v49 = v23;
      objc_msgSend_assetContextString(v10, v50, v51);
      uint64_t v52 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)long long buf = 138413058;
      *(void *)&uint8_t buf[4] = v9;
      __int16 v67 = 2112;
      id v68 = v52;
      __int16 v69 = 2112;
      uint64_t v70 = a4;
      __int16 v71 = 2112;
      uint64_t v72 = v22;
      _os_log_error_impl(&dword_1C4CFF000, v49, OS_LOG_TYPE_ERROR, "Failed all decryption attempts for wrapped asset key %@ in context %@ using PCS %@: %@", buf, 0x2Au);
    }
    uint64_t v26 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v27 = *MEMORY[0x1E4F19DD8];
    __int16 v28 = objc_msgSend_assetContextString(v10, v24, v25);
    objc_msgSend_errorWithDomain_code_error_format_(v26, v29, v27, 5004, v22, @"Failed all decryption attempts for wrapped asset key %@ in context %@ using PCS %@", v9, v28, a4);
    id v20 = (id)objc_claimAutoreleasedReturnValue();

    if (a6)
    {
      id v20 = v20;
      char v19 = 0;
      *a6 = v20;
    }
    else
    {
      char v19 = 0;
    }
    goto LABEL_50;
  }
  context = (void *)v11;
  unint64_t v14 = (void *)PCSFPCopyAvailableMasterKeyIDs();
  *(void *)long long buf = 0;
  id v17 = objc_msgSend_assetContextString(v10, v15, v16);
  objc_msgSend_dataUsingEncoding_(v17, v18, 4);

  uint64_t v53 = a6;
  unint64_t v57 = (void *)PCSFPCopyTruncatedKeyIDFromEncryptedData();
  if (v57)
  {
    char v19 = (void *)PCSFPCopyDecryptedData();
    id v20 = *(id *)buf;
    if (v19) {
      goto LABEL_45;
    }
  }
  else
  {
    id v20 = 0;
  }
  __int16 v54 = v14;
  id v55 = v10;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v30 = v14;
  uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v62, v74, 16);
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v63;
    while (2)
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v63 != v34) {
          objc_enumerationMutation(v30);
        }
        char v19 = (void *)PCSFPCopyDecryptedData();
        uint64_t v37 = *(void **)buf;
        if (*(void *)buf)
        {

          *(void *)long long buf = 0;
          id v20 = v37;
        }
        if (v19)
        {

          unint64_t v14 = v54;
          id v10 = v55;
          uint64_t v13 = (void *)MEMORY[0x1E4F1A550];
          goto LABEL_45;
        }
      }
      uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v36, (uint64_t)&v62, v74, 16);
      if (v33) {
        continue;
      }
      break;
    }
  }

  uint64_t v13 = (void *)MEMORY[0x1E4F1A550];
  if (!v57) {
    goto LABEL_33;
  }
  char v19 = (void *)PCSFPCopyUnwrappedKey();
  uint64_t v38 = *(void **)buf;
  unint64_t v14 = v54;
  if (*(void *)buf)
  {

    *(void *)long long buf = 0;
    id v20 = v38;
  }
  id v10 = v55;
  if (!v19)
  {
LABEL_33:
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v39 = v30;
    uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v40, (uint64_t)&v58, v73, 16);
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v59;
      a6 = v53;
      while (2)
      {
        for (uint64_t j = 0; j != v42; ++j)
        {
          if (*(void *)v59 != v43) {
            objc_enumerationMutation(v39);
          }
          char v19 = (void *)PCSFPCopyUnwrappedKey();
          uint64_t v46 = *(void **)buf;
          if (*(void *)buf)
          {

            *(void *)long long buf = 0;
            id v20 = v46;
          }
          if (v19)
          {

            unint64_t v14 = v54;
            id v10 = v55;
            uint64_t v13 = (void *)MEMORY[0x1E4F1A550];
            goto LABEL_46;
          }
        }
        uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v45, (uint64_t)&v58, v73, 16);
        if (v42) {
          continue;
        }
        break;
      }
    }
    else
    {
      a6 = v53;
    }

    id v22 = v20;
    id v10 = v55;
    uint64_t v12 = context;
    uint64_t v13 = (void *)MEMORY[0x1E4F1A550];
    goto LABEL_11;
  }
LABEL_45:

LABEL_46:
  if (*v13 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v47 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = v9;
    __int16 v67 = 2112;
    id v68 = a4;
    _os_log_debug_impl(&dword_1C4CFF000, v47, OS_LOG_TYPE_DEBUG, "Unwrapped wrapped asset key %{public}@ with PCS %@", buf, 0x16u);
  }
LABEL_50:

  return v19;
}

- (id)wrapAssetKey:(id)a3 withRecordPCS:(_OpaquePCSShareProtection *)a4 inContext:(id)a5 withError:(id *)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v13 = a5;
  unint64_t v14 = (os_log_t *)MEMORY[0x1E4F1A528];
  if (!v10 || !a4)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v26 = *v14;
    if (!os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
    {
      id v27 = 0;
      goto LABEL_20;
    }
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_1C4CFF000, v26, OS_LOG_TYPE_ERROR, "Couldn't wrap asset key with no record PCS or asset key", buf, 2u);
LABEL_18:
    id v27 = 0;
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
LABEL_20:
    os_log_t v30 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = v30;
      id v39 = objc_msgSend_referenceIdentifierStringFromAssetKey_(self, v38, (uint64_t)v10);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v45 = v39;
      __int16 v46 = 2112;
      id v47 = a4;
      _os_log_error_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_ERROR, "Couldn't wrap asset key with signature %@ with PCS %@", buf, 0x16u);

      if (a6) {
        goto LABEL_22;
      }
    }
    else if (a6)
    {
LABEL_22:
      uint64_t v32 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v33 = *MEMORY[0x1E4F19DD8];
      uint64_t v34 = objc_msgSend_referenceIdentifierStringFromAssetKey_(self, v31, (uint64_t)v10);
      uint64_t v36 = objc_msgSend_errorWithDomain_code_format_(v32, v35, v33, 5003, @"Couldn't wrap asset key with signature %@ with PCS %@", v34, a4);

      id v27 = v36;
      __int16 v28 = 0;
      *a6 = v27;
      goto LABEL_25;
    }
    __int16 v28 = 0;
    goto LABEL_25;
  }
  if (objc_msgSend_containerSupportsEnhancedContext(self, v11, v12)
    && (objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v15, v16),
        id v17 = objc_claimAutoreleasedReturnValue(),
        int v20 = objc_msgSend_useEnhancedPCSEncryptionContext(v17, v18, v19),
        v17,
        v20))
  {
    id v23 = objc_msgSend_assetContextString(v13, v21, v22);
    objc_msgSend_dataUsingEncoding_(v23, v24, 4);

    uint64_t v25 = PCSFPCopyEncryptedData();
  }
  else
  {
    uint64_t v25 = PCSFPCopyWrappedKey();
  }
  __int16 v28 = (void *)v25;
  if (!v25) {
    goto LABEL_18;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  os_log_t v29 = *v14;
  if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v41 = v29;
    uint64_t v43 = objc_msgSend_referenceIdentifierStringFromAssetKey_(self, v42, (uint64_t)v10);
    *(_DWORD *)long long buf = 138412546;
    uint64_t v45 = v43;
    __int16 v46 = 2112;
    id v47 = a4;
    _os_log_debug_impl(&dword_1C4CFF000, v41, OS_LOG_TYPE_DEBUG, "Wrapped asset key with signature %@ with PCS %@", buf, 0x16u);
  }
  id v27 = 0;
LABEL_25:

  return v28;
}

- (id)referenceIdentifierStringFromAssetKey:(id)a3
{
  if (a3)
  {
    unint64_t v3 = objc_msgSend_referenceSignatureFromAssetKey_(CKDMMCS, a2, (uint64_t)a3);
    uint64_t v6 = v3;
    if (v3)
    {
      unint64_t v3 = objc_msgSend_CKLowercaseHexStringWithoutSpaces(v3, v4, v5);
    }
    id v7 = v3;
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (id)unwrapEncryptedData:(id)a3 withPCS:(_OpaquePCSShareProtection *)a4 inContext:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_data(v8, v10, v11);
  if (v12)
  {
    uint64_t v15 = (void *)v12;
    uint64_t v16 = 0;
LABEL_5:

    goto LABEL_6;
  }
  if (objc_msgSend_containerSupportsEnhancedContext(self, v13, v14))
  {
    uint64_t v15 = objc_msgSend_encryptedDataContextString(v9, v17, v18);
    uint64_t v16 = objc_msgSend_unwrapEncryptedData_withPCS_withContextString_(self, v19, (uint64_t)v8, a4, v15);
    goto LABEL_5;
  }
  uint64_t v16 = 0;
LABEL_6:
  int v20 = objc_msgSend_data(v8, v17, v18);

  if (!v20)
  {
    id v23 = objc_msgSend_fieldName(v9, v21, v22);
    uint64_t v25 = objc_msgSend_unwrapEncryptedData_withPCS_withContextString_(self, v24, (uint64_t)v8, a4, v23);

    uint64_t v16 = (void *)v25;
  }
  uint64_t v26 = objc_msgSend_data(v8, v21, v22);

  if (!v26)
  {
    uint64_t v29 = objc_msgSend_unwrapEncryptedData_withPCS_withContextString_(self, v27, (uint64_t)v8, a4, 0);

    uint64_t v16 = (void *)v29;
  }
  uint64_t v30 = objc_msgSend_data(v8, v27, v28);
  if (v30)
  {
    uint64_t v33 = (void *)v30;
  }
  else
  {
    if (objc_msgSend_containerSupportsEnhancedContext(self, v31, v32)) {
      goto LABEL_15;
    }
    uint64_t v33 = objc_msgSend_encryptedDataContextString(v9, v34, v35);
    uint64_t v37 = objc_msgSend_unwrapEncryptedData_withPCS_withContextString_(self, v36, (uint64_t)v8, a4, v33);

    uint64_t v16 = (void *)v37;
  }

LABEL_15:
  uint64_t v38 = objc_msgSend_data(v8, v34, v35);

  if (v38)
  {
    id v39 = 0;
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v40 = (void *)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      uint64_t v42 = v40;
      uint64_t v45 = objc_msgSend_encryptedDataContextString(v9, v43, v44);
      int v46 = 138413058;
      id v47 = v8;
      __int16 v48 = 2112;
      id v49 = v45;
      __int16 v50 = 2112;
      uint64_t v51 = a4;
      __int16 v52 = 2112;
      uint64_t v53 = v16;
      _os_log_error_impl(&dword_1C4CFF000, v42, OS_LOG_TYPE_ERROR, "Failed all decryption attempts for encrypted data %@ in context %@ using PCS %@: %@", (uint8_t *)&v46, 0x2Au);
    }
    id v39 = v16;
  }

  return v39;
}

- (id)_unwrapEncryptedData:(id)a3 usingKeyID:(id)a4 forPCS:(_OpaquePCSShareProtection *)a5 withContextString:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a6;
  objc_msgSend_dataUsingEncoding_(v10, v11, 4);
  uint64_t v14 = objc_msgSend_encryptedData(v8, v12, v13);
  uint64_t v15 = (void *)PCSFPCopyDecryptedData();

  if (v15)
  {

    objc_msgSend_setData_(v8, v16, (uint64_t)v15);
  }

  return 0;
}

- (id)unwrapEncryptedData:(id)a3 withPCS:(_OpaquePCSShareProtection *)a4 withContextString:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v11 = a5;
  if (!a4)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v9, *MEMORY[0x1E4F19DD8], 5003, @"Couldn't unwrap encrypted data in context %@ because %@.", v11, @"we don't have a record PCS");
    id v23 = LABEL_7:;
    goto LABEL_33;
  }
  uint64_t v12 = objc_msgSend_encryptedData(v8, v9, v10);

  if (!v12)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v13, *MEMORY[0x1E4F19DD8], 5003, @"Couldn't unwrap encrypted data in context %@ because %@.", v11, @"there's nothing to decrypt");
    goto LABEL_7;
  }
  uint64_t v14 = (void *)MEMORY[0x1C8789E70]();
  CFTypeRef cf = 0;
  id v17 = objc_msgSend_encryptedData(v8, v15, v16);
  uint64_t v18 = (void *)PCSFPCopyTruncatedKeyIDFromEncryptedData();

  if (v18)
  {
    uint64_t v22 = objc_msgSend__unwrapEncryptedData_usingKeyID_forPCS_withContextString_(self, v19, (uint64_t)v8, v18, a4, v11);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v24 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      id v48 = v8;
      __int16 v49 = 2112;
      CFTypeRef v50 = cf;
      _os_log_error_impl(&dword_1C4CFF000, v24, OS_LOG_TYPE_ERROR, "Failed to get keyID from encrypted data %@. Soldering on and trying all keyIDs. PCS error: %@", buf, 0x16u);
    }
    uint64_t v22 = 0;
  }
  uint64_t v25 = objc_msgSend_data(v8, v20, v21);

  if (!v25 || v22)
  {

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v26 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412802;
      id v48 = v11;
      __int16 v49 = 2112;
      CFTypeRef v50 = v18;
      __int16 v51 = 2112;
      __int16 v52 = a4;
      _os_log_debug_impl(&dword_1C4CFF000, v26, OS_LOG_TYPE_DEBUG, "Couldn't unwrap encrypted data in context %@ using keyID %@ with record PCS %@. Trying all keyIDs.", buf, 0x20u);
    }
    id v39 = v18;
    uint64_t v40 = v14;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v27 = (id)PCSFPCopyAvailableMasterKeyIDs();
    uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v41, v46, 16);
    if (v29)
    {
      uint64_t v31 = v29;
      id v23 = 0;
      uint64_t v32 = *(void *)v42;
LABEL_22:
      uint64_t v33 = 0;
      uint64_t v34 = v23;
      while (1)
      {
        if (*(void *)v42 != v32) {
          objc_enumerationMutation(v27);
        }
        id v23 = objc_msgSend__unwrapEncryptedData_usingKeyID_forPCS_withContextString_(self, v30, (uint64_t)v8, *(void *)(*((void *)&v41 + 1) + 8 * v33), a4, v11);

        uint64_t v37 = objc_msgSend_data(v8, v35, v36);

        if (v37)
        {
          if (!v23) {
            break;
          }
        }
        ++v33;
        uint64_t v34 = v23;
        if (v31 == v33)
        {
          uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v30, (uint64_t)&v41, v46, 16);
          if (v31) {
            goto LABEL_22;
          }
          break;
        }
      }
    }
    else
    {
      id v23 = 0;
    }

    uint64_t v18 = v39;
    uint64_t v14 = v40;
  }
  else
  {
    id v23 = 0;
  }

LABEL_33:

  return v23;
}

- (id)wrapEncryptedData:(id)a3 withPCS:(_OpaquePCSShareProtection *)a4 inContext:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  if (objc_msgSend_containerSupportsEnhancedContext(self, v10, v11)
    && (objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v12, v13),
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        int v17 = objc_msgSend_useEnhancedPCSEncryptionContext(v14, v15, v16),
        v14,
        v17))
  {
    uint64_t v18 = objc_msgSend_encryptedDataContextString(v8, v12, v13);
  }
  else
  {
    uint64_t v18 = objc_msgSend_fieldName(v8, v12, v13);
  }
  int v20 = (void *)v18;
  uint64_t v21 = objc_msgSend_wrapEncryptedData_withPCS_withContextString_(self, v19, (uint64_t)v9, a4, v18);

  return v21;
}

- (id)wrapEncryptedData:(id)a3 withPCS:(_OpaquePCSShareProtection *)a4 withContextString:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v10 = a5;
  if (!a4)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v8, *MEMORY[0x1E4F19DD8], 5003, @"Couldn't wrap encrypted data in context %@ because %@.", v10, @"there's nothing to encrypt");
    int v17 = LABEL_6:;
    goto LABEL_12;
  }
  uint64_t v11 = objc_msgSend_data(v7, v8, v9);

  if (!v11)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v12, *MEMORY[0x1E4F19DD8], 5003, @"Couldn't wrap encrypted data in context %@ because %@.", v10, @"we don't have a record PCS");
    goto LABEL_6;
  }
  objc_msgSend_dataUsingEncoding_(v10, v12, 4);
  uint64_t v15 = objc_msgSend_data(v7, v13, v14);
  uint64_t v16 = (void *)PCSFPCopyEncryptedData();

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v18 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412802;
    id v22 = v10;
    __int16 v23 = 2112;
    uint64_t v24 = a4;
    __int16 v25 = 2112;
    uint64_t v26 = v16;
    _os_log_debug_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_DEBUG, "Wrapped encrypted data in context %@ with record PCS %@: %@", buf, 0x20u);
  }
  objc_msgSend_setEncryptedData_(v7, v19, (uint64_t)v16);
  int v17 = 0;

LABEL_12:
  return v17;
}

- (void)_lockedGlobalPerUserBoundaryKeyDataWithCompletionHandler:(id)a3
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v7 = objc_msgSend_synchronizeQueue(self, v5, v6);
  dispatch_assert_queue_V2(v7);

  if (v4)
  {
    id v10 = objc_msgSend_containerID(self, v8, v9);
    unint64_t v13 = objc_msgSend_specialContainerType(v10, v11, v12);

    if (v13 <= 0x18 && ((1 << v13) & 0x1840004) != 0)
    {
      int v16 = 0;
    }
    else
    {
      id v10 = objc_msgSend_containerID(self, v14, v15);
      int v16 = objc_msgSend_isTestContainer(v10, v23, v24) ^ 1;
    }
    if (v13 <= 0x18 && ((1 << v13) & 0x1840004) != 0)
    {
      if (v16)
      {
LABEL_8:
        int v17 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v14, *MEMORY[0x1E4F19DD8], 1017, @"Container not permitted to use global per-user boundary key for MMCSv2 uploads.");
        int v20 = objc_msgSend_callbackQueue(self, v18, v19);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_1C4DE557C;
        block[3] = &unk_1E64F0790;
        id v48 = v17;
        id v49 = v4;
        id v21 = v17;
        dispatch_async(v20, block);

        id v22 = v49;
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {

      if (v16) {
        goto LABEL_8;
      }
    }
    uint64_t v25 = objc_msgSend_boundaryKeyData(self, v14, v15);
    if (v25)
    {
      uint64_t v28 = (void *)v25;
      uint64_t v29 = objc_msgSend_callbackQueue(self, v26, v27);
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = sub_1C4DE5594;
      v44[3] = &unk_1E64F0790;
      id v46 = v4;
      id v21 = v28;
      id v45 = v21;
      dispatch_async(v29, v44);

      id v22 = v46;
    }
    else
    {
      uint64_t v30 = objc_msgSend_account(self, v26, v27);
      id v22 = objc_msgSend_dsid(v30, v31, v32);

      if (v22)
      {
        uint64_t v50 = *MEMORY[0x1E4F94018];
        v51[0] = v22;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v33, (uint64_t)v51, &v50, 1);
        id v34 = (id)objc_claimAutoreleasedReturnValue();
        id v40 = v4;
        PCSGetBoundaryKey();
        uint64_t v35 = v40;
      }
      else
      {
        uint64_t v36 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v33, *MEMORY[0x1E4F19DD8], 5000, @"No account DSID, so we can't fetch a boundary key");
        id v39 = objc_msgSend_callbackQueue(self, v37, v38);
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = sub_1C4DE55AC;
        v41[3] = &unk_1E64F0790;
        id v42 = v36;
        id v43 = v4;
        id v34 = v36;
        dispatch_async(v39, v41);

        uint64_t v35 = v43;
      }

      id v21 = 0;
    }
    goto LABEL_17;
  }
LABEL_18:
}

- (void)globalPerUserBoundaryKeyDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_synchronizeQueue(self, v5, v6);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C4DE5898;
  v9[3] = &unk_1E64F0E18;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

- (BOOL)serviceTypeIsManatee:(unint64_t)a3
{
  uint64_t v5 = objc_msgSend_identityManager(self, a2, a3);
  id v7 = objc_msgSend_PCSServiceStringFromCKServiceType_(v5, v6, a3);

  if (a3) {
    char IsManatee = PCSServiceItemTypeIsManatee();
  }
  else {
    char IsManatee = objc_msgSend_currentServiceIsManatee(self, v8, v9);
  }
  BOOL v11 = IsManatee;

  return v11;
}

- (void)synchronizeUserKeyRegistryForSigningIdentitiesForRequestorOperationID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_forceEnableReadOnlyManatee(self, v8, v9))
  {
    uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4DE5E18;
    block[3] = &unk_1E64F0A80;
    id v68 = v7;
    unint64_t v13 = v7;
    dispatch_async(v12, block);
  }
  else
  {
    unint64_t v13 = dispatch_group_create();
    v65[0] = 0;
    v65[1] = v65;
    v65[2] = 0x2020000000;
    char v66 = 1;
    v63[0] = 0;
    v63[1] = v63;
    v63[2] = 0x3032000000;
    v63[3] = sub_1C4DC743C;
    v63[4] = sub_1C4DC744C;
    id v64 = 0;
    v61[0] = 0;
    v61[1] = v61;
    v61[2] = 0x2020000000;
    char v62 = 1;
    v59[0] = 0;
    v59[1] = v59;
    v59[2] = 0x3032000000;
    void v59[3] = sub_1C4DC743C;
    v59[4] = sub_1C4DC744C;
    id v60 = 0;
    int v16 = objc_msgSend_deviceContext(self, v14, v15);
    uint64_t v19 = objc_msgSend_accountDataSecurityObserver(v16, v17, v18);
    id v22 = objc_msgSend_account(self, v20, v21);
    char isSecondaryAccount_error = objc_msgSend_isManateeAvailableForAccount_isSecondaryAccount_error_(v19, v23, (uint64_t)v22, 0, 0);

    uint64_t v28 = objc_msgSend_identityManager(self, v25, v26);
    if (isSecondaryAccount_error)
    {
      uint64_t v29 = objc_msgSend_PCSServiceStringFromCKServiceType_(v28, v27, 5);

      dispatch_group_enter(v13);
      uint64_t v32 = objc_msgSend_sharedManager(CKDPCSKeySyncManager, v30, v31);
      responsibleBundleID = self->_responsibleBundleID;
      uint64_t v36 = objc_msgSend_account(self, v34, v35);
      uint64_t v37 = v57;
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = sub_1C4DE5F7C;
      v57[3] = &unk_1E64F3030;
      v57[6] = v61;
      id v38 = v29;
      v57[4] = v38;
      void v57[7] = v59;
      v57[5] = v13;
      objc_msgSend_syncUserKeysForService_context_bundleID_serviceIsManatee_account_shouldThrottle_testOverrideProvider_requestorOperationID_completionHandler_(v32, v39, (uint64_t)v38, 0x1F20587B0, responsibleBundleID, 1, v36, 1, self, v6, v57);
    }
    else
    {
      id v40 = objc_msgSend_PCSServiceStringFromCKServiceType_(v28, v27, 6);

      dispatch_group_enter(v13);
      uint64_t v32 = objc_msgSend_sharedManager(CKDPCSKeySyncManager, v41, v42);
      id v43 = self->_responsibleBundleID;
      uint64_t v36 = objc_msgSend_account(self, v44, v45);
      uint64_t v37 = v58;
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = sub_1C4DE5E38;
      v58[3] = &unk_1E64F3030;
      v58[6] = v65;
      id v38 = v40;
      v58[4] = v38;
      v58[7] = v63;
      v58[5] = v13;
      objc_msgSend_syncUserKeysForService_context_bundleID_serviceIsManatee_account_shouldThrottle_testOverrideProvider_requestorOperationID_completionHandler_(v32, v46, (uint64_t)v38, 0x1F20587B0, v43, 0, v36, 1, self, v6, v58);
    }

    id v49 = objc_msgSend_callbackQueue(self, v47, v48);
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    void v51[2] = sub_1C4DE60C0;
    v51[3] = &unk_1E64F3058;
    id v52 = v7;
    uint64_t v53 = v65;
    uint64_t v54 = v61;
    id v55 = v59;
    uint64_t v56 = v63;
    id v50 = v7;
    dispatch_group_notify(v13, v49, v51);

    _Block_object_dispose(v59, 8);
    _Block_object_dispose(v61, 8);
    _Block_object_dispose(v63, 8);

    _Block_object_dispose(v65, 8);
  }
}

- (void)synchronizeUserKeyRegistryForServiceType:(unint64_t)a3 shouldThrottle:(BOOL)a4 context:(id)a5 requestorOperationID:(id)a6 completionHandler:(id)a7
{
  BOOL v9 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (objc_msgSend_forceEnableReadOnlyManatee(self, v15, v16))
  {
    uint64_t v19 = objc_msgSend_callbackQueue(self, v17, v18);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4DE6310;
    block[3] = &unk_1E64F0A80;
    id v37 = v14;
    id v20 = v14;
    dispatch_async(v19, block);

    id v21 = v37;
  }
  else
  {
    id v22 = objc_msgSend_identityManager(self, v17, v18);
    objc_msgSend_PCSServiceStringFromCKServiceType_(v22, v23, a3);
    id v20 = (id)objc_claimAutoreleasedReturnValue();

    unsigned int IsManatee = objc_msgSend_serviceTypeIsManatee_(self, v24, a3);
    uint64_t v27 = objc_msgSend_sharedManager(CKDPCSKeySyncManager, v25, v26);
    responsibleBundleID = self->_responsibleBundleID;
    uint64_t v31 = objc_msgSend_account(self, v29, v30);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = sub_1C4DE6334;
    v34[3] = &unk_1E64F30A8;
    uint8_t v34[4] = self;
    id v35 = v14;
    id v21 = v14;
    objc_msgSend_syncUserKeysForService_context_bundleID_serviceIsManatee_account_shouldThrottle_testOverrideProvider_requestorOperationID_completionHandler_(v27, v32, (uint64_t)v20, v12, responsibleBundleID, IsManatee, v31, v9, self, v13, v34);
  }
}

- (void)sendCoreAnalyticsEventForKeySync:(id)a3
{
  v95[9] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v6 = objc_msgSend_serviceName(v3, v4, v5);
  if (!v6) {
    goto LABEL_22;
  }
  BOOL v9 = (void *)v6;
  uint64_t v10 = objc_msgSend_shouldThrottle(v3, v7, v8);
  if (!v10)
  {
LABEL_21:

    goto LABEL_22;
  }
  id v13 = (void *)v10;
  uint64_t v14 = objc_msgSend_isManatee(v3, v11, v12);
  if (!v14)
  {
LABEL_20:

    goto LABEL_21;
  }
  int v17 = (void *)v14;
  uint64_t v18 = objc_msgSend_keySyncResult(v3, v15, v16);
  if (!v18)
  {
LABEL_19:

    goto LABEL_20;
  }
  id v21 = (void *)v18;
  uint64_t v22 = objc_msgSend_overallResult(v3, v19, v20);
  if (!v22)
  {
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v25 = (void *)v22;
  uint64_t v26 = objc_msgSend_keySyncDurationSec(v3, v23, v24);
  if (!v26)
  {
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v29 = (void *)v26;
  uint64_t v30 = objc_msgSend_throttledDurationSec(v3, v27, v28);
  if (!v30)
  {
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v33 = (void *)v30;
  uint64_t v34 = objc_msgSend_context(v3, v31, v32);
  if (!v34)
  {

    goto LABEL_16;
  }
  id v37 = (void *)v34;
  id v38 = objc_msgSend_bundleID(v3, v35, v36);

  if (v38)
  {
    v94[0] = 0x1F204DAD0;
    uint64_t v93 = objc_msgSend_serviceName(v3, v39, v40);
    v95[0] = v93;
    v94[1] = 0x1F2058690;
    id v92 = objc_msgSend_shouldThrottle(v3, v41, v42);
    v95[1] = v92;
    v94[2] = 0x1F20586B0;
    uint64_t v45 = objc_msgSend_isManatee(v3, v43, v44);
    v95[2] = v45;
    id v94[3] = 0x1F20586D0;
    uint64_t v48 = objc_msgSend_keySyncResult(v3, v46, v47);
    v95[3] = v48;
    v94[4] = 0x1F20586F0;
    __int16 v51 = objc_msgSend_overallResult(v3, v49, v50);
    v95[4] = v51;
    v94[5] = 0x1F2058710;
    uint64_t v54 = objc_msgSend_keySyncDurationSec(v3, v52, v53);
    v95[5] = v54;
    v94[6] = 0x1F2058730;
    unint64_t v57 = objc_msgSend_throttledDurationSec(v3, v55, v56);
    v95[6] = v57;
    v94[7] = 0x1F2058750;
    id v60 = objc_msgSend_context(v3, v58, v59);
    v95[7] = v60;
    v94[8] = 0x1F2052610;
    long long v63 = objc_msgSend_bundleID(v3, v61, v62);
    v95[8] = v63;
    long long v65 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v64, (uint64_t)v95, v94, 9);
    BOOL v9 = objc_msgSend_mutableCopy(v65, v66, v67);

    uint64_t v70 = objc_msgSend_error(v3, v68, v69);

    if (v70)
    {
      uint64_t v73 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v74 = objc_msgSend_error(v3, v71, v72);
      uint64_t v77 = objc_msgSend_code(v74, v75, v76);
      uint64_t v79 = objc_msgSend_numberWithInteger_(v73, v78, v77);
      objc_msgSend_setObject_forKeyedSubscript_(v9, v80, (uint64_t)v79, 0x1F2058430);

      uint64_t v83 = objc_msgSend_error(v3, v81, v82);
      uint64_t v84 = CKErrorChainStringFromError();
      objc_msgSend_setObject_forKeyedSubscript_(v9, v85, (uint64_t)v84, 0x1F2058450);
    }
    uint64_t v86 = objc_msgSend_KRSReturnedExistingIdentity(v3, v71, v72);

    if (v86)
    {
      id v89 = objc_msgSend_KRSReturnedExistingIdentity(v3, v87, v88);
      objc_msgSend_setObject_forKeyedSubscript_(v9, v90, (uint64_t)v89, 0x1F20587D0);
    }
    id v91 = objc_msgSend_copy(v9, v87, v88);
    AnalyticsSendEvent();

    goto LABEL_21;
  }
LABEL_22:
}

- (void)_onSynchronizeQueue:(id)a3
{
  if (dispatch_get_specific("com.apple.cloudkit.pcsmanager.queue"))
  {
    uint64_t v5 = (void (*)(void))*((void *)a3 + 2);
    BOOL v9 = a3;
    v5();
  }
  else
  {
    id v6 = a3;
    BOOL v9 = objc_msgSend_synchronizeQueue(self, v7, v8);
    dispatch_sync(v9, v6);
  }
}

+ (id)etagFromPCSData:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  LODWORD(v17) = 0;
  id v3 = a3;
  id v6 = (const void *)objc_msgSend_bytes(v3, v4, v5, 0, 0, v17, v18);
  CC_LONG v9 = objc_msgSend_length(v3, v7, v8);

  CC_SHA1(v6, v9, (unsigned __int8 *)&v16);
  uint64_t v11 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v10, (uint64_t)&v16, 20);
  uint64_t v14 = objc_msgSend_CKUppercaseHexStringWithoutSpaces(v11, v12, v13);

  return v14;
}

+ (id)protectionIdentifierFromShareProtection:(_OpaquePCSShareProtection *)a3
{
  if (a3)
  {
    id v4 = (void *)PCSFPGetCurrentMasterKeyID();
    id v6 = objc_msgSend_subdataWithRange_(v4, v5, 0, 4);
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

+ (id)allProtectionIdentifiersFromShareProtection:(_OpaquePCSShareProtection *)a3
{
  if (a3)
  {
    uint64_t v3 = (void *)PCSFPCopyAvailableMasterKeyIDs();
    uint64_t v5 = objc_msgSend_CKMap_(v3, v4, (uint64_t)&unk_1F2043150);
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (BOOL)_isKeyRollingUnitTestContainerID:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!*MEMORY[0x1E4F1A4E0])
  {
    uint64_t v16 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, self, @"CKDPCSManager.m", 5258, @"Only suitable for testing");
  }
  if (qword_1EBBCFBE8 != -1) {
    dispatch_once(&qword_1EBBCFBE8, &unk_1F2043170);
  }
  uint64_t v8 = objc_msgSend_containerIdentifier(v7, v5, v6);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = (id)qword_1EBBCFBE0;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v18, v22, 16);
  if (v12)
  {
    uint64_t v13 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v9);
        }
        if (objc_msgSend_hasPrefix_(v8, v11, *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18))
        {
          LOBYTE(v12) = 1;
          goto LABEL_15;
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v18, v22, 16);
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v12;
}

+ (id)pcsOverrideKeys
{
  if (!*MEMORY[0x1E4F1A4E0])
  {
    id v7 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, a1, @"CKDPCSManager.m", 5281, @"Only suitable for testing");
  }
  if (qword_1EBBCFBF8 != -1) {
    dispatch_once(&qword_1EBBCFBF8, &unk_1F2043190);
  }
  uint64_t v3 = (void *)qword_1EBBCFBF0;
  return v3;
}

- (void)addEntriesForUnitTestOverrides:(id)a3
{
  id v7 = a3;
  if (!*MEMORY[0x1E4F1A4E0])
  {
    uint64_t v10 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, self, @"CKDPCSManager.m", 5324, @"Only suitable for testing");
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1C4DE6FDC;
  v12[3] = &unk_1E64F0948;
  v12[4] = self;
  id v13 = v7;
  id v8 = v7;
  objc_msgSend__onSynchronizeQueue_(self, v9, (uint64_t)v12);
}

- (BOOL)_checkAndClearPCSTestOverrideForKey:(id)a3
{
  id v7 = a3;
  if (!*MEMORY[0x1E4F1A4E0])
  {
    uint64_t v12 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, self, @"CKDPCSManager.m", 5343, @"Only suitable for testing");
  }
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1C4DE7344;
  v14[3] = &unk_1E64F30F0;
  uint64_t v16 = &v17;
  v14[4] = self;
  id v8 = v7;
  id v15 = v8;
  objc_msgSend__onSynchronizeQueue_(self, v9, (uint64_t)v14);
  char v10 = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (BOOL)_checkPCSTestOverrideForKey:(id)a3
{
  id v7 = a3;
  if (!*MEMORY[0x1E4F1A4E0])
  {
    uint64_t v12 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, self, @"CKDPCSManager.m", 5353, @"Only suitable for testing");
  }
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1C4DE751C;
  v14[3] = &unk_1E64F30F0;
  uint64_t v16 = &v17;
  v14[4] = self;
  id v8 = v7;
  id v15 = v8;
  objc_msgSend__onSynchronizeQueue_(self, v9, (uint64_t)v14);
  char v10 = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (id)_pcsTestOverrideForKey:(id)a3
{
  id v7 = a3;
  if (!*MEMORY[0x1E4F1A4E0])
  {
    uint64_t v12 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, self, @"CKDPCSManager.m", 5362, @"Only suitable for testing");
  }
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  char v20 = sub_1C4DC743C;
  long long v21 = sub_1C4DC744C;
  id v22 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1C4DE7710;
  v14[3] = &unk_1E64F30F0;
  uint64_t v16 = &v17;
  v14[4] = self;
  id v8 = v7;
  id v15 = v8;
  objc_msgSend__onSynchronizeQueue_(self, v9, (uint64_t)v14);
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (void)dealloc
{
  id v4 = objc_msgSend_sharedNotifier(CKDPCSNotifier, a2, v2);
  id v7 = objc_msgSend_uuid(self, v5, v6);
  objc_msgSend_clearContextIfUnnecessaryForManagerUUID_(v4, v8, (uint64_t)v7);

  v9.receiver = self;
  v9.super_class = (Class)CKDPCSManager;
  [(CKDPCSManager *)&v9 dealloc];
}

- (CKDLogicalDeviceContext)deviceContext
{
  return self->_deviceContext;
}

- (CKDAccount)account
{
  return (CKDAccount *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAccount:(id)a3
{
}

- (NSMutableSet)undecryptablePCSDataHashes
{
  return self->_undecryptablePCSDataHashes;
}

- (void)setUndecryptablePCSDataHashes:(id)a3
{
}

- (NSData)boundaryKeyData
{
  return self->_boundaryKeyData;
}

- (void)setBoundaryKeyData:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void)setLastMissingManateeIdentityErrorDateForCurrentService:(id)a3
{
}

- (CKDContainerScopedUserIDProvider)containerScopedUserIDProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerScopedUserIDProvider);
  return (CKDContainerScopedUserIDProvider *)WeakRetained;
}

- (CKContainerID)containerID
{
  return self->_containerID;
}

- (NSString)responsibleBundleID
{
  return self->_responsibleBundleID;
}

- (BOOL)forceEnableReadOnlyManatee
{
  return self->_forceEnableReadOnlyManatee;
}

- (unint64_t)mmcsEncryptionSupport
{
  return self->_mmcsEncryptionSupport;
}

- (BOOL)useZoneWidePCS
{
  return self->_useZoneWidePCS;
}

- (OS_dispatch_queue)synchronizeQueue
{
  return self->_synchronizeQueue;
}

- (void)setSynchronizeQueue:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (NSMutableDictionary)pcsTestOverrides
{
  return self->_pcsTestOverrides;
}

- (void)setPcsTestOverrides:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pcsTestOverrides, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_synchronizeQueue, 0);
  objc_storeStrong((id *)&self->_responsibleBundleID, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_destroyWeak((id *)&self->_containerScopedUserIDProvider);
  objc_storeStrong((id *)&self->_lastMissingManateeIdentityErrorDateForCurrentService, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_boundaryKeyData, 0);
  objc_storeStrong((id *)&self->_undecryptablePCSDataHashes, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_identityManager, 0);
  objc_storeStrong((id *)&self->_deviceContext, 0);
}

@end